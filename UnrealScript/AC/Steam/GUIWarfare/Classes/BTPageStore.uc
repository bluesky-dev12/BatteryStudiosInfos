/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageStore.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:16
 *	Functions:44
 *
 *******************************************************************************/
class BTPageStore extends BTNetGUIPageHK
    dependson(BTPageStore_TCP)
    editinlinenew
    instanced;

var FloatBox fbTPStore;
var export editinline BTTPStoreHK TPStore;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelPoint;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelCash;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelP;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelC;
var export editinline BTOwnerDrawImageHK LabelP;
var export editinline BTOwnerDrawImageHK LabelC;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelCCoinCash;
var export editinline BTOwnerDrawImageHK LabelCCoinCash;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbRedeemCodesBtn;
var export editinline BTOwnerDrawCaptionButtonHK RedeemCodesBtn;
var localized string strRedeemCodesBtn;
var bool bGoToClanPage;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x39
        case 0:
            page_Main.SetPage(23, true);
            // End:0x2a5
            break;
        // End:0x52
        case 1:
            page_Main.SetPage(20, true);
            // End:0x2a5
            break;
        // End:0x6c
        case 3:
            page_Main.SetPage(22, true);
            // End:0x2a5
            break;
        // End:0x86
        case 4:
            page_Main.SetPage(18, true);
            // End:0x2a5
            break;
        // End:0x1a7
        case 5:
            // End:0xbd
            if(MM.kClanName != "")
            {
                bGoToClanPage = true;
                page_Main.SetPage(24, false);
            }
            // End:0x1a4
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2a5
            break;
        // End:0x1af
        case 6:
            // End:0x2a5
            break;
        // End:0x1b7
        case 7:
            // End:0x2a5
            break;
        // End:0x1ce
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2a5
            break;
        // End:0x20a
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2a5
            break;
        // End:0x251
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x2a5
            break;
        // End:0x294
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x2a5
            break;
        // End:0x2a2
        case 20:
            OpenTodayResultPage();
            // End:0x2a5
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool TPStore_TabButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPStore.TabControl.SetVisiblePanel(btn.ButtonID);
    TPStore.TPWeapon.MainTabSelect(TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex(), TPStore.TPWeapon.TabControl[1].GetCurrentTabIndex());
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    TPStore = BTTPStoreHK(NewComponent(new class'BTTPStoreHK', fbTPStore));
    TPStore.TPWeapon.TcpChannel = TcpChannel;
    TPStore.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    TPStore.ButtonInven[0].__OnClick__Delegate = TPStore_TabButton_OnClick;
    TPStore.TabControl.SetVisiblePanel(0);
    TPStore.TPWeapon.FocusFirst(none);
    InitializeCashNPoint();
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 48.0;
    LabelRoomName.ClipArea.X2 = 280.0;
    LabelRoomName.ClipArea.Y2 = 96.0;
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
}

function ClearChatLog_Extra();
function NormalChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatNormal());
}

function ClanChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatClan());
}

function WhisperChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatWhisper());
}

function SelfChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSystem());
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
}

function TeamChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function InitializeCashNPoint()
{
    LabelCash = new class'BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = class'BTUIColorPoolHK'.static.Cash();
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new class'BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = class'BTUIColorPoolHK'.static.Point();
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
    LabelCCoinCash = new class'BTOwnerDrawImageHK';
    LabelCCoinCash.bUseAWinPos = true;
    LabelCCoinCash.AWinPos = fbLabelCCoinCash;
    LabelCCoinCash.SetFontSizeAll(10);
    LabelCCoinCash.FontColor[0] = class'BTUIColorPoolHK'.static.Cash();
    LabelCCoinCash.InitComponent(Controller, self);
    AppendComponent(LabelCCoinCash);
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    local int i;

    Log("[BTPageStore::UpdateMoneyInfo]");
    RefreshCashNPoint();
    i = 0;
    J0x2f:
    // End:0x10f [While If]
    if(i < Controller.MenuStack.Length)
    {
        // End:0x105
        if(BTWindowItemBuyHK(Controller.MenuStack[i]) != none)
        {
            BTWindowItemBuyHK(Controller.MenuStack[i]).SetMoneyInfo(TPStore.TPWeapon.TPItemList.MyData.MyPoint, TPStore.TPWeapon.TPItemList.MyData.MyCash, TPStore.TPWeapon.TPItemList.MyData.MyCCoinCash);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
}

function UpdateServerTime(wGameManager GameMgr)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageStore::UpdateServerTime]");
    RefreshShop();
    // End:0xbf
    if(page_Main.rMM.kFirstIntoStore == false)
    {
        page_Main.rMM.kFirstIntoStore = true;
        instanceInfo = GameMgr.FindFirstInstanceItemByItemID(17001);
        // End:0xbf
        if(instanceInfo != none)
        {
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 24);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_24_OnOK;
        }
    }
}

