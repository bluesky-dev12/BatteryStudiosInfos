/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowNoticeHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class BTWindowNoticeHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK LabelTitle;
var export editinline BTOwnerDrawImageHK LabelBack;
var export editinline BTOwnerDrawCaptionButtonHK NoticeAd;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.help_top;
    TopLine.Caption = "";
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.help_back;
    LabelTitle = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(400.0, 126.0, 624.0, 154.0), class'BTUIResourcePoolHK'.default.help_Title_Notice);
    LabelTitle.Caption = "";
    LabelBack = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(112.0, 167.0, 912.0, 598.0), class'BTUIResourcePoolHK'.default.help_back_web);
    LabelBack.Caption = "";
    NoticeAd = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(113.0, 167.0, 911.0, 597.0));
    NoticeAd.buttonImage[0] = class'BTUIResourcePoolHK'.default.help_Notice;
    NoticeAd.buttonImage[1] = class'BTUIResourcePoolHK'.default.help_Notice;
    NoticeAd.buttonImage[2] = class'BTUIResourcePoolHK'.default.help_Notice;
    NoticeAd.buttonImage[3] = class'BTUIResourcePoolHK'.default.help_Notice;
    NoticeAd.buttonImage[4] = class'BTUIResourcePoolHK'.default.help_Notice;
    NoticeAd.buttonImage[5] = class'BTUIResourcePoolHK'.default.help_Notice;
    NoticeAd.Caption = "";
    NoticeAd.__OnClick__Delegate = AD_OnClick;
    TopLine.Caption = "";
    ButtonCancel.Caption = "";
    ButtonCancel.DisableMe();
}

function bool AD_OnClick(GUIComponent Sender)
{
    local DownloadTexture downTex;

    downTex = DownloadTexture(class'BTUIResourcePoolHK'.default.help_Notice.Image);
    // End:0x83
    if(downTex != none && downTex.bIsExistLink == true)
    {
        PlayerOwner().Level.ConsoleCommand("ShellExecute OP=open FILE=" $ downTex.strLinkFileName);
    }
}

defaultproperties
{
    fbBackgroundImage=(X1=98.0,Y1=123.0,X2=930.0,Y2=648.0)
    fbTopLine=(X1=98.0,Y1=123.0,X2=930.0,Y2=156.0)
    fbButtonOK=(X1=791.0,Y1=604.0,X2=912.0,Y2=635.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.10
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    WinTop=0.250
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.40
}