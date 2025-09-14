class UdpGamespyQuery extends UdpLink
    transient
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() name QueryName;
var int CurrentQueryNum;
var string ReplyData;
var int MinNetVer;
var int OldQueryPortNumber;
var bool bRestartServerOnPortSwap;
var bool bDebugPortSwaps;

function PreBeginPlay()
{
    local int boundport, requestport;

    Tag = QueryName;
    requestport = Level.Game.GetServerPort() + 10;
    boundport = BindPort(requestport, true);
    // End:0x74
    if(boundport == 0)
    {
        Log("UdpServerQuery: Port failed to bind.");
        return;
    }
    Log(("UdpServerQuery(crt): Port " $ string(boundport)) $ " successfully bound.");
    // End:0x175
    if(bRestartServerOnPortSwap)
    {
        // End:0x167
        if(OldQueryPortNumber != 0)
        {
            // End:0x167
            if(OldQueryPortNumber != boundport)
            {
                Log((((("PORTSWAP detected, exiting...  old port: " $ string(OldQueryPortNumber)) $ ", new port: ") $ string(boundport)) $ ", requested port: ") $ string(requestport));
                // End:0x158
                if(bDebugPortSwaps)
                {
                    DebugPortSwap(Level);
                }
                assert(OldQueryPortNumber == boundport);
            }
        }
        OldQueryPortNumber = boundport;
        SaveConfig();
    }
    //return;    
}

static function DebugPortSwap(Actor Ref)
{
    local array<UdpGamespyQuery> Queries;
    local array<Object> Referencers;
    local UdpGamespyQuery q;
    local int i, j;
    local string str;

    Log("***************");
    Log(" Complete OBJ LIST:");
    Ref.ConsoleCommand("obj list", true);
    Log("***************");
    Log("");
    Log("Current UdpGameSpyQuery objects:");
    // End:0xAB
    foreach Ref.AllObjects(Class'IpDrv_Decompressed.UdpGamespyQuery', q)
    {
        Queries[Queries.Length] = q;        
    }    
    // End:0xDF
    if(Queries.Length == 0)
    {
        Log("No UdpGamespyQuery objects found!");
        return;
    }
    Ref.ConsoleCommand("obj list class=udpgamespyquery", true);
    Log("***************");
    Log("Tracing UdpGamespyQuery objects");
    i = 0;
    J0x14D:

    // End:0x3B2 [Loop If]
    if(i < Queries.Length)
    {
        str = GetFullName(Queries[i]);
        Log("===================================================================");
        Log((" Referencers of '" $ str) $ "'");
        Ref.ConsoleCommand("obj refs class=udpgamespyquery name=" $ str, true);
        Ref.GetReferencers(Queries[i], Referencers);
        j = 0;
        J0x240:

        // End:0x35D [Loop If]
        if(j < Referencers.Length)
        {
            // End:0x353
            if((Level(Referencers[j]) == none) && GameEngine(Referencers[j]) == none)
            {
                str = GetFullName(Referencers[j]);
                Log("");
                Log((" Referencers of '" $ str) $ "'");
                Ref.ConsoleCommand((("obj refs class=" $ string(Referencers[j].Class)) $ " name=") $ str, true);
                Log("**************************************************************************");
            }
            j++;
            // [Loop Continue]
            goto J0x240;
        }
        Log("===================================================================");
        Log("");
        i++;
        // [Loop Continue]
        goto J0x14D;
    }
    Log("Performing garbage collection");
    Ref.ConsoleCommand("obj garbage", true);
    Log("***************");
    Log("Remaining UdpGameSpyQuery objects:");
    Ref.ConsoleCommand("obj list class=udpgamespyquery", true);
    Log("***************");
    //return;    
}

static function string GetFullName(Object obj)
{
    local string FullName;
    local array<Object> Outers;
    local int i;

    // End:0x0E
    if(obj == none)
    {
        return "";
    }
    Outers[0] = obj;
    J0x1B:

    // End:0x54 [Loop If]
    if(Outers[0].Outer != none)
    {
        Outers.Insert(0, 1);
        Outers[0] = Outers[1].Outer;
        // [Loop Continue]
        goto J0x1B;
    }
    i = 0;
    J0x5B:

    // End:0xAC [Loop If]
    if(i < Outers.Length)
    {
        // End:0x83
        if(FullName != "")
        {
            FullName $= ".";
        }
        FullName $= string(Outers[i].Name);
        i++;
        // [Loop Continue]
        goto J0x5B;
    }
    return FullName;
    //return;    
}

