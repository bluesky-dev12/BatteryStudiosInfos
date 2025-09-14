/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Security.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *	States:1
 *
 *******************************************************************************/
class Security extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var int LastType;
var string LastParams[2];

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        ClientPerform, ClientMessage;

    // Pos:0x0d
    reliable if(Role < 4)
        ServerCallback;

}

// Export USecurity::execNativePerform(FFrame&, void* const)
native function NativePerform(int SecType, string Param1, string Param2);
// Export USecurity::execLocalPerform(FFrame&, void* const)
native function LocalPerform(int SecType, string Param1, string Param2, out array<string> Results);
simulated function ClientPerform(int SecType, string Param1, string Param2)
{
    NativePerform(SecType, Param1, Param2);
}

event ServerCallback(int SecType, string Data)
{
    SetTimer(0.0, false);
    GotoState('None');
}

function Perform(int SecType, string Param1, string Param2, float TimeOut)
{
    LastType = SecType;
    LastParams[0] = Param1;
    LastParams[1] = Param2;
    ClientPerform(SecType, Param1, Param2);
    SetTimer(TimeOut, false);
    GotoState('Probation');
}

function BadClient(int Code, string Data)
{
    ClientMessage("The Server has determined that your client is illegal and you have been removed! Code: " $ string(Code) $ " [" $ Data $ "]");
    Owner.Destroy();
    Destroy();
}

simulated function ClientMessage(string S)
{
    Log(S, 'Security');
}

state Probation
{
    function Timer()
    {
        BadClient(LastType, LastParams[0] $ "," $ LastParams[1]);
    }

}
