class BTPageStore extends BTNetGUIPageHK
    editinlinenew
    instanced;

var FloatBox fbTPStore;
var export editinline BTTPStoreHK TPStore;
var export editinline BTMoneyInfo MoneyInfoObject;
var bool bGoToClanPage;
var int nCurWeaponList;
var int nCurSkillList;
var array<export editinline BTOwnerDrawCaptionButtonHK> QuickSlotBtn;
var export editinline BTTPInventoryQuickSlotHK TPQuickSlot;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() automated FloatBox fbLabelBackgrounddeco;
var int nCurSlotIndex;
var export editinline BTOwnerDrawImageHK LabelSlot;
var localized string strLabelSlot;
var BTROIncludeItemPopup IncludeItemPopup;

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
    local int i;

    super.InitComponent(MyController, myOwner);
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Store_bg, 0.1000000);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    SkipTopMenuIndex = int(TPTopMenu.1);
    TPTopMenu.Shop.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.TopMenuShop_Btn_on;
    TPTopMenu.Inventory.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.TopMenuInven_Btn_n;
    TPStore = BTTPStoreHK(NewComponent(new Class'GUIWarfareControls.BTTPStoreHK', fbTPStore));
    TPStore.TPWeapon.TcpChannel = TcpChannel;
    TPStore.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    TPStore.TabControl.SetVisiblePanel(0);
    TPStore.TPWeapon.FocusFirst(none);
    MoneyInfoObject = new Class'GUIWarfareControls.BTMoneyInfo';
    MoneyInfoObject.InitComponent(Controller, self);
    MoneyInfoObject.EnableCoupon(false);
    MoneyInfoObject.TcpChannel = TcpChannel;
    MoneyInfoObject.__deleClickChargeCash__Delegate = page_Main.ShowCashChargeWindow;
    AppendComponent(MoneyInfoObject);
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
    TPStore.TPWeapon.TPItemList.ItemList.SetItemSize(236, int(float(86) * (float(Controller.ResY) / float(768))));
    TPStore.TPWeapon.TPItemList.ItemList.SetItemCountPerPage(4, 2);
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.MyScrollBar.Step = 2;
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.MyScrollBar.ItemsPerPage = 8;
    TPQuickSlot = new Class'GUIWarfareControls.BTTPInventoryQuickSlotHK';
    TPQuickSlot.InitComponent(Controller, self);
    AppendComponent(TPQuickSlot);
    TPQuickSlot.TcpChannel = TcpChannel;
    TPQuickSlot.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    i = 0;
    J0x43F:

    // End:0x478 [Loop If]
    if(i < 2)
    {
        TPQuickSlot.btnModify[i].__OnClick__Delegate = ShowModifyWindow;
        i++;
        // [Loop Continue]
        goto J0x43F;
    }
    i = 0;
    J0x47F:

    // End:0x4B8 [Loop If]
    if(i < 4)
    {
        TPQuickSlot.ButtonTag[i].__OnClick__Delegate = TPQSClick;
        i++;
        // [Loop Continue]
        goto J0x47F;
    }
    LabelSlot = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelSlot.bUseAWinPos = true;
    LabelSlot.AWinPos.X1 = 291.0000000;
    LabelSlot.AWinPos.Y1 = 76.0000000;
    LabelSlot.AWinPos.X2 = 463.0000000;
    LabelSlot.AWinPos.Y2 = 88.0000000;
    LabelSlot.Caption = strLabelSlot;
    LabelSlot.CaptionDrawType = 3;
    LabelSlot.SetFontSizeAll(8);
    LabelSlot.SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    AppendComponent(LabelSlot);
    FillQuickSlot();
    i = 0;
    J0x5A8:

    // End:0x616 [Loop If]
    if(i < 6)
    {
        TPStore.TPWeapon.SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        TPStore.TPWeapon.SubButton[i].__OnHover__Delegate = SubButton_OnHover;
        i++;
        // [Loop Continue]
        goto J0x5A8;
    }
    i = 0;
    J0x61D:

    // End:0x64D [Loop If]
    if(i < 2)
    {
        AppendComponent(TPQuickSlot.QuickSlotState[i]);
        ++i;
        // [Loop Continue]
        goto J0x61D;
    }
    IncludeItemPopup = new Class'GUIWarfareControls.BTROIncludeItemPopup';
    IncludeItemPopup.Init();
    IncludeItemPopup.SetDefaultLimitPos(MyController);
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
    local int i;

    __NFUN_270__("BTPageStore::InternalOnOpen()");
    Log("[BTPageStore::InternalOnOpen] ");
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM.SetCurSubPos(4);
    InitializeDelegate();
    TPStore.CharacterModel.BeginModel();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPQuickSlot.QSButtonGroup.SelectButton(0);
    TPStore.CharacterModel.ChangeWeapon(TPQuickSlot.SaveQS[0].instanceInfo[0].ItemID, TPQuickSlot.SaveQS[0].instanceInfo[0].PartID, TPQuickSlot.SaveQS[0].instanceInfo[0].PaintID);
    TPStore.CharacterModel.ChangeEquipItem(GameMgr);
    // End:0x1DB
    if(GameMgr.ShopItemListCount == 0)
    {
        page_Main.TcpChannel.sfReqShopItemList();
    }
    page_Main.TcpChannel.sfReqChangeUserState(3, 0);
    currentBGM = "bgm_shop";
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    page_Main.TcpChannel.sfReqGetServerTime();
    TPQuickSlot.ShowWeaponTransparent();
    TPQuickSlot.ShowSkillTransparent();
    page_Main.CheckWebzenShopItemList();
    i = 0;
    J0x277:

    // End:0x2AD [Loop If]
    if(i < 2)
    {
        TPQuickSlot.btnModify[i].bDisable = true;
        i++;
        // [Loop Continue]
        goto J0x277;
    }
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageStore::InternalOnClose()");
    Log("[BTPageStore::InternalOnClose] ");
    TPStore.CharacterModel.EndModel();
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
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
    MoneyInfoObject.RefreshCashNPoint(GameMgr, MM);
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
    // End:0x16F
    if((TabIndex[0] == 1) && TabIndex[1] == 1)
    {
        ShowWeaponList(nCurWeaponList);        
    }
    else
    {
        // End:0x197
        if((TabIndex[0] == 3) && TabIndex[1] == 1)
        {
            ShowSkillListClick(nCurSkillList);
        }
    }
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetIndex(SelectIdx);
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(topIdx);
    TPStore.TPWeapon.SetInfoBox(SelectIdx);
    TPStore.TPWeapon.TPItemList.ItemList.LastSelectedItemIndex = SelectIdx;
    TPQuickSlot.InitializeItemInfo();
    //return;    
}

