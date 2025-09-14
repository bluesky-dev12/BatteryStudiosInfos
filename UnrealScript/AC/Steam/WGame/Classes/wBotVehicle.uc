/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBotVehicle.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:26
 *	Functions:35
 *	States:1
 *
 *******************************************************************************/
class wBotVehicle extends wPawn
    dependson(wHelicopterController);

var bool bMeleeFighter;
var bool bShotAnim;
var bool bCanDodge;
var bool bVictoryNext;
var bool bTryToWalk;
var bool bBoss;
var bool bAlwaysStrafe;
var float DodgeSkillAdjust;
var Sound HitSound[4];
var Sound DeathSound[4];
var Sound ChallengeSound[4];
var Sound FireSound;
var class<wAmmunition> AmmunitionClass;
var wAmmunition MyAmmo;
var class<wProjectile> ProjectileClass;
var wProjectile MyProj;
var int ScoringValue;
var FireProperties SavedFireProperties;
var Sound StaySound;
var Sound MoveSound;
var Sound MoveDamagedSound;
var Sound SpindownSound;
var Sound NullSound;
var bool bTestCheck;
var float CONFIG_SPINDOWN_SOUND_VOLUME;
var float CONFIG_SPINDOWN_SOUND_RADIUS;

function RangedAttack(Actor A);
function bool CanAttack(Actor A);
function StopFiring();
function bool SplashDamage();
function float GetDamageRadius();
function bool RecommendSplashDamage();
simulated function TurnOff()
{
    // End:0x13
    if(Health > 0)
    {
        bVictoryNext = true;
    }
}

simulated function bool ForceDefaultCharacter()
{
    return false;
}

function bool IsHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
    local Vector HeadLoc, B, M, diff;
    local float t, DotMM, Distance;

    // End:0x25
    if(HeadBone != 'None')
    {
        return super(Pawn).IsHeadShot(loc, ray, AdditionalScale);
    }
    HeadRadius = 0.250 * CollisionHeight;
    HeadLoc = Location + CollisionHeight * vect(0.0, 0.0, 0.50);
    B = loc;
    M = ray * 2.0 * CollisionHeight + 2.0 * CollisionRadius;
    diff = HeadLoc - B;
    t = M Dot diff;
    // End:0x124
    if(t > float(0))
    {
        DotMM = M Dot M;
        // End:0x10a
        if(t < DotMM)
        {
            t = t / DotMM;
            diff = diff - t * M;
        }
        // End:0x121
        else
        {
            t = 1.0;
            diff -= M;
        }
    }
    // End:0x12f
    else
    {
        t = 0.0;
    }
    Distance = Sqrt(diff Dot diff);
    return Distance < HeadRadius * HeadScale * AdditionalScale;
}

function Fire(optional float f)
{
    local Actor BestTarget;
    local float bestAim, BestDist;
    local Vector FireDir, X, Y, Z;

    bestAim = 0.90;
    GetAxes(Controller.Rotation, X, Y, Z);
    FireDir = X;
    BestTarget = Controller.PickTarget(bestAim, BestDist, FireDir, GetFireStart(X, Y, Z), 6000.0);
    RangedAttack(BestTarget);
}

function bool PreferMelee()
{
    return bMeleeFighter;
}

function bool HasRangedAttack();
function float RangedAttackTime();
function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Location + 0.50 * CollisionRadius * X + Y;
}

