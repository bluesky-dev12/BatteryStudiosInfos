class BTRoomListBox extends GUITabPanel
    editinlinenew
    instanced;

struct RoomItem
{
    var int GameNum;
    var string Title;
    var string Map;
    var string MapFriendlyName;
    var byte UserCount;
    var byte MaxCount;
    var string Mode;
    var byte Status;
    var string RoomOwnerIP;
    var int Ping;
    var int WeaponRestriction;
    var bool HasPassword;
};

var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var localized string ColumnCaptionSP;
var localized string ColumnCaptionNO;
var localized string ColumnCaptionPW;
var localized string ColumnCaptionRoomName;
var localized string ColumnCaptionMap;
var localized string ColumnCaptionMode;
var localized string ColumnCaptionWP;
var localized string ColumnCaptionCapacity;
var localized string ColumnCaptionStatus;
var localized string ColumnCaptionPing;
var array<Material> PingImages;
var float PingImageWidth;
var float PingImageHeight;
var float PingDrawWidth;
var float PingDrawHeight;
var array<RoomItem> Rooms;
var float ItemHeight;
var float HeaderHeight;
var float OffsetBetweenHeaderAndList;
var localized string StatusStringWaiting;
var localized string StatusStringPlaying;
//var delegate<OnTryEnterRoom> __OnTryEnterRoom__Delegate;

delegate OnTryEnterRoom(RoomItem Item)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    Log("[BTRoomListBox::InitComponent]");
    ApplyLocalizedStrings();
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeMultiColumn();
    MultiColumnList.AddedItem();
    //return;    
}

function ApplyLocalizedStrings()
{
    MultiColumnBox.ColumnHeadings[0] = ColumnCaptionSP;
    MultiColumnBox.ColumnHeadings[1] = ColumnCaptionNO;
    MultiColumnBox.ColumnHeadings[2] = ColumnCaptionPW;
    MultiColumnBox.ColumnHeadings[3] = ColumnCaptionRoomName;
    MultiColumnBox.ColumnHeadings[4] = ColumnCaptionMap;
    MultiColumnBox.ColumnHeadings[5] = ColumnCaptionMode;
    MultiColumnBox.ColumnHeadings[6] = ColumnCaptionWP;
    MultiColumnBox.ColumnHeadings[7] = ColumnCaptionCapacity;
    MultiColumnBox.ColumnHeadings[8] = ColumnCaptionStatus;
    MultiColumnBox.ColumnHeadings[9] = ColumnCaptionPing;
    //return;    
}

