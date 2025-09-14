class BTWindowItemExpiredHK extends BTWindowHK
    editinlinenew
    instanced;

struct BuyExpriedCashInfo
{
    var array<int> CashElements;
};

var int SavePoint;
var int saveLevel;
var int saveCash;
var export editinline BTNetMainMenu MainMenu;
var BTTcpLink_Channel TcpChannel;
var int MyPoint;
var int myLevel;
var int MyCash;
var int RepairSumCost;
var int RepairSumCash;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() automated FloatBox fbLabelDivider[2];
var export editinline BTOwnerDrawImageHK LabelDivider[2];
var localized string strLabel[5];
var localized string strPoint;
var localized string strCash;
var() automated FloatBox fbLabel[5];
var() automated FloatBox fbLabelEdit[6];
var export editinline BTOwnerDrawImageHK Label[5];
var export editinline BTOwnerDrawImageHK LabelEdit[6];
var localized string strButtonSelectAll[2];
var() automated FloatBox fbButtonSelectAll;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSelectAll;
var() automated FloatBox fbNEditBox[6];
var export editinline BTNumericEditBoxHK NEditBox[6];
var array<int> BuyExpiredItemList;
var array<int> BuyExpiredSlotPosList;
var BuyExpriedCashInfo BuyExpiredCashInfoList[3];

