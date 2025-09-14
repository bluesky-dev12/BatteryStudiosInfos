/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\NetworkEmitter.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:5
 *
 *******************************************************************************/
class NetworkEmitter extends Emitter;

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
    super(Actor).PostNetBeginPlay();
    Reset();
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
    super(Actor).PostNetReceive();
    UpdateTriggerCount();
    // End:0x30
    if(bNotFirstCall && ResetCount > OldResetCount)
    {
        Reset();
    }
    OldResetCount = ResetCount;
    bNotFirstCall = true;
}

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
    local int i;

    // End:0x39
    if(Level.NetMode != 3)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        ++ TriggerCount;
    }
    // End:0x99
    if(Level.NetMode != 1)
    {
        i = 0;
        J0x59:
        // End:0x99 [While If]
        if(i < Emitters.Length)
        {
            // End:0x8f
            if(Emitters[i] != none)
            {
                Emitters[i].Trigger();
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x59;
        }
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
    bAlwaysRelevant=true
    bReplicateMovement=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    RemoteRole=1
    NetUpdateFrequency=0.10
    bNetNotify=true
}