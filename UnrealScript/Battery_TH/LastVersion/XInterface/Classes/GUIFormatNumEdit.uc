class GUIFormatNumEdit extends GUINumericEdit
    editinlinenew
    instanced;

var protected bool bUnformated;
//var delegate<FormatValue> __FormatValue__Delegate;

delegate string FormatValue(int NewValue)
{
    return "$ " $ string(NewValue);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyEditBox.__OnActivate__Delegate = FormatToValue;
    MyEditBox.__OnDeActivate__Delegate = ValueToFormat;
    MySpinner.bNeverFocus = false;
    MySpinner.FocusInstead = none;
    //return;    
}

function CalcMaxLen()
{
    //return;    
}

function EditOnChange(GUIComponent Sender)
{
    //return;    
}

function ValidateValue()
{
    //return;    
}

function ValueToFormat()
{
    // End:0x0D
    if(!bUnformated)
    {
        return;
    }
    SetValue(int(MyEditBox.GetText()));
    //return;    
}

function FormatToValue()
{
    MyEditBox.SetText(Value);
    bUnformated = true;
    //return;    
}

function SetValue(int V)
{
    // End:0x1A
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
    //return;    
}

function bool SpinnerPlusClick(GUIComponent Sender)
{
    local int V;

    V = int(Value) + Step;
    SetValue(V);
    return true;
    //return;    
}

function bool SpinnerMinusClick(GUIComponent Sender)
{
    local int V;

    V = int(Value) - Step;
    SetValue(V);
    return true;
    //return;    
}
