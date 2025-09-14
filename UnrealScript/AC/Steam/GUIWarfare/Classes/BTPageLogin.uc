/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageLogin.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:23
 *	Functions:26
 *
 *******************************************************************************/
class BTPageLogin extends BTNetGUIPageHK
    dependson(BTPageLogin_TcpLogin)
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
var export editinline BTSliderHK slider;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    page_Main.DefaultLobbyBGM = "bgm_lobby_part" $ string(int(float(page_Main.GameRunningCount) % float(2) + float(1)));
    page_Main.LastMainPageBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(page_Main.DefaultLobbyBGM);
    TPTopMenu.SetVisibility(false);
    LabelTopLine.SetVisibility(false);
    LabelRoomName.SetVisibility(false);
    // End:0xe5
    if(LabelLeftTopRoll != none)
    {
        LabelLeftTopRoll.SetVisibility(false);
    }
    NewBackground = NewLabelComponent(fbNewBackground, class'BTUIResourcePoolHK'.default.img_login_test, 0.000130);
    ButtonLogin = NewButtonComponent(fbButtonLogin);
    ButtonLogin.SetDefaultButtonImage();
    ButtonLogin.__OnClick__Delegate = ButtonLogin_OnClick;
    ButtonLogin.Caption = CaptionLogin;
    ButtonQuit = NewButtonComponent(fbButtonQuit);
    ButtonQuit.SetDefaultButtonImage();
    ButtonQuit.__OnClick__Delegate = ButtonQuit_OnClick;
    ButtonQuit.Caption = CaptionQuit;
    EditID = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', fbEditID));
    EditID.bClickAllSelect = true;
    EditID.__OnChat__Delegate = Edit_OnEnter;
    EditID.MaxTextStrNum = 16;
    EditID.TabOrder = 1;
    EditPW = BTEditPWHK(NewComponent(new class'BTEditPWHK', fbEditPW));
    EditPW.bClickAllSelect = true;
    EditPW.__OnChat__Delegate = Edit_OnEnter;
    EditPW.MaxTextStrNum = 16;
    EditID.TabOrder = 2;
    FocusFirst(EditID);
    LabelTitle.bVisible = false;
    // End:0x30a
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        ButtonBattery = NewButtonComponent(fbButtonBattery);
        ButtonBattery.SetDefaultButtonImage();
        ButtonBattery.__OnClick__Delegate = ButtonLogin_Ver1_OnClick;
        ButtonBattery.Caption = "(GLOBAL)Battery Login";
    }
    ClanMark = BTLabelTestHK2(NewComponent(new class'BTLabelTestHK2', class'BTCustomDrawHK'.static.MakeFloatBox(10.0, 10.0, 400.0, 500.0)));
    ButtonFontTest = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(700.0, 30.0, 900.0, 100.0));
    ButtonFontTest.SetDefaultBigButtonImage();
    ButtonFontTest.SetDefaultBigButtonFontColor();
    ButtonFontTest.Caption = "FontTestWindow";
    ButtonFontTest.__OnClick__Delegate = ButtonFontTest_OnClick;
    ButtonFontTest.isFlicker = false;
    slider = BTSliderHK(NewComponent(new class'BTSliderHK', class'BTCustomDrawHK'.static.MakeFloatBox(700.0, 130.0, 900.0, 160.0)));
    slider.SetData(36, 16);
    slider.ButtonLeft.Caption = "Left";
    slider.ButtonRight.Caption = "Right";
    slider.DisableMe();
}

function Internal_OnRendered(Canvas C);
function bool ButtonFontTest_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowFontTestHK");
    return true;
}

function bool Edit_OnEnter(GUIComponent Sender, string txt)
{
    SendLogin_Ver1();
    return false;
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageLogin_TcpLogin TCP;

    TCP = new class'BTPageLogin_TcpLogin';
    TCP.Owner = self;
    return TCP;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("[BTPageLogin::InternalOnOpen]");
    Log("[BTPageLogin::InternalOnOpen] Start");
    PlayerOwner().Level.GetMatchMaker().InitializeMapSettings();
    Controller.PushPage();
    EditID.SetText(page_Main.szAccountName);
    EditID.SetFocus(none);
    Log("[BTPageLogin::InternalOnOpen] End");
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("[BTPageLogin::InternalOnClose]");
    Log("[BTPageLogin::InternalOnClose] Start");
    Log("[BTPageLogin::InternalOnClose] End");
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    page_Main.PageOnOpen = 10;
    ++ self.page_Main.GameRunningCount;
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x42
    if(iKey == 13 && iAction == 1)
    {
        return SendLogin_Ver1();
    }
    // End:0x69
    else
    {
        // End:0x67
        if(iKey == 27 && iAction == 1)
        {
        }
        // End:0x69
        else
        {
            return false;
        }
    }
}

