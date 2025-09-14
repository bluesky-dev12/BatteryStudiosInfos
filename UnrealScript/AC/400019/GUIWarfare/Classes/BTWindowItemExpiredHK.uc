class BTWindowItemExpiredHK extends BTWindowHK
    editinlinenew
    instanced;

enum eExpiredBuyType
{
    EBT_NONE,                       // 0
    EBT_CCOIN,                      // 1
    EBT_PCOIN,                      // 2
    EBT_POINT                       // 3
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
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() automated FloatBox fbLabelDivider[2];
var export editinline BTOwnerDrawImageHK LabelDivider[2];
var localized string strLabel[5];
var localized string strPoint;
var localized string strCash;
var localized string strCCoin;
var() automated FloatBox fbLabel[5];
var() automated FloatBox fbLabelEdit[9];
var export editinline BTOwnerDrawImageHK Label[5];
var export editinline BTOwnerDrawImageHK LabelEdit[9];
var localized string strButtonSelectAll[2];
var() automated FloatBox fbButtonSelectAll;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSelectAll;
var() automated FloatBox fbNEditBox[9];
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
    //return;    
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
    //return;    
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
    //return;    
}

function PopExpiredCashInfo(out int iCategoryID, out int iPackageID, out int iPriceID, out int cashType)
{
    local int iValue[4], lp1, lp2;

    lp1 = 0;
    J0x07:

    // End:0xAA [Loop If]
    if(lp1 < 4)
    {
        // End:0x4D
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
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    iCategoryID = iValue[0];
    iPackageID = iValue[1];
    iPriceID = iValue[2];
    // End:0xFD
    if(iValue[3] == int(2))
    {
        cashType = int(Class'Engine.wItemBoxCashHK'.static.PCoinType());        
    }
    else
    {
        cashType = int(Class'Engine.wItemBoxCashHK'.static.CCoinType());
    }
    //return;    
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
    //return;    
}

function bool ButtonSelectAll_OnClick(GUIComponent Sender)
{
    local int i;
    local wGameManager GM;
    local int iItemType;

    GM = Controller.ViewportOwner.Actor.Level.GameMgr;
    RepairSumCost = 0;
    RepairSumCash = 0;
    RepairSumCCoin = 0;
    i = 0;
    J0x4B:

    // End:0x1F6 [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xA9
        if(TPItemList.ItemList.DataPool[i].ItemInfo.EquipLevel > myLevel)
        {
            // [Explicit Continue]
            goto J0x1EC;
        }
        iItemType = GM.GetItemType(TPItemList.ItemList.DataPool[i].ItemInfo, TPItemList.ItemList.DataPool[i].instanceInfo);
        // End:0x12A
        if(bool(iItemType & GM.FlagBuyShop) == false)
        {
            // [Explicit Continue]
            goto J0x1EC;
        }
        TPItemList.ItemList.DataPool[i].bSelect = true;
        // End:0x1B4
        if(bool(iItemType & GM.FlagCash) == true)
        {
            RepairSumCash += TPItemList.ItemList.DataPool[i].instanceInfo.cashItemInfo.WZCashPrice[0];
            // [Explicit Continue]
            goto J0x1EC;
        }
        RepairSumCost += TPItemList.ItemList.DataPool[i].ItemInfo.PointPrice[0];
        J0x1EC:

        i++;
        // [Loop Continue]
        goto J0x4B;
    }
    UpdateNEditBox();
    TPItemList.ItemList.ShowItemAll();
    ButtonSelectAll.Caption = strButtonSelectAll[1];
    ButtonSelectAll.__OnClick__Delegate = ButtonNonSelectAll_OnClick;
    return true;
    //return;    
}

