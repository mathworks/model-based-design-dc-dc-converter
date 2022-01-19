% Copyright 2020 - 2020 The MathWorks, Inc.

%% PSU:
psu_V = 12.07;

%% SEPIC LV circuit:

L1_Ind = 470; %uH
L1_Res = 0.28; %Ohm
L1_Tol = 15; % percent

L2_Ind = 330; %uH
L2_Res = 0.23; %Ohm
L2_Tol = 15; % percent

Leq12 = L1_Ind*L2_Ind/((L1_Ind+L2_Ind)); % uH

R9_Res = 0.1; % Ohm
R9_Tol = 1; % percent

PR1_Res = 1000; %Ohm %True value 953 Ohm
PR1_Tol = 5; % percent

R7_Res = 10; % Ohm
R7_Tol = 1; % percent

C1C13_Cap = 660; %uF
C1C13_Tol = 20; % percent

C2C3_Cap = 940; %uF
C2C3_Tol = 20; % percent

C4C5_Cap = 940; %uF
C4C5_Tol = 20; % percent

D1_Vf = [0.6 1.45]; % V
D1_If = [0.1 2]; % A
D1_Vr = 600; % V Breakdown Voltage
% D1_Rs = 0.1; % Ohm  The resistance is the fiited slope based on datasheets of the I-V chartacteristic curve of the Diode at high currents
D1_Rs = 0.3117 ; %optimized value
D1_Temp = 25 ; % degC
D1_Ct = 17; % pF
D1_Rz = 0.3; %Ohm Zehner
D1_iRM = -2.4; % A
D1_iFRM=8; % A
D1_rate_iRM = -200; % A/us
D1_Qrr = 25; % s*nA

S1_Rds = 0.22;%Ohm
M1_Rds = 0.22;%Ohm
M1_Ids = 10; %A
M1_Vgs = 10; %V
M1_Temp = 25 ; % degC
M1_Vth = 4; % V
M1_ChL = 0; % Channel Modulation 1/V
M1_Sres = 0.08; % Ohm
M1_Dres = 0.08;% Ohm
M1_Ciss = 2550; %pF
M1_Crss = 27; %pF
M1_Coss = 350;  %pF
M1_DiV = 0.7; % V
M1_DiTime = 50; % ns

%TRANSFER FUNCTIONö
load tfSEPIC.mat
% Efficiency and power losses map:
load EfficiencyPowerLossesMaps.mat


%% LED strips
LED_If =[0.08,0.46];%A
LED_Vf =[2.9,3.3];  %V
LED_Rs = 0.6; %Ohm
LED_Temp = 25; %degC
LED_OptPow = 1.5257; %W/A

MLED_Rds = 3.4; % Ohm
MLED_Vth = 4; % V

CLED_Cap = 330; % uF
CLED_Tol = 20; % percent
CLED_Res = 0.1; %Ohm

%% Battery
Batt_Capacity = 1.5;
Batt_MaxCoulomb = single(Batt_Capacity*3600);
Batt_Initial_SoC = 0.8;
Batt_Em0_LUT = [3.49802912939936;3.56091741962476;3.60629129993097;3.64597944042294;3.67864495990165;3.70726392836539;3.79331855871223;3.87927278890161;3.97348634551089;4.07597210967523;4.19255719702243];
Batt_SoC_LUT =[0:0.1:1]';
Batt_R0 = [0.00808007936239805;0.00845711790112402;0.00824723677363220;0.00835374011340562;0.00842762062937999;0.00786715817805811;0.00792405099109279;0.00800071264126073;0.00815746595570149;0.00813371929789562;0.00795226059050556];
Batt_R1 = [0.00347641510495861;0.00244404093400647;0.00260392223316848;0.00253242019190809;0.00188458442520138;0.00186111543759516;0.00215908943396189;0.00238610741190975;0.00237007590120256;0.00199730950324447;0.00255850027363886];
Batt_Tau1 = [25.6244028723588;36.3791076110509;44.8535035294773;44.8018063307373;36.5495600126981;20.8102726264294;28.0434063124582;41.3066726051343;39.8635523376015;22.8258689023127;37.5631326038348];
Batt_nrCellSeries = 3;



%% Generic Board Parameters:
MCU_Frequency = 90e6;%  Hertz
cycle_time = 1/MCU_Frequency; %sec

%% Hardware Parameters for PWM generation for SEPIC control:

