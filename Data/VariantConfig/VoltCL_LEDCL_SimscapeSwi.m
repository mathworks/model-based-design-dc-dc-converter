% Copyright 2020 - 2020 The MathWorks, Inc.

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'ConfigSet_daessc_TopLevel');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule1,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule2,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule3,'freeConfigSet_Sim_ASW');
setActiveConfigSet(mdlNames.SoftwareModule4,'freeConfigSet_Sim_ASW');
%Simulation configuration:
set_param(mdlNames.topLevel,'SimulationMode','Normal');

%Changing some block parameters because simulation:
set_param([mdlNames.topLevel,'/Firmware_Hardware/Hardware_Filter/Simscape/Solver Configuration'],'UseLocalSolver','off');
set_param('DCDC_SEPIC_TopLevelModel/User_Interface/dcpwmSEPIC_Desired','Value','0.61');
%Setting Model to SIL mode:
set_param([mdlNames.topLevel,'/Application_Software'],'SimulationMode','Normal')

%Variant configuration:
Var_Converter = 2;
Var_Plant = 0;
Var_UserInputDC = 3;

%Setting ideal switch:
ActivateIdealSwitch;

%Getting active labels:
LoadType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load','LabelModeActivechoice');
TransistorType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit/MOSFET','LabelModeActivechoice');
%Setting up mask:
set_param([mdlNames.topLevel,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC('',TransistorType,LoadType));
%Mask App Software:
SimMode = '';
set_param([mdlNames.topLevel,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));

clear LoadType TransistorType SimMode

%Saving
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');

%Updating model:
set_param(mdlNames.topLevel,'SimulationCommand','Update');