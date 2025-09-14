class BTTPInventoryWeaponHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var() automated ButtonGroups InvenGroup;
var() automated BTStretchedImageHK BackgroundImage;
var() automated FloatBox fbButtonWeapon[11];
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
var export editinline BTAutoScrollListHK ChatBox;
var int SaveMainTab;
var int SaveSubTab;
var localized string strMainMenu[5];
var localized string strSubMenuAll[3];
var localized string strSubMenuWeapon[5];
var localized string strSubMenuEquip[6];
var localized string strSubMenuSpecial[4];
var localized string strSubMenuCash[3];
var array<string> astrSubMenuAll;
var array<string> astrSubMenuWeapon;
var array<string> astrSubMenuEquip;
var array<string> astrSubMenuSpecial;
var array<string> astrSubMenuCash;
var() automated TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[5];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[6];
var() automated FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[7];
var() automated FloatBox fbMenuButton;
var export editinline BTOwnerDrawCaptionButtonHK MenuButton;
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int CurrentRepairMode;
var int EquipItemCount;
var array<BtrDouble> EquipItemList;
var array<BtrDouble> InvenItemList;
var array<string> Equip_DamegeItemNames;
var array<string> Inven_DamegeItemNames;
var localized string strCash;
var array<export editinline BTOwnerDrawImageHK> slotNum;
var export editinline BTOwnerDrawImageHK SlotTemp;
var array<export editinline BTOwnerDrawImageHK> EquipItemSlot;
var export editinline BTOwnerDrawImageHK EquipItemSlotTemp;
var byte MainTabBtnIdx;
var byte SubTabBtnIdx;
var array<export editinline BTOwnerDrawCaptionButtonHK> ItemSubMenuBtn;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLocal;
var export editinline BTWeaponLIst WList;
var bool SendProtocall;
var localized string strSlot;
var localized string strEquipItem[7];
var localized string strEquipMsg;
var int nOldMouseX;
var int nOffsetMouseDis;
var export editinline BTOwnerDrawImageHK LockImage;
//var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;
//var delegate<dele_StopWebzenWebzenInvenList> __dele_StopWebzenWebzenInvenList__Delegate;
//var delegate<dele_sfReqWebzenInvenList> __dele_sfReqWebzenInvenList__Delegate;

