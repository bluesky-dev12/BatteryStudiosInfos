/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelSlideAnimationHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class BTLabelSlideAnimationHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var bool bStartSlide;
var float StartTimeSecond;
var float SlideTime;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
}

function SetStartTime()
{
    bStartSlide = true;
    StartTimeSecond = PlayerOwner().Level.TimeSeconds;
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY, perc;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 1;
    CurrentTimeSecond = PlayerOwner().Level.TimeSeconds;
    perc = CurrentTimeSecond - StartTimeSecond / SlideTime;
    // End:0x6d
    if(perc > 1.0)
    {
        perc = 1.0;
    }
    // End:0x87
    if(perc < 0.0)
    {
        perc = 0.0;
    }
    perc = perc * perc * perc;
    perc = 1.0 - perc;
    // End:0x16f
    if(BackgroundImage.Image != none)
    {
        // End:0x12e
        if(bStartSlide)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2 - RWinPos.X1 * perc + RWinPos.X1, RWinPos.Y2);
        }
        // End:0x16f
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        }
    }
    // End:0x2d0
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        // End:0x215
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2, CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState]);
        // End:0x2d0
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
}

defaultproperties
{
    SlideTime=1.0
    OnRendered=Internal_OnRendered
}