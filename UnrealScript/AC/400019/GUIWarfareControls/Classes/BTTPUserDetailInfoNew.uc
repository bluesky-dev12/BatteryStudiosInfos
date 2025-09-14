class BTTPUserDetailInfoNew extends BTTabPanelHK
    editinlinenew
    instanced;

const LABEL_COUNT = 11;

enum E_EDIT
{
    EE_NICKNAME,                    // 0
    EE_EXP,                         // 1
    EE_CASH,                        // 2
    EE_POINT,                       // 3
    EE_RANKING,                     // 4
    EE_SCORE,                       // 5
    EE_KILLDEATH,                   // 6
    EE_AIMKILL,                     // 7
    EE_HEADSHOT,                    // 8
    EE_TOTALPLAYTIME,               // 9
    EE_DISCONNECT                   // 10
};

var string CharName;
var string ClanName;
var localized string strLabel[11];
var() automated FloatBox fbLabel[11];
var export editinline BTOwnerDrawImageHK Label[11];
var localized string strEdit[11];
var() automated FloatBox fbEdit[11];
var export editinline BTOwnerDrawTextArrayHK Edit[11];
var() automated FloatBox fbLevelEdgeImg;
var() automated FloatBox fbLevelImg;
var() automated FloatBox fbCashImg;
var() automated FloatBox fbPointImg;
var export editinline BTOwnerDrawImageHK LevelEdgeImg;
var export editinline BTOwnerDrawImageHK LevelImg;
var export editinline BTOwnerDrawImageHK CashImg;
var export editinline BTOwnerDrawImageHK PointImg;
var() automated FloatBox fbEquipWeapon[2];
var export editinline BTItemBoxButtonHK EquipWeapon[2];
var() automated FloatBox fbExpBar;
var export editinline BTExpBarHK expbar;
var localized string strNoRankState;
var localized string strHour;
var localized string strDay;

function SetUserData(string CharName, int Exp, int Level, int LevelMarkID, int PreMonthlyRanking, int MonthlyRanking, int Win, int Lose, int Kill, int Death, int Assist, int KillCountByAimShooting, int HeadShot2, int TotPlayTime, int DisCon, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID)
{
    local int nPerc, startExp, maxExp;
    local string strPerc;
    local int Day, Hour;
    local wGameManager GameMgr;
    local wMatchMaker MM;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    self.CharName = CharName;
    Edit[int(0)].SetData(CharName);
    GameMgr.GetLevelImage(Level, LevelMarkID, LevelImg.BackgroundImage);
    // End:0xE4
    if(Level >= 2)
    {
        startExp = GameMgr.LevelInfoParams[Level - 1].nAccumExp;        
    }
    else
    {
        startExp = 0;
    }
    maxExp = GameMgr.LevelInfoParams[Level].nAccumExp;
    strPerc = string(int((float(Exp - startExp) / float(maxExp - startExp)) * 100.0000000));
    expbar.SetData(Exp - startExp, maxExp - startExp, (string(Exp) $ "/") $ string(maxExp), ("(" $ strPerc) $ "%)");
    // End:0x23C
    if(CharName == MM.kUserName)
    {
        Edit[int(2)].Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(2)], Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kCash)));
        Edit[int(3)].Caption = Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(3)], Class'Engine.BTCustomDrawHK'.static.ToWonString(string(MM.kPoint)));        
    }
    else
    {
        Edit[int(2)].SetData("-");
        Edit[int(3)].SetData("-");
    }
    // End:0x291
    if(MonthlyRanking == 0)
    {
        Edit[int(4)].SetData(strNoRankState);        
    }
    else
    {
        Edit[int(4)].SetRankData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(4)], string(MonthlyRanking)), MonthlyRanking - PreMonthlyRanking);
    }
    // End:0x2ED
    if((Win + Lose) == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((100.0000000 * float(Win)) / float(Win + Lose));
    }
    Edit[int(5)].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(5)], string(Win + Lose), string(Win), string(Lose), string(nPerc)));
    // End:0x37F
    if((Kill + Death) == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((100.0000000 * float(Kill)) / float(Kill + Death));
    }
    Edit[int(6)].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(6)], string(Kill), string(Assist), string(Death), string(nPerc)));
    // End:0x403
    if(Kill == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(KillCountByAimShooting) / float(Kill)) * 100.0000000);
    }
    Edit[int(7)].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(7)], string(KillCountByAimShooting), string(nPerc)));
    // End:0x472
    if(Kill == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(HeadShot2) / float(Kill)) * 100.0000000);
    }
    Edit[int(8)].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(8)], string(HeadShot2), string(nPerc)));
    Day = TotPlayTime / 86400;
    Hour = int(float(TotPlayTime) % float(86400)) / 3600;
    // End:0x53D
    if(Day > 0)
    {
        Edit[int(9)].SetData(((string(Day) @ strDay) @ string(Hour)) @ strHour);        
    }
    else
    {
        Edit[int(9)].SetData(string(Hour) @ strHour);
    }
    Edit[int(10)].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[int(10)], string(DisCon)));
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(MainWeaponItemID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = MainWeaponPartID;
    EquipWeapon[0].SetData(ItemInfo, instanceInfo);
    ItemInfo = GameMgr.FindUIItem(SubWeaponItemID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = SubWeaponPartID;
    EquipWeapon[1].SetData(ItemInfo, instanceInfo);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0xEC [Loop If]
    if(i < 11)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 3;
        Label[i].Caption = strLabel[i];
        Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', fbEdit[i]));
        Edit[i].CaptionDrawType = 3;
        Edit[i].BackgroundImage.Image = none;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Edit[int(2)].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash());
    Edit[int(3)].SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Point());
    EquipWeapon[0] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', fbEquipWeapon[0]));
    EquipWeapon[1] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', fbEquipWeapon[1]));
    expbar = BTExpBarHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTExpBarHK', fbExpBar));
    expbar.Ro.back = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_myinfopopup_exp_back;
    expbar.Ro.Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.gau_myinfopopup_exp_gauge;
    expbar.Ro.GaugePadding[0] = 7.0000000;
    expbar.Ro.GaugePadding[1] = 5.0000000;
    expbar.Ro.GaugePadding[2] = 7.0000000;
    expbar.Ro.GaugePadding[3] = 9.0000000;
    CashImg = NewLabelComponent(fbCashImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_cash);
    PointImg = NewLabelComponent(fbPointImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_point);
    LevelEdgeImg = NewLabelComponent(fbLevelEdgeImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_icon);
    LevelImg = NewLabelComponent(fbLevelImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cm_00);
    //return;    
}

