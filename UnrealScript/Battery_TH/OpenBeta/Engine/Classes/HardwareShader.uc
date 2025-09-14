class HardwareShader extends RenderedMaterial
    native
    collapsecategories
    noexport
    hidecategories(Object);

enum SConstant
{
    EVC_Unused,                     // 0
    EVC_MaterialDefined,            // 1
    EVC_ViewProjMatrix,             // 2
    EVC_WorldViewProjMatrix,        // 3
    EVC_WorldMatrix,                // 4
    EVC_InvViewMatrix,              // 5
    EVC_ViewMatrix,                 // 6
    EVC_InvWorldMatrix,             // 7
    EVC_Time,                       // 8
    EVC_CosTime,                    // 9
    EVC_SinTime,                    // 10
    EVC_TanTime,                    // 11
    EVC_Eye,                        // 12
    EVC_XYCircle,                   // 13
    EVC_NearestLightPos1,           // 14
    EVC_InvLightRadius1,            // 15
    EVC_NearestLightPos2,           // 16
    EVC_InvLightRadius2,            // 17
    EVC_LightColor1,                // 18
    EVC_LightColor2,                // 19
    EVC_AmbientLightColor,          // 20
    EVC_Max                         // 21
};

struct SConstantsInfo
{
    var() HardwareShader.SConstant Type;
    var() Plane Value;
};

var() SConstantsInfo VSConstants[200];
var() string VertexShaderText[4];
var() array<int> StreamMapping;
var() SConstantsInfo PSConstants[32];
var() string PixelShaderText[4];
var() Texture Textures[32];
var const transient int PixelShader[4];
var const transient int VertexShader[4];
var() int NumPasses;
var() int AlphaBlending[4];
var() int AlphaTest[4];
var() byte AlphaRef[4];
var() int ZTest[4];
var() int ZWrite[4];
var() byte SrcBlend[16];
var() byte DestBlend[16];

defaultproperties
{
    NumPasses=1
    MaterialType=16384
}