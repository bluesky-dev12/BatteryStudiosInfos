class BTWindowUserDetailInfoHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawCaptionButtonHK ButtonAF;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRSA;
var bool bLRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonLR;
var bool bRRMousePressed;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRR;
var export editinline BTOwnerDrawImageHK EdgeLine;
var export editinline BTOwnerDrawImageHK AFTeamBG;
var export editinline BTOwnerDrawImageHK RSATeamBG;
var bool bVisibleAFModel;
var localized string strAF;
var localized string strRSA;
var BTROModelNew CharacterModel;
var export editinline BTModelHK UIModel;
var string CharName;
var string ClanName;
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

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
    //return;    
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
    //return;    
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
    //return;    
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
    //return;    
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(true);
    CharacterModel.ChangeTeam(0);
    return true;
    //return;    
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(false);
    CharacterModel.ChangeTeam(1);
    return true;
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    TimeOutPreDraw(C);
    ChangeVisibleModel(bVisibleAFModel);
    // End:0x36
    if(CharacterModel != none)
    {
        UIModel.cModel = CharacterModel;
    }
    // End:0x51
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x69
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
    //return;    
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3B
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;        
    }
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
    //return;    
}

function SetSelfIntro(string Intro)
{
    SelfIntroduction.Clear();
    SelfIntroduction.AddLineRow(none, Intro);
    //return;    
}

function SetMyInfo(string CharName, string ClanName, int Level, int curExp, int startExp, int maxExp, int LevelMarkID)
{
    local string strPerc;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    self.CharName = CharName;
    Edit[1].SetData(CharName);
    LevelImg = NewLabelComponent(fbLevelImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cm_00);
    GameMgr.GetLevelImage(Level, LevelMarkID, LevelImg.BackgroundImage);
    strPerc = string(int((float(curExp - startExp) / float(maxExp - startExp)) * 100.0000000));
    expbar.SetData(curExp - startExp, maxExp - startExp, (string(curExp) $ "/") $ string(maxExp), ("(" $ strPerc) $ "%)");
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
    self.ClanName = ClanName;
    Edit[2].SetData(ClanName);
    // End:0xAE
    if(ClanName == "")
    {
        ButtonOK.DisableMe();
        LabelClanMark.SetVisibility(false);
        LabelClanMark.SetData(0, 0, 0);        
    }
    else
    {
        ButtonOK.EnableMe();
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
    CharacterModel.ChangeWeapon(MainWeaponID, MainWeaponPartID);
    CharacterModel.ChangeEquipItemByItemID(HelmetID, FaceID, AcceID, AFBodyID, RSABodyID);
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

function SetData(string CharName, string ClanName, int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int HelmetID, int FaceID, int AcceID, int AFBodyID, int RSABodyID, CharInfo stCharInfo)
{
    local int nPerc, startExp, maxExp;
    local string strPerc;
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    self.CharName = CharName;
    Edit[1].SetData(CharName);
    LevelImg = NewLabelComponent(fbLevelImg, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.cm_00);
    GameMgr.GetLevelImage(stCharInfo.Level, stCharInfo.LevelMarkID, LevelImg.BackgroundImage);
    // End:0xE4
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
    // End:0x1B5
    if(ClanName == "none")
    {
        ClanName = "";
    }
    self.ClanName = ClanName;
    Edit[2].SetData(ClanName);
    Edit[3].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[3], string(stCharInfo.Ranking)));
    // End:0x237
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
    // End:0x345
    if((stCharInfo.ClanWin + stCharInfo.ClanLose) == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(stCharInfo.ClanWin) / float(stCharInfo.ClanWin + stCharInfo.ClanLose)) * 100.0000000);
    }
    Edit[10].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[4], string(stCharInfo.ClanWin + stCharInfo.ClanLose), string(stCharInfo.ClanWin), string(stCharInfo.ClanLose), string(nPerc)));
    // End:0x406
    if((stCharInfo.ClanKill == 0) && stCharInfo.ClanDeath == 0)
    {
        nPerc = 0;        
    }
    else
    {
        nPerc = int((float(stCharInfo.ClanKill) / float(stCharInfo.ClanDeath)) * 100.0000000);
    }
    Edit[11].SetData(Class'Engine.BTCustomDrawHK'.static.FormatString(strEdit[11], string(stCharInfo.ClanKill), string(stCharInfo.ClanAssist), string(stCharInfo.ClanDeath), string(nPerc)));
    // End:0x49D
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
    CharacterModel.ChangeWeapon(MainWeaponID, MainWeaponPartID);
    CharacterModel.ChangeEquipItemByItemID(HelmetID, FaceID, AcceID, AFBodyID, RSABodyID);
    //return;    
}

