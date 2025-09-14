class Browser_Page extends UT2K3TabPanel
    editinlinenew
    instanced;

var export editinline ServerBrowser Browser;
var localized string StartQueryString;
var localized string AuthFailString;
var localized string ConnFailString;
var localized string ConnTimeoutString;
var localized string QueryCompleteString;
var localized string RefreshCompleteString;
var localized string ReadyString;
var localized string PageCaption;

function OnCloseBrowser()
{
    //return;    
}

defaultproperties
{
    StartQueryString="Querying master server…"
    AuthFailString="Authentication failed."
    ConnFailString="Connection failed. Retrying."
    ConnTimeoutString="Connection timed out."
    QueryCompleteString="Query finished. "
    RefreshCompleteString="Update finished!"
    ReadyString="Ready"
    bFillHeight=true
    WinTop=0.1500000
    WinHeight=0.8500000
}