delegate deleShowCashChargeWindow()
{
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local int i, nIndex;
    local RenderObject ro;
    local wItemBoxCashHK cii;
    local BTItemListMenuBtn temp;
    local array<BtrDouble> rilist;

    i = 0;
    J0x07:

    // End:0x6D1 [Loop If]
    if(i < TPItemList.ItemList.SubMenuBtn.Length)
    {
        temp = TPItemList.ItemList.SubMenuBtn[i];
        // End:0xEC
        if(temp.ClickBtnIndex == int(temp.0))
        {
            rilist.Length = 1;
            rilist[0] = temp.dbUniqID;
            // End:0xE6
            if(SendProtocall == false)
            {
                SendProtocall = true;
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                CurrentRepairMode = 3;
                TcpChannel.sfReqRepairCost(rilist);
            }
            // [Explicit Break]
            goto J0x6D1;
            // [Explicit Continue]
            goto J0x6C7;
        }
        // End:0x275
        if(temp.ClickBtnIndex == int(temp.1))
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
            nIndex = 0;
            J0x147:

            // End:0x1DC [Loop If]
            if(nIndex < TPItemList.ItemList.DataPool.Length)
            {
                // End:0x1D2
                if(__NFUN_912__(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, temp.dbUniqID))
                {
                    ro = TPItemList.ItemList.DataPool[nIndex];
                    // [Explicit Break]
                    goto J0x1DC;
                }
                nIndex++;
                // [Loop Continue]
                goto J0x147;
            }
            J0x1DC:

            BTWindowModifyHK(Controller.TopPage()).SetData(BTROItemBoxHK(ro).ItemInfo, BTROItemBoxHK(ro).instanceInfo);
            BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x6D1;
            // [Explicit Continue]
            goto J0x6C7;
        }
        // End:0x2C7
        if(temp.ClickBtnIndex == int(temp.3))
        {
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x6D1;
            // [Explicit Continue]
            goto J0x6C7;
        }
        // End:0x460
        if(temp.ClickBtnIndex == int(temp.2))
        {
            nIndex = 0;
            J0x2EE:

            // End:0x45D [Loop If]
            if(nIndex < TPItemList.ItemList.DataPool.Length)
            {
                // End:0x453
                if(__NFUN_912__(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, temp.dbUniqID))
                {
                    ro = TPItemList.ItemList.DataPool[nIndex];
                    // End:0x3F8
                    if(__NFUN_920__(BTROItemBoxHK(ro).instanceInfo.UniqueID, 0) && GameMgr.IsQuickSlotBoxItem(BTROItemBoxHK(ro).instanceInfo.UniqueID))
                    {
                        TcpChannel.sfReqSellShopItemInfo(BTROItemBoxHK(ro).instanceInfo.UniqueID, 1);                        
                    }
                    else
                    {
                        TcpChannel.sfReqSellShopItemInfo(BTROItemBoxHK(ro).instanceInfo.UniqueID, 1);
                    }
                    TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                    // [Explicit Break]
                    goto J0x45D;
                }
                nIndex++;
                // [Loop Continue]
                goto J0x2EE;
            }
            J0x45D:

            // [Explicit Continue]
            goto J0x6C7;
        }
        // End:0x6C7
        if(temp.ClickBtnIndex == int(temp.6))
        {
            nIndex = 0;
            J0x487:

            // End:0x6C7 [Loop If]
            if(nIndex < TPItemList.ItemList.DataPool.Length)
            {
                // End:0x552
                if(GameMgr.CheckSkillItem(TPItemList.ItemList.DataPool[nIndex].ItemInfo.ItemType))
                {
                    // End:0x54F
                    if(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueSkillID == temp.nSkillID)
                    {
                        ro = TPItemList.ItemList.DataPool[nIndex];
                    }                    
                }
                else
                {
                    // End:0x5B8
                    if(__NFUN_912__(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, temp.dbUniqID))
                    {
                        ro = TPItemList.ItemList.DataPool[nIndex];
                    }
                }
                // End:0x6BD
                if(ro != none)
                {
                    // End:0x6BD
                    if((BTROItemBoxHK(ro).ItemInfo.CostType == 4) || BTROItemBoxHK(ro).ItemInfo.CostType == 1)
                    {
                        cii = BTROItemBoxHK(ro).instanceInfo.cashItemInfo;
                        // End:0x67C
                        if(cii != none)
                        {
                            Class'GUIWarfareControls_Decompressed.BTWindowSelectCashTypeHK'.static.ShowWindowSelectCashType(Controller, BTROItemBoxHK(ro), 0);
                            BTWindowSelectCashTypeHK(Controller.TopPage()).__SelectCoin__Delegate = SelectCoin;                            
                        }
                        else
                        {
                            ShowItemRenewWindow(BTROItemBoxHK(ro), 0);
                        }
                        TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                        // [Explicit Break]
                        goto J0x6C7;
                    }
                }
                nIndex++;
                // [Loop Continue]
                goto J0x487;
            }
        }
        J0x6C7:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x6D1:

    return false;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int i, j, k;
    local RenderObject ro;

    CurrentCanvas = C;
    i = 0;
    J0x12:

    // End:0x246 [Loop If]
    if(i < TPItemList.ItemList.DataList.Length)
    {
        ro = TPItemList.ItemList.DataList[i];
        j = 0;
        J0x5E:

        // End:0x12E [Loop If]
        if(j < slotNum.Length)
        {
            // End:0x124
            if(__NFUN_912__(slotNum[j].UniqueID, BTROItemBoxHK(ro).instanceInfo.UniqueID))
            {
                slotNum[j].SetVisibility(ro.bvisibleBtn);
                slotNum[j].SetEnabled(ro.bvisibleBtn);
                slotNum[j].AWinPos = ro.AWinPos;
                slotNum[j].ApplyAWinPos();
            }
            j++;
            // [Loop Continue]
            goto J0x5E;
        }
        k = 0;
        J0x135:

        // End:0x23C [Loop If]
        if(k < EquipItemSlot.Length)
        {
            // End:0x232
            if(__NFUN_912__(EquipItemSlot[k].UniqueID, BTROItemBoxHK(ro).instanceInfo.UniqueID) || EquipItemSlot[k].UniqueSkillID == BTROItemBoxHK(ro).instanceInfo.UniqueSkillID)
            {
                EquipItemSlot[k].SetVisibility(ro.bvisibleBtn);
                EquipItemSlot[k].SetEnabled(ro.bvisibleBtn);
                EquipItemSlot[k].AWinPos = ro.AWinPos;
                EquipItemSlot[k].ApplyAWinPos();
            }
            k++;
            // [Loop Continue]
            goto J0x135;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
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

function ChangeVisibleModel(bool bAF)
{
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
    SubTabBtnIdx = byte(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
    //return;    
}

function bool ImageListBox_OnDblClick(GUIComponent Sender)
{
    return false;
    //return;    
}

function UpdateServerTime(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < 11)
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

    cItemInfo = none;
    cInstanceInfo = none;
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, cInstanceInfo);
    //return;    
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    // End:0x35
    if(TPItemList.ItemList.SelectItemIndex != TPItemList.ItemList.LastSelectedItemIndex)
    {
        return false;
    }
    Controller.FocusedControl.LoseFocus(Sender);
    return false;
    //return;    
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    ChatBox.FocusFirst(none);
    UnequipItem(btn.ButtonID);
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
    local int iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID;
    local export editinline BTWindowModifyHK WinModify;
    local int i;
    local array<int> productsNo;

    WinModify = BTWindowModifyHK(Controller.TopPage());
    // End:0xA5
    if(UseGP20())
    {
        i = 0;
        J0x2A:

        // End:0x61 [Loop If]
        if(i < 5)
        {
            productsNo[productsNo.Length] = WinModify.SelectedProductNo[i];
            ++i;
            // [Loop Continue]
            goto J0x2A;
        }
        TcpChannel.sfReqGP20CashModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID(), productsNo);        
    }
    else
    {
        TcpChannel.sfReqModifyWeapon(WinModify.GetSelectedItemUniqueID(), WinModify.GetSelectedUnionedPartID(), WinModify.GetSelectedPaintingID());
    }
    iSightPartID = WinModify.GetSelectedUnionedPartID() & 1023;
    iBarrelPartID = WinModify.GetSelectedUnionedPartID() & 130048;
    iSilencerPartID = WinModify.GetSelectedUnionedPartID() & 16646144;
    iGunstockPartID = WinModify.GetSelectedUnionedPartID() & 2130706432;
    iBarrelPartID = iBarrelPartID >> 10;
    iSilencerPartID = iSilencerPartID >> 17;
    iGunstockPartID = iGunstockPartID >> 24;
    Controller.ViewportOwner.Actor.clog((((((((("[sfReqModifyWeapon] : " $ string(WinModify.GetSelectedUnionedPartID())) $ " Sight:") $ string(iSightPartID)) $ " Barrel:") $ string(iBarrelPartID)) $ " Silencer:") $ string(iSilencerPartID)) $ " Gunstock:") $ string(iGunstockPartID));
    return true;
    //return;    
}

function bool BTWindowItemRenew_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemRenew BTWindow;
    local wItemBoxHK ib;
    local wItemBoxCashHK cii;
    local array<int> temp;

    BTWindow = BTWindowItemRenew(Controller.TopPage());
    ib = BTWindow.ro.ItemInfo;
    cii = BTWindow.ro.instanceInfo.cashItemInfo;
    // End:0xCF
    if((BTWindow.ro.ItemInfo.CostType == 0) || (cii != none) && cii.bWZCanBuy == false)
    {
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 203);
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x118
    if(MM.kLevel < ib.EquipLevel)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 207);
        return true;
    }
    // End:0x266
    if(BTWindow.ItemInfo.IsCashItem() == true)
    {
        // End:0x199
        if(cii.CheckSaleEnd(GameMgr.kClientTime))
        {
            Controller.CloseMenu(false);
            Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 1000);
            GameMgr.UpdateItemList(GameMgr);
            return true;
        }
        // End:0x263
        if(((int(BTWindow.cashType) == 0) && (MM.kCash - cii.WZCashPrice[int(BTWindow.OptionDay) - 1]) < 0) || (int(BTWindow.cashType) == 1) && (MM.kCCoinCash - cii.WZCashPrice[int(BTWindow.OptionDay) - 1]) < 0)
        {
            Controller.CloseMenu(false);
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 209);
            return true;
        }        
    }
    else
    {
        // End:0x2CF
        if((MM.kPoint - BTWindow.ItemInfo.PointPrice[int(BTWindow.OptionDay) - 1]) < 0)
        {
            Controller.CloseMenu(false);
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 208);
            return true;
        }
    }
    // End:0x4C7
    if(cii != none)
    {
        // End:0x4C4
        if((BTWindow.ItemInfo.CostType == 1) || BTWindow.ItemInfo.CostType == 4)
        {
            GetCashItemInfo(temp, ib, cii);
            // End:0x3E3
            if(UseGP20())
            {
                Log((("sfReqBuyItemByWebzenCashGP20(" $ string(cii.WZPriceSeq[int(BTWindow.OptionDay) - 1])) $ ",") $ string(BTWindow.cashType));
                TcpChannel.sfReqBuyItemByWebzenCashGP20(cii.WZPriceSeq[int(BTWindow.OptionDay) - 1], BTWindow.cashType, BTWindow.UniqueID);                
            }
            else
            {
                Log((((("sfReqBuyItemByWebzenCash(" $ string(cii.WZPackageSeq)) $ ",") $ string(cii.WZCategorySeq)) $ ",") $ string(cii.WZPriceSeq[int(BTWindow.OptionDay) - 1]));
                TcpChannel.sfReqBuyItemByWebzenCash(cii.WZPackageSeq, cii.WZCategorySeq, cii.WZPriceSeq[int(BTWindow.OptionDay) - 1], temp, BTWindow.UniqueID, BTWindow.OptionDay, 2);
            }
        }        
    }
    else
    {
        Log("sfReqBuyShopItem(" $ string(BTWindow.ItemID));
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade, ib.ItemID);
        TcpChannel.sfReqBuyShopItem(BTWindow.ItemID, BTWindow.UniqueID, BTWindow.OptionDay, 2);
    }
    Controller.CloseMenu(false);
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 200, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowItemRenew_OnTimeOut;
    return true;
    //return;    
}

