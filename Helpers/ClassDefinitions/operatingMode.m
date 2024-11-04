classdef operatingMode < Simulink.IntEnumType
  enumeration
    NoOutput(0)
    AllOpenLoop(1)
    VoltOpen_CurrClosed(2) 
    VoltClosed_CurrOpen(3)
    AllClosedLoop(4)
    AutomaticOperation(5) 
  end
  methods (Static)
    function retVal = getDefaultValue()
      retVal = operatingMode.NoOutput;
    end
    function retVal = getDescription()
      retVal = 'Various operating mode for the controller - managing opening and closing of controlled loops';
    end
    function retVal = getDataScope()
      retVal = 'Exported';
    end
    function retVal = AddClassNameToEnumNames()
      retVal = true;
    end
  end
end

