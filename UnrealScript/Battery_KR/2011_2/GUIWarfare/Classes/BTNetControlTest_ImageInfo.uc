class BTNetControlTest_ImageInfo extends FloatingWindow
    editinlinenew
    instanced;

var() automated FloatingImage Image;
var() automated moCheckBox Checkbox;
var() automated GUIProgressBar ProgressBar;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    //return;    
}

event Opened(GUIComponent Sender)
{
    FocusFirst(none);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    return false;
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

function CheckBox_OnChange(GUIComponent Sender)
{
    // End:0x20
    if(Checkbox.IsChecked())
    {
        SetInactiveFadeColor(60.0000000);        
    }
    else
    {
        SetInactiveFadeColor(255.0000000);
    }
    ProgressBar.bAcceptsInput = Checkbox.IsChecked();
    bCaptureInput = Checkbox.IsChecked();
    //return;    
}

function float GetInactiveFadeColor()
{
    return ProgressBar.Value;
    //return;    
}

function SetInactiveFadeColor(float C)
{
    InactiveFadeColor.R = byte(C);
    InactiveFadeColor.G = byte(C);
    InactiveFadeColor.B = byte(C);
    InactiveFadeColor.A = byte(255);
    ProgressBar.Value = C;
    //return;    
}

function bool ProgressBar_OnClick(GUIComponent Sender)
{
    ProgressBar_ChangeValue(10.0000000);
    return true;
    //return;    
}

function bool ProgressBar_OnRightClick(GUIComponent Sender)
{
    ProgressBar_ChangeValue(-10.0000000);
    return true;
    //return;    
}

function ProgressBar_ChangeValue(float Delta)
{
    local float oldC, NewC;

    oldC = GetInactiveFadeColor();
    NewC = oldC + Delta;
    SetInactiveFadeColor(NewC);
    //return;    
}

defaultproperties
{
    // Reference: FloatingImage'GUIWarfare_Decompressed.BTNetControlTest_ImageInfo.mImage'
    begin object name="mImage" class=XInterface.FloatingImage
        WinTop=0.0744150
        WinLeft=0.0910900
        WinWidth=0.8081910
        WinHeight=0.6790600
        RenderWeight=1.0000000
    end object
    Image=mImage
    // Reference: moCheckBox'GUIWarfare_Decompressed.BTNetControlTest_ImageInfo.mCheckBox'
    begin object name="mCheckBox" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Click to Lock"
        OnCreateComponent=mCheckBox.InternalOnCreateComponent
        Hint="No Hint Whatsoever.."
        WinTop=0.8234930
        WinLeft=0.2936130
        WinHeight=0.0652120
        OnChange=BTNetControlTest_ImageInfo.CheckBox_OnChange
    end object
    Checkbox=mCheckBox
    // Reference: GUIProgressBar'GUIWarfare_Decompressed.BTNetControlTest_ImageInfo.mProgressBar'
    begin object name="mProgressBar" class=XInterface.GUIProgressBar
        High=255.0000000
        Value=255.0000000
        WinTop=0.8838160
        WinLeft=-0.1425220
        WinWidth=0.9517110
        WinHeight=0.0652120
        bRepeatClick=true
        OnClick=BTNetControlTest_ImageInfo.ProgressBar_OnClick
        OnRightClick=BTNetControlTest_ImageInfo.ProgressBar_OnRightClick
    end object
    ProgressBar=mProgressBar
    WindowName="Image Info"
    bResizeWidthAllowed=false
    bResizeHeightAllowed=false
    DefaultLeft=0.1559440
    DefaultTop=0.0873520
    DefaultWidth=0.3128670
    DefaultHeight=0.4844060
    bPersistent=true
    WinTop=0.0873520
    WinLeft=0.1559440
    WinWidth=0.3128670
    WinHeight=0.4844060
}