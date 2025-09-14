class BTAutoScrollListHK extends GUITabPanel
    editinlinenew
    instanced;

const C_MaxRowCount = 100;
const C_DefaultfontSize = 10;

var array<string> arrLeftStr;
var bool bAutoShowScrollBar;
var bool bActiveCursor;
var() automated BTStretchedImageHK BackgroundImage;
var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var bool bMaxRowItem;
var int topIdx;
var int curIdx;
var array<Text> ASLRowList;
var int maxFontSize;
var Image SelectImage;
var Image LastSelectedImage;
//var delegate<CustomDraw> __CustomDraw__Delegate;

function InitScrollBar()
{
    local Image img, zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new Class'GUIWarfareControls_Decompressed.BTScrollZoneHK';
    zoneimg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_back;
    Zone.zoneImage = zoneimg;
    MultiColumnBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_n;
    ibtn.buttonImage[0] = img;
    ibtn.buttonImage[3] = img;
    ibtn.buttonImage[4] = img;
    img = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_up_on;
    ibtn.buttonImage[1] = img;
    ibtn.buttonImage[2] = img;
    ibtn.buttonImage[5] = zoneimg;
    MultiColumnBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_n;
    dbtn.buttonImage[0] = img;
    dbtn.buttonImage[3] = img;
    dbtn.buttonImage[4] = img;
    img = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_dn_on;
    dbtn.buttonImage[1] = img;
    dbtn.buttonImage[2] = img;
    dbtn.buttonImage[5] = zoneimg;
    MultiColumnBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new Class'GUIWarfareControls_Decompressed.BTGripButtonHK';
    img = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_grip_n;
    Grip.buttonImage[0] = img;
    Grip.buttonImage[3] = img;
    Grip.buttonImage[4] = img;
    img = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.scrol_grip_on;
    Grip.buttonImage[1] = img;
    Grip.buttonImage[2] = img;
    MultiColumnBox.MyScrollBar.MyGripButton = Grip;
    vsb = GUIVertScrollBar(MultiColumnBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;
    local Image ruii, ruii2;

    InitScrollBar();
    super(GUIPanel).InitComponent(MyController, myOwner);
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.CellSpacing = 0.0000000;
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.__OnActivate__Delegate = InternalActivate;
    MultiColumnList.__OnDeActivate__Delegate = InternalDeactivate;
    MultiColumnList.bDrawSelectionBorder = false;
    MultiColumnList.bHotTrack = true;
    MultiColumnList.bHotTrackStrictMode = true;
    MultiColumnList.bHotTrackOnInactive = true;
    MultiColumnList.bHotTrackSound = false;
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bForceScrollBarPosition = true;
    MultiColumnList.MyScrollBar.bUseAWinPos = true;
    fb.X1 = 745.0000000;
    fb.Y1 = 89.0000000;
    fb.X2 = 745.0000000 + float(13);
    fb.Y2 = 89.0000000 + float(644);
    MultiColumnList.MyScrollBar.AWinPos = fb;
    MultiColumnList.MyScrollBar.ApplyAWinPos();
    MultiColumnList.CallDrawItemForPlaceHoldingItems = true;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    MultiColumnList.ColumnHeadings[0] = "Chat";
    MultiColumnBox.HeaderColumnPerc[0] = 1.0000000;
    bMaxRowItem = false;
    curIdx = 0;
    topIdx = 0;
    maxFontSize = 10;
    ASLRowList.Length = 100;
    MultiColumnBox.bBoundToParent = false;
    MultiColumnBox.bScaleToParent = false;
    MultiColumnList.bBoundToParent = false;
    MultiColumnList.bScaleToParent = false;
    MultiColumnBox.bUseAWinPos = true;
    MultiColumnBox.AWinPos = AWinPos;
    MultiColumnBox.ApplyAWinPos();
    MultiColumnList.bUseAWinPos = true;
    MultiColumnList.AWinPos = AWinPos;
    MultiColumnList.ApplyAWinPos();
    MultiColumnList.NoVisibleRows = 100;
    //return;    
}

function AddLineRow(Canvas C, string Text)
{
    local int i;
    local Color Black;
    local array<string> lineText;

    Black = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, byte(255));
    // End:0x15E
    if(C != none)
    {
        Split(Text, Chr(13), lineText);
        i = 0;
        J0x41:

        // End:0x80 [Loop If]
        if(i < lineText.Length)
        {
            AddRowFinal(C, lineText[i], self.WhiteColor, Black);
            i++;
            // [Loop Continue]
            goto J0x41;
        }
        // End:0x15B
        if(bAutoShowScrollBar)
        {
            // End:0x102
            if(MultiColumnList.ItemCount > MultiColumnList.ItemsPerPage)
            {
                MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2, AWinPos.Y1, AWinPos.X2 + float(14), AWinPos.Y2);                
            }
            else
            {
                MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox();
            }
            MultiColumnList.MyScrollBar.bUseAWinPos = true;
            MultiColumnList.MyScrollBar.ApplyAWinPos();
        }        
    }
    else
    {
        arrLeftStr.Length = arrLeftStr.Length + 1;
        arrLeftStr[arrLeftStr.Length - 1] = Text;
    }
    //return;    
}

function AddRow(Canvas C, string Text)
{
    local Color Black;

    Black = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, byte(255));
    AddRowFinal(C, Text, self.WhiteColor, Black);
    //return;    
}

