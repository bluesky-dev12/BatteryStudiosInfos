/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionButtonHK.uc
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
class BTTPOptionButtonHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonAuto;
var localized string strButtonAdvance;
var FloatBox fbButtonAuto;
var FloatBox fbButtonAdvance;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAuto;
var export editinline BTOwnerDrawCaptionButtonHK ButtonAdvance;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = int(AWinPos.X2 - AWinPos.X1) / 2;
    fbButtonAuto = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    fbButtonAdvance = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(halfW) + float(2), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ButtonAuto = NewButtonComponent(fbButtonAuto);
    ButtonAuto.SetDefaultButtonImage();
    ButtonAuto.Caption = strButtonAuto;
    ButtonAdvance = NewButtonComponent(fbButtonAdvance);
    ButtonAdvance.SetDefaultButtonImage();
    ButtonAdvance.Caption = strButtonAdvance;
}

function ApplyAWinPos()
{
    local int halfW;

    super(GUIComponent).ApplyAWinPos();
    halfW = int(AWinPos.X2 - AWinPos.X1) / 2;
    fbButtonAuto = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    ButtonAuto.AWinPos = fbButtonAuto;
    ButtonAuto.ApplyAWinPos();
    fbButtonAdvance = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(halfW) + float(2), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ButtonAdvance.AWinPos = fbButtonAdvance;
    ButtonAdvance.ApplyAWinPos();
}

defaultproperties
{
    strButtonAuto="Auto"
    strButtonAdvance="Advanced Options"
}