/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\UnitTest.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:8
 *
 *******************************************************************************/
class UnitTest extends Actor
    notplaceable;

var string PASS;
var string FAIL;
var int MinFunc;
var int MaxFunc;
var array<Actor> PendingDestroyQ;

function FixtureSetup();
function FixtureTearOff();
function TestSetup();
function TestTearOff();
function string RunUnitTest(int SW)
{
    return "";
}

function string Check(bool Valid, string Msg)
{
    // End:0x19
    if(Valid)
    {
        return PASS @ Msg;
    }
    // End:0x26
    else
    {
        return FAIL @ Msg;
    }
}

function Actor EQ(Actor A)
{
    PendingDestroyQ[PendingDestroyQ.Length] = A;
    return A;
}

function DQ()
{
    local Actor A;

    // End:0x25
    foreach IterateActorArray(PendingDestroyQ, class'Actor', A)
    {
        A.Destroy();                
    }
    PendingDestroyQ.Length = 0;
}

defaultproperties
{
    PASS="[PASS]"
    FAIL="[FAIL]"
    MaxFunc=100
}