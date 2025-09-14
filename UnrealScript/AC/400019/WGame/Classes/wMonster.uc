class wMonster extends wPawn;

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
var int ScoringValue;
var FireProperties SavedFireProperties;
var int MeshItemID;
var int iNpcID;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        MeshItemID, iNpcID;
}

simulated function SetBotMesh()
{
    local wAILevel AILevel;
    local bool bSuc;

    // End:0x45
    if(MeshItemID != 0)
    {
        LinkMesh(Level.GameMgr.GetItemResourceMesh(MeshItemID, true, byte(TeamIndex)));
        bSuc = LoopAnim('AR_Idle');
    }
    //return;    
}

simulated event PostNetBeginPlay()
{
    super.PostNetBeginPlay();
    SetBotMesh();
    //return;    
}

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

function float GetChargingDist()
{
    return 20000.0000000;
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

    // End:0x15F
    if(Controller != none)
    {
        GetAxes(Rotation, X, Y, Z);
        FireStart = GetFireStart(X, Y, Z);
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
        Spawn(MyAmmo.ProjectileClass,,, FireStart, Controller.AdjustAim(SavedFireProperties, FireStart, 600));
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
    // End:0x55
    if(Controller != none)
    {
        Controller.Possess(self);
        MyAmmo = Spawn(AmmunitionClass);
    }
    //return;    
}

function LandThump()
{
    //return;    
}

function bool SameSpeciesAs(Pawn P)
{
    return (wMonster(P) != none) && ClassIsChildOf(Class, P.Class) || ClassIsChildOf(P.Class, Class);
    //return;    
}

simulated function AssignInitialPose()
{
    TweenAnim(MovementAnims[0], 0.0000000);
    //return;    
}

function PlayChallengeSound()
{
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
    // End:0x0B
    if(bGibbed)
    {
        return;
    }
    //return;    
}

function bool MeleeDamageTarget(int hitdamage, Vector pushdir)
{
    local Vector HitLocation, HitNormal;
    local Actor HitActor;

    // End:0x187
    if(((Controller.Target != none) && VSize(Controller.Target.Location - Location) <= (((MeleeRange * 1.4000000) + Controller.Target.CollisionRadius) + CollisionRadius)) && ((int(Physics) == int(4)) || int(Physics) == int(3)) || Abs(Location.Z - Controller.Target.Location.Z) <= (FMax(CollisionHeight, Controller.Target.CollisionHeight) + (0.5000000 * FMin(CollisionHeight, Controller.Target.CollisionHeight))))
    {
        HitActor = Trace(HitLocation, HitNormal, Controller.Target.Location, Location, false);
        // End:0x158
        if((HitActor != none) && HitActor != Controller.Target)
        {
            return false;
        }
        Controller.Target.TakeDamage(hitdamage, self, HitLocation, pushdir, Class'Engine.wDamageMelee');
        return true;
    }
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

simulated function ProcessHitFX()
{
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
    ignores Timer, Landed;

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
        // End:0x0E
        if(!PlayerCanSeeMe())
        {
            Destroy();            
        }
        else
        {
            // End:0x34
            if((LifeSpan <= DeResTime) && bDeRes == false)
            {
                StartDeRes();                
            }
            else
            {
                SetTimer(1.0000000, false);
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bMeleeFighter=true
    bCanDodge=true
    ScoringValue=1
    IdleHeavyAnim="Idle_Rest"
    bCanCrouch=false
    bCanPickupInventory=false
    MeleeRange=90.0000000
    ControllerClass=Class'WGame_Decompressed.wMonsterController'
    DoubleJumpAnims[0]="Jump"
    DoubleJumpAnims[1]="Jump"
    DoubleJumpAnims[2]="Jump"
    DoubleJumpAnims[3]="Jump"
    DodgeAnims[0]="Jump"
    DodgeAnims[1]="Jump"
    DodgeAnims[2]="Jump"
    DodgeAnims[3]="Jump"
    IdleWeaponAnim="Idle_Rest"
    IdleRifleAnim="Idle_Rest"
    TakeoffStillAnim="Jump"
    AirStillAnim="Jump"
    TakeoffAnims[0]="Jump"
    TakeoffAnims[1]="Jump"
    TakeoffAnims[2]="Jump"
    TakeoffAnims[3]="Jump"
    AirAnims[0]="Jump"
    AirAnims[1]="Jump"
    AirAnims[2]="Jump"
    AirAnims[3]="Jump"
    LandAnims[0]="Land"
    LandAnims[1]="Land"
    LandAnims[2]="Land"
    LandAnims[3]="Land"
    CrouchAnims[0]="crouch"
    CrouchAnims[1]="crouch"
    CrouchAnims[2]="crouch"
    CrouchAnims[3]="crouch"
    AmbientGlow=60
    TransientSoundVolume=0.6000000
    TransientSoundRadius=500.0000000
}