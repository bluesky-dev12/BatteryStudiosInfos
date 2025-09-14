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
var BTRefreshTime rfEquipItemTime;
var int nCurQuickSlot;
var export editinline BTOwnerDrawImageHK WeaponListBg;
var() automated FloatBox fbWeaponListBg;
var localized string strWeaponList[6];
var array<export editinline BTOwnerDrawCaptionButtonHK> WeaponeTypeBtnList;
var bool bShowWeaponeTypeList;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() automated FloatBox fbLabelBackgrounddeco;

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

function ChangeQuickSlotItem(int nType, optional wItemBoxHK wItemInfo, optional wItemBoxInstanceHK wInstanceInfo)
{
    local int currentSlot, i;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    // End:0xCE
    if(nType == 0)
    {
        ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
        ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
        instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;        
    }
    else
    {
        ItemInfo = wItemInfo;
        instanceInfo = wInstanceInfo;
    }
    // End:0xF1
    if(instanceInfo == none)
    {
        return;
    }
    // End:0x137
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x190
    if((ItemInfo.Grade == 7) && (MM.kIsRegisteredPCBang == 0) || MM.kIsPaidPCBang == 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;
    }
    // End:0x1BE
    if((ItemInfo.ItemType >= 5) && ItemInfo.ItemType != 22)
    {
        return;
    }
    // End:0x1E1
    if(ItemInfo.EquipLevel > MM.kLevel)
    {
        return;
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x254
    if((ItemInfo.ItemType <= 2) && currentSlot != 0)
    {
        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0x2A0
        if((ItemInfo.ItemType == 3) && currentSlot != 1)
        {
            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x470
            if(ItemInfo.ItemType == 4)
            {
                // End:0x46D
                if((currentSlot != 2) && currentSlot != 3)
                {
                    // End:0x38B
                    if(((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].DefaultSlotItemID == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                        
                    }
                    else
                    {
                        // End:0x3E8
                        if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none)
                        {
                            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);                            
                        }
                        else
                        {
                            // End:0x445
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
                // End:0x563
                if(ItemInfo.ItemType == 22)
                {
                    // End:0x4C4
                    if(ItemInfo.SkillUseType == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(4);                        
                    }
                    else
                    {
                        // End:0x561
                        if(ItemInfo.SkillUseType == 1)
                        {
                            i = 5;
                            J0x4E0:

                            // End:0x55E [Loop If]
                            if(i < 9)
                            {
                                // End:0x554
                                if(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].itemBox.ItemInfo == none)
                                {
                                    self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(i);
                                    // [Explicit Break]
                                    goto J0x55E;
                                }
                                i++;
                                // [Loop Continue]
                                goto J0x4E0;
                            }
                            J0x55E:
                            
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
    // End:0x798
    if(ItemInfo.ItemType == 4)
    {
        // End:0x69D
        if(currentSlot == 2)
        {
            // End:0x61B
            if((TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none) && __NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[3].DefaultSlotUniqueID, instanceInfo.UniqueID))
            {
                return;                
            }
            else
            {
                // End:0x69A
                if((TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo != none) && __NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
                {
                    return;
                }
            }            
        }
        else
        {
            // End:0x798
            if(currentSlot == 3)
            {
                // End:0x719
                if((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none) && __NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[2].DefaultSlotUniqueID, instanceInfo.UniqueID))
                {
                    return;                    
                }
                else
                {
                    // End:0x798
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
        // End:0x7A3
        case 0:
        // End:0x7A7
        case 1:
        // End:0x7AC
        case 2:
        // End:0x805
        case 3:
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex(), currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x87A
            break;
        // End:0x80A
        case 4:
        // End:0x80F
        case 5:
        // End:0x814
        case 6:
        // End:0x819
        case 7:
        // End:0x81E
        case 8:
        // End:0x877
        case 9:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex(), currentSlot, instanceInfo.ItemID, instanceInfo.UniqueSkillID);
            // End:0x87A
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
            // End:0x1B6
            break;
        // End:0x8A
        case 1:
            page_Main.SetPage(20, true);
            // End:0x1B6
            break;
        // End:0xA4
        case 2:
            page_Main.SetPage(21, true);
            // End:0x1B6
            break;
        // End:0xBE
        case 4:
            page_Main.SetPage(18, true);
            // End:0x1B6
            break;
        // End:0xC6
        case 5:
            // End:0x1B6
            break;
        // End:0xCE
        case 6:
            // End:0x1B6
            break;
        // End:0xD6
        case 7:
            // End:0x1B6
            break;
        // End:0xED
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x1B6
            break;
        // End:0x129
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x1B6
            break;
        // End:0x170
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x1B6
            break;
        // End:0x1B3
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x1B6
            break;
        // End:0xFFFF
        default:
            break;
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
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0x12D
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x189
    if((ItemInfo.Grade == 7) && (MM.kIsRegisteredPCBang == 0) || MM.kIsPaidPCBang == 0)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;        
    }
    else
    {
        // End:0x1CE
        if(ItemInfo.ItemType == 25)
        {
            TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID);
            return;            
        }
        else
        {
            // End:0xC1B
            if(ItemInfo.ItemType == 26)
            {
                switch(ItemInfo.ItemID)
                {
                    // End:0x1FB
                    case 17004:
                    // End:0x2CC
                    case 17075:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 15);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xC16
                        break;
                    // End:0x2D4
                    case 17005:
                    // End:0x3A5
                    case 17076:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 16);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xC16
                        break;
                    // End:0x453
                    case 17012:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 9);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xC16
                        break;
                    // End:0x501
                    case 17013:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 13);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xC16
                        break;
                    // End:0x5AF
                    case 17018:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xC16
                        break;
                    // End:0x65D
                    case 17082:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 57);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xC16
                        break;
                    // End:0x70B
                    case 17049:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 59);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xC16
                        break;
                    // End:0x81A
                    case 17011:
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 7);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kUserName;
                        BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kUserName);
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xC16
                        break;
                    // End:0x957
                    case 17017:
                        // End:0x93E
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
                        // End:0xC16
                        break;
                    // End:0xAA5
                    case 17014:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(2);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xC16
                        break;
                    // End:0xAAD
                    case 17019:
                    // End:0xBFA
                    case 17099:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(1);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xC16
                        break;
                    // End:0xC05
                    case 17015:
                        // End:0xC16
                        break;
                    // End:0xC10
                    case 17016:
                        // End:0xC16
                        break;
                    // End:0xFFFF
                    default:
                        // End:0xC16
                        break;
                        break;
                }
                return;                
            }
            else
            {
                // End:0xC52
                if(ItemInfo.ItemType == 27)
                {
                    TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID);
                    return;                    
                }
                else
                {
                    // End:0xC6A
                    if(ItemInfo.ItemType == 29)
                    {                        
                    }
                    else
                    {
                        // End:0xCAF
                        if((ItemInfo.ItemType >= 9) && (ItemInfo.ItemType != 32) && ItemInfo.ItemType != 33)
                        {
                            return;
                        }
                    }
                }
            }
        }
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0xD4B
    if((((ItemInfo.ItemType <= 2) || ItemInfo.ItemType == 32) || ItemInfo.ItemType == 33) && currentSlot != 0)
    {
        TPInventory.TPQuickSlot.InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0xD92
        if((ItemInfo.ItemType == 3) && currentSlot != 1)
        {
            TPInventory.TPQuickSlot.InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0xF98
            if(ItemInfo.ItemType == 4)
            {
                // End:0xDF8
                if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2] == none)
                {
                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);                    
                }
                else
                {
                    // End:0xE49
                    if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3] == none)
                    {
                        TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                        
                    }
                    else
                    {
                        TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
                    }
                }
                currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
                // End:0xF14
                if((currentSlot == 2) && instanceInfo.SlotPosition == 3)
                {
                    TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[instanceInfo.SlotPosition] = none;
                    TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[instanceInfo.SlotPosition] = none;
                }
                // End:0xF95
                if((currentSlot == 3) && instanceInfo.SlotPosition == 2)
                {
                    TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[instanceInfo.SlotPosition] = none;
                    TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[instanceInfo.SlotPosition] = none;
                }                
            }
            else
            {
                // End:0xFE1
                if((ItemInfo.ItemType == 5) && currentSlot != 4)
                {
                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(4);                    
                }
                else
                {
                    // End:0x102A
                    if((ItemInfo.ItemType == 6) && currentSlot != 5)
                    {
                        TPInventory.TPQuickSlot.InvenGroup.SelectButton(5);                        
                    }
                    else
                    {
                        // End:0x1073
                        if((ItemInfo.ItemType == 7) && currentSlot != 6)
                        {
                            TPInventory.TPQuickSlot.InvenGroup.SelectButton(6);                            
                        }
                        else
                        {
                            // End:0x11ED
                            if(ItemInfo.ItemType == 8)
                            {
                                // End:0x10C2
                                if(ItemInfo.EquipTeam == 1)
                                {
                                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(7);                                    
                                }
                                else
                                {
                                    // End:0x10FD
                                    if(ItemInfo.EquipTeam == 2)
                                    {
                                        TPInventory.TPQuickSlot.InvenGroup.SelectButton(8);                                        
                                    }
                                    else
                                    {
                                        // End:0x11EA
                                        if((currentSlot != 7) && currentSlot != 8)
                                        {
                                            // End:0x116F
                                            if(TPInventory.TPWeapon.ButtonWeapon[7].itemBox.ItemInfo == none)
                                            {
                                                TPInventory.TPQuickSlot.InvenGroup.SelectButton(8);                                                
                                            }
                                            else
                                            {
                                                // End:0x11C7
                                                if(TPInventory.TPWeapon.ButtonWeapon[8].itemBox.ItemInfo == none)
                                                {
                                                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(8);                                                    
                                                }
                                                else
                                                {
                                                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(7);
                                                }
                                            }
                                        }
                                    }
                                }                                
                            }
                            else
                            {
                                // End:0x1225
                                if(ItemInfo.ItemType == 29)
                                {
                                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(9);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x12E0
    if(currentSlot < 4)
    {
        // End:0x1272
        if(currentSlot == instanceInfo.SlotPosition)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex());
        PlayerOwner().PlaySound(Controller.ItemEquipSuccessSound, 6, 1.0000000);        
    }
    else
    {
        // End:0x1302
        if(currentSlot == ((instanceInfo.SlotPosition - 18) + 4))
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, (TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex() + 18) - 4);
        PlayerOwner().PlaySound(Controller.ItemEquipSuccessSound, 6, 1.0000000);
    }
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

    WinModify = BTWindowModifyHK(Controller.FindMenuByClass(Class'GUIWarfareControls.BTWindowModifyHK'));
    TcpChannel.sfReqModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID());
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
    // End:0x287
    if(bHoldcItemInfo == false)
    {
        switch(ItemInfo.ItemType)
        {
            // End:0x2E
            case 0:
            // End:0x32
            case 1:
            // End:0xEC
            case 2:
                // End:0x90
                if(TPInventory.TPWeapon.ButtonWeapon[0].itemBox != none)
                {
                    cItemInfo = TPInventory.TPWeapon.ButtonWeapon[0].itemBox.ItemInfo;
                }
                // End:0xE9
                if(TPInventory.TPWeapon.ButtonWeapon[0].itemBox != none)
                {
                    cInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[0].itemBox.instanceInfo;
                }
                // End:0x287
                break;
            // End:0x1A6
            case 3:
                // End:0x14A
                if(TPInventory.TPWeapon.ButtonWeapon[1].itemBox != none)
                {
                    cItemInfo = TPInventory.TPWeapon.ButtonWeapon[1].itemBox.ItemInfo;
                }
                // End:0x1A3
                if(TPInventory.TPWeapon.ButtonWeapon[1].itemBox != none)
                {
                    cInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[1].itemBox.instanceInfo;
                }
                // End:0x287
                break;
            // End:0x264
            case 4:
                // End:0x206
                if(TPInventory.TPWeapon.ButtonWeapon[2].itemBox != none)
                {
                    cItemInfo = TPInventory.TPWeapon.ButtonWeapon[2].itemBox.ItemInfo;
                }
                // End:0x261
                if(TPInventory.TPWeapon.ButtonWeapon[2].itemBox != none)
                {
                    cInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[2].itemBox.instanceInfo;
                }
                // End:0x287
                break;
            // End:0x26C
            case 5:
                // End:0x287
                break;
            // End:0x274
            case 6:
                // End:0x287
                break;
            // End:0x27C
            case 7:
                // End:0x287
                break;
            // End:0x284
            case 8:
                // End:0x287
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        TPWarehouseQS.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
        // End:0x332
        if(ItemInfo.ItemType == 999)
        {
            TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ItemImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.item_item_cash;
            TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ChangeState(10);            
        }
        else
        {
            TPWarehouseQS.InfoBox.ItemBoxView.itemBox.ChangeState(0);
        }
        // End:0x3F0
        if(ItemInfo == none)
        {
            TPWarehouseQS.MenuButton[0].DisableMe();
            TPWarehouseQS.MenuButton[1].DisableMe();
            TPWarehouseQS.MenuButton[2].DisableMe();
            TPWarehouseQS.MenuButton[3].DisableMe();
            TPWarehouseQS.MenuButton[4].DisableMe();
            return;
        }
        // End:0x467
        if((ItemInfo.bSellShop && TPInventory.TPWeapon.GetButtonWeaponID(instanceInfo.UniqueID) == -1) && instanceInfo.CashItemInfo == none)
        {
            TPWarehouseQS.MenuButton[0].EnableMe();            
        }
        else
        {
            TPWarehouseQS.MenuButton[0].DisableMe();
        }
        // End:0x4F6
        if(((ItemInfo.ItemType <= 3) && (ItemInfo.Grade <= 1) || ItemInfo.Grade == 7) && instanceInfo.CashItemInfo == none)
        {
            TPWarehouseQS.MenuButton[1].EnableMe();            
        }
        else
        {
            TPWarehouseQS.MenuButton[1].DisableMe();
        }
        // End:0x5B6
        if((ItemInfo.CostType == 0) && instanceInfo.CashItemInfo == none)
        {
            TPWarehouseQS.MenuButton[2].EnableMe();
            // End:0x598
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
        // End:0x684
        if(((instanceInfo != none) && (ItemInfo.CostType == 1) || ItemInfo.CostType == 4) && instanceInfo.ItemState == 0)
        {
            TPWarehouseQS.MenuButton[4].EnableMe();
            TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];            
        }
        else
        {
            // End:0x6E2
            if(instanceInfo.CashItemInfo != none)
            {
                TPWarehouseQS.MenuButton[4].EnableMe();
                TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                
            }
            else
            {
                // End:0x741
                if(ItemInfo.ItemType == 25)
                {
                    TPWarehouseQS.MenuButton[4].EnableMe();
                    TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                    
                }
                else
                {
                    // End:0x7A0
                    if(ItemInfo.ItemType == 26)
                    {
                        TPWarehouseQS.MenuButton[4].EnableMe();
                        TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                        
                    }
                    else
                    {
                        // End:0x7FF
                        if(ItemInfo.ItemType == 27)
                        {
                            TPWarehouseQS.MenuButton[4].EnableMe();
                            TPWarehouseQS.MenuButton[4].Caption = TPWarehouseQS.strMenuButton[5];                            
                        }
                        else
                        {
                            // End:0x881
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
    local int i;

    btn = BTItemBoxButtonHK(Sender);
    // End:0x32
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
    local int i;

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
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[ButtonID];
    instanceInfo = TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[ButtonID];
    // End:0x20F
    if(instanceInfo != none)
    {
        // End:0xD6
        if((ItemInfo.ItemID == GameMgr.GetMainWeaponID()) || ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        // End:0x139
        if(ItemInfo.ItemType == 22)
        {
            TcpChannel.sfReqEquipSkill(instanceInfo.ItemID, instanceInfo.UniqueSkillID, 13);
            PlayerOwner().PlaySound(Controller.ItemTakeoffSound, 6, 1.0000000);
            return;
        }
        // End:0x17E
        if(instanceInfo.SlotPosition == 0)
        {
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);            
        }
        else
        {
            // End:0x1C3
            if(instanceInfo.SlotPosition == 1)
            {
                TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);                
            }
            else
            {
                TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, 13);
            }
        }
        PlayerOwner().PlaySound(Controller.ItemTakeoffSound, 6, 1.0000000);
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
    local export editinline BTOwnerDrawCaptionButtonHK temp;

    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Inven_bg, 0.1000000);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    i = 0;
    J0x73:

    // End:0xBA [Loop If]
    if(i < 9)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].__OnClick__Delegate = TPInventoryQS_OnClick;
        i++;
        // [Loop Continue]
        goto J0x73;
    }
    i = 0;
    J0xC1:

    // End:0x15B [Loop If]
    if(i < 5)
    {
        TPInventory.TPWeapon.MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnHover__Delegate = SubButton_OnHover;
        i++;
        // [Loop Continue]
        goto J0xC1;
    }
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnlClick;
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnHover__Delegate = ImageListBox_OnHover;
    i = 0;
    J0x1D2:

    // End:0x214 [Loop If]
    if(i < 4)
    {
        TPInventory.TPQuickSlot.ButtonTag[i].__OnClick__Delegate = TPQSClick;
        i++;
        // [Loop Continue]
        goto J0x1D2;
    }
    TPWarehouseSkill.MenuButton.__OnClick__Delegate = TPWarehouseSkill_MenuButton_OnClick;
    TPInventory.TabControl.SetVisiblePanel(0);
    TPInventory.TPWeapon.FocusFirst(none);
    TPWarehouseSkill.SetVisibility(false);
    TPWarehouseQS.SetVisibility(false);
    InitializeCashNPoint();
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
    TPInventory.TPWeapon.CurrentRepairMode = 3;
    i = 0;
    J0x3F1:

    // End:0x60B [Loop If]
    if(i < 6)
    {
        temp = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        temp.bVisible = false;
        temp.bUseAWinPos = true;
        temp.AWinPos.X1 = 603.0000000;
        temp.AWinPos.Y1 = 193.0000000 + float(i * 22);
        temp.AWinPos.X2 = 685.0000000;
        temp.AWinPos.Y2 = 215.0000000 + float(i * 22);
        temp.ApplyAWinPos();
        temp.RenderWeight = 1.0000000;
        temp.ButtonID = i;
        temp.Caption = strWeaponList[i];
        temp.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_n;
        temp.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_cli;
        temp.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_on;
        temp.__OnClick__Delegate = WeaponListClick;
        temp.InitComponent(Controller, self);
        AppendComponent(temp);
        WeaponeTypeBtnList[WeaponeTypeBtnList.Length] = temp;
        i++;
        // [Loop Continue]
        goto J0x3F1;
    }
    fbWeaponListBg.Y2 = WeaponeTypeBtnList[WeaponeTypeBtnList.Length - 1].AWinPos.Y2 + float(5);
    WeaponListBg = NewLabelComponent(fbWeaponListBg, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.MainWeapon_List_Bg, 0.9000000);
    WeaponListBg.bVisible = false;
    TPInventory.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    rfEquipItemTime = new Class'GUIWarfare_Decompressed.BTRefreshTime';
    rfEquipItemTime.SetMaxTime(0.5000000);
    //return;    
}

function bool ImageListBox_OnlClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMatchMaker MM;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    // End:0xA8
    if(ItemList.SelectItemIndex != ItemList.VolatileSelectItemIndex)
    {
        return true;
    }
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    // End:0x14A
    if(rfEquipItemTime.CheckCondition() == false)
    {
        ItemList.DataList[ItemList.LastSelectedItemIndex].bMouseClick = false;
        return true;
    }
    // End:0x179
    if(ItemList.DataList[ItemList.LastSelectedItemIndex].bMouseClick == false)
    {
        return true;
    }
    // End:0x1C2
    if(nCurQuickSlot == 0)
    {
        // End:0x1B9
        if(ItemInfo.ItemType == 22)
        {
            BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).EquipSkill();            
        }
        else
        {
            EquipItem();
        }        
    }
    else
    {
        // End:0x1F4
        if(MM.CheckUsingItem(ItemInfo) == false)
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
            return true;
        }
        // End:0x292
        if(((ItemInfo.ItemID == 2000) && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[0].ItemID == 2000) || (ItemInfo.ItemID == 1010) && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[1].ItemID == 1010)
        {
            return true;
        }
        EquipQuickSlot();
        // End:0x2F8
        if(((ItemInfo.ItemType >= 25) && ItemInfo.ItemType < 32) || (ItemInfo.ItemType >= 5) && ItemInfo.ItemType <= 7)
        {
            EquipItem();
        }
    }
    return true;
    //return;    
}

function bool TPQSClick(GUIComponent Sender)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    TPInventory.TPQuickSlot.QSButtonGroup.SelectButton(btn.ButtonID);
    FocusFirst(TPInventory.TPQuickSlot.ButtonChangeName[TPInventory.TPQuickSlot.QSNameGroup.GetSelectIndex()]);
    nCurQuickSlot = btn.ButtonID;
    i = 0;
    J0x99:

    // End:0x13D [Loop If]
    if(i < 8)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].SetData(TPInventory.TPQuickSlot.SaveQS[btn.ButtonID].ItemInfo[i], TPInventory.TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x99;
    }
    // End:0x1C2
    if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0] == none)
    {
        TPInventory.CharacterModel.DeleteWeapone();
        self.TPInventory.CharacterModel.PlayAnim(self.TPInventory.CharacterModel.NoHaveWeaponIdle, 1.0000000, 0.2000000);        
    }
    else
    {
        self.TPInventory.CharacterModel.ChangeWeapon(self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].ItemID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PartID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PaintID);
    }
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
    self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
    return false;
    //return;    
}

