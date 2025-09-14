class BTCheckBoxHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

enum CheckBoxStyle
{
    E_CB_Left,                      // 0
    E_CB_Right                      // 1
};

var BTCheckBoxHK.CheckBoxStyle cbStyle;
var() automated int PaddingSize;

function OnRendered(Canvas C)
{
    local int SelectMenuState;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = int(self.MenuState);
    // End:0x81
    if(int(MenuState) == 4)
    {
        SelectMenuState = 4;        
    }
    else
    {
        // End:0x95
        if(bSelect)
        {
            SelectMenuState = 5;            
        }
        else
        {
            // End:0xAC
            if(int(MenuState) == 1)
            {
                SelectMenuState = 1;                
            }
            else
            {
                SelectMenuState = 0;
            }
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[0] + float(PaddingSize), Bounds[3]);
    C.DrawColor = FontColor[SelectMenuState];
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, CaptionDrawType, float(FontSize[SelectMenuState]), Bounds[0] + float(PaddingSize), Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
    //return;    
}

function bool Internal_OnClick(GUIComponent Sender)
{
    // End:0x14
    if(bSelect)
    {
        bSelect = false;        
    }
    else
    {
        bSelect = true;
    }
    return true;
    //return;    
}

defaultproperties
{
    PaddingSize=30
    Caption="CheckBox Test"
    OnRendered=BTCheckBoxHK.OnRendered
    OnClick=BTCheckBoxHK.Internal_OnClick
}