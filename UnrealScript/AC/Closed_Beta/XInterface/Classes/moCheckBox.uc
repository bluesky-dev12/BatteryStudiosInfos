class moCheckBox extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) string CheckStyleName;
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUICheckBoxButton MyCheckBox;
var(Option) editconst noexport deprecated bool bChecked;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIStyles S;

    super.InitComponent(MyController, myOwner);
    MyCheckBox = GUICheckBoxButton(MyComponent);
    MyCheckBox.__OnChange__Delegate = ButtonChecked;
    MyCheckBox.__OnClick__Delegate = InternalClick;
    S = Controller.GetStyle(CheckStyleName, MyCheckBox.FontScale);
    // End:0x9A
    if(S != none)
    {
        MyCheckBox.Graphic = S.Images[0];
    }
    //return;    
}

function SetComponentValue(coerce string NewValue, optional bool bNoChange)
{
    // End:0x11
    if(bNoChange)
    {
        bIgnoreChange = true;
    }
    Checked(bool(NewValue));
    bIgnoreChange = false;
    //return;    
}

function string GetComponentValue()
{
    return string(IsChecked());
    //return;    
}

function ResetComponent()
{
    MyCheckBox.SetChecked(false);
    //return;    
}

function bool IsChecked()
{
    return MyCheckBox.bChecked;
    //return;    
}

function bool Checked(coerce bool C)
{
    MyCheckBox.SetChecked(C);
    return true;
    //return;    
}

function ButtonChecked(GUIComponent Sender)
{
    // End:0x16
    if(Sender == MyCheckBox)
    {
        InternalOnChange(self);
    }
    //return;    
}

private function bool InternalClick(GUIComponent Sender)
{
    // End:0x0B
    if(bValueReadOnly)
    {
        return true;
    }
    return MyCheckBox.InternalOnClick(Sender);
    //return;    
}

defaultproperties
{
    bSquare=true
    CaptionWidth=0.8000000
    ComponentClassName="XInterface.GUICheckBoxButton"
}