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

    Instigator.MakeNoise(1.0000000);
    Weapon.GetViewAxes(X, Y, Z);
    StartTrace = Instigator.Location + Instigator.EyePosition();
    StartProj = StartTrace;
    // End:0xB4
    if(!Weapon.WeaponCentered())
    {
        StartProj = (StartProj + ((Weapon.Hand * Y) * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
    }
    Aim = AdjustAim(StartProj, AimError);
    MaxRange();
    X = Vector(Aim);
    End = StartProj + (TraceRange * X);
    Other = Weapon.Trace(HitLocation, HitNormal, End, StartProj, false);
    RedMarkEmitter = Spawn(ResParams.default.effect_PointMark,,, HitLocation, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    RedMarkEmitter.RemoteRole = ROLE_SimulatedProxy;
    RedMarkEmitter.SetFadeOutTime(BaseParams.fHitFireTime, 5.0000000);
    HitLocation.Z += 3000.0000000;
    lp1 = 0;
    J0x198:

    // End:0x1D8 [Loop If]
    if(lp1 < 5)
    {
        // End:0x1BD
        if((SpawnProjectile(HitLocation, Aim)) != none)
        {
            // [Explicit Break]
            goto J0x1D8;
        }
        HitLocation.Z += 1000.0000000;
        lp1++;
        // [Loop Continue]
        goto J0x198;
    }
    J0x1D8:

    //return;    
}

defaultproperties
{
    TraceRange=10000.0000000
    Aim_FireAnim="Ads_Fire"
    ProjectileClass=Class'WWeapons_Decompressed.wAirStrikeProjPinpoint'
}