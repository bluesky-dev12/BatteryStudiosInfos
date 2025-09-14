/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageServerSelectionCN.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:85
 *
 *******************************************************************************/
class BTPageServerSelectionCN extends BTPageServerSelection
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBackgrounddeco;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var export editinline BTOwnerDrawImageHK BGImageTotalServer;
var export editinline BTOwnerDrawImageHK CategorySvrChr[6];
var localized string strCategory[6];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbCategoryPos[6];
var localized string strEnterCh;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0xec
            break;
        // End:0x2e
        case 1:
            // End:0xec
            break;
        // End:0x80
        case 2:
            // End:0x7d
            if(bButtonRefresh)
            {
                bButtonRefresh = false;
                TPTopMenu.ButtonRefresh.DisableMe();
                RefreshPage();
                LastRefreshTime = PlayerOwner().Level.TimeSeconds;
            }
            // End:0xec
            break;
        // End:0x88
        case 3:
            // End:0xec
            break;
        // End:0x9f
        case 4:
            page_Main.ShowHelpWindow();
            // End:0xec
            break;
        // End:0xdb
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0xec
            break;
        // End:0xe9
        case 6:
            OpenTodayResultPage();
            // End:0xec
            break;
        // End:0xffff
        default:
            return true;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;
    local int i;

    bSkipInitializeDefaultPage = true;
    super(BTNetGUIPageHK).InitComponent(MyController, myOwner);
    LabelBackground = NewLabelComponent(fbLabelBackground, class'BTUIResourcePoolHK'.default.img_back1, 0.00010);
    LabelTopLine = NewLabelComponent(fbLabelTopLine, class'BTUIResourcePoolHK'.default.img_top_default, 0.000130);
    NewBackground = NewLabelComponent(fbNewBackground, class'BTUIResourcePoolHK'.default.new_Page_Thema, 0.000130);
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, class'BTUIResourcePoolHK'.default.img_serverchannel_bgdeco, 0.50);
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 144.0;
    LabelRoomName.ClipArea.X2 = 387.0;
    LabelRoomName.ClipArea.Y2 = 192.0;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    bButtonRefresh = false;
    TPTopMenu.ButtonRefresh.DisableMe();
    MyController.ResetFocus();
    ApplyLocalizedString();
    Console(Controller.Master.Console).ConsoleCommand("NatCheckOn");
    // End:0x1ba
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
    }
    // End:0x244
    else
    {
        page_Main.DefaultLobbyBGM = "bgm_lobby_part" $ string(int(float(page_Main.GameRunningCount) % float(2) + float(1)));
        page_Main.LastMainPageBGM = page_Main.DefaultLobbyBGM;
        PlayerOwner().Player.Console.SetOneBGM(page_Main.DefaultLobbyBGM);
    }
    ChannelADSmall = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(663.0, 472.0, 1012.0, 738.0));
    ChannelADSmall.buttonImage[0] = class'BTUIResourcePoolHK'.default.ad_serverchannel;
    ChannelADSmall.buttonImage[1] = class'BTUIResourcePoolHK'.default.ad_serverchannel;
    ChannelADSmall.buttonImage[2] = class'BTUIResourcePoolHK'.default.ad_serverchannel;
    ChannelADSmall.buttonImage[3] = class'BTUIResourcePoolHK'.default.ad_serverchannel;
    ChannelADSmall.buttonImage[4] = class'BTUIResourcePoolHK'.default.ad_serverchannel;
    ChannelADSmall.buttonImage[5] = class'BTUIResourcePoolHK'.default.ad_serverchannel;
    ChannelADSmall.Caption = "";
    ChannelADSmall.__OnClick__Delegate = AD_Small_OnClick;
    ChannelADLarge = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(6.0, 114.0, 318.0, 730.0));
    ChannelADLarge.buttonImage[0] = class'BTUIResourcePoolHK'.default.Ad_ServerChannel2;
    ChannelADLarge.buttonImage[1] = class'BTUIResourcePoolHK'.default.Ad_ServerChannel2;
    ChannelADLarge.buttonImage[2] = class'BTUIResourcePoolHK'.default.Ad_ServerChannel2;
    ChannelADLarge.buttonImage[3] = class'BTUIResourcePoolHK'.default.Ad_ServerChannel2;
    ChannelADLarge.buttonImage[4] = class'BTUIResourcePoolHK'.default.Ad_ServerChannel2;
    ChannelADLarge.buttonImage[5] = class'BTUIResourcePoolHK'.default.Ad_ServerChannel2;
    ChannelADLarge.Caption = "";
    ChannelADLarge.__OnClick__Delegate = AD_Large_OnClick;
    ButtonEnterCh = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(847.0, 403.0, 971.0, 440.0));
    ButtonEnterCh.SetDefaultFontColor();
    ButtonEnterCh.Caption = strEnterCh;
    ButtonEnterCh.__OnClick__Delegate = ButtonEnterCh_OnClick;
    ButtonEnterCh.buttonImage[0] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonEnterCh.buttonImage[1] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_on;
    ButtonEnterCh.buttonImage[2] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonEnterCh.buttonImage[3] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_block;
    ServerList = new class'BTACLGroutSelection';
    ServerList.bUseAWinPos = true;
    fb.X1 = 323.0;
    fb.Y1 = 114.0;
    fb.X2 = 629.0;
    fb.Y2 = 730.0;
    ServerList.AWinPos = fb;
    ServerList.RenderWeight = 0.20;
    ServerList.InitComponent(Controller, self);
    AppendComponent(ServerList);
    ServerList.MultiColumnList.MyScrollBar.Step = 1;
    ServerList.MultiColumnList.NoVisibleCols = 1;
    ServerList.MultiColumnList.NoVisibleRows = 22;
    ChannelList = new class'BTACLServerSelectionHK';
    ChannelList.bUseAWinPos = true;
    fb.X1 = 664.0;
    fb.Y1 = 114.0;
    fb.X2 = 1000.0;
    fb.Y2 = 394.0;
    ChannelList.AWinPos = fb;
    ChannelList.RenderWeight = 0.20;
    ChannelList.InitComponent(Controller, self);
    AppendComponent(ChannelList);
    i = 0;
    J0x6f8:
    // End:0x8de [While If]
    if(i < 6)
    {
        CategorySvrChr[i] = new class'BTOwnerDrawImageHK';
        CategorySvrChr[i].bUseAWinPos = true;
        CategorySvrChr[i].AWinPos = fbCategoryPos[i];
        CategorySvrChr[i].BackgroundImage.Image = none;
        CategorySvrChr[i].SetFontSizeAll(8);
        CategorySvrChr[i].FontStyle[0] = 9;
        CategorySvrChr[i].FontStyle[1] = 9;
        CategorySvrChr[i].FontStyle[2] = 9;
        CategorySvrChr[i].FontStyle[3] = 9;
        CategorySvrChr[i].FontStyle[4] = 9;
        // End:0x841
        if(i < 4)
        {
            CategorySvrChr[i].FontColor[0] = class'Canvas'.static.MakeColor(105, 105, 105, byte(255));
        }
        // End:0x871
        else
        {
            CategorySvrChr[i].FontColor[0] = class'Canvas'.static.MakeColor(204, 204, 204, byte(255));
        }
        CategorySvrChr[i].InitComponent(Controller, self);
        CategorySvrChr[i].Caption = strCategory[i];
        CategorySvrChr[i].CaptionDrawType = 3;
        AppendComponent(CategorySvrChr[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6f8;
    }
    page_Main.bFirstLogin = true;
}

function bool BTWIndowTodayResultHK_OnOK(GUIComponent Sender)
{
    page_Main.TcpLogin.sfReqLogOut(1);
    BTWindowTodayResultHK(Controller.TopPage()).FadeOut();
    return true;
}

function bool ButtonEnterCh_OnClick(GUIComponent Sender)
{
    // End:0x30
    if(ChannelList.ACLRowList[ChannelList.GetCurrentIndex()].bSpliter == true)
    {
        return true;
    }
    NewMoveToChannelByClick(ChannelList.SelChannel);
    ChannelList.SelChannel = none;
    return true;
}

function OnCompleteOpened()
{
    Log("[BTPageServerSelectionCN::OnCompleteOpened]");
    currentBGM = page_Main.DefaultLobbyBGM;
    page_Main.LastMainPageBGM = currentBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    RefreshPage();
    // End:0xab
    if(page_Main.bAutoMove)
    {
        class'BTWindowAutoStateHK'.static.ShowState(Controller, 1);
    }
    // End:0xe6
    else
    {
        // End:0xe6
        if(page_Main.bConnectedLoginServer == true)
        {
            page_Main.TcpLogin.sfReqCharInfo(MM.kUserName);
        }
    }
}

function AutoMoveTochannel(int ServerID, int ChannelID)
{
    local int i;

    Log("[BTPageServerSelectionCN::AutoMoveTochannel]");
    i = page_Main.FindServerConnectionInfoIndex(ServerID, ChannelID);
    // End:0x6b
    if(i < 0)
    {
        page_Main.EndAutoMove();
        return;
    }
    page_Main.iChannel = page_Main.SCIList[i].ChannelID;
    page_Main.ServerGroupName = page_Main.SCIList[i].ServerGroupName;
    page_Main.ServerName = page_Main.SCIList[i].ServerName;
    page_Main.ServerShortName = page_Main.SCIList[i].ServerShortName;
    page_Main.ChannelName = page_Main.SCIList[i].ChannelName;
    page_Main.ServerGroupID = page_Main.SCIList[i].ServerGroupID;
    page_Main.ServerID = page_Main.SCIList[i].ServerID;
    // End:0x1f4
    if(page_Main.SCIList[i].IsClanChannel > 0 && page_Main.MyClanName == "")
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 187);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = NoClanEnter_OnOK;
        return;
    }
    MM.PI_EnterChannel(page_Main.SCIList[i].ServerGroupID, page_Main.SCIList[i].ServerGroupName, page_Main.SCIList[i].ServerID, page_Main.SCIList[i].ServerName, page_Main.SCIList[i].ChannelID, page_Main.SCIList[i].ChannelName, page_Main.SCIList[i].IsClanChannel > 0, page_Main.SCIList[i].ChannelTypeValue, page_Main.SCIList[i].IsDedicatedServer);
    ConnectingChannel.ServerID = page_Main.SCIList[i].ServerID;
    ConnectingChannel.ChannelID = page_Main.SCIList[i].ChannelID;
    ConnectingChannel.IP = page_Main.SCIList[i].ServerIP;
    ConnectingChannel.Port = page_Main.SCIList[i].serverPort;
    ConnectingChannel.DataPort = page_Main.SCIList[i].ServerDataPort;
    Log("page_Main.LoginToChannel( " $ ConnectingChannel.IP $ ", " $ string(ConnectingChannel.Port) $ " , " $ string(ConnectingChannel.DataPort) $ ")");
    PlayerOwner().SendWebLog(4110, -1);
    page_Main.TcpLogin.sfReqLogOut(2);
}

