/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BitmapMaterial.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:9
 *
 *******************************************************************************/
class BitmapMaterial extends RenderedMaterial
    hidecategories(Object)
    native
    collapsecategories
    noexport
    abstract;

enum ETextureFormat
{
    TEXF_P8,
    TEXF_RGBA7,
    TEXF_RGB16,
    TEXF_DXT1,
    TEXF_RGB8,
    TEXF_RGBA8,
    TEXF_NODATA,
    TEXF_DXT3,
    TEXF_DXT5,
    TEXF_L8,
    TEXF_G16,
    TEXF_RRRGGGBBB
};

enum ETexClampMode
{
    TC_Wrap,
    TC_Clamp,
    TC_Border
};

var(TextureFormat) const editconst BitmapMaterial.ETextureFormat Format;
var(Texture) BitmapMaterial.ETexClampMode UClampMode;
var(Texture) BitmapMaterial.ETexClampMode VClampMode;
var const byte UBits;
var const byte VBits;
var const int USize;
var const int VSize;
var(Texture) const int UClamp;
var(Texture) const int VClamp;

defaultproperties
{
    MaterialType=64
}