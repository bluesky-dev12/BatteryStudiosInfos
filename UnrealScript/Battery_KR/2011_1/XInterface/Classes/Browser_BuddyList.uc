class Browser_BuddyList extends GUIMultiColumnList
    editinlinenew
    instanced;

var export editinline Browser_ServerListPageBuddy MyBuddyPage;
var export editinline GUIStyles SelStyle;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIListBase).InitComponent(MyController, myOwner);
    __OnDrawItem__Delegate = MyOnDrawItem;
    SelStyle = Controller.GetStyle("SquareButton", FontScale);
    //return;    
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth;

    // End:0x3F
    if(bSelected)
    {
        SelStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
    }
    GetCellLeftWidth(0, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, MyBuddyPage.Buddies[i], FontScale);
    //return;    
}

defaultproperties
{
    ColumnHeadings[0]="?? ??"
    InitColumnPerc[0]=1.0000000
    ExpandLastColumn=true
}