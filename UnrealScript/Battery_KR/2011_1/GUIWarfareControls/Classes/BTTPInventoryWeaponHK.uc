class BTTPInventoryWeaponHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var BTROItemBoxHK DragItemBox;
var DragObject DragBox;
var() automated ButtonGroups InvenGroup;
var() automated BTStretchedImageHK BackgroundImage;
var() automated FloatBox fbButtonWeapon[10];
var localized string strButtonWeapon[10];
var export editinline BTItemBoxButtonHK ButtonWeapon[10];
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
var() automated TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[5];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[5];
var() automated FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[7];
var() automated FloatBox fbMenuButton[5];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[5];
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int CurrentRepairMode;
var int EquipItemCount;
var array<BtrDouble> EquipItemList;
var array<BtrDouble> InvenItemList;
var array<string> Equip_DamegeItemNames;
var array<string> Inven_DamegeItemNames;
var localized string strCash;
//var delegate<dele_StopWebzenWebzenInvenList> __dele_StopWebzenWebzenInvenList__Delegate;
//var delegate<dele_sfReqWebzenInvenList> __dele_sfReqWebzenInvenList__Delegate;

function bool Internal_OnPreDraw(Canvas C)
{
    ChangeVisibleModel(bVisibleAFModel);
    // End:0x2B
    if(CharacterModel != none)
    {
        UIModel.cModel = CharacterModel;
    }
    // End:0x46
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x5E
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
    //return;    
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
    //return;    
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
    //return;    
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
    //return;    
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
    //return;    
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
    //return;    
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(true);
    CharacterModel.ChangeTeam(0);
    return true;
    //return;    
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(false);
    CharacterModel.ChangeTeam(1);
    return true;
    //return;    
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
}

function bool ImageListBox_OnDblClick(GUIComponent Sender)
{
    // End:0x35
    if(TPItemList.ItemList.SelectItemIndex != TPItemList.ItemList.LastSelectedItemIndex)
    {
        return true;
    }
    // End:0x57
    if(int(MenuButton[4].MenuState) != int(4))
    {
        EquipItem();
    }
    return true;
    //return;    
}

function UpdateServerTime(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < 10)
    {
        ButtonWeapon[i].itemBox.UpdateTime(D);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    self.TPItemList.UpdateServerTime(D);
    //return;    
}

function SelectItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, optional bool bHoldcItemInfo)
{
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    cItemInfo = none;
    cInstanceInfo = none;
    // End:0x159
    if(bHoldcItemInfo == false)
    {
        switch(ItemInfo.ItemType)
        {
            // End:0x5E
            case 0:
            // End:0x62
            case 1:
            // End:0xA8
            case 2:
                cItemInfo = ButtonWeapon[0].itemBox.ItemInfo;
                cInstanceInfo = ButtonWeapon[0].itemBox.instanceInfo;
                // End:0x159
                break;
            // End:0xEE
            case 3:
                cItemInfo = ButtonWeapon[1].itemBox.ItemInfo;
                cInstanceInfo = ButtonWeapon[1].itemBox.instanceInfo;
                // End:0x159
                break;
            // End:0x136
            case 4:
                cItemInfo = ButtonWeapon[2].itemBox.ItemInfo;
                cInstanceInfo = ButtonWeapon[2].itemBox.instanceInfo;
                // End:0x159
                break;
            // End:0x13E
            case 5:
                // End:0x159
                break;
            // End:0x146
            case 6:
                // End:0x159
                break;
            // End:0x14E
            case 7:
                // End:0x159
                break;
            // End:0x156
            case 8:
                // End:0x159
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        // End:0x1E9
        if(ItemInfo.ItemType == 999)
        {
            InfoBox.ItemBoxView.itemBox.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.item_item_cash;
            InfoBox.ItemBoxView.itemBox.ChangeState(10);            
        }
        else
        {
            InfoBox.ItemBoxView.itemBox.ChangeState(0);
        }
        // End:0x271
        if(ItemInfo == none)
        {
            MenuButton[0].DisableMe();
            MenuButton[1].DisableMe();
            MenuButton[2].DisableMe();
            MenuButton[3].DisableMe();
            MenuButton[4].DisableMe();
            return;
        }
        // End:0x2CD
        if((ItemInfo.bSellShop && (GetButtonWeaponID(instanceInfo.UniqueID)) == -1) && instanceInfo.CashItemInfo == none)
        {
            MenuButton[0].EnableMe();            
        }
        else
        {
            MenuButton[0].DisableMe();
        }
        // End:0x34A
        if(((ItemInfo.ItemType <= 3) && (ItemInfo.Grade <= 1) || ItemInfo.Grade == 7) && instanceInfo.CashItemInfo == none)
        {
            MenuButton[1].EnableMe();            
        }
        else
        {
            MenuButton[1].DisableMe();
        }
        // End:0x3E6
        if((ItemInfo.CostType == 0) && instanceInfo.CashItemInfo == none)
        {
            MenuButton[2].EnableMe();
            // End:0x3D1
            if((instanceInfo != none) && instanceInfo.Durability < 100000)
            {
                MenuButton[3].EnableMe();                
            }
            else
            {
                MenuButton[3].DisableMe();
            }            
        }
        else
        {
            MenuButton[2].DisableMe();
            MenuButton[3].DisableMe();
        }
        // End:0x470
        if(((instanceInfo != none) && ItemInfo.CostType == 1) && instanceInfo.ItemState == 0)
        {
            MenuButton[4].EnableMe();
            MenuButton[4].Caption = strMenuButton[5];            
        }
        else
        {
            // End:0x4B3
            if(instanceInfo.CashItemInfo != none)
            {
                MenuButton[4].EnableMe();
                MenuButton[4].Caption = strMenuButton[5];                
            }
            else
            {
                // End:0x4F7
                if(ItemInfo.ItemType == 25)
                {
                    MenuButton[4].EnableMe();
                    MenuButton[4].Caption = strMenuButton[5];                    
                }
                else
                {
                    // End:0x53B
                    if(ItemInfo.ItemType == 26)
                    {
                        MenuButton[4].EnableMe();
                        MenuButton[4].Caption = strMenuButton[5];                        
                    }
                    else
                    {
                        // End:0x57F
                        if(ItemInfo.ItemType == 27)
                        {
                            MenuButton[4].EnableMe();
                            MenuButton[4].Caption = strMenuButton[5];                            
                        }
                        else
                        {
                            // End:0x62F
                            if(((ItemInfo.ItemType <= 11) || ItemInfo.ItemType == 29) && ItemInfo.EquipLevel <= MM.kLevel)
                            {
                                MenuButton[4].EnableMe();
                                // End:0x612
                                if(instanceInfo.SlotPosition == 13)
                                {
                                    MenuButton[4].Caption = strMenuButton[4];                                    
                                }
                                else
                                {
                                    MenuButton[4].Caption = strMenuButton[6];
                                }                                
                            }
                            else
                            {
                                MenuButton[4].DisableMe();
                                MenuButton[4].Caption = strMenuButton[4];
                            }
                        }
                    }
                }
            }
        }
        //return;        
    }
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    SelectItem(ItemInfo, instanceInfo);
    return true;
    //return;    
}

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    TPItemList.ItemList.LastSelectedItemIndex = TPItemList.ItemList.SelectItemIndex;
    // End:0x162
    if(((Sender.bDropSource == true) && DragBox.IsDragging() == false) && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragItemBox.AWinPos = Box.AWinPos;
        DragItemBox.ItemInfo = Box.ItemInfo;
        DragItemBox.instanceInfo = Box.instanceInfo;
        DragItemBox.Update();
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), DragItemBox);
        return true;
    }
    return false;
    //return;    
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    SelectItem(BTROItemBoxHK(DragBox.GetRenderObject()).ItemInfo, BTROItemBoxHK(DragBox.GetRenderObject()).instanceInfo, true);
    // End:0xBE
    if((int(MenuButton[4].MenuState) != int(4)) && Sender.Class == Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK')
    {
        InvenGroup.SelectButton(BTItemBoxButtonHK(Sender).ButtonID);
        EquipItem();
    }
    DragBox.EndDrag();
    //return;    
}

