class moButton extends GUIMenuOption
    editinlinenew
    instanced;

var(Option) string Value;
var(Option) localized string ButtonCaption;
var(Option) localized string MenuTitle;
var(Option) string MenuClass;
var(Option) string ButtonStyleName;
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUIButton MyButton;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MyButton = GUIButton(MyComponent);
    MyButton.__OnClick__Delegate = InternalOnClick;
    MyButton.Caption = ButtonCaption;
    //return;    
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
    //return;    
}

function string GetComponentValue()
{
    return Value;
    //return;    
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
    //return;    
}

function ResetComponent()
{
    Value = "";
    //return;    
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
    //return;    
}

function PageClosed(optional bool bCancelled)
{
    Value = Controller.ActivePage.GetDataString();
    InternalOnChange(self);
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
    NewComp.StyleName = ButtonStyleName;
    //return;    
}

defaultproperties
{
    ButtonCaption="Edit"
    ButtonStyleName="SquareButton"
    CaptionWidth=0.8000000
    ComponentClassName="XInterface.GUIButton"
    StandardHeight=0.0400000
}