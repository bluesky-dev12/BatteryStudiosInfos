class BTMyAuctionList extends GUITabPanel
    editinlinenew
    instanced;

struct AuctionItem
{
    var wItemBaseParam ItemParam;
    var wItemResourceParam ItemResParam;
    var Material ItemImage;
    var Material RequiredLevelImage;
    var FloatBox RequiredLevelImageCoordi;
    var array<Material> ImageParts;
    var BtrDouble UniqueID;
    var int ItemID;
    var int AddPartID;
    var int EndTime;
    var int PriceCurrent;
    var int PriceBuyItNow;
    var int Damage;
    var string BestOfferUser;
};

var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var array<AuctionItem> AuctionItems;
var float ItemHeight;
var float FontSize;
var() automated WinBox ItemPos;
var Material ImageOverlay;
var IntBox ImageOverlayCoords;
var() automated WinBox ImageOverlayPos;
var Material InfoOverlay;
var IntBox InfoOverlayCoords;
var() automated WinBox InfoOverlayPos;
var Material SelectedImageOverlay;
var IntBox SelectedImageOverlayCoords;
var() automated WinBox SelectedImagePos;
var() automated WinBox EndTimePos;
var() automated WinBox PricePos;
var() automated WinBox BiderPos;
var() automated WinBox LabelEndTimePos;
var() automated WinBox LabelPricePos;
var() automated WinBox LabelBiderPos;
var() automated WinBox ItemRankPos;
var() automated WinBox DisplayNamePos;
var() automated WinBox LevelPos;
var() automated array<editinlinenotify WinBox> PartsPos;
var() automated WinBox DamagePos;
var array<Material> ItemRankImages;
var() automated WinBox ScrollbarPos;
var() automated WinFrameChanger FrameChanger;
var bool bDisplayExactRemaingTime;
var localized string CaptionDamage;
var localized string CaptionEndDate;
var localized string CaptionCurrentAndBuyItNowPrice;
var localized string CaptionBestOfferUser;
var localized string CaptionLongest;
var localized string CaptionLonger;
var localized string CaptionSoso;
var localized string CaptionShorter;
var localized string CaptionShortest;
var localized string CaptionHour;
var localized string CaptionMinute;
var localized string CaptionSeconds;

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
    MultiColumnList.__OnChange__Delegate = MultiColumnBox_OnChange;
    MultiColumnList.ColumnHeadings[0] = "";
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bForceScrollBarPosition = true;
    MultiColumnList.ForcedScrollbarWinLeft = ScrollbarPos.X();
    MultiColumnList.ForcedScrollbarWinTop = ScrollbarPos.Y();
    MultiColumnList.ForcedScrollbarWinWidth = ScrollbarPos.W();
    MultiColumnList.ForcedScrollbarWinHeight = ScrollbarPos.H();
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone_Store', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton_Store', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton_Store', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton_Store');
    //return;    
}

