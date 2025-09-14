class wGrenade extends wProjectile;

var float ExplodeTimer;
var bool FuseImpactTime;
var bool bCanHitOwner;
var bool bHitWater;
var wEmitter Trail;
var Emitter StartFuseEffect;
var Emitter IdleEffect;
var() float DampenFactor;
var() float DampenFactorParallel;
var Class<wEmitter> HitEffectClass;
var float LastSparkTime;
var bool bTimerSet;
var bool bExploded;
var float fSpeedCorrectionF;
var float fSpeedCorrectionB;
var Vector LastHitNormal;
var Class<TransTrail> TransTrailClass;

simulated function Destroyed()
{
    local int lp1;

    // End:0x24
    if(bExploded == false)
    {
        ExplodeSelf(Location, vect(0.0000000, 0.0000000, 1.0000000));
    }
    // End:0x40
    if(Trail != none)
    {
        Trail.mRegen = false;
    }
    super(Actor).Destroyed();
    lp1 = Level.Grenades.Length - 1;
    J0x5E:

    // End:0xA2 [Loop If]
    if(lp1 >= 0)
    {
        // End:0x98
        if(Level.Grenades[lp1] == self)
        {
            Level.Grenades.Remove(lp1, 1);
        }
        lp1--;
        // [Loop Continue]
        goto J0x5E;
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    SetInit();
    //return;    
}

simulated function SetInit()
{
    local Rotator R;
    local int diff;

    // End:0xF6
    if(int(Role) == int(ROLE_Authority))
    {
        R = Rotation;
        // End:0xA5
        if(AimUp())
        {
            R.Pitch = R.Pitch & 65535;
            // End:0x6E
            if(R.Pitch > 32768)
            {
                diff = 65536 - R.Pitch;                
            }
            else
            {
                diff = R.Pitch;
            }
            R.Pitch = R.Pitch + ((32768 - diff) / 8);
        }
        Velocity = Speed * Vector(R);
        R.Yaw = Rotation.Yaw;
        R.Pitch = 0;
        R.Roll = 0;
        SetRotation(R);
        bCanHitOwner = false;
    }
    SetTimer(0.3000000, false);
    // End:0x16B
    if(int(Role) == int(ROLE_Authority))
    {
        Velocity = Speed * Vector(Rotation);
        RandSpin(45000.0000000);
        bCanHitOwner = false;
        // End:0x16B
        if(Instigator.HeadVolume.bWaterVolume)
        {
            bHitWater = true;
            Velocity = 0.6000000 * Velocity;
        }
    }
    Level.Grenades[Level.Grenades.Length] = self;
    //return;    
}

event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    Level.Grenades[Level.Grenades.Length] = self;
    //return;    
}

function RecoverFromHostChange()
{
    super.RecoverFromHostChange();
    //return;    
}

function bool AimUp()
{
    // End:0x1B
    if(wPlayer(Instigator.Controller) == none)
    {
        return false;
    }
    return wPlayer(Instigator.Controller).bHighBeaconTrajectory;
    //return;    
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
    if((((rThrow != Rotation) && rThrow.Pitch != 0) && rThrow.Yaw != 0) && rThrow.Roll != 0)
    {
        SetRotation(rThrow);
    }
    rThrow.Pitch = int(float(rThrow.Pitch) + BaseParams.fProjThrowPitch);
    // End:0x19B
    if(!Instigator.bIsCrouched && !Instigator.bIsProned)
    {
        fAddSpeed = VSize(Instigator.Velocity - (Instigator.Velocity.Z * vect(0.0000000, 0.0000000, 1.0000000)));
        fAddSpeed = FClamp(fAddSpeed, 0.0000000, 1000.0000000);
        fDot = GetInstigatorsDirectionbyDot(Instigator.Rotation, Instigator.Velocity);
        // End:0x179
        if(fDot > 0.1000000)
        {
            Speed += (fAddSpeed * fSpeedCorrectionF);            
        }
        else
        {
            // End:0x19B
            if(fDot < 0.1000000)
            {
                Speed -= (fAddSpeed * fSpeedCorrectionB);
            }
        }
    }
    Velocity = Speed * Vector(rThrow);
    bCanHitOwner = false;
    // End:0x1EC
    if(Instigator.HeadVolume.bWaterVolume)
    {
        bHitWater = true;
        Velocity = 0.6000000 * Velocity;
    }
    // End:0x20D
    if(int(Instigator.Role) < int(ROLE_Authority))
    {
        SetLocation(vHostLocation);
    }
    //return;    
}

