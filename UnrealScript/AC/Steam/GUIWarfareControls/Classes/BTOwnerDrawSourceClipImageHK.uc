/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTOwnerDrawSourceClipImageHK.uc
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
class BTOwnerDrawSourceClipImageHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var FloatBox ClipArea;

function Internal_OnRendered(Canvas C)
{
    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x8e
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3], ClipArea.X1, ClipArea.Y1, ClipArea.X2, ClipArea.Y2);
    }
    // End:0x13b
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState]);
    }
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}