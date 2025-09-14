/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowUserDetailInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:38
 *	Functions:18
 *
 *******************************************************************************/
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
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[14];
var export editinline BTOwnerDrawImageHK Label[14];
var localized string strEdit[14];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEdit[14];
var export editinline BTOwnerDrawTextArrayHK Edit[14];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLevelImg;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelClanMark;
var export editinline BTOwnerDrawImageHK LevelImg;
var export editinline BTLabelClanMarkHK LabelClanMark;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbSelfIntroduction;
var export editinline BTAutoScrollListHK SelfIntroduction;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEquipWeapon[2];
var export editinline BTItemBoxButtonHK EquipWeapon[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbExpBar;
var export editinline BTExpBarHK expbar;
var localized string strOnLine;
var localized string strOffLine;
var export editinline BTOwnerDrawImageHK strCharInfo;
var FloatBox fbCharInfo;
var localized string strDefaultSelfIntro;
var localized string strNoRankState;

function ButtonLR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bLRMousePressed = true;
}

function ButtonLR_OnRelease(GUIComponent Sender)
{
    bLRMousePressed = false;
}

function ButtonRR_OnPressed(GUIComponent Sender, bool bRepeat)
{
    bRRMousePressed = true;
}

function ButtonRR_OnRelease(GUIComponent Sender)
{
    bRRMousePressed = false;
}

function bool ButtonAF_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(true);
    CharacterModel.ChangeTeam(0);
    return true;
}

function bool ButtonRSA_OnClick(GUIComponent Sender)
{
    ChangeVisibleModel(false);
    CharacterModel.ChangeTeam(1);
    return true;
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
    // End:0x69
    else
    {
        // End:0x69
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
}

function ChangeVisibleModel(bool bAF)
{
    bVisibleAFModel = bAF;
    // End:0x3b
    if(bVisibleAFModel)
    {
        AFTeamBG.bVisible = true;
        RSATeamBG.bVisible = false;
    }
    // End:0x5d
    else
    {
        AFTeamBG.bVisible = false;
        RSATeamBG.bVisible = true;
    }
}

function SetSelfIntro(string Intro)
{
    SelfIntroduction.Clear();
    // End:0x33
    if(Intro == "")
    {
        SelfIntroduction.AddLineRow(none, strDefaultSelfIntro);
    }
    // End:0x48
    else
    {
        SelfIntroduction.AddLineRow(none, Intro);
    }
}

function SetMyInfo(string CharName, string ClanName, int Level, int curExp, int startExp, int maxExp, int LevelMarkID)
{
    local string strPerc;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    self.CharName = CharName;
    Edit[1].SetData(CharName);
    LevelImg = NewLabelComponent(fbLevelImg, class'BTUIResourcePoolHK'.default.cm_00);
    GameMgr.GetLevelImage(Level, LevelMarkID, LevelImg.BackgroundImage);
    strPerc = string(int(float(curExp - startExp) / float(maxExp - startExp) * 100.0));
    expbar.SetData(curExp - startExp, maxExp - startExp, string(curExp) $ "/" $ string(maxExp), "(" $ strPerc $ "%)");
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
    // End:0xae
    if(ClanName == "")
    {
        ButtonOK.DisableMe();
        LabelClanMark.SetVisibility(false);
        LabelClanMark.SetData(0, 0, 0);
    }
    // End:0xf1
    else
    {
        ButtonOK.EnableMe();
        LabelClanMark.SetVisibility(true);
        LabelClanMark.SetData(ClanPattern, ClanBG, ClanBL, false, ClanLevel);
    }
}

function SetEquipItemInfo(int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int HelmetID, int FaceID, int AcceID, int AFBodyID, int RSABodyID)
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(MainWeaponID);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = MainWeaponPartID;
    EquipWeapon[0].SetData(ItemInfo, instanceInfo);
    ItemInfo = GameMgr.FindUIItem(SubWeaponID);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = SubWeaponPartID;
    EquipWeapon[1].SetData(ItemInfo, instanceInfo);
    CharacterModel.ChangeWeapon(MainWeaponID, MainWeaponPartID);
    CharacterModel.ChangeEquipItemByItemID(HelmetID, FaceID, AcceID, AFBodyID, RSABodyID);
}

