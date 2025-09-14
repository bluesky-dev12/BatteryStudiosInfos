/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\UT2K4LadderInfo.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:13
 *
 *******************************************************************************/
class UT2K4LadderInfo extends LadderInfo
    dependson(ChallengeGame)
    dependson(CustomLadderInfo)
    config();

var() editinline array<editinline UT2K4MatchInfo> ASMatches;
var int LID_DM;
var int LID_TDM;
var int LID_CTF;
var int LID_BR;
var int LID_DOM;
var int LID_AS;
var int LID_CHAMP;
var config array< class<CustomLadderInfo> > AdditionalLadders;
var config array< class<ChallengeGame> > ChallengeGames;

static function MatchInfo GetMatchInfo(int Ladder, int rung)
{
    return GetUT2K4MatchInfo(Ladder, rung, 0, true);
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
            // End:0xfd
            break;
        // End:0x4c
        case default.LID_TDM:
            matcharray = default.TDMMatches;
            // End:0xfd
            break;
        // End:0x62
        case default.LID_CTF:
            matcharray = default.CTFMatches;
            // End:0xfd
            break;
        // End:0x78
        case default.LID_BR:
            matcharray = default.BRMatches;
            // End:0xfd
            break;
        // End:0x8e
        case default.LID_DOM:
            matcharray = default.DOMMatches;
            // End:0xfd
            break;
        // End:0xa4
        case default.LID_AS:
            matcharray = default.ASMatches;
            // End:0xfd
            break;
        // End:0xba
        case default.LID_CHAMP:
            matcharray = default.ChampionshipMatches;
            // End:0xfd
            break;
        // End:0xffff
        default:
            // End:0xfd
            if(Ladder >= 10 && default.AdditionalLadders.Length > Ladder - 10)
            {
                matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
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
            // End:0x168
            else
            {
                selmatch = UT2K4MatchInfo(matcharray[rung]);
            }
            // End:0x1e9
            if(selmatch != none && bSelect && selmatch.AltLevels.Length > 0)
            {
                tmp = selmatch.AltLevels[int(float(Path) % float(selmatch.AltLevels.Length))];
                // End:0x1e6
                if(tmp != "")
                {
                    selmatch.LevelName = tmp;
                }
            }
            // End:0x2bb
            else
            {
                // End:0x2bb
                if(selmatch != none && selmatch.AltLevels.Length > 0)
                {
                    Path = int(Abs(float(Path + rung + 1 * Ladder + 1)));
                    // End:0x25f
                    if(selmatch.Priority > 0)
                    {
                        i = selmatch.Priority;
                    }
                    // End:0x274
                    else
                    {
                        i = selmatch.AltLevels.Length;
                    }
                    tmp = selmatch.AltLevels[int(float(Path) % float(i))];
                    // End:0x2bb
                    if(tmp != "")
                    {
                        selmatch.LevelName = tmp;
                    }
                }
            }
            // End:0x2da
            if(selmatch == none)
            {
                Warn("selmatch == none");
            }
            return selmatch;
    }
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
            // End:0xf7
            break;
        // End:0x46
        case default.LID_TDM:
            matcharray = default.TDMMatches;
            // End:0xf7
            break;
        // End:0x5c
        case default.LID_CTF:
            matcharray = default.CTFMatches;
            // End:0xf7
            break;
        // End:0x72
        case default.LID_BR:
            matcharray = default.BRMatches;
            // End:0xf7
            break;
        // End:0x88
        case default.LID_DOM:
            matcharray = default.DOMMatches;
            // End:0xf7
            break;
        // End:0x9e
        case default.LID_AS:
            matcharray = default.ASMatches;
            // End:0xf7
            break;
        // End:0xb4
        case default.LID_CHAMP:
            matcharray = default.ChampionshipMatches;
            // End:0xf7
            break;
        // End:0xffff
        default:
            // End:0xf7
            if(Ladder >= 10 && default.AdditionalLadders.Length > Ladder - 10)
            {
                matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
            }
            // End:0x10b
            if(matcharray.Length <= 0)
            {
                return byte(-1);
            }
            // End:0x138
            if(rung >= matcharray.Length)
            {
                selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);
            }
            // End:0x14e
            else
            {
                selmatch = UT2K4MatchInfo(matcharray[rung]);
            }
            // End:0x296
            if(selmatch != none && selmatch.AltLevels.Length > 0)
            {
                origpath = int(Abs(float(Path + rung + 1 * Ladder + 1)));
                // End:0x1cf
                if(selmatch.Priority > 0)
                {
                    origpath = int(float(origpath) % float(selmatch.Priority));
                }
                // End:0x1f1
                else
                {
                    origpath = int(float(origpath) % float(selmatch.AltLevels.Length));
                }
                // End:0x28e
                if(selected == origpath || selected == -1)
                {
                    Path = int(float(int(Abs(float(Path + rung + 1 * Ladder + 1)) + float(1))) % float(selmatch.AltLevels.Length));
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
    }
}

