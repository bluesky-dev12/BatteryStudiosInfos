class BTPageLobbyCN extends BTPageLobby
    editinlinenew
    instanced;

var localized string strTooltip[5];
var localized string strListTop[10];
var localized string strListBottom[5];
var export editinline BTOwnerDrawCaptionButtonHK MyInfoBtn;
var export editinline BTOwnerDrawCaptionButtonHK MyTutorialBtn;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() automated FloatBox fbLabelBackgrounddeco;
var string szSerVerInfo;
var export editinline BTOwnerDrawImageHK LabelSvrInfo;
var FloatBox fbLabelInfo;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local Color orange;
    local Image img, onImg, cliImg;
    local Color Col;

    orange = Class'Engine.Canvas'.static.MakeColor(byte(255), 140, 63, byte(255));
    super(BTNetQuestInfoPageHK).InitComponent(MyController, myOwner);
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.LobbyBG, 0.2000000);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MyController.ResetFocus();
    ACLLobby.MultiColumnList.__OnDblClick__Delegate = OnLobby_DblClick;
    ACLLobbyEnterable.MultiColumnList.__OnDblClick__Delegate = OnLobby_DblClick;
    onImg = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_on;
    cliImg = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_cli;
    i = 0;
    J0x135:

    // End:0x2C6 [Loop If]
    if(i < 8)
    {
        ListTopButton[i] = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        ListTopButton[i].bUseAWinPos = true;
        ListTopButton[i].AWinPos = ListTopButtonPosition[i];
        ListTopButton[i].buttonImage[1] = onImg;
        ListTopButton[i].buttonImage[3] = cliImg;
        ListTopButton[i].RenderWeight = 0.2000000;
        ListTopButton[i].SetDefaultListTopButtonFontColor();
        ListTopButton[i].Caption = strListTop[i];
        ListTopButton[i].CaptionDrawType = 4;
        ListTopButton[i].ButtonID = i;
        ListTopButton[i].Extra = 0;
        ListTopButton[i].__OnClick__Delegate = TopButton_OnClick;
        ListTopButton[i].CaptionPadding[3] = 2;
        ListTopButton[i].InitComponent(Controller, self);
        AppendComponent(ListTopButton[i]);
        i++;
        // [Loop Continue]
        goto J0x135;
    }
    ListTopButton[7].CaptionPadding[2] = 5;
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(64, 32, 15, none);
    MyTutorialBtn = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(43.0000000, 466.0000000, 167.0000000, 503.0000000), 0.9000000);
    MyTutorialBtn.SetDefaultFontColor();
    MyTutorialBtn.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    MyTutorialBtn.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    MyTutorialBtn.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_mid_n;
    MyTutorialBtn.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_mid_cli;
    MyTutorialBtn.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_mid_block;
    MyTutorialBtn.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_mid_on;
    MyTutorialBtn.Caption = strListBottom[4];
    MyTutorialBtn.__OnClick__Delegate = StartTutorial_OnClick;
    i = 0;
    J0x42C:

    // End:0xACE [Loop If]
    if(i < 4)
    {
        ListBottomButton[i] = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        ListBottomButton[i].bUseAWinPos = true;
        ListBottomButton[i].AWinPos = ListBottomButtonPosition[i];
        ListBottomButton[i].SetDefaultFontColor();
        // End:0x59D
        if(i == 0)
        {
            ListBottomButton[i].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_Big_n;
            ListBottomButton[i].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_Big_on;
            ListBottomButton[i].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_Big_n;
            ListBottomButton[i].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_Big_cli;
            ListBottomButton[i].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_Big_block;
            ListBottomButton[i].buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Btn_Big_on;
            ListBottomButton[i].CaptionDrawType = 4;
        }
        // End:0x6A1
        if(i == 1)
        {
            ListBottomButton[i].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Enter_Btn_n;
            ListBottomButton[i].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Enter_Btn_on;
            ListBottomButton[i].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Enter_Btn_n;
            ListBottomButton[i].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Enter_Btn_cli;
            ListBottomButton[i].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Enter_Btn_block;
            ListBottomButton[i].buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Enter_Btn_on;
            ListBottomButton[i].CaptionDrawType = 4;
        }
        // End:0x8EE
        if(i == 2)
        {
            ListBottomButton[i].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Btn_n;
            ListBottomButton[i].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Btn_on;
            ListBottomButton[i].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Btn_n;
            ListBottomButton[i].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Btn_cli;
            ListBottomButton[i].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Btn_block;
            ListBottomButton[i].buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Btn_on;
            ListBottomButton[i].FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0, byte(255));
            ListBottomButton[i].FontColor[1] = Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0, byte(255));
            ListBottomButton[i].FontColor[2] = Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0, byte(255));
            ListBottomButton[i].FontColor[3] = Class'Engine.Canvas'.static.MakeColor(102, 102, 102, byte(255));
            ListBottomButton[i].FontColor[4] = Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0, byte(255));
            ListBottomButton[i].FontColor[5] = Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0, byte(255));
            ListBottomButton[i].CaptionDrawType = 5;
            ListBottomButton[i].CaptionPadding[2] = 8;
        }
        // End:0x9DC
        if(i == 3)
        {
            ListBottomButton[i].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Setting_Btn_n;
            ListBottomButton[i].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Setting_Btn_on;
            ListBottomButton[i].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Setting_Btn_n;
            ListBottomButton[i].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Setting_Btn_cli;
            ListBottomButton[i].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Setting_Btn_block;
            ListBottomButton[i].buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_Quick_Enter_Setting_Btn_on;
        }
        ListBottomButton[i].SetFontSizeAll(13);
        ListBottomButton[i].RenderWeight = 0.9000000;
        ListBottomButton[i].Caption = strListBottom[i];
        ListBottomButton[i].ButtonID = i;
        ListBottomButton[i].__OnClick__Delegate = OnBottomButton_Click;
        ListBottomButton[i].InitComponent(Controller, self);
        ListBottomButton[i].isShowToolTip = true;
        ListBottomButton[i].strTooltip = strTooltip[i];
        AppendComponent(ListBottomButton[i]);
        i++;
        // [Loop Continue]
        goto J0x42C;
    }
    ListBottomButton[3].Caption = "";
    ButtonRegularClanWar = NewButtonComponent(fbButtonRegularClanWar);
    ButtonRegularClanWar.SetDefaultButtonImage();
    ButtonRegularClanWar.SetFontSizeAll(12);
    ButtonRegularClanWar.CaptionDrawType = 4;
    ButtonRegularClanWar.Caption = strButtonRegularClanWar;
    ButtonRegularClanWar.DisableMe();
    ButtonRegularClanWar.SetVisibility(false);
    ButtonRegularClanWar.__OnClick__Delegate = ButtonRegularClanWar_OnClick;
    ButtonFriendlyClanWar = NewButtonComponent(fbButtonFriendlyClanWar);
    ButtonFriendlyClanWar.SetDefaultButtonImage();
    ButtonFriendlyClanWar.SetFontSizeAll(12);
    ButtonFriendlyClanWar.CaptionDrawType = 4;
    ButtonFriendlyClanWar.Caption = strMakeClanWarRoom;
    ButtonFriendlyClanWar.DisableMe();
    ButtonFriendlyClanWar.SetVisibility(false);
    ButtonFriendlyClanWar.__OnClick__Delegate = ButtonFriendlyClanWar_OnClick;
    ButtonAD = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(757.0000000, 92.0000000, 1024.0000000, 175.0000000));
    ButtonAD.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad_lobby;
    ButtonAD.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad_lobby;
    ButtonAD.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad_lobby;
    ButtonAD.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad_lobby;
    ButtonAD.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad_lobby;
    ButtonAD.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad_lobby;
    ButtonAD.Caption = "";
    ButtonAD.__OnClick__Delegate = AD_OnClick;
    // End:0xD20
    if(MM != none)
    {
        MM.SendPingToChannelServer();
    }
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 240.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 288.0000000;
    i = 0;
    J0xD8B:

    // End:0xDD1 [Loop If]
    if(i < TPMessenger.ButtonMsg.Length)
    {
        TPMessenger.ButtonMsg[i].__OnClick__Delegate = TPMessenger_ButtonMsg_OnClick;
        i++;
        // [Loop Continue]
        goto J0xD8B;
    }
    ACLLobby.__OnHitBottom__Delegate = ACLLobby_OnHitBottom;
    TPMessenger.ACLMsg[0].__OnHitBottom__Delegate = TPMessenger_ACLMsg0_OnHitBottom;
    MyInfoBtn = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(973.0000000, 503.0000000, 1023.0000000, 555.0000000), 0.9000000);
    MyInfoBtn.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_n;
    MyInfoBtn.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_on;
    MyInfoBtn.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_n;
    MyInfoBtn.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_cli;
    MyInfoBtn.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_block;
    MyInfoBtn.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_Focus;
    MyInfoBtn.Caption = "";
    MyInfoBtn.__OnClick__Delegate = MyInfo_OnClick;
    TPMessenger.HideTabButton(TPMessenger.3);
    i = int(PlayerOwner().Level.ConsoleCommand("GETCONFIG_INT Misc RecordResoultion"));
    PlayerOwner().Level.SetCaptureResoultion(i);
    i = int(PlayerOwner().Level.ConsoleCommand("GETCONFIG_INT Misc RecordQuality"));
    PlayerOwner().Level.SetCaptureQuality(i);
    rfFriendPosTime = new Class'GUIWarfare_Decompressed.BTRefreshTime';
    rfFriendPosTime.SetMaxTime(1.5000000);
    LabelSvrInfo = NewLabelComponent(fbLabelInfo, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty, 1.0000000);
    LabelSvrInfo.CaptionDrawType = 3;
    LabelSvrInfo.Caption = szSerVerInfo;
    i = 0;
    J0x1061:

    // End:0x108E [Loop If]
    if(i < 5)
    {
        LabelSvrInfo.FontSize[i] = 10;
        i++;
        // [Loop Continue]
        goto J0x1061;
    }
    Col = Class'Engine.Canvas'.static.MakeColor(byte(255), 192, 0, byte(255));
    LabelSvrInfo.SetFontColorAll(Col);
    //return;    
}

