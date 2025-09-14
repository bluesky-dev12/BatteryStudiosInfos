/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\WDECO_ExplodingBarrel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:15
 *
 *******************************************************************************/
class WDECO_ExplodingBarrel extends Decoration;

var int Backup_Health;
var VolumeTimer VT;
var Controller DelayedDamageInstigatorController;
var float RadiusDamage;
var bool bCheckForStackedBarrels;

function Landed(Vector HitNormal);
function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial);
singular function PhysicsVolumeChange(PhysicsVolume NewVolume);
singular function BaseChange();
function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Backup_Health = Health;
}

function SetDelayedDamageInstigatorController(Controller C)
{
    DelayedDamageInstigatorController = C;
}

function TakeDamage(int NDamage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x1a
    if(!bDamageable || Health < 0)
    {
        return;
    }
    // End:0x30
    if(DamageType == none)
    {
        DamageType = class'DamageType';
    }
    // End:0x49
    if(instigatedBy != none)
    {
        Instigator = instigatedBy;
    }
    // End:0x9f
    else
    {
        // End:0x9f
        if(instigatedBy == none || instigatedBy.Controller == none && DamageType.default.bDelayedDamage && DelayedDamageInstigatorController != none)
        {
            instigatedBy = DelayedDamageInstigatorController.Pawn;
        }
    }
    // End:0xb2
    if(Instigator != none)
    {
        MakeNoise(1.0);
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
        VT = Spawn(class'VolumeTimer', self);
        VT.SetTimer(0.20, false);
    }
}

function CheckNearbyBarrels()
{
    bCheckForStackedBarrels = true;
    HurtRadius(1000.0, RadiusDamage, class'DamTypeExploBarrel', 512.0, Location);
}

function TimerPop(VolumeTimer t)
{
    VT.Destroy();
    bCheckForStackedBarrels = false;
    HurtRadius(1000.0, RadiusDamage, class'DamTypeExploBarrel', 512.0, Location);
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float damageScale, dist;
    local Vector Dir;

    // End:0x0b
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x26c
    foreach VisibleCollidingActors(class'Actor', Victims, DamageRadius, HitLocation)
    {
        // End:0x74
        if(bCheckForStackedBarrels && Victims.IsA('DECO_ExplodingBarrel') && Victims.Location.Z <= HitLocation.Z)
        {
            continue;
        }
        // End:0x26c
        else
        {
            // End:0x9e
            if(Victims.IsA('DECO_ExplodingBarrel') && !IsNearbyBarrel(Victims))
            {
                continue;
            }
            // End:0x26c
            else
            {
                // End:0x26b
                if(Victims != self && Victims.Role == 4 && !Victims.IsA('FluidSurfaceInfo'))
                {
                    Dir = Victims.Location - HitLocation;
                    dist = FMax(1.0, VSize(Dir));
                    Dir = Dir / dist;
                    damageScale = 1.0 - FMax(0.0, dist - Victims.CollisionRadius / DamageRadius);
                    // End:0x182
                    if(Instigator == none || Instigator.Controller == none)
                    {
                        Victims.SetDelayedDamageInstigatorController(DelayedDamageInstigatorController);
                    }
                    Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * Momentum * Dir, DamageType);
                    // End:0x26b
                    if(Instigator != none && Vehicle(Victims) != none && Vehicle(Victims).Health > 0)
                    {
                        Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, DamageType, Momentum, HitLocation);
                    }
                }
                continue;
            }
        }        
    }
    bHurtEntry = false;
}

final simulated function bool IsNearbyBarrel(Actor A)
{
    local Vector Dir;

    Dir = Location - A.Location;
    // End:0x3a
    if(Abs(Dir.Z) > CollisionHeight * 2.670)
    {
        return false;
    }
    Dir.Z = 0.0;
    return VSize(Dir) <= CollisionRadius * 2.250;
}

function Reset()
{
    super(Actor).Reset();
    NetUpdateTime = Level.TimeSeconds - float(1);
    Health = Backup_Health;
    bHidden = false;
    SetCollision(true, true, true);
}

function Bump(Actor Other)
{
    // End:0x2b
    if(Mover(Other) != none && Mover(Other).bResetting)
    {
        return;
    }
    // End:0xc7
    if(VSize(Other.Velocity) > float(500))
    {
        Instigator = Pawn(Other);
        // End:0x8c
        if(Instigator != none && Instigator.Controller != none)
        {
            SetDelayedDamageInstigatorController(Instigator.Controller);
        }
        TakeDamage(int(VSize(Other.Velocity) * 0.030), Instigator, Location, vect(0.0, 0.0, 0.0), class'Crushed');
    }
}

event EncroachedBy(Actor Other)
{
    // End:0x2b
    if(Mover(Other) != none && Mover(Other).bResetting)
    {
        return;
    }
    Instigator = Pawn(Other);
    // End:0x70
    if(Instigator != none && Instigator.Controller != none)
    {
        SetDelayedDamageInstigatorController(Instigator.Controller);
    }
    TakeDamage(1000, Instigator, Location, vect(0.0, 0.0, 0.0), class'Crushed');
}

function bool EncroachingOn(Actor Other)
{
    // End:0x2b
    if(Mover(Other) != none && Mover(Other).bResetting)
    {
        return false;
    }
    Instigator = Pawn(Other);
    // End:0x70
    if(Instigator != none && Instigator.Controller != none)
    {
        SetDelayedDamageInstigatorController(Instigator.Controller);
    }
    TakeDamage(1000, Instigator, Location, vect(0.0, 0.0, 0.0), class'Crushed');
    return false;
}

defaultproperties
{
    RadiusDamage=512.0
    bDamageable=true
    Health=80
    DrawType=8
    bStatic=true
    NetUpdateFrequency=1.0
    AmbientGlow=48
    SurfaceType=6
    CollisionRadius=50.0
    CollisionHeight=50.0
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bUseCylinderCollision=true
    bBlockKarma=true
    bEdShouldSnap=true
}