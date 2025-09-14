class BTPageStore extends BTNetGUIPageHK
    editinlinenew
    instanced;

var FloatBox fbTPStore;
var export editinline BTTPStoreHK TPStore;
var() automated FloatBox fbLabelPoint;
var() automated FloatBox fbLabelCash;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var() automated FloatBox fbLabelP;
var() automated FloatBox fbLabelC;
var export editinline BTOwnerDrawImageHK LabelP;
var export editinline BTOwnerDrawImageHK LabelC;
var() automated FloatBox fbLabelCCoinCash;
var export editinline BTOwnerDrawImageHK LabelCCoinCash;
var() automated FloatBox fbRedeemCodesBtn;
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
            // End:0x2A5
            break;
        // End:0x52
        case 1:
            page_Main.SetPage(20, true);
            // End:0x2A5
            break;
        // End:0x6C
        case 3:
            page_Main.SetPage(22, true);
            // End:0x2A5
            break;
        // End:0x86
        case 4:
            page_Main.SetPage(18, true);
            // End:0x2A5
            break;
        // End:0x1A7
        case 5:
            // End:0xBD
            if(MM.kClanName != "")
            {
                bGoToClanPage = true;
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
            // End:0x2A5
            break;
        // End:0x1AF
        case 6:
            // End:0x2A5
            break;
        // End:0x1B7
        case 7:
            // End:0x2A5
            break;
        // End:0x1CE
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2A5
            break;
        // End:0x20A
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2A5
            break;
        // End:0x251
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x2A5
            break;
        // End:0x294
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x2A5
            break;
        // End:0x2A2
        case 20:
            OpenTodayResultPage();
            // End:0x2A5
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool TPStore_TabButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPStore.TabControl.SetVisiblePanel(btn.ButtonID);
    TPStore.TPWeapon.MainTabSelect(TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex(), TPStore.TPWeapon.TabControl[1].GetCurrentTabIndex());
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    TPStore = BTTPStoreHK(NewComponent(new Class'GUIWarfareControls.BTTPStoreHK', fbTPStore));
    TPStore.TPWeapon.TcpChannel = TcpChannel;
    TPStore.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    TPStore.ButtonInven[0].__OnClick__Delegate = TPStore_TabButton_OnClick;
    TPStore.TabControl.SetVisiblePanel(0);
    TPStore.TPWeapon.FocusFirst(none);
    InitializeCashNPoint();
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 48.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 96.0000000;
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
    //return;    
}

function ClearChatLog_Extra()
{
    //return;    
}

function NormalChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    //return;    
}

function ClanChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    //return;    
}

function WhisperChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    //return;    
}

function SelfChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    //return;    
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    //return;    
}

function TeamChatLog_Extra(string cL)
{
    TPStore.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    //return;    
}

function InitializeCashNPoint()
{
    LabelCash = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = Class'GUIWarfareControls.BTUIColorPoolHK'.static.Cash();
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = Class'GUIWarfareControls.BTUIColorPoolHK'.static.Point();
    LabelPoint.InitComponent(Controller, self);
    AppendComponent(LabelPoint);
    LabelC = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelC.bUseAWinPos = true;
    LabelC.AWinPos = fbLabelC;
    LabelC.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_cash;
    LabelC.InitComponent(Controller, self);
    AppendComponent(LabelC);
    LabelP = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelP.bUseAWinPos = true;
    LabelP.AWinPos = fbLabelP;
    LabelP.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_point;
    LabelP.InitComponent(Controller, self);
    AppendComponent(LabelP);
    LabelCCoinCash = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelCCoinCash.bUseAWinPos = true;
    LabelCCoinCash.AWinPos = fbLabelCCoinCash;
    LabelCCoinCash.SetFontSizeAll(10);
    LabelCCoinCash.FontColor[0] = Class'GUIWarfareControls.BTUIColorPoolHK'.static.Cash();
    LabelCCoinCash.InitComponent(Controller, self);
    AppendComponent(LabelCCoinCash);
    //return;    
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    local int i;

    Log("[BTPageStore::UpdateMoneyInfo]");
    RefreshCashNPoint();
    i = 0;
    J0x2F:

    // End:0x10F [Loop If]
    if(i < Controller.MenuStack.Length)
    {
        // End:0x105
        if(BTWindowItemBuyHK(Controller.MenuStack[i]) != none)
        {
            BTWindowItemBuyHK(Controller.MenuStack[i]).SetMoneyInfo(TPStore.TPWeapon.TPItemList.MyData.MyPoint, TPStore.TPWeapon.TPItemList.MyData.MyCash, TPStore.TPWeapon.TPItemList.MyData.MyCCoinCash);
        }
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    //return;    
}

function UpdateServerTime(wGameManager GameMgr)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageStore::UpdateServerTime]");
    RefreshShop();
    // End:0xBF
    if(page_Main.rMM.kFirstIntoStore == false)
    {
        page_Main.rMM.kFirstIntoStore = true;
        instanceInfo = GameMgr.FindFirstInstanceItemByItemID(17001);
        // End:0xBF
        if(instanceInfo != none)
        {
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 24);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_24_OnOK;
        }
    }
    //return;    
}

