class UT2K4LadderInfo extends LadderInfo
    config;

var() editinline array<editinline UT2K4MatchInfo> ASMatches;
var int LID_DM;
var int LID_TDM;
var int LID_CTF;
var int LID_BR;
var int LID_DOM;
var int LID_AS;
var int LID_CHAMP;
var config array< Class<CustomLadderInfo> > AdditionalLadders;
var config array< Class<ChallengeGame> > ChallengeGames;

static function MatchInfo GetMatchInfo(int Ladder, int rung)
{
    return GetUT2K4MatchInfo(Ladder, rung, 0, true);
    //return;    
}

static function UT2K4MatchInfo GetUT2K4MatchInfo(int Ladder, int rung, optional int Path, optional bool bSelect)
{
    local array<MatchInfo> matcharray;
    local UT2K4MatchInfo selmatch;
    local string tmp;
    local int i;

    // End:0x19
    if(rung < 0)
    {
        Warn("rung < 0");
        return none;
    }
    switch(Ladder)
    {
        // End:0x36
        case default.LID_DM:
            matcharray = default.DMMatches;
            // End:0xFD
            break;
        // End:0x4C
        case default.LID_TDM:
            matcharray = default.TDMMatches;
            // End:0xFD
            break;
        // End:0x62
        case default.LID_CTF:
            matcharray = default.CTFMatches;
            // End:0xFD
            break;
        // End:0x78
        case default.LID_BR:
            matcharray = default.BRMatches;
            // End:0xFD
            break;
        // End:0x8E
        case default.LID_DOM:
            matcharray = default.DOMMatches;
            // End:0xFD
            break;
        // End:0xA4
        case default.LID_AS:
            matcharray = default.ASMatches;
            // End:0xFD
            break;
        // End:0xBA
        case default.LID_CHAMP:
            matcharray = default.ChampionshipMatches;
            // End:0xFD
            break;
        // End:0xFFFF
        default:
            // End:0xFD
            if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
            {
                matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
            }
            break;
    }
    // End:0x125
    if(matcharray.Length <= 0)
    {
        Warn("matcharray.Length <= 0");
        return none;
    }
    // End:0x152
    if(rung >= matcharray.Length)
    {
        selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);        
    }
    else
    {
        selmatch = UT2K4MatchInfo(matcharray[rung]);
    }
    // End:0x1E9
    if(((selmatch != none) && bSelect) && selmatch.AltLevels.Length > 0)
    {
        tmp = selmatch.AltLevels[int(float(Path) % float(selmatch.AltLevels.Length))];
        // End:0x1E6
        if(tmp != "")
        {
            selmatch.LevelName = tmp;
        }        
    }
    else
    {
        // End:0x2BB
        if((selmatch != none) && selmatch.AltLevels.Length > 0)
        {
            Path = int(Abs(float(Path + ((rung + 1) * (Ladder + 1)))));
            // End:0x25F
            if(int(selmatch.Priority) > 0)
            {
                i = int(selmatch.Priority);                
            }
            else
            {
                i = selmatch.AltLevels.Length;
            }
            tmp = selmatch.AltLevels[int(float(Path) % float(i))];
            // End:0x2BB
            if(tmp != "")
            {
                selmatch.LevelName = tmp;
            }
        }
    }
    // End:0x2DA
    if(selmatch == none)
    {
        Warn("selmatch == none");
    }
    return selmatch;
    //return;    
}

