/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageLogo.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:25
 *
 *******************************************************************************/
class BTPageLogo extends BTNetGUIPage
    dependson(BTPageLogo_TcpLogin)
    editinlinenew
    instanced;

var bool bSaveConnectLoginServer;
var byte SaveNeedChar;
var int LogoState;
var array<Image> LogoImg;
var export editinline BTOwnerDrawImageHK Background;
var export editinline BTOwnerDrawImageHK LabelLogo;
var float Degree;
var float TimeFade;
var float TimeDelay;
var bool bFirstRender;
var BTROModelNew CharacterModel;
var int EventNotifyType;
var bool bShowNotice;

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageLogo_TcpLogin TCP;

    TCP = new class'BTPageLogo_TcpLogin';
    TCP.Owner = self;
    return TCP;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageLogo::InternalOnOpen()");
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageLogo::InternalOnClose()");
}

function float DegreeToRadian(float Angle)
{
    return Angle * 3.1415920 / float(180);
}

function TcpLogin_OnConnect(int ErrCode)
{
    // End:0x4b
    if(ErrCode != 0)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fbFullScreen;

    super.InitComponent(MyController, myOwner);
    Controller.PushPage();
    fbFullScreen = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 1024.0, 768.0);
    LabelLogo = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbFullScreen));
    LogoState = 0;
    LogoImg.Length = 2;
    LogoImg[0] = class'BTUIResourcePoolHK'.default.img_logo_CI;
    LogoImg[1] = class'BTUIResourcePoolHK'.default.img_18;
    LabelLogo.BackgroundImage = LogoImg[LogoState];
    Degree = 0.0;
    TimeFade = 1.0;
    TimeDelay = 1.50;
    LabelLogo.BackgroundImage.DrawColor.A = 0;
    __OnTimer__Delegate = LabelLogo_Increase_OnTimer;
    // End:0x175
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        PlayerOwner().Level.GetMatchMaker().InitializeMapSettings();
        page_Main.PageOnOpen = 10;
        ++ page_Main.GameRunningCount;
    }
    // End:0x190
    else
    {
        SetTimer(TimeFade / 90.0, true);
        __OnKeyEvent__Delegate = Internal_KeyEvent;
    }
    SupportResolution();
    bFirstRender = false;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    bShowNotice = true;
}

function SupportResolution()
{
    local int NumRes;
    local PlayerController PC;
    local wMatchMaker MM;
    local int i, width, Height, Priority, AddCnt;

    PC = PlayerOwner();
    MM = page_Main.rMM;
    NumRes = int(PC.ConsoleCommand("NUMRESOLUTION"));
    MM.SupportModes.Length = NumRes;
    AddCnt = 0;
    i = 0;
    J0x66:
    // End:0x1af [While If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = class'BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x1a5
        if(Priority == 0)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            // End:0x19e
            if(width == 1024 && Height == 768)
            {
                MM.DefaultSupportModeIdx = AddCnt;
            }
            ++ AddCnt;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x66;
    }
    i = 0;
    J0x1b6:
    // End:0x2cb [While If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = class'BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x2c1
        if(Priority == 1)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            ++ AddCnt;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1b6;
    }
    i = 0;
    J0x2d2:
    // End:0x3e8 [While If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = class'BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x3de
        if(Priority == 2)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            ++ AddCnt;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2d2;
    }
    i = 0;
    J0x3ef:
    // End:0x505 [While If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = class'BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x4fb
        if(Priority == 3)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            ++ AddCnt;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3ef;
    }
    i = 0;
    J0x50c:
    // End:0x622 [While If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = class'BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x618
        if(Priority > 3)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            ++ AddCnt;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50c;
    }
    i = 0;
    J0x629:
    // End:0x6b0 [While If]
    if(i < MM.SupportModes.Length)
    {
        // End:0x6a6
        if(MM.SupportModes[i].width < 640 || MM.SupportModes[i].Height < 480)
        {
            MM.SupportModes.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x629;
    }
}

function LabelLogo_Increase_OnTimer(GUIComponent Sender)
{
    local float CAlpha;

    Degree += float(1);
    CAlpha = Sin(DegreeToRadian(Degree));
    // End:0x6a
    if(Degree >= float(90))
    {
        KillTimer();
        Degree = 90.0;
        LabelLogo.BackgroundImage.DrawColor.A = byte(255);
        __OnTimer__Delegate = LabelLogo_Delay_OnTimer;
        SetTimer(TimeDelay, true);
    }
    LabelLogo.BackgroundImage.DrawColor.A = byte(self.Min(int(CAlpha * float(255)), 255));
}

