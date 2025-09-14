/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionAdvanceHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:3
 *
 *******************************************************************************/
class BTTPOptionAdvanceHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonTab[2];
var export editinline TabControlMocker TabControl;
var FloatBox fbButtonTab[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTab[2];
var FloatBox fbTPPanel;
var export editinline BTTPOptionBaseHK TPPanel[2];
var export editinline BTTPOptionGraphicAdvanceHK TPGraphicAdvance;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ButtonTab[0] = NewButtonComponent(fbButtonTab[0]);
    ButtonTab[0].SetDefaultTabButtonImage();
    ButtonTab[0].SetDefaultTabButtonFontColor();
    ButtonTab[0].Caption = strButtonTab[0];
    TPGraphicAdvance = BTTPOptionGraphicAdvanceHK(NewComponent(new class'BTTPOptionGraphicAdvanceHK', fb));
    TPPanel[0] = TPGraphicAdvance;
    TabControl.BindTabButtonAndPanel(ButtonTab[0], TPPanel[0]);
    TabControl.SetVisiblePanel(0);
}

function SaveData()
{
    TPGraphicAdvance.SaveData();
}

function ResetData()
{
    TPGraphicAdvance.ResetData();
}

defaultproperties
{
    strButtonTab="Advanced"
    TabControl=mTabControl
    fbButtonTab=(X1=252.0,Y1=87.0,X2=355.0,Y2=115.0)
    fbTPPanel=(X1=260.0,Y1=83.0,X2=763.0,Y2=664.0)
}