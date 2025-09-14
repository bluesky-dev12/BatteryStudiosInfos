class GUIMultiColumnList extends GUIVertList
    native
    editinlinenew
    instanced;

struct native init MultiColumnSortData
{
    var() const editconst string SortString;
    var() const editconst int SortItem;
};

var() localized array<localized string> ColumnHeadings;
var() array<float> InitColumnPerc;
var() localized array<localized string> ColumnHeadingHints;
var const array<MultiColumnSortData> SortData;
var const array<int> InvSortData;
var() const editconst array<editconst float> ColumnWidths;
var() float CellSpacing;
var() int SortColumn;
var() bool NeedsSorting;
var() bool SortDescending;
var() bool ExpandLastColumn;
var() int NoVisibleRows;
var() int NoVisibleCols;
//var delegate<OnColumnSized> __OnColumnSized__Delegate;
//var delegate<GetSortString> __GetSortString__Delegate;

delegate OnColumnSized(int Column)
{
    //return;    
}

// Export UGUIMultiColumnList::execGetListIndex(FFrame&, void* const)
native final function int GetListIndex(int YourArrayIndex)
{
    //native.YourArrayIndex;        
}

// Export UGUIMultiColumnList::execChangeSortOrder(FFrame&, void* const)
native final function ChangeSortOrder();

// Export UGUIMultiColumnList::execSortList(FFrame&, void* const)
native final function SortList();

// Export UGUIMultiColumnList::execUpdatedItem(FFrame&, void* const)
native final function UpdatedItem(int YourArrayIndex)
{
    //native.YourArrayIndex;        
}

// Export UGUIMultiColumnList::execRemovedItem(FFrame&, void* const)
native final function RemovedItem(int YourArrayIndex)
{
    //native.YourArrayIndex;        
}

// Export UGUIMultiColumnList::execAddedItem(FFrame&, void* const)
native final function AddedItem(optional int YourArrayIndex)
{
    //native.YourArrayIndex;        
}

delegate string GetSortString(int YourArrayIndex)
{
    //return;    
}

function int CurrentListId()
{
    // End:0x11
    if(Index < 0)
    {
        return -1;
    }
    return SortData[Index].SortItem;
    //return;    
}

event OnSortChanged()
{
    // End:0x0E
    if(SortData.Length <= 0)
    {
        return;
    }
    ChangeSortOrder();
    SortList();
    // End:0x34
    if(IsValid())
    {
        Index = InvSortData[Index];
    }
    //return;    
}

function Clear()
{
    SortData.Remove(0, SortData.Length);
    InvSortData.Remove(0, InvSortData.Length);
    super(GUIListBase).Clear();
    //return;    
}

function RemovedCurrent()
{
    // End:0x20
    if(IsValid())
    {
        RemovedItem(CurrentListId());
        SetIndex(Index);
    }
    //return;    
}

function ResolutionChanged(int ResX, int ResY)
{
    // End:0x13
    if(!bInit)
    {
        bInit = true;
    }
    super(GUIComponent).ResolutionChanged(ResX, ResY);
    //return;    
}

event InitializeColumns(Canvas C)
{
    local int i;
    local float AW;

    // End:0x5A
    if(bDebugging)
    {
        Log((((string(Name) @ "#### InitializeColumns ActualWidth() = ") @ string(ActualWidth())) @ "WinWidth:") $ string(WinWidth));
    }
    AW = ActualWidth();
    i = 0;
    J0x6A:

    // End:0xEA [Loop If]
    if(i < InitColumnPerc.Length)
    {
        // End:0xC2
        if(bDebugging)
        {
            Log((((string(Name) @ "#### InitColumnPerc[") $ string(i)) $ "]:") $ string(InitColumnPerc[i]));
        }
        ColumnWidths[i] = AW * InitColumnPerc[i];
        i++;
        // [Loop Continue]
        goto J0x6A;
    }
    bInit = false;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local float X;
    local int i;

    // End:0x0B
    if(bInit)
    {
        return false;
    }
    // End:0x34
    if(NeedsSorting)
    {
        SortList();
        // End:0x34
        if(IsValid())
        {
            Index = InvSortData[Index];
        }
    }
    // End:0x89
    if(ExpandLastColumn)
    {
        i = 0;
        J0x44:

        // End:0x73 [Loop If]
        if(i < (ColumnWidths.Length - 1))
        {
            X += ColumnWidths[i];
            i++;
            // [Loop Continue]
            goto J0x44;
        }
        ColumnWidths[i] = ActualWidth() - X;
    }
    return false;
    //return;    
}

function GetCellLeftWidth(int Column, out float Left, out float width)
{
    local int i;

    Left = ClientBounds[0];
    i = 0;
    J0x14:

    // End:0x51 [Loop If]
    if((i < Column) && i < ColumnWidths.Length)
    {
        Left += ColumnWidths[i];
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    // End:0x75
    if(i < ColumnWidths.Length)
    {
        width = ColumnWidths[i];        
    }
    else
    {
        width = 0.0000000;
    }
    Left += CellSpacing;
    width -= (float(2) * CellSpacing);
    // End:0xBB
    if(Left >= Bounds[2])
    {
        width = 0.0000000;
    }
    // End:0xE9
    if((Left + width) >= Bounds[2])
    {
        width = Bounds[2] - Left;
    }
    // End:0x101
    if(width < float(0))
    {
        width = 0.0000000;
    }
    //return;    
}

function Sort()
{
    SortList();
    //return;    
}

function Dump()
{
    local int i;

    Log(("Dumping multicolumn list contents  '" $ string(Name)) $ "'");
    i = 0;
    J0x3D:

    // End:0x127 [Loop If]
    if(i < SortData.Length)
    {
        // End:0xC2
        if(i < InvSortData.Length)
        {
            Log((((((((" " $ string(i)) $ ")") @ "'") $ SortData[i].SortString) $ "'") @ string(SortData[i].SortItem)) @ "InvSortData:") $ string(InvSortData[i]));
            // [Explicit Continue]
            goto J0x11D;
        }
        Log(((((((" " $ string(i)) $ ")") @ "'") $ SortData[i].SortString) $ "'") @ string(SortData[i].SortItem)) @ "InvSortData: Invalid");
        J0x11D:

        i++;
        // [Loop Continue]
        goto J0x3D;
    }
    //return;    
}

function SetTopItem(int Item)
{
    Top = Item;
    // End:0x5C
    if((Top + ItemsPerPage) >= ItemCount)
    {
        Top = ItemCount - ItemsPerPage;
        // End:0x5C
        if(NoVisibleCols > 1)
        {
            Top = int(float(Top) + (float(Top) % float(2)));
        }
    }
    // End:0x7B
    if((Top < 0) || ItemsPerPage == 0)
    {
        Top = 0;
    }
    // End:0x8F
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    OnAdjustTop(self);
    // End:0xB8
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
    //return;    
}

defaultproperties
{
    CellSpacing=1.0000000
    OnPreDraw=GUIMultiColumnList.InternalOnPreDraw
}