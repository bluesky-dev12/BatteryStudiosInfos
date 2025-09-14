/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wHelicopterAmmo.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wHelicopterAmmo extends wRocket;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0x1f1
    if(bExploded == false)
    {
        PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
        // End:0x126
        if(EffectIsRelevant(Location, false))
        {
            Spawn(ExplosionClass,,, HitLocation + HitNormal * float(20), rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xe8
            if(class_ExplosionCrap != none && PC.ViewTarget != none && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + HitNormal * float(20), rotator(HitNormal));
            }
            // End:0x126
            if(ExplosionDecal != none && Level.NetMode != 1)
            {
                Spawn(ExplosionDecal, self,, Location, rotator(-HitNormal));
            }
        }
        CombatLog("[EXPLODE_EVENT] WeaponId=" $ string(BaseParams.iWeaponID) $ " HitXCoord=" $ string(HitLocation.X) $ " HitYCoord=" $ string(HitLocation.Y) $ " HitZCoord=" $ string(HitLocation.Z) $ " InRadius=" $ string(BaseParams.fExplRad_Inner) $ " OutRadius=" $ string(BaseParams.fExplRad_Outer));
    }
    BlowUp(HitLocation);
    bExploded = true;
    Destroy();
}

defaultproperties
{
    MyDamageType=Class'Engine.wDamageHelicopter'
    MyWeaponType=13
}