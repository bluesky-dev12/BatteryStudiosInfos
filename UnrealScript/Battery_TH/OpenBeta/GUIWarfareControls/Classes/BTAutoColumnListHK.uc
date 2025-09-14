class BTAutoColumnListHK extends GUITabPanel
    editinlinenew
    instanced;

struct SaveListPos
{
    var int Top;
    var int Index;
    var int LastSelected;
    var int selectIndex;
    var int SelectIndexX;
    var int SelectIndexY;
    var int LastSelectedIndex;
    var int LastSelectedIndexHistory;
};

var SaveListPos slp;
var bool bAlwaysActiveCursor;
var bool bActiveCursor;
var() automated BTStretchedImageHK BackgroundImage;
var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var array<BTAutoColumnListHeaderHK> ACLHeaderList;
var array<BTAutoColumnListDataHK> ACLRowList;
var float saveTime;
var bool bSaveMode;
var int maxFontSize;
var Color DefaultColor;
var int selectIndex;
var int SelectIndexX;
var int SelectIndexY;
var int LastSelectedIndex;
var int LastSelectedIndexHistory;
var Image SelectImage;
var Image LastSelectedImage;
var Image DefaultRowImage;
//var delegate<SpliterDraw> __SpliterDraw__Delegate;
//var delegate<OnAdjustWindow> __OnAdjustWindow__Delegate;
//var delegate<OnHitBottom> __OnHitBottom__Delegate;
//var delegate<OnHitTop> __OnHitTop__Delegate;

function InitScrollBar()
{
    local Image img, zoneimg;
    local export editinline BTScrollButtonHK ibtn, dbtn;
    local export editinline BTGripButtonHK Grip;
    local export editinline BTScrollZoneHK Zone;
    local export editinline GUIVertScrollBar vsb;

    Zone = new Class'GUIWarfareControls_Decompressed.BTScrollZoneHK';
    zoneimg.Width = 8.0000000;
    zoneimg.Height = 8.0000000;
    zoneimg.Image = Texture'Warfare_TH_UI_UI.Common.scrol_back';
    zoneimg.DrawType = 15;
    zoneimg.DrawColor = self.WhiteColor;
    Zone.zoneImage = zoneimg;
    MultiColumnBox.MyScrollBar.MyScrollZone = Zone;
    ibtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img.Width = 12.0000000;
    img.Height = 12.0000000;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_up_n';
    img.DrawType = 28;
    img.DrawColor = self.WhiteColor;
    ibtn.buttonImage[0] = img;
    ibtn.buttonImage[3] = img;
    ibtn.buttonImage[4] = img;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_up_on';
    ibtn.buttonImage[1] = img;
    ibtn.buttonImage[2] = img;
    ibtn.buttonImage[5] = zoneimg;
    MultiColumnBox.MyScrollBar.MyDecreaseButton = ibtn;
    dbtn = new Class'GUIWarfareControls_Decompressed.BTScrollButtonHK';
    img.Width = 12.0000000;
    img.Height = 12.0000000;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_dn_n';
    img.DrawType = 28;
    img.DrawColor = self.WhiteColor;
    dbtn.buttonImage[0] = img;
    dbtn.buttonImage[3] = img;
    dbtn.buttonImage[4] = img;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_dn_on';
    dbtn.buttonImage[1] = img;
    dbtn.buttonImage[2] = img;
    dbtn.buttonImage[5] = zoneimg;
    MultiColumnBox.MyScrollBar.MyIncreaseButton = dbtn;
    Grip = new Class'GUIWarfareControls_Decompressed.BTGripButtonHK';
    img.Width = 14.0000000;
    img.Height = 16.0000000;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_grip_n';
    img.DrawType = 15;
    img.DrawColor = self.WhiteColor;
    Grip.buttonImage[0] = img;
    Grip.buttonImage[3] = img;
    Grip.buttonImage[4] = img;
    img.Image = Texture'Warfare_TH_UI_UI.Common.scrol_grip_on';
    Grip.buttonImage[1] = img;
    Grip.buttonImage[2] = img;
    MultiColumnBox.MyScrollBar.MyGripButton = Grip;
    vsb = GUIVertScrollBar(MultiColumnBox.MyScrollBar);
    Grip.__OnMousePressed__Delegate = vsb.GripPressed;
    Zone.__OnScrollZoneClick__Delegate = vsb.ZoneClick;
    ibtn.__OnClick__Delegate = vsb.DecreaseClick;
    dbtn.__OnClick__Delegate = vsb.IncreaseClick;
    slp.LastSelectedIndex = -1;
    slp.LastSelectedIndexHistory = -1;
    slp.selectIndex = -1;
    //return;    
}

