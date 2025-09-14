class NetworkEmitter extends Emitter;

var byte TriggerCount;
var byte OldTriggerCount;
var byte ResetCount;
var byte OldResetCount;
var bool bNotFirstCall;

replication
{
    // Pos:0x000
    reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
        ResetCount, TriggerCount;
}

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    Reset();
    UpdateTriggerCount();
    OldResetCount = ResetCount;
    //return;    
}

simulated function UpdateTriggerCount()
{
    local int i;

    // End:0x43
    if(int(TriggerCount) > int(OldTriggerCount))
    {
        i = int(OldTriggerCount);
        J0x20:

        // End:0x43 [Loop If]
        if(i < int(TriggerCount))
        {
            Trigger(none, none);
            i++;
            // [Loop Continue]
            goto J0x20;
        }
    }
    OldTriggerCount = TriggerCount;
    //return;    
}

simulated event PostNetReceive()
{
    super(Actor).PostNetReceive();
    UpdateTriggerCount();
    // End:0x30
    if(bNotFirstCall && int(ResetCount) > int(OldResetCount))
    {
        Reset();
    }
    OldResetCount = ResetCount;
    bNotFirstCall = true;
    //return;    
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    local int i;

    // End:0x39
    if(int(Level.NetMode) != int(NM_Client))
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        TriggerCount++;
    }
    // End:0x99
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        i = 0;
        J0x59:

        // End:0x99 [Loop If]
        if(i < Emitters.Length)
        {
            // End:0x8F
            if(Emitters[i] != none)
            {
                Emitters[i].Trigger();
            }
            i++;
            // [Loop Continue]
            goto J0x59;
        }
    }
    //return;    
}

simulated function Reset()
{
    // End:0x41
    if(int(Level.NetMode) != int(NM_Client))
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        ResetCount++;
        TriggerCount = 0;
    }
    super.Reset();
    //return;    
}

defaultproperties
{
    bAlwaysRelevant=true
    bReplicateMovement=false
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    RemoteRole=1
    NetUpdateFrequency=0.1000000
    bNetNotify=true
}