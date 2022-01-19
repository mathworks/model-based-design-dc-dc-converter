%Copyright 2020 - 2020 The MathWorks, Inc.
%configuration set load:
load ConfigSet_PIL_ASW.mat
load ConfigSet_HW_ASW.mat
load ConfigSet_Sim_ASW.mat

%Set PIL as active in order to load the others:
setActiveConfigSet(mdlNames.ASW_Structure,ConfigSet_PIL_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule1,ConfigSet_PIL_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule2,ConfigSet_PIL_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule3,ConfigSet_PIL_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule4,ConfigSet_PIL_ASW.Name);

% Detach and reattach the one in base workspace:
detachConfigSet(mdlNames.ASW_Structure,ConfigSet_HW_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule1,ConfigSet_HW_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule2,ConfigSet_HW_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule3,ConfigSet_HW_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule4,ConfigSet_HW_ASW.Name);
% Attach config set:
attachConfigSetCopy(mdlNames.ASW_Structure,ConfigSet_HW_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule1,ConfigSet_HW_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule2,ConfigSet_HW_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule3,ConfigSet_HW_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule4,ConfigSet_HW_ASW);

% Detach and reattach the one in base workspace:
detachConfigSet(mdlNames.ASW_Structure,ConfigSet_Sim_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule1,ConfigSet_Sim_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule2,ConfigSet_Sim_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule3,ConfigSet_Sim_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule4,ConfigSet_Sim_ASW.Name);
% Attach config set:
attachConfigSetCopy(mdlNames.ASW_Structure,ConfigSet_Sim_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule1,ConfigSet_Sim_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule2,ConfigSet_Sim_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule3,ConfigSet_Sim_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule4,ConfigSet_Sim_ASW);

%% Set Sim as active and then change PIL:
setActiveConfigSet(mdlNames.ASW_Structure,ConfigSet_Sim_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule1,ConfigSet_Sim_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule2,ConfigSet_Sim_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule3,ConfigSet_Sim_ASW.Name);
setActiveConfigSet(mdlNames.SoftwareModule4,ConfigSet_Sim_ASW.Name);

% Detach and reattach the one in base workspace:
detachConfigSet(mdlNames.ASW_Structure,ConfigSet_PIL_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule1,ConfigSet_PIL_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule2,ConfigSet_PIL_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule3,ConfigSet_PIL_ASW.Name);
detachConfigSet(mdlNames.SoftwareModule4,ConfigSet_PIL_ASW.Name);
% Attach config set:
attachConfigSetCopy(mdlNames.ASW_Structure,ConfigSet_PIL_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule1,ConfigSet_PIL_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule2,ConfigSet_PIL_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule3,ConfigSet_PIL_ASW);
attachConfigSetCopy(mdlNames.SoftwareModule4,ConfigSet_PIL_ASW);

%%
%Save all:
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');