/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GameProfile.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:4
 *	Enums:1
 *	Properties:30
 *	Functions:21
 *
 *******************************************************************************/
class GameProfile extends Object
    dependson(LadderInfo)
    dependson(MatchInfo)
    native;

const NUM_POSITIONS = 5;
const TEAM_SIZE = 7;
const LINEUP_SIZE = 4;
const NUM_LADDERS = 6;

enum EPlayerPos
{
    POS_Auto,
    POS_Defense,
    POS_Offense,
    POS_Roam,
    POS_Supporting
};

var() string PackageName;
var() int ManifestIndex;
var localized string PositionName[5];
var GameProfile.EPlayerPos PlayerPositions[7];
var() array<string> PlayerTeam;
var int PlayerLineup[4];
var string EnemyTeam;
var string TeamName;
var string TeamSymbolName;
var() float BaseDifficulty;
var() float Difficulty;
var int SalaryCap;
var string PlayerName;
var string PlayerCharacter;
var() int Kills;
var() int Assists;
var() int Goals;
var() int Deaths;
var() int Wins;
var() int Matches;
var int ladderrung[6];
var string SpecialEvent;
var string GameLadderName;
var class<LadderInfo> GameLadder;
var int CurrentLadder;
var transient int CurrentMenuRung;
var transient Object NextMatchObject;
var transient Object ChampBorderObject;
var bool bInLadderGame;
var bool bWonMatch;

function Initialize(GameInfo currentGame, string pn)
{
    local Controller C;

    // End:0x26
    if(GameLadder == none)
    {
        GameLadder = class<LadderInfo>(DynamicLoadObject(GameLadderName, class'Class'));
    }
    PackageName = pn;
    PlayerName = pn;
    C = currentGame.Level.ControllerList;
    J0x59:
    // End:0xad [While If]
    if(C != none)
    {
        // End:0x96
        if(PlayerController(C) != none)
        {
            currentGame.ChangeName(PlayerController(C), PlayerName, false);
        }
        // End:0xad
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x59;
        }
    }
    NextMatchObject = none;
    ChampBorderObject = none;
}

function CheatSkipMatch(GameInfo currentGame)
{
    SpecialEvent = GameLadder.static.UpdateLadders(self, CurrentLadder);
    ContinueSinglePlayerGame(currentGame.Level);
}

function CheatJumpMatch(GameInfo currentGame, int Param)
{
    local Controller C;
    local int newladder, newrung;

    newladder = Param / 10;
    newrung = Param - newladder * 10;
    // End:0x4d
    if(newladder < 0 || newladder >= 6 || newrung < 0)
    {
        return;
    }
    bInLadderGame = true;
    CurrentLadder = newladder;
    ladderrung[CurrentLadder] = newrung;
    CurrentMenuRung = newrung;
    C = currentGame.Level.ControllerList;
    J0x99:
    // End:0xfc [While If]
    if(C != none)
    {
        // End:0xe5
        if(PlayerController(C) != none)
        {
            PlayerController(C).ConsoleCommand("START" @ GameLadder.static.MakeURLFor(self));
        }
        // End:0xfc
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x99;
        }
    }
}

function MatchInfo GetMatchInfo(int Ladder, int rung)
{
    // End:0x28
    if(GameLadder != none)
    {
        return GameLadder.static.GetMatchInfo(Ladder, rung);
    }
    // End:0x2a
    else
    {
        return none;
    }
}

function RegisterGame(GameInfo currentGame, PlayerReplicationInfo PRI)
{
    Log("SINGLEPLAYER GameProfile::RegisterGame for profile" @ self.PackageName);
    Kills += PRI.Kills;
    Assists += PRI.Assists;
    Goals += PRI.GoalsScored;
    Deaths += int(PRI.Deaths);
    ++ Matches;
    // End:0xca
    if(bWonMatch)
    {
        SpecialEvent = GameLadder.static.UpdateLadders(self, CurrentLadder);
        ++ Wins;
    }
    bWonMatch = false;
}

function StartNewMatch(int PickedLadder, LevelInfo CurrentLevel)
{
    local Controller C;

    bWonMatch = false;
    bInLadderGame = true;
    CurrentLadder = PickedLadder;
    CurrentLevel.Game.SavePackage(PackageName);
    C = CurrentLevel.ControllerList;
    J0x4c:
    // End:0xaf [While If]
    if(C != none)
    {
        // End:0x98
        if(PlayerController(C) != none)
        {
            PlayerController(C).ConsoleCommand("START" @ GameLadder.static.MakeURLFor(self));
        }
        // End:0xaf
        else
        {
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x4c;
        }
    }
}

function int FindFirstUnfinishedLadder()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < 6)
    {
        // End:0x3d
        if(ladderrung[i] < GameLadder.static.LengthOfLadder(i))
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 0;
}

function ContinueSinglePlayerGame(LevelInfo Level, optional bool bReplace)
{
    Level.Game.SavePackage(PackageName);
    StartNewMatch(FindFirstUnfinishedLadder(), Level);
}

function string GetMatchDescription()
{
    return GameLadder.static.GetMatchDescription(self);
}

static function int GetNumPositions()
{
    return 5;
}

function int GetNumTeammatesForMatch()
{
    local MatchInfo M;

    M = GameLadder.static.GetCurrentMatchInfo(self);
    // End:0x64
    if(M.GameType ~= "wGame.wDeathmatch" || M.GameType ~= "wGame.BossDM")
    {
        return 0;
    }
    // End:0x77
    else
    {
        return M.NumBots / 2;
    }
}

