class BTTPItemListHK extends GUITabPanel
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

    // End:0x4D [Loop If]
    if(i < ItemList.DataPool.Length)
    {
        ItemList.DataPool[i].UpdateTime(D);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetOutlineBorder(int horz, int vert)
{
    OutLineHorzBorder = horz;
    OutLineVertBorder = vert;
    ItemList.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
    ItemList.TraversalApplyAWinPos();
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    ItemList = new Class'GUIWarfareControls_Decompressed.BTItemImageListHK';
    ItemList.bUseAWinPos = true;
    ItemList.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OutLineHorzBorder), AWinPos.Y1 + float(OutLineVertBorder), AWinPos.X2 - float(OutLineHorzBorder), AWinPos.Y2 - float(OutLineVertBorder));
    ItemList.RenderWeight = 0.7000000;
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
    MyData = new Class'GUIWarfareControls_Decompressed.BTItemCommonInfoHK';
    decoAuctionToolTips = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    decoAuctionToolTips.Init();
    decoAuctionToolTips.OriginalString.FontDrawType = 3;
    decoAuctionToolTips.InternalPadding[0] = 5;
    decoAuctionToolTips.InternalPadding[1] = 5;
    decoAuctionToolTips.InternalPadding[2] = 5;
    decoAuctionToolTips.InternalPadding[3] = 5;
    savedRRIndex = -1;
    ItemList.ImageList.OnClickSound = 9;
    ItemList.ImageListBox.OnClickSound = 9;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local BTROItemBoxHK ro;

    // End:0x153
    if(bAuctionList)
    {
        ro = BTROItemBoxHK(ItemList.DataList[ItemList.SelectItemIndex]);
        // End:0x12E
        if(ro.bMouseOn && ro.bRedAuction)
        {
            decoAuctionToolTips.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) + 10), float(int(Controller.MouseY)), float((int(Controller.MouseX) + 10) + 160), float(int(Controller.MouseY) + 20));
            decoAuctionToolTips.OriginalString.Text = strRRMsg[ro.RRIndex];
            decoAuctionToolTips.bNeedUpdate = true;
            savedRRIndex = ro.RRIndex;
            decoAuctionToolTips.bVisible = true;            
        }
        else
        {
            decoAuctionToolTips.bVisible = false;
        }
        decoAuctionToolTips.Render(C);
    }
    //return;    
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
    OnRendered=BTTPItemListHK.Internal_OnRendered
}