function ShowWeaponList(int nCurIdx)
{
    switch(nCurIdx)
    {
        // End:0x38
        case 0:
            TPStore.TPWeapon.TPItemList.ItemList.ShowMainWeapon();
            // End:0x137
            break;
        // End:0x69
        case 1:
            TPStore.TPWeapon.TPItemList.ItemList.ShowAR();
            // End:0x137
            break;
        // End:0x9B
        case 2:
            TPStore.TPWeapon.TPItemList.ItemList.ShowSMG();
            // End:0x137
            break;
        // End:0xCD
        case 3:
            TPStore.TPWeapon.TPItemList.ItemList.ShowSR();
            // End:0x137
            break;
        // End:0xFF
        case 4:
            TPStore.TPWeapon.TPItemList.ItemList.ShowShotgun();
            // End:0x137
            break;
        // End:0x134
        case 5:
            TPStore.TPWeapon.TPItemList.ItemList.ShowMG();
            // End:0x137
            break;
            // End:0x137
            break;
        // End:0xFFFF
        default:
            break;
    }
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

    // End:0x94 [Loop If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
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

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    local int iItemType;

    Log("[BTPageStore::rfAckBuyItemByWebzenCash] Result=" $ string(Result));
    iItemType = BTWindowItemBuyHK(Controller.TopPage()).ItemInfo.ItemType;
    // End:0x9E
    if(BTWindowItemBuyHK(Controller.TopPage()) != none)
    {
        Class'GUIWarfareControls.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls.BTWindowItemBuyHK');        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls.BTWindowItemBuyTerm');
    }
    // End:0x12D
    if(Result != 0)
    {
        // End:0x112
        if((BTWindowDefineInfoHK(Controller.TopPage()) != none) && BTWindowDefineInfoHK(Controller.TopPage()).DefineCode == 21)
        {
            Controller.CloseMenu(false);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    // End:0x1AF
    if(GameMgr.CheckSkillItem(iItemType))
    {
        page_Main.TcpChannel.sfReqUserSkillList(MM.kUID);        
    }
    else
    {
        page_Main.TcpChannel.sfReqItemList(MM.kUID);
    }
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
    ItemName = BTWindowSendPresentHK(Controller.TopPage()).ro.instanceInfo.cashItemInfo.WZItemName;
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

function ReceiveModifyWeapon(BtrDouble UniqueID, int AddPartID, int PaintID)
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    instanceInfo = GameMgr.FindInstanceItem(UniqueID);
    instanceInfo.PartID = AddPartID;
    instanceInfo.PaintID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID);
    PlayerOwner().FmodClientPlaySound(Controller.ItemAddPartsSound,,, 6);
    // End:0x135
    if(__NFUN_912__(TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0].UniqueID, instanceInfo.UniqueID))
    {
        TPStore.TPWeapon.CharacterModel.ChangeWeaponsParts(instanceInfo.PartID);
        TPStore.TPWeapon.CharacterModel.ChangeWeaponsPaints(instanceInfo.PaintID);
    }
    i = 0;
    J0x13C:

    // End:0x1AE [Loop If]
    if(i < 8)
    {
        TPQuickSlot.ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[i], TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x13C;
    }
    //return;    
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    Log("[BTPageInventory::rfAckModifyWeapon] Result=" $ string(Result));
    Controller.CloseMenu(false);
    // End:0x6F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    ReceiveModifyWeapon(UniqueID, AddPartID, PaintID);
    MM.kPoint = Point;
    // End:0xB7
    if(!UseGP20())
    {
        MM.kCash = Cash;
    }
    MM.UpdateMoneyInfo(MM);
    return true;
    //return;    
}