function BTWindowItemRenew_OnTimeOut(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 226);
    //return;    
}

function GetCashItemInfo(out array<int> temp, wItemBoxHK ib, wItemBoxCashHK cii)
{
    temp.Length = 1;
    temp[0] = ib.ItemID;
    MM.SetLastBuyItemInfo(cii.WZItemName, ib.ItemType, ib.Grade, ib.ItemID);
    //return;    
}

function bool BTWindowItemRenew_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    deleShowCashChargeWindow();
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

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ro = InfoBox.ItemBoxView.itemBox;
    // End:0x85
    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID))
    {
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 163, ro.ItemInfo.ItemName);
        return true;
    }
    switch(btn.ButtonID)
    {
        // End:0x15F
        case 0:
            // End:0x135
            if(__NFUN_920__(ro.instanceInfo.UniqueID, 0) && GameMgr.IsQuickSlotBoxItem(ro.instanceInfo.UniqueID))
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 20, ro.ItemInfo.ItemName);
                BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_IsQuickSlotItem;                
            }
            else
            {
                TcpChannel.sfReqSellShopItemInfo(ro.instanceInfo.UniqueID, 1);
            }
            // End:0x7F8
            break;
        // End:0x1F7
        case 1:
            Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
            BTWindowModifyHK(Controller.TopPage()).SetData(ro.ItemInfo, ro.instanceInfo);
            BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
            // End:0x7F8
            break;
        // End:0x7AA
        case 2:
            CurrentRepairMode = 2;
            EquipItemCount = 0;
            EquipItemList.Length = 0;
            InvenItemList.Length = 0;
            Equip_DamegeItemNames.Length = 0;
            Inven_DamegeItemNames.Length = 0;
            i = 0;
            J0x232:

            // End:0x3DB [Loop If]
            if(i < 11)
            {
                ro = ButtonWeapon[i].itemBox;
                // End:0x3D1
                if((ro != none) && (ro.instanceInfo != none) && ro.ItemInfo.CostType == 0)
                {
                    // End:0x3D1
                    if(GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                    {
                        rilist.Length = rilist.Length + 1;
                        rilist[rilist.Length - 1] = ro.instanceInfo.UniqueID;
                        EquipItemList.Length = EquipItemList.Length + 1;
                        EquipItemList[EquipItemList.Length - 1] = ro.instanceInfo.UniqueID;
                        EquipItemCount++;
                        InvenItemList.Length = InvenItemList.Length + 1;
                        InvenItemList[InvenItemList.Length - 1] = ro.instanceInfo.UniqueID;
                        // End:0x3D1
                        if(ro.instanceInfo.DamageDegree >= 80000)
                        {
                            Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ro.ItemName.Text;
                            Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x232;
            }
            i = 0;
            J0x3E2:

            // End:0x5EF [Loop If]
            if(i < GameMgr.QuickSlotBoxList.Length)
            {
                j = 0;
                J0x402:

                // End:0x5E5 [Loop If]
                if(j < 4)
                {
                    UniqueID = GameMgr.QuickSlotBoxList[i].UniqueID[j];
                    // End:0x5DB
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()) && GameMgr.IsBlockedItemIdx(UniqueID) == false)
                    {
                        ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
                        // End:0x4B3
                        if(ItemInfo.CostType != 0)
                        {
                            // [Explicit Continue]
                            goto J0x5DB;
                        }
                        instanceInfo = GameMgr.FindInstanceItem(UniqueID);
                        k = 0;
                        J0x4D4:

                        // End:0x507 [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x4FD
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x507;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x4D4;
                        }
                        J0x507:

                        // End:0x5DB
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            EquipItemList.Length = EquipItemList.Length + 1;
                            EquipItemList[EquipItemList.Length - 1] = UniqueID;
                            EquipItemCount++;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x5DB
                            if(instanceInfo.DamageDegree >= 80000)
                            {
                                Equip_DamegeItemNames[Equip_DamegeItemNames.Length] = ItemInfo.ItemName;
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ItemInfo.ItemName;
                            }
                        }
                    }
                    J0x5DB:

                    j++;
                    // [Loop Continue]
                    goto J0x402;
                }
                i++;
                // [Loop Continue]
                goto J0x3E2;
            }
            i = 0;
            J0x5F6:

            // End:0x793 [Loop If]
            if(i < TPItemList.ItemList.DataPool.Length)
            {
                ro = TPItemList.ItemList.DataPool[i];
                // End:0x789
                if((ro.ItemInfo.CostType == 0) && GameMgr.IsBlockedItemIdx(ro.instanceInfo.UniqueID) == false)
                {
                    UniqueID = ro.instanceInfo.UniqueID;
                    // End:0x789
                    if(__NFUN_913__(UniqueID, EmptyBtrDouble()))
                    {
                        k = 0;
                        J0x6BB:

                        // End:0x6EE [Loop If]
                        if(k < rilist.Length)
                        {
                            // End:0x6E4
                            if(__NFUN_912__(rilist[k], UniqueID))
                            {
                                // [Explicit Break]
                                goto J0x6EE;
                            }
                            k++;
                            // [Loop Continue]
                            goto J0x6BB;
                        }
                        J0x6EE:

                        // End:0x789
                        if(k == rilist.Length)
                        {
                            rilist.Length = rilist.Length + 1;
                            rilist[rilist.Length - 1] = UniqueID;
                            InvenItemList.Length = InvenItemList.Length + 1;
                            InvenItemList[InvenItemList.Length - 1] = UniqueID;
                            // End:0x789
                            if(ro.instanceInfo.DamageDegree >= 80000)
                            {
                                Inven_DamegeItemNames[Inven_DamegeItemNames.Length] = ro.ItemName.Text;
                            }
                        }
                    }
                }
                i++;
                // [Loop Continue]
                goto J0x5F6;
            }
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x7F8
            break;
        // End:0x7F5
        case 3:
            CurrentRepairMode = 3;
            rilist.Length = 1;
            rilist[0] = ro.instanceInfo.UniqueID;
            TcpChannel.sfReqRepairCost(rilist);
            // End:0x7F8
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8C [Loop If]
    if(i < 11)
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
        // End:0x65
        case 1:
            ChangeSubButton(astrSubMenuWeapon);
            // End:0x62
            if(FindComponentIndex(MenuButton) == -1)
            {
                AppendComponent(MenuButton);
            }
            // End:0xF0
            break;
        // End:0x83
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            RemoveComponent(MenuButton);
            // End:0xF0
            break;
        // End:0xA1
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            RemoveComponent(MenuButton);
            // End:0xF0
            break;
        // End:0xBF
        case 4:
            ChangeSubButton(astrSubMenuCash);
            RemoveComponent(MenuButton);
            // End:0xF0
            break;
        // End:0xFFFF
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0xED
            if(FindComponentIndex(MenuButton) == -1)
            {
                AppendComponent(MenuButton);
            }
            // End:0xF0
            break;
            break;
    }
    ChangeItemList(tabi, subtabi, bForce);
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
                TPItemList.ItemList.ShowItemAll();
                // End:0x73
                break;
            // End:0x50
            case 1:
                TPItemList.ItemList.ShowShopItemAll();
                // End:0x73
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowCashItem();
                // End:0x73
                break;
            // End:0xFFFF
            default:
                break;
        }        
    }
    else
    {
        // End:0x12C
        if(mainTab == 1)
        {
            switch(subTab)
            {
                // End:0xA7
                case 0:
                    TPItemList.ItemList.ShowWeaponAll();
                    // End:0x129
                    break;
                // End:0xC6
                case 1:
                    TPItemList.ItemList.ShowMainWeapon();
                    // End:0x129
                    break;
                // End:0xE6
                case 2:
                    TPItemList.ItemList.ShowSubWeapon();
                    // End:0x129
                    break;
                // End:0x106
                case 3:
                    TPItemList.ItemList.ShowHandThrowWeapon();
                    // End:0x129
                    break;
                // End:0x126
                case 4:
                    TPItemList.ItemList.ShowMeleeWeapon();
                    // End:0x129
                    break;
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            // End:0x203
            if(mainTab == 2)
            {
                switch(subTab)
                {
                    // End:0x15E
                    case 0:
                        TPItemList.ItemList.ShowEquipItem();
                        // End:0x200
                        break;
                    // End:0x17D
                    case 1:
                        TPItemList.ItemList.ShowEquipSpCharItem();
                        // End:0x200
                        break;
                    // End:0x19D
                    case 2:
                        TPItemList.ItemList.ShowEquipHeadItem();
                        // End:0x200
                        break;
                    // End:0x1BD
                    case 3:
                        TPItemList.ItemList.ShowEquipFaceItem();
                        // End:0x200
                        break;
                    // End:0x1DD
                    case 4:
                        TPItemList.ItemList.ShowEquipBackPackItem();
                        // End:0x200
                        break;
                    // End:0x1FD
                    case 5:
                        TPItemList.ItemList.ShowDecoItem();
                        // End:0x200
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }                
            }
            else
            {
                // End:0x27A
                if(mainTab == 3)
                {
                    switch(subTab)
                    {
                        // End:0x235
                        case 0:
                            TPItemList.ItemList.ShowSkillAll();
                            // End:0x277
                            break;
                        // End:0x254
                        case 1:
                            TPItemList.ItemList.ShowActiveSkill();
                            // End:0x277
                            break;
                        // End:0x274
                        case 2:
                            TPItemList.ItemList.ShowPassiveSkill();
                            // End:0x277
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }                    
                }
                else
                {
                    // End:0x2EE
                    if(mainTab == 4)
                    {
                        switch(subTab)
                        {
                            // End:0x2AC
                            case 0:
                                TPItemList.ItemList.ShowAllETC();
                                // End:0x2EE
                                break;
                            // End:0x2CB
                            case 1:
                                TPItemList.ItemList.ShowEtc();
                                // End:0x2EE
                                break;
                            // End:0x2EB
                            case 2:
                                TPItemList.ItemList.ShowOnlyModeItem();
                                // End:0x2EE
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
        }
        AddSubMenuBtns();
        SaveMainTab = mainTab;
        SaveSubTab = subTab;
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
    if(i < 6)
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
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowCreateClanMarkHK_OnOK]");
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x229
    if(BTWindow != none)
    {
        // End:0xA3
        if((BTWindow.PaidType == 2) && BTWindow.bCheckDupSuccess == false)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 149);
            return true;
        }
        // End:0x167
        if(BTWindow.PaidType == 1)
        {
            // End:0xFD
            if((BTWindow.SelectClanMark[0] == 0) || BTWindow.SelectClanMark[1] == 0)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 148);
                return true;
            }
            MM.kTcpChannel.sfReqPaidItem_ChangeClanMark(BTWindow.UniqueID, byte(BTWindow.PaidType), BTWindow.SelectClanMark[0], BTWindow.SelectClanMark[1], BTWindow.SelectClanMark[2]);            
        }
        else
        {
            // End:0x229
            if(BTWindow.PaidType == 2)
            {
                // End:0x1C2
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
    local export editinline BTWindowCreateClanMarkHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowCreateClanMarkHK_IsExist_OnOK]");
    BTWindow = BTWindowCreateClanMarkHK(Controller.TopPage());
    // End:0x261
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
        // End:0x142
        if(MM == none)
        {
            Log("MM is None");
        }
        // End:0x170
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
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTTPInventoryWeaponHK::BTWindowDefineARHK_ReceiveCashItem_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x142
    if(BTWindow != none)
    {
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
    local export editinline BTWindowDefineARHK BTWindow;
    local string filter;
    local int temp;

    Log("[BTTPInventoryWeaponHK::BTWindowDefineARHK_ItemUse_OnOK]");
    BTWindow = BTWindowDefineARHK(Controller.TopPage());
    // End:0x999
    if(BTWindow != none)
    {
        Log("PaidItem Use = " $ string(BTWindow.ExtraData_int));
        switch(BTWindow.ExtraData_int)
        {
            // End:0x9E
            case 17004:
            // End:0x1C8
            case 17075:
                // End:0xDD
                if(BTWindow.EditName.TextStr == "")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);                    
                }
                else
                {
                    // End:0x1AF
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
                // End:0x970
                break;
            // End:0x1D0
            case 17005:
            // End:0x2FB
            case 17076:
                // End:0x20F
                if(BTWindow.EditName.TextStr == "")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 147);                    
                }
                else
                {
                    // End:0x2E2
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
                // End:0x970
                break;
            // End:0x376
            case 17012:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 2)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 2);
                // End:0x970
                break;
            // End:0x3F0
            case 17013:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 1)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 1);
                // End:0x970
                break;
            // End:0x46B
            case 17018:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 4)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 4);
                // End:0x970
                break;
            // End:0x4E6
            case 17082:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 5)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 5);
                // End:0x970
                break;
            // End:0x561
            case 17049:
                Log(("MM.kTcpChannel.sfReqPaidItem_EraseRecord(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", 6)");
                MM.kTcpChannel.sfReqPaidItem_EraseRecord(BTWindow.ExtraData_btrdouble, 6);
                // End:0x970
                break;
            // End:0x731
            case 17011:
                // End:0x5AF
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x620
                if((temp == -1) || BTWindow.EditName.TextStr == "none")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;                    
                }
                else
                {
                    // End:0x652
                    if((temp > 16) || temp < 4)
                    {
                        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x68A
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log(((("MM.kTcpChannel.sfReqPaidItem_ChangeCharname(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", ") $ BTWindow.EditName.TextStr) $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeCharname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x970
                break;
            // End:0x901
            case 17017:
                // End:0x77F
                if(GameMgr.ContainsBadNicks(BTWindow.EditName.TextStr, filter))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 101);
                    return true;
                }
                temp = IsCorrectUserName(BTWindow.EditName.TextStr);
                // End:0x7F0
                if((temp == -1) || BTWindow.EditName.TextStr == "none")
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 13);
                    return true;                    
                }
                else
                {
                    // End:0x822
                    if((temp > 16) || temp < 4)
                    {
                        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 14);
                        return true;
                    }
                }
                // End:0x85A
                if(IsInIncompleteLetter(BTWindow.EditName.TextStr))
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 160);
                    return true;
                }
                Log(((("MM.kTcpChannel.sfReqPaidItem_ChangeClanname(" $ __NFUN_918__(BTWindow.ExtraData_btrdouble)) $ ", ") $ BTWindow.EditName.TextStr) $ ")");
                MM.kTcpChannel.sfReqPaidItem_ChangeClanname(BTWindow.ExtraData_btrdouble, BTWindow.EditName.TextStr);
                // End:0x970
                break;
            // End:0x936
            case 17702:
                MM.kTcpChannel.sfReqPuzzleList(1, 0, BTWindow.ExtraData_btrdouble);
                // End:0x970
                break;
            // End:0x96D
            case 17703:
                MM.kTcpChannel.sfReqAttendanceList(1, 0, 0, BTWindow.ExtraData_btrdouble);
                // End:0x970
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

