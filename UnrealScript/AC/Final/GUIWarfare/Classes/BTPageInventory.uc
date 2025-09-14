class BTPageInventory extends BTNetGUIPageHK
    editinlinenew
    instanced;

enum E_REPAIR_TYPE
{
    E_REPAIR_ALL,                   // 0
    E_REPAIR_EQUIPPED_ITEM,         // 1
    E_REPAIR_OWNED_ITEM             // 2
};

var int LastReqRepairMode;
var int RepairAllButtonID;
var BtrDouble SellShopItemInfo_UniqueItemID;
var BtrDouble Repair_UniqueItemID;
var localized string strSellingSuccess[3];
var Color CashColor;
var Color PointColor;
var export editinline BTMoneyInfo MoneyInfoObject;
var() automated BTTPInventoryHK TPInventory;
var BTRefreshTime rfEquipItemTime;
var int nCurQuickSlot;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() automated FloatBox fbLabelBackgrounddeco;
var int LastSelectIndex;
var export editinline BTOwnerDrawImageHK LabelSlot;
var localized string strLabelSlot;

function bool rfAckShopItemListStart(int Count)
{
    Log("[BTPageInventory::rfAckShopItemListStart] Count : " $ string(Count));
    GameMgr.ShopItemListCount = Count;
    GameMgr.ShopItemList.Length = 0;
    return true;
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    local int i;

    Log("[BTPageInventory::rfAckShopItemList]");
    i = 0;
    J0x2F:

    // End:0xDC [Loop If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
        Log((("BTPageInventory::ShopList[" $ string(i)) $ " ItemID : ") $ string(ItemID[i]));
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    return true;
    //return;    
}

function bool rfAckShopItemListEnd()
{
    Log("[BTPageInventory::rfAckShopItemListEnd]");
    return true;
    //return;    
}

function UseItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local export editinline BTItemImageListHK ItemList;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0xA5
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0xEC
    if((ItemInfo.Grade == 7) && MM.IsPlayingPCBang() == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;        
    }
    else
    {
        // End:0x13E
        if(GameMgr.CheckItemBox(ItemInfo.ItemType))
        {
            TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID, 0);
            return;            
        }
        else
        {
            // End:0xCF2
            if(GameMgr.CheckUseItem(ItemInfo.ItemType))
            {
                switch(ItemInfo.ItemID)
                {
                    // End:0x176
                    case 17004:
                    // End:0x247
                    case 17075:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 15);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xCED
                        break;
                    // End:0x24F
                    case 17005:
                    // End:0x320
                    case 17076:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 16);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xCED
                        break;
                    // End:0x3CE
                    case 17012:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 9);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0x47C
                    case 17013:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 13);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0x52A
                    case 17018:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0x5D8
                    case 17082:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 57);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0x686
                    case 17049:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 59);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0x795
                    case 17011:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 7);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kUserName;
                        BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kUserName);
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0x8D2
                    case 17017:
                        // End:0x8B9
                        if(MM.kClanName != "")
                        {
                            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 5);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kClanName;
                            BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kClanName);
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;                            
                        }
                        else
                        {
                            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 150);
                        }
                        // End:0xCED
                        break;
                    // End:0xA20
                    case 17014:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(2);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xCED
                        break;
                    // End:0xA28
                    case 17019:
                    // End:0xB75
                    case 17099:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(1);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xCED
                        break;
                    // End:0xB80
                    case 17015:
                        // End:0xCED
                        break;
                    // End:0xB8B
                    case 17016:
                        // End:0xCED
                        break;
                    // End:0xC39
                    case 17702:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 75);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0xCE7
                    case 17703:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 76);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xCED
                        break;
                    // End:0xFFFF
                    default:
                        // End:0xCED
                        break;
                        break;
                }
                return;                
            }
            else
            {
                // End:0xD5A
                if(GameMgr.CheckRandBoxItem(ItemInfo.ItemType))
                {
                    // End:0xD47
                    if(GameMgr.ReceiveRandomBox_Use)
                    {
                        TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID, EmptyBtrDouble());
                    }
                    GameMgr.ReceiveRandomBox_Use = false;
                    return;
                }
            }
        }
    }
    //return;    
}

