/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\xScorch.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class xScorch extends Projector
    abstract;

var() float Lifetime;
var() float PushBack;
var() bool RandomOrient;

event PreBeginPlay()
{
    local PlayerController PC;

    // End:0x38
    if(Level.NetMode == 1 || Level.DecalStayScale == 0.0)
    {
        Destroy();
        return;
    }
    PC = Level.GetLocalPlayerController();
    // End:0x6e
    if(PC.BeyondViewDistance(Location, CullDistance))
    {
        Destroy();
        return;
    }
    super(Actor).PreBeginPlay();
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
    // End:0xbc
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
    SetLocation(Location - vector(Rotation) * PushBack);
    super.PostBeginPlay();
    LifeSpan = FMax(0.50, LifeSpan + float(Rand(4) - 2));
    // End:0x116
    if(Level.bDropDetail)
    {
        LifeSpan *= 0.50;
    }
    AbandonProjector(LifeSpan * Level.DecalStayScale);
    Destroy();
}

defaultproperties
{
    PushBack=24.0
    RandomOrient=true
    FOV=1
    MaxTraceDistance=60
    bProjectActor=true
    bClipBSP=true
    FadeInTime=0.1250
    GradientTexture=Texture'Engine.GRADIENT_Clip'
    bStatic=true
    LifeSpan=8.0
    bGameRelevant=true
}