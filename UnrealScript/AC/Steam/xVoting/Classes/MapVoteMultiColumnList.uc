/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteMultiColumnList.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:10
 *
 *******************************************************************************/
class MapVoteMultiColumnList extends GUIMultiColumnList
    editinlinenew
    instanced;

var VotingReplicationInfo VRI;
var array<int> MapVoteData;
var int PrevSortColumn;
var export editinline GUIStyles SelStyle;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIListBase).InitComponent(MyController, myOwner);
    SelStyle = Controller.GetStyle("SquareButton", FontScale);
}

function LoadList(VotingReplicationInfo LoadVRI, int GameTypeIndex)
{
    local int M, P, L;
    local array<string> PrefixList;

    VRI = LoadVRI;
    Split(VRI.GameConfig[GameTypeIndex].Prefix, ",", PrefixList);
    M = 0;
    J0x35:
    // End:0xe3 [While If]
    if(M < VRI.MapList.Length)
    {
        P = 0;
        J0x55:
        // End:0xd9 [While If]
        if(P < PrefixList.Length)
        {
            // End:0xcf
            if(Left(VRI.MapList[M].MapName, Len(PrefixList[P])) ~= PrefixList[P])
            {
                L = MapVoteData.Length;
                MapVoteData.Insert(L, 1);
                MapVoteData[L] = M;
                AddedItem();
            }
            // End:0xd9
            else
            {
                ++ P;
                // This is an implied JumpToken; Continue!
                goto J0x55;
            }
        }
        ++ M;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    __OnDrawItem__Delegate = DrawItem;
}

function Clear()
{
    MapVoteData.Remove(0, MapVoteData.Length);
    ItemCount = 0;
    super.Clear();
}

function int GetSelectedMapIndex()
{
    return MapVoteData[SortData[Index].SortItem];
}

function string GetSelectedMapName()
{
    // End:0x3d
    if(Index > -1)
    {
        return VRI.MapList[MapVoteData[SortData[Index].SortItem]].MapName;
    }
    // End:0x40
    else
    {
        return "";
    }
}

function DrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local XInterface.GUI.eMenuState MState;
    local export editinline GUIStyles DrawStyle;

    // End:0x0d
    if(VRI == none)
    {
        return;
    }
    // End:0x11e
    if(bPending && OutlineStyle != none && bDropSource || bDropTarget)
    {
        // End:0x11e
        if(OutlineStyle.Images[MenuState] != none)
        {
            OutlineStyle.Draw(Canvas, MenuState, ClientBounds[0], Y, ClientBounds[2] - ClientBounds[0], ItemHeight);
            // End:0x11e
            if(DropState == 1 && i != DropIndex)
            {
                OutlineStyle.Draw(Canvas, MenuState, Controller.MouseX - MouseOffset[0], Controller.MouseY - MouseOffset[1] + Y - ClientBounds[1], MouseOffset[2] + MouseOffset[0], ItemHeight);
            }
        }
    }
    // End:0x16e
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, MenuState, X, Y - float(2), W, H + float(2));
        DrawStyle = SelectedStyle;
    }
    // End:0x179
    else
    {
        DrawStyle = Style;
    }
    // End:0x1b4
    if(!VRI.MapList[MapVoteData[SortData[i].SortItem]].bEnabled)
    {
        MState = 4;
    }
    // End:0x1bf
    else
    {
        MState = MenuState;
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MState, CellLeft, Y, CellWidth, H, 0, VRI.MapList[MapVoteData[SortData[i].SortItem]].MapName, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MState, CellLeft, Y, CellWidth, H, 0, string(VRI.MapList[MapVoteData[SortData[i].SortItem]].PlayCount), FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    DrawStyle.DrawText(Canvas, MState, CellLeft, Y, CellWidth, H, 0, string(VRI.MapList[MapVoteData[SortData[i].SortItem]].Sequence), FontScale);
}

function string GetSortString(int i)
{
    local string ColumnData[5];

    ColumnData[0] = Left(Caps(VRI.MapList[MapVoteData[i]].MapName), 20);
    ColumnData[1] = Right("000000" $ string(VRI.MapList[MapVoteData[i]].PlayCount), 6);
    ColumnData[2] = Right("000000" $ string(VRI.MapList[MapVoteData[i]].Sequence), 6);
    return ColumnData[SortColumn] $ ColumnData[PrevSortColumn];
}

event OnSortChanged()
{
    super.OnSortChanged();
    PrevSortColumn = SortColumn;
}

function free()
{
    VRI = none;
    super(GUIComponent).free();
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    // End:0x21
    if(bAccepted && Accepting != none)
    {
        OnDblClick(self);
    }
    SetOutlineAlpha(255);
    // End:0x3d
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    ColumnHeadingHints=// Object reference not set to an instance of an object.
    
    SelectedStyleName="BrowserListSelection"
    StyleName="ServerBrowserGrid"
}