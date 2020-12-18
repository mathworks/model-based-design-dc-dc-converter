%Copyright 2020 - 2020 The MathWorks, Inc.

SlPrj = simulinkproject;

prefs.myCacheFolder = fullfile(SlPrj.RootFolder, 'Cache');
prefs.myCodeFolder = fullfile(SlPrj.RootFolder, 'Code');
prefs.myWorkFolder = fullfile(SlPrj.RootFolder, 'Work');

cd(prefs.myWorkFolder);