function SavePos()
{
    slp.LastSelected = MultiColumnList.LastSelected;
    slp.Index = MultiColumnList.Index;
    slp.Top = MultiColumnList.Top;
    slp.LastSelectedIndex = LastSelectedIndex;
    slp.LastSelectedIndexHistory = LastSelectedIndexHistory;
    slp.selectIndex = selectIndex;
    slp.SelectIndexX = SelectIndexX;
    slp.SelectIndexY = SelectIndexY;
    //return;    
}

function LoadPos()
{
    MultiColumnList.LastSelected = slp.LastSelected;
    MultiColumnList.Index = slp.Index;
    MultiColumnList.Top = slp.Top;
    LastSelectedIndex = slp.LastSelectedIndex;
    LastSelectedIndexHistory = slp.LastSelectedIndexHistory;
    selectIndex = slp.selectIndex;
    SelectIndexX = slp.SelectIndexX;
    SelectIndexY = slp.SelectIndexY;
    MultiColumnList.MyScrollBar.AlignThumb();
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    InitScrollBar();
    super(GUIPanel).InitComponent(MyController, myOwner);
    DefaultColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.CellSpacing = 0.0000000;
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    BackgroundImage.__OnDraw__Delegate = BackgroundImage_OnDraw;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.__OnClick__Delegate = MultiColumnList_OnClick;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    MultiColumnList.__OnActivate__Delegate = MultiColumnList_InternalActivate;
    MultiColumnList.__OnDeActivate__Delegate = MultiColumnList_InternalDeactivate;
    MultiColumnList.__OnAdjustTop__Delegate = MultiColumnList_OnAdjustTop;
    MultiColumnList.bDrawSelectionBorder = false;
    MultiColumnList.bHotTrack = true;
    MultiColumnList.bHotTrackStrictMode = true;
    MultiColumnList.bHotTrackOnInactive = true;
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bForceScrollBarPosition = true;
    MultiColumnList.MyScrollBar.bUseAWinPos = true;
    fb.X1 = AWinPos.X2;
    fb.Y1 = AWinPos.Y1;
    fb.X2 = AWinPos.X2 + float(14);
    fb.Y2 = AWinPos.Y2;
    MultiColumnList.MyScrollBar.AWinPos = fb;
    MultiColumnList.MyScrollBar.ApplyAWinPos();
    selectIndex = -1;
    LastSelectedIndex = -1;
    LastSelectedIndexHistory = -1;
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
    //return;    
}

function int AddColumn(BTAutoColumnListHeaderHK Item)
{
    MultiColumnList.ColumnHeadings[MultiColumnList.ColumnHeadings.Length] = Item.ColumnName;
    MultiColumnBox.HeaderColumnPerc[MultiColumnBox.HeaderColumnPerc.Length] = Item.ColumnPerc;
    Item.ColumnIndex = ACLHeaderList.Length;
    ACLHeaderList[ACLHeaderList.Length] = Item;
    return Item.ColumnIndex;
    //return;    
}

function AddRow(BTAutoColumnListDataHK Item, optional bool bSet, optional int Index)
{
    // End:0x18
    if(bSet == false)
    {
        Index = ACLRowList.Length;
    }
    ACLRowList.Insert(Index, 1);
    ACLRowList[Index] = Item;
    MultiColumnList.AddedItem();
    MultiColumnList.MyScrollBar.AlignThumb();
    //return;    
}

