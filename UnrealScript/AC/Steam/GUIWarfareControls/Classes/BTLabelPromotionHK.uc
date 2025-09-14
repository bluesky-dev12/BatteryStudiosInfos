/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelPromotionHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:13
 *	Functions:5
 *
 *******************************************************************************/
class BTLabelPromotionHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var float Delta;
var bool bStartShow;
var int ShowPhase;
var Color DrawColor;
var Plane ColorMultiplier;
var float StartScale;
var float EndScale;
var float CurrentScale;
var float ScaleStep;
var float ScaleStepMultiplier;
var float MaxScale;
var delegate<OnStartPhase> __OnStartPhase__Delegate;
var delegate<OnEndPhase> __OnEndPhase__Delegate;

delegate OnStartPhase(int Phase);
delegate OnEndPhase(int Phase);
function StartShow()
{
    bStartShow = true;
    Reset();
    CurrentScale = 10.0;
    StartScale = 10.0;
    EndScale = 0.0;
    ShowPhase = 0;
    ScaleStep = -0.020;
    ScaleStepMultiplier = 1.050;
    OnStartPhase(ShowPhase);
}

function Reset()
{
    DrawColor = default.DrawColor;
    ColorMultiplier = default.ColorMultiplier;
    ScaleStep = default.ScaleStep;
    ScaleStepMultiplier = default.ScaleStepMultiplier;
}

function Internal_OnRendered(Canvas C)
{
    local float Alpha, OldValueX, OldValueY, fWidthHalf, fHeightHalf;

    local Color OriginColor;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    Delta = Controller.RenderDelta;
    // End:0x4b
    if(Delta == float(0))
    {
        Delta = 0.050;
    }
    // End:0x4ba
    if(BackgroundImage.Image != none)
    {
        // End:0x479
        if(bStartShow)
        {
            switch(ShowPhase)
            {
                // End:0x23d
                case 0:
                    CurrentScale += ScaleStep * Delta;
                    ScaleStep = ScaleStep * ScaleStepMultiplier;
                    // End:0xe5
                    if(CurrentScale > EndScale)
                    {
                        Alpha = EndScale - CurrentScale / EndScale - StartScale;
                        DrawColor.A = byte(float(255) * 1.0 - Alpha);
                    }
                    // End:0x147
                    else
                    {
                        Reset();
                        CurrentScale = 0.0;
                        StartScale = 0.0;
                        EndScale = 0.40;
                        ScaleStep = 0.60;
                        ScaleStepMultiplier = 1.020;
                        OnEndPhase(ShowPhase);
                        ShowPhase = 1;
                        OnStartPhase(ShowPhase);
                    }
                    fWidthHalf = CurrentScale * RWinPos.X2 - RWinPos.X1 / float(2);
                    fHeightHalf = CurrentScale * RWinPos.Y2 - RWinPos.Y1 / float(2);
                    C.ColorModulate = ColorMultiplier;
                    OriginColor = BackgroundImage.DrawColor;
                    BackgroundImage.DrawColor = DrawColor;
                    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1 - fWidthHalf, RWinPos.Y1 - fHeightHalf, RWinPos.X2 + fWidthHalf, RWinPos.Y2 + fHeightHalf);
                    BackgroundImage.DrawColor = OriginColor;
                    // End:0x476
                    break;
                // End:0x418
                case 1:
                    CurrentScale += ScaleStep * Delta;
                    ScaleStep = ScaleStep * ScaleStepMultiplier;
                    // End:0x2b0
                    if(CurrentScale < EndScale)
                    {
                        Alpha = EndScale - CurrentScale / EndScale - StartScale;
                        DrawColor.A = byte(float(255) * Alpha);
                    }
                    // End:0x2e1
                    else
                    {
                        CurrentScale = EndScale;
                        OnEndPhase(ShowPhase);
                        ShowPhase = 2;
                        OnStartPhase(ShowPhase);
                    }
                    fWidthHalf = CurrentScale * RWinPos.X2 - RWinPos.X1 / float(2);
                    fHeightHalf = CurrentScale * RWinPos.Y2 - RWinPos.Y1 / float(2);
                    C.ColorModulate = ColorMultiplier;
                    OriginColor = BackgroundImage.DrawColor;
                    BackgroundImage.DrawColor = DrawColor;
                    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1 - fWidthHalf, RWinPos.Y1 - fHeightHalf, RWinPos.X2 + fWidthHalf, RWinPos.Y2 + fHeightHalf);
                    BackgroundImage.DrawColor = OriginColor;
                    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
                    // End:0x476
                    break;
                // End:0xffff
                default:
                    OnEndPhase(ShowPhase);
                    bStartShow = false;
                    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
                    // End:0x476 Break;
                    break;
            }
        }
        // End:0x4ba
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        }
    }
    // End:0x611
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        // End:0x560
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState]);
        // End:0x611
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
}

defaultproperties
{
    DrawColor=(R=255,G=255,B=255,A=255)
    ColorMultiplier=(X=0.0,Y=0.0,Z=0.0,W=0.0)
    CurrentScale=1.0
    ScaleStep=-0.10
    ScaleStepMultiplier=1.0
    OnRendered=Internal_OnRendered
}