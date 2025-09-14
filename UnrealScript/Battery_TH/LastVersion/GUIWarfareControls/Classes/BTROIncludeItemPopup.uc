class BTROIncludeItemPopup extends RenderObject;

const MaxItemCount = 10;

var FloatBox fbFixBackGround;
var FloatBox fbFixTitle;
var FloatBox fbFixItemName;
var FloatBox fbFixBestItem;
var FloatBox fbFixItemImage;
var FloatBox fbFixItemDescStart;
var Image BackgroundImage;
var Image ItemImage;
var Text Title;
var Text ItemName;
var Text bestItem[10];
var Text ItemDesc[10];
var wItemBaseParam CurrentItemParam;
var int CurrentItemID;
var int IncludeItemCount;
var BTROItemBoxHK tempROItem;
var FloatBox LimitPos;
var localized string strTitle;
var localized string strBestItem;

function Init()
{
    local int i;

    BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_BGDeco_Popup_MouseOver;
    Title = Class'Engine.BTCustomDrawHK'.static.MakeText(11, 4, strTitle);
    ItemName.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(11, 4, "");
    ItemName.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon();
    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(int(fbFixItemImage.X2 - fbFixItemImage.X1), int(fbFixItemImage.Y2 - fbFixItemImage.Y1), 4, none);
    i = 0;
    J0xD0:

    // End:0x14B [Loop If]
    if(i < 10)
    {
        bestItem[i] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 5, strBestItem);
        bestItem[i].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon();
        ItemDesc[i] = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, "");
        ++i;
        // [Loop Continue]
        goto J0xD0;
    }
    tempROItem = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    tempROItem.Init();
    tempROItem.instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    //return;    
}

function SetDefaultLimitPos(GUIController Controller)
{
    LimitPos.X1 = 0.0000000;
    LimitPos.X2 = float(Controller.ResX);
    LimitPos.Y1 = 0.0000000;
    LimitPos.Y2 = float(Controller.ResY);
    //return;    
}

function SetBoxData(int ItemIndex, wGameManager GameMgr)
{
    // End:0x17
    if(!SetMainData(ItemIndex, GameMgr))
    {
        return;
    }
    // End:0x70
    if(GameMgr.CheckRandBoxItem(int(CurrentItemParam.eType)) || GameMgr.CheckCapsuleItem(int(CurrentItemParam.eType)))
    {
        SetDataRandbox(ItemIndex, GameMgr);        
    }
    else
    {
        SetDataItembox(ItemIndex, GameMgr);
    }
    //return;    
}

private function SetDataItembox(int ItemIndex, wGameManager GameMgr)
{
    local int i, k, itemBoxCount;
    local array<int> ItemIDs, PartIDs, BestItemIDs;

    itemBoxCount = GameMgr.GetItemBoxItemsCount(ItemIndex);
    i = 0;
    J0x21:

    // End:0xDB [Loop If]
    if(i < itemBoxCount)
    {
        GameMgr.GetItemBoxItems(ItemIndex, i + 1, ItemIDs, PartIDs, BestItemIDs);
        k = 0;
        J0x62:

        // End:0xC2 [Loop If]
        if(k < ItemIDs.Length)
        {
            AddItemData(ItemIDs[k], PartIDs[k], IsBestItem(ItemIDs[k], BestItemIDs), GameMgr);
            // End:0xB8
            if(IncludeItemCount >= 10)
            {
                // [Explicit Break]
                goto J0xC2;
            }
            k++;
            // [Loop Continue]
            goto J0x62;
        }
        J0xC2:

        // End:0xD1
        if(IncludeItemCount >= 10)
        {
            // [Explicit Break]
            goto J0xDB;
        }
        i++;
        // [Loop Continue]
        goto J0x21;
    }
    J0xDB:

    //return;    
}

private function SetDataRandbox(int ItemIndex, wGameManager GameMgr)
{
    local int i, k, randBoxCount;
    local array<int> ItemIDs, PartIDs, BestItemIDs;

    randBoxCount = GameMgr.GetRandBoxItemsCount(ItemIndex);
    i = 0;
    J0x21:

    // End:0xDB [Loop If]
    if(i < randBoxCount)
    {
        GameMgr.GetRandBoxItems(ItemIndex, i + 1, ItemIDs, PartIDs, BestItemIDs);
        k = 0;
        J0x62:

        // End:0xC2 [Loop If]
        if(k < ItemIDs.Length)
        {
            AddItemData(ItemIDs[k], PartIDs[k], IsBestItem(ItemIDs[k], BestItemIDs), GameMgr);
            // End:0xB8
            if(IncludeItemCount >= 10)
            {
                // [Explicit Break]
                goto J0xC2;
            }
            k++;
            // [Loop Continue]
            goto J0x62;
        }
        J0xC2:

        // End:0xD1
        if(IncludeItemCount >= 10)
        {
            // [Explicit Break]
            goto J0xDB;
        }
        i++;
        // [Loop Continue]
        goto J0x21;
    }
    J0xDB:

    //return;    
}

