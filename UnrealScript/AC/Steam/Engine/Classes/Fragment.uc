/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Fragment.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:4
 *	States:2
 *
 *******************************************************************************/
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
    // End:0x5e
    if(Level.TimeSeconds - SplashTime > 0.250 && Physics == 2 && Abs(Velocity.Z) > float(100))
    {
        SplashTime = Level.TimeSeconds;
        return true;
    }
    return false;
}

simulated function CalcVelocity(Vector Momentum)
{
    local float ExplosionSize;

    ExplosionSize = 0.0110 * VSize(Momentum);
    Velocity = 0.00330 * Momentum + 0.70 * VRand() * ExplosionSize + FRand() * 100.0 + 100.0;
    Velocity.Z += 0.50 * ExplosionSize;
}

simulated function HitWall(Vector HitNormal, Actor HitWall, Material HitMaterial)
{
    local float Speed;

    Velocity = 0.50 * Velocity Dot HitNormal * HitNormal * -2.0 + Velocity;
    Speed = VSize(Velocity);
    // End:0x9f
    if(bFirstHit && Speed < float(400))
    {
        bFirstHit = false;
        bRotateToDesired = true;
        bFixedRotationDir = false;
        DesiredRotation.Pitch = 0;
        DesiredRotation.Yaw = int(FRand() * float(65536));
        DesiredRotation.Roll = 0;
    }
    RotationRate.Yaw = int(float(RotationRate.Yaw) * 0.750);
    RotationRate.Roll = int(float(RotationRate.Roll) * 0.750);
    RotationRate.Pitch = int(float(RotationRate.Pitch) * 0.750);
    // End:0x13a
    if(Speed < float(60) && HitNormal.Z > 0.70)
    {
        SetPhysics(0);
        bBounce = false;
        GotoState('Dying');
    }
    // End:0x19b
    else
    {
        // End:0x19b
        if(Speed > float(80))
        {
            // End:0x179
            if(FRand() < 0.50)
            {
                PlaySound(ImpactSound, 0,,, 105.0, 0.850 + FRand() * 0.30, true);
            }
            // End:0x19b
            else
            {
                PlaySound(AltImpactSound, 0,,, 105.0, 0.850 + FRand() * 0.30, true);
            }
        }
    }
}

final simulated function RandSpin(float spinRate)
{
    DesiredRotation = RotRand();
    RotationRate.Yaw = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Pitch = int(spinRate * float(2) * FRand() - spinRate);
    RotationRate.Roll = int(spinRate * float(2) * FRand() - spinRate);
}

auto state Flying
{
    simulated function Timer()
    {
        GotoState('Dying');
    }

    singular simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
    {
        // End:0x8f
        if(NewVolume.bWaterVolume)
        {
            Velocity = 0.20 * Velocity;
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
            RotationRate = 0.20 * RotationRate;
            GotoState('Dying');
        }
    }

    simulated function BeginState()
    {
        RandSpin(125000.0);
        // End:0x35
        if(Abs(float(RotationRate.Pitch)) < float(10000))
        {
            RotationRate.Pitch = 10000;
        }
        // End:0x5f
        if(Abs(float(RotationRate.Roll)) < float(10000))
        {
            RotationRate.Roll = 10000;
        }
        LinkMesh(Fragments[int(FRand() * float(numFragmentTypes))]);
        // End:0xa6
        if(Level.NetMode == 0)
        {
            LifeSpan = 20.0 + float(40) * FRand();
        }
        SetTimer(5.0, true);
    }

}

state Dying
{
    function TakeDamage(int Dam, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
    {
        Destroy();
    }

    simulated function Timer()
    {
        // End:0x0b
        if(!PlayerCanSeeMe())
        {
            Destroy();
        }
    }

    simulated function BeginState()
    {
        SetTimer(1.0 + FRand(), true);
        SetCollision(true, false, false);
    }

}

defaultproperties
{
    bFirstHit=true
    DrawType=2
    Physics=2
    LifeSpan=20.0
    bDestroyInPainVolume=true
    SoundVolume=0
    CollisionRadius=18.0
    CollisionHeight=4.0
    bCollideWorld=true
    bBounce=true
    bFixedRotationDir=true
}