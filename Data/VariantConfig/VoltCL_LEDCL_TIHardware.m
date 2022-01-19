% Copyright 2020 - 2020 The MathWorks, Inc.

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'ConfigSet_HW_ASW');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'ConfigSet_HW_ASW');
setActiveConfigSet(mdlNames.SoftwareModule1,'ConfigSet_HW_ASW');
setActiveConfigSet(mdlNames.SoftwareModule2,'ConfigSet_HW_ASW');
setActiveConfigSet(mdlNames.SoftwareModule3,'ConfigSet_HW_ASW');
setActiveConfigSet(mdlNames.SoftwareModule4,'ConfigSet_HW_ASW');


%Changing some blocks:
set_param('DCDC_SEPIC_TopLevelModel/User_Interface/dcpwmSEPIC_Desired','Value','0.38');
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
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');

%Cleaning Cache&CodeFolder:
DeleteContentInFolder(SlPrj.Information.SimulinkCacheFolder,1);
DeleteContentInFolder(SlPrj.Information.SimulinkCodeGenFolder);

%Updating model:
set_param(bdroot,'SimulationCommand','Update');