static function bool HasAltLevel(int Ladder, int rung)
{
    local array<MatchInfo> matcharray;
    local UT2K4MatchInfo selmatch;

    // End:0x0d
    if(rung < 0)
    {
        return false;
    }
    switch(Ladder)
    {
        // End:0x2a
        case default.LID_DM:
            matcharray = default.DMMatches;
            // End:0xf1
            break;
        // End:0x40
        case default.LID_TDM:
            matcharray = default.TDMMatches;
            // End:0xf1
            break;
        // End:0x56
        case default.LID_CTF:
            matcharray = default.CTFMatches;
            // End:0xf1
            break;
        // End:0x6c
        case default.LID_BR:
            matcharray = default.BRMatches;
            // End:0xf1
            break;
        // End:0x82
        case default.LID_DOM:
            matcharray = default.DOMMatches;
            // End:0xf1
            break;
        // End:0x98
        case default.LID_AS:
            matcharray = default.ASMatches;
            // End:0xf1
            break;
        // End:0xae
        case default.LID_CHAMP:
            matcharray = default.ChampionshipMatches;
            // End:0xf1
            break;
        // End:0xffff
        default:
            // End:0xf1
            if(Ladder >= 10 && default.AdditionalLadders.Length > Ladder - 10)
            {
                matcharray = default.AdditionalLadders[Ladder - 10].default.Matches;
            }
            // End:0xff
            if(matcharray.Length <= 0)
            {
                return false;
            }
            // End:0x12c
            if(rung >= matcharray.Length)
            {
                selmatch = UT2K4MatchInfo(matcharray[matcharray.Length - 1]);
            }
            // End:0x142
            else
            {
                selmatch = UT2K4MatchInfo(matcharray[rung]);
            }
            // End:0x14f
            if(selmatch == none)
            {
                return false;
            }
            return selmatch.AltLevels.Length > 1;
    }
}

static function MatchInfo GetCurrentMatchInfo(GameProfile G)
{
    // End:0x3c
    if(UT2K4GameProfile(G) != none)
    {
        return G.GetMatchInfo(G.CurrentLadder, G.CurrentMenuRung);
    }
    return GetUT2K4MatchInfo(G.CurrentLadder, G.CurrentMenuRung);
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
        // End:0xffff
        default:
            // End:0xaf
            if(Ladder >= 10 && default.AdditionalLadders.Length > Ladder - 10)
            {
                return default.AdditionalLadders[Ladder - 10].default.Matches.Length;
            }
            return -1;
    }
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
    // End:0x5a
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
        // End:0xcb
        case default.LID_DM:
            SpecialEvent = default.DMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2be
            break;
        // End:0xff
        case default.LID_TDM:
            SpecialEvent = default.TDMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2be
            break;
        // End:0x133
        case default.LID_CTF:
            SpecialEvent = default.CTFMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2be
            break;
        // End:0x167
        case default.LID_BR:
            SpecialEvent = default.BRMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2be
            break;
        // End:0x19b
        case default.LID_DOM:
            SpecialEvent = default.DOMMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2be
            break;
        // End:0x1cf
        case default.LID_AS:
            SpecialEvent = default.ASMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2be
            break;
        // End:0x203
        case default.LID_CHAMP:
            SpecialEvent = default.ChampionshipMatches[GP.LadderProgress[CurrentLadder]].SpecialEvent;
            // End:0x2be
            break;
        // End:0xffff
        default:
            i = CurrentLadder - 10;
            // End:0x2bb
            if(i >= 0 && default.AdditionalLadders.Length > i)
            {
                j = GP.GetCustomLadderProgress(string(default.AdditionalLadders[i]));
                // End:0x26f
                if(j > G.CurrentMenuRung)
                {
                    return "";
                }
                SpecialEvent = default.AdditionalLadders[i].default.Matches[j].SpecialEvent;
                GP.SetCustomLadderProgress(string(default.AdditionalLadders[i]), 1);
                return SpecialEvent;
            }
            return "";
    }
    GP.LadderProgress[CurrentLadder] += 1;
    return SpecialEvent;
}

