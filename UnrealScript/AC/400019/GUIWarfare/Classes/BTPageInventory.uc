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
    local BtrTime t, t2;
    local wMyPlayerStatus MyStatus;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    Log("[BTPageInventory::rfAckShopItemListEnd]");
    return true;
    //return;    
}

function UseItem()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0x12D
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x174
    if((ItemInfo.Grade == 7) && MM.IsPlayingPCBang() == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;        
    }
    else
    {
        // End:0x1C6
        if(GameMgr.CheckItemBox(ItemInfo.ItemType))
        {
            TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID, 0);
            return;            
        }
        else
        {
            // End:0xD7A
            if(GameMgr.CheckUseItem(ItemInfo.ItemType))
            {
                switch(ItemInfo.ItemID)
                {
                    // End:0x1FE
                    case 17004:
                    // End:0x2CF
                    case 17075:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 15);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xD75
                        break;
                    // End:0x2D7
                    case 17005:
                    // End:0x3A8
                    case 17076:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 16);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xD75
                        break;
                    // End:0x456
                    case 17012:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 9);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0x504
                    case 17013:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 13);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0x5B2
                    case 17018:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0x660
                    case 17082:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 57);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0x70E
                    case 17049:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 59);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0x81D
                    case 17011:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 7);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kUserName;
                        BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kUserName);
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0x95A
                    case 17017:
                        // End:0x941
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
                        // End:0xD75
                        break;
                    // End:0xAA8
                    case 17014:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(2);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xD75
                        break;
                    // End:0xAB0
                    case 17019:
                    // End:0xBFD
                    case 17099:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(1);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xD75
                        break;
                    // End:0xC08
                    case 17015:
                        // End:0xD75
                        break;
                    // End:0xC13
                    case 17016:
                        // End:0xD75
                        break;
                    // End:0xCC1
                    case 17702:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 75);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0xD6F
                    case 17703:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 76);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xD75
                        break;
                    // End:0xFFFF
                    default:
                        // End:0xD75
                        break;
                        break;
                }
                return;                
            }
            else
            {
                // End:0xDBF
                if(GameMgr.CheckRandBoxItem(ItemInfo.ItemType))
                {
                    TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID, EmptyBtrDouble());
                    return;
                }
            }
        }
    }
    //return;    
}

