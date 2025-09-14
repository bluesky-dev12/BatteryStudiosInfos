/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPWarehouseQuickSlotHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:26
 *	Functions:7
 *
 *******************************************************************************/
class BTTPWarehouseQuickSlotHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strMainMenu[3];
var localized string strSubMenuAll[3];
var localized string strSubMenuWeapon[4];
var localized string strSubMenuSkill[3];
var array<string> astrSubMenuAll;
var array<string> astrSubMenuWeapon;
var array<string> astrSubMenuSkill;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[3];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelPoint;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelCash;
var export editinline BTOwnerDrawImageHK LabelPoint;
var export editinline BTOwnerDrawImageHK LabelCash;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelP;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelC;
var export editinline BTOwnerDrawImageHK LabelP;
var export editinline BTOwnerDrawImageHK LabelC;
var localized string strMenuButton[7];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMenuButton[5];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[5];
var export editinline BTItemInfoHorzBoxHK InfoBox;

function bool MainButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function MainTabSelect(int tabi, optional int subtabi)
{
    TabControl[0].SetVisiblePanel(tabi);
    TabControl[1].SetVisiblePanel(subtabi);
    switch(tabi)
    {
        // End:0x45
        case 1:
            ChangeSubButton(astrSubMenuWeapon);
            // End:0x69
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuSkill);
            // End:0x69
            break;
        // End:0xffff
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0x69 Break;
            break;
    }
    ChangeItemList(tabi, subtabi);
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TPItemList.ItemList.ImageList.SetTopItem(0);
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function ChangeItemList(int mainTab, int subTab)
{
    // End:0x76
    if(mainTab == 0)
    {
        switch(subTab)
        {
            // End:0x31
            case 0:
                TPItemList.ItemList.ShowWeaponWithSkill();
                // End:0x73
                break;
            // End:0x50
            case 1:
                TPItemList.ItemList.ShowWeaponNoBootyWithSkill();
                // End:0x73
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowWeaponBootyWithSkill();
                // End:0x73
                break;
            // End:0xffff
            default:
                // End:0x180 Break;
                break;
            }
    }
    // End:0x10c
    if(mainTab == 1)
    {
        switch(subTab)
        {
            // End:0xa7
            case 0:
                TPItemList.ItemList.ShowWeaponAll();
                // End:0x109
                break;
            // End:0xc6
            case 1:
                TPItemList.ItemList.ShowMainWeapon();
                // End:0x109
                break;
            // End:0xe6
            case 2:
                TPItemList.ItemList.ShowSubWeapon();
                // End:0x109
                break;
            // End:0x106
            case 3:
                TPItemList.ItemList.ShowHandThrowWeapon();
                // End:0x109
                break;
            // End:0xffff
            default:
                // End:0x180 Break;
                break;
            }
    }
    // End:0x180
    if(mainTab == 2)
    {
        switch(subTab)
        {
            // End:0x13e
            case 0:
                TPItemList.ItemList.ShowSkillAll();
                // End:0x180
                break;
            // End:0x15d
            case 1:
                TPItemList.ItemList.ShowActiveSkill();
                // End:0x180
                break;
            // End:0x17d
            case 2:
                TPItemList.ItemList.ShowPassiveSkill();
                // End:0x180
                break;
            // End:0xffff
            default:
            }
            SetInfoBox();
}

function SetInfoBox(optional int Index)
{
    InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[Index]).instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
}

