/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUINumericEdit.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:12
 *
 *******************************************************************************/
class GUINumericEdit extends GUIMultiComponent
    dependson(GUISpinnerButton)
    native
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIEditBox MyEditBox;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISpinnerButton MySpinner;
var() string Value;
var() bool bLeftJustified;
var() int MinValue;
var() int MaxValue;
var() int Step;
var() bool bReadOnly;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x1c
    if(MinValue < 0)
    {
        MyEditBox.bIncludeSign = true;
    }
    super.InitComponent(MyController, myOwner);
    MyEditBox.__OnChange__Delegate = EditOnChange;
    MyEditBox.SetText(Value);
    MyEditBox.__OnKeyEvent__Delegate = EditKeyEvent;
    MyEditBox.__OnDeActivate__Delegate = CheckValue;
    CalcMaxLen();
    MyEditBox.IniOption = IniOption;
    MyEditBox.IniDefault = IniDefault;
    MySpinner.bNeverFocus = true;
    MySpinner.FocusInstead = MyEditBox;
    MySpinner.__OnPlusClick__Delegate = SpinnerPlusClick;
    MySpinner.__OnMinusClick__Delegate = SpinnerMinusClick;
    SetReadOnly(bReadOnly);
    SetHint(Hint);
}

function CalcMaxLen()
{
    local int digitcount, X;

    digitcount = 1;
    X = 10;
    J0x0f:
    // End:0x33 [While If]
    if(X <= MaxValue)
    {
        ++ digitcount;
        X *= float(10);
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    MyEditBox.MaxWidth = digitcount;
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
    MyEditBox.SetText(string(Clamp(V, MinValue, MaxValue)));
}

function bool SpinnerPlusClick(GUIComponent Sender)
{
    SetValue(int(Value) + Step);
    return true;
}

function bool SpinnerMinusClick(GUIComponent Sender)
{
    SetValue(int(Value) - Step);
    return true;
}

function bool EditKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x27
    if(key == 236 && State == 3)
    {
        SpinnerPlusClick(none);
        return true;
    }
    // End:0x4e
    if(key == 237 && State == 3)
    {
        SpinnerMinusClick(none);
        return true;
    }
    return MyEditBox.InternalOnKeyEvent(key, State, Delta);
}

function EditOnChange(GUIComponent Sender)
{
    Value = string(Clamp(int(MyEditBox.TextStr), MinValue, MaxValue));
    OnChange(self);
}

function SetHint(string NewHint)
{
    local int i;

    super(GUIComponent).SetHint(NewHint);
    i = 0;
    J0x12:
    // End:0x46 [While If]
    if(i < Controls.Length)
    {
        Controls[i].SetHint(NewHint);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
}

function SetReadOnly(bool B)
{
    bReadOnly = B;
    MyEditBox.bReadOnly = B;
    // End:0x3a
    if(B)
    {
        DisableComponent(MySpinner);
    }
    // End:0x45
    else
    {
        EnableComponent(MySpinner);
    }
}

function CheckValue()
{
    SetValue(int(Value));
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2a
    if(MyEditBox != none)
    {
        MyEditBox.SetFriendlyLabel(NewLabel);
    }
    // End:0x49
    if(MySpinner != none)
    {
        MySpinner.SetFriendlyLabel(NewLabel);
    }
}

function ValidateValue()
{
    local int i;

    i = int(MyEditBox.TextStr);
    MyEditBox.TextStr = string(Clamp(i, MinValue, MaxValue));
    MyEditBox.bHasFocus = false;
}

defaultproperties
{
    begin object name=cMyEditBox class=GUIEditBox
        bIntOnly=true
        bNeverScale=true
        OnActivate=InternalActivate
        OnDeActivate=InternalDeactivate
        OnKeyType=InternalOnKeyType
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIEditBox'GUINumericEdit.cMyEditBox'
    MyEditBox=cMyEditBox
    begin object name=cMySpinner class=GUISpinnerButton
        bTabStop=true
        bNeverScale=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUISpinnerButton'GUINumericEdit.cMySpinner'
    MySpinner=cMySpinner
    Value="0"
    MinValue=-9999
    MaxValue=9999
    Step=1
    PropagateVisibility=true
    WinHeight=0.060
    bAcceptsInput=true
    ToolTip=GUINumericEditToolTip
    OnDeActivate=ValidateValue
}