/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_IForceSettings.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:37
 *	Functions:6
 *
 *******************************************************************************/
class UT2K4Tab_IForceSettings extends Settings_Tabs
    dependson(Settings_Tabs)
    dependson(UT2K4Tab_PlayerSettings)
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_IForce;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AutoSlope;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_InvertMouse;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_MouseSmoothing;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Joystick;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_WeaponEffects;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_PickupEffects;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_DamageEffects;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_GUIEffects;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_MouseLag;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moFloatEdit fl_Sensitivity;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moFloatEdit fl_MenuSensitivity;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moFloatEdit fl_MouseAccel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moFloatEdit fl_SmoothingStrength;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moFloatEdit fl_DodgeTime;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Controls;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Speech;
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
var config string ControlBindMenu;
var config string SpeechBindMenu;

event InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    i_BG1.ManageComponent(ch_AutoSlope);
    i_BG1.ManageComponent(ch_InvertMouse);
    i_BG1.ManageComponent(ch_MouseSmoothing);
    i_BG1.ManageComponent(ch_MouseLag);
    i_BG1.ManageComponent(ch_Joystick);
    i_BG1.ManageComponent(b_Controls);
    i_BG1.ManageComponent(b_Speech);
    i_BG3.ManageComponent(fl_Sensitivity);
    i_BG3.ManageComponent(fl_MenuSensitivity);
    i_BG3.ManageComponent(fl_SmoothingStrength);
    i_BG3.ManageComponent(fl_MouseAccel);
    i_BG3.ManageComponent(fl_DodgeTime);
    // End:0x152
    if(!PlatformIsWindows() || PlatformIs64Bit())
    {
        ch_WeaponEffects.DisableMe();
        ch_PickupEffects.DisableMe();
        ch_DamageEffects.DisableMe();
        ch_GUIEffects.DisableMe();
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local PlayerController PC;

    PC = PlayerOwner();
    switch(Sender)
    {
        // End:0x49
        case ch_AutoSlope:
            bSlope = PC.bSnapToLevel;
            ch_AutoSlope.SetComponentValue(string(bSlope), true);
            // End:0x3eb
            break;
        // End:0x82
        case ch_InvertMouse:
            bInvert = class'PlayerInput'.default.bInvertMouse;
            ch_InvertMouse.SetComponentValue(string(bInvert), true);
            // End:0x3eb
            break;
        // End:0xbf
        case ch_MouseSmoothing:
            bSmoothing = class'PlayerInput'.default.MouseSmoothingMode > 0;
            ch_MouseSmoothing.SetComponentValue(string(bSmoothing), true);
            // End:0x3eb
            break;
        // End:0x12d
        case ch_Joystick:
            bJoystick = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseJoystick"));
            ch_Joystick.SetComponentValue(string(bJoystick), true);
            // End:0x3eb
            break;
        // End:0x166
        case ch_WeaponEffects:
            bWFX = PC.bEnableWeaponForceFeedback;
            ch_WeaponEffects.SetComponentValue(string(bWFX), true);
            // End:0x3eb
            break;
        // End:0x19f
        case ch_PickupEffects:
            bPFX = PC.bEnablePickupForceFeedback;
            ch_PickupEffects.SetComponentValue(string(bPFX), true);
            // End:0x3eb
            break;
        // End:0x1d8
        case ch_DamageEffects:
            bDFX = PC.bEnableDamageForceFeedback;
            ch_DamageEffects.SetComponentValue(string(bDFX), true);
            // End:0x3eb
            break;
        // End:0x211
        case ch_GUIEffects:
            bGFX = PC.bEnableGUIForceFeedback;
            ch_GUIEffects.SetComponentValue(string(bGFX), true);
            // End:0x3eb
            break;
        // End:0x27c
        case ch_MouseLag:
            bLag = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice ReduceMouseLag"));
            ch_MouseLag.Checked(bLag);
            // End:0x3eb
            break;
        // End:0x2b2
        case fl_Sensitivity:
            fSens = class'PlayerInput'.default.MouseSensitivity;
            fl_Sensitivity.SetComponentValue(string(fSens), true);
            // End:0x3eb
            break;
        // End:0x2e8
        case fl_MenuSensitivity:
            fMSens = Controller.MenuMouseSens;
            fl_MenuSensitivity.SetComponentValue(string(fMSens), true);
            // End:0x3eb
            break;
        // End:0x31e
        case fl_MouseAccel:
            fAccel = class'PlayerInput'.default.MouseAccelThreshold;
            fl_MouseAccel.SetComponentValue(string(fAccel), true);
            // End:0x3eb
            break;
        // End:0x354
        case fl_SmoothingStrength:
            fSmoothing = class'PlayerInput'.default.MouseSmoothingStrength;
            fl_SmoothingStrength.SetComponentValue(string(fSmoothing), true);
            // End:0x3eb
            break;
        // End:0x38a
        case fl_DodgeTime:
            fDodge = class'PlayerInput'.default.DoubleClickTime;
            fl_DodgeTime.SetComponentValue(string(fDodge), true);
            // End:0x3eb
            break;
        // End:0xffff
        default:
            Log(string(Name) @ "Unknown component calling LoadINI:" $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
}

function SaveSettings()
{
    local PlayerController PC;
    local bool bSave, bInputSave, bIForce;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0xab
    if(bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseJoystick")) != bJoystick)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager UseJoystick" @ string(bJoystick));
    }
    // End:0x147
    if(bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice ReduceMouseLag")) != bLag)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice ReduceMouseLag" @ string(bLag));
    }
    // End:0x17f
    if(PC.bSnapToLevel != bSlope)
    {
        PC.bSnapToLevel = bSlope;
        bSave = true;
    }
    // End:0x1bf
    if(PC.bEnableWeaponForceFeedback != bWFX)
    {
        PC.bEnableWeaponForceFeedback = bWFX;
        bSave = true;
        bIForce = true;
    }
    // End:0x1ff
    if(PC.bEnablePickupForceFeedback != bPFX)
    {
        PC.bEnablePickupForceFeedback = bPFX;
        bIForce = true;
        bSave = true;
    }
    // End:0x23f
    if(PC.bEnableDamageForceFeedback != bDFX)
    {
        PC.bEnableDamageForceFeedback = bDFX;
        bIForce = true;
        bSave = true;
    }
    // End:0x27f
    if(PC.bEnableGUIForceFeedback != bGFX)
    {
        PC.bEnableGUIForceFeedback = bGFX;
        bIForce = true;
        bSave = true;
    }
    // End:0x2aa
    if(Controller.MenuMouseSens != FMax(0.0, fMSens))
    {
        Controller.SaveConfig();
    }
    // End:0x2e5
    if(class'PlayerInput'.default.DoubleClickTime != FMax(0.0, fDodge))
    {
        class'PlayerInput'.default.DoubleClickTime = fDodge;
        bInputSave = true;
    }
    // End:0x320
    if(class'PlayerInput'.default.MouseAccelThreshold != FMax(0.0, fAccel))
    {
        PC.SetMouseAccel(fAccel);
        bInputSave = false;
    }
    // End:0x376
    if(class'PlayerInput'.default.MouseSmoothingStrength != FMax(0.0, fSmoothing))
    {
        PC.ConsoleCommand("SetSmoothingStrength" @ string(fSmoothing));
        bInputSave = false;
    }
    // End:0x3af
    if(class'PlayerInput'.default.bInvertMouse != bInvert)
    {
        PC.InvertMouse(string(bInvert));
        bInputSave = false;
    }
    // End:0x3ed
    if(class'PlayerInput'.default.MouseSmoothingMode != byte(bSmoothing))
    {
        PC.SetMouseSmoothing(int(bSmoothing));
        bInputSave = false;
    }
    // End:0x428
    if(class'PlayerInput'.default.MouseSensitivity != FMax(0.0, fSens))
    {
        PC.SetSensitivity(fSens);
        bInputSave = false;
    }
    // End:0x440
    if(bInputSave)
    {
        class'PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x48f
    if(bIForce)
    {
        PC.bForceFeedbackSupported = PC.ForceFeedbackSupported(bGFX || bWFX || bPFX || bDFX);
    }
    // End:0x4a4
    if(bSave)
    {
        PC.SaveConfig();
    }
}

function ResetClicked()
{
    local int i;
    local string str;
    local Class ViewportClass;
    local class<RenderDevice> RenderClass;

    super.ResetClicked();
    str = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager Class");
    str = Mid(str, InStr(str, "'") + 1);
    str = Left(str, Len(str) - 1);
    ViewportClass = class<Object>(DynamicLoadObject(str, class'Class'));
    str = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice Class");
    str = Mid(str, InStr(str, "'") + 1);
    str = Left(str, Len(str) - 1);
    RenderClass = class<RenderDevice>(DynamicLoadObject(str, class'Class'));
    ViewportClass.static.ResetConfig("UseJoystick");
    RenderClass.static.ResetConfig("ReduceMouseLag");
    Controller.ResetConfig("MenuMouseSens");
    class'PlayerController'.static.ResetConfig("bSnapToLevel");
    class'PlayerController'.static.ResetConfig("bEnableWeaponForceFeedback");
    class'PlayerController'.static.ResetConfig("bEnablePickupForceFeedback");
    class'PlayerController'.static.ResetConfig("bEnableDamageForceFeedback");
    class'PlayerController'.static.ResetConfig("bEnableGUIForceFeedback");
    class'PlayerInput'.static.ResetConfig("bInvertMouse");
    class'PlayerInput'.static.ResetConfig("MouseSmoothingMode");
    class'PlayerInput'.static.ResetConfig("MouseSensitivity");
    class'PlayerInput'.static.ResetConfig("MouseSmoothingStrength");
    class'PlayerInput'.static.ResetConfig("DoubleClickTime");
    class'PlayerInput'.static.ResetConfig("MouseAccelThreshold");
    i = 0;
    J0x30d:
    // End:0x33d [While If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x30d;
    }
}

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    switch(Sender)
    {
        // End:0x33
        case ch_AutoSlope:
            bSlope = ch_AutoSlope.IsChecked();
            // End:0x1e7
            break;
        // End:0x54
        case ch_InvertMouse:
            bInvert = ch_InvertMouse.IsChecked();
            // End:0x1e7
            break;
        // End:0x75
        case ch_MouseSmoothing:
            bSmoothing = ch_MouseSmoothing.IsChecked();
            // End:0x1e7
            break;
        // End:0x96
        case ch_Joystick:
            bJoystick = ch_Joystick.IsChecked();
            // End:0x1e7
            break;
        // End:0xb7
        case ch_WeaponEffects:
            bWFX = ch_WeaponEffects.IsChecked();
            // End:0x1e7
            break;
        // End:0xd8
        case ch_PickupEffects:
            bPFX = ch_PickupEffects.IsChecked();
            // End:0x1e7
            break;
        // End:0xf9
        case ch_DamageEffects:
            bDFX = ch_DamageEffects.IsChecked();
            // End:0x1e7
            break;
        // End:0x11a
        case ch_GUIEffects:
            bGFX = ch_GUIEffects.IsChecked();
            // End:0x1e7
            break;
        // End:0x13b
        case ch_MouseLag:
            bLag = ch_MouseLag.IsChecked();
            // End:0x1e7
            break;
        // End:0x15b
        case fl_Sensitivity:
            fSens = fl_Sensitivity.GetValue();
            // End:0x1e7
            break;
        // End:0x184
        case fl_MenuSensitivity:
            Controller.MenuMouseSens = fl_MenuSensitivity.GetValue();
            // End:0x1e7
            break;
        // End:0x1a4
        case fl_MouseAccel:
            fAccel = fl_MouseAccel.GetValue();
            // End:0x1e7
            break;
        // End:0x1c4
        case fl_SmoothingStrength:
            fSmoothing = fl_SmoothingStrength.GetValue();
            // End:0x1e7
            break;
        // End:0x1e4
        case fl_DodgeTime:
            fDodge = fl_DodgeTime.GetValue();
            // End:0x1e7
            break;
        // End:0xffff
        default:
}