function bool AD_OnClick(GUIComponent Sender)
{
    local DownloadTexture downTex;

    downTex = DownloadTexture(Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad_lobby.Image);
    // End:0x83
    if((downTex != none) && downTex.bIsExistLink == true)
    {
        PlayerOwner().Level.ConsoleCommand("ShellExecute OP=open FILE=" $ downTex.strLinkFileName);
    }
    //return;    
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wMyPlayerStatus MyStatus;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    switch(btn.ButtonID)
    {
        // End:0x71
        case 0:
            page_Main.SetPage(23, false);
            // End:0x365
            break;
        // End:0x8A
        case 1:
            page_Main.SetPage(20, false);
            // End:0x365
            break;
        // End:0xA4
        case 2:
            page_Main.SetPage(21, false);
            // End:0x365
            break;
        // End:0xBE
        case 3:
            page_Main.SetPage(22, false);
            // End:0x365
            break;
        // End:0xD8
        case 4:
            page_Main.SetPage(18, false);
            // End:0x365
            break;
        // End:0x1F1
        case 5:
            // End:0x107
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, false);                
            }
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x365
            break;
        // End:0x1F9
        case 6:
            // End:0x365
            break;
        // End:0x201
        case 7:
            // End:0x365
            break;
        // End:0x218
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x365
            break;
        // End:0x263
        case 9:
            Controller.LogMenuStack();
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x365
            break;
        // End:0x2E7
        case 10:
            // End:0x2E4
            if(bGoBack == false)
            {
                Log(("page_Main.TcpChannel.sfReqLeaveChannel(" $ string(MM.kChannelID)) $ ")");
                bGoBack = true;
                page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
            }
            // End:0x365
            break;
        // End:0x32A
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x365
            break;
        // End:0x354
        case 12:
            Log("Cash Shop = " $ string(btn.ButtonID));
            // End:0x365
            break;
        // End:0x362
        case 20:
            OpenTodayResultPage();
            // End:0x365
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool OnBottomButton_Click(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local export editinline BTWindowHK BTWindow;

    Log("[BTPageLobby::OnBottomButton_Click]");
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x65
        case 0:
            OpenBTWindowCreateRoom();
            GetWindowCreateRoom().SetGameModeByExtraDataIndex(0);
            // End:0x189
            break;
        // End:0xA0
        case 1:
            // End:0x89
            if(bAllRoomList)
            {
                MoveToRoom(ACLLobby.LastSelectedIndexHistory);                
            }
            else
            {
                MoveToRoom(ACLLobbyEnterable.LastSelectedIndexHistory);
            }
            // End:0x189
            break;
        // End:0xAE
        case 2:
            QuickEnter_OnOK();
            // End:0x189
            break;
        // End:0x10C
        case 3:
            Controller.OpenMenu("GUIWarfareControls.BTWindowQuickEnterRoomHK");
            BTWindow = BTWindowHK(Controller.TopPage());
            // End:0x189
            break;
        // End:0x186
        case 4:
            bAllRoomList = !bAllRoomList;
            ACLLobby.SetVisibility(bAllRoomList);
            ACLLobbyEnterable.SetVisibility(!bAllRoomList);
            // End:0x16F
            if(bAllRoomList)
            {
                btn.Caption = strListBottom[4];                
            }
            else
            {
                btn.Caption = strAllRoomList;
            }
            // End:0x189
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function BTWindowQuickEnterRoomHK GetWindowQuickEnter()
{
    return BTWindowQuickEnterRoomHK(Controller.TopPage());
    //return;    
}

function bool MoveToRoom(int Index)
{
    local BTAutoColumnListDataHK Data;

    Log("[BTPageLobby::MoveToRoom]");
    // End:0x2A
    if(Index < 0)
    {
        return true;
    }
    // End:0x50
    if(bAllRoomList)
    {
        Data = ACLLobby.GetRowByIndex(Index);        
    }
    else
    {
        Data = ACLLobbyEnterable.GetRowByIndex(Index);
    }
    // End:0x77
    if(Data == none)
    {
        return true;
    }
    Log(((("[BTPageLobby::MoveToRoom] RoomNum=(" $ string(Data.DataPerColumn[1].IntValue)) $ ", ") $ string(Data.DataPerColumn[11].IntValue)) $ ")");
    // End:0x274
    if(Data.DataPerColumn[11].IntValue == 0)
    {
        page_Main.iRoomNum = Data.DataPerColumn[0].IntValue;
        MM.kRoomID = Data.DataPerColumn[0].IntValue;
        // End:0x215
        if(((int(MM.GMLevelFlag) & 3) == 0) && Data.DataPerColumn[2].IntValue == 1)
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowPasswordHK");
            BTWindowPasswordHK(Controller.TopPage()).SetData();
            BTWindowPasswordHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPasswordHK_OnOK;
            BTWindowPasswordHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowPasswordHK_OnCancel;            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowStateHK'.static.ShowWindow(Controller, strEnterRoomMessage $ string(MM.kRoomID));
            page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
            __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterJoinRoom;
        }        
    }
    else
    {
        // End:0x2D8
        if(((int(MM.GMLevelFlag) & 3) == 0) && (MM.kClanName == "") || MM.kClanName == "none")
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 187);
            return true;
        }
        MM.kClanMatch_ReadyRoomID = Data.DataPerColumn[11].IntValue;
        Log(("page_Main.TcpChannel.sfReqClanMatch_Join(" $ string(MM.kClanMatch_ReadyRoomID)) $ ")");
        page_Main.TcpChannel.sfReqClanMatch_Join(MM.kClanMatch_ReadyRoomID);
    }
    return true;
    //return;    
}

function bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    local int i, j, GameRoomIndex;

    Log((("[BTPageLobby::rfAckRoomList] Title.Length=" $ string(Title.Length)) $ ", BotDifficult=") $ string(BotDifficult.Length));
    i = 0;
    J0x5C:

    // End:0x3AA [Loop If]
    if(i < GameNum.Length)
    {
        Log((((("Title[" $ string(i)) $ "]=") $ Title[i]) $ ", BotDifficult=") $ string(BotDifficult[i]));
        GameRoomIndex = ACLLobby.FindRoomNo(GameNum[i]);
        // End:0x254
        if(GameRoomIndex >= 0)
        {
            ACLLobby.ReplaceRoom(GameRoomIndex, int(IsSpecial[i]), GameNum[i], int(IsPassword[i]), Title[i], MapName[i], MapNum[i], ModeNum[i], int(WeaponLimit[i]), int(UserCount[i]), int(MaxCount[i]), int(Status[i]), 0, RoomOwnerIP[i], GameMinute[i], int(IsTeamBalance[i]), RoomOwnerName[i], int(BotDifficult[i]), int(BotModeUserTeamNum[i]));
            // End:0x237
            if(IsEnterableRoom(bool(IsPassword[i]), int(UserCount[i]), int(MaxCount[i])))
            {
                // End:0x234
                if(ACLLobbyEnterable.FindRoomNo(GameNum[i]) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[GameRoomIndex]);
                }                
            }
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(GameNum[i]);
            }
            // [Explicit Continue]
            goto J0x3A0;
        }
        ACLLobby.AddRoom(int(IsSpecial[i]), GameNum[i], int(IsPassword[i]), Title[i], MapName[i], MapNum[i], ModeNum[i], int(WeaponLimit[i]), int(UserCount[i]), int(MaxCount[i]), int(Status[i]), 0, RoomOwnerIP[i], GameMinute[i], int(IsTeamBalance[i]), RoomOwnerName[i], int(BotDifficult[i]), int(BotModeUserTeamNum[i]));
        ACLLobby.SortRoom();
        // End:0x3A0
        if(IsEnterableRoom(bool(IsPassword[i]), int(UserCount[i]), int(MaxCount[i])))
        {
            ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[ACLLobby.ACLRowList.Length - 1]);
        }
        J0x3A0:

        i++;
        // [Loop Continue]
        goto J0x5C;
    }
    // End:0x4CE
    if(page_Main.EnterBotMode)
    {
        Log("[BTPageLobby::rfAckRoomList] enter bot mode");
        page_Main.EnterBotMode = false;
        // End:0x44E
        if(ProcessQuickEnter(-1, 11, -1, 1))
        {
            Log("[BTPageLobby::rfAckRoomList] enter bot mode - success");            
        }
        else
        {
            Log("[BTPageLobby::rfAckRoomList] enter bot mode - fail, let's create a room");
            page_Main.CreateBotMode = true;
            OpenBTWindowCreateRoom();
            GetWindowCreateRoom().SetGameModeByExtraDataIndex(11);
            BTWindowCreateRoom_OnOK(GetWindowCreateRoom());
        }
    }
    return true;
    //return;    
}

