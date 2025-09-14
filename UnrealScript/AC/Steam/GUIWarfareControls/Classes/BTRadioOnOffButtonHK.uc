/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTRadioOnOffButtonHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
class BTRadioOnOffButtonHK extends BTTabPanelHK
    dependson(BTTabPanelHK)
    dependson(ButtonGroups)
    dependson(BTCheckBoxHK)
    editinlinenew
    instanced;

var export editinline ButtonGroups Group;
var export editinline BTCheckBoxHK ButtonOff;
var export editinline BTCheckBoxHK ButtonOn;
var int OnOffSpaceRange;
var delegate<OnSelect> __OnSelect__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y2);
    ButtonOff = BTCheckBoxHK(NewComponent(new class'BTCheckBoxHK', fb));
    ButtonOff.SetDefaultRadioImage();
    ButtonOff.SetFontColorAll(class'BTUIColorPoolHK'.static.ButtonN());
    ButtonOff.FontColor[4] = class'BTUIColorPoolHK'.static.ButtonDisable();
    ButtonOff.buttonImage[4] = class'BTUIResourcePoolHK'.default.radi_dis;
    ButtonOff.Caption = "OFF";
    ButtonOff.SetFontSizeAll(9);
    fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ButtonOn = BTCheckBoxHK(NewComponent(new class'BTCheckBoxHK', fb));
    ButtonOn.SetDefaultRadioImage();
    ButtonOn.SetFontColorAll(class'BTUIColorPoolHK'.static.ButtonN());
    ButtonOn.FontColor[4] = class'BTUIColorPoolHK'.static.ButtonDisable();
    ButtonOn.buttonImage[4] = class'BTUIResourcePoolHK'.default.radi_dis;
    ButtonOn.Caption = "ON";
    ButtonOn.SetFontSizeAll(9);
    Group = ButtonGroups(NewComponent(new class'ButtonGroups', fb));
    Group.AddButton(ButtonOff);
    Group.AddButton(ButtonOn);
    ButtonOff.__OnClick__Delegate = ButtonGroups_OnClick;
    ButtonOn.__OnClick__Delegate = ButtonGroups_OnClick;
}

function ApplyAWinPos()
{
    local float halfW;

    // End:0x1a
    if(ButtonOff == none || ButtonOn == none)
    {
        return;
    }
    halfW = AWinPos.X1 + AWinPos.X2 - AWinPos.X1 / float(2);
    ButtonOff.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y2);
    ButtonOn.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ButtonOff.ApplyAWinPos();
    ButtonOn.ApplyAWinPos();
}

function SetData(bool bOn)
{
    // End:0x1c
    if(bOn)
    {
        Group.SelectButton(1);
    }
    // End:0x2c
    else
    {
        Group.SelectButton(0);
    }
}

function bool getData()
{
    return Group.selectIndex == 1;
}

delegate OnSelect(bool bOn);
function bool ButtonGroups_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Group.SelectButton(btn.ButtonID);
    OnSelect(getData());
    return true;
}

defaultproperties
{
    OnOffSpaceRange=69
}