function bool InternalOnClick(GUIComponent Sender)
{
    local export editinline GUITabControl C;
    local int i;

    // End:0x26
    if(Sender == b_Controls)
    {
        Controller.OpenMenu(ControlBindMenu);
    }
    // End:0x101
    else
    {
        // End:0x101
        if(Sender == b_Speech)
        {
            C = GUITabControl(MenuOwner);
            // End:0xed
            if(C != none)
            {
                i = 0;
                J0x57:
                // End:0xed [While If]
                if(i < C.TabStack.Length)
                {
                    // End:0xe3
                    if(C.TabStack[i] != none && UT2K4Tab_PlayerSettings(C.TabStack[i].MyPanel) != none)
                    {
                        UT2K4Tab_PlayerSettings(C.TabStack[i].MyPanel).SaveSettings();
                    }
                    // End:0xed
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x57;
                    }
                }
            }
            Controller.OpenMenu(SpeechBindMenu);
        }
    }
    return true;
}

defaultproperties
{
    begin object name=InputBK1 class=GUISectionBackground
        Caption="??"
        WinTop=0.0281760
        WinLeft=0.0216410
        WinWidth=0.3813280
        WinHeight=0.6550390
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_IForceSettings.InputBK1'
    i_BG1=InputBK1
    begin object name=InputBK2 class=GUISectionBackground
        Caption="???? ?? ???"
        WinTop=0.730
        WinLeft=0.0216410
        WinWidth=0.95750
        WinHeight=0.2409770
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_IForceSettings.InputBK2'
    i_BG2=InputBK2
    begin object name=InputBK3 class=GUISectionBackground
        Caption="????"
        WinTop=0.0281760
        WinLeft=0.4512890
        WinWidth=0.5278120
        WinHeight=0.6550390
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_IForceSettings.InputBK3'
    i_BG3=InputBK3
    begin object name=InputAutoSlope class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ??, ??? ?? ??? ? ??? ???? ???? ?????? ???."
        WinTop=0.1053650
        WinLeft=0.0609370
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=2
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputAutoSlope'
    ch_AutoSlope=InputAutoSlope
    begin object name=InputInvertMouse class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? Y?? ??? ??? ?????."
        WinTop=0.1886980
        WinLeft=0.0609380
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=3
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputInvertMouse'
    ch_InvertMouse=InputInvertMouse
    begin object name=InputMouseSmoothing class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ???? ????."
        WinTop=0.3241670
        WinLeft=0.0609380
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputMouseSmoothing'
    ch_MouseSmoothing=InputMouseSmoothing
    begin object name=InputUseJoystick class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="???? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? ??? ? ?????."
        WinTop=0.5820830
        WinLeft=0.0609380
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=6
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputUseJoystick'
    ch_Joystick=InputUseJoystick
    begin object name=InputIFWeaponEffects class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ??? ??? ????."
        WinTop=0.8153330
        WinLeft=0.10
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=12
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputIFWeaponEffects'
    ch_WeaponEffects=InputIFWeaponEffects
    begin object name=InputIFPickupEffects class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ????? ???? ????."
        WinTop=0.9063330
        WinLeft=0.10
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=13
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputIFPickupEffects'
    ch_PickupEffects=InputIFPickupEffects
    begin object name=InputIFDamageEffects class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ???? ??? ????."
        WinTop=0.8153330
        WinLeft=0.5638670
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=14
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputIFDamageEffects'
    ch_DamageEffects=InputIFDamageEffects
    begin object name=InputIFGUIEffects class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="GUI ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="GUI ??? ?? ? ????."
        WinTop=0.9063330
        WinLeft=0.5638670
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=15
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputIFGUIEffects'
    ch_GUIEffects=InputIFGUIEffects
    begin object name=InputMouseLag class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? ?? ??? ?????."
        WinTop=0.4050
        WinLeft=0.0609380
        WinWidth=0.30
        WinHeight=0.040
        TabOrder=5
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_IForceSettings.InputMouseLag'
    ch_MouseLag=InputMouseLag
    begin object name=InputMouseSensitivity class=moFloatEdit
        MinValue=0.250
        MaxValue=25.0
        Step=0.250
        ComponentJustification=0
        CaptionWidth=0.7250
        Caption="??? ???(??)"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?????? ??? ???? ?????."
        WinTop=0.1053650
        WinLeft=0.5023440
        WinWidth=0.421680
        WinHeight=0.0453520
        TabOrder=7
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moFloatEdit'UT2K4Tab_IForceSettings.InputMouseSensitivity'
    fl_Sensitivity=InputMouseSensitivity
    begin object name=InputMenuSensitivity class=moFloatEdit
        MinValue=1.0
        MaxValue=6.0
        Step=0.250
        ComponentJustification=0
        CaptionWidth=0.7250
        Caption="??? ???(??)"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?????? ??? ??? ?????."
        WinTop=0.1886980
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=8
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moFloatEdit'UT2K4Tab_IForceSettings.InputMenuSensitivity'
    fl_MenuSensitivity=InputMenuSensitivity
    begin object name=InputMouseAccel class=moFloatEdit
        MinValue=0.0
        MaxValue=100.0
        Step=5.0
        ComponentJustification=0
        CaptionWidth=0.7250
        Caption="??? ??. ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ???? ? ????? ???? ???? ?????."
        WinTop=0.4050
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=10
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moFloatEdit'UT2K4Tab_IForceSettings.InputMouseAccel'
    fl_MouseAccel=InputMouseAccel
    begin object name=InputMouseSmoothStr class=moFloatEdit
        MinValue=0.0
        MaxValue=1.0
        Step=0.050
        ComponentJustification=0
        CaptionWidth=0.7250
        Caption="??? ???? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ???? ????? ?? ?????."
        WinTop=0.3241670
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=9
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moFloatEdit'UT2K4Tab_IForceSettings.InputMouseSmoothStr'
    fl_SmoothingStrength=InputMouseSmoothStr
    begin object name=InputDodgeTime class=moFloatEdit
        MinValue=0.0
        MaxValue=1.0
        Step=0.050
        ComponentJustification=0
        CaptionWidth=0.7250
        Caption="???? ???? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? ?? ???? ??? ?????."
        WinTop=0.5820830
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=11
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moFloatEdit'UT2K4Tab_IForceSettings.InputDodgeTime'
    fl_DodgeTime=InputDodgeTime
    begin object name=ControlBindButton class=GUIButton
        Caption="??? ??"
        SizingCaption="XXXXXXXXXX"
        Hint="???? ????? ?????."
        WinTop=0.0183330
        WinLeft=0.130
        WinWidth=0.1532810
        WinHeight=0.043750
        TabOrder=0
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_IForceSettings.ControlBindButton'
    b_Controls=ControlBindButton
    begin object name=SpeechBindButton class=GUIButton
        Caption="??? ???"
        SizingCaption="XXXXXXXXXX"
        Hint="?? ? ???? ?? ????? ?????."
        WinTop=0.0183330
        WinLeft=0.670
        WinWidth=0.1532810
        WinHeight=0.043750
        TabOrder=1
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_IForceSettings.SpeechBindButton'
    b_Speech=SpeechBindButton
    ControlBindMenu="GUI2K4.ControlBinder"
    SpeechBindMenu="GUI2K4.SpeechBinder"
    PanelCaption="??"
    PropagateVisibility=true
    WinTop=0.150
    WinHeight=0.740
}