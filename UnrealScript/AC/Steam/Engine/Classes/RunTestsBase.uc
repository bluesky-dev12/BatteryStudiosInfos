/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\RunTestsBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class RunTestsBase extends Actor
    notplaceable;

var array< class<UnitTest> > TestClasses;
var array< class<UnitTest> > FailClasses;
var array<int> FailCase;
var array<string> FailMsg;

function Run()
{
    local int lp1, passes, fails, totalPasses, totalFails;

    dblog("------------------------------------------------------------");
    lp1 = 0;
    J0x4b:
    // End:0x107 [While If]
    if(lp1 < TestClasses.Length)
    {
        // End:0xfd
        if(TestClasses[lp1] != none)
        {
            dblog("Running " $ string(TestClasses[lp1]));
            RunTestClass(TestClasses[lp1], passes, fails);
            dblog("    RESULT>" @ "PASS=" $ string(passes) @ "FAIL=" $ string(fails));
            dblog("");
            totalPasses += passes;
            totalFails += fails;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    dblog("-- FINAL RESULT --------------------------------------------");
    dblog("  +----+");
    // End:0x19e
    if(totalFails == 0)
    {
        dblog("  | OK |" @ "PASS=" $ string(totalPasses) $ " FAIL=" $ string(totalFails));
    }
    // End:0x1d3
    else
    {
        dblog("  |FAIL|" @ "PASS=" $ string(totalPasses) $ " FAIL=" $ string(totalFails));
    }
    dblog("  +----+");
    lp1 = 0;
    J0x1ea:
    // End:0x23f [While If]
    if(lp1 < FailClasses.Length)
    {
        dblog(string(FailClasses[lp1]) $ ", " $ string(FailCase[lp1]) $ ", " $ FailMsg[lp1]);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x1ea;
    }
    dblog("------------------------------------------------------------");
}

function RunTestClass(class<UnitTest> TestClass, out int passes, out int fails)
{
    local int lp1;
    local UnitTest t;
    local string Msg;

    passes = 0;
    fails = 0;
    t = Spawn(TestClass);
    t.FixtureSetup();
    lp1 = t.MinFunc;
    J0x3f:
    // End:0x176 [While If]
    if(lp1 <= t.MaxFunc)
    {
        t.TestSetup();
        Msg = t.RunUnitTest(lp1);
        t.TestTearOff();
        // End:0x16c
        if(Msg != "")
        {
            dblog("    Test " $ string(lp1) $ "> " $ Msg);
            // End:0xe8
            if(StrStartsWith(Msg, t.PASS))
            {
                ++ passes;
            }
            // End:0x16c
            else
            {
                // End:0x10e
                if(StrStartsWith(Msg, t.FAIL))
                {
                    ++ fails;
                }
                // End:0x136
                else
                {
                    dblog("!!!WARNING!!! - msg is malformed");
                }
                FailClasses[FailClasses.Length] = TestClass;
                FailCase[FailCase.Length] = lp1;
                FailMsg[FailMsg.Length] = Msg;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    t.FixtureTearOff();
    t.Destroy();
}
