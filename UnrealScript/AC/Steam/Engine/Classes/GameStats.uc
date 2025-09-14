/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GameStats.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:24
 *
 *******************************************************************************/
class GameStats extends Info
    dependson(FileLog)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    config()
    notplaceable;

var FileLog TempLog;
var GameReplicationInfo GRI;
var bool bShowBots;
var string Tab;
var globalconfig bool bLocalLog;
var globalconfig string LogFileName;

// Export UGameStats::execGetStatsIdentifier(FFrame&, void* const)
native final function string GetStatsIdentifier(Controller C);
// Export UGameStats::execGetMapFileName(FFrame&, void* const)
native final function string GetMapFileName();
function Init()
{
    // End:0x5a
    if(bLocalLog)
    {
        TempLog = Spawn(class'FileLog');
        // End:0x3a
        if(TempLog != none)
        {
            TempLog.OpenLog(GetLogFilename());
        }
        // End:0x5a
        else
        {
            Warn("Could not create output file");
        }
    }
}

function Shutdown()
{
    // End:0x17
    if(TempLog != none)
    {
        TempLog.Destroy();
    }
}

function Logf(string LogString)
{
    // End:0x1f
    if(TempLog != none)
    {
        TempLog.super(GameStats).Logf(LogString);
    }
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    Tab = Chr(9);
    Init();
}

event Destroyed()
{
    Shutdown();
    super(Actor).Destroyed();
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
}

function string Header()
{
    return TimeStamp() $ Tab;
}

function string FullTimeDate()
{
    return string(Level.Year) $ "-" $ string(Level.Month) $ "-" $ string(Level.Day) $ " " $ string(Level.Hour) $ ":" $ string(Level.Minute) $ ":" $ string(Level.Second);
}

function string TimeZone()
{
    return "0";
}

function string MapName()
{
    local string MapName;

    MapName = GetMapFileName();
    // End:0x3f
    if(InStr(MapName, ".ebtr") != -1)
    {
        MapName = Left(MapName, InStr(MapName, ".ebtr"));
    }
    ReplaceText(MapName, Tab, "_");
    return MapName;
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
    Out = Header() $ "NG" $ Tab;
    Out $= FullTimeDate() $ Tab;
    Out $= TimeZone() $ Tab;
    Out $= MapName() $ Tab;
    Out $= ngTitle $ Tab;
    Out $= ngAuthor $ Tab;
    Out $= string(Level.Game.Class) $ Tab;
    Out $= ngGameGameName;
    tmp = "";
    i = 0;
    // End:0x1c4
    foreach AllActors(class'Mutator', MyMutie)
    {
        // End:0x1a3
        if(tmp != "")
        {
            tmp $= "|" $ string(MyMutie.Class);
        }
        // End:0x1bc
        else
        {
            tmp $= string(MyMutie.Class);
        }
        ++ i;                
    }
    // End:0x223
    foreach AllActors(class'GameRules', MyRules)
    {
        // End:0x202
        if(tmp != "")
        {
            tmp $= "|" $ string(MyRules.Class);
        }
        // End:0x21b
        else
        {
            tmp $= string(MyRules.Class);
        }
        ++ i;                
    }
    // End:0x264
    if(i > 0)
    {
        ReplaceText(tmp, Tab, "_");
        Out $= Tab $ "Mutators=" $ tmp;
    }
    Logf(Out);
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
    Out = Header() $ "SI" $ Tab;
    Out $= siServerName $ Tab;
    Out $= TimeZone() $ Tab;
    Out $= siAdminName $ Tab;
    Out $= siAdminEmail $ Tab;
    Out $= Tab;
    Flags = "";
    Level.Game.GetServerDetails(ServerState);
    i = 0;
    J0x11d:
    // End:0x17b [While If]
    if(i < ServerState.ServerInfo.Length)
    {
        Flags $= "\\" $ ServerState.ServerInfo[i].key $ "\\" $ ServerState.ServerInfo[i].Value;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x11d;
    }
    ReplaceText(Flags, Tab, "_");
    Out $= Flags;
    Logf(Out);
}

function StartGame()
{
    Logf(Header() $ "SG");
}

