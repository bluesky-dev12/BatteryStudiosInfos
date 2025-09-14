/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPStoreWeaponHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:52
 *	Functions:46
 *
 *******************************************************************************/
class BTTPStoreWeaponHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTTcpLink_Channel TcpChannel;
var DragObject DragBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups InvenGroup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonWeapon[7];
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
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[5];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMenuButton[3];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[3];
var export editinline BTItemInfoHorzBoxHK InfoBox;
var int CurrentRepairMode;
var int EquipItemCount;
var array<int> EquipItemList;
var array<int> InvenItemList;
var string SaveWebzenBuyItemName;
var delegate<deleShowCashChargeWindow> __deleShowCashChargeWindow__Delegate;

function bool Internal_OnPreDraw(Canvas C)
{
    ChangeVisibleModel(bVisibleAFModel);
    UIModel.cModel = CharacterModel;
    // End:0x3b
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();
    }
    // End:0x53
    else
    {
        // End:0x53
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
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
}

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(true);
    CharacterModel.ChangeTeam(0);
    return true;
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(false);
    CharacterModel.ChangeTeam(1);
    return true;
}

function bool MainButton_OnClick(GUIComponent Sender)
{
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
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
}

function bool ImageListBox_OnHover(GUIComponent Sender)
{
    return false;
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local int HelmetID[2], BodyID, FaceID, AcceID;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo, cItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wPartsGroupParam tmParam;
    local wGameManager GameMgr;
    local wWeaponCustomInfoParam wcParam;
    local int PartsID;

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
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo;
    // End:0x134
    if(ItemInfo == none)
    {
        return false;
    }
    cItemInfo = none;
    InfoBox.SetData(ItemInfo, instanceInfo, cItemInfo, none);
    // End:0x1a1
    if(instanceInfo != none && instanceInfo.CashItemInfo != none)
    {
        InfoBox.ItemBoxView.itemBox.ChangeState(17);
    }
    // End:0x1c4
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
    // End:0x351
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemType))
    {
        CharacterModel.ChangeWeapon(ItemInfo.ItemID);
        PartsID = 0;
        wcParam = GameMgr.GetWeaponCustomInfoParam(ItemInfo.ItemID);
        // End:0x33a
        if(wcParam != none)
        {
            PartsID = wcParam.iDefaultBarrelUniID | wcParam.iDefaultGunstockUniID | wcParam.iDefaultSightUniID | wcParam.iDefaultSilencerUniID;
        }
        CharacterModel.ChangeWeaponsParts(PartsID);
    }
    // End:0x77e
    else
    {
        // End:0x41f
        if(GameMgr.CheckHeadItem(ItemInfo.ItemType))
        {
            // End:0x3a3
            if(BodyID[0] == CharacterModel.default.BodyID[0])
            {
                HelmetID[0] = ItemInfo.ItemID;
            }
            // End:0x3d5
            if(BodyID[1] == CharacterModel.default.BodyID[1])
            {
                HelmetID[1] = ItemInfo.ItemID;
            }
            CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
        }
        // End:0x77e
        else
        {
            // End:0x4ed
            if(GameMgr.CheckFaceItem(ItemInfo.ItemType))
            {
                // End:0x471
                if(BodyID[0] == CharacterModel.default.BodyID[0])
                {
                    FaceID[0] = ItemInfo.ItemID;
                }
                // End:0x4a3
                if(BodyID[1] == CharacterModel.default.BodyID[1])
                {
                    FaceID[1] = ItemInfo.ItemID;
                }
                CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
            }
            // End:0x77e
            else
            {
                // End:0x5bb
                if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType))
                {
                    // End:0x53f
                    if(BodyID[0] == CharacterModel.default.BodyID[0])
                    {
                        AcceID[0] = ItemInfo.ItemID;
                    }
                    // End:0x571
                    if(BodyID[1] == CharacterModel.default.BodyID[1])
                    {
                        AcceID[1] = ItemInfo.ItemID;
                    }
                    CharacterModel.ChangeEquipItemByID(BodyID[0], BodyID[1], FaceID[0], FaceID[1], HelmetID[0], HelmetID[1], AcceID[0], AcceID[1]);
                }
                // End:0x77e
                else
                {
                    // End:0x77e
                    if(GameMgr.CheckSpCharItem(ItemInfo.ItemType))
                    {
                        // End:0x68a
                        if(ItemInfo.EquipTeam == 1)
                        {
                            BodyID[0] = ItemInfo.ItemID;
                            tmParam = Controller.ViewportOwner.Actor.Level.GameMgr.GetDefaultAddPartsGroupParam(BodyID[0]);
                            FaceID[0] = tmParam.iChar_FaceID;
                            HelmetID[0] = tmParam.iChar_HeadID;
                            AcceID[0] = tmParam.iChar_AccessoryID;
                        }
                        // End:0x737
                        else
                        {
                            // End:0x737
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
}

function bool ItemList_OnBeginDrag(GUIComponent Sender)
{
    local BTROItemBoxHK Box;

    Log("ItemList_OnBeginDrag");
    Box = BTROItemBoxHK(TPItemList.ItemList.GetSelectItem());
    // End:0xcd
    if(Sender.bDropSource == true && DragBox.IsDragging() == false && Box.CheckIn(Controller.MouseX, Controller.MouseY))
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), Box);
        return true;
    }
    return false;
}

