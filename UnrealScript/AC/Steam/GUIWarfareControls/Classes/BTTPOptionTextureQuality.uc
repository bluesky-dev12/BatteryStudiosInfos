/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionTextureQuality.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:5
 *
 *******************************************************************************/
class BTTPOptionTextureQuality extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups TextureQualityGroup;
var export editinline BTOwnerDrawCaptionButtonHK TextureQualityButton[4];
var localized string strTexQuality[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    TextureQualityGroup = ButtonGroups(NewComponent(new class'ButtonGroups', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x40:
    // End:0x165 [While If]
    if(i < 4)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, AWinPos.X1 + float(i * 70) + float(68), AWinPos.Y1 + float(28));
        TextureQualityButton[i] = NewButtonComponent(fb);
        TextureQualityButton[i].SetGraphicUpDownBtnImage();
        TextureQualityButton[i].SetDefaultFontColor();
        TextureQualityButton[i].SetFontSizeAll(9);
        TextureQualityButton[i].ButtonID = i;
        TextureQualityButton[i].Caption = strTexQuality[i];
        TextureQualityGroup.AddButton(TextureQualityButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
}

function ApplyAWinPos()
{
    local int i;
    local FloatBox fb;

    super(GUIComponent).ApplyAWinPos();
    i = 0;
    J0x0d:
    // End:0xb5 [While If]
    if(i < 4)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, AWinPos.X1 + float(i * 70) + float(68), AWinPos.Y1 + float(28));
        TextureQualityButton[i].AWinPos = fb;
        TextureQualityButton[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ChangeButtonImage()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 4)
    {
        TextureQualityButton[i].SetGraphicUpDownBtnImage();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    TextureQualityButton[TextureQualityGroup.GetSelectIndex()].buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 4)
    {
        TextureQualityButton[i].DisableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function bool EnableAllButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 4)
    {
        TextureQualityButton[i].EnableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

defaultproperties
{
    strTexQuality[0]="Low"
    strTexQuality[1]="Normal"
    strTexQuality[2]="High"
    strTexQuality[3]="Very High"
}