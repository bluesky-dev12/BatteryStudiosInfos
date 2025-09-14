class BTPageLogin extends BTNetGUIPageHK
    editinlinenew
    instanced;

var FloatBox fbButtonLogin;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLogin;
var FloatBox fbButtonBattery;
var export editinline BTOwnerDrawCaptionButtonHK ButtonBattery;
var FloatBox fbButtonQuit;
var export editinline BTOwnerDrawCaptionButtonHK ButtonQuit;
var FloatBox fbEditID;
var export editinline BTEditBoxHK EditID;
var FloatBox fbEditPW;
var export editinline BTEditPWHK EditPW;
var FloatBox fbComboTest;
var export editinline BTComboBoxHK ComboTest;
var int RequestProcessPreLoginCount;
var int MaxRequestProcessPreLogin;
var localized string MessageUserWithSameIDConnected;
var localized string MessageNoID;
var localized string MessageWrongPWD;
var localized string MessageTypedNoPWD;
var localized string CaptionLogin;
var localized string CaptionQuit;
var export editinline BTLabelTestHK2 ClanMark;
var export editinline BTOwnerDrawCaptionButtonHK ButtonFontTest;
var export editinline BTSliderHK Slider;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    page_Main.DefaultLobbyBGM = "bgm_lobby_part" $ string(int((float(page_Main.GameRunningCount) % float(2)) + float(1)));
    page_Main.LastMainPageBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(page_Main.DefaultLobbyBGM);
    TPTopMenu.SetVisibility(false);
    LabelTopLine.SetVisibility(false);
    LabelRoomName.SetVisibility(false);
    // End:0xE5
    if(LabelLeftTopRoll != none)
    {
        LabelLeftTopRoll.SetVisibility(false);
    }
    LabelBackground.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_login_test;
    ButtonLogin = NewButtonComponent(fbButtonLogin);
    ButtonLogin.SetDefaultButtonImage();
    ButtonLogin.__OnClick__Delegate = ButtonLogin_OnClick;
    ButtonLogin.Caption = CaptionLogin;
    ButtonQuit = NewButtonComponent(fbButtonQuit);
    ButtonQuit.SetDefaultButtonImage();
    ButtonQuit.__OnClick__Delegate = ButtonQuit_OnClick;
    ButtonQuit.Caption = CaptionQuit;
    EditID = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls.BTEditBoxHK', fbEditID));
    EditID.bClickAllSelect = true;
    EditID.__OnChat__Delegate = Edit_OnEnter;
    EditID.MaxTextStrNum = 16;
    EditID.TabOrder = 1;
    EditPW = BTEditPWHK(NewComponent(new Class'GUIWarfareControls.BTEditPWHK', fbEditPW));
    EditPW.bClickAllSelect = true;
    EditPW.__OnChat__Delegate = Edit_OnEnter;
    EditPW.MaxTextStrNum = 16;
    EditID.TabOrder = 2;
    FocusFirst(EditID);
    // End:0x2EA
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        ButtonBattery = NewButtonComponent(fbButtonBattery);
        ButtonBattery.SetDefaultButtonImage();
        ButtonBattery.__OnClick__Delegate = ButtonLogin_Ver1_OnClick;
        ButtonBattery.Caption = "Battery Login";
    }
    ClanMark = BTLabelTestHK2(NewComponent(new Class'GUIWarfareControls.BTLabelTestHK2', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(10.0000000, 10.0000000, 400.0000000, 500.0000000)));
    ButtonFontTest = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(700.0000000, 30.0000000, 900.0000000, 100.0000000));
    ButtonFontTest.SetDefaultBigButtonImage();
    ButtonFontTest.SetDefaultBigButtonFontColor();
    ButtonFontTest.Caption = "FontTestWindow";
    ButtonFontTest.__OnClick__Delegate = ButtonFontTest_OnClick;
    Slider = BTSliderHK(NewComponent(new Class'GUIWarfareControls.BTSliderHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(700.0000000, 130.0000000, 900.0000000, 160.0000000)));
    Slider.SetData(36, 16);
    Slider.ButtonLeft.Caption = "Left";
    Slider.ButtonRight.Caption = "Right";
    Slider.DisableMe();
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    //return;    
}

function bool ButtonFontTest_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowFontTestHK");
    return true;
    //return;    
}

