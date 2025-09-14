/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowPasswordHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:2
 *
 *******************************************************************************/
class BTWindowPasswordHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelPass;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEditPass;
var export editinline BTOwnerDrawImageHK Label;
var export editinline BTOwnerDrawImageHK LabelPass;
var export editinline BTEditBoxHK EditPass;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = NewLabelComponent(fbLabel, class'BTUIResourcePoolHK'.default.empty);
    Label.SetDefaultFontColor();
    Label.CaptionDrawType = 0;
    Label.Caption = strLabel;
    LabelPass = NewLabelComponent(fbLabelPass, class'BTUIResourcePoolHK'.default.panel_4);
    EditPass = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', fbEditPass));
    EditPass.MaxTextStrNum = 20;
}

function SetData()
{
    EditPass.SetText("");
    EditPass.SetFocus(none);
}

defaultproperties
{
    strLabel="Enter your password."
    fbLabel=(X1=276.0,Y1=369.0,X2=759.0,Y2=444.0)
    fbLabelPass=(X1=431.0,Y1=363.0,X2=593.0,Y2=389.0)
    fbEditPass=(X1=435.0,Y1=367.0,X2=593.0,Y2=389.0)
    fbBackgroundImage=(X1=245.0,Y1=304.0,X2=779.0,Y2=464.0)
    fbTopLine=(X1=265.0,Y1=324.0,X2=759.0,Y2=351.0)
    fbBottomLine=(X1=265.0,Y1=401.0,X2=759.0,Y2=444.0)
    fbButtonOK=(X1=391.0,Y1=407.0,X2=510.0,Y2=439.0)
    fbButtonCancel=(X1=515.0,Y1=407.0,X2=634.0,Y2=439.0)
    strTitle="Secret Game"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}