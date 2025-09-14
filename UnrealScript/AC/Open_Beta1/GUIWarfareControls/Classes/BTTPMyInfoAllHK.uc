class BTTPMyInfoAllHK extends BTTabPanelHK
    editinlinenew
    instanced;

var BTROModelNew CharacterModel;
var FloatBox fbBackgroundPanel[2];
var export editinline BTOwnerDrawImageHK BackgroundPanel[2];
var() automated ButtonGroups InvenGroup;
var() automated BTStretchedImageHK BackgroundImage;
var() automated FloatBox fbButtonWeapon[10];
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
    // End:0x2B
    if(CharacterModel != none)
    {
        UIModel.cModel = CharacterModel;
    }
    // End:0x46
    if(bLRMousePressed)
    {
        CharacterModel.SetRotationLeft();        
    }
    else
    {
        // End:0x5E
        if(bRRMousePressed)
        {
            CharacterModel.SetRotationRight();
        }
    }
    return false;
    //return;    
}

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

function UpdateServerTime(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < 10)
    {
        ButtonWeapon[i].itemBox.UpdateTime(D);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
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

function Refresh()
{
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    J0x36:

    // End:0xCC [Loop If]
    if(i < 4)
    {
        instanceInfo = none;
        ItemInfo = none;
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0xC2
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0xC2
            if(ItemInfo != none)
            {
                ButtonWeapon[i].SetData(ItemInfo, instanceInfo);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    i = 18;
    J0xD4:

    // End:0x172 [Loop If]
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
                ButtonWeapon[(i - 18) + 4].SetData(ItemInfo, instanceInfo);
            }
        }
        i++;
        // [Loop Continue]
        goto J0xD4;
    }
    CharacterModel.ChangeEquipItem(GameMgr);
    CharacterModel.ChangeWeapon(ButtonWeapon[0].itemBox.instanceInfo.ItemID, ButtonWeapon[0].itemBox.instanceInfo.PartID, ButtonWeapon[0].itemBox.instanceInfo.PaintID);
    //return;    
}

function InitializeLeftPanel()
{
    local int i;

    BackgroundPanel[0] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[0].X1, fbBackgroundPanel[0].Y1 + float(24), fbBackgroundPanel[0].X2, fbBackgroundPanel[0].Y2), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    EdgeLine = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    EdgeLine.bUseAWinPos = true;
    EdgeLine.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 332.0000000, 728.0000000);
    EdgeLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_edge_line;
    EdgeLine.InitComponent(Controller, self);
    AppendComponent(EdgeLine);
    AFTeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    AFTeamBG.bUseAWinPos = true;
    AFTeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(20.0000000, 120.0000000, 329.0000000, 725.0000000);
    AFTeamBG.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_AF_cha;
    AFTeamBG.RenderWeight = 0.1000000;
    AFTeamBG.InitComponent(Controller, self);
    AppendComponent(AFTeamBG);
    RSATeamBG = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK';
    RSATeamBG.bUseAWinPos = true;
    RSATeamBG.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(20.0000000, 120.0000000, 329.0000000, 725.0000000);
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
    i = 0;
    J0x56D:

    // End:0x657 [Loop If]
    if(i < 10)
    {
        ButtonWeapon[i] = new Class'GUIWarfareControls_Decompressed.BTItemBoxButtonHK';
        ButtonWeapon[i].bUseAWinPos = true;
        ButtonWeapon[i].AWinPos = fbButtonWeapon[i];
        ButtonWeapon[i].DefaultSlotName[0] = strButtonWeapon[i];
        ButtonWeapon[i].InitComponent(Controller, self);
        AppendComponent(ButtonWeapon[i]);
        ButtonWeapon[i].itemBox.ChangeState(0);
        InvenGroup.AddButton(ButtonWeapon[i]);
        i++;
        // [Loop Continue]
        goto J0x56D;
    }
    ButtonWeapon[2].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[3].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_grnd;
    ButtonWeapon[4].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_hlmt;
    ButtonWeapon[5].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_face;
    ButtonWeapon[6].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_gogl;
    ButtonWeapon[7].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[8].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_clth;
    ButtonWeapon[9].DefaultSlotImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_slot_class;
    ChatBox = new Class'GUIWarfareControls_Decompressed.BTAutoScrollListHK';
    ChatBox.bUseAWinPos = true;
    ChatBox.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(22.0000000, 666.0000000 + float(18), 324.0000000, 720.0000000);
    ChatBox.RenderWeight = 0.7100000;
    ChatBox.InitComponent(Controller, self);
    AppendComponent(ChatBox);
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y1 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.X2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.AWinPos.Y2 = 0.0000000;
    ChatBox.MultiColumnList.MyScrollBar.ApplyAWinPos();
    UIModel = new Class'GUIWarfareControls_Decompressed.BTModelHK';
    UIModel.bAcceptsInput = false;
    UIModel.bUseAWinPos = true;
    UIModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
    UIModel.RenderWeight = 0.7000000;
    UIModel.InitComponent(Controller, self);
    AppendComponent(UIModel);
    CharacterModel = Controller.ViewportOwner.Actor.Level.Spawn(Class'GUIWarfareControls_Decompressed.BTROModelNew');
    CharacterModel.Init();
    CharacterModel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(17.0000000, 117.0000000, 330.0000000, 726.0000000);
    UIModel.cModel = CharacterModel;
    Refresh();
    //return;    
}