function EquipItemSlot()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    currentSlot = TPInventory.TPEquipItem.InvenGroup.GetSelectIndex();
    // End:0x123
    if(GameMgr.CheckHeadItem(ItemInfo.ItemType))
    {
        TPInventory.TPEquipItem.InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0x168
        if(GameMgr.CheckFaceItem(ItemInfo.ItemType))
        {
            TPInventory.TPEquipItem.InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x1AD
            if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType))
            {
                TPInventory.TPEquipItem.InvenGroup.SelectButton(1);                
            }
            else
            {
                // End:0x25F
                if(GameMgr.CheckSpCharItem(ItemInfo.ItemType))
                {
                    // End:0x207
                    if(ItemInfo.EquipTeam == 1)
                    {
                        TPInventory.TPEquipItem.InvenGroup.SelectButton(3);                        
                    }
                    else
                    {
                        // End:0x242
                        if(ItemInfo.EquipTeam == 2)
                        {
                            TPInventory.TPEquipItem.InvenGroup.SelectButton(4);                            
                        }
                        else
                        {
                            // End:0x25C
                            if((currentSlot != 7) && currentSlot != 8)
                            {
                            }
                        }
                    }                    
                }
                else
                {
                    // End:0x2A5
                    if(GameMgr.CheckLvMark(ItemInfo.ItemType))
                    {
                        TPInventory.TPEquipItem.InvenGroup.SelectButton(5);                        
                    }
                    else
                    {
                        // End:0x2EB
                        if(GameMgr.CheckBackPack(ItemInfo.ItemType))
                        {
                            TPInventory.TPEquipItem.InvenGroup.SelectButton(2);                            
                        }
                        else
                        {
                            // End:0x331
                            if(GameMgr.CheckPouch(ItemInfo.ItemType))
                            {
                                TPInventory.TPEquipItem.InvenGroup.SelectButton(6);                                
                            }
                            else
                            {
                                // End:0x374
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
    TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, TPInventory.TPEquipItem.InvenGroup.GetSelectIndex() + 18);
    //return;    
}

function bool IsEnableEquipGrenade(int ItemID, int ItemID1)
{
    local wWeaponManager WeaponMgr;
    local wWeaponBaseParams WBP, wbp1;

    // End:0x11
    if(ItemID == ItemID1)
    {
        return false;
    }
    WeaponMgr = Controller.ViewportOwner.Actor.Level.WeaponMgr;
    WBP = WeaponMgr.GetBaseParam(ItemID);
    // End:0x75
    if(int(WBP.eType) != int(5))
    {
        return true;
    }
    wbp1 = WeaponMgr.GetBaseParam(ItemID1);
    // End:0xAA
    if(int(wbp1.eType) != int(5))
    {
        return true;
    }
    // End:0xD1
    if(int(WBP.damtype) == int(wbp1.damtype))
    {
        return false;
    }
    return true;
    //return;    
}

function EquipQuickSlot()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x130
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType) && currentSlot != 0)
    {
        TPInventory.TPQuickSlot.InvenGroup.SelectButton(int(0));
    }
    // End:0x185
    if(GameMgr.CheckSubWeaponItem(ItemInfo.ItemType) && currentSlot != 1)
    {
        TPInventory.TPQuickSlot.InvenGroup.SelectButton(int(1));        
    }
    else
    {
        // End:0x444
        if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
        {
            // End:0x1F8
            if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2] == none)
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(int(2));                
            }
            else
            {
                // End:0x24B
                if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3] == none)
                {
                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(int(3));                    
                }
                else
                {
                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(int(2));
                }
            }
            // End:0x31B
            if(!IsEnableEquipGrenade(ItemInfo.ItemID, TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID) || !IsEnableEquipGrenade(ItemInfo.ItemID, TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID))
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                return;
            }
            currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
            // End:0x3C3
            if((currentSlot == 2) && instanceInfo.SlotPosition == 3)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[instanceInfo.SlotPosition] = none;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[instanceInfo.SlotPosition] = none;
            }
            // End:0x444
            if((currentSlot == 3) && instanceInfo.SlotPosition == 2)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[instanceInfo.SlotPosition] = none;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[instanceInfo.SlotPosition] = none;
            }
        }
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x4FF
    if(currentSlot < 4)
    {
        // End:0x491
        if(currentSlot == instanceInfo.SlotPosition)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex());
        PlayerOwner().FmodClientPlaySound(Controller.ItemEquipSuccessSound,,, 6);        
    }
    else
    {
        // End:0x521
        if(currentSlot == ((instanceInfo.SlotPosition - 18) + 4))
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, (TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex() + 18) - 4);
        PlayerOwner().FmodClientPlaySound(Controller.ItemEquipSuccessSound,,, 6);
    }
    //return;    
}

function EquipSkill(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local int currentSlot, invenSlot;
    local wMyPlayerStatus MyStatus;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    // End:0x51
    if(instanceInfo.SlotPosition != int(13))
    {
        return;
    }
    // End:0x68
    if(ItemInfo.bSkill == false)
    {
        return;
    }
    // End:0x90
    if(int(byte(ItemInfo.SkillUseType)) == int(0))
    {
        currentSlot = int(14);        
    }
    else
    {
        // End:0x187
        if(int(byte(ItemInfo.SkillUseType)) == int(1))
        {
            invenSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
            // End:0x17A
            if(((invenSlot >= int(TPInventory.TPQuickSlot.5)) && invenSlot <= int(TPInventory.TPQuickSlot.7)) && TPInventory.TPQuickSlot.IsEnableSkillSlot(invenSlot - int(TPInventory.TPQuickSlot.4)))
            {
                currentSlot = int(15) + (invenSlot - int(TPInventory.TPQuickSlot.5));                
            }
            else
            {
                currentSlot = int(15);
            }            
        }
        else
        {
            return;
        }
    }
    // End:0x1A3
    if(currentSlot == instanceInfo.SlotPosition)
    {
        return;
    }
    TcpChannel.sfReqEquipSkill(instanceInfo.ItemID, instanceInfo.UniqueSkillID, byte(currentSlot));
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

    btn = BTItemBoxButtonHK(Sender);
    TPInventory.TPQuickSlot.InvenGroup.SelectButton(btn.ButtonID);
    // End:0x61
    if(nCurQuickSlot == 0)
    {
        UnequipItem(btn.ButtonID);        
    }
    else
    {
        UnequipQuickSlot(btn.ButtonID);
    }
    return true;
    //return;    
}

