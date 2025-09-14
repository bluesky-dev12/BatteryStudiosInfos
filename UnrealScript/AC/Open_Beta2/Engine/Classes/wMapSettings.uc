class wMapSettings extends Object;

var wMatchMaker MatchMaker;
var wGameManager GM;

function Initialize(wMatchMaker MM)
{
    MatchMaker = MM;
    GM = MM.gEngine.GGameMgr;
    //return;    
}

private function bool _isValidMap(string fileName, optional bool bServiceBuild)
{
    local string LocStr;

    // End:0x18
    if(Locs(Left(fileName, 4)) == "auto")
    {
        return false;
    }
    // End:0x2D
    if(Locs(fileName) == "entry")
    {
        return false;
    }
    LocStr = Locs(fileName);
    return IsValidMap_GP(LocStr, bServiceBuild);
    //return;    
}

function bool IsValidMap_CHINA(string LocStr, optional bool bServiceBuild)
{
    // End:0x1F3
    if((((((((((((((((((((LocStr == "dm-downtown") || LocStr == "dm-bootcamp") || LocStr == "dm-cqbhouse") || LocStr == "dm-quarterblow") || LocStr == "dm-repair") || LocStr == "dm-watchtower") || LocStr == "dm-arcticwind") || LocStr ~= "TUT-BasicTraining") || LocStr == "dm-moscow") || LocStr == "dm-syria") || LocStr == "dm-mirage") || LocStr == "dm-sandstorm") || LocStr == "dm-bigbang") || LocStr == "dm-chinamarket") || LocStr == "dm-newyork") || LocStr == "dm-vintage") || LocStr == "dm-mist") || LocStr == "dm-inferno") || LocStr ~= "dm-burningcity") || LocStr == "dm-silo")
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsValidMap_GP(string LocStr, optional bool bServiceBuild)
{
    // End:0x19F
    if(((((((((((((((((LocStr == "dm-downtown") || LocStr == "dm-repair") || LocStr == "dm-newyork") || LocStr == "dm-arcticwind") || LocStr == "dm-bootcamp") || LocStr == "dm-cqbhouse") || LocStr == "dm-bigbang") || LocStr == "dm-mirage") || LocStr == "dm-mist") || LocStr == "dm-vintage") || LocStr == "dm-silo") || LocStr == "dm-quarterblow") || LocStr == "dm-syria") || LocStr == "dm-moscow") || LocStr == "dm-highway") || LocStr == "dm-chinamarket") || LocStr ~= "dm-burningcity")
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsValidMap_ID(string LocStr, optional bool bServiceBuild)
{
    // End:0x122
    if((((((((((((LocStr == "dm-downtown") || LocStr == "dm-repair") || LocStr == "dm-newyork") || LocStr == "dm-arcticwind") || LocStr == "dm-bootcamp") || LocStr == "dm-cqbhouse") || LocStr == "dm-bigbang") || LocStr == "dm-mirage") || LocStr == "dm-mist") || LocStr == "dm-vintage") || LocStr == "dm-silo") || LocStr == "dm-quarterblow")
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsValidMap_THAILAND(string LocStr, optional bool bServiceBuild)
{
    // End:0x118
    if(((((((((((LocStr == "dm-bootcamp") || LocStr == "dm-cqbhouse") || LocStr == "dm-arcticwind") || LocStr == "dm-downtown") || LocStr == "dm-quarterblow") || LocStr == "dm-mirage") || LocStr == "dm-newyork") || LocStr == "dm-bigbang") || LocStr == "dm-inferno") || LocStr == "dm-watchtower") || LocStr ~= "dm-burningcity")
    {
        return true;
    }
    return false;
    //return;    
}

function array<wMapInfo> GetAllMapInfos(optional bool bServiceBuild)
{
    local int lp1;
    local array<MapRecord> List;
    local MapRecord record;
    local wMapInfo Info;
    local array<wMapInfo> infos;

    Class'Engine_Decompressed.CacheManager'.static.GetMapList(List);
    Log("[wMapSettings::GetAllMapInfo] GetMapList.Length=" $ string(List.Length));
    lp1 = 0;
    J0x56:

    // End:0x105 [Loop If]
    if(lp1 < List.Length)
    {
        record = List[lp1];
        // End:0xFB
        if(_isValidMap(record.MapName, bServiceBuild))
        {
            Info = GetMapInfo(record.MapName);
            // End:0xFB
            if(false == MatchMaker.IsChannelRestrictionMaps(Info.MapID))
            {
                infos[infos.Length] = Info;
                Log("Valid Map Name= " $ record.MapName);
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x56;
    }
    return infos;
    //return;    
}

function wMapInfo GetMapInfoByMapNum(array<wMapInfo> infos, int MapNum)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < infos.Length)
    {
        // End:0x41
        if(infos[i].MapID == MapNum)
        {
            return infos[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function int IsGameModeEnable(int MapID, int GameModeIdx)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < GM.MapInfos.Length)
    {
        // End:0x60
        if(GM.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
            // [Explicit Break]
            goto J0x6A;
        }
        lp1++;
        // [Loop Continue]
        goto J0x12;
    }
    J0x6A:

    // End:0xA3
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_TeamDeath())
    {
        return int(GM.MapInfos[idx].ModeTDM);
    }
    // End:0xDC
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_SD())
    {
        return int(GM.MapInfos[idx].ModeSD);
    }
    // End:0x115
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DeathMatch())
    {
        return int(GM.MapInfos[idx].ModeFFA);
    }
    // End:0x14E
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Domination())
    {
        return int(GM.MapInfos[idx].ModeDomination);
    }
    // End:0x187
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Sabotage())
    {
        return int(GM.MapInfos[idx].ModeSabotage);
    }
    // End:0x1C0
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTeamDeath())
    {
        return int(GM.MapInfos[idx].ModeBotTDM);
    }
    // End:0x1F9
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDomination())
    {
        return int(GM.MapInfos[idx].ModeBotDomination);
    }
    // End:0x232
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDeathMatch())
    {
        return int(GM.MapInfos[idx].ModeBotFFA);
    }
    // End:0x259
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTutorial())
    {
        // End:0x259
        if(MapID != 29)
        {
            return 0;
        }
    }
    // End:0x292
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner())
    {
        return int(GM.MapInfos[idx].ModeBotBeginner);
    }
    // End:0x2CB
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Defence())
    {
        return int(GM.MapInfos[idx].ModeDefence);
    }
    // End:0x304
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DOA())
    {
        return int(GM.MapInfos[idx].ModeDOA);
    }
    // End:0x33D
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Alien())
    {
        return int(GM.MapInfos[idx].ModeAlien);
    }
    return 1;
    //return;    
}

