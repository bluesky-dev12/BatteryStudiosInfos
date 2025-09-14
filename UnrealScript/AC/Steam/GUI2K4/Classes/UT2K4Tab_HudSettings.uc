/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Tab_HudSettings.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:44
 *	Functions:12
 *
 *******************************************************************************/
class UT2K4Tab_HudSettings extends Settings_Tabs
    dependson(Settings_Tabs)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG1;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground i_BG2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Scale;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_PreviewBG;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Preview;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Scale;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Opacity;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Red;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Green;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_Blue;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moNumericEdit nu_MsgCount;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moNumericEdit nu_MsgScale;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moNumericEdit nu_MsgOffset;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Visible;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Weapons;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Personal;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Score;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_WeaponBar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Portraits;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_VCPortraits;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_DeathMsgs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_EnemyNames;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_CustomColor;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox co_CustomHUD;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_CustomHUD;
var() bool bVis;
var() bool bWeapons;
var() bool bPersonal;
var() bool bScore;
var() bool bPortraits;
var() bool bVCPortraits;
var() bool bNames;
var() bool bCustomColor;
var() bool bNoMsgs;
var() bool bWeaponBar;
var() int iCount;
var() int iScale;
var() int iOffset;
var() float fScale;
var() float fOpacity;
var() Color cCustom;
var() FloatBox DefaultBGPos;
var() FloatBox DefaultHealthPos;
var array<GameRecord> Games;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    class'CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x28:
    // End:0x80 [While If]
    if(i < Games.Length)
    {
        // End:0x76
        if(Games[i].HUDMenu != "")
        {
            co_CustomHUD.AddItem(Games[i].GameName,, string(i));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    // End:0xab
    if(co_CustomHUD.ItemCount() == 0)
    {
        RemoveComponent(co_CustomHUD);
        RemoveComponent(b_CustomHUD);
    }
    i_BG1.ManageComponent(ch_Visible);
    i_BG1.ManageComponent(ch_EnemyNames);
    i_BG1.ManageComponent(ch_WeaponBar);
    i_BG1.ManageComponent(ch_Weapons);
    i_BG1.ManageComponent(ch_Personal);
    i_BG1.ManageComponent(ch_Score);
    i_BG1.ManageComponent(ch_Portraits);
    i_BG1.ManageComponent(ch_VCPortraits);
    i_BG1.ManageComponent(ch_DeathMsgs);
    i_BG1.ManageComponent(nu_MsgCount);
    i_BG1.ManageComponent(nu_MsgScale);
    i_BG1.ManageComponent(nu_MsgOffset);
    sl_Opacity.MySlider.bDrawPercentSign = true;
    sl_Scale.MySlider.bDrawPercentSign = true;
}

function bool InternalOnClick(GUIComponent Sender)
{
    local int i;

    // End:0x55
    if(Sender == b_CustomHUD)
    {
        i = int(co_CustomHUD.GetExtra());
        Controller.OpenMenu(Games[i].HUDMenu, Games[i].ClassName);
    }
    return true;
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local HUD H;

    H = PlayerOwner().myHUD;
    switch(Sender)
    {
        // End:0x52
        case ch_DeathMsgs:
            bNoMsgs = class'wDeathMessage'.default.bNoConsoleDeathMessages;
            ch_DeathMsgs.SetComponentValue(string(bNoMsgs), true);
            // End:0x35d
            break;
        // End:0x8b
        case ch_Visible:
            bVis = H.bHideHUD;
            ch_Visible.SetComponentValue(string(bVis), true);
            // End:0x35d
            break;
        // End:0xc4
        case ch_Weapons:
            bWeapons = H.bShowWeaponInfo;
            ch_Weapons.SetComponentValue(string(bWeapons), true);
            // End:0x35d
            break;
        // End:0xfd
        case ch_Personal:
            bPersonal = H.bShowPersonalInfo;
            ch_Personal.SetComponentValue(string(bPersonal), true);
            // End:0x35d
            break;
        // End:0x136
        case ch_Score:
            bScore = H.bShowPoints;
            ch_Score.SetComponentValue(string(bScore), true);
            // End:0x35d
            break;
        // End:0x16f
        case ch_WeaponBar:
            bWeaponBar = H.bShowWeaponBar;
            ch_WeaponBar.SetComponentValue(string(bWeaponBar), true);
            // End:0x35d
            break;
        // End:0x1a8
        case ch_Portraits:
            bPortraits = H.bShowPortrait;
            ch_Portraits.SetComponentValue(string(bPortraits), true);
            // End:0x35d
            break;
        // End:0x1e3
        case ch_EnemyNames:
            bNames = !H.bNoEnemyNames;
            ch_EnemyNames.SetComponentValue(string(bNames), true);
            // End:0x35d
            break;
        // End:0x219
        case nu_MsgCount:
            iCount = H.ConsoleMessageCount;
            nu_MsgCount.SetComponentValue(string(iCount), true);
            // End:0x35d
            break;
        // End:0x253
        case nu_MsgScale:
            iScale = 8 - H.ConsoleFontSize;
            nu_MsgScale.SetComponentValue(string(iScale), true);
            // End:0x35d
            break;
        // End:0x28d
        case nu_MsgOffset:
            iOffset = H.MessageFontOffset + 4;
            nu_MsgOffset.SetComponentValue(string(iOffset), true);
            // End:0x35d
            break;
        // End:0x2c3
        case ch_CustomColor:
            bCustomColor = UsingCustomColor();
            ch_CustomColor.SetComponentValue(string(bCustomColor), true);
            InitializeHUDColor();
            // End:0x35d
            break;
        // End:0x2fc
        case ch_VCPortraits:
            bVCPortraits = H.bShowPortraitVC;
            ch_VCPortraits.SetComponentValue(string(bVCPortraits), true);
            // End:0x35d
            break;
        // End:0xffff
        default:
            Log(string(Name) @ "Unknown component calling LoadINI:" $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
}

function InitializeHUDColor()
{
    // End:0x20
    if(bCustomColor)
    {
        cCustom = class'HudBase'.default.CustomHUDColor;
    }
    // End:0x59
    else
    {
        cCustom = GetDefaultColor();
        sl_Red.DisableMe();
        sl_Blue.DisableMe();
        sl_Green.DisableMe();
    }
    fScale = PlayerOwner().myHUD.HudScale * float(100);
    fOpacity = PlayerOwner().myHUD.HudOpacity / float(255) * float(100);
    sl_Scale.SetValue(fScale);
    sl_Opacity.SetValue(fOpacity);
    sl_Red.SetValue(float(cCustom.R));
    sl_Blue.SetValue(float(cCustom.B));
    sl_Green.SetValue(float(cCustom.G));
    UpdatePreviewColor();
}

function bool UsingCustomColor()
{
    // End:0x52
    if(PlayerOwner() != none && PlayerOwner().myHUD != none && HudBase(PlayerOwner().myHUD) != none)
    {
        return HudBase(PlayerOwner().myHUD).bUsingCustomHUDColor;
    }
    return class'HudBase'.default.CustomHUDColor.R != 0 || class'HudBase'.default.CustomHUDColor.B != 0 || class'HudBase'.default.CustomHUDColor.G != 0 || class'HudBase'.default.CustomHUDColor.A != 0;
}

function Color GetDefaultColor()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x5c
    if(PC.PlayerReplicationInfo == none || PC.PlayerReplicationInfo.Team == none)
    {
        i = int(PC.GetUrlOption("Team"));
    }
    // End:0x82
    else
    {
        i = PC.PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0xc0
    if(HudBase(PC.myHUD) != none)
    {
        return HudBase(PC.myHUD).GetTeamColor(byte(i));
    }
    return class'HudBase'.static.GetTeamColor(byte(i));
}

function SaveSettings()
{
    local PlayerController PC;
    local HUD H;
    local bool bSave;

    super.SaveSettings();
    PC = PlayerOwner();
    H = PC.myHUD;
    // End:0x5b
    if(H.bHideHUD != bVis)
    {
        H.bHideHUD = bVis;
        bSave = true;
    }
    // End:0x93
    if(H.bShowWeaponInfo != bWeapons)
    {
        H.bShowWeaponInfo = bWeapons;
        bSave = true;
    }
    // End:0xcb
    if(H.bShowPersonalInfo != bPersonal)
    {
        H.bShowPersonalInfo = bPersonal;
        bSave = true;
    }
    // End:0x103
    if(H.bShowPoints != bScore)
    {
        H.bShowPoints = bScore;
        bSave = true;
    }
    // End:0x13b
    if(H.bShowWeaponBar != bWeaponBar)
    {
        H.bShowWeaponBar = bWeaponBar;
        bSave = true;
    }
    // End:0x173
    if(H.bShowPortrait != bPortraits)
    {
        H.bShowPortrait = bPortraits;
        bSave = true;
    }
    // End:0x1ab
    if(H.bShowPortraitVC != bVCPortraits)
    {
        H.bShowPortraitVC = bVCPortraits;
        bSave = true;
    }
    // End:0x1e5
    if(H.bNoEnemyNames == bNames)
    {
        H.bNoEnemyNames = !bNames;
        bSave = true;
    }
    // End:0x219
    if(H.ConsoleMessageCount != iCount)
    {
        H.ConsoleMessageCount = iCount;
        bSave = true;
    }
    // End:0x261
    if(float(H.ConsoleFontSize) != Abs(float(iScale - 8)))
    {
        H.ConsoleFontSize = int(Abs(float(iScale - 8)));
        bSave = true;
    }
    // End:0x29d
    if(H.MessageFontOffset != iOffset - 4)
    {
        H.MessageFontOffset = iOffset - 4;
        bSave = true;
    }
    // End:0x2df
    if(H.HudScale != fScale / 100.0)
    {
        H.HudScale = fScale / 100.0;
        bSave = true;
    }
    // End:0x32f
    if(H.HudOpacity != fOpacity / 100.0 * 255.0)
    {
        H.HudOpacity = fOpacity / 100.0 * 255.0;
        bSave = true;
    }
    // End:0x362
    if(HudBase(H) != none)
    {
        // End:0x35f
        if(SaveCustomHUDColor() || bSave)
        {
            H.SaveConfig();
        }
    }
    // End:0x37d
    else
    {
        // End:0x377
        if(bSave)
        {
            H.SaveConfig();
        }
        SaveCustomHUDColor();
    }
    // End:0x3bc
    if(class'wDeathMessage'.default.bNoConsoleDeathMessages != bNoMsgs)
    {
        class'wDeathMessage'.default.bNoConsoleDeathMessages = bNoMsgs;
        class'wDeathMessage'.static.StaticSaveConfig();
    }
}

function ResetClicked()
{
    local int i;

    super.ResetClicked();
    class'HUD'.static.ResetConfig("bHideHUD");
    class'HUD'.static.ResetConfig("bShowWeaponInfo");
    class'HUD'.static.ResetConfig("bShowPersonalInfo");
    class'HUD'.static.ResetConfig("bShowPoints");
    class'HUD'.static.ResetConfig("bShowWeaponBar");
    class'HUD'.static.ResetConfig("bShowPortrait");
    class'HUD'.static.ResetConfig("bShowPortraitVC");
    class'HUD'.static.ResetConfig("bNoEnemyNames");
    class'HUD'.static.ResetConfig("ConsoleMessageCount");
    class'HUD'.static.ResetConfig("ConsoleFontSize");
    class'HUD'.static.ResetConfig("MessageFontOffset");
    class'HUD'.static.ResetConfig("HudScale");
    class'HUD'.static.ResetConfig("HudOpacity");
    class'HudBase'.static.ResetConfig("CustomHudColor");
    class'wDeathMessage'.static.ResetConfig("bNoConsoleDeathMessages");
    i = 0;
    J0x1e0:
    // End:0x210 [While If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e0;
    }
}

function bool SaveCustomHUDColor()
{
    local Color temp;
    local HudBase Base;

    Base = HudBase(PlayerOwner().myHUD);
    // End:0xb1
    if(Base != none)
    {
        // End:0x6e
        if(bCustomColor)
        {
            // End:0x6b
            if(Base.CustomHUDColor != cCustom)
            {
                Base.CustomHUDColor = cCustom;
                Base.SetCustomHUDColor();
                return true;
            }
        }
        // End:0xae
        else
        {
            // End:0xae
            if(Base.CustomHUDColor != temp)
            {
                Base.CustomHUDColor = temp;
                Base.SetCustomHUDColor();
                return true;
            }
        }
    }
    // End:0x13d
    else
    {
        // End:0xfd
        if(bCustomColor)
        {
            // End:0xfa
            if(class'HudBase'.default.CustomHUDColor != cCustom)
            {
                class'HudBase'.default.CustomHUDColor = cCustom;
                class'HudBase'.static.StaticSaveConfig();
                return false;
            }
        }
        // End:0x13d
        else
        {
            // End:0x13d
            if(class'HudBase'.default.CustomHUDColor != temp)
            {
                class'HudBase'.default.CustomHUDColor = temp;
                class'HudBase'.static.StaticSaveConfig();
                return false;
            }
        }
    }
    return false;
}

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    switch(Sender)
    {
        // End:0x33
        case ch_Visible:
            bVis = ch_Visible.IsChecked();
            // End:0x29e
            break;
        // End:0x54
        case ch_Weapons:
            bWeapons = ch_Weapons.IsChecked();
            // End:0x29e
            break;
        // End:0x75
        case ch_Personal:
            bPersonal = ch_Personal.IsChecked();
            // End:0x29e
            break;
        // End:0x96
        case ch_Score:
            bScore = ch_Score.IsChecked();
            // End:0x29e
            break;
        // End:0xb7
        case ch_WeaponBar:
            bWeaponBar = ch_WeaponBar.IsChecked();
            // End:0x29e
            break;
        // End:0xd8
        case ch_DeathMsgs:
            bNoMsgs = ch_DeathMsgs.IsChecked();
            // End:0x29e
            break;
        // End:0xf9
        case ch_Portraits:
            bPortraits = ch_Portraits.IsChecked();
            // End:0x29e
            break;
        // End:0x11a
        case ch_VCPortraits:
            bVCPortraits = ch_VCPortraits.IsChecked();
            // End:0x29e
            break;
        // End:0x13b
        case ch_EnemyNames:
            bNames = ch_EnemyNames.IsChecked();
            // End:0x29e
            break;
        // End:0x15b
        case nu_MsgCount:
            iCount = nu_MsgCount.GetValue();
            // End:0x29e
            break;
        // End:0x17b
        case nu_MsgScale:
            iScale = nu_MsgScale.GetValue();
            // End:0x29e
            break;
        // End:0x19b
        case nu_MsgOffset:
            iOffset = nu_MsgOffset.GetValue();
            // End:0x29e
            break;
        // End:0x1c1
        case sl_Scale:
            fScale = sl_Scale.GetValue();
            UpdatePreviewColor();
            // End:0x29e
            break;
        // End:0x1e7
        case sl_Opacity:
            fOpacity = sl_Opacity.GetValue();
            UpdatePreviewColor();
            // End:0x29e
            break;
        // End:0x214
        case ch_CustomColor:
            bCustomColor = ch_CustomColor.IsChecked();
            ChangeCustomStatus();
            UpdatePreviewColor();
            // End:0x29e
            break;
        // End:0x241
        case sl_Red:
            cCustom.R = byte(sl_Red.GetValue());
            UpdatePreviewColor();
            // End:0x29e
            break;
        // End:0x26e
        case sl_Blue:
            cCustom.B = byte(sl_Blue.GetValue());
            UpdatePreviewColor();
            // End:0x29e
            break;
        // End:0x29b
        case sl_Green:
            cCustom.G = byte(sl_Green.GetValue());
            UpdatePreviewColor();
            // End:0x29e
            break;
        // End:0xffff
        default:
}

function ChangeCustomStatus()
{
    // End:0x8d
    if(bCustomColor)
    {
        sl_Red.EnableMe();
        sl_Blue.EnableMe();
        sl_Green.EnableMe();
        cCustom.R = byte(sl_Red.GetValue());
        cCustom.G = byte(sl_Green.GetValue());
        cCustom.B = byte(sl_Blue.GetValue());
    }
    // End:0xc6
    else
    {
        sl_Red.DisableMe();
        sl_Blue.DisableMe();
        sl_Green.DisableMe();
        cCustom = GetDefaultColor();
    }
}

function UpdatePreviewColor()
{
    local float o, S;

    i_PreviewBG.ImageColor = cCustom;
    o = 255.0 * fOpacity / 100.0;
    i_PreviewBG.ImageColor.A = byte(o);
    i_Preview.ImageColor.A = byte(o);
    S = fScale / 100.0;
    i_PreviewBG.WinWidth = DefaultBGPos.X2 * S;
    i_PreviewBG.WinHeight = DefaultBGPos.Y2 * S;
    i_Preview.WinWidth = DefaultHealthPos.X2 * S;
    i_Preview.WinHeight = DefaultHealthPos.Y2 * S;
    i_Scale.WinWidth = i_PreviewBG.WinWidth;
    i_Scale.WinHeight = i_PreviewBG.WinHeight;
}

defaultproperties
{
    begin object name=GameBK class=GUISectionBackground
        Caption="??"
        WinTop=0.0576040
        WinLeft=0.0317970
        WinWidth=0.4486330
        WinHeight=0.9014850
        RenderWeight=0.0010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_HudSettings.GameBK'
    i_BG1=GameBK
    begin object name=GameBK1 class=GUISectionBackground
        Caption="???"
        WinTop=0.0602080
        WinLeft=0.5175780
        WinWidth=0.4486330
        WinHeight=0.9014850
        RenderWeight=0.0010
        OnPreDraw=InternalPreDraw
    object end
    // Reference: GUISectionBackground'UT2K4Tab_HudSettings.GameBK1'
    i_BG2=GameBK1
    begin object name=PreviewBK class=GUIImage
        ImageStyle=2
        ImageAlign=1
        WinTop=0.2117130
        WinLeft=0.7493350
        WinWidth=0.1634370
        WinHeight=0.1217970
        RenderWeight=1.0010
    object end
    // Reference: GUIImage'UT2K4Tab_HudSettings.PreviewBK'
    i_Scale=PreviewBK
    begin object name=PreviewBackground class=GUIImage
        ImageStyle=2
        ImageAlign=1
        X1=0
        Y1=110
        X2=166
        Y2=163
        WinTop=0.2117130
        WinLeft=0.7493350
        WinWidth=0.1634370
        WinHeight=0.1217970
        RenderWeight=1.0020
    object end
    // Reference: GUIImage'UT2K4Tab_HudSettings.PreviewBackground'
    i_PreviewBG=PreviewBackground
    begin object name=Preview class=GUIImage
        ImageStyle=2
        ImageAlign=1
        X1=74
        Y1=165
        X2=123
        Y2=216
        WinTop=0.2115590
        WinLeft=0.7498280
        WinWidth=0.0632410
        WinHeight=0.0995310
        RenderWeight=1.0030
    object end
    // Reference: GUIImage'UT2K4Tab_HudSettings.Preview'
    i_Preview=Preview
    begin object name=GameHudScale class=moSlider
        MaxValue=100.0
        MinValue=50.0
        LabelJustification=1
        ComponentJustification=0
        CaptionWidth=0.450
        Caption="HUD ??"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=InternalOnCreateComponent
        Hint="HUD ??? ??? ?????. "
        WinTop=0.309670
        WinLeft=0.5553130
        WinWidth=0.3737490
        TabOrder=12
        OnChange=InternalOnChange
    object end
    // Reference: moSlider'UT2K4Tab_HudSettings.GameHudScale'
    sl_Scale=GameHudScale
    begin object name=GameHudOpacity class=moSlider
        MaxValue=100.0
        MinValue=51.0
        LabelJustification=1
        ComponentJustification=0
        CaptionWidth=0.450
        Caption="HUD ????"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=InternalOnCreateComponent
        Hint="HUD ??? ???? ?????."
        WinTop=0.3617530
        WinLeft=0.5553130
        WinWidth=0.3737490
        TabOrder=13
        OnChange=InternalOnChange
    object end
    // Reference: moSlider'UT2K4Tab_HudSettings.GameHudOpacity'
    sl_Opacity=GameHudOpacity
    begin object name=HudColorR class=moSlider
        MaxValue=255.0
        bIntSlider=true
        CaptionWidth=0.350
        Caption="???:"
        LabelColor=(R=255,G=0,B=0,A=255)
        OnCreateComponent=InternalOnCreateComponent
        Hint="HUD ??? ???? ??? ?????."
        WinTop=0.5729170
        WinLeft=0.610
        WinWidth=0.2721870
        TabOrder=15
        OnChange=InternalOnChange
    object end
    // Reference: moSlider'UT2K4Tab_HudSettings.HudColorR'
    sl_Red=HudColorR
    begin object name=HudColorG class=moSlider
        MaxValue=255.0
        bIntSlider=true
        CaptionWidth=0.350
        Caption="??:"
        LabelColor=(R=0,G=255,B=0,A=255)
        OnCreateComponent=InternalOnCreateComponent
        Hint="HUD ??? ??? ??? ?????."
        WinTop=0.6604170
        WinLeft=0.610
        WinWidth=0.2721870
        TabOrder=17
        OnChange=InternalOnChange
    object end
    // Reference: moSlider'UT2K4Tab_HudSettings.HudColorG'
    sl_Green=HudColorG
    begin object name=HudColorB class=moSlider
        MaxValue=255.0
        bIntSlider=true
        CaptionWidth=0.350
        Caption="???: "
        LabelColor=(R=0,G=0,B=255,A=255)
        OnCreateComponent=InternalOnCreateComponent
        Hint="HUD ??? ???? ??? ?????."
        WinTop=0.75250
        WinLeft=0.610
        WinWidth=0.2721870
        TabOrder=16
        OnChange=InternalOnChange
    object end
    // Reference: moSlider'UT2K4Tab_HudSettings.HudColorB'
    sl_Blue=HudColorB
    begin object name=GameHudMessageCount class=moNumericEdit
        MinValue=0
        MaxValue=8
        ComponentJustification=0
        CaptionWidth=0.70
        Caption="?? ?? ?? ?"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ?? ?? ?? ??? ? ?? ?????."
        WinTop=0.1968750
        WinLeft=0.5507810
        WinWidth=0.381250
        TabOrder=9
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moNumericEdit'UT2K4Tab_HudSettings.GameHudMessageCount'
    nu_MsgCount=GameHudMessageCount
    begin object name=GameHudMessageScale class=moNumericEdit
        MinValue=0
        MaxValue=8
        ComponentJustification=0
        CaptionWidth=0.70
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ???? ?? ??? ?????."
        WinTop=0.3218740
        WinLeft=0.5507810
        WinWidth=0.381250
        TabOrder=10
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moNumericEdit'UT2K4Tab_HudSettings.GameHudMessageScale'
    nu_MsgScale=GameHudMessageScale
    begin object name=GameHudMessageOffset class=moNumericEdit
        MinValue=0
        MaxValue=4
        ComponentJustification=0
        CaptionWidth=0.70
        Caption="??? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ???? ?? ??? ?????."
        WinTop=0.4364570
        WinLeft=0.5507810
        WinWidth=0.381250
        TabOrder=11
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moNumericEdit'UT2K4Tab_HudSettings.GameHudMessageOffset'
    nu_MsgOffset=GameHudMessageOffset
    begin object name=GameHudVisible class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="HUD ?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="HUD ??? ???? ??? ???."
        WinTop=0.0439060
        WinLeft=0.3792970
        WinWidth=0.1968750
        TabOrder=0
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHudVisible'
    ch_Visible=GameHudVisible
    begin object name=GameHudShowWeaponInfo class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? ??? ?? ???? ?????."
        WinTop=0.1819270
        WinLeft=0.050
        WinWidth=0.3781250
        TabOrder=3
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHudShowWeaponInfo'
    ch_Weapons=GameHudShowWeaponInfo
    begin object name=GameHudShowPersonalInfo class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="HUD ?? ?? ??? ????? ?????."
        WinTop=0.3173430
        WinLeft=0.050
        WinWidth=0.3781250
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHudShowPersonalInfo'
    ch_Personal=GameHudShowPersonalInfo
    begin object name=GameHudShowScore class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? HUD ???? ???? ?????."
        WinTop=0.452760
        WinLeft=0.050
        WinWidth=0.3781250
        TabOrder=5
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHudShowScore'
    ch_Score=GameHudShowScore
    begin object name=GameHudShowWeaponBar class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="?? ? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="HUD ???? ?? ??  ?????."
        WinTop=0.5985930
        WinLeft=0.050
        WinWidth=0.3781250
        TabOrder=2
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHudShowWeaponBar'
    ch_WeaponBar=GameHudShowWeaponBar
    begin object name=GameHudShowPortraits class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ???? ?? ? ???? ?????? ?????."
        WinTop=0.7235940
        WinLeft=0.050
        WinWidth=0.3781250
        TabOrder=6
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHudShowPortraits'
    ch_Portraits=GameHudShowPortraits
    begin object name=GameHUDShowVCPortraits class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="VoIP ?? ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?? ???? ?? ??? ?????? ?????."
        WinTop=0.7235940
        WinLeft=0.050
        WinWidth=0.3781250
        TabOrder=7
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHUDShowVCPortraits'
    ch_VCPortraits=GameHUDShowVCPortraits
    begin object name=GameDeathMsgs class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="??? ?? ???? ?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="??? ??? ???? ???? ???? ??? ?????."
        WinTop=0.8475530
        WinLeft=0.047460
        WinWidth=0.4037110
        TabOrder=8
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameDeathMsgs'
    ch_DeathMsgs=GameDeathMsgs
    begin object name=GameHudShowEnemyNames class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?? ?? ??? ?????."
        WinTop=0.8485940
        WinLeft=0.050
        WinWidth=0.3781250
        TabOrder=1
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.GameHudShowEnemyNames'
    ch_EnemyNames=GameHudShowEnemyNames
    begin object name=CustomHUDColor class=moCheckBox
        ComponentJustification=0
        CaptionWidth=0.90
        Caption="HUD ?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? Hud? ??? ? ???? ?? ??? ??? ? ????."
        WinTop=0.4814060
        WinLeft=0.5553130
        WinWidth=0.3737490
        TabOrder=14
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'UT2K4Tab_HudSettings.CustomHUDColor'
    ch_CustomColor=CustomHUDColor
    begin object name=CustomHUDSelect class=GUIComboBox
        bReadOnly=true
        Hint="????? ????? ????, ?? ????? ?? ?? ??? ?????."
        WinTop=0.8787220
        WinLeft=0.5535790
        WinWidth=0.2278630
        WinHeight=0.030
        TabOrder=18
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'UT2K4Tab_HudSettings.CustomHUDSelect'
    co_CustomHUD=CustomHUDSelect
    begin object name=CustomHUDButton class=GUIButton
        Caption="??"
        Hint="?? ?????? ??? ??? ?? HUD? ??? ? ?? ?????."
        WinTop=0.8690320
        WinLeft=0.7927370
        WinWidth=0.1385770
        WinHeight=0.050
        TabOrder=19
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4Tab_HudSettings.CustomHUDButton'
    b_CustomHUD=CustomHUDButton
    DefaultBGPos=(X1=0.7493350,Y1=0.1674880,X2=0.1634370,Y2=0.1217970)
    DefaultHealthPos=(X1=0.7481640,Y1=0.1695720,X2=0.0632410,Y2=0.0995310)
    PanelCaption="HUD"
    WinTop=0.150
    WinHeight=0.740
}