function EquipItemSlot(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local int currentSlot;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    currentSlot = TPInventory.TPEquipItem.InvenGroup.GetSelectIndex();
    // End:0x9B
    if(GameMgr.CheckHeadItem(ItemInfo.ItemType))
    {
        TPInventory.TPEquipItem.InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0xE0
        if(GameMgr.CheckFaceItem(ItemInfo.ItemType))
        {
            TPInventory.TPEquipItem.InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x125
            if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType))
            {
                TPInventory.TPEquipItem.InvenGroup.SelectButton(1);                
            }
            else
            {
                // End:0x1D7
                if(GameMgr.CheckSpCharItem(ItemInfo.ItemType))
                {
                    // End:0x17F
                    if(ItemInfo.EquipTeam == 1)
                    {
                        TPInventory.TPEquipItem.InvenGroup.SelectButton(3);                        
                    }
                    else
                    {
                        // End:0x1BA
                        if(ItemInfo.EquipTeam == 2)
                        {
                            TPInventory.TPEquipItem.InvenGroup.SelectButton(4);                            
                        }
                        else
                        {
                            // End:0x1D4
                            if((currentSlot != 7) && currentSlot != 8)
                            {
                            }
                        }
                    }                    
                }
                else
                {
                    // End:0x21D
                    if(GameMgr.CheckLvMark(ItemInfo.ItemType))
                    {
                        TPInventory.TPEquipItem.InvenGroup.SelectButton(5);                        
                    }
                    else
                    {
                        // End:0x263
                        if(GameMgr.CheckBackPack(ItemInfo.ItemType))
                        {
                            TPInventory.TPEquipItem.InvenGroup.SelectButton(2);                            
                        }
                        else
                        {
                            // End:0x2A9
                            if(GameMgr.CheckPouch(ItemInfo.ItemType))
                            {
                                TPInventory.TPEquipItem.InvenGroup.SelectButton(6);                                
                            }
                            else
                            {
                                // End:0x2EC
                                if(GameMgr.CheckCamouflage(ItemInfo.ItemType))
                                {
                                    TPInventory.TPEquipItem.InvenGroup.SelectButton(7);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x3A7
    if(TPInventory.TPEquipItem.EquipItemSlot[TPInventory.TPEquipItem.InvenGroup.GetSelectIndex()].itemBox.instanceInfo != none)
    {
        // End:0x3A7
        if(__NFUN_912__(TPInventory.TPEquipItem.EquipItemSlot[TPInventory.TPEquipItem.InvenGroup.GetSelectIndex()].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
        {
            return;
        }
    }
    TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, TPInventory.TPEquipItem.InvenGroup.GetSelectIndex() + 18, 1);
    //return;    
}

function EquipQuickSlot(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local wGameManager GameMgr;
    local wWeaponManager WeaponMgr;
    local int iSlotPosition;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    WeaponMgr = Controller.ViewportOwner.Actor.Level.WeaponMgr;
    iSlotPosition = GameMgr.GetItemSlotByItemType(ItemInfo, nCurQuickSlot);
    // End:0xA7
    if(GameMgr.IsSameQuickSlotItem(nCurQuickSlot, byte(iSlotPosition), ItemInfo, instanceInfo))
    {
        return;
    }
    // End:0xF1
    if(iSlotPosition == -1)
    {
        // End:0xF1
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 1018);
            return;
        }
    }
    // End:0x23F
    if((iSlotPosition == int(2)) || iSlotPosition == int(3))
    {
        // End:0x23F
        if(((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo != none) && !WeaponMgr.IsEnableEquipGrenade(ItemInfo.ItemID, TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID)) || (TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo != none) && !WeaponMgr.IsEnableEquipGrenade(ItemInfo.ItemID, TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID))
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 231);
            return;
        }
    }
    // End:0x2AF
    if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
    {
        // End:0x2AC
        if(page_Main.EquipQuickSlot(nCurQuickSlot, byte(iSlotPosition), ItemInfo.ItemID, __NFUN_921__(instanceInfo.UniqueSkillID), true))
        {
            page_Main.UpdateReqQuickSlot();
        }        
    }
    else
    {
        // End:0x2F9
        if(page_Main.EquipQuickSlot(nCurQuickSlot, byte(iSlotPosition), ItemInfo.ItemID, instanceInfo.UniqueID, false))
        {
            page_Main.UpdateReqQuickSlot();
        }
    }
    //return;    
}

function EquipOnlyModeItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local int iSlotPosition;
    local bool bRet;

    iSlotPosition = GameMgr.GetItemSlotByItemType(ItemInfo);
    // End:0xE9
    if(instanceInfo.SlotPosition == int(13))
    {
        // End:0x91
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            bRet = page_Main.EquipOnlyModeItem_QS(ItemInfo.ItemID, byte(iSlotPosition), __NFUN_921__(instanceInfo.UniqueSkillID), true);            
        }
        else
        {
            bRet = page_Main.EquipOnlyModeItem_QS(ItemInfo.ItemID, byte(iSlotPosition), instanceInfo.UniqueID, false);
        }
        // End:0xE6
        if(bRet == true)
        {
            page_Main.UpdateReqQuickSlot();
        }        
    }
    else
    {
        // End:0x152
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            bRet = page_Main.UnequipOnlyModeItem_QS(ItemInfo.ItemID, byte(instanceInfo.SlotPosition), __NFUN_921__(instanceInfo.UniqueSkillID), true);            
        }
        else
        {
            bRet = page_Main.UnequipOnlyModeItem_QS(ItemInfo.ItemID, byte(instanceInfo.SlotPosition), instanceInfo.UniqueID, false);
        }
        // End:0x1B0
        if(bRet == true)
        {
            page_Main.UpdateReqQuickSlot();
        }
    }
    // End:0x1E9
    if(instanceInfo.SlotPosition == int(13))
    {
        PlayerOwner().FmodClientPlaySound(Controller.ItemEquipSuccessSound,,, 6);        
    }
    else
    {
        PlayerOwner().FmodClientPlaySound(Controller.ItemTakeoffSound,,, 6);
    }
    //return;    
}

function bool BTWindowModifyHK_OnOK(GUIComponent Sender)
{
    local BTROItemBoxHK itemBox;
    local int i;
    local export editinline BTWindowModifyHK WinModify;
    local array<int> productsNo;

    WinModify = BTWindowModifyHK(Controller.FindMenuByClass(Class'GUIWarfareControls.BTWindowModifyHK'));
    // End:0xAA
    if(UseGP20())
    {
        i = 0;
        J0x2F:

        // End:0x66 [Loop If]
        if(i < 5)
        {
            productsNo[productsNo.Length] = WinModify.SelectedProductNo[i];
            ++i;
            // [Loop Continue]
            goto J0x2F;
        }
        TcpChannel.sfReqGP20CashModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID(), productsNo);        
    }
    else
    {
        TcpChannel.sfReqModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID());
    }
    return true;
    //return;    
}

