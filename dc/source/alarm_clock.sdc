###############################################################################
# alarm_clock.sdc
# SDC for Alarm Clock RTL-to-GDS implementation
# Design: alarm_clock_top
# Library/corner: SAED32 RVT TT 0.85 V 25 C
###############################################################################

set_units -time ns -capacitance fF -voltage V -current uA

###############################################################################
# Clock
###############################################################################

set CLK_PERIOD_NS 5.000
set CLK_NAME      clock

create_clock \
    -name $CLK_NAME \
    -period $CLK_PERIOD_NS \
    -waveform [list 0 [expr {$CLK_PERIOD_NS / 2.0}]] \
    [get_ports clock]

###############################################################################
# Clock uncertainty
###############################################################################

set_clock_uncertainty -setup 0.200 [get_clocks $CLK_NAME]
set_clock_uncertainty -hold  0.020 [get_clocks $CLK_NAME]

###############################################################################
# I/O timing assumptions
###############################################################################

set INPUT_DELAY_MAX_NS  1.500
set INPUT_DELAY_MIN_NS  0.000
set OUTPUT_DELAY_MAX_NS 1.500
set OUTPUT_DELAY_MIN_NS 0.000

set DATA_INPUTS [remove_from_collection [all_inputs] [get_ports {clock reset}]]

set_input_delay  -max $INPUT_DELAY_MAX_NS  -clock [get_clocks $CLK_NAME] $DATA_INPUTS
set_input_delay  -min $INPUT_DELAY_MIN_NS  -clock [get_clocks $CLK_NAME] $DATA_INPUTS

set_output_delay -max $OUTPUT_DELAY_MAX_NS -clock [get_clocks $CLK_NAME] [all_outputs]
set_output_delay -min $OUTPUT_DELAY_MIN_NS -clock [get_clocks $CLK_NAME] [all_outputs]

###############################################################################
# Transition and load assumptions
###############################################################################

set_input_transition 0.200 $DATA_INPUTS
set_load 0.050 [all_outputs]

###############################################################################
# Reset
###############################################################################

set_false_path -from [get_ports reset]

###############################################################################
# Important note:
# one_second and one_minute are synchronous enable/data signals, not clocks.
###############################################################################

check_timing
