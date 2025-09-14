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
var FloatBox fbModel;
var FloatBox fbModelAF;
var FloatBox fbModelRSA;
var FloatBox fbModelLeft;
var FloatBox fbModelRight;
var string CharName;
var string ClanName;
var export editinline BTTPUserDetailInfo UserDetailInfo;
var FloatBox fbUserInfoButton;
var FloatBox fbClanInfoButton;
var localized string strUserInfoButton;
var localized string strClanInfoButton;
var() automated TabControlMocker TabControl;
var export editinline BTTPUserDetailInfoNew UserDetailInfoNew;
var export editinline BTTPUserClanInfo UserClanInfo;

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
    UserDetailInfo.SetSelfIntro(Intro);
    //return;    
}

function SetMyInfo(string CharName, string ClanName, int Level, int CurExp, int startExp, int maxExp, int LevelMarkID)
{
    UserDetailInfo.SetMyInfo(CharName, ClanName, Level, CurExp, startExp, maxExp, LevelMarkID);
    self.CharName = CharName;
    //return;    
}

function SetClanInfo(string ClanName, int ClanPattern, int ClanBG, int ClanBL, optional int ClanLevel)
{
    // End:0x18
    if(ClanName == "none")
    {
        ClanName = "";
    }
    self.ClanName = ClanName;
    UserDetailInfo.SetClanInfo(ClanName, ClanPattern, ClanBG, ClanBL, ClanLevel);
    // End:0x6E
    if(ClanName == "")
    {
        ButtonOK.DisableMe();        
    }
    else
    {
        ButtonOK.EnableMe();
    }
    //return;    
}

function SetRankingInfo(int Ranking, int Win, int Lose, int DisCon)
{
    UserDetailInfo.SetRankingInfo(Ranking, Win, Lose, DisCon);
    //return;    
}

function SetData(string CharName, string ClanName, int MainWeaponID, int MainWeaponPartID, int SubWeaponID, int SubWeaponPartID, int AFBodyID, int RSABodyID, CharInfo stCharInfo)
{
    local int HelmetID, AcceID, BackPackID, PouChID, Camouflage;

    UserDetailInfo.SetData(CharName, ClanName, MainWeaponID, MainWeaponPartID, SubWeaponID, SubWeaponPartID, AFBodyID, RSABodyID, stCharInfo);
    self.CharName = CharName;
    SetModelData(MainWeaponID, MainWeaponPartID, HelmetID, AcceID, BackPackID, PouChID, Camouflage, AFBodyID, RSABodyID);
    //return;    
}

function SetModelData(int MainWeaponID, int MainWeaponPartID, int HelmetID, int AcceID, int BackPackID, int PouChID, int Camouflage, int AFBodyID, int RSABodyID)
{
    CharacterModel.ChangeWeapon(MainWeaponID, MainWeaponPartID);
    CharacterModel.ChangeEquipItemByItemID(HelmetID, AcceID, BackPackID, PouChID, Camouflage, AFBodyID, RSABodyID);
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
    AFTeamBG.AWinPos = fbModel;
    AFTeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.1000000;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = fbModel;
    RSATeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.1000000;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(fbModelLeft, 0.8000000);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(fbModelRight, 0.8000000);
    ButtonRR.SetDefaultRRotateButtonImage();
    ButtonRR.__OnMousePressed__Delegate = ButtonRR_OnPressed;
    ButtonRR.__OnMouseRelease__Delegate = ButtonRR_OnRelease;
    ButtonAF = NewButtonComponent(fbModelAF, 0.8000000);
    ButtonAF.Caption = strAF;
    ButtonAF.__OnClick__Delegate = ButtonAF_OnClick;
    ButtonRSA = NewButtonComponent(fbModelRSA, 0.8000000);
    ButtonRSA.Caption = strRSA;
    ButtonRSA.__OnClick__Delegate = ButtonRSA_OnClick;
    ButtonAF.SetDefaultFontColor();
    ButtonAF.SetDefaultLRotateAFButtonImage();
    ButtonRSA.SetDefaultFontColor();
    ButtonRSA.SetDefaultRRotateRSAButtonImage();
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = fbModel;
    UIModel = BTModelHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTModelHK', CharacterModel.AWinPos));
    UIModel.cModel = CharacterModel;
    //return;    
}

function InitializeRightPanel()
{
    UserDetailInfo = BTTPUserDetailInfo(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPUserDetailInfo', Class'Engine.BTCustomDrawHK'.static.MakeEmptyBox()));
    //return;    
}

function bool OnUnableChangedTab(int TabIndex)
{
    // End:0x22
    if(TabIndex == 1)
    {
        // End:0x22
        if(UserClanInfo.UserClanName == "")
        {
            return true;
        }
    }
    return false;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    __OnPreDraw__Delegate = Internal_OnPreDraw;
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
    fbModel=(X1=189.0000000,Y1=73.0000000,X2=500.0000000,Y2=680.0000000)
    fbModelAF=(X1=214.0000000,Y1=598.0000000,X2=341.0000000,Y2=644.0000000)
    fbModelRSA=(X1=364.0000000,Y1=598.0000000,X2=472.0000000,Y2=644.0000000)
    fbModelLeft=(X1=441.0000000,Y1=556.0000000,X2=492.0000000,Y2=587.0000000)
    fbModelRight=(X1=194.0000000,Y1=556.0000000,X2=245.0000000,Y2=587.0000000)
    strUserInfoButton="Basic Info."
    strClanInfoButton="Clan Info."
    fbBackgroundImage=(X1=158.0000000,Y1=16.0000000,X2=866.0000000,Y2=753.0000000)
    fbTopLine=(X1=178.0000000,Y1=36.0000000,X2=846.0000000,Y2=62.0000000)
    fbBottomLine=(X1=178.0000000,Y1=690.0000000,X2=846.0000000,Y2=733.0000000)
    fbButtonOK=(X1=391.0000000,Y1=696.0000000,X2=510.0000000,Y2=728.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=696.0000000,X2=634.0000000,Y2=728.0000000)
    CloseWeb=true
    strTitle="Character Details"
    strOK="Clan Info"
    strCancel="OK"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    OnOpen=BTWindowUserDetailInfoHK.Internal_OnOpen
}