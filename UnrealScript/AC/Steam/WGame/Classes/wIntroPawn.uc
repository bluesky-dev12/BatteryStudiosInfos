/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wIntroPawn.uc
 * Package Imports:
 *	WGame
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
class wIntroPawn extends UnrealPawn;

var ShadowProjector PawnShadow;
var() Vector ShadowDirection;
var() byte ShadowDarkness;
var() string MeshNameString;

function AddDefaultInventory(optional bool bQuickslotChange);
simulated function Destroyed()
{
    // End:0x17
    if(PawnShadow != none)
    {
        PawnShadow.Destroy();
    }
    super(Pawn).Destroyed();
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3a
    if(Mesh == none && MeshNameString != "")
    {
        LinkMesh(Mesh(DynamicLoadObject(MeshNameString, class'Mesh')));
    }
    // End:0xe7
    if(bShadowCast)
    {
        PawnShadow = Spawn(class'ShadowProjector', self, 'None', Location);
        PawnShadow.ShadowActor = self;
        PawnShadow.RootMotion = true;
        PawnShadow.LightDirection = Normal(ShadowDirection);
        PawnShadow.LightDistance = 192.0;
        PawnShadow.MaxTraceDistance = 350;
        PawnShadow.InitShadow();
        PawnShadow.ShadowTexture.ShadowDarkness = ShadowDarkness;
    }
}

defaultproperties
{
    ShadowDirection=(X=1.0,Y=1.0,Z=5.0)
    ShadowDarkness=192
    BaseEyeHeight=38.0
    EyeHeight=38.0
    ControllerClass=none
    bLightingVisibility=true
    MaxLights=8
    CollisionRadius=25.0
    CollisionHeight=43.0
}