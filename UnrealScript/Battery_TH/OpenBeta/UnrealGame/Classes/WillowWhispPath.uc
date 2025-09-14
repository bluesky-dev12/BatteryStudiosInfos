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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        NumPoints, WayPoints;
}

function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    //return;    
}

simulated function PostNetBeginPlay()
{
    //return;    
}

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
        else
        {
            mRegen = false;
            LifeSpan = 1.5000000;
            LifeLeft = 1.5000000;
            Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        }
        return;
    }
    bHeadedRight = false;
    Destination = WayPoints[Position];
    Acceleration = float(1200) * Normal(Destination - Location);
    Velocity *= 0.5000000;
    Velocity.Z = 0.5000000 * (Velocity.Z + Acceleration.Z);
    SetRotation(Rotator(Acceleration));
    Position++;
    //return;    
}

auto state Pathing
{
    simulated function Tick(float DeltaTime)
    {
        Acceleration = float(1200) * Normal(Destination - Location);
        Velocity = Velocity + (DeltaTime * Acceleration);
        // End:0x5C
        if(!bHeadedRight)
        {
            bHeadedRight = (Velocity Dot Acceleration) > float(0);            
        }
        else
        {
            // End:0x76
            if((Velocity Dot Acceleration) < float(0))
            {
                StartNextPath();
            }
        }
        // End:0x93
        if(VSize(Destination - Location) < float(80))
        {
            StartNextPath();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    mStartParticles=0
    mMaxParticles=150
    mLifeRange[0]=1.2500000
    mLifeRange[1]=1.2500000
    mRegenRange[0]=90.0000000
    mRegenRange[1]=90.0000000
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mMassRange[0]=-0.0300000
    mMassRange[1]=-0.0100000
    mRandOrient=true
    mSpinRange[0]=-75.0000000
    mSpinRange[1]=75.0000000
    mSizeRange[0]=15.0000000
    mSizeRange[1]=20.0000000
    mGrowthRate=13.0000000
    mColorRange[1]=(R=255,G=210,B=210,A=255)
    mAttenFunc=1
    mRandTextures=true
    Physics=6
    RemoteRole=2
    Skins[0]=Texture'Engine.S_Pawn'
    Style=5
    bIgnoreOutOfWorld=true
}