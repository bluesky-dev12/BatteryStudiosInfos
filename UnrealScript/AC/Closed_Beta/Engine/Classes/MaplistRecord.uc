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

var protected bool bDirty;
var protected string Title;
var protected string GameType;
var protected int Active;
var protected array<MapItem> Maps;
var protected string DefaultTitle;
var protected string DefaultGameType;
var protected int DefaultActive;
var protected array<string> DefaultMaps;
var protected array<MapItem> CachedMaps;

static final operator(24) bool ==(KeyValuePair A, KeyValuePair B)
{
    return (A.key ~= B.key) && A.Value ~= B.Value;
    //return;    
}

static final operator(24) bool ==(MapItem A, MapItem B)
{
    local int i, j;

    // End:0x1D
    if(!A.MapName ~= B.MapName)
    {
        return false;
    }
    // End:0x3A
    if(A.Options.Length != B.Options.Length)
    {
        return false;
    }
    i = 0;
    J0x41:

    // End:0xC9 [Loop If]
    if(i < A.Options.Length)
    {
        j = 0;
        J0x5D:

        // End:0xA8 [Loop If]
        if(j < B.Options.Length)
        {
            // End:0x9E
            if(A.Options[i] == B.Options[j])
            {
                // [Explicit Break]
                goto J0xA8;
            }
            j++;
            // [Loop Continue]
            goto J0x5D;
        }
        J0xA8:

        // End:0xBF
        if(j == B.Options.Length)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

static function bool CompareItems(MapItem A, MapItem B)
{
    return A == B;
    //return;    
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

    // End:0xC6 [Loop If]
    if(i < A.Options.Length)
    {
        j = 0;
        J0x55:

        // End:0xA0 [Loop If]
        if(j < B.Options.Length)
        {
            // End:0x96
            if(A.Options[i] == B.Options[j])
            {
                // [Explicit Break]
                goto J0xA0;
            }
            j++;
            // [Loop Continue]
            goto J0x55;
        }
        J0xA0:

        // End:0xBC
        if(j < B.Options.Length)
        {
            MatchedA++;
        }
        i++;
        // [Loop Continue]
        goto J0x39;
    }
    i = 0;
    J0xCD:

    // End:0x15A [Loop If]
    if(i < B.Options.Length)
    {
        j = 0;
        J0xE9:

        // End:0x134 [Loop If]
        if(j < A.Options.Length)
        {
            // End:0x12A
            if(B.Options[i] == A.Options[j])
            {
                // [Explicit Break]
                goto J0x134;
            }
            j++;
            // [Loop Continue]
            goto J0xE9;
        }
        J0x134:

        // End:0x150
        if(j < A.Options.Length)
        {
            MatchedB++;
        }
        i++;
        // [Loop Continue]
        goto J0xCD;
    }
    // End:0x1AE
    if(((A.Options.Length > 0) && MatchedA == A.Options.Length) || (B.Options.Length > 0) && MatchedB == B.Options.Length)
    {
        return true;
    }
    return false;
    //return;    
}

event Created()
{
    CancelChanges();
    //return;    
}

function SetCacheMaps(array<MapItem> CacheMaps)
{
    CachedMaps = CacheMaps;
    VerifyMaps();
    //return;    
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
    //return;    
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
    //return;    
}

function int SetActiveMap(int i)
{
    // End:0x3D
    if(ValidIndex(i))
    {
        bDirty = bDirty || Active != i;
        Active = i;
        return Active;
    }
    return -1;
    //return;    
}

function SetMaplist(array<string> NewMaps)
{
    CreateMapItemList(NewMaps, Maps);
    bDirty = true;
    //return;    
}

function SetMapItemList(array<MapItem> NewMaps)
{
    Maps = NewMaps;
    bDirty = true;
    //return;    
}

function Save()
{
    local int i;

    // End:0x8E
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

        // End:0x8B [Loop If]
        if(i < Maps.Length)
        {
            DefaultMaps[i] = Maps[i].FullURL;
            i++;
            // [Loop Continue]
            goto J0x55;
        }
        SaveConfig();
    }
    bDirty = false;
    //return;    
}

function VerifyMaps()
{
    local int i;

    i = DefaultMaps.Length - 1;
    J0x0F:

    // End:0x4B [Loop If]
    if(i >= 0)
    {
        // End:0x41
        if((GetCacheIndex(DefaultMaps[i])) == -1)
        {
            DefaultMaps.Remove(i, 1);
        }
        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    i = Maps.Length - 1;
    J0x5A:

    // End:0xA3 [Loop If]
    if(i >= 0)
    {
        // End:0x99
        if((GetCacheIndex(Maps[i].FullURL)) == -1)
        {
            Maps.Remove(i, 1);
            bDirty = true;
        }
        i--;
        // [Loop Continue]
        goto J0x5A;
    }
    //return;    
}

function CancelChanges()
{
    Title = DefaultTitle;
    GameType = DefaultGameType;
    Active = DefaultActive;
    CreateMapItemList(DefaultMaps, Maps);
    bDirty = false;
    //return;    
}

function Clear(optional bool bReset)
{
    Active = -1;
    Maps.Remove(0, Maps.Length);
    // End:0x2C
    if(bReset)
    {
        Maps = CachedMaps;
    }
    bDirty = true;
    //return;    
}

function bool AddOptionString(int MapIndex, string OptionString)
{
    local KeyValuePair Option;

    // End:0x20
    if((OptionString == "") || Left(OptionString, 1) != "?")
    {
        return false;
    }
    Option = CreateMapOption(OptionString);
    return AddOptionItem(MapIndex, Option);
    //return;    
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
    //return;    
}

function bool RemoveOptionString(int MapIndex, string OptionString)
{
    local KeyValuePair Pair;

    // End:0x20
    if((OptionString == "") || Left(OptionString, 1) != "?")
    {
        return false;
    }
    Pair = CreateMapOption(OptionString);
    return RemoveOptionItem(MapIndex, Pair);
    //return;    
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
    // End:0x7E
    if(ValidOptionIndex(MapIndex, i))
    {
        bDirty = true;
        Maps[MapIndex].Options.Remove(i, 1);
        RefreshMapItem(MapIndex);
        return true;
    }
    return false;
    //return;    
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
    J0x2F:

    // End:0xC8 [Loop If]
    if(i < Maps[MapIndex].Options.Length)
    {
        FullMapURL $= ("?" $ Maps[MapIndex].Options[i].key);
        // End:0xBE
        if(Maps[MapIndex].Options[i].Value != "")
        {
            FullMapURL $= ("=" $ Maps[MapIndex].Options[i].Value);
        }
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    Maps[MapIndex].FullURL = FullMapURL;
    Maps[MapIndex].MapName = GetBaseMapName(FullMapURL);
    Maps[MapIndex].OptionString = FullMapURL;
    bDirty = true;
    //return;    
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
    if((GetMapItemIndex(Item)) != -1)
    {
        return false;
    }
    Maps[Maps.Length] = Item;
    bDirty = true;
    return true;
    //return;    
}

function bool InsertMap(string MapName, int Index)
{
    local MapItem Item;

    // End:0x17
    if((GetCacheIndex(MapName)) == -1)
    {
        return false;
    }
    // End:0x2E
    if(!CreateMapItem(MapName, Item))
    {
        return false;
    }
    // End:0x45
    if((GetMapItemIndex(Item)) != -1)
    {
        return false;
    }
    Maps.Insert(Index, 1);
    Maps[Index] = Item;
    bDirty = true;
    return true;
    //return;    
}

function bool RemoveMap(string MapName)
{
    local int i;
    local MapItem Item;

    // End:0x17
    if((GetCacheIndex(MapName)) == -1)
    {
        return false;
    }
    // End:0x2E
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
    //return;    
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
    //return;    
}

function string GetTitle()
{
    return Title;
    //return;    
}

function string GetGameType()
{
    return GameType;
    //return;    
}

function string GetActiveMapName()
{
    return GetMapName(Active);
    //return;    
}

function string GetActiveMapURL()
{
    return GetMapURL(Active);
    //return;    
}

function string GetMapName(int i)
{
    // End:0x1F
    if(ValidIndex(i))
    {
        return Maps[i].MapName;
    }
    return "";
    //return;    
}

function string GetMapURL(int Index)
{
    // End:0x1F
    if(ValidIndex(Index))
    {
        return Maps[Index].FullURL;
    }
    return "";
    //return;    
}

function array<MapItem> GetMaps()
{
    return Maps;
    //return;    
}

function array<string> GetAllMapURL()
{
    local int i;
    local array<string> AR;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < Maps.Length)
    {
        AR[i] = Maps[i].FullURL;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return AR;
    //return;    
}

function bool IsDirty()
{
    return bDirty;
    //return;    
}

function int GetCacheIndex(string MapName)
{
    local int i;
    local string str;

    str = GetBaseMapName(MapName);
    i = 0;
    J0x18:

    // End:0x52 [Loop If]
    if(i < CachedMaps.Length)
    {
        // End:0x48
        if(str ~= CachedMaps[i].MapName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return -1;
    //return;    
}

function int GetActiveMapIndex()
{
    return Active;
    //return;    
}

function int GetMapIndex(string MapName)
{
    local MapItem Item;

    // End:0x1F
    if(CreateMapItem(MapName, Item))
    {
        return GetMapItemIndex(Item);
    }
    return -1;
    //return;    
}

function int GetMapItemIndex(MapItem Item)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x36
        if(Maps[i] == Item)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
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
    J0x1D:

    // End:0x6C [Loop If]
    if(i < Maps[MapIndex].Options.Length)
    {
        // End:0x62
        if(Maps[MapIndex].Options[i] == Option)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    return -1;
    //return;    
}

function bool ValidMap(string MapName)
{
    return (GetMapIndex(MapName)) != -1;
    //return;    
}

function bool ValidIndex(int i)
{
    return (i >= 0) && i < Maps.Length;
    //return;    
}

function bool ValidOptionIndex(int MapIndex, int OptionIndex)
{
    return ((ValidIndex(MapIndex)) && OptionIndex >= 0) && OptionIndex < Maps[MapIndex].Options.Length;
    //return;    
}

function bool MapHasOption(int MapIndex, KeyValuePair Option)
{
    // End:0x12
    if(!ValidIndex(MapIndex))
    {
        return false;
    }
    return ItemHasOption(Maps[MapIndex], Option);
    //return;    
}

static function bool ItemHasOption(MapItem Item, KeyValuePair Option)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x46 [Loop If]
    if(i < Item.Options.Length)
    {
        // End:0x3C
        if(Item.Options[i] == Option)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
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
    //return;    
}

static function KeyValuePair CreateMapOption(out string MapOptionString)
{
    local KeyValuePair Pair;

    Class'Engine.GameInfo'.static.GetKeyValue(MapOptionString, Pair.key, Pair.Value);
    return Pair;
    //return;    
}

static function bool CreateMapItem(string FullMapURL, out MapItem Item)
{
    local KeyValuePair Pair;
    local string str;

    // End:0x0E
    if(FullMapURL == "")
    {
        return false;
    }
    Item.FullURL = Repl(FullMapURL, ".ut2", "");
    Item.MapName = GetBaseMapName(FullMapURL);
    Item.OptionString = FullMapURL;
    Item.Options.Remove(0, Item.Options.Length);
    J0x65:

    // End:0xC6 [Loop If]
    if(Class'Engine.GameInfo'.static.GrabOption(FullMapURL, str))
    {
        Pair = CreateMapOption(str);
        // End:0xC3
        if(!ItemHasOption(Item, Pair))
        {
            Item.Options[Item.Options.Length] = Pair;
        }
        // [Loop Continue]
        goto J0x65;
    }
    return Item.MapName != "";
    //return;    
}

static function CreateMapItemList(array<string> MapURLs, out array<MapItem> MapItems)
{
    local int i;
    local MapItem Item;

    MapItems.Remove(0, MapItems.Length);
    i = 0;
    J0x14:

    // End:0x59 [Loop If]
    if(i < MapURLs.Length)
    {
        // End:0x4F
        if(CreateMapItem(MapURLs[i], Item))
        {
            MapItems[MapItems.Length] = Item;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}
