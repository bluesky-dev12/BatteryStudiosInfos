/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPTwoComboBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class BTTPTwoComboBoxHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTComboBoxHK ComboBox[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bUseAWinPos = false;
    super(GUIPanel).InitComponent(MyController, myOwner);
    ComboBox[0] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    ComboBox[1] = BTComboBoxHK(NewComponent(new class'BTComboBoxHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    ApplyAWinPos();
}

function ApplyAWinPos()
{
    local int halfwidth;

    super(GUIComponent).ApplyAWinPos();
    halfwidth = int(float(int(AWinPos.X2 - AWinPos.X1) / 2) + AWinPos.X1);
    ComboBox[0].AWinPos = AWinPos;
    ComboBox[0].AWinPos.X2 = float(halfwidth - 5);
    ComboBox[0].ApplyAWinPos();
    ComboBox[1].AWinPos = AWinPos;
    ComboBox[1].AWinPos.X1 = float(halfwidth + 5);
    ComboBox[1].ApplyAWinPos();
}
