% Copyright 2020 - 2020 The MathWorks, Inc.

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'ConfigSet_PIL_TopLevel');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'freeConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule1,'freeConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule2,'freeConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule3,'freeConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule4,'freeConfigSet_PIL_ASW');
%Changing some block parameters because simulation:
set_param('DCDC_SEPIC_TopLevelModel/User_Interface/dcpwmSEPIC_Desired','Value','0.61');
set_param([bdroot,'/Firmware_Hardware/Hardware_Filter/Simscape/Solver Configuration'],'UseLocalSolver','off');
%Setting Model to PIL mode:
set_param([bdroot,'/Application_Software'],'SimulationMode','Processor-in-the-loop (PIL)')

%Variant configuration:
Var_Converter = 3;
Var_Plant = 0;
Var_UserInputDC = 3;

%Getting active labels:
LoadType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load','LabelModeActivechoice');
TransistorType = '';
%Setting up mask:
set_param([bdroot,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC('Average',TransistorType,LoadType));
%Mask App Software:
SimMode = 'PIL';
set_param([bdroot,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));

clear LoadType TransistorType SimMode


%Save all:
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');

%Cleaning CodeFolder:
DeleteCodeFolderContent;

%Updating model:
set_param(bdroot,'SimulationCommand','Update');