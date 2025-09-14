class BTTPStoreWeaponHKCN extends BTTPStoreWeaponHK
    editinlinenew
    instanced;

function bool Internal_OnPreDraw(Canvas C)
{
    local int i, nIndex;
    local BTItemListMenuBtn temp;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local BTROItemBoxHK ro;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    ChangeVisibleModel(bVisibleAFModel);
    UIModel.cModel = CharacterModel;
    // End:0x3B
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x53
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    i = 0;
    J0x5A:

    // End:0x3FD [Loop If]
    if(i < TPItemList.ItemList.SubMenuBtn.Length)
    {
        temp = TPItemList.ItemList.SubMenuBtn[i];
        // End:0xE5
        if(temp.ClickBtnIndex == 0)
        {
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x3FD;
            // [Explicit Continue]
            goto J0x3F3;
        }
        // End:0x1B9
        if(temp.ClickBtnIndex == 5)
        {
            ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i / 3]);
            // End:0x17C
            if((CheckValidItem(ro.ItemInfo, ro.instanceInfo)) == false)
            {
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                return false;
            }
            ShowSaveWindow(ro);
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x3FD;
            // [Explicit Continue]
            goto J0x3F3;
        }
        // End:0x3F3
        if(temp.ClickBtnIndex == 2)
        {
            ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i / 3]);
            // End:0x250
            if((CheckValidItem(ro.ItemInfo, ro.instanceInfo)) == false)
            {
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                return false;
            }
            Controller.OpenMenu("GUIWarfareControls.BTWindowItemBuyHK");
            BTWindowItemBuyHK(Controller.TopPage()).SetData(ro.ItemInfo.ItemID, ro.MyData.MyPoint, ro.MyData.MyCash, ro.ItemInfo);
            BTWindowItemBuyHK(Controller.TopPage()).SetRenderObject(ro);
            BTWindowItemBuyHK(Controller.TopPage()).TopLine.Caption = strForGift[0];
            BTWindowItemBuyHK(Controller.TopPage()).ButtonOK.Caption = strForGift[1];
            BTWindowItemBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyHK_BeforePresent_OnOK;
            BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            // [Explicit Break]
            goto J0x3FD;
        }
        J0x3F3:

        i++;
        // [Loop Continue]
        goto J0x5A;
    }
    J0x3FD:

    // End:0x4B0
    if((Controller.MouseX >= fbTPItemList.X1) && Controller.MouseY >= fbTPItemList.Y1)
    {
        // End:0x4AD
        if((Controller.MouseX <= fbTPItemList.X2) && Controller.MouseY <= fbTPItemList.Y2)
        {
            TPItemList.ItemList.ImageList.SetFocus(TPItemList.ItemList.ImageList);
        }        
    }
    else
    {
        TPItemList.ItemList.ImageList.LoseFocus(TPItemList.ItemList.ImageList);
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
    CharacterModel.ChangeTeam(0);
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA.bSelect = false;
    ButtonRSA.bSelectHighlight = false;
    return true;
    //return;    
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    CharacterModel.ChangeTeam(1);
    ButtonAF.bSelect = false;
    ButtonAF.bSelectHighlight = false;
    ButtonRSA.bSelect = true;
    ButtonRSA.bSelectHighlight = true;
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
    // End:0x67
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseOn == true)
    {
        self.ImageListBox_OnClick(Sender);
        self.MenuButton_OnClick(self.MenuButton[2]);
    }
    return false;
    //return;    
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local int HelmetID[2], BodyID, FaceID, AcceID;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wPartsGroupParam tmParam;

    // End:0x41
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseOn == false)
    {
        return false;
    }
    // End:0x82
    if(TPItemList.ItemList.DataList[TPItemList.ItemList.SelectItemIndex].bMouseClick == false)
    {
        return false;
    }
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    // End:0x105
    if(ItemInfo == none)
    {
        return false;
    }
    cItemInfo = none;
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, none);
    // End:0x172
    if((instanceInfo != none) && instanceInfo.CashItemInfo != none)
    {
        InfoBox.ItemBoxView.itemBox.ChangeState(17);        
    }
    else
    {
        InfoBox.ItemBoxView.itemBox.ChangeState(7);
    }
    HelmetID[0] = CharacterModel.HelmetID[0];
    HelmetID[1] = CharacterModel.HelmetID[1];
    BodyID[0] = CharacterModel.BodyID[0];
    BodyID[1] = CharacterModel.BodyID[1];
    FaceID[0] = CharacterModel.FaceID[0];
    FaceID[1] = CharacterModel.FaceID[1];
    AcceID[0] = CharacterModel.AccessoryID[0];
    AcceID[1] = CharacterModel.AccessoryID[1];
    // End:0x2B8
    if(((ItemInfo.ItemType <= 2) || ItemInfo.ItemType == 32) || ItemInfo.ItemType == 33)
    {
        CharacterModel.ChangeWeapon(ItemInfo.ItemID);        
    }
    else
    {
        // End:0x37B
        if(ItemInfo.ItemType == 5)
        {
            // End:0x2FF
            if(BodyID[0] == CharacterModel.default.BodyID[0])
            {
                HelmetID[0] = ItemInfo.ItemID;
            }
            // End:0x331
            if(BodyID[1] == CharacterModel.default.BodyID[1])
            {
                HelmetID[1] = ItemInfo.ItemID;
            }
            CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);            
        }
        else
        {
            // End:0x43E
            if(ItemInfo.ItemType == 6)
            {
                // End:0x3C2
                if(BodyID[0] == CharacterModel.default.BodyID[0])
                {
                    FaceID[0] = ItemInfo.ItemID;
                }
                // End:0x3F4
                if(BodyID[1] == CharacterModel.default.BodyID[1])
                {
                    FaceID[1] = ItemInfo.ItemID;
                }
                CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);                
            }
            else
            {
                // End:0x501
                if(ItemInfo.ItemType == 7)
                {
                    // End:0x485
                    if(BodyID[0] == CharacterModel.default.BodyID[0])
                    {
                        AcceID[0] = ItemInfo.ItemID;
                    }
                    // End:0x4B7
                    if(BodyID[1] == CharacterModel.default.BodyID[1])
                    {
                        AcceID[1] = ItemInfo.ItemID;
                    }
                    CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);                    
                }
                else
                {
                    // End:0x6B9
                    if(ItemInfo.ItemType == 8)
                    {
                        // End:0x5C5
                        if(ItemInfo.EquipTeam == 1)
                        {
                            BodyID[0] = ItemInfo.ItemID;
                            tmParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID[0]);
                            FaceID[0] = tmParam.iChar_FaceID;
                            HelmetID[0] = tmParam.iChar_HeadID;
                            AcceID[0] = tmParam.iChar_AccessoryID;                            
                        }
                        else
                        {
                            // End:0x672
                            if(ItemInfo.EquipTeam == 2)
                            {
                                BodyID[1] = ItemInfo.ItemID;
                                tmParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID[1]);
                                FaceID[1] = tmParam.iChar_FaceID;
                                HelmetID[1] = tmParam.iChar_HeadID;
                                AcceID[1] = tmParam.iChar_AccessoryID;
                            }
                        }
                        CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
                    }
                }
            }
        }
    }
    return false;
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
    // End:0x5F
    if(Sender.Class == Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK')
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
    // End:0xC4
    if(((btn.bDropSource == true) && DragBox.IsDragging() == false) && btn.itemBox.ItemInfo != none)
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), btn.itemBox, btn.ButtonID);
        return true;
    }
    return false;
    //return;    
}