function LabelLogo_Delay_OnTimer(GUIComponent Sender)
{
    KillTimer();
    __OnTimer__Delegate = LabelLogo_Decrease_OnTimer;
    SetTimer(TimeFade / 90.0, true);
}

function LabelLogo_Decrease_OnTimer(GUIComponent Sender)
{
    local float CAlpha;

    Degree += float(1);
    CAlpha = Sin(DegreeToRadian(Degree));
    // End:0x148
    if(Degree >= float(180))
    {
        ++ LogoState;
        // End:0x108
        if(LogoState >= LogoImg.Length)
        {
            CAlpha = 0.0;
            KillTimer();
            // End:0xed
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                // End:0xbc
                if(SaveNeedChar == 0)
                {
                    UnresolvedNativeFunction_97("characetercreate page!!!");
                    page_Main.SetPage(4, true);
                }
                // End:0xea
                else
                {
                    UnresolvedNativeFunction_97("serverselection page!!!");
                    page_Main.SetPage(5, true);
                }
            }
            // End:0xff
            else
            {
                page_Main.SetPage(3, true);
            }
            ShowNotify();
        }
        // End:0x148
        else
        {
            Degree = 0.0;
            LabelLogo.BackgroundImage = LogoImg[LogoState];
            __OnTimer__Delegate = LabelLogo_Increase_OnTimer;
            SetTimer(TimeFade / 90.0, true);
        }
    }
    LabelLogo.BackgroundImage.DrawColor.A = byte(self.Min(int(CAlpha * float(255)), 255));
}

function bool Internal_KeyEvent(out byte key, out byte Action, float Delta)
{
    local int k;
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x254
    if(iAction == 1)
    {
        // End:0x80
        if(iKey == 1 || iKey == 2 || iKey == 4 || iKey == 237 || iKey == 236)
        {
            return true;
        }
        KillTimer();
        // End:0x227
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0x1ec
            if(page_Main.bConnectedLoginServer)
            {
                page_Main.AuthLogin_AccountID = Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID;
                page_Main.AuthLogin_GUID = Controller.ViewportOwner.Actor.Level.AuthLogin_GUID;
                page_Main.AuthLogin_ChannelingType = Controller.ViewportOwner.Actor.Level.AuthLogin_ChannelingType;
                page_Main.AuthLogin_AuthKey = Controller.ViewportOwner.Actor.Level.AuthLogin_AuthKey;
                page_Main.AuthLogin_RegionKey = Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey;
                page_Main.SendLogin();
            }
            // End:0x224
            else
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
            }
        }
        // End:0x239
        else
        {
            page_Main.SetPage(3, true);
        }
        LabelLogo.BackgroundImage.DrawColor.A = 0;
    }
    return true;
}

