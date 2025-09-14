/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTRORadioItemBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class BTRORadioItemBoxHK extends RenderObject;

var GUIController PController;
var bool bSelect;
var Image RadioButton[3];
var BTROItemBoxHK itemBox;

function Init()
{
    RadioButton[0] = class'BTUIResourcePoolHK'.default.radi_back;
    RadioButton[1] = class'BTUIResourcePoolHK'.default.radi_on;
    RadioButton[2] = class'BTUIResourcePoolHK'.default.radi_ok;
    itemBox = new class'BTROItemBoxHK';
    itemBox.Init();
}

function bool Render(Canvas C, optional float Delta)
{
    local int iState;

    // End:0x0d
    if(!bVisible)
    {
        return false;
    }
    // End:0x4e
    if(CheckIn(float(int(PController.MouseX)), float(int(PController.MouseY))))
    {
        itemBox.bMouseOn = true;
    }
    // End:0x5f
    else
    {
        itemBox.bMouseOn = false;
    }
    // End:0x7c
    if(bSelect)
    {
        itemBox.bFocused = true;
    }
    // End:0x8d
    else
    {
        itemBox.bFocused = false;
    }
    itemBox.bVisible = bVisible;
    iState = 0;
    // End:0xc7
    if(itemBox.bFocused)
    {
        iState = 2;
    }
    // End:0xe0
    else
    {
        // End:0xe0
        if(itemBox.bMouseOn)
        {
            iState = 1;
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, RadioButton[iState], AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(53), AWinPos.Y2);
    itemBox.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(53), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    itemBox.Render(C);
}
