% Copyright 2024 - 2024 The MathWorks, Inc.
VoltCL_LEDCL_SimscapeAvg_StartupOnly;

%Mask App Software:
SimMode = 'SIL';
set_param([mdlNames.topLevel,'/Application_Software'],'MaskDisplay',generateMaskDisplayAppSoftware(SimMode));
%Setting Model to normal mode:
set_param([mdlNames.topLevel,'/Application_Software'],'SimulationMode','Software-in-the-loop (SIL)')

clear SimMode

%Cleaning Cache&CodeFolder:
DeleteContentInFolder(cp.SimulinkCacheFolder);
DeleteContentInFolder(cp.SimulinkCodeGenFolder);

%Saving model:
save_system(mdlNames.topLevel,'SaveDirtyReferencedModels','on');
%Updating model:
set_param(mdlNames.topLevel,'SimulationCommand','Update');