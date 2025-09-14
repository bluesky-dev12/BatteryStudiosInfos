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
    //return;    
}

function LoadList(VotingReplicationInfo LoadVRI, int GameTypeIndex)
{
    local int M, P, L;
    local array<string> PrefixList;

    VRI = LoadVRI;
    Split(VRI.GameConfig[GameTypeIndex].Prefix, ",", PrefixList);
    M = 0;
    J0x35:

    // End:0xE3 [Loop If]
    if(M < VRI.MapList.Length)
    {
        P = 0;
        J0x55:

        // End:0xD9 [Loop If]
        if(P < PrefixList.Length)
        {
            // End:0xCF
            if(Left(VRI.MapList[M].MapName, Len(PrefixList[P])) ~= PrefixList[P])
            {
                L = MapVoteData.Length;
                MapVoteData.Insert(L, 1);
                MapVoteData[L] = M;
                AddedItem();
                // [Explicit Break]
                goto J0xD9;
            }
            P++;
            // [Loop Continue]
            goto J0x55;
        }
        J0xD9:

        M++;
        // [Loop Continue]
        goto J0x35;
    }
    __OnDrawItem__Delegate = DrawItem;
    //return;    
}

function Clear()
{
    MapVoteData.Remove(0, MapVoteData.Length);
    ItemCount = 0;
    super.Clear();
    //return;    
}

function int GetSelectedMapIndex()
{
    return MapVoteData[SortData[Index].SortItem];
    //return;    
}

function string GetSelectedMapName()
{
    // End:0x3D
    if(Index > -1)
    {
        return VRI.MapList[MapVoteData[SortData[Index].SortItem]].MapName;        
    }
    else
    {
        return "";
    }
    //return;    
}

function DrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;
    local GUI.eMenuState MState;
    local export editinline GUIStyles DrawStyle;

    // End:0x0D
    if(VRI == none)
    {
        return;
    }
    // End:0x11E
    if((bPending && OutlineStyle != none) && bDropSource || bDropTarget)
    {
        // End:0x11E
        if(OutlineStyle.Images[int(MenuState)] != none)
        {
            OutlineStyle.Draw(Canvas, MenuState, ClientBounds[0], Y, ClientBounds[2] - ClientBounds[0], ItemHeight);
            // End:0x11E
            if((int(DropState) == int(1)) && i != DropIndex)
            {
                OutlineStyle.Draw(Canvas, MenuState, Controller.MouseX - MouseOffset[0], ((Controller.MouseY - MouseOffset[1]) + Y) - ClientBounds[1], MouseOffset[2] + MouseOffset[0], ItemHeight);
            }
        }
    }
    // End:0x16E
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, MenuState, X, Y - float(2), W, H + float(2));
        DrawStyle = SelectedStyle;        
    }
    else
    {
        DrawStyle = Style;
    }
    // End:0x1B4
    if(!VRI.MapList[MapVoteData[SortData[i].SortItem]].bEnabled)
    {
        MState = 4;        
    }
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
    //return;    
}

function string GetSortString(int i)
{
    local string ColumnData[5];

    ColumnData[0] = Left(Caps(VRI.MapList[MapVoteData[i]].MapName), 20);
    ColumnData[1] = Right("000000" $ string(VRI.MapList[MapVoteData[i]].PlayCount), 6);
    ColumnData[2] = Right("000000" $ string(VRI.MapList[MapVoteData[i]].Sequence), 6);
    return ColumnData[SortColumn] $ ColumnData[PrevSortColumn];
    //return;    
}

event OnSortChanged()
{
    super.OnSortChanged();
    PrevSortColumn = SortColumn;
    //return;    
}

function free()
{
    VRI = none;
    super(GUIComponent).free();
    //return;    
}

function InternalOnEndDrag(GUIComponent Accepting, bool bAccepted)
{
    // End:0x21
    if(bAccepted && Accepting != none)
    {
        OnDblClick(self);
    }
    SetOutlineAlpha(255);
    // End:0x3D
    if(bNotify)
    {
        CheckLinkedObjects(self);
    }
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    ColumnHeadingHints=/* Array type was not detected. */
    SelectedStyleName="BrowserListSelection"
    StyleName="ServerBrowserGrid"
}