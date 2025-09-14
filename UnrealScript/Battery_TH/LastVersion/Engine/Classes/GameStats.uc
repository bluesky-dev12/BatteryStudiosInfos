class GameStats extends Info
    native
    config
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var FileLog TempLog;
var GameReplicationInfo GRI;
var bool bShowBots;
var string Tab;
var globalconfig bool bLocalLog;
var globalconfig string LogFileName;

// Export UGameStats::execGetStatsIdentifier(FFrame&, void* const)
native final function string GetStatsIdentifier(Controller C)
{
    //native.C;        
}

// Export UGameStats::execGetMapFileName(FFrame&, void* const)
native final function string GetMapFileName();

function Init()
{
    // End:0x5A
    if(bLocalLog)
    {
        TempLog = Spawn(Class'Engine.FileLog');
        // End:0x3A
        if(TempLog != none)
        {
            TempLog.OpenLog(GetLogFilename());            
        }
        else
        {
            Warn("Could not create output file");
        }
    }
    //return;    
}

function Shutdown()
{
    // End:0x17
    if(TempLog != none)
    {
        TempLog.Destroy();
    }
    //return;    
}

function Logf(string LogString)
{
    // End:0x1F
    if(TempLog != none)
    {
        TempLog.super(GameStats).Logf(LogString);
    }
    //return;    
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Tab = Chr(9);
    Init();
    //return;    
}

event Destroyed()
{
    Shutdown();
    super(Actor).Destroyed();
    //return;    
}

function string TimeStamp()
{
    local string Seconds;

    Seconds = string(Level.TimeSeconds);
    // End:0x41
    if(InStr(Seconds, ".") != -1)
    {
        Seconds = Left(Seconds, InStr(Seconds, "."));
    }
    return Seconds;
    //return;    
}

function string Header()
{
    return (TimeStamp()) $ Tab;
    //return;    
}

function string FullTimeDate()
{
    return (((((((((string(Level.Year) $ "-") $ string(Level.Month)) $ "-") $ string(Level.Day)) $ " ") $ string(Level.Hour)) $ ":") $ string(Level.Minute)) $ ":") $ string(Level.Second);
    //return;    
}

function string TimeZone()
{
    return "0";
    //return;    
}

function string MapName()
{
    local string MapName;

    MapName = GetMapFileName();
    // End:0x3F
    if(InStr(MapName, ".ebtr") != -1)
    {
        MapName = Left(MapName, InStr(MapName, ".ebtr"));
    }
    ReplaceText(MapName, Tab, "_");
    return MapName;
    //return;    
}

function NewGame()
{
    local string Out, tmp, ngTitle, ngAuthor, ngGameGameName;

    local int i;
    local Mutator MyMutie;
    local GameRules MyRules;

    ngTitle = Level.Title;
    ngAuthor = Level.Author;
    ngGameGameName = Level.Game.GameName;
    ReplaceText(ngTitle, Tab, "_");
    ReplaceText(ngAuthor, Tab, "_");
    ReplaceText(ngGameGameName, Tab, "_");
    GRI = Level.Game.GameReplicationInfo;
    Out = ((Header()) $ "NG") $ Tab;
    Out $= ((FullTimeDate()) $ Tab);
    Out $= ((TimeZone()) $ Tab);
    Out $= ((MapName()) $ Tab);
    Out $= (ngTitle $ Tab);
    Out $= (ngAuthor $ Tab);
    Out $= (string(Level.Game.Class) $ Tab);
    Out $= ngGameGameName;
    tmp = "";
    i = 0;
    // End:0x1C4
    foreach AllActors(Class'Engine.Mutator', MyMutie)
    {
        // End:0x1A3
        if(tmp != "")
        {
            tmp $= ("|" $ string(MyMutie.Class));            
        }
        else
        {
            tmp $= string(MyMutie.Class);
        }
        i++;        
    }    
    // End:0x223
    foreach AllActors(Class'Engine.GameRules', MyRules)
    {
        // End:0x202
        if(tmp != "")
        {
            tmp $= ("|" $ string(MyRules.Class));            
        }
        else
        {
            tmp $= string(MyRules.Class);
        }
        i++;        
    }    
    // End:0x264
    if(i > 0)
    {
        ReplaceText(tmp, Tab, "_");
        Out $= ((Tab $ "Mutators=") $ tmp);
    }
    Logf(Out);
    //return;    
}

