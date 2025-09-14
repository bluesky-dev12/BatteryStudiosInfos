class BTDefenceRewardInfo extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var localized string lsScore;
var localized string lsScoreOver;
var localized string lsRewardScore[3];
var localized string lsRewardClear;
var Image ItemRewardBG;
var FloatBox fbItemBG[3];
var Image ItemReward_Score[3];
var Image ItemReward_Clear;
var wItemBoxHK ItemRewardInfo_Score[3];
var wItemBoxHK ItemRewardInfo_Clear;
var wGameManager GameMgr;
var wDefenceRewardParam RewardParam[3];
var wDefenceRewardParam RewardParamClear;
var byte BotDifficulty;
var string strBotDifficulty;
var localized string lsBotDifficulty[4];
var BTScrollString Score_ScrollString[3];
var BTScrollString Clear_ScrollString;
var localized string lsDefenceShop;
var Image ImgDefenceShopBG;
var Image ImgDefenceShopItem[2];
var BTRODefenceItem RODefenceShopItem[2];
var() automated FloatBox fbShopItem[2];
var int iShopIndex;
var array<int> DefenceShopListID;
var array<wItemBaseParam> DefenceShopList;
var array<wItemResourceParam> DefenceShopListRes;
var bool IsVisibleMiniShop;
//var delegate<OnBuyButton> __OnBuyButton__Delegate;

