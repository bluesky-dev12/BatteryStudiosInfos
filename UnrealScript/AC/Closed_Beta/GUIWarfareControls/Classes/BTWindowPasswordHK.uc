class BTWindowPasswordHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel;
var() automated FloatBox fbLabel;
var() automated FloatBox fbLabelPass;
var() automated FloatBox fbEditPass;
var export editinline BTOwnerDrawImageHK Label;
var export editinline BTOwnerDrawImageHK LabelPass;
var export editinline BTEditBoxHK EditPass;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = NewLabelComponent(fbLabel, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    Label.SetDefaultFontColor();
    Label.CaptionDrawType = 0;
    Label.Caption = strLabel;
    LabelPass = NewLabelComponent(fbLabelPass, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_4);
    EditPass = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', fbEditPass));
    EditPass.MaxTextStrNum = 20;
    //return;    
}

function SetData()
{
    EditPass.SetText("");
    EditPass.SetFocus(none);
    //return;    
}

defaultproperties
{
    strLabel="Enter your password."
    fbLabel=(X1=276.0000000,Y1=369.0000000,X2=759.0000000,Y2=444.0000000)
    fbLabelPass=(X1=431.0000000,Y1=363.0000000,X2=593.0000000,Y2=389.0000000)
    fbEditPass=(X1=435.0000000,Y1=367.0000000,X2=593.0000000,Y2=389.0000000)
    fbBackgroundImage=(X1=245.0000000,Y1=304.0000000,X2=779.0000000,Y2=464.0000000)
    fbTopLine=(X1=265.0000000,Y1=324.0000000,X2=759.0000000,Y2=351.0000000)
    fbBottomLine=(X1=265.0000000,Y1=401.0000000,X2=759.0000000,Y2=444.0000000)
    fbButtonOK=(X1=391.0000000,Y1=407.0000000,X2=510.0000000,Y2=439.0000000)
    fbButtonCancel=(X1=515.0000000,Y1=407.0000000,X2=634.0000000,Y2=439.0000000)
    strTitle="Secret Game"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
}