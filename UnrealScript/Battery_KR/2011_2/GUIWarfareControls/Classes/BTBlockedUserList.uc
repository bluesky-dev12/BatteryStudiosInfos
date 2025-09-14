class BTBlockedUserList extends GUITabPanel
    editinlinenew
    instanced;

struct BlockedUserItem
{
    var string UserName;
    var int UserID;
};

var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var array<BlockedUserItem> Users;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    return false;
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas Canvas, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float left0, width0, left1, width1;
    local export editinline GUIStyles DrawStyle;

    MultiColumnList.GetCellLeftWidth(0, left0, width0);
    MultiColumnList.GetCellLeftWidth(1, left1, width1);
    // End:0x54
    if(bSelected)
    {
        DrawStyle = MultiColumnList.SelectedStyle;        
    }
    else
    {
        DrawStyle = MultiColumnList.Style;
    }
    Canvas.Style = 1;
    DrawStyle.DrawText(Canvas, MultiColumnList.MenuState, left1, Y, width1, HT, 0, Users[Item].UserName, MultiColumnList.FontScale);
    //return;    
}

function Add(string UserName, int UserID)
{
    local BlockedUserItem Item;

    Item.UserName = UserName;
    Item.UserID = UserID;
    Users[Users.Length] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function Clear()
{
    Users.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.BTBlockedUserList.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        bDisplayHeader=false
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
    end object
    MultiColumnBox=mMultiColumnBox
    bBoundToParent=true
    bScaleToParent=true
}