function ButtonWeapon_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ButtonWeapon_OnEndDrag" @ string(Sender));
    // End:0x3E
    if(Sender.Class == Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK')
    {        
    }
    else
    {
        // End:0x5E
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
    InfoBox.SetData(ButtonWeapon[btn.ButtonID].itemBox.ItemInfo, ButtonWeapon[btn.ButtonID].itemBox.instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
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

function bool BTWindowSendPresentHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowSendPresentHK BTWindow;
    local wItemBoxCashHK cii;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    Log("[BTTPStoreWeaponHK::BTWindowSendPresentHK_OnOK]");
    BTWindow = BTWindowSendPresentHK(Controller.TopPage());
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    BTWindow.ButtonOK.DisableMe();
    // End:0x283
    if(cii != none)
    {
        // End:0x143
        if(int(MM.kChannelingType) != 0)
        {
            BTWindow.StopTimeOut();
            BTWindow.ButtonOK.DisableMe();
            BTWindow.ButtonCancel.DisableMe();
            BTWindow.StartTimeOut(10.0000000);
            BTWindow.__OnTimeOut__Delegate = BTWindowSendPresentHK_OnTimeOut;
        }
        Log(((((((((("TcpChannel.sfReqGiftItemByWebzenCash(" $ BTWindow.EditReceiveUser.TextStr) $ ", ") $ BTWindow.EditContent.TextStr) $ ", ") $ string(cii.WZPackageSeq)) $ ", ") $ string(cii.WZPriceSeq[BTWindow.BuyOpt[0] - 1])) $ ", ") $ string(cii.WZCategorySeq)) $ ")");
        TcpChannel.sfReqGiftItemByWebzenCash(BTWindow.EditReceiveUser.TextStr, BTWindow.EditContent.TextStr, cii.WZPackageSeq, cii.WZPriceSeq[BTWindow.BuyOpt[0] - 1], cii.WZCategorySeq);        
    }
    else
    {
        Log(((((((((("TcpChannel.sfReqSendGift(" $ string(BTWindow.ItemID)) $ ", ") $ BTWindow.EditReceiveUser.TextStr) $ ", ") $ BTWindow.EditContent.TextStr) $ ", ") $ string(BTWindow.BuyOpt[0])) $ ", ") $ string(BTWindow.BuyOpt[0])) $ ")");
        TcpChannel.sfReqSendGift(BTWindow.ItemID, BTWindow.EditReceiveUser.TextStr, BTWindow.EditContent.TextStr, byte(BTWindow.BuyOpt[0]), byte(BTWindow.BuyOpt[0]));
    }
    return true;
    //return;    
}

function bool BTWindowItemBuyHK_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    deleShowCashChargeWindow();
    //return;    
}

function bool BTWindowItemBuyHK_BeforePresent_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBuyHK BTWindow;
    local int Arg[3];
    local BTROItemBoxHK ro;

    BTWindow = BTWindowItemBuyHK(Controller.TopPage());
    Arg[0] = BTWindow.ItemID;
    Arg[1] = BTWindow.OptionDay;
    Arg[2] = 0;
    ro = BTWindow.ro;
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowSendPresentHK");
    BTWindowSendPresentHK(Controller.TopPage()).SetData(Arg[0], Arg[1], Arg[2]);
    BTWindowSendPresentHK(Controller.TopPage()).SetRenderObject(ro);
    BTWindowSendPresentHK(Controller.TopPage()).__OnOK__Delegate = BTWindowSendPresentHK_OnOK;
    return true;
    //return;    
}

