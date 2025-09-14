/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowItemRepairAllHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:22
 *	Functions:5
 *
 *******************************************************************************/
class BTWindowItemRepairAllHK extends BTWindowHK
    editinlinenew
    instanced;

var int RepairCost[2];
var int MyPoint;
var int CurrentButtonID;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonRepair[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonRepair[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbSeparator[2];
var export editinline BTOwnerDrawImageHK Separator[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelDescription;
var export editinline BTMultiLineEditBoxHK LabelDescription;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelWarning[2];
var export editinline BTOwnerDrawImageHK LabelWarning[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabel[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbEdit[3];
var export editinline BTOwnerDrawImageHK Label[3];
var export editinline BTOwnerDrawImageHK Edit[3];
var localized string strButtonRepair[2];
var localized string strEquipItemDescription;
var localized string strEquipItemWarning[2];
var localized string strInvenItemDescription;
var localized string strInvenItemWarning[2];
var localized string strLabel[3];
var localized string strPoint;

function ChangeDescription(int ButtonID)
{
    // End:0x52
    if(ButtonID == 0)
    {
        LabelDescription.SetText(strEquipItemDescription);
        LabelWarning[0].Caption = strEquipItemWarning[0];
        LabelWarning[1].Caption = strEquipItemWarning[1];
    }
    // End:0x96
    else
    {
        LabelDescription.SetText(strInvenItemDescription);
        LabelWarning[0].Caption = strInvenItemWarning[0];
        LabelWarning[1].Caption = strInvenItemWarning[1];
    }
}

function bool ButtonRepair_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0x49
    if(btn.ButtonID == 0)
    {
        ButtonRepair[0].DisableMe();
        ButtonRepair[1].EnableMe();
    }
    // End:0x6b
    else
    {
        ButtonRepair[1].DisableMe();
        ButtonRepair[0].EnableMe();
    }
    ChangeDescription(btn.ButtonID);
    ChangeRepairCost(btn.ButtonID);
    CurrentButtonID = btn.ButtonID;
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x187 [While If]
    if(i < 2)
    {
        ButtonRepair[i] = new class'BTOwnerDrawCaptionButtonHK';
        ButtonRepair[i].bUseAWinPos = true;
        ButtonRepair[i].AWinPos = fbButtonRepair[i];
        ButtonRepair[i].Caption = strButtonRepair[i];
        ButtonRepair[i].SetDefaultMButtonImage();
        ButtonRepair[i].buttonImage[4] = class'BTUIResourcePoolHK'.default.butt_m_cli;
        ButtonRepair[i].SetDefaultFontColor();
        ButtonRepair[i].FontColor[4] = class'BTUIColorPoolHK'.static.ButtonN();
        ButtonRepair[i].SetFontSizeAll(9);
        ButtonRepair[i].ButtonID = i;
        ButtonRepair[i].__OnClick__Delegate = ButtonRepair_OnClick;
        ButtonRepair[i].InitComponent(MyController, self);
        AppendComponent(ButtonRepair[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    i = 0;
    J0x18e:
    // End:0x23f [While If]
    if(i < 2)
    {
        Separator[i] = new class'BTOwnerDrawImageHK';
        Separator[i].bUseAWinPos = true;
        Separator[i].AWinPos = fbSeparator[i];
        Separator[i].BackgroundImage = class'BTUIResourcePoolHK'.default.img_divid_line;
        Separator[i].InitComponent(MyController, self);
        AppendComponent(Separator[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18e;
    }
    i = 0;
    J0x246:
    // End:0x30b [While If]
    if(i < 3)
    {
        Label[i] = new class'BTOwnerDrawImageHK';
        Label[i].bUseAWinPos = true;
        Label[i].AWinPos = fbLabel[i];
        Label[i].Caption = strLabel[i];
        Label[i].CaptionDrawType = 0;
        Label[i].InitComponent(MyController, self);
        AppendComponent(Label[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x246;
    }
    i = 0;
    J0x312:
    // End:0x402 [While If]
    if(i < 2)
    {
        LabelWarning[i] = new class'BTOwnerDrawImageHK';
        LabelWarning[i].bUseAWinPos = true;
        LabelWarning[i].AWinPos = fbLabelWarning[i];
        LabelWarning[i].CaptionDrawType = 0;
        LabelWarning[i].FontSize[0] = 8;
        LabelWarning[i].FontColor[0] = class'Canvas'.static.MakeColor(byte(255), 90, 77, byte(255));
        LabelWarning[i].InitComponent(MyController, self);
        AppendComponent(LabelWarning[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x312;
    }
    LabelDescription = new class'BTMultiLineEditBoxHK';
    LabelDescription.bUseAWinPos = true;
    LabelDescription.AWinPos = fbLabelDescription;
    LabelDescription.InitComponent(MyController, self);
    AppendComponent(LabelDescription);
    LabelDescription.bAcceptsInput = false;
    i = 0;
    J0x46e:
    // End:0x56c [While If]
    if(i < 3)
    {
        Edit[i] = new class'BTOwnerDrawImageHK';
        Edit[i].bUseAWinPos = true;
        Edit[i].AWinPos = fbEdit[i];
        Edit[i].Caption = "Point";
        Edit[i].CaptionDrawType = 5;
        Edit[i].CaptionPadding[2] = 10;
        Edit[i].BackgroundImage = class'BTUIResourcePoolHK'.default.panel_4;
        Edit[i].InitComponent(MyController, self);
        AppendComponent(Edit[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x46e;
    }
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 4;
    UpdateDefaultWindow();
    ButtonRepair_OnClick(ButtonRepair[1]);
}

function SetData(int erCost, int irCost, int Point)
{
    RepairCost[0] = erCost;
    RepairCost[1] = irCost;
    MyPoint = Point;
    ChangeRepairCost(CurrentButtonID);
}

function ChangeRepairCost(int Index)
{
    Edit[0].Caption = class'BTCustomDrawHK'.static.ToWonString(string(RepairCost[Index])) @ strPoint;
    // End:0x57
    if(RepairCost[Index] == 0)
    {
        ButtonOK.DisableMe();
    }
    // End:0x66
    else
    {
        ButtonOK.EnableMe();
    }
    Edit[1].Caption = class'BTCustomDrawHK'.static.ToWonString(string(MyPoint)) @ strPoint;
    Edit[2].Caption = class'BTCustomDrawHK'.static.ToWonString(string(MyPoint - RepairCost[Index])) @ strPoint;
}

defaultproperties
{
    fbButtonRepair[0]=(X1=343.0,Y1=262.0,X2=510.0,Y2=282.0)
    fbButtonRepair[1]=(X1=513.0,Y1=262.0,X2=680.0,Y2=282.0)
    fbSeparator[0]=(X1=341.0,Y1=290.0,X2=683.0,Y2=292.0)
    fbSeparator[1]=(X1=341.0,Y1=385.0,X2=683.0,Y2=387.0)
    fbLabelDescription=(X1=343.0,Y1=304.0,X2=681.0,Y2=345.0)
    fbLabelWarning[0]=(X1=341.0,Y1=345.0,X2=683.0,Y2=362.0)
    fbLabelWarning[1]=(X1=341.0,Y1=362.0,X2=683.0,Y2=379.0)
    fbLabel[0]=(X1=344.0,Y1=402.0,X2=440.0,Y2=436.0)
    fbLabel[1]=(X1=344.0,Y1=436.0,X2=440.0,Y2=470.0)
    fbLabel[2]=(X1=344.0,Y1=470.0,X2=440.0,Y2=500.0)
    fbEdit[0]=(X1=440.0,Y1=395.0,X2=683.0,Y2=421.0)
    fbEdit[1]=(X1=440.0,Y1=429.0,X2=683.0,Y2=455.0)
    fbEdit[2]=(X1=440.0,Y1=463.0,X2=683.0,Y2=489.0)
    strButtonRepair[0]="Repair Equipped Items"
    strButtonRepair[1]="Repair All Items"
    strEquipItemDescription="Repairs all equipped items and items in Quick Slots."
    strEquipItemWarning[0]="- Repairing a loot item increases its damage level."
    strEquipItemWarning[1]="- Items with higher damage levels cost more to repair."
    strInvenItemDescription="Repairs all items owned."
    strInvenItemWarning[0]="- Repairing a loot item increases its damage level."
    strInvenItemWarning[1]="- Items with higher damage levels cost more to repair."
    strLabel[0]="Repair Cost"
    strLabel[1]="Funds"
    strLabel[2]="Balance"
    strPoint="Points"
    fbBackgroundImage=(X1=313.0,Y1=208.0,X2=711.0,Y2=560.0)
    fbTopLine=(X1=333.0,Y1=228.0,X2=691.0,Y2=254.0)
    fbBottomLine=(X1=333.0,Y1=497.0,X2=691.0,Y2=540.0)
    fbButtonOK=(X1=390.0,Y1=503.0,X2=509.0,Y2=535.0)
    fbButtonCancel=(X1=514.0,Y1=503.0,X2=633.0,Y2=535.0)
    strTitle="Repair All"
    strOK="Repair"
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
}