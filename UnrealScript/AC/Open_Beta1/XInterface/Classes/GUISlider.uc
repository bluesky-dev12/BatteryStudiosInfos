class GUISlider extends GUIComponent
    native
    editinlinenew
    instanced;

var() float MinValue;
var() float MaxValue;
var() float Value;
var() float MarkerWidth;
var() bool bIntSlider;
var() bool bShowMarker;
var() bool bShowCaption;
var() bool bDrawPercentSign;
var() bool bReadOnly;
var() bool bShowValueTooltip;
var() Material FillImage;
var() string CaptionStyleName;
var() string BarStyleName;
var export editinline GUIStyles CaptionStyle;
var export editinline GUIStyles BarStyle;
//var delegate<CalcMarkerPosition> __CalcMarkerPosition__Delegate;
//var delegate<OnPreDrawCaption> __OnPreDrawCaption__Delegate;
//var delegate<OnDrawCaption> __OnDrawCaption__Delegate;

delegate float CalcMarkerPosition()
{
    //return;    
}

delegate bool OnPreDrawCaption(out float X, out float Y, out float XL, out float YL, out GUI.eTextAlign Justification)
{
    //return;    
}

delegate string OnDrawCaption()
{
    // End:0x2D
    if(bIntSlider)
    {
        return (("(" $ string(int(Value))) $ Eval(bDrawPercentSign, " %", "")) $ ")";
    }
    return (("(" $ string(Value)) $ Eval(bDrawPercentSign, " %", "")) $ ")";
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    CaptionStyle = Controller.GetStyle(CaptionStyleName, FontScale);
    BarStyle = Controller.GetStyle(BarStyleName, FontScale);
    //return;    
}

function bool InternalCapturedMouseMove(float deltaX, float deltaY)
{
    local float perc;

    // End:0x0B
    if(bReadOnly)
    {
        return true;
    }
    // End:0xBA
    if((Controller.MouseX >= Bounds[0]) && Controller.MouseX <= Bounds[2])
    {
        perc = FClamp((Controller.MouseX - (ActualLeft() + (MarkerWidth / float(2)))) / (ActualWidth() - MarkerWidth), 0.0000000, 1.0000000);
        Value = ((MaxValue - MinValue) * perc) + MinValue;
        // End:0xB7
        if(bIntSlider)
        {
            Value = Round(Value);
        }        
    }
    else
    {
        // End:0xE2
        if(Controller.MouseX < Bounds[0])
        {
            Value = MinValue;            
        }
        else
        {
            // End:0x108
            if(Controller.MouseX > Bounds[2])
            {
                Value = MaxValue;
            }
        }
    }
    Value = FClamp(Value, MinValue, MaxValue);
    // End:0x13D
    if(bShowValueTooltip)
    {
        ToolTip.SetTip(GetValueString());
    }
    return true;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x0B
    if(bReadOnly)
    {
        return false;
    }
    // End:0x4C
    if((int(key) == 37) && int(State) == 1)
    {
        // End:0x3F
        if(bIntSlider)
        {
            Adjust(-1.0000000);            
        }
        else
        {
            Adjust(-0.0100000);
        }
        return true;
    }
    // End:0x8D
    if((int(key) == 39) && int(State) == 1)
    {
        // End:0x80
        if(bIntSlider)
        {
            Adjust(1.0000000);            
        }
        else
        {
            Adjust(0.0100000);
        }
        return true;
    }
    return false;
    //return;    
}

function float SetValue(float NewValue)
{
    Value = FClamp(NewValue, MinValue, MaxValue);
    // End:0x2E
    if(bIntSlider)
    {
        Value = Round(Value);
    }
    return Value;
    //return;    
}

function Adjust(float Amount)
{
    local float perc;

    perc = (Value - MinValue) / (MaxValue - MinValue);
    perc += Amount;
    perc = FClamp(perc, 0.0000000, 1.0000000);
    Value = FClamp(((MaxValue - MinValue) * perc) + MinValue, MinValue, MaxValue);
    OnChange(self);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x0F
    if(bShowValueTooltip)
    {
        RevertTooltipToNormal();
    }
    OnChange(self);
    return true;
    //return;    
}

