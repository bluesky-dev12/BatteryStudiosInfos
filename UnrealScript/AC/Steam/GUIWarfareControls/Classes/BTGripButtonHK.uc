/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTGripButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class BTGripButtonHK extends GUIGripButtonBase
    editinlinenew
    instanced;

var() Image buttonImage[5];

function bool OwnerDraw(Canvas C)
{
    local float X, Y, width, Height;

    X = self.ActualLeft();
    Y = self.ActualTop();
    width = self.ActualWidth();
    Height = self.ActualHeight();
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[self.MenuState], X, Y, X + width, Y + Height);
    return true;
}

defaultproperties
{
    OnDraw=OwnerDraw
}