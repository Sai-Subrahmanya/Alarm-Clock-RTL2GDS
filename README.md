# Alarm Clock — RTL2GDS

An Alarm Clock implemented through a complete RTL-to-GDS digital IC design flow using Synopsys VCS, Design Compiler, and IC Compiler II with the SAED32 32 nm technology.


## Project Overview

This project demonstrates the implementation of an Alarm Clock design from RTL through physical design.

The complete flow consists of:

1. RTL design
2. RTL functional verification using Synopsys VCS
3. Waveform inspection using Synopsys DVE
4. Logic synthesis using Synopsys Design Compiler
5. Floorplanning using Synopsys IC Compiler II
6. Power planning
7. Placement
8. Clock-tree synthesis and analysis
9. Routing
10. Filler-cell insertion
11. Power/ground connectivity and repair
12. Final physical-design and timing analysis

The design uses the SAED32 RVT standard-cell library at the TT operating condition of 0.85 V and 25 °C.


## Design Description

The project implements a digital Alarm Clock using multiple Verilog RTL modules.

The design is organized into functional blocks including:

- Alarm Clock top-level control
- Finite State Machine
- Key register
- Alarm register
- Counter
- Time generator
- LCD driver
- LCD driver interface

The main RTL modules are:

```text
alarm_clock_top.v
alarm_reg.v
counter.v
fsm.v
keyreg.v
lcd_driver.v
lcd_driver_4.v
timegen.v
```

The top-level design is:

```text
alarm_clock_top
```

The RTL modules are used both for functional verification and for synthesis.


## Repository Structure

```text
Alarm-Clock-RTL2GDS/
│
├── README.md
│
├── ref/
│   ├── README.md
│   ├── lib/
│   │   └── README.md
│   └── tech/
│       └── README.md
│
├── vcs/
│   ├── README.md
│   ├── alarm_clock_top.v
│   ├── alarm_reg.v
│   ├── counter.v
│   ├── fsm.v
│   ├── keyreg.v
│   ├── lcd_driver.v
│   ├── lcd_driver_4.v
│   ├── timegen.v
│   └── tb_alarm_clock_compare.sv
│
├── dc/
│   ├── README.md
│   ├── source/
│   │   ├── alarm_clock_top.v
│   │   ├── alarm_reg.v
│   │   ├── counter.v
│   │   ├── fsm.v
│   │   ├── keyreg.v
│   │   ├── lcd_driver.v
│   │   ├── lcd_driver_4.v
│   │   └── timegen.v
│   │
│   ├── scripts/
│   │   └── synth_alarm_clock.tcl
│   │
│   ├── reports/
│   │   ├── area.rpt
│   │   ├── power.rpt
│   │   ├── constraint.rpt
│   │   ├── qor.rpt
│   │   └── timing.rpt
│   │
│   ├── results/
│   │   ├── alarm_clock_compiled.v
│   │   └── alarm_clock_out.sdc
│   │
│   └── work/
│       └── .synopsys_dc.setup
│
├── icc2/
│   ├── README.md
│   ├── source/
│   │   ├── alarm_clock_compiled.v
│   │   └── alarm_clock_out.sdc
│   │
│   ├── scripts/
│   │   ├── common_setup.tcl
│   │   ├── floorplan.tcl
│   │   ├── power_plan.tcl
│   │   ├── clock.tcl
│   │   ├── fillers.tcl
│   │   ├── pg_repair.tcl
│   │   ├── placement.tcl
│   │   ├── reports.tcl
│   │   ├── route.tcl
│   │   └── run_all.tcl
│   │
│   ├── reports/
│   ├── results/
│   │
│   └── work/
│       ├── .synopsys_icc2.setup
│       └── .graph_data.txt
│
└── images/
    ├── README.md
    ├── 01_vcs_simulation_pass.png
    ├── 02_dve_waveform.png
    ├── 03_dc_synthesis_alarm_clock_schematic.png
    ├── 04_dc_synthesis_fsm_schematic.png
    ├── 05_dc_synthesis_keyreg_schematic.png
    ├── 06_dc_synthesis_alreg_schematic.png
    ├── 07_dc_synthesis_count_schematic.png
    ├── 08_dc_synthesis_tgen_schematic.png
    ├── 09_icc2_floorplan.png
    ├── 10_icc2_power_plan.png
    ├── 11_icc2_placement.png
    ├── 12_icc2_clock_tree_synthesis.png
    ├── 13_icc2_routing.png
    ├── 14_icc2_final_design.png
    ├── 15_clock_tree.png
    ├── 16_shortest_path_arrival_time.png
    └── 17_longest_path_arrival_time.png
```