function ItemList_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ItemList_OnEndDrag" @ string(Sender));
    // End:0x5f
    if(Sender.Class == class'BTItemBoxButtonHK')
    {
        InvenGroup.SelectButton(BTItemBoxButtonHK(Sender).ButtonID);
        EquipItem();
    }
    DragBox.EndDrag();
}

function bool ButtonWeapon_OnBeginDrag(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    Log("ButtonWeapon_OnBeginDrag");
    btn = BTItemBoxButtonHK(Sender);
    // End:0xc4
    if(btn.bDropSource == true && DragBox.IsDragging() == false && btn.itemBox.ItemInfo != none)
    {
        DragBox.BeginDrag(int(Controller.MouseX), int(Controller.MouseY), btn.itemBox, btn.ButtonID);
        return true;
    }
    return false;
}

function ButtonWeapon_OnEndDrag(GUIComponent Sender, bool bAccepted)
{
    Log("ButtonWeapon_OnEndDrag" @ string(Sender));
    // End:0x3e
    if(Sender.Class == class'BTItemBoxButtonHK')
    {
    }
    // End:0x5e
    else
    {
        // End:0x5e
        if(Sender != none)
        {
            UnequipItem(DragBox.GetOptionalIndex());
        }
    }
    DragBox.EndDrag();
}

function bool ButtonWeapon_OnClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    InvenGroup.SelectButton(btn.ButtonID);
    InfoBox.SetData(ButtonWeapon[btn.ButtonID].itemBox.ItemInfo, ButtonWeapon[btn.ButtonID].itemBox.instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
    return true;
}

function bool ButtonWeapon_OnDblClick(GUIComponent Sender)
{
    local export editinline BTItemBoxButtonHK btn;

    btn = BTItemBoxButtonHK(Sender);
    UnequipItem(btn.ButtonID);
    return true;
}

function bool BTWindowSendPresentHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowSendPresentHK BTWindow;
    local wItemBoxCashHK cii;
    local wMatchMaker MM;
    local wGameManager GameMgr;
    local int ProductNo;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log("[BTTPStoreWeaponHK::BTWindowSendPresentHK_OnOK]");
    BTWindow = BTWindowSendPresentHK(Controller.TopPage());
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    BTWindow.ButtonOK.DisableMe();
    // End:0x2b8
    if(cii != none)
    {
        // End:0x172
        if(MM.kChannelingType != 0)
        {
            BTWindow.StopTimeOut();
            BTWindow.ButtonOK.DisableMe();
            BTWindow.ButtonCancel.DisableMe();
            BTWindow.StartTimeOut(10.0);
            BTWindow.__OnTimeOut__Delegate = BTWindowSendPresentHK_OnTimeOut;
        }
        ProductNo = GameMgr.GetGP20ProductNo(BTWindow.ItemID, cii.WZCashPrice[BTWindow.BuyOpt[0] - 1], BTWindow.cashType);
        // End:0x2b5
        if(ProductNo != -1)
        {
            Log("TcpChannel.sfReqGiftItemByWebzenCashGP20(" $ BTWindow.EditReceiveUser.TextStr $ ", " $ BTWindow.EditContent.TextStr $ ", " $ string(ProductNo) $ ", " $ string(BTWindow.cashType) $ ")");
            TcpChannel.sfReqGiftItemByWebzenCashGP20(BTWindow.EditReceiveUser.TextStr, BTWindow.EditContent.TextStr, ProductNo, BTWindow.cashType);
        }
    }
    // End:0x3cd
    else
    {
        Log("TcpChannel.sfReqSendGift(" $ string(BTWindow.ItemID) $ ", " $ BTWindow.EditReceiveUser.TextStr $ ", " $ BTWindow.EditContent.TextStr $ ", " $ string(BTWindow.BuyOpt[0]) $ ", " $ string(BTWindow.BuyOpt[0]) $ ")");
        TcpChannel.sfReqSendGift(BTWindow.ItemID, BTWindow.EditReceiveUser.TextStr, BTWindow.EditContent.TextStr, byte(BTWindow.BuyOpt[0]), byte(BTWindow.BuyOpt[0]));
    }
    return true;
}