function bool ButtonWeapon_OnBeginDrag(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    Log("ButtonWeapon_OnBeginDrag");
    btn = BTItemBoxButtonHK(Sender);
    // End:0x13C
    if(((btn.bDropSource == true) && DragBox.IsDragging() == false) && btn.itemBox.ItemInfo != none)
    {
        DragItemBox.AWinPos = btn.itemBox.AWinPos;
        DragItemBox.ItemInfo = btn.itemBox.ItemInfo;
        DragItemBox.instanceInfo = btn.itemBox.instanceInfo;
        DragItemBox.Update();
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), DragItemBox, btn.ButtonID);
        return true;
    }
    return false;
    //return;    
}

function ButtonWeapon_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ButtonWeapon_OnEndDrag" @ string(Sender));
    // End:0x49
    if(Sender.Class == Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK')
    {
        ButtonWeapon_OnClick(Sender);        
    }
    else
    {
        // End:0x69
        if(Sender != none)
        {
            UnequipItem(DragBox.GetOptionalIndex());
        }
    }
    DragBox.EndDrag();
    //return;    
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    InvenGroup.SelectButton(btn.ButtonID);
    SelectItem(ButtonWeapon[btn.ButtonID].itemBox.ItemInfo, ButtonWeapon[btn.ButtonID].itemBox.instanceInfo, true);
    return true;
    //return;    
}

function bool ButtonWeapon_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipItem(btn.ButtonID);
    return true;
    //return;    
}

function bool BTWindowModifyHK_OnOK(GUIComponent Sender)
{
    local BTROItemBoxHK itemBox;
    local export editinline BTWindowModifyHK WinModify;

    WinModify = BTWindowModifyHK(Controller.TopPage());
    itemBox = BTRORadioItemBoxHK(WinModify.ACLList.GetLastSelectedItem()).itemBox;
    TcpChannel.sfReqModifyWeapon(itemBox.instanceInfo.UniqueID, itemBox.instanceInfo.PartID, WinModify.GetPaintingID());
    return true;
    //return;    
}