static function byte GetAltLevel(int Ladder, int rung, int Path, int selected)
{
    local array<MatchInfo> matcharray;
    local UT2K4MatchInfo selmatch;
    local int origpath;

    // End:0x13
    if(rung < 0)
    {
        return byte(-1);
    }
    switch(Ladder)
    {
        // End:0x30
        case default.LID_DM:
            matcharray = default.DMMatches;
            // End:0xF7
            break;
        // End:0x46
        case default.LID_TDM:
            matcharray = default.TDMMatches;
            // End:0xF7
            break;
        // End:0x5C
        case default.LID_CTF:
            matcharray = default.CTFMatches;
            // End:0xF7
            break;
        // End:0x72
        case default.LID_BR:
            matcharray = default.BRMatches;
            // End:0xF7
            break;
        // End:0x88
        case default.LID_DOM:
            matcharray = default.DOMMatches;
            // End:0xF7
            break;
        // End:0x9E
        case default.LID_AS:
            matcharray = default.ASMatches;
            // End:0xF7
            break;
        // End:0xB4
        case default.LID_CHAMP:
            matcharray = default.ChampionshipMatches;
            // End:0xF7
            break;
        // End:0xFFFF
        default:
            // End:0xF7
            if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
            {
                matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
            }
            break;
    }
    // End:0x10B
    if(matcharray.Length <= 0)
    {
        return byte(-1);
    }
    // End:0x138
    if(rung >= matcharray.Length)
    {
        selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);        
    }
    else
    {
        selmatch = UT2K4MatchInfo(matcharray[rung]);
    }
    // End:0x296
    if((selmatch != none) && selmatch.AltLevels.Length > 0)
    {
        origpath = int(Abs(float(Path + ((rung + 1) * (Ladder + 1)))));
        // End:0x1CF
        if(int(selmatch.Priority) > 0)
        {
            origpath = int(float(origpath) % float(selmatch.Priority));            
        }
        else
        {
            origpath = int(float(origpath) % float(selmatch.AltLevels.Length));
        }
        // End:0x28E
        if((selected == origpath) || selected == -1)
        {
            Path = int(float(int(Abs(float(Path + ((rung + 1) * (Ladder + 1)))) + float(1))) % float(selmatch.AltLevels.Length));
            // End:0x286
            if(Path == origpath)
            {
                Path = int(float(Path + 1) % float(selmatch.AltLevels.Length));
            }
            return byte(Path);
        }
        return byte(origpath);
    }
    return byte(-1);
    //return;    
}

static function bool HasAltLevel(int Ladder, int rung)
{
    local array<MatchInfo> matcharray;
    local UT2K4MatchInfo selmatch;

    // End:0x0D
    if(rung < 0)
    {
        return false;
    }
    switch(Ladder)
    {
        // End:0x2A
        case default.LID_DM:
            matcharray = default.DMMatches;
            // End:0xF1
            break;
        // End:0x40
        case default.LID_TDM:
            matcharray = default.TDMMatches;
            // End:0xF1
            break;
        // End:0x56
        case default.LID_CTF:
            matcharray = default.CTFMatches;
            // End:0xF1
            break;
        // End:0x6C
        case default.LID_BR:
            matcharray = default.BRMatches;
            // End:0xF1
            break;
        // End:0x82
        case default.LID_DOM:
            matcharray = default.DOMMatches;
            // End:0xF1
            break;
        // End:0x98
        case default.LID_AS:
            matcharray = default.ASMatches;
            // End:0xF1
            break;
        // End:0xAE
        case default.LID_CHAMP:
            matcharray = default.ChampionshipMatches;
            // End:0xF1
            break;
        // End:0xFFFF
        default:
            // End:0xF1
            if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
            {
                matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
            }
            break;
    }
    // End:0xFF
    if(matcharray.Length <= 0)
    {
        return false;
    }
    // End:0x12C
    if(rung >= matcharray.Length)
    {
        selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);        
    }
    else
    {
        selmatch = UT2K4MatchInfo(matcharray[rung]);
    }
    // End:0x14F
    if(selmatch == none)
    {
        return false;
    }
    return selmatch.AltLevels.Length > 1;
    //return;    
}

static function MatchInfo GetCurrentMatchInfo(GameProfile G)
{
    // End:0x3C
    if(UT2K4GameProfile(G) != none)
    {
        return G.GetMatchInfo(G.CurrentLadder, G.CurrentMenuRung);
    }
    return GetUT2K4MatchInfo(G.CurrentLadder, G.CurrentMenuRung);
    //return;    
}

