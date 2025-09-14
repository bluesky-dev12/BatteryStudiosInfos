/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\DefaultMapListLoader.uc
 * Package Imports:
 *	xVoting
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:6
 *
 *******************************************************************************/
class DefaultMapListLoader extends MapListLoader
    dependson(MapListLoader)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() bool bUseMapList;
var() array<string> MapListTypeList;
var() string MapNamePrefixes;
var localized string UseMapListPropsDisplayText;
var localized string UserMapListPropDescription;

function LoadMapList(xVotingHandler VotingHandler)
{
    local int P, i;
    local array<string> PrefixList;
    local class<GameInfo> GameClass;

    // End:0x127
    if(bUseMapList)
    {
        Log("Loading Maps from the following MapLists", 'MapVote');
        // End:0xdb
        if(MapListTypeList.Length == 0)
        {
            i = 0;
            J0x4d:
            // End:0xd8 [While If]
            if(i < VotingHandler.GameConfig.Length)
            {
                GameClass = class<GameInfo>(DynamicLoadObject(VotingHandler.GameConfig[i].GameClass, class'Class'));
                // End:0xce
                if(GameClass != none)
                {
                    Log(GameClass.default.MapListType, 'MapVote');
                    LoadFromMapList(GameClass.default.MapListType, VotingHandler);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x4d;
            }
        }
        // End:0x124
        else
        {
            i = 0;
            J0xe2:
            // End:0x124 [While If]
            if(i < MapListTypeList.Length)
            {
                Log(MapListTypeList[i], 'MapVote');
                LoadFromMapList(MapListTypeList[i], VotingHandler);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xe2;
            }
        }
    }
    // End:0x232
    else
    {
        Log("Loading Maps from Maps dir. " $ MapNamePrefixes, 'MapVote');
        // End:0x1d3
        if(MapNamePrefixes == "")
        {
            i = 0;
            J0x166:
            // End:0x1d3 [While If]
            if(i < VotingHandler.GameConfig.Length)
            {
                MapNamePrefixes $= VotingHandler.GameConfig[i].Prefix;
                // End:0x1c9
                if(i < VotingHandler.GameConfig.Length - 1)
                {
                    MapNamePrefixes $= ",";
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x166;
            }
        }
        PrefixList.Length = 0;
        P = Split(MapNamePrefixes, ",", PrefixList);
        // End:0x232
        if(P > 0)
        {
            i = 0;
            J0x202:
            // End:0x232 [While If]
            if(i < PrefixList.Length)
            {
                LoadFromPreFix(PrefixList[i], VotingHandler);
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x202;
            }
        }
    }
}

function LoadFromPreFix(string Prefix, xVotingHandler VotingHandler)
{
    local string FirstMap, NextMap, MapName, TestMap;
    local int Z;

    FirstMap = Level.GetMapName(Prefix, "", 0);
    NextMap = FirstMap;
    J0x25:
    // End:0xbb [While If]
    if(!FirstMap ~= TestMap)
    {
        MapName = NextMap;
        Z = InStr(Caps(MapName), ".ebtr");
        // End:0x78
        if(Z != -1)
        {
            MapName = Left(MapName, Z);
        }
        VotingHandler.AddMap(MapName, "", "");
        NextMap = Level.GetMapName(Prefix, NextMap, 1);
        TestMap = NextMap;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
}

function LoadFromMapList(string MapListType, xVotingHandler VotingHandler)
{
    local string Mutators, GameOptions;
    local class<MapList> MapListClass;
    local string MapName;
    local array<string> Parts, Maps;
    local int Z, X, P, i;

    MapListClass = class<MapList>(DynamicLoadObject(MapListType, class'Class'));
    // End:0x56
    if(MapListClass == none)
    {
        Log("___Couldn't load maplist type:" $ MapListType, 'MapVote');
        return;
    }
    Maps = MapListClass.static.StaticGetMaps();
    i = 0;
    J0x72:
    // End:0x1e8 [While If]
    if(i < Maps.Length)
    {
        Mutators = "";
        GameOptions = "";
        MapName = Maps[i];
        Parts.Length = 0;
        P = Split(MapName, "?", Parts);
        // End:0x189
        if(P > 1)
        {
            MapName = Parts[0];
            X = 1;
            J0xdf:
            // End:0x189 [While If]
            if(X < Parts.Length)
            {
                // End:0x125
                if(Left(Parts[X], 8) ~= "mutator=")
                {
                    Mutators = Mid(Parts[X], 8);
                }
                // End:0x17f
                else
                {
                    // End:0x17f
                    if(!Left(Parts[X], 5) ~= "Game=")
                    {
                        // End:0x162
                        if(GameOptions == "")
                        {
                            GameOptions = Parts[X];
                        }
                        // End:0x17f
                        else
                        {
                            GameOptions = GameOptions $ "?" $ Parts[X];
                        }
                    }
                }
                ++ X;
                // This is an implied JumpToken; Continue!
                goto J0xdf;
            }
        }
        Z = InStr(Caps(MapName), ".ebtr");
        // End:0x1c0
        if(Z != -1)
        {
            MapName = Left(MapName, Z);
        }
        VotingHandler.AddMap(MapName, Mutators, GameOptions);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x72;
    }
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.MapVoteGroup, "bUseMapList", default.UseMapListPropsDisplayText, 0, 1, "Check",,, true, true);
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x14
    if(class'LevelInfo'.static.IsDemoBuild())
    {
        return false;
    }
    switch(PropertyName)
    {
        // End:0x2e
        case "bUserMapList":
            return true;
        // End:0xffff
        default:
            return super(Info).AcceptPlayInfoProperty(PropertyName);
    }
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1d
        case "bUseMapList":
            return default.UserMapListPropDescription;
        // End:0xffff
        default:
            return "";
    }
}

defaultproperties
{
    UseMapListPropsDisplayText="Use MapLists"
    UserMapListPropDescription="If enabled, the map lists are used instead of showing all map names."
}