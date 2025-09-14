/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\moButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:8
 *
 *******************************************************************************/
class moButton extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) string Value;
var(Option) localized string ButtonCaption;
var(Option) localized string MenuTitle;
var(Option) string MenuClass;
var(Option) string ButtonStyleName;
var(Option) editconst noexport editinline GUIButton MyButton;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyButton = GUIButton(MyComponent);
    MyButton.__OnClick__Delegate = InternalOnClick;
    MyButton.Caption = ButtonCaption;
}

function SetComponentValue(coerce string NewValue, optional bool bNoChange)
{
    // End:0x16
    if(bNoChange)
    {
        bIgnoreChange = bNoChange;
    }
    SetValue(NewValue);
    bIgnoreChange = false;
}

function string GetComponentValue()
{
    return Value;
}

function SetValue(string NewValue)
{
    // End:0x19
    if(Value == NewValue)
    {
        bIgnoreChange = false;
        return;
    }
    Value = NewValue;
    InternalOnChange(self);
}

function ResetComponent()
{
    Value = "";
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x71
    if(Sender == MyButton)
    {
        // End:0x68
        if(MenuClass != "")
        {
            // End:0x49
            if(!OnClick(self))
            {
                Controller.OpenMenu(MenuClass, MenuTitle, Value);
            }
            Controller.ActivePage.__OnClose__Delegate = PageClosed;
            return true;
        }
        InternalOnChange(self);
        return true;
    }
    return false;
}

function PageClosed(optional bool bCancelled)
{
    Value = Controller.ActivePage.GetDataString();
    InternalOnChange(self);
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
    NewComp.StyleName = ButtonStyleName;
}

defaultproperties
{
    ButtonCaption="Edit"
    ButtonStyleName="SquareButton"
    CaptionWidth=0.80
    ComponentClassName="XInterface.GUIButton"
    StandardHeight=0.040
}