function bool NoClanEnter_OnOK(GUIComponent Sender)
{
    page_Main.EndAutoMove();
    return true;
}

function NewMoveToChannel(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelectionCN::MoveToChannel]");
    Index = serverACL.GetCurrentIndex();
    Log("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex()) $ ", ChannelIndex = " $ string(Index) $ ")");
    // End:0xd3
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xef
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x16c
    if(MM.GMLevelFlag & 3 == 0 && row.DataPerColumn[1].IntValue >= row.DataPerColumn[1].tempValue)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
        return;
    }
    Log("Connecting Info = (" $ ConnectingChannel.IP $ ":" $ string(ConnectingChannel.Port) $ ")");
    page_Main.iRoomNum = -1;
    page_Main.iChannel = row.DataPerColumn[0].IntValue;
    page_Main.ServerGroupName = row.DataPerColumn[1].strValue;
    page_Main.ServerName = row.DataPerColumn[3].strValue;
    page_Main.ServerShortName = row.DataPerColumn[5].strValue;
    page_Main.ChannelName = row.DataPerColumn[0].strValue;
    page_Main.ServerGroupID = row.DataPerColumn[3].IntValue;
    page_Main.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ChannelID = row.DataPerColumn[0].IntValue;
    ConnectingChannel.IP = row.DataPerColumn[2].strValue;
    ConnectingChannel.Port = row.DataPerColumn[2].IntValue;
    ConnectingChannel.DataPort = row.DataPerColumn[4].IntValue;
    Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
    // End:0x3d6
    if(page_Main.SCIList[Index].IsClanChannel > 0 && page_Main.MyClanName == "")
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 187);
        return;
    }
    class'BTWindowDefineStateHK'.static.ShowState(Controller, 4);
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].ChannelTypeValue, page_Main.SCIList[Index].IsDedicatedServer);
    Log("page_Main.LoginToChannel( " $ ConnectingChannel.IP $ ", " $ string(ConnectingChannel.Port) $ " , " $ string(ConnectingChannel.DataPort) $ ")");
    PlayerOwner().SendWebLog(4110, -1);
    page_Main.TcpLogin.sfReqLogOut(2);
}

function NewMoveToChannelByClick(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelectionCN::MoveToChannel]");
    Index = serverACL.LastSelectedIndexHistory;
    Log("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex()) $ ", ChannelIndex = " $ string(Index) $ ")");
    // End:0xd2
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xee
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x12d
    if(row == none)
    {
        row = ChannelList.GetRowByIndex(nIndexDefCh);
    }
    // End:0x150
    if(row == none)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 197);
        return;
    }
    // End:0x1b3
    if(MM.GMLevelFlag & 3 == 0 && row.DataPerColumn[1].IntValue >= row.DataPerColumn[1].tempValue)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
        return;
    }
    Log("Connecting Info = (" $ ConnectingChannel.IP $ ":" $ string(ConnectingChannel.Port) $ ")");
    page_Main.iRoomNum = -1;
    page_Main.iChannel = row.DataPerColumn[0].IntValue;
    page_Main.ServerGroupName = row.DataPerColumn[1].strValue;
    page_Main.ServerName = row.DataPerColumn[3].strValue;
    page_Main.ServerShortName = row.DataPerColumn[5].strValue;
    page_Main.ChannelName = row.DataPerColumn[0].strValue;
    page_Main.ServerGroupID = row.DataPerColumn[3].IntValue;
    page_Main.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ChannelID = row.DataPerColumn[0].IntValue;
    ConnectingChannel.IP = row.DataPerColumn[2].strValue;
    ConnectingChannel.Port = row.DataPerColumn[2].IntValue;
    ConnectingChannel.DataPort = row.DataPerColumn[4].IntValue;
    Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
    // End:0x41d
    if(page_Main.SCIList[Index].IsClanChannel > 0 && page_Main.MyClanName == "")
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 187);
        return;
    }
    class'BTWindowDefineStateHK'.static.ShowState(Controller, 4);
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].ChannelTypeValue, page_Main.SCIList[Index].IsDedicatedServer);
    Log("page_Main.LoginToChannel( " $ ConnectingChannel.IP $ ", " $ string(ConnectingChannel.Port) $ " , " $ string(ConnectingChannel.DataPort) $ ")");
    PlayerOwner().SendWebLog(4110, -1);
    page_Main.TcpLogin.sfReqLogOut(2);
}

function MoveToChannel(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelection::MoveToChannel]");
    Index = serverACL.GetCurrentIndex();
    Log("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex()) $ ", ChannelIndex = " $ string(Index) $ ")");
    // End:0xd1
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xed
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x16c
    if(MM.GMLevelFlag & 3 == 0 && row.DataPerColumn[5].IntValue >= row.DataPerColumn[5].tempValue)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
        return;
    }
    class'BTWindowDefineStateHK'.static.ShowState(Controller, 4);
    Log("Connecting Info = (" $ ConnectingChannel.IP $ ":" $ string(ConnectingChannel.Port) $ ")");
    page_Main.iRoomNum = -1;
    page_Main.iChannel = row.DataPerColumn[0].IntValue;
    page_Main.ServerGroupName = row.DataPerColumn[1].strValue;
    page_Main.ServerName = row.DataPerColumn[3].strValue;
    page_Main.ServerShortName = row.DataPerColumn[5].strValue;
    page_Main.ChannelName = row.DataPerColumn[0].strValue;
    page_Main.ServerGroupID = row.DataPerColumn[3].IntValue;
    page_Main.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ServerID = row.DataPerColumn[3].tempValue;
    ConnectingChannel.ChannelID = row.DataPerColumn[0].IntValue;
    ConnectingChannel.IP = row.DataPerColumn[2].strValue;
    ConnectingChannel.Port = row.DataPerColumn[2].IntValue;
    ConnectingChannel.DataPort = row.DataPerColumn[4].IntValue;
    Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].ChannelTypeValue, page_Main.SCIList[Index].IsDedicatedServer);
    page_Main.pwm.CloseAndClear();
    Log("page_Main.LoginToChannel( " $ ConnectingChannel.IP $ ", " $ string(ConnectingChannel.Port) $ " , " $ string(ConnectingChannel.DataPort) $ ")");
    page_Main.LoginToChannel(ConnectingChannel.IP, ConnectingChannel.Port, ConnectingChannel.DataPort);
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageServerSelection::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x181
    if(ErrCode == 0)
    {
        // End:0x73
        if(page_Main.bAuthKeySuccess == false)
        {
            page_Main.SendLogin();
        }
        // End:0x122
        else
        {
            // End:0xe0
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
            }
            // End:0x122
            else
            {
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
            }
        }
        PlayerOwner().Level.clog("     Login IP : " $ page_Main.szLoginServerIP $ " Login Port : " $ string(page_Main.szLoginServerPort));
    }
    // End:0x1c1
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
}

function bool rfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec)
{
    Log("[BTPageServerSelection::rfAckTencent_AASInfo] " $ string(UserID) $ " " $ string(IsAdult) $ " " $ string(IsQQAuth) $ " " $ string(AccumTimeSec));
    // End:0xbc
    if(1 == IsAdult && 1 == IsQQAuth)
    {
        Log("[BTPageServerSelection::rfAckTencent_AASInfo] No AAS ");
        return true;
    }
    // End:0xdf
    if(0 == IsQQAuth)
    {
        page_Main.SetAASMessage(0, AccumTimeSec);
    }
    page_Main.SetAASMessage(1, AccumTimeSec);
    return true;
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    local BtrTime t;
    local int Day;

    Day = UnresolvedNativeFunction_99(ServerTime);
    Log("[BTPageServerSelection::rfAckGetServerTime] Day=" $ string(Day));
    BtrDoubleToBtrTime(ServerTime, t);
    PlayerOwner().dblog("t(double) = " $ UnresolvedNativeFunction_99(ServerTime));
    PlayerOwner().dblog(string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second));
    // End:0x1ea
    if(page_Main.AuthLogin_ClientIP == "")
    {
        page_Main.AuthLogin_ClientIP = ClientIP;
        // End:0x18d
        if(page_Main.Is18YearsOld(ServerTime, page_Main.BirthDay))
        {
            UnresolvedNativeFunction_97("# 18 Years Old Version");
            PlayerOwner().Level.bTeenVersion = false;
            class'LevelInfo'.default.bTeenVersion = false;
        }
        // End:0x1d1
        else
        {
            UnresolvedNativeFunction_97("# 15 Years Old Version");
            PlayerOwner().Level.bTeenVersion = true;
            class'LevelInfo'.default.bTeenVersion = true;
        }
        UnresolvedNativeFunction_97("# ClientIP = " $ ClientIP);
    }
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.CurrentTime = ServerTime;
    GameMgr.SetServerTime(ServerTime);
    PlayerOwner().dblog("gameMgr.kDiffTime = " $ UnresolvedNativeFunction_99(GameMgr.kDiffTime));
    GameMgr.ChangeInstance_ItemLeftTime(GameMgr.kClientTime);
    GameMgr.UpdateServerTime(GameMgr);
    CTRP.bGetServerTimeEnd = true;
    CheckToSetPageLobby();
    return true;
}

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    local int sciindex;
    local GameModeInfo gmi;
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserServerName=" $ InviteUserServerName);
    // End:0xfc
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        PlayerOwner().dblog("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserChannelNumber=" $ string(InviteUserChannelNumber) $ ", RoomNumber=" $ string(RoomNumber));
    }
    // End:0x340
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        sciindex = page_Main.FindServerConnectionInfoIndex(InviteUserServerID, InviteUserChannelNumber);
        // End:0x15b
        if(sciindex == -1)
        {
            Log("Failed! sciindex == -1");
            return true;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteGameHK");
        BTWindow = BTWindowInviteGameHK(Controller.TopPage());
        BTWindow.SetData(InviteUserServerName $ "/" $ page_Main.SCIList[sciindex].ChannelName, InviteCharName);
        BTWindow.RoomInfo.SetMapName(MapName);
        gmi = class'wGameSettings'.static.GetGameModeByIndex(GameMode);
        BTWindow.RoomInfo.SetRoomInfo("[" $ string(RoomNumber) $ "] " $ RoomName, RoomState, OwnerName, gmi.UserFriendlyName, "", "", "");
        BTWindow.ServerID = InviteUserServerID;
        BTWindow.ChannelID = InviteUserChannelNumber;
        BTWindow.RoomUniqueID = RoomUniqueID;
        BTWindow.RoomNumber = RoomNumber;
        BTWindow.InviterName = InviteCharName;
        BTWindow.Password = Password;
        BTWindow.TcpChannel = page_Main.TcpChannel;
        BTWindow.ElipsedTime = 0.0;
        BTWindow.__OnOK__Delegate = BTWindowInviteGameHK_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowInviteGameHK_OnCancel;
    }
    // End:0x384
    else
    {
        page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 3, BTWindow.InviterName);
    }
    return true;
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    return true;
}

