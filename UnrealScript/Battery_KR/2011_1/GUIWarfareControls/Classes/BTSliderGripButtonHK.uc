class BTSliderGripButtonHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

var string HightLight;

function SetHighLight(string Value)
{
    HightLight = Value;
    //return;    
}

function bool CheckIn(float X, float Y)
{
    // End:0x56
    if((AWinPos.X1 <= X) && X <= AWinPos.X2)
    {
        // End:0x56
        if((AWinPos.Y1 <= Y) && Y <= AWinPos.Y2)
        {
            return true;
        }
    }
    return false;
    //return;    
}

function OnRendered(Canvas C)
{
    local int SelectMenuState;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    // End:0x20
    if(int(MenuState) == int(4))
    {
        return;
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = int(self.MenuState);
    // End:0xA2
    if((bActiveCursor == false) && int(MenuState) == int(2))
    {
        SelectMenuState = 0;        
    }
    else
    {
        // End:0xBD
        if(bSelectHighlight && bSelect)
        {
            SelectMenuState = 1;
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    C.DrawColor = FontColor[SelectMenuState];
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0], Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
    // End:0x201
    if((int(MenuState) != int(0)) && int(MenuState) != int(2))
    {
        C.DrawColor = FontColor[0];
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, HightLight, 1, 9.0000000, Bounds[0], Bounds[1] - float(19), Bounds[2], Bounds[1]);
    }
    //return;    
}

defaultproperties
{
    bCaptureMouse=true
    OnRendered=BTSliderGripButtonHK.OnRendered
}