function FireProjectile()
{
    local Vector FireStart, X, Y, Z;
    local wProjectile P;

    // End:0x17a
    if(Controller != none)
    {
        GetAxes(Rotation, X, Y, Z);
        FireStart = GetFireStart(X, Y, Z);
        // End:0x129
        if(!SavedFireProperties.bInitialized)
        {
            SavedFireProperties.AmmoClass = MyAmmo.Class;
            SavedFireProperties.ProjectileClass = MyProj.Class;
            SavedFireProperties.WarnTargetPct = MyAmmo.WarnTargetPct;
            SavedFireProperties.MaxRange = MyAmmo.MaxRange;
            SavedFireProperties.bTossed = MyAmmo.bTossed;
            SavedFireProperties.bTrySplash = MyAmmo.bTrySplash;
            SavedFireProperties.bLeadTarget = MyAmmo.bLeadTarget;
            SavedFireProperties.bInstantHit = MyAmmo.bInstantHit;
            SavedFireProperties.bInitialized = true;
        }
        P = Spawn(ProjectileClass,,, FireStart, Controller.AdjustAim(SavedFireProperties, FireStart, 600));
        P.iWeaponID = 5001;
        PlaySound(FireSound, 3);
    }
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x2c
    if(ControllerClass != none && Controller == none)
    {
        Controller = Spawn(ControllerClass);
    }
    // End:0x63
    if(Controller != none)
    {
        Controller.Possess(self);
        MyAmmo = Spawn(AmmunitionClass);
        MyProj = Spawn(ProjectileClass);
    }
}

simulated function SpawnGiblet(class<Gib> GibClass, Vector Location, Rotator Rotation, float GibPerterbation, Vector GibVelocity)
{
    local Gib Giblet;
    local Vector direction, Dummy;

    // End:0x21
    if(GibClass == none || class'GameInfo'.static.UseLowGore())
    {
        return;
    }
    Instigator = self;
    Giblet = Spawn(GibClass,,, Location, Rotation);
    // End:0x4f
    if(Giblet == none)
    {
        return;
    }
    Giblet.SetDrawScale(Giblet.DrawScale * CollisionRadius * CollisionHeight / float(1100));
    GibPerterbation *= 32768.0;
    Rotation.Pitch += int(FRand() * 2.0 * GibPerterbation - GibPerterbation);
    Rotation.Yaw += int(FRand() * 2.0 * GibPerterbation - GibPerterbation);
    Rotation.Roll += int(FRand() * 2.0 * GibPerterbation - GibPerterbation);
    GetAxes(Rotation, Dummy, Dummy, direction);
    Giblet.Velocity = Velocity + Normal(direction) * 512.0;
}

function LandThump();
function bool SameSpeciesAs(Pawn P)
{
    return wBotVehicle(P) != none && ClassIsChildOf(Class, P.Class) || ClassIsChildOf(P.Class, Class);
}

simulated function AssignInitialPose()
{
    TweenAnim(MovementAnims[0], 0.0);
}

function PlayChallengeSound()
{
    PlaySound(ChallengeSound[Rand(4)], 5);
}

function Destroyed()
{
    // End:0x17
    if(MyAmmo != none)
    {
        MyAmmo.Destroy();
    }
    super.Destroyed();
}

function PlayVictory();
simulated function AnimEnd(int Channel)
{
    AnimAction = 'None';
    // End:0x37
    if(bVictoryNext && Physics != 2)
    {
        bVictoryNext = false;
        PlayVictory();
    }
    // End:0x59
    else
    {
        // End:0x59
        if(bShotAnim)
        {
            bShotAnim = false;
            Controller.bPreparingMove = false;
        }
    }
    super.AnimEnd(Channel);
}

function SetMovementPhysics()
{
    SetPhysics(2);
}

function bool IsPlayerPawn()
{
    return true;
}

function PlayTakeHit(Vector HitLocation, int Damage, class<DamageType> DamageType)
{
    PlayDirectionalHit(HitLocation);
    // End:0x2c
    if(Level.TimeSeconds - LastPainSound < MinTimeBetweenPainSounds)
    {
        return;
    }
    LastPainSound = Level.TimeSeconds;
    PlaySound(HitSound[Rand(4)], 2, 2.0 * TransientSoundVolume,, 400.0);
}

simulated function PlayDying(class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    AmbientSound = none;
    bCanTeleport = false;
    bReplicateMovement = false;
    bTearOff = true;
    bPlayedDeath = true;
    LifeSpan = RagdollLifeSpan;
    GotoState('Dying');
    Velocity += TearOffMomentum;
    BaseEyeHeight = default.BaseEyeHeight;
    SetInvisibility(0.0);
    PlayDirectionalDeath(HitLoc);
    SetPhysics(2);
}

