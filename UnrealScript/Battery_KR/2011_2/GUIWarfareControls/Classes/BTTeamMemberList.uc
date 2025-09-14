class BTTeamMemberList extends GUITabPanel
    editinlinenew
    instanced;

struct TeamMemberItem
{
    var int ClanID;
    var Material ClanImage;
    var int ClassIndex;
    var Material ClassImage;
    var FloatBox ClassImageCoordi;
    var string UserName;
    var int UserID;
    var int Status;
    var int Level;
    var bool IsHost;
    var bool IsMySelf;
};

var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var Material BoxMat;
var array<TeamMemberItem> Members;
var int LineCount;
var float MarkSizeRatio;
var float HeaderHeight;
var float OffsetBetweenHeaderAndList;
var float ItemHeight;
var localized string ColumnCaptionClan;
var localized string ColumnCaptionLevel;
var localized string ColumnCaptionNick;
var localized string ColumnCaptionClanName;
var localized string ColumnCaptionStatus;
var localized string ColumnCaptionPing;
var localized string StatusStringHost;
var localized string StatusStringWaiting;
var localized string StatusStringReady;
var localized string StatusStringPlaying;
var localized string StatusStringShop;
var localized string StatusStringAuction;
//var delegate<OnListChange> __OnListChange__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MultiColumnBox.SetHeaderStyle(true, "STY2Warfare_ColumnHeader", true, "STY2Warfare_ColumnHeader");
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.SortColumn = -1;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.ColumnHeadings[0] = ColumnCaptionClan;
    MultiColumnList.ColumnHeadings[1] = ColumnCaptionLevel;
    MultiColumnList.ColumnHeadings[2] = ColumnCaptionNick;
    MultiColumnList.ColumnHeadings[3] = ColumnCaptionClanName;
    MultiColumnList.ColumnHeadings[4] = ColumnCaptionStatus;
    MultiColumnList.ColumnHeadings[5] = ColumnCaptionPing;
    MultiColumnBox.Header.UseManualHeight = true;
    MultiColumnList.bHotTrack = true;
    MultiColumnList.bHotTrackStrictMode = true;
    MultiColumnList.bHotTrackOnInactive = true;
    MultiColumnList.__OnChange__Delegate = MultiColumnlist_OnChange;
    MultiColumnList.CallDrawItemForPlaceHoldingItems = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.ContextMenu.__OnOpen__Delegate = ContextMenu_OnOpen;
    MultiColumnBox.ContextMenu.__OnClose__Delegate = ContextMenu_OnClose;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return ItemHeight * C.ClipY;
    //return;    
}

delegate OnListChange(GUIComponent Sender)
{
    //return;    
}

function MultiColumnlist_OnChange(GUIComponent Sender)
{
    OnListChange(self);
    //return;    
}

function DrawStripes(Canvas C)
{
    local int lp1, X, Y;

    C.Style = 1;
    X = int(MultiColumnList.ActualLeft() + float(1));
    Y = int(MultiColumnList.ActualTop());
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    lp1 = 0;
    J0x64:

    // End:0xD8 [Loop If]
    if(lp1 < MultiColumnBox.List.ItemsPerPage)
    {
        // End:0xB7
        if((float(lp1) % float(2)) == float(0))
        {
            C.SetPos(float(X), float(Y));
        }
        Y += int(MultiColumnList.ItemHeight);
        lp1++;
        // [Loop Continue]
        goto J0x64;
    }
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    MultiColumnBox.Header.ManualHeight = HeaderHeight * C.ClipY;
    MultiColumnBox.OffsetBetweenHeaderAndList = int(OffsetBetweenHeaderAndList * C.ClipY);
    return false;
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float l0, w0, l1, w1, l2, w2,
	    l3, w3, l4, w4, l5,
	    w5;

    local export editinline GUIStyles DrawStyle;
    local Material materialBG;
    local float OffsetX, OffsetY, markSize;
    local TeamMemberItem curMember;

    // End:0x16
    if(Item == 0)
    {
        DrawStripes(C);
    }
    // End:0x47B
    if(Item < Members.Length)
    {
        curMember = Members[Item];
        MultiColumnList.GetCellLeftWidth(0, l0, w0);
        MultiColumnList.GetCellLeftWidth(1, l1, w1);
        MultiColumnList.GetCellLeftWidth(2, l2, w2);
        MultiColumnList.GetCellLeftWidth(3, l3, w3);
        MultiColumnList.GetCellLeftWidth(4, l4, w4);
        MultiColumnList.GetCellLeftWidth(5, l5, w5);
        // End:0xF7
        if(bSelected)
        {
            DrawStyle = MultiColumnList.SelectedStyle;            
        }
        else
        {
            DrawStyle = MultiColumnList.Style;
        }
        C.Style = 1;
        // End:0x17B
        if(bSelected)
        {
            C.SetPos(l0, Y);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTileStretched(materialBG, W, HT);
        }
        markSize = MarkSizeRatio * C.ClipY;
        OffsetY = (HT - markSize) / float(2);
        OffsetX = (w1 - markSize) / float(2);
        // End:0x2A7
        if(Members[Item].ClanImage != none)
        {
            C.SetPos(l0 + OffsetX, Y + OffsetY);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(Members[Item].ClanImage, w1 - (OffsetX * float(2)), HT - (OffsetY * float(2)), 0.0000000, 0.0000000, float(Members[Item].ClanImage.MaterialUSize()), float(Members[Item].ClanImage.MaterialVSize()));
        }
        C.SetPos(l1 + OffsetX, Y + OffsetY);
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.DrawTile(Members[Item].ClassImage, w1 - (OffsetX * float(2)), HT - (OffsetY * float(2)), Members[Item].ClassImageCoordi.X1, Members[Item].ClassImageCoordi.Y1, Members[Item].ClassImageCoordi.X2, Members[Item].ClassImageCoordi.Y2);
        // End:0x3AB
        if(curMember.IsHost)
        {
            C.SetPos(l0, Y);
        }
        // End:0x3C8
        if(false)
        {
            C.SetPos(l1, Y);
        }
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l2, Y, w2, HT, 0, "  " $ Members[Item].UserName, MultiColumnList.FontScale);
        DrawStyle.DrawText(C, MultiColumnList.MenuState, l4, Y, w4, HT, 1, GetStatusString(Members[Item]), MultiColumnList.FontScale);
    }
    //return;    
}

