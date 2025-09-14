class AdminPanelLogin extends AdminPanelBase
    config(LoginCache)
    editinlinenew
    instanced;

var() config bool bStoreLogins;
var() config array<AutoLoginInfo> LoginHistory;
var() localized string WaitingForLoginText;
var() localized string LoggedText;
var() automated moEditBox ed_LoginName;
var() automated moEditBox ed_LoginPassword;
var() automated GUIButton b_Login;
var() automated GUIButton b_Logout;
var() automated GUILabel l_Status;
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
    // End:0x6A
    if(str != "")
    {
        // End:0x6A
        if(!Divide(str, ":", CurrentIP, CurrentPort))
        {
            CurrentIP = str;
            CurrentPort = "7777";
        }
    }
    i = FindCredentials(CurrentIP, CurrentPort);
    // End:0xEC
    if(i != -1)
    {
        ed_LoginName.SetText(LoginHistory[i].UserName);
        ed_LoginPassword.SetText(LoginHistory[i].Password);
        // End:0xEC
        if(LoginHistory[i].bAutologin)
        {
            InternalOnClick(b_Login);
        }
    }
    //return;    
}

protected function UpdateStatus(string NewStatusMsg)
{
    l_Status.Caption = NewStatusMsg;
    //return;    
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
    // End:0x6F
    if(Sender == b_Login)
    {
        Cmd = "AdminLogin";
        uname = ed_LoginName.GetText();
        upass = ed_LoginPassword.GetText();
        UpdateStatus(WaitingForLoginText);        
    }
    else
    {
        // End:0x91
        if(Sender == b_Logout)
        {
            Cmd = "AdminLogout";
        }
    }
    // End:0xAB
    if(uname != "")
    {
        Cmd @= uname;
    }
    // End:0xC5
    if(upass != "")
    {
        Cmd @= upass;
    }
    AdminCommand(Cmd);
    return true;
    //return;    
}

function LoggedIn(string AdminName)
{
    DisableComponent(b_Login);
    DisableComponent(ed_LoginName);
    DisableComponent(ed_LoginPassword);
    EnableComponent(b_Logout);
    UpdateStatus(Repl(LoggedText, "%name%", AdminName));
    SaveCredentials();
    //return;    
}

function LoggedOut()
{
    DisableComponent(b_Logout);
    EnableComponent(b_Login);
    EnableComponent(ed_LoginName);
    EnableComponent(ed_LoginPassword);
    UpdateStatus("");
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
    // End:0xAF
    if(i == -1)
    {
        i = LoginHistory.Length;
    }
    LoginHistory[i] = NewInfo;
    SaveConfig();
    //return;    
}

defaultproperties
{
    WaitingForLoginText="???? ??? ??? ??? ???????..."
    // Reference: moEditBox'GUI2K4_Decompressed.AdminPanelLogin.LoginNameEditbox'
    begin object name="LoginNameEditbox" class=XInterface.moEditBox
        LabelJustification=2
        CaptionWidth=0.2000000
        Caption="??? ??: "
        OnCreateComponent=LoginNameEditbox.InternalOnCreateComponent
        Hint="??? ??? ?? ??? ?????"
        WinTop=0.0916670
        WinLeft=0.0890630
        WinWidth=0.8953120
        WinHeight=0.0984380
        bBoundToParent=true
        bScaleToParent=true
    end object
    ed_LoginName=LoginNameEditbox
    // Reference: moEditBox'GUI2K4_Decompressed.AdminPanelLogin.LoginPasswordEditBox'
    begin object name="LoginPasswordEditBox" class=XInterface.moEditBox
        bMaskText=true
        LabelJustification=2
        CaptionWidth=0.2000000
        Caption="??? ????: "
        OnCreateComponent=LoginPasswordEditBox.InternalOnCreateComponent
        Hint="??? ??? ????? ?????"
        WinTop=0.2366670
        WinLeft=0.0140620
        WinWidth=0.9703120
        WinHeight=0.0984370
        bBoundToParent=true
        bScaleToParent=true
    end object
    ed_LoginPassword=LoginPasswordEditBox
    // Reference: GUIButton'GUI2K4_Decompressed.AdminPanelLogin.LoginButton'
    begin object name="LoginButton" class=XInterface.GUIButton
        Caption="???"
        WinTop=0.4187500
        WinLeft=0.3609380
        WinWidth=0.2866070
        WinHeight=0.0921880
        bBoundToParent=true
        bScaleToParent=true
        OnClick=AdminPanelLogin.InternalOnClick
        OnKeyEvent=LoginButton.InternalOnKeyEvent
    end object
    b_Login=LoginButton
    // Reference: GUIButton'GUI2K4_Decompressed.AdminPanelLogin.LogoutButton'
    begin object name="LogoutButton" class=XInterface.GUIButton
        Caption="????"
        WinTop=0.4187500
        WinLeft=0.3609380
        WinWidth=0.2866070
        WinHeight=0.0921880
        bBoundToParent=true
        bScaleToParent=true
        OnClick=AdminPanelLogin.InternalOnClick
        OnKeyEvent=LogoutButton.InternalOnKeyEvent
    end object
    b_Logout=LogoutButton
    // Reference: GUILabel'GUI2K4_Decompressed.AdminPanelLogin.StatusLabel'
    begin object name="StatusLabel" class=XInterface.GUILabel
        TextAlign=1
        bMultiLine=true
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.5854170
        WinLeft=0.0053120
        WinWidth=0.9921890
        WinHeight=0.4078130
    end object
    l_Status=StatusLabel
    PanelCaption="???"
}