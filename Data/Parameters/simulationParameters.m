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



%% Initial configuration:

load_system(mdlNames.topLevel);
load_system(mdlNames.ASW_Structure);
for k=1:numel(mdlNames.SoftwareModule)
    load_system(mdlNames.SoftwareModule(k).Name);
end

%config:
VoltCL_LEDCL_SimscapeAvg_StartupOnly;
%Cleaning Cache&CodeFolder:
DeleteContentInFolder(SlPrj.Information.SimulinkCacheFolder);
DeleteContentInFolder(SlPrj.Information.SimulinkCodeGenFolder);

%Initial configuration for Efficiency Analysis model, so that it can
%compile for update reports:
Voltage_Test_Single = 18;% V
Curr_Test_Single = 500;   % mA

desiredLoad_Param = Voltage_Test_Single/(Curr_Test_Single*0.001); % Resistance in Ohm
desiredVoltage_Param = Voltage_Test_Single; % Voltage in Volt
desired_dcMax = 0.95;
desiredCurrent_Param = Curr_Test_Single;


