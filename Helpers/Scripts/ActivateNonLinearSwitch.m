%Copyright 2020 - 2020 The MathWorks, Inc.

blockPath = 'DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit/MOSFET';
set_param(blockPath ,'LabelModeActivechoice','MOSFET');
blockPath = 'DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit/Diode';
set_param(blockPath ,'LabelModeActivechoice','ExpDiode');
set_param(bdroot,'Solver','daessc');
save_system(bdroot,'','SaveDirtyReferencedModels','on');
% Updating Mask
ConverterType = '';
if Var_Plant == 0
    if Var_Converter ~=2
        ConverterType = 'Average';
    end
end

TransistorType = 'MOSFET';

LoadType = get_param('DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/Load','LabelModeActivechoice');

set_param([bdroot,'/Firmware_Hardware'],'MaskDisplay',generateMaskDisplaySEPIC(ConverterType,TransistorType,LoadType));
clear LoadType TransistorType ConverterType
      