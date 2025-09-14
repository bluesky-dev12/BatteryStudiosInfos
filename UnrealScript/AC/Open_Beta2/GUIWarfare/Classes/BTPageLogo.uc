class BTPageLogo extends BTNetGUIPage
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

    TCP = new Class'GUIWarfare_Decompressed.BTPageLogo_TcpLogin';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageLogo::InternalOnOpen()");
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageLogo::InternalOnClose()");
    //return;    
}

function float DegreeToRadian(float Angle)
{
    return (Angle * 3.1415920) / float(180);
    //return;    
}

function TcpLogin_OnConnect(int ErrCode)
{
    // End:0x4B
    if(ErrCode != 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fbFullScreen;

    super.InitComponent(MyController, myOwner);
    Controller.PushPage();
    fbFullScreen = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 1024.0000000, 768.0000000);
    LabelLogo = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawImageHK', fbFullScreen));
    LogoState = 0;
    LogoImg.Length = 2;
    LogoImg[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_logo_CI;
    LogoImg[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_18;
    LabelLogo.BackgroundImage = LogoImg[LogoState];
    Degree = 0.0000000;
    TimeFade = 1.0000000;
    TimeDelay = 1.5000000;
    LabelLogo.BackgroundImage.DrawColor.A = 0;
    __OnTimer__Delegate = LabelLogo_Increase_OnTimer;
    // End:0x175
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        PlayerOwner().Level.GetMatchMaker().InitializeMapSettings();
        page_Main.PageOnOpen = 10;
        page_Main.GameRunningCount++;        
    }
    else
    {
        SetTimer(TimeFade / 90.0000000, true);
        __OnKeyEvent__Delegate = Internal_KeyEvent;
    }
    SupportResolution();
    bFirstRender = false;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls.BTROModelNew');
    CharacterModel.Init();
    bShowNotice = true;
    //return;    
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

    // End:0x1AF [Loop If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x1A5
        if(Priority == 0)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            // End:0x19E
            if((width == 1024) && Height == 768)
            {
                MM.DefaultSupportModeIdx = AddCnt;
            }
            AddCnt++;
        }
        i++;
        // [Loop Continue]
        goto J0x66;
    }
    i = 0;
    J0x1B6:

    // End:0x2CB [Loop If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x2C1
        if(Priority == 1)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            AddCnt++;
        }
        i++;
        // [Loop Continue]
        goto J0x1B6;
    }
    i = 0;
    J0x2D2:

    // End:0x3E8 [Loop If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x3DE
        if(Priority == 2)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            AddCnt++;
        }
        i++;
        // [Loop Continue]
        goto J0x2D2;
    }
    i = 0;
    J0x3EF:

    // End:0x505 [Loop If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x4FB
        if(Priority == 3)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            AddCnt++;
        }
        i++;
        // [Loop Continue]
        goto J0x3EF;
    }
    i = 0;
    J0x50C:

    // End:0x622 [Loop If]
    if(i < NumRes)
    {
        width = int(PC.ConsoleCommand("GETRESOLUTIONX INDEX=" $ string(i)));
        Height = int(PC.ConsoleCommand("GETRESOLUTIONY INDEX=" $ string(i)));
        Priority = Class'Engine.BTCustomDrawHK'.static.GetRatioIndex(width, Height);
        // End:0x618
        if(Priority > 3)
        {
            MM.SupportModes[AddCnt].width = width;
            MM.SupportModes[AddCnt].Height = Height;
            MM.SupportModes[AddCnt].RatioIndex = Priority;
            AddCnt++;
        }
        i++;
        // [Loop Continue]
        goto J0x50C;
    }
    i = 0;
    J0x629:

    // End:0x6B0 [Loop If]
    if(i < MM.SupportModes.Length)
    {
        // End:0x6A6
        if((MM.SupportModes[i].width < 640) || MM.SupportModes[i].Height < 480)
        {
            MM.SupportModes.Remove(i, 1);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x629;
    }
    //return;    
}

function LabelLogo_Increase_OnTimer(GUIComponent Sender)
{
    local float CAlpha;

    Degree += float(1);
    CAlpha = Sin(DegreeToRadian(Degree));
    // End:0x6A
    if(Degree >= float(90))
    {
        KillTimer();
        Degree = 90.0000000;
        LabelLogo.BackgroundImage.DrawColor.A = byte(255);
        __OnTimer__Delegate = LabelLogo_Delay_OnTimer;
        SetTimer(TimeDelay, true);
    }
    LabelLogo.BackgroundImage.DrawColor.A = byte(self.Min(int(CAlpha * float(255)), 255));
    //return;    
}

function LabelLogo_Delay_OnTimer(GUIComponent Sender)
{
    KillTimer();
    __OnTimer__Delegate = LabelLogo_Decrease_OnTimer;
    SetTimer(TimeFade / 90.0000000, true);
    //return;    
}

