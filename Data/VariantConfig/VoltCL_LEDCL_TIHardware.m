% Copyright 2020 - 2020 The MathWorks, Inc.
load_system(mdlNames.topLevel);
load_system(mdlNames.ASW_Structure);

%TopLevelModelConfiguration:
setActiveConfigSet(mdlNames.topLevel,'Ref_ConfigSet_HW_ASW');
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,'Ref_ConfigSet_HW_ASW');

for k=1:numel(mdlNames.SoftwareModule)
    load_system(mdlNames.SoftwareModule(k).Name);
    setActiveConfigSet(mdlNames.SoftwareModule(k).Name,'Ref_ConfigSet_HW_ASW');
end
%Setting Model to Normal mode:
set_param([mdlNames.topLevel,'/Application_Software'],'SimulationMode','Normal');

%Closing app and commenting out MATLAB fcn block:
try
    CloseTILEDApp;
catch ME
end
%Variant configuration:
Var_Converter = 0;
Var_Plant = 1;

%Setting up mask:
set_param([mdlNames.topLevel,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC('RealHW','',''));

%Mask App Software:
SimMode = '';
set_param([mdlNames.topLevel,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));

clear SimMode


%Cleaning Cache&CodeFolder:
DeleteContentInFolder(cp.SimulinkCacheFolder);
DeleteContentInFolder(cp.SimulinkCodeGenFolder);

sltest.harness.open(mdlNames.topLevel,'DCDC_SEPIC_TopLevelModel_HW');
%Save all:
save_system(mdlNames.topLevel,'SaveDirtyReferencedModels','on');

%Updating model:
set_param(bdroot,'SimulationCommand','Update');