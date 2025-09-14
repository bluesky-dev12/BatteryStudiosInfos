/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageServerSelection.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:46
 *	Functions:170
 *
 *******************************************************************************/
class BTPageServerSelection extends BTNetGUIPageHK
    dependson(BTNetGUIPageHK)
    dependson(BTPageLobby)
    dependson(BTWindowItemDurabilityWarningHK)
    dependson(BTWindowItemExpiredHK)
    dependson(BTPageClanWar)
    dependson(BTPageRoomLobby)
    dependson(BTLabelNoticeHK)
    dependson(BTPageServerSelection_TcpLogin)
    dependson(BTPageServerSelection_TCP)
    editinlinenew
    instanced;

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
var string currentBGM;
var ConnectingInfo ConnectingChannel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBackground;
var export editinline BTOwnerDrawImageHK LabelBackground;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBackgrounddeco;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTopLine;
var export editinline BTOwnerDrawImageHK LabelTopLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLeftTopRoll;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelLeftTopRollSource;
var export editinline BTOwnerDrawSourceClipImageHK LabelLeftTopRoll;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBottomLine;
var export editinline BTLabelNoticeHK LabelBottomLine;
var export editinline BTOwnerDrawCaptionButtonHK ButtonServerList[7];
var export editinline BTACLServerSelectionHK ACLServerList[7];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPTopMenuSCHK TPTopMenu;
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
var export editinline BTOwnerDrawCaptionButtonHK ButtonEnterCh;
var export editinline BTACLGroutSelection ServerList;
var export editinline BTACLServerSelectionHK ChannelList;
var bool bDefaultServnChannel;
var export editinline BTOwnerDrawImageHK ChannelBg;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbChannelBg;
var int nIndexDefSrv;
var int nIndexDefCh;
var byte iProcessExpiredStep;

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageServerSelection_TCP TCP;

    TCP = new class'BTPageServerSelection_TCP';
    TCP.Owner = self;
    return TCP;
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageServerSelection_TcpLogin TCP;

    TCP = new class'BTPageServerSelection_TcpLogin';
    TCP.Owner = self;
    return TCP;
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x27
        case 0:
            // End:0x142
            break;
        // End:0x2e
        case 1:
            // End:0x142
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
            // End:0x142
            break;
        // End:0x88
        case 3:
            // End:0x142
            break;
        // End:0x9f
        case 4:
            page_Main.ShowHelpWindow();
            // End:0x142
            break;
        // End:0xdb
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x142
            break;
        // End:0x13f
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWIndowTodayResultHK");
            BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWIndowTodayResultHK_OnOK;
            // End:0x142
            break;
        // End:0xffff
        default:
            return true;
    }
}

function ExitGame()
{
    local int i;

    Log("[BTPageServerSelection::HeaderButton_OnClick] Exit!!!");
    Log("Exit Chat Log Message Start");
    i = 0;
    J0x5f:
    // End:0x9d [While If]
    if(i < page_Main.ChatLog.Length)
    {
        Log(page_Main.ChatLog[i].chatText);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    Log("Exit Chat Log Message End");
    Controller.ConsoleCommand("exit");
}

function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new class'BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bSkipInitializeDefaultPage = true;
    super.InitComponent(MyController, myOwner);
    LabelBackground = NewLabelComponent(fbLabelBackground, class'BTUIResourcePoolHK'.default.img_back1, 0.00010);
    LabelTopLine = NewLabelComponent(fbLabelTopLine, class'BTUIResourcePoolHK'.default.img_top_default, 0.000130);
    LabelBottomLine = BTLabelNoticeHK(NewComponent(new class'BTLabelNoticeHK', fbLabelBottomLine, 0.010));
    LabelBottomLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_upper;
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
    // End:0x1b3
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
    }
    // End:0x23d
    else
    {
        page_Main.DefaultLobbyBGM = "bgm_lobby_part" $ string(int(float(page_Main.GameRunningCount) % float(2) + float(1)));
        page_Main.LastMainPageBGM = page_Main.DefaultLobbyBGM;
        PlayerOwner().Player.Console.SetOneBGM(page_Main.DefaultLobbyBGM);
    }
    page_Main.bFirstLogin = true;
    ChannelBg = new class'BTOwnerDrawImageHK';
    ChannelBg.bUseAWinPos = true;
    ChannelBg.AWinPos = fbChannelBg;
    ChannelBg.BackgroundImage = class'BTUIResourcePoolHK'.default.ChannelBgBeginner;
    ChannelBg.InitComponent(Controller, self);
    ChannelBg.CaptionDrawType = 3;
    AppendComponent(ChannelBg);
}

function bool ButtonCredit_OnClick(GUIComponent Sender)
{
    page_Main.SetPage(25, false);
    return true;
}

function gameMgr_UpdateEventTimer(int EventType, BtrDouble EventTime)
{
    local BtrTime t;

    Log("gameMgr_UpdateEventTimer EventType=" $ string(EventType));
    BtrDoubleToBtrTime(GameMgr.kClientTime, t);
    BtrDoubleToBtrTime(EventTime, t);
}

function Event0_Timer(int Index)
{
    Log("--------------------------------- Event0_Timer --------------------------------------------");
}

function Event3_Timer(int Index)
{
    Log("--------------------------------- Event3_Timer --------------------------------------------");
}

function bool ButtonTemp_OnClick(GUIComponent Sender)
{
    local BtrTime t;
    local BtrDouble D;
    local DelegateEventTimer det;

    Controller.LaunchURL("http://payment.webzen.co.kr/Payment/PaymentMainFrm.asp");
    // End:0x5b5
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
                t.Minute += t.Second / 60;
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log("t0 = " $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second));
            det = new class'DelegateEventTimer';
            det.__OnEventTimer__Delegate = Event0_Timer;
            GameMgr.AddEventTimer(0, D, det);
            t.Second += 4;
            // End:0x267
            if(t.Second >= 60)
            {
                t.Minute += t.Second / 60;
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log("t1 = " $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second));
            GameMgr.AddEventTimer(1, D);
            t.Second += 50;
            // End:0x35f
            if(t.Second >= 60)
            {
                t.Minute += t.Second / 60;
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            Log("t2 = " $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second));
            GameMgr.AddEventTimer(2, D);
            t.Second += 6;
            // End:0x458
            if(t.Second >= 60)
            {
                t.Minute += t.Second / 60;
                t.Second = int(float(t.Second) % float(60));
            }
            self.BtrTimeToBtrDouble(t, D);
            det = new class'DelegateEventTimer';
            det.__OnEventTimer__Delegate = Event0_Timer;
            Log("t3 = " $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second));
            GameMgr.AddEventTimer(3, D, det);
            Log("=============================================");
        }
        // End:0x59c
        else
        {
            // End:0x59c
            if(ToggleButCredit == 1)
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
            }
        }
        ++ ToggleButCredit;
        // End:0x5b5
        if(ToggleButCredit > 1)
        {
            ToggleButCredit = 0;
        }
    }
    return true;
}

function bool ButtonTemp2_OnClick(GUIComponent Sender)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
    return true;
}

function bool BTWIndowTodayResultHK_OnOK(GUIComponent Sender)
{
    page_Main.TcpLogin.sfReqLogOut(1);
    BTWindowTodayResultHK(Controller.TopPage()).FadeOut();
    return true;
}

function ApplyLocalizedString();
function DefaultSvrnChSelect()
{
    local int i, j;
    local BTAutoColumnListDataHK Split, row, temp;

    ServerList.MultiColumnList.LastSelected = 0;
    Split = ServerList.GetRowByIndex(ServerList.MultiColumnList.LastSelected);
    ChannelList.RemoveAll();
    i = 0;
    J0x5b:
    // End:0x3d3 [While If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3c9
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new class'BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = class'BTUIResourcePoolHK'.default.newlist_Channel_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            // End:0x191
            if(row.DataPerColumn[0].strValue == "")
            {
            }
            // End:0x3c9
            else
            {
                row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
                row.DataPerColumn[0].tempValue = page_Main.SCIList[i].ChannelTypeValue;
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
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5b;
    }
    ChannelList.MultiColumnList.LastSelected = 0;
    j = 0;
    J0x3f3:
    // End:0x48a [While If]
    if(j < ChannelList.ACLRowList.Length)
    {
        temp = ChannelList.ACLRowList[j];
        // End:0x480
        if(float(temp.DataPerColumn[1].IntValue) < float(temp.DataPerColumn[1].tempValue) * 0.90)
        {
            ChannelList.MultiColumnList.LastSelected = j;
        }
        // End:0x48a
        else
        {
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x3f3;
        }
    }
    bDefaultServnChannel = false;
    nIndexDefSrv = ServerList.MultiColumnList.LastSelected;
    nIndexDefCh = ChannelList.MultiColumnList.LastSelected;
}

function InternalOnReOpen()
{
    UnresolvedNativeFunction_97("BTPageServerSelectionCN::InternalOnReOpen()");
    Log("[BTPageServerSelectionCN::InternalOnReOpen] Start");
    Controller.LogMenuStack();
    Log("[BTPageServerSelectionCN::InternalOnReOpen] End");
    bDefaultServnChannel = true;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageServerSelectionCN::InternalOnOpen()");
    Log("[BTPageServerSelectionCN::InternalOnOpen] Start");
    Controller.PushPage();
    Log("[BTPageServerSelectionCN::InternalOnOpen] End");
    bDefaultServnChannel = true;
}

function OnBackToLastPage()
{
    Log("[BTPageServerSelection::OnBackToLastPage] Start");
    currentBGM = page_Main.DefaultLobbyBGM;
    page_Main.LastMainPageBGM = currentBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    RefreshPage();
    // End:0xac
    if(page_Main.bAutoMove)
    {
        class'BTWindowAutoStateHK'.static.ShowState(Controller, 1);
    }
    Log("[BTPageServerSelection::OnBackToLastPage] End");
}

function LogMenuStack()
{
    local int i;
    local export editinline GUIPage Page;

    PlayerOwner().dblog("[CallMenuStack] Start");
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Controller.MenuStack.Length = " $ string(Controller.Count()));
    i = 0;
    J0xa5:
    // End:0x108 [While If]
    if(i < Controller.Count())
    {
        Page = Controller.GetMenuByIndex(i);
        PlayerOwner().dblog(string(i) @ string(Page.Name));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa5;
    }
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("[CallMenuStack] End");
}

