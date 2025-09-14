/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\AdminPlayerList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class AdminPlayerList extends GUIMultiColumnList
    editinlinenew
    instanced;

struct PlayerInfo
{
    var string PlayerName;
    var string PlayerID;
    var string PlayerIP;
};

var array<PlayerInfo> MyPlayers;
var export editinline GUIStyles SelStyle;

function Clear()
{
    MyPlayers.Remove(0, MyPlayers.Length);
    super.Clear();
}

function Add(string PlayerInfo)
{
    local string S;
    local int i, idx;

    idx = MyPlayers.Length;
    MyPlayers.Length = MyPlayers.Length + 1;
    i = InStr(PlayerInfo, Chr(27));
    S = Left(PlayerInfo, i);
    MyPlayers[idx].PlayerName = S;
    PlayerInfo = Right(PlayerInfo, Len(PlayerInfo) - i - 1);
    i = InStr(PlayerInfo, Chr(27));
    S = Left(PlayerInfo, i);
    MyPlayers[idx].PlayerID = S;
    PlayerInfo = Right(PlayerInfo, Len(PlayerInfo) - i - 1);
    MyPlayers[idx].PlayerIP = PlayerInfo;
    ++ ItemCount;
    AddedItem();
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    __OnDrawItem__Delegate = MyOnDrawItem;
    __OnKeyEvent__Delegate = InternalOnKeyEvent;
    super(GUIListBase).InitComponent(MyController, myOwner);
    SelStyle = Controller.GetStyle("SquareButton", FontScale);
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    // End:0xa3
    if(bSelected)
    {
        Canvas.SetDrawColor(128, 8, 8, byte(255));
        Canvas.SetPos(X, Y - float(2));
        Canvas.DrawTile(Controller.DefaultPens[0], W, H + float(2), 0.0, 0.0, 1.0, 1.0);
        Canvas.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, X + CellLeft, Y, CellWidth, H, 0, MyPlayers[i].PlayerName, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, X + CellLeft, Y, CellWidth, H, 0, MyPlayers[i].PlayerID, FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, X + CellLeft, Y, CellWidth, H, 0, MyPlayers[i].PlayerIP, FontScale);
}

defaultproperties
{
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    SortColumn=-1
}