function Material GetClanImage(TeamMemberItem Item)
{
    return none;
    //return;    
}

function Material GetClassImage(TeamMemberItem Item)
{
    return none;
    //return;    
}

function string GetStatusString(TeamMemberItem Item)
{
    // End:0x38
    if(Item.IsHost && (Item.Status == 0) || Item.Status == 1)
    {
        return StatusStringHost;
    }
    switch(Item.Status)
    {
        // End:0x4E
        case 0:
            return StatusStringWaiting;
        // End:0x58
        case 1:
            return StatusStringReady;
        // End:0x63
        case 2:
            return StatusStringPlaying;
        // End:0x6E
        case 3:
            return StatusStringShop;
        // End:0x79
        case 4:
            return StatusStringAuction;
        // End:0xFFFF
        default:
            return "?";
            break;
    }
    //return;    
}

function UpdateHost(int UserID, bool IsHost)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x56 [Loop If]
    if(lp1 < Members.Length)
    {
        // End:0x4C
        if(Members[lp1].UserID == UserID)
        {
            Members[lp1].IsHost = IsHost;
            // [Explicit Break]
            goto J0x56;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x56:

    //return;    
}

function UpdateStatus(int UserID, int Status)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(lp1 < Members.Length)
    {
        // End:0x4A
        if(Members[lp1].UserID == UserID)
        {
            Members[lp1].Status = Status;
            // [Explicit Break]
            goto J0x54;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x54:

    //return;    
}

function Add(int ClanID, int ClassIndex, string UserName, int UserID, int Status, int Level, bool IsHost, bool mySelf)
{
    local TeamMemberItem Item;
    local string mat;

    Log(((((("[BTPageRoomLobby::Add]" $ " UserName=") $ UserName) $ " UserID=") $ string(UserID)) $ " Status=") $ string(Status));
    Item.ClanID = ClanID;
    Item.ClassIndex = ClassIndex;
    Item.UserName = UserName;
    Item.UserID = UserID;
    Item.Status = Status;
    Item.Level = Level;
    Item.IsHost = IsHost;
    Item.IsMySelf = mySelf;
    mat = PlayerOwner().Level.GameMgr.GetLevelImageString(Level);
    Item.ClassImage = Material(DynamicLoadObject(mat, Class'Engine.Material'));
    Item.ClassImageCoordi = PlayerOwner().Level.GameMgr.GetLevelImageCoordi(Level);
    MultiColumnList.AddedItem(Members.Length);
    Members[Members.Length] = Item;
    //return;    
}

function bool RemoveByUID(int UID)
{
    local int removeIndex;

    removeIndex = FindIndexByUID(UID);
    // End:0x45
    if(removeIndex != -1)
    {
        Members.Remove(removeIndex, 1);
        MultiColumnList.RemovedItem(removeIndex);
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function int FindIndexByUID(int UID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(lp1 < Members.Length)
    {
        // End:0x37
        if(Members[lp1].UserID == UID)
        {
            return lp1;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function Clear()
{
    Log("[BTPageRoomLobby::Clear]");
    Members.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

function bool InternalDraw(Canvas C)
{
    C.SetPos(ActualLeft(), ActualTop());
    C.DrawTileStretched(BoxMat, ActualWidth(), ActualHeight());
    C.SetPos(ActualLeft(), ActualTop());
    C.DrawTileStretched(BoxMat, ActualWidth(), (HeaderHeight + OffsetBetweenHeaderAndList) * C.ClipY);
    return false;
    //return;    
}

function bool InternalPostDraw(Canvas C)
{
    return false;
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    MultiColumnList.bHotTrack = false;
    return true;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.BTTeamMemberList.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
        WinTop=0.0050000
        WinLeft=0.0050000
        WinWidth=0.9900000
        WinHeight=0.9900000
        ContextMenu=BTContextMenuUser'GUIWarfareControls_Decompressed.BTTeamMemberList.mMenu'
    end object
    MultiColumnBox=mMultiColumnBox
    LineCount=8
    MarkSizeRatio=0.0416667
    HeaderHeight=0.0221354
    OffsetBetweenHeaderAndList=0.0052083
    ItemHeight=0.0442708
    ColumnCaptionClan="??"
    ColumnCaptionLevel="??"
    ColumnCaptionNick="???"
    ColumnCaptionClanName="???"
    ColumnCaptionStatus="??"
    ColumnCaptionPing="?"
    StatusStringReady="??"
    StatusStringPlaying="???"
    StatusStringShop="??"
    StatusStringAuction="??"
    OnPostDraw=BTTeamMemberList.InternalPostDraw
    bBoundToParent=true
    bScaleToParent=true
    OnDraw=BTTeamMemberList.InternalDraw
}