function bool TPInventoryQS_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;
    local int currentSlot;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local Object.SLOT_POS eSlotPos;
    local wGameManager GameMgr;
    local bool bRet;

    // End:0x17
    if(rfEquipItemTime.CheckCondition() == false)
    {
        return true;
    }
    btn = BTItemBoxButtonHK(Sender);
    TPInventory.TPQuickSlot.InvenGroup.SelectButton(btn.ButtonID);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    ItemInfo = TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].ItemInfo[btn.ButtonID];
    instanceInfo = TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].instanceInfo[btn.ButtonID];
    // End:0x16C
    if((ItemInfo == none) || instanceInfo == none)
    {
        return true;
    }
    eSlotPos = GameMgr.ConvertUIIndexToSlotPos(btn.ButtonID);
    // End:0x1D3
    if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
    {
        bRet = page_Main.UnEquipQuickSlot(nCurQuickSlot, eSlotPos, true);        
    }
    else
    {
        bRet = page_Main.UnEquipQuickSlot(nCurQuickSlot, eSlotPos, false);
    }
    // End:0x20F
    if(bRet == true)
    {
        page_Main.UpdateReqQuickSlot();
    }
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
    SkipTopMenuIndex = int(TPTopMenu.2);
    TPTopMenu.Shop.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.TopMenuShop_Btn_n;
    TPTopMenu.Inventory.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.TopMenuInven_Btn_on;
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Inven_bg, 0.1000000);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    i = 0;
    J0xC2:

    // End:0x104 [Loop If]
    if(i < 9)
    {
        TPInventory.TPQuickSlot.ButtonQuickSlot[i].__OnClick__Delegate = TPInventoryQS_OnClick;
        i++;
        // [Loop Continue]
        goto J0xC2;
    }
    TPInventory.TPQuickSlot.TcpChannel = TcpChannel;
    TPInventory.TPQuickSlot.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    i = 0;
    J0x14E:

    // End:0x1E8 [Loop If]
    if(i < 6)
    {
        TPInventory.TPWeapon.MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnHover__Delegate = SubButton_OnHover;
        i++;
        // [Loop Continue]
        goto J0x14E;
    }
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnlClick;
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnHover__Delegate = ImageListBox_OnHover;
    i = 0;
    J0x25F:

    // End:0x2A1 [Loop If]
    if(i < 4)
    {
        TPInventory.TPQuickSlot.ButtonTag[i].__OnClick__Delegate = TPQSClick;
        i++;
        // [Loop Continue]
        goto J0x25F;
    }
    TPInventory.TabControl.SetVisiblePanel(0);
    TPInventory.TPWeapon.FocusFirst(none);
    MoneyInfoObject = new Class'GUIWarfareControls.BTMoneyInfo';
    MoneyInfoObject.InitComponent(Controller, self);
    MoneyInfoObject.EnableCoupon(false);
    MoneyInfoObject.TcpChannel = TcpChannel;
    MoneyInfoObject.__deleClickChargeCash__Delegate = page_Main.ShowCashChargeWindow;
    AppendComponent(MoneyInfoObject);
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
    Controller.PushPage();
    TPInventory.TPWeapon.CurrentRepairMode = 3;
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
    TPInventory.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    i = 0;
    J0x58F:

    // End:0x5C8 [Loop If]
    if(i < 2)
    {
        AppendComponent(TPInventory.TPQuickSlot.QuickSlotState[i]);
        ++i;
        // [Loop Continue]
        goto J0x58F;
    }
    rfEquipItemTime = new Class'GUIWarfare_Decompressed.BTRefreshTime';
    rfEquipItemTime.SetMaxTime(0.5000000);
    LastSelectIndex = -1;
    //return;    
}

function bool CanEquipItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    // End:0x1A
    if((ItemInfo == none) || instanceInfo == none)
    {
        return false;
    }
    // End:0x4F
    if(false == GameMgr.IsEnableQuickSlot(nCurQuickSlot))
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 1016);
        return false;
    }
    // End:0x95
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return false;
    }
    // End:0xC7
    if(false == MM.CheckUsingItem(ItemInfo))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return false;
    }
    // End:0xE3
    if(false == MM.CheckEquipLevel(ItemInfo))
    {
        return false;
    }
    return true;
    //return;    
}

function bool ImageListBox_OnlClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    // End:0x17
    if(rfEquipItemTime.CheckCondition() == false)
    {
        return true;
    }
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    // End:0x6C
    if(ItemList.DataList[ItemList.LastSelectedItemIndex].bMouseClick == false)
    {
        return true;
    }
    // End:0xA9
    if((ItemList.SelectItemIndex != ItemList.VolatileSelectItemIndex) || ItemList.SelectItemIndex == -1)
    {
        return true;
    }
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    // End:0x123
    if(false == (CanEquipItem(ItemInfo, instanceInfo)))
    {
        return true;
    }
    // End:0x1CC
    if(nCurQuickSlot != 0)
    {
        // End:0x1CC
        if(((ItemInfo.ItemID == 2000) && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[0].ItemID == 2000) || (ItemInfo.ItemID == 1010) && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[1].ItemID == 1010)
        {
            return true;
        }
    }
    // End:0x1FF
    if(GameMgr.CheckOnlyModeItem(ItemInfo.byModeItem))
    {
        EquipOnlyModeItem(ItemInfo, instanceInfo);        
    }
    else
    {
        // End:0x232
        if(GameMgr.CheckQuickSlotItem(ItemInfo.ItemType))
        {
            EquipQuickSlot(ItemInfo, instanceInfo);            
        }
        else
        {
            // End:0x265
            if(GameMgr.CheckEquipSlotItem(ItemInfo.ItemType))
            {
                EquipItemSlot(ItemInfo, instanceInfo);                
            }
            else
            {
                UseItem(ItemInfo, instanceInfo);
            }
        }
    }
    return true;
    //return;    
}