# RTL Functional Verification

RTL functionality was verified before synthesis using Synopsys VCS and a SystemVerilog comparison testbench.

The verification files are located under:

```text
vcs/
```

The testbench used for functional verification is:

```text
tb_alarm_clock_compare.sv
```

The RTL source files used by the verification environment include:

```text
alarm_clock_top.v
alarm_reg.v
counter.v
fsm.v
keyreg.v
lcd_driver.v
lcd_driver_4.v
timegen.v
```

The verification flow includes:

- RTL compilation
- Testbench execution
- Functional checking
- Simulation result verification
- Waveform inspection using DVE


## VCS Compilation

The RTL and SystemVerilog testbench are compiled using Synopsys VCS.

The generated simulation environment is used to verify the functionality of the Alarm Clock before synthesis.


## DVE Waveform Analysis

The simulation waveform is inspected using Synopsys DVE.

The waveform analysis provides visual confirmation of the RTL behavior and the interaction between the different functional blocks.

The corresponding screenshots are:

```text
images/01_vcs_simulation_pass.png
images/02_dve_waveform.png
```


# RTL-to-GDS Flow

```text
                     RTL Design
                         │
                         ▼
              VCS Functional Verification
                         │
                         ▼
                   DVE Waveform
                       Analysis
                         │
                         ▼
                  Design Compiler
                         │
              ┌──────────┼──────────┐
              ▼          ▼          ▼
            Timing      Area       Power
              │          │          │
              └──────────┼──────────┘
                         ▼
                       ICC2
                         │
                         ▼
                    Floorplanning
                         │
                         ▼
                   Power Planning
                         │
                         ▼
                     Placement
                         │
                         ▼
                Clock Tree Synthesis
                         │
                         ▼
                      Routing
                         │
                         ▼
                  Filler Insertion
                         │
                         ▼
             PG Connectivity / Repair
                         │
                         ▼
                  Final Reports
                         │
                         ▼
                Final Physical Design
                         │
                         ▼
              Clock / Timing Analysis
```


# Design Compiler — Logic Synthesis

The verified RTL is synthesized using Synopsys Design Compiler.

The synthesis flow performs:

- RTL elaboration
- Technology mapping
- Constraint application
- Logic optimization
- Timing analysis
- Area analysis
- Power analysis
- QoR analysis
- Report generation

The Design Compiler files are organized under:

```text
dc/
```

The RTL source files used for synthesis are stored under:

```text
dc/source/
```

The synthesis script is stored under:

```text
dc/scripts/synth_alarm_clock.tcl
```

Generated synthesis reports are stored under:

```text
dc/reports/
```

Generated synthesis results are stored under:

```text
dc/results/
```

The Design Compiler working environment is stored under:

```text
dc/work/
```


## DC Source Files

The synthesis flow uses the following Verilog source files:

```text
dc/source/
├── alarm_clock_top.v
├── alarm_reg.v
├── counter.v
├── fsm.v
├── keyreg.v
├── lcd_driver.v
├── lcd_driver_4.v
└── timegen.v
```


## DC Reports

The synthesis flow generates reports covering:

- Area
- Power
- Constraints
- Quality of Results
- Timing

The project reports are:

```text
dc/reports/
├── area.rpt
├── power.rpt
├── constraint.rpt
├── qor.rpt
└── timing.rpt
```


## DC Results

The synthesized design and associated constraint output are stored under:

```text
dc/results/
```

The synthesized output is subsequently used as input to the IC Compiler II physical-design flow.


## Design Compiler Visualization

The synthesized design was inspected using Design Compiler / Design Vision.

The repository contains screenshots of the synthesized:

