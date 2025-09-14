/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchSetupLoginPage.uc
 * Package Imports:
 *	xVoting
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:7
 *
 *******************************************************************************/
class MatchSetupLoginPage extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Title;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_UserID;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Password;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Login;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var VotingReplicationInfo VRI;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local VotingReplicationInfo ri;

    super(FloatingWindow).InitComponent(MyController, myOwner);
    ed_Password.MyEditBox.bConvertSpaces = true;
    // End:0x74
    foreach AllObjects(class'VotingReplicationInfo', ri)
    {
        // End:0x73
        if(ri.PlayerOwner != none && ri.PlayerOwner == PlayerOwner())
        {
            VRI = ri;
        }
        // End:0x74
        else
        {
            continue;
        }        
    }
    // End:0x90
    if(VRI == none)
    {
        Controller.CloseAll(false);
    }
    ed_Password.MyEditBox.bMaskText = true;
    ed_UserID.SetComponentValue(PlayerOwner().PlayerReplicationInfo.PlayerName);
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x77
    if(Sender == b_Login && Len(ed_UserID.GetText()) > 0 && Len(ed_Password.GetText()) > 0)
    {
        VRI.MatchSetupLogin(ed_UserID.GetText(), ed_Password.GetText());
        SetTimer(1.0, true);
    }
    // End:0x96
    if(Sender == b_Cancel)
    {
        Controller.CloseAll(false);
    }
    return true;
}

function Timer()
{
    super(GUIComponent).Timer();
    // End:0x35
    if(VRI != none && VRI.bMatchSetupPermitted)
    {
        Controller.CloseMenu(false);
    }
}

function bool UserIDKeyPress(out byte key, out byte State, float Delta)
{
    // End:0x2f
    if(key == 13 && State == 1)
    {
        ed_Password.SetFocus(none);
        return true;
    }
    // End:0x5e
    if(key == 40 && State == 1)
    {
        ed_Password.SetFocus(none);
        return true;
    }
    return false;
}

function bool PasswordKeyPress(out byte key, out byte State, float Delta)
{
    // End:0x85
    if(key == 13 && State == 1)
    {
        // End:0x83
        if(Len(ed_UserID.GetText()) > 0 && Len(ed_Password.GetText()) > 0)
        {
            VRI.MatchSetupLogin(ed_UserID.GetText(), ed_Password.GetText());
            SetTimer(1.0, true);
        }
        return true;
    }
    // End:0xb4
    if(key == 38 && State == 1)
    {
        ed_UserID.SetFocus(none);
        return true;
    }
    return false;
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    VRI = none;
    super(GUIPage).Closed(Sender, bCancelled);
}

event bool NotifyLevelChange()
{
    VRI = none;
    return super(GUIPage).NotifyLevelChange();
}

defaultproperties
{
    begin object name=TitleLabel class=GUILabel
        Caption="?? ?? ???"
        TextAlign=1
        TextColor=(R=0,G=0,B=255,A=255)
        TextFont="UT2SmallFont"
        WinTop=0.28750
        WinLeft=0.3028130
        WinWidth=0.3828130
        WinHeight=0.0531250
        RenderWeight=1.0
    object end
    // Reference: GUILabel'MatchSetupLoginPage.TitleLabel'
    l_Title=TitleLabel
    begin object name=UserIDEditBox class=moEditBox
        Caption="???ID"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.3666670
        WinLeft=0.301250
        WinWidth=0.381250
        WinHeight=0.033750
        TabOrder=1
        OnKeyEvent=UserIDKeyPress
    object end
    // Reference: moEditBox'MatchSetupLoginPage.UserIDEditBox'
    ed_UserID=UserIDEditBox
    begin object name=PasswordEditBox class=moEditBox
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.4316670
        WinLeft=0.30
        WinWidth=0.38250
        WinHeight=0.031250
        TabOrder=2
        OnKeyEvent=PasswordKeyPress
    object end
    // Reference: moEditBox'MatchSetupLoginPage.PasswordEditBox'
    ed_Password=PasswordEditBox
    begin object name=LoginButton class=GUIButton
        Caption="???"
        WinTop=0.5266670
        WinLeft=0.330
        WinWidth=0.120
        WinHeight=0.0332030
        RenderWeight=1.0
        TabOrder=3
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupLoginPage.LoginButton'
    b_Login=LoginButton
    begin object name=CancelButton class=GUIButton
        Caption="????"
        WinTop=0.5266670
        WinLeft=0.5362490
        WinWidth=0.120
        WinHeight=0.0332030
        RenderWeight=1.0
        TabOrder=4
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupLoginPage.CancelButton'
    b_Cancel=CancelButton
    bAllowedAsLast=true
    WinTop=0.2486970
    WinLeft=0.0
    WinWidth=1.0
    WinHeight=0.3528640
}