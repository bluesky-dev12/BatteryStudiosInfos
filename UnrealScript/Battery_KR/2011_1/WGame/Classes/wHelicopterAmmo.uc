class wHelicopterAmmo extends wRocket;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0x126
    if(bExploded == false)
    {
        PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
        // End:0x126
        if(EffectIsRelevant(Location, false))
        {
            Spawn(ExplosionClass,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xE8
            if(((class_ExplosionCrap != none) && PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            }
            // End:0x126
            if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
            {
                Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
            }
        }
    }
    BlowUp(HitLocation);
    bExploded = true;
    Destroy();
    //return;    
}

defaultproperties
{
    MyDamageType=Class'Engine.wDamageHelicopter'
    MyWeaponType=13
}