function int GetButtonWeaponID(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xC7 [Loop If]
    if(i < 11)
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

    ib = ButtonWeapon[ButtonID];
    // End:0x10B
    if(ib.itemBox.instanceInfo != none)
    {
        // End:0x9A
        if((ib.itemBox.ItemInfo.ItemID == GameMgr.GetMainWeaponID()) || ib.itemBox.ItemInfo.ItemID == GameMgr.GetSubWeaponID())
        {
            return;
        }
        // End:0xC3
        if(ib.itemBox.instanceInfo.SlotPosition == 0)
        {            
        }
        else
        {
            // End:0xEC
            if(ib.itemBox.instanceInfo.SlotPosition == 1)
            {                
            }
        }
        PlayerOwner().FmodClientPlaySound(Controller.ItemTakeoffSound,,, 6);
    }
    //return;    
}

function fill()
{
    local int i;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;

    TPItemList.ItemList.ClearItem();
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyPoint = MM.kPoint;
    TPItemList.MyData.MyCash = MM.kCash;
    i = 0;
    J0x91:

    // End:0x2A3 [Loop If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        // End:0x299
        if(GameMgr.IsShowInventory(instanceInfo.ItemID))
        {
            ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
            ro.Init();
            ro.ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ro.instanceInfo = instanceInfo;
            // End:0x194
            if((ro.ItemInfo.ItemType == 7) && ro.ItemInfo.ItemID == 9000)
            {
                ro.isShowIcon = false;
            }
            // End:0x1BD
            if(__NFUN_919__(instanceInfo.UniqueID, 0))
            {
                ro.ChangeState(5);                
            }
            else
            {
                ro.ChangeState(3);
            }
            // End:0x228
            if(ro.ItemInfo.IsCashItem() == true)
            {
                GameMgr.AddCashItem(ro.ItemInfo, ro.instanceInfo, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetClientString(122));
            }
            ro.MyData = TPItemList.MyData;
            ro.SetMatchMaker(MM);
            ro.SetGameManager(GameMgr);
            ro.Update();
            TPItemList.ItemList.AddItem(ro);
        }
        i++;
        // [Loop Continue]
        goto J0x91;
    }
    TPItemList.ItemList.ImageList.__OnDblClick__Delegate = ImageListBox_OnDblClick;
    //return;    
}

