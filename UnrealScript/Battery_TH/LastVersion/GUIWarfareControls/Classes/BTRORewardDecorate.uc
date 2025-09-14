class BTRORewardDecorate extends RenderObject;

var int ItemID;
var int RewardUniqueIndex;
var int RewardNeedNum;
var bool EnableItem;
var bool DrawAlreadyInfo;
var FloatBox fbFixedCountString;
var Text ShowString;
var Text CountString;
var Text AlreadyGetString;
var Image BackImage;
var localized string strAlreadyGet;

function SetItemData(int _ItemID, int _uniqueIndex, int _needNum, string str, bool bEnable)
{
    ItemID = _ItemID;
    RewardUniqueIndex = _uniqueIndex;
    RewardNeedNum = _needNum;
    EnableItem = bEnable;
    ShowString = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, str);
    ShowString.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.newButtonN();
    AlreadyGetString = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 4, strAlreadyGet);
    AlreadyGetString.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Coupon();
    //return;    
}

function SetCenterText(int FontSize, FloatBox fbFixed, string str)
{
    CountString = Class'Engine.BTCustomDrawHK'.static.MakeText(FontSize, 4, str);
    CountString.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    fbFixedCountString = fbFixed;
    //return;    
}

function SetBackImage(Image _image)
{
    BackImage = _image;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local FloatBox fbText, fbImg, fbCenterText;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    C.Style = 5;
    fbText.X1 = AWinPos.X1 + float(5);
    fbText.X2 = AWinPos.X2 - float(5);
    fbText.Y1 = AWinPos.Y1 + float(6);
    fbText.Y2 = AWinPos.Y1 + float(19);
    fbImg.X1 = AWinPos.X1 + float(6);
    fbImg.X2 = AWinPos.X2 - float(6);
    fbImg.Y1 = AWinPos.Y1 + float(21);
    fbImg.Y2 = AWinPos.Y2 - float(3);
    fbCenterText.X1 = fbImg.X1 + fbFixedCountString.X1;
    fbCenterText.X2 = fbImg.X1 + fbFixedCountString.X2;
    fbCenterText.Y1 = fbImg.Y1 + fbFixedCountString.Y1;
    fbCenterText.Y2 = fbImg.Y1 + fbFixedCountString.Y2;
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, ShowString, fbText.X1, fbText.Y1, fbText.X2, fbText.Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, BackImage, fbImg.X1, fbImg.Y1, fbImg.X2, fbImg.Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, CountString, fbCenterText.X1, fbCenterText.Y1, fbCenterText.X2, fbCenterText.Y2);
    // End:0x349
    if(!EnableItem)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_RW_AlreadyGet, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        // End:0x349
        if(DrawAlreadyInfo)
        {
            fbText.X1 = AWinPos.X1 + float(5);
            fbText.X2 = AWinPos.X2 - float(5);
            fbText.Y1 = AWinPos.Y1 + float(69);
            fbText.Y2 = AWinPos.Y1 + float(82);
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, AlreadyGetString, fbText.X1, fbText.Y1, fbText.X2, fbText.Y2);
        }
    }
    // End:0x39C
    if(bMouseOn)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_Quest_Slot_Reward_MouseOver, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    //return;    
}

defaultproperties
{
    EnableItem=true
    strAlreadyGet="??????????"
}