```text
Alarm Clock Top-Level
FSM
Key Register
Alarm Register
Counter
Time Generator
```

The corresponding images are:

```text
03_dc_synthesis_alarm_clock_schematic.png
04_dc_synthesis_fsm_schematic.png
05_dc_synthesis_keyreg_schematic.png
06_dc_synthesis_alreg_schematic.png
07_dc_synthesis_count_schematic.png
08_dc_synthesis_tgen_schematic.png
```


# Design Constraints

The design is synthesized and implemented using the timing and operating constraints defined by the project SDC and setup files.

The operating condition used for the design is:

```text
Process:      TT
Voltage:      0.85 V
Temperature:  25 °C
```

The Design Compiler flow applies the project's timing constraints during synthesis and timing analysis.


# IC Compiler II — Physical Design

The synthesized Alarm Clock design is taken through physical implementation using Synopsys IC Compiler II.

The physical-design files are organized under:

```text
icc2/
```

The ICC2 physical-design scripts are stored under:

```text
icc2/scripts/
```

The physical-design flow includes:

1. Design initialization
2. Floorplanning
3. Power planning
4. Placement
5. Clock-tree synthesis
6. Routing
7. Filler insertion
8. Power/ground repair
9. Final reporting


## ICC2 Scripts

The physical implementation is divided into the following TCL scripts:

```text
icc2/scripts/
├── common_setup.tcl
├── floorplan.tcl
├── power_plan.tcl
├── clock.tcl
├── fillers.tcl
├── pg_repair.tcl
├── placement.tcl
├── reports.tcl
├── route.tcl
└── run_all.tcl
```


## ICC2 Source

The synthesized design and SDC used by ICC2 are stored under:

```text
icc2/source/
├── alarm_clock_compiled.v
└── alarm_clock_out.sdc
```

These files originate from the Design Compiler stage and are used as inputs for physical implementation.


## ICC2 Launch

From the ICC2 working directory:

```bash
icc2_shell -gui
```

The complete physical-design flow can be executed using:

```tcl
source ../scripts/run_all.tcl
```

The individual TCL scripts can also be executed separately when required.


# Physical Design Stages

## 1. Floorplanning

The synthesized design is initialized in IC Compiler II and the physical floorplan is created.

The corresponding screenshot is:

```text
images/09_icc2_floorplan.png
```


## 2. Power Planning

Power and ground structures are created for the design.

The corresponding screenshot is:

```text
images/10_icc2_power_plan.png
```


## 3. Placement

The standard cells are placed within the physical design region.

The corresponding screenshot is:

```text
images/11_icc2_placement.png
```


## 4. Clock Tree Synthesis

The clock network is synthesized and optimized.

The corresponding screenshot is:

```text
images/12_icc2_clock_tree_synthesis.png
```


## 5. Routing

The design undergoes physical routing to establish the required interconnects.

The corresponding screenshot is:

```text
images/13_icc2_routing.png
```


## 6. Filler Insertion

Filler cells are inserted as part of the physical implementation flow.


## 7. PG Repair and Connectivity

Power and ground connectivity are checked and repaired as part of the ICC2 flow.


## 8. Final Physical Design

The completed physical implementation is inspected after the major implementation stages.

The corresponding screenshot is:

```text
images/14_icc2_final_design.png
```


# Clock Tree Analysis

The implemented clock tree was inspected using the IC Compiler II graphical interface.

The analysis includes:

- Clock-tree topology
- Clock distribution
- Clock latency
- Clock paths
- Longest path
- Shortest path

The clock-tree visualization is provided in:

```text
images/15_clock_tree.png
```


# Timing Path Analysis

Timing paths were inspected after physical implementation.

The repository contains visual analysis of both shortest and longest timing paths.

### Shortest Path

```text
images/16_shortest_path_arrival_time.png
```

### Longest Path

```text
images/17_longest_path_arrival_time.png
```

These views provide visual evidence of the post-implementation timing-path analysis.


# Reference Technology and Library

The project uses the SAED32 32 nm technology with the SAED32 RVT standard-cell library.

The reference environment is documented under:

```text
ref/
```

