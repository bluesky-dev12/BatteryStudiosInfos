/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moCheckBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:8
 *
 *******************************************************************************/
class moCheckBox extends GUIMenuOption
    dependson(GUIMenuOption)
    dependson(GUICheckBoxButton)
    dependson(GUIStyles)
    editinlinenew
    instanced;

var(Option) string CheckStyleName;
var(Option) editconst noexport editinline GUICheckBoxButton MyCheckBox;
var(Option) editconst noexport deprecated bool bChecked;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUIStyles S;

    super.InitComponent(MyController, myOwner);
    MyCheckBox = GUICheckBoxButton(MyComponent);
    MyCheckBox.__OnChange__Delegate = ButtonChecked;
    MyCheckBox.__OnClick__Delegate = InternalClick;
    S = Controller.GetStyle(CheckStyleName, MyCheckBox.FontScale);
    // End:0x9a
    if(S != none)
    {
        MyCheckBox.Graphic = S.Images[0];
    }
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
}

function string GetComponentValue()
{
    return string(IsChecked());
}

function ResetComponent()
{
    MyCheckBox.SetChecked(false);
}

function bool IsChecked()
{
    return MyCheckBox.bChecked;
}

function bool Checked(coerce bool C)
{
    MyCheckBox.SetChecked(C);
    return true;
}

function ButtonChecked(GUIComponent Sender)
{
    // End:0x16
    if(Sender == MyCheckBox)
    {
        InternalOnChange(self);
    }
}

private function bool InternalClick(GUIComponent Sender)
{
    // End:0x0b
    if(bValueReadOnly)
    {
        return true;
    }
    return MyCheckBox.InternalOnClick(Sender);
}

defaultproperties
{
    bSquare=true
    CaptionWidth=0.80
    ComponentClassName="XInterface.GUICheckBoxButton"
}