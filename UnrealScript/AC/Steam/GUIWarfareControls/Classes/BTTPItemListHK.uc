/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPItemListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:4
 *
 *******************************************************************************/
class BTTPItemListHK extends GUITabPanel
    dependson(BTItemImageListHK)
    dependson(BTRODecorateStringHK)
    editinlinenew
    instanced;

var export editinline BTItemImageListHK ItemList;
var BTItemCommonInfoHK MyData;
var bool bAuctionList;
var localized string strRRMsg[8];
var int savedRRIndex;
var BTRODecorateStringHK decoAuctionToolTips;
var int OutLineHorzBorder;
var int OutLineVertBorder;

function UpdateServerTime(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4d [While If]
    if(i < ItemList.DataPool.Length)
    {
        ItemList.DataPool[i].UpdateTime(D);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetOutlineBorder(int horz, int vert)
{
    OutLineHorzBorder = horz;
    OutLineVertBorder = vert;
    ItemList.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
    ItemList.TraversalApplyAWinPos();
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    ItemList = new class'BTItemImageListHK';
    ItemList.bUseAWinPos = true;
    ItemList.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
    ItemList.RenderWeight = 0.70;
    ItemList.InitComponent(Controller, self);
    AppendComponent(ItemList);
    ItemList.ImageList.bAlwaysShowScrollbar = true;
    ItemList.ImageList.bVisibleWhenEmpty = true;
    ItemList.ImageListBox.MyScrollBar.bUseAWinPos = true;
    ItemList.ImageListBox.MyScrollBar.AWinPos.X1 = AWinPos.X2;
    ItemList.ImageListBox.MyScrollBar.AWinPos.X2 = AWinPos.X2 + float(11);
    ItemList.ImageListBox.MyScrollBar.AWinPos.Y1 = AWinPos.Y1;
    ItemList.ImageListBox.MyScrollBar.AWinPos.Y2 = AWinPos.Y2;
    ItemList.ImageListBox.MyScrollBar.ApplyAWinPos();
    MyData = new class'BTItemCommonInfoHK';
    decoAuctionToolTips = new class'BTRODecorateStringHK';
    decoAuctionToolTips.Init();
    decoAuctionToolTips.OriginalString.FontDrawType = 3;
    decoAuctionToolTips.InternalPadding[0] = 5;
    decoAuctionToolTips.InternalPadding[1] = 5;
    decoAuctionToolTips.InternalPadding[2] = 5;
    decoAuctionToolTips.InternalPadding[3] = 5;
    savedRRIndex = -1;
    ItemList.ImageList.OnClickSound = 9;
    ItemList.ImageListBox.OnClickSound = 9;
}

function Internal_OnRendered(Canvas C)
{
    local BTROItemBoxHK ro;

    // End:0x153
    if(bAuctionList)
    {
        ro = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]);
        // End:0x12e
        if(ro.bMouseOn && ro.bRedAuction)
        {
            decoAuctionToolTips.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) + 10), float(int(Controller.MouseY)), float(int(Controller.MouseX) + 10 + 160), float(int(Controller.MouseY) + 20));
            decoAuctionToolTips.OriginalString.Text = strRRMsg[ro.RRIndex];
            decoAuctionToolTips.bNeedUpdate = true;
            savedRRIndex = ro.RRIndex;
            decoAuctionToolTips.bVisible = true;
        }
        // End:0x13f
        else
        {
            decoAuctionToolTips.bVisible = false;
        }
        decoAuctionToolTips.Render(C);
    }
}

defaultproperties
{
    strRRMsg[0]="You may only sell spoils and certain cash items through auction."
    strRRMsg[1]="Timed items that have been used cannot be sold through auction."
    strRRMsg[2]="Items with a damage level of 100 or more cannot be sold through auction."
    strRRMsg[3]="You must fully repair an item before you can sell it at auction."
    strRRMsg[4]="Equipped items cannot be sold through auction."
    strRRMsg[5]="Items registered in the quick slot cannot be sold through auction."
    strRRMsg[6]="Unrepairable items cannot be sold through auction."
    strRRMsg[7]="Items purchased from the auction house are bound to the character and cannot be traded."
    OnRendered=Internal_OnRendered
}