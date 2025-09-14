/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ParticleMaterial.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:13
 *
 *******************************************************************************/
class ParticleMaterial extends RenderedMaterial
    hidecategories(Object)
    native
    collapsecategories;

struct ParticleProjectorInfo
{
    var BitmapMaterial BitmapMaterial;
    var Matrix Matrix;
    var int Projected;
    var int BlendMode;
};

var const int ParticleBlending;
var const int BlendBetweenSubdivisions;
var const int RenderTwoSided;
var const int UseTFactor;
var const BitmapMaterial BitmapMaterial;
var const int AlphaTest;
var const int AlphaRef;
var const int ZTest;
var const int ZWrite;
var const int Wireframe;
var transient bool AcceptsProjectors;
var const transient int NumProjectors;
var const transient ParticleProjectorInfo Projectors[8];

defaultproperties
{
    MaterialType=512
}