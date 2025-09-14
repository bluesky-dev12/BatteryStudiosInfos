class GameProfile extends Object
    native;

const NUM_POSITIONS = 5;
const TEAM_SIZE = 7;
const LINEUP_SIZE = 4;
const NUM_LADDERS = 6;

enum EPlayerPos
{
    POS_Auto,                       // 0
    POS_Defense,                    // 1
    POS_Offense,                    // 2
    POS_Roam,                       // 3
    POS_Supporting                  // 4
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
var Class<LadderInfo> GameLadder;
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
        GameLadder = Class<LadderInfo>(DynamicLoadObject(GameLadderName, Class'Core.Class'));
    }
    PackageName = pn;
    PlayerName = pn;
    C = currentGame.Level.ControllerList;
    J0x59:

    // End:0xAD [Loop If]
    if(C != none)
    {
        // End:0x96
        if(PlayerController(C) != none)
        {
            currentGame.ChangeName(PlayerController(C), PlayerName, false);
            // [Explicit Break]
            goto J0xAD;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x59;
    }
    J0xAD:

    NextMatchObject = none;
    ChampBorderObject = none;
    //return;    
}

function CheatSkipMatch(GameInfo currentGame)
{
    SpecialEvent = GameLadder.static.UpdateLadders(self, CurrentLadder);
    ContinueSinglePlayerGame(currentGame.Level);
    //return;    
}

