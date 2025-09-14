/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageAuction.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:26
 *	Functions:53
 *
 *******************************************************************************/
class BTPageAuction extends BTNetGUIPageHK
    dependson(BTPageAuction_TCP)
    editinlinenew
    instanced;

struct SearchAuctionItem
{
    var bool bLock;
    var int Section;
    var string Keyword;
    var int ItemRank;
    var byte ItemClassify;
    var byte IsAvailable;
    var int CurrentPageNum;
    var int PagePerCount;
    var int SortType;
};

var bool bChangePage;
var float LastRefreshTime[2];
var float RefreshCycleTime[2];
var localized string strSuccessAuctionCancel;
var array<BtrDouble> MyAuctionItemUniqueID;
var localized string strSuccessBidding[2];
var int SavePageNum;
var wGameManager GameMgr;
var wMyPlayerStatus MyStatus;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelPoint;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelCash;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelP;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelC;
var export editinline BTOwnerDrawImageHK LabelP;
var export editinline BTOwnerDrawImageHK LabelC;
var BTItemCommonInfoHK MyData;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPAuctionHK TPAuction;
var SearchAuctionItem SAItem;
var bool bToggleTest;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTest;
var int LastReqRepairMode;
var int RepairAllButtonID;
var BtrDouble SellShopItemInfo_UniqueItemID;
var BtrDouble Repair_UniqueItemID;

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
            page_Main.SetPage(23, true);
            // End:0x2c7
            break;
        // End:0x8a
        case 1:
            page_Main.SetPage(20, true);
            // End:0x2c7
            break;
        // End:0xa4
        case 2:
            page_Main.SetPage(21, true);
            // End:0x2c7
            break;
        // End:0xbe
        case 3:
            page_Main.SetPage(22, true);
            // End:0x2c7
            break;
        // End:0x1d7
        case 5:
            // End:0xed
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, true);
            }
            // End:0x1d4
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2c7
            break;
        // End:0x1df
        case 6:
            // End:0x2c7
            break;
        // End:0x1e7
        case 7:
            // End:0x2c7
            break;
        // End:0x1fe
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2c7
            break;
        // End:0x23a
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2c7
            break;
        // End:0x281
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x2c7
            break;
        // End:0x2c4
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x2c7
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool TPAuction_TabButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPAuction.TabControl.SetVisiblePanel(btn.ButtonID);
    Log("[BTPageAuction::TPAuction_TabButton_OnClick] ButtonID=" $ string(btn.ButtonID));
    switch(btn.ButtonID)
    {
        // End:0xf7
        case 0:
            TPAuction.TPBuying.MainTabSelect(TPAuction.TPBuying.TabControl[0].GetCurrentTabIndex(), TPAuction.TPBuying.TabControl[1].GetCurrentTabIndex());
            // End:0x1dd
            break;
        // End:0x15c
        case 1:
            TPAuction.TPMyAuction.MainTabSelect(TPAuction.TPMyAuction.TabControl[0].GetCurrentTabIndex(), TPAuction.TPMyAuction.TabControl[1].GetCurrentTabIndex());
            // End:0x1dd
            break;
        // End:0x1da
        case 2:
            TPAuction.TPSelling.MainTabSelect(TPAuction.TPBuying.TabControl[0].GetCurrentTabIndex(), TPAuction.TPBuying.TabControl[1].GetCurrentTabIndex());
            TPAuction.TPSelling.SetInfoBox();
            // End:0x1dd
            break;
        // End:0xffff
        default:
            return true;
    }
}

function TPBuying_PageButton_OnClick(int pageIndex)
{
    Log("[BTPageAuction::TPBuying_PageButton_OnClick] pageIndex=" $ string(pageIndex));
    sfReqAuctionItemList(0, "", TPAuction.TPBuying.GetRankIdx(), 0, 0, pageIndex, 20, TPAuction.TPBuying.GetSortIdx());
}