function bool rfAckGP20CashModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point)
{
    Log("[BTPageInventory::rfAckGP20CashModifyWeapon] Result=" $ string(Result));
    Controller.CloseMenu(false);
    // End:0x77
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    ReceiveModifyWeapon(UniqueID, AddPartID, PaintID);
    MM.kPoint = Point;
    MM.UpdateMoneyInfo(MM);
    return true;
    //return;    
}

function bool ShowModifyWindow(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x27
    if(btn.bDisable == true)
    {
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
    BTWindowModifyHK(Controller.TopPage()).SetData(TPQuickSlot.ButtonQuickSlot[btn.ButtonID].itemBox.ItemInfo, TPQuickSlot.ButtonQuickSlot[btn.ButtonID].itemBox.instanceInfo);
    BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
    return true;
    //return;    
}

function bool BTWindowModifyHK_OnOK(GUIComponent Sender)
{
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;
    local export editinline BTWindowModifyHK WinModify;
    local int i;
    local array<int> productsNo;

    WinModify = BTWindowModifyHK(Controller.TopPage());
    // End:0xA5
    if(UseGP20())
    {
        i = 0;
        J0x2A:

        // End:0x61 [Loop If]
        if(i < 5)
        {
            productsNo[productsNo.Length] = WinModify.SelectedProductNo[i];
            ++i;
            // [Loop Continue]
            goto J0x2A;
        }
        TcpChannel.sfReqGP20CashModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID(), productsNo);        
    }
    else
    {
        TcpChannel.sfReqModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID());
    }
    iSightPartID = WinModify.GetSelectedUnionedPartID() & 1023;
    iBarrelPartID = WinModify.GetSelectedUnionedPartID() & 130048;
    iSilencerPartID = WinModify.GetSelectedUnionedPartID() & 16646144;
    iGunstockPartID = WinModify.GetSelectedUnionedPartID() & 2130706432;
    iBarrelPartID = iBarrelPartID >> 10;
    iSilencerPartID = iSilencerPartID >> 17;
    iGunstockPartID = iGunstockPartID >> 24;
    Controller.ViewportOwner.Actor.clog((((((((("[sfReqModifyWeapon] : " $ string(WinModify.GetSelectedUnionedPartID())) $ " Sight:") $ string(iSightPartID)) $ " Barrel:") $ string(iBarrelPartID)) $ " Silencer:") $ string(iSilencerPartID)) $ " Gunstock:") $ string(iGunstockPartID));
    return true;
    //return;    
}

