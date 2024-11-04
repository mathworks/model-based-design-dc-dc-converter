% Switch to Documentation folder:
cd(cp.RootFolder+filesep+"Documentation"+filesep+"Step by step guide");

% Retrieve all .mlx files:
fileStruct = dir('*.mlx');

% Open, execute and convert all of them:
for k=1:1:length(fileStruct)
    
    %old command pre 22a:
    %matlab.internal.liveeditor.openAndSave(fileStruct(k).name,fileStruct(k).name);
    
    %retrieve file name:
    [filepath,name,ext] = fileparts(fileStruct(k).name);
    %Export to html
    export(fileStruct(k).name, [name,'.html']);
    %old command pre 22a:
    %matlab.internal.liveeditor.openAndConvert(fileStruct(k).name, [name,'.html']);
    disp(['Exporting file nr ',num2str(k),' done!']);
end
clc;
%Go back to work folder
cd(cp.ProjectStartupFolder);