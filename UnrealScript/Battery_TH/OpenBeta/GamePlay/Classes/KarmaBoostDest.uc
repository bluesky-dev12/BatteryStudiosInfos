class KarmaBoostDest extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force);

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    // End:0x31
    if((Vehicle(Other) == none) || !Vehicle(Other).bCanDoTrickJumps)
    {
        return 10000000;
    }
    return int(-0.5000000 * float(Path.Distance));
    //return;    
}

defaultproperties
{
    bSpecialForced=true
    bVehicleDestination=true
}