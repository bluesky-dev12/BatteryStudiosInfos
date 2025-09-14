/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moSlider.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:10
 *
 *******************************************************************************/
class moSlider extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) float MaxValue;
var(Option) float MinValue;
var(Option) float Value;
var(Option) bool bIntSlider;
var(Option) string SliderStyleName;
var(Option) string SliderCaptionStyleName;
var(Option) string SliderBarStyleName;
var(Option) editconst noexport editinline GUISlider MySlider;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    SetReadOnly(bValueReadOnly);
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x9a
    if(GUISlider(NewComp) != none)
    {
        MySlider = GUISlider(NewComp);
        MySlider.MinValue = MinValue;
        MySlider.MaxValue = MaxValue;
        MySlider.bIntSlider = bIntSlider;
        MySlider.StyleName = SliderStyleName;
        MySlider.CaptionStyleName = SliderCaptionStyleName;
        MySlider.BarStyleName = SliderBarStyleName;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
}

function SetComponentValue(coerce string NewValue, optional bool bNoChange)
{
    // End:0x11
    if(bNoChange)
    {
        bIgnoreChange = true;
    }
    SetValue(float(NewValue));
    bIgnoreChange = false;
}

function string GetComponentValue()
{
    return string(GetValue());
}

function Adjust(float Amount)
{
    // End:0x1f
    if(MySlider != none)
    {
        MySlider.Adjust(Amount);
    }
}

function SetValue(coerce float NewV)
{
    // End:0x25
    if(MySlider != none)
    {
        Value = MySlider.SetValue(NewV);
    }
}

function float GetValue()
{
    // End:0x1a
    if(MySlider != none)
    {
        return MySlider.Value;
    }
    return 0.0;
}

function Setup(coerce float MinV, coerce float MaxV, optional bool bInt)
{
    MinValue = MinV;
    MaxValue = MaxV;
    bIntSlider = bInt;
    // End:0x6c
    if(MySlider != none)
    {
        MySlider.MinValue = MinValue;
        MySlider.MaxValue = MaxValue;
        MySlider.bIntSlider = bIntSlider;
    }
}

function InternalOnChange(GUIComponent Sender)
{
    Value = MySlider.Value;
    super.InternalOnChange(Sender);
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MySlider.SetReadOnly(B);
}

defaultproperties
{
    SliderStyleName="SliderKnob"
    SliderCaptionStyleName="SliderCaption"
    SliderBarStyleName="SliderBar"
    ComponentClassName="XInterface.GUISlider"
}