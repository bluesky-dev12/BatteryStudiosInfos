/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\UTWeaponPickup.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *	States:1
 *
 *******************************************************************************/
class UTWeaponPickup extends WeaponPickup;

var(WeaponPickup) Vector StandUp;
var(WeaponPickup) float LockerOffset;

simulated event ClientTrigger()
{
    bHidden = true;
    // End:0x4a
    if(EffectIsRelevant(Location, false) && !Level.GetLocalPlayerController().BeyondViewDistance(Location, CullDistance))
    {
        Spawn(class'WeaponFadeEffect', self);
    }
}

function RespawnEffect()
{
    Spawn(class'PlayerSpawnEffect');
}

state FadeOut
{
    function Tick(float DeltaTime)
    {
        Disable('Tick');
    }

    function BeginState()
    {
        bHidden = true;
        LifeSpan = 1.0;
        bClientTrigger = !bClientTrigger;
        // End:0x41
        if(Level.NetMode != 1)
        {
            ClientTrigger();
        }
    }

}

defaultproperties
{
    StandUp=(X=0.0,Y=0.0,Z=0.750)
    LockerOffset=35.0
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}