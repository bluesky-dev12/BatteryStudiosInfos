class BTTPStoreWeaponHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var DragObject DragBox;
var() automated ButtonGroups InvenGroup;
var() automated BTStretchedImageHK BackgroundImage;
var() automated FloatBox fbButtonWeapon[7];
var export editinline BTItemBoxButtonHK ButtonWeapon[7];
var localized string strButtonWeapon[11];
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
var localized string strForGift[2];
var localized string strForMe[2];
var export editinline BTModelHK UIModel;
var BTROModelNew CharacterModel;
var export editinline BTAutoScrollListHK ChatBox;
var localized string strMainMenu[5];
var localized string strSubMenuNewAndHot[4];
var localized string strSubMenuWeapon[4];
var localized string strSubMenuEquip[5];
var localized string strSubMenuSpecial[4];
var localized string strSubMenuCashItem[2];
var array<string> astrSubMenuNewAndHot;
var array<string> astrSubMenuWeapon;
var array<string> astrSubMenuEquip;
var array<string> astrSubMenuSpecial;
var array<string> astrSubMenuCashItem;
var() automated TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[5];
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
var array<int> EquipItemList;
var array<int> InvenItemList;
var string SaveWebzenBuyItemName;
//var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;

function bool Internal_OnPreDraw(Canvas C)
{
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
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    cItemInfo = none;
    switch(ItemInfo.ItemType)
    {
        // End:0xD2
        case 0:
        // End:0xD6
        case 1:
        // End:0x102
        case 2:
            cItemInfo = self.ButtonWeapon[0].itemBox.ItemInfo;
            // End:0x212
            break;
        // End:0x12E
        case 3:
            cItemInfo = self.ButtonWeapon[1].itemBox.ItemInfo;
            // End:0x212
            break;
        // End:0x15B
        case 4:
            cItemInfo = self.ButtonWeapon[2].itemBox.ItemInfo;
            // End:0x212
            break;
        // End:0x188
        case 5:
            cItemInfo = self.ButtonWeapon[4].itemBox.ItemInfo;
            // End:0x212
            break;
        // End:0x1B5
        case 6:
            cItemInfo = self.ButtonWeapon[5].itemBox.ItemInfo;
            // End:0x212
            break;
        // End:0x1E2
        case 7:
            cItemInfo = self.ButtonWeapon[6].itemBox.ItemInfo;
            // End:0x212
            break;
        // End:0x20F
        case 8:
            cItemInfo = self.ButtonWeapon[7].itemBox.ItemInfo;
            // End:0x212
            break;
        // End:0xFFFF
        default:
            break;
    }
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, none);
    // End:0x278
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
    // End:0x390
    if(ItemInfo.ItemType <= 2)
    {
        CharacterModel.ChangeWeapon(ItemInfo.ItemID);        
    }
    else
    {
        // End:0x453
        if(ItemInfo.ItemType == 5)
        {
            // End:0x3D7
            if(BodyID[0] == CharacterModel.default.BodyID[0])
            {
                HelmetID[0] = ItemInfo.ItemID;
            }
            // End:0x409
            if(BodyID[1] == CharacterModel.default.BodyID[1])
            {
                HelmetID[1] = ItemInfo.ItemID;
            }
            CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);            
        }
        else
        {
            // End:0x516
            if(ItemInfo.ItemType == 6)
            {
                // End:0x49A
                if(BodyID[0] == CharacterModel.default.BodyID[0])
                {
                    FaceID[0] = ItemInfo.ItemID;
                }
                // End:0x4CC
                if(BodyID[1] == CharacterModel.default.BodyID[1])
                {
                    FaceID[1] = ItemInfo.ItemID;
                }
                CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);                
            }
            else
            {
                // End:0x5D9
                if(ItemInfo.ItemType == 7)
                {
                    // End:0x55D
                    if(BodyID[0] == CharacterModel.default.BodyID[0])
                    {
                        AcceID[0] = ItemInfo.ItemID;
                    }
                    // End:0x58F
                    if(BodyID[1] == CharacterModel.default.BodyID[1])
                    {
                        AcceID[1] = ItemInfo.ItemID;
                    }
                    CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);                    
                }
                else
                {
                    // End:0x791
                    if(ItemInfo.ItemType == 8)
                    {
                        // End:0x69D
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
                            // End:0x74A
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
    local wItemBoxCashHK cii;
    local array<int> temp;
    local wMatchMaker MM;
    local wGameManager gm;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    BTWindow = BTWindowItemBuyHK(Controller.TopPage());
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    // End:0x1C6
    if(BTWindow.ItemInfo.CostType == 4)
    {
        // End:0x1C6
        if(gm.FindFirstInstanceItemByItemID(BTWindow.ItemID) != none)
        {
            // End:0x15F
            if(BTWindow.ItemInfo.IsCashItem() == true)
            {
                // End:0x15C
                if((MM.kCash - cii.WZCashPrice[BTWindow.OptionDay - 1]) < 0)
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 204);
                    Controller.CloseMenu(false);
                    return true;
                }                
            }
            else
            {
                // End:0x1C6
                if((MM.kPoint - BTWindow.ItemInfo.PointPrice[BTWindow.OptionDay - 1]) < 0)
                {
                    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 31);
                    Controller.CloseMenu(false);
                    return true;
                }
            }
        }
    }
    // End:0x2DB
    if(cii != none)
    {
        temp.Length = 1;
        temp[0] = BTWindow.ItemID;
        SaveWebzenBuyItemName = cii.WZItemName;
        Log((((("sfReqBuyItemByWebzenCash(" $ string(cii.WZPackageSeq)) $ ",") $ string(cii.WZCategorySeq)) $ ",") $ string(cii.WZPriceSeq[BTWindow.OptionDay - 1]));
        TcpChannel.sfReqBuyItemByWebzenCash(cii.WZPackageSeq, cii.WZCategorySeq, cii.WZPriceSeq[BTWindow.OptionDay - 1], temp, __NFUN_921__(0), byte(BTWindow.OptionDay), 1);        
    }
    else
    {
        Log("sfReqBuyShopItem(" $ string(BTWindow.ItemID));
        SaveWebzenBuyItemName = BTWindow.ro.ItemInfo.ItemName;
        TcpChannel.sfReqBuyShopItem(BTWindow.ItemID, __NFUN_921__(0), byte(BTWindow.OptionDay), 0);
        Controller.CloseMenu(false);
    }
    return true;
    //return;    
}

