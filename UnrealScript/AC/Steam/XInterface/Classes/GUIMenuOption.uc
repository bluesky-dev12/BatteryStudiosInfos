/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIMenuOption.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:12
 *
 *******************************************************************************/
class GUIMenuOption extends GUIMultiComponent
    dependson(GUIMultiComponent)
    native
    editinlinenew
    instanced;

var(Option) editconst bool bIgnoreChange;
var(Option) bool bValueReadOnly;
var(Option) bool bAutoSizeCaption;
var(Option) bool bHeightFromComponent;
var(Option) bool bFlipped;
var(Option) bool bSquare;
var(Option) bool bVerticalLayout;
var(Option) GUI.eTextAlign LabelJustification;
var(Option) GUI.eTextAlign ComponentJustification;
var(Option) float CaptionWidth;
var(Option) float ComponentWidth;
var(Option) localized string Caption;
var(Option) string ComponentClassName;
var(Option) string LabelFont;
var(Option) string LabelStyleName;
var(Option) Color LabelColor;
var(Option) editconst noexport editinline GUILabel MyLabel;
var(Option) editconst noexport editinline GUIComponent MyComponent;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x14
    if(bVerticalLayout)
    {
        StandardHeight *= float(2);
    }
    super.InitComponent(MyController, myOwner);
    MyLabel = GUILabel(AddComponent("XInterface.GUILabel"));
    // End:0x97
    if(MyLabel == none)
    {
        Log("Failed to create " @ string(self) @ " due to problems creating GUILabel");
        return;
    }
    // End:0x106
    if(bFlipped)
    {
        // End:0xbb
        if(LabelJustification == 0)
        {
            LabelJustification = 2;
        }
        // End:0xd3
        else
        {
            // End:0xd3
            if(LabelJustification == 2)
            {
                LabelJustification = 0;
            }
        }
        // End:0xee
        if(ComponentJustification == 0)
        {
            ComponentJustification = 2;
        }
        // End:0x106
        else
        {
            // End:0x106
            if(ComponentJustification == 2)
            {
                ComponentJustification = 0;
            }
        }
    }
    MyLabel.Caption = Caption;
    // End:0x151
    if(LabelStyleName == "")
    {
        MyLabel.TextColor = LabelColor;
        MyLabel.TextFont = LabelFont;
    }
    // End:0x182
    else
    {
        MyLabel.Style = Controller.GetStyle(LabelStyleName, MyLabel.FontScale);
    }
    MyLabel.FontScale = FontScale;
    MyLabel.TextAlign = LabelJustification;
    MyLabel.IniOption = IniOption;
    MyLabel.bNeverScale = true;
    // End:0x1dd
    if(ComponentClassName == "")
    {
        return;
    }
    MyComponent = AddComponent(ComponentClassName);
    // End:0x22f
    if(MyComponent == none)
    {
        Log("Could not create requested menu component" @ ComponentClassName);
        return;
    }
    SetHint(Hint);
    MyComponent.IniOption = IniOption;
    // End:0x27b
    if(bHeightFromComponent && !bVerticalLayout)
    {
        WinHeight = MyComponent.WinHeight;
    }
    // End:0x28f
    else
    {
        MyComponent.WinHeight = WinHeight;
    }
    MyComponent.__OnChange__Delegate = InternalOnChange;
    MyComponent.bTabStop = true;
    MyComponent.TabOrder = 1;
    MyComponent.bNeverScale = true;
    MyComponent.bNeverFocus = bNeverFocus;
    SetFriendlyLabel(MyLabel);
    // End:0x314
    if(MenuState == 4)
    {
        MenuState = 0;
        DisableMe();
    }
}

function SetComponentValue(coerce string NewValue, optional bool bNoChange);
function string GetComponentValue()
{
    return "";
}

function ResetComponent()
{
    SetComponentValue(IniDefault);
}

function SetReadOnly(bool bValue)
{
    bValueReadOnly = bValue;
}

function SetHint(string NewHint)
{
    super(GUIComponent).SetHint(NewHint);
    MyLabel.SetHint(NewHint);
    MyComponent.SetHint(NewHint);
}

function SetCaption(string NewCaption)
{
    Caption = NewCaption;
    MyLabel.Caption = NewCaption;
}

function bool MenuOptionClicked(GUIComponent Sender)
{
    return true;
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x35
    if(Controller != none && Controller.bCurMenuInitialized)
    {
        // End:0x35
        if(!bIgnoreChange)
        {
            OnChange(self);
        }
    }
    bIgnoreChange = false;
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender);
function CenterMouse()
{
    // End:0x1d
    if(MyComponent != none)
    {
        MyComponent.CenterMouse();
    }
    // End:0x23
    else
    {
        super.CenterMouse();
    }
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2a
    if(MyComponent != none)
    {
        MyComponent.SetFriendlyLabel(NewLabel);
    }
}

defaultproperties
{
    bAutoSizeCaption=true
    ComponentJustification=2
    CaptionWidth=0.50
    ComponentWidth=-1.0
    LabelFont="UT2MenuFont"
    LabelStyleName="TextLabel"
    LabelColor=(R=0,G=0,B=64,A=255)
    PropagateVisibility=true
    OnCreateComponent=InternalOnCreateComponent
    WinTop=0.3476560
    WinLeft=0.4960940
    WinWidth=0.50
    WinHeight=0.030
    bAcceptsInput=true
    ToolTip=GUIMenuOptionToolTip
    OnClickSound=1
    bStandardized=true
    StandardHeight=0.030
}