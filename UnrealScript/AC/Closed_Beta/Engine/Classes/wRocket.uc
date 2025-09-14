class wRocket extends wProjectile
    notplaceable;

var bool bRing;
var bool bHitWater;
var bool bWaterStart;
var int NumExtraRockets;
var Emitter SmokeTrail;
var Effects Corona;
var float AccelerationAddPerSec;
var() float FlockRadius;
var() float FlockStiffness;
var() float FlockMaxForce;
var() float FlockCurlForce;
var Vector Dir;
var Class<Emitter> class_Smoke;
var Class<Effects> class_Corona;
var Class<wEmitter> class_ExplosionCrap;
var bool bExploded;
var Vector vHitNormal;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        vHitNormal;
}

simulated function Destroyed()
{
    // End:0x1A
    if(SmokeTrail != none)
    {
        SmokeTrail.Kill();
    }
    // End:0x31
    if(Corona != none)
    {
        Corona.Destroy();
    }
    // End:0x4D
    if(bExploded == false)
    {
        Explode(Location, vHitNormal);
    }
    super(Actor).Destroyed();
    //return;    
}

function SetSpeed(float fSpeed)
{
    Speed = fSpeed;
    Velocity = Speed * Vector(Rotation);
    // End:0x4C
    if(Instigator.HeadVolume.bWaterVolume)
    {
        Velocity = 0.6000000 * Velocity;
    }
    //return;    
}

simulated function PostNetBeginPlay()
{
    local PlayerController PC;

    super(Actor).PostNetBeginPlay();
    // End:0x21
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return;
    }
    // End:0x61
    if(Level.bDropDetail || int(Level.DetailMode) == int(0))
    {
        bDynamicLight = false;
        LightType = 0;        
    }
    else
    {
        PC = Level.GetLocalPlayerController();
        // End:0x9D
        if((Instigator != none) && PC == Instigator.Controller)
        {
            return;
        }
        // End:0xFC
        if(((PC == none) || PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(3000))
        {
            bDynamicLight = false;
            LightType = 0;
        }
    }
    //return;    
}

simulated function Landed(Vector HitNormal)
{
    Explode(Location, HitNormal);
    //return;    
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x56
    if((Other != Instigator) && !Other.IsA('Projectile') || Other.bProjTarget)
    {
        Explode(HitLocation, Vector(Rotation) * float(-1));
    }
    //return;    
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    vHitNormal = HitNormal;
    mHitMaterial = HitMaterial;
    mHitActor = Wall;
    super(Projectile).HitWall(HitNormal, Wall, HitMaterial);
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0x1B4
    if(bExploded == false)
    {
        PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
        // End:0xE9
        if(EffectIsRelevant(Location, false))
        {
            Spawn(GetExplosionClass(),,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xE9
            if(((class_ExplosionCrap != none) && PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
            }
        }
        CombatLog((((((((((("[EXPLODE_EVENT] WeaponId=" $ string(BaseParams.iWeaponID)) $ " HitXCoord=") $ string(HitLocation.X)) $ " HitYCoord=") $ string(HitLocation.Y)) $ " HitZCoord=") $ string(HitLocation.Z)) $ " InRadius=") $ string(BaseParams.fExplRad_Inner)) $ " OutRadius=") $ string(BaseParams.fExplRad_Outer));
    }
    BlowUp(HitLocation);
    bExploded = true;
    Destroy();
    //return;    
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x39
    if(VSize(Velocity) >= MaxSpeed)
    {
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Disable('Tick');        
    }
    else
    {
        Acceleration += (Normal(Velocity) * (AccelerationAddPerSec * DeltaTime));
    }
    //return;    
}

simulated function wLoadOut(int iID)
{
    super.wLoadOut(iID);
    SetSpeed(BaseParams.fProjSpeed);
    LifeSpan = BaseParams.fActiveTime;
    class_Smoke = ResParams.default.Proj_Smoke;
    class_Corona = ResParams.default.Proj_Corona;
    class_ExplosionCrap = ResParams.default.Proj_ExplosionCrap;
    ExplosionDecal = ResParams.default.Proj_ExplosionDecal;
    // End:0xBA
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        SmokeTrail = Spawn(class_Smoke, self);
        Corona = Spawn(class_Corona, self);
    }
    ExplosionClass_dirt = ResParams.default.effect_Explosion_dirt;
    ExplosionClass_grass = ResParams.default.effect_Explosion_grass;
    ExplosionClass_metal = ResParams.default.effect_Explosion_metal;
    ExplosionClass_snow = ResParams.default.effect_Explosion_snow;
    ExplosionClass_water = ResParams.default.effect_Explosion_water;
    ExplosionClass_wood = ResParams.default.effect_Explosion_wood;
    //return;    
}

defaultproperties
{
    AccelerationAddPerSec=1000.0000000
    FlockRadius=12.0000000
    FlockStiffness=-40.0000000
    FlockMaxForce=600.0000000
    FlockCurlForce=450.0000000
    MaxSpeed=10000.0000000
    MyDamageType=Class'Engine.wDamageRPG'
    MyWeaponType=7
    LightType=1
    LightEffect=21
    LightHue=31
    LightSaturation=156
    LightBrightness=450.0000000
    LightRadius=35.0000000
    CullDistance=7500.0000000
    bDynamicLight=true
    AmbientGlow=96
    bUnlit=false
    FluidSurfaceShootStrengthMod=10.0000000
    SoundVolume=255
    SoundRadius=100.0000000
    CollisionRadius=3.0000000
    CollisionHeight=3.0000000
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=0,Roll=50000)
    DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
    ForceType=2
    ForceRadius=100.0000000
    ForceScale=5.0000000
}