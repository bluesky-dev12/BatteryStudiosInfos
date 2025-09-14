class wDefenceBoss extends wMonster
    config(User);

var bool bStinging;
var FireProperties SavedFireProperties_2;
var Class<wAmmunition> AmmunitionClass_2;
var wAmmunition MyAmmo_2;
var FireProperties SavedFireProperties_3;
var Class<wAmmunition> AmmunitionClass_3;
var wAmmunition MyAmmo_3;
var() config int iRocketFireCount;
var float fRocketFireTime;
var float fBeamFireTime;
var() config float fRocketFireDelay;
var() config float fBeamFireDelay;
var() config int iMeleeDamage;
var() config int iLastMeleeDamage;
var() config float fLastChargingSpeed;
var float fTryChargingDist;
var float fChangeAttackTypeTime;
var bool bReadySeekingRocket;
var float fPrevHPPercent;
var float fNextActivePercent;
var Class<Emitter> SpawnEffectExplosion;
var Emitter PrepareBeamEffect;
var Emitter LastChagingEffect;
var Emitter RocketFireEffect;
var bool bFinalAttackMode;
var string SoundBeamAction;
var string SoundRocketAction;
var string SoundMeleeAction;
var name BeamAnim;
var name RocketAnim;
var name MeleeAnim;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        bFinalAttackMode;
}

