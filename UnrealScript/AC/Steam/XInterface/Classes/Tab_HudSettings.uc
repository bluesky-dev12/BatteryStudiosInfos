/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_HudSettings.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *
 *******************************************************************************/
class Tab_HudSettings extends UT2K3TabPanel
    editinlinenew
    instanced;

var localized string CrosshairNames[15];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

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
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x38
    if(Sender == Controls[2])
    {
        moCheckBox(Sender).Checked(class'HUD'.default.bHideHUD);
    }
    // End:0x2b4
    else
    {
        // End:0x70
        if(Sender == Controls[3])
        {
            moCheckBox(Sender).Checked(class'HUD'.default.bShowWeaponInfo);
        }
        // End:0x2b4
        else
        {
            // End:0xa8
            if(Sender == Controls[4])
            {
                moCheckBox(Sender).Checked(class'HUD'.default.bShowPersonalInfo);
            }
            // End:0x2b4
            else
            {
                // End:0xe0
                if(Sender == Controls[5])
                {
                    moCheckBox(Sender).Checked(class'HUD'.default.bShowPoints);
                }
                // End:0x2b4
                else
                {
                    // End:0x118
                    if(Sender == Controls[6])
                    {
                        moCheckBox(Sender).Checked(class'HUD'.default.bShowWeaponBar);
                    }
                    // End:0x2b4
                    else
                    {
                        // End:0x150
                        if(Sender == Controls[7])
                        {
                            moCheckBox(Sender).Checked(class'HUD'.default.bShowPortrait);
                        }
                        // End:0x2b4
                        else
                        {
                            // End:0x18a
                            if(Sender == Controls[15])
                            {
                                moCheckBox(Sender).Checked(!class'HUD'.default.bNoEnemyNames);
                            }
                            // End:0x2b4
                            else
                            {
                                // End:0x1c1
                                if(Sender == Controls[8])
                                {
                                    moNumericEdit(Sender).SetValue(class'HUD'.default.ConsoleMessageCount);
                                }
                                // End:0x2b4
                                else
                                {
                                    // End:0x1fc
                                    if(Sender == Controls[9])
                                    {
                                        moNumericEdit(Sender).SetValue(8 - class'HUD'.default.ConsoleFontSize);
                                    }
                                    // End:0x2b4
                                    else
                                    {
                                        // End:0x237
                                        if(Sender == Controls[10])
                                        {
                                            moNumericEdit(Sender).SetValue(class'HUD'.default.MessageFontOffset + 4);
                                        }
                                        // End:0x2b4
                                        else
                                        {
                                            // End:0x274
                                            if(Sender == Controls[12])
                                            {
                                                GUISlider(Sender).Value = class'HUD'.default.HudScale * float(100);
                                            }
                                            // End:0x2b4
                                            else
                                            {
                                                // End:0x2b4
                                                if(Sender == Controls[14])
                                                {
                                                    GUISlider(Sender).Value = class'HUD'.default.HudOpacity / float(255) * float(100);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

function string InternalOnSaveINI(GUIComponent Sender);
function InternalOnChange(GUIComponent Sender)
{
    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0x56
    if(Sender == Controls[2])
    {
        PlayerOwner().myHUD.bHideHUD = moCheckBox(Sender).IsChecked();
    }
    // End:0x32e
    else
    {
        // End:0x96
        if(Sender == Controls[3])
        {
            PlayerOwner().myHUD.bShowWeaponInfo = moCheckBox(Sender).IsChecked();
        }
        // End:0x32e
        else
        {
            // End:0xd6
            if(Sender == Controls[4])
            {
                PlayerOwner().myHUD.bShowPersonalInfo = moCheckBox(Sender).IsChecked();
            }
            // End:0x32e
            else
            {
                // End:0x116
                if(Sender == Controls[5])
                {
                    PlayerOwner().myHUD.bShowPoints = moCheckBox(Sender).IsChecked();
                }
                // End:0x32e
                else
                {
                    // End:0x156
                    if(Sender == Controls[6])
                    {
                        PlayerOwner().myHUD.bShowWeaponBar = moCheckBox(Sender).IsChecked();
                    }
                    // End:0x32e
                    else
                    {
                        // End:0x196
                        if(Sender == Controls[7])
                        {
                            PlayerOwner().myHUD.bShowPortrait = moCheckBox(Sender).IsChecked();
                        }
                        // End:0x32e
                        else
                        {
                            // End:0x1d8
                            if(Sender == Controls[15])
                            {
                                PlayerOwner().myHUD.bNoEnemyNames = !moCheckBox(Sender).IsChecked();
                            }
                            // End:0x32e
                            else
                            {
                                // End:0x217
                                if(Sender == Controls[8])
                                {
                                    PlayerOwner().myHUD.ConsoleMessageCount = moNumericEdit(Sender).GetValue();
                                }
                                // End:0x32e
                                else
                                {
                                    // End:0x260
                                    if(Sender == Controls[9])
                                    {
                                        PlayerOwner().myHUD.ConsoleFontSize = int(Abs(float(moNumericEdit(Sender).GetValue() - 8)));
                                    }
                                    // End:0x32e
                                    else
                                    {
                                        // End:0x2a3
                                        if(Sender == Controls[10])
                                        {
                                            PlayerOwner().myHUD.MessageFontOffset = moNumericEdit(Sender).GetValue() - 4;
                                        }
                                        // End:0x32e
                                        else
                                        {
                                            // End:0x2e7
                                            if(Sender == Controls[12])
                                            {
                                                PlayerOwner().myHUD.HudScale = GUISlider(Sender).Value / float(100);
                                            }
                                            // End:0x32e
                                            else
                                            {
                                                // End:0x32e
                                                if(Sender == Controls[14])
                                                {
                                                    PlayerOwner().myHUD.HudOpacity = GUISlider(Sender).Value / float(100) * float(255);
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    PlayerOwner().myHUD.SaveConfig();
}

defaultproperties
{
    CrosshairNames[0]="Hidden"
    CrosshairNames[1]="Crosshair 1"
    CrosshairNames[2]="Crosshair 2"
    CrosshairNames[3]="Crosshair 3"
    CrosshairNames[4]="Crosshair 4"
    CrosshairNames[5]="Crosshair 5"
    CrosshairNames[6]="Point"
    CrosshairNames[7]="Pointer"
    CrosshairNames[8]="Triangle 1"
    CrosshairNames[9]="Triangle 2"
    CrosshairNames[10]="Triangle 3"
    CrosshairNames[11]="Angle 1"
    CrosshairNames[12]="Angle 2"
    CrosshairNames[13]="Circle 1"
    CrosshairNames[14]="Circle 2"
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.740
}