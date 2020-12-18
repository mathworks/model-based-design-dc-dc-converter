% Copyright 2020 - 2020 The MathWorks, Inc.

% mdel names
mdlNames.topLevel = 'DCDC_SEPIC_TopLevelModel';
mdlNames.ASW_Structure = 'Application_Software';
mdlNames.SoftwareModule1 = 'Load_Current_Limits';
mdlNames.SoftwareModule2 = 'Supervisory_Logic';
mdlNames.SoftwareModule3 = 'Closed_Loop_Control_Voltage';
mdlNames.SoftwareModule4 = 'Closed_Loop_LEDControllers';

%configuration set references load:
load freeConfigSet_PIL_ASW.mat
load freeConfigSet_HW_ASW.mat
load freeConfigSet_Sim_ASW.mat

