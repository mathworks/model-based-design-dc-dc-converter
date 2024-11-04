function [stringOut] = generateMaskDisplayAppSoftware(SimMode)
% Copyright 2020 - 2020 The MathWorks, Inc.
%SIL, PIL
stringOut = 'image(''cpu.png'');';

%For converter type:
if strcmp(SimMode,'SIL')
    stringOut = [stringOut,...
    'disp(''Application\nSoftware\nSIL'');'];
elseif strcmp(SimMode,'PIL')
    stringOut = [stringOut,...
    'disp(''Application\nSoftware\nPIL'');'];
else
    stringOut = [stringOut,...
    'disp(''Application\nSoftware'');'];  
end
end