function Quit()
{
    Controller.CloseAll(false);
    Console(Controller.Master.Console).ConsoleCommand("exit");
}

function bool SendLogin_Ver1()
{
    local string id, pwd;

    Log("SendLogin_Ver1()");
    id = EditID.GetText();
    pwd = "battery";
    // End:0x5b
    if(pwd == "")
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 1);
        return false;
    }
    // End:0xc0
    if(id != "")
    {
        page_Main.szAccountName = id;
        page_Main.szLoginPassword = pwd;
        page_Main.rMM.My_szName = id;
        page_Main.SendLogin();
        return true;
    }
    // End:0xc2
    else
    {
        return false;
    }
}

function bool ButtonLogin_OnClick(GUIComponent Sender)
{
    // End:0x1c
    if(page_Main.bConnectedLoginServer)
    {
        return SendLogin_Ver1();
    }
    // End:0x31
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
    }
    return true;
}

function bool ButtonLogin_Ver1_OnClick(GUIComponent Sender)
{
    // End:0x1c
    if(page_Main.bConnectedLoginServer)
    {
        return SendLogin_Ver1();
    }
    // End:0x31
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
    }
    return true;
}

function bool ButtonQuit_OnClick(GUIComponent Sender)
{
    Quit();
    return true;
}

function bool ButtionSettings_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfare.BTPageOption");
    return true;
}

function bool rfAckLogin(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg)
{
    local string lowerCharName;

    Log("[BTPageLogin::rfAckLogin] " $ CharName $ " " $ string(TimeStamp) $ " " $ string(LoginHash1) $ " " $ string(LoginHash2) $ " " $ string(LoginHash3) $ " " $ string(LoginHash4) $ " " $ string(LoginHash5) $ " " $ string(NeedChar) $ " " $ ErrMsg);
    // End:0x2d7
    if(Sucess == 0)
    {
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        lowerCharName = Locs(page_Main.szAccountName);
        // End:0x170
        if(lowerCharName == "gm1" || lowerCharName == "gm2" || lowerCharName == "gm3")
        {
            page_Main.AuthLogin_AccountType = 1;
        }
        // End:0x21c
        if(NeedChar == 0)
        {
            UnresolvedNativeFunction_97("TCPInfo -  Login Accout name :" $ EditID.TextStr);
            UnresolvedNativeFunction_97("TCPInfo - NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("TCPInfo - Character name :" $ CharName);
            Controller.PopPage();
            page_Main.SetPage(4, true);
        }
        // End:0x2d4
        else
        {
            UnresolvedNativeFunction_97("TCPInfo - Login Accout name :" $ EditID.TextStr);
            UnresolvedNativeFunction_97("TCPInfo - NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("TCPInfo - Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            Controller.PopPage();
            page_Main.SetPage(5, true);
        }
    }
    // End:0x2f2
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Sucess);
    }
    return true;
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    local string lowerCharName;

    Log("[BTPageLogin::rfAckLoginInHouseTest] " $ string(Sucess) $ " " $ CharName $ " " $ string(TimeStamp) $ " " $ string(LoginHash1) $ " " $ string(LoginHash2) $ " " $ string(LoginHash3) $ " " $ string(LoginHash4) $ " " $ string(LoginHash5) $ " " $ string(NeedChar) $ " " $ ErrMsg);
    // End:0x314
    if(Sucess == 0)
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
        // End:0x1b1
        if(lowerCharName == "gm1" || lowerCharName == "gm2" || lowerCharName == "gm3")
        {
            page_Main.AuthLogin_AccountType = 1;
        }
        // End:0x24b
        if(NeedChar == 0)
        {
            UnresolvedNativeFunction_97("Login Accout name :" $ EditID.TextStr);
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name : NULL");
            Controller.PopPage();
            Controller.LogMenuStack();
            page_Main.SetPage(4, true);
        }
        // End:0x311
        else
        {
            UnresolvedNativeFunction_97("Login Accout name :" $ EditID.TextStr);
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            Controller.PopPage();
            Controller.LogMenuStack();
            page_Main.SetPage(5, true);
        }
    }
    // End:0x43a
    else
    {
        // End:0x3a2
        if(Sucess == 50)
        {
            page_Main.rMM.My_szName = CharName;
            class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 0, CharName);
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = Disconnect_OnOK;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = Disconnect_OnCancel;
        }
        // End:0x43a
        else
        {
            // End:0x3c8
            if(Sucess == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
            }
            // End:0x43a
            else
            {
                // End:0x3ef
                if(Sucess == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                }
                // End:0x43a
                else
                {
                    // End:0x416
                    if(Sucess == 3)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                    }
                    // End:0x43a
                    else
                    {
                        // End:0x43a
                        if(Sucess == 15)
                        {
                            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                        }
                    }
                }
            }
        }
    }
    return true;
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    // End:0x16
    if(Result == 0)
    {
        SetTimer(1.0);
    }
    // End:0x1c
    else
    {
        RequestProcessPreLoginUser();
    }
    return true;
}