function SetDataGP20Package(int ItemIndex, wGameManager GameMgr)
{
    local int i, PartID, findResult;
    local wItemBoxHK productInfo;
    local wGP20Product gp20Product;

    // End:0x17
    if(!SetMainData(ItemIndex, GameMgr))
    {
        return;
    }
    gp20Product = GameMgr.GetGP20ProductFromCode(ItemIndex, findResult);
    // End:0x133
    if(findResult == 1)
    {
        i = 0;
        J0x48:

        // End:0x133 [Loop If]
        if(i < gp20Product.PackageInfo.ProductsCodeList.Length)
        {
            productInfo = GameMgr.FindUIItem(gp20Product.PackageInfo.ProductsCodeList[i]);
            PartID = productInfo.GetPartIDValue(gp20Product.PackageInfo.ProductsHourList[i], gp20Product.PackageInfo.ProductsQuantityList[i], 0);
            AddItemData(gp20Product.PackageInfo.ProductsCodeList[i], PartID, false, GameMgr);
            // End:0x129
            if(IncludeItemCount >= 10)
            {
                // [Explicit Break]
                goto J0x133;
            }
            i++;
            // [Loop Continue]
            goto J0x48;
        }
    }
    J0x133:

    //return;    
}

private function bool SetMainData(int ItemIndex, wGameManager GameMgr)
{
    local wItemBoxHK ItemInfo;

    // End:0x11
    if(ItemIndex == CurrentItemID)
    {
        return false;
    }
    CurrentItemID = ItemIndex;
    IncludeItemCount = 0;
    CurrentItemParam = GameMgr.GetItemParam(ItemIndex);
    // End:0x4A
    if(CurrentItemParam == none)
    {
        return false;
    }
    ItemName.Text = CurrentItemParam.strDisplayName;
    ItemInfo = GameMgr.FindUIItem(ItemIndex);
    // End:0xA4
    if(ItemInfo != none)
    {
        ItemImage.Image = ItemInfo.ItemImage;        
    }
    else
    {
        ItemImage.Image = none;
    }
    return true;
    //return;    
}

function AddItemData(int AddItemIndex, int AddPartID, bool isBest, wGameManager GameMgr)
{
    local string ItemExtra;
    local Color itemNameColor;

    tempROItem.ItemInfo = GameMgr.FindUIItem(AddItemIndex);
    // End:0x167
    if(tempROItem.ItemInfo != none)
    {
        tempROItem.instanceInfo.SetExtraValue(tempROItem.ItemInfo, AddPartID);
        tempROItem.GetExtraItemString(ItemExtra, itemNameColor);
        // End:0xC3
        if(ItemExtra != "")
        {
            ItemDesc[IncludeItemCount].Text = ((tempROItem.ItemInfo.ItemName @ "(") $ ItemExtra) $ ")";            
        }
        else
        {
            ItemDesc[IncludeItemCount].Text = tempROItem.ItemInfo.ItemName;
        }
        // End:0x122
        if(isBest)
        {
            bestItem[IncludeItemCount].Text = strBestItem;
            itemNameColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon();            
        }
        else
        {
            bestItem[IncludeItemCount].Text = "";
            itemNameColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
        }
        ItemDesc[IncludeItemCount].DrawColor = itemNameColor;
        ++IncludeItemCount;
    }
    //return;    
}

