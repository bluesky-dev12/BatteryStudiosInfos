/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wPinpointBombFire.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class wPinpointBombFire extends wAirStrikeFire;

var float TraceRange;
var name Aim_FireAnim;

function DoFireEffect()
{
    local int lp1;
    local Vector StartProj, StartTrace, X, Y, Z, End;

    local Rotator Aim;
    local Vector HitLocation, HitNormal;
    local Actor Other;
    local Emitter RedMarkEmitter;

    Instigator.MakeNoise(1.0);
    Weapon.GetViewAxes(X, Y, Z);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    StartProj = StartTrace;
    // End:0xb4
    if(!Weapon.WeaponCentered())
    {
        StartProj = StartProj + Weapon.Hand * Y * ProjSpawnOffset.Y + Z * ProjSpawnOffset.Z;
    }
    Aim = AdjustAim(StartProj, AimError);
    MaxRange();
    X = vector(Aim);
    End = StartProj + TraceRange * X;
    Other = Weapon.Trace(HitLocation, HitNormal, End, StartProj, false);
    RedMarkEmitter = Spawn(ResParams.default.effect_PointMark,,, HitLocation, rotator(vect(0.0, 0.0, 1.0)));
    RedMarkEmitter.RemoteRole = 2;
    RedMarkEmitter.SetFadeOutTime(BaseParams.fHitFireTime, 5.0);
    HitLocation.Z += 3000.0;
    lp1 = 0;
    J0x198:
    // End:0x1d8 [While If]
    if(lp1 < 5)
    {
        // End:0x1bd
        if(SpawnProjectile(HitLocation, Aim) != none)
        {
        }
        // End:0x1d8
        else
        {
            HitLocation.Z += 1000.0;
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x198;
        }
    }
}

defaultproperties
{
    TraceRange=10000.0
    Aim_FireAnim=Ads_Fire
    ProjectileClass=class'wAirStrikeProjPinpoint'
}