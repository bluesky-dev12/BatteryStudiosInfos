class Projectile extends Actor
    abstract
    native
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
var Class<DamageType> MyDamageType;
var Actor.eWeaponType MyWeaponType;
var Sound SpawnSound;
var Sound ImpactSound;
var Class<Projector> ExplosionDecal;
var float ExploWallOut;
var Controller InstigatorController;
var Actor LastTouched;
var Actor HurtWall;
var float MaxEffectDistance;
var bool bScriptPostRender;
var float fGravMass;

// Export UProjectile::execGetInstigatorsDirectionbyDot(FFrame&, void* const)
native function float GetInstigatorsDirectionbyDot(Rotator pawnRotation, Vector pawnVelocity)
{
    //native.pawnRotation;
    //native.pawnVelocity;        
}

simulated function PostBeginPlay()
{
    local PlayerController PC;

    // End:0xB7
    if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
    {
        // End:0xA3
        if((Instigator.Controller.ShotTarget != none) && Instigator.Controller.ShotTarget.Controller != none)
        {
            Instigator.Controller.ShotTarget.Controller.ReceiveProjectileWarning(self);
        }
        InstigatorController = Instigator.Controller;
    }
    // End:0x14F
    if(bDynamicLight && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        PC = Level.GetLocalPlayerController();
        // End:0x14F
        if(((PC == none) || PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(4000))
        {
            LightType = 0;
            bDynamicLight = false;
        }
    }
    bReadyToSplash = true;
    //return;    
}

function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation, bool bBehindView)
{
    //return;    
}

simulated function bool CanSplash()
{
    return bReadyToSplash;
    //return;    
}

function OnEndRound()
{
    super.OnEndRound();
    Reset();
    //return;    
}

function Reset()
{
    Destroy();
    //return;    
}

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
    return !P.BeyondViewDistance(SpawnLocation, MaxEffectDistance);
    //return;    
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local Actor Victims;
    local float damageScale, dist;
    local Vector Dir;
    local float fActualMomentum;

    // End:0x0B
    if(bHurtEntry)
    {
        return;
    }
    bHurtEntry = true;
    // End:0x25B
    foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
    {
        // End:0x25A
        if((((Victims != self) && HurtWall != Victims) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
        {
            Dir = Victims.Location - HitLocation;
            dist = FMax(1.0000000, VSize(Dir));
            Dir = Dir / dist;
            damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
            // End:0x122
            if((Instigator == none) || Instigator.Controller == none)
            {
                Victims.SetDelayedDamageInstigatorController(InstigatorController);
            }
            // End:0x138
            if(Victims == LastTouched)
            {
                LastTouched = none;
            }
            // End:0x15A
            if(Victims.IsA('Pawn'))
            {
                fActualMomentum = Momentum_Pawn;                
            }
            else
            {
                fActualMomentum = MomentumTransfer;
            }
            Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, DamageType, 0, int(MyWeaponType));
            SufferEffect(Pawn(Victims), dist, 1.0000000);
            // End:0x25A
            if((Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
            {
                Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
            }
        }        
    }    
    // End:0x4B1
    if((((LastTouched != none) && LastTouched != self) && int(LastTouched.Role) == int(ROLE_Authority)) && !LastTouched.IsA('FluidSurfaceInfo'))
    {
        Victims = LastTouched;
        LastTouched = none;
        Dir = Victims.Location - HitLocation;
        dist = FMax(1.0000000, VSize(Dir));
        Dir = Dir / dist;
        damageScale = FMax(Victims.CollisionRadius / (Victims.CollisionRadius + Victims.CollisionHeight), 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius));
        // End:0x38F
        if((Instigator == none) || Instigator.Controller == none)
        {
            Victims.SetDelayedDamageInstigatorController(InstigatorController);
        }
        // End:0x3B1
        if(Victims.IsA('Pawn'))
        {
            fActualMomentum = Momentum_Pawn;            
        }
        else
        {
            fActualMomentum = MomentumTransfer;
        }
        Victims.TakeDamage(int(damageScale * DamageAmount), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * fActualMomentum) * Dir, DamageType, 0, int(MyWeaponType));
        SufferEffect(Pawn(Victims), dist, 1.0000000);
        // End:0x4B1
        if((Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
        {
            Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, InstigatorController, DamageType, Momentum, HitLocation);
        }
    }
    bHurtEntry = false;
    //return;    
}

function bool EncroachingOn(Actor Other)
{
    // End:0x28
    if((Other.Brush != none) || Brush(Other) != none)
    {
        return true;
    }
    return false;
    //return;    
}

singular simulated function Touch(Actor Other)
{
    local Vector HitLocation, HitNormal;

    // End:0x0D
    if(Other == none)
    {
        return;
    }
    // End:0x12C
    if(Other.bProjTarget || Other.bBlockActors)
    {
        LastTouched = Other;
        // End:0x84
        if((Velocity == vect(0.0000000, 0.0000000, 0.0000000)) || Other.IsA('Mover'))
        {
            ProcessTouch(Other, Location);
            LastTouched = none;
            return;
        }
        // End:0xC8
        if(Other.TraceThisActor(HitLocation, HitNormal, Location, Location - (float(2) * Velocity), GetCollisionExtent()))
        {
            HitLocation = Location;
        }
        ProcessTouch(Other, HitLocation);
        LastTouched = none;
        // End:0x12C
        if(((int(Role) < int(ROLE_Authority)) && int(Other.Role) == int(ROLE_Authority)) && Pawn(Other) != none)
        {
            ClientSideTouch(Other, HitLocation);
        }
    }
    //return;    
}

simulated function ClientSideTouch(Actor Other, Vector HitLocation)
{
    Other.TakeDamage(int(Damage), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
    //return;    
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x31
    if(Other != Instigator)
    {
        Explode(HitLocation, Normal(HitLocation - Other.Location));
    }
    //return;    
}

singular simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    local PlayerController PC;

    // End:0x121
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x119
        if(!Wall.bStatic && !Wall.bWorldGeometry)
        {
            // End:0x6F
            if((Instigator == none) || Instigator.Controller == none)
            {
                Wall.SetDelayedDamageInstigatorController(InstigatorController);
            }
            Wall.TakeDamage(int(Damage), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
            // End:0x10E
            if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
            {
                Vehicle(Wall).DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
            }
            HurtWall = Wall;
        }
        MakeNoise(1.0000000);
    }
    Explode(Location + (ExploWallOut * HitNormal), HitNormal);
    // End:0x25A
    if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x242
        if(ExplosionDecal.default.CullDistance != float(0))
        {
            PC = Level.GetLocalPlayerController();
            // End:0x1D2
            if(!PC.BeyondViewDistance(Location, ExplosionDecal.default.CullDistance))
            {
                Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));                
            }
            else
            {
                // End:0x23F
                if(((Instigator != none) && PC == Instigator.Controller) && !PC.BeyondViewDistance(Location, 2.0000000 * ExplosionDecal.default.CullDistance))
                {
                    Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
                }
            }            
        }
        else
        {
            Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
        }
    }
    HurtWall = none;
    //return;    
}

