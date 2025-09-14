class Tab_AudioSettings extends UT2K3TabPanel
    config(User)
    editinlinenew
    instanced;

var localized string AudioModes[4];
var localized string VoiceModes[4];
var localized string AnnounceModes[3];
var export editinline moComboBox APack;
var config APackInfo BonusPackInfo[4];
var config array<APackInfo> PackInfo;
var bool bInitialized;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local string DefPack;

    super(GUIPanel).InitComponent(MyController, myOwner);
    bInitialized = false;
    i = 0;
    J0x1F:

    // End:0x53 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    i = 0;
    J0x5A:

    // End:0x92 [Loop If]
    if(i < 4)
    {
        moComboBox(Controls[8]).AddItem(AudioModes[i]);
        i++;
        // [Loop Continue]
        goto J0x5A;
    }
    i = 0;
    J0x99:

    // End:0xD1 [Loop If]
    if(i < 4)
    {
        moComboBox(Controls[14]).AddItem(VoiceModes[i]);
        i++;
        // [Loop Continue]
        goto J0x99;
    }
    i = 0;
    J0xD8:

    // End:0x110 [Loop If]
    if(i < 3)
    {
        moComboBox(Controls[15]).AddItem(AnnounceModes[i]);
        i++;
        // [Loop Continue]
        goto J0xD8;
    }
    Controls[3].FriendlyLabel = GUILabel(Controls[2]);
    Controls[5].FriendlyLabel = GUILabel(Controls[4]);
    APack = moComboBox(Controls[16]);
    DefPack = Class'UnrealGame.UnrealPlayer'.default.CustomizedAnnouncerPack;
    i = 0;
    J0x17C:

    // End:0x212 [Loop If]
    if(i < 4)
    {
        // End:0x208
        if(BonusPackInfo[i].Description != "")
        {
            APack.AddItem(BonusPackInfo[i].Description, none, BonusPackInfo[i].PackageName);
            // End:0x208
            if(BonusPackInfo[i].PackageName ~= DefPack)
            {
                APack.SetText(BonusPackInfo[i].Description);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x17C;
    }
    i = 0;
    J0x219:

    // End:0x29C [Loop If]
    if(i < PackInfo.Length)
    {
        APack.AddItem(PackInfo[i].Description, none, PackInfo[i].PackageName);
        // End:0x292
        if(PackInfo[i].PackageName ~= DefPack)
        {
            APack.SetText(PackInfo[i].Description);
        }
        i++;
        // [Loop Continue]
        goto J0x219;
    }
    bInitialized = true;
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local bool b1, b2, b3;

    // End:0x3A
    if(Sender == Controls[7])
    {
        GUISlider(Controls[7]).SetValue(float(PlayerOwner().AnnouncerVolume));        
    }
    else
    {
        // End:0x1BC
        if(Sender == Controls[8])
        {
            b1 = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice UseEAX"));
            b2 = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice CompatibilityMode"));
            b3 = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice Use3DSound"));
            // End:0x146
            if(b2)
            {
                moComboBox(Controls[8]).SetText(AudioModes[3]);                
            }
            else
            {
                // End:0x171
                if(b1)
                {
                    moComboBox(Controls[8]).SetText(AudioModes[2]);                    
                }
                else
                {
                    // End:0x19B
                    if(b3)
                    {
                        moComboBox(Controls[8]).SetText(AudioModes[1]);                        
                    }
                    else
                    {
                        moComboBox(Controls[8]).SetText(AudioModes[0]);
                    }
                }
            }            
        }
        else
        {
            // End:0x1EC
            if(Sender == Controls[9])
            {
                moCheckBox(Sender).Checked(bool(S));                
            }
            else
            {
                // End:0x32C
                if(Sender == Controls[14])
                {
                    // End:0x259
                    if((!PlayerOwner().bNoVoiceMessages && !PlayerOwner().bNoVoiceTaunts) && !PlayerOwner().bNoAutoTaunts)
                    {
                        moComboBox(Controls[14]).SetText(VoiceModes[0]);                        
                    }
                    else
                    {
                        // End:0x2B2
                        if((!PlayerOwner().bNoVoiceMessages && !PlayerOwner().bNoVoiceTaunts) && PlayerOwner().bNoAutoTaunts)
                        {
                            moComboBox(Controls[14]).SetText(VoiceModes[1]);                            
                        }
                        else
                        {
                            // End:0x30A
                            if((!PlayerOwner().bNoVoiceMessages && PlayerOwner().bNoVoiceTaunts) && PlayerOwner().bNoAutoTaunts)
                            {
                                moComboBox(Controls[14]).SetText(VoiceModes[2]);                                
                            }
                            else
                            {
                                moComboBox(Controls[14]).SetText(VoiceModes[3]);
                            }
                        }
                    }                    
                }
                else
                {
                    // End:0x364
                    if(Sender == Controls[10])
                    {
                        moCheckBox(Sender).Checked(Class'Engine.HUD'.default.bMessageBeep);                        
                    }
                    else
                    {
                        // End:0x39A
                        if(Sender == Controls[11])
                        {
                            moCheckBox(Sender).Checked(PlayerOwner().bAutoTaunt);                            
                        }
                        else
                        {
                            // End:0x3D2
                            if(Sender == Controls[12])
                            {
                                moCheckBox(Sender).Checked(!PlayerOwner().bNoMatureLanguage);                                
                            }
                            else
                            {
                                // End:0x541
                                if(Sender == Controls[13])
                                {
                                    b1 = PlayerOwner().Level.bLowSoundDetail;
                                    b2 = bool(PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice LowQualitySound"));
                                    // End:0x524
                                    if(b1 != b2)
                                    {
                                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice LowQualitySound" @ string(b1));
                                        PlayerOwner().ConsoleCommand("SOUND_REBOOT");
                                        // End:0x524
                                        if((PlayerOwner().Level.Song != "") && PlayerOwner().Level.Song != "None")
                                        {
                                            PlayerOwner().ClientSetMusic(PlayerOwner().Level.Song, 1);
                                        }
                                    }
                                    moCheckBox(Sender).Checked(b1);                                    
                                }
                                else
                                {
                                    // End:0x575
                                    if(Sender == Controls[15])
                                    {
                                        moComboBox(Sender).SetIndex(int(PlayerOwner().AnnouncerLevel));
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
    local string t;
    local bool b1, b2, b3;

    // End:0x16
    if(!Controller.bCurMenuInitialized)
    {
        return;
    }
    // End:0x80
    if(Sender == Controls[3])
    {
        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume " $ string(GUISlider(Sender).Value));        
    }
    else
    {
        // End:0x104
        if(Sender == Controls[5])
        {
            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume " $ string(GUISlider(Sender).Value));
            PlayerOwner().ConsoleCommand("stopsounds");            
        }
        else
        {
            // End:0x15D
            if(Sender == Controls[7])
            {
                PlayerOwner().AnnouncerVolume = byte(GUISlider(Controls[7]).Value);
                PlayerOwner().SaveConfig();
                PlayerOwner().PlayRewardAnnouncement('Adrenalin', 0, true);                
            }
            else
            {
                // End:0x5CD
                if(Sender == Controls[8])
                {
                    t = moComboBox(Sender).GetText();
                    // End:0x266
                    if(t == AudioModes[3])
                    {
                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice UseEAX false");
                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice Use3DSound false");
                        PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice CompatibilityMode true");                        
                    }
                    else
                    {
                        // End:0x343
                        if(t == AudioModes[0])
                        {
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice UseEAX false");
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice Use3DSound false");
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice CompatibilityMode false");                            
                        }
                        else
                        {
                            // End:0x449
                            if(t == AudioModes[1])
                            {
                                PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice UseEAX false");
                                PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice Use3DSound true");
                                PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice CompatibilityMode false");
                                Controller.OpenMenu("XInterface.UT2PerformWarn");                                
                            }
                            else
                            {
                                // End:0x54C
                                if(t == AudioModes[2])
                                {
                                    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice UseEAX true");
                                    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice Use3DSound true");
                                    PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice CompatibilityMode false");
                                    Controller.OpenMenu("XInterface.UT2PerformWarn");
                                }
                            }
                        }
                    }
                    PlayerOwner().ConsoleCommand("SOUND_REBOOT");
                    // End:0x5CA
                    if((PlayerOwner().Level.Song != "") && PlayerOwner().Level.Song != "None")
                    {
                        PlayerOwner().ClientSetMusic(PlayerOwner().Level.Song, 1);
                    }                    
                }
                else
                {
                    // End:0x61D
                    if(Sender == Controls[9])
                    {
                        PlayerOwner().ConsoleCommand(("set" @ Sender.IniOption) @ string(moCheckBox(Sender).IsChecked()));                        
                    }
                    else
                    {
                        // End:0x6A2
                        if(Sender == Controls[10])
                        {
                            // End:0x66C
                            if(PlayerOwner().myHUD != none)
                            {
                                PlayerOwner().myHUD.bMessageBeep = moCheckBox(Sender).IsChecked();
                            }
                            Class'Engine.HUD'.default.bMessageBeep = moCheckBox(Sender).IsChecked();
                            Class'Engine.HUD'.static.StaticSaveConfig();                            
                        }
                        else
                        {
                            // End:0x6D8
                            if(Sender == Controls[11])
                            {
                                PlayerOwner().SetAutoTaunt(moCheckBox(Sender).IsChecked());                                
                            }
                            else
                            {
                                // End:0x71B
                                if(Sender == Controls[12])
                                {
                                    PlayerOwner().bNoMatureLanguage = !moCheckBox(Sender).IsChecked();
                                    PlayerOwner().SaveConfig();                                    
                                }
                                else
                                {
                                    // End:0x82D
                                    if(Sender == Controls[14])
                                    {
                                        t = moComboBox(Sender).GetText();
                                        // End:0x773
                                        if(t == VoiceModes[0])
                                        {
                                            b1 = false;
                                            b2 = false;
                                            b3 = false;                                            
                                        }
                                        else
                                        {
                                            // End:0x79F
                                            if(t == VoiceModes[1])
                                            {
                                                b1 = true;
                                                b2 = false;
                                                b3 = false;                                                
                                            }
                                            else
                                            {
                                                // End:0x7CC
                                                if(t == VoiceModes[2])
                                                {
                                                    b1 = true;
                                                    b2 = true;
                                                    b3 = false;                                                    
                                                }
                                                else
                                                {
                                                    b1 = true;
                                                    b2 = true;
                                                    b3 = true;
                                                }
                                            }
                                        }
                                        PlayerOwner().bNoAutoTaunts = b1;
                                        PlayerOwner().bNoVoiceTaunts = b2;
                                        PlayerOwner().bNoVoiceMessages = b3;
                                        PlayerOwner().SaveConfig();                                        
                                    }
                                    else
                                    {
                                        // End:0x956
                                        if(Sender == Controls[13])
                                        {
                                            b1 = moCheckBox(Sender).IsChecked();
                                            PlayerOwner().Level.bLowSoundDetail = b1;
                                            PlayerOwner().Level.SaveConfig();
                                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice LowQualitySound" @ string(b1));
                                            PlayerOwner().ConsoleCommand("SOUND_REBOOT");
                                            // End:0x953
                                            if((PlayerOwner().Level.Song != "") && PlayerOwner().Level.Song != "None")
                                            {
                                                PlayerOwner().ClientSetMusic(PlayerOwner().Level.Song, 1);
                                            }                                            
                                        }
                                        else
                                        {
                                            // End:0x998
                                            if(Sender == Controls[15])
                                            {
                                                PlayerOwner().AnnouncerLevel = byte(moComboBox(Sender).GetIndex());
                                                PlayerOwner().SaveConfig();                                                
                                            }
                                            else
                                            {
                                                // End:0xA03
                                                if(Sender == APack)
                                                {
                                                    Class'UnrealGame.UnrealPlayer'.default.CustomizedAnnouncerPack = APack.GetExtra();
                                                    Class'UnrealGame.UnrealPlayer'.static.StaticSaveConfig();
                                                    // End:0xA03
                                                    if(UnrealPlayer(PlayerOwner()) != none)
                                                    {
                                                        UnrealPlayer(PlayerOwner()).CustomizedAnnouncerPack = APack.GetExtra();
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
    //return;    
}

defaultproperties
{
    AudioModes[0]="Software 3D Audio"
    AudioModes[1]="Hardware 3D Audio"
    AudioModes[2]="Hardware 3D Audio + EAX"
    AudioModes[3]="Safe Mode"
    VoiceModes[0]="All"
    VoiceModes[1]="Disable Auto-taunts"
    VoiceModes[2]="Disable Taunts"
    VoiceModes[3]="None"
    AnnounceModes[0]="None"
    AnnounceModes[1]="Min."
    AnnounceModes[2]="All"
    BonusPackInfo[0]=(PackageName="",Description="UT2003")
    BonusPackInfo[1]=(PackageName="",Description="Evil")
    BonusPackInfo[2]=(PackageName="",Description="Female")
    BonusPackInfo[3]=(PackageName="",Description="Branched")
    // Reference: GUIImage'XInterface_Decompressed.Tab_AudioSettings.AudioBK1'
    begin object name="AudioBK1" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0832810
        WinLeft=0.0216410
        WinWidth=0.9575000
        WinHeight=0.1662890
    end object
    Controls[0]=AudioBK1
    // Reference: GUIImage'XInterface_Decompressed.Tab_AudioSettings.AudioBK2'
    begin object name="AudioBK2" class=XInterface_Decompressed.GUIImage
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.3624460
        WinLeft=0.0216410
        WinWidth=0.9575000
        WinHeight=0.6258970
    end object
    Controls[1]=AudioBK2
    // Reference: GUILabel'XInterface_Decompressed.Tab_AudioSettings.AudioMusicVolumeLabel'
    begin object name="AudioMusicVolumeLabel" class=XInterface_Decompressed.GUILabel
        Caption="Music Volume"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.1000000
        WinLeft=0.0556640
        WinWidth=0.2500000
        WinHeight=32.0000000
    end object
    Controls[2]=AudioMusicVolumeLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_AudioSettings.AudioMusicVolumeSlider'
    begin object name="AudioMusicVolumeSlider" class=XInterface_Decompressed.GUISlider
        MaxValue=1.0000000
        CalcMarkerPosition=AudioMusicVolumeSlider.InternalCalcMarkerPosition
        IniOption="ini:Engine.Engine.AudioDevice MusicVolume"
        IniDefault="0.5"
        Hint="Change the background music volume."
        WinTop=0.1561460
        WinLeft=0.0625000
        WinWidth=0.2500000
        OnClick=AudioMusicVolumeSlider.InternalOnClick
        OnMousePressed=AudioMusicVolumeSlider.InternalOnMousePressed
        OnMouseRelease=AudioMusicVolumeSlider.InternalOnMouseRelease
        OnKeyEvent=AudioMusicVolumeSlider.InternalOnKeyEvent
        OnCapturedMouseMove=AudioMusicVolumeSlider.InternalCapturedMouseMove
    end object
    Controls[3]=AudioMusicVolumeSlider
    // Reference: GUILabel'XInterface_Decompressed.Tab_AudioSettings.AudioEffectsVolumeLabel'
    begin object name="AudioEffectsVolumeLabel" class=XInterface_Decompressed.GUILabel
        Caption="SFX Volume"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.1000000
        WinLeft=0.6855470
        WinWidth=0.2500000
        WinHeight=32.0000000
    end object
    Controls[4]=AudioEffectsVolumeLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_AudioSettings.AudioEffectsVolumeSlider'
    begin object name="AudioEffectsVolumeSlider" class=XInterface_Decompressed.GUISlider
        MaxValue=1.0000000
        CalcMarkerPosition=AudioEffectsVolumeSlider.InternalCalcMarkerPosition
        IniOption="ini:Engine.Engine.AudioDevice SoundVolume"
        IniDefault="0.9"
        Hint="Change the volume for all sound effects."
        WinTop=0.1561460
        WinLeft=0.6875000
        WinWidth=0.2500000
        OnClick=AudioEffectsVolumeSlider.InternalOnClick
        OnMousePressed=AudioEffectsVolumeSlider.InternalOnMousePressed
        OnMouseRelease=AudioEffectsVolumeSlider.InternalOnMouseRelease
        OnKeyEvent=AudioEffectsVolumeSlider.InternalOnKeyEvent
        OnCapturedMouseMove=AudioEffectsVolumeSlider.InternalCapturedMouseMove
    end object
    Controls[5]=AudioEffectsVolumeSlider
    // Reference: GUILabel'XInterface_Decompressed.Tab_AudioSettings.AudioVoiceVolumeLabel'
    begin object name="AudioVoiceVolumeLabel" class=XInterface_Decompressed.GUILabel
        Caption="Announcer Volume"
        TextAlign=1
        TextColor=(R=255,G=255,B=255,A=255)
        WinTop=0.1000000
        WinLeft=0.3691410
        WinWidth=0.2500000
        WinHeight=32.0000000
    end object
    Controls[6]=AudioVoiceVolumeLabel
    // Reference: GUISlider'XInterface_Decompressed.Tab_AudioSettings.AudioVoiceVolumeSlider'
    begin object name="AudioVoiceVolumeSlider" class=XInterface_Decompressed.GUISlider
        MinValue=1.0000000
        MaxValue=4.0000000
        bIntSlider=true
        CalcMarkerPosition=AudioVoiceVolumeSlider.InternalCalcMarkerPosition
        IniOption="@Internal"
        Hint="Change the volume of all audio messages during the game."
        WinTop=0.1561460
        WinLeft=0.3750000
        WinWidth=0.2500000
        OnClick=AudioVoiceVolumeSlider.InternalOnClick
        OnMousePressed=AudioVoiceVolumeSlider.InternalOnMousePressed
        OnMouseRelease=AudioVoiceVolumeSlider.InternalOnMouseRelease
        OnKeyEvent=AudioVoiceVolumeSlider.InternalOnKeyEvent
        OnCapturedMouseMove=AudioVoiceVolumeSlider.InternalCapturedMouseMove
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
    end object
    Controls[7]=AudioVoiceVolumeSlider
    // Reference: moComboBox'XInterface_Decompressed.Tab_AudioSettings.AudioMode'
    begin object name="AudioMode" class=XInterface_Decompressed.moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.3000000
        Caption="Audio Mode"
        OnCreateComponent=AudioMode.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Software 3D Audio"
        Hint="Change the audio system mode."
        WinTop=0.2786460
        WinLeft=0.1500000
        WinWidth=0.7000000
        WinHeight=0.0600000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[8]=AudioMode
    // Reference: moCheckBox'XInterface_Decompressed.Tab_AudioSettings.AudioReverseStereo'
    begin object name="AudioReverseStereo" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Switch Stereo Left/Right"
        OnCreateComponent=AudioReverseStereo.InternalOnCreateComponent
        IniOption="ini:Engine.Engine.AudioDevice ReverseStereo"
        IniDefault="False"
        Hint="Switch left and right audio channels."
        WinTop=0.4333330
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[9]=AudioReverseStereo
    // Reference: moCheckBox'XInterface_Decompressed.Tab_AudioSettings.AudioMessageBeep'
    begin object name="AudioMessageBeep" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Message Alerts"
        OnCreateComponent=AudioMessageBeep.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Alerts when you receive a message from other players."
        WinTop=0.4333330
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[10]=AudioMessageBeep
    // Reference: moCheckBox'XInterface_Decompressed.Tab_AudioSettings.AudioAutoTaunt'
    begin object name="AudioAutoTaunt" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Auto-Taunt"
        OnCreateComponent=AudioAutoTaunt.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Players automatically taunt other players during the game."
        WinTop=0.5333330
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[11]=AudioAutoTaunt
    // Reference: moCheckBox'XInterface_Decompressed.Tab_AudioSettings.AudioMatureTaunts'
    begin object name="AudioMatureTaunts" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Mature Taunts"
        OnCreateComponent=AudioMatureTaunts.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="Allows the use of more mature taunts."
        WinTop=0.5333300
        WinLeft=0.6000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[12]=AudioMatureTaunts
    // Reference: moCheckBox'XInterface_Decompressed.Tab_AudioSettings.AudioLowDetail'
    begin object name="AudioLowDetail" class=XInterface_Decompressed.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="Low Sound Detail"
        OnCreateComponent=AudioLowDetail.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="Reduce sound quality for better performance."
        WinTop=0.6333300
        WinLeft=0.1000000
        WinWidth=0.3000000
        WinHeight=0.0400000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[13]=AudioLowDetail
    // Reference: moComboBox'XInterface_Decompressed.Tab_AudioSettings.AudioPlayVoices'
    begin object name="AudioPlayVoices" class=XInterface_Decompressed.moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="Play Voice"
        OnCreateComponent=AudioPlayVoices.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="All"
        Hint="Choose the voice message type to play."
        WinTop=0.7332910
        WinLeft=0.2603520
        WinWidth=0.4687500
        WinHeight=0.0600000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[14]=AudioPlayVoices
    // Reference: moComboBox'XInterface_Decompressed.Tab_AudioSettings.AudioAnnounce'
    begin object name="AudioAnnounce" class=XInterface_Decompressed.moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="Voice Guide"
        OnCreateComponent=AudioAnnounce.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="All"
        Hint="Adjust the announcer's voice used in the game."
        WinTop=0.8165970
        WinLeft=0.2603520
        WinWidth=0.4687500
        WinHeight=0.0600000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[15]=AudioAnnounce
    // Reference: moComboBox'XInterface_Decompressed.Tab_AudioSettings.AudioAnnouncerPack'
    begin object name="AudioAnnouncerPack" class=XInterface_Decompressed.moComboBox
        bReadOnly=true
        ComponentJustification=0
        Caption="Announcer's Voice"
        OnCreateComponent=AudioAnnouncerPack.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="Select the announcer."
        WinTop=0.9000690
        WinLeft=0.2603520
        WinWidth=0.4687500
        WinHeight=0.0600000
        OnLoadINI=Tab_AudioSettings.InternalOnLoadINI
        OnSaveINI=Tab_AudioSettings.InternalOnSaveINI
    end object
    Controls[16]=AudioAnnouncerPack
    WinTop=0.1500000
    WinHeight=0.7400000
}