function bool MyInfo_OnClick(GUIComponent Sender)
{
    // End:0x1C4
    if(MM.kUserName == TPMyInfo.myName)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowUserPersonalInfo");
        BTWindowUserPersonalInfo(Controller.TopPage()).SetTcpChannel(page_Main.TcpChannel);
        BTWindowUserPersonalInfo(Controller.TopPage()).SetCharInfo(page_Main.MyCharInfo);
        BTWindowUserPersonalInfo(Controller.TopPage()).SetClanInfo(page_Main.MyClanInfo);
        BTWindowUserPersonalInfo(Controller.TopPage()).UpdateCharInfo();
        BTWindowUserPersonalInfo(Controller.TopPage()).UpdateRequestServer();
        // End:0x177
        if((MM.kClanName == "none") || MM.kClanName == "")
        {
            BTWindowUserPersonalInfo(Controller.TopPage()).ButtonOK.DisableMe();            
        }
        else
        {
            BTWindowUserPersonalInfo(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserPersonalInfo(Controller.TopPage()).__OnOK__Delegate = BTWindowUserPersonalInfo_OnClanInfo;
        }        
    }
    else
    {
        page_Main.TcpChannel.sfReqDBCharInfo(TPMyInfo.myName);
    }
    return true;
    //return;    
}

