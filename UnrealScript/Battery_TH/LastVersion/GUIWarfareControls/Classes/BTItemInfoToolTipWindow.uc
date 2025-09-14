class BTItemInfoToolTipWindow extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK BackgroundImg;
var export editinline BTOwnerDrawImageHK Title;
var export editinline BTOwnerDrawImageHK RewardItemImage;
var export editinline BTOwnerDrawImageHK ItemName;
var export editinline BTOwnerDrawImageHK strBEST[10];
var export editinline BTOwnerDrawImageHK contents[10];
var localized string strPopUp[10];
var BTROItemBoxHK tempROItem;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb.X1 = 300.0000000;
    fb.Y1 = 116.0000000;
    fb.X2 = 724.0000000;
    fb.Y2 = 574.0000000;
    BackgroundImg = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BGDeco_Popup_MouseOver, 0.9000000);
    fb.X1 = 436.0000000;
    fb.Y1 = 178.0000000;
    fb.X2 = 589.0000000;
    fb.Y2 = 242.0000000;
    RewardItemImage = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.9000000);
    fb.X1 = 403.0000000;
    fb.Y1 = 122.0000000;
    fb.X2 = 621.0000000;
    fb.Y2 = 137.0000000;
    Title = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.9000000);
    Title.CaptionDrawType = 4;
    Title.SetFontSizeAll(11);
    Title.Caption = strPopUp[0];
    fb.X1 = 363.0000000;
    fb.Y1 = 153.0000000;
    fb.X2 = 661.0000000;
    fb.Y2 = 168.0000000;
    ItemName = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.9000000);
    ItemName.CaptionDrawType = 4;
    ItemName.FontColor[0].R = byte(255);
    ItemName.FontColor[0].G = 204;
    ItemName.FontColor[0].B = 0;
    ItemName.FontColor[0].A = byte(255);
    ItemName.SetFontSizeAll(11);
    i = 0;
    J0x265:

    // End:0x545 [Loop If]
    if(i < 10)
    {
        fb.X1 = 412.0000000;
        fb.Y1 = 273.0000000 + float(i * 29);
        fb.X2 = 693.0000000;
        fb.Y2 = 286.0000000 + float(i * 29);
        contents[i] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.9000000);
        contents[i].CaptionDrawType = 3;
        // End:0x376
        if(i == 0)
        {
            contents[i].FontColor[0].R = byte(255);
            contents[i].FontColor[0].G = 204;
            contents[i].FontColor[0].B = 0;            
        }
        else
        {
            contents[i].FontColor[0].R = byte(255);
            contents[i].FontColor[0].G = byte(255);
            contents[i].FontColor[0].B = byte(255);
        }
        contents[i].FontColor[0].A = byte(255);
        contents[i].SetFontSizeAll(9);
        fb.X1 = 306.0000000;
        fb.Y1 = 273.0000000 + float(i * 29);
        fb.X2 = 387.0000000;
        fb.Y2 = 286.0000000 + float(i * 29);
        strBEST[i] = NewLabelComponent(fb, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty, 0.9000000);
        strBEST[i].CaptionDrawType = 5;
        strBEST[i].FontColor[0].R = byte(255);
        strBEST[i].FontColor[0].G = 204;
        strBEST[i].FontColor[0].B = 0;
        strBEST[i].FontColor[0].A = byte(255);
        strBEST[i].SetFontSizeAll(11);
        i++;
        // [Loop Continue]
        goto J0x265;
    }
    SetVisibleControl(false);
    tempROItem = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    tempROItem.Init();
    tempROItem.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    //return;    
}

