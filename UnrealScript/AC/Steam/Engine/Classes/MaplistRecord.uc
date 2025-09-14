/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\MaplistRecord.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:10
 *	Functions:47
 *
 *******************************************************************************/
class MaplistRecord extends Object
    transient
    perobjectconfig;

struct MapItem
{
    var() string MapName;
    var() string OptionString;
    var() string FullURL;
    var() array<KeyValuePair> Options;
};

var bool bDirty;
var string Title;
var string GameType;
var int Active;
var array<MapItem> Maps;
var string DefaultTitle;
var string DefaultGameType;
var int DefaultActive;
var array<string> DefaultMaps;
var array<MapItem> CachedMaps;

static final operator(24) bool ==(KeyValuePair A, KeyValuePair B)
{
    return A.key ~= B.key && A.Value ~= B.Value;
}

static final operator(24) bool ==(MapItem A, MapItem B)
{
    local int i, j;

    // End:0x1d
    if(!A.MapName ~= B.MapName)
    {
        return false;
    }
    // End:0x3a
    if(A.Options.Length != B.Options.Length)
    {
        return false;
    }
    i = 0;
    J0x41:
    // End:0xc9 [While If]
    if(i < A.Options.Length)
    {
        j = 0;
        J0x5d:
        // End:0xa8 [While If]
        if(j < B.Options.Length)
        {
            // End:0x9e
            if(A.Options[i] == B.Options[j])
            {
            }
            // End:0xa8
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x5d;
            }
        }
        // End:0xbf
        if(j == B.Options.Length)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    return true;
}

static function bool CompareItems(MapItem A, MapItem B)
{
    return A == B;
}

