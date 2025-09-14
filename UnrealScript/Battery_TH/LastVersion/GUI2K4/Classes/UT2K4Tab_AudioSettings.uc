class UT2K4Tab_AudioSettings extends Settings_Tabs
    editinlinenew
    instanced;

var array<AnnouncerRecord> Announcers;
var string StatusPreviewSound;
var string RewardPreviewSound;
var localized string AudioModes[4];
var localized string VoiceModes[4];
var localized string AnnounceModes[3];
var() automated GUISectionBackground i_BG1;
var() automated GUISectionBackground i_BG2;
var() automated GUISectionBackground i_BG3;
var() automated moSlider sl_MusicVol;
var() automated moSlider sl_EffectsVol;
var() automated moSlider sl_VoiceVol;
var() automated moSlider sl_TTS;
var() automated moComboBox co_Mode;
var() automated moComboBox co_Voices;
var() automated moComboBox co_Announce;
var() automated moComboBox co_RewardAnnouncer;
var() automated moComboBox co_StatusAnnouncer;
var() automated moCheckBox ch_ReverseStereo;
var() automated moCheckBox ch_MessageBeep;
var() automated moCheckBox ch_AutoTaunt;
var() automated moCheckBox ch_TTSIRC;
var() automated moCheckBox ch_OnlyTeamTTS;
var() automated moCheckBox ch_MatureTaunts;
var() automated moCheckBox ch_LowDetail;
var() automated moCheckBox ch_Default;
var() automated moCheckBox ch_TTS;
var() automated moCheckBox ch_VoiceChat;
var() automated moButton b_VoiceChat;
var float fMusic;
var float fEffects;
var float fTTS;
var int iVoice;
var int iMode;
var int iVoiceMode;
var int iAnnounce;
var string sStatAnnouncer;
var string sRewAnnouncer;
var bool bRev;
var bool bBeep;
var bool bAuto;
var bool bMature;
var bool bLow;
var bool bCompat;
var bool b3DSound;
var bool bEAX;
var bool bDefault;
var bool bTTS;
var bool bTTSIRC;
var bool bOnlyTeamTTS;
var bool bVoiceChat;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local bool bIsWin32;

    bIsWin32 = PlatformIsWindows() && !PlatformIs64Bit();
    super.InitComponent(MyController, myOwner);
    // End:0x6D
    if(bIsWin32)
    {
        i = 0;
        J0x3A:

        // End:0x6A [Loop If]
        if(i < 4)
        {
            co_Mode.AddItem(AudioModes[i]);
            i++;
            // [Loop Continue]
            goto J0x3A;
        }        
    }
    else
    {
        co_Mode.AddItem("OpenAL");
    }
    i = 0;
    J0x8B:

    // End:0xBB [Loop If]
    if(i < 4)
    {
        co_Voices.AddItem(VoiceModes[i]);
        i++;
        // [Loop Continue]
        goto J0x8B;
    }
    i = 0;
    J0xC2:

    // End:0xF2 [Loop If]
    if(i < 3)
    {
        co_Announce.AddItem(AnnounceModes[i]);
        i++;
        // [Loop Continue]
        goto J0xC2;
    }
    i_BG2.WinWidth = 0.5033980;
    i_BG2.WinHeight = 0.4530450;
    i_BG2.WinLeft = 0.0040630;
    i_BG2.WinTop = 0.5408310;
    i_BG3.WinWidth = 0.4750780;
    i_BG3.WinHeight = 0.4530450;
    i_BG3.WinLeft = 0.5187120;
    i_BG3.WinTop = 0.5408310;
    i_BG1.ManageComponent(sl_MusicVol);
    i_BG1.ManageComponent(sl_EffectsVol);
    i_BG1.ManageComponent(co_Mode);
    i_BG1.ManageComponent(ch_LowDetail);
    i_BG1.ManageComponent(ch_Default);
    i_BG1.ManageComponent(ch_ReverseStereo);
    i_BG1.ManageComponent(co_Voices);
    i_BG1.ManageComponent(ch_MatureTaunts);
    i_BG1.ManageComponent(ch_AutoTaunt);
    i_BG1.ManageComponent(ch_MessageBeep);
    i_BG2.ManageComponent(sl_VoiceVol);
    i_BG2.ManageComponent(co_Announce);
    i_BG3.ManageComponent(ch_TTS);
    i_BG3.ManageComponent(ch_TTSIRC);
    i_BG3.ManageComponent(ch_OnlyTeamTTS);
    i_BG3.ManageComponent(ch_VoiceChat);
    i_BG3.ManageComponent(b_VoiceChat);
    i_BG2.ManageComponent(co_StatusAnnouncer);
    i_BG2.ManageComponent(co_RewardAnnouncer);
    Class'Engine.CacheManager'.static.GetAnnouncerList(Announcers);
    i = 0;
    J0x326:

    // End:0x3A5 [Loop If]
    if(i < Announcers.Length)
    {
        // End:0x39B
        if(Announcers[i].FriendlyName != "")
        {
            co_StatusAnnouncer.AddItem(Announcers[i].FriendlyName,, string(i));
            co_RewardAnnouncer.AddItem(Announcers[i].FriendlyName,, string(i));
        }
        i++;
        // [Loop Continue]
        goto J0x326;
    }
    // End:0x3BF
    if(!PlatformIsWindows())
    {
        ch_Default.DisableMe();
    }
    //return;    
}

