class BTLabelArrowStateHK extends BTOwnerDrawImageHK
    editinlinenew
    instanced;

var Image ArrowImage;
var int ArrowState;

function SetData(int Value)
{
    ArrowState = Value;
    switch(ArrowState)
    {
        // End:0x31
        case -2:
            ArrowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_down2;
            // End:0xBD
            break;
        // End:0x50
        case -1:
            ArrowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_down1;
            // End:0xBD
            break;
        // End:0x6B
        case 1:
            ArrowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_up1;
            // End:0xBD
            break;
        // End:0x87
        case 2:
            ArrowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_up2;
            // End:0xBD
            break;
        // End:0xA3
        case 3:
            ArrowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_up3;
            // End:0xBD
            break;
        // End:0xFFFF
        default:
            ArrowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
            // End:0xBD
            break;
            break;
    }
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 1;
    // End:0x70
    if(BackgroundImage.Image != none)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ArrowImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    // End:0x208
    if(Caption != "")
    {
        C.DrawColor = FontColor[int(self.MenuState)];
        // End:0x157
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[int(self.MenuState)]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[int(self.MenuState)]);
        // End:0x208
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
    //return;    
}
