class DECO_ExplodingBarrel extends Decoration;

var int Backup_Health;
var VolumeTimer VT;
var Controller DelayedDamageInstigatorController;
var float RadiusDamage;
var bool bCheckForStackedBarrels;

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

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Backup_Health = Health;
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
    // End:0xB2
    if(Instigator != none)
    {
        MakeNoise(1.0000000);
    }
    Health -= NDamage;
    FragMomentum = Momentum;
    // End:0x140
    if(Health < 0)
    {
        NetUpdateTime = Level.TimeSeconds - float(1);
        CheckNearbyBarrels();
        // End:0x111
        if(EffectWhenDestroyed != none)
        {
            Spawn(EffectWhenDestroyed, Owner,, Location);
        }
        bHidden = true;
        SetCollision(false, false, false);
        VT = Spawn(Class'Engine.VolumeTimer', self);
        VT.SetTimer(3.2000000, false);
    }
    //return;    
}

function CheckNearbyBarrels()
{
    bCheckForStackedBarrels = true;
    HurtRadius(1000.0000000, RadiusDamage, Class'UT2k4Assault_Decompressed.DamTypeExploBarrel', 256.0000000, Location);
    //return;    
}

function TimerPop(VolumeTimer t)
{
    VT.Destroy();
    bCheckForStackedBarrels = false;
    HurtRadius(1000.0000000, RadiusDamage, Class'UT2k4Assault_Decompressed.DamTypeExploBarrel', 256.0000000, Location);
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float damageScale, dist;
    local Vector Dir;

    // End:0x0B
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x26C
    foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
    {
        // End:0x74
        if((bCheckForStackedBarrels && Victims.IsA('DECO_ExplodingBarrel')) && Victims.Location.Z <= HitLocation.Z)
        {
            continue;            
        }
        // End:0x9E
        if(Victims.IsA('DECO_ExplodingBarrel') && !IsNearbyBarrel(Victims))
        {
            continue;            
        }
        // End:0x26B
        if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
            // End:0x182
            if((Instigator == none) || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(DelayedDamageInstigatorController);
            }
            Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
            // End:0x26B
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
    // End:0x2B
    if((Mover(Other) != none) && Mover(Other).bResetting)
    {
        return;
    }
    // End:0xC7
    if(VSize(Other.Velocity) > float(500))
    {
        Instigator = Pawn(Other);
        // End:0x8C
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
    // End:0x2B
    if((Mover(Other) != none) && Mover(Other).bResetting)
    {
        return;
    }
    Instigator = Pawn(Other);
    // End:0x70
    if((Instigator != none) && Instigator.Controller != none)
    {
        SetDelayedDamageInstigatorController(Instigator.Controller);
    }
    TakeDamage(1000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'Engine.Crushed');
    //return;    
}

function bool EncroachingOn(Actor Other)
{
    // End:0x2B
    if((Mover(Other) != none) && Mover(Other).bResetting)
    {
        return false;
    }
    Instigator = Pawn(Other);
    // End:0x70
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
    bDamageable=true
    Health=15
    DrawType=8
    bStatic=false
    NetUpdateFrequency=1.0000000
    AmbientGlow=48
    CollisionHeight=32.0000000
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bUseCylinderCollision=true
    bBlockKarma=true
    bEdShouldSnap=true
}