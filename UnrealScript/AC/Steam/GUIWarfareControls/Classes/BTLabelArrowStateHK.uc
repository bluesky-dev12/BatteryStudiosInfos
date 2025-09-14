/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTLabelArrowStateHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
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
            ArrowImage = class'BTUIResourcePoolHK'.default.img_down2;
            // End:0xbd
            break;
        // End:0x50
        case -1:
            ArrowImage = class'BTUIResourcePoolHK'.default.img_down1;
            // End:0xbd
            break;
        // End:0x6b
        case 1:
            ArrowImage = class'BTUIResourcePoolHK'.default.img_up1;
            // End:0xbd
            break;
        // End:0x87
        case 2:
            ArrowImage = class'BTUIResourcePoolHK'.default.img_up2;
            // End:0xbd
            break;
        // End:0xa3
        case 3:
            ArrowImage = class'BTUIResourcePoolHK'.default.img_up3;
            // End:0xbd
            break;
        // End:0xffff
        default:
            ArrowImage = class'BTUIResourcePoolHK'.default.empty;
            // End:0xbd Break;
            break;
    }
}

function Internal_OnRendered(Canvas C)
{
    local float OldValueX, OldValueY;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 1;
    // End:0x70
    if(BackgroundImage.Image != none)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    }
    class'BTCustomDrawHK'.static.DrawImage(C, ArrowImage, RWinPos.X1, RWinPos.Y1, RWinPos.X2, RWinPos.Y2);
    // End:0x208
    if(Caption != "")
    {
        C.DrawColor = FontColor[self.MenuState];
        // End:0x157
        if(bUseFontScaleValue)
        {
            OldValueX = C.ClipX;
            OldValueY = C.ClipY;
            C.ClipX = FontScaleValue * C.ClipX;
            C.ClipY = FontScaleValue * C.ClipY;
        }
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[self.MenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[self.MenuState]);
        // End:0x208
        if(bUseFontScaleValue)
        {
            C.ClipX = OldValueX;
            C.ClipY = OldValueY;
        }
    }
}
