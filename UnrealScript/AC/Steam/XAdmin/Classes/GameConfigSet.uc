/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XAdmin\Classes\GameConfigSet.uc
 * Package Imports:
 *	XAdmin
 *	Core
 *
 * Stats:
 *	Properties:14
 *	Functions:27
 *
 *******************************************************************************/
class GameConfigSet extends Object;

var LevelInfo Level;
var class<GameInfo> GameClass;
var int GameIndex;
var PlayInfo Settings;
var int CurrentMapList;
var array<int> UsedMutators;
var array<int> UsedMaps;
var string AllMapsPrefix;
var array<string> AllMapLists;
var array<string> AllMaps;
var array<string> AllMutators;
var array< class<GameInfo> > AllGameTypes;
var string NextMutators;
var bool bEdit;

function bool StartEdit(optional string GameType)
{
    // End:0x18
    if(Level == none || bEdit)
    {
        return false;
    }
    // End:0x2a
    if(AllGameTypes.Length == 0)
    {
        LoadGameTypes();
    }
    // End:0x3c
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
    // End:0x9e
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
}

function bool EndEdit(bool bSave)
{
    local int i;

    // End:0x1a
    if(Level == none || !bEdit)
    {
        return false;
    }
    // End:0xc3
    if(bSave)
    {
        Settings.SaveSettings();
        NextMutators = "";
        // End:0x9a
        if(UsedMutators.Length > 0)
        {
            NextMutators = AllMutators[UsedMutators[0]];
            i = 1;
            J0x5d:
            // End:0x9a [While If]
            if(i < UsedMutators.Length)
            {
                NextMutators = NextMutators $ "," $ AllMutators[UsedMutators[i]];
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x5d;
            }
        }
        Level.Game.MaplistHandler.SaveGame(GameIndex);
    }
    // End:0xe9
    else
    {
        Level.Game.MaplistHandler.ResetGame(GameIndex);
    }
    bEdit = false;
    return true;
}

function bool CanEdit()
{
    return !bEdit;
}

function string GetParam(int idx)
{
    // End:0x29
    if(idx < 0 || idx >= Settings.Settings.Length)
    {
        return "";
    }
    return Settings.Settings[idx].Value;
}

