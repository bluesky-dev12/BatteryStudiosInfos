class Projector extends Actor
    native
    placeable;

enum EProjectorBlending
{
    PB_None,                        // 0
    PB_Modulate,                    // 1
    PB_AlphaBlend,                  // 2
    PB_Add                          // 3
};

var() Projector.EProjectorBlending MaterialBlendingOp;
var() Projector.EProjectorBlending FrameBufferBlendingOp;
var() Material ProjTexture;
var() int FOV;
var() int MaxTraceDistance;
var() bool bProjectBSP;
var() bool bProjectTerrain;
var() bool bProjectStaticMesh;
var() bool bProjectParticles;
var() bool bProjectActor;
var() bool bLevelStatic;
var() bool bClipBSP;
var() bool bClipStaticMesh;
var() bool bProjectOnUnlit;
var() bool bGradient;
var() bool bProjectOnBackfaces;
var() bool bProjectOnAlpha;
var() bool bProjectOnParallelBSP;
var() name ProjectTag;
var() bool bDynamicAttach;
var() bool bNoProjectOnOwner;
var float FadeInTime;
var const transient Plane FrustumPlanes[6];
var const transient Vector FrustumVertices[8];
var const transient Box Box;
var const transient ProjectorRenderInfoPtr RenderInfo;
var Texture GradientTexture;
var transient Matrix GradientMatrix;
var transient Matrix Matrix;
var transient Vector OldLocation;

// Export UProjector::execAttachProjector(FFrame&, void* const)
native function AttachProjector(optional float FadeInTime)
{
    //native.FadeInTime;        
}

// Export UProjector::execDetachProjector(FFrame&, void* const)
native function DetachProjector(optional bool Force)
{
    //native.Force;        
}

// Export UProjector::execAbandonProjector(FFrame&, void* const)
native function AbandonProjector(optional float Lifetime)
{
    //native.Lifetime;        
}

// Export UProjector::execAttachActor(FFrame&, void* const)
native function AttachActor(Actor A)
{
    //native.A;        
}

// Export UProjector::execDetachActor(FFrame&, void* const)
native function DetachActor(Actor A)
{
    //native.A;        
}

simulated event PostBeginPlay()
{
    // End:0x22
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        GotoState('NoProjection');
        return;
    }
    AttachProjector(FadeInTime);
    // End:0x3F
    if(bLevelStatic)
    {
        AbandonProjector();
        Destroy();
    }
    // End:0x4E
    if(bProjectActor)
    {
        SetCollision(true, false, false);
    }
    //return;    
}

simulated event Touch(Actor Other)
{
    // End:0x0D
    if(Other == none)
    {
        return;
    }
    // End:0xAD
    if(((Other.bAcceptsProjectors && (ProjectTag == 'None') || Other.Tag == ProjectTag) && bProjectStaticMesh || Other.StaticMesh == none) && !(Other.bStatic && bStatic) && Other.StaticMesh != none)
    {
        AttachActor(Other);
    }
    //return;    
}

simulated event UnTouch(Actor Other)
{
    DetachActor(Other);
    //return;    
}

event LightUpdate(array<Actor> LightSources)
{
    //return;    
}

event UpdateSunLight(Vector SunDir)
{
    //return;    
}

state NoProjection
{
    function BeginState()
    {
        Disable('Tick');
        //return;        
    }
    stop;    
}

defaultproperties
{
    FrameBufferBlendingOp=1
    MaxTraceDistance=1000
    bProjectBSP=true
    bProjectTerrain=true
    bProjectStaticMesh=true
    bProjectParticles=true
    bProjectActor=true
    GradientTexture=Texture'Engine.GRADIENT_Fade'
    bStatic=true
    bHidden=true
    RemoteRole=0
    Texture=Texture'Engine.Proj_Icon'
    bDirectional=true
}