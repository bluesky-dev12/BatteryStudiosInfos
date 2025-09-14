class BTOnlineUserList extends GUITabPanel
    editinlinenew
    instanced;

struct OnlineUserItem
{
    var Material ClanImage;
    var Material LevelImage;
    var string UserName;
    var int UserID;
};

var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var array<OnlineUserItem> Users;
var float ItemHeight;
var int FontHeight;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    MultiColumnBox.Header.bAcceptsInput = false;
    MultiColumnBox.Header.UseManualHeight = true;
    MultiColumnBox.Header.ManualHeight = 15.0000000;
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.ColumnHeadings[0] = "Clan";
    MultiColumnList.ColumnHeadings[1] = "Level";
    MultiColumnList.ColumnHeadings[2] = "ID";
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.CallDrawItemForPlaceHoldingItems = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return C.ClipY * ItemHeight;
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    return false;
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

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float l0, w0, l1, w1, l2, w2,
	    offX, offY, markW, markH;

    local export editinline GUIStyles DrawStyle;

    // End:0x16
    if(Item == 0)
    {
        DrawStripes(C);
    }
    // End:0x343
    if(Item < Users.Length)
    {
        MultiColumnList.GetCellLeftWidth(0, l0, w0);
        MultiColumnList.GetCellLeftWidth(1, l1, w1);
        MultiColumnList.GetCellLeftWidth(2, l2, w2);
        // End:0x95
        if(bSelected)
        {
            DrawStyle = MultiColumnList.SelectedStyle;            
        }
        else
        {
            DrawStyle = MultiColumnList.Style;
        }
        C.Style = 1;
        markW = (32.0000000 / 1024.0000000) * C.ClipX;
        markH = (32.0000000 / 768.0000000) * C.ClipY;
        // End:0x118
        if(markW > w0)
        {
            markW = w0;
        }
        // End:0x132
        if(markW > w1)
        {
            markW = w1;
        }
        // End:0x14C
        if(markH > HT)
        {
            markH = HT;
        }
        // End:0x166
        if(markW > markH)
        {
            markW = markH;
        }
        // End:0x180
        if(markH > markW)
        {
            markH = markW;
        }
        offX = (w0 - markW) / float(2);
        offY = (HT - markH) / float(2);
        // End:0x249
        if(Users[Item].ClanImage != none)
        {
            C.SetPos(l0 + offX, Y + offY);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(Users[Item].ClanImage, markW, markH, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        }
        // End:0x2E2
        if(Users[Item].LevelImage != none)
        {
            C.SetPos(l1 + offX, Y + offY);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(Users[Item].LevelImage, markW, markH, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        }
        C.BtrDrawTextJustified(" " $ Users[Item].UserName, 0, l2, Y, w2, Y + HT, int((float(FontHeight) / 768.0000000) * C.ClipY));
    }
    //return;    
}

function Add(Material ClanImage, Material LevelImage, string UserName, int UserID)
{
    local OnlineUserItem Item;

    Log(((("[BTOnlineUserList::Add]" $ " userName=") $ UserName) $ " userID=") $ string(UserID));
    Item.ClanImage = ClanImage;
    Item.LevelImage = LevelImage;
    Item.UserName = UserName;
    Item.UserID = UserID;
    Users[Users.Length] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function RemoveByUserID(int UserID)
{
    local int lp1;

    Log(("[BTOnlineUserList::RemoveByUserID]" $ " userID=") $ string(UserID));
    lp1 = 0;
    J0x42:

    // End:0x99 [Loop If]
    if(lp1 < Users.Length)
    {
        // End:0x8F
        if(Users[lp1].UserID == UserID)
        {
            Users.Remove(lp1, 1);
            MultiColumnList.RemovedItem(lp1);
            // [Explicit Break]
            goto J0x99;
        }
        lp1++;
        // [Loop Continue]
        goto J0x42;
    }
    J0x99:

    //return;    
}

function Clear()
{
    Log("[BTOnlineUserList::Clear]");
    Users.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.BTOnlineUserList.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        bDisplayHeader=false
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
        WinLeft=0.0100000
        WinWidth=0.9900000
    end object
    MultiColumnBox=mMultiColumnBox
    ItemHeight=0.0442708
    FontHeight=10
    bBoundToParent=true
    bScaleToParent=true
}