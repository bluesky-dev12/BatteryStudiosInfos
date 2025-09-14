class UT2K4Tab_GameSettings extends Settings_Tabs
    editinlinenew
    instanced;

var() automated GUISectionBackground i_BG1;
var() automated GUISectionBackground i_BG2;
var() automated GUISectionBackground i_BG3;
var() automated GUISectionBackground i_BG4;
var() automated GUISectionBackground i_BG5;
var() automated moCheckBox ch_WeaponBob;
var() automated moCheckBox ch_AutoSwitch;
var() automated moCheckBox ch_Speech;
var() automated moCheckBox ch_Dodging;
var() automated moCheckBox ch_AutoAim;
var() automated moCheckBox ch_ClassicTrans;
var() automated moCheckBox ch_LandShake;
var() automated moComboBox co_GoreLevel;
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
var() automated GUILabel l_Warning;
var() automated GUILabel l_ID;
var() automated GUIButton b_Stats;
var() automated moCheckBox ch_TrackStats;
var() automated moCheckBox ch_DynNetspeed;
var() automated moCheckBox ch_Precache;
var() automated moComboBox co_Netspeed;
var() automated moEditBox ed_Name;
var() automated moEditBox ed_Password;
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
    if(Class'Engine.GameInfo'.default.bAlternateMode)
    {
        RemoveComponent(co_GoreLevel);        
    }
    else
    {
        i = 0;
        J0x37:

        // End:0x70 [Loop If]
        if(i < 3)
        {
            co_GoreLevel.AddItem(Class'Engine.GameInfo'.default.GoreLevelText[i]);
            i++;
            // [Loop Continue]
            goto J0x37;
        }
    }
    LastGameOption = ch_LandShake;
    i = 0;
    J0x82:

    // End:0xB2 [Loop If]
    if(i < 4)
    {
        co_Netspeed.AddItem(NetSpeedText[i]);
        i++;
        // [Loop Continue]
        goto J0x82;
    }
    ed_Name.MyEditBox.bConvertSpaces = true;
    ed_Name.MyEditBox.MaxWidth = 14;
    ed_Password.MyEditBox.MaxWidth = 14;
    ed_Password.MaskText(true);
    l_ID.Caption = FormatID(PlayerOwner().GetPlayerIDHash());
    //return;    
}