function bool BTWindowItemBuyHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBuyHK BTWindow;
    local wItemBoxHK ib;
    local wItemBoxCashHK cii;
    local array<int> temp;
    local wMatchMaker MM;
    local wGameManager gm;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    BTWindow = BTWindowItemBuyHK(Controller.TopPage());
    ib = BTWindow.ro.ItemInfo;
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    // End:0x105
    if(MM.kLevel < ib.EquipLevel)
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
        return true;
    }
    // End:0x18D
    if(BTWindow.ItemInfo.IsCashItem() == true)
    {
        // End:0x18A
        if((MM.kCash - cii.WZCashPrice[BTWindow.OptionDay - 1]) < 0)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 205);
            Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK');
            return true;
        }        
    }
    else
    {
        // End:0x1FD
        if((MM.kPoint - BTWindow.ItemInfo.PointPrice[BTWindow.OptionDay - 1]) < 0)
        {
            Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 204);
            Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK');
            return true;
        }
    }
    // End:0x2F4
    if(BTWindow.ItemInfo.CostType == 4)
    {
        // End:0x2F4
        if(gm.FindFirstInstanceItemByItemID(BTWindow.ItemID) != none)
        {
            Controller.ReplaceMenu2("GUIWarfareControls.BTWindowItemBuyTerm");
            BTWindowItemBuyTerm(Controller.TopPage()).SetRenderObject(BTWindow.ro);
            BTWindowItemBuyTerm(Controller.TopPage()).SetOptionDay(byte(BTWindow.OptionDay));
            BTWindowItemBuyTerm(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyTerm_OnOK;
            return true;
        }
    }
    // End:0x3EC
    if(cii != none)
    {
        GetCashItemInfo(temp, ib, cii);
        Log((((("sfReqBuyItemByWebzenCash(" $ string(cii.WZPackageSeq)) $ ",") $ string(cii.WZCategorySeq)) $ ",") $ string(cii.WZPriceSeq[BTWindow.OptionDay - 1]));
        TcpChannel.sfReqBuyItemByWebzenCash(cii.WZPackageSeq, cii.WZCategorySeq, cii.WZPriceSeq[BTWindow.OptionDay - 1], temp, __NFUN_921__(0), byte(BTWindow.OptionDay), 1);        
    }
    else
    {
        Log((("sfReqBuyShopItem(" $ string(BTWindow.ItemID)) $ " ") $ BTWindow.ItemInfo.ItemName);
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade);
        TcpChannel.sfReqBuyShopItem(BTWindow.ItemID, __NFUN_921__(0), byte(BTWindow.OptionDay), 0);
    }
    Controller.CloseMenu(false);
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowItemBuyHK_OnTimeOut;
    return true;
    //return;    
}

function BTWindowItemBuyHK_OnTimeOut(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    Class'GUIWarfareControls_Decompressed.BTWindowErrorDefineHK'.static.ShowError(Controller, 194);
    //return;    
}

function BTWindowSendPresentHK_OnTimeOut(GUIComponent Sender)
{
    Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowSendPresentHK');
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 183);
    //return;    
}

