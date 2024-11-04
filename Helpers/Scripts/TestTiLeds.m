%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script: TestTiLeds
% Goal  : Run an instance of groups of LEDs component using the App Designer
% Copyright 2020 - 2020 The MathWorks, Inc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clean session
clear variables; close all force; clc;

% Constant
NB_GROUP = 6;
I_MIN    = 0;
I_MAX    = 100;
I_STEP   = 10;

% Instanciate one component
app = TiLeds();

% Change segments color to black
intensity = 0; % mA current

% Write new values
for m=I_MIN:I_STEP:I_MAX
  for n=1:1:NB_GROUP
    setTiLeds(app,intensity+m,n);
    pause(0.10);
  end
end
