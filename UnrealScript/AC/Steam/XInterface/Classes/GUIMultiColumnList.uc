/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIMultiColumnList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:15
 *	Functions:19
 *
 *******************************************************************************/
class GUIMultiColumnList extends GUIVertList
    dependson(GUIVertList)
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
var delegate<OnColumnSized> __OnColumnSized__Delegate;
var delegate<GetSortString> __GetSortString__Delegate;

delegate OnColumnSized(int Column);
// Export UGUIMultiColumnList::execGetListIndex(FFrame&, void* const)
native final function int GetListIndex(int YourArrayIndex);
// Export UGUIMultiColumnList::execChangeSortOrder(FFrame&, void* const)
native final function ChangeSortOrder();
// Export UGUIMultiColumnList::execSortList(FFrame&, void* const)
native final function SortList();
// Export UGUIMultiColumnList::execUpdatedItem(FFrame&, void* const)
native final function UpdatedItem(int YourArrayIndex);
// Export UGUIMultiColumnList::execRemovedItem(FFrame&, void* const)
native final function RemovedItem(int YourArrayIndex);
// Export UGUIMultiColumnList::execAddedItem(FFrame&, void* const)
native final function AddedItem(optional int YourArrayIndex);
delegate string GetSortString(int YourArrayIndex);
function int CurrentListId()
{
    // End:0x11
    if(Index < 0)
    {
        return -1;
    }
    return SortData[Index].SortItem;
}

event OnSortChanged()
{
    // End:0x0e
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
}

function Clear()
{
    SortData.Remove(0, SortData.Length);
    InvSortData.Remove(0, InvSortData.Length);
    super(GUIListBase).Clear();
}

function RemovedCurrent()
{
    // End:0x20
    if(IsValid())
    {
        RemovedItem(CurrentListId());
        SetIndex(Index);
    }
}

function ResolutionChanged(int ResX, int ResY)
{
    // End:0x13
    if(!bInit)
    {
        bInit = true;
    }
    super(GUIComponent).ResolutionChanged(ResX, ResY);
}

event InitializeColumns(Canvas C)
{
    local int i;
    local float AW;

    // End:0x5a
    if(bDebugging)
    {
        Log(string(Name) @ "#### InitializeColumns ActualWidth() = " @ string(ActualWidth()) @ "WinWidth:" $ string(WinWidth));
    }
    AW = ActualWidth();
    i = 0;
    J0x6a:
    // End:0xea [While If]
    if(i < InitColumnPerc.Length)
    {
        // End:0xc2
        if(bDebugging)
        {
            Log(string(Name) @ "#### InitColumnPerc[" $ string(i) $ "]:" $ string(InitColumnPerc[i]));
        }
        ColumnWidths[i] = AW * InitColumnPerc[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6a;
    }
    bInit = false;
}

function bool InternalOnPreDraw(Canvas C)
{
    local float X;
    local int i;

    // End:0x0b
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
        // End:0x73 [While If]
        if(i < ColumnWidths.Length - 1)
        {
            X += ColumnWidths[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x44;
        }
        ColumnWidths[i] = ActualWidth() - X;
    }
    return false;
}

function GetCellLeftWidth(int Column, out float Left, out float width)
{
    local int i;

    Left = ClientBounds[0];
    i = 0;
    J0x14:
    // End:0x51 [While If]
    if(i < Column && i < ColumnWidths.Length)
    {
        Left += ColumnWidths[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    // End:0x75
    if(i < ColumnWidths.Length)
    {
        width = ColumnWidths[i];
    }
    // End:0x80
    else
    {
        width = 0.0;
    }
    Left += CellSpacing;
    width -= float(2) * CellSpacing;
    // End:0xbb
    if(Left >= Bounds[2])
    {
        width = 0.0;
    }
    // End:0xe9
    if(Left + width >= Bounds[2])
    {
        width = Bounds[2] - Left;
    }
    // End:0x101
    if(width < float(0))
    {
        width = 0.0;
    }
}

function Sort()
{
    SortList();
}

function Dump()
{
    local int i;

    Log("Dumping multicolumn list contents  '" $ string(Name) $ "'");
    i = 0;
    J0x3d:
    // End:0x127 [While If]
    if(i < SortData.Length)
    {
        // End:0xc2
        if(i < InvSortData.Length)
        {
            Log(" " $ string(i) $ ")" @ "'" $ SortData[i].SortString $ "'" @ string(SortData[i].SortItem) @ "InvSortData:" $ string(InvSortData[i]));
        }
        // End:0x11d
        else
        {
            Log(" " $ string(i) $ ")" @ "'" $ SortData[i].SortString $ "'" @ string(SortData[i].SortItem) @ "InvSortData: Invalid");
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
}

function SetTopItem(int Item)
{
    Top = Item;
    // End:0x5c
    if(Top + ItemsPerPage >= ItemCount)
    {
        Top = ItemCount - ItemsPerPage;
        // End:0x5c
        if(NoVisibleCols > 1)
        {
            Top = int(float(Top) + float(Top) % float(2));
        }
    }
    // End:0x7b
    if(Top < 0 || ItemsPerPage == 0)
    {
        Top = 0;
    }
    // End:0x8f
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    OnAdjustTop(self);
    // End:0xb8
    if(MyScrollBar != none)
    {
        MyScrollBar.AlignThumb();
    }
}

defaultproperties
{
    CellSpacing=1.0
    OnPreDraw=InternalOnPreDraw
}