class BTPageServerSelectionCN extends BTPageServerSelection
    editinlinenew
    instanced;

var() automated FloatBox fbLabelBackgrounddeco;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var export editinline BTOwnerDrawImageHK BGImageTotalServer;
var export editinline BTOwnerDrawImageHK CategorySvrChr[6];
var localized string strCategory[6];
var() automated FloatBox fbCategoryPos[6];
var export editinline BTOwnerDrawImageHK ChannelBg;
var() automated FloatBox fbChannelBg;
var localized string strEnterCh;
var bool bDefaultServnChannel;
var int nIndexDefSrv;
var int nIndexDefCh;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0xEC
            break;
        // End:0x2E
        case 1:
            // End:0xEC
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
            // End:0xEC
            break;
        // End:0x88
        case 3:
            // End:0xEC
            break;
        // End:0x9F
        case 4:
            page_Main.ShowHelpWindow();
            // End:0xEC
            break;
        // End:0xDB
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0xEC
            break;
        // End:0xE9
        case 6:
            OpenTodayResultPage();
            // End:0xEC
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;
    local BTAutoColumnListDataHK row;
    local int i;

    bSkipInitializeDefaultPage = true;
    super(BTNetGUIPageHK).InitComponent(MyController, myOwner);
    LabelBackground = NewLabelComponent(fbLabelBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_back1, 0.0001000);
    LabelTopLine = NewLabelComponent(fbLabelTopLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_top_default, 0.0001300);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_serverchannel_bgdeco, 0.5000000);
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
    // End:0x1BA
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {        
    }
    else
    {
        page_Main.DefaultLobbyBGM = "bgm_lobby_part" $ string(int((float(page_Main.GameRunningCount) % float(2)) + float(1)));
        page_Main.LastMainPageBGM = page_Main.DefaultLobbyBGM;
        PlayerOwner().Player.Console.SetOneBGM(page_Main.DefaultLobbyBGM);
    }
    ChannelAD = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(663.0000000, 472.0000000, 1012.0000000, 738.0000000));
    ChannelAD.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad3;
    ChannelAD.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad3;
    ChannelAD.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad3;
    ChannelAD.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad3;
    ChannelAD.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad3;
    ChannelAD.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad3;
    ChannelAD.Caption = "";
    ChannelAD.__OnClick__Delegate = AD_OnClick;
    ButtonEnterCh = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(847.0000000, 403.0000000, 971.0000000, 440.0000000));
    ButtonEnterCh.SetDefaultFontColor();
    ButtonEnterCh.Caption = strEnterCh;
    ButtonEnterCh.__OnClick__Delegate = ButtonEnterCh_OnClick;
    ButtonEnterCh.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonEnterCh.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ServerSelPageBtn_on;
    ButtonEnterCh.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonEnterCh.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ServerSelPageBtn_block;
    ServerList = new Class'GUIWarfareControls.BTACLGroutSelection';
    ServerList.bUseAWinPos = true;
    fb.X1 = 12.0000000;
    fb.Y1 = 114.0000000;
    fb.X2 = 629.0000000;
    fb.Y2 = 730.0000000;
    ServerList.AWinPos = fb;
    ServerList.RenderWeight = 0.2000000;
    ServerList.InitComponent(Controller, self);
    AppendComponent(ServerList);
    ServerList.MultiColumnList.MyScrollBar.Step = 2;
    ServerList.MultiColumnList.NoVisibleCols = 2;
    ServerList.MultiColumnList.NoVisibleRows = 22;
    ChannelList = new Class'GUIWarfareControls.BTACLServerSelectionHK';
    ChannelList.bUseAWinPos = true;
    fb.X1 = 664.0000000;
    fb.Y1 = 114.0000000;
    fb.X2 = 1000.0000000;
    fb.Y2 = 394.0000000;
    ChannelList.AWinPos = fb;
    ChannelList.RenderWeight = 0.2000000;
    ChannelList.InitComponent(Controller, self);
    AppendComponent(ChannelList);
    ChannelBg = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    ChannelBg.bUseAWinPos = true;
    ChannelBg.AWinPos = fbChannelBg;
    ChannelBg.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ChannelBgBeginner;
    ChannelBg.InitComponent(Controller, self);
    ChannelBg.CaptionDrawType = 3;
    AppendComponent(ChannelBg);
    i = 0;
    J0x66A:

    // End:0x850 [Loop If]
    if(i < 6)
    {
        CategorySvrChr[i] = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
        CategorySvrChr[i].bUseAWinPos = true;
        CategorySvrChr[i].AWinPos = fbCategoryPos[i];
        CategorySvrChr[i].BackgroundImage.Image = none;
        CategorySvrChr[i].SetFontSizeAll(8);
        CategorySvrChr[i].FontStyle[0] = 9;
        CategorySvrChr[i].FontStyle[1] = 9;
        CategorySvrChr[i].FontStyle[2] = 9;
        CategorySvrChr[i].FontStyle[3] = 9;
        CategorySvrChr[i].FontStyle[4] = 9;
        // End:0x7B3
        if(i < 4)
        {
            CategorySvrChr[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(105, 105, 105, byte(255));            
        }
        else
        {
            CategorySvrChr[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(204, 204, 204, byte(255));
        }
        CategorySvrChr[i].InitComponent(Controller, self);
        CategorySvrChr[i].Caption = strCategory[i];
        CategorySvrChr[i].CaptionDrawType = 3;
        AppendComponent(CategorySvrChr[i]);
        i++;
        // [Loop Continue]
        goto J0x66A;
    }
    page_Main.bFirstLogin = true;
    //return;    
}

function bool BTWIndowTodayResultHK_OnOK(GUIComponent Sender)
{
    page_Main.TcpLogin.sfReqLogOut(1);
    BTWindowTodayResultHK(Controller.TopPage()).FadeOut();
    return true;
    //return;    
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log((("[BTPageServerSelectionCN::rfAckLogOut] Result=" $ string(Result)) $ " Reason=") $ string(Reason));
    // End:0x65
    if(int(Reason) == 1)
    {
        ExitGame();
        return true;
    }
    // End:0xA2
    if(int(Reason) == 4)
    {
        page_Main.HaltNetwork();
        page_Main.Controller.ConsoleCommand("exit");
        return true;
    }
    // End:0x14F
    if(int(Reason) == 3)
    {
        Log(((("[BTPageServerSelectionCN::rfAckLogOut] page_Main.LoginToChannel( " $ page_Main.szLoginServerIP) $ ", ") $ string(page_Main.szLoginServerPort)) $ ")");
        page_Main.ChannelToLogin(page_Main.szLoginServerIP, page_Main.szLoginServerPort);
        return true;
    }
    page_Main.pwm.CloseAndClear();
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.LoginToChannel(ConnectingChannel.IP, ConnectingChannel.Port, ConnectingChannel.DataPort);
    return true;
    //return;    
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

function OnCompleteOpened()
{
    Log("[BTPageServerSelectionCN::OnCompleteOpened]");
    currentBGM = page_Main.DefaultLobbyBGM;
    page_Main.LastMainPageBGM = currentBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    RefreshPage();
    // End:0xAB
    if(page_Main.bAutoMove)
    {
        Class'GUIWarfareControls.BTWindowAutoStateHK'.static.ShowState(Controller, 1);        
    }
    else
    {
        // End:0xE6
        if(page_Main.bConnectedLoginServer == true)
        {
            page_Main.TcpLogin.sfReqCharInfo(MM.kUserName);
        }
    }
    //return;    
}

function AutoMoveTochannel(int ServerID, int ChannelID)
{
    local int i;

    Log("[BTPageServerSelectionCN::AutoMoveTochannel]");
    i = page_Main.FindServerConnectionInfoIndex(ServerID, ChannelID);
    // End:0x6B
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
    MM.PI_EnterChannel(page_Main.SCIList[i].ServerGroupID, page_Main.SCIList[i].ServerGroupName, page_Main.SCIList[i].ServerID, page_Main.SCIList[i].ServerName, page_Main.SCIList[i].ChannelID, page_Main.SCIList[i].ChannelName, page_Main.SCIList[i].IsClanChannel > 0, page_Main.SCIList[i].IsPracticeChannel, page_Main.SCIList[i].IsDedicatedServer);
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

    Log("[BTPageServerSelectionCN::MoveToChannel]");
    Index = serverACL.GetCurrentIndex();
    Log(((("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex())) $ ", ChannelIndex = ") $ string(Index)) $ ")");
    // End:0xD3
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xEF
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x16C
    if(((int(MM.GMLevelFlag) & 3) == 0) && row.DataPerColumn[1].IntValue >= row.DataPerColumn[1].tempValue)
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
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsPracticeChannel, page_Main.SCIList[Index].IsDedicatedServer);
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
    //return;    
}

function NewMoveToChannelByClick(BTACLServerSelectionHK serverACL)
{
    local int Index;
    local BTAutoColumnListDataHK row;

    Log("[BTPageServerSelectionCN::MoveToChannel]");
    Index = serverACL.LastSelectedIndexHistory;
    Log(((("UI List (ServerIndex = " $ string(TabControl.GetCurrentTabIndex())) $ ", ChannelIndex = ") $ string(Index)) $ ")");
    // End:0xD2
    if(Index < 0)
    {
        Log("Stop MoveToChannel, ServerACL Selected Index < 0");
        return;
    }
    // End:0xEE
    if(BTWindowDefineStateHK(Controller.TopPage()) != none)
    {
        return;
    }
    row = serverACL.GetRowByIndex(Index);
    // End:0x12D
    if(row == none)
    {
        row = ChannelList.GetRowByIndex(nIndexDefCh);
    }
    // End:0x150
    if(row == none)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 197);
        return;
    }
    // End:0x1B3
    if(((int(MM.GMLevelFlag) & 3) == 0) && row.DataPerColumn[1].IntValue >= row.DataPerColumn[1].tempValue)
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
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsPracticeChannel, page_Main.SCIList[Index].IsDedicatedServer);
    Log(((((("page_Main.LoginToChannel( " $ ConnectingChannel.IP) $ ", ") $ string(ConnectingChannel.Port)) $ " , ") $ string(ConnectingChannel.DataPort)) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
    //return;    
}

function DefaultSvrnChSelect()
{
    local int i, j;
    local BTAutoColumnListDataHK Split, row, temp;

    ServerList.bActiveCursor = true;
    ServerList.MultiColumnList.LastSelected = 0;
    ServerList.MultiColumnList.bMousePress = true;
    Split = ServerList.GetRowByIndex(ServerList.MultiColumnList.LastSelected);
    ChannelList.RemoveAll();
    i = 0;
    J0x86:

    // End:0x3CF [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3C5
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.newlist_Channel_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            // End:0x1BC
            if(row.DataPerColumn[0].strValue == "")
            {
                // [Explicit Continue]
                goto J0x3C5;
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
        }
        J0x3C5:

        i++;
        // [Loop Continue]
        goto J0x86;
    }
    ChannelList.MultiColumnList.LastSelected = 0;
    j = 0;
    J0x3EF:

    // End:0x486 [Loop If]
    if(j < ChannelList.ACLRowList.Length)
    {
        temp = ChannelList.ACLRowList[j];
        // End:0x47C
        if(float(temp.DataPerColumn[1].IntValue) < (float(temp.DataPerColumn[1].tempValue) * 0.9000000))
        {
            ChannelList.MultiColumnList.LastSelected = j;
            // [Explicit Break]
            goto J0x486;
        }
        j++;
        // [Loop Continue]
        goto J0x3EF;
    }
    J0x486:

    ChannelList.bActiveCursor = true;
    ChannelList.MultiColumnList.bMousePress = true;
    bDefaultServnChannel = false;
    nIndexDefSrv = ServerList.MultiColumnList.LastSelected;
    nIndexDefCh = ChannelList.MultiColumnList.LastSelected;
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

    // End:0x49E [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x494
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
                goto J0x494;
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
        }
        J0x494:

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

    // End:0x3B5 [Loop If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3AB
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
    MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].IsPracticeChannel, page_Main.SCIList[Index].IsDedicatedServer);
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
    local BTAutoColumnListDataHK row, Split;
    local export editinline BTACLServerSelectionHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, j, k, L, nIndex;

    local array<byte> CurrentOption_Byte_Key, CurrentOption_Byte_Value, CurrentOption_Int_Key;
    local array<int> CurrentOption_Int_Value;
    local array<byte> CurrentOption_Float_Key;
    local array<float> CurrentOption_Float_Value;
    local int ocount_byte_length, ocount_byte_index, ocount_int_length, ocount_int_index, ocount_float_length, ocount_float_index;

    local byte CheckPracticeChannel[7];
    local bool IsPracticeChannel;
    local array<string> distinctiveServerNames, distinctiveChannelNames, distIPs;
    local array<int> distPorts;
    local bool foundDuplicate;
    local array<int> arMaxuser, arCurUser, arServerGroupID, arServerDispOrder;
    local int nMaxUser, nCurUser;

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

    // End:0x5A0 [Loop If]
    if(i < distinctiveServerNames.Length)
    {
        row = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
        row.Init(7);
        row.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.newlist_serv_n;
        row.DataPerColumn[0].ServerGroupImg = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ServerGroup[0];
        row.DataPerColumn[2].IntValue = arCurUser[i];
        row.DataPerColumn[2].tempValue = arMaxuser[i];
        row.DataPerColumn[1].IntValue = int((float(row.DataPerColumn[2].IntValue) / float(row.DataPerColumn[2].tempValue)) * float(100));
        row.DataPerColumn[1].strValue = distinctiveChannelNames[i];
        row.DataPerColumn[3].strValue = distinctiveChannelNames[i];
        row.DataPerColumn[3].IntValue = arServerGroupID[i];
        row.DataPerColumn[3].tempValue = arServerDispOrder[i];
        row.DataPerColumn[4].IntValue = DataPort[i];
        row.DataPerColumn[5].strValue = distIPs[i];
        row.DataPerColumn[5].IntValue = distPorts[i];
        row.DataPerColumn[6].IntValue = int(IsClanChannel[i]);
        // End:0x582
        if(IsPracticeChannel)
        {
            row.DataPerColumn[6].tempValue = 1;
        }
        ServerList.AddRow(row);
        i++;
        // [Loop Continue]
        goto J0x349;
    }
    page_Main.ClearServerChannelList();
    ocount_byte_index = 0;
    i = 0;
    J0x5BD:

    // End:0xA3C [Loop If]
    if(i < CServername.Length)
    {
        ocount_byte_length = int(OptionCount_byte[i]);
        ocount_int_length = int(OptionCount_int[i]);
        ocount_float_length = int(OptionCount_float[i]);
        CurrentOption_Byte_Key.Length = ocount_byte_length;
        CurrentOption_Byte_Value.Length = ocount_byte_length;
        CurrentOption_Int_Key.Length = ocount_int_length;
        CurrentOption_Int_Value.Length = ocount_int_length;
        CurrentOption_Float_Key.Length = ocount_float_length;
        CurrentOption_Float_Value.Length = ocount_float_length;
        k = 0;
        J0x655:

        // End:0x76A [Loop If]
        if(k < ocount_byte_length)
        {
            // End:0x68E
            if(OptionKey_byte.Length > 0)
            {
                CurrentOption_Byte_Key[k] = OptionKey_byte[k + ocount_byte_index];
            }
            // End:0x6B8
            if(OptionValue_byte.Length > 0)
            {
                CurrentOption_Byte_Value[k] = OptionValue_byte[k + ocount_byte_index];
            }
            // End:0x6E2
            if(OptionKey_int.Length > 0)
            {
                CurrentOption_Int_Key[k] = OptionKey_int[k + ocount_byte_index];
            }
            // End:0x70C
            if(OptionValue_int.Length > 0)
            {
                CurrentOption_Int_Value[k] = OptionValue_int[k + ocount_byte_index];
            }
            // End:0x736
            if(OptionKey_float.Length > 0)
            {
                CurrentOption_Float_Key[k] = OptionKey_float[k + ocount_byte_index];
            }
            // End:0x760
            if(OptionValue_float.Length > 0)
            {
                CurrentOption_Float_Value[k] = OptionValue_float[k + ocount_byte_index];
            }
            k++;
            // [Loop Continue]
            goto J0x655;
        }
        ocount_byte_index += ocount_byte_length;
        k = 0;
        J0x77D:

        // End:0x7A1 [Loop If]
        if(k < 7)
        {
            CheckPracticeChannel[k] = 0;
            k++;
            // [Loop Continue]
            goto J0x77D;
        }
        k = 0;
        J0x7A8:

        // End:0x92E [Loop If]
        if(k < ocount_byte_length)
        {
            // End:0x7EA
            if(int(CurrentOption_Byte_Key[k]) == 0)
            {
                // End:0x7E7
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[0] = 1;
                }
                // [Explicit Continue]
                goto J0x924;
            }
            // End:0x81E
            if(int(CurrentOption_Byte_Key[k]) == 2)
            {
                // End:0x81B
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[1] = 1;
                }
                // [Explicit Continue]
                goto J0x924;
            }
            // End:0x853
            if(int(CurrentOption_Byte_Key[k]) == 3)
            {
                // End:0x850
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[2] = 1;
                }
                // [Explicit Continue]
                goto J0x924;
            }
            // End:0x888
            if(int(CurrentOption_Byte_Key[k]) == 4)
            {
                // End:0x885
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[3] = 1;
                }
                // [Explicit Continue]
                goto J0x924;
            }
            // End:0x8BD
            if(int(CurrentOption_Byte_Key[k]) == 5)
            {
                // End:0x8BA
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[4] = 1;
                }
                // [Explicit Continue]
                goto J0x924;
            }
            // End:0x8F2
            if(int(CurrentOption_Byte_Key[k]) == 6)
            {
                // End:0x8EF
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[5] = 1;
                }
                // [Explicit Continue]
                goto J0x924;
            }
            // End:0x924
            if(int(CurrentOption_Byte_Key[k]) == 7)
            {
                // End:0x924
                if(int(CurrentOption_Byte_Value[k]) > 0)
                {
                    CheckPracticeChannel[6] = 1;
                }
            }
            J0x924:

            k++;
            // [Loop Continue]
            goto J0x7A8;
        }
        IsPracticeChannel = true;
        k = 0;
        J0x93D:

        // End:0x971 [Loop If]
        if(k < 7)
        {
            // End:0x967
            if(int(CheckPracticeChannel[k]) == 0)
            {
                IsPracticeChannel = false;
                // [Explicit Break]
                goto J0x971;
            }
            k++;
            // [Loop Continue]
            goto J0x93D;
        }
        J0x971:

        page_Main.AddServerChannelList(ServerDispOrder[i], ChannelNum[i], ServerIP[i], serverPort[i], DataPort[i], CServername[i], CServerShortName[i], ChannelName[i], ServerGroupID[i], ServerGroupName[i], int(IsClanChannel[i]), ChannelNickName[i], IsPracticeChannel, int(IsUseDedicateHost[i]) > 0, chCurUser[i], chMaxUser[i]);
        i++;
        // [Loop Continue]
        goto J0x5BD;
    }
    TabControl.SetVisiblePanel(SaveServerListIndex);
    // End:0xA7C
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

