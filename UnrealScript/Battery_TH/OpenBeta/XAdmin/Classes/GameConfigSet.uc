class GameConfigSet extends Object;

var LevelInfo Level;
var protected Class<GameInfo> GameClass;
var protected int GameIndex;
var protected PlayInfo Settings;
var int CurrentMapList;
var protected array<int> UsedMutators;
var protected array<int> UsedMaps;
var protected string AllMapsPrefix;
var protected array<string> AllMapLists;
var protected array<string> AllMaps;
var protected array<string> AllMutators;
var protected array< Class<GameInfo> > AllGameTypes;
var string NextMutators;
var protected bool bEdit;

function bool StartEdit(optional string GameType)
{
    // End:0x18
    if((Level == none) || bEdit)
    {
        return false;
    }
    // End:0x2A
    if(AllGameTypes.Length == 0)
    {
        LoadGameTypes();
    }
    // End:0x3C
    if(AllMutators.Length == 0)
    {
        LoadAllMutators();
    }
    // End:0x67
    if(GameType == "")
    {
        GameType = string(Level.Game.Class);
    }
    GameClass = FindGameType(GameType);
    Log("GameClass is" @ string(GameClass));
    // End:0x9E
    if(GameClass == none)
    {
        return false;
    }
    LoadAllMaps();
    GameIndex = Level.Game.MaplistHandler.GetGameIndex(string(GameClass));
    CurrentMapList = GetActiveList();
    AllMapLists = GetLists();
    LoadSettings(GameClass);
    SetUsedMutators();
    NextMutators = "";
    bEdit = true;
    return true;
    //return;    
}

function bool EndEdit(bool bSave)
{
    local int i;

    // End:0x1A
    if((Level == none) || !bEdit)
    {
        return false;
    }
    // End:0xC3
    if(bSave)
    {
        Settings.SaveSettings();
        NextMutators = "";
        // End:0x9A
        if(UsedMutators.Length > 0)
        {
            NextMutators = AllMutators[UsedMutators[0]];
            i = 1;
            J0x5D:

            // End:0x9A [Loop If]
            if(i < UsedMutators.Length)
            {
                NextMutators = (NextMutators $ ",") $ AllMutators[UsedMutators[i]];
                i++;
                // [Loop Continue]
                goto J0x5D;
            }
        }
        Level.Game.MaplistHandler.SaveGame(GameIndex);        
    }
    else
    {
        Level.Game.MaplistHandler.ResetGame(GameIndex);
    }
    bEdit = false;
    return true;
    //return;    
}

function bool CanEdit()
{
    return !bEdit;
    //return;    
}

function string GetParam(int idx)
{
    // End:0x29
    if((idx < 0) || idx >= Settings.Settings.Length)
    {
        return "";
    }
    return Settings.Settings[idx].Value;
    //return;    
}