function bool BTWindowItemBuyHK_ButtonRechargeCash_OnOK(GUIComponent Sender)
{
    deleShowCashChargeWindow();
    return true;
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
    BTWindowSendPresentHK(Controller.TopPage()).SetCashType(BTWindow.cashType);
    return true;
}

function bool BTWindowItemBuyHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBuyHK BTWindow;
    local wItemBoxHK ib;
    local wItemBoxCashHK cii;
    local array<int> temp;
    local wMatchMaker MM;
    local wGameManager gm;
    local int ProductNo;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    BTWindow = BTWindowItemBuyHK(Controller.TopPage());
    ib = BTWindow.ro.ItemInfo;
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    // End:0x105
    if(MM.kLevel < ib.EquipLevel)
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
        return true;
    }
    // End:0x1f5
    if(BTWindow.ItemInfo.IsCashItem() == true)
    {
        // End:0x1f2
        if(BTWindow.cashType == 0 && MM.kCash - cii.WZCashPrice[BTWindow.OptionDay - 1] < 0 || BTWindow.cashType == 1 && MM.kCCoinCash - cii.WZCashPrice[BTWindow.OptionDay - 1] < 0)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 205);
            class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowItemBuyHK');
            return true;
        }
    }
    // End:0x265
    else
    {
        // End:0x265
        if(MM.kPoint - BTWindow.ItemInfo.PointPrice[BTWindow.OptionDay - 1] < 0)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 204);
            class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowItemBuyHK');
            return true;
        }
    }
    // End:0x38a
    if(BTWindow.ItemInfo.CostType == 4)
    {
        // End:0x38a
        if(gm.FindFirstInstanceItemByItemID(BTWindow.ItemID) != none)
        {
            Controller.ReplaceMenu2("GUIWarfareControls.BTWindowItemBuyTerm");
            BTWindowItemBuyTerm(Controller.TopPage()).SetRenderObject(BTWindow.ro);
            BTWindowItemBuyTerm(Controller.TopPage()).SetOptionDay(byte(BTWindow.OptionDay));
            BTWindowItemBuyTerm(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyTerm_OnOK;
            BTWindowItemBuyTerm(Controller.TopPage()).SetCashType(BTWindow.cashType);
            return true;
        }
    }
    // End:0x474
    if(cii != none)
    {
        GetCashItemInfo(temp, ib, cii);
        ProductNo = gm.GetGP20ProductNo(BTWindow.ItemID, cii.WZCashPrice[BTWindow.OptionDay - 1], BTWindow.cashType);
        // End:0x471
        if(ProductNo != -1)
        {
            Log("sfReqBuyItemByWebzenCashGP20(" $ string(ProductNo) $ "," $ string(BTWindow.cashType));
            TcpChannel.sfReqBuyItemByWebzenCashGP20(ProductNo, BTWindow.cashType, UnresolvedNativeFunction_99(0));
        }
    }
    // End:0x549
    else
    {
        Log("sfReqBuyShopItem(" $ string(BTWindow.ItemID) $ " " $ BTWindow.ItemInfo.ItemName $ " / OptionDay :" $ string(BTWindow.OptionDay));
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade);
        TcpChannel.sfReqBuyShopItem(BTWindow.ItemID, UnresolvedNativeFunction_99(0), byte(BTWindow.OptionDay), 0);
    }
    Controller.CloseMenu(false);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowItemBuyHK_OnTimeOut;
    return true;
}

function BTWindowItemBuyHK_OnTimeOut(GUIComponent Sender)
{
    class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowItemBuyHK');
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 182);
}

function BTWindowSendPresentHK_OnTimeOut(GUIComponent Sender)
{
    class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowSendPresentHK');
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 183);
}