function InitializeRightPanel()
{
    local int i;
    local FloatBox fb, fbScrollBar;

    BackgroundPanel[1] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[1].X1, fbBackgroundPanel[1].Y1 + float(24), fbBackgroundPanel[1].X2, fbBackgroundPanel[1].Y2), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(fbBackgroundPanel[1].X1, fbBackgroundPanel[1].Y1 + float(24), fbBackgroundPanel[1].X2, fbBackgroundPanel[1].Y2);
    fbScrollBar = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((fbBackgroundPanel[1].X2 - float(1)) - float(14), (fbBackgroundPanel[1].Y1 + float(1)) + float(24), fbBackgroundPanel[1].X2 - float(1), fbBackgroundPanel[1].Y2 - float(1));
    TPBasic = BTTPMyInfoBasicHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPMyInfoBasicHK', fb));
    TPStat = BTTPMyInfoStatHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPMyInfoStatHK', fb));
    TPRank = BTTPMyInfoRankHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPMyInfoRankHK', fb));
    TPPanel[0] = TPBasic;
    TPFriendly = BTTPMyInfoFriendlyUserHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTTPMyInfoFriendlyUserHK', fb));
    TPPanel[1] = TPStat;
    TPPanel[2] = TPFriendly;
    TPPanel[3] = TPRank;
    i = 0;
    J0x1CA:

    // End:0x3A3 [Loop If]
    if(i < 4)
    {
        fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox((fbBackgroundPanel[1].X1 + float(100 * i)) + float(i), fbBackgroundPanel[1].Y1 - float(2), (fbBackgroundPanel[1].X1 + float(100 * (i + 1))) + float(i), fbBackgroundPanel[1].Y1 + float(24));
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
        i++;
        // [Loop Continue]
        goto J0x1CA;
    }
    TabControl.SetVisiblePanel(0);
    TPPanel[0].Internal_OnClick(none);
    VisiblePanelIdx = 0;
    //return;    
}

function bool ButtonTab_OnClick(GUIComponent Sender)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x80 [Loop If]
    if(lp1 < TabControl.Buttons.Length)
    {
        // End:0x76
        if(TabControl.Buttons[lp1] == Sender)
        {
            TabControl.SetVisiblePanel(lp1);
            TPPanel[lp1].Internal_OnClick(none);
            VisiblePanelIdx = lp1;
            // [Explicit Break]
            goto J0x80;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x80:

    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    InitializeLeftPanel();
    InitializeRightPanel();
    //return;    
}

defaultproperties
{
    fbBackgroundPanel[0]=(X1=10.0000000,Y1=86.0000000,X2=500.0000000,Y2=736.0000000)
    fbBackgroundPanel[1]=(X1=510.0000000,Y1=86.0000000,X2=1014.0000000,Y2=736.0000000)
    // Reference: ButtonGroups'GUIWarfareControls_Decompressed.BTTPMyInfoAllHK.mgroups'
    begin object name="mgroups" class=GUIWarfareControls_Decompressed.ButtonGroups
    end object
    InvenGroup=mgroups
    fbButtonWeapon[0]=(X1=337.0000000,Y1=117.0000000,X2=493.0000000,Y2=202.0000000)
    fbButtonWeapon[1]=(X1=337.0000000,Y1=204.0000000,X2=493.0000000,Y2=289.0000000)
    fbButtonWeapon[2]=(X1=337.0000000,Y1=291.0000000,X2=413.0000000,Y2=376.0000000)
    fbButtonWeapon[3]=(X1=415.0000000,Y1=291.0000000,X2=493.0000000,Y2=376.0000000)
    fbButtonWeapon[4]=(X1=337.0000000,Y1=465.0000000,X2=493.0000000,Y2=550.0000000)
    fbButtonWeapon[5]=(X1=337.0000000,Y1=552.0000000,X2=413.0000000,Y2=637.0000000)
    fbButtonWeapon[6]=(X1=415.0000000,Y1=552.0000000,X2=493.0000000,Y2=637.0000000)
    fbButtonWeapon[7]=(X1=337.0000000,Y1=639.0000000,X2=413.0000000,Y2=724.0000000)
    fbButtonWeapon[8]=(X1=415.0000000,Y1=639.0000000,X2=493.0000000,Y2=724.0000000)
    fbButtonWeapon[9]=(X1=337.0000000,Y1=378.0000000,X2=413.0000000,Y2=463.0000000)
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
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPMyInfoAllHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
    end object
    TabControl=mTabControl
    OnPreDraw=BTTPMyInfoAllHK.Internal_OnPreDraw
}