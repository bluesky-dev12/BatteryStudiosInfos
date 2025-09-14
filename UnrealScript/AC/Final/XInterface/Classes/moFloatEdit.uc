class moFloatEdit extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) float MinValue;
var(Option) float MaxValue;
var(Option) float Step;
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUIFloatEdit MyNumericEdit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyNumericEdit = GUIFloatEdit(MyComponent);
    MyNumericEdit.MinValue = MinValue;
    MyNumericEdit.MaxValue = MaxValue;
    MyNumericEdit.Step = Step;
    MyNumericEdit.CalcMaxLen();
    MyNumericEdit.SetReadOnly(bValueReadOnly);
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

function SetValue(coerce float V)
{
    MyNumericEdit.SetValue(V);
    //return;    
}

function float GetValue()
{
    return float(MyNumericEdit.Value);
    //return;    
}

function Setup(coerce float NewMin, coerce float NewMax, coerce float NewStep)
{
    MinValue = NewMin;
    MaxValue = NewMax;
    Step = NewStep;
    MyNumericEdit.MinValue = MinValue;
    MyNumericEdit.MaxValue = MaxValue;
    MyNumericEdit.Step = Step;
    MyNumericEdit.MyEditBox.bIncludeSign = NewMin < float(0);
    MyNumericEdit.CalcMaxLen();
    SetValue(FClamp(GetValue(), MinValue, MaxValue));
    //return;    
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MyNumericEdit.SetReadOnly(B);
    //return;    
}

defaultproperties
{
    MinValue=-9999.0000000
    MaxValue=9999.0000000
    Step=0.1000000
    ComponentClassName="XInterface.GUIFloatEdit"
}