function TPMyAuction_PageButton_OnClick(int pageIndex)
{
    local int mainTab, subTab, ItemClassify;

    Log("[BTPageAuction::TPMyAuction_PageButton_OnClick] pageIndex=" $ string(pageIndex));
    mainTab = TPAuction.TPMyAuction.TabControl[0].GetCurrentTabIndex();
    subTab = TPAuction.TPMyAuction.TabControl[1].GetCurrentTabIndex();
    ItemClassify = mainTab + 1 * 10 + subTab;
    sfReqAuctionItemList(2, "", 0, byte(ItemClassify), 0, pageIndex, 20, SAItem.SortType);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    InitializeCashNPoint();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    TPAuction.TPBuying.__sfReqAuctioItemListInBuying__Delegate = sfReqAuctionItemList;
    TPAuction.TPMyAuction.__sfReqAuctioItemListInMyAuction__Delegate = sfReqAuctionItemList;
    TPAuction.TPSelling.__sfReqAuctioItemListInSelling__Delegate = sfReqAuctionItemList;
    TPAuction.TPBuying.__SortAuctionItemList__Delegate = SortAuctionItemList;
    TPAuction.TPMyAuction.__SortAuctionItemList__Delegate = SortAuctionItemList;
    TPAuction.TPSelling.__SortAuctionItemList__Delegate = SortAuctionItemList;
    TPAuction.TPBuying.TcpChannel = TcpChannel;
    TPAuction.TPMyAuction.TcpChannel = TcpChannel;
    TPAuction.TPSelling.TcpChannel = TcpChannel;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    TPAuction.ButtonAuction[0].__OnClick__Delegate = TPAuction_TabButton_OnClick;
    TPAuction.ButtonAuction[1].__OnClick__Delegate = TPAuction_TabButton_OnClick;
    TPAuction.ButtonAuction[2].__OnClick__Delegate = TPAuction_TabButton_OnClick;
    TPAuction.TPBuying.PageButton.__ButtonIndex_OnClick__Delegate = TPBuying_PageButton_OnClick;
    TPAuction.TPMyAuction.PageButton.__ButtonIndex_OnClick__Delegate = TPMyAuction_PageButton_OnClick;
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 384.0;
    LabelRoomName.ClipArea.X2 = 280.0;
    LabelRoomName.ClipArea.Y2 = 432.0;
    page_Main.__ClearChatLog_Extra__Delegate = ClearChatLog_Extra;
    page_Main.__NormalChatLog_Extra__Delegate = NormalChatLog_Extra;
    page_Main.__ClanChatLog_Extra__Delegate = ClanChatLog_Extra;
    page_Main.__WhisperChatLog_Extra__Delegate = WhisperChatLog_Extra;
    page_Main.__SelfChatLog_Extra__Delegate = SelfChatLog_Extra;
    page_Main.__SystemChatLog_Extra__Delegate = SystemChatLog_Extra;
    page_Main.__BroadCastItemChatLog_Extra__Delegate = BroadCastItemChatLog_Extra;
    page_Main.__TeamChatLog_Extra__Delegate = TeamChatLog_Extra;
    page_Main.UpdateChatLog();
    Controller.PushPage();
    // End:0x3ff
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        ButtonTest = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 20.0, 50.0, 50.0));
        ButtonTest.SetDefaultButtonImage();
        ButtonTest.Caption = "ButtonTest";
        ButtonTest.__OnClick__Delegate = ButtonTest_OnClick;
    }
}

function ClearChatLog_Extra();
function NormalChatLog_Extra(string cL)
{
    TPAuction.TPBuying.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatNormal());
    TPAuction.TPMyAuction.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatNormal());
}

function ClanChatLog_Extra(string cL)
{
    TPAuction.TPBuying.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatClan());
    TPAuction.TPMyAuction.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatClan());
}

function WhisperChatLog_Extra(string cL)
{
    TPAuction.TPBuying.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatWhisper());
    TPAuction.TPMyAuction.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatWhisper());
}

function SelfChatLog_Extra(string cL)
{
    TPAuction.TPBuying.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSelf());
    TPAuction.TPMyAuction.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog_Extra(string cL)
{
    TPAuction.TPBuying.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPAuction.TPMyAuction.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSystem());
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPAuction.TPBuying.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
    TPAuction.TPMyAuction.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
}

function TeamChatLog_Extra(string cL)
{
    TPAuction.TPBuying.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatTeam());
    TPAuction.TPMyAuction.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function bool ButtonTest_OnClick(GUIComponent Sender)
{
    // End:0x35
    if(bToggleTest)
    {
        bToggleTest = false;
        TPAuction.TPBuying.ACLList.LoadPos();
    }
    // End:0x5e
    else
    {
        bToggleTest = true;
        TPAuction.TPBuying.ACLList.SavePos();
    }
    return true;
}

function InitializeCashNPoint()
{
    MyData = new class'BTItemCommonInfoHK';
    TPAuction.TPBuying.MyData = MyData;
    TPAuction.TPBuying.ACLList.MyData = MyData;
    TPAuction.TPMyAuction.MyData = MyData;
    TPAuction.TPMyAuction.ACLList.MyData = MyData;
    TPAuction.TPSelling.MyData = MyData;
    TPAuction.TPSelling.ACLList.MyData = MyData;
    LabelCash = new class'BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new class'BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = class'Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    LabelPoint.InitComponent(Controller, self);
    AppendComponent(LabelPoint);
    LabelC = new class'BTOwnerDrawImageHK';
    LabelC.bUseAWinPos = true;
    LabelC.AWinPos = fbLabelC;
    LabelC.BackgroundImage = class'BTUIResourcePoolHK'.default.img_cash;
    LabelC.InitComponent(Controller, self);
    AppendComponent(LabelC);
    LabelP = new class'BTOwnerDrawImageHK';
    LabelP.bUseAWinPos = true;
    LabelP.AWinPos = fbLabelP;
    LabelP.BackgroundImage = class'BTUIResourcePoolHK'.default.img_point;
    LabelP.InitComponent(Controller, self);
    AppendComponent(LabelP);
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageAuction::UpdateMoneyInfo]");
    RefreshCashNPoint();
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageAuction::UpdateItemList]");
    RefreshAuction();
}

