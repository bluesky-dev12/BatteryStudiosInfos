/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTSliderGripButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BTSliderGripButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var string HightLight;

function SetHighLight(string Value)
{
    HightLight = Value;
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

function OnRendered(Canvas C)
{
    local int SelectMenuState;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    // End:0x20
    if(MenuState == 4)
    {
        return;
    }
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = self.MenuState;
    // End:0xa2
    if(bActiveCursor == false && MenuState == 2)
    {
        SelectMenuState = 0;
    }
    // End:0xbd
    else
    {
        // End:0xbd
        if(bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    C.DrawColor = FontColor[SelectMenuState];
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
    // End:0x201
    if(MenuState != 0 && MenuState != 2)
    {
        C.DrawColor = FontColor[0];
        class'BTCustomDrawHK'.static.DrawString(C, HightLight, 1, 9.0, Bounds[0], Bounds[1] - float(19), Bounds[2], Bounds[1]);
    }
}

defaultproperties
{
    bCaptureMouse=true
    OnRendered=OnRendered
}