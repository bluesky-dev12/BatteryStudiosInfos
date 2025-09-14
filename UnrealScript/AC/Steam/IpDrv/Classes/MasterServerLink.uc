/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\MasterServerLink.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:6
 *	Functions:3
 *
 *******************************************************************************/
class MasterServerLink extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient;

struct native tMasterServerEntry
{
    var string Address;
    var int Port;
};

var native const transient pointer LinkPtr;
var int LANPort;
var int LANServerPort;
var array<tMasterServerEntry> MasterServerList;
var array<tMasterServerEntry> ActiveMasterServerList;
var int LastMSIndex;

// Export UMasterServerLink::execPoll(FFrame&, void* const)
native function bool Poll(int WaitTime);
event GetMasterServer(out string OutAddress, out int OutPort)
{
    local int Index;

    // End:0x7e
    if(ActiveMasterServerList.Length == 0)
    {
        Index = 0;
        J0x13:
        // End:0x7e [While If]
        if(Index < MasterServerList.Length)
        {
            ActiveMasterServerList.Length = Index + 1;
            ActiveMasterServerList[Index].Address = MasterServerList[Index].Address;
            ActiveMasterServerList[Index].Port = MasterServerList[Index].Port;
            ++ Index;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    Index = Rand(ActiveMasterServerList.Length);
    LastMSIndex = Index;
    OutAddress = ActiveMasterServerList[Index].Address;
    OutPort = ActiveMasterServerList[Index].Port;
}

simulated function Tick(float Delta)
{
    Poll(0);
}

defaultproperties
{
    LANPort=11777
    LANServerPort=10777
    MasterServerList=// Object reference not set to an instance of an object.
    
    bAlwaysTick=true
}