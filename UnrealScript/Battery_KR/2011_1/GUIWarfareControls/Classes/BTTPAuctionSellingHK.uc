class BTTPAuctionSellingHK extends GUITabPanel
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var DragObject DragBox;
var localized string strAuctionCancel;
var() automated BTStretchedImageHK BackgroundImage;
var() automated TabControlMocker TabControlAuction;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAuction[4];
var localized string strListTopButton[8];
var FloatBox fbListTopButton[8];
var export editinline BTOwnerDrawCaptionButtonHK ListTopButton[8];
var export editinline BTOwnerDrawImageHK ListTopImage[8];
var() automated FloatBox fbACLList;
var() automated FloatBox fbACLListScrollBar;
var export editinline BTACLAuctionHK ACLList;
var localized string strButtonAuctionCancel;
var() automated FloatBox fbButtonAuctionCancel;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAuctionCancel;
var() automated FloatBox fbPageButton;
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
var() automated TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[4];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[5];
var() automated FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[3];
var() automated FloatBox fbMenuButton[3];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[3];
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int CurrentRepairMode;
var int EquipItemCount;
var array<BtrDouble> EquipItemList;
var array<BtrDouble> InvenItemList;
var array<string> Equip_DamegeItemNames;
var array<string> Inven_DamegeItemNames;
//var delegate<sfReqAuctioItemListInSelling> __sfReqAuctioItemListInSelling__Delegate;
//var delegate<SortAuctionItemList> __SortAuctionItemList__Delegate;

function Internal_OnRendered(Canvas C)
{
    CurrentCanvas = C;
    // End:0x4C
    if(DragBox.IsDragging())
    {
        DragBox.UpdateMousePos(int(Controller.MouseX), int(Controller.MouseY));
    }
    //return;    
}

delegate bool sfReqAuctioItemListInSelling(int Section, string Keyword, int ItemRank, byte ItemClassify, byte IsAvailable, int PageNum, int Count, int SortType)
{
    //return;    
}

function bool LeftPanel_MainButton_OnClick(GUIComponent Sender)
{
    local int ic;

    Log("[BTPageAuction::LeftPanel_MainButton_OnClick]");
    TabControlAuction.SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ic = (BTOwnerDrawCaptionButtonHK(Sender).ButtonID + 1) * 10;
    sfReqAuctioItemListInSelling(1, "", 0, byte(ic), 0, 1, 20, 0);
    return true;
    //return;    
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
}

function bool ImageListBox_OnDblClick(GUIComponent Sender)
{
    return false;
    //return;    
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo, cInstanceInfo;

    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    cItemInfo = none;
    cInstanceInfo = none;
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    MenuButton[0].EnableMe();
    // End:0x123
    if((TPItemList.ItemList.DataList.Length <= 0) || ItemList.SelectItemIndex < 0)
    {
        MenuButton[0].DisableMe();        
    }
    else
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).CheckRedAuction();
        // End:0x18F
        if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bRedAuction)
        {
            MenuButton[0].DisableMe();
        }
    }
    // End:0x208
    if((ItemInfo.CostType == 0) && instanceInfo.CashItemInfo == none)
    {
        // End:0x1F3
        if((instanceInfo != none) && instanceInfo.Durability < 100000)
        {
            MenuButton[2].EnableMe();            
        }
        else
        {
            MenuButton[2].DisableMe();
        }        
    }
    else
    {
        MenuButton[2].DisableMe();
    }
    return false;
    //return;    
}

delegate SortAuctionItemList(int SortType)
{
    //return;    
}

function bool ListTopButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int SortType;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x2F
        case 6:
            SortType = 1;
            // End:0x3C
            break;
        // End:0xFFFF
        default:
            SortType = 0;
            // End:0x3C
            break;
            break;
    }
    SortAuctionItemList(SortType);
    return true;
    //return;    
}

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    // End:0xCD
    if(((Sender.bDropSource == true) && DragBox.IsDragging() == false) && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), Box);
        return true;
    }
    return false;
    //return;    
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    ImageListBox_OnClick(Sender);
    // End:0x42
    if(Sender.Class == Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK')
    {
    }
    DragBox.EndDrag();
    //return;    
}

