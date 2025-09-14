/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wRocket.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:17
 *	Functions:9
 *
 *******************************************************************************/
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
var class<Emitter> class_Smoke;
var class<Effects> class_Corona;
var class<wEmitter> class_ExplosionCrap;
var bool bExploded;
var Vector vHitNormal;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        vHitNormal;

}

simulated function Destroyed()
{
    // End:0x1a
    if(SmokeTrail != none)
    {
        SmokeTrail.Kill();
    }
    // End:0x31
    if(Corona != none)
    {
        Corona.Destroy();
    }
    // End:0x4d
    if(bExploded == false)
    {
        Explode(Location, vHitNormal);
    }
    super(Actor).Destroyed();
}

function SetSpeed(float fSpeed)
{
    Speed = fSpeed;
    Velocity = Speed * vector(Rotation);
    // End:0x4c
    if(Instigator.HeadVolume.bWaterVolume)
    {
        Velocity = 0.60 * Velocity;
    }
}

simulated function PostNetBeginPlay()
{
    local PlayerController PC;

    super(Actor).PostNetBeginPlay();
    // End:0x21
    if(Level.NetMode == 1)
    {
        return;
    }
    // End:0x61
    if(Level.bDropDetail || Level.DetailMode == 0)
    {
        bDynamicLight = false;
        LightType = 0;
    }
    // End:0xfc
    else
    {
        PC = Level.GetLocalPlayerController();
        // End:0x9d
        if(Instigator != none && PC == Instigator.Controller)
        {
            return;
        }
        // End:0xfc
        if(PC == none || PC.ViewTarget == none || VSize(PC.ViewTarget.Location - Location) > float(3000))
        {
            bDynamicLight = false;
            LightType = 0;
        }
    }
}

simulated function Landed(Vector HitNormal)
{
    Explode(Location, HitNormal);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x56
    if(Other != Instigator && !Other.IsA('Projectile') || Other.bProjTarget)
    {
        Explode(HitLocation, vector(Rotation) * float(-1));
    }
}

simulated function HitWall(Vector HitNormal, Actor Wall, Material HitMaterial)
{
    vHitNormal = HitNormal;
    mHitMaterial = HitMaterial;
    mHitActor = Wall;
    super(Projectile).HitWall(HitNormal, Wall, HitMaterial);
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    local PlayerController PC;

    // End:0x1b4
    if(bExploded == false)
    {
        PlaySound(ResParams.default.sound_Explosion, 0,,, ResParams.default.rad_Explosion);
        // End:0xe9
        if(EffectIsRelevant(Location, false))
        {
            Spawn(GetExplosionClass(),,, HitLocation + HitNormal * float(20), rotator(HitNormal));
            PC = Level.GetLocalPlayerController();
            // End:0xe9
            if(class_ExplosionCrap != none && PC.ViewTarget != none && VSize(PC.ViewTarget.Location - Location) < float(5000))
            {
                Spawn(class_ExplosionCrap,,, HitLocation + HitNormal * float(20), rotator(HitNormal));
            }
        }
        CombatLog("[EXPLODE_EVENT] WeaponId=" $ string(BaseParams.iWeaponID) $ " HitXCoord=" $ string(HitLocation.X) $ " HitYCoord=" $ string(HitLocation.Y) $ " HitZCoord=" $ string(HitLocation.Z) $ " InRadius=" $ string(BaseParams.fExplRad_Inner) $ " OutRadius=" $ string(BaseParams.fExplRad_Outer));
    }
    BlowUp(HitLocation);
    bExploded = true;
    Destroy();
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    // End:0x39
    if(VSize(Velocity) >= MaxSpeed)
    {
        Acceleration = vect(0.0, 0.0, 0.0);
        Disable('Tick');
    }
    // End:0x55
    else
    {
        Acceleration += Normal(Velocity) * AccelerationAddPerSec * DeltaTime;
    }
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
    // End:0xba
    if(Level.NetMode != 1)
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
}

defaultproperties
{
    AccelerationAddPerSec=1000.0
    FlockRadius=12.0
    FlockStiffness=-40.0
    FlockMaxForce=600.0
    FlockCurlForce=450.0
    MaxSpeed=10000.0
    MyDamageType=class'wDamageRPG'
    MyWeaponType=7
    LightType=1
    LightEffect=21
    LightHue=31
    LightSaturation=156
    LightBrightness=450.0
    LightRadius=35.0
    CullDistance=7500.0
    bDynamicLight=true
    AmbientGlow=96
    bUnlit=true
    FluidSurfaceShootStrengthMod=10.0
    SoundVolume=255
    SoundRadius=100.0
    CollisionRadius=3.0
    CollisionHeight=3.0
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=0,Roll=50000)
    DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
    ForceType=2
    ForceRadius=100.0
    ForceScale=5.0
}