class BTSliderHK extends BTTabPanelHK
    editinlinenew
    instanced;

var export editinline BTOwnerDrawCaptionButtonHK ButtonLeft;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRight;
var export editinline BTOwnerDrawImageHK LabelSliderBack;
var export editinline BTSliderGripButtonHK ButtonSliderGrip;
var float MinValue;
var float MaxValue;
var float ValuePerPixel;
var int StartX;
var int EndX;
var int CMouseX;
var int CMouseY;
var bool bSmoothSlider;
var bool bActiveCursor;
var bool bGrip;
var bool bCanGrip;
var int StartMouseX;
var int StartMouseY;
var int ArrowButtonWidth;
var int GripButtonWidth;
var int CurrentX;
var int SaveX;
var float CurrentValue;
//var delegate<SliderValueToString> __SliderValueToString__Delegate;
//var delegate<OnChangeValue> __OnChangeValue__Delegate;
//var delegate<CanChangeValue> __CanChangeValue__Delegate;

delegate string SliderValueToString(int Value)
{
    return string(Value);
    //return;    
}

function IncrementValue()
{
    SetCurrentValue(CurrentValue + float(1));
    //return;    
}

function DecrementValue()
{
    SetCurrentValue(CurrentValue - float(1));
    //return;    
}

function ButtonSliderGrip_OnMousePressed(GUIComponent Sender, bool bRepeat)
{
    // End:0x35
    if(bGrip == false)
    {
        bGrip = true;
        StartMouseX = CMouseX;
        StartMouseY = CMouseY;
        SaveX = CurrentX;
    }
    //return;    
}

function ButtonSliderGrip_OnMouseRelease(GUIComponent Sender)
{
    // End:0x11
    if(bGrip)
    {
        bGrip = false;
    }
    //return;    
}

function bool ButtonLeft_OnClick(GUIComponent Sender)
{
    DecrementValue();
    OnChangeValue(int(CurrentValue));
    return true;
    //return;    
}

function bool ButtonRight_OnClick(GUIComponent Sender)
{
    IncrementValue();
    OnChangeValue(int(CurrentValue));
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local FloatBox fbEmpty;

    super(GUIPanel).InitComponent(MyController, myOwner);
    fbEmpty = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(0.0000000, 0.0000000, 0.0000000, 0.0000000);
    ButtonLeft = NewButtonComponent(fbEmpty);
    ButtonLeft.CaptionDrawType = 5;
    ButtonLeft.bCaptureMouse = true;
    ButtonLeft.__OnClick__Delegate = ButtonLeft_OnClick;
    ButtonRight = NewButtonComponent(fbEmpty);
    ButtonRight.CaptionDrawType = 3;
    ButtonRight.__OnClick__Delegate = ButtonRight_OnClick;
    ButtonRight.bCaptureMouse = true;
    ButtonLeft.SetDefaultTabButtonFontColor();
    ButtonRight.SetDefaultTabButtonFontColor();
    ButtonSliderGrip = BTSliderGripButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTSliderGripButtonHK', fbEmpty));
    ButtonSliderGrip.SetDefaultSliderGripButtonImage();
    ButtonSliderGrip.__OnMousePressed__Delegate = ButtonSliderGrip_OnMousePressed;
    ButtonSliderGrip.__OnMouseRelease__Delegate = ButtonSliderGrip_OnMouseRelease;
    LabelSliderBack = NewLabelComponent(fbEmpty, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_back);
    self.MinValue = 0.0000000;
    self.MaxValue = 100.0000000;
    bAcceptsInput = true;
    bCaptureMouse = true;
    bNeverFocus = false;
    bSmoothSlider = true;
    //return;    
}

function SetData(int AButtonWidth, int GButtonWidth)
{
    ArrowButtonWidth = AButtonWidth;
    GripButtonWidth = GButtonWidth;
    // End:0x23
    if(ButtonLeft == none)
    {
        return;
    }
    ButtonLeft.AWinPos.Y1 = AWinPos.Y1;
    ButtonLeft.AWinPos.Y2 = AWinPos.Y2;
    ButtonRight.AWinPos.Y1 = AWinPos.Y1;
    ButtonRight.AWinPos.Y2 = AWinPos.Y2;
    ButtonSliderGrip.AWinPos.Y1 = AWinPos.Y1;
    ButtonSliderGrip.AWinPos.Y2 = AWinPos.Y2;
    LabelSliderBack.AWinPos.Y1 = AWinPos.Y1 + ((AWinPos.Y2 - AWinPos.Y1) / float(3));
    LabelSliderBack.AWinPos.Y2 = AWinPos.Y2 - ((AWinPos.Y2 - AWinPos.Y1) / float(3));
    ButtonLeft.AWinPos.X1 = AWinPos.X1;
    ButtonLeft.AWinPos.X2 = AWinPos.X1 + float(ArrowButtonWidth);
    ButtonRight.AWinPos.X1 = AWinPos.X2 - float(ArrowButtonWidth);
    ButtonRight.AWinPos.X2 = AWinPos.X2;
    LabelSliderBack.AWinPos.X1 = ButtonLeft.AWinPos.X2 + float(GripButtonWidth / 2);
    LabelSliderBack.AWinPos.X2 = ButtonRight.AWinPos.X1 - float(GripButtonWidth / 2);
    ButtonLeft.ApplyAWinPos();
    ButtonRight.ApplyAWinPos();
    LabelSliderBack.ApplyAWinPos();
    StartX = int(ButtonLeft.AWinPos.X2);
    EndX = int(ButtonRight.AWinPos.X1 - float(GripButtonWidth));
    ValuePerPixel = (MaxValue - MinValue) / float(EndX - StartX);
    CurrentX = int(Round((CurrentValue * float(EndX - StartX)) / (MaxValue - MinValue)) + float(StartX));
    ButtonSliderGrip.AWinPos.X1 = float(CurrentX);
    ButtonSliderGrip.AWinPos.X2 = float(CurrentX + GripButtonWidth);
    ButtonSliderGrip.ApplyAWinPos();
    //return;    
}

