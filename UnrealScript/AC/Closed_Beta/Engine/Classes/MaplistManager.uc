class MaplistManager extends MaplistManagerBase
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct GameRecordGroup
{
    var() string GameType;
    var() string ActiveMaplist;
};

struct MaplistRecordGroup
{
    var string GameType;
    var int Active;
    var int LastActive;
    var array<MapItem> AllMaps;
    var array<MaplistRecord> Records;
};

var protected array<GameRecordGroup> Games;
var protected array<string> MaplistRecordNames;
var array<GameRecord> CachedGames;
var protected array<MaplistRecordGroup> Groups;
var() localized string DefaultListName;
var() localized string InvalidGameType;
var() localized string ReallyInvalidGameType;
var() localized string DefaultListExists;
var bool bDirty;

event PreBeginPlay()
{
    local int i, idx;

    super(Actor).PreBeginPlay();
    Class'Engine.CacheManager'.static.GetGameTypeList(CachedGames);
    InitializeMaplistRecords();
    i = 0;
    J0x24:

    // End:0x7C [Loop If]
    if(i < CachedGames.Length)
    {
        idx = AddGroup(CachedGames[i].ClassName);
        // End:0x72
        if(Groups[idx].Records.Length <= 0)
        {
            CreateDefaultList(i);
        }
        i++;
        // [Loop Continue]
        goto J0x24;
    }
    InitializeActiveLists();
    // End:0x91
    if(bDirty)
    {
        Save();
    }
    //return;    
}

event Destroyed()
{
    // End:0x0F
    if(bDirty)
    {
        Save();
    }
    super(Actor).Destroyed();
    //return;    
}

protected function CreateDefaultList(int i)
{
    local string ListName;
    local array<string> Arr;

    // End:0x12
    if(!ValidCacheGameIndex(i))
    {
        return;
    }
    ListName = DefaultListName @ CachedGames[i].GameAcronym;
    // End:0x6D
    if(GetDefaultMaps(CachedGames[i].MapListClassName, Arr))
    {
        AddList(CachedGames[i].ClassName, ListName, Arr);
    }
    //return;    
}

function bool GetDefaultMaps(string MapListClassName, out array<string> Maps)
{
    local Class<MapList> List;

    // End:0x0E
    if(MapListClassName == "")
    {
        return false;
    }
    List = Class<MapList>(DynamicLoadObject(MapListClassName, Class'Core.Class', true));
    // End:0x37
    if(List == none)
    {
        return false;
    }
    Maps = List.static.StaticGetMaps();
    return true;
    //return;    
}

