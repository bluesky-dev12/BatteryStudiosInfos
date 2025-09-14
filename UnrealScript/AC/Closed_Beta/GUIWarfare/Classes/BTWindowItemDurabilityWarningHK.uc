class BTWindowItemDurabilityWarningHK extends BTWindowHK
    editinlinenew
    instanced;

var int SavePoint;
var export editinline BTNetMainMenu MainMenu;
var int MyPoint;
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
var array<BtrDouble> selectlist;

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    local int i;
    local string strItemNames;

    Log("[BTWindowItemDurabilityWarningHK::ButtonOK_OnClick]");
    selectlist.Length = 0;
    i = 0;
    J0x46:

    // End:0x1BE [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0x1B4
        if((TPItemList.ItemList.DataPool[i].bSelect && TPItemList.ItemList.DataPool[i].ItemInfo.CostType == 0) && TPItemList.ItemList.DataPool[i].ItemInfo.bRepair == true)
        {
            selectlist[selectlist.Length] = TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID;
            // End:0x1B4
            if(TPItemList.ItemList.DataPool[i].instanceInfo.DamageDegree >= 80000)
            {
                strItemNames = (strItemNames $ TPItemList.ItemList.DataPool[i].ItemName.Text) $ ", ";
            }
        }
        i++;
        // [Loop Continue]
        goto J0x46;
    }
    // End:0x247
    if(strItemNames != "")
    {
        strItemNames = Mid(strItemNames, 0, Len(strItemNames) - 2);
        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairItem_OnOK;
        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);        
    }
    else
    {
        MainMenu.TcpChannel.sfReqRepairItem(selectlist);
        Controller.CloseMenu(false);
        MainMenu.CheckExpiredItemList();
    }
    return true;
    //return;    
}

function bool RepairItem_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowHK Window;

    MainMenu.TcpChannel.sfReqRepairItem(selectlist);
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    MainMenu.CheckExpiredItemList();
    return true;
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("[BTWindowItemDurabilityWarningHK::ButtonCancel_OnClick]");
    Controller.CloseMenu(false);
    MainMenu.CheckExpiredItemList();
    return true;
    //return;    
}

function bool ButtonSelectAll_OnClick(GUIComponent Sender)
{
    local int i;

    RepairSumCost = 0;
    i = 0;
    J0x0E:

    // End:0x106 [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xFC
        if((TPItemList.ItemList.DataPool[i].ItemInfo.CostType == 0) && TPItemList.ItemList.DataPool[i].ItemInfo.bRepair == true)
        {
            TPItemList.ItemList.DataPool[i].bSelect = true;
            RepairSumCost += TPItemList.ItemList.DataPool[i].instanceInfo.Extra;
        }
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

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;

    ItemList = TPItemList.ItemList;
    // End:0x2E
    if(ItemList.VolatileSelectItemIndex == -1)
    {
        return true;
    }
    // End:0xCF
    if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect)
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = false;
        RepairSumCost -= BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo.Extra;
        UpdateNEditBox();        
    }
    else
    {
        // End:0x1B5
        if((BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.CostType == 0) && BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.bRepair == true)
        {
            BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = true;
            RepairSumCost += BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo.Extra;
            UpdateNEditBox();
        }
    }
    return false;
    //return;    
}

function UpdateNEditBox()
{
    local int i;
    local bool bSelect;

    NEditBox[0].SetData(RepairSumCost);
    NEditBox[1].SetData(MyPoint);
    NEditBox[2].SetData(MyPoint - RepairSumCost);
    i = 0;
    J0x51:

    // End:0xB2 [Loop If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xA8
        if(TPItemList.ItemList.DataPool[i].bSelect)
        {
            bSelect = true;
            // [Explicit Break]
            goto J0xB2;
        }
        i++;
        // [Loop Continue]
        goto J0x51;
    }
    J0xB2:

    // End:0xE1
    if(bSelect && (MyPoint - RepairSumCost) >= 0)
    {
        ButtonOK.EnableMe();        
    }
    else
    {
        ButtonOK.DisableMe();
    }
    //return;    
}

