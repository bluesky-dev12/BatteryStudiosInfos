class BTTPUserDetailInfo extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strLabel[14];
var() automated FloatBox fbLabel[14];
var export editinline BTOwnerDrawImageHK Label[14];
var localized string strEdit[14];
var() automated FloatBox fbEdit[14];
var export editinline BTOwnerDrawTextArrayHK Edit[14];
var() automated FloatBox fbLevelImg;
var() automated FloatBox fbLabelClanMark;
var export editinline BTOwnerDrawImageHK LevelImg;
var export editinline BTLabelClanMarkHK LabelClanMark;
var() automated FloatBox fbSelfIntroduction;
var export editinline BTAutoScrollListHK SelfIntroduction;
var() automated FloatBox fbEquipWeapon[2];
var export editinline BTItemBoxButtonHK EquipWeapon[2];
var() automated FloatBox fbExpBar;
var export editinline BTExpBarHK expbar;
var localized string strOnLine;
var localized string strOffLine;
var export editinline BTOwnerDrawImageHK strCharInfo;
var FloatBox fbCharInfo;
var localized string strDefaultSelfIntro;
var localized string strNoRankState;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x124 [Loop If]
    if(i < 14)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        // End:0xBD
        if((((i == 0) || i == 5) || i == 7) || i == 8)
        {
            // [Explicit Continue]
            goto J0x11A;
        }
        Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', fbEdit[i]));
        Edit[i].CaptionDrawType = 0;
        Edit[i].BackgroundImage.Image = none;
        J0x11A:

        i++;
        // [Loop Continue]
        goto J0x17;
    }
    Label[0].CaptionDrawType = 3;
    Label[0].SetFontSizeAll(11);
    Label[0].CaptionPadding[0] = 9;
    Label[0].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_ptitl_back;
    Label[7].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4;
    Label[8].CaptionDrawType = 3;
    Label[8].SetFontSizeAll(11);
    Label[8].CaptionPadding[0] = 9;
    Label[8].BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_ptitl_back;
    EquipWeapon[0] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', fbEquipWeapon[0]));
    EquipWeapon[1] = BTItemBoxButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK', fbEquipWeapon[1]));
    fb = Class'Engine.BTCustomDrawHK'.static.MakeResizeBox(fbSelfIntroduction, -1, -2);
    fb.X2 -= float(15);
    SelfIntroduction = BTAutoScrollListHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK', fb));
    SelfIntroduction.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    SelfIntroduction.MultiColumnList.MyScrollBar.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    SelfIntroduction.MultiColumnList.MyScrollBar.ApplyAWinPos();
    SelfIntroduction.bAutoShowScrollBar = true;
    SelfIntroduction.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    expbar = BTExpBarHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTExpBarHK', fbExpBar));
    LabelClanMark = BTLabelClanMarkHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTLabelClanMarkHK', fbLabelClanMark));
    //return;    
}

function SetSelfIntro(string Intro)
{
    SelfIntroduction.Clear();
    // End:0x33
    if(Intro == "")
    {
        SelfIntroduction.AddLineRow(none, strDefaultSelfIntro);        
    }
    else
    {
        SelfIntroduction.AddLineRow(none, Intro);
    }
    //return;    
}

function SetMyInfo(string CharName, string ClanName, int Level, int CurExp, int startExp, int maxExp, int LevelMarkID)
{
    local string strPerc;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Edit[1].SetData(CharName);
    LevelImg = NewLabelComponent(fbLevelImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cm_00);
    GameMgr.GetLevelImage(Level, LevelMarkID, LevelImg.BackgroundImage);
    strPerc = string(int((float(CurExp - startExp) / float(maxExp - startExp)) * 100.0000000));
    expbar.SetData(CurExp - startExp, maxExp - startExp, (string(CurExp) $ "/") $ string(maxExp), ("(" $ strPerc) $ "%)");
    //return;    
}

