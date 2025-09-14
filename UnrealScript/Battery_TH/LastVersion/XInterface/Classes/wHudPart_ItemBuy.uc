class wHudPart_ItemBuy extends wHudPart_DisplayBase
    transient;

struct stItemInfo
{
    var int nBuyItemID;
    var int nBuyItemPrice;
    var byte nBuyItemIndex;
    var byte nBuyEnableLevel;
};

var localized string lsItemList;
var localized string lsItemComment;
var SpriteWidget WWindowBG;
var SpriteWidget WItemBG[3];
var SpriteWidget WItemList[6];
var string strItemName[6];
var SpriteWidget WShowKeyButton;
var SpriteWidget WKeyButton[6];
var SpriteWidget WItemBlackBG;
var bool bEnableItemBuy;
var stItemInfo arItemList[6];

function Initialize(HudBase myOwner, LevelInfo _level)
{
    local int lp1;

    super.Initialize(myOwner, _level);
    lp1 = 0;
    J0x17:

    // End:0x64 [Loop If]
    if(lp1 < 6)
    {
        WKeyButton[lp1] = HelpKeyButtonNumber[lp1 + 1];
        WKeyButton[lp1].WidgetTexture = HelpKeyButtonNumber[0].WidgetTexture;
        lp1++;
        // [Loop Continue]
        goto J0x17;
    }
    SetItemList();
    SetTimer(1.0000000, true);
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    DrawItemWindow(C);
    //return;    
}

