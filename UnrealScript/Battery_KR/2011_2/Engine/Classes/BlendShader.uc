class BlendShader extends RenderedMaterial
    native
    editinlinenew
    collapsecategories
    hidecategories(Object);

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
    // End:0x1A
    if(DiffuseMap1 != none)
    {
        DiffuseMap1.Reset();
    }
    // End:0x34
    if(DiffuseMap2 != none)
    {
        DiffuseMap2.Reset();
    }
    // End:0x4E
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
    // End:0x9C
    if(BS_CubeMap != none)
    {
        BS_CubeMap.Reset();
    }
    // End:0xB6
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Reset();
    }
    //return;    
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
    // End:0x6C
    if(NormalMap1 != none)
    {
        NormalMap1.Trigger(Other, EventInstigator);
    }
    // End:0x90
    if(NormalMap2 != none)
    {
        NormalMap2.Trigger(Other, EventInstigator);
    }
    // End:0xB4
    if(MaskMap != none)
    {
        MaskMap.Trigger(Other, EventInstigator);
    }
    // End:0xD8
    if(BS_CubeMap != none)
    {
        BS_CubeMap.Trigger(Other, EventInstigator);
    }
    // End:0xFC
    if(FallbackMaterial != none)
    {
        FallbackMaterial.Trigger(Other, EventInstigator);
    }
    //return;    
}

defaultproperties
{
    EnvMapParms=(W=0.0000000,X=5.0000000,Y=0.0000000,Z=1.0000000)
    SpecularLevel=1.0000000
    MaterialType=32768
}