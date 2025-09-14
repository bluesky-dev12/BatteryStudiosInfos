class BTLabelTestHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var float LastTimeSecond;
var float CurrentTimeSecond;
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
//var delegate<OnStartPhase> __OnStartPhase__Delegate;
//var delegate<OnEndPhase> __OnEndPhase__Delegate;

delegate OnStartPhase(int Phase)
{
    //return;    
}

delegate OnEndPhase(int Phase)
{
    //return;    
}

function StartShow()
{
    bStartShow = true;
    Reset();
    CurrentScale = 10.0000000;
    StartScale = 10.0000000;
    EndScale = 0.0000000;
    ShowPhase = 0;
    ScaleStep = -0.0200000;
    ScaleStepMultiplier = 1.0500000;
    LastTimeSecond = PlayerOwner().Level.TimeSeconds;
    OnStartPhase(ShowPhase);
    //return;    
}

function Reset()
{
    DrawColor = default.DrawColor;
    ColorMultiplier = default.ColorMultiplier;
    ScaleStep = default.ScaleStep;
    ScaleStepMultiplier = default.ScaleStepMultiplier;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float Alpha, OldValueX, OldValueY, fWidthHalf, fHeightHalf;

    local Color OriginColor;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    CurrentTimeSecond = Controller.ViewportOwner.Actor.Level.TimeSeconds;
    Delta = CurrentTimeSecond - LastTimeSecond;
    LastTimeSecond = CurrentTimeSecond;
    // End:0x4DA
    if(BackgroundImage.Image != none)
    {
        // End:0x499
        if(bStartShow)
        {
            switch(ShowPhase)
            {
                // End:0x25D
                case 0:
                    CurrentScale += (ScaleStep * Delta);
                    ScaleStep = ScaleStep * ScaleStepMultiplier;
                    // End:0x105
                    if(CurrentScale > EndScale)
                    {
                        Alpha = (EndScale - CurrentScale) / (EndScale - StartScale);
                        DrawColor.A = byte(float(255) * (1.0000000 - Alpha));                        
                    }
                    else
                    {
                        Reset();
                        CurrentScale = 0.0000000;
                        StartScale = 0.0000000;
                        EndScale = 0.4000000;
                        ScaleStep = 0.6000000;
                        ScaleStepMultiplier = 1.0200000;
                        OnEndPhase(ShowPhase);
                        ShowPhase = 1;
                        OnStartPhase(ShowPhase);
                    }
                    fWidthHalf = (CurrentScale * (AWinPos.X2 - AWinPos.X1)) / float(2);
                    fHeightHalf = (CurrentScale * (AWinPos.Y2 - AWinPos.Y1)) / float(2);
                    C.ColorModulate = ColorMultiplier;
                    OriginColor = BackgroundImage.DrawColor;
                    BackgroundImage.DrawColor = DrawColor;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1 - fWidthHalf, AWinPos.Y1 - fHeightHalf, AWinPos.X2 + fWidthHalf, AWinPos.Y2 + fHeightHalf);
                    BackgroundImage.DrawColor = OriginColor;
                    // End:0x496
                    break;
                // End:0x438
                case 1:
                    CurrentScale += (ScaleStep * Delta);
                    ScaleStep = ScaleStep * ScaleStepMultiplier;
                    // End:0x2D0
                    if(CurrentScale < EndScale)
                    {
                        Alpha = (EndScale - CurrentScale) / (EndScale - StartScale);
                        DrawColor.A = byte(float(255) * Alpha);                        
                    }
                    else
                    {
                        CurrentScale = EndScale;
                        OnEndPhase(ShowPhase);
                        ShowPhase = 2;
                        OnStartPhase(ShowPhase);
                    }
                    fWidthHalf = (CurrentScale * (AWinPos.X2 - AWinPos.X1)) / float(2);
                    fHeightHalf = (CurrentScale * (AWinPos.Y2 - AWinPos.Y1)) / float(2);
                    C.ColorModulate = ColorMultiplier;
                    OriginColor = BackgroundImage.DrawColor;
                    BackgroundImage.DrawColor = DrawColor;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1 - fWidthHalf, AWinPos.Y1 - fHeightHalf, AWinPos.X2 + fWidthHalf, AWinPos.Y2 + fHeightHalf);
                    BackgroundImage.DrawColor = OriginColor;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    // End:0x496
                    break;
                // End:0xFFFF
                default:
                    OnEndPhase(ShowPhase);
                    bStartShow = false;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    // End:0x496
                    break;
                    break;
            }            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
    }
    // End:0x631
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        // End:0x580
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)]);
        // End:0x631
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
    //return;    
}

defaultproperties
{
    DrawColor=(R=255,G=255,B=255,A=255)
    ColorMultiplier=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    CurrentScale=1.0000000
    ScaleStep=-0.1000000
    ScaleStepMultiplier=1.0000000
    OnRendered=BTLabelTestHK.Internal_OnRendered
}