function UpdateServerTime(wGameManager GameMgr)
{
    Log("[BTPageAuction::UpdateServerTime]");
    RefreshAuction();
}

function InitializeDelegate()
{
    MM.__UpdateMoneyInfo__Delegate = UpdateMoneyInfo;
    GameMgr.__UpdateServerTime__Delegate = UpdateServerTime;
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
}

function UnInitializeDelegate()
{
    MM.__UpdateMoneyInfo__Delegate = None;
    GameMgr.__UpdateServerTime__Delegate = None;
    GameMgr.__UpdateItemList__Delegate = None;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageAuction::InternalOnOpen()");
    Log("[BTPageAuction::InternalOnOpen]");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM.SetCurSubPos(5);
    InitializeDelegate();
    RefreshCashNPoint();
    TPAuction.CharacterModel.BeginModel();
    page_Main.TcpChannel.sfReqChangeUserState(4, 0);
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    RefreshAuction();
    page_Main.TcpChannel.sfReqGetServerTime();
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageAuction::InternalOnClose()");
    Log("[BTPageAuction::InternalOnClose]");
    self.TPAuction.CharacterModel.EndModel();
    UnInitializeDelegate();
    OnClose(bCanceled);
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageAuction_TCP TCP;

    TCP = new class'BTPageAuction_TCP';
    TCP.Owner = self;
    return TCP;
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageAuction::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x76
    if(bCurLookingFor)
    {
        page_Main.TcpChannel.sfReqSetLookForClan(0);
    }
    // End:0x90
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
}

function bool ClanMenu_ButtonFindClan_OnClick(GUIComponent Sender)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageAuction::ClanMenu_ButtonFindClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowFindClanHK");
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    BTWindow.TcpChannel = page_Main.TcpChannel;
    BTWindow.__OnOK__Delegate = BTWindowFindClanHK_OnRequestJoin;
    BTWindow.ButtonInfo.__OnClick__Delegate = BTWindowFindClanHK_OnInfo;
    return true;
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageAuction::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf5
    if(ClanName != "none" && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    return true;
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageAuction::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8d
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageAuction::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageAuction::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xdc
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0x102
    else
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
}

