class VoiceChatConfig extends GUICustomPropertyPage
    editinlinenew
    instanced;

var() automated moEditBox ed_ChatPassword;
var() automated GUIButton b_QuickBinds;
var() automated moEditBox ed_Active;
var() automated moSlider sl_VoiceVol;
var() automated moCheckBox ch_AJPublic;
var() automated moCheckBox ch_AJLocal;
var() automated moCheckBox ch_AJTeam;
var() automated moCheckBox ch_AutoSpeak;
var() automated moComboBox co_Quality;
var() automated moComboBox co_LANQuality;
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
var Class<VoiceChatReplicationInfo> VoiceChatClass;
var string VoiceChatClassName;
var array<string> InstalledCodecs;
var localized string KeyNameCaption;
var localized string ResetCaption;
var localized string ResetHint;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    local int i;
    local string CName, CDesc;
    local Class<VoiceChatReplicationInfo> cls;

    super(LockedFloatingWindow).InitComponent(InController, inOwner);
    cls = Class<VoiceChatReplicationInfo>(DynamicLoadObject(VoiceChatClassName, Class'Core.Class'));
    // End:0x41
    if(cls != none)
    {
        VoiceChatClass = cls;
    }
    VoiceChatClass.static.GetInstalledCodecs(InstalledCodecs);
    i = 0;
    J0x5C:

    // End:0xDA [Loop If]
    if(i < InstalledCodecs.Length)
    {
        VoiceChatClass.static.GetCodecInfo(InstalledCodecs[i], CName, CDesc);
        co_Quality.AddItem(CName,, InstalledCodecs[i]);
        co_LANQuality.AddItem(CName,, InstalledCodecs[i]);
        i++;
        // [Loop Continue]
        goto J0x5C;
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
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local PlayerController PC;

    // End:0x2D4
    if(GUIMenuOption(Sender) != none)
    {
        PC = PlayerOwner();
        switch(GUIMenuOption(Sender).Caption)
        {
            // End:0x6B
            case ed_ChatPassword.Caption:
                sPwd = PC.ChatPassword;
                ed_ChatPassword.SetComponentValue(sPwd, true);
                // End:0x2D4
                break;
            // End:0xDC
            case sl_VoiceVol.Caption:
                fVoice = float(PC.ConsoleCommand("get ini:Engine.Engine.AudioDevice VoiceVolume"));
                sl_VoiceVol.SetComponentValue(string(fVoice), true);
                // End:0x2D4
                break;
            // End:0x119
            case co_Quality.Caption:
                sCodec = PC.VoiceChatCodec;
                co_Quality.SetExtra(sCodec, true);
                // End:0x2D4
                break;
            // End:0x156
            case co_LANQuality.Caption:
                sLANCodec = PC.VoiceChatLANCodec;
                co_LANQuality.SetExtra(sLANCodec, true);
                // End:0x2D4
                break;
            // End:0x19E
            case ch_AJPublic.Caption:
                bAJPublic = bool(int(PC.AutoJoinMask) & 1);
                ch_AJPublic.SetComponentValue(string(bAJPublic), true);
                // End:0x2D4
                break;
            // End:0x1E7
            case ch_AJLocal.Caption:
                bAJLocal = bool(int(PC.AutoJoinMask) & 2);
                ch_AJLocal.SetComponentValue(string(bAJLocal), true);
                // End:0x2D4
                break;
            // End:0x230
            case ch_AJTeam.Caption:
                bAJTeam = bool(int(PC.AutoJoinMask) & 4);
                ch_AJTeam.SetComponentValue(string(bAJTeam), true);
                // End:0x2D4
                break;
            // End:0x294
            case ch_AutoSpeak.Caption:
                bAutoSpeak = PC.bEnableInitialChatRoom;
                // End:0x26E
                if(bAutoSpeak)
                {
                    EnableComponent(ed_Active);                    
                }
                else
                {
                    DisableComponent(ed_Active);
                }
                ch_AutoSpeak.SetComponentValue(string(bAutoSpeak), true);
                // End:0x2D4
                break;
            // End:0x2D1
            case ed_Active.Caption:
                sActive = PC.DefaultActiveChannel;
                ed_Active.SetComponentValue(sActive, true);
                // End:0x2D4
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

function InternalOnChange(GUIComponent Sender)
{
    local PlayerController PC;

    // End:0x1C8
    if(GUIMenuOption(Sender) != none)
    {
        PC = PlayerOwner();
        switch(GUIMenuOption(Sender).Caption)
        {
            // End:0x57
            case ed_ChatPassword.Caption:
                sPwd = ed_ChatPassword.GetText();
                // End:0x1C8
                break;
            // End:0x80
            case sl_VoiceVol.Caption:
                fVoice = sl_VoiceVol.GetValue();
                // End:0x1C8
                break;
            // End:0xA9
            case co_Quality.Caption:
                sCodec = co_Quality.GetExtra();
                // End:0x1C8
                break;
            // End:0xD2
            case co_LANQuality.Caption:
                sLANCodec = co_LANQuality.GetExtra();
                // End:0x1C8
                break;
            // End:0xFC
            case ch_AJPublic.Caption:
                bAJPublic = ch_AJPublic.IsChecked();
                // End:0x1C8
                break;
            // End:0x126
            case ch_AJLocal.Caption:
                bAJLocal = ch_AJLocal.IsChecked();
                // End:0x1C8
                break;
            // End:0x150
            case ch_AJTeam.Caption:
                bAJTeam = ch_AJTeam.IsChecked();
                // End:0x1C8
                break;
            // End:0x19C
            case ch_AutoSpeak.Caption:
                bAutoSpeak = ch_AutoSpeak.IsChecked();
                // End:0x18E
                if(bAutoSpeak)
                {
                    EnableComponent(ed_Active);                    
                }
                else
                {
                    DisableComponent(ed_Active);
                }
                // End:0x1C8
                break;
            // End:0x1C5
            case ed_Active.Caption:
                sActive = ed_Active.GetText();
                // End:0x1C8
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

function Closed(GUIComponent Sender, bool bCancelled)
{
    local PlayerController PC;
    local bool bSave;

    super(GUIPage).Closed(Sender, bCancelled);
    PC = PlayerOwner();
    // End:0x98
    if(bAJPublic != bool(int(PC.AutoJoinMask) & 1))
    {
        // End:0x6A
        if(bAJPublic)
        {
            PC.AutoJoinMask = byte(int(PC.AutoJoinMask) | 1);            
        }
        else
        {
            PC.AutoJoinMask = byte(int(PC.AutoJoinMask) & ~1);
        }
        bSave = true;
    }
    // End:0x119
    if(bAJLocal != bool(int(PC.AutoJoinMask) & 2))
    {
        // End:0xEA
        if(bAJLocal)
        {
            PC.AutoJoinMask = byte(int(PC.AutoJoinMask) | 2);            
        }
        else
        {
            PC.AutoJoinMask = byte(int(PC.AutoJoinMask) & ~2);
        }
        bSave = true;
    }
    // End:0x19A
    if(bAJTeam != bool(int(PC.AutoJoinMask) & 4))
    {
        // End:0x16B
        if(bAJTeam)
        {
            PC.AutoJoinMask = byte(int(PC.AutoJoinMask) | 4);            
        }
        else
        {
            PC.AutoJoinMask = byte(int(PC.AutoJoinMask) & ~4);
        }
        bSave = true;
    }
    // End:0x22C
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
    // End:0x2CC
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
    // End:0x34B
    if(bSave)
    {
        PC.SaveConfig();
    }
    //return;    
}

function bool ResetClick(GUIComponent Sender)
{
    local int i;
    local string str;
    local Class<AudioSubsystem> AudioClass;

    // End:0x1D0
    if(Sender == b_Cancel)
    {
        str = PlayerOwner().ConsoleCommand("get ini:Engine.Engine.AudioDevice Class");
        i = InStr(str, "'");
        // End:0x9B
        if(i != -1)
        {
            str = Mid(str, InStr(str, "'") + 1);
            str = Left(str, Len(str) - 1);
        }
        AudioClass = Class<AudioSubsystem>(DynamicLoadObject(str, Class'Core.Class'));
        AudioClass.static.ResetConfig("VoiceVolume");
        Class'Engine.PlayerController'.static.ResetConfig("VoiceChatCodec");
        Class'Engine.PlayerController'.static.ResetConfig("VoiceChatLANCodec");
        Class'Engine.PlayerController'.static.ResetConfig("AutoJoinMask");
        Class'Engine.PlayerController'.static.ResetConfig("ChatPassword");
        Class'Engine.PlayerController'.static.ResetConfig("DefaultActiveChannel");
        Class'Engine.PlayerController'.static.ResetConfig("bEnableInitialChatRoom");
        i = 0;
        J0x1A0:

        // End:0x1D0 [Loop If]
        if(i < Components.Length)
        {
            Components[i].LoadINI();
            i++;
            // [Loop Continue]
            goto J0x1A0;
        }
    }
    return true;
    //return;    
}

defaultproperties
{
    // Reference: moEditBox'GUI2K4_Decompressed.VoiceChatConfig.ChatPasswordEdit'
    begin object name="ChatPasswordEdit" class=XInterface.moEditBox
        CaptionWidth=0.6000000
        Caption="?? ????"
        OnCreateComponent=ChatPasswordEdit.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ?? ?? ?? ???? ???? ???? ?? ????? ?????"
        WinTop=0.3328280
        WinLeft=0.0325690
        WinWidth=0.4204030
        TabOrder=4
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    ed_ChatPassword=ChatPasswordEdit
    // Reference: moEditBox'GUI2K4_Decompressed.VoiceChatConfig.DefaultActiveChannelEditBox'
    begin object name="DefaultActiveChannelEditBox" class=XInterface.moEditBox
        CaptionWidth=0.6000000
        Caption="?? ???"
        OnCreateComponent=DefaultActiveChannelEditBox.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ????? ??, ???? ??? ??? ??????. ?? ???? ????? ?? ???? ????? ????, ? ?? ??????."
        WinTop=0.7572770
        WinLeft=0.0325690
        WinWidth=0.4204030
        TabOrder=4
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    ed_Active=DefaultActiveChannelEditBox
    // Reference: moSlider'GUI2K4_Decompressed.VoiceChatConfig.VoiceVolume'
    begin object name="VoiceVolume" class=XInterface.moSlider
        MaxValue=10.0000000
        MinValue=1.0000000
        CaptionWidth=0.6000000
        Caption="??? ?? ??"
        OnCreateComponent=VoiceVolume.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="?? ?????? ??? ?? ?? ??."
        WinTop=0.1424840
        WinLeft=0.5185070
        WinWidth=0.4089070
        RenderWeight=1.0400000
        TabOrder=0
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    sl_VoiceVol=VoiceVolume
    // Reference: moCheckBox'GUI2K4_Decompressed.VoiceChatConfig.AutoJoinPublic'
    begin object name="AutoJoinPublic" class=XInterface.moCheckBox
        CaptionWidth=0.9400000
        Caption="??? ?? ?? ??"
        OnCreateComponent=AutoJoinPublic.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ??? ?? ??."
        WinTop=0.0424960
        WinLeft=0.0862800
        WinWidth=0.8266520
        TabOrder=1
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    ch_AJPublic=AutoJoinPublic
    // Reference: moCheckBox'GUI2K4_Decompressed.VoiceChatConfig.AutoJoinLocal'
    begin object name="AutoJoinLocal" class=XInterface.moCheckBox
        CaptionWidth=0.9400000
        Caption="?? ??? ?? ??"
        OnCreateComponent=AutoJoinLocal.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ?? ?? ??."
        WinTop=0.1457840
        WinLeft=0.0862800
        WinWidth=0.8266520
        TabOrder=2
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    ch_AJLocal=AutoJoinLocal
    // Reference: moCheckBox'GUI2K4_Decompressed.VoiceChatConfig.AutoJoinTeam'
    begin object name="AutoJoinTeam" class=XInterface.moCheckBox
        Caption="? ?? ?? ??"
        OnCreateComponent=AutoJoinTeam.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ? ?? ??."
        WinTop=0.2269370
        WinLeft=0.0228030
        WinWidth=0.4409100
        TabOrder=3
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    ch_AJTeam=AutoJoinTeam
    // Reference: moCheckBox'GUI2K4_Decompressed.VoiceChatConfig.AutoSpeakCheckbox'
    begin object name="AutoSpeakCheckbox" class=XInterface.moCheckBox
        Caption="???? ??? ??"
        OnCreateComponent=AutoSpeakCheckbox.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ? ???? ??? ??? ?????. ???? ????? ?? ??? ??? ???. ??, ???? ????? ?????? ????? ????."
        WinTop=0.6035260
        WinLeft=0.0398120
        WinWidth=0.4426380
        WinHeight=0.0600000
        TabOrder=3
        bBoundToParent=true
        bScaleToParent=true
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    ch_AutoSpeak=AutoSpeakCheckbox
    // Reference: moComboBox'GUI2K4_Decompressed.VoiceChatConfig.VoiceQuality'
    begin object name="VoiceQuality" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.6000000
        Caption="??? ??"
        OnCreateComponent=VoiceQuality.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="??? ??? ??? ??? ?? ?? ?? ?? ??."
        WinTop=0.2413910
        WinLeft=0.5233900
        WinWidth=0.4089070
        TabOrder=5
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    co_Quality=VoiceQuality
    // Reference: moComboBox'GUI2K4_Decompressed.VoiceChatConfig.VoiceQualityLAN'
    begin object name="VoiceQualityLAN" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.6000000
        Caption="? ??"
        OnCreateComponent=VoiceQualityLAN.InternalOnCreateComponent
        IniOption="@Internal"
        Hint="? ??? ??? ??? ?? ?? ?? ?? ??."
        WinTop=0.3337860
        WinLeft=0.5233900
        WinWidth=0.4089070
        TabOrder=6
        OnChange=VoiceChatConfig.InternalOnChange
        OnLoadINI=VoiceChatConfig.InternalOnLoadINI
    end object
    co_LANQuality=VoiceQualityLAN
    VoiceChatClass=Class'Engine.VoiceChatReplicationInfo'
    VoiceChatClassName="UnrealGame.TeamVoiceReplicationInfo"
    ResetCaption="???"
    ResetHint="?? ???? ????? ??????"
    WindowName="???? ??"
    bAcceptsInput=false
}