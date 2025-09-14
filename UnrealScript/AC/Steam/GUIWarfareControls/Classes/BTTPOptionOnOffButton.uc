/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionOnOffButton.uc
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
class BTTPOptionOnOffButton extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups BTGroup;
var export editinline BTOwnerDrawCaptionButtonHK CaptionButton[2];
var localized string strOnOff[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    BTGroup = ButtonGroups(NewComponent(new class'ButtonGroups', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x40:
    // End:0x165 [While If]
    if(i < 2)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, AWinPos.X1 + float(i * 70) + float(68), AWinPos.Y1 + float(28));
        CaptionButton[i] = NewButtonComponent(fb);
        CaptionButton[i].SetGraphicUpDownBtnImage();
        CaptionButton[i].SetDefaultFontColor();
        CaptionButton[i].SetFontSizeAll(9);
        CaptionButton[i].ButtonID = i;
        CaptionButton[i].Caption = strOnOff[i];
        BTGroup.AddButton(CaptionButton[i]);
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
    if(i < 2)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, AWinPos.X1 + float(i * 70) + float(68), AWinPos.Y1 + float(28));
        CaptionButton[i].AWinPos = fb;
        CaptionButton[i].ApplyAWinPos();
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
    if(i < 2)
    {
        CaptionButton[i].SetGraphicUpDownBtnImage();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    CaptionButton[BTGroup.GetSelectIndex()].buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 2)
    {
        CaptionButton[i].DisableMe();
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
    if(i < 2)
    {
        CaptionButton[i].EnableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

defaultproperties
{
    strOnOff[0]="Off"
    strOnOff[1]="On"
}