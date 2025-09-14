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
    //return;    
}

function StopSlideShow()
{
    bSlideShow = false;
    //return;    
}

function AddImage(Image img)
{
    SlideImage.Length = SlideImage.Length + 1;
    SlideImage[SlideImage.Length - 1] = img;
    //return;    
}

function ReplaceImage(int Index, Image img)
{
    SlideImage[Index] = img;
    //return;    
}

function RemoveImage(int Index)
{
    SlideImage.Remove(Index, 1);
    //return;    
}

function ClearImage()
{
    SlideImage.Length = 0;
    StopSlideShow();
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY, perc;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x70
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    // End:0x262
    if(bSlideShow)
    {
        AccumTime += Controller.RenderDelta;
        switch(Phase)
        {
            // End:0xF1
            case 0:
                perc = 0.0000000;
                // End:0xEE
                if(AccumTime >= SlideTime)
                {
                    NextShowIndex = SlideShowIndex;
                    NextShowIndex++;
                    // End:0xDC
                    if(NextShowIndex >= SlideImage.Length)
                    {
                        NextShowIndex = 0;
                    }
                    AccumTime = 0.0000000;
                    Phase = 1;
                }
                // End:0x16C
                break;
            // End:0x169
            case 1:
                // End:0x13A
                if(AccumTime >= BlendingTime)
                {
                    SlideShowIndex = NextShowIndex;
                    NextShowIndex = -1;
                    AccumTime = 0.0000000;
                    Phase = 0;
                    perc = 0.0000000;                    
                }
                else
                {
                    perc = AccumTime / BlendingTime;
                    // End:0x166
                    if(perc > 1.0000000)
                    {
                        perc = 1.0000000;
                    }
                }
                // End:0x16C
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x1E9
        if(SlideShowIndex >= 0)
        {
            SlideImage[SlideShowIndex].DrawColor.A = byte(255.0000000 * (1.0000000 - perc));
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SlideImage[SlideShowIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
        // End:0x25F
        if(NextShowIndex >= 0)
        {
            SlideImage[NextShowIndex].DrawColor.A = byte(255.0000000 * perc);
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SlideImage[NextShowIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }        
    }
    else
    {
        SlideImage[SlideShowIndex].DrawColor.A = byte(255);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SlideImage[SlideShowIndex], AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    // End:0x421
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        // End:0x369
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)], 0, bUseFontScaleValue);
        // End:0x421
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
    SlideTime=1.0000000
    BlendingTime=1.0000000
    OnRendered=BTSlideShowImageHK.Internal_OnRendered
}