function Refresh()
{
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    i = 18;
    J0x08:

    // End:0xBE [Loop If]
    if(i < 24)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xB4
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xB4
            if((ItemInfo != none) && int(ItemInfo.byModeItem) == 0)
            {
                ButtonWeapon[(i - 18) + 4].SetData(ItemInfo, instanceInfo);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x08;
    }
    //return;    
}

function InitializeLeftPanel()
{
    //return;    
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;

    TPItemList = new Class'GUIWarfareControls_Decompressed.BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.bNeverFocus = true;
    TPItemList.InitComponent(Controller, self);
    TPItemList.ItemList.bShowSkillToolTip = true;
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShowOnlyInventory = false;
    MenuLen = 5;
    i = 0;
    J0xA8:

    // End:0x279 [Loop If]
    if(i < MenuLen)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 514.0000000 + float(i * 100);
        fb.Y1 = 125.0000000;
        fb.X2 = 613.0000000 + float(i * 100);
        fb.Y2 = 157.0000000;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetMidTabButtonImage();
        serverButton.SetTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        MainButton[i] = serverButton;
        MainButton[i].Caption = strMainMenu[i];
        TabControl[0].BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        i++;
        // [Loop Continue]
        goto J0xA8;
    }
    i = 0;
    J0x280:

    // End:0x4E5 [Loop If]
    if(i < 6)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = 514.0000000 + float(i * 77);
        fb.Y1 = 164.0000000;
        fb.X2 = 590.0000000 + float(i * 77);
        fb.Y2 = 192.0000000;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_n;
        serverButton.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_on;
        serverButton.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        serverButton.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_cli;
        serverButton.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_sub_btn_Focus;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], TPItemList);
        SubButton[i].ButtonID = i;
        SubButton[i].bIsDisableHover = true;
        i++;
        // [Loop Continue]
        goto J0x280;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoHorzBoxHKCN';
    InfoBox.bUseAWinPos = true;
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    MenuButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    MenuButton.Caption = strMenuButton[2];
    MenuButton.bUseAWinPos = true;
    MenuButton.AWinPos = fbMenuButton;
    MenuButton.SetFontSizeAll(9);
    MenuButton.SetDefaultFontColor();
    MenuButton.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Total_fix_btn_n;
    MenuButton.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Total_fix_btn_on;
    MenuButton.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Total_fix_btn_Focus;
    MenuButton.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Total_fix_btn_cli;
    MenuButton.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Inven_Total_fix_btn_on;
    MenuButton.RenderWeight = 0.6000000;
    MenuButton.ButtonID = 2;
    MenuButton.InitComponent(Controller, self);
    // End:0x6C0
    if(FindComponentIndex(MenuButton) == -1)
    {
        AppendComponent(MenuButton);
    }
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x6D0:

    // End:0x701 [Loop If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        i++;
        // [Loop Continue]
        goto J0x6D0;
    }
    astrSubMenuWeapon.Length = 5;
    i = 0;
    J0x711:

    // End:0x742 [Loop If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x711;
    }
    astrSubMenuEquip.Length = 6;
    i = 0;
    J0x752:

    // End:0x783 [Loop If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        i++;
        // [Loop Continue]
        goto J0x752;
    }
    i = 0;
    J0x78A:

    // End:0x7BA [Loop If]
    if(i < (4 - 1))
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        i++;
        // [Loop Continue]
        goto J0x78A;
    }
    astrSubMenuCash.Length = 3;
    i = 0;
    J0x7CA:

    // End:0x7FB [Loop If]
    if(i < astrSubMenuCash.Length)
    {
        astrSubMenuCash[i] = strSubMenuCash[i];
        i++;
        // [Loop Continue]
        goto J0x7CA;
    }
    ChangeSubButton(astrSubMenuAll);
    MenuButton.__OnClick__Delegate = MenuButton_OnClick;
    SaveMainTab = -1;
    SaveSubTab = -1;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    InitializeRightPanel();
    TPItemList.ItemList.SetItemSize(236, int(float(86) * (float(Controller.ResY) / 768.0000000)));
    TPItemList.ItemList.SetItemCountPerPage(4, 2);
    TPItemList.ItemList.ImageList.MyScrollBar.Step = 2;
    TPItemList.ItemList.ImageList.MyScrollBar.ItemsPerPage = 8;
    //return;    
}