function UpdateItemList(wGameManager MM)
{
    Log("[BTPageStore::UpdateItemList]");
    RefreshShop();
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    Log("[BTPageStore::UpdateWebzenItemList]");
    TPStore.TPWeapon.fill(GameMgr.ShopItemList);
}

function bool BTWindowDefineARHK_24_OnOK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineARHK_24_OnOK] ");
    Controller.CloseMenu(false);
    page_Main.rMM.kFirstIntoInventory = false;
    page_Main.SetPage(22, true);
    return true;
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    GameMgr.__UpdateWebzenItemList__Delegate = UpdateWebzenItemList;
    MM.__UpdateMoneyInfo__Delegate = UpdateMoneyInfo;
    GameMgr.__UpdateServerTime__Delegate = UpdateServerTime;
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    MM.__UpdateMoneyInfo__Delegate = None;
    GameMgr.__UpdateServerTime__Delegate = None;
}

function InternalOnReOpen()
{
    UnresolvedNativeFunction_97("BTPageInventory::InternalOnReOpen()");
    Log("[BTPageInventory::InternalOnReOpen] Start");
    Log("[BTPageInventory::InternalOnReOpen] End");
}

function InternalOnOpen()
{
    local wItemBoxInstanceHK instanceInfo;

    UnresolvedNativeFunction_97("BTPageStore::InternalOnOpen()");
    Log("[BTPageStore::InternalOnOpen] ");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM.SetCurSubPos(4);
    InitializeDelegate();
    TPStore.CharacterModel.BeginModel();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    instanceInfo = GameMgr.FindInstanceItemBySlotPos(0);
    TPStore.CharacterModel.ChangeWeapon(instanceInfo.ItemID, instanceInfo.PartID, instanceInfo.PaintID);
    TPStore.CharacterModel.ChangeEquipItem(GameMgr);
    // End:0x1a2
    if(GameMgr.ShopItemListCount == 0)
    {
        page_Main.TcpChannel.sfReqShopItemList();
    }
    page_Main.TcpChannel.sfReqChangeUserState(3, 0);
    currentBGM = "bgm_shop";
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    page_Main.TcpChannel.sfReqGetServerTime();
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageStore::InternalOnClose()");
    Log("[BTPageStore::InternalOnClose] ");
    TPStore.CharacterModel.EndModel();
    UnInitializeDelegate();
    OnClose(bCanceled);
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
}

