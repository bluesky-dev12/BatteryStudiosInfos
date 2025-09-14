/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowCreateClanNeedPointHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:1
 *
 *******************************************************************************/
class BTWindowCreateClanNeedPointHK extends BTWindowHK
    editinlinenew
    instanced;

var localized string strLabel;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel;
var export editinline BTOwnerDrawImageHK Label;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    Label = NewLabelComponent(fbLabel, class'BTUIResourcePoolHK'.default.empty);
    Label.CaptionDrawType = 0;
    Label.Caption = strLabel;
    ButtonOK.SetFontSizeAll(10);
    ButtonCancel.SetFontSizeAll(10);
}

defaultproperties
{
    strLabel="Creating a clan costs 5,000 Points. Proceed?"
    fbLabel=(X1=275.0,Y1=369.0,X2=760.0,Y2=445.0)
    fbBackgroundImage=(X1=245.0,Y1=304.0,X2=780.0,Y2=465.0)
    fbTopLine=(X1=265.0,Y1=324.0,X2=760.0,Y2=350.0)
    fbBottomLine=(X1=265.0,Y1=401.0,X2=760.0,Y2=445.0)
    fbButtonOK=(X1=391.0,Y1=407.0,X2=511.0,Y2=440.0)
    fbButtonCancel=(X1=515.0,Y1=407.0,X2=635.0,Y2=440.0)
    strTitle="Create Clan"
    strOK="Create Clan"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}