static function int LengthOfLadder(int Ladder)
{
    switch(Ladder)
    {
        // End:0x16
        case default.LID_DM:
            return default.DMMatches.Length;
        // End:0x25
        case default.LID_TDM:
            return default.TDMMatches.Length;
        // End:0x34
        case default.LID_CTF:
            return default.CTFMatches.Length;
        // End:0x43
        case default.LID_BR:
            return default.BRMatches.Length;
        // End:0x52
        case default.LID_DOM:
            return default.DOMMatches.Length;
        // End:0x61
        case default.LID_AS:
            return default.ASMatches.Length;
        // End:0x70
        case default.LID_CHAMP:
            return default.ChampionshipMatches.Length;
        // End:0xFFFF
        default:
            // End:0xAF
            if((Ladder >= 10) && default.AdditionalLadders.Length > (Ladder - 10))
            {
                return default.AdditionalLadders[Ladder - 10].default.Matches.Length;
            }
            return -1;
            break;
    }
    //return;    
}

static function string UpdateLadders(GameProfile G, int CurrentLadder)
{
    local string SpecialEvent;
    local UT2K4GameProfile GP;
    local int i, j;

    GP = UT2K4GameProfile(G);
    // End:0x30
    if(GP == none)
    {
        Warn("PC Load Letter");
        return "";
    }
    // End:0x5A
    if(GP.bIsChallenge)
    {
        return GP.ChallengeInfo.SpecialEvent;
    }
    // End:0x90
    if(CurrentLadder < 10)
    {
        // End:0x90
        if(GP.LadderProgress[CurrentLadder] > G.CurrentMenuRung)
        {
            return "";
        }
    }
    switch(CurrentLadder)
    {
        // End:0xCB
        case default.LID_DM:
            SpecialEvent = default.DMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2BE
            break;
        // End:0xFF
        case default.LID_TDM:
            SpecialEvent = default.TDMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2BE
            break;
        // End:0x133
        case default.LID_CTF:
            SpecialEvent = default.CTFMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2BE
            break;
        // End:0x167
        case default.LID_BR:
            SpecialEvent = default.BRMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2BE
            break;
        // End:0x19B
        case default.LID_DOM:
            SpecialEvent = default.DOMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2BE
            break;
        // End:0x1CF
        case default.LID_AS:
            SpecialEvent = default.ASMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2BE
            break;
        // End:0x203
        case default.LID_CHAMP:
            SpecialEvent = default.ChampionshipMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2BE
            break;
        // End:0xFFFF
        default:
            i = CurrentLadder - 10;
            // End:0x2BB
            if((i >= 0) && default.AdditionalLadders.Length > i)
            {
                j = GP.GetCustomLadderProgress(string(default.AdditionalLadders[i]));
                // End:0x26F
                if(j > G.CurrentMenuRung)
                {
                    return "";
                }
                SpecialEvent = default.AdditionalLadders[i].default.Matches[j].SpecialEvent;
                GP.SetCustomLadderProgress(string(default.AdditionalLadders[i]), 1);
                return SpecialEvent;
            }
            return "";
            break;
    }
    GP.LadderProgress[CurrentLadder] += 1;
    return SpecialEvent;
    //return;    
}

static function string GetMatchDescription(GameProfile G)
{
    return GetLadderDescription(G.CurrentLadder, G.CurrentMenuRung);
    //return;    
}

static function string GetLadderDescription(int LadderId, optional int MatchID)
{
    local string retval;
    local GameRecord GR;

    switch(LadderId)
    {
        // End:0x2C
        case default.LID_DM:
            retval = default.DMMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0x51
        case default.LID_TDM:
            retval = default.TDMMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0x76
        case default.LID_CTF:
            retval = default.CTFMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0x9B
        case default.LID_BR:
            retval = default.BRMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0xC0
        case default.LID_DOM:
            retval = default.DOMMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0xE5
        case default.LID_AS:
            retval = default.ASMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0x10A
        case default.LID_CHAMP:
            retval = default.ChampionshipMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0xFFFF
        default:
            // End:0x15F
            if((LadderId >= 10) && default.AdditionalLadders.Length > (LadderId - 10))
            {
                retval = default.AdditionalLadders[LadderId - 10].default.Matches[MatchID].GameType;                
            }
            else
            {
                return "";
            }
            break;
    }
    GR = Class'Engine.CacheManager'.static.GetGameRecord(retval);
    return GR.GameName;
    //return;    
}

