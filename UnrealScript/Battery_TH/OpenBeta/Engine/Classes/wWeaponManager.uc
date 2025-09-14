class wWeaponManager extends Object
    native;

var array<wWeaponBaseParams> WeaponParams;
var array<string> arr_szResClass;
var array< Class<wWeaponRes_Base> > arr_classRes;
var array<float> BaseSpeed_Sprint;
var array<float> BaseSpeed_Run;
var array<float> BaseSpeed_Aim;
var array<float> BaseSpeed_Run_Cr;
var array<float> BaseSpeed_Aim_Cr;
var array<float> BaseSpeed_Prone;

event InitScript()
{
    LoadWeaponRes();
    LoadWeaponParams();
    LoadWeaponRecoilParams();
    //return;    
}

event DestroyScript()
{
    arr_szResClass.Length = 0;
    WeaponParams.Length = 0;
    //return;    
}

event LoadWeaponRes()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x48 [Loop If]
    if(i < arr_szResClass.Length)
    {
        arr_classRes[i] = Class<wWeaponRes_Base>(DynamicLoadObject(arr_szResClass[i], Class'Core.Class'));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Class<wWeaponRes_Base> GetRes(string szRes)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < arr_szResClass.Length)
    {
        // End:0x38
        if(szRes == arr_szResClass[i])
        {
            return arr_classRes[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function LoadWeaponRecoilParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(WeaponParams.Length <= 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadWeaponRecoilParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddWeaponRecoilParams(GameData);
    //return;    
}

function AddWeaponRecoilParams(BTNetGameData GameData)
{
    local wWeaponBaseParams wParam;
    local int iIndex, ilength;
    local string strTemp;
    local int i, j, bounding_max, ItemID;
    local string strAim;
    local array<string> strForTrim;

    iIndex = 0;
    J0x07:

    // End:0x5B0 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("WeaponParam", "item_id", iIndex);
        // End:0x52
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x5B0;
        }
        ItemID = int(strTemp);
        i = 0;
        J0x66:

        // End:0x5A6 [Loop If]
        if(i < WeaponParams.Length)
        {
            // End:0x59C
            if(WeaponParams[i].iWeaponID == ItemID)
            {
                strAim = GameData.getData("WeaponParam", "console_command", iIndex);
                Split(strAim, " ", strForTrim);
                strAim = "";
                j = 0;
                J0xEA:

                // End:0x118 [Loop If]
                if(j < strForTrim.Length)
                {
                    strAim $= strForTrim[j];
                    j++;
                    // [Loop Continue]
                    goto J0xEA;
                }
                // End:0x35A
                if(StrCmp("setweapontrace", strAim) == 0)
                {
                    WeaponParams[i].wt_RandomMul = float(GameData.getData("WeaponParam", "random_max", iIndex));
                    bounding_max = int(GameData.getData("WeaponParam", "bounding_max", iIndex));
                    WeaponParams[i].wt_BoundingMax = float(bounding_max);
                    j = 0;
                    J0x1D3:

                    // End:0x2D3 [Loop If]
                    if(j < bounding_max)
                    {
                        WeaponParams[i].wt_x[j] = float(GameData.getData("WeaponParam", "x" $ string(j + 1), iIndex));
                        WeaponParams[i].wt_y[j] = float(GameData.getData("WeaponParam", "y" $ string(j + 1), iIndex));
                        WeaponParams[i].wt_RandomWeight[j] = float(GameData.getData("WeaponParam", "r" $ string(j + 1), iIndex));
                        j++;
                        // [Loop Continue]
                        goto J0x1D3;
                    }
                    j = bounding_max;
                    J0x2DE:

                    // End:0x354 [Loop If]
                    if(j < 60)
                    {
                        WeaponParams[i].wt_x[j] = 0.0000000;
                        WeaponParams[i].wt_y[j] = 0.0000000;
                        WeaponParams[i].wt_RandomWeight[j] = 0.0000000;
                        j++;
                        // [Loop Continue]
                        goto J0x2DE;
                    }
                    // [Explicit Break]
                    goto J0x5A6;
                    // [Explicit Continue]
                    goto J0x59C;
                }
                // End:0x59C
                if(StrCmp("setweapontraceaim", strAim) == 0)
                {
                    WeaponParams[i].wtAim_RandomMul = float(GameData.getData("WeaponParam", "random_max", iIndex));
                    bounding_max = int(GameData.getData("WeaponParam", "bounding_max", iIndex));
                    WeaponParams[i].wtAim_BoundingMax = float(bounding_max);
                    j = 0;
                    J0x418:

                    // End:0x518 [Loop If]
                    if(j < bounding_max)
                    {
                        WeaponParams[i].wtAim_x[j] = float(GameData.getData("WeaponParam", "x" $ string(j + 1), iIndex));
                        WeaponParams[i].wtAim_y[j] = float(GameData.getData("WeaponParam", "y" $ string(j + 1), iIndex));
                        WeaponParams[i].wtAim_RandomWeight[j] = float(GameData.getData("WeaponParam", "r" $ string(j + 1), iIndex));
                        j++;
                        // [Loop Continue]
                        goto J0x418;
                    }
                    j = bounding_max;
                    J0x523:

                    // End:0x599 [Loop If]
                    if(j < 60)
                    {
                        WeaponParams[i].wt_x[j] = 0.0000000;
                        WeaponParams[i].wt_y[j] = 0.0000000;
                        WeaponParams[i].wt_RandomWeight[j] = 0.0000000;
                        j++;
                        // [Loop Continue]
                        goto J0x523;
                    }
                    // [Explicit Break]
                    goto J0x5A6;
                }
            }
            J0x59C:

            i++;
            // [Loop Continue]
            goto J0x66;
        }
        J0x5A6:

        iIndex++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x5B0:

    //return;    
}

function LoadWeaponParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(WeaponParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadWeaponParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddParams(GameData);
    //return;    
}

function AddParams(BTNetGameData GameData)
{
    local wWeaponBaseParams wParam;
    local int iIndex, ilength;
    local string strTemp;

    iIndex = 0;
    J0x07:

    // End:0x31A7 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("WeaponParam", "display_name", iIndex);
        // End:0x57
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x31A7;
        }
        wParam = new Class'Engine_Decompressed.wWeaponBaseParams';
        wParam.iWeaponID = int(GameData.getData("WeaponParam", "item_id", iIndex));
        wParam.strName = strTemp;
        wParam.szClass_Resource = GameData.getData("WeaponParam", "weapon_resource_id", iIndex);
        wParam.iInventoryGroup = int(GameData.getData("WeaponParam", "weapon_num", iIndex));
        switch(GameData.getData("WeaponParam", "weapon_type", iIndex))
        {
            // End:0x186
            case "Pistol":
                wParam.eType = 4;
                // End:0x39C
                break;
            // End:0x1A1
            case "AR":
                wParam.eType = 1;
                // End:0x39C
                break;
            // End:0x1BD
            case "SMG":
                wParam.eType = 3;
                // End:0x39C
                break;
            // End:0x1D8
            case "SR":
                wParam.eType = 2;
                // End:0x39C
                break;
            // End:0x1F3
            case "GR":
                wParam.eType = 5;
                // End:0x39C
                break;
            // End:0x213
            case "Shotgun":
                wParam.eType = 6;
                // End:0x39C
                break;
            // End:0x22F
            case "RPG":
                wParam.eType = 7;
                // End:0x39C
                break;
            // End:0x254
            case "FlameThrower":
                wParam.eType = 8;
                // End:0x39C
                break;
            // End:0x26F
            case "MG":
                wParam.eType = 9;
                // End:0x39C
                break;
            // End:0x28C
            case "Demo":
                wParam.eType = 10;
                // End:0x39C
                break;
            // End:0x2AE
            case "AirStrike":
                wParam.eType = 11;
                // End:0x39C
                break;
            // End:0x2CC
            case "Melee":
                wParam.eType = 12;
                // End:0x39C
                break;
            // End:0x2EA
            case "Knife":
                wParam.eType = 17;
                // End:0x39C
                break;
            // End:0x30D
            case "Helicopter":
                wParam.eType = 13;
                // End:0x39C
                break;
            // End:0x339
            case "Telegraph_Airstrike":
                wParam.eType = 14;
                // End:0x39C
                break;
            // End:0x35F
            case "Telegraph_UAV":
                wParam.eType = 16;
                // End:0x39C
                break;
            // End:0x385
            case "Telegraph_HEL":
                wParam.eType = 15;
                // End:0x39C
                break;
            // End:0xFFFF
            default:
                wParam.eType = 0;
                // End:0x39C
                break;
                break;
        }
        switch(GameData.getData("WeaponParam", "damage_type", iIndex))
        {
            // End:0x3F2
            case "Bullet_Normal":
                wParam.damtype = 1;
                // End:0x463
                break;
            // End:0x417
            case "Bullet_Heavy":
                wParam.damtype = 2;
                // End:0x463
                break;
            // End:0x43C
            case "Explo_Normal":
                wParam.damtype = 3;
                // End:0x463
                break;
            // End:0x460
            case "Explo_Heavy":
                wParam.damtype = 4;
                // End:0x463
                break;
            // End:0xFFFF
            default:
                break;
        }
        switch(GameData.getData("WeaponParam", "fire_mode", iIndex))
        {
            // End:0x4AF
            case "Single":
                wParam.iFireMode = 0;
                // End:0x4CE
                break;
            // End:0x4CB
            case "Auto":
                wParam.iFireMode = 1;
                // End:0x4CE
                break;
            // End:0xFFFF
            default:
                break;
        }
        wParam.iPriority = int(GameData.getData("WeaponParam", "weapon_priority", iIndex));
        wParam.bAimAvailable = bool(GameData.getData("WeaponParam", "aim_fire", iIndex));
        wParam.fRateOfFire = float(GameData.getData("WeaponParam", "rate_of_fire", iIndex));
        wParam.iRoundBurstCount = int(GameData.getData("WeaponParam", "round_burst_count", iIndex));
        wParam.fRoundBurstTime = float(GameData.getData("WeaponParam", "round_burst_time", iIndex));
        wParam.fFireDelay = float(GameData.getData("WeaponParam", "fire_delay", iIndex));
        wParam.fMeleeDelay = float(GameData.getData("WeaponParam", "melee_delay", iIndex));
        wParam.fZoomFOV = float(GameData.getData("WeaponParam", "zoom_1", iIndex));
        wParam.bOverHeat = bool(GameData.getData("WeaponParam", "overheat", iIndex));
        wParam.fOverHeat_Up = float(GameData.getData("WeaponParam", "overheat_up", iIndex));
        wParam.fOverHeat_Down = float(GameData.getData("WeaponParam", "overheat_down", iIndex));
        switch(GameData.getData("WeaponParam", "bullet_type", iIndex))
        {
            // End:0x7DB
            case "Instant":
                wParam.BulletType = 1;
                // End:0x801
                break;
            // End:0x7FE
            case "Projectile":
                wParam.BulletType = 2;
                // End:0x801
                break;
            // End:0xFFFF
            default:
                break;
        }
        switch(GameData.getData("WeaponParam", "projectile_move_type", iIndex))
        {
            // End:0x855
            case "TW":
                wParam.ProjMoveType = 1;
                // End:0x899
                break;
            // End:0x871
            case "RPG":
                wParam.ProjMoveType = 2;
                // End:0x899
                break;
            // End:0x896
            case "FlameThrower":
                wParam.ProjMoveType = 3;
                // End:0x899
                break;
            // End:0xFFFF
            default:
                break;
        }
        switch(GameData.getData("WeaponParam", "crosshair_type", iIndex))
        {
            // End:0x8EA
            case "basic":
                wParam.CrosshairType = 0;
                // End:0x90B
                break;
            // End:0x908
            case "image":
                wParam.CrosshairType = 1;
                // End:0x90B
                break;
            // End:0xFFFF
            default:
                break;
        }
        wParam.CrosshairImage = GameData.getData("WeaponParam", "crosshair_image", iIndex);
        wParam.iBulletCount = int(GameData.getData("WeaponParam", "bullet_count", iIndex));
        wParam.fProjSpeed = float(GameData.getData("WeaponParam", "projectile_speed", iIndex));
        wParam.bExplodeCollide = bool(GameData.getData("WeaponParam", "bullet_impact_explode", iIndex));
        wParam.bProjTakeDamage = bool(GameData.getData("WeaponParam", "projectile_take_damage", iIndex));
        wParam.iBombWeaponID = int(GameData.getData("WeaponParam", "bombing_weapon_id", iIndex));
        wParam.fFuseTime = float(GameData.getData("WeaponParam", "fuse_time", iIndex));
        wParam.fActiveTime = float(GameData.getData("WeaponParam", "active_time", iIndex));
        wParam.i2ndBulletCount = int(GameData.getData("WeaponParam", "2nd_bullet_count", iIndex));
        wParam.bBulletLandExplode = bool(GameData.getData("WeaponParam", "bullet_land_explode", iIndex));
        wParam.fBulletGravity = float(GameData.getData("WeaponParam", "bullet_gravity", iIndex));
        // End:0xC20
        if(wParam.fBulletGravity == 0.0000000)
        {
            wParam.fBulletGravity = 1.0000000;
        }
        wParam.fProjDecelEachBound = float(GameData.getData("WeaponParam", "bullet_bound_decel", iIndex));
        wParam.fProjSpin = float(GameData.getData("WeaponParam", "bullet_throw_rotate", iIndex));
        wParam.fProjThrowPitch = float(GameData.getData("WeaponParam", "bullet_throw_angle", iIndex));
        wParam.iDamage = int(GameData.getData("WeaponParam", "damage", iIndex));
        wParam.fMomentum = float(GameData.getData("WeaponParam", "momentum", iIndex));
        wParam.fMomentum_Pawn = float(GameData.getData("WeaponParam", "momentum_char", iIndex));
        wParam.fDamRange_Eff = float(GameData.getData("WeaponParam", "damage_effective_range", iIndex));
        wParam.fDamRange_Max = float(GameData.getData("WeaponParam", "damage_outer_range", iIndex));
        wParam.iDam_OOR = int(GameData.getData("WeaponParam", "damage_outer", iIndex));
        wParam.iDamMelee = int(GameData.getData("WeaponParam", "melee_damage", iIndex));
        wParam.fDamPerc_Head = float(GameData.getData("WeaponParam", "parts_damage_head", iIndex));
        wParam.fDamPerc_UpperTorso = float(GameData.getData("WeaponParam", "parts_damage_uppertorso", iIndex));
        wParam.fDamPerc_LowerTorso = float(GameData.getData("WeaponParam", "parts_damage_lowertorso", iIndex));
        wParam.fDamPerc_UpperArm = float(GameData.getData("WeaponParam", "parts_damage_upperarm", iIndex));
        wParam.fDamPerc_LowerArm = float(GameData.getData("WeaponParam", "parts_damage_lowerarm", iIndex));
        wParam.fDamPerc_UpperLeg = float(GameData.getData("WeaponParam", "parts_damage_upperleg", iIndex));
        wParam.fDamPerc_LowerLeg = float(GameData.getData("WeaponParam", "parts_damage_lowerleg", iIndex));
        wParam.fDamPerc_Heli = float(GameData.getData("WeaponParam", "parts_damage_heli", iIndex));
        wParam.bHitEffFriendly = bool(GameData.getData("WeaponParam", "hit_effect_friendly", iIndex));
        wParam.fHitGunKick = float(GameData.getData("WeaponParam", "hit_gun_kick", iIndex));
        wParam.fHitStunTime = float(GameData.getData("WeaponParam", "hit_stun_time", iIndex));
        wParam.fHitFlashTime = float(GameData.getData("WeaponParam", "hit_view_flash_time", iIndex));
        wParam.fHitFreezeTime = float(GameData.getData("WeaponParam", "hit_freeze_time", iIndex));
        wParam.fHitEAXEffectTime = float(GameData.getData("WeaponParam", "hit_eaxsound_time", iIndex));
        wParam.strHitEAXEffectClass = GameData.getData("WeaponParam", "hit_eaxsound_class", iIndex);
        wParam.fHitFireTime = float(GameData.getData("WeaponParam", "hit_fire_time", iIndex));
        switch(GameData.getData("WeaponParam", "reload_type", iIndex))
        {
            // End:0x136C
            case "Magazine":
                wParam.ReloadType = 1;
                // End:0x138E
                break;
            // End:0x138B
            case "Bullet":
                wParam.ReloadType = 2;
                // End:0x138E
                break;
            // End:0xFFFF
            default:
                break;
        }
        wParam.bRechamber = bool(GameData.getData("WeaponParam", "rechamber", iIndex));
        wParam.fRechamberRate = float(GameData.getData("WeaponParam", "ani_time_rechamber", iIndex));
        wParam.fReloadRate = float(GameData.getData("WeaponParam", "ani_time_reload", iIndex));
        wParam.fReloadEmptyRate = float(GameData.getData("WeaponParam", "ani_time_reload_empty", iIndex));
        wParam.fReloadBeginRate = float(GameData.getData("WeaponParam", "ani_time_reload_start", iIndex));
        wParam.fReloadEndRate = float(GameData.getData("WeaponParam", "ani_time_reload_end", iIndex));
        wParam.fExplRad_Inner = float(GameData.getData("WeaponParam", "explosion_inner_radius", iIndex));
        wParam.fExplRad_Outer = float(GameData.getData("WeaponParam", "explosion_outer_radius", iIndex));
        wParam.fExplDam_Inner = float(GameData.getData("WeaponParam", "explosion_inner_damage", iIndex));
        wParam.fExplDam_Outer = float(GameData.getData("WeaponParam", "explosion_outer_damage", iIndex));
        wParam.fExplForce_Effect = float(GameData.getData("WeaponParam", "ground_rumble_force", iIndex));
        wParam.fExplRad_Effect = float(GameData.getData("WeaponParam", "ground_rumble_radius", iIndex));
        wParam.iAmmo_Initial = int(GameData.getData("WeaponParam", "start_ammo", iIndex));
        wParam.iAmmo_Magazine = int(GameData.getData("WeaponParam", "clip_size", iIndex));
        wParam.iAmmo_Reload = int(GameData.getData("WeaponParam", "reload_ammo", iIndex));
        wParam.iAmmo_Max = int(GameData.getData("WeaponParam", "max_ammo", iIndex));
        wParam.fSpread_Jump = float(GameData.getData("WeaponParam", "spread_jump", iIndex));
        wParam.fSpread_Stand_Min = float(GameData.getData("WeaponParam", "spread_stand_min", iIndex));
        wParam.fSpread_Stand_Max = float(GameData.getData("WeaponParam", "spread_stand_max", iIndex));
        wParam.fSpread_Ducked_Min = float(GameData.getData("WeaponParam", "spread_ducked_min", iIndex));
        wParam.fSpread_Ducked_Max = float(GameData.getData("WeaponParam", "spread_ducked_max", iIndex));
        wParam.fSpread_Prone_Min = float(GameData.getData("WeaponParam", "spread_prone_min", iIndex));
        wParam.fSpread_Prone_Max = float(GameData.getData("WeaponParam", "spread_prone_max", iIndex));
        wParam.fSpread_Move_Add = float(GameData.getData("WeaponParam", "spread_move_add", iIndex));
        wParam.fSpread_Fire_Add = float(GameData.getData("WeaponParam", "spread_fire_add", iIndex));
        wParam.fSpread_Image_Increase = float(GameData.getData("WeaponParam", "spread_out_speed", iIndex));
        wParam.fSpread_Stand_Reduce = float(GameData.getData("WeaponParam", "spread_stand_in_rt", iIndex));
        wParam.fSpread_Ducked_Reduce = float(GameData.getData("WeaponParam", "spread_ducked_in_rt", iIndex));
        wParam.fSpread_Prone_Reduce = float(GameData.getData("WeaponParam", "spread_prone_in_rt", iIndex));
        wParam.fSpread_Aim_move_add = float(GameData.getData("WeaponParam", "spread_aim_move_add", iIndex));
        wParam.fViewKickHip_XMin = float(GameData.getData("WeaponParam", "view_kick_hip_x_min", iIndex));
        wParam.fViewKickHip_XMax = float(GameData.getData("WeaponParam", "view_kick_hip_x_max", iIndex));
        wParam.fViewKickHip_YMin = float(GameData.getData("WeaponParam", "view_kick_hip_y_min", iIndex));
        wParam.fViewKickHip_YMax = float(GameData.getData("WeaponParam", "view_kick_hip_y_max", iIndex));
        wParam.fViewKickHip_Accel = float(GameData.getData("WeaponParam", "view_kick_hip_accel", iIndex));
        wParam.fViewKickHip_Decel = float(GameData.getData("WeaponParam", "view_kick_hip_decel", iIndex));
        wParam.fViewKickHip_StayTime = float(GameData.getData("WeaponParam", "view_kick_hip_stay_time", iIndex));
        wParam.fViewKickHip_DecaySpeed = float(GameData.getData("WeaponParam", "view_kick_hip_decay_speed", iIndex));
        wParam.fViewKickHip_DecayTimeFast = float(GameData.getData("WeaponParam", "view_kick_hip_decay_time_fast", iIndex));
        wParam.fViewKickAds_XMin = float(GameData.getData("WeaponParam", "view_kick_ads_x_min", iIndex));
        wParam.fViewKickAds_XMax = float(GameData.getData("WeaponParam", "view_kick_ads_x_max", iIndex));
        wParam.fViewKickAds_YMin = float(GameData.getData("WeaponParam", "view_kick_ads_y_min", iIndex));
        wParam.fViewKickAds_YMax = float(GameData.getData("WeaponParam", "view_kick_ads_y_max", iIndex));
        wParam.fViewKickAds_Accel = float(GameData.getData("WeaponParam", "view_kick_ads_accel", iIndex));
        wParam.fViewKickAds_Decel = float(GameData.getData("WeaponParam", "view_kick_ads_decel", iIndex));
        wParam.fViewKickAds_StayTime = float(GameData.getData("WeaponParam", "view_kick_ads_stay_time", iIndex));
        wParam.fViewKickAds_DecaySpeed = float(GameData.getData("WeaponParam", "view_kick_ads_decay_speed", iIndex));
        wParam.fViewKickAds_DecayTimeFast = float(GameData.getData("WeaponParam", "view_kick_ads_decay_time_fast", iIndex));
        wParam.fBreathRadius_Idle = float(GameData.getData("WeaponParam", "breath_stand_gun", iIndex));
        wParam.fBreathSpeed_Idle = float(GameData.getData("WeaponParam", "breath_stand_gun_speed", iIndex));
        wParam.fBreathRadius_Aim = float(GameData.getData("WeaponParam", "breath_ads_gunnaim", iIndex));
        wParam.fBreathSpeed_Aim = float(GameData.getData("WeaponParam", "breath_ads_gunnaim_speed", iIndex));
        wParam.fBreathRadius_DuckedAim = float(GameData.getData("WeaponParam", "breath_ads_ducked_gunnaim", iIndex));
        wParam.fBreathSpeed_DuckedAim = float(GameData.getData("WeaponParam", "breath_ads_ducked_gunnaim_speed", iIndex));
        wParam.fBreathRadius_ProneAim = float(GameData.getData("WeaponParam", "breath_ads_prone_gunnaim", iIndex));
        wParam.fBreathSpeed_ProneAim = float(GameData.getData("WeaponParam", "breath_ads_prone_gunnaim_speed", iIndex));
        wParam.fBobWeapon_Move = float(GameData.getData("WeaponParam", "bob_hip_move_gun", iIndex));
        wParam.fBobScreen_Move = float(GameData.getData("WeaponParam", "bob_hip_move_view", iIndex));
        wParam.fBobWeapon_Ads_Move = float(GameData.getData("WeaponParam", "bob_ads_move_gunnaim", iIndex));
        wParam.fBobScreen_Ads_Move = float(GameData.getData("WeaponParam", "bob_ads_move_view", iIndex));
        wParam.fBobWeapon_Ducked_Move = float(GameData.getData("WeaponParam", "bob_hip_ducked_move_gun", iIndex));
        wParam.fBobScreen_Ducked_Move = float(GameData.getData("WeaponParam", "bob_hip_ducked_move_view", iIndex));
        wParam.fBobScreen_Prone_Move = float(GameData.getData("WeaponParam", "bob_hip_prone_move_view", iIndex));
        wParam.fBobWeapon_Sprint_Move = float(GameData.getData("WeaponParam", "bob_sprint_gun", iIndex));
        wParam.fBobScreen_Sprint_Move = float(GameData.getData("WeaponParam", "bob_sprint_view", iIndex));
        wParam.fBobWeapon_sprint_y = float(GameData.getData("WeaponParam", "bob_sprint_gun_y", iIndex));
        wParam.fBobScreen_sprint_y = float(GameData.getData("WeaponParam", "bob_sprint_view_y", iIndex));
        wParam.fBobWeapon_ads_move_y = float(GameData.getData("WeaponParam", "bob_ads_move_gunnaim_y", iIndex));
        wParam.fBobScreen_ads_move_y = float(GameData.getData("WeaponParam", "bob_ads_move_view_y", iIndex));
        wParam.fBobWeapon_move_y = float(GameData.getData("WeaponParam", "bob_hip_move_gun_y", iIndex));
        wParam.fBobScreen_move_y = float(GameData.getData("WeaponParam", "bob_hip_move_view_y", iIndex));
        wParam.fBobWeapon_ducked_move_y = float(GameData.getData("WeaponParam", "bob_hip_ducked_move_gun_y", iIndex));
        wParam.fBobScreen_ducked_move_y = float(GameData.getData("WeaponParam", "bob_hip_ducked_move_view_y", iIndex));
        wParam.fBobScreen_prone_move_y = float(GameData.getData("WeaponParam", "bob_hip_prone_move_view_y", iIndex));
        wParam.fHitMoveSpeed = float(GameData.getData("WeaponParam", "hit_gun_move_speed", iIndex));
        wParam.fHitMoveTime = float(GameData.getData("WeaponParam", "hit_gun_move_time", iIndex));
        wParam.fHitMoveDelay = float(GameData.getData("WeaponParam", "hit_gun_move_delay", iIndex));
        wParam.fSprintSpeed = float(GameData.getData("WeaponParam", "wp_sprint_move", iIndex));
        wParam.fRunSpeed = float(GameData.getData("WeaponParam", "wp_stand_move", iIndex));
        wParam.fCrouchSpeed = float(GameData.getData("WeaponParam", "wp_crouch_move", iIndex));
        wParam.fPronedSpeed = float(GameData.getData("WeaponParam", "wp_prone_move", iIndex));
        wParam.fAimRunSpeed = float(GameData.getData("WeaponParam", "wp_aim_move", iIndex));
        wParam.fAimCrouchSpeed = float(GameData.getData("WeaponParam", "wp_crouch_aim_move", iIndex));
        wParam.fAnimRate_PutDown = float(GameData.getData("WeaponParam", "ani_rate_drop", iIndex));
        wParam.fAnimRate_PutDown_Quick = float(GameData.getData("WeaponParam", "ani_rate_drop_quick", iIndex));
        wParam.fAnimRate_BringUp = float(GameData.getData("WeaponParam", "ani_rate_raise", iIndex));
        wParam.fAnimRate_SprintBringUp = float(GameData.getData("WeaponParam", "ani_rate_sprint_raise", iIndex));
        wParam.fAnimRate_AdsOn = float(GameData.getData("WeaponParam", "ani_rate_ads_on", iIndex));
        wParam.fAnimRate_AdsOff = float(GameData.getData("WeaponParam", "ani_rate_ads_off", iIndex));
        wParam.bApplyQuickDrop = bool(GameData.getData("WeaponParam", "drop_quick", iIndex));
        wParam.fSway_HipX_Max = float(GameData.getData("WeaponParam", "sway_gun_hip_x_max_angle", iIndex));
        wParam.fSway_HipX_Incr = float(GameData.getData("WeaponParam", "sway_gun_hip_x_move_angle", iIndex));
        wParam.fSway_HipX_Speed = float(GameData.getData("WeaponParam", "sway_gun_hip_x_move", iIndex));
        wParam.fSway_HipY_Max = float(GameData.getData("WeaponParam", "sway_gun_hip_y_max_angle", iIndex));
        wParam.fSway_HipY_Incr = float(GameData.getData("WeaponParam", "sway_gun_hip_y_move_angle", iIndex));
        wParam.fSway_HipY_Speed = float(GameData.getData("WeaponParam", "sway_gun_hip_y_move", iIndex));
        wParam.fSway_AdsX_Max = float(GameData.getData("WeaponParam", "sway_gun_ads_x_max_angle", iIndex));
        wParam.fSway_AdsX_Incr = float(GameData.getData("WeaponParam", "sway_gun_ads_x_move_angle", iIndex));
        wParam.fSway_AdsX_Speed = float(GameData.getData("WeaponParam", "sway_gun_ads_x_move", iIndex));
        wParam.fSway_AdsY_Max = float(GameData.getData("WeaponParam", "sway_gun_ads_y_max_angle", iIndex));
        wParam.fSway_AdsY_Incr = float(GameData.getData("WeaponParam", "sway_gun_ads_y_move_angle", iIndex));
        wParam.fSway_AdsY_Speed = float(GameData.getData("WeaponParam", "sway_gun_ads_y_move", iIndex));
        wParam.fMaxPitch = float(GameData.getData("WeaponParam", "view_angle_pitch_max", iIndex));
        wParam.iCrossHair = int(GameData.getData("WeaponParam", "crosshair_id", iIndex));
        wParam.fMovePivot = float(GameData.getData("WeaponParam", "gun_pos_hip_move_front_y", iIndex));
        wParam.fNPCSpreadRate = float(GameData.getData("WeaponParam", "npc_spread_rate", iIndex));
        wParam.fNPCRateOfFire = float(GameData.getData("WeaponParam", "npc_rate_of_fire", iIndex));
        wParam.iNPCFire = int(GameData.getData("WeaponParam", "npc_fire", iIndex));
        ilength = WeaponParams.Length;
        WeaponParams.Insert(ilength, 1);
        WeaponParams[ilength] = wParam;
        iIndex++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x31A7:

    //return;    
}

event wWeaponBaseParams GetBaseParam(int id)
{
    local int ilength, iTemp;

    ilength = WeaponParams.Length;
    iTemp = 0;
    J0x13:

    // End:0x56 [Loop If]
    if(iTemp < ilength)
    {
        // End:0x4C
        if(WeaponParams[iTemp].iWeaponID == id)
        {
            return WeaponParams[iTemp];
        }
        iTemp++;
        // [Loop Continue]
        goto J0x13;
    }
    return none;
    //return;    
}

static function PrecacheClasses()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(lp1 < default.arr_szResClass.Length)
    {
        Class<wWeaponRes_Base>(static.DynamicLoadObject(default.arr_szResClass[lp1], Class'Core.Class')).PrecacheClasses();
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

static function PrecacheMaterials(LevelInfo Level)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(lp1 < default.arr_szResClass.Length)
    {
        Class<wWeaponRes_Base>(static.DynamicLoadObject(default.arr_szResClass[lp1], Class'Core.Class')).PrecacheMaterials(Level);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

static function PrecacheSound()
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(lp1 < default.arr_szResClass.Length)
    {
        Class<wWeaponRes_Base>(static.DynamicLoadObject(default.arr_szResClass[lp1], Class'Core.Class')).PrecacheSound();
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    arr_szResClass[0]="WWeapons_Res.wWeaponRes_AK47"
    arr_szResClass[1]="WWeapons_Res.wWeaponRes_Artillery"
    arr_szResClass[2]="WWeapons_Res.wWeaponRes_Cheytac"
    arr_szResClass[3]="WWeapons_Res.wWeaponRes_DemoPack"
    arr_szResClass[4]="WWeapons_Res.wWeaponRes_FragGrenade"
    arr_szResClass[5]="WWeapons_Res.wWeaponRes_Knife"
    arr_szResClass[6]="WWeapons_Res.wWeaponRes_M1911"
    arr_szResClass[7]="WWeapons_Res.wWeaponRes_M2B"
    arr_szResClass[8]="WWeapons_Res.wWeaponRes_MP5"
    arr_szResClass[9]="WWeapons_Res.wWeaponRes_RPG7"
    arr_szResClass[10]="WWeapons_Res.wWeaponRes_SatchelCharge"
    arr_szResClass[11]="WWeapons_Res.wWeaponRes_StunGrenade"
    arr_szResClass[12]="WWeapons_Res.wWeaponRes_Target"
    arr_szResClass[13]="WWeapons_Res.wWeaponRes_G3"
    arr_szResClass[14]="WWeapons_Res.wWeaponRes_HeliAK47"
    arr_szResClass[15]="WWeapons_Res.wWeaponRes_M21"
    arr_szResClass[16]="WWeapons_Res.wWeaponRes_SmokeGrenade"
    arr_szResClass[17]="WWeapons_Res.wWeaponRes_RagingBull"
    arr_szResClass[18]="WWeapons_Res.wWeaponRes_M4A1"
    arr_szResClass[19]="WWeapons_Res.wWeaponRes_UZI"
    arr_szResClass[20]="WWeapons_Res.wWeaponRes_Glock17"
    arr_szResClass[21]="WWeapons_Res.wWeaponRes_M24"
    arr_szResClass[22]="WWeapons_Res.wWeaponRes_UMP45"
    arr_szResClass[23]="WWeapons_Res.wWeaponRes_M14"
    arr_szResClass[24]="WWeapons_Res.wWeaponRes_AK74M"
    arr_szResClass[25]="WWeapons_Res.wWeaponRes_MG3"
    arr_szResClass[26]="WWeapons_Res.wWeaponRes_HeliPack"
    arr_szResClass[27]="WWeapons_Res.wWeaponRes_MP7"
    arr_szResClass[28]="WWeapons_Res.wWeaponRes_HeliGun"
    arr_szResClass[29]="WWeapons_Res.wWeaponRes_HeliRPG7"
    arr_szResClass[30]="WWeapons_Res.wWeaponRes_Hecate"
    arr_szResClass[31]="WWeapons_Res.wWeaponRes_UAVPack"
    arr_szResClass[32]="WWeapons_Res.wWeaponRes_ATR"
    arr_szResClass[33]="WWeapons_Res.wWeaponRes_SCAR"
    arr_szResClass[34]="WWeapons_Res.wWeaponRes_SIGp229"
    arr_szResClass[35]="WWeapons_Res.wWeaponRes_F2000"
    arr_szResClass[36]="WWeapons_Res.wWeaponRes_G36C"
    arr_szResClass[37]="WWeapons_Res.wWeaponRes_K2"
    arr_szResClass[38]="WWeapons_Res.wWeaponRes_K7"
    arr_szResClass[39]="WWeapons_Res.wWeaponRes_KACPDW"
    arr_szResClass[40]="WWeapons_Res.wWeaponRes_IncGrenade"
    arr_szResClass[41]="WWeapons_Res.wWeaponRes_IncGrenadeFlame"
    arr_szResClass[42]="WWeapons_Res.wWeaponRes_SplitGrenade"
    arr_szResClass[43]="WWeapons_Res.wWeaponRes_SplitGrenadeFragment"
    arr_szResClass[44]="WWeapons_Res.wWeaponRes_HellFire"
    arr_szResClass[45]="WWeapons_Res.wWeaponRes_Dragunov"
    arr_szResClass[46]="WWeapons_Res.wWeaponRes_SCARL"
    arr_szResClass[47]="WWeapons_Res.wWeaponRes_P90"
    arr_szResClass[48]="WWeapons_Res.wWeaponRes_ACR"
    arr_szResClass[49]="WWeapons_Res.wWeaponRes_M4A1HE"
    arr_szResClass[50]="WWeapons_Res.wWeaponRes_DesertEagle"
    arr_szResClass[51]="WWeapons_Res.wWeaponRes_KrissSV"
    arr_szResClass[52]="WWeapons_Res.wWeaponRes_KTR08"
    arr_szResClass[53]="WWeapons_Res.wWeaponRes_Vector"
    arr_szResClass[54]="WWeapons_Res.wWeaponRes_BarrettM82A1"
    arr_szResClass[55]="WWeapons_Res.wWeaponRes_Tar21"
    arr_szResClass[56]="WWeapons_Res.wWeaponRes_AK74U"
    arr_szResClass[57]="WWeapons_Res.wWeaponRes_M16A4"
    arr_szResClass[58]="WWeapons_Res.wWeaponRes_Fiveseven"
    arr_szResClass[59]="WWeapons_Res.wWeaponRes_AUGA3"
    arr_szResClass[60]="WWeapons_Res.wWeaponRes_BIZON"
    arr_szResClass[61]="WWeapons_Res.wWeaponRes_GALIL"
    arr_szResClass[62]="WWeapons_Res.wWeaponRes_DSR"
    arr_szResClass[63]="WWeapons_Res.wWeaponRes_AirStrikePack"
    arr_szResClass[64]="WWeapons_Res.wWeaponRes_FreezeGrenade"
    BaseSpeed_Sprint[0]=600.0000000
    BaseSpeed_Sprint[1]=630.0000000
    BaseSpeed_Sprint[2]=630.0000000
    BaseSpeed_Sprint[3]=600.0000000
    BaseSpeed_Run[0]=400.0000000
    BaseSpeed_Run[1]=420.0000000
    BaseSpeed_Run[2]=420.0000000
    BaseSpeed_Run[3]=400.0000000
    BaseSpeed_Aim[0]=160.0000000
    BaseSpeed_Aim[1]=336.0000000
    BaseSpeed_Aim[2]=160.0000000
    BaseSpeed_Aim[3]=160.0000000
    BaseSpeed_Run_Cr[0]=264.0000000
    BaseSpeed_Run_Cr[1]=277.0000000
    BaseSpeed_Run_Cr[2]=277.0000000
    BaseSpeed_Run_Cr[3]=264.0000000
    BaseSpeed_Aim_Cr[0]=106.0000000
    BaseSpeed_Aim_Cr[1]=222.0000000
    BaseSpeed_Aim_Cr[2]=106.0000000
    BaseSpeed_Aim_Cr[3]=106.0000000
    BaseSpeed_Prone[0]=100.0000000
    BaseSpeed_Prone[1]=105.0000000
    BaseSpeed_Prone[2]=105.0000000
    BaseSpeed_Prone[3]=100.0000000
}