function UnequipItem(int ButtonID)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[ButtonID];
    instanceInfo = TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[ButtonID];
    // End:0x21C
    if(instanceInfo != none)
    {
        // End:0xD6
        if((ItemInfo.ItemID == GameMgr.GetMainWeaponID()) || ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        // End:0x144
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            TcpChannel.sfReqEquipSkill(instanceInfo.ItemID, instanceInfo.UniqueSkillID, 13);
            PlayerOwner().FmodClientPlaySound(Controller.ItemTakeoffSound,,, 6);
            return;
        }
        // End:0x189
        if(instanceInfo.SlotPosition == 0)
        {
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);            
        }
        else
        {
            // End:0x1CE
            if(instanceInfo.SlotPosition == 1)
            {
                TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);                
            }
            else
            {
                TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, int(13));
            }
        }
        PlayerOwner().FmodClientPlaySound(Controller.ItemTakeoffSound,,, 6);
    }
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
    i = 0;
    J0x10B:

    // End:0x1A5 [Loop If]
    if(i < 6)
    {
        TPInventory.TPWeapon.MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnHover__Delegate = SubButton_OnHover;
        i++;
        // [Loop Continue]
        goto J0x10B;
    }
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnlClick;
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnHover__Delegate = ImageListBox_OnHover;
    i = 0;
    J0x21C:

    // End:0x25E [Loop If]
    if(i < 4)
    {
        TPInventory.TPQuickSlot.ButtonTag[i].__OnClick__Delegate = TPQSClick;
        i++;
        // [Loop Continue]
        goto J0x21C;
    }
    TPInventory.TPQuickSlot.RefreshQuickSlotButtonEnable();
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
    TPInventory.TPQuickSlot.__delegateUpdateQuickSlot__Delegate = UpdateQuickSlot;
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
    rfEquipItemTime = new Class'GUIWarfare_Decompressed.BTRefreshTime';
    rfEquipItemTime.SetMaxTime(0.5000000);
    LastSelectIndex = -1;
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
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    // End:0x19C
    if(MM.CheckUsingItem(ItemInfo) == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return true;
    }
    // End:0x234
    if(GameMgr.CheckOnlyModeItem(ItemInfo.byModeItem))
    {
        GameMgr.EquipOnlyModeItem(MM, ItemInfo, instanceInfo);
        // End:0x213
        if(instanceInfo.SlotPosition == int(13))
        {
            PlayerOwner().FmodClientPlaySound(Controller.ItemEquipSuccessSound,,, 6);            
        }
        else
        {
            PlayerOwner().FmodClientPlaySound(Controller.ItemTakeoffSound,,, 6);
        }
        return true;
    }
    // End:0x2CD
    if(nCurQuickSlot == 0)
    {
        // End:0x272
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            EquipSkill(ItemInfo, instanceInfo);            
        }
        else
        {
            // End:0x29B
            if(GameMgr.CheckMainQuickSlotItem(ItemInfo.ItemType))
            {
                EquipQuickSlot();                
            }
            else
            {
                // End:0x2C4
                if(GameMgr.CheckEquipQuickSlotItem(ItemInfo.ItemType))
                {
                    EquipItemSlot();                    
                }
                else
                {
                    UseItem();
                }
            }
        }        
    }
    else
    {
        // End:0x36B
        if(((ItemInfo.ItemID == 2000) && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[0].ItemID == 2000) || (ItemInfo.ItemID == 1010) && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[1].ItemID == 1010)
        {
            return true;
        }
        // End:0x394
        if(GameMgr.CheckMainQuickSlotItem(ItemInfo.ItemType))
        {
            EquipMainQuickSlot();            
        }
        else
        {
            // End:0x3BD
            if(GameMgr.CheckEquipQuickSlotItem(ItemInfo.ItemType))
            {
                EquipItemSlot();                
            }
            else
            {
                UseItem();
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

function ChangeQuickSlot(int SlotNum)
{
    nCurQuickSlot = SlotNum;
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
    local RenderObject Ro;
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
        Ro = TPInventory.TPWeapon.TPItemList.ItemList.DataList[SelIndex];
        // End:0x2DF
        if((Ro != none) && BTROItemBoxHK(Ro).ItemInfo != none)
        {
            ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
            ItemInfo = BTROItemBoxHK(Ro).ItemInfo;
            instanceInfo = BTROItemBoxHK(Ro).instanceInfo;
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
    if(i < 8)
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

function EquipMainQuickSlot()
{
    local int currentSlot, i, j;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;
    local export editinline BTItemBoxButtonHK ib;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0xCD
    if(instanceInfo == none)
    {
        return;
    }
    // End:0x113
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x145
    if(false == MM.CheckUsingItem(ItemInfo))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;
    }
    // End:0x168
    if(ItemInfo.EquipLevel > MM.kLevel)
    {
        return;
    }
    i = 0;
    J0x16F:

    // End:0x286 [Loop If]
    if(i < 8)
    {
        // End:0x27C
        if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.ItemInfo != none)
        {
            // End:0x21B
            if(__NFUN_913__(instanceInfo.UniqueID, EmptyBtrDouble()))
            {
                // End:0x218
                if(__NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
                {
                    return;
                }
                // [Explicit Continue]
                goto J0x27C;
            }
            // End:0x27C
            if(instanceInfo.UniqueSkillID != 0)
            {
                // End:0x27C
                if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueSkillID == instanceInfo.UniqueSkillID)
                {
                    return;
                }
            }
        }
        J0x27C:

        i++;
        // [Loop Continue]
        goto J0x16F;
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x304
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType) && currentSlot != 0)
    {
        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0x35B
        if(GameMgr.CheckSubWeaponItem(ItemInfo.ItemType) && currentSlot != 1)
        {
            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x5CA
            if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
            {
                // End:0x5C7
                if((currentSlot != 2) && currentSlot != 3)
                {
                    // End:0x451
                    if(((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].DefaultSlotItemID == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                        
                    }
                    else
                    {
                        // End:0x4AE
                        if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none)
                        {
                            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);                            
                        }
                        else
                        {
                            // End:0x50B
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
                    // End:0x57D
                    if(ItemInfo.ItemID == TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID)
                    {
                        return;
                    }
                    // End:0x5C7
                    if(ItemInfo.ItemID == TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID)
                    {
                        return;
                    }
                }                
            }
            else
            {
                // End:0x70B
                if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
                {
                    // End:0x630
                    if(int(byte(ItemInfo.SkillUseType)) == int(0))
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(4);                        
                    }
                    else
                    {
                        // End:0x709
                        if(int(byte(ItemInfo.SkillUseType)) == int(1))
                        {
                            // End:0x6CA
                            if(((currentSlot >= int(TPInventory.TPQuickSlot.5)) && currentSlot <= int(TPInventory.TPQuickSlot.7)) && TPInventory.TPQuickSlot.IsEnableSkillSlot(currentSlot - int(TPInventory.TPQuickSlot.4)))
                            {                                
                            }
                            else
                            {
                                self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(int(TPInventory.TPQuickSlot.5));
                            }                            
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
    // End:0x8F7
    if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
    {
        // End:0x7A3
        if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2] == none)
        {
            TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);            
        }
        else
        {
            // End:0x7F4
            if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3] == none)
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                
            }
            else
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
            }
        }
        // End:0x8D0
        if(!IsEnableEquipGrenade(ItemInfo.ItemID, TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID) || !IsEnableEquipGrenade(ItemInfo.ItemID, TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID))
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
            return;
        }
        currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    }
    switch(currentSlot)
    {
        // End:0xC00
        case 0:
            i = 0;
            J0x909:

            // End:0xBA9 [Loop If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                // End:0x958
                if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] == none)
                {
                    // [Explicit Continue]
                    goto J0xB9F;
                }
                // End:0xB9F
                if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0].UniqueID, instanceInfo.UniqueID))
                {
                    // End:0xA50
                    if(i != 0)
                    {
                        GameMgr.SetQuickSlotBox_Item(i - 1, 0, 0, EmptyBtrDouble());
                        TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[0] = none;
                        TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] = none;
                        ib = TPInventory.TPQuickSlot.ButtonQuickSlot[0];
                        ib.SetData(none, none);
                        UpdateQuickSlot(i);
                        // [Explicit Break]
                        goto J0xBA9;
                        // [Explicit Continue]
                        goto J0xB9F;
                    }
                    TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
                    j = 1;
                    J0xA85:

                    // End:0xB9C [Loop If]
                    if(j < TPInventory.TPQuickSlot.SaveQS.Length)
                    {
                        // End:0xB92
                        if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[j].instanceInfo[0].UniqueID, GameMgr.GetMainWeaponUniqueID()))
                        {
                            GameMgr.SetQuickSlotBox_Item(j - 1, 0, 0, EmptyBtrDouble());
                            TPInventory.TPQuickSlot.SaveQS[j].ItemInfo[0] = none;
                            TPInventory.TPQuickSlot.SaveQS[j].instanceInfo[0] = none;
                            ib = TPInventory.TPQuickSlot.ButtonQuickSlot[0];
                            ib.SetData(none, none);
                            UpdateQuickSlot(j);
                            // [Explicit Break]
                            goto J0xB9C;
                        }
                        j++;
                        // [Loop Continue]
                        goto J0xA85;
                    }
                    J0xB9C:

                    // [Explicit Break]
                    goto J0xBA9;
                }
                J0xB9F:

                i++;
                // [Loop Continue]
                goto J0x909;
            }
            J0xBA9:

            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x11C0
            break;
        // End:0xF2E
        case 1:
            i = 0;
            J0xC0B:

            // End:0xED7 [Loop If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                // End:0xC5E
                if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot] == none)
                {
                    // [Explicit Continue]
                    goto J0xECD;
                }
                // End:0xECD
                if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot].UniqueID, instanceInfo.UniqueID))
                {
                    // End:0xD6A
                    if(i != 0)
                    {
                        GameMgr.SetQuickSlotBox_Item(i - 1, currentSlot, 0, EmptyBtrDouble());
                        TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[currentSlot] = none;
                        TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot] = none;
                        ib = TPInventory.TPQuickSlot.ButtonQuickSlot[currentSlot];
                        ib.SetData(none, none);
                        UpdateQuickSlot(i);
                        // [Explicit Break]
                        goto J0xED7;
                        // [Explicit Continue]
                        goto J0xECD;
                    }
                    TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
                    j = 1;
                    J0xD9F:

                    // End:0xECA [Loop If]
                    if(j < TPInventory.TPQuickSlot.SaveQS.Length)
                    {
                        // End:0xEC0
                        if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[j].instanceInfo[currentSlot].UniqueID, GameMgr.GetSubWeaponUniqueID()))
                        {
                            GameMgr.SetQuickSlotBox_Item(j - 1, currentSlot, 0, EmptyBtrDouble());
                            TPInventory.TPQuickSlot.SaveQS[j].ItemInfo[currentSlot] = none;
                            TPInventory.TPQuickSlot.SaveQS[j].instanceInfo[currentSlot] = none;
                            ib = TPInventory.TPQuickSlot.ButtonQuickSlot[currentSlot];
                            ib.SetData(none, none);
                            UpdateQuickSlot(j);
                            // [Explicit Break]
                            goto J0xECA;
                        }
                        j++;
                        // [Loop Continue]
                        goto J0xD9F;
                    }
                    J0xECA:

                    // [Explicit Break]
                    goto J0xED7;
                }
                J0xECD:

                i++;
                // [Loop Continue]
                goto J0xC0B;
            }
            J0xED7:

            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x11C0
            break;
        // End:0xF33
        case 2:
        // End:0x114E
        case 3:
            i = 0;
            J0xF3F:

            // End:0x10F7 [Loop If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                j = 0;
                J0xF68:

                // End:0x10ED [Loop If]
                if(j < 4)
                {
                    // End:0xFA5
                    if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] == none)
                    {
                        // [Explicit Continue]
                        goto J0x10E3;
                    }
                    // End:0x10E3
                    if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j].UniqueID, instanceInfo.UniqueID))
                    {
                        // End:0x10B1
                        if(i != 0)
                        {
                            GameMgr.SetQuickSlotBox_Item(i - 1, j, 0, EmptyBtrDouble());
                            TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j] = none;
                            TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] = none;
                            ib = TPInventory.TPQuickSlot.ButtonQuickSlot[j];
                            ib.SetData(none, none);
                            UpdateQuickSlot(i);
                            // [Explicit Break]
                            goto J0x10ED;
                            // [Explicit Continue]
                            goto J0x10E3;
                        }
                        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, int(13));
                        // [Explicit Break]
                        goto J0x10ED;
                    }
                    J0x10E3:

                    ++j;
                    // [Loop Continue]
                    goto J0xF68;
                }
                J0x10ED:

                i++;
                // [Loop Continue]
                goto J0xF3F;
            }
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x11C0
            break;
        // End:0x1153
        case 4:
        // End:0x1158
        case 5:
        // End:0x115D
        case 6:
        // End:0x11BD
        case 7:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot - 4, instanceInfo.ItemID, instanceInfo.UniqueSkillID);
            // End:0x11C0
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
        // End:0x5B
        case 3:
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, ButtonID, 0, EmptyBtrDouble());
            // End:0xB3
            break;
        // End:0x60
        case 4:
        // End:0x65
        case 5:
        // End:0x6A
        case 6:
        // End:0xB0
        case 7:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, ButtonID - 4, 0, 0);
            // End:0xB3
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

