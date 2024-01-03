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
end

%Simulation configuration:
set_param([mdlNames.topLevel,'/Firmware_Hardware/Hardware_Filter/Simscape/Solver Configuration'],'UseLocalSolver','off');
set_param(mdlNames.topLevel,'SimscapeUseOperatingPoints','on','SimscapeOperatingPoint','op_tm_average');

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
SimMode = 'SIL';
set_param([mdlNames.topLevel,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));

clear LoadType TransistorType SimMode

%Setting Model to SIL mode:
set_param([mdlNames.topLevel,'/Application_Software'],'SimulationMode','Software-in-the-loop (SIL)')

set_param(mdlNames.topLevel,'SimulationMode','Normal');

%Cleaning Cache&CodeFolder:
DeleteContentInFolder(SlPrj.Information.SimulinkCacheFolder);
DeleteContentInFolder(SlPrj.Information.SimulinkCodeGenFolder);


%Saving model:
save_system(mdlNames.topLevel,'SaveDirtyReferencedModels','on');

%Updating model:
set_param(mdlNames.topLevel,'SimulationCommand','Update');