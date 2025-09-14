class ShadowBitmapMaterial extends BitmapMaterial
    native
    collapsecategories
    hidecategories(Object);

var const transient pointer TextureInterfaces[2];
var Actor ShadowActor;
var Vector LightDirection;
var float LightDistance;
var float LightFOV;
var bool Dirty;
var bool Invalid;
var bool bBlobShadow;
var float CullDistance;
var byte ShadowDarkness;
var BitmapMaterial BlobShadow;

defaultproperties
{
    Dirty=true
    ShadowDarkness=255
    BlobShadow=Texture'Engine.BlobTexture'
    Format=5
    UClampMode=1
    VClampMode=1
    UBits=7
    VBits=7
    USize=512
    VSize=512
    UClamp=512
    VClamp=512
}