protected function InitializeMaplistRecords()
{
    local int i, cnt;
    local MaplistRecord Rec;

    MaplistRecordNames = GetPerObjectNames("System", "MaplistRecord");
    cnt = MaplistRecordNames.Length;
    i = 0;
    J0x36:

    // End:0x8A [Loop If]
    if(i < Groups.Length)
    {
        // End:0x80
        if(Groups[i].Records.Length > 0)
        {
            Groups[i].Records.Remove(0, Groups[i].Records.Length);
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    i = 0;
    J0x91:

    // End:0x11C [Loop If]
    if((i < cnt) && i < MaplistRecordNames.Length)
    {
        // End:0xC7
        if(MaplistRecordNames[i] == "")
        {
            // [Explicit Continue]
            goto J0x112;
        }
        Rec = CreateRecord(MaplistRecordNames[i]);
        // End:0x107
        if(!ValidGameType(Rec.GetGameType()))
        {
            Rec.ClearConfig();
            // [Explicit Continue]
            goto J0x112;
        }
        AddMaplistRecord(Rec);
        J0x112:

        i++;
        // [Loop Continue]
        goto J0x91;
    }
    //return;    
}

protected function InitializeActiveLists()
{
    local int i, RecordIndex, idx;

    i = Games.Length - 1;
    J0x0F:

    // End:0xF8 [Loop If]
    if(i >= 0)
    {
        // End:0x3F
        if(Games[i].GameType == "")
        {
            RemoveGame(i);
            // [Explicit Continue]
            goto J0xEE;
        }
        idx = GetGameIndex(Games[i].GameType);
        // End:0x6D
        if(idx == -1)
        {
            // [Explicit Continue]
            goto J0xEE;
        }
        RecordIndex = GetRecordIndex(idx, Games[i].ActiveMaplist);
        // End:0xBD
        if((RecordIndex < 0) || RecordIndex >= Groups[idx].Records.Length)
        {
            RecordIndex = 0;
        }
        SetActiveList(idx, RecordIndex);
        Groups[idx].LastActive = Groups[idx].Active;
        J0xEE:

        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
}

protected function int AddMaplistRecord(MaplistRecord Rec)
{
    local int i, j;

    // End:0x29
    if((Rec == none) || Rec.GetGameType() == "")
    {
        return -1;
    }
    i = AddGroup(Rec.GetGameType());
    j = Groups[i].Records.Length;
    Rec.SetCacheMaps(Groups[i].AllMaps);
    Groups[i].Records[j] = Rec;
    return j;
    //return;    
}

protected function int AddGroup(string GameType)
{
    local int i;

    // End:0x12
    if(GameType == "")
    {
        return -1;
    }
    i = GetGameIndex(GameType);
    // End:0x6E
    if(i == -1)
    {
        i = Groups.Length;
        Groups.Length = i + 1;
        Groups[i].GameType = GameType;
        GenerateGroupMaplist(i);
    }
    AddGameType(GameType);
    return i;
    //return;    
}

protected function int AddGameType(coerce string NewGameType)
{
    local int i;

    i = GetStoredGameIndex(NewGameType);
    // End:0x59
    if(i == -1)
    {
        i = Games.Length;
        Games.Length = i + 1;
        Games[i].GameType = NewGameType;
        bDirty = true;
    }
    return i;
    //return;    
}

protected function GenerateGroupMaplist(int GroupIndex)
{
    local int i, j;
    local array<MapRecord> Records;
    local MapItem Item;
    local KeyValuePair Option;
    local string OptionName, OptionValueString;
    local array<string> Options;

    // End:0x12
    if(!ValidGameIndex(GroupIndex))
    {
        return;
    }
    i = GetCacheGameIndex(Groups[GroupIndex].GameType);
    // End:0x3F
    if(i == -1)
    {
        return;
    }
    Class'Engine.CacheManager'.static.GetMapList(Records, CachedGames[i].MapPrefix);
    i = 0;
    J0x67:

    // End:0x19F [Loop If]
    if(i < Records.Length)
    {
        Class'Engine.MaplistRecord'.static.CreateMapItem(Records[i].MapName, Item);
        // End:0x16D
        if(Records[i].ExtraInfo != "")
        {
            // End:0x16D
            if(Divide(Records[i].ExtraInfo, "=", OptionName, OptionValueString))
            {
                // End:0xFB
                if(OptionName == "LinkSetups")
                {
                    OptionName = "LinkSetup";
                }
                Split(OptionValueString, ";", Options);
                j = 0;
                J0x111:

                // End:0x16D [Loop If]
                if(j < Options.Length)
                {
                    Option.key = OptionName;
                    Option.Value = Options[j];
                    Item.Options[Item.Options.Length] = Option;
                    j++;
                    // [Loop Continue]
                    goto J0x111;
                }
            }
        }
        Groups[GroupIndex].AllMaps[Groups[GroupIndex].AllMaps.Length] = Item;
        i++;
        // [Loop Continue]
        goto J0x67;
    }
    //return;    
}

protected function bool RemoveGame(int i)
{
    // End:0x1F
    if((i < 0) || i >= Games.Length)
    {
        return false;
    }
    Games.Remove(i, 1);
    bDirty = true;
    return true;
    //return;    
}

protected function int RemoveRecord(int GameIndex, int RecordIndex)
{
    // End:0x1B
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return -1;
    }
    Groups[GameIndex].Records[RecordIndex].ClearConfig();
    Groups[GameIndex].Records.Remove(RecordIndex, 1);
    // End:0x6B
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        RecordIndex = 0;
    }
    return RecordIndex;
    //return;    
}

protected function int GetStoredGameIndex(coerce string GameType)
{
    local int i;

    // End:0x12
    if(GameType == "")
    {
        return -1;
    }
    i = 0;
    J0x19:

    // End:0x53 [Loop If]
    if(i < Games.Length)
    {
        // End:0x49
        if(Games[i].GameType ~= GameType)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    return -1;
    //return;    
}

protected function Save()
{
    // End:0x14
    if(bDirty)
    {
        SaveConfig();
        bDirty = false;
    }
    //return;    
}

protected function MaplistRecord CreateRecord(string RecordName)
{
    // End:0x0E
    if(RecordName == "")
    {
        return none;
    }
    return new (none, Repl(RecordName, " ", Chr(27))) Class'Engine.MaplistRecord';
    //return;    
}

protected function bool IsNewGameType(string GameClassName)
{
    return (GetStoredGameIndex(GameClassName)) == -1;
    //return;    
}

protected function array<MaplistRecord> GetRecords(int GameIndex)
{
    // End:0x1F
    if(ValidGameIndex(GameIndex))
    {
        return Groups[GameIndex].Records;
    }
    //return;    
}

protected function bool ValidRecordIndex(int GameIndex, int MapListIndex)
{
    return (((ValidGameIndex(GameIndex)) && MapListIndex >= 0) && MapListIndex < Groups[GameIndex].Records.Length) && Groups[GameIndex].Records[MapListIndex] != none;
    //return;    
}

function MapChange(string NewMap)
{
    local int i, GameIndex, RecordIndex;

    GameIndex = AddGroup(string(Level.Game.Class));
    // End:0xEA
    if(ValidRecordIndex(GameIndex, Groups[GameIndex].Active))
    {
        RecordIndex = Groups[GameIndex].Active;
        i = Groups[GameIndex].Records[RecordIndex].GetMapIndex(NewMap);
        // End:0xE7
        if(i == -1)
        {
            RecordIndex = FindMaplistContaining(GameIndex, NewMap);
            // End:0xE7
            if(SetActiveList(GameIndex, RecordIndex))
            {
                i = Groups[GameIndex].Records[RecordIndex].GetMapIndex(NewMap);
            }
        }        
    }
    else
    {
        RecordIndex = FindMaplistContaining(GameIndex, NewMap);
        // End:0x13E
        if(SetActiveList(GameIndex, RecordIndex))
        {
            i = Groups[GameIndex].Records[RecordIndex].GetMapIndex(NewMap);
        }
    }
    // End:0x197
    if((i != -1) && ValidRecordIndex(GameIndex, RecordIndex))
    {
        Groups[GameIndex].Records[RecordIndex].SetActiveMap(i);
        SaveMapList(GameIndex, RecordIndex);
    }
    //return;    
}

function int AddList(string GameType, string NewName, array<string> Maps)
{
    local int i;
    local MaplistRecord NewRecord;
    local string DesiredName;

    // End:0x16
    if(!ValidGameType(GameType))
    {
        return -1;
    }
    DesiredName = NewName;
    J0x21:

    // End:0x48 [Loop If]
    if(ValidName(NewName))
    {
        NewName = DesiredName $ string(i++);
        // [Loop Continue]
        goto J0x21;
    }
    // End:0x5F
    if(Len(NewName) > 512)
    {
        return -1;
    }
    NewRecord = CreateRecord(NewName);
    // End:0x81
    if(NewRecord == none)
    {
        return -1;
    }
    NewRecord.SetGameType(GameType);
    NewRecord.SetTitle(NewName);
    i = AddMaplistRecord(NewRecord);
    // End:0xD9
    if(Maps.Length == 0)
    {
        NewRecord.Clear(true);        
    }
    else
    {
        NewRecord.SetMaplist(Maps);
    }
    NewRecord.Save();
    // End:0x10B
    if(bDirty)
    {
        Save();
    }
    return i;
    //return;    
}

function int RenameList(int GameIndex, int RecordIndex, string NewName)
{
    local MaplistRecord OldRecord;
    local bool IsActive;

    // End:0x1B
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return -1;
    }
    // End:0x2D
    if(NewName == "")
    {
        return -1;
    }
    IsActive = (GetActiveList(GameIndex)) == RecordIndex;
    OldRecord = Groups[GameIndex].Records[RecordIndex];
    RemoveRecord(GameIndex, RecordIndex);
    RecordIndex = AddList(OldRecord.GetGameType(), NewName, OldRecord.GetAllMapURL());
    // End:0x114
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        Groups[GameIndex].Records[RecordIndex].SetActiveMap(OldRecord.GetActiveMapIndex());
        // End:0x114
        if(IsActive && !SetActiveList(GameIndex, RecordIndex))
        {
            RecordIndex = GetActiveList(GameIndex);
        }
    }
    return RecordIndex;
    //return;    
}

