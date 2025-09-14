/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUISlider.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:18
 *	Functions:21
 *
 *******************************************************************************/
class GUISlider extends GUIComponent
    dependson(GUIToolTip)
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
var delegate<CalcMarkerPosition> __CalcMarkerPosition__Delegate;
var delegate<OnPreDrawCaption> __OnPreDrawCaption__Delegate;
var delegate<OnDrawCaption> __OnDrawCaption__Delegate;

delegate float CalcMarkerPosition();
delegate bool OnPreDrawCaption(out float X, out float Y, out float XL, out float YL, out GUI.eTextAlign Justification);
delegate string OnDrawCaption()
{
    // End:0x2d
    if(bIntSlider)
    {
        return "(" $ string(int(Value)) $ Eval(bDrawPercentSign, " %", "") $ ")";
    }
    return "(" $ string(Value) $ Eval(bDrawPercentSign, " %", "") $ ")";
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    CaptionStyle = Controller.GetStyle(CaptionStyleName, FontScale);
    BarStyle = Controller.GetStyle(BarStyleName, FontScale);
}

function bool InternalCapturedMouseMove(float deltaX, float deltaY)
{
    local float perc;

    // End:0x0b
    if(bReadOnly)
    {
        return true;
    }
    // End:0xba
    if(Controller.MouseX >= Bounds[0] && Controller.MouseX <= Bounds[2])
    {
        perc = FClamp(Controller.MouseX - ActualLeft() + MarkerWidth / float(2) / ActualWidth() - MarkerWidth, 0.0, 1.0);
        Value = MaxValue - MinValue * perc + MinValue;
        // End:0xb7
        if(bIntSlider)
        {
            Value = Round(Value);
        }
    }
    // End:0x108
    else
    {
        // End:0xe2
        if(Controller.MouseX < Bounds[0])
        {
            Value = MinValue;
        }
        // End:0x108
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
    // End:0x13d
    if(bShowValueTooltip)
    {
        ToolTip.SetTip(GetValueString());
    }
    return true;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x0b
    if(bReadOnly)
    {
        return false;
    }
    // End:0x4c
    if(key == 37 && State == 1)
    {
        // End:0x3f
        if(bIntSlider)
        {
            Adjust(-1.0);
        }
        // End:0x4a
        else
        {
            Adjust(-0.010);
        }
        return true;
    }
    // End:0x8d
    if(key == 39 && State == 1)
    {
        // End:0x80
        if(bIntSlider)
        {
            Adjust(1.0);
        }
        // End:0x8b
        else
        {
            Adjust(0.010);
        }
        return true;
    }
    return false;
}

function float SetValue(float NewValue)
{
    Value = FClamp(NewValue, MinValue, MaxValue);
    // End:0x2e
    if(bIntSlider)
    {
        Value = Round(Value);
    }
    return Value;
}

function Adjust(float Amount)
{
    local float perc;

    perc = Value - MinValue / MaxValue - MinValue;
    perc += Amount;
    perc = FClamp(perc, 0.0, 1.0);
    Value = FClamp(MaxValue - MinValue * perc + MinValue, MinValue, MaxValue);
    OnChange(self);
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x0f
    if(bShowValueTooltip)
    {
        RevertTooltipToNormal();
    }
    OnChange(self);
    return true;
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
        InternalCapturedMouseMove(0.0, 0.0);
    }
}

function InternalOnMouseRelease(GUIComponent Sender)
{
    InternalCapturedMouseMove(0.0, 0.0);
}

function SetReadOnly(bool B)
{
    bReadOnly = B;
}

function float InternalCalcMarkerPosition()
{
    local float perc;

    perc = Value - MinValue / MaxValue - MinValue;
    return ActualLeft() + ActualWidth() - MarkerWidth * perc;
}

event float GetMarkerPosition()
{
    return CalcMarkerPosition();
}

function CenterMouse()
{
    // End:0x3d
    if(PlayerOwner() != none)
    {
        PlayerOwner().ConsoleCommand("SETMOUSE" @ string(GetMarkerPosition()) @ string(ActualTop() + ActualHeight() / float(2)));
    }
}

function string GetValueString()
{
    local string ValueStr;

    // End:0x1b
    if(bIntSlider)
    {
        ValueStr = string(int(Value));
    }
    // End:0x28
    else
    {
        ValueStr = string(Value);
    }
    // End:0x3d
    if(bDrawPercentSign)
    {
        ValueStr @= "%";
    }
    return ValueStr;
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
}

function ShowToolTip()
{
    Controller.MouseOver = ToolTip.InternalEnterArea();
    ToolTip.SetVisibility(true);
}

function HideToolTip()
{
    // End:0x51
    if(MenuState != 3)
    {
        Log("HideToolTip  MenuState:" $ string(GetEnum(enum'eMenuState', MenuState)));
        ToolTip.SetVisibility(false);
    }
}

function bool ToolTipLeaveArea()
{
    return false;
}

defaultproperties
{
    MaxValue=100.0
    bShowMarker=true
    bShowValueTooltip=true
    CaptionStyleName="SliderCaption"
    BarStyleName="SliderBar"
    CalcMarkerPosition=InternalCalcMarkerPosition
    StyleName="SliderKnob"
    WinHeight=0.030
    bTabStop=true
    bAcceptsInput=true
    bCaptureMouse=true
    bRequireReleaseClick=true
    bRequiresStyle=true
    ToolTip=GUISliderToolTip
    OnClickSound=1
    OnClick=InternalOnClick
    OnMousePressed=InternalOnMousePressed
    OnMouseRelease=InternalOnMouseRelease
    OnKeyEvent=InternalOnKeyEvent
    OnCapturedMouseMove=InternalCapturedMouseMove
}