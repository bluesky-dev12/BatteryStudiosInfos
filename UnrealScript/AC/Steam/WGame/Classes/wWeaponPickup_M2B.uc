/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wWeaponPickup_M2B.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wWeaponPickup_M2B extends wWeaponPickup_Location;

simulated event PreBeginPlay()
{
    local bool Destroyed;

    // End:0x27
    if(!Level.Game.SpawnWeaponPickupLocations)
    {
        Destroyed = Destroy();
    }
    // End:0xb4
    if(Level.GetMatchMaker() != none)
    {
        // End:0xb4
        if(Level.GetMatchMaker().eWeaponLimit == Level.GetMatchMaker().5 || Level.GetMatchMaker().eWeaponLimit == Level.GetMatchMaker().1)
        {
            Destroyed = Destroy();
        }
    }
    super.PreBeginPlay();
}

defaultproperties
{
    iRepWeaponID=5003
    PickupMessage="You got the M2B"
    PickupForce="weapon M2B"
    DrawType=8
    StaticMesh=StaticMesh'WPS_HW.m2b'
}