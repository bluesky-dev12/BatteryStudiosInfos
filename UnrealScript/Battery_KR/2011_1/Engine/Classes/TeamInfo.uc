class TeamInfo extends ReplicationInfo
    native
    nativereplication
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string TeamName;
var int Size;
var float Score;
var int TeamIndex;
var Color TeamColor;
var Color AltTeamColor;
var Actor HomeBase;
var() Class<Pawn> DefaultPlayerClass;
var localized string ColorNames[4];
var int ElapsedTime_UAVBegin;
var int ElapsedTime_UAVEnd;

replication
{
    // Pos:0x000
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        HomeBase, Score;

    // Pos:0x018
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        AltTeamColor, TeamColor, 
        TeamIndex, TeamName;

    // Pos:0x030
    reliable if(int(Role) == int(ROLE_Authority))
        ElapsedTime_UAVBegin, ElapsedTime_UAVEnd;
}

function SetUAV()
{
    // End:0x21
    if(IsUAVOn())
    {
        ElapsedTime_UAVEnd += Class'Engine_Decompressed.GameInfo'.default.UAVDuration;        
    }
    else
    {
        ElapsedTime_UAVBegin = Level.GRI.ElapsedTime;
        ElapsedTime_UAVEnd = ElapsedTime_UAVBegin + Class'Engine_Decompressed.GameInfo'.default.UAVDuration;
    }
    //return;    
}

simulated function bool IsUAVOn()
{
    return Level.GRI.ElapsedTime < ElapsedTime_UAVEnd;
    //return;    
}

simulated function int GetUAVTime()
{
    return ElapsedTime_UAVEnd - Level.GRI.ElapsedTime;
    //return;    
}

function bool BelongsOnTeam(Class<Pawn> PawnClass)
{
    return true;
    //return;    
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
    //return;    
}

function bool AddToTeam(Controller Other)
{
    local Controller P;
    local bool bSuccess;

    Log((("[TeamInfo::AddToTeam] TeamIndex=" $ string(TeamIndex)) $ " Name=") $ Other.PlayerReplicationInfo.PlayerName);
    // End:0x76
    if(Other == none)
    {
        Log("Added none to team!!!");
        return false;
    }
    // End:0xB7
    if(MessagingSpectator(Other) != none)
    {
        Log("Messaging spectator so returning false", 'VoiceChat');
        return false;
    }
    Size++;
    Other.PlayerReplicationInfo.Team = self;
    Other.PlayerReplicationInfo.NetUpdateTime = Level.TimeSeconds - float(1);
    bSuccess = false;
    // End:0x13A
    if(Other.IsA('PlayerController'))
    {
        Other.PlayerReplicationInfo.TeamID = 0;        
    }
    else
    {
        Other.PlayerReplicationInfo.TeamID = 1;
    }
    J0x153:

    // End:0x271 [Loop If]
    if(!bSuccess)
    {
        bSuccess = true;
        P = Level.ControllerList;
        J0x17A:

        // End:0x231 [Loop If]
        if(P != none)
        {
            // End:0x21A
            if(((P.bIsPlayer && P != Other) && P.PlayerReplicationInfo.Team == Other.PlayerReplicationInfo.Team) && P.PlayerReplicationInfo.TeamID == Other.PlayerReplicationInfo.TeamID)
            {
                bSuccess = false;
            }
            P = P.nextController;
            // [Loop Continue]
            goto J0x17A;
        }
        // End:0x26E
        if(!bSuccess)
        {
            Other.PlayerReplicationInfo.TeamID = Other.PlayerReplicationInfo.TeamID + 1;
        }
        // [Loop Continue]
        goto J0x153;
    }
    // End:0x2D4
    if((PlayerController(Other) != none) && Level.Game.VoiceReplicationInfo != none)
    {
        Level.Game.VoiceReplicationInfo.NotifyTeamChange(Other.PlayerReplicationInfo, TeamIndex);
    }
    return true;
    //return;    
}

function RemoveFromTeam(Controller Other)
{
    Size--;
    //return;    
}

static function SetCharacters(array<string> Chars)
{
    //return;    
}

static function GetAllCharacters(out array<string> Chars)
{
    //return;    
}

defaultproperties
{
    TeamName="?"
    TeamColor=(R=255,G=0,B=0,A=255)
    AltTeamColor=(R=200,G=0,B=0,A=255)
    ColorNames[0]="AF"
    ColorNames[1]="RSA"
    ColorNames[2]="???"
    ColorNames[3]="???"
    ElapsedTime_UAVBegin=-9999999
    ElapsedTime_UAVEnd=-9999999
    NetUpdateFrequency=2.0000000
}