/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageStoreCN.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:47
 *
 *******************************************************************************/
class BTPageStoreCN extends BTPageStore
    editinlinenew
    instanced;

var array<export editinline BTOwnerDrawCaptionButtonHK> QuickSlotBtn;
var export editinline BTTPInventoryQuickSlotHK TPQuickSlot;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBackgrounddeco;
var export editinline BTOwnerDrawCaptionButtonHK ChargeCashBtn;
var int nCurSlotIndex;
var localized string strChargeCash;
var export editinline BTOwnerDrawImageHK LabelSlot;
var localized string strLabelSlot;

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
    local int i;

    super(BTNetGUIPageHK).InitComponent(MyController, myOwner);
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, class'BTUIResourcePoolHK'.default.Store_bg, 0.10);
    NewBackground = NewLabelComponent(fbNewBackground, class'BTUIResourcePoolHK'.default.new_Page_Thema, 0.000130);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    TPTopMenu.Shop.buttonImage[0] = class'BTUIResourcePoolHK'.default.TopMenuShop_Btn_on;
    TPTopMenu.Inventory.buttonImage[0] = class'BTUIResourcePoolHK'.default.TopMenuInven_Btn_n;
    TPStore = BTTPStoreHK(NewComponent(new class'BTTPStoreHKCN', fbTPStore));
    TPStore.TPWeapon.TcpChannel = TcpChannel;
    TPStore.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
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
    TPStore.TPWeapon.TPItemList.ItemList.SetItemSize(236, 86);
    TPStore.TPWeapon.TPItemList.ItemList.SetItemCountPerPage(4, 2);
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.MyScrollBar.Step = 2;
    TPStore.TPWeapon.TPItemList.ItemList.ImageList.MyScrollBar.ItemsPerPage = 8;
    TPQuickSlot = new class'BTTPInventoryQuickSlotHKCN';
    TPQuickSlot.InitComponent(Controller, self);
    AppendComponent(TPQuickSlot);
    i = 0;
    J0x386:
    // End:0x3bf [While If]
    if(i < 2)
    {
        TPQuickSlot.ButtonTag[i].__OnClick__Delegate = TPQSClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x386;
    }
    i = 2;
    J0x3c7:
    // End:0x3fb [While If]
    if(i < 4)
    {
        TPQuickSlot.ButtonTag[i].DisableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3c7;
    }
    ChargeCashBtn = new class'BTOwnerDrawCaptionButtonHK';
    ChargeCashBtn.bUseAWinPos = true;
    ChargeCashBtn.AWinPos.X1 = 900.0;
    ChargeCashBtn.AWinPos.Y1 = 96.0;
    ChargeCashBtn.AWinPos.X2 = 1004.0;
    ChargeCashBtn.AWinPos.Y2 = 118.0;
    ChargeCashBtn.ApplyAWinPos();
    ChargeCashBtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_n;
    ChargeCashBtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_on;
    ChargeCashBtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_n;
    ChargeCashBtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_cli;
    ChargeCashBtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_Dis;
    ChargeCashBtn.SetDefaultFontColor();
    ChargeCashBtn.SetFontSizeAll(9);
    ChargeCashBtn.Caption = strChargeCash;
    ChargeCashBtn.__OnClick__Delegate = ClickChargeCash;
    ChargeCashBtn.CaptionDrawType = 4;
    ChargeCashBtn.InitComponent(Controller, self);
    AppendComponent(ChargeCashBtn);
    RedeemCodesBtn = new class'BTOwnerDrawCaptionButtonHK';
    RedeemCodesBtn.bUseAWinPos = true;
    RedeemCodesBtn.AWinPos = fbRedeemCodesBtn;
    RedeemCodesBtn.SetFontSizeAll(9);
    RedeemCodesBtn.SetDefaultFontColor();
    RedeemCodesBtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.Billing_Btn_n;
    RedeemCodesBtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_on;
    RedeemCodesBtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_n;
    RedeemCodesBtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_cli;
    RedeemCodesBtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.Charge_Cash_Btn_Dis;
    RedeemCodesBtn.Caption = strRedeemCodesBtn;
    RedeemCodesBtn.__OnClick__Delegate = ClickRedeemCodes;
    RedeemCodesBtn.CaptionDrawType = 4;
    RedeemCodesBtn.InitComponent(Controller, self);
    AppendComponent(RedeemCodesBtn);
    LabelSlot = new class'BTOwnerDrawImageHK';
    LabelSlot.bUseAWinPos = true;
    LabelSlot.AWinPos.X1 = 291.0;
    LabelSlot.AWinPos.Y1 = 76.0;
    LabelSlot.AWinPos.X2 = 463.0;
    LabelSlot.AWinPos.Y2 = 88.0;
    LabelSlot.Caption = strLabelSlot;
    LabelSlot.CaptionDrawType = 3;
    LabelSlot.SetFontSizeAll(8);
    LabelSlot.SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    AppendComponent(LabelSlot);
    FillQuickSlot();
    i = 0;
    J0x7e0:
    // End:0x84e [While If]
    if(i < 5)
    {
        TPStore.TPWeapon.SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        TPStore.TPWeapon.SubButton[i].__OnHover__Delegate = SubButton_OnHover;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7e0;
    }
}

