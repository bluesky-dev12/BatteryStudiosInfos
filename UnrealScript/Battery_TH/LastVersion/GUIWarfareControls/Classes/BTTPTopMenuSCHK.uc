class BTTPTopMenuSCHK extends GUITabPanel
    editinlinenew
    instanced;

var() automated BTStretchedImageHK BGImage;
var export editinline BTOwnerDrawCaptionButtonHK QuickJoin;
var export editinline BTOwnerDrawCaptionButtonHK QuickSetup;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRefresh;
var export editinline BTOwnerDrawCaptionButtonHK Grade;
var export editinline BTOwnerDrawCaptionButtonHK Option;
var export editinline BTOwnerDrawCaptionButtonHK Exit;
var localized string strQuickJoin;
var localized string strQuickSetup;
var localized string strRefresh;
//var delegate<HeaderButton_OnClick> __HeaderButton_OnClick__Delegate;

delegate bool HeaderButton_OnClick(GUIComponent Sender)
{
    //return;    
}

function bool TopMenuButton_OnClick(GUIComponent Sender)
{
    return HeaderButton_OnClick(Sender);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local Image btimg;

    super(GUIPanel).InitComponent(MyController, myOwner);
    btimg = Class'Engine.BTCustomDrawHK'.static.MakeImage(64, 64, 28, none);
    QuickJoin = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    QuickSetup = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonRefresh = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Grade = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Option = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Exit = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
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

    // End:0x1DD [Loop If]
    if(i < 5)
    {
        Grade.buttonImage[i] = btimg;
        Option.buttonImage[i] = btimg;
        Exit.buttonImage[i] = btimg;
        QuickJoin.FontSize[i] = 12;
        QuickSetup.FontSize[i] = 12;
        ButtonRefresh.FontSize[i] = 11;
        i++;
        // [Loop Continue]
        goto J0x134;
    }
    QuickJoin.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(436.0000000, 15.0000000, 555.0000000, 60.0000000);
    QuickSetup.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(553.0000000, 15.0000000, 616.0000000, 60.0000000);
    ButtonRefresh.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(715.0000000, 403.0000000, 839.0000000, 440.0000000);
    Grade.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(817.0000000, 6.0000000, 881.0000000, 70.0000000);
    Option.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(923.0000000, 20.0000000, 967.0000000, 74.0000000);
    Exit.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(968.0000000, 20.0000000, 1012.0000000, 74.0000000);
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
    ButtonRefresh.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonRefresh.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ServerSelPageBtn_on;
    ButtonRefresh.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ServerSelPageBtn_n;
    ButtonRefresh.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ServerSelPageBtn_cli;
    ButtonRefresh.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ServerSelPageBtn_block;
    Grade.ButtonID = 3;
    Grade.__OnClick__Delegate = TopMenuButton_OnClick;
    Grade.InitComponent(Controller, self);
    AppendComponent(Grade);
    Option.ButtonID = 5;
    Option.__OnClick__Delegate = TopMenuButton_OnClick;
    Option.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_on;
    Option.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_n;
    Option.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_cli;
    Option.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.OptionBtn_block;
    Option.InitComponent(Controller, self);
    AppendComponent(Option);
    Exit.ButtonID = 6;
    Exit.__OnClick__Delegate = TopMenuButton_OnClick;
    Exit.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ExitBtn_n;
    Exit.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ExitBtn_on;
    Exit.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ExitBtn_n;
    Exit.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ExitBtn_cli;
    Exit.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ExitBtn_block;
    AppendComponent(Exit);
    QuickJoin.DisableMe();
    QuickJoin.SetVisibility(false);
    QuickSetup.DisableMe();
    QuickSetup.SetVisibility(false);
    Grade.DisableMe();
    Grade.SetVisibility(false);
    //return;    
}

defaultproperties
{
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPTopMenuSCHK.mBGImage'
    begin object name="mBGImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BGImage=mBGImage
    strQuickJoin="QuickJoin"
    strQuickSetup="QuickSetup"
    strRefresh="Refresh"
}