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

    // End:0x4B [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x38
    if(Sender == Controls[2])
    {
        moCheckBox(Sender).Checked(Class'Engine.HUD'.default.bHideHUD);        
    }
    else
    {
        // End:0x70
        if(Sender == Controls[3])
        {
            moCheckBox(Sender).Checked(Class'Engine.HUD'.default.bShowWeaponInfo);            
        }
        else
        {
            // End:0xA8
            if(Sender == Controls[4])
            {
                moCheckBox(Sender).Checked(Class'Engine.HUD'.default.bShowPersonalInfo);                
            }
            else
            {
                // End:0xE0
                if(Sender == Controls[5])
                {
                    moCheckBox(Sender).Checked(Class'Engine.HUD'.default.bShowPoints);                    
                }
                else
                {
                    // End:0x118
                    if(Sender == Controls[6])
                    {
                        moCheckBox(Sender).Checked(Class'Engine.HUD'.default.bShowWeaponBar);                        
                    }
                    else
                    {
                        // End:0x150
                        if(Sender == Controls[7])
                        {
                            moCheckBox(Sender).Checked(Class'Engine.HUD'.default.bShowPortrait);                            
                        }
                        else
                        {
                            // End:0x18A
                            if(Sender == Controls[15])
                            {
                                moCheckBox(Sender).Checked(!Class'Engine.HUD'.default.bNoEnemyNames);                                
                            }
                            else
                            {
                                // End:0x1C1
                                if(Sender == Controls[8])
                                {
                                    moNumericEdit(Sender).SetValue(Class'Engine.HUD'.default.ConsoleMessageCount);                                    
                                }
                                else
                                {
                                    // End:0x1FC
                                    if(Sender == Controls[9])
                                    {
                                        moNumericEdit(Sender).SetValue(8 - Class'Engine.HUD'.default.ConsoleFontSize);                                        
                                    }
                                    else
                                    {
                                        // End:0x237
                                        if(Sender == Controls[10])
                                        {
                                            moNumericEdit(Sender).SetValue(Class'Engine.HUD'.default.MessageFontOffset + 4);                                            
                                        }
                                        else
                                        {
                                            // End:0x274
                                            if(Sender == Controls[12])
                                            {
                                                GUISlider(Sender).Value = Class'Engine.HUD'.default.HudScale * float(100);                                                
                                            }
                                            else
                                            {
                                                // End:0x2B4
                                                if(Sender == Controls[14])
                                                {
                                                    GUISlider(Sender).Value = (Class'Engine.HUD'.default.HudOpacity / float(255)) * float(100);
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
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    //return;    
}

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
    else
    {
        // End:0x96
        if(Sender == Controls[3])
        {
            PlayerOwner().myHUD.bShowWeaponInfo = moCheckBox(Sender).IsChecked();            
        }
        else
        {
            // End:0xD6
            if(Sender == Controls[4])
            {
                PlayerOwner().myHUD.bShowPersonalInfo = moCheckBox(Sender).IsChecked();                
            }
            else
            {
                // End:0x116
                if(Sender == Controls[5])
                {
                    PlayerOwner().myHUD.bShowPoints = moCheckBox(Sender).IsChecked();                    
                }
                else
                {
                    // End:0x156
                    if(Sender == Controls[6])
                    {
                        PlayerOwner().myHUD.bShowWeaponBar = moCheckBox(Sender).IsChecked();                        
                    }
                    else
                    {
                        // End:0x196
                        if(Sender == Controls[7])
                        {
                            PlayerOwner().myHUD.bShowPortrait = moCheckBox(Sender).IsChecked();                            
                        }
                        else
                        {
                            // End:0x1D8
                            if(Sender == Controls[15])
                            {
                                PlayerOwner().myHUD.bNoEnemyNames = !moCheckBox(Sender).IsChecked();                                
                            }
                            else
                            {
                                // End:0x217
                                if(Sender == Controls[8])
                                {
                                    PlayerOwner().myHUD.ConsoleMessageCount = moNumericEdit(Sender).GetValue();                                    
                                }
                                else
                                {
                                    // End:0x260
                                    if(Sender == Controls[9])
                                    {
                                        PlayerOwner().myHUD.ConsoleFontSize = int(Abs(float(moNumericEdit(Sender).GetValue() - 8)));                                        
                                    }
                                    else
                                    {
                                        // End:0x2A3
                                        if(Sender == Controls[10])
                                        {
                                            PlayerOwner().myHUD.MessageFontOffset = moNumericEdit(Sender).GetValue() - 4;                                            
                                        }
                                        else
                                        {
                                            // End:0x2E7
                                            if(Sender == Controls[12])
                                            {
                                                PlayerOwner().myHUD.HudScale = GUISlider(Sender).Value / float(100);                                                
                                            }
                                            else
                                            {
                                                // End:0x32E
                                                if(Sender == Controls[14])
                                                {
                                                    PlayerOwner().myHUD.HudOpacity = (GUISlider(Sender).Value / float(100)) * float(255);
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
    //return;    
}

defaultproperties
{
    CrosshairNames[0]="??"
    CrosshairNames[1]="1? ??"
    CrosshairNames[2]="2? ??"
    CrosshairNames[3]="3? ??"
    CrosshairNames[4]="4? ??"
    CrosshairNames[5]="5? ??"
    CrosshairNames[6]="?"
    CrosshairNames[7]="???"
    CrosshairNames[8]="1? ???"
    CrosshairNames[9]="2? ???"
    CrosshairNames[10]="3? ???"
    CrosshairNames[11]="1? ??"
    CrosshairNames[12]="2? ??"
    CrosshairNames[13]="1? ?"
    CrosshairNames[14]="2? ?"
    // Reference: GUIImage'XInterface_Decompressed.Tab_HudSettings.GameBK'
    begin object name="GameBK" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.1302080
        WinLeft=0.0292970
        WinWidth=0.4271480
        WinHeight=0.8031250
    end object
    Controls[0]=GameBK
    // Reference: GUIImage'XInterface_Decompressed.Tab_HudSettings.GameBK1'
    begin object name="GameBK1" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.1302080
        WinLeft=0.5175780
        WinWidth=0.4486330
        WinHeight=0.8031250
    end object
    Controls[1]=GameBK1
    // Reference: moCheckBox'XInterface_Decompressed.Tab_HudSettings.GameHudVisible'
    begin object name="GameHudVisible" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="HUD ???"
        OnCreateComponent=GameHudVisible.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ???? HUD ??? ??? ? ? ????."
        WinTop=0.0439060
        WinLeft=0.3792970
        WinWidth=0.1968750
        WinHeight=0.0400000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[2]=GameHudVisible
    // Reference: moCheckBox'XInterface_Decompressed.Tab_HudSettings.GameHudShowWeaponInfo'
    begin object name="GameHudShowWeaponInfo" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudShowWeaponInfo.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.1819270
        WinLeft=0.0500000
        WinWidth=0.3781250
        WinHeight=0.0400000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[3]=GameHudShowWeaponInfo
    // Reference: moCheckBox'XInterface_Decompressed.Tab_HudSettings.GameHudShowPersonalInfo'
    begin object name="GameHudShowPersonalInfo" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="???? ??"
        OnCreateComponent=GameHudShowPersonalInfo.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.3173430
        WinLeft=0.0500000
        WinWidth=0.3781250
        WinHeight=0.0400000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[4]=GameHudShowPersonalInfo
    // Reference: moCheckBox'XInterface_Decompressed.Tab_HudSettings.GameHudShowScore'
    begin object name="GameHudShowScore" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="????"
        OnCreateComponent=GameHudShowScore.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.4527600
        WinLeft=0.0500000
        WinWidth=0.3781250
        WinHeight=0.0400000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[5]=GameHudShowScore
    // Reference: moCheckBox'XInterface_Decompressed.Tab_HudSettings.GameHudShowWeaponBar'
    begin object name="GameHudShowWeaponBar" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ? ??"
        OnCreateComponent=GameHudShowWeaponBar.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.5985930
        WinLeft=0.0500000
        WinWidth=0.3781250
        WinHeight=0.0400000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[6]=GameHudShowWeaponBar
    // Reference: moCheckBox'XInterface_Decompressed.Tab_HudSettings.GameHudShowPortraits'
    begin object name="GameHudShowPortraits" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudShowPortraits.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.7235940
        WinLeft=0.0500000
        WinWidth=0.3781250
        WinHeight=0.0400000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[7]=GameHudShowPortraits
    // Reference: moNumericEdit'XInterface_Decompressed.Tab_HudSettings.GameHudMessageCount'
    begin object name="GameHudMessageCount" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=8
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="?? ?? ?? ?"
        OnCreateComponent=GameHudMessageCount.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.1968750
        WinLeft=0.5507810
        WinWidth=0.3812500
        WinHeight=0.0600000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[8]=GameHudMessageCount
    // Reference: moNumericEdit'XInterface_Decompressed.Tab_HudSettings.GameHudMessageScale'
    begin object name="GameHudMessageScale" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=8
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudMessageScale.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.3218740
        WinLeft=0.5507810
        WinWidth=0.3812500
        WinHeight=0.0600000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[9]=GameHudMessageScale
    // Reference: moNumericEdit'XInterface_Decompressed.Tab_HudSettings.GameHudMessageOffset'
    begin object name="GameHudMessageOffset" class=XInterface_Decompressed.moNumericEdit
        MinValue=0
        MaxValue=4
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="??? ?? ??"
        OnCreateComponent=GameHudMessageOffset.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.4364570
        WinLeft=0.5507810
        WinWidth=0.3812500
        WinHeight=0.0600000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[10]=GameHudMessageOffset
    // Reference: GUILabel'XInterface_Decompressed.Tab_HudSettings.GameHudScaleLabel'
    begin object name="GameHudScaleLabel" class=XInterface_Decompressed.GUILabel
        Caption="Hud ????"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.5604170
        WinLeft=0.5166020
        WinWidth=0.4484380
        WinHeight=32.0000000
    end object
    Controls[11]=GameHudScaleLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_HudSettings.GameHudScale'
    begin object name="GameHudScale" class=XInterface_Decompressed.GUISlider
        MinValue=50.0000000
        CalcMarkerPosition=GameHudScale.InternalCalcMarkerPosition
        IniOption="@Internal"
        Hint="Hud ????? ?????."
        WinTop=0.6353120
        WinLeft=0.5906260
        WinWidth=0.2921870
        OnClick=GameHudScale.InternalOnClick
        OnMousePressed=GameHudScale.InternalOnMousePressed
        OnMouseRelease=GameHudScale.InternalOnMouseRelease
        OnKeyEvent=GameHudScale.InternalOnKeyEvent
        OnCapturedMouseMove=GameHudScale.InternalCapturedMouseMove
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[12]=GameHudScale
    // Reference: GUILabel'XInterface_Decompressed.Tab_HudSettings.GameHudOpacityLabel'
    begin object name="GameHudOpacityLabel" class=XInterface_Decompressed.GUILabel
        Caption="Hud ????"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.7375000
        WinLeft=0.5166020
        WinWidth=0.4484380
        WinHeight=32.0000000
    end object
    Controls[13]=GameHudOpacityLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_HudSettings.GameHudOpacity'
    begin object name="GameHudOpacity" class=XInterface_Decompressed.GUISlider
        CalcMarkerPosition=GameHudOpacity.InternalCalcMarkerPosition
        IniOption="@Internal"
        Hint="Hud ????? ?????."
        WinTop=0.8082300
        WinLeft=0.5921890
        WinWidth=0.2906250
        OnClick=GameHudOpacity.InternalOnClick
        OnMousePressed=GameHudOpacity.InternalOnMousePressed
        OnMouseRelease=GameHudOpacity.InternalOnMouseRelease
        OnKeyEvent=GameHudOpacity.InternalOnKeyEvent
        OnCapturedMouseMove=GameHudOpacity.InternalCapturedMouseMove
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[14]=GameHudOpacity
    // Reference: moCheckBox'XInterface_Decompressed.Tab_HudSettings.GameHudShowEnemyNames'
    begin object name="GameHudShowEnemyNames" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudShowEnemyNames.InternalOnCreateComponent
        IniOption="@Internal"
        WinTop=0.8485940
        WinLeft=0.0500000
        WinWidth=0.3781250
        WinHeight=0.0400000
        OnLoadINI=Tab_HudSettings.InternalOnLoadINI
    end object
    Controls[15]=GameHudShowEnemyNames
    WinTop=0.1500000
    WinHeight=0.7400000
}