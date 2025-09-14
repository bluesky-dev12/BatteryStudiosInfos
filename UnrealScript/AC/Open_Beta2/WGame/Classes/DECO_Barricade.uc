class DECO_Barricade extends Decoration;

var int Backup_Health;
var VolumeTimer VT;
var Controller DelayedDamageInstigatorController;
var float RadiusDamage;
var bool bCheckForStackedBarrels;
var bool bBurning;
var float fLastBurningTime;
var wProjectile BurningProj;
var string SoundWarning;
var string SoundDestroy;

function Landed(Vector HitNormal)
{
    //return;    
}

function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    //return;    
}

singular function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
    //return;    
}

singular function BaseChange()
{
    //return;    
}

function SetBurning(bool bBurn, wProjectile proj)
{
    bBurning = bBurn;
    BurningProj = proj;
    TickDamage();
    //return;    
}

simulated function TickDamage()
{
    // End:0x83
    if((Level.TimeSeconds - fLastBurningTime) >= 1.0000000)
    {
        TakeDamage(BurningProj.BaseParams.iDamage, BurningProj.Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), BurningProj.ResParams,, int(8));
        fLastBurningTime = Level.TimeSeconds;
    }
    //return;    
}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Backup_Health = Health;
    // End:0x2B
    if(MaxHealth <= Health)
    {
        MaxHealth = Health;
    }
    EventTagName = Tag;
    //return;    
}

simulated event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x3D
    if(Level.GetLocalPlayerController() != none)
    {
        Level.GetLocalPlayerController().myHUD.CacheSpecialPositions();
    }
    //return;    
}

function SetDelayedDamageInstigatorController(Controller C)
{
    DelayedDamageInstigatorController = C;
    //return;    
}

function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x1A
    if(!bDamageable || Health < 0)
    {
        return;
    }
    // End:0x30
    if(DamageType == none)
    {
        DamageType = Class'Engine.DamageType';
    }
    // End:0x49
    if(instigatedBy != none)
    {
        Instigator = instigatedBy;        
    }
    else
    {
        // End:0x9F
        if((((instigatedBy == none) || instigatedBy.Controller == none) && DamageType.default.bDelayedDamage) && DelayedDamageInstigatorController != none)
        {
            instigatedBy = DelayedDamageInstigatorController.Pawn;
        }
    }
    // End:0xBA
    if(PlayerController(instigatedBy.Controller) != none)
    {
        return;
    }
    // End:0x102
    if((!instigatedBy.IsA('wAIDefencePawn') && !instigatedBy.IsA('wFlyingDefenceBot')) && !instigatedBy.IsA('wDefenceBoss'))
    {
        return;
    }
    // End:0x115
    if(Instigator != none)
    {
        MakeNoise(1.0000000);
    }
    NDamage *= Level.Game.GetAddDamageRatio();
    Health -= NDamage;
    FragMomentum = Momentum;
    // End:0x1CD
    if(Health <= 0)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        CheckNearbyBarrels();
        // End:0x193
        if(EffectWhenDestroyed != none)
        {
            Spawn(EffectWhenDestroyed, Owner,, Location);
        }
        bHidden = true;
        SetCollision(false, false, false);
        VT = Spawn(Class'Engine.VolumeTimer', self);
        VT.SetTimer(3.2000000, false);
        FmodDemoPlaySound(SoundDestroy);
    }
    //return;    
}

function CheckNearbyBarrels()
{
    bCheckForStackedBarrels = true;
    //return;    
}

function TimerPop(VolumeTimer t)
{
    VT.Destroy();
    bCheckForStackedBarrels = false;
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float damageScale, dist;
    local Vector Dir;

    return;
    // End:0x0D
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x26E
    foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
    {
        // End:0x76
        if((bCheckForStackedBarrels && Victims.IsA('DECO_Barricade')) && Victims.Location.Z <= HitLocation.Z)
        {
            continue;            
        }
        // End:0xA0
        if(Victims.IsA('DECO_Barricade') && !IsNearbyBarrel(Victims))
        {
            continue;            
        }
        // End:0x26D
        if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
            // End:0x184
            if((Instigator == none) || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(DelayedDamageInstigatorController);
            }
            Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
            // End:0x26D
            if(((Instigator != none) && Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
            {
                Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, DamageType, Momentum, HitLocation);
            }
        }        
    }    
    bHurtEntry = false;
    //return;    
}

final simulated function bool IsNearbyBarrel(Actor A)
{
    local Vector Dir;

    Dir = Location - A.Location;
    // End:0x3A
    if(Abs(Dir.Z) > (CollisionHeight * 2.6700001))
    {
        return false;
    }
    Dir.Z = 0.0000000;
    return VSize(Dir) <= (CollisionRadius * 2.2500000);
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    NetUpdateTime = Level.TimeSeconds - float(1);
    Health = Backup_Health;
    bHidden = false;
    SetCollision(true, true, true);
    //return;    
}

function Bump(Actor Other)
{
    return;
    // End:0x2D
    if((Mover(Other) != none) && Mover(Other).bResetting)
    {
        return;
    }
    // End:0xC9
    if(VSize(Other.Velocity) > float(500))
    {
        Instigator = Pawn(Other);
        // End:0x8E
        if((Instigator != none) && Instigator.Controller != none)
        {
            SetDelayedDamageInstigatorController(Instigator.Controller);
        }
        TakeDamage(int(VSize(Other.Velocity) * 0.0300000), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.Crushed');
    }
    //return;    
}

event EncroachedBy(Actor Other)
{
    return;
    // End:0x2D
    if((Mover(Other) != none) && Mover(Other).bResetting)
    {
        return;
    }
    Instigator = Pawn(Other);
    // End:0x72
    if((Instigator != none) && Instigator.Controller != none)
    {
        SetDelayedDamageInstigatorController(Instigator.Controller);
    }
    TakeDamage(1000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.Crushed');
    //return;    
}

function bool EncroachingOn(Actor Other)
{
    return false;
    // End:0x2D
    if((Mover(Other) != none) && Mover(Other).bResetting)
    {
        return false;
    }
    Instigator = Pawn(Other);
    // End:0x72
    if((Instigator != none) && Instigator.Controller != none)
    {
        SetDelayedDamageInstigatorController(Instigator.Controller);
    }
    TakeDamage(1000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.Crushed');
    return false;
    //return;    
}

defaultproperties
{
    RadiusDamage=256.0000000
    SoundWarning="Warfare_Sound_Defense_Mode/UI/Warning"
    SoundDestroy="Warfare_Sound_Defense_Mode/Object/bombing"
    EffectWhenDestroyed=Class'XEffects.XWFX_SD_Bomb_explosion'
    bDamageable=true
    Health=15
    DrawType=8
    bStatic=false
    NetUpdateFrequency=100.0000000
    AmbientGlow=48
    CollisionHeight=32.0000000
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bUseCylinderCollision=true
    bBlockKarma=true
    bEdShouldSnap=true
}