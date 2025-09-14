/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Tab_AudioSettings.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:4
 *
 *******************************************************************************/
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
    J0x1f:
    // End:0x53 [While If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    i = 0;
    J0x5a:
    // End:0x92 [While If]
    if(i < 4)
    {
        moComboBox(Controls[8]).AddItem(AudioModes[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    i = 0;
    J0x99:
    // End:0xd1 [While If]
    if(i < 4)
    {
        moComboBox(Controls[14]).AddItem(VoiceModes[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x99;
    }
    i = 0;
    J0xd8:
    // End:0x110 [While If]
    if(i < 3)
    {
        moComboBox(Controls[15]).AddItem(AnnounceModes[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd8;
    }
    Controls[3].FriendlyLabel = GUILabel(Controls[2]);
    Controls[5].FriendlyLabel = GUILabel(Controls[4]);
    APack = moComboBox(Controls[16]);
    DefPack = class'UnrealPlayer'.default.CustomizedAnnouncerPack;
    i = 0;
    J0x17c:
    // End:0x212 [While If]
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17c;
    }
    i = 0;
    J0x219:
    // End:0x29c [While If]
    if(i < PackInfo.Length)
    {
        APack.AddItem(PackInfo[i].Description, none, PackInfo[i].PackageName);
        // End:0x292
        if(PackInfo[i].PackageName ~= DefPack)
        {
            APack.SetText(PackInfo[i].Description);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x219;
    }
    bInitialized = true;
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local bool b1, b2, b3;

    // End:0x3a
    if(Sender == Controls[7])
    {
        GUISlider(Controls[7]).SetValue(float(PlayerOwner().AnnouncerVolume));
    }
    // End:0x575
    else
    {
        // End:0x1bc
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
            // End:0x1b9
            else
            {
                // End:0x171
                if(b1)
                {
                    moComboBox(Controls[8]).SetText(AudioModes[2]);
                }
                // End:0x1b9
                else
                {
                    // End:0x19b
                    if(b3)
                    {
                        moComboBox(Controls[8]).SetText(AudioModes[1]);
                    }
                    // End:0x1b9
                    else
                    {
                        moComboBox(Controls[8]).SetText(AudioModes[0]);
                    }
                }
            }
        }
        // End:0x575
        else
        {
            // End:0x1ec
            if(Sender == Controls[9])
            {
                moCheckBox(Sender).Checked(bool(S));
            }
            // End:0x575
            else
            {
                // End:0x32c
                if(Sender == Controls[14])
                {
                    // End:0x259
                    if(!PlayerOwner().bNoVoiceMessages && !PlayerOwner().bNoVoiceTaunts && !PlayerOwner().bNoAutoTaunts)
                    {
                        moComboBox(Controls[14]).SetText(VoiceModes[0]);
                    }
                    // End:0x329
                    else
                    {
                        // End:0x2b2
                        if(!PlayerOwner().bNoVoiceMessages && !PlayerOwner().bNoVoiceTaunts && PlayerOwner().bNoAutoTaunts)
                        {
                            moComboBox(Controls[14]).SetText(VoiceModes[1]);
                        }
                        // End:0x329
                        else
                        {
                            // End:0x30a
                            if(!PlayerOwner().bNoVoiceMessages && PlayerOwner().bNoVoiceTaunts && PlayerOwner().bNoAutoTaunts)
                            {
                                moComboBox(Controls[14]).SetText(VoiceModes[2]);
                            }
                            // End:0x329
                            else
                            {
                                moComboBox(Controls[14]).SetText(VoiceModes[3]);
                            }
                        }
                    }
                }
                // End:0x575
                else
                {
                    // End:0x364
                    if(Sender == Controls[10])
                    {
                        moCheckBox(Sender).Checked(class'HUD'.default.bMessageBeep);
                    }
                    // End:0x575
                    else
                    {
                        // End:0x39a
                        if(Sender == Controls[11])
                        {
                            moCheckBox(Sender).Checked(PlayerOwner().bAutoTaunt);
                        }
                        // End:0x575
                        else
                        {
                            // End:0x3d2
                            if(Sender == Controls[12])
                            {
                                moCheckBox(Sender).Checked(!PlayerOwner().bNoMatureLanguage);
                            }
                            // End:0x575
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
                                        if(PlayerOwner().Level.Song != "" && PlayerOwner().Level.Song != "None")
                                        {
                                            PlayerOwner().ClientSetMusic(PlayerOwner().Level.Song, 1);
                                        }
                                    }
                                    moCheckBox(Sender).Checked(b1);
                                }
                                // End:0x575
                                else
                                {
                                    // End:0x575
                                    if(Sender == Controls[15])
                                    {
                                        moComboBox(Sender).SetIndex(PlayerOwner().AnnouncerLevel);
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
    // End:0xa03
    else
    {
        // End:0x104
        if(Sender == Controls[5])
        {
            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice SoundVolume " $ string(GUISlider(Sender).Value));
            PlayerOwner().ConsoleCommand("stopsounds");
        }
        // End:0xa03
        else
        {
            // End:0x15d
            if(Sender == Controls[7])
            {
                PlayerOwner().AnnouncerVolume = byte(GUISlider(Controls[7]).Value);
                PlayerOwner().SaveConfig();
                PlayerOwner().PlayRewardAnnouncement('Adrenalin', 0, true);
            }
            // End:0xa03
            else
            {
                // End:0x5cd
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
                    // End:0x54c
                    else
                    {
                        // End:0x343
                        if(t == AudioModes[0])
                        {
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice UseEAX false");
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice Use3DSound false");
                            PlayerOwner().ConsoleCommand("set ini:Engine.Engine.AudioDevice CompatibilityMode false");
                        }
                        // End:0x54c
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
                            // End:0x54c
                            else
                            {
                                // End:0x54c
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
                    // End:0x5ca
                    if(PlayerOwner().Level.Song != "" && PlayerOwner().Level.Song != "None")
                    {
                        PlayerOwner().ClientSetMusic(PlayerOwner().Level.Song, 1);
                    }
                }
                // End:0xa03
                else
                {
                    // End:0x61d
                    if(Sender == Controls[9])
                    {
                        PlayerOwner().ConsoleCommand("set" @ Sender.IniOption @ string(moCheckBox(Sender).IsChecked()));
                    }
                    // End:0xa03
                    else
                    {
                        // End:0x6a2
                        if(Sender == Controls[10])
                        {
                            // End:0x66c
                            if(PlayerOwner().myHUD != none)
                            {
                                PlayerOwner().myHUD.bMessageBeep = moCheckBox(Sender).IsChecked();
                            }
                            class'HUD'.default.bMessageBeep = moCheckBox(Sender).IsChecked();
                            class'HUD'.static.StaticSaveConfig();
                        }
                        // End:0xa03
                        else
                        {
                            // End:0x6d8
                            if(Sender == Controls[11])
                            {
                                PlayerOwner().SetAutoTaunt(moCheckBox(Sender).IsChecked());
                            }
                            // End:0xa03
                            else
                            {
                                // End:0x71b
                                if(Sender == Controls[12])
                                {
                                    PlayerOwner().bNoMatureLanguage = !moCheckBox(Sender).IsChecked();
                                    PlayerOwner().SaveConfig();
                                }
                                // End:0xa03
                                else
                                {
                                    // End:0x82d
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
                                        // End:0x7e4
                                        else
                                        {
                                            // End:0x79f
                                            if(t == VoiceModes[1])
                                            {
                                                b1 = true;
                                                b2 = false;
                                                b3 = false;
                                            }
                                            // End:0x7e4
                                            else
                                            {
                                                // End:0x7cc
                                                if(t == VoiceModes[2])
                                                {
                                                    b1 = true;
                                                    b2 = true;
                                                    b3 = false;
                                                }
                                                // End:0x7e4
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
                                    // End:0xa03
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
                                            if(PlayerOwner().Level.Song != "" && PlayerOwner().Level.Song != "None")
                                            {
                                                PlayerOwner().ClientSetMusic(PlayerOwner().Level.Song, 1);
                                            }
                                        }
                                        // End:0xa03
                                        else
                                        {
                                            // End:0x998
                                            if(Sender == Controls[15])
                                            {
                                                PlayerOwner().AnnouncerLevel = byte(moComboBox(Sender).GetIndex());
                                                PlayerOwner().SaveConfig();
                                            }
                                            // End:0xa03
                                            else
                                            {
                                                // End:0xa03
                                                if(Sender == APack)
                                                {
                                                    class'UnrealPlayer'.default.CustomizedAnnouncerPack = APack.GetExtra();
                                                    class'UnrealPlayer'.static.StaticSaveConfig();
                                                    // End:0xa03
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
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.150
    WinHeight=0.740
}