function int GetMaxUserCount(int MapID, int GameModeIdx)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < GM.MapInfos.Length)
    {
        // End:0x60
        if(GM.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
            // [Explicit Break]
            goto J0x6A;
        }
        lp1++;
        // [Loop Continue]
        goto J0x12;
    }
    J0x6A:

    // End:0xA1
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_TeamDeath())
    {
        return GM.MapInfos[idx].ModeTDM_Max;
    }
    // End:0xD8
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_SD())
    {
        return GM.MapInfos[idx].ModeSD_Max;
    }
    // End:0x10F
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DeathMatch())
    {
        return GM.MapInfos[idx].ModeFFA_Max;
    }
    // End:0x146
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Domination())
    {
        return GM.MapInfos[idx].ModeDomination_Max;
    }
    // End:0x17D
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Sabotage())
    {
        return GM.MapInfos[idx].ModeSabotage_Max;
    }
    // End:0x1B4
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTeamDeath())
    {
        return GM.MapInfos[idx].ModeBotTDM_Max;
    }
    // End:0x1EB
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDomination())
    {
        return GM.MapInfos[idx].ModeBotDomination_Max;
    }
    // End:0x222
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDeathMatch())
    {
        return GM.MapInfos[idx].ModeBotFFA_Max;
    }
    // End:0x259
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner())
    {
        return GM.MapInfos[idx].ModeBotBeginner_Max;
    }
    // End:0x290
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Defence())
    {
        return GM.MapInfos[idx].ModeDefence_Max;
    }
    // End:0x2C7
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_DOA())
    {
        return GM.MapInfos[idx].ModeDOA_Max;
    }
    // End:0x2FE
    if(GameModeIdx == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Alien())
    {
        return GM.MapInfos[idx].ModeAlien_Max;
    }
    return 16;
    //return;    
}

function int GetWeaponRestriction(int MapID, int weaponID)
{
    local int idx, lp1;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < GM.MapInfos.Length)
    {
        // End:0x60
        if(GM.MapInfos[lp1].MapID == MapID)
        {
            idx = lp1;
            // [Explicit Break]
            goto J0x6A;
        }
        lp1++;
        // [Loop Continue]
        goto J0x12;
    }
    J0x6A:

    // End:0x95
    if(weaponID == 0)
    {
        return int(GM.MapInfos[idx].SubMode_All);
    }
    // End:0xC0
    if(weaponID == 1)
    {
        return int(GM.MapInfos[idx].SubMode_Knife);
    }
    // End:0xEC
    if(weaponID == 2)
    {
        return int(GM.MapInfos[idx].SubMode_Pistol);
    }
    // End:0x118
    if(weaponID == 3)
    {
        return int(GM.MapInfos[idx].SubMode_Grenade);
    }
    // End:0x144
    if(weaponID == 4)
    {
        return int(GM.MapInfos[idx].SubMode_Rocket);
    }
    // End:0x170
    if(weaponID == 5)
    {
        return int(GM.MapInfos[idx].SubMode_Sniper);
    }
    // End:0x19C
    if(weaponID == 6)
    {
        return int(GM.MapInfos[idx].SubMode_SniperX);
    }
    // End:0x1C8
    if(weaponID == 8)
    {
        return int(GM.MapInfos[idx].SubMode_ShotGun);
    }
    // End:0x1F4
    if(weaponID == 9)
    {
        return int(GM.MapInfos[idx].SubMode_MG);
    }
    // End:0x220
    if(weaponID == 10)
    {
        return int(GM.MapInfos[idx].SubMode_FlameThower);
    }
    return 0;
    //return;    
}

function wMapInfo GetMapInfoByID(int MapID)
{
    local int idx;

    idx = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(idx < GM.MapInfos.Length)
    {
        // End:0x5C
        if(GM.MapInfos[idx].MapID == MapID)
        {
            return GM.MapInfos[idx];
        }
        ++idx;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function wMapInfo GetMapInfo(string dfile)
{
    local int idx;
    local wMapInfo Info;

    idx = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(idx < GM.MapInfos.Length)
    {
        // End:0x5C
        if(GM.MapInfos[idx].File ~= dfile)
        {
            return GM.MapInfos[idx];
        }
        ++idx;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}