function bool ACLList_OnClick(GUIComponent Sender)
{
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK Data;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x7B
    if((ACLList.LastSelectedIndexHistory < 0) || ACLList.LastSelectedIndexHistory >= ACLList.ACLRowList.Length)
    {
        ButtonAuctionCancel.DisableMe();
        return true;        
    }
    else
    {
        ButtonAuctionCancel.EnableMe();
    }
    Data = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    ItemInfo = GameMgr.FindUIItem(Data.DataPerColumn[7].IntValue);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = Data.DataPerColumn[9].IntValue;
    instanceInfo.OverlapCount = Data.DataPerColumn[0].tempValue;
    InfoBox.SetData(ItemInfo, instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(9);
    return false;
    //return;    
}

function bool ButtonAuctionCancel_OnClick(GUIComponent Sender)
{
    local BTAutoColumnListDataHK row;

    // End:0x3A
    if((ACLList.LastSelectedIndexHistory < 0) || ACLList.ACLRowList.Length <= ACLList.LastSelectedIndexHistory)
    {
        return true;
    }
    row = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    Class'GUIWarfareControls_Decompressed.BTWindowSelectHK'.static.ShowWindow(Controller, "", row.DataPerColumn[0].strValue $ strAuctionCancel);
    BTWindowSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAuctionCancel_OnOK;
    return true;
    //return;    
}

function bool BTWindowAuctionCancel_OnOK(GUIComponent Sender)
{
    local BTAutoColumnListDataHK row;

    row = ACLList.ACLRowList[ACLList.LastSelectedIndexHistory];
    TcpChannel.sfReqAuctionMyItemCancel(row.DataPerColumn[8].IntValue);
    Controller.CloseMenu(false);
    return true;
    //return;    
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
    if((ro.ItemInfo.AuctionMinPrice > BeginPrice) || (InstantlyPrice != 0) && ro.ItemInfo.AuctionMinPrice > InstantlyPrice)
    {
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 161, ro.ItemInfo.ItemName);
        return true;
    }
    TcpChannel.sfReqAuctionMyItemRegister(asw.UniqueID, ItemCount, BeginPrice, PeriodHour, InstantlyPrice);
    return true;
    //return;    
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
    // End:0xB4
    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ro.ItemInfo.ItemName);
        return true;
    }
    switch(btn.ButtonID)
    {
        // End:0x1E1
        case 0:
            ro = BTROItemBoxHK(TPItemList.ItemList.GetLastSelectedItem());
            // End:0x12C
            if(ro.bRedAuction)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 30, ro.ItemInfo.ItemName);
                return true;
            }
            Controller.OpenMenu("GUIWarfareControls.BTWindowAuctionSellingHK");
            MyPoint = MyData.MyPoint;
            BTWindowAuctionSellingHK(Controller.TopPage()).SetData(MyPoint, ro.ItemInfo, ro.instanceInfo);
            BTWindowAuctionSellingHK(Controller.TopPage()).__OnOK__Delegate = BTWindowAuctionSelling_OnOK;
            // End:0x7E7
            break;
        // End:0x799
        case 1:
            CurrentRepairMode = 2;
            EquipItemCount = 0;
            EquipItemList.Length = 0;
            InvenItemList.Length = 0;
            Equip_DamegeItemNames.Length = 0;
            Inven_DamegeItemNames.Length = 0;
            i = 0;
            J0x21B:

            // End:0x3AA [Loop If]
            if(i < 4)
            {
                instanceInfo = none;
                ItemInfo = none;
                instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
                // End:0x27D
                if(instanceInfo != none)
                {
                    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
                }
                // End:0x3A0
                if((instanceInfo != none) && ItemInfo.CostType == 0)
                {
                    // End:0x3A0
                    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID) == false)
                    {
                        rilist.Length = rilist.Length + 1;
                        rilist[rilist.Length - 1] = instanceInfo.UniqueID;
                        EquipItemList.Length = EquipItemList.Length + 1;
                        EquipItemList[EquipItemList.Length - 1] = instanceInfo.UniqueID;
                        EquipItemCount++;
                        InvenItemList.Length = InvenItemList.Length + 1;
                        InvenItemList[InvenItemList.Length - 1] = instanceInfo.UniqueID;
                        // End:0x3A0
                        if(instanceInfo.DamageDegree >= 80000)
                        {
                            Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ItemInfo.ItemName;
                            Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ItemInfo.ItemName;
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x21B;
            }
            i = 0;
            J0x3B1:

            // End:0x5BE [Loop If]
            if(i < GameMgr.QuickSlotBoxList.Length)
            {
                j = 0;
                J0x3D1:

                // End:0x5B4 [Loop If]
                if(j < 4)
                {
                    UniqueID = GameMgr.QuickSlotBoxList[i].UniqueID[j];
                    // End:0x5AA
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()) && GameMgr.IsBlockedItemIdx(UniqueID) == false)
                    {
                        ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
                        // End:0x482
                        if(ItemInfo.CostType != 0)
                        {
                            // [Explicit Continue]
                            goto J0x5AA;
                        }
                        instanceInfo = GameMgr.FindInstanceItem(UniqueID);
                        k = 0;
                        J0x4A3:

                        // End:0x4D6 [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x4CC
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x4D6;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x4A3;
                        }
                        J0x4D6:

                        // End:0x5AA
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            EquipItemList.Length = EquipItemList.Length + 1;
                            EquipItemList[EquipItemList.Length - 1] = UniqueID;
                            EquipItemCount++;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x5AA
                            if(instanceInfo.DamageDegree >= 80000)
                            {
                                Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ItemInfo.ItemName;
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ItemInfo.ItemName;
                            }
                        }
                    }
                    J0x5AA:

                    j++;
                    // [Loop Continue]
                    goto J0x3D1;
                }
                i++;
                // [Loop Continue]
                goto J0x3B1;
            }
            i = 0;
            J0x5C5:

            // End:0x782 [Loop If]
            if(i < TPItemList.ItemList.DataPool.Length)
            {
                ro = TPItemList.ItemList.DataPool[i];
                // End:0x778
                if(((ro.ItemInfo.ItemType <= 4) && ro.ItemInfo.CostType == 0) && GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                {
                    UniqueID = ro.instanceInfo.UniqueID;
                    // End:0x778
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()))
                    {
                        k = 0;
                        J0x6AA:

                        // End:0x6DD [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x6D3
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x6DD;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x6AA;
                        }
                        J0x6DD:

                        // End:0x778
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x778
                            if(ro.instanceInfo.DamageDegree >= 80000)
                            {
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                            }
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x5C5;
            }
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x7E7
            break;
        // End:0x7E4
        case 2:
            CurrentRepairMode = 3;
            rilist.Length = 1;
            rilist[0] = ro.instanceInfo.UniqueID;
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x7E7
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
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
            // End:0x7C
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x7C
            break;
        // End:0x6B
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x7C
            break;
        // End:0xFFFF
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0x7C
            break;
            break;
    }
    ChangeItemList(tabi, subtabi);
    // End:0xE6
    if(TPItemList.ItemList.DataList.Length > 0)
    {
        TPItemList.ItemList.SelectItemIndex = 0;
        TPItemList.ItemList.LastSelectedItemIndex = 0;
        ImageListBox_OnClick(none);        
    }
    //return;    
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
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x10C
        if(mainTab == 1)
        {
            switch(subTab)
            {
                // End:0xA7
                case 0:
                    TPItemList.ItemList.ShowWeaponAll();
                    // End:0x109
                    break;
                // End:0xC6
                case 1:
                    TPItemList.ItemList.ShowMainWeapon();
                    // End:0x109
                    break;
                // End:0xE6
                case 2:
                    TPItemList.ItemList.ShowSubWeapon();
                    // End:0x109
                    break;
                // End:0x106
                case 3:
                    TPItemList.ItemList.ShowHandThrowWeapon();
                    // End:0x109
                    break;
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            // End:0x1C3
            if(mainTab == 2)
            {
                switch(subTab)
                {
                    // End:0x13E
                    case 0:
                        TPItemList.ItemList.ShowEquipItem();
                        // End:0x1C0
                        break;
                    // End:0x15D
                    case 1:
                        TPItemList.ItemList.ShowEquipHeadItem();
                        // End:0x1C0
                        break;
                    // End:0x17D
                    case 2:
                        TPItemList.ItemList.ShowEquipFaceItem();
                        // End:0x1C0
                        break;
                    // End:0x19D
                    case 3:
                        TPItemList.ItemList.ShowEquipAccessoryItem();
                        // End:0x1C0
                        break;
                    // End:0x1BD
                    case 4:
                        TPItemList.ItemList.ShowEquipSpCharItem();
                        // End:0x1C0
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }                
            }
            else
            {
                // End:0x257
                if(mainTab == 3)
                {
                    switch(subTab)
                    {
                        // End:0x1F5
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
                        // End:0xFFFF
                        default:
                            break;
                    }
                }
                else
                {
                }
            }
        }
        SetInfoBox();
        //return;        
    }
}