function string FormatID(string id)
{
    id = Caps(id);
    return (((((Mid(id, 0, 8) $ "-") $ Mid(id, 8, 8)) $ "-") $ Mid(id, 16, 8)) $ "-") $ Mid(id, 24, 8);
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0xD5
    if(bShow)
    {
        // End:0xCF
        if(bInit)
        {
            i_BG1.ManageComponent(ch_WeaponBob);
            i_BG1.ManageComponent(ch_AutoSwitch);
            i_BG1.ManageComponent(ch_Dodging);
            i_BG1.ManageComponent(ch_AutoAim);
            i_BG1.ManageComponent(ch_ClassicTrans);
            i_BG1.ManageComponent(ch_LandShake);
            i_BG1.ManageComponent(co_GoreLevel);
            // End:0xCF
            if(!PlatformIsWindows() || PlatformIs64Bit())
            {
                ch_Speech.DisableMe();
            }
        }
        UpdateStatsItems();
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;
    local PlayerController PC;

    // End:0x49F
    if(GUIMenuOption(Sender) != none)
    {
        PC = PlayerOwner();
        switch(GUIMenuOption(Sender))
        {
            // End:0x5D
            case ch_AutoSwitch:
                bAuto = !PC.bNeverSwitchOnPickup;
                ch_AutoSwitch.Checked(bAuto);
                // End:0x49F
                break;
            // End:0xC9
            case ch_WeaponBob:
                // End:0x9B
                if(PC.Pawn != none)
                {
                    bBob = PC.Pawn.bWeaponBob;                    
                }
                else
                {
                    bBob = Class'Engine.Pawn'.default.bWeaponBob;
                }
                ch_WeaponBob.Checked(bBob);
                // End:0x49F
                break;
            // End:0x142
            case co_GoreLevel:
                // End:0x117
                if(PC.Level.Game != none)
                {
                    iGore = PC.Level.Game.GoreLevel;                    
                }
                else
                {
                    iGore = Class'Engine.GameInfo'.default.GoreLevel;
                }
                co_GoreLevel.SetIndex(iGore);
                // End:0x49F
                break;
            // End:0x178
            case ch_Dodging:
                bDodge = PC.DodgingIsEnabled();
                ch_Dodging.Checked(bDodge);
                // End:0x49F
                break;
            // End:0x1AE
            case ch_AutoAim:
                bAim = PC.bAimingHelp;
                ch_AutoAim.Checked(bAim);
                // End:0x49F
                break;
            // End:0x212
            case ch_ClassicTrans:
                // End:0x1E4
                if(wPlayer(PC) != none)
                {
                    bClassicTrans = wPlayer(PC).bClassicTrans;                    
                }
                else
                {
                    bClassicTrans = Class'WGame.wPlayer'.default.bClassicTrans;
                }
                ch_ClassicTrans.Checked(bClassicTrans);
                // End:0x49F
                break;
            // End:0x248
            case ch_LandShake:
                bLandShake = PC.bLandingShake;
                ch_LandShake.Checked(bLandShake);
                // End:0x49F
                break;
            // End:0x2BF
            case ch_Speech:
                bSpeechRec = bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseSpeechRecognition"));
                ch_Speech.SetComponentValue(string(bSpeechRec), true);
                // End:0x49F
                break;
            // End:0x2FE
            case ch_Precache:
                bPrecache = PC.Level.bDesireSkinPreload;
                ch_Precache.Checked(bPrecache);
                // End:0x49F
                break;
            // End:0x3C4
            case co_Netspeed:
                // End:0x33A
                if(PC.Player != none)
                {
                    i = PC.Player.ConfiguredInternetSpeed;                    
                }
                else
                {
                    i = Class'Engine.Player'.default.ConfiguredInternetSpeed;
                }
                // End:0x367
                if(i <= 2600)
                {
                    iNetspeed = 0;                    
                }
                else
                {
                    // End:0x380
                    if(i <= 5000)
                    {
                        iNetspeed = 1;                        
                    }
                    else
                    {
                        // End:0x39A
                        if(i <= 10000)
                        {
                            iNetspeed = 2;                            
                        }
                        else
                        {
                            iNetspeed = 3;
                        }
                    }
                }
                iNetSpeedD = iNetspeed;
                co_Netspeed.SetIndex(iNetspeed);
                // End:0x49F
                break;
            // End:0x3F7
            case ed_Name:
                sName = PC.StatsUsername;
                ed_Name.SetText(sName);
                // End:0x49F
                break;
            // End:0x42A
            case ed_Password:
                sPassword = PC.StatsPassword;
                ed_Password.SetText(sPassword);
                // End:0x49F
                break;
            // End:0x466
            case ch_TrackStats:
                bStats = PC.bEnableStatsTracking;
                ch_TrackStats.Checked(bStats);
                UpdateStatsItems();
                // End:0x49F
                break;
            // End:0x49C
            case ch_DynNetspeed:
                bDynNet = PC.bDynamicNetSpeed;
                ch_DynNetspeed.Checked(bDynNet);
                // End:0x49F
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        //return;        
    }
}

function SaveSettings()
{
    local PlayerController PC;
    local bool bSave;

    super.SaveSettings();
    PC = PlayerOwner();
    // End:0xBD
    if(bSpeechRec != bool(PC.ConsoleCommand("get ini:Engine.Engine.ViewportManager UseSpeechRecognition")))
    {
        PC.ConsoleCommand("set ini:Engine.Engine.ViewportManager UseSpeechRecognition" @ string(bSpeechRec));
    }
    // End:0x12B
    if((wPlayer(PC) != none) && wPlayer(PC).bClassicTrans != bClassicTrans)
    {
        wPlayer(PC).bClassicTrans = bClassicTrans;
        wPlayer(PC).ServerSetClassicTrans(bClassicTrans);
        bSave = true;
    }
    // End:0x16A
    if(Class'WGame.wPlayer'.default.bClassicTrans != bClassicTrans)
    {
        Class'WGame.wPlayer'.default.bClassicTrans = bClassicTrans;
        Class'WGame.wPlayer'.static.StaticSaveConfig();
    }
    // End:0x1A2
    if(PC.bLandingShake != bLandShake)
    {
        PC.bLandingShake = bLandShake;
        bSave = true;
    }
    // End:0x1D9
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
    // End:0x24B
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
    else
    {
        // End:0x2D5
        if(Class'Engine.Pawn'.default.bWeaponBob != bBob)
        {
            Class'Engine.Pawn'.default.bWeaponBob = bBob;
            Class'Engine.Pawn'.static.StaticSaveConfig();
        }
    }
    // End:0x379
    if((PC.Level != none) && PC.Level.Game != none)
    {
        // End:0x376
        if(PC.Level.Game.GoreLevel != iGore)
        {
            PC.Level.Game.GoreLevel = iGore;
            PC.Level.Game.SaveConfig();
        }        
    }
    else
    {
        // End:0x3B4
        if(Class'Engine.GameInfo'.default.GoreLevel != iGore)
        {
            Class'Engine.GameInfo'.default.GoreLevel = iGore;
            Class'Engine.GameInfo'.static.StaticSaveConfig();
        }
    }
    // End:0x40B
    if(bPrecache != PC.Level.bDesireSkinPreload)
    {
        PC.Level.bDesireSkinPreload = bPrecache;
        PC.Level.SaveConfig();
    }
    // End:0x583
    if((iNetspeed != iNetSpeedD) || Class'Engine.Player'.default.ConfiguredInternetSpeed == 9636)
    {
        // End:0x4FC
        if(PC.Player != none)
        {
            switch(iNetspeed)
            {
                // End:0x473
                case 0:
                    PC.Player.ConfiguredInternetSpeed = 2600;
                    // End:0x4E4
                    break;
                // End:0x497
                case 1:
                    PC.Player.ConfiguredInternetSpeed = 5000;
                    // End:0x4E4
                    break;
                // End:0x4BC
                case 2:
                    PC.Player.ConfiguredInternetSpeed = 10000;
                    // End:0x4E4
                    break;
                // End:0x4E1
                case 3:
                    PC.Player.ConfiguredInternetSpeed = 15000;
                    // End:0x4E4
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            PC.Player.SaveConfig();            
        }
        else
        {
            switch(iNetspeed)
            {
                // End:0x51E
                case 0:
                    Class'Engine.Player'.default.ConfiguredInternetSpeed = 2600;
                    // End:0x574
                    break;
                // End:0x539
                case 1:
                    Class'Engine.Player'.default.ConfiguredInternetSpeed = 5000;
                    // End:0x574
                    break;
                // End:0x555
                case 2:
                    Class'Engine.Player'.default.ConfiguredInternetSpeed = 10000;
                    // End:0x574
                    break;
                // End:0x571
                case 3:
                    Class'Engine.Player'.default.ConfiguredInternetSpeed = 15000;
                    // End:0x574
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            Class'Engine.Player'.static.StaticSaveConfig();
        }
    }
    // End:0x5BB
    if(bStats != PC.bEnableStatsTracking)
    {
        PC.bEnableStatsTracking = bStats;
        bSave = true;
    }
    // End:0x5EF
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
    // End:0x65B
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
    //return;    
}

function ResetClicked()
{
    local Class<Client> ViewportClass;
    local bool bTemp;
    local PlayerController PC;
    local int i;

    super.ResetClicked();
    PC = PlayerOwner();
    ViewportClass = Class<Client>(DynamicLoadObject(GetNativeClassName("Engine.Engine.ViewportManager"), Class'Core.Class'));
    ViewportClass.static.ResetConfig("UseSpeechRecognition");
    ViewportClass.static.ResetConfig("ScreenFlashes");
    Class'WGame.wPlayer'.static.ResetConfig("bClassicTrans");
    PC.ResetConfig("bNeverSwitchOnPickup");
    PC.ResetConfig("bEnableDodging");
    PC.ResetConfig("bLandingShake");
    PC.ResetConfig("bAimingHelp");
    Class'Engine.Pawn'.static.ResetConfig("bWeaponBob");
    Class'Engine.GameInfo'.static.ResetConfig("GoreLevel");
    Class'Engine.Player'.static.ResetConfig("ConfiguredInternetSpeed");
    Class'Engine.LevelInfo'.static.ResetConfig("bDesireSkinPreload");
    PC.ResetConfig("bEnableStatsTracking");
    PC.ClearConfig("StatsUserName");
    PC.ClearConfig("StatsPassword");
    PC.ResetConfig("bDynamicNetSpeed");
    bTemp = Controller.bCurMenuInitialized;
    Controller.bCurMenuInitialized = false;
    i = 0;
    J0x253:

    // End:0x283 [Loop If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        i++;
        // [Loop Continue]
        goto J0x253;
    }
    Controller.bCurMenuInitialized = bTemp;
    //return;    
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
            // End:0xB3
            case co_GoreLevel:
                iGore = co_GoreLevel.GetIndex();
                // End:0x203
                break;
            // End:0xD4
            case ch_Dodging:
                bDodge = ch_Dodging.IsChecked();
                // End:0x203
                break;
            // End:0xF5
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
            // End:0x1B8
            case ed_Password:
                sPassword = ed_Password.GetText();
                // End:0x203
                break;
            // End:0x1DF
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
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        l_Warning.SetVisibility(!ValidStatConfig());
        //return;        
    }
}

function bool ValidStatConfig()
{
    // End:0x3D
    if(bStats)
    {
        // End:0x23
        if(Len(ed_Name.GetText()) < 4)
        {
            return false;
        }
        // End:0x3D
        if(Len(ed_Password.GetText()) < 6)
        {
            return false;
        }
    }
    return true;
    //return;    
}

function bool OnViewStats(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("start" @ StatsURL);
    return true;
    //return;    
}

function UpdateStatsItems()
{
    // End:0x2D
    if(bStats)
    {
        EnableComponent(ed_Name);
        EnableComponent(ed_Password);
        EnableComponent(b_Stats);        
    }
    else
    {
        DisableComponent(ed_Name);
        DisableComponent(ed_Password);
        DisableComponent(b_Stats);
    }
    l_Warning.SetVisibility(!ValidStatConfig());
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameBK1'
    begin object name="GameBK1" class=XInterface.GUISectionBackground
        Caption="?????"
        WinTop=0.0338530
        WinLeft=0.0146490
        WinWidth=0.4496090
        WinHeight=0.7489360
        RenderWeight=0.1001000
        OnPreDraw=GameBK1.InternalPreDraw
    end object
    i_BG1=GameBK1
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameBK2'
    begin object name="GameBK2" class=XInterface.GUISectionBackground
        Caption="????"
        WinTop=0.0338530
        WinLeft=0.4863280
        WinWidth=0.4964840
        WinHeight=0.1996100
        RenderWeight=0.1002000
        OnPreDraw=GameBK2.InternalPreDraw
    end object
    i_BG2=GameBK2
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameBK3'
    begin object name="GameBK3" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.2404910
        WinLeft=0.4863280
        WinWidth=0.4964840
        WinHeight=0.3089850
        RenderWeight=0.1002000
        OnPreDraw=GameBK3.InternalPreDraw
    end object
    i_BG3=GameBK3
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameBK4'
    begin object name="GameBK4" class=XInterface.GUISectionBackground
        Caption="??? ??"
        WinTop=0.5598890
        WinLeft=0.4863280
        WinWidth=0.4964840
        WinHeight=0.2191410
        RenderWeight=0.1002000
        OnPreDraw=GameBK4.InternalPreDraw
    end object
    i_BG4=GameBK4
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameBK5'
    begin object name="GameBK5" class=XInterface.GUISectionBackground
        Caption="?? ??? / ???"
        WinTop=0.7913930
        WinLeft=0.0174190
        WinWidth=0.9657120
        WinHeight=0.2007060
        RenderWeight=0.1002000
        OnPreDraw=GameBK5.InternalPreDraw
    end object
    i_BG5=GameBK5
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameWeaponBob'
    begin object name="GameWeaponBob" class=XInterface.moCheckBox
        Caption="?? ??"
        OnCreateComponent=GameWeaponBob.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ? ??? ? ??? ???? ??? ??? ?????."
        WinTop=0.2907800
        WinLeft=0.0500000
        WinWidth=0.4000000
        RenderWeight=1.0400000
        TabOrder=1
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_WeaponBob=GameWeaponBob
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.WeaponAutoSwitch'
    begin object name="WeaponAutoSwitch" class=XInterface.moCheckBox
        Caption="?? ?? ??"
        OnCreateComponent=WeaponAutoSwitch.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ?? ??? ???? ?? ???? ? ??? ???? ???."
        RenderWeight=1.0400000
        TabOrder=6
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_AutoSwitch=WeaponAutoSwitch
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.SpeechRecognition'
    begin object name="SpeechRecognition" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ??"
        OnCreateComponent=SpeechRecognition.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ??? ?????."
        WinTop=0.6545270
        WinLeft=0.5400580
        WinWidth=0.4033530
        TabOrder=14
        bBoundToParent=true
        bScaleToParent=true
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_Speech=SpeechRecognition
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameDodging'
    begin object name="GameDodging" class=XInterface.moCheckBox
        Caption="????"
        OnCreateComponent=GameDodging.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?? ?? ??? ?? ?? ??, ? ??? ???? ??? ????."
        WinTop=0.5415630
        WinLeft=0.0500000
        WinWidth=0.4000000
        RenderWeight=1.0400000
        TabOrder=3
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_Dodging=GameDodging
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameAutoAim'
    begin object name="GameAutoAim" class=XInterface.moCheckBox
        Caption="????"
        OnCreateComponent=GameAutoAim.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ?? ??? ?? ?????? ?? ???."
        WinTop=0.6923440
        WinLeft=0.0500000
        WinWidth=0.4000000
        RenderWeight=1.0400000
        TabOrder=4
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_AutoAim=GameAutoAim
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameClassicTrans'
    begin object name="GameClassicTrans" class=XInterface.moCheckBox
        Caption="?? ?? ???"
        OnCreateComponent=GameClassicTrans.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ??? high translocator beacon toss trajectory? ??? ? ????."
        RenderWeight=1.0400000
        TabOrder=5
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_ClassicTrans=GameClassicTrans
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.LandShaking'
    begin object name="LandShaking" class=XInterface.moCheckBox
        CaptionWidth=0.9000000
        Caption="??? ??? ??"
        OnCreateComponent=LandShaking.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ?????."
        WinTop=0.1502610
        WinLeft=0.7054300
        WinWidth=0.2667970
        TabOrder=7
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_LandShake=LandShaking
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.GameGoreLevel'
    begin object name="GameGoreLevel" class=XInterface.moComboBox
        bReadOnly=true
        Caption="???"
        OnCreateComponent=GameGoreLevel.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="=\"?? ??? ????? ??? ??? ?? ??? ?????.\""
        WinTop=0.4155210
        WinLeft=0.0500000
        WinWidth=0.4000000
        RenderWeight=1.0400000
        TabOrder=2
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    co_GoreLevel=GameGoreLevel
    NetSpeedText[0]="??"
    NetSpeedText[1]="ISDN"
    NetSpeedText[2]="???/ADSL"
    NetSpeedText[3]="LAN/T1"
    StatsURL="http://ut2003stats.epicgames.com/"
    EpicIDMsg="??? ?? ???:"
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_GameSettings.InvalidWarning'
    begin object name="InvalidWarning" class=XInterface.GUILabel
        Caption="??? ????? ?? ????? ????? ???? ????. ????? ??? 4 ?? ??, ????? 6 ?? ????? ???."
        TextAlign=1
        TextColor=(R=255,G=255,B=0,A=255)
        TextFont="UT2SmallFont"
        bMultiLine=true
        WinTop=0.9160020
        WinLeft=0.0571830
        WinWidth=0.8879650
        WinHeight=0.0583350
    end object
    l_Warning=InvalidWarning
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4Tab_GameSettings.EpicID'
    begin object name="EpicID" class=XInterface.GUILabel
        Caption="??? ?? ???:"
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.8582200
        WinLeft=0.0549070
        WinWidth=0.8889910
        WinHeight=0.0677030
        RenderWeight=0.2000000
    end object
    l_ID=EpicID
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_GameSettings.ViewOnlineStats'
    begin object name="ViewOnlineStats" class=XInterface.GUIButton
        Caption="?? ??"
        Hint="???? UT ?? ????? ?????."
        WinTop=0.4693910
        WinLeft=0.7803830
        WinWidth=0.1660550
        WinHeight=0.0500000
        TabOrder=13
        OnClick=UT2K4Tab_GameSettings.OnViewStats
        OnKeyEvent=ViewOnlineStats.InternalOnKeyEvent
    end object
    b_Stats=ViewOnlineStats
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.OnlineTrackStats'
    begin object name="OnlineTrackStats" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ??"
        OnCreateComponent=OnlineTrackStats.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="True"
        Hint="??? ?? ???? ???? ?? ?????."
        WinTop=0.3217330
        WinLeft=0.6425970
        WinWidth=0.1702730
        TabOrder=10
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_TrackStats=OnlineTrackStats
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.NetworkDynamicNetspeed'
    begin object name="NetworkDynamicNetspeed" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9400000
        Caption="???? ????"
        OnCreateComponent=NetworkDynamicNetspeed.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? ???? ??? ??? ??? ?? ?????.."
        WinTop=0.1660170
        WinLeft=0.5289970
        WinWidth=0.4192970
        TabOrder=9
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_DynNetspeed=NetworkDynamicNetspeed
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.PrecacheSkins'
    begin object name="PrecacheSkins" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="???? ?? ??????"
        OnCreateComponent=PrecacheSkins.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ????? ??? ?? ?????. ??? ?? ??, ?? ?? ??? ????? ?? ? ????? ?????. ? ??? ????? ?? 512 MB? ??? ???? ?????."
        WinTop=0.7075530
        WinLeft=0.5400580
        WinWidth=0.4033530
        TabOrder=15
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ch_Precache=PrecacheSkins
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.OnlineNetSpeed'
    begin object name="OnlineNetSpeed" class=XInterface.moComboBox
        bReadOnly=true
        ComponentJustification=0
        CaptionWidth=0.5500000
        Caption="??"
        OnCreateComponent=OnlineNetSpeed.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="Cable Modem/DSL"
        Hint="??? ??? ?????."
        WinTop=0.1229440
        WinLeft=0.5289970
        WinWidth=0.4192970
        TabOrder=8
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    co_Netspeed=OnlineNetSpeed
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.OnlineStatsName'
    begin object name="OnlineStatsName" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        Caption="????"
        OnCreateComponent=OnlineStatsName.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="UT ??? ??? ????? ??? ???!"
        WinTop=0.3733490
        WinLeft=0.5249120
        WinWidth=0.4193160
        TabOrder=11
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ed_Name=OnlineStatsName
    // Reference: moEditBox'GUI2K4_Decompressed.UT2K4Tab_GameSettings.OnlineStatsPW'
    begin object name="OnlineStatsPW" class=XInterface.moEditBox
        CaptionWidth=0.4000000
        Caption="????"
        OnCreateComponent=OnlineStatsPW.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="UT ??? ??? ????? ?????!"
        WinTop=0.4306770
        WinLeft=0.5249120
        WinWidth=0.4193160
        TabOrder=12
        OnChange=UT2K4Tab_GameSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_GameSettings.InternalOnLoadINI
    end object
    ed_Password=OnlineStatsPW
    PanelCaption="??"
    WinTop=0.1500000
    WinHeight=0.7400000
}