class Browser_PlayersList extends GUIMultiColumnList
    editinlinenew
    instanced;

var export editinline Browser_ServerListPageBase MyPage;
var export editinline Browser_ServersList MyServersList;
var int listitem;

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
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, MyServersList.Servers[listitem].PlayerInfo[i].PlayerName, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(MyServersList.Servers[listitem].PlayerInfo[i].Score), FontScale);
    // End:0x16A
    if(MyServersList.Servers[listitem].PlayerInfo[i].StatsID != 0)
    {
        GetCellLeftWidth(2, CellLeft, CellWidth);
        Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(MyServersList.Servers[listitem].PlayerInfo[i].StatsID), FontScale);
    }
    GetCellLeftWidth(3, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(MyServersList.Servers[listitem].PlayerInfo[i].Ping), FontScale);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1A
    if(super(GUIListBase).InternalOnKeyEvent(key, State, Delta))
    {
        return true;
    }
    // End:0x64
    if(int(State) == 1)
    {
        switch(key)
        {
            // End:0x48
            case 13:
                MyServersList.Connect(false);
                return true;
                // End:0x64
                break;
            // End:0x61
            case 116:
                MyPage.RefreshList();
                return true;
                // End:0x64
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        return false;
        //return;        
    }
}

defaultproperties
{
    ColumnHeadings[0]="???? ??"
    ColumnHeadings[1]="??"
    ColumnHeadings[2]="?? ID"
    ColumnHeadings[3]="?"
    InitColumnPerc[0]=0.1700000
    InitColumnPerc[1]=0.1100000
    InitColumnPerc[2]=0.1100000
    InitColumnPerc[3]=0.1100000
}