function SetClanInfo(string ClanName, int ClanPattern, int ClanBG, int ClanBL, optional int ClanLevel)
{
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x47
    if(ClanName == "none")
    {
        ClanName = "";
    }
    Edit[2].SetData(ClanName);
    // End:0x8F
    if(ClanName == "")
    {
        LabelClanMark.SetVisibility(false);
        LabelClanMark.SetData(0, 0, 0);        
    }
    else
    {
        LabelClanMark.SetVisibility(true);
        LabelClanMark.SetData(ClanPattern, ClanBG, ClanBL, false, ClanLevel);
    }
    //return;    
}

function SetEquipItemInfo(int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int HelmetID, int FaceID, int AcceID, int AFBodyID, int RSABodyID)
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(MainWeaponID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = MainWeaponPartID;
    EquipWeapon[0].SetData(ItemInfo, instanceInfo);
    ItemInfo = GameMgr.FindUIItem(SubWeaponID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = SubWeaponPartID;
    EquipWeapon[1].SetData(ItemInfo, instanceInfo);
    //return;    
}

function SetRankingInfo(int Ranking, int Win, int Lose, int DisCon)
{
    local float fPerc;

    Edit[3].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[3], string(Ranking)));
    // End:0x50
    if((Win + Lose) == 0)
    {
        fPerc = 0.0000000;        
    }
    else
    {
        fPerc = (100.0000000 * float(Win)) / float(Win + Lose);
    }
    Edit[4].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[4], string(Win + Lose), string(Win), string(Lose), string(int(fPerc))));
    Edit[6].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[6], string(DisCon)));
    //return;    
}

function SetData(string CharName, string ClanName, int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int AFBodyID, int RSABodyID, CharInfo stCharInfo)
{
    local int nPerc, startExp, maxExp;
    local string strPerc;
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Edit[1].SetData(CharName);
    LevelImg = NewLabelComponent(fbLevelImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cm_00);
    GameMgr.GetLevelImage(stCharInfo.Level, stCharInfo.LevelMarkID, LevelImg.BackgroundImage);
    // End:0xD4
    if(stCharInfo.Level >= 2)
    {
        startExp = GameMgr.LevelInfoParams[stCharInfo.Level - 1].nAccumExp;        
    }
    else
    {
        startExp = 0;
    }
    maxExp = GameMgr.LevelInfoParams[stCharInfo.Level].nAccumExp;
    strPerc = string(int((float(stCharInfo.Exp - startExp) / float(maxExp - startExp)) * 100.0000000));
    expbar.SetData(stCharInfo.Exp - startExp, maxExp - startExp, (string(stCharInfo.Exp) $ "/") $ string(maxExp), ("(" $ strPerc) $ "%)");
    // End:0x1A5
    if(ClanName == "none")
    {
        ClanName = "";
    }
    Edit[2].SetData(ClanName);
    Edit[3].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[3], string(stCharInfo.Ranking)));
    // End:0x217
    if((stCharInfo.Win + stCharInfo.Lose) == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((100.0000000 * float(stCharInfo.Win)) / float(stCharInfo.Win + stCharInfo.Lose));
    }
    Edit[4].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[4], string(stCharInfo.Win + stCharInfo.Lose), string(stCharInfo.Win), string(stCharInfo.Lose), string(nPerc)));
    Edit[6].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[6], string(stCharInfo.DisCon)));
    Edit[9].SetData(string(stCharInfo.ClanContribue));
    // End:0x325
    if((stCharInfo.ClanWin + stCharInfo.ClanLose) == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(stCharInfo.ClanWin) / float(stCharInfo.ClanWin + stCharInfo.ClanLose)) * 100.0000000);
    }
    Edit[10].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[4], string(stCharInfo.ClanWin + stCharInfo.ClanLose), string(stCharInfo.ClanWin), string(stCharInfo.ClanLose), string(nPerc)));
    // End:0x3E6
    if((stCharInfo.ClanKill == 0) && stCharInfo.ClanDeath == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(stCharInfo.ClanKill) / float(stCharInfo.ClanKill + stCharInfo.ClanDeath)) * 100.0000000);
    }
    Edit[11].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[11], string(stCharInfo.ClanKill), string(stCharInfo.ClanAssist), string(stCharInfo.ClanDeath), string(nPerc)));
    // End:0x489
    if(stCharInfo.ClanHeadshot == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(stCharInfo.ClanHeadshot) / float(stCharInfo.ClanKill)) * 100.0000000);
    }
    Edit[12].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[12], string(stCharInfo.ClanHeadshot), string(nPerc)));
    Edit[13].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[6], string(0)));
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(MainWeaponID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = MainWeaponPartID;
    EquipWeapon[0].SetData(ItemInfo, instanceInfo);
    ItemInfo = GameMgr.FindUIItem(SubWeaponID);
    instanceInfo = new Class'Engine.wItemBoxInstanceHK';
    instanceInfo.PartID = SubWeaponPartID;
    EquipWeapon[1].SetData(ItemInfo, instanceInfo);
    //return;    
}

