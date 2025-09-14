class NetworkTrigger extends Actor
    placeable;

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
    super.PostNetBeginPlay();
    DoClientReset();
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
    super.PostNetReceive();
    UpdateTriggerCount();
    // End:0x30
    if(bNotFirstCall && int(ResetCount) > int(OldResetCount))
    {
        DoClientReset();
    }
    OldResetCount = ResetCount;
    bNotFirstCall = true;
    //return;    
}

simulated function DoClientReset()
{
    local Actor A;

    // End:0x25
    foreach AllActors(Class'Engine.Actor', A, Event)
    {
        A.Reset();        
    }    
    //return;    
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x39
    if(int(Level.NetMode) != int(NM_Client))
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        TriggerCount++;
    }
    // End:0x67
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        TriggerEvent(Event, Other, EventInstigator);
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
    bHidden=true
    bNoDelete=true
    bAlwaysRelevant=true
    bReplicateMovement=false
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1000000
    bNetNotify=true
}