class BTRadioOnOffButtonHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline ButtonGroups Group;
var export editinline BTCheckBoxHK ButtonOff;
var export editinline BTCheckBoxHK ButtonOn;
var int OnOffSpaceRange;
//var delegate<OnSelect> __OnSelect__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fb;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y2);
    ButtonOff = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fb));
    ButtonOff.SetDefaultRadioImage();
    ButtonOff.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN());
    ButtonOff.FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonDisable();
    ButtonOff.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_dis;
    ButtonOff.Caption = "OFF";
    ButtonOff.SetFontSizeAll(9);
    fb = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ButtonOn = BTCheckBoxHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTCheckBoxHK', fb));
    ButtonOn.SetDefaultRadioImage();
    ButtonOn.SetFontColorAll(Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonN());
    ButtonOn.FontColor[4] = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ButtonDisable();
    ButtonOn.buttonImage[4] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.radi_dis;
    ButtonOn.Caption = "ON";
    ButtonOn.SetFontSizeAll(9);
    Group = ButtonGroups(NewComponent(new Class'GUIWarfareControls_Decompressed.ButtonGroups', fb));
    Group.AddButton(ButtonOff);
    Group.AddButton(ButtonOn);
    ButtonOff.__OnClick__Delegate = ButtonGroups_OnClick;
    ButtonOn.__OnClick__Delegate = ButtonGroups_OnClick;
    //return;    
}

function ApplyAWinPos()
{
    local float halfW;

    // End:0x1A
    if((ButtonOff == none) || ButtonOn == none)
    {
        return;
    }
    halfW = AWinPos.X1 + ((AWinPos.X2 - AWinPos.X1) / float(2));
    ButtonOff.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1, AWinPos.Y1, AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y2);
    ButtonOn.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(OnOffSpaceRange), AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    ButtonOff.ApplyAWinPos();
    ButtonOn.ApplyAWinPos();
    //return;    
}

function SetData(bool bOn)
{
    // End:0x1C
    if(bOn)
    {
        Group.SelectButton(1);        
    }
    else
    {
        Group.SelectButton(0);
    }
    //return;    
}

function bool getData()
{
    return Group.selectIndex == 1;
    //return;    
}

delegate OnSelect(bool bOn)
{
    //return;    
}

function bool ButtonGroups_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Group.SelectButton(btn.ButtonID);
    OnSelect(getData());
    return true;
    //return;    
}

defaultproperties
{
    OnOffSpaceRange=69
}