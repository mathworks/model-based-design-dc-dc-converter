% Copyright 2020 - 2020 The MathWorks, Inc.

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'ConfigSet_daessc_TopLevel');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule1,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule2,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule3,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule4,'freeConfigSet_Sim_ASW');
%Setting Model to normal mode:
set_param([mdlNames.topLevel,'/Application_Software'],'SimulationMode','Normal');

%Some block configurations:
set_param([mdlNames.topLevel,'/Firmware_Hardware/Hardware_Filter/Simscape/Solver Configuration'],'UseLocalSolver','off');
set_param(mdlNames.topLevel,'SimulationMode','Normal');
% set_param(bdroot,'SimscapeUseOperatingPoints','on','SimscapeOperatingPoint','op_tm_average');
set_param('DCDC_SEPIC_TopLevelModel/User_Interface/dcpwmSEPIC_Desired','Value','0.61');

%Variant configuration:
Var_Converter = 3;
Var_Plant = 0;
Var_UserInputDC = 3;

%Getting active labels:
LoadType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load','LabelModeActivechoice');
TransistorType = '';
%Setting up mask:
set_param([mdlNames.topLevel,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC('Average',TransistorType,LoadType));

%Mask App Software:
SimMode = '';
set_param([mdlNames.topLevel,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));

clear LoadType TransistorType SimMode

%Saving:
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');

%Updating model:
set_param(mdlNames.topLevel,'SimulationCommand','Update');