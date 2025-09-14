/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\WillowWhisp.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:3
 *	States:1
 *
 *******************************************************************************/
class WillowWhisp extends wEmitter;

var Vector WayPoints[11];
var int NumPoints;
var int Position;
var Vector Destination;
var bool bHeadedRight;
var float LifeLeft;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        WayPoints, NumPoints;

}

function PostBeginPlay()
{
    local int i, Start;
    local Controller C;
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    super(Actor).PostBeginPlay();
    C = Controller(Owner);
    // End:0x2c
    if(C.Pawn == none)
    {
        return;
    }
    SetLocation(C.Pawn.Location);
    WayPoints[0] = C.Pawn.Location + C.Pawn.CollisionHeight * vect(0.0, 0.0, 1.0) + float(200) * vector(C.Rotation);
    HitActor = Trace(HitLocation, HitNormal, WayPoints[0], C.Pawn.Location, false);
    // End:0xef
    if(HitActor != none)
    {
        WayPoints[0] = HitLocation;
    }
    ++ NumPoints;
    // End:0x138
    if(C.RouteCache[i] != none && C.actorReachable(C.RouteCache[1]))
    {
        Start = 1;
    }
    i = Start;
    J0x143:
    // End:0x1d8 [While If]
    if(i < Start + 10)
    {
        // End:0x176
        if(C.RouteCache[i] == none)
        {
            // This is an implied JumpToken;
            goto J0x1d8;
        }
        // End:0x1ce
        else
        {
            WayPoints[NumPoints] = C.RouteCache[i].Location + C.Pawn.CollisionHeight * vect(0.0, 0.0, 1.0);
            ++ NumPoints;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x143;
    }
    J0x1d8:
    Velocity = float(500) * Normal(WayPoints[0] - Location) + C.Pawn.Velocity;
}

simulated function PostNetBeginPlay()
{
    // End:0x45
    if(Level.NetMode == 0 || Level.NetMode == 3)
    {
        bHidden = false;
        StartNextPath();
    }
    // End:0xa2
    else
    {
        // End:0x97
        if(Level.NetMode == 2 && Viewport(PlayerController(Owner).Player) != none)
        {
            bHidden = false;
            RemoteRole = 0;
            StartNextPath();
        }
        // End:0xa2
        else
        {
            LifeSpan = 0.50;
        }
    }
}

simulated function StartNextPath()
{
    // End:0x55
    if(Position >= NumPoints)
    {
        mRegen = false;
        LifeSpan = 1.50;
        LifeLeft = 1.50;
        Velocity = vect(0.0, 0.0, 0.0);
        Acceleration = vect(0.0, 0.0, 0.0);
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
        // End:0x2d
        if(LifeLeft > float(0))
        {
            LifeLeft -= DeltaTime;
            // End:0x2b
            if(LifeLeft <= float(0))
            {
                Destroy();
                return;
            }
            return;
        }
        Acceleration = float(1200) * Normal(Destination - Location);
        Velocity = Velocity + DeltaTime * Acceleration;
        // End:0x89
        if(!bHeadedRight)
        {
            bHeadedRight = Velocity Dot Acceleration > float(0);
        }
        // End:0xa3
        else
        {
            // End:0xa3
            if(Velocity Dot Acceleration < float(0))
            {
                StartNextPath();
            }
        }
        // End:0xc0
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
    bHidden=true
    Physics=6
    RemoteRole=2
    LifeSpan=10.0
    Skins=// Object reference not set to an instance of an object.
    
    Style=5
    bIgnoreOutOfWorld=true
}