/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BlendShader.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:2
 *
 *******************************************************************************/
class BlendShader extends RenderedMaterial
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

var() editinlineuse Material DiffuseMap1;
var() editinlineuse Material DiffuseMap2;
var() editinlineuse Material NormalMap1;
var() editinlineuse Material NormalMap2;
var() editinlineuse Material MaskMap;
var() editinlineuse Material BS_CubeMap;
var() byte BlendTexcoordIndex;
var() bool AlphaTest;
var() bool AlphaBlend;
var() byte AlphaRef;
var() bool TwoSided;
var() bool UseDynamicCubeMap;
var() Plane EnvMapParms;
var() float SpecularLevel;

function Reset()
{
    // End:0x1a
    if(DiffuseMap1 != none)
    {
        DiffuseMap1.Reset();
    }
    // End:0x34
    if(DiffuseMap2 != none)
    {
        DiffuseMap2.Reset();
    }
    // End:0x4e
    if(NormalMap1 != none)
    {
        NormalMap1.Reset();
    }
    // End:0x68
    if(NormalMap2 != none)
    {
        NormalMap2.Reset();
    }
    // End:0x82
    if(MaskMap != none)
    {
        MaskMap.Reset();
    }
    // End:0x9c
    if(BS_CubeMap != none)
    {
        BS_CubeMap.Reset();
    }
    // End:0xb6
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
}

function Trigger(Actor Other, Actor EventInstigator)
{
    // End:0x24
    if(DiffuseMap1 != none)
    {
        DiffuseMap1.Trigger(Other, EventInstigator);
    }
    // End:0x48
    if(DiffuseMap2 != none)
    {
        DiffuseMap2.Trigger(Other, EventInstigator);
    }
    // End:0x6c
    if(NormalMap1 != none)
    {
        NormalMap1.Trigger(Other, EventInstigator);
    }
    // End:0x90
    if(NormalMap2 != none)
    {
        NormalMap2.Trigger(Other, EventInstigator);
    }
    // End:0xb4
    if(MaskMap != none)
    {
        MaskMap.Trigger(Other, EventInstigator);
    }
    // End:0xd8
    if(BS_CubeMap != none)
    {
        BS_CubeMap.Trigger(Other, EventInstigator);
    }
    // End:0xfc
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
}

defaultproperties
{
    EnvMapParms=(X=0.0,Y=2251800000000000.0,Z=0.0,W=0.0)
    SpecularLevel=1.0
    MaterialType=32768
}