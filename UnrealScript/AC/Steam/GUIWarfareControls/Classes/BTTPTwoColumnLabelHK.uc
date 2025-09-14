/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPTwoColumnLabelHK.uc
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
class BTTPTwoColumnLabelHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawTextArrayHK Label[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    bUseAWinPos = false;
    super(GUIPanel).InitComponent(MyController, myOwner);
    Label[0] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    Label[1] = BTOwnerDrawTextArrayHK(NewComponent(new class'BTOwnerDrawTextArrayHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    ApplyAWinPos();
}

function ApplyAWinPos()
{
    local int halfwidth;

    super(GUIComponent).ApplyAWinPos();
    halfwidth = int(float(int(AWinPos.X2 - AWinPos.X1) / 2) + AWinPos.X1);
    Label[0].AWinPos = AWinPos;
    Label[0].AWinPos.X2 = float(halfwidth - 5);
    Label[0].ApplyAWinPos();
    Label[1].AWinPos = AWinPos;
    Label[1].AWinPos.X1 = float(halfwidth + 5);
    Label[1].ApplyAWinPos();
}
