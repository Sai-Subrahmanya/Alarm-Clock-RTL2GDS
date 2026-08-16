# Design Compiler Synthesis

This directory contains the files used for RTL synthesis of the Alarm Clock design using Synopsys Design Compiler.

## Purpose

The Design Compiler stage converts the RTL description into a synthesized gate-level implementation using the available standard-cell library environment.

## RTL Source

The Verilog source files used by the synthesis flow are maintained under:

`dc/source/`

The project contains multiple Verilog source files because the Alarm Clock design is divided into multiple functional blocks.

## Synthesis Flow

RTL Source
    ↓
Design Compiler
    ↓
Elaboration
    ↓
Logic Synthesis
    ↓
Constraint / Timing Analysis
    ↓
Synthesis Results

## Synthesis Visualization

The repository contains synthesis schematics for the top-level Alarm Clock design and its major blocks.

The documented blocks include:

- Alarm Clock top-level design
- FSM
- Key register
- Alarm register
- Counter
- Time generator

## Synthesis Evidence

The corresponding synthesis screenshots are available in the `images/` directory:

- `03_dc_synthesis_alarm_clock_schematic.png`
- `04_dc_synthesis_fsm_schematic.png`
- `05_dc_synthesis_keyreg_schematic.png`
- `06_dc_synthesis_alreg_schematic.png`
- `07_dc_synthesis_count_schematic.png`
- `08_dc_synthesis_tgen_schematic.png`

These images show the synthesized design hierarchy and the resulting gate-level structures.

## Tool

Synopsys Design Compiler
