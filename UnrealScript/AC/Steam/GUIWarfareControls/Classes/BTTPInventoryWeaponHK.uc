/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPInventoryWeaponHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:59
 *	Functions:51
 *
 *******************************************************************************/
class BTTPInventoryWeaponHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var BTROItemBoxHK DragItemBox;
var DragObject DragBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups InvenGroup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonWeapon[11];
var localized string strButtonWeapon[11];
var export editinline BTItemBoxButtonHK ButtonWeapon[11];
var export editinline BTOwnerDrawCaptionButtonHK ButtonAF;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRSA;
var bool bLRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLR;
var bool bRRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRR;
var export editinline BTOwnerDrawImageHK EdgeLine;
var export editinline BTOwnerDrawImageHK AFTeamBG;
var export editinline BTOwnerDrawImageHK RSATeamBG;
var bool bVisibleAFModel;
var localized string strAF;
var localized string strRSA;
var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var export editinline BTAutoScrollListHK ChatBox;
var int SaveMainTab;
var int SaveSubTab;
var localized string strMainMenu[5];
var localized string strSubMenuAll[3];
var localized string strSubMenuWeapon[4];
var localized string strSubMenuEquip[5];
var localized string strSubMenuSpecial[4];
var localized string strSubMenuCash[2];
var array<string> astrSubMenuAll;
var array<string> astrSubMenuWeapon;
var array<string> astrSubMenuEquip;
var array<string> astrSubMenuSpecial;
var array<string> astrSubMenuCash;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[5];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[7];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMenuButton;
var export editinline BTOwnerDrawCaptionButtonHK MenuButton;
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int CurrentRepairMode;
var int EquipItemCount;
var array<BtrDouble> EquipItemList;
var array<BtrDouble> InvenItemList;
var array<string> Equip_DamegeItemNames;
var array<string> Inven_DamegeItemNames;
var localized string strCash;
var array<export editinline BTOwnerDrawImageHK> SlotNum;
var export editinline BTOwnerDrawImageHK SlotTemp;
var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;
var delegate<dele_StopWebzenWebzenInvenList> __dele_StopWebzenWebzenInvenList__Delegate;
var delegate<dele_sfReqWebzenInvenList> __dele_sfReqWebzenInvenList__Delegate;

delegate deleShowCashChargeWindow();
function bool Internal_OnPreDraw(Canvas C)
{
    ChangeVisibleModel(bVisibleAFModel);
    // End:0x2b
    if(CharacterModel != none)
    {
        UIModel.cModel = CharacterModel;
    }
    // End:0x46
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();
    }
    // End:0x5e
    else
    {
        // End:0x5e
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
}

function Internal_OnRendered(Canvas C)
{
    CurrentCanvas = C;
    // End:0x60
    if(DragBox.IsDragging())
    {
        DragBox.UpdateMousePos(int(Controller.MouseX), int(Controller.MouseY));
        DragBox.Render(C);
    }
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(true);
    CharacterModel.ChangeTeam(0);
    return true;
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(false);
    CharacterModel.ChangeTeam(1);
    return true;
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool ImageListBox_OnDblClick(GUIComponent Sender)
{
    // End:0x35
    if(TPItemList.ItemList.SelectItemIndex != TPItemList.ItemList.LastSelectedItemIndex)
    {
        return true;
    }
    // End:0x76
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseOn == false)
    {
        return true;
    }
    return true;
}

function UpdateServerTime(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < 11)
    {
        ButtonWeapon[i].itemBox.UpdateTime(D);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    self.TPItemList.UpdateServerTime(D);
}

function SelectItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, optional bool bHoldcItemInfo)
{
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    cItemInfo = none;
    cInstanceInfo = none;
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    // End:0x41
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseOn == false)
    {
        return true;
    }
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    SelectItem(ItemInfo, instanceInfo);
    return true;
}

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    TPItemList.ItemList.LastSelectedItemIndex = TPItemList.ItemList.SelectItemIndex;
    // End:0x162
    if(Sender.bDropSource == true && DragBox.IsDragging() == false && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragItemBox.AWinPos = Box.AWinPos;
        DragItemBox.ItemInfo = Box.ItemInfo;
        DragItemBox.instanceInfo = Box.instanceInfo;
        DragItemBox.Update();
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), DragItemBox);
        return true;
    }
    return false;
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    SelectItem(BTROItemBoxHK(DragBox.GetRenderObject()).ItemInfo, BTROItemBoxHK(DragBox.GetRenderObject()).instanceInfo, true);
    DragBox.EndDrag();
}

function bool ButtonWeapon_OnBeginDrag(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    Log("ButtonWeapon_OnBeginDrag");
    btn = BTItemBoxButtonHK(Sender);
    // End:0x13c
    if(btn.bDropSource == true && DragBox.IsDragging() == false && btn.itemBox.ItemInfo != none)
    {
        DragItemBox.AWinPos = btn.itemBox.AWinPos;
        DragItemBox.ItemInfo = btn.itemBox.ItemInfo;
        DragItemBox.instanceInfo = btn.itemBox.instanceInfo;
        DragItemBox.Update();
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), DragItemBox, btn.ButtonID);
        return true;
    }
    return false;
}

