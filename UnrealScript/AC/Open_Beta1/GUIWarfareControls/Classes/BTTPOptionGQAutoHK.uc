class BTTPOptionGQAutoHK extends BTTabPanelHK
    editinlinenew
    instanced;

var localized string strButtonRadio;
var FloatBox fbButtonRadio;
var export editinline BTCheckBoxHK ButtonRadio;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int halfW;

    super(GUIPanel).InitComponent(MyController, myOwner);
    halfW = (int(AWinPos.X2 - AWinPos.X1) * 1) / 4;
    fbButtonRadio = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, (AWinPos.X1 + float(halfW)) - float(2), AWinPos.Y2);
    ButtonRadio = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fbButtonRadio, 0.7700000));
    ButtonRadio.ButtonID = 0;
    ButtonRadio.SetDefaultRadioImage();
    ButtonRadio.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN());
    ButtonRadio.FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonDisable();
    ButtonRadio.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_dis;
    ButtonRadio.Caption = strButtonRadio;
    ButtonRadio.SetFontSizeAll(9);
    //return;    
}

function ApplyAWinPos()
{
    local int halfW;

    // End:0x0D
    if(ButtonRadio == none)
    {
        return;
    }
    super(GUIComponent).ApplyAWinPos();
    halfW = (int(AWinPos.X2 - AWinPos.X1) * 1) / 4;
    fbButtonRadio = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, (AWinPos.X1 + float(halfW)) - float(2), AWinPos.Y2);
    ButtonRadio.AWinPos = fbButtonRadio;
    ButtonRadio.ApplyAWinPos();
    //return;    
}

defaultproperties
{
    strButtonRadio="Auto"
}