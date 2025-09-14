class TournamentPickUp extends Pickup;

function RespawnEffect()
{
    Spawn(Class'XEffects.PlayerSpawnEffect');
    //return;    
}

defaultproperties
{
    bAmbientGlow=true
    MessageClass=Class'UnrealGame.PickupMessagePlus'
}