function ButtonWeapon_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ButtonWeapon_OnEndDrag" @ string(Sender));
    // End:0x49
    if(Sender.Class == class'BTItemBoxButtonHK')
    {
        ButtonWeapon_OnClick(Sender);
    }
    // End:0x69
    else
    {
        // End:0x69
        if(Sender != none)
        {
            UnequipItem(DragBox.GetOptionalIndex());
        }
    }
    DragBox.EndDrag();
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    InvenGroup.SelectButton(btn.ButtonID);
    SelectItem(ButtonWeapon[btn.ButtonID].itemBox.ItemInfo, ButtonWeapon[btn.ButtonID].itemBox.instanceInfo, true);
    return true;
}

function bool ButtonWeapon_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipItem(btn.ButtonID);
    return true;
}

function bool BTWindowModifyHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowModifyHK WinModify;

    WinModify = BTWindowModifyHK(Controller.FindMenuByClass(class'BTWindowModifyHK'));
    TcpChannel.sfReqModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID());
    return true;
}

function bool BTWindowItemRenew_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemRenew BTWindow;
    local wItemBoxHK ib;
    local wItemBoxCashHK cii;
    local array<int> temp;
    local wMatchMaker MM;
    local wGameManager GameMgr;
    local int ProductNo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    BTWindow = BTWindowItemRenew(Controller.TopPage());
    ib = BTWindow.ro.ItemInfo;
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    // End:0x12e
    if(BTWindow.ro.ItemInfo.CostType == 0 || cii != none && cii.bWZCanBuy == false)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 203);
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x177
    if(MM.kLevel < ib.EquipLevel)
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 207);
        return true;
    }
    // End:0x262
    if(BTWindow.ItemInfo.IsCashItem() == true)
    {
        // End:0x25f
        if(BTWindow.cashType == 0 && MM.kCash - cii.WZCashPrice[BTWindow.OptionDay - 1] < 0 || BTWindow.cashType == 1 && MM.kCCoinCash - cii.WZCashPrice[BTWindow.OptionDay - 1] < 0)
        {
            Controller.CloseMenu(false);
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 209);
            return true;
        }
    }
    // End:0x2cb
    else
    {
        // End:0x2cb
        if(MM.kPoint - BTWindow.ItemInfo.PointPrice[BTWindow.OptionDay - 1] < 0)
        {
            Controller.CloseMenu(false);
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 208);
            return true;
        }
    }
    // End:0x3fe
    if(cii != none)
    {
        // End:0x3fb
        if(BTWindow.ItemInfo.CostType == 1 || BTWindow.ItemInfo.CostType == 4)
        {
            GetCashItemInfo(temp, ib, cii);
            ProductNo = GameMgr.GetGP20ProductNo(BTWindow.ItemID, cii.WZCashPrice[BTWindow.OptionDay - 1], BTWindow.cashType);
            // End:0x3fb
            if(ProductNo != -1)
            {
                Log("sfReqBuyItemByWebzenCashGP20(" $ string(ProductNo) $ "," $ string(BTWindow.cashType));
                TcpChannel.sfReqBuyItemByWebzenCashGP20(ProductNo, BTWindow.cashType, BTWindow.UniqueID);
            }
        }
    }
    // End:0x499
    else
    {
        Log("sfReqBuyShopItem(" $ string(BTWindow.ItemID));
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade);
        TcpChannel.sfReqBuyShopItem(BTWindow.ItemID, BTWindow.UniqueID, BTWindow.OptionDay, 2);
    }
    Controller.CloseMenu(false);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 200, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowItemRenew_OnTimeOut;
    return true;
}

function BTWindowItemRenew_OnTimeOut(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    class'BTWindowErrorDefineHK'.static.ShowError(Controller, 178);
}

function GetCashItemInfo(out array<int> temp, wItemBoxHK ib, wItemBoxCashHK cii)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    temp.Length = 1;
    temp[0] = ib.ItemID;
    MM.SetLastBuyItemInfo(cii.WZItemName, ib.ItemType, ib.Grade);
}

function bool BTWindowItemRenew_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    deleShowCashChargeWindow();
    return true;
}

function bool BTWindowDefineSelectHK_IsQuickSlotItem(GUIComponent Sender)
{
    Log("[BTTPInventoryWeaponHK::BTWindowDefineSelectHK_IsQuickSlotItem]");
    Controller.CloseMenu(false);
    // End:0xbc
    if(UnresolvedNativeFunction_99(InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 0))
    {
        TcpChannel.sfReqSellShopItemInfo(InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 1);
    }
    return true;
}

