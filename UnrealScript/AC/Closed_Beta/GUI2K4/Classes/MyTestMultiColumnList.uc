class MyTestMultiColumnList extends GUIMultiColumnList
    editinlinenew
    instanced;

struct MyTestItem
{
    var string Caption;
    var int Value;
    var string key;
};

var() array<MyTestItem> MyData;
var export editinline GUIStyles SelStyle;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i, j, C;

    C = Rand(50) + 50;
    i = 0;
    J0x15:

    // End:0xA7 [Loop If]
    if(i < C)
    {
        j = MyData.Length;
        MyData.Length = j + 1;
        MyData[j].Caption = "This is a test";
        MyData[j].Value = Rand(2000);
        MyData[j].key = "KEY" @ string(i);
        AddedItem();
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    __OnDrawItem__Delegate = MyOnDrawItem;
    super(GUIListBase).InitComponent(MyController, myOwner);
    SelStyle = Controller.GetStyle("SquareButton", FontScale);
    //return;    
}

function Clear()
{
    MyData.Remove(0, MyData.Length);
    ItemCount = 0;
    super.Clear();
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
    Style.DrawText(Canvas, MenuState, X + CellLeft, Y, CellWidth, H, 0, MyData[SortData[i].SortItem].Caption, FontScale);
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, X + CellLeft, Y, CellWidth, H, 0, "" $ string(MyData[SortData[i].SortItem].Value), FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, X + CellLeft, Y, CellWidth, H, 0, MyData[SortData[i].SortItem].key, FontScale);
    //return;    
}

function string GetSortString(int i)
{
    return MyData[i].Caption;
    //return;    
}

defaultproperties
{
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
}