function LogControllerInfo()
{
    PlayerOwner().dblog("[ControllerInfo] Start");
    PlayerOwner().dblog("-------------------------------------------");
    PlayerOwner().dblog("Controller Log!!!!!!");
    // End:0xd8
    if(Controller.FocusedControl != none)
    {
        PlayerOwner().dblog("    FocusedControl = " $ string(Controller.FocusedControl.Name));
    }
    // End:0x100
    else
    {
        PlayerOwner().dblog("    FocusedControl = none");
    }
    // End:0x155
    if(Controller.ActiveControl != none)
    {
        PlayerOwner().dblog("    ActiveControl = " $ string(Controller.ActiveControl.Name));
    }
    // End:0x17c
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
        // End:0x2ae
        else
        {
            PlayerOwner().dblog("    FocusedControl = none");
        }
        // End:0x314
        if(Controller.ActivePage.FocusInstead != none)
        {
            PlayerOwner().dblog("    FocusInstead = " $ string(Controller.ActivePage.FocusInstead.Name));
        }
        // End:0x33a
        else
        {
            PlayerOwner().dblog("    FocusInstead = none");
        }
        // End:0x39d
        if(Controller.ActivePage.PageOwner != none)
        {
            PlayerOwner().dblog("    PageOwner = " $ string(Controller.ActivePage.PageOwner.Name));
        }
        // End:0x3c0
        else
        {
            PlayerOwner().dblog("    PageOwner = none");
        }
        // End:0x423
        if(Controller.ActivePage.MenuOwner != none)
        {
            PlayerOwner().dblog("    MenuOwner = " $ string(Controller.ActivePage.MenuOwner.Name));
        }
        // End:0x446
        else
        {
            PlayerOwner().dblog("    MenuOwner = none");
        }
    }
    // End:0x469
    else
    {
        PlayerOwner().dblog("ActivePage = none");
    }
    // End:0x6e6
    if(Controller.TopPage() != none)
    {
        PlayerOwner().dblog("TopPage = " $ string(Controller.TopPage().Name));
        // End:0x51d
        if(Controller.TopPage().FocusedControl != none)
        {
            // This is an implied JumpToken;
            PlayerOwner().NativeFunctionToken(ArgumentOutOfRangeException);
            // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
            // 8 & Type:If Position:1728
            // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
            // 8 & Type:If Position:1728
}

function CMDHK(int Index, optional string Param1, optional string Param2, optional string param3)
{
    local int i;
    local string mergestring;
    local DelegateEventTimer det;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local array<string> arrStr;
    local array<int> BootyUID, BootyIID, BootyPID;

    switch(Index)
    {
        // End:0x11a
        case -999:
            page_Main.page_ServerSelection.ACLServerList[0].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[1].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[2].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[3].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[4].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[5].bShowCount = true;
            page_Main.page_ServerSelection.ACLServerList[6].bShowCount = true;
            // End:0xd3c
            break;
        // End:0x1ab
        case -1:
            // End:0x148
            if(MM.kClanMatch_InChannel)
            {
                MM.kClanMatch_InChannel = false;
            }
            // End:0x159
            else
            {
                MM.kClanMatch_InChannel = true;
            }
            // End:0x1a8
            if(page_Main.page_Lobby2 != none && page_Main.page_curr == page_Main.page_Lobby2)
            {
                page_Main.page_Lobby2.RefreshPage();
            }
            // End:0xd3c
            break;
        // End:0x1f5
        case 0:
            page_Main.page_Lobby2.ButtonRegularClanWar.EnableMe();
            page_Main.page_Lobby2.ButtonRegularClanWar.SetVisibility(true);
            // End:0xd3c
            break;
        // End:0x23f
        case 1:
            page_Main.page_Lobby2.ButtonRegularClanWar.DisableMe();
            page_Main.page_Lobby2.ButtonRegularClanWar.SetVisibility(false);
            // End:0xd3c
            break;
        // End:0x25f
        case 2:
            page_Main.page_ClanWar.RefreshPage();
            // End:0xd3c
            break;
        // End:0x27f
        case 3:
            page_Main.TcpLogin.sfReqClientChallenge();
            // End:0xd3c
            break;
        // End:0x2dc
        case 4:
            // End:0x2aa
            if(page_Main.bNewMailArrived)
            {
                page_Main.bNewMailArrived = false;
            }
            // End:0x2bb
            else
            {
                page_Main.bNewMailArrived = true;
            }
            page_Main.SetNewMailArrived(page_Main.bNewMailArrived);
            // End:0xd3c
            break;
        // End:0x306
        case 5:
            MM.GMLevelFlag = 1;
            MM.bAdminSpectator = true;
            // End:0xd3c
            break;
        // End:0x330
        case 55:
            MM.GMLevelFlag = 2;
            MM.bAdminSpectator = true;
            // End:0xd3c
            break;
        // End:0x37a
        case 6:
            SavePg = Controller.CreateMenu("GUIWarfareControls.BTWindowCreateClanmarkHK");
            // End:0xd3c
            break;
        // End:0x396
        case 7:
            Controller.OpenMenuByObject(SavePg);
            // End:0xd3c
            break;
        // End:0x41e
        case 8:
            det = new class'DelegateEventTimer';
            det.__OnEventTimer__Delegate = ChatBlockStartTime_OnEventTimer;
            GameMgr.AddEventTimerHMS(1000, 0, 0, 3, det);
            det = new class'DelegateEventTimer';
            det.__OnEventTimer__Delegate = ChatBlockEndTime_OnEventTimer;
            GameMgr.AddEventTimerHMS(1001, 0, 0, 6, det);
            // End:0xd3c
            break;
        // End:0x45f
        case 9:
            instanceInfo = GameMgr.FindFirstInstanceItemByItemID(int(Param1));
            GameMgr.AddBlockedItem(instanceInfo.UniqueID);
            // End:0xd3c
            break;
        // End:0x5bb
        case 10:
            mergestring = "";
            // End:0x4a3
            if(Param1 != "")
            {
                // End:0x495
                if(mergestring != "")
                {
                    mergestring @= Param1;
                }
                // End:0x4a3
                else
                {
                    mergestring $= Param1;
                }
            }
            // End:0x4da
            if(Param2 != "")
            {
                // End:0x4cc
                if(mergestring != "")
                {
                    mergestring @= Param2;
                }
                // End:0x4da
                else
                {
                    mergestring $= Param2;
                }
            }
            // End:0x511
            if(param3 != "")
            {
                // End:0x503
                if(mergestring != "")
                {
                    mergestring @= param3;
                }
                // End:0x511
                else
                {
                    mergestring $= param3;
                }
            }
            page_Main.PushNoticeQueue(mergestring);
            PlayerOwner().dblog("Push Notice = " $ mergestring);
            i = 0;
            J0x550:
            // End:0x5b8 [While If]
            if(i < page_Main.BatteryNotice.Length)
            {
                PlayerOwner().dblog("Current Notice [" $ string(i) $ "]= " $ page_Main.BatteryNotice[i]);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x550;
            }
            // End:0xd3c
            break;
        // End:0x626
        case 11:
            // End:0x5ec
            if(SaveCanvas == none)
            {
                PlayerOwner().dblog("SaveCanvas si none");
            }
            PlayerOwner().dblog("Font Toggle UseD3DFont!!!");
            SaveCanvas.BtrToggleUseD3DFont();
            // End:0xd3c
            break;
        // End:0x68a
        case 12:
            // End:0x657
            if(SaveCanvas == none)
            {
                PlayerOwner().dblog("SaveCanvas si none");
            }
            PlayerOwner().dblog("Font texture GC!!!");
            SaveCanvas.BtrFontTextureGC();
            // End:0xd3c
            break;
        // End:0x706
        case 13:
            // End:0x6b5
            if(page_Main.kClanWarUserCountIgnore)
            {
                page_Main.kClanWarUserCountIgnore = false;
            }
            // End:0x6c6
            else
            {
                page_Main.kClanWarUserCountIgnore = true;
            }
            PlayerOwner().dblog("kClanWarUserCountIgnore == " $ string(page_Main.kClanWarUserCountIgnore));
            // End:0xd3c
            break;
        // End:0x714
        case 14:
            LogMenuStack();
            // End:0xd3c
            break;
        // End:0x730
        case 15:
            Controller.LaunchURL(Param1);
            // End:0xd3c
            break;
        // End:0x749
        case 16:
            MM.kTest = true;
            // End:0xd3c
            break;
        // End:0x762
        case 17:
            MM.kCharacterCreation = true;
            // End:0xd3c
            break;
        // End:0x7c6
        case 22:
            // End:0x793
            if(SaveCanvas == none)
            {
                PlayerOwner().dblog("SaveCanvas si none");
            }
            PlayerOwner().dblog("Font SaveTexture!!");
            SaveCanvas.BtrSaveTexture();
            // End:0xd3c
            break;
        // End:0x7ce
        case 23:
            // End:0xd3c
            break;
        // End:0x7d6
        case 24:
            // End:0xd3c
            break;
        // End:0x7de
        case 25:
            // End:0xd3c
            break;
        // End:0x7fe
        case 26:
            page_Main.page_RoomLobby.RefreshPage();
            // End:0xd3c
            break;
        // End:0x849
        case 50:
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, int(Param1), Param2);
            BTWindowDefineInfoHK(Controller.TopPage()).StartTimeOut(5.0);
            // End:0xd3c
            break;
        // End:0x86a
        case 51:
            class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowDefineInfoHK');
            // End:0xd3c
            break;
        // End:0x905
        case 52:
            // End:0x8aa
            if(page_Main.AuthLogin_ChannelType > 0)
            {
                page_Main.AuthLogin_ChannelType = 0;
                MM.kChannelingType = 0;
            }
            // End:0x8cc
            else
            {
                page_Main.AuthLogin_ChannelType = 1;
                MM.kChannelingType = 1;
            }
            PlayerOwner().dblog("MM.kChannelingType = " $ string(MM.kChannelingType));
            // End:0xd3c
            break;
        // End:0x9ae
        case 53:
            // End:0x945
            if(page_Main.AuthLogin_ConnectAlpha > 0)
            {
                page_Main.AuthLogin_ConnectAlpha = 0;
                MM.kConnectAlpha = 0;
            }
            // End:0x967
            else
            {
                page_Main.AuthLogin_ConnectAlpha = 1;
                MM.kConnectAlpha = 1;
            }
            PlayerOwner().dblog("page_Main.AuthLogin_ConnectAlpha = " $ string(page_Main.AuthLogin_ConnectAlpha));
            // End:0xd3c
            break;
        // End:0xa55
        case 59:
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, "siughviuhrg8iuhrg9u74r3gh gf98wh9fhwreuf ewriufw efhiuwehfuiewhfiuwehfiuwehfiuh2498498hg94h9gh498gh4");
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
            // End:0xd3c
            break;
        // End:0xa5d
        case 111:
            // End:0xd3c
            break;
        // End:0xafc
        case 221:
            // End:0xaf9
            if(page_Main.page_MatchResult2 == page_Main.page_curr)
            {
                BootyUID.Length = 1;
                BootyUID[0] = MM.kUID;
                BootyIID.Length = 1;
                BootyIID[0] = int(Param1);
                BootyPID.Length = 1;
                BootyPID[0] = int(Param2);
                page_Main.page_RoomLobby.rfAckGetBooty(0, "", BootyUID, BootyIID, BootyPID);
            }
            // End:0xd3c
            break;
        // End:0xbb7
        case 222:
            Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
            ItemInfo = GameMgr.FindUIItem(int(Param1));
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.PartID = int(Param2);
            instanceInfo.PaintID = int(param3);
            BTWindowModifyHK(Controller.TopPage()).SetData(ItemInfo, instanceInfo);
            // End:0xd3c
            break;
        // End:0xc82
        case 223:
            Controller.OpenMenu("GUIWarfareControls.BTWindowTrophyHK2");
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.PartID = int(Param2);
            instanceInfo.OverlapCount = 1;
            BTWindowTrophyHK2(Controller.TopPage()).SetData(MM.kUserName, "", MM.kUserName, none, none, GameMgr.FindUIItem(int(Param1)), instanceInfo);
            // End:0xd3c
            break;
        // End:0xcbe
        case 444:
            PlayerOwner().dblog(Param1 @ Param2);
            page_Main.SetAASMessage(1, int(Param2));
            // End:0xd3c
            break;
        // End:0xd01
        case 999:
            arrStr.Length = 1;
            arrStr[0] = Param1;
            page_Main.TcpChannel.sfReqSendMemo(arrStr, Param2, 0);
            // End:0xd3c
            break;
        // End:0xd39
        case 1000:
            MM.IsFixedAssistPoint = bool(Param1);
            MM.FixedAssistTime = float(Param2);
            // End:0xd3c
            break;
        // End:0xffff
        default:
}

