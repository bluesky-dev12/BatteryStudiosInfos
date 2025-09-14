class BTPageInventory extends BTNetGUIPageHK
    editinlinenew
    instanced;

var int MoveHeaderButtonID;
var int LastReqRepairMode;
var int RepairAllButtonID;
var BtrDouble SellShopItemInfo_UniqueItemID;
var BtrDouble Repair_UniqueItemID;
var localized string strSellingSuccess[3];
var Color CashColor;
var Color PointColor;
var bool bDragging;
var int DragPosX;
var int DragPosY;
var int DragButtonIndex;
var FloatBox DragAWinPos;
var BTROItemBoxHK DragBox;
var() automated FloatBox fbLabelPoint;
var() automated FloatBox fbLabelCash;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var() automated FloatBox fbLabelP;
var() automated FloatBox fbLabelC;
var export editinline BTOwnerDrawImageHK LabelP;
var export editinline BTOwnerDrawImageHK LabelC;
var() automated BTTPInventoryHK TPInventory;
var() automated BTTPWarehouseSkillHK TPWarehouseSkill;
var() automated BTTPWarehouseQuickSlotHK TPWarehouseQS;

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
            // End:0x2C7
            break;
        // End:0x8A
        case 1:
            page_Main.SetPage(20, true);
            // End:0x2C7
            break;
        // End:0xA4
        case 2:
            page_Main.SetPage(21, true);
            // End:0x2C7
            break;
        // End:0xBE
        case 4:
            page_Main.SetPage(18, true);
            // End:0x2C7
            break;
        // End:0x1D7
        case 5:
            // End:0xED
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, true);                
            }
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2C7
            break;
        // End:0x1DF
        case 6:
            // End:0x2C7
            break;
        // End:0x1E7
        case 7:
            // End:0x2C7
            break;
        // End:0x1FE
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2C7
            break;
        // End:0x23A
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2C7
            break;
        // End:0x281
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x2C7
            break;
        // End:0x2C4
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x2C7
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function UpdateQuickSlot(int i)
{
    local int arQslotID, arSkill1, arSkill2, arSkill3, arSkill4;

    local BtrDouble arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2;
    local string arQslotName;
    local wItemBoxHK ItemInfo;

    arQslotID = GameMgr.QuickSlotBoxList[i].QuickSlotID;
    arQslotName = GameMgr.QuickSlotBoxList[i].QuickSlotName;
    arMWItemID = GameMgr.QuickSlotBoxList[i].UniqueID[0];
    arPistolItemID = GameMgr.QuickSlotBoxList[i].UniqueID[1];
    arTWItemID1 = GameMgr.QuickSlotBoxList[i].UniqueID[2];
    arTWItemID2 = GameMgr.QuickSlotBoxList[i].UniqueID[3];
    arSkill1 = GameMgr.QuickSlotBoxList[i].UniqueSkillID[0];
    arSkill2 = GameMgr.QuickSlotBoxList[i].UniqueSkillID[1];
    arSkill3 = GameMgr.QuickSlotBoxList[i].UniqueSkillID[2];
    arSkill4 = GameMgr.QuickSlotBoxList[i].UniqueSkillID[3];
    PlayerOwner().dblog("[BTPageInventory::UpdateQuickSlot]");
    PlayerOwner().dblog("===============================================");
    PlayerOwner().dblog((((("DispOrder = " $ string(i)) $ ", QSlotID = ") $ string(arQslotID)) $ ", QSlotName = ") $ arQslotName);
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[0]);
    // End:0x2C3
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("0 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[1]);
    // End:0x34F
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("1 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[2]);
    // End:0x3DC
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("2 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[3]);
    // End:0x469
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("3 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[0]);
    // End:0x4F7
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("0 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[1]);
    // End:0x585
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("1 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[2]);
    // End:0x614
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("2 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[3]);
    // End:0x6A3
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("3 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    page_Main.TcpChannel.sfReqUpdateQSlot(arQslotID, arQslotName, arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2, arSkill1, arSkill2, arSkill3, arSkill4);
    //return;    
}

function bool TPWarehouseSkill_MenuButton_OnClick(GUIComponent Sender)
{
    EquipSkill();
    return true;
    //return;    
}

function bool TPWarehouseQS_MenuButton_OnClick(GUIComponent Sender)
{
    local int i, j, k;
    local BtrDouble UniqueID;
    local BTROItemBoxHK ro;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local array<BtrDouble> rilist;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ro = TPWarehouseQS.InfoBox.ItemBoxView.itemBox;
    // End:0x8E
    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ro.ItemInfo.ItemName);
        return true;
    }
    switch(btn.ButtonID)
    {
        // End:0x168
        case 0:
            // End:0x13E
            if(__NFUN_920__(ro.instanceInfo.UniqueID, 0) && GameMgr.IsQuickSlotBoxItem(ro.instanceInfo.UniqueID))
            {
                Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 20, ro.ItemInfo.ItemName);
                BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_IsQuickSlotItem;                
            }
            else
            {
                TcpChannel.sfReqSellShopItemInfo(ro.instanceInfo.UniqueID, 1);
            }
            // End:0x9EB
            break;
        // End:0x200
        case 1:
            Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
            BTWindowModifyHK(Controller.TopPage()).SetData(ro.ItemInfo, ro.instanceInfo);
            BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
            // End:0x9EB
            break;
        // End:0x970
        case 2:
            TPInventory.TPWeapon.CurrentRepairMode = 2;
            TPInventory.TPWeapon.EquipItemCount = 0;
            TPInventory.TPWeapon.EquipItemList.Length = 0;
            TPInventory.TPWeapon.InvenItemList.Length = 0;
            TPInventory.TPWeapon.Equip_DamegeItemNames.Length = 0;
            TPInventory.TPWeapon.Inven_DamegeItemNames.Length = 0;
            i = 0;
            J0x2A7:

            // End:0x4D1 [Loop If]
            if(i < 4)
            {
                ro = TPInventory.TPWeapon.ButtonWeapon[i].itemBox;
                // End:0x4C7
                if((ro.instanceInfo != none) && ro.ItemInfo.CostType == 0)
                {
                    // End:0x4C7
                    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                    {
                        rilist.Length = rilist.Length + 1;
                        rilist[rilist.Length - 1] = ro.instanceInfo.UniqueID;
                        TPInventory.TPWeapon.EquipItemList[TPInventory.TPWeapon.EquipItemList.Length] = ro.instanceInfo.UniqueID;
                        TPInventory.TPWeapon.EquipItemCount++;
                        TPInventory.TPWeapon.InvenItemList[TPInventory.TPWeapon.InvenItemList.Length] = ro.instanceInfo.UniqueID;
                        // End:0x4C7
                        if(ro.instanceInfo.DamageDegree >= 80000)
                        {
                            TPInventory.TPWeapon.Equip_DamegeItemNames[TPInventory.TPWeapon.Equip_DamegeItemNames.Length] = ro.ItemName.Text;
                            TPInventory.TPWeapon.Inven_DamegeItemNames[TPInventory.TPWeapon.Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x2A7;
            }
            i = 0;
            J0x4D8:

            // End:0x761 [Loop If]
            if(i < GameMgr.QuickSlotBoxList.Length)
            {
                j = 0;
                J0x4F8:

                // End:0x757 [Loop If]
                if(j < 4)
                {
                    UniqueID = GameMgr.QuickSlotBoxList[i].UniqueID[j];
                    // End:0x74D
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()) && GameMgr.IsBlockedItemIdx(UniqueID) == false)
                    {
                        ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
                        // End:0x5A9
                        if(ItemInfo.CostType != 0)
                        {
                            // [Explicit Continue]
                            goto J0x74D;
                        }
                        instanceInfo = GameMgr.FindInstanceItem(UniqueID);
                        k = 0;
                        J0x5CA:

                        // End:0x5FD [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x5F3
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x5FD;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x5CA;
                        }
                        J0x5FD:

                        // End:0x74D
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            TPInventory.TPWeapon.EquipItemList[TPInventory.TPWeapon.EquipItemList.Length] = UniqueID;
                            TPInventory.TPWeapon.EquipItemCount++;
                            TPInventory.TPWeapon.InvenItemList[TPInventory.TPWeapon.InvenItemList.Length] = UniqueID;
                            // End:0x74D
                            if(instanceInfo.DamageDegree >= 80000)
                            {
                                TPInventory.TPWeapon.Equip_DamegeItemNames[TPInventory.TPWeapon.Equip_DamegeItemNames.Length] = ItemInfo.ItemName;
                                TPInventory.TPWeapon.Inven_DamegeItemNames[TPInventory.TPWeapon.Inven_DamegeItemNames.Length] = ItemInfo.ItemName;
                            }
                        }
                    }
                    J0x74D:

                    j++;
                    // [Loop Continue]
                    goto J0x4F8;
                }
                i++;
                // [Loop Continue]
                goto J0x4D8;
            }
            i = 0;
            J0x768:

            // End:0x959 [Loop If]
            if(i < TPWarehouseQS.TPItemList.ItemList.DataPool.Length)
            {
                ro = TPWarehouseQS.TPItemList.ItemList.DataPool[i];
                // End:0x94F
                if(((ro.ItemInfo.ItemType <= 4) && ro.ItemInfo.CostType == 0) && GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                {
                    UniqueID = ro.instanceInfo.UniqueID;
                    // End:0x94F
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()))
                    {
                        k = 0;
                        J0x85F:

                        // End:0x892 [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x888
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x892;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x85F;
                        }
                        J0x892:

                        // End:0x94F
                        if(k == rilist.Length)
                        {
                            rilist[rilist.Length] = UniqueID;
                            TPInventory.TPWeapon.InvenItemList[TPInventory.TPWeapon.InvenItemList.Length] = UniqueID;
                            // End:0x94F
                            if(ro.instanceInfo.DamageDegree >= 80000)
                            {
                                TPInventory.TPWeapon.Inven_DamegeItemNames[TPInventory.TPWeapon.Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                            }
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x768;
            }
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x9EB
            break;
        // End:0x9CD
        case 3:
            TPInventory.TPWeapon.CurrentRepairMode = 3;
            rilist.Length = 1;
            rilist[0] = ro.instanceInfo.UniqueID;
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x9EB
            break;
        // End:0x9E8
        case 4:
            // End:0x9DF
            if(ro == none)
            {
                return true;
            }
            EquipQuickSlot();
            // End:0x9EB
            break;
        // End:0xFFFF
        default:
            break;
    }
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
    // End:0xCE
    if(__NFUN_920__(TPWarehouseQS.InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 0))
    {
        TcpChannel.sfReqSellShopItemInfo(TPWarehouseQS.InfoBox.ItemBoxView.itemBox.instanceInfo.UniqueID, 1);
    }
    return true;
    //return;    
}

function QuickSlot_SelectItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo, optional bool bHoldcItemInfo)
{
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;

    cItemInfo = none;
    cInstanceInfo = none;
    // End:0x195
    if(bHoldcItemInfo == false)
    {
        switch(ItemInfo.ItemType)
        {
            // End:0x2E
            case 0:
            // End:0x32
            case 1:
            // End:0x9C
            case 2:
                cItemInfo = TPInventory.TPWeapon.ButtonWeapon[0].itemBox.ItemInfo;
                cInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[0].itemBox.instanceInfo;
                // End:0x195
                break;
            // End:0x106
            case 3:
                cItemInfo = TPInventory.TPWeapon.ButtonWeapon[1].itemBox.ItemInfo;
                cInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[1].itemBox.instanceInfo;
                // End:0x195
                break;
            // End:0x172
            case 4:
                cItemInfo = TPInventory.TPWeapon.ButtonWeapon[2].itemBox.ItemInfo;
                cInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[2].itemBox.instanceInfo;
                // End:0x195
                break;
            // End:0x17A
            case 5:
                // End:0x195
                break;
            // End:0x182
            case 6:
                // End:0x195
                break;
            // End:0x18A
            case 7:
                // End:0x195
                break;
            // End:0x192
            case 8:
                // End:0x195
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        TPWarehouseQS.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        // End:0x240
        if(ItemInfo.ItemType == 999)
        {
            TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ItemImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.item_item_cash;
            TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ChangeState(10);            
        }
        else
        {
            TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ChangeState(0);
        }
        // End:0x2FE
        if(ItemInfo == none)
        {
            TPWarehouseQS.MenuButton[0].DisableMe();
            TPWarehouseQS.MenuButton[1].DisableMe();
            TPWarehouseQS.MenuButton[2].DisableMe();
            TPWarehouseQS.MenuButton[3].DisableMe();
            TPWarehouseQS.MenuButton[4].DisableMe();
            return;
        }
        // End:0x375
        if((ItemInfo.bSellShop && TPInventory.TPWeapon.GetButtonWeaponID(instanceInfo.UniqueID) == -1) && instanceInfo.CashItemInfo == none)
        {
            TPWarehouseQS.MenuButton[0].EnableMe();            
        }
        else
        {
            TPWarehouseQS.MenuButton[0].DisableMe();
        }
        // End:0x404
        if(((ItemInfo.ItemType <= 3) && (ItemInfo.Grade <= 1) || ItemInfo.Grade == 7) && instanceInfo.CashItemInfo == none)
        {
            TPWarehouseQS.MenuButton[1].EnableMe();            
        }
        else
        {
            TPWarehouseQS.MenuButton[1].DisableMe();
        }
        // End:0x4C4
        if((ItemInfo.CostType == 0) && instanceInfo.CashItemInfo == none)
        {
            TPWarehouseQS.MenuButton[2].EnableMe();
            // End:0x4A6
            if((instanceInfo != none) && instanceInfo.Durability < 100000)
            {
                TPWarehouseQS.MenuButton[3].EnableMe();                
            }
            else
            {
                TPWarehouseQS.MenuButton[3].DisableMe();
            }            
        }
        else
        {
            TPWarehouseQS.MenuButton[2].DisableMe();
            TPWarehouseQS.MenuButton[3].DisableMe();
        }
        // End:0x57B
        if(((instanceInfo != none) && ItemInfo.CostType == 1) && instanceInfo.ItemState == 0)
        {
            TPWarehouseQS.MenuButton[4].EnableMe();
            TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];            
        }
        else
        {
            // End:0x5D9
            if(instanceInfo.CashItemInfo != none)
            {
                TPWarehouseQS.MenuButton[4].EnableMe();
                TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                
            }
            else
            {
                // End:0x638
                if(ItemInfo.ItemType == 25)
                {
                    TPWarehouseQS.MenuButton[4].EnableMe();
                    TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                    
                }
                else
                {
                    // End:0x697
                    if(ItemInfo.ItemType == 26)
                    {
                        TPWarehouseQS.MenuButton[4].EnableMe();
                        TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                        
                    }
                    else
                    {
                        // End:0x6F6
                        if(ItemInfo.ItemType == 27)
                        {
                            TPWarehouseQS.MenuButton[4].EnableMe();
                            TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                            
                        }
                        else
                        {
                            // End:0x778
                            if((ItemInfo.ItemType <= 11) && ItemInfo.EquipLevel <= MM.kLevel)
                            {
                                TPWarehouseQS.MenuButton[4].EnableMe();
                                TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[4];                                
                            }
                            else
                            {
                                TPWarehouseQS.MenuButton[4].DisableMe();
                                TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[4];
                            }
                        }
                    }
                }
            }
        }
        //return;        
    }
}

function bool TPInventory_TabButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local Image ButtonSlot[4];

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPInventory.TabControl.SetVisiblePanel(btn.ButtonID);
    switch(btn.ButtonID)
    {
        // End:0xD2
        case 0:
            TPWarehouseSkill.SetVisibility(false);
            TPWarehouseQS.SetVisibility(false);
            TPInventory.TPWeapon.MainTabSelect(TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex(), TPInventory.TPWeapon.TabControl[1].GetCurrentTabIndex());
            SetInfoBox(0);
            // End:0x2A0
            break;
        // End:0x122
        case 1:
            TPWarehouseSkill.SetVisibility(true);
            TPWarehouseQS.SetVisibility(false);
            TPWarehouseSkill.InfoBox.ItemStateView.SetVisibility(false);
            SetInfoBox(1);
            // End:0x2A0
            break;
        // End:0x29D
        case 2:
            TPWarehouseSkill.SetVisibility(false);
            TPWarehouseQS.SetVisibility(true);
            self.TPInventory.TPQuickSlot.ShowWeaponTransparent(TPInventory.TPWeapon.ButtonWeapon[0].itemBox, TPInventory.TPWeapon.ButtonWeapon[1].itemBox, TPInventory.TPWeapon.ButtonWeapon[2].itemBox, TPInventory.TPWeapon.ButtonWeapon[3].itemBox);
            self.TPInventory.TPQuickSlot.ShowSkillTransparent(TPInventory.TPSkill.ButtonSkill[0].itemBox, TPInventory.TPSkill.ButtonSkill[1].itemBox);
            TPWarehouseQS.MainTabSelect(TPWarehouseQS.TabControl[0].GetCurrentTabIndex(), TPWarehouseQS.TabControl[1].GetCurrentTabIndex());
            SetInfoBox(2);
            // End:0x2A0
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool TPInventorySkill_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipSkill(btn.ButtonID);
    return true;
    //return;    
}

function bool TPInventoryQS_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipQuickSlot(btn.ButtonID);
    return true;
    //return;    
}

function bool TPInventorySkill_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    TPInventory.TPSkill.InvenGroup.SelectButton(btn.ButtonID);
    TPWarehouseSkill.InfoBox.SetData(TPInventory.TPSkill.ButtonSkill[btn.ButtonID].itemBox.ItemInfo, TPInventory.TPSkill.ButtonSkill[btn.ButtonID].itemBox.instanceInfo, none, none);
    TPWarehouseSkill.InfoBox.ItemBoxView.itemBox.ChangeState(0);
    return true;
    //return;    
}

function bool TPInventoryQS_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    TPInventory.TPQuickSlot.InvenGroup.SelectButton(btn.ButtonID);
    TPWarehouseQS.InfoBox.SetData(TPInventory.TPQuickSlot.ButtonQuickSlot[btn.ButtonID].itemBox.ItemInfo, TPInventory.TPQuickSlot.ButtonQuickSlot[btn.ButtonID].itemBox.instanceInfo, none, none);
    TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ChangeState(0);
    return true;
    //return;    
}

function UpdateWebzenInvenListEnd(BTNetMainMenu MainMenu)
{
    local int i;
    local export editinline BTWindowDefineStateHK BTWindow;

    Log("[BTPageInventory::UpdateWebzenInvenListEnd]");
    i = 0;
    J0x36:

    // End:0x94 [Loop If]
    if(i < Controller.MenuStack.Length)
    {
        BTWindow = BTWindowDefineStateHK(Controller.MenuStack[i]);
        // End:0x8A
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    RefreshWarehouse();
    Log("TPInventory.TPWeapon.TPItemList.ItemList.ShowCashItem()");
    TPInventory.TPWeapon.TPItemList.ItemList.ShowCashItem();
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    self.LabelBackground.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_back3;
    TPInventory.ButtonInven[0].__OnClick__Delegate = TPInventory_TabButton_OnClick;
    TPInventory.ButtonInven[1].__OnClick__Delegate = TPInventory_TabButton_OnClick;
    TPInventory.ButtonInven[2].__OnClick__Delegate = TPInventory_TabButton_OnClick;
    i = 0;
    J0xAB:

    // End:0x119 [Loop If]
    if(i < 2)
    {
        TPInventory.TPSkill.ButtonSkill[i].__OnClick__Delegate = TPInventorySkill_OnClick;
        TPInventory.TPSkill.ButtonSkill[i].__OnDblClick__Delegate = TPInventorySkill_OnDblClick;
        i++;
        // [Loop Continue]
        goto J0xAB;
    }
    i = 0;
    J0x120:

    // End:0x18E [Loop If]
    if(i < 6)
    {
        TPInventory.TPQuickSlot.ButtonQuickSlot[i].__OnClick__Delegate = TPInventoryQS_OnClick;
        TPInventory.TPQuickSlot.ButtonQuickSlot[i].__OnDblClick__Delegate = TPInventoryQS_OnDblClick;
        i++;
        // [Loop Continue]
        goto J0x120;
    }
    TPWarehouseSkill.MenuButton.__OnClick__Delegate = TPWarehouseSkill_MenuButton_OnClick;
    i = 0;
    J0x1B2:

    // End:0x1EB [Loop If]
    if(i < 5)
    {
        TPWarehouseQS.MenuButton[i].__OnClick__Delegate = TPWarehouseQS_MenuButton_OnClick;
        ++i;
        // [Loop Continue]
        goto J0x1B2;
    }
    TPInventory.TabControl.SetVisiblePanel(0);
    TPInventory.TPWeapon.FocusFirst(none);
    TPWarehouseSkill.SetVisibility(false);
    TPWarehouseQS.SetVisibility(false);
    InitializeCashNPoint();
    InitializeDragAndDrop();
    bDragging = false;
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 96.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 144.0000000;
    page_Main.__ClearChatLog_Extra__Delegate = ClearChatLog_Extra;
    page_Main.__NormalChatLog_Extra__Delegate = NormalChatLog_Extra;
    page_Main.__ClanChatLog_Extra__Delegate = ClanChatLog_Extra;
    page_Main.__WhisperChatLog_Extra__Delegate = WhisperChatLog_Extra;
    page_Main.__SelfChatLog_Extra__Delegate = SelfChatLog_Extra;
    page_Main.__SystemChatLog_Extra__Delegate = SystemChatLog_Extra;
    page_Main.__BroadCastItemChatLog_Extra__Delegate = BroadCastItemChatLog_Extra;
    page_Main.__TeamChatLog_Extra__Delegate = TeamChatLog_Extra;
    page_Main.UpdateChatLog();
    TPInventory.TPQuickSlot.__delegateUpdateQuickSlot__Delegate = UpdateQuickSlot;
    Controller.PushPage();
    //return;    
}

function ClearChatLog_Extra()
{
    TPInventory.TPWeapon.ChatBox.Clear();
    TPInventory.TPSkill.ChatBox.Clear();
    //return;    
}

function NormalChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    TPInventory.TPSkill.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    //return;    
}

function ClanChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    TPInventory.TPSkill.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    //return;    
}

function WhisperChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    TPInventory.TPSkill.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    //return;    
}

function SelfChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    TPInventory.TPSkill.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPInventory.TPSkill.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    //return;    
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    TPInventory.TPSkill.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    //return;    
}

function TeamChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    TPInventory.TPSkill.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    //return;    
}

function InitializeCashNPoint()
{
    CashColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
    PointColor = Class'Engine.Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    LabelCash = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = CashColor;
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = PointColor;
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
    //return;    
}

function TPInventorySkillButton_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("TPInventorySkillButton_OnEndDrag" @ string(Sender));
    // End:0x48
    if(Sender.Class == Class'GUIWarfareControls.BTItemBoxButtonHK')
    {        
    }
    else
    {
        // End:0x5E
        if(Sender != none)
        {
            UnequipSkill(DragButtonIndex);
        }
    }
    bDragging = false;
    //return;    
}

function TPInventoryQSButton_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("TPInventoryQSButton_OnEndDrag" @ string(Sender));
    // End:0x45
    if(Sender.Class == Class'GUIWarfareControls.BTItemBoxButtonHK')
    {        
    }
    else
    {
        // End:0x5B
        if(Sender != none)
        {
            UnequipQuickSlot(DragButtonIndex);
        }
    }
    bDragging = false;
    //return;    
}

function bool TPWarehouseSkillItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;
    local float X, Y, W, HT;

    Log("TPWarehouseSkillItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPWarehouseSkill.TPItemList.ItemList.GetSelectItem());
    // End:0x253
    if(((Sender.bDropSource == true) && bDragging == false) && Box.CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        bDragging = true;
        DragPosX = int(Controller.MouseX);
        DragPosY = int(Controller.MouseY);
        DragAWinPos = Box.AWinPos;
        DragBox.AWinPos = Box.AWinPos;
        W = DragAWinPos.X2 - DragAWinPos.X1;
        HT = DragAWinPos.Y2 - DragAWinPos.Y1;
        X = float(DragPosX) - (DragAWinPos.X1 + (W / float(2)));
        Y = float(DragPosY) - (DragAWinPos.Y2 - (HT / float(3)));
        X += DragAWinPos.X1;
        Y += DragAWinPos.Y1;
        DragAWinPos.X1 = X;
        DragAWinPos.Y1 = Y;
        DragAWinPos.X2 = X + W;
        DragAWinPos.Y2 = Y + HT;
        DragBox.ItemInfo = Box.ItemInfo;
        DragBox.instanceInfo = Box.instanceInfo;
        DragBox.Update();
        return true;
    }
    return false;
    //return;    
}

function TPWarehouseSkillItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("TPWarehouseSkillItemList_OnEndDrag" @ string(Sender));
    // End:0x81
    if(Sender.Class == Class'GUIWarfareControls.BTItemBoxButtonHK')
    {
        TPInventory.TPSkill.InvenGroup.SelectButton(BTItemBoxButtonHK(Sender).ButtonID);
        EquipSkill();
    }
    bDragging = false;
    //return;    
}

function bool TPWarehouseQSItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;
    local float X, Y, HT, W;

    Log("TPWarehouseQSItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPWarehouseQS.TPItemList.ItemList.GetSelectItem());
    // End:0x250
    if(((Sender.bDropSource == true) && bDragging == false) && Box.CheckIn(float(int(Controller.MouseX)), float(int(Controller.MouseY))))
    {
        bDragging = true;
        DragPosX = int(Controller.MouseX);
        DragPosY = int(Controller.MouseY);
        DragAWinPos = Box.AWinPos;
        DragBox.AWinPos = Box.AWinPos;
        W = DragAWinPos.X2 - DragAWinPos.X1;
        HT = DragAWinPos.Y2 - DragAWinPos.Y1;
        X = float(DragPosX) - (DragAWinPos.X1 + (W / float(2)));
        Y = float(DragPosY) - (DragAWinPos.Y2 - (HT / float(3)));
        X += DragAWinPos.X1;
        Y += DragAWinPos.Y1;
        DragAWinPos.X1 = X;
        DragAWinPos.Y1 = Y;
        DragAWinPos.X2 = X + W;
        DragAWinPos.Y2 = Y + HT;
        DragBox.ItemInfo = Box.ItemInfo;
        DragBox.instanceInfo = Box.instanceInfo;
        DragBox.Update();
        return true;
    }
    return false;
    //return;    
}

function TPWarehouseQSItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("TPWarehouseQSItemList_OnEndDrag" @ string(Sender));
    QuickSlot_SelectItem(DragBox.ItemInfo, DragBox.instanceInfo, true);
    // End:0xA1
    if(Sender.Class == Class'GUIWarfareControls.BTItemBoxButtonHK')
    {
        TPInventory.TPQuickSlot.InvenGroup.SelectButton(BTItemBoxButtonHK(Sender).ButtonID);
        EquipQuickSlot();
    }
    bDragging = false;
    //return;    
}

function bool TPInventoryButton_OnBeginDrag(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;
    local float X, Y, W, HT;

    Log("TPInventoryButton_OnBeginDrag");
    btn = BTItemBoxButtonHK(Sender);
    // End:0x24F
    if(((btn.bDropSource == true) && bDragging == false) && btn.itemBox.ItemInfo != none)
    {
        bDragging = true;
        DragPosX = int(Controller.MouseX);
        DragPosY = int(Controller.MouseY);
        DragAWinPos = btn.itemBox.AWinPos;
        DragBox.AWinPos = btn.itemBox.AWinPos;
        W = DragAWinPos.X2 - DragAWinPos.X1;
        HT = DragAWinPos.Y2 - DragAWinPos.Y1;
        X = float(DragPosX) - (DragAWinPos.X1 + (W / float(2)));
        Y = float(DragPosY) - (DragAWinPos.Y2 - (HT / float(3)));
        X += DragAWinPos.X1;
        Y += DragAWinPos.Y1;
        DragAWinPos.X1 = X;
        DragAWinPos.Y1 = Y;
        DragAWinPos.X2 = X + W;
        DragAWinPos.Y2 = Y + HT;
        DragBox.ItemInfo = btn.itemBox.ItemInfo;
        DragBox.instanceInfo = btn.itemBox.instanceInfo;
        DragBox.Update();
        DragButtonIndex = btn.ButtonID;
        return true;
    }
    return false;
    //return;    
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new Class'GUIWarfareControls.BTROItemBoxHK';
    DragBox.Init();
    DragBox.bDragMode = true;
    DragBox.Update();
    i = 0;
    J0x45:

    // End:0xC8 [Loop If]
    if(i < 2)
    {
        btn = TPInventory.TPSkill.ButtonSkill[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = TPInventoryButton_OnBeginDrag;
        btn.__OnEndDrag__Delegate = TPInventorySkillButton_OnEndDrag;
        i++;
        // [Loop Continue]
        goto J0x45;
    }
    TPWarehouseSkill.TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPWarehouseSkill.TPItemList.ItemList.ImageList.bDropSource = true;
    TPWarehouseSkill.TPItemList.ItemList.ImageList.bDropTarget = true;
    TPWarehouseSkill.TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = TPWarehouseSkillItemList_OnBeginDrag;
    TPWarehouseSkill.TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = TPWarehouseSkillItemList_OnEndDrag;
    i = 0;
    J0x1B1:

    // End:0x234 [Loop If]
    if(i < 6)
    {
        btn = TPInventory.TPQuickSlot.ButtonQuickSlot[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = TPInventoryButton_OnBeginDrag;
        btn.__OnEndDrag__Delegate = TPInventoryQSButton_OnEndDrag;
        i++;
        // [Loop Continue]
        goto J0x1B1;
    }
    TPWarehouseQS.TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPWarehouseQS.TPItemList.ItemList.ImageList.bDropSource = true;
    TPWarehouseQS.TPItemList.ItemList.ImageList.bDropTarget = true;
    TPWarehouseQS.TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = TPWarehouseQSItemList_OnBeginDrag;
    TPWarehouseQS.TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = TPWarehouseQSItemList_OnEndDrag;
    //return;    
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageInventory::UpdateMoneyInfo]");
    RefreshCashNPoint();
    //return;    
}

function UpdateItemList(wGameManager MM)
{
    Log("[BTPageInventory::UpdateItemList]");
    RefreshWarehouse();
    //return;    
}

function UpdateWebzenItemList(wGameManager MM)
{
    Log("[BTPageInventory::UpdateWebzenItemList]");
    RefreshWarehouse();
    //return;    
}

function UpdateServerTime(wGameManager GameMgr)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::UpdateServerTime]");
    RefreshWarehouse();
    // End:0xC3
    if(page_Main.rMM.kFirstIntoInventory == false)
    {
        page_Main.rMM.kFirstIntoInventory = true;
        instanceInfo = GameMgr.FindFirstInstanceItemByItemID(17001);
        // End:0xC3
        if(instanceInfo != none)
        {
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 25);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_25_OnOK;
        }
    }
    //return;    
}

function bool BTWindowDefineARHK_25_OnOK(GUIComponent Sender)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::BTWindowDefineARHK_25_OnOK] ");
    Controller.CloseMenu(false);
    instanceInfo = GameMgr.FindFirstInstanceItemByItemID(17001);
    page_Main.TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID);
    return true;
    //return;    
}

function InitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    GameMgr.__UpdateWebzenItemList__Delegate = UpdateWebzenItemList;
    MM.__UpdateMoneyInfo__Delegate = UpdateMoneyInfo;
    GameMgr.__UpdateServerTime__Delegate = UpdateServerTime;
    TPInventory.TPWeapon.__dele_StopWebzenWebzenInvenList__Delegate = page_Main.StopWebzenInvenList;
    TPInventory.TPWeapon.__dele_sfReqWebzenInvenList__Delegate = page_Main.sfReqWebzenInvenList;
    page_Main.__UpdateWebzenInvenListEnd__Delegate = UpdateWebzenInvenListEnd;
    //return;    
}

function UnInitializeDelegate()
{
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    MM.__UpdateMoneyInfo__Delegate = None;
    GameMgr.__UpdateServerTime__Delegate = None;
    TPInventory.TPWeapon.__dele_StopWebzenWebzenInvenList__Delegate = None;
    TPInventory.TPWeapon.__dele_sfReqWebzenInvenList__Delegate = None;
    page_Main.__UpdateWebzenInvenListEnd__Delegate = None;
    //return;    
}

function InternalOnOpen()
{
    __NFUN_270__("BTPageInventory::InternalOnOpen()");
    Log("[BTPageInventory::InternalOnOpen] ");
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    TPInventory.TPWeapon.TcpChannel = TcpChannel;
    MM.SetCurSubPos(3);
    InitializeDelegate();
    RefreshWarehouse();
    TPInventory.CharacterModel.BeginModel();
    page_Main.TcpChannel.sfReqChangeUserState(5, 0);
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    page_Main.TcpChannel.sfReqGetServerTime();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageInventory::InternalOnClose()");
    Log("[BTPageInventory::InternalOnClose] ");
    TPInventory.CharacterModel.EndModel();
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
    UnInitializeDelegate();
    OnClose(bCanceled);
    //return;    
}

function InternalOnRendered(Canvas C)
{
    CurrentCanvas = C;
    // End:0xF6
    if((DragBox != none) && bDragging)
    {
        DragBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) - DragPosX) + DragAWinPos.X1, float(int(Controller.MouseY) - DragPosY) + DragAWinPos.Y1, float(int(Controller.MouseX) - DragPosX) + DragAWinPos.X2, float(int(Controller.MouseY) - DragPosY) + DragAWinPos.Y2);
        DragBox.Update();
        DragBox.Render(C);
    }
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageInventory_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageInventory_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function RefreshEquipSkill()
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:

    // End:0xE7 [Loop If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(14 + i);
        // End:0xDD
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xDD
            if(ItemInfo != none)
            {
                self.TPInventory.TPSkill.ButtonSkill[i].SetData(ItemInfo, instanceInfo);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    //return;    
}

function RefreshQuickSlot()
{
    local int i, selectIndex;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    selectIndex = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    i = 0;
    J0x5D:

    // End:0x18B [Loop If]
    if(i < 8)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = TPInventory.TPQuickSlot.SaveQS[selectIndex].instanceInfo[i];
        // End:0x153
        if(instanceInfo != none)
        {
            ItemInfo = TPInventory.TPQuickSlot.SaveQS[selectIndex].ItemInfo[i];
            // End:0x122
            if(ItemInfo != none)
            {
                self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(ItemInfo, instanceInfo);                
            }
            else
            {
                self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(none, none);
            }
            // [Explicit Continue]
            goto J0x181;
        }
        self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(none, none);
        J0x181:

        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    //return;    
}

