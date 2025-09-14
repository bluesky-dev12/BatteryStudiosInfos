/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIFormatNumEdit.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:10
 *
 *******************************************************************************/
class GUIFormatNumEdit extends GUINumericEdit
    editinlinenew
    instanced;

var bool bUnformated;
var delegate<FormatValue> __FormatValue__Delegate;

delegate string FormatValue(int NewValue)
{
    return "$ " $ string(NewValue);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyEditBox.__OnActivate__Delegate = FormatToValue;
    MyEditBox.__OnDeActivate__Delegate = ValueToFormat;
    MySpinner.bNeverFocus = false;
    MySpinner.FocusInstead = none;
}

function CalcMaxLen();
function EditOnChange(GUIComponent Sender);
function ValidateValue();
function ValueToFormat()
{
    // End:0x0d
    if(!bUnformated)
    {
        return;
    }
    SetValue(int(MyEditBox.GetText()));
}

function FormatToValue()
{
    MyEditBox.SetText(Value);
    bUnformated = true;
}

function SetValue(int V)
{
    // End:0x1a
    if(V < MinValue)
    {
        V = MinValue;
    }
    // End:0x34
    if(V > MaxValue)
    {
        V = MaxValue;
    }
    Value = string(V);
    MyEditBox.SetText(FormatValue(int(Value)));
    bUnformated = false;
    OnChange(self);
}

function bool SpinnerPlusClick(GUIComponent Sender)
{
    local int V;

    V = int(Value) + Step;
    SetValue(V);
    return true;
}

function bool SpinnerMinusClick(GUIComponent Sender)
{
    local int V;

    V = int(Value) - Step;
    SetValue(V);
    return true;
}