function bool TPQSClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ChangeQuickSlot(btn.ButtonID);
    return false;
    //return;    
}

function ChangeQuickSlot(int slotNum)
{
    nCurQuickSlot = slotNum;
    TPInventory.TPQuickSlot.ChangeQuickSlot(nCurQuickSlot, true);
    // End:0xC9
    if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0] == none)
    {
        TPInventory.TPEquipItem.CharacterModel.DeleteWeapone();
        self.TPInventory.TPEquipItem.CharacterModel.PlayAnim(self.TPInventory.TPEquipItem.CharacterModel.NoHaveWeaponIdle, 1.0000000, 0.2000000);        
    }
    else
    {
        self.TPInventory.TPEquipItem.CharacterModel.ChangeWeapon(self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].ItemID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PartID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PaintID);
    }
    //return;    
}

function bool SubButton_OnHover(GUIComponent Sender)
{
    local int mainTab, subTab;

    mainTab = TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex();
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
    if(bShowWeaponeTypeList && int(TPInventory.TPWeapon.SubButton[1].MenuState) == int(4))
    {
        SetVisibleWeaponeTypeBtnList(true, true);
    }
    // End:0x126
    if(bShowSkillTypeList && int(TPInventory.TPWeapon.SubButton[1].MenuState) == int(4))
    {
        SetVisibleSkillTypeBtnList(true, true);
    }
    return true;
    //return;    
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPInventory.TPWeapon.TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    TPInventory.TPWeapon.ChangeItemList(TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    TPInventory.TPWeapon.SubTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshSlotNum();
    // End:0x16F
    if((TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex() == 1) && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x16F
        if(bShowWeaponeTypeList && int(TPInventory.TPWeapon.SubButton[1].MenuState) == int(4))
        {
            SetVisibleWeaponeTypeBtnList(true, false);
        }
    }
    // End:0x1F4
    if((TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex() == 3) && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x1F4
        if(bShowSkillTypeList && int(TPInventory.TPWeapon.SubButton[1].MenuState) == int(4))
        {
            SetVisibleSkillTypeBtnList(true, false);
        }
    }
    // End:0x279
    if((TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex() == 3) && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x279
        if(bShowSkillTypeList && int(TPInventory.TPWeapon.SubButton[1].MenuState) == int(4))
        {
            SetVisibleSkillTypeBtnList(true, false);
        }
    }
    return true;
    //return;    
}

function bool ImageListBox_OnHover(GUIComponent Sender)
{
    return false;
    //return;    
}

function bool WeaponListClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x51
        case 0:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowMainWeapon();
            // End:0x150
            break;
        // End:0x82
        case 1:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowAR();
            // End:0x150
            break;
        // End:0xB4
        case 2:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowSMG();
            // End:0x150
            break;
        // End:0xE6
        case 3:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowSR();
            // End:0x150
            break;
        // End:0x118
        case 4:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowShotgun();
            // End:0x150
            break;
        // End:0x14D
        case 5:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowMG();
            // End:0x150
            break;
            // End:0x150
            break;
        // End:0xFFFF
        default:
            break;
    }
    RefreshSlotNum();
    TPInventory.TPWeapon.AddSubMenuBtns();
    SetVisibleWeaponeTypeBtnList(false, false);
    LastSelectIndex = -1;
    return false;
    //return;    
}

function bool SkillListClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x51
    if(btn.ButtonID == 0)
    {
        TPInventory.TPWeapon.TPItemList.ItemList.ShowActiveSkill();        
    }
    else
    {
        TPInventory.TPWeapon.TPItemList.ItemList.ShowActiveSkillOnlyOne(btn.ButtonID);
    }
    RefreshSlotNum();
    TPInventory.TPWeapon.AddSubMenuBtns();
    SetVisibleSkillTypeBtnList(false, false);
    LastSelectIndex = -1;
    return false;
    //return;    
}

function ClearChatLog_Extra()
{
    TPInventory.TPWeapon.ChatBox.Clear();
    //return;    
}

function NormalChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    //return;    
}

function ClanChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    //return;    
}

function WhisperChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    //return;    
}

function SelfChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    //return;    
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    //return;    
}

function TeamChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
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
    RefreshWarehouse(true);
    //return;    
}

function UpdateWebzenItemList(wGameManager MM)
{
    Log("[BTPageInventory::UpdateWebzenItemList]");
    RefreshWarehouse(true);
    //return;    
}

function UpdateServerTime(wGameManager GameMgr)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::UpdateServerTime]");
    RefreshWarehouse(true);
    // End:0xC4
    if(page_Main.rMM.kFirstIntoInventory == false)
    {
        page_Main.rMM.kFirstIntoInventory = true;
        instanceInfo = GameMgr.FindFirstInstanceItemByItemID(17001);
        // End:0xC4
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
    page_Main.TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID, 0);
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

