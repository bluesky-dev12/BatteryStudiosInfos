/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Projectile.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:24
 *	Functions:20
 *
 *******************************************************************************/
class Projectile extends Actor
    dependson(Projector)
    native
    abstract
    notplaceable;

var float Speed;
var float MaxSpeed;
var float TossZ;
var Actor ZeroCollider;
var bool bSwitchToZeroCollision;
var bool bNoFX;
var bool bReadyToSplash;
var bool bSpecialCalcView;
var float Damage;
var float DamageRadius;
var float MomentumTransfer;
var float Momentum_Pawn;
var class<DamageType> MyDamageType;
var Actor.eWeaponType MyWeaponType;
var Sound SpawnSound;
var Sound ImpactSound;
var class<Projector> ExplosionDecal;
var float ExploWallOut;
var Controller InstigatorController;
var Actor LastTouched;
var Actor HurtWall;
var float MaxEffectDistance;
var bool bScriptPostRender;
var float fGravMass;

// Export UProjectile::execGetInstigatorsDirectionbyDot(FFrame&, void* const)
native function float GetInstigatorsDirectionbyDot(Rotator pawnRotation, Vector pawnVelocity);
simulated function PostBeginPlay()
{
    local PlayerController PC;

    // End:0xb7
    if(Role == 4 && Instigator != none && Instigator.Controller != none)
    {
        // End:0xa3
        if(Instigator.Controller.ShotTarget != none && Instigator.Controller.ShotTarget.Controller != none)
        {
            Instigator.Controller.ShotTarget.Controller.ReceiveProjectileWarning(self);
        }
        InstigatorController = Instigator.Controller;
    }
    // End:0x14f
    if(bDynamicLight && Level.NetMode != 1)
    {
        PC = Level.GetLocalPlayerController();
        // End:0x14f
        if(PC == none || PC.ViewTarget == none || VSize(PC.ViewTarget.Location - Location) > float(4000))
        {
            LightType = 0;
            bDynamicLight = false;
        }
    }
    bReadyToSplash = true;
}

function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation, bool bBehindView);
simulated function bool CanSplash()
{
    return bReadyToSplash;
}

function OnEndRound()
{
    super.OnEndRound();
    Reset();
}

function Reset()
{
    Destroy();
}

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
    return !P.BeyondViewDistance(SpawnLocation, MaxEffectDistance);
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float damageScale, dist;
    local Vector Dir;
    local float fActualMomentum;

    // End:0x0b
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x25b
    foreach VisibleCollidingActors(class'Actor', Victims, DamageRadius, HitLocation)
    {
        // End:0x25a
        if(Victims != self && HurtWall != Victims && Victims.Role == 4 && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0, VSize(Dir));
            Dir = Dir / dist;
            damageScale = 1.0 - FMax(0.0, dist - Victims.CollisionRadius / DamageRadius);
            // End:0x122
            if(Instigator == none || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            // End:0x138
            if(Victims == LastTouched)
            {
                LastTouched = none;
            }
            // End:0x15a
            if(Victims.IsA('Pawn'))
            {
                fActualMomentum = Momentum_Pawn;
            }
            // End:0x165
            else
            {
                fActualMomentum = MomentumTransfer;
            }
            Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * fActualMomentum * Dir, DamageType, 0, MyWeaponType);
            SufferEffect(Pawn(Victims), dist, 1.0);
            // End:0x25a
            if(Vehicle(Victims) != none && Vehicle(Victims).Health > 0)
            {
                Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
            }
        }                
    }
    // End:0x4b1
    if(LastTouched != none && LastTouched != self && LastTouched.Role == 4 && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = LastTouched;
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0, VSize(Dir));
        Dir = Dir / dist;
        damageScale = FMax(Victims.CollisionRadius / Victims.CollisionRadius + Victims.CollisionHeight, 1.0 - FMax(0.0, dist - Victims.CollisionRadius / DamageRadius));
        // End:0x38f
        if(Instigator == none || Instigator.Controller == none)
        {
            Victims.SetDelayedDamageInstigatorController(InstigatorController);
        }
        // End:0x3b1
        if(Victims.IsA('Pawn'))
        {
            fActualMomentum = Momentum_Pawn;
        }
        // End:0x3bc
        else
        {
            fActualMomentum = MomentumTransfer;
        }
        Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - 0.50 * Victims.CollisionHeight + Victims.CollisionRadius * Dir, damageScale * fActualMomentum * Dir, DamageType, 0, MyWeaponType);
        SufferEffect(Pawn(Victims), dist, 1.0);
        // End:0x4b1
        if(Vehicle(Victims) != none && Vehicle(Victims).Health > 0)
        {
            Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
        }
    }
    bHurtEntry = false;
}