function PushExpiredItemID(int ItemID, int CategoryID, int PackageID, int PriceID, optional int SlotPos)
{
    BuyExpiredItemList.Length = BuyExpiredItemList.Length + 1;
    BuyExpiredItemList[BuyExpiredItemList.Length - 1] = ItemID;
    BuyExpiredSlotPosList.Length = BuyExpiredSlotPosList.Length + 1;
    BuyExpiredSlotPosList[BuyExpiredSlotPosList.Length - 1] = SlotPos;
    BuyExpiredCashInfoList[0].CashElements.Length = BuyExpiredCashInfoList[0].CashElements.Length + 1;
    BuyExpiredCashInfoList[0].CashElements[BuyExpiredCashInfoList[0].CashElements.Length - 1] = CategoryID;
    BuyExpiredCashInfoList[1].CashElements.Length = BuyExpiredCashInfoList[1].CashElements.Length + 1;
    BuyExpiredCashInfoList[1].CashElements[BuyExpiredCashInfoList[1].CashElements.Length - 1] = PackageID;
    BuyExpiredCashInfoList[2].CashElements.Length = BuyExpiredCashInfoList[2].CashElements.Length + 1;
    BuyExpiredCashInfoList[2].CashElements[BuyExpiredCashInfoList[2].CashElements.Length - 1] = PriceID;
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

function PopExpiredCashInfo(out int iCategoryID, out int iPackageID, out int iPriceID)
{
    local int iValue[3], lp1, lp2;

    lp1 = 0;
    J0x07:

    // End:0xAA [Loop If]
    if(lp1 < 3)
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
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager gm;
    local int iItemType;

    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    RepairSumCost = 0;
    RepairSumCash = 0;
    i = 0;
    J0x44:

    // End:0x1EF [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xA2
        if(TPItemList.ItemList.DataPool[i].ItemInfo.EquipLevel > myLevel)
        {
            // [Explicit Continue]
            goto J0x1E5;
        }
        iItemType = gm.GetItemType(TPItemList.ItemList.DataPool[i].ItemInfo, TPItemList.ItemList.DataPool[i].instanceInfo);
        // End:0x123
        if(bool(iItemType & gm.FlagBuyShop) == false)
        {
            // [Explicit Continue]
            goto J0x1E5;
        }
        TPItemList.ItemList.DataPool[i].bSelect = true;
        // End:0x1AD
        if(bool(iItemType & gm.FlagCash) == true)
        {
            RepairSumCash += TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZCashPrice[0];
            // [Explicit Continue]
            goto J0x1E5;
        }
        RepairSumCost += TPItemList.ItemList.DataPool[i].ItemInfo.PointPrice[0];
        J0x1E5:

        i++;
        // [Loop Continue]
        goto J0x44;
    }
    UpdateNEditBox();
    TPItemList.ItemList.ShowAll(100);
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
    UpdateNEditBox();
    TPItemList.ItemList.ShowAll(100);
    ButtonSelectAll.Caption = strButtonSelectAll[0];
    ButtonSelectAll.__OnClick__Delegate = ButtonSelectAll_OnClick;
    return true;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local int i, ReservedItemID, ReservedCategoryID, ReservedPackageID, ReservedPriceID;

    local array<int> temp;

    Log("BTWindowItemExpiredHK::ButtonOK_OnClick]");
    i = 0;
    J0x33:

    // End:0x242 [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0x238
        if(TPItemList.ItemList.DataPool[i].bSelect)
        {
            // End:0x1C5
            if(TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo != none)
            {
                PushExpiredItemID(TPItemList.ItemList.DataPool[i].ItemInfo.ItemID, TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZCategorySeq, TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZPackageSeq, TPItemList.ItemList.DataPool[i].instanceInfo.CashItemInfo.WZPriceSeq[0], TPItemList.ItemList.DataPool[i].instanceInfo.SlotPosition);
                // [Explicit Continue]
                goto J0x238;
            }
            PushExpiredItemID(TPItemList.ItemList.DataPool[i].ItemInfo.ItemID, -1, -1, -1, TPItemList.ItemList.DataPool[i].instanceInfo.SlotPosition);
        }
        J0x238:

        i++;
        // [Loop Continue]
        goto J0x33;
    }
    ReservedItemID = PopExpiredItemID();
    // End:0x27F
    if(ReservedItemID == -1)
    {
        Controller.CloseMenu(false);
        MainMenu.CheckDestroyedDurabilityXItemList();        
    }
    else
    {
        PopExpiredCashInfo(ReservedCategoryID, ReservedPackageID, ReservedPriceID);
        // End:0x2E9
        if(ReservedCategoryID == -1)
        {
            Log("sfReqBuyShopItem(" $ string(ReservedItemID));
            MainMenu.TcpChannel.sfReqBuyShopItem(ReservedItemID, __NFUN_921__(0), 1, 1);            
        }
        else
        {
            temp.Length = 1;
            temp[0] = ReservedItemID;
            Log((((("sfReqBuyItemByWebzenCash(" $ string(ReservedPackageID)) $ ",") $ string(ReservedCategoryID)) $ ",") $ string(ReservedPriceID));
            MainMenu.TcpChannel.sfReqBuyItemByWebzenCash(ReservedPackageID, ReservedCategoryID, ReservedPriceID, temp, __NFUN_921__(0), 1, 1);
        }
    }
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("BTWindowItemExpiredHK::ButtonCancel_OnClick]");
    Controller.CloseMenu(false);
    MainMenu.CheckDestroyedDurabilityXItemList();
    return true;
    //return;    
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager gm;
    local int iItemType;

    gm = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemList = TPItemList.ItemList;
    // End:0x5D
    if(ItemList.SelectItemIndex == -1)
    {
        return false;
    }
    // End:0xC7
    if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.EquipLevel > myLevel)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 201);
        ItemList.SelectItemIndex = -1;
        return false;
    }
    iItemType = gm.GetItemType(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo, BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo);
    // End:0x17B
    if(bool(iItemType & gm.FlagBuyShop) == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 201);
        ItemList.SelectItemIndex = -1;
        return false;
    }
    // End:0x195
    if(ItemList.VolatileSelectItemIndex == -1)
    {
        return true;
    }
    // End:0x29E
    if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect)
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = false;
        // End:0x258
        if(bool(iItemType & gm.FlagCash) == true)
        {
            RepairSumCash -= BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo.CashItemInfo.WZCashPrice[0];            
        }
        else
        {
            RepairSumCost -= BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.PointPrice[0];
        }
        UpdateNEditBox();        
    }
    else
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = true;
        // End:0x332
        if(bool(iItemType & gm.FlagCash) == true)
        {
            RepairSumCash += BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo.CashItemInfo.WZCashPrice[0];            
        }
        else
        {
            RepairSumCost += BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.PointPrice[0];
        }
        UpdateNEditBox();
    }
    return false;
    //return;    
}

