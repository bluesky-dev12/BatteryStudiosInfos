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

event InitScript(string strExcelFileName)
{
    LoadWeaponRes();
    LoadWeaponParams(strExcelFileName);
    LoadWeaponRecoilParams();
    //return;    
}

event DestroyScript()
{
    arr_szResClass.Length = 0;
    WeaponParams.Length = 0;
    //return;    
}

function bool IsUseWeapon_InGame(int iGameMode, int iWeaponID)
{
    local wWeaponBaseParams WeaponBaseParam;

    WeaponBaseParam = GetBaseParam(iWeaponID);
    // End:0xAC
    if(WeaponBaseParam != none)
    {
        // End:0xAA
        if(iGameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
        {
            // End:0xAA
            if((WeaponBaseParam.szClass_Resource ~= "WWeapons_Res.wWeaponRes_StunGrenade") || WeaponBaseParam.szClass_Resource ~= "WWeapons_Res.wWeaponRes_SmokeGrenade")
            {
                return false;
            }
        }
        return true;
    }
    return false;
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

event InitWeaponPrecacheClasses()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x36 [Loop If]
    if(i < arr_szResClass.Length)
    {
        arr_classRes[i].static.PrecacheClasses();
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
    local int iIndex;
    local string strTemp;
    local int i, j, bounding_max, ItemID;
    local string strAim;
    local array<string> strForTrim;

    iIndex = 0;
    J0x07:

    // End:0x550 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("WeaponParam", "item_id", iIndex);
        // End:0x52
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x550;
        }
        ItemID = int(strTemp);
        i = 0;
        J0x66:

        // End:0x546 [Loop If]
        if(i < WeaponParams.Length)
        {
            // End:0x53C
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
                // End:0x32A
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

                    // End:0x324 [Loop If]
                    if(j < bounding_max)
                    {
                        WeaponParams[i].wt_x[j] = float(GameData.getData("WeaponParam", "x" $ string(j + 1), iIndex));
                        WeaponParams[i].wt_y[j] = float(GameData.getData("WeaponParam", "y" $ string(j + 1), iIndex));
                        WeaponParams[i].wt_RandomWeight[j] = float(GameData.getData("WeaponParam", "r" $ string(j + 1), iIndex));
                        j++;
                        // [Loop Continue]
                        goto J0x224;
                    }
                    // [Explicit Break]
                    goto J0x546;
                    // [Explicit Continue]
                    goto J0x53C;
                }
                // End:0x53C
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

                    // End:0x539 [Loop If]
                    if(j < bounding_max)
                    {
                        WeaponParams[i].wtAim_x[j] = float(GameData.getData("WeaponParam", "x" $ string(j + 1), iIndex));
                        WeaponParams[i].wtAim_y[j] = float(GameData.getData("WeaponParam", "y" $ string(j + 1), iIndex));
                        WeaponParams[i].wtAim_RandomWeight[j] = float(GameData.getData("WeaponParam", "r" $ string(j + 1), iIndex));
                        j++;
                        // [Loop Continue]
                        goto J0x439;
                    }
                    // [Explicit Break]
                    goto J0x546;
                }
            }
            J0x53C:

            i++;
            // [Loop Continue]
            goto J0x66;
        }
        J0x546:

        iIndex++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x550:

    //return;    
}

function LoadWeaponParams(string strExcelFileName, optional bool bCheat, optional wWeapon Weapon)
{
    local BTNetExcelData excelWeapon, excelWeaponEx;

    WeaponParams.Length = 0;
    excelWeapon = new Class'BTData.BTNetExcelData';
    // End:0x70
    if(false == excelWeapon.LoadExcelData(strExcelFileName, "Weapon", 2, 1, 1))
    {
        Log(("Loading fail, " $ strExcelFileName) $ " sheet name : Weapon");
        return;
    }
    AddWeaponParams(excelWeapon, bCheat, Weapon);
    excelWeaponEx = new Class'BTData.BTNetExcelData';
    // End:0xF2
    if(false == excelWeaponEx.LoadExcelData(strExcelFileName, "WeaponEx", 2, 1, 1))
    {
        Log(("Loading fail, " $ strExcelFileName) $ " sheet name : WeaponEx");
        return;
    }
    AddWeaponExParams(excelWeaponEx, bCheat, Weapon);
    //return;    
}