function bool rfReqAnswerInviteGameRoom(byte Answer, string GuestCharName)
{
    Log("[BTPageServerSelection::rfReqAnswerInviteGameRoom] Answer=" $ string(Answer) $ ", GuestCharName=" $ GuestCharName);
    switch(Answer)
    {
        // End:0x99
        case 0:
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(129, GuestCharName), 5, true);
            // End:0x12c
            break;
        // End:0xc9
        case 1:
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(130, GuestCharName), 5, true);
            // End:0x12c
            break;
        // End:0xf9
        case 2:
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(131, GuestCharName), 5, true);
            // End:0x12c
            break;
        // End:0x129
        case 3:
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(132, GuestCharName), 5, true);
            // End:0x12c
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckClanMatch_InviteCrew] Result=" $ string(Result));
    // End:0x6d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
}

function bool rfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    local export editinline BTWindowInviteClanWarGameHK BTWindow;
    local int SCIndex;

    Log("[BTPageServerSelection::rfReqClanMatch_RecvInviteCrew] Inviter=" $ Inviter);
    // End:0x249
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        SCIndex = page_Main.FindServerChannelInfoIndexByServerIP(ServerIP, Port, InviteUserChannelNum);
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanWarGameHK");
        BTWindow = BTWindowInviteClanWarGameHK(Controller.TopPage());
        BTWindow.SetData(page_Main.SCIList[SCIndex].ServerName, Inviter);
        BTWindow.RoomInfo.SetMapName(string(MapNum));
        BTWindow.RoomInfo.SetRoomInfo("[" $ string(WaittingID) $ "] " $ RoomName, 0, LeaderName, strCW_GameMode, "", "", "");
        BTWindow.ServerID = page_Main.SCIList[SCIndex].ServerID;
        BTWindow.ChannelID = InviteUserChannelNum;
        BTWindow.RoomUniqueID = "";
        BTWindow.RoomNumber = WaittingID;
        BTWindow.InviterName = Inviter;
        BTWindow.Password = "";
        BTWindow.TcpChannel = page_Main.TcpChannel;
        BTWindow.ElipsedTime = 0.0;
        BTWindow.__OnOK__Delegate = BTWindowInviteClanWarGameHK_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowInviteClanWarGameHK_OnCancel;
    }
    return true;
}

function bool BTWindowInviteClanWarGameHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowInviteClanWarGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteClanWarGameHK_OnOK]");
    BTWindow = BTWindowInviteClanWarGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckClanMatch_RecvInviteCrew(0, BTWindow.InviterName);
    Controller.CloseMenu(false);
    page_Main.StartAutoMove(BTWindow.ServerID, BTWindow.ChannelID, BTWindow.RoomNumber, BTWindow.Password);
    return true;
}

function bool BTWindowInviteClanWarGameHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowInviteClanWarGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteClanWarGameHK_OnCancel]");
    BTWindow = BTWindowInviteClanWarGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckClanMatch_RecvInviteCrew(1, BTWindow.InviterName);
    BTWindow.FadeOut(false, true);
    return true;
}

function bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    Log("[BTPageLobby::rfReqClanMatch_InviteCrewResult] Invitee=" $ Invitee $ " Result=" $ string(Result));
    return true;
}

function bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    local int i;

    Log("[BTPageServerSelection::rfAckLimitedListInChannel]");
    // End:0x5c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.ChannelRestrictionMaps.Length = LimitedMapID.Length;
    i = 0;
    J0xa9:
    // End:0xe3 [While If]
    if(i < LimitedMapID.Length)
    {
        MM.ChannelRestrictionMaps[i] = LimitedMapID[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa9;
    }
    MM.ChannelRestrictionModes.Length = LimitedModeID.Length;
    i = 0;
    J0x100:
    // End:0x13a [While If]
    if(i < LimitedModeID.Length)
    {
        MM.ChannelRestrictionModes[i] = LimitedModeID[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x100;
    }
    return true;
}

function bool rfAckQuestListStart(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckQuestListStart]");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.bNewDailyQuestAvailable = false;
    MM.QuestList.Length = 0;
    MM.bSortQuestList = false;
    return true;
}

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest)
{
    local int i;

    Log("[BTPageServerSelection::rfAckQuestList] QuestID.Length=" $ string(QuestID.Length));
    i = 0;
    J0x4c:
    // End:0xec [While If]
    if(i < QuestID.Length)
    {
        MM.QuestList.Length = MM.QuestList.Length + 1;
        MM.QuestList[MM.QuestList.Length - 1].QuestID = QuestID[i];
        MM.QuestList[MM.QuestList.Length - 1].CurrentProgress = CountPrograss[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    return true;
}

function bool rfAckQuestListEnd()
{
    Log("[BTPageServerSelection::rfAckQuestListEnd]");
    MM.GenerateMissionList(Controller.ViewportOwner.Actor.Level.GameMgr);
    MM.UpdateQuestList(MM);
    AutoMoveAtFirstLogin();
    return true;
}

function bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckQuestUpdate]");
    page_Main.rMM.bRecvProtocolUpdateQuest = true;
    // End:0xb3
    if(Result != 0)
    {
        // End:0x7e
        if(Result == 513)
        {
            page_Main.rMM.bNoUpdateQuestInfo = true;
        }
        // End:0xb1
        else
        {
            page_Main.rMM.bNoUpdateQuestInfo = false;
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
        return true;
    }
    Log("[BTPageServerSelection::rfAckQuestUpdate] page_Main.TcpChannel.sfReqQuestList()");
    page_Main.rMM.bNoUpdateQuestInfo = false;
    page_Main.TcpChannel.sfReqQuestList();
    return true;
}

function bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    local int i, RewardPoint, RewardItemID;
    local wQuestParam q;

    Log("[BTPageServerSelection::rfReqQuestNewAvailable] AchivedQuestID.Length=" $ string(AchivedQuestID.Length) $ " NewQuestID=" $ string(NewQuestID.Length) $ ", ExpiredQuest.Length=" $ string(ExpiredQuest.Length));
    PlayerOwner().dblog("[BTPageServerSelection::rfReqQuestNewAvailable] AchivedQuestID.Length=" $ string(AchivedQuestID.Length) $ " NewQuestID=" $ string(NewQuestID.Length) $ ", ExpiredQuest.Length=" $ string(ExpiredQuest.Length));
    PlayerOwner().dblog("== AchivedQuestList ======");
    MM.CompletedQuestList.Length = AchivedQuestID.Length;
    i = 0;
    J0x175:
    // End:0x1f9 [While If]
    if(i < AchivedQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(AchivedQuestID[i]);
        PlayerOwner().dblog(string(AchivedQuestID[i]) @ q.QuestMissionDesc);
        MM.CompletedQuestList[i] = AchivedQuestID[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x175;
    }
    PlayerOwner().dblog("== NewQuestID ============");
    MM.NewQuestList.Length = NewQuestID.Length;
    i = 0;
    J0x23f:
    // End:0x2c3 [While If]
    if(i < NewQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(NewQuestID[i]);
        PlayerOwner().dblog(string(NewQuestID[i]) @ q.QuestMissionDesc);
        MM.NewQuestList[i] = NewQuestID[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23f;
    }
    PlayerOwner().dblog("== ExpiredQuestID ========");
    i = 0;
    J0x2f3:
    // End:0x357 [While If]
    if(i < ExpiredQuest.Length)
    {
        q = GameMgr.GetQuestInfo(ExpiredQuest[i]);
        PlayerOwner().dblog(string(ExpiredQuest[i]) @ q.QuestMissionDesc);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2f3;
    }
    PlayerOwner().dblog("==========================");
    // End:0x3c0
    if(MM.CompletedQuestList.Length > 0 || MM.NewQuestList.Length > 0)
    {
        page_Main.bNewAvailableQuest = true;
    }
    // End:0x3d1
    else
    {
        page_Main.bNewAvailableQuest = false;
    }
    i = 0;
    J0x3d8:
    // End:0x455 [While If]
    if(i < AchivedQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(AchivedQuestID[i]);
        RewardPoint += q.RewardPoint;
        RewardItemID += q.RewardItemID[0];
        RewardItemID += q.RewardItemID[1];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d8;
    }
    // End:0x48d
    if(RewardPoint > 0)
    {
        MM.kPoint += RewardPoint;
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x4ba
    if(RewardItemID > 0)
    {
        MM.kNeedUpdateItemList = true;
        MM.kNeedUpdateSkillList = true;
    }
    MM.RemoveQuestArray(AchivedQuestID);
    MM.RemoveQuestArray(ExpiredQuest);
    MM.AddQuestArray(NewQuestID);
    return true;
}

function bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    local int i;
    local wQuestParam q;

    Log("[BTPageServerSelection::rfReqDailyQuestNewAvailable] ExpiredQuestID.Length=" $ string(ExpiredQuestID.Length) $ " NewQuestID.Length=" $ string(NewQuestID.Length));
    PlayerOwner().dblog("[BTPageServerSelection::rfReqDailyQuestNewAvailable] ExpiredQuestID.Length=" $ string(ExpiredQuestID.Length) $ " NewQuestID.Length=" $ string(NewQuestID.Length));
    MM.bNewDailyQuestAvailable = true;
    PlayerOwner().dblog("== NewQuestID ============");
    i = 0;
    J0x140:
    // End:0x1a4 [While If]
    if(i < NewQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(NewQuestID[i]);
        PlayerOwner().dblog(string(NewQuestID[i]) @ q.QuestMissionDesc);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x140;
    }
    PlayerOwner().dblog("== ExpiredQuestID ========");
    i = 0;
    J0x1d4:
    // End:0x238 [While If]
    if(i < ExpiredQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(ExpiredQuestID[i]);
        PlayerOwner().dblog(string(ExpiredQuestID[i]) @ q.QuestMissionDesc);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d4;
    }
    PlayerOwner().dblog("==========================");
    // End:0x276
    if(page_Main.IsGameReadyOrPlaying())
    {
    }
    // End:0x29e
    else
    {
        MM.RemoveQuestArray(ExpiredQuestID);
        MM.AddQuestArray(NewQuestID);
    }
    return true;
}

function bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    Log("[BTPageServerSelection::rfAckMyMoney]");
    // End:0x4f
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = Point;
    MM.UpdateMoneyInfo(MM);
    return true;
}

function bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log("[BTPageServerSelection::rfAckWebzenShopScriptVersion] Year=" $ string(Year) $ ", YearID=" $ string(YearId) $ ", SalesZoneCode=" $ string(SalesZoneCode));
    page_Main.UpdateWebzenShopItemList(Year, YearId, SalesZoneCode);
    GameMgr.UpdateWebzenItemList(GameMgr);
    return true;
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log("[BTPageInventory::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year) $ " YearId=" $ string(YearId) $ " SalesZoneCode=" $ string(SalesZoneCode));
    page_Main.UpdateWebzenShopItemList(Year, YearId, SalesZoneCode);
    GameMgr.UpdateWebzenItemList(GameMgr);
    return true;
}

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    Log("[BTPageServerSelection::rfAckRegisteredPCBangInfo] Name(R,M)=" $ PCBangName $ "(" $ string(IsRegisteredPCBang) $ ", " $ string(IsMainPCBang) $ ")");
    // End:0x90
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kIsRegisteredPCBang = IsRegisteredPCBang;
    MM.kIsMainPCBang = IsMainPCBang;
    MM.kPCBangName = PCBangName;
    MM.UpdatePCBangInfo(MM);
    // End:0x12a
    if(MM.kIsRegisteredPCBang > 0 && MM.kIsPaidPCBang == 1)
    {
        page_Main.TcpChannel.sfReqPCBangUserList();
    }
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckCharInfo] CharName=" $ CharName);
    // End:0x718
    if(Result == 0)
    {
        // End:0x60
        if(MM.kUserName != CharName)
        {
            return true;
        }
        page_Main.pwm.StartProcess();
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
        MM.My_Level = stCharInfo.Level;
        page_Main.MyCharInfo = stCharInfo;
        page_Main.MyClanName = ClanName;
        MM.kUID = UserID;
        MM.kLevel = stCharInfo.Level;
        MM.kExp = stCharInfo.Exp;
        MM.kStartExp = GameMgr.GetStartExp(MM.kLevel);
        MM.kEndExp = GameMgr.GetEndExp(MM.kLevel);
        MM.kLevelMarkID = stCharInfo.LevelMarkID;
        MM.kTitleMarkID = stCharInfo.TitleMarkID;
        MM.kReserved1 = stCharInfo.Reserved1;
        MM.kReserved2 = stCharInfo.Reserved2;
        MM.kReserved3 = stCharInfo.Reserved3;
        // End:0x253
        if(ClanName == "none")
        {
            ClanName = "";
        }
        MM.kClanName = ClanName;
        MM.kInClanGrade = InClanRank;
        MM.kClanLevel = ClanLevel;
        MM.kClanLookingFor = stCharInfo.LookForClan > 0;
        MM.kClanPattern = CM_Pattern;
        MM.kClanBG = CM_BG;
        MM.kClanBL = CM_BL;
        GameMgr.SP.kClanPattern_Img = GameMgr.GetClanMark32(MM.kClanPattern);
        GameMgr.SP.kClanBG_Img = GameMgr.GetClanMark32(MM.kClanBG);
        GameMgr.SP.kClanBL_Img = GameMgr.GetClanMark32(MM.kClanBL);
        MM.kPrevRanking = stCharInfo.PrevRanking;
        MM.kRanking = stCharInfo.Ranking;
        MM.kPrevHeadShotRanking = stCharInfo.PrevHeadShotRanking;
        MM.kHeadShotRanking = stCharInfo.HeadShotRanking;
        MM.kPrevWomanRanking = stCharInfo.PrevWomanRanking;
        MM.kWomanRanking = stCharInfo.WomanRanking;
        MM.kMonthlyPrevRanking = stCharInfo.MonthlyPrevRanking;
        MM.kMonthlyRanking = stCharInfo.MonthlyRanking;
        MM.kMonthlyPrevHeadShotRanking = stCharInfo.MonthlyPrevHeadShotRanking;
        MM.kMonthlyHeadShotRanking = stCharInfo.MonthlyHeadShotRanking;
        MM.kMonthlyPrevWomanRanking = stCharInfo.MonthlyPrevWomanRanking;
        MM.kMonthlyWomanRanking = stCharInfo.MonthlyWomanRanking;
        MM.kKill = stCharInfo.Kill;
        MM.kDeath = stCharInfo.Death;
        MM.kWin = stCharInfo.Win;
        MM.kLose = stCharInfo.Lose;
        MM.kAssist = stCharInfo.Assist;
        MM.kHeadShot = stCharInfo.HeadShot2;
        MM.kDisConnectCount = stCharInfo.DisCon;
        MM.kTotalPlayTime = stCharInfo.TotPlayTime;
        // End:0x5bc
        if(MM.kClanName == "")
        {
            MM.kUser_ClanContribue = 0;
            page_Main.MyCharInfo.ClanContribue = 0;
        }
        // End:0x5d5
        else
        {
            MM.kUser_ClanContribue = stCharInfo.ClanContribue;
        }
        MM.kUser_ClanWin = stCharInfo.ClanWin;
        MM.kUser_ClanLose = stCharInfo.ClanLose;
        MM.kUser_ClanKill = stCharInfo.ClanKill;
        MM.kUser_ClanDeath = stCharInfo.ClanDeath;
        MM.kUser_ClanAssist = stCharInfo.ClanAssist;
        MM.kUser_ClanHeadshot = stCharInfo.ClanHeadshot;
        MM.kUser_ClanDiscon = stCharInfo.ClanDiscon;
        MM.kPoint = stCharInfo.Point;
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
        MM.UpdateRankingInfo(MM);
        MM.UpdateMoneyInfo(MM);
        MM.UpdateRecv_CharInfo(MM);
    }
    // End:0x731
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return false;
}

function bool rfAckClanInfo(ClanInfo stClanInfo)
{
    Log("[BTPageServerSelection::rfAckClanInfo]");
    page_Main.kRecvClanInfo = stClanInfo;
    // End:0x405
    if(MM.kClanName == stClanInfo.CM_ClanName)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        page_Main.MyClanInfo = stClanInfo;
        MM.kClanPattern = stClanInfo.CM_Pattern;
        MM.kClanBG = stClanInfo.CM_BG;
        MM.kClanBL = stClanInfo.CM_BL;
        GameMgr.SP.kClanPattern_Img = GameMgr.GetClanMark32(stClanInfo.CM_Pattern);
        GameMgr.SP.kClanBG_Img = GameMgr.GetClanMark32(stClanInfo.CM_BG);
        GameMgr.SP.kClanBL_Img = GameMgr.GetClanMark32(stClanInfo.CM_BL);
        MM.kClanExp = stClanInfo.ClanExp;
        MM.kClanMasterName = stClanInfo.ClanMasterCharname;
        MM.kClanWin = stClanInfo.ClanWin;
        MM.kClanLose = stClanInfo.ClanLose;
        MM.kClanDraw = stClanInfo.ClanDraw;
        MM.kClanKill = stClanInfo.ClanKill;
        MM.kClanDeath = stClanInfo.ClanDeath;
        MM.kClanRanking = stClanInfo.tRankCur;
        MM.kClanPrevRanking = stClanInfo.tRankPrev;
        MM.kClanMonthlyRanking = stClanInfo.mRankCur;
        MM.kClanMonthlyPrevRanking = stClanInfo.mRankPrev;
        MM.kClanRegion = stClanInfo.Region;
        MM.kClanMemberCount = stClanInfo.MemberCnt;
        MM.kClanMemberMaximum = stClanInfo.MemberTotal;
        MM.kClanIsRecruit = stClanInfo.IsRecruit;
        MM.kClanHowOld = stClanInfo.HowOld;
        MM.kClanKeyword = stClanInfo.Keyword;
        MM.kClanIntro = stClanInfo.Intro;
        MM.kClanNotice = stClanInfo.ClanNoti;
        MM.kClanActivity = stClanInfo.ClanActivity;
        MM.kClanActivityRank = stClanInfo.ClanActivityRank;
        MM.kClanActivityRankPrev = stClanInfo.ClanActivityRankPrev;
        MM.kClanActivityMRank = stClanInfo.ClanActivityMRank;
        MM.kClanActivityMRankPrev = stClanInfo.ClanActivityMRankPrev;
        MM.kClanLevel = stClanInfo.ClanLevel;
        MM.UpdateClanInfo(MM);
    }
    page_Main.UpdateRecv_ClanInfo(page_Main);
    return true;
}