function UpdateItemList(wGameManager MM)
{
    Log("[BTPageStore::UpdateItemList]");
    RefreshShop();
    //return;    
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    Log("[BTPageStore::UpdateWebzenItemList]");
    TPStore.TPWeapon.fill(GameMgr.ShopItemList);
    //return;    
}

function bool BTWindowDefineARHK_24_OnOK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineARHK_24_OnOK] ");
    Controller.CloseMenu(false);
    page_Main.rMM.kFirstIntoInventory = false;
    page_Main.SetPage(22, true);
    return true;
    //return;    
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    GameMgr.__UpdateWebzenItemList__Delegate = UpdateWebzenItemList;
    MM.__UpdateMoneyInfo__Delegate = UpdateMoneyInfo;
    GameMgr.__UpdateServerTime__Delegate = UpdateServerTime;
    //return;    
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    MM.__UpdateMoneyInfo__Delegate = None;
    GameMgr.__UpdateServerTime__Delegate = None;
    //return;    
}

function InternalOnReOpen()
{
    __NFUN_270__("BTPageInventory::InternalOnReOpen()");
    Log("[BTPageInventory::InternalOnReOpen] Start");
    Log("[BTPageInventory::InternalOnReOpen] End");
    //return;    
}

function InternalOnOpen()
{
    local wItemBoxInstanceHK instanceInfo;

    __NFUN_270__("BTPageStore::InternalOnOpen()");
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
    // End:0x1A2
    if(GameMgr.ShopItemListCount == 0)
    {
        page_Main.TcpChannel.sfReqShopItemList();
    }
    page_Main.TcpChannel.sfReqChangeUserState(3, 0);
    currentBGM = "bgm_shop";
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    page_Main.TcpChannel.sfReqGetServerTime();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageStore::InternalOnClose()");
    Log("[BTPageStore::InternalOnClose] ");
    TPStore.CharacterModel.EndModel();
    UnInitializeDelegate();
    OnClose(bCanceled);
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
    //return;    
}

