class BTFriendLocationList extends GUITabPanel
    editinlinenew
    instanced;

struct FriendItem
{
    var string ServerName;
    var int ServerID;
    var string ChannelName;
    var int ChannelID;
    var string LocationName;
    var string FriendName;
    var int FriendID;
};

var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var array<FriendItem> Friends;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.ColumnHeadings[0] = "Location";
    MultiColumnList.ColumnHeadings[1] = "ID";
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return (34.0000000 / float(768)) * C.ClipY;
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
    DrawStyle.DrawText(Canvas, MultiColumnList.MenuState, X, Y, width0, HT, 0, GetLocationString(Friends[Item]), MultiColumnList.FontScale);
    DrawStyle.DrawText(Canvas, MultiColumnList.MenuState, X + width0, Y, width1, HT, 0, Friends[Item].FriendName, MultiColumnList.FontScale);
    //return;    
}

function string GetLocationString(FriendItem Item)
{
    local string Location;

    Location = ((Item.ServerName $ Item.ChannelName) $ "-") $ Item.LocationName;
    return Location;
    //return;    
}

function Add(string ServerName, int ServerID, string ChannelName, int ChannelID, string LocationName, string FriendName, int FriendID)
{
    local FriendItem Item;

    Item.ServerName = ServerName;
    Item.ServerID = ServerID;
    Item.ChannelName = ChannelName;
    Item.ChannelID = ChannelID;
    Item.LocationName = LocationName;
    Item.FriendName = FriendName;
    Item.FriendID = FriendID;
    Friends[Friends.Length] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function Clear()
{
    Friends.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.BTFriendLocationList.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        bDisplayHeader=false
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
    end object
    MultiColumnBox=mMultiColumnBox
    bBoundToParent=true
    bScaleToParent=true
}