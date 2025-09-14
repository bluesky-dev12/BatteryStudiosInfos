/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTabPanelHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BTTabPanelHK extends GUITabPanel
    editinlinenew
    instanced;

var int TabID;
var bool bSelect;

function TabGroups_OnSelect();
function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new class'BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
}
