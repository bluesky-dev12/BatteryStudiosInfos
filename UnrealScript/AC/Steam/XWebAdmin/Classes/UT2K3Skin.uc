/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\UT2K3Skin.uc
 * Package Imports:
 *	XWebAdmin
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2K3Skin extends WebSkin;

function Init(UTServerAdmin WebAdmin)
{
    WebAdmin.SkinPath = "";
    WebAdmin.SiteBG = DefaultBGColor;
    WebAdmin.SiteCSSFile = SkinCSS;
}

defaultproperties
{
    DisplayName="Standard UT2K4"
}