function bool Internal_OnPreDraw(Canvas C)
{
    local int SelIndex;
    local RenderObject ro;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;
    local bool bActivePage;

    InternalOnPreDraw(C);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    SelIndex = TPInventory.TPWeapon.TPItemList.ItemList.SelectItemIndex;
    // End:0x2EA
    if((SelIndex >= 0) && LastSelectIndex != SelIndex)
    {
        ro = TPInventory.TPWeapon.TPItemList.ItemList.DataList[SelIndex];
        // End:0x2DF
        if((ro != none) && BTROItemBoxHK(ro).ItemInfo != none)
        {
            ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
            ItemInfo = BTROItemBoxHK(ro).ItemInfo;
            instanceInfo = BTROItemBoxHK(ro).instanceInfo;
            cItemInfo = none;
            cInstanceInfo = none;
            // End:0x1BD
            if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType))
            {
                cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[0];
                cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0];                
            }
            else
            {
                // End:0x234
                if(GameMgr.CheckSubWeaponItem(ItemInfo.ItemType))
                {
                    cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[1];
                    cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[1];                    
                }
                else
                {
                    // End:0x2AA
                    if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
                    {
                        cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2];
                        cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[2];
                    }
                }
            }
            TPInventory.TPWeapon.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        }
        LastSelectIndex = SelIndex;
    }
    bActivePage = RecursiveActiveOwner(self);
    // End:0x489
    if(!IsOpenPopupMenu() && bActivePage)
    {
        // End:0x42D
        if((Controller.MouseX >= TPInventory.TPWeapon.fbTPItemList.X1) && Controller.MouseY >= TPInventory.TPWeapon.fbTPItemList.Y1)
        {
            // End:0x42A
            if((Controller.MouseX <= TPInventory.TPWeapon.fbTPItemList.X2) && Controller.MouseY <= TPInventory.TPWeapon.fbTPItemList.Y2)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetFocus(TPInventory.TPWeapon.TPItemList.ItemList.ImageList);
            }            
        }
        else
        {
            TPInventory.TPWeapon.TPItemList.ItemList.ImageList.LoseFocus(TPInventory.TPWeapon.TPItemList.ItemList.ImageList);
        }
    }
    rfEquipItemTime.Update(PlayerOwner().Level.AppDeltaTime);
    return true;
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
    __NFUN_270__("BTPageInventory::InternalOnOpen()");
    Log("[BTPageInventory::InternalOnOpen] ");
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    TPInventory.TPWeapon.TcpChannel = TcpChannel;
    TPInventory.TPEquipItem.TcpChannel = TcpChannel;
    MM.SetCurSubPos(3);
    InitializeDelegate();
    RefreshWarehouse();
    RefreshSlotNum();
    TPInventory.TPEquipItem.CharacterModel.BeginModel();
    page_Main.TcpChannel.sfReqChangeUserState(5, 0);
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    ChangeQuickSlot(0);
    TPInventory.TPEquipItem.CharacterModel.ChangeEquipItem(GameMgr);
    TPInventory.TPWeapon.AddSubMenuBtns();
    // End:0x1EE
    if(GameMgr.ShopItemListCount == 0)
    {
        page_Main.TcpChannel.sfReqShopItemList();
    }
    // End:0x228
    if(int(page_Main.rMM.kInterfaceGuideStep) == 3)
    {
        page_Main.rMM.kInterfaceGuideStep = 4;
    }
    TPInventory.TPQuickSlot.QSButtonGroup.SelectButton(0);
    page_Main.TcpChannel.sfReqGetServerTime();
    page_Main.CheckWebzenShopItemList();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageInventory::InternalOnClose()");
    Log("[BTPageInventory::InternalOnClose] ");
    TPInventory.TPEquipItem.CharacterModel.EndModel();
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
    UnInitializeDelegate();
    OnClose(bCanceled);
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

function RefreshQuickSlot()
{
    local int i, selectIndex;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    selectIndex = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    i = 0;
    J0x5D:

    // End:0x1A3 [Loop If]
    if(i < 9)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[i];
        // End:0x16B
        if(instanceInfo != none)
        {
            ItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[i];
            // End:0x13A
            if((ItemInfo != none) && int(ItemInfo.byModeItem) == 0)
            {
                self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(ItemInfo, instanceInfo);                
            }
            else
            {
                self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(none, none);
            }
            // [Explicit Continue]
            goto J0x199;
        }
        self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(none, none);
        J0x199:

        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    TPInventory.TPQuickSlot.RefreshModifyBtn();
    TPInventory.TPQuickSlot.InitializeItemInfo();
    //return;    
}

function RefreshCashNPoint()
{
    Log("[BTPageInventory::RefreshCashNPoint]");
    MoneyInfoObject.RefreshCashNPoint(GameMgr, MM);
    //return;    
}

function FillQuickSlotInventories()
{
    TPInventory.TPQuickSlot.FillQuickSlotData();
    //return;    
}

