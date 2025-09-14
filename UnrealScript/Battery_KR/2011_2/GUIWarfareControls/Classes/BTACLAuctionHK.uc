class BTACLAuctionHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var BTRODecorateStringHK decoTimeLine;
var BTRODecorateStringHK decoHTU;
var localized string strHTU[2];
var localized string strDHMS[4];
var() automated BTROItemBoxHK tT;
var localized string strUntilTime[5];
var localized string strUntilTimeLine[5];
var Image LevelImg;
var BTItemCommonInfoHK MyData;
var Color RedColor;
var Color BlueColor;
var array<BTAutoColumnListDataHK> ACLPoolList;

function Color DamageToColor(int Damage)
{
    // End:0x1F
    if(Damage >= 75000)
    {
        return Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Damage4();
    }
    // End:0x3E
    if(Damage >= 51000)
    {
        return Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Damage3();
    }
    // End:0x5D
    if(Damage >= 26000)
    {
        return Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Damage2();
    }
    // End:0x7C
    if(Damage >= 11000)
    {
        return Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Damage1();
    }
    return Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Damage0();
    //return;    
}

function string UntilTimeToText(int UntilTime)
{
    // End:0x15
    if(UntilTime >= 24)
    {
        return strUntilTime[4];
    }
    // End:0x2A
    if(UntilTime >= 12)
    {
        return strUntilTime[3];
    }
    // End:0x3F
    if(UntilTime >= 6)
    {
        return strUntilTime[2];
    }
    // End:0x53
    if(UntilTime >= 2)
    {
        return strUntilTime[1];
    }
    return strUntilTime[0];
    //return;    
}

function string UntilTimeLineToText(int UntilTime)
{
    // End:0x15
    if(UntilTime >= 24)
    {
        return strUntilTimeLine[4];
    }
    // End:0x2A
    if(UntilTime >= 12)
    {
        return strUntilTimeLine[3];
    }
    // End:0x3F
    if(UntilTime >= 6)
    {
        return strUntilTimeLine[2];
    }
    // End:0x53
    if(UntilTime >= 2)
    {
        return strUntilTimeLine[1];
    }
    return strUntilTimeLine[0];
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return 26.0000000;
    //return;    
}

function AddAuctionItem(int UniqueID, int ItemID, int PartsID, BtrTime UntilTime, int CurrentBiddingPrice, int InstantlyBuyingPrice, int ItemDamage, string CurrentBiddingUser, string SellerName, int ItemCount, optional bool bShowTime)
{
    local string LeftTime;
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local BTAutoColumnListDataHK row;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(10);
    i = 0;
    J0x27:

    // End:0xCC [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[5].Text[i].FontDrawType = 5;
        row.DataPerColumn[6].Text[i].FontDrawType = 5;
        row.DataPerColumn[7].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[0].IntValue = GameMgr.FindUIItemReturnIndex(ItemID);
    // End:0x142
    if(row.DataPerColumn[0].IntValue < 0)
    {
        return;
    }
    ItemInfo = GameMgr.UIShowItemLists[row.DataPerColumn[0].IntValue];
    row.DataPerColumn[0].tempValue = ItemCount;
    // End:0x1CE
    if(ItemInfo.bOverlap)
    {
        row.DataPerColumn[0].strValue = (ItemInfo.ItemName $ "x") $ string(ItemCount);        
    }
    else
    {
        row.DataPerColumn[0].strValue = ItemInfo.ItemName;
    }
    row.DataPerColumn[1].strValue = tT.GradeToShortText(ItemInfo.Grade);
    row.DataPerColumn[1].IntValue = ItemInfo.Grade;
    row.DataPerColumn[2].IntValue = ItemInfo.EquipLevel;
    row.DataPerColumn[3].strValue = string(ItemDamage / 1000);
    row.DataPerColumn[3].IntValue = ItemDamage;
    // End:0x2DD
    if(UntilTime.Day > 0)
    {
        LeftTime = string(UntilTime.Day) $ strDHMS[1];        
    }
    else
    {
        // End:0x2FD
        if(UntilTime.Day < 0)
        {
            LeftTime = strDHMS[0];            
        }
        else
        {
            // End:0x32C
            if(UntilTime.Hour > 0)
            {
                LeftTime = string(UntilTime.Hour) $ strDHMS[2];                
            }
            else
            {
                // End:0x358
                if(UntilTime.Minute > 0)
                {
                    LeftTime = string(UntilTime.Minute) $ strDHMS[3];
                }
            }
        }
    }
    row.DataPerColumn[4].IntValue = UntilTime.Hour + (UntilTime.Day * 24);
    // End:0x3B1
    if(bShowTime)
    {
        row.DataPerColumn[4].strValue = LeftTime;        
    }
    else
    {
        // End:0x3F4
        if((UntilTime.Day < 0) || UntilTime.Hour < 0)
        {
            row.DataPerColumn[4].strValue = UntilTimeToText(0);            
        }
        else
        {
            row.DataPerColumn[4].strValue = UntilTimeToText(row.DataPerColumn[4].IntValue);
        }
    }
    row.DataPerColumn[5].strValue = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(CurrentBiddingPrice));
    row.DataPerColumn[5].IntValue = CurrentBiddingPrice;
    row.DataPerColumn[6].IntValue = InstantlyBuyingPrice;
    // End:0x4B3
    if(InstantlyBuyingPrice == 0)
    {
        row.DataPerColumn[6].strValue = "";        
    }
    else
    {
        row.DataPerColumn[6].strValue = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(InstantlyBuyingPrice));
    }
    row.DataPerColumn[7].strValue = CurrentBiddingUser;
    row.DataPerColumn[7].IntValue = ItemID;
    row.DataPerColumn[8].IntValue = UniqueID;
    row.DataPerColumn[8].strValue = SellerName;
    row.DataPerColumn[9].IntValue = PartsID;
    i = 0;
    J0x573:

    // End:0x610 [Loop If]
    if(i < 8)
    {
        // End:0x606
        if(((i != 1) && i != 4) && i != 7)
        {
            row.DataPerColumn[i].Text[1].DrawShadowColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ChatNormal();
            row.DataPerColumn[i].Text[1].DrawShadowColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultShadow();
        }
        i++;
        // [Loop Continue]
        goto J0x573;
    }
    AddRow(row);
    ACLPoolList.Length = ACLPoolList.Length + 1;
    ACLPoolList[ACLPoolList.Length - 1] = row;
    //return;    
}