function RemoveRow(int Index)
{
    ACLRowList.Remove(Index, 1);
    MultiColumnList.RemovedItem(0);
    // End:0x36
    if(selectIndex == Index)
    {
        selectIndex = -1;
    }
    // End:0x50
    if(LastSelectedIndex == Index)
    {
        LastSelectedIndex = -1;
    }
    // End:0x6A
    if(LastSelectedIndexHistory == Index)
    {
        LastSelectedIndexHistory = -1;
    }
    //return;    
}

function RemoveRowArray(int StartIndex, int endLength)
{
    local int i;

    ACLRowList.Remove(StartIndex, endLength);
    i = 0;
    J0x17:

    // End:0x40 [Loop If]
    if(i < endLength)
    {
        MultiColumnList.RemovedItem(0);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function RemoveAll()
{
    MultiColumnList.Clear();
    ACLRowList.Length = 0;
    selectIndex = -1;
    LastSelectedIndex = -1;
    LastSelectedIndexHistory = -1;
    //return;    
}

function BTAutoColumnListDataHK GetRowByIndex(int Index)
{
    // End:0x1F
    if((Index < 0) || Index >= ACLRowList.Length)
    {
        return none;
    }
    return ACLRowList[Index];
    //return;    
}

function int GetCurrentIndex()
{
    return MultiColumnList.Index;
    //return;    
}

function SortColumn(int ColumnIndex, optional bool bReverseSort)
{
    local BTAutoColumnListDataHK Item;
    local int insertPos, i;

    // End:0x12
    if(ColumnIndex >= ACLHeaderList.Length)
    {
        return;
    }
    // End:0x20
    if(ACLRowList.Length <= 1)
    {
        return;
    }
    i = 1;
    J0x27:

    // End:0xC2 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x59
        if(bReverseSort)
        {
            insertPos = ReverseBinarySearchIndex(ColumnIndex, i);            
        }
        else
        {
            insertPos = BinarySearchIndex(ColumnIndex, i);
        }
        // End:0xB8
        if(insertPos != i)
        {
            Item = ACLRowList[i];
            ACLRowList.Remove(i, 1);
            ACLRowList.Insert(insertPos, 1);
            ACLRowList[insertPos] = Item;
        }
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    //return;    
}

function int ReverseBinarySearchIndex(int ColumnIndex, int dataIndex)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x1AA [Loop If]
    if(i < dataIndex)
    {
        // End:0x81
        if(int(ACLHeaderList[ColumnIndex].ColumnType) == int(1))
        {
            // End:0x7E
            if(ACLRowList[i].DataPerColumn[ColumnIndex].IntValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].IntValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1A0;
        }
        // End:0xEC
        if(int(ACLHeaderList[ColumnIndex].ColumnType) == int(2))
        {
            // End:0xE9
            if(ACLRowList[i].DataPerColumn[ColumnIndex].floatValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].floatValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1A0;
        }
        // End:0x157
        if(int(ACLHeaderList[ColumnIndex].ColumnType) == int(0))
        {
            // End:0x154
            if(ACLRowList[i].DataPerColumn[ColumnIndex].strValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].strValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1A0;
        }
        // End:0x1A0
        if(ACLRowList[i].DataPerColumn[ColumnIndex].strValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].strValue)
        {
            return i;
        }
        J0x1A0:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return i;
    //return;    
}

function int BinarySearchIndex(int ColumnIndex, int dataIndex)
{
    local int i;
    local BTAutoColumnListHeaderHK.AutoColumnType ct;

    ct = ACLHeaderList[ColumnIndex].ColumnType;
    i = 0;
    J0x21:

    // End:0x1DF [Loop If]
    if(i < dataIndex)
    {
        // End:0xB0
        if(((int(ct) == int(1)) || int(ct) == int(3)) || int(ct) == int(5))
        {
            // End:0xAD
            if(ACLRowList[i].DataPerColumn[ColumnIndex].IntValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].IntValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1D5;
        }
        // End:0x130
        if(((int(ct) == int(2)) || int(ct) == int(4)) || int(ct) == int(6))
        {
            // End:0x12D
            if(ACLRowList[i].DataPerColumn[ColumnIndex].floatValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].floatValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1D5;
        }
        // End:0x18C
        if(int(ct) == int(0))
        {
            // End:0x189
            if(ACLRowList[i].DataPerColumn[ColumnIndex].strValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].strValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1D5;
        }
        // End:0x1D5
        if(ACLRowList[i].DataPerColumn[ColumnIndex].strValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].strValue)
        {
            return i;
        }
        J0x1D5:

        i++;
        // [Loop Continue]
        goto J0x21;
    }
    return i;
    //return;    
}

