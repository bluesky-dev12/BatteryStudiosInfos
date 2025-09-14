class Tab_GameSettings extends UT2K3TabPanel
    editinlinenew
    instanced;

var localized string CrosshairNames[15];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

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
    i = 0;
    J0x52:

    // End:0x8A [Loop If]
    if(i < 15)
    {
        moComboBox(Controls[8]).AddItem(CrosshairNames[i]);
        i++;
        // [Loop Continue]
        goto J0x52;
    }
    moComboBox(Controls[8]).ReadOnly(true);
    // End:0xC8
    if(Class'Engine.GameInfo'.default.bAlternateMode)
    {
        Controls[4].bVisible = false;
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0x30
    if(Sender == Controls[2])
    {
        moCheckBox(Sender).Checked(bool(S));        
    }
    else
    {
        // End:0x68
        if(Sender == Controls[3])
        {
            moCheckBox(Sender).Checked(Class'Engine.Pawn'.default.bWeaponBob);            
        }
        else
        {
            // End:0xA0
            if(Sender == Controls[4])
            {
                moCheckBox(Sender).Checked(Class'Engine.GameInfo'.static.UseLowGore());                
            }
            else
            {
                // End:0xD6
                if(Sender == Controls[5])
                {
                    moCheckBox(Sender).Checked(PlayerOwner().DodgingIsEnabled());                    
                }
                else
                {
                    // End:0x112
                    if(Sender == Controls[6])
                    {
                        moCheckBox(Sender).Checked(Class'Engine.GameInfo'.default.AutoAim > float(0));                        
                    }
                    else
                    {
                        // End:0x14A
                        if(Sender == Controls[7])
                        {
                            moCheckBox(Sender).Checked(Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages);                            
                        }
                        else
                        {
                            // End:0x1BE
                            if(Sender == Controls[8])
                            {
                                // End:0x17A
                                if(!Class'Engine.HUD'.default.bCrosshairShow)
                                {
                                    i = 0;                                    
                                }
                                else
                                {
                                    i = Class'Engine.HUD'.default.CrosshairStyle + 1;
                                }
                                moComboBox(Sender).SetText(CrosshairNames[i]);
                                SetCrossHairGraphic(i);                                
                            }
                            else
                            {
                                // End:0x1FC
                                if(Sender == Controls[12])
                                {
                                    GUISlider(Sender).Value = float(Class'Engine.HUD'.default.CrossHairColor.R);                                    
                                }
                                else
                                {
                                    // End:0x23A
                                    if(Sender == Controls[14])
                                    {
                                        GUISlider(Sender).Value = float(Class'Engine.HUD'.default.CrossHairColor.G);                                        
                                    }
                                    else
                                    {
                                        // End:0x278
                                        if(Sender == Controls[16])
                                        {
                                            GUISlider(Sender).Value = float(Class'Engine.HUD'.default.CrossHairColor.B);                                            
                                        }
                                        else
                                        {
                                            // End:0x2DF
                                            if(Sender == Controls[18])
                                            {
                                                GUISlider(Sender).Value = float(Class'Engine.HUD'.default.CrossHairColor.A);
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
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    //return;    
}

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
        PlayerOwner().ConsoleCommand(("set" @ Sender.IniOption) @ string(moCheckBox(Sender).IsChecked()));        
    }
    else
    {
        // End:0xEA
        if(Sender == Controls[3])
        {
            PlayerOwner().ConsoleCommand("set Pawn bWeaponBob " $ string(moCheckBox(Sender).IsChecked()));
            Class'Engine.Pawn'.default.bWeaponBob = moCheckBox(Sender).IsChecked();
            Class'Engine.Pawn'.static.StaticSaveConfig();            
        }
        else
        {
            // End:0x144
            if(Sender == Controls[4])
            {
                PlayerOwner().Level.GameMgr.bUseGore = !moCheckBox(Sender).IsChecked();
                Class'Engine.GameInfo'.static.StaticSaveConfig();                
            }
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
                    else
                    {
                        PlayerOwner().SetDodging(true);
                    }                    
                }
                else
                {
                    // End:0x1F7
                    if(Sender == Controls[6])
                    {
                        // End:0x1D1
                        if(moCheckBox(Sender).IsChecked())
                        {
                            Class'Engine.GameInfo'.default.AutoAim = 0.5000000;                            
                        }
                        else
                        {
                            Class'Engine.GameInfo'.default.AutoAim = 0.0000000;
                        }
                        Class'Engine.GameInfo'.static.StaticSaveConfig();                        
                    }
                    else
                    {
                        // End:0x2F8
                        if(Sender == Controls[7])
                        {
                            Log("wgame bNoConsoleDeathMessages was=" $ string(Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages));
                            B = moCheckBox(Sender).IsChecked();
                            Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages = B;
                            Log("wgame bNoConsoleDeathMessages now=" $ string(Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages));
                            Class'WGame.wDeathMessage'.static.StaticSaveConfig();
                            Log("wgame bNoConsoleDeathMessages then=" $ string(Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages));                            
                        }
                        else
                        {
                            // End:0x3CD
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
                            else
                            {
                                // End:0x451
                                if(Sender == Controls[12])
                                {
                                    PlayerOwner().myHUD.CrossHairColor.R = byte(GUISlider(Sender).Value);
                                    PlayerOwner().myHUD.SaveConfig();
                                    GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;                                    
                                }
                                else
                                {
                                    // End:0x4D5
                                    if(Sender == Controls[14])
                                    {
                                        PlayerOwner().myHUD.CrossHairColor.G = byte(GUISlider(Sender).Value);
                                        PlayerOwner().myHUD.SaveConfig();
                                        GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;                                        
                                    }
                                    else
                                    {
                                        // End:0x559
                                        if(Sender == Controls[16])
                                        {
                                            PlayerOwner().myHUD.CrossHairColor.B = byte(GUISlider(Sender).Value);
                                            PlayerOwner().myHUD.SaveConfig();
                                            GUIImage(Controls[9]).ImageColor = PlayerOwner().myHUD.CrossHairColor;                                            
                                        }
                                        else
                                        {
                                            // End:0x5DA
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
    //return;    
}

function SetCrossHairGraphic(int Index)
{
    local export editinline GUIImage img;

    img = GUIImage(Controls[9]);
    img.Image = Class'XInterface_Decompressed.HudBDeathMatch'.default.Crosshairs[Index - 1].WidgetTexture;
    img.bVisible = Index != 0;
    //return;    
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
    // Reference: GUIImage'XInterface_Decompressed.Tab_GameSettings.GameBK'
    begin object name="GameBK" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.1302080
        WinLeft=0.0292970
        WinWidth=0.4271480
        WinHeight=0.8031250
    end object
    Controls[0]=GameBK
    // Reference: GUIImage'XInterface_Decompressed.Tab_GameSettings.GameBK1'
    begin object name="GameBK1" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.1302080
        WinLeft=0.5175780
        WinWidth=0.4486330
        WinHeight=0.8031250
    end object
    Controls[1]=GameBK1
    // Reference: moCheckBox'XInterface_Decompressed.Tab_GameSettings.GameScreenFlashes'
    begin object name="GameScreenFlashes" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Screen Flash"
        OnCreateComponent=GameScreenFlashes.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.ViewportManager ScreenFlashes"
        Hint="Disable this option to prevent the screen from flashing when taking damage."
        WinTop=0.1683850
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[2]=GameScreenFlashes
    // Reference: moCheckBox'XInterface_Decompressed.Tab_GameSettings.GameWeaponBob'
    begin object name="GameWeaponBob" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Weapon Bob"
        OnCreateComponent=GameWeaponBob.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="Disable this option to prevent your weapon from bobbing up and down as you move."
        WinTop=0.2907800
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[3]=GameWeaponBob
    // Reference: moCheckBox'XInterface_Decompressed.Tab_GameSettings.GameReduceGore'
    begin object name="GameReduceGore" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Reduced Blood"
        OnCreateComponent=GameReduceGore.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.AudioDevice ReverseStereo"
        Hint="Use this option to reduce the amount of blood and gore effects."
        WinTop=0.4155210
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[4]=GameReduceGore
    // Reference: moCheckBox'XInterface_Decompressed.Tab_GameSettings.GameDodging'
    begin object name="GameDodging" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Sidestep"
        OnCreateComponent=GameDodging.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.AudioDevice ReverseStereo"
        Hint="????(Dodging)? ???? ???? ? ??? ???.\"=\""
        WinTop=0.5415630
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[5]=GameDodging
    // Reference: moCheckBox'XInterface_Decompressed.Tab_GameSettings.GameAutoAim'
    begin object name="GameAutoAim" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Aim Assistance"
        OnCreateComponent=GameAutoAim.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.AudioDevice ReverseStereo"
        Hint="Helps players aim (does not function in multi-player games)."
        WinTop=0.6923440
        WinLeft=0.0500000
        WinWidth=0.4000000
        WinHeight=0.0400000
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[6]=GameAutoAim
    // Reference: moCheckBox'XInterface_Decompressed.Tab_GameSettings.GameDeathMsgs'
    begin object name="GameDeathMsgs" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="No Console Death Message"
        OnCreateComponent=GameDeathMsgs.InternalOnCreateComponent
        IniOption="ini:Engine.WGame.wDeathMessage bNoConsoleDeathMessages"
        IniDefault="False"
        Hint="Disables console messages used to announce deaths."
        WinTop=0.8325530
        WinLeft=0.0474600
        WinWidth=0.4037110
        WinHeight=0.0400000
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[7]=GameDeathMsgs
    // Reference: moComboBox'XInterface_Decompressed.Tab_GameSettings.GameCrossHair'
    begin object name="GameCrossHair" class=XInterface_Decompressed.moComboBox
        ComponentJustification=0
        CaptionWidth=0.3000000
        Caption="Crosshair"
        OnCreateComponent=GameCrossHair.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="Select your targeting crosshair."
        WinTop=0.1867190
        WinLeft=0.5521480
        WinWidth=0.3833980
        WinHeight=0.0600000
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[8]=GameCrossHair
    // Reference: GUIImage'XInterface_Decompressed.Tab_GameSettings.GameCrossHairImage'
    begin object name="GameCrossHairImage" class=XInterface_Decompressed.GUIImage
        ImageAlign=1
        X1=0
        Y1=0
        X2=64
        Y2=64
        WinTop=0.8179690
        WinLeft=0.7443340
        WinWidth=0.0552730
        WinHeight=0.0600000
    end object
    Controls[9]=GameCrossHairImage
    // Reference: GUIImage'XInterface_Decompressed.Tab_GameSettings.CrosshairBK'
    begin object name="CrosshairBK" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.7416670
        WinLeft=0.6990620
        WinWidth=0.0900000
        WinHeight=0.1500000
    end object
    Controls[10]=CrosshairBK
    // Reference: GUILabel'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairRLabel'
    begin object name="GameHudCrossHairRLabel" class=XInterface_Decompressed.GUILabel
        Caption="Red:"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.3062500
        WinLeft=0.6103530
        WinWidth=0.0812510
        WinHeight=32.0000000
    end object
    Controls[11]=GameHudCrossHairRLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairR'
    begin object name="GameHudCrossHairR" class=XInterface_Decompressed.GUISlider
        MaxValue=255.0000000
        bIntSlider=true
        CalcMarkerPosition=GameHudCrossHairR.InternalCalcMarkerPosition
        IniOption="@Internal"
        Hint="Change the crosshair color."
        WinTop=0.3332280
        WinLeft=0.6781260
        WinWidth=0.2140620
        OnClick=GameHudCrossHairR.InternalOnClick
        OnMousePressed=GameHudCrossHairR.InternalOnMousePressed
        OnMouseRelease=GameHudCrossHairR.InternalOnMouseRelease
        OnKeyEvent=GameHudCrossHairR.InternalOnKeyEvent
        OnCapturedMouseMove=GameHudCrossHairR.InternalCapturedMouseMove
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[12]=GameHudCrossHairR
    // Reference: GUILabel'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairGLabel'
    begin object name="GameHudCrossHairGLabel" class=XInterface_Decompressed.GUILabel
        Caption="Green:"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.4083330
        WinLeft=0.5806640
        WinWidth=0.1203130
        WinHeight=32.0000000
    end object
    Controls[13]=GameHudCrossHairGLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairG'
    begin object name="GameHudCrossHairG" class=XInterface_Decompressed.GUISlider
        MaxValue=255.0000000
        bIntSlider=true
        CalcMarkerPosition=GameHudCrossHairG.InternalCalcMarkerPosition
        IniOption="@Internal"
        Hint="Change the crosshair color."
        WinTop=0.4373950
        WinLeft=0.6781260
        WinWidth=0.2140620
        OnClick=GameHudCrossHairG.InternalOnClick
        OnMousePressed=GameHudCrossHairG.InternalOnMousePressed
        OnMouseRelease=GameHudCrossHairG.InternalOnMouseRelease
        OnKeyEvent=GameHudCrossHairG.InternalOnKeyEvent
        OnCapturedMouseMove=GameHudCrossHairG.InternalCapturedMouseMove
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[14]=GameHudCrossHairG
    // Reference: GUILabel'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairBLabel'
    begin object name="GameHudCrossHairBLabel" class=XInterface_Decompressed.GUILabel
        Caption="Blue:"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.5145830
        WinLeft=0.5994140
        WinWidth=0.0968760
        WinHeight=32.0000000
    end object
    Controls[15]=GameHudCrossHairBLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairB'
    begin object name="GameHudCrossHairB" class=XInterface_Decompressed.GUISlider
        MaxValue=255.0000000
        bIntSlider=true
        CalcMarkerPosition=GameHudCrossHairB.InternalCalcMarkerPosition
        IniOption="@Internal"
        Hint="Change the crosshair color."
        WinTop=0.5415620
        WinLeft=0.6781260
        WinWidth=0.2140620
        OnClick=GameHudCrossHairB.InternalOnClick
        OnMousePressed=GameHudCrossHairB.InternalOnMousePressed
        OnMouseRelease=GameHudCrossHairB.InternalOnMouseRelease
        OnKeyEvent=GameHudCrossHairB.InternalOnKeyEvent
        OnCapturedMouseMove=GameHudCrossHairB.InternalCapturedMouseMove
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[16]=GameHudCrossHairB
    // Reference: GUILabel'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairALabel'
    begin object name="GameHudCrossHairALabel" class=XInterface_Decompressed.GUILabel
        Caption="Opaque:"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.6166670
        WinLeft=0.5712890
        WinWidth=0.1203130
        WinHeight=32.0000000
    end object
    Controls[17]=GameHudCrossHairALabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_GameSettings.GameHudCrossHairA'
    begin object name="GameHudCrossHairA" class=XInterface_Decompressed.GUISlider
        MaxValue=255.0000000
        bIntSlider=true
        CalcMarkerPosition=GameHudCrossHairA.InternalCalcMarkerPosition
        IniOption="@Internal"
        Hint="Change the crosshair color."
        WinTop=0.6457290
        WinLeft=0.6781260
        WinWidth=0.2140620
        OnClick=GameHudCrossHairA.InternalOnClick
        OnMousePressed=GameHudCrossHairA.InternalOnMousePressed
        OnMouseRelease=GameHudCrossHairA.InternalOnMouseRelease
        OnKeyEvent=GameHudCrossHairA.InternalOnKeyEvent
        OnCapturedMouseMove=GameHudCrossHairA.InternalCapturedMouseMove
        OnLoadINI=Tab_GameSettings.InternalOnLoadINI
    end object
    Controls[18]=GameHudCrossHairA
    WinTop=0.1500000
    WinHeight=0.7400000
}