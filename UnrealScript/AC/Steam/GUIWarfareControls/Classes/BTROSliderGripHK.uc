/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROSliderGripHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class BTROSliderGripHK extends BTROImageObjectHK;

var int HightLight;

function SetHighLight(int Value)
{
    HightLight = Value;
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x0e
    if(bVisible == false)
    {
        return true;
    }
    // End:0xc0
    if(SelectImageIndex != -1)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, Images[SelectImageIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        // End:0xc0
        if(SelectImageIndex == 2)
        {
            class'BTCustomDrawHK'.static.DrawString(C, string(HightLight), 1, 9.0, AWinPos.X1, AWinPos.Y1 - float(19), AWinPos.X2, AWinPos.Y1);
        }
    }
    return true;
}
