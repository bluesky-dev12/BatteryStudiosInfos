/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageInventory.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:31
 *	Functions:77
 *
 *******************************************************************************/
class BTPageInventory extends BTNetGUIPageHK
    dependson(BTNetGUIPageHK)
    dependson(BTRefreshTime)
    dependson(BTPageInventory_TCP)
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
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelPoint;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelCash;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelP;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelC;
var export editinline BTOwnerDrawImageHK LabelP;
var export editinline BTOwnerDrawImageHK LabelC;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelCCoinCash;
var export editinline BTOwnerDrawImageHK LabelCCoinCash;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbRedeemCodesBtn;
var export editinline BTOwnerDrawCaptionButtonHK RedeemCodesBtn;
var localized string strRedeemCodesBtn;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPInventoryHK TPInventory;
var BTRefreshTime rfEquipItemTime;
var int nCurQuickSlot;
var export editinline BTOwnerDrawImageHK LabelBackgrounddeco;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelBackgrounddeco;
var int LastSelectIndex;
var export editinline BTOwnerDrawCaptionButtonHK ChargeCashBtn;
var localized string strChargeCash;
var export editinline BTOwnerDrawImageHK LabelSlot;
var localized string strLabelSlot;

function bool rfAckShopItemListStart(int Count)
{
    Log("[BTPageInventory::rfAckShopItemListStart] Count : " $ string(Count));
    GameMgr.ShopItemListCount = Count;
    GameMgr.ShopItemList.Length = 0;
    return true;
}

function bool rfAckShopItemList(array<int> ItemID)
{
    local int i;

    Log("[BTPageInventory::rfAckShopItemList]");
    i = 0;
    J0x2f:
    // End:0xdc [While If]
    if(i < ItemID.Length)
    {
        GameMgr.ShopItemList.Length = GameMgr.ShopItemList.Length + 1;
        GameMgr.ShopItemList[GameMgr.ShopItemList.Length - 1] = ItemID[i];
        Log("BTPageInventory::ShopList[" $ string(i) $ " ItemID : " $ string(ItemID[i]));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    return true;
}

function bool rfAckShopItemListEnd()
{
    local BtrTime t, t2;
    local wMyPlayerStatus MyStatus;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    Log("[BTPageInventory::rfAckShopItemListEnd]");
    return true;
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
            // End:0x2d5
            break;
        // End:0x8a
        case 1:
            page_Main.SetPage(20, true);
            // End:0x2d5
            break;
        // End:0xa4
        case 2:
            page_Main.SetPage(21, true);
            // End:0x2d5
            break;
        // End:0xbe
        case 4:
            page_Main.SetPage(18, true);
            // End:0x2d5
            break;
        // End:0x1d7
        case 5:
            // End:0xed
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, true);
            }
            // End:0x1d4
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x2d5
            break;
        // End:0x1df
        case 6:
            // End:0x2d5
            break;
        // End:0x1e7
        case 7:
            // End:0x2d5
            break;
        // End:0x1fe
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x2d5
            break;
        // End:0x23a
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x2d5
            break;
        // End:0x281
        case 10:
            PlayerOwner().Player.Console.SetOneBGM(page_Main.LastMainPageBGM);
            page_Main.SetPage(1, true);
            // End:0x2d5
            break;
        // End:0x2c4
        case 11:
            Controller.OpenMenu("GuiWarfareControls.BTWindowBTTPQuestInfoHK");
            // End:0x2d5
            break;
        // End:0x2d2
        case 20:
            OpenTodayResultPage();
            // End:0x2d5
            break;
        // End:0xffff
        default:
            return true;
    }
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
    // End:0x12d
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x174
    if(ItemInfo.Grade == 7 && MM.IsPlayingPCBang() == false)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;
    }
    // End:0xc5b
    else
    {
        // End:0x1c4
        if(GameMgr.CheckItemBox(ItemInfo.ItemType))
        {
            TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID);
            return;
        }
        // End:0xc5b
        else
        {
            // End:0xc1c
            if(GameMgr.CheckUseItem(ItemInfo.ItemType))
            {
                switch(ItemInfo.ItemID)
                {
                    // End:0x1fc
                    case 17004:
                    // End:0x2cd
                    case 17075:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 15);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xc17
                        break;
                    // End:0x2d5
                    case 17005:
                    // End:0x3a6
                    case 17076:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 16);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
                        // End:0xc17
                        break;
                    // End:0x454
                    case 17012:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 9);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xc17
                        break;
                    // End:0x502
                    case 17013:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 13);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xc17
                        break;
                    // End:0x5b0
                    case 17018:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xc17
                        break;
                    // End:0x65e
                    case 17082:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 57);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xc17
                        break;
                    // End:0x70c
                    case 17049:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 59);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xc17
                        break;
                    // End:0x81b
                    case 17011:
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 7);
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                        BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kUserName;
                        BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kUserName);
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        // End:0xc17
                        break;
                    // End:0x958
                    case 17017:
                        // End:0x93f
                        if(MM.kClanName != "")
                        {
                            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 5);
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_btrdouble = instanceInfo.UniqueID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_int = ItemInfo.ItemID;
                            BTWindowDefineARHK(Controller.TopPage()).ExtraData_string = MM.kClanName;
                            BTWindowDefineARHK(Controller.TopPage()).EditName.SetText(MM.kClanName);
                            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowDefineARHK_ItemUse_OnOK;
                        }
                        // End:0x955
                        else
                        {
                            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 150);
                        }
                        // End:0xc17
                        break;
                    // End:0xaa6
                    case 17014:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(2);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xc17
                        break;
                    // End:0xaae
                    case 17019:
                    // End:0xbfb
                    case 17099:
                        Controller.OpenMenu("GUIWarfareControls.BTWindowCreateClanMarkHK");
                        BTWindowCreateClanMarkHK(Controller.TopPage()).UniqueID = instanceInfo.UniqueID;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetPaidType(1);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).SetCurrentClanMark(MM.kClanPattern, MM.kClanBG, MM.kClanBL);
                        BTWindowCreateClanMarkHK(Controller.TopPage()).__OnOK__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_OnOK;
                        BTWindowCreateClanMarkHK(Controller.TopPage()).ButtonIsExist.__OnClick__Delegate = TPInventory.TPWeapon.BTWindowCreateClanMarkHK_IsExist_OnOK;
                        // End:0xc17
                        break;
                    // End:0xc06
                    case 17015:
                        // End:0xc17
                        break;
                    // End:0xc11
                    case 17016:
                        // End:0xc17
                        break;
                    // End:0xffff
                    default:
                        // End:0xc17 Break;
                        break;
                }
                return;
            }
            // End:0xc5b
            else
            {
                // End:0xc5b
                if(GameMgr.CheckRandBoxItem(ItemInfo.ItemType))
                {
                    TcpChannel.sfReqRandomBox_Use(instanceInfo.UniqueID);
                    return;
                }
            }
        }
    }
}

