class wMapSettings extends Object;

var wGameManager gm;

function Initialize(wMatchMaker MM)
{
    gm = MM.gEngine.GGameMgr;
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
    // End:0xA6
    if((((LocStr == "dm-bootcamp") || LocStr == "dm-cqbhouse") || LocStr == "dm-arcticwind") || LocStr ~= "TUT-BasicTraining")
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
    local array<wMapInfo> infos;

    Class'Engine_Decompressed.CacheManager'.static.GetMapList(List);
    Log("[wMapSettings::GetAllMapInfo] GetMapList.Length=" $ string(List.Length));
    lp1 = 0;
    J0x56:

    // End:0xD7 [Loop If]
    if(lp1 < List.Length)
    {
        record = List[lp1];
        // End:0xCD
        if(_isValidMap(record.MapName, bServiceBuild))
        {
            infos[infos.Length] = GetMapInfo(record.MapName);
            Log("Valid Map Name= " $ record.MapName);
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
    local wMapInfo Info;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
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
    if(GameModeIdx == 0)
    {
        return int(gm.MapInfos[idx].ModeTDM);
    }
    // End:0xC0
    if(GameModeIdx == 1)
    {
        return int(gm.MapInfos[idx].ModeSD);
    }
    // End:0xEC
    if(GameModeIdx == 2)
    {
        return int(gm.MapInfos[idx].ModeFFA);
    }
    // End:0x118
    if(GameModeIdx == 3)
    {
        return int(gm.MapInfos[idx].ModeDomination);
    }
    // End:0x144
    if(GameModeIdx == 4)
    {
        return int(gm.MapInfos[idx].ModeSabotage);
    }
    // End:0x170
    if(GameModeIdx == 5)
    {
        return int(gm.MapInfos[idx].ModeBotTDM);
    }
    // End:0x19C
    if(GameModeIdx == 6)
    {
        return int(gm.MapInfos[idx].ModeBotDomination);
    }
    // End:0x1C8
    if(GameModeIdx == 7)
    {
        return int(gm.MapInfos[idx].ModeBotFFA);
    }
    // End:0x1E2
    if(GameModeIdx == 8)
    {
        // End:0x1E2
        if(MapID != 29)
        {
            return 0;
        }
    }
    // End:0x20E
    if(GameModeIdx == 11)
    {
        return int(gm.MapInfos[idx].ModeBotBeginner);
    }
    // End:0x23A
    if(GameModeIdx == 12)
    {
        return int(gm.MapInfos[idx].ModeDefence);
    }
    return 1;
    //return;    
}

function int IsTDM_RandomRespawn(int MapID, int GameModeIdx)
{
    local int idx, lp1;
    local wMapInfo Info;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
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
    if(GameModeIdx == 0)
    {
        return int(gm.MapInfos[idx].ModeTDM_RandomRespawn);
    }
    return 0;
    //return;    
}

function int IsDOMI_RandomRespawn(int MapID, int GameModeIdx)
{
    local int idx, lp1;
    local wMapInfo Info;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
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

    // End:0x96
    if(GameModeIdx == 3)
    {
        return int(gm.MapInfos[idx].ModeDOMI_RandomRespawn);
    }
    return 0;
    //return;    
}

function int GetMaxUserCount(int MapID, int GameModeIdx)
{
    local int idx, lp1;
    local wMapInfo Info;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
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

    // End:0x93
    if(GameModeIdx == 0)
    {
        return gm.MapInfos[idx].ModeTDM_Max;
    }
    // End:0xBC
    if(GameModeIdx == 1)
    {
        return gm.MapInfos[idx].ModeSD_Max;
    }
    // End:0xE6
    if(GameModeIdx == 2)
    {
        return gm.MapInfos[idx].ModeFFA_Max;
    }
    // End:0x110
    if(GameModeIdx == 3)
    {
        return gm.MapInfos[idx].ModeDomination_Max;
    }
    // End:0x13A
    if(GameModeIdx == 4)
    {
        return gm.MapInfos[idx].ModeSabotage_Max;
    }
    // End:0x164
    if(GameModeIdx == 5)
    {
        return gm.MapInfos[idx].ModeBotTDM_Max;
    }
    // End:0x18E
    if(GameModeIdx == 6)
    {
        return gm.MapInfos[idx].ModeBotDomination_Max;
    }
    // End:0x1B8
    if(GameModeIdx == 7)
    {
        return gm.MapInfos[idx].ModeBotFFA_Max;
    }
    // End:0x1E2
    if(GameModeIdx == 11)
    {
        return gm.MapInfos[idx].ModeBotBeginner_Max;
    }
    // End:0x20C
    if(GameModeIdx == 12)
    {
        return gm.MapInfos[idx].ModeDefence_Max;
    }
    return 16;
    //return;    
}

function int GetWeaponRestriction(int MapID, int weaponID)
{
    local int idx, lp1;
    local wMapInfo Info;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
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
        return int(gm.MapInfos[idx].SubMode_All);
    }
    // End:0xC0
    if(weaponID == 1)
    {
        return int(gm.MapInfos[idx].SubMode_Knife);
    }
    // End:0xEC
    if(weaponID == 4)
    {
        return int(gm.MapInfos[idx].SubMode_Rocket);
    }
    // End:0x118
    if(weaponID == 5)
    {
        return int(gm.MapInfos[idx].SubMode_Sniper);
    }
    // End:0x144
    if(weaponID == 6)
    {
        return int(gm.MapInfos[idx].SubMode_SniperX);
    }
    return 0;
    //return;    
}

function wMapInfo GetMapInfoByID(int MapID)
{
    local int idx, lp1;
    local wMapInfo Info;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].MapID == MapID)
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

    Info = new Class'Engine_Decompressed.wMapInfo';
    // End:0x8D
    if(idx == -1)
    {
        return none;        
    }
    else
    {
        gm.MapInfos[idx].CopyTo(Info);
    }
    return Info;
    //return;    
}

function wMapInfo GetMapInfo(string dfile)
{
    local int idx, lp1;
    local wMapInfo Info;

    idx = -1;
    lp1 = 0;
    J0x12:

    // End:0x6A [Loop If]
    if(lp1 < gm.MapInfos.Length)
    {
        // End:0x60
        if(gm.MapInfos[lp1].File ~= dfile)
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

    Info = new Class'Engine_Decompressed.wMapInfo';
    // End:0xD2
    if(idx == -1)
    {
        gm.MapInfos[0].CopyTo(Info);
        Info.File = dfile;
        Info.FriendlyName = dfile;        
    }
    else
    {
        gm.MapInfos[idx].CopyTo(Info);
    }
    return Info;
    //return;    
}
