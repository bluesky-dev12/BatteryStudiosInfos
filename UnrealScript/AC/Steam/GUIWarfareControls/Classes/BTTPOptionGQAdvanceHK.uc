/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionGQAdvanceHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:2
 *
 *******************************************************************************/
class BTTPOptionGQAdvanceHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonRadio;
var FloatBox fbButtonRadio;
var export editinline BTCheckBoxHK ButtonRadio;
var localized string strButtonAdvance;
var FloatBox fbButtonAdvance;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAdvance;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = int(AWinPos.X2 - AWinPos.X1) * 1 / 4;
    fbButtonRadio = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    ButtonRadio = BTCheckBoxHK(NewComponent(new class'BTCheckBoxHK', fbButtonRadio, 0.770));
    ButtonRadio.ButtonID = 2;
    ButtonRadio.SetDefaultRadioImage();
    ButtonRadio.SetFontColorAll(class'BTUIColorPoolHK'.static.ButtonN());
    ButtonRadio.FontColor[4] = class'BTUIColorPoolHK'.static.ButtonDisable();
    ButtonRadio.buttonImage[4] = class'BTUIResourcePoolHK'.default.radi_dis;
    ButtonRadio.Caption = strButtonRadio;
    ButtonRadio.SetFontSizeAll(9);
    fbButtonAdvance = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(halfW), AWinPos.Y1, AWinPos.X1 + float(halfW) + float(188), AWinPos.Y1 + float(28));
    ButtonAdvance = NewButtonComponent(fbButtonAdvance, 0.750);
    ButtonAdvance.SetGraphicAdvanceBtnImage();
    ButtonAdvance.SetDefaultFontColor();
    ButtonAdvance.SetFontSizeAll(9);
    ButtonAdvance.Caption = strButtonAdvance;
}

function ApplyAWinPos()
{
    local int halfW;

    // End:0x0d
    if(ButtonRadio == none)
    {
        return;
    }
    super(GUIComponent).ApplyAWinPos();
    halfW = int(AWinPos.X2 - AWinPos.X1) * 1 / 4;
    fbButtonRadio = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    ButtonRadio.AWinPos = fbButtonRadio;
    ButtonRadio.ApplyAWinPos();
    fbButtonAdvance = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(halfW), AWinPos.Y1, AWinPos.X1 + float(halfW) + float(188), AWinPos.Y1 + float(28));
    ButtonAdvance.AWinPos = fbButtonAdvance;
    ButtonAdvance.ApplyAWinPos();
}

defaultproperties
{
    strButtonRadio="Advanced"
    strButtonAdvance="Advanced Options"
}