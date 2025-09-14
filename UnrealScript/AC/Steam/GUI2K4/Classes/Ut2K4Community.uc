/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\Ut2K4Community.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:2
 *
 *******************************************************************************/
class Ut2K4Community extends ModsAndDemosTabs
    dependson(ModsAndDemosTabs)
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox CommunityNews;
var bool GotNews;
var localized string DefaultNews;
var MasterServerClient MSC;
var config int ModRevLevel;
var config int LastModRevLevel;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    CommunityNews.SetContent(DefaultNews);
    CommunityNews.MyScrollText.bClickText = true;
    CommunityNews.MyScrollText.__OnDblClick__Delegate = LaunchURL;
}

function bool LaunchURL(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(CommunityNews.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
}

defaultproperties
{
    begin object name=lbCommunityNews class=GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.020
        WinLeft=0.020
        WinWidth=0.960
        WinHeight=0.960
        TabOrder=0
    object end
    // Reference: GUIScrollTextBox'Ut2K4Community.lbCommunityNews'
    CommunityNews=lbCommunityNews
    DefaultNews="??? ???? 2004? ??? ??? ?????||??? ????? ?? ??? ????? ??? ??? ???..."
    Tag=0
}