function bool BTWindowDefineSelectHK_IsQuickSlotItem(GUIComponent Sender)
{
    Log("[BTTPInventoryWeaponHK::BTWindowDefineSelectHK_IsQuickSlotItem]");
    Controller.CloseMenu(false);
    // End:0xBC
    if(__NFUN_920__(InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 0))
    {
        TcpChannel.sfReqSellShopItemInfo(InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 1);
    }
    return true;
    //return;    
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
    // End:0xB4
    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ro.ItemInfo.ItemName);
        return true;
    }
    switch(btn.ButtonID)
    {
        // End:0x18E
        case 0:
            // End:0x164
            if(__NFUN_920__(ro.instanceInfo.UniqueID, 0) && GameMgr.IsQuickSlotBoxItem(ro.instanceInfo.UniqueID))
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 20, ro.ItemInfo.ItemName);
                BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_IsQuickSlotItem;                
            }
            else
            {
                TcpChannel.sfReqSellShopItemInfo(ro.instanceInfo.UniqueID, 1);
            }
            // End:0x899
            break;
        // End:0x226
        case 1:
            Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
            BTWindowModifyHK(Controller.TopPage()).SetData(ro.ItemInfo, ro.instanceInfo);
            BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
            // End:0x899
            break;
        // End:0x7EC
        case 2:
            CurrentRepairMode = 2;
            EquipItemCount = 0;
            EquipItemList.Length = 0;
            InvenItemList.Length = 0;
            Equip_DamegeItemNames.Length = 0;
            Inven_DamegeItemNames.Length = 0;
            i = 0;
            J0x261:

            // End:0x3FD [Loop If]
            if(i < 4)
            {
                ro = ButtonWeapon[i].itemBox;
                // End:0x3F3
                if((ro.instanceInfo != none) && ro.ItemInfo.CostType == 0)
                {
                    // End:0x3F3
                    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                    {
                        rilist.Length = rilist.Length + 1;
                        rilist[rilist.Length - 1] = ro.instanceInfo.UniqueID;
                        EquipItemList.Length = EquipItemList.Length + 1;
                        EquipItemList[EquipItemList.Length - 1] = ro.instanceInfo.UniqueID;
                        EquipItemCount++;
                        InvenItemList.Length = InvenItemList.Length + 1;
                        InvenItemList[InvenItemList.Length - 1] = ro.instanceInfo.UniqueID;
                        // End:0x3F3
                        if(ro.instanceInfo.DamageDegree >= 80000)
                        {
                            Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ro.ItemName.Text;
                            Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x261;
            }
            i = 0;
            J0x404:

            // End:0x611 [Loop If]
            if(i < GameMgr.QuickSlotBoxList.Length)
            {
                j = 0;
                J0x424:

                // End:0x607 [Loop If]
                if(j < 4)
                {
                    UniqueID = GameMgr.QuickSlotBoxList[i].UniqueID[j];
                    // End:0x5FD
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()) && GameMgr.IsBlockedItemIdx(UniqueID) == false)
                    {
                        ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
                        // End:0x4D5
                        if(ItemInfo.CostType != 0)
                        {
                            // [Explicit Continue]
                            goto J0x5FD;
                        }
                        instanceInfo = GameMgr.FindInstanceItem(UniqueID);
                        k = 0;
                        J0x4F6:

                        // End:0x529 [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x51F
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x529;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x4F6;
                        }
                        J0x529:

                        // End:0x5FD
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            EquipItemList.Length = EquipItemList.Length + 1;
                            EquipItemList[EquipItemList.Length - 1] = UniqueID;
                            EquipItemCount++;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x5FD
                            if(instanceInfo.DamageDegree >= 80000)
                            {
                                Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ItemInfo.ItemName;
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ItemInfo.ItemName;
                            }
                        }
                    }
                    J0x5FD:

                    j++;
                    // [Loop Continue]
                    goto J0x424;
                }
                i++;
                // [Loop Continue]
                goto J0x404;
            }
            i = 0;
            J0x618:

            // End:0x7D5 [Loop If]
            if(i < TPItemList.ItemList.DataPool.Length)
            {
                ro = TPItemList.ItemList.DataPool[i];
                // End:0x7CB
                if(((ro.ItemInfo.ItemType <= 4) && ro.ItemInfo.CostType == 0) && GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                {
                    UniqueID = ro.instanceInfo.UniqueID;
                    // End:0x7CB
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()))
                    {
                        k = 0;
                        J0x6FD:

                        // End:0x730 [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x726
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x730;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x6FD;
                        }
                        J0x730:

                        // End:0x7CB
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x7CB
                            if(ro.instanceInfo.DamageDegree >= 80000)
                            {
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                            }
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x618;
            }
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x899
            break;
        // End:0x837
        case 3:
            CurrentRepairMode = 3;
            rilist.Length = 1;
            rilist[0] = ro.instanceInfo.UniqueID;
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x899
            break;
        // End:0x896
        case 4:
            // End:0x849
            if(ro == none)
            {
                return true;
            }
            // End:0x870
            if(ro.instanceInfo.SlotPosition == 13)
            {
                EquipItem();                
            }
            else
            {
                UnequipItem(GetButtonWeaponID(ro.instanceInfo.UniqueID));
            }
            // End:0x899
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3B
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;        
    }
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
    //return;    
}

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8C [Loop If]
    if(i < 10)
    {
        // End:0x82
        if((ButtonWeapon[i].itemBox.instanceInfo != none) && __NFUN_912__(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
        {
            ButtonWeapon[i].SetData(none, none);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
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
            // End:0x8F
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x8F
            break;
        // End:0x6B
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x8F
            break;
        // End:0x7E
        case 4:
            ChangeSubButton(astrSubMenuCash);
            // End:0x8F
            break;
        // End:0xFFFF
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0x8F
            break;
            break;
    }
    ChangeItemList(tabi, subtabi, bForce);
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
    //return;    
}

function RefreshItemList()
{
    ChangeItemList(TabControl[0].GetVisiblePanelIndex(), TabControl[1].GetVisiblePanelIndex());
    //return;    
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
                // End:0x25A
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
                    // End:0x306
                    if(mainTab == 4)
                    {
                        // End:0x289
                        if((SaveMainTab == mainTab) && SaveSubTab == subTab)
                        {                            
                        }
                        else
                        {
                            switch(subTab)
                            {
                                // End:0x303
                                case 0:
                                    // End:0x300
                                    if(dele_sfReqWebzenInvenList("S"))
                                    {
                                        Class'GUIWarfareControls_Decompressed.BTWindowDefineStateHK'.static.ShowState(Controller, 5);
                                        BTWindowDefineStateHK(Controller.TopPage()).StartTimeOut(10.0000000);
                                        BTWindowDefineStateHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowDefineStateHK_sfReqWebzenInvenListS_OnTimeOut;
                                    }
                                    // End:0x306
                                    break;
                                // End:0xFFFF
                                default:
                                    break;
                            }
                        }
                    }
                    else
                    {
                    }
                }
            }
        }
        SaveMainTab = mainTab;
        SaveSubTab = subTab;
        SetInfoBox();
        //return;        
    }
}

