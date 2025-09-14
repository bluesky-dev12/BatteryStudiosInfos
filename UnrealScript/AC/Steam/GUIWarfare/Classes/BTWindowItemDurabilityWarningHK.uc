/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTWindowItemDurabilityWarningHK.uc
 * Package Imports:
 *	GUIWarfare
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:12
 *
 *******************************************************************************/
class BTWindowItemDurabilityWarningHK extends BTWindowHK
    editinlinenew
    instanced;

var int SavePoint;
var export editinline BTNetMainMenu MainMenu;
var int MyPoint;
var int RepairSumCost;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelDivider[2];
var export editinline BTOwnerDrawImageHK LabelDivider[2];
var localized string strLabel[5];
var localized string strPoint;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelEdit[3];
var export editinline BTOwnerDrawImageHK Label[5];
var export editinline BTOwnerDrawImageHK LabelEdit[3];
var localized string strButtonSelectAll[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonSelectAll;
var export editinline BTOwnerDrawCaptionButtonHK ButtonSelectAll;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbNEditBox[3];
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
    // End:0x1be [While If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0x1b4
        if(TPItemList.ItemList.DataPool[i].bSelect && TPItemList.ItemList.DataPool[i].ItemInfo.CostType == 0 && TPItemList.ItemList.DataPool[i].ItemInfo.bRepair == true)
        {
            selectlist[selectlist.Length] = TPItemList.ItemList.DataPool[i].instanceInfo.UniqueID;
            // End:0x1b4
            if(TPItemList.ItemList.DataPool[i].instanceInfo.DamageDegree >= 80000)
            {
                strItemNames = strItemNames $ TPItemList.ItemList.DataPool[i].ItemName.Text $ ", ";
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    // End:0x247
    if(strItemNames != "")
    {
        strItemNames = Mid(strItemNames, 0, Len(strItemNames) - 2);
        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 51, strItemNames);
        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = RepairItem_OnOK;
        BTWindowDefineARHK(Controller.TopPage()).ResizeWidth(-210);
    }
    // End:0x283
    else
    {
        MainMenu.TcpChannel.sfReqRepairItem(selectlist);
        Controller.CloseMenu(false);
        MainMenu.CheckExpiredItemList();
    }
    return true;
}

function bool RepairItem_OnOK(GUIComponent Sender)
{
    MainMenu.TcpChannel.sfReqRepairItem(selectlist);
    Controller.CloseMenu(false);
    Controller.CloseMenu(false);
    MainMenu.CheckExpiredItemList();
    return true;
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Log("[BTWindowItemDurabilityWarningHK::ButtonCancel_OnClick]");
    Controller.CloseMenu(false);
    MainMenu.CheckExpiredItemList();
    return true;
}

function bool ButtonSelectAll_OnClick(GUIComponent Sender)
{
    local int i;

    RepairSumCost = 0;
    i = 0;
    J0x0e:
    // End:0x106 [While If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xfc
        if(TPItemList.ItemList.DataPool[i].ItemInfo.CostType == 0 && TPItemList.ItemList.DataPool[i].ItemInfo.bRepair == true)
        {
            TPItemList.ItemList.DataPool[i].bSelect = true;
            RepairSumCost += TPItemList.ItemList.DataPool[i].instanceInfo.Extra;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
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
    UpdateNEditBox();
    TPItemList.ItemList.ShowItemAll();
    ButtonSelectAll.Caption = strButtonSelectAll[0];
    ButtonSelectAll.__OnClick__Delegate = ButtonSelectAll_OnClick;
    return true;
}

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    local export editinline BTItemImageListHK ItemList;

    ItemList = TPItemList.ItemList;
    // End:0x2e
    if(ItemList.VolatileSelectItemIndex == -1)
    {
        return true;
    }
    // End:0xcf
    if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect)
    {
        BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = false;
        RepairSumCost -= BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo.Extra;
        UpdateNEditBox();
    }
    // End:0x1b5
    else
    {
        // End:0x1b5
        if(BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.CostType == 0 && BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).ItemInfo.bRepair == true)
        {
            BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).bSelect = true;
            RepairSumCost += BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]).instanceInfo.Extra;
            UpdateNEditBox();
        }
    }
    return false;
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
    // End:0xb2 [While If]
    if(i < TPItemList.ItemList.DataPool.Length)
    {
        // End:0xa8
        if(TPItemList.ItemList.DataPool[i].bSelect)
        {
            bSelect = true;
        }
        // End:0xb2
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x51;
        }
    }
    // End:0xe1
    if(bSelect && MyPoint - RepairSumCost >= 0)
    {
        ButtonOK.EnableMe();
    }
    // End:0xf0
    else
    {
        ButtonOK.DisableMe();
    }
}

function SetCurrentPoint(int MyPoint)
{
    self.MyPoint = MyPoint;
    UpdateNEditBox();
}