function DrawItemWindow(Canvas C)
{
    local CalCoordsW calW;
    local float X1, Y1, X2, Y2;
    local int lp1, lp2, iIndex;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WWindowBG, float(WWindowBG.TextureCoords.X2), float(WWindowBG.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WWindowBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    lp1 = 0;
    J0xD5:

    // End:0x13A [Loop If]
    if(lp1 < 2)
    {
        lp2 = 0;
        J0xE8:

        // End:0x130 [Loop If]
        if(lp2 < 3)
        {
            DrawItemList(C, 542 + (lp2 * 172), 694 + (lp1 * 88), iIndex++);
            lp2++;
            // [Loop Continue]
            goto J0xE8;
        }
        lp1++;
        // [Loop Continue]
        goto J0xD5;
    }
    X1 = float(WWindowBG.OffsetX + 32) * _reX;
    Y1 = float(WWindowBG.OffsetY + 6) * _reY;
    X2 = X1 + (float(574) * _reX);
    Y2 = Y1 + (float(14) * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(lsItemList, 1, X1, Y1, X2, Y2, int(float(13) * _reY), DefaultShadow);
    X1 = float(WWindowBG.OffsetX + 52) * _reX;
    Y1 = float(WWindowBG.OffsetY + 212) * _reY;
    X2 = X1 + (float(534) * _reX);
    Y2 = Y1 + (float(17) * _reY);
    C.SetDrawColor(byte(255), 204, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(lsItemComment, 1, X1, Y1, X2, Y2, int(float(12) * _reY), DefaultShadow);
    //return;    
}

function DrawItemList(Canvas C, int iPosX, int iPosY, int Index)
{
    local CalCoordsW calW;
    local float X1, Y1, X2, Y2;
    local int iWeaponPrice;

    // End:0x18
    if(arItemList[Index].nBuyItemID <= 0)
    {
        return;
    }
    WItemBG[0].OffsetX = iPosX;
    WItemBG[0].OffsetY = iPosY;
    CalculateCoordinateEx(C, WItemBG[0], float(WItemBG[0].TextureCoords.X2), float(WItemBG[0].TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WItemBG[0].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WItemList[Index].OffsetX = iPosX + 8;
    WItemList[Index].OffsetY = iPosY + 20;
    CalculateCoordinateEx(C, WItemList[Index], 153.0000000, 64.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WItemList[Index].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WKeyButton[Index].OffsetX = iPosX + 2;
    WKeyButton[Index].OffsetY = iPosY + 20;
    CalculateCoordinateEx(C, WKeyButton[Index], 26.0000000, 26.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WKeyButton[Index].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = float(iPosX) * _reX;
    Y1 = float(iPosY) * _reY;
    X2 = float(iPosX + 169) * _reX;
    Y2 = float(iPosY + 20) * _reY;
    C.SetDrawColor(byte(255), 204, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(strItemName[Index], 0, X1, Y1, X2, Y2, int(float(11) * _reY), DefaultShadow);
    iWeaponPrice = arItemList[Index].nBuyItemPrice;
    X1 = float(iPosX) * _reX;
    Y1 = float(iPosY + 66) * _reY;
    X2 = float(iPosX + 169) * _reX;
    Y2 = float(iPosY + 86) * _reY;
    C.SetDrawColor(178, 233, 31, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(string(iWeaponPrice) $ " P", 2, X1, Y1, X2, Y2, int(float(11) * _reY), DefaultShadow);
    // End:0x53A
    if(float(iWeaponPrice) > HudOwner.PlayerOwner.PlayerReplicationInfo.PointIns)
    {
        WItemBlackBG.OffsetX = iPosX;
        WItemBlackBG.OffsetY = iPosY;
        CalculateCoordinateEx(C, WItemBlackBG, float(WItemBG[0].TextureCoords.X2), float(WItemBG[0].TextureCoords.Y2), calW);
        C.SetPos(calW.X1, calW.Y1);
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        C.DrawTileStretched(WItemBlackBG.WidgetTexture, calW.XL, calW.YL);
    }
    //return;    
}

simulated function SetItemList()
{
    local string szIcon;
    local int lp1, lp2, iItemID;
    local Material mat;
    local wItemResourceParam cItemResParam;
    local wItemBaseParam cItemParam;
    local wDefenceShopParam cDefenceParam;

    lp1 = 0;
    J0x07:

    // End:0x114 [Loop If]
    if(lp1 < Level.GameMgr.DefenceShopParams.Length)
    {
        cDefenceParam = Level.GameMgr.DefenceShopParams[lp1];
        // End:0x10A
        if((int(cDefenceParam.nBuyEnableLevel) == Level.GetMatchMaker().BotDifficulty) && lp2 < 6)
        {
            arItemList[lp2].nBuyItemID = cDefenceParam.nBuyItemID;
            arItemList[lp2].nBuyItemPrice = cDefenceParam.nBuyItemPrice;
            arItemList[lp2].nBuyItemIndex = cDefenceParam.nBuyItemIndex;
            arItemList[lp2].nBuyEnableLevel = cDefenceParam.nBuyEnableLevel;
            lp2++;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    SortItemList();
    lp1 = 0;
    J0x121:

    // End:0x25E [Loop If]
    if(lp1 < 6)
    {
        iItemID = arItemList[lp1].nBuyItemID;
        // End:0x151
        if(iItemID <= 0)
        {
            // [Explicit Break]
            goto J0x25E;
        }
        cItemParam = Level.GameMgr.GetItemParam(iItemID);
        cItemResParam = Level.GameMgr.GetItemResourceParam(iItemID);
        szIcon = cItemResParam.strRes_Icon;
        strItemName[lp1] = cItemParam.strDisplayName;
        mat = Material(DynamicLoadObject(szIcon, Class'Engine.Material'));
        WItemList[lp1].WidgetTexture = mat;
        WItemList[lp1].TextureCoords.X1 = 0;
        WItemList[lp1].TextureCoords.Y1 = 0;
        WItemList[lp1].TextureCoords.X2 = 157;
        WItemList[lp1].TextureCoords.Y2 = 64;
        lp1++;
        // [Loop Continue]
        goto J0x121;
    }
    J0x25E:

    //return;    
}

simulated function bool InOrder(stItemInfo P1, stItemInfo P2)
{
    // End:0x1F
    if(int(P1.nBuyItemIndex) > int(P2.nBuyItemIndex))
    {
        return false;
    }
    return true;
    //return;    
}

simulated function SortItemList()
{
    local int i, j;
    local stItemInfo ItemInfo;

    i = 0;
    J0x07:

    // End:0x9B [Loop If]
    if(i < 5)
    {
        j = i + 1;
        J0x21:

        // End:0x91 [Loop If]
        if(j < 6)
        {
            // End:0x87
            if(!InOrder(arItemList[i], arItemList[j]))
            {
                ItemInfo = arItemList[i];
                arItemList[i] = arItemList[j];
                arItemList[j] = ItemInfo;
            }
            j++;
            // [Loop Continue]
            goto J0x21;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function CallItemBuy(optional int iKey, optional int iReservation1, optional int iReservation2)
{
    local string strMessage;

    // End:0x4C
    if((iKey == 0) || iReservation1 == 999)
    {
        HudCDeathmatch(HudOwner).byShowItemBuy = 0;
        HudOwner.PlayerOwner.bToggleItemBuyWindow = false;
    }
    // End:0xE1
    if((iKey > 0) && iKey < 7)
    {
        strMessage = Class'Engine.wMessage_Game_Defence'.default.lsItemBuyOK $ strItemName[iKey - 1];
        HudOwner.LocalizedMessage2(Class'Engine.wMessage_Game_Defence', Class'Engine.wMessage_Game_Defence'.default.Code_ItemBuyOK,, strMessage);
        HudCDeathmatch(HudOwner).byShowItemBuy = 0;
        HudOwner.PlayerOwner.bToggleItemBuyWindow = false;
    }
    //return;    
}

function Timer()
{
    local int lp1;
    local stItemInfo ItemInfo;
    local bool bResult;

    super(Actor).Timer();
    bResult = false;
    lp1 = 0;
    J0x15:

    // End:0x75 [Loop If]
    if(lp1 < 6)
    {
        ItemInfo = arItemList[lp1];
        // End:0x6B
        if(float(ItemInfo.nBuyItemPrice) <= HudOwner.PlayerOwner.PlayerReplicationInfo.PointIns)
        {
            bResult = true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x15;
    }
    bEnableItemBuy = bResult;
    //return;    
}

defaultproperties
{
    lsItemList="Buy List"
    lsItemComment="?????????????????"
    WWindowBG=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_HUD_pve_itembuypopup_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=638,Y2=236),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=480,OffsetY=668,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemBG[0]=(WidgetTexture=Texture'Warfare_TH_UI_UI.Store.list_remodeling_remodelingitem',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=169,Y2=86),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemBG[1]=(WidgetTexture=Texture'Warfare_TH_UI_UI.Store.list_remodeling_remodelingitem',RenderStyle=5,TextureCoords=(X1=169,Y1=0,X2=338,Y2=86),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemBG[2]=(WidgetTexture=Texture'Warfare_TH_UI_UI.Store.list_remodeling_remodelingitem',RenderStyle=5,TextureCoords=(X1=0,Y1=86,X2=169,Y2=172),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WItemBlackBG=(WidgetTexture=Texture'Warfare_TH_UI_UI.Common.img_commom_black_40_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}