function RefreshCashNPoint()
{
    Log("[BTPageStore::RefreshCashNPoint]");
    LabelPoint.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(125, class'BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));
    LabelCash.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(126, class'BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
    LabelCCoinCash.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(223, class'BTCustomDrawHK'.static.ToWonString(string(MM.kCCoinCash)));
    TPStore.TPWeapon.TPItemList.MyData.myLevel = MM.kLevel;
    TPStore.TPWeapon.TPItemList.MyData.MyPoint = MM.kPoint;
    TPStore.TPWeapon.TPItemList.MyData.MyCash = MM.kCash;
    TPStore.TPWeapon.TPItemList.MyData.MyCCoinCash = MM.kCCoinCash;
}

function RefreshShop()
{
    local int TabIndex[2], topIdx, SelectIdx;

    Log("[BTPageStore::RefreshShop]");
    TabIndex[0] = TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex();
    TabIndex[1] = TPStore.TPWeapon.TabControl[1].GetCurrentTabIndex();
    topIdx = TPStore.TPWeapon.TPItemList.ItemList.ImageList.Top;
    SelectIdx = TPStore.TPWeapon.TPItemList.ItemList.LastSelectedItemIndex;
    TPStore.TPWeapon.fill(GameMgr.ShopItemList);
    RefreshCashNPoint();
    TPStore.TPWeapon.Refresh();
    TPStore.TPWeapon.MainTabSelect(TabIndex[0], TabIndex[1]);
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetIndex(SelectIdx);
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(topIdx);
    TPStore.TPWeapon.SetInfoBox(SelectIdx);
    TPStore.TPWeapon.TPItemList.ItemList.LastSelectedItemIndex = SelectIdx;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageStore_TCP TCP;

    TCP = new class'BTPageStore_TCP';
    TCP.Owner = self;
    return TCP;
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageStore::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x74
    if(bCurLookingFor)
    {
        page_Main.TcpChannel.sfReqSetLookForClan(0);
    }
    // End:0x8e
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
}

function bool ClanMenu_ButtonFindClan_OnClick(GUIComponent Sender)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageStore::ClanMenu_ButtonFindClan_OnClick]");
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

    Log("[BTPageStore::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf3
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

    Log("[BTPageStore::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8b
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageStore::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xda
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0x100
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

    Log("[BTPageStore::BTWindowCreateClanHK_OnOK]");
    // End:0x161
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
    // End:0x177
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckShopItemListStart(int Count)
{
    Log("[BTPageStore::rfAckShopItemListStart] Count : " $ string(Count));
    GameMgr.ShopItemListCount = Count;
    GameMgr.ShopItemList.Length = 0;
    return true;
}

function bool rfAckShopItemList(array<int> ItemID)
{
    local int i;

    Log("[BTPageStore::rfAckShopItemList]");
    i = 0;
    J0x2b:
    // End:0xc7 [While If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
        Log("ShopList[" $ string(i) $ " ItemID : " $ string(ItemID[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2b;
    }
    return true;
}

function bool rfAckShopItemListEnd()
{
    Log("[BTPageStore::rfAckShopItemListEnd]");
    RefreshShop();
    return true;
}

function BoughtItemMark(int BoughtItemID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xca [While If]
    if(i < TPStore.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        // End:0xc0
        if(TPStore.TPWeapon.TPItemList.ItemList.DataPool[i].ItemInfo.ItemID == BoughtItemID)
        {
            TPStore.TPWeapon.TPItemList.ItemList.DataPool[i].RibbonState = 1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    local string ItemName, Receiver;

    Log("[BTPageStore::rfAckSendGift] Result=" $ string(Result));
    // End:0x67
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = PointRemain;
    MM.UpdateMoneyInfo(MM);
    Receiver = BTWindowSendPresentHK(Controller.TopPage()).EditReceiveUser.TextStr;
    ItemName = BTWindowSendPresentHK(Controller.TopPage()).itemBox.itemBox.ItemInfo.ItemName;
    Controller.CloseMenu(false);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 123, Receiver, ItemName);
    return true;
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    Log("[BTPageStore::rfAckBuyItemByWebzenCash] Result=" $ string(Result));
    class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowItemBuyHK');
    // End:0x7b
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    page_Main.sfReqWebzenInvenList("S");
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, TPStore.TPWeapon.SaveWebzenBuyItemName);
    BTWindowHK(Controller.TopPage()).ButtonOK.StartTimeOut(1.0);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).ButtonOK.__OnTimeOut__Delegate = BTWindowDefineInfoHK_ButtonOK_OnTimeOut;
    BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK;
    return true;
}

function BTWindowDefineInfoHK_ButtonOK_OnTimeOut(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineInfoHK_ButtonOK_OnTimeOut]");
    BTOwnerDrawCaptionButtonHK(Sender).EnableMe();
}

function bool BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK]");
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    BTWindowHK(Controller.TopPage()).FadeOut(false, true);
    return true;
}

function bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    local string ItemName, Receiver;

    Log("[BTPageStore::rfAckGiftItemByWebzenCash] Result=" $ string(Result));
    // End:0x73
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Receiver = BTWindowSendPresentHK(Controller.TopPage()).EditReceiveUser.TextStr;
    ItemName = BTWindowSendPresentHK(Controller.TopPage()).ro.instanceInfo.CashItemInfo.WZItemName;
    Controller.CloseMenu(false);
    page_Main.TcpChannel.sfReqWebzenCash();
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 123, Receiver, ItemName);
    BTWindowHK(Controller.TopPage()).ButtonOK.StartTimeOut(1.0);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).ButtonOK.__OnTimeOut__Delegate = BTWindowDefineInfoHK_ButtonOK_OnTimeOut;
    BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK;
    return true;
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    local BtrDouble blockDoubleTime;
    local BtrTime blockTime;
    local wGameManager GameMgr;
    local string blockMsg;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x103
    if(Result != 0)
    {
        // End:0xe7
        if(Result == 859)
        {
            blockDoubleTime = GameMgr.GetLeftEventTime(1020);
            // End:0x98
            if(blockDoubleTime.dummy_1_DO_NOT_USE != 0 || blockDoubleTime.dummy_2_DO_NOT_USE != 0)
            {
                BtrDoubleToBtrTime(blockDoubleTime, blockTime);
            }
            // End:0xa5
            else
            {
                blockTime.Minute = 10;
            }
            blockMsg = class'BTWindowErrorDefineHK'.static.GetFormatString(859, string(blockTime.Minute));
            class'BTWindowErrorDefineHK'.static.ShowErrorMsg(Controller, blockMsg);
        }
        // End:0x100
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    // End:0x119
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 224);
    }
    return true;
}

defaultproperties
{
    fbTPStore=(X1=10.0,Y1=88.0,X2=500.0,Y2=736.0)
    fbLabelPoint=(X1=539.0,Y1=97.0,X2=688.0,Y2=110.0)
    fbLabelCash=(X1=729.0,Y1=97.0,X2=878.0,Y2=110.0)
    fbLabelCCoinCash=(X1=739.0,Y1=97.0,X2=888.0,Y2=110.0)
    strRedeemCodesBtn="Redeem Codes"
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnKeyEvent=internalKeyEvent
}