function BTWindowDefineStateHK_sfReqWebzenInvenListS_OnTimeOut(GUIComponent Sender)
{
    dele_StopWebzenWebzenInvenList();
    BTWindowDefineStateHK(Controller.TopPage()).FadeOut(false, true);
    //return;    
}

delegate dele_StopWebzenWebzenInvenList()
{
    //return;    
}

delegate bool dele_sfReqWebzenInvenList(string Type)
{
    //return;    
}

function SetInfoBox(optional int ItemIndex)
{
    InfoBox.ItemBoxView.itemBox.MyData = TPItemList.MyData;
    SelectItem(BTROItemBoxHK(TPItemList.ItemList.DataList[ItemIndex]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[ItemIndex]).instanceInfo);
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

function bool BTWindowCreateClanMarkHK_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowCreateClanMarkHK_OnOK]");
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x259
    if(BTWindow != none)
    {
        // End:0xA3
        if((BTWindow.PaidType == 2) && BTWindow.bCheckDupSuccess == false)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 149);
            return true;
        }
        MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
        // End:0x197
        if(BTWindow.PaidType == 1)
        {
            // End:0x12D
            if((BTWindow.SelectClanMark[0] == 0) || BTWindow.SelectClanMark[1] == 0)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
                return true;
            }
            MM.kTcpChannel.sfReqPaidItem_ChangeClanMark(BTWindow.UniqueID, byte(BTWindow.PaidType), BTWindow.SelectClanMark[0], BTWindow.SelectClanMark[1], BTWindow.SelectClanMark[2]);            
        }
        else
        {
            // End:0x259
            if(BTWindow.PaidType == 2)
            {
                // End:0x1F2
                if((BTWindow.ChooseClanMark[0] == 0) || BTWindow.ChooseClanMark[1] == 0)
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
                    return true;
                }
                MM.kTcpChannel.sfReqPaidItem_ChangeClanMark(BTWindow.UniqueID, byte(BTWindow.PaidType), BTWindow.ChooseClanMark[0], BTWindow.ChooseClanMark[1], BTWindow.ChooseClanMark[2]);
            }
        }
    }
    return true;
    //return;    
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
        // End:0xC4
        if((BTWindow.PaidType == 2) && (BTWindow.SelectClanMark[0] == 0) || BTWindow.SelectClanMark[1] == 0)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
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
        // End:0x1A0
        if(MM.kTcpChannel == none)
        {
            Log("MM.kTcpChannel is None");
        }
        Log(((((((("MM.kTcpChannel.sfReqPaidItem_ClanMarkDupCheck(" $ string(BTWindow.PaidType)) $ ", ") $ string(BTWindow.ChooseClanMark[0])) $ ", ") $ string(BTWindow.ChooseClanMark[1])) $ ", ") $ string(BTWindow.ChooseClanMark[2])) $ ")");
        MM.kTcpChannel.sfReqPaidItem_ClanMarkDupCheck(byte(BTWindow.PaidType), BTWindow.ChooseClanMark[0], BTWindow.ChooseClanMark[1], BTWindow.ChooseClanMark[2]);
    }
    return true;
    //return;    
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
        Log(((((("sfReqWebzenBillingUseStorageItem(" $ string(BTWindow.ExtraData_int)) $ ", ") $ string(BTWindow.ExtraData_int2)) $ ", ") $ string(BTWindow.ExtraData_int3)) $ ")");
        MM.kTcpChannel.sfReqWebzenBillingUseStorageItem(BTWindow.ExtraData_int, BTWindow.ExtraData_int2, byte(BTWindow.ExtraData_int3));
        BTWindow.ButtonOK.DisableMe();
        BTWindow.FadeOut(false, true);
    }
    return true;
    //return;    
}

