/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Shader.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:28
 *	Functions:2
 *
 *******************************************************************************/
class Shader extends RenderedMaterial
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

var() editinlineuse Material Diffuse;
var() editinlineuse Material Opacity;
var() editinlineuse Material Specular;
var() editinlineuse Material SpecularityMask;
var() editinlineuse Material Normal;
var() editinlineuse Material SelfIllumination;
var() editinlineuse Material SelfIlluminationMask;
var() editinlineuse Material Detail;
var() editinlineuse Material Cubemap;
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

function Reset()
{
    // End:0x1a
    if(Diffuse != none)
    {
        Diffuse.Reset();
    }
    // End:0x34
    if(Opacity != none)
    {
        Opacity.Reset();
    }
    // End:0x4e
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
    // End:0x9c
    if(SelfIllumination != none)
    {
        SelfIllumination.Reset();
    }
    // End:0xb6
    if(SelfIlluminationMask != none)
    {
        SelfIlluminationMask.Reset();
    }
    // End:0xd0
    if(Cubemap != none)
    {
        Cubemap.Reset();
    }
    // End:0xea
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
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
    // End:0x6c
    if(Specular != none)
    {
        Specular.Trigger(Other, EventInstigator);
    }
    // End:0x90
    if(SpecularityMask != none)
    {
        SpecularityMask.Trigger(Other, EventInstigator);
    }
    // End:0xb4
    if(Normal != none)
    {
        Normal.Trigger(Other, EventInstigator);
    }
    // End:0xd8
    if(SelfIllumination != none)
    {
        SelfIllumination.Trigger(Other, EventInstigator);
    }
    // End:0xfc
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
}

defaultproperties
{
    DetailScale=8.0
    LocalAmbientColor=(R=0,G=0,B=0,A=255)
    SpecularLevel=1.50
    Grossiness=50.0
    ModulateStaticLighting2X=true
    NormalZScale=1.0
    LightScale=1.0
    AmbientLightScale=1.50
    RimLightStrength=1.0
    RimLightPow=2.0
    EnvMapParms=(X=0.0,Y=2251800000000000.0,Z=0.0,W=0.0)
    MaterialType=4
}