function bool ButtonNonSelectAll_OnClick(GUIComponent Sender)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5C [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        TPItemList.ItemList.DataPool[i].bSelect = false;
        i++;
        // [Loop Continue]
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
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local int i, ReservedItemID;
    local BtrDouble ReservedUniqueID;
    local array<int> temp;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log("BTWindowItemExpiredHK::ButtonOK_OnClick]");
    i = 0;
    J0x62:

    // End:0x4CD [Loop If]
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
        else
        {
            temp = GameMgr.GetQuickSlotIndexOfBoxSkillItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
            ReservedItemID = 0;
            J0x1A3:

            // End:0x1D1 [Loop If]
            if(ReservedItemID < temp.Length)
            {
                MainMenu.UpdateSendQuickSlotIndex(ReservedItemID);
                ++ReservedItemID;
                // [Loop Continue]
                goto J0x1A3;
            }
            ReservedUniqueID = __NFUN_921__(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
        }
        // End:0x40F
        if(TPItemList.ItemList.DataPool[i].bSelect)
        {
            // End:0x389
            if(TPItemList.ItemList.DataPool[i].instanceInfo.cashItemInfo != none)
            {
                PushExpiredItemID(TPItemList.ItemList.DataPool[i].ItemInfo.ItemID, ReservedUniqueID, TPItemList.ItemList.DataPool[i].instanceInfo.cashItemInfo.WZCategorySeq, TPItemList.ItemList.DataPool[i].instanceInfo.cashItemInfo.WZPackageSeq, TPItemList.ItemList.DataPool[i].instanceInfo.cashItemInfo.WZPriceSeq[0], TPItemList.ItemList.DataPool[i].instanceInfo.SlotPosition, selectCashType[i]);                
            }
            else
            {
                PushExpiredItemID(TPItemList.ItemList.DataPool[i].ItemInfo.ItemID, ReservedUniqueID, -1, -1, -1, TPItemList.ItemList.DataPool[i].instanceInfo.SlotPosition, selectCashType[i]);
            }
            // [Explicit Continue]
            goto J0x4C3;
        }
        // End:0x485
        if(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID == 0)
        {
            GameMgr.RemoveQuickSlotBoxItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID);
            // [Explicit Continue]
            goto J0x4C3;
        }
        GameMgr.RemoveQuickSlotBoxSkillItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
        J0x4C3:

        i++;
        // [Loop Continue]
        goto J0x62;
    }
    ReservedItemID = PopExpiredItemID();
    // End:0x50A
    if(ReservedItemID == -1)
    {
        Controller.CloseMenu(false);
        MainMenu.CheckDestroyedDurabilityXItemList();        
    }
    else
    {
        PopAndBuy(ReservedItemID);
    }
    return true;
    //return;    
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

    // End:0x105 [Loop If]
    if(i < BuyExpiredUniqueList.Length)
    {
        ItemInfo = GameMgr.FindUIItem(BuyExpiredItemList[i]);
        // End:0xFB
        if(ItemInfo != none)
        {
            // End:0xE1
            if(GameMgr.CheckSkillItem(ItemInfo.ItemType))
            {
                GameMgr.RemoveQuickSlotBoxSkillItem(__NFUN_923__(BuyExpiredUniqueList[i]));
                // [Explicit Continue]
                goto J0xFB;
            }
            GameMgr.RemoveQuickSlotBoxItem(BuyExpiredUniqueList[i]);
        }
        J0xFB:

        i++;
        // [Loop Continue]
        goto J0x66;
    }
    GameMgr.UpdateItemList(GameMgr);
    MainMenu.UpdateExpiredItemList(MainMenu);
    //return;    
}

function RemoveAllItem()
{
    local wGameManager GameMgr;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Log("BTWindowItemExpiredHK::RemoveAllItem]");
    i = 0;
    J0x5F:

    // End:0x13F [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xF7
        if(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID == 0)
        {
            GameMgr.RemoveQuickSlotBoxItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID);
            // [Explicit Continue]
            goto J0x135;
        }
        GameMgr.RemoveQuickSlotBoxSkillItem(TPItemList.ItemList.DataPool[i].instanceInfo.UniqueSkillID);
        J0x135:

        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    GameMgr.UpdateItemList(GameMgr);
    MainMenu.UpdateExpiredItemList(MainMenu);
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("BTWindowItemExpiredHK::ButtonCancel_OnClick]");
    RemoveAllItem();
    // End:0x9D
    if(MainMenu.iSendUpdateQuickSlotList.Length > 0)
    {
        MainMenu.RequestUpdateQuickSlot(MainMenu.iSendUpdateQuickSlotList[MainMenu.iSendUpdateQuickSlotList.Length - 1]);
        MainMenu.iSendUpdateQuickSlotList.Length = MainMenu.iSendUpdateQuickSlotList.Length - 1;
    }
    Controller.CloseMenu(false);
    MainMenu.CheckDestroyedDurabilityXItemList();
    return true;
    //return;    
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    return false;
    //return;    
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
    NEditBox[1].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    NEditBox[3].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.Cash());
    // End:0x186
    if((MyPoint - RepairSumCost) < 0)
    {
        NEditBox[2].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultRed());        
    }
    else
    {
        NEditBox[2].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    }
    // End:0x1DD
    if((MyCash - RepairSumCash) < 0)
    {
        NEditBox[5].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultRed());        
    }
    else
    {
        NEditBox[5].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    }
    // End:0x234
    if((MyCCoin - RepairSumCCoin) < 0)
    {
        NEditBox[8].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultRed());        
    }
    else
    {
        NEditBox[8].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    }
    // End:0x2BC
    if((((((RepairSumCost + RepairSumCash) + RepairSumCCoin) == 0) || (MyPoint - RepairSumCost) < 0) || (MyCash - RepairSumCash) < 0) || (MyCCoin - RepairSumCCoin) < 0)
    {
        ButtonOK.DisableMe();        
    }
    else
    {
        ButtonOK.EnableMe();
    }
    //return;    
}

