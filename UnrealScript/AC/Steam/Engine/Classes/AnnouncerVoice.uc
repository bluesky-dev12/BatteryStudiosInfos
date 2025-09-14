/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AnnouncerVoice.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:8
 *	Functions:6
 *
 *******************************************************************************/
class AnnouncerVoice extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    abstract
    notplaceable;

struct CachedSound
{
    var string CacheName;
    var Sound CacheSound;
};

var noimport string SoundPackage;
var noimport string FallbackSoundPackage;
var string AlternateFallbackSoundPackage;
var noimport localized string AnnouncerName;
var array<CachedSound> CachedSounds;
var bool bPrecachedBaseSounds;
var bool bPrecachedGameSounds;
var noimport const bool bEnglishOnly;

event Sound GetSound(string AName)
{
    local Sound NewSound;
    local int i;
    local string strSoundName;

    strSoundName = Mid(AName, InStr(AName, ".") + 1);
    i = 0;
    J0x21:
    // End:0x81 [While If]
    if(i < class'AnnouncerVoice'.default.CachedSounds.Length)
    {
        // End:0x77
        if(AName == class'AnnouncerVoice'.default.CachedSounds[i].CacheName)
        {
            return class'AnnouncerVoice'.default.CachedSounds[i].CacheSound;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
    NewSound = class'AnnouncerVoice'.static.PrecacheSound(strSoundName, AName);
    return NewSound;
}

static function Sound PrecacheSound(string AName, optional string strFullName)
{
    local Sound NewSound;

    // End:0x28
    if(class'AnnouncerVoice'.default.CachedSounds.Length > 500)
    {
        class'AnnouncerVoice'.static.ResetPrecacheSound();
    }
    NewSound = PrecacheFallbackPackage(class'AnnouncerVoice'.default.AlternateFallbackSoundPackage, AName, strFullName);
    // End:0xda
    if(NewSound == none)
    {
        Warn("Could not find " $ AName $ " in " $ class'AnnouncerVoice'.default.SoundPackage $ " nor in fallback package " $ class'AnnouncerVoice'.default.FallbackSoundPackage $ "nor in Alternate" $ class'AnnouncerVoice'.default.AlternateFallbackSoundPackage);
    }
    return NewSound;
}

static function ResetPrecacheSound()
{
    class'AnnouncerVoice'.default.CachedSounds.Length = 0;
}

static function Sound PrecacheFallbackPackage(string Package, string AName, optional string strFullName)
{
    local Sound NewSound;
    local int i, iLength;
    local string FullName;

    FullName = Package $ "." $ AName;
    NewSound = Sound(DynamicLoadObject(FullName, class'Sound', true));
    // End:0x159
    if(NewSound != none)
    {
        i = 0;
        J0x45:
        // End:0xb0 [While If]
        if(i < class'AnnouncerVoice'.default.CachedSounds.Length)
        {
            // End:0xa6
            if(class'AnnouncerVoice'.default.CachedSounds[i].CacheName == FullName)
            {
                class'AnnouncerVoice'.default.CachedSounds[i].CacheSound = NewSound;
                return NewSound;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
        iLength = class'AnnouncerVoice'.default.CachedSounds.Length;
        class'AnnouncerVoice'.default.CachedSounds.Length = class'AnnouncerVoice'.default.CachedSounds.Length + 1;
        // End:0x115
        if(strFullName != "")
        {
            class'AnnouncerVoice'.default.CachedSounds[iLength].CacheName = strFullName;
        }
        // End:0x134
        else
        {
            class'AnnouncerVoice'.default.CachedSounds[iLength].CacheName = FullName;
        }
        class'AnnouncerVoice'.default.CachedSounds[iLength].CacheSound = NewSound;
        return NewSound;
    }
    Log(FullName @ "Package Precached");
    return none;
}

function PrecacheAnnouncements(bool bRewardSounds)
{
    local class<GameInfo> GameClass;
    local Actor A;

    // End:0x6e
    if(!bPrecachedGameSounds)
    {
        bPrecachedGameSounds = Level.GRI != none && Level.GRI.GameClass != "";
        GameClass = Level.GetGameClass();
        GameClass.static.PrecacheGameAnnouncements(self, bRewardSounds);
    }
    // End:0x95
    foreach DynamicActors(class'Actor', A)
    {
        A.PrecacheAnnouncer(self, bRewardSounds);                
    }
    // End:0xc4
    if(!bPrecachedBaseSounds)
    {
        bPrecachedBaseSounds = true;
        // End:0xc4
        if(bRewardSounds)
        {
            class'AnnouncerVoice'.static.PrecacheList();
        }
        // End:0xc4
        else
        {
        }
    }
}

static function PrecacheList()
{
    PrecacheSound("v_cb_kill_headshot");
    PrecacheSound("v_cb_kill_7kill");
    PrecacheSound("v_cb_kill_5kill");
    PrecacheSound("v_cb_kill_3kill");
    PrecacheSound("v_cb_kill_15kill");
    PrecacheSound("v_cb_kill_10kill");
    PrecacheSound("v_cb_call_artillery_R");
    PrecacheSound("v_cb_call_helicopter_R");
    PrecacheSound("v_cb_call_uav_R");
    PrecacheSound("v_cb_etc_pain");
    PrecacheSound("v_cb_etc_whizby");
    PrecacheSound("v_cb_ready_artillery_R");
    PrecacheSound("v_cb_ready_helicopter_R");
    PrecacheSound("v_cb_ready_uav_R");
    PrecacheSound("v_cb_team_uav_R");
    PrecacheSound("v_cb_enemy_artillery_R");
    PrecacheSound("v_cb_enemy_helicopter_R");
    PrecacheSound("v_cb_enemy_uav_R");
    PrecacheSound("v_cb_team_artillery_R");
    PrecacheSound("v_cb_team_helicopter_R");
    PrecacheSound("v_cb_enemy_die_M");
    PrecacheSound("v_cb_enemy_grenade_M");
    PrecacheSound("v_cb_enemy_MG_M");
    PrecacheSound("v_cb_enemy_rpg_M");
    PrecacheSound("v_cb_team_claymore_M");
    PrecacheSound("v_cb_team_die_M");
    PrecacheSound("v_cb_team_flash_M");
    PrecacheSound("v_cb_team_gas_M");
    PrecacheSound("v_cb_team_grenade_M");
    PrecacheSound("v_cb_team_reload_M");
    PrecacheSound("v_cb_team_smoke_M");
    PrecacheSound("v_cb_team_stungrenade_M");
    PrecacheSound("v_cb_team_timec4_M");
    PrecacheSound("v_com_1_M");
    PrecacheSound("v_com_2_M");
    PrecacheSound("v_com_3_M");
    PrecacheSound("v_com_4_M");
    PrecacheSound("v_com_5_M");
    PrecacheSound("v_com_6_M");
    PrecacheSound("v_com_7_M");
    PrecacheSound("v_com_8_M");
    PrecacheSound("v_com_9_M");
    PrecacheSound("v_respon_1_M");
    PrecacheSound("v_respon_2_M");
    PrecacheSound("v_respon_3_M");
    PrecacheSound("v_respon_4_M");
    PrecacheSound("v_respon_5_M");
    PrecacheSound("v_respon_6_M");
    PrecacheSound("v_respon_7_M");
    PrecacheSound("v_respon_8_M");
    PrecacheSound("v_state_1_M");
    PrecacheSound("v_state_2_M");
    PrecacheSound("v_state_3_M");
    PrecacheSound("v_state_4_M");
    PrecacheSound("v_state_5_M");
    PrecacheSound("v_state_6_M");
    PrecacheSound("v_state_7_M");
    PrecacheSound("v_dom_all_captured_enemy_R");
    PrecacheSound("v_dom_all_captured_team_R");
    PrecacheSound("v_dom_all_R");
    PrecacheSound("v_dom_A_capture_start_enemy_R");
    PrecacheSound("v_dom_A_capture_start_team_R");
    PrecacheSound("v_dom_A_captured_enemy_R");
    PrecacheSound("v_dom_A_captured_team_R");
    PrecacheSound("v_dom_B_capture_start_enemy_R");
    PrecacheSound("v_dom_B_capture_start_team_R");
    PrecacheSound("v_dom_B_captured_enemy_R");
    PrecacheSound("v_dom_B_captured_team_R");
    PrecacheSound("v_dom_C_capture_start_enemy_R");
    PrecacheSound("v_dom_C_capture_start_team_R");
    PrecacheSound("v_dom_C_captured_enemy_R");
    PrecacheSound("v_dom_C_captured_team_R");
    PrecacheSound("v_dom_R");
    PrecacheSound("v_etc_suddendeath");
    PrecacheSound("v_etc_timesup_R");
    PrecacheSound("v_ffa_R");
    PrecacheSound("v_result_lose_R");
    PrecacheSound("v_result_win_R");
    PrecacheSound("v_sab_bomb_lost_team_R");
    PrecacheSound("v_sabotage_bomb_R");
    PrecacheSound("v_sab_bomb_defuse_enemy_R");
    PrecacheSound("v_sab_bomb_defuse_team_R");
    PrecacheSound("v_sab_bomb_get_enemy_R");
    PrecacheSound("v_sab_bomb_get_R");
    PrecacheSound("v_sab_bomb_get_team_R");
    PrecacheSound("v_sab_bomb_lost_team_01_R");
    PrecacheSound("v_sab_bomb_plant_enemy_R");
    PrecacheSound("v_sab_bomb_plant_team_R");
    PrecacheSound("v_sabotage_R");
    PrecacheSound("v_score_last_lose_R");
    PrecacheSound("v_score_last_win_R");
    PrecacheSound("v_score_nomal_lose_R");
    PrecacheSound("v_score_nomal_win_R");
    PrecacheSound("v_sd_lastman_R");
    PrecacheSound("v_sd_round_encourage_lose_team_R");
    PrecacheSound("v_sd_round_encourage_win_team_R");
    PrecacheSound("v_sd_bomb_defuse_enemy_R");
    PrecacheSound("v_sd_bomb_defuse_team_R");
    PrecacheSound("v_sd_bomb_get_team_R");
    PrecacheSound("v_sd_bomb_plant_enemy_R");
    PrecacheSound("v_sd_bomb_plant_team_R");
    PrecacheSound("v_sd_change_R");
    PrecacheSound("v_sd_destroy_R");
    PrecacheSound("v_sd_guard_R");
    PrecacheSound("v_sd_R");
    PrecacheSound("v_tdm_all_R");
    PrecacheSound("v_tdm_R");
}

defaultproperties
{
    AlternateFallbackSoundPackage="Warfare_Sound_Voice_E"
}