event ReceivedText(IpAddr Addr, string Text)
{
    local string Query;
    local bool QueryRemaining;
    local int QueryNum, PacketNum;

    CurrentQueryNum++;
    // End:0x1A
    if(CurrentQueryNum > 100)
    {
        CurrentQueryNum = 1;
    }
    QueryNum = CurrentQueryNum;
    Query = Text;
    // End:0x47
    if(Query == "")
    {
        QueryRemaining = false;        
    }
    else
    {
        QueryRemaining = true;
    }
    PacketNum = 0;
    ReplyData = "";
    J0x5E:

    // End:0xA9 [Loop If]
    if(QueryRemaining)
    {
        Query = ParseQuery(Addr, Query, QueryNum, PacketNum);
        // End:0x9E
        if(Query == "")
        {
            QueryRemaining = false;            
        }
        else
        {
            QueryRemaining = true;
        }
        // [Loop Continue]
        goto J0x5E;
    }
    //return;    
}

function bool ParseNextQuery(string Query, out string QueryType, out string QueryValue, out string QueryRest, out int bFinalPacket)
{
    local string TempQuery;
    local int ClosingSlash;

    // End:0x0E
    if(Query == "")
    {
        return false;
    }
    // End:0x157
    if(Left(Query, 1) == "\\")
    {
        ClosingSlash = InStr(Right(Query, Len(Query) - 1), "\\");
        // End:0x47
        if(ClosingSlash == 0)
        {
            return false;
        }
        TempQuery = Query;
        QueryType = Right(Query, Len(Query) - 1);
        QueryType = Left(QueryType, ClosingSlash);
        QueryRest = Right(Query, Len(Query) - (Len(QueryType) + 2));
        // End:0xC3
        if((QueryRest == "") || Len(QueryRest) == 1)
        {
            bFinalPacket = 1;
            return true;            
        }
        else
        {
            // End:0xD5
            if(Left(QueryRest, 1) == "\\")
            {
                return true;
            }
        }
        ClosingSlash = InStr(QueryRest, "\\");
        // End:0x105
        if(ClosingSlash >= 0)
        {
            QueryValue = Left(QueryRest, ClosingSlash);            
        }
        else
        {
            QueryValue = QueryRest;
        }
        QueryRest = Right(Query, Len(Query) - ((Len(QueryType) + Len(QueryValue)) + 3));
        // End:0x152
        if(QueryRest == "")
        {
            bFinalPacket = 1;
            return true;            
        }
        else
        {
            return true;
        }        
    }
    else
    {
        return false;
    }
    //return;    
}