static function NavigationPoint GetFlyingPathNode(LevelInfo Level, int idx, optional int RegenLoc)
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:

    // End:0x8E [Loop If]
    if(N != none)
    {
        // End:0x77
        if((N.IsA('FlyingPathNode') && FlyingPathNode(N).iPathPoint == idx) && FlyingPathNode(N).RegenLoc == RegenLoc)
        {
            return N;
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

static function wDefenceBoss Create(LevelInfo Level, byte TeamNum, int Grade, int RegenLoc)
{
    local wDefenceBoss wBot;
    local NavigationPoint N;
    local Vector loc, focal;
    local int iCurrentPoint, i, SpawnCount;
    local Rotator Rotation;

    N = GetFlyingPathNode(Level, 0, RegenLoc);
    loc = N.Location;
    N = GetFlyingPathNode(Level, 1, RegenLoc);
    focal = N.Location;
    iCurrentPoint = FlyingPathNode(N).iPathPoint;
    Rotation = Rotator(focal - loc);
    wBot = Level.Spawn(Class'WGame_Decompressed.wDefenceBoss',,, loc, Rotation, true);
    // End:0xD4
    if(wBot == none)
    {
        Log("failed to spawn wDefenceBoss");
        return none;
    }
    wBot.TeamIndex = int(TeamNum);
    wBot.Controller.InitBot(Grade);
    // End:0x12F
    if(int(wBot.Role) == int(ROLE_Authority))
    {
        wBot.SetBotMesh();
    }
    return wBot;
    //return;    
}

simulated function Destroyed()
{
    // End:0x29
    if(PrepareBeamEffect != none)
    {
        DetachFromBone(PrepareBeamEffect);
        PrepareBeamEffect.Destroy();
        PrepareBeamEffect = none;
    }
    // End:0x52
    if(LastChagingEffect != none)
    {
        DetachFromBone(LastChagingEffect);
        LastChagingEffect.Destroy();
        LastChagingEffect = none;
    }
    // End:0x7B
    if(RocketFireEffect != none)
    {
        DetachFromBone(RocketFireEffect);
        RocketFireEffect.Destroy();
        RocketFireEffect = none;
    }
    // End:0x99
    if(MyAmmo_2 != none)
    {
        MyAmmo_2.Destroy();
        MyAmmo_2 = none;
    }
    // End:0xB7
    if(MyAmmo_3 != none)
    {
        MyAmmo_3.Destroy();
        MyAmmo_3 = none;
    }
    super.Destroyed();
    //return;    
}

function float GetChargingDist()
{
    return fTryChargingDist;
    //return;    
}

function bool ReadyToRangedAttack()
{
    return (ReadyToBeam()) || ReadyToRocket();
    //return;    
}

function float RemainTimeRangedAttack()
{
    return Level.TimeSeconds - fBeamFireTime;
    //return;    
}

function bool ReadyToBeam()
{
    return (Level.TimeSeconds - fBeamFireTime) > fBeamFireDelay;
    //return;    
}

function bool ReadyToRocket()
{
    return bReadySeekingRocket;
    //return;    
}

function bool FireProjectile_Rocket2()
{
    local Vector FireStart, X, Y, Z;
    local int i, iStart;
    local Projectile sRocket;
    local Actor CurTarget;

    // End:0x28F
    if(Controller != none)
    {
        GetAxes(Rotation, X, Y, Z);
        FireStart = GetFireBack(X, Y, Z);
        // End:0x129
        if(!SavedFireProperties_3.bInitialized)
        {
            SavedFireProperties_3.AmmoClass = MyAmmo_2.Class;
            SavedFireProperties_3.ProjectileClass = MyAmmo_3.ProjectileClass;
            SavedFireProperties_3.WarnTargetPct = MyAmmo_3.WarnTargetPct;
            SavedFireProperties_3.MaxRange = MyAmmo_3.MaxRange;
            SavedFireProperties_3.bTossed = MyAmmo_3.bTossed;
            SavedFireProperties_3.bTrySplash = MyAmmo_3.bTrySplash;
            SavedFireProperties_3.bLeadTarget = MyAmmo_3.bLeadTarget;
            SavedFireProperties_3.bInstantHit = MyAmmo_3.bInstantHit;
            SavedFireProperties_3.bInitialized = true;
        }
        CurTarget = wDefenceBossController(Controller).FindRandEnemy();
        // End:0x150
        if(CurTarget == none)
        {
            return false;
        }
        // End:0x1F1
        if(Controller.Target != none)
        {
            iStart = iRocketFireCount / 3;
            i = 0;
            J0x17A:

            // End:0x1F1 [Loop If]
            if(i < iStart)
            {
                sRocket = Spawn(MyAmmo_3.ProjectileClass, self,, FireStart, Controller.AdjustAim(SavedFireProperties_3, FireStart, 600));
                wSeekingRocket(sRocket).Seeking = Controller.Target;
                i++;
                // [Loop Continue]
                goto J0x17A;
            }
        }
        i = iStart;
        J0x1FC:

        // End:0x279 [Loop If]
        if(i < iRocketFireCount)
        {
            sRocket = Spawn(MyAmmo_3.ProjectileClass, self,, FireStart, Controller.AdjustAim(SavedFireProperties_3, FireStart, 600));
            wSeekingRocket(sRocket).Seeking = wDefenceBossController(Controller).FindRandEnemy();
            i++;
            // [Loop Continue]
            goto J0x1FC;
        }
        fRocketFireTime = Level.TimeSeconds;
        return true;
    }
    return false;
    //return;    
}

function bool FireProjectile_Rocket()
{
    local Vector FireStart, X, Y, Z;
    local int i, iStart;
    local Projectile sRocket;
    local Actor CurTarget;

    // End:0x28F
    if(Controller != none)
    {
        GetAxes(Rotation, X, Y, Z);
        FireStart = GetFireBack(X, Y, Z);
        // End:0x129
        if(!SavedFireProperties.bInitialized)
        {
            SavedFireProperties.AmmoClass = MyAmmo.Class;
            SavedFireProperties.ProjectileClass = MyAmmo.ProjectileClass;
            SavedFireProperties.WarnTargetPct = MyAmmo.WarnTargetPct;
            SavedFireProperties.MaxRange = MyAmmo.MaxRange;
            SavedFireProperties.bTossed = MyAmmo.bTossed;
            SavedFireProperties.bTrySplash = MyAmmo.bTrySplash;
            SavedFireProperties.bLeadTarget = MyAmmo.bLeadTarget;
            SavedFireProperties.bInstantHit = MyAmmo.bInstantHit;
            SavedFireProperties.bInitialized = true;
        }
        CurTarget = wDefenceBossController(Controller).FindRandEnemy();
        // End:0x150
        if(CurTarget == none)
        {
            return false;
        }
        // End:0x1F1
        if(Controller.Target != none)
        {
            iStart = iRocketFireCount / 3;
            i = 0;
            J0x17A:

            // End:0x1F1 [Loop If]
            if(i < iStart)
            {
                sRocket = Spawn(MyAmmo.ProjectileClass, self,, FireStart, Controller.AdjustAim(SavedFireProperties, FireStart, 600));
                wSeekingRocket(sRocket).Seeking = Controller.Target;
                i++;
                // [Loop Continue]
                goto J0x17A;
            }
        }
        i = iStart;
        J0x1FC:

        // End:0x279 [Loop If]
        if(i < iRocketFireCount)
        {
            sRocket = Spawn(MyAmmo.ProjectileClass, self,, FireStart, Controller.AdjustAim(SavedFireProperties, FireStart, 600));
            wSeekingRocket(sRocket).Seeking = wDefenceBossController(Controller).FindRandEnemy();
            i++;
            // [Loop Continue]
            goto J0x1FC;
        }
        fRocketFireTime = Level.TimeSeconds;
        return true;
    }
    return false;
    //return;    
}

function Vector GetRandDirection(Rotator InRotation, int iDegreeX, int iDegreeY, int iDegreeZ)
{
    local int iDegreeValue, iRandValue;
    local Rotator TempRotation;

    TempRotation = InRotation;
    // End:0x75
    if(iDegreeX > 0)
    {
        iDegreeValue = (iDegreeX * 65536) / 360;
        iRandValue = Rand(3);
        // End:0x59
        if(iRandValue == 2)
        {
            TempRotation.Pitch += iDegreeValue;            
        }
        else
        {
            // End:0x75
            if(iRandValue == 1)
            {
                TempRotation.Pitch -= iDegreeValue;
            }
        }
    }
    // End:0xDF
    if(iDegreeY > 0)
    {
        iDegreeValue = (iDegreeY * 65536) / 360;
        iRandValue = Rand(3);
        // End:0xC3
        if(iRandValue == 2)
        {
            TempRotation.Yaw += iDegreeValue;            
        }
        else
        {
            // End:0xDF
            if(iRandValue == 1)
            {
                TempRotation.Yaw -= iDegreeValue;
            }
        }
    }
    // End:0x149
    if(iDegreeZ > 0)
    {
        iDegreeValue = (iDegreeZ * 65536) / 360;
        iRandValue = Rand(3);
        // End:0x12D
        if(iRandValue == 2)
        {
            TempRotation.Roll += iDegreeValue;            
        }
        else
        {
            // End:0x149
            if(iRandValue == 1)
            {
                TempRotation.Roll -= iDegreeValue;
            }
        }
    }
    return Vector(TempRotation);
    //return;    
}

simulated function SpawnPrepareBeamEffect()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    PrepareBeamEffect = Spawn(Class'XEffects.Alien_Nemesis_BeamReserve', self);
    AttachToBone(PrepareBeamEffect, 'Bip01 Jaw');
    FmodPlayOwnedSound(SoundBeamAction, 0);
    //return;    
}

simulated function StopPrepareBeamEffect()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x44
    if(PrepareBeamEffect != none)
    {
        DetachFromBone(PrepareBeamEffect);
        PrepareBeamEffect.Destroy();
        PrepareBeamEffect = none;
    }
    //return;    
}

