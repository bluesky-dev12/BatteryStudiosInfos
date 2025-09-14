/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTScrollButtonHK.uc
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
class BTScrollButtonHK extends GUIScrollButtonBase
    editinlinenew
    instanced;

var() Image buttonImage[6];

function bool OwnerDraw(Canvas C)
{
    local float X, Y, width, Height;

    X = self.ActualLeft();
    Y = self.ActualTop();
    width = self.ActualWidth();
    Height = self.ActualHeight();
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[5], X, Y, X + width, Y + Height);
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[self.MenuState], X + float(1), Y + float(1), X + width - float(1), Y + Height - float(1));
    return true;
}

defaultproperties
{
    OnDraw=OwnerDraw
}