protected function AddWeaponParams(BTNetExcelData excelWeapon, optional bool bCheat, optional wWeapon Weapon)
{
    local wWeaponBaseParams wParam;
    local int iIndex, iLength, iWeaponID;
    local string strDisplayName;

    iIndex = 0;
    J0x07:

    // End:0x39EE [Loop If]
    if(true)
    {
        strDisplayName = excelWeapon.getData("Weapon", "display_name", iIndex);
        // End:0x4F
        if(strDisplayName == "99999")
        {
            // [Explicit Break]
            goto J0x39EE;
        }
        iWeaponID = int(excelWeapon.getData("Weapon", "item_id", iIndex));
        // End:0xC7
        if(bCheat)
        {
            // End:0xB0
            if(iWeaponID != Weapon.BaseParams.iWeaponID)
            {
                ++iIndex;
                // [Explicit Continue]
                goto J0x39EB;
            }
            wParam = Weapon.BaseParams;            
        }
        else
        {
            wParam = new Class'Engine.wWeaponBaseParams';
            wParam.iWeaponID = iWeaponID;
        }
        wParam.strName = strDisplayName;
        wParam.szClass_Resource = excelWeapon.getData("Weapon", "weapon_resource_id", iIndex);
        wParam.iInventoryGroup = int(excelWeapon.getData("Weapon", "weapon_num", iIndex));
        switch(excelWeapon.getData("Weapon", "weapon_type", iIndex))
        {
            // End:0x1C0
            case "Pistol":
                wParam.eType = 4;
                // End:0x43F
                break;
            // End:0x1DB
            case "AR":
                wParam.eType = 1;
                // End:0x43F
                break;
            // End:0x1F7
            case "SMG":
                wParam.eType = 3;
                // End:0x43F
                break;
            // End:0x212
            case "SR":
                wParam.eType = 2;
                // End:0x43F
                break;
            // End:0x22D
            case "GR":
                wParam.eType = 5;
                // End:0x43F
                break;
            // End:0x24D
            case "Shotgun":
                wParam.eType = 6;
                // End:0x43F
                break;
            // End:0x269
            case "RPG":
                wParam.eType = 7;
                // End:0x43F
                break;
            // End:0x28E
            case "FlameThrower":
                wParam.eType = 8;
                // End:0x43F
                break;
            // End:0x2A9
            case "MG":
                wParam.eType = 9;
                // End:0x43F
                break;
            // End:0x2C6
            case "Demo":
                wParam.eType = 10;
                // End:0x43F
                break;
            // End:0x2E8
            case "AirStrike":
                wParam.eType = 11;
                // End:0x43F
                break;
            // End:0x309
            case "Pinpoint":
                wParam.eType = 20;
                // End:0x43F
                break;
            // End:0x327
            case "Melee":
                wParam.eType = 12;
                // End:0x43F
                break;
            // End:0x345
            case "Knife":
                wParam.eType = 17;
                // End:0x43F
                break;
            // End:0x368
            case "Helicopter":
                wParam.eType = 13;
                // End:0x43F
                break;
            // End:0x394
            case "Telegraph_Airstrike":
                wParam.eType = 14;
                // End:0x43F
                break;
            // End:0x3BA
            case "Telegraph_UAV":
                wParam.eType = 16;
                // End:0x43F
                break;
            // End:0x3E0
            case "Telegraph_HEL":
                wParam.eType = 15;
                // End:0x43F
                break;
            // End:0x402
            case "Sentrygun":
                wParam.eType = 18;
                // End:0x43F
                break;
            // End:0x428
            case "SentrygunPack":
                wParam.eType = 19;
                // End:0x43F
                break;
            // End:0xFFFF
            default:
                wParam.eType = 0;
                // End:0x43F
                break;
                break;
        }
        switch(excelWeapon.getData("Weapon", "damage_type", iIndex))
        {
            // End:0x490
            case "Bullet_Normal":
                wParam.damtype = 1;
                // End:0x573
                break;
            // End:0x4B5
            case "Bullet_Heavy":
                wParam.damtype = 2;
                // End:0x573
                break;
            // End:0x4DA
            case "Explo_Normal":
                wParam.damtype = 3;
                // End:0x573
                break;
            // End:0x4FE
            case "Explo_Heavy":
                wParam.damtype = 4;
                // End:0x573
                break;
            // End:0x523
            case "Explo_Damage":
                wParam.damtype = 5;
                // End:0x573
                break;
            // End:0x54B
            case "Explo_Condition":
                wParam.damtype = 6;
                // End:0x573
                break;
            // End:0x570
            case "Explo_Tactic":
                wParam.damtype = 7;
                // End:0x573
                break;
            // End:0xFFFF
            default:
                break;
        }
        switch(excelWeapon.getData("Weapon", "fire_mode", iIndex))
        {
            // End:0x5BA
            case "Single":
                wParam.iFireMode = 0;
                // End:0x5D9
                break;
            // End:0x5D6
            case "Auto":
                wParam.iFireMode = 1;
                // End:0x5D9
                break;
            // End:0xFFFF
            default:
                break;
        }
        wParam.iPriority = int(excelWeapon.getData("Weapon", "weapon_priority", iIndex));
        wParam.bAimAvailable = bool(excelWeapon.getData("Weapon", "aim_fire", iIndex));
        wParam.fRateOfFire = float(excelWeapon.getData("Weapon", "rate_of_fire", iIndex));
        wParam.iRoundBurstCount = int(excelWeapon.getData("Weapon", "round_burst_count", iIndex));
        wParam.fRoundBurstTime = float(excelWeapon.getData("Weapon", "round_burst_time", iIndex));
        wParam.fFireDelay = float(excelWeapon.getData("Weapon", "fire_delay", iIndex));
        wParam.fZoomFOV = float(excelWeapon.getData("Weapon", "zoom_1", iIndex));
        wParam.bOverHeat = bool(excelWeapon.getData("Weapon", "overheat", iIndex));
        wParam.fOverHeat_Up = float(excelWeapon.getData("Weapon", "overheat_up", iIndex));
        wParam.fOverHeat_Down = float(excelWeapon.getData("Weapon", "overheat_down", iIndex));
        switch(excelWeapon.getData("Weapon", "bullet_type", iIndex))
        {
            // End:0x870
            case "Instant":
                wParam.BulletType = 1;
                // End:0x8CB
                break;
            // End:0x893
            case "Projectile":
                wParam.BulletType = 2;
                // End:0x8CB
                break;
            // End:0x8B1
            case "Spawn":
                wParam.BulletType = 3;
                // End:0x8CB
                break;
            // End:0xFFFF
            default:
                Log("Invalid bullet type");
                break;
        }
        switch(excelWeapon.getData("Weapon", "projectile_move_type", iIndex))
        {
            // End:0x91A
            case "TW":
                wParam.ProjMoveType = 1;
                // End:0x95E
                break;
            // End:0x936
            case "RPG":
                wParam.ProjMoveType = 2;
                // End:0x95E
                break;
            // End:0x95B
            case "FlameThrower":
                wParam.ProjMoveType = 3;
                // End:0x95E
                break;
            // End:0xFFFF
            default:
                break;
        }
        switch(excelWeapon.getData("Weapon", "crosshair_type", iIndex))
        {
            // End:0x9AA
            case "basic":
                wParam.CrosshairType = 0;
                // End:0x9CB
                break;
            // End:0x9C8
            case "image":
                wParam.CrosshairType = 1;
                // End:0x9CB
                break;
            // End:0xFFFF
            default:
                break;
        }
        wParam.CrosshairImage = excelWeapon.getData("Weapon", "crosshair_image", iIndex);
        wParam.iBulletCount = int(excelWeapon.getData("Weapon", "bullet_count", iIndex));
        wParam.fProjSpeed = float(excelWeapon.getData("Weapon", "projectile_speed", iIndex));
        wParam.bExplodeCollide = bool(excelWeapon.getData("Weapon", "bullet_impact_explode", iIndex));
        wParam.bProjTakeDamage = bool(excelWeapon.getData("Weapon", "projectile_take_damage", iIndex));
        wParam.iBombWeaponID = int(excelWeapon.getData("Weapon", "bombing_weapon_id", iIndex));
        wParam.fFuseTime = float(excelWeapon.getData("Weapon", "fuse_time", iIndex));
        wParam.bFuseImpactTime = bool(excelWeapon.getData("Weapon", "fuse_impact_time", iIndex));
        wParam.fActiveTime = float(excelWeapon.getData("Weapon", "active_time", iIndex));
        wParam.i2ndBulletCount = int(excelWeapon.getData("Weapon", "2nd_bullet_count", iIndex));
        wParam.bBulletLandExplode = bool(excelWeapon.getData("Weapon", "bullet_land_explode", iIndex));
        wParam.fBulletGravity = float(excelWeapon.getData("Weapon", "bullet_gravity", iIndex));
        // End:0xCE9
        if(wParam.fBulletGravity == 0.0000000)
        {
            wParam.fBulletGravity = 1.0000000;
        }
        wParam.fProjDecelEachBound = float(excelWeapon.getData("Weapon", "bullet_bound_decel", iIndex));
        wParam.fProjSpin = float(excelWeapon.getData("Weapon", "bullet_throw_rotate", iIndex));
        wParam.fProjThrowPitch = float(excelWeapon.getData("Weapon", "bullet_throw_angle", iIndex));
        wParam.iDamage = int(excelWeapon.getData("Weapon", "damage", iIndex));
        wParam.fDamWallShot = float(excelWeapon.getData("Weapon", "damage_wallshot", iIndex));
        wParam.fMomentum = float(excelWeapon.getData("Weapon", "momentum", iIndex));
        wParam.fMomentum_Pawn = float(excelWeapon.getData("Weapon", "momentum_char", iIndex));
        wParam.fDamRange_Eff = float(excelWeapon.getData("Weapon", "damage_effective_range", iIndex));
        wParam.fDamRange_Max = float(excelWeapon.getData("Weapon", "damage_outer_range", iIndex));
        wParam.iDam_OOR = int(excelWeapon.getData("Weapon", "damage_outer", iIndex));
        wParam.fDamPerc_Head = float(excelWeapon.getData("Weapon", "parts_damage_head", iIndex));
        wParam.fDamPerc_UpperTorso = float(excelWeapon.getData("Weapon", "parts_damage_uppertorso", iIndex));
        wParam.fDamPerc_LowerTorso = float(excelWeapon.getData("Weapon", "parts_damage_lowertorso", iIndex));
        wParam.fDamPerc_UpperArm = float(excelWeapon.getData("Weapon", "parts_damage_upperarm", iIndex));
        wParam.fDamPerc_LowerArm = float(excelWeapon.getData("Weapon", "parts_damage_lowerarm", iIndex));
        wParam.fDamPerc_UpperLeg = float(excelWeapon.getData("Weapon", "parts_damage_upperleg", iIndex));
        wParam.fDamPerc_LowerLeg = float(excelWeapon.getData("Weapon", "parts_damage_lowerleg", iIndex));
        wParam.fDamPerc_Heli = float(excelWeapon.getData("Weapon", "parts_damage_heli", iIndex));
        wParam.fDamPerc_SentryGun = float(excelWeapon.getData("Weapon", "parts_damage_sentry", iIndex));
        wParam.bHitEffFriendly = bool(excelWeapon.getData("Weapon", "hit_effect_friendly", iIndex));
        wParam.fHitGunKick = float(excelWeapon.getData("Weapon", "hit_gun_kick", iIndex));
        wParam.fHitStunTime = float(excelWeapon.getData("Weapon", "hit_stun_time", iIndex));
        wParam.fHitFlashTime = float(excelWeapon.getData("Weapon", "hit_view_flash_time", iIndex));
        wParam.fHitFreezeTime = float(excelWeapon.getData("Weapon", "hit_freeze_time", iIndex));
        wParam.fHitEAXEffectTime = float(excelWeapon.getData("Weapon", "hit_eaxsound_time", iIndex));
        wParam.strHitEAXEffectClass = excelWeapon.getData("Weapon", "hit_eaxsound_class", iIndex);
        wParam.fHitFireTime = float(excelWeapon.getData("Weapon", "hit_fire_time", iIndex));
        switch(excelWeapon.getData("Weapon", "reload_type", iIndex))
        {
            // End:0x13F3
            case "Magazine":
                wParam.ReloadType = 1;
                // End:0x1415
                break;
            // End:0x1412
            case "Bullet":
                wParam.ReloadType = 2;
                // End:0x1415
                break;
            // End:0xFFFF
            default:
                break;
        }
        wParam.bRechamber = bool(excelWeapon.getData("Weapon", "rechamber", iIndex));
        wParam.fRechamberRate = float(excelWeapon.getData("Weapon", "ani_time_rechamber", iIndex));
        wParam.fReloadRate = float(excelWeapon.getData("Weapon", "ani_time_reload", iIndex));
        wParam.fReloadEmptyRate = float(excelWeapon.getData("Weapon", "ani_time_reload_empty", iIndex));
        wParam.fReloadBeginRate = float(excelWeapon.getData("Weapon", "ani_time_reload_start", iIndex));
        wParam.fReloadEndRate = float(excelWeapon.getData("Weapon", "ani_time_reload_end", iIndex));
        wParam.fExplRad_Inner = float(excelWeapon.getData("Weapon", "explosion_inner_radius", iIndex));
        wParam.fExplRad_Outer = float(excelWeapon.getData("Weapon", "explosion_outer_radius", iIndex));
        wParam.fExplDam_Inner = float(excelWeapon.getData("Weapon", "explosion_inner_damage", iIndex));
        wParam.fExplDam_Outer = float(excelWeapon.getData("Weapon", "explosion_outer_damage", iIndex));
        wParam.fExplForce_Effect = float(excelWeapon.getData("Weapon", "ground_rumble_force", iIndex));
        wParam.fExplRad_Effect = float(excelWeapon.getData("Weapon", "ground_rumble_radius", iIndex));
        wParam.iAmmo_Initial = int(excelWeapon.getData("Weapon", "start_ammo", iIndex));
        wParam.iAmmo_Magazine = int(excelWeapon.getData("Weapon", "clip_size", iIndex));
        wParam.iAmmo_Reload = int(excelWeapon.getData("Weapon", "reload_ammo", iIndex));
        wParam.iAmmo_Max = int(excelWeapon.getData("Weapon", "max_ammo", iIndex));
        wParam.iSpread_2nd_StartNum = int(excelWeapon.getData("Weapon", "spread_count_2nd", iIndex));
        wParam.fSpread_2nd_Add = float(excelWeapon.getData("Weapon", "spread_fire_add_2nd", iIndex));
        wParam.fSpread_2nd_Max = float(excelWeapon.getData("Weapon", "spread_stand_max_2nd", iIndex));
        wParam.iSpread_Visual_Add = int(excelWeapon.getData("Weapon", "spread_visual_add", iIndex));
        wParam.fSpread_Shotgun = float(excelWeapon.getData("Weapon", "spread_shotgun", iIndex));
        wParam.fSpread_Jump = float(excelWeapon.getData("Weapon", "spread_jump", iIndex));
        wParam.fSpread_Stand_Min = float(excelWeapon.getData("Weapon", "spread_stand_min", iIndex));
        wParam.fSpread_Stand_Max = float(excelWeapon.getData("Weapon", "spread_stand_max", iIndex));
        wParam.fSpread_Ducked_Min = float(excelWeapon.getData("Weapon", "spread_ducked_min", iIndex));
        wParam.fSpread_Ducked_Max = float(excelWeapon.getData("Weapon", "spread_ducked_max", iIndex));
        wParam.fSpread_Prone_Min = float(excelWeapon.getData("Weapon", "spread_prone_min", iIndex));
        wParam.fSpread_Prone_Max = float(excelWeapon.getData("Weapon", "spread_prone_max", iIndex));
        wParam.fSpread_Move_Add = float(excelWeapon.getData("Weapon", "spread_move_add", iIndex));
        wParam.fSpread_Fire_Add = float(excelWeapon.getData("Weapon", "spread_fire_add", iIndex));
        wParam.fSpread_Image_Increase = float(excelWeapon.getData("Weapon", "spread_out_speed", iIndex));
        wParam.fSpread_Stand_Reduce = float(excelWeapon.getData("Weapon", "spread_stand_in_rt", iIndex));
        wParam.fSpread_Ducked_Reduce = float(excelWeapon.getData("Weapon", "spread_ducked_in_rt", iIndex));
        wParam.fSpread_Prone_Reduce = float(excelWeapon.getData("Weapon", "spread_prone_in_rt", iIndex));
        wParam.fSpread_Aim_move_add = float(excelWeapon.getData("Weapon", "spread_aim_move_add", iIndex));
        wParam.fViewKickHip_XMin = float(excelWeapon.getData("Weapon", "view_kick_hip_x_min", iIndex));
        wParam.fViewKickHip_XMax = float(excelWeapon.getData("Weapon", "view_kick_hip_x_max", iIndex));
        wParam.fViewKickHip_YMin = float(excelWeapon.getData("Weapon", "view_kick_hip_y_min", iIndex));
        wParam.fViewKickHip_YMax = float(excelWeapon.getData("Weapon", "view_kick_hip_y_max", iIndex));
        wParam.fViewKickHip_Accel = float(excelWeapon.getData("Weapon", "view_kick_hip_accel", iIndex));
        wParam.fViewKickHip_Decel = float(excelWeapon.getData("Weapon", "view_kick_hip_decel", iIndex));
        wParam.fViewKickHip_StayTime = float(excelWeapon.getData("Weapon", "view_kick_hip_stay_time", iIndex));
        wParam.fViewKickHip_DecaySpeed = float(excelWeapon.getData("Weapon", "view_kick_hip_decay_speed", iIndex));
        wParam.fViewKickHip_DecayTimeFast = float(excelWeapon.getData("Weapon", "view_kick_hip_decay_time_fast", iIndex));
        wParam.fViewKickAds_XMin = float(excelWeapon.getData("Weapon", "view_kick_ads_x_min", iIndex));
        wParam.fViewKickAds_XMax = float(excelWeapon.getData("Weapon", "view_kick_ads_x_max", iIndex));
        wParam.fViewKickAds_YMin = float(excelWeapon.getData("Weapon", "view_kick_ads_y_min", iIndex));
        wParam.fViewKickAds_YMax = float(excelWeapon.getData("Weapon", "view_kick_ads_y_max", iIndex));
        wParam.fViewKickAds_Accel = float(excelWeapon.getData("Weapon", "view_kick_ads_accel", iIndex));
        wParam.fViewKickAds_Decel = float(excelWeapon.getData("Weapon", "view_kick_ads_decel", iIndex));
        wParam.fViewKickAds_StayTime = float(excelWeapon.getData("Weapon", "view_kick_ads_stay_time", iIndex));
        wParam.fViewKickAds_DecaySpeed = float(excelWeapon.getData("Weapon", "view_kick_ads_decay_speed", iIndex));
        wParam.fViewKickAds_DecayTimeFast = float(excelWeapon.getData("Weapon", "view_kick_ads_decay_time_fast", iIndex));
        wParam.fBreathRadius_Idle = float(excelWeapon.getData("Weapon", "breath_stand_gun", iIndex));
        wParam.fBreathSpeed_Idle = float(excelWeapon.getData("Weapon", "breath_stand_gun_speed", iIndex));
        wParam.fBreathRadius_Aim = float(excelWeapon.getData("Weapon", "breath_ads_gunnaim", iIndex));
        wParam.fBreathSpeed_Aim = float(excelWeapon.getData("Weapon", "breath_ads_gunnaim_speed", iIndex));
        wParam.fBreathRadius_DuckedAim = float(excelWeapon.getData("Weapon", "breath_ads_ducked_gunnaim", iIndex));
        wParam.fBreathSpeed_DuckedAim = float(excelWeapon.getData("Weapon", "breath_ads_ducked_gunnaim_speed", iIndex));
        wParam.fBreathRadius_ProneAim = float(excelWeapon.getData("Weapon", "breath_ads_prone_gunnaim", iIndex));
        wParam.fBreathSpeed_ProneAim = float(excelWeapon.getData("Weapon", "breath_ads_prone_gunnaim_speed", iIndex));
        wParam.fBobWeapon_Move = float(excelWeapon.getData("Weapon", "bob_hip_move_gun", iIndex));
        wParam.fBobScreen_Move = float(excelWeapon.getData("Weapon", "bob_hip_move_view", iIndex));
        wParam.fBobWeapon_Ads_Move = float(excelWeapon.getData("Weapon", "bob_ads_move_gunnaim", iIndex));
        wParam.fBobScreen_Ads_Move = float(excelWeapon.getData("Weapon", "bob_ads_move_view", iIndex));
        wParam.fBobWeapon_Ducked_Move = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_gun", iIndex));
        wParam.fBobScreen_Ducked_Move = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_view", iIndex));
        wParam.fBobScreen_Prone_Move = float(excelWeapon.getData("Weapon", "bob_hip_prone_move_view", iIndex));
        wParam.fBobWeapon_Sprint_Move = float(excelWeapon.getData("Weapon", "bob_sprint_gun", iIndex));
        wParam.fBobScreen_Sprint_Move = float(excelWeapon.getData("Weapon", "bob_sprint_view", iIndex));
        wParam.fBobWeapon_sprint_y = float(excelWeapon.getData("Weapon", "bob_sprint_gun_y", iIndex));
        wParam.fBobScreen_sprint_y = float(excelWeapon.getData("Weapon", "bob_sprint_view_y", iIndex));
        wParam.fBobWeapon_ads_move_y = float(excelWeapon.getData("Weapon", "bob_ads_move_gunnaim_y", iIndex));
        wParam.fBobScreen_ads_move_y = float(excelWeapon.getData("Weapon", "bob_ads_move_view_y", iIndex));
        wParam.fBobWeapon_move_y = float(excelWeapon.getData("Weapon", "bob_hip_move_gun_y", iIndex));
        wParam.fBobScreen_move_y = float(excelWeapon.getData("Weapon", "bob_hip_move_view_y", iIndex));
        wParam.fBobWeapon_ducked_move_y = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_gun_y", iIndex));
        wParam.fBobScreen_ducked_move_y = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_view_y", iIndex));
        wParam.fBobScreen_prone_move_y = float(excelWeapon.getData("Weapon", "bob_hip_prone_move_view_y", iIndex));
        wParam.fHitMoveSpeed = float(excelWeapon.getData("Weapon", "hit_gun_move_speed", iIndex));
        wParam.fHitMoveTime = float(excelWeapon.getData("Weapon", "hit_gun_move_time", iIndex));
        wParam.fHitMoveDelay = float(excelWeapon.getData("Weapon", "hit_gun_move_delay", iIndex));
        wParam.fSprintStaminaRate = float(excelWeapon.getData("Weapon", "wp_sprint_sta_rate", iIndex));
        wParam.fSprintSpeed = float(excelWeapon.getData("Weapon", "wp_sprint_move", iIndex));
        wParam.fRunSpeed = float(excelWeapon.getData("Weapon", "wp_stand_move", iIndex));
        wParam.fCrouchSpeed = float(excelWeapon.getData("Weapon", "wp_crouch_move", iIndex));
        wParam.fPronedSpeed = float(excelWeapon.getData("Weapon", "wp_prone_move", iIndex));
        wParam.fAimRunSpeed = float(excelWeapon.getData("Weapon", "wp_aim_move", iIndex));
        wParam.fAimCrouchSpeed = float(excelWeapon.getData("Weapon", "wp_crouch_aim_move", iIndex));
        wParam.fAnimRate_PutDown = float(excelWeapon.getData("Weapon", "ani_rate_drop", iIndex));
        wParam.fAnimRate_PutDown_Quick = float(excelWeapon.getData("Weapon", "ani_rate_drop_quick", iIndex));
        wParam.fAnimRate_BringUp = float(excelWeapon.getData("Weapon", "ani_rate_raise", iIndex));
        wParam.fAnimRate_SprintBringUp = float(excelWeapon.getData("Weapon", "ani_rate_sprint_raise", iIndex));
        wParam.fAnimRate_AdsOn = float(excelWeapon.getData("Weapon", "ani_rate_ads_on", iIndex));
        wParam.fAnimRate_AdsOff = float(excelWeapon.getData("Weapon", "ani_rate_ads_off", iIndex));
        wParam.bApplyQuickDrop = bool(excelWeapon.getData("Weapon", "drop_quick", iIndex));
        wParam.fSway_HipX_Max = float(excelWeapon.getData("Weapon", "sway_gun_hip_x_max_angle", iIndex));
        wParam.fSway_HipX_Incr = float(excelWeapon.getData("Weapon", "sway_gun_hip_x_move_angle", iIndex));
        wParam.fSway_HipX_Speed = float(excelWeapon.getData("Weapon", "sway_gun_hip_x_move", iIndex));
        wParam.fSway_HipY_Max = float(excelWeapon.getData("Weapon", "sway_gun_hip_y_max_angle", iIndex));
        wParam.fSway_HipY_Incr = float(excelWeapon.getData("Weapon", "sway_gun_hip_y_move_angle", iIndex));
        wParam.fSway_HipY_Speed = float(excelWeapon.getData("Weapon", "sway_gun_hip_y_move", iIndex));
        wParam.fSway_AdsX_Max = float(excelWeapon.getData("Weapon", "sway_gun_ads_x_max_angle", iIndex));
        wParam.fSway_AdsX_Incr = float(excelWeapon.getData("Weapon", "sway_gun_ads_x_move_angle", iIndex));
        wParam.fSway_AdsX_Speed = float(excelWeapon.getData("Weapon", "sway_gun_ads_x_move", iIndex));
        wParam.fSway_AdsY_Max = float(excelWeapon.getData("Weapon", "sway_gun_ads_y_max_angle", iIndex));
        wParam.fSway_AdsY_Incr = float(excelWeapon.getData("Weapon", "sway_gun_ads_y_move_angle", iIndex));
        wParam.fSway_AdsY_Speed = float(excelWeapon.getData("Weapon", "sway_gun_ads_y_move", iIndex));
        wParam.fMaxPitch = float(excelWeapon.getData("Weapon", "view_angle_pitch_max", iIndex));
        wParam.iCrossHair = int(excelWeapon.getData("Weapon", "crosshair_id", iIndex));
        wParam.fMovePivot = float(excelWeapon.getData("Weapon", "gun_pos_hip_move_front_y", iIndex));
        wParam.ui_damage = int(excelWeapon.getData("Weapon", "ui_damage", iIndex));
        wParam.ui_spread = int(excelWeapon.getData("Weapon", "ui_spread", iIndex));
        wParam.ui_view_kick = int(excelWeapon.getData("Weapon", "ui_view_kick", iIndex));
        wParam.ui_rate_of_fire = int(excelWeapon.getData("Weapon", "ui_rate_of_fire", iIndex));
        wParam.ui_move = int(excelWeapon.getData("Weapon", "ui_move", iIndex));
        wParam.ui_range = int(excelWeapon.getData("Weapon", "ui_range", iIndex));
        wParam.fNPCSpreadRate = float(excelWeapon.getData("Weapon", "npc_spread_rate", iIndex));
        wParam.fNPCRateOfFire = float(excelWeapon.getData("Weapon", "npc_rate_of_fire", iIndex));
        wParam.iNPCFire = int(excelWeapon.getData("Weapon", "npc_fire", iIndex));
        wParam.fMeleeDelay = float(excelWeapon.getData("WeaponEx", "melee_delay", iIndex));
        wParam.iDamMelee = int(excelWeapon.getData("WeaponEx", "melee_damage", iIndex));
        wParam.iMeleeRange = int(excelWeapon.getData("WeaponEx", "melee_range", iIndex));
        wParam.iMeleeExtent = int(excelWeapon.getData("WeaponEx", "melee_extent", iIndex));
        wParam.iMeleeExtent_Head = int(excelWeapon.getData("WeaponEx", "melee_extent_head", iIndex));
        wParam.iMeleeDam_Back = int(excelWeapon.getData("WeaponEx", "melee_damage_back", iIndex));
        wParam.fMeleeDam_Head = float(excelWeapon.getData("WeaponEx", "melee_damage_head", iIndex));
        wParam.fMeleeDam_UpperTorso = float(excelWeapon.getData("WeaponEx", "melee_damage_uppertorso", iIndex));
        wParam.fMeleeDam_LowerTorso = float(excelWeapon.getData("WeaponEx", "melee_damage_lowertorso", iIndex));
        wParam.fMeleeDam_UpperArm = float(excelWeapon.getData("WeaponEx", "melee_damage_upperarm", iIndex));
        wParam.fMeleeDam_LowerArm = float(excelWeapon.getData("WeaponEx", "melee_damage_lowerarm", iIndex));
        wParam.fMeleeDam_UpperLeg = float(excelWeapon.getData("WeaponEx", "melee_damage_upperleg", iIndex));
        wParam.fMeleeDam_LowerLeg = float(excelWeapon.getData("WeaponEx", "melee_damage_lowerleg", iIndex));
        wParam.fFiringSway_HipX_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_x_max_angle_fire", iIndex));
        wParam.fFiringSway_HipX_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_x_move_angle_fire", iIndex));
        wParam.fFiringSway_HipX_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_x_move_fire", iIndex));
        wParam.fFiringSway_HipY_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_y_max_angle_fire", iIndex));
        wParam.fFiringSway_HipY_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_y_move_angle_fire", iIndex));
        wParam.fFiringSway_HipY_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_y_move_fire", iIndex));
        wParam.fFiringSway_AdsX_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_x_max_angle_fire", iIndex));
        wParam.fFiringSway_AdsX_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_x_move_angle_fire", iIndex));
        wParam.fFiringSway_AdsX_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_x_move_fire", iIndex));
        wParam.fFiringSway_AdsY_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_y_max_angle_fire", iIndex));
        wParam.fFiringSway_AdsY_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_y_move_angle_fire", iIndex));
        wParam.fFiringSway_AdsY_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_y_move_fire", iIndex));
        // End:0x39BB
        if(bCheat)
        {
            // [Explicit Break]
            goto J0x39EE;
        }
        iLength = WeaponParams.Length;
        WeaponParams.Insert(iLength, 1);
        WeaponParams[iLength] = wParam;
        iIndex++;
        J0x39EB:

        // [Loop Continue]
        goto J0x07;
    }
    J0x39EE:

    //return;    
}