function BTWindowItemBuyHK_OnTimeOut(GUIComponent Sender)
{
    Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyHK');
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 182);
    //return;    
}

function BTWindowSendPresentHK_OnTimeOut(GUIComponent Sender)
{
    Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowSendPresentHK');
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 183);
    //return;    
}

delegate deleShowCashChargeWindow()
{
    //return;    
}

function bool MenuButton_OnClick(GUIComponent Sender)
{
    local BTROItemBoxHK ro;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ro = BTROItemBoxHK(TPItemList.ItemList.GetLastSelectedItem());
    // End:0xE0
    if((ro.ItemInfo.CostType == 1) || ro.ItemInfo.CostType == 4)
    {
        // End:0xE0
        if((ro.ItemInfo.Period[0] == 0) && ro.ItemInfo.AdType > 0)
        {
            return false;
        }
    }
    switch(btn.ButtonID)
    {
        // End:0x101
        case 0:
            deleShowCashChargeWindow();
            // End:0x44A
            break;
        // End:0x27C
        case 1:
            Controller.OpenMenu("GUIWarfareControls.BTWindowItemBuyHK");
            BTWindowItemBuyHK(Controller.TopPage()).SetData(ro.ItemInfo.ItemID, ro.MyData.MyPoint, ro.MyData.MyCash, ro.ItemInfo);
            BTWindowItemBuyHK(Controller.TopPage()).SetRenderObject(ro);
            BTWindowItemBuyHK(Controller.TopPage()).TopLine.Caption = strForGift[0];
            BTWindowItemBuyHK(Controller.TopPage()).ButtonOK.Caption = strForGift[1];
            BTWindowItemBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyHK_BeforePresent_OnOK;
            BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
            // End:0x44A
            break;
        // End:0x447
        case 2:
            // End:0x2C3
            if(MM.kLevel < ro.ItemInfo.EquipLevel)
            {
                Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
                return true;
            }
            // End:0x2D0
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
            // End:0x44A
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool BTWindowItemBuyTerm_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBuyTerm BTWindow;
    local wItemBoxHK ib;
    local wItemBoxCashHK cii;
    local array<int> temp;
    local wMatchMaker MM;

    BTWindow = BTWindowItemBuyTerm(Controller.TopPage());
    ib = BTWindow.ro.ItemInfo;
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x187
    if(cii != none)
    {
        GetCashItemInfo(temp, ib, cii);
        Log((((("sfReqBuyItemByWebzenCash(" $ string(cii.WZPackageSeq)) $ ",") $ string(cii.WZCategorySeq)) $ ",") $ string(cii.WZPriceSeq[int(BTWindow.OptionDay) - 1]));
        TcpChannel.sfReqBuyItemByWebzenCash(cii.WZPackageSeq, cii.WZCategorySeq, cii.WZPriceSeq[int(BTWindow.OptionDay) - 1], temp, __NFUN_921__(0), BTWindow.OptionDay, 1);        
    }
    else
    {
        Log((("sfReqBuyShopItem(" $ string(BTWindow.ItemID)) $ " ") $ BTWindow.ItemInfo.ItemName);
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade);
        TcpChannel.sfReqBuyShopItem(BTWindow.ItemID, __NFUN_921__(0), BTWindow.OptionDay, 1);
    }
    Class'GUIWarfareControls_Decompressed.BTWindowHK'.static.CloseWindowAllByName(Controller, Class'GUIWarfareControls_Decompressed.BTWindowItemBuyTerm');
    Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0000000);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowItemBuyHK_OnTimeOut;
    return true;
    //return;    
}