function EquipQuickSlot()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x12d
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType) && currentSlot != 0)
    {
        TPInventory.TPQuickSlot.InvenGroup.SelectButton(0);
    }
    // End:0x17f
    if(GameMgr.CheckSubWeaponItem(ItemInfo.ItemType) && currentSlot != 1)
    {
        TPInventory.TPQuickSlot.InvenGroup.SelectButton(1);
    }
    // End:0xa3e
    else
    {
        // End:0x77a
        if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
        {
            // End:0x1f0
            if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2] == none)
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
            }
            // End:0x264
            else
            {
                // End:0x241
                if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3] == none)
                {
                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);
                }
                // End:0x264
                else
                {
                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
                }
            }
            // End:0x303
            if(ItemInfo.ItemID == TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID || ItemInfo.ItemID == TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID)
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                return;
            }
            // End:0x41c
            if(ItemInfo.ItemID == 6003)
            {
                // End:0x41c
                if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID == 6007 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID == 60071 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID == 60071 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID == 6007)
                {
                    class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                    return;
                }
            }
            // End:0x535
            if(ItemInfo.ItemID == 6007)
            {
                // End:0x535
                if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID == 6003 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID == 60071 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID == 60071 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID == 6003)
                {
                    class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                    return;
                }
            }
            // End:0x64e
            if(ItemInfo.ItemID == 60071)
            {
                // End:0x64e
                if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID == 6003 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID == 6007 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2].ItemID == 6007 || TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3].ItemID == 6003)
                {
                    class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                    return;
                }
            }
            currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
            // End:0x6f6
            if(currentSlot == 2 && instanceInfo.SlotPosition == 3)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[instanceInfo.SlotPosition] = none;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[instanceInfo.SlotPosition] = none;
            }
            // End:0x777
            if(currentSlot == 3 && instanceInfo.SlotPosition == 2)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[instanceInfo.SlotPosition] = none;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[instanceInfo.SlotPosition] = none;
            }
        }
        // End:0xa3e
        else
        {
            // End:0x7ce
            if(GameMgr.CheckHeadItem(ItemInfo.ItemType) && currentSlot != 4)
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(4);
            }
            // End:0xa3e
            else
            {
                // End:0x822
                if(GameMgr.CheckFaceItem(ItemInfo.ItemType) && currentSlot != 5)
                {
                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(5);
                }
                // End:0xa3e
                else
                {
                    // End:0x876
                    if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType) && currentSlot != 6)
                    {
                        TPInventory.TPQuickSlot.InvenGroup.SelectButton(6);
                    }
                    // End:0xa3e
                    else
                    {
                        // End:0x9fb
                        if(GameMgr.CheckSpCharItem(ItemInfo.ItemType))
                        {
                            // End:0x8d0
                            if(ItemInfo.EquipTeam == 1)
                            {
                                TPInventory.TPQuickSlot.InvenGroup.SelectButton(7);
                            }
                            // End:0x9f8
                            else
                            {
                                // End:0x90b
                                if(ItemInfo.EquipTeam == 2)
                                {
                                    TPInventory.TPQuickSlot.InvenGroup.SelectButton(8);
                                }
                                // End:0x9f8
                                else
                                {
                                    // End:0x9f8
                                    if(currentSlot != 7 && currentSlot != 8)
                                    {
                                        // End:0x97d
                                        if(TPInventory.TPWeapon.ButtonWeapon[7].itemBox.ItemInfo == none)
                                        {
                                            TPInventory.TPQuickSlot.InvenGroup.SelectButton(8);
                                        }
                                        // End:0x9f8
                                        else
                                        {
                                            // End:0x9d5
                                            if(TPInventory.TPWeapon.ButtonWeapon[8].itemBox.ItemInfo == none)
                                            {
                                                TPInventory.TPQuickSlot.InvenGroup.SelectButton(8);
                                            }
                                            // End:0x9f8
                                            else
                                            {
                                                TPInventory.TPQuickSlot.InvenGroup.SelectButton(7);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        // End:0xa3e
                        else
                        {
                            // End:0xa3e
                            if(GameMgr.CheckLvMark(ItemInfo.ItemType))
                            {
                                TPInventory.TPQuickSlot.InvenGroup.SelectButton(9);
                            }
                        }
                    }
                }
            }
        }
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0xaf9
    if(currentSlot < 4)
    {
        // End:0xa8b
        if(currentSlot == instanceInfo.SlotPosition)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex());
        PlayerOwner().PlaySound(Controller.ItemEquipSuccessSound, 6, 1.0);
    }
    // End:0xb8e
    else
    {
        // End:0xb1b
        if(currentSlot == instanceInfo.SlotPosition - 18 + 4)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex() + 18 - 4);
        PlayerOwner().PlaySound(Controller.ItemEquipSuccessSound, 6, 1.0);
    }
}

function bool BTWindowModifyHK_OnOK(GUIComponent Sender)
{
    local BTROItemBoxHK itemBox;
    local export editinline BTWindowModifyHK WinModify;

    WinModify = BTWindowModifyHK(Controller.FindMenuByClass(class'BTWindowModifyHK'));
    TcpChannel.sfReqModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID());
    return true;
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
    // End:0x75
    else
    {
        UnequipQuickSlot(btn.ButtonID);
    }
    return true;
}

function UnequipItem(int ButtonID)
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[ButtonID];
    instanceInfo = TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[ButtonID];
    // End:0x21a
    if(instanceInfo != none)
    {
        // End:0xd6
        if(ItemInfo.ItemID == GameMgr.GetMainWeaponID() || ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        // End:0x144
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            TcpChannel.sfReqEquipSkill(instanceInfo.ItemID, instanceInfo.UniqueSkillID, 13);
            PlayerOwner().PlaySound(Controller.ItemTakeoffSound, 6, 1.0);
            return;
        }
        // End:0x189
        if(instanceInfo.SlotPosition == 0)
        {
            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
        }
        // End:0x1fb
        else
        {
            // End:0x1ce
            if(instanceInfo.SlotPosition == 1)
            {
                TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
            }
            // End:0x1fb
            else
            {
                TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, 13);
            }
        }
        PlayerOwner().PlaySound(Controller.ItemTakeoffSound, 6, 1.0);
    }
}

