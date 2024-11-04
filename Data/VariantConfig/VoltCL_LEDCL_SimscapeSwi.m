% Copyright 2020 - 2020 The MathWorks, Inc.
load_system(mdlNames.topLevel);
load_system(mdlNames.ASW_Structure);

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'Ref_ConfigSet_ode23t_TopLevel');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'Ref_ConfigSet_Sim_ASW');

for k=1:numel(mdlNames.SoftwareModule)
    load_system(mdlNames.SoftwareModule(k).Name);
    setActiveConfigSet(mdlNames.SoftwareModule(k).Name,'Ref_ConfigSet_Sim_ASW');
end


%Changing some block parameters because simulation:
set_param([mdlNames.topLevel,'/Firmware_Hardware/Hardware_Filter/Simscape/Solver Configuration'],'UseLocalSolver','off');
configset.reference.overrideParameter(mdlNames.topLevel,'SimscapeUseOperatingPoints','on');
configset.reference.overrideParameter(mdlNames.topLevel,'SimscapeOperatingPoint','op_tm_switch_ideal');

%Setting Model to Normal mode:
set_param([mdlNames.topLevel,'/Application_Software'],'SimulationMode','Normal');

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

%Cleaning Cache&CodeFolder:
DeleteContentInFolder(cp.SimulinkCacheFolder);
DeleteContentInFolder(cp.SimulinkCodeGenFolder);

%Saving
save_system(mdlNames.topLevel,'SaveDirtyReferencedModels','on');

%Updating model:
set_param(mdlNames.topLevel,'SimulationCommand','Update');
