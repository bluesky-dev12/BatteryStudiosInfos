class RunTestsBase extends Actor
    notplaceable;

var array< Class<UnitTest> > TestClasses;
var array< Class<UnitTest> > FailClasses;
var array<int> FailCase;
var array<string> FailMsg;

function Run()
{
    local int lp1, passes, fails, totalPasses, totalFails;

    dblog("------------------------------------------------------------");
    lp1 = 0;
    J0x4B:

    // End:0x107 [Loop If]
    if(lp1 < TestClasses.Length)
    {
        // End:0xFD
        if(TestClasses[lp1] != none)
        {
            dblog("Running " $ string(TestClasses[lp1]));
            RunTestClass(TestClasses[lp1], passes, fails);
            dblog(((("    RESULT>" @ "PASS=") $ string(passes)) @ "FAIL=") $ string(fails));
            dblog("");
            totalPasses += passes;
            totalFails += fails;
        }
        lp1++;
        // [Loop Continue]
        goto J0x4B;
    }
    dblog("-- FINAL RESULT --------------------------------------------");
    dblog("  +----+");
    // End:0x19E
    if(totalFails == 0)
    {
        dblog(((("  | OK |" @ "PASS=") $ string(totalPasses)) $ " FAIL=") $ string(totalFails));        
    }
    else
    {
        dblog(((("  |FAIL|" @ "PASS=") $ string(totalPasses)) $ " FAIL=") $ string(totalFails));
    }
    dblog("  +----+");
    lp1 = 0;
    J0x1EA:

    // End:0x23F [Loop If]
    if(lp1 < FailClasses.Length)
    {
        dblog((((string(FailClasses[lp1]) $ ", ") $ string(FailCase[lp1])) $ ", ") $ FailMsg[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x1EA;
    }
    dblog("------------------------------------------------------------");
    //return;    
}

function RunTestClass(Class<UnitTest> TestClass, out int passes, out int fails)
{
    local int lp1;
    local UnitTest t;
    local string Msg;

    passes = 0;
    fails = 0;
    t = Spawn(TestClass);
    t.FixtureSetup();
    lp1 = t.MinFunc;
    J0x3F:

    // End:0x176 [Loop If]
    if(lp1 <= t.MaxFunc)
    {
        t.TestSetup();
        Msg = t.RunUnitTest(lp1);
        t.TestTearOff();
        // End:0x16C
        if(Msg != "")
        {
            dblog((("    Test " $ string(lp1)) $ "> ") $ Msg);
            // End:0xE8
            if(StrStartsWith(Msg, t.PASS))
            {
                passes++;
                // [Explicit Continue]
                goto J0x16C;
            }
            // End:0x10E
            if(StrStartsWith(Msg, t.FAIL))
            {
                fails++;                
            }
            else
            {
                dblog("!!!WARNING!!! - msg is malformed");
            }
            FailClasses[FailClasses.Length] = TestClass;
            FailCase[FailCase.Length] = lp1;
            FailMsg[FailMsg.Length] = Msg;
        }
        J0x16C:

        lp1++;
        // [Loop Continue]
        goto J0x3F;
    }
    t.FixtureTearOff();
    t.Destroy();
    //return;    
}