function string ParseQuery(IpAddr Addr, coerce string Query, int QueryNum, out int PacketNum)
{
    local string QueryType, QueryValue, QueryRest, ValidationString;
    local bool Result;
    local int bFinalPacket;

    bFinalPacket = 0;
    Result = ParseNextQuery(Query, QueryType, QueryValue, QueryRest, bFinalPacket);
    // End:0x3B
    if(!Result)
    {
        return "";
    }
    // End:0x76
    if(QueryType == "basic")
    {
        Result = SendQueryPacket(Addr, GetBasic(), QueryNum, PacketNum, bFinalPacket);        
    }
    else
    {
        // End:0xB0
        if(QueryType == "info")
        {
            Result = SendQueryPacket(Addr, GetInfo(), QueryNum, PacketNum, bFinalPacket);            
        }
        else
        {
            // End:0xEB
            if(QueryType == "rules")
            {
                Result = SendQueryPacket(Addr, GetRules(), QueryNum, PacketNum, bFinalPacket);                
            }
            else
            {
                // End:0x165
                if(QueryType == "players")
                {
                    // End:0x13F
                    if(Level.Game.NumPlayers > 0)
                    {
                        Result = SendPlayers(Addr, QueryNum, PacketNum, bFinalPacket);                        
                    }
                    else
                    {
                        Result = SendQueryPacket(Addr, "", QueryNum, PacketNum, bFinalPacket);
                    }                    
                }
                else
                {
                    // End:0x24B
                    if(QueryType == "status")
                    {
                        Result = SendQueryPacket(Addr, GetBasic(), QueryNum, PacketNum, 0);
                        Result = SendQueryPacket(Addr, GetInfo(), QueryNum, PacketNum, 0);
                        // End:0x204
                        if(Level.Game.NumPlayers == 0)
                        {
                            Result = SendQueryPacket(Addr, GetRules(), QueryNum, PacketNum, bFinalPacket);                            
                        }
                        else
                        {
                            Result = SendQueryPacket(Addr, GetRules(), QueryNum, PacketNum, 0);
                            Result = SendPlayers(Addr, QueryNum, PacketNum, bFinalPacket);
                        }                        
                    }
                    else
                    {
                        // End:0x292
                        if(QueryType == "echo")
                        {
                            Result = SendQueryPacket(Addr, "\\ignoring\\" $ QueryValue, QueryNum, PacketNum, bFinalPacket);                            
                        }
                        else
                        {
                            // End:0x2EC
                            if(QueryType == "secure")
                            {
                                ValidationString = "\\validate\\" $ (GameSpyValidate(QueryValue));
                                Result = SendQueryPacket(Addr, ValidationString, QueryNum, PacketNum, bFinalPacket);                                
                            }
                            else
                            {
                                // End:0x335
                                if(QueryType == "level_property")
                                {
                                    Result = SendQueryPacket(Addr, GetLevelProperty(QueryValue), QueryNum, PacketNum, bFinalPacket);                                    
                                }
                                else
                                {
                                    // End:0x37D
                                    if(QueryType == "game_property")
                                    {
                                        Result = SendQueryPacket(Addr, GetGameProperty(QueryValue), QueryNum, PacketNum, bFinalPacket);                                        
                                    }
                                    else
                                    {
                                        // End:0x3C4
                                        if(QueryType == "player_property")
                                        {
                                            Result = SendQueryPacket(Addr, GetPlayerProperty(QueryValue), QueryNum, PacketNum, bFinalPacket);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return QueryRest;
    //return;    
}

function bool SendAPacket(IpAddr Addr, int QueryNum, out int PacketNum, int bFinalPacket)
{
    local bool Result;

    ReplyData = (((ReplyData $ "\\queryid\\") $ string(QueryNum)) $ ".") $ string(++PacketNum);
    // End:0x52
    if(bFinalPacket == 1)
    {
        ReplyData = ReplyData $ "\\final\\";
    }
    Result = SendText(Addr, ReplyData);
    ReplyData = "";
    return Result;
    //return;    
}

function bool SendQueryPacket(IpAddr Addr, coerce string SendString, int QueryNum, out int PacketNum, int bFinalPacket)
{
    local bool Result;

    Result = true;
    // End:0x3F
    if((Len(ReplyData) + Len(SendString)) > 1000)
    {
        Result = SendAPacket(Addr, QueryNum, PacketNum, 0);
    }
    ReplyData = ReplyData $ SendString;
    // End:0x7D
    if(bFinalPacket == 1)
    {
        Result = SendAPacket(Addr, QueryNum, PacketNum, bFinalPacket);
    }
    return Result;
    //return;    
}

function string GetBasic()
{
    local string ResultSet;

    ResultSet = "\\gamename\\" $ (GameSpyGameName());
    ResultSet = (ResultSet $ "\\gamever\\") $ Level.EngineVersion;
    // End:0x9E
    if((MinNetVer >= int(Level.MinNetVersion)) && MinNetVer <= int(Level.EngineVersion))
    {
        ResultSet = (ResultSet $ "\\minnetver\\") $ string(MinNetVer);        
    }
    else
    {
        ResultSet = (ResultSet $ "\\minnetver\\") $ Level.MinNetVersion;
    }
    ResultSet = (ResultSet $ "\\location\\") $ string(Class'IpDrv_Decompressed.UdpGamespyUplink'.default.ServerRegion);
    return ResultSet;
    //return;    
}

function string GetInfo()
{
    local string ResultSet, ServerName;
    local int NumPlayers;

    ServerName = Level.Game.GameReplicationInfo.ServerName;
    ReplaceText(ServerName, "\\", "");
    ResultSet = "\\hostname\\" $ ServerName;
    ResultSet = (ResultSet $ "\\hostport\\") $ string(Level.Game.GetServerPort());
    ResultSet = (ResultSet $ "\\maptitle\\") $ Level.Title;
    ResultSet = (ResultSet $ "\\mapname\\") $ Left(string(Level), InStr(string(Level), "."));
    ResultSet = (ResultSet $ "\\gametype\\") $ (GetItemName(string(Level.Game.Class)));
    NumPlayers = Level.Game.GetNumPlayers();
    // End:0x179
    if(NumPlayers == 0)
    {
        NumPlayers = Min(Level.Game.MultiMinPlayers(), Level.Game.MaxPlayers - 1);
    }
    ResultSet = (ResultSet $ "\\numplayers\\") $ string(NumPlayers);
    ResultSet = (ResultSet $ "\\maxplayers\\") $ string(Level.Game.MaxPlayers);
    ResultSet = ResultSet $ "\\gamemode\\openplaying";
    ResultSet = (ResultSet $ "\\gamever\\") $ Level.EngineVersion;
    // End:0x27B
    if((MinNetVer >= int(Level.MinNetVersion)) && MinNetVer <= int(Level.EngineVersion))
    {
        ResultSet = (ResultSet $ "\\minnetver\\") $ string(MinNetVer);        
    }
    else
    {
        ResultSet = (ResultSet $ "\\minnetver\\") $ Level.MinNetVersion;
    }
    return ResultSet;
    //return;    
}

function string GetRules()
{
    local string ResultSet;

    // End:0x63
    if(Level.Game.GameReplicationInfo.AdminName != "")
    {
        ResultSet = (ResultSet $ "\\AdminName\\") $ Level.Game.GameReplicationInfo.AdminName;
    }
    // End:0xC7
    if(Level.Game.GameReplicationInfo.AdminEmail != "")
    {
        ResultSet = (ResultSet $ "\\AdminEMail\\") $ Level.Game.GameReplicationInfo.AdminEmail;
    }
    // End:0x127
    if((Level.Game.AccessControl != none) && Level.Game.AccessControl.RequiresPassword())
    {
        ResultSet = ResultSet $ "\\password\\1";        
    }
    else
    {
        ResultSet = ResultSet $ "\\password\\0";
    }
    return ResultSet;
    //return;    
}

function string GetPlayer(PlayerController P, int PlayerNum)
{
    local string ResultSet, PlayerName;

    PlayerName = P.PlayerReplicationInfo.PlayerName;
    ReplaceText(PlayerName, "\\", "");
    ResultSet = (("\\player_" $ string(PlayerNum)) $ "\\") $ PlayerName;
    ResultSet = (((ResultSet $ "\\frags_") $ string(PlayerNum)) $ "\\") $ string(int(P.PlayerReplicationInfo.Score));
    ResultSet = (((ResultSet $ "\\ping_") $ string(PlayerNum)) $ "\\") $ P.ConsoleCommand("GETPING");
    // End:0x137
    if(P.PlayerReplicationInfo.Team != none)
    {
        ResultSet = (((ResultSet $ "\\team_") $ string(PlayerNum)) $ "\\") $ string(P.PlayerReplicationInfo.Team.TeamIndex);        
    }
    else
    {
        ResultSet = ((ResultSet $ "\\team_") $ string(PlayerNum)) $ "\\0";
    }
    return ResultSet;
    //return;    
}

function bool SendPlayers(IpAddr Addr, int QueryNum, out int PacketNum, int bFinalPacket)
{
    local Controller C;
    local int i;
    local bool Result, SendResult;

    Result = false;
    C = Level.ControllerList;
    J0x1C:

    // End:0x1A9 [Loop If]
    if(i < Level.Game.NumPlayers)
    {
        // End:0x92
        if(C == none)
        {
            // End:0x74
            if(bFinalPacket == 1)
            {
                SendResult = SendAPacket(Addr, QueryNum, PacketNum, bFinalPacket);
            }
            Result = SendResult || Result;
            // [Explicit Break]
            goto J0x1A9;            
        }
        else
        {
            // End:0x192
            if((C.IsA('PlayerController') && C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
            {
                // End:0x141
                if((i == (Level.Game.NumPlayers - 1)) && bFinalPacket == 1)
                {
                    SendResult = SendQueryPacket(Addr, GetPlayer(PlayerController(C), i), QueryNum, PacketNum, 1);                    
                }
                else
                {
                    SendResult = SendQueryPacket(Addr, GetPlayer(PlayerController(C), i), QueryNum, PacketNum, 0);
                }
                Result = SendResult || Result;
                i++;
            }
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1C;
    }
    J0x1A9:

    return Result;
    //return;    
}

function string GetLevelProperty(string Prop)
{
    local string ResultSet;

    ResultSet = (("\\" $ Prop) $ "\\") $ Level.GetPropertyText(Prop);
    return ResultSet;
    //return;    
}

function string GetGameProperty(string Prop)
{
    local string ResultSet;

    ResultSet = (("\\" $ Prop) $ "\\") $ Level.Game.GetPropertyText(Prop);
    return ResultSet;
    //return;    
}

function string GetPlayerProperty(string Prop)
{
    local string ResultSet;
    local int i;
    local Controller C;

    // End:0x8B
    foreach AllActors(Class'Engine.Controller', C)
    {
        // End:0x8A
        if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bBot)
        {
            i++;
            ResultSet = (((((ResultSet $ "\\") $ Prop) $ "_") $ string(i)) $ "\\") $ C.GetPropertyText(Prop);
        }        
    }    
    return ResultSet;
    //return;    
}

defaultproperties
{
    QueryName="MasterUplink"
    bRestartServerOnPortSwap=true
    bDebugPortSwaps=true
}