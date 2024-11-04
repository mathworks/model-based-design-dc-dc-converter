%Copyright 2020 - 2020 The MathWorks, Inc.

%Variant configuration:
Var_Converter = 2;
Var_Plant = 0;

blockPath = 'DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit/MOSFET';
set_param(blockPath ,'LabelModeActivechoice','Ideal');
blockPath = 'DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit/Diode';
set_param(blockPath ,'LabelModeActivechoice','PiecewiseLinear');

% Updating Mask
ConverterType = '';
if Var_Plant == 0
    if Var_Converter ~=2 
        ConverterType = 'Average';
    end
end

TransistorType = 'Ideal';

LoadType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load','LabelModeActivechoice');

set_param([mdlNames.topLevel,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC(ConverterType,TransistorType,LoadType));
clear LoadType TransistorType ConverterType
            