function int RemoveList(int GameIndex, int RecordIndex)
{
    local int i, idx;

    // End:0x21
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return GetActiveList(GameIndex);
    }
    idx = RemoveRecord(GameIndex, RecordIndex);
    // End:0x75
    if(Groups[GameIndex].Records.Length == 0)
    {
        i = GetCacheGameIndex(Groups[GameIndex].GameType);
        CreateDefaultList(i);
    }
    // End:0xE7
    if(((Groups[GameIndex].Active < 0) || Groups[GameIndex].Active == RecordIndex) || Groups[GameIndex].Active >= Groups[GameIndex].Records.Length)
    {
        SetActiveList(GameIndex, 0);
        ApplyMapList(GameIndex, 0);
    }
    // End:0xF6
    if(bDirty)
    {
        Save();
    }
    return idx;
    //return;    
}

function bool SaveMapList(int GameIndex, int RecordIndex)
{
    // End:0x17
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return false;
    }
    Save();
    Groups[GameIndex].Records[RecordIndex].Save();
    return true;
    //return;    
}

function bool ClearList(int GameIndex, int RecordIndex)
{
    // End:0x17
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return false;
    }
    Groups[GameIndex].Records[RecordIndex].Clear();
    return true;
    //return;    
}

function ResetList(int GameIndex, int RecordIndex)
{
    // End:0x17
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return;
    }
    Groups[GameIndex].Records[RecordIndex].CancelChanges();
    //return;    
}

