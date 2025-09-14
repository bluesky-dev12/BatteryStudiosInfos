/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionBGQuality.uc
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
class BTTPOptionBGQuality extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups BGQualityGroup;
var export editinline BTOwnerDrawCaptionButtonHK BGQualityButton[3];
var localized string strBGQuality[3];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    BGQualityGroup = ButtonGroups(NewComponent(new class'ButtonGroups', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x40:
    // End:0x165 [While If]
    if(i < 3)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, AWinPos.X1 + float(i * 70) + float(68), AWinPos.Y1 + float(28));
        BGQualityButton[i] = NewButtonComponent(fb);
        BGQualityButton[i].SetGraphicUpDownBtnImage();
        BGQualityButton[i].SetDefaultFontColor();
        BGQualityButton[i].SetFontSizeAll(9);
        BGQualityButton[i].ButtonID = i;
        BGQualityButton[i].Caption = strBGQuality[i];
        BGQualityGroup.AddButton(BGQualityButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
}

function ChangeButtonImage()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 3)
    {
        BGQualityButton[i].SetGraphicUpDownBtnImage();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    BGQualityButton[BGQualityGroup.GetSelectIndex()].buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
}

function ApplyAWinPos()
{
    local int i;
    local FloatBox fb;

    super(GUIComponent).ApplyAWinPos();
    i = 0;
    J0x0d:
    // End:0xb5 [While If]
    if(i < 3)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, AWinPos.X1 + float(i * 70) + float(68), AWinPos.Y1 + float(28));
        BGQualityButton[i].AWinPos = fb;
        BGQualityButton[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 3)
    {
        BGQualityButton[i].DisableMe();
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
    if(i < 3)
    {
        BGQualityButton[i].EnableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

defaultproperties
{
    strBGQuality[0]="Low"
    strBGQuality[1]="Normal"
    strBGQuality[2]="High"
}