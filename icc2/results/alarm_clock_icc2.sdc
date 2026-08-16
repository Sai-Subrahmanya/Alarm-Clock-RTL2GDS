################################################################################
#
# Design name:  alarm_clock_top
#
# Created by icc2 write_sdc
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: func
# Corner: nom
# Scenario: func.nom

# /alarm_clock/icc2/source/alarm_clock_out.sdc, line 42
create_clock -name clock -period 5 -waveform {0 2.5} [get_ports {clock}]
set_propagated_clock [get_clocks {clock}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   139
set_false_path -from [get_ports {reset}]
set_load -pin_load 0.05 [get_ports {ms_hour[7]}]
set_load -pin_load 0.05 [get_ports {ms_hour[6]}]
set_load -pin_load 0.05 [get_ports {ms_hour[5]}]
set_load -pin_load 0.05 [get_ports {ms_hour[4]}]
set_load -pin_load 0.05 [get_ports {ms_hour[3]}]
set_load -pin_load 0.05 [get_ports {ms_hour[2]}]
set_load -pin_load 0.05 [get_ports {ms_hour[1]}]
set_load -pin_load 0.05 [get_ports {ms_hour[0]}]
set_load -pin_load 0.05 [get_ports {ls_hour[7]}]
set_load -pin_load 0.05 [get_ports {ls_hour[6]}]
set_load -pin_load 0.05 [get_ports {ls_hour[5]}]
set_load -pin_load 0.05 [get_ports {ls_hour[4]}]
set_load -pin_load 0.05 [get_ports {ls_hour[3]}]
set_load -pin_load 0.05 [get_ports {ls_hour[2]}]
set_load -pin_load 0.05 [get_ports {ls_hour[1]}]
set_load -pin_load 0.05 [get_ports {ls_hour[0]}]
set_load -pin_load 0.05 [get_ports {ms_minute[7]}]
set_load -pin_load 0.05 [get_ports {ms_minute[6]}]
set_load -pin_load 0.05 [get_ports {ms_minute[5]}]
set_load -pin_load 0.05 [get_ports {ms_minute[4]}]
set_load -pin_load 0.05 [get_ports {ms_minute[3]}]
set_load -pin_load 0.05 [get_ports {ms_minute[2]}]
set_load -pin_load 0.05 [get_ports {ms_minute[1]}]
set_load -pin_load 0.05 [get_ports {ms_minute[0]}]
set_load -pin_load 0.05 [get_ports {ls_minute[7]}]
set_load -pin_load 0.05 [get_ports {ls_minute[6]}]
set_load -pin_load 0.05 [get_ports {ls_minute[5]}]
set_load -pin_load 0.05 [get_ports {ls_minute[4]}]
set_load -pin_load 0.05 [get_ports {ls_minute[3]}]
set_load -pin_load 0.05 [get_ports {ls_minute[2]}]
set_load -pin_load 0.05 [get_ports {ls_minute[1]}]
set_load -pin_load 0.05 [get_ports {ls_minute[0]}]
set_load -pin_load 0.05 [get_ports {alarm_sound}]
# Warning: Libcell power domain derates are skipped!

# Set latency for io paths.
# -origin useful_skew
set_clock_latency -min 0.0884628 [get_clocks {clock}]
# -origin useful_skew
set_clock_latency -max 0.0954628 [get_clocks {clock}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {clock}]
set_clock_uncertainty -setup 0.2 [get_clocks {clock}]
set_clock_uncertainty -hold 0.02 [get_clocks {clock}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   125; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 126
set_input_transition 0.2 [get_ports {key[3]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   127; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 128
set_input_transition 0.2 [get_ports {key[2]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   129; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 130
set_input_transition 0.2 [get_ports {key[1]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   131; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 132
set_input_transition 0.2 [get_ports {key[0]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   133; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 134
set_input_transition 0.2 [get_ports {time_button}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   135; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 136
set_input_transition 0.2 [get_ports {alarm_button}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   137; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 138
set_input_transition 0.2 [get_ports {fastwatch}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   45; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 46
set_input_delay -clock [get_clocks {clock}] -min 0 [get_ports {key[3]}]
set_input_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {key[3]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   47; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 48
set_input_delay -clock [get_clocks {clock}] -min 0 [get_ports {key[2]}]
set_input_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {key[2]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   49; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 50
set_input_delay -clock [get_clocks {clock}] -min 0 [get_ports {key[1]}]
set_input_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {key[1]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   51; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 52
set_input_delay -clock [get_clocks {clock}] -min 0 [get_ports {key[0]}]
set_input_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {key[0]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   53; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 54
set_input_delay -clock [get_clocks {clock}] -min 0 [get_ports {time_button}]
set_input_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {time_button}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   55; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 56
set_input_delay -clock [get_clocks {clock}] -min 0 [get_ports {alarm_button}]
set_input_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {alarm_button}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   57; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 58
set_input_delay -clock [get_clocks {clock}] -min 0 [get_ports {fastwatch}]
set_input_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {fastwatch}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   59; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 60
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[7]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[7]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   61; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 62
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[6]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[6]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   63; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 64
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[5]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[5]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   65; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 66
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[4]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[4]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   67; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 68
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[3]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[3]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   69; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 70
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[2]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[2]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   71; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 72
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[1]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[1]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   73; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 74
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_hour[0]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_hour[0]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   75; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 76
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[7]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[7]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   77; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 78
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[6]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[6]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   79; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 80
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[5]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[5]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   81; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 82
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[4]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[4]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   83; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 84
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[3]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[3]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   85; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 86
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[2]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[2]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   87; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 88
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[1]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[1]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   89; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 90
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_hour[0]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_hour[0]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   91; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 92
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[7]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[7]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   93; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 94
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[6]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[6]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   95; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 96
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[5]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[5]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   97; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 98
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[4]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[4]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   99; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 100
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[3]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[3]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   101; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 102
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[2]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[2]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   103; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 104
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[1]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[1]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   105; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 106
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ms_minute[0]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ms_minute[0]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   107; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 108
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[7]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[7]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   109; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 110
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[6]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[6]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   111; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 112
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[5]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[5]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   113; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 114
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[4]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[4]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   115; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 116
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[3]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[3]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   117; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 118
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[2]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[2]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   119; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 120
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[1]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[1]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   121; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 122
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {ls_minute[0]}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {ls_minute[0]}]
# /alarm_clock/icc2/source/alarm_clock_out.sdc, line \
#   123; /alarm_clock/icc2/source/alarm_clock_out.sdc, \
#   line 124
set_output_delay -clock [get_clocks {clock}] -min 0 [get_ports {alarm_sound}]
set_output_delay -clock [get_clocks {clock}] -max 1.5 [get_ports {alarm_sound}]