simulated function Timer()
{
    // End:0x0F
    if(bExploded)
    {
        Destroy();        
    }
    else
    {
        // End:0x5F
        if(BaseParams.bBulletLandExplode)
        {
            // End:0x53
            if(int(Physics) != int(2))
            {
                Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
                GotoState('Burning');                
            }
            else
            {
                SetTimer(0.1000000, false);
            }            
        }
        else
        {
            // End:0x80
            if(bTimerSet)
            {
                Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
            }
        }
    }
    //return;    
}

simulated function Landed(Vector HitNormal)
{
    HitWall(HitNormal, none, none);
    //return;    
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x5D
    if((bExplodeCollide && !Other.bWorldGeometry) && (Other != Instigator) || bCanHitOwner)
    {
        Explode(HitLocation, Normal(HitLocation - Other.Location));
    }
    //return;    
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    local Vector VNorm;
    local PlayerController PC;

    // End:0x23
    if((Pawn(Wall) != none) && Wall == Instigator)
    {
        return;
    }
    LastHitNormal = HitNormal;
    StartFuse();
    VNorm = (Velocity Dot HitNormal) * HitNormal;
    Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
    Velocity = Velocity * BaseParams.fProjDecelEachBound;
    DesiredRotation.Roll = 0;
    RotationRate.Roll = 0;
    Speed = VSize(Velocity);
    // End:0x100
    if(Speed < float(20))
    {
        bBounce = false;
        PrePivot.Z = -1.5000000;
        SetPhysics(0);
        // End:0xFD
        if(Trail != none)
        {
            Trail.mRegen = false;
        }        
    }
    else
    {
        // End:0x142
        if((int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(250))
        {
            FmodPlaySound(ResParams.default.fsound_Bullet_Impact, 1);            
        }
        else
        {
            bFixedRotationDir = false;
            bRotateToDesired = true;
            DesiredRotation.Pitch = 0;
            RotationRate.Pitch = 50000;
        }
        // End:0x250
        if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && (Level.TimeSeconds - LastSparkTime) > 0.5000000) && EffectIsRelevant(Location, false))
        {
            PC = Level.GetLocalPlayerController();
            // End:0x23C
            if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(6000))
            {
                Spawn(HitEffectClass,,, Location, Rotator(HitNormal));
            }
            LastSparkTime = Level.TimeSeconds;
        }
    }
    mHitMaterial = HitMaterial;
    mHitActor = Wall;
    //return;    
}