function RefreshWarehouse(optional bool isSkipAddQSNum)
{
    local int TabIndex[2], topIdx, SelectIdx;

    TabIndex[0] = TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex();
    TabIndex[1] = TPInventory.TPWeapon.TabControl[1].GetCurrentTabIndex();
    topIdx = TPInventory.TPWeapon.TPItemList.ItemList.ImageList.Top;
    SelectIdx = TPInventory.TPWeapon.TPItemList.ItemList.LastSelectedItemIndex;
    // End:0xCF
    if(SelectIdx < 0)
    {
        SelectIdx = 0;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPInventory.TPWeapon.fill();
    FillQuickSlotInventories();
    RefreshCashNPoint();
    TPInventory.TPEquipItem.Refresh();
    RefreshQuickSlot();
    TPInventory.TPWeapon.MainTabSelect(TabIndex[0], TabIndex[1], true);
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetIndex(SelectIdx);
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(topIdx);
    TPInventory.TPWeapon.SetInfoBox(SelectIdx);
    // End:0x202
    if(isSkipAddQSNum == true)
    {
        return;
    }
    RefreshSlotNum();
    //return;    
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPInventory.TPWeapon.MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    TPInventory.TPWeapon.MainTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshSlotNum();
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
        return true;
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
    // End:0x187
    if(int(ItemInfo.byModeItem) != 0)
    {
        GameMgr.SetInstance_ItemSlotPos(ChangedNewUniqueID, ChangedNewSlotPosition);
        RefreshSlotNum();
        return true;
    }
    switch(SlotPosition)
    {
        // End:0x1FE
        case int(13):
            instanceInfo.SlotPosition = int(13);
            TPInventory.TPEquipItem.EquipItemSlot[PrevSlotPos - 18].SetData(none, none);
            TPInventory.TPEquipItem.CharacterModel.ChangeEquipItem(GameMgr);
            // End:0x332
            break;
        // End:0x205
        case int(18):
        // End:0x20C
        case int(19):
        // End:0x213
        case int(20):
        // End:0x21A
        case int(21):
        // End:0x221
        case int(22):
        // End:0x228
        case int(23):
        // End:0x22F
        case int(24):
        // End:0x32F
        case int(25):
            // End:0x2BD
            if(TPInventory.TPEquipItem.EquipItemSlot[SlotPosition - 18].itemBox != none)
            {
                prevInstanceInfo = TPInventory.TPEquipItem.EquipItemSlot[SlotPosition - 18].itemBox.instanceInfo;
                // End:0x2BD
                if(prevInstanceInfo != none)
                {
                    prevInstanceInfo.SlotPosition = int(13);
                }
            }
            TPInventory.TPEquipItem.EquipItemSlot[SlotPosition - 18].SetData(ItemInfo, instanceInfo);
            instanceInfo.SlotPosition = SlotPosition;
            TPInventory.TPEquipItem.CharacterModel.ChangeEquipItem(GameMgr);
            // End:0x332
            break;
        // End:0xFFFF
        default:
            break;
    }
    page_Main.TcpChannel.sfReqConfirmItemChanged();
    RefreshSlotNum();
    rfEquipItemTime.Update(rfEquipItemTime.fMaxTime);
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
    // End:0x164
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
            LastReqRepairMode = int(1);
            page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.EquipItemList);
        }        
    }
    else
    {
        // End:0x268
        if(TPInventory.TPWeapon.Inven_DamegeItemNames.Length > 0)
        {
            strItemNames = TPInventory.TPWeapon.Inven_DamegeItemNames[0];
            i = 1;
            J0x1A8:

            // End:0x204 [Loop If]
            if(i < TPInventory.TPWeapon.Inven_DamegeItemNames.Length)
            {
                strItemNames = (strItemNames $ ", ") $ TPInventory.TPWeapon.Inven_DamegeItemNames[i];
                ++i;
                // [Loop Continue]
                goto J0x1A8;
            }
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairAllItem_OnOK;
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);            
        }
        else
        {
            LastReqRepairMode = int(2);
            page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.InvenItemList);
        }
    }
    TPInventory.TPWeapon.SendProtocall = false;
    return true;
    //return;    
}

function bool RepairAllItem_OnOK(GUIComponent Sender)
{
    // End:0x47
    if(RepairAllButtonID == 0)
    {
        LastReqRepairMode = int(1);
        page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.EquipItemList);        
    }
    else
    {
        LastReqRepairMode = int(2);
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
    // End:0x166
    if(TPInventory.TPWeapon.CurrentRepairMode == 3)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairHK");
        ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(UniqueItemID[0]);
        BTWindowItemRepairHK(Controller.TopPage()).SetData(UniqueItemID[0], RepairCost[0], MM.kPoint, ro.ItemInfo, ro.instanceInfo);
        BTWindowItemRepairHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairHK_OnOK;        
    }
    else
    {
        i = 0;
        J0x16D:

        // End:0x1CC [Loop If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1B0
            if(i < TPInventory.TPWeapon.EquipItemCount)
            {
                equipRepairCost += RepairCost[i];
            }
            invenRepairCost += RepairCost[i];
            i++;
            // [Loop Continue]
            goto J0x16D;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairAllHK");
        ro = BTROItemBoxHK(TPInventory.TPWeapon.TPItemList.ItemList.GetLastSelectedItem());
        BTWindowItemRepairAllHK(Controller.TopPage()).SetData(equipRepairCost, invenRepairCost, MM.kPoint);
        BTWindowItemRepairAllHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairAllHK_OnOK;
    }
    TPInventory.TPWeapon.SendProtocall = false;
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
    PlayerOwner().FmodClientPlaySound(Controller.ItemRepairSound,,, 6);
    // End:0x1B8
    if(LastReqRepairMode == int(0))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 20);
    }
    // End:0x1DC
    if(LastReqRepairMode == int(1))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 71);
    }
    // End:0x200
    if(LastReqRepairMode == int(2))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 72);
    }
    LastReqRepairMode = int(0);
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

