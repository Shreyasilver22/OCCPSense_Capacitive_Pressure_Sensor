# Antigravity Configuration — OCCPSense Project
> This file tells Antigravity how to manage the project repo and when to push.

---

## Repo Access

**Give Antigravity access to this folder only:**
```
C:\Users\HP\OCCPSense_Capacitive_Pressure_Sensor\
```
This is the cloned GitHub repo. Everything Antigravity touches must stay inside this folder.

**Do NOT give access to:**
- `C:\Users\HP\chipathon\` — this is your local scratch/working folder, not the repo
- The padring fork (`chipathon-2026-gf180mcu-padring`) — that's touched only at tapeout

---

## Branch Rules

- **Never push to `main`** — main is protected, only merged via Pull Request
- **Always work on:** `imad/sar-digital`
- **Verify current branch before any push:**
  ```bash
  git branch
  ```
  Must show `* imad/sar-digital` before pushing anything.

---

## Folder Structure (maintain this exactly)

```
OCCPSense_Capacitive_Pressure_Sensor/
├── behavioral_model/
│   └── behavioral_model.py          ← Python signal chain model
├── rtl/
│   ├── sar_ctrl.v                   ← SAR FSM (Verilog)
│   └── spi_slave.v                  ← SPI readout (Verilog)
├── sim/
│   ├── tb_sar_ctrl.v                ← SAR FSM testbench
│   └── tb_spi_slave.v               ← SPI testbench
├── docs/
│   ├── PROJECT_CONTEXT.md           ← AI session continuity file
│   └── ANTIGRAVITY.md               ← this file
└── README.md
```

Create folders if they don't exist. Never create files outside this structure.

---

## Push Rules — IMPORTANT

### When NOT to push automatically:
- While a file is being actively edited
- When simulation is failing or incomplete
- When there are syntax errors in Verilog
- When behavioral model produces wrong outputs
- Mid-session (during a Claude learning/coding session)

### When TO push (only on explicit instruction):
Antigravity only pushes when the user says one of:
- **"push"**
- **"commit and push"**
- **"save progress"**
- **"we're done for today"**

Never push autonomously. Always wait for explicit instruction.

---

## Commit Message Format

Use this format for every commit:
```
<type>: <short description>

Types:
  add      → new file or feature
  fix      → bug fix
  sim      → simulation result added
  update   → modification to existing file
  docs     → documentation only
```

Examples:
```
add: SAR FSM Verilog skeleton
fix: SAR FSM state transition bug in CONVERT state
sim: SAR testbench passing full 0-255 sweep
update: behavioral model - added DNL/INL plot
docs: update PROJECT_CONTEXT phase 2 complete
```

---

## Git Workflow (exact commands to run)

```bash
# Check status before anything
git status
git branch   # must show * imad/sar-digital

# Stage all changes
git add .

# Commit with proper message
git commit -m "type: description"

# Push to branch
git push origin imad/sar-digital
```

---

## File Ownership (don't touch other people's files)

| File/Folder | Owner | Antigravity can edit? |
|---|---|---|
| `behavioral_model/` | Imad | ✅ Yes |
| `rtl/sar_ctrl.v` | Imad | ✅ Yes |
| `rtl/spi_slave.v` | Imad | ✅ Yes |
| `sim/tb_*.v` | Imad | ✅ Yes |
| `docs/` | Imad | ✅ Yes |
| `README.md` | Team lead (Shreya) | ❌ No — don't modify |
| Any analog files | Analog teammates | ❌ No |

---

## End of Session Checklist

Before pushing at end of session, verify:
- [ ] All new files are in the correct folder
- [ ] No debug print statements left in Verilog
- [ ] Python model still runs without errors
- [ ] Commit message follows the format above
- [ ] Branch is `imad/sar-digital`
