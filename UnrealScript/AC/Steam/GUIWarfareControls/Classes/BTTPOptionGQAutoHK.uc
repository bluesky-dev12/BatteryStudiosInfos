/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionGQAutoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class BTTPOptionGQAutoHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonRadio;
var FloatBox fbButtonRadio;
var export editinline BTCheckBoxHK ButtonRadio;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = int(AWinPos.X2 - AWinPos.X1) * 1 / 4;
    fbButtonRadio = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    ButtonRadio = BTCheckBoxHK(NewComponent(new class'BTCheckBoxHK', fbButtonRadio, 0.770));
    ButtonRadio.ButtonID = 0;
    ButtonRadio.SetDefaultRadioImage();
    ButtonRadio.SetFontColorAll(class'BTUIColorPoolHK'.static.ButtonN());
    ButtonRadio.FontColor[4] = class'BTUIColorPoolHK'.static.ButtonDisable();
    ButtonRadio.buttonImage[4] = class'BTUIResourcePoolHK'.default.radi_dis;
    ButtonRadio.Caption = strButtonRadio;
    ButtonRadio.SetFontSizeAll(9);
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
}

defaultproperties
{
    strButtonRadio="Auto"
}