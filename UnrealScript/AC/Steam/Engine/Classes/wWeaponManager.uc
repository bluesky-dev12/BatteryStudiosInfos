/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wWeaponManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:14
 *
 *******************************************************************************/
class wWeaponManager extends Object
    native;

var array<wWeaponBaseParams> WeaponParams;
var array<string> arr_szResClass;
var array< class<wWeaponRes_Base> > arr_classRes;
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
    LoadWeaponExParams();
    LoadWeaponRecoilParams();
}

event DestroyScript()
{
    arr_szResClass.Length = 0;
    WeaponParams.Length = 0;
}

event LoadWeaponRes()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x48 [While If]
    if(i < arr_szResClass.Length)
    {
        arr_classRes[i] = class<wWeaponRes_Base>(DynamicLoadObject(arr_szResClass[i], class'Class'));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

event InitWeaponPrecacheClasses()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x36 [While If]
    if(i < arr_szResClass.Length)
    {
        arr_classRes[i].static.PrecacheClasses();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function class<wWeaponRes_Base> GetRes(string szRes)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x42 [While If]
    if(i < arr_szResClass.Length)
    {
        // End:0x38
        if(szRes == arr_szResClass[i])
        {
            return arr_classRes[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function LoadWeaponRecoilParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(WeaponParams.Length <= 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadWeaponRecoilParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddWeaponRecoilParams(GameData);
}

function AddWeaponRecoilParams(BTNetGameData GameData)
{
    local int iIndex;
    local string strTemp;
    local int i, j, bounding_max, ItemID;
    local string strAim;
    local array<string> strForTrim;

    iIndex = 0;
    J0x07:
    // End:0x550 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("WeaponParam", "item_id", iIndex);
        // End:0x52
        if(strTemp == "99999")
        {
        }
        // End:0x550
        else
        {
            ItemID = int(strTemp);
            i = 0;
            J0x66:
            // End:0x546 [While If]
            if(i < WeaponParams.Length)
            {
                // End:0x53c
                if(WeaponParams[i].iWeaponID == ItemID)
                {
                    strAim = GameData.getData("WeaponParam", "console_command", iIndex);
                    Split(strAim, " ", strForTrim);
                    strAim = "";
                    j = 0;
                    J0xea:
                    // End:0x118 [While If]
                    if(j < strForTrim.Length)
                    {
                        strAim $= strForTrim[j];
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0xea;
                    }
                    // End:0x32a
                    if(StrCmp("setweapontrace", strAim) == 0)
                    {
                        WeaponParams[i].wt_RandomMul = float(GameData.getData("WeaponParam", "random_max", iIndex));
                        bounding_max = int(GameData.getData("WeaponParam", "bounding_max", iIndex));
                        WeaponParams[i].wt_BoundingMax = float(bounding_max);
                        WeaponParams[i].wt_x.Length = bounding_max;
                        WeaponParams[i].wt_y.Length = bounding_max;
                        WeaponParams[i].wt_RandomWeight.Length = bounding_max;
                        j = 0;
                        J0x224:
                        // End:0x324 [While If]
                        if(j < bounding_max)
                        {
                            WeaponParams[i].wt_x[j] = float(GameData.getData("WeaponParam", "x" $ string(j + 1), iIndex));
                            WeaponParams[i].wt_y[j] = float(GameData.getData("WeaponParam", "y" $ string(j + 1), iIndex));
                            WeaponParams[i].wt_RandomWeight[j] = float(GameData.getData("WeaponParam", "r" $ string(j + 1), iIndex));
                            ++ j;
                            // This is an implied JumpToken; Continue!
                            goto J0x224;
                        }
                        // This is an implied JumpToken;
                        goto J0x546;
                    }
                    // End:0x53c
                    else
                    {
                        // End:0x53c
                        if(StrCmp("setweapontraceaim", strAim) == 0)
                        {
                            WeaponParams[i].wtAim_RandomMul = float(GameData.getData("WeaponParam", "random_max", iIndex));
                            bounding_max = int(GameData.getData("WeaponParam", "bounding_max", iIndex));
                            WeaponParams[i].wtAim_BoundingMax = float(bounding_max);
                            WeaponParams[i].wtAim_x.Length = bounding_max;
                            WeaponParams[i].wtAim_y.Length = bounding_max;
                            WeaponParams[i].wtAim_RandomWeight.Length = bounding_max;
                            j = 0;
                            J0x439:
                            // End:0x539 [While If]
                            if(j < bounding_max)
                            {
                                WeaponParams[i].wtAim_x[j] = float(GameData.getData("WeaponParam", "x" $ string(j + 1), iIndex));
                                WeaponParams[i].wtAim_y[j] = float(GameData.getData("WeaponParam", "y" $ string(j + 1), iIndex));
                                WeaponParams[i].wtAim_RandomWeight[j] = float(GameData.getData("WeaponParam", "r" $ string(j + 1), iIndex));
                                ++ j;
                                // This is an implied JumpToken; Continue!
                                goto J0x439;
                            }
                        }
                        // End:0x546
                        else
                        {
                        }
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x66;
                }
            }
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function LoadWeaponParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(WeaponParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadWeaponParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddParams(GameData);
}

function AddParams(BTNetGameData GameData)
{
    local wWeaponBaseParams wParam;
    local int iIndex, iLength;
    local string strTemp;

    iIndex = 0;
    J0x07:
    // End:0x3355 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("WeaponParam", "display_name", iIndex);
        // End:0x57
        if(strTemp == "99999")
        {
        }
        // End:0x3355
        else
        {
            wParam = new class'wWeaponBaseParams';
            wParam.iWeaponID = int(GameData.getData("WeaponParam", "item_id", iIndex));
            wParam.strName = strTemp;
            wParam.szClass_Resource = GameData.getData("WeaponParam", "weapon_resource_id", iIndex);
            wParam.iInventoryGroup = int(GameData.getData("WeaponParam", "weapon_num", iIndex));
            switch(GameData.getData("WeaponParam", "weapon_type", iIndex))
            {
                // End:0x186
                case "Pistol":
                    wParam.eType = 4;
                    // End:0x39c
                    break;
                // End:0x1a1
                case "AR":
                    wParam.eType = 1;
                    // End:0x39c
                    break;
                // End:0x1bd
                case "SMG":
                    wParam.eType = 3;
                    // End:0x39c
                    break;
                // End:0x1d8
                case "SR":
                    wParam.eType = 2;
                    // End:0x39c
                    break;
                // End:0x1f3
                case "GR":
                    wParam.eType = 5;
                    // End:0x39c
                    break;
                // End:0x213
                case "Shotgun":
                    wParam.eType = 6;
                    // End:0x39c
                    break;
                // End:0x22f
                case "RPG":
                    wParam.eType = 7;
                    // End:0x39c
                    break;
                // End:0x254
                case "FlameThrower":
                    wParam.eType = 8;
                    // End:0x39c
                    break;
                // End:0x26f
                case "MG":
                    wParam.eType = 9;
                    // End:0x39c
                    break;
                // End:0x28c
                case "Demo":
                    wParam.eType = 10;
                    // End:0x39c
                    break;
                // End:0x2ae
                case "AirStrike":
                    wParam.eType = 11;
                    // End:0x39c
                    break;
                // End:0x2cc
                case "Melee":
                    wParam.eType = 12;
                    // End:0x39c
                    break;
                // End:0x2ea
                case "Knife":
                    wParam.eType = 17;
                    // End:0x39c
                    break;
                // End:0x30d
                case "Helicopter":
                    wParam.eType = 13;
                    // End:0x39c
                    break;
                // End:0x339
                case "Telegraph_Airstrike":
                    wParam.eType = 14;
                    // End:0x39c
                    break;
                // End:0x35f
                case "Telegraph_UAV":
                    wParam.eType = 16;
                    // End:0x39c
                    break;
                // End:0x385
                case "Telegraph_HEL":
                    wParam.eType = 15;
                    // End:0x39c
                    break;
                // End:0xffff
                default:
                    wParam.eType = 0;
                    // End:0x39c Break;
                    break;
            }
            switch(GameData.getData("WeaponParam", "damage_type", iIndex))
            {
                // End:0x3f2
                case "Bullet_Normal":
                    wParam.damtype = 1;
                    // End:0x463
                    break;
                // End:0x417
                case "Bullet_Heavy":
                    wParam.damtype = 2;
                    // End:0x463
                    break;
                // End:0x43c
                case "Explo_Normal":
                    wParam.damtype = 3;
                    // End:0x463
                    break;
                // End:0x460
                case "Explo_Heavy":
                    wParam.damtype = 4;
                    // End:0x463
                    break;
                // End:0xffff
                default:
                    switch(GameData.getData("WeaponParam", "fire_mode", iIndex))
                    {
                        // End:0x4af
                        case "Single":
                            wParam.iFireMode = 0;
                            // End:0x4ce
                            break;
                        // End:0x4cb
                        case "Auto":
                            wParam.iFireMode = 1;
                            // End:0x4ce
                            break;
                        // End:0xffff
                        default:
                            wParam.iPriority = int(GameData.getData("WeaponParam", "weapon_priority", iIndex));
                            wParam.bAimAvailable = bool(GameData.getData("WeaponParam", "aim_fire", iIndex));
                            wParam.fRateOfFire = float(GameData.getData("WeaponParam", "rate_of_fire", iIndex));
                            wParam.iRoundBurstCount = int(GameData.getData("WeaponParam", "round_burst_count", iIndex));
                            wParam.fRoundBurstTime = float(GameData.getData("WeaponParam", "round_burst_time", iIndex));
                            wParam.fFireDelay = float(GameData.getData("WeaponParam", "fire_delay", iIndex));
                            wParam.fZoomFOV = float(GameData.getData("WeaponParam", "zoom_1", iIndex));
                            wParam.bOverHeat = bool(GameData.getData("WeaponParam", "overheat", iIndex));
                            wParam.fOverHeat_Up = float(GameData.getData("WeaponParam", "overheat_up", iIndex));
                            wParam.fOverHeat_Down = float(GameData.getData("WeaponParam", "overheat_down", iIndex));
                            switch(GameData.getData("WeaponParam", "bullet_type", iIndex))
                            {
                                // End:0x79c
                                case "Instant":
                                    wParam.BulletType = 1;
                                    // End:0x7c2
                                    break;
                                // End:0x7bf
                                case "Projectile":
                                    wParam.BulletType = 2;
                                    // End:0x7c2
                                    break;
                                // End:0xffff
                                default:
                                    switch(GameData.getData("WeaponParam", "projectile_move_type", iIndex))
                                    {
                                        // End:0x816
                                        case "TW":
                                            wParam.ProjMoveType = 1;
                                            // End:0x85a
                                            break;
                                        // End:0x832
                                        case "RPG":
                                            wParam.ProjMoveType = 2;
                                            // End:0x85a
                                            break;
                                        // End:0x857
                                        case "FlameThrower":
                                            wParam.ProjMoveType = 3;
                                            // End:0x85a
                                            break;
                                        // End:0xffff
                                        default:
                                            switch(GameData.getData("WeaponParam", "crosshair_type", iIndex))
                                            {
                                                // End:0x8ab
                                                case "basic":
                                                    wParam.CrosshairType = 0;
                                                    // End:0x8cc
                                                    break;
                                                // End:0x8c9
                                                case "image":
                                                    wParam.CrosshairType = 1;
                                                    // End:0x8cc
                                                    break;
                                                // End:0xffff
                                                default:
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
                                                    // End:0xbe1
                                                    if(wParam.fBulletGravity == 0.0)
                                                    {
                                                        wParam.fBulletGravity = 1.0;
                                                    }
                                                    wParam.fProjDecelEachBound = float(GameData.getData("WeaponParam", "bullet_bound_decel", iIndex));
                                                    wParam.fProjSpin = float(GameData.getData("WeaponParam", "bullet_throw_rotate", iIndex));
                                                    wParam.fProjThrowPitch = float(GameData.getData("WeaponParam", "bullet_throw_angle", iIndex));
                                                    wParam.iDamage = int(GameData.getData("WeaponParam", "damage", iIndex));
                                                    wParam.fDamWallShot = float(GameData.getData("WeaponParam", "damage_wallshot", iIndex));
                                                    wParam.fMomentum = float(GameData.getData("WeaponParam", "momentum", iIndex));
                                                    wParam.fMomentum_Pawn = float(GameData.getData("WeaponParam", "momentum_char", iIndex));
                                                    wParam.fDamRange_Eff = float(GameData.getData("WeaponParam", "damage_effective_range", iIndex));
                                                    wParam.fDamRange_Max = float(GameData.getData("WeaponParam", "damage_outer_range", iIndex));
                                                    wParam.iDam_OOR = int(GameData.getData("WeaponParam", "damage_outer", iIndex));
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
                                                        // End:0x1330
                                                        case "Magazine":
                                                            wParam.ReloadType = 1;
                                                            // End:0x1352
                                                            break;
                                                        // End:0x134f
                                                        case "Bullet":
                                                            wParam.ReloadType = 2;
                                                            // End:0x1352
                                                            break;
                                                        // End:0xffff
                                                        default:
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
                                                            wParam.iSpread_2nd_StartNum = int(GameData.getData("WeaponParam", "spread_count_2nd", iIndex));
                                                            wParam.fSpread_2nd_Add = float(GameData.getData("WeaponParam", "spread_fire_add_2nd", iIndex));
                                                            wParam.fSpread_2nd_Max = float(GameData.getData("WeaponParam", "spread_stand_max_2nd", iIndex));
                                                            wParam.iSpread_Visual_Add = int(GameData.getData("WeaponParam", "spread_visual_add", iIndex));
                                                            wParam.fSpread_Shotgun = float(GameData.getData("WeaponParam", "spread_shotgun", iIndex));
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
                                                            wParam.fSprintStaminaRate = float(GameData.getData("WeaponParam", "wp_sprint_sta_rate", iIndex));
                                                            wParam.fStaminaRecovery = float(GameData.getData("WeaponParam", "wp_sprint_sta_recovery", iIndex));
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
                                                            iLength = WeaponParams.Length;
                                                            WeaponParams.Insert(iLength, 1);
                                                            WeaponParams[iLength] = wParam;
                                                            ++ iIndex;
                                                            // This is an implied JumpToken; Continue!
                                                            goto J0x07;
                                                        }
                                                    }
}

function LoadWeaponExParams()
{
    local BTNetExcelData excel;
    local int iIndex;
    local bool bResult;
    local string strData;

    // End:0x0e
    if(WeaponParams.Length == 0)
    {
        return;
    }
    excel = new class'BTNetExcelData';
    bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "WeaponEx", 2, 1, 1);
    // End:0x79
    if(!bResult)
    {
        return;
    }
    iIndex = 0;
    J0x80:
    // End:0x828 [While If]
    if(true)
    {
        strData = excel.getData("WeaponEx", "item_id", iIndex);
        // End:0xc5
        if(strData == "99999")
        {
        }
        // End:0x828
        else
        {
            // End:0x120
            if(WeaponParams.Length < iIndex)
            {
                self.UnresolvedNativeFunction_97("Failed to load WeaponExParams (" $ string(WeaponParams.Length) $ ", " $ string(iIndex) $ " )");
            }
            // End:0x828
            else
            {
                WeaponParams[iIndex].fMeleeDelay = float(excel.getData("WeaponEx", "melee_delay", iIndex));
                WeaponParams[iIndex].iDamMelee = int(excel.getData("WeaponEx", "melee_damage", iIndex));
                WeaponParams[iIndex].iMeleeRange = int(excel.getData("WeaponEx", "melee_range", iIndex));
                WeaponParams[iIndex].iMeleeExtent = int(excel.getData("WeaponEx", "melee_extent", iIndex));
                WeaponParams[iIndex].fMeleeDam_Head = float(excel.getData("WeaponEx", "melee_damage_head", iIndex));
                WeaponParams[iIndex].fMeleeDam_UpperTorso = float(excel.getData("WeaponEx", "melee_damage_uppertorso", iIndex));
                WeaponParams[iIndex].fMeleeDam_LowerTorso = float(excel.getData("WeaponEx", "melee_damage_lowertorso", iIndex));
                WeaponParams[iIndex].fMeleeDam_UpperArm = float(excel.getData("WeaponEx", "melee_damage_upperarm", iIndex));
                WeaponParams[iIndex].fMeleeDam_LowerArm = float(excel.getData("WeaponEx", "melee_damage_lowerarm", iIndex));
                WeaponParams[iIndex].fMeleeDam_UpperLeg = float(excel.getData("WeaponEx", "melee_damage_upperleg", iIndex));
                WeaponParams[iIndex].fMeleeDam_LowerLeg = float(excel.getData("WeaponEx", "melee_damage_lowerleg", iIndex));
                WeaponParams[iIndex].fFiringSway_HipX_Max = float(excel.getData("WeaponEx", "sway_gun_hip_x_max_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_HipX_Incr = float(excel.getData("WeaponEx", "sway_gun_hip_x_move_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_HipX_Speed = float(excel.getData("WeaponEx", "sway_gun_hip_x_move_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_HipY_Max = float(excel.getData("WeaponEx", "sway_gun_hip_y_max_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_HipY_Incr = float(excel.getData("WeaponEx", "sway_gun_hip_y_move_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_HipY_Speed = float(excel.getData("WeaponEx", "sway_gun_hip_y_move_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_AdsX_Max = float(excel.getData("WeaponEx", "sway_gun_ads_x_max_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_AdsX_Incr = float(excel.getData("WeaponEx", "sway_gun_ads_x_move_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_AdsX_Speed = float(excel.getData("WeaponEx", "sway_gun_ads_x_move_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_AdsY_Max = float(excel.getData("WeaponEx", "sway_gun_ads_y_max_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_AdsY_Incr = float(excel.getData("WeaponEx", "sway_gun_ads_y_move_angle_fire", iIndex));
                WeaponParams[iIndex].fFiringSway_AdsY_Speed = float(excel.getData("WeaponEx", "sway_gun_ads_y_move_fire", iIndex));
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x80;
            }
        }
    }
}

event wWeaponBaseParams GetBaseParam(int id)
{
    local int iLength, iTemp;

    iLength = WeaponParams.Length;
    iTemp = 0;
    J0x13:
    // End:0x56 [While If]
    if(iTemp < iLength)
    {
        // End:0x4c
        if(WeaponParams[iTemp].iWeaponID == id)
        {
            return WeaponParams[iTemp];
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x13;
    }
    return none;
}

static function PrecacheClasses()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x46 [While If]
    if(lp1 < default.arr_szResClass.Length)
    {
        class<wWeaponRes_Base>(static.DynamicLoadObject(default.arr_szResClass[lp1], class'Class')).PrecacheClasses();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

static function PrecacheMaterials(LevelInfo Level)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x4b [While If]
    if(lp1 < default.arr_szResClass.Length)
    {
        class<wWeaponRes_Base>(static.DynamicLoadObject(default.arr_szResClass[lp1], class'Class')).PrecacheMaterials(Level);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

static function PrecacheSound()
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x46 [While If]
    if(lp1 < default.arr_szResClass.Length)
    {
        class<wWeaponRes_Base>(static.DynamicLoadObject(default.arr_szResClass[lp1], class'Class')).PrecacheSound();
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

defaultproperties
{
    arr_szResClass=// Object reference not set to an instance of an object.
    
    BaseSpeed_Sprint=// Object reference not set to an instance of an object.
    
    BaseSpeed_Run=// Object reference not set to an instance of an object.
    
    BaseSpeed_Aim=// Object reference not set to an instance of an object.
    
    BaseSpeed_Run_Cr=// Object reference not set to an instance of an object.
    
    BaseSpeed_Aim_Cr=// Object reference not set to an instance of an object.
    
    BaseSpeed_Prone=// Object reference not set to an instance of an object.
    
}