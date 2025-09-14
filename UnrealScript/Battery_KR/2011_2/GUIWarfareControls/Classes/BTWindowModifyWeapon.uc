class BTWindowModifyWeapon extends BTWindow
    editinlinenew
    instanced;

struct PartsGroupItem
{
    var int iPartsGroupID;
    var string strPartsGroupName;
    var string strPrice;
};

var() automated GUILabel LabelMessage;
var() automated GUIButton ButtonOK;
var() automated GUIButton ButtonCancel;
var() automated BTTailImage ButtonTail[2];
var() automated BTInputImage ImgTitleBG;
var() automated FloatingImage ImgTitleString;
var() automated FloatingImage ImgWeaponWnd_BG[2];
var() automated FloatingImage ImgWeaponWnd_Line;
var() automated FloatingImage ImgWeaponWnd_ItemBG[2];
var() automated FloatingImage ImgWeaponWnd_Item;
var() automated FloatingImage ImgWeaponWnd_Item_Parts[2];
var() automated FloatingImage ImgWeaponWnd_CamoCombo_BG;
var() automated FloatingImage ImgPriceWnd_BG;
var() automated FloatingImage ImgPriceWnd_Line;
var() automated FloatingImage ImgPriceWnd_String[2];
var() automated BTInputImage ImgPriceWnd_StringBG[6];
var() automated GUIMultiColumnListBox MultiColumnBox;
var export editinline GUIMultiColumnList MultiColumnList;
var float ItemHeight;
var() automated GUILabel LabelPartsGroupName;
var() automated GUILabel LabelPartsGroupDesc;
var() automated GUILabel LabelStrings[4];
var() automated GUILabel LabelPoint[3];
var() automated GUILabel LabelCash[3];
var() automated GUILabel LabelItemName;
var() automated GUIComboBox ComboCamo;
var int ItemID;
var BtrDouble ItemUniqueID;
var int PartsGroupID;
var array<PartsGroupItem> PartsItems;
var Material ListBGMaterial_Normal;
var Material ListBGMaterial_Unable;
var Material ListBGMaterial_Selected;
//var delegate<OnOK> __OnOK__Delegate;

delegate bool OnOK(GUIComponent Sender)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(FloatingWindow).InitComponent(MyController, myOwner);
    InitializeMultiColumn();
    ComboCamo.MyListBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    FillCamoComboList();
    //return;    
}

function SetItemIDs(BtrDouble iItemUniqueID, int iItemID, int iPartsGroupID)
{
    ItemUniqueID = iItemUniqueID;
    ItemID = iItemID;
    PartsGroupID = iPartsGroupID;
    ResetComponents();
    InitComponentbyItem();
    //return;    
}

function ResetComponents()
{
    PartsItems.Length = 0;
    MultiColumnList.Clear();
    //return;    
}

