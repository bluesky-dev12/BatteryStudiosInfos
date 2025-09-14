/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\WillowWhispPath.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:3
 *	States:1
 *
 *******************************************************************************/
class WillowWhispPath extends wEmitter;

var Vector WayPoints[11];
var int NumPoints;
var int Position;
var Vector Destination;
var bool bHeadedRight;
var float LifeLeft;
var bool bRepeat;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        WayPoints, NumPoints;

}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
}

simulated function PostNetBeginPlay();
simulated function StartNextPath()
{
    // End:0x78
    if(Position >= NumPoints)
    {
        // End:0x32
        if(bRepeat)
        {
            SetLocation(WayPoints[0]);
            Position = 0;
            StartNextPath();
        }
        // End:0x76
        else
        {
            mRegen = false;
            LifeSpan = 1.50;
            LifeLeft = 1.50;
            Velocity = vect(0.0, 0.0, 0.0);
            Acceleration = vect(0.0, 0.0, 0.0);
        }
        return;
    }
    bHeadedRight = false;
    Destination = WayPoints[Position];
    Acceleration = float(1200) * Normal(Destination - Location);
    Velocity *= 0.50;
    Velocity.Z = 0.50 * Velocity.Z + Acceleration.Z;
    SetRotation(rotator(Acceleration));
    ++ Position;
}

auto state Pathing
{
    simulated function Tick(float DeltaTime)
    {
        Acceleration = float(1200) * Normal(Destination - Location);
        Velocity = Velocity + DeltaTime * Acceleration;
        // End:0x5c
        if(!bHeadedRight)
        {
            bHeadedRight = Velocity Dot Acceleration > float(0);
        }
        // End:0x76
        else
        {
            // End:0x76
            if(Velocity Dot Acceleration < float(0))
            {
                StartNextPath();
            }
        }
        // End:0x93
        if(VSize(Destination - Location) < float(80))
        {
            StartNextPath();
        }
    }

}

defaultproperties
{
    mStartParticles=0
    mMaxParticles=150
    mLifeRange[0]=1.250
    mLifeRange[1]=1.250
    mRegenRange[0]=90.0
    mRegenRange[1]=90.0
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-0.030
    mMassRange[1]=-0.010
    mRandOrient=true
    mSpinRange[0]=-75.0
    mSpinRange[1]=75.0
    mSizeRange[0]=15.0
    mSizeRange[1]=20.0
    mGrowthRate=13.0
    mColorRange[1]=(R=255,G=210,B=210,A=255)
    mAttenFunc=1
    mRandTextures=true
    Physics=6
    RemoteRole=2
    Skins=// Object reference not set to an instance of an object.
    
    Style=5
    bIgnoreOutOfWorld=true
}