function bool Edit_OnEnter(GUIComponent Sender, string txt)
{
    SendLogin();
    return false;
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageLogin_TcpLogin TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageLogin_TcpLogin';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("[BTPageLogin::InternalOnOpen]");
    Log("[BTPageLogin::InternalOnOpen] Start");
    PlayerOwner().Level.GetMatchMaker().InitializeMapSettings();
    Controller.PushPage();
    EditID.SetText(page_Main.szAccountName);
    EditID.SetFocus(none);
    Log("[BTPageLogin::InternalOnOpen] End");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("[BTPageLogin::InternalOnClose]");
    Log("[BTPageLogin::InternalOnClose] Start");
    Log("[BTPageLogin::InternalOnClose] End");
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    page_Main.PageOnOpen = 10;
    self.page_Main.GameRunningCount++;
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;
    local string fs;

    iKey = key;
    iAction = Action;
    // End:0x42
    if((int(iKey) == int(13)) && int(iAction) == int(1))
    {
        return SendLogin();        
    }
    else
    {
        // End:0x67
        if((int(iKey) == int(27)) && int(iAction) == int(1))
        {            
        }
        else
        {
            return false;
        }
    }
    //return;    
}

function Quit()
{
    Controller.CloseAll(false);
    Console(Controller.Master.Console).ConsoleCommand("exit");
    //return;    
}

function bool SendLogin_Ver1()
{
    local string id, pwd;

    id = EditID.GetText();
    pwd = "battery";
    // End:0x47
    if(pwd == "")
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 1);
        return false;
    }
    // End:0xCC
    if(id != "")
    {
        page_Main.szAccountName = id;
        page_Main.szLoginPassword = pwd;
        page_Main.rMM.My_szName = id;
        return page_Main.TcpLogin.sfReqLoginInHouseTest(id, pwd, page_Main.AuthLogin_GUID);        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool SendLogin()
{
    local string id, pwd;

    id = EditID.GetText();
    pwd = EditPW.GetText();
    // End:0x4D
    if(pwd == "")
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 1);
        return false;
    }
    // End:0xD2
    if(id != "")
    {
        page_Main.szAccountName = id;
        page_Main.szLoginPassword = pwd;
        page_Main.rMM.My_szName = id;
        return page_Main.TcpLogin.sfReqLoginInHouseTest(id, pwd, page_Main.AuthLogin_GUID);        
    }
    else
    {
        return false;
    }
    //return;    
}

function bool ButtonLogin_OnClick(GUIComponent Sender)
{
    // End:0x1C
    if(page_Main.bConnectedLoginServer)
    {
        return SendLogin();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
    }
    return true;
    //return;    
}

function bool ButtonLogin_Ver1_OnClick(GUIComponent Sender)
{
    // End:0x1C
    if(page_Main.bConnectedLoginServer)
    {
        return SendLogin_Ver1();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
    }
    return true;
    //return;    
}

function bool ButtonQuit_OnClick(GUIComponent Sender)
{
    Quit();
    return true;
    //return;    
}

function bool ButtionSettings_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfare.BTPageOption");
    return true;
    //return;    
}