function LabelLogo_Decrease_OnTimer(GUIComponent Sender)
{
    local float CAlpha;

    Degree += float(1);
    CAlpha = Sin(DegreeToRadian(Degree));
    // End:0x148
    if(Degree >= float(180))
    {
        LogoState++;
        // End:0x108
        if(LogoState >= LogoImg.Length)
        {
            CAlpha = 0.0000000;
            KillTimer();
            // End:0xED
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                // End:0xBC
                if(int(SaveNeedChar) == 0)
                {
                    __NFUN_270__("characetercreate page!!!");
                    page_Main.SetPage(4, true);                    
                }
                else
                {
                    __NFUN_270__("serverselection page!!!");
                    page_Main.SetPage(5, true);
                }                
            }
            else
            {
                page_Main.SetPage(3, true);
            }
            ShowNotify();            
        }
        else
        {
            Degree = 0.0000000;
            LabelLogo.BackgroundImage = LogoImg[LogoState];
            __OnTimer__Delegate = LabelLogo_Increase_OnTimer;
            SetTimer(TimeFade / 90.0000000, true);
        }
    }
    LabelLogo.BackgroundImage.DrawColor.A = byte(self.Min(int(CAlpha * float(255)), 255));
    //return;    
}

function bool Internal_KeyEvent(out byte key, out byte Action, float Delta)
{
    local int k;
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x254
    if(int(iAction) == int(1))
    {
        // End:0x80
        if(((((int(iKey) == int(1)) || int(iKey) == int(2)) || int(iKey) == int(4)) || int(iKey) == int(237)) || int(iKey) == int(236))
        {
            return true;
        }
        KillTimer();
        // End:0x227
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0x1EC
            if(page_Main.bConnectedLoginServer)
            {
                page_Main.AuthLogin_AccountID = Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID;
                page_Main.AuthLogin_GUID = Controller.ViewportOwner.Actor.Level.AuthLogin_GUID;
                page_Main.AuthLogin_ChannelingType = Controller.ViewportOwner.Actor.Level.AuthLogin_ChannelingType;
                page_Main.AuthLogin_AuthKey = Controller.ViewportOwner.Actor.Level.AuthLogin_AuthKey;
                page_Main.AuthLogin_RegionKey = Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey;
                page_Main.SendLogin();                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
            }            
        }
        else
        {
            page_Main.SetPage(3, true);
        }
        LabelLogo.BackgroundImage.DrawColor.A = 0;
    }
    return true;
    //return;    
}

