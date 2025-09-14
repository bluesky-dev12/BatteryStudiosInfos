class BTMyItemList_Weapon extends GUITabPanel
    editinlinenew
    instanced;

enum EItemAuctionStatus
{
    EIAS_Eligible,                  // 0
    EIAS_Equipped,                  // 1
    EIAS_NotForAuction,             // 2
    EIAS_QuickSlot,                 // 3
    EIAS_NeedRepair                 // 4
};

struct MyItem
{
    var sItem Item;
    var wItemBaseParam ItemParam;
    var wItemResourceParam ItemResParam;
    var Material RequiredLevelImage;
    var FloatBox RequiredLevelImageCoordi;
    var BTMyItemList_Weapon.EItemAuctionStatus Status;
    var string StatusString;
    var Color StatusColor;
};

var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var array<MyItem> MyItems;
var float ItemHeight;
var float HeaderHeight;
var float OffsetBetweenHeaderAndList;
var float LevelImageWidth;
var float LevelImageHeight;
var float HeaderFontSize;
var float FontSize;
var localized string CaptionHeaderName;
var localized string CaptionHeaderItemRank;
var localized string CaptionHeaderRequiredLevel;
var localized string CaptionHeaderStatus;
var localized string CaptionHeaderDamage;
var localized string CaptionStatus_Eligible;
var localized string CaptionStatus_Equipped;
var localized string CaptionStatus_NotForAuction;
var localized string CaptionStatus_QuickSlot;
var localized string CaptionStatus_NeedRepair;
var Color ColorStatus_Eligible;
var Color ColorStatus_Equipped;
var Color ColorStatus_NotForAuction;
var Color ColorStatus_QuickSlot;
var Color ColorStatus_NeedRepair;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitMultiColumn();
    //return;    
}