delegate deleShowCashChargeWindow();
function bool MenuButton_OnClick(GUIComponent Sender)
{
    local BTROItemBoxHK ro;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    ro = BTROItemBoxHK(TPItemList.ItemList.GetLastSelectedItem());
    // End:0xe0
    if(ro.ItemInfo.CostType == 1 || ro.ItemInfo.CostType == 4)
    {
        // End:0xe0
        if(ro.ItemInfo.Period[0] == 0 && ro.ItemInfo.AdType > 0)
        {
            return false;
        }
    }
    switch(btn.ButtonID)
    {
        // End:0x101
        case 0:
            deleShowCashChargeWindow();
            // End:0x17c
            break;
        // End:0x115
        case 1:
            ShowItemBuyWindow(ro, 1, 0);
            // End:0x17c
            break;
        // End:0x179
        case 2:
            // End:0x15c
            if(MM.kLevel < ro.ItemInfo.EquipLevel)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 60);
                return true;
            }
            // End:0x169
            if(ro == none)
            {
                return true;
            }
            ShowItemBuyWindow(ro, 0, 0);
            // End:0x17c
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool BTWindowItemBuyTerm_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowItemBuyTerm BTWindow;
    local wItemBoxHK ib;
    local wItemBoxCashHK cii;
    local array<int> temp;
    local wMatchMaker MM;
    local wGameManager GameMgr;
    local int ProductNo;

    BTWindow = BTWindowItemBuyTerm(Controller.TopPage());
    ib = BTWindow.ro.ItemInfo;
    cii = BTWindow.ro.instanceInfo.CashItemInfo;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x1ac
    if(cii != none)
    {
        GetCashItemInfo(temp, ib, cii);
        ProductNo = GameMgr.GetGP20ProductNo(BTWindow.ItemID, cii.WZCashPrice[BTWindow.OptionDay - 1], byte(BTWindow.cashType));
        // End:0x1a9
        if(ProductNo != -1)
        {
            Log("sfReqBuyItemByWebzenCashGP20(" $ string(ProductNo) $ "," $ string(BTWindow.cashType));
            TcpChannel.sfReqBuyItemByWebzenCashGP20(ProductNo, byte(BTWindow.cashType), UnresolvedNativeFunction_99(0));
        }
    }
    // End:0x25b
    else
    {
        Log("sfReqBuyShopItem(" $ string(BTWindow.ItemID) $ " " $ BTWindow.ItemInfo.ItemName);
        MM.SetLastBuyItemInfo(ib.ItemName, ib.ItemType, ib.Grade);
        TcpChannel.sfReqBuyShopItem(BTWindow.ItemID, UnresolvedNativeFunction_99(0), BTWindow.OptionDay, 1);
    }
    class'BTWindowHK'.static.CloseWindowAllByName(Controller, class'BTWindowItemBuyTerm');
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 21, MM.lastBuyItemName);
    BTWindowHK(Controller.TopPage()).StopTimeOut();
    BTWindowHK(Controller.TopPage()).StartTimeOut(10.0);
    BTWindowHK(Controller.TopPage()).ButtonOK.DisableMe();
    BTWindowHK(Controller.TopPage()).__OnTimeOut__Delegate = BTWindowItemBuyHK_OnTimeOut;
    return true;
}

function GetCashItemInfo(out array<int> temp, wItemBoxHK ib, wItemBoxCashHK cii)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    temp.Length = 1;
    temp[0] = ib.ItemID;
    MM.SetLastBuyItemInfo(cii.WZItemName, ib.ItemType, ib.Grade);
}

function bool CheckValidItem(wItemBoxHK ItemInfo, wItemBoxInstanceHK instnaceinfo)
{
    // End:0xb4
    if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4 && instnaceinfo != none)
    {
        // End:0x86
        if(instnaceinfo.CashItemInfo != none)
        {
            // End:0x83
            if(instnaceinfo.CashItemInfo.WZPeriod[0] == 0 && ItemInfo.AdType > 0)
            {
                return false;
            }
        }
        // End:0xb4
        else
        {
            // End:0xb4
            if(ItemInfo.Period[0] == 0 && ItemInfo.AdType > 0)
            {
                return false;
            }
        }
    }
    return true;
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3b
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;
    }
    // End:0x5d
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
}

function bool FindAndRemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8c [While If]
    if(i < 9)
    {
        // End:0x82
        if(ButtonWeapon[i].itemBox.instanceInfo != none && UnresolvedNativeFunction_99(ButtonWeapon[i].itemBox.instanceInfo.UniqueID, UniqueID))
        {
            ButtonWeapon[i].SetData(none, none);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
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
            // End:0x8f
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x8f
            break;
        // End:0x6b
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x8f
            break;
        // End:0x7e
        case 4:
            ChangeSubButton(astrSubMenuCashItem);
            // End:0x8f
            break;
        // End:0xffff
        default:
            ChangeSubButton(astrSubMenuNewAndHot);
            // End:0x8f Break;
            break;
    }
    ChangeItemList(tabi, subtabi);
    ChatBox.MultiColumnList.MyScrollBar.SetVisibility(false);
    ChatBox.MultiColumnBox.MyScrollBar.SetVisibility(false);
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
                TPItemList.ItemList.ShowShopItemAdNew();
                // End:0x93
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowShopItemAdHot();
                // End:0x93
                break;
            // End:0x90
            case 3:
                TPItemList.ItemList.ShowShopItemAdBest();
                // End:0x93
                break;
            // End:0xffff
            default:
                // End:0x28f Break;
                break;
            }
    }
    // End:0x12c
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0xc7
            case 0:
                TPItemList.ItemList.ShowWeaponAll();
                // End:0x129
                break;
            // End:0xe6
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
            // End:0xffff
            default:
                // End:0x28f Break;
                break;
            }
    }
    // End:0x1e3
    if(mainTab == 2)
    {
        switch(subTab)
        {
            // End:0x15e
            case 0:
                TPItemList.ItemList.ShowEquipItem();
                // End:0x1e0
                break;
            // End:0x17d
            case 1:
                TPItemList.ItemList.ShowEquipSpCharItem();
                // End:0x1e0
                break;
            // End:0x19d
            case 2:
                TPItemList.ItemList.ShowEquipHeadItem();
                // End:0x1e0
                break;
            // End:0x1bd
            case 3:
                TPItemList.ItemList.ShowEquipFaceItem();
                // End:0x1e0
                break;
            // End:0x1dd
            case 4:
                TPItemList.ItemList.ShowEquipAccessoryItem();
                // End:0x1e0
                break;
            // End:0xffff
            default:
                // End:0x28f Break;
                break;
            }
    }
    // End:0x25a
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
            // End:0xffff
            default:
                // End:0x28f Break;
                break;
            }
    }
    // End:0x28f
    if(mainTab == 4)
    {
        switch(subTab)
        {
            // End:0x28c
            case 0:
                TPItemList.ItemList.ShowCashItem();
                // End:0x28f
                break;
            // End:0xffff
            default:
            }
            SetInfoBox();
}

