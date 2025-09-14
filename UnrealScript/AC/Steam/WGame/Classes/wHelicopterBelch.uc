/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wHelicopterBelch.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:6
 *
 *******************************************************************************/
class wHelicopterBelch extends Projectile;

var wEmitter SmokeTrail;
var Vector Dir;

simulated function Destroyed()
{
    // End:0x1c
    if(SmokeTrail != none)
    {
        SmokeTrail.mRegen = false;
    }
    super(Actor).Destroyed();
}

simulated function PostBeginPlay()
{
    // End:0x50
    if(Level.NetMode != 1)
    {
        // End:0x41
        if(!Level.bDropDetail)
        {
            Spawn(class'RocketSmokeRing',,, Location, Rotation);
        }
        SmokeTrail = Spawn(class'wBelchFlames', self);
    }
    Dir = vector(Rotation);
    Velocity = Speed * Dir;
    // End:0x91
    if(Level.bDropDetail)
    {
        bDynamicLight = false;
        LightType = 0;
    }
    super.PostBeginPlay();
}

simulated function Landed(Vector HitNormal)
{
    Explode(Location, HitNormal);
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x53
    if(Other != Instigator && !Other.IsA('Projectile') || Other.bProjTarget)
    {
        Explode(HitLocation, vect(0.0, 0.0, 1.0));
    }
}

function BlowUp(Vector HitLocation)
{
    HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
    MakeNoise(1.0);
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    BlowUp(HitLocation);
    Destroy();
}

defaultproperties
{
    Speed=650.0
    MaxSpeed=650.0
    Damage=45.0
    DamageRadius=140.0
    MomentumTransfer=50000.0
    MyDamageType=class'wDamTypeBelch'
    ExplosionDecal=Class'XEffects.RocketMark'
    LightType=1
    LightEffect=21
    LightHue=28
    LightBrightness=255.0
    LightRadius=5.0
    DrawType=1
    bHidden=true
    bDynamicLight=true
    LifeSpan=6.0
    DrawScale=0.30
    AmbientGlow=96
    Style=3
    SoundVolume=255
    SoundRadius=100.0
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=0,Roll=50000)
    DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
    ForceType=2
    ForceRadius=100.0
    ForceScale=5.0
}