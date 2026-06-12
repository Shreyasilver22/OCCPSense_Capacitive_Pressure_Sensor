# OCCPSense —  Capacitive Pressure Sensor

> **Low-Power Mixed-Signal Readout Chain for Capacitive Sensor Interface**  
> An ultra-low-power, self-calibrating **Capacitance-to-Digital Converter (CDC) Readout IC** targeting the **2026 SSCS Open-Source Chipathon (Track B)**  
> Fabricated using the **GDF180 (180nm CMOS)** open-source process node.

---

## Table of Contents

1. [Project Overview](#1-project-overview)
2. [System Architecture & Signal Flow](#2-system-architecture--signal-flow)
3. [Block Diagram](#3-block-diagram)
4. [Signal Processing Pipeline](#4-signal-processing-pipeline)
5. [Chip Specification Matrix](#5-chip-specification-matrix)
6. [Pin Mapping](#6-pin-mapping)
7. [PDK Characterization](#7-pdk-characterization)
8. [Design Methodology](#8-design-methodology)
9. [Implementation Roadmap](#9-implementation-roadmap)
10. [Verification Plan](#10-verification-plan)
11. [Repository Structure](#11-repository-structure)

---

## 1. Project Overview

**OCCPSense** ( Capacitive Pressure Sensor) is a fully integrated mixed-signal ASIC designed to interface with an **external differential MEMS capacitive pressure sensor**. The architecture implements a low-noise analog front-end coupled with a **charge-redistribution Successive Approximation Register (SAR) ADC**, making it suitable for ultra-low-power biomedical and cardiac pressure monitoring applications.

The design is built around:
- **Switched-capacitor front-end** with Correlated Double Sampling (CDS) for noise rejection
- **Two-stage Miller-compensated OTA** for high-swing amplification
- **Charge-redistribution CDAC-based SAR ADC** (8-bit baseline → 10-bit target)
- **On-chip digital calibration** for structural mismatch correction
- **SPI serial interface** for digital telemetry

> **Process Node:** GDF180 (180nm CMOS) — Open-Source PDK Track  
> **Competition:** 2026 IEEE SSCS Open-Source Chipathon, Track B

---

## 2. System Architecture & Signal Flow

The ASIC accepts differential capacitive inputs from an external MEMS bridge sensor and converts the physical pressure-induced capacitance change into a calibrated digital code, streamed out over SPI.

### High-Level Signal Flow

```
External MEMS Sensor
  [C_P, C_N : 5pF – 10pF differential bridge]
         │
         ▼
┌──────────────────────────┐
│  C-to-V Sensing Network  │  ← Correlated Double Sampling (CDS)
│  Capacitive Bridge Front │     Parameters: V_cm, V_dd, C_feedback
└──────────┬───────────────┘
           │  Differential Voltage Signal
           ▼
┌──────────────────────────┐
│  Two-Stage Miller OTA    │  ← gm ~ 50–100 µS, L ≥ 400nm
│  Differential Amplifier  │     Min output swing: 2.7V @ 3.3V supply
└──────────┬───────────────┘
           │  Amplified Differential Output
           ▼
┌──────────────────────────┐
│  Charge-Redistribution   │  ← 8-bit initial / 10-bit target
│  SAR ADC Core + CDAC     │     SAR FSM controls conversion
└──────────┬───────────────┘
           │  Raw Digital Code
           ▼
┌──────────────────────────┐
│  Digital Calibration     │  ← Offset & mismatch correction vectors
│  & SPI Readout Block     │     Standard 4-wire SPI output
└──────────┬───────────────┘
           │
           ▼
    [ SPI Stream Out ]
    SCK / CS_N / MOSI / MISO
```

---

## 3. Block Diagram

```
+-------------------------------------------------------------------------------------------+
|                                      ASIC BOUNDARY                                        |
|                                                                                           |
|  IN_P ──►  +------------------+      +------------------+      +------------------+      |
|            |  C-to-V Bridge   |      | Two-Stage Miller |      |  Charge-Redist.  |      |
|  IN_N ──►  |  Sensing Network +─────►|    OTA (Miller   +─────►|  SAR ADC Core    |      |
|            |  (5pF – 10pF)    |      |   Compensated)   |      |  (8-bit / 10-bit)|      |
|            +--------+---------+      +--------+---------+      +--------+---------+      |
|                     ▲                         ▲                         │                 |
|                     │ Analog Feedback          │ Bias Voltages           │ Raw Code        |
|                     │                          │                         ▼                 |
|            +--------+---------+               │                +--------+---------+      |
|            |  Capacitive DAC  |      +--------+---------+      |  Digital Core    |      |
|            |  Fine-Tuning Bank|◄─────+  Bandgap & Bias  |      |  Calibration +   |      |
|            |  (Trim Arrays)   |      |  Generation      |      |  SPI Interface   |      |
|            +------------------+      +------------------+      +--------+---------+      |
|                                                                          │                 |
|                                                          VDDA ──► Analog │                |
|                                                          VDDD ──► Digital│                |
|                                                          VREF ──► CDAC   │                |
+--------------------------------------------------------------------------│-----------------+
                                                                           ▼
                                                                  [ SPI Stream Out ]
                                                              SCK / MISO / MOSI / CS_N
```

---

## 4. Signal Processing Pipeline

| Step | Stage | Description |
|------|-------|-------------|
| **1** | **Physical Deflection** | Pressure shifts relative capacitance of the differential MEMS bridge. Target domain: **5 pF – 10 pF**. |
| **2** | **C-to-V Conversion** | Switched-capacitor front-end with CDS transforms capacitive deviations into a differential voltage. Key parameters: Vcm, Vdd, C_feedback. |
| **3** | **Amplification** | Two-stage Miller-compensated OTA amplifies the differential voltage. Minimum output swing: **≥ 2.7V** on a **3.3V supply**. gm ≈ 50–100 µS. |
| **4** | **Digitization** | Charge-redistribution SAR ADC captures the analog output. Initial target: **8-bit** for behavioral validation, scaling to **10-bit** for final silicon. |
| **5** | **Calibration** | Digital blocks track baseline mismatch, apply correction vectors, and stream calibrated frames over SPI. |

---

## 5. Chip Specification Matrix

| Parameter | Target Specification | Notes |
|:----------|:--------------------|:------|
| **Process Technology** | GDF180 (180nm CMOS) | Open-Source PDK — Chipathon Track B |
| **Analog Supply Voltage (Vdd)** | 3.3 V | Headroom for high-swing OTA |
| **Digital Core Supply** | 0.5 V | Ultra-low-voltage near-threshold operation |
| **Sensor Capacitance Range (C0)** | 5 pF – 10 pF | External differential MEMS bridge |
| **OTA Topology** | Two-Stage Miller Compensated | Classic dominant-pole compensation |
| **OTA Output Swing** | ≥ 2.7 V | Minimum differential swing at 3.3V supply |
| **OTA Transconductance (gm)** | ~50 – 100 µS | Sized via gm/Id characterization in xchem |
| **Min Channel Length** | L ≥ 400 nm | Avoids short-channel effects (SCE) |
| **Initial ADC Resolution** | 8-bit | Baseline FSM/routing verification target |
| **Final ADC Resolution** | 10-bit | Production resolution goal |
| **Total Channel Power Budget** | < 10 µW | Gated clocks + weak inversion biasing |
| **Digital Output Interface** | 4-wire SPI | SCK, CS_N, MOSI, MISO |
| **Self-Test** | BIST_EN pin | Built-in self-test trigger |

---

## 6. Pin Mapping

| Pin | Type | Description |
|-----|------|-------------|
| **VDDA** | Power | Clean 3.3V analog supply — noise-sensitive blocks |
| **GNDA** | Power | Analog ground reference |
| **VDDD** | Power | 0.5V digital supply — switching cells |
| **GNDD** | Power | Digital ground reference |
| **VREF** | Input | High-stability reference voltage for CDAC array |
| **IN_P** | Analog In | Positive differential input from external MEMS sensor |
| **IN_N** | Analog In | Negative differential input from external MEMS sensor |
| **SCK** | Digital I/O | SPI clock |
| **CS_N** | Digital In | SPI chip-select (active low) |
| **MOSI** | Digital In | SPI master-out slave-in |
| **MISO** | Digital Out | SPI master-in slave-out (ADC data stream) |
| **BIST_EN** | Digital In | Built-In Self-Test enable trigger |

---

## 7. PDK Characterization

### NMOS Baseline (GDF180)

All critical active devices target **L ≥ 400nm** to safely avoid Short Channel Effects (SCE) without requiring advanced compensation.

Initial component sizing is performed using systematic **gm/Id** sweeps inside `xchem`:

| Sweep | Description |
|-------|-------------|
| **gm/Id vs Vgs** | Plots transconductance efficiency against gate-source overdrive to identify the optimal operating region (weak/moderate/strong inversion) |
| **Id/W vs Vgs** | Evaluates drain current density against device geometry widths for area-optimized sizing |
| **gm/gds (Self-Gain)** | Characterizes intrinsic open-loop gain limits of individual transistors |

> **Design Rule:** Standard layout techniques (common-centroid, guard rings, dummy devices) must be employed even at L ≥ 400nm to mitigate parasitic effects and process-induced mismatch.

---

## 8. Design Methodology

### Behavioral Modeling (First Step)

Before schematic entry, a **Python/MATLAB behavioral model** must prove the concept end-to-end:

```
Capacitive Change
      │
      ▼
Capacitive Bridge Equation Simulation
      │
      ▼
CDS Front-End Model  (gain, common-mode rejection)
      │
      ▼
OTA Model            (differential gain, swing)
      │
      ▼
SAR ADC RTL Skeleton (FSM + CDAC quantization)
      │
      ▼
Offset / Noise Model (integrated noise floor)
      │
      ▼
Digital Code Output
```

**Key validation plot:** Capacitance change (ΔC) vs. ADC output code — must be monotonic and linear within the sensor range.

### Main Design Blocks

| Domain | Block | Description |
|--------|-------|-------------|
| **Analog** | OTA | Two-stage Miller OTA — primary amplification stage |
| **Analog** | CDAC | Charge-redistribution DAC array for SAR conversion |
| **Analog** | Comparator | High-speed decision element within SAR loop |
| **Analog** | CDS Sampling Caps | Switched-capacitor front-end sampling network |
| **Analog** | Bandgap & Bias | On-chip reference generation for all bias nodes |
| **Digital** | SAR FSM | Finite State Machine controlling the SAR conversion cycle |
| **Digital** | SPI Readout | 4-wire serial interface for digital telemetry |
| **Digital** | Digital Calibration | Mismatch correction and offset compensation logic |

---

## 9. Implementation Roadmap

### Phase 1 — Simulation & Behavioral Modeling
- [ ] Freeze component specifications for every block in the signal flow
- [ ] Develop Python-based behavioral model of the complete signal chain
- [ ] Simulate: capacitive bridge equation → CDS gain → OTA output → ADC quantization → digital code
- [ ] Generate **ΔC vs. ADC output code** validation plot
- [ ] Complete literature review on SAR ADC and C-to-V conversion circuits

### Phase 2 — Initial Sizing & Architecture Lock
- [ ] PDK characterization: gm/Id, Id/W, gm/gds sweeps in xchem (NMOS baseline, L=400nm)
- [ ] OTA initial sizing using gm/Id methodology
- [ ] Define and freeze: Final Block Diagram, Pin List, ADC resolution, Supply/Reference plan, Simulation plan
- [ ] Design SAR FSM architecture and RTL skeleton
- [ ] Bandgap/bias scheme definition

### Phase 3 — First Schematic Implementation
- [ ] OTA schematic — achieve basic differential gain
- [ ] Comparator schematic — verify correct decisions in simulation
- [ ] SAR logic simulation — verify FSM timing and transitions
- [ ] CDAC — ideal/simple capacitor version validated
- [ ] (Optional) Sensor bridge schematic

### Phase 4 — ADC Core Integration
- [ ] Feed differential ramp input, verify 8-bit (→10-bit) digital output code
- [ ] Check for missing codes
- [ ] Verify comparator timing margins
- [ ] DNL / INL linearity checks
- [ ] SAR RTL: V_in_diff → ADC code validation

### Phase 5 — Full Signal Chain Integration
- [ ] End-to-end simulation: Sensor model → CDS front-end → OTA → SAR ADC → digital code
- [ ] Verify: no clock overlaps, no large signal reversals, ΔC visible at output, ADC independent of sensor offset
- [ ] Pre-layout full chain simulation

### Phase 6 — Corners, Monte Carlo & Layout
- [ ] Process corners: TT / SS / FF for OTA and Comparator
- [ ] Monte Carlo mismatch analysis
- [ ] Layout: Comparator, CDAC, OTA, CDS caps, Bias cells, Digital blocks
- [ ] Top-level routing
- [ ] DRC / LVS / PEX sign-off
- [ ] Post-layout simulation

---

## 10. Verification Plan

### Simulation Checks per Block

| Block | Key Checks |
|-------|-----------|
| **OTA** | Differential gain, phase margin, output swing (≥2.7V), CMRR, PSRR |
| **Comparator** | Metastability, decision timing, offset voltage |
| **SAR FSM** | State transitions, clock phase alignment, no race conditions |
| **CDAC** | Capacitor matching, unit cap accuracy, linearity |
| **Full Chain** | DNL < 0.5 LSB, INL < 1 LSB, no missing codes |
| **SPI** | Correct framing, data integrity, timing margins |

### Layout Sign-Off Checklist
- [ ] DRC clean (Design Rule Check)
- [ ] LVS clean (Layout vs. Schematic)
- [ ] PEX extracted netlist post-layout simulation
- [ ] No clock overlap in extracted simulation
- [ ] Supply/ground IR drop within spec

---

## 11. Repository Structure

## Contributing

This project is being developed as part of the **2026 IEEE SSCS Open-Source Chipathon (Track B)**. Contributions, issue reports, and design reviews are welcome.

> For design questions or collaboration inquiries, please open a GitHub Issue.

---

## License

This project is open-source and follows the terms of the **2026 SSCS Open-Source Chipathon** program guidelines. All schematic, layout, and simulation files are intended for open community use under the applicable open-source hardware license.

---

*Last updated: June 2026 | Process: GDF180 (180nm CMOS) | Target: SSCS Chipathon Track B*