function SetPivotPos(FloatBox pivotBox)
{
    local int CenterX, CenterY;

    CenterX = int(LimitPos.X2 - LimitPos.X1) / 2;
    CenterY = int(LimitPos.Y2 - LimitPos.Y1) / 2;
    // End:0xFB
    if(Abs(pivotBox.X1 - float(CenterX)) < Abs(pivotBox.X2 - float(CenterX)))
    {
        AWinPos.X2 = pivotBox.X1;
        AWinPos.X1 = AWinPos.X2 - fbFixBackGround.X2;
        // End:0xF8
        if(AWinPos.X1 < LimitPos.X1)
        {
            AWinPos.X1 = LimitPos.X1;
            AWinPos.X2 = LimitPos.X1 + fbFixBackGround.X2;
        }        
    }
    else
    {
        AWinPos.X1 = pivotBox.X2;
        AWinPos.X2 = AWinPos.X1 + fbFixBackGround.X2;
        // End:0x180
        if(AWinPos.X2 > LimitPos.X2)
        {
            AWinPos.X2 = LimitPos.X2;
            AWinPos.X1 = AWinPos.X2 - fbFixBackGround.X2;
        }
    }
    // End:0x237
    if(Abs(pivotBox.Y1 - float(CenterY)) < Abs(pivotBox.Y2 - float(CenterY)))
    {
        AWinPos.Y2 = pivotBox.Y1;
        AWinPos.Y1 = AWinPos.Y2 - fbFixBackGround.Y2;
        // End:0x234
        if(AWinPos.Y1 < LimitPos.Y1)
        {
            AWinPos.Y1 = LimitPos.Y1;
            AWinPos.Y2 = LimitPos.Y1 + fbFixBackGround.Y2;
        }        
    }
    else
    {
        AWinPos.Y1 = pivotBox.Y2;
        AWinPos.Y2 = AWinPos.Y1 + fbFixBackGround.Y2;
        // End:0x2BC
        if(AWinPos.Y2 > LimitPos.Y2)
        {
            AWinPos.Y2 = LimitPos.Y2;
            AWinPos.Y1 = AWinPos.Y2 - fbFixBackGround.Y2;
        }
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

function bool Render(Canvas C, optional float Delta)
{
    local int i;
    local FloatBox fbFixed, fbBestItemStart, fbIncludeItemStart;

    // End:0x0D
    if(IncludeItemCount == 0)
    {
        return false;
    }
    // End:0x24
    if(!super.Render(C, Delta))
    {
        return false;
    }
    fbFixed = AddFloatBox(int(AWinPos.X1), int(AWinPos.Y1), fbFixBackGround);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, fbFixed.X1, fbFixed.Y1, fbFixed.X2, fbFixed.Y2);
    fbFixed = AddFloatBox(int(AWinPos.X1), int(AWinPos.Y1), fbFixTitle);
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, Title, fbFixed.X1, fbFixed.Y1, fbFixed.X2, fbFixed.Y2);
    fbFixed = AddFloatBox(int(AWinPos.X1), int(AWinPos.Y1), fbFixItemName);
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, ItemName, fbFixed.X1, fbFixed.Y1, fbFixed.X2, fbFixed.Y2);
    // End:0x1DC
    if(ItemImage.Image != none)
    {
        fbFixed = AddFloatBox(int(AWinPos.X1), int(AWinPos.Y1), fbFixItemImage);
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, ItemImage, fbFixed.X1, fbFixed.Y1, fbFixed.X2, fbFixed.Y2);
    }
    fbBestItemStart = AddFloatBox(int(AWinPos.X1), int(AWinPos.Y1), fbFixBestItem);
    fbIncludeItemStart = AddFloatBox(int(AWinPos.X1), int(AWinPos.Y1), fbFixItemDescStart);
    i = 0;
    J0x235:

    // End:0x32B [Loop If]
    if(i < IncludeItemCount)
    {
        fbFixed = FloatBoxOffsetY(fbBestItemStart, float(i * 29));
        // End:0x2BE
        if(bestItem[i].Text != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawText(C, bestItem[i], fbFixed.X1, fbFixed.Y1, fbFixed.X2, fbFixed.Y2);
        }
        fbFixed = FloatBoxOffsetY(fbIncludeItemStart, float(i * 29));
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, ItemDesc[i], fbFixed.X1, fbFixed.Y1, fbFixed.X2, fbFixed.Y2);
        ++i;
        // [Loop Continue]
        goto J0x235;
    }
    return true;
    //return;    
}

defaultproperties
{
    fbFixBackGround=(X1=0.0000000,Y1=0.0000000,X2=424.0000000,Y2=458.0000000)
    fbFixTitle=(X1=103.0000000,Y1=6.0000000,X2=321.0000000,Y2=21.0000000)
    fbFixItemName=(X1=63.0000000,Y1=37.0000000,X2=361.0000000,Y2=52.0000000)
    fbFixBestItem=(X1=6.0000000,Y1=157.0000000,X2=87.0000000,Y2=170.0000000)
    fbFixItemImage=(X1=136.0000000,Y1=62.0000000,X2=289.0000000,Y2=126.0000000)
    fbFixItemDescStart=(X1=112.0000000,Y1=157.0000000,X2=393.0000000,Y2=170.0000000)
    strTitle="???????????"
    strBestItem="Best!"
}