function bool SubButton_OnHover(GUIComponent Sender)
{
    local int mainTab, subTab, i;

    mainTab = TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex();
    subTab = BTOwnerDrawCaptionButtonHK(Sender).ButtonID;
    bShowWeaponeTypeList = false;
    i = 0;
    J0x51:

    // End:0x82 [Loop If]
    if(i < WeaponeTypeBtnList.Length)
    {
        WeaponeTypeBtnList[i].bVisible = false;
        i++;
        // [Loop Continue]
        goto J0x51;
    }
    WeaponListBg.bVisible = false;
    // End:0xC6
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0xAC
            case 0:
                // End:0xC6
                break;
            // End:0xBB
            case 1:
                bShowWeaponeTypeList = true;
                // End:0xC6
                break;
            // End:0xC3
            case 2:
                // End:0xC6
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        // End:0x167
        if(bShowWeaponeTypeList && int(TPInventory.TPWeapon.SubButton[1].MenuState) == int(4))
        {
            i = 0;
            J0x105:

            // End:0x156 [Loop If]
            if(i < WeaponeTypeBtnList.Length)
            {
                WeaponeTypeBtnList[i].bVisible = true;
                WeaponeTypeBtnList[i].SetFocus(WeaponeTypeBtnList[i]);
                i++;
                // [Loop Continue]
                goto J0x105;
            }
            WeaponListBg.bVisible = true;
        }
        return true;
        //return;        
    }
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    local int i;

    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPInventory.TPWeapon.TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ChangeItemList(TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).SubTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshSlotNum();
    // End:0x1BA
    if((TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex() == 1) && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x1BA
        if(bShowWeaponeTypeList && int(TPInventory.TPWeapon.SubButton[1].MenuState) == int(4))
        {
            i = 0;
            J0x178:

            // End:0x1A9 [Loop If]
            if(i < WeaponeTypeBtnList.Length)
            {
                WeaponeTypeBtnList[i].bVisible = true;
                i++;
                // [Loop Continue]
                goto J0x178;
            }
            WeaponListBg.bVisible = true;
        }
    }
    return true;
    //return;    
}