function string GetNamedParam(string Parameter)
{
    local int i;
    local string SettingName;

    i = 0;
    J0x07:
    // End:0x94 [While If]
    if(i < Settings.Settings.Length)
    {
        SettingName = Settings.Settings[i].SettingName;
        // End:0x8a
        if(SettingName ~= Parameter || Right(SettingName, Len(Parameter) + 1) ~= "." $ Parameter)
        {
            return Settings.Settings[i].Value;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
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
        // End:0x146 [While If]
        if(i < Settings.Settings.Length)
        {
            SettingName = Settings.Settings[i].SettingName;
            ShortName = SettingName;
            j = InStr(ShortName, ".");
            J0x75:
            // End:0xac [While If]
            if(j != -1)
            {
                ShortName = Mid(ShortName, P + 1);
                j = InStr(ShortName, ".");
                // This is an implied JumpToken; Continue!
                goto J0x75;
            }
            j = 0;
            J0xb3:
            // End:0x13c [While If]
            if(j < FoundMasks.Length)
            {
                // End:0x132
                if(MaskedCompare(ShortName, FoundMasks[j]) || MaskedCompare(SettingName, FoundMasks[j]))
                {
                    FoundParams[FoundParams.Length] = SettingName;
                    FoundParams[FoundParams.Length] = Settings.Settings[i].Value;
                }
                // End:0x13c
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0xb3;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x22;
        }
    }
    return FoundParams;
}

function bool SetParam(int idx, string Value)
{
    // End:0x28
    if(idx < 0 || idx >= Settings.Settings.Length)
    {
        return false;
    }
    return Settings.StoreSetting(idx, Value);
}

function bool SetNamedParam(string Parameter, string Value)
{
    local int i;
    local string SettingName;

    i = 0;
    J0x07:
    // End:0x91 [While If]
    if(i < Settings.Settings.Length)
    {
        SettingName = Settings.Settings[i].SettingName;
        // End:0x87
        if(SettingName ~= Parameter || Right(SettingName, Len(Parameter) + 1) ~= "." $ Parameter)
        {
            return Settings.StoreSetting(i, Value);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function array<string> GetLists()
{
    local array<string> Names;

    Names = Level.Game.MaplistHandler.GetMapListNames(GameIndex);
    return Names;
}

function int GetActiveList()
{
    return Level.Game.MaplistHandler.GetActiveList(GameIndex);
}

function array<string> GetMaps()
{
    return Level.Game.MaplistHandler.GetMapList(GameIndex, CurrentMapList);
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
        J0x2e:
        // End:0x133 [While If]
        if(i < AllMaps.Length)
        {
            j = 0;
            J0x45:
            // End:0x129 [While If]
            if(j < FoundMasks.Length)
            {
                // End:0x11f
                if(MaskedCompare(AllMaps[i], FoundMasks[j]))
                {
                    bFound = false;
                    k = 0;
                    J0x83:
                    // End:0xc3 [While If]
                    if(k < CurrentMaps.Length)
                    {
                        // End:0xb9
                        if(CurrentMaps[k] == AllMaps[i])
                        {
                            bFound = true;
                        }
                        // End:0xc3
                        else
                        {
                            ++ k;
                            // This is an implied JumpToken; Continue!
                            goto J0x83;
                        }
                    }
                    // End:0x11f
                    if(!bFound)
                    {
                        Level.Game.MaplistHandler.AddMap(GameIndex, CurrentMapList, AllMaps[i]);
                        AddedMaps[AddedMaps.Length] = AllMaps[i];
                    }
                    // End:0x129
                    else
                    {
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x45;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2e;
        }
    }
    return AddedMaps;
}

function array<string> RemoveMaps(string MapMask)
{
    local array<string> FoundMasks, DelMaps, CurrentMaps;
    local int i, j;

    Split(MapMask, " ", FoundMasks);
    // End:0xe0
    if(FoundMasks.Length > 0)
    {
        CurrentMaps = GetMaps();
        i = 0;
        J0x2e:
        // End:0xe0 [While If]
        if(i < CurrentMaps.Length)
        {
            j = 0;
            J0x45:
            // End:0xd6 [While If]
            if(j < FoundMasks.Length)
            {
                // End:0xcc
                if(MaskedCompare(CurrentMaps[i], FoundMasks[j]))
                {
                    DelMaps[DelMaps.Length] = CurrentMaps[i];
                    Level.Game.MaplistHandler.RemoveMap(GameIndex, CurrentMapList, CurrentMaps[i]);
                    -- i;
                }
                // End:0xd6
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x45;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2e;
        }
    }
    return DelMaps;
}

function array<string> FindMaps(string MapMask)
{
    local array<string> FoundMasks, FoundMaps, CurrentMaps;
    local int i, j, k;
    local bool bFound;

    Split(MapMask, " ", FoundMasks);
    // End:0x11b
    if(FoundMasks.Length > 0)
    {
        CurrentMaps = GetMaps();
        i = 0;
        J0x2e:
        // End:0x11b [While If]
        if(i < AllMaps.Length)
        {
            j = 0;
            J0x45:
            // End:0x111 [While If]
            if(j < FoundMasks.Length)
            {
                // End:0x107
                if(MaskedCompare(AllMaps[i], FoundMasks[j]))
                {
                    bFound = false;
                    k = 0;
                    J0x83:
                    // End:0xc3 [While If]
                    if(k < CurrentMaps.Length)
                    {
                        // End:0xb9
                        if(CurrentMaps[k] ~= AllMaps[i])
                        {
                            bFound = true;
                        }
                        // End:0xc3
                        else
                        {
                            ++ k;
                            // This is an implied JumpToken; Continue!
                            goto J0x83;
                        }
                    }
                    // End:0xec
                    if(bFound)
                    {
                        FoundMaps[FoundMaps.Length] = "+" $ AllMaps[i];
                    }
                    // End:0x104
                    else
                    {
                        FoundMaps[FoundMaps.Length] = AllMaps[i];
                    }
                }
                // End:0x111
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x45;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2e;
        }
    }
    return FoundMaps;
}

function array<string> GetUsedMutators()
{
    local array<string> Strings;
    local int i;

    i = 0;
    J0x07:
    // End:0x3f [While If]
    if(i < UsedMutators.Length)
    {
        Strings[Strings.Length] = AllMutators[UsedMutators[i]];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Strings;
}

function array<string> GetUnusedMutators()
{
    local array<string> Strings;
    local int i;

    Strings.Length = AllMutators.Length;
    i = 0;
    J0x14:
    // End:0x45 [While If]
    if(i < AllMutators.Length)
    {
        Strings[i] = AllMutators[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    i = 0;
    J0x4c:
    // End:0x7a [While If]
    if(i < UsedMutators.Length)
    {
        Strings[UsedMutators[i]] = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    i = 0;
    J0x81:
    // End:0xc0 [While If]
    if(i < Strings.Length)
    {
        // End:0xb6
        if(Strings[i] == "")
        {
            Strings.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x81;
    }
    return Strings;
}

function bool AddMutator(string MutatorName)
{
    local int i, j;
    local string str;

    i = 0;
    J0x07:
    // End:0xaf [While If]
    if(i < AllMutators.Length)
    {
        str = AllMutators[i];
        // End:0xa5
        if(str ~= MutatorName || Right(str, Len(MutatorName) + 1) ~= "." $ MutatorName)
        {
            j = 0;
            J0x60:
            // End:0x91 [While If]
            if(j < UsedMutators.Length)
            {
                // End:0x87
                if(UsedMutators[j] == i)
                {
                    return false;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x60;
            }
            UsedMutators[UsedMutators.Length] = i;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool DelMutator(string MutatorName)
{
    local int i;
    local string str;

    i = 0;
    J0x07:
    // End:0x77 [While If]
    if(i < UsedMutators.Length)
    {
        str = AllMutators[UsedMutators[i]];
        // End:0x6d
        if(str ~= MutatorName || Right(str, Len(MutatorName) + 1) ~= "." $ MutatorName)
        {
            UsedMutators.Remove(i, 1);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function string GetEditedClass()
{
    // End:0x13
    if(GameClass != none)
    {
        return string(GameClass);
    }
    return "";
}

function string GetGameAcronym()
{
    // End:0x1a
    if(GameClass != none)
    {
        return GameClass.default.Acronym;
    }
    return "";
}

protected function LoadGameTypes()
{
    local class<GameInfo> TempClass;
    local string NextGame;
    local int i;

    i = 0;
    NextGame = Level.GetNextInt("Engine.GameInfo", 0);
    J0x2e:
    // End:0xa2 [While If]
    if(NextGame != "")
    {
        TempClass = class<GameInfo>(DynamicLoadObject(NextGame, class'Class'));
        // End:0x72
        if(TempClass != none)
        {
            AllGameTypes[AllGameTypes.Length] = TempClass;
        }
        NextGame = Level.GetNextInt("Engine.GameInfo", ++ i);
        // This is an implied JumpToken; Continue!
        goto J0x2e;
    }
}

protected function class<GameInfo> FindGameType(string GameType)
{
    local class<GameInfo> TempClass;
    local int i;

    TempClass = none;
    i = 0;
    J0x0e:
    // End:0xd4 [While If]
    if(i < AllGameTypes.Length)
    {
        TempClass = AllGameTypes[i];
        // End:0x43
        if(GameType ~= string(TempClass))
        {
        }
        // End:0xd4
        else
        {
            // End:0x5e
            if(GameType ~= TempClass.default.Acronym)
            {
            }
            // End:0xd4
            else
            {
                // End:0x79
                if(GameType ~= TempClass.default.DecoTextName)
                {
                }
                // End:0xd4
                else
                {
                    // End:0x9e
                    if(Right(string(TempClass), Len(GameType) + 1) ~= "." $ GameType)
                    {
                    }
                    // End:0xd4
                    else
                    {
                        // End:0xca
                        if(Right(TempClass.default.DecoTextName, Len(GameType) + 1) ~= "." $ GameType)
                        {
                        }
                        // End:0xd4
                        else
                        {
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x0e;
                        }
                    }
                }
            }
        }
    }
    return TempClass;
}

protected function LoadAllMutators()
{
    local string NextMutator, NextDesc;
    local int cnt;

    Level.GetNextIntDesc("Engine.Mutator", 0, NextMutator, NextDesc);
    cnt = 0;
    AllMutators.Length = 0;
    J0x39:
    // End:0x8f [While If]
    if(NextMutator != "")
    {
        AllMutators[AllMutators.Length] = NextMutator;
        ++ cnt;
        Level.GetNextIntDesc("Engine.Mutator", cnt, NextMutator, NextDesc);
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
}

protected function SetUsedMutators()
{
    local Mutator M;
    local int i;

    M = Level.Game.BaseMutator.NextMutator;
    J0x26:
    // End:0x10b [While If]
    if(M != none)
    {
        // End:0xf4
        if(M.bUserAdded)
        {
            i = 0;
            J0x4a:
            // End:0x87 [While If]
            if(i < AllMutators.Length)
            {
                // End:0x7d
                if(string(M.Class) ~= AllMutators[i])
                {
                }
                // End:0x87
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x4a;
                }
            }
            // End:0xe2
            if(i == AllMutators.Length)
            {
                AllMutators[AllMutators.Length] = string(M.Class);
                Log("Unknown Mutator in use: " @ string(M.Class));
            }
            UsedMutators[UsedMutators.Length] = i;
        }
        M = M.NextMutator;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
}

protected function string LoadSettings(class<GameInfo> GameClass)
{
    // End:0x1a
    if(Settings == none)
    {
        Settings = new (none) class'PlayInfo';
    }
    Settings.Clear();
    GameClass.static.FillPlayInfo(Settings);
    return string(GameClass);
}

protected function LoadAllMaps(optional bool bForceLoad)
{
    local string MapPrefix;

    // End:0x0d
    if(GameClass == none)
    {
        return;
    }
    MapPrefix = GameClass.default.MapPrefix;
    // End:0x6d
    if(MapPrefix != "" && MapPrefix != AllMapsPrefix || bForceLoad)
    {
        GameClass.static.LoadMapList(MapPrefix, AllMaps);
        AllMapsPrefix = MapPrefix;
    }
}

protected function bool MaskedCompare(string SettingName, string Mask)
{
    local bool bMaskLeft, bMaskRight;
    local int MaskLen;

    // End:0x1f
    if(Mask == "*" || Mask == "**")
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
    // End:0xb2
    if(bMaskLeft)
    {
        return Left(SettingName, MaskLen - 1) ~= Left(Mask, MaskLen - 1);
    }
    // End:0xdc
    if(bMaskRight)
    {
        return Right(SettingName, MaskLen - 1) ~= Right(Mask, MaskLen - 1);
    }
    return SettingName ~= Mask;
}
