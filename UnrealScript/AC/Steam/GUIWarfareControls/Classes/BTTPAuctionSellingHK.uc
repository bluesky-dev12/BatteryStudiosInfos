/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPAuctionSellingHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:47
 *	Functions:29
 *
 *******************************************************************************/
class BTTPAuctionSellingHK extends GUITabPanel
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var DragObject DragBox;
var localized string strAuctionCancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControlAuction;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAuction[4];
var localized string strListTopButton[8];
var FloatBox fbListTopButton[8];
var export editinline BTOwnerDrawCaptionButtonHK ListTopButton[8];
var export editinline BTOwnerDrawImageHK ListTopImage[8];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbACLListScrollBar;
var export editinline BTACLAuctionHK ACLList;
var localized string strButtonAuctionCancel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonAuctionCancel;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAuctionCancel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbPageButton;
var export editinline BTPageListButtonHK PageButton;
var BTItemCommonInfoHK MyData;
var localized string strMainMenu[4];
var localized string strSubMenuAll[3];
var localized string strSubMenuWeapon[4];
var localized string strSubMenuEquip[5];
var localized string strSubMenuSpecial[4];
var array<string> astrSubMenuAll;
var array<string> astrSubMenuWeapon;
var array<string> astrSubMenuEquip;
var array<string> astrSubMenuSpecial;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[4];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMenuButton[3];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[3];
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int CurrentRepairMode;
var int EquipItemCount;
var array<BtrDouble> EquipItemList;
var array<BtrDouble> InvenItemList;
var array<string> Equip_DamegeItemNames;
var array<string> Inven_DamegeItemNames;
var delegate<sfReqAuctioItemListInSelling> __sfReqAuctioItemListInSelling__Delegate;
var delegate<SortAuctionItemList> __SortAuctionItemList__Delegate;

function Internal_OnRendered(Canvas C)
{
    CurrentCanvas = C;
    // End:0x4c
    if(DragBox.IsDragging())
    {
        DragBox.UpdateMousePos(int(Controller.MouseX), int(Controller.MouseY));
    }
}

delegate bool sfReqAuctioItemListInSelling(int Section, string Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType);
function bool LeftPanel_MainButton_OnClick(GUIComponent Sender)
{
    local int ic;

    Log("[BTPageAuction::LeftPanel_MainButton_OnClick]");
    TabControlAuction.SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ic = BTOwnerDrawCaptionButtonHK(Sender).ButtonID + 1 * 10;
    sfReqAuctioItemListInSelling(1, "", 0, byte(ic), 0, 1, 20, 0);
    return true;
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool ImageListBox_OnDblClick(GUIComponent Sender)
{
    return false;
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo, cInstanceInfo;

    // End:0x41
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseOn == false)
    {
        return false;
    }
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    cItemInfo = none;
    cInstanceInfo = none;
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    MenuButton[0].EnableMe();
    // End:0x164
    if(TPItemList.ItemList.DataList.Length <= 0 || ItemList.SelectItemIndex < 0)
    {
        MenuButton[0].DisableMe();
    }
    // End:0x1d0
    else
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).CheckRedAuction();
        // End:0x1d0
        if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bRedAuction)
        {
            MenuButton[0].DisableMe();
        }
    }
    // End:0x249
    if(ItemInfo.CostType == 0 && instanceInfo.CashItemInfo == none)
    {
        // End:0x234
        if(instanceInfo != none && instanceInfo.Durability < 100000)
        {
            MenuButton[2].EnableMe();
        }
        // End:0x246
        else
        {
            MenuButton[2].DisableMe();
        }
    }
    // End:0x25b
    else
    {
        MenuButton[2].DisableMe();
    }
    return false;
}

delegate SortAuctionItemList(int SortType);
function bool ListTopButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int SortType;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x2f
        case 6:
            SortType = 1;
            // End:0x3c
            break;
        // End:0xffff
        default:
            SortType = 0;
            // End:0x3c Break;
            break;
    }
    SortAuctionItemList(SortType);
    return true;
}

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    // End:0xcd
    if(Sender.bDropSource == true && DragBox.IsDragging() == false && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), Box);
        return true;
    }
    return false;
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    ImageListBox_OnClick(Sender);
    // End:0x42
    if(Sender.Class == class'BTItemBoxButtonHK')
    {
    }
    DragBox.EndDrag();
}