function bool StartTutorial_OnClick(GUIComponent Sender)
{
    Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 24);
    BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_24_OnOK;
    return true;
    //return;    
}

function bool BTWindowDefineSelectHK_24_OnOK(GUIComponent Sender)
{
    StartTutorial();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::rfAckDBCharInfo]");
    // End:0x22C
    if(Controller.TopPage() == self)
    {
        // End:0x9B
        if(bJoinClanState)
        {
            BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
            // End:0x91
            if(BTWindow != none)
            {
                // End:0x91
                if(BTWindow.CharName == CharName)
                {
                    BTWindow.SetCharInfo(stCharInfo);
                }
            }
            bJoinClanState = false;
            return true;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, stCharInfo.DispHeadItem, stCharInfo.DispFaceItem, stCharInfo.DispHeadAddItem, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
        // End:0x1E2
        if((ClanName == "none") || ClanName == "")
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();            
        }
        else
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
        }
    }
    return true;
    //return;    
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    BTWindowUserPersonalInfo(Controller.TopPage()).UpdateCharDetailInfo(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
    return true;
    //return;    
}

function bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    local int i;

    Log(((((((((((("[BTPageLobby::rfReqExteriorRoomInfo]" $ " SP=") $ string(SP)) $ " RoomNum=") $ string(RoomNumber)) $ " RoomName=") $ RoomName) $ " Map=") $ MapName) $ " IsTeamBalance=") $ string(IsTeamBalance)) $ ", WeaponLimit=") $ string(WeaponLimit));
    i = 0;
    J0xB2:

    // End:0x1C6 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x1BC
        if(ACLLobby.ACLRowList[i].DataPerColumn[0].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomInfo(i, RoomName, MapName, MapNum, ModeNum, IsTeamBalance, RoomUserCount, MaxUserCount, int(RoomState), IsPW, BotDifficult, WeaponLimit, BotModeUserTeamNum);
            // End:0x1A5
            if(IsEnterableRoom(bool(IsPW), RoomUserCount, MaxUserCount))
            {
                // End:0x1A2
                if(ACLLobbyEnterable.FindRoomNo(RoomNumber) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[i]);
                }                
            }
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(RoomNumber);
            }
            // [Explicit Break]
            goto J0x1C6;
        }
        i++;
        // [Loop Continue]
        goto J0xB2;
    }
    J0x1C6:

    return true;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float CurrentTime;
    local int StartTop, Count;
    local export editinline BTWindowHK BTWindow;

    super.Internal_OnPreDraw(C);
    // End:0x6F
    if(ACLLobby.tT != none)
    {
        ACLLobby.tT.bOverlapControl = QuestInfo.bVisible;
        ACLLobbyEnterable.tT.bOverlapControl = QuestInfo.bVisible;
    }
    // End:0x7A
    if(bStopRefresh)
    {
        return false;
    }
    // End:0x9D
    if(page_Main.page_curr != page_Main.page_Lobby2)
    {
        return false;
    }
    // End:0xB4
    if(page_Main.bConnectedChannelServer == false)
    {
        return false;
    }
    // End:0x13F
    if(page_Main.pwm.IsAvailable() && page_Main.pwm.ListLen(7) > 0)
    {
        BTWindow = BTWindowHK(Controller.TopPage());
        // End:0x13F
        if(BTWindow == none)
        {
            Controller.OpenMenuByObject(page_Main.pwm.Pop(7));
        }
    }
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    // End:0x2D4
    if((CurrentTime - LastRefreshTime[0]) > RefreshCycleTime[0])
    {
        // End:0x2C7
        if(TPMessenger.TabControl.CurrentTabIndex == int(TPMessenger.0))
        {
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[int(TPMessenger.0)].MultiColumnList.Top - 6;
            // End:0x1FF
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0x283
            if((TPMessenger.ACLMsg[int(TPMessenger.0)].MultiColumnList.Top + (6 * 2)) > TotalChannelUserCount)
            {
                Count += (TotalChannelUserCount - (TPMessenger.ACLMsg[int(TPMessenger.0)].MultiColumnList.Top + (6 * 2)));
            }
            // End:0x297
            if(Count < 6)
            {
                Count = 6;
            }
            page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, StartTop, Count);
        }
        LastRefreshTime[0] = CurrentTime;
    }
    rfFriendPosTime.Update(PlayerOwner().Level.AppDeltaTime);
    LabelSvrInfo.Caption = "";
    szSerVerInfo = (Controller.ViewportOwner.Actor.Level.GetMatchMaker().szSeverName $ " / ") $ Controller.ViewportOwner.Actor.Level.GetMatchMaker().szChannelName;
    LabelSvrInfo.Caption = szSerVerInfo;
    return false;
    //return;    
}

