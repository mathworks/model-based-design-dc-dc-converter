VoltCL_LEDCL_SimscapeAvg_StartupOnly;

%Cleaning Cache&CodeFolder:
DeleteContentInFolder(SlPrj.Information.SimulinkCacheFolder);
DeleteContentInFolder(SlPrj.Information.SimulinkCodeGenFolder);

%Saving:
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');
%Updating model:
set_param(mdlNames.topLevel,'SimulationCommand','Update');

