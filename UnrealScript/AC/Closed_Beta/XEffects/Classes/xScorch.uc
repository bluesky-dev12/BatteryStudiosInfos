class xScorch extends Projector
    abstract;

var() float Lifetime;
var() float PushBack;
var() bool RandomOrient;

event PreBeginPlay()
{
    local PlayerController PC;

    // End:0x38
    if((int(Level.NetMode) == int(NM_DedicatedServer)) || Level.DecalStayScale == 0.0000000)
    {
        Destroy();
        return;
    }
    PC = Level.GetLocalPlayerController();
    // End:0x6E
    if(PC.BeyondViewDistance(Location, CullDistance))
    {
        Destroy();
        return;
    }
    super(Actor).PreBeginPlay();
    //return;    
}

function PostBeginPlay()
{
    local Vector rX, rY, RZ;
    local Rotator R;

    // End:0x17
    if(PhysicsVolume.bNoDecals)
    {
        Destroy();
        return;
    }
    // End:0xBC
    if(RandomOrient)
    {
        R.Yaw = 0;
        R.Pitch = 0;
        R.Roll = Rand(65535);
        GetAxes(R, rX, rY, RZ);
        rX = rX >> Rotation;
        rY = rY >> Rotation;
        RZ = RZ >> Rotation;
        R = OrthoRotation(rX, rY, RZ);
        SetRotation(R);
    }
    SetLocation(Location - (Vector(Rotation) * PushBack));
    super.PostBeginPlay();
    LifeSpan = FMax(0.5000000, LifeSpan + float(Rand(4) - 2));
    // End:0x116
    if(Level.bDropDetail)
    {
        LifeSpan *= 0.5000000;
    }
    AbandonProjector(LifeSpan * Level.DecalStayScale);
    Destroy();
    //return;    
}

defaultproperties
{
    PushBack=24.0000000
    RandomOrient=true
    FOV=1
    MaxTraceDistance=60
    bProjectActor=false
    bClipBSP=true
    FadeInTime=0.1250000
    GradientTexture=Texture'Engine.GRADIENT_Clip'
    bStatic=false
    LifeSpan=8.0000000
    bGameRelevant=true
}