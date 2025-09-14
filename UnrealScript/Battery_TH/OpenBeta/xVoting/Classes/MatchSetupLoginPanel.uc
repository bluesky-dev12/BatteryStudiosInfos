class MatchSetupLoginPanel extends MatchSetupPanelBase
    config(LoginCache)
    editinlinenew
    instanced;

var() config bool bAutologin;
var() config bool bKeepHistory;
var() config array<AutoLoginInfo> LoginHistory;
var() editconst noexport string CurrentIP;
var() editconst noexport string CurrentPort;
var() automated GUILabel l_Title;
var() automated GUILabel l_Status;
var() automated moEditBox ed_LoginName;
var() automated moEditBox ed_LoginPassword;
var() automated GUIButton b_Submit;
var() automated GUIButton b_Cancel;
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
    else
    {
        // End:0x143
        if(PC.PlayerReplicationInfo != none)
        {
            ed_LoginName.SetText(PC.PlayerReplicationInfo.PlayerName);
        }
    }
    //return;    
}

function Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    UpdateSubmitButton();
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    local string uname, upass;

    // End:0x0D
    if(VRI == none)
    {
        return true;
    }
    // End:0xD9
    if(Sender == b_Submit)
    {
        // End:0xB9
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
            // End:0xA6
            if(upass == "")
            {
                SetFocus(ed_LoginPassword);
                UpdateStatus(NoPasswordSpecified);
                return true;
            }
            SendLogin(uname, upass);            
        }
        else
        {
            // End:0xD7
            if(b_Submit.Caption == ButtonLogoutText)
            {
                SendLogout();
            }
        }
        return true;
    }
    // End:0xFA
    if(Sender == b_Cancel)
    {
        Controller.CloseMenu(false);
        return true;
    }
    return true;
    //return;    
}

function bool UserNameKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x40
    if((int(State) == 3) && (int(key) == 13) || int(key) == 40)
    {
        ed_LoginPassword.SetFocus(none);
        return true;
    }
    return false;
    //return;    
}

function bool PasswordKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x4B
    if(int(State) == 3)
    {
        // End:0x2B
        if(int(key) == 13)
        {
            return InternalOnClick(b_Submit);            
        }
        else
        {
            // End:0x4B
            if(int(key) == 38)
            {
                ed_LoginName.SetFocus(none);
                return true;
            }
        }
    }
    return false;
    //return;    
}

protected function UpdateStatus(string NewStatusMsg)
{
    l_Status.Caption = NewStatusMsg;
    UpdateSubmitButton();
    //return;    
}

