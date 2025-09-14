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

    Instigator.MakeNoise(1.0000000);
    Weapon.GetViewAxes(X, Y, Z);
    // End:0x6C
    if(Weapon.ThirdPersonActor.IsA('wHeliProjectileAttachment'))
    {
        StartTrace = Weapon.ThirdPersonActor.Location;        
    }
    else
    {
        StartTrace = Instigator.Location + Instigator.EyePosition();
    }
    StartProj = StartTrace + (X * ProjSpawnOffset.X);
    // End:0x104
    if(!Weapon.WeaponCentered())
    {
        StartProj = (StartProj + ((Weapon.Hand * Y) * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
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
        // End:0x21B
        case 1:
            X = Vector(Aim);
            P = 0;
            J0x18E:

            // End:0x218 [Loop If]
            if(P < SpawnCount)
            {
                R.Yaw = int(Spread * (FRand() - 0.5000000));
                R.Pitch = int(Spread * (FRand() - 0.5000000));
                R.Roll = int(Spread * (FRand() - 0.5000000));
                SpawnProjectile(StartProj, Rotator(X >> R));
                P++;
                // [Loop Continue]
                goto J0x18E;
            }
            // End:0x2DB
            break;
        // End:0x2C8
        case 2:
            P = 0;
            J0x227:

            // End:0x2C5 [Loop If]
            if(P < SpawnCount)
            {
                theta = ((Spread * 3.1415927) / float(32768)) * (float(P) - (float(SpawnCount - 1) / 2.0000000));
                X.X = Cos(theta);
                X.Y = Sin(theta);
                X.Z = 0.0000000;
                SpawnProjectile(StartProj, Rotator(X >> Aim));
                P++;
                // [Loop Continue]
                goto J0x227;
            }
            // End:0x2DB
            break;
        // End:0xFFFF
        default:
            SpawnProjectile(StartProj, Aim);
            break;
    }
    //return;    
}

function wProjectile SpawnProjectile(Vector Start, Rotator Dir)
{
    local wProjectile P;

    // End:0x1A7
    if(ProjectileClass != none)
    {
        P = Weapon.Spawn(ProjectileClass,,, Start, Dir);
        // End:0x3B
        if(P == none)
        {
            return none;
        }
        // End:0x71
        if(int(Weapon.WeaponType) == int(13))
        {
            P.MyWeaponType = Weapon.WeaponType;
        }
        P.fGravMass = BaseParams.fBulletGravity;
        // End:0xFE
        if(((Instigator.Controller != none) && Instigator.Controller.SkillBase != none) && Instigator.Controller.SkillBase.bIncExplosion == true)
        {
            P.bIncExplosion = true;            
        }
        else
        {
            P.bIncExplosion = false;
        }
        // End:0x1A7
        if(P.IsA('wGrenade'))
        {
            P.Rotate_Pitch = Dir.Pitch;
            P.Rotate_Yaw = Dir.Yaw;
            P.Rotate_Roll = Dir.Roll;
            // End:0x1A4
            if(int(Instigator.Role) == int(ROLE_Authority))
            {
                P.vHostLocation = P.Location;
            }            
        }
    }
    P.iWeaponID = BaseParams.iWeaponID;
    return P;
    //return;    
}

simulated function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return (((Instigator.Location + Instigator.EyePosition()) + (X * ProjSpawnOffset.X)) + (Y * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
    //return;    
}

defaultproperties
{
    ProjPerFire=1
    ProjSpawnOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
    bLeadTarget=true
    bInstantHit=false
    ProjectileClass=Class'Engine.wProjectile'
    WarnTargetPct=0.5000000
    bMakeRadarNoise=true
}