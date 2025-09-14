/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\HoverPathNode.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class HoverPathNode extends RoadPathNode
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    // End:0x3f
    if(Other.bCanFly || Vehicle(Other) != none && Vehicle(Other).bCanHover)
    {
        return 0;
    }
    return 100000000;
}

defaultproperties
{
    bNotBased=true
    bSpecialForced=true
    bForcedOnly=true
    CollisionHeight=120.0
}