class BTChannelList extends GUITabPanel
    editinlinenew
    instanced;

struct ChannelItem
{
    var bool IsHeader;
    var int id;
    var string ChannelName;
    var int CurUser;
    var int MaxUser;
    var string serverIP;
    var int serverPort;
};

var() automated BTBoxImage SectionBackground;
var() automated GUIImage SectionBackground2;
var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var array<ChannelItem> Channels;
var Material GaugeFilled;
var Material GaugeEmpty;
var float HeaderFontSize;
var float FontSize;
var float HeaderOffsetY;
var array<Material> PingImages;
var float PingImageWidth;
var float PingImageHeight;
var float PingDrawWidth;
var float PingDrawHeight;
//var delegate<OnEnterChannel> __OnEnterChannel__Delegate;

delegate OnEnterChannel(ChannelItem Channel)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.CellSpacing = -5.0000000;
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    MultiColumnList.ColumnHeadings[0] = "Channel Name";
    MultiColumnList.ColumnHeadings[1] = "Channel Load";
    MultiColumnList.bHotTrack = true;
    MultiColumnList.bHotTrackStrictMode = true;
    MultiColumnList.bHotTrackOnInactive = true;
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bForceScrollBarPosition = true;
    MultiColumnList.ForcedScrollbarWinLeft = 0.7275391;
    MultiColumnList.ForcedScrollbarWinTop = 0.1445312;
    MultiColumnList.ForcedScrollbarWinWidth = 0.0146484;
    MultiColumnList.ForcedScrollbarWinHeight = 0.8111979;
    MultiColumnList.CallDrawItemForPlaceHoldingItems = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function AddHeader(string Title)
{
    local ChannelItem Item;

    Item.IsHeader = true;
    Item.ChannelName = Title;
    Channels[Channels.Length] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function AddChannel(int id, string serverIP, int serverPort, string ChannelName, int CurUser, int MaxUser)
{
    local ChannelItem Item;

    Item.IsHeader = false;
    Item.id = id;
    Item.ChannelName = ChannelName;
    Item.CurUser = CurUser;
    Item.MaxUser = MaxUser;
    Item.serverIP = serverIP;
    Item.serverPort = serverPort;
    Item.CurUser = Rand(MaxUser);
    Channels[Channels.Length] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function ClearAllChannels()
{
    Channels.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

function int GetSelectedIndex()
{
    return MultiColumnList.Index;
    //return;    
}

function ChannelItem GetSelectedChannel()
{
    return GetChannelByIndex(GetSelectedIndex());
    //return;    
}

function ChannelItem GetChannelByIndex(int Index)
{
    return Channels[Index];
    //return;    
}

function bool MultiColumnList_OnDblClick(GUIComponent Sender)
{
    // End:0x21
    if(!GetSelectedChannel().IsHeader)
    {
        OnEnterChannel(GetSelectedChannel());
    }
    return true;
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    return false;
    //return;    
}

function DrawStripes(Canvas C)
{
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float left0, width0, left1, width1;
    local export editinline GUIStyles DrawStyle;
    local Material materialBG;
    local int maxBarCount, barCount, fSize, hOffsetY;
    local ChannelItem Channel;

    // End:0x16
    if(Item == 0)
    {
        DrawStripes(C);
    }
    // End:0x33A
    if(Item < Channels.Length)
    {
        Channel = Channels[Item];
        MultiColumnList.GetCellLeftWidth(0, left0, width0);
        MultiColumnList.GetCellLeftWidth(1, left1, width1);
        // End:0x8B
        if(bSelected)
        {
            DrawStyle = MultiColumnList.SelectedStyle;            
        }
        else
        {
            DrawStyle = MultiColumnList.Style;
        }
        C.Style = 1;
        C.SetPos(left0, Y);
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        // End:0xF9
        if(Channel.IsHeader)
        {            
        }
        // End:0x122
        if(materialBG != none)
        {
            C.DrawTileStretched(materialBG, W, HT);
        }
        // End:0x1BF
        if(Channel.IsHeader)
        {
            hOffsetY = int(HeaderOffsetY * C.ClipY);
            fSize = int(HeaderFontSize * C.ClipY);
            C.BtrDrawTextJustified("   " $ Channel.ChannelName, 0, X, Y + float(hOffsetY), X + width0, Y + HT, fSize);            
        }
        else
        {
            fSize = int(FontSize * C.ClipY);
            C.BtrDrawTextJustified("   " $ Channel.ChannelName, 0, X, Y, X + width0, Y + HT, fSize);
        }
        // End:0x259
        if(bSelected && !Channel.IsHeader)
        {
            C.SetPos(X, Y);
        }
        maxBarCount = 4;
        barCount = int(((float(Channel.CurUser) / float(Channel.MaxUser)) + ((1.0000000 / float(maxBarCount + 1)) / float(2))) * float(maxBarCount));
        C.SetPos(left1, Y + ((HT - (PingDrawHeight * C.ClipY)) / float(2)));
        C.DrawTile(PingImages[barCount], PingDrawWidth * C.ClipX, PingDrawHeight * C.ClipY, 0.0000000, 0.0000000, PingImageWidth, PingImageHeight);
    }
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return (34.0000000 / float(768)) * C.ClipY;
    //return;    
}