function CheatJumpMatch(GameInfo currentGame, int Param)
{
    local Controller C;
    local int newladder, newrung;

    newladder = Param / 10;
    newrung = Param - (newladder * 10);
    // End:0x4D
    if(((newladder < 0) || newladder >= 6) || newrung < 0)
    {
        return;
    }
    bInLadderGame = true;
    CurrentLadder = newladder;
    ladderrung[CurrentLadder] = newrung;
    CurrentMenuRung = newrung;
    C = currentGame.Level.ControllerList;
    J0x99:

    // End:0xFC [Loop If]
    if(C != none)
    {
        // End:0xE5
        if(PlayerController(C) != none)
        {
            PlayerController(C).ConsoleCommand("START" @ GameLadder.static.MakeURLFor(self));
            // [Explicit Break]
            goto J0xFC;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x99;
    }
    J0xFC:

    //return;    
}

function MatchInfo GetMatchInfo(int Ladder, int rung)
{
    // End:0x28
    if(GameLadder != none)
    {
        return GameLadder.static.GetMatchInfo(Ladder, rung);        
    }
    else
    {
        return none;
    }
    //return;    
}

function RegisterGame(GameInfo currentGame, PlayerReplicationInfo PRI)
{
    Log("SINGLEPLAYER GameProfile::RegisterGame for profile" @ self.PackageName);
    Kills += PRI.Kills;
    Assists += PRI.Assists;
    Goals += PRI.GoalsScored;
    Deaths += int(PRI.Deaths);
    Matches++;
    // End:0xCA
    if(bWonMatch)
    {
        SpecialEvent = GameLadder.static.UpdateLadders(self, CurrentLadder);
        Wins++;
    }
    bWonMatch = false;
    //return;    
}

function StartNewMatch(int PickedLadder, LevelInfo CurrentLevel)
{
    local Controller C;

    bWonMatch = false;
    bInLadderGame = true;
    CurrentLadder = PickedLadder;
    CurrentLevel.Game.SavePackage(PackageName);
    C = CurrentLevel.ControllerList;
    J0x4C:

    // End:0xAF [Loop If]
    if(C != none)
    {
        // End:0x98
        if(PlayerController(C) != none)
        {
            PlayerController(C).ConsoleCommand("START" @ GameLadder.static.MakeURLFor(self));
            // [Explicit Break]
            goto J0xAF;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x4C;
    }
    J0xAF:

    //return;    
}

function int FindFirstUnfinishedLadder()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < 6)
    {
        // End:0x3D
        if(ladderrung[i] < GameLadder.static.LengthOfLadder(i))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

function ContinueSinglePlayerGame(LevelInfo Level, optional bool bReplace)
{
    Level.Game.SavePackage(PackageName);
    StartNewMatch(FindFirstUnfinishedLadder(), Level);
    //return;    
}

function string GetMatchDescription()
{
    return GameLadder.static.GetMatchDescription(self);
    //return;    
}

static function int GetNumPositions()
{
    return 5;
    //return;    
}

function int GetNumTeammatesForMatch()
{
    local MatchInfo M;

    M = GameLadder.static.GetCurrentMatchInfo(self);
    // End:0x64
    if((M.GameType ~= "wGame.wDeathmatch") || M.GameType ~= "wGame.BossDM")
    {
        return 0;        
    }
    else
    {
        return M.NumBots / 2;
    }
    //return;    
}

static function string TextPositionDescription(int posnval)
{
    local string retval;

    // End:0x21
    if((posnval < 0) || posnval > 5)
    {
        return "Error";
    }
    switch(posnval)
    {
        // End:0x3F
        case int(0):
            retval = default.PositionName[0];
            // End:0xA1
            break;
        // End:0x56
        case int(1):
            retval = default.PositionName[1];
            // End:0xA1
            break;
        // End:0x6E
        case int(2):
            retval = default.PositionName[2];
            // End:0xA1
            break;
        // End:0x86
        case int(3):
            retval = default.PositionName[3];
            // End:0xA1
            break;
        // End:0x9E
        case int(4):
            retval = default.PositionName[4];
            // End:0xA1
            break;
        // End:0xFFFF
        default:
            break;
    }
    return retval;
    //return;    
}

static function GameProfile.EPlayerPos EnumPositionDescription(string posnval)
{
    local GameProfile.EPlayerPos retval;

    // End:0x1C
    if(posnval == default.PositionName[0])
    {
        retval = 0;        
    }
    else
    {
        // End:0x38
        if(posnval == default.PositionName[1])
        {
            retval = 1;            
        }
        else
        {
            // End:0x55
            if(posnval == default.PositionName[2])
            {
                retval = 2;                
            }
            else
            {
                // End:0x72
                if(posnval == default.PositionName[3])
                {
                    retval = 3;                    
                }
                else
                {
                    // End:0x8F
                    if(posnval == default.PositionName[4])
                    {
                        retval = 4;                        
                    }
                    else
                    {
                        retval = 0;
                    }
                }
            }
        }
    }
    return retval;
    //return;    
}

function string GetPositionDescription(int PlayerNum)
{
    // End:0x21
    if((PlayerNum < 0) || PlayerNum >= 7)
    {
        return "Error";
    }
    return TextPositionDescription(int(PlayerPositions[PlayerNum]));
    //return;    
}

function SetPosition(int lineupnum, string posn)
{
    // End:0x36
    if((lineupnum >= 0) && lineupnum < 4)
    {
        PlayerPositions[PlayerLineup[lineupnum]] = EnumPositionDescription(posn);
    }
    //return;    
}

function SetLineup(int lineuppos, int teampos)
{
    local int oldlineuppos, oldteammate, i;

    // End:0x1B
    if((lineuppos < 0) || lineuppos > 4)
    {
        return;
    }
    // End:0x36
    if((teampos < 0) || teampos >= 7)
    {
        return;
    }
    // End:0x4D
    if(PlayerLineup[lineuppos] == teampos)
    {
        return;
    }
    oldlineuppos = -1;
    i = 0;
    J0x5F:

    // End:0x98 [Loop If]
    if(i < 4)
    {
        // End:0x8E
        if(PlayerLineup[i] == teampos)
        {
            oldlineuppos = i;
            // [Explicit Break]
            goto J0x98;
        }
        i++;
        // [Loop Continue]
        goto J0x5F;
    }
    J0x98:

    // End:0xB4
    if(oldlineuppos >= 0)
    {
        oldteammate = PlayerLineup[lineuppos];
    }
    PlayerLineup[lineuppos] = teampos;
    // End:0xE1
    if(oldlineuppos >= 0)
    {
        PlayerLineup[oldlineuppos] = oldteammate;
    }
    //return;    
}

function bool AddTeammate(string botname)
{
    local int i;

    // End:0x0E
    if(botname == "")
    {
        return false;
    }
    i = 0;
    J0x15:

    // End:0x79 [Loop If]
    if(i < 7)
    {
        // End:0x58
        if((i >= PlayerTeam.Length) || PlayerTeam[i] == "")
        {
            PlayerTeam[i] = botname;
            return true;
        }
        // End:0x6F
        if(PlayerTeam[i] ~= botname)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return false;
    //return;    
}

function bool ReleaseTeammate(string botname)
{
    local int i, j;

    // End:0x0E
    if(botname == "")
    {
        return false;
    }
    i = 0;
    J0x15:

    // End:0x9A [Loop If]
    if(i < PlayerTeam.Length)
    {
        // End:0x90
        if(PlayerTeam[i] ~= botname)
        {
            j = i;
            J0x45:

            // End:0x7C [Loop If]
            if(j < (PlayerTeam.Length - 1))
            {
                PlayerTeam[j] = PlayerTeam[j + 1];
                j++;
                // [Loop Continue]
                goto J0x45;
            }
            PlayerTeam[PlayerTeam.Length - 1] = "";
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return false;
    //return;    
}

function ClearTeammates()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x2F [Loop If]
    if(i < PlayerTeam.Length)
    {
        PlayerTeam[i] = "";
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ReportCheat(PlayerController Cheater, string cheat)
{
    //return;    
}

function bool CanChangeTeam(Controller Other, int NewTeam)
{
    return true;
    //return;    
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
    BaseDifficulty=1.0000000
    PlayerName="Name"
    PlayerCharacter="Roc"
    ladderrung[1]=-1
    ladderrung[2]=-1
    ladderrung[3]=-1
    ladderrung[4]=-1
    ladderrung[5]=-1
    GameLadderName="Engine.LadderInfo"
}