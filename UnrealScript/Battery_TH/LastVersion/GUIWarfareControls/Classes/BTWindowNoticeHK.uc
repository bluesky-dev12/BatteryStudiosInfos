class BTWindowNoticeHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK LabelTitle;
var export editinline BTOwnerDrawImageHK LabelBack;
var export editinline BTOwnerDrawCaptionButtonHK NoticeAd;
var FloatBox fbAdvertise;
var string AdvertiseURL;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TopLine.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_top;
    TopLine.Caption = "";
    BackgroundImage.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_back;
    LabelTitle = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(400.0000000, 126.0000000, 624.0000000, 154.0000000), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Title_Notice);
    LabelTitle.Caption = "";
    LabelBack = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(112.0000000, 167.0000000, 912.0000000, 598.0000000), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_back_web);
    LabelBack.Caption = "";
    // End:0x215
    if(AdvertiseURL == "")
    {
        NoticeAd = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(113.0000000, 167.0000000, 911.0000000, 597.0000000));
        NoticeAd.buttonImage[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Notice;
        NoticeAd.buttonImage[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Notice;
        NoticeAd.buttonImage[2] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Notice;
        NoticeAd.buttonImage[3] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Notice;
        NoticeAd.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Notice;
        NoticeAd.buttonImage[5] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Notice;
        NoticeAd.Caption = "";
        NoticeAd.__OnClick__Delegate = AD_OnClick;
    }
    TopLine.Caption = "";
    ButtonCancel.Caption = "";
    ButtonCancel.DisableMe();
    //return;    
}

function bool AD_OnClick(GUIComponent Sender)
{
    local DownloadTexture downTex;

    downTex = DownloadTexture(Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.help_Notice.Image);
    // End:0x83
    if((downTex != none) && downTex.bIsExistLink == true)
    {
        PlayerOwner().Level.ConsoleCommand("ShellExecute OP=open FILE=" $ downTex.strLinkFileName);
    }
    return true;
    //return;    
}

function Internal_GetFocus()
{
    // End:0x6E
    if((AdvertiseURL != "") && (fbAdvertise.X2 - fbAdvertise.X1) != float(0))
    {
        PlayerOwner().OpenWeb(AdvertiseURL, int(fbAdvertise.X1), int(fbAdvertise.Y1), int(fbAdvertise.X2), int(fbAdvertise.Y2));
    }
    //return;    
}

function Internal_LostFocus(GUIPage NewMenu)
{
    PlayerOwner().CloseWeb("");
    //return;    
}

defaultproperties
{
    fbAdvertise=(X1=113.0000000,Y1=167.0000000,X2=912.0000000,Y2=598.0000000)
    fbBackgroundImage=(X1=98.0000000,Y1=123.0000000,X2=930.0000000,Y2=648.0000000)
    fbTopLine=(X1=98.0000000,Y1=123.0000000,X2=930.0000000,Y2=156.0000000)
    fbButtonOK=(X1=791.0000000,Y1=604.0000000,X2=912.0000000,Y2=635.0000000)
    CloseWeb=true
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    GetFocus=BTWindowNoticeHK.Internal_GetFocus
    LostFocus=BTWindowNoticeHK.Internal_LostFocus
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
}