function bool rfAckUpdateQSlot_2(int Result, string ErrMsg, array<byte> DisplayOrder, array<int> ItemTID, array<BtrDouble> ItemUID, array<byte> SlotPos_Key, array<byte> SlotPos_Value)
{
    local int lp1, iSlotPosition;
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::rfAckUpdateQSlot_2] Result=" $ string(Result));
    // End:0x60
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    lp1 = 0;
    J0x96:

    // End:0x3B4 [Loop If]
    if(lp1 < DisplayOrder.Length)
    {
        // End:0xBD
        if(int(DisplayOrder[lp1]) == 255)
        {
            // [Explicit Continue]
            goto J0x3AA;
        }
        iSlotPosition = GameMgr.ConvertSlotPosToUIIndex(SlotPos_Key[lp1]);
        // End:0xEF
        if(-1 == iSlotPosition)
        {
            // [Explicit Continue]
            goto J0x3AA;
        }
        // End:0x169
        if(int(SlotPos_Value[lp1]) == 0)
        {
            TPInventory.TPQuickSlot.SaveQS[int(DisplayOrder[lp1])].ItemInfo[iSlotPosition] = none;
            TPInventory.TPQuickSlot.SaveQS[int(DisplayOrder[lp1])].instanceInfo[iSlotPosition] = none;            
        }
        else
        {
            ItemInfo = GameMgr.FindUIItem(ItemTID[lp1]);
            // End:0x209
            if(__NFUN_913__(ItemUID[lp1], EmptyBtrDouble()))
            {
                // End:0x1E6
                if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
                {
                    instanceInfo = GameMgr.FindInstanceSkillItem(__NFUN_923__(ItemUID[lp1]));                    
                }
                else
                {
                    instanceInfo = GameMgr.FindInstanceItem(ItemUID[lp1]);
                }                
            }
            else
            {
                instanceInfo = GameMgr.FindFirstInstanceItemByItemID(ItemTID[lp1]);
            }
            // End:0x2AB
            if(int(ItemInfo.byModeItem) == 0)
            {
                TPInventory.TPQuickSlot.SaveQS[int(DisplayOrder[lp1])].ItemInfo[iSlotPosition] = ItemInfo;
                TPInventory.TPQuickSlot.SaveQS[int(DisplayOrder[lp1])].instanceInfo[iSlotPosition] = instanceInfo;
            }
        }
        // End:0x3AA
        if((iSlotPosition == int(0)) && int(ItemInfo.byModeItem) == 0)
        {
            // End:0x3AA
            if(nCurQuickSlot == int(DisplayOrder[lp1]))
            {
                // End:0x341
                if(instanceInfo != none)
                {
                    TPInventory.TPEquipItem.CharacterModel.ChangeWeapon(instanceInfo.ItemID, instanceInfo.PartID, instanceInfo.PaintID);
                    // [Explicit Continue]
                    goto J0x3AA;
                }
                TPInventory.TPEquipItem.CharacterModel.DeleteWeapone();
                TPInventory.TPEquipItem.CharacterModel.PlayAnim(TPInventory.TPEquipItem.CharacterModel.NoHaveWeaponIdle, 1.0000000, 0.2000000);
            }
        }
        J0x3AA:

        ++lp1;
        // [Loop Continue]
        goto J0x96;
    }
    page_Main.TcpChannel.sfReqConfirmItemChanged();
    page_Main.UpdateAckQuickSlot_2(DisplayOrder, ItemTID, ItemUID, SlotPos_Key, SlotPos_Value);
    RefreshSlotNum();
    RefreshQuickSlot();
    rfEquipItemTime.Update(rfEquipItemTime.fMaxTime);
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent();
    self.TPInventory.TPQuickSlot.ShowSkillTransparent();
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
    PlayerOwner().FmodClientPlaySound(Controller.ItemSellSound,,, 6);
    Controller.OpenMenu("GUIWarfareControls.BTWindowInfoHK");
    BTWindowInfoHK(Controller.TopPage()).SetData(strSellingSuccess[0], 5, ((ItemName $ strSellingSuccess[1]) @ string(selling_price)) $ strSellingSuccess[2]);
    //return;    
}

function ReceiveModifyWeapon(BtrDouble UniqueID, int AddPartID, int PaintID)
{
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    instanceInfo = GameMgr.FindInstanceItem(UniqueID);
    instanceInfo.PartID = AddPartID;
    instanceInfo.PaintID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID);
    PlayerOwner().FmodClientPlaySound(Controller.ItemAddPartsSound,,, 6);
    RefreshWarehouse(true);
    // End:0x145
    if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].UniqueID, instanceInfo.UniqueID))
    {
        TPInventory.TPEquipItem.CharacterModel.ChangeWeaponsParts(instanceInfo.PartID);
        TPInventory.TPEquipItem.CharacterModel.ChangeWeaponsPaints(instanceInfo.PaintID);
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

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageInventory::rfAckUpdateQSlot] Result=" $ string(Result));
    rfEquipItemTime.Update(rfEquipItemTime.fMaxTime);
    // End:0x7B
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    ChangeQuickSlot(nCurQuickSlot);
    RefreshSlotNum();
    return true;
    //return;    
}

