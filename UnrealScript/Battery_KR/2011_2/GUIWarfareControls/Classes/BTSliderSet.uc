class BTSliderSet extends GUIPanel
    editinlinenew
    instanced;

var() automated GUISlider Slide;
var() automated GUIButton SlideLButton;
var() automated GUIButton SlideRButton;
var() bool bUseSmoothSlide;
var float Delta;
var float AccmulatedDelta;
var() float Velocity;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    PositionControls();
    // End:0x72
    if(bUseSmoothSlide)
    {
        SlideLButton.__OnMousePressed__Delegate = SlideButton_OnPress;
        SlideLButton.__OnMouseRelease__Delegate = SlideButton_OnRelease;
        SlideRButton.__OnMousePressed__Delegate = SlideButton_OnPress;
        SlideRButton.__OnMouseRelease__Delegate = SlideButton_OnRelease;        
    }
    else
    {
        SlideLButton.__OnClick__Delegate = SlideButton_OnClick;
        SlideRButton.__OnClick__Delegate = SlideButton_OnClick;
    }
    //return;    
}

function PositionControls()
{
    SlideLButton.WinTop = WinTop;
    SlideRButton.WinTop = WinTop;
    Slide.WinTop = WinTop;
    //return;    
}

function bool SlideButton_OnClick(GUIComponent Sender)
{
    local int dt;

    // End:0x1D
    if(Sender == SlideLButton)
    {
        dt = -1;        
    }
    else
    {
        // End:0x33
        if(Sender == SlideRButton)
        {
            dt = 1;
        }
    }
    Slide.SetValue(Slide.Value + float(dt));
    InternalOnChange(self);
    return true;
    //return;    
}

function SlideButton_OnPress(GUIComponent Sender, bool bRepeat)
{
    // End:0x1D
    if(Sender == SlideLButton)
    {
        Delta = -1.0000000;        
    }
    else
    {
        // End:0x37
        if(Sender == SlideRButton)
        {
            Delta = 1.0000000;
        }
    }
    //return;    
}

function SlideButton_OnRelease(GUIComponent Sender)
{
    Delta = 0.0000000;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    PositionControls();
    AccmulatedDelta += ((Delta * Controller.RenderDelta) * Velocity);
    // End:0x3F
    if(Delta != float(0))
    {
        Log(string(AccmulatedDelta));
    }
    // End:0x85
    if(Abs(AccmulatedDelta) > float(1))
    {
        AccmulatedDelta -= Delta;
        Slide.SetValue(Slide.Value + Delta);
        InternalOnChange(self);
    }
    return false;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    OnChange(self);
    //return;    
}

defaultproperties
{
    // Reference: GUISlider'GUIWarfareControls_Decompressed.BTSliderSet.mSlide'
    begin object name="mSlide" class=XInterface.GUISlider
        bIntSlider=true
        BarStyleName="STY2Warfare_SliderBar"
        CalcMarkerPosition=mSlide.InternalCalcMarkerPosition
        StyleName="STY2Warfare_SliderKnob"
        WinTop=0.3763021
        WinLeft=0.4111328
        WinWidth=0.2265625
        WinHeight=0.0208333
        OnClick=mSlide.InternalOnClick
        OnMousePressed=mSlide.InternalOnMousePressed
        OnMouseRelease=mSlide.InternalOnMouseRelease
        OnChange=BTSliderSet.InternalOnChange
        OnKeyEvent=mSlide.InternalOnKeyEvent
        OnCapturedMouseMove=mSlide.InternalCapturedMouseMove
    end object
    Slide=mSlide
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTSliderSet.mSlideLButton'
    begin object name="mSlideLButton" class=XInterface.GUIButton
        StyleName="STY2Warfare_SliderLButton"
        WinTop=0.3763021
        WinLeft=0.3984375
        WinWidth=0.0126953
        WinHeight=0.0208333
        RenderWeight=0.5100000
        OnKeyEvent=mSlideLButton.InternalOnKeyEvent
    end object
    SlideLButton=mSlideLButton
    // Reference: GUIButton'GUIWarfareControls_Decompressed.BTSliderSet.mSlideRButton'
    begin object name="mSlideRButton" class=XInterface.GUIButton
        StyleName="STY2Warfare_SliderRButton"
        WinTop=0.3763021
        WinLeft=0.6376953
        WinWidth=0.0126953
        WinHeight=0.0208333
        RenderWeight=0.5100000
        OnKeyEvent=mSlideRButton.InternalOnKeyEvent
    end object
    SlideRButton=mSlideRButton
    bUseSmoothSlide=true
    Velocity=75.0000000
    SetControlsBoundToParent=false
    SetControlsScaleToParent=false
    WinTop=0.3763021
    WinLeft=0.3984375
    WinWidth=0.2421875
    WinHeight=0.0312500
    OnPreDraw=BTSliderSet.InternalOnPreDraw
}