function AddEquipWeaponeSlot(int nSlotNum, BtrDouble UniqueID)
{
    SlotTemp = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    SlotTemp.bUseAWinPos = true;
    SlotTemp.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Equip_QS_WP_BG;
    SlotTemp.SetFontSizeAll(12);
    SlotTemp.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
    SlotTemp.InitComponent(Controller, self);
    SlotTemp.RenderWeight = 1.0000000;
    SlotTemp.Caption = strSlot $ string(nSlotNum + 1);
    SlotTemp.CaptionDrawType = 6;
    // End:0x10C
    if((nSlotNum + 1) == 1)
    {
        SlotTemp.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(100, 200, 0, byte(255));
    }
    // End:0x145
    if((nSlotNum + 1) == 2)
    {
        SlotTemp.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(225, 30, 30, byte(255));
    }
    // End:0x17E
    if((nSlotNum + 1) == 3)
    {
        SlotTemp.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(0, 176, 240, byte(255));
    }
    // End:0x1B7
    if((nSlotNum + 1) == 4)
    {
        SlotTemp.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(230, 230, 0, byte(255));
    }
    SlotTemp.CaptionPadding[0] = 5;
    SlotTemp.CaptionPadding[3] = 5;
    SlotTemp.UniqueID = UniqueID;
    AppendComponent(SlotTemp);
    slotNum[slotNum.Length] = SlotTemp;
    //return;    
}

