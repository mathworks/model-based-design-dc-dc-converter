%Copyright 2020 - 2020 The MathWorks, Inc.

%% Specify subsystem to convert
model = 'Sepic_new_closedloop_tune_SC';
sud = [model '/MCU/Software'];
open_system(model);

%% Make and setup the options object
options = fxpOptimizationOptions;
options.AllowableWordLengths = 8:4:64;

% Performance constraints declaration
options.addTolerance([model '/Voltage Division'], 1, 'RelTol', 0.01);

%% Run optimization
result = fxpopt(model, sud, options);

%% explore the best fixed-point design
bestSolution = explore(result);