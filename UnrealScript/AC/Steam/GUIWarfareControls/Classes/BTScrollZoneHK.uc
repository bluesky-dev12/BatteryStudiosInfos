/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTScrollZoneHK.uc
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
class BTScrollZoneHK extends GUIScrollZoneBase
    editinlinenew
    instanced;

var() Image zoneImage;

function bool OwnerDraw(Canvas C)
{
    local float X, Y, width, Height;

    X = self.ActualLeft();
    Y = self.ActualTop();
    width = self.ActualWidth();
    Height = self.ActualHeight();
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, zoneImage, X, Y, X + width, Y + Height);
    return true;
}

defaultproperties
{
    OnDraw=OwnerDraw
}