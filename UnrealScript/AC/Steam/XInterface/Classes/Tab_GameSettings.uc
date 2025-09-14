/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_GameSettings.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class Tab_GameSettings extends UT2K3TabPanel
    dependson(HudBDeathMatch)
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
    i = 0;
    J0x52:
    // End:0x8a [While If]
    if(i < 15)
    {
        moComboBox(Controls[8]).AddItem(CrosshairNames[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x52;
    }
    moComboBox(Controls[8]).ReadOnly(true);
    // End:0xc8
    if(class'GameInfo'.default.bAlternateMode)
    {
        Controls[4].bVisible = false;
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0x30
    if(Sender == Controls[2])
    {
        moCheckBox(Sender).Checked(bool(S));
    }
    // End:0x2df
    else
    {
        // End:0x68
        if(Sender == Controls[3])
        {
            moCheckBox(Sender).Checked(class'Pawn'.default.bWeaponBob);
        }
        // End:0x2df
        else
        {
            // End:0xa0
            if(Sender == Controls[4])
            {
                moCheckBox(Sender).Checked(class'GameInfo'.static.UseLowGore());
            }
            // End:0x2df
            else
            {
                // End:0xd6
                if(Sender == Controls[5])
                {
                    moCheckBox(Sender).Checked(PlayerOwner().DodgingIsEnabled());
                }
                // End:0x2df
                else
                {
                    // End:0x112
                    if(Sender == Controls[6])
                    {
                        moCheckBox(Sender).Checked(class'GameInfo'.default.AutoAim > float(0));
                    }
                    // End:0x2df
                    else
                    {
                        // End:0x14a
                        if(Sender == Controls[7])
                        {
                            moCheckBox(Sender).Checked(class'wDeathMessage'.default.bNoConsoleDeathMessages);
                        }
                        // End:0x2df
                        else
                        {
                            // End:0x1be
                            if(Sender == Controls[8])
                            {
                                // End:0x17a
                                if(!class'HUD'.default.bCrosshairShow)
                                {
                                    i = 0;
                                }
                                // End:0x191
                                else
                                {
                                    i = class'HUD'.default.CrosshairStyle + 1;
                                }
                                moComboBox(Sender).SetText(CrosshairNames[i]);
                                SetCrossHairGraphic(i);
                            }
                            // End:0x2df
                            else
                            {
                                // End:0x1fc
                                if(Sender == Controls[12])
                                {
                                    GUISlider(Sender).Value = float(class'HUD'.default.CrossHairColor.R);
                                }
                                // End:0x2df
                                else
                                {
                                    // End:0x23a
                                    if(Sender == Controls[14])
                                    {
                                        GUISlider(Sender).Value = float(class'HUD'.default.CrossHairColor.G);
                                    }
                                    // End:0x2df
                                    else
                                    {
                                        // End:0x278
                                        if(Sender == Controls[16])
                                        {
                                            GUISlider(Sender).Value = float(class'HUD'.default.CrossHairColor.B);
                                        }
                                        // End:0x2df
                                        else
                                        {
                                            // End:0x2df
                                            if(Sender == Controls[18])
                                            {
                                                GUISlider(Sender).Value = float(class'HUD'.default.CrossHairColor.A);
                                                GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;
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
    local bool B;

    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0x66
    if(Sender == Controls[2])
    {
        PlayerOwner().ConsoleCommand("set" @ Sender.IniOption @ string(moCheckBox(Sender).IsChecked()));
    }
    // End:0x5da
    else
    {
        // End:0xea
        if(Sender == Controls[3])
        {
            PlayerOwner().ConsoleCommand("set Pawn bWeaponBob " $ string(moCheckBox(Sender).IsChecked()));
            class'Pawn'.default.bWeaponBob = moCheckBox(Sender).IsChecked();
            class'Pawn'.static.StaticSaveConfig();
        }
        // End:0x5da
        else
        {
            // End:0x144
            if(Sender == Controls[4])
            {
                PlayerOwner().Level.GameMgr.bUseGore = !moCheckBox(Sender).IsChecked();
                class'GameInfo'.static.StaticSaveConfig();
            }
            // End:0x5da
            else
            {
                // End:0x191
                if(Sender == Controls[5])
                {
                    // End:0x180
                    if(!moCheckBox(Sender).IsChecked())
                    {
                        PlayerOwner().SetDodging(false);
                    }
                    // End:0x18e
                    else
                    {
                        PlayerOwner().SetDodging(true);
                    }
                }
                // End:0x5da
                else
                {
                    // End:0x1f7
                    if(Sender == Controls[6])
                    {
                        // End:0x1d1
                        if(moCheckBox(Sender).IsChecked())
                        {
                            class'GameInfo'.default.AutoAim = 0.50;
                        }
                        // End:0x1e5
                        else
                        {
                            class'GameInfo'.default.AutoAim = 0.0;
                        }
                        class'GameInfo'.static.StaticSaveConfig();
                    }
                    // End:0x5da
                    else
                    {
                        // End:0x2f8
                        if(Sender == Controls[7])
                        {
                            Log("wgame bNoConsoleDeathMessages was=" $ string(class'wDeathMessage'.default.bNoConsoleDeathMessages));
                            B = moCheckBox(Sender).IsChecked();
                            class'wDeathMessage'.default.bNoConsoleDeathMessages = B;
                            Log("wgame bNoConsoleDeathMessages now=" $ string(class'wDeathMessage'.default.bNoConsoleDeathMessages));
                            class'wDeathMessage'.static.StaticSaveConfig();
                            Log("wgame bNoConsoleDeathMessages then=" $ string(class'wDeathMessage'.default.bNoConsoleDeathMessages));
                        }
                        // End:0x5da
                        else
                        {
                            // End:0x3cd
                            if(Sender == Controls[8])
                            {
                                SetCrossHairGraphic(moComboBox(Sender).GetIndex());
                                // End:0x372
                                if(moComboBox(Sender).GetText() == "Hidden")
                                {
                                    PlayerOwner().myHUD.bCrosshairShow = false;
                                    PlayerOwner().myHUD.SaveConfig();
                                    return;
                                }
                                PlayerOwner().myHUD.bCrosshairShow = true;
                                PlayerOwner().myHUD.CrosshairStyle = moComboBox(Sender).GetIndex() - 1;
                                PlayerOwner().myHUD.SaveConfig();
                            }
                            // End:0x5da
                            else
                            {
                                // End:0x451
                                if(Sender == Controls[12])
                                {
                                    PlayerOwner().myHUD.CrossHairColor.R = byte(GUISlider(Sender).Value);
                                    PlayerOwner().myHUD.SaveConfig();
                                    GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;
                                }
                                // End:0x5da
                                else
                                {
                                    // End:0x4d5
                                    if(Sender == Controls[14])
                                    {
                                        PlayerOwner().myHUD.CrossHairColor.G = byte(GUISlider(Sender).Value);
                                        PlayerOwner().myHUD.SaveConfig();
                                        GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;
                                    }
                                    // End:0x5da
                                    else
                                    {
                                        // End:0x559
                                        if(Sender == Controls[16])
                                        {
                                            PlayerOwner().myHUD.CrossHairColor.B = byte(GUISlider(Sender).Value);
                                            PlayerOwner().myHUD.SaveConfig();
                                            GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;
                                        }
                                        // End:0x5da
                                        else
                                        {
                                            // End:0x5da
                                            if(Sender == Controls[18])
                                            {
                                                PlayerOwner().myHUD.CrossHairColor.A = byte(GUISlider(Sender).Value);
                                                PlayerOwner().myHUD.SaveConfig();
                                                GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;
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

function SetCrossHairGraphic(int Index)
{
    local export editinline GUIImage img;

    img = GUIImage(Controls[9]);
    img.Image = class'HudBDeathMatch'.default.Crosshairs[Index - 1].WidgetTexture;
    img.bVisible = Index != 0;
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