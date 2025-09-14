class Tab_IForceSettings extends UT2K3TabPanel
    editinlinenew
    instanced;

var export editinline moCheckBox AutoAim;
var export editinline moCheckBox AutoSlope;
var export editinline moCheckBox InvertMouse;
var export editinline moCheckBox MouseSmooth;
var export editinline moCheckBox MouseLag;
var export editinline moCheckBox UseJoystick;
var export editinline moFloatEdit MouseSens;
var export editinline moFloatEdit MenuSens;
var export editinline moCheckBox ifWeapon;
var export editinline moCheckBox ifPickup;
var export editinline moCheckBox ifDamage;
var export editinline moCheckBox ifGUI;
var export editinline moFloatEdit MouseSmoothStr;
var export editinline moFloatEdit MouseThreshold;
var export editinline moFloatEdit DoubleClick;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local string S;

    super(GUIPanel).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x4B [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    AutoAim = moCheckBox(Controls[1]);
    AutoAim.Checked(PlayerOwner().Level.Game.AutoAim == float(1));
    AutoSlope = moCheckBox(Controls[2]);
    AutoSlope.Checked(PlayerOwner().bSnapToLevel);
    InvertMouse = moCheckBox(Controls[3]);
    InvertMouse.Checked(Class'Engine.PlayerInput'.default.bInvertMouse);
    MouseSmooth = moCheckBox(Controls[4]);
    MouseSmooth.Checked(int(Class'Engine.PlayerInput'.default.MouseSmoothingMode) > 0);
    UseJoystick = moCheckBox(Controls[5]);
    UseJoystick.Checked(bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager UseJoystick")));
    MouseLag = moCheckBox(Controls[19]);
    S = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice ReduceMouseLag");
    MouseLag.Checked(bool(S));
    MouseSens = moFloatEdit(Controls[7]);
    MouseSens.SetValue(Class'Engine.PlayerInput'.default.MouseSensitivity);
    MenuSens = moFloatEdit(Controls[9]);
    MenuSens.SetValue(Controller.MenuMouseSens);
    ifWeapon = moCheckBox(Controls[11]);
    ifWeapon.Checked(Class'Engine.PlayerController'.default.bEnableWeaponForceFeedback);
    ifPickup = moCheckBox(Controls[12]);
    ifPickup.Checked(Class'Engine.PlayerController'.default.bEnablePickupForceFeedback);
    ifDamage = moCheckBox(Controls[13]);
    ifDamage.Checked(Class'Engine.PlayerController'.default.bEnableDamageForceFeedback);
    ifGUI = moCheckBox(Controls[14]);
    ifGUI.Checked(Class'Engine.PlayerController'.default.bEnableGUIForceFeedback);
    MouseSmoothStr = moFloatEdit(Controls[16]);
    MouseSmoothStr.SetValue(Class'Engine.PlayerInput'.default.MouseSmoothingStrength);
    MouseThreshold = moFloatEdit(Controls[17]);
    MouseThreshold.SetValue(Class'Engine.PlayerInput'.default.MouseAccelThreshold);
    DoubleClick = moFloatEdit(Controls[18]);
    DoubleClick.SetValue(Class'Engine.PlayerInput'.default.DoubleClickTime);
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0xBB
    if((PlayerOwner().Level.Game != none) && Sender == AutoAim)
    {
        // End:0x7B
        if(AutoAim.IsChecked())
        {
            PlayerOwner().Level.Game.AutoAim = 1.0000000;            
        }
        else
        {
            PlayerOwner().Level.Game.AutoAim = 0.0000000;
        }
        PlayerOwner().Level.Game.SaveConfig();
    }
    // End:0x11F
    if(Sender == MouseLag)
    {
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.RenderDevice ReduceMouseLag " $ string(MouseLag.IsChecked()));
    }
    // End:0x155
    if(Sender == AutoSlope)
    {
        PlayerOwner().bSnapToLevel = AutoSlope.IsChecked();
        PlayerOwner().SaveConfig();
    }
    // End:0x1D2
    if(Sender == InvertMouse)
    {
        PlayerOwner().ConsoleCommand("set PlayerInput bInvertMouse " $ string(InvertMouse.IsChecked()));
        Class'Engine.PlayerInput'.default.bInvertMouse = InvertMouse.IsChecked();
        Class'Engine.PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x218
    if(Sender == MouseSmooth)
    {
        // End:0x207
        if(MouseSmooth.IsChecked())
        {
            Class'Engine.PlayerInput'.default.MouseSmoothingMode = 1;            
        }
        else
        {
            Class'Engine.PlayerInput'.default.MouseSmoothingMode = 0;
        }
    }
    // End:0x27B
    if(Sender == UseJoystick)
    {
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.ViewportManager UseJoystick" @ string(UseJoystick.IsChecked()));
    }
    // End:0x2FB
    if(Sender == MouseSens)
    {
        Class'Engine.PlayerInput'.default.MouseSensitivity = MouseSens.GetValue();
        PlayerOwner().ConsoleCommand("set PlayerInput MouseSensitivity " $ string(MouseSens.GetValue()));
        Class'Engine.PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x381
    if(Sender == MouseSmoothStr)
    {
        Class'Engine.PlayerInput'.default.MouseSmoothingStrength = MouseSmoothStr.GetValue();
        PlayerOwner().ConsoleCommand("set PlayerInput MouseSmoothingStrength " $ string(MouseSmoothStr.GetValue()));
        Class'Engine.PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x404
    if(Sender == MouseThreshold)
    {
        Class'Engine.PlayerInput'.default.MouseAccelThreshold = MouseThreshold.GetValue();
        PlayerOwner().ConsoleCommand("set PlayerInput MouseAccelThreshold " $ string(MouseThreshold.GetValue()));
        Class'Engine.PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x483
    if(Sender == DoubleClick)
    {
        Class'Engine.PlayerInput'.default.DoubleClickTime = DoubleClick.GetValue();
        PlayerOwner().ConsoleCommand("set PlayerInput DoubleClickTime " $ string(DoubleClick.GetValue()));
        Class'Engine.PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x4BC
    if(Sender == MenuSens)
    {
        Controller.MenuMouseSens = MenuSens.GetValue();
        Controller.SaveConfig();
    }
    // End:0x55A
    if(Sender == ifWeapon)
    {
        PlayerOwner().bEnableWeaponForceFeedback = ifWeapon.IsChecked();
        PlayerOwner().bForceFeedbackSupported = PlayerOwner().ForceFeedbackSupported(((ifWeapon.IsChecked() || ifPickup.IsChecked()) || ifDamage.IsChecked()) || ifGUI.IsChecked());
        Class'Engine.PlayerController'.SaveConfig();
    }
    // End:0x5F8
    if(Sender == ifPickup)
    {
        PlayerOwner().bEnablePickupForceFeedback = ifPickup.IsChecked();
        PlayerOwner().bForceFeedbackSupported = PlayerOwner().ForceFeedbackSupported(((ifWeapon.IsChecked() || ifPickup.IsChecked()) || ifDamage.IsChecked()) || ifGUI.IsChecked());
        Class'Engine.PlayerController'.SaveConfig();
    }
    // End:0x696
    if(Sender == ifDamage)
    {
        PlayerOwner().bEnableDamageForceFeedback = ifDamage.IsChecked();
        PlayerOwner().bForceFeedbackSupported = PlayerOwner().ForceFeedbackSupported(((ifWeapon.IsChecked() || ifPickup.IsChecked()) || ifDamage.IsChecked()) || ifGUI.IsChecked());
        Class'Engine.PlayerController'.SaveConfig();
    }
    // End:0x734
    if(Sender == ifGUI)
    {
        PlayerOwner().bEnableGUIForceFeedback = ifGUI.IsChecked();
        PlayerOwner().bForceFeedbackSupported = PlayerOwner().ForceFeedbackSupported(((ifWeapon.IsChecked() || ifPickup.IsChecked()) || ifDamage.IsChecked()) || ifGUI.IsChecked());
        Class'Engine.PlayerController'.SaveConfig();
    }
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'XInterface_Decompressed.Tab_IForceSettings.InputBK1'
    begin object name="InputBK1" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.1065100
        WinLeft=0.0216410
        WinWidth=0.3813280
        WinHeight=0.6364850
    end object
    Controls[0]=InputBK1
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputAutoAim'
    begin object name="InputAutoAim" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Auto Aim"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputAutoAim.InternalOnCreateComponent
        Hint="Enabling this option will activate computer-assisted aiming in single player games."
        WinTop=0.0573960
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
        bVisible=false
    end object
    Controls[1]=InputAutoAim
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputAutoSlope'
    begin object name="InputAutoSlope" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Auto Slope"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputAutoSlope.InternalOnCreateComponent
        Hint="When enabled, your view will automatically pitch up/down when on a slope."
        WinTop=0.1759890
        WinLeft=0.0609370
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[2]=InputAutoSlope
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputInvertMouse'
    begin object name="InputInvertMouse" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Invert Mouse"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputInvertMouse.InternalOnCreateComponent
        Hint="When enabled, the Y axis of your mouse will be inverted."
        WinTop=0.3219270
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[3]=InputInvertMouse
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputMouseSmoothing'
    begin object name="InputMouseSmoothing" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Mouse Smoothing"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputMouseSmoothing.InternalOnCreateComponent
        Hint="Enable this option to automatically smooth out movements in your mouse."
        WinTop=0.4160410
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[4]=InputMouseSmoothing
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputUseJoystick'
    begin object name="InputUseJoystick" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Enable Joystick"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputUseJoystick.InternalOnCreateComponent
        Hint="Enable this option to enable joystick support."
        WinTop=0.6513020
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[5]=InputUseJoystick
    // Reference: GUILabel'XInterface_Decompressed.Tab_IForceSettings.InputSliderLabel1'
    begin object name="InputSliderLabel1" class=XInterface_Decompressed.GUILabel
        Caption="Mouse Sensitivity (In Game)"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.1260420
        WinLeft=0.5439450
        WinWidth=0.3324220
        WinHeight=32.0000000
        bVisible=false
    end object
    Controls[6]=InputSliderLabel1
    // Reference: moFloatEdit'XInterface_Decompressed.Tab_IForceSettings.InputMouseSensitivity'
    begin object name="InputMouseSensitivity" class=XInterface_Decompressed.moFloatEdit
        MinValue=1.0000000
        MaxValue=25.0000000
        Step=0.2500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="Mouse Sensitivity (In Game)"
        OnCreateComponent=InputMouseSensitivity.InternalOnCreateComponent
        Hint="Adjust mouse sensitivity"
        WinTop=0.1053650
        WinLeft=0.4722660
        WinWidth=0.4218750
    end object
    Controls[7]=InputMouseSensitivity
    // Reference: GUILabel'XInterface_Decompressed.Tab_IForceSettings.InputSliderLabel2'
    begin object name="InputSliderLabel2" class=XInterface_Decompressed.GUILabel
        Caption="Mouse Sensitivity (Menus)"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.3278650
        WinLeft=0.5488280
        WinWidth=0.3085940
        WinHeight=32.0000000
        bVisible=false
    end object
    Controls[8]=InputSliderLabel2
    // Reference: moFloatEdit'XInterface_Decompressed.Tab_IForceSettings.InputMenuSensitivity'
    begin object name="InputMenuSensitivity" class=XInterface_Decompressed.moFloatEdit
        MinValue=1.0000000
        MaxValue=6.0000000
        Step=0.2500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="Mouse Sensitivity (Menus)"
        OnCreateComponent=InputMenuSensitivity.InternalOnCreateComponent
        Hint="Adjust mouse speed within the menus"
        WinTop=0.1886980
        WinLeft=0.4722660
        WinWidth=0.4218750
    end object
    Controls[9]=InputMenuSensitivity
    // Reference: GUIImage'XInterface_Decompressed.Tab_IForceSettings.InputBK2'
    begin object name="InputBK2" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.7600000
        WinLeft=0.0216410
        WinWidth=0.9575000
        WinHeight=0.2409770
    end object
    Controls[10]=InputBK2
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputIFWeaponEffects'
    begin object name="InputIFWeaponEffects" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Weapon Effects"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputIFWeaponEffects.InternalOnCreateComponent
        Hint="Turn this option On/Off to feel the weapons you fire."
        WinTop=0.8520000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[11]=InputIFWeaponEffects
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputIFPickupEffects'
    begin object name="InputIFPickupEffects" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Pickup Effects"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputIFPickupEffects.InternalOnCreateComponent
        Hint="Turn this option On/Off to feel the items you pick up."
        WinTop=0.9330000
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[12]=InputIFPickupEffects
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputIFDamageEffects'
    begin object name="InputIFDamageEffects" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Damage Effects"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputIFDamageEffects.InternalOnCreateComponent
        Hint="Turn this option On/Off to feel the damage you take."
        WinTop=0.8520000
        WinLeft=0.5638670
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[13]=InputIFDamageEffects
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputIFGUIEffects'
    begin object name="InputIFGUIEffects" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="GUI Effects"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputIFGUIEffects.InternalOnCreateComponent
        Hint="Turn this option On/Off to feel the GUI."
        WinTop=0.9330000
        WinLeft=0.5638670
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[14]=InputIFGUIEffects
    // Reference: GUILabel'XInterface_Decompressed.Tab_IForceSettings.InputIForceLabel'
    begin object name="InputIForceLabel" class=XInterface_Decompressed.GUILabel
        Caption="TouchSense Force Feedback"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.7770000
        WinLeft=0.0234370
        WinWidth=0.9562500
        WinHeight=32.0000000
    end object
    Controls[15]=InputIForceLabel
    // Reference: moFloatEdit'XInterface_Decompressed.Tab_IForceSettings.InputMouseSmoothStr'
    begin object name="InputMouseSmoothStr" class=XInterface_Decompressed.moFloatEdit
        MinValue=0.0000000
        MaxValue=1.0000000
        Step=0.0500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="Mouse Smoothing Strength"
        OnCreateComponent=InputMouseSmoothStr.InternalOnCreateComponent
        Hint="Adjust the amount of smoothing that is applied to mouse movements"
        WinTop=0.3241670
        WinLeft=0.4722660
        WinWidth=0.4218750
    end object
    Controls[16]=InputMouseSmoothStr
    // Reference: moFloatEdit'XInterface_Decompressed.Tab_IForceSettings.InputMouseAccel'
    begin object name="InputMouseAccel" class=XInterface_Decompressed.moFloatEdit
        MinValue=0.0000000
        MaxValue=100.0000000
        Step=5.0000000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="Mouse Accel. Threshold"
        OnCreateComponent=InputMouseAccel.InternalOnCreateComponent
        Hint="Adjust to determine the amount of movement needed before acceleration is applied"
        WinTop=0.4050000
        WinLeft=0.4722660
        WinWidth=0.4218750
    end object
    Controls[17]=InputMouseAccel
    // Reference: moFloatEdit'XInterface_Decompressed.Tab_IForceSettings.InputDodgeTime'
    begin object name="InputDodgeTime" class=XInterface_Decompressed.moFloatEdit
        MinValue=0.0000000
        MaxValue=1.0000000
        Step=0.0500000
        ComponentJustification=0
        CaptionWidth=0.7250000
        Caption="Dodge Double-Click Time"
        OnCreateComponent=InputDodgeTime.InternalOnCreateComponent
        Hint="Determines how fast you have to double click to dodge"
        WinTop=0.5820830
        WinLeft=0.4722660
        WinWidth=0.4218750
    end object
    Controls[18]=InputDodgeTime
    // Reference: moCheckBox'XInterface_Decompressed.Tab_IForceSettings.InputMouseLag'
    begin object name="InputMouseLag" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Reduce Mouse Lag"
        ComponentClassName="xinterface.GUICheckBoxButton"
        OnCreateComponent=InputMouseLag.InternalOnCreateComponent
        Hint="Enable this option will reduce the amount of lag in your mouse."
        WinTop=0.5097910
        WinLeft=0.0609380
        WinWidth=0.3000000
        WinHeight=0.0400000
    end object
    Controls[19]=InputMouseLag
    WinTop=0.1500000
    WinHeight=0.7400000
}