simulated function FireBeam()
{
    StopPrepareBeamEffect();
    // End:0x1C
    if(int(Role) == int(ROLE_Authority))
    {
        FireProjectile_Beam();
    }
    //return;    
}

function bool FireProjectile_Beam()
{
    local Vector FireStart, X, Y, Z;
    local Projectile sBeam;
    local Coords C;
    local Vector vTargetDir;

    // End:0x166
    if(Controller != none)
    {
        C = GetBoneCoords('Bip01 Jaw');
        FireStart = Location;
        // End:0x114
        if(!SavedFireProperties_2.bInitialized)
        {
            SavedFireProperties_2.AmmoClass = MyAmmo_2.Class;
            SavedFireProperties_2.ProjectileClass = MyAmmo_2.ProjectileClass;
            SavedFireProperties_2.WarnTargetPct = MyAmmo_2.WarnTargetPct;
            SavedFireProperties_2.MaxRange = MyAmmo_2.MaxRange;
            SavedFireProperties_2.bTossed = MyAmmo_2.bTossed;
            SavedFireProperties_2.bTrySplash = MyAmmo_2.bTrySplash;
            SavedFireProperties_2.bLeadTarget = MyAmmo_2.bLeadTarget;
            SavedFireProperties_2.bInstantHit = MyAmmo_2.bInstantHit;
            SavedFireProperties_2.bInitialized = true;
        }
        sBeam = Spawn(MyAmmo_2.ProjectileClass, self,, FireStart, Controller.AdjustAim(SavedFireProperties_2, FireStart, 600));
        fBeamFireTime = Level.TimeSeconds;
        return true;
    }
    return false;
    //return;    
}

function FireProjectile()
{
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x2D
    if(Controller != none)
    {
        MyAmmo_2 = Spawn(AmmunitionClass_2);
        MyAmmo_3 = Spawn(AmmunitionClass_3);
    }
    PlayAnim('AR_Idle');
    FmodPlaySound(SoundFootsteps_3rd[0], 0);
    //return;    
}

