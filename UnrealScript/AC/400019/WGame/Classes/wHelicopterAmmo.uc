class wHelicopterAmmo extends wRocket;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0x1E4
    if(bExploded == false)
    {
        FmodPlaySound(ResParams.default.fsound_Explosion, 0);
        // End:0x119
        if(EffectIsRelevant(Location, false))
        {
            Spawn(ExplosionClass,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xDB
            if(((class_ExplosionCrap != none) && PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            }
            // End:0x119
            if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
            {
                Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
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
    MyDamageType=Class'Engine.wDamageHelicopter'
    MyWeaponType=13
}