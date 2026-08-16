# IC Compiler II Physical Design

This directory contains the files used for physical implementation of the synthesized Alarm Clock design using Synopsys IC Compiler II.

## Purpose

The ICC2 stage takes the synthesized design through the major physical-design steps required to obtain the final routed implementation.

## Physical Design Flow

Synthesized Design
    ↓
Floorplanning
    ↓
Power Planning
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
Final Design

## Implementation Stages

### 1. Floorplanning

The initial physical floorplan is created and the design boundary, placement region, ports, and physical infrastructure are established.

### 2. Power Planning

The power distribution structure is created for the design.

### 3. Placement

Standard cells are placed within the floorplan while considering physical and timing requirements.

### 4. Clock Tree Synthesis

The clock network is implemented to distribute the clock signal to the sequential elements of the design.

### 5. Routing

Signal and clock nets are routed through the available routing resources.

### 6. Final Design

The completed physical implementation is generated after routing.

## Physical Design Evidence

The corresponding ICC2 screenshots are available in the `images/` directory:

- `09_icc2_floorplan.png`
- `10_icc2_power_plan.png`
- `11_icc2_placement.png`
- `12_icc2_clock_tree_synthesis.png`
- `13_icc2_routing.png`
- `14_icc2_final_design.png`

## Post-Implementation Analysis

Additional views are included for:

- Clock tree analysis
- Shortest path arrival time
- Longest path arrival time

These are documented by:

- `15_clock_tree.png`
- `16_shortest_path_arrival_time.png`
- `17_longest_path_arrival_time.png`

## Tool

Synopsys IC Compiler II
