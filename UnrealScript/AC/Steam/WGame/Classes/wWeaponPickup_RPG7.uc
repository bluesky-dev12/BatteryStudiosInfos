/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wWeaponPickup_RPG7.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wWeaponPickup_RPG7 extends wWeaponPickup_Location;

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
    iRepWeaponID=5001
    PickupMessage="You got the RPG7"
    PickupForce="weapon RPG7"
    DrawType=8
    StaticMesh=StaticMesh'WPS_HW.ATR'
}