static function bool CompareItemsSlow(MapItem A, MapItem B)
{
    local int i, j, MatchedA, MatchedB;

    // End:0x15
    if(A == B)
    {
        return true;
    }
    // End:0x32
    if(!A.MapName ~= B.MapName)
    {
        return false;
    }
    i = 0;
    J0x39:
    // End:0xc6 [While If]
    if(i < A.Options.Length)
    {
        j = 0;
        J0x55:
        // End:0xa0 [While If]
        if(j < B.Options.Length)
        {
            // End:0x96
            if(A.Options[i] == B.Options[j])
            {
            }
            // End:0xa0
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x55;
            }
        }
        // End:0xbc
        if(j < B.Options.Length)
        {
            ++ MatchedA;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
    i = 0;
    J0xcd:
    // End:0x15a [While If]
    if(i < B.Options.Length)
    {
        j = 0;
        J0xe9:
        // End:0x134 [While If]
        if(j < A.Options.Length)
        {
            // End:0x12a
            if(B.Options[i] == A.Options[j])
            {
            }
            // End:0x134
            else
            {
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0xe9;
            }
        }
        // End:0x150
        if(j < A.Options.Length)
        {
            ++ MatchedB;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xcd;
    }
    // End:0x1ae
    if(A.Options.Length > 0 && MatchedA == A.Options.Length || B.Options.Length > 0 && MatchedB == B.Options.Length)
    {
        return true;
    }
    return false;
}

event Created()
{
    CancelChanges();
}

function SetCacheMaps(array<MapItem> CacheMaps)
{
    CachedMaps = CacheMaps;
    VerifyMaps();
}

function bool SetTitle(string NewTitle)
{
    // End:0x39
    if(NewTitle != "")
    {
        bDirty = bDirty || !NewTitle ~= Title;
        Title = NewTitle;
        return true;
    }
    return false;
}

function bool SetGameType(string NewGameType)
{
    // End:0x39
    if(NewGameType != "")
    {
        bDirty = bDirty || !NewGameType ~= GameType;
        GameType = NewGameType;
        return true;
    }
    return false;
}

function int SetActiveMap(int i)
{
    // End:0x3d
    if(ValidIndex(i))
    {
        bDirty = bDirty || Active != i;
        Active = i;
        return Active;
    }
    return -1;
}

function SetMaplist(array<string> NewMaps)
{
    CreateMapItemList(NewMaps, Maps);
    bDirty = true;
}

function SetMapItemList(array<MapItem> NewMaps)
{
    Maps = NewMaps;
    bDirty = true;
}

function Save()
{
    local int i;

    // End:0x8e
    if(bDirty)
    {
        // End:0x20
        if(!ValidIndex(Active))
        {
            Active = 0;
        }
        DefaultTitle = Title;
        DefaultGameType = GameType;
        DefaultActive = Active;
        DefaultMaps.Length = Maps.Length;
        i = 0;
        J0x55:
        // End:0x8b [While If]
        if(i < Maps.Length)
        {
            DefaultMaps[i] = Maps[i].FullURL;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x55;
        }
        SaveConfig();
    }
    bDirty = false;
}

function VerifyMaps()
{
    local int i;

    i = DefaultMaps.Length - 1;
    J0x0f:
    // End:0x4b [While If]
    if(i >= 0)
    {
        // End:0x41
        if(GetCacheIndex(DefaultMaps[i]) == -1)
        {
            DefaultMaps.Remove(i, 1);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    i = Maps.Length - 1;
    J0x5a:
    // End:0xa3 [While If]
    if(i >= 0)
    {
        // End:0x99
        if(GetCacheIndex(Maps[i].FullURL) == -1)
        {
            Maps.Remove(i, 1);
            bDirty = true;
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
}

function CancelChanges()
{
    Title = DefaultTitle;
    GameType = DefaultGameType;
    Active = DefaultActive;
    CreateMapItemList(DefaultMaps, Maps);
    bDirty = false;
}

function Clear(optional bool bReset)
{
    Active = -1;
    Maps.Remove(0, Maps.Length);
    // End:0x2c
    if(bReset)
    {
        Maps = CachedMaps;
    }
    bDirty = true;
}

function bool AddOptionString(int MapIndex, string OptionString)
{
    local KeyValuePair Option;

    // End:0x20
    if(OptionString == "" || Left(OptionString, 1) != "?")
    {
        return false;
    }
    Option = CreateMapOption(OptionString);
    return AddOptionItem(MapIndex, Option);
}

function bool AddOptionItem(int MapIndex, KeyValuePair Option)
{
    // End:0x12
    if(!ValidIndex(MapIndex))
    {
        return false;
    }
    // End:0x27
    if(MapHasOption(MapIndex, Option))
    {
        return false;
    }
    bDirty = true;
    Maps[MapIndex].Options[Maps[MapIndex].Options.Length] = Option;
    return true;
}

function bool RemoveOptionString(int MapIndex, string OptionString)
{
    local KeyValuePair Pair;

    // End:0x20
    if(OptionString == "" || Left(OptionString, 1) != "?")
    {
        return false;
    }
    Pair = CreateMapOption(OptionString);
    return RemoveOptionItem(MapIndex, Pair);
}

function bool RemoveOptionItem(int MapIndex, KeyValuePair Option)
{
    local int i;

    // End:0x12
    if(!ValidIndex(MapIndex))
    {
        return false;
    }
    // End:0x29
    if(!MapHasOption(MapIndex, Option))
    {
        return false;
    }
    i = GetOptionIndex(MapIndex, Option);
    // End:0x7e
    if(ValidOptionIndex(MapIndex, i))
    {
        bDirty = true;
        Maps[MapIndex].Options.Remove(i, 1);
        RefreshMapItem(MapIndex);
        return true;
    }
    return false;
}

function RefreshMapItem(int MapIndex)
{
    local string FullMapURL;
    local int i;

    // End:0x12
    if(!ValidIndex(MapIndex))
    {
        return;
    }
    FullMapURL = Maps[MapIndex].MapName;
    i = 0;
    J0x2f:
    // End:0xc8 [While If]
    if(i < Maps[MapIndex].Options.Length)
    {
        FullMapURL $= "?" $ Maps[MapIndex].Options[i].key;
        // End:0xbe
        if(Maps[MapIndex].Options[i].Value != "")
        {
            FullMapURL $= "=" $ Maps[MapIndex].Options[i].Value;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    Maps[MapIndex].FullURL = FullMapURL;
    Maps[MapIndex].MapName = GetBaseMapName(FullMapURL);
    Maps[MapIndex].OptionString = FullMapURL;
    bDirty = true;
}

function bool AddMap(string MapName)
{
    local int CacheIndex;
    local MapItem Item;

    CacheIndex = GetCacheIndex(MapName);
    // End:0x22
    if(CacheIndex == -1)
    {
        return false;
    }
    // End:0x39
    if(!CreateMapItem(MapName, Item))
    {
        return false;
    }
    // End:0x50
    if(GetMapItemIndex(Item) != -1)
    {
        return false;
    }
    Maps[Maps.Length] = Item;
    bDirty = true;
    return true;
}

function bool InsertMap(string MapName, int Index)
{
    local MapItem Item;

    // End:0x17
    if(GetCacheIndex(MapName) == -1)
    {
        return false;
    }
    // End:0x2e
    if(!CreateMapItem(MapName, Item))
    {
        return false;
    }
    // End:0x45
    if(GetMapItemIndex(Item) != -1)
    {
        return false;
    }
    Maps.Insert(Index, 1);
    Maps[Index] = Item;
    bDirty = true;
    return true;
}

function bool RemoveMap(string MapName)
{
    local int i;
    local MapItem Item;

    // End:0x17
    if(GetCacheIndex(MapName) == -1)
    {
        return false;
    }
    // End:0x2e
    if(!CreateMapItem(MapName, Item))
    {
        return false;
    }
    i = GetMapItemIndex(Item);
    // End:0x50
    if(i == -1)
    {
        return false;
    }
    Maps.Remove(i, 1);
    bDirty = true;
    return true;
}

function bool SetMapOptions(int MapIndex, string OptionString)
{
    local string MapName;

    // End:0x12
    if(!ValidIndex(MapIndex))
    {
        return false;
    }
    MapName = GetBaseMapName(OptionString);
    // End:0x45
    if(MapName == "")
    {
        MapName = Maps[MapIndex].MapName;
    }
    MapName $= OptionString;
    // End:0x70
    if(!CreateMapItem(MapName, Maps[MapIndex]))
    {
        return false;
    }
    bDirty = true;
    return true;
}

function string GetTitle()
{
    return Title;
}

function string GetGameType()
{
    return GameType;
}

function string GetActiveMapName()
{
    return GetMapName(Active);
}

function string GetActiveMapURL()
{
    return GetMapURL(Active);
}

function string GetMapName(int i)
{
    // End:0x1f
    if(ValidIndex(i))
    {
        return Maps[i].MapName;
    }
    return "";
}

function string GetMapURL(int Index)
{
    // End:0x1f
    if(ValidIndex(Index))
    {
        return Maps[Index].FullURL;
    }
    return "";
}

function array<MapItem> GetMaps()
{
    return Maps;
}

function array<string> GetAllMapURL()
{
    local int i;
    local array<string> AR;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < Maps.Length)
    {
        AR[i] = Maps[i].FullURL;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return AR;
}

function bool IsDirty()
{
    return bDirty;
}

function int GetCacheIndex(string MapName)
{
    local int i;
    local string str;

    str = GetBaseMapName(MapName);
    i = 0;
    J0x18:
    // End:0x52 [While If]
    if(i < CachedMaps.Length)
    {
        // End:0x48
        if(str ~= CachedMaps[i].MapName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return -1;
}

function int GetActiveMapIndex()
{
    return Active;
}

function int GetMapIndex(string MapName)
{
    local MapItem Item;

    // End:0x1f
    if(CreateMapItem(MapName, Item))
    {
        return GetMapItemIndex(Item);
    }
    return -1;
}

function int GetMapItemIndex(MapItem Item)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < Maps.Length)
    {
        // End:0x36
        if(Maps[i] == Item)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int GetOptionIndex(int MapIndex, KeyValuePair Option)
{
    local int i;

    // End:0x16
    if(!ValidIndex(MapIndex))
    {
        return -1;
    }
    i = 0;
    J0x1d:
    // End:0x6c [While If]
    if(i < Maps[MapIndex].Options.Length)
    {
        // End:0x62
        if(Maps[MapIndex].Options[i] == Option)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    return -1;
}

function bool ValidMap(string MapName)
{
    return GetMapIndex(MapName) != -1;
}

function bool ValidIndex(int i)
{
    return i >= 0 && i < Maps.Length;
}

function bool ValidOptionIndex(int MapIndex, int OptionIndex)
{
    return ValidIndex(MapIndex) && OptionIndex >= 0 && OptionIndex < Maps[MapIndex].Options.Length;
}

function bool MapHasOption(int MapIndex, KeyValuePair Option)
{
    // End:0x12
    if(!ValidIndex(MapIndex))
    {
        return false;
    }
    return ItemHasOption(Maps[MapIndex], Option);
}

static function bool ItemHasOption(MapItem Item, KeyValuePair Option)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x46 [While If]
    if(i < Item.Options.Length)
    {
        // End:0x3c
        if(Item.Options[i] == Option)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

static function string GetBaseMapName(out string FullMapURL)
{
    local int i;
    local string str;

    str = FullMapURL;
    FullMapURL = "";
    i = InStr(str, "?");
    // End:0x56
    if(i != -1)
    {
        FullMapURL = Mid(str, i);
        str = Left(str, i);
    }
    // End:0x82
    if(Right(str, 4) ~= ".ut2")
    {
        str = Left(str, Len(str) - 4);
    }
    return str;
}

static function KeyValuePair CreateMapOption(out string MapOptionString)
{
    local KeyValuePair Pair;

    class'GameInfo'.static.GetKeyValue(MapOptionString, Pair.key, Pair.Value);
    return Pair;
}

static function bool CreateMapItem(string FullMapURL, out MapItem Item)
{
    local KeyValuePair Pair;
    local string str;

    // End:0x0e
    if(FullMapURL == "")
    {
        return false;
    }
    Item.FullURL = Repl(FullMapURL, ".ut2", "");
    Item.MapName = GetBaseMapName(FullMapURL);
    Item.OptionString = FullMapURL;
    Item.Options.Remove(0, Item.Options.Length);
    J0x65:
    // End:0xc6 [While If]
    if(class'GameInfo'.static.GrabOption(FullMapURL, str))
    {
        Pair = CreateMapOption(str);
        // End:0xc3
        if(!ItemHasOption(Item, Pair))
        {
            Item.Options[Item.Options.Length] = Pair;
        }
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    return Item.MapName != "";
}

static function CreateMapItemList(array<string> MapURLs, out array<MapItem> MapItems)
{
    local int i;
    local MapItem Item;

    MapItems.Remove(0, MapItems.Length);
    i = 0;
    J0x14:
    // End:0x59 [While If]
    if(i < MapURLs.Length)
    {
        // End:0x4f
        if(CreateMapItem(MapURLs[i], Item))
        {
            MapItems[MapItems.Length] = Item;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}
