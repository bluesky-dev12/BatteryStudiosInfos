class BTRODefenceItem extends RenderObject;

var wItemBoxInstanceHK instanceInfo;
var int iItemID;
var int iOverlapCount;
var string strItemName;
var bool bEquipItem;
var Image mBackgroundImage;
var Image mItemImage;
var localized string lsEquipMsg;
var() automated Color FontShadowColor[5];
var Image mItemBG;
var FloatBox fbItemBG[3];

function Init()
{
    mItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 0, none);
    mItemBG = Class'Engine.BTCustomDrawHK'.static.MakeImage(169, 86, 0, none);
    mItemBG.Image = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRewardBG.Image;
    //return;    
}

function SetData(string _sName, int _iItemID, int _iCount, int _iSlotPos, Material _ItemImage)
{
    strItemName = _sName;
    iItemID = _iItemID;
    iOverlapCount = _iCount;
    mItemImage.Image = _ItemImage;
    bEquipItem = IsEquipItem(_iSlotPos);
    // End:0x56
    if(none != _ItemImage)
    {
        bVisible = true;
    }
    //return;    
}

function Reset()
{
    strItemName = "";
    iItemID = 0;
    iOverlapCount = 0;
    mItemImage.Image = none;
    bEquipItem = false;
    bVisible = false;
    //return;    
}

function UpdateItemInfo(int _iCount, int _iSlotPos)
{
    iOverlapCount = _iCount;
    bEquipItem = IsEquipItem(_iSlotPos);
    //return;    
}

function bool IsEquipItem(int _iSlotPos)
{
    local bool bEquip;

    switch(_iSlotPos)
    {
        // End:0x0E
        case int(26):
        // End:0x15
        case int(29):
        // End:0x27
        case int(30):
            bEquip = true;
            // End:0x35
            break;
        // End:0xFFFF
        default:
            bEquip = false;
            // End:0x35
            break;
            break;
    }
    return bEquip;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local float X1, Y1, X2, Y2;

    // End:0x0E
    if(bVisible == false)
    {
        return false;
    }
    // End:0x22
    if(bNeedUpdate)
    {
        Update(C);
    }
    X1 = AWinPos.X1;
    Y1 = AWinPos.Y1;
    X2 = AWinPos.X2;
    Y2 = AWinPos.Y2;
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    Class'Engine.BTCustomDrawHK'.static.DrawImageWithClipArea(C, mItemBG, X1, Y1, X2, Y2, fbItemBG[2].X1, fbItemBG[2].Y1, fbItemBG[2].X2, fbItemBG[2].Y2);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, mItemImage, X1, Y1 + float(20), X1 + float(169), Y1 + float(84));
    C.DrawColor = C.MakeColor(byte(255), 192, 0, byte(255));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strItemName, 0, 10.0000000, X1 + float(2), Y1 + float(2), X2, Y1 + float(16), FontShadowColor[0]);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, "x " $ string(instanceInfo.OverlapCount), 0, 10.0000000, X1 + float(128), Y1 + float(68), X2, Y2, FontShadowColor[0]);
    // End:0x285
    if(IsEquipItem(instanceInfo.SlotPosition))
    {
        C.DrawColor = C.MakeColor(67, 246, 55, byte(255));
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsEquipMsg, 0, 10.0000000, X1 + float(5), Y1 + float(68), X2, Y2, FontShadowColor[0]);
    }
    return true;
    //return;    
}

defaultproperties
{
    lsEquipMsg="Equipped"
    FontShadowColor[0]=(R=0,G=0,B=0,A=100)
    FontShadowColor[1]=(R=0,G=0,B=0,A=100)
    FontShadowColor[2]=(R=0,G=0,B=0,A=100)
    FontShadowColor[3]=(R=0,G=0,B=0,A=100)
    FontShadowColor[4]=(R=0,G=0,B=0,A=100)
    fbItemBG[0]=(X1=0.0000000,Y1=0.0000000,X2=169.0000000,Y2=86.0000000)
    fbItemBG[1]=(X1=169.0000000,Y1=0.0000000,X2=338.0000000,Y2=86.0000000)
    fbItemBG[2]=(X1=0.0000000,Y1=86.0000000,X2=169.0000000,Y2=172.0000000)
    bVisible=false
}