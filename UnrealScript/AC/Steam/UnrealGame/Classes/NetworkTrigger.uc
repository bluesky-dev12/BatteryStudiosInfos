/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\NetworkTrigger.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
class NetworkTrigger extends Actor
    placeable;

var byte TriggerCount;
var byte OldTriggerCount;
var byte ResetCount;
var byte OldResetCount;
var bool bNotFirstCall;

replication
{
    // Pos:0x00
    reliable if(Role == 4 && bNetDirty)
        TriggerCount, ResetCount;

}

simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    DoClientReset();
    UpdateTriggerCount();
    OldResetCount = ResetCount;
}

simulated function UpdateTriggerCount()
{
    local int i;

    // End:0x43
    if(TriggerCount > OldTriggerCount)
    {
        i = OldTriggerCount;
        J0x20:
        // End:0x43 [While If]
        if(i < TriggerCount)
        {
            Trigger(none, none);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x20;
        }
    }
    OldTriggerCount = TriggerCount;
}

simulated event PostNetReceive()
{
    super.PostNetReceive();
    UpdateTriggerCount();
    // End:0x30
    if(bNotFirstCall && ResetCount > OldResetCount)
    {
        DoClientReset();
    }
    OldResetCount = ResetCount;
    bNotFirstCall = true;
}

simulated function DoClientReset()
{
    local Actor A;

    // End:0x25
    foreach AllActors(class'Actor', A, Event)
    {
        A.Reset();                
    }
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x39
    if(Level.NetMode != 3)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        ++ TriggerCount;
    }
    // End:0x67
    if(Level.NetMode != 1)
    {
        TriggerEvent(Event, Other, EventInstigator);
    }
}

simulated function Reset()
{
    // End:0x41
    if(Level.NetMode != 3)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        ++ ResetCount;
        TriggerCount = 0;
    }
    super.Reset();
}

defaultproperties
{
    bHidden=true
    bNoDelete=true
    bAlwaysRelevant=true
    bReplicateMovement=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.10
    bNetNotify=true
}