function bool ACLList_OnClick(GUIComponent Sender)
{
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK Data;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x7b
    if(ACLList.LastSelectedIndexHistory < 0 || ACLList.LastSelectedIndexHistory >= ACLList.ACLRowList.Length)
    {
        ButtonAuctionCancel.DisableMe();
        return true;
    }
    // End:0x8a
    else
    {
        ButtonAuctionCancel.EnableMe();
    }
    Data = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    ItemInfo = GameMgr.FindUIItem(Data.DataPerColumn[7].IntValue);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = Data.DataPerColumn[9].IntValue;
    instanceInfo.OverlapCount = Data.DataPerColumn[0].tempValue;
    InfoBox.SetData(ItemInfo, instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(9);
    return false;
}

function bool ButtonAuctionCancel_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK row;

    // End:0x3a
    if(ACLList.LastSelectedIndexHistory < 0 || ACLList.ACLRowList.Length <= ACLList.LastSelectedIndexHistory)
    {
        return true;
    }
    row = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    class'BTWindowSelectHK'.static.ShowWindow(Controller, "", strAuctionCancel $ row.DataPerColumn[0].strValue);
    BTWindowSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAuctionCancel_OnOK;
    return true;
}

function bool BTWindowAuctionCancel_OnOK(GUIComponent Sender)
{
    local BTAutoColumnListDataHK row;

    row = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    TcpChannel.sfReqAuctionMyItemCancel(row.DataPerColumn[8].IntValue);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowAuctionSelling_OnOK(GUIComponent Sender)
{
    local int ItemCount, BeginPrice, InstantlyPrice, PeriodHour;
    local BTROItemBoxHK ro;
    local export editinline BTWindowAuctionSellingHK asw;

    asw = BTWindowAuctionSellingHK(Controller.TopPage());
    ItemCount = int(asw.NEditBox[0].OriginalStr);
    BeginPrice = int(asw.NEditBox[1].OriginalStr);
    InstantlyPrice = int(asw.NEditBox[2].OriginalStr);
    PeriodHour = asw.PeriodHour;
    asw.SelectItemCount = ItemCount;
    ro = BTROItemBoxHK(TPItemList.ItemList.GetLastSelectedItem());
    // End:0x149
    if(ro.ItemInfo.AuctionMinPrice > BeginPrice || InstantlyPrice != 0 && ro.ItemInfo.AuctionMinPrice > InstantlyPrice)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 161, ro.ItemInfo.ItemName);
        return true;
    }
    TcpChannel.sfReqAuctionMyItemRegister(asw.UniqueID, ItemCount, BeginPrice, PeriodHour, InstantlyPrice);
    return true;
}