function bool ChangeSubButton(array<string> strTemp)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x57 [While If]
    if(i < strTemp.Length)
    {
        SubButton[i].SetVisibility(true);
        SubButton[i].Caption = strTemp[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = strTemp.Length;
    J0x63:
    // End:0xa6 [While If]
    if(i < 4)
    {
        SubButton[i].SetVisibility(false);
        SubButton[i].Caption = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LabelItemList = new class'BTOwnerDrawImageHK';
    LabelItemList.bUseAWinPos = true;
    LabelItemList.AWinPos = fbLabelItemList;
    LabelItemList.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelItemList.InitComponent(Controller, self);
    AppendComponent(LabelItemList);
    TPItemList = new class'BTTPItemListHK';
    TPItemList.bUseAWinPos = true;
    TPItemList.AWinPos = fbTPItemList;
    TPItemList.InitComponent(Controller, self);
    AppendComponent(TPItemList);
    i = 0;
    J0xdc:
    // End:0x2f3 [While If]
    if(i < 3)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(100 * i) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = AWinPos.X1 + float(100 * i + 1) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        MainButton[i] = serverButton;
        MainButton[i].Caption = strMainMenu[i];
        TabControl[0].BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xdc;
    }
    i = 0;
    J0x2fa:
    // End:0x5b5 [While If]
    if(i < 4)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bVisible = false;
        serverButton.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(7) + float(81 * i) + float(i);
        fb.Y1 = AWinPos.Y1 + float(5) + float(23);
        fb.X2 = AWinPos.X1 + float(7) + float(81 * i + 1) + float(i);
        fb.Y2 = AWinPos.Y1 + float(5) + float(23) + float(20);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.buttonImage[0] = class'BTUIResourcePoolHK'.default.butt_m_n;
        serverButton.buttonImage[1] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[2] = class'BTUIResourcePoolHK'.default.butt_m_on;
        serverButton.buttonImage[3] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        serverButton.SetDefaultMTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        SubButton[i] = serverButton;
        TabControl[1].BindTabButtonAndPanel(SubButton[i], TPItemList);
        SubButton[i].ButtonID = i;
        SubButton[i].__OnClick__Delegate = SubButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2fa;
    }
    TabControl[0].SetVisiblePanel(0);
    TabControl[1].SetVisiblePanel(0);
    InfoBox = new class'BTItemInfoHorzBoxHK';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0;
    fb.Y1 = 564.0;
    fb.X2 = 510.0 + float(504);
    fb.Y2 = 564.0 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    i = 0;
    J0x683:
    // End:0x7a6 [While If]
    if(i < 5)
    {
        MenuButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        MenuButton[i].Caption = strMenuButton[i];
        MenuButton[i].bUseAWinPos = true;
        MenuButton[i].AWinPos = fbMenuButton[i];
        MenuButton[i].SetFontSizeAll(12);
        MenuButton[i].SetDefaultFontColor();
        MenuButton[i].SetDefaultButtonImage();
        MenuButton[i].RenderWeight = 0.60;
        MenuButton[i].ButtonID = i;
        MenuButton[i].InitComponent(Controller, self);
        AppendComponent(MenuButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x683;
    }
    LabelCash = new class'BTOwnerDrawImageHK';
    LabelCash.bUseAWinPos = true;
    LabelCash.AWinPos = fbLabelCash;
    LabelCash.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelCash.SetFontSizeAll(10);
    LabelCash.FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 153, 0, byte(255));
    LabelCash.InitComponent(Controller, self);
    AppendComponent(LabelCash);
    LabelPoint = new class'BTOwnerDrawImageHK';
    LabelPoint.bUseAWinPos = true;
    LabelPoint.AWinPos = fbLabelPoint;
    LabelPoint.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    LabelPoint.SetFontSizeAll(10);
    LabelPoint.FontColor[0] = class'Canvas'.static.MakeColor(172, byte(255), 252, byte(255));
    LabelPoint.InitComponent(Controller, self);
    AppendComponent(LabelPoint);
    LabelC = new class'BTOwnerDrawImageHK';
    LabelC.bUseAWinPos = true;
    LabelC.AWinPos = fbLabelC;
    LabelC.BackgroundImage = class'BTUIResourcePoolHK'.default.img_cash;
    LabelC.InitComponent(Controller, self);
    AppendComponent(LabelC);
    LabelP = new class'BTOwnerDrawImageHK';
    LabelP.bUseAWinPos = true;
    LabelP.AWinPos = fbLabelP;
    LabelP.BackgroundImage = class'BTUIResourcePoolHK'.default.img_point;
    LabelP.InitComponent(Controller, self);
    AppendComponent(LabelP);
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x9f4:
    // End:0xa25 [While If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9f4;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0xa35:
    // End:0xa66 [While If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa35;
    }
    astrSubMenuSkill.Length = 3;
    i = 0;
    J0xa76:
    // End:0xaa7 [While If]
    if(i < astrSubMenuSkill.Length)
    {
        astrSubMenuSkill[i] = strSubMenuSkill[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa76;
    }
    ChangeSubButton(astrSubMenuAll);
}

defaultproperties
{
    strMainMenu[0]="All"
    strMainMenu[1]="Weapons"
    strMainMenu[2]="Skills"
    strSubMenuAll[0]="All"
    strSubMenuAll[1]="General"
    strSubMenuAll[2]="Loot"
    strSubMenuWeapon[0]="All"
    strSubMenuWeapon[1]="Primary"
    strSubMenuWeapon[2]="Secondary"
    strSubMenuWeapon[3]="Thrown"
    strSubMenuSkill[0]="All"
    strSubMenuSkill[1]="Attack Skills"
    strSubMenuSkill[2]="Passive Skills"
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    fbTPItemList=(X1=517.0,Y1=167.0,X2=1011.0,Y2=515.0)
    fbLabelItemList=(X1=510.0,Y1=137.0,X2=1014.0,Y2=558.0)
    fbLabelPoint=(X1=510.0,Y1=81.0,X2=757.0,Y2=104.0)
    fbLabelCash=(X1=767.0,Y1=81.0,X2=1014.0,Y2=104.0)
    fbLabelP=(X1=519.0,Y1=85.0,X2=534.0,Y2=100.0)
    fbLabelC=(X1=776.0,Y1=85.0,X2=791.0,Y2=100.0)
    strMenuButton[0]="Sell"
    strMenuButton[1]="Modify"
    strMenuButton[2]="Repair All"
    strMenuButton[3]="Repair"
    strMenuButton[4]="Equip"
    strMenuButton[5]="Used"
    strMenuButton[6]="Cancel"
    fbMenuButton[0]=(X1=519.0,Y1=520.0,X2=613.0,Y2=552.0)
    fbMenuButton[1]=(X1=617.0,Y1=520.0,X2=711.0,Y2=552.0)
    fbMenuButton[2]=(X1=715.0,Y1=520.0,X2=809.0,Y2=552.0)
    fbMenuButton[3]=(X1=813.0,Y1=520.0,X2=907.0,Y2=552.0)
    fbMenuButton[4]=(X1=911.0,Y1=520.0,X2=1004.0,Y2=552.0)
}