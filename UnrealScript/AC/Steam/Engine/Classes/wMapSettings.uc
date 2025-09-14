/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMapSettings.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:14
 *
 *******************************************************************************/
class wMapSettings extends Object
    dependson(CacheManager)
    dependson(GameEngine);

var wMatchMaker MatchMaker;
var wGameManager gm;

function Initialize(wMatchMaker MM)
{
    MatchMaker = MM;
    gm = MM.gEngine.GGameMgr;
}

private function bool _isValidMap(string fileName, optional bool bServiceBuild)
{
    local string LocStr;

    // End:0x18
    if(Locs(Left(fileName, 4)) == "auto")
    {
        return false;
    }
    // End:0x2d
    if(Locs(fileName) == "entry")
    {
        return false;
    }
    LocStr = Locs(fileName);
    return IsValidMap_GP(LocStr, bServiceBuild);
}

function bool IsValidMap_CHINA(string LocStr, optional bool bServiceBuild)
{
    // End:0x195
    if(LocStr == "dm-downtown" || LocStr == "dm-bootcamp" || LocStr == "dm-cqbhouse" || LocStr == "dm-quarterblow" || LocStr == "dm-repair" || LocStr == "dm-watchtower" || LocStr == "dm-arcticwind" || LocStr ~= "TUT-BasicTraining" || LocStr == "dm-moscow" || LocStr == "dm-syria" || LocStr == "dm-mirage" || LocStr == "dm-sandstorm" || LocStr == "dm-bigbang" || LocStr == "dm-chinamarket" || LocStr == "dm-newyork" || LocStr == "dm-vintage")
    {
        return true;
    }
    return false;
}

function bool IsValidMap_GP(string LocStr, optional bool bServiceBuild)
{
    // End:0x16e
    if(LocStr ~= "TUT-BasicTraining" || LocStr == "dm-downtown" || LocStr == "dm-repair" || LocStr == "dm-newyork" || LocStr == "dm-arcticwind" || LocStr == "dm-bootcamp" || LocStr == "dm-cqbhouse" || LocStr == "dm-bigbang" || LocStr == "dm-mirage" || LocStr == "dm-mist" || LocStr == "dm-vintage" || LocStr == "dm-silo" || LocStr == "dm-quarterblow" || LocStr == "dm-syria" || LocStr == "dm-moscow")
    {
        return true;
    }
    return false;
}

function bool IsValidMap_THAILAND(string LocStr, optional bool bServiceBuild)
{
    // End:0x114
    if(LocStr == "dm-bootcamp" || LocStr == "dm-cqbhouse" || LocStr == "dm-arcticwind" || LocStr == "dm-downtown" || LocStr == "dm-quarterblow" || LocStr == "dm-mirage" || LocStr == "dm-newyork" || LocStr == "dm-arcbase" || LocStr == "dm-bigbang" || LocStr == "dm-inferno" || LocStr == "dm-watchtower")
    {
        return true;
    }
    return false;
}

function array<wMapInfo> GetAllMapInfos(optional bool bServiceBuild)
{
    local int lp1;
    local array<MapRecord> List;
    local MapRecord record;
    local wMapInfo Info;
    local array<wMapInfo> infos;

    class'CacheManager'.static.GetMapList(List);
    Log("[wMapSettings::GetAllMapInfo] GetMapList.Length=" $ string(List.Length));
    lp1 = 0;
    J0x56:
    // End:0x105 [While If]
    if(lp1 < List.Length)
    {
        record = List[lp1];
        // End:0xfb
        if(_isValidMap(record.MapName, bServiceBuild))
        {
            Info = GetMapInfo(record.MapName);
            // End:0xfb
            if(false == MatchMaker.IsChannelRestrictionMaps(Info.MapID))
            {
                infos[infos.Length] = Info;
                Log("Valid Map Name= " $ record.MapName);
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x56;
    }
    return infos;
}

function wMapInfo GetMapInfoByMapNum(array<wMapInfo> infos, int MapNum)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4b [While If]
    if(i < infos.Length)
    {
        // End:0x41
        if(infos[i].MapID == MapNum)
        {
            return infos[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function int IsGameModeEnable(int MapID, int GameModeIdx)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:
    // End:0x6a [While If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
        }
        // End:0x6a
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    // End:0x95
    if(GameModeIdx == 0)
    {
        return gm.MapInfos[idx].ModeTDM;
    }
    // End:0xc0
    if(GameModeIdx == 1)
    {
        return gm.MapInfos[idx].ModeSD;
    }
    // End:0xec
    if(GameModeIdx == 2)
    {
        return gm.MapInfos[idx].ModeFFA;
    }
    // End:0x118
    if(GameModeIdx == 3)
    {
        return gm.MapInfos[idx].ModeDomination;
    }
    // End:0x144
    if(GameModeIdx == 4)
    {
        return gm.MapInfos[idx].ModeSabotage;
    }
    // End:0x170
    if(GameModeIdx == 5)
    {
        return gm.MapInfos[idx].ModeBotTDM;
    }
    // End:0x19c
    if(GameModeIdx == 6)
    {
        return gm.MapInfos[idx].ModeBotDomination;
    }
    // End:0x1c8
    if(GameModeIdx == 7)
    {
        return gm.MapInfos[idx].ModeBotFFA;
    }
    // End:0x1e2
    if(GameModeIdx == 8)
    {
        // End:0x1e2
        if(MapID != 29)
        {
            return 0;
        }
    }
    // End:0x20e
    if(GameModeIdx == 11)
    {
        return gm.MapInfos[idx].ModeBotBeginner;
    }
    // End:0x23a
    if(GameModeIdx == 12)
    {
        return gm.MapInfos[idx].ModeDefence;
    }
    // End:0x266
    if(GameModeIdx == 13)
    {
        return gm.MapInfos[idx].ModeDOA;
    }
    return 1;
}

function int IsTDM_RandomRespawn(int MapID, int GameModeIdx)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:
    // End:0x6a [While If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
        }
        // End:0x6a
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    // End:0x95
    if(GameModeIdx == 0)
    {
        return gm.MapInfos[idx].ModeTDM_RandomRespawn;
    }
    return 0;
}

function int IsDOMI_RandomRespawn(int MapID, int GameModeIdx)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:
    // End:0x6a [While If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
        }
        // End:0x6a
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    // End:0x96
    if(GameModeIdx == 3)
    {
        return gm.MapInfos[idx].ModeDOMI_RandomRespawn;
    }
    return 0;
}

