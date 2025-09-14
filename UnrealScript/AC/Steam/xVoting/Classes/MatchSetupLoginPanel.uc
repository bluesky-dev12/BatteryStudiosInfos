/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchSetupLoginPanel.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:15
 *
 *******************************************************************************/
class MatchSetupLoginPanel extends MatchSetupPanelBase
    config(LoginCache)
    editinlinenew
    instanced;

var() config bool bAutologin;
var() config bool bKeepHistory;
var() config array<AutoLoginInfo> LoginHistory;
var() editconst noexport string CurrentIP;
var() editconst noexport string CurrentPort;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Title;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Status;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_LoginName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_LoginPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Submit;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() localized string NoUsernameSpecified;
var() localized string NoPasswordSpecified;
var() localized string InvalidLoginText;
var() localized string WaitingForLoginText;
var() localized string LoggedText;
var() localized string ButtonLoginText;
var() localized string ButtonLogoutText;
var() localized string PleaseWaitText;

function InitComponent(GUIController C, GUIComponent o)
{
    local PlayerController PC;
    local string str;
    local int i;

    super(GUIPanel).InitComponent(C, o);
    PC = PlayerOwner();
    ed_LoginPassword.MyEditBox.bConvertSpaces = true;
    str = PC.GetServerNetworkAddress();
    // End:0x84
    if(str != "")
    {
        // End:0x84
        if(!Divide(str, ":", CurrentIP, CurrentPort))
        {
            CurrentIP = str;
            CurrentPort = "7777";
        }
    }
    i = FindCredentials(CurrentIP, CurrentPort);
    // End:0x109
    if(i != -1)
    {
        ed_LoginName.SetText(LoginHistory[i].UserName);
        ed_LoginPassword.SetText(LoginHistory[i].Password);
        // End:0x106
        if(LoginHistory[i].bAutologin)
        {
            InternalOnClick(b_Submit);
        }
    }
    // End:0x143
    else
    {
        // End:0x143
        if(PC.PlayerReplicationInfo != none)
        {
            ed_LoginName.SetText(PC.PlayerReplicationInfo.PlayerName);
        }
    }
}

function Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    UpdateSubmitButton();
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string uname, upass;

    // End:0x0d
    if(VRI == none)
    {
        return true;
    }
    // End:0xd9
    if(Sender == b_Submit)
    {
        // End:0xb9
        if(b_Submit.Caption == ButtonLoginText)
        {
            uname = ed_LoginName.GetText();
            upass = ed_LoginPassword.GetText();
            // End:0x82
            if(uname == "")
            {
                SetFocus(ed_LoginName);
                UpdateStatus(NoUsernameSpecified);
                return true;
            }
            // End:0xa6
            if(upass == "")
            {
                SetFocus(ed_LoginPassword);
                UpdateStatus(NoPasswordSpecified);
                return true;
            }
            SendLogin(uname, upass);
        }
        // End:0xd7
        else
        {
            // End:0xd7
            if(b_Submit.Caption == ButtonLogoutText)
            {
                SendLogout();
            }
        }
        return true;
    }
    // End:0xfa
    if(Sender == b_Cancel)
    {
        Controller.CloseMenu(false);
        return true;
    }
    return true;
}

function bool UserNameKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x40
    if(State == 3 && key == 13 || key == 40)
    {
        ed_LoginPassword.SetFocus(none);
        return true;
    }
    return false;
}

function bool PasswordKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x4b
    if(State == 3)
    {
        // End:0x2b
        if(key == 13)
        {
            return InternalOnClick(b_Submit);
        }
        // End:0x4b
        else
        {
            // End:0x4b
            if(key == 38)
            {
                ed_LoginName.SetFocus(none);
                return true;
            }
        }
    }
    return false;
}

protected function UpdateStatus(string NewStatusMsg)
{
    l_Status.Caption = NewStatusMsg;
    UpdateSubmitButton();
}