delegate OnBuyButton()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIComponent).InitComponent(MyController, myOwner);
    BackgroundImage.DrawColor.R = byte(255);
    BackgroundImage.DrawColor.G = byte(255);
    BackgroundImage.DrawColor.B = byte(255);
    BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_Defence_Reward;
    ItemRewardBG = Class'Engine.BTCustomDrawHK'.static.MakeImage(169, 86, 0, none);
    ItemRewardBG.Image = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRewardBG.Image;
    ImgDefenceShopBG = Class'Engine.BTCustomDrawHK'.static.MakeImage(375, 156, 0, none);
    ImgDefenceShopBG.Image = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_Defence_MinishopBG.Image;
    SetDefenceRewardInfo();
    i = 0;
    J0xE4:

    // End:0x124 [Loop If]
    if(i < 3)
    {
        Score_ScrollString[i] = new Class'GUIWarfareControls_Decompressed.BTScrollString';
        Score_ScrollString[i].InitValue();
        ++i;
        // [Loop Continue]
        goto J0xE4;
    }
    Clear_ScrollString = new Class'GUIWarfareControls_Decompressed.BTScrollString';
    Clear_ScrollString.InitValue();
    DefenceShopList.Length = 0;
    i = 0;
    J0x151:

    // End:0x1B1 [Loop If]
    if(i < 2)
    {
        RODefenceShopItem[i] = new Class'GUIWarfareControls_Decompressed.BTRODefenceItem';
        RODefenceShopItem[i].Init();
        RODefenceShopItem[i].AWinPos = fbShopItem[i];
        i++;
        // [Loop Continue]
        goto J0x151;
    }
    iShopIndex = 0;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int lp1;
    local string strScore, culledItemName;
    local float XL, YL, X1, X2, Y1, Y2,
	    fontSizeLevel, fontSizeScore;

    local FloatBox fbItemName;
    local bool bMouseOn;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    fontSizeLevel = 14.0000000;
    fontSizeScore = 10.0000000;
    // End:0x7C
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    }
    lp1 = 0;
    J0x83:

    // End:0x10E [Loop If]
    if(lp1 < 4)
    {
        C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemRewardBG, 572.0000000, 141.0000000 + float(lp1 * 93), 741.0000000, 227.0000000 + float(lp1 * 93));
        lp1++;
        // [Loop Continue]
        goto J0x83;
    }
    lp1 = 0;
    J0x115:

    // End:0x764 [Loop If]
    if(lp1 < 3)
    {
        X1 = 395.0000000;
        X2 = 570.0000000;
        Y1 = 170.0000000;
        Y2 = 185.0000000;
        C.DrawColor = C.MakeColor(byte(255), 192, 0, byte(255));
        fbItemName.X1 = 574.0000000;
        fbItemName.Y1 = 147.0000000 + float(lp1 * 93);
        fbItemName.X2 = 741.0000000;
        fbItemName.Y2 = 227.0000000 + float(lp1 * 93);
        bMouseOn = CheckInFloatBox(fbItemName, Controller.MouseX, Controller.MouseY, 1.0000000, C.GetClientHeightRatio());
        fbItemName.X1 = 575.0000000;
        fbItemName.Y1 = 147.0000000 + float(lp1 * 93);
        fbItemName.X2 = 741.0000000;
        fbItemName.Y2 = 162.0000000 + float(lp1 * 93);
        Score_ScrollString[lp1].ProcessScroll(C, culledItemName, ItemRewardInfo_Score[lp1].ItemName, fbItemName, bMouseOn, fontSizeScore, Controller.RenderDelta);
        Class'Engine.BTCustomDrawHK'.static.DrawCullingString(C, culledItemName, 0, fontSizeScore, 1.0000000, fbItemName.X1, fbItemName.Y1, fbItemName.X2, fbItemName.Y2, Score_ScrollString[lp1].cullRight, FontShadowColor[0]);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, "x " $ string(RewardParam[lp1].nRewardItemCount), 0, fontSizeScore, 700.0000000, 200.0000000 + float(lp1 * 93), 741.0000000, 227.0000000 + float(lp1 * 93), FontShadowColor[0]);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsRewardScore[lp1], 0, fontSizeLevel, X1, Y1 + float(lp1 * 93), X2, 185.0000000 + float(lp1 * 93), FontShadowColor[0]);
        C.BtrTextSize(lsRewardScore[lp1], int(fontSizeLevel), XL, YL);
        // End:0x596
        if(lp1 < 2)
        {
            Y1 += (YL + float(5));
            strScore = (("( " $ string(RewardParam[lp1].nGainRewardMinScore)) $ " ~ ") $ string(RewardParam[lp1].nGainRewardMaxScore);
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, strScore, 0, fontSizeScore, X1, Y1 + float(lp1 * 93), X2, 185.0000000 + float(lp1 * 93), FontShadowColor[0]);
            C.BtrTextSize(strScore, int(fontSizeScore), XL, YL);
            X1 += XL;
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsScore $ " )", 0, fontSizeScore, X1 + float(3), Y1 + float(lp1 * 93), X2 + float(30), 185.0000000 + float(lp1 * 93), FontShadowColor[0]);            
        }
        else
        {
            // End:0x6F1
            if(lp1 == 2)
            {
                Y1 += (YL + float(5));
                strScore = "( " $ string(RewardParam[lp1].nGainRewardMinScore);
                C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                Class'Engine.BTCustomDrawHK'.static.DrawString(C, strScore, 0, fontSizeScore, X1, Y1 + float(lp1 * 93), X2, 185.0000000 + float(lp1 * 93), FontShadowColor[0]);
                C.BtrTextSize(strScore, int(fontSizeScore), XL, YL);
                X1 += XL;
                Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsScoreOver $ " )", 0, fontSizeScore, X1 + float(3), Y1 + float(lp1 * 93), X2 + float(30), 185.0000000 + float(lp1 * 93), FontShadowColor[0]);
            }
        }
        // End:0x75A
        if(ItemReward_Score[lp1].Image != none)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemReward_Score[lp1], 574.0000000, (141.0000000 + float(lp1 * 93)) + float(20), 741.0000000, 227.0000000 + float(lp1 * 93));
        }
        lp1++;
        // [Loop Continue]
        goto J0x115;
    }
    X1 = 395.0000000;
    X2 = 570.0000000;
    Y1 = 170.0000000 + float(93 * 3);
    Y2 = 185.0000000 + float(93 * 3);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsRewardClear, 0, fontSizeLevel, X1, Y1, X2, Y2, FontShadowColor[0]);
    C.BtrTextSize(lsRewardClear, int(fontSizeLevel), XL, YL);
    Y1 += (YL + float(5));
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, ("( " $ strBotDifficulty) $ " )", 0, fontSizeScore, X1, Y1, X2, Y2, FontShadowColor[0]);
    // End:0x8A0
    if(ItemReward_Clear.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemReward_Clear, 574.0000000, 420.0000000 + float(20), 741.0000000, 506.0000000);
    }
    C.DrawColor = C.MakeColor(byte(255), 192, 0, byte(255));
    fbItemName.X1 = 574.0000000;
    fbItemName.Y1 = 420.0000000 + float(20);
    fbItemName.X2 = 741.0000000;
    fbItemName.Y2 = 506.0000000;
    bMouseOn = CheckInFloatBox(fbItemName, Controller.MouseX, Controller.MouseY, 1.0000000, C.GetClientHeightRatio());
    fbItemName.X1 = 575.0000000;
    fbItemName.Y1 = 147.0000000 + float(3 * 93);
    fbItemName.X2 = 741.0000000;
    fbItemName.Y2 = 162.0000000 + float(3 * 93);
    Clear_ScrollString.ProcessScroll(C, culledItemName, ItemRewardInfo_Clear.ItemName, fbItemName, bMouseOn, fontSizeScore, Controller.RenderDelta);
    Class'Engine.BTCustomDrawHK'.static.DrawCullingString(C, culledItemName, 0, fontSizeScore, 1.0000000, fbItemName.X1, fbItemName.Y1, fbItemName.X2, fbItemName.Y2, Clear_ScrollString.cullRight, FontShadowColor[0]);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, "x " $ string(RewardParamClear.nRewardItemCount), 0, fontSizeScore, 700.0000000, 200.0000000 + float(3 * 93), 741.0000000, 227.0000000 + float(3 * 93), FontShadowColor[0]);
    // End:0xAC2
    if(IsVisibleMiniShop)
    {
        DrawShop(C);
    }
    //return;    
}

