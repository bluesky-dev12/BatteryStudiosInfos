/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\WebSkin.uc
 * Package Imports:
 *	XWebAdmin
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
class WebSkin extends Object
    dependson(UTServerAdmin)
    abstract;

var string SubPath;
var localized string DisplayName;
var string SkinCSS;
var string DefaultBGColor;
var array<string> SpecialQuery;

function Init(UTServerAdmin WebAdmin)
{
    WebAdmin.SkinPath = "/" $ SubPath;
    WebAdmin.SiteBG = DefaultBGColor;
    WebAdmin.SiteCSSFile = SkinCSS;
}

function bool HandleSpecialQuery(WebRequest Request, WebResponse Response)
{
    return false;
}

function string HandleWebInclude(WebResponse Response, string fileName)
{
    return "";
}

function bool HandleHTM(WebResponse Response, string fileName)
{
    return false;
}

function bool HandleMessagePage(WebResponse Response, string Title, string Message)
{
    return false;
}

function bool HandleFrameMessage(WebResponse Response, string Message, bool bIsError)
{
    return false;
}

defaultproperties
{
    DisplayName="SomeSkin"
    SkinCSS="ut2003.css"
    DefaultBGColor="#243954"
}