class BTItemImageListBox extends GUITabPanel
    editinlinenew
    instanced;

struct Item
{
    var Material Image;
    var Material ImageParts[2];
    var Object Tag;
    var string strEtcs;
    var bool Selectible;
};

var() automated GUIVertImageListBox ImageListBox;
var export editinline GUIVertImageList ImageList;
var Material ImageOverlay;
var IntBox ImageOverlayCoords;
var Material SelectedImageOverlay;
var IntBox SelectedImageOverlayCoords;
var Material EquippedImageOverlay;
var IntBox EquippedImageOverlayCoords;
var Material ImageBGOverlay;
var IntBox ImageBGOverlayCoords;
var IntBox ImagePartsCoords;
var Color ItemNameFontColor_Normal;
var Color ItemNameFontColor_Equipped;
var float ItemNameFontSize;
var float ItemNameMargin;
var float PartsIconX;
var float PartsIconY;
var float PartsIconWidth;
var float PartsIconHeight;
var float PartsIconGapY;
var float SkillOffsetX;
var float SkillOffsetY;
var float SkillWidth;
var float SkillHeight;
var array<Item> items;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeImageListBox();
    //return;    
}

function InitializeImageListBox()
{
    ImageListBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    ImageList = ImageListBox.List;
    ImageList.__OnDrawItem__Delegate = ImageListBox_OnDrawItem;
    ImageList.__OnChange__Delegate = ImageListBox_OnChange;
    ImageList.CallDrawItemForPlaceHoldingItemsInFixedCountCellStyle = true;
    ImageList.__OnItemDblClick__Delegate = ImageListBox_OnItemDblClick;
    //return;    
}