function bool ImageListBox_OnHover(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;
    local wMatchMaker MM;
    local int i;

    return false;
    //return;    
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
            TPInventory.TPWeapon.TPItemList.ItemList.ShowWeaponAll();
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
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).AddSubMenuBtns();
    i = 0;
    J0x17A:

    // End:0x1AB [Loop If]
    if(i < WeaponeTypeBtnList.Length)
    {
        WeaponeTypeBtnList[i].bVisible = false;
        i++;
        // [Loop Continue]
        goto J0x17A;
    }
    WeaponListBg.bVisible = false;
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

function InitializeCashNPoint()
{
    CashColor = Class'Engine.Canvas'.static.MakeColor(2, 198, 254, byte(255));
    PointColor = Class'Engine.Canvas'.static.MakeColor(178, 233, 31, byte(255));
    LabelCash = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = CashColor;
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = PointColor;
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

function bool Internal_OnPreDraw(Canvas C)
{
    InternalOnPreDraw(C);
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
    local int i;

    __NFUN_270__("BTPageInventory::InternalOnOpen()");
    Log("[BTPageInventory::InternalOnOpen] ");
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    TPInventory.TPWeapon.TcpChannel = TcpChannel;
    MM.SetCurSubPos(3);
    InitializeDelegate();
    RefreshSlotNum();
    RefreshWarehouse();
    TPInventory.CharacterModel.BeginModel();
    page_Main.TcpChannel.sfReqChangeUserState(5, 0);
    currentBGM = page_Main.DefaultLobbyBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    nCurQuickSlot = 0;
    self.TPInventory.CharacterModel.ChangeWeapon(self.TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[0].ItemID, self.TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[0].PartID, self.TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[0].PaintID);
    i = 0;
    J0x20C:

    // End:0x29E [Loop If]
    if(i < 8)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].SetData(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[i], TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x20C;
    }
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
    self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
    TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).AddSubMenuBtns();
    // End:0x47C
    if(GameMgr.ShopItemListCount == 0)
    {
        page_Main.TcpChannel.sfReqShopItemList();
    }
    // End:0x4B6
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
    TPInventory.CharacterModel.EndModel();
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
    UnInitializeDelegate();
    OnClose(bCanceled);
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
    // End:0xF6
    if((DragBox != none) && bDragging)
    {
        DragBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) - DragPosX) + DragAWinPos.X1, float(int(Controller.MouseY) - DragPosY) + DragAWinPos.Y1, float(int(Controller.MouseX) - DragPosX) + DragAWinPos.X2, float(int(Controller.MouseY) - DragPosY) + DragAWinPos.Y2);
        DragBox.Update();
        DragBox.Render(C);
    }
    SelIndex = TPInventory.TPWeapon.TPItemList.ItemList.SelectItemIndex;
    // End:0x165
    if(SelIndex >= 0)
    {
        ro = TPInventory.TPWeapon.TPItemList.ItemList.DataList[SelIndex];
    }
    // End:0x368
    if((ro != none) && BTROItemBoxHK(ro).ItemInfo != none)
    {
        ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
        ItemInfo = BTROItemBoxHK(ro).ItemInfo;
        instanceInfo = BTROItemBoxHK(ro).instanceInfo;
        cItemInfo = none;
        cInstanceInfo = none;
        cItemInfo = none;
        switch(ItemInfo.ItemType)
        {
            // End:0x20C
            case 0:
            // End:0x210
            case 1:
            // End:0x215
            case 2:
            // End:0x21A
            case 32:
            // End:0x276
            case 33:
                cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[0];
                cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0];
                // End:0x333
                break;
            // End:0x2D2
            case 3:
                cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[1];
                cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[1];
                // End:0x333
                break;
            // End:0x330
            case 4:
                cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2];
                cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[2];
                // End:0x333
                break;
            // End:0xFFFF
            default:
                break;
        }
        TPInventory.TPWeapon.InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
    }
    // End:0x4F8
    if(WeaponListBg.bVisible == false)
    {
        // End:0x49C
        if((Controller.MouseX >= TPInventory.TPWeapon.fbTPItemList.X1) && Controller.MouseY >= TPInventory.TPWeapon.fbTPItemList.Y1)
        {
            // End:0x499
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
        instanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[i];
        // End:0x153
        if(instanceInfo != none)
        {
            ItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[i];
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
    local wItemBoxHK ItemInfo;
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
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPInventory.TPQuickSlot.SaveQS.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x1D9:

    // End:0x2A4 [Loop If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x29A
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x29A
            if(ItemInfo != none)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[i] = ItemInfo;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[i] = instanceInfo;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1D9;
    }
    i = 14;
    J0x2AC:

    // End:0x37F [Loop If]
    if(i < 18)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x375
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x375
            if(ItemInfo != none)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[i - 10] = ItemInfo;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[i - 10] = instanceInfo;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x2AC;
    }
    j = 0;
    J0x386:

    // End:0x549 [Loop If]
    if(j < 3)
    {
        i = 0;
        J0x399:

        // End:0x53F [Loop If]
        if(i < (GameMgr.QuickSlotBoxList.Length - 1))
        {
            TPInventory.TPQuickSlot.SaveQS[j + 1].ItemInfo[i] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].ItemID[i]);
            TPInventory.TPQuickSlot.SaveQS[j + 1].instanceInfo[i] = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[j].UniqueID[i]);
            TPInventory.TPQuickSlot.SaveQS[j + 1].ItemInfo[i + 4] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].SkillID[i]);
            TPInventory.TPQuickSlot.SaveQS[j + 1].instanceInfo[i + 4] = GameMgr.FindInstanceSkillItem(GameMgr.QuickSlotBoxList[j].UniqueSkillID[i]);
            i++;
            // [Loop Continue]
            goto J0x399;
        }
        j++;
        // [Loop Continue]
        goto J0x386;
    }
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