function EndGame(string Reason)
{
    local string Out;
    local int i, j;
    local array<PlayerReplicationInfo> pris;
    local PlayerReplicationInfo PRI, t;

    Out = Header() $ "EG" $ Tab $ Reason;
    i = 0;
    J0x27:
    // End:0x179 [While If]
    if(i < GRI.PRIArray.Length)
    {
        PRI = GRI.PRIArray[i];
        // End:0x16f
        if(!PRI.bOnlySpectator && !PRI.bBot)
        {
            pris.Length = pris.Length + 1;
            j = 0;
            J0x9b:
            // End:0x15e [While If]
            if(j < pris.Length - 1)
            {
                // End:0x154
                if(pris[j].Score < PRI.Score || pris[j].Score == PRI.Score && pris[j].Deaths > PRI.Deaths)
                {
                    t = pris[j];
                    pris[j] = PRI;
                    PRI = t;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x9b;
            }
            pris[j] = PRI;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    i = 0;
    J0x180:
    // End:0x1ce [While If]
    if(i < pris.Length)
    {
        Out $= Tab $ string(Controller(pris[i].Owner).PlayerNum);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x180;
    }
    Logf(Out);
}

function ConnectEvent(PlayerReplicationInfo Who)
{
    local string Out;

    // End:0x28
    if(Who.bBot || Who.bOnlySpectator)
    {
        return;
    }
    Out = Header() $ "C" $ Tab $ string(Controller(Who.Owner).PlayerNum) $ Tab;
    Out $= GetStatsIdentifier(Controller(Who.Owner));
    Logf(Out);
}

function DisconnectEvent(PlayerReplicationInfo Who)
{
    local string Out;

    // End:0x28
    if(Who.bBot || Who.bOnlySpectator)
    {
        return;
    }
    Out = Header() $ "D" $ Tab $ string(Controller(Who.Owner).PlayerNum);
    Logf(Out);
}

function ScoreEvent(PlayerReplicationInfo Who, float Points, string Desc)
{
    // End:0x28
    if(Who.bBot || Who.bOnlySpectator)
    {
        return;
    }
    Logf(Header() $ "S" $ Tab $ string(Controller(Who.Owner).PlayerNum) $ Tab $ string(Points) $ Tab $ Desc);
}

function TeamScoreEvent(int Team, float Points, string Desc)
{
    Logf(Header() $ "T" $ Tab $ string(Team) $ Tab $ string(Points) $ Tab $ Desc);
}

function KillEvent(string KillType, PlayerReplicationInfo Killer, PlayerReplicationInfo Victim, class<DamageType> Damage)
{
    local string Out;

    // End:0x49
    if(Victim.bBot || Victim.bOnlySpectator || Killer != none && Killer.bBot)
    {
        return;
    }
    Out = Header() $ KillType $ Tab;
    // End:0xbc
    if(Killer != none)
    {
        Out $= string(Controller(Killer.Owner).PlayerNum) $ Tab;
        Out $= GetItemName(string(Damage)) $ Tab;
    }
    // End:0xe6
    else
    {
        Out $= "-1" $ Tab $ GetItemName(string(Damage)) $ Tab;
    }
    Out $= string(Controller(Victim.Owner).PlayerNum) $ Tab $ GetItemName(string(Controller(Victim.Owner).GetLastWeapon()));
    // End:0x1b7
    if(PlayerController(Victim.Owner) != none && PlayerController(Victim.Owner).bIsTyping)
    {
        // End:0x1b7
        if(PlayerController(Killer.Owner) != PlayerController(Victim.Owner))
        {
            SpecialEvent(Killer, "type_kill");
        }
    }
    Logf(Out);
}

function SpecialEvent(PlayerReplicationInfo Who, string Desc)
{
    local string Out;

    // End:0x5a
    if(Who != none)
    {
        // End:0x33
        if(Who.bBot || Who.bOnlySpectator)
        {
            return;
        }
        Out = string(Controller(Who.Owner).PlayerNum);
    }
    // End:0x64
    else
    {
        Out = "-1";
    }
    Logf(Header() $ "P" $ Tab $ Out $ Tab $ Desc);
}

function GameEvent(string GEvent, string Desc, PlayerReplicationInfo Who)
{
    local string Out, geDesc;

    // End:0x5a
    if(Who != none)
    {
        // End:0x33
        if(Who.bBot || Who.bOnlySpectator)
        {
            return;
        }
        Out = string(Controller(Who.Owner).PlayerNum);
    }
    // End:0x64
    else
    {
        Out = "-1";
    }
    geDesc = Desc;
    ReplaceText(geDesc, Tab, "_");
    Logf(Header() $ "G" $ Tab $ GEvent $ Tab $ Out $ Tab $ geDesc);
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
}

defaultproperties
{
    LogFileName="Stats_%P_%Y_%M_%D_%H_%I_%S"
}