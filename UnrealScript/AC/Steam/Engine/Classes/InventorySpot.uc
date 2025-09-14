/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\InventorySpot.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class InventorySpot extends SmallNavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var Pickup markedItem;
var wPickUpBase myPickupBase;
var bool bSuperPickup;

function Actor GetMoveTargetFor(AIController B, float MaxWait)
{
    // End:0x48
    if(markedItem != none && markedItem.ReadyToPickup(MaxWait) && B.Desireability(markedItem) > float(0))
    {
        return markedItem;
    }
    return self;
}

event float DetourWeight(Pawn Other, float PathWeight)
{
    // End:0x3e
    if(markedItem != none && markedItem.ReadyToPickup(0.0))
    {
        return markedItem.DetourWeight(Other, PathWeight);
    }
}

defaultproperties
{
    bCollideWhenPlacing=true
    bHiddenEd=true
}