function RefreshWarehouse(optional bool isSkipAddQSNum)
{
    local int TabIndex[5], topIdx, SelectIdx, i, j;

    local BTROItemBoxHK ro;

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
    // End:0x3C9
    if(isSkipAddQSNum == true)
    {
        return;
    }
    i = 0;
    J0x3D0:

    // End:0x5FD [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x3F9:

        // End:0x5F3 [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x48F
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] == none)
            {
                // [Explicit Continue]
                goto J0x5E9;
            }
            // End:0x5E9
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0].UniqueID, ro.instanceInfo.UniqueID) && ((((ro.ItemInfo.ItemType == 0) || ro.ItemInfo.ItemType == 1) || ro.ItemInfo.ItemType == 2) || ro.ItemInfo.ItemType == 32) || ro.ItemInfo.ItemType == 33)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0x5F3;
            }
            J0x5E9:

            j++;
            // [Loop Continue]
            goto J0x3F9;
        }
        J0x5F3:

        i++;
        // [Loop Continue]
        goto J0x3D0;
    }
    i = 0;
    J0x604:

    // End:0x7B3 [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x62D:

        // End:0x7A9 [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x6C3
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1] == none)
            {
                // [Explicit Continue]
                goto J0x79F;
            }
            // End:0x79F
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1].UniqueID, ro.instanceInfo.UniqueID) && ro.ItemInfo.ItemType == 3)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0x7A9;
            }
            J0x79F:

            j++;
            // [Loop Continue]
            goto J0x62D;
        }
        J0x7A9:

        i++;
        // [Loop Continue]
        goto J0x604;
    }
    i = 0;
    J0x7BA:

    // End:0x96B [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x7E3:

        // End:0x961 [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x87A
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2] == none)
            {
                // [Explicit Continue]
                goto J0x957;
            }
            // End:0x957
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2].UniqueID, ro.instanceInfo.UniqueID) && ro.ItemInfo.ItemType == 4)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0x961;
            }
            J0x957:

            j++;
            // [Loop Continue]
            goto J0x7E3;
        }
        J0x961:

        i++;
        // [Loop Continue]
        goto J0x7BA;
    }
    i = 0;
    J0x972:

    // End:0xB23 [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x99B:

        // End:0xB19 [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0xA32
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3] == none)
            {
                // [Explicit Continue]
                goto J0xB0F;
            }
            // End:0xB0F
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3].UniqueID, ro.instanceInfo.UniqueID) && ro.ItemInfo.ItemType == 4)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0xB19;
            }
            J0xB0F:

            j++;
            // [Loop Continue]
            goto J0x99B;
        }
        J0xB19:

        i++;
        // [Loop Continue]
        goto J0x972;
    }
    //return;    
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPInventory.TPWeapon.MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).MainTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshSlotNum();
    return true;
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
    // End:0x1A1
    if((ItemInfo.ItemType >= 5) && ((ItemInfo.ItemType != 32) && ItemInfo.ItemType != 33) && ItemInfo.ItemType != 22)
    {
        return;
    }
    // End:0x1C4
    if(ItemInfo.EquipLevel > MM.kLevel)
    {
        return;
    }
    i = 0;
    J0x1CB:

    // End:0x2E2 [Loop If]
    if(i < 8)
    {
        // End:0x2D8
        if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.ItemInfo != none)
        {
            // End:0x277
            if(__NFUN_913__(instanceInfo.UniqueID, EmptyBtrDouble()))
            {
                // End:0x274
                if(__NFUN_912__(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
                {
                    return;
                }
                // [Explicit Continue]
                goto J0x2D8;
            }
            // End:0x2D8
            if(instanceInfo.UniqueSkillID != 0)
            {
                // End:0x2D8
                if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueSkillID == instanceInfo.UniqueSkillID)
                {
                    return;
                }
            }
        }
        J0x2D8:

        i++;
        // [Loop Continue]
        goto J0x1CB;
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x383
    if((((ItemInfo.ItemType <= 2) || ItemInfo.ItemType == 32) || ItemInfo.ItemType == 33) && currentSlot != 0)
    {
        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0x3CF
        if((ItemInfo.ItemType == 3) && currentSlot != 1)
        {
            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x59F
            if(ItemInfo.ItemType == 4)
            {
                // End:0x59C
                if((currentSlot != 2) && currentSlot != 3)
                {
                    // End:0x4BA
                    if(((TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none) && TPInventory.TPQuickSlot.ButtonQuickSlot[3].DefaultSlotItemID == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                        
                    }
                    else
                    {
                        // End:0x517
                        if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none)
                        {
                            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);                            
                        }
                        else
                        {
                            // End:0x574
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
                // End:0x634
                if(ItemInfo.ItemType == 22)
                {
                    // End:0x5F3
                    if(ItemInfo.SkillUseType == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(4);                        
                    }
                    else
                    {
                        // End:0x632
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
    // End:0x75C
    if(ItemInfo.ItemType == 4)
    {
        // End:0x6C1
        if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2] == none)
        {
            TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);            
        }
        else
        {
            // End:0x712
            if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3] == none)
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);                
            }
            else
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
            }
        }
        currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    }
    switch(currentSlot)
    {
        // End:0x91F
        case 0:
            i = 0;
            J0x76E:

            // End:0x8C8 [Loop If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                // End:0x8BE
                if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0].UniqueID, instanceInfo.UniqueID))
                {
                    // End:0x88D
                    if(i != 0)
                    {
                        GameMgr.SetQuickSlotBox_Item(i - 1, 0, 0, EmptyBtrDouble());
                        TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[0] = none;
                        TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] = none;
                        ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0];
                        ib.SetData(none, none);
                        UpdateQuickSlot(i);
                        // [Explicit Break]
                        goto J0x8C8;
                        // [Explicit Continue]
                        goto J0x8BE;
                    }
                    TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
                    // [Explicit Break]
                    goto J0x8C8;
                }
                J0x8BE:

                i++;
                // [Loop Continue]
                goto J0x76E;
            }
            J0x8C8:

            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0xD53
            break;
        // End:0xAEF
        case 1:
            i = 0;
            J0x92A:

            // End:0xA98 [Loop If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                // End:0xA8E
                if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot].UniqueID, instanceInfo.UniqueID))
                {
                    // End:0xA5D
                    if(i != 0)
                    {
                        GameMgr.SetQuickSlotBox_Item(i - 1, currentSlot, 0, EmptyBtrDouble());
                        TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[currentSlot] = none;
                        TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot] = none;
                        ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[currentSlot];
                        ib.SetData(none, none);
                        UpdateQuickSlot(i);
                        // [Explicit Break]
                        goto J0xA98;
                        // [Explicit Continue]
                        goto J0xA8E;
                    }
                    TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
                    // [Explicit Break]
                    goto J0xA98;
                }
                J0xA8E:

                i++;
                // [Loop Continue]
                goto J0x92A;
            }
            J0xA98:

            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0xD53
            break;
        // End:0xAF4
        case 2:
        // End:0xCE1
        case 3:
            i = 0;
            J0xB00:

            // End:0xC8A [Loop If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                j = 0;
                J0xB29:

                // End:0xC80 [Loop If]
                if(j < 4)
                {
                    // End:0xC76
                    if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j].UniqueID, instanceInfo.UniqueID))
                    {
                        // End:0xC46
                        if(i != 0)
                        {
                            GameMgr.SetQuickSlotBox_Item(i - 1, j, 0, EmptyBtrDouble());
                            TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j] = none;
                            TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] = none;
                            ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[j];
                            ib.SetData(none, none);
                            UpdateQuickSlot(i);
                            // [Explicit Break]
                            goto J0xC80;
                            // [Explicit Continue]
                            goto J0xC76;
                        }
                        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, 13);
                        // [Explicit Break]
                        goto J0xC80;
                    }
                    J0xC76:

                    ++j;
                    // [Loop Continue]
                    goto J0xB29;
                }
                J0xC80:

                i++;
                // [Loop Continue]
                goto J0xB00;
            }
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0xD53
            break;
        // End:0xCE6
        case 4:
        // End:0xCEB
        case 5:
        // End:0xCF0
        case 6:
        // End:0xD50
        case 7:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot - 4, instanceInfo.ItemID, instanceInfo.UniqueSkillID);
            // End:0xD53
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
    ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[ButtonID];
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
    local string ClanName;

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xF7
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

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8F
    if((ClanName != "none") && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
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
    local string ClanName, URL, Intro, Keyword;
    local int Region;

    Log("[BTPageRoomLobby::BTWindowCreateClanHK_OnOK]");
    // End:0x165
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
        // End:0x29D
        case 3:
            prevInstanceInfo = TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition];
            prevInstanceInfo.SlotPosition = 13;
            TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[SlotPosition] = ItemInfo;
            TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition] = instanceInfo;
            // End:0x29A
            if(SlotPosition == 0)
            {
                TPInventory.CharacterModel.ChangeWeapon(instanceInfo.ItemID, instanceInfo.PartID, instanceInfo.PaintID);
            }
            // End:0x56E
            break;
        // End:0x3E3
        case 13:
            instanceInfo.SlotPosition = 13;
            // End:0x30E
            if(PrevSlotPos < 8)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[PrevSlotPos] = none;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[PrevSlotPos] = none;                
            }
            else
            {
                BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[(PrevSlotPos - 18) + 4].SetData(none, none);
                // End:0x3C3
                if(TPInventory.TPWeapon.ButtonWeapon[(PrevSlotPos - 18) + 4].itemBox != none)
                {
                    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[(PrevSlotPos - 18) + 4].itemBox.instanceInfo.SlotPosition = SlotPosition;
                }
                TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
            }
            // End:0x56E
            break;
        // End:0x3E8
        case 18:
        // End:0x3ED
        case 19:
        // End:0x3F2
        case 20:
        // End:0x3F7
        case 21:
        // End:0x3FC
        case 22:
        // End:0x56B
        case 23:
            // End:0x472
            if(TPInventory.TPWeapon.ButtonWeapon[(PrevSlotPos - 18) + 4].itemBox != none)
            {
                prevInstanceInfo = TPInventory.TPWeapon.ButtonWeapon[(SlotPosition - 18) + 4].itemBox.instanceInfo;
            }
            // End:0x48E
            if(prevInstanceInfo != none)
            {
                prevInstanceInfo.SlotPosition = 13;
            }
            BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[(SlotPosition - 18) + 4].SetData(ItemInfo, instanceInfo);
            // End:0x54B
            if(TPInventory.TPWeapon.ButtonWeapon[(PrevSlotPos - 18) + 4].itemBox != none)
            {
                BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[(SlotPosition - 18) + 4].itemBox.instanceInfo.SlotPosition = SlotPosition;
            }
            TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
            // End:0x56E
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x6FC
    if(nCurQuickSlot == 0)
    {
        i = 1;
        J0x580:

        // End:0x6FC [Loop If]
        if(i < TPInventory.TPQuickSlot.SaveQS.Length)
        {
            j = 0;
            J0x5A9:

            // End:0x6F2 [Loop If]
            if(j < 4)
            {
                // End:0x6E8
                if((TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] != none) && __NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j].UniqueID, instanceInfo.UniqueID))
                {
                    GameMgr.SetQuickSlotBox_Item(i - 1, j, 0, EmptyBtrDouble());
                    TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j] = none;
                    TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] = none;
                    ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[j];
                    ib.SetData(none, none);
                    UpdateQuickSlot(i);
                    // [Explicit Break]
                    goto J0x6F2;
                }
                ++j;
                // [Loop Continue]
                goto J0x5A9;
            }
            J0x6F2:

            i++;
            // [Loop Continue]
            goto J0x580;
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
    local int SlotPosition, i, OldSlotPosition;
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
    SlotPosition = int(ChangedNewSlotPosition) - 10;
    OldSlotPosition = instanceInfo.SlotPosition - 10;
    GameMgr.ChangeInstance_SkillSlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
    GameMgr.ChangeSkillBox_SlotPos(ChangedNewSkillUniqueID, int(ChangedNewSlotPosition));
    switch(ChangedNewSlotPosition)
    {
        // End:0x170
        case 14:
        // End:0x175
        case 15:
        // End:0x17A
        case 16:
        // End:0x207
        case 17:
            TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[SlotPosition] = ItemInfo;
            TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition] = instanceInfo;
            TPInventory.TPQuickSlot.ButtonQuickSlot[SlotPosition].SetData(ItemInfo, instanceInfo);
            // End:0x298
            break;
        // End:0x295
        case 13:
            TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[OldSlotPosition] = none;
            TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[OldSlotPosition] = none;
            instanceInfo.SlotPosition = 13;
            TPInventory.TPQuickSlot.ButtonQuickSlot[OldSlotPosition].SetData(none, none);
            // End:0x298
            break;
        // End:0xFFFF
        default:
            break;
    }
    page_Main.TcpChannel.sfReqConfirmSkillChanged();
    rfEquipItemTime.Update(rfEquipItemTime.fMaxTime);
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
    self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
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
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).SendProtocall = false;
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
    // End:0x1A4
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
            ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(UniqueItemID[0]);
        }
        BTWindowItemRepairHK(Controller.TopPage()).SetData(UniqueItemID[0], RepairCost[0], MM.kPoint, ro.ItemInfo, ro.instanceInfo);
        BTWindowItemRepairHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairHK_OnOK;        
    }
    else
    {
        i = 0;
        J0x1AB:

        // End:0x20A [Loop If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1EE
            if(i < TPInventory.TPWeapon.EquipItemCount)
            {
                equipRepairCost += RepairCost[i];
            }
            invenRepairCost += RepairCost[i];
            i++;
            // [Loop Continue]
            goto J0x1AB;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairAllHK");
        // End:0x289
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
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).SendProtocall = false;
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
    MM.kPoint = Point;
    MM.kCash = Cash;
    MM.UpdateMoneyInfo(MM);
    PlayerOwner().PlaySound(Controller.ItemAddPartsSound, 6, 1.0000000);
    RefreshWarehouse(true);
    // End:0x1E2
    if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].UniqueID, instanceInfo.UniqueID))
    {
        TPInventory.CharacterModel.ChangeWeaponsParts(instanceInfo.PartID);
        TPInventory.CharacterModel.ChangeWeaponsPaints(instanceInfo.PaintID);
    }
    return true;
    //return;    
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    local wMyPlayerStatus MyStatus;
    local int i;

    Log("[BTPageInventory::rfAckUpdateQSlot] Result=" $ string(Result));
    // End:0x5E
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    i = 0;
    J0x65:

    // End:0xF7 [Loop If]
    if(i < 9)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].SetData(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[i], TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[i]);
        i++;
        // [Loop Continue]
        goto J0x65;
    }
    // End:0x172
    if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0] == none)
    {
        TPInventory.CharacterModel.DeleteWeapone();
        TPInventory.CharacterModel.PlayAnim(TPInventory.CharacterModel.NoHaveWeaponIdle, 1.0000000, 0.2000000);        
    }
    else
    {
        self.TPInventory.CharacterModel.ChangeWeapon(self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].ItemID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PartID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PaintID);
    }
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
    self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
    RefreshSlotNum();
    return true;
    //return;    
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    local wItemBoxHK ItemInfo;
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
    ItemInfo = GameMgr.FindUIItem(ItemIDChoose);
    // End:0x154
    if(ItemInfo.ItemType == 22)
    {
        GameMgr.AddInstanceItemByParameter(ItemIDChoose, __NFUN_921__(0), __NFUN_923__(ItemIdx), 13, 1, 100000, PartIDChoose, 0, StackCount, 0, UntilTime);        
    }
    else
    {
        GameMgr.AddInstanceItemByParameter(ItemIDChoose, ItemIdx, 0, 13, 1, 100000, PartIDChoose, 0, StackCount, 0, UntilTime);
    }
    GameMgr.UpdateItemList(GameMgr);
    return true;
    //return;    
}