function UpdateNEditBox()
{
    NEditBox[0].SetData(RepairSumCost);
    NEditBox[1].SetData(MyPoint);
    NEditBox[2].SetData(MyPoint - RepairSumCost);
    NEditBox[3].SetData(RepairSumCash);
    NEditBox[4].SetData(MyCash);
    NEditBox[5].SetData(MyCash - RepairSumCash);
    // End:0xE2
    if((((RepairSumCost + RepairSumCash) == 0) || (MyPoint - RepairSumCost) < 0) || (MyCash - RepairSumCash) < 0)
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

function AddItem(int ItemID, int PartID, int SlotPosition)
{
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = new Class'GUIWarfareControls.BTROItemBoxHK';
    ro.Init();
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    ro.ItemInfo = GameMgr.FindUIItem(ItemID);
    instanceInfo.PartID = PartID;
    instanceInfo.ItemState = 1;
    instanceInfo.SlotPosition = SlotPosition;
    ro.instanceInfo = instanceInfo;
    // End:0x125
    if(ro.ItemInfo.IsCashItem() == true)
    {
        GameMgr.AddCashItem(ro.ItemInfo, ro.instanceInfo, Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetClientString(122));
    }
    ro.ChangeState(15);
    ro.MyData = TPItemList.MyData;
    ro.Update();
    TPItemList.ItemList.AddItem(ro);
    TPItemList.ItemList.ShowAll(100);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    LabelDivider[0] = NewLabelComponent(fbLabelDivider[0], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_divid_line);
    LabelDivider[1] = NewLabelComponent(fbLabelDivider[1], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_divid_line);
    TPItemList = BTTPItemListHK(NewComponent(new Class'GUIWarfareControls.BTTPItemListHK', fbTPItemList));
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.MyData.myLevel = 999;
    TPItemList.MyData.MyCash = 99999;
    TPItemList.MyData.MyPoint = 99999;
    TPItemList.ItemList.SetItemSize(158, 87);
    TPItemList.ItemList.SetItemCountPerPage(3, 2);
    i = 0;
    J0x160:

    // End:0x1D8 [Loop If]
    if(i < 5)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        i++;
        // [Loop Continue]
        goto J0x160;
    }
    i = 0;
    J0x1DF:

    // End:0x33C [Loop If]
    if(i < 6)
    {
        LabelEdit[i] = NewLabelComponent(fbLabelEdit[i], Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_4);
        LabelEdit[i].Caption = strPoint;
        LabelEdit[i].CaptionDrawType = 5;
        LabelEdit[i].CaptionPadding[2] = 7;
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
        goto J0x1DF;
    }
    i = 3;
    J0x344:

    // End:0x374 [Loop If]
    if(i < 6)
    {
        LabelEdit[i].Caption = strCash;
        ++i;
        // [Loop Continue]
        goto J0x344;
    }
    ButtonSelectAll = NewButtonComponent(fbButtonSelectAll);
    ButtonSelectAll.SetDefaultButtonImage();
    ButtonSelectAll.Caption = strButtonSelectAll[0];
    ButtonSelectAll.__OnClick__Delegate = ButtonSelectAll_OnClick;
    TPItemList.ItemList.ShowAll(100);
    TPItemList.ItemList.bIgnoreFocusedState = true;
    UpdateNEditBox();
    __OnOK__Delegate = ButtonOK_OnClick;
    __OnCancel__Delegate = ButtonCancel_OnClick;
    GameMgr.ClearSkillBoxList();
    //return;    
}

