/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\RenderObject.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:4
 *
 *******************************************************************************/
class RenderObject extends Object;

var FloatBox AWinPos;
var bool bVisible;
var bool bMouseOn;
var bool bFocused;
var bool bvisibleBtn;
var bool bMouseClick;
var bool bMouseRelease;
var bool bQuickSlot;
var bool bNeedUpdate;

function Init()
{
    bMouseOn = false;
    bFocused = false;
}

function bool CheckIn(float X, float Y)
{
    // End:0x56
    if(AWinPos.X1 <= X && X <= AWinPos.X2)
    {
        // End:0x56
        if(AWinPos.Y1 <= Y && Y <= AWinPos.Y2)
        {
            return true;
        }
    }
    return false;
}

function Update(optional Canvas C, optional float Delta)
{
    bvisibleBtn = false;
}

function bool Render(Canvas C, optional float Delta)
{
    // End:0x0e
    if(bVisible == false)
    {
        return false;
    }
    // End:0x22
    if(bNeedUpdate)
    {
        Update(C);
    }
    return true;
}

defaultproperties
{
    bVisible=true
}