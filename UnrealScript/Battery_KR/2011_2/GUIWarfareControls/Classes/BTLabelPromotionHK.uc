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
    Delta = Controller.RenderDelta;
    // End:0x4B
    if(Delta == float(0))
    {
        Delta = 0.0500000;
    }
    // End:0x4BA
    if(BackgroundImage.Image != none)
    {
        // End:0x479
        if(bStartShow)
        {
            switch(ShowPhase)
            {
                // End:0x23D
                case 0:
                    CurrentScale += (ScaleStep * Delta);
                    ScaleStep = ScaleStep * ScaleStepMultiplier;
                    // End:0xE5
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
                    fWidthHalf = (CurrentScale * (RWinPos.X2 - RWinPos.X1)) / float(2);
                    fHeightHalf = (CurrentScale * (RWinPos.Y2 - RWinPos.Y1)) / float(2);
                    C.ColorModulate = ColorMultiplier;
                    OriginColor = BackgroundImage.DrawColor;
                    BackgroundImage.DrawColor = DrawColor;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1 - fWidthHalf, RWinPos.Y1 - fHeightHalf, RWinPos.X2 + fWidthHalf, RWinPos.Y2 + fHeightHalf);
                    BackgroundImage.DrawColor = OriginColor;
                    // End:0x476
                    break;
                // End:0x418
                case 1:
                    CurrentScale += (ScaleStep * Delta);
                    ScaleStep = ScaleStep * ScaleStepMultiplier;
                    // End:0x2B0
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
                    fWidthHalf = (CurrentScale * (RWinPos.X2 - RWinPos.X1)) / float(2);
                    fHeightHalf = (CurrentScale * (RWinPos.Y2 - RWinPos.Y1)) / float(2);
                    C.ColorModulate = ColorMultiplier;
                    OriginColor = BackgroundImage.DrawColor;
                    BackgroundImage.DrawColor = DrawColor;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1 - fWidthHalf, RWinPos.Y1 - fHeightHalf, RWinPos.X2 + fWidthHalf, RWinPos.Y2 + fHeightHalf);
                    BackgroundImage.DrawColor = OriginColor;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
                    // End:0x476
                    break;
                // End:0xFFFF
                default:
                    OnEndPhase(ShowPhase);
                    bStartShow = false;
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
                    // End:0x476
                    break;
                    break;
            }            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        }
    }
    // End:0x611
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        // End:0x560
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)]);
        // End:0x611
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
    OnRendered=BTLabelPromotionHK.Internal_OnRendered
}