function bool ClickChargeCash(GUIComponent Sender)
{
    TPStore.TPWeapon.deleShowCashChargeWindow();
    return true;
}

function bool ClickRedeemCodes(GUIComponent Sender)
{
    local wGameManager GameMgr;
    local BtrDouble blockLeftTime;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x69
    if(class'BTWindowRedeemCodes'.static.ShowWindowRedeemCodes(Controller))
    {
        BTWindowRedeemCodes(Controller.TopPage()).__deleSendCodes__Delegate = SendCodes;
    }
    return true;
}

function SendCodes(string codes)
{
    Log("sfReqCouponUse(" $ codes $ ")");
    TcpChannel.sfReqCouponUse(codes);
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
    J0x7e:
    // End:0x107 [While If]
    if(i < 8)
    {
        BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[btn.ButtonID].ItemInfo[i], TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
    // End:0x19d
    if(TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0] == none)
    {
        TPStore.TPWeapon.CharacterModel.DeleteWeapone();
        TPStore.TPWeapon.CharacterModel.PlayAnim(TPStore.TPWeapon.CharacterModel.NoHaveWeaponIdle, 1.0, 0.20);
    }
    // End:0x245
    else
    {
        TPStore.TPWeapon.CharacterModel.ChangeWeapon(TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].ItemID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PartID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PaintID);
    }
    TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[3].itemBox);
    TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPQuickSlot).ButtonQuickSlot[7].itemBox);
    return true;
}

function InternalOnRendered(Canvas C)
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
    // End:0x47
    if(SelIndex < 0)
    {
        return;
    }
    ro = TPStore.TPWeapon.TPItemList.ItemList.DataList[SelIndex];
    // End:0x244
    if(BTROItemBoxHK(ro) != none && BTROItemBoxHK(ro).ItemInfo != none)
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
            // End:0x12c
            case 1:
            // End:0x176
            case 2:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[0];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[0];
                // End:0x20f
                break;
            // End:0x1c0
            case 3:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[1];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[1];
                // End:0x20f
                break;
            // End:0x20c
            case 4:
                cItemInfo = TPQuickSlot.SaveQS[nCurSlotIndex].ItemInfo[2];
                cInstanceInfo = TPQuickSlot.SaveQS[nCurSlotIndex].instanceInfo[2];
                // End:0x20f
                break;
            // End:0xffff
            default:
                TPStore.TPWeapon.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
            }
}

function bool ClickQuickSlotBtn(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPQuickSlot.QSButtonGroup.SelectButton(btn.ButtonID);
    FocusFirst(TPQuickSlot.ButtonChangeName[TPQuickSlot.QSNameGroup.GetSelectIndex()]);
    i = 0;
    J0x6a:
    // End:0xee [While If]
    if(i < 8)
    {
        TPQuickSlot.ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[btn.ButtonID].ItemInfo[i], TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6a;
    }
    TPStore.TPWeapon.CharacterModel.ChangeWeapon(TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].ItemID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PartID, TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[0].PaintID);
    return true;
}

