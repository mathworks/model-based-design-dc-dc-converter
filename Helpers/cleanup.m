%Copyright 2020 - 2020 The MathWorks, Inc.
%VoltCL_LEDCL_SimscapeAvg_CleanupOnly;
Simulink.sdi.clear;

bdclose('all');
close('all');
cp = currentProject;
% go to project root
cd(cp.RootFolder)   
DeleteContentInFolder(cp.ProjectStartupFolder);

%clean up
clear 
clc