class BTPageOption_Control extends BTPageOption_Base
    editinlinenew
    instanced;

var bool bAim;
var bool bSlope;
var bool bInvert;
var bool bSmoothing;
var bool bJoystick;
var bool bWFX;
var bool bPFX;
var bool bDFX;
var bool bGFX;
var bool bLag;
var float fSens;
var float fMSens;
var float fAccel;
var float fSmoothing;
var float fDodge;
var() automated GUILabel LabelMouseSensitivity;
var() automated BTSliderSet SlideMouseSensitivity;
var() automated GUILabel LabelMouseInvert;
var() automated BTCheckBoxSet CbsetMouseInvert;
var() automated GUILabel LabelMouseAcc;
var() automated BTCheckBoxSet CbsetMouseAcc;
var() automated FloatingImage Separator1;
var() automated WControlBinder ControlBinderPanel;
var localized string CaptionMouseSensitivity;
var localized string CaptionMouseInvert;
var localized string CaptionMouseAcc;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ApplyLocalizedStrings();
    CbsetMouseAcc.SetEnabled(false);
    ControlBinderPanel.NewIndex = -1;
    //return;    
}

function ApplyLocalizedStrings()
{
    LabelMouseSensitivity.Caption = CaptionMouseSensitivity;
    LabelMouseInvert.Caption = CaptionMouseInvert;
    LabelMouseAcc.Caption = CaptionMouseAcc;
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local PlayerController PC;

    PC = PlayerOwner();
    switch(Sender)
    {
        // End:0x46
        case CbsetMouseInvert:
            bInvert = Class'Engine.PlayerInput'.default.bInvertMouse;
            CbsetMouseInvert.SetValue(bInvert);
            // End:0x8B
            break;
        // End:0x88
        case SlideMouseSensitivity:
            fSens = Class'Engine.PlayerInput'.default.MouseSensitivity;
            SlideMouseSensitivity.Slide.Value = fSens * float(4);
            // End:0x8B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool SaveSettings()
{
    local PlayerController PC;
    local bool bSave, bInputSave, bIForce;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0x48
    if(Class'Engine.PlayerInput'.default.bInvertMouse != bInvert)
    {
        PC.InvertMouse(string(bInvert));
        bInputSave = false;
    }
    // End:0x83
    if(Class'Engine.PlayerInput'.default.MouseSensitivity != FMax(0.0000000, fSens))
    {
        PC.SetSensitivity(fSens);
        bInputSave = false;
    }
    // End:0x9B
    if(bInputSave)
    {
        Class'Engine.PlayerInput'.static.StaticSaveConfig();
    }
    // End:0xEA
    if(bIForce)
    {
        PC.bForceFeedbackSupported = PC.ForceFeedbackSupported(((bGFX || bWFX) || bPFX) || bDFX);
    }
    // End:0xFF
    if(bSave)
    {
        PC.SaveConfig();
    }
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    switch(Sender)
    {
        // End:0x28
        case CbsetMouseInvert:
            bInvert = CbsetMouseInvert.GetValue();
            // End:0x5A
            break;
        // End:0x57
        case SlideMouseSensitivity:
            fSens = SlideMouseSensitivity.Slide.Value / 4.0000000;
            // End:0x5A
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ResetSettings()
{
    Log("[BTPageOption_Control::ResetSettings]");
    ControlBinderPanel.ResetKeyBindings();
    //return;    
}

defaultproperties
{
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Control.mLabelMouseSensitivity'
    begin object name="mLabelMouseSensitivity" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.2591146
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelMouseSensitivity=mLabelMouseSensitivity
    // Reference: BTSliderSet'GUIWarfare_Decompressed.BTPageOption_Control.mSlideMouseSensitivity'
    begin object name="mSlideMouseSensitivity" class=GUIWarfareControls.BTSliderSet
        IniOption="@Internal"
        WinTop=0.2591146
        OnPreDraw=mSlideMouseSensitivity.InternalOnPreDraw
        OnChange=BTPageOption_Control.InternalOnChange
        OnLoadINI=BTPageOption_Control.InternalOnLoadINI
    end object
    SlideMouseSensitivity=mSlideMouseSensitivity
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Control.mLabelMouseInvert'
    begin object name="mLabelMouseInvert" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.2981771
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelMouseInvert=mLabelMouseInvert
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Control.mCbsetMouseInvert'
    begin object name="mCbsetMouseInvert" class=GUIWarfareControls.BTCheckBoxSet
        IniOption="@Internal"
        WinTop=0.2981771
        OnPreDraw=mCbsetMouseInvert.InternalOnPreDraw
        OnChange=BTPageOption_Control.InternalOnChange
        OnLoadINI=BTPageOption_Control.InternalOnLoadINI
    end object
    CbsetMouseInvert=mCbsetMouseInvert
    // Reference: GUILabel'GUIWarfare_Decompressed.BTPageOption_Control.mLabelMouseAcc'
    begin object name="mLabelMouseAcc" class=XInterface.GUILabel
        TextColor=(R=255,G=255,B=255,A=255)
        FontSize=9
        WinTop=0.3372396
        WinLeft=0.2949219
        WinWidth=0.0937500
        WinHeight=0.0312500
    end object
    LabelMouseAcc=mLabelMouseAcc
    // Reference: BTCheckBoxSet'GUIWarfare_Decompressed.BTPageOption_Control.mCbsetMouseAcc'
    begin object name="mCbsetMouseAcc" class=GUIWarfareControls.BTCheckBoxSet
        WinTop=0.3372396
        OnPreDraw=mCbsetMouseAcc.InternalOnPreDraw
    end object
    CbsetMouseAcc=mCbsetMouseAcc
    // Reference: FloatingImage'GUIWarfare_Decompressed.BTPageOption_Control.mSeparator1'
    begin object name="mSeparator1" class=XInterface.FloatingImage
        Image=Texture'Warfare_UI.Common_1.line_bagic_2pixel'
        X1=0
        Y1=0
        X2=2
        Y2=2
        DropShadowX=0
        DropShadowY=0
        WinTop=0.3997396
        WinLeft=0.2939453
        WinWidth=0.3974609
        WinHeight=0.0013021
        RenderWeight=0.2000000
    end object
    Separator1=mSeparator1
    // Reference: WControlBinder'GUIWarfare_Decompressed.BTPageOption_Control.mControlBinderPanel'
    begin object name="mControlBinderPanel" class=GUIWarfareControls.WControlBinder
        WinTop=0.4153646
        WinLeft=0.2949219
        WinWidth=0.3974609
        WinHeight=0.3125000
    end object
    ControlBinderPanel=mControlBinderPanel
    CaptionMouseSensitivity="??? ???"
    CaptionMouseInvert="??? ?? ??"
    CaptionMouseAcc="??? ??"
}