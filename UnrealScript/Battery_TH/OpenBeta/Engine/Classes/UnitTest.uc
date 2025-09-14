class UnitTest extends Actor
    notplaceable;

var string PASS;
var string FAIL;
var int MinFunc;
var int MaxFunc;
var array<Actor> PendingDestroyQ;

function FixtureSetup()
{
    //return;    
}

function FixtureTearOff()
{
    //return;    
}

function TestSetup()
{
    //return;    
}

function TestTearOff()
{
    //return;    
}

function string RunUnitTest(int SW)
{
    return "";
    //return;    
}

function string Check(bool Valid, string Msg)
{
    // End:0x19
    if(Valid)
    {
        return PASS @ Msg;        
    }
    else
    {
        return FAIL @ Msg;
    }
    //return;    
}

function Actor EQ(Actor A)
{
    PendingDestroyQ[PendingDestroyQ.Length] = A;
    return A;
    //return;    
}

function DQ()
{
    local Actor A;

    // End:0x25
    foreach IterateActorArray(PendingDestroyQ, Class'Engine_Decompressed.Actor', A)
    {
        A.Destroy();        
    }    
    PendingDestroyQ.Length = 0;
    //return;    
}

defaultproperties
{
    PASS="[PASS]"
    FAIL="[FAIL]"
    MaxFunc=100
}