function bool MenuButton_OnClick(GUIComponent Sender)
{
    local BtrDouble UniqueID;
    local int MyPoint, i, j, k;
    local array<BtrDouble> rilist;
    local BTROItemBoxHK ro;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ro = InfoBox.ItemBoxView.itemBox;
    // End:0xb4
    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ro.ItemInfo.ItemName);
        return true;
    }
    switch(btn.ButtonID)
    {
        // End:0x1e1
        case 0:
            ro = BTROItemBoxHK(TPItemList.ItemList.GetLastSelectedItem());
            // End:0x12c
            if(ro.bRedAuction)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 30, ro.ItemInfo.ItemName);
                return true;
            }
            Controller.OpenMenu("GUIWarfareControls.BTWindowAuctionSellingHK");
            MyPoint = MyData.MyPoint;
            BTWindowAuctionSellingHK(Controller.TopPage()).SetData(MyPoint, ro.ItemInfo, ro.instanceInfo);
            BTWindowAuctionSellingHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAuctionSelling_OnOK;
            // End:0x7f2
            break;
        // End:0x7a4
        case 1:
            CurrentRepairMode = 2;
            EquipItemCount = 0;
            EquipItemList.Length = 0;
            InvenItemList.Length = 0;
            Equip_DamegeItemNames.Length = 0;
            Inven_DamegeItemNames.Length = 0;
            i = 0;
            J0x21b:
            // End:0x3aa [While If]
            if(i < 4)
            {
                instanceInfo = none;
                ItemInfo = none;
                instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
                // End:0x27d
                if(instanceInfo != none)
                {
                    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
                }
                // End:0x3a0
                if(instanceInfo != none && ItemInfo.CostType == 0)
                {
                    // End:0x3a0
                    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID) == false)
                    {
                        rilist.Length = rilist.Length + 1;
                        rilist[rilist.Length - 1] = instanceInfo.UniqueID;
                        EquipItemList.Length = EquipItemList.Length + 1;
                        EquipItemList[EquipItemList.Length - 1] = instanceInfo.UniqueID;
                        ++ EquipItemCount;
                        InvenItemList.Length = InvenItemList.Length + 1;
                        InvenItemList[InvenItemList.Length - 1] = instanceInfo.UniqueID;
                        // End:0x3a0
                        if(instanceInfo.DamageDegree >= 80000)
                        {
                            Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ItemInfo.ItemName;
                            Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ItemInfo.ItemName;
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x21b;
            }
            i = 0;
            J0x3b1:
            // End:0x5be [While If]
            if(i < GameMgr.QuickSlotBoxList.Length)
            {
                j = 0;
                J0x3d1:
                // End:0x5b4 [While If]
                if(j < 4)
                {
                    UniqueID = GameMgr.QuickSlotBoxList[i].UniqueID[j];
                    // End:0x5aa
                    if(UnresolvedNativeFunction_99(UniqueID, EmptyBtrDouble()) && GameMgr.IsBlockedItemIdx(UniqueID) == false)
                    {
                        ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
                        // End:0x482
                        if(ItemInfo.CostType != 0)
                        {
                        }
                        // End:0x5aa
                        else
                        {
                            instanceInfo = GameMgr.FindInstanceItem(UniqueID);
                            k = 0;
                            J0x4a3:
                            // End:0x4d6 [While If]
                            if(k < rilist.Length)
                            {
                                // End:0x4cc
                                if(UnresolvedNativeFunction_99(rilist[k], UniqueID))
                                {
                                }
                                // End:0x4d6
                                else
                                {
                                    ++ k;
                                    // This is an implied JumpToken; Continue!
                                    goto J0x4a3;
                                }
                            }
                            // End:0x5aa
                            if(k == rilist.Length)
                            {
                                rilist.Length = rilist.Length + 1;
                                rilist[rilist.Length - 1] = UniqueID;
                                EquipItemList.Length = EquipItemList.Length + 1;
                                EquipItemList[EquipItemList.Length - 1] = UniqueID;
                                ++ EquipItemCount;
                                InvenItemList.Length = InvenItemList.Length + 1;
                                InvenItemList[InvenItemList.Length - 1] = UniqueID;
                                // End:0x5aa
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
                    goto J0x3d1;
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x3b1;
            }
            i = 0;
            J0x5c5:
            // End:0x78d [While If]
            if(i < TPItemList.ItemList.DataPool.Length)
            {
                ro = TPItemList.ItemList.DataPool[i];
                // End:0x783
                if(GameMgr.CheckMainWeaponItem(ro.ItemInfo.ItemType) && ro.ItemInfo.CostType == 0 && GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                {
                    UniqueID = ro.instanceInfo.UniqueID;
                    // End:0x783
                    if(UnresolvedNativeFunction_99(UniqueID, EmptyBtrDouble()))
                    {
                        k = 0;
                        J0x6b5:
                        // End:0x6e8 [While If]
                        if(k < rilist.Length)
                        {
                            // End:0x6de
                            if(UnresolvedNativeFunction_99(rilist[k], UniqueID))
                            {
                            }
                            // End:0x6e8
                            else
                            {
                                ++ k;
                                // This is an implied JumpToken; Continue!
                                goto J0x6b5;
                            }
                        }
                        // End:0x783
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x783
                            if(ro.instanceInfo.DamageDegree >= 80000)
                            {
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                            }
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x5c5;
            }
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x7f2
            break;
        // End:0x7ef
        case 2:
            CurrentRepairMode = 3;
            rilist.Length = 1;
            rilist[0] = ro.instanceInfo.UniqueID;
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x7f2
            break;
        // End:0xffff
        default:
            return true;
    }
}

function MainTabSelect(int tabi, optional int subtabi, optional bool bStopLoop)
{
    TabControl[0].SetVisiblePanel(tabi);
    TabControl[1].SetVisiblePanel(subtabi);
    switch(tabi)
    {
        // End:0x45
        case 1:
            ChangeSubButton(astrSubMenuWeapon);
            // End:0x7c
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x7c
            break;
        // End:0x6b
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x7c
            break;
        // End:0xffff
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0x7c Break;
            break;
    }
    ChangeItemList(tabi, subtabi);
    // End:0xe6
    if(TPItemList.ItemList.DataList.Length > 0)
    {
        TPItemList.ItemList.SelectItemIndex = 0;
        TPItemList.ItemList.LastSelectedItemIndex = 0;
        ImageListBox_OnClick(none);
    }
    // End:0xe6
    else
    {
    }
}

function ChangeItemList(int mainTab, int subTab)
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
                // End:0x257 Break;
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
                // End:0x257 Break;
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
                TPItemList.ItemList.ShowEquipHeadItem();
                // End:0x1c0
                break;
            // End:0x17d
            case 2:
                TPItemList.ItemList.ShowEquipFaceItem();
                // End:0x1c0
                break;
            // End:0x19d
            case 3:
                TPItemList.ItemList.ShowEquipAccessoryItem();
                // End:0x1c0
                break;
            // End:0x1bd
            case 4:
                TPItemList.ItemList.ShowEquipSpCharItem();
                // End:0x1c0
                break;
            // End:0xffff
            default:
                // End:0x257 Break;
                break;
            }
    }
    // End:0x257
    if(mainTab == 3)
    {
        switch(subTab)
        {
            // End:0x1f5
            case 0:
                TPItemList.ItemList.ShowETCnPassive();
                // End:0x257
                break;
            // End:0x214
            case 1:
                TPItemList.ItemList.ShowPassive();
                // End:0x257
                break;
            // End:0x234
            case 2:
                TPItemList.ItemList.ShowLVMark();
                // End:0x257
                break;
            // End:0x254
            case 3:
                TPItemList.ItemList.ShowEtc();
                // End:0x257
                break;
            // End:0xffff
            default:
            }
            SetInfoBox();
}

function SetInfoBox()
{
    InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[0]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[0]).instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
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

function EquipItem();
function UnequipItem(int ButtonID);
function fill()
{
    local int i;
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPItemList.ItemList.ClearItem();
    TPItemList.MyData.myLevel = MyData.myLevel;
    TPItemList.MyData.MyPoint = MyData.MyPoint;
    TPItemList.MyData.MyCash = MyData.MyCash;
    i = 0;
    J0xf0:
    // End:0x305 [While If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        ro = new class'BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        // End:0x1ff
        if(UnresolvedNativeFunction_99(instanceInfo.UniqueID, 0))
        {
            ro.instanceInfo = GameMgr.FindInstanceItem(instanceInfo.UniqueID);
            // End:0x1eb
            if(GameMgr.IsQuickSlotBoxItem(ro.instanceInfo.UniqueID))
            {
                ro.bRegisterQuickSlot = true;
            }
            // End:0x1fc
            else
            {
                ro.bRegisterQuickSlot = false;
            }
        }
        // End:0x279
        else
        {
            ro.instanceInfo = GameMgr.FindInstanceSkillItem(instanceInfo.UniqueSkillID);
            // End:0x268
            if(GameMgr.IsQuickSlotBoxSkillItem(ro.instanceInfo.UniqueSkillID))
            {
                ro.bRegisterQuickSlot = true;
            }
            // End:0x279
            else
            {
                ro.bRegisterQuickSlot = false;
            }
        }
        ro.ChangeState(8);
        ro.MyData = TPItemList.MyData;
        ro.SetMatchMaker(MM);
        ro.SetGameManager(GameMgr);
        ro.Update();
        TPItemList.ItemList.AddItem(ro);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf0;
    }
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ImageList.__OnDblClick__Delegate = ImageListBox_OnDblClick;
    TPItemList.ItemList.ShowWeaponWithEquip();
    SetInfoBox();
}

function Refresh()
{
    local int ic;

    Log("[BTTPAuctionSellingHK::Refresh]");
    ic = TabControlAuction.GetCurrentTabIndex() + 1 * 10;
    Log("TcpChannel.sfReqAuctionItemList(Section=" $ string(1) $ ", Keyword=" $ " " $ ", ItemRank=" $ string(0) $ ", ItemClassify=" $ string(ic) $ ", IsAvailable=" $ "0" $ ", PageNum=" $ string(1) $ ", Count=" $ string(20) $ ")");
    TcpChannel.sfReqAuctionItemList(1, "", 0, byte(ic), 0, 1, 20, 0);
    Log("TcpChannel.sfReqAuctionItemList(Section=" $ string(1) $ ", ItemClassify=" $ string(ic) $ ")");
    TcpChannel.sfReqAuctionItemListCount(1, byte(ic), 0, 0);
}

function InitializeLeftPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    ACLList = new class'BTACLAuctionHK';
    ACLList.bUseAWinPos = true;
    ACLList.AWinPos = fbACLList;
    ACLList.RenderWeight = 0.90;
    ACLList.InitComponent(Controller, self);
    AppendComponent(ACLList);
    ACLList.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    ACLList.MultiColumnList.MyScrollBar.AWinPos = fbACLListScrollBar;
    ACLList.MultiColumnList.MyScrollBar.ApplyAWinPos();
    ACLList.MultiColumnList.__OnClick__Delegate = ACLList_OnClick;
    ACLList.ACLHeaderList[0].ColumnPerc = 106.0 - float(12);
    ACLList.ACLHeaderList[1].ColumnPerc = 141.0 - float(106);
    ACLList.ACLHeaderList[2].ColumnPerc = 177.0 - float(141);
    ACLList.ACLHeaderList[3].ColumnPerc = 219.0 - float(177);
    ACLList.ACLHeaderList[4].ColumnPerc = 261.0 - float(219);
    ACLList.ACLHeaderList[5].ColumnPerc = 332.0 - float(261);
    ACLList.ACLHeaderList[6].ColumnPerc = 403.0 - float(332);
    ACLList.ACLHeaderList[7].ColumnPerc = 497.0 - float(15) - float(403);
    ACLList.NormalizeColumnPerc();
    i = 0;
    J0x242:
    // End:0x3ad [While If]
    if(i < 7)
    {
        ListTopImage[i] = new class'BTOwnerDrawImageHK';
        ListTopImage[i].bUseAWinPos = true;
        ListTopImage[i].AWinPos.X1 = fbListTopButton[i].X2 - float(2);
        ListTopImage[i].AWinPos.Y1 = fbListTopButton[i].Y1 + float(5);
        ListTopImage[i].AWinPos.X2 = fbListTopButton[i].X2 + float(2);
        ListTopImage[i].AWinPos.Y2 = fbListTopButton[i].Y2 - float(5);
        ListTopImage[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_list_divid;
        ListTopImage[i].RenderWeight = 0.190;
        ListTopImage[i].InitComponent(Controller, self);
        AppendComponent(ListTopImage[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x242;
    }
    ListTopImage[7] = new class'BTOwnerDrawImageHK';
    ListTopImage[7].bUseAWinPos = true;
    ListTopImage[7].AWinPos.X1 = fbListTopButton[0].X1;
    ListTopImage[7].AWinPos.Y1 = fbListTopButton[0].Y1;
    ListTopImage[7].AWinPos.X2 = fbListTopButton[7].X2;
    ListTopImage[7].AWinPos.Y2 = fbListTopButton[7].Y2;
    ListTopImage[7].BackgroundImage = class'BTUIResourcePoolHK'.default.butt_list_n;
    ListTopImage[7].RenderWeight = 0.10;
    ListTopImage[7].InitComponent(Controller, self);
    AppendComponent(ListTopImage[7]);
    i = 0;
    J0x4c5:
    // End:0x635 [While If]
    if(i < 8)
    {
        ListTopButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        ListTopButton[i].bUseAWinPos = true;
        ListTopButton[i].AWinPos = fbListTopButton[i];
        ListTopButton[i].buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_list_on;
        ListTopButton[i].buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_list_cli;
        ListTopButton[i].RenderWeight = 0.20;
        ListTopButton[i].SetFontSizeAll(9);
        ListTopButton[i].SetDefaultListTopButtonFontColor();
        ListTopButton[i].Caption = strListTopButton[i];
        ListTopButton[i].CaptionDrawType = 4;
        ListTopButton[i].ButtonID = i;
        ListTopButton[i].InitComponent(Controller, self);
        AppendComponent(ListTopButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c5;
    }
    i = 0;
    J0x63c:
    // End:0x8cc [While If]
    if(i < 4)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 17.0 + float(82 * i) + float(i);
        fb.Y1 = 116.0;
        fb.X2 = 17.0 + float(82 * i + 1) + float(i);
        fb.Y2 = 116.0 + float(19);
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
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        ButtonAuction[i] = serverButton;
        ButtonAuction[i].Caption = strMainMenu[i];
        TabControlAuction.BindTabButtonAndPanel(ButtonAuction[i], ACLList);
        ButtonAuction[i].ButtonID = i;
        ButtonAuction[i].__OnClick__Delegate = LeftPanel_MainButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63c;
    }
    TabControlAuction.SetVisiblePanel(0);
    ButtonAuctionCancel = new class'BTOwnerDrawCaptionButtonHK';
    ButtonAuctionCancel.bUseAWinPos = true;
    ButtonAuctionCancel.AWinPos = fbButtonAuctionCancel;
    ButtonAuctionCancel.Caption = strButtonAuctionCancel;
    ButtonAuctionCancel.SetFontSizeAll(11);
    ButtonAuctionCancel.SetDefaultFontColor();
    ButtonAuctionCancel.SetDefaultButtonImage();
    ButtonAuctionCancel.__OnClick__Delegate = ButtonAuctionCancel_OnClick;
    ButtonAuctionCancel.InitComponent(Controller, self);
    AppendComponent(ButtonAuctionCancel);
    PageButton = new class'BTPageListButtonHK';
    PageButton.bUseAWinPos = true;
    PageButton.AWinPos = fbPageButton;
    PageButton.InitComponent(Controller, self);
    AppendComponent(PageButton);
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    LabelItemList = new class'BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new class'BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.RenderWeight = 0.80;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.bAuctionList = true;
    i = 0;
    J0xf1:
    // End:0x2f4 [While If]
    if(i < 4)
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
        goto J0xf1;
    }
    i = 0;
    J0x2fb:
    // End:0x5a2 [While If]
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
        goto J0x2fb;
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
    i = 0;
    J0x670:
    // End:0x7ad [While If]
    if(i < 3)
    {
        MenuButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        MenuButton[i].Caption = strMenuButton[i];
        MenuButton[i].bUseAWinPos = true;
        MenuButton[i].AWinPos = fbMenuButton[i];
        MenuButton[i].SetFontSizeAll(11);
        MenuButton[i].SetDefaultFontColor();
        MenuButton[i].SetDefaultButtonImage();
        MenuButton[i].RenderWeight = 0.60;
        MenuButton[i].ButtonID = i;
        MenuButton[i].InitComponent(Controller, self);
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        AppendComponent(MenuButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x670;
    }
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x7bd:
    // End:0x7ee [While If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7bd;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x7fe:
    // End:0x82f [While If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7fe;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x83f:
    // End:0x870 [While If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x83f;
    }
    i = 0;
    J0x877:
    // End:0x8a4 [While If]
    if(i < 4)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x877;
    }
    ChangeSubButton(astrSubMenuAll);
}

function InitializeDragAndDrop()
{
    DragBox = new class'DragObject';
    DragBox.Init();
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
    TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = ItemList_OnBeginDrag;
    TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = ItemList_OnEndDrag;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    InitializeDragAndDrop();
}

function Internal_OnShow()
{
    Refresh();
}

defaultproperties
{
    strAuctionCancel="Cancel the sale of"
    begin object name=mBackgroundImage class=BTStretchedImageHK
        Image=Texture'Warfare_GP_UI_UI.Common.panel_1'
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPAuctionSellingHK.mBackgroundImage'
    BackgroundImage=mBackgroundImage
    TabControlAuction=mTabControla
    strListTopButton[0]="Item Name"
    strListTopButton[1]="Rank"
    strListTopButton[2]="Lv."
    strListTopButton[3]="Damage Level"
    strListTopButton[4]="End"
    strListTopButton[5]="Highest Bid"
    strListTopButton[6]="Buy-Now Price"
    strListTopButton[7]="Highest Bidder"
    fbListTopButton[0]=(X1=12.0,Y1=141.0,X2=106.0,Y2=167.0)
    fbListTopButton[1]=(X1=106.0,Y1=141.0,X2=141.0,Y2=167.0)
    fbListTopButton[2]=(X1=141.0,Y1=141.0,X2=177.0,Y2=167.0)
    fbListTopButton[3]=(X1=177.0,Y1=141.0,X2=219.0,Y2=167.0)
    fbListTopButton[4]=(X1=219.0,Y1=141.0,X2=261.0,Y2=167.0)
    fbListTopButton[5]=(X1=261.0,Y1=141.0,X2=332.0,Y2=167.0)
    fbListTopButton[6]=(X1=332.0,Y1=141.0,X2=403.0,Y2=167.0)
    fbListTopButton[7]=(X1=403.0,Y1=141.0,X2=497.0,Y2=167.0)
    fbACLList=(X1=12.0,Y1=168.0,X2=483.0,Y2=662.0)
    fbACLListScrollBar=(X1=483.0,Y1=168.0,X2=497.0,Y2=688.0)
    strButtonAuctionCancel="Cancel Sale"
    fbButtonAuctionCancel=(X1=398.0,Y1=698.0,X2=492.0,Y2=730.0)
    fbPageButton=(X1=12.0,Y1=662.0,X2=483.0,Y2=688.0)
    strMainMenu[0]="All"
    strMainMenu[1]="Weapons"
    strMainMenu[2]="Gear"
    strMainMenu[3]="Special"
    strSubMenuAll[0]="All"
    strSubMenuAll[1]="General"
    strSubMenuAll[2]="Loot"
    strSubMenuWeapon[0]="All"
    strSubMenuWeapon[1]="Primary"
    strSubMenuWeapon[2]="Secondary"
    strSubMenuWeapon[3]="Thrown"
    strSubMenuEquip[0]="All"
    strSubMenuEquip[1]="Helmet"
    strSubMenuEquip[2]="Face"
    strSubMenuEquip[3]="Accessory"
    strSubMenuEquip[4]="Special Uniform"
    strSubMenuSpecial[0]="All"
    strSubMenuSpecial[1]="Passive"
    strSubMenuSpecial[2]="Other"
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0,Y1=137.0,X2=1014.0,Y2=558.0)
    fbTPItemList=(X1=517.0,Y1=167.0,X2=1011.0,Y2=515.0)
    strMenuButton[0]="Sell"
    strMenuButton[1]="Repair All"
    strMenuButton[2]="Repair"
    fbMenuButton[0]=(X1=911.0,Y1=520.0,X2=1004.0,Y2=552.0)
    fbMenuButton[1]=(X1=715.0,Y1=520.0,X2=809.0,Y2=552.0)
    fbMenuButton[2]=(X1=813.0,Y1=520.0,X2=907.0,Y2=552.0)
    OnRendered=Internal_OnRendered
    OnShow=Internal_OnShow
}