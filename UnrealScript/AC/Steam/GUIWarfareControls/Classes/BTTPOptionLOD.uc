/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPOptionLOD.uc
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
class BTTPOptionLOD extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups LODGroup;
var export editinline BTOwnerDrawCaptionButtonHK LODButton[4];
var localized string strLOD[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    LODGroup = ButtonGroups(NewComponent(new class'ButtonGroups', class'BTCustomDrawHK'.static.MakeEmptyBox()));
    i = 0;
    J0x40:
    // End:0x165 [While If]
    if(i < 4)
    {
        fb = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(i * 70), AWinPos.Y1, AWinPos.X1 + float(i * 70) + float(68), AWinPos.Y1 + float(28));
        LODButton[i] = NewButtonComponent(fb);
        LODButton[i].SetGraphicUpDownBtnImage();
        LODButton[i].SetDefaultFontColor();
        LODButton[i].SetFontSizeAll(9);
        LODButton[i].ButtonID = i;
        LODButton[i].Caption = strLOD[i];
        LODGroup.AddButton(LODButton[i]);
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
        LODButton[i].AWinPos = fb;
        LODButton[i].ApplyAWinPos();
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
        LODButton[i].SetGraphicUpDownBtnImage();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    LODButton[LODGroup.GetSelectIndex()].buttonImage[0] = class'BTUIResourcePoolHK'.default.Button_Graphic_Opt_all_1_on;
}

function bool DisableAllButton()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < 4)
    {
        LODButton[i].DisableMe();
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
        LODButton[i].EnableMe();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

defaultproperties
{
    strLOD[0]="Low"
    strLOD[1]="Normal"
    strLOD[2]="High"
    strLOD[3]="Very High"
}