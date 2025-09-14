class MasterServerLink extends Info
    transient
    native
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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
native function bool Poll(int WaitTime)
{
    //native.WaitTime;        
}

event GetMasterServer(out string OutAddress, out int OutPort)
{
    local int Index;

    // End:0x7E
    if(ActiveMasterServerList.Length == 0)
    {
        Index = 0;
        J0x13:

        // End:0x7E [Loop If]
        if(Index < MasterServerList.Length)
        {
            ActiveMasterServerList.Length = Index + 1;
            ActiveMasterServerList[Index].Address = MasterServerList[Index].Address;
            ActiveMasterServerList[Index].Port = MasterServerList[Index].Port;
            Index++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    Index = Rand(ActiveMasterServerList.Length);
    LastMSIndex = Index;
    OutAddress = ActiveMasterServerList[Index].Address;
    OutPort = ActiveMasterServerList[Index].Port;
    //return;    
}

simulated function Tick(float Delta)
{
    Poll(0);
    //return;    
}

defaultproperties
{
    LANPort=11777
    LANServerPort=10777
    MasterServerList[0]=(Address="127.0.0.1",Port=28902)
    bAlwaysTick=true
}