function InitMultiColumn()
{
    MultiColumnBox.SetHeaderStyle(true, "STY2Warfare_ColumnHeader", true, "STY2Warfare_ColumnHeader");
    MultiColumnBox.Header.UseManualHeight = true;
    MultiColumnList = MultiColumnBox.List;
    MultiColumnList.CellSpacing = -5.0000000;
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.ColumnHeadings[0] = CaptionHeaderName;
    MultiColumnList.ColumnHeadings[1] = CaptionHeaderItemRank;
    MultiColumnList.ColumnHeadings[2] = CaptionHeaderRequiredLevel;
    MultiColumnList.ColumnHeadings[3] = CaptionHeaderStatus;
    MultiColumnList.ColumnHeadings[4] = CaptionHeaderDamage;
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bForceScrollBarPosition = true;
    MultiColumnList.ForcedScrollbarWinLeft = 0.9677734;
    MultiColumnList.ForcedScrollbarWinTop = 0.1705729;
    MultiColumnList.ForcedScrollbarWinWidth = 0.0146484;
    MultiColumnList.ForcedScrollbarWinHeight = 0.3046875;
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

function GetStatusString(MyItem tem, out BTMyItemList_Weapon.EItemAuctionStatus eias, out string Status, out Color StatusColor)
{
    local bool isEquipped, needRepair, isOnQuickSlot;
    local BTNetEnums BTNetEnums;

    BTNetEnums = new Class'BatteryNet.BTNetEnums';
    isEquipped = tem.Item.iSlotPosition != int(BTNetEnums.13);
    needRepair = tem.Item.iDurability != 100000;
    switch(tem.Item.iSlotPosition)
    {
        // End:0x72
        case int(BTNetEnums.4):
        // End:0x82
        case int(BTNetEnums.5):
        // End:0x92
        case int(BTNetEnums.6):
        // End:0xA2
        case int(BTNetEnums.7):
        // End:0xB2
        case int(BTNetEnums.8):
        // End:0xC2
        case int(BTNetEnums.9):
        // End:0xD2
        case int(BTNetEnums.10):
        // End:0xE2
        case int(BTNetEnums.11):
        // End:0xFA
        case int(BTNetEnums.12):
            isOnQuickSlot = true;
        // End:0xFFFF
        default:
            isOnQuickSlot = false;
            // End:0x13C
            if(isEquipped && !isOnQuickSlot)
            {
                Status = CaptionStatus_Equipped;
                StatusColor = ColorStatus_Equipped;
                eias = 1;                
            }
            else
            {
                // End:0x166
                if(isOnQuickSlot)
                {
                    Status = CaptionStatus_QuickSlot;
                    StatusColor = ColorStatus_QuickSlot;
                    eias = 3;                    
                }
                else
                {
                    // End:0x190
                    if(needRepair)
                    {
                        Status = CaptionStatus_NeedRepair;
                        StatusColor = ColorStatus_NeedRepair;
                        eias = 4;                        
                    }
                    else
                    {
                        // End:0x1CA
                        if(!tem.ItemParam.bAuction)
                        {
                            Status = CaptionStatus_NotForAuction;
                            StatusColor = ColorStatus_NotForAuction;
                            eias = 2;                            
                        }
                        else
                        {
                            Status = CaptionStatus_Eligible;
                            StatusColor = ColorStatus_Eligible;
                            eias = 0;
                        }
                    }
                }
            }
            //return;
            break;
    }    
}

function AddItem(sItem Item, wItemBaseParam ItemParam, wItemResourceParam ItemResParam)
{
    local MyItem myTem;

    myTem.Item = Item;
    myTem.ItemParam = ItemParam;
    myTem.ItemResParam = ItemResParam;
    GetStatusString(myTem, myTem.Status, myTem.StatusString, myTem.StatusColor);
    myTem.RequiredLevelImage = Material(DynamicLoadObject(Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImageString(ItemParam.iEquipLevel), Class'Engine.Material'));
    myTem.RequiredLevelImageCoordi = Controller.ViewportOwner.Actor.Level.GameMgr.GetLevelImageCoordi(ItemParam.iEquipLevel);
    MyItems[MyItems.Length] = myTem;
    MultiColumnList.AddedItem();
    //return;    
}

function ClearAllChannels()
{
    MyItems.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

function int GetSelectedIndex()
{
    return MultiColumnList.Index;
    //return;    
}

function MyItem GetSelectedMyItem()
{
    return GetMyItemByIndex(GetSelectedIndex());
    //return;    
}

function MyItem GetMyItemByIndex(int Index)
{
    return MyItems[Index];
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

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float L[5], wt;
    local export editinline GUIStyles DrawStyle;
    local Material materialBG;
    local int lp1;
    local MyItem curItem;
    local int imageW, imageH, fSize;

    curItem = MyItems[Item];
    lp1 = 0;
    J0x18:

    // End:0x58 [Loop If]
    if(lp1 < 5)
    {
        MultiColumnList.GetCellLeftWidth(lp1, L[lp1], wt[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x18;
    }
    // End:0x78
    if(bSelected)
    {
        DrawStyle = MultiColumnList.SelectedStyle;        
    }
    else
    {
        DrawStyle = MultiColumnList.Style;
    }
    C.Style = 1;
    fSize = int((FontSize * C.ClipY) + 0.5000000);
    C.SetPos(L[0], Y);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x124
    if(materialBG != none)
    {
        C.DrawTileStretched(materialBG, W, HT);
    }
    C.BtrDrawTextJustified("   " $ curItem.ItemParam.strDisplayName, 0, L[0], Y, L[0] + wt[0], Y + HT, fSize);
    C.BtrDrawTextJustified(curItem.ItemParam.strGradeDisplay, 1, L[1], Y, L[1] + wt[1], Y + HT, fSize);
    imageW = int(C.ClipX * LevelImageWidth);
    imageH = int(C.ClipY * LevelImageHeight);
    C.SetPos(L[2] + ((wt[2] - float(imageW)) / float(2)), Y + ((HT - float(imageH)) / float(2)));
    C.DrawTile(curItem.RequiredLevelImage, float(imageW), float(imageH), curItem.RequiredLevelImageCoordi.X1, curItem.RequiredLevelImageCoordi.Y1, curItem.RequiredLevelImageCoordi.X2, curItem.RequiredLevelImageCoordi.Y2);
    C.DrawColor = curItem.StatusColor;
    C.BtrDrawTextJustified(curItem.StatusString, 1, L[3], Y, L[3] + wt[3], Y + HT, fSize);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified(string(curItem.Item.iDamageDegree / 1000), 1, L[4], Y, L[4] + wt[4], Y + HT, fSize);
    // End:0x3BF
    if(bSelected)
    {
        C.SetPos(L[0] + float(1), Y + float(1));
    }
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return ItemHeight * C.ClipY;
    //return;    
}

defaultproperties
{
    // Reference: GUIMultiColumnListBox'GUIWarfareControls_Decompressed.BTMyItemList_Weapon.mMultiColumnBox'
    begin object name="mMultiColumnBox" class=XInterface.GUIMultiColumnListBox
        HeaderColumnPerc=/* Array type was not detected. */
        OnCreateComponent=mMultiColumnBox.InternalOnCreateComponent
        bUseAWinPos=true
        AWinPos=(X1=657.0000000,Y1=135.0000000,X2=989.0000000,Y2=369.0000000)
    end object
    MultiColumnBox=mMultiColumnBox
    ItemHeight=0.0442708
    HeaderHeight=0.0260417
    OffsetBetweenHeaderAndList=0.0052083
    LevelImageWidth=0.0312500
    LevelImageHeight=0.0416667
    HeaderFontSize=0.0143229
    FontSize=0.0117188
    CaptionHeaderName="??"
    CaptionHeaderItemRank="??"
    CaptionHeaderRequiredLevel="??"
    CaptionHeaderStatus="??"
    CaptionHeaderDamage="???"
    CaptionStatus_Eligible="??"
    CaptionStatus_Equipped="??"
    CaptionStatus_NotForAuction="?? ??"
    CaptionStatus_QuickSlot="???"
    CaptionStatus_NeedRepair="?? ??"
    ColorStatus_Eligible=(R=255,G=255,B=255,A=255)
    ColorStatus_Equipped=(R=255,G=0,B=0,A=255)
    ColorStatus_NotForAuction=(R=255,G=0,B=0,A=255)
    ColorStatus_QuickSlot=(R=255,G=0,B=0,A=255)
    ColorStatus_NeedRepair=(R=255,G=0,B=0,A=255)
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    bUseAWinPos=true
    AWinPos=(X1=657.0000000,Y1=135.0000000,X2=989.0000000,Y2=369.0000000)
}