function SetRankingInfo(int Ranking, int Win, int Lose, int DisCon)
{
    local float fPerc;

    Edit[3].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[3], string(Ranking)));
    // End:0x50
    if(Win + Lose == 0)
    {
        fPerc = 0.0;
    }
    // End:0x74
    else
    {
        fPerc = 100.0 * float(Win) / float(Win + Lose);
    }
    Edit[4].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[4], string(Win + Lose), string(Win), string(Lose), string(int(fPerc))));
    Edit[6].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[6], string(DisCon)));
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
    LevelImg = NewLabelComponent(fbLevelImg, class'BTUIResourcePoolHK'.default.cm_00);
    GameMgr.GetLevelImage(stCharInfo.Level, stCharInfo.LevelMarkID, LevelImg.BackgroundImage);
    // End:0xe4
    if(stCharInfo.Level >= 2)
    {
        startExp = GameMgr.LevelInfoParams[stCharInfo.Level - 1].nAccumExp;
    }
    // End:0xeb
    else
    {
        startExp = 0;
    }
    maxExp = GameMgr.LevelInfoParams[stCharInfo.Level].nAccumExp;
    strPerc = string(int(float(stCharInfo.Exp - startExp) / float(maxExp - startExp) * 100.0));
    expbar.SetData(stCharInfo.Exp - startExp, maxExp - startExp, string(stCharInfo.Exp) $ "/" $ string(maxExp), "(" $ strPerc $ "%)");
    // End:0x1b5
    if(ClanName == "none")
    {
        ClanName = "";
    }
    self.ClanName = ClanName;
    Edit[2].SetData(ClanName);
    Edit[3].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[3], string(stCharInfo.Ranking)));
    // End:0x237
    if(stCharInfo.Win + stCharInfo.Lose == 0)
    {
        nPerc = 0;
    }
    // End:0x26c
    else
    {
        nPerc = int(100.0 * float(stCharInfo.Win) / float(stCharInfo.Win + stCharInfo.Lose));
    }
    Edit[4].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[4], string(stCharInfo.Win + stCharInfo.Lose), string(stCharInfo.Win), string(stCharInfo.Lose), string(nPerc)));
    Edit[6].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[6], string(stCharInfo.DisCon)));
    Edit[9].SetData(string(stCharInfo.ClanContribue));
    // End:0x345
    if(stCharInfo.ClanWin + stCharInfo.ClanLose == 0)
    {
        nPerc = 0;
    }
    // End:0x37a
    else
    {
        nPerc = int(float(stCharInfo.ClanWin) / float(stCharInfo.ClanWin + stCharInfo.ClanLose) * 100.0);
    }
    Edit[10].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[4], string(stCharInfo.ClanWin + stCharInfo.ClanLose), string(stCharInfo.ClanWin), string(stCharInfo.ClanLose), string(nPerc)));
    // End:0x406
    if(stCharInfo.ClanKill == 0 && stCharInfo.ClanDeath == 0)
    {
        nPerc = 0;
    }
    // End:0x42f
    else
    {
        nPerc = int(float(stCharInfo.ClanKill) / float(stCharInfo.ClanDeath) * 100.0);
    }
    Edit[11].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[11], string(stCharInfo.ClanKill), string(stCharInfo.ClanAssist), string(stCharInfo.ClanDeath), string(nPerc)));
    // End:0x49d
    if(stCharInfo.ClanHeadshot == 0)
    {
        nPerc = 0;
    }
    // End:0x4c6
    else
    {
        nPerc = int(float(stCharInfo.ClanHeadshot) / float(stCharInfo.ClanKill) * 100.0);
    }
    Edit[12].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[12], string(stCharInfo.ClanHeadshot), string(nPerc)));
    Edit[13].SetData(class'BTCustomDrawHK'.static.FormatString(strEdit[6], string(0)));
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    ItemInfo = GameMgr.FindUIItem(MainWeaponID);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = MainWeaponPartID;
    EquipWeapon[0].SetData(ItemInfo, instanceInfo);
    ItemInfo = GameMgr.FindUIItem(SubWeaponID);
    instanceInfo = new class'wItemBoxInstanceHK';
    instanceInfo.PartID = SubWeaponPartID;
    EquipWeapon[1].SetData(ItemInfo, instanceInfo);
    CharacterModel.ChangeWeapon(MainWeaponID, MainWeaponPartID);
    CharacterModel.ChangeEquipItemByItemID(HelmetID, FaceID, AcceID, AFBodyID, RSABodyID);
}