function SetCurrentPoint(int MyPoint)
{
    self.MyPoint = MyPoint;
    UpdateNEditBox();
    //return;    
}

function SetCurrentCash(int MyCash)
{
    self.MyCash = MyCash;
    UpdateNEditBox();
    //return;    
}

function SetCurrentLevel(int myLevel)
{
    self.myLevel = myLevel;
    UpdateNEditBox();
    //return;    
}

function SetCurrentCCoin(int MyCCoin)
{
    self.MyCCoin = MyCCoin;
    UpdateNEditBox();
    //return;    
}

function AddItem(int ItemID, BtrDouble UniqueItemID, int UniqueSkillID, int PartID, int SlotPosition)
{
    local wGameManager GameMgr;
    local BTROItemBoxHK Ro;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Ro = new Class'GUIWarfareControls.BTROItemBoxHK';
    Ro.Init();
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    Ro.ItemInfo = GameMgr.FindUIItem(ItemID);
    instanceInfo.PartID = PartID;
    instanceInfo.ItemState = 1;
    instanceInfo.SlotPosition = SlotPosition;
    instanceInfo.UniqueID = UniqueItemID;
    instanceInfo.UniqueSkillID = UniqueSkillID;
    Ro.instanceInfo = instanceInfo;
    // End:0x14D
    if(Ro.ItemInfo.IsCashItem() == true)
    {
        GameMgr.AddCashItem(Ro.ItemInfo, Ro.instanceInfo, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetClientString(122));
    }
    Ro.SetGameManager(GameMgr);
    Ro.ChangeState(15);
    Ro.MyData = TPItemList.MyData;
    Ro.Update();
    TPItemList.ItemList.AddItem(Ro);
    selectCashType.Length = selectCashType.Length + 1;
    selectCashType[selectCashType.Length - 1] = int(0);
    TPItemList.ItemList.ShowItemAll();
    //return;    
}