function RefreshSlotNum()
{
    local int i, j, k;
    local BTROItemBoxHK ro;
    local bool bFoundEquipItem, bMatchQuickSlot;

    i = 0;
    J0x07:

    // End:0x83 [Loop If]
    if(i < TPInventory.TPWeapon.slotNum.Length)
    {
        TPInventory.TPWeapon.slotNum[i].SetVisibility(false);
        TPInventory.TPWeapon.slotNum[i].SetEnabled(false);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    TPInventory.TPWeapon.slotNum.Length = 0;
    i = 0;
    J0xA4:

    // End:0x120 [Loop If]
    if(i < TPInventory.TPWeapon.EquipItemSlot.Length)
    {
        TPInventory.TPWeapon.EquipItemSlot[i].SetVisibility(false);
        TPInventory.TPWeapon.EquipItemSlot[i].SetEnabled(false);
        i++;
        // [Loop Continue]
        goto J0xA4;
    }
    TPInventory.TPWeapon.EquipItemSlot.Length = 0;
    j = 0;
    J0x141:

    // End:0x4CD [Loop If]
    if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
        i = 0;
        J0x1B1:

        // End:0x4C3 [Loop If]
        if(i < TPInventory.TPQuickSlot.SaveQS.Length)
        {
            bFoundEquipItem = false;
            k = 0;
            J0x1E2:

            // End:0x4AD [Loop If]
            if(k < 9)
            {
                // End:0x21F
                if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[k] == none)
                {
                    // [Explicit Continue]
                    goto J0x4A3;
                }
                // End:0x4A3
                if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[k].UniqueID, ro.instanceInfo.UniqueID))
                {
                    bMatchQuickSlot = false;
                    // End:0x2CB
                    if((int(TPInventory.TPQuickSlot.0) == k) && GameMgr.CheckMainWeaponItem(ro.ItemInfo.ItemType))
                    {
                        bMatchQuickSlot = true;                        
                    }
                    else
                    {
                        // End:0x321
                        if((int(TPInventory.TPQuickSlot.1) == k) && GameMgr.CheckSubWeaponItem(ro.ItemInfo.ItemType))
                        {
                            bMatchQuickSlot = true;                            
                        }
                        else
                        {
                            // End:0x377
                            if((int(TPInventory.TPQuickSlot.2) == k) && GameMgr.CheckThrowingWeapon(ro.ItemInfo.ItemType))
                            {
                                bMatchQuickSlot = true;                                
                            }
                            else
                            {
                                // End:0x3CD
                                if((int(TPInventory.TPQuickSlot.3) == k) && GameMgr.CheckThrowingWeapon(ro.ItemInfo.ItemType))
                                {
                                    bMatchQuickSlot = true;                                    
                                }
                                else
                                {
                                    // End:0x420
                                    if((int(TPInventory.TPQuickSlot.4) == k) && GameMgr.CheckMeleeWeapon(ro.ItemInfo.ItemType))
                                    {
                                        bMatchQuickSlot = true;
                                    }
                                }
                            }
                        }
                    }
                    // End:0x4A3
                    if(bMatchQuickSlot)
                    {
                        TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                        TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                        bFoundEquipItem = true;
                        // [Explicit Break]
                        goto J0x4AD;
                    }
                }
                J0x4A3:

                k++;
                // [Loop Continue]
                goto J0x1E2;
            }
            J0x4AD:

            // End:0x4B9
            if(bFoundEquipItem)
            {
                // [Explicit Break]
                goto J0x4C3;
            }
            i++;
            // [Loop Continue]
            goto J0x1B1;
        }
        J0x4C3:

        j++;
        // [Loop Continue]
        goto J0x141;
    }
    j = 0;
    J0x4D4:

    // End:0x6A7 [Loop If]
    if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
        // End:0x69D
        if(ro.instanceInfo.SlotPosition != int(13))
        {
            // End:0x617
            if(int(ro.ItemInfo.byModeItem) == 0)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipItemSlot(ro.ItemInfo.ItemType, ro.ItemInfo.EquipTeam, ro.instanceInfo.UniqueID);
                // [Explicit Continue]
                goto J0x69D;
            }
            // End:0x66C
            if(ro.ItemInfo.bSkill == true)
            {
                TPInventory.TPWeapon.AddEquipModeItemSlot(true, __NFUN_921__(0), ro.instanceInfo.UniqueSkillID);
                // [Explicit Continue]
                goto J0x69D;
            }
            TPInventory.TPWeapon.AddEquipModeItemSlot(false, ro.instanceInfo.UniqueID, 0);
        }
        J0x69D:

        j++;
        // [Loop Continue]
        goto J0x4D4;
    }
    TPInventory.TPQuickSlot.RefreshModifyBtn();
    //return;    
}

function bool Internal_KeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    Log("[BTPageCredit::Internal_KeyEvent]");
    iKey = key;
    iAction = Action;
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

defaultproperties
{
    strSellingSuccess[0]="Sale Complete"
    strSellingSuccess[1]=" was sold for "
    strSellingSuccess[2]=" points."
    // Reference: BTTPInventoryHK'GUIWarfare_Decompressed.BTPageInventory.mTPInven'
    begin object name="mTPInven" class=GUIWarfareControls.BTTPInventoryHK
        bUseAWinPos=true
        AWinPos=(X1=10.0000000,Y1=88.0000000,X2=500.0000000,Y2=736.0000000)
    end object
    TPInventory=mTPInven
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    strLabelSlot="Quick Slot"
    currentBGM="bgm_lobby_part1"
    bPersistent=false
    OnOpen=BTPageInventory.InternalOnOpen
    OnClose=BTPageInventory.InternalOnClose
    OnKeyEvent=BTPageInventory.Internal_KeyEvent
}