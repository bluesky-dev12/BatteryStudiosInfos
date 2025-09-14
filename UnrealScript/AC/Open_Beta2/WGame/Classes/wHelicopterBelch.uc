class wHelicopterBelch extends Projectile;

var wEmitter SmokeTrail;
var Vector Dir;

simulated function Destroyed()
{
    // End:0x1C
    if(SmokeTrail != none)
    {
        SmokeTrail.mRegen = false;
    }
    super(Actor).Destroyed();
    //return;    
}

simulated function PostBeginPlay()
{
    // End:0x50
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x41
        if(!Level.bDropDetail)
        {
            Spawn(Class'XEffects.RocketSmokeRing',,, Location, Rotation);
        }
        SmokeTrail = Spawn(Class'WGame_Decompressed.wBelchFlames', self);
    }
    Dir = Vector(Rotation);
    Velocity = Speed * Dir;
    // End:0x91
    if(Level.bDropDetail)
    {
        bDynamicLight = false;
        LightType = 0;
    }
    super.PostBeginPlay();
    //return;    
}

simulated function Landed(Vector HitNormal)
{
    Explode(Location, HitNormal);
    //return;    
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
    // End:0x53
    if((Other != Instigator) && !Other.IsA('Projectile') || Other.bProjTarget)
    {
        Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
    }
    //return;    
}

function BlowUp(Vector HitLocation)
{
    HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
    MakeNoise(1.0000000);
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    BlowUp(HitLocation);
    Destroy();
    //return;    
}

defaultproperties
{
    Speed=650.0000000
    MaxSpeed=650.0000000
    Damage=45.0000000
    DamageRadius=140.0000000
    MomentumTransfer=50000.0000000
    MyDamageType=Class'WGame_Decompressed.wDamTypeBelch'
    ExplosionDecal=Class'XEffects.RocketMark'
    LightType=1
    LightEffect=21
    LightHue=28
    LightBrightness=255.0000000
    LightRadius=5.0000000
    DrawType=1
    bHidden=true
    bDynamicLight=true
    LifeSpan=6.0000000
    DrawScale=0.3000000
    AmbientGlow=96
    Style=3
    SoundVolume=255
    SoundRadius=100.0000000
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=0,Roll=50000)
    DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
    ForceType=2
    ForceRadius=100.0000000
    ForceScale=5.0000000
}