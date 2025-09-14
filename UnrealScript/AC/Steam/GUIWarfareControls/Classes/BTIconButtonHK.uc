/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTIconButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class BTIconButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

enum IconHorzOrder
{
    E_ICON_LEFT,
    E_ICON_RIGHT
};

var int SpaceINT;
var BTIconButtonHK.IconHorzOrder IconSide;
var Image IconImage;

function SetData(Image img, BTIconButtonHK.IconHorzOrder side, string Text, optional int Space)
{
    IconImage = img;
    IconImage.DrawType = 3;
    IconSide = side;
    CaptionDrawType = 3;
    Caption = Text;
    SpaceINT = Space;
}

function OnRendered(Canvas C)
{
    local float W, HT, save_X;
    local int SelectMenuState;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = self.MenuState;
    // End:0x90
    if(bActiveCursor == false && MenuState == 2)
    {
        SelectMenuState = 0;
    }
    // End:0xab
    else
    {
        // End:0xab
        if(bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    C.BtrTextSize(Caption, FontSize[SelectMenuState], W, HT);
    save_X = AWinPos.X2 - AWinPos.X1 - IconImage.width + W + float(SpaceINT) / float(2);
    // End:0x25b
    if(IconSide == 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, IconImage, AWinPos.X1 + save_X, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        save_X += IconImage.width + float(SpaceINT);
        C.DrawColor = FontColor[SelectMenuState];
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], int(float(CaptionPadding[0]) + save_X), CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
    }
    // End:0x34f
    else
    {
        C.DrawColor = FontColor[SelectMenuState];
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], int(float(CaptionPadding[0]) + save_X), CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
        save_X += W + float(SpaceINT);
        class'BTCustomDrawHK'.static.DrawImage(C, IconImage, AWinPos.X1 + save_X, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
}

defaultproperties
{
    OnRendered=OnRendered
}