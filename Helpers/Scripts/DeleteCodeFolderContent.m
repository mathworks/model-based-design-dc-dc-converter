%Copyright 2020 - 2020 The MathWorks, Inc.
try 
    rmdir(prefs.myCodeFolder,'s');
    mkdir(prefs.myCodeFolder);
end
addPath(SlPrj,prefs.myCodeFolder);