function bool TPQSClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ChangeQuickSlot(btn.ButtonID);
    return true;
    //return;    
}

function ChangeQuickSlot(int slotNum)
{
    nCurSlotIndex = slotNum;
    TPQuickSlot.ChangeQuickSlot(nCurSlotIndex, false);
    // End:0xAD
    if(TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0] == none)
    {
        TPStore.TPWeapon.CharacterModel.DeleteWeapone();
        TPStore.TPWeapon.CharacterModel.PlayAnim(TPStore.TPWeapon.CharacterModel.NoHaveWeaponIdle, 1.0000000, 0.2000000);        
    }
    else
    {
        TPStore.TPWeapon.CharacterModel.ChangeWeapon(TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0].ItemID, TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0].PartID, TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0].PaintID);
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int SelIndex;
    local RenderObject ro;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;

    CurrentCanvas = C;
    SelIndex = TPStore.TPWeapon.TPItemList.ItemList.SelectItemIndex;
    // End:0x7A
    if(SelIndex >= 0)
    {
        ro = TPStore.TPWeapon.TPItemList.ItemList.DataList[SelIndex];
    }
    // End:0x339
    if((BTROItemBoxHK(ro) != none) && BTROItemBoxHK(ro).ItemInfo != none)
    {
        ItemList = TPStore.TPWeapon.TPItemList.ItemList;
        ItemInfo = BTROItemBoxHK(ro).ItemInfo;
        instanceInfo = BTROItemBoxHK(ro).instanceInfo;
        cItemInfo = none;
        cInstanceInfo = none;
        cItemInfo = none;
        switch(ItemInfo.ItemType)
        {
            // End:0x126
            case 0:
            // End:0x12A
            case 1:
            // End:0x174
            case 2:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[0];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0];
                // End:0x20D
                break;
            // End:0x1BE
            case 3:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[1];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[1];
                // End:0x20D
                break;
            // End:0x20A
            case 4:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[2];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[2];
                // End:0x20D
                break;
            // End:0xFFFF
            default:
                break;
        }
        TPStore.TPWeapon.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        // End:0x339
        if(ro.bMouseOn)
        {
            // End:0x2E6
            if(((UseGP20()) && instanceInfo.cashItemInfo != none) && instanceInfo.cashItemInfo.bWZPackage)
            {
                IncludeItemPopup.SetDataGP20Package(ItemInfo.ItemID, GameMgr);
                IncludeItemPopup.SetPivotPos(ro.AWinPos);
                IncludeItemPopup.Render(C);                
            }
            else
            {
                IncludeItemPopup.SetBoxData(ItemInfo.ItemID, GameMgr);
                IncludeItemPopup.SetPivotPos(ro.AWinPos);
                IncludeItemPopup.Render(C);
            }
        }
    }
    super.Internal_OnRendered(C);
    //return;    
}

function bool ClickQuickSlotBtn(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPQuickSlot.QSButtonGroup.SelectButton(btn.ButtonID);
    FocusFirst(TPQuickSlot.ButtonChangeName[TPQuickSlot.QSNameGroup.GetSelectIndex()]);
    i = 0;
    J0x6A:

    // End:0xEE [Loop If]
    if(i < 8)
    {
        TPQuickSlot.ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[btn.ButtonID].ItemInfo[i], TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x6A;
    }
    TPStore.TPWeapon.CharacterModel.ChangeWeapon(TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].ItemID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PartID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PaintID);
    return true;
    //return;    
}