function AddSubMenuBtn()
{
    local int Count, iItemType;
    local BTItemListMenuBtn temp;
    local wGameManager GM;
    local BTROItemBoxHK Ro;

    TPItemList.ItemList.SubMenuBtn.Length = 0;
    TPItemList.ItemList.isHaveSubMenuBtn = true;
    temp = new Class'GUIWarfareControls.BTItemListMenuBtn';
    GM = Controller.ViewportOwner.Actor.Level.GameMgr;
    Count = 0;
    J0x79:

    // End:0x32E [Loop If]
    if(Count < TPItemList.ItemList.DataList.Length)
    {
        Ro = BTROItemBoxHK(TPItemList.ItemList.DataList[Count]);
        iItemType = GM.GetItemType(Ro.ItemInfo, Ro.instanceInfo);
        TPItemList.ItemList.AddSubMenuBtn(Ro.ItemInfo.ItemID, int(temp.10), true);
        // End:0x2AA
        if(bool(iItemType & GM.FlagBuyShop) == true)
        {
            // End:0x22D
            if(Ro.ItemInfo.IsCashItem() == true)
            {
                TPItemList.ItemList.AddSubMenuBtn(Ro.ItemInfo.ItemID, int(temp.7), !Ro.instanceInfo.cashItemInfo.EnablePCoin);
                TPItemList.ItemList.AddSubMenuBtn(Ro.ItemInfo.ItemID, int(temp.8), !Ro.instanceInfo.cashItemInfo.EnableCCoin);                
            }
            else
            {
                TPItemList.ItemList.AddSubMenuBtn(Ro.ItemInfo.ItemID, int(temp.10), true);
                TPItemList.ItemList.AddSubMenuBtn(Ro.ItemInfo.ItemID, int(temp.9), false);
            }
            // [Explicit Continue]
            goto J0x324;
        }
        TPItemList.ItemList.AddSubMenuBtn(Ro.ItemInfo.ItemID, int(temp.10), true);
        TPItemList.ItemList.AddSubMenuBtn(Ro.ItemInfo.ItemID, int(temp.10), true);
        J0x324:

        Count++;
        // [Loop Continue]
        goto J0x79;
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wGameManager GameMgr;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    TPItemList = BTTPItemListHK(NewComponent(new Class'GUIWarfareControls.BTTPItemListHK', fbTPItemList));
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.MyData.myLevel = 999;
    TPItemList.MyData.MyCash = 99999;
    TPItemList.MyData.MyPoint = 99999;
    TopLine.CaptionDrawType = 4;
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Expired_Deco_Img;
    TPItemList.ItemList.SetItemSize(236, int(float(86) * (float(Controller.ResY) / float(768))));
    TPItemList.ItemList.SetItemCountPerPage(4, 2);
    TPItemList.ItemList.ImageList.MyScrollBar.Step = 2;
    TPItemList.ItemList.ImageList.MyScrollBar.ItemsPerPage = 8;
    TPItemList.ItemList.bIgnoreMouseOnState = true;
    TPItemList.ItemList.bIgnoreFocusedState = true;
    i = 0;
    J0x1F3:

    // End:0x26B [Loop If]
    if(i < 5)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0x1F3;
    }
    Label[0].CaptionDrawType = 4;
    Label[1].CaptionDrawType = 4;
    Label[2].CaptionDrawType = 5;
    Label[3].CaptionDrawType = 5;
    Label[4].CaptionDrawType = 5;
    Label[i].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    i = 1;
    J0x2F8:

    // End:0x332 [Loop If]
    if(i < 5)
    {
        Label[i].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.newButtonN());
        i++;
        // [Loop Continue]
        goto J0x2F8;
    }
    i = 0;
    J0x339:

    // End:0x420 [Loop If]
    if(i < 9)
    {
        NEditBox[i] = new Class'GUIWarfareControls.BTNumericEditBoxHK';
        NEditBox[i].bUseAWinPos = true;
        NEditBox[i].AWinPos = fbNEditBox[i];
        NEditBox[i].CaptionDrawType = 5;
        NEditBox[i].SetDefaultNonSelectFontColor();
        NEditBox[i].InitComponent(MyController, self);
        AppendComponent(NEditBox[i]);
        NEditBox[i].SetData(0);
        NEditBox[i].bReadOnly = true;
        i++;
        // [Loop Continue]
        goto J0x339;
    }
    NEditBox[0].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.Point());
    NEditBox[1].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    NEditBox[3].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.Cash());
    NEditBox[4].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    NEditBox[6].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.Cash());
    NEditBox[7].SetFontColorAll(Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite());
    i = 3;
    J0x4EC:

    // End:0x51C [Loop If]
    if(i < 6)
    {
        LabelEdit[i].Caption = strCash;
        ++i;
        // [Loop Continue]
        goto J0x4EC;
    }
    TPItemList.ItemList.ShowItemAll();
    TPItemList.ItemList.bIgnoreFocusedState = true;
    UpdateNEditBox();
    __OnOK__Delegate = ButtonOK_OnClick;
    __OnCancel__Delegate = ButtonCancel_OnClick;
    //return;    
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
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    TimeOutPreDraw(C);
    // End:0x8C
    if(SavePoint != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kPoint)
    {
        SavePoint = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kPoint;
        SetCurrentPoint(SavePoint);
    }
    // End:0x10D
    if(saveLevel != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kLevel)
    {
        saveLevel = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kLevel;
        SetCurrentLevel(saveLevel);
    }
    // End:0x18E
    if(saveCash != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCash)
    {
        saveCash = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCash;
        SetCurrentCash(saveCash);
    }
    // End:0x20F
    if(saveCCoin != Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCCoinCash)
    {
        saveCCoin = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCCoinCash;
        SetCurrentCCoin(saveCCoin);
    }
    CheckSubBtn();
    return true;
    //return;    
}

