class BTNetMainMenu_GameRoom_TeamList extends GUIMultiColumnList
    editinlinenew
    instanced;

struct GTeamInfo
{
    var string nUID;
    var string Clan;
    var string Grade;
    var string NickName;
    var string Status;
    var string Conn;
};

var array<GTeamInfo> TeamList;

function Clear()
{
    TeamList.Remove(0, TeamList.Length);
    ItemCount = 0;
    super.Clear();
    //return;    
}

function Add(string nUID, string Clan, string Grade, string Nick, string Status, string Conn)
{
    local int idx;

    idx = TeamList.Length;
    TeamList.Length = idx + 1;
    TeamList[idx].nUID = nUID;
    TeamList[idx].Clan = Clan;
    TeamList[idx].Grade = Grade;
    TeamList[idx].NickName = Nick;
    TeamList[idx].Status = Status;
    TeamList[idx].Conn = Conn;
    AddedItem();
    //return;    
}

function bool Remove(string nUID)
{
    local int idx;
    local bool bDeleted;

    bDeleted = false;
    idx = 0;
    J0x0F:

    // End:0x5A [Loop If]
    if(idx < TeamList.Length)
    {
        // End:0x50
        if(TeamList[idx].nUID == nUID)
        {
            TeamList.Remove(idx, 1);
            bDeleted = true;
            // [Explicit Break]
            goto J0x5A;
        }
        idx++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x5A:

    return bDeleted;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    __OnDrawItem__Delegate = MyOnDrawItem;
    __OnKeyEvent__Delegate = InternalOnKeyEvent;
    super(GUIListBase).InitComponent(MyController, myOwner);
    //return;    
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    GetCellLeftWidth(0, CellLeft, CellWidth);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, TeamList[i].NickName, FontScale);
    GetCellLeftWidth(3, CellLeft, CellWidth);
    GetCellLeftWidth(4, CellLeft, CellWidth);
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    ColumnWidths=/* Array type was not detected. */
    SortColumn=-1
    ItemHeight=0.0195312
}