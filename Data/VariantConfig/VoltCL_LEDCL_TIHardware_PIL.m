% Copyright 2020 - 2020 The MathWorks, Inc.

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'ConfigSet_PIL_TopLevel');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'ConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule1,'ConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule2,'ConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule3,'ConfigSet_PIL_ASW');
setActiveConfigSet(mdlNames.SoftwareModule4,'ConfigSet_PIL_ASW');
%Variant configuration:
Var_Converter = 3;
Var_Plant = 0;
Var_UserInputDC = 3;

%Changing some block parameters because simulation:
set_param('DCDC_SEPIC_TopLevelModel/User_Interface/dcpwmSEPIC_Desired','Value','0.61');
set_param([bdroot,'/Firmware_Hardware/Hardware_Filter/Simscape/Solver Configuration'],'UseLocalSolver','off');
set_param(bdroot,'SimscapeUseOperatingPoints','on','SimscapeOperatingPoint','op_tm_average');
%Setting Model to PIL mode:
set_param([mdlNames.topLevel,'/',mdlNames.ASW_Structure],'SimulationMode','Processor-in-the-loop (PIL)')



%Getting active labels:
LoadType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load','LabelModeActivechoice');
TransistorType = '';
%Setting up mask:
set_param([mdlNames.topLevel,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC('Average',TransistorType,LoadType));
%Mask App Software:
SimMode = 'PIL';
set_param([mdlNames.topLevel,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));

clear LoadType TransistorType SimMode


%Save all:
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');

%Cleaning Cache&CodeFolder:
DeleteContentInFolder(SlPrj.Information.SimulinkCacheFolder,1);
DeleteContentInFolder(SlPrj.Information.SimulinkCodeGenFolder);


%Updating model:
set_param(bdroot,'SimulationCommand','Update');