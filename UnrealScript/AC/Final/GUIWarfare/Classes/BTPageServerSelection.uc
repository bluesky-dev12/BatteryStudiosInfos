class BTPageServerSelection extends BTNetGUIPageHK
    editinlinenew
    instanced;

enum EGmType
{
    GM_GRADE_NONE,                  // 0
    GM_GRADE_NORMAL,                // 1
    GM_GRADE_ESPORTS,               // 2
    GM_GRADE_PLAYER                 // 3
};

struct ConnectingInfo
{
    var int ServerID;
    var int ChannelID;
    var string IP;
    var int Port;
    var int DataPort;
};

struct CheckToReceivedPacket
{
    var bool bItemListEnd;
    var bool bSkillListEnd;
    var bool bQSListEnd;
    var bool bServerTimeEnd;
    var bool bGetMyMailBoxState;
    var bool bGetServerTimeEnd;
    var bool bHashEnd;
};

var array<ClanNameAndMark> ClanMarkList;
var export editinline GUIPage SavePg;
var Canvas SaveCanvas;
var bool bButtonRefresh;
var int SaveServerListIndex;
var int ToggleButCredit;
var float CurrentTime;
var float LastRefreshTime;
var float RefreshCycleTime;
var ConnectingInfo ConnectingChannel;
var() automated FloatBox fbLabelBackground;
var export editinline BTOwnerDrawImageHK LabelBackground;
var() automated FloatBox fbLabelBackgrounddeco;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var export editinline BTOwnerDrawCaptionButtonHK ButtonServerList[7];
var export editinline BTACLServerSelectionHK ACLServerList[7];
var() automated TabControlMocker TabControl;
var() automated BTTPTopMenuSCHK TPTopMenu;
var localized string strButtonCredit;
var export editinline BTOwnerDrawCaptionButtonHK ButtonCredit;
var export editinline BTOwnerDrawCaptionButtonHK ChannelADSmall;
var export editinline BTOwnerDrawCaptionButtonHK ChannelADLarge;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTemp;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTemp2;
var export editinline BTOwnerDrawImageHK BGImageTotalServer;
var CheckToReceivedPacket CTRP;
var localized string strPCBangFriend;
var localized string HashMessage;
var localized string strCW_GameMode;
var localized string strLotteryWinner;
var localized string strSpecialCompleteUser;
var export editinline BTOwnerDrawCaptionButtonHK ButtonEnterCh;
var export editinline BTACLGroutSelection ServerList;
var export editinline BTACLServerSelectionHK ChannelList;
var bool bDefaultServnChannel;
var export editinline BTOwnerDrawImageHK ChannelBg;
var() automated FloatBox fbChannelBg;
var int nIndexDefSrv;
var int nIndexDefCh;
var byte iProcessExpiredStep;

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageServerSelection_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageServerSelection_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageServerSelection_TcpLogin TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageServerSelection_TcpLogin';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0xDE
            break;
        // End:0x2E
        case 1:
            // End:0xDE
            break;
        // End:0x80
        case 2:
            // End:0x7D
            if(bButtonRefresh)
            {
                bButtonRefresh = false;
                TPTopMenu.ButtonRefresh.DisableMe();
                RefreshPage();
                LastRefreshTime = PlayerOwner().Level.TimeSeconds;
            }
            // End:0xDE
            break;
        // End:0x88
        case 3:
            // End:0xDE
            break;
        // End:0x9F
        case 4:
            page_Main.ShowHelpWindow();
            // End:0xDE
            break;
        // End:0xDB
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0xDE
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function ExitGame()
{
    local int i;

    Log("[BTPageServerSelection::HeaderButton_OnClick] Exit!!!");
    Log("Exit Chat Log Message Start");
    i = 0;
    J0x5F:

    // End:0x9D [Loop If]
    if(i < page_Main.ChatLog.Length)
    {
        Log(page_Main.ChatLog[i].chatText);
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    Log("Exit Chat Log Message End");
    Controller.ConsoleCommand("exit");
    //return;    
}

function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
    //return;    
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bSkipInitializeDefaultPage = true;
    super.InitComponent(MyController, myOwner);
    LabelBackground = NewLabelComponent(fbLabelBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_back1, 0.0001000);
    LabelTopLine = NewLabelComponent(fbLabelTopLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_top_default, 0.0001300);
    LabelBottomLine = BTLabelNoticeHK(NewComponent(new Class'GUIWarfare_Decompressed.BTLabelNoticeHK', fbLabelBottomLine, 0.0100000));
    LabelBottomLine.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_upper;
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 144.0000000;
    LabelRoomName.ClipArea.X2 = 387.0000000;
    LabelRoomName.ClipArea.Y2 = 192.0000000;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    bButtonRefresh = false;
    TPTopMenu.ButtonRefresh.DisableMe();
    MyController.ResetFocus();
    ApplyLocalizedString();
    Console(Controller.Master.Console).ConsoleCommand("NatCheckOn");
    // End:0x1B3
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {        
    }
    else
    {
        page_Main.DefaultLobbyBGM = "bgm_lobby_part" $ string(int((float(page_Main.GameRunningCount) % float(2)) + float(1)));
        page_Main.LastMainPageBGM = page_Main.DefaultLobbyBGM;
        PlayerOwner().Player.Console.SetOneBGM(page_Main.DefaultLobbyBGM);
    }
    page_Main.bFirstLogin = true;
    ChannelBg = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    ChannelBg.bUseAWinPos = true;
    ChannelBg.AWinPos = fbChannelBg;
    ChannelBg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ChannelBgBeginner;
    ChannelBg.InitComponent(Controller, self);
    ChannelBg.CaptionDrawType = 3;
    AppendComponent(ChannelBg);
    //return;    
}

function bool ButtonCredit_OnClick(GUIComponent Sender)
{
    page_Main.SetPage(25, false);
    return true;
    //return;    
}

function gameMgr_UpdateEventTimer(int EventType, BtrDouble EventTime)
{
    local BtrTime t;

    Log("gameMgr_UpdateEventTimer EventType=" $ string(EventType));
    BtrDoubleToBtrTime(GameMgr.kClientTime, t);
    BtrDoubleToBtrTime(EventTime, t);
    //return;    
}

function Event0_Timer(int Index)
{
    Log("--------------------------------- Event0_Timer --------------------------------------------");
    //return;    
}

function Event3_Timer(int Index)
{
    Log("--------------------------------- Event3_Timer --------------------------------------------");
    //return;    
}

