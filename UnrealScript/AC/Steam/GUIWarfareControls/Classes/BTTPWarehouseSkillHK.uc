/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPWarehouseSkillHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:19
 *	Functions:4
 *
 *******************************************************************************/
class BTTPWarehouseSkillHK extends GUITabPanel
    editinlinenew
    instanced;

var localized string strMainMenu[3];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var export editinline BTOwnerDrawCaptionButtonHK MainButton[3];
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
var localized string strMenuButton;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbMenuButton;
var export editinline BTOwnerDrawCaptionButtonHK MenuButton;
var export editinline BTItemInfoHorzBoxHK InfoBox;

function bool MainButton_OnClick(GUIComponent Sender)
{
    TabControl.SetVisiblePanel(BTOwnerDrawCaptionButtonHK(Sender).ButtonID);
    RefreshItemList();
    SetInfoBox();
    return true;
}

function RefreshItemList()
{
    switch(TabControl.GetCurrentTabIndex())
    {
        // End:0x30
        case 0:
            TPItemList.ItemList.ShowSkillAll();
            // End:0x72
            break;
        // End:0x4f
        case 1:
            TPItemList.ItemList.ShowActiveSkill();
            // End:0x72
            break;
        // End:0x6f
        case 2:
            TPItemList.ItemList.ShowPassiveSkill();
            // End:0x72
            break;
        // End:0xffff
        default:
}

function SetInfoBox()
{
    InfoBox.SetData(BTROItemBoxHK(TPItemList.ItemList.DataList[0]).ItemInfo, BTROItemBoxHK(TPItemList.ItemList.DataList[0]).instanceInfo, none, none);
    InfoBox.ItemBoxView.itemBox.ChangeState(0);
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
    TPItemList.ItemList.bShowOnlyInventory = true;
    i = 0;
    J0xf6:
    // End:0x30b [While If]
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
        TabControl.BindTabButtonAndPanel(MainButton[i], TPItemList);
        MainButton[i].ButtonID = i;
        MainButton[i].__OnClick__Delegate = MainButton_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf6;
    }
    TabControl.SetVisiblePanel(0);
    InfoBox = new class'BTItemInfoHorzBoxHK';
    InfoBox.bUseAWinPos = true;
    fb.X1 = 510.0;
    fb.Y1 = 564.0;
    fb.X2 = 510.0 + float(504);
    fb.Y2 = 564.0 + float(172);
    InfoBox.AWinPos = fb;
    InfoBox.InitComponent(Controller, self);
    AppendComponent(InfoBox);
    MenuButton = new class'BTOwnerDrawCaptionButtonHK';
    MenuButton.Caption = strMenuButton;
    MenuButton.bUseAWinPos = true;
    MenuButton.AWinPos = fbMenuButton;
    MenuButton.SetFontSizeAll(12);
    MenuButton.SetDefaultFontColor();
    MenuButton.SetDefaultButtonImage();
    MenuButton.RenderWeight = 0.60;
    MenuButton.ButtonID = 4;
    MenuButton.InitComponent(Controller, self);
    AppendComponent(MenuButton);
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
}

defaultproperties
{
    strMainMenu[0]="All"
    strMainMenu[1]="Attack Skill"
    strMainMenu[2]="Passive Skill"
    TabControl=mTabControl
    fbTPItemList=(X1=517.0,Y1=167.0,X2=1011.0,Y2=515.0)
    fbLabelItemList=(X1=510.0,Y1=137.0,X2=1014.0,Y2=558.0)
    fbLabelPoint=(X1=510.0,Y1=81.0,X2=757.0,Y2=104.0)
    fbLabelCash=(X1=767.0,Y1=81.0,X2=1014.0,Y2=104.0)
    fbLabelP=(X1=519.0,Y1=85.0,X2=534.0,Y2=100.0)
    fbLabelC=(X1=776.0,Y1=85.0,X2=791.0,Y2=100.0)
    strMenuButton="Equip"
    fbMenuButton=(X1=911.0,Y1=520.0,X2=1004.0,Y2=552.0)
}