class LadderInfo extends Object
    abstract;

const DMLadderIndex = 0;
const TDMLadderIndex = 1;
const DOMLadderIndex = 2;
const CTFLadderIndex = 3;
const BRLadderIndex = 4;
const ChampionshipLadderIndex = 5;

var() editinline array<editinline MatchInfo> DMMatches;
var() editinline array<editinline MatchInfo> TDMMatches;
var() editinline array<editinline MatchInfo> DOMMatches;
var() editinline array<editinline MatchInfo> CTFMatches;
var() editinline array<editinline MatchInfo> BRMatches;
var() editinline array<editinline MatchInfo> ChampionshipMatches;
var int OpenNextLadderAtRung[5];

static function string UpdateLadders(GameProfile G, int CurrentLadder)
{
    local string SpecialEvent;

    // End:0x2A
    if(G.ladderrung[CurrentLadder] > G.CurrentMenuRung)
    {
        return "";
    }
    switch(CurrentLadder)
    {
        // End:0x61
        case 0:
            SpecialEvent = default.DMMatches[G.ladderrung[CurrentLadder]].SpecialEvent;
            // End:0x158
            break;
        // End:0x91
        case 1:
            SpecialEvent = default.TDMMatches[G.ladderrung[CurrentLadder]].SpecialEvent;
            // End:0x158
            break;
        // End:0xC2
        case 2:
            SpecialEvent = default.DOMMatches[G.ladderrung[CurrentLadder]].SpecialEvent;
            // End:0x158
            break;
        // End:0xF3
        case 3:
            SpecialEvent = default.CTFMatches[G.ladderrung[CurrentLadder]].SpecialEvent;
            // End:0x158
            break;
        // End:0x124
        case 4:
            SpecialEvent = default.BRMatches[G.ladderrung[CurrentLadder]].SpecialEvent;
            // End:0x158
            break;
        // End:0x155
        case 5:
            SpecialEvent = default.ChampionshipMatches[G.ladderrung[CurrentLadder]].SpecialEvent;
            // End:0x158
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x20C
    if(InStr(SpecialEvent, "OPENED") >= 0)
    {
        // End:0x195
        if(Left(SpecialEvent, 3) == "TDM")
        {
            G.ladderrung[1] = 0;            
        }
        else
        {
            // End:0x1BE
            if(Left(SpecialEvent, 3) == "CTF")
            {
                G.ladderrung[3] = 0;                
            }
            else
            {
                // End:0x1E7
                if(Left(SpecialEvent, 3) == "DOM")
                {
                    G.ladderrung[2] = 0;                    
                }
                else
                {
                    // End:0x20C
                    if(Left(SpecialEvent, 2) == "BR")
                    {
                        G.ladderrung[4] = 0;
                    }
                }
            }
        }
    }
    G.ladderrung[CurrentLadder] += 1;
    // End:0x300
    if((((((G.ladderrung[5] == -1) && G.ladderrung[0] >= default.DMMatches.Length) && G.ladderrung[1] >= default.TDMMatches.Length) && G.ladderrung[2] >= default.DOMMatches.Length) && G.ladderrung[3] >= default.CTFMatches.Length) && G.ladderrung[4] >= default.BRMatches.Length)
    {
        G.ladderrung[5] = 0;
        SpecialEvent = "CHAMPIONSHIP OPENED";
    }
    return SpecialEvent;
    //return;    
}

static function MatchInfo GetMatchInfo(int Ladder, int rung)
{
    local array<MatchInfo> matcharray;

    // End:0x0D
    if(rung < 0)
    {
        return none;
    }
    switch(Ladder)
    {
        // End:0x26
        case 0:
            matcharray = default.DMMatches;
            // End:0x87
            break;
        // End:0x38
        case 1:
            matcharray = default.TDMMatches;
            // End:0x87
            break;
        // End:0x4B
        case 2:
            matcharray = default.DOMMatches;
            // End:0x87
            break;
        // End:0x5E
        case 3:
            matcharray = default.CTFMatches;
            // End:0x87
            break;
        // End:0x71
        case 4:
            matcharray = default.BRMatches;
            // End:0x87
            break;
        // End:0x84
        case 5:
            matcharray = default.ChampionshipMatches;
            // End:0x87
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x95
    if(matcharray.Length <= 0)
    {
        return none;
    }
    // End:0xB5
    if(rung >= matcharray.Length)
    {
        return matcharray[matcharray.Length - 1];
    }
    return matcharray[rung];
    //return;    
}

static function MatchInfo GetCurrentMatchInfo(GameProfile G)
{
    return GetMatchInfo(G.CurrentLadder, G.CurrentMenuRung);
    //return;    
}

static function string MakeURLFor(GameProfile G)
{
    local MatchInfo M;
    local string URL;

    M = GetCurrentMatchInfo(G);
    // End:0x59
    if(M == none)
    {
        Log("SINGLEPLAYER LadderInfo::MakeURLFor MatchInfo invalid.");
        return "";
    }
    G.EnemyTeam = M.EnemyTeamName;
    G.Difficulty = G.BaseDifficulty + M.DifficultyModifier;
    URL = ((((((M.LevelName $ "?Name=") $ G.PlayerName) $ "?Character=") $ G.PlayerCharacter) $ "?SaveGame=") $ G.PackageName) $ M.URLString;
    // End:0x160
    if(M.GoalScore != float(0))
    {
        URL = (URL $ "?GoalScore=") $ string(M.GoalScore);
    }
    // End:0x19E
    if(M.NumBots > 0)
    {
        URL = (URL $ "?NumBots=") $ string(M.NumBots);
    }
    // End:0x1D8
    if(M.GameType != "")
    {
        URL = (URL $ "?Game=") $ M.GameType;
    }
    URL = URL $ "?Team=1";
    return URL;
    //return;    
}

static function string GetMatchDescription(GameProfile G)
{
    local string retval;

    switch(G.CurrentLadder)
    {
        // End:0x29
        case 0:
            retval = "Deathmatch";
            // End:0xC1
            break;
        // End:0x47
        case 1:
            retval = "Team Deathmatch";
            // End:0xC1
            break;
        // End:0x61
        case 2:
            retval = "Domination";
            // End:0xC1
            break;
        // End:0x81
        case 3:
            retval = "Capture the Flag";
            // End:0xC1
            break;
        // End:0x9C
        case 4:
            retval = "Bombing Run";
            // End:0xC1
            break;
        // End:0xBE
        case 5:
            retval = "Championship Match";
            // End:0xC1
            break;
        // End:0xFFFF
        default:
            break;
    }
    return retval;
    //return;    
}

static function int LengthOfLadder(int Ladder)
{
    switch(Ladder)
    {
        // End:0x12
        case 0:
            return default.DMMatches.Length;
        // End:0x1D
        case 1:
            return default.TDMMatches.Length;
        // End:0x29
        case 2:
            return default.DOMMatches.Length;
        // End:0x35
        case 3:
            return default.CTFMatches.Length;
        // End:0x41
        case 4:
            return default.BRMatches.Length;
        // End:0x4D
        case 5:
            return default.ChampionshipMatches.Length;
        // End:0xFFFF
        default:
            return -1;
            break;
    }
    //return;    
}

defaultproperties
{
    // Reference: MatchInfo'Engine.LadderInfo.CTFMatchInfo1'
    begin object name="CTFMatchInfo1" class=Engine.MatchInfo
        LevelName="CTF-Maul"
        EnemyTeamName="wGame.TeamIronGuard"
        GoalScore=3.0000000
        URLString="?mutator=wGame.mutinstagib"
        MenuDescription="Instagib!"
    end object
    CTFMatches[0]=CTFMatchInfo1
    OpenNextLadderAtRung[0]=3
    OpenNextLadderAtRung[1]=3
    OpenNextLadderAtRung[2]=2
    OpenNextLadderAtRung[3]=3
    OpenNextLadderAtRung[4]=3
}