function bool Exit_OnClick(GUIComponent Sender)
{
    Log("[BTPageLogo::Exit_OnClick]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    Log((((("[BTPageLogo::rfAckLoginWithTencentAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(tc_AccountType)) $ " wzp_IsBlock=") $ string(tc_IsBlock));
    __NFUN_270__((((("[BTPageLogo::rfAckLoginWithTencentAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(tc_AccountType)) $ " wzp_IsBlock=") $ string(tc_IsBlock));
    return page_Main.TcpLogin_rfAckLoginWithTencentAuth_Live(Result, tc_AccountType, tc_IsBlock);
    //return;    
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log((((((((("[BTPageLogo::rfAckLoginWithWZAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(wzp_AccountType)) $ " wzp_IsBlock=") $ string(wzp_IsBlock)) $ " wzp_AuthKeySuccess=") $ string(wzp_AuthKeySuccess)) $ " ChannelType = ") $ string(ChannelType));
    __NFUN_270__((((((((("[BTPageLogo::rfAckLoginWithWZAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(wzp_AccountType)) $ " wzp_IsBlock=") $ string(wzp_IsBlock)) $ " wzp_AuthKeySuccess=") $ string(wzp_AuthKeySuccess)) $ " ChannelType = ") $ string(ChannelType));
    return page_Main.TcpLogin_rfAckLoginWithWZAuth_Live(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
    return true;
    //return;    
}

function bool rfAckLoginWithThailand(int Result)
{
    Log("[BTPageLogo::rfAckLoginWithThailand] Result=" $ string(Result));
    __NFUN_270__("[BTPageLogo::rfAckLoginWithThailand] Result=" $ string(Result));
    return page_Main.TcpLogin_rfAckLoginWithThailand_Live(Result);
    //return;    
}

function bool rfAckLoginWithGlobal(int Result)
{
    Log("[BTPageLogo::rfAckLoginWithGlobal] Result=" $ string(Result));
    __NFUN_270__("[BTPageLogo::rfAckLoginWithGlobal] Result=" $ string(Result));
    return page_Main.TcpLogin_rfAckLoginWithGlobal_Live(Result);
    //return;    
}

function bool rfAckLoginWithIndonesia(int Result)
{
    Log("[BTPageLogo::rfAckLoginWithIndonesia] Result=" $ string(Result));
    __NFUN_270__("[BTPageLogo::rfAckLoginWithIndonesia] Result=" $ string(Result));
    // End:0xCD
    if(Result != 0)
    {
        page_Main.HaltNetwork();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    return true;
    //return;    
}

function bool ForceDisconnect_OnOK(GUIComponent Sender)
{
    Log("[BTPageLogo::ForceDisconnect_OnOK]");
    page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.kUserName, 0);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageLogo::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log((((((((((((((((((((((("[BTPageLogo::rfAckLoginInHouseTest] " $ string(Sucess)) $ " ") $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg) $ " ") $ BDay) $ " ") $ string(Sex));
    // End:0x3A5
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
        // End:0x2AB
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0x20B
            if(page_Main.Is18YearsOld(ServerTime, page_Main.BirthDay))
            {
                __NFUN_270__("# 18 Years Old Version");
                PlayerOwner().Level.bTeenVersion = false;
                Class'Engine.LevelInfo'.default.bTeenVersion = false;                
            }
            else
            {
                __NFUN_270__("# 15 Years Old Version");
                PlayerOwner().Level.bTeenVersion = true;
                Class'Engine.LevelInfo'.default.bTeenVersion = true;
            }
            // End:0x295
            if(Controller.ViewportOwner.Actor.Level.GetIsTeenVersion())
            {
                LogoImg[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_15;                
            }
            else
            {
                LogoImg[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_18;
            }
        }
        SaveNeedChar = NeedChar;
        __NFUN_270__("SaveNeedChar :" $ string(SaveNeedChar));
        // End:0x324
        if(int(NeedChar) == 0)
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name : NULL");
            SetTimer(TimeFade / 90.0000000, true);            
        }
        else
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            SetTimer(TimeFade / 90.0000000, true);
        }        
    }
    else
    {
        // End:0x47C
        if(int(Sucess) == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 0, CharName);
            BTWindowDefineSelectHK(Controller.TopPage()).ButtonCancel.Caption = strExit;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = ForceDisconnect_OnOK;
            BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = Exit_OnOK;            
        }
        else
        {
            // End:0x4C5
            if(int(Sucess) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                
            }
            else
            {
                // End:0x50F
                if(int(Sucess) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                    
                }
                else
                {
                    // End:0x559
                    if(int(Sucess) == 3)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                        
                    }
                    else
                    {
                        // End:0x5A0
                        if(int(Sucess) == 15)
                        {
                            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    Log("[BTPageLogo::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x84
    if(Result > 1)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    return true;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int k;

    InternalOnPreDraw(C);
    // End:0x3F
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
        if((bSaveConnectLoginServer == false) && page_Main.bConnectedLoginServer == true)
        {
            bSaveConnectLoginServer = page_Main.bConnectedLoginServer;
            // End:0x11D
            if(Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
            {
                Log("page_Main.TcpLogin.sfReqClientChallenge()");
                page_Main.TcpLogin.sfReqClientChallenge();                
            }
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
                else
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
                }
            }
        }
    }
    return false;
    //return;    
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    local string NewKey;

    Log("[BTPageLogo::rfAckClientChallenge]");
    NewKey = PlayerOwner().Level.GetMatchMaker().MakeMD5(Key1 $ PlayerOwner().Level.GetMatchMaker().gEngine.strMD5Digest);
    page_Main.TcpLogin.sfReqClientChecksum(NewKey, Key2);
    return true;
    //return;    
}

function bool rfAckClientChecksum(int Result)
{
    local int k;

    Log("[BTPageLogo::rfAckClientChecksum] Result=" $ string(Result));
    // End:0x1B8
    if(Result == 0)
    {
        // End:0x17D
        if(page_Main.bConnectedLoginServer)
        {
            page_Main.AuthLogin_AccountID = Controller.ViewportOwner.Actor.Level.AuthLogin_AccountID;
            page_Main.AuthLogin_GUID = Controller.ViewportOwner.Actor.Level.AuthLogin_GUID;
            page_Main.AuthLogin_ChannelingType = Controller.ViewportOwner.Actor.Level.AuthLogin_ChannelingType;
            page_Main.AuthLogin_AuthKey = Controller.ViewportOwner.Actor.Level.AuthLogin_AuthKey;
            page_Main.AuthLogin_RegionKey = Controller.ViewportOwner.Actor.Level.AuthLogin_RegionKey;
            page_Main.SendLogin();            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 0);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 157);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnClick;
    }
    return true;
    //return;    
}

function bool rfAckEventNotify(int Type)
{
    Log("[BTPageServerSelection::rfAckEventNotify] Type=" $ string(Type));
    EventNotifyType = Type;
    return true;
    //return;    
}

function ShowNotify()
{
    // End:0x24
    if(EventNotifyType == 1)
    {
        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 52);        
    }
    else
    {
        // End:0x46
        if(EventNotifyType == 2)
        {
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 54);
        }
    }
    // End:0x86
    if(bShowNotice == true)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowNoticeHK");
    }
    //return;    
}

defaultproperties
{
    OnOpen=BTPageLogo.InternalOnOpen
    OnClose=BTPageLogo.InternalOnClose
    OnPreDraw=BTPageLogo.Internal_OnPreDraw
}