function FillCapsuleItemList(int nItemID)
{
    local int i, k, randBoxCount, IncludeItemCount, nOffset;

    local array<int> ItemIDs, PartIDs, BestItemIDs;
    local wItemBoxHK includeItemInfo, ItemInfo;
    local string ItemExtra;
    local Color itemNameColor;
    local wMatchMaker MM;
    local array<string> strBestItemList, strNormalItemList;
    local wGameManager GameMgr;
    local Image ItemImage;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    IncludeItemCount = 0;
    ItemInfo = GameMgr.FindUIItem(nItemID);
    ItemName.Caption = ItemInfo.ItemName;
    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(153, 64, 1, none);
    ItemImage.Image = ItemInfo.ItemImage;
    RewardItemImage.BackgroundImage = ItemImage;
    // End:0x13A
    if((ItemInfo.ItemType == 32) || GameMgr.CheckCapsuleItem(ItemInfo.ItemType))
    {
        randBoxCount = GameMgr.GetRandBoxItemsCount(nItemID);        
    }
    else
    {
        // End:0x16C
        if(ItemInfo.ItemType == 30)
        {
            randBoxCount = GameMgr.GetItemBoxItemsCount(nItemID);            
        }
        else
        {
            SetVisibleControl(false);
        }
    }
    strBestItemList.Length = 0;
    strNormalItemList.Length = 0;
    i = 0;
    J0x18A:

    // End:0x1B7 [Loop If]
    if(i < 10)
    {
        contents[i].Caption = "";
        i++;
        // [Loop Continue]
        goto J0x18A;
    }
    i = 0;
    J0x1BE:

    // End:0x1EB [Loop If]
    if(i < 10)
    {
        strBEST[i].Caption = "";
        i++;
        // [Loop Continue]
        goto J0x1BE;
    }
    i = 0;
    J0x1F2:

    // End:0x483 [Loop If]
    if(i < randBoxCount)
    {
        // End:0x266
        if((ItemInfo.ItemType == 32) || GameMgr.CheckCapsuleItem(ItemInfo.ItemType))
        {
            GameMgr.GetRandBoxItems(nItemID, i + 1, ItemIDs, PartIDs, BestItemIDs);            
        }
        else
        {
            // End:0x2A6
            if(ItemInfo.ItemType == 30)
            {
                GameMgr.GetItemBoxItems(nItemID, i + 1, ItemIDs, PartIDs, BestItemIDs);
            }
        }
        k = 0;
        J0x2AD:

        // End:0x46A [Loop If]
        if(k < ItemIDs.Length)
        {
            includeItemInfo = GameMgr.FindUIItem(ItemIDs[k]);
            // End:0x460
            if(includeItemInfo != none)
            {
                tempROItem.ItemInfo = GameMgr.FindUIItem(ItemIDs[k]);
                tempROItem.instanceInfo.SetExtraValue(tempROItem.ItemInfo, PartIDs[k]);
                tempROItem.GetExtraItemString(ItemExtra, itemNameColor);
                // End:0x3E2
                if(IsBestItem(includeItemInfo.ItemID, BestItemIDs))
                {
                    // End:0x3BB
                    if(ItemExtra != "")
                    {
                        strBestItemList[strBestItemList.Length] = ((tempROItem.ItemInfo.ItemName @ "(") $ ItemExtra) $ ")";                        
                    }
                    else
                    {
                        strBestItemList[strBestItemList.Length] = tempROItem.ItemInfo.ItemName;
                    }                    
                }
                else
                {
                    // End:0x426
                    if(ItemExtra != "")
                    {
                        strNormalItemList[strNormalItemList.Length] = ((tempROItem.ItemInfo.ItemName @ "(") $ ItemExtra) $ ")";                        
                    }
                    else
                    {
                        strNormalItemList[strNormalItemList.Length] = tempROItem.ItemInfo.ItemName;
                    }
                }
                ++IncludeItemCount;
                // End:0x460
                if(IncludeItemCount >= 10)
                {
                    // [Explicit Break]
                    goto J0x46A;
                }
            }
            k++;
            // [Loop Continue]
            goto J0x2AD;
        }
        J0x46A:

        // End:0x479
        if(IncludeItemCount >= 10)
        {
            // [Explicit Break]
            goto J0x483;
        }
        i++;
        // [Loop Continue]
        goto J0x1F2;
    }
    J0x483:

    nOffset = 0;
    i = 0;
    J0x491:

    // End:0x54A [Loop If]
    if(i < strBestItemList.Length)
    {
        contents[nOffset].Caption = strBestItemList[i];
        contents[nOffset].FontColor[0].R = byte(255);
        contents[nOffset].FontColor[0].G = 204;
        contents[nOffset].FontColor[0].B = 0;
        strBEST[i].Caption = strPopUp[1];
        nOffset++;
        i++;
        // [Loop Continue]
        goto J0x491;
    }
    i = 0;
    J0x551:

    // End:0x5F2 [Loop If]
    if(i < strNormalItemList.Length)
    {
        contents[nOffset].Caption = strNormalItemList[i];
        contents[nOffset].FontColor[0].R = byte(255);
        contents[nOffset].FontColor[0].G = byte(255);
        contents[nOffset].FontColor[0].B = byte(255);
        nOffset++;
        i++;
        // [Loop Continue]
        goto J0x551;
    }
    //return;    
}

function SetVisibleControl(bool IsVisible)
{
    local int i;

    BackgroundImg.bVisible = IsVisible;
    Title.bVisible = IsVisible;
    RewardItemImage.bVisible = IsVisible;
    ItemName.bVisible = IsVisible;
    i = 0;
    J0x5F:

    // End:0xAD [Loop If]
    if(i < 10)
    {
        strBEST[i].bVisible = IsVisible;
        contents[i].bVisible = IsVisible;
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    //return;    
}

function bool IsBestItem(int checkItemID, array<int> BestItemIDs)
{
    local int i;
    local bool bBestItem;

    bBestItem = false;
    i = 0;
    J0x0F:

    // End:0x49 [Loop If]
    if(i < BestItemIDs.Length)
    {
        // End:0x3F
        if(checkItemID == BestItemIDs[i])
        {
            bBestItem = true;
            // [Explicit Break]
            goto J0x49;
        }
        ++i;
        // [Loop Continue]
        goto J0x0F;
    }
    J0x49:

    return bBestItem;
    //return;    
}

function SetVisibleGroup(bool bVisible)
{
    SetVisibleControl(bVisible);
    //return;    
}

defaultproperties
{
    strPopUp[0]="Capsule Item"
    strPopUp[1]="BEST"
}