function UpdateWebzenInvenListEnd(BTNetMainMenu MainMenu)
{
    local int i;
    local export editinline BTWindowDefineStateHK BTWindow;

    Log("[BTPageInventory::UpdateWebzenInvenListEnd]");
    i = 0;
    J0x36:
    // End:0x94 [While If]
    if(i < Controller.MenuStack.Length)
    {
        BTWindow = BTWindowDefineStateHK(Controller.MenuStack[i]);
        // End:0x8a
        if(BTWindow != none)
        {
            BTWindow.FadeOut(false, true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    RefreshWarehouse();
    Log("TPInventory.TPWeapon.TPItemList.ItemList.ShowCashItem()");
    TPInventory.TPWeapon.TPItemList.ItemList.ShowCashItem();
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local export editinline BTOwnerDrawCaptionButtonHK temp;

    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    TPTopMenu.Shop.buttonImage[0] = class'BTUIResourcePoolHK'.default.TopMenuShop_Btn_n;
    TPTopMenu.Inventory.buttonImage[0] = class'BTUIResourcePoolHK'.default.TopMenuInven_Btn_on;
    LabelBackgrounddeco = NewLabelComponent(fbLabelBackgrounddeco, class'BTUIResourcePoolHK'.default.Inven_bg, 0.10);
    NewBackground = NewLabelComponent(fbNewBackground, class'BTUIResourcePoolHK'.default.new_Page_Thema, 0.000130);
    i = 0;
    J0xc3:
    // End:0x10a [While If]
    if(i < 9)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].__OnClick__Delegate = TPInventoryQS_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc3;
    }
    i = 0;
    J0x111:
    // End:0x1ab [While If]
    if(i < 5)
    {
        TPInventory.TPWeapon.MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        TPInventory.TPWeapon.SubButton[i].__OnHover__Delegate = SubButton_OnHover;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x111;
    }
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnlClick;
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.__OnHover__Delegate = ImageListBox_OnHover;
    i = 0;
    J0x222:
    // End:0x264 [While If]
    if(i < 2)
    {
        TPInventory.TPQuickSlot.ButtonTag[i].__OnClick__Delegate = TPQSClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x222;
    }
    i = 2;
    J0x26c:
    // End:0x2a9 [While If]
    if(i < 4)
    {
        TPInventory.TPQuickSlot.ButtonTag[i].DisableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x26c;
    }
    TPInventory.TabControl.SetVisiblePanel(0);
    TPInventory.TPWeapon.FocusFirst(none);
    InitializeCashNPoint();
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
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 96.0;
    LabelRoomName.ClipArea.X2 = 280.0;
    LabelRoomName.ClipArea.Y2 = 144.0;
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
    TPInventory.TPWeapon.__deleShowCashChargeWindow__Delegate = page_Main.ShowCashChargeWindow;
    rfEquipItemTime = new class'BTRefreshTime';
    rfEquipItemTime.SetMaxTime(0.50);
    LastSelectIndex = -1;
}

function bool ClickChargeCash(GUIComponent Sender)
{
    page_Main.ShowCashChargeWindow();
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

function bool ImageListBox_OnlClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMatchMaker MM;
    local wGameManager GameMgr;

    // End:0x17
    if(rfEquipItemTime.CheckCondition() == false)
    {
        return true;
    }
    ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
    // End:0x6c
    if(ItemList.DataList[ItemList.LastSelectedItemIndex].bMouseClick == false)
    {
        return true;
    }
    // End:0xa9
    if(ItemList.SelectItemIndex != ItemList.VolatileSelectItemIndex || ItemList.SelectItemIndex == -1)
    {
        return true;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    // End:0x1e7
    if(nCurQuickSlot == 0)
    {
        // End:0x1b5
        if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
        {
            BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).EquipSkill();
        }
        // End:0x1e4
        else
        {
            // End:0x1de
            if(GameMgr.CheckQuickSlotItem(ItemInfo.ItemType))
            {
                EquipQuickSlot();
            }
            // End:0x1e4
            else
            {
                EquipItem();
            }
        }
    }
    // End:0x30f
    else
    {
        // End:0x219
        if(MM.CheckUsingItem(ItemInfo) == false)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
            return true;
        }
        // End:0x2b7
        if(ItemInfo.ItemID == 2000 && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[0].ItemID == 2000 || ItemInfo.ItemID == 1010 && TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[1].ItemID == 1010)
        {
            return true;
        }
        // End:0x2e0
        if(GameMgr.CheckMainQuickSlotItem(ItemInfo.ItemType))
        {
            EquipMainQuickSlot();
        }
        // End:0x30f
        else
        {
            // End:0x309
            if(GameMgr.CheckEquipQuickSlotItem(ItemInfo.ItemType))
            {
                EquipQuickSlot();
            }
            // End:0x30f
            else
            {
                EquipItem();
            }
        }
    }
    return true;
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
    // End:0x13d [While If]
    if(i < 8)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].SetData(TPInventory.TPQuickSlot.SaveQS[btn.ButtonID].ItemInfo[i], TPInventory.TPQuickSlot.SaveQS[btn.ButtonID].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x99;
    }
    // End:0x1c2
    if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0] == none)
    {
        TPInventory.CharacterModel.DeleteWeapone();
        self.TPInventory.CharacterModel.PlayAnim(self.TPInventory.CharacterModel.NoHaveWeaponIdle, 1.0, 0.20);
    }
    // End:0x275
    else
    {
        self.TPInventory.CharacterModel.ChangeWeapon(self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].ItemID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PartID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PaintID);
    }
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
    self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
    return false;
}

function bool SubButton_OnHover(GUIComponent Sender)
{
    local int mainTab, subTab, i;

    mainTab = TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex();
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
            if(bShowWeaponeTypeList && TPInventory.TPWeapon.SubButton[1].MenuState == 4)
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

function bool SubButton_OnClick(GUIComponent Sender)
{
    local int i;

    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPInventory.TPWeapon.TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ChangeItemList(TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).SubTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshSlotNum();
    // End:0x1ba
    if(TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex() == 1 && BTOwnerDrawCaptionButtonHK(Sender).ButtonID == 1)
    {
        // End:0x1ba
        if(bShowWeaponeTypeList && TPInventory.TPWeapon.SubButton[1].MenuState == 4)
        {
            i = 0;
            J0x178:
            // End:0x1a9 [While If]
            if(i < WeaponeTypeBtnList.Length)
            {
                WeaponeTypeBtnList[i].bVisible = true;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x178;
            }
            WeaponListBg.bVisible = true;
        }
    }
    return true;
}

function bool ImageListBox_OnHover(GUIComponent Sender)
{
    return false;
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
        // End:0xb4
        case 2:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowSMG();
            // End:0x150
            break;
        // End:0xe6
        case 3:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowSR();
            // End:0x150
            break;
        // End:0x118
        case 4:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowShotgun();
            // End:0x150
            break;
        // End:0x14d
        case 5:
            TPInventory.TPWeapon.TPItemList.ItemList.ShowMG();
            // End:0x150
            break;
            // End:0x150
            break;
        // End:0xffff
        default:
            RefreshSlotNum();
            BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).AddSubMenuBtns();
            i = 0;
            J0x17a:
            // End:0x1ab [While If]
            if(i < WeaponeTypeBtnList.Length)
            {
                WeaponeTypeBtnList[i].bVisible = false;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x17a;
            }
            WeaponListBg.bVisible = false;
            return false;
    }
}

function ClearChatLog_Extra()
{
    TPInventory.TPWeapon.ChatBox.Clear();
}

function NormalChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatNormal());
}

function ClanChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatClan());
}

function WhisperChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatWhisper());
}

function SelfChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatSystem());
}

function BroadCastItemChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
}

function TeamChatLog_Extra(string cL)
{
    TPInventory.TPWeapon.ChatBox.AddRowColor(GetCurrentCanvas(), cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function InitializeCashNPoint()
{
    CashColor = class'Canvas'.static.MakeColor(2, 198, 254, byte(255));
    PointColor = class'Canvas'.static.MakeColor(178, 233, 31, byte(255));
    LabelCash = new class'BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = CashColor;
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new class'BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = PointColor;
    LabelPoint.InitComponent(Controller, self);
    AppendComponent(LabelPoint);
    LabelCCoinCash = new class'BTOwnerDrawImageHK';
    LabelCCoinCash.bUseAWinPos = true;
    LabelCCoinCash.AWinPos = fbLabelCCoinCash;
    LabelCCoinCash.SetFontSizeAll(10);
    LabelCCoinCash.FontColor[0] = CashColor;
    LabelCCoinCash.InitComponent(Controller, self);
    AppendComponent(LabelCCoinCash);
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageInventory::UpdateMoneyInfo]");
    RefreshCashNPoint();
}

function UpdateItemList(wGameManager MM)
{
    Log("[BTPageInventory::UpdateItemList]");
    RefreshWarehouse(true);
}

function UpdateWebzenItemList(wGameManager MM)
{
    Log("[BTPageInventory::UpdateWebzenItemList]");
    RefreshWarehouse(true);
}

function UpdateServerTime(wGameManager GameMgr)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::UpdateServerTime]");
    RefreshWarehouse(true);
    // End:0xc4
    if(page_Main.rMM.kFirstIntoInventory == false)
    {
        page_Main.rMM.kFirstIntoInventory = true;
        instanceInfo = GameMgr.FindFirstInstanceItemByItemID(17001);
        // End:0xc4
        if(instanceInfo != none)
        {
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 25);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_25_OnOK;
        }
    }
}

