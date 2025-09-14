/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\KarmaBoostDest.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class KarmaBoostDest extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force);

event int SpecialCost(Pawn Other, ReachSpec Path)
{
    // End:0x31
    if(Vehicle(Other) == none || !Vehicle(Other).bCanDoTrickJumps)
    {
        return 10000000;
    }
    return int(-0.50 * float(Path.Distance));
}

defaultproperties
{
    bSpecialForced=true
    bVehicleDestination=true
}