function bool SaveGame(int GameIndex)
{
    local int i, Active;

    // End:0x12
    if(!ValidGameIndex(GameIndex))
    {
        return false;
    }
    Groups[GameIndex].LastActive = Groups[GameIndex].Active;
    i = AddGameType(Groups[GameIndex].GameType);
    Active = GetActiveList(GameIndex);
    // End:0x81
    if(!ValidRecordIndex(GameIndex, Active))
    {
        SetActiveList(GameIndex, 0);
    }
    i = 0;
    J0x88:

    // End:0xBD [Loop If]
    if(i < Groups[GameIndex].Records.Length)
    {
        SaveMapList(GameIndex, i);
        i++;
        // [Loop Continue]
        goto J0x88;
    }
    Save();
    return true;
    //return;    
}

function ResetGame(int GameIndex)
{
    local int i, RecordIndex;

    // End:0x12
    if(!ValidGameIndex(GameIndex))
    {
        return;
    }
    i = 0;
    J0x19:

    // End:0x4E [Loop If]
    if(i < Groups[GameIndex].Records.Length)
    {
        ResetList(GameIndex, i);
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    i = GetStoredGameIndex(Groups[GameIndex].GameType);
    RecordIndex = GetRecordIndex(GameIndex, Games[i].ActiveMaplist);
    // End:0xA7
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        RecordIndex = 0;
    }
    SetActiveList(GameIndex, RecordIndex);
    //return;    
}

function bool ApplyMapList(int GameIndex, int RecordIndex)
{
    local Class<MapList> ListClass;
    local int i;

    // End:0x13D
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        SetActiveList(GameIndex, RecordIndex);
        SaveGame(GameIndex);
        i = GetCacheGameIndex(Groups[GameIndex].GameType);
        // End:0x88
        if(i == -1)
        {
            Warn("Error applying maplist:" @ Groups[GameIndex].GameType);
            return false;
        }
        ListClass = Class<MapList>(DynamicLoadObject(CachedGames[i].MapListClassName, Class'Core.Class'));
        // End:0x109
        if(ListClass == none)
        {
            Log((("Invalid maplist class:" @ CachedGames[i].MapListClassName) @ "for gametype") @ CachedGames[i].ClassName);
            return false;
        }
        ListClass.static.SetMaplist(GetActiveMap(GameIndex, RecordIndex), GetMapList(GameIndex, RecordIndex));
        return true;        
    }
    else
    {
        Log("Invalid maplist index");
    }
    return false;
    //return;    
}

function bool SetActiveList(int GameIndex, int NewActive)
{
    local int i;

    // End:0x17
    if(!ValidRecordIndex(GameIndex, NewActive))
    {
        return false;
    }
    i = AddGameType(Groups[GameIndex].GameType);
    Games[i].ActiveMaplist = Groups[GameIndex].Records[NewActive].GetTitle();
    Groups[GameIndex].Active = NewActive;
    bDirty = true;
    return true;
    //return;    
}

function bool AddMap(int GameIndex, int RecordIndex, string MapName)
{
    // End:0x39
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].AddMap(MapName);
    }
    return false;
    //return;    
}

function bool InsertMap(int GameIndex, int RecordIndex, string MapName, int ListIndex)
{
    // End:0x3E
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].InsertMap(MapName, ListIndex);
    }
    return false;
    //return;    
}

function bool RemoveMap(int GameIndex, int RecordIndex, string MapName)
{
    // End:0x39
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].RemoveMap(MapName);
    }
    return false;
    //return;    
}

