class BTLabelSlideAnimationHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var bool bStartSlide;
var float CurrentTimeSecond;
var float StartTimeSecond;
var float SlideTime;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIComponent).InitComponent(MyController, myOwner);
    //return;    
}

function SetStartTime()
{
    bStartSlide = true;
    StartTimeSecond = PlayerOwner().Level.TimeSeconds;
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
    C.Style = 1;
    CurrentTimeSecond = PlayerOwner().Level.TimeSeconds;
    perc = (CurrentTimeSecond - StartTimeSecond) / SlideTime;
    // End:0x6D
    if(perc > 1.0000000)
    {
        perc = 1.0000000;
    }
    // End:0x87
    if(perc < 0.0000000)
    {
        perc = 0.0000000;
    }
    perc = (perc * perc) * perc;
    perc = 1.0000000 - perc;
    // End:0x16F
    if(BackgroundImage.Image != none)
    {
        // End:0x12E
        if(bStartSlide)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, ((RWinPos.X2 - RWinPos.X1) * perc) + RWinPos.X1, RWinPos.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
        }
    }
    // End:0x2D0
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        // End:0x215
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2, CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)]);
        // End:0x2D0
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
    OnRendered=BTLabelSlideAnimationHK.Internal_OnRendered
}