/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionRadioButtonHK.uc
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
class BTTPOptionRadioButtonHK extends BTTabPanelHK
    dependson(BTTabPanelHK)
    editinlinenew
    instanced;

var float perc;
var export editinline BTRadioOnOffButtonHK ButtonRadio;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = int(float(int(AWinPos.X2 - AWinPos.X1)) * perc);
    ButtonRadio = BTRadioOnOffButtonHK(NewComponent(new class'BTRadioOnOffButtonHK', class'BTCustomDrawHK'.static.MakeEmptyBox()));
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
    halfW = int(float(int(AWinPos.X2 - AWinPos.X1)) * perc);
    ButtonRadio.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    ButtonRadio.ApplyAWinPos();
}

defaultproperties
{
    perc=0.50
}