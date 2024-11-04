%Copyright 2020 - 2020 The MathWorks, Inc.

mdlNames = {"DCDC_SEPIC_TopLevelModel","Application_Software","Load_Current_Limits","Supervisory_Logic","Closed_Loop_Control_Voltage","Closed_Loop_LEDControllers"};
nrIterations = length(mdlNames);

for k=1:nrIterations
    set_param(mdlNames{1,k},"PortableWordSizes","on");
    save_system(mdlNames{1,k});
end