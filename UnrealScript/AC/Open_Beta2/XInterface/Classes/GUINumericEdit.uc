class GUINumericEdit extends GUIMultiComponent
    native
    editinlinenew
    instanced;

var() automated GUIEditBox MyEditBox;
var() automated GUISpinnerButton MySpinner;
var() string Value;
var() bool bLeftJustified;
var() int MinValue;
var() int MaxValue;
var() int Step;
var() bool bReadOnly;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x1C
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
    //return;    
}

function CalcMaxLen()
{
    local int digitcount, X;

    digitcount = 1;
    X = 10;
    J0x0F:

    // End:0x33 [Loop If]
    if(X <= MaxValue)
    {
        digitcount++;
        X *= float(10);
        // [Loop Continue]
        goto J0x0F;
    }
    MyEditBox.MaxWidth = digitcount;
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
    MyEditBox.SetText(string(Clamp(V, MinValue, MaxValue)));
    //return;    
}

function bool SpinnerPlusClick(GUIComponent Sender)
{
    SetValue(int(Value) + Step);
    return true;
    //return;    
}

function bool SpinnerMinusClick(GUIComponent Sender)
{
    SetValue(int(Value) - Step);
    return true;
    //return;    
}

function bool EditKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x27
    if((int(key) == 236) && int(State) == 3)
    {
        SpinnerPlusClick(none);
        return true;
    }
    // End:0x4E
    if((int(key) == 237) && int(State) == 3)
    {
        SpinnerMinusClick(none);
        return true;
    }
    return MyEditBox.InternalOnKeyEvent(key, State, Delta);
    //return;    
}

function EditOnChange(GUIComponent Sender)
{
    Value = string(Clamp(int(MyEditBox.TextStr), MinValue, MaxValue));
    OnChange(self);
    //return;    
}

function SetHint(string NewHint)
{
    local int i;

    super(GUIComponent).SetHint(NewHint);
    i = 0;
    J0x12:

    // End:0x46 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].SetHint(NewHint);
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function SetReadOnly(bool B)
{
    bReadOnly = B;
    MyEditBox.bReadOnly = B;
    // End:0x3A
    if(B)
    {
        DisableComponent(MySpinner);        
    }
    else
    {
        EnableComponent(MySpinner);
    }
    //return;    
}

function CheckValue()
{
    SetValue(int(Value));
    //return;    
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2A
    if(MyEditBox != none)
    {
        MyEditBox.SetFriendlyLabel(NewLabel);
    }
    // End:0x49
    if(MySpinner != none)
    {
        MySpinner.SetFriendlyLabel(NewLabel);
    }
    //return;    
}

function ValidateValue()
{
    local int i;

    i = int(MyEditBox.TextStr);
    MyEditBox.TextStr = string(Clamp(i, MinValue, MaxValue));
    MyEditBox.bHasFocus = false;
    //return;    
}

defaultproperties
{
    // Reference: GUIEditBox'XInterface_Decompressed.GUINumericEdit.cMyEditBox'
    begin object name="cMyEditBox" class=XInterface_Decompressed.GUIEditBox
        bIntOnly=true
        bNeverScale=true
        OnActivate=cMyEditBox.InternalActivate
        OnDeActivate=cMyEditBox.InternalDeactivate
        OnKeyType=cMyEditBox.InternalOnKeyType
        OnKeyEvent=cMyEditBox.InternalOnKeyEvent
    end object
    MyEditBox=cMyEditBox
    // Reference: GUISpinnerButton'XInterface_Decompressed.GUINumericEdit.cMySpinner'
    begin object name="cMySpinner" class=XInterface_Decompressed.GUISpinnerButton
        bTabStop=false
        bNeverScale=true
        OnClick=cMySpinner.InternalOnClick
        OnKeyEvent=cMySpinner.InternalOnKeyEvent
    end object
    MySpinner=cMySpinner
    Value="0"
    MinValue=-9999
    MaxValue=9999
    Step=1
    PropagateVisibility=true
    WinHeight=0.0600000
    bAcceptsInput=true
    // Reference: GUIToolTip'XInterface_Decompressed.GUINumericEdit.GUINumericEditToolTip'
    begin object name="GUINumericEditToolTip" class=XInterface_Decompressed.GUIToolTip
    end object
    ToolTip=GUINumericEditToolTip
    OnDeActivate=GUINumericEdit.ValidateValue
}