static function int GetRandomLadder(optional bool bIncludeChamp)
{
    // End:0x17
    if(bIncludeChamp)
    {
        return Rand(default.LID_CHAMP) + 1;        
    }
    else
    {
        return Rand(default.LID_AS) + 1;
    }
    //return;    
}

static function string MakeURLFor(GameProfile G)
{
    // End:0x48
    if((UT2K4GameProfile(G) != none) && UT2K4GameProfile(G).bIsChallenge)
    {
        return MakeURLFoMatchInfo(UT2K4GameProfile(G).ChallengeInfo, G);
    }
    return MakeURLFoMatchInfo(GetCurrentMatchInfo(G), G);
    //return;    
}

static function string MakeURLFoMatchInfo(MatchInfo M, GameProfile G)
{
    local string URL;

    // End:0x23
    if(M == none)
    {
        Warn("MatchInfo == none");
        return "";
    }
    G.EnemyTeam = M.EnemyTeamName;
    G.Difficulty = G.BaseDifficulty + M.DifficultyModifier;
    URL = ((((((M.LevelName $ "?Name=") $ G.PlayerName) $ "?Character=") $ G.PlayerCharacter) $ "?SaveGame=") $ G.PackageName) $ M.URLString;
    // End:0x126
    if(M.GoalScore != float(0))
    {
        URL $= ("?GoalScore=" $ string(M.GoalScore));
    }
    // End:0x160
    if(M.NumBots > 0)
    {
        URL $= ("?NumBots=" $ string(M.NumBots));
    }
    // End:0x196
    if(M.GameType != "")
    {
        URL $= ("?Game=" $ M.GameType);
    }
    URL $= "?Team=1?NoSaveDefPlayer?ResetDefPlayer";
    // End:0x21F
    if(UT2K4MatchInfo(M) != none)
    {
        // End:0x21F
        if(UT2K4MatchInfo(M).TimeLimit > float(0))
        {
            URL $= ("?TimeLimit=" $ string(UT2K4MatchInfo(M).TimeLimit));
        }
    }
    return URL;
    //return;    
}

static function Class<ChallengeGame> GetChallengeGame(optional string ClassName, optional UT2K4GameProfile GP)
{
    local array< Class<ChallengeGame> > chalgames;
    local int i;

    // End:0x6B
    if(ClassName == "")
    {
        chalgames = default.ChallengeGames;
        J0x17:

        // End:0x69 [Loop If]
        if(chalgames.Length > 0)
        {
            i = Rand(chalgames.Length);
            // End:0x5A
            if(chalgames[i].static.canChallenge(GP))
            {
                return chalgames[i];
            }
            chalgames.Remove(i, 1);
            // [Loop Continue]
            goto J0x17;
        }
        return none;
    }
    i = 0;
    J0x72:

    // End:0xCE [Loop If]
    if(i < default.ChallengeGames.Length)
    {
        // End:0xC4
        if(string(default.ChallengeGames[i]) ~= ClassName)
        {
            // End:0xC2
            if(default.ChallengeGames[i].static.canChallenge(GP))
            {
                return default.ChallengeGames[i];
            }
            return none;
        }
        i++;
        // [Loop Continue]
        goto J0x72;
    }
    return none;
    //return;    
}