simulated function BlowUp(Vector HitLocation)
{
    HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
    // End:0x37
    if(int(Role) == int(ROLE_Authority))
    {
        MakeNoise(1.0000000);
    }
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    Destroy();
    //return;    
}

final simulated function RandSpin(float spinRate)
{
    DesiredRotation = RotRand();
    RotationRate.Yaw = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Pitch = int(((spinRate * float(2)) * FRand()) - spinRate);
    RotationRate.Roll = int(((spinRate * float(2)) * FRand()) - spinRate);
    //return;    
}

static simulated function float GetRange()
{
    // End:0x18
    if(default.LifeSpan == 0.0000000)
    {
        return 15000.0000000;        
    }
    else
    {
        return default.MaxSpeed * default.LifeSpan;
    }
    //return;    
}

function bool IsStationary()
{
    return false;
    //return;    
}

simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY)
{
    //return;    
}

simulated function SufferEffect(Pawn Victim, float fDist, float fReduceRate)
{
    //return;    
}

defaultproperties
{
    MaxSpeed=2000.0000000
    TossZ=100.0000000
    DamageRadius=220.0000000
    MyDamageType=Class'Engine.DamageType'
    fGravMass=1.0000000
    DrawType=2
    bAcceptsProjectors=false
    bReplicateInstigator=true
    bOnlyDirtyReplication=true
    bNetInitialRotation=true
    Physics=6
    RemoteRole=2
    NetPriority=2.5000000
    LifeSpan=14.0000000
    Texture=Texture'Engine.S_Camera'
    bUnlit=true
    bGameRelevant=true
    bCanBeDamaged=true
    bDisturbFluidSurface=true
    SoundVolume=0
    TransientSoundVolume=1.0000000
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
    bCollideActors=true
    bCollideWorld=true
    bUseCylinderCollision=true
}