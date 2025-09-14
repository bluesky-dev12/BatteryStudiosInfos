/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMyInfoAllHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:33
 *	Functions:14
 *
 *******************************************************************************/
class BTTPMyInfoAllHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTROModelNew CharacterModel;
var FloatBox fbBackgroundPanel[2];
var export editinline BTOwnerDrawImageHK BackgroundPanel[2];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify ButtonGroups InvenGroup;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonWeapon[10];
var localized string strButtonWeapon[10];
var export editinline BTItemBoxButtonHK ButtonWeapon[10];
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
var export editinline BTModelHK UIModel;
var export editinline BTAutoScrollListHK ChatBox;
var localized string strButtonTab[4];
var export editinline TabControlMocker TabControl;
var FloatBox fbButtonTab[4];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[4];
var FloatBox fbTPPanel;
var export editinline BTTPOptionBaseHK TPPanel[4];
var int VisiblePanelIdx;
var export editinline BTTPMyInfoBasicHK TPBasic;
var export editinline BTTPMyInfoStatHK TPStat;
var export editinline BTTPMyInfoRankHK TPRank;
var export editinline BTTPMyInfoFriendlyUserHK TPFriendly;

function bool Internal_OnPreDraw(Canvas C)
{
    ChangeVisibleModel(bVisibleAFModel);
    // End:0x2b
    if(CharacterModel != none)
    {
        UIModel.cModel = CharacterModel;
    }
    // End:0x46
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();
    }
    // End:0x5e
    else
    {
        // End:0x5e
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
}

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

function UpdateServerTime(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < 10)
    {
        ButtonWeapon[i].itemBox.UpdateTime(D);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
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

function Refresh()
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:
    // End:0xcc [While If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xc2
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xc2
            if(ItemInfo != none)
            {
                ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    i = 18;
    J0xd4:
    // End:0x172 [While If]
    if(i < 24)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x168
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x168
            if(ItemInfo != none)
            {
                ButtonWeapon[i - 18 + 4].SetData(ItemInfo, instanceInfo);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd4;
    }
    CharacterModel.ChangeEquipItem(GameMgr);
    CharacterModel.ChangeWeapon(ButtonWeapon[0].itemBox.instanceInfo.ItemID, ButtonWeapon[0].itemBox.instanceInfo.PartID, ButtonWeapon[0].itemBox.instanceInfo.PaintID);
}

function InitializeLeftPanel()
{
    local int i;

    BackgroundPanel[0] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[0].X1, fbBackgroundPanel[0].Y1 + float(24), fbBackgroundPanel[0].X2, fbBackgroundPanel[0].Y2), class'BTUIResourcePoolHK'.default.panel_1);
    EdgeLine = new class'BTOwnerDrawImageHK';
    EdgeLine.bUseAWinPos = true;
    EdgeLine.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 332.0, 728.0);
    EdgeLine.BackgroundImage = class'BTUIResourcePoolHK'.default.img_edge_line;
    EdgeLine.InitComponent(Controller, self);
    AppendComponent(EdgeLine);
    AFTeamBG = new class'BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    AFTeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.10;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new class'BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(20.0, 120.0, 329.0, 725.0);
    RSATeamBG.BackgroundImage = class'BTUIResourcePoolHK'.default.img_RSA_cha;
    RSATeamBG.RenderWeight = 0.10;
    RSATeamBG.InitComponent(Controller, self);
    AppendComponent(RSATeamBG);
    bVisibleAFModel = true;
    ButtonLR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(252), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(304), AFTeamBG.AWinPos.Y1 + float(536)), 0.80);
    ButtonLR.SetDefaultLRotateButtonImage();
    ButtonLR.__OnMousePressed__Delegate = ButtonLR_OnPressed;
    ButtonLR.__OnMouseRelease__Delegate = ButtonLR_OnRelease;
    ButtonRR = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(AFTeamBG.AWinPos.X1 + float(5), AFTeamBG.AWinPos.Y1 + float(483), AFTeamBG.AWinPos.X1 + float(57), AFTeamBG.AWinPos.Y1 + float(536)), 0.80);
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
    i = 0;
    J0x56d:
    // End:0x657 [While If]
    if(i < 10)
    {
        ButtonWeapon[i] = new class'BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonWeapon[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x56d;
    }
    ButtonWeapon[2].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[3].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[4].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_hlmt;
    ButtonWeapon[5].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_face;
    ButtonWeapon[6].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_gogl;
    ButtonWeapon[7].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[8].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[9].DefaultSlotImage = class'BTUIResourcePoolHK'.default.img_slot_class;
    ChatBox = new class'BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(22.0, 666.0 + float(18), 324.0, 720.0);
    ChatBox.RenderWeight = 0.710;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    UIModel = new class'BTModelHK';
    UIModel.bAcceptsInput = false;
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0);
    UIModel.RenderWeight = 0.70;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(class'BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(17.0, 117.0, 330.0, 726.0);
    UIModel.cModel = CharacterModel;
    Refresh();
}

