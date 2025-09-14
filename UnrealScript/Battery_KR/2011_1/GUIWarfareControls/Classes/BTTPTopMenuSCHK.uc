class BTTPTopMenuSCHK extends GUITabPanel
    editinlinenew
    instanced;

var() automated BTStretchedImageHK BGImage;
var export editinline BTOwnerDrawCaptionButtonHK QuickJoin;
var export editinline BTOwnerDrawCaptionButtonHK QuickSetup;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRefresh;
var export editinline BTOwnerDrawCaptionButtonHK Grade;
var export editinline BTOwnerDrawCaptionButtonHK Help;
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
    Help = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Option = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    Exit = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    QuickJoin.Caption = strQuickJoin;
    QuickSetup.Caption = strQuickSetup;
    ButtonRefresh.Caption = strRefresh;
    QuickJoin.SetDefaultButtonImage();
    QuickSetup.SetDefaultButtonImage();
    ButtonRefresh.SetDefaultButtonImage();
    QuickJoin.SetDefaultBigButtonFontColor();
    QuickSetup.SetDefaultBigButtonFontColor();
    ButtonRefresh.SetDefaultBigButtonFontColor();
    i = 0;
    J0x132:

    // End:0x1F5 [Loop If]
    if(i < 5)
    {
        Grade.buttonImage[i] = btimg;
        Help.buttonImage[i] = btimg;
        Option.buttonImage[i] = btimg;
        Exit.buttonImage[i] = btimg;
        QuickJoin.FontSize[i] = 12;
        QuickSetup.FontSize[i] = 12;
        ButtonRefresh.FontSize[i] = 12;
        i++;
        // [Loop Continue]
        goto J0x132;
    }
    QuickJoin.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(436.0000000, 15.0000000, 555.0000000, 60.0000000);
    QuickSetup.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(553.0000000, 15.0000000, 616.0000000, 60.0000000);
    ButtonRefresh.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(621.0000000, 15.0000000, 740.0000000, 60.0000000);
    Grade.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(817.0000000, 6.0000000, 881.0000000, 70.0000000);
    Help.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(868.0000000, 6.0000000, 932.0000000, 70.0000000);
    Option.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(919.0000000, 6.0000000, 983.0000000, 70.0000000);
    Exit.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(970.0000000, 6.0000000, 1034.0000000, 70.0000000);
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
    ButtonRefresh.SetDefaultBigButtonImage();
    Grade.ButtonID = 3;
    Grade.__OnClick__Delegate = TopMenuButton_OnClick;
    Grade.buttonImage[0].Image = Texture'Warfare_UI_UI.Common.butt_rate_n';
    Grade.buttonImage[1].Image = Texture'Warfare_UI_UI.Common.butt_rate_on';
    Grade.buttonImage[2].Image = Texture'Warfare_UI_UI.Common.butt_rate_n';
    Grade.buttonImage[3].Image = Texture'Warfare_UI_UI.Common.butt_rate_cli';
    Grade.buttonImage[4].Image = Texture'Warfare_UI_UI.Common.butt_rate_dis';
    Grade.InitComponent(Controller, self);
    AppendComponent(Grade);
    Help.ButtonID = 4;
    Help.__OnClick__Delegate = TopMenuButton_OnClick;
    Help.buttonImage[0].Image = Texture'Warfare_UI_UI.Common.butt_help_n';
    Help.buttonImage[1].Image = Texture'Warfare_UI_UI.Common.butt_help_on';
    Help.buttonImage[2].Image = Texture'Warfare_UI_UI.Common.butt_help_n';
    Help.buttonImage[3].Image = Texture'Warfare_UI_UI.Common.butt_help_cli';
    Help.buttonImage[4].Image = Texture'Warfare_UI_UI.Common.butt_help_dis';
    Help.InitComponent(Controller, self);
    AppendComponent(Help);
    Option.ButtonID = 5;
    Option.__OnClick__Delegate = TopMenuButton_OnClick;
    Option.buttonImage[0].Image = Texture'Warfare_UI_UI.Common.butt_opti_n';
    Option.buttonImage[1].Image = Texture'Warfare_UI_UI.Common.butt_opti_on';
    Option.buttonImage[2].Image = Texture'Warfare_UI_UI.Common.butt_opti_n';
    Option.buttonImage[3].Image = Texture'Warfare_UI_UI.Common.butt_opti_cli';
    Option.buttonImage[4].Image = Texture'Warfare_UI_UI.Common.butt_opti_dis';
    Option.InitComponent(Controller, self);
    AppendComponent(Option);
    Exit.ButtonID = 6;
    Exit.__OnClick__Delegate = TopMenuButton_OnClick;
    Exit.buttonImage[0].Image = Texture'Warfare_UI_UI.Common.butt_logout_n';
    Exit.buttonImage[1].Image = Texture'Warfare_UI_UI.Common.butt_logout_on';
    Exit.buttonImage[2].Image = Texture'Warfare_UI_UI.Common.butt_logout_n';
    Exit.buttonImage[3].Image = Texture'Warfare_UI_UI.Common.butt_logout_cli';
    Exit.buttonImage[4].Image = Texture'Warfare_UI_UI.Common.butt_logout_dis';
    Exit.InitComponent(Controller, self);
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
    strQuickJoin="?? ??"
    strQuickSetup="??"
    strRefresh="?? ??"
}