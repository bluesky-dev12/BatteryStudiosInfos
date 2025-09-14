/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\AdminPanelLogin.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:7
 *
 *******************************************************************************/
class AdminPanelLogin extends AdminPanelBase
    config(LoginCache)
    editinlinenew
    instanced;

var() config bool bStoreLogins;
var() config array<AutoLoginInfo> LoginHistory;
var() localized string WaitingForLoginText;
var() localized string LoggedText;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_LoginName;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_LoginPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Login;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Logout;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Status;
var() editconst noexport string CurrentIP;
var() editconst noexport string CurrentPort;

function InitComponent(GUIController C, GUIComponent o)
{
    local PlayerController PC;
    local string str;
    local int i;

    super(GUIPanel).InitComponent(C, o);
    PC = PlayerOwner();
    str = PC.GetServerNetworkAddress();
    // End:0x6a
    if(str != "")
    {
        // End:0x6a
        if(!Divide(str, ":", CurrentIP, CurrentPort))
        {
            CurrentIP = str;
            CurrentPort = "7777";
        }
    }
    i = FindCredentials(CurrentIP, CurrentPort);
    // End:0xec
    if(i != -1)
    {
        ed_LoginName.SetText(LoginHistory[i].UserName);
        ed_LoginPassword.SetText(LoginHistory[i].Password);
        // End:0xec
        if(LoginHistory[i].bAutologin)
        {
            InternalOnClick(b_Login);
        }
    }
}

protected function UpdateStatus(string NewStatusMsg)
{
    l_Status.Caption = NewStatusMsg;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local PlayerController PC;
    local string Cmd, uname, upass;

    PC = PlayerOwner();
    // End:0x16
    if(PC == none)
    {
        return true;
    }
    // End:0x6f
    if(Sender == b_Login)
    {
        Cmd = "AdminLogin";
        uname = ed_LoginName.GetText();
        upass = ed_LoginPassword.GetText();
        UpdateStatus(WaitingForLoginText);
    }
    // End:0x91
    else
    {
        // End:0x91
        if(Sender == b_Logout)
        {
            Cmd = "AdminLogout";
        }
    }
    // End:0xab
    if(uname != "")
    {
        Cmd @= uname;
    }
    // End:0xc5
    if(upass != "")
    {
        Cmd @= upass;
    }
    AdminCommand(Cmd);
    return true;
}

function LoggedIn(string AdminName)
{
    DisableComponent(b_Login);
    DisableComponent(ed_LoginName);
    DisableComponent(ed_LoginPassword);
    EnableComponent(b_Logout);
    UpdateStatus(Repl(LoggedText, "%name%", AdminName));
    SaveCredentials();
}

function LoggedOut()
{
    DisableComponent(b_Logout);
    EnableComponent(b_Login);
    EnableComponent(ed_LoginName);
    EnableComponent(ed_LoginPassword);
    UpdateStatus("");
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
    if(!bStoreLogins)
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

defaultproperties
{
    WaitingForLoginText="???? ??? ??? ??? ???????..."
    begin object name=LoginNameEditbox class=moEditBox
        LabelJustification=2
        CaptionWidth=0.20
        Caption="??? ??: "
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ?? ??? ?????"
        WinTop=0.0916670
        WinLeft=0.0890630
        WinWidth=0.8953120
        WinHeight=0.0984380
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moEditBox'AdminPanelLogin.LoginNameEditbox'
    ed_LoginName=LoginNameEditbox
    begin object name=LoginPasswordEditBox class=moEditBox
        bMaskText=true
        LabelJustification=2
        CaptionWidth=0.20
        Caption="??? ????: "
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ????? ?????"
        WinTop=0.2366670
        WinLeft=0.0140620
        WinWidth=0.9703120
        WinHeight=0.0984370
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moEditBox'AdminPanelLogin.LoginPasswordEditBox'
    ed_LoginPassword=LoginPasswordEditBox
    begin object name=LoginButton class=GUIButton
        Caption="???"
        WinTop=0.418750
        WinLeft=0.3609380
        WinWidth=0.2866070
        WinHeight=0.0921880
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'AdminPanelLogin.LoginButton'
    b_Login=LoginButton
    begin object name=LogoutButton class=GUIButton
        Caption="????"
        WinTop=0.418750
        WinLeft=0.3609380
        WinWidth=0.2866070
        WinHeight=0.0921880
        bBoundToParent=true
        bScaleToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'AdminPanelLogin.LogoutButton'
    b_Logout=LogoutButton
    begin object name=StatusLabel class=GUILabel
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.5854170
        WinLeft=0.0053120
        WinWidth=0.9921890
        WinHeight=0.4078130
    object end
    // Reference: GUILabel'AdminPanelLogin.StatusLabel'
    l_Status=StatusLabel
    PanelCaption="???"
}