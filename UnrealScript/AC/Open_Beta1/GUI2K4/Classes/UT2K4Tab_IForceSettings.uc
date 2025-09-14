class UT2K4Tab_IForceSettings extends Settings_Tabs
    config(User)
    editinlinenew
    instanced;

var() automated GUISectionBackground i_BG1;
var() automated GUISectionBackground i_BG2;
var() automated GUISectionBackground i_BG3;
var() automated GUILabel l_IForce;
var() automated moCheckBox ch_AutoSlope;
var() automated moCheckBox ch_InvertMouse;
var() automated moCheckBox ch_MouseSmoothing;
var() automated moCheckBox ch_Joystick;
var() automated moCheckBox ch_WeaponEffects;
var() automated moCheckBox ch_PickupEffects;
var() automated moCheckBox ch_DamageEffects;
var() automated moCheckBox ch_GUIEffects;
var() automated moCheckBox ch_MouseLag;
var() automated moFloatEdit fl_Sensitivity;
var() automated moFloatEdit fl_MenuSensitivity;
var() automated moFloatEdit fl_MouseAccel;
var() automated moFloatEdit fl_SmoothingStrength;
var() automated moFloatEdit fl_DodgeTime;
var() automated GUIButton b_Controls;
var() automated GUIButton b_Speech;
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
    //return;    
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
            // End:0x3EB
            break;
        // End:0x82
        case ch_InvertMouse:
            bInvert = Class'Engine.PlayerInput'.default.bInvertMouse;
            ch_InvertMouse.SetComponentValue(string(bInvert), true);
            // End:0x3EB
            break;
        // End:0xBF
        case ch_MouseSmoothing:
            bSmoothing = int(Class'Engine.PlayerInput'.default.MouseSmoothingMode) > 0;
            ch_MouseSmoothing.SetComponentValue(string(bSmoothing), true);
            // End:0x3EB
            break;
        // End:0x12D
        case ch_Joystick:
            bJoystick = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseJoystick"));
            ch_Joystick.SetComponentValue(string(bJoystick), true);
            // End:0x3EB
            break;
        // End:0x166
        case ch_WeaponEffects:
            bWFX = PC.bEnableWeaponForceFeedback;
            ch_WeaponEffects.SetComponentValue(string(bWFX), true);
            // End:0x3EB
            break;
        // End:0x19F
        case ch_PickupEffects:
            bPFX = PC.bEnablePickupForceFeedback;
            ch_PickupEffects.SetComponentValue(string(bPFX), true);
            // End:0x3EB
            break;
        // End:0x1D8
        case ch_DamageEffects:
            bDFX = PC.bEnableDamageForceFeedback;
            ch_DamageEffects.SetComponentValue(string(bDFX), true);
            // End:0x3EB
            break;
        // End:0x211
        case ch_GUIEffects:
            bGFX = PC.bEnableGUIForceFeedback;
            ch_GUIEffects.SetComponentValue(string(bGFX), true);
            // End:0x3EB
            break;
        // End:0x27C
        case ch_MouseLag:
            bLag = bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice ReduceMouseLag"));
            ch_MouseLag.Checked(bLag);
            // End:0x3EB
            break;
        // End:0x2B2
        case fl_Sensitivity:
            fSens = Class'Engine.PlayerInput'.default.MouseSensitivity;
            fl_Sensitivity.SetComponentValue(string(fSens), true);
            // End:0x3EB
            break;
        // End:0x2E8
        case fl_MenuSensitivity:
            fMSens = Controller.MenuMouseSens;
            fl_MenuSensitivity.SetComponentValue(string(fMSens), true);
            // End:0x3EB
            break;
        // End:0x31E
        case fl_MouseAccel:
            fAccel = Class'Engine.PlayerInput'.default.MouseAccelThreshold;
            fl_MouseAccel.SetComponentValue(string(fAccel), true);
            // End:0x3EB
            break;
        // End:0x354
        case fl_SmoothingStrength:
            fSmoothing = Class'Engine.PlayerInput'.default.MouseSmoothingStrength;
            fl_SmoothingStrength.SetComponentValue(string(fSmoothing), true);
            // End:0x3EB
            break;
        // End:0x38A
        case fl_DodgeTime:
            fDodge = Class'Engine.PlayerInput'.default.DoubleClickTime;
            fl_DodgeTime.SetComponentValue(string(fDodge), true);
            // End:0x3EB
            break;
        // End:0xFFFF
        default:
            Log((string(Name) @ "Unknown component calling LoadINI:") $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
            break;
    }
    //return;    
}

