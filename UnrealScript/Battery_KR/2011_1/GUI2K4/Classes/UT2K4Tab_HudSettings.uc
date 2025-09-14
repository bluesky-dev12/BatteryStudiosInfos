class UT2K4Tab_HudSettings extends Settings_Tabs
    editinlinenew
    instanced;

var() automated GUISectionBackground i_BG1;
var() automated GUISectionBackground i_BG2;
var() automated GUIImage i_Scale;
var() automated GUIImage i_PreviewBG;
var() automated GUIImage i_Preview;
var() automated moSlider sl_Scale;
var() automated moSlider sl_Opacity;
var() automated moSlider sl_Red;
var() automated moSlider sl_Green;
var() automated moSlider sl_Blue;
var() automated moNumericEdit nu_MsgCount;
var() automated moNumericEdit nu_MsgScale;
var() automated moNumericEdit nu_MsgOffset;
var() automated moCheckBox ch_Visible;
var() automated moCheckBox ch_Weapons;
var() automated moCheckBox ch_Personal;
var() automated moCheckBox ch_Score;
var() automated moCheckBox ch_WeaponBar;
var() automated moCheckBox ch_Portraits;
var() automated moCheckBox ch_VCPortraits;
var() automated moCheckBox ch_DeathMsgs;
var() automated moCheckBox ch_EnemyNames;
var() automated moCheckBox ch_CustomColor;
var() automated GUIComboBox co_CustomHUD;
var() automated GUIButton b_CustomHUD;
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
    Class'Engine.CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x28:

    // End:0x80 [Loop If]
    if(i < Games.Length)
    {
        // End:0x76
        if(Games[i].HUDMenu != "")
        {
            co_CustomHUD.AddItem(Games[i].GameName,, string(i));
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    // End:0xAB
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
    //return;    
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
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local HUD H;

    H = PlayerOwner().myHUD;
    switch(Sender)
    {
        // End:0x52
        case ch_DeathMsgs:
            bNoMsgs = Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages;
            ch_DeathMsgs.SetComponentValue(string(bNoMsgs), true);
            // End:0x35D
            break;
        // End:0x8B
        case ch_Visible:
            bVis = H.bHideHUD;
            ch_Visible.SetComponentValue(string(bVis), true);
            // End:0x35D
            break;
        // End:0xC4
        case ch_Weapons:
            bWeapons = H.bShowWeaponInfo;
            ch_Weapons.SetComponentValue(string(bWeapons), true);
            // End:0x35D
            break;
        // End:0xFD
        case ch_Personal:
            bPersonal = H.bShowPersonalInfo;
            ch_Personal.SetComponentValue(string(bPersonal), true);
            // End:0x35D
            break;
        // End:0x136
        case ch_Score:
            bScore = H.bShowPoints;
            ch_Score.SetComponentValue(string(bScore), true);
            // End:0x35D
            break;
        // End:0x16F
        case ch_WeaponBar:
            bWeaponBar = H.bShowWeaponBar;
            ch_WeaponBar.SetComponentValue(string(bWeaponBar), true);
            // End:0x35D
            break;
        // End:0x1A8
        case ch_Portraits:
            bPortraits = H.bShowPortrait;
            ch_Portraits.SetComponentValue(string(bPortraits), true);
            // End:0x35D
            break;
        // End:0x1E3
        case ch_EnemyNames:
            bNames = !H.bNoEnemyNames;
            ch_EnemyNames.SetComponentValue(string(bNames), true);
            // End:0x35D
            break;
        // End:0x219
        case nu_MsgCount:
            iCount = H.ConsoleMessageCount;
            nu_MsgCount.SetComponentValue(string(iCount), true);
            // End:0x35D
            break;
        // End:0x253
        case nu_MsgScale:
            iScale = 8 - H.ConsoleFontSize;
            nu_MsgScale.SetComponentValue(string(iScale), true);
            // End:0x35D
            break;
        // End:0x28D
        case nu_MsgOffset:
            iOffset = H.MessageFontOffset + 4;
            nu_MsgOffset.SetComponentValue(string(iOffset), true);
            // End:0x35D
            break;
        // End:0x2C3
        case ch_CustomColor:
            bCustomColor = UsingCustomColor();
            ch_CustomColor.SetComponentValue(string(bCustomColor), true);
            InitializeHUDColor();
            // End:0x35D
            break;
        // End:0x2FC
        case ch_VCPortraits:
            bVCPortraits = H.bShowPortraitVC;
            ch_VCPortraits.SetComponentValue(string(bVCPortraits), true);
            // End:0x35D
            break;
        // End:0xFFFF
        default:
            Log((string(Name) @ "Unknown component calling LoadINI:") $ GUIMenuOption(Sender).Caption);
            GUIMenuOption(Sender).SetComponentValue(S, true);
            break;
    }
    //return;    
}

function InitializeHUDColor()
{
    // End:0x20
    if(bCustomColor)
    {
        cCustom = Class'XInterface.HudBase'.default.CustomHUDColor;        
    }
    else
    {
        cCustom = GetDefaultColor();
        sl_Red.DisableMe();
        sl_Blue.DisableMe();
        sl_Green.DisableMe();
    }
    fScale = PlayerOwner().myHUD.HudScale * float(100);
    fOpacity = (PlayerOwner().myHUD.HudOpacity / float(255)) * float(100);
    sl_Scale.SetValue(fScale);
    sl_Opacity.SetValue(fOpacity);
    sl_Red.SetValue(float(cCustom.R));
    sl_Blue.SetValue(float(cCustom.B));
    sl_Green.SetValue(float(cCustom.G));
    UpdatePreviewColor();
    //return;    
}

function bool UsingCustomColor()
{
    // End:0x52
    if(((PlayerOwner() != none) && PlayerOwner().myHUD != none) && HudBase(PlayerOwner().myHUD) != none)
    {
        return HudBase(PlayerOwner().myHUD).bUsingCustomHUDColor;
    }
    return (((int(Class'XInterface.HudBase'.default.CustomHUDColor.R) != 0) || int(Class'XInterface.HudBase'.default.CustomHUDColor.B) != 0) || int(Class'XInterface.HudBase'.default.CustomHUDColor.G) != 0) || int(Class'XInterface.HudBase'.default.CustomHUDColor.A) != 0;
    //return;    
}

function Color GetDefaultColor()
{
    local int i;
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x5C
    if((PC.PlayerReplicationInfo == none) || PC.PlayerReplicationInfo.Team == none)
    {
        i = int(PC.GetUrlOption("Team"));        
    }
    else
    {
        i = PC.PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0xC0
    if(HudBase(PC.myHUD) != none)
    {
        return HudBase(PC.myHUD).GetTeamColor(byte(i));
    }
    return Class'XInterface.HudBase'.static.GetTeamColor(byte(i));
    //return;    
}

function SaveSettings()
{
    local PlayerController PC;
    local HUD H;
    local bool bSave;

    super.SaveSettings();
    PC = PlayerOwner();
    H = PC.myHUD;
    // End:0x5B
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
    // End:0xCB
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
    // End:0x13B
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
    // End:0x1AB
    if(H.bShowPortraitVC != bVCPortraits)
    {
        H.bShowPortraitVC = bVCPortraits;
        bSave = true;
    }
    // End:0x1E5
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
    // End:0x29D
    if(H.MessageFontOffset != (iOffset - 4))
    {
        H.MessageFontOffset = iOffset - 4;
        bSave = true;
    }
    // End:0x2DF
    if(H.HudScale != (fScale / 100.0000000))
    {
        H.HudScale = fScale / 100.0000000;
        bSave = true;
    }
    // End:0x32F
    if(H.HudOpacity != ((fOpacity / 100.0000000) * 255.0000000))
    {
        H.HudOpacity = (fOpacity / 100.0000000) * 255.0000000;
        bSave = true;
    }
    // End:0x362
    if(HudBase(H) != none)
    {
        // End:0x35F
        if((SaveCustomHUDColor()) || bSave)
        {
            H.SaveConfig();
        }        
    }
    else
    {
        // End:0x377
        if(bSave)
        {
            H.SaveConfig();
        }
        SaveCustomHUDColor();
    }
    // End:0x3BC
    if(Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages != bNoMsgs)
    {
        Class'WGame.wDeathMessage'.default.bNoConsoleDeathMessages = bNoMsgs;
        Class'WGame.wDeathMessage'.static.StaticSaveConfig();
    }
    //return;    
}

function ResetClicked()
{
    local int i;

    super.ResetClicked();
    Class'Engine.HUD'.static.ResetConfig("bHideHUD");
    Class'Engine.HUD'.static.ResetConfig("bShowWeaponInfo");
    Class'Engine.HUD'.static.ResetConfig("bShowPersonalInfo");
    Class'Engine.HUD'.static.ResetConfig("bShowPoints");
    Class'Engine.HUD'.static.ResetConfig("bShowWeaponBar");
    Class'Engine.HUD'.static.ResetConfig("bShowPortrait");
    Class'Engine.HUD'.static.ResetConfig("bShowPortraitVC");
    Class'Engine.HUD'.static.ResetConfig("bNoEnemyNames");
    Class'Engine.HUD'.static.ResetConfig("ConsoleMessageCount");
    Class'Engine.HUD'.static.ResetConfig("ConsoleFontSize");
    Class'Engine.HUD'.static.ResetConfig("MessageFontOffset");
    Class'Engine.HUD'.static.ResetConfig("HudScale");
    Class'Engine.HUD'.static.ResetConfig("HudOpacity");
    Class'XInterface.HudBase'.static.ResetConfig("CustomHudColor");
    Class'WGame.wDeathMessage'.static.ResetConfig("bNoConsoleDeathMessages");
    i = 0;
    J0x1E0:

    // End:0x210 [Loop If]
    if(i < Components.Length)
    {
        Components[i].LoadINI();
        i++;
        // [Loop Continue]
        goto J0x1E0;
    }
    //return;    
}

function bool SaveCustomHUDColor()
{
    local Color Temp;
    local HudBase Base;

    Base = HudBase(PlayerOwner().myHUD);
    // End:0xB1
    if(Base != none)
    {
        // End:0x6E
        if(bCustomColor)
        {
            // End:0x6B
            if(Base.CustomHUDColor != cCustom)
            {
                Base.CustomHUDColor = cCustom;
                Base.SetCustomHUDColor();
                return true;
            }            
        }
        else
        {
            // End:0xAE
            if(Base.CustomHUDColor != Temp)
            {
                Base.CustomHUDColor = Temp;
                Base.SetCustomHUDColor();
                return true;
            }
        }        
    }
    else
    {
        // End:0xFD
        if(bCustomColor)
        {
            // End:0xFA
            if(Class'XInterface.HudBase'.default.CustomHUDColor != cCustom)
            {
                Class'XInterface.HudBase'.default.CustomHUDColor = cCustom;
                Class'XInterface.HudBase'.static.StaticSaveConfig();
                return false;
            }            
        }
        else
        {
            // End:0x13D
            if(Class'XInterface.HudBase'.default.CustomHUDColor != Temp)
            {
                Class'XInterface.HudBase'.default.CustomHUDColor = Temp;
                Class'XInterface.HudBase'.static.StaticSaveConfig();
                return false;
            }
        }
    }
    return false;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    switch(Sender)
    {
        // End:0x33
        case ch_Visible:
            bVis = ch_Visible.IsChecked();
            // End:0x29E
            break;
        // End:0x54
        case ch_Weapons:
            bWeapons = ch_Weapons.IsChecked();
            // End:0x29E
            break;
        // End:0x75
        case ch_Personal:
            bPersonal = ch_Personal.IsChecked();
            // End:0x29E
            break;
        // End:0x96
        case ch_Score:
            bScore = ch_Score.IsChecked();
            // End:0x29E
            break;
        // End:0xB7
        case ch_WeaponBar:
            bWeaponBar = ch_WeaponBar.IsChecked();
            // End:0x29E
            break;
        // End:0xD8
        case ch_DeathMsgs:
            bNoMsgs = ch_DeathMsgs.IsChecked();
            // End:0x29E
            break;
        // End:0xF9
        case ch_Portraits:
            bPortraits = ch_Portraits.IsChecked();
            // End:0x29E
            break;
        // End:0x11A
        case ch_VCPortraits:
            bVCPortraits = ch_VCPortraits.IsChecked();
            // End:0x29E
            break;
        // End:0x13B
        case ch_EnemyNames:
            bNames = ch_EnemyNames.IsChecked();
            // End:0x29E
            break;
        // End:0x15B
        case nu_MsgCount:
            iCount = nu_MsgCount.GetValue();
            // End:0x29E
            break;
        // End:0x17B
        case nu_MsgScale:
            iScale = nu_MsgScale.GetValue();
            // End:0x29E
            break;
        // End:0x19B
        case nu_MsgOffset:
            iOffset = nu_MsgOffset.GetValue();
            // End:0x29E
            break;
        // End:0x1C1
        case sl_Scale:
            fScale = sl_Scale.GetValue();
            UpdatePreviewColor();
            // End:0x29E
            break;
        // End:0x1E7
        case sl_Opacity:
            fOpacity = sl_Opacity.GetValue();
            UpdatePreviewColor();
            // End:0x29E
            break;
        // End:0x214
        case ch_CustomColor:
            bCustomColor = ch_CustomColor.IsChecked();
            ChangeCustomStatus();
            UpdatePreviewColor();
            // End:0x29E
            break;
        // End:0x241
        case sl_Red:
            cCustom.R = byte(sl_Red.GetValue());
            UpdatePreviewColor();
            // End:0x29E
            break;
        // End:0x26E
        case sl_Blue:
            cCustom.B = byte(sl_Blue.GetValue());
            UpdatePreviewColor();
            // End:0x29E
            break;
        // End:0x29B
        case sl_Green:
            cCustom.G = byte(sl_Green.GetValue());
            UpdatePreviewColor();
            // End:0x29E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ChangeCustomStatus()
{
    // End:0x8D
    if(bCustomColor)
    {
        sl_Red.EnableMe();
        sl_Blue.EnableMe();
        sl_Green.EnableMe();
        cCustom.R = byte(sl_Red.GetValue());
        cCustom.G = byte(sl_Green.GetValue());
        cCustom.B = byte(sl_Blue.GetValue());        
    }
    else
    {
        sl_Red.DisableMe();
        sl_Blue.DisableMe();
        sl_Green.DisableMe();
        cCustom = GetDefaultColor();
    }
    //return;    
}

function UpdatePreviewColor()
{
    local float o, S;

    i_PreviewBG.ImageColor = cCustom;
    o = 255.0000000 * (fOpacity / 100.0000000);
    i_PreviewBG.ImageColor.A = byte(o);
    i_Preview.ImageColor.A = byte(o);
    S = fScale / 100.0000000;
    i_PreviewBG.WinWidth = DefaultBGPos.X2 * S;
    i_PreviewBG.WinHeight = DefaultBGPos.Y2 * S;
    i_Preview.WinWidth = DefaultHealthPos.X2 * S;
    i_Preview.WinHeight = DefaultHealthPos.Y2 * S;
    i_Scale.WinWidth = i_PreviewBG.WinWidth;
    i_Scale.WinHeight = i_PreviewBG.WinHeight;
    //return;    
}

defaultproperties
{
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameBK'
    begin object name="GameBK" class=XInterface.GUISectionBackground
        Caption="??"
        WinTop=0.0576040
        WinLeft=0.0317970
        WinWidth=0.4486330
        WinHeight=0.9014850
        RenderWeight=0.0010000
        OnPreDraw=GameBK.InternalPreDraw
    end object
    i_BG1=GameBK
    // Reference: GUISectionBackground'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameBK1'
    begin object name="GameBK1" class=XInterface.GUISectionBackground
        Caption="???"
        WinTop=0.0602080
        WinLeft=0.5175780
        WinWidth=0.4486330
        WinHeight=0.9014850
        RenderWeight=0.0010000
        OnPreDraw=GameBK1.InternalPreDraw
    end object
    i_BG2=GameBK1
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_HudSettings.PreviewBK'
    begin object name="PreviewBK" class=XInterface.GUIImage
        ImageStyle=2
        ImageAlign=1
        WinTop=0.2117130
        WinLeft=0.7493350
        WinWidth=0.1634370
        WinHeight=0.1217970
        RenderWeight=1.0010000
    end object
    i_Scale=PreviewBK
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_HudSettings.PreviewBackground'
    begin object name="PreviewBackground" class=XInterface.GUIImage
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
        RenderWeight=1.0020000
    end object
    i_PreviewBG=PreviewBackground
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4Tab_HudSettings.Preview'
    begin object name="Preview" class=XInterface.GUIImage
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
        RenderWeight=1.0030000
    end object
    i_Preview=Preview
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudScale'
    begin object name="GameHudScale" class=XInterface.moSlider
        MaxValue=100.0000000
        MinValue=50.0000000
        LabelJustification=1
        ComponentJustification=0
        CaptionWidth=0.4500000
        Caption="HUD ??"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=GameHudScale.InternalOnCreateComponent
        Hint="HUD ??? ??? ?????. "
        WinTop=0.3096700
        WinLeft=0.5553130
        WinWidth=0.3737490
        TabOrder=12
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
    end object
    sl_Scale=GameHudScale
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudOpacity'
    begin object name="GameHudOpacity" class=XInterface.moSlider
        MaxValue=100.0000000
        MinValue=51.0000000
        LabelJustification=1
        ComponentJustification=0
        CaptionWidth=0.4500000
        Caption="HUD ????"
        LabelColor=(R=255,G=255,B=255,A=255)
        OnCreateComponent=GameHudOpacity.InternalOnCreateComponent
        Hint="HUD ??? ???? ?????."
        WinTop=0.3617530
        WinLeft=0.5553130
        WinWidth=0.3737490
        TabOrder=13
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
    end object
    sl_Opacity=GameHudOpacity
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_HudSettings.HudColorR'
    begin object name="HudColorR" class=XInterface.moSlider
        MaxValue=255.0000000
        bIntSlider=true
        CaptionWidth=0.3500000
        Caption="???:"
        LabelColor=(R=255,G=0,B=0,A=255)
        OnCreateComponent=HudColorR.InternalOnCreateComponent
        Hint="HUD ??? ???? ??? ?????."
        WinTop=0.5729170
        WinLeft=0.6100000
        WinWidth=0.2721870
        TabOrder=15
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
    end object
    sl_Red=HudColorR
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_HudSettings.HudColorG'
    begin object name="HudColorG" class=XInterface.moSlider
        MaxValue=255.0000000
        bIntSlider=true
        CaptionWidth=0.3500000
        Caption="??:"
        LabelColor=(R=0,G=255,B=0,A=255)
        OnCreateComponent=HudColorG.InternalOnCreateComponent
        Hint="HUD ??? ??? ??? ?????."
        WinTop=0.6604170
        WinLeft=0.6100000
        WinWidth=0.2721870
        TabOrder=17
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
    end object
    sl_Green=HudColorG
    // Reference: moSlider'GUI2K4_Decompressed.UT2K4Tab_HudSettings.HudColorB'
    begin object name="HudColorB" class=XInterface.moSlider
        MaxValue=255.0000000
        bIntSlider=true
        CaptionWidth=0.3500000
        Caption="???: "
        LabelColor=(R=0,G=0,B=255,A=255)
        OnCreateComponent=HudColorB.InternalOnCreateComponent
        Hint="HUD ??? ???? ??? ?????."
        WinTop=0.7525000
        WinLeft=0.6100000
        WinWidth=0.2721870
        TabOrder=16
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
    end object
    sl_Blue=HudColorB
    // Reference: moNumericEdit'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudMessageCount'
    begin object name="GameHudMessageCount" class=XInterface.moNumericEdit
        MinValue=0
        MaxValue=8
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="?? ?? ?? ?"
        OnCreateComponent=GameHudMessageCount.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ?? ?? ?? ??? ? ?? ?????."
        WinTop=0.1968750
        WinLeft=0.5507810
        WinWidth=0.3812500
        TabOrder=9
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    nu_MsgCount=GameHudMessageCount
    // Reference: moNumericEdit'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudMessageScale'
    begin object name="GameHudMessageScale" class=XInterface.moNumericEdit
        MinValue=0
        MaxValue=8
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudMessageScale.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ???? ?? ??? ?????."
        WinTop=0.3218740
        WinLeft=0.5507810
        WinWidth=0.3812500
        TabOrder=10
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    nu_MsgScale=GameHudMessageScale
    // Reference: moNumericEdit'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudMessageOffset'
    begin object name="GameHudMessageOffset" class=XInterface.moNumericEdit
        MinValue=0
        MaxValue=4
        ComponentJustification=0
        CaptionWidth=0.7000000
        Caption="??? ?? ??"
        OnCreateComponent=GameHudMessageOffset.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ???? ?? ??? ?????."
        WinTop=0.4364570
        WinLeft=0.5507810
        WinWidth=0.3812500
        TabOrder=11
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    nu_MsgOffset=GameHudMessageOffset
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudVisible'
    begin object name="GameHudVisible" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="HUD ?? ???"
        OnCreateComponent=GameHudVisible.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="HUD ??? ???? ??? ???."
        WinTop=0.0439060
        WinLeft=0.3792970
        WinWidth=0.1968750
        TabOrder=0
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_Visible=GameHudVisible
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudShowWeaponInfo'
    begin object name="GameHudShowWeaponInfo" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudShowWeaponInfo.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="???? ??? ?? ???? ?????."
        WinTop=0.1819270
        WinLeft=0.0500000
        WinWidth=0.3781250
        TabOrder=3
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_Weapons=GameHudShowWeaponInfo
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudShowPersonalInfo'
    begin object name="GameHudShowPersonalInfo" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudShowPersonalInfo.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="HUD ?? ?? ??? ????? ?????."
        WinTop=0.3173430
        WinLeft=0.0500000
        WinWidth=0.3781250
        TabOrder=4
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_Personal=GameHudShowPersonalInfo
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudShowScore'
    begin object name="GameHudShowScore" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ??"
        OnCreateComponent=GameHudShowScore.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? HUD ???? ???? ?????."
        WinTop=0.4527600
        WinLeft=0.0500000
        WinWidth=0.3781250
        TabOrder=5
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_Score=GameHudShowScore
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudShowWeaponBar'
    begin object name="GameHudShowWeaponBar" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ? ??"
        OnCreateComponent=GameHudShowWeaponBar.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="HUD ???? ?? ??  ?????."
        WinTop=0.5985930
        WinLeft=0.0500000
        WinWidth=0.3781250
        TabOrder=2
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_WeaponBar=GameHudShowWeaponBar
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudShowPortraits'
    begin object name="GameHudShowPortraits" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="?? ?? ??"
        OnCreateComponent=GameHudShowPortraits.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ???? ?? ? ???? ?????? ?????."
        WinTop=0.7235940
        WinLeft=0.0500000
        WinWidth=0.3781250
        TabOrder=6
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_Portraits=GameHudShowPortraits
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHUDShowVCPortraits'
    begin object name="GameHUDShowVCPortraits" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="VoIP ?? ????"
        OnCreateComponent=GameHUDShowVCPortraits.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?? ???? ?? ??? ?????? ?????."
        WinTop=0.7235940
        WinLeft=0.0500000
        WinWidth=0.3781250
        TabOrder=7
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_VCPortraits=GameHUDShowVCPortraits
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameDeathMsgs'
    begin object name="GameDeathMsgs" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="??? ?? ???? ?? ?? ??"
        OnCreateComponent=GameDeathMsgs.InternalOnCreateComponent
        IniOption="@Internal"
        IniDefault="False"
        Hint="??? ??? ???? ???? ???? ??? ?????."
        WinTop=0.8475530
        WinLeft=0.0474600
        WinWidth=0.4037110
        TabOrder=8
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_DeathMsgs=GameDeathMsgs
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.GameHudShowEnemyNames'
    begin object name="GameHudShowEnemyNames" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="? ?? ??"
        OnCreateComponent=GameHudShowEnemyNames.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?? ?? ??? ?????."
        WinTop=0.8485940
        WinLeft=0.0500000
        WinWidth=0.3781250
        TabOrder=1
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_EnemyNames=GameHudShowEnemyNames
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.CustomHUDColor'
    begin object name="CustomHUDColor" class=XInterface.moCheckBox
        ComponentJustification=0
        CaptionWidth=0.9000000
        Caption="HUD ?? ?? ??"
        OnCreateComponent=CustomHUDColor.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="????? Hud? ??? ? ???? ?? ??? ??? ? ????."
        WinTop=0.4814060
        WinLeft=0.5553130
        WinWidth=0.3737490
        TabOrder=14
        OnChange=UT2K4Tab_HudSettings.InternalOnChange
        OnLoadINI=UT2K4Tab_HudSettings.InternalOnLoadINI
    end object
    ch_CustomColor=CustomHUDColor
    // Reference: GUIComboBox'GUI2K4_Decompressed.UT2K4Tab_HudSettings.CustomHUDSelect'
    begin object name="CustomHUDSelect" class=XInterface.GUIComboBox
        bReadOnly=true
        Hint="????? ????? ????, ?? ????? ?? ?? ??? ?????."
        WinTop=0.8787220
        WinLeft=0.5535790
        WinWidth=0.2278630
        WinHeight=0.0300000
        TabOrder=18
        OnKeyEvent=CustomHUDSelect.InternalOnKeyEvent
    end object
    co_CustomHUD=CustomHUDSelect
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4Tab_HudSettings.CustomHUDButton'
    begin object name="CustomHUDButton" class=XInterface.GUIButton
        Caption="??"
        Hint="?? ?????? ??? ??? ?? HUD? ??? ? ?? ?????."
        WinTop=0.8690320
        WinLeft=0.7927370
        WinWidth=0.1385770
        WinHeight=0.0500000
        TabOrder=19
        OnClick=UT2K4Tab_HudSettings.InternalOnClick
        OnKeyEvent=CustomHUDButton.InternalOnKeyEvent
    end object
    b_CustomHUD=CustomHUDButton
    DefaultBGPos=(X1=0.7493350,Y1=0.1674880,X2=0.1634370,Y2=0.1217970)
    DefaultHealthPos=(X1=0.7481640,Y1=0.1695720,X2=0.0632410,Y2=0.0995310)
    PanelCaption="HUD"
    WinTop=0.1500000
    WinHeight=0.7400000
}