function RefreshCashNPoint()
{
    Log("[BTPageInventory::RefreshCashNPoint]");
    LabelPoint.Caption = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(125, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));
    LabelCash.Caption = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
    TPWarehouseSkill.LabelPoint.Caption = LabelPoint.Caption;
    TPWarehouseSkill.LabelCash.Caption = LabelCash.Caption;
    TPWarehouseQS.LabelPoint.Caption = LabelPoint.Caption;
    TPWarehouseQS.LabelCash.Caption = LabelCash.Caption;
    //return;    
}

function FillSkillInventories()
{
    local int i;
    local wMyPlayerStatus MyStatus;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    TPWarehouseSkill.TPItemList.MyData.myLevel = MM.kLevel;
    TPWarehouseSkill.TPItemList.MyData.MyPoint = MM.kPoint;
    TPWarehouseSkill.TPItemList.MyData.MyCash = MM.kCash;
    TPWarehouseSkill.TPItemList.ItemList.ClearItem();
    i = 0;
    J0xED:

    // End:0x1BE [Loop If]
    if(i < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        // End:0x1B4
        if(int(TPInventory.TPWeapon.TPItemList.ItemList.DataPool[i].InvenState) == int(5))
        {
            TPWarehouseSkill.TPItemList.ItemList.AddItem(TPInventory.TPWeapon.TPItemList.ItemList.DataPool[i]);
        }
        i++;
        // [Loop Continue]
        goto J0xED;
    }
    TPWarehouseSkill.TPItemList.ItemList.ImageList.__OnClick__Delegate = TPWarehouseSkill_ImageListBox_OnClick;
    TPWarehouseSkill.TPItemList.ItemList.ImageList.__OnDblClick__Delegate = TPWarehouseSkill_ImageListBox_OnDblClick;
    TPWarehouseSkill.TPItemList.ItemList.ShowSkillAll();
    SetInfoBox(1);
    //return;    
}

function FillQuickSlotInventories()
{
    local int i, j;
    local wMyPlayerStatus MyStatus;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    TPWarehouseQS.TPItemList.MyData.myLevel = MM.kLevel;
    TPWarehouseQS.TPItemList.MyData.MyPoint = MM.kPoint;
    TPWarehouseQS.TPItemList.MyData.MyCash = MM.kCash;
    TPWarehouseQS.TPItemList.ItemList.ClearItem();
    i = 0;
    J0xED:

    // End:0x17B [Loop If]
    if(i < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        TPWarehouseQS.TPItemList.ItemList.AddItem(TPInventory.TPWeapon.TPItemList.ItemList.DataPool[i]);
        i++;
        // [Loop Continue]
        goto J0xED;
    }
    TPInventory.TPQuickSlot.SaveQS.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x1AA:

    // End:0x3A2 [Loop If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        TPInventory.TPQuickSlot.LabelTagTop[i].Caption = GameMgr.QuickSlotBoxList[i].QuickSlotName;
        j = 0;
        J0x20E:

        // End:0x398 [Loop If]
        if(j < 4)
        {
            TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
            TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[i].UniqueID[j]);
            TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j + 4] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[j]);
            TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j + 4] = GameMgr.FindInstanceSkillItem(GameMgr.QuickSlotBoxList[i].UniqueSkillID[j]);
            j++;
            // [Loop Continue]
            goto J0x20E;
        }
        i++;
        // [Loop Continue]
        goto J0x1AA;
    }
    TPInventory.TPQuickSlot.SetDefaultButtonImage();
    TPWarehouseQS.TPItemList.ItemList.ImageList.__OnClick__Delegate = TPWarehouseQS_ImageListBox_OnClick;
    TPWarehouseQS.TPItemList.ItemList.ImageList.__OnDblClick__Delegate = TPWarehouseQS_ImageListBox_OnDblClick;
    TPWarehouseQS.TPItemList.ItemList.ShowWeaponWithEquip();
    SetInfoBox(2);
    //return;    
}

function SetInfoBox(int TabIndex)
{
    switch(TabIndex)
    {
        // End:0x26
        case 0:
            TPInventory.TPWeapon.SetInfoBox();
            // End:0xBC
            break;
        // End:0x3C
        case 1:
            TPWarehouseSkill.SetInfoBox();
            // End:0xBC
            break;
        // End:0xB9
        case 2:
            TPWarehouseQS.SetInfoBox();
            QuickSlot_SelectItem(BTROItemBoxHK(TPWarehouseQS.TPItemList.ItemList.DataList[0]).ItemInfo, BTROItemBoxHK(TPWarehouseQS.TPItemList.ItemList.DataList[0]).instanceInfo);
            // End:0xBC
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function RefreshWarehouse()
{
    local int TabIndex[5], topIdx, SelectIdx;

    TabIndex[0] = TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex();
    TabIndex[1] = TPInventory.TPWeapon.TabControl[1].GetCurrentTabIndex();
    TabIndex[2] = TPWarehouseSkill.TabControl.GetCurrentTabIndex();
    TabIndex[3] = TPWarehouseQS.TabControl[0].GetCurrentTabIndex();
    TabIndex[4] = TPWarehouseQS.TabControl[1].GetCurrentTabIndex();
    topIdx[0] = TPInventory.TPWeapon.TPItemList.ItemList.ImageList.Top;
    topIdx[1] = TPWarehouseQS.TPItemList.ItemList.ImageList.Top;
    SelectIdx[0] = TPInventory.TPWeapon.TPItemList.ItemList.LastSelectedItemIndex;
    // End:0x16F
    if(SelectIdx[0] < 0)
    {
        SelectIdx[0] = 0;
    }
    SelectIdx[1] = TPWarehouseQS.TPItemList.ItemList.LastSelectedItemIndex;
    // End:0x1AD
    if(SelectIdx[1] < 0)
    {
        SelectIdx[1] = 0;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPInventory.TPWeapon.fill();
    FillSkillInventories();
    FillQuickSlotInventories();
    RefreshCashNPoint();
    TPInventory.TPWeapon.Refresh();
    RefreshEquipSkill();
    RefreshQuickSlot();
    TPInventory.TPWeapon.MainTabSelect(TabIndex[0], TabIndex[1], true);
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetIndex(SelectIdx[0]);
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(topIdx[0]);
    TPInventory.TPWeapon.SetInfoBox(SelectIdx[0]);
    TPWarehouseSkill.TabControl.SetVisiblePanel(TabIndex[2]);
    TPWarehouseSkill.MainButton_OnClick(TPWarehouseSkill.MainButton[TabIndex[2]]);
    TPWarehouseQS.MainTabSelect(TabIndex[3], TabIndex[4]);
    TPWarehouseQS.TPItemList.ItemList.ImageList.SetIndex(SelectIdx[1]);
    TPWarehouseQS.TPItemList.ItemList.ImageList.SetTopItem(topIdx[1]);
    TPWarehouseQS.SetInfoBox(SelectIdx[1]);
    //return;    
}

function EquipSkill()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    ItemList = TPWarehouseSkill.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0xCE
    if(instanceInfo.SlotPosition != 13)
    {
        return;
    }
    // End:0xE5
    if(ItemInfo.bSkill == false)
    {
        return;
    }
    // End:0x108
    if(ItemInfo.EquipLevel > MM.kLevel)
    {
        return;
    }
    // End:0x127
    if(ItemInfo.SkillUseType == 0)
    {
        currentSlot = 14;        
    }
    else
    {
        // End:0x146
        if(ItemInfo.SkillUseType == 1)
        {
            currentSlot = 15;            
        }
        else
        {
            return;
        }
    }
    // End:0x162
    if(currentSlot == instanceInfo.SlotPosition)
    {
        return;
    }
    page_Main.TcpChannel.sfReqEquipSkill(instanceInfo.ItemID, instanceInfo.UniqueSkillID, byte(currentSlot));
    //return;    
}

function UnequipSkill(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    ib = TPInventory.TPSkill.ButtonSkill[ButtonID];
    // End:0x9A
    if(ib.itemBox.instanceInfo != none)
    {
        page_Main.TcpChannel.sfReqEquipSkill(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueSkillID, 13);
    }
    //return;    
}

function EquipQuickSlot()
{
    local int currentSlot, i;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    ItemList = TPWarehouseQS.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0xC4
    if(instanceInfo == none)
    {
        return;
    }
    // End:0x10A
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x163
    if((ItemInfo.Grade == 7) && (MM.kIsRegisteredPCBang == 0) || MM.kIsPaidPCBang == 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;
    }
    // End:0x191
    if((ItemInfo.ItemType >= 5) && ItemInfo.ItemType != 22)
    {
        return;
    }
    // End:0x1B4
    if(ItemInfo.EquipLevel > MM.kLevel)
    {
        return;
    }
    i = 0;
    J0x1BB:

    // End:0x2D2 [Loop If]
    if(i < 8)
    {
        // End:0x2C8
        if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.ItemInfo != none)
        {
            // End:0x267
            if(__NFUN_913__(instanceInfo.UniqueID, EmptyBtrDouble()))
            {
                // End:0x264
                if(__NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
                {
                    return;
                }
                // [Explicit Continue]
                goto J0x2C8;
            }
            // End:0x2C8
            if(instanceInfo.UniqueSkillID != 0)
            {
                // End:0x2C8
                if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueSkillID == instanceInfo.UniqueSkillID)
                {
                    return;
                }
            }
        }
        J0x2C8:

        i++;
        // [Loop Continue]
        goto J0x1BB;
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x345
    if((ItemInfo.ItemType <= 2) && currentSlot != 0)
    {
        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0x391
        if((ItemInfo.ItemType == 3) && currentSlot != 1)
        {
            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x561
            if(ItemInfo.ItemType == 4)
            {
                // End:0x55E
                if((currentSlot != 2) && currentSlot != 3)
                {
                    // End:0x47C
                    if(((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].DefaultSlotItemID == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                        
                    }
                    else
                    {
                        // End:0x4D9
                        if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none)
                        {
                            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);                            
                        }
                        else
                        {
                            // End:0x536
                            if(TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none)
                            {
                                self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                                
                            }
                            else
                            {
                                self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
                            }
                        }
                    }
                }                
            }
            else
            {
                // End:0x5F6
                if(ItemInfo.ItemType == 22)
                {
                    // End:0x5B5
                    if(ItemInfo.SkillUseType == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(4);                        
                    }
                    else
                    {
                        // End:0x5F4
                        if(ItemInfo.SkillUseType == 1)
                        {
                            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(5);                            
                        }
                        else
                        {
                            return;
                        }
                    }
                }
            }
        }
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x82B
    if(ItemInfo.ItemType == 4)
    {
        // End:0x730
        if(currentSlot == 2)
        {
            // End:0x6AE
            if((TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none) && __NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[3].DefaultSlotUniqueID, instanceInfo.UniqueID))
            {
                return;                
            }
            else
            {
                // End:0x72D
                if((TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo != none) && __NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
                {
                    return;
                }
            }            
        }
        else
        {
            // End:0x82B
            if(currentSlot == 3)
            {
                // End:0x7AC
                if((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none) && __NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[2].DefaultSlotUniqueID, instanceInfo.UniqueID))
                {
                    return;                    
                }
                else
                {
                    // End:0x82B
                    if((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo != none) && __NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
                    {
                        return;
                    }
                }
            }
        }
    }
    switch(currentSlot)
    {
        // End:0x836
        case 0:
        // End:0x83A
        case 1:
        // End:0x83F
        case 2:
        // End:0x898
        case 3:
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex(), currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x907
            break;
        // End:0x89D
        case 4:
        // End:0x8A2
        case 5:
        // End:0x8A7
        case 6:
        // End:0x904
        case 7:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex(), currentSlot - 4, instanceInfo.ItemID, instanceInfo.UniqueSkillID);
            // End:0x907
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].ItemInfo[currentSlot] = ItemInfo;
    TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].instanceInfo[currentSlot] = instanceInfo;
    TPInventory.TPQuickSlot.ButtonQuickSlot[currentSlot].SetData(ItemInfo, instanceInfo);
    UpdateQuickSlot(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex());
    //return;    
}