function RequestProcessPreLoginUser()
{
    Log("[BTPageLogin::RequestProcessPreLoginUser]");
    // End:0x7f
    if(RequestProcessPreLoginCount >= MaxRequestProcessPreLogin)
    {
        RequestProcessPreLoginCount = 0;
        Log("[BTPageLogin::RequestProcessPreLoginUser] max reached");
    }
    // End:0xe9
    else
    {
        Log("[BTPageLogin::RequestProcessPreLoginUser] sent");
        ++ RequestProcessPreLoginCount;
        page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.My_szName, 0);
    }
}

function bool Disconnect_OnOK(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    RequestProcessPreLoginUser();
    return true;
}

function bool Disconnect_OnCancel(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.My_szName, 1);
    return true;
}

function bool rfAckCreateChar(int Success, string ErrMsg)
{
    local int webLogFailCode;

    // End:0x19
    if(Success == 0)
    {
        webLogFailCode = -1;
    }
    // End:0x20
    else
    {
        webLogFailCode = 0;
    }
    PlayerOwner().SendWebLog(4100, webLogFailCode);
    Log("[BTPageLogin::rfAckCreateChar] " $ string(Success) $ ", " $ ErrMsg);
    // End:0xae
    if(Success == 0)
    {
        Controller.PopPage();
        Controller.LogMenuStack();
        page_Main.SetPage(5, true);
    }
    // End:0xbc
    else
    {
        // End:0xbc
        if(Success == 1)
        {
        }
        // End:0xbc
        else
        {
        }
    }
    return true;
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    Log("[BTPageLogo::rfAckLoginWithTencentAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(tc_AccountType) $ " wzp_IsBlock=" $ string(tc_IsBlock));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithTencentAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(tc_AccountType) $ " wzp_IsBlock=" $ string(tc_IsBlock));
    // End:0x132
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = ButtonQuit_OnClick;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    return true;
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log("[BTPageLogo::rfAckLoginWithWZAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(wzp_AccountType) $ " wzp_IsBlock=" $ string(wzp_IsBlock) $ " wzp_AuthKeySuccess=" $ string(wzp_AuthKeySuccess) $ " ChannelType = " $ string(ChannelType));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithWZAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(wzp_AccountType) $ " wzp_IsBlock=" $ string(wzp_IsBlock) $ " wzp_AuthKeySuccess=" $ string(wzp_AuthKeySuccess) $ " ChannelType = " $ string(ChannelType));
    // End:0x1a2
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = ButtonQuit_OnClick;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    return true;
}

function bool rfAckLoginWithThailand(int Result)
{
    Log("[BTPageLogo::rfAckLoginWithThailand] Result=" $ string(Result));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithThailand] Result=" $ string(Result));
    // End:0xbc
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = ButtonQuit_OnClick;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    return true;
}

function bool rfAckLoginWithGlobal(int Result)
{
    Log("[BTPageLogo::rfAckLoginWithGlobal] Result=" $ string(Result));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithGlobal] Result=" $ string(Result));
    // End:0xb8
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = ButtonQuit_OnClick;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    return true;
}

defaultproperties
{
    fbButtonLogin=(X1=390.0,Y1=620.0,X2=509.0,Y2=652.0)
    fbButtonBattery=(X1=390.0,Y1=663.0,X2=633.0,Y2=695.0)
    fbButtonQuit=(X1=515.0,Y1=620.0,X2=633.0,Y2=652.0)
    fbEditID=(X1=444.0,Y1=549.0,X2=681.0,Y2=569.0)
    fbEditPW=(X1=444.0,Y1=583.0,X2=681.0,Y2=603.0)
    MaxRequestProcessPreLogin=3
    MessageUserWithSameIDConnected=" is already logged in. Log out of the previous connection?"
    MessageNoID="The ID does not exist."
    MessageWrongPWD="Incorrect password."
    MessageTypedNoPWD="Enter the correct password."
    CaptionLogin="Login"
    CaptionQuit="Quit"
    fbLabelBottomLine=(X1=0.0,Y1=736.0,X2=1024.0,Y2=768.0)
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnRendered=Internal_OnRendered
    OnKeyEvent=internalKeyEvent
}