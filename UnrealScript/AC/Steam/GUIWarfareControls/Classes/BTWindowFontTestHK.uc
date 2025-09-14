/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowFontTestHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:2
 *
 *******************************************************************************/
class BTWindowFontTestHK extends BTWindowHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawImageHK LabelResult;
var export editinline BTOwnerDrawImageHK LabelEditBox;
var export editinline BTEditBoxHK EditBox;
var localized string strLabelFontSize;
var export editinline BTOwnerDrawImageHK LabelFontSize;
var export editinline BTEditBoxHK EditBoxFontSize;
var localized string strLabelFrontColor[4];
var export editinline BTOwnerDrawImageHK LabelFrontColor[4];
var export editinline BTEditBoxHK EditBoxFrontColor[4];
var localized string strLabelFontStyle;
var export editinline BTOwnerDrawImageHK LabelFontStyle;
var export editinline BTEditBoxHK EditBoxFontStyle;
var localized string strLabelBackColor[4];
var export editinline BTOwnerDrawImageHK LabelBackColor[4];
var export editinline BTEditBoxHK EditBoxBackColor[4];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    ButtonCancel.SetVisibility(false);
    LabelResult = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(100.0, 150.0, 924.0, 250.0), class'BTUIResourcePoolHK'.default.img_white);
    LabelResult.__OnRendered__Delegate = LabelResult_OnRendered;
    LabelEditBox = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(100.0 + float(300), 250.0, 924.0 - float(300), 300.0), class'BTUIResourcePoolHK'.default.panel_1);
    EditBox = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', class'BTCustomDrawHK'.static.MakeFloatBox(100.0 + float(300), 250.0, 924.0 - float(300), 300.0)));
    LabelFontSize = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(100.0 + float(100), 350.0, 100.0 + float(200), 400.0), class'BTUIResourcePoolHK'.default.empty);
    LabelFontStyle.SetDefaultFontColor();
    LabelFontSize.Caption = strLabelFontSize;
    EditBoxFontSize = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', class'BTCustomDrawHK'.static.MakeFloatBox(300.0, 350.0, 400.0, 400.0)));
    EditBoxFontSize.bgImg = class'BTUIResourcePoolHK'.default.panel_1;
    LabelFontStyle = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(924.0 - float(300), 350.0, 924.0 - float(200), 400.0), class'BTUIResourcePoolHK'.default.empty);
    LabelFontStyle.SetDefaultFontColor();
    LabelFontStyle.Caption = strLabelFontStyle;
    EditBoxFontStyle = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', class'BTCustomDrawHK'.static.MakeFloatBox(924.0 - float(200), 350.0, 924.0 - float(100), 400.0)));
    EditBoxFontStyle.bgImg = class'BTUIResourcePoolHK'.default.panel_1;
    EditBox.SetText("Hello, world!");
    EditBox.bLimitDrawSize = true;
    EditBox.LimitDrawWidth = EditBox.AWinPos.X2 - EditBox.AWinPos.X1;
    EditBox.MaxTextStrNum = 50;
    EditBoxFontSize.SetText("15");
    EditBoxFontStyle.SetText("0");
    i = 0;
    J0x34d:
    // End:0x5f1 [While If]
    if(i < 4)
    {
        LabelFrontColor[i] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(100.0 + float(100), 400.0 + float(i * 50), 100.0 + float(200), 450.0 + float(i * 50)), class'BTUIResourcePoolHK'.default.empty);
        LabelFrontColor[i].SetDefaultFontColor();
        LabelFrontColor[i].Caption = strLabelFrontColor[i];
        EditBoxFrontColor[i] = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', class'BTCustomDrawHK'.static.MakeFloatBox(100.0 + float(200), 400.0 + float(i * 50), 100.0 + float(300), 450.0 + float(i * 50))));
        EditBoxFrontColor[i].bgImg = class'BTUIResourcePoolHK'.default.panel_1;
        EditBoxFrontColor[i].SetText("255");
        LabelBackColor[i] = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(924.0 - float(300), 400.0 + float(i * 50), 924.0 - float(200), 450.0 + float(i * 50)), class'BTUIResourcePoolHK'.default.empty);
        LabelBackColor[i].SetDefaultFontColor();
        LabelBackColor[i].Caption = strLabelBackColor[i];
        EditBoxBackColor[i] = BTEditBoxHK(NewComponent(new class'BTEditBoxHK', class'BTCustomDrawHK'.static.MakeFloatBox(924.0 - float(200), 400.0 + float(i * 50), 924.0 - float(100), 450.0 + float(i * 50))));
        EditBoxBackColor[i].bgImg = class'BTUIResourcePoolHK'.default.panel_1;
        EditBoxBackColor[i].SetText("255");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x34d;
    }
}

function LabelResult_OnRendered(Canvas C)
{
    local Color fcolor, bcolor;

    C.Style = 5;
    fcolor = C.MakeColor(byte(int(EditBoxFrontColor[0].TextStr)), byte(int(EditBoxFrontColor[1].TextStr)), byte(int(EditBoxFrontColor[2].TextStr)), byte(int(EditBoxFrontColor[3].TextStr)));
    bcolor = C.MakeColor(byte(int(EditBoxBackColor[0].TextStr)), byte(int(EditBoxBackColor[1].TextStr)), byte(int(EditBoxBackColor[2].TextStr)), byte(int(EditBoxBackColor[3].TextStr)));
    class'BTCustomDrawHK'.static.DrawImage(C, LabelResult.BackgroundImage, LabelResult.AWinPos.X1, LabelResult.AWinPos.Y1, LabelResult.AWinPos.X2, LabelResult.AWinPos.Y2);
    C.DrawColor = fcolor;
    class'BTCustomDrawHK'.static.DrawString(C, EditBox.TextStr, 4, float(int(EditBoxFontSize.TextStr)), LabelResult.AWinPos.X1, LabelResult.AWinPos.Y1, LabelResult.AWinPos.X2, LabelResult.AWinPos.Y2, bcolor, int(EditBoxFontStyle.TextStr), false);
}

defaultproperties
{
    strLabelFontSize="Font Size"
    strLabelFrontColor[0]="Font Color R"
    strLabelFrontColor[1]="Font Color G"
    strLabelFrontColor[2]="Font Color B"
    strLabelFrontColor[3]="Font Color A"
    strLabelFontStyle="Font Style"
    strLabelBackColor[0]="Font Color R"
    strLabelBackColor[1]="Font Color G"
    strLabelBackColor[2]="Font Color B"
    strLabelBackColor[3]="Font Color A"
    fbBackgroundImage=(X1=80.0,Y1=80.0,X2=944.0,Y2=688.0)
    fbTopLine=(X1=100.0,Y1=100.0,X2=924.0,Y2=132.0)
    fbBottomLine=(X1=100.0,Y1=636.0,X2=924.0,Y2=668.0)
    fbButtonOK=(X1=452.0,Y1=626.0,X2=570.0,Y2=658.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.10
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    WinTop=0.250
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.40
}