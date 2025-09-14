/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPWarehouseHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:6
 *
 *******************************************************************************/
class BTTPWarehouseHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strMainMenu[4];
var localized string strSubMenuAll[3];
var localized string strSubMenuWeapon[4];
var localized string strSubMenuEquip[5];
var localized string strSubMenuSpecial[2];
var array<string> astrSubMenuAll;
var array<string> astrSubMenuWeapon;
var array<string> astrSubMenuEquip;
var array<string> astrSubMenuSpecial;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl[2];
var export editinline BTOwnerDrawCaptionButtonHK MainButton[4];
var export editinline BTOwnerDrawCaptionButtonHK SubButton[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelItemList;
var export editinline BTOwnerDrawImageHK LabelItemList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPItemList;
var export editinline BTTPItemListHK TPItemList;
var localized string strMenuButton[5];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMenuButton[5];
var export editinline BTOwnerDrawCaptionButtonHK MenuButton[5];
var export editinline BTItemInfoHorzBoxHK InfoBox;

function bool MainButton_OnClick(GUIComponent Sender)
{
    MainTabSelect(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    return true;
}

function bool SubButton_OnClick(GUIComponent Sender)
{
    TabControl[1].SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    ChangeItemList(TabControl[0].GetCurrentTabIndex(), BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
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
            // End:0x7c
            break;
        // End:0x58
        case 2:
            ChangeSubButton(astrSubMenuEquip);
            // End:0x7c
            break;
        // End:0x6b
        case 3:
            ChangeSubButton(astrSubMenuSpecial);
            // End:0x7c
            break;
        // End:0xffff
        default:
            ChangeSubButton(astrSubMenuAll);
            // End:0x7c Break;
            break;
    }
    ChangeItemList(tabi, subtabi);
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
                TPItemList.ItemList.ShowWeaponWithEquip();
                // End:0x73
                break;
            // End:0x50
            case 1:
                TPItemList.ItemList.ShowWeaponNoBootyWithEquip();
                // End:0x73
                break;
            // End:0x70
            case 2:
                TPItemList.ItemList.ShowWeaponBootyWithEquip();
                // End:0x73
                break;
            // End:0xffff
            default:
                // End:0x1c0 Break;
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
                // End:0x1c0 Break;
                break;
            }
    }
    // End:0x1c0
    if(mainTab == 2)
    {
        switch(subTab)
        {
            // End:0x13e
            case 0:
                TPItemList.ItemList.ShowEquipItem();
                // End:0x1c0
                break;
            // End:0x15d
            case 1:
                TPItemList.ItemList.ShowEquipHeadItem();
                // End:0x1c0
                break;
            // End:0x17d
            case 2:
                TPItemList.ItemList.ShowEquipFaceItem();
                // End:0x1c0
                break;
            // End:0x19d
            case 3:
                TPItemList.ItemList.ShowEquipAccessoryItem();
                // End:0x1c0
                break;
            // End:0x1bd
            case 4:
                TPItemList.ItemList.ShowEquipSpCharItem();
                // End:0x1c0
                break;
            // End:0xffff
            default:
            }
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
    if(i < 5)
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
    if(i < 4)
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
    if(i < 5)
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
    astrSubMenuAll.Length = 3;
    i = 0;
    J0x7b6:
    // End:0x7e7 [While If]
    if(i < astrSubMenuAll.Length)
    {
        astrSubMenuAll[i] = strSubMenuAll[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7b6;
    }
    astrSubMenuWeapon.Length = 4;
    i = 0;
    J0x7f7:
    // End:0x828 [While If]
    if(i < astrSubMenuWeapon.Length)
    {
        astrSubMenuWeapon[i] = strSubMenuWeapon[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7f7;
    }
    astrSubMenuEquip.Length = 5;
    i = 0;
    J0x838:
    // End:0x869 [While If]
    if(i < astrSubMenuEquip.Length)
    {
        astrSubMenuEquip[i] = strSubMenuEquip[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x838;
    }
    astrSubMenuSpecial.Length = 2;
    i = 0;
    J0x879:
    // End:0x8aa [While If]
    if(i < astrSubMenuSpecial.Length)
    {
        astrSubMenuSpecial[i] = strSubMenuSpecial[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x879;
    }
    ChangeSubButton(astrSubMenuAll);
}

defaultproperties
{
    strMainMenu[0]="All"
    strMainMenu[1]="Weapons"
    strMainMenu[2]="Gear"
    strMainMenu[3]="Special"
    strSubMenuAll[0]="All"
    strSubMenuAll[1]="General"
    strSubMenuAll[2]="Loot"
    strSubMenuWeapon[0]="All"
    strSubMenuWeapon[1]="Primary"
    strSubMenuWeapon[2]="Secondary"
    strSubMenuWeapon[3]="Thrown"
    strSubMenuEquip[0]="All"
    strSubMenuEquip[1]="Helmets"
    strSubMenuEquip[2]="Faces"
    strSubMenuEquip[3]="Accessories"
    strSubMenuEquip[4]="Special Uniforms"
    strSubMenuSpecial[0]="Undecided"
    strSubMenuSpecial[1]="Undecided"
    TabControl[0]=mTabControl
    TabControl=mTabControl2
    fbLabelItemList=(X1=510.0,Y1=137.0,X2=1014.0,Y2=558.0)
    fbTPItemList=(X1=517.0,Y1=167.0,X2=1011.0,Y2=515.0)
    strMenuButton[0]="Sell"
    strMenuButton[1]="Modify"
    strMenuButton[2]="Repair All"
    strMenuButton[3]="Repair"
    strMenuButton[4]="Equip"
    fbMenuButton[0]=(X1=519.0,Y1=520.0,X2=613.0,Y2=552.0)
    fbMenuButton[1]=(X1=617.0,Y1=520.0,X2=711.0,Y2=552.0)
    fbMenuButton[2]=(X1=715.0,Y1=520.0,X2=809.0,Y2=552.0)
    fbMenuButton[3]=(X1=813.0,Y1=520.0,X2=907.0,Y2=552.0)
    fbMenuButton[4]=(X1=911.0,Y1=520.0,X2=1004.0,Y2=552.0)
}