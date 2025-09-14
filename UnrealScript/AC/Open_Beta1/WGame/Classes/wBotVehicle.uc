class wBotVehicle extends wPawn;

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
var Class<wAmmunition> AmmunitionClass;
var wAmmunition MyAmmo;
var Class<wProjectile> ProjectileClass;
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

function RangedAttack(Actor A)
{
    //return;    
}

function bool CanAttack(Actor A)
{
    //return;    
}

function StopFiring()
{
    //return;    
}

function bool SplashDamage()
{
    //return;    
}

function float GetDamageRadius()
{
    //return;    
}

function bool RecommendSplashDamage()
{
    //return;    
}

simulated function TurnOff()
{
    // End:0x13
    if(Health > 0)
    {
        bVictoryNext = true;
    }
    //return;    
}

simulated function bool ForceDefaultCharacter()
{
    return false;
    //return;    
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
    HeadRadius = 0.2500000 * CollisionHeight;
    HeadLoc = Location + (CollisionHeight * vect(0.0000000, 0.0000000, 0.5000000));
    B = loc;
    M = ray * ((2.0000000 * CollisionHeight) + (2.0000000 * CollisionRadius));
    diff = HeadLoc - B;
    t = M Dot diff;
    // End:0x124
    if(t > float(0))
    {
        DotMM = M Dot M;
        // End:0x10A
        if(t < DotMM)
        {
            t = t / DotMM;
            diff = diff - (t * M);            
        }
        else
        {
            t = 1.0000000;
            diff -= M;
        }        
    }
    else
    {
        t = 0.0000000;
    }
    Distance = Sqrt(diff Dot diff);
    return Distance < ((HeadRadius * HeadScale) * AdditionalScale);
    //return;    
}

function Fire(optional float f)
{
    local Actor BestTarget;
    local float bestAim, BestDist;
    local Vector FireDir, X, Y, Z;

    bestAim = 0.9000000;
    GetAxes(Controller.Rotation, X, Y, Z);
    FireDir = X;
    BestTarget = Controller.PickTarget(bestAim, BestDist, FireDir, GetFireStart(X, Y, Z), 6000.0000000);
    RangedAttack(BestTarget);
    //return;    
}

function bool PreferMelee()
{
    return bMeleeFighter;
    //return;    
}

function bool HasRangedAttack()
{
    //return;    
}

function float RangedAttackTime()
{
    //return;    
}

function Vector GetFireStart(Vector X, Vector Y, Vector Z)
{
    return Location + ((0.5000000 * CollisionRadius) * (X + Y));
    //return;    
}

function FireProjectile()
{
    local Vector FireStart, X, Y, Z;
    local wProjectile P;

    // End:0x17A
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
    //return;    
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x2C
    if((ControllerClass != none) && Controller == none)
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
    //return;    
}

simulated function SpawnGiblet(Class<Gib> GibClass, Vector Location, Rotator Rotation, float GibPerterbation, Vector GibVelocity)
{
    local Gib Giblet;
    local Vector direction, Dummy;

    // End:0x21
    if((GibClass == none) || Class'Engine.GameInfo'.static.UseLowGore())
    {
        return;
    }
    Instigator = self;
    Giblet = Spawn(GibClass,,, Location, Rotation);
    // End:0x4F
    if(Giblet == none)
    {
        return;
    }
    Giblet.SetDrawScale((Giblet.DrawScale * (CollisionRadius * CollisionHeight)) / float(1100));
    GibPerterbation *= 32768.0000000;
    Rotation.Pitch += int(((FRand() * 2.0000000) * GibPerterbation) - GibPerterbation);
    Rotation.Yaw += int(((FRand() * 2.0000000) * GibPerterbation) - GibPerterbation);
    Rotation.Roll += int(((FRand() * 2.0000000) * GibPerterbation) - GibPerterbation);
    GetAxes(Rotation, Dummy, Dummy, direction);
    Giblet.Velocity = Velocity + (Normal(direction) * 512.0000000);
    //return;    
}

function LandThump()
{
    //return;    
}

function bool SameSpeciesAs(Pawn P)
{
    return (wBotVehicle(P) != none) && ClassIsChildOf(Class, P.Class) || ClassIsChildOf(P.Class, Class);
    //return;    
}

simulated function AssignInitialPose()
{
    TweenAnim(MovementAnims[0], 0.0000000);
    //return;    
}

function PlayChallengeSound()
{
    PlaySound(ChallengeSound[Rand(4)], 5);
    //return;    
}

function Destroyed()
{
    // End:0x17
    if(MyAmmo != none)
    {
        MyAmmo.Destroy();
    }
    super.Destroyed();
    //return;    
}