function bool rfAckLogin(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg)
{
    local string lowerCharName;

    Log((((((((((((((((("[BTPageLogin::rfAckLogin] " $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg);
    // End:0x2D7
    if(int(Sucess) == 0)
    {
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        lowerCharName = Locs(page_Main.szAccountName);
        // End:0x170
        if(((lowerCharName == "gm1") || lowerCharName == "gm2") || lowerCharName == "gm3")
        {
            page_Main.AuthLogin_AccountType = 1;
        }
        // End:0x21C
        if(int(NeedChar) == 0)
        {
            __NFUN_270__("TCPInfo -  Login Accout name :" $ EditID.TextStr);
            __NFUN_270__("TCPInfo - NeedChar :" $ string(NeedChar));
            __NFUN_270__("TCPInfo - Character name :" $ CharName);
            Controller.PopPage();
            page_Main.SetPage(4, true);            
        }
        else
        {
            __NFUN_270__("TCPInfo - Login Accout name :" $ EditID.TextStr);
            __NFUN_270__("TCPInfo - NeedChar :" $ string(NeedChar));
            __NFUN_270__("TCPInfo - Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            Controller.PopPage();
            page_Main.SetPage(5, true);
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, int(Sucess));
    }
    return true;
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    local string lowerCharName;

    Log((((((((((((((((((("[BTPageLogin::rfAckLoginInHouseTest] " $ string(Sucess)) $ " ") $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg);
    // End:0x314
    if(int(Sucess) == 0)
    {
        page_Main.BirthDay = BDay;
        page_Main.Sex = Sex;
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        lowerCharName = Locs(page_Main.szAccountName);
        // End:0x1B1
        if(((lowerCharName == "gm1") || lowerCharName == "gm2") || lowerCharName == "gm3")
        {
            page_Main.AuthLogin_AccountType = 1;
        }
        // End:0x24B
        if(int(NeedChar) == 0)
        {
            __NFUN_270__("Login Accout name :" $ EditID.TextStr);
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name : NULL");
            Controller.PopPage();
            Controller.LogMenuStack();
            page_Main.SetPage(4, true);            
        }
        else
        {
            __NFUN_270__("Login Accout name :" $ EditID.TextStr);
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            Controller.PopPage();
            Controller.LogMenuStack();
            page_Main.SetPage(5, true);
        }        
    }
    else
    {
        // End:0x3A2
        if(int(Sucess) == 50)
        {
            page_Main.rMM.My_szName = CharName;
            Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 0, CharName);
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = Disconnect_OnOK;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = Disconnect_OnCancel;            
        }
        else
        {
            // End:0x3C8
            if(int(Sucess) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);                
            }
            else
            {
                // End:0x3EF
                if(int(Sucess) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);                    
                }
                else
                {
                    // End:0x416
                    if(int(Sucess) == 3)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);                        
                    }
                    else
                    {
                        // End:0x43A
                        if(int(Sucess) == 15)
                        {
                            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                        }
                    }
                }
            }
        }
    }
    return true;
    //return;    
}

function Timer()
{
    Log("[BTPageLogin::Timer]");
    SendLogin();
    //return;    
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    // End:0x16
    if(Result == 0)
    {
        SetTimer(1.0000000);        
    }
    else
    {
        RequestProcessPreLoginUser();
    }
    return true;
    //return;    
}

function RequestProcessPreLoginUser()
{
    Log("[BTPageLogin::RequestProcessPreLoginUser]");
    // End:0x7F
    if(RequestProcessPreLoginCount >= MaxRequestProcessPreLogin)
    {
        RequestProcessPreLoginCount = 0;
        Log("[BTPageLogin::RequestProcessPreLoginUser] max reached");        
    }
    else
    {
        Log("[BTPageLogin::RequestProcessPreLoginUser] sent");
        RequestProcessPreLoginCount++;
        page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.My_szName, 0);
    }
    //return;    
}

function bool Disconnect_OnOK(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    RequestProcessPreLoginUser();
    return true;
    //return;    
}

function bool Disconnect_OnCancel(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.My_szName, 1);
    return true;
    //return;    
}

function bool rfAckCreateChar(byte Success, string ErrMsg)
{
    Log((("[BTPageLogin::rfAckCreateChar] " $ string(Success)) $ ", ") $ ErrMsg);
    // End:0x79
    if(int(Success) == 0)
    {
        Controller.PopPage();
        Controller.LogMenuStack();
        page_Main.SetPage(5, true);        
    }
    else
    {
        // End:0x89
        if(int(Success) == 1)
        {            
        }
    }
    return true;
    //return;    
}

defaultproperties
{
    fbButtonLogin=(X1=390.0000000,Y1=620.0000000,X2=509.0000000,Y2=652.0000000)
    fbButtonBattery=(X1=390.0000000,Y1=663.0000000,X2=633.0000000,Y2=695.0000000)
    fbButtonQuit=(X1=515.0000000,Y1=620.0000000,X2=633.0000000,Y2=652.0000000)
    fbEditID=(X1=444.0000000,Y1=549.0000000,X2=681.0000000,Y2=569.0000000)
    fbEditPW=(X1=444.0000000,Y1=583.0000000,X2=681.0000000,Y2=603.0000000)
    MaxRequestProcessPreLogin=3
    MessageUserWithSameIDConnected="?? ?? ??????. ?? ??? ????????"
    MessageNoID="?? ??????"
    MessageWrongPWD="????? ????"
    MessageTypedNoPWD="????? ??????"
    CaptionLogin="???"
    CaptionQuit="??"
    OnOpen=BTPageLogin.InternalOnOpen
    OnClose=BTPageLogin.InternalOnClose
    OnRendered=BTPageLogin.Internal_OnRendered
    OnKeyEvent=BTPageLogin.internalKeyEvent
}