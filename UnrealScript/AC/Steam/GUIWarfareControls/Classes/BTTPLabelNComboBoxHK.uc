/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPLabelNComboBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class BTTPLabelNComboBoxHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK Label;
var export editinline BTComboBoxHK ComboBox;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bUseAWinPos = false;
    super(GUIPanel).InitComponent(MyController, myOwner);
    Label = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    Label.SetFontDrawType(3);
    ComboBox = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    ApplyAWinPos();
}

function ApplyAWinPos()
{
    local int halfwidth;

    super(GUIComponent).ApplyAWinPos();
    halfwidth = int(float(int(AWinPos.X2 - AWinPos.X1) / 2) + AWinPos.X1);
    Label.AWinPos = AWinPos;
    Label.AWinPos.X2 = float(halfwidth - 5);
    Label.ApplyAWinPos();
    ComboBox.AWinPos = AWinPos;
    ComboBox.AWinPos.X1 = float(halfwidth + 5);
    ComboBox.ApplyAWinPos();
}