function bool MenuButton_OnClick(GUIComponent Sender)
{
    local int i, j, k;
    local BtrDouble UniqueID;
    local BTROItemBoxHK ro;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local array<BtrDouble> rilist;
    local wGameManager GameMgr;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = InfoBox.ItemBoxView.itemBox;
    // End:0xb4
    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ro.ItemInfo.ItemName);
        return true;
    }
    switch(btn.ButtonID)
    {
        // End:0x18e
        case 0:
            // End:0x164
            if(UnresolvedNativeFunction_99(ro.instanceInfo.UniqueID, 0) && GameMgr.IsQuickSlotBoxItem(ro.instanceInfo.UniqueID))
            {
                class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 20, ro.ItemInfo.ItemName);
                BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_IsQuickSlotItem;
            }
            // End:0x18b
            else
            {
                TcpChannel.sfReqSellShopItemInfo(ro.instanceInfo.UniqueID, 1);
            }
            // End:0x827
            break;
        // End:0x226
        case 1:
            Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
            BTWindowModifyHK(Controller.TopPage()).SetData(ro.ItemInfo, ro.instanceInfo);
            BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
            // End:0x827
            break;
        // End:0x7d9
        case 2:
            CurrentRepairMode = 2;
            EquipItemCount = 0;
            EquipItemList.Length = 0;
            InvenItemList.Length = 0;
            Equip_DamegeItemNames.Length = 0;
            Inven_DamegeItemNames.Length = 0;
            i = 0;
            J0x261:
            // End:0x40a [While If]
            if(i < 11)
            {
                ro = ButtonWeapon[i].itemBox;
                // End:0x400
                if(ro != none && ro.instanceInfo != none && ro.ItemInfo.CostType == 0)
                {
                    // End:0x400
                    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                    {
                        rilist.Length = rilist.Length + 1;
                        rilist[rilist.Length - 1] = ro.instanceInfo.UniqueID;
                        EquipItemList.Length = EquipItemList.Length + 1;
                        EquipItemList[EquipItemList.Length - 1] = ro.instanceInfo.UniqueID;
                        ++ EquipItemCount;
                        InvenItemList.Length = InvenItemList.Length + 1;
                        InvenItemList[InvenItemList.Length - 1] = ro.instanceInfo.UniqueID;
                        // End:0x400
                        if(ro.instanceInfo.DamageDegree >= 80000)
                        {
                            Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ro.ItemName.Text;
                            Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x261;
            }
            i = 0;
            J0x411:
            // End:0x61e [While If]
            if(i < GameMgr.QuickSlotBoxList.Length)
            {
                j = 0;
                J0x431:
                // End:0x614 [While If]
                if(j < 4)
                {
                    UniqueID = GameMgr.QuickSlotBoxList[i].UniqueID[j];
                    // End:0x60a
                    if(UnresolvedNativeFunction_99(UniqueID, EmptyBtrDouble()) && GameMgr.IsBlockedItemIdx(UniqueID) == false)
                    {
                        ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
                        // End:0x4e2
                        if(ItemInfo.CostType != 0)
                        {
                        }
                        // End:0x60a
                        else
                        {
                            instanceInfo = GameMgr.FindInstanceItem(UniqueID);
                            k = 0;
                            J0x503:
                            // End:0x536 [While If]
                            if(k < rilist.Length)
                            {
                                // End:0x52c
                                if(UnresolvedNativeFunction_99(rilist[k], UniqueID))
                                {
                                }
                                // End:0x536
                                else
                                {
                                    ++ k;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x503;
                                }
                            }
                            // End:0x60a
                            if(k == rilist.Length)
                            {
                                rilist.Length = rilist.Length + 1;
                                rilist[rilist.Length - 1] = UniqueID;
                                EquipItemList.Length = EquipItemList.Length + 1;
                                EquipItemList[EquipItemList.Length - 1] = UniqueID;
                                ++ EquipItemCount;
                                InvenItemList.Length = InvenItemList.Length + 1;
                                InvenItemList[InvenItemList.Length - 1] = UniqueID;
                                // End:0x60a
                                if(instanceInfo.DamageDegree >= 80000)
                                {
                                    Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ItemInfo.ItemName;
                                    Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ItemInfo.ItemName;
                                }
                            }
                        }
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x431;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x411;
            }
            i = 0;
            J0x625:
            // End:0x7c2 [While If]
            if(i < TPItemList.ItemList.DataPool.Length)
            {
                ro = TPItemList.ItemList.DataPool[i];
                // End:0x7b8
                if(ro.ItemInfo.CostType == 0 && GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                {
                    UniqueID = ro.instanceInfo.UniqueID;
                    // End:0x7b8
                    if(UnresolvedNativeFunction_99(UniqueID, EmptyBtrDouble()))
                    {
                        k = 0;
                        J0x6ea:
                        // End:0x71d [While If]
                        if(k < rilist.Length)
                        {
                            // End:0x713
                            if(UnresolvedNativeFunction_99(rilist[k], UniqueID))
                            {
                            }
                            // End:0x71d
                            else
                            {
                                ++ k;
                                // This is an implied JumpToken; Continue!
                                goto J0x6ea;
                            }
                        }
                        // End:0x7b8
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x7b8
                            if(ro.instanceInfo.DamageDegree >= 80000)
                            {
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                            }
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x625;
            }
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x827
            break;
        // End:0x824
        case 3:
            CurrentRepairMode = 3;
            rilist.Length = 1;
            rilist[0] = ro.instanceInfo.UniqueID;
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x827
            break;
        // End:0xffff
        default:
            return true;
    }
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3b
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;
    }
    // End:0x5d
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
}

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8c [While If]
    if(i < 11)
    {
        // End:0x82
        if(ButtonWeapon[i].itemBox.instanceInfo != none && UnresolvedNativeFunction_99(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
        {
            ButtonWeapon[i].SetData(none, none);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function MainTabSelect(int tabi, optional int subtabi, optional bool bForce)
{
    TabControl[0].SetVisiblePanel(tabi);
    TabControl[1].SetVisiblePanel(subtabi);
    switch(tabi)
    {
        // End:0x45
        case 1:
            ChangeSubButton(astrSubMenuWeapon);
            // End:0x8f
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x8f
            break;
        // End:0x6b
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x8f
            break;
        // End:0x7e
        case 4:
            ChangeSubButton(astrSubMenuCash);
            // End:0x8f
            break;
        // End:0xffff
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0x8f Break;
            break;
    }
    ChangeItemList(tabi, subtabi, bForce);
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
}

function RefreshItemList()
{
    ChangeItemList(TabControl[0].GetVisiblePanelIndex(), TabControl[1].GetVisiblePanelIndex());
}

function ChangeItemList(int mainTab, int subTab, optional bool bForce)
{
    // End:0x76
    if(mainTab == 0)
    {
        switch(subTab)
        {
            // End:0x31
            case 0:
                TPItemList.ItemList.ShowWeaponWithEquip();
                // End:0x73
                break;
            // End:0x50
            case 1:
                TPItemList.ItemList.ShowWeaponNoBootyWithEquip();
                // End:0x73
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowWeaponBootyWithEquip();
                // End:0x73
                break;
            // End:0xffff
            default:
                // End:0x2e6 Break;
                break;
            }
    }
    // End:0x10c
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0xa7
            case 0:
                TPItemList.ItemList.ShowWeaponAll();
                // End:0x109
                break;
            // End:0xc6
            case 1:
                TPItemList.ItemList.ShowMainWeapon();
                // End:0x109
                break;
            // End:0xe6
            case 2:
                TPItemList.ItemList.ShowSubWeapon();
                // End:0x109
                break;
            // End:0x106
            case 3:
                TPItemList.ItemList.ShowHandThrowWeapon();
                // End:0x109
                break;
            // End:0xffff
            default:
                // End:0x2e6 Break;
                break;
            }
    }
    // End:0x1c3
    if(mainTab == 2)
    {
        switch(subTab)
        {
            // End:0x13e
            case 0:
                TPItemList.ItemList.ShowEquipItem();
                // End:0x1c0
                break;
            // End:0x15d
            case 1:
                TPItemList.ItemList.ShowEquipSpCharItem();
                // End:0x1c0
                break;
            // End:0x17d
            case 2:
                TPItemList.ItemList.ShowEquipHeadItem();
                // End:0x1c0
                break;
            // End:0x19d
            case 3:
                TPItemList.ItemList.ShowEquipFaceItem();
                // End:0x1c0
                break;
            // End:0x1bd
            case 4:
                TPItemList.ItemList.ShowEquipAccessoryItem();
                // End:0x1c0
                break;
            // End:0xffff
            default:
                // End:0x2e6 Break;
                break;
            }
    }
    // End:0x23a
    if(mainTab == 3)
    {
        switch(subTab)
        {
            // End:0x1f5
            case 0:
                TPItemList.ItemList.ShowETCnPassive();
                // End:0x237
                break;
            // End:0x214
            case 1:
                TPItemList.ItemList.ShowPassive();
                // End:0x237
                break;
            // End:0x234
            case 2:
                TPItemList.ItemList.ShowEtc();
                // End:0x237
                break;
            // End:0xffff
            default:
                // End:0x2e6 Break;
                break;
            }
    }
    // End:0x2e6
    if(mainTab == 4)
    {
        // End:0x269
        if(SaveMainTab == mainTab && SaveSubTab == subTab)
        {
        }
        // End:0x2e6
        else
        {
            switch(subTab)
            {
                // End:0x2e3
                case 0:
                    // End:0x2e0
                    if(dele_sfReqWebzenInvenList("S"))
                    {
                        class'BTWindowDefineStateHK'.static.ShowState(Controller, 5);
                        BTWindowDefineStateHK(Controller.TopPage()).StartTimeOut(10.0);
                        BTWindowDefineStateHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowDefineStateHK_sfReqWebzenInvenListS_OnTimeOut;
                    }
                    // End:0x2e6
                    break;
                // End:0xffff
                default:
                }
            }
            SaveMainTab = mainTab;
            SaveSubTab = subTab;
            SetInfoBox();
}

function BTWindowDefineStateHK_sfReqWebzenInvenListS_OnTimeOut(GUIComponent Sender)
{
    dele_StopWebzenWebzenInvenList();
    BTWindowDefineStateHK(Controller.TopPage()).FadeOut(false, true);
}

delegate dele_StopWebzenWebzenInvenList();
delegate bool dele_sfReqWebzenInvenList(string Type);
function SetInfoBox(optional int ItemIndex)
{
    InfoBox.ItemBoxView.itemBox.MyData = TPItemList.MyData;
    SelectItem(BTROItemBoxHK(TPItemList.ItemList.DataList[ItemIndex]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[ItemIndex]).instanceInfo);
}

function bool ChangeSubButton(array<string> strTemp)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x57 [While If]
    if(i < strTemp.Length)
    {
        SubButton[i].SetVisibility(true);
        SubButton[i].Caption = strTemp[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = strTemp.Length;
    J0x63:
    // End:0xa6 [While If]
    if(i < 5)
    {
        SubButton[i].SetVisibility(false);
        SubButton[i].Caption = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    return true;
}

function bool BTWindowCreateClanMarkHK_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowCreateClanMarkHK_OnOK]");
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x259
    if(BTWindow != none)
    {
        // End:0xa3
        if(BTWindow.PaidType == 2 && BTWindow.bCheckDupSuccess == false)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 149);
            return true;
        }
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        // End:0x197
        if(BTWindow.PaidType == 1)
        {
            // End:0x12d
            if(BTWindow.SelectClanMark[0] == 0 || BTWindow.SelectClanMark[1] == 0)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
                return true;
            }
            MM.kTcpChannel.sfReqPaidItem_ChangeClanMark(BTWindow.UniqueID, byte(BTWindow.PaidType), BTWindow.SelectClanMark[0], BTWindow.SelectClanMark[1], BTWindow.SelectClanMark[2]);
        }
        // End:0x259
        else
        {
            // End:0x259
            if(BTWindow.PaidType == 2)
            {
                // End:0x1f2
                if(BTWindow.ChooseClanMark[0] == 0 || BTWindow.ChooseClanMark[1] == 0)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
                    return true;
                }
                MM.kTcpChannel.sfReqPaidItem_ChangeClanMark(BTWindow.UniqueID, byte(BTWindow.PaidType), BTWindow.ChooseClanMark[0], BTWindow.ChooseClanMark[1], BTWindow.ChooseClanMark[2]);
            }
        }
    }
    return true;
}

function bool BTWindowCreateClanMarkHK_IsExist_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowCreateClanMarkHK_IsExist_OnOK]");
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x291
    if(BTWindow != none)
    {
        // End:0xc4
        if(BTWindow.PaidType == 2 && BTWindow.SelectClanMark[0] == 0 || BTWindow.SelectClanMark[1] == 0)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
            return true;
        }
        BTWindow.ChooseClanMark[0] = BTWindow.SelectClanMark[0];
        BTWindow.ChooseClanMark[1] = BTWindow.SelectClanMark[1];
        BTWindow.ChooseClanMark[2] = BTWindow.SelectClanMark[2];
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        // End:0x172
        if(MM == none)
        {
            Log("MM is None");
        }
        // End:0x1a0
        if(MM.kTcpChannel == none)
        {
            Log("MM.kTcpChannel is None");
        }
        Log("MM.kTcpChannel.sfReqPaidItem_ClanMarkDupCheck(" $ string(BTWindow.PaidType) $ ", " $ string(BTWindow.ChooseClanMark[0]) $ ", " $ string(BTWindow.ChooseClanMark[1]) $ ", " $ string(BTWindow.ChooseClanMark[2]) $ ")");
        MM.kTcpChannel.sfReqPaidItem_ClanMarkDupCheck(byte(BTWindow.PaidType), BTWindow.ChooseClanMark[0], BTWindow.ChooseClanMark[1], BTWindow.ChooseClanMark[2]);
    }
    return true;
}

function bool BTWindowDefineARHK_ReceiveCashItem_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowDefineARHK_ReceiveCashItem_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x172
    if(BTWindow != none)
    {
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        Log("sfReqWebzenBillingUseStorageItem(" $ string(BTWindow.ExtraData_int) $ ", " $ string(BTWindow.ExtraData_int2) $ ", " $ string(BTWindow.ExtraData_int3) $ ")");
        MM.kTcpChannel.sfReqWebzenBillingUseStorageItem(BTWindow.ExtraData_int, BTWindow.ExtraData_int2, byte(BTWindow.ExtraData_int3));
        BTWindow.ButtonOK.DisableMe();
        BTWindow.FadeOut(false, true);
    }
    return true;
}

