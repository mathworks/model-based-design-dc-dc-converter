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

%Some block configurations:
set_param([mdlNames.topLevel,'/Firmware_Hardware/Hardware_Filter/Simscape/Solver Configuration'],'UseLocalSolver','off');
configset.reference.overrideParameter(mdlNames.topLevel,'SimscapeUseOperatingPoints','on');
configset.reference.overrideParameter(mdlNames.topLevel,'SimscapeOperatingPoint','op_tm_average');

%Variant configuration:
Var_Converter = 3;
Var_Plant = 0;

%Getting active labels:
LoadType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load','LabelModeActivechoice');
TransistorType = '';
%Setting up mask:
set_param([mdlNames.topLevel,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC('Average',TransistorType,LoadType));

clear LoadType TransistorType




