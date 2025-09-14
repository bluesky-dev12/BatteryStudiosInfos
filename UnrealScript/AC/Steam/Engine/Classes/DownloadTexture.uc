/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\DownloadTexture.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *
 *******************************************************************************/
class DownloadTexture extends BitmapMaterial
    hidecategories(Object)
    native
    collapsecategories
    noexport;

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
    strImageFileName="..\TempDownloadFiles\chungpung_265x77_0524.jpg"
    UClampMode=1
    VClampMode=1
    USize=512
    VSize=512
    UClamp=512
    VClamp=512
}