function InternalOnOpen()
{
    SavePoint = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kPoint;
    saveLevel = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kLevel;
    saveCash = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kCash;
    SetCurrentPoint(SavePoint);
    SetCurrentLevel(saveLevel);
    SetCurrentCash(saveCash);
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
    return true;
    //return;    
}

defaultproperties
{
    fbTPItemList=(X1=355.0000000,Y1=217.0000000,X2=685.0000000,Y2=477.0000000)
    fbLabelDivider[0]=(X1=341.0000000,Y1=213.0000000,X2=683.0000000,Y2=215.0000000)
    fbLabelDivider[1]=(X1=341.0000000,Y1=477.0000000,X2=683.0000000,Y2=479.0000000)
    strLabel[0]="These items have expired and were destroyed."
    strLabel[1]="Buy an item again?"
    strLabel[2]="Item Price"
    strLabel[3]="Funds"
    strLabel[4]="Balance"
    strPoint="Points"
    strCash="Cash"
    fbLabel[0]=(X1=355.0000000,Y1=173.0000000,X2=669.0000000,Y2=187.0000000)
    fbLabel[1]=(X1=355.0000000,Y1=190.0000000,X2=683.0000000,Y2=204.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=493.0000000,X2=683.0000000,Y2=527.0000000)
    fbLabel[3]=(X1=344.0000000,Y1=527.0000000,X2=683.0000000,Y2=561.0000000)
    fbLabel[4]=(X1=344.0000000,Y1=561.0000000,X2=683.0000000,Y2=595.0000000)
    fbLabelEdit[0]=(X1=440.0000000,Y1=487.0000000,X2=570.0000000,Y2=513.0000000)
    fbLabelEdit[1]=(X1=440.0000000,Y1=521.0000000,X2=570.0000000,Y2=547.0000000)
    fbLabelEdit[2]=(X1=440.0000000,Y1=555.0000000,X2=570.0000000,Y2=581.0000000)
    fbLabelEdit[3]=(X1=572.0000000,Y1=487.0000000,X2=702.0000000,Y2=513.0000000)
    fbLabelEdit[4]=(X1=572.0000000,Y1=521.0000000,X2=702.0000000,Y2=547.0000000)
    fbLabelEdit[5]=(X1=572.0000000,Y1=555.0000000,X2=702.0000000,Y2=581.0000000)
    strButtonSelectAll[0]="Select All"
    strButtonSelectAll[1]="Deselect All"
    fbButtonSelectAll=(X1=367.0000000,Y1=594.0000000,X2=461.0000000,Y2=626.0000000)
    fbNEditBox[0]=(X1=340.0000000,Y1=493.0000000,X2=517.0000000,Y2=507.0000000)
    fbNEditBox[1]=(X1=340.0000000,Y1=527.0000000,X2=517.0000000,Y2=541.0000000)
    fbNEditBox[2]=(X1=340.0000000,Y1=561.0000000,X2=517.0000000,Y2=575.0000000)
    fbNEditBox[3]=(X1=456.0000000,Y1=493.0000000,X2=649.0000000,Y2=507.0000000)
    fbNEditBox[4]=(X1=456.0000000,Y1=527.0000000,X2=649.0000000,Y2=541.0000000)
    fbNEditBox[5]=(X1=456.0000000,Y1=561.0000000,X2=649.0000000,Y2=575.0000000)
    fbBackgroundImage=(X1=262.0000000,Y1=116.0000000,X2=761.0000000,Y2=652.0000000)
    fbTopLine=(X1=282.0000000,Y1=136.0000000,X2=741.0000000,Y2=162.0000000)
    fbBottomLine=(X1=282.0000000,Y1=589.0000000,X2=741.0000000,Y2=632.0000000)
    fbButtonOK=(X1=465.0000000,Y1=594.0000000,X2=559.0000000,Y2=626.0000000)
    fbButtonCancel=(X1=563.0000000,Y1=594.0000000,X2=657.0000000,Y2=626.0000000)
    strTitle="Expired"
    strOK="Buy"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnPreDraw=BTWindowItemExpiredHK.Internal_OnPreDraw
}