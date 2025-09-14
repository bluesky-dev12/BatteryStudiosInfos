class WillowWhisp extends wEmitter;

var Vector WayPoints[11];
var int NumPoints;
var int Position;
var Vector Destination;
var bool bHeadedRight;
var float LifeLeft;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        NumPoints, WayPoints;
}

function PostBeginPlay()
{
    local int i, Start;
    local Controller C;
    local Actor HitActor;
    local Vector HitLocation, HitNormal;

    super(Actor).PostBeginPlay();
    C = Controller(Owner);
    // End:0x2C
    if(C.Pawn == none)
    {
        return;
    }
    SetLocation(C.Pawn.Location);
    WayPoints[0] = (C.Pawn.Location + (C.Pawn.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))) + (float(200) * Vector(C.Rotation));
    HitActor = Trace(HitLocation, HitNormal, WayPoints[0], C.Pawn.Location, false);
    // End:0xEF
    if(HitActor != none)
    {
        WayPoints[0] = HitLocation;
    }
    NumPoints++;
    // End:0x138
    if((C.RouteCache[i] != none) && C.actorReachable(C.RouteCache[1]))
    {
        Start = 1;
    }
    i = Start;
    J0x143:

    // End:0x1D8 [Loop If]
    if(i < (Start + 10))
    {
        // End:0x176
        if(C.RouteCache[i] == none)
        {
            // [Explicit Break]
            goto J0x1D8;
            // [Explicit Continue]
            goto J0x1CE;
        }
        WayPoints[NumPoints] = C.RouteCache[i].Location + (C.Pawn.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000));
        NumPoints++;
        J0x1CE:

        i++;
        // [Loop Continue]
        goto J0x143;
    }
    J0x1D8:

    Velocity = (float(500) * Normal(WayPoints[0] - Location)) + C.Pawn.Velocity;
    //return;    
}

simulated function PostNetBeginPlay()
{
    // End:0x45
    if((int(Level.NetMode) == int(NM_Standalone)) || int(Level.NetMode) == int(NM_Client))
    {
        bHidden = false;
        StartNextPath();        
    }
    else
    {
        // End:0x97
        if((int(Level.NetMode) == int(NM_ListenServer)) && Viewport(PlayerController(Owner).Player) != none)
        {
            bHidden = false;
            RemoteRole = ROLE_None;
            StartNextPath();            
        }
        else
        {
            LifeSpan = 0.5000000;
        }
    }
    //return;    
}

simulated function StartNextPath()
{
    // End:0x55
    if(Position >= NumPoints)
    {
        mRegen = false;
        LifeSpan = 1.5000000;
        LifeLeft = 1.5000000;
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
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
        // End:0x2D
        if(LifeLeft > float(0))
        {
            LifeLeft -= DeltaTime;
            // End:0x2B
            if(LifeLeft <= float(0))
            {
                Destroy();
                return;
            }
            return;
        }
        Acceleration = float(1200) * Normal(Destination - Location);
        Velocity = Velocity + (DeltaTime * Acceleration);
        // End:0x89
        if(!bHeadedRight)
        {
            bHeadedRight = (Velocity Dot Acceleration) > float(0);            
        }
        else
        {
            // End:0xA3
            if((Velocity Dot Acceleration) < float(0))
            {
                StartNextPath();
            }
        }
        // End:0xC0
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
    bHidden=true
    Physics=6
    RemoteRole=2
    LifeSpan=10.0000000
    Skins[0]=Texture'Engine.S_Pawn'
    Style=5
    bIgnoreOutOfWorld=true
}