function UpdateQuickSlot(int i)
{
    local int arQslotID, arSkill1, arSkill2, arSkill3, arSkill4;

    local BtrDouble arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2;
    local string arQslotName;
    local wItemBoxHK ItemInfo;

    i = i - 1;
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
    // End:0x2D1
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("0 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[1]);
    // End:0x35D
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("1 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[2]);
    // End:0x3EA
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("2 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[3]);
    // End:0x477
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("3 ItemName = " $ ItemInfo.ItemName) $ ", ItemID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[0]);
    // End:0x505
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("0 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[1]);
    // End:0x593
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("1 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[2]);
    // End:0x622
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("2 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[3]);
    // End:0x6B1
    if(ItemInfo != none)
    {
        PlayerOwner().dblog((("3 SkillName = " $ ItemInfo.ItemName) $ ", SkillID = ") $ string(ItemInfo.ItemID));
    }
    page_Main.TcpChannel.sfReqUpdateQSlot(arQslotID, arQslotName, arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2, arSkill1, arSkill2, arSkill3, arSkill4);
    //return;    
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo, prevInstanceInfo;
    local wMyPlayerStatus MyStatus;
    local int PrevSlotPos, SlotPosition, i, j;
    local export editinline BTItemBoxButtonHK ib;

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
    // End:0x1C3
    if((SlotPosition == 0) && instanceInfo.Durability <= 1000)
    {
        // End:0x1C3
        if(ItemInfo.Grade == 0)
        {            
        }
    }
    GameMgr.ChangeInstance_ItemSlotPos(ChangedNewUniqueID, SlotPosition);
    switch(SlotPosition)
    {
        // End:0x1EA
        case int(0):
        // End:0x1F1
        case int(1):
        // End:0x1F8
        case int(2):
        // End:0x2F4
        case int(3):
            prevInstanceInfo = TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition];
            // End:0x247
            if(prevInstanceInfo != none)
            {
                prevInstanceInfo.SlotPosition = int(13);
            }
            TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[SlotPosition] = ItemInfo;
            TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition] = instanceInfo;
            // End:0x2F1
            if(SlotPosition == 0)
            {
                TPInventory.TPEquipItem.CharacterModel.ChangeWeapon(instanceInfo.ItemID, instanceInfo.PartID, instanceInfo.PaintID);
            }
            // End:0x4F9
            break;
        // End:0x3BF
        case int(13):
            instanceInfo.SlotPosition = int(13);
            // End:0x369
            if(PrevSlotPos < 9)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[PrevSlotPos] = none;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[PrevSlotPos] = none;                
            }
            else
            {
                TPInventory.TPEquipItem.EquipItemSlot[PrevSlotPos - 18].SetData(none, none);
                TPInventory.TPEquipItem.CharacterModel.ChangeEquipItem(GameMgr);
            }
            // End:0x4F9
            break;
        // End:0x3C6
        case int(18):
        // End:0x3CD
        case int(19):
        // End:0x3D4
        case int(20):
        // End:0x3DB
        case int(21):
        // End:0x3E2
        case int(22):
        // End:0x3E9
        case int(23):
        // End:0x3F0
        case int(24):
        // End:0x4F6
        case int(25):
            // End:0x47E
            if(TPInventory.TPEquipItem.EquipItemSlot[SlotPosition - 18].itemBox != none)
            {
                prevInstanceInfo = TPInventory.TPEquipItem.EquipItemSlot[SlotPosition - 18].itemBox.instanceInfo;
                // End:0x47E
                if(prevInstanceInfo != none)
                {
                    prevInstanceInfo.SlotPosition = int(13);
                }
            }
            TPInventory.TPEquipItem.EquipItemSlot[SlotPosition - 18].SetData(ItemInfo, instanceInfo);
            instanceInfo.SlotPosition = SlotPosition;
            TPInventory.TPEquipItem.CharacterModel.ChangeEquipItem(GameMgr);
            RefreshSlotNum();
            // End:0x4F9
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x682
    if(nCurQuickSlot == 0)
    {
        i = 1;
        J0x50B:

        // End:0x682 [Loop If]
        if(i < TPInventory.TPQuickSlot.SaveQS.Length)
        {
            j = 0;
            J0x534:

            // End:0x678 [Loop If]
            if(j < 4)
            {
                // End:0x66E
                if((TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] != none) && __NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j].UniqueID, instanceInfo.UniqueID))
                {
                    GameMgr.SetQuickSlotBox_Item(i - 1, j, 0, EmptyBtrDouble());
                    TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j] = none;
                    TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] = none;
                    ib = TPInventory.TPQuickSlot.ButtonQuickSlot[j];
                    ib.SetData(none, none);
                    UpdateQuickSlot(i);
                    // [Explicit Break]
                    goto J0x678;
                }
                ++j;
                // [Loop Continue]
                goto J0x534;
            }
            J0x678:

            i++;
            // [Loop Continue]
            goto J0x50B;
        }
    }
    page_Main.TcpChannel.sfReqConfirmItemChanged();
    RefreshSlotNum();
    RefreshQuickSlot();
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

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local int SlotPosition, OldSlotPosition;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    Log("[BTPageInventory::rfAckEquipSkill] Result=" $ string(Result));
    // End:0x5D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
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
    // End:0x43B
    if(int(ItemInfo.byModeItem) == 0)
    {
        SlotPosition = int(ChangedNewSlotPosition) - 10;
        OldSlotPosition = instanceInfo.SlotPosition - 10;
        GameMgr.ChangeInstance_SkillSlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
        GameMgr.ChangeSkillBox_SlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
        switch(ChangedNewSlotPosition)
        {
            // End:0x186
            case 14:
            // End:0x18B
            case 15:
            // End:0x190
            case 16:
            // End:0x283
            case 17:
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[SlotPosition] = ItemInfo;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition] = instanceInfo;
                TPInventory.TPQuickSlot.ButtonQuickSlot[SlotPosition].SetData(ItemInfo, instanceInfo);
                SlotPosition -= 4;
                MyStatus.SkillList[SlotPosition].bySlotPosition = ChangedNewSlotPosition;
                MyStatus.SkillList[SlotPosition].iSkillID = ChangedNewSkillID;
                MyStatus.SkillList[SlotPosition].iUniqueSkillID = ChangedNewSkillUniqueID;
                // End:0x379
                break;
            // End:0x376
            case 13:
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[OldSlotPosition] = none;
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[OldSlotPosition] = none;
                instanceInfo.SlotPosition = int(13);
                TPInventory.TPQuickSlot.ButtonQuickSlot[OldSlotPosition].SetData(none, none);
                OldSlotPosition -= 4;
                MyStatus.SkillList[OldSlotPosition].bySlotPosition = 13;
                MyStatus.SkillList[OldSlotPosition].iSkillID = -1;
                MyStatus.SkillList[OldSlotPosition].iUniqueSkillID = -1;
                // End:0x379
                break;
            // End:0xFFFF
            default:
                break;
        }
        self.TPInventory.TPQuickSlot.ShowWeaponTransparent(TPInventory.TPQuickSlot.ButtonQuickSlot[0].itemBox, TPInventory.TPQuickSlot.ButtonQuickSlot[1].itemBox, TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox, TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox);
        TPInventory.TPQuickSlot.ShowSkillTransparent();        
    }
    else
    {
        GameMgr.SetInstance_SkillSlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
        GameMgr.SetSkillBox_SlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
        RefreshSlotNum();
    }
    page_Main.TcpChannel.sfReqConfirmSkillChanged();
    rfEquipItemTime.Update(rfEquipItemTime.fMaxTime);
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
    TPInventory.TPWeapon.SendProtocall = false;
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
    local BTROItemBoxHK Ro;

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
        Ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(UniqueItemID[0]);
        BTWindowItemRepairHK(Controller.TopPage()).SetData(UniqueItemID[0], RepairCost[0], MM.kPoint, Ro.ItemInfo, Ro.instanceInfo);
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
        Ro = BTROItemBoxHK(TPInventory.TPWeapon.TPItemList.ItemList.GetLastSelectedItem());
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
    local BTROItemBoxHK Ro;
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
    Ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(SellShopItemInfo_UniqueItemID);
    BTWindowItemSellHK(Controller.TopPage()).SetData(UniqueItemID, SellPoint, MM.kPoint, Ro.ItemInfo, Ro.instanceInfo);
    BTWindowItemSellHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemSellHK_OnSellOK;
    return true;
    //return;    
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    local wMyPlayerStatus MyStatus;
    local wItemBoxInstanceHK instanceInfo;
    local BTROItemBoxHK Ro;
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
    Ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(SellShopItemInfo_UniqueItemID);
    ItemName = Ro.ItemInfo.ItemName;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x235
    if(Count == 0)
    {
        // End:0x1E6
        if(Ro.instanceInfo.UniqueSkillID == 0)
        {
            GameMgr.RemoveInstanceItem(Ro.instanceInfo.UniqueID);
            GameMgr.RemoveQuickSlotItem(Ro.instanceInfo.UniqueID);            
        }
        else
        {
            GameMgr.RemoveInstanceItemByUniqueSkillID(Ro.instanceInfo.UniqueSkillID);
            GameMgr.RemoveQuickSlotBoxSkillItem(Ro.instanceInfo.UniqueSkillID);
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
    // End:0x5E
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
    local BTROItemBoxHK Ro;
    local bool bFoundEquipItem, bMatchQuickSlot;

    i = 0;
    J0x07:

    // End:0x83 [Loop If]
    if(i < TPInventory.TPWeapon.SlotNum.Length)
    {
        TPInventory.TPWeapon.SlotNum[i].SetVisibility(false);
        TPInventory.TPWeapon.SlotNum[i].SetEnabled(false);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    TPInventory.TPWeapon.SlotNum.Length = 0;
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

    // End:0x489 [Loop If]
    if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        Ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
        i = 0;
        J0x1B1:

        // End:0x47F [Loop If]
        if(i < TPInventory.TPQuickSlot.SaveQS.Length)
        {
            bFoundEquipItem = false;
            k = 0;
            J0x1E2:

            // End:0x469 [Loop If]
            if(k < TPInventory.TPQuickSlot.4)
            {
                // End:0x231
                if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[k] == none)
                {
                    // [Explicit Continue]
                    goto J0x45F;
                }
                // End:0x45F
                if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[k].UniqueID, Ro.instanceInfo.UniqueID))
                {
                    bMatchQuickSlot = false;
                    // End:0x2DD
                    if((int(TPInventory.TPQuickSlot.0) == k) && GameMgr.CheckMainWeaponItem(Ro.ItemInfo.ItemType))
                    {
                        bMatchQuickSlot = true;                        
                    }
                    else
                    {
                        // End:0x333
                        if((int(TPInventory.TPQuickSlot.1) == k) && GameMgr.CheckSubWeaponItem(Ro.ItemInfo.ItemType))
                        {
                            bMatchQuickSlot = true;                            
                        }
                        else
                        {
                            // End:0x389
                            if((int(TPInventory.TPQuickSlot.2) == k) && GameMgr.CheckThrowingWeapon(Ro.ItemInfo.ItemType))
                            {
                                bMatchQuickSlot = true;                                
                            }
                            else
                            {
                                // End:0x3DC
                                if((int(TPInventory.TPQuickSlot.3) == k) && GameMgr.CheckThrowingWeapon(Ro.ItemInfo.ItemType))
                                {
                                    bMatchQuickSlot = true;
                                }
                            }
                        }
                    }
                    // End:0x45F
                    if(bMatchQuickSlot)
                    {
                        TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                        TPInventory.TPWeapon.AddEquipWeaponeSlot(i, Ro.instanceInfo.UniqueID);
                        bFoundEquipItem = true;
                        // [Explicit Break]
                        goto J0x469;
                    }
                }
                J0x45F:

                k++;
                // [Loop Continue]
                goto J0x1E2;
            }
            J0x469:

            // End:0x475
            if(bFoundEquipItem)
            {
                // [Explicit Break]
                goto J0x47F;
            }
            i++;
            // [Loop Continue]
            goto J0x1B1;
        }
        J0x47F:

        j++;
        // [Loop Continue]
        goto J0x141;
    }
    j = 0;
    J0x490:

    // End:0x663 [Loop If]
    if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
    {
        Ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
        // End:0x659
        if(Ro.instanceInfo.SlotPosition != int(13))
        {
            // End:0x5D3
            if(int(Ro.ItemInfo.byModeItem) == 0)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipItemSlot(Ro.ItemInfo.ItemType, Ro.ItemInfo.EquipTeam, Ro.instanceInfo.UniqueID);
                // [Explicit Continue]
                goto J0x659;
            }
            // End:0x628
            if(Ro.ItemInfo.bSkill == true)
            {
                TPInventory.TPWeapon.AddEquipModeItemSlot(true, __NFUN_921__(0), Ro.instanceInfo.UniqueSkillID);
                // [Explicit Continue]
                goto J0x659;
            }
            TPInventory.TPWeapon.AddEquipModeItemSlot(false, Ro.instanceInfo.UniqueID, 0);
        }
        J0x659:

        j++;
        // [Loop Continue]
        goto J0x490;
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