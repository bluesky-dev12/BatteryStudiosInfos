/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_Base.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:8
 *
 *******************************************************************************/
class UT2K4SPTab_Base extends UT2K4TabPanel
    editinlinenew
    abstract
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
var class<UT2K4GameProfile> ProfileClass;

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
}

function GetMainWindow()
{
    // End:0x0d
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
    // End:0x70
    else
    {
        MainWindow = UT2K4SP_Main(Controller.FindMenuByClass(class'UT2K4SP_Main'));
        // End:0x70
        if(MainWindow != none)
        {
            return;
        }
    }
    Warn("MainWindow not found");
}

function bool onPlayClick()
{
    return false;
}

function btnPlayEnabled(bool bEnabled)
{
    GetMainWindow();
    // End:0x2c
    if(!bEnabled)
    {
        MainWindow.btnPlay.DisableMe();
    }
    // End:0x44
    else
    {
        MainWindow.btnPlay.EnableMe();
    }
}

function bool onBackClick()
{
    return false;
}

function bool CanClose(optional bool bCancelled)
{
    return true;
}

function string getProfileName(coerce string ProfileName)
{
    GetMainWindow();
    return Mid(ProfileName, Len(MainWindow.ProfilePrefix));
}

defaultproperties
{
    CaptionPlay="???"
    CaptionLoad="????"
    CaptionCreate="?? ???"
    CaptionDone="??"
    CaptionCancel="??"
    CaptionBack="??"
    LogPrefix=SinglePlayer
    ProfileClass=Class'WGame.UT2K4GameProfile'
    FadeInTime=0.250
    WinTop=0.150
    WinHeight=0.720
}