# OpenCardiac_CapacitivePressure_sensor_ASIC


An ultra-low-power, self-calibrating **Capacitance-to-Digital Converter (CDC) Readout IC** optimized for external differential MEMS pressure sensors. This design is targeted for the **ISSCC Open-Source Chipathon** using the **GDF180 (180nm CMOS)** process node.

The architecture builds upon classical switched-capacitor topologies to implement an automated, silicon-ready sensing pipeline with integrated digital mismatch self-calibration.

---

## 1. System Architecture & Signal Flow

The ASIC interfaces with an external differential capacitive bridge to evaluate physical pressure variations. The core architecture implements a low-noise analog front-end coupled with a charge-redistribution Successive Approximation Register (SAR) ADC.

### Top-Level Block Diagram
+---------------------------------------------------------------------------------------+
|                                    ASIC BOUNDARY                                      |
|                                                                                       |
|   +------------------+      +------------------+      +---------------+               |
|   |  C-to-V Bridge   |      | Two-Stage Miller |      |  Charge-Red.  |               |
|   |  Sensing Network +----->|    Analog OTA    +----->|  SAR ADC Core |               |
|   |  (5pF - 10pF)    |      | (>= 2.7V Swing)  |      | (8-Bit/10-Bit)|               |
|   +--------+---------+      +--------+---------+      +-------+-------+               |
|            ^                         ^                        |                       |
|            | Analog Feedback         | Bias Voltages          | Raw Code              |
|            |                         |                        v                       |
|   +--------+---------+               |                +-------+-------+               |
|   | Capacitive DAC   |      +--------+---------+      |  Digital Core |               |
|   | Fine-Tuning Bank |<-----+  Bandgap & Bias  |      | Calibration & |               |
|   | (Trim Arrays)    |      | Generat. Blocks  |      | SPI Interface |               |
|   +------------------+      +------------------+      +-------+-------+               |
|                                                               |                       |
+---------------------------------------------------------------|-----------------------+
v
[ SPI Stream Out ]

### Signal Processing Flow
1. **Physical Deflection:** Pressure shifts the relative capacitance of the differential bridge within a target domain of **5pF to 10pF**.
2. **Capacitance-to-Voltage (C-to-V) Conversion:** The sampling front-end transforms capacitive deviations into a differential voltage signal utilizing Correlated Double Sampling (CDS) parameters ($V_{cm}$, $V_{dd}$, and tuned feedback structures).
3. **Amplification:** A two-stage Miller Operational Transconductance Amplifier (OTA) drives the signal, providing the necessary open-loop gain while preserving an output voltage swing of **$\ge$ 2.7V** on a **3.3V supply rail**.
4. **Digitization:** The voltage is captured by a successive approximation register network. The pipeline targets an initial **8-bit SAR ADC topology** to establish behavioral validation before scaling up to the ultimate **10-bit target resolution**.
5. **Auto-Calibration & Telemetry:** Digital calibration blocks track systemic baseline structural mismatches and apply correction vectors before streaming data frames externally through an SPI port.

---

## 2. Chip Specification Matrix

| Parameter | Target Specification | Domain / Notes |
| :--- | :--- | :--- |
| **Process Technology** | GDF180 (180nm CMOS) | Open-Source PDK Track |
| **Analog Supply Voltage ($V_{dd}$)**| 3.3 V | Provides headroom for high swing |
| **Digital Core Supply** | 0.5 V | Ultra-low-voltage near-threshold domain |
| **Sensor Capacitance Baseline ($C_0$)**| 5 pF to 10 pF | External differential MEMS bridge |
| **OTA Topology** | Two-Stage Miller Compensated | Minimum 2.7V differential swing |
| **OTA Transconductance ($g_m$)** | ~50 to 100 $\mu$S | Optimized via $g_m/I_d$ characterization |
| **Initial ADC Resolution** | 8-Bit | Baseline FSM routing verification |
| **Ultimate ADC Resolution** | 10-Bit | Final production tracking resolution |
| **Total Channel Power Budget** | < 10 $\mu$W | Gated digital clocks + weak inversion bias |

---

## 3. Preliminary Verification & Pin Mapping

### Initial Pinout Allocation
* **VDDA / GNDA:** Clean supply lines for noise-sensitive analog blocks (3.3V).
* **VDDD / GNDD:** Isolated supply lines for digital switching cells (0.5V).
* **VREF:** High-stability reference feed for the charge-redistribution CDAC array.
* **IN_P / IN_N:** Differential inputs coming directly from the external MEMS sensor nodes.
* **SCK / CS_N / MOSI / MISO:** Standard Serial Peripheral Interface (SPI) bus controls.
* **BIST_EN:** External trigger pin to initiate Built-In Self-Test routines.

### Technical Methodology & PDK Characterization
To avoid short-channel performance degradation (Short Channel Effects), all critical active devices preserve a baseline layout channel length of **$L \ge 400\text{nm}$**. 

Initial component sizing parameters are extracted using systematic $g_m/I_d$ sweeps inside `xchem` to evaluate:
1. $g_m/I_d$ performance versus Gate-to-Source Overdrive ($V_{gs}$).
2. Linear Drain Current Scaling ($I_d/W$) relative to device geometry widths.
3. Open-loop self-gain limits ($g_m/g_{ds}$).

---