function SaveSettings()
{
    local PlayerController PC;
    local bool bSave, bInputSave, bIForce;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0xAB
    if(bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseJoystick")) != bJoystick)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager UseJoystick" @ string(bJoystick));
    }
    // End:0x147
    if(bool(PC.ConsoleCommand("get ini:Engine.Engine.RenderDevice ReduceMouseLag")) != bLag)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.RenderDevice ReduceMouseLag" @ string(bLag));
    }
    // End:0x17F
    if(PC.bSnapToLevel != bSlope)
    {
        PC.bSnapToLevel = bSlope;
        bSave = true;
    }
    // End:0x1BF
    if(PC.bEnableWeaponForceFeedback != bWFX)
    {
        PC.bEnableWeaponForceFeedback = bWFX;
        bSave = true;
        bIForce = true;
    }
    // End:0x1FF
    if(PC.bEnablePickupForceFeedback != bPFX)
    {
        PC.bEnablePickupForceFeedback = bPFX;
        bIForce = true;
        bSave = true;
    }
    // End:0x23F
    if(PC.bEnableDamageForceFeedback != bDFX)
    {
        PC.bEnableDamageForceFeedback = bDFX;
        bIForce = true;
        bSave = true;
    }
    // End:0x27F
    if(PC.bEnableGUIForceFeedback != bGFX)
    {
        PC.bEnableGUIForceFeedback = bGFX;
        bIForce = true;
        bSave = true;
    }
    // End:0x2AA
    if(Controller.MenuMouseSens != FMax(0.0000000, fMSens))
    {
        Controller.SaveConfig();
    }
    // End:0x2E5
    if(Class'Engine.PlayerInput'.default.DoubleClickTime != FMax(0.0000000, fDodge))
    {
        Class'Engine.PlayerInput'.default.DoubleClickTime = fDodge;
        bInputSave = true;
    }
    // End:0x320
    if(Class'Engine.PlayerInput'.default.MouseAccelThreshold != FMax(0.0000000, fAccel))
    {
        PC.SetMouseAccel(fAccel);
        bInputSave = false;
    }
    // End:0x376
    if(Class'Engine.PlayerInput'.default.MouseSmoothingStrength != FMax(0.0000000, fSmoothing))
    {
        PC.ConsoleCommand("SetSmoothingStrength" @ string(fSmoothing));
        bInputSave = false;
    }
    // End:0x3AF
    if(Class'Engine.PlayerInput'.default.bInvertMouse != bInvert)
    {
        PC.InvertMouse(string(bInvert));
        bInputSave = false;
    }
    // End:0x3ED
    if(int(Class'Engine.PlayerInput'.default.MouseSmoothingMode) != int(byte(bSmoothing)))
    {
        PC.SetMouseSmoothing(int(bSmoothing));
        bInputSave = false;
    }
    // End:0x428
    if(Class'Engine.PlayerInput'.default.MouseSensitivity != FMax(0.0000000, fSens))
    {
        PC.SetSensitivity(fSens);
        bInputSave = false;
    }
    // End:0x440
    if(bInputSave)
    {
        Class'Engine.PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x48F
    if(bIForce)
    {
        PC.bForceFeedbackSupported = PC.ForceFeedbackSupported(((bGFX || bWFX) || bPFX) || bDFX);
    }
    // End:0x4A4
    if(bSave)
    {
        PC.SaveConfig();
    }
    //return;    
}