function bool ShowSaveWindow(BTROItemBoxHK ro)
{
    local wMatchMaker MM;

    // End:0x0D
    if(ro == none)
    {
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemBuyHK");
    BTWindowItemBuyHK(Controller.TopPage()).SetData(ro.ItemInfo.ItemID, ro.MyData.MyPoint, ro.MyData.MyCash, ro.ItemInfo);
    BTWindowItemBuyHK(Controller.TopPage()).SetRenderObject(ro);
    BTWindowItemBuyHK(Controller.TopPage()).TopLine.Caption = strForMe[0];
    BTWindowItemBuyHK(Controller.TopPage()).ButtonOK.Caption = strForMe[1];
    BTWindowItemBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyHK_OnOK;
    BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
    return true;
    //return;    
}

function bool MenuButton_OnClick(GUIComponent Sender)
{
    local BTROItemBoxHK ro;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wMatchMaker MM;

    switch(btn.ButtonID)
    {
        // End:0x21
        case 0:
            deleShowCashChargeWindow();
            // End:0x36A
            break;
        // End:0x19C
        case 1:
            Controller.OpenMenu("GUIWarfareControls.BTWindowItemBuyHK");
            BTWindowItemBuyHK(Controller.TopPage()).SetData(ro.ItemInfo.ItemID, ro.MyData.MyPoint, ro.MyData.MyCash, ro.ItemInfo);
            BTWindowItemBuyHK(Controller.TopPage()).SetRenderObject(ro);
            BTWindowItemBuyHK(Controller.TopPage()).TopLine.Caption = strForGift[0];
            BTWindowItemBuyHK(Controller.TopPage()).ButtonOK.Caption = strForGift[1];
            BTWindowItemBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyHK_BeforePresent_OnOK;
            BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
            // End:0x36A
            break;
        // End:0x367
        case 2:
            // End:0x1E3
            if(MM.kLevel < ro.ItemInfo.EquipLevel)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
                return true;
            }
            // End:0x1F0
            if(ro == none)
            {
                return true;
            }
            Controller.OpenMenu("GUIWarfareControls.BTWindowItemBuyHK");
            BTWindowItemBuyHK(Controller.TopPage()).SetData(ro.ItemInfo.ItemID, ro.MyData.MyPoint, ro.MyData.MyCash, ro.ItemInfo);
            BTWindowItemBuyHK(Controller.TopPage()).SetRenderObject(ro);
            BTWindowItemBuyHK(Controller.TopPage()).TopLine.Caption = strForMe[0];
            BTWindowItemBuyHK(Controller.TopPage()).ButtonOK.Caption = strForMe[1];
            BTWindowItemBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyHK_OnOK;
            BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
            // End:0x36A
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
    if(i < 9)
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

function MainTabSelect(int tabi, optional int subtabi)
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
            ChangeSubButton(astrSubMenuCashItem);
            // End:0x8F
            break;
        // End:0xFFFF
        default:
            ChangeSubButton(astrSubMenuNewAndHot);
            // End:0x8F
            break;
            break;
    }
    ChangeItemList(tabi, subtabi);
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
    //return;    
}