function SetInfoBox()
{
    InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[0]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[0]).instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    //return;    
}

function bool ChangeSubButton(array<string> strTemp)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x57 [Loop If]
    if(i < strTemp.Length)
    {
        SubButton[i].SetVisibility(true);
        SubButton[i].Caption = strTemp[i];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = strTemp.Length;
    J0x63:

    // End:0xA6 [Loop If]
    if(i < 5)
    {
        SubButton[i].SetVisibility(false);
        SubButton[i].Caption = "";
        i++;
        // [Loop Continue]
        goto J0x63;
    }
    return true;
    //return;    
}

function EquipItem()
{
    //return;    
}

function UnequipItem(int ButtonID)
{
    //return;    
}

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
    J0xF0:

    // End:0x305 [Loop If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        // End:0x1FF
        if(__NFUN_920__(instanceInfo.UniqueID, 0))
        {
            ro.instanceInfo = GameMgr.FindInstanceItem(instanceInfo.UniqueID);
            // End:0x1EB
            if(GameMgr.IsQuickSlotBoxItem(ro.instanceInfo.UniqueID))
            {
                ro.bRegisterQuickSlot = true;                
            }
            else
            {
                ro.bRegisterQuickSlot = false;
            }            
        }
        else
        {
            ro.instanceInfo = GameMgr.FindInstanceSkillItem(instanceInfo.UniqueSkillID);
            // End:0x268
            if(GameMgr.IsQuickSlotBoxSkillItem(ro.instanceInfo.UniqueSkillID))
            {
                ro.bRegisterQuickSlot = true;                
            }
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
        i++;
        // [Loop Continue]
        goto J0xF0;
    }
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ImageList.__OnDblClick__Delegate = ImageListBox_OnDblClick;
    TPItemList.ItemList.ShowWeaponWithEquip();
    SetInfoBox();
    //return;    
}

