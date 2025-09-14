class wAirStrikeBomb extends wRocket;

simulated function PostBeginPlay()
{
    super(wProjectile).PostBeginPlay();
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0x1A6
    if(bExploded == false)
    {
        FmodPlaySound(ResParams.default.fsound_Explosion, 0);
        // End:0xDB
        if(EffectIsRelevant(Location, false))
        {
            Spawn(ExplosionClass,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xDB
            if(((class_ExplosionCrap != none) && PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            }
        }
        CombatLog((((((((((("[EXPLODE_EVENT] WeaponId=" $ string(BaseParams.iWeaponID)) $ " HitXCoord=") $ string(HitLocation.X)) $ " HitYCoord=") $ string(HitLocation.Y)) $ " HitZCoord=") $ string(HitLocation.Z)) $ " InRadius=") $ string(BaseParams.fExplRad_Inner)) $ " OutRadius=") $ string(BaseParams.fExplRad_Outer));
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