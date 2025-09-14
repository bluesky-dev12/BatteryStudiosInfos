class DownloadTexture extends BitmapMaterial
    native
    collapsecategories
    noexport
    hidecategories(Object);

var() string strImageURL;
var() string strImageFileName;
var() string strLinkUrl;
var() string strLinkFileName;
var const transient bool bIsDownloaded;
var const transient bool bIsExistLink;
var const transient pointer RenderInterface;

defaultproperties
{
    strImageURL="http://adimg.daumcdn.net/www4/25yc/cykK/chungpung_265x77_0524.jpg"
    strImageFileName="..\\TempDownloadFiles\\chungpung_265x77_0524.jpg"
    UClampMode=1
    VClampMode=1
    USize=512
    VSize=512
    UClamp=512
    VClamp=512
}