function GetCashItemInfo(out array<int> temp, wItemBoxHK ib, wItemBoxCashHK cii)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    temp.Length = 1;
    temp[0] = ib.ItemID;
    MM.SetLastBuyItemInfo(cii.WZItemName, ib.ItemType, ib.Grade);
    //return;    
}

function bool CheckValidItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instnaceinfo)
{
    // End:0xB4
    if(((ItemInfo.CostType == 1) || ItemInfo.CostType == 4) && instnaceinfo != none)
    {
        // End:0x86
        if(instnaceinfo.CashItemInfo != none)
        {
            // End:0x83
            if((instnaceinfo.CashItemInfo.WZPeriod[0] == 0) && ItemInfo.AdType > 0)
            {
                return false;
            }            
        }
        else
        {
            // End:0xB4
            if((ItemInfo.Period[0] == 0) && ItemInfo.AdType > 0)
            {
                return false;
            }
        }
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
                            TPItemList.ItemList.ShowETCnPassive();
                            // End:0x257
                            break;
                        // End:0x234
                        case 1:
                            TPItemList.ItemList.ShowPassive();
                            // End:0x257
                            break;
                        // End:0x254
                        case 2:
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
                    // End:0x28F
                    if(mainTab == 4)
                    {
                        switch(subTab)
                        {
                            // End:0x28C
                            case 0:
                                TPItemList.ItemList.ShowCashItem();
                                // End:0x28F
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
        SetInfoBox();
        //return;        
    }
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

    // End:0x2F2 [Loop If]
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
        ro.ChangeState(6);
        // End:0x1FB
        if(GameMgr.FindFirstInstanceItemByItemID(ShopItemList[i]) != none)
        {
            ro.RibbonState = 1;            
        }
        else
        {
            // End:0x22D
            if(ro.ItemInfo.AdType == 2)
            {
                ro.RibbonState = 3;                
            }
            else
            {
                // End:0x25F
                if(ro.ItemInfo.AdType == 3)
                {
                    ro.RibbonState = 2;                    
                }
                else
                {
                    // End:0x28E
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
    J0x2F9:

    // End:0xD6E [Loop If]
    if(i < GameMgr.kWZPackageList.Length)
    {
        // End:0x335
        if(GameMgr.kWZPackageList[i].SalesFlag == 183)
        {
            // [Explicit Continue]
            goto J0xD64;
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
        Log("ro.InstanceInfo.CashItemInfo.WZItemName=" $ ro.instanceInfo.CashItemInfo.WZItemName);
        // End:0x8EA
        if(GameMgr.kWZPackageList[i].PriceList.Length > 0)
        {
            Log("gameMgr.kWZPackageList[i].PriceList[0].PropertySeq=" $ string(GameMgr.kWZPackageList[i].PriceList[0].PropertySeq));
            // End:0x711
            if(GameMgr.kWZPackageList[i].PriceList[0].PropertySeq == 7)
            {
                j = 0;
                J0x569:

                // End:0x678 [Loop If]
                if(j < GameMgr.kWZPackageList[i].PriceList.Length)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = GameMgr.kWZPackageList[i].PriceList[j].Value;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = GameMgr.kWZPackageList[i].PriceList[j].Price;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = GameMgr.kWZPackageList[i].PriceList[j].PriceSeq;
                    j++;
                    // [Loop Continue]
                    goto J0x569;
                }
                j = j;
                J0x683:

                // End:0x711 [Loop If]
                if(j < 5)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = 0;
                    j++;
                    // [Loop Continue]
                    goto J0x683;
                }
            }
            // End:0x8E7
            if(GameMgr.kWZPackageList[i].PriceList[0].PropertySeq == 10)
            {
                j = 0;
                J0x73F:

                // End:0x84E [Loop If]
                if(j < GameMgr.kWZPackageList[i].PriceList.Length)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = GameMgr.kWZPackageList[i].PriceList[j].Value;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = GameMgr.kWZPackageList[i].PriceList[j].Price;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = GameMgr.kWZPackageList[i].PriceList[j].PriceSeq;
                    j++;
                    // [Loop Continue]
                    goto J0x73F;
                }
                j = j;
                J0x859:

                // End:0x8E7 [Loop If]
                if(j < 5)
                {
                    ro.instanceInfo.CashItemInfo.WZPeriod[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZCashPrice[j] = 0;
                    ro.instanceInfo.CashItemInfo.WZPriceSeq[j] = 0;
                    j++;
                    // [Loop Continue]
                    goto J0x859;
                }
            }            
        }
        else
        {
            j = 0;
            J0x8F1:

            // End:0x957 [Loop If]
            if(j < 5)
            {
                ro.instanceInfo.CashItemInfo.WZPeriod[j] = 0;
                ro.instanceInfo.CashItemInfo.WZCashPrice[j] = 0;
                j++;
                // [Loop Continue]
                goto J0x8F1;
            }
            ro.instanceInfo.CashItemInfo.WZPeriod[0] = 1;
            ro.instanceInfo.CashItemInfo.WZCashPrice[0] = GameMgr.kWZPackageList[i].CashPrice;
            ro.instanceInfo.CashItemInfo.WZPriceSeq[0] = 0;
        }
        ro.instanceInfo.CashItemInfo.WZLeftCount = GameMgr.kWZPackageList[i].LeftCount;
        ro.instanceInfo.CashItemInfo.WZEndDate = Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(122, string(GameMgr.kWZPackageList[i].EndDate_Month), string(GameMgr.kWZPackageList[i].EndDate_Day));
        // End:0xAC3
        if(GameMgr.kWZPackageList[i].SalesFlag == 182)
        {
            ro.instanceInfo.CashItemInfo.bWZCanBuy = true;            
        }
        else
        {
            ro.instanceInfo.CashItemInfo.bWZCanBuy = false;
        }
        // End:0xB2C
        if(GameMgr.kWZPackageList[i].GiftFlag == 184)
        {
            ro.instanceInfo.CashItemInfo.bWZCanGift = true;            
        }
        else
        {
            ro.instanceInfo.CashItemInfo.bWZCanGift = false;
        }
        // End:0xB95
        if(GameMgr.kWZPackageList[i].CapsuleFlag == 176)
        {
            ro.instanceInfo.CashItemInfo.bWZCapsuleItem = true;            
        }
        else
        {
            ro.instanceInfo.CashItemInfo.bWZCapsuleItem = false;
        }
        ro.instanceInfo.CashItemInfo.WZPackageType = GameMgr.kWZPackageList[i].PackageType;
        ro.instanceInfo.CashItemInfo.WZPackageSeq = GameMgr.kWZPackageList[i].PackageSeq;
        ro.instanceInfo.CashItemInfo.WZCategorySeq = GameMgr.kWZPackageList[i].CategorySeq;
        // End:0xC98
        if(ro.ItemInfo.AdType == 2)
        {
            ro.RibbonState = 3;            
        }
        else
        {
            // End:0xCCA
            if(ro.ItemInfo.AdType == 3)
            {
                ro.RibbonState = 2;                
            }
            else
            {
                // End:0xCF9
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
        J0xD64:

        i++;
        // [Loop Continue]
        goto J0x2F9;
    }
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ImageList.__OnDblClick__Delegate = ImageListBox_OnDblClick;
    TPItemList.ItemList.ShowShopItemAll();
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

    // End:0xCD [Loop If]
    if(i < 4)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xAC
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            // [Explicit Continue]
            goto J0xC3;
        }
        ButtonWeapon[i].SetData(none, none);
        J0xC3:

        i++;
        // [Loop Continue]
        goto J0x36;
    }
    i = 4;
    J0xD5:

    // End:0x174 [Loop If]
    if(i < 7)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos((i - 4) + 18);
        // End:0x153
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            // [Explicit Continue]
            goto J0x16A;
        }
        ButtonWeapon[i].SetData(none, none);
        J0x16A:

        i++;
        // [Loop Continue]
        goto J0xD5;
    }
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
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(303), AFTeamBG.AWinPos.Y1 + float(514)), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(56), AFTeamBG.AWinPos.Y1 + float(514)), 0.8000000);
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

    // End:0x60F [Loop If]
    if(i < 7)
    {
        ButtonWeapon[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(19);
        InvenGroup.AddButton(ButtonWeapon[i]);
        ButtonWeapon[i].CaptionPadding[1] = 2;
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
    J0x716:

    // End:0x760 [Loop If]
    if(i < 7)
    {
        ButtonWeapon[i].__OnClick__Delegate = ButtonWeapon_OnClick;
        ButtonWeapon[i].__OnDblClick__Delegate = ButtonWeapon_OnDblClick;
        i++;
        // [Loop Continue]
        goto J0x716;
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
    UIModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
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
    LabelItemList.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
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
    J0x14D:

    // End:0x37D [Loop If]
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
        // End:0x2AB
        if(i == 4)
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
        goto J0x14D;
    }
    i = 0;
    J0x384:

    // End:0x62B [Loop If]
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
        goto J0x384;
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
    J0x6F9:

    // End:0x81C [Loop If]
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
        MenuButton[i].InitComponent(Controller, self);
        AppendComponent(MenuButton[i]);
        i++;
        // [Loop Continue]
        goto J0x6F9;
    }
    astrSubMenuNewAndHot.Length = 4;
    i = 0;
    J0x82C:

    // End:0x85D [Loop If]
    if(i < astrSubMenuNewAndHot.Length)
    {
        astrSubMenuNewAndHot[i] = strSubMenuNewAndHot[i];
        i++;
        // [Loop Continue]
        goto J0x82C;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x86D:

    // End:0x89E [Loop If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        i++;
        // [Loop Continue]
        goto J0x86D;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x8AE:

    // End:0x8DF [Loop If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        i++;
        // [Loop Continue]
        goto J0x8AE;
    }
    i = 0;
    J0x8E6:

    // End:0x916 [Loop If]
    if(i < (4 - 1))
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        i++;
        // [Loop Continue]
        goto J0x8E6;
    }
    astrSubMenuCashItem.Length = 1;
    i = 0;
    J0x925:

    // End:0x956 [Loop If]
    if(i < astrSubMenuCashItem.Length)
    {
        astrSubMenuCashItem[i] = strSubMenuCashItem[i];
        i++;
        // [Loop Continue]
        goto J0x925;
    }
    ChangeSubButton(astrSubMenuNewAndHot);
    i = 0;
    J0x968:

    // End:0x998 [Loop If]
    if(i < 3)
    {
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        i++;
        // [Loop Continue]
        goto J0x968;
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    //return;    
}

