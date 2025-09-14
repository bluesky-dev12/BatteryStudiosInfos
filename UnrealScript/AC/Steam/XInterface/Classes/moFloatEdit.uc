/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moFloatEdit.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:7
 *
 *******************************************************************************/
class moFloatEdit extends GUIMenuOption
    dependson(GUIFloatEdit)
    editinlinenew
    instanced;

var(Option) float MinValue;
var(Option) float MaxValue;
var(Option) float Step;
var(Option) editconst noexport editinline GUIFloatEdit MyNumericEdit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyNumericEdit = GUIFloatEdit(MyComponent);
    MyNumericEdit.MinValue = MinValue;
    MyNumericEdit.MaxValue = MaxValue;
    MyNumericEdit.Step = Step;
    MyNumericEdit.CalcMaxLen();
    MyNumericEdit.SetReadOnly(bValueReadOnly);
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

function SetValue(coerce float V)
{
    MyNumericEdit.SetValue(V);
}

function float GetValue()
{
    return float(MyNumericEdit.Value);
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
}

function SetReadOnly(bool B)
{
    super.SetReadOnly(B);
    MyNumericEdit.SetReadOnly(B);
}

defaultproperties
{
    MinValue=-9999.0
    MaxValue=9999.0
    Step=0.10
    ComponentClassName="XInterface.GUIFloatEdit"
}