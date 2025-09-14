class BTWindowHelpHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bShowState;
var localized string strHelp;
var export editinline BTOwnerDrawImageHK LabelWebBack;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ButtonCancel.SetVisibility(false);
    BottomLine.SetVisibility(false);
    TopLine.Caption = strHelp;
    TopLine.CaptionPadding[0] = 14;
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_top;
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_back;
    ButtonOK.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_btn_n;
    ButtonOK.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_btn_on;
    ButtonOK.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_btn_n;
    ButtonOK.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_btn_cli;
    ButtonOK.Caption = "";
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    LabelWebBack = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(22.0000000, 110.0000000, 1002.0000000, 722.0000000), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_back_web);
    LabelWebBack.Caption = "";
    bShowState = true;
    __OnFadeEnd__Delegate = BTWindowHelpHK_OnFadeEnd;
    //return;    
}

function BTWindowHelpHK_OnFadeEnd()
{
    // End:0x28
    if(bShowState)
    {
        PlayerOwner().ConsoleCommand("openweb");
        bShowState = false;
    }
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    ButtonOK.DisableMe();
    PlayerOwner().ConsoleCommand("closeweb");
    DefaultCloseWindow_OnOK(none);
    return true;
    //return;    
}

defaultproperties
{
    fbBackgroundImage=(X1=8.0000000,Y1=97.0000000,X2=1020.0000000,Y2=740.0000000)
    fbTopLine=(X1=8.0000000,Y1=65.0000000,X2=1020.0000000,Y2=98.0000000)
    fbButtonOK=(X1=983.0000000,Y1=74.0000000,X2=1001.0000000,Y2=91.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
}