defaultproperties
{
    strLabel[0]="Personal Info"
    strLabel[1]="Nickname"
    strLabel[2]="Clan"
    strLabel[3]="Rank - Monthly"
    strLabel[4]="Records"
    strLabel[5]="EXP"
    strLabel[6]="Force Quit"
    strLabel[8]="Clan Battle Info"
    strLabel[9]="Contributions"
    strLabel[10]="Records"
    strLabel[11]="Info"
    strLabel[12]="Headshots"
    strLabel[13]="Withdrawals"
    fbLabel[0]=(X1=512.0000000,Y1=67.0000000,X2=846.0000000,Y2=93.0000000)
    fbLabel[1]=(X1=521.0000000,Y1=102.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[2]=(X1=521.0000000,Y1=136.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[3]=(X1=521.0000000,Y1=170.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[4]=(X1=521.0000000,Y1=204.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[5]=(X1=521.0000000,Y1=238.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[6]=(X1=521.0000000,Y1=272.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[7]=(X1=516.0000000,Y1=294.0000000,X2=833.0000000,Y2=388.0000000)
    fbLabel[8]=(X1=512.0000000,Y1=493.0000000,X2=846.0000000,Y2=519.0000000)
    fbLabel[9]=(X1=521.0000000,Y1=528.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[10]=(X1=521.0000000,Y1=562.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[11]=(X1=521.0000000,Y1=596.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[12]=(X1=521.0000000,Y1=630.0000000,X2=846.0000000,Y2=733.0000000)
    fbLabel[13]=(X1=521.0000000,Y1=664.0000000,X2=846.0000000,Y2=733.0000000)
    strEdit[3]="Place: %0"
    strEdit[4]="%0 Battles %1 W / %2 L (%3%)"
    strEdit[6]="%0 Times"
    strEdit[11]="%0 Kills %1 Assists %2 Deaths (K/D %3%)"
    strEdit[12]="%0 Headshots (%1%)"
    fbEdit[1]=(X1=659.0000000,Y1=102.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[2]=(X1=659.0000000,Y1=136.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[3]=(X1=618.0000000,Y1=170.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[4]=(X1=618.0000000,Y1=204.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[5]=(X1=618.0000000,Y1=238.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[6]=(X1=618.0000000,Y1=272.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[7]=(X1=522.0000000,Y1=300.0000000,X2=826.0000000,Y2=382.0000000)
    fbEdit[9]=(X1=618.0000000,Y1=528.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[10]=(X1=618.0000000,Y1=562.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[11]=(X1=618.0000000,Y1=596.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[12]=(X1=618.0000000,Y1=630.0000000,X2=846.0000000,Y2=733.0000000)
    fbEdit[13]=(X1=618.0000000,Y1=664.0000000,X2=846.0000000,Y2=733.0000000)
    fbLevelImg=(X1=618.0000000,Y1=93.0000000,X2=650.0000000,Y2=125.0000000)
    fbLabelClanMark=(X1=618.0000000,Y1=127.0000000,X2=650.0000000,Y2=159.0000000)
    fbSelfIntroduction=(X1=516.0000000,Y1=294.0000000,X2=833.0000000,Y2=388.0000000)
    fbEquipWeapon[0]=(X1=516.0000000,Y1=398.0000000,X2=672.0000000,Y2=483.0000000)
    fbEquipWeapon[1]=(X1=677.0000000,Y1=398.0000000,X2=833.0000000,Y2=483.0000000)
    fbExpBar=(X1=618.0000000,Y1=236.0000000,X2=770.0000000,Y2=254.0000000)
    strNoRankState="None"
}