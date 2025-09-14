/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowItemBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:6
 *
 *******************************************************************************/
class BTWindowItemBoxHK extends BTWindowHK
    editinlinenew
    instanced;

var int BoxItemID;
var BtrDouble BoxUniqueID;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelDivider;
var export editinline BTOwnerDrawImageHK LabelDivider;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbInfoBox;
var export editinline BTItemInfoHorzBoxHK InfoBox;

function bool ImageListBox_OnClick(GUIComponent Sender)
{
    SelectItem(TPItemList.ItemList.SelectItemIndex);
    return false;
}

function bool SelectItem(int Index)
{
    local export editinline BTItemImageListHK ItemList;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    ItemList = TPItemList.ItemList;
    ItemInfo = BTROItemBoxHK(ItemList.DataList[Index]).ItemInfo;
    instanceInfo = BTROItemBoxHK(ItemList.DataList[Index]).instanceInfo;
    InfoBox.SetData(ItemInfo, instanceInfo, none, none);
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local wMatchMaker MM;

    super.InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    LabelDivider = NewLabelComponent(fbLabelDivider, class'BTUIResourcePoolHK'.default.img_divid_line);
    TPItemList = BTTPItemListHK(NewComponent(new class'BTTPItemListHK', fbTPItemList));
    TPItemList.ItemList.ImageList.__OnClick__Delegate = ImageListBox_OnClick;
    TPItemList.MyData.myLevel = MM.kLevel;
    TPItemList.MyData.MyCash = 99999;
    TPItemList.MyData.MyPoint = 99999;
    TPItemList.ItemList.SetItemCountPerPage(3, 3);
    InfoBox = BTItemInfoHorzBoxHK(NewComponent(new class'BTItemInfoHorzBoxHK', fbInfoBox));
    InfoBox.Panel.BackgroundImage.Image = none;
    InfoBox.SetWindowItemBox();
}

function int GetLastSelectItemID()
{
    local BTROItemBoxHK ro;

    ro = TPItemList.ItemList.DataPool[TPItemList.ItemList.LastSelectedItemIndex];
    return ro.ItemInfo.ItemID;
}

function int GetLastSelectPartID()
{
    local BTROItemBoxHK ro;

    ro = TPItemList.ItemList.DataPool[TPItemList.ItemList.LastSelectedItemIndex];
    return ro.instanceInfo.Extra;
}

function AddItem(int ItemID, int PartID)
{
    local BTROItemBoxHK ro;
    local wItemBoxInstanceHK instanceInfo;
    local wGameManager GameMgr;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ro = new class'BTROItemBoxHK';
    ro.Init();
    instanceInfo = new class'wItemBoxInstanceHK';
    // End:0xaa
    if(ItemID == 0)
    {
        // End:0xa5
        if(PartID != 0)
        {
        }
        // End:0xa7
        else
        {
            return;
        }
    }
    // End:0x24d
    else
    {
        ro.ItemInfo = GameMgr.FindUIItem(ItemID);
        instanceInfo.ItemID = ItemID;
        instanceInfo.Extra = PartID;
        // End:0x175
        if(ro.ItemInfo.CostType == 1 || ro.ItemInfo.CostType == 4)
        {
            instanceInfo.LeftTime.Day = PartID / 24;
            instanceInfo.LeftTime.Hour = int(float(PartID) % float(24));
        }
        // End:0x20f
        else
        {
            // End:0x1dd
            if(ro.ItemInfo.CostType == 0 || ro.ItemInfo.CostType == 2)
            {
                instanceInfo.PartID = PartID;
                instanceInfo.Durability = 100000;
            }
            // End:0x20f
            else
            {
                // End:0x20f
                if(ro.ItemInfo.CostType == 3)
                {
                    instanceInfo.OverlapCount = PartID;
                }
            }
        }
        // End:0x239
        if(GameMgr.FindFirstInstanceItemByItemID(ItemID) != none)
        {
            ro.RibbonState = 1;
        }
        ro.instanceInfo = instanceInfo;
    }
    ro.ChangeState(12);
    ro.MyData = TPItemList.MyData;
    ro.SetGameManager(GameMgr);
    ro.Update();
    TPItemList.ItemList.AddItem(ro);
    TPItemList.ItemList.ShowItemAll();
    SelectItem(0);
}

defaultproperties
{
    fbTPItemList=(X1=267.0,Y1=161.0,X2=762.0,Y2=418.0)
    fbLabelDivider=(X1=267.0,Y1=422.0,X2=762.0,Y2=424.0)
    fbInfoBox=(X1=267.0,Y1=426.0,X2=762.0,Y2=596.0)
    fbBackgroundImage=(X1=242.0,Y1=110.0,X2=783.0,Y2=660.0)
    fbTopLine=(X1=262.0,Y1=130.0,X2=763.0,Y2=157.0)
    fbBottomLine=(X1=262.0,Y1=596.0,X2=763.0,Y2=640.0)
    fbButtonOK=(X1=391.0,Y1=602.0,X2=511.0,Y2=635.0)
    fbButtonCancel=(X1=515.0,Y1=602.0,X2=635.0,Y2=635.0)
    strTitle="Item Box"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
}