function SortBySelectLocation(int ColumnIndex, int valueIndex, optional bool bReverseSort)
{
    local BTAutoColumnListDataHK Item;
    local int insertPos, i;

    // End:0x12
    if(ColumnIndex >= ACLHeaderList.Length)
    {
        return;
    }
    // End:0x20
    if(ACLRowList.Length <= 1)
    {
        return;
    }
    i = 1;
    J0x27:

    // End:0xCC [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x5E
        if(bReverseSort)
        {
            insertPos = ReverseBinarySearchIndexBySelectLocation(ColumnIndex, valueIndex, i);            
        }
        else
        {
            insertPos = BinarySearchIndexBySelectLocation(ColumnIndex, valueIndex, i);
        }
        // End:0xC2
        if(insertPos != i)
        {
            Item = ACLRowList[i];
            ACLRowList.Remove(i, 1);
            ACLRowList.Insert(insertPos, 1);
            ACLRowList[insertPos] = Item;
        }
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    //return;    
}

function int ReverseBinarySearchIndexBySelectLocation(int ColumnIndex, int valueIndex, int dataIndex)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x1C7 [Loop If]
    if(i < dataIndex)
    {
        // End:0x6D
        if(valueIndex == 0)
        {
            // End:0x6A
            if(ACLRowList[i].DataPerColumn[ColumnIndex].IntValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].IntValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0xC4
        if(valueIndex == 1)
        {
            // End:0xC1
            if(ACLRowList[i].DataPerColumn[ColumnIndex].floatValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].floatValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0x11C
        if(valueIndex == 2)
        {
            // End:0x119
            if(ACLRowList[i].DataPerColumn[ColumnIndex].strValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].strValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0x174
        if(valueIndex == 3)
        {
            // End:0x171
            if(ACLRowList[i].DataPerColumn[ColumnIndex].tempValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].tempValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0x1BD
        if(ACLRowList[i].DataPerColumn[ColumnIndex].IntValue >= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].IntValue)
        {
            return i;
        }
        J0x1BD:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return i;
    //return;    
}

function int BinarySearchIndexBySelectLocation(int ColumnIndex, int valueIndex, int dataIndex)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x1C7 [Loop If]
    if(i < dataIndex)
    {
        // End:0x6D
        if(valueIndex == 0)
        {
            // End:0x6A
            if(ACLRowList[i].DataPerColumn[ColumnIndex].IntValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].IntValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0xC4
        if(valueIndex == 1)
        {
            // End:0xC1
            if(ACLRowList[i].DataPerColumn[ColumnIndex].floatValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].floatValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0x11C
        if(valueIndex == 2)
        {
            // End:0x119
            if(ACLRowList[i].DataPerColumn[ColumnIndex].strValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].strValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0x174
        if(valueIndex == 3)
        {
            // End:0x171
            if(ACLRowList[i].DataPerColumn[ColumnIndex].tempValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].tempValue)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x1BD;
        }
        // End:0x1BD
        if(ACLRowList[i].DataPerColumn[ColumnIndex].IntValue <= ACLRowList[dataIndex].DataPerColumn[ColumnIndex].IntValue)
        {
            return i;
        }
        J0x1BD:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return i;
    //return;    
}

function NormalizeColumnPerc()
{
    local float sumPerc;
    local int i;

    sumPerc = 0.0000000;
    i = 0;
    J0x12:

    // End:0x47 [Loop If]
    if(i < ACLHeaderList.Length)
    {
        sumPerc += ACLHeaderList[i].ColumnPerc;
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    i = 0;
    J0x4E:

    // End:0xC1 [Loop If]
    if(i < ACLHeaderList.Length)
    {
        ACLHeaderList[i].ColumnPerc = ACLHeaderList[i].ColumnPerc / sumPerc;
        MultiColumnBox.HeaderColumnPerc[i] = ACLHeaderList[i].ColumnPerc;
        i++;
        // [Loop Continue]
        goto J0x4E;
    }
    //return;    
}

function bool MultiColumnList_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool MultiColumnList_OnDblClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function int FindLastPressedColumn()
{
    local float Left, Width;
    local int i, lx;

    lx = self.MultiColumnList.LastPressX;
    i = 0;
    J0x20:

    // End:0x8E [Loop If]
    if(i < ACLHeaderList.Length)
    {
        self.MultiColumnList.GetCellLeftWidth(i, Left, Width);
        // End:0x84
        if((float(lx) >= Left) && float(lx) <= (Left + Width))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    return -1;
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    selectIndex = -1;
    LastSelectedIndex = -1;
    return false;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return float(maxFontSize * 3);
    //return;    
}

delegate SpliterDraw(Canvas C, float X, float Y, float W, float HT, int SpliterIndex)
{
    //return;    
}

function bool BackgroundImage_OnDraw(Canvas C)
{
    C.DrawColor = DefaultColor;
    DrawDefaultRowImage(C);
    return false;
    //return;    
}

function DrawDefaultRowImage(Canvas C)
{
    local int hStep, X, Y, X2, hCount, i;

    X = int(MultiColumnList.ActualLeft());
    X2 = int(float(X) + MultiColumnList.ActualWidth());
    Y = int(MultiColumnList.ActualTop());
    hStep = int(MultiColumnList.ItemHeight);
    hCount = MultiColumnBox.List.ItemsPerPage;
    i = 0;
    J0x7F:

    // End:0xEC [Loop If]
    if(i < hCount)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, DefaultRowImage, float(X), float(Y + (hStep * i)), float(X2), float(Y + (hStep * (i + 1))));
        i++;
        // [Loop Continue]
        goto J0x7F;
    }
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local int i, rowState;
    local float Left, Width;
    local ACLData Data;
    local float ColumnWidth, columnHeight;
    local int ImageIndex;
    local string DrawText;

    rowState = 0;
    C.Style = 5;
    i = 0;
    J0x1F:

    // End:0x70F [Loop If]
    if(i < ACLHeaderList.Length)
    {
        MultiColumnList.GetCellLeftWidth(i, Left, Width);
        // End:0x63
        if(bSelected == true)
        {
            rowState = 1;            
        }
        else
        {
            // End:0x8E
            if(bActiveCursor && MultiColumnList.LastSelected == Item)
            {
                rowState = 2;
            }
        }
        C.DrawColor = DefaultColor;
        ColumnWidth = Width;
        columnHeight = HT;
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[i].ColumnBackgroundImage, Left, Y, Left + ColumnWidth, Y + columnHeight);
        Data = self.ACLRowList[Item].DataPerColumn[i];
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Data.Image, Left, Y, Left + ColumnWidth, Y + columnHeight);
        // End:0x27A
        if(self.ACLRowList[Item].bSpliter)
        {
            // End:0x278
            if(i == 0)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, self.ACLRowList[Item].BackgroundImage, X, Y, X + W, Y + HT);
                C.DrawColor = Data.Text[0].DrawColor;
                Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[0].FontDrawType, float(Data.Text[0].FontSize), X, Y, X + W, Y + HT, 0, 2, 0, 0, Data.Text[0].DrawShadowColor);
            }
            return;
        }
        // End:0x3BB
        if(i == 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, self.ACLRowList[Item].BackgroundImage, X, Y, X + W, Y + HT);
            // End:0x34D
            if(bActiveCursor && MultiColumnList.LastSelected == Item)
            {
                LastSelectedIndex = Item;
                LastSelectedIndexHistory = Item;
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, self.LastSelectedImage, X, Y, X + W, Y + HT);
            }
            // End:0x3BB
            if(bSelected)
            {
                selectIndex = Item;
                SelectIndexX = int(X);
                SelectIndexY = int(Y);
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, self.SelectImage, X, Y, X + W, Y + HT);
            }
        }
        // End:0x5B1
        if(int(ACLHeaderList[i].ColumnType) <= int(4))
        {
            // End:0x40C
            if(int(ACLHeaderList[i].ColumnType) == int(0))
            {
                DrawText = Data.strValue;                
            }
            else
            {
                // End:0x440
                if(int(ACLHeaderList[i].ColumnType) == int(1))
                {
                    DrawText = string(Data.IntValue);                    
                }
                else
                {
                    // End:0x474
                    if(int(ACLHeaderList[i].ColumnType) == int(2))
                    {
                        DrawText = string(Data.floatValue);                        
                    }
                    else
                    {
                        // End:0x4BF
                        if(int(ACLHeaderList[i].ColumnType) == int(3))
                        {
                            DrawText = ACLHeaderList[i].IntToString(Data.IntValue);                            
                        }
                        else
                        {
                            // End:0x509
                            if(int(ACLHeaderList[i].ColumnType) == int(4))
                            {
                                DrawText = ACLHeaderList[i].FloatToString(float(Data.IntValue));
                            }
                        }
                    }
                }
            }
            C.DrawColor = Data.Text[rowState].DrawColor;
            Class'Engine.BTCustomDrawHK'.static.DrawEllipsisString(C, DrawText, Data.Text[rowState].FontDrawType, float(Data.Text[rowState].FontSize), 1.0000000, Left, Y, Left + Width, Y + HT, Data.Text[rowState].DrawShadowColor);
            // [Explicit Continue]
            goto J0x705;
        }
        // End:0x697
        if(int(ACLHeaderList[i].ColumnType) <= int(6))
        {
            // End:0x61B
            if(int(ACLHeaderList[i].ColumnType) == int(6))
            {
                ImageIndex = ACLHeaderList[i].FloatToImageIndex(Data.floatValue);                
            }
            else
            {
                ImageIndex = ACLHeaderList[i].IntToImageIndex(Data.IntValue);
            }
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[i].ColumnImageList[ImageIndex], Left, Y, Left + ColumnWidth, Y + columnHeight);
            // [Explicit Continue]
            goto J0x705;
        }
        // End:0x705
        if(int(ACLHeaderList[i].ColumnType) <= int(7))
        {
            ACLHeaderList[i].CustomDraw(C, Left, Y, Left + ColumnWidth, Y + columnHeight, Data, i, Item);
        }
        J0x705:

        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    // End:0x732
    if(bActiveCursor && MultiColumnList.LastSelected == Item)
    {
    }
    //return;    
}

