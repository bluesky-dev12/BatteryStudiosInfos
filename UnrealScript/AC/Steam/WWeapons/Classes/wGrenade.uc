/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wGrenade.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:18
 *	States:1
 *
 *******************************************************************************/
class wGrenade extends wProjectile;

var float ExplodeTimer;
var bool bCanHitOwner;
var bool bHitWater;
var wEmitter Trail;
var() float DampenFactor;
var() float DampenFactorParallel;
var class<wEmitter> HitEffectClass;
var float LastSparkTime;
var bool bTimerSet;
var bool bExploded;
var float fSpeedCorrectionF;
var float fSpeedCorrectionB;
var Vector LastHitNormal;
var class<TransTrail> TransTrailClass;

simulated function Destroyed()
{
    local int lp1;

    // End:0x24
    if(bExploded == false)
    {
        ExplodeSelf(Location, vect(0.0, 0.0, 1.0));
    }
    // End:0x40
    if(Trail != none)
    {
        Trail.mRegen = false;
    }
    super(Actor).Destroyed();
    lp1 = Level.Grenades.Length - 1;
    J0x5e:
    // End:0xa2 [While If]
    if(lp1 >= 0)
    {
        // End:0x98
        if(Level.Grenades[lp1] == self)
        {
            Level.Grenades.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
}

simulated function PostBeginPlay()
{
    local Rotator R;
    local int diff;

    super.PostBeginPlay();
    // End:0xfc
    if(Role == 4)
    {
        R = Rotation;
        // End:0xab
        if(AimUp())
        {
            R.Pitch = R.Pitch & 65535;
            // End:0x74
            if(R.Pitch > 32768)
            {
                diff = 65536 - R.Pitch;
            }
            // End:0x84
            else
            {
                diff = R.Pitch;
            }
            R.Pitch = R.Pitch + 32768 - diff / 8;
        }
        Velocity = Speed * vector(R);
        R.Yaw = Rotation.Yaw;
        R.Pitch = 0;
        R.Roll = 0;
        SetRotation(R);
        bCanHitOwner = false;
    }
    SetTimer(0.30, false);
    // End:0x171
    if(Role == 4)
    {
        Velocity = Speed * vector(Rotation);
        RandSpin(45000.0);
        bCanHitOwner = false;
        // End:0x171
        if(Instigator.HeadVolume.bWaterVolume)
        {
            bHitWater = true;
            Velocity = 0.60 * Velocity;
        }
    }
    Level.Grenades[Level.Grenades.Length] = self;
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    Level.Grenades[Level.Grenades.Length] = self;
}

function RecoverFromHostChange()
{
    super.RecoverFromHostChange();
}

function bool AimUp()
{
    // End:0x1b
    if(wPlayer(Instigator.Controller) == none)
    {
        return false;
    }
    return wPlayer(Instigator.Controller).bHighBeaconTrajectory;
}

simulated function SetSpeed(float fSpeed)
{
    local Rotator rThrow;
    local float fAddSpeed, fDot;

    Speed = fSpeed;
    rThrow.Pitch = Rotate_Pitch;
    rThrow.Yaw = Rotate_Yaw;
    rThrow.Roll = Rotate_Roll;
    // End:0x88
    if(rThrow != Rotation && rThrow.Pitch != 0 && rThrow.Yaw != 0 && rThrow.Roll != 0)
    {
        SetRotation(rThrow);
    }
    rThrow.Pitch = int(float(rThrow.Pitch) + BaseParams.fProjThrowPitch);
    // End:0x19b
    if(!Instigator.bIsCrouched && !Instigator.bIsProned)
    {
        fAddSpeed = VSize(Instigator.Velocity - Instigator.Velocity.Z * vect(0.0, 0.0, 1.0));
        fAddSpeed = FClamp(fAddSpeed, 0.0, 1000.0);
        fDot = GetInstigatorsDirectionbyDot(Instigator.Rotation, Instigator.Velocity);
        // End:0x179
        if(fDot > 0.10)
        {
            Speed += fAddSpeed * fSpeedCorrectionF;
        }
        // End:0x19b
        else
        {
            // End:0x19b
            if(fDot < 0.10)
            {
                Speed -= fAddSpeed * fSpeedCorrectionB;
            }
        }
    }
    Velocity = Speed * vector(rThrow);
    bCanHitOwner = false;
    // End:0x1ec
    if(Instigator.HeadVolume.bWaterVolume)
    {
        bHitWater = true;
        Velocity = 0.60 * Velocity;
    }
    // End:0x20d
    if(Instigator.Role < 4)
    {
        SetLocation(vHostLocation);
    }
}

simulated function Timer()
{
    // End:0x0f
    if(bExploded)
    {
        Destroy();
    }
    // End:0x77
    else
    {
        // End:0x5f
        if(BaseParams.bBulletLandExplode)
        {
            // End:0x53
            if(Physics != 2)
            {
                Explode(Location, vect(0.0, 0.0, 1.0));
                GotoState('Burning');
            }
            // End:0x5c
            else
            {
                SetTimer(0.10, false);
            }
        }
        // End:0x77
        else
        {
            Explode(Location, vect(0.0, 0.0, 1.0));
        }
    }
}

simulated function Landed(Vector HitNormal)
{
    HitWall(HitNormal, none, none);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x5d
    if(bExplodeCollide && !Other.bWorldGeometry && Other != Instigator || bCanHitOwner)
    {
        Explode(HitLocation, Normal(HitLocation - Other.Location));
    }
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    local Vector VNorm;
    local PlayerController PC;

    // End:0x23
    if(Pawn(Wall) != none && Wall == Instigator)
    {
        return;
    }
    LastHitNormal = HitNormal;
    // End:0x4a
    if(!bTimerSet)
    {
        SetTimer(ExplodeTimer, false);
        bTimerSet = true;
    }
    VNorm = Velocity Dot HitNormal * HitNormal;
    Velocity = -VNorm * DampenFactor + Velocity - VNorm * DampenFactorParallel;
    Velocity = Velocity * BaseParams.fProjDecelEachBound;
    DesiredRotation.Roll = 0;
    RotationRate.Roll = 0;
    Speed = VSize(Velocity);
    // End:0x116
    if(Speed < float(20))
    {
        bBounce = false;
        PrePivot.Z = -1.50;
        SetPhysics(0);
        // End:0x113
        if(Trail != none)
        {
            Trail.mRegen = false;
        }
    }
    // End:0x26a
    else
    {
        // End:0x15c
        if(Level.NetMode != 1 && Speed > float(250))
        {
            PlaySound(ResParams.default.sound_Bullet_Impact, 1,,, 105.0);
        }
        // End:0x188
        else
        {
            bFixedRotationDir = false;
            bRotateToDesired = true;
            DesiredRotation.Pitch = 0;
            RotationRate.Pitch = 50000;
        }
        // End:0x26a
        if(!Level.bDropDetail && Level.DetailMode != 0 && Level.TimeSeconds - LastSparkTime > 0.50 && EffectIsRelevant(Location, false))
        {
            PC = Level.GetLocalPlayerController();
            // End:0x256
            if(PC.ViewTarget != none && VSize(PC.ViewTarget.Location - Location) < float(6000))
            {
                Spawn(HitEffectClass,,, Location, rotator(HitNormal));
            }
            LastSparkTime = Level.TimeSeconds;
        }
    }
    mHitMaterial = HitMaterial;
    mHitActor = Wall;
}

simulated function SpawnEmitter(float timeFactor)
{
    local Emitter ExplodeEmitter;
    local PlayerController PC;

    // End:0x10e
    if(BaseParams.bBulletLandExplode)
    {
        // End:0x10b
        if(Role == 4)
        {
            PC = Level.GetLocalPlayerController();
            // End:0xa4
            if(Instigator == PC.Pawn || Instigator.GetTeamNum() != PC.GetTeamNum())
            {
                ExplodeEmitter = Spawn(ResParams.default.effect_Explosion_enemy, self,, Location, rotator(vect(0.0, 0.0, 1.0)));
            }
            // End:0xd1
            else
            {
                ExplodeEmitter = Spawn(ResParams.default.effect_Explosion, self,, Location, rotator(vect(0.0, 0.0, 1.0)));
            }
            ExplodeEmitter.RemoteRole = 2;
            ExplodeEmitter.SetFadeOutTime(BaseParams.fHitFireTime * timeFactor, 3.0);
        }
    }
    // End:0x12d
    else
    {
        Spawn(GetExplosionClass(),,, Location, rotator(vect(0.0, 0.0, 1.0)));
    }
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    // End:0x19c
    if(!bExploded)
    {
        bExploded = true;
        PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
        // End:0x5d
        if(true)
        {
            SpawnEmitter(1.0);
            Spawn(ExplosionDecal, self,, Location, rotator(-HitNormal));
        }
        // End:0x79
        if(Trail != none)
        {
            Trail.mRegen = false;
        }
        // End:0x9c
        if(BaseParams.fHitFireTime == 0.0)
        {
            BlowUp(Location);
        }
        SetTimer(0.10, false);
        // End:0xd1
        if(Role == 4 && BaseParams.i2ndBulletCount > 0)
        {
            SplashGrenades();
        }
        CombatLog("[EXPLODE_EVENT] WeaponId=" $ string(BaseParams.iWeaponID) $ " HitXCoord=" $ string(HitLocation.X) $ " HitYCoord=" $ string(HitLocation.Y) $ " HitZCoord=" $ string(HitLocation.Z) $ " InRadius=" $ string(BaseParams.fExplRad_Inner) $ " OutRadius=" $ string(BaseParams.fExplRad_Outer));
    }
}

function SplashGrenades()
{
    local int G;
    local wGrenade NewGr;
    local Vector RandV;
    local Rotator RandR;

    G = 0;
    J0x07:
    // End:0x1d3 [While If]
    if(G < BaseParams.i2ndBulletCount)
    {
        NewGr = Spawn(Class, self,, Location);
        // End:0x1c9
        if(NewGr != none)
        {
            RandV = VRand();
            NewGr.fGravMass = BaseParams.fBulletGravity;
            // End:0xd4
            if(Instigator.Controller != none && Instigator.Controller.SkillBase != none && Instigator.Controller.SkillBase.bIncExplosion == true)
            {
                NewGr.bIncExplosion = true;
            }
            // End:0xe5
            else
            {
                NewGr.bIncExplosion = false;
            }
            // End:0x1ac
            if(NewGr.IsA('wGrenade'))
            {
                // End:0x11e
                if(RandV.Z < 0.0)
                {
                    RandV.Z *= -1.0;
                }
                RandR = rotator(RandV);
                NewGr.Rotate_Pitch = RandR.Pitch;
                NewGr.Rotate_Yaw = RandR.Yaw;
                NewGr.Rotate_Roll = RandR.Roll;
                // End:0x1ac
                if(Instigator.Role == 4)
                {
                    NewGr.vHostLocation = NewGr.Location;
                }
            }
            NewGr.iWeaponID = BaseParams.iBombWeaponID;
        }
        ++ G;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    NewGr = Spawn(Class, self,, Location);
    // End:0x334
    if(NewGr != none)
    {
        RandV = VRand();
        NewGr.fGravMass = BaseParams.fBulletGravity;
        // End:0x288
        if(Instigator.Controller != none && Instigator.Controller.SkillBase != none && Instigator.Controller.SkillBase.bIncExplosion == true)
        {
            NewGr.bIncExplosion = true;
        }
        // End:0x299
        else
        {
            NewGr.bIncExplosion = false;
        }
        // End:0x317
        if(NewGr.IsA('wGrenade'))
        {
            NewGr.Rotate_Pitch = 32768;
            NewGr.Rotate_Yaw = 0;
            NewGr.Rotate_Roll = 0;
            // End:0x317
            if(Instigator.Role == 4)
            {
                NewGr.vHostLocation = NewGr.Location;
            }
        }
        NewGr.iWeaponID = BaseParams.iBombWeaponID;
    }
}

simulated function ExplodeSelf(Vector HitLocation, Vector HitNormal)
{
    // End:0x0b
    if(bExploded)
    {
        return;
    }
    PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
    // End:0x69
    if(true)
    {
        Spawn(GetExplosionClass(),,, Location, rotator(vect(0.0, 0.0, 1.0)));
        Spawn(ExplosionDecal, self,, Location, rotator(-HitNormal));
    }
    // End:0x85
    if(Trail != none)
    {
        Trail.mRegen = false;
    }
}

simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x2e
    if(bTakeDamage && Damage > 0)
    {
        // End:0x2e
        if(Role == 4)
        {
            bMustExplode = true;
        }
    }
}

simulated function LoadEmitters()
{
    ExplosionClass_dirt = ResParams.default.effect_Explosion_dirt;
    ExplosionClass_grass = ResParams.default.effect_Explosion_grass;
    ExplosionClass_metal = ResParams.default.effect_Explosion_metal;
    ExplosionClass_snow = ResParams.default.effect_Explosion_snow;
    ExplosionClass_water = ResParams.default.effect_Explosion_water;
    ExplosionClass_wood = ResParams.default.effect_Explosion_wood;
}

simulated function wLoadOut(int iID)
{
    super.wLoadOut(iID);
    // End:0x42
    if(ResParams.default.iCollisionHeight != 0)
    {
        SetCollisionSize(float(ResParams.default.iCollisionRadius), float(ResParams.default.iCollisionHeight));
    }
    SetSpeed(BaseParams.fProjSpeed);
    ExplodeTimer = BaseParams.fFuseTime;
    SetTimer(ExplodeTimer, false);
    LoadEmitters();
    ExplosionDecal = ResParams.default.Proj_ExplosionDecal;
    // End:0xc9
    if(bTimerSet == false && !BaseParams.bBulletLandExplode)
    {
        Trail = Spawn(class'TransTrail', self,, Location, Rotation);
    }
    bTimerSet = true;
}

simulated function SufferEffect(Pawn Victim, float fDist, float fReduceRate)
{
    local float fRangeMiddle, fRangeLerp, fEffDistLerp, fExpRadious_Outer, fExpRadious_Inner;

    super.SufferEffect(Victim, fDist, fReduceRate);
    // End:0x22
    if(Victim == none)
    {
        return;
    }
    // End:0x38
    if(!Victim.IsLocallyControlled())
    {
        return;
    }
    // End:0x7a
    if(bIncExplosion)
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer * 1.30;
        fExpRadious_Inner = BaseParams.fExplRad_Inner * 1.30;
    }
    // End:0xa2
    else
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer;
        fExpRadious_Inner = BaseParams.fExplRad_Inner;
    }
    // End:0x2b5
    if(Victim != none && BaseParams.fHitFlashTime > float(0))
    {
        // End:0x16d
        if(!BaseParams.bHitEffFriendly && Victim != Instigator)
        {
            // End:0x16d
            if(Victim.PlayerReplicationInfo.Team != none && Instigator.PlayerReplicationInfo.Team != none)
            {
                // End:0x16d
                if(Victim.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
                {
                    return;
                }
            }
        }
        // End:0x26d
        if(Victim.Controller != none)
        {
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x1ae
            if(fRangeMiddle == float(0))
            {
                fEffDistLerp = 1.0;
            }
            // End:0x239
            else
            {
                fRangeLerp = FMax(0.0, fDist - fExpRadious_Inner / fRangeMiddle);
                // End:0x22e
                if(BaseParams.fExplDam_Inner != float(0))
                {
                    fEffDistLerp = BaseParams.fExplDam_Inner * float(1) - fRangeLerp + BaseParams.fExplDam_Outer * fRangeLerp / BaseParams.fExplDam_Inner;
                }
                // End:0x239
                else
                {
                    fEffDistLerp = 0.0;
                }
            }
            Victim.Controller.wClientFlash(BaseParams.fHitFlashTime * fEffDistLerp * fReduceRate);
        }
        // End:0x2b5
        if(PlayerController(Victim.Controller) != none)
        {
            PlayerController(Victim.Controller).ClientPlaySound(ResParams.default.sound_Fire_Silencer,,, 0);
        }
    }
    // End:0x402
    if(Victim != none && BaseParams.fHitFreezeTime > float(0))
    {
        // End:0x380
        if(!BaseParams.bHitEffFriendly && Victim != Instigator)
        {
            // End:0x380
            if(Victim.PlayerReplicationInfo.Team != none && Instigator.PlayerReplicationInfo.Team != none)
            {
                // End:0x380
                if(Victim.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
                {
                    return;
                }
            }
        }
        // End:0x3ba
        if(Victim.Controller != none)
        {
            Victim.Controller.wClientFreeze(BaseParams.fHitFreezeTime);
        }
        // End:0x402
        if(PlayerController(Victim.Controller) != none)
        {
            PlayerController(Victim.Controller).ClientPlaySound(ResParams.default.sound_Fire_Silencer,,, 0);
        }
    }
}

state Burning
{
    function RecoverFromHostChange()
    {
        super(wProjectile).RecoverFromHostChange();
        InitBurning(0.50);
        SpawnEmitter(0.50);
    }

    function InitBurning(float timeFactor)
    {
        bBlockZeroExtentTraces = false;
        SetCollisionSize(100.0, 50.0);
        SetTimer(BaseParams.fHitFireTime * timeFactor, false);
    }

    function BeginState()
    {
        InitBurning(1.0);
    }

    function EndState();
    function Timer()
    {
        Destroy();
    }

    simulated event Tick(float DeltaTime)
    {
        local wPawn P;

        // End:0x63
        foreach TouchingActors(class'wPawn', P)
        {
            // End:0x62
            if(P != none && P == Instigator || P.GetTeamNum() != Instigator.GetTeamNum())
            {
                P.SetBurning(true, self);
            }                        
        }
    }

}

defaultproperties
{
    DampenFactor=0.50
    DampenFactorParallel=0.80
    fSpeedCorrectionF=0.3750
    fSpeedCorrectionB=0.3750
    MaxSpeed=1500.0
    TossZ=0.0
    MyDamageType=Class'Engine.wDamageGR'
    MyWeaponType=5
    ExplosionDecal=Class'XEffects.RocketMark'
    fGravMass=5.0
    bAlwaysRelevant=true
    bSkipTimerInChangedHost=true
    AmbientGlow=100
    bUnlit=true
    FluidSurfaceShootStrengthMod=3.0
    bAutoAlignToTerrain=true
    bBounce=true
    bFixedRotationDir=true
    DesiredRotation=(Pitch=12000,Yaw=5666,Roll=2334)
}