function SetMovementPhysics()
{
    SetPhysics(4);
    PlayAnim('AR_Idle');
    //return;    
}

function WingBeat()
{
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local Vector AccelDir;

    // End:0x11
    if(bShotAnim)
    {
        bShotAnim = false;
    }
    GetAnimParams(0, Anim, frame, Rate);
    // End:0x46
    if(Anim != 'AR_Idle')
    {
        TweenAnim('AR_Idle', 0.4000000);        
    }
    else
    {
        PlayAnim('AR_Idle');
    }
    //return;    
}

simulated function PlayDirectionalDeath(Vector HitLoc)
{
    PlayAnim('AR_Death');
    //return;    
}

simulated function PlayDirectionalHit(Vector HitLoc, optional bool bUseHitStun, optional bool bGoreChange)
{
    //return;    
}

function PlayVictory()
{
    //return;    
}

function Vector GetFireBack(Vector X, Vector Y, Vector Z)
{
    return Location + ((-0.5000000 * CollisionRadius) * (X + Y));
    //return;    
}

function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Location + ((0.5000000 * CollisionRadius) * (X + Y));
    //return;    
}

function float RangedAttackTime()
{
    return 0.0000000;
    //return;    
}

function StartCharging()
{
    SetAnimAction('AR_MattackBegin');
    //return;    
}

function LastMeleeAttack(Actor A)
{
    // End:0x0B
    if(bShotAnim)
    {
        return;
    }
    // End:0x44
    if(((Location.Z - A.Location.Z) + A.CollisionHeight) <= float(0))
    {
        return;
    }
    // End:0xBE
    if(VSize(A.Location - Location) < (((MeleeRange + CollisionRadius) + A.CollisionRadius) - FMax(0.0000000, (0.7000000 * A.Velocity) Dot Normal(A.Location - Location))))
    {
        FinalMeleeAttack(A);
    }
    //return;    
}

function RangedAttack(Actor A)
{
    local bool bIsShot;
    local int i;

    // End:0x0B
    if(bShotAnim)
    {
        return;
    }
    // End:0x44
    if(((Location.Z - A.Location.Z) + A.CollisionHeight) <= float(0))
    {
        return;
    }
    // End:0x13E
    if(VSize(A.Location - Location) > (((MeleeRange + CollisionRadius) + A.CollisionRadius) - FMax(0.0000000, (0.7000000 * A.Velocity) Dot Normal(A.Location - Location))))
    {
        // End:0xE8
        if(!Controller.IsInState('Charging'))
        {
            // End:0xE5
            if(ReadyToBeam())
            {
                SetAnimAction(BeamAnim);
                bIsShot = true;
            }            
        }
        else
        {
            Acceleration = AccelRate * Normal((A.Location - Location) + (vect(0.0000000, 0.0000000, 0.8000000) * A.CollisionHeight));
        }
        // End:0x13C
        if(bIsShot)
        {
            bShotAnim = true;
        }
        return;
    }
    bShotAnim = true;
    SetAnimAction(MeleeAnim);
    MeleeDamageTarget(iMeleeDamage, 20000.0000000 * Normal(A.Location - Location));
    Velocity *= -0.5000000;
    Acceleration *= float(-1);
    // End:0x1B9
    if(Acceleration.Z < float(0))
    {
        Acceleration.Z *= float(-1);
    }
    Acceleration.Z *= 3.0000000;
    //return;    
}

function FinalMeleeAttack(Actor A)
{
    local Vector pushdir, HitLocation;

    // End:0x0B
    if(bShotAnim)
    {
        return;
    }
    bShotAnim = true;
    SetAnimAction(MeleeAnim);
    pushdir = 20000.0000000 * Normal(A.Location - Location);
    // End:0x170
    if(((Controller.Target != none) && VSize(Controller.Target.Location - Location) <= (((MeleeRange * 1.4000000) + Controller.Target.CollisionRadius) + CollisionRadius)) && ((int(Physics) == int(4)) || int(Physics) == int(3)) || Abs(Location.Z - Controller.Target.Location.Z) <= (FMax(CollisionHeight, Controller.Target.CollisionHeight) + (0.5000000 * FMin(CollisionHeight, Controller.Target.CollisionHeight))))
    {
        Controller.Target.TakeDamage(iLastMeleeDamage, self, HitLocation, pushdir, Class'Engine.wDamageMelee');
    }
    //return;    
}

