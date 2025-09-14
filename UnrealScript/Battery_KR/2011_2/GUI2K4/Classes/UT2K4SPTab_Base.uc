class UT2K4SPTab_Base extends UT2K4TabPanel
    abstract
    editinlinenew
    instanced;

var localized string CaptionPlay;
var localized string CaptionLoad;
var localized string CaptionCreate;
var localized string CaptionDone;
var localized string CaptionCancel;
var localized string CaptionBack;
var UT2K4GameProfile GP;
var export editinline UT2K4SP_Main MainWindow;
var name LogPrefix;
var Class<UT2K4GameProfile> ProfileClass;

function InitComponent(GUIController pMyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(pMyController, myOwner);
    GP = UT2K4GameProfile(PlayerOwner().Level.Game.CurrentGameProfile);
    // End:0x58
    if(GP != none)
    {
        LogPrefix = GP.LogPrefix;
    }
    GetMainWindow();
    //return;    
}

function ShowPanel(bool bShow)
{
    GetMainWindow();
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x55
    if(bShow)
    {
        MainWindow.btnPlay.Caption = CaptionPlay;
        MainWindow.btnBack.Caption = CaptionBack;
    }
    //return;    
}

function GetMainWindow()
{
    // End:0x0D
    if(MainWindow != none)
    {
        return;
    }
    // End:0x44
    if(UT2K4SP_Main(Controller.ActivePage) != none)
    {
        MainWindow = UT2K4SP_Main(Controller.ActivePage);
        return;        
    }
    else
    {
        MainWindow = UT2K4SP_Main(Controller.FindMenuByClass(Class'GUI2K4_Decompressed.UT2K4SP_Main'));
        // End:0x70
        if(MainWindow != none)
        {
            return;
        }
    }
    Warn("MainWindow not found");
    //return;    
}

function bool onPlayClick()
{
    return false;
    //return;    
}

function btnPlayEnabled(bool bEnabled)
{
    GetMainWindow();
    // End:0x2C
    if(!bEnabled)
    {
        MainWindow.btnPlay.DisableMe();        
    }
    else
    {
        MainWindow.btnPlay.EnableMe();
    }
    //return;    
}

function bool onBackClick()
{
    return false;
    //return;    
}

function bool CanClose(optional bool bCancelled)
{
    return true;
    //return;    
}

function string getProfileName(coerce string ProfileName)
{
    GetMainWindow();
    return Mid(ProfileName, Len(MainWindow.ProfilePrefix));
    //return;    
}

defaultproperties
{
    CaptionPlay="???"
    CaptionLoad="????"
    CaptionCreate="?? ???"
    CaptionDone="??"
    CaptionCancel="??"
    CaptionBack="??"
    LogPrefix="SinglePlayer"
    ProfileClass=Class'WGame.UT2K4GameProfile'
    FadeInTime=0.2500000
    WinTop=0.1500000
    WinHeight=0.7200000
}