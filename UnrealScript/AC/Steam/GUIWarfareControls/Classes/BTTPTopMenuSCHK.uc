/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPTopMenuSCHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:3
 *
 *******************************************************************************/
class BTTPTopMenuSCHK extends GUITabPanel
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BGImage;
var export editinline BTOwnerDrawCaptionButtonHK QuickJoin;
var export editinline BTOwnerDrawCaptionButtonHK QuickSetup;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRefresh;
var export editinline BTOwnerDrawCaptionButtonHK Grade;
var export editinline BTOwnerDrawCaptionButtonHK Option;
var export editinline BTOwnerDrawCaptionButtonHK Exit;
var localized string strQuickJoin;
var localized string strQuickSetup;
var localized string strRefresh;
var delegate<HeaderButton_OnClick> __HeaderButton_OnClick__Delegate;

delegate bool HeaderButton_OnClick(GUIComponent Sender);
function bool TopMenuButton_OnClick(GUIComponent Sender)
{
    return HeaderButton_OnClick(Sender);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local Image btimg;

    super(GUIPanel).InitComponent(MyController, myOwner);
    btimg = class'BTCustomDrawHK'.static.MakeImage(64, 64, 28, none);
    QuickJoin = new class'BTOwnerDrawCaptionButtonHK';
    QuickSetup = new class'BTOwnerDrawCaptionButtonHK';
    ButtonRefresh = new class'BTOwnerDrawCaptionButtonHK';
    Grade = new class'BTOwnerDrawCaptionButtonHK';
    Option = new class'BTOwnerDrawCaptionButtonHK';
    Exit = new class'BTOwnerDrawCaptionButtonHK';
    QuickJoin.Caption = strQuickJoin;
    QuickSetup.Caption = strQuickSetup;
    ButtonRefresh.Caption = strRefresh;
    ButtonRefresh.CaptionDrawType = 4;
    QuickJoin.SetDefaultButtonImage();
    QuickSetup.SetDefaultButtonImage();
    ButtonRefresh.SetDefaultButtonImage();
    QuickJoin.SetDefaultBigButtonFontColor();
    QuickSetup.SetDefaultBigButtonFontColor();
    ButtonRefresh.SetDefaultFontColor();
    i = 0;
    J0x134:
    // End:0x1dd [While If]
    if(i < 5)
    {
        Grade.buttonImage[i] = btimg;
        Option.buttonImage[i] = btimg;
        Exit.buttonImage[i] = btimg;
        QuickJoin.FontSize[i] = 12;
        QuickSetup.FontSize[i] = 12;
        ButtonRefresh.FontSize[i] = 11;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x134;
    }
    QuickJoin.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(436.0, 15.0, 555.0, 60.0);
    QuickSetup.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(553.0, 15.0, 616.0, 60.0);
    ButtonRefresh.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(715.0, 403.0, 839.0, 440.0);
    Grade.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(817.0, 6.0, 881.0, 70.0);
    Option.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(923.0, 20.0, 967.0, 74.0);
    Exit.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(968.0, 20.0, 1012.0, 74.0);
    QuickJoin.ButtonID = 0;
    QuickJoin.__OnClick__Delegate = TopMenuButton_OnClick;
    QuickJoin.InitComponent(Controller, self);
    AppendComponent(QuickJoin);
    QuickJoin.SetDefaultBigButtonImage();
    QuickSetup.ButtonID = 1;
    QuickSetup.__OnClick__Delegate = TopMenuButton_OnClick;
    QuickSetup.InitComponent(Controller, self);
    AppendComponent(QuickSetup);
    QuickSetup.SetDefaultBigButtonImage();
    ButtonRefresh.ButtonID = 2;
    ButtonRefresh.__OnClick__Delegate = TopMenuButton_OnClick;
    ButtonRefresh.InitComponent(Controller, self);
    AppendComponent(ButtonRefresh);
    ButtonRefresh.buttonImage[0] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonRefresh.buttonImage[1] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_on;
    ButtonRefresh.buttonImage[2] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonRefresh.buttonImage[3] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_cli;
    ButtonRefresh.buttonImage[4] = class'BTUIResourcePoolHK'.default.ServerSelPageBtn_block;
    Grade.ButtonID = 3;
    Grade.__OnClick__Delegate = TopMenuButton_OnClick;
    Grade.InitComponent(Controller, self);
    AppendComponent(Grade);
    Option.ButtonID = 5;
    Option.__OnClick__Delegate = TopMenuButton_OnClick;
    Option.buttonImage[0] = class'BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[1] = class'BTUIResourcePoolHK'.default.OptionBtn_on;
    Option.buttonImage[2] = class'BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[3] = class'BTUIResourcePoolHK'.default.OptionBtn_cli;
    Option.buttonImage[4] = class'BTUIResourcePoolHK'.default.OptionBtn_block;
    Option.InitComponent(Controller, self);
    AppendComponent(Option);
    Exit.ButtonID = 6;
    Exit.__OnClick__Delegate = TopMenuButton_OnClick;
    Exit.buttonImage[0] = class'BTUIResourcePoolHK'.default.ExitBtn_n;
    Exit.buttonImage[1] = class'BTUIResourcePoolHK'.default.ExitBtn_on;
    Exit.buttonImage[2] = class'BTUIResourcePoolHK'.default.ExitBtn_n;
    Exit.buttonImage[3] = class'BTUIResourcePoolHK'.default.ExitBtn_cli;
    Exit.buttonImage[4] = class'BTUIResourcePoolHK'.default.ExitBtn_block;
    Exit.InitComponent(Controller, self);
    AppendComponent(Exit);
    QuickJoin.DisableMe();
    QuickJoin.SetVisibility(false);
    QuickSetup.DisableMe();
    QuickSetup.SetVisibility(false);
    Grade.DisableMe();
    Grade.SetVisibility(false);
}

defaultproperties
{
    begin object name=mBGImage class=BTStretchedImageHK
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: BTStretchedImageHK'BTTPTopMenuSCHK.mBGImage'
    BGImage=mBGImage
    strQuickJoin="Quick Join"
    strQuickSetup="Settings"
    strRefresh="Refresh"
}