function bool BTWindowDefineARHK_25_OnOK(GUIComponent Sender)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::BTWindowDefineARHK_25_OnOK] ");
    Controller.CloseMenu(false);
    instanceInfo = GameMgr.FindFirstInstanceItemByItemID(17001);
    page_Main.TcpChannel.sfReqItemListInItemBox(instanceInfo.UniqueID, instanceInfo.ItemID);
    return true;
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
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int SelIndex;
    local RenderObject ro;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;
    local wItemBoxHK cItemInfo;
    local wItemBoxInstanceHK cInstanceInfo;
    local bool bActivePage;

    InternalOnPreDraw(C);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    SelIndex = TPInventory.TPWeapon.TPItemList.ItemList.SelectItemIndex;
    // End:0x2ea
    if(SelIndex >= 0 && LastSelectIndex != SelIndex)
    {
        ro = TPInventory.TPWeapon.TPItemList.ItemList.DataList[SelIndex];
        // End:0x2df
        if(ro != none && BTROItemBoxHK(ro).ItemInfo != none)
        {
            ItemList = TPInventory.TPWeapon.TPItemList.ItemList;
            ItemInfo = BTROItemBoxHK(ro).ItemInfo;
            instanceInfo = BTROItemBoxHK(ro).instanceInfo;
            cItemInfo = none;
            cInstanceInfo = none;
            // End:0x1bd
            if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType))
            {
                cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[0];
                cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0];
            }
            // End:0x2aa
            else
            {
                // End:0x234
                if(GameMgr.CheckSubWeaponItem(ItemInfo.ItemType))
                {
                    cItemInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[1];
                    cInstanceInfo = TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[1];
                }
                // End:0x2aa
                else
                {
                    // End:0x2aa
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
    // End:0x493
    if(WeaponListBg.bVisible == false && bActivePage)
    {
        // End:0x437
        if(Controller.MouseX >= TPInventory.TPWeapon.fbTPItemList.X1 && Controller.MouseY >= TPInventory.TPWeapon.fbTPItemList.Y1)
        {
            // End:0x434
            if(Controller.MouseX <= TPInventory.TPWeapon.fbTPItemList.X2 && Controller.MouseY <= TPInventory.TPWeapon.fbTPItemList.Y2)
            {
                TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetFocus(TPInventory.TPWeapon.TPItemList.ItemList.ImageList);
            }
        }
        // End:0x493
        else
        {
            TPInventory.TPWeapon.TPItemList.ItemList.ImageList.LoseFocus(TPInventory.TPWeapon.TPItemList.ItemList.ImageList);
        }
    }
    rfEquipItemTime.Update(PlayerOwner().Level.AppDeltaTime);
    return true;
}

function InternalOnReOpen()
{
    UnresolvedNativeFunction_97("BTPageInventory::InternalOnReOpen()");
    Log("[BTPageInventory::InternalOnReOpen] Start");
    Log("[BTPageInventory::InternalOnReOpen] End");
}

function InternalOnOpen()
{
    local int i;

    UnresolvedNativeFunction_97("BTPageInventory::InternalOnOpen()");
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
    J0x20c:
    // End:0x29e [While If]
    if(i < 8)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].SetData(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[i], TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20c;
    }
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
    self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
    TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).AddSubMenuBtns();
    // End:0x47c
    if(GameMgr.ShopItemListCount == 0)
    {
        page_Main.TcpChannel.sfReqShopItemList();
    }
    // End:0x4b6
    if(page_Main.rMM.kInterfaceGuideStep == 3)
    {
        page_Main.rMM.kInterfaceGuideStep = 4;
    }
    TPInventory.TPQuickSlot.QSButtonGroup.SelectButton(0);
    page_Main.TcpChannel.sfReqGetServerTime();
    page_Main.CheckWebzenShopItemList();
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageInventory::InternalOnClose()");
    Log("[BTPageInventory::InternalOnClose] ");
    TPInventory.CharacterModel.EndModel();
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
    UnInitializeDelegate();
    OnClose(bCanceled);
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageInventory_TCP TCP;

    TCP = new class'BTPageInventory_TCP';
    TCP.Owner = self;
    return TCP;
}

function RefreshEquipSkill()
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:
    // End:0xe7 [While If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(14 + i);
        // End:0xdd
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xdd
            if(ItemInfo != none)
            {
                self.TPInventory.TPSkill.ButtonSkill[i].SetData(ItemInfo, instanceInfo);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
}

function RefreshQuickSlot()
{
    local int i, selectIndex;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    selectIndex = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    i = 0;
    J0x5d:
    // End:0x18b [While If]
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
            // End:0x150
            else
            {
                self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(none, none);
            }
        }
        // End:0x181
        else
        {
            self.TPInventory.TPQuickSlot.ButtonQuickSlot[i].SetData(none, none);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
}

function RefreshCashNPoint()
{
    Log("[BTPageInventory::RefreshCashNPoint]");
    LabelPoint.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(125, class'BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));
    LabelCash.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(126, class'BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
    LabelCCoinCash.Caption = class'BTWindowDefineInfoHK'.static.GetFormatString(223, class'BTCustomDrawHK'.static.ToWonString(string(MM.kCCoinCash)));
}

function FillQuickSlotInventories()
{
    local int i, j;
    local wMyPlayerStatus MyStatus;
    local BTROItemBoxHK ro;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPInventory.TPQuickSlot.SaveQS.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x96:
    // End:0x161 [While If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x157
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x157
            if(ItemInfo != none)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[i] = ItemInfo;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[i] = instanceInfo;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x96;
    }
    i = 14;
    J0x169:
    // End:0x23c [While If]
    if(i < 18)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x232
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x232
            if(ItemInfo != none)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[i - 10] = ItemInfo;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[i - 10] = instanceInfo;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x169;
    }
    j = 0;
    J0x243:
    // End:0x406 [While If]
    if(j < 3)
    {
        i = 0;
        J0x256:
        // End:0x3fc [While If]
        if(i < GameMgr.QuickSlotBoxList.Length - 1)
        {
            TPInventory.TPQuickSlot.SaveQS[j + 1].ItemInfo[i] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].ItemID[i]);
            TPInventory.TPQuickSlot.SaveQS[j + 1].instanceInfo[i] = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[j].UniqueID[i]);
            TPInventory.TPQuickSlot.SaveQS[j + 1].ItemInfo[i + 4] = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[j].SkillID[i]);
            TPInventory.TPQuickSlot.SaveQS[j + 1].instanceInfo[i + 4] = GameMgr.FindInstanceSkillItem(GameMgr.QuickSlotBoxList[j].UniqueSkillID[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x256;
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x243;
    }
}