function Refresh()
{
    local int ic;

    Log("[BTTPAuctionSellingHK::Refresh]");
    ic = (TabControlAuction.GetCurrentTabIndex() + 1) * 10;
    Log(((((((((((((("TcpChannel.sfReqAuctionItemList(Section=" $ string(1)) $ ", Keyword=") $ " ") $ ", ItemRank=") $ string(0)) $ ", ItemClassify=") $ string(ic)) $ ", IsAvailable=") $ "0") $ ", PageNum=") $ string(1)) $ ", Count=") $ string(20)) $ ")");
    TcpChannel.sfReqAuctionItemList(1, "", 0, byte(ic), 0, 1, 20, 0);
    Log(((("TcpChannel.sfReqAuctionItemList(Section=" $ string(1)) $ ", ItemClassify=") $ string(ic)) $ ")");
    TcpChannel.sfReqAuctionItemListCount(1, byte(ic), 0, 0);
    //return;    
}

function InitializeLeftPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    ACLList = new Class'GUIWarfareControls_Decompressed.BTACLAuctionHK';
    ACLList.bUseAWinPos = true;
    ACLList.AWinPos = fbACLList;
    ACLList.RenderWeight = 0.9000000;
    ACLList.InitComponent(Controller, self);
    AppendComponent(ACLList);
    ACLList.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    ACLList.MultiColumnList.MyScrollBar.AWinPos = fbACLListScrollBar;
    ACLList.MultiColumnList.MyScrollBar.ApplyAWinPos();
    ACLList.MultiColumnList.__OnClick__Delegate = ACLList_OnClick;
    ACLList.ACLHeaderList[0].ColumnPerc = 106.0000000 - float(12);
    ACLList.ACLHeaderList[1].ColumnPerc = 141.0000000 - float(106);
    ACLList.ACLHeaderList[2].ColumnPerc = 177.0000000 - float(141);
    ACLList.ACLHeaderList[3].ColumnPerc = 219.0000000 - float(177);
    ACLList.ACLHeaderList[4].ColumnPerc = 261.0000000 - float(219);
    ACLList.ACLHeaderList[5].ColumnPerc = 332.0000000 - float(261);
    ACLList.ACLHeaderList[6].ColumnPerc = 403.0000000 - float(332);
    ACLList.ACLHeaderList[7].ColumnPerc = (497.0000000 - float(15)) - float(403);
    ACLList.NormalizeColumnPerc();
    i = 0;
    J0x242:

    // End:0x3AD [Loop If]
    if(i < 7)
    {
        ListTopImage[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
        ListTopImage[i].bUseAWinPos = true;
        ListTopImage[i].AWinPos.X1 = fbListTopButton[i].X2 - float(2);
        ListTopImage[i].AWinPos.Y1 = fbListTopButton[i].Y1 + float(5);
        ListTopImage[i].AWinPos.X2 = fbListTopButton[i].X2 + float(2);
        ListTopImage[i].AWinPos.Y2 = fbListTopButton[i].Y2 - float(5);
        ListTopImage[i].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_list_divid;
        ListTopImage[i].RenderWeight = 0.1900000;
        ListTopImage[i].InitComponent(Controller, self);
        AppendComponent(ListTopImage[i]);
        i++;
        // [Loop Continue]
        goto J0x242;
    }
    ListTopImage[7] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    ListTopImage[7].bUseAWinPos = true;
    ListTopImage[7].AWinPos.X1 = fbListTopButton[0].X1;
    ListTopImage[7].AWinPos.Y1 = fbListTopButton[0].Y1;
    ListTopImage[7].AWinPos.X2 = fbListTopButton[7].X2;
    ListTopImage[7].AWinPos.Y2 = fbListTopButton[7].Y2;
    ListTopImage[7].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_n;
    ListTopImage[7].RenderWeight = 0.1000000;
    ListTopImage[7].InitComponent(Controller, self);
    AppendComponent(ListTopImage[7]);
    i = 0;
    J0x4C5:

    // End:0x635 [Loop If]
    if(i < 8)
    {
        ListTopButton[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        ListTopButton[i].bUseAWinPos = true;
        ListTopButton[i].AWinPos = fbListTopButton[i];
        ListTopButton[i].buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_on;
        ListTopButton[i].buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_list_cli;
        ListTopButton[i].RenderWeight = 0.2000000;
        ListTopButton[i].SetFontSizeAll(9);
        ListTopButton[i].SetDefaultListTopButtonFontColor();
        ListTopButton[i].Caption = strListTopButton[i];
        ListTopButton[i].CaptionDrawType = 4;
        ListTopButton[i].ButtonID = i;
        ListTopButton[i].InitComponent(Controller, self);
        AppendComponent(ListTopButton[i]);
        i++;
        // [Loop Continue]
        goto J0x4C5;
    }
    i = 0;
    J0x63C:

    // End:0x8CC [Loop If]
    if(i < 4)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (17.0000000 + float(82 * i)) + float(i);
        fb.Y1 = 116.0000000;
        fb.X2 = (17.0000000 + float(82 * (i + 1))) + float(i);
        fb.Y2 = 116.0000000 + float(19);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_n;
        serverButton.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_cli;
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
        i++;
        // [Loop Continue]
        goto J0x63C;
    }
    TabControlAuction.SetVisiblePanel(0);
    ButtonAuctionCancel = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonAuctionCancel.bUseAWinPos = true;
    ButtonAuctionCancel.AWinPos = fbButtonAuctionCancel;
    ButtonAuctionCancel.Caption = strButtonAuctionCancel;
    ButtonAuctionCancel.SetFontSizeAll(11);
    ButtonAuctionCancel.SetDefaultFontColor();
    ButtonAuctionCancel.SetDefaultButtonImage();
    ButtonAuctionCancel.__OnClick__Delegate = ButtonAuctionCancel_OnClick;
    ButtonAuctionCancel.InitComponent(Controller, self);
    AppendComponent(ButtonAuctionCancel);
    PageButton = new Class'GUIWarfareControls_Decompressed.BTPageListButtonHK';
    PageButton.bUseAWinPos = true;
    PageButton.AWinPos = fbPageButton;
    PageButton.InitComponent(Controller, self);
    AppendComponent(PageButton);
    //return;    
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    LabelItemList = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new Class'GUIWarfareControls_Decompressed.BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.RenderWeight = 0.8000000;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.bAuctionList = true;
    i = 0;
    J0xF1:

    // End:0x2F4 [Loop If]
    if(i < 4)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (510.0000000 + float(100 * i)) + float(i);
        fb.Y1 = 114.0000000;
        fb.X2 = (510.0000000 + float(100 * (i + 1))) + float(i);
        fb.Y2 = 114.0000000 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
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
        i++;
        // [Loop Continue]
        goto J0xF1;
    }
    i = 0;
    J0x2FB:

    // End:0x5A2 [Loop If]
    if(i < 5)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = ((510.0000000 + float(7)) + float(81 * i)) + float(i);
        fb.Y1 = (114.0000000 + float(5)) + float(23);
        fb.X2 = ((510.0000000 + float(7)) + float(81 * (i + 1))) + float(i);
        fb.Y2 = ((114.0000000 + float(5)) + float(23)) + float(20);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_n;
        serverButton.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], TPItemList);
        SubButton[i].ButtonID = i;
        SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x2FB;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoHorzBoxHK';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0000000;
    fb.Y1 = 564.0000000;
    fb.X2 = 510.0000000 + float(504);
    fb.Y2 = 564.0000000 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    i = 0;
    J0x670:

    // End:0x7AD [Loop If]
    if(i < 3)
    {
        MenuButton[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        MenuButton[i].Caption = strMenuButton[i];
        MenuButton[i].bUseAWinPos = true;
        MenuButton[i].AWinPos = fbMenuButton[i];
        MenuButton[i].SetFontSizeAll(11);
        MenuButton[i].SetDefaultFontColor();
        MenuButton[i].SetDefaultButtonImage();
        MenuButton[i].RenderWeight = 0.6000000;
        MenuButton[i].ButtonID = i;
        MenuButton[i].InitComponent(Controller, self);
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        AppendComponent(MenuButton[i]);
        i++;
        // [Loop Continue]
        goto J0x670;
    }
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x7BD:

    // End:0x7EE [Loop If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        i++;
        // [Loop Continue]
        goto J0x7BD;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x7FE:

    // End:0x82F [Loop If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x7FE;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x83F:

    // End:0x870 [Loop If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        i++;
        // [Loop Continue]
        goto J0x83F;
    }
    i = 0;
    J0x877:

    // End:0x8A4 [Loop If]
    if(i < 4)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        i++;
        // [Loop Continue]
        goto J0x877;
    }
    ChangeSubButton(astrSubMenuAll);
    //return;    
}

