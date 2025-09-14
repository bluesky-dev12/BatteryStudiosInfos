/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Texture.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:42
 *
 *******************************************************************************/
class Texture extends BitmapMaterial
    dependson(BitmapMaterial)
    hidecategories(Object)
    native
    noexport
    safereplace;

enum EEnvMapTransformType
{
    EMTT_ViewSpace,
    EMTT_WorldSpace,
    EMTT_LightSpace
};

enum ELODSet
{
    LODSET_None,
    LODSET_World,
    LODSET_PlayerSkin,
    LODSET_WeaponSkin,
    LODSET_Terrain,
    LODSET_Interface,
    LODSET_RenderMap,
    LODSET_Lightmap
};

var() Palette Palette;
var() Material Detail;
var() float DetailScale;
var const Color MipZero;
var const Color MaxColor;
var const int InternalTime[2];
var deprecated Texture DetailTexture;
var deprecated Texture EnvironmentMap;
var deprecated Texture.EEnvMapTransformType EnvMapTransformType;
var deprecated float Specular;
var(Surface) bool bMasked;
var(Surface) bool bAlphaTexture;
var(Surface) bool bTwoSided;
var(Quality) private bool bHighColorQuality;
var(Quality) private bool bHighTextureQuality;
var private bool bRealtime;
var private bool bParametric;
var private transient bool bRealtimeChanged;
var private const editconst bool bHasComp;
var() Texture.ELODSet LODSet;
var() int NormalLOD;
var int MinLOD;
var transient int MaxLOD;
var(Animation) Texture AnimNext;
var transient Texture AnimCurrent;
var(Animation) byte PrimeCount;
var transient byte PrimeCurrent;
var(Animation) float MinFrameRate;
var(Animation) float MaxFrameRate;
var transient float Accumulator;
var private native const array<int> Mips;
var const editconst BitmapMaterial.ETextureFormat CompFormat;
var byte PS2FirstMip;
var byte PS2NumMips;
var const int ResidentMips;
var const int RequestedMips;
var const int StreamingIndex;
var const float Priority;
var const int LastRenderTime[2];
var const bool bIsStreamable;
var const transient pointer RenderInterface;
var const transient int __LastUpdateTime[2];

defaultproperties
{
    DetailScale=8.0
    MipZero=(R=64,G=128,B=64,A=0)
    MaxColor=(R=255,G=255,B=255,A=255)
    LODSet=1
    StreamingIndex=-1
    Priority=1.0
    MaterialType=8256
}