function ChangeItemList(int mainTab, int subTab)
{
    // End:0x96
    if(mainTab == 0)
    {
        switch(subTab)
        {
            // End:0x31
            case 0:
                TPItemList.ItemList.ShowShopItemAll();
                // End:0x93
                break;
            // End:0x50
            case 1:
                TPItemList.ItemList.ShowShopItemAdBest();
                // End:0x93
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowShopItemAdNew();
                // End:0x93
                break;
            // End:0x90
            case 3:
                TPItemList.ItemList.ShowShopItemAdHot();
                // End:0x93
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
                // End:0xC7
                case 0:
                    TPItemList.ItemList.ShowWeaponAll();
                    // End:0x129
                    break;
                // End:0xE6
                case 1:
                    TPItemList.ItemList.ShowMainWeapon();
                    // End:0x129
                    break;
                // End:0x106
                case 2:
                    TPItemList.ItemList.ShowSubWeapon();
                    // End:0x129
                    break;
                // End:0x126
                case 3:
                    TPItemList.ItemList.ShowHandThrowWeapon();
                    // End:0x129
                    break;
                // End:0xFFFF
                default:
                    break;
            }            
        }
        else
        {
            // End:0x1E3
            if(mainTab == 2)
            {
                switch(subTab)
                {
                    // End:0x15E
                    case 0:
                        TPItemList.ItemList.ShowEquipItem();
                        // End:0x1E0
                        break;
                    // End:0x17D
                    case 1:
                        TPItemList.ItemList.ShowEquipHeadItem();
                        // End:0x1E0
                        break;
                    // End:0x19D
                    case 2:
                        TPItemList.ItemList.ShowEquipFaceItem();
                        // End:0x1E0
                        break;
                    // End:0x1BD
                    case 3:
                        TPItemList.ItemList.ShowEquipAccessoryItem();
                        // End:0x1E0
                        break;
                    // End:0x1DD
                    case 4:
                        TPItemList.ItemList.ShowEquipSpCharItem();
                        // End:0x1E0
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
                        // End:0x215
                        case 0:
                            TPItemList.ItemList.ShowSkillAll();
                            // End:0x257
                            break;
                        // End:0x234
                        case 1:
                            TPItemList.ItemList.ShowActiveSkill();
                            // End:0x257
                            break;
                        // End:0x254
                        case 2:
                            TPItemList.ItemList.ShowPassiveSkill();
                            // End:0x257
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }                    
                }
                else
                {
                    // End:0x2AE
                    if(mainTab == 4)
                    {
                        switch(subTab)
                        {
                            // End:0x28C
                            case 0:
                                TPItemList.ItemList.ShowEtc();
                                // End:0x2AE
                                break;
                            // End:0x2AB
                            case 1:
                                TPItemList.ItemList.ShowEtc();
                                // End:0x2AE
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
        SetInfoBox();
        //return;        
    }
}

function AddSubMenuBtns()
{
    local int i, Count, nIndex;
    local BTROItemBoxHK ro;
    local BTItemListMenuBtn temp;

    TPItemList.ItemList.SubMenuBtn.Length = 0;
    i = 0;
    J0x21:

    // End:0x219 [Loop If]
    if(i < TPItemList.ItemList.DataList.Length)
    {
        ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i]);
        // End:0x8C
        if(ro.ItemInfo.AdType >= 10)
        {
            // [Explicit Continue]
            goto J0x20F;
        }
        // End:0x20F
        if((ro.ItemInfo.AdType >= 1) || ro.instanceInfo.CashItemInfo != none)
        {
            // End:0x20F
            if((TPItemList.ItemList.bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                Count = 0;
                J0x10D:

                // End:0x20F [Loop If]
                if(Count < 3)
                {
                    temp = new Class'GUIWarfareControls_Decompressed.BTItemListMenuBtn';
                    temp.PController = Controller;
                    temp.bGift = true;
                    temp.bBuy = true;
                    temp.bCoast = true;
                    temp.bDisgift = true;
                    temp.ItemID = ro.ItemInfo.ItemID;
                    temp.Init();
                    TPItemList.ItemList.isHaveSubMenuBtn = true;
                    TPItemList.ItemList.SubMenuBtn[TPItemList.ItemList.SubMenuBtn.Length] = temp;
                    Count++;
                    // [Loop Continue]
                    goto J0x10D;
                }
            }
        }
        J0x20F:

        i++;
        // [Loop Continue]
        goto J0x21;
    }
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
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0x8D
    if(ItemInfo.ItemType >= 9)
    {
        return;
    }
    currentSlot = InvenGroup.GetSelectIndex();
    // End:0xD7
    if((ItemInfo.ItemType <= 2) && currentSlot != 0)
    {
        InvenGroup.SelectButton(0);        
    }
    else
    {
        // End:0x10C
        if((ItemInfo.ItemType == 3) && currentSlot != 1)
        {
            InvenGroup.SelectButton(1);            
        }
        else
        {
            // End:0x216
            if(ItemInfo.ItemType == 4)
            {
                // End:0x1B4
                if((currentSlot != 2) && currentSlot != 3)
                {
                    // End:0x16F
                    if(ButtonWeapon[2].itemBox.ItemInfo == none)
                    {
                        InvenGroup.SelectButton(2);                        
                    }
                    else
                    {
                        // End:0x1A3
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
                // End:0x1EE
                if((currentSlot == 2) && instanceInfo.SlotPosition == 3)
                {
                    return;
                }
                // End:0x213
                if((currentSlot == 3) && instanceInfo.SlotPosition == 2)
                {
                    return;
                }                
            }
            else
            {
                // End:0x24D
                if((ItemInfo.ItemType == 5) && currentSlot != 4)
                {
                    InvenGroup.SelectButton(4);                    
                }
                else
                {
                    // End:0x284
                    if((ItemInfo.ItemType == 6) && currentSlot != 5)
                    {
                        InvenGroup.SelectButton(5);                        
                    }
                    else
                    {
                        // End:0x2BB
                        if((ItemInfo.ItemType == 7) && currentSlot != 6)
                        {
                            InvenGroup.SelectButton(6);                            
                        }
                        else
                        {
                            // End:0x2F2
                            if((ItemInfo.ItemType == 8) && currentSlot != 7)
                            {
                                InvenGroup.SelectButton(7);                                
                            }
                            else
                            {
                                // End:0x318
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
    // End:0x390
    if(currentSlot < 4)
    {
        // End:0x353
        if(currentSlot == instanceInfo.SlotPosition)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, InvenGroup.GetSelectIndex());        
    }
    else
    {
        // End:0x3B2
        if(currentSlot == ((instanceInfo.SlotPosition - 18) + 4))
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, (InvenGroup.GetSelectIndex() + 18) - 4);
    }
    //return;    
}

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    ib = ButtonWeapon[ButtonID];
    // End:0x7F
    if(ib.itemBox.instanceInfo != none)
    {
        TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
    }
    //return;    
}

function fill(array<int> ShopItemList)
{
    local int i, j;
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyPoint = MM.kPoint;
    TPItemList.MyData.MyCash = MM.kCash;
    TPItemList.ItemList.ClearItem();
    i = 0;
    J0xF0:

    // End:0x306 [Loop If]
    if(i < ShopItemList.Length)
    {
        ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(ShopItemList[i]);
        // End:0x1A3
        if(ro.ItemInfo == none)
        {
            ro.ItemInfo = new Class'Engine.wItemBoxHK';
            ro.ItemInfo.ItemName = "ItemID=" $ string(ShopItemList[i]);
        }
        ro.SetGameManager(GameMgr);
        ro.SetMatchMaker(MM);
        ro.ChangeState(6);
        // End:0x20F
        if(GameMgr.FindFirstInstanceItemByItemID(ShopItemList[i]) != none)
        {
            ro.RibbonState = 1;            
        }
        else
        {
            // End:0x241
            if(ro.ItemInfo.AdType == 2)
            {
                ro.RibbonState = 3;                
            }
            else
            {
                // End:0x273
                if(ro.ItemInfo.AdType == 3)
                {
                    ro.RibbonState = 2;                    
                }
                else
                {
                    // End:0x2A2
                    if(ro.ItemInfo.AdType == 4)
                    {
                        ro.RibbonState = 4;
                    }
                }
            }
        }
        ro.MyData = TPItemList.MyData;
        ro.Update();
        ro.bUseCache = true;
        TPItemList.ItemList.AddItem(ro);
        i++;
        // [Loop Continue]
        goto J0xF0;
    }
    i = 0;
    J0x30D:

    // End:0xE65 [Loop If]
    if(i < GameMgr.kWZPackageList.Length)
    {
        // End:0x349
        if(GameMgr.kWZPackageList[i].SalesFlag == 183)
        {
            // [Explicit Continue]
            goto J0xE5B;
        }
        ro = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(GameMgr.kWZPackageList[i].ItemID);
        ro.ItemInfo.PurchaseType = 1;
        ro.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
        ro.instanceInfo.CashItemInfo = new Class'Engine.wItemBoxCashHK';
        ro.instanceInfo.CashItemInfo.WZItemName = GameMgr.kWZPackageList[i].PackageName;
        ro.instanceInfo.CashItemInfo.WZPurchaseType = 1;
        ro.instanceInfo.CashItemInfo.WZItemDescription = GameMgr.kWZPackageList[i].ItemDesc;
        ro.instanceInfo.CashItemInfo.bWZPackage = false;
        Log("ro.InstanceInfo.CashItemInfo.WZItemName=" $ ro.instanceInfo.CashItemInfo.WZItemName);
        // End:0x921
        if(GameMgr.kWZPackageList[i].PriceList.Length > 0)
        {
            Log("gameMgr.kWZPackageList[i].PriceList[0].PropertySeq=" $ string(GameMgr.kWZPackageList[i].PriceList[0].PropertySeq));
            // End:0x748
            if(GameMgr.kWZPackageList[i].PriceList[0].PropertySeq == 7)
            {
                j = 0;
                J0x5A0:

                // End:0x6AF [Loop If]
                if(j < GameMgr.kWZPackageList[i].PriceList.Length)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = GameMgr.kWZPackageList[i].PriceList[j].Value;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = GameMgr.kWZPackageList[i].PriceList[j].Price;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = GameMgr.kWZPackageList[i].PriceList[j].PriceSeq;
                    j++;
                    // [Loop Continue]
                    goto J0x5A0;
                }
                j = j;
                J0x6BA:

                // End:0x748 [Loop If]
                if(j < 5)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = 0;
                    j++;
                    // [Loop Continue]
                    goto J0x6BA;
                }
            }
            // End:0x91E
            if(GameMgr.kWZPackageList[i].PriceList[0].PropertySeq == 10)
            {
                j = 0;
                J0x776:

                // End:0x885 [Loop If]
                if(j < GameMgr.kWZPackageList[i].PriceList.Length)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = GameMgr.kWZPackageList[i].PriceList[j].Value;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = GameMgr.kWZPackageList[i].PriceList[j].Price;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = GameMgr.kWZPackageList[i].PriceList[j].PriceSeq;
                    j++;
                    // [Loop Continue]
                    goto J0x776;
                }
                j = j;
                J0x890:

                // End:0x91E [Loop If]
                if(j < 5)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = 0;
                    j++;
                    // [Loop Continue]
                    goto J0x890;
                }
            }            
        }
        else
        {
            // End:0x964
            if(GameMgr.kWZPackageList[i].ProductList.Length >= 1)
            {
                ro.instanceInfo.CashItemInfo.bWZPackage = true;
            }
            j = 0;
            J0x96B:

            // End:0x9D1 [Loop If]
            if(j < 5)
            {
                ro.instanceInfo.CashItemInfo.WZPeriod[j] = 0;
                ro.instanceInfo.CashItemInfo.WZCashPrice[j] = 0;
                j++;
                // [Loop Continue]
                goto J0x96B;
            }
            ro.instanceInfo.CashItemInfo.WZPeriod[0] = 1;
            ro.instanceInfo.CashItemInfo.WZCashPrice[0] = GameMgr.kWZPackageList[i].CashPrice;
            ro.instanceInfo.CashItemInfo.WZPriceSeq[0] = 0;
        }
        ro.instanceInfo.CashItemInfo.WZLeftCount = GameMgr.kWZPackageList[i].LeftCount;
        ro.instanceInfo.CashItemInfo.WZEndDate = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(122, string(GameMgr.kWZPackageList[i].EndDate_Month), string(GameMgr.kWZPackageList[i].EndDate_Day));
        // End:0xB3D
        if(GameMgr.kWZPackageList[i].SalesFlag == 182)
        {
            ro.instanceInfo.CashItemInfo.bWZCanBuy = true;            
        }
        else
        {
            ro.instanceInfo.CashItemInfo.bWZCanBuy = false;
        }
        // End:0xBA6
        if(GameMgr.kWZPackageList[i].GiftFlag == 184)
        {
            ro.instanceInfo.CashItemInfo.bWZCanGift = true;            
        }
        else
        {
            ro.instanceInfo.CashItemInfo.bWZCanGift = false;
        }
        // End:0xC0F
        if(GameMgr.kWZPackageList[i].CapsuleFlag == 176)
        {
            ro.instanceInfo.CashItemInfo.bWZCapsuleItem = true;            
        }
        else
        {
            ro.instanceInfo.CashItemInfo.bWZCapsuleItem = false;
        }
        // End:0xC72
        if(GameMgr.kWZPackageList[i].ImageTagType == 680)
        {
            ro.ItemInfo.AdType = 3;            
        }
        else
        {
            // End:0xCAF
            if(GameMgr.kWZPackageList[i].ImageTagType == 681)
            {
                ro.ItemInfo.AdType = 4;
            }
        }
        ro.instanceInfo.CashItemInfo.WZPackageType = GameMgr.kWZPackageList[i].PackageType;
        ro.instanceInfo.CashItemInfo.WZPackageSeq = GameMgr.kWZPackageList[i].PackageSeq;
        ro.instanceInfo.CashItemInfo.WZCategorySeq = GameMgr.kWZPackageList[i].CategorySeq;
        // End:0xD8F
        if(ro.ItemInfo.AdType == 2)
        {
            ro.RibbonState = 3;            
        }
        else
        {
            // End:0xDC1
            if(ro.ItemInfo.AdType == 3)
            {
                ro.RibbonState = 2;                
            }
            else
            {
                // End:0xDF0
                if(ro.ItemInfo.AdType == 4)
                {
                    ro.RibbonState = 4;
                }
            }
        }
        ro.ChangeState(16);
        ro.MyData = TPItemList.MyData;
        ro.Update();
        ro.bUseCache = true;
        TPItemList.ItemList.AddItem(ro);
        J0xE5B:

        i++;
        // [Loop Continue]
        goto J0x30D;
    }
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ShowShopItemAll();
    AddSubMenuBtns();
    //return;    
}

function SetInfoBox(optional int Index)
{
    local int i;

    // End:0x0D
    if(Index < 0)
    {
        return;
    }
    // End:0xE4
    if(TPItemList.ItemList.DataList.Length > 0)
    {
        InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).instanceInfo, none, none);
        InfoBox.ItemBoxView.itemBox.ChangeState(7);
        InfoBox.ItemBoxView.itemBox.MyData = TPItemList.MyData;
    }
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

    // End:0xD1 [Loop If]
    if(i < 7)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(18 + i);
        // End:0xB0
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            // [Explicit Continue]
            goto J0xC7;
        }
        ButtonWeapon[i].SetData(none, none);
        J0xC7:

        i++;
        // [Loop Continue]
        goto J0x36;
    }
    //return;    
}

