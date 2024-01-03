% Copyright 2020 - 2020 The MathWorks, Inc.
load_system(mdlNames.topLevel);
load_system(mdlNames.ASW_Structure);

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'ConfigSet_ode23t_TopLevel');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'ConfigSet_Sim_ASW');

for k=1:numel(mdlNames.SoftwareModule)
    load_system(mdlNames.SoftwareModule(k).Name);
    setActiveConfigSet(mdlNames.SoftwareModule(k).Name,'ConfigSet_Sim_ASW');
end);


%Changing some blocks:
% set_param('DCDC_SEPIC_TopLevelModel/User_Interface/dcpwmSEPIC_Desired','Value','0.38');
set_param([mdlNames.topLevel,'/Application_Software'],'SimulationMode','Normal')

%Closing app and commenting out MATLAB fcn block:
CloseTILEDApp;

%Variant configuration:
Var_Converter = 0;
Var_Plant = 1;
Var_UserInputDC = 3;

%Setting up mask:
set_param([mdlNames.topLevel,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC('RealHW','',''));

%Mask App Software:
SimMode = '';
set_param([mdlNames.topLevel,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));

clear SimMode

%Save all:
save_system(mdlNames.topLevel,'SaveDirtyReferencedModels','on');

%Cleaning Cache&CodeFolder:
DeleteContentInFolder(SlPrj.Information.SimulinkCacheFolder,1);
DeleteContentInFolder(SlPrj.Information.SimulinkCodeGenFolder);

%Updating model:
set_param(bdroot,'SimulationCommand','Update');