function ResetClicked()
{
    local int i;
    local string str;
    local Class ViewportClass;
    local Class<RenderDevice> RenderClass;

    super.ResetClicked();
    str = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager Class");
    str = Mid(str, InStr(str, "'") + 1);
    str = Left(str, Len(str) - 1);
    ViewportClass = Class<Object>(DynamicLoadObject(str, Class'Core.Class'));
    str = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice Class");
    str = Mid(str, InStr(str, "'") + 1);
    str = Left(str, Len(str) - 1);
    RenderClass = Class<RenderDevice>(DynamicLoadObject(str, Class'Core.Class'));
    ViewportClass.static.ResetConfig("UseJoystick");
    RenderClass.static.ResetConfig("ReduceMouseLag");
    Controller.ResetConfig("MenuMouseSens");
    Class'Engine.PlayerController'.static.ResetConfig("bSnapToLevel");
    Class'Engine.PlayerController'.static.ResetConfig("bEnableWeaponForceFeedback");
    Class'Engine.PlayerController'.static.ResetConfig("bEnablePickupForceFeedback");
    Class'Engine.PlayerController'.static.ResetConfig("bEnableDamageForceFeedback");
    Class'Engine.PlayerController'.static.ResetConfig("bEnableGUIForceFeedback");
    Class'Engine.PlayerInput'.static.ResetConfig("bInvertMouse");
    Class'Engine.PlayerInput'.static.ResetConfig("MouseSmoothingMode");
    Class'Engine.PlayerInput'.static.ResetConfig("MouseSensitivity");
    Class'Engine.PlayerInput'.static.ResetConfig("MouseSmoothingStrength");
    Class'Engine.PlayerInput'.static.ResetConfig("DoubleClickTime");
    Class'Engine.PlayerInput'.static.ResetConfig("MouseAccelThreshold");
    i = 0;
    J0x30D:

    // End:0x33D [Loop If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        i++;
        // [Loop Continue]
        goto J0x30D;
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    switch(Sender)
    {
        // End:0x33
        case ch_AutoSlope:
            bSlope = ch_AutoSlope.IsChecked();
            // End:0x1E7
            break;
        // End:0x54
        case ch_InvertMouse:
            bInvert = ch_InvertMouse.IsChecked();
            // End:0x1E7
            break;
        // End:0x75
        case ch_MouseSmoothing:
            bSmoothing = ch_MouseSmoothing.IsChecked();
            // End:0x1E7
            break;
        // End:0x96
        case ch_Joystick:
            bJoystick = ch_Joystick.IsChecked();
            // End:0x1E7
            break;
        // End:0xB7
        case ch_WeaponEffects:
            bWFX = ch_WeaponEffects.IsChecked();
            // End:0x1E7
            break;
        // End:0xD8
        case ch_PickupEffects:
            bPFX = ch_PickupEffects.IsChecked();
            // End:0x1E7
            break;
        // End:0xF9
        case ch_DamageEffects:
            bDFX = ch_DamageEffects.IsChecked();
            // End:0x1E7
            break;
        // End:0x11A
        case ch_GUIEffects:
            bGFX = ch_GUIEffects.IsChecked();
            // End:0x1E7
            break;
        // End:0x13B
        case ch_MouseLag:
            bLag = ch_MouseLag.IsChecked();
            // End:0x1E7
            break;
        // End:0x15B
        case fl_Sensitivity:
            fSens = fl_Sensitivity.GetValue();
            // End:0x1E7
            break;
        // End:0x184
        case fl_MenuSensitivity:
            Controller.MenuMouseSens = fl_MenuSensitivity.GetValue();
            // End:0x1E7
            break;
        // End:0x1A4
        case fl_MouseAccel:
            fAccel = fl_MouseAccel.GetValue();
            // End:0x1E7
            break;
        // End:0x1C4
        case fl_SmoothingStrength:
            fSmoothing = fl_SmoothingStrength.GetValue();
            // End:0x1E7
            break;
        // End:0x1E4
        case fl_DodgeTime:
            fDodge = fl_DodgeTime.GetValue();
            // End:0x1E7
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
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
    else
    {
        // End:0x101
        if(Sender == b_Speech)
        {
            C = GUITabControl(MenuOwner);
            // End:0xED
            if(C != none)
            {
                i = 0;
                J0x57:

                // End:0xED [Loop If]
                if(i < C.TabStack.Length)
                {
                    // End:0xE3
                    if((C.TabStack[i] != none) && UT2K4Tab_PlayerSettings(C.TabStack[i].MyPanel) != none)
                    {
                        UT2K4Tab_PlayerSettings(C.TabStack[i].MyPanel).SaveSettings();
                        // [Explicit Break]
                        goto J0xED;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x57;
                }
            }
            J0xED:

            Controller.OpenMenu(SpeechBindMenu);
        }
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputBK1'
    begin object name="InputBK1" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0281760
        WinLeft=0.0216410
        WinWidth=0.3813280
        WinHeight=0.6550390
        OnPreDraw=InputBK1.InternalPreDraw
    end object
    i_BG1=InputBK1
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputBK2'
    begin object name="InputBK2" class=XInterface.GUISectionBackground
        Caption="???? ?? ???"
        WinTop=0.7300000
        WinLeft=0.0216410
        WinWidth=0.9575000
        WinHeight=0.2409770
        OnPreDraw=InputBK2.InternalPreDraw
    end object
    i_BG2=InputBK2
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputBK3'
    begin object name="InputBK3" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.0281760
        WinLeft=0.4512890
        WinWidth=0.5278120
        WinHeight=0.6550390
        OnPreDraw=InputBK3.InternalPreDraw
    end object
    i_BG3=InputBK3
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputAutoSlope'
    begin object name="InputAutoSlope" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ???"
        OnCreateComponent=InputAutoSlope.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ??, ??? ?? ??? ? ??? ???? ???? ?????? ???."
        WinTop=0.1053650
        WinLeft=0.0609370
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=2
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_AutoSlope=InputAutoSlope
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputInvertMouse'
    begin object name="InputInvertMouse" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ??"
        OnCreateComponent=InputInvertMouse.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? Y?? ??? ??? ?????."
        WinTop=0.1886980
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=3
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_InvertMouse=InputInvertMouse
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputMouseSmoothing'
    begin object name="InputMouseSmoothing" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ????"
        OnCreateComponent=InputMouseSmoothing.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ???? ????."
        WinTop=0.3241670
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=4
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_MouseSmoothing=InputMouseSmoothing
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputUseJoystick'
    begin object name="InputUseJoystick" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="???? ??"
        OnCreateComponent=InputUseJoystick.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? ??? ? ?????."
        WinTop=0.5820830
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=6
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_Joystick=InputUseJoystick
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputIFWeaponEffects'
    begin object name="InputIFWeaponEffects" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ??"
        OnCreateComponent=InputIFWeaponEffects.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ??? ??? ????."
        WinTop=0.8153330
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=12
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_WeaponEffects=InputIFWeaponEffects
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputIFPickupEffects'
    begin object name="InputIFPickupEffects" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ??"
        OnCreateComponent=InputIFPickupEffects.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ????? ???? ????."
        WinTop=0.9063330
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=13
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_PickupEffects=InputIFPickupEffects
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputIFDamageEffects'
    begin object name="InputIFDamageEffects" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ??"
        OnCreateComponent=InputIFDamageEffects.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ???? ??? ????."
        WinTop=0.8153330
        WinLeft=0.5638670
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=14
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_DamageEffects=InputIFDamageEffects
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputIFGUIEffects'
    begin object name="InputIFGUIEffects" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="GUI ??"
        OnCreateComponent=InputIFGUIEffects.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="GUI ??? ?? ? ????."
        WinTop=0.9063330
        WinLeft=0.5638670
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=15
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_GUIEffects=InputIFGUIEffects
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputMouseLag'
    begin object name="InputMouseLag" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ? ??"
        OnCreateComponent=InputMouseLag.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? ?? ??? ?????."
        WinTop=0.4050000
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
        TabOrder=5
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    ch_MouseLag=InputMouseLag
    // Reference: moFloatEdit'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputMouseSensitivity'
    begin object name="InputMouseSensitivity" class=XInterface.moFloatEdit
        MinValue=0.2500000
        MaxValue=25.0000000
        Step=0.2500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="??? ???(??)"
        OnCreateComponent=InputMouseSensitivity.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?????? ??? ???? ?????."
        WinTop=0.1053650
        WinLeft=0.5023440
        WinWidth=0.4216800
        WinHeight=0.0453520
        TabOrder=7
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    fl_Sensitivity=InputMouseSensitivity
    // Reference: moFloatEdit'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputMenuSensitivity'
    begin object name="InputMenuSensitivity" class=XInterface.moFloatEdit
        MinValue=1.0000000
        MaxValue=6.0000000
        Step=0.2500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="??? ???(??)"
        OnCreateComponent=InputMenuSensitivity.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?????? ??? ??? ?????."
        WinTop=0.1886980
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=8
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    fl_MenuSensitivity=InputMenuSensitivity
    // Reference: moFloatEdit'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputMouseAccel'
    begin object name="InputMouseAccel" class=XInterface.moFloatEdit
        MinValue=0.0000000
        MaxValue=100.0000000
        Step=5.0000000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="??? ??. ????"
        OnCreateComponent=InputMouseAccel.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ???? ? ????? ???? ???? ?????."
        WinTop=0.4050000
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=10
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    fl_MouseAccel=InputMouseAccel
    // Reference: moFloatEdit'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputMouseSmoothStr'
    begin object name="InputMouseSmoothStr" class=XInterface.moFloatEdit
        MinValue=0.0000000
        MaxValue=1.0000000
        Step=0.0500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="??? ???? ??"
        OnCreateComponent=InputMouseSmoothStr.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ???? ???? ????? ?? ?????."
        WinTop=0.3241670
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=9
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    fl_SmoothingStrength=InputMouseSmoothStr
    // Reference: moFloatEdit'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.InputDodgeTime'
    begin object name="InputDodgeTime" class=XInterface.moFloatEdit
        MinValue=0.0000000
        MaxValue=1.0000000
        Step=0.0500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="???? ???? ??"
        OnCreateComponent=InputDodgeTime.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? ?? ???? ??? ?????."
        WinTop=0.5820830
        WinLeft=0.5023440
        WinWidth=0.4218750
        WinHeight=0.0453520
        TabOrder=11
        OnChange=UT2K4Tab_IForceSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_IForceSettings.InternalOnLoadINI
    end object
    fl_DodgeTime=InputDodgeTime
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.ControlBindButton'
    begin object name="ControlBindButton" class=XInterface.GUIButton
        Caption="??? ??"
        SizingCaption="XXXXXXXXXX"
        Hint="???? ????? ?????."
        WinTop=0.0183330
        WinLeft=0.1300000
        WinWidth=0.1532810
        WinHeight=0.0437500
        TabOrder=0
        OnClick=UT2K4Tab_IForceSettings.InternalOnClick
        OnKeyEvent=ControlBindButton.InternalOnKeyEvent
    end object
    b_Controls=ControlBindButton
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_IForceSettings.SpeechBindButton'
    begin object name="SpeechBindButton" class=XInterface.GUIButton
        Caption="??? ???"
        SizingCaption="XXXXXXXXXX"
        Hint="?? ? ???? ?? ????? ?????."
        WinTop=0.0183330
        WinLeft=0.6700000
        WinWidth=0.1532810
        WinHeight=0.0437500
        TabOrder=1
        OnClick=UT2K4Tab_IForceSettings.InternalOnClick
        OnKeyEvent=SpeechBindButton.InternalOnKeyEvent
    end object
    b_Speech=SpeechBindButton
    ControlBindMenu="GUI2K4.ControlBinder"
    SpeechBindMenu="GUI2K4.SpeechBinder"
    PanelCaption="??"
    PropagateVisibility=false
    WinTop=0.1500000
    WinHeight=0.7400000
}