function SetDefenceRewardInfo()
{
    local int lp1, lp2;
    local wDefenceRewardParam tempParam;

    GameMgr = PlayerOwner().Level.GameMgr;
    ItemRewardInfo_Clear = none;
    BotDifficulty = byte(PlayerOwner().Level.GetMatchMaker().BotDifficulty);
    lp2 = 0;
    lp1 = 0;
    J0x57:

    // End:0x13F [Loop If]
    if(lp1 < GameMgr.DefenceRewardParams.Length)
    {
        tempParam = GameMgr.DefenceRewardParams[lp1];
        // End:0x135
        if(int(tempParam.nDifficulty) == int(BotDifficulty))
        {
            // End:0xE1
            if(int(tempParam.nRewardGroup) == 1)
            {
                RewardParam[lp2++] = GameMgr.DefenceRewardParams[lp1];
                // [Explicit Continue]
                goto J0x135;
            }
            // End:0x135
            if(int(tempParam.nRewardGroup) == 2)
            {
                RewardParamClear = GameMgr.DefenceRewardParams[lp1];
                ItemRewardInfo_Clear = GameMgr.FindUIItem(tempParam.nRewardItemID);
            }
        }
        J0x135:

        lp1++;
        // [Loop Continue]
        goto J0x57;
    }
    SortItemList();
    lp1 = 0;
    J0x14C:

    // End:0x1E3 [Loop If]
    if(lp1 < 3)
    {
        tempParam = RewardParam[lp1];
        ItemRewardInfo_Score[lp1] = GameMgr.FindUIItem(tempParam.nRewardItemID);
        ItemReward_Score[lp1] = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 0, none);
        ItemReward_Score[lp1].Image = ItemRewardInfo_Score[lp1].ItemImage;
        lp1++;
        // [Loop Continue]
        goto J0x14C;
    }
    ItemReward_Clear = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 0, none);
    ItemReward_Clear.Image = ItemRewardInfo_Clear.ItemImage;
    switch(BotDifficulty)
    {
        // End:0x234
        case 1:
            strBotDifficulty = lsBotDifficulty[0];
            // End:0x278
            break;
        // End:0x249
        case 2:
            strBotDifficulty = lsBotDifficulty[1];
            // End:0x278
            break;
        // End:0x25F
        case 3:
            strBotDifficulty = lsBotDifficulty[2];
            // End:0x278
            break;
        // End:0x275
        case 4:
            strBotDifficulty = lsBotDifficulty[3];
            // End:0x278
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool InOrder(int P1, int P2)
{
    // End:0x11
    if(P1 > P2)
    {
        return false;
    }
    return true;
    //return;    
}

function SortItemList()
{
    local int i, j;
    local wDefenceRewardParam ItemInfo;

    i = 0;
    J0x07:

    // End:0xAD [Loop If]
    if(i < 2)
    {
        j = i + 1;
        J0x21:

        // End:0xA3 [Loop If]
        if(j < 3)
        {
            // End:0x99
            if(!InOrder(RewardParam[i].nGainRewardMinScore, RewardParam[j].nGainRewardMinScore))
            {
                ItemInfo = RewardParam[i];
                RewardParam[i] = RewardParam[j];
                RewardParam[j] = ItemInfo;
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

function UpdateShopItemInfo()
{
    local int lp1, lp2, iOverlapCount, iSlotPos;
    local wMyPlayerStatus MyStatus;
    local int iIndex, iMaxListIndex, iItemID;
    local wItemBaseParam ItemParams;
    local wItemResourceParam ItemResParams;
    local Material matImg;

    iMaxListIndex = Max(0, (DefenceShopListID.Length - 1) / 2);
    // End:0x2F
    if(iShopIndex < 0)
    {
        iShopIndex = iMaxListIndex;        
    }
    else
    {
        // End:0x45
        if(iShopIndex > iMaxListIndex)
        {
            iShopIndex = 0;
        }
    }
    iIndex = iShopIndex * 2;
    lp1 = 0;
    J0x5B:

    // End:0xB8 [Loop If]
    if(lp1 < 2)
    {
        RODefenceShopItem[lp1].Reset();
        // End:0xAE
        if(iIndex < DefenceShopListID.Length)
        {
            RODefenceShopItem[lp1].iItemID = DefenceShopListID[iIndex++];
        }
        lp1++;
        // [Loop Continue]
        goto J0x5B;
    }
    MyStatus = PlayerOwner().Level.CharMgr.MyPlayer;
    lp2 = 0;
    J0xE3:

    // End:0x276 [Loop If]
    if(lp2 < 2)
    {
        lp1 = 0;
        J0xF6:

        // End:0x18C [Loop If]
        if(lp1 < MyStatus.ItemList.Length)
        {
            // End:0x182
            if(MyStatus.ItemList[lp1].iItemID == RODefenceShopItem[lp2].iItemID)
            {
                iOverlapCount = MyStatus.ItemList[lp1].iOverlapCount;
                iSlotPos = MyStatus.ItemList[lp1].iSlotPosition;
                // [Explicit Break]
                goto J0x18C;
            }
            lp1++;
            // [Loop Continue]
            goto J0xF6;
        }
        J0x18C:

        iItemID = RODefenceShopItem[lp2].iItemID;
        // End:0x1B4
        if(iItemID <= 0)
        {
            // [Explicit Continue]
            goto J0x26C;
        }
        ItemParams = GameMgr.GetItemParam(iItemID);
        ItemResParams = GameMgr.GetItemResourceParam(iItemID);
        matImg = Material(DynamicLoadObject(ItemResParams.strRes_Icon, Class'Engine.Material'));
        RODefenceShopItem[lp2].SetData(ItemParams.strDisplayName, iItemID, iOverlapCount, iSlotPos, matImg);
        RODefenceShopItem[lp2].instanceInfo = GameMgr.FindFirstInstanceItemByItemID(iItemID);
        J0x26C:

        lp2++;
        // [Loop Continue]
        goto J0xE3;
    }
    //return;    
}

function int GetShopItemID(int iIndex)
{
    local int iItemID;

    iItemID = RODefenceShopItem[iIndex].iItemID;
    return iItemID;
    //return;    
}

function SetDefenceShopInfo(int _ItemID)
{
    local int lp1, iDrawIndex, ItemID, iOverlapCount, iSlotPos;

    local wItemBaseParam ItemParams;
    local wItemResourceParam ItemResParams;
    local Material matImg;
    local wMyPlayerStatus MyStatus;

    // End:0x1A
    if((_ItemID <= 0) || !IsVisibleMiniShop)
    {
        return;
    }
    DefenceShopListID.Length = DefenceShopListID.Length + 1;
    DefenceShopListID[DefenceShopListID.Length - 1] = _ItemID;
    return;
    //return;    
}

function DrawShop(Canvas C)
{
    local int lp1;
    local float X1, X2, Y1, Y2;

    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    X1 = 0.0000000;
    X2 = 375.0000000;
    Y1 = 352.0000000;
    Y2 = 508.0000000;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ImgDefenceShopBG, X1, Y1, X2, Y2);
    Y1 = 361.0000000;
    Y2 = 376.0000000;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, lsDefenceShop, 4, 9.0000000, X1, Y1, X2, Y2, FontShadowColor[0]);
    lp1 = 0;
    J0xDF:

    // End:0x10F [Loop If]
    if(lp1 < 2)
    {
        RODefenceShopItem[lp1].Render(C);
        lp1++;
        // [Loop Continue]
        goto J0xDF;
    }
    //return;    
}

defaultproperties
{
    lsScore="points"
    lsScoreOver="points or above"
    lsRewardScore[0]="POOR"
    lsRewardScore[1]="NORMAL"
    lsRewardScore[2]="EXCELLENT"
    lsRewardClear="CLEAR"
    fbItemBG[0]=(X1=0.0000000,Y1=0.0000000,X2=169.0000000,Y2=86.0000000)
    fbItemBG[1]=(X1=169.0000000,Y1=0.0000000,X2=338.0000000,Y2=86.0000000)
    fbItemBG[2]=(X1=0.0000000,Y1=86.0000000,X2=169.0000000,Y2=172.0000000)
    strBotDifficulty="None"
    lsBotDifficulty[0]="Easy"
    lsBotDifficulty[1]="Normal"
    lsBotDifficulty[2]="Hard"
    lsBotDifficulty[3]="Very Hard"
    lsDefenceShop="Purchasable Items"
    fbShopItem[0]=(X1=14.0000000,Y1=385.0000000,X2=183.0000000,Y2=471.0000000)
    fbShopItem[1]=(X1=190.0000000,Y1=385.0000000,X2=359.0000000,Y2=471.0000000)
}