function SetCurrentValue(float Value)
{
    // End:0x1A
    if(Value > MaxValue)
    {
        Value = MaxValue;
    }
    // End:0x34
    if(Value < MinValue)
    {
        Value = MinValue;
    }
    // End:0xF4
    if(CanChangeValue(int(CurrentValue), int(Value)))
    {
        CurrentValue = Value;
        CurrentX = int(Round((CurrentValue * float(EndX - StartX)) / (MaxValue - MinValue)) + float(StartX));
        ButtonSliderGrip.AWinPos.X1 = float(CurrentX);
        ButtonSliderGrip.AWinPos.X2 = float(CurrentX + GripButtonWidth);
        ButtonSliderGrip.SetHighLight(SliderValueToString(int(CurrentValue)));
        ApplyAWinPos();
    }
    //return;    
}

function ApplyAWinPos()
{
    WinLeft = (AWinPos.X1 - AWinFrame.X1) / (AWinFrame.X2 - AWinFrame.X1);
    WinTop = (AWinPos.Y1 - AWinFrame.Y1) / (AWinFrame.Y2 - AWinFrame.Y1);
    WinWidth = (AWinPos.X2 - AWinPos.X1) / (AWinFrame.X2 - AWinFrame.X1);
    WinHeight = (AWinPos.Y2 - AWinPos.Y1) / (AWinFrame.Y2 - AWinFrame.Y1);
    SetData(ArrowButtonWidth, GripButtonWidth);
    //return;    
}

delegate OnChangeValue(int ChangeValue)
{
    //return;    
}

delegate bool CanChangeValue(int PrevValue, int ChangeValue)
{
    return true;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int tempX;
    local float ChangeValue, tempValue, ResX;

    // End:0x0E
    if(bVisible == false)
    {
        return;
    }
    // End:0x20
    if(int(MenuState) == int(4))
    {
        return;
    }
    ResX = 1024.0000000 / float(Controller.ResX);
    CMouseX = int(Controller.MouseX * ResX);
    CMouseY = int(Controller.MouseY);
    // End:0x37C
    if(bGrip)
    {
        // End:0x1CC
        if(bSmoothSlider)
        {
            CurrentX = SaveX + (CMouseX - StartMouseX);
            // End:0xB8
            if(CurrentX < StartX)
            {
                CurrentX = StartX;                
            }
            else
            {
                // End:0xD2
                if(CurrentX > EndX)
                {
                    CurrentX = EndX;
                }
            }
            ButtonSliderGrip.AWinPos.X1 = float(CurrentX);
            ButtonSliderGrip.AWinPos.X2 = float(CurrentX + GripButtonWidth);
            ChangeValue = Round((float(CurrentX - StartX) * (MaxValue - MinValue)) / float(EndX - StartX)) + MinValue;
            // End:0x16B
            if((CanChangeValue(int(CurrentValue), int(ChangeValue))) == false)
            {
                return;
            }
            // End:0x189
            if(int(ChangeValue) != int(CurrentValue))
            {
                CurrentValue = ChangeValue;
            }
            OnChangeValue(int(ChangeValue));
            ButtonSliderGrip.SetHighLight(SliderValueToString(int(CurrentValue)));
            ButtonSliderGrip.ApplyAWinPos();            
        }
        else
        {
            tempX = SaveX + (CMouseX - StartMouseX);
            // End:0x202
            if(tempX < StartX)
            {
                tempX = StartX;                
            }
            else
            {
                // End:0x21C
                if(tempX > EndX)
                {
                    tempX = EndX;
                }
            }
            ChangeValue = ((float(tempX - StartX) * (MaxValue - MinValue)) / float(EndX - StartX)) + MinValue;
            tempValue = Abs(ChangeValue - CurrentValue);
            // End:0x37C
            if((tempValue < 1.5000000) || tempValue > 0.5000000)
            {
                ChangeValue = Ceil(ChangeValue - 0.5000000);
                // End:0x2BD
                if((CanChangeValue(int(CurrentValue), int(ChangeValue))) == false)
                {
                    return;
                }
                CurrentValue = ChangeValue;
                OnChangeValue(int(ChangeValue));
                ButtonSliderGrip.SetHighLight(SliderValueToString(int(ChangeValue)));
                CurrentX = int(Round((ChangeValue * float(EndX - StartX)) / (MaxValue - MinValue)) + float(StartX));
                ButtonSliderGrip.AWinPos.X1 = float(CurrentX);
                ButtonSliderGrip.AWinPos.X2 = float(CurrentX + GripButtonWidth);
                ButtonSliderGrip.ApplyAWinPos();
            }
        }
    }
    //return;    
}

function Internal_OnActivate()
{
    bActiveCursor = true;
    //return;    
}

function Internal_OnDeactivate()
{
    bActiveCursor = false;
    bGrip = false;
    //return;    
}

defaultproperties
{
    bAcceptsInput=true
    bCaptureMouse=true
    bRequireReleaseClick=true
    OnRendered=BTSliderHK.Internal_OnRendered
    OnActivate=BTSliderHK.Internal_OnActivate
    OnDeActivate=BTSliderHK.Internal_OnDeactivate
}