function OnCompleteOpened()
{
    super.OnCompleteOpened();
    // End:0x3C
    if(MatchMaker.kClanMatch_InChannel)
    {
        MyTutorialBtn.DisableMe();
        ListBottomButton[3].DisableMe();        
    }
    else
    {
        MyTutorialBtn.EnableMe();
        ListBottomButton[3].EnableMe();
    }
    //return;    
}

defaultproperties
{
    strListTop[0]="No."
    strListTop[1]="P/W"
    strListTop[2]="Name"
    strListTop[3]="Map"
    strListTop[4]="Mode"
    strListTop[6]="Players"
    strListTop[7]="Status"
    strListBottom[0]="Create Game"
    strListBottom[1]="Join"
    strListBottom[2]="Quick Join"
    strListBottom[3]="Options"
    strListBottom[4]="Tutorial"
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    fbLabelInfo=(X1=18.0000000,Y1=75.0000000,X2=742.0000000,Y2=89.0000000)
    strEnterRoomMessage="Entering game"
    strConnectingLogin="Connecting to Login Server…"
    strDisconnectedChannel="Connection to channel failed. Please try again."
    strListTop[0]="No."
    strListTop[1]="P/W"
    strListTop[2]="Name"
    strListTop[3]="Map"
    strListTop[4]="Mode"
    strListTop[6]="Players"
    strListTop[7]="Status"
    strListBottom[1]="Join"
    strListBottom[2]="Quick Join"
    strListBottom[3]="Options"
    strListBottom[4]="Tutorial"
    ListTopButtonPosition[0]=(X1=12.0000000,Y1=93.0000000,X2=55.0000000,Y2=113.0000000)
    ListTopButtonPosition[1]=(X1=55.0000000,Y1=93.0000000,X2=86.0000000,Y2=113.0000000)
    ListTopButtonPosition[2]=(X1=86.0000000,Y1=93.0000000,X2=369.0000000,Y2=113.0000000)
    ListTopButtonPosition[3]=(X1=369.0000000,Y1=93.0000000,X2=485.0000000,Y2=113.0000000)
    ListTopButtonPosition[4]=(X1=485.0000000,Y1=93.0000000,X2=600.0000000,Y2=113.0000000)
    ListTopButtonPosition[5]=(X1=600.0000000,Y1=93.0000000,X2=628.0000000,Y2=113.0000000)
    ListTopButtonPosition[6]=(X1=628.0000000,Y1=93.0000000,X2=679.0000000,Y2=113.0000000)
    ListTopButtonPosition[7]=(X1=679.0000000,Y1=93.0000000,X2=728.0000000,Y2=113.0000000)
    ListBottomButtonPosition[0]=(X1=192.0000000,Y1=461.0000000,X2=334.0000000,Y2=503.0000000)
    ListBottomButtonPosition[1]=(X1=336.0000000,Y1=461.0000000,X2=478.0000000,Y2=503.0000000)
    ListBottomButtonPosition[2]=(X1=491.0000000,Y1=461.0000000,X2=631.0000000,Y2=503.0000000)
    ListBottomButtonPosition[3]=(X1=632.0000000,Y1=461.0000000,X2=698.0000000,Y2=503.0000000)
    strMakeClanWarRoom="Create Clan Match"
    strRegularClanWar="Create Regular Clan Match"
    strFriendlyClanWar="Create Friendly Clan Match"
    strButtonRegularClanWar="Create Clan Match Game"
    strButtonFriendlyClanWar="Create Friendly Match Game"
}