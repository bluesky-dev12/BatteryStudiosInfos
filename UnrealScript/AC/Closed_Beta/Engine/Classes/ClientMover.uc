class ClientMover extends Mover
    notplaceable;

function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x34
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        GotoState('ServerIdle');
        SetTimer(0.0000000, false);
        SetPhysics(NM_Standalone);
    }
    //return;    
}

state ServerIdle
{    stop;    
}

defaultproperties
{
    bAlwaysRelevant=false
    RemoteRole=0
    bClientAuthoritative=true
}