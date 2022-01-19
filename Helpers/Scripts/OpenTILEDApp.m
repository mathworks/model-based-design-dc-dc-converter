%Copyright 2020 - 2020 The MathWorks, Inc.

blockPath = 'DCDC_SEPIC_TopLevelModel/User_Interface/ToTILEDs';
set_param(blockPath,'Commented','off');
if ~exist('objLEDs')
  objLEDs = TiLeds();
end