function PlayVictory()
{
    //return;    
}

simulated function AnimEnd(int Channel)
{
    AnimAction = 'None';
    // End:0x37
    if(bVictoryNext && int(Physics) != int(2))
    {
        bVictoryNext = false;
        PlayVictory();        
    }
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
    //return;    
}

function SetMovementPhysics()
{
    SetPhysics(2);
    //return;    
}

function bool IsPlayerPawn()
{
    return true;
    //return;    
}

function PlayTakeHit(Vector HitLocation, int Damage, Class<DamageType> DamageType)
{
    PlayDirectionalHit(HitLocation);
    // End:0x2C
    if((Level.TimeSeconds - LastPainSound) < MinTimeBetweenPainSounds)
    {
        return;
    }
    LastPainSound = Level.TimeSeconds;
    PlaySound(HitSound[Rand(4)], 2, 2.0000000 * TransientSoundVolume,, 400.0000000);
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
    Velocity += TearOffMomentum;
    BaseEyeHeight = default.BaseEyeHeight;
    SetInvisibility(0.0000000);
    PlayDirectionalDeath(HitLoc);
    SetPhysics(2);
    //return;    
}

function PlayDyingSound()
{
    // End:0x31
    if(bGibbed)
    {
        PlaySound(GibGroupClass.static.GibSound(), 2, 2.5000000 * TransientSoundVolume, true, 500.0000000);
        return;
    }
    PlaySound(DeathSound[Rand(4)], 2, 2.5000000 * TransientSoundVolume, true, 500.0000000);
    //return;    
}

function bool MeleeDamageTarget(int hitdamage, Vector pushdir)
{
    return false;
    //return;    
}

function PlayVictoryAnimation()
{
    bVictoryNext = true;
    //return;    
}

simulated event SetAnimAction(name NewAction)
{
    // End:0x5A
    if(!bWaitForAnim || int(Level.NetMode) == int(NM_Client))
    {
        AnimAction = NewAction;
        // End:0x5A
        if(PlayAnim(AnimAction,, 0.1000000))
        {
            // End:0x5A
            if(int(Physics) != int(0))
            {
                bWaitForAnim = true;
            }
        }
    }
    //return;    
}

function CreateGib(name BoneName, Class<DamageType> DamageType, Rotator R)
{
    // End:0x14
    if(Class'Engine.GameInfo'.static.UseLowGore())
    {
        return;
    }
    HitFx[HitFxTicker].Bone = BoneName;
    HitFx[HitFxTicker].damtype = DamageType;
    HitFx[HitFxTicker].bSever = true;
    HitFx[HitFxTicker].rotDir = R;
    HitFxTicker = HitFxTicker + 1;
    // End:0x8D
    if(HitFxTicker > (8 - 1))
    {
        HitFxTicker = 0;
    }
    //return;    
}

function SetCaller(Controller C)
{
    wHelicopterController(Controller).Caller = C;
    OwnerName = C.PlayerReplicationInfo.PlayerName;
    //return;    
}

simulated function StartDeRes()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
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
    SetOverlayMaterial(none, 0.0000000, true);
    bDeRes = true;
    //return;    
}

state Dying
{
    ignores EngState, BeginState, Timer, Landed;

    function Landed(Vector HitNormal)
    {
        SetPhysics(0);
        // End:0x14
        if(!IsAnimating(0))
        {
            LandThump();
        }
        super.Landed(HitNormal);
        //return;        
    }

    simulated function Timer()
    {
        // End:0x26
        if(bTestCheck == false)
        {
            StopAllSoundByActor();
            SetTimer(0.5000000, false);
            bTestCheck = true;            
        }
        else
        {
            Destroy();
        }
        //return;        
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
        //return;        
    }

    function EngState()
    {
        StopAllSoundByActor();
        EndState();
        //return;        
    }
    stop;    
}

defaultproperties
{
    bMeleeFighter=true
    bCanDodge=true
    ScoringValue=1
    NullSound=Sound'Warfare_Sound_Char.etc.null'
    CONFIG_SPINDOWN_SOUND_VOLUME=1.0000000
    CONFIG_SPINDOWN_SOUND_RADIUS=5000.0000000
    bAddToLevelPawnList=false
    bCanCrouch=false
    bDrawNameTag=false
    bCanPickupInventory=false
    MeleeRange=90.0000000
    ControllerClass=Class'WGame_Decompressed.wBotVehicleController'
    AmbientGlow=60
    TransientSoundVolume=0.6000000
    TransientSoundRadius=500.0000000
}