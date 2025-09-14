class Ut2K4Community extends ModsAndDemosTabs
    config(User)
    editinlinenew
    instanced;

var() automated GUIScrollTextBox CommunityNews;
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
    //return;    
}

function bool LaunchURL(GUIComponent Sender)
{
    local string ClickString;

    ClickString = StripColorCodes(CommunityNews.MyScrollText.ClickedString);
    Controller.LaunchURL(ClickString);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.Ut2K4Community.lbCommunityNews'
    begin object name="lbCommunityNews" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        bVisibleWhenEmpty=true
        OnCreateComponent=lbCommunityNews.InternalOnCreateComponent
        WinTop=0.0200000
        WinLeft=0.0200000
        WinWidth=0.9600000
        WinHeight=0.9600000
        TabOrder=0
    end object
    CommunityNews=lbCommunityNews
    DefaultNews="??? ???? 2004? ??? ??? ?????||??? ????? ?? ??? ????? ??? ??? ???..."
    Tag=0
}