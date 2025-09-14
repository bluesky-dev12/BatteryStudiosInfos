class BTOwnerDrawSourceClipImageHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var FloatBox ClipArea;

function Internal_OnRendered(Canvas C)
{
    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    // End:0x8E
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageScaleWithClipArea(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3], ClipArea.X1, ClipArea.Y1, ClipArea.X2, ClipArea.Y2);
    }
    // End:0x13B
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)]);
    }
    //return;    
}

defaultproperties
{
    OnRendered=BTOwnerDrawSourceClipImageHK.Internal_OnRendered
}