function bool Exit_OnClick(GUIComponent Sender)
{
    Log("[BTPageLogo::Exit_OnClick]");
    Controller.ConsoleCommand("exit");
    return true;
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    Log("[BTPageLogo::rfAckLoginWithTencentAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(tc_AccountType) $ " wzp_IsBlock=" $ string(tc_IsBlock));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithTencentAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(tc_AccountType) $ " wzp_IsBlock=" $ string(tc_IsBlock));
    // End:0x141
    if(Result != 0)
    {
        page_Main.HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0x1b2
    if(tc_IsBlock == 1)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 87, Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0x1f6
    if(tc_AccountType == 0)
    {
        page_Main.rMM.GMLevelFlag = 0;
        page_Main.rMM.bAdminSpectator = false;
    }
    // End:0x27c
    else
    {
        // End:0x23a
        if(tc_AccountType == 1)
        {
            page_Main.rMM.GMLevelFlag = 1;
            page_Main.rMM.bAdminSpectator = true;
        }
        // End:0x27c
        else
        {
            // End:0x27c
            if(tc_AccountType == 2)
            {
                page_Main.rMM.GMLevelFlag = 0;
                page_Main.rMM.bAdminSpectator = false;
            }
        }
    }
    page_Main.AuthLogin_AccountType = tc_AccountType;
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log("[BTPageLogo::rfAckLoginWithWZAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(wzp_AccountType) $ " wzp_IsBlock=" $ string(wzp_IsBlock) $ " wzp_AuthKeySuccess=" $ string(wzp_AuthKeySuccess) $ " ChannelType = " $ string(ChannelType));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithWZAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(wzp_AccountType) $ " wzp_IsBlock=" $ string(wzp_IsBlock) $ " wzp_AuthKeySuccess=" $ string(wzp_AuthKeySuccess) $ " ChannelType = " $ string(ChannelType));
    // End:0x1b1
    if(Result != 0)
    {
        page_Main.HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0x1c1
    if(wzp_AuthKeySuccess == 1)
    {
    }
    // End:0x2bd
    else
    {
        // End:0x21a
        if(wzp_AuthKeySuccess == 0)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 88, page_Main.AuthLogin_AccountID);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
            return true;
        }
        // End:0x2bd
        else
        {
            // End:0x274
            if(wzp_AuthKeySuccess == 2)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 89, page_Main.AuthLogin_AccountID);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                return true;
            }
            // End:0x2bd
            else
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 90, page_Main.AuthLogin_AccountID);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                return true;
            }
        }
    }
    // End:0x32e
    if(wzp_IsBlock == 1)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 87, Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0x372
    if(wzp_AccountType == 0)
    {
        page_Main.rMM.GMLevelFlag = 0;
        page_Main.rMM.bAdminSpectator = false;
    }
    // End:0x3f8
    else
    {
        // End:0x3b6
        if(wzp_AccountType == 1)
        {
            page_Main.rMM.GMLevelFlag = 1;
            page_Main.rMM.bAdminSpectator = true;
        }
        // End:0x3f8
        else
        {
            // End:0x3f8
            if(wzp_AccountType == 2)
            {
                page_Main.rMM.GMLevelFlag = 0;
                page_Main.rMM.bAdminSpectator = false;
            }
        }
    }
    page_Main.AuthLogin_AccountType = wzp_AccountType;
    page_Main.AuthLogin_ChannelType = ChannelType;
    page_Main.rMM.kChannelingType = ChannelType;
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    return true;
}

function bool rfAckLoginWithThailand(int Result)
{
    Log("[BTPageLogo::rfAckLoginWithThailand] Result=" $ string(Result));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithThailand] Result=" $ string(Result));
    // End:0xcb
    if(Result != 0)
    {
        page_Main.HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    return true;
}

