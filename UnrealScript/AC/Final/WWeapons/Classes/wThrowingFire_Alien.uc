class wThrowingFire_Alien extends wThrowingFire;

function wProjectile SpawnProjectile(Vector Start, Rotator Dir)
{
    Dir.Pitch = 0;
    Dir.Roll = 0;
    return super(wProjectileFire).SpawnProjectile(Start, Dir);
    //return;    
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return (((Instigator.Location + Instigator.EyePosition()) + (X * ProjSpawnOffset.X)) + (Y * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
    //return;    
}

defaultproperties
{
    ProjectileClass=Class'WWeapons_Decompressed.wGrenade_Alien'
}