function AddEquipItemSlot(int nItemType, int nTeamIdx, BtrDouble UniqueID)
{
    // End:0x13
    if((CheckEquipItem(nItemType)) == false)
    {
        return;
    }
    EquipItemSlotTemp = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    EquipItemSlotTemp.bUseAWinPos = true;
    EquipItemSlotTemp.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Equip_QS_WP_BG;
    EquipItemSlotTemp.SetFontSizeAll(12);
    EquipItemSlotTemp.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
    EquipItemSlotTemp.InitComponent(Controller, self);
    EquipItemSlotTemp.RenderWeight = 1.0000000;
    EquipItemSlotTemp.CaptionDrawType = 6;
    EquipItemSlotTemp.CaptionPadding[0] = 5;
    EquipItemSlotTemp.CaptionPadding[3] = 5;
    EquipItemSlotTemp.UniqueID = UniqueID;
    // End:0x124
    if(nItemType == 8)
    {
        EquipItemSlotTemp.Caption = strEquipItem[0];
    }
    // End:0x146
    if(nItemType == 9)
    {
        EquipItemSlotTemp.Caption = strEquipItem[1];
    }
    // End:0x1AB
    if((nItemType == 11) || nItemType == 36)
    {
        // End:0x185
        if(nTeamIdx == 1)
        {
            EquipItemSlotTemp.Caption = strEquipItem[2];            
        }
        else
        {
            // End:0x1A8
            if(nTeamIdx == 2)
            {
                EquipItemSlotTemp.Caption = strEquipItem[3];
            }
        }        
    }
    else
    {
        // End:0x1D1
        if(nItemType == 14)
        {
            EquipItemSlotTemp.Caption = strEquipItem[4];            
        }
        else
        {
            // End:0x1F7
            if(nItemType == 34)
            {
                EquipItemSlotTemp.Caption = strEquipItem[5];                
            }
            else
            {
                // End:0x21A
                if(nItemType == 35)
                {
                    EquipItemSlotTemp.Caption = strEquipItem[6];
                }
            }
        }
    }
    AppendComponent(EquipItemSlotTemp);
    EquipItemSlot[EquipItemSlot.Length] = EquipItemSlotTemp;
    //return;    
}

function AddEquipModeItemSlot(bool bSkillItem, BtrDouble UniqueID, int UniqueSkillID)
{
    EquipItemSlotTemp = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    EquipItemSlotTemp.bUseAWinPos = true;
    EquipItemSlotTemp.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Equip_QS_WP_BG;
    EquipItemSlotTemp.SetFontSizeAll(12);
    EquipItemSlotTemp.FontColor[0] = Class'Engine.Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
    EquipItemSlotTemp.InitComponent(Controller, self);
    EquipItemSlotTemp.RenderWeight = 1.0000000;
    EquipItemSlotTemp.CaptionDrawType = 6;
    EquipItemSlotTemp.CaptionPadding[0] = 5;
    EquipItemSlotTemp.CaptionPadding[3] = 5;
    // End:0x115
    if(bSkillItem == true)
    {
        EquipItemSlotTemp.UniqueSkillID = UniqueSkillID;
        EquipItemSlotTemp.UniqueID = __NFUN_921__(UniqueSkillID);        
    }
    else
    {
        EquipItemSlotTemp.UniqueID = UniqueID;
    }
    EquipItemSlotTemp.Caption = strEquipMsg;
    AppendComponent(EquipItemSlotTemp);
    EquipItemSlot[EquipItemSlot.Length] = EquipItemSlotTemp;
    //return;    
}

function AddSubMenuBtns()
{
    local int i;
    local BTROItemBoxHK ro;
    local BTItemListMenuBtn temp;
    local int iItemType;
    local bool isWeapon;

    temp = new Class'GUIWarfareControls_Decompressed.BTItemListMenuBtn';
    TPItemList.ItemList.SubMenuBtn.Length = 0;
    i = 0;
    J0x30:

    // End:0x5C6 [Loop If]
    if(i < TPItemList.ItemList.DataList.Length)
    {
        ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i]);
        iItemType = GameMgr.GetItemType(ro.ItemInfo, ro.instanceInfo);
        TPItemList.ItemList.isHaveSubMenuBtn = true;
        isWeapon = GameMgr.CheckWeaponItem(ro.ItemInfo.ItemType);
        // End:0x1C9
        if(bool(iItemType & GameMgr.FlagPCBang) == true)
        {
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.10), true);
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.10), true);
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.10), true);
            // [Explicit Continue]
            goto J0x5BC;
        }
        // End:0x353
        if(isWeapon)
        {
            // End:0x25D
            if(bool(iItemType & GameMgr.FlagDurability) == true)
            {
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.0), false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);                
            }
            else
            {
                // End:0x2E5
                if(bool(iItemType & GameMgr.FlagRenew))
                {
                    TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.6), false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);                    
                }
                else
                {
                    TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.0), true, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
                }
            }            
        }
        else
        {
            // End:0x3DB
            if(bool(iItemType & GameMgr.FlagRenew))
            {
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.6), false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);                
            }
            else
            {
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.10), true, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
            }
        }
        // End:0x4CE
        if(bool(iItemType & GameMgr.FlagModify))
        {
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.1), false, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);            
        }
        else
        {
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.10), true, ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
        }
        TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, int(temp.2), !bool(iItemType & GameMgr.FlagSellShop), ro.instanceInfo.UniqueID, ro.instanceInfo.UniqueSkillID);
        J0x5BC:

        i++;
        // [Loop Continue]
        goto J0x30;
    }
    //return;    
}

function bool CheckEquipItem(int nItemType)
{
    // End:0x62
    if(((((((nItemType == 8) || nItemType == 9) || nItemType == 11) || nItemType == 36) || nItemType == 14) || nItemType == 34) || nItemType == 35)
    {
        return true;
    }
    return false;
    //return;    
}

function bool Repair_OnClick(GUIComponent Sender)
{
    local array<BtrDouble> rilist;
    local BTROItemBoxHK ro;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int nIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    nIndex = 0;
    J0x17:

    // End:0xAC [Loop If]
    if(nIndex < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xA2
        if(__NFUN_912__(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, btn.dbUniqID))
        {
            ro = TPItemList.ItemList.DataPool[nIndex];
            // [Explicit Break]
            goto J0xAC;
        }
        nIndex++;
        // [Loop Continue]
        goto J0x17;
    }
    J0xAC:

    rilist.Length = 1;
    rilist[0] = ro.instanceInfo.UniqueID;
    TcpChannel.sfReqRepairCost(rilist);
    return true;
    //return;    
}