function InitializeLeftPanel()
{
    local int i;

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
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(213.0000000, 566.0000000, 264.0000000, 597.0000000), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 566.0000000, 62.0000000, 597.0000000), 0.8000000);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(11.0000000, 97.0000000, 114.0000000, 129.0000000), 0.8000000);
    ButtonAF.SetTabButtonFontColor();
    ButtonAF.SetMidTabButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonAF.bSelect = true;
    ButtonAF.bSelectHighlight = true;
    ButtonRSA = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(115.0000000, 97.0000000, 218.0000000, 129.0000000), 0.8000000);
    ButtonRSA.SetTabButtonFontColor();
    ButtonRSA.SetSmallTabButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x341:

    // End:0x448 [Loop If]
    if(i < 7)
    {
        ButtonWeapon[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i + 4];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(19);
        InvenGroup.AddButton(ButtonWeapon[i]);
        ButtonWeapon[i].CaptionPadding[1] = 2;
        i++;
        // [Loop Continue]
        goto J0x341;
    }
    ButtonWeapon[0].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_hlmt;
    ButtonWeapon[1].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_face;
    ButtonWeapon[2].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_gogl;
    ButtonWeapon[3].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    ButtonWeapon[4].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_rsa;
    ButtonWeapon[5].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_class;
    ButtonWeapon[6].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_slot_clth_af;
    i = 0;
    J0x52D:

    // End:0x577 [Loop If]
    if(i < 7)
    {
        ButtonWeapon[i].__OnClick__Delegate = None;
        ButtonWeapon[i].__OnDblClick__Delegate = None;
        i++;
        // [Loop Continue]
        goto J0x52D;
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
    UIModel.bAcceptsInput = false;
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(5.0000000, 147.0000000, 324.0000000, 620.0000000);
    UIModel.RenderWeight = 0.7000000;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
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
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new Class'GUIWarfareControls_Decompressed.BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShopItem = true;
    TPItemList.ItemList.BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_store_in;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 5;
    i = 0;
    J0x130:

    // End:0x31B [Loop If]
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
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x130;
    }
    i = 0;
    J0x322:

    // End:0x58A [Loop If]
    if(i < 5)
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
        SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x322;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new Class'GUIWarfareControls_Decompressed.BTItemInfoHorzBoxHKCN';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0000000;
    fb.Y1 = 564.0000000;
    fb.X2 = 510.0000000 + float(504);
    fb.Y2 = 564.0000000 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    i = 0;
    J0x658:

    // End:0x74F [Loop If]
    if(i < 3)
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
        i++;
        // [Loop Continue]
        goto J0x658;
    }
    astrSubMenuNewAndHot.Length = 4;
    i = 0;
    J0x75F:

    // End:0x790 [Loop If]
    if(i < astrSubMenuNewAndHot.Length)
    {
        astrSubMenuNewAndHot[i] = strSubMenuNewAndHot[i];
        i++;
        // [Loop Continue]
        goto J0x75F;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x7A0:

    // End:0x7D1 [Loop If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x7A0;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x7E1:

    // End:0x812 [Loop If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        i++;
        // [Loop Continue]
        goto J0x7E1;
    }
    i = 0;
    J0x819:

    // End:0x849 [Loop If]
    if(i < (4 - 1))
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        i++;
        // [Loop Continue]
        goto J0x819;
    }
    astrSubMenuCashItem.Length = 2;
    i = 0;
    J0x859:

    // End:0x88A [Loop If]
    if(i < astrSubMenuCashItem.Length)
    {
        astrSubMenuCashItem[i] = strSubMenuCashItem[i];
        i++;
        // [Loop Continue]
        goto J0x859;
    }
    ChangeSubButton(astrSubMenuNewAndHot);
    i = 0;
    J0x89C:

    // End:0x8CC [Loop If]
    if(i < 3)
    {
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x89C;
    }
    //return;    
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new Class'GUIWarfareControls_Decompressed.DragObject';
    DragBox.Init();
    i = 0;
    J0x25:

    // End:0x96 [Loop If]
    if(i < 7)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = ButtonWeapon_OnBeginDrag;
        btn.__OnEndDrag__Delegate = ButtonWeapon_OnEndDrag;
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
    TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = ItemList_OnBeginDrag;
    TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = ItemList_OnEndDrag;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte KeyState, float Delta)
{
    local Interactions.EInputKey iKey;

    // End:0x109
    if((Controller.MouseX >= fbTPItemList.X1) && Controller.MouseY >= fbTPItemList.Y1)
    {
        // End:0x109
        if((Controller.MouseX <= fbTPItemList.X2) && Controller.MouseY <= fbTPItemList.Y2)
        {
            iKey = key;
            // End:0xC6
            if((int(KeyState) == 3) && int(iKey) == int(236))
            {
                TPItemList.ItemList.ImageList.WheelUp();
                return true;
            }
            // End:0x109
            if((int(KeyState) == 3) && int(iKey) == int(237))
            {
                TPItemList.ItemList.ImageList.WheelDown();
                return true;
            }
        }
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    fbButtonWeapon[0]=(X1=227.0000000,Y1=138.0000000,X2=303.0000000,Y2=223.0000000)
    fbButtonWeapon[1]=(X1=227.0000000,Y1=227.0000000,X2=303.0000000,Y2=312.0000000)
    fbButtonWeapon[2]=(X1=227.0000000,Y1=405.0000000,X2=303.0000000,Y2=490.0000000)
    fbButtonWeapon[3]=(X1=28.0000000,Y1=642.0000000,X2=104.0000000,Y2=727.0000000)
    fbButtonWeapon[4]=(X1=108.0000000,Y1=642.0000000,X2=184.0000000,Y2=727.0000000)
    fbButtonWeapon[5]=(X1=227.0000000,Y1=642.0000000,X2=303.0000000,Y2=727.0000000)
    fbButtonWeapon[6]=(X1=227.0000000,Y1=316.0000000,X2=303.0000000,Y2=401.0000000)
    // Referen[0]ce: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHKCN.mTabControl2'
    begin object name="mTabControl2" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl2
    fbTPItemList=(X1=515.0000000,Y1=194.0000000,X2=1013.0000000,Y2=544.0000000)
    OnPreDraw=BTTPStoreWeaponHKCN.Internal_OnPreDraw
    OnKeyEvent=BTTPStoreWeaponHKCN.InternalOnKeyEvent
}