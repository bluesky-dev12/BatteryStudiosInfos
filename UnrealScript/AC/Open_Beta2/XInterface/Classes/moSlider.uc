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
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUISlider MySlider;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    SetReadOnly(bValueReadOnly);
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x9A
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
    //return;    
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
    //return;    
}

function string GetComponentValue()
{
    return string(GetValue());
    //return;    
}

function Adjust(float Amount)
{
    // End:0x1F
    if(MySlider != none)
    {
        MySlider.Adjust(Amount);
    }
    //return;    
}

function SetValue(coerce float NewV)
{
    // End:0x25
    if(MySlider != none)
    {
        Value = MySlider.SetValue(NewV);
    }
    //return;    
}

function float GetValue()
{
    // End:0x1A
    if(MySlider != none)
    {
        return MySlider.Value;
    }
    return 0.0000000;
    //return;    
}

function Setup(coerce float MinV, coerce float MaxV, optional bool bInt)
{
    MinValue = MinV;
    MaxValue = MaxV;
    bIntSlider = bInt;
    // End:0x6C
    if(MySlider != none)
    {
        MySlider.MinValue = MinValue;
        MySlider.MaxValue = MaxValue;
        MySlider.bIntSlider = bIntSlider;
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    Value = MySlider.Value;
    super.InternalOnChange(Sender);
    //return;    
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MySlider.SetReadOnly(B);
    //return;    
}

defaultproperties
{
    SliderStyleName="SliderKnob"
    SliderCaptionStyleName="SliderCaption"
    SliderBarStyleName="SliderBar"
    ComponentClassName="XInterface.GUISlider"
}