class BTNetMainMenu_Channel_GameRoomList extends GUIMultiColumnList
    editinlinenew
    instanced;

struct GameRoomInfo
{
    var string Num;
    var string GameRoomName;
    var string usercnt;
};

var int idxSelected;
var array<GameRoomInfo> BTGameRoomList;

function Clear()
{
    BTGameRoomList.Remove(0, BTGameRoomList.Length);
    ItemCount = 0;
    super.Clear();
    //return;    
}

function Add(string Num, string GameRoomName, string usercnt)
{
    local int idx;

    idx = BTGameRoomList.Length;
    BTGameRoomList.Length = idx + 1;
    BTGameRoomList[idx].Num = Num;
    BTGameRoomList[idx].GameRoomName = GameRoomName;
    BTGameRoomList[idx].usercnt = usercnt;
    AddedItem();
    //return;    
}

function bool Remove(int Num)
{
    local int idx;
    local bool bDeleted;

    bDeleted = false;
    idx = 0;
    J0x0F:

    // End:0x5C [Loop If]
    if(idx < BTGameRoomList.Length)
    {
        // End:0x52
        if(int(BTGameRoomList[idx].Num) == Num)
        {
            BTGameRoomList.Remove(idx, 1);
            bDeleted = true;
            // [Explicit Break]
            goto J0x5C;
        }
        idx++;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x5C:

    return bDeleted;
    //return;    
}

function bool GetSelectedGameRoom(out int GameRoomNum)
{
    // End:0x11
    if(idxSelected == -1)
    {
        return false;
    }
    GameRoomNum = int(BTGameRoomList[idxSelected].Num);
    return true;
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

    // End:0xAE
    if(bSelected)
    {
        Canvas.SetDrawColor(237, 168, 60, byte(255));
        Canvas.SetPos(X, Y - float(2));
        Canvas.DrawTile(Controller.DefaultPens[0], W, H + float(2), 0.0000000, 0.0000000, 1.0000000, 1.0000000);
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        idxSelected = i;
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 1, BTGameRoomList[i].Num, FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft + float(5), Y, CellWidth, H, 0, BTGameRoomList[i].GameRoomName, FontScale);
    GetCellLeftWidth(5, CellLeft, CellWidth);
    //return;    
}

defaultproperties
{
    idxSelected=-1
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    ColumnWidths=/* Array type was not detected. */
    SortColumn=-1
    ItemHeight=0.0195312
}