function bool rfReqIsPaidWebzenPCBang(byte IsPaid)
{
    local export editinline BTWindowDefineInfoHK BTWindow;

    Log("[BTPageServerSelection::rfReqIsPaidWebzenPCBang] IsPaid=" $ string(IsPaid));
    PlayerOwner().dblog("[BTPageServerSelection::rfReqIsPaidWebzenPCBang] IsPaid=" $ string(IsPaid));
    // End:0x259
    if(MM.kIsRegisteredPCBang > 0)
    {
        // End:0x1a8
        if(IsPaid == 1)
        {
            // End:0x144
            if(MM.InGamePlaying)
            {
                page_Main.pwm.CreateAndPush(10, "GUIWarfareControls.BTWindowDefineInfoHK");
                BTWindow = BTWindowDefineInfoHK(page_Main.pwm.Last(10));
                BTWindow.SetContentText_Instance(179);
            }
            // End:0x1a5
            else
            {
                // End:0x182
                if(MM.kIsPaidPCBang == -1)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(178), 5, true);
                }
                // End:0x1a5
                else
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(179), 5, true);
                }
            }
        }
        // End:0x259
        else
        {
            // End:0x236
            if(MM.InGamePlaying)
            {
                page_Main.pwm.CreateAndPush(10, "GUIWarfareControls.BTWindowDefineInfoHK");
                BTWindow = BTWindowDefineInfoHK(page_Main.pwm.Last(10));
                BTWindow.SetContentText_Instance(177);
            }
            // End:0x259
            else
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(177), 5, true);
            }
        }
    }
    MM.kIsPaidPCBang = IsPaid;
    MM.kRecvPaidPCBangInfo = true;
    MM.UpdatePCBangInfo(MM);
    return true;
}

function bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckRegisterMainPCBang]");
    // End:0x5a
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqRegisteredPCBangInfo();
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 128);
    return true;
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    Log("[BTPageServerSelection::rfAckClanUserListStart] Result=" $ string(Result) $ " TotalCount=" $ string(TotalCount));
    MM.ClearClanList();
    MM.SetClanListCount(TotalCount);
    // End:0xba
    if(MM.kClanListCount == MM.kClanList.Length)
    {
        MM.UpdateClanList(MM);
    }
    return true;
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    local int i;

    Log("[BTPageServerSelection::rfAckClanUserList]");
    // End:0x54
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x5b:
    // End:0xe3 [While If]
    if(i < Level.Length)
    {
        MM.AddClanList(CharName[i], byte(DudeId[i] != 0), Level[i], ClanGrade[i], ClanWinCnt[i], ClanLoseCnt[i], LevelMarkID[i], TitleMarkID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5b;
    }
    // End:0x11d
    if(MM.kClanListCount == MM.kClanList.Length)
    {
        MM.UpdateClanList(MM);
    }
    return true;
}

function bool rfAckClanUserListEnd()
{
    Log("[BTPageServerSelection::rfAckClanUserListEnd]");
    return true;
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    Log("[BTPageServerSelection::rfAckFriendListStart]");
    MM.ClearFriendList();
    MM.SetFriendListCount(TotalCount);
    // End:0x8e
    if(MM.kFriendListCount == MM.kFriendList.Length)
    {
        MM.UpdateFriendList(MM);
    }
    return true;
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    local int i;

    Log("[BTPageServerSelection::rfAckFriendList]");
    Log("[BTPageServerSelection::rfAckFriendList] Start");
    Log("[BTPageServerSelection::rfAckFriendList] FriendName.Length=" $ string(FriendName.Length) $ ", ClanLevel.Length" $ string(ClanLevel.Length));
    i = 0;
    J0xce:
    // End:0x165 [While If]
    if(i < FriendName.Length)
    {
        MM.AddFriendList(FriendName[i], IsLogOn[i], CM_Pattern[i], CM_BG[i], CM_BL[i], ClanName[i], Level[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xce;
    }
    // End:0x19f
    if(MM.kFriendListCount == MM.kFriendList.Length)
    {
        MM.UpdateFriendList(MM);
    }
    Log("[BTPageServerSelection::rfAckFriendList] End");
    return true;
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    Log("[BTPageServerSelection::rfAckPCBangUserListStart]");
    MM.ClearPCBangList();
    MM.SetPCBangListCount(TotalCount);
    // End:0x92
    if(MM.kPCBangListCount == MM.kPCBangList.Length)
    {
        MM.UpdatePCBangList(MM);
    }
    return true;
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageServerSelection::rfAckPCBangUserList] FriendName.Length = " $ string(FriendName.Length));
    Log("[BTPageServerSelection::rfAckPCBangUserList] Start");
    i = 0;
    J0x8c:
    // End:0xa6 [While If]
    if(i < FriendName.Length)
    {
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8c;
    }
    // End:0xe0
    if(MM.kPCBangListCount == MM.kPCBangList.Length)
    {
        MM.UpdatePCBangList(MM);
    }
    Log("[BTPageServerSelection::rfAckPCBangUserList] End");
    return true;
}

function bool rfAckPCBangUserListEnd()
{
    Log("[BTPageServerSelection::rfAckPCBangUserListEnd]");
    return true;
}

function bool rfAckBlockUserList(array<string> CharName)
{
    local int i;
    local export editinline BTWindowOptionHK BTWindow;

    Log("[BTPageServerSelection::rfAckBlockUserList]");
    i = 0;
    J0x36:
    // End:0x6a [While If]
    if(i < CharName.Length)
    {
        MM.AddBlockList(CharName[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    // End:0x16f
    if(MM.kBlockListCount == MM.kBlockList.Length)
    {
        MM.UpdateBlockList(MM);
        MM.BlockUserListForOption.Length = MM.kBlockList.Length;
        i = 0;
        J0xca:
        // End:0x11b [While If]
        if(i < MM.kBlockList.Length)
        {
            MM.BlockUserListForOption[i] = MM.kBlockList[i].UserName;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xca;
        }
        BTWindow = BTWindowOptionHK(Controller.TopPage());
        // End:0x16f
        if(BTWindow != none)
        {
            BTWindow.TPOption.TPCommunity.UpdateBlockUserList(MM.BlockUserListForOption);
        }
    }
    return true;
}

function bool BTWindowRandBoxHK_OnOK(GUIComponent Sender)
{
    local int i;
    local export editinline BTWindowRandBoxHK BTWindow;
    local wItemBoxHK ItemInfo;

    BTWindow = BTWindowRandBoxHK(Controller.TopPage());
    i = 0;
    J0x21:
    // End:0x192 [While If]
    if(i < BTWindow.ItemIDChoose.Length)
    {
        ItemInfo = GameMgr.FindUIItem(BTWindow.ItemIDChoose[i]);
        // End:0x10a
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], UnresolvedNativeFunction_99(0), UnresolvedNativeFunction_99(BTWindow.ItemIdx[i]), 13, 1, 100000, BTWindow.PartIDChoose[i], 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
        }
        // End:0x188
        else
        {
            GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], BTWindow.ItemIdx[i], 0, 13, 1, 100000, BTWindow.PartIDChoose[i], 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
    GameMgr.UpdateItemList(GameMgr);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    local int i, GetItemCount;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<int> CandidateItemIDs, CandidatePartIDs;
    local export editinline BTWindowRandBoxHK BTWindow;

    Log("[BTPageServerSelection::rfAckRandomBox_Use] Result=" $ string(Result));
    // End:0x66
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(RandomBoxItemIdx);
    // End:0x8d
    if(instanceInfo == none)
    {
        return true;
    }
    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
    Controller.OpenMenu("GUIWarfareControls.BTWindowRandBoxHK");
    BTWindow = BTWindowRandBoxHK(Controller.TopPage());
    BTWindow.__OnOK__Delegate = BTWindowRandBoxHK_OnOK;
    BTWindow.TopLine.Caption = ItemInfo.ItemName;
    GetItemCount = GameMgr.GetRandBoxItemsCount(instanceInfo.ItemID);
    BTWindow.SetItemCount(GetItemCount);
    PlayerOwner().dblog("== Random Box =======");
    PlayerOwner().dblog("Used Item=" $ ItemInfo.ItemName);
    i = 0;
    J0x1c4:
    // End:0x3ca [While If]
    if(i < GetItemCount)
    {
        GameMgr.GetRandBoxItems(instanceInfo.ItemID, i + 1, CandidateItemIDs, CandidatePartIDs);
        BTWindow.SetCandidateItems(i, CandidateItemIDs, CandidatePartIDs);
        // End:0x24f
        if(i >= ItemIDChoose.Length)
        {
            BTWindow.SetAcquireItem(i, 0, 0, EmptyBtrDouble());
        }
        // End:0x3c0
        else
        {
            ItemInfo = GameMgr.FindUIItem(ItemIDChoose[i]);
            PlayerOwner().dblog("AcquireItem ItemName=" $ ItemInfo.ItemName $ ", ItemID=" $ string(ItemIDChoose[i]) $ ", PartID=" $ string(PartIDChoose[i]));
            // End:0x33e
            if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
            {
                BTWindow.SetAcquireItem(i, ItemIDChoose[i], PeriodOnChoosenItem[i], ItemIdx[i]);
            }
            // End:0x3c0
            else
            {
                // End:0x38b
                if(ItemInfo.CostType == 3)
                {
                    BTWindow.SetAcquireItem(i, ItemIDChoose[i], StackCountOnChoosenItem[i], ItemIdx[i]);
                }
                // End:0x3c0
                else
                {
                    BTWindow.SetAcquireItem(i, ItemIDChoose[i], PartIDChoose[i], ItemIdx[i]);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c4;
    }
    PlayerOwner().dblog("=====================");
    BTWindow.ItemIDChoose.Length = ItemIDChoose.Length;
    BTWindow.ItemIdx.Length = ItemIdx.Length;
    BTWindow.PartIDChoose.Length = PartIDChoose.Length;
    BTWindow.StackCount.Length = StackCount.Length;
    BTWindow.UntilTime.Length = UntilTime.Length;
    i = 0;
    J0x463:
    // End:0x51d [While If]
    if(i < ItemIDChoose.Length)
    {
        BTWindow.ItemIDChoose[i] = ItemIDChoose[i];
        BTWindow.ItemIdx[i] = ItemIdx[i];
        BTWindow.PartIDChoose[i] = PartIDChoose[i];
        BTWindow.StackCount[i] = StackCount[i];
        BTWindow.UntilTime[i] = UntilTime[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x463;
    }
    // End:0x53f
    if(RandomBxoItemCount == 0)
    {
        GameMgr.RemoveInstanceItem(RandomBoxItemIdx);
    }
    // End:0x558
    else
    {
        GameMgr.ChangeInstance_StackCount(RandomBoxItemIdx, RandomBxoItemCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    return true;
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckEquipItem] Result=" $ string(Result));
    // End:0x62
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x8c
    if(UnresolvedNativeFunction_99(ChangedOldUniqueID, EmptyBtrDouble()))
    {
        GameMgr.ChangeInstance_ItemSlotPos(ChangedOldUniqueID, ChangedOldSlotPosition);
    }
    // End:0xb6
    if(UnresolvedNativeFunction_99(ChangedNewUniqueID, EmptyBtrDouble()))
    {
        GameMgr.ChangeInstance_ItemSlotPos(ChangedNewUniqueID, ChangedNewSlotPosition);
    }
    return true;
}

function bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckAddBlockUserList]");
    // End:0x58
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqBlockUserList();
    return true;
}

function bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckRemoveBlockUserList]");
    // End:0x5b
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqBlockUserList();
    return true;
}

function bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    PlayerOwner().dblog("[BTPageServerSelection::rfAckWebzenBillingStorageListStart] Result=" $ string(Result) $ ", TotalCount=" $ string(TotalCount) $ ", TotalPage=" $ string(TotalPage) $ ", CurPage=" $ string(CurPage));
    Log("[BTPageServerSelection::rfAckWebzenBillingStorageListStart] Result=" $ string(Result) $ ", TotalCount=" $ string(TotalCount) $ ", TotalPage=" $ string(TotalPage) $ ", CurPage=" $ string(CurPage));
    // End:0x1aa
    if(Result != 0)
    {
        // End:0x18f
        if(page_Main.WZILP.bLock)
        {
            page_Main.WZILP.bLock = false;
            page_Main.UpdateWebzenInvenListEnd(page_Main);
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x1e9
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        return true;
    }
    // End:0x21e
    if(CurPage == 1)
    {
        page_Main.WZILP.MaxPage = TotalPage;
        GameMgr.kWZInvenList.Length = 0;
    }
    return true;
}

function bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    local int i, Len;

    PlayerOwner().dblog("[BTPageServerSelection::rfAckWebzenBillingStorageList] Seq.Length=" $ string(Seq.Length));
    Log("[BTPageServerSelection::rfAckWebzenBillingStorageList] Seq.Length=" $ string(Seq.Length));
    // End:0xea
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        return true;
    }
    i = 0;
    J0xf1:
    // End:0x493 [While If]
    if(i < Seq.Length)
    {
        Len = GameMgr.kWZInvenList.Length;
        GameMgr.kWZInvenList.Length = Len + 1;
        Log(string(Len) $ "  Seq=" $ string(Seq[i]) $ ", ItemSeq=" $ string(ItemSeq[i]) $ ", GroupCode=" $ string(GroupCode[i]) $ ", ShareFlag=" $ string(ShareFlag[i]) $ ", ProductSeq=" $ string(ProductSeq[i]) $ ", CashName=" $ CashName[i] $ ", CashPoint=" $ UnresolvedNativeFunction_99(CashPoint[i]) $ ", SendAccountID=" $ SendAccountID[i] $ ", SendMessage=" $ SendMessage[i] $ ", ItemType=" $ string(ItemType[i]) $ ", RelationType=" $ string(RelationType[i]) $ ", ProductType=" $ string(ProductType[i]));
        GameMgr.kWZInvenList[Len].Seq = Seq[i];
        GameMgr.kWZInvenList[Len].ItemSeq = ItemSeq[i];
        GameMgr.kWZInvenList[Len].GroupCode = GroupCode[i];
        GameMgr.kWZInvenList[Len].ShareFlag = ShareFlag[i];
        GameMgr.kWZInvenList[Len].ProductSeq = ProductSeq[i];
        GameMgr.kWZInvenList[Len].PriceSeq = PriceSeq[i];
        GameMgr.kWZInvenList[Len].CashName = CashName[i];
        GameMgr.kWZInvenList[Len].CashPoint = CashPoint[i];
        GameMgr.kWZInvenList[Len].SendAccountID = SendAccountID[i];
        GameMgr.kWZInvenList[Len].SendMessage = SendMessage[i];
        GameMgr.kWZInvenList[Len].ItemType = ItemType[i];
        GameMgr.kWZInvenList[Len].RelationType = RelationType[i];
        GameMgr.kWZInvenList[Len].ProductType = ProductType[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf1;
    }
    return true;
}

function bool rfAckWebzenBillingStorageListEnd()
{
    PlayerOwner().dblog("[BTPageServerSelection::rfAckWebzenBillingStorageListEnd]");
    Log("[BTPageServerSelection::rfAckWebzenBillingStorageListEnd]");
    // End:0xdc
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        page_Main.UpdateWebzenInvenListEnd(page_Main);
        return true;
    }
    GameMgr.UpdateWebzenItemList(GameMgr);
    // End:0x1b9
    if(page_Main.WZILP.CurPage < page_Main.WZILP.MaxPage)
    {
        page_Main.WZILP.CurPage = page_Main.WZILP.CurPage + 1;
        page_Main.TcpChannel.sfReqWebzenBillingStorageList(page_Main.WZILP.CurPage, page_Main.WZILP.CountPerPage, byte(Asc(page_Main.WZILP.StorageType)));
        page_Main.UpdateWebzenInvenList(page_Main);
    }
    // End:0x1e7
    else
    {
        page_Main.WZILP.bLock = false;
        page_Main.UpdateWebzenInvenListEnd(page_Main);
    }
    Log("page_Main.WZILP.StorageType = " $ page_Main.WZILP.StorageType);
    return true;
}

function bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    local wItemBoxHK ItemInfo;
    local int iItemExtra;

    Log("[BTPageServerSelection::rfAckWebzenBillingUseStorageItem] Result=" $ string(Result) $ ", ItemIdx=" $ UnresolvedNativeFunction_99(ItemIdx) $ ", ItemID=" $ string(ItemID) $ ", ItemExtra=" $ UnresolvedNativeFunction_99(ItemExtra));
    // End:0xbc
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x1f9
    if(ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID);
        // End:0x1f9
        if(ItemInfo != none)
        {
            // End:0x152
            if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
            {
                iItemExtra = UnresolvedNativeFunction_99(ItemExtra);
                GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, iItemExtra, 0, 1, 0);
            }
            // End:0x1e1
            else
            {
                // End:0x194
                if(ItemInfo.CostType == 1)
                {
                    GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, 1, 0, ItemExtra);
                }
                // End:0x1e1
                else
                {
                    // End:0x1e1
                    if(ItemInfo.CostType == 3)
                    {
                        iItemExtra = UnresolvedNativeFunction_99(ItemExtra);
                        GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, iItemExtra, 0);
                    }
                }
            }
            GameMgr.UpdateItemList(GameMgr);
        }
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    Log("page_Main.sfReqWebzenInvenList(" $ page_Main.WZILP.StorageType $ ")");
    page_Main.sfReqWebzenInvenList(page_Main.WZILP.StorageType);
    return true;
}

function bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckPaidItem_EraseRecord] RemainCount=" $ string(RemainCount));
    // End:0x72
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(ItemIdx);
    // End:0x1a7
    if(instanceInfo != none)
    {
        // End:0xb9
        if(RemainCount == 0)
        {
            GameMgr.RemoveInstanceItem(ItemIdx);
        }
        // End:0xd2
        else
        {
            GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
        }
        switch(Command)
        {
            // End:0xf6
            case 1:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 14);
                // End:0x18f
                break;
            // End:0x114
            case 2:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 10);
                // End:0x18f
                break;
            // End:0x132
            case 3:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 12);
                // End:0x18f
                break;
            // End:0x150
            case 4:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 4);
                // End:0x18f
                break;
            // End:0x16e
            case 5:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 58);
                // End:0x18f
                break;
            // End:0x18c
            case 6:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 60);
                // End:0x18f
                break;
            // End:0xffff
            default:
                GameMgr.UpdateItemList(GameMgr);
            }
            return true;
}

function bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckPaidItem_BroadCast]");
    // End:0x5a
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(ItemIdx);
    // End:0x15a
    if(instanceInfo != none)
    {
        Log("UsedItemID = " $ string(instanceInfo.ItemID));
        // End:0xc4
        if(StackCount == 0)
        {
            GameMgr.RemoveInstanceItem(ItemIdx);
        }
        // End:0xdd
        else
        {
            GameMgr.ChangeInstance_StackCount(ItemIdx, StackCount);
        }
        switch(instanceInfo.ItemID)
        {
            // End:0xf5
            case 17004:
            // End:0x116
            case 17075:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 31);
                // End:0x142
                break;
            // End:0x11e
            case 17005:
            // End:0x13f
            case 17076:
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 32);
                // End:0x142
                break;
            // End:0xffff
            default:
                GameMgr.UpdateItemList(GameMgr);
            }
            return true;
}

function bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    Log("[BTPageServerSelection::rfAckPaidItem_NotifyChangeClanname]");
    // End:0x80
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 186, MM.kClanName, NewClanname);
    }
    // End:0xb6
    else
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(186, MM.kClanName, NewClanname), 5, true);
    }
    return true;
}

function bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTPageServerSelection::rfAckPaidItem_ClanMarkDupCheck]");
    // End:0x96
    if(Result != 0)
    {
        BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
        // End:0x7b
        if(BTWindow != none)
        {
            BTWindow.SetDupCheck(false);
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0xe1
    if(BTWindow != none)
    {
        BTWindow.SetDupCheck(true);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 170);
    }
    return true;
}

function bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTPageServerSelection::rfAckPaidItem_ClanMarkDupCheck]");
    // End:0x97
    if(Result != 0)
    {
        BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
        // End:0x7c
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xb9
    if(StackCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);
    }
    // End:0xd2
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, StackCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x120
    if(BTWindow != none)
    {
        BTWindow.FadeOut(false, true);
    }
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 173);
    return true;
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    return true;
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return true;
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    return true;
}

function bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    // End:0x1f
    if(Result == 0)
    {
        MM.AddGMList(UserID);
    }
    return true;
}

function bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    // End:0x1f
    if(Result == 0)
    {
        MM.RemoveGMList(UserID);
    }
    return true;
}

function bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    local DelegateEventTimer det;
    local BtrTime t;
    local int i;

    Log("[BTPageServerSelection::rfAckCharBlockInfo] Result=" $ string(Result));
    // End:0x66
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xc9
    if(ChatBlockStartTime.dummy_1_DO_NOT_USE != 0 || ChatBlockStartTime.dummy_2_DO_NOT_USE != 0)
    {
        det = new class'DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBlockStartTime_OnEventTimer;
        GameMgr.AddEventTimer(1000, ChatBlockStartTime, det);
    }
    // End:0x12c
    if(ChatBlockEndTime.dummy_1_DO_NOT_USE != 0 || ChatBlockEndTime.dummy_2_DO_NOT_USE != 0)
    {
        det = new class'DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBlockEndTime_OnEventTimer;
        GameMgr.AddEventTimer(1001, ChatBlockEndTime, det);
    }
    GameMgr.ClearBlockedItem();
    i = 0;
    J0x142:
    // End:0x176 [While If]
    if(i < BlockedItemIdx.Length)
    {
        GameMgr.AddBlockedItem(BlockedItemIdx[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x142;
    }
    return true;
}

function ChatBlockStartTime_OnEventTimer(int Index)
{
    local BtrDouble D;
    local BtrTime t;

    Log("[BTPageServerSelection::ChatBlockStartTime_OnEventTimer]");
    D = GameMgr.GetLeftEventTime(1001);
    // End:0xd3
    if(D.dummy_1_DO_NOT_USE != 0 || D.dummy_2_DO_NOT_USE != 0)
    {
        BtrDoubleToBtrTime(D, t);
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(162, string(t.Day * 24 + t.Hour), string(t.Minute)), 5, true);
    }
    page_Main.bSystemChatBlock = true;
}

function ChatBlockEndTime_OnEventTimer(int Index)
{
    Log("[BTPageServerSelection::ChatBlockEndTime_OnEventTimer]");
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(159), 5, true);
    page_Main.bSystemChatBlock = false;
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    local string NewKey;

    Log("[BTPageServerSelection::rfAckClientChallenge]");
    NewKey = PlayerOwner().Level.GetMatchMaker().MakeMD5(Key1 $ PlayerOwner().Level.GetMatchMaker().gEngine.strMD5Digest);
    page_Main.TcpLogin.sfReqClientChecksum(NewKey, Key2);
    return true;
}

function bool rfAckClientChecksum(int Result)
{
    Log("[BTPageServerSelection::rfAckClientChecksum] Result=" $ string(Result));
    // End:0x4f
    if(Result == 0)
    {
    }
    // End:0x88
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 164);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    return true;
}

function bool BTWindowDefineARHK_40_41_OnOK(GUIComponent Sender)
{
    page_Main.page_Lobby2.HeaderButton_OnClick(page_Main.page_Lobby2.TPTopMenu.PostBox);
    class'BTWindowDefineARHK'.static.CloseWindowAll(Controller);
    return true;
}

function bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageServerSelection::rfAckGetMyMailBoxState] Result=" $ string(Result));
    CTRP.bGetMyMailBoxState = true;
    // End:0x7d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        CheckToSetPageLobby();
        return true;
    }
    // End:0x9e
    if(IsFull > 0)
    {
        page_Main.bPostBoxFull = true;
    }
    // End:0xaf
    else
    {
        page_Main.bPostBoxFull = false;
    }
    // End:0xce
    if(NewMailCount > 0)
    {
        page_Main.bNewMailArrived = true;
    }
    // End:0xdf
    else
    {
        page_Main.bNewMailArrived = false;
    }
    page_Main.NewMailCount = NewMailCount;
    // End:0x1c5
    if(IsFull > 0)
    {
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK");
        BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
        BTWindow.SetContentText_Instance(40);
        BTWindow.__OnOK__Delegate = BTWindowDefineARHK_40_41_OnOK;
        // End:0x1c2
        if(BTWindow == none)
        {
            Log("page_Main.pwm.Back(EPage_Lobby2) == none");
        }
    }
    // End:0x299
    else
    {
        // End:0x299
        if(NewMailCount > 0)
        {
            page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK");
            BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
            BTWindow.SetContentText_Instance(41, string(NewMailCount));
            BTWindow.__OnOK__Delegate = BTWindowDefineARHK_40_41_OnOK;
            // End:0x299
            if(BTWindow == none)
            {
                Log("page_Main.pwm.Back(EPage_Lobby2) == none");
            }
        }
    }
    CheckToSetPageLobby();
}

function bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    local export editinline BTWindowClanMenuHK BTWindow;

    Log("[BTPageServerSelection::rfAckSetLookForClan] Result=" $ string(Result) $ ", IsLookingFor=" $ string(IsLookingFor));
    MM.kClanLookingFor = IsLookingFor > 0;
    BTWindow = BTWindowClanMenuHK(Controller.TopPage());
    // End:0xba
    if(BTWindow != none)
    {
        BTWindow.SetClanLookingFor(MM.kClanLookingFor);
    }
    return true;
}

function bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    local string RecvMsg;

    Log("[BTPageLobby::rfAckChatNormal] Sender=" $ Sender $ ", " $ "Message=" $ Message);
    // End:0x57
    if(Result != 0)
    {
        return true;
    }
    // End:0x70
    if(MM.IsBlockUser(Sender))
    {
        return true;
    }
    // End:0xbf
    if(id == MM.kUID)
    {
        RecvMsg = "[" $ Sender $ "] " $ Message;
        page_Main.AddChatLog(RecvMsg, 4, true);
    }
    // End:0xf2
    else
    {
        RecvMsg = "[" $ Sender $ "] " $ Message;
        page_Main.AddChatLog(RecvMsg, 1, true);
    }
    return true;
}

function bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    local string RecvMsg;

    Log("[BTPageLobby:rfReqRecvChatWispher] CharnameFrom=" $ CharnameFrom $ ", " $ "Message=" $ Message);
    // End:0x6d
    if(MM.IsBlockUser(CharnameFrom))
    {
        return true;
    }
    RecvMsg = "" $ strFrom $ " [" $ CharnameFrom $ "]" @ Message;
    page_Main.AddChatLog(RecvMsg, 3, true);
    page_Main.LastRecvWhispherName = CharnameFrom;
    class'HudBase'.static.PlayHUDSound(PlayerOwner(), 6);
    return true;
}

function bool rfAckChatClan(string CharName, string Message, int Result)
{
    local string RecvMsg;

    Log("[BTPageLobby::rfAckChatClan] Charname=" $ CharName $ ", " $ "Message=" $ Message);
    // End:0x57
    if(Result != 0)
    {
        return true;
    }
    // End:0x70
    if(MM.IsBlockUser(CharName))
    {
        return true;
    }
    RecvMsg = "[" $ CharName $ "]" @ Message;
    page_Main.AddChatLog(RecvMsg, 2, true);
    return true;
}

function bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    local string RecvMsg;

    Log("[BTPageServerSelection::rfAckPaidItem_RelayBroadcast] [" $ CharName $ "] " $ Msg);
    RecvMsg = "[" $ CharName $ "]" @ Msg;
    page_Main.AddChatLog(RecvMsg, 7, true);
    return true;
}

function bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    local string msgp[7], fmtStr;
    local wItemBoxHK ItemInfo;
    local DelegateEventTimer det;

    msgp[0] = MsgInfo.CharName;
    msgp[1] = page_Main.FindServerName(MsgInfo.ServerID);
    msgp[2] = page_Main.FindChannelNickName(MsgInfo.ServerID, MsgInfo.ChannelNum);
    msgp[3] = GameMgr.GetLevelName(MsgInfo.CharLevel);
    // End:0xca
    if(MsgInfo.ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(MsgInfo.ItemID);
        msgp[4] = ItemInfo.ItemName;
    }
    // End:0xd5
    else
    {
        msgp[4] = "";
    }
    msgp[5] = string(MsgInfo.Point);
    // End:0x108
    if(CommunityType == 1)
    {
        msgp[6] = strPCBangFriend;
    }
    // End:0x113
    else
    {
        msgp[6] = "";
    }
    // End:0x1e5
    if(CommunityType == 1)
    {
        // End:0x1e3
        if(MM.kIsPaidPCBang == 1)
        {
            // End:0x19e
            if(MsgInfo.MsgCode == 5)
            {
                MM.AddPCBangList(MsgInfo.CharName, 0, 0, 0, "", MsgInfo.CharLevel, "", "", "", 0, 0, 0, "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                MM.UpdatePCBangList(MM);
            }
            // End:0x1e0
            else
            {
                // End:0x1e0
                if(MsgInfo.MsgCode == 6)
                {
                    MM.RemovePCBangList(MsgInfo.CharName);
                    MM.UpdatePCBangList(MM);
                }
            }
        }
        // End:0x1e5
        else
        {
            return true;
        }
    }
    // End:0x267
    if(MsgInfo.MsgCode == 14)
    {
        det = new class'DelegateEventTimer';
        det.Data_Int[0] = MsgInfo.MsgCode;
        det.Data_String[0] = msgp[0];
        det.__OnEventTimer__Delegate = Receive_EventGift;
        GameMgr.AddEventTimerHMS(0, 0, 0, 59, det);
        return true;
    }
    fmtStr = class'BTWindowSystemMsgInfoHK'.static.GetFormatString(MsgInfo.MsgCode, msgp[0], msgp[1], msgp[2], msgp[3], msgp[4], msgp[5], msgp[6]);
    Log("[BTPageServerSelection::rfAckRecvSystemMsg] " $ fmtStr $ ", CommunityType=" $ string(CommunityType));
    page_Main.AddChatLog(fmtStr, 5, true);
    // End:0x35b
    if(MsgInfo.MsgCode >= 2 && MsgInfo.MsgCode <= 4)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x38f
    if(MsgInfo.MsgCode >= 9 && MsgInfo.MsgCode <= 13)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x3b4
    if(MsgInfo.MsgCode == 5)
    {
        class'HudBase'.static.PlayHUDSound(PlayerOwner(), 5);
    }
    return true;
}

function Receive_EventGift(int Index)
{
    local string fmtStr;

    fmtStr = class'BTWindowSystemMsgInfoHK'.static.GetFormatString(GameMgr.kEventTimerList[Index].EventDelegate.Data_Int[0], GameMgr.kEventTimerList[Index].EventDelegate.Data_String[0]);
    Log("[BTPageServerSelection::Receive_EventGift] " $ fmtStr);
    page_Main.AddChatLog(fmtStr, 5, true);
    page_Main.SetNewMailArrived(true);
}

function bool rfAckServerType(byte Type)
{
    Log("[BTPageServerSelection::rfAckServerType] " $ string(Type));
    MM.kServerType = Type;
    // End:0x74
    if(MM.kServerType == 1)
    {
        MM.kClanMatch_InChannel = true;
    }
    // End:0x85
    else
    {
        MM.kClanMatch_InChannel = false;
    }
    return true;
}

