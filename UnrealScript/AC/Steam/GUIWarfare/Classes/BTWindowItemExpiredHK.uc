/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTWindowItemExpiredHK.uc
 * Package Imports:
 *	GUIWarfare
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Structs:1
 *	Properties:35
 *	Functions:25
 *
 *******************************************************************************/
class BTWindowItemExpiredHK extends BTWindowHK
    editinlinenew
    instanced;

enum eExpiredBuyType
{
    EBT_NONE,
    EBT_PCOIN,
    EBT_CCOIN,
    EBT_POINT
};

struct BuyExpriedCashInfo
{
    var array<int> CashElements;
};

var int SavePoint;
var int saveLevel;
var int saveCash;
var int saveCCoin;
var export editinline BTNetMainMenu MainMenu;
var BTTcpLink_Channel TcpChannel;
var int MyPoint;
var int myLevel;
var int MyCash;
var int MyCCoin;
var int RepairSumCost;
var int RepairSumCash;
var int RepairSumCCoin;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelDivider[2];
var export editinline BTOwnerDrawImageHK LabelDivider[2];
var localized string strLabel[5];
var localized string strPoint;
var localized string strCash;
var localized string strCCoin;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelEdit[9];
var export editinline BTOwnerDrawImageHK Label[5];
var export editinline BTOwnerDrawImageHK LabelEdit[9];
var localized string strButtonSelectAll[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonSelectAll;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSelectAll;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbNEditBox[9];
var export editinline BTNumericEditBoxHK NEditBox[9];
var array<int> BuyExpiredItemList;
var array<int> BuyExpiredSlotPosList;
var BuyExpriedCashInfo BuyExpiredCashInfoList[4];
var array<BtrDouble> BuyExpiredUniqueList;
var array<int> selectCashType;

function PushExpiredItemID(int ItemID, BtrDouble UniqueID, int CategoryID, int PackageID, int PriceID, int SlotPos, int cashType)
{
    BuyExpiredItemList.Length = BuyExpiredItemList.Length + 1;
    BuyExpiredItemList[BuyExpiredItemList.Length - 1] = ItemID;
    BuyExpiredSlotPosList.Length = BuyExpiredSlotPosList.Length + 1;
    BuyExpiredSlotPosList[BuyExpiredSlotPosList.Length - 1] = SlotPos;
    BuyExpiredUniqueList.Length = BuyExpiredSlotPosList.Length + 1;
    BuyExpiredUniqueList[BuyExpiredUniqueList.Length - 1] = UniqueID;
    BuyExpiredCashInfoList[0].CashElements.Length = BuyExpiredCashInfoList[0].CashElements.Length + 1;
    BuyExpiredCashInfoList[0].CashElements[BuyExpiredCashInfoList[0].CashElements.Length - 1] = CategoryID;
    BuyExpiredCashInfoList[1].CashElements.Length = BuyExpiredCashInfoList[1].CashElements.Length + 1;
    BuyExpiredCashInfoList[1].CashElements[BuyExpiredCashInfoList[1].CashElements.Length - 1] = PackageID;
    BuyExpiredCashInfoList[2].CashElements.Length = BuyExpiredCashInfoList[2].CashElements.Length + 1;
    BuyExpiredCashInfoList[2].CashElements[BuyExpiredCashInfoList[2].CashElements.Length - 1] = PriceID;
    BuyExpiredCashInfoList[3].CashElements.Length = BuyExpiredCashInfoList[3].CashElements.Length + 1;
    BuyExpiredCashInfoList[3].CashElements[BuyExpiredCashInfoList[3].CashElements.Length - 1] = cashType;
}

function int PopExpiredItemID()
{
    local int ItemID;

    // End:0x12
    if(BuyExpiredItemList.Length == 0)
    {
        return -1;
    }
    ItemID = BuyExpiredItemList[BuyExpiredItemList.Length - 1];
    BuyExpiredItemList.Length = BuyExpiredItemList.Length - 1;
    return ItemID;
}

function BtrDouble PopExpiredUniqueID()
{
    local BtrDouble UniqueID;

    // End:0x13
    if(BuyExpiredUniqueList.Length == 0)
    {
        return EmptyBtrDouble();
    }
    UniqueID = BuyExpiredUniqueList[BuyExpiredUniqueList.Length - 1];
    BuyExpiredUniqueList.Length = BuyExpiredUniqueList.Length - 1;
    return UniqueID;
}

function PopExpiredCashInfo(out int iCategoryID, out int iPackageID, out int iPriceID, out int cashType)
{
    local int iValue[4], lp1, lp2;

    lp1 = 0;
    J0x07:
    // End:0xaa [While If]
    if(lp1 < 4)
    {
        // End:0x4d
        if(BuyExpiredCashInfoList[lp1].CashElements.Length == 0)
        {
            iPriceID = -1;
            iPackageID = -1;
            iCategoryID = -1;
            return;
        }
        lp2 = BuyExpiredCashInfoList[lp1].CashElements.Length - 1;
        iValue[lp1] = BuyExpiredCashInfoList[lp1].CashElements[lp2];
        BuyExpiredCashInfoList[lp1].CashElements.Length = lp2;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    iCategoryID = iValue[0];
    iPackageID = iValue[1];
    iPriceID = iValue[2];
    // End:0xfd
    if(iValue[3] == 1)
    {
        cashType = class'wItemBoxCashHK'.static.PCoinType();
    }
    // End:0x114
    else
    {
        cashType = class'wItemBoxCashHK'.static.CCoinType();
    }
}

function int PopExpiredSlotPos()
{
    local int SlotPos;

    // End:0x12
    if(BuyExpiredSlotPosList.Length == 0)
    {
        return -1;
    }
    SlotPos = BuyExpiredSlotPosList[BuyExpiredSlotPosList.Length - 1];
    BuyExpiredSlotPosList.Length = BuyExpiredSlotPosList.Length - 1;
    return SlotPos;
}

function bool ButtonSelectAll_OnClick(GUIComponent Sender)
{
    local int i;
    local wGameManager gm;
    local int iItemType;

    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    RepairSumCost = 0;
    RepairSumCash = 0;
    RepairSumCCoin = 0;
    i = 0;
    J0x4b:
    // End:0x1f6 [While If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xa9
        if(TPItemList.ItemList.DataPool[i].ItemInfo.EquipLevel > myLevel)
        {
        }
        // End:0x1ec
        else
        {
            iItemType = gm.GetItemType(TPItemList.ItemList.DataPool[i].ItemInfo, TPItemList.ItemList.DataPool[i].instanceInfo);
            // End:0x12a
            if(bool(iItemType & gm.FlagBuyShop) == false)
            {
            }
            // End:0x1ec
            else
            {
                TPItemList.ItemList.DataPool[i].bSelect = true;
                // End:0x1b4
                if(bool(iItemType & gm.FlagCash) == true)
                {
                    RepairSumCash += TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZCashPrice[0];
                }
                // End:0x1ec
                else
                {
                    RepairSumCost += TPItemList.ItemList.DataPool[i].ItemInfo.PointPrice[0];
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    UpdateNEditBox();
    TPItemList.ItemList.ShowItemAll();
    ButtonSelectAll.Caption = strButtonSelectAll[1];
    ButtonSelectAll.__OnClick__Delegate = ButtonNonSelectAll_OnClick;
    return true;
}

function bool ButtonNonSelectAll_OnClick(GUIComponent Sender)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5c [While If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        TPItemList.ItemList.DataPool[i].bSelect = false;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    RepairSumCost = 0;
    RepairSumCash = 0;
    RepairSumCCoin = 0;
    UpdateNEditBox();
    TPItemList.ItemList.ShowItemAll();
    ButtonSelectAll.Caption = strButtonSelectAll[0];
    ButtonSelectAll.__OnClick__Delegate = ButtonSelectAll_OnClick;
    return true;
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local int i, ReservedItemID;
    local BtrDouble ReservedUniqueID;
    local int ReservedCategoryID, ReservedPackageID, ReservedPriceID;
    local array<int> temp;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log("BTWindowItemExpiredHK::ButtonOK_OnClick]");
    i = 0;
    J0x62:
    // End:0x4cf [While If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0x158
        if(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID == 0)
        {
            ReservedItemID = GameMgr.GetQuickSlotIndexOfBoxItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID);
            // End:0x120
            if(ReservedItemID != -1)
            {
                MainMenu.UpdateSendQuickSlotIndex(ReservedItemID);
            }
            ReservedUniqueID = TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID;
        }
        // End:0x209
        else
        {
            temp = GameMgr.GetQuickSlotIndexOfBoxSkillItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
            ReservedItemID = 0;
            J0x1a3:
            // End:0x1d1 [While If]
            if(ReservedItemID < temp.Length)
            {
                MainMenu.UpdateSendQuickSlotIndex(ReservedItemID);
                ++ ReservedItemID;
                // This is an implied JumpToken; Continue!
                goto J0x1a3;
            }
            ReservedUniqueID = UnresolvedNativeFunction_99(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
        }
        // End:0x411
        if(TPItemList.ItemList.DataPool[i].bSelect)
        {
            // End:0x38b
            if(TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo != none)
            {
                PushExpiredItemID(TPItemList.ItemList.DataPool[i].ItemInfo.ItemID, ReservedUniqueID, TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZCategorySeq, TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZPackageSeq[0], TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZPriceSeq[0], TPItemList.ItemList.DataPool[i].instanceInfo.SlotPosition, selectCashType[i]);
            }
            // End:0x40e
            else
            {
                PushExpiredItemID(TPItemList.ItemList.DataPool[i].ItemInfo.ItemID, ReservedUniqueID, -1, -1, -1, TPItemList.ItemList.DataPool[i].instanceInfo.SlotPosition, selectCashType[i]);
            }
        }
        // End:0x4c5
        else
        {
            // End:0x487
            if(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID == 0)
            {
                GameMgr.RemoveQuickSlotBoxItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID);
            }
            // End:0x4c5
            else
            {
                GameMgr.RemoveQuickSlotBoxSkillItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    ReservedItemID = PopExpiredItemID();
    // End:0x50c
    if(ReservedItemID == -1)
    {
        Controller.CloseMenu(false);
        MainMenu.CheckDestroyedDurabilityXItemList();
    }
    // End:0x517
    else
    {
        PopAndBuy(ReservedItemID);
    }
    return true;
}

function RemoveAllExpiredItem()
{
    local wGameManager GameMgr;
    local int i;
    local wItemBoxHK ItemInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log("BTWindowItemExpiredHK::RemoveAllExpiredItem]");
    i = 0;
    J0x66:
    // End:0x105 [While If]
    if(i < BuyExpiredUniqueList.Length)
    {
        ItemInfo = GameMgr.FindUIItem(BuyExpiredItemList[i]);
        // End:0xfb
        if(ItemInfo != none)
        {
            // End:0xe1
            if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
            {
                GameMgr.RemoveQuickSlotBoxSkillItem(UnresolvedNativeFunction_99(BuyExpiredUniqueList[i]));
            }
            // End:0xfb
            else
            {
                GameMgr.RemoveQuickSlotBoxItem(BuyExpiredUniqueList[i]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x66;
    }
    GameMgr.UpdateItemList(GameMgr);
    MainMenu.UpdateExpiredItemList(MainMenu);
}

function RemoveAllItem()
{
    local wGameManager GameMgr;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log("BTWindowItemExpiredHK::RemoveAllItem]");
    i = 0;
    J0x5f:
    // End:0x13f [While If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xf7
        if(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID == 0)
        {
            GameMgr.RemoveQuickSlotBoxItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID);
        }
        // End:0x135
        else
        {
            GameMgr.RemoveQuickSlotBoxSkillItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    GameMgr.UpdateItemList(GameMgr);
    MainMenu.UpdateExpiredItemList(MainMenu);
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("BTWindowItemExpiredHK::ButtonCancel_OnClick]");
    RemoveAllItem();
    // End:0x9d
    if(MainMenu.iSendUpdateQuickSlotList.Length > 0)
    {
        MainMenu.RequestUpdateQuickSlot(MainMenu.iSendUpdateQuickSlotList[MainMenu.iSendUpdateQuickSlotList.Length - 1]);
        MainMenu.iSendUpdateQuickSlotList.Length = MainMenu.iSendUpdateQuickSlotList.Length - 1;
    }
    Controller.CloseMenu(false);
    MainMenu.CheckDestroyedDurabilityXItemList();
    return true;
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    return false;
}

function UpdateNEditBox()
{
    NEditBox[0].SetDataExtra(RepairSumCost, strPoint);
    NEditBox[1].SetDataExtra(MyPoint, strPoint);
    NEditBox[2].SetDataExtra(MyPoint - RepairSumCost, strPoint);
    NEditBox[3].SetDataExtra(RepairSumCash, strCash);
    NEditBox[4].SetDataExtra(MyCash, strCash);
    NEditBox[5].SetDataExtra(MyCash - RepairSumCash, strCash);
    NEditBox[6].SetDataExtra(RepairSumCCoin, strCCoin);
    NEditBox[7].SetDataExtra(MyCCoin, strCCoin);
    NEditBox[8].SetDataExtra(MyCCoin - RepairSumCCoin, strCCoin);
    NEditBox[1].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    NEditBox[3].SetFontColorAll(class'BTUIColorPoolHK'.static.Cash());
    // End:0x186
    if(MyPoint - RepairSumCost < 0)
    {
        NEditBox[2].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultRed());
    }
    // End:0x1a7
    else
    {
        NEditBox[2].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    }
    // End:0x1dd
    if(MyCash - RepairSumCash < 0)
    {
        NEditBox[5].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultRed());
    }
    // End:0x1fe
    else
    {
        NEditBox[5].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    }
    // End:0x234
    if(MyCCoin - RepairSumCCoin < 0)
    {
        NEditBox[8].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultRed());
    }
    // End:0x255
    else
    {
        NEditBox[8].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    }
    // End:0x2bc
    if(RepairSumCost + RepairSumCash + RepairSumCCoin == 0 || MyPoint - RepairSumCost < 0 || MyCash - RepairSumCash < 0 || MyCCoin - RepairSumCCoin < 0)
    {
        ButtonOK.DisableMe();
    }
    // End:0x2cb
    else
    {
        ButtonOK.EnableMe();
    }
}

function SetCurrentPoint(int MyPoint)
{
    self.MyPoint = MyPoint;
    UpdateNEditBox();
}

function SetCurrentCash(int MyCash)
{
    self.MyCash = MyCash;
    UpdateNEditBox();
}

function SetCurrentLevel(int myLevel)
{
    self.myLevel = myLevel;
    UpdateNEditBox();
}

function SetCurrentCCoin(int MyCCoin)
{
    self.MyCCoin = MyCCoin;
    UpdateNEditBox();
}

function AddItem(int ItemID, BtrDouble UniqueItemID, int UniqueSkillID, int PartID, int SlotPosition)
{
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = new class'BTROItemBoxHK';
    ro.Init();
    instanceInfo = new class'wItemBoxInstanceHK';
    ro.ItemInfo = GameMgr.FindUIItem(ItemID);
    instanceInfo.PartID = PartID;
    instanceInfo.ItemState = 1;
    instanceInfo.SlotPosition = SlotPosition;
    instanceInfo.UniqueID = UniqueItemID;
    instanceInfo.UniqueSkillID = UniqueSkillID;
    ro.instanceInfo = instanceInfo;
    // End:0x14d
    if(ro.ItemInfo.IsCashItem() == true)
    {
        GameMgr.AddCashItem(ro.ItemInfo, ro.instanceInfo, class'BTWindowDefineInfoHK'.static.GetClientString(122));
    }
    ro.SetGameManager(GameMgr);
    ro.ChangeState(15);
    ro.MyData = TPItemList.MyData;
    ro.Update();
    TPItemList.ItemList.AddItem(ro);
    selectCashType.Length = selectCashType.Length + 1;
    selectCashType[selectCashType.Length - 1] = 0;
    TPItemList.ItemList.ShowItemAll();
}

function AddSubMenuBtn()
{
    local int Count, iItemType;
    local BTItemListMenuBtn temp;
    local wGameManager gm;
    local BTROItemBoxHK ro;

    TPItemList.ItemList.SubMenuBtn.Length = 0;
    TPItemList.ItemList.isHaveSubMenuBtn = true;
    temp = new class'BTItemListMenuBtn';
    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    Count = 0;
    J0x79:
    // End:0x32e [While If]
    if(Count < TPItemList.ItemList.DataList.Length)
    {
        ro = BTROItemBoxHK(TPItemList.ItemList.DataList[Count]);
        iItemType = gm.GetItemType(ro.ItemInfo, ro.instanceInfo);
        TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
        // End:0x2aa
        if(bool(iItemType & gm.FlagBuyShop) == true)
        {
            // End:0x22d
            if(ro.ItemInfo.IsCashItem() == true)
            {
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.7, !ro.instanceInfo.CashItemInfo.EnablePCoin);
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.8, !ro.instanceInfo.CashItemInfo.EnableCCoin);
            }
            // End:0x2a7
            else
            {
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
                TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.9, false);
            }
        }
        // End:0x324
        else
        {
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
            TPItemList.ItemList.AddSubMenuBtn(ro.ItemInfo.ItemID, temp.10, true);
        }
        ++ Count;
        // This is an implied JumpToken; Continue!
        goto J0x79;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wGameManager GameMgr;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPItemList = BTTPItemListHK(NewComponent(new class'BTTPItemListHK', fbTPItemList));
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.MyData.myLevel = 999;
    TPItemList.MyData.MyCash = 99999;
    TPItemList.MyData.MyPoint = 99999;
    TopLine.CaptionDrawType = 4;
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.Expired_Deco_Img;
    TPItemList.ItemList.SetItemSize(236, 86);
    TPItemList.ItemList.SetItemCountPerPage(4, 2);
    TPItemList.ItemList.ImageList.MyScrollBar.Step = 2;
    TPItemList.ItemList.ImageList.MyScrollBar.ItemsPerPage = 8;
    TPItemList.ItemList.bIgnoreMouseOnState = true;
    TPItemList.ItemList.bIgnoreFocusedState = true;
    i = 0;
    J0x1d4:
    // End:0x24c [While If]
    if(i < 5)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d4;
    }
    Label[0].CaptionDrawType = 4;
    Label[1].CaptionDrawType = 4;
    Label[2].CaptionDrawType = 5;
    Label[3].CaptionDrawType = 5;
    Label[4].CaptionDrawType = 5;
    Label[i].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    i = 1;
    J0x2d9:
    // End:0x313 [While If]
    if(i < 5)
    {
        Label[i].SetFontColorAll(class'BTUIColorPoolHK'.static.newButtonN());
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2d9;
    }
    i = 0;
    J0x31a:
    // End:0x401 [While If]
    if(i < 9)
    {
        NEditBox[i] = new class'BTNumericEditBoxHK';
        NEditBox[i].bUseAWinPos = true;
        NEditBox[i].AWinPos = fbNEditBox[i];
        NEditBox[i].CaptionDrawType = 5;
        NEditBox[i].SetDefaultNonSelectFontColor();
        NEditBox[i].InitComponent(MyController, self);
        AppendComponent(NEditBox[i]);
        NEditBox[i].SetData(0);
        NEditBox[i].bReadOnly = true;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31a;
    }
    NEditBox[0].SetFontColorAll(class'BTUIColorPoolHK'.static.Point());
    NEditBox[1].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    NEditBox[3].SetFontColorAll(class'BTUIColorPoolHK'.static.Cash());
    NEditBox[4].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    NEditBox[6].SetFontColorAll(class'BTUIColorPoolHK'.static.Cash());
    NEditBox[7].SetFontColorAll(class'BTUIColorPoolHK'.static.DefaultWhite());
    i = 3;
    J0x4cd:
    // End:0x4fd [While If]
    if(i < 6)
    {
        LabelEdit[i].Caption = strCash;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4cd;
    }
    TPItemList.ItemList.ShowItemAll();
    TPItemList.ItemList.bIgnoreFocusedState = true;
    UpdateNEditBox();
    __OnOK__Delegate = ButtonOK_OnClick;
    __OnCancel__Delegate = ButtonCancel_OnClick;
}

function InternalOnOpen()
{
    SavePoint = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kPoint;
    saveLevel = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kLevel;
    saveCash = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCash;
    saveCCoin = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCCoinCash;
    SetCurrentPoint(SavePoint);
    SetCurrentLevel(saveLevel);
    SetCurrentCash(saveCash);
    SetCurrentCCoin(saveCCoin);
}

function bool Internal_OnPreDraw(Canvas C)
{
    TimeOutPreDraw(C);
    // End:0x8c
    if(SavePoint != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kPoint)
    {
        SavePoint = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kPoint;
        SetCurrentPoint(SavePoint);
    }
    // End:0x10d
    if(saveLevel != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kLevel)
    {
        saveLevel = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kLevel;
        SetCurrentLevel(saveLevel);
    }
    // End:0x18e
    if(saveCash != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCash)
    {
        saveCash = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCash;
        SetCurrentCash(saveCash);
    }
    // End:0x20f
    if(saveCCoin != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCCoinCash)
    {
        saveCCoin = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCCoinCash;
        SetCurrentCCoin(saveCCoin);
    }
    CheckSubBtn();
    return true;
}

function CheckSubBtn()
{
    local int i, ListIndex;
    local BTItemListMenuBtn temp;
    local BTROItemBoxHK ro;
    local bool selectState;

    i = 0;
    J0x07:
    // End:0x309 [While If]
    if(i < TPItemList.ItemList.SubMenuBtn.Length)
    {
        ListIndex = i / 3;
        temp = TPItemList.ItemList.SubMenuBtn[i];
        ro = BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]);
        // End:0x15b
        if(temp.ClickBtnIndex == temp.7)
        {
            selectState = CalculateCashSelect(ListIndex, ro, 1);
            // End:0xf0
            if(selectState)
            {
                RepairSumCash += ro.instanceInfo.CashItemInfo.WZCashPrice[0];
            }
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]).bSelect = selectState;
            UpdateNEditBox();
            // This is an implied JumpToken;
            goto J0x309;
        }
        // End:0x2ff
        else
        {
            // End:0x233
            if(temp.ClickBtnIndex == temp.8)
            {
                selectState = CalculateCashSelect(ListIndex, ro, 2);
                // End:0x1c8
                if(selectState)
                {
                    RepairSumCCoin += ro.instanceInfo.CashItemInfo.WZCashPrice[0];
                }
                TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]).bSelect = selectState;
                UpdateNEditBox();
                // This is an implied JumpToken;
                goto J0x309;
            }
            // End:0x2ff
            else
            {
                // End:0x2ff
                if(temp.ClickBtnIndex == temp.9)
                {
                    selectState = CalculateCashSelect(ListIndex, ro, 3);
                    // End:0x297
                    if(selectState)
                    {
                        RepairSumCost += ro.ItemInfo.PointPrice[0];
                    }
                    TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
                    BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]).bSelect = selectState;
                    UpdateNEditBox();
                }
                // End:0x309
                else
                {
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function PopAndBuy(int ReservedItemID)
{
    local int ReservedCategoryID, ReservedPackageID, ReservedPriceID, ReservedCashType;
    local array<int> temp;
    local wGameManager GameMgr;
    local int ProductNo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    PopExpiredCashInfo(ReservedCategoryID, ReservedPackageID, ReservedPriceID, ReservedCashType);
    // End:0x9e
    if(ReservedCategoryID == -1)
    {
        Log("sfReqBuyShopItem(" $ string(ReservedItemID));
        MainMenu.TcpChannel.sfReqBuyShopItem(ReservedItemID, UnresolvedNativeFunction_99(0), 1, 1);
    }
    // End:0x148
    else
    {
        temp.Length = 1;
        temp[0] = ReservedItemID;
        ProductNo = GameMgr.GetGP20ProductNo(ReservedItemID, ReservedPriceID, byte(ReservedCashType));
        // End:0x148
        if(ProductNo != -1)
        {
            Log("sfReqBuyItemByWebzenCashGP20(" $ string(ProductNo) $ "," $ string(ReservedCashType));
            MainMenu.TcpChannel.sfReqBuyItemByWebzenCashGP20(ProductNo, byte(ReservedCashType), UnresolvedNativeFunction_99(0));
        }
    }
}

function bool CalculateCashSelect(int ListIndex, BTROItemBoxHK ro, int cashType)
{
    local bool bIncreaseCash;

    bIncreaseCash = false;
    // End:0xce
    if(ro.bSelect)
    {
        // End:0x5a
        if(selectCashType[ListIndex] == 1)
        {
            RepairSumCash -= ro.instanceInfo.CashItemInfo.WZCashPrice[0];
        }
        // End:0xce
        else
        {
            // End:0x9a
            if(selectCashType[ListIndex] == 2)
            {
                RepairSumCCoin -= ro.instanceInfo.CashItemInfo.WZCashPrice[0];
            }
            // End:0xce
            else
            {
                // End:0xce
                if(selectCashType[ListIndex] == 3)
                {
                    RepairSumCost -= ro.ItemInfo.PointPrice[0];
                }
            }
        }
    }
    // End:0xff
    if(selectCashType[ListIndex] != cashType)
    {
        selectCashType[ListIndex] = cashType;
        bIncreaseCash = true;
    }
    // End:0x10f
    else
    {
        selectCashType[ListIndex] = 0;
    }
    return bIncreaseCash;
}

defaultproperties
{
    fbTPItemList=(X1=275.0,Y1=143.0,X2=777.0,Y2=493.0)
    fbLabelDivider[0]=(X1=341.0,Y1=213.0,X2=683.0,Y2=215.0)
    fbLabelDivider[1]=(X1=341.0,Y1=477.0,X2=683.0,Y2=479.0)
    strLabel[0]="These items have expired and were destroyed."
    strLabel[1]="Buy an item again?"
    strLabel[2]="Item Price"
    strLabel[3]="Funds"
    strLabel[4]="Balance"
    strPoint="Points"
    strCash="W Coin(P)"
    strCCoin="W Coin(C)"
    fbLabel[0]=(X1=326.0,Y1=106.0,X2=698.0,Y2=119.0)
    fbLabel[1]=(X1=326.0,Y1=122.0,X2=698.0,Y2=135.0)
    fbLabel[2]=(X1=152.0,Y1=535.0,X2=283.0,Y2=548.0)
    fbLabel[3]=(X1=152.0,Y1=565.0,X2=283.0,Y2=578.0)
    fbLabel[4]=(X1=152.0,Y1=595.0,X2=283.0,Y2=608.0)
    strButtonSelectAll[0]="Select All"
    strButtonSelectAll[1]="Deselect All"
    fbNEditBox[0]=(X1=292.0,Y1=534.0,X2=465.0,Y2=549.0)
    fbNEditBox[1]=(X1=292.0,Y1=564.0,X2=465.0,Y2=579.0)
    fbNEditBox[2]=(X1=292.0,Y1=594.0,X2=465.0,Y2=609.0)
    fbNEditBox[3]=(X1=476.0,Y1=534.0,X2=649.0,Y2=549.0)
    fbNEditBox[4]=(X1=476.0,Y1=564.0,X2=649.0,Y2=579.0)
    fbNEditBox[5]=(X1=476.0,Y1=594.0,X2=649.0,Y2=609.0)
    fbNEditBox[6]=(X1=660.0,Y1=534.0,X2=833.0,Y2=549.0)
    fbNEditBox[7]=(X1=660.0,Y1=564.0,X2=833.0,Y2=579.0)
    fbNEditBox[8]=(X1=660.0,Y1=594.0,X2=833.0,Y2=609.0)
    fbBackgroundImage=(X1=145.0,Y1=68.0,X2=879.0,Y2=684.0)
    fbTopLine=(X1=362.0,Y1=74.0,X2=662.0,Y2=89.0)
    fbButtonOK=(X1=387.0,Y1=631.0,X2=511.0,Y2=668.0)
    fbButtonCancel=(X1=513.0,Y1=631.0,X2=637.0,Y2=668.0)
    strTitle="Expired"
    strOK="Buy"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnPreDraw=Internal_OnPreDraw
}