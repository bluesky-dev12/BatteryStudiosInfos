class DefaultMapListLoader extends MapListLoader
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
    local Class<GameInfo> GameClass;

    // End:0x127
    if(bUseMapList)
    {
        Log("Loading Maps from the following MapLists", 'MapVote');
        // End:0xDB
        if(MapListTypeList.Length == 0)
        {
            i = 0;
            J0x4D:

            // End:0xD8 [Loop If]
            if(i < VotingHandler.GameConfig.Length)
            {
                GameClass = Class<GameInfo>(DynamicLoadObject(VotingHandler.GameConfig[i].GameClass, Class'Core.Class'));
                // End:0xCE
                if(GameClass != none)
                {
                    Log(GameClass.default.MapListType, 'MapVote');
                    LoadFromMapList(GameClass.default.MapListType, VotingHandler);
                }
                i++;
                // [Loop Continue]
                goto J0x4D;
            }            
        }
        else
        {
            i = 0;
            J0xE2:

            // End:0x124 [Loop If]
            if(i < MapListTypeList.Length)
            {
                Log(MapListTypeList[i], 'MapVote');
                LoadFromMapList(MapListTypeList[i], VotingHandler);
                i++;
                // [Loop Continue]
                goto J0xE2;
            }
        }        
    }
    else
    {
        Log("Loading Maps from Maps dir. " $ MapNamePrefixes, 'MapVote');
        // End:0x1D3
        if(MapNamePrefixes == "")
        {
            i = 0;
            J0x166:

            // End:0x1D3 [Loop If]
            if(i < VotingHandler.GameConfig.Length)
            {
                MapNamePrefixes $= VotingHandler.GameConfig[i].Prefix;
                // End:0x1C9
                if(i < (VotingHandler.GameConfig.Length - 1))
                {
                    MapNamePrefixes $= ",";
                }
                i++;
                // [Loop Continue]
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

            // End:0x232 [Loop If]
            if(i < PrefixList.Length)
            {
                LoadFromPreFix(PrefixList[i], VotingHandler);
                i++;
                // [Loop Continue]
                goto J0x202;
            }
        }
    }
    //return;    
}

function LoadFromPreFix(string Prefix, xVotingHandler VotingHandler)
{
    local string FirstMap, NextMap, MapName, TestMap;
    local int Z;

    FirstMap = Level.GetMapName(Prefix, "", 0);
    NextMap = FirstMap;
    J0x25:

    // End:0xBB [Loop If]
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
        // [Loop Continue]
        goto J0x25;
    }
    //return;    
}

function LoadFromMapList(string MapListType, xVotingHandler VotingHandler)
{
    local string Mutators, GameOptions;
    local Class<MapList> MapListClass;
    local string MapName;
    local array<string> Parts, Maps;
    local int Z, X, P, i;

    MapListClass = Class<MapList>(DynamicLoadObject(MapListType, Class'Core.Class'));
    // End:0x56
    if(MapListClass == none)
    {
        Log("___Couldn't load maplist type:" $ MapListType, 'MapVote');
        return;
    }
    Maps = MapListClass.static.StaticGetMaps();
    i = 0;
    J0x72:

    // End:0x1E8 [Loop If]
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
            J0xDF:

            // End:0x189 [Loop If]
            if(X < Parts.Length)
            {
                // End:0x125
                if(Left(Parts[X], 8) ~= "mutator=")
                {
                    Mutators = Mid(Parts[X], 8);
                    // [Explicit Continue]
                    goto J0x17F;
                }
                // End:0x17F
                if(!Left(Parts[X], 5) ~= "Game=")
                {
                    // End:0x162
                    if(GameOptions == "")
                    {
                        GameOptions = Parts[X];
                        // [Explicit Continue]
                        goto J0x17F;
                    }
                    GameOptions = (GameOptions $ "?") $ Parts[X];
                }
                J0x17F:

                X++;
                // [Loop Continue]
                goto J0xDF;
            }
        }
        Z = InStr(Caps(MapName), ".ebtr");
        // End:0x1C0
        if(Z != -1)
        {
            MapName = Left(MapName, Z);
        }
        VotingHandler.AddMap(MapName, Mutators, GameOptions);
        i++;
        // [Loop Continue]
        goto J0x72;
    }
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.MapVoteGroup, "bUseMapList", default.UseMapListPropsDisplayText, 0, 1, "Check",,, true, true);
    //return;    
}

static event bool AcceptPlayInfoProperty(string PropertyName)
{
    // End:0x14
    if(Class'Engine.LevelInfo'.static.IsDemoBuild())
    {
        return false;
    }
    switch(PropertyName)
    {
        // End:0x2E
        case "bUserMapList":
            return true;
        // End:0xFFFF
        default:
            return super(Info).AcceptPlayInfoProperty(PropertyName);
            break;
    }
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x1D
        case "bUseMapList":
            return default.UserMapListPropDescription;
        // End:0xFFFF
        default:
            return "";
            break;
    }
    //return;    
}

defaultproperties
{
    UseMapListPropsDisplayText="Use MapLists"
    UserMapListPropDescription="If enabled, the map lists are used instead of showing all map names."
}