function bool rfAckItemListEnd()
{
    local array<int> Pool;
    local int i;

    Log("[BTPageServerSelection::rfAckItemListEnd]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemListEnd();
    MM.kPrimaryID = GameMgr.FindInstanceItemIDBySlotPos(0);
    MM.kSecondaryID = GameMgr.FindInstanceItemIDBySlotPos(1);
    // End:0xc6
    if(MM.kPrimaryID == -1)
    {
        SetDefaultWeapon(0);
    }
    // End:0xe5
    if(MM.kSecondaryID == -1)
    {
        SetDefaultWeapon(1);
    }
    MM.kThrow1ID = GameMgr.FindInstanceItemIDBySlotPos(2);
    MM.kThrow2ID = GameMgr.FindInstanceItemIDBySlotPos(3);
    MM.kSkill1ID = GameMgr.FindInstanceItemIDBySlotPos(14);
    MM.kSkill2ID = GameMgr.FindInstanceItemIDBySlotPos(15);
    MM.kSkill3ID = GameMgr.FindInstanceItemIDBySlotPos(16);
    MM.kSkill4ID = GameMgr.FindInstanceItemIDBySlotPos(17);
    MM.kFaceID = GameMgr.FindInstanceItemIDBySlotPos(19);
    MM.kHelmetID = GameMgr.FindInstanceItemIDBySlotPos(18);
    MM.kFaceAccessoryID = GameMgr.FindInstanceItemIDBySlotPos(20);
    MM.kAFSpecialID = GameMgr.FindInstanceItemIDBySlotPos(21);
    MM.kRSASpecialID = GameMgr.FindInstanceItemIDBySlotPos(22);
    MM.UpdateEquipItemInfo(MM);
    GameMgr.UpdateItemList(GameMgr);
    // End:0x391
    if(GameMgr.CandidateLists.Length == 0)
    {
        Pool.Length = 11;
        Pool[0] = 17096;
        Pool[1] = 17095;
        Pool[2] = 17094;
        Pool[3] = 17093;
        Pool[4] = 17092;
        Pool[5] = 17090;
        Pool[6] = 16013;
        Pool[7] = 16014;
        Pool[8] = 16015;
        Pool[9] = 208026;
        Pool[10] = 305026;
        GameMgr.CandidateLists.Length = Pool.Length;
        i = 0;
        J0x348:
        // End:0x391 [While If]
        if(i < Pool.Length)
        {
            GameMgr.CandidateLists[i] = GameMgr.FindUIItem(Pool[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x348;
        }
    }
    CTRP.bItemListEnd = true;
    CheckToSetPageLobby();
    Log("[BTPageServerSelection::rfAckItemListEnd] Success Update UIItem");
    return true;
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    local int i, DispOrder;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckQSlotList] Result=" $ string(Result));
    // End:0x7cb
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetQSlotList(QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
        // End:0xf8
        if(QSlotID.Length != GameMgr.QuickSlotBoxList.Length)
        {
            GameMgr.ClearQuickSlotBoxList();
            GameMgr.AllocateQuickSlotBoxList(QSlotID.Length);
        }
        PlayerOwner().dblog("=========================================");
        PlayerOwner().dblog("QuickSlot ItemList From ChannelServer");
        PlayerOwner().dblog("=========================================");
        i = 0;
        J0x1a3:
        // End:0x77d [While If]
        if(i < QSlotID.Length)
        {
            DispOrder = QSlotDispOrder[i] - 1;
            GameMgr.SetQuickSlotBox_Name(DispOrder, QSlotName[i]);
            GameMgr.SetQuickSlotBox_ID(DispOrder, QSlotID[i]);
            PlayerOwner().dblog("====");
            PlayerOwner().dblog("QSlotDispOrder = " $ string(QSlotDispOrder[i]));
            PlayerOwner().dblog("QSlotName = " $ QSlotName[i] $ " QSlotID = " $ string(QSlotID[i]));
            instanceInfo = GameMgr.FindInstanceItem(MWItemID[i]);
            // End:0x33b
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 0, instanceInfo.ItemID, MWItemID[i]);
                PlayerOwner().dblog("0 WeaponID = (" $ string(instanceInfo.ItemID) $ ") Dur = (" $ string(instanceInfo.Durability) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(PistolItemID[i]);
            // End:0x3e7
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 1, instanceInfo.ItemID, PistolItemID[i]);
                PlayerOwner().dblog("1 WeaponID = (" $ string(instanceInfo.ItemID) $ ") Dur = (" $ string(instanceInfo.Durability) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(TWItemID1[i]);
            // End:0x494
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 2, instanceInfo.ItemID, TWItemID1[i]);
                PlayerOwner().dblog("2 WeaponID = (" $ string(instanceInfo.ItemID) $ ") Dur = (" $ string(instanceInfo.Durability) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(TWItemID2[i]);
            // End:0x541
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 3, instanceInfo.ItemID, TWItemID2[i]);
                PlayerOwner().dblog("3 WeaponID = (" $ string(instanceInfo.ItemID) $ ") Dur = (" $ string(instanceInfo.Durability) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill1[i]);
            // End:0x5cd
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 0, instanceInfo.ItemID, Skill1[i]);
                PlayerOwner().dblog("0 SkillID = (" $ string(instanceInfo.ItemID) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill2[i]);
            // End:0x659
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 1, instanceInfo.ItemID, Skill2[i]);
                PlayerOwner().dblog("1 SkillID = (" $ string(instanceInfo.ItemID) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill3[i]);
            // End:0x6e6
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 2, instanceInfo.ItemID, Skill3[i]);
                PlayerOwner().dblog("2 SkillID = (" $ string(instanceInfo.ItemID) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill4[i]);
            // End:0x773
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 3, instanceInfo.ItemID, Skill4[i]);
                PlayerOwner().dblog("3 SkillID = (" $ string(instanceInfo.ItemID) $ ")");
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1a3;
        }
        PlayerOwner().dblog("=========================================");
        CTRP.bQSListEnd = true;
        CheckToSetPageLobby();
    }
    // End:0x7e4
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageServerSelectionCN::rfAckMoveToLobby()] MessageType=" $ string(MessageType));
    Log("[BTPageServerSelectionCN::rfAckMoveToLobby] (" $ page_Main.szAccountName $ ", " $ page_Main.szLoginPassword $ ", " $ page_Main.AuthLogin_GUID $ ")");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    switch(MessageType)
    {
        // End:0x20d
        case 5:
            MM.bKickOut = true;
            // End:0x17e
            if(MM.InGamePlaying)
            {
                Controller.ViewportOwner.Actor.Level.GetMatchMaker().bForceGameOut = true;
                Controller.TcpHandler.sfReqNotifyExpiredItemIDs();
                Controller.TcpHandler.sfReqDisconnectGame();
            }
            Controller.TcpHandler.sfReqLogOut(3);
            Log("[BTPageServerSelectionCN::rfAckMoveToLobby] (" $ page_Main.szAccountName $ ", " $ page_Main.szLoginPassword $ ", " $ page_Main.AuthLogin_GUID $ ")");
            // End:0x212
            break;
        // End:0xffff
        default:
            return false;
    }
    return true;
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTPageServerSelectionCN::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    // End:0xc3
    if(MM.IsUsingTenProtect)
    {
        // End:0xa0
        if(PlayerOwner().Level.GetIsServiceBuild())
        {
            MM.TenProtectCreate(MM.LoginInfo.UIN);
        }
        // End:0xb4
        else
        {
            MM.TenProtectCreate(CharDBID);
        }
        MM.TenProtectSendInitData();
    }
    return true;
}

function bool AD_Small_OnClick(GUIComponent Sender)
{
    local DownloadTexture downTex;

    downTex = DownloadTexture(class'BTUIResourcePoolHK'.default.ad_serverchannel.Image);
    // End:0x83
    if(downTex != none && downTex.bIsExistLink == true)
    {
        PlayerOwner().Level.ConsoleCommand("ShellExecute OP=open FILE=" $ downTex.strLinkFileName);
    }
    return true;
    return true;
}

function bool AD_Large_OnClick(GUIComponent Sender)
{
    local DownloadTexture downTex;

    downTex = DownloadTexture(class'BTUIResourcePoolHK'.default.Ad_ServerChannel2.Image);
    // End:0x83
    if(downTex != none && downTex.bIsExistLink == true)
    {
        PlayerOwner().Level.ConsoleCommand("ShellExecute OP=open FILE=" $ downTex.strLinkFileName);
    }
}

defaultproperties
{
    fbLabelBackgrounddeco=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    strCategory[2]="Server Name"
    strCategory[3]="Server Status"
    strCategory[4]="Channel Name"
    strCategory[5]="Status"
    fbCategoryPos[0]=(X1=45.0,Y1=96.0,X2=145.0,Y2=109.0)
    fbCategoryPos[1]=(X1=237.0,Y1=96.0,X2=314.0,Y2=109.0)
    fbCategoryPos[2]=(X1=356.0,Y1=96.0,X2=456.0,Y2=109.0)
    fbCategoryPos[3]=(X1=548.0,Y1=96.0,X2=625.0,Y2=109.0)
    fbCategoryPos[4]=(X1=701.0,Y1=96.0,X2=801.0,Y2=109.0)
    fbCategoryPos[5]=(X1=913.0,Y1=96.0,X2=990.0,Y2=109.0)
    strEnterCh="Enter Channel"
    begin object name=mTabControl class=TabControlMocker
        OnVisiblePanelChanged=OnVisibleChannelListChanged
    object end
    // Reference: TabControlMocker'BTPageServerSelectionCN.mTabControl'
    TabControl=mTabControl
    begin object name=mTPTopMenu class=BTTPTopMenuSCHK
        bUseAWinPos=true
        AWinPos=(X1=454.0,Y1=0.0,X2=1016.0,Y2=70.0)
    object end
    // Reference: BTTPTopMenuSCHK'BTPageServerSelectionCN.mTPTopMenu'
    TPTopMenu=mTPTopMenu
    OnOpen=InternalOnOpen
    OnReOpen=InternalOnReOpen
    OnClose=InternalOnClose
    OnPreDraw=Internal_OnPreDraw
}