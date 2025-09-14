class Fragment extends Effects
    notplaceable;

var() Mesh Fragments[11];
var int numFragmentTypes;
var bool bFirstHit;
var() Sound ImpactSound;
var() Sound AltImpactSound;
var() float SplashTime;

function bool CanSplash()
{
    // End:0x5E
    if((((Level.TimeSeconds - SplashTime) > 0.2500000) && int(Physics) == int(2)) && Abs(Velocity.Z) > float(100))
    {
        SplashTime = Level.TimeSeconds;
        return true;
    }
    return false;
    //return;    
}

simulated function CalcVelocity(Vector Momentum)
{
    local float ExplosionSize;

    ExplosionSize = 0.0110000 * VSize(Momentum);
    Velocity = (0.0033000 * Momentum) + ((0.7000000 * VRand()) * ((ExplosionSize + (FRand() * 100.0000000)) + 100.0000000));
    Velocity.Z += (0.5000000 * ExplosionSize);
    //return;    
}

simulated function HitWall(Vector HitNormal, Actor HitWall, Material HitMaterial)
{
    local float Speed;

    Velocity = 0.5000000 * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
    Speed = VSize(Velocity);
    // End:0x9F
    if(bFirstHit && Speed < float(400))
    {
        bFirstHit = false;
        bRotateToDesired = true;
        bFixedRotationDir = false;
        DesiredRotation.Pitch = 0;
        DesiredRotation.Yaw = int(FRand() * float(65536));
        DesiredRotation.Roll = 0;
    }
    RotationRate.Yaw = int(float(RotationRate.Yaw) * 0.7500000);
    RotationRate.Roll = int(float(RotationRate.Roll) * 0.7500000);
    RotationRate.Pitch = int(float(RotationRate.Pitch) * 0.7500000);
    // End:0x13A
    if((Speed < float(60)) && HitNormal.Z > 0.7000000)
    {
        SetPhysics(0);
        bBounce = false;
        GotoState('Dying');        
    }
    else
    {
        // End:0x19B
        if(Speed > float(80))
        {
            // End:0x179
            if(FRand() < 0.5000000)
            {
                PlaySound(ImpactSound, 0,,, 105.0000000, 0.8500000 + (FRand() * 0.3000000), true);                
            }
            else
            {
                PlaySound(AltImpactSound, 0,,, 105.0000000, 0.8500000 + (FRand() * 0.3000000), true);
            }
        }
    }
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

auto state Flying
{
    simulated function Timer()
    {
        GotoState('Dying');
        //return;        
    }

    singular simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x8F
        if(NewVolume.bWaterVolume)
        {
            Velocity = 0.2000000 * Velocity;
            // End:0x75
            if(bFirstHit)
            {
                bFirstHit = false;
                bRotateToDesired = true;
                bFixedRotationDir = false;
                DesiredRotation.Pitch = 0;
                DesiredRotation.Yaw = int(FRand() * float(65536));
                DesiredRotation.Roll = 0;
            }
            RotationRate = 0.2000000 * RotationRate;
            GotoState('Dying');
        }
        //return;        
    }

    simulated function BeginState()
    {
        RandSpin(125000.0000000);
        // End:0x35
        if(Abs(float(RotationRate.Pitch)) < float(10000))
        {
            RotationRate.Pitch = 10000;
        }
        // End:0x5F
        if(Abs(float(RotationRate.Roll)) < float(10000))
        {
            RotationRate.Roll = 10000;
        }
        LinkMesh(Fragments[int(FRand() * float(numFragmentTypes))]);
        // End:0xA6
        if(int(Level.NetMode) == int(NM_Standalone))
        {
            LifeSpan = 20.0000000 + (float(40) * FRand());
        }
        SetTimer(5.0000000, true);
        //return;        
    }
    stop;    
}

state Dying
{
    function TakeDamage(int Dam, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        Destroy();
        //return;        
    }

    simulated function Timer()
    {
        // End:0x0B
        if(!PlayerCanSeeMe())
        {
            Destroy();
        }
        //return;        
    }

    simulated function BeginState()
    {
        SetTimer(1.0000000 + FRand(), true);
        SetCollision(true, false, false);
        //return;        
    }
    stop;    
}

defaultproperties
{
    bFirstHit=true
    DrawType=2
    Physics=2
    LifeSpan=20.0000000
    bDestroyInPainVolume=true
    SoundVolume=0
    CollisionRadius=18.0000000
    CollisionHeight=4.0000000
    bCollideWorld=true
    bBounce=true
    bFixedRotationDir=true
}