function InternalOnMousePressed(GUIComponent Sender, bool RepeatClick)
{
    // End:0x33
    if(bVisible && IsInBounds())
    {
        // End:0x23
        if(bShowValueTooltip)
        {
            ModifyTooltipForDragging();
        }
        InternalCapturedMouseMove(0.0000000, 0.0000000);
    }
    //return;    
}

function InternalOnMouseRelease(GUIComponent Sender)
{
    InternalCapturedMouseMove(0.0000000, 0.0000000);
    //return;    
}

function SetReadOnly(bool B)
{
    bReadOnly = B;
    //return;    
}

function float InternalCalcMarkerPosition()
{
    local float perc;

    perc = (Value - MinValue) / (MaxValue - MinValue);
    return ActualLeft() + ((ActualWidth() - MarkerWidth) * perc);
    //return;    
}

event float GetMarkerPosition()
{
    return CalcMarkerPosition();
    //return;    
}

function CenterMouse()
{
    // End:0x3D
    if(PlayerOwner() != none)
    {
        PlayerOwner().ConsoleCommand(("SETMOUSE" @ string(GetMarkerPosition())) @ string(ActualTop() + (ActualHeight() / float(2))));
    }
    //return;    
}

function string GetValueString()
{
    local string ValueStr;

    // End:0x1B
    if(bIntSlider)
    {
        ValueStr = string(int(Value));        
    }
    else
    {
        ValueStr = string(Value);
    }
    // End:0x3D
    if(bDrawPercentSign)
    {
        ValueStr @= "%";
    }
    return ValueStr;
    //return;    
}

function ModifyTooltipForDragging()
{
    ToolTip.bTrackMouse = true;
    ToolTip.bTrackInput = false;
    ToolTip.bMultiLine = false;
    ToolTip.__HideToolTip__Delegate = HideToolTip;
    ToolTip.__LeaveArea__Delegate = ToolTipLeaveArea;
    SetToolTipText(GetValueString());
    ShowToolTip();
    //return;    
}

function RevertTooltipToNormal()
{
    ToolTip.bTrackMouse = ToolTip.default.bTrackMouse;
    ToolTip.bTrackInput = ToolTip.default.bTrackInput;
    ToolTip.bMultiLine = ToolTip.default.bMultiLine;
    ToolTip.__HideToolTip__Delegate = None;
    ToolTip.__LeaveArea__Delegate = None;
    ToolTip.LeaveArea();
    SetToolTipText(Hint);
    //return;    
}

function ShowToolTip()
{
    Controller.MouseOver = ToolTip.InternalEnterArea();
    ToolTip.SetVisibility(true);
    //return;    
}

function HideToolTip()
{
    // End:0x51
    if(int(MenuState) != int(3))
    {
        Log("HideToolTip  MenuState:" $ string(GetEnum(Enum'XInterface_Decompressed.GUI.eMenuState', int(MenuState))));
        ToolTip.SetVisibility(false);
    }
    //return;    
}

function bool ToolTipLeaveArea()
{
    return false;
    //return;    
}

defaultproperties
{
    MaxValue=100.0000000
    bShowMarker=true
    bShowValueTooltip=true
    CaptionStyleName="SliderCaption"
    BarStyleName="SliderBar"
    CalcMarkerPosition=GUISlider.InternalCalcMarkerPosition
    StyleName="SliderKnob"
    WinHeight=0.0300000
    bTabStop=true
    bAcceptsInput=true
    bCaptureMouse=true
    bRequireReleaseClick=true
    bRequiresStyle=true
    // Reference: GUIToolTip'XInterface_Decompressed.GUISlider.GUISliderToolTip'
    begin object name="GUISliderToolTip" class=XInterface_Decompressed.GUIToolTip
    end object
    ToolTip=GUISliderToolTip
    OnClickSound=1
    OnClick=GUISlider.InternalOnClick
    OnMousePressed=GUISlider.InternalOnMousePressed
    OnMouseRelease=GUISlider.InternalOnMouseRelease
    OnKeyEvent=GUISlider.InternalOnKeyEvent
    OnCapturedMouseMove=GUISlider.InternalCapturedMouseMove
}