% Desired Control Frequency:
FPWM1= single(100e3); % Hertz
FPWM1_Volt = 12; % Amplitude of PWM stage voltage

% Per documentaiton, the period must be
timer_period_SEPIC =1/(FPWM1*cycle_time)-1;

% sources:
% https://www.mathworks.com/help/releases/R2019b/supportpkg/texasinstrumentsc2000/ref/c280xc2802xc2803xc2805xc2806xc2833xc2834xf28m3xf2807xf2837xdf2837xsf2838xf28004xepwm.html
% Text extract:
% The value entered in clock cycles is used to calculate time-base period (TBPRD) for the ePWM timer register. 
% The period of the ePWM timer, TCTR = (TBPRD + 1) * TBCLK. 
% Where, TCTR is the timer period in seconds, and TBCLK is the time-base clock.

%% Hardware Parameters for PWM generation for LEDs strips control:
FPWMLEDs = 20e3; % Hertz
timer_period_LED = 1/(FPWMLEDs*cycle_time)-1;

% Spreading PWM over the entire period:
NrLEDStrips = 6;
timer_period_LED_phase1 = 0;
timer_period_LED_phase2 = (timer_period_LED+1)/3;
timer_period_LED_phase3 = (timer_period_LED+1)*2/3;
% sources:
% https://www.mathworks.com/help/releases/R2019b/supportpkg/texasinstrumentsc2000/ref/c280xc2802xc2803xc2805xc2806xc2833xc2834xf28m3xf2807xf2837xdf2837xsf2838xf28004xepwm.html
% Text extract:
% The value entered in clock cycles is used to calculate time-base period (TBPRD) for the ePWM timer register. 
% The period of the ePWM timer, TCTR = (TBPRD + 1) * TBCLK. 
% Where, TCTR is the timer period in seconds, and TBCLK is the time-base clock.

%% Current sensor:
load SEPIC_Bit2MilliAmpere_FitObject.mat
% Bit2Ampere_FitObject = 
% 
%      Linear model Poly1:
%      Bit2MilliAmpere_FitObject(x) = p1*x + p2
%      Coefficients (with 95% confidence bounds):
%        p1 =       1.025  (1.01, 1.039)
%        p2 =       82.21  (77.01, 87.4)
Ifb_SEPIC_Offset = single(77);
Ifb_SEPIC_LinearCoeff = single(0.9825 );

% From documentation: 
Rshunt = 0.1; % Ohm
GainAmp = 8.2; %[-]
Vref = 3.3; % V
ADCconv = 2^12; % bit
MilliAmpere = 1e3;
% 
Ifb_SEPIC_LinearCoeff2=single(Vref/ADCconv/Rshunt/GainAmp*MilliAmpere);
Ifb_SEPIC_Offset2=10;

%% Sepic voltage sensor bit2volt
% Using the fit object calculated in the live script VoltageSensorMapping

load SEPIC_Bit2Volt_FitObject.mat

% Bit2Volt_FitObject = 
% 
%      Linear model Poly1:
%      val(x) = p1*x + p2
%      Coefficients (with 95% confidence bounds):
%        p1 =     0.01201  (0.01177, 0.01226)
%        p2 =       0.965  (0.5823, 1.348)


Vfb_SEPIC_Offset = single(Bit2Volt_FitObject.p2);
Vfb_SEPIC_LinearCoeff = single(Bit2Volt_FitObject.p1);

%Using Voltage Divider:
% Vfb_SEPIC_LinearCoeff=single(0.0121797);
% Vfb_SEPIC_Offset=0;

%% Input Voltage Sensor
% Using ovltage divider rule:
Vin_Supply_LinearCoeff= single(3.3/2^12*(47e3/3+820)/820);

%% LED Current Sensor
% From documentation: 
Rshunt = 0.25; % Ohm
GainAmp = 12; %[-]
Vref = 3.3; % V
ADCconv = 2^12; % bit
MilliAmpere = 1e3;

Ifb_LED_LinearCoeff=single(Vref/ADCconv/Rshunt/GainAmp*MilliAmpere);
Ifb_LED_Offset1=7;%mA
Ifb_LED_Offset2=9;%mA
Ifb_LED_Offset3=5;%mA
Ifb_LED_Offset4=1;%mA
Ifb_LED_Offset5=16;%mA
Ifb_LED_Offset6=2;%mA

clear Vref GainAmp Rshunt ADCconv MilliAmpere