The primary operating condition is:

```text
Process:      TT
Voltage:      0.85 V
Temperature:  25 °C
```

The required reference technology and library files are proprietary and are therefore not included in this repository.


# Proprietary Reference Files

The SAED32 technology and standard-cell library files are proprietary and are intentionally excluded from this repository.

The `ref/` directory is retained to document the reference environment required by the Design Compiler and IC Compiler II flows.

All library and technology paths referenced by the project scripts are case-sensitive and must match the corresponding legitimate SAED32 installation.


# Gate-Level Simulation Limitation

Gate-level simulation was not included for the post-synthesis and post-layout stages because the required SAED32 standard-cell functional Verilog simulation models were not available in the accessible project environment.

RTL functional correctness was verified using VCS prior to synthesis.

The synthesized and physical implementations were subsequently evaluated using Synopsys Design Compiler and IC Compiler II reports covering timing, constraints, QoR, routing, congestion, power/ground connectivity, and physical verification.


# Software Environment

| Component | Version |
|---|---|
| Technology | SAED32 32 nm |
| Standard-Cell Library | SAED32 RVT |
| Operating Condition | TT, 0.85 V, 25 °C |
| Synopsys VCS | W-2024.09-SP1 |
| Synopsys DVE | W-2024.09-SP1 |
| Synopsys Design Compiler | W-2024.09-SP1 |
| Synopsys Design Vision | W-2024.09-SP1 |
| Synopsys IC Compiler II | W-2024.09-SP1 |


# Repository Contents

### `vcs/`

Contains the Alarm Clock Verilog RTL files and SystemVerilog testbench used for pre-synthesis functional verification.

### `dc/`

Contains the Design Compiler source files, synthesis script, reports, generated results, and working setup.

### `icc2/`

Contains the IC Compiler II source files, physical-design TCL scripts, reports, generated results, and working setup.

### `ref/`

Documents the reference technology and standard-cell library environment required by the flow.

### `images/`

Contains screenshots documenting VCS verification, DVE waveform analysis, Design Compiler synthesis, ICC2 physical implementation, clock-tree analysis, and timing-path analysis.


# Reproducibility

To reproduce this project:

1. Use a compatible Linux/RHEL environment.
2. Install/access the required Synopsys tools.
3. Obtain legitimate access to the required SAED32 technology libraries.
4. Recreate the documented `ref/` environment.
5. Ensure all library and technology paths match the paths referenced by the project scripts.
6. Run RTL functional verification using VCS.
7. Inspect the simulation waveform using DVE.
8. Run Design Compiler synthesis.
9. Review the DC reports and synthesized design.
10. Transfer the synthesized design and constraints to ICC2.
11. Run the ICC2 physical-design flow.
12. Review the ICC2 reports.
13. Inspect the floorplan, placement, CTS, routing, and final physical design.
14. Analyze the implemented clock tree and timing paths.


# Project Evidence

The `images/` directory contains visual evidence of the complete flow:

```text
01  VCS Simulation Pass
02  DVE Waveform
03  DC Alarm Clock Schematic
04  DC FSM Schematic
05  DC Key Register Schematic
06  DC Alarm Register Schematic
07  DC Counter Schematic
08  DC Time Generator Schematic
09  ICC2 Floorplan
10  ICC2 Power Plan
11  ICC2 Placement
12  ICC2 Clock Tree Synthesis
13  ICC2 Routing
14  ICC2 Final Design
15  Clock Tree
16  Shortest Path Arrival Time
17  Longest Path Arrival Time
```


# Important Notes

- The SAED32 reference files are proprietary and are intentionally excluded.
- All paths referenced by the project scripts are case-sensitive.
- The RTL was functionally verified before synthesis.
- Post-synthesis and post-layout gate-level simulation was not performed because the required SAED32 functional Verilog cell models were unavailable.
- Synthesis and physical implementation were evaluated using Synopsys Design Compiler and IC Compiler II.
- The repository contains the RTL, verification environment, synthesis files, physical-design files, reports/results, and project evidence used for the implementation.


# Author

**Sai Subrahmanya**

M.Tech — VLSI & Embedded Systems
