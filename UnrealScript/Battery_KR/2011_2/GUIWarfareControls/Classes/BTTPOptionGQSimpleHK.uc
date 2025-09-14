class BTTPOptionGQSimpleHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonRadio;
var FloatBox fbButtonRadio;
var export editinline BTCheckBoxHK ButtonRadio;
var localized string strLow;
var localized string strHigh;
var FloatBox fbSlider;
var export editinline BTSliderHK Slider;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = (int(AWinPos.X2 - AWinPos.X1) * 1) / 4;
    fbButtonRadio = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, (AWinPos.X1 + float(halfW)) - float(2), AWinPos.Y2);
    ButtonRadio = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fbButtonRadio, 0.7700000));
    ButtonRadio.ButtonID = 1;
    ButtonRadio.SetDefaultRadioImage();
    ButtonRadio.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN());
    ButtonRadio.FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonDisable();
    ButtonRadio.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_dis;
    ButtonRadio.Caption = strButtonRadio;
    fbSlider = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(halfW), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    Slider = BTSliderHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderHK', fbSlider, 0.7500000));
    Slider.MaxValue = 4.0000000;
    Slider.bSmoothSlider = false;
    Slider.SetData(36, 16);
    Slider.ButtonLeft.Caption = strLow;
    Slider.ButtonRight.Caption = strHigh;
    //return;    
}

function ApplyAWinPos()
{
    local int halfW;

    super(GUIComponent).ApplyAWinPos();
    halfW = (int(AWinPos.X2 - AWinPos.X1) * 1) / 4;
    fbButtonRadio = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, (AWinPos.X1 + float(halfW)) - float(2), AWinPos.Y2);
    ButtonRadio.AWinPos = fbButtonRadio;
    ButtonRadio.ApplyAWinPos();
    fbSlider = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(halfW), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    Slider.AWinPos = fbSlider;
    Slider.ApplyAWinPos();
    //return;    
}

defaultproperties
{
    strButtonRadio="?? ??"
    strLow="??"
    strHigh="??"
}