function RefreshWarehouse(optional bool isSkipAddQSNum)
{
    local int TabIndex[2], topIdx, SelectIdx, i, j;

    local BTROItemBoxHK ro;

    TabIndex[0] = TPInventory.TPWeapon.TabControl[0].GetCurrentTabIndex();
    TabIndex[1] = TPInventory.TPWeapon.TabControl[1].GetCurrentTabIndex();
    topIdx = TPInventory.TPWeapon.TPItemList.ItemList.ImageList.Top;
    SelectIdx = TPInventory.TPWeapon.TPItemList.ItemList.LastSelectedItemIndex;
    // End:0xcf
    if(SelectIdx < 0)
    {
        SelectIdx = 0;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPInventory.TPWeapon.fill();
    FillQuickSlotInventories();
    RefreshCashNPoint();
    TPInventory.TPWeapon.Refresh();
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
    i = 0;
    J0x209:
    // End:0x3c3 [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x232:
        // End:0x3b9 [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x2c8
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] == none)
            {
            }
            // End:0x3af
            else
            {
                // End:0x3af
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckMainWeaponItem(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x3b9
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x232;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x209;
    }
    i = 0;
    J0x3ca:
    // End:0x584 [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x3f3:
        // End:0x57a [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x489
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1] == none)
            {
            }
            // End:0x570
            else
            {
                // End:0x570
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckSubWeaponItem(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x57a
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x3f3;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3ca;
    }
    i = 0;
    J0x58b:
    // End:0x747 [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x5b4:
        // End:0x73d [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x64b
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2] == none)
            {
            }
            // End:0x733
            else
            {
                // End:0x733
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckThrowingWeapon(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x73d
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x5b4;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x58b;
    }
    i = 0;
    J0x74e:
    // End:0x90a [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x777:
        // End:0x900 [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x80e
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3] == none)
            {
            }
            // End:0x8f6
            else
            {
                // End:0x8f6
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckThrowingWeapon(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x900
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x777;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x74e;
    }
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    TPInventory.TPWeapon.TPItemList.ItemList.ImageList.SetTopItem(0);
    TPInventory.TPWeapon.MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).MainTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshSlotNum();
    return true;
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
    // End:0xcd
    if(instanceInfo == none)
    {
        return;
    }
    // End:0x113
    if(GameMgr.IsBlockedItemIdx(instanceInfo.UniqueID))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ItemInfo.ItemName);
        return;
    }
    // End:0x145
    if(false == MM.CheckUsingItem(ItemInfo))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 144);
        return;
    }
    // End:0x168
    if(ItemInfo.EquipLevel > MM.kLevel)
    {
        return;
    }
    i = 0;
    J0x16f:
    // End:0x286 [While If]
    if(i < 8)
    {
        // End:0x27c
        if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.ItemInfo != none)
        {
            // End:0x21b
            if(UnresolvedNativeFunction_99(instanceInfo.UniqueID, EmptyBtrDouble()))
            {
                // End:0x218
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueID, instanceInfo.UniqueID))
                {
                    return;
                }
            }
            // End:0x27c
            else
            {
                // End:0x27c
                if(instanceInfo.UniqueSkillID != 0)
                {
                    // End:0x27c
                    if(TPInventory.TPQuickSlot.ButtonQuickSlot[i].itemBox.instanceInfo.UniqueSkillID == instanceInfo.UniqueSkillID)
                    {
                        return;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16f;
    }
    currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    // End:0x304
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType) && currentSlot != 0)
    {
        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(0);
    }
    // End:0x5d6
    else
    {
        // End:0x35b
        if(GameMgr.CheckSubWeaponItem(ItemInfo.ItemType) && currentSlot != 1)
        {
            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(1);
        }
        // End:0x5d6
        else
        {
            // End:0x536
            if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
            {
                // End:0x533
                if(currentSlot != 2 && currentSlot != 3)
                {
                    // End:0x451
                    if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none && TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none && TPInventory.TPQuickSlot.ButtonQuickSlot[3].DefaultSlotItemID == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);
                    }
                    // End:0x533
                    else
                    {
                        // End:0x4ae
                        if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo == none)
                        {
                            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
                        }
                        // End:0x533
                        else
                        {
                            // End:0x50b
                            if(TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo == none)
                            {
                                self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);
                            }
                            // End:0x533
                            else
                            {
                                self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
                            }
                        }
                    }
                }
            }
            // End:0x5d6
            else
            {
                // End:0x5d6
                if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
                {
                    // End:0x595
                    if(ItemInfo.SkillUseType == 0)
                    {
                        self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(4);
                    }
                    // End:0x5d6
                    else
                    {
                        // End:0x5d4
                        if(ItemInfo.SkillUseType == 1)
                        {
                            self.TPInventory.TPQuickSlot.InvenGroup.SelectButton(5);
                        }
                        // End:0x5d6
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
    // End:0xb55
    if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
    {
        // End:0x66e
        if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[2] == none)
        {
            TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
        }
        // End:0x6e2
        else
        {
            // End:0x6bf
            if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[3] == none)
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(3);
            }
            // End:0x6e2
            else
            {
                TPInventory.TPQuickSlot.InvenGroup.SelectButton(2);
            }
        }
        // End:0x78f
        if(ItemInfo.ItemID == TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID || ItemInfo.ItemID == TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID)
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
            return;
        }
        // End:0x8c4
        if(ItemInfo.ItemID == 6003)
        {
            // End:0x8c4
            if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID == 6007 || TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID == 60071 || TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID == 60071 || TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID == 6007)
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                return;
            }
        }
        // End:0x9f9
        if(ItemInfo.ItemID == 6007)
        {
            // End:0x9f9
            if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID == 6003 || TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID == 60071 || TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID == 60071 || TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID == 6003)
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                return;
            }
        }
        // End:0xb2e
        if(ItemInfo.ItemID == 60071)
        {
            // End:0xb2e
            if(TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID == 6003 || TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID == 6007 || TPInventory.TPQuickSlot.ButtonQuickSlot[2].itemBox.ItemInfo.ItemID == 6007 || TPInventory.TPQuickSlot.ButtonQuickSlot[3].itemBox.ItemInfo.ItemID == 6003)
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, 863);
                return;
            }
        }
        currentSlot = TPInventory.TPQuickSlot.InvenGroup.GetSelectIndex();
    }
    switch(currentSlot)
    {
        // End:0xd45
        case 0:
            i = 0;
            J0xb67:
            // End:0xcee [While If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                // End:0xbb6
                if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] == none)
                {
                }
                // End:0xce4
                else
                {
                    // End:0xce4
                    if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0].UniqueID, instanceInfo.UniqueID))
                    {
                        // End:0xcb3
                        if(i != 0)
                        {
                            GameMgr.SetQuickSlotBox_Item(i - 1, 0, 0, EmptyBtrDouble());
                            TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[0] = none;
                            TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] = none;
                            ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0];
                            ib.SetData(none, none);
                            UpdateQuickSlot(i);
                            // This is an implied JumpToken;
                            goto J0xcee;
                        }
                        // End:0xce4
                        else
                        {
                            TcpChannel.sfReqEquipItem(GameMgr.GetMainWeaponID(), GameMgr.GetMainWeaponUniqueID(), 0);
                            // This is an implied JumpToken;
                            goto J0xcee;
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xb67;
            }
            J0xcee:
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x11db
            break;
        // End:0xf46
        case 1:
            i = 0;
            J0xd50:
            // End:0xeef [While If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                // End:0xda3
                if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot] == none)
                {
                }
                // End:0xee5
                else
                {
                    // End:0xee5
                    if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot].UniqueID, instanceInfo.UniqueID))
                    {
                        // End:0xeb4
                        if(i != 0)
                        {
                            GameMgr.SetQuickSlotBox_Item(i - 1, currentSlot, 0, EmptyBtrDouble());
                            TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[currentSlot] = none;
                            TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[currentSlot] = none;
                            ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[currentSlot];
                            ib.SetData(none, none);
                            UpdateQuickSlot(i);
                            // This is an implied JumpToken;
                            goto J0xeef;
                        }
                        // End:0xee5
                        else
                        {
                            TcpChannel.sfReqEquipItem(GameMgr.GetSubWeaponID(), GameMgr.GetSubWeaponUniqueID(), 1);
                            // This is an implied JumpToken;
                            goto J0xeef;
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xd50;
            }
            J0xeef:
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x11db
            break;
        // End:0xf4b
        case 2:
        // End:0x1169
        case 3:
            i = 0;
            J0xf57:
            // End:0x1112 [While If]
            if(i < TPInventory.TPQuickSlot.SaveQS.Length)
            {
                j = 0;
                J0xf80:
                // End:0x1108 [While If]
                if(j < 4)
                {
                    // End:0xfbd
                    if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] == none)
                    {
                    }
                    // End:0x10fe
                    else
                    {
                        // End:0x10fe
                        if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j].UniqueID, instanceInfo.UniqueID))
                        {
                            // End:0x10ce
                            if(i != 0)
                            {
                                GameMgr.SetQuickSlotBox_Item(i - 1, j, 0, EmptyBtrDouble());
                                TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j] = none;
                                TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] = none;
                                ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[j];
                                ib.SetData(none, none);
                                UpdateQuickSlot(i);
                                // This is an implied JumpToken;
                                goto J0x1108;
                            }
                            // End:0x10fe
                            else
                            {
                                TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, 13);
                                // This is an implied JumpToken;
                                goto J0x1108;
                            }
                        }
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0xf80;
                }
                J0x1108:
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xf57;
            }
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot, instanceInfo.ItemID, instanceInfo.UniqueID);
            // End:0x11db
            break;
        // End:0x116e
        case 4:
        // End:0x1173
        case 5:
        // End:0x1178
        case 6:
        // End:0x11d8
        case 7:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, currentSlot - 4, instanceInfo.ItemID, instanceInfo.UniqueSkillID);
            // End:0x11db
            break;
        // End:0xffff
        default:
            TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].ItemInfo[currentSlot] = ItemInfo;
            TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].instanceInfo[currentSlot] = instanceInfo;
            TPInventory.TPQuickSlot.ButtonQuickSlot[currentSlot].SetData(ItemInfo, instanceInfo);
            UpdateQuickSlot(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex());
}