function TestTestTest()
{
    local int ret;
    local ClanMarkManager cmm;

    cmm = new class'ClanMarkManager';
    cmm.AddClanMark("b", 2, 2, 2);
    cmm.AddClanMark("a", 1, 1, 1);
    cmm.AddClanMark("z", 5, 5, 5);
    cmm.AddClanMark("d", 4, 4, 4);
    cmm.AddClanMark("c", 3, 3, 3);
    ret = cmm.FindClanMark("b");
    ret = cmm.FindClanMark("c");
    ret = cmm.FindClanMark("d");
    ret = cmm.FindClanMark("e");
}

function InitializeDelegate()
{
    MM.__CMDHK__Delegate = CMDHK;
}

function UnInitializeDelegate()
{
    MM.__CMDHK__Delegate = None;
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    MM.__UpdateCharInfo__Delegate = None;
    MM.__UpdateClanInfo__Delegate = None;
    MM.__UpdateClanList__Delegate = None;
    MM.__UpdateFriendList__Delegate = None;
    MM.__UpdatePCBangList__Delegate = None;
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
            class'BTWindowInfoHK'.static.ShowWindow(Controller, "", "Disconnected a LoginServer");
            Log("class'BTWindowInfoHK'.static.ShowWindow() End");
        }
    }
    // End:0x1f0
    else
    {
        Log("page_Main.bConnectedLoginServer == true");
        Log("page_Main.TcpLogin.sfReqServerList()");
        page_Main.TcpLogin.sfReqServerList();
    }
    LastRefreshTime = PlayerOwner().Level.TimeSeconds;
    MM.SetTcpTimeOutInUI();
}

function RefreshVisibleSet()
{
    Log("page_Main.TcpLogin.sfReqServerList()");
    page_Main.TcpLogin.sfReqServerList();
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageServerSelection::InternalOnClose()");
    Controller.LogMenuStack();
}

function OnVisibleChannelListChanged(int Index)
{
    SaveServerListIndex = Index;
}

function AutoMoveAtFirstLogin()
{
    // End:0x50
    if(page_Main.bFirstLogin)
    {
        // End:0x2a
        if(MM.kLevel <= 5)
        {
        }
        // End:0x3f
        else
        {
            // End:0x3f
            if(MM.kLevel <= 8)
            {
            }
        }
        page_Main.bFirstLogin = false;
    }
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
    MM.PI_EnterChannel(page_Main.SCIList[i].ServerGroupID, page_Main.SCIList[i].ServerGroupName, page_Main.SCIList[i].ServerID, page_Main.SCIList[i].ServerName, page_Main.SCIList[i].ChannelID, page_Main.SCIList[i].ChannelName, page_Main.SCIList[i].IsClanChannel > 0, page_Main.SCIList[i].ChannelTypeValue, page_Main.SCIList[i].IsDedicatedServer);
    ConnectingChannel.ServerID = page_Main.SCIList[i].ServerID;
    ConnectingChannel.ChannelID = page_Main.SCIList[i].ChannelID;
    ConnectingChannel.IP = page_Main.SCIList[i].ServerIP;
    ConnectingChannel.Port = page_Main.SCIList[i].serverPort;
    ConnectingChannel.DataPort = page_Main.SCIList[i].ServerDataPort;
    Log("page_Main.LoginToChannel( " $ ConnectingChannel.IP $ ", " $ string(ConnectingChannel.Port) $ " , " $ string(ConnectingChannel.DataPort) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
}

function NewMoveToChannel(BTACLServerSelectionHK serverACL)
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
    Log("page_Main.LoginToChannel( " $ ConnectingChannel.IP $ ", " $ string(ConnectingChannel.Port) $ " , " $ string(ConnectingChannel.DataPort) $ ")");
    page_Main.TcpLogin.sfReqLogOut(2);
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
    // End:0x5d
    if(nIndex < 4)
    {
        ChannelBg.BackgroundImage = class'BTUIResourcePoolHK'.default.ChannelBgBeginner;
    }
    // End:0x134
    else
    {
        // End:0x97
        if(nIndex >= 4 && nIndex < 8)
        {
            ChannelBg.BackgroundImage = class'BTUIResourcePoolHK'.default.ChannelBgTraining;
        }
        // End:0x134
        else
        {
            // End:0xd1
            if(nIndex >= 8 && nIndex < 24)
            {
                ChannelBg.BackgroundImage = class'BTUIResourcePoolHK'.default.ChannelBgNormal;
            }
            // End:0x134
            else
            {
                // End:0x10b
                if(nIndex >= 24 && nIndex < 28)
                {
                    ChannelBg.BackgroundImage = class'BTUIResourcePoolHK'.default.ChannelBgExpert;
                }
                // End:0x134
                else
                {
                    // End:0x134
                    if(nIndex >= 28)
                    {
                        ChannelBg.BackgroundImage = class'BTUIResourcePoolHK'.default.ChannelBgClan;
                    }
                }
            }
        }
    }
    Split = serverACL.GetRowByIndex(nIndex);
    i = 0;
    J0x155:
    // End:0x4cd [While If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x4c3
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new class'BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = class'BTUIResourcePoolHK'.default.newlist_Channel_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            // End:0x28b
            if(row.DataPerColumn[0].strValue == "")
            {
            }
            // End:0x4c3
            else
            {
                row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
                row.DataPerColumn[0].tempValue = page_Main.SCIList[i].ChannelTypeValue;
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
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x155;
    }
}