function CheckSubBtn()
{
    local int i, ListIndex;
    local BTItemListMenuBtn temp;
    local BTROItemBoxHK Ro;
    local bool selectState;

    i = 0;
    J0x07:

    // End:0x3F2 [Loop If]
    if(i < TPItemList.ItemList.SubMenuBtn.Length)
    {
        ListIndex = i / 3;
        temp = TPItemList.ItemList.SubMenuBtn[i];
        Ro = BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]);
        // End:0x1D0
        if(temp.ClickBtnIndex == int(temp.7))
        {
            selectState = CalculateCashSelect(ListIndex, Ro, int(2));
            Controller.ViewportOwner.Actor.Level.GameMgr.SetGP20CashItemInfo(Ro.ItemInfo, Ro.instanceInfo.cashItemInfo.2, Ro.instanceInfo.cashItemInfo);
            // End:0x165
            if(selectState)
            {
                RepairSumCash += Ro.instanceInfo.cashItemInfo.WZCashPrice[0];
            }
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]).bSelect = selectState;
            UpdateNEditBox();
            // [Explicit Break]
            goto J0x3F2;
            // [Explicit Continue]
            goto J0x3E8;
        }
        // End:0x31C
        if(temp.ClickBtnIndex == int(temp.8))
        {
            selectState = CalculateCashSelect(ListIndex, Ro, int(1));
            Controller.ViewportOwner.Actor.Level.GameMgr.SetGP20CashItemInfo(Ro.ItemInfo, Ro.instanceInfo.cashItemInfo.1, Ro.instanceInfo.cashItemInfo);
            // End:0x2B1
            if(selectState)
            {
                RepairSumCCoin += Ro.instanceInfo.cashItemInfo.WZCashPrice[0];
            }
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]).bSelect = selectState;
            UpdateNEditBox();
            // [Explicit Break]
            goto J0x3F2;
            // [Explicit Continue]
            goto J0x3E8;
        }
        // End:0x3E8
        if(temp.ClickBtnIndex == int(temp.9))
        {
            selectState = CalculateCashSelect(ListIndex, Ro, int(3));
            // End:0x380
            if(selectState)
            {
                RepairSumCost += Ro.ItemInfo.PointPrice[0];
            }
            TPItemList.ItemList.SubMenuBtn[i].ClickBtnIndex = -1;
            BTROItemBoxHK(TPItemList.ItemList.DataList[ListIndex]).bSelect = selectState;
            UpdateNEditBox();
            // [Explicit Break]
            goto J0x3F2;
        }
        J0x3E8:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x3F2:

    //return;    
}

function PopAndBuy(int ReservedItemID)
{
    local int ReservedCategoryID, ReservedPackageID, ReservedPriceID, ReservedCashType;
    local array<int> temp;
    local wGameManager GameMgr;
    local int ProductNo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    PopExpiredCashInfo(ReservedCategoryID, ReservedPackageID, ReservedPriceID, ReservedCashType);
    // End:0x9E
    if(ReservedCategoryID == -1)
    {
        Log("sfReqBuyShopItem(" $ string(ReservedItemID));
        MainMenu.TcpChannel.sfReqBuyShopItem(ReservedItemID, __NFUN_921__(0), 1, 1);        
    }
    else
    {
        temp.Length = 1;
        temp[0] = ReservedItemID;
        // End:0x11F
        if(UseGP20())
        {
            Log((("sfReqBuyItemByWebzenCashGP20(" $ string(ProductNo)) $ ",") $ string(ReservedCashType));
            MainMenu.TcpChannel.sfReqBuyItemByWebzenCashGP20(ReservedPriceID, byte(ReservedCashType), __NFUN_921__(0));            
        }
        else
        {
            Log((((("sfReqBuyItemByWebzenCash(" $ string(ReservedPackageID)) $ ",") $ string(ReservedCategoryID)) $ ",") $ string(ReservedPriceID));
            MainMenu.TcpChannel.sfReqBuyItemByWebzenCash(ReservedPackageID, ReservedCategoryID, ReservedPriceID, temp, __NFUN_921__(0), 1, 1);
        }
    }
    //return;    
}