defaultproperties
{
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    strButtonWeapon[0]="Primary"
    strButtonWeapon[1]="Secondary"
    strButtonWeapon[2]="Thrown"
    strButtonWeapon[3]="Thrown"
    strButtonWeapon[4]="Helmet"
    strButtonWeapon[5]="Face"
    strButtonWeapon[6]="Accessory"
    strButtonWeapon[7]="AF"
    strButtonWeapon[8]="RSA"
    strButtonWeapon[9]="Rank Mark"
    strAF="AF"
    strRSA="RSA"
    strForGift[0]="Buy Gift"
    strForGift[1]="Gift"
    strForMe[0]="Buy Item"
    strForMe[1]="Buy"
    strMainMenu[0]="All"
    strMainMenu[1]="Weapons"
    strMainMenu[2]="Gear"
    strMainMenu[3]="Skills"
    strMainMenu[4]="Items"
    strSubMenuNewAndHot[0]="All"
    strSubMenuNewAndHot[1]="Best"
    strSubMenuNewAndHot[2]="New"
    strSubMenuNewAndHot[3]="Hot"
    strSubMenuWeapon[0]="All"
    strSubMenuWeapon[1]="Primary"
    strSubMenuWeapon[2]="Secondary"
    strSubMenuWeapon[3]="Thrown"
    strSubMenuEquip[0]="All"
    strSubMenuEquip[1]="Helmets"
    strSubMenuEquip[2]="Faces"
    strSubMenuEquip[3]="Accessories"
    strSubMenuEquip[4]="Characters"
    strSubMenuSpecial[0]="All"
    strSubMenuSpecial[1]="Attack"
    strSubMenuSpecial[2]="Passive"
    strSubMenuCashItem[0]="All"
    strSubMenuCashItem[1]="Other"
    // Referen[0]ce: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPStoreWeaponHK.mTabControl2'
    begin object name="mTabControl2" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0000000,Y1=137.0000000,X2=1014.0000000,Y2=558.0000000)
    fbTPItemList=(X1=517.0000000,Y1=167.0000000,X2=1011.0000000,Y2=515.0000000)
    strMenuButton[0]="Buy Cash"
    strMenuButton[1]="Gift"
    strMenuButton[2]="Buy"
    fbMenuButton[0]=(X1=715.0000000,Y1=520.0000000,X2=809.0000000,Y2=552.0000000)
    fbMenuButton[1]=(X1=813.0000000,Y1=520.0000000,X2=907.0000000,Y2=552.0000000)
    fbMenuButton[2]=(X1=911.0000000,Y1=520.0000000,X2=1004.0000000,Y2=552.0000000)
    OnPreDraw=BTTPStoreWeaponHK.Internal_OnPreDraw
}