defaultproperties
{
    fbLabel[0]=(X1=448.0000000,Y1=183.0000000,X2=581.0000000,Y2=196.0000000)
    fbLabel[1]=(X1=448.0000000,Y1=227.0000000,X2=581.0000000,Y2=240.0000000)
    fbLabel[2]=(X1=448.0000000,Y1=260.0000000,X2=581.0000000,Y2=273.0000000)
    fbLabel[3]=(X1=448.0000000,Y1=293.0000000,X2=581.0000000,Y2=306.0000000)
    fbLabel[4]=(X1=448.0000000,Y1=326.0000000,X2=581.0000000,Y2=339.0000000)
    fbLabel[5]=(X1=448.0000000,Y1=359.0000000,X2=581.0000000,Y2=372.0000000)
    fbLabel[6]=(X1=448.0000000,Y1=392.0000000,X2=581.0000000,Y2=405.0000000)
    fbLabel[7]=(X1=448.0000000,Y1=425.0000000,X2=581.0000000,Y2=438.0000000)
    fbLabel[8]=(X1=448.0000000,Y1=458.0000000,X2=581.0000000,Y2=471.0000000)
    fbLabel[9]=(X1=448.0000000,Y1=491.0000000,X2=581.0000000,Y2=504.0000000)
    fbLabel[10]=(X1=448.0000000,Y1=524.0000000,X2=581.0000000,Y2=537.0000000)
    fbEdit[0]=(X1=647.0000000,Y1=183.0000000,X2=942.0000000,Y2=196.0000000)
    fbEdit[2]=(X1=626.0000000,Y1=260.0000000,X2=942.0000000,Y2=273.0000000)
    fbEdit[3]=(X1=626.0000000,Y1=293.0000000,X2=942.0000000,Y2=306.0000000)
    fbEdit[4]=(X1=600.0000000,Y1=326.0000000,X2=942.0000000,Y2=339.0000000)
    fbEdit[5]=(X1=600.0000000,Y1=359.0000000,X2=942.0000000,Y2=372.0000000)
    fbEdit[6]=(X1=600.0000000,Y1=392.0000000,X2=942.0000000,Y2=405.0000000)
    fbEdit[7]=(X1=600.0000000,Y1=425.0000000,X2=942.0000000,Y2=438.0000000)
    fbEdit[8]=(X1=600.0000000,Y1=458.0000000,X2=942.0000000,Y2=471.0000000)
    fbEdit[9]=(X1=600.0000000,Y1=491.0000000,X2=942.0000000,Y2=504.0000000)
    fbEdit[10]=(X1=600.0000000,Y1=524.0000000,X2=942.0000000,Y2=537.0000000)
    fbLevelEdgeImg=(X1=598.0000000,Y1=171.0000000,X2=632.0000000,Y2=205.0000000)
    fbLevelImg=(X1=599.0000000,Y1=172.0000000,X2=631.0000000,Y2=204.0000000)
    fbCashImg=(X1=603.0000000,Y1=260.0000000,X2=618.0000000,Y2=275.0000000)
    fbPointImg=(X1=603.0000000,Y1=292.0000000,X2=618.0000000,Y2=307.0000000)
    fbEquipWeapon[0]=(X1=600.0000000,Y1=559.0000000,X2=769.0000000,Y2=645.0000000)
    fbEquipWeapon[1]=(X1=774.0000000,Y1=559.0000000,X2=943.0000000,Y2=645.0000000)
    fbExpBar=(X1=592.0000000,Y1=221.0000000,X2=844.0000000,Y2=249.0000000)
}