function bool BTWindowDefineARHK_ItemUse_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;
    local export editinline BTWindowDefineARHK BTWindow;
    local wGameManager GameMgr;
    local string filter;
    local int Temp;

    Log("[BTTPInventoryWeaponHK::BTWindowDefineARHK_ItemUse_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x98C
    if(BTWindow != none)
    {
        Log("PaidItem Use = " $ string(BTWindow.ExtraData_int));
        switch(BTWindow.ExtraData_int)
        {
            // End:0xFD
            case 17004:
            // End:0x227
            case 17075:
                // End:0x13C
                if(BTWindow.EditName.TextStr == "")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);                    
                }
                else
                {
                    // End:0x20E
                    if(GameMgr.FilterBadWords(BTWindow.EditName.TextStr) == false)
                    {
                        Log(((("MM.kTcpChannel.sfReqPaidItem_BroadCast(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 1, ") $ BTWindow.EditName.TextStr) $ ")");
                        MM.kTcpChannel.sfReqPaidItem_BroadCast(BTWindow.ExtraData_btrdouble, 1, BTWindow.EditName.TextStr);                        
                    }
                    else
                    {
                        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 146);
                    }
                }
                // End:0x963
                break;
            // End:0x22F
            case 17005:
            // End:0x35A
            case 17076:
                // End:0x26E
                if(BTWindow.EditName.TextStr == "")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);                    
                }
                else
                {
                    // End:0x341
                    if(GameMgr.FilterBadWords(BTWindow.EditName.TextStr) == false)
                    {
                        Log(((("MM.kTcpChannel.sfReqPaidItem_BroadCast(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 2, ") $ BTWindow.EditName.TextStr) $ ")");
                        MM.kTcpChannel.sfReqPaidItem_BroadCast(BTWindow.ExtraData_btrdouble, 2, BTWindow.EditName.TextStr);                        
                    }
                    else
                    {
                        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 146);
                    }
                }
                // End:0x963
                break;
            // End:0x3D5
            case 17012:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 2)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 2);
                // End:0x963
                break;
            // End:0x44F
            case 17013:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 1)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 1);
                // End:0x963
                break;
            // End:0x4CA
            case 17018:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 4)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 4);
                // End:0x963
                break;
            // End:0x545
            case 17082:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 5)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 5);
                // End:0x963
                break;
            // End:0x5C0
            case 17049:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 6)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 6);
                // End:0x963
                break;
            // End:0x790
            case 17011:
                // End:0x60E
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                Temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x67F
                if((Temp == -1) || BTWindow.EditName.TextStr == "none")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;                    
                }
                else
                {
                    // End:0x6B1
                    if((Temp > 16) || Temp < 4)
                    {
                        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x6E9
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log(((("MM.kTcpChannel.sfReqPaidItem_ChangeCharname(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", ") $ BTWindow.EditName.TextStr) $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeCharname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x963
                break;
            // End:0x960
            case 17017:
                // End:0x7DE
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                Temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x84F
                if((Temp == -1) || BTWindow.EditName.TextStr == "none")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;                    
                }
                else
                {
                    // End:0x881
                    if((Temp > 16) || Temp < 4)
                    {
                        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x8B9
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log(((("MM.kTcpChannel.sfReqPaidItem_ChangeClanname(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", ") $ BTWindow.EditName.TextStr) $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeClanname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x963
                break;
            // End:0xFFFF
            default:
                break;
        }
        BTWindow.ButtonOK.DisableMe();
        BTWindow.FadeOut(false, true);
    }
    return true;
    //return;    
}

function EquipItem()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMatchMaker MM;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    Log((("[BTTPInventoryWeaponHK::EquipItem] ItemInfo.ItemName=" $ ItemInfo.ItemName) $ ", ItemInfo.ItemID=") $ string(ItemInfo.ItemID));
    // End:0x18C
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x3C2
    if(instanceInfo.CashItemInfo != none)
    {
        // End:0x2B0
        if(instanceInfo.CashItemInfo.WZStoreItemType == 80)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 30, instanceInfo.CashItemInfo.WZItemName);
            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = instanceInfo.CashItemInfo.WZStoreSeq;
            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int2 = instanceInfo.CashItemInfo.WZStoreItemSeq;
            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int3 = instanceInfo.CashItemInfo.WZStoreItemType;
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ReceiveCashItem_OnOK;            
        }
        else
        {
            // End:0x3BD
            if(instanceInfo.CashItemInfo.WZStoreItemType == 67)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 50, instanceInfo.CashItemInfo.WZItemName);
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = instanceInfo.CashItemInfo.WZStoreSeq;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int2 = instanceInfo.CashItemInfo.WZStoreItemSeq;
                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int3 = instanceInfo.CashItemInfo.WZStoreItemType;
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ReceiveCashItem_OnOK;
            }
        }
        return;        
    }
    else
    {
        // End:0x41E
        if((ItemInfo.Grade == 7) && (MM.kIsRegisteredPCBang == 0) || MM.kIsPaidPCBang == 0)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
            return;            
        }
        else
        {
            // End:0x463
            if(ItemInfo.ItemType == 25)
            {
                TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID);
                return;                
            }
            else
            {
                // End:0xDBE
                if(ItemInfo.ItemType == 26)
                {
                    switch(ItemInfo.ItemID)
                    {
                        // End:0x490
                        case 17004:
                        // End:0x54F
                        case 17075:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 15);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                            // End:0xDB9
                            break;
                        // End:0x557
                        case 17005:
                        // End:0x616
                        case 17076:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 16);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                            // End:0xDB9
                            break;
                        // End:0x6B2
                        case 17012:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 9);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            // End:0xDB9
                            break;
                        // End:0x74E
                        case 17013:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 13);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            // End:0xDB9
                            break;
                        // End:0x7EA
                        case 17018:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 3);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            // End:0xDB9
                            break;
                        // End:0x886
                        case 17082:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 57);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            // End:0xDB9
                            break;
                        // End:0x922
                        case 17049:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 59);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            // End:0xDB9
                            break;
                        // End:0xA1F
                        case 17011:
                            Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 7);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kUserName;
                            BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kUserName);
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;
                            // End:0xDB9
                            break;
                        // End:0xB4A
                        case 17017:
                            // End:0xB31
                            if(MM.kClanName != "")
                            {
                                Class'GUIWarfareControls_Decompressed.BTWindowDefineARHK'.static.ShowInfo(Controller, 5);
                                BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                                BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                                BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kClanName;
                                BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kClanName);
                                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_ItemUse_OnOK;                                
                            }
                            else
                            {
                                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 150);
                            }
                            // End:0xDB9
                            break;
                        // End:0xC74
                        case 17014:
                            Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                            BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                            BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(2);
                            BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                            BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanMarkHK_OnOK;
                            BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = BTWindowCreateClanMarkHK_IsExist_OnOK;
                            // End:0xDB9
                            break;
                        // End:0xD9D
                        case 17019:
                            Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                            BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                            BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(1);
                            BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                            BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanMarkHK_OnOK;
                            BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = BTWindowCreateClanMarkHK_IsExist_OnOK;
                            // End:0xDB9
                            break;
                        // End:0xDA8
                        case 17015:
                            // End:0xDB9
                            break;
                        // End:0xDB3
                        case 17016:
                            // End:0xDB9
                            break;
                        // End:0xFFFF
                        default:
                            // End:0xDB9
                            break;
                            break;
                    }
                    return;                    
                }
                else
                {
                    // End:0xDF5
                    if(ItemInfo.ItemType == 27)
                    {
                        TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID);
                        return;                        
                    }
                    else
                    {
                        // End:0xE0D
                        if(ItemInfo.ItemType == 29)
                        {                            
                        }
                        else
                        {
                            // End:0xE24
                            if(ItemInfo.ItemType >= 9)
                            {
                                return;
                            }
                        }
                    }
                }
            }
        }
    }
    currentSlot = InvenGroup.GetSelectIndex();
    // End:0xE6E
    if((ItemInfo.ItemType <= 2) && currentSlot != 0)
    {
        InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0xEA3
        if((ItemInfo.ItemType == 3) && currentSlot != 1)
        {
            InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0xFAD
            if(ItemInfo.ItemType == 4)
            {
                // End:0xF4B
                if((currentSlot != 2) && currentSlot != 3)
                {
                    // End:0xF06
                    if(ButtonWeapon[2].itemBox.ItemInfo == none)
                    {
                        InvenGroup.SelectButton(2);                        
                    }
                    else
                    {
                        // End:0xF3A
                        if(ButtonWeapon[3].itemBox.ItemInfo == none)
                        {
                            InvenGroup.SelectButton(3);                            
                        }
                        else
                        {
                            InvenGroup.SelectButton(2);
                        }
                    }
                }
                currentSlot = InvenGroup.GetSelectIndex();
                // End:0xF85
                if((currentSlot == 2) && instanceInfo.SlotPosition == 3)
                {
                    return;
                }
                // End:0xFAA
                if((currentSlot == 3) && instanceInfo.SlotPosition == 2)
                {
                    return;
                }                
            }
            else
            {
                // End:0xFE4
                if((ItemInfo.ItemType == 5) && currentSlot != 4)
                {
                    InvenGroup.SelectButton(4);                    
                }
                else
                {
                    // End:0x101B
                    if((ItemInfo.ItemType == 6) && currentSlot != 5)
                    {
                        InvenGroup.SelectButton(5);                        
                    }
                    else
                    {
                        // End:0x1052
                        if((ItemInfo.ItemType == 7) && currentSlot != 6)
                        {
                            InvenGroup.SelectButton(6);                            
                        }
                        else
                        {
                            // End:0x114E
                            if(ItemInfo.ItemType == 8)
                            {
                                // End:0x108F
                                if(ItemInfo.EquipTeam == 1)
                                {
                                    InvenGroup.SelectButton(7);                                    
                                }
                                else
                                {
                                    // End:0x10B8
                                    if(ItemInfo.EquipTeam == 2)
                                    {
                                        InvenGroup.SelectButton(8);                                        
                                    }
                                    else
                                    {
                                        // End:0x114B
                                        if((currentSlot != 7) && currentSlot != 8)
                                        {
                                            // End:0x1106
                                            if(ButtonWeapon[7].itemBox.ItemInfo == none)
                                            {
                                                InvenGroup.SelectButton(8);                                                
                                            }
                                            else
                                            {
                                                // End:0x113A
                                                if(ButtonWeapon[8].itemBox.ItemInfo == none)
                                                {
                                                    InvenGroup.SelectButton(8);                                                    
                                                }
                                                else
                                                {
                                                    InvenGroup.SelectButton(7);
                                                }
                                            }
                                        }
                                    }
                                }                                
                            }
                            else
                            {
                                // End:0x1174
                                if(ItemInfo.ItemType == 29)
                                {
                                    InvenGroup.SelectButton(9);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    currentSlot = InvenGroup.GetSelectIndex();
    // End:0x120B
    if(currentSlot < 4)
    {
        // End:0x11AF
        if(currentSlot == instanceInfo.SlotPosition)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, InvenGroup.GetSelectIndex());
        PlayerOwner().PlaySound(Controller.ItemEquipSuccessSound, 6, 1.0000000);        
    }
    else
    {
        // End:0x122D
        if(currentSlot == ((instanceInfo.SlotPosition - 18) + 4))
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, (InvenGroup.GetSelectIndex() + 18) - 4);
        PlayerOwner().PlaySound(Controller.ItemEquipSuccessSound, 6, 1.0000000);
    }
    //return;    
}

function int GetButtonWeaponID(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xC7 [Loop If]
    if(i < 10)
    {
        // End:0xBD
        if(((ButtonWeapon[i].itemBox != none) && ButtonWeapon[i].itemBox.instanceInfo != none) && ButtonWeapon[i].itemBox.ItemInfo != none)
        {
            // End:0xBD
            if(__NFUN_912__(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
            {
                return ButtonWeapon[i].ButtonID;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ib = ButtonWeapon[ButtonID];
    // End:0x1E7
    if(ib.itemBox.instanceInfo != none)
    {
        // End:0xC9
        if((ib.itemBox.ItemInfo.ItemID == GameMgr.GetMainWeaponID()) || ib.itemBox.ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        // End:0x120
        if(ib.itemBox.instanceInfo.SlotPosition == 0)
        {
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);            
        }
        else
        {
            // End:0x177
            if(ib.itemBox.instanceInfo.SlotPosition == 1)
            {
                TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);                
            }
            else
            {
                TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
            }
        }
        PlayerOwner().PlaySound(Controller.ItemTakeoffSound, 6, 1.0000000);
    }
    //return;    
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
    J0xF0:

    // End:0x236 [Loop If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        ro.instanceInfo = instanceInfo;
        // End:0x1AA
        if(__NFUN_919__(instanceInfo.UniqueID, 0))
        {
            ro.ChangeState(5);            
        }
        else
        {
            ro.ChangeState(3);
        }
        ro.MyData = TPItemList.MyData;
        ro.SetMatchMaker(MM);
        ro.SetGameManager(GameMgr);
        ro.Update();
        TPItemList.ItemList.AddItem(ro);
        i++;
        // [Loop Continue]
        goto J0xF0;
    }
    i = 0;
    J0x23D:

    // End:0x7E2 [Loop If]
    if(i < GameMgr.kWZInvenList.Length)
    {
        // End:0x55E
        if(int(GameMgr.kWZInvenList[i].ItemType) == 80)
        {
            wsp = GameMgr.GetWebzenShopProduct(GameMgr.kWZInvenList[i].ProductSeq, GameMgr.kWZInvenList[i].PriceSeq);
            cii = new Class'Engine.wItemBoxCashHK';
            cii.WZStoreSeq = GameMgr.kWZInvenList[i].Seq;
            cii.WZStoreItemSeq = GameMgr.kWZInvenList[i].ItemSeq;
            cii.WZStoreItemType = int(GameMgr.kWZInvenList[i].ItemType);
            cii.WZItemName = wsp.ProductName;
            cii.WZPeriod[0] = wsp.Value;
            ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
            ro.Init();
            ro.ItemInfo = GameMgr.FindUIItem(wsp.ItemID);
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
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
            // [Explicit Continue]
            goto J0x7D8;
        }
        // End:0x7D8
        if(int(GameMgr.kWZInvenList[i].ItemType) == 67)
        {
            cii = new Class'Engine.wItemBoxCashHK';
            cii.WZStoreSeq = GameMgr.kWZInvenList[i].Seq;
            cii.WZStoreItemSeq = GameMgr.kWZInvenList[i].ItemSeq;
            cii.WZStoreItemType = int(GameMgr.kWZInvenList[i].ItemType);
            cii.WZPeriod[0] = __NFUN_923__(GameMgr.kWZInvenList[i].CashPoint);
            cii.WZItemName = string(cii.WZPeriod[0]) @ strCash;
            ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
            ro.Init();
            ro.ItemInfo = new Class'Engine.wItemBoxHK';
            ro.ItemInfo.bSkill = true;
            ro.ItemInfo.ItemType = 999;
            instanceInfo = new Class'Engine.wItemBoxInstanceHK';
            instanceInfo.CashItemInfo = cii;
            instanceInfo.SlotPosition = 13;
            ro.instanceInfo = instanceInfo;
            Log("ro.InstanceInfo.CashItemInfo.WZItemName=" $ ro.instanceInfo.CashItemInfo.WZItemName);
            ro.ChangeState(4);
            ro.MyData = TPItemList.MyData;
            ro.Update();
            ro.ItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.item_item_cash;
            TPItemList.ItemList.AddItem(ro);
        }
        J0x7D8:

        i++;
        // [Loop Continue]
        goto J0x23D;
    }
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ImageList.__OnDblClick__Delegate = ImageListBox_OnDblClick;
    TPItemList.ItemList.ShowWeaponWithEquip();
    //return;    
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

    // End:0xCC [Loop If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xC2
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xC2
            if(ItemInfo != none)
            {
                ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    i = 18;
    J0xD4:

    // End:0x172 [Loop If]
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
                ButtonWeapon[(i - 18) + 4].SetData(ItemInfo, instanceInfo);
            }
        }
        i++;
        // [Loop Continue]
        goto J0xD4;
    }
    CharacterModel.ChangeEquipItem(GameMgr);
    CharacterModel.ChangeWeapon(ButtonWeapon[0].itemBox.instanceInfo.ItemID, ButtonWeapon[0].itemBox.instanceInfo.PartID, ButtonWeapon[0].itemBox.instanceInfo.PaintID);
    //return;    
}

function InitializeLeftPanel()
{
    local int i;

    EdgeLine = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    EdgeLine.bUseAWinPos = true;
    EdgeLine.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 332.0000000, 728.0000000);
    EdgeLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_line;
    EdgeLine.InitComponent(Controller, self);
    AppendComponent(EdgeLine);
    AFTeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(20.0000000, 120.0000000, 329.0000000, 725.0000000);
    AFTeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.1000000;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(20.0000000, 120.0000000, 329.0000000, 725.0000000);
    RSATeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.1000000;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(304), AFTeamBG.AWinPos.Y1 + float(536)), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(57), AFTeamBG.AWinPos.Y1 + float(536)), 0.8000000);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(25), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(143), AFTeamBG.AWinPos.Y1 + float(571)), 0.8000000);
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(166), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(283), AFTeamBG.AWinPos.Y1 + float(571)), 0.8000000);
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x50C:

    // End:0x5F6 [Loop If]
    if(i < 10)
    {
        ButtonWeapon[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonWeapon[i]);
        i++;
        // [Loop Continue]
        goto J0x50C;
    }
    ButtonWeapon[2].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[3].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[4].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_hlmt;
    ButtonWeapon[5].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_face;
    ButtonWeapon[6].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_gogl;
    ButtonWeapon[7].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[8].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[9].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_class;
    i = 0;
    J0x6FD:

    // End:0x747 [Loop If]
    if(i < 10)
    {
        ButtonWeapon[i].__OnClick__Delegate = ButtonWeapon_OnClick;
        ButtonWeapon[i].__OnDblClick__Delegate = ButtonWeapon_OnDblClick;
        i++;
        // [Loop Continue]
        goto J0x6FD;
    }
    ChatBox = new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(22.0000000, 666.0000000 + float(18), 324.0000000, 720.0000000);
    ChatBox.RenderWeight = 0.7100000;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    UIModel = new Class'GUIWarfareControls_Decompressed.BTModelHK';
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
    UIModel.RenderWeight = 0.7000000;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
    // End:0x967
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        UIModel.bAcceptsInput = true;
    }
    //return;    
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;
    local wMatchMaker MM;

    LabelItemList = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new Class'GUIWarfareControls_Decompressed.BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShowOnlyInventory = true;
    TPItemList.ItemList.BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_inven_in;
    TPItemList.ItemList.BackgroundPattern.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_inven;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 5;
    i = 0;
    J0x17C:

    // End:0x3AF [Loop If]
    if(i < MenuLen)
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
        // End:0x2DD
        if(i == (5 - 1))
        {
            serverButton.SetPaidItemTabButtonImage();
            serverButton.SetPaidItemTabButtonFontColor();
        }
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
        goto J0x17C;
    }
    i = 0;
    J0x3B6:

    // End:0x65D [Loop If]
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
        goto J0x3B6;
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
    J0x72B:

    // End:0x84E [Loop If]
    if(i < 5)
    {
        MenuButton[i] = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        MenuButton[i].Caption = strMenuButton[i];
        MenuButton[i].bUseAWinPos = true;
        MenuButton[i].AWinPos = fbMenuButton[i];
        MenuButton[i].SetFontSizeAll(12);
        MenuButton[i].SetDefaultFontColor();
        MenuButton[i].SetDefaultButtonImage();
        MenuButton[i].RenderWeight = 0.6000000;
        MenuButton[i].ButtonID = i;
        MenuButton[i].InitComponent(Controller, self);
        AppendComponent(MenuButton[i]);
        i++;
        // [Loop Continue]
        goto J0x72B;
    }
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x85E:

    // End:0x88F [Loop If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        i++;
        // [Loop Continue]
        goto J0x85E;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x89F:

    // End:0x8D0 [Loop If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x89F;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x8E0:

    // End:0x911 [Loop If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        i++;
        // [Loop Continue]
        goto J0x8E0;
    }
    i = 0;
    J0x918:

    // End:0x945 [Loop If]
    if(i < 4)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        i++;
        // [Loop Continue]
        goto J0x918;
    }
    astrSubMenuCash.Length = 1;
    i = 0;
    J0x954:

    // End:0x985 [Loop If]
    if(i < astrSubMenuCash.Length)
    {
        astrSubMenuCash[i] = strSubMenuCash[i];
        i++;
        // [Loop Continue]
        goto J0x954;
    }
    ChangeSubButton(astrSubMenuAll);
    i = 0;
    J0x997:

    // End:0x9C7 [Loop If]
    if(i < 5)
    {
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x997;
    }
    SaveMainTab = -1;
    SaveSubTab = -1;
    //return;    
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new Class'GUIWarfareControls_Decompressed.DragObject';
    DragBox.Init();
    DragItemBox = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    DragItemBox.Init();
    DragItemBox.bDragMode = true;
    i = 0;
    J0x54:

    // End:0xC5 [Loop If]
    if(i < 10)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = ButtonWeapon_OnBeginDrag;
        btn.__OnEndDrag__Delegate = ButtonWeapon_OnEndDrag;
        i++;
        // [Loop Continue]
        goto J0x54;
    }
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

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        Image=Texture'Warfare_UI_UI.Common.panel_1'
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=337.0000000,Y1=117.0000000,X2=493.0000000,Y2=202.0000000)
    fbButtonWeapon[1]=(X1=337.0000000,Y1=204.0000000,X2=493.0000000,Y2=289.0000000)
    fbButtonWeapon[2]=(X1=337.0000000,Y1=291.0000000,X2=413.0000000,Y2=376.0000000)
    fbButtonWeapon[3]=(X1=415.0000000,Y1=291.0000000,X2=493.0000000,Y2=376.0000000)
    fbButtonWeapon[4]=(X1=337.0000000,Y1=465.0000000,X2=493.0000000,Y2=550.0000000)
    fbButtonWeapon[5]=(X1=337.0000000,Y1=552.0000000,X2=413.0000000,Y2=637.0000000)
    fbButtonWeapon[6]=(X1=415.0000000,Y1=552.0000000,X2=493.0000000,Y2=637.0000000)
    fbButtonWeapon[7]=(X1=337.0000000,Y1=639.0000000,X2=413.0000000,Y2=724.0000000)
    fbButtonWeapon[8]=(X1=415.0000000,Y1=639.0000000,X2=493.0000000,Y2=724.0000000)
    fbButtonWeapon[9]=(X1=337.0000000,Y1=378.0000000,X2=413.0000000,Y2=463.0000000)
    strButtonWeapon[0]="? ??"
    strButtonWeapon[1]="?? ??"
    strButtonWeapon[2]="?? ??"
    strButtonWeapon[3]="?? ??"
    strButtonWeapon[4]="??"
    strButtonWeapon[5]="??"
    strButtonWeapon[6]="????"
    strButtonWeapon[7]="AF ??"
    strButtonWeapon[8]="RSA ??"
    strButtonWeapon[9]="????"
    strAF="AF"
    strRSA="RSA"
    strMainMenu[0]="??"
    strMainMenu[1]="??"
    strMainMenu[2]="??"
    strMainMenu[3]="??"
    strMainMenu[4]="?? ???"
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
    strSubMenuCash="??"
    // Referen[0]ce: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK.mTabControl2'
    begin object name="mTabControl2" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0000000,Y1=137.0000000,X2=1014.0000000,Y2=558.0000000)
    fbTPItemList=(X1=517.0000000,Y1=167.0000000,X2=1011.0000000,Y2=515.0000000)
    strMenuButton[0]="??"
    strMenuButton[1]="??"
    strMenuButton[2]="?? ??"
    strMenuButton[3]="??"
    strMenuButton[4]="??"
    strMenuButton[5]="??"
    strMenuButton[6]="??"
    fbMenuButton[0]=(X1=519.0000000,Y1=520.0000000,X2=613.0000000,Y2=552.0000000)
    fbMenuButton[1]=(X1=617.0000000,Y1=520.0000000,X2=711.0000000,Y2=552.0000000)
    fbMenuButton[2]=(X1=715.0000000,Y1=520.0000000,X2=809.0000000,Y2=552.0000000)
    fbMenuButton[3]=(X1=813.0000000,Y1=520.0000000,X2=907.0000000,Y2=552.0000000)
    fbMenuButton[4]=(X1=911.0000000,Y1=520.0000000,X2=1004.0000000,Y2=552.0000000)
    strCash="??"
    OnPreDraw=BTTPInventoryWeaponHK.Internal_OnPreDraw
    OnRendered=BTTPInventoryWeaponHK.Internal_OnRendered
}