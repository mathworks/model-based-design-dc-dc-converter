function [stringOut] = generateMaskDisplaySEPIC(ConverterType,TransistorType,LoadType)
% Copyright 2020 - 2020 The MathWorks, Inc.
%GENERATEMASKDISPLAYSEPIC Summary of this function goes here
%   Detailed explanation goes here
%Basic Picture:
stringOut = 'image(''SEPIC_converter_TI_Kit.jpg'');';

%For converter type:
if strcmp(ConverterType,'Average')
    stringOut = [stringOut,...
     'patch([0.42 0.53 0.7 0.595],[0.83 0.89 0.7 0.64], [0.2 0.8 0.3]);',...
     'text(0.505,0.78,''\fontsize{28}AVG'',''texmode'', ''on'');'];
end

if strcmp(ConverterType,'RealHW')
    stringOut = [stringOut,...
     'text(0.05,0.9,''\fontsize{28}Real HW'',''texmode'', ''on'');'];
else 
     stringOut = [stringOut,...
     'text(0.05,0.9,''\fontsize{28}Model'',''texmode'', ''on'');'];
end
%For transistor type:
if ~strcmp(ConverterType,'Average')
    if strcmp(TransistorType,'Ideal')
        stringOut = [stringOut,...
        'plot([0.6 0.7],[0.8 0.85]);',...
        'text(0.7,0.87,''\fontsize{25}Ideal'',''texmode'', ''on'');'];
    elseif strcmp(TransistorType,'MOSFET')
        stringOut = [stringOut,...
        'plot([0.6 0.7],[0.8 0.85]);',...
        'text(0.7,0.87,''\fontsize{25}MOSFET'',''texmode'', ''on'');'];
    end
end
%For loadType:
if strcmp(LoadType,'SixLEDStripsAvg')
    stringOut = [stringOut,...
    'patch([0.39 0.01 0.18 0.6],[0.03 0.63 0.65 0.06], [0.4 0.8 0]);',...
    'text(0.15,0.3,''\fontsize{25}6 LEDs Avg'',''texmode'', ''on'');'];
elseif strcmp(LoadType,'SingleLEDStrip')
    stringOut = [stringOut,...
    'patch([0.39 0.01 0.18 0.6],[0.03 0.63 0.65 0.06], [0.4 0.8 0]);',...
    'text(0.15,0.3,''\fontsize{25}1 LED transistor'',''texmode'', ''on'');'];    
elseif strcmp(LoadType,'SingleLEDStripAvg')
    stringOut = [stringOut,...
    'patch([0.39 0.01 0.18 0.6],[0.03 0.63 0.65 0.06], [0.4 0.8 0]);',...
    'text(0.15,0.3,''\fontsize{25}1 LED Avg'',''texmode'', ''on'');'];       
elseif strcmp(LoadType,'Resistor')
    stringOut = [stringOut,...
    'patch([0.39 0.01 0.18 0.6],[0.03 0.63 0.65 0.06], [0.4 0.8 0]);',...
    'text(0.2,0.3,''\fontsize{25}Resistor'',''texmode'', ''on'');'];
end

end

