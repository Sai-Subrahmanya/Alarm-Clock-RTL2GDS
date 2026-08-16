# Project Images

This directory contains visual evidence from the Alarm Clock RTL-to-GDSII implementation flow.

The images are arranged in the same order as the implementation flow.

## VCS Verification

### 01_vcs_simulation_pass.png

Successful RTL simulation / functional verification result.

### 02_dve_waveform.png

DVE waveform view used to inspect the simulated RTL behavior.

## Design Compiler Synthesis

### 03_dc_synthesis_alarm_clock_schematic.png

Top-level synthesized Alarm Clock schematic.

### 04_dc_synthesis_fsm_schematic.png

Synthesized FSM block schematic.

### 05_dc_synthesis_keyreg_schematic.png

Synthesized key-register block schematic.

### 06_dc_synthesis_alreg_schematic.png

Synthesized alarm-register block schematic.

### 07_dc_synthesis_count_schematic.png

Synthesized counter block schematic.

### 08_dc_synthesis_tgen_schematic.png

Synthesized time-generator block schematic.

## ICC2 Physical Design

### 09_icc2_floorplan.png

Initial ICC2 floorplan.

### 10_icc2_power_plan.png

Power-planning stage of the physical implementation.

### 11_icc2_placement.png

Standard-cell placement stage.

### 12_icc2_clock_tree_synthesis.png

Clock Tree Synthesis stage.

### 13_icc2_routing.png

Routing stage after placement and CTS.

### 14_icc2_final_design.png

Final physical-design view after implementation.

## Post-Implementation Analysis

### 15_clock_tree.png

Implemented clock-tree visualization.

### 16_shortest_path_arrival_time.png

Shortest-path arrival-time analysis view.

### 17_longest_path_arrival_time.png

Longest-path arrival-time analysis view.

## Flow Representation
```text
VCS Verification
    ↓
Design Compiler Synthesis
    ↓
ICC2 Floorplan
    ↓
Power Plan
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
Final Design
    ↓
Clock / Timing Analysis