static function string GetMatchDescription(GameProfile G)
{
    return GetLadderDescription(G.CurrentLadder, G.CurrentMenuRung);
}

static function string GetLadderDescription(int LadderId, optional int MatchID)
{
    local string retval;
    local GameRecord GR;

    switch(LadderId)
    {
        // End:0x2c
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
        // End:0x9b
        case default.LID_BR:
            retval = default.BRMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0xc0
        case default.LID_DOM:
            retval = default.DOMMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0xe5
        case default.LID_AS:
            retval = default.ASMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0x10a
        case default.LID_CHAMP:
            retval = default.ChampionshipMatches[MatchID].GameType;
            // End:0x162
            break;
        // End:0xffff
        default:
            // End:0x15f
            if(LadderId >= 10 && default.AdditionalLadders.Length > LadderId - 10)
            {
                retval = default.AdditionalLadders[LadderId - 10].default.Matches[MatchID].GameType;
            }
            // End:0x162
            else
            {
                return "";
            }
            GR = class'CacheManager'.static.GetGameRecord(retval);
            return GR.GameName;
    }
}

static function int GetRandomLadder(optional bool bIncludeChamp)
{
    // End:0x17
    if(bIncludeChamp)
    {
        return Rand(default.LID_CHAMP) + 1;
    }
    // End:0x22
    else
    {
        return Rand(default.LID_AS) + 1;
    }
}

static function string MakeURLFor(GameProfile G)
{
    // End:0x48
    if(UT2K4GameProfile(G) != none && UT2K4GameProfile(G).bIsChallenge)
    {
        return MakeURLFoMatchInfo(UT2K4GameProfile(G).ChallengeInfo, G);
    }
    return MakeURLFoMatchInfo(GetCurrentMatchInfo(G), G);
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
    URL = M.LevelName $ "?Name=" $ G.PlayerName $ "?Character=" $ G.PlayerCharacter $ "?SaveGame=" $ G.PackageName $ M.URLString;
    // End:0x126
    if(M.GoalScore != float(0))
    {
        URL $= "?GoalScore=" $ string(M.GoalScore);
    }
    // End:0x160
    if(M.NumBots > 0)
    {
        URL $= "?NumBots=" $ string(M.NumBots);
    }
    // End:0x196
    if(M.GameType != "")
    {
        URL $= "?Game=" $ M.GameType;
    }
    URL $= "?Team=1?NoSaveDefPlayer?ResetDefPlayer";
    // End:0x21f
    if(UT2K4MatchInfo(M) != none)
    {
        // End:0x21f
        if(UT2K4MatchInfo(M).TimeLimit > float(0))
        {
            URL $= "?TimeLimit=" $ string(UT2K4MatchInfo(M).TimeLimit);
        }
    }
    return URL;
}

static function class<ChallengeGame> GetChallengeGame(optional string ClassName, optional UT2K4GameProfile GP)
{
    local array< class<ChallengeGame> > chalgames;
    local int i;

    // End:0x6b
    if(ClassName == "")
    {
        chalgames = default.ChallengeGames;
        J0x17:
        // End:0x69 [While If]
        if(chalgames.Length > 0)
        {
            i = Rand(chalgames.Length);
            // End:0x5a
            if(chalgames[i].static.canChallenge(GP))
            {
                return chalgames[i];
            }
            chalgames.Remove(i, 1);
            // This is an implied JumpToken; Continue!
            goto J0x17;
        }
        return none;
    }
    i = 0;
    J0x72:
    // End:0xce [While If]
    if(i < default.ChallengeGames.Length)
    {
        // End:0xc4
        if(string(default.ChallengeGames[i]) ~= ClassName)
        {
            // End:0xc2
            if(default.ChallengeGames[i].static.canChallenge(GP))
            {
                return default.ChallengeGames[i];
            }
            return none;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x72;
    }
    return none;
}

defaultproperties
{
    ASMatches=// Object reference not set to an instance of an object.
    
    LID_TDM=1
    LID_CTF=2
    LID_BR=3
    LID_DOM=4
    LID_AS=5
    LID_CHAMP=6
    ChallengeGames=// Object reference not set to an instance of an object.
    
    DMMatches=// Object reference not set to an instance of an object.
    
    TDMMatches=// Object reference not set to an instance of an object.
    
    DOMMatches=// Object reference not set to an instance of an object.
    
    CTFMatches=// Object reference not set to an instance of an object.
    
    BRMatches=// Object reference not set to an instance of an object.
    
    ChampionshipMatches=// Object reference not set to an instance of an object.
    
}