class UTAmmoPickup extends Ammo;

function RespawnEffect()
{
    Spawn(Class'XEffects.PlayerSpawnEffect');
    //return;    
}

defaultproperties
{
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}