function FillQuickSlot()
{
    local int i, j;
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK ItemInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPQuickSlot.SaveQS.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x55:
    // End:0x10e [While If]
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x55;
    }
    i = 14;
    J0x116:
    // End:0x1d7 [While If]
    if(i < 18)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x1cd
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x1cd
            if(ItemInfo != none)
            {
                TPQuickSlot.SaveQS[0].ItemInfo[i - 10] = ItemInfo;
                TPQuickSlot.SaveQS[0].instanceInfo[i - 10] = instanceInfo;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x116;
    }
    j = 0;
    J0x1de:
    // End:0x37d [While If]
    if(j < 3)
    {
        i = 0;
        J0x1f1:
        // End:0x373 [While If]
        if(i < GameMgr.QuickSlotBoxList.Length - 1)
        {
            TPQuickSlot.SaveQS[j + 1].ItemInfo[i] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].ItemID[i]);
            TPQuickSlot.SaveQS[j + 1].instanceInfo[i] = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[j].UniqueID[i]);
            TPQuickSlot.SaveQS[j + 1].ItemInfo[i + 4] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].SkillID[i]);
            TPQuickSlot.SaveQS[j + 1].instanceInfo[i + 4] = GameMgr.FindInstanceSkillItem(GameMgr.QuickSlotBoxList[j].UniqueSkillID[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1f1;
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x1de;
    }
    i = 0;
    J0x384:
    // End:0x3ee [While If]
    if(i < 8)
    {
        TPQuickSlot.ButtonQuickSlot[i].SetData(TPQuickSlot.SaveQS[0].ItemInfo[i], TPQuickSlot.SaveQS[0].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x384;
    }
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
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = class'BTUIColorPoolHK'.static.Cash();
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new class'BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = class'BTUIColorPoolHK'.static.Point();
    LabelPoint.InitComponent(Controller, self);
    AppendComponent(LabelPoint);
    LabelCCoinCash = new class'BTOwnerDrawImageHK';
    LabelCCoinCash.bUseAWinPos = true;
    LabelCCoinCash.AWinPos = fbLabelCCoinCash;
    LabelCCoinCash.SetFontSizeAll(10);
    LabelCCoinCash.FontColor[0] = class'BTUIColorPoolHK'.static.Cash();
    LabelCCoinCash.InitComponent(Controller, self);
    AppendComponent(LabelCCoinCash);
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

function bool BTWindowDefineARHK_24_OnOK(GUIComponent Sender)
{
    Log("[BTPageStore::BTWindowDefineARHK_24_OnOK] ");
    Controller.CloseMenu(false);
    page_Main.rMM.kFirstIntoInventory = false;
    page_Main.SetPage(22, true);
    return true;
}

function InternalOnOpen()
{
    UnresolvedNativeFunction_97("BTPageStore::InternalOnOpen()");
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
    // End:0x1db
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
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageStore::InternalOnClose()");
    Log("[BTPageStore::InternalOnClose] ");
    TPStore.CharacterModel.EndModel();
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
    UnInitializeDelegate();
    OnClose(bCanceled);
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    return false;
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
    // End:0x94 [While If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
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
    local int iItemType;

    Log("[BTPageStore::rfAckBuyItemByWebzenCash] Result=" $ string(Result));
    iItemType = BTWindowItemBuyHK(Controller.TopPage()).ItemInfo.ItemType;
    // End:0x9e
    if(BTWindowItemBuyHK(Controller.TopPage()) != none)
    {
        class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowItemBuyHK');
    }
    // End:0xb7
    else
    {
        class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowItemBuyTerm');
    }
    // End:0x12d
    if(Result != 0)
    {
        // End:0x112
        if(BTWindowDefineInfoHK(Controller.TopPage()) != none && BTWindowDefineInfoHK(Controller.TopPage()).DefineCode == 21)
        {
            Controller.CloseMenu(false);
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Log("page_Main.TcpChannel.sfReqWebzenCash()");
    page_Main.TcpChannel.sfReqWebzenCash();
    // End:0x1af
    if(GameMgr.CheckSkillItem(iItemType))
    {
        page_Main.TcpChannel.sfReqUserSkillList(MM.kUID);
    }
    // End:0x1d5
    else
    {
        page_Main.TcpChannel.sfReqItemList(MM.kUID);
    }
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

function bool Internal_OnPreDraw(Canvas C)
{
    local bool bActivePage;

    bActivePage = RecursiveActiveOwner(self);
    // End:0x1a9
    if(WeaponListBg.bVisible == false && bActivePage)
    {
        // End:0x14d
        if(Controller.MouseX >= TPStore.TPWeapon.fbTPItemList.X1 && Controller.MouseY >= TPStore.TPWeapon.fbTPItemList.Y1)
        {
            // End:0x14a
            if(Controller.MouseX <= TPStore.TPWeapon.fbTPItemList.X2 && Controller.MouseY <= TPStore.TPWeapon.fbTPItemList.Y2)
            {
                TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetFocus(TPStore.TPWeapon.TPItemList.ItemList.ImageList);
            }
        }
        // End:0x1a9
        else
        {
            TPStore.TPWeapon.TPItemList.ItemList.ImageList.LoseFocus(TPStore.TPWeapon.TPItemList.ItemList.ImageList);
        }
    }
    return false;
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    local int i;

    TPStore.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPStore.TPWeapon.TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    TPStore.TPWeapon.ChangeItemList(TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    // End:0x17d
    if(TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex() == 1 && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x17d
        if(bShowWeaponeTypeList && TPStore.TPWeapon.SubButton[1].MenuState == 4)
        {
            i = 0;
            J0x13b:
            // End:0x16c [While If]
            if(i < WeaponeTypeBtnList.Length)
            {
                WeaponeTypeBtnList[i].bVisible = true;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x13b;
            }
            WeaponListBg.bVisible = true;
        }
    }
    return true;
}

function bool SubButton_OnHover(GUIComponent Sender)
{
    local int mainTab, subTab, i;

    mainTab = TPStore.TPWeapon.TabControl[0].GetCurrentTabIndex();
    subTab = BTOwnerDrawCaptionButtonHK(Sender).ButtonID;
    bShowWeaponeTypeList = false;
    i = 0;
    J0x51:
    // End:0x82 [While If]
    if(i < WeaponeTypeBtnList.Length)
    {
        WeaponeTypeBtnList[i].bVisible = false;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
    WeaponListBg.bVisible = false;
    // End:0xc6
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0xac
            case 0:
                // End:0xc6
                break;
            // End:0xbb
            case 1:
                bShowWeaponeTypeList = true;
                // End:0xc6
                break;
            // End:0xc3
            case 2:
                // End:0xc6
                break;
            // End:0xffff
            default:
            }
            // End:0x167
            if(bShowWeaponeTypeList && TPStore.TPWeapon.SubButton[1].MenuState == 4)
            {
                i = 0;
                J0x105:
                // End:0x156 [While If]
                if(i < WeaponeTypeBtnList.Length)
                {
                    WeaponeTypeBtnList[i].bVisible = true;
                    WeaponeTypeBtnList[i].SetFocus(WeaponeTypeBtnList[i]);
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x105;
                }
                WeaponListBg.bVisible = true;
            }
            return true;
}

function bool WeaponListClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x51
        case 0:
            TPStore.TPWeapon.TPItemList.ItemList.ShowWeaponAll();
            // End:0x150
            break;
        // End:0x82
        case 1:
            TPStore.TPWeapon.TPItemList.ItemList.ShowAR();
            // End:0x150
            break;
        // End:0xb4
        case 2:
            TPStore.TPWeapon.TPItemList.ItemList.ShowSMG();
            // End:0x150
            break;
        // End:0xe6
        case 3:
            TPStore.TPWeapon.TPItemList.ItemList.ShowSR();
            // End:0x150
            break;
        // End:0x118
        case 4:
            TPStore.TPWeapon.TPItemList.ItemList.ShowShotgun();
            // End:0x150
            break;
        // End:0x14d
        case 5:
            TPStore.TPWeapon.TPItemList.ItemList.ShowMG();
            // End:0x150
            break;
            // End:0x150
            break;
        // End:0xffff
        default:
            i = 0;
            J0x157:
            // End:0x188 [While If]
            if(i < WeaponeTypeBtnList.Length)
            {
                WeaponeTypeBtnList[i].bVisible = false;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x157;
            }
            WeaponListBg.bVisible = false;
            return false;
    }
}

defaultproperties
{
    fbLabelBackgrounddeco=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    strChargeCash="Buy W Coins"
    strLabelSlot="Quick Slot"
    fbLabelPoint=(X1=517.0,Y1=94.0,X2=644.0,Y2=114.0)
    fbLabelCash=(X1=771.0,Y1=94.0,X2=898.0,Y2=114.0)
    fbLabelCCoinCash=(X1=644.0,Y1=94.0,X2=771.0,Y2=114.0)
    fbRedeemCodesBtn=(X1=900.0,Y1=74.0,X2=1004.0,Y2=96.0)
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnPreDraw=Internal_OnPreDraw
    OnRendered=InternalOnRendered
    OnKeyEvent=internalKeyEvent
}