function RefreshCashNPoint()
{
    Log("[BTPageStore::RefreshCashNPoint]");
    LabelPoint.Caption = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(125, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));
    LabelCash.Caption = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
    LabelCCoinCash.Caption = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(223, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kCCoinCash)));
    TPStore.TPWeapon.TPItemList.MyData.myLevel = MM.kLevel;
    TPStore.TPWeapon.TPItemList.MyData.MyPoint = MM.kPoint;
    TPStore.TPWeapon.TPItemList.MyData.MyCash = MM.kCash;
    TPStore.TPWeapon.TPItemList.MyData.MyCCoinCash = MM.kCCoinCash;
    //return;    
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
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageStore_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageStore_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
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
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
    //return;    
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
    //return;    
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageStore::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xF3
    if((ClanName != "none") && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    return true;
    //return;    
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageStore::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8B
    if((ClanName != "none") && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
    //return;    
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageStore::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
    //return;    
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xDA
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;        
    }
    else
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
    //return;    
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
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
    //return;    
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckShopItemListStart(int Count)
{
    Log("[BTPageStore::rfAckShopItemListStart] Count : " $ string(Count));
    GameMgr.ShopItemListCount = Count;
    GameMgr.ShopItemList.Length = 0;
    return true;
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    local int i;

    Log("[BTPageStore::rfAckShopItemList]");
    i = 0;
    J0x2B:

    // End:0xC7 [Loop If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
        Log((("ShopList[" $ string(i)) $ " ItemID : ") $ string(ItemID[i]));
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    return true;
    //return;    
}

function bool rfAckShopItemListEnd()
{
    Log("[BTPageStore::rfAckShopItemListEnd]");
    RefreshShop();
    return true;
    //return;    
}

function BoughtItemMark(int BoughtItemID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xCA [Loop If]
    if(i < TPStore.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        // End:0xC0
        if(TPStore.TPWeapon.TPItemList.ItemList.DataPool[i].ItemInfo.ItemID == BoughtItemID)
        {
            TPStore.TPWeapon.TPItemList.ItemList.DataPool[i].RibbonState = 1;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    local string ItemName, Receiver;

    Log("[BTPageStore::rfAckSendGift] Result=" $ string(Result));
    // End:0x67
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kPoint = PointRemain;
    MM.UpdateMoneyInfo(MM);
    Receiver = BTWindowSendPresentHK(Controller.TopPage()).EditReceiveUser.TextStr;
    ItemName = BTWindowSendPresentHK(Controller.TopPage()).itemBox.itemBox.ItemInfo.ItemName;
    Controller.CloseMenu(false);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 123, Receiver, ItemName);
    return true;
    //return;    
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    Log("[BTPageStore::rfAckBuyItemByWebzenCash] Result=" $ string(Result));
    Class'GUIWarfareControls.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls.BTWindowItemBuyHK');
    // End:0x7B
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    page_Main.sfReqWebzenInvenList("S");
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, TPStore.TPWeapon.SaveWebzenBuyItemName);
    BTWindowHK(Controller.TopPage()).ButtonOK.StartTimeOut(1.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).ButtonOK.__OnTimeOut__Delegate = BTWindowDefineInfoHK_ButtonOK_OnTimeOut;
    BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK;
    return true;
    //return;    
}

function BTWindowDefineInfoHK_ButtonOK_OnTimeOut(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineInfoHK_ButtonOK_OnTimeOut]");
    BTOwnerDrawCaptionButtonHK(Sender).EnableMe();
    //return;    
}

function bool BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK]");
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    BTWindowHK(Controller.TopPage()).FadeOut(false, true);
    return true;
    //return;    
}

function bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    local string ItemName, Receiver;

    Log("[BTPageStore::rfAckGiftItemByWebzenCash] Result=" $ string(Result));
    // End:0x73
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Receiver = BTWindowSendPresentHK(Controller.TopPage()).EditReceiveUser.TextStr;
    ItemName = BTWindowSendPresentHK(Controller.TopPage()).ro.instanceInfo.CashItemInfo.WZItemName;
    Controller.CloseMenu(false);
    page_Main.TcpChannel.sfReqWebzenCash();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 123, Receiver, ItemName);
    BTWindowHK(Controller.TopPage()).ButtonOK.StartTimeOut(1.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).ButtonOK.__OnTimeOut__Delegate = BTWindowDefineInfoHK_ButtonOK_OnTimeOut;
    BTWindowHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineInfoHK_BuyGiftByWebzenCash_OnOK;
    return true;
    //return;    
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
        // End:0xE7
        if(Result == 859)
        {
            blockDoubleTime = GameMgr.GetLeftEventTime(1020);
            // End:0x98
            if((blockDoubleTime.dummy_1_DO_NOT_USE != 0) || blockDoubleTime.dummy_2_DO_NOT_USE != 0)
            {
                BtrDoubleToBtrTime(blockDoubleTime, blockTime);                
            }
            else
            {
                blockTime.Minute = 10;
            }
            blockMsg = Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.GetFormatString(859, string(blockTime.Minute));
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowErrorMsg(Controller, blockMsg);            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 224);
    }
    return true;
    //return;    
}

defaultproperties
{
    fbTPStore=(X1=10.0000000,Y1=88.0000000,X2=500.0000000,Y2=736.0000000)
    fbLabelPoint=(X1=539.0000000,Y1=97.0000000,X2=688.0000000,Y2=110.0000000)
    fbLabelCash=(X1=729.0000000,Y1=97.0000000,X2=878.0000000,Y2=110.0000000)
    fbLabelCCoinCash=(X1=739.0000000,Y1=97.0000000,X2=888.0000000,Y2=110.0000000)
    strRedeemCodesBtn="Redeem Codes"
    bPersistent=false
    OnOpen=BTPageStore.InternalOnOpen
    OnClose=BTPageStore.InternalOnClose
    OnKeyEvent=BTPageStore.internalKeyEvent
}