function Clear()
{
    RemoveAll();
    ACLPoolList.Length = 0;
    //return;    
}

function int GetInstanctlyBuyingPrice(int row)
{
    return ACLRowList[row].DataPerColumn[6].IntValue;
    //return;    
}

function CheckMyRegisterItemByUniqueID(int UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6A [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x60
        if(ACLRowList[i].DataPerColumn[8].IntValue == UniqueID)
        {
            ACLRowList[i].DataPerColumn[0].floatValue = 1.0000000;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function CheckMyBiddingItemByUniqueID(BtrDouble UniqueID)
{
    local int i;
    local BtrDouble bd;

    i = 0;
    J0x07:

    // End:0xA3 [Loop If]
    if(i < ACLRowList.Length)
    {
        bd.dummy_1_DO_NOT_USE = ACLRowList[i].DataPerColumn[8].IntValue;
        bd.dummy_2_DO_NOT_USE = ACLRowList[i].DataPerColumn[8].tempValue;
        // End:0x99
        if(__NFUN_912__(bd, UniqueID))
        {
            ACLRowList[i].DataPerColumn[7].floatValue = 1.0000000;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function LC0_Draw_ItemName(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x7B
    if(i == 0)
    {
        C.DrawColor = tT.GradeToColor(ACLRowList[row].DataPerColumn[1].IntValue);        
    }
    else
    {
        C.DrawColor = ACLRowList[row].DataPerColumn[1].Text[i].DrawColor;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L, t, R, B, 3, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC1_Draw_Grade(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC2_Draw_Level(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local FloatBox Coordi;
    local wGameManager GameMgr;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(Data.IntValue, 0, LevelImg);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LevelImg, L, t, R, B);
    //return;    
}

function LC3_Draw_Damage(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x61
    if(i == 0)
    {
        C.DrawColor = DamageToColor(Data.IntValue);        
    }
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC4_Draw_Limit(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x152
    if(selectIndex == row)
    {
        i = 1;
        // End:0x141
        if((float(int(Controller.MouseX)) > L) && float(int(Controller.MouseX)) < R)
        {
            decoTimeLine.bVisible = true;
            decoTimeLine.AWinPos.X1 = float(int(Controller.MouseX));
            decoTimeLine.AWinPos.X2 = float(int(Controller.MouseX) + 88);
            decoTimeLine.AWinPos.Y1 = float(int(Controller.MouseY));
            decoTimeLine.AWinPos.Y2 = float(int(Controller.MouseY) + 24);
            decoTimeLine.SetData(UntilTimeLineToText(Data.IntValue));            
        }
        else
        {
            decoTimeLine.bVisible = false;
        }
    }
    // End:0x16E
    if(selectIndex < 0)
    {
        decoTimeLine.bVisible = false;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC5_Draw_HTP(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x75
    if((i == 0) && Data.IntValue > MyData.MyPoint)
    {
        C.DrawColor = RedColor;        
    }
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC6_Draw_IPP(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x75
    if((i == 0) && Data.IntValue > MyData.MyPoint)
    {
        C.DrawColor = RedColor;        
    }
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC7_Draw_HTU(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    // End:0x4E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x163
    if(selectIndex == row)
    {
        i = 1;
        // End:0x152
        if((float(int(Controller.MouseX)) > L) && float(int(Controller.MouseX)) < R)
        {
            decoHTU.bVisible = true;
            decoHTU.AWinPos.X1 = float(int(Controller.MouseX));
            decoHTU.AWinPos.X2 = float(int(Controller.MouseX) + 147);
            decoHTU.AWinPos.Y1 = float(int(Controller.MouseY));
            decoHTU.AWinPos.Y2 = float(int(Controller.MouseY) + 45);            
        }
        else
        {
            decoHTU.bVisible = false;
        }
    }
    // End:0x17F
    if(selectIndex < 0)
    {
        decoHTU.bVisible = false;
    }
    // End:0x25A
    if(i != 0)
    {
        C.DrawColor = Data.Text[i].DrawColor;
        // End:0x246
        if(((selectIndex == row) && MM != none) && MM.kUserName == Data.strValue)
        {
            // End:0x22D
            if(ACLRowList[row].DataPerColumn[8].strValue == Data.strValue)
            {
                decoHTU.SetData(strHTU[0]);                
            }
            else
            {
                decoHTU.SetData(strHTU[1]);
            }            
        }
        else
        {
            decoHTU.bVisible = false;
        }        
    }
    else
    {
        // End:0x2DA
        if((MM != none) && MM.kUserName == Data.strValue)
        {
            // End:0x2C6
            if(ACLRowList[row].DataPerColumn[8].strValue == Data.strValue)
            {
                C.DrawColor = RedColor;                
            }
            else
            {
                C.DrawColor = BlueColor;
            }
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    RedColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 49, 52);
    BlueColor = Class'Engine.Canvas'.static.MakeColor(70, 183, 223);
    LevelImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 26, none);
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.OnClickSound = 9;
    MultiColumnBox.OnClickSound = 9;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_on;
    self.LastSelectedImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_n;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ItemName", 618.0000000 - float(512), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw_ItemName;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Grade", 653.0000000 - float(618), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw_Grade;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Level", 689.0000000 - float(653), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw_Level;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Damage", 731.0000000 - float(689), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Damage;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Limit", 773.0000000 - float(731), 7);
    headerInfo.__CustomDraw__Delegate = LC4_Draw_Limit;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Highest Tender Price", 844.0000000 - float(773), 7);
    headerInfo.__CustomDraw__Delegate = LC5_Draw_HTP;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Immediately Purchase Price", 915.0000000 - float(844), 7);
    headerInfo.__CustomDraw__Delegate = LC6_Draw_IPP;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Highest Tender User", (1012.0000000 - float(915)) - float(15), 7);
    headerInfo.__CustomDraw__Delegate = LC7_Draw_HTU;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    tT = new Class'GUIWarfareControls_Decompressed.BTROItemBoxHK';
    tT.Init();
    decoTimeLine = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    decoTimeLine.Init();
    decoHTU = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    decoHTU.Init();
    decoHTU.OriginalString.FontDrawType = 3;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    decoHTU.Render(C);
    decoTimeLine.Render(C);
    //return;    
}

defaultproperties
{
    strHTU[0]="???? ?? ???? ??????."
    strHTU[1]="?? ?? ???? ??? ???."
    strDHMS[0]="????"
    strDHMS[1]="?"
    strDHMS[2]="??"
    strDHMS[3]="?"
    strUntilTime[0]="???"
    strUntilTime[1]="??"
    strUntilTime[2]="??"
    strUntilTime[3]="??"
    strUntilTime[4]="???"
    strUntilTimeLine[0]="2?? ??"
    strUntilTimeLine[1]="2~6??"
    strUntilTimeLine[2]="6~12??"
    strUntilTimeLine[3]="12~24??"
    strUntilTimeLine[4]="24~48??"
    OnRendered=BTACLAuctionHK.Internal_OnRendered
}