function bool ChangeSubButton(array<string> strTemp)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x57 [While If]
    if(i < strTemp.Length)
    {
        SubButton[i].SetVisibility(true);
        SubButton[i].Caption = strTemp[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = strTemp.Length;
    J0x63:
    // End:0xa6 [While If]
    if(i < 5)
    {
        SubButton[i].SetVisibility(false);
        SubButton[i].Caption = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    return true;
}

function EquipItem()
{
    local int currentSlot;
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[ItemList.LastSelectedItemIndex]).instanceInfo;
    // End:0xc9
    if(!GameMgr.CheckQuickSlotItem(ItemInfo.ItemType))
    {
        return;
    }
    currentSlot = InvenGroup.GetSelectIndex();
    // End:0x11e
    if(GameMgr.CheckMainWeaponItem(ItemInfo.ItemID) && currentSlot != 0)
    {
        InvenGroup.SelectButton(0);
    }
    // End:0x3ac
    else
    {
        // End:0x15e
        if(GameMgr.CheckPistolItem(ItemInfo.ItemType) && currentSlot != 1)
        {
            InvenGroup.SelectButton(1);
        }
        // End:0x3ac
        else
        {
            // End:0x273
            if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
            {
                // End:0x211
                if(currentSlot != 2 && currentSlot != 3)
                {
                    // End:0x1cc
                    if(ButtonWeapon[2].itemBox.ItemInfo == none)
                    {
                        InvenGroup.SelectButton(2);
                    }
                    // End:0x211
                    else
                    {
                        // End:0x200
                        if(ButtonWeapon[3].itemBox.ItemInfo == none)
                        {
                            InvenGroup.SelectButton(3);
                        }
                        // End:0x211
                        else
                        {
                            InvenGroup.SelectButton(2);
                        }
                    }
                }
                currentSlot = InvenGroup.GetSelectIndex();
                // End:0x24b
                if(currentSlot == 2 && instanceInfo.SlotPosition == 3)
                {
                    return;
                }
                // End:0x270
                if(currentSlot == 3 && instanceInfo.SlotPosition == 2)
                {
                    return;
                }
            }
            // End:0x3ac
            else
            {
                // End:0x2b5
                if(GameMgr.CheckHeadItem(ItemInfo.ItemType) && currentSlot != 4)
                {
                    InvenGroup.SelectButton(4);
                }
                // End:0x3ac
                else
                {
                    // End:0x2f7
                    if(GameMgr.CheckFaceItem(ItemInfo.ItemType) && currentSlot != 5)
                    {
                        InvenGroup.SelectButton(5);
                    }
                    // End:0x3ac
                    else
                    {
                        // End:0x339
                        if(GameMgr.CheckAccessoryItem(ItemInfo.ItemType) && currentSlot != 6)
                        {
                            InvenGroup.SelectButton(6);
                        }
                        // End:0x3ac
                        else
                        {
                            // End:0x37b
                            if(GameMgr.CheckSpCharItem(ItemInfo.ItemType) && currentSlot != 7)
                            {
                                InvenGroup.SelectButton(7);
                            }
                            // End:0x3ac
                            else
                            {
                                // End:0x3ac
                                if(GameMgr.CheckLvMark(ItemInfo.ItemType))
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
    // End:0x424
    if(currentSlot < 4)
    {
        // End:0x3e7
        if(currentSlot == instanceInfo.SlotPosition)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, InvenGroup.GetSelectIndex());
    }
    // End:0x488
    else
    {
        // End:0x446
        if(currentSlot == instanceInfo.SlotPosition - 18 + 4)
        {
            return;
        }
        TcpChannel.sfReqEquipItem(instanceInfo.ItemID, instanceInfo.UniqueID, InvenGroup.GetSelectIndex() + 18 - 4);
    }
}

function UnequipItem(int ButtonID)
{
    local export editinline BTItemBoxButtonHK ib;

    ib = ButtonWeapon[ButtonID];
    // End:0x7f
    if(ib.itemBox.instanceInfo != none)
    {
        TcpChannel.sfReqEquipItem(ib.itemBox.instanceInfo.ItemID, ib.itemBox.instanceInfo.UniqueID, 13);
    }
}

function fill(array<int> ShopItemList)
{
    local int i, j, ProductCode;
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local GP20Product GP20Product;
    local bool showItem;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyPoint = MM.kPoint;
    TPItemList.MyData.MyCash = MM.kCash;
    TPItemList.ItemList.ClearItem();
    i = 0;
    J0xf0:
    // End:0x306 [While If]
    if(i < ShopItemList.Length)
    {
        ro = new class'BTROItemBoxHK';
        ro.Init();
        ro.ItemInfo = GameMgr.FindUIItem(ShopItemList[i]);
        // End:0x1a3
        if(ro.ItemInfo == none)
        {
            ro.ItemInfo = new class'wItemBoxHK';
            ro.ItemInfo.ItemName = "ItemID=" $ string(ShopItemList[i]);
        }
        ro.SetGameManager(GameMgr);
        ro.SetMatchMaker(MM);
        ro.ChangeState(6);
        // End:0x20f
        if(GameMgr.FindFirstInstanceItemByItemID(ShopItemList[i]) != none)
        {
            ro.RibbonState = 1;
        }
        // End:0x2a2
        else
        {
            // End:0x241
            if(ro.ItemInfo.AdType == 2)
            {
                ro.RibbonState = 3;
            }
            // End:0x2a2
            else
            {
                // End:0x273
                if(ro.ItemInfo.AdType == 3)
                {
                    ro.RibbonState = 2;
                }
                // End:0x2a2
                else
                {
                    // End:0x2a2
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf0;
    }
    i = 0;
    J0x30d:
    // End:0x54e [While If]
    if(i < GameMgr.kGP20ProductList.Length)
    {
        GP20Product = GameMgr.kGP20ProductList[i];
        showItem = class'wItemBoxCashHK'.static.IsShowStore(GP20Product);
        // End:0x369
        if(!showItem)
        {
        }
        // End:0x544
        else
        {
            ro = new class'BTROItemBoxHK';
            ro.Init();
            ProductCode = int(GP20Product.ProductCode);
            ro.ItemInfo = GameMgr.FindUIItem(ProductCode);
            ro.ItemInfo.PurchaseType = 1;
            ro.instanceInfo = new class'wItemBoxInstanceHK';
            ro.instanceInfo.CashItemInfo = new class'wItemBoxCashHK';
            ro.instanceInfo.CashItemInfo.SetCashItemInfo(ro.ItemInfo, GP20Product, class'BTWindowDefineInfoHK'.static.GetClientString(122));
            // End:0x481
            if(GP20Product.SaleMasterFlag == GameMgr.16)
            {
                ro.RibbonState = 3;
            }
            // End:0x4d9
            else
            {
                // End:0x4ae
                if(GP20Product.SaleMasterFlag == GameMgr.1)
                {
                    ro.RibbonState = 2;
                }
                // End:0x4d9
                else
                {
                    // End:0x4d9
                    if(GP20Product.SaleMasterFlag == GameMgr.8)
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
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x30d;
    }
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.ItemList.ImageList.__OnHover__Delegate = ImageListBox_OnHover;
    TPItemList.ItemList.ShowShopItemAll();
    AddSubMenuBtns();
}

function AddSubMenuBtns()
{
    local int i, Count;
    local BTROItemBoxHK ro;
    local BTItemListMenuBtn temp;
    local bool disGift;

    temp = new class'BTItemListMenuBtn';
    TPItemList.ItemList.SubMenuBtn.Length = 0;
    i = 0;
    J0x30:
    // End:0x247 [While If]
    if(i < TPItemList.ItemList.DataList.Length)
    {
        ro = BTROItemBoxHK(TPItemList.ItemList.DataList[i]);
        // End:0x9b
        if(ro.ItemInfo.AdType >= 10)
        {
        }
        // End:0x23d
        else
        {
            // End:0x23d
            if(ro.ItemInfo.AdType >= 1 || ro.instanceInfo.CashItemInfo != none)
            {
                // End:0x23d
                if(TPItemList.ItemList.bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    TPItemList.ItemList.isHaveSubMenuBtn = true;
                    TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
                    // End:0x1b6
                    if(ro.instanceInfo.CashItemInfo != none)
                    {
                        disGift = !ro.instanceInfo.CashItemInfo.bWZCanGift;
                    }
                    // End:0x1be
                    else
                    {
                        disGift = true;
                    }
                    TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.3, disGift);
                    TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.4, false);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
}

function SetInfoBox(optional int Index)
{
    // End:0x0d
    if(Index < 0)
    {
        return;
    }
    // End:0xe4
    if(TPItemList.ItemList.DataList.Length > 0)
    {
        InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).instanceInfo, none, none);
        InfoBox.ItemBoxView.itemBox.ChangeState(7);
        InfoBox.ItemBoxView.itemBox.MyData = TPItemList.MyData;
    }
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
    // End:0xcd [While If]
    if(i < 4)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xac
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
        }
        // End:0xc3
        else
        {
            ButtonWeapon[i].SetData(none, none);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    i = 4;
    J0xd5:
    // End:0x174 [While If]
    if(i < 7)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i - 4 + 18);
        // End:0x153
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
        }
        // End:0x16a
        else
        {
            ButtonWeapon[i].SetData(none, none);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd5;
    }
}

function InitializeLeftPanel()
{
    local int i;

    EdgeLine = new class'BTOwnerDrawImageHK';
    EdgeLine.bUseAWinPos = true;
    EdgeLine.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 332.0, 728.0);
    EdgeLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_edge_line;
    EdgeLine.InitComponent(Controller, self);
    AppendComponent(EdgeLine);
    AFTeamBG = new class'BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    AFTeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.10;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new class'BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    RSATeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.10;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(303), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(56), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(25), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(143), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(166), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(283), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    i = 0;
    J0x50c:
    // End:0x60f [While If]
    if(i < 7)
    {
        ButtonWeapon[i] = new class'BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(19);
        InvenGroup.AddButton(ButtonWeapon[i]);
        ButtonWeapon[i].CaptionPadding[1] = 2;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x50c;
    }
    ButtonWeapon[2].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[3].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_hlmt;
    ButtonWeapon[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_face;
    ButtonWeapon[6].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_gogl;
    ButtonWeapon[7].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[8].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[9].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_class;
    i = 0;
    J0x716:
    // End:0x760 [While If]
    if(i < 7)
    {
        ButtonWeapon[i].__OnClick__Delegate = ButtonWeapon_OnClick;
        ButtonWeapon[i].__OnDblClick__Delegate = ButtonWeapon_OnDblClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x716;
    }
    ChatBox = new class'BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(22.0, 666.0 + float(18), 324.0, 720.0);
    ChatBox.RenderWeight = 0.710;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    UIModel = new class'BTModelHK';
    UIModel.bAcceptsInput = false;
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0);
    UIModel.RenderWeight = 0.70;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
}

function InitializeRightPanel()
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i, MenuLen;
    local wMatchMaker MM;

    LabelItemList = new class'BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new class'BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    TPItemList.ItemList.bShopItem = true;
    TPItemList.ItemList.BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_store_in;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MenuLen = 5;
    i = 0;
    J0x14d:
    // End:0x37d [While If]
    if(i < MenuLen)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 510.0 + float(100 * i) + float(i);
        fb.Y1 = 114.0;
        fb.X2 = 510.0 + float(100 * i + 1) + float(i);
        fb.Y2 = 114.0 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        // End:0x2ab
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14d;
    }
    i = 0;
    J0x384:
    // End:0x62b [While If]
    if(i < 5)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = 510.0 + float(7) + float(81 * i) + float(i);
        fb.Y1 = 114.0 + float(5) + float(23);
        fb.X2 = 510.0 + float(7) + float(81 * i + 1) + float(i);
        fb.Y2 = 114.0 + float(5) + float(23) + float(20);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_m_n;
        serverButton.buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], TPItemList);
        SubButton[i].ButtonID = i;
        SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x384;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new class'BTItemInfoHorzBoxHK';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0;
    fb.Y1 = 564.0;
    fb.X2 = 510.0 + float(504);
    fb.Y2 = 564.0 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    i = 0;
    J0x6f9:
    // End:0x81c [While If]
    if(i < 3)
    {
        MenuButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        MenuButton[i].Caption = strMenuButton[i];
        MenuButton[i].bUseAWinPos = true;
        MenuButton[i].AWinPos = fbMenuButton[i];
        MenuButton[i].SetFontSizeAll(12);
        MenuButton[i].SetDefaultFontColor();
        MenuButton[i].SetDefaultButtonImage();
        MenuButton[i].RenderWeight = 0.60;
        MenuButton[i].ButtonID = i;
        MenuButton[i].InitComponent(Controller, self);
        AppendComponent(MenuButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6f9;
    }
    astrSubMenuNewAndHot.Length = 4;
    i = 0;
    J0x82c:
    // End:0x85d [While If]
    if(i < astrSubMenuNewAndHot.Length)
    {
        astrSubMenuNewAndHot[i] = strSubMenuNewAndHot[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x82c;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x86d:
    // End:0x89e [While If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x86d;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x8ae:
    // End:0x8df [While If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8ae;
    }
    i = 0;
    J0x8e6:
    // End:0x916 [While If]
    if(i < 4 - 1)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8e6;
    }
    astrSubMenuCashItem.Length = 1;
    i = 0;
    J0x925:
    // End:0x956 [While If]
    if(i < astrSubMenuCashItem.Length)
    {
        astrSubMenuCashItem[i] = strSubMenuCashItem[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x925;
    }
    ChangeSubButton(astrSubMenuNewAndHot);
    i = 0;
    J0x968:
    // End:0x998 [While If]
    if(i < 3)
    {
        MenuButton[i].__OnClick__Delegate = MenuButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x968;
    }
}

function InitializeDragAndDrop()
{
    local int i;
    local export editinline BTItemBoxButtonHK btn;

    DragBox = new class'DragObject';
    DragBox.Init();
    i = 0;
    J0x25:
    // End:0x96 [While If]
    if(i < 7)
    {
        btn = ButtonWeapon[i];
        btn.bDropSource = true;
        btn.bDropTarget = true;
        btn.__OnBeginDrag__Delegate = ButtonWeapon_OnBeginDrag;
        btn.__OnEndDrag__Delegate = ButtonWeapon_OnEndDrag;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    TPItemList.ItemList.ImageList.bCaptureMouse = true;
    TPItemList.ItemList.ImageList.bDropSource = true;
    TPItemList.ItemList.ImageList.bDropTarget = true;
    TPItemList.ItemList.ImageList.__OnBeginDrag__Delegate = ItemList_OnBeginDrag;
    TPItemList.ItemList.ImageList.__OnEndDrag__Delegate = ItemList_OnEndDrag;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
}

function bool ShowItemBuyWindow(BTROItemBoxHK ro, int buyType, int cashType)
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowItemBuyHK");
    BTWindowItemBuyHK(Controller.TopPage()).SetData(ro.ItemInfo.ItemID, ro.MyData.MyPoint, ro.MyData.MyCash, ro.MyData.MyCCoinCash, ro.ItemInfo, byte(cashType));
    BTWindowItemBuyHK(Controller.TopPage()).SetRenderObject(ro);
    // End:0x174
    if(buyType == 0)
    {
        BTWindowItemBuyHK(Controller.TopPage()).TopLine.Caption = strForMe[0];
        BTWindowItemBuyHK(Controller.TopPage()).ButtonOK.Caption = strForMe[1];
        BTWindowItemBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyHK_OnOK;
    }
    // End:0x1fe
    else
    {
        // End:0x1fe
        if(buyType == 1)
        {
            BTWindowItemBuyHK(Controller.TopPage()).TopLine.Caption = strForGift[0];
            BTWindowItemBuyHK(Controller.TopPage()).ButtonOK.Caption = strForGift[1];
            BTWindowItemBuyHK(Controller.TopPage()).__OnOK__Delegate = BTWindowItemBuyHK_BeforePresent_OnOK;
        }
    }
    BTWindowItemBuyHK(Controller.TopPage()).ButtonRechargeCash.__OnClick__Delegate = BTWindowItemBuyHK_ButtonRechargeCash_OnOK;
}

defaultproperties
{
    InvenGroup=mgroups
    begin object name=mBackgroundImage class=BTStretchedImageHK
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPStoreWeaponHK.mBackgroundImage'
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
    strSubMenuNewAndHot[1]="New"
    strSubMenuNewAndHot[2]="Cool"
    strSubMenuNewAndHot[3]="Best"
    strSubMenuWeapon[0]="All"
    strSubMenuWeapon[1]="Primary"
    strSubMenuWeapon[2]="Secondary"
    strSubMenuWeapon[3]="Thrown"
    strSubMenuEquip[0]="All"
    strSubMenuEquip[1]="Characters"
    strSubMenuEquip[2]="Helmets"
    strSubMenuEquip[3]="Faces"
    strSubMenuEquip[4]="Accessories"
    strSubMenuSpecial[0]="All"
    strSubMenuSpecial[1]="Attack"
    strSubMenuSpecial[2]="Passive"
    strSubMenuCashItem[0]="All"
    strSubMenuCashItem[1]="Other"
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0,Y1=137.0,X2=1014.0,Y2=558.0)
    fbTPItemList=(X1=517.0,Y1=167.0,X2=1011.0,Y2=515.0)
    strMenuButton[0]="Buy Cash"
    strMenuButton[1]="Gift"
    strMenuButton[2]="Buy"
    fbMenuButton[0]=(X1=715.0,Y1=520.0,X2=809.0,Y2=552.0)
    fbMenuButton[1]=(X1=813.0,Y1=520.0,X2=907.0,Y2=552.0)
    fbMenuButton[2]=(X1=911.0,Y1=520.0,X2=1004.0,Y2=552.0)
    OnPreDraw=Internal_OnPreDraw
}