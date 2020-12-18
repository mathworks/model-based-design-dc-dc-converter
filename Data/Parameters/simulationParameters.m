% Copyright 2020 - 2020 The MathWorks, Inc.

ts1ms = 1e-3;
ts10ms = 0.01;
ts100ms = 0.1;
ts100us = 0.1e-3;
ts200us = 0.2e-3;
ts500us = 0.5e-3;

load op_switch_circuit.mat
load op_harness_pulse.mat
load op_harness_pulse_ideal.mat
load op_harness_pulse_idealMOSFET.mat
load op_harness_pulse_ideal_SimulinkPWM.mat
load op_average_pulse.mat
load op_tm_average.mat
load op_tm_switch_ideal.mat
load op_tm_switch_mosfet.mat
load op_tm_switch_mosfet_thermal.mat
load op_voltctrl_avg.mat
load op_efficiency_circuit.mat

load measurementOszi.mat

%Loading Systems:
load_system(mdlNames.ASW_Structure);
load_system(mdlNames.SoftwareModule1);
load_system(mdlNames.SoftwareModule2);
load_system(mdlNames.SoftwareModule3);
load_system(mdlNames.SoftwareModule4);
load_system(mdlNames.topLevel);

VoltCL_LEDCL_SimscapeSwi;

