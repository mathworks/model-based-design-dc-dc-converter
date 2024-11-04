%Copyright 2020 - 2020 The MathWorks, Inc.
clc;
% ParamToSet = 'UnderspecifiedInitializationDetection';
ParamToSet ='FcnCallInpInsideContextMsg';
% ParamValue = 'Simplified';
ParamValue = 'error';
ConfigSetToChange = 'ConfigSet_Sim_ASW';
topLevelAsWell = true;

%ActivateConfigSet:
if topLevelAsWell 
    setActiveConfigSet(mdlNames.topLevel,ConfigSetToChange);
end
%ASWconfig set:
setActiveConfigSet(mdlNames.ASW_Structure,ConfigSetToChange);
setActiveConfigSet(mdlNames.SoftwareModule1,ConfigSetToChange);
setActiveConfigSet(mdlNames.SoftwareModule2,ConfigSetToChange);
setActiveConfigSet(mdlNames.SoftwareModule3,ConfigSetToChange);
setActiveConfigSet(mdlNames.SoftwareModule4,ConfigSetToChange);




if topLevelAsWell
    set_param(mdlNames.topLevel,ParamToSet,ParamValue);
end
%ASWconfig set:
set_param(mdlNames.ASW_Structure,ParamToSet,ParamValue);
set_param(mdlNames.SoftwareModule1,ParamToSet,ParamValue);
set_param(mdlNames.SoftwareModule2,ParamToSet,ParamValue);
set_param(mdlNames.SoftwareModule3,ParamToSet,ParamValue);
set_param(mdlNames.SoftwareModule4,ParamToSet,ParamValue);

%Save all:
save_system(mdlNames.topLevel,'','SaveDirtyReferencedModels','on');
%% save and replace
evalin('base',[ConfigSetToChange,'=getActiveConfigSet(mdlNames.ASW_Structure);']);
save([cp.RootFolder,filesep,'Data',filesep,'VariantConfig',filesep,ConfigSetToChange,'.mat'],ConfigSetToChange);

clear ParamToSet ParamValue ConfigSetToChange topLevelAsWell