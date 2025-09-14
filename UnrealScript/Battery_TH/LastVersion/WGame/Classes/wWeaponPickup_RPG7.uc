class wWeaponPickup_RPG7 extends wWeaponPickup_Location;

simulated event PreBeginPlay()
{
    local bool Destroyed;

    // End:0x27
    if(!Level.Game.SpawnWeaponPickupLocations)
    {
        Destroyed = Destroy();
    }
    // End:0xB4
    if(Level.GetMatchMaker() != none)
    {
        // End:0xB4
        if((int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().5)) || int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().1))
        {
            Destroyed = Destroy();
        }
    }
    super.PreBeginPlay();
    //return;    
}

defaultproperties
{
    iRepWeaponID=5001
    PickupMessage="You got the RPG7"
    PickupForce="weapon RPG7"
    DrawType=8
    StaticMesh=StaticMesh'WPS_HW.ATR'
}