function int GetMaxUserCount(int MapID, int GameModeIdx)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:
    // End:0x6a [While If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
        }
        // End:0x6a
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    // End:0x93
    if(GameModeIdx == 0)
    {
        return gm.MapInfos[idx].ModeTDM_Max;
    }
    // End:0xbc
    if(GameModeIdx == 1)
    {
        return gm.MapInfos[idx].ModeSD_Max;
    }
    // End:0xe6
    if(GameModeIdx == 2)
    {
        return gm.MapInfos[idx].ModeFFA_Max;
    }
    // End:0x110
    if(GameModeIdx == 3)
    {
        return gm.MapInfos[idx].ModeDomination_Max;
    }
    // End:0x13a
    if(GameModeIdx == 4)
    {
        return gm.MapInfos[idx].ModeSabotage_Max;
    }
    // End:0x164
    if(GameModeIdx == 5)
    {
        return gm.MapInfos[idx].ModeBotTDM_Max;
    }
    // End:0x18e
    if(GameModeIdx == 6)
    {
        return gm.MapInfos[idx].ModeBotDomination_Max;
    }
    // End:0x1b8
    if(GameModeIdx == 7)
    {
        return gm.MapInfos[idx].ModeBotFFA_Max;
    }
    // End:0x1e2
    if(GameModeIdx == 11)
    {
        return gm.MapInfos[idx].ModeBotBeginner_Max;
    }
    // End:0x20c
    if(GameModeIdx == 12)
    {
        return gm.MapInfos[idx].ModeDefence_Max;
    }
    // End:0x236
    if(GameModeIdx == 13)
    {
        return gm.MapInfos[idx].ModeDOA_Max;
    }
    return 16;
}

function int GetWeaponRestriction(int MapID, int weaponID)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:
    // End:0x6a [While If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
        }
        // End:0x6a
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
    }
    // End:0x95
    if(weaponID == 0)
    {
        return gm.MapInfos[idx].SubMode_All;
    }
    // End:0xc0
    if(weaponID == 1)
    {
        return gm.MapInfos[idx].SubMode_Knife;
    }
    // End:0xec
    if(weaponID == 2)
    {
        return gm.MapInfos[idx].SubMode_Pistol;
    }
    // End:0x118
    if(weaponID == 3)
    {
        return gm.MapInfos[idx].SubMode_Grenade;
    }
    // End:0x144
    if(weaponID == 4)
    {
        return gm.MapInfos[idx].SubMode_Rocket;
    }
    // End:0x170
    if(weaponID == 5)
    {
        return gm.MapInfos[idx].SubMode_Sniper;
    }
    // End:0x19c
    if(weaponID == 6)
    {
        return gm.MapInfos[idx].SubMode_SniperX;
    }
    // End:0x1c8
    if(weaponID == 8)
    {
        return gm.MapInfos[idx].SubMode_ShotGun;
    }
    // End:0x1f4
    if(weaponID == 9)
    {
        return gm.MapInfos[idx].SubMode_MG;
    }
    // End:0x220
    if(weaponID == 10)
    {
        return gm.MapInfos[idx].SubMode_FlameThower;
    }
    return 0;
}

function wMapInfo GetMapInfoByID(int MapID)
{
    local int idx;

    idx = 0;
    J0x07:
    // End:0x66 [While If]
    if(idx < gm.MapInfos.Length)
    {
        // End:0x5c
        if(gm.MapInfos[idx].MapID == MapID)
        {
            return gm.MapInfos[idx];
        }
        ++ idx;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function wMapInfo GetMapInfo(string dfile)
{
    local int idx;
    local wMapInfo Info;

    idx = 0;
    J0x07:
    // End:0x66 [While If]
    if(idx < gm.MapInfos.Length)
    {
        // End:0x5c
        if(gm.MapInfos[idx].File ~= dfile)
        {
            return gm.MapInfos[idx];
        }
        ++ idx;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Info = new class'wMapInfo';
    gm.MapInfos[0].CopyTo(Info);
    Info.File = dfile;
    Info.FriendlyName = dfile;
    gm.MapInfos[gm.MapInfos.Length] = Info;
    return Info;
}