function InitializeDragAndDrop()
{
    DragBox = new Class'GUIWarfareControls_Decompressed.DragObject';
    DragBox.Init();
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
    TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = ItemList_OnBeginDrag;
    TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = ItemList_OnEndDrag;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    InitializeDragAndDrop();
    //return;    
}

function Internal_OnShow()
{
    Refresh();
    //return;    
}

defaultproperties
{
    strAuctionCancel="?(?) ?? ?? ???????"
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPAuctionSellingHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        Image=Texture'Warfare_UI_UI.Common.panel_1'
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPAuctionSellingHK.mTabControla'
    begin object name="mTabControla" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControlAuction=mTabControla
    strListTopButton[0]="?????"
    strListTopButton[1]="??"
    strListTopButton[2]="??"
    strListTopButton[3]="???"
    strListTopButton[4]="??"
    strListTopButton[5]="?????"
    strListTopButton[6]="?????"
    strListTopButton[7]="?????"
    fbListTopButton[0]=(X1=12.0000000,Y1=141.0000000,X2=106.0000000,Y2=167.0000000)
    fbListTopButton[1]=(X1=106.0000000,Y1=141.0000000,X2=141.0000000,Y2=167.0000000)
    fbListTopButton[2]=(X1=141.0000000,Y1=141.0000000,X2=177.0000000,Y2=167.0000000)
    fbListTopButton[3]=(X1=177.0000000,Y1=141.0000000,X2=219.0000000,Y2=167.0000000)
    fbListTopButton[4]=(X1=219.0000000,Y1=141.0000000,X2=261.0000000,Y2=167.0000000)
    fbListTopButton[5]=(X1=261.0000000,Y1=141.0000000,X2=332.0000000,Y2=167.0000000)
    fbListTopButton[6]=(X1=332.0000000,Y1=141.0000000,X2=403.0000000,Y2=167.0000000)
    fbListTopButton[7]=(X1=403.0000000,Y1=141.0000000,X2=497.0000000,Y2=167.0000000)
    fbACLList=(X1=12.0000000,Y1=168.0000000,X2=483.0000000,Y2=662.0000000)
    fbACLListScrollBar=(X1=483.0000000,Y1=168.0000000,X2=497.0000000,Y2=688.0000000)
    strButtonAuctionCancel="?? ??"
    fbButtonAuctionCancel=(X1=398.0000000,Y1=698.0000000,X2=492.0000000,Y2=730.0000000)
    fbPageButton=(X1=12.0000000,Y1=662.0000000,X2=483.0000000,Y2=688.0000000)
    strMainMenu[0]="??"
    strMainMenu[1]="??"
    strMainMenu[2]="??"
    strMainMenu[3]="??"
    strSubMenuAll[0]="??"
    strSubMenuAll[1]="??"
    strSubMenuAll[2]="???"
    strSubMenuWeapon[0]="??"
    strSubMenuWeapon[1]="???"
    strSubMenuWeapon[2]="????"
    strSubMenuWeapon[3]="????"
    strSubMenuEquip[0]="??"
    strSubMenuEquip[1]="??"
    strSubMenuEquip[2]="??"
    strSubMenuEquip[3]="????"
    strSubMenuEquip[4]="??? ??"
    strSubMenuSpecial[0]="??"
    strSubMenuSpecial[1]="??"
    strSubMenuSpecial[2]="????"
    strSubMenuSpecial[3]="??"
    // Referen[0]ce: TabControlMocker'GUIWarfareControls_Decompressed.BTTPAuctionSellingHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPAuctionSellingHK.mTabControl2'
    begin object name="mTabControl2" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0000000,Y1=137.0000000,X2=1014.0000000,Y2=558.0000000)
    fbTPItemList=(X1=517.0000000,Y1=167.0000000,X2=1011.0000000,Y2=515.0000000)
    strMenuButton[0]="??"
    strMenuButton[1]="?? ??"
    strMenuButton[2]="??"
    fbMenuButton[0]=(X1=911.0000000,Y1=520.0000000,X2=1004.0000000,Y2=552.0000000)
    fbMenuButton[1]=(X1=715.0000000,Y1=520.0000000,X2=809.0000000,Y2=552.0000000)
    fbMenuButton[2]=(X1=813.0000000,Y1=520.0000000,X2=907.0000000,Y2=552.0000000)
    OnRendered=BTTPAuctionSellingHK.Internal_OnRendered
    OnShow=BTTPAuctionSellingHK.Internal_OnShow
}