function bool BTWindowCreateClanHK_OnOK(GUIComponent Sender)
{
    local string ClanName, Intro, Keyword;
    local int Region;

    Log("[BTPageAuction::BTWindowCreateClanHK_OnOK]");
    // End:0x163
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        ClanName = BTWindowCreateClanHK(Controller.TopPage()).ClanName.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).ClanLocation.ComboBox.GetIndex();
        page_Main.SaveClanName = ClanName;
        page_Main.TcpChannel.sfReqCreateClan(ClanName, ClanName, Intro, Keyword, byte(Region));
        Controller.CloseMenu(false);
    }
    // End:0x179
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageAuction::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function RefreshCashNPoint()
{
    Log("[BTPageAuction::RefreshCashNPoint");
    LabelPoint.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(125, class'BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));
    LabelCash.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(126, class'BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
    MyData.MyPoint = MM.kPoint;
    MyData.MyCash = MM.kCash;
    MyData.myLevel = MM.kLevel;
}

function RefreshAuction(optional bool bStopLoop)
{
    local int TabIndex[6];

    Log("[BTPageAuction::RefreshAuction] bStopLoop=" $ string(bStopLoop));
    TabIndex[0] = TPAuction.TPBuying.TabControl[0].GetCurrentTabIndex();
    TabIndex[1] = TPAuction.TPBuying.TabControl[1].GetCurrentTabIndex();
    TabIndex[2] = TPAuction.TPSelling.TabControl[0].GetCurrentTabIndex();
    TabIndex[3] = TPAuction.TPSelling.TabControl[1].GetCurrentTabIndex();
    TabIndex[4] = TPAuction.TPMyAuction.TabControl[0].GetCurrentTabIndex();
    TabIndex[5] = TPAuction.TPMyAuction.TabControl[1].GetCurrentTabIndex();
    TPAuction.TPBuying.fill();
    TPAuction.TPMyAuction.fill();
    TPAuction.TPSelling.fill();
    RefreshCashNPoint();
    TPAuction.TPBuying.Refresh();
    TPAuction.TPMyAuction.Refresh();
    // End:0x1e0
    if(bStopLoop == false)
    {
        TPAuction.TPSelling.Refresh();
    }
    // End:0x22d
    if(TPAuction.TabControl.GetCurrentTabIndex() == 0)
    {
        TPAuction.TPBuying.MainTabSelect(TabIndex[0], TabIndex[1], bStopLoop);
    }
    // End:0x2aa
    else
    {
        // End:0x27c
        if(TPAuction.TabControl.GetCurrentTabIndex() == 1)
        {
            TPAuction.TPMyAuction.MainTabSelect(TabIndex[4], TabIndex[5], bStopLoop);
        }
        // End:0x2aa
        else
        {
            TPAuction.TPSelling.MainTabSelect(TabIndex[2], TabIndex[3], bStopLoop);
        }
    }
}

function bool sfReqAuctionItemList(int Section, string Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType)
{
    Log("[BTPageAuction::sfReqAuctionItemList]");
    // End:0x6f
    if(SAItem.bLock)
    {
        Log("[BTPageAuction::sfReqAuctionItemList] SAItem.bLock");
        return false;
    }
    // End:0x11a
    if(SAItem.Keyword != Keyword || SAItem.ItemRank != ItemRank || SAItem.ItemClassify != ItemClassify || SAItem.IsAvailable != IsAvailable || SAItem.CurrentPageNum != PageNum || SAItem.PagePerCount != Count || SAItem.SortType != SortType)
    {
        bChangePage = true;
    }
    // End:0x122
    else
    {
        bChangePage = false;
    }
    SAItem.bLock = true;
    SAItem.Section = Section;
    SAItem.Keyword = Keyword;
    SAItem.ItemRank = ItemRank;
    SAItem.ItemClassify = ItemClassify;
    SAItem.IsAvailable = IsAvailable;
    SAItem.CurrentPageNum = PageNum;
    SAItem.PagePerCount = Count;
    SAItem.SortType = SortType;
    Log("page_Main.TcpChannel.sfReqAuctionItemList(Section=" $ string(Section) $ ", Keyword=" $ Keyword $ ", ItemRank=" $ string(ItemRank) $ ", ItemClassify=" $ string(ItemClassify) $ ", IsAvailable=" $ string(IsAvailable) $ ", PageNum=" $ string(PageNum) $ ", Count=" $ string(Count) $ ", SortType=" $ string(SortType) $ ")");
    page_Main.TcpChannel.sfReqAuctionItemList(byte(SAItem.Section), SAItem.Keyword, SAItem.ItemRank, SAItem.ItemClassify, SAItem.IsAvailable, SAItem.CurrentPageNum, SAItem.PagePerCount, SAItem.SortType);
    Log("page_Main.TcpChannel.sfReqAuctionItemListCount(Section=" $ string(Section) $ ", ItemClassify=" $ string(ItemClassify) $ ", ItemRank=" $ string(ItemRank) $ ", sortType=" $ string(SortType) $ ")");
    page_Main.TcpChannel.sfReqAuctionItemListCount(byte(SAItem.Section), SAItem.ItemClassify, SAItem.SortType, SAItem.ItemRank);
    return true;
}

function SortAuctionItemList(int SortType)
{
    // End:0x7a
    if(SAItem.SortType != SortType)
    {
        SAItem.SortType = SortType;
        sfReqAuctionItemList(SAItem.Section, SAItem.Keyword, SAItem.ItemRank, SAItem.ItemClassify, SAItem.IsAvailable, SAItem.CurrentPageNum, SAItem.PagePerCount, SAItem.SortType);
    }
}

function bool rfAckAuctionItemListCount(int Result, string ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count)
{
    local int pageCount;

    Log("[BTPageAuction::rfAckAuctionItemListCount] Classify=" $ string(Classfy) $ ", ItemType=" $ string(ItemType) $ ", ItemGrade=" $ string(ItemGrade) $ ", Count=" $ string(Count));
    // End:0xe3
    if(SAItem.bLock)
    {
        Log("[BTPageAuction::rfAckAuctionItemListCount] SAItem.bLock=false");
        SAItem.bLock = false;
    }
    // End:0x109
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    LastRefreshTime[0] = PlayerOwner().Level.TimeSeconds;
    // End:0x239
    if(Section == 0)
    {
        // End:0x148
        if(Count == 0)
        {
            pageCount = 1;
        }
        // End:0x15d
        else
        {
            pageCount = Count - 1 / 20 + 1;
        }
        SAItem.ItemClassify = Classfy;
        SAItem.ItemRank = ItemGrade;
        SAItem.SortType = ItemType;
        // End:0x204
        if(pageCount < SAItem.CurrentPageNum)
        {
            SAItem.CurrentPageNum = pageCount;
            sfReqAuctionItemList(Section, SAItem.Keyword, SAItem.ItemRank, SAItem.ItemClassify, SAItem.IsAvailable, SAItem.CurrentPageNum, SAItem.PagePerCount, SAItem.SortType);
        }
        TPAuction.TPBuying.PageButton.SetData(pageCount, 10, SAItem.CurrentPageNum);
    }
    // End:0x349
    else
    {
        // End:0x349
        if(Section == 1)
        {
            // End:0x25b
            if(Count == 0)
            {
                pageCount = 1;
            }
            // End:0x270
            else
            {
                pageCount = Count - 1 / 20 + 1;
            }
            SAItem.ItemClassify = Classfy;
            SAItem.ItemRank = ItemGrade;
            SAItem.SortType = ItemType;
            // End:0x317
            if(pageCount < SAItem.CurrentPageNum)
            {
                SAItem.CurrentPageNum = pageCount;
                sfReqAuctionItemList(Section, SAItem.Keyword, SAItem.ItemRank, SAItem.ItemClassify, SAItem.IsAvailable, SAItem.CurrentPageNum, SAItem.PagePerCount, SAItem.SortType);
            }
            TPAuction.TPSelling.PageButton.SetData(pageCount, 10, SAItem.CurrentPageNum);
        }
    }
    // End:0x45a
    if(Section == 2)
    {
        // End:0x36c
        if(Count == 0)
        {
            pageCount = 1;
        }
        // End:0x381
        else
        {
            pageCount = Count - 1 / 20 + 1;
        }
        SAItem.ItemClassify = Classfy;
        SAItem.ItemRank = ItemGrade;
        SAItem.SortType = ItemType;
        // End:0x428
        if(pageCount < SAItem.CurrentPageNum)
        {
            SAItem.CurrentPageNum = pageCount;
            sfReqAuctionItemList(Section, SAItem.Keyword, SAItem.ItemRank, SAItem.ItemClassify, SAItem.IsAvailable, SAItem.CurrentPageNum, SAItem.PagePerCount, SAItem.SortType);
        }
        TPAuction.TPMyAuction.PageButton.SetData(pageCount, 10, SAItem.CurrentPageNum);
    }
    // End:0x4c9
    if(bChangePage == false)
    {
        TPAuction.TPBuying.ACLList.LoadPos();
        TPAuction.TPSelling.ACLList.LoadPos();
        TPAuction.TPMyAuction.ACLList.LoadPos();
    }
    return true;
}

function bool rfAckAuctionItemListStart(int Result, string ErrMsg, byte Section, int PageNum, int Count)
{
    Log("[BTPageAuction::rfAckAuctionItemListStart] Result=" $ string(Result) $ ", Section=" $ string(Section) $ ", Count=" $ string(Count));
    // End:0x91
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    // End:0x105
    if(Section == 0)
    {
        TPAuction.TPBuying.ACLList.SavePos();
        TPAuction.TPBuying.ACLList.Clear();
        SAItem.Section = Section;
        SAItem.CurrentPageNum = PageNum;
    }
    // End:0x1eb
    else
    {
        // End:0x179
        if(Section == 1)
        {
            TPAuction.TPSelling.ACLList.SavePos();
            TPAuction.TPSelling.ACLList.Clear();
            SAItem.Section = Section;
            SAItem.CurrentPageNum = PageNum;
        }
        // End:0x1eb
        else
        {
            // End:0x1eb
            if(Section == 2)
            {
                TPAuction.TPMyAuction.ACLList.SavePos();
                TPAuction.TPMyAuction.ACLList.Clear();
                SAItem.Section = Section;
                SAItem.CurrentPageNum = PageNum;
            }
        }
    }
}

function bool rfAckAuctionItemList(byte Section, array<int> UniqueIDs, array<int> ItemIDs, array<int> AddPartsIDs, array<BtrDouble> UntilTimes, array<int> BiddingPrices, array<int> InstantlyByuingPrices, array<int> ItemDamageds, array<string> HighestBidderNames, array<string> SellerNames, array<int> ItemCount)
{
    local int i;
    local BtrTime t, t2;

    Log("[BTPageAuction::rfAckAuctionItemList] Section=" $ string(Section) $ ", UniqueIDs.Length=" $ string(UniqueIDs.Length));
    i = 0;
    J0x63:
    // End:0x28e [While If]
    if(i < UniqueIDs.Length)
    {
        BtrDoubleToBtrTime(UntilTimes[i], t);
        BtrDoubleToBtrTime(GameMgr.kClientTime, t2);
        t = BtrTimeSubstract(t, t2);
        // End:0x152
        if(Section == 0)
        {
            TPAuction.TPBuying.ACLList.AddAuctionItem(UniqueIDs[i], ItemIDs[i], AddPartsIDs[i], t, BiddingPrices[i], InstantlyByuingPrices[i], ItemDamageds[i], HighestBidderNames[i], SellerNames[i], ItemCount[i], false);
        }
        // End:0x284
        else
        {
            // End:0x1ec
            if(Section == 1)
            {
                TPAuction.TPSelling.ACLList.AddAuctionItem(UniqueIDs[i], ItemIDs[i], AddPartsIDs[i], t, BiddingPrices[i], InstantlyByuingPrices[i], ItemDamageds[i], HighestBidderNames[i], SellerNames[i], ItemCount[i], true);
            }
            // End:0x284
            else
            {
                // End:0x284
                if(Section == 2)
                {
                    TPAuction.TPMyAuction.ACLList.AddAuctionItem(UniqueIDs[i], ItemIDs[i], AddPartsIDs[i], t, BiddingPrices[i], InstantlyByuingPrices[i], ItemDamageds[i], HighestBidderNames[i], SellerNames[i], ItemCount[i], false);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    // End:0x2d8
    if(Section == 0)
    {
        TPAuction.TPBuying.ACLList.LoadPos();
        TPAuction.TPBuying.ACLList_OnClick(none);
    }
    // End:0x36a
    else
    {
        // End:0x322
        if(Section == 1)
        {
            TPAuction.TPSelling.ACLList.LoadPos();
            TPAuction.TPSelling.ACLList_OnClick(none);
        }
        // End:0x36a
        else
        {
            // End:0x36a
            if(Section == 2)
            {
                TPAuction.TPMyAuction.ACLList.LoadPos();
                TPAuction.TPMyAuction.ACLList_OnClick(none);
            }
        }
    }
    return true;
}

function bool rfAckAuctionItemListEnd(byte Section)
{
    Log("[BTPageAuction::rfAckAuctionItemListEnd] Section=" @ string(Section));
    // End:0x187
    if(Section == 0)
    {
        // End:0x7b
        if(bChangePage == false)
        {
            TPAuction.TPBuying.ACLList.LoadPos();
        }
        // End:0x184
        else
        {
            // End:0xdf
            if(TPAuction.TPBuying.ACLList.ACLRowList.Length > 0)
            {
                TPAuction.TPBuying.ACLList.LastSelectedIndexHistory = 0;
                TPAuction.TPBuying.ACLList_DefaultSelect();
            }
            // End:0x14c
            else
            {
                TPAuction.TPBuying.InfoBox.SetData(none, none, none, none);
                TPAuction.TPBuying.MenuButton[2].DisableMe();
                TPAuction.TPBuying.MenuButton[3].DisableMe();
            }
            TPAuction.TPBuying.ACLList.MultiColumnList.MyScrollBar.UpdateGripPosition(0.0);
        }
    }
    // End:0x412
    else
    {
        // End:0x2cb
        if(Section == 1)
        {
            // End:0x1c4
            if(bChangePage == false)
            {
                TPAuction.TPSelling.ACLList.LoadPos();
            }
            // End:0x2c8
            else
            {
                // End:0x229
                if(TPAuction.TPSelling.ACLList.ACLRowList.Length > 0)
                {
                    TPAuction.TPSelling.ACLList.LastSelectedIndexHistory = 0;
                    TPAuction.TPSelling.ACLList_OnClick(none);
                }
                // End:0x290
                else
                {
                    TPAuction.TPSelling.InfoBox.SetData(none, none, none, none);
                    TPAuction.TPSelling.ButtonAuctionCancel.DisableMe();
                    TPAuction.TPSelling.ButtonAuctionCancel.DisableMe();
                }
                TPAuction.TPSelling.ACLList.MultiColumnList.MyScrollBar.UpdateGripPosition(0.0);
            }
        }
        // End:0x412
        else
        {
            // End:0x412
            if(Section == 2)
            {
                // End:0x309
                if(bChangePage == false)
                {
                    TPAuction.TPMyAuction.ACLList.LoadPos();
                }
                // End:0x412
                else
                {
                    // End:0x36d
                    if(TPAuction.TPMyAuction.ACLList.ACLRowList.Length > 0)
                    {
                        TPAuction.TPMyAuction.ACLList.LastSelectedIndexHistory = 0;
                        TPAuction.TPMyAuction.ACLList_DefaultSelect();
                    }
                    // End:0x3da
                    else
                    {
                        TPAuction.TPMyAuction.InfoBox.SetData(none, none, none, none);
                        TPAuction.TPMyAuction.MenuButton[2].DisableMe();
                        TPAuction.TPMyAuction.MenuButton[3].DisableMe();
                    }
                    TPAuction.TPMyAuction.ACLList.MultiColumnList.MyScrollBar.UpdateGripPosition(0.0);
                }
            }
        }
    }
    return true;
}

function bool rfAckAuctionMyItemRegister(int Result, string ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain)
{
    local export editinline BTWindowAuctionSellingHK asw;

    Log("[BTPageAuction::rfAckAuctionMyItemRegister] Result=" @ string(Result));
    // End:0x76
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MM.kPoint = PointRemain;
    MM.UpdateMoneyInfo(MM);
    asw = BTWindowAuctionSellingHK(Controller.TopPage());
    // End:0x113
    if(asw.MaxItemCount > 0 && asw.MaxItemCount <= asw.SelectItemCount)
    {
        GameMgr.RemoveInstanceItem(asw.UniqueID);
    }
    // End:0x14e
    else
    {
        GameMgr.ChangeInstance_StackCount(asw.UniqueID, asw.MaxItemCount - asw.SelectItemCount);
    }
    GameMgr.UpdateItemList(GameMgr);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckAuctionMyItemCancel(int Result, string ErrMsg)
{
    Log("[BTPageAuction::rfAckAuctionMyItemCancel] Result=" $ string(Result));
    // End:0x64
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    class'BTWindowInfoHK'.static.ShowWindow(Controller, "", strSuccessAuctionCancel);
    sfReqAuctionItemList(1, "", 0, byte(byte(TPAuction.TPSelling.TabControlAuction.GetCurrentTabIndex() + 1) * 10), 0, 1, 20, 0);
    return true;
}

function bool rfAckAuctionTradeHistory(int Result, string ErrMsg, int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    Log("[BTPageAuction::rfAckAuctionTradeHistory] Result=" $ string(Result));
    // End:0x64
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowTradeHistoryHK");
    BTWindowTradeHistoryHK(Controller.TopPage()).SetData(ItemID, PartID, SellerCharNm, DamageDegree, Price);
    return true;
}

function UpdateAuctionList()
{
    local int ti;

    ti = TPAuction.TabControl.GetCurrentTabIndex();
    switch(ti)
    {
        // End:0x33
        case 0:
            TPBuying_PageButton_OnClick(1);
            // End:0x4c
            break;
        // End:0x41
        case 1:
            TPMyAuction_PageButton_OnClick(1);
            // End:0x4c
            break;
        // End:0x49
        case 2:
            // End:0x4c
            break;
        // End:0xffff
        default:
}

function bool rfAckAuctionBidding(int Result, string ErrMsg, int PointRemain)
{
    Log("[BTPageAuction::rfAckAuctionBidding] Result=" $ string(Result));
    // End:0x65
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        UpdateAuctionList();
        return false;
    }
    MM.kPoint = PointRemain;
    MM.UpdateMoneyInfo(MM);
    class'BTWindowInfoHK'.static.ShowWindow(Controller, "", TPAuction.TPBuying.LastBiddingItemName $ strSuccessBidding[0]);
    sfReqAuctionItemList(0, "", TPAuction.TPBuying.GetRankIdx(), 0, 0, SAItem.CurrentPageNum, 20, TPAuction.TPBuying.GetSortIdx());
    return true;
}

function bool rfAckAuctionInstantlyBuying(int Result, string ErrMsg, int PointRemain)
{
    Log("[BTPageAuction::rfAckAuctionInstantlyBuying] Result=" $ string(Result));
    // End:0x6d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        UpdateAuctionList();
        return false;
    }
    MM.kPoint = PointRemain;
    MM.UpdateMoneyInfo(MM);
    class'BTWindowInfoHK'.static.ShowWindow(Controller, "", TPAuction.TPBuying.LastBiddingItemName $ strSuccessBidding[1]);
    sfReqAuctionItemList(0, "", TPAuction.TPBuying.GetRankIdx(), 0, 0, SAItem.CurrentPageNum, 20, TPAuction.TPBuying.GetSortIdx());
    return true;
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float CurrentTime;

    super.Internal_OnPreDraw(C);
    // End:0x22
    if(page_Main.bConnectedChannelServer == false)
    {
        return false;
    }
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    // End:0xf0
    if(CurrentTime - LastRefreshTime[0] > RefreshCycleTime[0])
    {
        // End:0xe3
        if(!Controller.ViewportOwner.Console.IsInputTimeTooIdle())
        {
            // End:0xe3
            if(SAItem.CurrentPageNum > 0)
            {
                sfReqAuctionItemList(SAItem.Section, SAItem.Keyword, SAItem.ItemRank, SAItem.ItemClassify, SAItem.IsAvailable, SAItem.CurrentPageNum, SAItem.PagePerCount, SAItem.SortType);
            }
        }
        LastRefreshTime[0] = CurrentTime;
    }
    return false;
}

function bool BTWindowItemRepairHK_OnOK(GUIComponent Sender)
{
    local array<BtrDouble> rilist;

    Repair_UniqueItemID = BTWindowItemRepairHK(Sender).UniqueID;
    // End:0xdc
    if(BTWindowItemRepairHK(Sender).itemBox.itemBox.instanceInfo.DamageDegree >= 80000)
    {
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, BTWindowItemRepairHK(Sender).itemBox.itemBox.ItemName.Text);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairItem_OnOK;
        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
        return true;
    }
    // End:0x106
    else
    {
        rilist[0] = Repair_UniqueItemID;
        page_Main.TcpChannel.sfReqRepairItem(rilist);
    }
}

function bool RepairItem_OnOK(GUIComponent Sender)
{
    local array<BtrDouble> rilist;

    rilist[0] = Repair_UniqueItemID;
    page_Main.TcpChannel.sfReqRepairItem(rilist);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowItemRepairAllHK_OnOK(GUIComponent Sender)
{
    local int i;
    local string strItemNames;

    RepairAllButtonID = BTWindowItemRepairAllHK(Sender).CurrentButtonID;
    // End:0x161
    if(RepairAllButtonID == 0)
    {
        // End:0x128
        if(TPAuction.TPSelling.Equip_DamegeItemNames.Length > 0)
        {
            strItemNames = TPAuction.TPSelling.Equip_DamegeItemNames[0];
            i = 1;
            J0x68:
            // End:0xc4 [While If]
            if(i < TPAuction.TPSelling.Equip_DamegeItemNames.Length)
            {
                strItemNames = strItemNames $ ", " $ TPAuction.TPSelling.Equip_DamegeItemNames[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x68;
            }
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairAllItem_OnOK;
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
        }
        // End:0x15e
        else
        {
            LastReqRepairMode = 1;
            page_Main.TcpChannel.sfReqRepairItem(TPAuction.TPSelling.EquipItemList);
        }
    }
    // End:0x29c
    else
    {
        // End:0x265
        if(TPAuction.TPSelling.Inven_DamegeItemNames.Length > 0)
        {
            strItemNames = TPAuction.TPSelling.Inven_DamegeItemNames[0];
            i = 1;
            J0x1a5:
            // End:0x201 [While If]
            if(i < TPAuction.TPSelling.Inven_DamegeItemNames.Length)
            {
                strItemNames = strItemNames $ ", " $ TPAuction.TPSelling.Inven_DamegeItemNames[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1a5;
            }
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairAllItem_OnOK;
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
        }
        // End:0x29c
        else
        {
            LastReqRepairMode = 2;
            page_Main.TcpChannel.sfReqRepairItem(TPAuction.TPSelling.InvenItemList);
        }
    }
    return true;
}

function bool RepairAllItem_OnOK(GUIComponent Sender)
{
    // End:0x44
    if(RepairAllButtonID == 0)
    {
        LastReqRepairMode = 1;
        page_Main.TcpChannel.sfReqRepairItem(TPAuction.TPSelling.EquipItemList);
    }
    // End:0x7b
    else
    {
        LastReqRepairMode = 2;
        page_Main.TcpChannel.sfReqRepairItem(TPAuction.TPSelling.InvenItemList);
    }
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    local int i, equipRepairCost, invenRepairCost;
    local BTROItemBoxHK ro;

    Log("[BTPageInventory::rfAckRepairCost] Result=" $ string(Result));
    // End:0x5d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x15e
    if(TPAuction.TPSelling.CurrentRepairMode == 3)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairHK");
        ro = TPAuction.TPSelling.InfoBox.ItemBoxView.itemBox;
        BTWindowItemRepairHK(Controller.TopPage()).SetData(UniqueItemID[0], RepairCost[0], MM.kPoint, ro.ItemInfo, ro.instanceInfo);
        BTWindowItemRepairHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairHK_OnOK;
    }
    // End:0x28d
    else
    {
        i = 0;
        J0x165:
        // End:0x1c4 [While If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1a8
            if(i < TPAuction.TPSelling.EquipItemCount)
            {
                equipRepairCost += RepairCost[i];
            }
            invenRepairCost += RepairCost[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x165;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairAllHK");
        ro = BTROItemBoxHK(TPAuction.TPSelling.TPItemList.ItemList.GetLastSelectedItem());
        BTWindowItemRepairAllHK(Controller.TopPage()).SetData(equipRepairCost, invenRepairCost, MM.kPoint);
        BTWindowItemRepairAllHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairAllHK_OnOK;
    }
    return true;
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    local int i;

    Log("[BTPageInventory::rfAckRepairItem] Result=" $ string(Result));
    // End:0x6d
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MM.kPoint = RepairCost;
    MM.UpdateMoneyInfo(MM);
    Log("RepairItem Cost = " $ string(RepairCost));
    Log("RepairItem List Start");
    i = 0;
    J0xd8:
    // End:0x136 [While If]
    if(i < UniqueItemID.Length)
    {
        GameMgr.ChangeInstance_ItemDurability(UniqueItemID[i], 100000);
        GameMgr.ChangeInstance_ItemDamageDegree(UniqueItemID[i], DamageDegree[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd8;
    }
    GameMgr.UpdateItemList(GameMgr);
    Log("RepairItem List End");
    Controller.CloseMenu(false);
    PlayerOwner().PlaySound(Controller.ItemRepairSound, 6, 1.0);
    // End:0x1b5
    if(LastReqRepairMode == 0)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 20);
    }
    // End:0x1d6
    if(LastReqRepairMode == 1)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 71);
    }
    // End:0x1f8
    if(LastReqRepairMode == 2)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 72);
    }
    LastReqRepairMode = 0;
    return true;
}

defaultproperties
{
    RefreshCycleTime[0]=30.0
    RefreshCycleTime[1]=60.0
    strSuccessAuctionCancel="Successfully cancelled the sale of the selected item. The item was sent to your Mailbox."
    strSuccessBidding[0]=" was bid on successfully."
    strSuccessBidding[1]=" was purchased successfully. The item was sent to your Mailbox."
    fbLabelPoint=(X1=510.0,Y1=81.0,X2=757.0,Y2=104.0)
    fbLabelCash=(X1=767.0,Y1=81.0,X2=1014.0,Y2=104.0)
    fbLabelP=(X1=519.0,Y1=85.0,X2=534.0,Y2=100.0)
    fbLabelC=(X1=776.0,Y1=85.0,X2=791.0,Y2=100.0)
    begin object name=mTPInven class=BTTPAuctionHK
        bUseAWinPos=true
        AWinPos=(X1=10.0,Y1=88.0,X2=500.0,Y2=736.0)
    object end
    // Reference: BTTPAuctionHK'BTPageAuction.mTPInven'
    TPAuction=mTPInven
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnPreDraw=Internal_OnPreDraw
}