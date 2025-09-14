/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\VoiceChatConfig.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:26
 *	Functions:5
 *
 *******************************************************************************/
class VoiceChatConfig extends GUICustomPropertyPage
    dependson(GUICustomPropertyPage)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_ChatPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_QuickBinds;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moEditBox ed_Active;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moSlider sl_VoiceVol;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AJPublic;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AJLocal;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AJTeam;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_AutoSpeak;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Quality;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_LANQuality;
var bool bAJPublic;
var bool bAJLocal;
var bool bAJTeam;
var bool bAutoSpeak;
var string sPwd;
var string sCodec;
var string sLANCodec;
var string sActive;
var string QuickBindMenu;
var float fVoice;
var class<VoiceChatReplicationInfo> VoiceChatClass;
var string VoiceChatClassName;
var array<string> InstalledCodecs;
var localized string KeyNameCaption;
var localized string ResetCaption;
var localized string ResetHint;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    local int i;
    local string CName, CDesc;
    local class<VoiceChatReplicationInfo> cls;

    super(LockedFloatingWindow).InitComponent(InController, inOwner);
    cls = class<VoiceChatReplicationInfo>(DynamicLoadObject(VoiceChatClassName, class'Class'));
    // End:0x41
    if(cls != none)
    {
        VoiceChatClass = cls;
    }
    VoiceChatClass.static.GetInstalledCodecs(InstalledCodecs);
    i = 0;
    J0x5c:
    // End:0xda [While If]
    if(i < InstalledCodecs.Length)
    {
        VoiceChatClass.static.GetCodecInfo(InstalledCodecs[i], CName, CDesc);
        co_Quality.AddItem(CName,, InstalledCodecs[i]);
        co_LANQuality.AddItem(CName,, InstalledCodecs[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    ed_ChatPassword.MaskText(true);
    b_Cancel.Caption = ResetCaption;
    b_Cancel.Hint = ResetHint;
    b_Cancel.__OnClick__Delegate = ResetClick;
    ed_ChatPassword.MaskText(true);
    sb_Main.ManageComponent(sl_VoiceVol);
    sb_Main.ManageComponent(ch_AJPublic);
    sb_Main.ManageComponent(ch_AJLocal);
    sb_Main.ManageComponent(ch_AJTeam);
    sb_Main.ManageComponent(ch_AutoSpeak);
    sb_Main.ManageComponent(ed_Active);
    sb_Main.ManageComponent(ed_ChatPassword);
    sb_Main.ManageComponent(co_Quality);
    sb_Main.ManageComponent(co_LANQuality);
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local PlayerController PC;

    // End:0x2d4
    if(GUIMenuOption(Sender) != none)
    {
        PC = PlayerOwner();
        switch(GUIMenuOption(Sender).Caption)
        {
            // End:0x6b
            case ed_ChatPassword.Caption:
                sPwd = PC.ChatPassword;
                ed_ChatPassword.SetComponentValue(sPwd, true);
                // End:0x2d4
                break;
            // End:0xdc
            case sl_VoiceVol.Caption:
                fVoice = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice VoiceVolume"));
                sl_VoiceVol.SetComponentValue(string(fVoice), true);
                // End:0x2d4
                break;
            // End:0x119
            case co_Quality.Caption:
                sCodec = PC.VoiceChatCodec;
                co_Quality.SetExtra(sCodec, true);
                // End:0x2d4
                break;
            // End:0x156
            case co_LANQuality.Caption:
                sLANCodec = PC.VoiceChatLANCodec;
                co_LANQuality.SetExtra(sLANCodec, true);
                // End:0x2d4
                break;
            // End:0x19e
            case ch_AJPublic.Caption:
                bAJPublic = bool(PC.AutoJoinMask & 1);
                ch_AJPublic.SetComponentValue(string(bAJPublic), true);
                // End:0x2d4
                break;
            // End:0x1e7
            case ch_AJLocal.Caption:
                bAJLocal = bool(PC.AutoJoinMask & 2);
                ch_AJLocal.SetComponentValue(string(bAJLocal), true);
                // End:0x2d4
                break;
            // End:0x230
            case ch_AJTeam.Caption:
                bAJTeam = bool(PC.AutoJoinMask & 4);
                ch_AJTeam.SetComponentValue(string(bAJTeam), true);
                // End:0x2d4
                break;
            // End:0x294
            case ch_AutoSpeak.Caption:
                bAutoSpeak = PC.bEnableInitialChatRoom;
                // End:0x26e
                if(bAutoSpeak)
                {
                    EnableComponent(ed_Active);
                }
                // End:0x279
                else
                {
                    DisableComponent(ed_Active);
                }
                ch_AutoSpeak.SetComponentValue(string(bAutoSpeak), true);
                // End:0x2d4
                break;
            // End:0x2d1
            case ed_Active.Caption:
                sActive = PC.DefaultActiveChannel;
                ed_Active.SetComponentValue(sActive, true);
                // End:0x2d4
                break;
            // End:0xffff
            default:
            }
}

function InternalOnChange(GUIComponent Sender)
{
    local PlayerController PC;

    // End:0x1c8
    if(GUIMenuOption(Sender) != none)
    {
        PC = PlayerOwner();
        switch(GUIMenuOption(Sender).Caption)
        {
            // End:0x57
            case ed_ChatPassword.Caption:
                sPwd = ed_ChatPassword.GetText();
                // End:0x1c8
                break;
            // End:0x80
            case sl_VoiceVol.Caption:
                fVoice = sl_VoiceVol.GetValue();
                // End:0x1c8
                break;
            // End:0xa9
            case co_Quality.Caption:
                sCodec = co_Quality.GetExtra();
                // End:0x1c8
                break;
            // End:0xd2
            case co_LANQuality.Caption:
                sLANCodec = co_LANQuality.GetExtra();
                // End:0x1c8
                break;
            // End:0xfc
            case ch_AJPublic.Caption:
                bAJPublic = ch_AJPublic.IsChecked();
                // End:0x1c8
                break;
            // End:0x126
            case ch_AJLocal.Caption:
                bAJLocal = ch_AJLocal.IsChecked();
                // End:0x1c8
                break;
            // End:0x150
            case ch_AJTeam.Caption:
                bAJTeam = ch_AJTeam.IsChecked();
                // End:0x1c8
                break;
            // End:0x19c
            case ch_AutoSpeak.Caption:
                bAutoSpeak = ch_AutoSpeak.IsChecked();
                // End:0x18e
                if(bAutoSpeak)
                {
                    EnableComponent(ed_Active);
                }
                // End:0x199
                else
                {
                    DisableComponent(ed_Active);
                }
                // End:0x1c8
                break;
            // End:0x1c5
            case ed_Active.Caption:
                sActive = ed_Active.GetText();
                // End:0x1c8
                break;
            // End:0xffff
            default:
            }
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    local PlayerController PC;
    local bool bSave;

    super(GUIPage).Closed(Sender, bCancelled);
    PC = PlayerOwner();
    // End:0x98
    if(bAJPublic != bool(PC.AutoJoinMask & 1))
    {
        // End:0x6a
        if(bAJPublic)
        {
            PC.AutoJoinMask = byte(PC.AutoJoinMask | 1);
        }
        // End:0x90
        else
        {
            PC.AutoJoinMask = byte(PC.AutoJoinMask & ~1);
        }
        bSave = true;
    }
    // End:0x119
    if(bAJLocal != bool(PC.AutoJoinMask & 2))
    {
        // End:0xea
        if(bAJLocal)
        {
            PC.AutoJoinMask = byte(PC.AutoJoinMask | 2);
        }
        // End:0x111
        else
        {
            PC.AutoJoinMask = byte(PC.AutoJoinMask & ~2);
        }
        bSave = true;
    }
    // End:0x19a
    if(bAJTeam != bool(PC.AutoJoinMask & 4))
    {
        // End:0x16b
        if(bAJTeam)
        {
            PC.AutoJoinMask = byte(PC.AutoJoinMask | 4);
        }
        // End:0x192
        else
        {
            PC.AutoJoinMask = byte(PC.AutoJoinMask & ~4);
        }
        bSave = true;
    }
    // End:0x22c
    if(fVoice != float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice VoiceVolume")))
    {
        PC.ConsoleCommand("set ini:Engine.Engine.AudioDevice VoiceVolume" @ string(fVoice));
    }
    // End:0x260
    if(sCodec != PC.VoiceChatCodec)
    {
        PC.VoiceChatCodec = sCodec;
        bSave = true;
    }
    // End:0x294
    if(sLANCodec != PC.VoiceChatLANCodec)
    {
        PC.VoiceChatLANCodec = sLANCodec;
        bSave = true;
    }
    // End:0x2cc
    if(PC.bEnableInitialChatRoom != bAutoSpeak)
    {
        PC.bEnableInitialChatRoom = bAutoSpeak;
        bSave = true;
    }
    // End:0x302
    if(!PC.DefaultActiveChannel ~= sActive)
    {
        PC.DefaultActiveChannel = sActive;
        bSave = true;
    }
    // End:0x336
    if(PC.ChatPassword != sPwd)
    {
        PC.SetChatPassword(sPwd);
        bSave = false;
    }
    // End:0x34b
    if(bSave)
    {
        PC.SaveConfig();
    }
}

function bool ResetClick(GUIComponent Sender)
{
    local int i;
    local string str;
    local class<AudioSubsystem> AudioClass;

    // End:0x1d0
    if(Sender == b_Cancel)
    {
        str = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice Class");
        i = InStr(str, "'");
        // End:0x9b
        if(i != -1)
        {
            str = Mid(str, InStr(str, "'") + 1);
            str = Left(str, Len(str) - 1);
        }
        AudioClass = class<AudioSubsystem>(DynamicLoadObject(str, class'Class'));
        AudioClass.static.ResetConfig("VoiceVolume");
        class'PlayerController'.static.ResetConfig("VoiceChatCodec");
        class'PlayerController'.static.ResetConfig("VoiceChatLANCodec");
        class'PlayerController'.static.ResetConfig("AutoJoinMask");
        class'PlayerController'.static.ResetConfig("ChatPassword");
        class'PlayerController'.static.ResetConfig("DefaultActiveChannel");
        class'PlayerController'.static.ResetConfig("bEnableInitialChatRoom");
        i = 0;
        J0x1a0:
        // End:0x1d0 [While If]
        if(i < Components.Length)
        {
            Components[i].LoadINI();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1a0;
        }
    }
    return true;
}

defaultproperties
{
    begin object name=ChatPasswordEdit class=moEditBox
        CaptionWidth=0.60
        Caption="?? ????"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ?? ?? ???? ???? ???? ?? ????? ?????"
        WinTop=0.3328280
        WinLeft=0.0325690
        WinWidth=0.4204030
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moEditBox'VoiceChatConfig.ChatPasswordEdit'
    ed_ChatPassword=ChatPasswordEdit
    begin object name=DefaultActiveChannelEditBox class=moEditBox
        CaptionWidth=0.60
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ????? ??, ???? ??? ??? ??????. ?? ???? ????? ?? ???? ????? ????, ? ?? ??????."
        WinTop=0.7572770
        WinLeft=0.0325690
        WinWidth=0.4204030
        TabOrder=4
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moEditBox'VoiceChatConfig.DefaultActiveChannelEditBox'
    ed_Active=DefaultActiveChannelEditBox
    begin object name=VoiceVolume class=moSlider
        MaxValue=10.0
        MinValue=1.0
        CaptionWidth=0.60
        Caption="??? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?????? ??? ?? ?? ??."
        WinTop=0.1424840
        WinLeft=0.5185070
        WinWidth=0.4089070
        RenderWeight=1.040
        TabOrder=0
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moSlider'VoiceChatConfig.VoiceVolume'
    sl_VoiceVol=VoiceVolume
    begin object name=AutoJoinPublic class=moCheckBox
        CaptionWidth=0.940
        Caption="??? ?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ??? ?? ??."
        WinTop=0.0424960
        WinLeft=0.086280
        WinWidth=0.8266520
        TabOrder=1
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'VoiceChatConfig.AutoJoinPublic'
    ch_AJPublic=AutoJoinPublic
    begin object name=AutoJoinLocal class=moCheckBox
        CaptionWidth=0.940
        Caption="?? ??? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ?? ?? ??."
        WinTop=0.1457840
        WinLeft=0.086280
        WinWidth=0.8266520
        TabOrder=2
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'VoiceChatConfig.AutoJoinLocal'
    ch_AJLocal=AutoJoinLocal
    begin object name=AutoJoinTeam class=moCheckBox
        Caption="? ?? ?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ? ?? ??."
        WinTop=0.2269370
        WinLeft=0.0228030
        WinWidth=0.440910
        TabOrder=3
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'VoiceChatConfig.AutoJoinTeam'
    ch_AJTeam=AutoJoinTeam
    begin object name=AutoSpeakCheckbox class=moCheckBox
        Caption="???? ??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ??? ??? ?????. ???? ????? ?? ??? ??? ???. ??, ???? ????? ?????? ????? ????."
        WinTop=0.6035260
        WinLeft=0.0398120
        WinWidth=0.4426380
        WinHeight=0.060
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moCheckBox'VoiceChatConfig.AutoSpeakCheckbox'
    ch_AutoSpeak=AutoSpeakCheckbox
    begin object name=VoiceQuality class=moComboBox
        bReadOnly=true
        CaptionWidth=0.60
        Caption="??? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ??? ??? ?? ?? ?? ?? ??."
        WinTop=0.2413910
        WinLeft=0.523390
        WinWidth=0.4089070
        TabOrder=5
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'VoiceChatConfig.VoiceQuality'
    co_Quality=VoiceQuality
    begin object name=VoiceQualityLAN class=moComboBox
        bReadOnly=true
        CaptionWidth=0.60
        Caption="? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ??? ?? ?? ?? ?? ??."
        WinTop=0.3337860
        WinLeft=0.523390
        WinWidth=0.4089070
        TabOrder=6
        OnChange=InternalOnChange
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'VoiceChatConfig.VoiceQualityLAN'
    co_LANQuality=VoiceQualityLAN
    VoiceChatClass=Class'Engine.VoiceChatReplicationInfo'
    VoiceChatClassName="UnrealGame.TeamVoiceReplicationInfo"
    ResetCaption="???"
    ResetHint="?? ???? ????? ??????"
    WindowName="???? ??"
    bAcceptsInput=true
}