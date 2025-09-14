/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wAirStrikeBomb.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wAirStrikeBomb extends wRocket;

simulated function PostBeginPlay()
{
    super(wProjectile).PostBeginPlay();
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0x1b3
    if(bExploded == false)
    {
        PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
        // End:0xe8
        if(EffectIsRelevant(Location, false))
        {
            Spawn(ExplosionClass,,, HitLocation + HitNormal * float(20), rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xe8
            if(class_ExplosionCrap != none && PC.ViewTarget != none && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + HitNormal * float(20), rotator(HitNormal));
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
    MyDamageType=Class'Engine.wDamageAirStrike'
    MyWeaponType=11
}