function ShiftMap(int GameIndex, int RecordIndex, string MapName, int Count)
{
    local int i;
    local array<MapItem> Maps;

    // End:0x17
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return;
    }
    // End:0x24
    if(Count == 0)
    {
        return;
    }
    i = Groups[GameIndex].Records[RecordIndex].GetMapIndex(MapName);
    // End:0x60
    if(i == -1)
    {
        return;
    }
    Maps = Groups[GameIndex].Records[RecordIndex].GetMaps();
    // End:0xF6
    if(Count < 0)
    {
        // End:0xB0
        if((i + Count) < 0)
        {
            Count = -i;
        }
        Maps.Insert(i + Count, 1);
        Maps[i + Count] = Maps[i + 1];
        Maps.Remove(i + 1, 1);        
    }
    else
    {
        // End:0x126
        if(((i + Count) + 1) >= Maps.Length)
        {
            Count = (Maps.Length - i) - 1;
        }
        Maps.Insert((i + Count) + 1, 1);
        Maps[(i + Count) + 1] = Maps[i];
        Maps.Remove(i, 1);
    }
    Groups[GameIndex].Records[RecordIndex].SetMapItemList(Maps);
    //return;    
}

function int SetActiveMap(int GameIndex, int RecordIndex, int MapIndex)
{
    // End:0x1B
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return -1;
    }
    return Groups[GameIndex].Records[RecordIndex].SetActiveMap(MapIndex);
    //return;    
}

function int GetGameIndex(coerce string GameType)
{
    local int i;

    // End:0x12
    if(GameType == "")
    {
        return -1;
    }
    i = 0;
    J0x19:

    // End:0x53 [Loop If]
    if(i < Groups.Length)
    {
        // End:0x49
        if(Groups[i].GameType ~= GameType)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    return -1;
    //return;    
}

function int GetCacheGameIndex(string GameType)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < CachedGames.Length)
    {
        // End:0x37
        if(CachedGames[i].ClassName ~= GameType)
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

function array<string> GetMapListNames(int GameIndex)
{
    local int i, idx;
    local array<MaplistRecord> Records;
    local array<string> Arr;

    // End:0xB2
    if(ValidGameIndex(GameIndex))
    {
        Records = GetRecords(GameIndex);
        // End:0x63
        if(Records.Length == 0)
        {
            idx = GetCacheGameIndex(Groups[GameIndex].GameType);
            CreateDefaultList(idx);
            Records = GetRecords(GameIndex);
        }
        Arr.Length = Records.Length;
        i = 0;
        J0x77:

        // End:0xB2 [Loop If]
        if(i < Records.Length)
        {
            Arr[i] = Records[i].GetTitle();
            i++;
            // [Loop Continue]
            goto J0x77;
        }
    }
    return Arr;
    //return;    
}

function array<string> GetCurrentMapRotation()
{
    local int GameIndex, RecordIndex, CurrentMap, i;
    local array<string> AR;

    // End:0x1A
    if(Level.Game == none)
    {
        return AR;
    }
    GameIndex = GetGameIndex(string(Level.Game.Class));
    RecordIndex = GetActiveList(GameIndex);
    CurrentMap = GetActiveMap(GameIndex, RecordIndex);
    AR = GetMapList(GameIndex, RecordIndex);
    J0x7C:

    // End:0xA8 [Loop If]
    if(i < CurrentMap)
    {
        AR[AR.Length] = AR[i++];
        // [Loop Continue]
        goto J0x7C;
    }
    // End:0xCD
    if((i > 0) && AR.Length > 0)
    {
        AR.Remove(0, i);
    }
    return AR;
    //return;    
}

function string GetActiveMapName(int GameIndex, int RecordIndex)
{
    // End:0x34
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].GetActiveMapName();
    }
    //return;    
}

function string GetMapTitle(int GameIndex, int RecordIndex, int MapIndex)
{
    // End:0x39
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].GetMapName(MapIndex);
    }
    //return;    
}

function string GetMapURL(int GameIndex, int RecordIndex, int MapIndex)
{
    // End:0x39
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].GetMapURL(MapIndex);
    }
    //return;    
}

function array<string> GetMapList(int GameIndex, int RecordIndex)
{
    local array<string> Maps;

    // End:0x39
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        Maps = Groups[GameIndex].Records[RecordIndex].GetAllMapURL();
    }
    return Maps;
    //return;    
}