function AddRowColor(Canvas C, string Text, Color Front)
{
    local Color Black;

    Black = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, byte(255));
    AddRowFinal(C, Text, Front, Black);
    //return;    
}

function AddRowFinal(Canvas saveC, string Text, Color fntColor, Color fntShadowColor)
{
    local int i;
    local float tW, tH;
    local array<string> tarray;

    // End:0x0D
    if(saveC == none)
    {
        return;
    }
    saveC.BtrTextSize(Text, 10, tW, tH);
    // End:0x8D
    if(tW >= (AWinPos.X2 - AWinPos.X1))
    {
        Class'Engine.BTCustomDrawHK'.static.SplitTextBounds(saveC, tarray, Text, 10, (AWinPos.X2 - AWinPos.X1) * 0.9800000);        
    }
    else
    {
        tarray.Length = 1;
        tarray[0] = Text;
    }
    i = 0;
    J0xA9:

    // End:0x1E3 [Loop If]
    if(i < tarray.Length)
    {
        ASLRowList[curIdx].DrawColor = fntColor;
        ASLRowList[curIdx].DrawShadowColor = fntShadowColor;
        ASLRowList[curIdx].FontSize = 10;
        ASLRowList[curIdx++].Text = tarray[i];
        // End:0x129
        if(curIdx >= 100)
        {
            curIdx = 0;
        }
        // End:0x147
        if(curIdx == topIdx)
        {
            bMaxRowItem = true;
            topIdx++;
        }
        // End:0x15A
        if(topIdx >= 100)
        {
            topIdx = 0;
        }
        // End:0x1D9
        if(bMaxRowItem == false)
        {
            MultiColumnList.AddedItem();
            // End:0x1D9
            if(MultiColumnList.MyScrollBar.CurPos >= (MultiColumnList.MyScrollBar.ItemCount - MultiColumnList.MyScrollBar.ItemsPerPage))
            {
                MultiColumnList.MyScrollBar.WheelDown();
            }
        }
        i++;
        // [Loop Continue]
        goto J0xA9;
    }
    MultiColumnList.MyScrollBar.AlignThumb();
    //return;    
}

function Clear()
{
    local int i;

    J0x00:
    // End:0x0C [Loop If]
    if(PopRow())
    {
        // [Loop Continue]
        goto J0x00;
    }
    topIdx = 0;
    curIdx = 0;
    i = 0;
    J0x21:

    // End:0x4E [Loop If]
    if(i < ASLRowList.Length)
    {
        ASLRowList[i].Text = "";
        i++;
        // [Loop Continue]
        goto J0x21;
    }
    arrLeftStr.Length = 0;
    //return;    
}

function bool PopRow()
{
    // End:0x51
    if((bMaxRowItem == true) || topIdx != curIdx)
    {
        topIdx++;
        // End:0x37
        if(topIdx >= 100)
        {
            topIdx = 0;
        }
        bMaxRowItem = false;
        MultiColumnList.RemovedItem(0);
        return true;
    }
    return false;
    //return;    
}

function Text GetRowByIndex(int Index)
{
    return ASLRowList[ConvertRowToDataIndex(Index)];
    //return;    
}

function int ConvertRowToDataIndex(int Index)
{
    local int rightIdx;

    rightIdx = Index + topIdx;
    // End:0x27
    if(rightIdx >= 100)
    {
        rightIdx -= 100;
    }
    return rightIdx;
    //return;    
}

function int GetCurrentIndex()
{
    return MultiColumnList.Index;
    //return;    
}

function bool MultiColumnList_OnClick(GUIComponent Sender)
{
    return false;
    //return;    
}

function bool MultiColumnList_OnDblClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    return false;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return 18.0000000;
    //return;    
}

delegate CustomDraw(Canvas C, float X1, float Y1, float X2, float Y2, int ItemIndex)
{
    local int rightIdx;

    rightIdx = ConvertRowToDataIndex(ItemIndex);
    C.DrawColor = ASLRowList[rightIdx].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, ASLRowList[rightIdx].Text, 3, float(ASLRowList[rightIdx].FontSize), X1, Y1, X2, Y2, 7, 0, 7, 0, ASLRowList[rightIdx].DrawShadowColor);
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    C.Style = 5;
    // End:0x78
    if(bSelected)
    {
        C.DrawColor = self.SelectImage.DrawColor;
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, self.SelectImage, X, Y, X + W, Y + HT);
    }
    CustomDraw(C, X, Y, X + W, Y + HT, Item);
    //return;    
}

function InternalActivate()
{
    bActiveCursor = true;
    //return;    
}

function InternalDeactivate()
{
    bActiveCursor = false;
    //return;    
}

function bool Internal_OnPostDraw(Canvas C)
{
    local int i;

    // End:0x4B
    if(arrLeftStr.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0x43 [Loop If]
        if(i < arrLeftStr.Length)
        {
            AddLineRow(C, arrLeftStr[i]);
            i++;
            // [Loop Continue]
            goto J0x13;
        }
        arrLeftStr.Length = 0;
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTAutoScrollListHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.BTAutoScrollListHK.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        bDisplayHeader=false
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
        bBoundToParent=true
        bScaleToParent=true
    end object
    MultiColumnBox=mMultiColumnBox
    OnPostDraw=BTAutoScrollListHK.Internal_OnPostDraw
}