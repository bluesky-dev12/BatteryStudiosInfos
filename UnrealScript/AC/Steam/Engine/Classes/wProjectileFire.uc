/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wProjectileFire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class wProjectileFire extends wWeaponFire;

var() int ProjPerFire;
var() Vector ProjSpawnOffset;

function DoFireEffect()
{
    local Vector StartProj, StartTrace, X, Y, Z;

    local Rotator R, Aim;
    local Vector HitLocation, HitNormal;
    local Actor Other;
    local int P, SpawnCount;
    local float theta;

    Instigator.MakeNoise(1.0);
    Weapon.GetViewAxes(X, Y, Z);
    // End:0x6c
    if(Weapon.ThirdPersonActor.IsA('wHeliProjectileAttachment'))
    {
        StartTrace = Weapon.ThirdPersonActor.Location;
    }
    // End:0x91
    else
    {
        StartTrace = Instigator.Location + Instigator.EyePosition();
    }
    StartProj = StartTrace + X * ProjSpawnOffset.X;
    // End:0x104
    if(!Weapon.WeaponCentered())
    {
        StartProj = StartProj + Weapon.Hand * Y * ProjSpawnOffset.Y + Z * ProjSpawnOffset.Z;
    }
    Other = Weapon.Trace(HitLocation, HitNormal, StartProj, StartTrace, false);
    // End:0x141
    if(Other != none)
    {
        StartProj = HitLocation;
    }
    Aim = AdjustAim(StartProj, AimError);
    SpawnCount = Max(1, ProjPerFire * int(Load));
    switch(SpreadStyle)
    {
        // End:0x21b
        case 1:
            X = vector(Aim);
            P = 0;
            J0x18e:
            // End:0x218 [While If]
            if(P < SpawnCount)
            {
                R.Yaw = int(Spread * FRand() - 0.50);
                R.Pitch = int(Spread * FRand() - 0.50);
                R.Roll = int(Spread * FRand() - 0.50);
                SpawnProjectile(StartProj, rotator(X >> R));
                ++ P;
                // This is an implied JumpToken; Continue!
                goto J0x18e;
            }
            // End:0x2db
            break;
        // End:0x2c8
        case 2:
            P = 0;
            J0x227:
            // End:0x2c5 [While If]
            if(P < SpawnCount)
            {
                theta = Spread * 3.1415930 / float(32768) * float(P) - float(SpawnCount - 1) / 2.0;
                X.X = Cos(theta);
                X.Y = Sin(theta);
                X.Z = 0.0;
                SpawnProjectile(StartProj, rotator(X >> Aim));
                ++ P;
                // This is an implied JumpToken; Continue!
                goto J0x227;
            }
            // End:0x2db
            break;
        // End:0xffff
        default:
            SpawnProjectile(StartProj, Aim);
}

function wProjectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local wProjectile P;

    // End:0x1a7
    if(ProjectileClass != none)
    {
        P = Weapon.Spawn(ProjectileClass,,, Start, Dir);
        // End:0x3b
        if(P == none)
        {
            return none;
        }
        // End:0x71
        if(Weapon.WeaponType == 13)
        {
            P.MyWeaponType = Weapon.WeaponType;
        }
        P.fGravMass = BaseParams.fBulletGravity;
        // End:0xfe
        if(Instigator.Controller != none && Instigator.Controller.SkillBase != none && Instigator.Controller.SkillBase.bIncExplosion == true)
        {
            P.bIncExplosion = true;
        }
        // End:0x10f
        else
        {
            P.bIncExplosion = false;
        }
        // End:0x1a7
        if(P.IsA('wGrenade'))
        {
            P.Rotate_Pitch = Dir.Pitch;
            P.Rotate_Yaw = Dir.Yaw;
            P.Rotate_Roll = Dir.Roll;
            // End:0x1a4
            if(Instigator.Role == 4)
            {
                P.vHostLocation = P.Location;
            }
        }
        // End:0x1a7
        else
        {
        }
    }
    P.iWeaponID = BaseParams.iWeaponID;
    return P;
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Instigator.Location + Instigator.EyePosition() + X * ProjSpawnOffset.X + Y * ProjSpawnOffset.Y + Z * ProjSpawnOffset.Z;
}

defaultproperties
{
    ProjPerFire=1
    ProjSpawnOffset=(X=0.0,Y=0.0,Z=-10.0)
    bLeadTarget=true
    bInstantHit=true
    ProjectileClass=class'wProjectile'
    WarnTargetPct=0.50
    bMakeRadarNoise=true
}