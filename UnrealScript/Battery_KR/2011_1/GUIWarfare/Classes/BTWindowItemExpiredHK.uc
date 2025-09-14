class BTWindowItemExpiredHK extends BTWindowHK
    editinlinenew
    instanced;

var int SavePoint;
var int saveLevel;
var export editinline BTNetMainMenu MainMenu;
var BTTcpLink_Channel TcpChannel;
var int MyPoint;
var int myLevel;
var int RepairSumCost;
var() automated FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() automated FloatBox fbLabelDivider[2];
var export editinline BTOwnerDrawImageHK LabelDivider[2];
var localized string strLabel[5];
var localized string strPoint;
var() automated FloatBox fbLabel[5];
var() automated FloatBox fbLabelEdit[3];
var export editinline BTOwnerDrawImageHK Label[5];
var export editinline BTOwnerDrawImageHK LabelEdit[3];
var localized string strButtonSelectAll[2];
var() automated FloatBox fbButtonSelectAll;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSelectAll;
var() automated FloatBox fbNEditBox[3];
var export editinline BTNumericEditBoxHK NEditBox[3];
var array<int> BuyExpiredItemList;
var array<int> BuyExpiredSlotPosList;

function PushExpiredItemID(int ItemID, optional int SlotPos)
{
    BuyExpiredItemList.Length = BuyExpiredItemList.Length + 1;
    BuyExpiredItemList[BuyExpiredItemList.Length - 1] = ItemID;
    BuyExpiredSlotPosList.Length = BuyExpiredSlotPosList.Length + 1;
    BuyExpiredSlotPosList[BuyExpiredSlotPosList.Length - 1] = SlotPos;
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

    RepairSumCost = 0;
    i = 0;
    J0x0E:

    // End:0x110 [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xA5
        if((TPItemList.ItemList.DataPool[i].ItemInfo.PointPrice[0] == 0) || TPItemList.ItemList.DataPool[i].ItemInfo.EquipLevel > myLevel)
        {
            // [Explicit Continue]
            goto J0x106;
        }
        TPItemList.ItemList.DataPool[i].bSelect = true;
        RepairSumCost += TPItemList.ItemList.DataPool[i].ItemInfo.PointPrice[0];
        J0x106:

        i++;
        // [Loop Continue]
        goto J0x0E;
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
    UpdateNEditBox();
    TPItemList.ItemList.ShowAll(100);
    ButtonSelectAll.Caption = strButtonSelectAll[0];
    ButtonSelectAll.__OnClick__Delegate = ButtonSelectAll_OnClick;
    return true;
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local int i, ReservedItemID;

    Log("BTWindowItemExpiredHK::ButtonOK_OnClick]");
    i = 0;
    J0x33:

    // End:0xED [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xE3
        if(TPItemList.ItemList.DataPool[i].bSelect)
        {
            PushExpiredItemID(TPItemList.ItemList.DataPool[i].ItemInfo.ItemID, TPItemList.ItemList.DataPool[i].instanceInfo.SlotPosition);
        }
        i++;
        // [Loop Continue]
        goto J0x33;
    }
    ReservedItemID = PopExpiredItemID();
    // End:0x12A
    if(ReservedItemID == -1)
    {
        Controller.CloseMenu(false);
        MainMenu.CheckDestroyedDurabilityXItemList();        
    }
    else
    {
        MainMenu.TcpChannel.sfReqBuyShopItem(ReservedItemID, 1, 1);
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

    ItemList = TPItemList.ItemList;
    // End:0x2E
    if(ItemList.VolatileSelectItemIndex == -1)
    {
        return true;
    }
    // End:0xAC
    if((BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.PointPrice[0] == 0) || BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.EquipLevel > myLevel)
    {
        return true;
    }
    // End:0x14F
    if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect)
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = false;
        RepairSumCost -= BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.PointPrice[0];
        UpdateNEditBox();        
    }
    else
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = true;
        RepairSumCost += BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.PointPrice[0];
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
    // End:0x7B
    if((RepairSumCost == 0) || (MyPoint - RepairSumCost) < 0)
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
    if(i < 3)
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
    ButtonSelectAll = NewButtonComponent(fbButtonSelectAll);
    ButtonSelectAll.SetDefaultButtonImage();
    ButtonSelectAll.Caption = strButtonSelectAll[0];
    ButtonSelectAll.__OnClick__Delegate = ButtonSelectAll_OnClick;
    TPItemList.ItemList.ShowAll(100);
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
    SetCurrentPoint(SavePoint);
    SetCurrentLevel(saveLevel);
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
    return true;
    //return;    
}

defaultproperties
{
    fbTPItemList=(X1=355.0000000,Y1=217.0000000,X2=685.0000000,Y2=477.0000000)
    fbLabelDivider[0]=(X1=341.0000000,Y1=213.0000000,X2=683.0000000,Y2=215.0000000)
    fbLabelDivider[1]=(X1=341.0000000,Y1=477.0000000,X2=683.0000000,Y2=479.0000000)
    strLabel[0]="??? ??? ???? ???????."
    strLabel[1]="??? ???????"
    strLabel[2]="??? ??"
    strLabel[3]="?? ??"
    strLabel[4]="??"
    strPoint="???"
    fbLabel[0]=(X1=355.0000000,Y1=173.0000000,X2=669.0000000,Y2=187.0000000)
    fbLabel[1]=(X1=355.0000000,Y1=190.0000000,X2=683.0000000,Y2=204.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=493.0000000,X2=683.0000000,Y2=527.0000000)
    fbLabel[3]=(X1=344.0000000,Y1=527.0000000,X2=683.0000000,Y2=561.0000000)
    fbLabel[4]=(X1=344.0000000,Y1=561.0000000,X2=683.0000000,Y2=595.0000000)
    fbLabelEdit[0]=(X1=440.0000000,Y1=487.0000000,X2=683.0000000,Y2=513.0000000)
    fbLabelEdit[1]=(X1=440.0000000,Y1=521.0000000,X2=683.0000000,Y2=547.0000000)
    fbLabelEdit[2]=(X1=440.0000000,Y1=555.0000000,X2=683.0000000,Y2=581.0000000)
    strButtonSelectAll[0]="?? ??"
    strButtonSelectAll[1]="?? ??"
    fbButtonSelectAll=(X1=367.0000000,Y1=594.0000000,X2=461.0000000,Y2=626.0000000)
    fbNEditBox[0]=(X1=446.0000000,Y1=493.0000000,X2=631.0000000,Y2=507.0000000)
    fbNEditBox[1]=(X1=446.0000000,Y1=527.0000000,X2=631.0000000,Y2=541.0000000)
    fbNEditBox[2]=(X1=446.0000000,Y1=561.0000000,X2=631.0000000,Y2=575.0000000)
    fbBackgroundImage=(X1=262.0000000,Y1=116.0000000,X2=761.0000000,Y2=652.0000000)
    fbTopLine=(X1=282.0000000,Y1=136.0000000,X2=741.0000000,Y2=162.0000000)
    fbBottomLine=(X1=282.0000000,Y1=589.0000000,X2=741.0000000,Y2=632.0000000)
    fbButtonOK=(X1=465.0000000,Y1=594.0000000,X2=559.0000000,Y2=626.0000000)
    fbButtonCancel=(X1=563.0000000,Y1=594.0000000,X2=657.0000000,Y2=626.0000000)
    strTitle="?? ??"
    strOK="??"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnPreDraw=BTWindowItemExpiredHK.Internal_OnPreDraw
}