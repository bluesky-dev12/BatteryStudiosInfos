class wAirStrikeBomb extends wRocket;

simulated function PostBeginPlay()
{
    super(wProjectile).PostBeginPlay();
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0xE8
    if(bExploded == false)
    {
        PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
        // End:0xE8
        if(EffectIsRelevant(Location, false))
        {
            Spawn(ExplosionClass,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xE8
            if(((class_ExplosionCrap != none) && PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
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
    MyDamageType=Class'Engine.wDamageAirStrike'
    MyWeaponType=11
}