defaultproperties
{
    // Reference: UT2K4MatchInfo'WGame_Decompressed.UT2K4LadderInfo.AS1'
    begin object name="AS1" class=WGame_Decompressed.UT2K4MatchInfo
        PrizeMoney=1500
        TimeLimit=15.0000000
        LevelName="AS-FallenCity"
        EnemyTeamName=";wGame.UT2K4TeamRosterWeak;least"
        DifficultyModifier=0.7500000
        URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=10?ReinforcementsFreq=7?RoundLimit=1"
        NumBots=9
        GameType="UT2k4Assault.ASGameInfo"
    end object
    ASMatches[0]=AS1
    // Reference: UT2K4MatchInfo'WGame_Decompressed.UT2K4LadderInfo.AS2'
    begin object name="AS2" class=WGame_Decompressed.UT2K4MatchInfo
        PrizeMoney=1750
        TimeLimit=15.0000000
        LevelName="AS-RobotFactory"
        EnemyTeamName=";wGame.UT2K4TeamRosterWeak;least"
        SpecialEvent="UPDATETEAMS"
        DifficultyModifier=1.2500000
        URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=11?ReinforcementsFreq=7?RoundLimit=1"
        NumBots=9
        GameType="UT2k4Assault.ASGameInfo"
    end object
    ASMatches[1]=AS2
    // Reference: UT2K4MatchInfo'WGame_Decompressed.UT2K4LadderInfo.AS3'
    begin object name="AS3" class=WGame_Decompressed.UT2K4MatchInfo
        PrizeMoney=2000
        TimeLimit=20.0000000
        LevelName="AS-Convoy"
        EnemyTeamName=";wGame.UT2K4TeamRosterMid;least"
        DifficultyModifier=1.7500000
        URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=12?ReinforcementsFreq=7?RoundLimit=1"
        NumBots=9
        GameType="UT2k4Assault.ASGameInfo"
    end object
    ASMatches[2]=AS3
    // Reference: UT2K4MatchInfo'WGame_Decompressed.UT2K4LadderInfo.AS4'
    begin object name="AS4" class=WGame_Decompressed.UT2K4MatchInfo
        PrizeMoney=2500
        TimeLimit=25.0000000
        LevelName="AS-Glacier"
        EnemyTeamName=";wGame.UT2K4TeamRosterMid;least"
        DifficultyModifier=2.0000000
        URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=13?ReinforcementsFreq=7?RoundLimit=1"
        NumBots=9
        GameType="UT2k4Assault.ASGameInfo"
    end object
    ASMatches[3]=AS4
    // Reference: UT2K4MatchInfo'WGame_Decompressed.UT2K4LadderInfo.AS5'
    begin object name="AS5" class=WGame_Decompressed.UT2K4MatchInfo
        PrizeMoney=3000
        TimeLimit=30.0000000
        LevelName="AS-Junkyard"
        EnemyTeamName=";wGame.UT2K4TeamRosterMid;least"
        SpecialEvent="UPDATETEAMS"
        DifficultyModifier=2.2500000
        URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=14?ReinforcementsFreq=7?RoundLimit=1"
        NumBots=9
        GameType="UT2k4Assault.ASGameInfo"
    end object
    ASMatches[4]=AS5
    // Reference: UT2K4MatchInfo'WGame_Decompressed.UT2K4LadderInfo.AS6'
    begin object name="AS6" class=WGame_Decompressed.UT2K4MatchInfo
        PrizeMoney=3500
        TimeLimit=30.0000000
        LevelName="AS-MotherShip"
        EnemyTeamName=";wGame.UT2K4TeamRosterStrong;least"
        SpecialEvent="COMPLETED AS;UPDATETEAMS"
        DifficultyModifier=2.5000000
        URLString="?TeamScreen=true?FirstAttackingTeam=1?RoundTimeLimit=15?ReinforcementsFreq=7?RoundLimit=1"
        NumBots=9
        GameType="UT2k4Assault.ASGameInfo"
    end object
    ASMatches[5]=AS6
    LID_TDM=1
    LID_CTF=2
    LID_BR=3
    LID_DOM=4
    LID_AS=5
    LID_CHAMP=6
    ChallengeGames[0]=Class'WGame_Decompressed.BloodRites'
    ChallengeGames[1]=Class'WGame_Decompressed.ManoEMano'
    DMMatches=/* Array type was not detected. */
    TDMMatches=/* Array type was not detected. */
    DOMMatches=/* Array type was not detected. */
    CTFMatches=/* Array type was not detected. */
    BRMatches=/* Array type was not detected. */
    ChampionshipMatches=/* Array type was not detected. */
}