function bool BTWindowDefineARHK_ItemUse_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowDefineARHK BTWindow;
    local wGameManager GameMgr;
    local string filter;
    local int temp;

    Log("[BTTPInventoryWeaponHK::BTWindowDefineARHK_ItemUse_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x98c
    if(BTWindow != none)
    {
        Log("PaidItem Use = " $ string(BTWindow.ExtraData_int));
        switch(BTWindow.ExtraData_int)
        {
            // End:0xfd
            case 17004:
            // End:0x227
            case 17075:
                // End:0x13c
                if(BTWindow.EditName.TextStr == "")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);
                }
                // End:0x224
                else
                {
                    // End:0x20e
                    if(GameMgr.FilterBadWords(BTWindow.EditName.TextStr) == false)
                    {
                        Log("MM.kTcpChannel.sfReqPaidItem_BroadCast(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 1, " $ BTWindow.EditName.TextStr $ ")");
                        MM.kTcpChannel.sfReqPaidItem_BroadCast(BTWindow.ExtraData_btrdouble, 1, BTWindow.EditName.TextStr);
                    }
                    // End:0x224
                    else
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 146);
                    }
                }
                // End:0x963
                break;
            // End:0x22f
            case 17005:
            // End:0x35a
            case 17076:
                // End:0x26e
                if(BTWindow.EditName.TextStr == "")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);
                }
                // End:0x357
                else
                {
                    // End:0x341
                    if(GameMgr.FilterBadWords(BTWindow.EditName.TextStr) == false)
                    {
                        Log("MM.kTcpChannel.sfReqPaidItem_BroadCast(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 2, " $ BTWindow.EditName.TextStr $ ")");
                        MM.kTcpChannel.sfReqPaidItem_BroadCast(BTWindow.ExtraData_btrdouble, 2, BTWindow.EditName.TextStr);
                    }
                    // End:0x357
                    else
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 146);
                    }
                }
                // End:0x963
                break;
            // End:0x3d5
            case 17012:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 2)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 2);
                // End:0x963
                break;
            // End:0x44f
            case 17013:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 1)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 1);
                // End:0x963
                break;
            // End:0x4ca
            case 17018:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 4)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 4);
                // End:0x963
                break;
            // End:0x545
            case 17082:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 5)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 5);
                // End:0x963
                break;
            // End:0x5c0
            case 17049:
                Log("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", 6)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 6);
                // End:0x963
                break;
            // End:0x790
            case 17011:
                // End:0x60e
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x67f
                if(temp == -1 || BTWindow.EditName.TextStr == "none")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;
                }
                // End:0x6b1
                else
                {
                    // End:0x6b1
                    if(temp > 16 || temp < 4)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x6e9
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log("MM.kTcpChannel.sfReqPaidItem_ChangeCharname(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", " $ BTWindow.EditName.TextStr $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeCharname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x963
                break;
            // End:0x960
            case 17017:
                // End:0x7de
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x84f
                if(temp == -1 || BTWindow.EditName.TextStr == "none")
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;
                }
                // End:0x881
                else
                {
                    // End:0x881
                    if(temp > 16 || temp < 4)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x8b9
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log("MM.kTcpChannel.sfReqPaidItem_ChangeClanname(" $ UnresolvedNativeFunction_99(BTWindow.ExtraData_btrdouble) $ ", " $ BTWindow.EditName.TextStr $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeClanname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x963
                break;
            // End:0xffff
            default:
                BTWindow.ButtonOK.DisableMe();
                BTWindow.FadeOut(false, true);
            }
            return true;
}

function int GetButtonWeaponID(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xc7 [While If]
    if(i < 11)
    {
        // End:0xbd
        if(ButtonWeapon[i].itemBox != none && ButtonWeapon[i].itemBox.instanceInfo != none && ButtonWeapon[i].itemBox.ItemInfo != none)
        {
            // End:0xbd
            if(UnresolvedNativeFunction_99(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
            {
                return ButtonWeapon[i].ButtonID;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ib = ButtonWeapon[ButtonID];
    // End:0x1e7
    if(ib.itemBox.instanceInfo != none)
    {
        // End:0xc9
        if(ib.itemBox.ItemInfo.ItemID == GameMgr.GetMainWeaponID() || ib.itemBox.ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        // End:0x120
        if(ib.itemBox.instanceInfo.SlotPosition == 0)
        {
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
        }
        // End:0x1c8
        else
        {
            // End:0x177
            if(ib.itemBox.instanceInfo.SlotPosition == 1)
            {
                TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
            }
            // End:0x1c8
            else
            {
                TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
            }
        }
        PlayerOwner().PlaySound(Controller.ItemTakeoffSound, 6, 1.0);
    }
}

function fill()
{
    local WebzenShopProduct wsp;
    local wItemBoxCashHK cii;
    local int i;
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPItemList.ItemList.ClearItem();
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyPoint = MM.kPoint;
    TPItemList.MyData.MyCash = MM.kCash;
    i = 0;
    J0xf0:
    // End:0x236 [While If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        ro = new class'BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        ro.instanceInfo = instanceInfo;
        // End:0x1aa
        if(UnresolvedNativeFunction_99(instanceInfo.UniqueID, 0))
        {
            ro.ChangeState(5);
        }
        // End:0x1bb
        else
        {
            ro.ChangeState(3);
        }
        ro.MyData = TPItemList.MyData;
        ro.SetMatchMaker(MM);
        ro.SetGameManager(GameMgr);
        ro.Update();
        TPItemList.ItemList.AddItem(ro);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf0;
    }
    i = 0;
    J0x23d:
    // End:0x7e2 [While If]
    if(i < GameMgr.kWZInvenList.Length)
    {
        // End:0x55e
        if(GameMgr.kWZInvenList[i].ItemType == 80)
        {
            wsp = GameMgr.GetWebzenShopProduct(GameMgr.kWZInvenList[i].ProductSeq, GameMgr.kWZInvenList[i].PriceSeq);
            cii = new class'wItemBoxCashHK';
            cii.WZStoreSeq = GameMgr.kWZInvenList[i].Seq;
            cii.WZStoreItemSeq = GameMgr.kWZInvenList[i].ItemSeq;
            cii.WZStoreItemType = GameMgr.kWZInvenList[i].ItemType;
            cii.WZItemName = wsp.ProductName;
            cii.WZPeriod[0] = wsp.Value;
            ro = new class'BTROItemBoxHK';
            ro.Init();
            ro.ItemInfo = GameMgr.FindUIItem(wsp.ItemID);
            instanceInfo = new class'wItemBoxInstanceHK';
            instanceInfo.ItemID = wsp.ItemID;
            instanceInfo.CashItemInfo = cii;
            instanceInfo.SlotPosition = 13;
            ro.instanceInfo = instanceInfo;
            Log("ro.InstanceInfo.ItemID=" $ string(ro.instanceInfo.ItemID));
            Log("ro.ItemInfo.ItemName=" $ ro.ItemInfo.ItemName);
            Log("ro.InstanceInfo.CashItemInfo.WZItemName=" $ ro.instanceInfo.CashItemInfo.WZItemName);
            ro.ChangeState(4);
            ro.MyData = TPItemList.MyData;
            ro.SetMatchMaker(MM);
            ro.SetGameManager(GameMgr);
            ro.Update();
            TPItemList.ItemList.AddItem(ro);
        }
        // End:0x7d8
        else
        {
            // End:0x7d8
            if(GameMgr.kWZInvenList[i].ItemType == 67)
            {
                cii = new class'wItemBoxCashHK';
                cii.WZStoreSeq = GameMgr.kWZInvenList[i].Seq;
                cii.WZStoreItemSeq = GameMgr.kWZInvenList[i].ItemSeq;
                cii.WZStoreItemType = GameMgr.kWZInvenList[i].ItemType;
                cii.WZPeriod[0] = UnresolvedNativeFunction_99(GameMgr.kWZInvenList[i].CashPoint);
                cii.WZItemName = string(cii.WZPeriod[0]) @ strCash;
                ro = new class'BTROItemBoxHK';
                ro.Init();
                ro.ItemInfo = new class'wItemBoxHK';
                ro.ItemInfo.bSkill = true;
                ro.ItemInfo.ItemType = 999;
                instanceInfo = new class'wItemBoxInstanceHK';
                instanceInfo.CashItemInfo = cii;
                instanceInfo.SlotPosition = 13;
                ro.instanceInfo = instanceInfo;
                Log("ro.InstanceInfo.CashItemInfo.WZItemName=" $ ro.instanceInfo.CashItemInfo.WZItemName);
                ro.ChangeState(4);
                ro.MyData = TPItemList.MyData;
                ro.Update();
                ro.ItemImage = class'BTUIResourcePoolHK'.default.item_item_cash;
                TPItemList.ItemList.AddItem(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23d;
    }
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ImageList.__OnDblClick__Delegate = ImageListBox_OnDblClick;
    TPItemList.ItemList.ShowWeaponWithEquip();
}

function Refresh()
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:
    // End:0xcc [While If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xc2
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xc2
            if(ItemInfo != none)
            {
                ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    i = 18;
    J0xd4:
    // End:0x172 [While If]
    if(i < 24)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x168
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x168
            if(ItemInfo != none)
            {
                ButtonWeapon[i - 18 + 4].SetData(ItemInfo, instanceInfo);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd4;
    }
    CharacterModel.ChangeEquipItem(GameMgr);
    CharacterModel.ChangeWeapon(ButtonWeapon[0].itemBox.instanceInfo.ItemID, ButtonWeapon[0].itemBox.instanceInfo.PartID, ButtonWeapon[0].itemBox.instanceInfo.PaintID);
}

function InitializeLeftPanel()
{
    local int i;

    EdgeLine = new class'BTOwnerDrawImageHK';
    EdgeLine.bUseAWinPos = true;
    EdgeLine.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 332.0, 728.0);
    EdgeLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_edge_line;
    EdgeLine.InitComponent(Controller, self);
    AppendComponent(EdgeLine);
    AFTeamBG = new class'BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    AFTeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.10;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new class'BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    RSATeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.10;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(303), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(56), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(25), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(143), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(166), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(283), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x50c:
    // End:0x610 [While If]
    if(i < 11)
    {
        ButtonWeapon[i] = new class'BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(19);
        ButtonWeapon[i].ButtonID = i;
        InvenGroup.AddButton(ButtonWeapon[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50c;
    }
    ButtonWeapon[2].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[3].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_hlmt;
    ButtonWeapon[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_face;
    ButtonWeapon[6].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_gogl;
    ButtonWeapon[7].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[8].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[9].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_class;
    i = 0;
    J0x717:
    // End:0x761 [While If]
    if(i < 11)
    {
        ButtonWeapon[i].__OnClick__Delegate = ButtonWeapon_OnClick;
        ButtonWeapon[i].__OnDblClick__Delegate = ButtonWeapon_OnDblClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x717;
    }
    ChatBox = new class'BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(22.0, 666.0 + float(18), 324.0, 720.0);
    ChatBox.RenderWeight = 0.710;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    UIModel = new class'BTModelHK';
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0);
    UIModel.RenderWeight = 0.10;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
    // End:0x981
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        UIModel.bAcceptsInput = true;
    }
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;
    local wMatchMaker MM;

    LabelItemList = new class'BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new class'BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShowOnlyInventory = true;
    TPItemList.ItemList.BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_inven_in;
    TPItemList.ItemList.BackgroundPattern.BackgroundImage = class'BTUIResourcePoolHK'.default.img_inven;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 4;
    i = 0;
    J0x17c:
    // End:0x382 [While If]
    if(i < MenuLen)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 510.0 + float(100 * i) + float(i);
        fb.Y1 = 114.0;
        fb.X2 = 510.0 + float(100 * i + 1) + float(i);
        fb.Y2 = 114.0 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        MainButton[i] = serverButton;
        MainButton[i].Caption = strMainMenu[i];
        TabControl[0].BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17c;
    }
    i = 0;
    J0x389:
    // End:0x630 [While If]
    if(i < 5)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = 510.0 + float(7) + float(81 * i) + float(i);
        fb.Y1 = 114.0 + float(5) + float(23);
        fb.X2 = 510.0 + float(7) + float(81 * i + 1) + float(i);
        fb.Y2 = 114.0 + float(5) + float(23) + float(20);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_m_n;
        serverButton.buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], TPItemList);
        SubButton[i].ButtonID = i;
        SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x389;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new class'BTItemInfoHorzBoxHK';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0;
    fb.Y1 = 564.0;
    fb.X2 = 510.0 + float(504);
    fb.Y2 = 564.0 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x707:
    // End:0x738 [While If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x707;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x748:
    // End:0x779 [While If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x748;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x789:
    // End:0x7ba [While If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x789;
    }
    i = 0;
    J0x7c1:
    // End:0x7f1 [While If]
    if(i < 4 - 1)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7c1;
    }
    astrSubMenuCash.Length = 1;
    i = 0;
    J0x800:
    // End:0x831 [While If]
    if(i < astrSubMenuCash.Length)
    {
        astrSubMenuCash[i] = strSubMenuCash[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x800;
    }
    ChangeSubButton(astrSubMenuAll);
    SaveMainTab = -1;
    SaveSubTab = -1;
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new class'DragObject';
    DragBox.Init();
    DragItemBox = new class'BTROItemBoxHK';
    DragItemBox.Init();
    DragItemBox.bDragMode = true;
    i = 0;
    J0x54:
    // End:0xc5 [While If]
    if(i < 11)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = ButtonWeapon_OnBeginDrag;
        btn.__OnEndDrag__Delegate = ButtonWeapon_OnEndDrag;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
    TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = ItemList_OnBeginDrag;
    TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = ItemList_OnEndDrag;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
}

function AddEquipWeaponeSlot(int nSlotNum, BtrDouble UniqueID);

defaultproperties
{
    InvenGroup=mgroups
    begin object name=mBackgroundImage class=BTStretchedImageHK
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPInventoryWeaponHK.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    strButtonWeapon[0]="Primary"
    strButtonWeapon[1]="Secondary"
    strButtonWeapon[2]="Thrown"
    strButtonWeapon[3]="Thrown"
    strButtonWeapon[4]="Helmet"
    strButtonWeapon[5]="Face"
    strButtonWeapon[6]="Accessory"
    strButtonWeapon[7]="AF"
    strButtonWeapon[8]="RSA"
    strButtonWeapon[9]="Rank Disguise"
    strAF="AF"
    strRSA="RSA"
    strMainMenu[0]="All"
    strMainMenu[1]="Weapons"
    strMainMenu[2]="Gear"
    strMainMenu[3]="Skills"
    strMainMenu[4]="Items"
    strSubMenuAll[0]="All"
    strSubMenuAll[1]="Shop Items"
    strSubMenuAll[2]="Cash Items"
    strSubMenuWeapon[0]="All"
    strSubMenuWeapon[1]="Primary"
    strSubMenuWeapon[2]="Secondary"
    strSubMenuWeapon[3]="Thrown"
    strSubMenuEquip[0]="All"
    strSubMenuEquip[1]="Characters"
    strSubMenuEquip[2]="Helmets"
    strSubMenuEquip[3]="Faces"
    strSubMenuEquip[4]="Accessories"
    strSubMenuSpecial[0]="All"
    strSubMenuSpecial[1]="Active"
    strSubMenuSpecial[2]="Passive"
    strSubMenuCash[0]="All"
    strSubMenuCash[1]="Other"
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0,Y1=137.0,X2=1014.0,Y2=558.0)
    fbTPItemList=(X1=517.0,Y1=167.0,X2=1011.0,Y2=515.0)
    strMenuButton[0]="Sell"
    strMenuButton[1]="Modify"
    strMenuButton[2]="Repair All"
    strMenuButton[3]="Repair"
    strMenuButton[4]="Equip"
    strMenuButton[5]="Used"
    strMenuButton[6]="Cancel"
    strCash="Cash"
    OnPreDraw=Internal_OnPreDraw
    OnRendered=Internal_OnRendered
}