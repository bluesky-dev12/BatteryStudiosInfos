class MatchConfig extends Object
    config(MatchConfig)
    perobjectconfig;

struct ProfileSetting
{
    var string SettingName;
    var string SettingValue;
};

var config array<ProfileSetting> Settings;
var config string DefaultGameClassString;
var config string DefaultMutatorsString;
var config string DefaultParameters;
var config bool DefaultTournamentMode;
var config string DefaultDemoRecFileName;
var string GameClassString;
var string MapIndexList;
var string MutatorIndexList;
var string Parameters;
var bool bTournamentMode;
var string DemoRecFileName;
var MaplistManager MapHandler;
var PlayInfo PInfo;
var LevelInfo Level;
var array<GameRecord> GameTypes;
var array<MapRecord> Maps;
var array<MutatorRecord> Mutators;
var transient int GameIndex;
var transient int RecordIndex;
var localized string lmsgLoadingMatchProfile;
var localized string lmsgRestoringDefaultProfile;
var localized string lmsgDefaultNotAvailable;

function Init(LevelInfo Lv)
{
    // End:0x0D
    if(Lv == none)
    {
        return;
    }
    Level = Lv;
    PInfo = new (none) Class'Engine.PlayInfo';
    MapHandler = MaplistManager(Level.Game.MaplistHandler);
    Class'Engine.CacheManager'.static.GetGameTypeList(GameTypes);
    Class'Engine.CacheManager'.static.GetMutatorList(Mutators);
    LoadDefaults();
    //return;    
}

function LoadDefaults()
{
    SetGameClassString(DefaultGameClassString);
    Parameters = DefaultParameters;
    bTournamentMode = DefaultTournamentMode;
    DemoRecFileName = DefaultDemoRecFileName;
    LoadDefaultMutators();
    LoadDefaultMaps();
    //return;    
}

function LoadDefaultMutators()
{
    local array<string> Classes;
    local int i, idx;

    MutatorIndexList = "";
    // End:0x25
    if(Mutators.Length == 0)
    {
        Class'Engine.CacheManager'.static.GetMutatorList(Mutators);
    }
    Split(DefaultMutatorsString, ",", Classes);
    i = 0;
    J0x3B:

    // End:0xA3 [Loop If]
    if(i < Classes.Length)
    {
        idx = GetMutatorCacheIndex(Classes[i]);
        // End:0x99
        if(idx != -1)
        {
            // End:0x89
            if(MutatorIndexList != "")
            {
                MutatorIndexList $= ",";
            }
            MutatorIndexList $= string(idx);
        }
        i++;
        // [Loop Continue]
        goto J0x3B;
    }
    //return;    
}

function LoadCurrentMutators()
{
    local int idx;
    local Mutator M;

    MutatorIndexList = "";
    // End:0x25
    if(Mutators.Length == 0)
    {
        Class'Engine.CacheManager'.static.GetMutatorList(Mutators);
    }
    M = Level.Game.BaseMutator.NextMutator;
    J0x4B:

    // End:0xC0 [Loop If]
    if(M != none)
    {
        idx = GetMutatorCacheIndex(string(M.Class));
        // End:0xA9
        if(idx != -1)
        {
            // End:0x99
            if(MutatorIndexList != "")
            {
                MutatorIndexList $= ",";
            }
            MutatorIndexList $= string(idx);
        }
        M = M.NextMutator;
        // [Loop Continue]
        goto J0x4B;
    }
    //return;    
}

function LoadDefaultMaps()
{
    local int i, MapIndex;
    local array<string> MapArr;

    MapIndexList = "";
    UpdateRecordIndex();
    // End:0xAB
    if(RecordIndex != -1)
    {
        MapArr = MapHandler.GetMapList(GameIndex, RecordIndex);
        i = 0;
        J0x43:

        // End:0xAB [Loop If]
        if(i < MapArr.Length)
        {
            MapIndex = GetMapCacheIndex(MapArr[i]);
            // End:0xA1
            if(MapIndex != -1)
            {
                // End:0x91
                if(MapIndexList != "")
                {
                    MapIndexList $= ",";
                }
                MapIndexList $= string(MapIndex);
            }
            i++;
            // [Loop Continue]
            goto J0x43;
        }
    }
    //return;    
}

function SetGameClassString(string NewString)
{
    local int idx;

    // End:0x0E
    if(NewString == "")
    {
        return;
    }
    idx = MapHandler.GetGameIndex(NewString);
    // End:0x53
    if(idx != -1)
    {
        GameClassString = NewString;
        GameIndex = idx;
        UpdateRecordIndex();
    }
    //return;    
}

