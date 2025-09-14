class InventorySpot extends SmallNavigationPoint
    native
    notplaceable
    hidecategories(Lighting,LightColor,Karma,Force);

var Pickup markedItem;
var wPickUpBase myPickupBase;
var bool bSuperPickup;

function Actor GetMoveTargetFor(AIController B, float MaxWait)
{
    // End:0x48
    if(((markedItem != none) && markedItem.ReadyToPickup(MaxWait)) && B.Desireability(markedItem) > float(0))
    {
        return markedItem;
    }
    return self;
    //return;    
}

event float DetourWeight(Pawn Other, float PathWeight)
{
    // End:0x3E
    if((markedItem != none) && markedItem.ReadyToPickup(0.0000000))
    {
        return markedItem.DetourWeight(Other, PathWeight);
    }
    //return;    
}

defaultproperties
{
    bCollideWhenPlacing=false
    bHiddenEd=true
}