protected function AddWeaponExParams(BTNetExcelData excelWeapon, optional bool bCheat, optional wWeapon Weapon)
{
    local wWeaponBaseParams wParam;
    local int iIndex, iWeaponID;
    local string strDisplayName;

    iIndex = 0;
    J0x07:

    // End:0x4AD2 [Loop If]
    if(true)
    {
        strDisplayName = excelWeapon.getData("Weapon", "display_name", iIndex);
        // End:0x4F
        if(strDisplayName == "99999")
        {
            // [Explicit Break]
            goto J0x4AD2;
        }
        // End:0xC7
        if(bCheat)
        {
            iWeaponID = int(excelWeapon.getData("Weapon", "item_id", iIndex));
            // End:0xB0
            if(iWeaponID != Weapon.BaseParams.iWeaponID)
            {
                ++iIndex;
                // [Explicit Continue]
                goto J0x4ACF;
            }
            wParam = Weapon.BaseParams;            
        }
        else
        {
            // End:0x122
            if(WeaponParams.Length < iIndex)
            {
                self.__NFUN_270__(((("Failed to load WeaponExParams (" $ string(WeaponParams.Length)) $ ", ") $ string(iIndex)) $ " )");
                // [Explicit Break]
                goto J0x4AD2;
            }
            wParam = WeaponParams[iIndex];
        }
        // End:0x15C
        if("" == wParam.strName)
        {
            wParam.strName = strDisplayName;
        }
        // End:0x1B0
        if("" == wParam.szClass_Resource)
        {
            wParam.szClass_Resource = excelWeapon.getData("Weapon", "weapon_resource_id", iIndex);
        }
        // End:0x1FD
        if(0 == wParam.iInventoryGroup)
        {
            wParam.iInventoryGroup = int(excelWeapon.getData("Weapon", "weapon_num", iIndex));
        }
        // End:0x4DC
        if(0 == int(wParam.eType))
        {
            switch(excelWeapon.getData("Weapon", "weapon_type", iIndex))
            {
                // End:0x25D
                case "Pistol":
                    wParam.eType = 4;
                    // End:0x4DC
                    break;
                // End:0x278
                case "AR":
                    wParam.eType = 1;
                    // End:0x4DC
                    break;
                // End:0x294
                case "SMG":
                    wParam.eType = 3;
                    // End:0x4DC
                    break;
                // End:0x2AF
                case "SR":
                    wParam.eType = 2;
                    // End:0x4DC
                    break;
                // End:0x2CA
                case "GR":
                    wParam.eType = 5;
                    // End:0x4DC
                    break;
                // End:0x2EA
                case "Shotgun":
                    wParam.eType = 6;
                    // End:0x4DC
                    break;
                // End:0x306
                case "RPG":
                    wParam.eType = 7;
                    // End:0x4DC
                    break;
                // End:0x32B
                case "FlameThrower":
                    wParam.eType = 8;
                    // End:0x4DC
                    break;
                // End:0x346
                case "MG":
                    wParam.eType = 9;
                    // End:0x4DC
                    break;
                // End:0x363
                case "Demo":
                    wParam.eType = 10;
                    // End:0x4DC
                    break;
                // End:0x385
                case "AirStrike":
                    wParam.eType = 11;
                    // End:0x4DC
                    break;
                // End:0x3A6
                case "Pinpoint":
                    wParam.eType = 20;
                    // End:0x4DC
                    break;
                // End:0x3C4
                case "Melee":
                    wParam.eType = 12;
                    // End:0x4DC
                    break;
                // End:0x3E2
                case "Knife":
                    wParam.eType = 17;
                    // End:0x4DC
                    break;
                // End:0x405
                case "Helicopter":
                    wParam.eType = 13;
                    // End:0x4DC
                    break;
                // End:0x431
                case "Telegraph_Airstrike":
                    wParam.eType = 14;
                    // End:0x4DC
                    break;
                // End:0x457
                case "Telegraph_UAV":
                    wParam.eType = 16;
                    // End:0x4DC
                    break;
                // End:0x47D
                case "Telegraph_HEL":
                    wParam.eType = 15;
                    // End:0x4DC
                    break;
                // End:0x49F
                case "Sentrygun":
                    wParam.eType = 18;
                    // End:0x4DC
                    break;
                // End:0x4C5
                case "SentrygunPack":
                    wParam.eType = 19;
                    // End:0x4DC
                    break;
                // End:0xFFFF
                default:
                    wParam.eType = 0;
                    // End:0x4DC
                    break;
                    break;
            }
        }
        // End:0x626
        if(0 == int(wParam.damtype))
        {
            switch(excelWeapon.getData("Weapon", "damage_type", iIndex))
            {
                // End:0x543
                case "Bullet_Normal":
                    wParam.damtype = 1;
                    // End:0x626
                    break;
                // End:0x568
                case "Bullet_Heavy":
                    wParam.damtype = 2;
                    // End:0x626
                    break;
                // End:0x58D
                case "Explo_Normal":
                    wParam.damtype = 3;
                    // End:0x626
                    break;
                // End:0x5B1
                case "Explo_Heavy":
                    wParam.damtype = 4;
                    // End:0x626
                    break;
                // End:0x5D6
                case "Explo_Damage":
                    wParam.damtype = 5;
                    // End:0x626
                    break;
                // End:0x5FE
                case "Explo_Condition":
                    wParam.damtype = 6;
                    // End:0x626
                    break;
                // End:0x623
                case "Explo_Tactic":
                    wParam.damtype = 7;
                    // End:0x626
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            // End:0x6A0
            if(1 == wParam.iFireMode)
            {
                switch(excelWeapon.getData("Weapon", "fire_mode", iIndex))
                {
                    // End:0x681
                    case "Single":
                        wParam.iFireMode = 0;
                        // End:0x6A0
                        break;
                    // End:0x69D
                    case "Auto":
                        wParam.iFireMode = 1;
                        // End:0x6A0
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
                // End:0x6F2
                if(0 == wParam.iPriority)
                {
                    wParam.iPriority = int(excelWeapon.getData("Weapon", "weapon_priority", iIndex));
                }
                // End:0x73F
                if(false == wParam.bAimAvailable)
                {
                    wParam.bAimAvailable = bool(excelWeapon.getData("Weapon", "aim_fire", iIndex));
                }
                // End:0x790
                if(float(0) == wParam.fRateOfFire)
                {
                    wParam.fRateOfFire = float(excelWeapon.getData("Weapon", "rate_of_fire", iIndex));
                }
                // End:0x7E4
                if(0 == wParam.iRoundBurstCount)
                {
                    wParam.iRoundBurstCount = int(excelWeapon.getData("Weapon", "round_burst_count", iIndex));
                }
                // End:0x839
                if(float(0) == wParam.fRoundBurstTime)
                {
                    wParam.fRoundBurstTime = float(excelWeapon.getData("Weapon", "round_burst_time", iIndex));
                }
                // End:0x888
                if(float(0) == wParam.fFireDelay)
                {
                    wParam.fFireDelay = float(excelWeapon.getData("Weapon", "fire_delay", iIndex));
                }
                // End:0x8D3
                if(float(0) == wParam.fZoomFOV)
                {
                    wParam.fZoomFOV = float(excelWeapon.getData("Weapon", "zoom_1", iIndex));
                }
                // End:0x920
                if(false == wParam.bOverHeat)
                {
                    wParam.bOverHeat = bool(excelWeapon.getData("Weapon", "overheat", iIndex));
                }
                // End:0x970
                if(float(0) == wParam.fOverHeat_Up)
                {
                    wParam.fOverHeat_Up = float(excelWeapon.getData("Weapon", "overheat_up", iIndex));
                }
                // End:0x9C2
                if(float(0) == wParam.fOverHeat_Down)
                {
                    wParam.fOverHeat_Down = float(excelWeapon.getData("Weapon", "overheat_down", iIndex));
                }
                // End:0xA7E
                if(0 == int(wParam.BulletType))
                {
                    switch(excelWeapon.getData("Weapon", "bullet_type", iIndex))
                    {
                        // End:0xA23
                        case "Instant":
                            wParam.BulletType = 1;
                            // End:0xA7E
                            break;
                        // End:0xA46
                        case "Projectile":
                            wParam.BulletType = 2;
                            // End:0xA7E
                            break;
                        // End:0xA64
                        case "Spawn":
                            wParam.BulletType = 3;
                            // End:0xA7E
                            break;
                        // End:0xFFFF
                        default:
                            Log("Invalid bullet type");
                            break;
                    }
                }
                // End:0xB27
                if(0 == int(wParam.ProjMoveType))
                {
                    switch(excelWeapon.getData("Weapon", "projectile_move_type", iIndex))
                    {
                        // End:0xAE3
                        case "TW":
                            wParam.ProjMoveType = 1;
                            // End:0xB27
                            break;
                        // End:0xAFF
                        case "RPG":
                            wParam.ProjMoveType = 2;
                            // End:0xB27
                            break;
                        // End:0xB24
                        case "FlameThrower":
                            wParam.ProjMoveType = 3;
                            // End:0xB27
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                }
                else
                {
                    // End:0xBAA
                    if(0 == int(wParam.CrosshairType))
                    {
                        switch(excelWeapon.getData("Weapon", "crosshair_type", iIndex))
                        {
                            // End:0xB89
                            case "basic":
                                wParam.CrosshairType = 0;
                                // End:0xBAA
                                break;
                            // End:0xBA7
                            case "image":
                                wParam.CrosshairType = 1;
                                // End:0xBAA
                                break;
                            // End:0xFFFF
                            default:
                                break;
                        }
                    }
                    else
                    {
                        // End:0xBFB
                        if("" == wParam.CrosshairImage)
                        {
                            wParam.CrosshairImage = excelWeapon.getData("Weapon", "crosshair_image", iIndex);
                        }
                        // End:0xC4A
                        if(0 == wParam.iBulletCount)
                        {
                            wParam.iBulletCount = int(excelWeapon.getData("Weapon", "bullet_count", iIndex));
                        }
                        // End:0xC9F
                        if(float(0) == wParam.fProjSpeed)
                        {
                            wParam.fProjSpeed = float(excelWeapon.getData("Weapon", "projectile_speed", iIndex));
                        }
                        // End:0xCF9
                        if(false == wParam.bExplodeCollide)
                        {
                            wParam.bExplodeCollide = bool(excelWeapon.getData("Weapon", "bullet_impact_explode", iIndex));
                        }
                        // End:0xD54
                        if(false == wParam.bProjTakeDamage)
                        {
                            wParam.bProjTakeDamage = bool(excelWeapon.getData("Weapon", "projectile_take_damage", iIndex));
                        }
                        // End:0xDA8
                        if(0 == wParam.iBombWeaponID)
                        {
                            wParam.iBombWeaponID = int(excelWeapon.getData("Weapon", "bombing_weapon_id", iIndex));
                        }
                        // End:0xDF6
                        if(float(0) == wParam.fFuseTime)
                        {
                            wParam.fFuseTime = float(excelWeapon.getData("Weapon", "fuse_time", iIndex));
                        }
                        // End:0xE4B
                        if(false == wParam.bFuseImpactTime)
                        {
                            wParam.bFuseImpactTime = bool(excelWeapon.getData("Weapon", "fuse_impact_time", iIndex));
                        }
                        // End:0xE9B
                        if(float(0) == wParam.fActiveTime)
                        {
                            wParam.fActiveTime = float(excelWeapon.getData("Weapon", "active_time", iIndex));
                        }
                        // End:0xEEE
                        if(0 == wParam.i2ndBulletCount)
                        {
                            wParam.i2ndBulletCount = int(excelWeapon.getData("Weapon", "2nd_bullet_count", iIndex));
                        }
                        // End:0xF46
                        if(false == wParam.bBulletLandExplode)
                        {
                            wParam.bBulletLandExplode = bool(excelWeapon.getData("Weapon", "bullet_land_explode", iIndex));
                        }
                        // End:0xF9D
                        if(float(0) == wParam.fProjDecelEachBound)
                        {
                            wParam.fProjDecelEachBound = float(excelWeapon.getData("Weapon", "bullet_bound_decel", iIndex));
                        }
                        // End:0xFF5
                        if(float(0) == wParam.fProjSpin)
                        {
                            wParam.fProjSpin = float(excelWeapon.getData("Weapon", "bullet_throw_rotate", iIndex));
                        }
                        // End:0x104C
                        if(float(0) == wParam.fProjThrowPitch)
                        {
                            wParam.fProjThrowPitch = float(excelWeapon.getData("Weapon", "bullet_throw_angle", iIndex));
                        }
                        // End:0x1095
                        if(0 == wParam.iDamage)
                        {
                            wParam.iDamage = int(excelWeapon.getData("Weapon", "damage", iIndex));
                        }
                        // End:0x10E9
                        if(float(0) == wParam.fDamWallShot)
                        {
                            wParam.fDamWallShot = float(excelWeapon.getData("Weapon", "damage_wallshot", iIndex));
                        }
                        // End:0x1136
                        if(float(0) == wParam.fMomentum)
                        {
                            wParam.fMomentum = float(excelWeapon.getData("Weapon", "momentum", iIndex));
                        }
                        // End:0x1188
                        if(float(0) == wParam.fMomentum_Pawn)
                        {
                            wParam.fMomentum_Pawn = float(excelWeapon.getData("Weapon", "momentum_char", iIndex));
                        }
                        // End:0x11E3
                        if(float(0) == wParam.fDamRange_Eff)
                        {
                            wParam.fDamRange_Eff = float(excelWeapon.getData("Weapon", "damage_effective_range", iIndex));
                        }
                        // End:0x123A
                        if(float(0) == wParam.fDamRange_Max)
                        {
                            wParam.fDamRange_Max = float(excelWeapon.getData("Weapon", "damage_outer_range", iIndex));
                        }
                        // End:0x1289
                        if(0 == wParam.iDam_OOR)
                        {
                            wParam.iDam_OOR = int(excelWeapon.getData("Weapon", "damage_outer", iIndex));
                        }
                        // End:0x12DF
                        if(float(0) == wParam.fDamPerc_Head)
                        {
                            wParam.fDamPerc_Head = float(excelWeapon.getData("Weapon", "parts_damage_head", iIndex));
                        }
                        // End:0x133B
                        if(float(0) == wParam.fDamPerc_UpperTorso)
                        {
                            wParam.fDamPerc_UpperTorso = float(excelWeapon.getData("Weapon", "parts_damage_uppertorso", iIndex));
                        }
                        // End:0x1397
                        if(float(0) == wParam.fDamPerc_LowerTorso)
                        {
                            wParam.fDamPerc_LowerTorso = float(excelWeapon.getData("Weapon", "parts_damage_lowertorso", iIndex));
                        }
                        // End:0x13F1
                        if(float(0) == wParam.fDamPerc_UpperArm)
                        {
                            wParam.fDamPerc_UpperArm = float(excelWeapon.getData("Weapon", "parts_damage_upperarm", iIndex));
                        }
                        // End:0x144B
                        if(float(0) == wParam.fDamPerc_LowerArm)
                        {
                            wParam.fDamPerc_LowerArm = float(excelWeapon.getData("Weapon", "parts_damage_lowerarm", iIndex));
                        }
                        // End:0x14A5
                        if(float(0) == wParam.fDamPerc_UpperLeg)
                        {
                            wParam.fDamPerc_UpperLeg = float(excelWeapon.getData("Weapon", "parts_damage_upperleg", iIndex));
                        }
                        // End:0x14FF
                        if(float(0) == wParam.fDamPerc_LowerLeg)
                        {
                            wParam.fDamPerc_LowerLeg = float(excelWeapon.getData("Weapon", "parts_damage_lowerleg", iIndex));
                        }
                        // End:0x1555
                        if(float(0) == wParam.fDamPerc_Heli)
                        {
                            wParam.fDamPerc_Heli = float(excelWeapon.getData("Weapon", "parts_damage_heli", iIndex));
                        }
                        // End:0x15AD
                        if(float(0) == wParam.fDamPerc_SentryGun)
                        {
                            wParam.fDamPerc_SentryGun = float(excelWeapon.getData("Weapon", "parts_damage_sentry", iIndex));
                        }
                        // End:0x1605
                        if(false == wParam.bHitEffFriendly)
                        {
                            wParam.bHitEffFriendly = bool(excelWeapon.getData("Weapon", "hit_effect_friendly", iIndex));
                        }
                        // End:0x1656
                        if(float(0) == wParam.fHitGunKick)
                        {
                            wParam.fHitGunKick = float(excelWeapon.getData("Weapon", "hit_gun_kick", iIndex));
                        }
                        // End:0x16A8
                        if(float(0) == wParam.fHitStunTime)
                        {
                            wParam.fHitStunTime = float(excelWeapon.getData("Weapon", "hit_stun_time", iIndex));
                        }
                        // End:0x1700
                        if(float(0) == wParam.fHitFlashTime)
                        {
                            wParam.fHitFlashTime = float(excelWeapon.getData("Weapon", "hit_view_flash_time", iIndex));
                        }
                        // End:0x1754
                        if(float(0) == wParam.fHitFreezeTime)
                        {
                            wParam.fHitFreezeTime = float(excelWeapon.getData("Weapon", "hit_freeze_time", iIndex));
                        }
                        // End:0x17AA
                        if(float(0) == wParam.fHitEAXEffectTime)
                        {
                            wParam.fHitEAXEffectTime = float(excelWeapon.getData("Weapon", "hit_eaxsound_time", iIndex));
                        }
                        // End:0x17FE
                        if("" == wParam.strHitEAXEffectClass)
                        {
                            wParam.strHitEAXEffectClass = excelWeapon.getData("Weapon", "hit_eaxsound_class", iIndex);
                        }
                        // End:0x1850
                        if(float(0) == wParam.fHitFireTime)
                        {
                            wParam.fHitFireTime = float(excelWeapon.getData("Weapon", "hit_fire_time", iIndex));
                        }
                        // End:0x18D4
                        if(0 == int(wParam.ReloadType))
                        {
                            switch(excelWeapon.getData("Weapon", "reload_type", iIndex))
                            {
                                // End:0x18B2
                                case "Magazine":
                                    wParam.ReloadType = 1;
                                    // End:0x18D4
                                    break;
                                // End:0x18D1
                                case "Bullet":
                                    wParam.ReloadType = 2;
                                    // End:0x18D4
                                    break;
                                // End:0xFFFF
                                default:
                                    break;
                            }
                        }
                        else
                        {
                            // End:0x1922
                            if(false == wParam.bRechamber)
                            {
                                wParam.bRechamber = bool(excelWeapon.getData("Weapon", "rechamber", iIndex));
                            }
                            // End:0x1979
                            if(float(0) == wParam.fRechamberRate)
                            {
                                wParam.fRechamberRate = float(excelWeapon.getData("Weapon", "ani_time_rechamber", iIndex));
                            }
                            // End:0x19CD
                            if(float(0) == wParam.fReloadRate)
                            {
                                wParam.fReloadRate = float(excelWeapon.getData("Weapon", "ani_time_reload", iIndex));
                            }
                            // End:0x1A27
                            if(float(0) == wParam.fReloadEmptyRate)
                            {
                                wParam.fReloadEmptyRate = float(excelWeapon.getData("Weapon", "ani_time_reload_empty", iIndex));
                            }
                            // End:0x1A81
                            if(float(0) == wParam.fReloadBeginRate)
                            {
                                wParam.fReloadBeginRate = float(excelWeapon.getData("Weapon", "ani_time_reload_start", iIndex));
                            }
                            // End:0x1AD9
                            if(float(0) == wParam.fReloadEndRate)
                            {
                                wParam.fReloadEndRate = float(excelWeapon.getData("Weapon", "ani_time_reload_end", iIndex));
                            }
                            // End:0x1B34
                            if(float(0) == wParam.fExplRad_Inner)
                            {
                                wParam.fExplRad_Inner = float(excelWeapon.getData("Weapon", "explosion_inner_radius", iIndex));
                            }
                            // End:0x1B8F
                            if(float(0) == wParam.fExplRad_Outer)
                            {
                                wParam.fExplRad_Outer = float(excelWeapon.getData("Weapon", "explosion_outer_radius", iIndex));
                            }
                            // End:0x1BEA
                            if(float(0) == wParam.fExplDam_Inner)
                            {
                                wParam.fExplDam_Inner = float(excelWeapon.getData("Weapon", "explosion_inner_damage", iIndex));
                            }
                            // End:0x1C45
                            if(float(0) == wParam.fExplDam_Outer)
                            {
                                wParam.fExplDam_Outer = float(excelWeapon.getData("Weapon", "explosion_outer_damage", iIndex));
                            }
                            // End:0x1C9D
                            if(float(0) == wParam.fExplForce_Effect)
                            {
                                wParam.fExplForce_Effect = float(excelWeapon.getData("Weapon", "ground_rumble_force", iIndex));
                            }
                            // End:0x1CF6
                            if(float(0) == wParam.fExplRad_Effect)
                            {
                                wParam.fExplRad_Effect = float(excelWeapon.getData("Weapon", "ground_rumble_radius", iIndex));
                            }
                            // End:0x1D43
                            if(0 == wParam.iAmmo_Initial)
                            {
                                wParam.iAmmo_Initial = int(excelWeapon.getData("Weapon", "start_ammo", iIndex));
                            }
                            // End:0x1D8F
                            if(0 == wParam.iAmmo_Magazine)
                            {
                                wParam.iAmmo_Magazine = int(excelWeapon.getData("Weapon", "clip_size", iIndex));
                            }
                            // End:0x1DDD
                            if(0 == wParam.iAmmo_Reload)
                            {
                                wParam.iAmmo_Reload = int(excelWeapon.getData("Weapon", "reload_ammo", iIndex));
                            }
                            // End:0x1E28
                            if(0 == wParam.iAmmo_Max)
                            {
                                wParam.iAmmo_Max = int(excelWeapon.getData("Weapon", "max_ammo", iIndex));
                            }
                            // End:0x1E7B
                            if(0 == wParam.iSpread_2nd_StartNum)
                            {
                                wParam.iSpread_2nd_StartNum = int(excelWeapon.getData("Weapon", "spread_count_2nd", iIndex));
                            }
                            // End:0x1ED3
                            if(float(0) == wParam.fSpread_2nd_Add)
                            {
                                wParam.fSpread_2nd_Add = float(excelWeapon.getData("Weapon", "spread_fire_add_2nd", iIndex));
                            }
                            // End:0x1F2C
                            if(float(0) == wParam.fSpread_2nd_Max)
                            {
                                wParam.fSpread_2nd_Max = float(excelWeapon.getData("Weapon", "spread_stand_max_2nd", iIndex));
                            }
                            // End:0x1F80
                            if(0 == wParam.iSpread_Visual_Add)
                            {
                                wParam.iSpread_Visual_Add = int(excelWeapon.getData("Weapon", "spread_visual_add", iIndex));
                            }
                            // End:0x1FD3
                            if(float(0) == wParam.fSpread_Shotgun)
                            {
                                wParam.fSpread_Shotgun = float(excelWeapon.getData("Weapon", "spread_shotgun", iIndex));
                            }
                            // End:0x2023
                            if(float(0) == wParam.fSpread_Jump)
                            {
                                wParam.fSpread_Jump = float(excelWeapon.getData("Weapon", "spread_jump", iIndex));
                            }
                            // End:0x2078
                            if(float(0) == wParam.fSpread_Stand_Min)
                            {
                                wParam.fSpread_Stand_Min = float(excelWeapon.getData("Weapon", "spread_stand_min", iIndex));
                            }
                            // End:0x20CD
                            if(float(0) == wParam.fSpread_Stand_Max)
                            {
                                wParam.fSpread_Stand_Max = float(excelWeapon.getData("Weapon", "spread_stand_max", iIndex));
                            }
                            // End:0x2123
                            if(float(0) == wParam.fSpread_Ducked_Min)
                            {
                                wParam.fSpread_Ducked_Min = float(excelWeapon.getData("Weapon", "spread_ducked_min", iIndex));
                            }
                            // End:0x2179
                            if(float(0) == wParam.fSpread_Ducked_Max)
                            {
                                wParam.fSpread_Ducked_Max = float(excelWeapon.getData("Weapon", "spread_ducked_max", iIndex));
                            }
                            // End:0x21CE
                            if(float(0) == wParam.fSpread_Prone_Min)
                            {
                                wParam.fSpread_Prone_Min = float(excelWeapon.getData("Weapon", "spread_prone_min", iIndex));
                            }
                            // End:0x2223
                            if(float(0) == wParam.fSpread_Prone_Max)
                            {
                                wParam.fSpread_Prone_Max = float(excelWeapon.getData("Weapon", "spread_prone_max", iIndex));
                            }
                            // End:0x2277
                            if(float(0) == wParam.fSpread_Move_Add)
                            {
                                wParam.fSpread_Move_Add = float(excelWeapon.getData("Weapon", "spread_move_add", iIndex));
                            }
                            // End:0x22CB
                            if(float(0) == wParam.fSpread_Fire_Add)
                            {
                                wParam.fSpread_Fire_Add = float(excelWeapon.getData("Weapon", "spread_fire_add", iIndex));
                            }
                            // End:0x2320
                            if(float(0) == wParam.fSpread_Image_Increase)
                            {
                                wParam.fSpread_Image_Increase = float(excelWeapon.getData("Weapon", "spread_out_speed", iIndex));
                            }
                            // End:0x2377
                            if(float(0) == wParam.fSpread_Stand_Reduce)
                            {
                                wParam.fSpread_Stand_Reduce = float(excelWeapon.getData("Weapon", "spread_stand_in_rt", iIndex));
                            }
                            // End:0x23CF
                            if(float(0) == wParam.fSpread_Ducked_Reduce)
                            {
                                wParam.fSpread_Ducked_Reduce = float(excelWeapon.getData("Weapon", "spread_ducked_in_rt", iIndex));
                            }
                            // End:0x2426
                            if(float(0) == wParam.fSpread_Prone_Reduce)
                            {
                                wParam.fSpread_Prone_Reduce = float(excelWeapon.getData("Weapon", "spread_prone_in_rt", iIndex));
                            }
                            // End:0x247E
                            if(float(0) == wParam.fSpread_Aim_move_add)
                            {
                                wParam.fSpread_Aim_move_add = float(excelWeapon.getData("Weapon", "spread_aim_move_add", iIndex));
                            }
                            // End:0x24D6
                            if(float(0) == wParam.fViewKickHip_XMin)
                            {
                                wParam.fViewKickHip_XMin = float(excelWeapon.getData("Weapon", "view_kick_hip_x_min", iIndex));
                            }
                            // End:0x252E
                            if(float(0) == wParam.fViewKickHip_XMax)
                            {
                                wParam.fViewKickHip_XMax = float(excelWeapon.getData("Weapon", "view_kick_hip_x_max", iIndex));
                            }
                            // End:0x2586
                            if(float(0) == wParam.fViewKickHip_YMin)
                            {
                                wParam.fViewKickHip_YMin = float(excelWeapon.getData("Weapon", "view_kick_hip_y_min", iIndex));
                            }
                            // End:0x25DE
                            if(float(0) == wParam.fViewKickHip_YMax)
                            {
                                wParam.fViewKickHip_YMax = float(excelWeapon.getData("Weapon", "view_kick_hip_y_max", iIndex));
                            }
                            // End:0x2636
                            if(float(0) == wParam.fViewKickHip_Accel)
                            {
                                wParam.fViewKickHip_Accel = float(excelWeapon.getData("Weapon", "view_kick_hip_accel", iIndex));
                            }
                            // End:0x268E
                            if(float(0) == wParam.fViewKickHip_Decel)
                            {
                                wParam.fViewKickHip_Decel = float(excelWeapon.getData("Weapon", "view_kick_hip_decel", iIndex));
                            }
                            // End:0x26EA
                            if(float(0) == wParam.fViewKickHip_StayTime)
                            {
                                wParam.fViewKickHip_StayTime = float(excelWeapon.getData("Weapon", "view_kick_hip_stay_time", iIndex));
                            }
                            // End:0x2748
                            if(float(0) == wParam.fViewKickHip_DecaySpeed)
                            {
                                wParam.fViewKickHip_DecaySpeed = float(excelWeapon.getData("Weapon", "view_kick_hip_decay_speed", iIndex));
                            }
                            // End:0x27AA
                            if(float(0) == wParam.fViewKickHip_DecayTimeFast)
                            {
                                wParam.fViewKickHip_DecayTimeFast = float(excelWeapon.getData("Weapon", "view_kick_hip_decay_time_fast", iIndex));
                            }
                            // End:0x2802
                            if(float(0) == wParam.fViewKickAds_XMin)
                            {
                                wParam.fViewKickAds_XMin = float(excelWeapon.getData("Weapon", "view_kick_ads_x_min", iIndex));
                            }
                            // End:0x285A
                            if(float(0) == wParam.fViewKickAds_XMax)
                            {
                                wParam.fViewKickAds_XMax = float(excelWeapon.getData("Weapon", "view_kick_ads_x_max", iIndex));
                            }
                            // End:0x28B2
                            if(float(0) == wParam.fViewKickAds_YMin)
                            {
                                wParam.fViewKickAds_YMin = float(excelWeapon.getData("Weapon", "view_kick_ads_y_min", iIndex));
                            }
                            // End:0x290A
                            if(float(0) == wParam.fViewKickAds_YMax)
                            {
                                wParam.fViewKickAds_YMax = float(excelWeapon.getData("Weapon", "view_kick_ads_y_max", iIndex));
                            }
                            // End:0x2962
                            if(float(0) == wParam.fViewKickAds_Accel)
                            {
                                wParam.fViewKickAds_Accel = float(excelWeapon.getData("Weapon", "view_kick_ads_accel", iIndex));
                            }
                            // End:0x29BA
                            if(float(0) == wParam.fViewKickAds_Decel)
                            {
                                wParam.fViewKickAds_Decel = float(excelWeapon.getData("Weapon", "view_kick_ads_decel", iIndex));
                            }
                            // End:0x2A16
                            if(float(0) == wParam.fViewKickAds_StayTime)
                            {
                                wParam.fViewKickAds_StayTime = float(excelWeapon.getData("Weapon", "view_kick_ads_stay_time", iIndex));
                            }
                            // End:0x2A74
                            if(float(0) == wParam.fViewKickAds_DecaySpeed)
                            {
                                wParam.fViewKickAds_DecaySpeed = float(excelWeapon.getData("Weapon", "view_kick_ads_decay_speed", iIndex));
                            }
                            // End:0x2AD6
                            if(float(0) == wParam.fViewKickAds_DecayTimeFast)
                            {
                                wParam.fViewKickAds_DecayTimeFast = float(excelWeapon.getData("Weapon", "view_kick_ads_decay_time_fast", iIndex));
                            }
                            // End:0x2B2B
                            if(float(0) == wParam.fBreathRadius_Idle)
                            {
                                wParam.fBreathRadius_Idle = float(excelWeapon.getData("Weapon", "breath_stand_gun", iIndex));
                            }
                            // End:0x2B86
                            if(float(0) == wParam.fBreathSpeed_Idle)
                            {
                                wParam.fBreathSpeed_Idle = float(excelWeapon.getData("Weapon", "breath_stand_gun_speed", iIndex));
                            }
                            // End:0x2BDD
                            if(float(0) == wParam.fBreathRadius_Aim)
                            {
                                wParam.fBreathRadius_Aim = float(excelWeapon.getData("Weapon", "breath_ads_gunnaim", iIndex));
                            }
                            // End:0x2C3A
                            if(float(0) == wParam.fBreathSpeed_Aim)
                            {
                                wParam.fBreathSpeed_Aim = float(excelWeapon.getData("Weapon", "breath_ads_gunnaim_speed", iIndex));
                            }
                            // End:0x2C98
                            if(float(0) == wParam.fBreathRadius_DuckedAim)
                            {
                                wParam.fBreathRadius_DuckedAim = float(excelWeapon.getData("Weapon", "breath_ads_ducked_gunnaim", iIndex));
                            }
                            // End:0x2CFC
                            if(float(0) == wParam.fBreathSpeed_DuckedAim)
                            {
                                wParam.fBreathSpeed_DuckedAim = float(excelWeapon.getData("Weapon", "breath_ads_ducked_gunnaim_speed", iIndex));
                            }
                            // End:0x2D59
                            if(float(0) == wParam.fBreathRadius_ProneAim)
                            {
                                wParam.fBreathRadius_ProneAim = float(excelWeapon.getData("Weapon", "breath_ads_prone_gunnaim", iIndex));
                            }
                            // End:0x2DBC
                            if(float(0) == wParam.fBreathSpeed_ProneAim)
                            {
                                wParam.fBreathSpeed_ProneAim = float(excelWeapon.getData("Weapon", "breath_ads_prone_gunnaim_speed", iIndex));
                            }
                            // End:0x2E11
                            if(float(0) == wParam.fBobWeapon_Move)
                            {
                                wParam.fBobWeapon_Move = float(excelWeapon.getData("Weapon", "bob_hip_move_gun", iIndex));
                            }
                            // End:0x2E67
                            if(float(0) == wParam.fBobScreen_Move)
                            {
                                wParam.fBobScreen_Move = float(excelWeapon.getData("Weapon", "bob_hip_move_view", iIndex));
                            }
                            // End:0x2EC0
                            if(float(0) == wParam.fBobWeapon_Ads_Move)
                            {
                                wParam.fBobWeapon_Ads_Move = float(excelWeapon.getData("Weapon", "bob_ads_move_gunnaim", iIndex));
                            }
                            // End:0x2F16
                            if(float(0) == wParam.fBobScreen_Ads_Move)
                            {
                                wParam.fBobScreen_Ads_Move = float(excelWeapon.getData("Weapon", "bob_ads_move_view", iIndex));
                            }
                            // End:0x2F72
                            if(float(0) == wParam.fBobWeapon_Ducked_Move)
                            {
                                wParam.fBobWeapon_Ducked_Move = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_gun", iIndex));
                            }
                            // End:0x2FCF
                            if(float(0) == wParam.fBobScreen_Ducked_Move)
                            {
                                wParam.fBobScreen_Ducked_Move = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_view", iIndex));
                            }
                            // End:0x302B
                            if(float(0) == wParam.fBobScreen_Prone_Move)
                            {
                                wParam.fBobScreen_Prone_Move = float(excelWeapon.getData("Weapon", "bob_hip_prone_move_view", iIndex));
                            }
                            // End:0x307E
                            if(float(0) == wParam.fBobWeapon_Sprint_Move)
                            {
                                wParam.fBobWeapon_Sprint_Move = float(excelWeapon.getData("Weapon", "bob_sprint_gun", iIndex));
                            }
                            // End:0x30D2
                            if(float(0) == wParam.fBobScreen_Sprint_Move)
                            {
                                wParam.fBobScreen_Sprint_Move = float(excelWeapon.getData("Weapon", "bob_sprint_view", iIndex));
                            }
                            // End:0x3127
                            if(float(0) == wParam.fBobWeapon_sprint_y)
                            {
                                wParam.fBobWeapon_sprint_y = float(excelWeapon.getData("Weapon", "bob_sprint_gun_y", iIndex));
                            }
                            // End:0x317D
                            if(float(0) == wParam.fBobScreen_sprint_y)
                            {
                                wParam.fBobScreen_sprint_y = float(excelWeapon.getData("Weapon", "bob_sprint_view_y", iIndex));
                            }
                            // End:0x31D8
                            if(float(0) == wParam.fBobWeapon_ads_move_y)
                            {
                                wParam.fBobWeapon_ads_move_y = float(excelWeapon.getData("Weapon", "bob_ads_move_gunnaim_y", iIndex));
                            }
                            // End:0x3230
                            if(float(0) == wParam.fBobScreen_ads_move_y)
                            {
                                wParam.fBobScreen_ads_move_y = float(excelWeapon.getData("Weapon", "bob_ads_move_view_y", iIndex));
                            }
                            // End:0x3287
                            if(float(0) == wParam.fBobWeapon_move_y)
                            {
                                wParam.fBobWeapon_move_y = float(excelWeapon.getData("Weapon", "bob_hip_move_gun_y", iIndex));
                            }
                            // End:0x32DF
                            if(float(0) == wParam.fBobScreen_move_y)
                            {
                                wParam.fBobScreen_move_y = float(excelWeapon.getData("Weapon", "bob_hip_move_view_y", iIndex));
                            }
                            // End:0x333D
                            if(float(0) == wParam.fBobWeapon_ducked_move_y)
                            {
                                wParam.fBobWeapon_ducked_move_y = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_gun_y", iIndex));
                            }
                            // End:0x339C
                            if(float(0) == wParam.fBobScreen_ducked_move_y)
                            {
                                wParam.fBobScreen_ducked_move_y = float(excelWeapon.getData("Weapon", "bob_hip_ducked_move_view_y", iIndex));
                            }
                            // End:0x33FA
                            if(float(0) == wParam.fBobScreen_prone_move_y)
                            {
                                wParam.fBobScreen_prone_move_y = float(excelWeapon.getData("Weapon", "bob_hip_prone_move_view_y", iIndex));
                            }
                            // End:0x3451
                            if(float(0) == wParam.fHitMoveSpeed)
                            {
                                wParam.fHitMoveSpeed = float(excelWeapon.getData("Weapon", "hit_gun_move_speed", iIndex));
                            }
                            // End:0x34A7
                            if(float(0) == wParam.fHitMoveTime)
                            {
                                wParam.fHitMoveTime = float(excelWeapon.getData("Weapon", "hit_gun_move_time", iIndex));
                            }
                            // End:0x34FE
                            if(float(0) == wParam.fHitMoveDelay)
                            {
                                wParam.fHitMoveDelay = float(excelWeapon.getData("Weapon", "hit_gun_move_delay", iIndex));
                            }
                            // End:0x3555
                            if(float(0) == wParam.fSprintStaminaRate)
                            {
                                wParam.fSprintStaminaRate = float(excelWeapon.getData("Weapon", "wp_sprint_sta_rate", iIndex));
                            }
                            // End:0x35A8
                            if(float(0) == wParam.fSprintSpeed)
                            {
                                wParam.fSprintSpeed = float(excelWeapon.getData("Weapon", "wp_sprint_move", iIndex));
                            }
                            // End:0x35FA
                            if(float(0) == wParam.fRunSpeed)
                            {
                                wParam.fRunSpeed = float(excelWeapon.getData("Weapon", "wp_stand_move", iIndex));
                            }
                            // End:0x364D
                            if(float(0) == wParam.fCrouchSpeed)
                            {
                                wParam.fCrouchSpeed = float(excelWeapon.getData("Weapon", "wp_crouch_move", iIndex));
                            }
                            // End:0x369F
                            if(float(0) == wParam.fPronedSpeed)
                            {
                                wParam.fPronedSpeed = float(excelWeapon.getData("Weapon", "wp_prone_move", iIndex));
                            }
                            // End:0x36EF
                            if(float(0) == wParam.fAimRunSpeed)
                            {
                                wParam.fAimRunSpeed = float(excelWeapon.getData("Weapon", "wp_aim_move", iIndex));
                            }
                            // End:0x3746
                            if(float(0) == wParam.fAimCrouchSpeed)
                            {
                                wParam.fAimCrouchSpeed = float(excelWeapon.getData("Weapon", "wp_crouch_aim_move", iIndex));
                            }
                            // End:0x3798
                            if(float(0) == wParam.fAnimRate_PutDown)
                            {
                                wParam.fAnimRate_PutDown = float(excelWeapon.getData("Weapon", "ani_rate_drop", iIndex));
                            }
                            // End:0x37F0
                            if(float(0) == wParam.fAnimRate_PutDown_Quick)
                            {
                                wParam.fAnimRate_PutDown_Quick = float(excelWeapon.getData("Weapon", "ani_rate_drop_quick", iIndex));
                            }
                            // End:0x3843
                            if(float(0) == wParam.fAnimRate_BringUp)
                            {
                                wParam.fAnimRate_BringUp = float(excelWeapon.getData("Weapon", "ani_rate_raise", iIndex));
                            }
                            // End:0x389D
                            if(float(0) == wParam.fAnimRate_SprintBringUp)
                            {
                                wParam.fAnimRate_SprintBringUp = float(excelWeapon.getData("Weapon", "ani_rate_sprint_raise", iIndex));
                            }
                            // End:0x38F1
                            if(float(0) == wParam.fAnimRate_AdsOn)
                            {
                                wParam.fAnimRate_AdsOn = float(excelWeapon.getData("Weapon", "ani_rate_ads_on", iIndex));
                            }
                            // End:0x3946
                            if(float(0) == wParam.fAnimRate_AdsOff)
                            {
                                wParam.fAnimRate_AdsOff = float(excelWeapon.getData("Weapon", "ani_rate_ads_off", iIndex));
                            }
                            // End:0x3995
                            if(false == wParam.bApplyQuickDrop)
                            {
                                wParam.bApplyQuickDrop = bool(excelWeapon.getData("Weapon", "drop_quick", iIndex));
                            }
                            // End:0x39F2
                            if(float(0) == wParam.fSway_HipX_Max)
                            {
                                wParam.fSway_HipX_Max = float(excelWeapon.getData("Weapon", "sway_gun_hip_x_max_angle", iIndex));
                            }
                            // End:0x3A50
                            if(float(0) == wParam.fSway_HipX_Incr)
                            {
                                wParam.fSway_HipX_Incr = float(excelWeapon.getData("Weapon", "sway_gun_hip_x_move_angle", iIndex));
                            }
                            // End:0x3AA8
                            if(float(0) == wParam.fSway_HipX_Speed)
                            {
                                wParam.fSway_HipX_Speed = float(excelWeapon.getData("Weapon", "sway_gun_hip_x_move", iIndex));
                            }
                            // End:0x3B05
                            if(float(0) == wParam.fSway_HipY_Max)
                            {
                                wParam.fSway_HipY_Max = float(excelWeapon.getData("Weapon", "sway_gun_hip_y_max_angle", iIndex));
                            }
                            // End:0x3B63
                            if(float(0) == wParam.fSway_HipY_Incr)
                            {
                                wParam.fSway_HipY_Incr = float(excelWeapon.getData("Weapon", "sway_gun_hip_y_move_angle", iIndex));
                            }
                            // End:0x3BBB
                            if(float(0) == wParam.fSway_HipY_Speed)
                            {
                                wParam.fSway_HipY_Speed = float(excelWeapon.getData("Weapon", "sway_gun_hip_y_move", iIndex));
                            }
                            // End:0x3C18
                            if(float(0) == wParam.fSway_AdsX_Max)
                            {
                                wParam.fSway_AdsX_Max = float(excelWeapon.getData("Weapon", "sway_gun_ads_x_max_angle", iIndex));
                            }
                            // End:0x3C76
                            if(float(0) == wParam.fSway_AdsX_Incr)
                            {
                                wParam.fSway_AdsX_Incr = float(excelWeapon.getData("Weapon", "sway_gun_ads_x_move_angle", iIndex));
                            }
                            // End:0x3CCE
                            if(float(0) == wParam.fSway_AdsX_Speed)
                            {
                                wParam.fSway_AdsX_Speed = float(excelWeapon.getData("Weapon", "sway_gun_ads_x_move", iIndex));
                            }
                            // End:0x3D2B
                            if(float(0) == wParam.fSway_AdsY_Max)
                            {
                                wParam.fSway_AdsY_Max = float(excelWeapon.getData("Weapon", "sway_gun_ads_y_max_angle", iIndex));
                            }
                            // End:0x3D89
                            if(float(0) == wParam.fSway_AdsY_Incr)
                            {
                                wParam.fSway_AdsY_Incr = float(excelWeapon.getData("Weapon", "sway_gun_ads_y_move_angle", iIndex));
                            }
                            // End:0x3DE1
                            if(float(0) == wParam.fSway_AdsY_Speed)
                            {
                                wParam.fSway_AdsY_Speed = float(excelWeapon.getData("Weapon", "sway_gun_ads_y_move", iIndex));
                            }
                            // End:0x3E3A
                            if(float(0) == wParam.fMaxPitch)
                            {
                                wParam.fMaxPitch = float(excelWeapon.getData("Weapon", "view_angle_pitch_max", iIndex));
                            }
                            // End:0x3E89
                            if(0 == wParam.iCrossHair)
                            {
                                wParam.iCrossHair = int(excelWeapon.getData("Weapon", "crosshair_id", iIndex));
                            }
                            // End:0x3EE6
                            if(float(0) == wParam.fMovePivot)
                            {
                                wParam.fMovePivot = float(excelWeapon.getData("Weapon", "gun_pos_hip_move_front_y", iIndex));
                            }
                            // End:0x3F32
                            if(0 == wParam.ui_damage)
                            {
                                wParam.ui_damage = int(excelWeapon.getData("Weapon", "ui_damage", iIndex));
                            }
                            // End:0x3F7E
                            if(0 == wParam.ui_spread)
                            {
                                wParam.ui_spread = int(excelWeapon.getData("Weapon", "ui_spread", iIndex));
                            }
                            // End:0x3FCD
                            if(0 == wParam.ui_view_kick)
                            {
                                wParam.ui_view_kick = int(excelWeapon.getData("Weapon", "ui_view_kick", iIndex));
                            }
                            // End:0x401F
                            if(0 == wParam.ui_rate_of_fire)
                            {
                                wParam.ui_rate_of_fire = int(excelWeapon.getData("Weapon", "ui_rate_of_fire", iIndex));
                            }
                            // End:0x4069
                            if(0 == wParam.ui_move)
                            {
                                wParam.ui_move = int(excelWeapon.getData("Weapon", "ui_move", iIndex));
                            }
                            // End:0x40B4
                            if(0 == wParam.ui_range)
                            {
                                wParam.ui_range = int(excelWeapon.getData("Weapon", "ui_range", iIndex));
                            }
                            // End:0x4108
                            if(float(0) == wParam.fNPCSpreadRate)
                            {
                                wParam.fNPCSpreadRate = float(excelWeapon.getData("Weapon", "npc_spread_rate", iIndex));
                            }
                            // End:0x415D
                            if(float(0) == wParam.fNPCRateOfFire)
                            {
                                wParam.fNPCRateOfFire = float(excelWeapon.getData("Weapon", "npc_rate_of_fire", iIndex));
                            }
                            // End:0x41A8
                            if(0 == wParam.iNPCFire)
                            {
                                wParam.iNPCFire = int(excelWeapon.getData("Weapon", "npc_fire", iIndex));
                            }
                            // End:0x41FA
                            if(float(0) == wParam.fMeleeDelay)
                            {
                                wParam.fMeleeDelay = float(excelWeapon.getData("WeaponEx", "melee_delay", iIndex));
                            }
                            // End:0x424B
                            if(0 == wParam.iDamMelee)
                            {
                                wParam.iDamMelee = int(excelWeapon.getData("WeaponEx", "melee_damage", iIndex));
                            }
                            // End:0x429B
                            if(0 == wParam.iMeleeRange)
                            {
                                wParam.iMeleeRange = int(excelWeapon.getData("WeaponEx", "melee_range", iIndex));
                            }
                            // End:0x42EC
                            if(0 == wParam.iMeleeExtent)
                            {
                                wParam.iMeleeExtent = int(excelWeapon.getData("WeaponEx", "melee_extent", iIndex));
                            }
                            // End:0x4342
                            if(0 == wParam.iMeleeExtent_Head)
                            {
                                wParam.iMeleeExtent_Head = int(excelWeapon.getData("WeaponEx", "melee_extent_head", iIndex));
                            }
                            // End:0x4398
                            if(0 == wParam.iMeleeDam_Back)
                            {
                                wParam.iMeleeDam_Back = int(excelWeapon.getData("WeaponEx", "melee_damage_back", iIndex));
                            }
                            // End:0x43F0
                            if(float(0) == wParam.fMeleeDam_Head)
                            {
                                wParam.fMeleeDam_Head = float(excelWeapon.getData("WeaponEx", "melee_damage_head", iIndex));
                            }
                            // End:0x444E
                            if(float(0) == wParam.fMeleeDam_UpperTorso)
                            {
                                wParam.fMeleeDam_UpperTorso = float(excelWeapon.getData("WeaponEx", "melee_damage_uppertorso", iIndex));
                            }
                            // End:0x44AC
                            if(float(0) == wParam.fMeleeDam_LowerTorso)
                            {
                                wParam.fMeleeDam_LowerTorso = float(excelWeapon.getData("WeaponEx", "melee_damage_lowertorso", iIndex));
                            }
                            // End:0x4508
                            if(float(0) == wParam.fMeleeDam_UpperArm)
                            {
                                wParam.fMeleeDam_UpperArm = float(excelWeapon.getData("WeaponEx", "melee_damage_upperarm", iIndex));
                            }
                            // End:0x4564
                            if(float(0) == wParam.fMeleeDam_LowerArm)
                            {
                                wParam.fMeleeDam_LowerArm = float(excelWeapon.getData("WeaponEx", "melee_damage_lowerarm", iIndex));
                            }
                            // End:0x45C0
                            if(float(0) == wParam.fMeleeDam_UpperLeg)
                            {
                                wParam.fMeleeDam_UpperLeg = float(excelWeapon.getData("WeaponEx", "melee_damage_upperleg", iIndex));
                            }
                            // End:0x461C
                            if(float(0) == wParam.fMeleeDam_LowerLeg)
                            {
                                wParam.fMeleeDam_LowerLeg = float(excelWeapon.getData("WeaponEx", "melee_damage_lowerleg", iIndex));
                            }
                            // End:0x4680
                            if(float(0) == wParam.fFiringSway_HipX_Max)
                            {
                                wParam.fFiringSway_HipX_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_x_max_angle_fire", iIndex));
                            }
                            // End:0x46E5
                            if(float(0) == wParam.fFiringSway_HipX_Incr)
                            {
                                wParam.fFiringSway_HipX_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_x_move_angle_fire", iIndex));
                            }
                            // End:0x4744
                            if(float(0) == wParam.fFiringSway_HipX_Speed)
                            {
                                wParam.fFiringSway_HipX_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_x_move_fire", iIndex));
                            }
                            // End:0x47A8
                            if(float(0) == wParam.fFiringSway_HipY_Max)
                            {
                                wParam.fFiringSway_HipY_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_y_max_angle_fire", iIndex));
                            }
                            // End:0x480D
                            if(float(0) == wParam.fFiringSway_HipY_Incr)
                            {
                                wParam.fFiringSway_HipY_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_y_move_angle_fire", iIndex));
                            }
                            // End:0x486C
                            if(float(0) == wParam.fFiringSway_HipY_Speed)
                            {
                                wParam.fFiringSway_HipY_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_hip_y_move_fire", iIndex));
                            }
                            // End:0x48D0
                            if(float(0) == wParam.fFiringSway_AdsX_Max)
                            {
                                wParam.fFiringSway_AdsX_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_x_max_angle_fire", iIndex));
                            }
                            // End:0x4935
                            if(float(0) == wParam.fFiringSway_AdsX_Incr)
                            {
                                wParam.fFiringSway_AdsX_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_x_move_angle_fire", iIndex));
                            }
                            // End:0x4994
                            if(float(0) == wParam.fFiringSway_AdsX_Speed)
                            {
                                wParam.fFiringSway_AdsX_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_x_move_fire", iIndex));
                            }
                            // End:0x49F8
                            if(float(0) == wParam.fFiringSway_AdsY_Max)
                            {
                                wParam.fFiringSway_AdsY_Max = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_y_max_angle_fire", iIndex));
                            }
                            // End:0x4A5D
                            if(float(0) == wParam.fFiringSway_AdsY_Incr)
                            {
                                wParam.fFiringSway_AdsY_Incr = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_y_move_angle_fire", iIndex));
                            }
                            // End:0x4ABC
                            if(float(0) == wParam.fFiringSway_AdsY_Speed)
                            {
                                wParam.fFiringSway_AdsY_Speed = float(excelWeapon.getData("WeaponEx", "sway_gun_ads_y_move_fire", iIndex));
                            }
                            // End:0x4AC8
                            if(bCheat)
                            {
                                // [Explicit Break]
                                goto J0x4AD2;
                            }
                            iIndex++;
                            J0x4ACF:

                            // [Loop Continue]
                            goto J0x07;
                        }/* !MISMATCHING REMOVE, tried Loop got Type:Else Position:0x18D4! */
                        J0x4AD2:

                        //return;                        
                    }
                }
            }
        }
    }/* !MISMATCHING REMOVE, tried Else got Type:Loop Position:0x007! */
}

event wWeaponBaseParams GetBaseParam(int id)
{
    local int iLength, iTemp;

    iLength = WeaponParams.Length;
    iTemp = 0;
    J0x13:

    // End:0x56 [Loop If]
    if(iTemp < iLength)
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
    arr_szResClass[53]="WWeapons_Res.wWeaponRes_TDIVector"
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
    arr_szResClass[65]="WWeapons_Res.wWeaponRes_M1897"
    arr_szResClass[66]="WWeapons_Res.wWeaponRes_ASVal"
    arr_szResClass[67]="WWeapons_Res.wWeaponRes_M1014"
    arr_szResClass[68]="WWeapons_Res.wWeaponRes_MP9"
    arr_szResClass[69]="WWeapons_Res.wWeaponRes_RX4Storm"
    arr_szResClass[70]="WWeapons_Res.wWeaponRes_HK416"
    arr_szResClass[71]="WWeapons_Res.wWeaponRes_AN94"
    arr_szResClass[72]="WWeapons_Res.wWeaponRes_MK48"
    arr_szResClass[73]="WWeapons_Res.wWeaponRes_M4Custom"
    arr_szResClass[74]="WWeapons_Res.wWeaponRes_SA58"
    arr_szResClass[75]="WWeapons_Res.wWeaponRes_GROZA"
    arr_szResClass[76]="WWeapons_Res.wWeaponRes_M14EBR"
    arr_szResClass[77]="WWeapons_Res.wWeaponRes_TearGas"
    arr_szResClass[78]="WWeapons_Res.wWeaponRes_AK47Custom"
    arr_szResClass[79]="WWeapons_Res.wWeaponRes_FragGrenade_Water"
    arr_szResClass[80]="WWeapons_Res.wWeaponRes_PinpointBomb"
    arr_szResClass[81]="WWeapons_Res.wWeaponRes_SCARLCustom"
    arr_szResClass[82]="WWeapons_Res.wWeaponRes_QSZ92"
    arr_szResClass[83]="WWeapons_Res.wWeaponRes_QBZ95"
    arr_szResClass[84]="WWeapons_Res.wWeaponRes_MP5Custom"
    arr_szResClass[85]="WWeapons_Res.wWeaponRes_QBU88"
    arr_szResClass[86]="WWeapons_Res.wWeaponRes_Tar21Custom"
    arr_szResClass[87]="WWeapons_Res.wWeaponRes_FragGrenade_xmas"
    arr_szResClass[88]="WWeapons_Res.wWeaponRes_SentryGun"
    arr_szResClass[89]="WWeapons_Res.wWeaponRes_HecateCustom"
    arr_szResClass[90]="WWeapons_Res.wWeaponRes_SemtexGrenade"
    arr_szResClass[91]="WWeapons_Res.wWeaponRes_AlienMelee"
    arr_szResClass[92]="WWeapons_Res.wWeaponRes_KrissSVCustom"
    arr_szResClass[93]="WWeapons_Res.wWeaponRes_FragGrenade_Valentine"
    arr_szResClass[94]="WWeapons_Res.wWeaponRes_KrissSVGacha"
    arr_szResClass[95]="WWeapons_Res.wWeaponRes_M4A1_Alien"
    arr_szResClass[96]="WWeapons_Res.wWeaponRes_MK48_Alien"
    arr_szResClass[97]="WWeapons_Res.wWeaponRes_Hecate_Alien"
    arr_szResClass[98]="WWeapons_Res.wWeaponRes_AlienTankerMelee"
    arr_szResClass[99]="WWeapons_Res.wWeaponRes_G36C_Custom"
    arr_szResClass[100]="WWeapons_Res.wWeaponRes_M4A1_Gorilla"
    arr_szResClass[101]="WWeapons_Res.wWeaponRes_M4A1_Topaz"
    arr_szResClass[102]="WWeapons_Res.wWeaponRes_AlienMelee2"
    arr_szResClass[103]="WWeapons_Res.wWeaponRes_AlienMelee3"
    arr_szResClass[104]="WWeapons_Res.wWeaponRes_AlienGrenade"
    arr_szResClass[105]="WWeapons_Res.wWeaponRes_AlienGrenade2"
    arr_szResClass[106]="WWeapons_Res.wWeaponRes_AlienGun"
    arr_szResClass[107]="WWeapons_Res.wWeaponRes_AlienRPG7"
    arr_szResClass[108]="WWeapons_Res.wWeaponRes_AlienM2B"
    arr_szResClass[109]="WWeapons_Res.wWeaponRes_AlienM2B2"
    arr_szResClass[110]="WWeapons_Res.wWeaponRes_Alien_Artillery"
    arr_szResClass[111]="WWeapons_Res.wWeaponRes_Alien_Nemesis_Beam"
    arr_szResClass[112]="WWeapons_Res.wWeaponRes_Alien_Nemesis_Flame"
    arr_szResClass[113]="WWeapons_Res.wWeaponRes_Alien_Nemesis_SpecialRPG7"
    arr_szResClass[114]="WWeapons_Res.wWeaponRes_Alien_Nemesis_Special_Flame"
    arr_szResClass[115]="WWeapons_Res.wWeaponRes_DesertEagle_Dragon"
    arr_szResClass[116]="WWeapons_Res.wWeaponRes_Hecate_Dragon"
    arr_szResClass[117]="WWeapons_Res.wWeaponRes_M4_Dragon"
    arr_szResClass[118]="WWeapons_Res.wWeaponRes_M249_Custom"
    arr_szResClass[119]="WWeapons_Res.wWeaponRes_FragGrenade_Easter_A"
    arr_szResClass[120]="WWeapons_Res.wWeaponRes_FragGrenade_Easter_B"
    arr_szResClass[121]="WWeapons_Res.wWeaponRes_AK47_Alien"
    arr_szResClass[122]="WWeapons_Res.wWeaponRes_P90_Custom"
    arr_szResClass[123]="WWeapons_Res.wWeaponRes_Flamethrower_02"
    arr_szResClass[124]="WWeapons_Res.wWeaponRes_M4Custom_Drum"
    arr_szResClass[125]="WWeapons_Res.wWeaponRes_DesertEagle_Dual"
    BaseSpeed_Sprint[0]=600.0000000
    BaseSpeed_Sprint[1]=630.0000000
    BaseSpeed_Sprint[2]=630.0000000
    BaseSpeed_Sprint[3]=600.0000000
    BaseSpeed_Sprint[4]=600.0000000
    BaseSpeed_Run[0]=400.0000000
    BaseSpeed_Run[1]=420.0000000
    BaseSpeed_Run[2]=420.0000000
    BaseSpeed_Run[3]=400.0000000
    BaseSpeed_Run[4]=400.0000000
    BaseSpeed_Aim[0]=160.0000000
    BaseSpeed_Aim[1]=336.0000000
    BaseSpeed_Aim[2]=160.0000000
    BaseSpeed_Aim[3]=160.0000000
    BaseSpeed_Aim[4]=160.0000000
    BaseSpeed_Run_Cr[0]=264.0000000
    BaseSpeed_Run_Cr[1]=277.0000000
    BaseSpeed_Run_Cr[2]=277.0000000
    BaseSpeed_Run_Cr[3]=264.0000000
    BaseSpeed_Run_Cr[4]=264.0000000
    BaseSpeed_Aim_Cr[0]=106.0000000
    BaseSpeed_Aim_Cr[1]=222.0000000
    BaseSpeed_Aim_Cr[2]=106.0000000
    BaseSpeed_Aim_Cr[3]=106.0000000
    BaseSpeed_Aim_Cr[4]=106.0000000
    BaseSpeed_Prone[0]=100.0000000
    BaseSpeed_Prone[1]=105.0000000
    BaseSpeed_Prone[2]=105.0000000
    BaseSpeed_Prone[3]=100.0000000
    BaseSpeed_Prone[4]=100.0000000
}