function ResetClicked()
{
    local Class<AudioSubsystem> A;
    local Class UnrealPlayerClass;
    local PlayerController PC;
    local int i;

    super.ResetClicked();
    PC = PlayerOwner();
    A = Class<AudioSubsystem>(DynamicLoadObject(GetNativeClassName("Engine.Engine.AudioDevice"), Class'Core.Class'));
    A.static.ResetConfig();
    Class'Engine.HUD'.static.ResetConfig("bMessageBeep");
    Class'Engine.LevelInfo'.static.ResetConfig("bLowSoundDetail");
    Class'Engine.PlayerController'.static.ResetConfig("bAutoTaunt");
    Class'Engine.PlayerController'.static.ResetConfig("bNoMatureLanguage");
    Class'Engine.PlayerController'.static.ResetConfig("bNoAutoTaunts");
    Class'Engine.PlayerController'.static.ResetConfig("bNoVoiceTaunts");
    Class'Engine.PlayerController'.static.ResetConfig("bNoVoiceMessages");
    Class'Engine.PlayerController'.static.ResetConfig("AnnouncerLevel");
    Class'Engine.PlayerController'.static.ResetConfig("bNoTextToSpeechVoiceMessages");
    Class'Engine.PlayerController'.static.ResetConfig("bOnlySpeakTeamText");
    Class'GUI2K4_Decompressed.UT2K4IRC_Page'.static.ResetConfig("bIRCTextToSpeechEnabled");
    UnrealPlayerClass = Class<Object>(DynamicLoadObject("UnrealGame.UnrealPlayer", Class'Core.Class'));
    // End:0x252
    if(UnrealPlayerClass != none)
    {
        UnrealPlayerClass.static.ResetConfig("CustomRewardAnnouncerPack");
        UnrealPlayerClass.static.ResetConfig("CustomStatusAnnouncerPack");
    }
    i = 0;
    J0x259:

    // End:0x289 [Loop If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        i++;
        // [Loop Continue]
        goto J0x259;
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;
    local PlayerController PC;
    local bool bIsWin32;

    PC = PlayerOwner();
    switch(Sender)
    {
        // End:0x48
        case sl_VoiceVol:
            iVoice = int(PC.AnnouncerVolume);
            sl_VoiceVol.SetComponentValue(string(iVoice), true);
            // End:0x8DE
            break;
        // End:0xB0
        case sl_MusicVol:
            fMusic = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));
            sl_MusicVol.SetComponentValue(string(fMusic), true);
            // End:0x8DE
            break;
        // End:0x118
        case sl_EffectsVol:
            fEffects = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume"));
            sl_EffectsVol.SetComponentValue(string(fEffects), true);
            // End:0x8DE
            break;
        // End:0x275
        case co_Mode:
            iMode = 1;
            bIsWin32 = PlatformIsWindows() && !PlatformIs64Bit();
            // End:0x166
            if(!bIsWin32)
            {
                bCompat = false;
                b3DSound = true;
                iMode = 0;                
            }
            else
            {
                // End:0x1BE
                if(bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice CompatibilityMode")))
                {
                    bCompat = true;
                    iMode = 0;
                }
                // End:0x210
                if(bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice Use3DSound")))
                {
                    b3DSound = true;
                    iMode = 2;
                }
                // End:0x25E
                if(bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseEAX")))
                {
                    bEAX = true;
                    iMode = 3;
                }
            }
            co_Mode.SilentSetIndex(iMode);
            // End:0x8DE
            break;
        // End:0x2E1
        case ch_ReverseStereo:
            bRev = bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice ReverseStereo"));
            ch_ReverseStereo.SetComponentValue(string(bRev), true);
            // End:0x8DE
            break;
        // End:0x350
        case ch_Default:
            bDefault = bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseDefaultDriver"));
            ch_Default.SetComponentValue(string(bDefault), true);
            // End:0x8DE
            break;
        // End:0x3BC
        case co_Voices:
            // End:0x371
            if(PC.bNoAutoTaunts)
            {
                iVoiceMode = 1;
            }
            // End:0x38B
            if(PC.bNoVoiceTaunts)
            {
                iVoiceMode = 2;
            }
            // End:0x3A5
            if(PC.bNoVoiceMessages)
            {
                iVoiceMode = 3;
            }
            co_Voices.SilentSetIndex(iVoiceMode);
            // End:0x8DE
            break;
        // End:0x3F5
        case ch_MessageBeep:
            bBeep = Class'Engine.HUD'.default.bMessageBeep;
            ch_MessageBeep.SetComponentValue(string(bBeep), true);
            // End:0x8DE
            break;
        // End:0x42E
        case ch_AutoTaunt:
            bAuto = PC.bAutoTaunt;
            ch_AutoTaunt.SetComponentValue(string(bAuto), true);
            // End:0x8DE
            break;
        // End:0x469
        case ch_TTS:
            bTTS = !PC.bNoTextToSpeechVoiceMessages;
            ch_TTS.SetComponentValue(string(bTTS), true);
            // End:0x8DE
            break;
        // End:0x4A2
        case ch_OnlyTeamTTS:
            bOnlyTeamTTS = PC.bOnlySpeakTeamText;
            ch_OnlyTeamTTS.SetComponentValue(string(bOnlyTeamTTS), true);
            // End:0x8DE
            break;
        // End:0x4DD
        case ch_MatureTaunts:
            bMature = !PC.bNoMatureLanguage;
            ch_MatureTaunts.SetComponentValue(string(bMature), true);
            // End:0x8DE
            break;
        // End:0x665
        case ch_LowDetail:
            bLow = PC.Level.bLowSoundDetail;
            // End:0x64A
            if(bLow != bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice LowQualitySound")))
            {
                PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice LowQualitySound" @ string(bLow));
                PC.ConsoleCommand("SOUND_REBOOT");
                // End:0x62B
                if((PC.Level.Song != "") && PC.Level.Song != "None")
                {
                    PC.ClientSetMusic(PC.Level.Song, 1);                    
                }
                else
                {
                    PC.ClientSetMusic(Class'GUI2K4_Decompressed.UT2k4MainMenu'.default.MenuSong, 1);
                }
            }
            ch_LowDetail.SetComponentValue(string(bLow), true);
            // End:0x8DE
            break;
        // End:0x69A
        case co_Announce:
            iAnnounce = int(PC.AnnouncerLevel);
            co_Announce.SilentSetIndex(iAnnounce);
            // End:0x8DE
            break;
        // End:0x7DE
        case co_RewardAnnouncer:
            // End:0x6E3
            if(PC.IsA('UnrealPlayer'))
            {
                sStatAnnouncer = PC.GetCustomStatusAnnouncerClass();
                sRewAnnouncer = PC.GetCustomRewardAnnouncerClass();                
            }
            else
            {
                sStatAnnouncer = Class'UnrealGame.UnrealPlayer'.default.CustomStatusAnnouncerPack;
                sRewAnnouncer = Class'UnrealGame.UnrealPlayer'.default.CustomRewardAnnouncerPack;
            }
            i = FindAnnouncerClassIndex(sStatAnnouncer);
            // End:0x773
            if(i != -1)
            {
                i = co_StatusAnnouncer.FindIndex(Announcers[i].FriendlyName);
                // End:0x773
                if(i != -1)
                {
                    co_StatusAnnouncer.SilentSetIndex(i);
                }
            }
            i = FindAnnouncerClassIndex(sRewAnnouncer);
            // End:0x7DB
            if(i != -1)
            {
                i = co_RewardAnnouncer.FindIndex(Announcers[i].FriendlyName);
                // End:0x7DB
                if(i != -1)
                {
                    co_RewardAnnouncer.SilentSetIndex(i);
                }
            }
            // End:0x8DE
            break;
        // End:0x817
        case ch_TTSIRC:
            bTTSIRC = Class'GUI2K4_Decompressed.UT2K4IRC_Page'.default.bIRCTextToSpeechEnabled;
            ch_TTSIRC.SetComponentValue(string(bTTSIRC), true);
            // End:0x8DE
            break;
        // End:0x87D
        case ch_VoiceChat:
            bVoiceChat = bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
            ch_VoiceChat.SetComponentValue(string(bVoiceChat), true);
            // End:0x8DE
            break;
        // End:0xFFFF
        default:
            Log((string(Name) @ "Unknown component calling LoadINI:") $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
            break;
    }
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local PlayerController PC;
    local float AnnouncerVol;
    local Sound snd;
    local int AnnouncerIdx;
    local bool bIsWin32;

    bIsWin32 = PlatformIsWindows() && !PlatformIs64Bit();
    super.InternalOnChange(Sender);
    PC = PlayerOwner();
    switch(Sender)
    {
        // End:0x17A
        case sl_VoiceVol:
            iVoice = int(sl_VoiceVol.GetValue());
            AnnouncerVol = 2.0000000 * FClamp(0.1000000 + (float(iVoice) * 0.2250000), 0.2000000, 1.0000000);
            // End:0x8F
            if(co_StatusAnnouncer == none)
            {
                return;
            }
            snd = Sound(co_StatusAnnouncer.GetObject());
            // End:0x177
            if((snd == none) && Announcers.Length > 0)
            {
                snd = Sound(DynamicLoadObject((Announcers[AnnouncerIdx].PackageName $ ".") $ StatusPreviewSound, Class'Engine.Sound'));
                // End:0x131
                if(snd == none)
                {
                    snd = Sound(DynamicLoadObject((Announcers[AnnouncerIdx].FallbackPackage $ ".") $ StatusPreviewSound, Class'Engine.Sound'));
                }
                co_StatusAnnouncer.MyComboBox.List.SetObjectAtIndex(co_StatusAnnouncer.MyComboBox.List.Index, snd);
            }
            // End:0xA28
            break;
        // End:0x20B
        case sl_MusicVol:
            fMusic = sl_MusicVol.GetValue();
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume" @ string(fMusic));
            PC.ConsoleCommand("SetMusicVolume" @ string(fMusic));
            // End:0xA28
            break;
        // End:0x28F
        case sl_EffectsVol:
            fEffects = sl_EffectsVol.GetValue();
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume" @ string(fEffects));
            PC.ConsoleCommand("stopsounds");
            // End:0xA28
            break;
        // End:0x481
        case co_Mode:
            // End:0x2A5
            if(!bIsWin32)
            {
                // [Explicit Continue]
                goto J0xA28;
            }
            iMode = co_Mode.GetIndex();
            // End:0x2CB
            if(iMode > 1)
            {
                ShowPerformanceWarning();
            }
            bCompat = iMode < 1;
            b3DSound = iMode > 1;
            bEAX = iMode > 2;
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice CompatibilityMode" @ string(bCompat));
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice Use3DSound" @ string(b3DSound));
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice UseEAX" @ string(bEAX));
            PC.ConsoleCommand("SOUND_REBOOT");
            // End:0x45F
            if((PC.Level.Song != "") && PC.Level.Song != "None")
            {
                PC.ClientSetMusic(PC.Level.Song, 1);                
            }
            else
            {
                PC.ClientSetMusic(Class'GUI2K4_Decompressed.UT2k4MainMenu'.default.MenuSong, 1);
            }
            // End:0xA28
            break;
        // End:0x4A2
        case ch_ReverseStereo:
            bRev = ch_ReverseStereo.IsChecked();
            // End:0xA28
            break;
        // End:0x4C3
        case ch_MessageBeep:
            bBeep = ch_MessageBeep.IsChecked();
            // End:0xA28
            break;
        // End:0x4E4
        case ch_AutoTaunt:
            bAuto = ch_AutoTaunt.IsChecked();
            // End:0xA28
            break;
        // End:0x505
        case ch_TTS:
            bTTS = ch_TTS.IsChecked();
            // End:0xA28
            break;
        // End:0x526
        case ch_MatureTaunts:
            bMature = ch_MatureTaunts.IsChecked();
            // End:0xA28
            break;
        // End:0x546
        case co_Voices:
            iVoiceMode = co_Voices.GetIndex();
            // End:0xA28
            break;
        // End:0x5D3
        case ch_Default:
            bDefault = ch_Default.IsChecked();
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice UseDefaultDriver" @ string(bDefault));
            PC.ConsoleCommand("SOUND_REBOOT");
            // End:0xA28
            break;
        // End:0x722
        case ch_LowDetail:
            bLow = ch_LowDetail.IsChecked();
            PC.Level.bLowSoundDetail = bLow;
            PC.Level.StaticSaveConfig();
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice LowQualitySound" @ string(bLow));
            PC.ConsoleCommand("SOUND_REBOOT");
            // End:0x700
            if((PC.Level.Song != "") && PC.Level.Song != "None")
            {
                PC.ClientSetMusic(PC.Level.Song, 1);                
            }
            else
            {
                PC.ClientSetMusic(Class'GUI2K4_Decompressed.UT2k4MainMenu'.default.MenuSong, 1);
            }
            // End:0xA28
            break;
        // End:0x742
        case co_Announce:
            iAnnounce = co_Announce.GetIndex();
            // End:0xA28
            break;
        // End:0x882
        case co_RewardAnnouncer:
            AnnouncerIdx = int(co_RewardAnnouncer.GetExtra());
            sRewAnnouncer = Announcers[AnnouncerIdx].ClassName;
            AnnouncerVol = 2.0000000 * FClamp(0.1000000 + (float(iVoice) * 0.2250000), 0.2000000, 1.0000000);
            snd = Sound(co_RewardAnnouncer.GetObject());
            // End:0x87F
            if(snd == none)
            {
                snd = Sound(DynamicLoadObject((Announcers[AnnouncerIdx].PackageName $ ".") $ RewardPreviewSound, Class'Engine.Sound'));
                // End:0x839
                if(snd == none)
                {
                    snd = Sound(DynamicLoadObject((Announcers[AnnouncerIdx].FallbackPackage $ ".") $ RewardPreviewSound, Class'Engine.Sound'));
                }
                co_RewardAnnouncer.MyComboBox.List.SetObjectAtIndex(co_RewardAnnouncer.MyComboBox.List.Index, snd);
            }
            // End:0xA28
            break;
        // End:0x9C2
        case co_StatusAnnouncer:
            AnnouncerIdx = int(co_StatusAnnouncer.GetExtra());
            sStatAnnouncer = Announcers[AnnouncerIdx].ClassName;
            AnnouncerVol = 2.0000000 * FClamp(0.1000000 + (float(iVoice) * 0.2250000), 0.2000000, 1.0000000);
            snd = Sound(co_StatusAnnouncer.GetObject());
            // End:0x9BF
            if(snd == none)
            {
                snd = Sound(DynamicLoadObject((Announcers[AnnouncerIdx].PackageName $ ".") $ StatusPreviewSound, Class'Engine.Sound'));
                // End:0x979
                if(snd == none)
                {
                    snd = Sound(DynamicLoadObject((Announcers[AnnouncerIdx].FallbackPackage $ ".") $ StatusPreviewSound, Class'Engine.Sound'));
                }
                co_StatusAnnouncer.MyComboBox.List.SetObjectAtIndex(co_StatusAnnouncer.MyComboBox.List.Index, snd);
            }
            // End:0xA28
            break;
        // End:0x9E3
        case ch_TTSIRC:
            bTTSIRC = ch_TTSIRC.IsChecked();
            // End:0xA28
            break;
        // End:0xA04
        case ch_VoiceChat:
            bVoiceChat = ch_VoiceChat.IsChecked();
            // End:0xA28
            break;
        // End:0xA25
        case ch_OnlyTeamTTS:
            bOnlyTeamTTS = ch_OnlyTeamTTS.IsChecked();
            // End:0xA28
            break;
        // End:0xFFFF
        default:
            break;
    }
    J0xA28:

    //return;    
}

function SaveSettings()
{
    local PlayerController PC;
    local bool bSave, bReboot;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0x64
    if(int(PC.AnnouncerLevel) != iAnnounce)
    {
        PC.AnnouncerLevel = byte(iAnnounce);
        PC.default.AnnouncerLevel = PC.AnnouncerLevel;
        bSave = true;
    }
    // End:0xB2
    if(int(PC.AnnouncerVolume) != iVoice)
    {
        PC.AnnouncerVolume = byte(iVoice);
        PC.default.AnnouncerVolume = byte(iVoice);
        bSave = true;
    }
    // End:0xEA
    if(PC.bOnlySpeakTeamText != bOnlyTeamTTS)
    {
        PC.bOnlySpeakTeamText = bOnlyTeamTTS;
        bSave = true;
    }
    // End:0x124
    if(PC.bNoTextToSpeechVoiceMessages == bTTS)
    {
        PC.bNoTextToSpeechVoiceMessages = !bTTS;
        bSave = true;
    }
    // End:0x163
    if(Class'GUI2K4_Decompressed.UT2K4IRC_Page'.default.bIRCTextToSpeechEnabled != bTTSIRC)
    {
        Class'GUI2K4_Decompressed.UT2K4IRC_Page'.default.bIRCTextToSpeechEnabled = bTTSIRC;
        Class'GUI2K4_Decompressed.UT2K4IRC_Page'.static.StaticSaveConfig();
    }
    // End:0x1B5
    if(PC.bNoMatureLanguage == bMature)
    {
        PC.bNoMatureLanguage = !bMature;
        PC.default.bNoMatureLanguage = !bMature;
        bSave = true;
    }
    // End:0x210
    if(PC.bNoAutoTaunts != (iVoiceMode > 0))
    {
        PC.bNoAutoTaunts = iVoiceMode > 0;
        PC.default.bNoAutoTaunts = PC.bNoAutoTaunts;
        bSave = true;
    }
    // End:0x26B
    if(PC.bNoVoiceTaunts != (iVoiceMode > 1))
    {
        PC.bNoVoiceTaunts = iVoiceMode > 1;
        PC.default.bNoVoiceTaunts = PC.bNoVoiceTaunts;
        bSave = true;
    }
    // End:0x2C8
    if(PC.bNoVoiceMessages != (iVoiceMode == 3))
    {
        PC.bNoVoiceMessages = iVoiceMode == 3;
        PC.default.bNoVoiceMessages = PC.bNoVoiceMessages;
        bSave = true;
    }
    // End:0x329
    if(fMusic != sl_MusicVol.GetValue())
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume" @ string(fMusic));
    }
    // End:0x38A
    if(fEffects != sl_EffectsVol.GetValue())
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume" @ string(fEffects));
    }
    // End:0x422
    if(bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice ReverseStereo")) != bRev)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice ReverseStereo" @ string(bRev));
    }
    // End:0x4C8
    if(bDefault != bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseDefaultDriver")))
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice UseDefaultDriver" @ string(bDefault));
        bReboot = true;
    }
    // End:0x536
    if(PC.myHUD != none)
    {
        // End:0x533
        if(PC.myHUD.bMessageBeep != bBeep)
        {
            PC.myHUD.bMessageBeep = bBeep;
            PC.myHUD.SaveConfig();
        }        
    }
    else
    {
        // End:0x575
        if(Class'Engine.HUD'.default.bMessageBeep != bBeep)
        {
            Class'Engine.HUD'.default.bMessageBeep = bBeep;
            Class'Engine.HUD'.static.StaticSaveConfig();
        }
    }
    // End:0x612
    if(!PC.Level.IsDemoBuild() && PC.IsA('UnrealPlayer'))
    {
        // End:0x5DD
        if(PC.GetCustomStatusAnnouncerClass() != sStatAnnouncer)
        {
            PC.SetCustomStatusAnnouncerClass(sStatAnnouncer);
            bSave = true;
        }
        // End:0x612
        if(PC.GetCustomRewardAnnouncerClass() != sRewAnnouncer)
        {
            PC.SetCustomRewardAnnouncerClass(sRewAnnouncer);
            bSave = true;
        }
    }
    // End:0x68B
    if(bVoiceChat != bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP")))
    {
        // End:0x674
        if(bVoiceChat)
        {
            PC.EnableVoiceChat();            
        }
        else
        {
            PC.DisableVoiceChat();
        }
        bReboot = false;
    }
    // End:0x6A0
    if(bSave)
    {
        PC.SaveConfig();
    }
    // End:0x6CF
    if(PC.bAutoTaunt != bAuto)
    {
        PC.SetAutoTaunt(bAuto);
    }
    // End:0x771
    if(!PC.Level.IsDemoBuild() && !PC.IsA('UnrealPlayer'))
    {
        // End:0x771
        if(!Class'UnrealGame.UnrealPlayer'.default.CustomStatusAnnouncerPack ~= sStatAnnouncer || !Class'UnrealGame.UnrealPlayer'.default.CustomRewardAnnouncerPack ~= sRewAnnouncer)
        {
            Class'UnrealGame.UnrealPlayer'.default.CustomStatusAnnouncerPack = sStatAnnouncer;
            Class'UnrealGame.UnrealPlayer'.default.CustomRewardAnnouncerPack = sRewAnnouncer;
            Class'UnrealGame.UnrealPlayer'.static.StaticSaveConfig();
        }
    }
    // End:0x798
    if(bReboot)
    {
        PC.ConsoleCommand("SOUND_REBOOT");
    }
    //return;    
}

function int FindAnnouncerClassIndex(string AnnouncerClass)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < Announcers.Length)
    {
        // End:0x37
        if(Announcers[i].ClassName ~= AnnouncerClass)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function string GetAnnouncerClass(int Index)
{
    // End:0x20
    if((Index < 0) || Index >= Announcers.Length)
    {
        return "";
    }
    return Announcers[Index].ClassName;
    //return;    
}

function string GetAnnouncerPackage(int Index)
{
    // End:0x20
    if((Index < 0) || Index >= Announcers.Length)
    {
        return "";
    }
    return Announcers[Index].PackageName;
    //return;    
}

defaultproperties
{
    StatusPreviewSound="1_minute_remains"
    RewardPreviewSound="unstoppable"
    AudioModes[0]="?? ??"
    AudioModes[1]="????? 3D ???"
    AudioModes[2]="???? 3D ???"
    AudioModes[3]="???? 3D ??? + EAX"
    VoiceModes[0]="??"
    VoiceModes[1]="?? ?? ??"
    VoiceModes[2]="?? ??"
    VoiceModes[3]="??"
    AnnounceModes[0]="??"
    AnnounceModes[1]="??"
    AnnounceModes[2]="??"
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioBK1'
    begin object name="AudioBK1" class=XInterface.GUISectionBackground
        Caption="?? ??"
        NumColumns=2
        MaxPerColumn=5
        WinTop=0.0173930
        WinLeft=0.0040630
        WinWidth=0.9877730
        WinHeight=0.5028500
        OnPreDraw=AudioBK1.InternalPreDraw
    end object
    i_BG1=AudioBK1
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioBK2'
    begin object name="AudioBK2" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.0043720
        WinLeft=0.0040630
        WinWidth=0.9877730
        WinHeight=0.5174980
        OnPreDraw=AudioBK2.InternalPreDraw
    end object
    i_BG2=AudioBK2
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioBK3'
    begin object name="AudioBK3" class=XInterface.GUISectionBackground
        Caption="?? ??? ?? ??"
        WinTop=0.0043720
        WinLeft=0.0040630
        WinWidth=0.9877730
        WinHeight=0.5174980
        OnPreDraw=AudioBK3.InternalPreDraw
    end object
    i_BG3=AudioBK3
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioMusicVolume'
    begin object name="AudioMusicVolume" class=XInterface.moSlider
        MaxValue=1.0000000
        Caption="?? ??"
        OnCreateComponent=AudioMusicVolume.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.5"
        Hint="?? ??? ??? ?????."
        WinTop=0.0705220
        WinLeft=0.0181640
        WinWidth=0.4500000
        TabOrder=0
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    sl_MusicVol=AudioMusicVolume
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioEffectsVolumeSlider'
    begin object name="AudioEffectsVolumeSlider" class=XInterface.moSlider
        MaxValue=1.0000000
        Caption="?? ?? ??"
        OnCreateComponent=AudioEffectsVolumeSlider.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.9"
        Hint="?? ? ?? ?? ??? ?????."
        WinTop=0.0705220
        WinLeft=0.5240240
        WinWidth=0.4500000
        TabOrder=5
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    sl_EffectsVol=AudioEffectsVolumeSlider
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioAnnouncerVolume'
    begin object name="AudioAnnouncerVolume" class=XInterface.moSlider
        MaxValue=4.0000000
        MinValue=1.0000000
        bIntSlider=true
        CaptionWidth=0.6500000
        Caption="?? ?? ??"
        OnCreateComponent=AudioAnnouncerVolume.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ? ?? ??? ???? ??? ?????."
        WinTop=0.5978660
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=10
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    sl_VoiceVol=AudioAnnouncerVolume
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioMode'
    begin object name="AudioMode" class=XInterface.moComboBox
        bReadOnly=true
        Caption="??? ??"
        OnCreateComponent=AudioMode.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Software 3D Audio"
        Hint="??? ??? ??? ?????."
        WinTop=0.1497390
        WinLeft=0.0181640
        WinWidth=0.4500000
        TabOrder=1
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    co_Mode=AudioMode
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioPlayVoices'
    begin object name="AudioPlayVoices" class=XInterface.moComboBox
        bReadOnly=true
        Caption="??? ???"
        OnCreateComponent=AudioPlayVoices.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="All"
        Hint="???? ??? ??? ??? ??? ?????."
        WinTop=0.1497390
        WinLeft=0.5240240
        WinWidth=0.4500000
        TabOrder=6
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    co_Voices=AudioPlayVoices
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioAnnounce'
    begin object name="AudioAnnounce" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.6500000
        Caption="????"
        OnCreateComponent=AudioAnnounce.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="All"
        Hint="?? ? ?? ??? ?? ?????."
        WinTop=0.7110790
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=11
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    co_Announce=AudioAnnounce
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioRewardAnnouncer'
    begin object name="AudioRewardAnnouncer" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.6500000
        Caption="?? ??? ?? ??"
        OnCreateComponent=AudioRewardAnnouncer.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ????? ???? ? ?? ?????? ?? ??? ?? ? ????."
        WinTop=0.8909910
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=13
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    co_RewardAnnouncer=AudioRewardAnnouncer
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioStatusAnnouncer'
    begin object name="AudioStatusAnnouncer" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.6500000
        Caption="?? ?? ??"
        OnCreateComponent=AudioStatusAnnouncer.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ??? ??? ?????? ?????? ?????."
        WinTop=0.8010350
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=12
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
    end object
    co_StatusAnnouncer=AudioStatusAnnouncer
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioReverseStereo'
    begin object name="AudioReverseStereo" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="??? ????"
        OnCreateComponent=AudioReverseStereo.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="???? ??? ??? ??? ?????."
        WinTop=0.4056780
        WinLeft=0.0181640
        WinWidth=0.4500000
        TabOrder=4
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_ReverseStereo=AudioReverseStereo
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioMessageBeep'
    begin object name="AudioMessageBeep" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="??? ???"
        OnCreateComponent=AudioMessageBeep.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ??????? ?? ???? ?? ?? ???? ??? ???."
        WinTop=0.4056780
        WinLeft=0.5240240
        WinWidth=0.4500000
        TabOrder=9
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_MessageBeep=AudioMessageBeep
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioAutoTaunt'
    begin object name="AudioAutoTaunt" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="?? ??"
        OnCreateComponent=AudioAutoTaunt.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ? ???? ?? ?? ?? ?? ??."
        WinTop=0.3203650
        WinLeft=0.5240240
        WinWidth=0.4500000
        TabOrder=8
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_AutoTaunt=AudioAutoTaunt
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.IRCTextToSpeech'
    begin object name="IRCTextToSpeech" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="IRC ?? ??? ?? ??"
        OnCreateComponent=IRCTextToSpeech.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="IRC ????? ??? ?? ??? ?? ?? ??? ?? (??? ?????? ???? ?????)"
        WinTop=0.7554620
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=16
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_TTSIRC=IRCTextToSpeech
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.OnlyTeamTTSCheck'
    begin object name="OnlyTeamTTSCheck" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="? ???? ??"
        OnCreateComponent=OnlyTeamTTSCheck.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ? ??, ? ?? ??? ?? ??? ???? ???? ?????. ??? ??? ????? ??."
        WinTop=0.7554620
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=17
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_OnlyTeamTTS=OnlyTeamTTSCheck
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioMatureTaunts'
    begin object name="AudioMatureTaunts" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="??? ??"
        OnCreateComponent=AudioMatureTaunts.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?????? ?????? ? ??? ???? ?????."
        WinTop=0.2350520
        WinLeft=0.5240240
        WinWidth=0.4500000
        TabOrder=7
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_MatureTaunts=AudioMatureTaunts
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioLowDetail'
    begin object name="AudioLowDetail" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="?? ??"
        OnCreateComponent=AudioLowDetail.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="??? ???? ????."
        WinTop=0.2350520
        WinLeft=0.0181640
        WinWidth=0.4500000
        TabOrder=2
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_LowDetail=AudioLowDetail
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioDefaultDriver'
    begin object name="AudioDefaultDriver" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="??? ????"
        OnCreateComponent=AudioDefaultDriver.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="???? ??? ???? OpenAL ????? ?????. "
        WinTop=0.3203650
        WinLeft=0.0181640
        WinWidth=0.4500000
        TabOrder=3
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_Default=AudioDefaultDriver
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.AudioEnableTTS'
    begin object name="AudioEnableTTS" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="?? ??? ?? ??"
        OnCreateComponent=AudioEnableTTS.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="?? ??? ?? ?? ??? ?????."
        WinTop=0.6850370
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=15
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_TTS=AudioEnableTTS
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.EnableVoiceChat'
    begin object name="EnableVoiceChat" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="??? ??"
        OnCreateComponent=EnableVoiceChat.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ? ??? ?? ??."
        WinTop=0.8347770
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=18
        OnChange=UT2K4Tab_AudioSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_AudioSettings.InternalOnLoadINI
    end object
    ch_VoiceChat=EnableVoiceChat
    // Reference: moButton'GUI2K4_Decompressed.UT2K4Tab_AudioSettings.VoiceOptions'
    begin object name="VoiceOptions" class=XInterface.moButton
        ButtonCaption="??"
        MenuTitle="??? ?? ??"
        MenuClass="GUI2K4.VoiceChatConfig"
        CaptionWidth=0.5000000
        Caption="??? ??"
        OnCreateComponent=VoiceOptions.InternalOnCreateComponent
        WinTop=0.9090650
        WinLeft=0.5277340
        WinWidth=0.4611340
        WinHeight=0.0500000
        TabOrder=19
    end object
    b_VoiceChat=VoiceOptions
    PanelCaption="???"
    WinTop=0.1500000
    WinHeight=0.7400000
}