function AddItem(BtrDouble UniqueID, int ItemID, int PartID, int Durability, int RepairCost)
{
    local wGameManager GameMgr;
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo, ItemInstanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = new class'BTROItemBoxHK';
    ro.Init();
    ro.ItemInfo = GameMgr.FindUIItem(ItemID);
    ItemInstanceInfo = GameMgr.FindInstanceItem(UniqueID);
    instanceInfo = new class'wItemBoxInstanceHK';
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
    TPItemList.ItemList.ShowItemAll();
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local wGameManager GameMgr;

    super.InitComponent(MyController, myOwner);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    LabelDivider[0] = NewLabelComponent(fbLabelDivider[0], class'BTUIResourcePoolHK'.default.img_divid_line);
    LabelDivider[1] = NewLabelComponent(fbLabelDivider[1], class'BTUIResourcePoolHK'.default.img_divid_line);
    TPItemList = BTTPItemListHK(NewComponent(new class'BTTPItemListHK', fbTPItemList));
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.MyData.myLevel = 999;
    TPItemList.MyData.MyCash = 99999;
    TPItemList.MyData.MyPoint = 99999;
    TPItemList.ItemList.SetItemSize(158, 87);
    TPItemList.ItemList.SetItemCountPerPage(3, 2);
    i = 0;
    J0x160:
    // End:0x1d8 [While If]
    if(i < 5)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x160;
    }
    i = 0;
    J0x1df:
    // End:0x33c [While If]
    if(i < 3)
    {
        LabelEdit[i] = NewLabelComponent(fbLabelEdit[i], class'BTUIResourcePoolHK'.default.panel_4);
        LabelEdit[i].Caption = strPoint;
        LabelEdit[i].CaptionDrawType = 5;
        LabelEdit[i].CaptionPadding[2] = 7;
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
        goto J0x1df;
    }
    ButtonSelectAll = NewButtonComponent(fbButtonSelectAll);
    ButtonSelectAll.SetDefaultButtonImage();
    ButtonSelectAll.Caption = strButtonSelectAll[0];
    ButtonSelectAll.__OnClick__Delegate = ButtonSelectAll_OnClick;
    TPItemList.ItemList.ShowItemAll();
    TPItemList.ItemList.bIgnoreFocusedState = true;
    UpdateNEditBox();
    __OnOK__Delegate = ButtonOK_OnClick;
    __OnCancel__Delegate = ButtonCancel_OnClick;
}

function InternalOnOpen()
{
    SavePoint = Controller.ViewportOwner.Actor.Level.GetMatchMaker().kPoint;
    SetCurrentPoint(SavePoint);
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
    return true;
}

defaultproperties
{
    fbTPItemList=(X1=355.0,Y1=217.0,X2=685.0,Y2=477.0)
    fbLabelDivider[0]=(X1=341.0,Y1=213.0,X2=683.0,Y2=215.0)
    fbLabelDivider[1]=(X1=341.0,Y1=477.0,X2=683.0,Y2=479.0)
    strLabel[0]="You can't use an item once its durability falls to 0 until you repair it."
    strLabel[1]="Repair the item?"
    strLabel[2]="Repair Cost"
    strLabel[3]="Funds"
    strLabel[4]="Balance"
    strPoint="Points"
    fbLabel[0]=(X1=355.0,Y1=173.0,X2=669.0,Y2=187.0)
    fbLabel[1]=(X1=355.0,Y1=190.0,X2=683.0,Y2=204.0)
    fbLabel[2]=(X1=344.0,Y1=493.0,X2=683.0,Y2=527.0)
    fbLabel[3]=(X1=344.0,Y1=527.0,X2=683.0,Y2=561.0)
    fbLabel[4]=(X1=344.0,Y1=561.0,X2=683.0,Y2=595.0)
    fbLabelEdit[0]=(X1=440.0,Y1=487.0,X2=683.0,Y2=513.0)
    fbLabelEdit[1]=(X1=440.0,Y1=521.0,X2=683.0,Y2=547.0)
    fbLabelEdit[2]=(X1=440.0,Y1=555.0,X2=683.0,Y2=581.0)
    strButtonSelectAll[0]="Select All"
    strButtonSelectAll[1]="Deselect All"
    fbButtonSelectAll=(X1=367.0,Y1=594.0,X2=461.0,Y2=626.0)
    fbNEditBox[0]=(X1=446.0,Y1=493.0,X2=631.0,Y2=507.0)
    fbNEditBox[1]=(X1=446.0,Y1=527.0,X2=631.0,Y2=541.0)
    fbNEditBox[2]=(X1=446.0,Y1=561.0,X2=631.0,Y2=575.0)
    fbBackgroundImage=(X1=262.0,Y1=116.0,X2=761.0,Y2=652.0)
    fbTopLine=(X1=282.0,Y1=136.0,X2=741.0,Y2=162.0)
    fbBottomLine=(X1=282.0,Y1=589.0,X2=741.0,Y2=632.0)
    fbButtonOK=(X1=465.0,Y1=594.0,X2=559.0,Y2=626.0)
    fbButtonCancel=(X1=563.0,Y1=594.0,X2=657.0,Y2=626.0)
    strTitle="Low Durability Warning"
    strOK="Repair"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnPreDraw=Internal_OnPreDraw
}