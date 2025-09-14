class BTWindowCreateClanNeedPointHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel;
var() automated FloatBox fbLabel;
var export editinline BTOwnerDrawImageHK Label;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = NewLabelComponent(fbLabel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label.CaptionDrawType = 0;
    Label.Caption = strLabel;
    ButtonOK.SetFontSizeAll(10);
    ButtonCancel.SetFontSizeAll(10);
    //return;    
}

defaultproperties
{
    strLabel="??? ???? 5000???? ?????. ??? ????????"
    fbLabel=(X1=275.0000000,Y1=369.0000000,X2=760.0000000,Y2=445.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=304.0000000,X2=780.0000000,Y2=465.0000000)
    fbTopLine=(X1=265.0000000,Y1=324.0000000,X2=760.0000000,Y2=350.0000000)
    fbBottomLine=(X1=265.0000000,Y1=401.0000000,X2=760.0000000,Y2=445.0000000)
    fbButtonOK=(X1=391.0000000,Y1=407.0000000,X2=511.0000000,Y2=440.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=407.0000000,X2=635.0000000,Y2=440.0000000)
    strTitle="?? ???"
    strOK="?? ???"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}