function LoadCurrentSettings()
{
    local array<string> ParamArray;
    local string URL, LeftPart, RightPart;
    local int X;

    SetGameClassString(string(Level.Game.Class));
    LoadCurrentMutators();
    URL = Caps(Level.GetLocalURL());
    Split(URL, "?", ParamArray);
    Parameters = "";
    X = 1;
    J0x5A:

    // End:0x126 [Loop If]
    if(X < ParamArray.Length)
    {
        // End:0x9A
        if(!Divide(ParamArray[X], "=", LeftPart, RightPart))
        {
            LeftPart = ParamArray[X];
        }
        // End:0xC1
        if(LeftPart ~= "Tournament")
        {
            bTournamentMode = bool(RightPart);
            // [Explicit Continue]
            goto J0x11C;
        }
        // End:0xE2
        if(LeftPart ~= "DemoRec")
        {
            DemoRecFileName = RightPart;
            // [Explicit Continue]
            goto J0x11C;
        }
        // End:0x11C
        if(IncludeParam(LeftPart))
        {
            // End:0x108
            if(Parameters != "")
            {
                Parameters $= ";";
            }
            Parameters $= ParamArray[X];
        }
        J0x11C:

        X++;
        // [Loop Continue]
        goto J0x5A;
    }
    LoadPlayInfo();
    LoadMapList();
    //return;    
}

function bool IncludeParam(string ParamName)
{
    switch(Caps(ParamName))
    {
        // End:0x12
        case "NAME":
        // End:0x20
        case "CHARACTER":
        // End:0x29
        case "TEAM":
        // End:0x32
        case "GAME":
        // End:0x40
        case "ADMINNAME":
        // End:0x52
        case "ADMINPASSWORD":
        // End:0x5E
        case "MUTATOR":
        // End:0x68
        case "CLASS":
        // End:0x77
        case "TOURNAMENT":
        // End:0x83
        case "NUMBOTS":
        // End:0x94
        case "BAUTONUMBOTS":
        // End:0xA2
        case "DEMOREC":
            return false;
        // End:0xFFFF
        default:
            return true;
            break;
    }
    //return;    
}

function LoadPlayInfo()
{
    local int i, j;
    local Class<GameInfo> GameClass;
    local Class<AccessControl> ACClass;
    local array< Class<Info> > PIClasses;
    local Class<Mutator> mutClass;
    local array<string> MutClassNames;

    PInfo.Clear();
    GameClass = Class<GameInfo>(DynamicLoadObject(GameClassString, Class'Core.Class'));
    // End:0x137
    if(GameClass != none)
    {
        PIClasses[i++] = GameClass;
        ACClass = Class<AccessControl>(DynamicLoadObject(GameClass.default.AccessControlClass, Class'Core.Class'));
        // End:0x87
        if(ACClass != none)
        {
            PIClasses[i++] = ACClass;
        }
        MutClassNames = GetCurrentMutatorArray();
        MutClassNames.Insert(0, 1);
        MutClassNames[0] = GameClass.default.MutatorClass;
        j = 0;
        J0xB8:

        // End:0x123 [Loop If]
        if(j < MutClassNames.Length)
        {
            // End:0xFB
            if(MutClassNames[j] != "")
            {
                mutClass = Class<Mutator>(DynamicLoadObject(MutClassNames[j], Class'Core.Class'));
            }
            // End:0x119
            if(mutClass != none)
            {
                PIClasses[i++] = mutClass;
            }
            j++;
            // [Loop Continue]
            goto J0xB8;
        }
        PInfo.Init(PIClasses);
    }
    //return;    
}

function LoadMapList()
{
    local int i, MapIndex;
    local array<string> MapArr;

    MapIndexList = "";
    UpdateRecordIndex();
    // End:0x9C
    if(RecordIndex != -1)
    {
        MapArr = MapHandler.GetMapList(GameIndex, RecordIndex);
        i = 0;
        J0x43:

        // End:0x9C [Loop If]
        if(i < MapArr.Length)
        {
            MapIndex = GetMapCacheIndex(MapArr[i]);
            // End:0x82
            if(MapIndexList != "")
            {
                MapIndexList $= ",";
            }
            MapIndexList $= string(MapIndex);
            i++;
            // [Loop Continue]
            goto J0x43;
        }
    }
    //return;    
}