function InitializeMultiColumn()
{
    MultiColumnList = MultiColumnBox.List;
    MultiColumnBox.SetHeaderStyle(true, "STY2Warfare_ColumnHeader", true, "STY2Warfare_ColumnHeader");
    MultiColumnBox.Header.UseManualHeight = true;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.SortColumn = -1;
    MultiColumnList.bHotTrack = true;
    MultiColumnList.bHotTrackStrictMode = true;
    MultiColumnList.bHotTrackOnInactive = true;
    MultiColumnList.CallDrawItemForPlaceHoldingItems = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function DrawStripes(Canvas C)
{
    local int lp1, X, Y;

    C.Style = 1;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    X = int(MultiColumnList.ActualLeft());
    Y = int(MultiColumnList.ActualTop());
    lp1 = 0;
    J0x5B:

    // End:0xCF [Loop If]
    if(lp1 < MultiColumnBox.List.ItemsPerPage)
    {
        // End:0xAE
        if((float(lp1) % float(2)) == float(0))
        {
            C.SetPos(float(X), float(Y));
        }
        Y += int(MultiColumnList.ItemHeight);
        lp1++;
        // [Loop Continue]
        goto J0x5B;
    }
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    MultiColumnList.WinHeight = MultiColumnBox.WinHeight - HeaderHeight;
    MultiColumnBox.Header.ManualHeight = HeaderHeight * C.ClipY;
    MultiColumnBox.OffsetBetweenHeaderAndList = int(OffsetBetweenHeaderAndList * C.ClipY);
    return false;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return C.ClipY * ItemHeight;
    //return;    
}

function Add(int GameNum, string Title, string Map, byte UserCount, byte MaxCount, string Mode, byte Status, string RoomOwnerIP, bool hasPw, int wpnRestrict, int Ping)
{
    local RoomItem Item;

    Log(((((((((((((("[BTRoomListBox::Add]" $ " gameNum=") $ string(GameNum)) $ " title=") $ Title) $ " map=") $ Map) $ " userCount=") $ string(UserCount)) $ " maxCount=") $ string(MaxCount)) $ " mode=") $ Mode) $ " status=") $ string(Status));
    Item.GameNum = GameNum;
    Item.Title = Title;
    Item.Map = Map;
    Item.MapFriendlyName = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(Map).FriendlyName;
    Item.UserCount = UserCount;
    Item.MaxCount = MaxCount;
    Item.Mode = Mode;
    Item.Status = Status;
    Item.RoomOwnerIP = RoomOwnerIP;
    Item.HasPassword = hasPw;
    Item.WeaponRestriction = wpnRestrict;
    Item.Ping = Ping;
    Rooms[Rooms.Length] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function RemoveByGameNum(int GameNum)
{
    local int lp1;

    Log(("[BTRoomListBox::RemoveByGameNum]" $ " gameNum=") $ string(GameNum));
    lp1 = 0;
    J0x41:

    // End:0x98 [Loop If]
    if(lp1 < Rooms.Length)
    {
        // End:0x8E
        if(Rooms[lp1].GameNum == GameNum)
        {
            Rooms.Remove(lp1, 1);
            MultiColumnList.RemovedItem(lp1);
            // [Explicit Break]
            goto J0x98;
        }
        lp1++;
        // [Loop Continue]
        goto J0x41;
    }
    J0x98:

    //return;    
}

function Clear()
{
    Log("[BTRoomListBox::Clear]");
    Rooms.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

function int GetLength()
{
    return Rooms.Length;
    //return;    
}

function int GetSelectedIndex()
{
    return MultiColumnList.Index;
    //return;    
}

function RoomItem GetRoomByIndex(int Index)
{
    return Rooms[Index];
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float l0, w0, l1, w1, l2, w2,
	    l3, w3, l4, w4, l5,
	    w5, l6, w6, l7, w7,
	    l8, w8, l9, w9;

    local export editinline GUIStyles DrawStyle;
    local Material materialBG;

    // End:0x16
    if(Item == 0)
    {
        DrawStripes(C);
    }
    MultiColumnList.GetCellLeftWidth(0, l0, w0);
    MultiColumnList.GetCellLeftWidth(1, l1, w1);
    MultiColumnList.GetCellLeftWidth(2, l2, w2);
    MultiColumnList.GetCellLeftWidth(3, l3, w3);
    MultiColumnList.GetCellLeftWidth(4, l4, w4);
    MultiColumnList.GetCellLeftWidth(5, l5, w5);
    MultiColumnList.GetCellLeftWidth(6, l6, w6);
    MultiColumnList.GetCellLeftWidth(7, l7, w7);
    MultiColumnList.GetCellLeftWidth(8, l8, w8);
    MultiColumnList.GetCellLeftWidth(9, l9, w9);
    // End:0x142
    if(bSelected)
    {
        DrawStyle = MultiColumnList.SelectedStyle;        
    }
    else
    {
        DrawStyle = MultiColumnList.Style;
    }
    C.Style = 1;
    // End:0x4E2
    if(Item < Rooms.Length)
    {
        // End:0x1D6
        if(bSelected)
        {
            C.SetPos(l0, Y);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTileStretched(materialBG, W, HT);
        }
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l1, Y, w1, HT, 1, "" $ string(Rooms[Item].GameNum), MultiColumnList.FontScale);
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l3, Y, w3, HT, 0, " " $ Rooms[Item].Title, MultiColumnList.FontScale);
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l4, Y, w4, HT, 1, Rooms[Item].MapFriendlyName, MultiColumnList.FontScale);
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l5, Y, w5, HT, 1, Class'Engine.wGameSettings'.static.GetGameModeByClass(Rooms[Item].Mode).UserFriendlyName, MultiColumnList.FontScale);
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l7, Y, w7, HT, 1, (("" $ string(Rooms[Item].UserCount)) $ "/") $ string(Rooms[Item].MaxCount), MultiColumnList.FontScale);
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l8, Y, w8, HT, 1, GetStatusString(Rooms[Item].Status), MultiColumnList.FontScale);
        C.SetPos(l9 + ((w9 - (PingDrawWidth * C.ClipY)) / float(2)), Y + ((HT - (PingDrawHeight * C.ClipY)) / float(2)));
        C.DrawTile(PingImages[Rooms[Item].Ping], PingDrawWidth * C.ClipX, PingDrawHeight * C.ClipY, 0.0000000, 0.0000000, PingImageWidth, PingImageHeight);
    }
    //return;    
}

function string TrimMapString(string Map)
{
    // End:0x2D
    if(Caps(Left(Map, 3)) == "DM-")
    {
        Map = Right(Map, Len(Map) - 3);
    }
    return Map;
    //return;    
}

function bool MultiColumnList_OnDblClick(GUIComponent Sender)
{
    // End:0x26
    if((GetSelectedIndex()) != -1)
    {
        OnTryEnterRoom(GetRoomByIndex(GetSelectedIndex()));
    }
    return true;
    //return;    
}

function string GetGameModeString(byte Mode)
{
    return "" $ string(Mode);
    //return;    
}

function string GetStatusString(byte Status)
{
    switch(Status)
    {
        // End:0x12
        case 0:
            return StatusStringWaiting;
        // End:0x1D
        case 1:
            return StatusStringPlaying;
        // End:0xFFFF
        default:
            return "?";
            break;
    }
    //return;    
}

defaultproperties
{
    ColumnCaptionSP="SP"
    ColumnCaptionNO="NO"
    ColumnCaptionPW="??"
    ColumnCaptionRoomName="???"
    ColumnCaptionMap="?"
    ColumnCaptionMode="????"
    ColumnCaptionWP="??"
    ColumnCaptionCapacity="??"
    ColumnCaptionStatus="??"
    ColumnCaptionPing="?"
    ItemHeight=0.0442708
    HeaderHeight=0.0260417
    OffsetBetweenHeaderAndList=0.0052083
    StatusStringWaiting="??"
    StatusStringPlaying="??"
    bBoundToParent=true
    bScaleToParent=true
}