function ServerInfo()
{
    local string Out, Flags, siServerName, siAdminName, siAdminEmail;

    local ServerResponseLine ServerState;
    local int i;

    siServerName = GRI.ServerName;
    siAdminName = GRI.AdminName;
    siAdminEmail = GRI.AdminEmail;
    ReplaceText(siServerName, Tab, "_");
    ReplaceText(siAdminName, Tab, "_");
    ReplaceText(siAdminEmail, Tab, "_");
    Out = ((Header()) $ "SI") $ Tab;
    Out $= (siServerName $ Tab);
    Out $= ((TimeZone()) $ Tab);
    Out $= (siAdminName $ Tab);
    Out $= (siAdminEmail $ Tab);
    Out $= Tab;
    Flags = "";
    Level.Game.GetServerDetails(ServerState);
    i = 0;
    J0x11D:

    // End:0x17B [Loop If]
    if(i < ServerState.ServerInfo.Length)
    {
        Flags $= ((("\\" $ ServerState.ServerInfo[i].key) $ "\\") $ ServerState.ServerInfo[i].Value);
        i++;
        // [Loop Continue]
        goto J0x11D;
    }
    ReplaceText(Flags, Tab, "_");
    Out $= Flags;
    Logf(Out);
    //return;    
}

function StartGame()
{
    Logf((Header()) $ "SG");
    //return;    
}

