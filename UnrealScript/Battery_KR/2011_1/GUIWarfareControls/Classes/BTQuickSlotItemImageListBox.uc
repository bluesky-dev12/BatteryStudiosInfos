class BTQuickSlotItemImageListBox extends BTItemImageListBox
    editinlinenew
    instanced;

var float ImageGapX;
var float ImageGapY1;
var float ImageGapY2;

function InitializeImageListBox()
{
    ImageListBox.SetScrollBarStyle(true, new Class'GUIWarfareStyles.STY2WarfareScrollZone', true, new Class'GUIWarfareStyles.STY2WarfareScrollIncreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollDecreaseButton', true, none, true, new Class'GUIWarfareStyles.STY2WarfareScrollGripButton');
    ImageList = ImageListBox.List;
    ImageList.__OnIsSelectibleIndex__Delegate = InternalOnIsSelectibleIndex;
    ImageList.__OnDrawItem__Delegate = ImageListBox_OnDrawItem;
    ImageList.__OnChange__Delegate = ImageListBox_OnChange;
    ImageList.CallDrawItemForPlaceHoldingItemsInFixedCountCellStyle = true;
    ImageList.__OnItemDblClick__Delegate = ImageListBox_OnItemDblClick;
    ImageList.bAllowEmptyItems = true;
    //return;    
}

function bool InternalOnIsSelectibleIndex(GUIComponent Sender, int Index)
{
    return items[Index].Selectible;
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
    newTem.strEtcs = strText;
    newTem.ImageParts[0] = none;
    newTem.ImageParts[1] = none;
    newTem.Selectible = Selectible;
    iTemp = 0;
    // End:0x220
    if((BTInventoryItem(newTem.Tag) != none) && BTInventoryItem(newTem.Tag).PartsID > 0)
    {
        GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
        PartsParam = GameMgr.GetAddPartsGroupParam(BTInventoryItem(newTem.Tag).PartsID);
        // End:0x18B
        if(PartsParam.iSightID > 0)
        {
            resParam = GameMgr.GetItemResourceParam(PartsParam.iSightID);
            // End:0x18B
            if((resParam.strRes_Icon != "") && resParam.strRes_Icon != "-")
            {
                newTem.ImageParts[iTemp++] = Material(DynamicLoadObject(resParam.strRes_Icon, Class'Engine.Material'));
            }
        }
        // End:0x220
        if(PartsParam.iSilencerID > 0)
        {
            resParam = GameMgr.GetItemResourceParam(PartsParam.iSilencerID);
            // End:0x220
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
    itemFontSize = ItemNameFontSize * C.ClipY;
    X1 = X;
    X2 = X + W;
    Y1 = Y;
    Y2 = (Y + itemFontSize) + ((float(4) * ItemNameMargin) * C.ClipY);
    C.BtrDrawTextJustified(items[Item].strEtcs, 1, X1, Y1, X2, Y2, int(itemFontSize));
    // End:0x972
    if(Item < ImageList.ItemCount)
    {
        // End:0x972
        if(BTInventoryItem(items[Item].Tag) != none)
        {
            // End:0x404
            if(bSelected)
            {
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));                
            }
            else
            {
                C.DrawColor = C.MakeColor(160, 160, 160, byte(255));
            }
            // End:0x663
            if(items[Item].Image != none)
            {
                // End:0x53A
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
                    X1 = X - (ImageGapX * C.ClipX);
                    Y1 = Y + (ImageGapY1 * C.ClipY);
                    X2 = W + ((float(2) * ImageGapX) * C.ClipX);
                    Y2 = (HT - (ImageGapY1 * C.ClipY)) - (ImageGapY2 * C.ClipY);
                    C.SetPos(X1, Y1);
                    C.DrawTile(items[Item].Image, X2, Y2, 0.0000000, 0.0000000, float(items[Item].Image.MaterialUSize()), float(items[Item].Image.MaterialVSize()));
                }
            }
            X1 = X + ((1.5000000 * ItemNameMargin) * C.ClipX);
            X2 = (X + W) - (ItemNameMargin * C.ClipX);
            Y1 = Y + (itemFontSize * float(2));
            Y2 = (Y1 + itemFontSize) + ((float(4) * ItemNameMargin) * C.ClipY);
            // End:0x735
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
            iTemp = 0;
            J0x7EC:

            // End:0x972 [Loop If]
            if(iTemp < 2)
            {
                // End:0x965
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
                    goto J0x968;
                }
                // [Explicit Break]
                goto J0x972;
                J0x968:

                iTemp++;
                // [Loop Continue]
                goto J0x7EC;
            }
        }
    }
    J0x972:

    //return;    
}

defaultproperties
{
    ImageGapX=0.0205078
    ImageGapY1=0.0338542
    ImageGapY2=0.0299479
    PartsIconY=0.0299479
    SkillOffsetX=0.0742188
    SkillOffsetY=0.0351562
    SkillWidth=0.0605469
    SkillHeight=0.0807292
}