function UnequipQuickSlot(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    switch(ButtonID)
    {
        // End:0x0b
        case 0:
        // End:0x0f
        case 1:
        // End:0x14
        case 2:
        // End:0x5b
        case 3:
            GameMgr.SetQuickSlotBox_Item(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, ButtonID, 0, EmptyBtrDouble());
            // End:0xb3
            break;
        // End:0x60
        case 4:
        // End:0x65
        case 5:
        // End:0x6a
        case 6:
        // End:0xb0
        case 7:
            GameMgr.SetQuickSlotBox_Skill(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex() - 1, ButtonID - 4, 0, 0);
            // End:0xb3
            break;
        // End:0xffff
        default:
            TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].ItemInfo[ButtonID] = none;
            TPInventory.TPQuickSlot.SaveQS[TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex()].instanceInfo[ButtonID] = none;
            ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[ButtonID];
            ib.SetData(none, none);
            UpdateQuickSlot(TPInventory.TPQuickSlot.QSButtonGroup.GetSelectIndex());
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
    PlayerOwner().dblog("DispOrder = " $ string(i) $ ", QSlotID = " $ string(arQslotID) $ ", QSlotName = " $ arQslotName);
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[0]);
    // End:0x2d1
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("0 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[1]);
    // End:0x35d
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("1 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[2]);
    // End:0x3ea
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("2 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[3]);
    // End:0x477
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("3 ItemName = " $ ItemInfo.ItemName $ ", ItemID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[0]);
    // End:0x505
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("0 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[1]);
    // End:0x593
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("1 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[2]);
    // End:0x622
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("2 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].SkillID[3]);
    // End:0x6b1
    if(ItemInfo != none)
    {
        PlayerOwner().dblog("3 SkillName = " $ ItemInfo.ItemName $ ", SkillID = " $ string(ItemInfo.ItemID));
    }
    page_Main.TcpChannel.sfReqUpdateQSlot(arQslotID, arQslotName, arMWItemID, arPistolItemID, arTWItemID1, arTWItemID2, arSkill1, arSkill2, arSkill3, arSkill4);
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
    // End:0x92
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
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
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf7
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

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8f
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xde
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0x104
    else
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
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
    // End:0x17b
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageInventory::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo, prevInstanceInfo;
    local wMyPlayerStatus MyStatus;
    local int PrevSlotPos, SlotPosition, i, j;
    local export editinline BTItemBoxButtonHK ib;

    Log("[BTPageInventory::rfAckEquipItem] Result=" $ string(Result));
    // End:0x5c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(ChangedNewItemID);
    instanceInfo = GameMgr.FindInstanceItem(ChangedNewUniqueID);
    SlotPosition = ChangedNewSlotPosition;
    // End:0x10f
    if(instanceInfo == none)
    {
        return false;
    }
    // End:0x12b
    if(UnresolvedNativeFunction_99(instanceInfo.UniqueID, EmptyBtrDouble()))
    {
        return false;
    }
    PrevSlotPos = instanceInfo.SlotPosition;
    // End:0x150
    if(SlotPosition == PrevSlotPos)
    {
        return true;
    }
    // End:0x18c
    if(SlotPosition == 0 && instanceInfo.Durability <= 1000)
    {
        // End:0x18c
        if(ItemInfo.Grade == 0)
        {
        }
        // End:0x18c
        else
        {
        }
    }
    GameMgr.ChangeInstance_ItemSlotPos(ChangedNewUniqueID, SlotPosition);
    switch(SlotPosition)
    {
        // End:0x1b0
        case 0:
        // End:0x1b4
        case 1:
        // End:0x1b9
        case 2:
        // End:0x2a8
        case 3:
            prevInstanceInfo = TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition];
            // End:0x204
            if(prevInstanceInfo != none)
            {
                prevInstanceInfo.SlotPosition = 13;
            }
            TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[SlotPosition] = ItemInfo;
            TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[SlotPosition] = instanceInfo;
            // End:0x2a5
            if(SlotPosition == 0)
            {
                TPInventory.CharacterModel.ChangeWeapon(instanceInfo.ItemID, instanceInfo.PartID, instanceInfo.PaintID);
            }
            // End:0x499
            break;
        // End:0x36f
        case 13:
            instanceInfo.SlotPosition = 13;
            // End:0x319
            if(PrevSlotPos < 9)
            {
                TPInventory.TPQuickSlot.SaveQS[0].ItemInfo[PrevSlotPos] = none;
                TPInventory.TPQuickSlot.SaveQS[0].instanceInfo[PrevSlotPos] = none;
            }
            // End:0x36c
            else
            {
                BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[PrevSlotPos - 18 + 4].SetData(none, none);
                TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
            }
            // End:0x499
            break;
        // End:0x374
        case 18:
        // End:0x379
        case 19:
        // End:0x37e
        case 20:
        // End:0x383
        case 21:
        // End:0x388
        case 22:
        // End:0x496
        case 23:
            // End:0x424
            if(BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[SlotPosition - 18 + 4].itemBox != none)
            {
                prevInstanceInfo = BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[SlotPosition - 18 + 4].itemBox.instanceInfo;
                // End:0x424
                if(prevInstanceInfo != none)
                {
                    prevInstanceInfo.SlotPosition = 13;
                }
            }
            BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).ButtonWeapon[SlotPosition - 18 + 4].SetData(ItemInfo, instanceInfo);
            instanceInfo.SlotPosition = SlotPosition;
            TPInventory.CharacterModel.ChangeEquipItem(GameMgr);
            // End:0x499
            break;
        // End:0xffff
        default:
            // End:0x627
            if(nCurQuickSlot == 0)
            {
                i = 1;
                J0x4ab:
                // End:0x627 [While If]
                if(i < TPInventory.TPQuickSlot.SaveQS.Length)
                {
                    j = 0;
                    J0x4d4:
                    // End:0x61d [While If]
                    if(j < 4)
                    {
                        // End:0x613
                        if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] != none && UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j].UniqueID, instanceInfo.UniqueID))
                        {
                            GameMgr.SetQuickSlotBox_Item(i - 1, j, 0, EmptyBtrDouble());
                            TPInventory.TPQuickSlot.SaveQS[i].ItemInfo[j] = none;
                            TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[j] = none;
                            ib = BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[j];
                            ib.SetData(none, none);
                            UpdateQuickSlot(i);
                        }
                        // End:0x61d
                        else
                        {
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x4d4;
                        }
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x4ab;
                }
            }
            page_Main.TcpChannel.sfReqConfirmItemChanged();
            RefreshSlotNum();
            RefreshQuickSlot();
            rfEquipItemTime.Update(rfEquipItemTime.fMaxTime);
            return true;
    }
}

function bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    Log("[BTPageInventory::rfAckConfirmItemChanged] Result=" $ string(Result));
    // End:0x65
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    return true;
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    local int SlotPosition, OldSlotPosition;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wMyPlayerStatus MyStatus;

    Log("[BTPageInventory::rfAckEquipSkill] Result=" $ string(Result));
    // End:0x5d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
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
    SlotPosition = ChangedNewSlotPosition - 10;
    OldSlotPosition = instanceInfo.SlotPosition - 10;
    GameMgr.ChangeInstance_SkillSlotPos(ChangedNewSkillUniqueID, ChangedNewSlotPosition);
    GameMgr.ChangeSkillBox_SlotPos(ChangedNewSkillUniqueID, ChangedNewSlotPosition);
    switch(ChangedNewSlotPosition)
    {
        // End:0x170
        case 14:
        // End:0x175
        case 15:
        // End:0x17a
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
        // End:0xffff
        default:
            page_Main.TcpChannel.sfReqConfirmSkillChanged();
            rfEquipItemTime.Update(rfEquipItemTime.fMaxTime);
            self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
            self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
            return true;
    }
}

