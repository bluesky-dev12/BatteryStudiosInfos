/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MapList.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:11
 *
 *******************************************************************************/
class MapList extends Info
    dependson(CacheManager)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    abstract
    notplaceable;

var array<MapRecord> CachedMaps;
var(Maps) array<string> Maps;
var int MapNum;

event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    class'CacheManager'.static.GetMapList(CachedMaps);
    // End:0x4a
    if(HasInvalidMaps())
    {
        MapNum = 0;
        SaveConfig();
        Log("MapList had invalid entries!");
    }
}

event PostBeginPlay()
{
    // End:0x30
    if(Maps.Length == 0)
    {
        Warn(string(Name) @ "has no maps configured!");
    }
    super(Actor).PostBeginPlay();
}

function string GetNextMap()
{
    local MapItem Item;
    local array<MapItem> ArItem;
    local string CurrentMap;
    local int i;

    CurrentMap = GetURLMap(true);
    // End:0x24
    if(CurrentMap == "")
    {
        i = MapNum;
    }
    // End:0x247
    else
    {
        i = 0;
        J0x2b:
        // End:0x5d [While If]
        if(i < Maps.Length)
        {
            // End:0x53
            if(CurrentMap ~= Maps[i])
            {
            }
            // End:0x5d
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x2b;
            }
        }
        // End:0x247
        if(i == Maps.Length)
        {
            class'MaplistRecord'.static.CreateMapItem(CurrentMap, Item);
            class'MaplistRecord'.static.CreateMapItemList(Maps, ArItem);
            i = 0;
            J0xa6:
            // End:0xe5 [While If]
            if(i < ArItem.Length)
            {
                // End:0xdb
                if(class'MaplistRecord'.static.CompareItems(Item, ArItem[i]))
                {
                }
                // End:0xe5
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xa6;
                }
            }
            // End:0x247
            if(i == ArItem.Length)
            {
                i = 0;
                J0xfc:
                // End:0x13b [While If]
                if(i < ArItem.Length)
                {
                    // End:0x131
                    if(class'MaplistRecord'.static.CompareItemsSlow(Item, ArItem[i]))
                    {
                    }
                    // End:0x13b
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0xfc;
                    }
                }
                // End:0x247
                if(i == ArItem.Length)
                {
                    i = 0;
                    J0x152:
                    // End:0x18e [While If]
                    if(i < ArItem.Length)
                    {
                        // End:0x184
                        if(Item.MapName ~= ArItem[i].MapName)
                        {
                        }
                        // End:0x18e
                        else
                        {
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x152;
                        }
                    }
                    // End:0x247
                    if(i == ArItem.Length)
                    {
                        Log("No maplist entries found matching the current command line (mapname search).  Performing blind switch to index " $ string(MapNum + 1) @ "of current maplist", 'MaplistManager');
                        return UpdateMapNum(MapNum + 1);
                    }
                }
            }
        }
    }
    return UpdateMapNum(i + 1);
}

function string UpdateMapNum(int NewMapNum)
{
    // End:0x4e
    if(Maps.Length == 0)
    {
        Warn("No maps configured for game maplist! Unable to change maps!");
        return "";
    }
    J0x4e:
    // End:0xcf [While If]
    if(true)
    {
        // End:0x76
        if(NewMapNum < 0 || NewMapNum >= Maps.Length)
        {
            NewMapNum = 0;
        }
        // End:0xa7
        if(NewMapNum == MapNum || MapNum < 0 || MapNum >= Maps.Length)
        {
        }
        // End:0xcf
        else
        {
            // End:0xc5
            if(FindCacheIndex(Maps[NewMapNum]) != -1)
            {
            }
            // End:0xcf
            else
            {
                ++ NewMapNum;
                // This is an implied JumpToken; Continue!
                goto J0x4e;
            }
        }
    }
    MapNum = NewMapNum;
    // End:0x123
    if(Level.Game.MaplistHandler != none)
    {
        Level.Game.MaplistHandler.MapChange(Maps[MapNum]);
    }
    SaveConfig();
    return Maps[MapNum];
}

function int FindCacheIndex(string MapName)
{
    local int i;
    local string tmp;

    tmp = class'MaplistRecord'.static.GetBaseMapName(MapName);
    i = 0;
    J0x21:
    // End:0x5b [While If]
    if(i < CachedMaps.Length)
    {
        // End:0x51
        if(CachedMaps[i].MapName ~= tmp)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
    return -1;
}

function string GetMap(int MapIndex)
{
    // End:0x20
    if(MapIndex < 0 || MapIndex >= Maps.Length)
    {
        return "";
    }
    return Maps[MapIndex];
}

function array<string> GetMaps()
{
    // End:0x13
    if(HasInvalidMaps())
    {
        MapNum = 0;
        SaveConfig();
    }
    return Maps;
}

static function array<string> StaticGetMaps()
{
    // End:0x16
    if(StaticHasInvalidMaps())
    {
        default.MapNum = 0;
        StaticSaveConfig();
    }
    return default.Maps;
}

function bool HasInvalidMaps(optional bool bReadOnly)
{
    local int i;
    local bool bInvalid;

    i = Maps.Length - 1;
    J0x0f:
    // End:0x92 [While If]
    if(i >= 0)
    {
        // End:0x4e
        if(Maps[i] == "")
        {
            bInvalid = true;
            // End:0x4b
            if(!bReadOnly)
            {
                Maps.Remove(i, 1);
            }
        }
        // End:0x88
        else
        {
            // End:0x88
            if(FindCacheIndex(Maps[i]) == -1)
            {
                bInvalid = true;
                // End:0x88
                if(!bReadOnly)
                {
                    Maps.Remove(i, 1);
                }
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    return bInvalid;
}

static function bool StaticHasInvalidMaps(optional bool bReadOnly)
{
    local int i, j;
    local bool bInvalid;
    local array<MapRecord> Recs;
    local string URL, MapName;

    class'CacheManager'.static.GetMapList(Recs);
    i = default.Maps.Length - 1;
    J0x20:
    // End:0x101 [While If]
    if(i >= 0)
    {
        // End:0x5f
        if(default.Maps[i] == "")
        {
            bInvalid = true;
            // End:0x5c
            if(!bReadOnly)
            {
                default.Maps.Remove(i, 1);
            }
        }
        // End:0xf7
        else
        {
            URL = default.Maps[i];
            MapName = class'MaplistRecord'.static.GetBaseMapName(URL);
            j = 0;
            J0x91:
            // End:0xc8 [While If]
            if(j < Recs.Length)
            {
                // End:0xbe
                if(Recs[j].MapName ~= MapName)
                {
                }
                // End:0xc8
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x91;
                }
            }
            // End:0xf7
            if(j == Recs.Length)
            {
                bInvalid = true;
                // End:0xf7
                if(!bReadOnly)
                {
                    default.Maps.Remove(i, 1);
                }
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
    return bInvalid;
}

static function bool SetMaplist(int CurrentNum, array<string> NewMaps)
{
    // End:0x17
    if(CurrentNum >= NewMaps.Length)
    {
        CurrentNum = 0;
    }
    default.MapNum = CurrentNum;
    default.Maps = NewMaps;
    StaticSaveConfig();
    return true;
}
