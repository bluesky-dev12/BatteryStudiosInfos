/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTSlideShowImageHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:7
 *
 *******************************************************************************/
class BTSlideShowImageHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var float AccumTime;
var int Phase;
var float SlideTime;
var float BlendingTime;
var bool bSlideShow;
var int SlideShowIndex;
var int NextShowIndex;
var array<Image> SlideImage;

function StartSlideShow()
{
    bSlideShow = true;
}

function StopSlideShow()
{
    bSlideShow = false;
}

function AddImage(Image img)
{
    SlideImage.Length = SlideImage.Length + 1;
    SlideImage[SlideImage.Length - 1] = img;
}

function ReplaceImage(int Index, Image img)
{
    SlideImage[Index] = img;
}

function RemoveImage(int Index)
{
    SlideImage.Remove(Index, 1);
}

function ClearImage()
{
    SlideImage.Length = 0;
    StopSlideShow();
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY, perc;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x70
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    // End:0x262
    if(bSlideShow)
    {
        AccumTime += Controller.RenderDelta;
        switch(Phase)
        {
            // End:0xf1
            case 0:
                perc = 0.0;
                // End:0xee
                if(AccumTime >= SlideTime)
                {
                    NextShowIndex = SlideShowIndex;
                    ++ NextShowIndex;
                    // End:0xdc
                    if(NextShowIndex >= SlideImage.Length)
                    {
                        NextShowIndex = 0;
                    }
                    AccumTime = 0.0;
                    Phase = 1;
                }
                // End:0x16c
                break;
            // End:0x169
            case 1:
                // End:0x13a
                if(AccumTime >= BlendingTime)
                {
                    SlideShowIndex = NextShowIndex;
                    NextShowIndex = -1;
                    AccumTime = 0.0;
                    Phase = 0;
                    perc = 0.0;
                }
                // End:0x166
                else
                {
                    perc = AccumTime / BlendingTime;
                    // End:0x166
                    if(perc > 1.0)
                    {
                        perc = 1.0;
                    }
                }
                // End:0x16c
                break;
            // End:0xffff
            default:
                // End:0x1e9
                if(SlideShowIndex >= 0)
                {
                    SlideImage[SlideShowIndex].DrawColor.A = byte(255.0 * 1.0 - perc);
                    class'BTCustomDrawHK'.static.DrawImage(C, SlideImage[SlideShowIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                }
                // End:0x25f
                if(NextShowIndex >= 0)
                {
                    SlideImage[NextShowIndex].DrawColor.A = byte(255.0 * perc);
                    class'BTCustomDrawHK'.static.DrawImage(C, SlideImage[NextShowIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                }
                // End:0x2c3 Break;
                break;
            }
    }
    SlideImage[SlideShowIndex].DrawColor.A = byte(255);
    class'BTCustomDrawHK'.static.DrawImage(C, SlideImage[SlideShowIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    // End:0x421
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        // End:0x369
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState], 0, bUseFontScaleValue);
        // End:0x421
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
    BlendingTime=1.0
    OnRendered=Internal_OnRendered
}