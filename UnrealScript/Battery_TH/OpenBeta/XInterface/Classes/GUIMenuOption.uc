class GUIMenuOption extends GUIMultiComponent
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
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUILabel MyLabel;
var(Option) /*0x00000000-0x00000008*/ editconst noexport editinline GUIComponent MyComponent;

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
        Log(("Failed to create " @ string(self)) @ " due to problems creating GUILabel");
        return;
    }
    // End:0x106
    if(bFlipped)
    {
        // End:0xBB
        if(int(LabelJustification) == int(0))
        {
            LabelJustification = 2;            
        }
        else
        {
            // End:0xD3
            if(int(LabelJustification) == int(2))
            {
                LabelJustification = 0;
            }
        }
        // End:0xEE
        if(int(ComponentJustification) == int(0))
        {
            ComponentJustification = 2;            
        }
        else
        {
            // End:0x106
            if(int(ComponentJustification) == int(2))
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
    else
    {
        MyLabel.Style = Controller.GetStyle(LabelStyleName, MyLabel.FontScale);
    }
    MyLabel.FontScale = FontScale;
    MyLabel.TextAlign = LabelJustification;
    MyLabel.IniOption = IniOption;
    MyLabel.bNeverScale = true;
    // End:0x1DD
    if(ComponentClassName == "")
    {
        return;
    }
    MyComponent = AddComponent(ComponentClassName);
    // End:0x22F
    if(MyComponent == none)
    {
        Log("Could not create requested menu component" @ ComponentClassName);
        return;
    }
    SetHint(Hint);
    MyComponent.IniOption = IniOption;
    // End:0x27B
    if(bHeightFromComponent && !bVerticalLayout)
    {
        WinHeight = MyComponent.WinHeight;        
    }
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
    if(int(MenuState) == int(4))
    {
        MenuState = 0;
        DisableMe();
    }
    //return;    
}

function SetComponentValue(coerce string NewValue, optional bool bNoChange)
{
    //return;    
}

function string GetComponentValue()
{
    return "";
    //return;    
}

function ResetComponent()
{
    SetComponentValue(IniDefault);
    //return;    
}

function SetReadOnly(bool bValue)
{
    bValueReadOnly = bValue;
    //return;    
}

function SetHint(string NewHint)
{
    super(GUIComponent).SetHint(NewHint);
    MyLabel.SetHint(NewHint);
    MyComponent.SetHint(NewHint);
    //return;    
}

function SetCaption(string NewCaption)
{
    Caption = NewCaption;
    MyLabel.Caption = NewCaption;
    //return;    
}

function bool MenuOptionClicked(GUIComponent Sender)
{
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x35
    if((Controller != none) && Controller.bCurMenuInitialized)
    {
        // End:0x35
        if(!bIgnoreChange)
        {
            OnChange(self);
        }
    }
    bIgnoreChange = false;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    //return;    
}

function CenterMouse()
{
    // End:0x1D
    if(MyComponent != none)
    {
        MyComponent.CenterMouse();        
    }
    else
    {
        super.CenterMouse();
    }
    //return;    
}

function SetFriendlyLabel(GUILabel NewLabel)
{
    super(GUIComponent).SetFriendlyLabel(NewLabel);
    // End:0x2A
    if(MyComponent != none)
    {
        MyComponent.SetFriendlyLabel(NewLabel);
    }
    //return;    
}

defaultproperties
{
    bAutoSizeCaption=true
    ComponentJustification=2
    CaptionWidth=0.5000000
    ComponentWidth=-1.0000000
    LabelFont="UT2MenuFont"
    LabelStyleName="TextLabel"
    LabelColor=(R=0,G=0,B=64,A=255)
    PropagateVisibility=true
    OnCreateComponent=GUIMenuOption.InternalOnCreateComponent
    WinTop=0.3476560
    WinLeft=0.4960940
    WinWidth=0.5000000
    WinHeight=0.0300000
    bAcceptsInput=true
    // Reference: GUIToolTip'XInterface_Decompressed.GUIMenuOption.GUIMenuOptionToolTip'
    begin object name="GUIMenuOptionToolTip" class=XInterface_Decompressed.GUIToolTip
    end object
    ToolTip=GUIMenuOptionToolTip
    OnClickSound=1
    bStandardized=true
    StandardHeight=0.0300000
}