function bool rfAckLoginWithGlobal(int Result)
{
    Log("[BTPageLogo::rfAckLoginWithGlobal] Result=" $ string(Result));
    UnresolvedNativeFunction_97("[BTPageLogo::rfAckLoginWithGlobal] Result=" $ string(Result));
    // End:0xc7
    if(Result != 0)
    {
        page_Main.HaltNetwork();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    return true;
}

function bool ForceDisconnect_OnOK(GUIComponent Sender)
{
    Log("[BTPageLogo::ForceDisconnect_OnOK]");
    page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.kUserName, 0);
    Controller.CloseMenu(false);
    return true;
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageLogo::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log("[BTPageLogo::rfAckLoginInHouseTest] " $ string(Sucess) $ " " $ CharName $ " " $ string(TimeStamp) $ " " $ string(LoginHash1) $ " " $ string(LoginHash2) $ " " $ string(LoginHash3) $ " " $ string(LoginHash4) $ " " $ string(LoginHash5) $ " " $ string(NeedChar) $ " " $ ErrMsg $ " " $ BDay $ " " $ string(Sex));
    // End:0x3a5
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
        // End:0x2ab
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0x20b
            if(page_Main.Is18YearsOld(ServerTime, page_Main.BirthDay))
            {
                UnresolvedNativeFunction_97("# 18 Years Old Version");
                PlayerOwner().Level.bTeenVersion = false;
                class'LevelInfo'.default.bTeenVersion = false;
            }
            // End:0x24f
            else
            {
                UnresolvedNativeFunction_97("# 15 Years Old Version");
                PlayerOwner().Level.bTeenVersion = true;
                class'LevelInfo'.default.bTeenVersion = true;
            }
            // End:0x295
            if(Controller.ViewportOwner.Actor.Level.GetIsTeenVersion())
            {
                LogoImg[1] = class'BTUIResourcePoolHK'.default.img_15;
            }
            // End:0x2ab
            else
            {
                LogoImg[1] = class'BTUIResourcePoolHK'.default.img_18;
            }
        }
        SaveNeedChar = NeedChar;
        UnresolvedNativeFunction_97("SaveNeedChar :" $ string(SaveNeedChar));
        // End:0x324
        if(NeedChar == 0)
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name : NULL");
            SetTimer(TimeFade / 90.0, true);
        }
        // End:0x3a2
        else
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            SetTimer(TimeFade / 90.0, true);
        }
    }
    // End:0x5a0
    else
    {
        // End:0x47c
        if(Sucess == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 0, CharName);
            BTWindowDefineSelectHK(Controller.TopPage()).ButtonCancel.Caption = strExit;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = ForceDisconnect_OnOK;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = Exit_OnOK;
        }
        // End:0x5a0
        else
        {
            // End:0x4c5
            if(Sucess == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
            }
            // End:0x5a0
            else
            {
                // End:0x50f
                if(Sucess == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                }
                // End:0x5a0
                else
                {
                    // End:0x559
                    if(Sucess == 3)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                    }
                    // End:0x5a0
                    else
                    {
                        // End:0x5a0
                        if(Sucess == 15)
                        {
                            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
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
    Log("[BTPageLogo::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x84
    if(Result > 1)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    return true;
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int k;

    InternalOnPreDraw(C);
    // End:0x3f
    if(bFirstRender == false)
    {
        CharacterModel.Render(C);
        CharacterModel.Destroy();
        bFirstRender = true;
    }
    // End:0x291
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        // End:0x291
        if(bSaveConnectLoginServer == false && page_Main.bConnectedLoginServer == true)
        {
            bSaveConnectLoginServer = page_Main.bConnectedLoginServer;
            // End:0x11d
            if(Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
            {
                Log("page_Main.TcpLogin.sfReqClientChallenge()");
                page_Main.TcpLogin.sfReqClientChallenge();
            }
            // End:0x291
            else
            {
                // End:0x259
                if(page_Main.bConnectedLoginServer)
                {
                    page_Main.AuthLogin_AccountID = Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID;
                    page_Main.AuthLogin_GUID = Controller.ViewportOwner.Actor.Level.AuthLogin_GUID;
                    page_Main.AuthLogin_ChannelingType = Controller.ViewportOwner.Actor.Level.AuthLogin_ChannelingType;
                    page_Main.AuthLogin_AuthKey = Controller.ViewportOwner.Actor.Level.AuthLogin_AuthKey;
                    page_Main.AuthLogin_RegionKey = Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey;
                    page_Main.SendLogin();
                }
                // End:0x291
                else
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
                }
            }
        }
    }
    return false;
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    local string NewKey;

    Log("[BTPageLogo::rfAckClientChallenge]");
    NewKey = PlayerOwner().Level.GetMatchMaker().MakeMD5(Key1 $ PlayerOwner().Level.GetMatchMaker().gEngine.strMD5Digest);
    page_Main.TcpLogin.sfReqClientChecksum(NewKey, Key2);
    return true;
}

function bool rfAckClientChecksum(int Result)
{
    local int k;

    Log("[BTPageLogo::rfAckClientChecksum] Result=" $ string(Result));
    // End:0x1b8
    if(Result == 0)
    {
        // End:0x17d
        if(page_Main.bConnectedLoginServer)
        {
            page_Main.AuthLogin_AccountID = Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID;
            page_Main.AuthLogin_GUID = Controller.ViewportOwner.Actor.Level.AuthLogin_GUID;
            page_Main.AuthLogin_ChannelingType = Controller.ViewportOwner.Actor.Level.AuthLogin_ChannelingType;
            page_Main.AuthLogin_AuthKey = Controller.ViewportOwner.Actor.Level.AuthLogin_AuthKey;
            page_Main.AuthLogin_RegionKey = Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey;
            page_Main.SendLogin();
        }
        // End:0x1b5
        else
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
        }
    }
    // End:0x1f1
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 157);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
    }
    return true;
}

function bool rfAckEventNotify(int Type)
{
    Log("[BTPageServerSelection::rfAckEventNotify] Type=" $ string(Type));
    EventNotifyType = Type;
    return true;
}

function ShowNotify()
{
    // End:0x24
    if(EventNotifyType == 1)
    {
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 52);
    }
    // End:0x46
    else
    {
        // End:0x46
        if(EventNotifyType == 2)
        {
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 54);
        }
    }
    // End:0x86
    if(bShowNotice == true)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowNoticeHK");
    }
}

defaultproperties
{
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnPreDraw=Internal_OnPreDraw
}