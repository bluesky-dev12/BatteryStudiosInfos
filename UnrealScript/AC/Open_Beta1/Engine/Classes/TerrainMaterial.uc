class TerrainMaterial extends RenderedMaterial
    native
    collapsecategories
    hidecategories(Object);

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