function InitComponentbyItem()
{
    local wGameManager GameMgr;
    local wItemBaseParam ItemParam;
    local wItemResourceParam resParam;
    local int iTemp;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemParam = GameMgr.GetItemParam(ItemID);
    resParam = GameMgr.GetItemResourceParam(ItemID);
    RefreshWindow();
    // End:0xAE
    if(resParam.iItemResourceID != -1)
    {
        ImgWeaponWnd_Item.Image = Texture(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Texture'));
    }
    iTemp = 0;
    J0xB5:

    // End:0x122 [Loop If]
    if(iTemp < GameMgr.AddPartsGroupParams.Length)
    {
        // End:0x118
        if(GameMgr.AddPartsGroupParams[iTemp].strPartsGroupID == ItemParam.strAddPartGroupID)
        {
            AddPartsItem(GameMgr.AddPartsGroupParams[iTemp]);
        }
        iTemp++;
        // [Loop Continue]
        goto J0xB5;
    }
    iTemp = 0;
    J0x129:

    // End:0x171 [Loop If]
    if(iTemp < PartsItems.Length)
    {
        // End:0x167
        if(PartsItems[iTemp].iPartsGroupID == PartsGroupID)
        {
            MultiColumnList.SetIndex(iTemp);
        }
        iTemp++;
        // [Loop Continue]
        goto J0x129;
    }
    //return;    
}

function RefreshWindow()
{
    local wItemBaseParam ItemParam;
    local wItemResourceParam resParam;
    local wPartsGroupParam PartsParam;
    local wGameManager GameMgr;
    local wMyPlayerStatus MyStatus;
    local int iTemp;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    ItemParam = GameMgr.GetItemParam(ItemID);
    // End:0x9B
    if(ItemParam.iItemID == -1)
    {
        return;
    }
    // End:0xC3
    if(PartsGroupID <= 0)
    {
        PartsParam = GameMgr.GetDefaultAddPartsGroupParam(ItemID);        
    }
    else
    {
        PartsParam = GameMgr.GetAddPartsGroupParam(PartsGroupID);
    }
    // End:0xF7
    if(PartsParam.iAddPartID == -1)
    {
        return;
    }
    LabelPartsGroupName.Caption = PartsParam.strName;
    LabelPartsGroupDesc.Caption = PartsParam.strDescription;
    LabelItemName.Caption = ItemParam.strDisplayName;
    ImgWeaponWnd_Item_Parts[0].Image = none;
    ImgWeaponWnd_Item_Parts[1].Image = none;
    // End:0x20B
    if(PartsParam.iSightID > 0)
    {
        resParam = GameMgr.GetItemResourceParam(PartsParam.iSightID);
        // End:0x20B
        if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
        {
            ImgWeaponWnd_Item_Parts[iTemp++].Image = Texture(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Texture'));
        }
    }
    // End:0x2A4
    if(PartsParam.iSilencerID > 0)
    {
        resParam = GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
        // End:0x2A4
        if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
        {
            ImgWeaponWnd_Item_Parts[iTemp++].Image = Texture(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Texture'));
        }
    }
    LabelPoint[0].Caption = string(PartsParam.iPointPrice);
    LabelPoint[1].Caption = string(MyStatus.Point);
    LabelPoint[2].Caption = string(MyStatus.Point - PartsParam.iPointPrice);
    LabelCash[0].Caption = string(PartsParam.iCashPrice);
    LabelCash[1].Caption = string(MyStatus.Cash);
    LabelCash[2].Caption = string(MyStatus.Cash - PartsParam.iCashPrice);
    // End:0x3E9
    if(((MyStatus.Point - PartsParam.iPointPrice) < 0) || (MyStatus.Cash - PartsParam.iCashPrice) < 0)
    {
        ButtonOK.SetEnabled(false);        
    }
    else
    {
        ButtonOK.SetEnabled(true);
    }
    //return;    
}

function RefreshListBox()
{
    //return;    
}

function AddPartsItem(wPartsGroupParam partParam)
{
    local PartsGroupItem tmItem;

    tmItem.iPartsGroupID = partParam.iAddPartID;
    tmItem.strPartsGroupName = partParam.strName;
    // End:0x6E
    if(partParam.iCashPrice != 0)
    {
        tmItem.strPrice = string(partParam.iCashPrice) $ " Cash ";        
    }
    else
    {
        tmItem.strPrice = string(partParam.iPointPrice) $ " Point ";
    }
    PartsItems[PartsItems.Length] = tmItem;
    MultiColumnList.AddedItem();
    //return;    
}

function InitializeMultiColumn()
{
    MultiColumnList = MultiColumnBox.List;
    MultiColumnBox.bDisplayHeader = false;
    MultiColumnList.__OnPreDraw__Delegate = MultiColumnList_OnPreDraw;
    MultiColumnList.__OnDrawItem__Delegate = MultiColumnList_OnDrawItem;
    MultiColumnList.__OnDblClick__Delegate = MultiColumnList_OnDblClick;
    MultiColumnList.__GetItemHeight__Delegate = GetItemHeight;
    MultiColumnList.__OnChange__Delegate = MultiColumnlist_OnChange;
    MultiColumnBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    FocusFirst(none);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super.Closed(Sender, bCancelled);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super(FloatingWindow).InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    return OnOK(self);
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool MultiColumnList_OnPreDraw(Canvas C)
{
    return false;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return C.ClipY * ItemHeight;
    //return;    
}

function MultiColumnList_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float le[2], WI;
    local export editinline GUIStyles DrawStyle;

    MultiColumnList.GetCellLeftWidth(0, le[0], WI[0]);
    MultiColumnList.GetCellLeftWidth(1, le[1], WI[1]);
    // End:0x5C
    if(bSelected)
    {
        DrawStyle = MultiColumnList.SelectedStyle;        
    }
    else
    {
        DrawStyle = MultiColumnList.Style;
    }
    C.Style = 1;
    // End:0x1EF
    if(Item < PartsItems.Length)
    {
        C.SetPos(le[0], Y);
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        // End:0x109
        if(bSelected)
        {
            C.DrawTile(ListBGMaterial_Selected, W, HT, 0.0000000, 0.0000000, 324.0000000, 23.0000000);            
        }
        else
        {
            C.DrawTile(ListBGMaterial_Normal, W, HT, 0.0000000, 0.0000000, 324.0000000, 23.0000000);
        }
        DrawStyle.DrawText(C, MultiColumnList.MenuState, le[0], Y, WI[1], HT, 0, PartsItems[Item].strPartsGroupName, MultiColumnList.FontScale);
        DrawStyle.DrawText(C, MultiColumnList.MenuState, le[1], Y, WI[1], HT, 2, PartsItems[Item].strPrice, MultiColumnList.FontScale);
    }
    //return;    
}

function bool MultiColumnList_OnDblClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function MultiColumnlist_OnChange(GUIComponent Sender)
{
    // End:0x63
    if((MultiColumnList.Index < PartsItems.Length) && PartsGroupID != PartsItems[MultiColumnList.Index].iPartsGroupID)
    {
        PartsGroupID = PartsItems[MultiColumnList.Index].iPartsGroupID;
        RefreshWindow();
    }
    //return;    
}

function int GetSelectedIndex()
{
    return MultiColumnList.Index;
    //return;    
}

function FillCamoComboList()
{
    ComboCamo.List.Clear();
    ComboCamo.AddItem("None = 0 Point");
    ComboCamo.List.SortList();
    //return;    
}

defaultproperties
{
    ItemHeight=0.0299479
    ItemID=-1
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bMoveAllowed=false
    DefaultLeft=0.3398438
    DefaultTop=0.1328125
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bAllowedAsLast=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    WinTop=0.1328125
    WinLeft=0.3398438
    WinWidth=0.3203125
    WinHeight=0.7291667
}