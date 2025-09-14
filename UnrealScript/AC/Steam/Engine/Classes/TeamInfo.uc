/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TeamInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:9
 *
 *******************************************************************************/
class TeamInfo extends ReplicationInfo
    dependson(ReplicationInfo)
    dependson(VoiceChatReplicationInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    nativereplication
    notplaceable;

var localized string TeamName;
var int Size;
var float Score;
var float Score2;
var int TeamIndex;
var Color TeamColor;
var Color AltTeamColor;
var Actor HomeBase;
var() class<Pawn> DefaultPlayerClass;
var localized string ColorNames[4];
var int ElapsedTime_UAVBegin;
var int ElapsedTime_UAVEnd;

replication
{
    // Pos:0x00
    reliable if(bNetDirty && Role == 4)
        Score, Score2,
        HomeBase;

    // Pos:0x18
    reliable if(bNetInitial && Role == 4)
        TeamName, TeamIndex,
        TeamColor, AltTeamColor;

    // Pos:0x30
    reliable if(Role == 4)
        ElapsedTime_UAVBegin, ElapsedTime_UAVEnd;

}

function SetUAV()
{
    // End:0x21
    if(IsUAVOn())
    {
        ElapsedTime_UAVEnd += class'GameInfo'.default.UAVDuration;
    }
    // End:0x59
    else
    {
        ElapsedTime_UAVBegin = Level.GRI.ElapsedTime;
        ElapsedTime_UAVEnd = ElapsedTime_UAVBegin + class'GameInfo'.default.UAVDuration;
    }
}

simulated function bool IsUAVOn()
{
    return Level.GRI.ElapsedTime < ElapsedTime_UAVEnd;
}

simulated function int GetUAVTime()
{
    return ElapsedTime_UAVEnd - Level.GRI.ElapsedTime;
}

function bool BelongsOnTeam(class<Pawn> PawnClass)
{
    return true;
}

simulated function string GetHumanReadableName()
{
    // End:0x36
    if(TeamName == default.TeamName)
    {
        // End:0x27
        if(TeamIndex < 4)
        {
            return ColorNames[TeamIndex];
        }
        return TeamName @ string(TeamIndex);
    }
    return TeamName;
}

function bool AddToTeam(Controller Other)
{
    local Controller P;
    local bool bSuccess;

    Log("[TeamInfo::AddToTeam] TeamIndex=" $ string(TeamIndex) $ " Name=" $ Other.PlayerReplicationInfo.PlayerName);
    // End:0x76
    if(Other == none)
    {
        Log("Added none to team!!!");
        return false;
    }
    // End:0xb7
    if(MessagingSpectator(Other) != none)
    {
        Log("Messaging spectator so returning false", 'VoiceChat');
        return false;
    }
    ++ Size;
    Other.PlayerReplicationInfo.Team = self;
    Other.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    bSuccess = false;
    // End:0x13a
    if(Other.IsA('PlayerController'))
    {
        Other.PlayerReplicationInfo.TeamID = 0;
    }
    // End:0x153
    else
    {
        Other.PlayerReplicationInfo.TeamID = 1;
    }
    // End:0x271 [While If]
    if(!bSuccess)
    {
        bSuccess = true;
        P = Level.ControllerList;
        J0x17a:
        // End:0x231 [While If]
        if(P != none)
        {
            // End:0x21a
            if(P.bIsPlayer && P != Other && P.PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team && P.PlayerReplicationInfo.TeamID == Other.PlayerReplicationInfo.TeamID)
            {
                bSuccess = false;
            }
            P = P.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x17a;
        }
        // End:0x26e
        if(!bSuccess)
        {
            Other.PlayerReplicationInfo.TeamID = Other.PlayerReplicationInfo.TeamID + 1;
        }
        // This is an implied JumpToken; Continue!
        goto J0x153;
    }
    // End:0x2d4
    if(PlayerController(Other) != none && Level.Game.VoiceReplicationInfo != none)
    {
        Level.Game.VoiceReplicationInfo.NotifyTeamChange(Other.PlayerReplicationInfo, TeamIndex);
    }
    return true;
}

function RemoveFromTeam(Controller Other)
{
    -- Size;
}

static function SetCharacters(array<string> Chars);
static function GetAllCharacters(out array<string> Chars);

defaultproperties
{
    TeamName="TEAM"
    TeamColor=(R=255,G=0,B=0,A=255)
    AltTeamColor=(R=200,G=0,B=0,A=255)
    ColorNames[0]="AF"
    ColorNames[1]="RSA"
    ColorNames[2]="Green Team"
    ColorNames[3]="Gold Team"
    ElapsedTime_UAVBegin=-9999999
    ElapsedTime_UAVEnd=-9999999
    NetUpdateFrequency=2.0
}