function bool ButtonTemp_OnClick(GUIComponent Sender)
{
    local BtrTime t;
    local BtrDouble D;
    local DelegateEventTimer det;

    Controller.LaunchURL("http://payment.webzen.co.kr/Payment/PaymentMainFrm.asp");
    // End:0x5B5
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        // End:0x555
        if(ToggleButCredit == 0)
        {
            Log("=============================================");
            GameMgr.__dele_UpdateEventTimer__Delegate = gameMgr_UpdateEventTimer;
            GameMgr.UpdateClientTime();
            BtrDoubleToBtrTime(GameMgr.kClientTime, t);
            t.Second += 3;
            // End:0x147
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log((((((((((("t0 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = Event0_Timer;
            GameMgr.AddEventTimer(0, D, det);
            t.Second += 4;
            // End:0x267
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log((((((((((("t1 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            GameMgr.AddEventTimer(1, D);
            t.Second += 50;
            // End:0x35F
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log((((((((((("t2 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            GameMgr.AddEventTimer(2, D);
            t.Second += 6;
            // End:0x458
            if(t.Second >= 60)
            {
                t.Minute += (t.Second / 60);
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = Event0_Timer;
            Log((((((((((("t3 = " $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
            GameMgr.AddEventTimer(3, D, det);
            Log("=============================================");            
        }
        else
        {
            // End:0x59C
            if(ToggleButCredit == 1)
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
            }
        }
        ToggleButCredit++;
        // End:0x5B5
        if(ToggleButCredit > 1)
        {
            ToggleButCredit = 0;
        }
    }
    return true;
    //return;    
}

function bool ButtonTemp2_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
    return true;
    //return;    
}

function ApplyLocalizedString()
{
    //return;    
}

function DefaultSvrnChSelect()
{
    local int i, j;
    local BTAutoColumnListDataHK Split, row, temp;

    ServerList.MultiColumnList.LastSelected = 0;
    Split = ServerList.GetRowByIndex(ServerList.MultiColumnList.LastSelected);
    ChannelList.RemoveAll();
    i = 0;
    J0x5B:

    // End:0x3CC [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3C2
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.newlist_Channel_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            // End:0x191
            if(row.DataPerColumn[0].strValue == "")
            {
                // [Explicit Continue]
                goto J0x3C2;
            }
            row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
            row.DataPerColumn[1].IntValue = page_Main.SCIList[i].nCurUser;
            row.DataPerColumn[1].tempValue = page_Main.SCIList[i].nMaxUser;
            row.DataPerColumn[2].strValue = Split.DataPerColumn[5].strValue;
            row.DataPerColumn[2].IntValue = Split.DataPerColumn[5].IntValue;
            row.DataPerColumn[2].tempValue = Split.DataPerColumn[5].tempValue;
            row.DataPerColumn[3].strValue = Split.DataPerColumn[3].strValue;
            row.DataPerColumn[3].IntValue = Split.DataPerColumn[3].IntValue;
            row.DataPerColumn[3].tempValue = Split.DataPerColumn[3].tempValue;
            row.DataPerColumn[4].IntValue = Split.DataPerColumn[4].IntValue;
            row.DataPerColumn[6].IntValue = Split.DataPerColumn[6].IntValue;
            ChannelList.AddRow(row);
            ChannelList.AddChannelInfo(page_Main.SCIList[i].ChannelOption);
        }
        J0x3C2:

        i++;
        // [Loop Continue]
        goto J0x5B;
    }
    ChannelList.MultiColumnList.LastSelected = 0;
    j = 0;
    J0x3EC:

    // End:0x483 [Loop If]
    if(j < ChannelList.ACLRowList.Length)
    {
        temp = ChannelList.ACLRowList[j];
        // End:0x479
        if(float(temp.DataPerColumn[1].IntValue) < (float(temp.DataPerColumn[1].tempValue) * 0.9000000))
        {
            ChannelList.MultiColumnList.LastSelected = j;
            // [Explicit Break]
            goto J0x483;
        }
        j++;
        // [Loop Continue]
        goto J0x3EC;
    }
    J0x483:

    bDefaultServnChannel = false;
    nIndexDefSrv = ServerList.MultiColumnList.LastSelected;
    nIndexDefCh = ChannelList.MultiColumnList.LastSelected;
    //return;    
}

function InternalOnReOpen()
{
    __NFUN_270__("BTPageServerSelectionCN::InternalOnReOpen()");
    Log("[BTPageServerSelectionCN::InternalOnReOpen] Start");
    Controller.LogMenuStack();
    Log("[BTPageServerSelectionCN::InternalOnReOpen] End");
    bDefaultServnChannel = true;
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageServerSelectionCN::InternalOnOpen()");
    Log("[BTPageServerSelectionCN::InternalOnOpen] Start");
    Controller.PushPage();
    Log("[BTPageServerSelectionCN::InternalOnOpen] End");
    bDefaultServnChannel = true;
    //return;    
}

function OnBackToLastPage()
{
    Log("[BTPageServerSelection::OnBackToLastPage] Start");
    currentBGM = page_Main.DefaultLobbyBGM;
    page_Main.LastMainPageBGM = currentBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    RefreshPage();
    // End:0xAC
    if(page_Main.bAutoMove)
    {
        Class'GUIWarfareControls.BTWindowAutoStateHK'.static.ShowState(Controller, 1);
    }
    Log("[BTPageServerSelection::OnBackToLastPage] End");
    //return;    
}

function LogMenuStack()
{
    local int i;
    local export editinline GUIPage Page;

    PlayerOwner().dblog("[CallMenuStack] Start");
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Controller.MenuStack.Length = " $ string(Controller.Count()));
    i = 0;
    J0xA5:

    // End:0x108 [Loop If]
    if(i < Controller.Count())
    {
        Page = Controller.GetMenuByIndex(i);
        PlayerOwner().dblog(string(i) @ string(Page.Name));
        i++;
        // [Loop Continue]
        goto J0xA5;
    }
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("[CallMenuStack] End");
    //return;    
}

function LogControllerInfo()
{
    PlayerOwner().dblog("[ControllerInfo] Start");
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Controller Log!!!!!!");
    // End:0xD8
    if(Controller.FocusedControl != none)
    {
        PlayerOwner().dblog("    FocusedControl = " $ string(Controller.FocusedControl.Name));        
    }
    else
    {
        PlayerOwner().dblog("    FocusedControl = none");
    }
    // End:0x155
    if(Controller.ActiveControl != none)
    {
        PlayerOwner().dblog("    ActiveControl = " $ string(Controller.ActiveControl.Name));        
    }
    else
    {
        PlayerOwner().dblog("    ActiveControl = none");
    }
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Page Log!!!!!!");
    // End:0x449
    if(Controller.ActivePage != none)
    {
        PlayerOwner().dblog("ActivePage = " $ string(Controller.ActivePage.Name));
        // End:0x286
        if(Controller.ActivePage.FocusedControl != none)
        {
            PlayerOwner().dblog("    FocusedControl = " $ string(Controller.ActivePage.FocusedControl.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusedControl = none");
        }
        // End:0x314
        if(Controller.ActivePage.FocusInstead != none)
        {
            PlayerOwner().dblog("    FocusInstead = " $ string(Controller.ActivePage.FocusInstead.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusInstead = none");
        }
        // End:0x39D
        if(Controller.ActivePage.PageOwner != none)
        {
            PlayerOwner().dblog("    PageOwner = " $ string(Controller.ActivePage.PageOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    PageOwner = none");
        }
        // End:0x423
        if(Controller.ActivePage.MenuOwner != none)
        {
            PlayerOwner().dblog("    MenuOwner = " $ string(Controller.ActivePage.MenuOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    MenuOwner = none");
        }        
    }
    else
    {
        PlayerOwner().dblog("ActivePage = none");
    }
    // End:0x6E6
    if(Controller.TopPage() != none)
    {
        PlayerOwner().dblog("TopPage = " $ string(Controller.TopPage().Name));
        // End:0x51D
        if(Controller.TopPage().FocusedControl != none)
        {
            PlayerOwner().dblog("    FocusedControl = " $ string(Controller.TopPage().FocusedControl.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusedControl = none");
        }
        // End:0x5AD
        if(Controller.TopPage().FocusInstead != none)
        {
            PlayerOwner().dblog("    FocusInstead = " $ string(Controller.TopPage().FocusInstead.Name));            
        }
        else
        {
            PlayerOwner().dblog("    FocusInstead = none");
        }
        // End:0x638
        if(Controller.TopPage().PageOwner != none)
        {
            PlayerOwner().dblog("    PageOwner = " $ string(Controller.TopPage().PageOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    PageOwner = none");
        }
        // End:0x6C0
        if(Controller.TopPage().MenuOwner != none)
        {
            PlayerOwner().dblog("    MenuOwner = " $ string(Controller.TopPage().MenuOwner.Name));            
        }
        else
        {
            PlayerOwner().dblog("    MenuOwner = none");
        }        
    }
    else
    {
        PlayerOwner().dblog("TopPage = none");
    }
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("[ControllerInfo] End");
    //return;    
}

function TestTestTest()
{
    local int ret;
    local ClanMarkManager cmm;

    cmm = new Class'Engine.ClanMarkManager';
    cmm.AddClanMark("b", 2, 2, 2);
    cmm.AddClanMark("a", 1, 1, 1);
    cmm.AddClanMark("z", 5, 5, 5);
    cmm.AddClanMark("d", 4, 4, 4);
    cmm.AddClanMark("c", 3, 3, 3);
    ret = cmm.FindClanMark("b");
    ret = cmm.FindClanMark("c");
    ret = cmm.FindClanMark("d");
    ret = cmm.FindClanMark("e");
    //return;    
}

function InitializeDelegate()
{
    //return;    
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    MM.__UpdateCharInfo__Delegate = None;
    MM.__UpdateClanInfo__Delegate = None;
    MM.__UpdateClanList__Delegate = None;
    MM.__UpdateFriendList__Delegate = None;
    MM.__UpdatePCBangList__Delegate = None;
    //return;    
}

function RefreshPage()
{
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    super.RefreshPage();
    MM.SetCurpos(0);
    InitializeDelegate();
    // End:0x185
    if(page_Main.bConnectedLoginServer == false)
    {
        Log("page_Main.bConnectedLoginServer == false");
        // End:0x182
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
        {
            Log("class'BTWindowInfoHK'.static.ShowWindow() Start");
            Class'GUIWarfareControls.BTWindowInfoHK'.static.ShowWindow(Controller, "", "Disconnected a LoginServer");
            Log("class'BTWindowInfoHK'.static.ShowWindow() End");
        }        
    }
    else
    {
        Log("page_Main.bConnectedLoginServer == true");
        Log("page_Main.TcpLogin.sfReqServerList()");
        page_Main.TcpLogin.sfReqServerList();
    }
    LastRefreshTime = PlayerOwner().Level.TimeSeconds;
    MM.SetTcpTimeOutInUI();
    //return;    
}

function RefreshVisibleSet()
{
    Log("page_Main.TcpLogin.sfReqServerList()");
    page_Main.TcpLogin.sfReqServerList();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageServerSelection::InternalOnClose()");
    Controller.LogMenuStack();
    //return;    
}

function OnVisibleChannelListChanged(int Index)
{
    SaveServerListIndex = Index;
    //return;    
}

function AutoMoveAtFirstLogin()
{
    // End:0x50
    if(page_Main.bFirstLogin)
    {
        // End:0x2A
        if(MM.kLevel <= 5)
        {            
        }
        else
        {
            // End:0x3F
            if(MM.kLevel <= 8)
            {
            }
        }
        page_Main.bFirstLogin = false;
    }
    //return;    
}

function AutoMoveTochannel(int ServerID, int ChannelID)
{
    local int i;

    Log("[BTPageServerSelection::AutoMoveTochannel]");
    i = page_Main.FindServerConnectionInfoIndex(ServerID, ChannelID);
    // End:0x69
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
    MM.PI_EnterChannel(page_Main.SCIList[i].ServerGroupID, page_Main.SCIList[i].ServerGroupName, page_Main.SCIList[i].ServerID, page_Main.SCIList[i].ServerName, page_Main.SCIList[i].ChannelID, page_Main.SCIList[i].ChannelName, page_Main.SCIList[i].IsClanChannel > 0, page_Main.SCIList[i].IsDedicatedServer, page_Main.SCIList[i].ChannelOption[17] > float(0));
    ConnectingChannel.ServerID = page_Main.SCIList[i].ServerID;
    ConnectingChannel.ChannelID = page_Main.SCIList[i].ChannelID;
    ConnectingChannel.IP = page_Main.SCIList[i].ServerIP;
    ConnectingChannel.Port = page_Main.SCIList[i].serverPort;
    ConnectingChannel.DataPort = page_Main.SCIList[i].ServerDataPort;
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
    //return;    
}

function NewMoveToChannel(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelection::MoveToChannel]");
    Index = serverACL.GetCurrentIndex();
    Log(((("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex())) $ ", ChannelIndex = ") $ string(Index)) $ ")");
    // End:0xD1
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xED
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x16C
    if(((int(MM.GMLevelFlag) & 3) == 0) && row.DataPerColumn[5].IntValue >= row.DataPerColumn[5].tempValue)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
        return;
    }
    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 4);
    Log(((("Connecting Info = (" $ ConnectingChannel.IP) $ ":") $ string(ConnectingChannel.Port)) $ ")");
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
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsDedicatedServer, page_Main.SCIList[Index].ChannelOption[17] > float(0));
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
    //return;    
}

function ShowChannelList(BTACLGroutSelection serverACL)
{
    local int nIndex, i;
    local BTAutoColumnListDataHK Split, row;

    ChannelList.RemoveAll();
    nIndex = serverACL.GetCurrentIndex();
    // End:0x31
    if(nIndex < 0)
    {
        return;
    }
    // End:0x5D
    if(nIndex < 4)
    {
        ChannelBg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ChannelBgBeginner;        
    }
    else
    {
        // End:0x97
        if((nIndex >= 4) && nIndex < 8)
        {
            ChannelBg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ChannelBgTraining;            
        }
        else
        {
            // End:0xD1
            if((nIndex >= 8) && nIndex < 24)
            {
                ChannelBg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ChannelBgNormal;                
            }
            else
            {
                // End:0x10B
                if((nIndex >= 24) && nIndex < 28)
                {
                    ChannelBg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ChannelBgExpert;                    
                }
                else
                {
                    // End:0x134
                    if(nIndex >= 28)
                    {
                        ChannelBg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ChannelBgClan;
                    }
                }
            }
        }
    }
    Split = serverACL.GetRowByIndex(nIndex);
    i = 0;
    J0x155:

    // End:0x4C6 [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x4BC
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.newlist_Channel_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            // End:0x28B
            if(row.DataPerColumn[0].strValue == "")
            {
                // [Explicit Continue]
                goto J0x4BC;
            }
            row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
            row.DataPerColumn[1].IntValue = page_Main.SCIList[i].nCurUser;
            row.DataPerColumn[1].tempValue = page_Main.SCIList[i].nMaxUser;
            row.DataPerColumn[2].strValue = Split.DataPerColumn[5].strValue;
            row.DataPerColumn[2].IntValue = Split.DataPerColumn[5].IntValue;
            row.DataPerColumn[2].tempValue = Split.DataPerColumn[5].tempValue;
            row.DataPerColumn[3].strValue = Split.DataPerColumn[3].strValue;
            row.DataPerColumn[3].IntValue = Split.DataPerColumn[3].IntValue;
            row.DataPerColumn[3].tempValue = Split.DataPerColumn[3].tempValue;
            row.DataPerColumn[4].IntValue = Split.DataPerColumn[4].IntValue;
            row.DataPerColumn[6].IntValue = Split.DataPerColumn[6].IntValue;
            ChannelList.AddRow(row);
            ChannelList.AddChannelInfo(page_Main.SCIList[i].ChannelOption);
        }
        J0x4BC:

        i++;
        // [Loop Continue]
        goto J0x155;
    }
    //return;    
}

function FirstShowChannelList()
{
    local int nIndex, i;
    local BTAutoColumnListDataHK Split, row;

    ChannelList.RemoveAll();
    // End:0x1C
    if(nIndex < 0)
    {
        return;
    }
    Split = ServerList.GetRowByIndex(0);
    i = 0;
    J0x39:

    // End:0x3DD [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3D3
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.newlist_Channel_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
            row.DataPerColumn[1].IntValue = Split.DataPerColumn[1].IntValue;
            row.DataPerColumn[1].strValue = Split.DataPerColumn[1].strValue;
            row.DataPerColumn[2].strValue = Split.DataPerColumn[2].strValue;
            row.DataPerColumn[2].IntValue = Split.DataPerColumn[2].IntValue;
            row.DataPerColumn[3].strValue = Split.DataPerColumn[3].strValue;
            row.DataPerColumn[3].IntValue = Split.DataPerColumn[3].IntValue;
            row.DataPerColumn[3].tempValue = Split.DataPerColumn[3].tempValue;
            row.DataPerColumn[4].IntValue = Split.DataPerColumn[4].IntValue;
            row.DataPerColumn[5].strValue = Split.DataPerColumn[5].strValue;
            row.DataPerColumn[5].IntValue = Split.DataPerColumn[5].IntValue;
            row.DataPerColumn[5].tempValue = Split.DataPerColumn[5].tempValue;
            row.DataPerColumn[6].IntValue = Split.DataPerColumn[6].IntValue;
            ChannelList.AddRow(row);
            ChannelList.AddChannelInfo(page_Main.SCIList[i].ChannelOption);
        }
        i++;
        // [Loop Continue]
        goto J0x39;
    }
    //return;    
}

function MoveToChannel(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelection::MoveToChannel]");
    Index = serverACL.GetCurrentIndex();
    Log(((("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex())) $ ", ChannelIndex = ") $ string(Index)) $ ")");
    // End:0xD1
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xED
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x16C
    if(((int(MM.GMLevelFlag) & 3) == 0) && row.DataPerColumn[5].IntValue >= row.DataPerColumn[5].tempValue)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
        return;
    }
    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 4);
    Log(((("Connecting Info = (" $ ConnectingChannel.IP) $ ":") $ string(ConnectingChannel.Port)) $ ")");
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
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsDedicatedServer, page_Main.SCIList[Index].ChannelOption[17] > float(0));
    page_Main.pwm.CloseAndClear();
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.LoginToChannel(ConnectingChannel.IP, ConnectingChannel.Port, ConnectingChannel.DataPort);
    //return;    
}

function bool rfAckServerListFromLoginServer(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    NewDrawServerSelection(CServername, CServerShortName, ServerIP, serverPort, ChannelName, ChannelNickName, ChannelNum, chMaxUser, chCurUser, ServerGroupName, ServerGroupID, ServerDispOrder, DataPort, OptionCount_byte, OptionKey_byte, OptionValue_byte, OptionCount_int, OptionKey_int, OptionValue_int, OptionCount_float, OptionKey_float, OptionValue_float, IsClanChannel, IsUseDedicateHost);
    bDefaultServnChannel = true;
    return true;
    //return;    
}

function NewDrawServerSelection(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    local BTAutoColumnListDataHK row;
    local array<int> arServerGroupID, arServerDispOrder;
    local array<string> distinctiveServerNames, distinctiveChannelNames, distIPs;
    local array<int> distPorts;
    local bool foundDuplicate;
    local array<int> arMaxuser, arCurUser;
    local int nMaxUser, nCurUser, i, j, byteCnt, intCnt,
	    floatCnt, byteStartIdx, intStartIdx, floatStartIdx;

    local float ChannelOption[19];

    TabControl.Clear();
    ServerList.RemoveAll();
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] Start");
    i = 0;
    J0x66:

    // End:0x184 [Loop If]
    if(i < ServerGroupName.Length)
    {
        Log((((((((((((((((((((((((("[" $ string(i)) $ "] ") $ ServerIP[i]) $ ", ") $ string(serverPort[i])) $ ", ") $ ChannelName[i]) $ ", ") $ string(ChannelNum[i])) $ ", ") $ string(chMaxUser[i])) $ ", ") $ string(chMaxUser[i])) $ ", ") $ string(chCurUser[i])) $ ", ") $ ServerGroupName[i]) $ ", ") $ string(ServerGroupID[i])) $ ", ") $ string(DataPort[i])) $ ", ") $ string(IsClanChannel[i])) $ ", ") $ string(IsUseDedicateHost[i]));
        i++;
        // [Loop Continue]
        goto J0x66;
    }
    i = 0;
    J0x18B:

    // End:0x28F [Loop If]
    if(i < ServerGroupName.Length)
    {
        foundDuplicate = false;
        j = 0;
        J0x1AA:

        // End:0x1EA [Loop If]
        if(j < distinctiveServerNames.Length)
        {
            // End:0x1E0
            if(distinctiveServerNames[j] == ServerGroupName[i])
            {
                foundDuplicate = true;
                // [Explicit Break]
                goto J0x1EA;
            }
            j++;
            // [Loop Continue]
            goto J0x1AA;
        }
        J0x1EA:

        // End:0x285
        if(!foundDuplicate)
        {
            distinctiveServerNames[distinctiveServerNames.Length] = ServerGroupName[i];
            distinctiveChannelNames[distinctiveChannelNames.Length] = CServername[i];
            distIPs[distIPs.Length] = ServerIP[i];
            distPorts[distPorts.Length] = serverPort[i];
            arServerGroupID[arServerGroupID.Length] = ServerGroupID[i];
            arServerDispOrder[arServerDispOrder.Length] = ServerDispOrder[i];
        }
        i++;
        // [Loop Continue]
        goto J0x18B;
    }
    j = 0;
    J0x296:

    // End:0x342 [Loop If]
    if(j < distinctiveServerNames.Length)
    {
        i = 0;
        J0x2AD:

        // End:0x306 [Loop If]
        if(i < ServerGroupName.Length)
        {
            // End:0x2FC
            if(distinctiveServerNames[j] == ServerGroupName[i])
            {
                nMaxUser += chMaxUser[i];
                nCurUser += chCurUser[i];
            }
            i++;
            // [Loop Continue]
            goto J0x2AD;
        }
        arMaxuser[arMaxuser.Length] = nMaxUser;
        arCurUser[arCurUser.Length] = nCurUser;
        nCurUser = 0;
        nMaxUser = 0;
        j++;
        // [Loop Continue]
        goto J0x296;
    }
    i = 0;
    J0x349:

    // End:0x57F [Loop If]
    if(i < distinctiveServerNames.Length)
    {
        row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
        row.Init(7);
        row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.newlist_serv_n;
        row.DataPerColumn[0].ServerGroupImg = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ServerGroup[0];
        row.DataPerColumn[1].IntValue = int((float(row.DataPerColumn[2].IntValue) / float(row.DataPerColumn[2].tempValue)) * float(100));
        row.DataPerColumn[1].strValue = distinctiveChannelNames[i];
        row.DataPerColumn[2].IntValue = arCurUser[i];
        row.DataPerColumn[2].tempValue = arMaxuser[i];
        row.DataPerColumn[3].strValue = distinctiveChannelNames[i];
        row.DataPerColumn[3].IntValue = arServerGroupID[i];
        row.DataPerColumn[3].tempValue = arServerDispOrder[i];
        row.DataPerColumn[4].IntValue = DataPort[i];
        row.DataPerColumn[5].strValue = distIPs[i];
        row.DataPerColumn[5].IntValue = distPorts[i];
        row.DataPerColumn[6].IntValue = int(IsClanChannel[i]);
        ServerList.AddRow(row);
        i++;
        // [Loop Continue]
        goto J0x349;
    }
    page_Main.ClearServerChannelList();
    byteStartIdx = 0;
    intStartIdx = 0;
    floatStartIdx = 0;
    byteCnt = 0;
    intCnt = 0;
    floatCnt = 0;
    i = 0;
    J0x5BF:

    // End:0x806 [Loop If]
    if(i < CServername.Length)
    {
        j = 0;
        J0x5D6:

        // End:0x5FD [Loop If]
        if(j < 19)
        {
            ChannelOption[j] = 0.0000000;
            j++;
            // [Loop Continue]
            goto J0x5D6;
        }
        byteCnt = int(OptionCount_byte[i]);
        j = byteStartIdx;
        J0x61B:

        // End:0x65C [Loop If]
        if(j < (byteStartIdx + byteCnt))
        {
            ChannelOption[int(OptionKey_byte[j])] = float(OptionValue_byte[j]);
            j++;
            // [Loop Continue]
            goto J0x61B;
        }
        byteStartIdx += byteCnt;
        intCnt = int(OptionCount_int[i]);
        j = intStartIdx;
        J0x686:

        // End:0x6C7 [Loop If]
        if(j < (intStartIdx + intCnt))
        {
            ChannelOption[int(OptionKey_int[j])] = float(OptionValue_int[j]);
            j++;
            // [Loop Continue]
            goto J0x686;
        }
        intStartIdx += intCnt;
        floatCnt = int(OptionCount_float[i]);
        j = floatStartIdx;
        J0x6F1:

        // End:0x730 [Loop If]
        if(j < (floatStartIdx + floatCnt))
        {
            ChannelOption[int(OptionKey_float[j])] = OptionValue_float[j];
            j++;
            // [Loop Continue]
            goto J0x6F1;
        }
        floatStartIdx += floatCnt;
        page_Main.AddServerChannelList(ServerDispOrder[i], ChannelNum[i], ServerIP[i], serverPort[i], DataPort[i], CServername[i], CServerShortName[i], ChannelName[i], ServerGroupID[i], ServerGroupName[i], int(IsClanChannel[i]), ChannelNickName[i], int(IsUseDedicateHost[i]) > 0, ChannelOption, chCurUser[i], chMaxUser[i]);
        i++;
        // [Loop Continue]
        goto J0x5BF;
    }
    TabControl.SetVisiblePanel(SaveServerListIndex);
    // End:0x846
    if(bButtonRefresh == false)
    {
        bButtonRefresh = true;
        TPTopMenu.ButtonRefresh.EnableMe();
    }
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] End");
    Log("[BTPageServerSelection::rfAckServerListFromLoginServer] KeepMoving");
    page_Main.KeepMoving();
    ChannelList.__OnEnterChannel__Delegate = NewMoveToChannel;
    ServerList.__OnSelectSvr__Delegate = ShowChannelList;
    //return;    
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageServerSelection::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x130
    if(ErrCode == 0)
    {
        // End:0xEB
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0xAB
            if(page_Main.TcpLogin == none)
            {
                Log("page_Main.TcpLogin is none");
            }
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);            
        }
        else
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    //return;    
}

function TcpChannel_OnConnect(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x232
    if(ErrCode == 0)
    {
        page_Main.bConnectedChannelServer = true;
        Log(((((((((((((((((("page_Main.TcpChannel.sfReqLogin2(" $ page_Main.rMM.kUserName) $ ", ") $ string(page_Main.LoginTimeStamp)) $ ", ") $ string(page_Main.LoginHash1)) $ ", ") $ string(page_Main.LoginHash2)) $ ", ") $ string(page_Main.LoginHash3)) $ ", ") $ string(page_Main.LoginHash4)) $ ", ") $ string(page_Main.LoginHash5)) $ ", ") $ page_Main.AuthLogin_GUID) $ ", ") $ string(page_Main.AuthLogin_ChannelingType)) $ ")");
        page_Main.TcpChannel.sfReqSetClientVersion(page_Main.rMM.GetClientVersion());
        page_Main.TcpChannel.sfReqLogin2(page_Main.rMM.kUserName, page_Main.LoginTimeStamp, page_Main.LoginHash1, page_Main.LoginHash2, page_Main.LoginHash3, page_Main.LoginHash4, page_Main.LoginHash5, page_Main.AuthLogin_GUID, page_Main.AuthLogin_ChannelingType);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 9, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(9, string(ErrCode)));
    }
    //return;    
}

function TcpChannel_OnClose(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnClose] ErrCode=" $ string(ErrCode));
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 10, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    // End:0xDD
    if(ErrCode != 0)
    {
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(10, string(ErrCode)));
    }
    page_Main.bConnectedChannelServer = false;
    //return;    
}

function TcpChannel_OnError(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnError] ErrCode=" $ string(ErrCode));
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 11, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(11, string(ErrCode)));
    page_Main.bConnectedChannelServer = false;
    //return;    
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageServerSelection::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Index;
    local SystemMsgParam MsgInfo;

    Log("[BTPageServerSelection::rfAckEnterChannel] Result=" $ string(Result));
    // End:0x66A
    if(Result == 0)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        page_Main.ResetChatLog();
        // End:0x10E
        if(true == MM.IsPlayingPCBang())
        {
            // End:0x10E
            if(MM.kIsPaidPCBang >= 0)
            {
                // End:0xEB
                if(MM.kIsPaidPCBang == 1)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(178), 5, true);                    
                }
                else
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(177), 5, true);
                }
            }
        }
        Controller.PopPage();
        MsgInfo.MsgCode = 5;
        MsgInfo.CharName = UserID;
        MsgInfo.ServerID = page_Main.rMM.kServerID;
        MsgInfo.ChannelNum = page_Main.rMM.kChannelID;
        page_Main.TcpChannel.sfReqSendSystemMsg(1, UserID, "", MsgInfo);
        Log(("page_Main.TcpChannel.sfReqSendSystemMsg(1, " $ UserID) $ ", , msginfo) MsgCode=5");
        page_Main.bWarningDurabilityAndExpired = true;
        Log("page_Main.TcpChannel.sfReqLimitedListInChannel()");
        page_Main.TcpChannel.sfReqLimitedListInChannel();
        MM.kUserName = UserID;
        MM.kLevel = Level;
        MM.kUID = UID;
        MM.kLevelMarkID = LevelMarkID;
        MM.kTitleMarkID = TitleMarkID;
        MM.kReserved1 = Reserved1;
        MM.kClanName = ClanName;
        MM.kInClanGrade = ClanGrade;
        MM.kClanPattern = ClanMarkPattern;
        MM.kClanBG = ClanMarkBG;
        MM.kClanBL = ClanMarkBL;
        MM.kClanLevel = ClanLevel;
        GameMgr.cmm.AddClanMark(MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, true, int(IsLookFor) > 0);
        GameMgr.cmm.SetClanLevel(MM.kClanName, MM.kClanLevel);
        GameMgr.SP.kClanPattern_Img = GameMgr.GetClanMark32(ClanMarkPattern);
        GameMgr.SP.kClanBG_Img = GameMgr.GetClanMark32(ClanMarkBG);
        GameMgr.SP.kClanBL_Img = GameMgr.GetClanMark32(ClanMarkBL);
        MM.kClanWin = ClanWin;
        MM.kClanLose = ClanLose;
        MM.UpdateCharInfo(MM);
        Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
        MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsDedicatedServer, page_Main.SCIList[Index].ChannelOption[17] > float(0));
        MM.UpdatePositionInfo(MM);
        MM.kConnectAlpha = byte(int(Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST ConnectAlpha")));
        page_Main.AuthLogin_ConnectAlpha = MM.kConnectAlpha;
        page_Main.bAuthKeySuccess = true;
        page_Main.SetPage(7, false);        
    }
    else
    {
        // End:0x6D2
        if(Result == 16)
        {
            page_Main.bAuthKeySuccess = true;
            page_Main.EndAutoMove();
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;            
        }
        else
        {
            __NFUN_270__("FAILED: Enter Channel: " $ string(Result));
            page_Main.bAuthKeySuccess = true;
            page_Main.EndAutoMove();
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
        }
    }
    return true;
    //return;    
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    Log("[BTPageServerSelection::rfAckLeaveChannel] Result=" $ string(Result));
    return true;
    //return;    
}

function bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    local wMyPlayerStatus MyStatus;
    local BtrTime t;
    local DelegateEventTimer det;
    local bool bFirstSet;

    Log(((((("[BTPageServerSelection::rfAckLogin2] UserID=" $ string(UserID)) $ ", Charname=") $ CharName) $ ", ") $ "Result=") $ string(Result));
    // End:0x848
    if(Result == 0)
    {
        Log("page_Main.TcpChannel.sfReqServerType()");
        page_Main.TcpChannel.sfReqServerType();
        Log("page_Main.TcpChannel.sfReqServerTime()");
        page_Main.TcpChannel.sfReqServerTime();
        Log("page_Main.TcpChannel.sfReqGetServerTime()");
        page_Main.TcpChannel.sfReqGetServerTime();
        Log("page_Main.TcpChannel.sfReqCharBlockinfo()");
        page_Main.TcpChannel.sfReqCharBlockInfo();
        Log("page_Main.TcpChannel.sfReqGetMyMailBoxState()");
        page_Main.TcpChannel.sfReqGetMyMailBoxState();
        Log(("page_Main.TcpChannel.sfReqItemList(" $ string(UserID)) $ ")");
        GameMgr.ClearInstanceItem();
        page_Main.TcpChannel.sfReqItemList(UserID);
        Log(("page_Main.TcpChannel.sfReqUserSkillList(" $ string(UserID)) $ ")");
        page_Main.TcpChannel.sfReqUserSkillList(UserID);
        Log("page_Main.TcpChannel.sfReqQSlotList_2()");
        page_Main.TcpChannel.sfReqQSlotList_2();
        Log("page_Main.TcpChannel.sfReqFriendList()");
        page_Main.TcpChannel.sfReqFriendList();
        Log("page_Main.TcpChannel.sfReqQuestList()");
        page_Main.TcpChannel.sfReqQuestList();
        page_Main.TcpChannel.sfReqSpecialQuestRank();
        page_Main.TcpChannel.sfReqDailyRewardListThisMonth();
        Log("page_Main.TcpChannel.sfReqRegisteredPCBangInfo()");
        page_Main.TcpChannel.sfReqRegisteredPCBangInfo();
        Log("page_Main.TcpChannel.sfReqWebzenCash()");
        page_Main.TcpChannel.sfReqWebzenCash();
        // End:0x459
        if(UseGP20())
        {
            Log("page_Main.TcpChannel.sfReqShopItemData(0)");
            page_Main.TcpChannel.sfReqShopItemData(0);            
        }
        else
        {
            Log("page_Main.TcpChannel.sfReqWebzenShopScriptVersion()");
            page_Main.TcpChannel.sfReqWebzenShopScriptVersion();
        }
        Log("pame_Main.TcpChannel.sfReqPcBangItemList()");
        page_Main.TcpChannel.sfReqPcBangItemList();
        Log("page_Main.TcpChannel.sfReqCommunityOptionList()");
        page_Main.TcpChannel.sfReqCommunityOptionList();
        page_Main.TcpChannel.sfReqCharBlockInfo();
        MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
        MyStatus.UserID = UserID;
        MyStatus.NickName = CharName;
        MyStatus.CurrentTime = CurServerTime;
        // End:0x604
        if((GameMgr.kServerTime.dummy_1_DO_NOT_USE == 0) && GameMgr.kServerTime.dummy_2_DO_NOT_USE == 0)
        {
            bFirstSet = true;            
        }
        else
        {
            bFirstSet = false;
        }
        page_Main.rMM.kUID = UserID;
        page_Main.rMM.kUserName = CharName;
        GameMgr.SetServerTime(CurServerTime);
        GameMgr.UpdateServerTime(GameMgr);
        page_Main.rMM.UpdateCharInfo(page_Main.rMM);
        BtrDoubleToBtrTime(CurServerTime, t);
        Log(((((((((string(t.Year) @ string(t.Month)) @ string(t.Day)) @ "/") @ string(t.Hour)) @ string(t.Minute)) @ string(t.Second)) @ string(t.Milliseconds)) @ "+") @ string(t.DayOfWeek));
        Log((string(CurServerTime.dummy_1_DO_NOT_USE) $ ", ") $ string(CurServerTime.dummy_2_DO_NOT_USE));
        // End:0x799
        if(bFirstSet)
        {
            det = new Class'Engine.DelegateEventTimer';
            det.__OnEventTimer__Delegate = page_Main.ShowPlayTimePerHour_OnEventTimer;
            GameMgr.AddEventTimerHMS(9999, 1, 0, 0, det);
        }
        Log("##GMLOG: [BTPageServerSelection] IsGM - " $ string(IsGM));
        switch(IsGM)
        {
            // End:0x7FF
            case 1:
                MM.GMLevelFlag = 1;
                MM.bAdminSpectator = true;
                // End:0x845
                break;
            // End:0x829
            case 2:
                MM.GMLevelFlag = 2;
                MM.bAdminSpectator = true;
                // End:0x845
                break;
            // End:0x842
            case 3:
                MM.GMLevelFlag = 4;
                // End:0x845
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        Controller.PopPage();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    return true;
    //return;    
}

function bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    Log(((("[BTPageServerSelection::rfAckItemListStart] Count=" $ string(Count)) $ ", ") $ "Result=") $ string(Result));
    // End:0xA9
    if(Result != 0)
    {
        Log("[BTPageServerSelection.rfAckItemListStart] Error ErrMsg=" $ ErrMsg);
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemListStart(Count);
    return true;
    //return;    
}

function bool rfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<int> PaintingItemID;

    Log("[BTPageServerSelection::rfAckItemList]");
    i = 0;
    J0x31:

    // End:0x71 [Loop If]
    if(i < PaintID.Length)
    {
        PaintingItemID[i] = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[i]);
        ++i;
        // [Loop Continue]
        goto J0x31;
    }
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemList(UniqueID, ItemID, ItemType, Durability, UntilTime, SlotPosition, AddPartsID, DamageDegree, ItemState, StackCount, PaintingItemID);
    PlayerOwner().dblog("=========================================");
    PlayerOwner().dblog("Receive ItemList From ChannelServer");
    PlayerOwner().dblog("=========================================");
    i = 0;
    J0x18D:

    // End:0x307 [Loop If]
    if(i < UniqueID.Length)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID[i]);
        instanceInfo = GameMgr.AddInstanceItemByParameter(ItemID[i], UniqueID[i], 0, SlotPosition[i], int(ItemState[i]), Durability[i], AddPartsID[i], PaintingItemID[i], StackCount[i], DamageDegree[i], UntilTime[i], false, TradeCount[i]);
        PlayerOwner().dblog((((((((("SlotPos = " $ string(instanceInfo.SlotPosition)) @ ", ItemID = ") $ string(ItemInfo.ItemID)) @ ", Dur = ") $ string(instanceInfo.Durability)) @ ", ItemName = ") $ ItemInfo.ItemName) $ "/ StackCount:") $ string(instanceInfo.OverlapCount));
        i++;
        // [Loop Continue]
        goto J0x18D;
    }
    PlayerOwner().dblog("=========================================");
    return true;
    //return;    
}

function bool rfAckItemListEnd()
{
    local array<int> Pool;
    local int i;

    Log("[BTPageServerSelection::rfAckItemListEnd]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemListEnd();
    MM.kFaceID = GameMgr.FindInstanceItemIDBySlotPos(int(19));
    MM.kHelmetID = GameMgr.FindInstanceItemIDBySlotPos(int(18));
    MM.kFaceAccessoryID = GameMgr.FindInstanceItemIDBySlotPos(int(20));
    MM.kAFSpecialID = GameMgr.FindInstanceItemIDBySlotPos(int(21));
    MM.kRSASpecialID = GameMgr.FindInstanceItemIDBySlotPos(int(22));
    MM.UpdateEquipItemInfo(MM);
    GameMgr.UpdateItemList(GameMgr);
    // End:0x25F
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
        J0x216:

        // End:0x25F [Loop If]
        if(i < Pool.Length)
        {
            GameMgr.CandidateLists[i] = GameMgr.FindUIItem(Pool[i]);
            i++;
            // [Loop Continue]
            goto J0x216;
        }
    }
    CTRP.bItemListEnd = true;
    CheckToSetPageLobby();
    Log("[BTPageServerSelection::rfAckItemListEnd] Success Update UIItem");
    return true;
    //return;    
}

function bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckUserSkillListStart] Result=" $ string(Result));
    // End:0xA3
    if(Result == 0)
    {
        GameMgr.ClearSkillBoxList();
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillListStart(Count);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    local int i;
    local wItemBoxHK ItemInfo;

    Log("[BTPageServerSelection::rfAckUserSkillList]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillList(UniqueSkillID, SkillID, UntilTime, SlotPosition);
    PlayerOwner().dblog("=========================================");
    PlayerOwner().dblog("Receive SkillList From ChannelServer");
    PlayerOwner().dblog("=========================================");
    i = 0;
    J0x129:

    // End:0x205 [Loop If]
    if(i < UniqueSkillID.Length)
    {
        ItemInfo = GameMgr.FindUIItem(SkillID[i]);
        PlayerOwner().dblog((((("SkillName = " $ ItemInfo.ItemName) @ "SlotPos = ") $ string(SlotPosition[i])) @ "ItemID = ") $ string(ItemInfo.ItemID));
        GameMgr.AddUISkillBox(SlotPosition[i], SkillID[i], UniqueSkillID[i], UntilTime[i]);
        i++;
        // [Loop Continue]
        goto J0x129;
    }
    PlayerOwner().dblog("=========================================");
    return true;
    //return;    
}

function bool rfAckUserSkillListEnd()
{
    Log("[BTPageServerSelection::rfAckUserSkillListEnd]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillListEnd();
    GameMgr.AddInstanceSkillItemFromSkillBoxList();
    CTRP.bSkillListEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4, array<BtrDouble> KnifeItemID)
{
    local int i, DispOrder;

    Log("[BTPageServerSelection::rfAckQSlotList] Result=" $ string(Result));
    // End:0x29B
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetQSlotList(QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, KnifeItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
        // End:0xFD
        if(QSlotID.Length != GameMgr.QuickSlotBoxList.Length)
        {
            GameMgr.ClearQuickSlotBoxList();
            GameMgr.AllocateQuickSlotBoxList(QSlotID.Length);
        }
        PlayerOwner().dblog("=========================================");
        PlayerOwner().dblog("QuickSlot ItemList From ChannelServer");
        PlayerOwner().dblog("=========================================");
        i = 0;
        J0x1A8:

        // End:0x285 [Loop If]
        if(i < QSlotID.Length)
        {
            DispOrder = int(QSlotDispOrder[i]) - 1;
            GameMgr.SetQuickSlotBox_Name(DispOrder, QSlotName[i]);
            GameMgr.SetQuickSlotBox_ID(DispOrder, QSlotID[i]);
            AckQuickSlot(false, DispOrder, MWItemID[i], PistolItemID[i], KnifeItemID[i], TWItemID1[i], TWItemID2[i], Skill1[i], Skill2[i], Skill3[i], Skill4[i]);
            i++;
            // [Loop Continue]
            goto J0x1A8;
        }
        CTRP.bQSListEnd = true;
        CheckToSetPageLobby();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckExpandSlotConfirm(int Result, string ErrMsg, int QSlotID, BtrDouble MWItemID, BtrDouble PistolItemID, BtrDouble TWItemID1, BtrDouble TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, BtrDouble KnifeItemID)
{
    // End:0x83
    if(Result == 0)
    {
        AckQuickSlot(true, QSlotID, MWItemID, PistolItemID, KnifeItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.ApplyQuickSlotData();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function SetQuickSlotItemData(bool removeSlot, int QSlotID, int slotNum, BtrDouble ItemUniqueID)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = GameMgr.FindInstanceItem(ItemUniqueID);
    // End:0xAE
    if(instanceInfo != none)
    {
        GameMgr.SetQuickSlotBox_Item(QSlotID, slotNum, instanceInfo.ItemID, ItemUniqueID);
        PlayerOwner().dblog(((((string(slotNum) @ "WeaponID = (") $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");        
    }
    else
    {
        // End:0x101
        if(removeSlot)
        {
            GameMgr.SetQuickSlotBox_Item(QSlotID, slotNum, 0, EmptyBtrDouble());
            PlayerOwner().dblog(string(slotNum) @ "WeaponSlot Removed");
        }
    }
    //return;    
}

function SetQuickSlotSkillData(bool removeSlot, int QSlotID, int slotNum, int SkillUniqueID)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = GameMgr.FindInstanceSkillItem(SkillUniqueID);
    // End:0xAD
    if(instanceInfo != none)
    {
        GameMgr.SetQuickSlotBox_Skill(QSlotID, slotNum, instanceInfo.ItemID, SkillUniqueID);
        PlayerOwner().dblog(((((string(slotNum) @ "SkillID = (") $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");        
    }
    else
    {
        // End:0xFF
        if(removeSlot)
        {
            GameMgr.SetQuickSlotBox_Item(QSlotID, slotNum, 0, EmptyBtrDouble());
            PlayerOwner().dblog(string(slotNum) @ "SkillSlot Removed");
        }
    }
    //return;    
}

function AckQuickSlot(bool removeSlot, int QSlotID, BtrDouble MWItemID, BtrDouble PistolItemID, BtrDouble KnifeItemID, BtrDouble TWItemID1, BtrDouble TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4)
{
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetQSlotData(byte(QSlotID), MWItemID, PistolItemID, KnifeItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
    SetQuickSlotItemData(removeSlot, QSlotID, 0, MWItemID);
    SetQuickSlotItemData(removeSlot, QSlotID, 1, PistolItemID);
    SetQuickSlotItemData(removeSlot, QSlotID, 2, TWItemID1);
    SetQuickSlotItemData(removeSlot, QSlotID, 3, TWItemID2);
    SetQuickSlotItemData(removeSlot, QSlotID, 4, KnifeItemID);
    SetQuickSlotSkillData(removeSlot, QSlotID, 0, Skill1);
    SetQuickSlotSkillData(removeSlot, QSlotID, 1, Skill2);
    SetQuickSlotSkillData(removeSlot, QSlotID, 2, Skill3);
    SetQuickSlotSkillData(removeSlot, QSlotID, 3, Skill4);
    //return;    
}

function bool rfAckQSlotList_2(int Result, string ErrMsg, array<byte> QSlotDispOrder, array<int> QSlotIDX, array<int> ItemTID, array<BtrDouble> ItemUID, array<byte> SlotPos)
{
    local int lp1, lp2, lp3, DispOrder, iCount, iIndex;

    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int iItemDispOrder, iSkillDispOrder, iItemID;
    local BtrDouble dwUniqueID;

    Log("[BTPageServerSelection::rfAckQSlotList_2] Result=" $ string(Result));
    // End:0x774
    if(Result == 0)
    {
        // End:0x87
        if(QSlotIDX.Length != GameMgr.QuickSlotBoxList.Length)
        {
            GameMgr.ClearQuickSlotBoxList();
            GameMgr.AllocateQuickSlotBoxList(QSlotIDX.Length);
        }
        iCount = ItemTID.Length / QSlotDispOrder.Length;
        PlayerOwner().dblog("=========================================");
        PlayerOwner().dblog("QuickSlot ItemList From ChannelServer");
        PlayerOwner().dblog("=========================================");
        lp1 = 0;
        J0x146:

        // End:0x56A [Loop If]
        if(lp1 < QSlotDispOrder.Length)
        {
            DispOrder = int(QSlotDispOrder[lp1]);
            GameMgr.SetQuickSlotBox_ID(DispOrder, QSlotIDX[lp1]);
            PlayerOwner().dblog("====");
            PlayerOwner().dblog("QSlotDispOrder = " $ string(QSlotDispOrder[lp1]));
            PlayerOwner().dblog("QSlotID = " $ string(QSlotIDX[lp1]));
            PlayerOwner().dblog("=========================================");
            lp2 = 0;
            J0x231:

            // End:0x3BA [Loop If]
            if(lp2 < 5)
            {
                iIndex = (lp1 * iCount) + lp2;
                instanceInfo = none;
                // End:0x297
                if(__NFUN_913__(ItemUID[iIndex], EmptyBtrDouble()))
                {
                    instanceInfo = GameMgr.FindInstanceItem(ItemUID[iIndex]);                    
                }
                else
                {
                    // End:0x2CB
                    if(ItemTID[iIndex] != 0)
                    {
                        instanceInfo = GameMgr.FindFirstInstanceItemByItemID(ItemInfo.ItemID);
                    }
                }
                // End:0x36A
                if(instanceInfo != none)
                {
                    GameMgr.SetQuickSlotBox_Item(DispOrder, lp2, instanceInfo.ItemID, ItemUID[iIndex]);
                    PlayerOwner().dblog(((((("" $ string(lp2)) $ " WeaponID = (") $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
                    // [Explicit Continue]
                    goto J0x3B0;
                }
                GameMgr.UnsetInstance_QSlotItemSlotPos(DispOrder, lp2);
                PlayerOwner().dblog(("" $ string(lp2)) $ " WeaponSlot UnSet");
                J0x3B0:

                ++lp2;
                // [Loop Continue]
                goto J0x231;
            }
            lp3 = 0;
            J0x3C1:

            // End:0x528 [Loop If]
            if(lp3 < 4)
            {
                iIndex = ((lp1 * iCount) + lp2) + lp3;
                instanceInfo = none;
                // End:0x4D3
                if(__NFUN_920__(ItemUID[iIndex], 0))
                {
                    instanceInfo = GameMgr.FindInstanceSkillItem(__NFUN_923__(ItemUID[iIndex]));
                    // End:0x4D0
                    if(instanceInfo != none)
                    {
                        GameMgr.SetQuickSlotBox_Skill(DispOrder, lp3, instanceInfo.ItemID, __NFUN_923__(ItemUID[iIndex]));
                        PlayerOwner().dblog(((((("" $ string(lp3)) $ " SkillID = (") $ string(instanceInfo.ItemID)) $ ") LeftDay = (") $ string(instanceInfo.LeftTime.Day)) $ ")");
                    }
                    // [Explicit Continue]
                    goto J0x51E;
                }
                GameMgr.UnsetInstance_SkillSlotPos(DispOrder, int(14) + lp3);
                PlayerOwner().dblog(("" $ string(lp3)) $ " SkillSlot UnSet");
                J0x51E:

                ++lp3;
                // [Loop Continue]
                goto J0x3C1;
            }
            PlayerOwner().dblog("=========================================");
            ++lp1;
            // [Loop Continue]
            goto J0x146;
        }
        PlayerOwner().dblog("=========================================");
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 0, iItemID, dwUniqueID);
        MM.kPrimaryID = iItemID;
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 1, iItemID, dwUniqueID);
        MM.kSecondaryID = iItemID;
        // End:0x620
        if(MM.kPrimaryID == 0)
        {
            SetDefaultWeapon(int(0));
        }
        // End:0x63E
        if(MM.kSecondaryID == 0)
        {
            SetDefaultWeapon(int(1));
        }
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 2, iItemID, dwUniqueID);
        MM.kThrow1ID = iItemID;
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 3, iItemID, dwUniqueID);
        MM.kThrow2ID = iItemID;
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 14, iItemID, dwUniqueID);
        MM.kSkill1ID = iItemID;
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 15, iItemID, dwUniqueID);
        MM.kSkill2ID = iItemID;
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 16, iItemID, dwUniqueID);
        MM.kSkill3ID = iItemID;
        GameMgr.FindQuickSlotBoxBySlotPosition(0, 17, iItemID, dwUniqueID);
        MM.kSkill4ID = iItemID;
        CTRP.bQSListEnd = true;
        CheckToSetPageLobby();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckUpdateQSlot_2(int Result, string ErrMsg, array<byte> DisplayOrder, array<int> ItemTID, array<BtrDouble> ItemUID, array<byte> SlotPos_Key, array<byte> SlotPos_Value)
{
    local int iStartIndex, iUpdateCount, lp1, iSlotPosition;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckUpdateQSlot_2] Result=" $ string(Result));
    // End:0x66
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.UpdateAckQuickSlot_2(DisplayOrder, ItemTID, ItemUID, SlotPos_Key, SlotPos_Value);
    return true;
    //return;    
}

function bool rfAckServerTime(int Time)
{
    Log("[BTPageServerSelection::rfAckServerTime] Time" $ string(Time));
    Controller.SetTime(Time);
    CTRP.bServerTimeEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function CheckToSetPageLobby()
{
    Log("[BTPageServerSelection::CheckToSetPageLobby]");
    // End:0x159
    if((((((CTRP.bItemListEnd && CTRP.bSkillListEnd) && CTRP.bQSListEnd) && CTRP.bServerTimeEnd) && CTRP.bHashEnd) && CTRP.bGetServerTimeEnd) && CTRP.bGetMyMailBoxState)
    {
        Log(("page_Main.TcpChannel.sfReqEnterChannel(" $ string(ConnectingChannel.ChannelID)) $ ")");
        page_Main.TcpChannel.sfReqEnterChannel(ConnectingChannel.ChannelID);
        CTRP.bItemListEnd = false;
        CTRP.bSkillListEnd = false;
        CTRP.bQSListEnd = false;
        CTRP.bServerTimeEnd = false;
        CTRP.bHashEnd = false;
        CTRP.bGetServerTimeEnd = false;
        CTRP.bGetMyMailBoxState = false;
    }
    //return;    
}

function bool rfAckHash(int Result, string Error)
{
    Log("[BTPageServerSelection::rfAckHash] Error=" $ string(Result));
    // End:0x57
    if(Result == 0)
    {
        CTRP.bHashEnd = true;
        CheckToSetPageLobby();        
    }
    else
    {
        Log("[BTPageServerSelection::rfAckHash] Success, SetPage(EPage_Lobby2)");
        // End:0x10A
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
        {
            page_Main.HaltNetwork();
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = rfAckHash_BTWindowErrorDefineHK_OnOK;
    }
    return true;
    //return;    
}

function bool rfAckHash_BTWindowErrorDefineHK_OnOK(GUIComponent Sender)
{
    // End:0x8E
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
    {
        Console(Controller.Master.Console).ConsoleCommand("exit");        
    }
    else
    {
        CTRP.bHashEnd = true;
        CheckToSetPageLobby();
    }
    CTRP.bHashEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    Log((("Received representive relay server addr: " $ RelayIP) $ " ") $ string(RelayPort));
    page_Main.rMM.szRelayIP = RelayIP;
    page_Main.rMM.nRelayPort = RelayPort;
    return true;
    //return;    
}

function bool rfAckNotifyExpiredItemIDs(array<byte> DisplayOrder, array<byte> SlotPos, array<int> ItemTID, array<BtrDouble> ItemUID)
{
    local int i;

    Log("[BTPageServerSelection::rfAckNotifyExpiredItemIDs] DisplayOrder.Length=" $ string(DisplayOrder.Length));
    iProcessExpiredStep = 0;
    iProcessExpiredStep = 1;
    page_Main.CompleteExpiredItem();
    // End:0xF7
    if(DisplayOrder.Length > 0)
    {
        i = 0;
        J0x87:

        // End:0xF7 [Loop If]
        if(i < DisplayOrder.Length)
        {
            GameMgr.RemoveInstanceItem(ItemUID[i]);
            page_Main.AddExpiredItem(false, DisplayOrder[i], SlotPos[i], ItemTID[i], ItemUID[i]);
            i++;
            // [Loop Continue]
            goto J0x87;
        }
    }
    return true;
    //return;    
}

function bool rfAckNotifyExpiredSkillIDs(array<byte> DisplayOrder, array<byte> SlotPos, array<int> ItemTID, array<BtrDouble> ItemUID)
{
    local int i;

    Log("[BTPageServerSelection::rfAckNotifyExpiredSkillIDs]");
    // End:0x53
    if(int(iProcessExpiredStep) != 1)
    {
        page_Main.CompleteExpiredItem();
    }
    iProcessExpiredStep = 2;
    i = 0;
    J0x62:

    // End:0xD5 [Loop If]
    if(i < DisplayOrder.Length)
    {
        GameMgr.RemoveInstanceItemByUniqueSkillID(__NFUN_923__(ItemUID[i]));
        page_Main.AddExpiredItem(true, DisplayOrder[i], SlotPos[i], ItemTID[i], ItemUID[i]);
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    iProcessExpiredStep = 0;
    return true;
    //return;    
}

function bool BTWindowItemExpiredHK_OnOK_CheckDurX(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    page_Main.CheckDestroyedDurabilityXItemList();
    return true;
    //return;    
}

function bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    local int ReservedItemID, PrevSlotPos;
    local BtrDouble ReservedUniqueID;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local export editinline BTWindowItemExpiredHK BTWindow;
    local int lp1;
    local array<int> temp;
    local int iResult;
    local bool bAddItem, bCheckNewBuy;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
    iResult = 0;
    bAddItem = false;
    Log("[BTPageServerSelection::rfAckBuyShopItem] ItemCount=" $ string(ItemCount));
    lp1 = 0;
    J0xA0:

    // End:0x2F6 [Loop If]
    if(lp1 < ItemCount)
    {
        // End:0xD4
        if(Result[lp1] != 0)
        {
            iResult = Result[lp1];
            // [Explicit Continue]
            goto J0x2EC;
        }
        ItemInfo = GameMgr.FindUIItem(BoughtItemTypeID[lp1]);
        bAddItem = true;
        bCheckNewBuy = (GameMgr.FindFirstInstanceItemByItemID(ItemInfo.ItemID) == none) && BTWindow == none;
        // End:0x1B2
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            instanceInfo = GameMgr.AddInstanceItemByParameter(BoughtItemTypeID[lp1], EmptyBtrDouble(), __NFUN_923__(BoughtItemUniqueID[lp1]), 13, 1, 100000, BoughtPartID[lp1], 0, BoughtStackCnt[lp1], 0, BoughtUntilTIme[lp1]);            
        }
        else
        {
            instanceInfo = GameMgr.AddInstanceItemByParameter(BoughtItemTypeID[lp1], BoughtItemUniqueID[lp1], 0, 13, 1, 100000, BoughtPartID[lp1], 0, BoughtStackCnt[lp1], 0, BoughtUntilTIme[lp1]);
        }
        // End:0x2EC
        if(GameMgr.CheckOnlyModeItem(ItemInfo.byModeItem) && bCheckNewBuy)
        {
            ReservedItemID = GameMgr.GetItemSlotByItemType(ItemInfo);
            // End:0x260
            if(ReservedItemID == -1)
            {
                // [Explicit Continue]
                goto J0x2EC;
            }
            // End:0x2B9
            if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
            {
                page_Main.EquipOnlyModeItem_QS(ItemInfo.ItemID, byte(ReservedItemID), __NFUN_921__(instanceInfo.UniqueSkillID), true);
                // [Explicit Continue]
                goto J0x2EC;
            }
            page_Main.EquipOnlyModeItem_QS(ItemInfo.ItemID, byte(ReservedItemID), instanceInfo.UniqueID, false);
        }
        J0x2EC:

        ++lp1;
        // [Loop Continue]
        goto J0xA0;
    }
    // End:0x346
    if(bAddItem == true)
    {
        GameMgr.UpdateItemList(GameMgr);
        MM.kPoint = PointRemain;
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x403
    if(iResult != 0)
    {
        BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
        // End:0x3BE
        if(BTWindow != none)
        {
            BTWindow.RemoveAllExpiredItem();
            page_Main.TcpChannel.sfReqItemList(MM.kUID);
            Controller.CloseMenu(false);            
        }
        else
        {
            // End:0x3E8
            if(BTWindowHK(Controller.TopPage()) != none)
            {
                Controller.CloseMenu(false);
            }
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, iResult);
        return true;
    }
    // End:0x5A2
    if(BTWindow != none)
    {
        ReservedItemID = BTWindow.PopExpiredItemID();
        PrevSlotPos = BTWindow.PopExpiredSlotPos();
        ReservedUniqueID = BTWindow.PopExpiredUniqueID();
        Log("[BTPageServerSelection::rfAckBuyShopItem] SlotPos=" $ string(PrevSlotPos));
        ExpiredItemToRenew(BTWindow.ExpiredItems, ItemInfo, int(byte(PrevSlotPos)), ReservedUniqueID, BoughtItemUniqueID[0]);
        // End:0x58B
        if(ReservedItemID == -1)
        {
            PlayerOwner().FmodClientPlaySound(Controller.ItemBuySound,,, 6);
            Controller.CloseMenu(false);
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 127);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemExpiredHK_OnOK_CheckDurX;
            page_Main.TcpChannel.sfReqWebzenCash();
            GameMgr.UpdateItemList(GameMgr);
            page_Main.UpdateExpiredItemList(page_Main);
            page_Main.UpdateReqQuickSlot();            
        }
        else
        {
            BTWindow.PopAndBuy(ReservedItemID);
        }        
    }
    else
    {
        page_Main.UpdateReqQuickSlot();
        // End:0x633
        if(BTWindowHK(Controller.TopPage()) != none)
        {
            BTWindowHK(Controller.TopPage()).StopTimeOut();
            BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBuyShopItem_OnOK;
            BTWindowHK(Controller.TopPage()).ButtonOK.EnableMe();
        }
    }
    return true;
    //return;    
}

function ExpiredItemToRenew(array<BTExpiredItem> ExpiredItems, wItemBoxHK ItemInfo, int iSlotPosition, BtrDouble OldUniqueID, BtrDouble NewUniqueID)
{
    local bool bIsSkill;
    local int lp1, SkillUniqueID;
    local array<int> QuickSlotIdx;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0xB3
    if(GameMgr.CheckOnlyModeItem(ItemInfo.byModeItem))
    {
        // End:0xB0
        if(iSlotPosition != int(13))
        {
            bIsSkill = GameMgr.CheckSkillItem(ItemInfo.ItemType);
            page_Main.EquipOnlyModeItem_QS(ItemInfo.ItemID, byte(iSlotPosition), NewUniqueID, bIsSkill);
        }        
    }
    else
    {
        // End:0x25E
        if(GameMgr.CheckQuickSlotItem(ItemInfo.ItemType))
        {
            bIsSkill = GameMgr.CheckSkillItem(ItemInfo.ItemType);
            // End:0x1B7
            if(bIsSkill == true)
            {
                SkillUniqueID = __NFUN_923__(OldUniqueID);
                lp1 = 0;
                J0x118:

                // End:0x19D [Loop If]
                if(lp1 < ExpiredItems.Length)
                {
                    // End:0x193
                    if(ExpiredItems[lp1].SkillUID == SkillUniqueID)
                    {
                        page_Main.EquipQuickSlot(int(ExpiredItems[lp1].DisplayOrder), ExpiredItems[lp1].SlotPos, ItemInfo.ItemID, NewUniqueID, true);
                    }
                    ++lp1;
                    // [Loop Continue]
                    goto J0x118;
                }
                GameMgr.RemoveQuickSlotBoxSkillItem(__NFUN_923__(OldUniqueID));                
            }
            else
            {
                lp1 = 0;
                J0x1BE:

                // End:0x25B [Loop If]
                if(lp1 < ExpiredItems.Length)
                {
                    // End:0x251
                    if(__NFUN_912__(ExpiredItems[lp1].ItemUID, OldUniqueID))
                    {
                        page_Main.EquipQuickSlot(int(ExpiredItems[lp1].DisplayOrder), ExpiredItems[lp1].SlotPos, ItemInfo.ItemID, NewUniqueID, false);
                        GameMgr.RemoveQuickSlotBoxItem(OldUniqueID);
                        // [Explicit Break]
                        goto J0x25B;
                    }
                    ++lp1;
                    // [Loop Continue]
                    goto J0x1BE;
                }
            }
            J0x25B:
            
        }
        else
        {
            // End:0x2B5
            if(iSlotPosition != int(13))
            {
                // End:0x2B5
                if(GameMgr.CheckEquipSlotItem(ItemInfo.ItemType))
                {
                    page_Main.EquipItemSlot(ItemInfo.ItemID, byte(iSlotPosition), NewUniqueID);
                }
            }
        }
    }
    //return;    
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckUpdateQSlot]");
    return true;
    //return;    
}

function bool BTWindowBuyShopItem_OnOK(GUIComponent Sender)
{
    local wItemBoxInstanceHK tempInstanceInfo;

    PlayerOwner().FmodClientPlaySound(Controller.ItemBuySound,,, 6);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x97
    if(GameMgr.CheckSkillItem(MM.lastBuyItemType))
    {
        page_Main.TcpChannel.sfReqUserSkillList(MM.kUID);        
    }
    else
    {
        page_Main.TcpChannel.sfReqItemList(MM.kUID);
    }
    // End:0xEA
    if(MM.lastBuyItemGrade == 14)
    {
        page_Main.TcpChannel.sfReqWebzenCash();
    }
    Controller.CloseMenu(false);
    // End:0x1AF
    if(GameMgr.CheckCapsuleItem(MM.lastBuyItemType))
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowCapsuleOpen");
        BTWindowCapsuleOpen(Controller.TopPage()).FillCapsule(true);
        BTWindowCapsuleOpen(Controller.TopPage()).Initialize(MM.lastBuyItemID, EmptyBtrDouble(), TcpChannel, GameMgr);        
    }
    else
    {
        // End:0x2BB
        if(GameMgr.CheckBlackbox_Key(MM.lastBuyItemType))
        {
            tempInstanceInfo = GameMgr.FindFirstInstanceItemByItemType(int(GameMgr.38));
            // End:0x2BB
            if(tempInstanceInfo != none)
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowCapsuleOpen");
                BTWindowCapsuleOpen(Controller.TopPage()).FillCapsule(false);
                BTWindowCapsuleOpen(Controller.TopPage()).Initialize(page_Main.page_Lucky.tpBlackBox.LastOpenBlackBoxID, page_Main.page_Lucky.tpBlackBox.GetBlackBoxKeyUniqueID(), TcpChannel, GameMgr);
            }
        }
    }
    return true;
    //return;    
}

function bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfReqNotifyDurabilityZeroItem] Result=" $ string(Result));
    // End:0x71
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x257
    if(page_Main.DurWarningItems.items.Length == 0)
    {
        page_Main.CompleteDurabilityWarningItem();
        PlayerOwner().dblog("[ItemDurabilityWarn]");
        i = 0;
        J0xF3:

        // End:0x23C [Loop If]
        if(i < ItemUniqueIDs.Length)
        {
            PlayerOwner().dblog("ItemID = " $ string(ItemIDs[i]));
            instanceInfo = GameMgr.FindInstanceItem(ItemUniqueIDs[i]);
            // End:0x1DC
            if(instanceInfo != none)
            {
                // End:0x18E
                if(int(ItemSlotPos[i]) == int(13))
                {
                    // End:0x18E
                    if(GameMgr.IsQuickSlotBoxItem(ItemUniqueIDs[i]) == false)
                    {
                        // [Explicit Continue]
                        goto J0x232;
                    }
                }
                page_Main.AddDurabilityWarningItem(ItemUniqueIDs[i], ItemIDs[i], int(ItemSlotPos[i]), ItemPartIDs[i], instanceInfo.Durability);
                // [Explicit Continue]
                goto J0x232;
            }
            Log("InstanceInfo != none");
            page_Main.AddDurabilityWarningItem(ItemUniqueIDs[i], ItemIDs[i], int(ItemSlotPos[i]), ItemPartIDs[i], 0);
            J0x232:

            i++;
            // [Loop Continue]
            goto J0xF3;
        }
        page_Main.UpdateDurabilityWarningItemList(page_Main);        
    }
    else
    {
        page_Main.CompleteDurabilityWarningItem();
    }
    return true;
    //return;    
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    local int i;
    local Object.EPage Dest;
    local export editinline BTWindowItemDurabilityWarningHK BTWindow;
    local int nRepairCost;

    Log((("[BTPageServerSelection::rfAckRepairCost] Result=" $ string(Result)) $ " UniqueItemID.Length=") $ string(UniqueItemID.Length));
    // End:0x86
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x303
    if(page_Main.DurWarningItems.bDurWarningItem && page_Main.DurWarningItems.bReqRepairCost)
    {
        page_Main.DurWarningItems.bReqRepairCost = false;
        BTWindow = BTWindowItemDurabilityWarningHK(Controller.TopPage());
        // End:0x1BF
        if(BTWindow == none)
        {
            // End:0x130
            if((int(page_Main.eCurrPage) == int(7)) || int(page_Main.eCurrPage) == int(5))
            {
                Dest = 7;                
            }
            else
            {
                Dest = 10;
            }
            page_Main.pwm.CreateAndPush(Dest, "GUIWarfare.BTWindowItemDurabilityWarningHK", true, 0);
            BTWindow = BTWindowItemDurabilityWarningHK(page_Main.pwm.Last(Dest));
            BTWindow.MainMenu = page_Main;
        }
        i = 0;
        J0x1C6:

        // End:0x21C [Loop If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1F3
            if(RepairCost.Length > 0)
            {
                nRepairCost = RepairCost[i];
            }
            page_Main.AddDurabilityWarningItemRepairCost(UniqueItemID[i], nRepairCost);
            i++;
            // [Loop Continue]
            goto J0x1C6;
        }
        i = 0;
        J0x223:

        // End:0x2F4 [Loop If]
        if(i < page_Main.DurWarningItems.items.Length)
        {
            // End:0x25E
            if(RepairCost.Length > 0)
            {
                nRepairCost = RepairCost[i];
            }
            BTWindow.AddItem(page_Main.DurWarningItems.items[i].UniqueID, page_Main.DurWarningItems.items[i].ItemID, page_Main.DurWarningItems.items[i].PartID, page_Main.DurWarningItems.items[i].Durability, nRepairCost);
            i++;
            // [Loop Continue]
            goto J0x223;
        }
        page_Main.CompleteDurabilityWarningItem();
    }
    return true;
    //return;    
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    local int i;

    Log((("[BTPageServerSelection::rfAckRepairItem] Result=" $ string(Result)) $ " UniqueItemID.Length=") $ string(UniqueItemID.Length));
    // End:0x86
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = RepairCost;
    MM.UpdateMoneyInfo(MM);
    i = 0;
    J0xB9:

    // End:0x117 [Loop If]
    if(i < UniqueItemID.Length)
    {
        GameMgr.ChangeInstance_ItemDurability(UniqueItemID[i], 100000);
        GameMgr.ChangeInstance_ItemDamageDegree(UniqueItemID[i], DamageDegree[i]);
        i++;
        // [Loop Continue]
        goto J0xB9;
    }
    GameMgr.UpdateItemList(GameMgr);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 20);
    return true;
    //return;    
}

function bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    local int i;
    local BTConsole BTConsole;

    Log("[BTPageServerSelection::rfReqRecvNotice_FromGM] Result=" $ string(Result));
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
    // End:0x8C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x93:

    // End:0xC7 [Loop If]
    if(i < NoticeMsg.Length)
    {
        page_Main.PushNoticeQueue(NoticeMsg[i]);
        i++;
        // [Loop Continue]
        goto J0x93;
    }
    return true;
    //return;    
}

function bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfReqRecvForceDisconnected_FromGM]");
    page_Main.HaltNetwork();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 93);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    return true;
    //return;    
}

function bool BackToServerSelection_OnClick(GUIComponent Sender)
{
    Log("[BTPageServerSelection::BackToServerSelection_OnClick]");
    Controller.PopPage();
    page_Main.TcpChannel.sfReqLogOut(3);
    return true;
    //return;    
}

function bool rfAckExceedMaxUser()
{
    Log("[BTPageServerSelection::rfAckExceedMaxUser]");
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
    return true;
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log((((((((((((((((((("[BTPageServerSelection::rfAckLoginInHouseTest] " $ string(Sucess)) $ " ") $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg);
    // End:0x275
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
        // End:0x1C6
        if(int(NeedChar) == 0)
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name : NULL");
            Controller.PopPage();
            page_Main.SetPage(4, true);            
        }
        else
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
            MM.kUserName = CharName;
            Controller.PopPage();
            RefreshPage();
        }
        return true;        
    }
    else
    {
        // End:0x3FD
        if(int(Sucess) == 50)
        {
            MM.kUserName = CharName;
            page_Main.rMM.My_szName = CharName;
            Log("Retry Login!!");
            // End:0x374
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                Log(("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.AuthLogin_AccountID) $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);                
            }
            else
            {
                Log(("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.szAccountName) $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
            }
            return true;            
        }
        else
        {
            // End:0x446
            if(int(Sucess) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                
            }
            else
            {
                // End:0x490
                if(int(Sucess) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                    
                }
                else
                {
                    // End:0x4DA
                    if(int(Sucess) == 3)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                        
                    }
                    else
                    {
                        // End:0x524
                        if(int(Sucess) == 15)
                        {
                            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                            
                        }
                        else
                        {
                            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, int(Sucess));
                            BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    local BtrTime t;
    local int Day;

    Day = __NFUN_923__(ServerTime);
    Log("[BTPageServerSelection::rfAckGetServerTime] Day=" $ string(Day));
    BtrDoubleToBtrTime(ServerTime, t);
    PlayerOwner().dblog("t(double) = " $ __NFUN_918__(ServerTime));
    PlayerOwner().dblog((((((((((string(t.Year) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
    // End:0x1EA
    if(page_Main.AuthLogin_ClientIP == "")
    {
        page_Main.AuthLogin_ClientIP = ClientIP;
        // End:0x18D
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
        __NFUN_270__("# ClientIP = " $ ClientIP);
    }
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.CurrentTime = ServerTime;
    GameMgr.SetServerTime(ServerTime);
    PlayerOwner().dblog("gameMgr.kDiffTime = " $ __NFUN_918__(GameMgr.kDiffTime));
    GameMgr.ChangeInstance_ItemLeftTime(GameMgr.kClientTime);
    GameMgr.UpdateServerTime(GameMgr);
    CTRP.bGetServerTimeEnd = true;
    CheckToSetPageLobby();
    return true;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    SaveCanvas = C;
    super.Internal_OnPreDraw(C);
    // End:0xBF
    if((page_Main.page_curr == page_Main.page_ServerSelection) && page_Main.bConnectedLoginServer)
    {
        CurrentTime = PlayerOwner().Level.TimeSeconds;
        // End:0xBF
        if((CurrentTime - LastRefreshTime) > RefreshCycleTime)
        {
            Log("[BTPageServerSelection::Internal_OnPreDraw] RefreshPage()");
            RefreshPage();
        }
    }
    // End:0xCE
    if(bDefaultServnChannel)
    {
        DefaultSvrnChSelect();
    }
    return false;
    //return;    
}

function bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID, byte FromContent)
{
    local int i;
    local export editinline BTWindowItemBoxHK BTWindow;

    Log((((((("[BTPageServerSelection::rfAckItemListInItemBox] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " ItemID.Length=") $ string(ItemID.Length)) $ " PartID.Length=") $ string(PartID.Length));
    // End:0xB7
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x110
    if((int(FromContent) == 1) || int(FromContent) == 2)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowCapsuleReward");        
    }
    else
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemBoxHK");
    }
    BTWindow = BTWindowItemBoxHK(Controller.TopPage());
    BTWindow.BoxItemID = BoxItemID;
    BTWindow.BoxUniqueID = ItemUniqueID;
    BTWindow.SetFromContent(int(FromContent));
    i = 0;
    J0x1A4:

    // End:0x1E3 [Loop If]
    if(i < ItemID.Length)
    {
        BTWindow.AddItem(ItemID[i], PartID[i]);
        i++;
        // [Loop Continue]
        goto J0x1A4;
    }
    // End:0x207
    if(int(FromContent) == 0)
    {
        BTWindow.__OnOK__Delegate = BTWindowItemBoxHK_OnOK;        
    }
    else
    {
        // End:0x253
        if((int(FromContent) == 1) || int(FromContent) == 2)
        {
            BTWindow.__OnOK__Delegate = page_Main.page_Lucky.tpCapsuleInventory.BTWindowItemBoxHK_OnOK;
        }
    }
    return true;
    //return;    
}

function bool BTWindowItemBoxHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBoxHK BTWindow;

    Log("[BTPageServerSelection::BTWindowItemBoxHK_OnOK]");
    BTWindow = BTWindowItemBoxHK(Controller.TopPage());
    page_Main.TcpChannel.sfReqGetItemFromItemBox(BTWindow.BoxUniqueID, BTWindow.BoxItemID, BTWindow.GetLastSelectItemID(), BTWindow.GetLastSelectPartID());
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckCharInfoFromLoginServer(int Result, string CharName, int Level, int Exp, string ClanName)
{
    local wMyPlayerStatus MyStatus;

    Log((("[BTPageServerSelection::rfAckCharInfoFromLoginServer] Result=" $ string(Result)) $ " CharName=") $ CharName);
    // End:0x85
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xA8
    if(page_Main.rMM.kUserName != CharName)
    {
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    page_Main.rMM.My_szName = CharName;
    MyStatus.NickName = CharName;
    MyStatus.Level = Level;
    MyStatus.nExp = Exp;
    MyStatus.ClanName = ClanName;
    page_Main.MyCharInfo.Level = Level;
    page_Main.MyCharInfo.Exp = Exp;
    page_Main.MyClanName = ClanName;
    page_Main.rMM.kLevel = Level;
    page_Main.rMM.kExp = Exp;
    page_Main.rMM.kStartExp = GameMgr.GetStartExp(Level);
    page_Main.rMM.kEndExp = GameMgr.GetEndExp(Level);
    page_Main.rMM.UpdateCharInfo(page_Main.rMM);
    return true;
    //return;    
}

function bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    Log("[BTPageServerSelection::rfAckInviteGameRoom]");
    // End:0x57
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);        
    }
    else
    {
        switch(Answer)
        {
            // End:0x8E
            case 0:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(129, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xBE
            case 1:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(130, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xEE
            case 2:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(131, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0x11E
            case 3:
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(132, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    return true;
    //return;    
}

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    local int sciindex;
    local GameModeInfo gmi;
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserServerName=" $ InviteUserServerName);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x12C
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        PlayerOwner().dblog((("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserChannelNumber=" $ string(InviteUserChannelNumber)) $ ", RoomNumber=") $ string(RoomNumber));
    }
    // End:0x189
    if(MM.IsBlockUser(InviteCharName))
    {
        page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 1, BTWindow.InviterName);
        return true;
    }
    // End:0x3CD
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        sciindex = page_Main.FindServerConnectionInfoIndex(InviteUserServerID, InviteUserChannelNumber);
        // End:0x1E8
        if(sciindex == -1)
        {
            Log("Failed! sciindex == -1");
            return true;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteGameHK");
        BTWindow = BTWindowInviteGameHK(Controller.TopPage());
        BTWindow.SetData((InviteUserServerName $ "/") $ page_Main.SCIList[sciindex].ChannelName, InviteCharName);
        BTWindow.RoomInfo.SetMapName(MapName);
        gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(GameMode));
        BTWindow.RoomInfo.SetRoomInfo((("[" $ string(RoomNumber)) $ "] ") $ RoomName, int(RoomState), OwnerName, gmi.UserFriendlyName, "", "", "");
        BTWindow.ServerID = InviteUserServerID;
        BTWindow.ChannelID = InviteUserChannelNumber;
        BTWindow.RoomUniqueID = RoomUniqueID;
        BTWindow.RoomNumber = RoomNumber;
        BTWindow.InviterName = InviteCharName;
        BTWindow.Password = Password;
        BTWindow.TcpChannel = page_Main.TcpChannel;
        BTWindow.ElipsedTime = 0.0000000;
        BTWindow.__OnOK__Delegate = BTWindowInviteGameHK_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowInviteGameHK_OnCancel;        
    }
    else
    {
        page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 3, BTWindow.InviterName);
    }
    return true;
    //return;    
}

function bool BTWindowInviteGameHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteGameHK_OnOK]");
    BTWindow = BTWindowInviteGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 0, BTWindow.InviterName);
    Controller.CloseMenu(false);
    page_Main.StartAutoMove(BTWindow.ServerID, BTWindow.ChannelID, BTWindow.RoomNumber, BTWindow.Password);
    return true;
    //return;    
}

function bool BTWindowInviteGameHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteGameHK_OnCancel]");
    BTWindow = BTWindowInviteGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 1, BTWindow.InviterName);
    BTWindow.FadeOut(false, true);
    return true;
    //return;    
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    return true;
    //return;    
}

function bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckClanMatch_InviteCrew] Result=" $ string(Result));
    // End:0x6D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
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
        BTWindow.RoomInfo.SetRoomInfo((("[" $ string(WaittingID)) $ "] ") $ RoomName, 0, LeaderName, strCW_GameMode, "", "", "");
        BTWindow.ServerID = page_Main.SCIList[SCIndex].ServerID;
        BTWindow.ChannelID = InviteUserChannelNum;
        BTWindow.RoomUniqueID = "";
        BTWindow.RoomNumber = WaittingID;
        BTWindow.InviterName = Inviter;
        BTWindow.Password = "";
        BTWindow.TcpChannel = page_Main.TcpChannel;
        BTWindow.ElipsedTime = 0.0000000;
        BTWindow.__OnOK__Delegate = BTWindowInviteClanWarGameHK_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowInviteClanWarGameHK_OnCancel;
    }
    return true;
    //return;    
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
    //return;    
}

function bool BTWindowInviteClanWarGameHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowInviteClanWarGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteClanWarGameHK_OnCancel]");
    BTWindow = BTWindowInviteClanWarGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckClanMatch_RecvInviteCrew(1, BTWindow.InviterName);
    BTWindow.FadeOut(false, true);
    return true;
    //return;    
}

function bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    Log((("[BTPageLobby::rfReqClanMatch_InviteCrewResult] Invitee=" $ Invitee) $ " Result=") $ string(Result));
    return true;
    //return;    
}

function bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    local int i;

    Log("[BTPageServerSelection::rfAckLimitedListInChannel]");
    // End:0x5C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.ChannelRestrictionMaps.Length = LimitedMapID.Length;
    i = 0;
    J0xA9:

    // End:0xE3 [Loop If]
    if(i < LimitedMapID.Length)
    {
        MM.ChannelRestrictionMaps[i] = LimitedMapID[i];
        i++;
        // [Loop Continue]
        goto J0xA9;
    }
    MM.ChannelRestrictionModes.Length = LimitedModeID.Length;
    i = 0;
    J0x100:

    // End:0x13A [Loop If]
    if(i < LimitedModeID.Length)
    {
        MM.ChannelRestrictionModes[i] = LimitedModeID[i];
        i++;
        // [Loop Continue]
        goto J0x100;
    }
    return true;
    //return;    
}

function bool rfAckQuestListStart(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckQuestListStart]");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.bNewDailyQuestAvailable = false;
    MM.QuestList.Length = 0;
    MM.bSortQuestList = false;
    return true;
    //return;    
}

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest, array<byte> IsComplete)
{
    local int i;

    Log("[BTPageServerSelection::rfAckQuestList] QuestID.Length=" $ string(QuestID.Length));
    i = 0;
    J0x4C:

    // End:0x11E [Loop If]
    if(i < QuestID.Length)
    {
        MM.QuestList.Length = MM.QuestList.Length + 1;
        MM.QuestList[MM.QuestList.Length - 1].QuestID = QuestID[i];
        MM.QuestList[MM.QuestList.Length - 1].CurrentProgress = CountPrograss[i];
        MM.QuestList[MM.QuestList.Length - 1].IsComplete = IsComplete[i];
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    return true;
    //return;    
}

function bool rfAckQuestListEnd()
{
    Log("[BTPageServerSelection::rfAckQuestListEnd]");
    MM.GenerateMissionList(Controller.ViewportOwner.Actor.Level.GameMgr);
    MM.UpdateQuestList(MM);
    AutoMoveAtFirstLogin();
    return true;
    //return;    
}

function bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckQuestUpdate]");
    page_Main.rMM.bRecvProtocolUpdateQuest = true;
    // End:0xB3
    if(Result != 0)
    {
        // End:0x7E
        if(Result == 513)
        {
            page_Main.rMM.bNoUpdateQuestInfo = true;            
        }
        else
        {
            page_Main.rMM.bNoUpdateQuestInfo = false;
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
        return true;
    }
    Log("[BTPageServerSelection::rfAckQuestUpdate] page_Main.TcpChannel.sfReqQuestList()");
    page_Main.rMM.bNoUpdateQuestInfo = false;
    page_Main.TcpChannel.sfReqQuestList();
    return true;
    //return;    
}

function bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    local int i, RewardPoint, RewardItemID;
    local wQuestParam q;

    Log((((("[BTPageServerSelection::rfReqQuestNewAvailable] AchivedQuestID.Length=" $ string(AchivedQuestID.Length)) $ " NewQuestID=") $ string(NewQuestID.Length)) $ ", ExpiredQuest.Length=") $ string(ExpiredQuest.Length));
    PlayerOwner().dblog((((("[BTPageServerSelection::rfReqQuestNewAvailable] AchivedQuestID.Length=" $ string(AchivedQuestID.Length)) $ " NewQuestID=") $ string(NewQuestID.Length)) $ ", ExpiredQuest.Length=") $ string(ExpiredQuest.Length));
    PlayerOwner().dblog("== AchivedQuestList ======");
    MM.CompletedQuestList.Length = AchivedQuestID.Length;
    i = 0;
    J0x175:

    // End:0x1F9 [Loop If]
    if(i < AchivedQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(AchivedQuestID[i]);
        PlayerOwner().dblog(string(AchivedQuestID[i]) @ q.QuestMissionDesc);
        MM.CompletedQuestList[i] = AchivedQuestID[i];
        i++;
        // [Loop Continue]
        goto J0x175;
    }
    PlayerOwner().dblog("== NewQuestID ============");
    MM.NewQuestList.Length = NewQuestID.Length;
    i = 0;
    J0x23F:

    // End:0x2C3 [Loop If]
    if(i < NewQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(NewQuestID[i]);
        PlayerOwner().dblog(string(NewQuestID[i]) @ q.QuestMissionDesc);
        MM.NewQuestList[i] = NewQuestID[i];
        i++;
        // [Loop Continue]
        goto J0x23F;
    }
    PlayerOwner().dblog("== ExpiredQuestID ========");
    i = 0;
    J0x2F3:

    // End:0x357 [Loop If]
    if(i < ExpiredQuest.Length)
    {
        q = GameMgr.GetQuestInfo(ExpiredQuest[i]);
        PlayerOwner().dblog(string(ExpiredQuest[i]) @ q.QuestMissionDesc);
        i++;
        // [Loop Continue]
        goto J0x2F3;
    }
    PlayerOwner().dblog("==========================");
    // End:0x3A9
    if(MM.CompletedQuestList.Length > 0)
    {
        page_Main.bNewAvailableQuest = true;        
    }
    else
    {
        page_Main.bNewAvailableQuest = false;
    }
    i = 0;
    J0x3C1:

    // End:0x43E [Loop If]
    if(i < AchivedQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(AchivedQuestID[i]);
        RewardPoint += q.RewardPoint;
        RewardItemID += q.RewardItemID[0];
        RewardItemID += q.RewardItemID[1];
        i++;
        // [Loop Continue]
        goto J0x3C1;
    }
    // End:0x476
    if(RewardPoint > 0)
    {
        MM.kPoint += RewardPoint;
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x4A3
    if(RewardItemID > 0)
    {
        MM.kNeedUpdateItemList = true;
        MM.kNeedUpdateSkillList = true;
    }
    Log("[BTPageServerSelection::rfAckQuestUpdate] page_Main.TcpChannel.sfReqQuestList()");
    page_Main.rMM.bNoUpdateQuestInfo = false;
    page_Main.TcpChannel.sfReqQuestList();
    return true;
    //return;    
}

function bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    local int i;
    local wQuestParam q;

    Log((("[BTPageServerSelection::rfReqDailyQuestNewAvailable] ExpiredQuestID.Length=" $ string(ExpiredQuestID.Length)) $ " NewQuestID.Length=") $ string(NewQuestID.Length));
    PlayerOwner().dblog((("[BTPageServerSelection::rfReqDailyQuestNewAvailable] ExpiredQuestID.Length=" $ string(ExpiredQuestID.Length)) $ " NewQuestID.Length=") $ string(NewQuestID.Length));
    MM.bNewDailyQuestAvailable = true;
    PlayerOwner().dblog("== NewQuestID ============");
    i = 0;
    J0x140:

    // End:0x1A4 [Loop If]
    if(i < NewQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(NewQuestID[i]);
        PlayerOwner().dblog(string(NewQuestID[i]) @ q.QuestMissionDesc);
        i++;
        // [Loop Continue]
        goto J0x140;
    }
    PlayerOwner().dblog("== ExpiredQuestID ========");
    i = 0;
    J0x1D4:

    // End:0x238 [Loop If]
    if(i < ExpiredQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(ExpiredQuestID[i]);
        PlayerOwner().dblog(string(ExpiredQuestID[i]) @ q.QuestMissionDesc);
        i++;
        // [Loop Continue]
        goto J0x1D4;
    }
    PlayerOwner().dblog("==========================");
    // End:0x276
    if(page_Main.IsGameReadyOrPlaying())
    {        
    }
    else
    {
        MM.RemoveQuestArray(ExpiredQuestID);
        MM.AddQuestArray(NewQuestID);
    }
    return true;
    //return;    
}

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    Log("[BTPageServerSelection::rfAckWebzenCash]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kCash = Class'Engine.BTCustomDrawHK'.static.__NFUN_923__(PCoinCash);
    MM.kCCoinCash = Class'Engine.BTCustomDrawHK'.static.__NFUN_923__(CCoinCash);
    Log((("[BTPageServerSelection::rfAckWebzenCash] Cash=" $ string(MM.kCash)) $ " CCoinCash=") $ string(MM.kCCoinCash));
    MM.UpdateMoneyInfo(MM);
    return true;
    //return;    
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckBuyItemByWebzenCash]");
    // End:0x6B
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    Log("[BTPageServerSelection::rfAckMyMoney]");
    // End:0x4F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = Point;
    MM.UpdateMoneyInfo(MM);
    return true;
    //return;    
}

function bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log((((("[BTPageServerSelection::rfAckWebzenShopScriptVersion] Year=" $ string(Year)) $ ", YearID=") $ string(YearId)) $ ", SalesZoneCode=") $ string(SalesZoneCode));
    page_Main.UpdateWebzenShopItemList(Year, YearId, SalesZoneCode);
    GameMgr.UpdateWebzenItemList(GameMgr);
    return true;
    //return;    
}

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    Log(((((("[BTPageServerSelection::rfAckRegisteredPCBangInfo] Name(R,M)=" $ PCBangName) $ "(") $ string(IsRegisteredPCBang)) $ ", ") $ string(IsMainPCBang)) $ ")");
    // End:0x90
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kIsRegisteredPCBang = int(IsRegisteredPCBang);
    MM.kIsMainPCBang = int(IsMainPCBang);
    MM.kPCBangName = PCBangName;
    MM.UpdatePCBangInfo(MM);
    // End:0x112
    if(MM.IsPlayingPCBang())
    {
        page_Main.TcpChannel.sfReqPCBangUserList();
    }
    //return;    
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckCharInfo] CharName=" $ CharName);
    // End:0x6E6
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
        // End:0x221
        if(ClanName == "none")
        {
            ClanName = "";
        }
        MM.kClanName = ClanName;
        MM.kInClanGrade = int(InClanRank);
        MM.kClanLevel = ClanLevel;
        MM.kClanLookingFor = int(stCharInfo.LookForClan) > 0;
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
        // End:0x58A
        if(MM.kClanName == "")
        {
            MM.kUser_ClanContribue = 0;
            page_Main.MyCharInfo.ClanContribue = 0;            
        }
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
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return false;
    //return;    
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
    //return;    
}

function bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckRegisterMainPCBang]");
    // End:0x5A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqRegisteredPCBangInfo();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 128);
    return true;
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    Log((("[BTPageServerSelection::rfAckClanUserListStart] Result=" $ string(Result)) $ " TotalCount=") $ string(TotalCount));
    MM.ClearClanList();
    MM.SetClanListCount(TotalCount);
    // End:0xBA
    if(MM.kClanListCount == MM.kClanList.Length)
    {
        MM.UpdateClanList(MM);
    }
    return true;
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    local int i;

    Log("[BTPageServerSelection::rfAckClanUserList]");
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x5B:

    // End:0x75 [Loop If]
    if(i < Level.Length)
    {
        i++;
        // [Loop Continue]
        goto J0x5B;
    }
    // End:0xAF
    if(MM.kClanListCount == MM.kClanList.Length)
    {
        MM.UpdateClanList(MM);
    }
    return true;
    //return;    
}

function bool rfAckClanUserListEnd()
{
    Log("[BTPageServerSelection::rfAckClanUserListEnd]");
    return true;
    //return;    
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    Log("[BTPageServerSelection::rfAckFriendListStart]");
    MM.ClearFriendList();
    MM.SetFriendListCount(TotalCount);
    // End:0x8E
    if(MM.kFriendListCount == MM.kFriendList.Length)
    {
        MM.UpdateFriendList(MM);
    }
    return true;
    //return;    
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    local int i;

    Log("[BTPageServerSelection::rfAckFriendList]");
    Log("[BTPageServerSelection::rfAckFriendList] Start");
    Log((("[BTPageServerSelection::rfAckFriendList] FriendName.Length=" $ string(FriendName.Length)) $ ", ClanLevel.Length") $ string(ClanLevel.Length));
    i = 0;
    J0xCE:

    // End:0x165 [Loop If]
    if(i < FriendName.Length)
    {
        MM.AddFriendList(FriendName[i], IsLogOn[i], CM_Pattern[i], CM_BG[i], CM_BL[i], ClanName[i], Level[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i]);
        i++;
        // [Loop Continue]
        goto J0xCE;
    }
    // End:0x19F
    if(MM.kFriendListCount == MM.kFriendList.Length)
    {
        MM.UpdateFriendList(MM);
    }
    Log("[BTPageServerSelection::rfAckFriendList] End");
    return true;
    //return;    
}

function bool rfAckFriendListEnd()
{
    Log("[BTPageServerSelection::rfAckFriendListEnd]");
    return true;
    //return;    
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
    //return;    
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageServerSelection::rfAckPCBangUserList] FriendName.Length = " $ string(FriendName.Length));
    Log("[BTPageServerSelection::rfAckPCBangUserList] Start");
    i = 0;
    J0x8C:

    // End:0x170 [Loop If]
    if(i < FriendName.Length)
    {
        Log((((((((((((((((((FriendName[i] $ ", ") $ string(CM_Pattern[i])) $ ", ") $ string(CM_BG[i])) $ ", ") $ string(CM_BL[i])) $ ", ") $ string(Level[i])) $ ", ") $ string(LevelMarkID[i])) $ ", ") $ string(TitleMarkID[i])) $ ", ") $ string(Reserved1[i])) $ ", ") $ string(Reserved2[i])) $ ", ") $ string(Reserved3[i]));
        i++;
        // [Loop Continue]
        goto J0x8C;
    }
    // End:0x1AA
    if(MM.kPCBangListCount == MM.kPCBangList.Length)
    {
        MM.UpdatePCBangList(MM);
    }
    Log("[BTPageServerSelection::rfAckPCBangUserList] End");
    return true;
    //return;    
}

function bool rfAckPCBangUserListEnd()
{
    Log("[BTPageServerSelection::rfAckPCBangUserListEnd]");
    return true;
    //return;    
}

function bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    local int i;
    local export editinline BTWindowOptionHK BTWindow;

    Log((("[BTPageServerSelection::rfAckBlockUserListStart] Result=" $ string(Result)) $ " TotalCount=") $ string(TotalCount));
    MM.ClearBlockList();
    MM.SetBlockListCount(TotalCount);
    // End:0x186
    if(MM.kBlockListCount == MM.kBlockList.Length)
    {
        MM.UpdateBlockList(MM);
        MM.BlockUserListForOption.Length = MM.kBlockList.Length;
        i = 0;
        J0xE1:

        // End:0x132 [Loop If]
        if(i < MM.kBlockList.Length)
        {
            MM.BlockUserListForOption[i] = MM.kBlockList[i].UserName;
            i++;
            // [Loop Continue]
            goto J0xE1;
        }
        BTWindow = BTWindowOptionHK(Controller.TopPage());
        // End:0x186
        if(BTWindow != none)
        {
            BTWindow.TPOption.TPCommunity.UpdateBlockUserList(MM.BlockUserListForOption);
        }
    }
    return true;
    //return;    
}

function bool rfAckBlockUserListEnd()
{
    Log("[BTPageServerSelection::rfAckBlockUserListEnd]");
    return true;
    //return;    
}

function bool rfAckBlockUserList(array<string> CharName)
{
    local int i;
    local export editinline BTWindowOptionHK BTWindow;

    Log("[BTPageServerSelection::rfAckBlockUserList]");
    i = 0;
    J0x36:

    // End:0x6A [Loop If]
    if(i < CharName.Length)
    {
        MM.AddBlockList(CharName[i]);
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    // End:0x16F
    if(MM.kBlockListCount == MM.kBlockList.Length)
    {
        MM.UpdateBlockList(MM);
        MM.BlockUserListForOption.Length = MM.kBlockList.Length;
        i = 0;
        J0xCA:

        // End:0x11B [Loop If]
        if(i < MM.kBlockList.Length)
        {
            MM.BlockUserListForOption[i] = MM.kBlockList[i].UserName;
            i++;
            // [Loop Continue]
            goto J0xCA;
        }
        BTWindow = BTWindowOptionHK(Controller.TopPage());
        // End:0x16F
        if(BTWindow != none)
        {
            BTWindow.TPOption.TPCommunity.UpdateBlockUserList(MM.BlockUserListForOption);
        }
    }
    return true;
    //return;    
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, BtrDouble KeyItemIdx, int KeyItemRemainCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    local int i, GetItemCount;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<int> CandidateItemIDs, CandidatePartIDs, CandidateBestItemIDs;
    local export editinline BTWindowRandBoxHK BTWindow;
    local bool inCapsuleItem;

    Log("[BTPageServerSelection::rfAckRandomBox_Use] Result=" $ string(Result));
    // End:0x66
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(RandomBoxItemIdx);
    // End:0x8D
    if(instanceInfo == none)
    {
        return true;
    }
    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
    // End:0xF6
    if((KeyItemRemainCount == 0) && (KeyItemIdx.dummy_1_DO_NOT_USE != 0) || KeyItemIdx.dummy_2_DO_NOT_USE != 0)
    {
        GameMgr.RemoveInstanceItem(KeyItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(KeyItemIdx, KeyItemRemainCount);
    }
    // End:0x2AC
    if(GameMgr.CheckCapsuleItem(ItemInfo.ItemType) || GameMgr.CheckBlackbox(ItemInfo.ItemType))
    {
        inCapsuleItem = GameMgr.CheckCapsuleItem(ItemInfo.ItemType);
        // End:0x1C4
        if(GameMgr.CheckBlackbox(ItemInfo.ItemType))
        {
            page_Main.page_Lucky.tpBlackBox.LastOpenBlackBoxID = ItemInfo.ItemID;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowCapsuleGet");
        BTWindowCapsuleGet(Controller.TopPage()).FillCapsule(inCapsuleItem);
        BTWindowCapsuleGet(Controller.TopPage()).Initialize(TcpChannel, ItemInfo, RandomBxoItemCount, RandomBoxItemIdx, KeyItemRemainCount, KeyItemIdx);
        BTWindowCapsuleGet(Controller.TopPage()).__ClickInventory__Delegate = WindowCapsuleGet_OnInventory;
        BTWindowCapsuleGet(Controller.TopPage()).__ClickShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;        
    }
    else
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowRandBoxHK");
    }
    BTWindow = BTWindowRandBoxHK(Controller.TopPage());
    BTWindow.TopLine.Caption = ItemInfo.ItemName;
    BTWindow.__RandEnd__Delegate = End_WindowRandBox;
    GetItemCount = GameMgr.GetRandBoxItemsCount(instanceInfo.ItemID);
    BTWindow.SetItemCount(GetItemCount);
    PlayerOwner().dblog("== Random Box =======");
    PlayerOwner().dblog("Used Item=" $ ItemInfo.ItemName);
    i = 0;
    J0x3C0:

    // End:0x5D0 [Loop If]
    if(i < GetItemCount)
    {
        GameMgr.GetRandBoxItems(instanceInfo.ItemID, i + 1, CandidateItemIDs, CandidatePartIDs, CandidateBestItemIDs);
        BTWindow.SetCandidateItems(i, CandidateItemIDs, CandidatePartIDs, CandidateBestItemIDs);
        // End:0x455
        if(i >= ItemIDChoose.Length)
        {
            BTWindow.SetAcquireItem(i, 0, 0, EmptyBtrDouble());
            // [Explicit Continue]
            goto J0x5C6;
        }
        ItemInfo = GameMgr.FindUIItem(ItemIDChoose[i]);
        PlayerOwner().dblog((((("AcquireItem ItemName=" $ ItemInfo.ItemName) $ ", ItemID=") $ string(ItemIDChoose[i])) $ ", PartID=") $ string(PartIDChoose[i]));
        // End:0x544
        if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
        {
            BTWindow.SetAcquireItem(i, ItemIDChoose[i], PeriodOnChoosenItem[i], ItemIdx[i]);
            // [Explicit Continue]
            goto J0x5C6;
        }
        // End:0x591
        if(ItemInfo.CostType == 3)
        {
            BTWindow.SetAcquireItem(i, ItemIDChoose[i], StackCountOnChoosenItem[i], ItemIdx[i]);
            // [Explicit Continue]
            goto J0x5C6;
        }
        BTWindow.SetAcquireItem(i, ItemIDChoose[i], PartIDChoose[i], ItemIdx[i]);
        J0x5C6:

        i++;
        // [Loop Continue]
        goto J0x3C0;
    }
    PlayerOwner().dblog("=====================");
    BTWindow.ItemIDChoose.Length = ItemIDChoose.Length;
    BTWindow.ItemIdx.Length = ItemIdx.Length;
    BTWindow.PartIDChoose.Length = PartIDChoose.Length;
    BTWindow.StackCount.Length = StackCount.Length;
    BTWindow.UntilTime.Length = UntilTime.Length;
    i = 0;
    J0x669:

    // End:0x723 [Loop If]
    if(i < ItemIDChoose.Length)
    {
        BTWindow.ItemIDChoose[i] = ItemIDChoose[i];
        BTWindow.ItemIdx[i] = ItemIdx[i];
        BTWindow.PartIDChoose[i] = PartIDChoose[i];
        BTWindow.StackCount[i] = StackCount[i];
        BTWindow.UntilTime[i] = UntilTime[i];
        i++;
        // [Loop Continue]
        goto J0x669;
    }
    // End:0x745
    if(RandomBxoItemCount == 0)
    {
        GameMgr.RemoveInstanceItem(RandomBoxItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(RandomBoxItemIdx, RandomBxoItemCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    return true;
    //return;    
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local wItemBoxHK ItemInfo;

    Log("[BTPageServerSelection::rfAckEquipItem] Result=" $ string(Result));
    // End:0x62
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    ItemInfo = GameMgr.FindUIItem(ChangedNewItemID);
    // End:0xC7
    if(ItemInfo == none)
    {
        Log("[BTPageServerSelection::rfAckEquipItem] itemInfo is none!!");
        return true;
    }
    // End:0x134
    if(int(ItemInfo.byModeItem) == 0)
    {
        // End:0x107
        if(__NFUN_913__(ChangedOldUniqueID, EmptyBtrDouble()))
        {
            GameMgr.ChangeInstance_ItemSlotPos(ChangedOldUniqueID, ChangedOldSlotPosition);
        }
        // End:0x131
        if(__NFUN_913__(ChangedNewUniqueID, EmptyBtrDouble()))
        {
            GameMgr.ChangeInstance_ItemSlotPos(ChangedNewUniqueID, ChangedNewSlotPosition);
        }        
    }
    else
    {
        GameMgr.SetInstance_ItemSlotPos(ChangedNewUniqueID, ChangedNewSlotPosition);
    }
    return true;
    //return;    
}

function bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckAddBlockUserList]");
    // End:0x58
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqBlockUserList();
    return true;
    //return;    
}

function bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckRemoveBlockUserList]");
    // End:0x5B
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqBlockUserList();
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    PlayerOwner().dblog((((((("[BTPageServerSelection::rfAckWebzenBillingStorageListStart] Result=" $ string(Result)) $ ", TotalCount=") $ string(TotalCount)) $ ", TotalPage=") $ string(TotalPage)) $ ", CurPage=") $ string(CurPage));
    Log((((((("[BTPageServerSelection::rfAckWebzenBillingStorageListStart] Result=" $ string(Result)) $ ", TotalCount=") $ string(TotalCount)) $ ", TotalPage=") $ string(TotalPage)) $ ", CurPage=") $ string(CurPage));
    // End:0x1AA
    if(Result != 0)
    {
        // End:0x18F
        if(page_Main.WZILP.bLock)
        {
            page_Main.WZILP.bLock = false;
            page_Main.UpdateWebzenInvenListEnd(page_Main);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x1E9
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        return true;
    }
    // End:0x21E
    if(CurPage == 1)
    {
        page_Main.WZILP.MaxPage = TotalPage;
        GameMgr.kWZInvenList.Length = 0;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    local int i, Len;

    PlayerOwner().dblog("[BTPageServerSelection::rfAckWebzenBillingStorageList] Seq.Length=" $ string(Seq.Length));
    Log("[BTPageServerSelection::rfAckWebzenBillingStorageList] Seq.Length=" $ string(Seq.Length));
    // End:0xEA
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        return true;
    }
    i = 0;
    J0xF1:

    // End:0x493 [Loop If]
    if(i < Seq.Length)
    {
        Len = GameMgr.kWZInvenList.Length;
        GameMgr.kWZInvenList.Length = Len + 1;
        Log((((((((((((((((((((((((string(Len) $ "  Seq=") $ string(Seq[i])) $ ", ItemSeq=") $ string(ItemSeq[i])) $ ", GroupCode=") $ string(GroupCode[i])) $ ", ShareFlag=") $ string(ShareFlag[i])) $ ", ProductSeq=") $ string(ProductSeq[i])) $ ", CashName=") $ CashName[i]) $ ", CashPoint=") $ __NFUN_918__(CashPoint[i])) $ ", SendAccountID=") $ SendAccountID[i]) $ ", SendMessage=") $ SendMessage[i]) $ ", ItemType=") $ string(ItemType[i])) $ ", RelationType=") $ string(RelationType[i])) $ ", ProductType=") $ string(ProductType[i]));
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
        i++;
        // [Loop Continue]
        goto J0xF1;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageListEnd()
{
    PlayerOwner().dblog("[BTPageServerSelection::rfAckWebzenBillingStorageListEnd]");
    Log("[BTPageServerSelection::rfAckWebzenBillingStorageListEnd]");
    // End:0xDC
    if(page_Main.WZILP.bLock == false)
    {
        Log("Error : WZILP.bLock == false!!!");
        page_Main.UpdateWebzenInvenListEnd(page_Main);
        return true;
    }
    GameMgr.UpdateWebzenItemList(GameMgr);
    // End:0x1B9
    if(page_Main.WZILP.CurPage < page_Main.WZILP.MaxPage)
    {
        page_Main.WZILP.CurPage = page_Main.WZILP.CurPage + 1;
        page_Main.TcpChannel.sfReqWebzenBillingStorageList(page_Main.WZILP.CurPage, page_Main.WZILP.CountPerPage, byte(Asc(page_Main.WZILP.StorageType)));
        page_Main.UpdateWebzenInvenList(page_Main);        
    }
    else
    {
        page_Main.WZILP.bLock = false;
        page_Main.UpdateWebzenInvenListEnd(page_Main);
    }
    Log("page_Main.WZILP.StorageType = " $ page_Main.WZILP.StorageType);
    return true;
    //return;    
}

function bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    local wItemBoxHK ItemInfo;
    local int iItemExtra;

    Log((((((("[BTPageServerSelection::rfAckWebzenBillingUseStorageItem] Result=" $ string(Result)) $ ", ItemIdx=") $ __NFUN_918__(ItemIdx)) $ ", ItemID=") $ string(ItemID)) $ ", ItemExtra=") $ __NFUN_918__(ItemExtra));
    // End:0xBC
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x210
    if(ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID);
        // End:0x210
        if(ItemInfo != none)
        {
            // End:0x152
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                iItemExtra = __NFUN_923__(ItemExtra);
                GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, iItemExtra, 0, 1, 0);                
            }
            else
            {
                // End:0x1AB
                if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
                {
                    GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, 1, 0, ItemExtra);                    
                }
                else
                {
                    // End:0x1F8
                    if(ItemInfo.CostType == 3)
                    {
                        iItemExtra = __NFUN_923__(ItemExtra);
                        GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, iItemExtra, 0);
                    }
                }
            }
            GameMgr.UpdateItemList(GameMgr);
        }
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    Log(("page_Main.sfReqWebzenInvenList(" $ page_Main.WZILP.StorageType) $ ")");
    page_Main.sfReqWebzenInvenList(page_Main.WZILP.StorageType);
    return true;
    //return;    
}

function bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckPaidItem_EraseRecord] RemainCount=" $ string(RemainCount));
    // End:0x72
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(ItemIdx);
    // End:0x1A7
    if(instanceInfo != none)
    {
        // End:0xB9
        if(RemainCount == 0)
        {
            GameMgr.RemoveInstanceItem(ItemIdx);            
        }
        else
        {
            GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
        }
        switch(Command)
        {
            // End:0xF6
            case 1:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 14);
                // End:0x18F
                break;
            // End:0x114
            case 2:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 10);
                // End:0x18F
                break;
            // End:0x132
            case 3:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 12);
                // End:0x18F
                break;
            // End:0x150
            case 4:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 4);
                // End:0x18F
                break;
            // End:0x16E
            case 5:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 58);
                // End:0x18F
                break;
            // End:0x18C
            case 6:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 60);
                // End:0x18F
                break;
            // End:0xFFFF
            default:
                break;
        }
        GameMgr.UpdateItemList(GameMgr);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckPaidItem_BroadCast]");
    // End:0x5A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    instanceInfo = GameMgr.FindInstanceItem(ItemIdx);
    // End:0x15A
    if(instanceInfo != none)
    {
        Log("UsedItemID = " $ string(instanceInfo.ItemID));
        // End:0xC4
        if(StackCount == 0)
        {
            GameMgr.RemoveInstanceItem(ItemIdx);            
        }
        else
        {
            GameMgr.ChangeInstance_StackCount(ItemIdx, StackCount);
        }
        switch(instanceInfo.ItemID)
        {
            // End:0xF5
            case 17004:
            // End:0x116
            case 17075:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 31);
                // End:0x142
                break;
            // End:0x11E
            case 17005:
            // End:0x13F
            case 17076:
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 32);
                // End:0x142
                break;
            // End:0xFFFF
            default:
                break;
        }
        GameMgr.UpdateItemList(GameMgr);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckPaidItem_ChangeCharname]");
    // End:0x5F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x81
    if(RemainCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 184, MM.kUserName, NewCharname);
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    MyStatus.NickName = NewCharname;
    MM.ReplaceUserName(MM.kUserName, NewCharname);
    MM.kUserName = NewCharname;
    MM.My_szName = NewCharname;
    MM.UpdateCharInfo(MM);
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckPaidItem_ChangeClanname]");
    // End:0x5F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x81
    if(RemainCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 186, MM.kClanName, NewClanname);
    MM.kPrevClanName = MM.kClanName;
    MM.kClanName = NewClanname;
    page_Main.MyClanName = NewClanname;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    MyStatus.ClanName = NewClanname;
    MM.UpdateCharInfo(MM);
    MM.UpdateClanInfo(MM);
    return true;
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    Log("[BTPageServerSelection::rfAckPaidItem_NotifyChangeClanname]");
    // End:0x80
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 186, MM.kClanName, NewClanname);        
    }
    else
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(186, MM.kClanName, NewClanname), 5, true);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTPageServerSelection::rfAckPaidItem_ClanMarkDupCheck]");
    // End:0x96
    if(Result != 0)
    {
        BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
        // End:0x7B
        if(BTWindow != none)
        {
            BTWindow.SetDupCheck(false);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0xE1
    if(BTWindow != none)
    {
        BTWindow.SetDupCheck(true);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 170);
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTPageServerSelection::rfAckPaidItem_ClanMarkDupCheck]");
    // End:0x97
    if(Result != 0)
    {
        BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
        // End:0x7C
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xB9
    if(StackCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);        
    }
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
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 173);
    return true;
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    local int i;

    Log((((("[BTPageServerSelection::rfAckPaidItem_NotifyChangeClanMark] Pattern=" $ string(Pattern)) $ ", BG=") $ string(BG)) $ ", BL=") $ string(BL));
    MM.kClanPattern = Pattern;
    MM.kClanBG = BG;
    MM.kClanBL = BL;
    GameMgr.cmm.AddClanMark(ClanName, Pattern, BG, BL);
    // End:0x125
    if(MM.kClanName == ClanName)
    {
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
    }
    i = 0;
    J0x12C:

    // End:0x1DF [Loop If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x1D5
        if(MM.UserInfos[i].ClanName == ClanName)
        {
            MM.UserInfos[i].ClanMark = Pattern;
            MM.UserInfos[i].ClanBG = BG;
            MM.UserInfos[i].ClanBL = BL;
        }
        i++;
        // [Loop Continue]
        goto J0x12C;
    }
    return true;
    //return;    
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    return true;
    //return;    
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return true;
    //return;    
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    return true;
    //return;    
}

function bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    // End:0x1F
    if(Result == 0)
    {
        MM.AddGMList(UserID);
    }
    return true;
    //return;    
}

function bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    // End:0x1F
    if(Result == 0)
    {
        MM.RemoveGMList(UserID);
    }
    return true;
    //return;    
}

function bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    local DelegateEventTimer det;
    local int i;

    Log("[BTPageServerSelection::rfAckCharBlockInfo] Result=" $ string(Result));
    // End:0x66
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xC9
    if((ChatBlockStartTime.dummy_1_DO_NOT_USE != 0) || ChatBlockStartTime.dummy_2_DO_NOT_USE != 0)
    {
        det = new Class'Engine.DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBlockStartTime_OnEventTimer;
        GameMgr.AddEventTimer(1000, ChatBlockStartTime, det);
    }
    // End:0x12C
    if((ChatBlockEndTime.dummy_1_DO_NOT_USE != 0) || ChatBlockEndTime.dummy_2_DO_NOT_USE != 0)
    {
        det = new Class'Engine.DelegateEventTimer';
        det.__OnEventTimer__Delegate = ChatBlockEndTime_OnEventTimer;
        GameMgr.AddEventTimer(1001, ChatBlockEndTime, det);
    }
    GameMgr.ClearBlockedItem();
    i = 0;
    J0x142:

    // End:0x176 [Loop If]
    if(i < BlockedItemIdx.Length)
    {
        GameMgr.AddBlockedItem(BlockedItemIdx[i]);
        i++;
        // [Loop Continue]
        goto J0x142;
    }
    return true;
    //return;    
}

function ChatBlockStartTime_OnEventTimer(int Index)
{
    local BtrDouble D;
    local BtrTime t;

    Log("[BTPageServerSelection::ChatBlockStartTime_OnEventTimer]");
    D = GameMgr.GetLeftEventTime(1001);
    // End:0xD3
    if((D.dummy_1_DO_NOT_USE != 0) || D.dummy_2_DO_NOT_USE != 0)
    {
        BtrDoubleToBtrTime(D, t);
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(162, string((t.Day * 24) + t.Hour), string(t.Minute)), 5, true);
    }
    page_Main.bSystemChatBlock = true;
    //return;    
}

function ChatBlockEndTime_OnEventTimer(int Index)
{
    Log("[BTPageServerSelection::ChatBlockEndTime_OnEventTimer]");
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(159), 5, true);
    page_Main.bSystemChatBlock = false;
    //return;    
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    local string NewKey;

    Log("[BTPageServerSelection::rfAckClientChallenge]");
    NewKey = PlayerOwner().Level.GetMatchMaker().MakeMD5(Key1 $ PlayerOwner().Level.GetMatchMaker().gEngine.strMD5Digest);
    page_Main.TcpLogin.sfReqClientChecksum(NewKey, Key2);
    return true;
    //return;    
}

function bool rfAckClientChecksum(int Result)
{
    Log("[BTPageServerSelection::rfAckClientChecksum] Result=" $ string(Result));
    // End:0x4F
    if(Result == 0)
    {        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 164);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    return true;
    //return;    
}

function bool BTWindowDefineARHK_40_41_OnOK(GUIComponent Sender)
{
    page_Main.page_Lobby2.HeaderButton_OnClick(page_Main.page_Lobby2.TPTopMenu.PostBox);
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.CloseWindowAll(Controller);
    return true;
    //return;    
}

function bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageServerSelection::rfAckGetMyMailBoxState] Result=" $ string(Result));
    CTRP.bGetMyMailBoxState = true;
    // End:0x7D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        CheckToSetPageLobby();
        return true;
    }
    // End:0x9E
    if(int(IsFull) > 0)
    {
        page_Main.bPostBoxFull = true;        
    }
    else
    {
        page_Main.bPostBoxFull = false;
    }
    // End:0xCE
    if(NewMailCount > 0)
    {
        page_Main.bNewMailArrived = true;        
    }
    else
    {
        page_Main.bNewMailArrived = false;
    }
    page_Main.NewMailCount = NewMailCount;
    // End:0x1C5
    if(int(IsFull) > 0)
    {
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK");
        BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
        BTWindow.SetContentText_Instance(40);
        BTWindow.__OnOK__Delegate = BTWindowDefineARHK_40_41_OnOK;
        // End:0x1C2
        if(BTWindow == none)
        {
            Log("page_Main.pwm.Back(EPage_Lobby2) == none");
        }        
    }
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
    //return;    
}

function bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    local export editinline BTWindowClanMenuHK BTWindow;

    Log((("[BTPageServerSelection::rfAckSetLookForClan] Result=" $ string(Result)) $ ", IsLookingFor=") $ string(IsLookingFor));
    MM.kClanLookingFor = int(IsLookingFor) > 0;
    BTWindow = BTWindowClanMenuHK(Controller.TopPage());
    // End:0xBA
    if(BTWindow != none)
    {
        BTWindow.SetClanLookingFor(MM.kClanLookingFor);
    }
    return true;
    //return;    
}

function bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    local string RecvMsg;

    Log(((("[BTPageLobby::rfAckChatNormal] Sender=" $ Sender) $ ", ") $ "Message=") $ Message);
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
    // End:0xBF
    if(id == MM.kUID)
    {
        RecvMsg = (("[" $ Sender) $ "] ") $ Message;
        page_Main.AddChatLog(RecvMsg, 4, true);        
    }
    else
    {
        RecvMsg = (("[" $ Sender) $ "] ") $ Message;
        page_Main.AddChatLog(RecvMsg, 1, true);
    }
    return true;
    //return;    
}

function bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    local string RecvMsg;

    Log(((("[BTPageLobby:rfReqRecvChatWispher] CharnameFrom=" $ CharnameFrom) $ ", ") $ "Message=") $ Message);
    // End:0x6D
    if(MM.IsBlockUser(CharnameFrom))
    {
        return true;
    }
    RecvMsg = (((("" $ strFrom) $ " [") $ CharnameFrom) $ "]") @ Message;
    page_Main.AddChatLog(RecvMsg, 3, true);
    page_Main.LastRecvWhispherName = CharnameFrom;
    Class'XInterface.HudBase'.static.PlayHUDSound(PlayerOwner(), 6);
    return true;
    //return;    
}

function bool rfAckChatClan(string CharName, string Message, int Result)
{
    local string RecvMsg;

    Log(((("[BTPageLobby::rfAckChatClan] Charname=" $ CharName) $ ", ") $ "Message=") $ Message);
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
    RecvMsg = (("[" $ CharName) $ "]") @ Message;
    page_Main.AddChatLog(RecvMsg, 2, true);
    return true;
    //return;    
}

function bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    local string RecvMsg;

    Log((("[BTPageServerSelection::rfAckPaidItem_RelayBroadcast] [" $ CharName) $ "] ") $ Msg);
    // End:0x7A
    if(CharName != "")
    {
        RecvMsg = (("[" $ CharName) $ "]") @ Msg;        
    }
    else
    {
        RecvMsg = Msg;
    }
    page_Main.AddChatLog(RecvMsg, 7, true);
    return true;
    //return;    
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
    // End:0xCA
    if(MsgInfo.ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(MsgInfo.ItemID);
        msgp[4] = ItemInfo.ItemName;        
    }
    else
    {
        msgp[4] = "";
    }
    msgp[5] = string(MsgInfo.Point);
    // End:0x108
    if(int(CommunityType) == 1)
    {
        msgp[6] = strPCBangFriend;        
    }
    else
    {
        msgp[6] = "";
    }
    // End:0x195
    if(MsgInfo.MsgCode == 14)
    {
        det = new Class'Engine.DelegateEventTimer';
        det.Data_Int[0] = MsgInfo.MsgCode;
        det.Data_String[0] = msgp[0];
        det.__OnEventTimer__Delegate = Receive_EventGift;
        GameMgr.AddEventTimerHMS(0, 0, 0, 59, det);
        return true;
    }
    fmtStr = Class'GUIWarfareControls.BTWindowSystemMsgInfoHK'.static.GetFormatString(MsgInfo.MsgCode, msgp[0], msgp[1], msgp[2], msgp[3], msgp[4], msgp[5], msgp[6]);
    Log((("[BTPageServerSelection::rfAckRecvSystemMsg] " $ fmtStr) $ ", CommunityType=") $ string(CommunityType));
    page_Main.AddChatLog(fmtStr, 5, true);
    // End:0x289
    if((MsgInfo.MsgCode >= 2) && MsgInfo.MsgCode <= 4)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x2BD
    if((MsgInfo.MsgCode >= 9) && MsgInfo.MsgCode <= 13)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x2E2
    if(MsgInfo.MsgCode == 5)
    {
        Class'XInterface.HudBase'.static.PlayHUDSound(PlayerOwner(), 5);
    }
    return true;
    //return;    
}

function Receive_EventGift(int Index)
{
    local string fmtStr;

    fmtStr = Class'GUIWarfareControls.BTWindowSystemMsgInfoHK'.static.GetFormatString(GameMgr.kEventTimerList[Index].EventDelegate.Data_Int[0], GameMgr.kEventTimerList[Index].EventDelegate.Data_String[0]);
    Log("[BTPageServerSelection::Receive_EventGift] " $ fmtStr);
    page_Main.AddChatLog(fmtStr, 5, true);
    page_Main.SetNewMailArrived(true);
    //return;    
}

function bool rfAckServerType(byte Type)
{
    Log("[BTPageServerSelection::rfAckServerType] " $ string(Type));
    MM.kServerType = int(Type);
    // End:0x74
    if(MM.kServerType == 1)
    {
        MM.kClanMatch_InChannel = true;        
    }
    else
    {
        MM.kClanMatch_InChannel = false;
    }
    return true;
    //return;    
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log((("[BTPageServerSelectionCN::rfAckLogOut] Result=" $ string(Result)) $ " Reason=") $ string(Reason));
    // End:0x9C
    if((int(Reason) == 4) || int(Reason) == 1)
    {
        page_Main.HaltNetwork();
        page_Main.Controller.ConsoleCommand("exit");
        return true;
    }
    // End:0x160
    if(int(Reason) == 3)
    {
        Log(((("[BTPageServerSelectionCN::rfAckLogOut] page_Main.LoginToChannel( " $ page_Main.szLoginServerIP) $ ", ") $ string(page_Main.szLoginServerPort)) $ ")");
        PlayerOwner().SendWebLog(4120, -1);
        page_Main.ChannelToLogin(page_Main.szLoginServerIP, page_Main.szLoginServerPort);
        return true;
    }
    // End:0x1B2
    if(int(Reason) == 5)
    {
        page_Main.HaltNetwork();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 0);
        page_Main.Controller.ConsoleCommand("exit");
        return true;
    }
    PlayerOwner().SendWebLog(4120, -1);
    page_Main.pwm.CloseAndClear();
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.LoginToChannel(ConnectingChannel.IP, ConnectingChannel.Port, ConnectingChannel.DataPort);
    return true;
    //return;    
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log((((("[BTPageServerSelection::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year)) $ " YearId=") $ string(YearId)) $ " SalesZoneCode=") $ string(SalesZoneCode));
    page_Main.UpdateWebzenShopItemList(Year, YearId, SalesZoneCode);
    return true;
    //return;    
}

event bool rfAckPopUpMessage(int MessageType)
{
    Log("[BTPageServerSelectionCN::rfAckPopUpMessage()] MessageType=" $ string(MessageType));
    // End:0xCF
    if(835 == MessageType)
    {
        page_Main.pwm.CreateAndPush(10, "GUIWarfareControls.BTWindowErrorDefineHK", true, 0);
        BTWindowErrorDefineHK(page_Main.pwm.Last(10)).SetContentText_Instance(1, 835);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 0);
    }
    return true;
    //return;    
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageServerSelection::rfAckMoveToLobby()] MessageType=" $ string(MessageType));
    return true;
    //return;    
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTPageServerSelection::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    // End:0xC1
    if(MM.IsUsingTenProtect)
    {
        // End:0x9E
        if(PlayerOwner().Level.GetIsServiceBuild())
        {
            MM.TenProtectCreate(MM.LoginInfo.UIN);            
        }
        else
        {
            MM.TenProtectCreate(CharDBID);
        }
        MM.TenProtectSendInitData();
    }
    return true;
    //return;    
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    Log("[BTPage::rfAckEquipSkill] Result=" $ string(Result));
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(ChangedNewSkillID);
    instanceInfo = GameMgr.FindFirstInstanceItemByItemID(ChangedNewSkillID);
    // End:0xFC
    if(instanceInfo == none)
    {
        return false;
    }
    // End:0x115
    if(int(ItemInfo.byModeItem) == 0)
    {        
    }
    page_Main.TcpChannel.sfReqConfirmSkillChanged();
    return true;
    //return;    
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    Log((((("[BTPageServerSelection::rfAckLoginWithTencentAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(tc_AccountType)) $ " wzp_IsBlock=") $ string(tc_IsBlock));
    __NFUN_270__((((("[BTPageServerSelection::rfAckLoginWithTencentAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(tc_AccountType)) $ " wzp_IsBlock=") $ string(tc_IsBlock));
    // End:0x150
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithTencentAuth_Test(Result, tc_AccountType, tc_IsBlock);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithTencentAuth_Live(Result, tc_AccountType, tc_IsBlock);
    }
    return true;
    //return;    
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log((((((((("[BTPageServerSelection::rfAckLoginWithWZAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(wzp_AccountType)) $ " wzp_IsBlock=") $ string(wzp_IsBlock)) $ " wzp_AuthKeySuccess=") $ string(wzp_AuthKeySuccess)) $ " ChannelType = ") $ string(ChannelType));
    __NFUN_270__((((((((("[BTPageServerSelection::rfAckLoginWithWZAuth] Result=" $ string(Result)) $ " wzp_AccountType=") $ string(wzp_AccountType)) $ " wzp_IsBlock=") $ string(wzp_IsBlock)) $ " wzp_AuthKeySuccess=") $ string(wzp_AuthKeySuccess)) $ " ChannelType = ") $ string(ChannelType));
    // End:0x1CA
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithWZAuth_Test(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithWZAuth_Live(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
    }
    return true;
    //return;    
}

function bool rfAckLoginWithThailand(int Result)
{
    Log("[BTPageServerSelection::rfAckLoginWithThailand] Result=" $ string(Result));
    __NFUN_270__("[BTPageServerSelection::rfAckLoginWithThailand] Result=" $ string(Result));
    // End:0xD0
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithThailand_Test(Result);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithThailand_Live(Result);
    }
    return true;
    //return;    
}

function bool rfAckLoginWithGlobal(int Result)
{
    Log("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    __NFUN_270__("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    // End:0xCC
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithGlobal_Test(Result);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithGlobal_Live(Result);
    }
    return true;
    //return;    
}

function bool rfAckLoginWithIndonesia(int Result)
{
    Log("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    __NFUN_270__("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    // End:0xCC
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithIndonesia_Test(Result);        
    }
    else
    {
        page_Main.TcpLogin_rfAckLoginWithIndonesia_Live(Result);
    }
    return true;
    //return;    
}

function bool rfAckShopItemData()
{
    GameMgr.kGP20ProductList.Length = 0;
    return true;
    //return;    
}

function bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductName, array<int> ProductCode, array<byte> SaleType, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> SaleMasterFlag, array<int> SaleStatus, array<int> IsGift, array<BtrDouble> SaleEndTime, array<int> Discountcost)
{
    local int i, j, useIndex, ProductCount, costCount;

    ProductCount = ProductNo.Length;
    i = 0;
    J0x13:

    // End:0x5E2 [Loop If]
    if(i < ProductCount)
    {
        Log(((((((((((((((((((((("GP20 Product -> " @ "ProductNo :") @ string(ProductNo[i])) @ ", ProductName :") @ ProductName[i]) @ ", ProductCode :") @ string(ProductCode[i])) @ ", SaleType :") @ string(SaleType[i])) @ ", ProductCost :") @ string(ProductCost[i])) @ ", ProductHour :") @ string(ProductHour[i])) @ ", ProductQuantity :") @ string(ProductQuantity[i])) @ ", SaleMasterFlag :") @ string(SaleMasterFlag[i])) @ ", SaleStatus :") @ string(SaleStatus[i])) @ ", IsGift :") @ string(IsGift[i])) @ ", Discountcost :") @ string(Discountcost[i]));
        useIndex = GameMgr.kGP20ProductList.Length;
        j = 0;
        J0x1C1:

        // End:0x21F [Loop If]
        if(j < GameMgr.kGP20ProductList.Length)
        {
            // End:0x215
            if(GameMgr.kGP20ProductList[j].ProductCode == ProductCode[i])
            {
                useIndex = j;
                // [Explicit Break]
                goto J0x21F;
            }
            j++;
            // [Loop Continue]
            goto J0x1C1;
        }
        J0x21F:

        // End:0x260
        if(useIndex >= GameMgr.kGP20ProductList.Length)
        {
            GameMgr.kGP20ProductList[GameMgr.kGP20ProductList.Length] = new Class'Engine.wGP20Product';
        }
        costCount = GameMgr.kGP20ProductList[useIndex].ProductNo.Length;
        GameMgr.kGP20ProductList[useIndex].ProductNo.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductCost.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductDiscountCost.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductHour.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductQuantity.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].SaleType.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].SaleStatus.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].IsGift.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductNo[costCount] = ProductNo[i];
        GameMgr.kGP20ProductList[useIndex].ProductCost[costCount] = ProductCost[i];
        GameMgr.kGP20ProductList[useIndex].ProductDiscountCost[costCount] = Discountcost[i];
        GameMgr.kGP20ProductList[useIndex].ProductHour[costCount] = ProductHour[i];
        GameMgr.kGP20ProductList[useIndex].ProductQuantity[costCount] = ProductQuantity[i];
        GameMgr.kGP20ProductList[useIndex].SaleType[costCount] = SaleType[i];
        GameMgr.kGP20ProductList[useIndex].SaleStatus[costCount] = SaleStatus[i];
        GameMgr.kGP20ProductList[useIndex].IsGift[costCount] = IsGift[i];
        GameMgr.kGP20ProductList[useIndex].ProductName = ProductName[i];
        GameMgr.kGP20ProductList[useIndex].ProductCode = ProductCode[i];
        GameMgr.kGP20ProductList[useIndex].SaleMasterFlag = SaleMasterFlag[i];
        GameMgr.kGP20ProductList[useIndex].SaleEndTime = SaleEndTime[i];
        i++;
        // [Loop Continue]
        goto J0x13;
    }
    return true;
    //return;    
}

function bool rfReqNotifyShopPackageItemData(int PackageProductNo, array<int> ProductCode, array<int> ProductQuantity, array<int> ProductHour, string Description)
{
    local int i, j, k;
    local bool bFound;

    i = 0;
    J0x07:

    // End:0x1F2 [Loop If]
    if(i < GameMgr.kGP20ProductList.Length)
    {
        j = 0;
        J0x27:

        // End:0x1DC [Loop If]
        if(j < GameMgr.kGP20ProductList[i].ProductNo.Length)
        {
            // End:0x1D2
            if(GameMgr.kGP20ProductList[i].ProductNo[j] == PackageProductNo)
            {
                // End:0x18F
                if(GameMgr.kGP20ProductList[i].PackageInfo == none)
                {
                    GameMgr.kGP20ProductList[i].PackageInfo = new Class'Engine.wGP20Package';
                    k = 0;
                    J0xCD:

                    // End:0x18F [Loop If]
                    if(k < ProductCode.Length)
                    {
                        GameMgr.kGP20ProductList[i].PackageInfo.ProductsCodeList[k] = ProductCode[k];
                        GameMgr.kGP20ProductList[i].PackageInfo.ProductsQuantityList[k] = ProductQuantity[k];
                        GameMgr.kGP20ProductList[i].PackageInfo.ProductsHourList[k] = ProductHour[k];
                        k++;
                        // [Loop Continue]
                        goto J0xCD;
                    }
                }
                // End:0x1C7
                if(Description != "")
                {
                    GameMgr.kGP20ProductList[i].PackageInfo.PackageDescription = Description;
                }
                bFound = true;
                // [Explicit Break]
                goto J0x1DC;
            }
            j++;
            // [Loop Continue]
            goto J0x27;
        }
        J0x1DC:

        // End:0x1E8
        if(bFound)
        {
            // [Explicit Break]
            goto J0x1F2;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x1F2:

    return true;
    //return;    
}

function bool rfReqNotifyShopItemDataEnd(int Ver)
{
    Log("GP20Product : ProductCount =" $ string(GameMgr.kGP20ProductList.Length));
    GameMgr.GP20ShopVersion = Ver;
    GameMgr.UpdateWebzenItemList(GameMgr);
    return true;
    //return;    
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTPageServerSelection::rfReqRecvClanInvite]");
    TcpChannel.sfReqClanInfo(ClanName);
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestClanHK");
    BTWindowRequestClanHK(Controller.TopPage()).SetData(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
    BTWindowRequestClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRequestClanHK_OnOK;
    BTWindowRequestClanHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowRequestClanHK_OnCancel;
    BTWindowRequestClanHK(Controller.TopPage()).ButtonSuspend.__OnClick__Delegate = BTWindowRequestClanHK_OnSuspend;
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnOK]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 0);
    Controller.TopPage().FadeOut(false, true);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kPrevClanName = BTWindow.ClanName;
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnCancel]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 2);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnSuspend]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    local int ClanBL, ClanPT, ClanBG;

    Log("[BTPageClanWar::rfAckRecvClanInviteResult]");
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kClanName = MM.kPrevClanName;
    page_Main.MyClanInfo.CM_ClanName = MM.kClanName;
    page_Main.MyClanName = MM.kClanName;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x1DD
    if(GameMgr.GetClanLevelMarkInfo(MM.kClanName, ClanPT, ClanBG, ClanBL))
    {
        MM.kClanBG = ClanBG;
        MM.kClanBL = ClanBL;
        MM.kClanPattern = ClanPT;
        page_Main.MyClanInfo.CM_BG = ClanBG;
        page_Main.MyClanInfo.CM_BL = ClanBL;
        page_Main.MyClanInfo.CM_Pattern = ClanPT;
        MM.UpdateClanInfo(MM);
    }
    return true;
    //return;    
}

function bool rfNotifyCouponUseError(int Time)
{
    local BtrDouble blockDoubleTime;
    local string blockMsg;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    blockDoubleTime = GameMgr.GetLeftEventTime(1020);
    // End:0xC7
    if((blockDoubleTime.dummy_1_DO_NOT_USE == 0) || blockDoubleTime.dummy_2_DO_NOT_USE == 0)
    {
        GameMgr.AddEventTimerHMS(1020, 0, 0, Time);
        blockMsg = Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.GetFormatString(859, string((Time / 60) + 1));
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowErrorMsg(Controller, blockMsg);
    }
    return true;
    //return;    
}

function WindowCapsuleGet_OnInventory()
{
    page_Main.SetPage(22, true);
    //return;    
}

function End_WindowRandBox()
{
    page_Main.page_Lucky.RefreshWinnerList();
    //return;    
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    local wItemBoxHK ItemInfo;

    Log((((((("[BTPageServerSelection::rfAckGetItemFromItemBox] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " ItemIDChoose=") $ string(ItemIDChoose)) $ " PartIDChoose=") $ string(PartIDChoose));
    // End:0xB4
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xD6
    if(BxoItemCount == 0)
    {
        GameMgr.RemoveInstanceItem(BoxItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(BoxItemIdx, BxoItemCount);
    }
    ItemInfo = GameMgr.FindUIItem(ItemIDChoose);
    // End:0x165
    if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
    {
        GameMgr.AddInstanceItemByParameter(ItemIDChoose, __NFUN_921__(0), __NFUN_923__(ItemIdx), 13, 1, 100000, PartIDChoose, 0, StackCount, 0, UntilTime);        
    }
    else
    {
        GameMgr.AddInstanceItemByParameter(ItemIDChoose, ItemIdx, 0, 13, 1, 100000, PartIDChoose, 0, StackCount, 0, UntilTime);
    }
    GameMgr.UpdateItemList(GameMgr);
    return true;
    //return;    
}

function bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time, int GetItemID)
{
    local wItemBoxHK ItemInfo;
    local string strWinnerInfo;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x103
    if(int(IsNotification) == 1)
    {
        ItemInfo = GameMgr.FindUIItem(GetItemID);
        strWinnerInfo = Class'Engine.BTCustomDrawHK'.static.FormatString(strLotteryWinner, NickName[0], ItemInfo.ItemName);
        // End:0xEC
        if(!MM.InGamePlaying && NickName[0] != MM.kUserName)
        {
            PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Luckyshop/bestitem",,, 6);
        }
        page_Main.AddChatLog(strWinnerInfo, 7, true);
    }
    return false;
    //return;    
}

function bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, BtrDouble ItemUniqueID, byte ChangeCount, int RemainCount)
{
    local wItemBoxHK ItemInfo;

    // End:0x26
    if(ErrorCode != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, ErrorCode);
        return true;
    }
    // End:0x48
    if(RemainCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemUniqueID);        
    }
    else
    {
        // End:0xFD
        if(!GameMgr.ChangeInstance_StackCount(ItemUniqueID, RemainCount))
        {
            ItemInfo = GameMgr.FindUIItem(ItemID);
            // End:0xD4
            if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
            {
                GameMgr.AddInstanceItemByParameter(ItemID, EmptyBtrDouble(), __NFUN_923__(ItemUniqueID), 13, 1, 100000, 0, 0, RemainCount);                
            }
            else
            {
                GameMgr.AddInstanceItemByParameter(ItemID, ItemUniqueID, 0, 13, 1, 100000, 0, 0, RemainCount);
            }
        }
    }
    GameMgr.UpdateItemList(GameMgr);
    return true;
    //return;    
}

function bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite)
{
    Log("[BTPageServerSelection::rfAckCommunityOptionList]");
    MM.kCommunityOptions[int(MM.0)] = byte(Opt_Wispher);
    MM.kCommunityOptions[int(MM.1)] = byte(Opt_GameInvite);
    MM.kCommunityOptions[int(MM.2)] = byte(Opt_FriendInvite);
    MM.kCommunityOptions[int(MM.3)] = byte(Opt_ClanInvite);
    MM.kTempCommunityOptions[int(MM.0)] = byte(Opt_Wispher);
    MM.kTempCommunityOptions[int(MM.1)] = byte(Opt_GameInvite);
    MM.kTempCommunityOptions[int(MM.2)] = byte(Opt_FriendInvite);
    MM.kTempCommunityOptions[int(MM.3)] = byte(Opt_ClanInvite);
    return true;
    //return;    
}

function bool rfAckSetCommunityOption(int Result, string ErrStr)
{
    Log("[BTPageServerSlection::rfAckSetCommunityOption]");
    // End:0x59
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kCommunityOptions[int(MM.0)] = MM.kTempCommunityOptions[int(MM.0)];
    MM.kCommunityOptions[int(MM.1)] = MM.kTempCommunityOptions[int(MM.1)];
    MM.kCommunityOptions[int(MM.2)] = MM.kTempCommunityOptions[int(MM.2)];
    MM.kCommunityOptions[int(MM.3)] = MM.kTempCommunityOptions[int(MM.3)];
    return true;
    //return;    
}

function bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    local export editinline GUIPage page_curr;
    local wItemBoxHK ItemInfo;

    page_curr = Controller.TopPage();
    // End:0x1A6
    if(Result == 0)
    {
        MM.stAttendInfo.StateList = StateList;
        MM.stAttendInfo.ItemIdx = ItemIdx;
        MM.stAttendInfo.RewardItemID = RewardItemID;
        MM.stAttendInfo.RewardItemCount = RewardItemCount;
        // End:0x100
        if(int(IsComplete) == 1)
        {
            // End:0xB3
            if(PaidItemStackCount == 0)
            {
                GameMgr.RemoveInstanceItem(PaidItemIdx);                
            }
            else
            {
                GameMgr.ChangeInstance_StackCount(PaidItemIdx, PaidItemStackCount);
            }
            GameMgr.UpdateItemList(GameMgr);
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 78, string(1));            
        }
        else
        {
            // End:0x1A3
            if((RewardItemID != 0) && RewardItemCount != 0)
            {
                page_Main.TcpChannel.sfReqItemList(MM.kUID);
                ItemInfo = GameMgr.FindUIItem(RewardItemID);
                BTWindowBTTPQuestInfoHK(Controller.TopPage()).QuestInfo.ReceiveItem();
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 79, ItemInfo.ItemName);
            }
        }        
    }
    else
    {
        // End:0x1CC
        if(int(IsComplete) == 1)
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return false;
    //return;    
}

function bool rfAckPuzzleList(int Result, byte IsComplete, array<byte> UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    local int i;
    local export editinline GUIPage page_curr;
    local wItemBoxHK ItemInfo;

    page_curr = Controller.TopPage();
    // End:0x1F3
    if(Result == 0)
    {
        MM.stPuzzleInfo.StateList = StateList;
        MM.stPuzzleInfo.ItemIdx = ItemIdx;
        MM.stPuzzleInfo.RewardItemID = RewardItemID;
        MM.stPuzzleInfo.RewardItemCount = RewardItemCount;
        MM.stPuzzleInfo.UpdatedNum = UpdatedNum;
        // End:0x144
        if(int(IsComplete) == 1)
        {
            // End:0xCC
            if(PaidItemStackCount == 0)
            {
                GameMgr.RemoveInstanceItem(PaidItemIdx);                
            }
            else
            {
                GameMgr.ChangeInstance_StackCount(PaidItemIdx, PaidItemStackCount);
            }
            GameMgr.UpdateItemList(GameMgr);
            i = 0;
            J0x104:

            // End:0x141 [Loop If]
            if(i < UpdatedNum.Length)
            {
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 77, string(UpdatedNum[i]));
                i++;
                // [Loop Continue]
                goto J0x104;
            }            
        }
        else
        {
            // End:0x1F0
            if((RewardItemID != 0) && RewardItemCount != 0)
            {
                page_Main.TcpChannel.sfReqItemList(MM.kUID);
                BTWindowBTTPQuestInfoHK(Controller.TopPage()).QuestInfo.DailyQuest.SetVisiblePuzzlePiece();
                ItemInfo = GameMgr.FindUIItem(RewardItemID);
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 79, ItemInfo.ItemName);
            }
        }        
    }
    else
    {
        // End:0x219
        if(int(IsComplete) == 1)
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return false;
    //return;    
}

function bool rfAckDailyRewardListThisMonth(array<byte> Type, array<byte> Number, array<int> ItemID, array<int> ItemCount)
{
    MM.stDailyRewardItemInfo.Type = Type;
    MM.stDailyRewardItemInfo.Number = Number;
    MM.stDailyRewardItemInfo.ItemID = ItemID;
    MM.stDailyRewardItemInfo.ItemCount = ItemCount;
    return false;
    //return;    
}

function bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount)
{
    local wItemBoxHK ItemInfo;
    local int i;

    // End:0x133
    if(Result == 0)
    {
        // End:0x130
        if((RewardItemID != 0) && RewardItemCount != 0)
        {
            BTWindowBTTPQuestInfoHK(Controller.TopPage()).QuestInfo.SpecialQuest.BtnReceiveReward.SetEnabled(false);
            ItemInfo = GameMgr.FindUIItem(RewardItemID);
            page_Main.TcpChannel.sfReqItemList(MM.kUID);
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 79, ItemInfo.ItemName);
            i = 0;
            J0xC8:

            // End:0x130 [Loop If]
            if(i < MM.QuestList.Length)
            {
                // End:0x126
                if(MM.QuestList[i].QuestID == RewardedQuestID)
                {
                    MM.QuestList[i].IsComplete = RewardedQuestIsComplete;
                    // [Explicit Break]
                    goto J0x130;
                }
                i++;
                // [Loop Continue]
                goto J0xC8;
            }
        }
        J0x130:
        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return false;
    //return;    
}

function bool rfAckSpecialQuestRank(array<string> CharList)
{
    local string strSpecialUser;

    MM.SpecialQuestRankList.Length = 0;
    MM.SpecialQuestRankList = CharList;
    // End:0x71
    if(CharList.Length > 0)
    {
        strSpecialUser = Class'Engine.BTCustomDrawHK'.static.FormatString(strSpecialCompleteUser, CharList[CharList.Length - 1]);
        page_Main.AddChatLog(strSpecialUser, 7, true);
    }
    return false;
    //return;    
}

function bool rfReqAddSpecialRank(string NickName)
{
    local string strSpecialUser;
    local array<string> SpecialNewList;
    local int i;

    // End:0xEE
    if(NickName != "")
    {
        strSpecialUser = Class'Engine.BTCustomDrawHK'.static.FormatString(strSpecialCompleteUser, NickName);
        page_Main.AddChatLog(strSpecialUser, 7, true);
        // End:0xC7
        if(MM.SpecialQuestRankList.Length >= 10)
        {
            i = 0;
            J0x5F:

            // End:0xB3 [Loop If]
            if(i <= MM.SpecialQuestRankList.Length)
            {
                // End:0x86
                if(i == 0)
                {
                    // [Explicit Continue]
                    goto J0xA9;
                }
                SpecialNewList[i - 1] = MM.SpecialQuestRankList[i];
                J0xA9:

                ++i;
                // [Loop Continue]
                goto J0x5F;
            }
            MM.SpecialQuestRankList = SpecialNewList;
        }
        MM.SpecialQuestRankList[MM.SpecialQuestRankList.Length - 1] = NickName;
    }
    return true;
    //return;    
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    local string ItemName, Receiver;

    Log("[BTPageServerSelection::rfAckSendGift] Result=" $ string(Result));
    // End:0x7A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls.BTWindowSendPresentHK');
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = PointRemain;
    MM.UpdateMoneyInfo(MM);
    Receiver = BTWindowSendPresentHK(Controller.TopPage()).EditReceiveUser.TextStr;
    ItemName = BTWindowSendPresentHK(Controller.TopPage()).itemBox.itemBox.ItemInfo.ItemName;
    Class'GUIWarfareControls.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls.BTWindowSendPresentHK');
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 123, Receiver, ItemName);
    return true;
    //return;    
}

function bool rfAckPcBangItemList(array<int> ItemTID, array<int> PartID)
{
    local int lp1;
    local wItemBoxHK ItemInfo;

    Log("[BTPageServerSelection::rfAckPcBangItemList]");
    lp1 = 0;
    J0x37:

    // End:0xD5 [Loop If]
    if(lp1 < ItemTID.Length)
    {
        // End:0xCB
        if(!GameMgr.AddInstanceItemByItemID(ItemTID[lp1], PartID[lp1]))
        {
            Log(("[BTPageServerSelection::rfAckPcBangItemList] ItemID : " $ string(ItemTID[lp1])) $ " Find Fail");
            // [Explicit Continue]
        }
        ++lp1;
        // [Loop Continue]
        goto J0x37;
    }
    return true;
    //return;    
}

defaultproperties
{
    RefreshCycleTime=20.0000000
    fbLabelBackground=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=758.0000000)
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    // Reference: TabControlMocker'GUIWarfare_Decompressed.BTPageServerSelection.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls.TabControlMocker
        OnVisiblePanelChanged=BTPageServerSelection.OnVisibleChannelListChanged
    end object
    TabControl=mTabControl
    // Reference: BTTPTopMenuSCHK'GUIWarfare_Decompressed.BTPageServerSelection.mTPTopMenu'
    begin object name="mTPTopMenu" class=GUIWarfareControls.BTTPTopMenuSCHK
        bUseAWinPos=true
        AWinPos=(X1=454.0000000,Y1=0.0000000,X2=1016.0000000,Y2=70.0000000)
    end object
    TPTopMenu=mTPTopMenu
    strButtonCredit="Creators"
    strPCBangFriend="PC Cafe Friend"
    HashMessage="Invalid protocol version. Please update."
    strCW_GameMode="Regular Clan Battle"
    strLotteryWinner="Congratulations! %0 has received %1!"
    strSpecialCompleteUser="Congratulations! %0 has completed the Special Mission!"
    fbChannelBg=(X1=656.0000000,Y1=93.0000000,X2=1023.0000000,Y2=448.0000000)
    nIndexDefSrv=-1
    nIndexDefCh=-1
    fbLabelRoomName=(X1=10.0000000,Y1=15.0000000,X2=397.0000000,Y2=63.0000000)
    fbLabelBottomLine=(X1=0.0000000,Y1=736.0000000,X2=1024.0000000,Y2=768.0000000)
    fbAdvertise[0]=(X1=667.0000000,Y1=475.0000000,X2=1008.0000000,Y2=735.0000000)
    fbAdvertise[1]=(X1=6.0000000,Y1=114.0000000,X2=318.0000000,Y2=730.0000000)
    AdvertiseURL[0]="http://image.webzen.net/AC/banner/serverBanner.html"
    AdvertiseURL[1]="http://image.webzen.net/AC/banner/serverBanner_2.html"
    OnPreDraw=BTPageServerSelection.Internal_OnPreDraw
}