function MultiColumnList_InternalActivate()
{
    bActiveCursor = true;
    //return;    
}

function MultiColumnList_InternalDeactivate()
{
    bActiveCursor = false;
    // End:0x19
    if(bAlwaysActiveCursor)
    {
        bActiveCursor = true;
    }
    //return;    
}

function MultiColumnList_OnAdjustTop(GUIComponent Sender)
{
    OnAdjustWindow(MultiColumnList.Top, MultiColumnList.ItemCount, MultiColumnList.ItemsPerPage);
    // End:0x7C
    if(MultiColumnList.Top <= 0)
    {
        OnHitTop(MultiColumnList.Top, MultiColumnList.ItemCount, MultiColumnList.ItemsPerPage);
    }
    // End:0xE1
    if((MultiColumnList.Top + MultiColumnList.ItemsPerPage) >= MultiColumnList.ItemCount)
    {
        OnHitBottom(MultiColumnList.Top, MultiColumnList.ItemCount, MultiColumnList.ItemsPerPage);
    }
    //return;    
}

delegate OnAdjustWindow(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate OnHitBottom(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate OnHitTop(int Top, int Count, int itemperpage)
{
    //return;    
}

defaultproperties
{
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTAutoColumnListHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.BTAutoColumnListHK.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        bDisplayHeader=false
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
        bBoundToParent=true
        bScaleToParent=true
    end object
    MultiColumnBox=mMultiColumnBox
    maxFontSize=10
}