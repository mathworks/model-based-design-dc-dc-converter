% Copyright 2020 - 2020 The MathWorks, Inc.
%% loading results
% try
    load tolerance_results.mat
    close all
    for m=1:4
            %plotting
    
            % 
            figure
            hold on
            grid on
            plot(ToleranceResults.(MeasStructNames(m)).baseline.model.Values,'-b');
            plot(ToleranceResults.(MeasStructNames(m)).sim_min_tol.model.Values,'--r');
            plot(ToleranceResults.(MeasStructNames(m)).sim_max_tol.model.Values,'--m');
            plot(ToleranceResults.(MeasStructNames(m)).sim_Lmax_tol.model.Values,'--g');
            plot(ToleranceResults.(MeasStructNames(m)).sim_Cmax_tol.model.Values,'--c');
            %plot(ToleranceResults.(MeasStructNames(m)).baseline.meas.Values,'-k');

            leg = {'Baseline','All min tol','All max tol','L max, C min','C max, L min','Measurement'};
            legend(leg,'Location','best');
            xlabel('Time [s]');
            ylabel('Voltage SEPIC out [V]');
            ylim([0 max(ToleranceResults.(MeasStructNames(m)).baseline.model.Values)+2]);
    end
    clc
% catch
%     %Measurement Field Names:
%     MeasStructNames = ["Pulse0_40" "Pulse0_50" "Pulse0_61" "Pulse0_65"];
%     
%     % Test harnesses name:
% %     BlockName = "DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/SEPIC_Circuit";
%     BlockName = "DCDC_SEPIC_TopLevelModel/Firmware_Hardware/Hardware_Filter/Simscape/SEPIC/Average_SEPIC";
%     TestHarnessesRootName = "DCDC_SEPIC_SimscapeAvg_";
%     bdclose all
%     mdlName = "DCDC_SEPIC_TopLevelModel";
%     load_system(mdlName);
%     VoltCL_LEDCL_SimscapeAvg;
%     % Type of model:
%     ModelType="Average_SEPIC";
%     %ModelType="SEPIC_Circuit";
%     % Components with tolerance name:
%     IndNames(1) = strcat(ModelType,"/L1");
%     IndNames(2) = strcat(ModelType,"/L2");
%     CapNames(1) = strcat(ModelType,"/C1C13");
%     CapNames(2) = strcat(ModelType,"/C2C3");
%     CapNames(3) = strcat(ModelType,"/C4C5");
%     ResNames(1) = strcat(ModelType,"/R9");
%     ResNames(2) = strcat(ModelType,"/PR1_Load");
%     ToleranceResults=struct;
%     %%
%     iterations = length(MeasStructNames);
% %     iterations = 1;
%     
%     for m=1:iterations
%         %load harnesses:
%         HarnessName = strcat(TestHarnessesRootName,MeasStructNames(m));
%         sltest.harness.load(BlockName,HarnessName);
% 
%         %Disabling tolerance of all components to min, creating baseline:
% 
%         for k=1:length(IndNames)
%             set_param(strcat(HarnessName,"/",IndNames(k)),'enable_L_tol','0');
%         end
%         for k=1:length(CapNames)
%             set_param(strcat(HarnessName,"/",CapNames(k)),'enable_C_tol','0');
%         end
%         for k=1:length(ResNames)
%             set_param(strcat(HarnessName,"/",ResNames(k)),'enable_R_tol','0');
%         end
%         
%         baseline=sim(HarnessName);
%         prov.baseline.meas=baseline.logsout{1};
%         prov.baseline.model =baseline.logsout{3};
%         
%         
%         ToleranceResults=setfield(ToleranceResults,MeasStructNames(m),prov);
%         
%         %%
%         %Setting tolerance of all components to min:
% 
%         for k=1:length(IndNames)
%             set_param(strcat(HarnessName,"/",IndNames(k)),'enable_L_tol','3');
%         end
%         for k=1:length(CapNames)
%             set_param(strcat(HarnessName,"/",CapNames(k)),'enable_C_tol','3');
%         end
%         for k=1:length(ResNames)
%             set_param(strcat(HarnessName,"/",ResNames(k)),'enable_R_tol','3');
%         end
% 
%         sim_min_tol = sim(HarnessName);
%         prov.sim_min_tol.meas=sim_min_tol.logsout{1};
%         prov.sim_min_tol.model =sim_min_tol.logsout{3};
%         
%         
%         ToleranceResults=setfield(ToleranceResults,MeasStructNames(m),prov);
%         %%
%         %Setting tolerance of all components to min:
% 
%         for k=1:length(IndNames)
%             set_param(strcat(HarnessName,"/",IndNames(k)),'enable_L_tol','2');
%         end
%         for k=1:length(CapNames)
%             set_param(strcat(HarnessName,"/",CapNames(k)),'enable_C_tol','2');
%         end
%         for k=1:length(ResNames)
%             set_param(strcat(HarnessName,"/",ResNames(k)),'enable_R_tol','2');
%         end
% 
%         sim_max_tol = sim(HarnessName);
%         prov.sim_max_tol.meas=sim_max_tol.logsout{1};
%         prov.sim_max_tol.model =sim_max_tol.logsout{3};
%         
%         
%         ToleranceResults=setfield(ToleranceResults,MeasStructNames(m),prov);
%         %%
%         %Setting tolerance of ind to max, cap to min:
%         for k=1:length(IndNames)
%             set_param(strcat(HarnessName,"/",IndNames(k)),'enable_L_tol','2');
%         end
%         for k=1:length(CapNames)
%             set_param(strcat(HarnessName,"/",CapNames(k)),'enable_C_tol','3');
%         end
%         for k=1:length(ResNames)
%             set_param(strcat(HarnessName,"/",ResNames(k)),'enable_R_tol','3');
%         end
% 
%         sim_Lmax_tol = sim(HarnessName);
%         prov.sim_Lmax_tol.meas=sim_Lmax_tol.logsout{1};
%         prov.sim_Lmax_tol.model =sim_Lmax_tol.logsout{3};
%         
%         
%         ToleranceResults=setfield(ToleranceResults,MeasStructNames(m),prov);
%         
%         %%
%         %Setting tolerance of ind to max, cap to min:
%         for k=1:length(IndNames)
%             set_param(strcat(HarnessName,"/",IndNames(k)),'enable_L_tol','3');
%         end
%         for k=1:length(CapNames)
%             set_param(strcat(HarnessName,"/",CapNames(k)),'enable_C_tol','2');
%         end
%         for k=1:length(ResNames)
%             set_param(strcat(HarnessName,"/",ResNames(k)),'enable_R_tol','2');
%         end
% 
%         sim_Cmax_tol = sim(HarnessName);
%         prov.sim_Cmax_tol.meas=sim_Cmax_tol.logsout{1};
%         prov.sim_Cmax_tol.model =sim_Cmax_tol.logsout{3};
%         
%        
%         ToleranceResults=setfield(ToleranceResults,MeasStructNames(m),prov);       
%         
%         %Disabling tolerance of all components to min, creating baseline:
% 
%         for k=1:length(IndNames)
%             set_param(strcat(HarnessName,"/",IndNames(k)),'enable_L_tol','0');
%         end
%         for k=1:length(CapNames)
%             set_param(strcat(HarnessName,"/",CapNames(k)),'enable_C_tol','0');
%         end
%         for k=1:length(ResNames)
%             set_param(strcat(HarnessName,"/",ResNames(k)),'enable_R_tol','0');
%         end
%         
%         clear prov
%         sltest.harness.close(mdlName);
%         
%     
% 
% 
% 
%         %% plotting
%         
%         % close all
%         figure
%         hold on
%         grid on
%         plot(ToleranceResults.(MeasStructNames(m)).baseline.model.Values,'-b');
%         plot(ToleranceResults.(MeasStructNames(m)).sim_min_tol.model.Values,'--r');
%         plot(ToleranceResults.(MeasStructNames(m)).sim_max_tol.model.Values,'--m');
%         plot(ToleranceResults.(MeasStructNames(m)).sim_Lmax_tol.model.Values,'--g');
%         plot(ToleranceResults.(MeasStructNames(m)).sim_Cmax_tol.model.Values,'--c');
%     %     plot(ToleranceResults.(MeasStructNames(m)).baseline.meas.Values,'-k');
% 
%         leg = {'Baseline','All min tol','All max tol','L max, C min','C max, L min','Measurement'};
%         legend(leg,'Location','best');
%         xlabel('Time [s]');
%         ylabel('Voltage SEPIC out [V]');
%         ylim([0 max(ToleranceResults.(MeasStructNames(m)).baseline.model.Values)+2]);
%     end
% end