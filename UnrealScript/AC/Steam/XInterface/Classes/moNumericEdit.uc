/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moNumericEdit.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
class moNumericEdit extends GUIMenuOption
    dependson(GUINumericEdit)
    editinlinenew
    instanced;

var(Option) int MinValue;
var(Option) int MaxValue;
var(Option) int Step;
var(Option) editconst noexport editinline GUINumericEdit MyNumericEdit;

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
}

function string GetComponentValue()
{
    return string(GetValue());
}

function SetValue(coerce int V)
{
    MyNumericEdit.SetValue(V);
}

function int GetValue()
{
    return int(MyNumericEdit.Value);
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
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MyNumericEdit.SetReadOnly(B);
}

defaultproperties
{
    MinValue=-9999
    MaxValue=9999
    Step=1
    ComponentClassName="XInterface.GUINumericEdit"
}