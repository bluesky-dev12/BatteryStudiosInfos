class Security extends Info
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int LastType;
var string LastParams[2];

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ClientMessage, ClientPerform;

    // Pos:0x00D
    reliable if(int(Role) < int(ROLE_Authority))
        ServerCallback;
}

// Export USecurity::execNativePerform(FFrame&, void* const)
native function NativePerform(int SecType, string Param1, string Param2)
{
    //native.SecType;
    //native.Param1;
    //native.Param2;        
}

// Export USecurity::execLocalPerform(FFrame&, void* const)
native function LocalPerform(int SecType, string Param1, string Param2, out array<string> Results)
{
    //native.SecType;
    //native.Param1;
    //native.Param2;
    //native.Results;        
}

simulated function ClientPerform(int SecType, string Param1, string Param2)
{
    NativePerform(SecType, Param1, Param2);
    //return;    
}

event ServerCallback(int SecType, string Data)
{
    SetTimer(0.0000000, false);
    GotoState('None');
    //return;    
}

function Perform(int SecType, string Param1, string Param2, float TimeOut)
{
    LastType = SecType;
    LastParams[0] = Param1;
    LastParams[1] = Param2;
    ClientPerform(SecType, Param1, Param2);
    SetTimer(TimeOut, false);
    GotoState('Probation');
    //return;    
}

function BadClient(int Code, string Data)
{
    ClientMessage(((("The Server has determined that your client is illegal and you have been removed! Code: " $ string(Code)) $ " [") $ Data) $ "]");
    Owner.Destroy();
    Destroy();
    //return;    
}

simulated function ClientMessage(string S)
{
    Log(S, 'Security');
    //return;    
}

state Probation
{
    function Timer()
    {
        BadClient(LastType, (LastParams[0] $ ",") $ LastParams[1]);
        //return;        
    }
    stop;    
}
