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
    LabelResult = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(100.0000000, 150.0000000, 924.0000000, 250.0000000), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_white);
    LabelResult.__OnRendered__Delegate = LabelResult_OnRendered;
    LabelEditBox = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(100.0000000 + float(300), 250.0000000, 924.0000000 - float(300), 300.0000000), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1);
    EditBox = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(100.0000000 + float(300), 250.0000000, 924.0000000 - float(300), 300.0000000)));
    LabelFontSize = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(100.0000000 + float(100), 350.0000000, 100.0000000 + float(200), 400.0000000), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelFontStyle.SetDefaultFontColor();
    LabelFontSize.Caption = strLabelFontSize;
    EditBoxFontSize = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(300.0000000, 350.0000000, 400.0000000, 400.0000000)));
    EditBoxFontSize.bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    LabelFontStyle = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(924.0000000 - float(300), 350.0000000, 924.0000000 - float(200), 400.0000000), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
    LabelFontStyle.SetDefaultFontColor();
    LabelFontStyle.Caption = strLabelFontStyle;
    EditBoxFontStyle = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(924.0000000 - float(200), 350.0000000, 924.0000000 - float(100), 400.0000000)));
    EditBoxFontStyle.bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
    EditBox.SetText("Hello, world!");
    EditBox.bLimitDrawSize = true;
    EditBox.LimitDrawWidth = EditBox.AWinPos.X2 - EditBox.AWinPos.X1;
    EditBox.MaxTextStrNum = 50;
    EditBoxFontSize.SetText("15");
    EditBoxFontStyle.SetText("0");
    i = 0;
    J0x34D:

    // End:0x5F1 [Loop If]
    if(i < 4)
    {
        LabelFrontColor[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(100.0000000 + float(100), 400.0000000 + float(i * 50), 100.0000000 + float(200), 450.0000000 + float(i * 50)), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelFrontColor[i].SetDefaultFontColor();
        LabelFrontColor[i].Caption = strLabelFrontColor[i];
        EditBoxFrontColor[i] = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(100.0000000 + float(200), 400.0000000 + float(i * 50), 100.0000000 + float(300), 450.0000000 + float(i * 50))));
        EditBoxFrontColor[i].bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
        EditBoxFrontColor[i].SetText("255");
        LabelBackColor[i] = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(924.0000000 - float(300), 400.0000000 + float(i * 50), 924.0000000 - float(200), 450.0000000 + float(i * 50)), Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty);
        LabelBackColor[i].SetDefaultFontColor();
        LabelBackColor[i].Caption = strLabelBackColor[i];
        EditBoxBackColor[i] = BTEditBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTEditBoxHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(924.0000000 - float(200), 400.0000000 + float(i * 50), 924.0000000 - float(100), 450.0000000 + float(i * 50))));
        EditBoxBackColor[i].bgImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_1;
        EditBoxBackColor[i].SetText("255");
        i++;
        // [Loop Continue]
        goto J0x34D;
    }
    //return;    
}

function LabelResult_OnRendered(Canvas C)
{
    local Color fcolor, bcolor;

    C.Style = 5;
    fcolor = C.MakeColor(byte(int(EditBoxFrontColor[0].TextStr)), byte(int(EditBoxFrontColor[1].TextStr)), byte(int(EditBoxFrontColor[2].TextStr)), byte(int(EditBoxFrontColor[3].TextStr)));
    bcolor = C.MakeColor(byte(int(EditBoxBackColor[0].TextStr)), byte(int(EditBoxBackColor[1].TextStr)), byte(int(EditBoxBackColor[2].TextStr)), byte(int(EditBoxBackColor[3].TextStr)));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LabelResult.BackgroundImage, LabelResult.AWinPos.X1, LabelResult.AWinPos.Y1, LabelResult.AWinPos.X2, LabelResult.AWinPos.Y2);
    C.DrawColor = fcolor;
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, EditBox.TextStr, 4, float(int(EditBoxFontSize.TextStr)), LabelResult.AWinPos.X1, LabelResult.AWinPos.Y1, LabelResult.AWinPos.X2, LabelResult.AWinPos.Y2, bcolor, int(EditBoxFontStyle.TextStr), false);
    //return;    
}

defaultproperties
{
    strLabelFontSize="?? ??"
    strLabelFrontColor[0]="?? ?? R"
    strLabelFrontColor[1]="?? ?? G"
    strLabelFrontColor[2]="?? ?? B"
    strLabelFrontColor[3]="?? ?? A"
    strLabelFontStyle="?? ???"
    strLabelBackColor[0]="?? ?? R"
    strLabelBackColor[1]="?? ?? G"
    strLabelBackColor[2]="?? ?? B"
    strLabelBackColor[3]="?? ?? A"
    fbBackgroundImage=(X1=80.0000000,Y1=80.0000000,X2=944.0000000,Y2=688.0000000)
    fbTopLine=(X1=100.0000000,Y1=100.0000000,X2=924.0000000,Y2=132.0000000)
    fbBottomLine=(X1=100.0000000,Y1=636.0000000,X2=924.0000000,Y2=668.0000000)
    fbButtonOK=(X1=452.0000000,Y1=626.0000000,X2=570.0000000,Y2=658.0000000)
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1000000
    bSetControlsBoundToParent=false
    bSetControlsScaleToParent=false
    bUseChangeAlpha=true
    bUseTranslate=false
    WinTop=0.2500000
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.4000000
}