singular function Bump(Actor Other)
{
    local name Anim;
    local float frame, Rate;

    // End:0xAB
    if(bShotAnim && bStinging)
    {
        bStinging = false;
        GetAnimParams(0, Anim, frame, Rate);
        SetAnimAction(MeleeAnim);
        MeleeDamageTarget(18, 20000.0000000 * Normal(Controller.Target.Location - Location));
        Velocity *= -0.5000000;
        Acceleration *= float(-1);
        // End:0xAB
        if(Acceleration.Z < float(0))
        {
            Acceleration.Z *= float(-1);
        }
    }
    super(Actor).Bump(Other);
    //return;    
}

function PatternTick(float DeltaTime)
{
    local float fHPPercent;
    local bool bSpecialRocket, bFinalAttack;

    fHPPercent = float(Health) / HealthMax;
    // End:0x30
    if((Health <= 0) || fNextActivePercent <= float(0))
    {
        return;
    }
    J0x30:

    // End:0x199 [Loop If]
    if(fHPPercent <= fNextActivePercent)
    {
        // End:0x59
        if(fNextActivePercent >= 0.7900000)
        {
            iRocketFireCount = 15;            
        }
        else
        {
            // End:0x73
            if(fNextActivePercent >= 0.5900000)
            {
                iRocketFireCount = 20;                
            }
            else
            {
                // End:0x95
                if(fNextActivePercent >= 0.4900000)
                {
                    bSpecialRocket = true;
                    iRocketFireCount = 25;                    
                }
                else
                {
                    // End:0xAF
                    if(fNextActivePercent >= 0.3900000)
                    {
                        iRocketFireCount = 25;                        
                    }
                    else
                    {
                        // End:0xC9
                        if(fNextActivePercent >= 0.2900000)
                        {
                            iRocketFireCount = 30;                            
                        }
                        else
                        {
                            // End:0xEB
                            if(fNextActivePercent >= 0.1900000)
                            {
                                bSpecialRocket = true;
                                iRocketFireCount = 30;                                
                            }
                            else
                            {
                                // End:0x115
                                if(fNextActivePercent >= 0.0900000)
                                {
                                    bSpecialRocket = true;
                                    iRocketFireCount = 30;
                                    bFinalAttack = true;                                    
                                }
                                else
                                {
                                    iRocketFireCount = 30;
                                }
                            }
                        }
                    }
                }
            }
        }
        // End:0x145
        if(bSpecialRocket)
        {
            // End:0x142
            if(FireProjectile_Rocket2())
            {
                SetAnimAction(RocketAnim);
                bShotAnim = true;
            }            
        }
        else
        {
            // End:0x161
            if(FireProjectile_Rocket())
            {
                SetAnimAction(RocketAnim);
                bShotAnim = true;
            }
        }
        // End:0x18A
        if(bFinalAttack)
        {
            bMeleeFighter = true;
            Controller.GotoState('DestoryNuclearReactor');
            bFinalAttackMode = true;
        }
        fNextActivePercent -= 0.1000000;
        // [Loop Continue]
        goto J0x30;
    }
    //return;    
}

function ServerTick(float DeltaTime)
{
    PatternTick(DeltaTime);
    // End:0x16
    if(bFinalAttackMode)
    {
        return;
    }
    // End:0x2A
    if(ReadyToRangedAttack())
    {
        bMeleeFighter = false;        
    }
    else
    {
        // End:0x59
        if((RemainTimeRangedAttack()) < float(5))
        {
            bMeleeFighter = false;
            self.Controller.GotoState('TacticalMove');            
        }
        else
        {
            bMeleeFighter = true;
        }
    }
    //return;    
}

simulated event Tick(float DeltaTime)
{
    super(wPawn).Tick(DeltaTime);
    // End:0x26
    if(int(Role) == int(ROLE_Authority))
    {
        ServerTick(DeltaTime);
    }
    // End:0x42
    if(bFinalAttackMode && LastChagingEffect == none)
    {
        SpawnLastAttackEffect();
    }
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    super(Pawn).TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType, CollisionPart, WeaponType, bWallShot);
    //return;    
}

simulated function SpawnLastAttackEffect()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    LastChagingEffect = Spawn(Class'XEffects.Alien_Nemesis_LastAttack', self);
    AttachToBone(LastChagingEffect, 'Bip01 Jaw');
    //return;    
}

