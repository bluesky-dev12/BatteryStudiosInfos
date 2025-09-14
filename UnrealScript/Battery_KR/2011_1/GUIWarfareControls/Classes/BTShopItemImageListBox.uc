class BTShopItemImageListBox extends BTItemImageListBox
    editinlinenew
    instanced;

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

function AddItem(Material Image, Object Tag, bool Selectible, optional string strText)
{
    local Item newTem;

    newTem.Image = Image;
    newTem.Tag = Tag;
    newTem.Selectible = Selectible;
    items[items.Length] = newTem;
    ImageList.Add(Image, items.Length - 1);
    //return;    
}

function ImageListBox_OnDrawItem(Canvas C, int Item, float X, float Y, float W, float HT, bool bSelected, bool bPending)
{
    local float X1, Y1, X2, Y2, itemFontSize;

    local wGameManager GameMgr;
    local wItemBaseParam tmParam;

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
    // End:0x66A
    if(Item < ImageList.ItemCount)
    {
        C.SetPos(X, Y);
        // End:0x354
        if(bSelected)
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));            
        }
        else
        {
            C.DrawColor = C.MakeColor(160, 160, 160, byte(255));
        }
        C.DrawTile(items[Item].Image, W, HT, 0.0000000, 0.0000000, float(items[Item].Image.MaterialUSize()), float(items[Item].Image.MaterialVSize()));
        // End:0x66A
        if(BTInventoryItem(items[Item].Tag) != none)
        {
            itemFontSize = ItemNameFontSize * C.ClipY;
            X1 = X + ((float(2) * ItemNameMargin) * C.ClipX);
            X2 = (X + W) - (ItemNameMargin * C.ClipX);
            Y1 = Y;
            Y2 = (Y + itemFontSize) + ((float(4) * ItemNameMargin) * C.ClipY);
            // End:0x4E1
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
            X1 = X + ((float(2) * ItemNameMargin) * C.ClipX);
            X2 = (X + W) - (ItemNameMargin * C.ClipX);
            Y1 = Y;
            Y2 = (Y + (HT * float(2))) - ((float(2) * ItemNameFontSize) * C.ClipY);
            C.BtrDrawTextJustified(string(tmParam.iPointPrice[0]) $ " Point", 2, X1, Y1, X2, Y2, int(itemFontSize));
        }
    }
    //return;    
}