function FirstShowChannelList()
{
    local int nIndex, i;
    local BTAutoColumnListDataHK Split, row;

    ChannelList.RemoveAll();
    // End:0x1c
    if(nIndex < 0)
    {
        return;
    }
    Split = ServerList.GetRowByIndex(0);
    i = 0;
    J0x39:
    // End:0x3e4 [While If]
    if(i < page_Main.SCIList.Length)
    {
        // End:0x3da
        if(page_Main.SCIList[i].ServerName == Split.DataPerColumn[3].strValue)
        {
            row = new class'BTAutoColumnListDataHK';
            row.Init(7);
            row.BackgroundImage = class'BTUIResourcePoolHK'.default.newlist_Channel_n;
            row.DataPerColumn[0].Text[0].FontDrawType = 3;
            row.DataPerColumn[0].Text[1].FontDrawType = 3;
            row.DataPerColumn[0].Text[2].FontDrawType = 3;
            row.DataPerColumn[0].strValue = page_Main.SCIList[i].ChannelName;
            row.DataPerColumn[0].IntValue = page_Main.SCIList[i].ChannelID;
            row.DataPerColumn[0].tempValue = page_Main.SCIList[i].ChannelTypeValue;
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
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

function bool rfAckServerListFromLoginServer(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    NewDrawServerSelection(CServername, CServerShortName, ServerIP, serverPort, ChannelName, ChannelNickName, ChannelNum, chMaxUser, chCurUser, ServerGroupName, ServerGroupID, ServerDispOrder, DataPort, OptionCount_byte, OptionKey_byte, OptionValue_byte, OptionCount_int, OptionKey_int, OptionValue_int, OptionCount_float, OptionKey_float, OptionValue_float, IsClanChannel, IsUseDedicateHost);
    bDefaultServnChannel = true;
    return true;
}

function NewDrawServerSelection(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    local BTAutoColumnListDataHK row;
    local int i, j, k;
    local array<byte> CurrentOption_Byte_Key, CurrentOption_Byte_Value, CurrentOption_Int_Key;
    local array<int> CurrentOption_Int_Value;
    local array<byte> CurrentOption_Float_Key;
    local array<float> CurrentOption_Float_Value;
    local int ocount_byte_length, ocount_byte_index, ocount_int_length, ocount_float_length;
    local array<int> ChannelTypeOption;
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
    // End:0x184 [While If]
    if(i < ServerGroupName.Length)
    {
        Log("[" $ string(i) $ "] " $ ServerIP[i] $ ", " $ string(serverPort[i]) $ ", " $ ChannelName[i] $ ", " $ string(ChannelNum[i]) $ ", " $ string(chMaxUser[i]) $ ", " $ string(chMaxUser[i]) $ ", " $ string(chCurUser[i]) $ ", " $ ServerGroupName[i] $ ", " $ string(ServerGroupID[i]) $ ", " $ string(DataPort[i]) $ ", " $ string(IsClanChannel[i]) $ ", " $ string(IsUseDedicateHost[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x66;
    }
    i = 0;
    J0x18b:
    // End:0x28f [While If]
    if(i < ServerGroupName.Length)
    {
        foundDuplicate = false;
        j = 0;
        J0x1aa:
        // End:0x1ea [While If]
        if(j < distinctiveServerNames.Length)
        {
            // End:0x1e0
            if(distinctiveServerNames[j] == ServerGroupName[i])
            {
                foundDuplicate = true;
            }
            // End:0x1ea
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x1aa;
            }
        }
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18b;
    }
    j = 0;
    J0x296:
    // End:0x342 [While If]
    if(j < distinctiveServerNames.Length)
    {
        i = 0;
        J0x2ad:
        // End:0x306 [While If]
        if(i < ServerGroupName.Length)
        {
            // End:0x2fc
            if(distinctiveServerNames[j] == ServerGroupName[i])
            {
                nMaxUser += chMaxUser[i];
                nCurUser += chCurUser[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2ad;
        }
        arMaxuser[arMaxuser.Length] = nMaxUser;
        arCurUser[arCurUser.Length] = nCurUser;
        nCurUser = 0;
        nMaxUser = 0;
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x296;
    }
    i = 0;
    J0x349:
    // End:0x57f [While If]
    if(i < distinctiveServerNames.Length)
    {
        row = new class'BTAutoColumnListDataHK';
        row.Init(7);
        row.BackgroundImage = class'BTUIResourcePoolHK'.default.newlist_serv_n;
        row.DataPerColumn[0].ServerGroupImg = class'BTUIResourcePoolHK'.default.ServerGroup[0];
        row.DataPerColumn[1].IntValue = int(float(row.DataPerColumn[2].IntValue) / float(row.DataPerColumn[2].tempValue) * float(100));
        row.DataPerColumn[1].strValue = distinctiveChannelNames[i];
        row.DataPerColumn[2].IntValue = arCurUser[i];
        row.DataPerColumn[2].tempValue = arMaxuser[i];
        row.DataPerColumn[3].strValue = distinctiveChannelNames[i];
        row.DataPerColumn[3].IntValue = arServerGroupID[i];
        row.DataPerColumn[3].tempValue = arServerDispOrder[i];
        row.DataPerColumn[4].IntValue = DataPort[i];
        row.DataPerColumn[5].strValue = distIPs[i];
        row.DataPerColumn[5].IntValue = distPorts[i];
        row.DataPerColumn[6].IntValue = IsClanChannel[i];
        ServerList.AddRow(row);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x349;
    }
    page_Main.ClearServerChannelList();
    ocount_byte_index = 0;
    i = 0;
    J0x59c:
    // End:0x87d [While If]
    if(i < CServername.Length)
    {
        ocount_byte_length = OptionCount_byte[i];
        ocount_int_length = OptionCount_int[i];
        ocount_float_length = OptionCount_float[i];
        CurrentOption_Byte_Key.Length = ocount_byte_length;
        CurrentOption_Byte_Value.Length = ocount_byte_length;
        CurrentOption_Int_Key.Length = ocount_int_length;
        CurrentOption_Int_Value.Length = ocount_int_length;
        CurrentOption_Float_Key.Length = ocount_float_length;
        CurrentOption_Float_Value.Length = ocount_float_length;
        k = 0;
        J0x634:
        // End:0x749 [While If]
        if(k < ocount_byte_length)
        {
            // End:0x66d
            if(OptionKey_byte.Length > 0)
            {
                CurrentOption_Byte_Key[k] = OptionKey_byte[k + ocount_byte_index];
            }
            // End:0x697
            if(OptionValue_byte.Length > 0)
            {
                CurrentOption_Byte_Value[k] = OptionValue_byte[k + ocount_byte_index];
            }
            // End:0x6c1
            if(OptionKey_int.Length > 0)
            {
                CurrentOption_Int_Key[k] = OptionKey_int[k + ocount_byte_index];
            }
            // End:0x6eb
            if(OptionValue_int.Length > 0)
            {
                CurrentOption_Int_Value[k] = OptionValue_int[k + ocount_byte_index];
            }
            // End:0x715
            if(OptionKey_float.Length > 0)
            {
                CurrentOption_Float_Key[k] = OptionKey_float[k + ocount_byte_index];
            }
            // End:0x73f
            if(OptionValue_float.Length > 0)
            {
                CurrentOption_Float_Value[k] = OptionValue_float[k + ocount_byte_index];
            }
            ++ k;
            // This is an implied JumpToken; Continue!
            goto J0x634;
        }
        ocount_byte_index += ocount_byte_length;
        ChannelTypeOption.Length = CServername.Length;
        k = 0;
        J0x769:
        // End:0x7ad [While If]
        if(k < ocount_byte_length)
        {
            // End:0x7a3
            if(CurrentOption_Int_Key[k] == 17)
            {
                ChannelTypeOption[i] = CurrentOption_Int_Value[k];
            }
            ++ k;
            // This is an implied JumpToken; Continue!
            goto J0x769;
        }
        page_Main.AddServerChannelList(ServerDispOrder[i], ChannelNum[i], ServerIP[i], serverPort[i], DataPort[i], CServername[i], CServerShortName[i], ChannelName[i], ServerGroupID[i], ServerGroupName[i], IsClanChannel[i], ChannelNickName[i], ChannelTypeOption[i], IsUseDedicateHost[i] > 0, chCurUser[i], chMaxUser[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x59c;
    }
    TabControl.SetVisiblePanel(SaveServerListIndex);
    // End:0x8bd
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
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageServerSelection::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x130
    if(ErrCode == 0)
    {
        // End:0xeb
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0xab
            if(page_Main.TcpLogin == none)
            {
                Log("page_Main.TcpLogin is none");
            }
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
        }
        // End:0x12d
        else
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }
    }
    // End:0x170
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
}

function TcpChannel_OnConnect(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x232
    if(ErrCode == 0)
    {
        page_Main.bConnectedChannelServer = true;
        Log("page_Main.TcpChannel.sfReqLogin2(" $ page_Main.rMM.kUserName $ ", " $ string(page_Main.LoginTimeStamp) $ ", " $ string(page_Main.LoginHash1) $ ", " $ string(page_Main.LoginHash2) $ ", " $ string(page_Main.LoginHash3) $ ", " $ string(page_Main.LoginHash4) $ ", " $ string(page_Main.LoginHash5) $ ", " $ page_Main.AuthLogin_GUID $ ", " $ string(page_Main.AuthLogin_ChannelingType) $ ")");
        page_Main.TcpChannel.sfReqSetClientVersion(page_Main.rMM.GetClientVersion());
        page_Main.TcpChannel.sfReqLogin2(page_Main.rMM.kUserName, page_Main.LoginTimeStamp, page_Main.LoginHash1, page_Main.LoginHash2, page_Main.LoginHash3, page_Main.LoginHash4, page_Main.LoginHash5, page_Main.AuthLogin_GUID, page_Main.AuthLogin_ChannelingType);
    }
    // End:0x2c3
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 9, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, class'BTWindowDefineInfoHK'.static.GetFormatString(9, string(ErrCode)));
    }
}

function TcpChannel_OnClose(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnClose] ErrCode=" $ string(ErrCode));
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 10, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    // End:0xdd
    if(ErrCode != 0)
    {
        Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, class'BTWindowDefineInfoHK'.static.GetFormatString(10, string(ErrCode)));
    }
    page_Main.bConnectedChannelServer = false;
}

function TcpChannel_OnError(int ErrCode)
{
    Log("[BTPageServerSelection::TcpChannel_OnError] ErrCode=" $ string(ErrCode));
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 11, string(ErrCode));
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    Controller.ViewportOwner.Actor.Level.GetMatchMaker().SendErrorReportS(ErrCode, class'BTWindowDefineInfoHK'.static.GetFormatString(11, string(ErrCode)));
    page_Main.bConnectedChannelServer = false;
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageServerSelection::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Index;
    local SystemMsgParam MsgInfo;

    Log("[BTPageServerSelection::rfAckEnterChannel] Result=" $ string(Result));
    // End:0x6a2
    if(Result == 0)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        page_Main.ResetChatLog();
        // End:0x10e
        if(true == MM.IsPlayingPCBang())
        {
            // End:0x10e
            if(MM.kIsPaidPCBang >= 0)
            {
                // End:0xeb
                if(MM.kIsPaidPCBang == 1)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(178), 5, true);
                }
                // End:0x10e
                else
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(177), 5, true);
                }
            }
        }
        Controller.PopPage();
        MsgInfo.MsgCode = 5;
        MsgInfo.CharName = UserID;
        MsgInfo.ServerID = page_Main.rMM.kServerID;
        MsgInfo.ChannelNum = page_Main.rMM.kChannelID;
        page_Main.TcpChannel.sfReqSendSystemMsg(1, UserID, "", MsgInfo);
        Log("page_Main.TcpChannel.sfReqSendSystemMsg(1, " $ UserID $ ", , msginfo) MsgCode=5");
        page_Main.bWarningDurabilityAndExpired = true;
        Log("page_Main.TcpChannel.sfReqLimitedListInChannel()");
        page_Main.TcpChannel.sfReqLimitedListInChannel();
        MM.kUserName = UserID;
        MM.kLevel = Level;
        MM.kUID = UID;
        MM.kLevelMarkID = LevelMarkID;
        MM.kTitleMarkID = TitleMarkID;
        MM.kReserved1 = Reserved1;
        MM.kReserved2 = Reserved2;
        MM.kReserved3 = Reserved3;
        MM.kClanName = ClanName;
        MM.kInClanGrade = ClanGrade;
        MM.kClanPattern = ClanMarkPattern;
        MM.kClanBG = ClanMarkBG;
        MM.kClanBL = ClanMarkBL;
        MM.kClanLevel = ClanLevel;
        GameMgr.cmm.AddClanMark(MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, true, IsLookFor > 0);
        GameMgr.cmm.SetClanLevel(MM.kClanName, MM.kClanLevel);
        GameMgr.SP.kClanPattern_Img = GameMgr.GetClanMark32(ClanMarkPattern);
        GameMgr.SP.kClanBG_Img = GameMgr.GetClanMark32(ClanMarkBG);
        GameMgr.SP.kClanBL_Img = GameMgr.GetClanMark32(ClanMarkBL);
        MM.kClanWin = ClanWin;
        MM.kClanLose = ClanLose;
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
        Index = page_Main.FindServerConnectionInfoIndex(ConnectingChannel.ServerID, ConnectingChannel.ChannelID);
        MM.PI_EnterChannel(page_Main.SCIList[Index].ServerGroupID, page_Main.SCIList[Index].ServerGroupName, page_Main.SCIList[Index].ServerID, page_Main.SCIList[Index].ServerName, page_Main.SCIList[Index].ChannelID, page_Main.SCIList[Index].ChannelName, page_Main.SCIList[Index].IsClanChannel > 0, page_Main.SCIList[Index].ChannelTypeValue, page_Main.SCIList[Index].IsDedicatedServer);
        MM.UpdatePositionInfo(MM);
        MM.kConnectAlpha = byte(int(Controller.ViewportOwner.Actor.ConsoleCommand("GETTEST_STRING TEST ConnectAlpha")));
        page_Main.AuthLogin_ConnectAlpha = MM.kConnectAlpha;
        page_Main.bAuthKeySuccess = true;
        page_Main.SetPage(7, false);
    }
    // End:0x7d4
    else
    {
        // End:0x70a
        if(Result == 16)
        {
            page_Main.bAuthKeySuccess = true;
            page_Main.EndAutoMove();
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
        }
        // End:0x7d4
        else
        {
            // End:0x789
            if(Result == 498 || Result == 497)
            {
                page_Main.bAuthKeySuccess = true;
                page_Main.EndAutoMove();
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
                BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
            }
            // End:0x7d4
            else
            {
                page_Main.EndAutoMove();
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
                BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
            }
        }
    }
    return true;
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    Log("[BTPageServerSelection::rfAckLeaveChannel] Result=" $ string(Result));
    return true;
}

function bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    local wMyPlayerStatus MyStatus;
    local BtrTime t;
    local DelegateEventTimer det;
    local bool bFirstSet;

    Log("[BTPageServerSelection::rfAckLogin2] UserID=" $ string(UserID) $ ", Charname=" $ CharName $ ", " $ "Result=" $ string(Result));
    // End:0x6bb
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
        Log("page_Main.TcpChannel.sfReqItemList(" $ string(UserID) $ ")");
        GameMgr.ClearInstanceItem();
        page_Main.TcpChannel.sfReqItemList(UserID);
        Log("page_Main.TcpChannel.sfReqUserSkillList(" $ string(UserID) $ ")");
        page_Main.TcpChannel.sfReqUserSkillList(UserID);
        Log("page_Main.TcpChannel.sfReqQSlotList()");
        page_Main.TcpChannel.sfReqQSlotList();
        Log("page_Main.TcpChannel.sfReqFriendList()");
        page_Main.TcpChannel.sfReqFriendList();
        Log("page_Main.TcpChannel.sfReqQuestList()");
        page_Main.TcpChannel.sfReqQuestList();
        Log("page_Main.TcpChannel.sfReqWebzenCash()");
        page_Main.TcpChannel.sfReqWebzenCash();
        Log("page_Main.TcpChannel.sfReqShopItemData(0)");
        page_Main.TcpChannel.sfReqShopItemData(0);
        page_Main.TcpChannel.sfReqCharBlockInfo();
        MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
        MyStatus.UserID = UserID;
        MyStatus.NickName = CharName;
        MyStatus.CurrentTime = CurServerTime;
        // End:0x49a
        if(GameMgr.kServerTime.dummy_1_DO_NOT_USE == 0 && GameMgr.kServerTime.dummy_2_DO_NOT_USE == 0)
        {
            bFirstSet = true;
        }
        // End:0x4a2
        else
        {
            bFirstSet = false;
        }
        page_Main.rMM.kUID = UserID;
        page_Main.rMM.kUserName = CharName;
        GameMgr.SetServerTime(CurServerTime);
        GameMgr.UpdateServerTime(GameMgr);
        page_Main.rMM.UpdateCharInfo(page_Main.rMM);
        page_Main.rMM.UpdateClanInfo(page_Main.rMM);
        BtrDoubleToBtrTime(CurServerTime, t);
        Log(string(t.Year) @ string(t.Month) @ string(t.Day) @ "/" @ string(t.Hour) @ string(t.Minute) @ string(t.Second) @ string(t.Milliseconds) @ "+" @ string(t.DayOfWeek));
        Log(string(CurServerTime.dummy_1_DO_NOT_USE) $ ", " $ string(CurServerTime.dummy_2_DO_NOT_USE));
        // End:0x659
        if(bFirstSet)
        {
            det = new class'DelegateEventTimer';
            det.__OnEventTimer__Delegate = page_Main.ShowPlayTimePerHour_OnEventTimer;
            GameMgr.AddEventTimerHMS(9999, 1, 0, 0, det);
        }
        Log("##GMLOG: [BTPageServerSelection] IsGM - " $ string(IsGM));
        switch(IsGM)
        {
            // End:0x6a5
            case 1:
                CMDHK(5);
                // End:0x6b8
                break;
            // End:0x6b5
            case 2:
                CMDHK(55);
                // End:0x6b8
                break;
            // End:0xffff
            default:
                // End:0x706 Break;
                break;
            }
    }
    Controller.PopPage();
    class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    return true;
}

function bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckItemListStart] Count=" $ string(Count) $ ", " $ "Result=" $ string(Result));
    // End:0xa9
    if(Result != 0)
    {
        Log("[BTPageServerSelection.rfAckItemListStart] Error ErrMsg=" $ ErrMsg);
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemListStart(Count);
    return true;
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
    // End:0x71 [While If]
    if(i < PaintID.Length)
    {
        PaintingItemID[i] = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetItemList(UniqueID, ItemID, ItemType, Durability, UntilTime, SlotPosition, AddPartsID, DamageDegree, ItemState, StackCount, PaintingItemID);
    PlayerOwner().dblog("=========================================");
    PlayerOwner().dblog("Receive ItemList From ChannelServer");
    PlayerOwner().dblog("=========================================");
    i = 0;
    J0x18d:
    // End:0x2e4 [While If]
    if(i < UniqueID.Length)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID[i]);
        instanceInfo = GameMgr.AddInstanceItemByParameter(ItemID[i], UniqueID[i], 0, SlotPosition[i], ItemState[i], Durability[i], AddPartsID[i], PaintingItemID[i], StackCount[i], DamageDegree[i], UntilTime[i], false, TradeCount[i]);
        PlayerOwner().dblog("SlotPos = " $ string(instanceInfo.SlotPosition) @ ", ItemID = " $ string(ItemInfo.ItemID) @ ", Dur = " $ string(instanceInfo.Durability) @ ", ItemName = " $ ItemInfo.ItemName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18d;
    }
    PlayerOwner().dblog("=========================================");
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
    // End:0x353
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
        J0x30a:
        // End:0x353 [While If]
        if(i < Pool.Length)
        {
            GameMgr.CandidateLists[i] = GameMgr.FindUIItem(Pool[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x30a;
        }
    }
    CTRP.bItemListEnd = true;
    CheckToSetPageLobby();
    Log("[BTPageServerSelection::rfAckItemListEnd] Success Update UIItem");
    return true;
}

function bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckUserSkillListStart] Result=" $ string(Result));
    // End:0xa3
    if(Result == 0)
    {
        GameMgr.ClearSkillBoxList();
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillListStart(Count);
    }
    // End:0xbc
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
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
    // End:0x205 [While If]
    if(i < UniqueSkillID.Length)
    {
        ItemInfo = GameMgr.FindUIItem(SkillID[i]);
        PlayerOwner().dblog("SkillName = " $ ItemInfo.ItemName @ "SlotPos = " $ string(SlotPosition[i]) @ "ItemID = " $ string(ItemInfo.ItemID));
        GameMgr.AddUISkillBox(SlotPosition[i], SkillID[i], UniqueSkillID[i], UntilTime[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x129;
    }
    PlayerOwner().dblog("=========================================");
    return true;
}

function bool rfAckUserSkillListEnd()
{
    Log("[BTPageServerSelection::rfAckUserSkillListEnd]");
    Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.SetSkillListEnd();
    GameMgr.AddInstanceSkillItemFromSkillBoxList();
    CTRP.bSkillListEnd = true;
    CheckToSetPageLobby();
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

function bool rfAckServerTime(int Time)
{
    Log("[BTPageServerSelection::rfAckServerTime] Time" $ string(Time));
    Controller.SetTime(Time);
    CTRP.bServerTimeEnd = true;
    CheckToSetPageLobby();
    return true;
}

function CheckToSetPageLobby()
{
    Log("[BTPageServerSelection::CheckToSetPageLobby]");
    // End:0x159
    if(CTRP.bItemListEnd && CTRP.bSkillListEnd && CTRP.bQSListEnd && CTRP.bServerTimeEnd && CTRP.bHashEnd && CTRP.bGetServerTimeEnd && CTRP.bGetMyMailBoxState)
    {
        Log("page_Main.TcpChannel.sfReqEnterChannel(" $ string(ConnectingChannel.ChannelID) $ ")");
        page_Main.TcpChannel.sfReqEnterChannel(ConnectingChannel.ChannelID);
        CTRP.bItemListEnd = false;
        CTRP.bSkillListEnd = false;
        CTRP.bQSListEnd = false;
        CTRP.bServerTimeEnd = false;
        CTRP.bHashEnd = false;
        CTRP.bGetServerTimeEnd = false;
        CTRP.bGetMyMailBoxState = false;
    }
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
    // End:0x146
    else
    {
        Log("[BTPageServerSelection::rfAckHash] Success, SetPage(EPage_Lobby2)");
        // End:0x10a
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
        {
            page_Main.HaltNetwork();
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = rfAckHash_BTWindowErrorDefineHK_OnOK;
    }
    return true;
}

function bool rfAckHash_BTWindowErrorDefineHK_OnOK(GUIComponent Sender)
{
    // End:0x8e
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() && Controller.ViewportOwner.Actor.Level.bServiceBuildHK == false)
    {
        Console(Controller.Master.Console).ConsoleCommand("exit");
    }
    // End:0xa1
    else
    {
        CTRP.bHashEnd = true;
        CheckToSetPageLobby();
    }
    CTRP.bHashEnd = true;
    CheckToSetPageLobby();
    return true;
}

function bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    Log("Received representive relay server addr: " $ RelayIP $ " " $ string(RelayPort));
    page_Main.rMM.szRelayIP = RelayIP;
    page_Main.rMM.nRelayPort = RelayPort;
    return true;
}

function bool rfAckNotifyExpiredItemIDs(int UserID, array<BtrDouble> ExpiredItemUniqueIDs, array<int> ExpiredItemIDs, array<int> ExpiredItemPartIDs, array<byte> ExpiredItemSlotPos, int Result, string ErrMsg)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfAckNotifyExpiredItemIDs] Result=" $ string(Result) $ ", UserID=" $ string(UserID) $ ", ExpiredItemIDs.Length=" $ string(ExpiredItemIDs.Length));
    iProcessExpiredStep = 0;
    // End:0xb1
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    iProcessExpiredStep = 1;
    page_Main.CompleteExpiredItem();
    // End:0x1aa
    if(ExpiredItemUniqueIDs.Length > 0)
    {
        i = 0;
        J0xdb:
        // End:0x1aa [While If]
        if(i < ExpiredItemUniqueIDs.Length)
        {
            instanceInfo = GameMgr.FindInstanceItem(ExpiredItemUniqueIDs[i]);
            // End:0x149
            if(instanceInfo.SlotPosition == 0 || instanceInfo.SlotPosition == 1)
            {
                SetDefaultWeapon(instanceInfo.SlotPosition);
            }
            GameMgr.RemoveInstanceItem(ExpiredItemUniqueIDs[i]);
            page_Main.AddExpiredItem(ExpiredItemIDs[i], ExpiredItemUniqueIDs[i], ExpiredItemSlotPos[i], ExpiredItemPartIDs[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xdb;
        }
    }
    return true;
}

function bool rfAckNotifyExpiredSkillIDs(int UserID, array<BtrDouble> ExpiredSkillUniqueIDs, array<int> ExpiredSkillIDs, int Result, string ErrMsg, array<byte> ExpiredSkillSlotPositions)
{
    local int i;

    Log("[BTPageServerSelection::rfAckNotifyExpiredSkillIDs]");
    // End:0x5d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x79
    if(iProcessExpiredStep != 1)
    {
        page_Main.CompleteExpiredItem();
    }
    iProcessExpiredStep = 2;
    i = 0;
    J0x88:
    // End:0xf4 [While If]
    if(i < ExpiredSkillIDs.Length)
    {
        GameMgr.RemoveInstanceItemByUniqueSkillID(UnresolvedNativeFunction_99(ExpiredSkillUniqueIDs[i]));
        page_Main.AddExpiredSkillItem(ExpiredSkillIDs[i], UnresolvedNativeFunction_99(ExpiredSkillUniqueIDs[i]), ExpiredSkillSlotPositions[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x88;
    }
    iProcessExpiredStep = 0;
    return true;
}

function bool BTWindowItemExpiredHK_OnOK_CheckDurX(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    page_Main.CheckDestroyedDurabilityXItemList();
    return true;
}

function bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    local int ReservedItemID, PrevSlotPos;
    local BtrDouble ReservedUniqueID;
    local wItemBoxHK ItemInfo;
    local export editinline BTWindowItemExpiredHK BTWindow;
    local int ReservedCategoryID, ReservedPackageID, ReservedPriceID;
    local array<int> temp;
    local int lp1, iResult;
    local bool bAddItem;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    iResult = 0;
    bAddItem = false;
    Log("[BTPageServerSelection::rfAckBuyShopItem] ItemCount=" $ string(ItemCount));
    lp1 = 0;
    J0x86:
    // End:0x1b9 [While If]
    if(lp1 < ItemCount)
    {
        // End:0xba
        if(Result[lp1] != 0)
        {
            iResult = Result[lp1];
        }
        // End:0x1af
        else
        {
            ItemInfo = GameMgr.FindUIItem(BoughtItemTypeID[lp1]);
            bAddItem = true;
            // End:0x15e
            if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
            {
                GameMgr.AddInstanceItemByParameter(BoughtItemTypeID[lp1], EmptyBtrDouble(), UnresolvedNativeFunction_99(BoughtItemUniqueID[lp1]), 13, 1, 100000, BoughtPartID[lp1], 0, BoughtStackCnt[lp1], 0, BoughtUntilTIme[lp1]);
            }
            // End:0x1af
            else
            {
                GameMgr.AddInstanceItemByParameter(BoughtItemTypeID[lp1], BoughtItemUniqueID[lp1], 0, 13, 1, 100000, BoughtPartID[lp1], 0, BoughtStackCnt[lp1], 0, BoughtUntilTIme[lp1]);
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x86;
    }
    // End:0x209
    if(bAddItem == true)
    {
        GameMgr.UpdateItemList(GameMgr);
        MM.kPoint = PointRemain;
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x32d
    if(iResult != 0)
    {
        BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
        // End:0x2e8
        if(BTWindow != none)
        {
            // End:0x2a0
            if(page_Main.iSendUpdateQuickSlotList.Length > 0)
            {
                page_Main.RequestUpdateQuickSlot(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]);
                page_Main.iSendUpdateQuickSlotList.Length = page_Main.iSendUpdateQuickSlotList.Length - 1;
            }
            BTWindow.RemoveAllExpiredItem();
            page_Main.TcpChannel.sfReqItemList(MM.kUID);
            Controller.CloseMenu(false);
        }
        // End:0x312
        else
        {
            // End:0x312
            if(BTWindowHK(Controller.TopPage()) != none)
            {
                Controller.CloseMenu(false);
            }
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, iResult);
        return true;
    }
    BTWindow = BTWindowItemExpiredHK(Controller.TopPage());
    // End:0x5e8
    if(BTWindow != none)
    {
        ReservedItemID = BTWindow.PopExpiredItemID();
        PrevSlotPos = BTWindow.PopExpiredSlotPos();
        ReservedUniqueID = BTWindow.PopExpiredUniqueID();
        Log("[BTPageServerSelection::rfAckBuyShopItem] SlotPos=" $ string(PrevSlotPos));
        // End:0x44f
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            // End:0x42c
            if(PrevSlotPos != 13)
            {
                page_Main.TcpChannel.sfReqEquipSkill(BoughtItemTypeID[0], UnresolvedNativeFunction_99(BoughtItemUniqueID[0]), byte(PrevSlotPos));
            }
            GameMgr.ReplaceQuickSkillSlotItem(BoughtItemTypeID[0], UnresolvedNativeFunction_99(BoughtItemUniqueID[0]));
        }
        // End:0x4a8
        else
        {
            // End:0x486
            if(PrevSlotPos != 13)
            {
                page_Main.TcpChannel.sfReqEquipItem(BoughtItemTypeID[0], BoughtItemUniqueID[0], PrevSlotPos);
            }
            GameMgr.ReplaceQuickSlotBoxItem(ReservedUniqueID, BoughtItemTypeID[0], BoughtItemUniqueID[0]);
        }
        // End:0x5d1
        if(ReservedItemID == -1)
        {
            PlayerOwner().PlaySound(Controller.ItemBuySound, 6, 1.0);
            Controller.CloseMenu(false);
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 127);
            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemExpiredHK_OnOK_CheckDurX;
            page_Main.TcpChannel.sfReqWebzenCash();
            // End:0x59e
            if(page_Main.iSendUpdateQuickSlotList.Length > 0)
            {
                page_Main.RequestUpdateQuickSlot(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]);
                page_Main.iSendUpdateQuickSlotList.Length = page_Main.iSendUpdateQuickSlotList.Length - 1;
            }
            GameMgr.UpdateItemList(GameMgr);
            page_Main.UpdateExpiredItemList(page_Main);
        }
        // End:0x5e5
        else
        {
            BTWindow.PopAndBuy(ReservedItemID);
        }
    }
    // End:0x66a
    else
    {
        // End:0x66a
        if(BTWindowHK(Controller.TopPage()) != none)
        {
            BTWindowHK(Controller.TopPage()).StopTimeOut();
            BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWindowBuyShopItem_OnOK;
            BTWindowHK(Controller.TopPage()).ButtonOK.EnableMe();
        }
    }
    return true;
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckUpdateQSlot]");
    // End:0xf3
    if(page_Main.iSendUpdateQuickSlotList.Length > 0)
    {
        Log("[BTPageServerSelection::rfAckUpdateQSlot] QuickSlot : " $ string(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]));
        page_Main.RequestUpdateQuickSlot(page_Main.iSendUpdateQuickSlotList[page_Main.iSendUpdateQuickSlotList.Length - 1]);
        page_Main.iSendUpdateQuickSlotList.Length = page_Main.iSendUpdateQuickSlotList.Length - 1;
    }
    return true;
}

