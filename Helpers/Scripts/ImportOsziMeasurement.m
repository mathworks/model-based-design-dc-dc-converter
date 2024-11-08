%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\VersionControl\Git\TIC2000_DCDC_LED\Data\ExternalMeasurements\Step0_61.CSV
%
% Auto-generated by MATLAB on 13-Feb-2020 10:37:17
% Copyright 2020 - 2020 The MathWorks, Inc.
clear measOszi
close all

measOszi=struct;
FileNameList =["Pulse0_40","Pulse0_50","Pulse0_61","Pulse0_65","Pulse0_40_LED50","Pulse0_50_LED50","Pulse0_61_LED50","Pulse0_65_LED50","Pulse0_61_LED0","Pulse0_61_LED25","Pulse0_61_LED75","Pulse0_61_LED100","Step0_61"];
for k=1:length(FileNameList)
   [time, data] = importOsziMeasFcn(strcat(FileNameList(k),".CSV"));
   measOszi=setfield(measOszi,FileNameList(k),[time data]);
end
clear time data 

%% eliminate outliers
% tiledlayout(length(FileNameList),2)
close all
for k=1:length(FileNameList)
    prov = getfield(measOszi,FileNameList(k));
    ArrayOutliers(:,k) = isoutlier(prov(:,2),'movmean',40);
    plotTitle = regexprep(FileNameList(k),'_','\\_');
    figure
    subplot(2,1,1)
    plot(prov(:,1),ArrayOutliers,'or');
    hold on
    plot(prov(:,1),prov(:,2),'-b');
    ylabel("Volt [V]");
    title(plotTitle);
    hold off
    

    [prov2(:,2), I] = rmoutliers(prov(:,2), 'movmean',40);
    prov2(:,1) = prov(I==0,1);
    subplot(2,1,2)
    plot(prov2(:,1),prov2(:,2));
    ylabel("Volt [V]")
    xlabel("Time [s]")
    
    measOszi = rmfield(measOszi,FileNameList(k));
    measOszi = setfield(measOszi,FileNameList(k),[prov2(:,1) prov2(:,2)]);
    clear prov ArrayOutliers prov2 I
end
%% Signal postprocessing

% finding step time index
close all

clear prov prov2
for k=1:length(FileNameList)
    VoltThresholdStep = 0.02*k;
    VoltScalingFactor = 10;
    
    prov = getfield(measOszi,FileNameList(k));
    TimeStepMeas = prov(2,1)-prov(1,1);
    
    BeforeStepIndexes=(prov(:,2)<VoltThresholdStep);
    
    %volt offset correction:
    AverageOffsetVolt = mean(prov(BeforeStepIndexes,2));
    prov(:,2)=prov(:,2)-AverageOffsetVolt;
    
    %scaling up voltage:
    prov(:,2)=prov(:,2)*VoltScalingFactor;
    
    %time step correction
    %eliminating number up to step:
    [~,StepIndex] = max(~BeforeStepIndexes);
    %rearranging for step at ts = 1e-3 sec:
    TimeOffsetStep = 1e-3;
    NrValues = ceil(TimeOffsetStep/TimeStepMeas);
    TimeOffsetIndex = StepIndex-NrValues;
    if TimeOffsetIndex<=0
        TimeOffsetIndex=1;
    end
    prov2(:,1)=prov(TimeOffsetIndex:end,1);
    prov2(:,2)=prov(TimeOffsetIndex:end,2);
    %Bringing first time value to 0:
    prov2(:,1)=prov2(:,1)-prov2(1,1);
    plotTitle = regexprep(FileNameList(k),'_','\\_');
    figure
    plot(prov2(:,1),prov2(:,2));
    title(plotTitle);
    ylabel("Volt [V]");
    xlabel("Time [s]");
    
    measOszi = rmfield(measOszi,FileNameList(k));
    measOszi = setfield(measOszi,FileNameList(k),[prov2(:,1) prov2(:,2)]);
    
    clear TimeStepMeas prov prov2 TimeOffsetIndex NrValues StepIndex TimeOffsetStep  BeforeStepIndexes VoltThresholdStep VoltScalingFactor AverageOffsetVolt
end



%% smoothdata
close all
