/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\PickupMessagePlus.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class PickupMessagePlus extends LocalMessage
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x31
    if(class<Pickup>(OptionalObject) == none)
    {
        return;
    }
    // End:0x67
    if(P.myHUD != none)
    {
        class<Pickup>(OptionalObject).static.UpdateHUD(P.myHUD);
    }
    // End:0x9b
    if(P.bEnablePickupForceFeedback)
    {
        P.ClientPlayForceFeedback(class<Pickup>(OptionalObject).default.PickupForce);
    }
}

defaultproperties
{
    bIsUnique=true
    bFadeMessage=true
    PosY=0.90
}