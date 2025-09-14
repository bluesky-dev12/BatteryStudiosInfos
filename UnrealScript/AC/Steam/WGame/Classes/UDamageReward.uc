/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UDamageReward.uc
 * Package Imports:
 *	WGame
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *	States:2
 *
 *******************************************************************************/
class UDamageReward extends UDamagePack;

var() float FadeTime;

function InitDrop(float RemainingCharge)
{
    FadeTime = RemainingCharge + Level.TimeSeconds;
    SetPhysics(2);
    GotoState('FallingPickup');
    bAlwaysRelevant = false;
    bDropped = true;
    bIgnoreEncroachers = false;
    bIgnoreVehicles = true;
    MaxDesireability *= RemainingCharge / float(30);
    NetUpdateFrequency = RemainingCharge;
    bUpdateSimulatedPosition = true;
    bOnlyReplicateHidden = false;
    LifeSpan = RemainingCharge * float(2);
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x1f
        if(ValidTouch(Other))
        {
            AnnouncePickup(P);
            SetRespawn();
        }
    }

    function BeginState()
    {
        // End:0x22
        if(bDropped)
        {
            SetTimer(FadeTime - Level.TimeSeconds, false);
        }
    }

}

state FallingPickup
{
    function BeginState()
    {
        SetTimer(FadeTime - Level.TimeSeconds, false);
    }

}

defaultproperties
{
    RespawnTime=0.0
}