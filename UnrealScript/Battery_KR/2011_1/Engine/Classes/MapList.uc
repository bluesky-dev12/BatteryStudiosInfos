class MapList extends Info
    abstract
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<MapRecord> CachedMaps;
var(Maps) protected array<string> Maps;
var protected int MapNum;

event PreBeginPlay()
{
    super(Actor).PreBeginPlay();
    Class'Engine_Decompressed.CacheManager'.static.GetMapList(CachedMaps);
    // End:0x4A
    if(HasInvalidMaps())
    {
        MapNum = 0;
        SaveConfig();
        Log("MapList had invalid entries!");
    }
    //return;    
}

event PostBeginPlay()
{
    // End:0x30
    if(Maps.Length == 0)
    {
        Warn(string(Name) @ "has no maps configured!");
    }
    super(Actor).PostBeginPlay();
    //return;    
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
    else
    {
        i = 0;
        J0x2B:

        // End:0x5D [Loop If]
        if(i < Maps.Length)
        {
            // End:0x53
            if(CurrentMap ~= Maps[i])
            {
                // [Explicit Break]
                goto J0x5D;
            }
            i++;
            // [Loop Continue]
            goto J0x2B;
        }
        J0x5D:

        // End:0x247
        if(i == Maps.Length)
        {
            Class'Engine_Decompressed.MaplistRecord'.static.CreateMapItem(CurrentMap, Item);
            Class'Engine_Decompressed.MaplistRecord'.static.CreateMapItemList(Maps, ArItem);
            i = 0;
            J0xA6:

            // End:0xE5 [Loop If]
            if(i < ArItem.Length)
            {
                // End:0xDB
                if(Class'Engine_Decompressed.MaplistRecord'.static.CompareItems(Item, ArItem[i]))
                {
                    // [Explicit Break]
                    goto J0xE5;
                }
                i++;
                // [Loop Continue]
                goto J0xA6;
            }
            J0xE5:

            // End:0x247
            if(i == ArItem.Length)
            {
                i = 0;
                J0xFC:

                // End:0x13B [Loop If]
                if(i < ArItem.Length)
                {
                    // End:0x131
                    if(Class'Engine_Decompressed.MaplistRecord'.static.CompareItemsSlow(Item, ArItem[i]))
                    {
                        // [Explicit Break]
                        goto J0x13B;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0xFC;
                }
                J0x13B:

                // End:0x247
                if(i == ArItem.Length)
                {
                    i = 0;
                    J0x152:

                    // End:0x18E [Loop If]
                    if(i < ArItem.Length)
                    {
                        // End:0x184
                        if(Item.MapName ~= ArItem[i].MapName)
                        {
                            // [Explicit Break]
                            goto J0x18E;
                        }
                        i++;
                        // [Loop Continue]
                        goto J0x152;
                    }
                    J0x18E:

                    // End:0x247
                    if(i == ArItem.Length)
                    {
                        Log(("No maplist entries found matching the current command line (mapname search).  Performing blind switch to index " $ string(MapNum + 1)) @ "of current maplist", 'MaplistManager');
                        return UpdateMapNum(MapNum + 1);
                    }
                }
            }
        }
    }
    return UpdateMapNum(i + 1);
    //return;    
}

function string UpdateMapNum(int NewMapNum)
{
    // End:0x4E
    if(Maps.Length == 0)
    {
        Warn("No maps configured for game maplist! Unable to change maps!");
        return "";
    }
    J0x4E:

    // End:0xCF [Loop If]
    if(true)
    {
        // End:0x76
        if((NewMapNum < 0) || NewMapNum >= Maps.Length)
        {
            NewMapNum = 0;
        }
        // End:0xA7
        if(((NewMapNum == MapNum) || MapNum < 0) || MapNum >= Maps.Length)
        {
            // [Explicit Break]
            goto J0xCF;
        }
        // End:0xC5
        if((FindCacheIndex(Maps[NewMapNum])) != -1)
        {
            // [Explicit Break]
            goto J0xCF;
        }
        NewMapNum++;
        // [Loop Continue]
        goto J0x4E;
    }
    J0xCF:

    MapNum = NewMapNum;
    // End:0x123
    if(Level.Game.MaplistHandler != none)
    {
        Level.Game.MaplistHandler.MapChange(Maps[MapNum]);
    }
    SaveConfig();
    return Maps[MapNum];
    //return;    
}

function int FindCacheIndex(string MapName)
{
    local int i;
    local string tmp;

    tmp = Class'Engine_Decompressed.MaplistRecord'.static.GetBaseMapName(MapName);
    i = 0;
    J0x21:

    // End:0x5B [Loop If]
    if(i < CachedMaps.Length)
    {
        // End:0x51
        if(CachedMaps[i].MapName ~= tmp)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x21;
    }
    return -1;
    //return;    
}

function string GetMap(int MapIndex)
{
    // End:0x20
    if((MapIndex < 0) || MapIndex >= Maps.Length)
    {
        return "";
    }
    return Maps[MapIndex];
    //return;    
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
    //return;    
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
    //return;    
}

function bool HasInvalidMaps(optional bool bReadOnly)
{
    local int i;
    local bool bInvalid;

    i = Maps.Length - 1;
    J0x0F:

    // End:0x92 [Loop If]
    if(i >= 0)
    {
        // End:0x4E
        if(Maps[i] == "")
        {
            bInvalid = true;
            // End:0x4B
            if(!bReadOnly)
            {
                Maps.Remove(i, 1);
            }
            // [Explicit Continue]
            goto J0x88;
        }
        // End:0x88
        if((FindCacheIndex(Maps[i])) == -1)
        {
            bInvalid = true;
            // End:0x88
            if(!bReadOnly)
            {
                Maps.Remove(i, 1);
            }
        }
        J0x88:

        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    return bInvalid;
    //return;    
}

static function bool StaticHasInvalidMaps(optional bool bReadOnly)
{
    local int i, j;
    local bool bInvalid;
    local array<MapRecord> Recs;
    local string URL, MapName;

    Class'Engine_Decompressed.CacheManager'.static.GetMapList(Recs);
    i = default.Maps.Length - 1;
    J0x20:

    // End:0x101 [Loop If]
    if(i >= 0)
    {
        // End:0x5F
        if(default.Maps[i] == "")
        {
            bInvalid = true;
            // End:0x5C
            if(!bReadOnly)
            {
                default.Maps.Remove(i, 1);
            }
            // [Explicit Continue]
            goto J0xF7;
        }
        URL = default.Maps[i];
        MapName = Class'Engine_Decompressed.MaplistRecord'.static.GetBaseMapName(URL);
        j = 0;
        J0x91:

        // End:0xC8 [Loop If]
        if(j < Recs.Length)
        {
            // End:0xBE
            if(Recs[j].MapName ~= MapName)
            {
                // [Explicit Break]
                goto J0xC8;
            }
            j++;
            // [Loop Continue]
            goto J0x91;
        }
        J0xC8:

        // End:0xF7
        if(j == Recs.Length)
        {
            bInvalid = true;
            // End:0xF7
            if(!bReadOnly)
            {
                default.Maps.Remove(i, 1);
            }
        }
        J0xF7:

        i--;
        // [Loop Continue]
        goto J0x20;
    }
    return bInvalid;
    //return;    
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
    //return;    
}