function PlayDyingSound()
{
    // End:0x31
    if(bGibbed)
    {
        PlaySound(GibGroupClass.static.GibSound(), 2, 2.50 * TransientSoundVolume, true, 500.0);
        return;
    }
    PlaySound(DeathSound[Rand(4)], 2, 2.50 * TransientSoundVolume, true, 500.0);
}

function bool MeleeDamageTarget(int hitdamage, Vector pushdir)
{
    return false;
}

function PlayVictoryAnimation()
{
    bVictoryNext = true;
}

simulated event SetAnimAction(name NewAction)
{
    // End:0x5a
    if(!bWaitForAnim || Level.NetMode == 3)
    {
        AnimAction = NewAction;
        // End:0x5a
        if(PlayAnim(AnimAction,, 0.10))
        {
            // End:0x5a
            if(Physics != 0)
            {
                bWaitForAnim = true;
            }
        }
    }
}

function CreateGib(name BoneName, class<DamageType> DamageType, Rotator R)
{
    // End:0x14
    if(class'GameInfo'.static.UseLowGore())
    {
        return;
    }
    HitFx[HitFxTicker].Bone = BoneName;
    HitFx[HitFxTicker].damtype = DamageType;
    HitFx[HitFxTicker].bSever = true;
    HitFx[HitFxTicker].rotDir = R;
    HitFxTicker = HitFxTicker + 1;
    // End:0x8d
    if(HitFxTicker > 8 - 1)
    {
        HitFxTicker = 0;
    }
}

function SetCaller(Controller C)
{
    wHelicopterController(Controller).Caller = C;
    OwnerName = C.PlayerReplicationInfo.PlayerName;
}

simulated function StartDeRes()
{
    // End:0x1b
    if(Level.NetMode == 1)
    {
        return;
    }
    AmbientGlow = 254;
    MaxLights = 0;
    SetCollision(false, false, false);
    Projectors.Remove(0, Projectors.Length);
    bAcceptsProjectors = false;
    // End:0x62
    if(PlayerShadow != none)
    {
        PlayerShadow.bShadowActive = false;
    }
    RemoveFlamingEffects();
    SetOverlayMaterial(none, 0.0, true);
    bDeRes = true;
}

state Dying
{
    ignores BreathTimer;

    function Landed(Vector HitNormal)
    {
        SetPhysics(0);
        // End:0x14
        if(!IsAnimating(0))
        {
            LandThump();
        }
        super.Landed(HitNormal);
    }

    simulated function Timer()
    {
        // End:0x26
        if(bTestCheck == false)
        {
            StopAllSoundByActor();
            SetTimer(0.50, false);
            bTestCheck = true;
        }
        // End:0x29
        else
        {
            Destroy();
        }
    }

    function BeginState()
    {
        StopAllSoundByActor();
        // End:0x29
        if(!bHidden)
        {
            PlaySound(SpindownSound, 10, CONFIG_SPINDOWN_SOUND_VOLUME,, CONFIG_SPINDOWN_SOUND_RADIUS,, false, false);
        }
        super.BeginState();
    }

    function EngState()
    {
        StopAllSoundByActor();
        EndState();
    }

}

defaultproperties
{
    bMeleeFighter=true
    bCanDodge=true
    ScoringValue=1
    NullSound=Sound'Warfare_Sound_Char.etc.null'
    CONFIG_SPINDOWN_SOUND_VOLUME=1.0
    CONFIG_SPINDOWN_SOUND_RADIUS=5000.0
    bAddToLevelPawnList=true
    bCanCrouch=true
    bDrawNameTag=true
    bCanPickupInventory=true
    MeleeRange=90.0
    ControllerClass=class'wBotVehicleController'
    AmbientGlow=60
    TransientSoundVolume=0.60
    TransientSoundRadius=500.0
}