function UnequipQuickSlot(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    switch(ButtonID)
    {
        // End:0x0B
        case 0:
        // End:0x0F
        case 1:
        // End:0x14
        case 2:
        // End:0x58
        case 3:
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex(), ButtonID, 0, EmptyBtrDouble());
            // End:0xAD
            break;
        // End:0x5D
        case 4:
        // End:0x62
        case 5:
        // End:0x67
        case 6:
        // End:0xAA
        case 7:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex(), ButtonID - 4, 0, 0);
            // End:0xAD
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].ItemInfo[ButtonID] = none;
    TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].instanceInfo[ButtonID] = none;
    ib = TPInventory.TPQuickSlot.ButtonQuickSlot[ButtonID];
    ib.SetData(none, none);
    UpdateQuickSlot(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex());
    //return;    
}

function bool TPWarehouseSkill_ImageListBox_OnDblClick(GUIComponent Sender)
{
    EquipSkill();
    return false;
    //return;    
}

function bool TPWarehouseSkill_ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    ItemList = TPWarehouseSkill.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    TPWarehouseSkill.InfoBox.SetData(ItemInfo, instanceInfo, none, none);
    TPWarehouseSkill.InfoBox.ItemBoxView.itemBox.ChangeState(0);
    return false;
    //return;    
}

function bool TPWarehouseQS_ImageListBox_OnDblClick(GUIComponent Sender)
{
    EquipQuickSlot();
    return false;
    //return;    
}

function bool TPWarehouseQS_ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo, cInstanceInfo;

    ItemList = TPWarehouseQS.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    cItemInfo = none;
    switch(ItemInfo.ItemType)
    {
        // End:0x9A
        case 0:
        // End:0x9E
        case 1:
        // End:0x112
        case 2:
            cItemInfo = self.TPInventory.TPQuickSlot.ButtonQuickSlot[0].itemBox.ItemInfo;
            cInstanceInfo = self.TPInventory.TPQuickSlot.ButtonQuickSlot[0].itemBox.instanceInfo;
            // End:0x1FF
            break;
        // End:0x186
        case 3:
            cItemInfo = self.TPInventory.TPQuickSlot.ButtonQuickSlot[1].itemBox.ItemInfo;
            cInstanceInfo = self.TPInventory.TPQuickSlot.ButtonQuickSlot[1].itemBox.instanceInfo;
            // End:0x1FF
            break;
        // End:0x1FC
        case 4:
            cItemInfo = self.TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo;
            cInstanceInfo = self.TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.instanceInfo;
            // End:0x1FF
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPWarehouseQS.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
    TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ChangeState(0);
    QuickSlot_SelectItem(ItemInfo, instanceInfo);
    return false;
    //return;    
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageRoomLobby::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x78
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

    Log("[BTPageRoomLobby::ClanMenu_ButtonFindClan_OnClick]");
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
    local string Clanname;

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnRequestJoin]");
    Clanname = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xF7
    if((Clanname != "none") && Clanname != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(Clanname);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    //return;    
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string Clanname;

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnInfo]");
    Clanname = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8F
    if((Clanname != "none") && Clanname != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(Clanname);
    }
    //return;    
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
    //return;    
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xDE
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
    local string Clanname, URL, Intro, Keyword;
    local int Region;

    Log("[BTPageRoomLobby::BTWindowCreateClanHK_OnOK]");
    // End:0x15C
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        Clanname = BTWindowCreateClanHK(Controller.TopPage()).Clanname.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).RadioGroup.GetSelectIndex();
        page_Main.SaveClanName = Clanname;
        page_Main.TcpChannel.sfReqCreateClan(Clanname, Clanname, Intro, Keyword, byte(Region));
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
    Log("[BTPageInventory::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo, prevInstanceInfo;
    local wMyPlayerStatus MyStatus;
    local int PrevSlotPos, SlotPosition;

    Log("[BTPageInventory::rfAckEquipItem] Result=" $ string(Result));
    // End:0x5C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(ChangedNewItemID);
    instanceInfo = GameMgr.FindInstanceItem(ChangedNewUniqueID);
    SlotPosition = ChangedNewSlotPosition;
    // End:0x10F
    if(instanceInfo == none)
    {
        return false;
    }
    // End:0x12B
    if(__NFUN_912__(instanceInfo.UniqueID, EmptyBtrDouble()))
    {
        return false;
    }
    PrevSlotPos = instanceInfo.SlotPosition;
    // End:0x150
    if(SlotPosition == PrevSlotPos)
    {
        return true;
    }
    // End:0x18C
    if((SlotPosition == 0) && instanceInfo.Durability <= 1000)
    {
        // End:0x18C
        if(ItemInfo.Grade == 0)
        {            
        }
    }
    GameMgr.ChangeInstance_ItemSlotPos(ChangedNewUniqueID, SlotPosition);
    switch(SlotPosition)
    {
        // End:0x1B0
        case 0:
        // End:0x1B4
        case 1:
        // End:0x1B9
        case 2:
        // End:0x381
        case 3:
            prevInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[SlotPosition].itemBox.instanceInfo;
            // End:0x239
            if(prevInstanceInfo == none)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.RemoveShowItem(instanceInfo.UniqueID);                
            }
            else
            {
                prevInstanceInfo.SlotPosition = 13;
                TPInventory.TPWeapon.TPItemList.ItemList.ChangeShowItem(instanceInfo.UniqueID, prevInstanceInfo.UniqueID);
            }
            TPInventory.TPWeapon.ButtonWeapon[SlotPosition].SetData(ItemInfo, instanceInfo);
            TPInventory.TPWeapon.ButtonWeapon[SlotPosition].itemBox.ChangeState(0);
            TPInventory.TPWeapon.ButtonWeapon[SlotPosition].itemBox.instanceInfo.SlotPosition = SlotPosition;
            // End:0x37E
            if(SlotPosition == 0)
            {
                TPInventory.CharacterModel.ChangeWeapon(instanceInfo.ItemID, instanceInfo.PartID, instanceInfo.PaintID);
            }
            // End:0x853
            break;
        // End:0x67F
        case 13:
            instanceInfo.SlotPosition = 13;
            TPInventory.TPWeapon.FindAndRemoveItem(ChangedNewUniqueID);
            TPInventory.TPWeapon.TPItemList.ItemList.AddShowItem(ChangedNewUniqueID);
            // End:0x535
            if(PrevSlotPos == 0)
            {
                ItemInfo = GameMgr.FindUIItem(2000);
                instanceInfo = GameMgr.FindFirstInstanceItemByItemID(2000);
                instanceInfo.SlotPosition = 0;
                GameMgr.ChangeInstance_ItemSlotPos(instanceInfo.UniqueID, instanceInfo.SlotPosition);
                TPInventory.TPWeapon.TPItemList.ItemList.RemoveShowItem(instanceInfo.UniqueID);
                TPInventory.TPWeapon.ButtonWeapon[0].SetData(ItemInfo, instanceInfo);
                TPInventory.TPWeapon.ButtonWeapon[0].itemBox.ChangeState(0);
                TPInventory.CharacterModel.ChangeWeapon(instanceInfo.ItemID, instanceInfo.PartID, instanceInfo.PaintID);                
            }
            else
            {
                // End:0x645
                if(PrevSlotPos == 1)
                {
                    ItemInfo = GameMgr.FindUIItem(1010);
                    instanceInfo = GameMgr.FindFirstInstanceItemByItemID(1010);
                    instanceInfo.SlotPosition = 1;
                    GameMgr.ChangeInstance_ItemSlotPos(instanceInfo.UniqueID, instanceInfo.SlotPosition);
                    TPInventory.TPWeapon.TPItemList.ItemList.RemoveShowItem(instanceInfo.UniqueID);
                    TPInventory.TPWeapon.ButtonWeapon[1].SetData(ItemInfo, instanceInfo);
                    TPInventory.TPWeapon.ButtonWeapon[1].itemBox.ChangeState(0);                    
                }
                else
                {
                    // End:0x67C
                    if((PrevSlotPos >= 18) && PrevSlotPos <= 22)
                    {
                        TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
                    }
                }
            }
            // End:0x853
            break;
        // End:0x684
        case 18:
        // End:0x689
        case 19:
        // End:0x68E
        case 20:
        // End:0x693
        case 21:
        // End:0x698
        case 22:
        // End:0x850
        case 23:
            prevInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[(SlotPosition - 18) + 4].itemBox.instanceInfo;
            // End:0x720
            if(prevInstanceInfo == none)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.RemoveShowItem(instanceInfo.UniqueID);                
            }
            else
            {
                prevInstanceInfo.SlotPosition = 13;
                TPInventory.TPWeapon.TPItemList.ItemList.ChangeShowItem(instanceInfo.UniqueID, prevInstanceInfo.UniqueID);
            }
            TPInventory.TPWeapon.ButtonWeapon[(SlotPosition - 18) + 4].SetData(ItemInfo, instanceInfo);
            TPInventory.TPWeapon.ButtonWeapon[(SlotPosition - 18) + 4].itemBox.ChangeState(0);
            TPInventory.TPWeapon.ButtonWeapon[(SlotPosition - 18) + 4].itemBox.instanceInfo.SlotPosition = SlotPosition;
            TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
            // End:0x853
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPInventory.TPWeapon.SelectItem(ItemInfo, instanceInfo, true);
    page_Main.TcpChannel.sfReqConfirmItemChanged();
    return true;
    //return;    
}

function bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    Log("[BTPageInventory::rfAckConfirmItemChanged] Result=" $ string(Result));
    // End:0x65
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    return true;
    //return;    
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local int SlotPosition;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    Log("[BTPageInventory::rfAckEquipSkill] Result=" $ string(Result));
    // End:0x5D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(ChangedNewSkillID);
    instanceInfo = GameMgr.FindFirstInstanceItemByItemID(ChangedNewSkillID);
    // End:0x105
    if(instanceInfo == none)
    {
        return false;
    }
    SlotPosition = int(ChangedNewSlotPosition) - 14;
    GameMgr.ChangeInstance_SkillSlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
    GameMgr.ChangeSkillBox_SlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
    switch(ChangedNewSlotPosition)
    {
        // End:0x158
        case 14:
        // End:0x15D
        case 15:
        // End:0x162
        case 16:
        // End:0x27D
        case 17:
            // End:0x1D7
            if(TPInventory.TPSkill.ButtonSkill[SlotPosition].itemBox.instanceInfo != none)
            {
                TPInventory.TPSkill.ButtonSkill[SlotPosition].itemBox.instanceInfo.SlotPosition = 13;
            }
            TPInventory.TPSkill.ButtonSkill[SlotPosition].SetData(ItemInfo, instanceInfo);
            TPInventory.TPSkill.ButtonSkill[SlotPosition].itemBox.ChangeState(0);
            TPInventory.TPSkill.ButtonSkill[SlotPosition].itemBox.instanceInfo.SlotPosition = int(ChangedNewSlotPosition);
            // End:0x2B6
            break;
        // End:0x2B3
        case 13:
            instanceInfo.SlotPosition = 13;
            TPInventory.TPSkill.FindAndRemoveItem(ChangedNewSkillID);
            // End:0x2B6
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPWarehouseSkill.RefreshItemList();
    page_Main.TcpChannel.sfReqConfirmSkillChanged();
    return true;
    //return;    
}

function bool rfReqConfirmSkillChanged()
{
    return true;
    //return;    
}

function bool BTWindowItemRepairHK_OnOK(GUIComponent Sender)
{
    local array<BtrDouble> rilist;

    Repair_UniqueItemID = BTWindowItemRepairHK(Sender).UniqueID;
    // End:0xDC
    if(BTWindowItemRepairHK(Sender).itemBox.itemBox.instanceInfo.DamageDegree >= 80000)
    {
        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 51, BTWindowItemRepairHK(Sender).itemBox.itemBox.ItemName.Text);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairItem_OnOK;
        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
        return true;        
    }
    else
    {
        rilist[0] = Repair_UniqueItemID;
        page_Main.TcpChannel.sfReqRepairItem(rilist);
    }
    //return;    
}

function bool RepairItem_OnOK(GUIComponent Sender)
{
    local array<BtrDouble> rilist;

    rilist[0] = Repair_UniqueItemID;
    page_Main.TcpChannel.sfReqRepairItem(rilist);
    Controller.CloseMenu(false);
    return true;
    //return;    
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
        if(TPInventory.TPWeapon.Equip_DamegeItemNames.Length > 0)
        {
            strItemNames = TPInventory.TPWeapon.Equip_DamegeItemNames[0];
            i = 1;
            J0x68:

            // End:0xC4 [Loop If]
            if(i < TPInventory.TPWeapon.Equip_DamegeItemNames.Length)
            {
                strItemNames = (strItemNames $ ", ") $ TPInventory.TPWeapon.Equip_DamegeItemNames[i];
                ++i;
                // [Loop Continue]
                goto J0x68;
            }
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairAllItem_OnOK;
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);            
        }
        else
        {
            LastReqRepairMode = 1;
            page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.EquipItemList);
        }        
    }
    else
    {
        // End:0x265
        if(TPInventory.TPWeapon.Inven_DamegeItemNames.Length > 0)
        {
            strItemNames = TPInventory.TPWeapon.Inven_DamegeItemNames[0];
            i = 1;
            J0x1A5:

            // End:0x201 [Loop If]
            if(i < TPInventory.TPWeapon.Inven_DamegeItemNames.Length)
            {
                strItemNames = (strItemNames $ ", ") $ TPInventory.TPWeapon.Inven_DamegeItemNames[i];
                ++i;
                // [Loop Continue]
                goto J0x1A5;
            }
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairAllItem_OnOK;
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);            
        }
        else
        {
            LastReqRepairMode = 2;
            page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.InvenItemList);
        }
    }
    return true;
    //return;    
}