simulated function SpawnEmitter(float timeFactor)
{
    local Emitter ExplodeEmitter;
    local PlayerController PC;
    local Vector emitterLocation;

    // End:0x1D
    if(FuseImpactTime)
    {
        emitterLocation = GetLocateFromNormal(60.0000000);        
    }
    else
    {
        emitterLocation = Location;
    }
    // End:0x136
    if(BaseParams.bBulletLandExplode)
    {
        // End:0x133
        if(int(Role) == int(ROLE_Authority))
        {
            PC = Level.GetLocalPlayerController();
            // End:0xCC
            if((Instigator == PC.Pawn) || Instigator.GetTeamNum() != PC.GetTeamNum())
            {
                ExplodeEmitter = Spawn(ResParams.default.effect_Explosion_enemy, self,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));                
            }
            else
            {
                ExplodeEmitter = Spawn(ResParams.default.effect_Explosion, self,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
            }
            ExplodeEmitter.RemoteRole = ROLE_SimulatedProxy;
            ExplodeEmitter.SetFadeOutTime(BaseParams.fHitFireTime * timeFactor, 3.0000000);
        }        
    }
    else
    {
        Spawn(GetExplosionClass(),,, emitterLocation, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    }
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    // End:0x195
    if(!bExploded)
    {
        bExploded = true;
        StopFuseEffect();
        FmodPlaySound(ResParams.default.fsound_Explosion, 0);
        // End:0x56
        if(true)
        {
            SpawnEmitter(1.0000000);
            Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
        }
        // End:0x72
        if(Trail != none)
        {
            Trail.mRegen = false;
        }
        // End:0x95
        if(BaseParams.fHitFireTime == 0.0000000)
        {
            BlowUp(Location);
        }
        SetTimer(0.1000000, false);
        // End:0xCA
        if((int(Role) == int(ROLE_Authority)) && BaseParams.i2ndBulletCount > 0)
        {
            SplashGrenades();
        }
        CombatLog((((((((((("[EXPLODE_EVENT] WeaponId=" $ string(BaseParams.iWeaponID)) $ " HitXCoord=") $ string(HitLocation.X)) $ " HitYCoord=") $ string(HitLocation.Y)) $ " HitZCoord=") $ string(HitLocation.Z)) $ " InRadius=") $ string(BaseParams.fExplRad_Inner)) $ " OutRadius=") $ string(BaseParams.fExplRad_Outer));
    }
    //return;    
}

function SplashGrenades()
{
    local int G;
    local wGrenade NewGr;
    local Vector RandV;
    local Rotator RandR;

    G = 0;
    J0x07:

    // End:0x1D3 [Loop If]
    if(G < BaseParams.i2ndBulletCount)
    {
        NewGr = Spawn(Class, self,, Location);
        // End:0x1C9
        if(NewGr != none)
        {
            RandV = VRand();
            NewGr.fGravMass = BaseParams.fBulletGravity;
            // End:0xD4
            if(((Instigator.Controller != none) && Instigator.Controller.SkillBase != none) && Instigator.Controller.SkillBase.bIncExplosion == true)
            {
                NewGr.bIncExplosion = true;                
            }
            else
            {
                NewGr.bIncExplosion = false;
            }
            // End:0x1AC
            if(NewGr.IsA('wGrenade'))
            {
                // End:0x11E
                if(RandV.Z < 0.0000000)
                {
                    RandV.Z *= -1.0000000;
                }
                RandR = Rotator(RandV);
                NewGr.Rotate_Pitch = RandR.Pitch;
                NewGr.Rotate_Yaw = RandR.Yaw;
                NewGr.Rotate_Roll = RandR.Roll;
                // End:0x1AC
                if(int(Instigator.Role) == int(ROLE_Authority))
                {
                    NewGr.vHostLocation = NewGr.Location;
                }
            }
            NewGr.iWeaponID = BaseParams.iBombWeaponID;
        }
        G++;
        // [Loop Continue]
        goto J0x07;
    }
    NewGr = Spawn(Class, self,, Location);
    // End:0x334
    if(NewGr != none)
    {
        RandV = VRand();
        NewGr.fGravMass = BaseParams.fBulletGravity;
        // End:0x288
        if(((Instigator.Controller != none) && Instigator.Controller.SkillBase != none) && Instigator.Controller.SkillBase.bIncExplosion == true)
        {
            NewGr.bIncExplosion = true;            
        }
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
            if(int(Instigator.Role) == int(ROLE_Authority))
            {
                NewGr.vHostLocation = NewGr.Location;
            }
        }
        NewGr.iWeaponID = BaseParams.iBombWeaponID;
    }
    //return;    
}

