#!/usr/bin/env python3
import re
from pathlib import Path

GATE_V = Path("sar_fsm_gate.v")
CELL_SPICE = Path("/home/ttuser/pdk/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice")
OUT_SPICE = Path("sar_fsm_wrapper_fixed.spice")

SUBCKT_NAME = "sar_fsm_wrapper"

TOP_PORTS = (
    ["VDD", "VSS", "clk", "rst_n", "start", "comp",
     "sample", "comp_clk", "busy", "valid"]
    + [f"bp{i}" for i in range(9, -1, -1)]
    + [f"bn{i}" for i in range(9, -1, -1)]
    + [f"code{i}" for i in range(9, -1, -1)]
)

def load_spice_pin_order(path):
    pin_order = {}
    for line in path.read_text().splitlines():
        s = line.strip()
        if not s.upper().startswith(".SUBCKT "):
            continue
        toks = s.split()
        if len(toks) >= 3:
            cell = toks[1]
            pins = toks[2:]
            pin_order[cell] = pins
    return pin_order

def spice_net(verilog_net):
    s = verilog_net.strip()

    # constants
    if re.fullmatch(r"1'?b?0|1'h0|1'd0", s, re.IGNORECASE):
        return "VSS"
    if re.fullmatch(r"1'?b?1|1'h1|1'd1", s, re.IGNORECASE):
        return "VDD"

    # remove simple escaped-name marker if present
    if s.startswith("\\"):
        s = s[1:]

    # output bus aliases: bp[9] -> bp9, bn[9] -> bn9, code[9] -> code9
    m = re.fullmatch(r"(bp|bn|code)\[(\d+)\]", s)
    if m:
        return f"{m.group(1)}{m.group(2)}"

    # internal bus nets: count[0] -> count.0, _005_[3] -> _005_.3
    s = s.replace("[", ".").replace("]", "")

    # remove characters that can confuse SPICE
    s = s.replace("$", "_")
    s = s.replace("\\", "_")
    return s

def find_gate_module(verilog_text):
    # Pick module containing the standard-cell instances.
    modules = re.findall(
        r"module\s+(.+?)\s*\((.*?)\);\s*(.*?)endmodule",
        verilog_text,
        flags=re.S
    )
    if not modules:
        raise RuntimeError("No Verilog modules found.")

    best = None
    best_count = -1
    for name, ports, body in modules:
        count = body.count("gf180mcu_fd_sc_mcu7t5v0__")
        if count > best_count:
            best = (name, ports, body)
            best_count = count

    if best_count <= 0:
        raise RuntimeError("No GF180 standard-cell instances found in sar_fsm_gate.v.")

    return best

def append_subckt_header(lines, name, ports, ports_per_line=8):
    """
    Emit ngspice-compatible subckt header.

    Correct format:
      .subckt sar_fsm_wrapper VDD VSS clk ...
      + sample comp_clk ...
      + bp9 bp8 ...

    No backslash and no trailing '+' tokens.
    """
    chunks = [ports[i:i + ports_per_line] for i in range(0, len(ports), ports_per_line)]

    lines.append(f".subckt {name} " + " ".join(chunks[0]))

    for chunk in chunks[1:]:
        lines.append("+ " + " ".join(chunk))

def main():
    pin_order = load_spice_pin_order(CELL_SPICE)
    text = GATE_V.read_text()

    mod_name, _, body = find_gate_module(text)

    inst_re = re.compile(
        r"(gf180mcu_fd_sc_mcu7t5v0__\w+)\s+([A-Za-z0-9_$\\\.]+)\s*\((.*?)\);",
        flags=re.S,
    )

    pin_conn_re = re.compile(r"\.(\w+)\s*\(\s*([^)]+?)\s*\)", flags=re.S)

    lines = []
    lines.append("* Corrected GF180 standard-cell SPICE from Yosys gate-level Verilog")
    lines.append("* VNW is tied to VDD, VPW is tied to VSS")
    lines.append("")

    # Corrected .subckt header
    append_subckt_header(lines, SUBCKT_NAME, TOP_PORTS, ports_per_line=8)

    lines.append("")

    ninst = 0
    for cell, inst, conns_blob in inst_re.findall(body):
        if cell not in pin_order:
            raise RuntimeError(f"Cell {cell} not found in SPICE library.")

        conns = {pin: spice_net(net) for pin, net in pin_conn_re.findall(conns_blob)}

        nodes = []
        for pin in pin_order[cell]:
            u = pin.upper()

            if u in ("VDD", "VNW", "VPWR", "VPB", "VPWR1"):
                nodes.append("VDD")
            elif u in ("VSS", "VPW", "VGND", "VNB", "VGND1"):
                nodes.append("VSS")
            elif pin in conns:
                nodes.append(conns[pin])
            else:
                raise RuntimeError(
                    f"Missing connection for pin {pin} of {cell} instance {inst}"
                )

        safe_inst = inst.replace("$", "_").replace("\\", "_")
        lines.append("X{} {} {}".format(safe_inst, " ".join(nodes), cell))
        ninst += 1

    lines.append("")
    lines.append(f".ends {SUBCKT_NAME}")
    lines.append("")

    OUT_SPICE.write_text("\n".join(lines))
    print(f"Wrote {OUT_SPICE} with {ninst} GF180 cell instances.")
    print(f"Source module was: {mod_name}")

if __name__ == "__main__":
    main()