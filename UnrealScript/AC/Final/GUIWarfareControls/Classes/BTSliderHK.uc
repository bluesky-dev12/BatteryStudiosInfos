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
var int startX;
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
var int SaveXPos;
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
        SaveXPos = CurrentX;
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

    super.InitComponent(MyController, myOwner);
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
    ButtonSliderGrip.SetNewSliderGripButtonImage();
    ButtonSliderGrip.__OnMousePressed__Delegate = ButtonSliderGrip_OnMousePressed;
    ButtonSliderGrip.__OnMouseRelease__Delegate = ButtonSliderGrip_OnMouseRelease;
    LabelSliderBack = NewLabelComponent(fbEmpty, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.slider_new_back);
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
    startX = int(ButtonLeft.AWinPos.X2);
    EndX = int(ButtonRight.AWinPos.X1 - float(GripButtonWidth));
    ValuePerPixel = (MaxValue - MinValue) / float(EndX - startX);
    CurrentX = int(Round(((CurrentValue - MinValue) * float(EndX - startX)) / (MaxValue - MinValue)) + float(startX));
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
    // End:0xFB
    if(CanChangeValue(int(CurrentValue), int(Value)))
    {
        CurrentValue = Value;
        CurrentX = int(Round(((CurrentValue - MinValue) * float(EndX - startX)) / (MaxValue - MinValue)) + float(startX));
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

delegate OnChangeValue(int changeValue)
{
    //return;    
}

delegate bool CanChangeValue(int PrevValue, int changeValue)
{
    return true;
    //return;    
}

function Internal_OnRendered(Canvas C)
{
    local int tempX;
    local float changeValue, tempValue, ResX;

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
    // End:0x383
    if(bGrip)
    {
        // End:0x1CC
        if(bSmoothSlider)
        {
            CurrentX = SaveXPos + (CMouseX - StartMouseX);
            // End:0xB8
            if(CurrentX < startX)
            {
                CurrentX = startX;                
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
            changeValue = Round((float(CurrentX - startX) * (MaxValue - MinValue)) / float(EndX - startX)) + MinValue;
            // End:0x16B
            if((CanChangeValue(int(CurrentValue), int(changeValue))) == false)
            {
                return;
            }
            // End:0x189
            if(int(changeValue) != int(CurrentValue))
            {
                CurrentValue = changeValue;
            }
            OnChangeValue(int(changeValue));
            ButtonSliderGrip.SetHighLight(SliderValueToString(int(CurrentValue)));
            ButtonSliderGrip.ApplyAWinPos();            
        }
        else
        {
            tempX = SaveXPos + (CMouseX - StartMouseX);
            // End:0x202
            if(tempX < startX)
            {
                tempX = startX;                
            }
            else
            {
                // End:0x21C
                if(tempX > EndX)
                {
                    tempX = EndX;
                }
            }
            changeValue = ((float(tempX - startX) * (MaxValue - MinValue)) / float(EndX - startX)) + MinValue;
            tempValue = Abs(changeValue - CurrentValue);
            // End:0x383
            if((tempValue < 1.5000000) || tempValue > 0.5000000)
            {
                changeValue = Ceil(changeValue - 0.5000000);
                // End:0x2BD
                if((CanChangeValue(int(CurrentValue), int(changeValue))) == false)
                {
                    return;
                }
                CurrentValue = changeValue;
                OnChangeValue(int(changeValue));
                ButtonSliderGrip.SetHighLight(SliderValueToString(int(changeValue)));
                CurrentX = int(Round(((changeValue - MinValue) * float(EndX - startX)) / (MaxValue - MinValue)) + float(startX));
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