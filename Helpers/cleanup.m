%Copyright 2020 - 2020 The MathWorks, Inc.
bdclose('all');
close('all');

% go to project root
cd(SlPrj.RootFolder)   
DeleteContentInFolder(SlPrj.Information.ProjectStartupFolder);

%clean up
clear 
clc