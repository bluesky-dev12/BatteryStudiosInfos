/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_IForceSettings.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:15
 *	Functions:2
 *
 *******************************************************************************/
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
    // End:0x4b [While If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    AutoAim = moCheckBox(Controls[1]);
    AutoAim.Checked(PlayerOwner().Level.Game.AutoAim == float(1));
    AutoSlope = moCheckBox(Controls[2]);
    AutoSlope.Checked(PlayerOwner().bSnapToLevel);
    InvertMouse = moCheckBox(Controls[3]);
    InvertMouse.Checked(class'PlayerInput'.default.bInvertMouse);
    MouseSmooth = moCheckBox(Controls[4]);
    MouseSmooth.Checked(class'PlayerInput'.default.MouseSmoothingMode > 0);
    UseJoystick = moCheckBox(Controls[5]);
    UseJoystick.Checked(bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.ViewportManager UseJoystick")));
    MouseLag = moCheckBox(Controls[19]);
    S = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.RenderDevice ReduceMouseLag");
    MouseLag.Checked(bool(S));
    MouseSens = moFloatEdit(Controls[7]);
    MouseSens.SetValue(class'PlayerInput'.default.MouseSensitivity);
    MenuSens = moFloatEdit(Controls[9]);
    MenuSens.SetValue(Controller.MenuMouseSens);
    ifWeapon = moCheckBox(Controls[11]);
    ifWeapon.Checked(class'PlayerController'.default.bEnableWeaponForceFeedback);
    ifPickup = moCheckBox(Controls[12]);
    ifPickup.Checked(class'PlayerController'.default.bEnablePickupForceFeedback);
    ifDamage = moCheckBox(Controls[13]);
    ifDamage.Checked(class'PlayerController'.default.bEnableDamageForceFeedback);
    ifGUI = moCheckBox(Controls[14]);
    ifGUI.Checked(class'PlayerController'.default.bEnableGUIForceFeedback);
    MouseSmoothStr = moFloatEdit(Controls[16]);
    MouseSmoothStr.SetValue(class'PlayerInput'.default.MouseSmoothingStrength);
    MouseThreshold = moFloatEdit(Controls[17]);
    MouseThreshold.SetValue(class'PlayerInput'.default.MouseAccelThreshold);
    DoubleClick = moFloatEdit(Controls[18]);
    DoubleClick.SetValue(class'PlayerInput'.default.DoubleClickTime);
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0xbb
    if(PlayerOwner().Level.Game != none && Sender == AutoAim)
    {
        // End:0x7b
        if(AutoAim.IsChecked())
        {
            PlayerOwner().Level.Game.AutoAim = 1.0;
        }
        // End:0x9f
        else
        {
            PlayerOwner().Level.Game.AutoAim = 0.0;
        }
        PlayerOwner().Level.Game.SaveConfig();
    }
    // End:0x11f
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
    // End:0x1d2
    if(Sender == InvertMouse)
    {
        PlayerOwner().ConsoleCommand("set PlayerInput bInvertMouse " $ string(InvertMouse.IsChecked()));
        class'PlayerInput'.default.bInvertMouse = InvertMouse.IsChecked();
        class'PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x218
    if(Sender == MouseSmooth)
    {
        // End:0x207
        if(MouseSmooth.IsChecked())
        {
            class'PlayerInput'.default.MouseSmoothingMode = 1;
        }
        // End:0x218
        else
        {
            class'PlayerInput'.default.MouseSmoothingMode = 0;
        }
    }
    // End:0x27b
    if(Sender == UseJoystick)
    {
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.ViewportManager UseJoystick" @ string(UseJoystick.IsChecked()));
    }
    // End:0x2fb
    if(Sender == MouseSens)
    {
        class'PlayerInput'.default.MouseSensitivity = MouseSens.GetValue();
        PlayerOwner().ConsoleCommand("set PlayerInput MouseSensitivity " $ string(MouseSens.GetValue()));
        class'PlayerInput'.static.StaticSaveConfig();
    }
    // End:0x381
    if(Sender == MouseSmoothStr)
    {
        class'PlayerInput'.default.MouseSmoothingStrength = MouseSmoothStr.GetValue();
        PlayerOwner().MyController;
        // Failed to decompile this line:
             // Failed to decompile this Function's code.
              at position 1869 
 Message: Index was out of range. Must be non-negative and less than the size of the collection.
            Parameter name: index 

 StackTrace:    at UELib.Core.UStruct.UByteCodeDecompiler.FormatTokens(Int32 beginIndex, Int32 endIndex)
               at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
}

defaultproperties
{
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.740
}