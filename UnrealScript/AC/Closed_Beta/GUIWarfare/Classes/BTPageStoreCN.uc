class BTPageStoreCN extends BTPageStore
    editinlinenew
    instanced;

var array<export editinline BTOwnerDrawCaptionButtonHK> QuickSlotBtn;
var export editinline BTTPInventoryQuickSlotHK TPQuickSlot;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() automated FloatBox fbLabelBackgrounddeco;
var export editinline BTOwnerDrawCaptionButtonHK ChargeCashBtn;
var int nCurSlotIndex;
var localized string strChargeCash;

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x39
        case 0:
            page_Main.SetPage(23, true);
            // End:0x17E
            break;
        // End:0x52
        case 1:
            page_Main.SetPage(20, true);
            // End:0x17E
            break;
        // End:0x6C
        case 3:
            page_Main.SetPage(22, true);
            // End:0x17E
            break;
        // End:0x86
        case 4:
            page_Main.SetPage(18, true);
            // End:0x17E
            break;
        // End:0x8E
        case 5:
            // End:0x17E
            break;
        // End:0x96
        case 6:
            // End:0x17E
            break;
        // End:0x9E
        case 7:
            // End:0x17E
            break;
        // End:0xB5
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x17E
            break;
        // End:0xF1
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x17E
            break;
        // End:0x138
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x17E
            break;
        // End:0x17B
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x17E
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
    local int i;

    super(BTNetGUIPageHK).InitComponent(MyController, myOwner);
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Store_bg, 0.1000000);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    TPStore = BTTPStoreHK(NewComponent(new Class'GUIWarfareControls.BTTPStoreHKCN', fbTPStore));
    TPStore.TPWeapon.TcpChannel = TcpChannel;
    TPStore.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
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
    TPStore.TPWeapon.TPItemList.ItemList.SetItemSize(236, 86);
    TPStore.TPWeapon.TPItemList.ItemList.SetItemCountPerPage(4, 2);
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.MyScrollBar.Step = 2;
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.MyScrollBar.ItemsPerPage = 8;
    TPQuickSlot = new Class'GUIWarfareControls.BTTPInventoryQuickSlotHKCN';
    TPQuickSlot.InitComponent(Controller, self);
    AppendComponent(TPQuickSlot);
    i = 0;
    J0x336:

    // End:0x36F [Loop If]
    if(i < 4)
    {
        TPQuickSlot.ButtonTag[i].__OnClick__Delegate = TPQSClick;
        i++;
        // [Loop Continue]
        goto J0x336;
    }
    ChargeCashBtn = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
    ChargeCashBtn.bUseAWinPos = true;
    ChargeCashBtn.AWinPos.X1 = 908.0000000;
    ChargeCashBtn.AWinPos.Y1 = 164.0000000;
    ChargeCashBtn.AWinPos.X2 = 1012.0000000;
    ChargeCashBtn.AWinPos.Y2 = 192.0000000;
    ChargeCashBtn.ApplyAWinPos();
    ChargeCashBtn.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Charge_Cash_Btn_n;
    ChargeCashBtn.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Charge_Cash_Btn_on;
    ChargeCashBtn.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Charge_Cash_Btn_n;
    ChargeCashBtn.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Charge_Cash_Btn_cli;
    ChargeCashBtn.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Charge_Cash_Btn_Dis;
    ChargeCashBtn.SetDefaultFontColor();
    ChargeCashBtn.SetFontSizeAll(9);
    ChargeCashBtn.Caption = strChargeCash;
    ChargeCashBtn.__OnClick__Delegate = ClickChargeCash;
    ChargeCashBtn.CaptionDrawType = 4;
    ChargeCashBtn.InitComponent(Controller, self);
    AppendComponent(ChargeCashBtn);
    FillQuickSlot();
    //return;    
}

function bool ClickChargeCash(GUIComponent Sender)
{
    TPStore.TPWeapon.deleShowCashChargeWindow();
    return true;
    //return;    
}

function bool TPQSClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPQuickSlot.QSButtonGroup.SelectButton(btn.ButtonID);
    FocusFirst(TPQuickSlot.ButtonChangeName[TPQuickSlot.QSNameGroup.GetSelectIndex()]);
    nCurSlotIndex = btn.ButtonID;
    i = 0;
    J0x7E:

    // End:0x107 [Loop If]
    if(i < 8)
    {
        BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[btn.ButtonID].ItemInfo[i], TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x7E;
    }
    // End:0x19D
    if(TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0] == none)
    {
        TPStore.TPWeapon.CharacterModel.DeleteWeapone();
        TPStore.TPWeapon.CharacterModel.PlayAnim(TPStore.TPWeapon.CharacterModel.NoHaveWeaponIdle, 1.0000000, 0.2000000);        
    }
    else
    {
        TPStore.TPWeapon.CharacterModel.ChangeWeapon(TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].ItemID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PartID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PaintID);
    }
    TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[3].itemBox);
    TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[7].itemBox);
    return true;
    //return;    
}