simulated function ExplodeSelf(Vector HitLocation, Vector HitNormal)
{
    // End:0x0B
    if(bExploded)
    {
        return;
    }
    StopFuseEffect();
    FmodPlaySound(ResParams.default.fsound_Explosion, 0);
    // End:0x62
    if(true)
    {
        Spawn(GetExplosionClass(),,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
        Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
    }
    // End:0x7E
    if(Trail != none)
    {
        Trail.mRegen = false;
    }
    //return;    
}

simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x2E
    if(bTakeDamage && Damage > 0)
    {
        // End:0x2E
        if(int(Role) == int(ROLE_Authority))
        {
            bMustExplode = true;
        }
    }
    //return;    
}

simulated function LoadEmitters()
{
    ExplosionClass_dirt = ResParams.default.effect_Explosion_dirt;
    ExplosionClass_grass = ResParams.default.effect_Explosion_grass;
    ExplosionClass_metal = ResParams.default.effect_Explosion_metal;
    ExplosionClass_snow = ResParams.default.effect_Explosion_snow;
    ExplosionClass_water = ResParams.default.effect_Explosion_water;
    ExplosionClass_wood = ResParams.default.effect_Explosion_wood;
    //return;    
}

simulated function wLoadOut(int iID)
{
    super.wLoadOut(iID);
    LoadOutInit();
    //return;    
}

simulated function LoadOutInit()
{
    // End:0x37
    if(ResParams.default.iCollisionHeight != 0)
    {
        SetCollisionSize(float(ResParams.default.iCollisionRadius), float(ResParams.default.iCollisionHeight));
    }
    SetSpeed(BaseParams.fProjSpeed);
    ExplodeTimer = BaseParams.fFuseTime;
    FuseImpactTime = BaseParams.bFuseImpactTime;
    LoadEmitters();
    ExplosionDecal = ResParams.default.Proj_ExplosionDecal;
    // End:0xB7
    if((bTimerSet == false) && !BaseParams.bBulletLandExplode)
    {
        SpawnTrail();
    }
    // End:0xC8
    if(!FuseImpactTime)
    {
        StartFuse();
    }
    //return;    
}