function InitializeLeftPanel()
{
    EdgeLine = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    EdgeLine.bUseAWinPos = true;
    EdgeLine.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(186.0000000, 70.0000000, 503.0000000, 683.0000000);
    EdgeLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_line;
    EdgeLine.InitComponent(Controller, self);
    AppendComponent(EdgeLine);
    AFTeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(189.0000000, 73.0000000, 500.0000000, 680.0000000);
    AFTeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.1000000;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(189.0000000, 73.0000000, 500.0000000, 680.0000000);
    RSATeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.1000000;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(304), AFTeamBG.AWinPos.Y1 + float(536)), 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(57), AFTeamBG.AWinPos.Y1 + float(536)), 0.8000000);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(25), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(143), AFTeamBG.AWinPos.Y1 + float(571)), 0.8000000);
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(166), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(283), AFTeamBG.AWinPos.Y1 + float(571)), 0.8000000);
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = EdgeLine.AWinPos;
    CharacterModel.AWinPos.X1 += float(2);
    CharacterModel.AWinPos.Y1 += float(2);
    CharacterModel.AWinPos.X2 -= float(2);
    CharacterModel.AWinPos.Y2 -= float(2);
    UIModel = BTModelHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTModelHK', CharacterModel.AWinPos));
    UIModel.cModel = CharacterModel;
    //return;    
}

function InitializeRightPanel()
{
    local int i;
    local FloatBox fb;

    i = 0;
    J0x07:

    // End:0x114 [Loop If]
    if(i < 14)
    {
        Label[i] = NewLabelComponent(fbLabel[i], Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        // End:0xAD
        if((((i == 0) || i == 5) || i == 7) || i == 8)
        {
            // [Explicit Continue]
            goto J0x10A;
        }
        Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawTextArrayHK', fbEdit[i]));
        Edit[i].CaptionDrawType = 0;
        Edit[i].BackgroundImage.Image = none;
        J0x10A:

        i++;
        // [Loop Continue]
        goto J0x07;
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    //return;    
}

function Internal_OnOpen()
{
    //return;    
}

defaultproperties
{
    strAF="AF"
    strRSA="RSA"
    strLabel[0]="?????????????"
    strLabel[1]="????????"
    strLabel[2]="????"
    strLabel[3]="????????-????????"
    strLabel[4]="Record"
    strLabel[5]="EXP"
    strLabel[6]="???"
    strLabel[8]="??????????????"
    strLabel[9]="????????"
    strLabel[10]="??????????????"
    strLabel[11]="Clan War Data"
    strLabel[12]="H/S Clan"
    strLabel[13]="???"
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
    strEdit[3]="??? 0%"
    strEdit[4]="%0???? %1??? / %2??? (%3%)"
    strEdit[6]="%0?????"
    strEdit[11]="%0??? %1????? %2??? (K/D %3%)"
    strEdit[12]="%0Head Shot (%1%)"
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
    fbBackgroundImage=(X1=158.0000000,Y1=16.0000000,X2=866.0000000,Y2=753.0000000)
    fbTopLine=(X1=178.0000000,Y1=36.0000000,X2=846.0000000,Y2=62.0000000)
    fbBottomLine=(X1=178.0000000,Y1=690.0000000,X2=846.0000000,Y2=733.0000000)
    fbButtonOK=(X1=391.0000000,Y1=696.0000000,X2=510.0000000,Y2=728.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=696.0000000,X2=634.0000000,Y2=728.0000000)
    strTitle="?????????????"
    strOK="??????????"
    strCancel="??????"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowUserDetailInfoHK.Internal_OnOpen
    OnPreDraw=BTWindowUserDetailInfoHK.Internal_OnPreDraw
}