function InternalOnRendered(Canvas C)
{
    local int i, nIndex, j, SelIndex;
    local RenderObject ro;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local BTItemListMenuBtn temp;
    local array<BtrDouble> rilist;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wGameManager GameMgr;
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;

    CurrentCanvas = C;
    SelIndex = TPStore.TPWeapon.TPItemList.ItemList.SelectItemIndex;
    // End:0x47
    if(SelIndex < 0)
    {
        return;
    }
    ro = TPStore.TPWeapon.TPItemList.ItemList.DataList[SelIndex];
    // End:0x244
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
            // End:0x128
            case 0:
            // End:0x12C
            case 1:
            // End:0x176
            case 2:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[0];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0];
                // End:0x20F
                break;
            // End:0x1C0
            case 3:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[1];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[1];
                // End:0x20F
                break;
            // End:0x20C
            case 4:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[2];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[2];
                // End:0x20F
                break;
            // End:0xFFFF
            default:
                break;
        }
        TPStore.TPWeapon.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
    }
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
    local int i, j;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK ItemInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPQuickSlot.SaveQS.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x55:

    // End:0x10E [Loop If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x104
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x104
            if(ItemInfo != none)
            {
                TPQuickSlot.SaveQS[0].ItemInfo[i] = ItemInfo;
                TPQuickSlot.SaveQS[0].instanceInfo[i] = instanceInfo;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x55;
    }
    i = 14;
    J0x116:

    // End:0x1D7 [Loop If]
    if(i < 18)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x1CD
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x1CD
            if(ItemInfo != none)
            {
                TPQuickSlot.SaveQS[0].ItemInfo[i - 10] = ItemInfo;
                TPQuickSlot.SaveQS[0].instanceInfo[i - 10] = instanceInfo;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x116;
    }
    j = 0;
    J0x1DE:

    // End:0x37D [Loop If]
    if(j < 3)
    {
        i = 0;
        J0x1F1:

        // End:0x373 [Loop If]
        if(i < (GameMgr.QuickSlotBoxList.Length - 1))
        {
            TPQuickSlot.SaveQS[j + 1].ItemInfo[i] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].ItemID[i]);
            TPQuickSlot.SaveQS[j + 1].instanceInfo[i] = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[j].UniqueID[i]);
            TPQuickSlot.SaveQS[j + 1].ItemInfo[i + 4] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].SkillID[i]);
            TPQuickSlot.SaveQS[j + 1].instanceInfo[i + 4] = GameMgr.FindInstanceSkillItem(GameMgr.QuickSlotBoxList[j].UniqueSkillID[i]);
            i++;
            // [Loop Continue]
            goto J0x1F1;
        }
        j++;
        // [Loop Continue]
        goto J0x1DE;
    }
    i = 0;
    J0x384:

    // End:0x3EE [Loop If]
    if(i < 8)
    {
        TPQuickSlot.ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[0].ItemInfo[i], TPQuickSlot.SaveQS[0].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x384;
    }
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
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = Class'GUIWarfareControls.BTUIColorPoolHK'.static.Cash();
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = Class'GUIWarfareControls.BTUIColorPoolHK'.static.Point();
    LabelPoint.InitComponent(Controller, self);
    AppendComponent(LabelPoint);
    LabelC = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelC.bUseAWinPos = true;
    LabelC.AWinPos = fbLabelC;
    LabelC.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_img_cash;
    LabelC.InitComponent(Controller, self);
    AppendComponent(LabelC);
    LabelP = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelP.bUseAWinPos = true;
    LabelP.AWinPos = fbLabelP;
    LabelP.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_img_point;
    LabelP.InitComponent(Controller, self);
    AppendComponent(LabelP);
    //return;    
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    local int i;

    Log("[BTPageStore::UpdateMoneyInfo]");
    RefreshCashNPoint();
    i = 0;
    J0x2F:

    // End:0xE6 [Loop If]
    if(i < Controller.MenuStack.Length)
    {
        // End:0xDC
        if(BTWindowItemBuyHK(Controller.MenuStack[i]) != none)
        {
            BTWindowItemBuyHK(Controller.MenuStack[i]).SetMoneyInfo(TPStore.TPWeapon.TPItemList.MyData.MyPoint, TPStore.TPWeapon.TPItemList.MyData.MyCash);
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

function bool BTWindowDefineARHK_24_OnOK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineARHK_24_OnOK] ");
    Controller.CloseMenu(false);
    page_Main.rMM.kFirstIntoInventory = false;
    page_Main.SetPage(22, true);
    return true;
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
    TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[3].itemBox);
    TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[7].itemBox);
    page_Main.CheckWebzenShopItemList();
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
    LabelPoint.Caption = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(125, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));
    LabelCash.Caption = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
    TPStore.TPWeapon.TPItemList.MyData.myLevel = MM.kLevel;
    TPStore.TPWeapon.TPItemList.MyData.MyPoint = MM.kPoint;
    TPStore.TPWeapon.TPItemList.MyData.MyCash = MM.kCash;
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
    local string ClanName, URL, Intro, Keyword;
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
    local BtrTime t, t2;
    local wMyPlayerStatus MyStatus;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

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
    // End:0xDD
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    // End:0x154
    if(iItemType == 22)
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

defaultproperties
{
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    strChargeCash="Buy Cash"
    fbLabelPoint=(X1=691.0000000,Y1=97.0000000,X2=826.0000000,Y2=110.0000000)
    fbLabelCash=(X1=871.0000000,Y1=97.0000000,X2=1006.0000000,Y2=110.0000000)
    fbLabelP=(X1=669.0000000,Y1=95.0000000,X2=686.0000000,Y2=112.0000000)
    fbLabelC=(X1=849.0000000,Y1=95.0000000,X2=866.0000000,Y2=112.0000000)
    OnOpen=BTPageStoreCN.InternalOnOpen
    OnClose=BTPageStoreCN.InternalOnClose
    OnPreDraw=BTPageStoreCN.Internal_OnPreDraw
    OnRendered=BTPageStoreCN.InternalOnRendered
    OnKeyEvent=BTPageStoreCN.internalKeyEvent
}