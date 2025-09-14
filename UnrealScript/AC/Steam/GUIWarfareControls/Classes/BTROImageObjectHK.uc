/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROImageObjectHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class BTROImageObjectHK extends RenderObject;

var int SelectImageIndex;
var array<Image> Images;

function SetData(int si)
{
    SelectImageIndex = si;
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x0e
    if(bVisible == false)
    {
        return true;
    }
    // End:0x64
    if(SelectImageIndex != -1)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, Images[SelectImageIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    return true;
}
