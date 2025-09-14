/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2ServerInfo.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:5
 *
 *******************************************************************************/
class UT2ServerInfo extends GUIPage
    config(User)
    editinlinenew
    instanced;

var(MidGame) config array<string> PanelClass;
var(MidGame) localized array<localized string> PanelCaption;
var(MidGame) localized array<localized string> PanelHint;
var(MidGame) editconst noexport editinline GUITabControl TabC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    // End:0x33
    if(PlayerOwner() != none && PlayerOwner().GameReplicationInfo != none)
    {
        SetTitle();
    }
    TabC = GUITabControl(Controls[4]);
    TabC.MyFooter = GUIFooter(Controls[2]);
    i = 0;
    J0x69:
    // End:0xd8 [While If]
    if(i < PanelClass.Length && i < PanelCaption.Length && i < PanelHint.Length)
    {
        TabC.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x69;
    }
    // End:0x123
    if(!bOldStyleMenus)
    {
        Controls[3].Style = Controller.GetStyle("SquareButton", Controls[3].FontScale);
    }
}

function bool ButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

event ChangeHint(string NewHint)
{
    GUITitleBar(Controls[2]).SetCaption(NewHint);
}

function SetTitle()
{
    GUITitleBar(Controls[1]).SetCaption(PlayerOwner().GameReplicationInfo.ServerName);
}

function bool NotifyLevelChange()
{
    bPersistent = false;
    return true;
}

defaultproperties
{
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    bRequire640x480=true
    bAllowedAsLast=true
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.10
    WinLeft=0.20
    WinWidth=0.60
    WinHeight=0.80
}