function bool rfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec)
{
    Log((((((("[BTPageServerSelection::rfAckTencent_AASInfo] " $ string(UserID)) $ " ") $ string(IsAdult)) $ " ") $ string(IsQQAuth)) $ " ") $ string(AccumTimeSec));
    // End:0xBC
    if((1 == int(IsAdult)) && 1 == int(IsQQAuth))
    {
        Log("[BTPageServerSelection::rfAckTencent_AASInfo] No AAS ");
        return true;
    }
    // End:0xDF
    if(0 == int(IsQQAuth))
    {
        page_Main.SetAASMessage(0, AccumTimeSec);
    }
    page_Main.SetAASMessage(1, AccumTimeSec);
    return true;
    //return;    
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    local BtrTime tCurr, tPrev, t;
    local int Day;
    local BtrDouble B;

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

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    local int sciindex;
    local GameModeInfo gmi;
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserServerName=" $ InviteUserServerName);
    // End:0xFC
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        PlayerOwner().dblog((("[BTPageServerSelection::rfReqRecvInviteGameRoom] InviteUserChannelNumber=" $ string(InviteUserChannelNumber)) $ ", RoomNumber=") $ string(RoomNumber));
    }
    // End:0x340
    if(page_Main.IsGameReadyOrPlaying() == false)
    {
        sciindex = page_Main.FindServerConnectionInfoIndex(InviteUserServerID, InviteUserChannelNumber);
        // End:0x15B
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

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    return true;
    //return;    
}