function FillQuickSlot()
{
    local int i;

    TPQuickSlot.FillQuickSlotData();
    i = 0;
    J0x16:

    // End:0x80 [Loop If]
    if(i < 9)
    {
        TPQuickSlot.ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[0].ItemInfo[i], TPQuickSlot.SaveQS[0].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local bool bActivePage;

    bActivePage = RecursiveActiveOwner(self);
    // End:0x19F
    if(!IsOpenPopupMenu() && bActivePage)
    {
        // End:0x143
        if((Controller.MouseX >= TPStore.TPWeapon.fbTPItemList.X1) && Controller.MouseY >= TPStore.TPWeapon.fbTPItemList.Y1)
        {
            // End:0x140
            if((Controller.MouseX <= TPStore.TPWeapon.fbTPItemList.X2) && Controller.MouseY <= TPStore.TPWeapon.fbTPItemList.Y2)
            {
                TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetFocus(TPStore.TPWeapon.TPItemList.ItemList.ImageList);
            }            
        }
        else
        {
            TPStore.TPWeapon.TPItemList.ItemList.ImageList.LoseFocus(TPStore.TPWeapon.TPItemList.ItemList.ImageList);
        }
    }
    return false;
    //return;    
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPStore.TPWeapon.TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    TPStore.TPWeapon.ChangeItemList(TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    // End:0x13C
    if((TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex() == 1) && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x13C
        if(bShowWeaponeTypeList && int(TPStore.TPWeapon.SubButton[1].MenuState) == int(4))
        {
            SetVisibleWeaponeTypeBtnList(true, false);
        }
    }
    // End:0x1C1
    if((TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex() == 3) && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x1C1
        if(bShowSkillTypeList && int(TPStore.TPWeapon.SubButton[1].MenuState) == int(4))
        {
            SetVisibleSkillTypeBtnList(true, false);
        }
    }
    return true;
    //return;    
}

function bool SubButton_OnHover(GUIComponent Sender)
{
    local int mainTab, subTab;

    mainTab = TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex();
    subTab = BTOwnerDrawCaptionButtonHK(Sender).ButtonID;
    bShowWeaponeTypeList = false;
    SetVisibleWeaponeTypeBtnList(false, false);
    bShowSkillTypeList = false;
    SetVisibleSkillTypeBtnList(false, false);
    // End:0x85
    if((mainTab == 1) && subTab == 1)
    {
        bShowWeaponeTypeList = true;        
    }
    else
    {
        // End:0xA6
        if((mainTab == 3) && subTab == 1)
        {
            bShowSkillTypeList = true;
        }
    }
    // End:0xE6
    if(bShowWeaponeTypeList && int(TPStore.TPWeapon.SubButton[1].MenuState) == int(4))
    {
        SetVisibleWeaponeTypeBtnList(true, true);
    }
    // End:0x126
    if(bShowSkillTypeList && int(TPStore.TPWeapon.SubButton[1].MenuState) == int(4))
    {
        SetVisibleSkillTypeBtnList(true, true);
    }
    return true;
    //return;    
}

function bool WeaponListClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    nCurWeaponList = btn.ButtonID;
    ShowWeaponList(nCurWeaponList);
    TPStore.TPWeapon.AddSubMenuBtns();
    SetVisibleWeaponeTypeBtnList(false, false);
    return false;
    //return;    
}

function bool SkillListClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    nCurSkillList = btn.ButtonID;
    ShowSkillListClick(nCurSkillList);
    SetVisibleSkillTypeBtnList(false, false);
    return false;
    //return;    
}

function ShowSkillListClick(int SelIndex)
{
    // End:0x38
    if(SelIndex == 0)
    {
        TPStore.TPWeapon.TPItemList.ItemList.ShowActiveSkill();        
    }
    else
    {
        TPStore.TPWeapon.TPItemList.ItemList.ShowActiveSkillOnlyOne(SelIndex);
    }
    TPStore.TPWeapon.AddSubMenuBtns();
    //return;    
}

defaultproperties
{
    fbTPStore=(X1=10.0000000,Y1=88.0000000,X2=500.0000000,Y2=736.0000000)
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    bPersistent=false
    OnOpen=BTPageStore.InternalOnOpen
    OnClose=BTPageStore.InternalOnClose
    OnPreDraw=BTPageStore.Internal_OnPreDraw
    OnKeyEvent=BTPageStore.internalKeyEvent
}