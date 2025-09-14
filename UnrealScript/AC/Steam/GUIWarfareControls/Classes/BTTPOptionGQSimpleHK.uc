/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionGQSimpleHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:5
 *
 *******************************************************************************/
class BTTPOptionGQSimpleHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonRadio;
var FloatBox fbButtonRadio;
var export editinline BTCheckBoxHK ButtonRadio;
var export editinline ButtonGroups GraphicSimpleGroup;
var localized string strLow;
var localized string strNormal;
var localized string strHigh;
var localized string strExHigh;
var export editinline BTOwnerDrawCaptionButtonHK SimpleButton[4];
var FloatBox fbButtonTab[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW, i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = int(AWinPos.X2 - AWinPos.X1) * 1 / 4;
    fbButtonRadio = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    ButtonRadio = BTCheckBoxHK(NewComponent(new class'BTCheckBoxHK', fbButtonRadio, 0.770));
    ButtonRadio.ButtonID = 1;
    ButtonRadio.SetDefaultRadioImage();
    ButtonRadio.SetFontColorAll(class'BTUIColorPoolHK'.static.ButtonN());
    ButtonRadio.FontColor[4] = class'BTUIColorPoolHK'.static.ButtonDisable();
    ButtonRadio.buttonImage[4] = class'BTUIResourcePoolHK'.default.radi_dis;
    ButtonRadio.Caption = strButtonRadio;
    ButtonRadio.SetFontSizeAll(9);
    GraphicSimpleGroup = ButtonGroups(NewComponent(new class'ButtonGroups', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x178:
    // End:0x28f [While If]
    if(i < 4)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(70 * i) + float(halfW), AWinPos.Y1, AWinPos.X1 + float(70 * i) + float(halfW) + float(68), AWinPos.Y1 + float(28));
        SimpleButton[i] = NewButtonComponent(fb);
        SimpleButton[i].SetGraphicUpDownBtnImage();
        SimpleButton[i].SetDefaultFontColor();
        SimpleButton[i].SetFontSizeAll(9);
        SimpleButton[i].ButtonID = i;
        GraphicSimpleGroup.AddButton(SimpleButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x178;
    }
    SimpleButton[0].Caption = strLow;
    SimpleButton[1].Caption = strNormal;
    SimpleButton[2].Caption = strHigh;
    SimpleButton[3].Caption = strExHigh;
}

function ApplyAWinPos()
{
    local int halfW, i;
    local FloatBox fb;

    // End:0x0d
    if(ButtonRadio == none)
    {
        return;
    }
    super(GUIComponent).ApplyAWinPos();
    halfW = int(AWinPos.X2 - AWinPos.X1) * 1 / 4;
    fbButtonRadio = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(halfW) - float(2), AWinPos.Y2);
    ButtonRadio.AWinPos = fbButtonRadio;
    ButtonRadio.ApplyAWinPos();
    i = 0;
    J0xae:
    // End:0x168 [While If]
    if(i < 4)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(70 * i) + float(halfW), AWinPos.Y1, AWinPos.X1 + float(70 * i) + float(halfW) + float(68), AWinPos.Y1 + float(28));
        SimpleButton[i].AWinPos = fb;
        SimpleButton[i].ApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xae;
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
        SimpleButton[i].SetGraphicUpDownBtnImage();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    SimpleButton[GraphicSimpleGroup.GetSelectIndex()].buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 4)
    {
        SimpleButton[i].DisableMe();
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
        SimpleButton[i].EnableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

defaultproperties
{
    strButtonRadio="Simple"
    strLow="Low"
    strNormal="Normal"
    strHigh="High"
    strExHigh="Very High"
}