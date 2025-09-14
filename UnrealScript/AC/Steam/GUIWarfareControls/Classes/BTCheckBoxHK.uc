/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTCheckBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class BTCheckBoxHK extends BTOwnerDrawCaptionButtonHK
    editinlinenew
    instanced;

enum CheckBoxStyle
{
    E_CB_Left,
    E_CB_Right
};

var BTCheckBoxHK.CheckBoxStyle cbStyle;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify int PaddingSize;

function OnRendered(Canvas C)
{
    local int SelectMenuState;

    // End:0x0e
    if(bVisible == false)
    {
        return;
    }
    C.Style = 5;
    class'BTCustomDrawHK'.static.DrawImage(C, BackgroundImage, Bounds[0], Bounds[1], Bounds[2], Bounds[3]);
    SelectMenuState = self.MenuState;
    // End:0x81
    if(MenuState == 4)
    {
        SelectMenuState = 4;
    }
    // End:0xb3
    else
    {
        // End:0x95
        if(bSelect)
        {
            SelectMenuState = 5;
        }
        // End:0xb3
        else
        {
            // End:0xac
            if(MenuState == 1)
            {
                SelectMenuState = 1;
            }
            // End:0xb3
            else
            {
                SelectMenuState = 0;
            }
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, buttonImage[SelectMenuState], Bounds[0], Bounds[1], Bounds[0] + float(PaddingSize), Bounds[3]);
    C.DrawColor = FontColor[SelectMenuState];
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Caption, 3, float(FontSize[SelectMenuState]), Bounds[0] + float(PaddingSize), Bounds[1], Bounds[2], Bounds[3], CaptionPadding[0], CaptionPadding[1], CaptionPadding[2], CaptionPadding[3], FontShadowColor[SelectMenuState]);
}

function bool Internal_OnClick(GUIComponent Sender)
{
    // End:0x14
    if(bSelect)
    {
        bSelect = false;
    }
    // End:0x1c
    else
    {
        bSelect = true;
    }
    return true;
}

defaultproperties
{
    PaddingSize=30
    Caption="CheckBox Test"
    OnRendered=OnRendered
    OnClick=Internal_OnClick
}