class BTROCapsuleTitle extends RenderObject;

const FontSize = 9;

var float TextWidth;
var float TextHeight;
var wItemBoxHK ItemInfo;
var wItemBoxCashHK cashItemInfo;
var Text CapsuleName;
var Text CapsulePrice;
var Text CapsuleOriginPrice;
var Image NewItemImage;
var Image DiscountItemImage;
var Image NormalImgage;
var Image MouseOnImgage;
var Image SelectImgage;
var Image DisableImgage;
var Image DisCountStrikeImg;
var bool IsDiscount;
var bool bLimitLevel;
var Image NotUseImage;
var Image EquipLevelImage;

function Initialize(wItemBoxHK setItemInfo)
{
    ItemInfo = setItemInfo;
    CapsuleName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, ItemInfo.ItemName);
    CapsuleName.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN();
    NewItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CapsuleList_new;
    DiscountItemImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CapsuleList_Discount;
    NormalImgage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CapsuleList_n;
    MouseOnImgage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CapsuleList_on;
    SelectImgage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CapsuleList_click;
    DisableImgage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CapsuleList_diable;
    DisCountStrikeImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_DisCountLine;
    NotUseImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non;
    RefreshPrice();
    //return;    
}

function RefreshPrice()
{
    IsDiscount = false;
    // End:0xF4
    if(ItemInfo.IsCashItem() && cashItemInfo != none)
    {
        CapsulePrice = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 5, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(cashItemInfo.WZCashPrice[0]))));
        // End:0xF1
        if(cashItemInfo.IsDiscount)
        {
            IsDiscount = true;
            CapsuleOriginPrice = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 5, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(126, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(cashItemInfo.WZOriginalCashPrice[0]))));
            CapsuleOriginPrice.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN();
        }        
    }
    else
    {
        CapsulePrice = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 5, Class'GUIWarfareControls_Decompressed.BTWindowDefineInfoHK'.static.GetFormatString(125, Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.PointPrice[0]))));
    }
    CapsulePrice.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN();
    //return;    
}

function CheckLimitLevel(wGameManager GameMgr, int myLevel)
{
    // End:0x6C
    if(myLevel < ItemInfo.EquipLevel)
    {
        bLimitLevel = true;
        EquipLevelImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 28, ItemInfo.EquipLevelImage);
        GameMgr.GetLevelImage(ItemInfo.EquipLevel, 0, EquipLevelImage);
    }
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local float stringX, stringY, limitLevelX, limitLevelSize;
    local Image addedImage;

    // End:0x13
    if(super.Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    // End:0x71
    if(bMouseOn)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, MouseOnImgage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);        
    }
    else
    {
        // End:0xBE
        if(bFocused)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SelectImgage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, NormalImgage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, CapsuleName, AWinPos.X1 + float(19), AWinPos.Y1 + float(20), AWinPos.X1 + float(192), AWinPos.Y1 + float(33));
    // End:0x16F
    if(IsDiscount)
    {
        addedImage = DiscountItemImage;        
    }
    else
    {
        // End:0x18F
        if(ItemInfo.AdType == 3)
        {
            addedImage = NewItemImage;
        }
    }
    C.BtrTextSize(ItemInfo.ItemName, 9, TextWidth, TextHeight);
    // End:0x27F
    if(addedImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, addedImage, ((AWinPos.X1 + float(19)) + float(5)) + TextWidth, AWinPos.Y1 + float(19), (((AWinPos.X1 + float(19)) + float(5)) + TextWidth) + NewItemImage.width, AWinPos.Y1 + float(34));
        limitLevelX = ((((AWinPos.X1 + float(19)) + float(5)) + TextWidth) + NewItemImage.width) + float(5);        
    }
    else
    {
        limitLevelX = ((AWinPos.X1 + float(19)) + float(5)) + TextWidth;
    }
    // End:0x400
    if(IsDiscount)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, CapsulePrice, AWinPos.X1 + float(242), AWinPos.Y1 + float(13), AWinPos.X1 + float(340), AWinPos.Y1 + float(26));
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, CapsuleOriginPrice, AWinPos.X1 + float(242), AWinPos.Y1 + float(27), AWinPos.X1 + float(340), AWinPos.Y1 + float(40));
        C.BtrTextSize(CapsuleOriginPrice.Text, CapsuleOriginPrice.FontSize, stringX, stringY);
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, DisCountStrikeImg, (AWinPos.X1 + float(340)) - stringX, AWinPos.Y1 + float(27), AWinPos.X1 + float(340), (AWinPos.Y1 + float(27)) + stringY);        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, CapsulePrice, AWinPos.X1 + float(242), AWinPos.Y1 + float(20), AWinPos.X1 + float(340), AWinPos.Y1 + float(33));
    }
    // End:0x502
    if(bLimitLevel)
    {
        limitLevelSize = 24.0000000;
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, EquipLevelImage, limitLevelX, AWinPos.Y1 + float(13), limitLevelX + limitLevelSize, (AWinPos.Y1 + float(13)) + limitLevelSize);
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, NotUseImage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    return true;
    //return;    
}