function InitializeRightPanel()
{
    local int i;
    local FloatBox fb, fbScrollBar;

    BackgroundPanel[1] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[1].X1, fbBackgroundPanel[1].Y1 + float(24), fbBackgroundPanel[1].X2, fbBackgroundPanel[1].Y2), class'BTUIResourcePoolHK'.default.panel_1);
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[1].X1, fbBackgroundPanel[1].Y1 + float(24), fbBackgroundPanel[1].X2, fbBackgroundPanel[1].Y2);
    fbScrollBar = class'BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[1].X2 - float(1) - float(14), fbBackgroundPanel[1].Y1 + float(1) + float(24), fbBackgroundPanel[1].X2 - float(1), fbBackgroundPanel[1].Y2 - float(1));
    TPBasic = BTTPMyInfoBasicHK(NewComponent(new class'BTTPMyInfoBasicHK', fb));
    TPStat = BTTPMyInfoStatHK(NewComponent(new class'BTTPMyInfoStatHK', fb));
    TPRank = BTTPMyInfoRankHK(NewComponent(new class'BTTPMyInfoRankHK', fb));
    TPPanel[0] = TPBasic;
    TPFriendly = BTTPMyInfoFriendlyUserHK(NewComponent(new class'BTTPMyInfoFriendlyUserHK', fb));
    TPPanel[1] = TPStat;
    TPPanel[2] = TPFriendly;
    TPPanel[3] = TPRank;
    i = 0;
    J0x1ca:
    // End:0x3a3 [While If]
    if(i < 4)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[1].X1 + float(100 * i) + float(i), fbBackgroundPanel[1].Y1 - float(2), fbBackgroundPanel[1].X1 + float(100 * i + 1) + float(i), fbBackgroundPanel[1].Y1 + float(24));
        ButtonTab[i] = NewButtonComponent(fb);
        ButtonTab[i].SetDefaultBigTabButtonImage();
        ButtonTab[i].SetDefaultTabButtonFontColor();
        ButtonTab[i].Caption = strButtonTab[i];
        TPPanel[i].ACLList.ImageList.bForceScrollBarPosition = true;
        TPPanel[i].ACLList.ImageList.MyScrollBar.AWinPos = fbScrollBar;
        TPPanel[i].ACLList.ImageList.MyScrollBar.ApplyAWinPos();
        TPPanel[i].PostChangeScrollBarPos();
        TabControl.BindTabButtonAndPanel(ButtonTab[i], TPPanel[i]);
        ButtonTab[i].__OnClick__Delegate = ButtonTab_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1ca;
    }
    TabControl.SetVisiblePanel(0);
    TPPanel[0].Internal_OnClick(none);
    VisiblePanelIdx = 0;
}

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x80 [While If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0x76
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            TPPanel[lp1].Internal_OnClick(none);
            VisiblePanelIdx = lp1;
        }
        // End:0x80
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
}

defaultproperties
{
    fbBackgroundPanel[0]=(X1=10.0,Y1=86.0,X2=500.0,Y2=736.0)
    fbBackgroundPanel[1]=(X1=510.0,Y1=86.0,X2=1014.0,Y2=736.0)
    InvenGroup=mgroups
    fbButtonWeapon[0]=(X1=337.0,Y1=117.0,X2=493.0,Y2=202.0)
    fbButtonWeapon[1]=(X1=337.0,Y1=204.0,X2=493.0,Y2=289.0)
    fbButtonWeapon[2]=(X1=337.0,Y1=291.0,X2=413.0,Y2=376.0)
    fbButtonWeapon[3]=(X1=415.0,Y1=291.0,X2=493.0,Y2=376.0)
    fbButtonWeapon[4]=(X1=337.0,Y1=465.0,X2=493.0,Y2=550.0)
    fbButtonWeapon[5]=(X1=337.0,Y1=552.0,X2=413.0,Y2=637.0)
    fbButtonWeapon[6]=(X1=415.0,Y1=552.0,X2=493.0,Y2=637.0)
    fbButtonWeapon[7]=(X1=337.0,Y1=639.0,X2=413.0,Y2=724.0)
    fbButtonWeapon[8]=(X1=415.0,Y1=639.0,X2=493.0,Y2=724.0)
    fbButtonWeapon[9]=(X1=337.0,Y1=378.0,X2=413.0,Y2=463.0)
    strButtonWeapon[0]="Primary"
    strButtonWeapon[1]="Secondary"
    strButtonWeapon[2]="Thrown"
    strButtonWeapon[3]="Thrown"
    strButtonWeapon[4]="Helmet"
    strButtonWeapon[5]="Face"
    strButtonWeapon[6]="Accessory"
    strButtonWeapon[7]="AF Uniform"
    strButtonWeapon[8]="RSA Uniform"
    strAF="AF"
    strRSA="RSA"
    strButtonTab[0]="Basic Info"
    strButtonTab[1]="Record"
    strButtonTab[2]="Friends & Clan"
    strButtonTab[3]="Rank"
    TabControl=mTabControl
    OnPreDraw=Internal_OnPreDraw
}