function EndGame(string Reason)
{
    local string Out;
    local int i, j;
    local array<PlayerReplicationInfo> pris;
    local PlayerReplicationInfo PRI, t;

    Out = (((Header()) $ "EG") $ Tab) $ Reason;
    i = 0;
    J0x27:

    // End:0x179 [Loop If]
    if(i < GRI.PRIArray.Length)
    {
        PRI = GRI.PRIArray[i];
        // End:0x16F
        if(!PRI.bOnlySpectator && !PRI.bBot)
        {
            pris.Length = pris.Length + 1;
            j = 0;
            J0x9B:

            // End:0x15E [Loop If]
            if(j < (pris.Length - 1))
            {
                // End:0x154
                if((pris[j].Score < PRI.Score) || (pris[j].Score == PRI.Score) && pris[j].Deaths > PRI.Deaths)
                {
                    t = pris[j];
                    pris[j] = PRI;
                    PRI = t;
                }
                j++;
                // [Loop Continue]
                goto J0x9B;
            }
            pris[j] = PRI;
        }
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    i = 0;
    J0x180:

    // End:0x1CE [Loop If]
    if(i < pris.Length)
    {
        Out $= (Tab $ string(Controller(pris[i].Owner).PlayerNum));
        i++;
        // [Loop Continue]
        goto J0x180;
    }
    Logf(Out);
    //return;    
}

function ConnectEvent(PlayerReplicationInfo Who)
{
    local string Out;

    // End:0x28
    if(Who.bBot || Who.bOnlySpectator)
    {
        return;
    }
    Out = ((((Header()) $ "C") $ Tab) $ string(Controller(Who.Owner).PlayerNum)) $ Tab;
    Out $= GetStatsIdentifier(Controller(Who.Owner));
    Logf(Out);
    //return;    
}

function DisconnectEvent(PlayerReplicationInfo Who)
{
    local string Out;

    // End:0x28
    if(Who.bBot || Who.bOnlySpectator)
    {
        return;
    }
    Out = (((Header()) $ "D") $ Tab) $ string(Controller(Who.Owner).PlayerNum);
    Logf(Out);
    //return;    
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x28
    if(Who.bBot || Who.bOnlySpectator)
    {
        return;
    }
    Logf((((((((Header()) $ "S") $ Tab) $ string(Controller(Who.Owner).PlayerNum)) $ Tab) $ string(Points)) $ Tab) $ Desc);
    //return;    
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    Logf((((((((Header()) $ "T") $ Tab) $ string(Team)) $ Tab) $ string(Points)) $ Tab) $ Desc);
    //return;    
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, Class<DamageType> Damage)
{
    local string Out;

    // End:0x49
    if((Victim.bBot || Victim.bOnlySpectator) || (Killer != none) && Killer.bBot)
    {
        return;
    }
    Out = ((Header()) $ KillType) $ Tab;
    // End:0xBC
    if(Killer != none)
    {
        Out $= (string(Controller(Killer.Owner).PlayerNum) $ Tab);
        Out $= ((GetItemName(string(Damage))) $ Tab);        
    }
    else
    {
        Out $= ((("-1" $ Tab) $ (GetItemName(string(Damage)))) $ Tab);
    }
    Out $= ((string(Controller(Victim.Owner).PlayerNum) $ Tab) $ (GetItemName(string(Controller(Victim.Owner).GetLastWeapon()))));
    // End:0x1B7
    if((PlayerController(Victim.Owner) != none) && PlayerController(Victim.Owner).bIsTyping)
    {
        // End:0x1B7
        if(PlayerController(Killer.Owner) != PlayerController(Victim.Owner))
        {
            SpecialEvent(Killer, "type_kill");
        }
    }
    Logf(Out);
    //return;    
}

function SpecialEvent(PlayerReplicationInfo Who, string Desc)
{
    local string Out;

    // End:0x5A
    if(Who != none)
    {
        // End:0x33
        if(Who.bBot || Who.bOnlySpectator)
        {
            return;
        }
        Out = string(Controller(Who.Owner).PlayerNum);        
    }
    else
    {
        Out = "-1";
    }
    Logf((((((Header()) $ "P") $ Tab) $ Out) $ Tab) $ Desc);
    //return;    
}

function GameEvent(string GEvent, string Desc, PlayerReplicationInfo Who)
{
    local string Out, geDesc;

    // End:0x5A
    if(Who != none)
    {
        // End:0x33
        if(Who.bBot || Who.bOnlySpectator)
        {
            return;
        }
        Out = string(Controller(Who.Owner).PlayerNum);        
    }
    else
    {
        Out = "-1";
    }
    geDesc = Desc;
    ReplaceText(geDesc, Tab, "_");
    Logf((((((((Header()) $ "G") $ Tab) $ GEvent) $ Tab) $ Out) $ Tab) $ geDesc);
    //return;    
}

function string GetLogFilename()
{
    local string Result;

    Result = LogFileName;
    ReplaceText(Result, "%P", string(Level.Game.GetServerPort()));
    ReplaceText(Result, "%N", Level.Game.GameReplicationInfo.ServerName);
    ReplaceText(Result, "%Y", Right("0000" $ string(Level.Year), 4));
    ReplaceText(Result, "%M", Right("00" $ string(Level.Month), 2));
    ReplaceText(Result, "%D", Right("00" $ string(Level.Day), 2));
    ReplaceText(Result, "%H", Right("00" $ string(Level.Hour), 2));
    ReplaceText(Result, "%I", Right("00" $ string(Level.Minute), 2));
    ReplaceText(Result, "%W", Right("0" $ string(Level.DayOfWeek), 1));
    ReplaceText(Result, "%S", Right("00" $ string(Level.Second), 2));
    return Result;
    //return;    
}

defaultproperties
{
    LogFileName="Stats_%P_%Y_%M_%D_%H_%I_%S"
}