function ImageListBox_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float X1, Y1, X2, Y2, itemFontSize;

    local wGameManager GameMgr;
    local wItemBaseParam tmParam;
    local int iTemp;

    ImageListBox.HorzBorder = int(0.0146484 * C.ClipX);
    ImageListBox.VertBorder = int(0.0195312 * C.ClipY);
    C.Style = 1;
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(X, Y);
    // End:0x163
    if(((Item < ImageList.ItemCount) && BTInventoryItem(items[Item].Tag) != none) && BTInventoryItem(items[Item].Tag).isEquipped)
    {
        C.DrawTile(EquippedImageOverlay, W, HT, float(EquippedImageOverlayCoords.X1), float(EquippedImageOverlayCoords.Y1), float(EquippedImageOverlayCoords.X2 - EquippedImageOverlayCoords.X1), float(EquippedImageOverlayCoords.Y2 - EquippedImageOverlayCoords.Y1));
    }
    C.SetPos(X, Y);
    C.DrawTile(ImageBGOverlay, W, HT, float(ImageBGOverlayCoords.X1), float(ImageBGOverlayCoords.Y1), float(ImageBGOverlayCoords.X2 - ImageBGOverlayCoords.X1), float(ImageBGOverlayCoords.Y2 - ImageBGOverlayCoords.Y1));
    C.SetPos(X, Y);
    C.DrawTile(ImageOverlay, W, HT, float(ImageOverlayCoords.X1), float(ImageOverlayCoords.Y1), float(ImageOverlayCoords.X2 - ImageOverlayCoords.X1), float(ImageOverlayCoords.Y2 - ImageOverlayCoords.Y1));
    // End:0x2E9
    if(bSelected)
    {
        C.SetPos(X, Y);
        C.DrawTile(SelectedImageOverlay, W, HT, float(SelectedImageOverlayCoords.X1), float(SelectedImageOverlayCoords.Y1), float(SelectedImageOverlayCoords.X2 - SelectedImageOverlayCoords.X1), float(SelectedImageOverlayCoords.Y2 - SelectedImageOverlayCoords.Y1));
    }
    // End:0x935
    if(Item < ImageList.ItemCount)
    {
        // End:0x935
        if(BTInventoryItem(items[Item].Tag) != none)
        {
            // End:0x356
            if(bSelected)
            {
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));                
            }
            else
            {
                C.DrawColor = C.MakeColor(160, 160, 160, byte(255));
            }
            // End:0x476
            if(BTInventoryItem(items[Item].Tag).IsSkill == true)
            {
                X1 = X + (SkillOffsetX * C.ClipX);
                Y1 = Y + (SkillOffsetY * C.ClipY);
                X2 = SkillWidth * C.ClipX;
                Y2 = SkillHeight * C.ClipY;
                C.SetPos(X1, Y1);
                C.DrawTile(items[Item].Image, X2, Y2, 0.0000000, 0.0000000, 48.0000000, 48.0000000);                
            }
            else
            {
                C.SetPos(X, Y);
                C.DrawTile(items[Item].Image, W, HT, 0.0000000, 0.0000000, float(items[Item].Image.MaterialUSize()), float(items[Item].Image.MaterialVSize()));
            }
            itemFontSize = ItemNameFontSize * C.ClipY;
            X1 = X + ((float(2) * ItemNameMargin) * C.ClipX);
            X2 = (X + W) - (ItemNameMargin * C.ClipY);
            Y1 = Y;
            Y2 = (Y + itemFontSize) + ((float(4) * ItemNameMargin) * C.ClipY);
            // End:0x5D9
            if(BTInventoryItem(items[Item].Tag).isEquipped)
            {
                C.DrawColor = ItemNameFontColor_Equipped;                
            }
            else
            {
                C.DrawColor = ItemNameFontColor_Normal;
            }
            GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
            tmParam = GameMgr.GetItemParam(BTInventoryItem(items[Item].Tag).ItemID);
            C.BtrDrawTextJustified(tmParam.strDisplayName, 0, X1, Y1, X2, Y2, int(itemFontSize));
            // End:0x7A8
            if(BTInventoryItem(items[Item].Tag).Durability != -1)
            {
                X1 = X + ((float(2) * ItemNameMargin) * C.ClipX);
                X2 = (X + W) - (ItemNameMargin * C.ClipX);
                Y1 = Y;
                Y2 = (Y + (HT * float(2))) - ((float(2) * ItemNameFontSize) * C.ClipY);
                C.BtrDrawTextJustified("Durability : " $ string(float(BTInventoryItem(items[Item].Tag).Durability) * 0.0010000), 2, X1, Y1, X2, Y2, int(itemFontSize));
            }
            iTemp = 0;
            J0x7AF:

            // End:0x935 [Loop If]
            if(iTemp < 2)
            {
                // End:0x928
                if(items[Item].ImageParts[iTemp] != none)
                {
                    X1 = X + (PartsIconX * C.ClipX);
                    X2 = PartsIconWidth * C.ClipX;
                    Y1 = Y + ((PartsIconY + (PartsIconGapY * float(iTemp))) * C.ClipY);
                    Y2 = PartsIconHeight * C.ClipY;
                    C.SetPos(X1, Y1);
                    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                    C.DrawTile(items[Item].ImageParts[iTemp], X2, Y2, 0.0000000, 0.0000000, float(items[Item].ImageParts[iTemp].MaterialUSize()), float(items[Item].ImageParts[iTemp].MaterialVSize()));
                    // [Explicit Continue]
                    goto J0x92B;
                }
                // [Explicit Break]
                goto J0x935;
                J0x92B:

                iTemp++;
                // [Loop Continue]
                goto J0x7AF;
            }
        }
    }
    J0x935:

    //return;    
}

function AddItem(Material Image, Object Tag, bool Selectible, optional string strText)
{
    local Item newTem;
    local wPartsGroupParam PartsParam;
    local wItemResourceParam resParam;
    local wGameManager GameMgr;
    local int iTemp;

    newTem.Image = Image;
    newTem.Tag = Tag;
    newTem.Selectible = Selectible;
    newTem.ImageParts[0] = none;
    newTem.ImageParts[1] = none;
    iTemp = 0;
    // End:0x210
    if((BTInventoryItem(newTem.Tag) != none) && BTInventoryItem(newTem.Tag).PartsID > 0)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        PartsParam = GameMgr.GetAddPartsGroupParam(BTInventoryItem(newTem.Tag).PartsID);
        // End:0x17B
        if(PartsParam.iSightID > 0)
        {
            resParam = GameMgr.GetItemResourceParam(PartsParam.iSightID);
            // End:0x17B
            if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
            {
                newTem.ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
            }
        }
        // End:0x210
        if(PartsParam.iSilencerID > 0)
        {
            resParam = GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
            // End:0x210
            if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
            {
                newTem.ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
            }
        }
    }
    items[items.Length] = newTem;
    ImageList.Add(Image, items.Length - 1);
    //return;    
}

