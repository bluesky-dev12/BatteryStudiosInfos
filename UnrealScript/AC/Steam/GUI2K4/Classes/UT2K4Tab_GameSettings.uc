/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_GameSettings.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:42
 *	Functions:10
 *
 *******************************************************************************/
class UT2K4Tab_GameSettings extends Settings_Tabs
    dependson(Settings_Tabs)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG3;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG4;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG5;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_WeaponBob;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AutoSwitch;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Speech;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Dodging;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AutoAim;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_ClassicTrans;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_LandShake;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_GoreLevel;
var export editinline GUIComponent LastGameOption;
var bool bBob;
var bool bDodge;
var bool bAim;
var bool bAuto;
var bool bClassicTrans;
var bool bLandShake;
var bool bLandShakeD;
var bool bSpeechRec;
var int iGore;
var localized string NetSpeedText[4];
var localized string StatsURL;
var localized string EpicIDMsg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Warning;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_ID;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Stats;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_TrackStats;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_DynNetspeed;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Precache;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Netspeed;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Name;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Password;
var int iNetspeed;
var int iNetSpeedD;
var string sPassword;
var string sName;
var bool bStats;
var bool bDynNet;
var bool bPrecache;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    // End:0x30
    if(class'GameInfo'.default.bAlternateMode)
    {
        RemoveComponent(co_GoreLevel);
    }
    // End:0x70
    else
    {
        i = 0;
        J0x37:
        // End:0x70 [While If]
        if(i < 3)
        {
            co_GoreLevel.AddItem(class'GameInfo'.default.GoreLevelText[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x37;
        }
    }
    LastGameOption = ch_LandShake;
    i = 0;
    J0x82:
    // End:0xb2 [While If]
    if(i < 4)
    {
        co_Netspeed.AddItem(NetSpeedText[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x82;
    }
    ed_Name.MyEditBox.bConvertSpaces = true;
    ed_Name.MyEditBox.MaxWidth = 14;
    ed_Password.MyEditBox.MaxWidth = 14;
    ed_Password.MaskText(true);
    l_ID.Caption = FormatID(PlayerOwner().GetPlayerIDHash());
}

function string FormatID(string id)
{
    id = Caps(id);
    return Mid(id, 0, 8) $ "-" $ Mid(id, 8, 8) $ "-" $ Mid(id, 16, 8) $ "-" $ Mid(id, 24, 8);
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0xd5
    if(bShow)
    {
        // End:0xcf
        if(bInit)
        {
            i_BG1.ManageComponent(ch_WeaponBob);
            i_BG1.ManageComponent(ch_AutoSwitch);
            i_BG1.ManageComponent(ch_Dodging);
            i_BG1.ManageComponent(ch_AutoAim);
            i_BG1.ManageComponent(ch_ClassicTrans);
            i_BG1.ManageComponent(ch_LandShake);
            i_BG1.ManageComponent(co_GoreLevel);
            // End:0xcf
            if(!PlatformIsWindows() || PlatformIs64Bit())
            {
                ch_Speech.DisableMe();
            }
        }
        UpdateStatsItems();
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;
    local PlayerController PC;

    // End:0x49f
    if(GUIMenuOption(Sender) != none)
    {
        PC = PlayerOwner();
        switch(GUIMenuOption(Sender))
        {
            // End:0x5d
            case ch_AutoSwitch:
                bAuto = !PC.bNeverSwitchOnPickup;
                ch_AutoSwitch.Checked(bAuto);
                // End:0x49f
                break;
            // End:0xc9
            case ch_WeaponBob:
                // End:0x9b
                if(PC.Pawn != none)
                {
                    bBob = PC.Pawn.bWeaponBob;
                }
                // End:0xb1
                else
                {
                    bBob = class'Pawn'.default.bWeaponBob;
                }
                ch_WeaponBob.Checked(bBob);
                // End:0x49f
                break;
            // End:0x142
            case co_GoreLevel:
                // End:0x117
                if(PC.Level.Game != none)
                {
                    iGore = PC.Level.Game.GoreLevel;
                }
                // End:0x12b
                else
                {
                    iGore = class'GameInfo'.default.GoreLevel;
                }
                co_GoreLevel.SetIndex(iGore);
                // End:0x49f
                break;
            // End:0x178
            case ch_Dodging:
                bDodge = PC.DodgingIsEnabled();
                ch_Dodging.Checked(bDodge);
                // End:0x49f
                break;
            // End:0x1ae
            case ch_AutoAim:
                bAim = PC.bAimingHelp;
                ch_AutoAim.Checked(bAim);
                // End:0x49f
                break;
            // End:0x212
            case ch_ClassicTrans:
                // End:0x1e4
                if(wPlayer(PC) != none)
                {
                    bClassicTrans = wPlayer(PC).bClassicTrans;
                }
                // End:0x1fa
                else
                {
                    bClassicTrans = class'wPlayer'.default.bClassicTrans;
                }
                ch_ClassicTrans.Checked(bClassicTrans);
                // End:0x49f
                break;
            // End:0x248
            case ch_LandShake:
                bLandShake = PC.bLandingShake;
                ch_LandShake.Checked(bLandShake);
                // End:0x49f
                break;
            // End:0x2bf
            case ch_Speech:
                bSpeechRec = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseSpeechRecognition"));
                ch_Speech.SetComponentValue(string(bSpeechRec), true);
                // End:0x49f
                break;
            // End:0x2fe
            case ch_Precache:
                bPrecache = PC.Level.bDesireSkinPreload;
                ch_Precache.Checked(bPrecache);
                // End:0x49f
                break;
            // End:0x3c4
            case co_Netspeed:
                // End:0x33a
                if(PC.Player != none)
                {
                    i = PC.Player.ConfiguredInternetSpeed;
                }
                // End:0x34e
                else
                {
                    i = class'Player'.default.ConfiguredInternetSpeed;
                }
                // End:0x367
                if(i <= 2600)
                {
                    iNetspeed = 0;
                }
                // End:0x3a2
                else
                {
                    // End:0x380
                    if(i <= 5000)
                    {
                        iNetspeed = 1;
                    }
                    // End:0x3a2
                    else
                    {
                        // End:0x39a
                        if(i <= 10000)
                        {
                            iNetspeed = 2;
                        }
                        // End:0x3a2
                        else
                        {
                            iNetspeed = 3;
                        }
                    }
                }
                iNetSpeedD = iNetspeed;
                co_Netspeed.SetIndex(iNetspeed);
                // End:0x49f
                break;
            // End:0x3f7
            case ed_Name:
                sName = PC.StatsUsername;
                ed_Name.SetText(sName);
                // End:0x49f
                break;
            // End:0x42a
            case ed_Password:
                sPassword = PC.StatsPassword;
                ed_Password.SetText(sPassword);
                // End:0x49f
                break;
            // End:0x466
            case ch_TrackStats:
                bStats = PC.bEnableStatsTracking;
                ch_TrackStats.Checked(bStats);
                UpdateStatsItems();
                // End:0x49f
                break;
            // End:0x49c
            case ch_DynNetspeed:
                bDynNet = PC.bDynamicNetSpeed;
                ch_DynNetspeed.Checked(bDynNet);
                // End:0x49f
                break;
            // End:0xffff
            default:
            }
}

function SaveSettings()
{
    local PlayerController PC;
    local bool bSave;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0xbd
    if(bSpeechRec != bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseSpeechRecognition")))
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager UseSpeechRecognition" @ string(bSpeechRec));
    }
    // End:0x12b
    if(wPlayer(PC) != none && wPlayer(PC).bClassicTrans != bClassicTrans)
    {
        wPlayer(PC).bClassicTrans = bClassicTrans;
        wPlayer(PC).ServerSetClassicTrans(bClassicTrans);
        bSave = true;
    }
    // End:0x16a
    if(class'wPlayer'.default.bClassicTrans != bClassicTrans)
    {
        class'wPlayer'.default.bClassicTrans = bClassicTrans;
        class'wPlayer'.static.StaticSaveConfig();
    }
    // End:0x1a2
    if(PC.bLandingShake != bLandShake)
    {
        PC.bLandingShake = bLandShake;
        bSave = true;
    }
    // End:0x1d9
    if(PC.DodgingIsEnabled() != bDodge)
    {
        PC.SetDodging(bDodge);
        bSave = true;
    }
    // End:0x213
    if(PC.bNeverSwitchOnPickup == bAuto)
    {
        PC.bNeverSwitchOnPickup = !bAuto;
        bSave = true;
    }
    // End:0x24b
    if(PC.bAimingHelp != bAim)
    {
        PC.bAimingHelp = bAim;
        bSave = true;
    }
    // End:0x296
    if(PC.Pawn != none)
    {
        PC.Pawn.bWeaponBob = bBob;
        PC.Pawn.SaveConfig();
    }
    // End:0x2d5
    else
    {
        // End:0x2d5
        if(class'Pawn'.default.bWeaponBob != bBob)
        {
            class'Pawn'.default.bWeaponBob = bBob;
            class'Pawn'.static.StaticSaveConfig();
        }
    }
    // End:0x379
    if(PC.Level != none && PC.Level.Game != none)
    {
        // End:0x376
        if(PC.Level.Game.GoreLevel != iGore)
        {
            PC.Level.Game.GoreLevel = iGore;
            PC.Level.Game.SaveConfig();
        }
    }
    // End:0x3b4
    else
    {
        // End:0x3b4
        if(class'GameInfo'.default.GoreLevel != iGore)
        {
            class'GameInfo'.default.GoreLevel = iGore;
            class'GameInfo'.static.StaticSaveConfig();
        }
    }
    // End:0x40b
    if(bPrecache != PC.Level.bDesireSkinPreload)
    {
        PC.Level.bDesireSkinPreload = bPrecache;
        PC.Level.SaveConfig();
    }
    // End:0x583
    if(iNetspeed != iNetSpeedD || class'Player'.default.ConfiguredInternetSpeed == 9636)
    {
        // End:0x4fc
        if(PC.Player != none)
        {
            switch(iNetspeed)
            {
                // End:0x473
                case 0:
                    PC.Player.ConfiguredInternetSpeed = 2600;
                    // End:0x4e4
                    break;
                // End:0x497
                case 1:
                    PC.Player.ConfiguredInternetSpeed = 5000;
                    // End:0x4e4
                    break;
                // End:0x4bc
                case 2:
                    PC.Player.ConfiguredInternetSpeed = 10000;
                    // End:0x4e4
                    break;
                // End:0x4e1
                case 3:
                    PC.Player.ConfiguredInternetSpeed = 15000;
                    // End:0x4e4
                    break;
                // End:0xffff
                default:
                    PC.Player.SaveConfig();
                    // End:0x583 Break;
                    break;
                }
        }
        switch(iNetspeed)
        {
            // End:0x51e
            case 0:
                class'Player'.default.ConfiguredInternetSpeed = 2600;
                // End:0x574
                break;
            // End:0x539
            case 1:
                class'Player'.default.ConfiguredInternetSpeed = 5000;
                // End:0x574
                break;
            // End:0x555
            case 2:
                class'Player'.default.ConfiguredInternetSpeed = 10000;
                // End:0x574
                break;
            // End:0x571
            case 3:
                class'Player'.default.ConfiguredInternetSpeed = 15000;
                // End:0x574
                break;
            // End:0xffff
            default:
                class'Player'.static.StaticSaveConfig();
            }
            // End:0x5bb
            if(bStats != PC.bEnableStatsTracking)
            {
                PC.bEnableStatsTracking = bStats;
                bSave = true;
            }
            // End:0x5ef
            if(sName != PC.StatsUsername)
            {
                PC.StatsUsername = sName;
                bSave = true;
            }
            // End:0x623
            if(PC.StatsPassword != sPassword)
            {
                PC.StatsPassword = sPassword;
                bSave = true;
            }
            // End:0x65b
            if(PC.bDynamicNetSpeed != bDynNet)
            {
                PC.bDynamicNetSpeed = bDynNet;
                bSave = true;
            }
            // End:0x670
            if(bSave)
            {
                PC.SaveConfig();
            }
}

function ResetClicked()
{
    local class<Client> ViewportClass;
    local bool bTemp;
    local PlayerController PC;
    local int i;

    super.ResetClicked();
    PC = PlayerOwner();
    ViewportClass = class<Client>(DynamicLoadObject(GetNativeClassName("Engine.Engine.ViewportManager"), class'Class'));
    ViewportClass.static.ResetConfig("UseSpeechRecognition");
    ViewportClass.static.ResetConfig("ScreenFlashes");
    class'wPlayer'.static.ResetConfig("bClassicTrans");
    PC.ResetConfig("bNeverSwitchOnPickup");
    PC.ResetConfig("bEnableDodging");
    PC.ResetConfig("bLandingShake");
    PC.ResetConfig("bAimingHelp");
    class'Pawn'.static.ResetConfig("bWeaponBob");
    class'GameInfo'.static.ResetConfig("GoreLevel");
    class'Player'.static.ResetConfig("ConfiguredInternetSpeed");
    class'LevelInfo'.static.ResetConfig("bDesireSkinPreload");
    PC.ResetConfig("bEnableStatsTracking");
    PC.ClearConfig("StatsUserName");
    PC.ClearConfig("StatsPassword");
    PC.ResetConfig("bDynamicNetSpeed");
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x253:
    // End:0x283 [While If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x253;
    }
    Controller.bCurMenuInitialized = bTemp;
}

function InternalOnChange(GUIComponent Sender)
{
    local PlayerController PC;

    super.InternalOnChange(Sender);
    // End:0x203
    if(GUIMenuOption(Sender) != none)
    {
        PC = PlayerOwner();
        switch(GUIMenuOption(Sender))
        {
            // End:0x51
            case ch_Speech:
                bSpeechRec = ch_Speech.IsChecked();
                // End:0x203
                break;
            // End:0x72
            case ch_AutoSwitch:
                bAuto = ch_AutoSwitch.IsChecked();
                // End:0x203
                break;
            // End:0x93
            case ch_WeaponBob:
                bBob = ch_WeaponBob.IsChecked();
                // End:0x203
                break;
            // End:0xb3
            case co_GoreLevel:
                iGore = co_GoreLevel.GetIndex();
                // End:0x203
                break;
            // End:0xd4
            case ch_Dodging:
                bDodge = ch_Dodging.IsChecked();
                // End:0x203
                break;
            // End:0xf5
            case ch_AutoAim:
                bAim = ch_AutoAim.IsChecked();
                // End:0x203
                break;
            // End:0x116
            case ch_ClassicTrans:
                bClassicTrans = ch_ClassicTrans.IsChecked();
                // End:0x203
                break;
            // End:0x137
            case ch_LandShake:
                bLandShake = ch_LandShake.IsChecked();
                // End:0x203
                break;
            // End:0x158
            case ch_Precache:
                bPrecache = ch_Precache.IsChecked();
                // End:0x203
                break;
            // End:0x178
            case co_Netspeed:
                iNetspeed = co_Netspeed.GetIndex();
                // End:0x203
                break;
            // End:0x198
            case ed_Name:
                sName = ed_Name.GetText();
                // End:0x203
                break;
            // End:0x1b8
            case ed_Password:
                sPassword = ed_Password.GetText();
                // End:0x203
                break;
            // End:0x1df
            case ch_TrackStats:
                bStats = ch_TrackStats.IsChecked();
                UpdateStatsItems();
                // End:0x203
                break;
            // End:0x200
            case ch_DynNetspeed:
                bDynNet = ch_DynNetspeed.IsChecked();
                // End:0x203
                break;
            // End:0xffff
            default:
            }
            l_Warning.SetVisibility(!ValidStatConfig());
}

function bool ValidStatConfig()
{
    // End:0x3d
    if(bStats)
    {
        // End:0x23
        if(Len(ed_Name.GetText()) < 4)
        {
            return false;
        }
        // End:0x3d
        if(Len(ed_Password.GetText()) < 6)
        {
            return false;
        }
    }
    return true;
}

function bool OnViewStats(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("start" @ StatsURL);
    return true;
}

function UpdateStatsItems()
{
    // End:0x2d
    if(bStats)
    {
        EnableComponent(ed_Name);
        EnableComponent(ed_Password);
        EnableComponent(b_Stats);
    }
    // End:0x4e
    else
    {
        DisableComponent(ed_Name);
        DisableComponent(ed_Password);
        DisableComponent(b_Stats);
    }
    l_Warning.SetVisibility(!ValidStatConfig());
}

defaultproperties
{
    begin object name=GameBK1 class=GUISectionBackground
        Caption="?????"
        WinTop=0.0338530
        WinLeft=0.0146490
        WinWidth=0.4496090
        WinHeight=0.7489360
        RenderWeight=0.10010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_GameSettings.GameBK1'
    i_BG1=GameBK1
    begin object name=GameBK2 class=GUISectionBackground
        Caption="????"
        WinTop=0.0338530
        WinLeft=0.4863280
        WinWidth=0.4964840
        WinHeight=0.199610
        RenderWeight=0.10020
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_GameSettings.GameBK2'
    i_BG2=GameBK2
    begin object name=GameBK3 class=GUISectionBackground
        Caption="??"
        WinTop=0.2404910
        WinLeft=0.4863280
        WinWidth=0.4964840
        WinHeight=0.3089850
        RenderWeight=0.10020
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_GameSettings.GameBK3'
    i_BG3=GameBK3
    begin object name=GameBK4 class=GUISectionBackground
        Caption="??? ??"
        WinTop=0.5598890
        WinLeft=0.4863280
        WinWidth=0.4964840
        WinHeight=0.2191410
        RenderWeight=0.10020
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_GameSettings.GameBK4'
    i_BG4=GameBK4
    begin object name=GameBK5 class=GUISectionBackground
        Caption="?? ??? / ???"
        WinTop=0.7913930
        WinLeft=0.0174190
        WinWidth=0.9657120
        WinHeight=0.2007060
        RenderWeight=0.10020
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_GameSettings.GameBK5'
    i_BG5=GameBK5
    begin object name=GameWeaponBob class=moCheckBox
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ? ??? ? ??? ???? ??? ??? ?????."
        WinTop=0.290780
        WinLeft=0.050
        WinWidth=0.40
        RenderWeight=1.040
        TabOrder=1
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.GameWeaponBob'
    ch_WeaponBob=GameWeaponBob
    begin object name=WeaponAutoSwitch class=moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ?? ??? ???? ?? ???? ? ??? ???? ???."
        RenderWeight=1.040
        TabOrder=6
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.WeaponAutoSwitch'
    ch_AutoSwitch=WeaponAutoSwitch
    begin object name=SpeechRecognition class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ??? ?????."
        WinTop=0.6545270
        WinLeft=0.5400580
        WinWidth=0.4033530
        TabOrder=14
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.SpeechRecognition'
    ch_Speech=SpeechRecognition
    begin object name=GameDodging class=moCheckBox
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?? ?? ??? ?? ?? ??, ? ??? ???? ??? ????."
        WinTop=0.5415630
        WinLeft=0.050
        WinWidth=0.40
        RenderWeight=1.040
        TabOrder=3
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.GameDodging'
    ch_Dodging=GameDodging
    begin object name=GameAutoAim class=moCheckBox
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ?? ??? ?? ?????? ?? ???."
        WinTop=0.6923440
        WinLeft=0.050
        WinWidth=0.40
        RenderWeight=1.040
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.GameAutoAim'
    ch_AutoAim=GameAutoAim
    begin object name=GameClassicTrans class=moCheckBox
        Caption="?? ?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? high translocator beacon toss trajectory? ??? ? ????."
        RenderWeight=1.040
        TabOrder=5
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.GameClassicTrans'
    ch_ClassicTrans=GameClassicTrans
    begin object name=LandShaking class=moCheckBox
        CaptionWidth=0.90
        Caption="??? ??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ?????."
        WinTop=0.1502610
        WinLeft=0.705430
        WinWidth=0.2667970
        TabOrder=7
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.LandShaking'
    ch_LandShake=LandShaking
    begin object name=GameGoreLevel class=moComboBox
        bReadOnly=true
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="="?? ??? ????? ??? ??? ?? ??? ?????.""
        WinTop=0.4155210
        WinLeft=0.050
        WinWidth=0.40
        RenderWeight=1.040
        TabOrder=2
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_GameSettings.GameGoreLevel'
    co_GoreLevel=GameGoreLevel
    NetSpeedText[0]="??"
    NetSpeedText[1]="ISDN"
    NetSpeedText[2]="???/ADSL"
    NetSpeedText[3]="LAN/T1"
    StatsURL="http://ut2003stats.epicgames.com/"
    EpicIDMsg="??? ?? ???:"
    begin object name=InvalidWarning class=GUILabel
        Caption="??? ????? ?? ????? ????? ???? ????. ????? ??? 4 ?? ??, ????? 6 ?? ????? ???."
        TextAlign=1
        TextColor=(R=255,G=255,B=0,A=255)
        TextFont="UT2SmallFont"
        bMultiLine=true
        WinTop=0.9160020
        WinLeft=0.0571830
        WinWidth=0.8879650
        WinHeight=0.0583350
    object end
    // Reference: GUILabel'UT2K4Tab_GameSettings.InvalidWarning'
    l_Warning=InvalidWarning
    begin object name=EpicID class=GUILabel
        Caption="??? ?? ???:"
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.858220
        WinLeft=0.0549070
        WinWidth=0.8889910
        WinHeight=0.0677030
        RenderWeight=0.20
    object end
    // Reference: GUILabel'UT2K4Tab_GameSettings.EpicID'
    l_ID=EpicID
    begin object name=ViewOnlineStats class=GUIButton
        Caption="?? ??"
        Hint="???? UT ?? ????? ?????."
        WinTop=0.4693910
        WinLeft=0.7803830
        WinWidth=0.1660550
        WinHeight=0.050
        TabOrder=13
        OnClick=OnViewStats
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_GameSettings.ViewOnlineStats'
    b_Stats=ViewOnlineStats
    begin object name=OnlineTrackStats class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="??? ?? ???? ???? ?? ?????."
        WinTop=0.3217330
        WinLeft=0.6425970
        WinWidth=0.1702730
        TabOrder=10
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.OnlineTrackStats'
    ch_TrackStats=OnlineTrackStats
    begin object name=NetworkDynamicNetspeed class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.940
        Caption="???? ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? ???? ??? ??? ??? ?? ?????.."
        WinTop=0.1660170
        WinLeft=0.5289970
        WinWidth=0.4192970
        TabOrder=9
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.NetworkDynamicNetspeed'
    ch_DynNetspeed=NetworkDynamicNetspeed
    begin object name=PrecacheSkins class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="???? ?? ??????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ????? ??? ?? ?????. ??? ?? ??, ?? ?? ??? ????? ?? ? ????? ?????. ? ??? ????? ?? 512 MB? ??? ???? ?????."
        WinTop=0.7075530
        WinLeft=0.5400580
        WinWidth=0.4033530
        TabOrder=15
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_GameSettings.PrecacheSkins'
    ch_Precache=PrecacheSkins
    begin object name=OnlineNetSpeed class=moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.550
        Caption="??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Cable Modem/DSL"
        Hint="??? ??? ?????."
        WinTop=0.1229440
        WinLeft=0.5289970
        WinWidth=0.4192970
        TabOrder=8
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2K4Tab_GameSettings.OnlineNetSpeed'
    co_Netspeed=OnlineNetSpeed
    begin object name=OnlineStatsName class=moEditBox
        CaptionWidth=0.40
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="UT ??? ??? ????? ??? ???!"
        WinTop=0.3733490
        WinLeft=0.5249120
        WinWidth=0.4193160
        TabOrder=11
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moEditBox'UT2K4Tab_GameSettings.OnlineStatsName'
    ed_Name=OnlineStatsName
    begin object name=OnlineStatsPW class=moEditBox
        CaptionWidth=0.40
        Caption="????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="UT ??? ??? ????? ?????!"
        WinTop=0.4306770
        WinLeft=0.5249120
        WinWidth=0.4193160
        TabOrder=12
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moEditBox'UT2K4Tab_GameSettings.OnlineStatsPW'
    ed_Password=OnlineStatsPW
    PanelCaption="??"
    WinTop=0.150
    WinHeight=0.740
}