function bool rfReqConfirmSkillChanged()
{
    return true;
}

function bool BTWindowItemRepairHK_OnOK(GUIComponent Sender)
{
    local array<BtrDouble> rilist;

    Repair_UniqueItemID = BTWindowItemRepairHK(Sender).UniqueID;
    // End:0xdc
    if(BTWindowItemRepairHK(Sender).itemBox.itemBox.instanceInfo.DamageDegree >= 80000)
    {
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, BTWindowItemRepairHK(Sender).itemBox.itemBox.ItemName.Text);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairItem_OnOK;
        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
        return true;
    }
    // End:0x106
    else
    {
        rilist[0] = Repair_UniqueItemID;
        page_Main.TcpChannel.sfReqRepairItem(rilist);
    }
}

function bool RepairItem_OnOK(GUIComponent Sender)
{
    local array<BtrDouble> rilist;

    rilist[0] = Repair_UniqueItemID;
    page_Main.TcpChannel.sfReqRepairItem(rilist);
    Controller.CloseMenu(false);
    return true;
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
            // End:0xc4 [While If]
            if(i < TPInventory.TPWeapon.Equip_DamegeItemNames.Length)
            {
                strItemNames = strItemNames $ ", " $ TPInventory.TPWeapon.Equip_DamegeItemNames[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x68;
            }
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairAllItem_OnOK;
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
        }
        // End:0x15e
        else
        {
            LastReqRepairMode = 1;
            page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.EquipItemList);
        }
    }
    // End:0x29c
    else
    {
        // End:0x265
        if(TPInventory.TPWeapon.Inven_DamegeItemNames.Length > 0)
        {
            strItemNames = TPInventory.TPWeapon.Inven_DamegeItemNames[0];
            i = 1;
            J0x1a5:
            // End:0x201 [While If]
            if(i < TPInventory.TPWeapon.Inven_DamegeItemNames.Length)
            {
                strItemNames = strItemNames $ ", " $ TPInventory.TPWeapon.Inven_DamegeItemNames[i];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1a5;
            }
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairAllItem_OnOK;
            BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
        }
        // End:0x29c
        else
        {
            LastReqRepairMode = 2;
            page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.InvenItemList);
        }
    }
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).SendProtocall = false;
    return true;
}

function bool RepairAllItem_OnOK(GUIComponent Sender)
{
    // End:0x44
    if(RepairAllButtonID == 0)
    {
        LastReqRepairMode = 1;
        page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.EquipItemList);
    }
    // End:0x7b
    else
    {
        LastReqRepairMode = 2;
        page_Main.TcpChannel.sfReqRepairItem(TPInventory.TPWeapon.InvenItemList);
    }
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    local int i, equipRepairCost, invenRepairCost;
    local BTROItemBoxHK ro;

    Log("[BTPageInventory::rfAckRepairCost] Result=" $ string(Result));
    // End:0x5d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
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
    // End:0x295
    else
    {
        i = 0;
        J0x16d:
        // End:0x1cc [While If]
        if(i < UniqueItemID.Length)
        {
            // End:0x1b0
            if(i < TPInventory.TPWeapon.EquipItemCount)
            {
                equipRepairCost += RepairCost[i];
            }
            invenRepairCost += RepairCost[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x16d;
        }
        Controller.OpenMenu("GUIWarfareControls.BTWindowItemRepairAllHK");
        ro = BTROItemBoxHK(TPInventory.TPWeapon.TPItemList.ItemList.GetLastSelectedItem());
        BTWindowItemRepairAllHK(Controller.TopPage()).SetData(equipRepairCost, invenRepairCost, MM.kPoint);
        BTWindowItemRepairAllHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRepairAllHK_OnOK;
    }
    BTTPInventoryWeaponHKCN(TPInventory.TPWeapon).SendProtocall = false;
    return true;
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::rfAckRepairItem] Result=" $ string(Result));
    // End:0x6d
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    MM.kPoint = RepairCost;
    MM.UpdateMoneyInfo(MM);
    Log("RepairItem Cost = " $ string(RepairCost));
    Log("RepairItem List Start");
    i = 0;
    J0xd8:
    // End:0x136 [While If]
    if(i < UniqueItemID.Length)
    {
        GameMgr.ChangeInstance_ItemDurability(UniqueItemID[i], 100000);
        GameMgr.ChangeInstance_ItemDamageDegree(UniqueItemID[i], DamageDegree[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd8;
    }
    GameMgr.UpdateItemList(GameMgr);
    Log("RepairItem List End");
    Controller.CloseMenu(false);
    PlayerOwner().PlaySound(Controller.ItemRepairSound, 6, 1.0);
    // End:0x1b5
    if(LastReqRepairMode == 0)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 20);
    }
    // End:0x1d6
    if(LastReqRepairMode == 1)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 71);
    }
    // End:0x1f8
    if(LastReqRepairMode == 2)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 72);
    }
    LastReqRepairMode = 0;
    return true;
}

function bool BTWindowItemSellHK_OnSellOK(GUIComponent Sender)
{
    local export editinline BTWindowItemSellHK BTWindow;

    Log("[BTPageInventory::BTWindowItemSellHK_OnSellOK]");
    BTWindow = BTWindowItemSellHK(Sender);
    page_Main.TcpChannel.sfReqSellShopItem(BTWindow.UniqueID, BTWindow.SelectCount);
    return true;
}

function bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    local BTROItemBoxHK ro;
    local int MyPoint;

    Log("[BTPageInventory::rfAckSellShopItemInfo] Result=" $ string(Result));
    // End:0x63
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemSellHK");
    SellShopItemInfo_UniqueItemID = UniqueItemID;
    ro = TPInventory.TPWeapon.TPItemList.ItemList.FindPoolItem(SellShopItemInfo_UniqueItemID);
    BTWindowItemSellHK(Controller.TopPage()).SetData(UniqueItemID, SellPoint, MM.kPoint, ro.ItemInfo, ro.instanceInfo);
    BTWindowItemSellHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemSellHK_OnSellOK;
    return true;
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    local wMyPlayerStatus MyStatus;
    local wItemBoxInstanceHK instanceInfo;
    local BTROItemBoxHK ro;
    local string ItemName;
    local int selling_price;

    Log("[BTPageInventory::rfAckSellShopItem] Result=" $ string(Result));
    // End:0x6f
    if(Result != 0)
    {
        Controller.CloseMenu(false);
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
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
        // End:0x1e6
        if(ro.instanceInfo.UniqueSkillID == 0)
        {
            GameMgr.RemoveInstanceItem(ro.instanceInfo.UniqueID);
            GameMgr.RemoveQuickSlotItem(ro.instanceInfo.UniqueID);
        }
        // End:0x232
        else
        {
            GameMgr.RemoveInstanceItemByUniqueSkillID(ro.instanceInfo.UniqueSkillID);
            GameMgr.RemoveQuickSlotBoxSkillItem(ro.instanceInfo.UniqueSkillID);
        }
    }
    // End:0x24e
    else
    {
        GameMgr.ChangeInstance_StackCount(SellShopItemInfo_UniqueItemID, Count);
    }
    GameMgr.UpdateItemList(GameMgr);
    Controller.CloseMenu(false);
    PlayerOwner().PlaySound(Controller.ItemSellSound, 6, 1.0);
    Controller.OpenMenu("GUIWarfareControls.BTWindowInfoHK");
    BTWindowInfoHK(Controller.TopPage()).SetData(strSellingSuccess[0], 5, ItemName $ strSellingSuccess[1] @ string(selling_price) $ strSellingSuccess[2]);
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::rfAckModifyWeapon] Result=" $ string(Result));
    Controller.CloseMenu(false);
    // End:0x6f
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    instanceInfo = GameMgr.FindInstanceItem(UniqueID);
    instanceInfo.PartID = AddPartID;
    instanceInfo.PaintID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID);
    MM.kPoint = Point;
    MM.UpdateMoneyInfo(MM);
    PlayerOwner().PlaySound(Controller.ItemAddPartsSound, 6, 1.0);
    RefreshWarehouse(true);
    // End:0x1ce
    if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].UniqueID, instanceInfo.UniqueID))
    {
        TPInventory.CharacterModel.ChangeWeaponsParts(instanceInfo.PartID);
        TPInventory.CharacterModel.ChangeWeaponsPaints(instanceInfo.PaintID);
    }
    return true;
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    local wMyPlayerStatus MyStatus;
    local int i;

    Log("[BTPageInventory::rfAckUpdateQSlot] Result=" $ string(Result));
    // End:0x5e
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return false;
    }
    i = 0;
    J0x65:
    // End:0xf7 [While If]
    if(i < 9)
    {
        BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[i].SetData(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].ItemInfo[i], TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    // End:0x172
    if(TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0] == none)
    {
        TPInventory.CharacterModel.DeleteWeapone();
        TPInventory.CharacterModel.PlayAnim(TPInventory.CharacterModel.NoHaveWeaponIdle, 1.0, 0.20);
    }
    // End:0x225
    else
    {
        self.TPInventory.CharacterModel.ChangeWeapon(self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].ItemID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PartID, self.TPInventory.TPQuickSlot.SaveQS[nCurQuickSlot].instanceInfo[0].PaintID);
    }
    self.TPInventory.TPQuickSlot.ShowWeaponTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[0].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[1].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[2].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[3].itemBox);
    self.TPInventory.TPQuickSlot.ShowSkillTransparent(BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[4].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[5].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[6].itemBox, BTTPInventoryQuickSlotHKCN(TPInventory.TPQuickSlot).ButtonQuickSlot[7].itemBox);
    RefreshSlotNum();
    return true;
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageInventory::rfAckGetItemFromItemBox] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " ItemIDChoose=" $ string(ItemIDChoose) $ " PartIDChoose=" $ string(PartIDChoose));
    // End:0xae
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xd0
    if(BxoItemCount == 0)
    {
        GameMgr.RemoveInstanceItem(BoxItemIdx);
    }
    // End:0xe9
    else
    {
        GameMgr.ChangeInstance_StackCount(BoxItemIdx, BxoItemCount);
    }
    ItemInfo = GameMgr.FindUIItem(ItemIDChoose);
    // End:0x15f
    if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
    {
        GameMgr.AddInstanceItemByParameter(ItemIDChoose, UnresolvedNativeFunction_99(0), UnresolvedNativeFunction_99(ItemIdx), 13, 1, 100000, PartIDChoose, 0, StackCount, 0, UntilTime);
    }
    // End:0x192
    else
    {
        GameMgr.AddInstanceItemByParameter(ItemIDChoose, ItemIdx, 0, 13, 1, 100000, PartIDChoose, 0, StackCount, 0, UntilTime);
    }
    GameMgr.UpdateItemList(GameMgr);
    return true;
}

function RefreshSlotNum()
{
    local int i, j;
    local BTROItemBoxHK ro;

    i = 0;
    J0x07:
    // End:0x83 [While If]
    if(i < TPInventory.TPWeapon.SlotNum.Length)
    {
        TPInventory.TPWeapon.SlotNum[i].SetVisibility(false);
        TPInventory.TPWeapon.SlotNum[i].SetEnabled(false);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    TPInventory.TPWeapon.SlotNum.Length = 0;
    i = 0;
    J0xa4:
    // End:0x25e [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0xcd:
        // End:0x254 [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x163
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0] == none)
            {
            }
            // End:0x24a
            else
            {
                // End:0x24a
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[0].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckMainWeaponItem(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x254
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0xcd;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa4;
    }
    i = 0;
    J0x265:
    // End:0x41f [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x28e:
        // End:0x415 [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x324
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1] == none)
            {
            }
            // End:0x40b
            else
            {
                // End:0x40b
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[1].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckSubWeaponItem(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x415
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x28e;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x265;
    }
    i = 0;
    J0x426:
    // End:0x5e2 [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x44f:
        // End:0x5d8 [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x4e6
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2] == none)
            {
            }
            // End:0x5ce
            else
            {
                // End:0x5ce
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[2].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckThrowingWeapon(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x5d8
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x44f;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x426;
    }
    i = 0;
    J0x5e9:
    // End:0x7a5 [While If]
    if(i < TPInventory.TPQuickSlot.SaveQS.Length)
    {
        j = 0;
        J0x612:
        // End:0x79b [While If]
        if(j < TPInventory.TPWeapon.TPItemList.ItemList.DataPool.Length)
        {
            ro = TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j];
            // End:0x6a9
            if(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3] == none)
            {
            }
            // End:0x791
            else
            {
                // End:0x791
                if(UnresolvedNativeFunction_99(TPInventory.TPQuickSlot.SaveQS[i].instanceInfo[3].UniqueID, ro.instanceInfo.UniqueID) && GameMgr.CheckThrowingWeapon(ro.ItemInfo.ItemType))
                {
                    TPInventory.TPWeapon.TPItemList.ItemList.DataPool[j].bQuickSlot = true;
                    TPInventory.TPWeapon.AddEquipWeaponeSlot(i, ro.instanceInfo.UniqueID);
                }
                // End:0x79b
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x612;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5e9;
    }
}

function bool Internal_KeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    Log("[BTPageCredit::Internal_KeyEvent]");
    iKey = key;
    iAction = Action;
    return true;
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    local BtrDouble blockDoubleTime;
    local BtrTime blockTime;
    local wGameManager GameMgr;
    local string blockMsg;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x103
    if(Result != 0)
    {
        // End:0xe7
        if(Result == 859)
        {
            blockDoubleTime = GameMgr.GetLeftEventTime(1020);
            // End:0x98
            if(blockDoubleTime.dummy_1_DO_NOT_USE != 0 || blockDoubleTime.dummy_2_DO_NOT_USE != 0)
            {
                BtrDoubleToBtrTime(blockDoubleTime, blockTime);
            }
            // End:0xa5
            else
            {
                blockTime.Minute = 10;
            }
            blockMsg = class'BTWindowErrorDefineHK'.static.GetFormatString(859, string(blockTime.Minute));
            class'BTWindowErrorDefineHK'.static.ShowErrorMsg(Controller, blockMsg);
        }
        // End:0x100
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    // End:0x119
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 224);
    }
    return true;
}

defaultproperties
{
    strSellingSuccess[0]="Sale Complete"
    strSellingSuccess[1]=" was sold for "
    strSellingSuccess[2]=" points."
    fbLabelPoint=(X1=517.0,Y1=94.0,X2=644.0,Y2=114.0)
    fbLabelCash=(X1=771.0,Y1=94.0,X2=898.0,Y2=114.0)
    fbLabelCCoinCash=(X1=644.0,Y1=94.0,X2=771.0,Y2=114.0)
    fbRedeemCodesBtn=(X1=900.0,Y1=74.0,X2=1004.0,Y2=96.0)
    strRedeemCodesBtn="Redeem Codes"
    begin object name=mTPInven class=BTTPInventoryHKCN
        bUseAWinPos=true
        AWinPos=(X1=10.0,Y1=88.0,X2=500.0,Y2=736.0)
    object end
    // Reference: BTTPInventoryHKCN'BTPageInventory.mTPInven'
    TPInventory=mTPInven
    fbLabelBackgrounddeco=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    strChargeCash="Buy W Coins"
    strLabelSlot="Quick Slot"
    currentBGM="bgm_lobby_part1"
    bPersistent=true
    OnOpen=InternalOnOpen
    OnClose=InternalOnClose
    OnKeyEvent=Internal_KeyEvent
}