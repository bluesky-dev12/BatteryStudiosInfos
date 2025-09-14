class BTIconButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

enum IconHorzOrder
{
    E_ICON_LEFT,                    // 0
    E_ICON_RIGHT                    // 1
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
    //return;    
}

function OnRendered(Canvas C)
{
    local float W, HT, save_X;
    local int SelectMenuState;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = int(self.MenuState);
    // End:0x90
    if((bActiveCursor == false) && int(MenuState) == int(2))
    {
        SelectMenuState = 0;        
    }
    else
    {
        // End:0xAB
        if(bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    C.BtrTextSize(Caption, FontSize[SelectMenuState], W, HT);
    save_X = ((AWinPos.X2 - AWinPos.X1) - ((IconImage.width + W) + float(SpaceINT))) / float(2);
    // End:0x25B
    if(int(IconSide) == int(0))
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, IconImage, AWinPos.X1 + save_X, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        save_X += (IconImage.width + float(SpaceINT));
        C.DrawColor = FontColor[SelectMenuState];
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], int(float(CaptionPadding[0]) + save_X), CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);        
    }
    else
    {
        C.DrawColor = FontColor[SelectMenuState];
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], int(float(CaptionPadding[0]) + save_X), CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
        save_X += (W + float(SpaceINT));
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, IconImage, AWinPos.X1 + save_X, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    //return;    
}

defaultproperties
{
    OnRendered=BTIconButtonHK.OnRendered
}