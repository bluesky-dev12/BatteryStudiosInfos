class wIntroPawn extends UnrealPawn;

var ShadowProjector PawnShadow;
var() Vector ShadowDirection;
var() byte ShadowDarkness;
var() string MeshNameString;

function AddDefaultInventory(optional bool bQuickslotChange)
{
    //return;    
}

simulated function Destroyed()
{
    // End:0x17
    if(PawnShadow != none)
    {
        PawnShadow.Destroy();
    }
    super(Pawn).Destroyed();
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3A
    if((Mesh == none) && MeshNameString != "")
    {
        LinkMesh(Mesh(DynamicLoadObject(MeshNameString, Class'Engine.Mesh')));
    }
    // End:0xE7
    if(bShadowCast)
    {
        PawnShadow = Spawn(Class'Engine.ShadowProjector', self, 'None', Location);
        PawnShadow.ShadowActor = self;
        PawnShadow.RootMotion = true;
        PawnShadow.LightDirection = Normal(ShadowDirection);
        PawnShadow.LightDistance = 192.0000000;
        PawnShadow.MaxTraceDistance = 350;
        PawnShadow.InitShadow();
        PawnShadow.ShadowTexture.ShadowDarkness = ShadowDarkness;
    }
    //return;    
}

defaultproperties
{
    ShadowDirection=(X=1.0000000,Y=1.0000000,Z=5.0000000)
    ShadowDarkness=192
    BaseEyeHeight=38.0000000
    EyeHeight=38.0000000
    ControllerClass=none
    bLightingVisibility=false
    MaxLights=8
    CollisionRadius=25.0000000
    CollisionHeight=43.0000000
}