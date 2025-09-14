/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchConfig.uc
 * Package Imports:
 *	xVoting
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:23
 *	Functions:25
 *
 *******************************************************************************/
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
    // End:0x0d
    if(Lv == none)
    {
        return;
    }
    Level = Lv;
    PInfo = new (none) class'PlayInfo';
    MapHandler = MaplistManager(Level.Game.MaplistHandler);
    class'CacheManager'.static.GetGameTypeList(GameTypes);
    class'CacheManager'.static.GetMutatorList(Mutators);
    LoadDefaults();
}

function LoadDefaults()
{
    SetGameClassString(DefaultGameClassString);
    Parameters = DefaultParameters;
    bTournamentMode = DefaultTournamentMode;
    DemoRecFileName = DefaultDemoRecFileName;
    LoadDefaultMutators();
    LoadDefaultMaps();
}

function LoadDefaultMutators()
{
    local array<string> Classes;
    local int i, idx;

    MutatorIndexList = "";
    // End:0x25
    if(Mutators.Length == 0)
    {
        class'CacheManager'.static.GetMutatorList(Mutators);
    }
    Split(DefaultMutatorsString, ",", Classes);
    i = 0;
    J0x3b:
    // End:0xa3 [While If]
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
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
}

function LoadCurrentMutators()
{
    local int idx;
    local Mutator M;

    MutatorIndexList = "";
    // End:0x25
    if(Mutators.Length == 0)
    {
        class'CacheManager'.static.GetMutatorList(Mutators);
    }
    M = Level.Game.BaseMutator.NextMutator;
    J0x4b:
    // End:0xc0 [While If]
    if(M != none)
    {
        idx = GetMutatorCacheIndex(string(M.Class));
        // End:0xa9
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
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
}

function LoadDefaultMaps()
{
    local int i, MapIndex;
    local array<string> MapArr;

    MapIndexList = "";
    UpdateRecordIndex();
    // End:0xab
    if(RecordIndex != -1)
    {
        MapArr = MapHandler.GetMapList(GameIndex, RecordIndex);
        i = 0;
        J0x43:
        // End:0xab [While If]
        if(i < MapArr.Length)
        {
            MapIndex = GetMapCacheIndex(MapArr[i]);
            // End:0xa1
            if(MapIndex != -1)
            {
                // End:0x91
                if(MapIndexList != "")
                {
                    MapIndexList $= ",";
                }
                MapIndexList $= string(MapIndex);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x43;
        }
    }
}

function SetGameClassString(string NewString)
{
    local int idx;

    // End:0x0e
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
    J0x5a:
    // End:0x126 [While If]
    if(X < ParamArray.Length)
    {
        // End:0x9a
        if(!Divide(ParamArray[X], "=", LeftPart, RightPart))
        {
            LeftPart = ParamArray[X];
        }
        // End:0xc1
        if(LeftPart ~= "Tournament")
        {
            bTournamentMode = bool(RightPart);
        }
        // End:0x11c
        else
        {
            // End:0xe2
            if(LeftPart ~= "DemoRec")
            {
                DemoRecFileName = RightPart;
            }
            // End:0x11c
            else
            {
                // End:0x11c
                if(IncludeParam(LeftPart))
                {
                    // End:0x108
                    if(Parameters != "")
                    {
                        Parameters $= ";";
                    }
                    Parameters $= ParamArray[X];
                }
            }
        }
        ++ X;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    LoadPlayInfo();
    LoadMapList();
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
        // End:0x5e
        case "MUTATOR":
        // End:0x68
        case "CLASS":
        // End:0x77
        case "TOURNAMENT":
        // End:0x83
        case "NUMBOTS":
        // End:0x94
        case "BAUTONUMBOTS":
        // End:0xa2
        case "DEMOREC":
            return false;
        // End:0xffff
        default:
            return true;
    }
}

function LoadPlayInfo()
{
    local int i, j;
    local class<GameInfo> GameClass;
    local class<AccessControl> ACClass;
    local array< class<Info> > PIClasses;
    local class<Mutator> mutClass;
    local array<string> MutClassNames;

    PInfo.Clear();
    GameClass = class<GameInfo>(DynamicLoadObject(GameClassString, class'Class'));
    // End:0x137
    if(GameClass != none)
    {
        PIClasses[++ i] = GameClass;
        ACClass = class<AccessControl>(DynamicLoadObject(GameClass.default.AccessControlClass, class'Class'));
        // End:0x87
        if(ACClass != none)
        {
            PIClasses[++ i] = ACClass;
        }
        MutClassNames = GetCurrentMutatorArray();
        MutClassNames.Insert(0, 1);
        MutClassNames[0] = GameClass.default.MutatorClass;
        j = 0;
        J0xb8:
        // End:0x123 [While If]
        if(j < MutClassNames.Length)
        {
            // End:0xfb
            if(MutClassNames[j] != "")
            {
                mutClass = class<Mutator>(DynamicLoadObject(MutClassNames[j], class'Class'));
            }
            // End:0x119
            if(mutClass != none)
            {
                PIClasses[++ i] = mutClass;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xb8;
        }
        PInfo.Init(PIClasses);
    }
}

function LoadMapList()
{
    local int i, MapIndex;
    local array<string> MapArr;

    MapIndexList = "";
    UpdateRecordIndex();
    // End:0x9c
    if(RecordIndex != -1)
    {
        MapArr = MapHandler.GetMapList(GameIndex, RecordIndex);
        i = 0;
        J0x43:
        // End:0x9c [While If]
        if(i < MapArr.Length)
        {
            MapIndex = GetMapCacheIndex(MapArr[i]);
            // End:0x82
            if(MapIndexList != "")
            {
                MapIndexList $= ",";
            }
            MapIndexList $= string(MapIndex);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x43;
        }
    }
}

function bool ChangeSetting(string SettingName, string NewValue)
{
    local xVotingHandler VH;
    local int i;
    local bool bFound;

    Log("____ChangeSetting(" $ SettingName $ ", " $ NewValue $ ")", 'MapVoteDebug');
    VH = xVotingHandler(Level.Game.VotingHandler);
    switch(SettingName)
    {
        // End:0xff
        case class'VotingReplicationInfo'.default.GameTypeID:
            // End:0xfd
            if(!NewValue ~= GameClassString)
            {
                bFound = false;
                i = 0;
                J0x8e:
                // End:0xcd [While If]
                if(i < GameTypes.Length)
                {
                    // End:0xc3
                    if(GameTypes[i].ClassName ~= NewValue)
                    {
                        bFound = true;
                    }
                    // End:0xcd
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x8e;
                    }
                }
                // End:0xda
                if(!bFound)
                {
                    return false;
                }
                SetGameClassString(NewValue);
                Reload(true);
                VH.ReloadMatchConfig(true, false);
            }
            return true;
        // End:0x11d
        case class'VotingReplicationInfo'.default.MapID:
            MapIndexList = NewValue;
            return true;
        // End:0x162
        case class'VotingReplicationInfo'.default.MutatorID:
            // End:0x160
            if(MutatorIndexList != NewValue)
            {
                MutatorIndexList = NewValue;
                Reload(false);
                VH.ReloadMatchConfig(false, false);
            }
            return true;
        // End:0x180
        case class'VotingReplicationInfo'.default.OptionID:
            Parameters = NewValue;
            return true;
        // End:0x1a1
        case class'VotingReplicationInfo'.default.TournamentID:
            bTournamentMode = bool(NewValue);
            return true;
        // End:0x1bf
        case class'VotingReplicationInfo'.default.DemoRecID:
            DemoRecFileName = NewValue;
            return true;
        // End:0xffff
        default:
            i = PInfo.FindIndex(SettingName);
            // End:0x200
            if(i > -1)
            {
                PInfo.StoreSetting(i, NewValue);
                return true;
            }
            return false;
    }
}

function Reload(bool bReloadMapList)
{
    LoadPlayInfo();
    // End:0x15
    if(bReloadMapList)
    {
        LoadMapList();
    }
}

function SaveDefault()
{
    local int i;

    Log("Saving Default settings to MatchConfig.ini - [" $ string(Name) $ "]");
    DefaultGameClassString = GameClassString;
    DefaultMutatorsString = ConvertMutatorIndexes();
    DefaultParameters = Parameters;
    DefaultTournamentMode = bTournamentMode;
    DefaultDemoRecFileName = DemoRecFileName;
    Settings.Length = PInfo.Settings.Length;
    i = 0;
    J0x97:
    // End:0x132 [While If]
    if(i < PInfo.Settings.Length)
    {
        // End:0x128
        if(ArrayProperty(PInfo.Settings[i].ThisProp) == none)
        {
            Settings[i].SettingName = PInfo.Settings[i].SettingName;
            Settings[i].SettingValue = PInfo.Settings[i].Value;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x97;
    }
    SaveMapList();
    SaveConfig();
}

function RestoreDefault(Actor Requestor)
{
    local int i, j;
    local xVotingHandler VH;

    Log("___RestoreDefault()", 'MapVoteDebug');
    // End:0x2e
    if(PlayerController(Requestor) == none)
    {
        return;
    }
    LoadDefaults();
    Log("MapIndexList = " $ MapIndexList, 'MapVoteDebug');
    // End:0x88
    if(GameClassString == "" || MapIndexList == "")
    {
        PlayerController(Requestor).ClientMessage(lmsgDefaultNotAvailable);
        return;
    }
    LoadPlayInfo();
    i = 0;
    J0x95:
    // End:0x14f [While If]
    if(i < Settings.Length)
    {
        j = 0;
        J0xac:
        // End:0x145 [While If]
        if(j < PInfo.Settings.Length)
        {
            // End:0x13b
            if(ArrayProperty(PInfo.Settings[i].ThisProp) == none)
            {
                // End:0x13b
                if(Settings[i].SettingName ~= PInfo.Settings[j].SettingName)
                {
                    PInfo.StoreSetting(j, Settings[i].SettingValue);
                }
                // End:0x145
                else
                {
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0xac;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x95;
    }
    Level.Game.Broadcast(Level.Game.VotingHandler, lmsgRestoringDefaultProfile);
    VH = xVotingHandler(Level.Game.VotingHandler);
    // End:0x1c1
    if(VH != none)
    {
        VH.ReloadMatchConfig(true, true);
    }
}

function StartMatch()
{
    local string ServerTravelString, mutstring;
    local class<GameInfo> GameClass;
    local int i;

    SaveDefault();
    PInfo.SaveSettings();
    Level.Game.Broadcast(Level.Game.VotingHandler, lmsgLoadingMatchProfile);
    xVotingHandler(Level.Game.VotingHandler).CloseAllVoteWindows();
    mutstring = ConvertMutatorIndexes();
    // End:0x9c
    if(mutstring != "")
    {
        mutstring = "?mutator=" $ mutstring;
    }
    ServerTravelString = MapHandler.GetActiveMapName(GameIndex, RecordIndex) $ "?Game=" $ GameClassString $ mutstring;
    ServerTravelString $= "?" $ Eval(bTournamentMode, "TOURNAMENT=1", "TOURNAMENT=0");
    // End:0x12c
    if(DemoRecFileName != "")
    {
        ServerTravelString $= "?DemoRec=" $ DemoRecFileName;
    }
    // End:0x15a
    if(Parameters != "")
    {
        ServerTravelString $= "?" $ Repl(Repl(Parameters, ",", "?"), " ", "");
    }
    switch(class'UnrealMPGameInfo'.default.BotMode)
    {
        // End:0x1ca
        case 0:
            i = PInfo.FindIndex("MinPlayers");
            // End:0x1c7
            if(i >= 0)
            {
                ServerTravelString $= "?NumBots=" $ PInfo.Settings[i].Value;
            }
            // End:0x2d1
            break;
        // End:0x1ef
        case 1:
            ServerTravelString $= "?bAutoNumBots=True";
            // End:0x2d1
            break;
        // End:0x2ce
        case 2:
            // End:0x28b
            if(GameClass.default.bTeamGame)
            {
                // End:0x246
                if(class'TeamRedConfigured'.default.Characters.Length > 0)
                {
                    ServerTravelString $= "?RedTeam=WGame.TeamRedConfigured";
                }
                // End:0x288
                if(class'TeamBlueConfigured'.default.Characters.Length > 0)
                {
                    ServerTravelString $= "?BlueTeam=WGame.TeamBlueConfigured";
                }
            }
            // End:0x2cb
            else
            {
                // End:0x2cb
                if(class'DMRosterConfigured'.default.Characters.Length > 0)
                {
                    ServerTravelString $= "?DMTeam=WGame.DMRosterConfigured";
                }
            }
            // End:0x2d1
            break;
        // End:0xffff
        default:
            Level.ServerTravel(ServerTravelString, false);
}

function SaveMapList()
{
    local int i;
    local array<string> OldMaps, NewMaps;

    // End:0xd9
    if(MapHandler != none)
    {
        OldMaps = MapHandler.GetMapList(GameIndex, RecordIndex);
        NewMaps = GetCurrentMapArray();
        i = 0;
        J0x3d:
        // End:0x7b [While If]
        if(i < OldMaps.Length)
        {
            MapHandler.RemoveMap(GameIndex, RecordIndex, OldMaps[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3d;
        }
        i = 0;
        J0x82:
        // End:0xc0 [While If]
        if(i < NewMaps.Length)
        {
            MapHandler.AddMap(GameIndex, RecordIndex, NewMaps[i]);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x82;
        }
        MapHandler.ApplyMapList(GameIndex, RecordIndex);
    }
}

function UpdateRecordIndex()
{
    local array<string> Dummy;

    // End:0x30
    if(Level == none || Level.Game == none || MapHandler == none)
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
}

function int GetGameCacheIndex(coerce string ClassName)
{
    local int i;

    // End:0x12
    if(ClassName == "")
    {
        return -1;
    }
    // End:0x2f
    if(GameTypes.Length == 0)
    {
        class'CacheManager'.static.GetGameTypeList(GameTypes);
    }
    i = 0;
    J0x36:
    // End:0x70 [While If]
    if(i < GameTypes.Length)
    {
        // End:0x66
        if(GameTypes[i].ClassName ~= ClassName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    Log(string(Name) @ "GetGameCacheIndex() didn't find index for game class '" $ ClassName $ "'", 'MapVoteDebug');
    return -1;
}

function int GetMutatorCacheIndex(coerce string ClassName)
{
    local int i;

    // End:0x12
    if(ClassName == "")
    {
        return -1;
    }
    // End:0x2f
    if(Mutators.Length == 0)
    {
        class'CacheManager'.static.GetMutatorList(Mutators);
    }
    i = 0;
    J0x36:
    // End:0x70 [While If]
    if(i < Mutators.Length)
    {
        // End:0x66
        if(Mutators[i].ClassName ~= ClassName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    Log(string(Name) @ "GetMutatorCacheIndex() didn't find index for mutator class '" $ ClassName $ "'", 'MapVoteDebug');
    return -1;
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
        class'CacheManager'.static.GetMapList(Maps, GetPrefix());
    }
    i = InStr(MapName, "?");
    // End:0x66
    if(i != -1)
    {
        MapName = Left(MapName, i);
    }
    i = 0;
    J0x6d:
    // End:0xa7 [While If]
    if(i < Maps.Length)
    {
        // End:0x9d
        if(MapName ~= Maps[i].MapName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6d;
    }
    Log(string(Name) @ "GetMapCacheIndex() didn't find index for map '" $ MapName $ "'", 'MapVoteDebug');
    return -1;
}

function string GetPrefix()
{
    local int i;

    // End:0x2b
    if(GameClassString == "")
    {
        SetGameClassString(string(Level.Game.Class));
    }
    i = GetGameCacheIndex(GameClassString);
    // End:0x5c
    if(i != -1)
    {
        return GameTypes[i].MapPrefix;
    }
    return "";
}

function array<string> GetCurrentMutatorArray()
{
    local string S;
    local array<string> Arr;

    S = ConvertMutatorIndexes();
    Split(S, ",", Arr);
    return Arr;
}

function array<string> GetCurrentMapArray()
{
    local string S;
    local array<string> Arr;

    S = ConvertMapIndexes();
    Split(S, ",", Arr);
    return Arr;
}

function string ConvertMutatorIndexes()
{
    local int i, idx;
    local string str;
    local array<string> Indexes;

    Split(MutatorIndexList, ",", Indexes);
    i = 0;
    J0x16:
    // End:0x91 [While If]
    if(i < Indexes.Length)
    {
        idx = int(Indexes[i]);
        // End:0x87
        if(idx >= 0 && idx < Mutators.Length)
        {
            // End:0x6e
            if(str != "")
            {
                str $= ",";
            }
            str $= Mutators[idx].ClassName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
    return str;
}

function string ConvertMapIndexes()
{
    local int i, idx;
    local string str;
    local array<string> Indexes;

    Split(MapIndexList, ",", Indexes);
    i = 0;
    J0x16:
    // End:0x91 [While If]
    if(i < Indexes.Length)
    {
        idx = int(Indexes[i]);
        // End:0x87
        if(idx >= 0 && idx < Maps.Length)
        {
            // End:0x6e
            if(str != "")
            {
                str $= ",";
            }
            str $= Maps[idx].MapName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16;
    }
    return str;
}

defaultproperties
{
    lmsgLoadingMatchProfile="?? ????? ?????."
    lmsgRestoringDefaultProfile="??? ?? ????? ?????."
    lmsgDefaultNotAvailable="??? ???? ??."
}