function RefreshSlotNum()
{
    local int i, j;
    local BTROItemBoxHK ro;

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

    // End:0x2D1 [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0xCD:

        // End:0x2C7 [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x163
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] == none)
            {
                // [Explicit Continue]
                goto J0x2BD;
            }
            // End:0x2BD
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0].UniqueID, ro.instanceInfo.UniqueID) && ((((ro.ItemInfo.ItemType == 0) || ro.ItemInfo.ItemType == 1) || ro.ItemInfo.ItemType == 2) || ro.ItemInfo.ItemType == 32) || ro.ItemInfo.ItemType == 33)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0x2C7;
            }
            J0x2BD:

            j++;
            // [Loop Continue]
            goto J0xCD;
        }
        J0x2C7:

        i++;
        // [Loop Continue]
        goto J0xA4;
    }
    i = 0;
    J0x2D8:

    // End:0x487 [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x301:

        // End:0x47D [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x397
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1] == none)
            {
                // [Explicit Continue]
                goto J0x473;
            }
            // End:0x473
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1].UniqueID, ro.instanceInfo.UniqueID) && ro.ItemInfo.ItemType == 3)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0x47D;
            }
            J0x473:

            j++;
            // [Loop Continue]
            goto J0x301;
        }
        J0x47D:

        i++;
        // [Loop Continue]
        goto J0x2D8;
    }
    i = 0;
    J0x48E:

    // End:0x63F [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x4B7:

        // End:0x635 [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x54E
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2] == none)
            {
                // [Explicit Continue]
                goto J0x62B;
            }
            // End:0x62B
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2].UniqueID, ro.instanceInfo.UniqueID) && ro.ItemInfo.ItemType == 4)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0x635;
            }
            J0x62B:

            j++;
            // [Loop Continue]
            goto J0x4B7;
        }
        J0x635:

        i++;
        // [Loop Continue]
        goto J0x48E;
    }
    i = 0;
    J0x646:

    // End:0x7F7 [Loop If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x66F:

        // End:0x7ED [Loop If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x706
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3] == none)
            {
                // [Explicit Continue]
                goto J0x7E3;
            }
            // End:0x7E3
            if(__NFUN_912__(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3].UniqueID, ro.instanceInfo.UniqueID) && ro.ItemInfo.ItemType == 4)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                // [Explicit Break]
                goto J0x7ED;
            }
            J0x7E3:

            j++;
            // [Loop Continue]
            goto J0x66F;
        }
        J0x7ED:

        i++;
        // [Loop Continue]
        goto J0x646;
    }
    //return;    
}