function bool ChangeSetting(string SettingName, string NewValue)
{
    local xVotingHandler VH;
    local int i;
    local bool bFound;

    Log(((("____ChangeSetting(" $ SettingName) $ ", ") $ NewValue) $ ")", 'MapVoteDebug');
    VH = xVotingHandler(Level.Game.VotingHandler);
    switch(SettingName)
    {
        // End:0xFF
        case Class'xVoting_Decompressed.VotingReplicationInfo'.default.GameTypeID:
            // End:0xFD
            if(!NewValue ~= GameClassString)
            {
                bFound = false;
                i = 0;
                J0x8E:

                // End:0xCD [Loop If]
                if(i < GameTypes.Length)
                {
                    // End:0xC3
                    if(GameTypes[i].ClassName ~= NewValue)
                    {
                        bFound = true;
                        // [Explicit Break]
                        goto J0xCD;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x8E;
                }
                J0xCD:

                // End:0xDA
                if(!bFound)
                {
                    return false;
                }
                SetGameClassString(NewValue);
                Reload(true);
                VH.ReloadMatchConfig(true, false);
            }
            return true;
        // End:0x11D
        case Class'xVoting_Decompressed.VotingReplicationInfo'.default.MapID:
            MapIndexList = NewValue;
            return true;
        // End:0x162
        case Class'xVoting_Decompressed.VotingReplicationInfo'.default.MutatorID:
            // End:0x160
            if(MutatorIndexList != NewValue)
            {
                MutatorIndexList = NewValue;
                Reload(false);
                VH.ReloadMatchConfig(false, false);
            }
            return true;
        // End:0x180
        case Class'xVoting_Decompressed.VotingReplicationInfo'.default.OptionID:
            Parameters = NewValue;
            return true;
        // End:0x1A1
        case Class'xVoting_Decompressed.VotingReplicationInfo'.default.TournamentID:
            bTournamentMode = bool(NewValue);
            return true;
        // End:0x1BF
        case Class'xVoting_Decompressed.VotingReplicationInfo'.default.DemoRecID:
            DemoRecFileName = NewValue;
            return true;
        // End:0xFFFF
        default:
            i = PInfo.FindIndex(SettingName);
            // End:0x200
            if(i > -1)
            {
                PInfo.StoreSetting(i, NewValue);
                return true;
            }
            return false;
            break;
    }
    //return;    
}

function Reload(bool bReloadMapList)
{
    LoadPlayInfo();
    // End:0x15
    if(bReloadMapList)
    {
        LoadMapList();
    }
    //return;    
}

function SaveDefault()
{
    local int i;

    Log(("Saving Default settings to MatchConfig.ini - [" $ string(Name)) $ "]");
    DefaultGameClassString = GameClassString;
    DefaultMutatorsString = ConvertMutatorIndexes();
    DefaultParameters = Parameters;
    DefaultTournamentMode = bTournamentMode;
    DefaultDemoRecFileName = DemoRecFileName;
    Settings.Length = PInfo.Settings.Length;
    i = 0;
    J0x97:

    // End:0x132 [Loop If]
    if(i < PInfo.Settings.Length)
    {
        // End:0x128
        if(ArrayProperty(PInfo.Settings[i].ThisProp) == none)
        {
            Settings[i].SettingName = PInfo.Settings[i].SettingName;
            Settings[i].SettingValue = PInfo.Settings[i].Value;
        }
        i++;
        // [Loop Continue]
        goto J0x97;
    }
    SaveMapList();
    SaveConfig();
    //return;    
}

function RestoreDefault(Actor Requestor)
{
    local int i, j;
    local xVotingHandler VH;

    Log("___RestoreDefault()", 'MapVoteDebug');
    // End:0x2E
    if(PlayerController(Requestor) == none)
    {
        return;
    }
    LoadDefaults();
    Log("MapIndexList = " $ MapIndexList, 'MapVoteDebug');
    // End:0x88
    if((GameClassString == "") || MapIndexList == "")
    {
        PlayerController(Requestor).ClientMessage(lmsgDefaultNotAvailable);
        return;
    }
    LoadPlayInfo();
    i = 0;
    J0x95:

    // End:0x14F [Loop If]
    if(i < Settings.Length)
    {
        j = 0;
        J0xAC:

        // End:0x145 [Loop If]
        if(j < PInfo.Settings.Length)
        {
            // End:0x13B
            if(ArrayProperty(PInfo.Settings[i].ThisProp) == none)
            {
                // End:0x13B
                if(Settings[i].SettingName ~= PInfo.Settings[j].SettingName)
                {
                    PInfo.StoreSetting(j, Settings[i].SettingValue);
                    // [Explicit Break]
                    goto J0x145;
                }
            }
            j++;
            // [Loop Continue]
            goto J0xAC;
        }
        J0x145:

        i++;
        // [Loop Continue]
        goto J0x95;
    }
    Level.Game.Broadcast(Level.Game.VotingHandler, lmsgRestoringDefaultProfile);
    VH = xVotingHandler(Level.Game.VotingHandler);
    // End:0x1C1
    if(VH != none)
    {
        VH.ReloadMatchConfig(true, true);
    }
    //return;    
}

function StartMatch()
{
    local string ServerTravelString, mutstring;
    local Class<GameInfo> GameClass;
    local int i;

    SaveDefault();
    PInfo.SaveSettings();
    Level.Game.Broadcast(Level.Game.VotingHandler, lmsgLoadingMatchProfile);
    xVotingHandler(Level.Game.VotingHandler).CloseAllVoteWindows();
    mutstring = ConvertMutatorIndexes();
    // End:0x9C
    if(mutstring != "")
    {
        mutstring = "?mutator=" $ mutstring;
    }
    ServerTravelString = ((MapHandler.GetActiveMapName(GameIndex, RecordIndex) $ "?Game=") $ GameClassString) $ mutstring;
    ServerTravelString $= ("?" $ Eval(bTournamentMode, "TOURNAMENT=1", "TOURNAMENT=0"));
    // End:0x12C
    if(DemoRecFileName != "")
    {
        ServerTravelString $= ("?DemoRec=" $ DemoRecFileName);
    }
    // End:0x15A
    if(Parameters != "")
    {
        ServerTravelString $= ("?" $ Repl(Repl(Parameters, ",", "?"), " ", ""));
    }
    switch(Class'UnrealGame.UnrealMPGameInfo'.default.BotMode)
    {
        // End:0x1CA
        case 0:
            i = PInfo.FindIndex("MinPlayers");
            // End:0x1C7
            if(i >= 0)
            {
                ServerTravelString $= ("?NumBots=" $ PInfo.Settings[i].Value);
            }
            // End:0x2D1
            break;
        // End:0x1EF
        case 1:
            ServerTravelString $= "?bAutoNumBots=True";
            // End:0x2D1
            break;
        // End:0x2CE
        case 2:
            // End:0x28B
            if(GameClass.default.bTeamGame)
            {
                // End:0x246
                if(Class'WGame.TeamRedConfigured'.default.Characters.Length > 0)
                {
                    ServerTravelString $= "?RedTeam=WGame.TeamRedConfigured";
                }
                // End:0x288
                if(Class'WGame.TeamBlueConfigured'.default.Characters.Length > 0)
                {
                    ServerTravelString $= "?BlueTeam=WGame.TeamBlueConfigured";
                }                
            }
            else
            {
                // End:0x2CB
                if(Class'WGame.DMRosterConfigured'.default.Characters.Length > 0)
                {
                    ServerTravelString $= "?DMTeam=WGame.DMRosterConfigured";
                }
            }
            // End:0x2D1
            break;
        // End:0xFFFF
        default:
            break;
    }
    Level.ServerTravel(ServerTravelString, false);
    //return;    
}

function SaveMapList()
{
    local int i;
    local array<string> OldMaps, NewMaps;

    // End:0xD9
    if(MapHandler != none)
    {
        OldMaps = MapHandler.GetMapList(GameIndex, RecordIndex);
        NewMaps = GetCurrentMapArray();
        i = 0;
        J0x3D:

        // End:0x7B [Loop If]
        if(i < OldMaps.Length)
        {
            MapHandler.RemoveMap(GameIndex, RecordIndex, OldMaps[i]);
            i++;
            // [Loop Continue]
            goto J0x3D;
        }
        i = 0;
        J0x82:

        // End:0xC0 [Loop If]
        if(i < NewMaps.Length)
        {
            MapHandler.AddMap(GameIndex, RecordIndex, NewMaps[i]);
            i++;
            // [Loop Continue]
            goto J0x82;
        }
        MapHandler.ApplyMapList(GameIndex, RecordIndex);
    }
    //return;    
}

function UpdateRecordIndex()
{
    local array<string> Dummy;

    // End:0x30
    if(((Level == none) || Level.Game == none) || MapHandler == none)
    {
        return;
    }
    // End:0x95
    if(GameIndex != -1)
    {
        RecordIndex = MapHandler.GetRecordIndex(GameIndex, string(Name));
        // End:0x95
        if(RecordIndex == -1)
        {
            RecordIndex = MapHandler.AddList(GameClassString, string(Name), Dummy);
        }
    }
    //return;    
}

function int GetGameCacheIndex(coerce string ClassName)
{
    local int i;

    // End:0x12
    if(ClassName == "")
    {
        return -1;
    }
    // End:0x2F
    if(GameTypes.Length == 0)
    {
        Class'Engine.CacheManager'.static.GetGameTypeList(GameTypes);
    }
    i = 0;
    J0x36:

    // End:0x70 [Loop If]
    if(i < GameTypes.Length)
    {
        // End:0x66
        if(GameTypes[i].ClassName ~= ClassName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    Log(((string(Name) @ "GetGameCacheIndex() didn't find index for game class '") $ ClassName) $ "'", 'MapVoteDebug');
    return -1;
    //return;    
}

function int GetMutatorCacheIndex(coerce string ClassName)
{
    local int i;

    // End:0x12
    if(ClassName == "")
    {
        return -1;
    }
    // End:0x2F
    if(Mutators.Length == 0)
    {
        Class'Engine.CacheManager'.static.GetMutatorList(Mutators);
    }
    i = 0;
    J0x36:

    // End:0x70 [Loop If]
    if(i < Mutators.Length)
    {
        // End:0x66
        if(Mutators[i].ClassName ~= ClassName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x36;
    }
    Log(((string(Name) @ "GetMutatorCacheIndex() didn't find index for mutator class '") $ ClassName) $ "'", 'MapVoteDebug');
    return -1;
    //return;    
}

function int GetMapCacheIndex(string MapName)
{
    local int i;

    // End:0x12
    if(MapName == "")
    {
        return -1;
    }
    // End:0x35
    if(Maps.Length == 0)
    {
        Class'Engine.CacheManager'.static.GetMapList(Maps, GetPrefix());
    }
    i = InStr(MapName, "?");
    // End:0x66
    if(i != -1)
    {
        MapName = Left(MapName, i);
    }
    i = 0;
    J0x6D:

    // End:0xA7 [Loop If]
    if(i < Maps.Length)
    {
        // End:0x9D
        if(MapName ~= Maps[i].MapName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x6D;
    }
    Log(((string(Name) @ "GetMapCacheIndex() didn't find index for map '") $ MapName) $ "'", 'MapVoteDebug');
    return -1;
    //return;    
}

function string GetPrefix()
{
    local int i;

    // End:0x2B
    if(GameClassString == "")
    {
        SetGameClassString(string(Level.Game.Class));
    }
    i = GetGameCacheIndex(GameClassString);
    // End:0x5C
    if(i != -1)
    {
        return GameTypes[i].MapPrefix;
    }
    return "";
    //return;    
}

function array<string> GetCurrentMutatorArray()
{
    local string S;
    local array<string> Arr;

    S = ConvertMutatorIndexes();
    Split(S, ",", Arr);
    return Arr;
    //return;    
}

function array<string> GetCurrentMapArray()
{
    local string S;
    local array<string> Arr;

    S = ConvertMapIndexes();
    Split(S, ",", Arr);
    return Arr;
    //return;    
}

function string ConvertMutatorIndexes()
{
    local int i, idx;
    local string str;
    local array<string> Indexes;

    Split(MutatorIndexList, ",", Indexes);
    i = 0;
    J0x16:

    // End:0x91 [Loop If]
    if(i < Indexes.Length)
    {
        idx = int(Indexes[i]);
        // End:0x87
        if((idx >= 0) && idx < Mutators.Length)
        {
            // End:0x6E
            if(str != "")
            {
                str $= ",";
            }
            str $= Mutators[idx].ClassName;
        }
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    return str;
    //return;    
}

function string ConvertMapIndexes()
{
    local int i, idx;
    local string str;
    local array<string> Indexes;

    Split(MapIndexList, ",", Indexes);
    i = 0;
    J0x16:

    // End:0x91 [Loop If]
    if(i < Indexes.Length)
    {
        idx = int(Indexes[i]);
        // End:0x87
        if((idx >= 0) && idx < Maps.Length)
        {
            // End:0x6E
            if(str != "")
            {
                str $= ",";
            }
            str $= Maps[idx].MapName;
        }
        i++;
        // [Loop Continue]
        goto J0x16;
    }
    return str;
    //return;    
}

defaultproperties
{
    lmsgLoadingMatchProfile="?? ????? ?????."
    lmsgRestoringDefaultProfile="??? ?? ????? ?????."
    lmsgDefaultNotAvailable="??? ???? ??."
}