% Copyright 2020 - 2020 The MathWorks, Inc.

% Generic Configurations that can vary between board sizes

totLEDStrips = Simulink.Parameter;
totLEDStrips.Value = 6;
totLEDStrips.Unit = '1';
totLEDStrips.Dimensions = [1 1];
totLEDStrips.DataType = 'uint8';
totLEDStrips.Min = 1;
totLEDStrips.Max = 10;
totLEDStrips.CoderInfo.StorageClass = 'ExportedGlobal';
totLEDStrips.Description = 'This number indicates the total number of LED strips present in the hardware demo. The standard board has 6 LEDs strips';

voltSEPICMax = Simulink.Parameter;
voltSEPICMax.Value = 20.4;
voltSEPICMax.Unit = 'V';
voltSEPICMax.Dimensions = [1 1];
voltSEPICMax.DataType = 'single';
voltSEPICMax.Min = 9;
voltSEPICMax.Max = 42;
voltSEPICMax.CoderInfo.StorageClass = 'ExportedGlobal';
voltSEPICMax.Description = 'Maximum voltage output of the SEPIC converter for the provided LED strips';

voltSEPICMin = Simulink.Parameter;
voltSEPICMin.Value = 16.8;
voltSEPICMin.Unit = 'V';
voltSEPICMin.Dimensions = [1 1];
voltSEPICMin.DataType = 'single';
voltSEPICMin.Min = 9;
voltSEPICMin.Max = 42;
voltSEPICMin.CoderInfo.StorageClass = 'ExportedGlobal';
voltSEPICMin.Description = 'Minimum voltage output of the SEPIC converter for the provided LED strips';

currLEDMax = Simulink.Parameter;
currLEDMax.Value = 1000;
currLEDMax.Unit = 'mA';
currLEDMax.Dimensions = [1 1];
currLEDMax.DataType = 'single';
currLEDMax.Min = 0;
currLEDMax.Max = 1000;
currLEDMax.CoderInfo.StorageClass = 'ExportedGlobal';
currLEDMax.Description = 'Maximum current through one LED strip';

dcpwmSEPICMax = Simulink.Parameter;
dcpwmSEPICMax.Value = 0.95;
dcpwmSEPICMax.Unit = '1';
dcpwmSEPICMax.Dimensions = [1 1];
dcpwmSEPICMax.DataType = 'single';
dcpwmSEPICMax.Min = 0;
dcpwmSEPICMax.Max = 1;
dcpwmSEPICMax.CoderInfo.StorageClass = 'ExportedGlobal';
dcpwmSEPICMax.Description = 'Maximum duty cycle for the PWM driving the SEPIC power stage';

dcpwmLEDMax = Simulink.Parameter;
dcpwmLEDMax.Value = 1;
dcpwmLEDMax.Unit = '1';
dcpwmLEDMax.Dimensions = [1 1];
dcpwmLEDMax.DataType = 'single';
dcpwmLEDMax.Min = 0;
dcpwmLEDMax.Max = 1;
dcpwmLEDMax.CoderInfo.StorageClass = 'ExportedGlobal';
dcpwmLEDMax.Description = 'Maximum duty cycle for the PWM driving the LEDs';

powerPSUMax = Simulink.Parameter;
powerPSUMax.Value = 18;
powerPSUMax.Unit = 'Watt';
powerPSUMax.Dimensions = [1 1];
powerPSUMax.DataType = 'single';
powerPSUMax.Min = 0;
powerPSUMax.Max = 1;
powerPSUMax.CoderInfo.StorageClass = 'ExportedGlobal';
powerPSUMax.Description = 'Maximum power allowed by the power supply unit (PSU)';