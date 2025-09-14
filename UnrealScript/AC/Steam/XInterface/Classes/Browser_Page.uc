/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_Page.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:1
 *
 *******************************************************************************/
class Browser_Page extends UT2K3TabPanel
    dependson(UT2K3TabPanel)
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

function OnCloseBrowser();

defaultproperties
{
    StartQueryString="Querying master server?"
    AuthFailString="Authentication failed."
    ConnFailString="Connection failed. Retrying."
    ConnTimeoutString="Connection timed out."
    QueryCompleteString="Query finished. "
    RefreshCompleteString="Update finished!"
    ReadyString="Ready"
    bFillHeight=true
    WinTop=0.150
    WinHeight=0.850
}