function bool rfReqAnswerInviteGameRoom(byte Answer, string GuestCharName)
{
    Log((("[BTPageServerSelection::rfReqAnswerInviteGameRoom] Answer=" $ string(Answer)) $ ", GuestCharName=") $ GuestCharName);
    switch(Answer)
    {
        // End:0x99
        case 0:
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(129, GuestCharName), 5, true);
            // End:0x12C
            break;
        // End:0xC9
        case 1:
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(130, GuestCharName), 5, true);
            // End:0x12C
            break;
        // End:0xF9
        case 2:
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(131, GuestCharName), 5, true);
            // End:0x12C
            break;
        // End:0x129
        case 3:
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(132, GuestCharName), 5, true);
            // End:0x12C
            break;
        // End:0xFFFF
        default:
            break;
    }
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
    local GameModeInfo gmi;
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

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest)
{
    local int i;

    Log("[BTPageServerSelection::rfAckQuestList] QuestID.Length=" $ string(QuestID.Length));
    i = 0;
    J0x4C:

    // End:0xEC [Loop If]
    if(i < QuestID.Length)
    {
        MM.QuestList.Length = MM.QuestList.Length + 1;
        MM.QuestList[MM.QuestList.Length - 1].QuestID = QuestID[i];
        MM.QuestList[MM.QuestList.Length - 1].CurrentProgress = CountPrograss[i];
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
    // End:0x3C0
    if((MM.CompletedQuestList.Length > 0) || MM.NewQuestList.Length > 0)
    {
        page_Main.bNewAvailableQuest = true;        
    }
    else
    {
        page_Main.bNewAvailableQuest = false;
    }
    i = 0;
    J0x3D8:

    // End:0x455 [Loop If]
    if(i < AchivedQuestID.Length)
    {
        q = GameMgr.GetQuestInfo(AchivedQuestID[i]);
        RewardPoint += q.RewardPoint;
        RewardItemID += q.RewardItemID[0];
        RewardItemID += q.RewardItemID[1];
        i++;
        // [Loop Continue]
        goto J0x3D8;
    }
    // End:0x48D
    if(RewardPoint > 0)
    {
        MM.kPoint += RewardPoint;
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x4BA
    if(RewardItemID > 0)
    {
        MM.kNeedUpdateItemList = true;
        MM.kNeedUpdateSkillList = true;
    }
    MM.RemoveQuestArray(AchivedQuestID);
    MM.RemoveQuestArray(ExpiredQuest);
    MM.AddQuestArray(NewQuestID);
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

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble Cash)
{
    Log("[BTPageServerSelection::rfAckWebzenCash]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kCash = Class'Engine.BTCustomDrawHK'.static.__NFUN_923__(Cash);
    Log("[BTPageServerSelection::rfAckWebzenCash] Cash=" $ string(MM.kCash));
    MM.UpdateMoneyInfo(MM);
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

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log((((("[BTPageInventory::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year)) $ " YearId=") $ string(YearId)) $ " SalesZoneCode=") $ string(SalesZoneCode));
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
    // End:0x12A
    if((MM.kIsRegisteredPCBang > 0) && MM.kIsPaidPCBang == 1)
    {
        page_Main.TcpChannel.sfReqPCBangUserList();
    }
    //return;    
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckCharInfo] CharName=" $ CharName);
    // End:0x700
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
        // End:0x5BC
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

function bool rfReqIsPaidWebzenPCBang(byte IsPaid)
{
    local export editinline BTWindowDefineInfoHK BTWindow;

    Log("[BTPageServerSelection::rfReqIsPaidWebzenPCBang] IsPaid=" $ string(IsPaid));
    PlayerOwner().dblog("[BTPageServerSelection::rfReqIsPaidWebzenPCBang] IsPaid=" $ string(IsPaid));
    // End:0x259
    if(MM.kIsRegisteredPCBang > 0)
    {
        // End:0x1A8
        if(int(IsPaid) == 1)
        {
            // End:0x144
            if(MM.InGamePlaying)
            {
                page_Main.pwm.CreateAndPush(10, "GUIWarfareControls.BTWindowDefineInfoHK");
                BTWindow = BTWindowDefineInfoHK(page_Main.pwm.Last(10));
                BTWindow.SetContentText_Instance(179);                
            }
            else
            {
                // End:0x182
                if(MM.kIsPaidPCBang == -1)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(178), 5, true);                    
                }
                else
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(179), 5, true);
                }
            }            
        }
        else
        {
            // End:0x236
            if(MM.InGamePlaying)
            {
                page_Main.pwm.CreateAndPush(10, "GUIWarfareControls.BTWindowDefineInfoHK");
                BTWindow = BTWindowDefineInfoHK(page_Main.pwm.Last(10));
                BTWindow.SetContentText_Instance(177);                
            }
            else
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(177), 5, true);
            }
        }
    }
    MM.kIsPaidPCBang = int(IsPaid);
    MM.kRecvPaidPCBangInfo = true;
    MM.UpdatePCBangInfo(MM);
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

    // End:0xE3 [Loop If]
    if(i < Level.Length)
    {
        MM.AddClanList(CharName[i], byte(DudeId[i] != 0), Level[i], int(ClanGrade[i]), ClanWinCnt[i], ClanLoseCnt[i], LevelMarkID[i], TitleMarkID[i]);
        i++;
        // [Loop Continue]
        goto J0x5B;
    }
    // End:0x11D
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

    // End:0xA6 [Loop If]
    if(i < FriendName.Length)
    {
        i++;
        // [Loop Continue]
        goto J0x8C;
    }
    // End:0xE0
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

function bool BTWindowRandBoxHK_OnOK(GUIComponent Sender)
{
    local int i;
    local export editinline BTWindowRandBoxHK BTWindow;
    local wItemBoxHK ItemInfo;

    BTWindow = BTWindowRandBoxHK(Controller.TopPage());
    i = 0;
    J0x21:

    // End:0x187 [Loop If]
    if(i < BTWindow.ItemIDChoose.Length)
    {
        ItemInfo = GameMgr.FindUIItem(BTWindow.ItemIDChoose[i]);
        // End:0xFF
        if(ItemInfo.ItemType == 22)
        {
            GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], __NFUN_921__(0), __NFUN_923__(BTWindow.ItemIdx[i]), 13, 1, 100000, BTWindow.PartIDChoose[i], 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
            // [Explicit Continue]
            goto J0x17D;
        }
        GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], BTWindow.ItemIdx[i], 0, 13, 1, 100000, BTWindow.PartIDChoose[i], 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
        J0x17D:

        i++;
        // [Loop Continue]
        goto J0x21;
    }
    GameMgr.UpdateItemList(GameMgr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    local int i, GetItemCount;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<int> CandidateItemIDs, CandidatePartIDs;
    local export editinline BTWindowRandBoxHK BTWindow;
    local BtrTime TestTime;

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
    Controller.OpenMenu("GUIWarfareControls.BTWindowRandBoxHK");
    BTWindow = BTWindowRandBoxHK(Controller.TopPage());
    BTWindow.__OnOK__Delegate = BTWindowRandBoxHK_OnOK;
    BTWindow.TopLine.Caption = ItemInfo.ItemName;
    GetItemCount = GameMgr.GetRandBoxItemsCount(instanceInfo.ItemID);
    BTWindow.SetItemCount(GetItemCount);
    PlayerOwner().dblog("== Random Box =======");
    PlayerOwner().dblog("Used Item=" $ ItemInfo.ItemName);
    i = 0;
    J0x1C4:

    // End:0x3CA [Loop If]
    if(i < GetItemCount)
    {
        GameMgr.GetRandBoxItems(instanceInfo.ItemID, i + 1, CandidateItemIDs, CandidatePartIDs);
        BTWindow.SetCandidateItems(i, CandidateItemIDs, CandidatePartIDs);
        // End:0x24F
        if(i >= ItemIDChoose.Length)
        {
            BTWindow.SetAcquireItem(i, 0, 0, EmptyBtrDouble());
            // [Explicit Continue]
            goto J0x3C0;
        }
        ItemInfo = GameMgr.FindUIItem(ItemIDChoose[i]);
        PlayerOwner().dblog((((("AcquireItem ItemName=" $ ItemInfo.ItemName) $ ", ItemID=") $ string(ItemIDChoose[i])) $ ", PartID=") $ string(PartIDChoose[i]));
        // End:0x33E
        if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
        {
            BTWindow.SetAcquireItem(i, ItemIDChoose[i], PeriodOnChoosenItem[i], ItemIdx[i]);
            // [Explicit Continue]
            goto J0x3C0;
        }
        // End:0x38B
        if(ItemInfo.CostType == 3)
        {
            BTWindow.SetAcquireItem(i, ItemIDChoose[i], StackCountOnChoosenItem[i], ItemIdx[i]);
            // [Explicit Continue]
            goto J0x3C0;
        }
        BTWindow.SetAcquireItem(i, ItemIDChoose[i], PartIDChoose[i], ItemIdx[i]);
        J0x3C0:

        i++;
        // [Loop Continue]
        goto J0x1C4;
    }
    PlayerOwner().dblog("=====================");
    BTWindow.ItemIDChoose.Length = ItemIDChoose.Length;
    BTWindow.ItemIdx.Length = ItemIdx.Length;
    BTWindow.PartIDChoose.Length = PartIDChoose.Length;
    BTWindow.StackCount.Length = StackCount.Length;
    BTWindow.UntilTime.Length = UntilTime.Length;
    i = 0;
    J0x463:

    // End:0x51D [Loop If]
    if(i < ItemIDChoose.Length)
    {
        BTWindow.ItemIDChoose[i] = ItemIDChoose[i];
        BTWindow.ItemIdx[i] = ItemIdx[i];
        BTWindow.PartIDChoose[i] = PartIDChoose[i];
        BTWindow.StackCount[i] = StackCount[i];
        BTWindow.UntilTime[i] = UntilTime[i];
        i++;
        // [Loop Continue]
        goto J0x463;
    }
    // End:0x53F
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
    Log("[BTPageServerSelection::rfAckEquipItem] Result=" $ string(Result));
    // End:0x62
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x8C
    if(__NFUN_913__(ChangedOldUniqueID, EmptyBtrDouble()))
    {
        GameMgr.ChangeInstance_ItemSlotPos(ChangedOldUniqueID, ChangedOldSlotPosition);
    }
    // End:0xB6
    if(__NFUN_913__(ChangedNewUniqueID, EmptyBtrDouble()))
    {
        GameMgr.ChangeInstance_ItemSlotPos(ChangedNewUniqueID, ChangedNewSlotPosition);
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
    local export editinline BTWindowDefineARHK BTWindow;

    Log((((((("[BTPageServerSelection::rfAckWebzenBillingUseStorageItem] Result=" $ string(Result)) $ ", ItemIdx=") $ __NFUN_918__(ItemIdx)) $ ", ItemID=") $ string(ItemID)) $ ", ItemExtra=") $ __NFUN_918__(ItemExtra));
    // End:0xBC
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x1F9
    if(ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID);
        // End:0x1F9
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
                // End:0x194
                if(ItemInfo.CostType == 1)
                {
                    GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, 1, 0, ItemExtra);                    
                }
                else
                {
                    // End:0x1E1
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
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
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

function bool rfAckPaidItem_NotifyChangeClanMark(int Pattern, int BG, int BL)
{
    local int i;

    Log((((("[BTPageServerSelection::rfAckPaidItem_NotifyChangeClanMark] Pattern=" $ string(Pattern)) $ ", BG=") $ string(BG)) $ ", BL=") $ string(BL));
    MM.kClanPattern = Pattern;
    MM.kClanBG = BG;
    MM.kClanBL = BL;
    GameMgr.cmm.AddClanMark(MM.kClanName, Pattern, BG, BL);
    MM.UpdateCharInfo(MM);
    i = 0;
    J0x105:

    // End:0x1C1 [Loop If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x1B7
        if(MM.UserInfos[i].ClanName == MM.kClanName)
        {
            MM.UserInfos[i].ClanMark = Pattern;
            MM.UserInfos[i].ClanBG = BG;
            MM.UserInfos[i].ClanBL = BL;
        }
        i++;
        // [Loop Continue]
        goto J0x105;
    }
    //return;    
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    //return;    
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    //return;    
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
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
    local BtrTime t;
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
    //return;    
}

function bool BTWindowDefineARHK_40_41_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowDefineARHK BTWindow;

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
    RecvMsg = (("[" $ CharName) $ "]") @ Msg;
    page_Main.AddChatLog(RecvMsg, 7, true);
    return true;
    //return;    
}

function bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    local string msgp[7], fmtStr;
    local wItemBoxHK ItemInfo;
    local MessageItem msgItem;
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
    // End:0x1E5
    if(int(CommunityType) == 1)
    {
        // End:0x1E3
        if(MM.kIsPaidPCBang == 1)
        {
            // End:0x19E
            if(MsgInfo.MsgCode == 5)
            {
                MM.AddPCBangList(MsgInfo.CharName, 0, 0, 0, "", MsgInfo.CharLevel, "", "", "", 0, 0, 0, "", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                MM.UpdatePCBangList(MM);                
            }
            else
            {
                // End:0x1E0
                if(MsgInfo.MsgCode == 6)
                {
                    MM.RemovePCBangList(MsgInfo.CharName);
                    MM.UpdatePCBangList(MM);
                }
            }            
        }
        else
        {
            return true;
        }
    }
    // End:0x267
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
    // End:0x35B
    if((MsgInfo.MsgCode >= 2) && MsgInfo.MsgCode <= 4)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x38F
    if((MsgInfo.MsgCode >= 9) && MsgInfo.MsgCode <= 13)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x3B4
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

function bool rfAckItemListEnd()
{
    local wMyPlayerStatus MyStatus;
    local array<int> pool;
    local wItemBoxInstanceHK instanceInfo;
    local BtrTime t, t2;
    local int i;
    local wItemBoxHK ItemInfo;
    local BtrDouble MWItemID;

    Log("[BTPageServerSelection::rfAckItemListEnd]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemListEnd();
    MM.kPrimaryID = GameMgr.FindInstanceItemIDBySlotPos(0);
    MM.kSecondaryID = GameMgr.FindInstanceItemIDBySlotPos(1);
    // End:0xC6
    if(MM.kPrimaryID == -1)
    {
        SetDefaultWeapon(0);
    }
    // End:0xE5
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
        pool.Length = 11;
        pool[0] = 17096;
        pool[1] = 17095;
        pool[2] = 17094;
        pool[3] = 17093;
        pool[4] = 17092;
        pool[5] = 17090;
        pool[6] = 16013;
        pool[7] = 16014;
        pool[8] = 16015;
        pool[9] = 208026;
        pool[10] = 305026;
        GameMgr.CandidateLists.Length = pool.Length;
        i = 0;
        J0x348:

        // End:0x391 [Loop If]
        if(i < pool.Length)
        {
            GameMgr.CandidateLists[i] = GameMgr.FindUIItem(pool[i]);
            i++;
            // [Loop Continue]
            goto J0x348;
        }
    }
    CTRP.bItemListEnd = true;
    CheckToSetPageLobby();
    Log("[BTPageServerSelection::rfAckItemListEnd] Success Update UIItem");
    return true;
    //return;    
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    local int i, DispOrder;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckQSlotList] Result=" $ string(Result));
    // End:0x7CB
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetQSlotList(QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
        // End:0xF8
        if(QSlotID.Length != GameMgr.QuickSlotBoxList.Length)
        {
            GameMgr.ClearQuickSlotBoxList();
            GameMgr.AllocateQuickSlotBoxList(QSlotID.Length);
        }
        PlayerOwner().dblog("=========================================");
        PlayerOwner().dblog("QuickSlot ItemList From ChannelServer");
        PlayerOwner().dblog("=========================================");
        i = 0;
        J0x1A3:

        // End:0x77D [Loop If]
        if(i < QSlotID.Length)
        {
            DispOrder = int(QSlotDispOrder[i]) - 1;
            GameMgr.SetQuickSlotBox_Name(DispOrder, QSlotName[i]);
            GameMgr.SetQuickSlotBox_ID(DispOrder, QSlotID[i]);
            PlayerOwner().dblog("====");
            PlayerOwner().dblog("QSlotDispOrder = " $ string(QSlotDispOrder[i]));
            PlayerOwner().dblog((("QSlotName = " $ QSlotName[i]) $ " QSlotID = ") $ string(QSlotID[i]));
            instanceInfo = GameMgr.FindInstanceItem(MWItemID[i]);
            // End:0x33B
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 0, instanceInfo.ItemID, MWItemID[i]);
                PlayerOwner().dblog(((("0 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(PistolItemID[i]);
            // End:0x3E7
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 1, instanceInfo.ItemID, PistolItemID[i]);
                PlayerOwner().dblog(((("1 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(TWItemID1[i]);
            // End:0x494
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 2, instanceInfo.ItemID, TWItemID1[i]);
                PlayerOwner().dblog(((("2 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceItem(TWItemID2[i]);
            // End:0x541
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Item(DispOrder, 3, instanceInfo.ItemID, TWItemID2[i]);
                PlayerOwner().dblog(((("3 WeaponID = (" $ string(instanceInfo.ItemID)) $ ") Dur = (") $ string(instanceInfo.Durability)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill1[i]);
            // End:0x5CD
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 0, instanceInfo.ItemID, Skill1[i]);
                PlayerOwner().dblog(("0 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill2[i]);
            // End:0x659
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 1, instanceInfo.ItemID, Skill2[i]);
                PlayerOwner().dblog(("1 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill3[i]);
            // End:0x6E6
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 2, instanceInfo.ItemID, Skill3[i]);
                PlayerOwner().dblog(("2 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            instanceInfo = GameMgr.FindInstanceSkillItem(Skill4[i]);
            // End:0x773
            if(instanceInfo != none)
            {
                GameMgr.SetQuickSlotBox_Skill(DispOrder, 3, instanceInfo.ItemID, Skill4[i]);
                PlayerOwner().dblog(("3 SkillID = (" $ string(instanceInfo.ItemID)) $ ")");
            }
            i++;
            // [Loop Continue]
            goto J0x1A3;
        }
        PlayerOwner().dblog("=========================================");
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

event bool rfAckPopUpMessage(byte MessageType)
{
    Log("[BTPageServerSelectionCN::rfAckPopUpMessage()] MessageType=" $ string(MessageType));
    Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 0);
    return true;
    //return;    
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageServerSelectionCN::rfAckMoveToLobby()] MessageType=" $ string(MessageType));
    Log(((((("[BTPageServerSelectionCN::rfAckMoveToLobby] (" $ page_Main.szAccountName) $ ", ") $ page_Main.szLoginPassword) $ ", ") $ page_Main.AuthLogin_GUID) $ ")");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    switch(MessageType)
    {
        // End:0x20D
        case 5:
            MM.bKickOut = true;
            // End:0x17E
            if(MM.InGamePlaying)
            {
                Controller.ViewportOwner.Actor.Level.GetMatchMaker().bForceGameOut = true;
                Controller.TcpHandler.sfReqNotifyExpiredItemIDs();
                Controller.TcpHandler.sfReqDisconnectGame();
            }
            Controller.TcpHandler.sfReqLogOut(3);
            Log(((((("[BTPageServerSelectionCN::rfAckMoveToLobby] (" $ page_Main.szAccountName) $ ", ") $ page_Main.szLoginPassword) $ ", ") $ page_Main.AuthLogin_GUID) $ ")");
            // End:0x212
            break;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    return true;
    //return;    
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTPageServerSelectionCN::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    // End:0xC3
    if(MM.IsUsingTenProtect)
    {
        // End:0xA0
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

function bool AD_OnClick(GUIComponent Sender)
{
    local DownloadTexture downTex;

    downTex = DownloadTexture(Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad3.Image);
    // End:0x83
    if((downTex != none) && downTex.bIsExistLink == true)
    {
        PlayerOwner().Level.ConsoleCommand("ShellExecute OP=open FILE=" $ downTex.strLinkFileName);
    }
    //return;    
}

defaultproperties
{
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    strCategory[0]="Server Name"
    strCategory[1]="Server Status"
    strCategory[2]="Server Name"
    strCategory[3]="Server Status"
    strCategory[4]="Channel Name"
    strCategory[5]="Status"
    fbCategoryPos[0]=(X1=45.0000000,Y1=96.0000000,X2=145.0000000,Y2=109.0000000)
    fbCategoryPos[1]=(X1=237.0000000,Y1=96.0000000,X2=314.0000000,Y2=109.0000000)
    fbCategoryPos[2]=(X1=356.0000000,Y1=96.0000000,X2=456.0000000,Y2=109.0000000)
    fbCategoryPos[3]=(X1=548.0000000,Y1=96.0000000,X2=625.0000000,Y2=109.0000000)
    fbCategoryPos[4]=(X1=701.0000000,Y1=96.0000000,X2=801.0000000,Y2=109.0000000)
    fbCategoryPos[5]=(X1=913.0000000,Y1=96.0000000,X2=990.0000000,Y2=109.0000000)
    fbChannelBg=(X1=656.0000000,Y1=93.0000000,X2=1023.0000000,Y2=448.0000000)
    strEnterCh="Enter Channel"
    nIndexDefSrv=-1
    nIndexDefCh=-1
    // Reference: TabControlMocker'GUIWarfare_Decompressed.BTPageServerSelectionCN.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls.TabControlMocker
        OnVisiblePanelChanged=BTPageServerSelectionCN.OnVisibleChannelListChanged
    end object
    TabControl=mTabControl
    // Reference: BTTPTopMenuSCHK'GUIWarfare_Decompressed.BTPageServerSelectionCN.mTPTopMenu'
    begin object name="mTPTopMenu" class=GUIWarfareControls.BTTPTopMenuSCHK
        bUseAWinPos=true
        AWinPos=(X1=454.0000000,Y1=0.0000000,X2=1016.0000000,Y2=70.0000000)
    end object
    TPTopMenu=mTPTopMenu
    OnOpen=BTPageServerSelectionCN.InternalOnOpen
    OnReOpen=BTPageServerSelectionCN.InternalOnReOpen
    OnClose=BTPageServerSelectionCN.InternalOnClose
    OnPreDraw=BTPageServerSelectionCN.Internal_OnPreDraw
}