function bool BTWindowBuyShopItem_OnOK(GUIComponent Sender)
{
    PlayerOwner().PlaySound(Controller.ItemBuySound, 6, 1.0);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x97
    if(GameMgr.CheckSkillItem(MM.lastBuyItemType))
    {
        page_Main.TcpChannel.sfReqUserSkillList(MM.kUID);
    }
    // End:0xbd
    else
    {
        page_Main.TcpChannel.sfReqItemList(MM.kUID);
    }
    // End:0xea
    if(MM.lastBuyItemGrade == 14)
    {
        page_Main.TcpChannel.sfReqWebzenCash();
    }
    Controller.CloseMenu(false);
    return true;
}

function bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageServerSelection::rfReqNotifyDurabilityZeroItem] Result=" $ string(Result));
    // End:0x71
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x255
    if(page_Main.DurWarningItems.items.Length == 0)
    {
        page_Main.CompleteDurabilityWarningItem();
        PlayerOwner().dblog("[ItemDurabilityWarn]");
        i = 0;
        J0xf3:
        // End:0x23a [While If]
        if(i < ItemUniqueIDs.Length)
        {
            PlayerOwner().dblog("ItemID = " $ string(ItemIDs[i]));
            instanceInfo = GameMgr.FindInstanceItem(ItemUniqueIDs[i]);
            // End:0x1da
            if(instanceInfo != none)
            {
                // End:0x18c
                if(ItemSlotPos[i] == 13)
                {
                    // End:0x18c
                    if(GameMgr.IsQuickSlotBoxItem(ItemUniqueIDs[i]) == false)
                    {
                    }
                    // End:0x230
                    else
                    {
                    }
                    page_Main.AddDurabilityWarningItem(ItemUniqueIDs[i], ItemIDs[i], ItemSlotPos[i], ItemPartIDs[i], instanceInfo.Durability);
                    // This is an implied JumpToken;
                    goto J0x230;
                }
                Log("InstanceInfo != none");
                page_Main.AddDurabilityWarningItem(ItemUniqueIDs[i], ItemIDs[i], ItemSlotPos[i], ItemPartIDs[i], 0);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xf3;
        }
        page_Main.UpdateDurabilityWarningItemList(page_Main);
    }
    // End:0x264
    else
    {
        page_Main.CompleteDurabilityWarningItem();
    }
    return true;
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    local int i;
    local Core.Object.EPage Dest;
    local export editinline BTWindowItemDurabilityWarningHK BTWindow;
    local int nRepairCost;

    Log("[BTPageServerSelection::rfAckRepairCost] Result=" $ string(Result) $ " UniqueItemID.Length=" $ string(UniqueItemID.Length));
    // End:0x86
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x303
    if(page_Main.DurWarningItems.bDurWarningItem && page_Main.DurWarningItems.bReqRepairCost)
    {
        page_Main.DurWarningItems.bReqRepairCost = false;
        BTWindow = BTWindowItemDurabilityWarningHK(Controller.TopPage());
        // End:0x1bf
        if(BTWindow == none)
        {
            // End:0x130
            if(page_Main.eCurrPage == 7 || page_Main.eCurrPage == 5)
            {
                Dest = 7;
            }
            // End:0x138
            else
            {
                Dest = 10;
            }
            page_Main.pwm.CreateAndPush(Dest, "GUIWarfare.BTWindowItemDurabilityWarningHK", true, 0);
            BTWindow = BTWindowItemDurabilityWarningHK(page_Main.pwm.Last(Dest));
            BTWindow.MainMenu = page_Main;
        }
        i = 0;
        J0x1c6:
        // End:0x21c [While If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1f3
            if(RepairCost.Length > 0)
            {
                nRepairCost = RepairCost[i];
            }
            page_Main.AddDurabilityWarningItemRepairCost(UniqueItemID[i], nRepairCost);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1c6;
        }
        i = 0;
        J0x223:
        // End:0x2f4 [While If]
        if(i < page_Main.DurWarningItems.items.Length)
        {
            // End:0x25e
            if(RepairCost.Length > 0)
            {
                nRepairCost = RepairCost[i];
            }
            BTWindow.AddItem(page_Main.DurWarningItems.items[i].UniqueID, page_Main.DurWarningItems.items[i].ItemID, page_Main.DurWarningItems.items[i].PartID, page_Main.DurWarningItems.items[i].Durability, nRepairCost);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x223;
        }
        page_Main.CompleteDurabilityWarningItem();
    }
    return true;
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    local int i;

    Log("[BTPageServerSelection::rfAckRepairItem] Result=" $ string(Result) $ " UniqueItemID.Length=" $ string(UniqueItemID.Length));
    // End:0x86
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = RepairCost;
    MM.UpdateMoneyInfo(MM);
    i = 0;
    J0xb9:
    // End:0x117 [While If]
    if(i < UniqueItemID.Length)
    {
        GameMgr.ChangeInstance_ItemDurability(UniqueItemID[i], 100000);
        GameMgr.ChangeInstance_ItemDamageDegree(UniqueItemID[i], DamageDegree[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xb9;
    }
    GameMgr.UpdateItemList(GameMgr);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 20);
    return true;
}

function bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    local int i;
    local BTConsole BTConsole;

    Log("[BTPageServerSelection::rfReqRecvNotice_FromGM] Result=" $ string(Result));
    BTConsole = BTConsole(Controller.ViewportOwner.Console);
    // End:0x8c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x93:
    // End:0xc7 [While If]
    if(i < NoticeMsg.Length)
    {
        page_Main.PushNoticeQueue(NoticeMsg[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x93;
    }
    return true;
}

function bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfReqRecvForceDisconnected_FromGM]");
    page_Main.HaltNetwork();
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 93);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    return true;
}

function bool BackToServerSelection_OnClick(GUIComponent Sender)
{
    Log("[BTPageServerSelection::BackToServerSelection_OnClick]");
    Controller.PopPage();
    page_Main.TcpChannel.sfReqLogOut(3);
    return true;
}

