/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_AudioSettings.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:51
 *	Functions:8
 *
 *******************************************************************************/
class UT2K4Tab_AudioSettings extends Settings_Tabs
    dependson(Settings_Tabs)
    dependson(UT2K4IRC_Page)
    dependson(UT2k4MainMenu)
    editinlinenew
    instanced;

var array<AnnouncerRecord> Announcers;
var string StatusPreviewSound;
var string RewardPreviewSound;
var localized string AudioModes[4];
var localized string VoiceModes[4];
var localized string AnnounceModes[3];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_MusicVol;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_EffectsVol;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_VoiceVol;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_TTS;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Mode;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Voices;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Announce;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_RewardAnnouncer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_StatusAnnouncer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_ReverseStereo;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_MessageBeep;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AutoTaunt;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_TTSIRC;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_OnlyTeamTTS;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_MatureTaunts;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_LowDetail;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Default;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_TTS;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_VoiceChat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moButton b_VoiceChat;
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
    // End:0x6d
    if(bIsWin32)
    {
        i = 0;
        J0x3a:
        // End:0x6a [While If]
        if(i < 4)
        {
            co_Mode.AddItem(AudioModes[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3a;
        }
    }
    // End:0x84
    else
    {
        co_Mode.AddItem("OpenAL");
    }
    i = 0;
    J0x8b:
    // End:0xbb [While If]
    if(i < 4)
    {
        co_Voices.AddItem(VoiceModes[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8b;
    }
    i = 0;
    J0xc2:
    // End:0xf2 [While If]
    if(i < 3)
    {
        co_Announce.AddItem(AnnounceModes[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc2;
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
    class'CacheManager'.static.GetAnnouncerList(Announcers);
    i = 0;
    J0x326:
    // End:0x3a5 [While If]
    if(i < Announcers.Length)
    {
        // End:0x39b
        if(Announcers[i].FriendlyName != "")
        {
            co_StatusAnnouncer.AddItem(Announcers[i].FriendlyName,, string(i));
            co_RewardAnnouncer.AddItem(Announcers[i].FriendlyName,, string(i));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x326;
    }
    // End:0x3bf
    if(!PlatformIsWindows())
    {
        ch_Default.DisableMe();
    }
}

function ResetClicked()
{
    local class<AudioSubsystem> A;
    local Class UnrealPlayerClass;
    local PlayerController PC;
    local int i;

    super.ResetClicked();
    PC = PlayerOwner();
    A = class<AudioSubsystem>(DynamicLoadObject(GetNativeClassName("Engine.Engine.AudioDevice"), class'Class'));
    A.static.ResetConfig();
    class'HUD'.static.ResetConfig("bMessageBeep");
    class'LevelInfo'.static.ResetConfig("bLowSoundDetail");
    class'PlayerController'.static.ResetConfig("bAutoTaunt");
    class'PlayerController'.static.ResetConfig("bNoMatureLanguage");
    class'PlayerController'.static.ResetConfig("bNoAutoTaunts");
    class'PlayerController'.static.ResetConfig("bNoVoiceTaunts");
    class'PlayerController'.static.ResetConfig("bNoVoiceMessages");
    class'PlayerController'.static.ResetConfig("AnnouncerLevel");
    class'PlayerController'.static.ResetConfig("bNoTextToSpeechVoiceMessages");
    class'PlayerController'.static.ResetConfig("bOnlySpeakTeamText");
    class'UT2K4IRC_Page'.static.ResetConfig("bIRCTextToSpeechEnabled");
    UnrealPlayerClass = class<Object>(DynamicLoadObject("UnrealGame.UnrealPlayer", class'Class'));
    // End:0x252
    if(UnrealPlayerClass != none)
    {
        UnrealPlayerClass.static.ResetConfig("CustomRewardAnnouncerPack");
        UnrealPlayerClass.static.ResetConfig("CustomStatusAnnouncerPack");
    }
    i = 0;
    J0x259:
    // End:0x289 [While If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x259;
    }
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
            iVoice = PC.AnnouncerVolume;
            sl_VoiceVol.SetComponentValue(string(iVoice), true);
            // End:0x8de
            break;
        // End:0xb0
        case sl_MusicVol:
            fMusic = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice MusicVolume"));
            sl_MusicVol.SetComponentValue(string(fMusic), true);
            // End:0x8de
            break;
        // End:0x118
        case sl_EffectsVol:
            fEffects = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice SoundVolume"));
            sl_EffectsVol.SetComponentValue(string(fEffects), true);
            // End:0x8de
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
            // End:0x25e
            else
            {
                // End:0x1be
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
                // End:0x25e
                if(bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseEAX")))
                {
                    bEAX = true;
                    iMode = 3;
                }
            }
            co_Mode.SilentSetIndex(iMode);
            // End:0x8de
            break;
        // End:0x2e1
        case ch_ReverseStereo:
            bRev = bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice ReverseStereo"));
            ch_ReverseStereo.SetComponentValue(string(bRev), true);
            // End:0x8de
            break;
        // End:0x350
        case ch_Default:
            bDefault = bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseDefaultDriver"));
            ch_Default.SetComponentValue(string(bDefault), true);
            // End:0x8de
            break;
        // End:0x3bc
        case co_Voices:
            // End:0x371
            if(PC.bNoAutoTaunts)
            {
                iVoiceMode = 1;
            }
            // End:0x38b
            if(PC.bNoVoiceTaunts)
            {
                iVoiceMode = 2;
            }
            // End:0x3a5
            if(PC.bNoVoiceMessages)
            {
                iVoiceMode = 3;
            }
            co_Voices.SilentSetIndex(iVoiceMode);
            // End:0x8de
            break;
        // End:0x3f5
        case ch_MessageBeep:
            bBeep = class'HUD'.default.bMessageBeep;
            ch_MessageBeep.SetComponentValue(string(bBeep), true);
            // End:0x8de
            break;
        // End:0x42e
        case ch_AutoTaunt:
            bAuto = PC.bAutoTaunt;
            ch_AutoTaunt.SetComponentValue(string(bAuto), true);
            // End:0x8de
            break;
        // End:0x469
        case ch_TTS:
            bTTS = !PC.bNoTextToSpeechVoiceMessages;
            ch_TTS.SetComponentValue(string(bTTS), true);
            // End:0x8de
            break;
        // End:0x4a2
        case ch_OnlyTeamTTS:
            bOnlyTeamTTS = PC.bOnlySpeakTeamText;
            ch_OnlyTeamTTS.SetComponentValue(string(bOnlyTeamTTS), true);
            // End:0x8de
            break;
        // End:0x4dd
        case ch_MatureTaunts:
            bMature = !PC.bNoMatureLanguage;
            ch_MatureTaunts.SetComponentValue(string(bMature), true);
            // End:0x8de
            break;
        // End:0x665
        case ch_LowDetail:
            bLow = PC.Level.bLowSoundDetail;
            // End:0x64a
            if(bLow != bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice LowQualitySound")))
            {
                PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice LowQualitySound" @ string(bLow));
                PC.ConsoleCommand("SOUND_REBOOT");
                // End:0x62b
                if(PC.Level.Song != "" && PC.Level.Song != "None")
                {
                    PC.ClientSetMusic(PC.Level.Song, 1);
                }
                // End:0x64a
                else
                {
                    PC.ClientSetMusic(class'UT2k4MainMenu'.default.MenuSong, 1);
                }
            }
            ch_LowDetail.SetComponentValue(string(bLow), true);
            // End:0x8de
            break;
        // End:0x69a
        case co_Announce:
            iAnnounce = PC.AnnouncerLevel;
            co_Announce.SilentSetIndex(iAnnounce);
            // End:0x8de
            break;
        // End:0x7de
        case co_RewardAnnouncer:
            // End:0x6e3
            if(PC.IsA('UnrealPlayer'))
            {
                sStatAnnouncer = PC.GetCustomStatusAnnouncerClass();
                sRewAnnouncer = PC.GetCustomRewardAnnouncerClass();
            }
            // End:0x70b
            else
            {
                sStatAnnouncer = class'UnrealPlayer'.default.CustomStatusAnnouncerPack;
                sRewAnnouncer = class'UnrealPlayer'.default.CustomRewardAnnouncerPack;
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
            // End:0x7db
            if(i != -1)
            {
                i = co_RewardAnnouncer.FindIndex(Announcers[i].FriendlyName);
                // End:0x7db
                if(i != -1)
                {
                    co_RewardAnnouncer.SilentSetIndex(i);
                }
            }
            // End:0x8de
            break;
        // End:0x817
        case ch_TTSIRC:
            bTTSIRC = class'UT2K4IRC_Page'.default.bIRCTextToSpeechEnabled;
            ch_TTSIRC.SetComponentValue(string(bTTSIRC), true);
            // End:0x8de
            break;
        // End:0x87d
        case ch_VoiceChat:
            bVoiceChat = bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP"));
            ch_VoiceChat.SetComponentValue(string(bVoiceChat), true);
            // End:0x8de
            break;
        // End:0xffff
        default:
            Log(string(Name) @ "Unknown component calling LoadINI:" $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
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
        // End:0x19d
        case sl_VoiceVol:
            iVoice = int(sl_VoiceVol.GetValue());
            AnnouncerVol = 2.0 * FClamp(0.10 + float(iVoice) * 0.2250, 0.20, 1.0);
            // End:0x8f
            if(co_StatusAnnouncer == none)
            {
                return;
            }
            snd = Sound(co_StatusAnnouncer.GetObject());
            // End:0x177
            if(snd == none && Announcers.Length > 0)
            {
                snd = Sound(DynamicLoadObject(Announcers[AnnouncerIdx].PackageName $ "." $ StatusPreviewSound, class'Sound'));
                // End:0x131
                if(snd == none)
                {
                    snd = Sound(DynamicLoadObject(Announcers[AnnouncerIdx].FallbackPackage $ "." $ StatusPreviewSound, class'Sound'));
                }
                co_StatusAnnouncer.MyComboBox.List.SetObjectAtIndex(co_StatusAnnouncer.MyComboBox.List.Index, snd);
            }
            // End:0x19a
            if(snd != none)
            {
                PC.PlaySound(snd, 5, AnnouncerVol);
            }
            // End:0xa7b
            break;
        // End:0x22e
        case sl_MusicVol:
            fMusic = sl_MusicVol.GetValue();
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice MusicVolume" @ string(fMusic));
            PC.ConsoleCommand("SetMusicVolume" @ string(fMusic));
            // End:0xa7b
            break;
        // End:0x2b2
        case sl_EffectsVol:
            fEffects = sl_EffectsVol.GetValue();
            PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume" @ string(fEffects));
            PC.ConsoleCommand("stopsounds");
            // End:0xa7b
            break;
        // End:0x4a4
        case co_Mode:
            // End:0x2c8
            if(!bIsWin32)
            {
            }
            // End:0xa7b
            else
            {
                iMode = co_Mode.GetIndex();
                // End:0x2ee
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
                // End:0x482
                if(PC.Level.Song != "" && PC.Level.Song != "None")
                {
                    PC.ClientSetMusic(PC.Level.Song, 1);
                }
                // End:0x4a1
                else
                {
                    PC.ClientSetMusic(class'UT2k4MainMenu'.default.MenuSong, 1);
                }
                // This is an implied JumpToken;
                goto J0xa7b;
        // End:0x4c5
        case ch_ReverseStereo:
        bRev = ch_ReverseStereo.IsChecked();
        // End:0xa7b
        break;
    // End:0x4e6
    case ch_MessageBeep:
        bBeep = ch_MessageBeep.IsChecked();
        // End:0xa7b
        break;
    // End:0x507
    case ch_AutoTaunt:
        bAuto = ch_AutoTaunt.IsChecked();
        // End:0xa7b
        break;
    // End:0x528
    case ch_TTS:
        bTTS = ch_TTS.IsChecked();
        // End:0xa7b
        break;
    // End:0x549
    case ch_MatureTaunts:
        bMature = ch_MatureTaunts.IsChecked();
        // End:0xa7b
        break;
    // End:0x569
    case co_Voices:
        iVoiceMode = co_Voices.GetIndex();
        // End:0xa7b
        break;
    // End:0x5f6
    case ch_Default:
        bDefault = ch_Default.IsChecked();
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice UseDefaultDriver" @ string(bDefault));
        PC.ConsoleCommand("SOUND_REBOOT");
        // End:0xa7b
        break;
    // End:0x745
    case ch_LowDetail:
        bLow = ch_LowDetail.IsChecked();
        PC.Level.bLowSoundDetail = bLow;
        PC.Level.StaticSaveConfig();
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice LowQualitySound" @ string(bLow));
        PC.ConsoleCommand("SOUND_REBOOT");
        // End:0x723
        if(PC.Level.Song != "" && PC.Level.Song != "None")
        {
            PC.ClientSetMusic(PC.Level.Song, 1);
        }
        // End:0x742
        else
        {
            PC.ClientSetMusic(class'UT2k4MainMenu'.default.MenuSong, 1);
        }
        // End:0xa7b
        break;
    // End:0x765
    case co_Announce:
        iAnnounce = co_Announce.GetIndex();
        // End:0xa7b
        break;
    // End:0x8bd
    case co_RewardAnnouncer:
        AnnouncerIdx = int(co_RewardAnnouncer.GetExtra());
        sRewAnnouncer = Announcers[AnnouncerIdx].ClassName;
        AnnouncerVol = 2.0 * FClamp(0.10 + float(iVoice) * 0.2250, 0.20, 1.0);
        snd = Sound(co_RewardAnnouncer.GetObject());
        // End:0x8a2
        if(snd == none)
        {
            snd = Sound(DynamicLoadObject(Announcers[AnnouncerIdx].PackageName $ "." $ RewardPreviewSound, class'Sound'));
            // End:0x85c
            if(snd == none)
            {
                snd = Sound(DynamicLoadObject(Announcers[AnnouncerIdx].FallbackPackage $ "." $ RewardPreviewSound, class'Sound'));
            }
            co_RewardAnnouncer.MyComboBox.List.SetObjectAtIndex(co_RewardAnnouncer.MyComboBox.List.Index, snd);
        }
        PC.PlaySound(snd, 5, AnnouncerVol);
        // End:0xa7b
        break;
    // End:0xa15
    case co_StatusAnnouncer:
        AnnouncerIdx = int(co_StatusAnnouncer.GetExtra());
        sStatAnnouncer = Announcers[AnnouncerIdx].ClassName;
        AnnouncerVol = 2.0 * FClamp(0.10 + float(iVoice) * 0.2250, 0.20, 1.0);
        snd = Sound(co_StatusAnnouncer.GetObject());
        // End:0x9fa
        if(snd == none)
        {
            snd = Sound(DynamicLoadObject(Announcers[AnnouncerIdx].PackageName $ "." $ StatusPreviewSound, class'Sound'));
            // End:0x9b4
            if(snd == none)
            {
                snd = Sound(DynamicLoadObject(Announcers[AnnouncerIdx].FallbackPackage $ "." $ StatusPreviewSound, class'Sound'));
            }
            co_StatusAnnouncer.MyComboBox.List.SetObjectAtIndex(co_StatusAnnouncer.MyComboBox.List.Index, snd);
        }
        PC.PlaySound(snd, 5, AnnouncerVol);
        // End:0xa7b
        break;
    // End:0xa36
    case ch_TTSIRC:
        bTTSIRC = ch_TTSIRC.IsChecked();
        // End:0xa7b
        break;
    // End:0xa57
    case ch_VoiceChat:
        bVoiceChat = ch_VoiceChat.IsChecked();
        // End:0xa7b
        break;
    // End:0xa78
    case ch_OnlyTeamTTS:
        bOnlyTeamTTS = ch_OnlyTeamTTS.IsChecked();
        // End:0xa7b
        break;
    // End:0xffff
    default:
    }
}

function SaveSettings()
{
    local PlayerController PC;
    local bool bSave, bReboot;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0x64
    if(PC.AnnouncerLevel != iAnnounce)
    {
        PC.AnnouncerLevel = byte(iAnnounce);
        PC.default.AnnouncerLevel = PC.AnnouncerLevel;
        bSave = true;
    }
    // End:0xb2
    if(PC.AnnouncerVolume != iVoice)
    {
        PC.AnnouncerVolume = byte(iVoice);
        PC.default.AnnouncerVolume = byte(iVoice);
        bSave = true;
    }
    // End:0xea
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
    if(class'UT2K4IRC_Page'.default.bIRCTextToSpeechEnabled != bTTSIRC)
    {
        class'UT2K4IRC_Page'.default.bIRCTextToSpeechEnabled = bTTSIRC;
        class'UT2K4IRC_Page'.static.StaticSaveConfig();
    }
    // End:0x1b5
    if(PC.bNoMatureLanguage == bMature)
    {
        PC.bNoMatureLanguage = !bMature;
        PC.default.bNoMatureLanguage = !bMature;
        bSave = true;
    }
    // End:0x210
    if(PC.bNoAutoTaunts != iVoiceMode > 0)
    {
        PC.bNoAutoTaunts = iVoiceMode > 0;
        PC.default.bNoAutoTaunts = PC.bNoAutoTaunts;
        bSave = true;
    }
    // End:0x26b
    if(PC.bNoVoiceTaunts != iVoiceMode > 1)
    {
        PC.bNoVoiceTaunts = iVoiceMode > 1;
        PC.default.bNoVoiceTaunts = PC.bNoVoiceTaunts;
        bSave = true;
    }
    // End:0x2c8
    if(PC.bNoVoiceMessages != iVoiceMode == 3)
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
    // End:0x38a
    if(fEffects != sl_EffectsVol.GetValue())
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume" @ string(fEffects));
    }
    // End:0x422
    if(bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice ReverseStereo")) != bRev)
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice ReverseStereo" @ string(bRev));
    }
    // End:0x4c8
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
    // End:0x575
    else
    {
        // End:0x575
        if(class'HUD'.default.bMessageBeep != bBeep)
        {
            class'HUD'.default.bMessageBeep = bBeep;
            class'HUD'.static.StaticSaveConfig();
        }
    }
    // End:0x612
    if(!PC.Level.IsDemoBuild() && PC.IsA('UnrealPlayer'))
    {
        // End:0x5dd
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
    // End:0x68b
    if(bVoiceChat != bool(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice UseVoIP")))
    {
        // End:0x674
        if(bVoiceChat)
        {
            PC.EnableVoiceChat();
        }
        // End:0x683
        else
        {
            PC.DisableVoiceChat();
        }
        bReboot = false;
    }
    // End:0x6a0
    if(bSave)
    {
        PC.SaveConfig();
    }
    // End:0x6cf
    if(PC.bAutoTaunt != bAuto)
    {
        PC.SetAutoTaunt(bAuto);
    }
    // End:0x771
    if(!PC.Level.IsDemoBuild() && !PC.IsA('UnrealPlayer'))
    {
        // End:0x771
        if(!class'UnrealPlayer'.default.CustomStatusAnnouncerPack ~= sStatAnnouncer || !class'UnrealPlayer'.default.CustomRewardAnnouncerPack ~= sRewAnnouncer)
        {
            class'UnrealPlayer'.default.CustomStatusAnnouncerPack = sStatAnnouncer;
            class'UnrealPlayer'.default.CustomRewardAnnouncerPack = sRewAnnouncer;
            class'UnrealPlayer'.static.StaticSaveConfig();
        }
    }
    // End:0x798
    if(bReboot)
    {
        PC.ConsoleCommand("SOUND_REBOOT");
    }
}

function int FindAnnouncerClassIndex(string AnnouncerClass)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < Announcers.Length)
    {
        // End:0x37
        if(Announcers[i].ClassName ~= AnnouncerClass)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function string GetAnnouncerClass(int Index)
{
    // End:0x20
    if(Index < 0 || Index >= Announcers.Length)
    {
        return "";
    }
    return Announcers[Index].ClassName;
}

function string GetAnnouncerPackage(int Index)
{
    // End:0x20
    if(Index < 0 || Index >= Announcers.Length)
    {
        return "";
    }
    return Announcers[Index].PackageName;
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
    begin object name=AudioBK1 class=GUISectionBackground
        Caption="?? ??"
        NumColumns=2
        MaxPerColumn=5
        WinTop=0.0173930
        WinLeft=0.0040630
        WinWidth=0.9877730
        WinHeight=0.502850
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_AudioSettings.AudioBK1'
    i_BG1=AudioBK1
    begin object name=AudioBK2 class=GUISectionBackground
        Caption="????"
        WinTop=0.0043720
        WinLeft=0.0040630
        WinWidth=0.9877730
        WinHeight=0.5174980
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_AudioSettings.AudioBK2'
    i_BG2=AudioBK2
    begin object name=AudioBK3 class=GUISectionBackground
        Caption="?? ??? ?? ??"
        WinTop=0.0043720
        WinLeft=0.0040630
        WinWidth=0.9877730
        WinHeight=0.5174980
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_AudioSettings.AudioBK3'
    i_BG3=AudioBK3
    begin object name=AudioMusicVolume class=moSlider
        MaxValue=1.0
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.5"
        Hint="?? ??? ??? ?????."
        WinTop=0.0705220
        WinLeft=0.0181640
        WinWidth=0.450
        TabOrder=0
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_AudioSettings.AudioMusicVolume'
    sl_MusicVol=AudioMusicVolume
    begin object name=AudioEffectsVolumeSlider class=moSlider
        MaxValue=1.0
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="0.9"
        Hint="?? ? ?? ?? ??? ?????."
        WinTop=0.0705220
        WinLeft=0.5240240
        WinWidth=0.450
        TabOrder=5
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_AudioSettings.AudioEffectsVolumeSlider'
    sl_EffectsVol=AudioEffectsVolumeSlider
    begin object name=AudioAnnouncerVolume class=moSlider
        MaxValue=4.0
        MinValue=1.0
        bIntSlider=true
        CaptionWidth=0.650
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ? ?? ??? ???? ??? ?????."
        WinTop=0.5978660
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=10
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'UT2K4Tab_AudioSettings.AudioAnnouncerVolume'
    sl_VoiceVol=AudioAnnouncerVolume
    begin object name=AudioMode class=moComboBox
        bReadOnly=true
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Software 3D Audio"
        Hint="??? ??? ??? ?????."
        WinTop=0.1497390
        WinLeft=0.0181640
        WinWidth=0.450
        TabOrder=1
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_AudioSettings.AudioMode'
    co_Mode=AudioMode
    begin object name=AudioPlayVoices class=moComboBox
        bReadOnly=true
        Caption="??? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="All"
        Hint="???? ??? ??? ??? ??? ?????."
        WinTop=0.1497390
        WinLeft=0.5240240
        WinWidth=0.450
        TabOrder=6
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_AudioSettings.AudioPlayVoices'
    co_Voices=AudioPlayVoices
    begin object name=AudioAnnounce class=moComboBox
        bReadOnly=true
        CaptionWidth=0.650
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="All"
        Hint="?? ? ?? ??? ?? ?????."
        WinTop=0.7110790
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=11
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_AudioSettings.AudioAnnounce'
    co_Announce=AudioAnnounce
    begin object name=AudioRewardAnnouncer class=moComboBox
        bReadOnly=true
        CaptionWidth=0.650
        Caption="?? ??? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ????? ???? ? ?? ?????? ?? ??? ?? ? ????."
        WinTop=0.8909910
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=13
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_AudioSettings.AudioRewardAnnouncer'
    co_RewardAnnouncer=AudioRewardAnnouncer
    begin object name=AudioStatusAnnouncer class=moComboBox
        bReadOnly=true
        CaptionWidth=0.650
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ??? ??? ?????? ?????? ?????."
        WinTop=0.8010350
        WinLeft=0.0113290
        WinWidth=0.4707030
        TabOrder=12
        OnChange=InternalOnChange
    object end
    // Reference: moComboBox'UT2K4Tab_AudioSettings.AudioStatusAnnouncer'
    co_StatusAnnouncer=AudioStatusAnnouncer
    begin object name=AudioReverseStereo class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="??? ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="???? ??? ??? ??? ?????."
        WinTop=0.4056780
        WinLeft=0.0181640
        WinWidth=0.450
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.AudioReverseStereo'
    ch_ReverseStereo=AudioReverseStereo
    begin object name=AudioMessageBeep class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="??? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ??????? ?? ???? ?? ?? ???? ??? ???."
        WinTop=0.4056780
        WinLeft=0.5240240
        WinWidth=0.450
        TabOrder=9
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.AudioMessageBeep'
    ch_MessageBeep=AudioMessageBeep
    begin object name=AudioAutoTaunt class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?? ? ???? ?? ?? ?? ?? ??."
        WinTop=0.3203650
        WinLeft=0.5240240
        WinWidth=0.450
        TabOrder=8
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.AudioAutoTaunt'
    ch_AutoTaunt=AudioAutoTaunt
    begin object name=IRCTextToSpeech class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="IRC ?? ??? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="IRC ????? ??? ?? ??? ?? ?? ??? ?? (??? ?????? ???? ?????)"
        WinTop=0.7554620
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=16
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.IRCTextToSpeech'
    ch_TTSIRC=IRCTextToSpeech
    begin object name=OnlyTeamTTSCheck class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="? ???? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ? ??, ? ?? ??? ?? ??? ???? ???? ?????. ??? ??? ????? ??."
        WinTop=0.7554620
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=17
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.OnlyTeamTTSCheck'
    ch_OnlyTeamTTS=OnlyTeamTTSCheck
    begin object name=AudioMatureTaunts class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="?????? ?????? ? ??? ???? ?????."
        WinTop=0.2350520
        WinLeft=0.5240240
        WinWidth=0.450
        TabOrder=7
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.AudioMatureTaunts'
    ch_MatureTaunts=AudioMatureTaunts
    begin object name=AudioLowDetail class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="??? ???? ????."
        WinTop=0.2350520
        WinLeft=0.0181640
        WinWidth=0.450
        TabOrder=2
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.AudioLowDetail'
    ch_LowDetail=AudioLowDetail
    begin object name=AudioDefaultDriver class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="??? ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="???? ??? ???? OpenAL ????? ?????. "
        WinTop=0.3203650
        WinLeft=0.0181640
        WinWidth=0.450
        TabOrder=3
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.AudioDefaultDriver'
    ch_Default=AudioDefaultDriver
    begin object name=AudioEnableTTS class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="?? ??? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="?? ??? ?? ?? ??? ?????."
        WinTop=0.6850370
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=15
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.AudioEnableTTS'
    ch_TTS=AudioEnableTTS
    begin object name=EnableVoiceChat class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ? ??? ?? ??."
        WinTop=0.8347770
        WinLeft=0.5277340
        WinWidth=0.4611340
        TabOrder=18
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_AudioSettings.EnableVoiceChat'
    ch_VoiceChat=EnableVoiceChat
    begin object name=VoiceOptions class=moButton
        ButtonCaption="??"
        MenuTitle="??? ?? ??"
        MenuClass="GUI2K4.VoiceChatConfig"
        CaptionWidth=0.50
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        WinTop=0.9090650
        WinLeft=0.5277340
        WinWidth=0.4611340
        WinHeight=0.050
        TabOrder=19
    object end
    // Reference: moButton'UT2K4Tab_AudioSettings.VoiceOptions'
    b_VoiceChat=VoiceOptions
    PanelCaption="???"
    WinTop=0.150
    WinHeight=0.740
}