function InitializeLeftPanel()
{
    EdgeLine = new class'BTOwnerDrawImageHK';
    EdgeLine.bUseAWinPos = true;
    EdgeLine.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(186.0, 70.0, 503.0, 683.0);
    EdgeLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_edge_line;
    EdgeLine.InitComponent(Controller, self);
    AppendComponent(EdgeLine);
    AFTeamBG = new class'BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(189.0, 73.0, 500.0, 680.0);
    AFTeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.10;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new class'BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(189.0, 73.0, 500.0, 680.0);
    RSATeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.10;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(303), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(56), AFTeamBG.AWinPos.Y1 + float(514)), 0.80);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(25), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(143), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(166), AFTeamBG.AWinPos.Y1 + float(525), AFTeamBG.AWinPos.X1 + float(283), AFTeamBG.AWinPos.Y1 + float(571)), 0.80);
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = EdgeLine.AWinPos;
    CharacterModel.AWinPos.X1 += float(2);
    CharacterModel.AWinPos.Y1 += float(2);
    CharacterModel.AWinPos.X2 -= float(2);
    CharacterModel.AWinPos.Y2 -= float(2);
    UIModel = BTModelHK(NewComponent(new class'BTModelHK', CharacterModel.AWinPos));
    UIModel.cModel = CharacterModel;
}

