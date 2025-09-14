/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TerrainMaterial.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:4
 *
 *******************************************************************************/
class TerrainMaterial extends RenderedMaterial
    hidecategories(Object)
    native
    collapsecategories;

struct native TerrainMaterialLayer
{
    var Material Texture;
    var BitmapMaterial AlphaWeight;
    var Matrix TextureMatrix;
};

var const array<TerrainMaterialLayer> Layers;
var const byte RenderMethod;
var const bool FirstPass;
var const bool UseDirectionalColors;

defaultproperties
{
    MaterialType=256
}