simulated function SpawnTrail()
{
    Trail = Spawn(Class'XEffects.TransTrail', self,, Location, Rotation);
    //return;    
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
    // End:0x7A
    if(bIncExplosion)
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer * 1.3000000;
        fExpRadious_Inner = BaseParams.fExplRad_Inner * 1.3000000;        
    }
    else
    {
        fExpRadious_Outer = BaseParams.fExplRad_Outer;
        fExpRadious_Inner = BaseParams.fExplRad_Inner;
    }
    // End:0x2B5
    if((Victim != none) && BaseParams.fHitFlashTime > float(0))
    {
        // End:0x16D
        if(!BaseParams.bHitEffFriendly && Victim != Instigator)
        {
            // End:0x16D
            if((Victim.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team != none)
            {
                // End:0x16D
                if(Victim.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
                {
                    return;
                }
            }
        }
        // End:0x26D
        if(Victim.Controller != none)
        {
            fRangeMiddle = fExpRadious_Outer - fExpRadious_Inner;
            // End:0x1AE
            if(fRangeMiddle == float(0))
            {
                fEffDistLerp = 1.0000000;                
            }
            else
            {
                fRangeLerp = FMax(0.0000000, (fDist - fExpRadious_Inner) / fRangeMiddle);
                // End:0x22E
                if(BaseParams.fExplDam_Inner != float(0))
                {
                    fEffDistLerp = ((BaseParams.fExplDam_Inner * (float(1) - fRangeLerp)) + (BaseParams.fExplDam_Outer * fRangeLerp)) / BaseParams.fExplDam_Inner;                    
                }
                else
                {
                    fEffDistLerp = 0.0000000;
                }
            }
            Victim.Controller.wClientFlash((BaseParams.fHitFlashTime * fEffDistLerp) * fReduceRate);
        }
        // End:0x2B5
        if(PlayerController(Victim.Controller) != none)
        {
            PlayerController(Victim.Controller).FmodClientPlaySound(ResParams.default.fSound_Fire_Silencer,,, 0);
        }
    }
    // End:0x402
    if((Victim != none) && BaseParams.fHitFreezeTime > float(0))
    {
        // End:0x380
        if(!BaseParams.bHitEffFriendly && Victim != Instigator)
        {
            // End:0x380
            if((Victim.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team != none)
            {
                // End:0x380
                if(Victim.PlayerReplicationInfo.Team.TeamIndex == Instigator.PlayerReplicationInfo.Team.TeamIndex)
                {
                    return;
                }
            }
        }
        // End:0x3BA
        if(Victim.Controller != none)
        {
            Victim.Controller.wClientFreeze(BaseParams.fHitFreezeTime);
        }
        // End:0x402
        if(PlayerController(Victim.Controller) != none)
        {
            PlayerController(Victim.Controller).FmodClientPlaySound(ResParams.default.fSound_Fire_Silencer,,, 0);
        }
    }
    //return;    
}

simulated function StartFuse()
{
    local Vector EffectLocation;

    EffectLocation = GetLocateFromNormal(5.0000000);
    // End:0x7F
    if(!bTimerSet)
    {
        SetTimer(ExplodeTimer, false);
        bTimerSet = true;
        // End:0x44
        if(IdleEffect != none)
        {
            IdleEffect.Destroy();
        }
        StartFuseEffect = Spawn(ResParams.default.effect_StartFuse, self,, EffectLocation, Rotator(LastHitNormal));
        FmodPlaySound(ResParams.default.fsound_Start_Fuse, 1);
    }
    //return;    
}

simulated function StopFuseEffect()
{
    StopLoopSoundByActor();
    // End:0x1D
    if(StartFuseEffect != none)
    {
        StartFuseEffect.Destroy();
    }
    //return;    
}

simulated function Vector GetLocateFromNormal(float Distance)
{
    local Vector resultLocate;

    resultLocate = Location + (LastHitNormal * Distance);
    return resultLocate;
    //return;    
}

state Burning
{
    function RecoverFromHostChange()
    {
        super(wProjectile).RecoverFromHostChange();
        InitBurning(0.5000000);
        SpawnEmitter(0.5000000);
        //return;        
    }

    function InitBurning(float timeFactor)
    {
        bBlockZeroExtentTraces = false;
        SetCollisionSize(100.0000000, 50.0000000);
        SetTimer(BaseParams.fHitFireTime * timeFactor, false);
        //return;        
    }

    function BeginState()
    {
        InitBurning(1.0000000);
        //return;        
    }

    function EndState()
    {
        //return;        
    }

    function Timer()
    {
        Destroy();
        //return;        
    }

    simulated event Tick(float DeltaTime)
    {
        local wPawn P;

        // End:0x1E
        if((Instigator == none) || InstigatorController == none)
        {
            RecoverInstigator();
        }
        // End:0x81
        foreach TouchingActors(Class'WGame.wPawn', P)
        {
            // End:0x80
            if((P != none) && (P == Instigator) || P.GetTeamNum() != Instigator.GetTeamNum())
            {
                P.SetBurning(true, self);
            }            
        }        
        //return;        
    }
    stop;    
}

defaultproperties
{
    DampenFactor=0.5000000
    DampenFactorParallel=0.8000000
    fSpeedCorrectionF=0.3750000
    fSpeedCorrectionB=0.3750000
    MaxSpeed=1500.0000000
    TossZ=0.0000000
    MyDamageType=Class'Engine.wDamageGR'
    MyWeaponType=5
    ExplosionDecal=Class'XEffects.RocketMark'
    fGravMass=5.0000000
    bAlwaysRelevant=true
    bSkipTimerInChangedHost=true
    AmbientGlow=100
    bUnlit=false
    FluidSurfaceShootStrengthMod=3.0000000
    bAutoAlignToTerrain=true
    bBounce=true
    bFixedRotationDir=true
    DesiredRotation=(Pitch=12000,Yaw=5666,Roll=2334)
}