function InitializeRightPanel()
{
    local int i;
    local FloatBox fb;

    i = 0;
    J0x07:
    // End:0x114 [While If]
    if(i < 14)
    {
        Label[i] = NewLabelComponent(fbLabel[i], class'BTUIResourcePoolHK'.default.empty);
        Label[i].CaptionDrawType = 0;
        Label[i].Caption = strLabel[i];
        // End:0xad
        if(i == 0 || i == 5 || i == 7 || i == 8)
        {
        }
        // End:0x10a
        else
        {
            Edit[i] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTOwnerDrawTextArrayHK', fbEdit[i]));
            Edit[i].CaptionDrawType = 0;
            Edit[i].BackgroundImage.Image = none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Label[0].CaptionDrawType = 3;
    Label[0].SetFontSizeAll(11);
    Label[0].CaptionPadding[0] = 9;
    Label[0].BackgroundImage = class'BTUIResourcePoolHK'.default.img_ptitl_back;
    Label[7].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
    Label[8].CaptionDrawType = 3;
    Label[8].SetFontSizeAll(11);
    Label[8].CaptionPadding[0] = 9;
    Label[8].BackgroundImage = class'BTUIResourcePoolHK'.default.img_ptitl_back;
    EquipWeapon[0] = BTItemBoxButtonHK(NewComponent(new class'BTItemBoxButtonHK', fbEquipWeapon[0]));
    EquipWeapon[1] = BTItemBoxButtonHK(NewComponent(new class'BTItemBoxButtonHK', fbEquipWeapon[1]));
    fb = class'BTCustomDrawHK'.static.MakeResizeBox(fbSelfIntroduction, -1, -2);
    fb.X2 -= float(15);
    SelfIntroduction = BTAutoScrollListHK(NewComponent(new class'BTAutoScrollListHK', fb));
    SelfIntroduction.MultiColumnList.MyScrollBar.bUseAWinPos = true;
    SelfIntroduction.MultiColumnList.MyScrollBar.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(0.0, 0.0, 0.0, 0.0);
    SelfIntroduction.MultiColumnList.MyScrollBar.ApplyAWinPos();
    SelfIntroduction.bAutoShowScrollBar = true;
    SelfIntroduction.SelectImage = class'BTUIResourcePoolHK'.default.empty;
    expbar = BTExpBarHK(NewComponent(new class'BTExpBarHK', fbExpBar));
    LabelClanMark = BTLabelClanMarkHK(NewComponent(new class'BTLabelClanMarkHK', fbLabelClanMark));
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
}

function Internal_OnOpen();

defaultproperties
{
    strAF="AF"
    strRSA="RSA"
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
    fbLabel[0]=(X1=512.0,Y1=67.0,X2=846.0,Y2=93.0)
    fbLabel[1]=(X1=521.0,Y1=102.0,X2=846.0,Y2=733.0)
    fbLabel[2]=(X1=521.0,Y1=136.0,X2=846.0,Y2=733.0)
    fbLabel[3]=(X1=521.0,Y1=170.0,X2=846.0,Y2=733.0)
    fbLabel[4]=(X1=521.0,Y1=204.0,X2=846.0,Y2=733.0)
    fbLabel[5]=(X1=521.0,Y1=238.0,X2=846.0,Y2=733.0)
    fbLabel[6]=(X1=521.0,Y1=272.0,X2=846.0,Y2=733.0)
    fbLabel[7]=(X1=516.0,Y1=294.0,X2=833.0,Y2=388.0)
    fbLabel[8]=(X1=512.0,Y1=493.0,X2=846.0,Y2=519.0)
    fbLabel[9]=(X1=521.0,Y1=528.0,X2=846.0,Y2=733.0)
    fbLabel[10]=(X1=521.0,Y1=562.0,X2=846.0,Y2=733.0)
    fbLabel[11]=(X1=521.0,Y1=596.0,X2=846.0,Y2=733.0)
    fbLabel[12]=(X1=521.0,Y1=630.0,X2=846.0,Y2=733.0)
    fbLabel[13]=(X1=521.0,Y1=664.0,X2=846.0,Y2=733.0)
    strEdit[3]="Place: %0"
    strEdit[4]="%0 Battles %1 W / %2 L (%3%)"
    strEdit[6]="%0 Times"
    strEdit[11]="%0 Kills %1 Assists %2 Deaths (K/D %3%)"
    strEdit[12]="%0 Headshots (%1%)"
    fbEdit[1]=(X1=659.0,Y1=102.0,X2=846.0,Y2=733.0)
    fbEdit[2]=(X1=659.0,Y1=136.0,X2=846.0,Y2=733.0)
    fbEdit[3]=(X1=618.0,Y1=170.0,X2=846.0,Y2=733.0)
    fbEdit[4]=(X1=618.0,Y1=204.0,X2=846.0,Y2=733.0)
    fbEdit[5]=(X1=618.0,Y1=238.0,X2=846.0,Y2=733.0)
    fbEdit[6]=(X1=618.0,Y1=272.0,X2=846.0,Y2=733.0)
    fbEdit[7]=(X1=522.0,Y1=300.0,X2=826.0,Y2=382.0)
    fbEdit[9]=(X1=618.0,Y1=528.0,X2=846.0,Y2=733.0)
    fbEdit[10]=(X1=618.0,Y1=562.0,X2=846.0,Y2=733.0)
    fbEdit[11]=(X1=618.0,Y1=596.0,X2=846.0,Y2=733.0)
    fbEdit[12]=(X1=618.0,Y1=630.0,X2=846.0,Y2=733.0)
    fbEdit[13]=(X1=618.0,Y1=664.0,X2=846.0,Y2=733.0)
    fbLevelImg=(X1=618.0,Y1=93.0,X2=650.0,Y2=125.0)
    fbLabelClanMark=(X1=618.0,Y1=127.0,X2=650.0,Y2=159.0)
    fbSelfIntroduction=(X1=516.0,Y1=294.0,X2=833.0,Y2=388.0)
    fbEquipWeapon[0]=(X1=516.0,Y1=398.0,X2=672.0,Y2=483.0)
    fbEquipWeapon[1]=(X1=677.0,Y1=398.0,X2=833.0,Y2=483.0)
    fbExpBar=(X1=618.0,Y1=236.0,X2=770.0,Y2=254.0)
    fbCharInfo=(X1=320.0,Y1=36.0,X2=846.0,Y2=62.0)
    strNoRankState="None"
    fbBackgroundImage=(X1=158.0,Y1=16.0,X2=866.0,Y2=753.0)
    fbTopLine=(X1=178.0,Y1=36.0,X2=846.0,Y2=62.0)
    fbBottomLine=(X1=178.0,Y1=690.0,X2=846.0,Y2=733.0)
    fbButtonOK=(X1=391.0,Y1=696.0,X2=510.0,Y2=728.0)
    fbButtonCancel=(X1=515.0,Y1=696.0,X2=634.0,Y2=728.0)
    strTitle="Character Details"
    strOK="Clan Info"
    strCancel="OK"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    OnOpen=Internal_OnOpen
    OnPreDraw=Internal_OnPreDraw
}