defaultproperties
{
    strSellingSuccess[0]="Sale Complete"
    strSellingSuccess[1]=" was sold for "
    strSellingSuccess[2]=" points."
    fbLabelPoint=(X1=691.0000000,Y1=97.0000000,X2=826.0000000,Y2=110.0000000)
    fbLabelCash=(X1=871.0000000,Y1=97.0000000,X2=1006.0000000,Y2=110.0000000)
    fbLabelP=(X1=669.0000000,Y1=95.0000000,X2=686.0000000,Y2=112.0000000)
    fbLabelC=(X1=849.0000000,Y1=95.0000000,X2=866.0000000,Y2=112.0000000)
    // Reference: BTTPInventoryHKCN'GUIWarfare_Decompressed.BTPageInventory.mTPInven'
    begin object name="mTPInven" class=GUIWarfareControls.BTTPInventoryHKCN
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
    fbWeaponListBg=(X1=601.0000000,Y1=191.0000000,X2=687.0000000,Y2=305.0000000)
    strWeaponList[0]="All"
    strWeaponList[1]="Assault Rifle"
    strWeaponList[2]="SMG"
    strWeaponList[3]="Sniper Rifle"
    strWeaponList[4]="Shotgun"
    strWeaponList[5]="Machine Gun"
    fbLabelBackgrounddeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    currentBGM="bgm_lobby_part1"
    bPersistent=false
    OnOpen=BTPageInventory.InternalOnOpen
    OnClose=BTPageInventory.InternalOnClose
    OnRendered=BTPageInventory.InternalOnRendered
}