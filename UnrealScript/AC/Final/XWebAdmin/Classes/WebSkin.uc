class WebSkin extends Object
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
    //return;    
}

function bool HandleSpecialQuery(WebRequest Request, WebResponse Response)
{
    return false;
    //return;    
}

function string HandleWebInclude(WebResponse Response, string fileName)
{
    return "";
    //return;    
}

function bool HandleHTM(WebResponse Response, string fileName)
{
    return false;
    //return;    
}

function bool HandleMessagePage(WebResponse Response, string Title, string Message)
{
    return false;
    //return;    
}

function bool HandleFrameMessage(WebResponse Response, string Message, bool bIsError)
{
    return false;
    //return;    
}

defaultproperties
{
    DisplayName="SomeSkin"
    SkinCSS="ut2003.css"
    DefaultBGColor="#243954"
}