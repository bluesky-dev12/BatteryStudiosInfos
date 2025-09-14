class moNumericEdit extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) int MinValue;
var(Option) int MaxValue;
var(Option) int Step;
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUINumericEdit MyNumericEdit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyNumericEdit = GUINumericEdit(MyComponent);
    MyNumericEdit.MinValue = MinValue;
    MyNumericEdit.MaxValue = MaxValue;
    MyNumericEdit.Step = Step;
    MyNumericEdit.CalcMaxLen();
    MyNumericEdit.__OnChange__Delegate = InternalOnChange;
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
    SetValue(int(NewValue));
    bIgnoreChange = false;
    //return;    
}

function string GetComponentValue()
{
    return string(GetValue());
    //return;    
}

function SetValue(coerce int V)
{
    MyNumericEdit.SetValue(V);
    //return;    
}

function int GetValue()
{
    return int(MyNumericEdit.Value);
    //return;    
}

function Setup(coerce int NewMin, coerce int NewMax, coerce int NewStep)
{
    MinValue = NewMin;
    MaxValue = NewMax;
    Step = NewStep;
    MyNumericEdit.MinValue = MinValue;
    MyNumericEdit.MaxValue = MaxValue;
    MyNumericEdit.Step = Step;
    MyNumericEdit.MyEditBox.bIncludeSign = NewMin < 0;
    MyNumericEdit.CalcMaxLen();
    SetValue(Clamp(GetValue(), NewMin, NewMax));
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
    MinValue=-9999
    MaxValue=9999
    Step=1
    ComponentClassName="XInterface.GUINumericEdit"
}