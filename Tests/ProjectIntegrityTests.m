classdef ProjectIntegrityTests < matlab.unittest.TestCase

    methods (TestClassSetup)

        function projectMustBeOpenAndAnalyzed(testCase)
            prj = matlab.project.currentProject;
            testCase.assumeNotEmpty(prj)
            testCase.assertWarningFree(@()updateDependencies(prj));

        end

    end

    methods (Test)

        function shouldPassAllIntegrityChecks(testCase)
            import matlab.unittest.constraints.*
            bdclose all;
            results = table(runChecks(currentProject));
            testCase.verifyThat(EveryElementOf(results.Passed), IsTrue, results.Description(~results.Passed))
        end

    end

end