function ClearItem()
{
    items.Remove(0, items.Length);
    ImageList.Clear();
    //return;    
}

function RefreshItem(int iItemID, BtrDouble iUniqueID, int iPartsGroupID)
{
    local int iTemp, i;
    local wPartsGroupParam PartsParam;
    local wItemResourceParam resParam;
    local wGameManager GameMgr;

    i = 0;
    J0x07:

    // End:0x287 [Loop If]
    if(i < items.Length)
    {
        // End:0x27D
        if(((BTInventoryItem(items[i].Tag) != none) && BTInventoryItem(items[i].Tag).ItemID == iItemID) && __NFUN_912__(BTInventoryItem(items[i].Tag).UniqueID, iUniqueID))
        {
            BTInventoryItem(items[i].Tag).PartsID = iPartsGroupID;
            items[i].ImageParts[0] = none;
            items[i].ImageParts[1] = none;
            iTemp = 0;
            // End:0x27D
            if(iPartsGroupID > 0)
            {
                GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
                PartsParam = GameMgr.GetAddPartsGroupParam(BTInventoryItem(items[i].Tag).PartsID);
                // End:0x1E2
                if(PartsParam.iSightID > 0)
                {
                    resParam = GameMgr.GetItemResourceParam(PartsParam.iSightID);
                    // End:0x1E2
                    if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
                    {
                        items[i].ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
                    }
                }
                // End:0x27D
                if(PartsParam.iSilencerID > 0)
                {
                    resParam = GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
                    // End:0x27D
                    if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
                    {
                        items[i].ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
                    }
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RefreshItemDurability(int iItemID, BtrDouble iUniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xB5 [Loop If]
    if(i < items.Length)
    {
        // End:0xAB
        if(((BTInventoryItem(items[i].Tag) != none) && BTInventoryItem(items[i].Tag).ItemID == iItemID) && __NFUN_912__(BTInventoryItem(items[i].Tag).UniqueID, iUniqueID))
        {
            BTInventoryItem(items[i].Tag).Durability = 100000;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RefreshSelectedItem(int iItemID, BtrDouble iUniqueID, int iPartsID)
{
    local int iIndex, iTemp;
    local wPartsGroupParam PartsParam;
    local wItemResourceParam resParam;
    local wGameManager GameMgr;

    iIndex = GetSelectedIndex();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0xBE
    if(BTInventoryItem(items[iIndex].Tag).ItemID != iItemID)
    {
        items[iIndex].Image = none;
        resParam = GameMgr.GetItemResourceParam(iItemID);
        items[iIndex].Image = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
    }
    BTInventoryItem(items[iIndex].Tag).ItemID = iItemID;
    BTInventoryItem(items[iIndex].Tag).UniqueID = iUniqueID;
    // End:0x2B8
    if(BTInventoryItem(items[iIndex].Tag).PartsID != iPartsID)
    {
        items[iIndex].ImageParts[0] = none;
        items[iIndex].ImageParts[1] = none;
        iTemp = 0;
        // End:0x2B8
        if(iPartsID > 0)
        {
            PartsParam = GameMgr.GetAddPartsGroupParam(iPartsID);
            // End:0x21D
            if(PartsParam.iSightID > 0)
            {
                resParam = GameMgr.GetItemResourceParam(PartsParam.iSightID);
                // End:0x21D
                if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
                {
                    items[iIndex].ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
                }
            }
            // End:0x2B8
            if(PartsParam.iSilencerID > 0)
            {
                resParam = GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
                // End:0x2B8
                if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
                {
                    items[iIndex].ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
                }
            }
        }
    }
    BTInventoryItem(items[iIndex].Tag).PartsID = iPartsID;
    //return;    
}

function int GetSelectedIndex()
{
    return ImageList.Index;
    //return;    
}

function Item GetSelectedItem()
{
    return items[GetSelectedIndex()];
    //return;    
}

function bool HasSelectedItem()
{
    return ImageList.IsValidIndex(GetSelectedIndex());
    //return;    
}

function ImageListBox_OnChange(GUIComponent Sender)
{
    OnChange(self);
    //return;    
}

function bool ImageListBox_OnItemDblClick(GUIComponent Sender)
{
    return true;
    //return;    
}

defaultproperties
{
    bBoundToParent=true
    bScaleToParent=true
}