function bool CalculateCashSelect(int ListIndex, BTROItemBoxHK Ro, int cashType)
{
    local bool bIncreaseCash;

    bIncreaseCash = false;
    // End:0xCE
    if(Ro.bSelect)
    {
        // End:0x5A
        if(selectCashType[ListIndex] == int(2))
        {
            RepairSumCash -= Ro.instanceInfo.cashItemInfo.WZCashPrice[0];            
        }
        else
        {
            // End:0x9A
            if(selectCashType[ListIndex] == int(1))
            {
                RepairSumCCoin -= Ro.instanceInfo.cashItemInfo.WZCashPrice[0];                
            }
            else
            {
                // End:0xCE
                if(selectCashType[ListIndex] == int(3))
                {
                    RepairSumCost -= Ro.ItemInfo.PointPrice[0];
                }
            }
        }
    }
    // End:0xFF
    if(selectCashType[ListIndex] != cashType)
    {
        selectCashType[ListIndex] = cashType;
        bIncreaseCash = true;        
    }
    else
    {
        selectCashType[ListIndex] = int(0);
    }
    return bIncreaseCash;
    //return;    
}

defaultproperties
{
    fbTPItemList=(X1=275.0000000,Y1=143.0000000,X2=777.0000000,Y2=493.0000000)
    fbLabelDivider[0]=(X1=341.0000000,Y1=213.0000000,X2=683.0000000,Y2=215.0000000)
    fbLabelDivider[1]=(X1=341.0000000,Y1=477.0000000,X2=683.0000000,Y2=479.0000000)
    strLabel[0]="These items have expired and were destroyed."
    strLabel[1]="Buy an item again?"
    strLabel[2]="Item Price"
    strLabel[3]="Funds"
    strLabel[4]="Balance"
    strPoint="Points"
    strCash="W Coin(P)"
    strCCoin="W Coin(C)"
    fbLabel[0]=(X1=326.0000000,Y1=106.0000000,X2=698.0000000,Y2=119.0000000)
    fbLabel[1]=(X1=326.0000000,Y1=122.0000000,X2=698.0000000,Y2=135.0000000)
    fbLabel[2]=(X1=152.0000000,Y1=535.0000000,X2=283.0000000,Y2=548.0000000)
    fbLabel[3]=(X1=152.0000000,Y1=565.0000000,X2=283.0000000,Y2=578.0000000)
    fbLabel[4]=(X1=152.0000000,Y1=595.0000000,X2=283.0000000,Y2=608.0000000)
    strButtonSelectAll[0]="Select All"
    strButtonSelectAll[1]="Deselect All"
    fbNEditBox[0]=(X1=292.0000000,Y1=534.0000000,X2=465.0000000,Y2=549.0000000)
    fbNEditBox[1]=(X1=292.0000000,Y1=564.0000000,X2=465.0000000,Y2=579.0000000)
    fbNEditBox[2]=(X1=292.0000000,Y1=594.0000000,X2=465.0000000,Y2=609.0000000)
    fbNEditBox[3]=(X1=476.0000000,Y1=534.0000000,X2=649.0000000,Y2=549.0000000)
    fbNEditBox[4]=(X1=476.0000000,Y1=564.0000000,X2=649.0000000,Y2=579.0000000)
    fbNEditBox[5]=(X1=476.0000000,Y1=594.0000000,X2=649.0000000,Y2=609.0000000)
    fbNEditBox[6]=(X1=660.0000000,Y1=534.0000000,X2=833.0000000,Y2=549.0000000)
    fbNEditBox[7]=(X1=660.0000000,Y1=564.0000000,X2=833.0000000,Y2=579.0000000)
    fbNEditBox[8]=(X1=660.0000000,Y1=594.0000000,X2=833.0000000,Y2=609.0000000)
    fbBackgroundImage=(X1=145.0000000,Y1=68.0000000,X2=879.0000000,Y2=684.0000000)
    fbTopLine=(X1=362.0000000,Y1=74.0000000,X2=662.0000000,Y2=89.0000000)
    fbButtonOK=(X1=387.0000000,Y1=631.0000000,X2=511.0000000,Y2=668.0000000)
    fbButtonCancel=(X1=513.0000000,Y1=631.0000000,X2=637.0000000,Y2=668.0000000)
    strTitle="Expired"
    strOK="Buy"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnPreDraw=BTWindowItemExpiredHK.Internal_OnPreDraw
}