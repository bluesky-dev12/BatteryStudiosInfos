class DecalShader extends RenderedMaterial
    native
    editinlinenew
    collapsecategories
    hidecategories(Object);

var() editinlineuse Material Diffuse;
var() editinlineuse Material Opacity;
var() editinlineuse Material Specular;
var() editinlineuse Material SpecularityMask;
var() editinlineuse Material Normal;
var() editinlineuse Material SelfIllumination;
var() editinlineuse Material SelfIlluminationMask;
var() editinlineuse Material Detail;
var() editinlineuse Material Cubemap;
var() editinlineuse Material DecalMap;
var() RenderedMaterial.ERenderTechnique RenderTechnique;
var() float DetailScale;
var() Color LocalAmbientColor;
var() float SpecularLevel;
var() float Grossiness;
var() RenderedMaterial.EOutputBlending OutputBlending;
var() byte AlphaRef;
var() bool TwoSided;
var() bool Wireframe;
var bool ModulateStaticLighting2X;
var() bool PerformLightingOnSpecularPass;
var() bool ModulateSpecular2X;
var() float NormalZScale;
var() float LightScale;
var() float AmbientLightScale;
var() float RimLightStrength;
var() float RimLightPow;
var() bool UseSpecRGBGlossA;
var() Plane EnvMapParms;
var() float DecalUScale;
var() float DecalVScale;
var() float DecalBlendScale;

function Reset()
{
    // End:0x1A
    if(Diffuse != none)
    {
        Diffuse.Reset();
    }
    // End:0x34
    if(Opacity != none)
    {
        Opacity.Reset();
    }
    // End:0x4E
    if(Specular != none)
    {
        Specular.Reset();
    }
    // End:0x68
    if(SpecularityMask != none)
    {
        SpecularityMask.Reset();
    }
    // End:0x82
    if(Normal != none)
    {
        Normal.Reset();
    }
    // End:0x9C
    if(SelfIllumination != none)
    {
        SelfIllumination.Reset();
    }
    // End:0xB6
    if(SelfIlluminationMask != none)
    {
        SelfIlluminationMask.Reset();
    }
    // End:0xD0
    if(Cubemap != none)
    {
        Cubemap.Reset();
    }
    // End:0xEA
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
    //return;    
}

function Trigger(Actor Other, Actor EventInstigator)
{
    // End:0x24
    if(Diffuse != none)
    {
        Diffuse.Trigger(Other, EventInstigator);
    }
    // End:0x48
    if(Opacity != none)
    {
        Opacity.Trigger(Other, EventInstigator);
    }
    // End:0x6C
    if(Specular != none)
    {
        Specular.Trigger(Other, EventInstigator);
    }
    // End:0x90
    if(SpecularityMask != none)
    {
        SpecularityMask.Trigger(Other, EventInstigator);
    }
    // End:0xB4
    if(Normal != none)
    {
        Normal.Trigger(Other, EventInstigator);
    }
    // End:0xD8
    if(SelfIllumination != none)
    {
        SelfIllumination.Trigger(Other, EventInstigator);
    }
    // End:0xFC
    if(SelfIlluminationMask != none)
    {
        SelfIlluminationMask.Trigger(Other, EventInstigator);
    }
    // End:0x120
    if(Cubemap != none)
    {
        Cubemap.Trigger(Other, EventInstigator);
    }
    // End:0x144
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
    //return;    
}

defaultproperties
{
    DetailScale=8.0000000
    LocalAmbientColor=(R=0,G=0,B=0,A=255)
    SpecularLevel=1.5000000
    Grossiness=50.0000000
    ModulateStaticLighting2X=true
    NormalZScale=1.0000000
    LightScale=1.0000000
    AmbientLightScale=1.5000000
    RimLightStrength=1.0000000
    RimLightPow=2.0000000
    EnvMapParms=(W=0.0000000,X=10.0000000,Y=0.0000000,Z=2.0000000)
    DecalUScale=3.0000000
    DecalVScale=3.0000000
    DecalBlendScale=3.0000000
    MaterialType=65536
}