function bool RepairAllItem_OnOK(GUIComponent Sender)
{
    // End:0x44
    if(RepairAllButtonID == 0)
    {
        LastReqRepairMode = 1;
        page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.EquipItemList);        
    }
    else
    {
        LastReqRepairMode = 2;
        page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.InvenItemList);
    }
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    local int i, equipRepairCost, invenRepairCost;
    local BTROItemBoxHK ro;

    Log("[BTPageInventory::rfAckRepairCost] Result=" $ string(Result));
    // End:0x5D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x19C
    if(TPInventory.TPWeapon.CurrentRepairMode == 3)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairHK");
        // End:0xF1
        if(TPWarehouseQS.bVisible == true)
        {
            ro = TPWarehouseQS.InfoBox.ItemBoxView.itemBox;            
        }
        else
        {
            ro = TPInventory.TPWeapon.InfoBox.ItemBoxView.itemBox;
        }
        BTWindowItemRepairHK(Controller.TopPage()).SetData(UniqueItemID[0], RepairCost[0], MM.kPoint, ro.ItemInfo, ro.instanceInfo);
        BTWindowItemRepairHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairHK_OnOK;        
    }
    else
    {
        i = 0;
        J0x1A3:

        // End:0x202 [Loop If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1E6
            if(i < TPInventory.TPWeapon.EquipItemCount)
            {
                equipRepairCost += RepairCost[i];
            }
            invenRepairCost += RepairCost[i];
            i++;
            // [Loop Continue]
            goto J0x1A3;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairAllHK");
        // End:0x281
        if(TPWarehouseQS.bVisible == true)
        {
            ro = BTROItemBoxHK(TPWarehouseQS.TPItemList.ItemList.GetLastSelectedItem());            
        }
        else
        {
            ro = BTROItemBoxHK(TPInventory.TPWeapon.TPItemList.ItemList.GetLastSelectedItem());
        }
        BTWindowItemRepairAllHK(Controller.TopPage()).SetData(equipRepairCost, invenRepairCost, MM.kPoint);
        BTWindowItemRepairAllHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairAllHK_OnOK;
    }
    return true;
    //return;    
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::rfAckRepairItem] Result=" $ string(Result));
    // End:0x6D
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MM.kPoint = RepairCost;
    MM.UpdateMoneyInfo(MM);
    Log("RepairItem Cost = " $ string(RepairCost));
    Log("RepairItem List Start");
    i = 0;
    J0xD8:

    // End:0x136 [Loop If]
    if(i < UniqueItemID.Length)
    {
        GameMgr.ChangeInstance_ItemDurability(UniqueItemID[i], 100000);
        GameMgr.ChangeInstance_ItemDamageDegree(UniqueItemID[i], DamageDegree[i]);
        i++;
        // [Loop Continue]
        goto J0xD8;
    }
    GameMgr.UpdateItemList(GameMgr);
    Log("RepairItem List End");
    Controller.CloseMenu(false);
    PlayerOwner().PlaySound(Controller.ItemRepairSound, 6, 1.0000000);
    // End:0x1B5
    if(LastReqRepairMode == 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 20);
    }
    // End:0x1D6
    if(LastReqRepairMode == 1)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 71);
    }
    // End:0x1F8
    if(LastReqRepairMode == 2)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 72);
    }
    LastReqRepairMode = 0;
    return true;
    //return;    
}

function bool BTWindowItemSellHK_OnSellOK(GUIComponent Sender)
{
    local export editinline BTWindowItemSellHK BTWindow;

    Log("[BTPageInventory::BTWindowItemSellHK_OnSellOK]");
    BTWindow = BTWindowItemSellHK(Sender);
    page_Main.TcpChannel.sfReqSellShopItem(BTWindow.UniqueID, BTWindow.SelectCount);
    return true;
    //return;    
}

function bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    local BTROItemBoxHK ro;
    local int MyPoint;

    Log("[BTPageInventory::rfAckSellShopItemInfo] Result=" $ string(Result));
    // End:0x63
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemSellHK");
    SellShopItemInfo_UniqueItemID = UniqueItemID;
    ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(SellShopItemInfo_UniqueItemID);
    BTWindowItemSellHK(Controller.TopPage()).SetData(UniqueItemID, SellPoint, MM.kPoint, ro.ItemInfo, ro.instanceInfo);
    BTWindowItemSellHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemSellHK_OnSellOK;
    return true;
    //return;    
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    local wMyPlayerStatus MyStatus;
    local wItemBoxInstanceHK instanceInfo;
    local BTROItemBoxHK ro;
    local string ItemName;
    local int selling_price;

    Log("[BTPageInventory::rfAckSellShopItem] Result=" $ string(Result));
    // End:0x6F
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    selling_price = PointRemain - MM.kPoint;
    MM.kPoint = PointRemain;
    MM.UpdateMoneyInfo(MM);
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(SellShopItemInfo_UniqueItemID);
    ItemName = ro.ItemInfo.ItemName;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x235
    if(Count == 0)
    {
        // End:0x1E6
        if(ro.instanceInfo.UniqueSkillID == 0)
        {
            GameMgr.RemoveInstanceItem(ro.instanceInfo.UniqueID);
            GameMgr.RemoveQuickSlotItem(ro.instanceInfo.UniqueID);            
        }
        else
        {
            GameMgr.RemoveInstanceItemByUniqueSkillID(ro.instanceInfo.UniqueSkillID);
            GameMgr.RemoveQuickSlotBoxSkillItem(ro.instanceInfo.UniqueSkillID);
        }        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(SellShopItemInfo_UniqueItemID, Count);
    }
    GameMgr.UpdateItemList(GameMgr);
    Controller.CloseMenu(false);
    PlayerOwner().PlaySound(Controller.ItemSellSound, 6, 1.0000000);
    Controller.OpenMenu("GUIWarfareControls.BTWindowInfoHK");
    BTWindowInfoHK(Controller.TopPage()).SetData(strSellingSuccess[0], 5, ((ItemName $ strSellingSuccess[1]) @ string(selling_price)) $ strSellingSuccess[2]);
    //return;    
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::rfAckModifyWeapon] Result=" $ string(Result));
    Controller.CloseMenu(false);
    // End:0x6F
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    instanceInfo = GameMgr.FindInstanceItem(UniqueID);
    instanceInfo.PartID = AddPartID;
    instanceInfo.PaintID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID);
    PlayerOwner().PlaySound(Controller.ItemAddPartsSound, 6, 1.0000000);
    RefreshWarehouse();
    return true;
    //return;    
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageInventory::rfAckUpdateQSlot] Result=" $ string(Result));
    // End:0x5E
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    return true;
    //return;    
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    local wItemBoxInstanceHK instanceInfo;

    Log((((((("[BTPageInventory::rfAckGetItemFromItemBox] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " ItemIDChoose=") $ string(ItemIDChoose)) $ " PartIDChoose=") $ string(PartIDChoose));
    // End:0xAE
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xD0
    if(BxoItemCount == 0)
    {
        GameMgr.RemoveInstanceItem(BoxItemIdx);        
    }
    else
    {
        GameMgr.ChangeInstance_StackCount(BoxItemIdx, BxoItemCount);
    }
    GameMgr.AddInstanceItemByParameter(ItemIDChoose, ItemIdx, 0, 13, 1, 100000, PartIDChoose, 0, StackCount, 0, UntilTime);
    GameMgr.UpdateItemList(GameMgr);
    return true;
    //return;    
}

defaultproperties
{
    strSellingSuccess[0]="????"
    strSellingSuccess[1]="?(?)"
    strSellingSuccess[2]="???? ???????."
    fbLabelPoint=(X1=510.0000000,Y1=81.0000000,X2=757.0000000,Y2=104.0000000)
    fbLabelCash=(X1=767.0000000,Y1=81.0000000,X2=1014.0000000,Y2=104.0000000)
    fbLabelP=(X1=519.0000000,Y1=85.0000000,X2=534.0000000,Y2=100.0000000)
    fbLabelC=(X1=776.0000000,Y1=85.0000000,X2=791.0000000,Y2=100.0000000)
    // Reference: BTTPInventoryHK'GUIWarfare_Decompressed.BTPageInventory.mTPInven'
    begin object name="mTPInven" class=GUIWarfareControls.BTTPInventoryHK
        bUseAWinPos=true
        AWinPos=(X1=10.0000000,Y1=88.0000000,X2=500.0000000,Y2=736.0000000)
    end object
    TPInventory=mTPInven
    // Reference: BTTPWarehouseSkillHK'GUIWarfare_Decompressed.BTPageInventory.mTPWarehouseSkill'
    begin object name="mTPWarehouseSkill" class=GUIWarfareControls.BTTPWarehouseSkillHK
        bUseAWinPos=true
        AWinPos=(X1=510.0000000,Y1=114.0000000,X2=600.0000000,Y2=300.0000000)
        bVisible=false
    end object
    TPWarehouseSkill=mTPWarehouseSkill
    // Reference: BTTPWarehouseQuickSlotHK'GUIWarfare_Decompressed.BTPageInventory.mTPWarehouseQS'
    begin object name="mTPWarehouseQS" class=GUIWarfareControls.BTTPWarehouseQuickSlotHK
        bUseAWinPos=true
        AWinPos=(X1=510.0000000,Y1=114.0000000,X2=600.0000000,Y2=300.0000000)
        bVisible=false
    end object
    TPWarehouseQS=mTPWarehouseQS
    currentBGM="bgm_lobby_part1"
    bPersistent=false
    OnOpen=BTPageInventory.InternalOnOpen
    OnClose=BTPageInventory.InternalOnClose
    OnRendered=BTPageInventory.InternalOnRendered
}