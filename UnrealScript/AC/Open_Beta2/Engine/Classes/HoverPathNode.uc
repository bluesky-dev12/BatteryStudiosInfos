class HoverPathNode extends RoadPathNode
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    // End:0x3F
    if(Other.bCanFly || (Vehicle(Other) != none) && Vehicle(Other).bCanHover)
    {
        return 0;
    }
    return 100000000;
    //return;    
}

defaultproperties
{
    bNotBased=true
    bSpecialForced=true
    bForcedOnly=true
    CollisionHeight=120.0000000
}