function bool EncroachingOn(Actor Other)
{
    // End:0x28
    if(Other.Brush != none || Brush(Other) != none)
    {
        return true;
    }
    return false;
}

singular simulated function Touch(Actor Other)
{
    local Vector HitLocation, HitNormal;

    // End:0x0d
    if(Other == none)
    {
        return;
    }
    // End:0x12c
    if(Other.bProjTarget || Other.bBlockActors)
    {
        LastTouched = Other;
        // End:0x84
        if(Velocity == vect(0.0, 0.0, 0.0) || Other.IsA('Mover'))
        {
            ProcessTouch(Other, Location);
            LastTouched = none;
            return;
        }
        // End:0xc8
        if(Other.TraceThisActor(HitLocation, HitNormal, Location, Location - float(2) * Velocity, GetCollisionExtent()))
        {
            HitLocation = Location;
        }
        ProcessTouch(Other, HitLocation);
        LastTouched = none;
        // End:0x12c
        if(Role < 4 && Other.Role == 4 && Pawn(Other) != none)
        {
            ClientSideTouch(Other, HitLocation);
        }
    }
}

simulated function ClientSideTouch(Actor Other, Vector HitLocation)
{
    Other.TakeDamage(int(Damage), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x31
    if(Other != Instigator)
    {
        Explode(HitLocation, Normal(HitLocation - Other.Location));
    }
}

singular simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    local PlayerController PC;

    // End:0x121
    if(Role == 4)
    {
        // End:0x119
        if(!Wall.bStatic && !Wall.bWorldGeometry)
        {
            // End:0x6f
            if(Instigator == none || Instigator.Controller == none)
            {
                Wall.SetDelayedDamageInstigatorController(InstigatorController);
            }
            Wall.TakeDamage(int(Damage), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
            // End:0x10e
            if(DamageRadius > float(0) && Vehicle(Wall) != none && Vehicle(Wall).Health > 0)
            {
                Vehicle(Wall).DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
            }
            HurtWall = Wall;
        }
        MakeNoise(1.0);
    }
    Explode(Location + ExploWallOut * HitNormal, HitNormal);
    // End:0x25a
    if(ExplosionDecal != none && Level.NetMode != 1)
    {
        // End:0x242
        if(ExplosionDecal.default.CullDistance != float(0))
        {
            PC = Level.GetLocalPlayerController();
            // End:0x1d2
            if(!PC.BeyondViewDistance(Location, ExplosionDecal.default.CullDistance))
            {
                Spawn(ExplosionDecal, self,, Location, rotator(-HitNormal));
            }
            // End:0x23f
            else
            {
                // End:0x23f
                if(Instigator != none && PC == Instigator.Controller && !PC.BeyondViewDistance(Location, 2.0 * ExplosionDecal.default.CullDistance))
                {
                    Spawn(ExplosionDecal, self,, Location, rotator(-HitNormal));
                }
            }
        }
        // End:0x25a
        else
        {
            Spawn(ExplosionDecal, self,, Location, rotator(-HitNormal));
        }
    }
    HurtWall = none;
}

simulated function BlowUp(Vector HitLocation)
{
    HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
    // End:0x37
    if(Role == 4)
    {
        MakeNoise(1.0);
    }
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    Destroy();
}

final simulated function RandSpin(float spinRate)
{
    DesiredRotation = RotRand();
    RotationRate.Yaw = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Pitch = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Roll = int(spinRate * float(2) * FRand() - spinRate);
}

static simulated function float GetRange()
{
    // End:0x18
    if(default.LifeSpan == 0.0)
    {
        return 15000.0;
    }
    // End:0x25
    else
    {
        return default.MaxSpeed * default.LifeSpan;
    }
}

function bool IsStationary()
{
    return false;
}

simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY);
simulated function SufferEffect(Pawn Victim, float fDist, float fReduceRate);

defaultproperties
{
    MaxSpeed=2000.0
    TossZ=100.0
    DamageRadius=220.0
    MyDamageType=class'DamageType'
    fGravMass=1.0
    DrawType=2
    bAcceptsProjectors=true
    bReplicateInstigator=true
    bOnlyDirtyReplication=true
    bNetInitialRotation=true
    Physics=6
    RemoteRole=2
    NetPriority=2.50
    LifeSpan=14.0
    Texture=Texture'S_Camera'
    bUnlit=true
    bGameRelevant=true
    bCanBeDamaged=true
    bDisturbFluidSurface=true
    SoundVolume=0
    TransientSoundVolume=1.0
    CollisionRadius=0.0
    CollisionHeight=0.0
    bCollideActors=true
    bCollideWorld=true
    bUseCylinderCollision=true
}