static function string TextPositionDescription(int posnval)
{
    local string retval;

    // End:0x21
    if(posnval < 0 || posnval > 5)
    {
        return "Error";
    }
    switch(posnval)
    {
        // End:0x3f
        case 0:
            retval = default.PositionName[0];
            // End:0xa1
            break;
        // End:0x56
        case 1:
            retval = default.PositionName[1];
            // End:0xa1
            break;
        // End:0x6e
        case 2:
            retval = default.PositionName[2];
            // End:0xa1
            break;
        // End:0x86
        case 3:
            retval = default.PositionName[3];
            // End:0xa1
            break;
        // End:0x9e
        case 4:
            retval = default.PositionName[4];
            // End:0xa1
            break;
        // End:0xffff
        default:
            return retval;
    }
}

static function GameProfile.EPlayerPos EnumPositionDescription(string posnval)
{
    local GameProfile.EPlayerPos retval;

    // End:0x1c
    if(posnval == default.PositionName[0])
    {
        retval = 0;
    }
    // End:0x97
    else
    {
        // End:0x38
        if(posnval == default.PositionName[1])
        {
            retval = 1;
        }
        // End:0x97
        else
        {
            // End:0x55
            if(posnval == default.PositionName[2])
            {
                retval = 2;
            }
            // End:0x97
            else
            {
                // End:0x72
                if(posnval == default.PositionName[3])
                {
                    retval = 3;
                }
                // End:0x97
                else
                {
                    // End:0x8f
                    if(posnval == default.PositionName[4])
                    {
                        retval = 4;
                    }
                    // End:0x97
                    else
                    {
                        retval = 0;
                    }
                }
            }
        }
    }
    return retval;
}

function string GetPositionDescription(int PlayerNum)
{
    // End:0x21
    if(PlayerNum < 0 || PlayerNum >= 7)
    {
        return "Error";
    }
    return TextPositionDescription(PlayerPositions[PlayerNum]);
}

function SetPosition(int lineupnum, string posn)
{
    // End:0x36
    if(lineupnum >= 0 && lineupnum < 4)
    {
        PlayerPositions[PlayerLineup[lineupnum]] = EnumPositionDescription(posn);
    }
}

function SetLineup(int lineuppos, int teampos)
{
    local int oldlineuppos, oldteammate, i;

    // End:0x1b
    if(lineuppos < 0 || lineuppos > 4)
    {
        return;
    }
    // End:0x36
    if(teampos < 0 || teampos >= 7)
    {
        return;
    }
    // End:0x4d
    if(PlayerLineup[lineuppos] == teampos)
    {
        return;
    }
    oldlineuppos = -1;
    i = 0;
    J0x5f:
    // End:0x98 [While If]
    if(i < 4)
    {
        // End:0x8e
        if(PlayerLineup[i] == teampos)
        {
            oldlineuppos = i;
        }
        // End:0x98
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x5f;
        }
    }
    // End:0xb4
    if(oldlineuppos >= 0)
    {
        oldteammate = PlayerLineup[lineuppos];
    }
    PlayerLineup[lineuppos] = teampos;
    // End:0xe1
    if(oldlineuppos >= 0)
    {
        PlayerLineup[oldlineuppos] = oldteammate;
    }
}

function bool AddTeammate(string botname)
{
    local int i;

    // End:0x0e
    if(botname == "")
    {
        return false;
    }
    i = 0;
    J0x15:
    // End:0x79 [While If]
    if(i < 7)
    {
        // End:0x58
        if(i >= PlayerTeam.Length || PlayerTeam[i] == "")
        {
            PlayerTeam[i] = botname;
            return true;
        }
        // End:0x6f
        if(PlayerTeam[i] ~= botname)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return false;
}

function bool ReleaseTeammate(string botname)
{
    local int i, j;

    // End:0x0e
    if(botname == "")
    {
        return false;
    }
    i = 0;
    J0x15:
    // End:0x9a [While If]
    if(i < PlayerTeam.Length)
    {
        // End:0x90
        if(PlayerTeam[i] ~= botname)
        {
            j = i;
            J0x45:
            // End:0x7c [While If]
            if(j < PlayerTeam.Length - 1)
            {
                PlayerTeam[j] = PlayerTeam[j + 1];
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x45;
            }
            PlayerTeam[PlayerTeam.Length - 1] = "";
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return false;
}

function ClearTeammates()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2f [While If]
    if(i < PlayerTeam.Length)
    {
        PlayerTeam[i] = "";
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ReportCheat(PlayerController Cheater, string cheat);
function bool CanChangeTeam(Controller Other, int NewTeam)
{
    return true;
}

defaultproperties
{
    PackageName="Default"
    PositionName[0]="Auto-Speed"
    PositionName[1]="Defense"
    PositionName[2]="Offense"
    PositionName[3]="Scout"
    PositionName[4]="Support"
    PlayerLineup[1]=1
    PlayerLineup[2]=2
    PlayerLineup[3]=3
    BaseDifficulty=1.0
    PlayerName="Name"
    PlayerCharacter="Roc"
    ladderrung[1]=-1
    ladderrung[2]=-1
    ladderrung[3]=-1
    ladderrung[4]=-1
    ladderrung[5]=-1
    GameLadderName="Engine.LadderInfo"
}