function AddItem(BtrDouble UniqueID, int ItemID, int AddPartID, int EndTime, int bidPrice, int buyItNowPrice, int ItemDamage, string highestBidder)
{
    local int iTemp;
    local wPartsGroupParam PartsParam;
    local wItemResourceParam resParam;
    local AuctionItem Item;

    Item.UniqueID = UniqueID;
    Item.ItemID = ItemID;
    Item.AddPartID = AddPartID;
    PartsParam = PlayerOwner().Level.GameMgr.GetAddPartsGroupParam(AddPartID);
    iTemp = 0;
    // End:0x106
    if(PartsParam.iSightID > 0)
    {
        resParam = PlayerOwner().Level.GameMgr.GetItemResourceParam(PartsParam.iSightID);
        // End:0x106
        if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
        {
            Item.ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
        }
    }
    // End:0x1AB
    if(PartsParam.iSilencerID > 0)
    {
        resParam = PlayerOwner().Level.GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
        // End:0x1AB
        if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
        {
            Item.ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
        }
    }
    Item.EndTime = EndTime;
    Item.PriceCurrent = bidPrice;
    Item.PriceBuyItNow = buyItNowPrice;
    Item.Damage = ItemDamage;
    Item.BestOfferUser = highestBidder;
    Item.ItemParam = PlayerOwner().Level.GameMgr.GetItemParam(ItemID);
    Item.ItemResParam = PlayerOwner().Level.GameMgr.GetItemResourceParam(ItemID);
    Item.RequiredLevelImage = Material(DynamicLoadObject(PlayerOwner().Level.GameMgr.GetLevelImageString(Item.ItemParam.iEquipLevel), Class'Engine.Material'));
    Item.RequiredLevelImageCoordi = PlayerOwner().Level.GameMgr.GetLevelImageCoordi(Item.ItemParam.iEquipLevel);
    Item.ItemImage = Material(DynamicLoadObject(Item.ItemResParam.strRes_Icon, Class'Engine.Material'));
    AuctionItems[AuctionItems.Length] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function Clear()
{
    AuctionItems.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

function int GetSelectedIndex()
{
    return MultiColumnList.Index;
    //return;    
}

function AuctionItem GetSelectedItem()
{
    return GetItemByIndex(GetSelectedIndex());
    //return;    
}

function AuctionItem GetItemByIndex(int Index)
{
    return AuctionItems[Index];
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    return false;
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local export editinline GUIStyles DrawStyle;
    local int lp1, ItemRank;
    local Material itemRankImage;
    local AuctionItem curItem;
    local int fSize;
    local FloatBoxWH P;
    local int Hour, Minute, Second, TimeLeft;
    local string TimeText;

    FrameChanger.SetFrame(X, Y, W, HT);
    curItem = AuctionItems[Item];
    // End:0x54
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
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    P = FrameChanger.WinBoxToFloatBoxWH(ImageOverlayPos);
    C.SetPos(P.X, P.Y);
    C.DrawTile(ImageOverlay, P.W, P.H, float(ImageOverlayCoords.X1), float(ImageOverlayCoords.Y1), float(ImageOverlayCoords.X2), float(ImageOverlayCoords.Y2));
    P = FrameChanger.WinBoxToFloatBoxWH(InfoOverlayPos);
    C.SetPos(P.X, P.Y);
    C.DrawTile(InfoOverlay, P.W, P.H, float(InfoOverlayCoords.X1), float(InfoOverlayCoords.Y1), float(InfoOverlayCoords.X2), float(InfoOverlayCoords.Y2));
    P = FrameChanger.WinBoxToFloatBoxWH(ItemRankPos);
    C.SetPos(P.X, P.Y);
    ItemRank = int(curItem.ItemParam.eGrade);
    itemRankImage = ItemRankImages[ItemRank];
    C.DrawTile(itemRankImage, P.W, P.H, 0.0000000, 0.0000000, float(itemRankImage.MaterialUSize()), float(itemRankImage.MaterialVSize()));
    // End:0x353
    if(curItem.ItemImage != none)
    {
        P = FrameChanger.WinBoxToFloatBoxWH(ItemPos);
        C.SetPos(P.X, P.Y);
        C.DrawTile(curItem.ItemImage, P.W, P.H, 0.0000000, 0.0000000, float(curItem.ItemImage.MaterialUSize()), float(curItem.ItemImage.MaterialVSize()));
    }
    P = FrameChanger.WinBoxToFloatBoxWH(LevelPos);
    C.SetPos(P.X, P.Y);
    C.DrawTile(curItem.RequiredLevelImage, P.W, P.H, curItem.RequiredLevelImageCoordi.X1, curItem.RequiredLevelImageCoordi.Y1, curItem.RequiredLevelImageCoordi.X2, curItem.RequiredLevelImageCoordi.Y2);
    lp1 = 0;
    J0x400:

    // End:0x4D7 [Loop If]
    if(lp1 < curItem.ImageParts.Length)
    {
        P = FrameChanger.WinBoxToFloatBoxWH(PartsPos[lp1]);
        C.SetPos(P.X, P.Y);
        C.DrawTile(curItem.ImageParts[lp1], P.W, P.H, 0.0000000, 0.0000000, float(curItem.ImageParts[lp1].MaterialUSize()), float(curItem.ImageParts[lp1].MaterialVSize()));
        lp1++;
        // [Loop Continue]
        goto J0x400;
    }
    P = FrameChanger.WinBoxToFloatBoxWH(DisplayNamePos);
    C.SetPos(P.X, P.Y);
    C.BtrDrawTextJustified(curItem.ItemParam.strDisplayName, 0, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    P = FrameChanger.WinBoxToFloatBoxWH(DamagePos);
    C.SetPos(P.X, P.Y);
    C.BtrDrawTextJustified((CaptionDamage $ " ") $ string(curItem.Damage / 1000), 0, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    P = FrameChanger.WinBoxToFloatBoxWH(LabelEndTimePos);
    C.SetPos(P.X, P.Y);
    C.BtrDrawTextJustified(CaptionEndDate, 0, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    P = FrameChanger.WinBoxToFloatBoxWH(LabelPricePos);
    C.SetPos(P.X, P.Y);
    C.BtrDrawTextJustified(CaptionCurrentAndBuyItNowPrice, 0, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    P = FrameChanger.WinBoxToFloatBoxWH(LabelBiderPos);
    C.SetPos(P.X, P.Y);
    C.BtrDrawTextJustified(CaptionBestOfferUser, 0, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    P = FrameChanger.WinBoxToFloatBoxWH(EndTimePos);
    C.SetPos(P.X, P.Y);
    TimeLeft = curItem.EndTime - Controller.Time;
    Hour = TimeLeft / 3600;
    Minute = (TimeLeft - (Hour * 3600)) / 60;
    Second = (TimeLeft - (Hour * 3600)) - (Minute * 60);
    // End:0x8D1
    if(bDisplayExactRemaingTime)
    {
        TimeText = (((("" $ string(Hour)) $ CaptionHour) $ " ") $ string(Minute)) $ CaptionMinute;        
    }
    else
    {
        // End:0x8EB
        if(Hour >= 24)
        {
            TimeText = CaptionLongest;            
        }
        else
        {
            // End:0x905
            if(Hour >= 12)
            {
                TimeText = CaptionLonger;                
            }
            else
            {
                // End:0x91F
                if(Hour >= 6)
                {
                    TimeText = CaptionSoso;                    
                }
                else
                {
                    // End:0x939
                    if(Hour >= 2)
                    {
                        TimeText = CaptionShorter;                        
                    }
                    else
                    {
                        TimeText = CaptionShortest;
                    }
                }
            }
        }
    }
    C.BtrDrawTextJustified(TimeText, 1, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    P = FrameChanger.WinBoxToFloatBoxWH(PricePos);
    C.SetPos(P.X, P.Y);
    C.BtrDrawTextJustified((("" $ string(curItem.PriceCurrent)) $ " / ") $ string(curItem.PriceBuyItNow), 1, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    P = FrameChanger.WinBoxToFloatBoxWH(BiderPos);
    C.SetPos(P.X, P.Y);
    C.BtrDrawTextJustified(curItem.BestOfferUser, 1, P.X, P.Y, P.X + P.W, P.Y + P.H, 9);
    // End:0xB59
    if(bSelected)
    {
        P = FrameChanger.WinBoxToFloatBoxWH(SelectedImagePos);
        C.SetPos(P.X, P.Y);
        C.DrawTileStretched(SelectedImageOverlay, P.W, P.H);
    }
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return ItemHeight * C.ClipY;
    //return;    
}

function MultiColumnBox_OnChange(GUIComponent Sender)
{
    OnChange(self);
    //return;    
}

defaultproperties
{
    CaptionDamage="???"
    CaptionEndDate="?? ??"
    CaptionCurrentAndBuyItNowPrice="?? ??? / ?? ???"
    CaptionBestOfferUser="?? ???"
    CaptionLongest="???"
    CaptionLonger="??"
    CaptionSoso="??"
    CaptionShorter="??"
    CaptionShortest="???"
    CaptionHour="??"
    CaptionMinute="?"
    CaptionSeconds="?"
}