simulated event SetAnimAction(name NewAction)
{
    super.SetAnimAction(NewAction);
    // End:0x2A
    if(NewAction == RocketAnim)
    {
        FmodPlayOwnedSound(SoundRocketAction, 0);        
    }
    else
    {
        // End:0x46
        if(NewAction == MeleeAnim)
        {
            FmodPlayOwnedSound(SoundMeleeAction, 0);
        }
    }
    //return;    
}

simulated function PlayDying(Class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    AmbientSound = none;
    bCanTeleport = false;
    bReplicateMovement = false;
    bTearOff = true;
    bPlayedDeath = true;
    LifeSpan = RagdollLifeSpan;
    GotoState('Dying');
    BaseEyeHeight = default.BaseEyeHeight;
    SetInvisibility(0.0000000);
    PlayDirectionalDeath(HitLoc);
    SetPhysics(0);
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    AirSpeed = 0.0000000;
    EffectExplosion();
    //return;    
}

simulated function EffectExplosion()
{
    Spawn(SpawnEffectExplosion,,, Location);
    //return;    
}

simulated function FootStepping(int side)
{
    //return;    
}

function Process_TossWeapon_When_Dying(LevelInfo levenInfo, Pawn Pawn, wWeapon Weapon)
{
    levenInfo.Game.SC.KDLog.DeathWeapon = self.iNpcID;
    //return;    
}

state Dying
{
    simulated function BeginState()
    {
        super.BeginState();
        SetPhysics(0);
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        EffectExplosion();
        //return;        
    }

    simulated function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        //return;        
    }
    stop;    
}

defaultproperties
{
    AmmunitionClass_2=Class'WGame_Decompressed.wDefenceBossAmmo_Beam'
    AmmunitionClass_3=Class'WGame_Decompressed.wDefenceBossAmmo2'
    iRocketFireCount=20
    fRocketFireDelay=60.0000000
    fBeamFireDelay=10.0000000
    iMeleeDamage=50
    iLastMeleeDamage=600
    fLastChargingSpeed=2.0000000
    fTryChargingDist=4000.0000000
    fNextActivePercent=0.9000000
    SpawnEffectExplosion=Class'XEffects.Alien_Nemesis_Death'
    SoundBeamAction="Warfare_Sound_Defense_Mode/Monster_boss/char_enemy_attack2_boss"
    SoundRocketAction="Warfare_Sound_Defense_Mode/Monster_boss/char_enemy_attack3_boss"
    SoundMeleeAction="Warfare_Sound_Defense_Mode/Monster_boss/char_enemy_attack1_boss"
    BeamAnim="AR_LaserFire"
    RocketAnim="AR_MissileFire"
    MeleeAnim="AR_Mattack"
    bCanDodge=false
    bAlwaysStrafe=true
    AmmunitionClass=Class'WGame_Decompressed.wDefenceBossAmmo'
    MeshItemID=90015
    iNpcID=915
    SoundFootsteps_3rd="Warfare_Sound_Defense_Mode/Monster_boss/char_enemy_move_boss"
    sndScream="Warfare_Sound_Defense_Mode/Monster_boss/char_enemy_wail_boss"
    sndDie="Warfare_Sound_Defense_Mode/Monster_boss/char_enemy_death_boss"
    RagdollLifeSpan=2.0000000
    bCanFly=true
    MeleeRange=300.0000000
    WaterSpeed=300.0000000
    AirSpeed=400.0000000
    AccelRate=1000.0000000
    JumpZ=0.0000000
    ControllerClass=Class'WGame_Decompressed.wDefenceBossController'
    bPhysicsAnimUpdate=false
    MovementAnims[0]="AR_Idle"
    MovementAnims[1]="AR_Idle"
    MovementAnims[2]="AR_Idle"
    MovementAnims[3]="AR_Idle"
    TakeoffStillAnim="AR_Idle"
    AirStillAnim="AR_Idle"
    TakeoffAnims[0]="AR_Idle"
    TakeoffAnims[1]="AR_Idle"
    TakeoffAnims[2]="AR_Idle"
    TakeoffAnims[3]="AR_Idle"
    AirAnims[0]="AR_Idle"
    AirAnims[1]="AR_Idle"
    AirAnims[2]="AR_Idle"
    AirAnims[3]="AR_Idle"
    CollisionRadius=500.0000000
    CollisionHeight=410.0000000
    Mass=80.0000000
    Buoyancy=80.0000000
    RotationRate=(Pitch=16384,Yaw=55000,Roll=15000)
}