function bool Modify_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local BTROItemBoxHK ro;
    local int nIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
    nIndex = 0;
    J0x4B:

    // End:0xE0 [Loop If]
    if(nIndex < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xD6
        if(__NFUN_912__(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, btn.dbUniqID))
        {
            ro = TPItemList.ItemList.DataPool[nIndex];
            // [Explicit Break]
            goto J0xE0;
        }
        nIndex++;
        // [Loop Continue]
        goto J0x4B;
    }
    J0xE0:

    BTWindowModifyHK(Controller.TopPage()).SetData(ro.ItemInfo, ro.instanceInfo);
    BTWindowModifyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowModifyHK_OnOK;
    return true;
    //return;    
}

function bool Sell_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local BTROItemBoxHK ro;
    local int nIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Controller.OpenMenu("GUIWarfareControls.BTWindowModifyHK");
    nIndex = 0;
    J0x4B:

    // End:0xE0 [Loop If]
    if(nIndex < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xD6
        if(__NFUN_912__(TPItemList.ItemList.DataPool[nIndex].instanceInfo.UniqueID, btn.dbUniqID))
        {
            ro = TPItemList.ItemList.DataPool[nIndex];
            // [Explicit Break]
            goto J0xE0;
        }
        nIndex++;
        // [Loop Continue]
        goto J0x4B;
    }
    J0xE0:

    return true;
    //return;    
}

function bool SubButton_OnHover(GUIComponent Sender)
{
    local int mainTab, subTab;

    mainTab = TabControl[0].GetCurrentTabIndex();
    subTab = BTOwnerDrawCaptionButtonHK(Sender).ButtonID;
    // End:0x5B
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0x49
            case 0:
                // End:0x5B
                break;
            // End:0x50
            case 1:
                // End:0x5B
                break;
            // End:0x58
            case 2:
                // End:0x5B
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        return true;
        //return;        
    }
}

function SelectCoin(int buyType, int cashType, BTROItemBoxHK ro)
{
    ShowItemRenewWindow(ro, byte(cashType));
    //return;    
}

function bool ShowItemRenewWindow(BTROItemBoxHK ro, byte cashType)
{
    // End:0x9A
    if(((ro.instanceInfo != none) && ro.instanceInfo.cashItemInfo != none) && ro.instanceInfo.cashItemInfo.CheckSaleEnd(GameMgr.kClientTime))
    {
        Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 1000);
        GameMgr.UpdateItemList(GameMgr);
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemRenew");
    BTWindowItemRenew(Controller.TopPage()).SetCashType(cashType);
    BTWindowItemRenew(Controller.TopPage()).SetRenderObject(ro, ro.ItemInfo, ro.instanceInfo, ro.instanceInfo.cashItemInfo);
    BTWindowItemRenew(Controller.TopPage()).SetMoney(MM.kPoint, MM.kCash, MM.kCCoinCash);
    BTWindowItemRenew(Controller.TopPage()).__OnOK__Delegate = BTWindowItemRenew_OnOK;
    BTWindowItemRenew(Controller.TopPage()).btButtonCash.__OnClick__Delegate = BTWindowItemRenew_ButtonRechargeCash_OnOK;
    return true;
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
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=326.0000000,Y1=137.0000000,X2=482.0000000,Y2=216.0000000)
    fbButtonWeapon[1]=(X1=326.0000000,Y1=222.0000000,X2=402.0000000,Y2=304.0000000)
    fbButtonWeapon[2]=(X1=337.0000000,Y1=291.0000000,X2=413.0000000,Y2=376.0000000)
    fbButtonWeapon[3]=(X1=415.0000000,Y1=291.0000000,X2=493.0000000,Y2=376.0000000)
    fbButtonWeapon[4]=(X1=227.0000000,Y1=138.0000000,X2=303.0000000,Y2=223.0000000)
    fbButtonWeapon[5]=(X1=227.0000000,Y1=227.0000000,X2=303.0000000,Y2=312.0000000)
    fbButtonWeapon[6]=(X1=227.0000000,Y1=405.0000000,X2=303.0000000,Y2=490.0000000)
    fbButtonWeapon[7]=(X1=28.0000000,Y1=642.0000000,X2=104.0000000,Y2=727.0000000)
    fbButtonWeapon[8]=(X1=108.0000000,Y1=642.0000000,X2=184.0000000,Y2=727.0000000)
    fbButtonWeapon[9]=(X1=227.0000000,Y1=642.0000000,X2=303.0000000,Y2=727.0000000)
    fbButtonWeapon[10]=(X1=227.0000000,Y1=316.0000000,X2=303.0000000,Y2=401.0000000)
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
    strSubMenuWeapon[4]="Melee"
    strSubMenuEquip[0]="All"
    strSubMenuEquip[1]="Characters"
    strSubMenuEquip[2]="Helmets"
    strSubMenuEquip[3]="Faces"
    strSubMenuEquip[4]="Backpack"
    strSubMenuEquip[5]="Adornment"
    strSubMenuSpecial[0]="All"
    strSubMenuSpecial[1]="Active"
    strSubMenuSpecial[2]="Passive"
    strSubMenuCash[0]="All"
    strSubMenuCash[1]="Other"
    strSubMenuCash[2]="Mode"
    // Referen[0]ce: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPInventoryWeaponHK.mTabControl2'
    begin object name="mTabControl2" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0000000,Y1=137.0000000,X2=1014.0000000,Y2=558.0000000)
    fbTPItemList=(X1=515.0000000,Y1=194.0000000,X2=1013.0000000,Y2=544.0000000)
    strMenuButton[0]="Sell"
    strMenuButton[1]="Modify"
    strMenuButton[2]="Repair All"
    strMenuButton[3]="Repair"
    strMenuButton[4]="Equip"
    strMenuButton[5]="Used"
    strMenuButton[6]="Cancel"
    fbMenuButton=(X1=908.0000000,Y1=164.0000000,X2=1012.0000000,Y2=192.0000000)
    strCash="Cash"
    strSlot="Slot"
    strEquipItem[0]="Helmet"
    strEquipItem[1]="Face"
    strEquipItem[2]="AF Character"
    strEquipItem[3]="RSA Character"
    strEquipItem[4]="Backpack"
    strEquipItem[5]="Pouch"
    strEquipItem[6]="Camoflauge Pattern"
    strEquipMsg="Equip"
    OnPreDraw=BTTPInventoryWeaponHK.Internal_OnPreDraw
    OnRendered=BTTPInventoryWeaponHK.Internal_OnRendered
}