protected function int FindCredentials(coerce string IP, coerce string Port)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(i < LoginHistory.Length)
    {
        // End:0x53
        if((LoginHistory[i].IP == IP) && LoginHistory[i].Port == Port)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

protected function SaveCredentials()
{
    local AutoLoginInfo NewInfo;
    local int i;

    // End:0x0D
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
    // End:0xAF
    if(i == -1)
    {
        i = LoginHistory.Length;
    }
    LoginHistory[i] = NewInfo;
    SaveConfig();
    //return;    
}

function UpdateSubmitButton()
{
    switch(l_Status.Caption)
    {
        // End:0x3A
        case WaitingForLoginText:
            b_Submit.Caption = ButtonLogoutText;
            DisableComponent(b_Submit);
            // End:0xBA
            break;
        // End:0x64
        case LoggedText:
            b_Submit.Caption = ButtonLogoutText;
            EnableComponent(b_Submit);
            // End:0xBA
            break;
        // End:0x95
        case LoggedText @ PleaseWaitText:
            b_Submit.Caption = ButtonLogoutText;
            DisableComponent(b_Submit);
            // End:0xBA
            break;
        // End:0xFFFF
        default:
            EnableComponent(b_Submit);
            b_Submit.Caption = ButtonLoginText;
            // End:0xBA
            break;
            break;
    }
    //return;    
}

function SendLogin(string UserName, string Password)
{
    DisableComponent(ed_LoginName);
    DisableComponent(ed_LoginPassword);
    EnableComponent(b_Cancel);
    UpdateStatus(WaitingForLoginText);
    VRI.MatchSetupLogin(UserName, Password);
    //return;    
}

function SendLogout()
{
    //return;    
}

function LoggedIn()
{
    super.LoggedIn();
    DisableComponent(b_Cancel);
    UpdateStatus(LoggedText @ PleaseWaitText);
    SaveCredentials();
    VRI.RequestMatchSettings(true, true);
    //return;    
}

function LoggedOut()
{
    super.LoggedOut();
    EnableComponent(b_Submit);
    EnableComponent(ed_LoginName);
    EnableComponent(ed_LoginPassword);
    UpdateStatus("");
    //return;    
}

function LoginFailed()
{
    EnableComponent(b_Submit);
    EnableComponent(ed_LoginName);
    EnableComponent(ed_LoginPassword);
    DisableComponent(b_Cancel);
    UpdateStatus(InvalidLoginText);
    SetFocus(ed_LoginPassword);
    //return;    
}

function ReceiveComplete()
{
    super.ReceiveComplete();
    UpdateStatus(LoggedText);
    //return;    
}

defaultproperties
{
    bKeepHistory=true
    // Reference: GUILabel'xVoting_Decompressed.MatchSetupLoginPanel.StatusLabel'
    begin object name="StatusLabel" class=XInterface.GUILabel
        TextAlign=1
        bMultiLine=true
        VertAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.5714500
        WinLeft=0.1677650
        WinWidth=0.6705950
        WinHeight=0.4132530
        RenderWeight=1.0000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    l_Status=StatusLabel
    // Reference: moEditBox'xVoting_Decompressed.MatchSetupLoginPanel.UserIDEditBox'
    begin object name="UserIDEditBox" class=XInterface.moEditBox
        CaptionWidth=0.1000000
        Caption="???ID"
        OnCreateComponent=UserIDEditBox.InternalOnCreateComponent
        WinTop=0.2092600
        WinLeft=0.1742400
        WinWidth=0.6593850
        WinHeight=0.0819810
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=MatchSetupLoginPanel.UserNameKeyEvent
    end object
    ed_LoginName=UserIDEditBox
    // Reference: moEditBox'xVoting_Decompressed.MatchSetupLoginPanel.PasswordEditBox'
    begin object name="PasswordEditBox" class=XInterface.moEditBox
        bMaskText=true
        CaptionWidth=0.1000000
        Caption="????"
        OnCreateComponent=PasswordEditBox.InternalOnCreateComponent
        WinTop=0.3267290
        WinLeft=0.1742400
        WinWidth=0.6593850
        WinHeight=0.0819810
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=MatchSetupLoginPanel.PasswordKeyEvent
    end object
    ed_LoginPassword=PasswordEditBox
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupLoginPanel.LoginButton'
    begin object name="LoginButton" class=XInterface.GUIButton
        Caption="???"
        WinTop=0.4772840
        WinLeft=0.6804820
        WinWidth=0.1376850
        WinHeight=0.0701800
        RenderWeight=1.0000000
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnClick=MatchSetupLoginPanel.InternalOnClick
        OnKeyEvent=LoginButton.InternalOnKeyEvent
    end object
    b_Submit=LoginButton
    // Reference: GUIButton'xVoting_Decompressed.MatchSetupLoginPanel.CancelButton'
    begin object name="CancelButton" class=XInterface.GUIButton
        Caption="??"
        WinTop=0.4741980
        WinLeft=0.5137410
        WinWidth=0.1392930
        WinHeight=0.0766110
        RenderWeight=1.0000000
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        OnClick=MatchSetupLoginPanel.InternalOnClick
        OnKeyEvent=CancelButton.InternalOnKeyEvent
    end object
    b_Cancel=CancelButton
    NoUsernameSpecified="????? ??? ?? ????, ????? ?????."
    NoPasswordSpecified="????? ??? ?? ????, ????? ?????."
    InvalidLoginText="???? ???????. - ???? ?? ???? ?? ???????."
    WaitingForLoginText="???? ???? ?? ??? ????."
    LoggedText="????? ????? ??? ????.!"
    ButtonLoginText="???"
    ButtonLogoutText="????"
    PleaseWaitText="??? ??? ????? ??? ????...."
    OnLogIn=MatchSetupLoginPanel.LoggedIn
    OnLogOut=MatchSetupLoginPanel.LoggedOut
    PanelCaption="???"
    WinTop=0.2486970
    WinHeight=0.3528640
}