function bool GetAvailableMaps(int GameIndex, out array<MapItem> AR)
{
    // End:0x12
    if(!ValidGameIndex(GameIndex))
    {
        return false;
    }
    AR = Groups[GameIndex].AllMaps;
    return true;
    //return;    
}

function array<string> GetCacheMapList(string Acronym)
{
    local int i, j;
    local array<MapRecord> TempRecords;
    local array<string> Arr;

    Class'Engine.CacheManager'.static.GetMapList(TempRecords, Acronym);
    Arr.Length = TempRecords.Length;
    i = TempRecords.Length - 1;
    J0x32:

    // End:0x65 [Loop If]
    if(i >= 0)
    {
        Arr[j++] = TempRecords[i].MapName;
        i--;
        // [Loop Continue]
        goto J0x32;
    }
    return Arr;
    //return;    
}

function int FindMaplistContaining(int GameIndex, string MapName)
{
    local int i, idx;

    // End:0x7A
    if(ValidGameIndex(GameIndex))
    {
        i = 0;
        J0x15:

        // End:0x7A [Loop If]
        if(i < Groups[GameIndex].Records.Length)
        {
            idx = Groups[GameIndex].Records[i].GetMapIndex(MapName);
            // End:0x70
            if(idx != -1)
            {
                return i;
            }
            i++;
            // [Loop Continue]
            goto J0x15;
        }
    }
    return -1;
    //return;    
}

function int GetMapIndex(int GameIndex, int RecordIndex, string MapName)
{
    // End:0x39
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].GetMapIndex(MapName);
    }
    return -1;
    //return;    
}

function int GetRecordIndex(int GameIndex, string MapListName)
{
    local int i;
    local array<MaplistRecord> Records;

    // End:0x90
    if(ValidGameIndex(GameIndex))
    {
        // End:0x26
        if(MapListName == "")
        {
            return GetActiveList(GameIndex);
        }
        Records = GetRecords(GameIndex);
        i = 0;
        J0x3E:

        // End:0x90 [Loop If]
        if(i < Records.Length)
        {
            // End:0x86
            if((Records[i] != none) && Records[i].GetTitle() ~= MapListName)
            {
                return i;
            }
            i++;
            // [Loop Continue]
            goto J0x3E;
        }
    }
    return -1;
    //return;    
}

function string GetMapListTitle(int GameIndex, int RecordIndex)
{
    // End:0x34
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].GetTitle();
    }
    return "";
    //return;    
}

function int GetActiveList(int GameIndex)
{
    // End:0x1F
    if(ValidGameIndex(GameIndex))
    {
        return Groups[GameIndex].Active;
    }
    return -1;
    //return;    
}

function int GetActiveMap(int GameIndex, int RecordIndex)
{
    // End:0x1B
    if(!ValidRecordIndex(GameIndex, RecordIndex))
    {
        return -1;
    }
    return Groups[GameIndex].Records[RecordIndex].GetActiveMapIndex();
    //return;    
}

function bool ValidCacheGameIndex(int i)
{
    return (i >= 0) && i < CachedGames.Length;
    //return;    
}

function bool ValidGameIndex(int i)
{
    return (i >= 0) && i < Groups.Length;
    //return;    
}

function bool ValidGameType(string GameType)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < CachedGames.Length)
    {
        // End:0x33
        if(GameType ~= CachedGames[i].ClassName)
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

function bool ValidName(string S)
{
    local int i, j;

    // End:0x0E
    if(S == "")
    {
        return false;
    }
    i = 0;
    J0x15:

    // End:0xA5 [Loop If]
    if(i < Groups.Length)
    {
        j = 0;
        J0x2C:

        // End:0x9B [Loop If]
        if(j < Groups[i].Records.Length)
        {
            // End:0x91
            if((Groups[i].Records[j] != none) && Groups[i].Records[j].GetTitle() ~= S)
            {
                return true;
            }
            j++;
            // [Loop Continue]
            goto J0x2C;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return false;
    //return;    
}

function bool MaplistDirty(int GameIndex, int RecordIndex)
{
    // End:0x3F
    if(ValidRecordIndex(GameIndex, RecordIndex))
    {
        return Groups[GameIndex].Records[RecordIndex].IsDirty() || bDirty;
    }
    return bDirty;
    //return;    
}

defaultproperties
{
    DefaultListName="Default"
    InvalidGameType="Cannot open. This normally occurs when the .int file exists but the .u file is missing."
    ReallyInvalidGameType="Unable to call the requested %gametype% game mode."
    DefaultListExists="That game mode is already on the list."
}