protected function int FindCredentials(coerce string IP, coerce string Port)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < LoginHistory.Length)
    {
        // End:0x53
        if(LoginHistory[i].IP == IP && LoginHistory[i].Port == Port)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

protected function SaveCredentials()
{
    local AutoLoginInfo NewInfo;
    local int i;

    // End:0x0d
    if(!bKeepHistory)
    {
        return;
    }
    NewInfo.UserName = ed_LoginName.GetText();
    NewInfo.Password = ed_LoginPassword.GetText();
    // End:0x54
    if(NewInfo.Password == "")
    {
        return;
    }
    NewInfo.IP = CurrentIP;
    NewInfo.Port = CurrentPort;
    i = FindCredentials(NewInfo.IP, NewInfo.Port);
    // End:0xaf
    if(i == -1)
    {
        i = LoginHistory.Length;
    }
    LoginHistory[i] = NewInfo;
    SaveConfig();
}

function UpdateSubmitButton()
{
    switch(l_Status.Caption)
    {
        // End:0x3a
        case WaitingForLoginText:
            b_Submit.Caption = ButtonLogoutText;
            DisableComponent(b_Submit);
            // End:0xba
            break;
        // End:0x64
        case LoggedText:
            b_Submit.Caption = ButtonLogoutText;
            EnableComponent(b_Submit);
            // End:0xba
            break;
        // End:0x95
        case LoggedText @ PleaseWaitText:
            b_Submit.Caption = ButtonLogoutText;
            DisableComponent(b_Submit);
            // End:0xba
            break;
        // End:0xffff
        default:
            EnableComponent(b_Submit);
            b_Submit.Caption = ButtonLoginText;
            // End:0xba Break;
            break;
    }
}

function SendLogin(string UserName, string Password)
{
    DisableComponent(ed_LoginName);
    DisableComponent(ed_LoginPassword);
    EnableComponent(b_Cancel);
    UpdateStatus(WaitingForLoginText);
    VRI.MatchSetupLogin(UserName, Password);
}

function SendLogout();
function LoggedIn()
{
    super.LoggedIn();
    DisableComponent(b_Cancel);
    UpdateStatus(LoggedText @ PleaseWaitText);
    SaveCredentials();
    VRI.RequestMatchSettings(true, true);
}

function LoggedOut()
{
    super.LoggedOut();
    EnableComponent(b_Submit);
    EnableComponent(ed_LoginName);
    EnableComponent(ed_LoginPassword);
    UpdateStatus("");
}

function LoginFailed()
{
    EnableComponent(b_Submit);
    EnableComponent(ed_LoginName);
    EnableComponent(ed_LoginPassword);
    DisableComponent(b_Cancel);
    UpdateStatus(InvalidLoginText);
    SetFocus(ed_LoginPassword);
}

function ReceiveComplete()
{
    super.ReceiveComplete();
    UpdateStatus(LoggedText);
}

defaultproperties
{
    bKeepHistory=true
    begin object name=StatusLabel class=GUILabel
        TextAlign=1
        bMultiLine=true
        VertAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.571450
        WinLeft=0.1677650
        WinWidth=0.6705950
        WinHeight=0.4132530
        RenderWeight=1.0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUILabel'MatchSetupLoginPanel.StatusLabel'
    l_Status=StatusLabel
    begin object name=UserIDEditBox class=moEditBox
        CaptionWidth=0.10
        Caption="???ID"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.209260
        WinLeft=0.174240
        WinWidth=0.6593850
        WinHeight=0.0819810
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=UserNameKeyEvent
    object end
    // Reference: moEditBox'MatchSetupLoginPanel.UserIDEditBox'
    ed_LoginName=UserIDEditBox
    begin object name=PasswordEditBox class=moEditBox
        bMaskText=true
        CaptionWidth=0.10
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.3267290
        WinLeft=0.174240
        WinWidth=0.6593850
        WinHeight=0.0819810
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=PasswordKeyEvent
    object end
    // Reference: moEditBox'MatchSetupLoginPanel.PasswordEditBox'
    ed_LoginPassword=PasswordEditBox
    begin object name=LoginButton class=GUIButton
        Caption="???"
        WinTop=0.4772840
        WinLeft=0.6804820
        WinWidth=0.1376850
        WinHeight=0.070180
        RenderWeight=1.0
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupLoginPanel.LoginButton'
    b_Submit=LoginButton
    begin object name=CancelButton class=GUIButton
        Caption="??"
        WinTop=0.4741980
        WinLeft=0.5137410
        WinWidth=0.1392930
        WinHeight=0.0766110
        RenderWeight=1.0
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'MatchSetupLoginPanel.CancelButton'
    b_Cancel=CancelButton
    NoUsernameSpecified="????? ??? ?? ????, ????? ?????."
    NoPasswordSpecified="????? ??? ?? ????, ????? ?????."
    InvalidLoginText="???? ???????. - ???? ?? ???? ?? ???????."
    WaitingForLoginText="???? ???? ?? ??? ????."
    LoggedText="????? ????? ??? ????.!"
    ButtonLoginText="???"
    ButtonLogoutText="????"
    PleaseWaitText="??? ??? ????? ??? ????...."
    OnLogIn=LoggedIn
    OnLogOut=LoggedOut
    PanelCaption="???"
    WinTop=0.2486970
    WinHeight=0.3528640
}