function SetCurrentPoint(int MyPoint)
{
    self.MyPoint = MyPoint;
    UpdateNEditBox();
    //return;    
}

function AddItem(BtrDouble UniqueID, int ItemID, int PartID, int Durability, int RepairCost)
{
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo, ItemInstanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = new Class'GUIWarfareControls.BTROItemBoxHK';
    ro.Init();
    ro.ItemInfo = GameMgr.FindUIItem(ItemID);
    ItemInstanceInfo = GameMgr.FindInstanceItem(UniqueID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.UniqueID = UniqueID;
    instanceInfo.PartID = PartID;
    instanceInfo.Durability = Durability;
    instanceInfo.Extra = RepairCost;
    instanceInfo.DamageDegree = ItemInstanceInfo.DamageDegree;
    ro.instanceInfo = instanceInfo;
    ro.ChangeState(14);
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
    SetCurrentPoint(SavePoint);
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
    return true;
    //return;    
}

defaultproperties
{
    fbTPItemList=(X1=355.0000000,Y1=217.0000000,X2=685.0000000,Y2=477.0000000)
    fbLabelDivider[0]=(X1=341.0000000,Y1=213.0000000,X2=683.0000000,Y2=215.0000000)
    fbLabelDivider[1]=(X1=341.0000000,Y1=477.0000000,X2=683.0000000,Y2=479.0000000)
    strLabel[0]="You can't use an item once its durability falls to 0 until you repair it."
    strLabel[1]="Repair the item?"
    strLabel[2]="Repair Cost"
    strLabel[3]="Funds"
    strLabel[4]="Balance"
    strPoint="Points"
    fbLabel[0]=(X1=355.0000000,Y1=173.0000000,X2=669.0000000,Y2=187.0000000)
    fbLabel[1]=(X1=355.0000000,Y1=190.0000000,X2=683.0000000,Y2=204.0000000)
    fbLabel[2]=(X1=344.0000000,Y1=493.0000000,X2=683.0000000,Y2=527.0000000)
    fbLabel[3]=(X1=344.0000000,Y1=527.0000000,X2=683.0000000,Y2=561.0000000)
    fbLabel[4]=(X1=344.0000000,Y1=561.0000000,X2=683.0000000,Y2=595.0000000)
    fbLabelEdit[0]=(X1=440.0000000,Y1=487.0000000,X2=683.0000000,Y2=513.0000000)
    fbLabelEdit[1]=(X1=440.0000000,Y1=521.0000000,X2=683.0000000,Y2=547.0000000)
    fbLabelEdit[2]=(X1=440.0000000,Y1=555.0000000,X2=683.0000000,Y2=581.0000000)
    strButtonSelectAll[0]="Select All"
    strButtonSelectAll[1]="Deselect All"
    fbButtonSelectAll=(X1=367.0000000,Y1=594.0000000,X2=461.0000000,Y2=626.0000000)
    fbNEditBox[0]=(X1=446.0000000,Y1=493.0000000,X2=631.0000000,Y2=507.0000000)
    fbNEditBox[1]=(X1=446.0000000,Y1=527.0000000,X2=631.0000000,Y2=541.0000000)
    fbNEditBox[2]=(X1=446.0000000,Y1=561.0000000,X2=631.0000000,Y2=575.0000000)
    fbBackgroundImage=(X1=262.0000000,Y1=116.0000000,X2=761.0000000,Y2=652.0000000)
    fbTopLine=(X1=282.0000000,Y1=136.0000000,X2=741.0000000,Y2=162.0000000)
    fbBottomLine=(X1=282.0000000,Y1=589.0000000,X2=741.0000000,Y2=632.0000000)
    fbButtonOK=(X1=465.0000000,Y1=594.0000000,X2=559.0000000,Y2=626.0000000)
    fbButtonCancel=(X1=563.0000000,Y1=594.0000000,X2=657.0000000,Y2=626.0000000)
    strTitle="Low Durability Warning"
    strOK="Repair"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnPreDraw=BTWindowItemDurabilityWarningHK.Internal_OnPreDraw
}