function bool rfAckExceedMaxUser()
{
    Log("[BTPageServerSelection::rfAckExceedMaxUser]");
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 82);
    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = BackToServerSelection_OnClick;
    return true;
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log("[BTPageServerSelection::rfAckLoginInHouseTest] " $ string(Sucess) $ " " $ CharName $ " " $ string(TimeStamp) $ " " $ string(LoginHash1) $ " " $ string(LoginHash2) $ " " $ string(LoginHash3) $ " " $ string(LoginHash4) $ " " $ string(LoginHash5) $ " " $ string(NeedChar) $ " " $ ErrMsg);
    // End:0x275
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
        // End:0x1c6
        if(NeedChar == 0)
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name : NULL");
            Controller.PopPage();
            page_Main.SetPage(4, true);
        }
        // End:0x270
        else
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
            MM.kUserName = CharName;
            Controller.PopPage();
            RefreshPage();
        }
        return true;
    }
    // End:0x562
    else
    {
        // End:0x3fd
        if(Sucess == 50)
        {
            MM.kUserName = CharName;
            page_Main.rMM.My_szName = CharName;
            Log("Retry Login!!");
            // End:0x374
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                Log("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.AuthLogin_AccountID $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
            }
            // End:0x3f8
            else
            {
                Log("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.szAccountName $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
            }
            return true;
        }
        // End:0x562
        else
        {
            // End:0x446
            if(Sucess == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
            }
            // End:0x562
            else
            {
                // End:0x490
                if(Sucess == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                }
                // End:0x562
                else
                {
                    // End:0x4da
                    if(Sucess == 3)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                    }
                    // End:0x562
                    else
                    {
                        // End:0x524
                        if(Sucess == 15)
                        {
                            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                        // End:0x562
                        else
                        {
                            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Sucess);
                            BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
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

function bool Internal_OnPreDraw(Canvas C)
{
    SaveCanvas = C;
    super.Internal_OnPreDraw(C);
    // End:0xbf
    if(page_Main.page_curr == page_Main.page_ServerSelection && page_Main.bConnectedLoginServer)
    {
        CurrentTime = PlayerOwner().Level.TimeSeconds;
        // End:0xbf
        if(CurrentTime - LastRefreshTime > RefreshCycleTime)
        {
            Log("[BTPageServerSelection::Internal_OnPreDraw] RefreshPage()");
            RefreshPage();
        }
    }
    // End:0xce
    if(bDefaultServnChannel)
    {
        DefaultSvrnChSelect();
    }
    return false;
}

function bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID)
{
    local int i;
    local export editinline BTWindowItemBoxHK BTWindow;

    Log("[BTPageServerSelection::rfAckItemListInItemBox] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " ItemID.Length=" $ string(ItemID.Length) $ " PartID.Length=" $ string(PartID.Length));
    // End:0xb7
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemBoxHK");
    BTWindow = BTWindowItemBoxHK(Controller.TopPage());
    BTWindow.BoxItemID = BoxItemID;
    BTWindow.BoxUniqueID = ItemUniqueID;
    i = 0;
    J0x135:
    // End:0x174 [While If]
    if(i < ItemID.Length)
    {
        BTWindow.AddItem(ItemID[i], PartID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x135;
    }
    BTWindow.__OnOK__Delegate = BTWindowItemBoxHK_OnOK;
    return true;
}

function bool BTWindowItemBoxHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBoxHK BTWindow;

    Log("[BTPageServerSelection::BTWindowItemBoxHK_OnOK]");
    BTWindow = BTWindowItemBoxHK(Controller.TopPage());
    page_Main.TcpChannel.sfReqGetItemFromItemBox(BTWindow.BoxUniqueID, BTWindow.BoxItemID, BTWindow.GetLastSelectItemID(), BTWindow.GetLastSelectPartID());
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckCharInfoFromLoginServer(int Result, string CharName, int Level, int Exp, string ClanName)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckCharInfoFromLoginServer] Result=" $ string(Result) $ " CharName=" $ CharName);
    // End:0x85
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xa8
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
}

function bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    Log("[BTPageServerSelection::rfAckInviteGameRoom]");
    // End:0x57
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    // End:0x121
    else
    {
        switch(Answer)
        {
            // End:0x8e
            case 0:
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(129, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xbe
            case 1:
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(130, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xee
            case 2:
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(131, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0x11e
            case 3:
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(132, GuestCharName), 5, true);
                // End:0x121
                break;
            // End:0xffff
            default:
            }
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

function bool BTWindowInviteGameHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteGameHK_OnOK]");
    BTWindow = BTWindowInviteGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 0, BTWindow.InviterName);
    Controller.CloseMenu(false);
    page_Main.StartAutoMove(BTWindow.ServerID, BTWindow.ChannelID, BTWindow.RoomNumber, BTWindow.Password);
    return true;
}

function bool BTWindowInviteGameHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowInviteGameHK BTWindow;

    Log("[BTPageServerSelection::BTWindowInviteGameHK_OnCancel]");
    BTWindow = BTWindowInviteGameHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvInviteGameRoom(BTWindow.RoomUniqueID, BTWindow.RoomNumber, 1, BTWindow.InviterName);
    BTWindow.FadeOut(false, true);
    return true;
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    return true;
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

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    Log("[BTPageServerSelection::rfAckWebzenCash]");
    // End:0x52
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kCash = class'BTCustomDrawHK'.static.UnresolvedNativeFunction_99(PCoinCash);
    MM.kCCoinCash = class'BTCustomDrawHK'.static.UnresolvedNativeFunction_99(CCoinCash);
    Log("[BTPageServerSelection::rfAckWebzenCash] Cash=" $ string(MM.kCash) $ " CCoinCash=" $ string(MM.kCCoinCash));
    MM.UpdateMoneyInfo(MM);
    return true;
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    Log("[BTPageServerSelection::rfAckBuyItemByWebzenCash]");
    // End:0x6b
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
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

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    Log("[BTPageServerSelection::rfAckRegisteredPCBangInfo] Name(R,M)=" $ PCBangName $ "(" $ string(IsRegisteredPCBang) $ ", " $ string(IsMainPCBang) $ ")");
    // End:0x90
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
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
    // End:0x75 [While If]
    if(i < Level.Length)
    {
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5b;
    }
    // End:0xaf
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

function bool rfAckFriendListEnd()
{
    Log("[BTPageServerSelection::rfAckFriendListEnd]");
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
    // End:0x170 [While If]
    if(i < FriendName.Length)
    {
        Log(FriendName[i] $ ", " $ string(CM_Pattern[i]) $ ", " $ string(CM_BG[i]) $ ", " $ string(CM_BL[i]) $ ", " $ string(Level[i]) $ ", " $ string(LevelMarkID[i]) $ ", " $ string(TitleMarkID[i]) $ ", " $ string(Reserved1[i]) $ ", " $ string(Reserved2[i]) $ ", " $ string(Reserved3[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8c;
    }
    // End:0x1aa
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

function bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    local int i;
    local export editinline BTWindowOptionHK BTWindow;

    Log("[BTPageServerSelection::rfAckBlockUserListStart] Result=" $ string(Result) $ " TotalCount=" $ string(TotalCount));
    MM.ClearBlockList();
    MM.SetBlockListCount(TotalCount);
    // End:0x186
    if(MM.kBlockListCount == MM.kBlockList.Length)
    {
        MM.UpdateBlockList(MM);
        MM.BlockUserListForOption.Length = MM.kBlockList.Length;
        i = 0;
        J0xe1:
        // End:0x132 [While If]
        if(i < MM.kBlockList.Length)
        {
            MM.BlockUserListForOption[i] = MM.kBlockList[i].UserName;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xe1;
        }
        BTWindow = BTWindowOptionHK(Controller.TopPage());
        // End:0x186
        if(BTWindow != none)
        {
            BTWindow.TPOption.TPCommunity.UpdateBlockUserList(MM.BlockUserListForOption);
        }
    }
    return true;
}

function bool rfAckBlockUserListEnd()
{
    Log("[BTPageServerSelection::rfAckBlockUserListEnd]");
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
    // End:0x184 [While If]
    if(i < BTWindow.ItemIDChoose.Length)
    {
        ItemInfo = GameMgr.FindUIItem(BTWindow.ItemIDChoose[i]);
        // End:0x10f
        if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
        {
            GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], BTWindow.ItemIdx[i], 0, 13, 1, 100000, BTWindow.PartIDChoose[i], 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
        }
        // End:0x17a
        else
        {
            GameMgr.AddInstanceItemByParameter(BTWindow.ItemIDChoose[i], BTWindow.ItemIdx[i], 0, 13, 1, 100000, 0, 0, BTWindow.StackCount[i], 0, BTWindow.UntilTime[i]);
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
    PlayerOwner().dblog("=====================");
    BTWindow.ItemIDChoose.Length = ItemIDChoose.Length;
    BTWindow.ItemIdx.Length = ItemIdx.Length;
    BTWindow.PartIDChoose.Length = PartIDChoose.Length;
    BTWindow.StackCount.Length = StackCount.Length;
    BTWindow.UntilTime.Length = UntilTime.Length;
    i = 0;
    J0x256:
    // End:0x310 [While If]
    if(i < ItemIDChoose.Length)
    {
        BTWindow.ItemIDChoose[i] = ItemIDChoose[i];
        BTWindow.ItemIdx[i] = ItemIdx[i];
        BTWindow.PartIDChoose[i] = PartIDChoose[i];
        BTWindow.StackCount[i] = StackCount[i];
        BTWindow.UntilTime[i] = UntilTime[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x256;
    }
    // End:0x332
    if(RandomBxoItemCount == 0)
    {
        GameMgr.RemoveInstanceItem(RandomBoxItemIdx);
    }
    // End:0x34b
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
        return false;
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
    // End:0x210
    if(ItemID != 0)
    {
        ItemInfo = GameMgr.FindUIItem(ItemID);
        // End:0x210
        if(ItemInfo != none)
        {
            // End:0x152
            if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
            {
                iItemExtra = UnresolvedNativeFunction_99(ItemExtra);
                GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, iItemExtra, 0, 1, 0);
            }
            // End:0x1f8
            else
            {
                // End:0x1ab
                if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
                {
                    GameMgr.AddInstanceItemByParameter(ItemID, ItemIdx, 0, 13, 1, 100000, 0, 0, 1, 0, ItemExtra);
                }
                // End:0x1f8
                else
                {
                    // End:0x1f8
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

function bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckPaidItem_ChangeCharname]");
    // End:0x5f
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x81
    if(RemainCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);
    }
    // End:0x9a
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 184, MM.kUserName, NewCharname);
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    MyStatus.NickName = NewCharname;
    MM.ReplaceUserName(MM.kUserName, NewCharname);
    MM.kUserName = NewCharname;
    MM.My_szName = NewCharname;
    MM.UpdateCharInfo(MM);
    return true;
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageServerSelection::rfAckPaidItem_ChangeClanname]");
    // End:0x5f
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x81
    if(RemainCount == 0)
    {
        GameMgr.RemoveInstanceItem(ItemIdx);
    }
    // End:0x9a
    else
    {
        GameMgr.ChangeInstance_StackCount(ItemIdx, RemainCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 186, MM.kClanName, NewClanname);
    MM.kPrevClanName = MM.kClanName;
    MM.kClanName = NewClanname;
    page_Main.MyClanName = NewClanname;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    MyStatus.ClanName = NewClanname;
    MM.UpdateCharInfo(MM);
    MM.UpdateClanInfo(MM);
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

function bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    local int i;

    Log("[BTPageServerSelection::rfAckPaidItem_NotifyChangeClanMark] Pattern=" $ string(Pattern) $ ", BG=" $ string(BG) $ ", BL=" $ string(BL));
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
    J0x12c:
    // End:0x1df [While If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x1d5
        if(MM.UserInfos[i].ClanName == ClanName)
        {
            MM.UserInfos[i].ClanMark = Pattern;
            MM.UserInfos[i].ClanBG = BG;
            MM.UserInfos[i].ClanBL = BL;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12c;
    }
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
    // End:0x195
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
    // End:0x289
    if(MsgInfo.MsgCode >= 2 && MsgInfo.MsgCode <= 4)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x2bd
    if(MsgInfo.MsgCode >= 9 && MsgInfo.MsgCode <= 13)
    {
        page_Main.SetNewMailArrived(true);
    }
    // End:0x2e2
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

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log("[BTPageServerSelectionCN::rfAckLogOut] Result=" $ string(Result) $ " Reason=" $ string(Reason));
    // End:0x65
    if(Reason == 1)
    {
        ExitGame();
        return true;
    }
    // End:0xa2
    if(Reason == 4)
    {
        page_Main.HaltNetwork();
        page_Main.Controller.ConsoleCommand("exit");
        return true;
    }
    // End:0x166
    if(Reason == 3)
    {
        Log("[BTPageServerSelectionCN::rfAckLogOut] page_Main.LoginToChannel( " $ page_Main.szLoginServerIP $ ", " $ string(page_Main.szLoginServerPort) $ ")");
        PlayerOwner().SendWebLog(4120, -1);
        page_Main.ChannelToLogin(page_Main.szLoginServerIP, page_Main.szLoginServerPort);
        return true;
    }
    PlayerOwner().SendWebLog(4120, -1);
    page_Main.pwm.CloseAndClear();
    Log("page_Main.LoginToChannel( " $ ConnectingChannel.IP $ ", " $ string(ConnectingChannel.Port) $ " , " $ string(ConnectingChannel.DataPort) $ ")");
    page_Main.LoginToChannel(ConnectingChannel.IP, ConnectingChannel.Port, ConnectingChannel.DataPort);
    return true;
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log("[BTPageServerSelection::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year) $ " YearId=" $ string(YearId) $ " SalesZoneCode=" $ string(SalesZoneCode));
    page_Main.UpdateWebzenShopItemList(Year, YearId, SalesZoneCode);
    return true;
}

event bool rfAckPopUpMessage(int MessageType)
{
    Log("[BTPageServerSelectionCN::rfAckPopUpMessage()] MessageType=" $ string(MessageType));
    // End:0xcf
    if(835 == MessageType)
    {
        page_Main.pwm.CreateAndPush(10, "GUIWarfareControls.BTWindowErrorDefineHK", true, 0);
        BTWindowErrorDefineHK(page_Main.pwm.Last(10)).SetContentText_Instance(1, 835);
    }
    // End:0xe4
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, 0);
    }
    return true;
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageServerSelection::rfAckMoveToLobby()] MessageType=" $ string(MessageType));
    return true;
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTPageServerSelection::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    // End:0xc1
    if(MM.IsUsingTenProtect)
    {
        // End:0x9e
        if(PlayerOwner().Level.GetIsServiceBuild())
        {
            MM.TenProtectCreate(MM.LoginInfo.UIN);
        }
        // End:0xb2
        else
        {
            MM.TenProtectCreate(CharDBID);
        }
        MM.TenProtectSendInitData();
    }
    return true;
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local int SlotPosition, OldSlotPosition;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    Log("[BTPage::rfAckEquipSkill] Result=" $ string(Result));
    // End:0x54
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(ChangedNewSkillID);
    instanceInfo = GameMgr.FindFirstInstanceItemByItemID(ChangedNewSkillID);
    // End:0xfc
    if(instanceInfo == none)
    {
        return false;
    }
    GameMgr.ChangeInstance_SkillSlotPos(ChangedNewSkillUniqueID, ChangedNewSlotPosition);
    GameMgr.ChangeSkillBox_SlotPos(ChangedNewSkillUniqueID, ChangedNewSlotPosition);
    page_Main.TcpChannel.sfReqConfirmSkillChanged();
    return true;
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    Log("[BTPageServerSelection::rfAckLoginWithTencentAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(tc_AccountType) $ " wzp_IsBlock=" $ string(tc_IsBlock));
    UnresolvedNativeFunction_97("[BTPageServerSelection::rfAckLoginWithTencentAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(tc_AccountType) $ " wzp_IsBlock=" $ string(tc_IsBlock));
    // End:0x150
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithTencentAuth_Test(Result, tc_AccountType, tc_IsBlock);
    }
    // End:0x16e
    else
    {
        page_Main.TcpLogin_rfAckLoginWithTencentAuth_Live(Result, tc_AccountType, tc_IsBlock);
    }
    return true;
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log("[BTPageServerSelection::rfAckLoginWithWZAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(wzp_AccountType) $ " wzp_IsBlock=" $ string(wzp_IsBlock) $ " wzp_AuthKeySuccess=" $ string(wzp_AuthKeySuccess) $ " ChannelType = " $ string(ChannelType));
    UnresolvedNativeFunction_97("[BTPageServerSelection::rfAckLoginWithWZAuth] Result=" $ string(Result) $ " wzp_AccountType=" $ string(wzp_AccountType) $ " wzp_IsBlock=" $ string(wzp_IsBlock) $ " wzp_AuthKeySuccess=" $ string(wzp_AuthKeySuccess) $ " ChannelType = " $ string(ChannelType));
    // End:0x1ca
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithWZAuth_Test(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
    }
    // End:0x1f2
    else
    {
        page_Main.TcpLogin_rfAckLoginWithWZAuth_Live(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
    }
    return true;
}

function bool rfAckLoginWithThailand(int Result)
{
    Log("[BTPageServerSelection::rfAckLoginWithThailand] Result=" $ string(Result));
    UnresolvedNativeFunction_97("[BTPageServerSelection::rfAckLoginWithThailand] Result=" $ string(Result));
    // End:0xd0
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithThailand_Test(Result);
    }
    // End:0xe4
    else
    {
        page_Main.TcpLogin_rfAckLoginWithThailand_Live(Result);
    }
    return true;
}

function bool rfAckLoginWithGlobal(int Result)
{
    Log("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    UnresolvedNativeFunction_97("[BTPageServerSelection::rfAckLoginWithGlobal] Result=" $ string(Result));
    // End:0xcc
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        page_Main.TcpLogin_rfAckLoginWithGlobal_Test(Result);
    }
    // End:0xe0
    else
    {
        page_Main.TcpLogin_rfAckLoginWithGlobal_Live(Result);
    }
    return true;
}

function bool rfAckShopItemData()
{
    GameMgr.kGP20ProductList.Length = 0;
    return true;
}

function bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductRowGuid, array<string> ServiceCode, array<string> ProductName, array<string> ProductCode, array<string> ProductType, array<byte> SaleType, array<string> ItemSaleType, array<byte> ISIncludeBonus, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> TotalQuantity, array<int> ReOrderTerms, array<int> ReorderCount, array<int> PurchaseAvailableQuantity, array<int> AvailableMinLevel, array<int> AvailableMaxLevel, array<byte> AvailableGender, array<int> InventoryKeepDays, array<int> SaleMasterFlag, array<int> SaleStatus, array<string> Description, array<string> Property0, array<string> Property1, array<string> Property2, array<string> Property3, array<string> Property4, array<int> IsGift)
{
    local int i, j, useIndex, ProductCount, costCount;

    local GP20Product GP20Product;

    ProductCount = ProductNo.Length;
    i = 0;
    J0x13:
    // End:0x643 [While If]
    if(i < ProductCount)
    {
        useIndex = GameMgr.kGP20ProductList.Length;
        j = 0;
        J0x3e:
        // End:0x98 [While If]
        if(j < GameMgr.kGP20ProductList.Length)
        {
            // End:0x8e
            if(GameMgr.kGP20ProductList[j].ProductCode == ProductCode[i])
            {
                useIndex = j;
            }
            // End:0x98
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x3e;
            }
        }
        // End:0xc9
        if(useIndex >= GameMgr.kGP20ProductList.Length)
        {
            GameMgr.kGP20ProductList.Length = useIndex + 1;
        }
        costCount = GameMgr.kGP20ProductList[useIndex].ProductNo.Length;
        GameMgr.kGP20ProductList[useIndex].ProductNo.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductCost.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductHour.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductQuantity.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].SaleType.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].SaleStatus.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].IsGift.Length = costCount + 1;
        GameMgr.kGP20ProductList[useIndex].ProductNo[costCount] = ProductNo[i];
        GameMgr.kGP20ProductList[useIndex].ProductCost[costCount] = ProductCost[i];
        GameMgr.kGP20ProductList[useIndex].ProductHour[costCount] = ProductHour[i];
        GameMgr.kGP20ProductList[useIndex].ProductQuantity[costCount] = ProductQuantity[i];
        GameMgr.kGP20ProductList[useIndex].SaleType[costCount] = SaleType[i];
        GameMgr.kGP20ProductList[useIndex].SaleStatus[costCount] = SaleStatus[i];
        GameMgr.kGP20ProductList[useIndex].IsGift[costCount] = IsGift[i];
        GameMgr.kGP20ProductList[useIndex].ProductRowGuid = ProductRowGuid[i];
        GameMgr.kGP20ProductList[useIndex].ServiceCode = ServiceCode[i];
        GameMgr.kGP20ProductList[useIndex].ProductName = ProductName[i];
        GameMgr.kGP20ProductList[useIndex].ProductCode = ProductCode[i];
        GameMgr.kGP20ProductList[useIndex].ProductType = ProductType[i];
        GameMgr.kGP20ProductList[useIndex].ItemSaleType = ItemSaleType[i];
        GameMgr.kGP20ProductList[useIndex].ISIncludeBonus = ISIncludeBonus[i];
        GameMgr.kGP20ProductList[useIndex].TotalQuantity = TotalQuantity[i];
        GameMgr.kGP20ProductList[useIndex].ReOrderTerms = ReOrderTerms[i];
        GameMgr.kGP20ProductList[useIndex].ReorderCount = ReorderCount[i];
        GameMgr.kGP20ProductList[useIndex].PurchaseAvailableQuantity = PurchaseAvailableQuantity[i];
        GameMgr.kGP20ProductList[useIndex].AvailableMinLevel = AvailableMinLevel[i];
        GameMgr.kGP20ProductList[useIndex].AvailableMaxLevel = AvailableMaxLevel[i];
        GameMgr.kGP20ProductList[useIndex].AvailableGender = AvailableGender[i];
        GameMgr.kGP20ProductList[useIndex].InventoryKeepDays = InventoryKeepDays[i];
        GameMgr.kGP20ProductList[useIndex].SaleMasterFlag = SaleMasterFlag[i];
        GameMgr.kGP20ProductList[useIndex].Description = Description[i];
        GameMgr.kGP20ProductList[useIndex].Property0 = Property0[i];
        GameMgr.kGP20ProductList[useIndex].Property1 = Property1[i];
        GameMgr.kGP20ProductList[useIndex].Property2 = Property2[i];
        GameMgr.kGP20ProductList[useIndex].Property3 = Property3[i];
        GameMgr.kGP20ProductList[useIndex].Property4 = Property4[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
    return true;
}

function bool rfReqNotifyShopItemDataEnd(int Ver)
{
    Log("GP20Product : ProductCount =" $ string(GameMgr.kGP20ProductList.Length));
    GameMgr.GP20ShopVersion = Ver;
    GameMgr.UpdateWebzenItemList(GameMgr);
    return true;
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
}

function bool BTWindowRequestClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;
    local wMatchMaker MM;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnOK]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 0);
    Controller.TopPage().FadeOut(false, true);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kPrevClanName = BTWindow.ClanName;
    return true;
}

function bool BTWindowRequestClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnCancel]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 2);
    Controller.TopPage().FadeOut(false, true);
    return true;
}

function bool BTWindowRequestClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnSuspend]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterUserIdx, BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.ClanName, 1);
    Controller.CloseMenu(true);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    local wMatchMaker MM;
    local wGameManager GameMgr;
    local int ClanBL, ClanPT, ClanBG;

    Log("[BTPageClanWar::rfAckRecvClanInviteResult]");
    // End:0x54
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kClanName = MM.kPrevClanName;
    page_Main.MyClanInfo.CM_ClanName = MM.kClanName;
    page_Main.MyClanName = MM.kClanName;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x1dd
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
}

