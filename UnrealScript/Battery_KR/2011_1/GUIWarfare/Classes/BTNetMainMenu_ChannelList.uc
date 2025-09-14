class BTNetMainMenu_ChannelList extends GUIMultiColumnList
    editinlinenew
    instanced;

struct ChannelInfo
{
    var string ChannelID;
    var string ChannelName;
    var string usercnt;
};

var int idxSelected;
var array<ChannelInfo> BTChannelList;

function Clear()
{
    BTChannelList.Remove(0, BTChannelList.Length);
    ItemCount = 0;
    super.Clear();
    //return;    
}

function Add(string ChannelID, string ChannelName, string usercnt)
{
    local int idx;

    idx = BTChannelList.Length;
    BTChannelList.Length = idx + 1;
    BTChannelList[idx].ChannelID = ChannelID;
    BTChannelList[idx].ChannelName = ChannelName;
    BTChannelList[idx].usercnt = usercnt;
    AddedItem();
    //return;    
}

function Remove(int idx)
{
    BTChannelList.Remove(idx, 1);
    //return;    
}

function int GetSelected()
{
    return idxSelected;
    //return;    
}

function int GetSelectedChannelID()
{
    return int(BTChannelList[GetSelected()].ChannelID);
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
    Style.DrawText(Canvas, MenuState, X, Y, W, H, 0, BTChannelList[i].ChannelName, FontScale);
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, X + CellWidth, Y, CellWidth, H, 0, BTChannelList[i].usercnt, FontScale);
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