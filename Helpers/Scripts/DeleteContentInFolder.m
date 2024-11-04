function DeleteContentInFolder(folderpath,varargin)
% eliminate all files and folder within a target folder, but do not
% eliminate .gitignore files.
% If called with a 1 after the path, the function will delete slxc files as well:

% Examples:
% DeleteContentInFolder(folderpath): delete everything save for .gitignore and
% .slxc files
%
% DeleteContentInFolder(folderpath,1): delete everything save for
% .gitignore files
%
% Copyright 2021 - 2021 The MathWorks, Inc.

slxcFlag = false;
if ~isempty(varargin)
    if varargin{1} == 1
        slxcFlag = true;
    end
end

dinfo = dir(folderpath);

ext = '';

for k=3:1:length(dinfo)
    if dinfo(k).isdir ==1
        try
            rmdir([dinfo(k).folder,filesep,dinfo(k).name],'s');
        end
    else
        if ~strcmp(dinfo(k).name,'.gitignore')
            if ~slxcFlag
                [~,~,ext] = fileparts(dinfo(k).name);
            end
            if ~strcmp(ext,'.slxc') 
                delete([dinfo(k).folder,filesep,dinfo(k).name]);
            end
        end
    end
end
end