function bool rfNotifyCouponUseError(int Time)
{
    local BtrDouble blockDoubleTime;
    local wGameManager GameMgr;
    local string blockMsg;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    blockDoubleTime = GameMgr.GetLeftEventTime(1020);
    // End:0xc7
    if(blockDoubleTime.dummy_1_DO_NOT_USE == 0 || blockDoubleTime.dummy_2_DO_NOT_USE == 0)
    {
        GameMgr.AddEventTimerHMS(1020, 0, 0, Time);
        blockMsg = class'BTWindowErrorDefineHK'.static.GetFormatString(859, string(Time / 60 + 1));
        class'BTWindowErrorDefineHK'.static.ShowErrorMsg(Controller, blockMsg);
    }
}

defaultproperties
{
    RefreshCycleTime=20.0
    fbLabelBackground=(X1=0.0,Y1=0.0,X2=1024.0,Y2=758.0)
    fbLabelBackgrounddeco=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    fbLabelTopLine=(X1=0.0,Y1=0.0,X2=1024.0,Y2=128.0)
    fbLabelLeftTopRoll=(X1=0.0,Y1=0.0,X2=140.0,Y2=128.0)
    fbLabelLeftTopRollSource=(X1=116.0,Y1=128.0,X2=256.0,Y2=256.0)
    fbLabelBottomLine=(X1=0.0,Y1=736.0,X2=1024.0,Y2=768.0)
    begin object name=mTabControl class=TabControlMocker
        OnVisiblePanelChanged=OnVisibleChannelListChanged
    object end
    // Reference: TabControlMocker'BTPageServerSelection.mTabControl'
    TabControl=mTabControl
    begin object name=mTPTopMenu class=BTTPTopMenuSCHK
        bUseAWinPos=true
        AWinPos=(X1=454.0,Y1=0.0,X2=1016.0,Y2=70.0)
    object end
    // Reference: BTTPTopMenuSCHK'BTPageServerSelection.mTPTopMenu'
    TPTopMenu=mTPTopMenu
    strButtonCredit="Creators"
    strPCBangFriend="PC Cafe Friend"
    HashMessage="Invalid protocol version. Please update."
    strCW_GameMode="Regular Clan Battle"
    fbChannelBg=(X1=656.0,Y1=93.0,X2=1023.0,Y2=448.0)
    nIndexDefSrv=-1
    nIndexDefCh=-1
    fbLabelRoomName=(X1=10.0,Y1=15.0,X2=397.0,Y2=63.0)
    OnPreDraw=Internal_OnPreDraw
}