% Workspace Variable:
%TRANSFER FUNCTION
load tfSEPIC.mat

% model architecture:
mdlNames.topLevel = 'DCDC_SEPIC_TopLevelModel';
mdlNames.ASW_Structure = 'Application_Software';
mdlNames.SoftwareModule(1).Name = 'Load_Current_Limits';
mdlNames.SoftwareModule(2).Name = 'Supervisory_Logic';
mdlNames.SoftwareModule(3).Name = 'Closed_Loop_Control_Voltage';
mdlNames.SoftwareModule(4).Name = 'Closed_Loop_LEDControllers';

%Dashboard:
Rhytmus = 0.2;   %TODO: in local dd deployment model

% Copyright 2020 - 2020 The MathWorks, Inc.TODO: find a place for this

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



%% Initial configuration:

load_system(mdlNames.topLevel);
load_system(mdlNames.ASW_Structure);
for k=1:numel(mdlNames.SoftwareModule)
    load_system(mdlNames.SoftwareModule(k).Name);
end

%config:
VoltCL_LEDCL_SimscapeAvg_StartupOnly;
%Cleaning Cache&CodeFolder:
DeleteContentInFolder(cp.SimulinkCacheFolder);
DeleteContentInFolder(cp.SimulinkCodeGenFolder);