function string GetNamedParam(string Parameter)
{
    local int i;
    local string SettingName;

    i = 0;
    J0x07:

    // End:0x94 [Loop If]
    if(i < Settings.Settings.Length)
    {
        SettingName = Settings.Settings[i].SettingName;
        // End:0x8A
        if((SettingName ~= Parameter) || Right(SettingName, Len(Parameter) + 1) ~= ("." $ Parameter))
        {
            return Settings.Settings[i].Value;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function array<string> GetMaskedParams(string ParamMask)
{
    local array<string> FoundParams, FoundMasks;
    local string SettingName, ShortName;
    local int i, j, P;

    Split(ParamMask, " ", FoundMasks);
    // End:0x146
    if(FoundMasks.Length > 0)
    {
        i = 0;
        J0x22:

        // End:0x146 [Loop If]
        if(i < Settings.Settings.Length)
        {
            SettingName = Settings.Settings[i].SettingName;
            ShortName = SettingName;
            j = InStr(ShortName, ".");
            J0x75:

            // End:0xAC [Loop If]
            if(j != -1)
            {
                ShortName = Mid(ShortName, P + 1);
                j = InStr(ShortName, ".");
                // [Loop Continue]
                goto J0x75;
            }
            j = 0;
            J0xB3:

            // End:0x13C [Loop If]
            if(j < FoundMasks.Length)
            {
                // End:0x132
                if((MaskedCompare(ShortName, FoundMasks[j])) || MaskedCompare(SettingName, FoundMasks[j]))
                {
                    FoundParams[FoundParams.Length] = SettingName;
                    FoundParams[FoundParams.Length] = Settings.Settings[i].Value;
                    // [Explicit Break]
                    goto J0x13C;
                }
                j++;
                // [Loop Continue]
                goto J0xB3;
            }
            J0x13C:

            i++;
            // [Loop Continue]
            goto J0x22;
        }
    }
    return FoundParams;
    //return;    
}

function bool SetParam(int idx, string Value)
{
    // End:0x28
    if((idx < 0) || idx >= Settings.Settings.Length)
    {
        return false;
    }
    return Settings.StoreSetting(idx, Value);
    //return;    
}

function bool SetNamedParam(string Parameter, string Value)
{
    local int i;
    local string SettingName;

    i = 0;
    J0x07:

    // End:0x91 [Loop If]
    if(i < Settings.Settings.Length)
    {
        SettingName = Settings.Settings[i].SettingName;
        // End:0x87
        if((SettingName ~= Parameter) || Right(SettingName, Len(Parameter) + 1) ~= ("." $ Parameter))
        {
            return Settings.StoreSetting(i, Value);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function array<string> GetLists()
{
    local array<string> Names;

    Names = Level.Game.MaplistHandler.GetMapListNames(GameIndex);
    return Names;
    //return;    
}

function int GetActiveList()
{
    return Level.Game.MaplistHandler.GetActiveList(GameIndex);
    //return;    
}

function array<string> GetMaps()
{
    return Level.Game.MaplistHandler.GetMapList(GameIndex, CurrentMapList);
    //return;    
}

function array<string> AddMaps(string MapMask)
{
    local array<string> FoundMasks, AddedMaps, CurrentMaps;
    local int i, j, k;
    local bool bFound;

    Split(MapMask, " ", FoundMasks);
    // End:0x133
    if(FoundMasks.Length > 0)
    {
        CurrentMaps = GetMaps();
        i = 0;
        J0x2E:

        // End:0x133 [Loop If]
        if(i < AllMaps.Length)
        {
            j = 0;
            J0x45:

            // End:0x129 [Loop If]
            if(j < FoundMasks.Length)
            {
                // End:0x11F
                if(MaskedCompare(AllMaps[i], FoundMasks[j]))
                {
                    bFound = false;
                    k = 0;
                    J0x83:

                    // End:0xC3 [Loop If]
                    if(k < CurrentMaps.Length)
                    {
                        // End:0xB9
                        if(CurrentMaps[k] == AllMaps[i])
                        {
                            bFound = true;
                            // [Explicit Break]
                            goto J0xC3;
                        }
                        k++;
                        // [Loop Continue]
                        goto J0x83;
                    }
                    J0xC3:

                    // End:0x11F
                    if(!bFound)
                    {
                        Level.Game.MaplistHandler.AddMap(GameIndex, CurrentMapList, AllMaps[i]);
                        AddedMaps[AddedMaps.Length] = AllMaps[i];
                        // [Explicit Break]
                        goto J0x129;
                    }
                }
                j++;
                // [Loop Continue]
                goto J0x45;
            }
            J0x129:

            i++;
            // [Loop Continue]
            goto J0x2E;
        }
    }
    return AddedMaps;
    //return;    
}

function array<string> RemoveMaps(string MapMask)
{
    local array<string> FoundMasks, DelMaps, CurrentMaps;
    local int i, j;

    Split(MapMask, " ", FoundMasks);
    // End:0xE0
    if(FoundMasks.Length > 0)
    {
        CurrentMaps = GetMaps();
        i = 0;
        J0x2E:

        // End:0xE0 [Loop If]
        if(i < CurrentMaps.Length)
        {
            j = 0;
            J0x45:

            // End:0xD6 [Loop If]
            if(j < FoundMasks.Length)
            {
                // End:0xCC
                if(MaskedCompare(CurrentMaps[i], FoundMasks[j]))
                {
                    DelMaps[DelMaps.Length] = CurrentMaps[i];
                    Level.Game.MaplistHandler.RemoveMap(GameIndex, CurrentMapList, CurrentMaps[i]);
                    i--;
                    // [Explicit Break]
                    goto J0xD6;
                }
                j++;
                // [Loop Continue]
                goto J0x45;
            }
            J0xD6:

            i++;
            // [Loop Continue]
            goto J0x2E;
        }
    }
    return DelMaps;
    //return;    
}

function array<string> FindMaps(string MapMask)
{
    local array<string> FoundMasks, FoundMaps, CurrentMaps;
    local int i, j, k;
    local bool bFound;

    Split(MapMask, " ", FoundMasks);
    // End:0x11B
    if(FoundMasks.Length > 0)
    {
        CurrentMaps = GetMaps();
        i = 0;
        J0x2E:

        // End:0x11B [Loop If]
        if(i < AllMaps.Length)
        {
            j = 0;
            J0x45:

            // End:0x111 [Loop If]
            if(j < FoundMasks.Length)
            {
                // End:0x107
                if(MaskedCompare(AllMaps[i], FoundMasks[j]))
                {
                    bFound = false;
                    k = 0;
                    J0x83:

                    // End:0xC3 [Loop If]
                    if(k < CurrentMaps.Length)
                    {
                        // End:0xB9
                        if(CurrentMaps[k] ~= AllMaps[i])
                        {
                            bFound = true;
                            // [Explicit Break]
                            goto J0xC3;
                        }
                        k++;
                        // [Loop Continue]
                        goto J0x83;
                    }
                    J0xC3:

                    // End:0xEC
                    if(bFound)
                    {
                        FoundMaps[FoundMaps.Length] = "+" $ AllMaps[i];                        
                    }
                    else
                    {
                        FoundMaps[FoundMaps.Length] = AllMaps[i];
                    }
                    // [Explicit Break]
                    goto J0x111;
                }
                j++;
                // [Loop Continue]
                goto J0x45;
            }
            J0x111:

            i++;
            // [Loop Continue]
            goto J0x2E;
        }
    }
    return FoundMaps;
    //return;    
}

function array<string> GetUsedMutators()
{
    local array<string> Strings;
    local int i;

    i = 0;
    J0x07:

    // End:0x3F [Loop If]
    if(i < UsedMutators.Length)
    {
        Strings[Strings.Length] = AllMutators[UsedMutators[i]];
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Strings;
    //return;    
}

function array<string> GetUnusedMutators()
{
    local array<string> Strings;
    local int i;

    Strings.Length = AllMutators.Length;
    i = 0;
    J0x14:

    // End:0x45 [Loop If]
    if(i < AllMutators.Length)
    {
        Strings[i] = AllMutators[i];
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    i = 0;
    J0x4C:

    // End:0x7A [Loop If]
    if(i < UsedMutators.Length)
    {
        Strings[UsedMutators[i]] = "";
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    i = 0;
    J0x81:

    // End:0xC0 [Loop If]
    if(i < Strings.Length)
    {
        // End:0xB6
        if(Strings[i] == "")
        {
            Strings.Remove(i, 1);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x81;
    }
    return Strings;
    //return;    
}

function bool AddMutator(string MutatorName)
{
    local int i, j;
    local string str;

    i = 0;
    J0x07:

    // End:0xAF [Loop If]
    if(i < AllMutators.Length)
    {
        str = AllMutators[i];
        // End:0xA5
        if((str ~= MutatorName) || Right(str, Len(MutatorName) + 1) ~= ("." $ MutatorName))
        {
            j = 0;
            J0x60:

            // End:0x91 [Loop If]
            if(j < UsedMutators.Length)
            {
                // End:0x87
                if(UsedMutators[j] == i)
                {
                    return false;
                }
                j++;
                // [Loop Continue]
                goto J0x60;
            }
            UsedMutators[UsedMutators.Length] = i;
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool DelMutator(string MutatorName)
{
    local int i;
    local string str;

    i = 0;
    J0x07:

    // End:0x77 [Loop If]
    if(i < UsedMutators.Length)
    {
        str = AllMutators[UsedMutators[i]];
        // End:0x6D
        if((str ~= MutatorName) || Right(str, Len(MutatorName) + 1) ~= ("." $ MutatorName))
        {
            UsedMutators.Remove(i, 1);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function string GetEditedClass()
{
    // End:0x13
    if(GameClass != none)
    {
        return string(GameClass);
    }
    return "";
    //return;    
}

function string GetGameAcronym()
{
    // End:0x1A
    if(GameClass != none)
    {
        return GameClass.default.Acronym;
    }
    return "";
    //return;    
}

protected function LoadGameTypes()
{
    local Class<GameInfo> TempClass;
    local string NextGame;
    local int i;

    i = 0;
    NextGame = Level.GetNextInt("Engine.GameInfo", 0);
    J0x2E:

    // End:0xA2 [Loop If]
    if(NextGame != "")
    {
        TempClass = Class<GameInfo>(DynamicLoadObject(NextGame, Class'Core.Class'));
        // End:0x72
        if(TempClass != none)
        {
            AllGameTypes[AllGameTypes.Length] = TempClass;
        }
        NextGame = Level.GetNextInt("Engine.GameInfo", ++i);
        // [Loop Continue]
        goto J0x2E;
    }
    //return;    
}

protected function Class<GameInfo> FindGameType(string GameType)
{
    local Class<GameInfo> TempClass;
    local int i;

    TempClass = none;
    i = 0;
    J0x0E:

    // End:0xD4 [Loop If]
    if(i < AllGameTypes.Length)
    {
        TempClass = AllGameTypes[i];
        // End:0x43
        if(GameType ~= string(TempClass))
        {
            // [Explicit Break]
            goto J0xD4;
        }
        // End:0x5E
        if(GameType ~= TempClass.default.Acronym)
        {
            // [Explicit Break]
            goto J0xD4;
        }
        // End:0x79
        if(GameType ~= TempClass.default.DecoTextName)
        {
            // [Explicit Break]
            goto J0xD4;
        }
        // End:0x9E
        if(Right(string(TempClass), Len(GameType) + 1) ~= ("." $ GameType))
        {
            // [Explicit Break]
            goto J0xD4;
        }
        // End:0xCA
        if(Right(TempClass.default.DecoTextName, Len(GameType) + 1) ~= ("." $ GameType))
        {
            // [Explicit Break]
            goto J0xD4;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    J0xD4:

    return TempClass;
    //return;    
}

protected function LoadAllMutators()
{
    local string NextMutator, NextDesc;
    local int cnt;

    Level.GetNextIntDesc("Engine.Mutator", 0, NextMutator, NextDesc);
    cnt = 0;
    AllMutators.Length = 0;
    J0x39:

    // End:0x8F [Loop If]
    if(NextMutator != "")
    {
        AllMutators[AllMutators.Length] = NextMutator;
        cnt++;
        Level.GetNextIntDesc("Engine.Mutator", cnt, NextMutator, NextDesc);
        // [Loop Continue]
        goto J0x39;
    }
    //return;    
}

protected function SetUsedMutators()
{
    local Mutator M;
    local int i;

    M = Level.Game.BaseMutator.NextMutator;
    J0x26:

    // End:0x10B [Loop If]
    if(M != none)
    {
        // End:0xF4
        if(M.bUserAdded)
        {
            i = 0;
            J0x4A:

            // End:0x87 [Loop If]
            if(i < AllMutators.Length)
            {
                // End:0x7D
                if(string(M.Class) ~= AllMutators[i])
                {
                    // [Explicit Break]
                    goto J0x87;
                }
                i++;
                // [Loop Continue]
                goto J0x4A;
            }
            J0x87:

            // End:0xE2
            if(i == AllMutators.Length)
            {
                AllMutators[AllMutators.Length] = string(M.Class);
                Log("Unknown Mutator in use: " @ string(M.Class));
            }
            UsedMutators[UsedMutators.Length] = i;
        }
        M = M.NextMutator;
        // [Loop Continue]
        goto J0x26;
    }
    //return;    
}

protected function string LoadSettings(Class<GameInfo> GameClass)
{
    // End:0x1A
    if(Settings == none)
    {
        Settings = new (none) Class'Engine.PlayInfo';
    }
    Settings.Clear();
    GameClass.static.FillPlayInfo(Settings);
    return string(GameClass);
    //return;    
}

protected function LoadAllMaps(optional bool bForceLoad)
{
    local string MapPrefix;

    // End:0x0D
    if(GameClass == none)
    {
        return;
    }
    MapPrefix = GameClass.default.MapPrefix;
    // End:0x6D
    if((MapPrefix != "") && (MapPrefix != AllMapsPrefix) || bForceLoad)
    {
        GameClass.static.LoadMapList(MapPrefix, AllMaps);
        AllMapsPrefix = MapPrefix;
    }
    //return;    
}

protected function bool MaskedCompare(string SettingName, string Mask)
{
    local bool bMaskLeft, bMaskRight;
    local int MaskLen;

    // End:0x1F
    if((Mask == "*") || Mask == "**")
    {
        return true;
    }
    MaskLen = Len(Mask);
    bMaskLeft = Left(Mask, 1) == "*";
    bMaskRight = Right(Mask, 1) == "*";
    // End:0x88
    if(bMaskLeft && bMaskRight)
    {
        return InStr(Caps(SettingName), Mid(Caps(Mask), 1, MaskLen - 2)) >= 0;
    }
    // End:0xB2
    if(bMaskLeft)
    {
        return Left(SettingName, MaskLen - 1) ~= Left(Mask, MaskLen - 1);
    }
    // End:0xDC
    if(bMaskRight)
    {
        return Right(SettingName, MaskLen - 1) ~= Right(Mask, MaskLen - 1);
    }
    return SettingName ~= Mask;
    //return;    
}
