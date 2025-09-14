class UT2K4GameProfile extends UT2003GameProfile;

struct LevelPathRecord
{
    var byte Ladder;
    var byte rung;
    var byte selection;
};

struct BotStatsRecord
{
    var string Name;
    var int Price;
    var byte Health;
    var bool FreeAgent;
    var int TeamID;
};

struct TeamStatsRecord
{
    var string Name;
    var int Level;
    var int Matches;
    var int Won;
    var float rating;
};

struct PlayerMatchDetailsRecord
{
    var int id;
    var string Name;
    var float Kills;
    var float Score;
    var float Deaths;
    var int Team;
    var array<string> SpecialAwards;
};

struct PayCheckRecord
{
    var int BotID;
    var int Payment;
};

struct PhantomMatchRecord
{
    var int Team1;
    var int Team2;
    var float ScoreTeam1;
    var float ScoreTeam2;
    var int LadderId;
    var int MatchID;
    var float GameTime;
};

struct TeamMateRankingRecord
{
    var int BotID;
    var float Rank;
};

struct FightHistoryRecord
{
    var int Date[3];
    var int Time[2];
    var string MatchData;
    var string MatchExtra;
    var string Level;
    var string GameType;
    var string EnemyTeam;
    var float PriceMoney;
    var float BalanceChange;
    var float BonusMoney;
    var float GameTime;
    var bool WonGame;
    var float TeamScore[2];
    var bool TeamGame;
    var string TeamLayout[2];
    var float MyScore;
    var int MyKills;
    var int MyDeaths;
    var string MyAwards;
    var byte MyRating;
};

struct TeamRosterRecord
{
    var string Name;
    var array<string> Roster;
};

struct CustomLadderRecord
{
    var string LadderClass;
    var int Progress;
};

var protected int Revision;
var bool bDebug;
var Class<UT2K4LadderInfo> UT2K4GameLadder;
var array<int> LadderProgress;
var MapRecord ActiveMap;
var int AltPath;
var array<LevelPathRecord> LevelRoute;
var protected int MaxTeamSize;
var array<BotStatsRecord> BotStats;
var array<TeamStatsRecord> TeamStats;
var int Balance;
var int MinBalance;
var float TotalTime;
var bool bCompleted;
var string FinalEnemyTeam;
var protected bool bCheater;
var protected bool bLocked;
var protected string PlayerIDHash;
var float TeamPercentage;
var float MatchBonus;
var float LoserFee;
var float FeeIncrease;
var float InjuryChance;
var int LastInjured;
var float InjuryTreatment;
var float ChallengeChance;
var bool lmdFreshInfo;
var array<PlayerMatchDetailsRecord> PlayerMatchDetails;
var int lmdBalanceChange;
var bool lmdWonMatch;
var string lmdEnemyTeam;
var string lmdGameType;
var bool lmdbChallengeGame;
var string lmdMap;
var int lmdPrizeMoney;
var int lmdTotalBonusMoney;
var int lmdSpree[6];
var int lmdMultiKills[7];
var int lmdInjury;
var byte lmdInjuryHealth;
var int lmdInjuryTreatment;
var float lmdGameTime;
var bool lmdTeamGame;
var int lmdMyTeam;
var array<PayCheckRecord> PayCheck;
var array<PhantomMatchRecord> PhantomMatches;
var array<TeamMateRankingRecord> TeamMateRanking;
var array<string> PhantomTeams;
var bool bIsChallenge;
var UT2K4MatchInfo ChallengeInfo;
var Class<ChallengeGame> ChallengeGameClass;
var bool bGotChallenged;
var string ChallengeVariable;
var string LoginMenuClass;
var name LogPrefix;
var int Spree[6];
var int MultiKills[7];
var int SpecialAwards[6];
var int SpreeBonus[6];
var int MultiKillBonus[7];
var localized string msgSpecialAward[6];
var int sae_flackmonkey;
var int sae_combowhore;
var int sae_headhunter;
var int sae_roadrampage;
var int sae_hattrick;
var int sae_untouchable;
var localized string msgCheater;
var localized string msgCredits;
var localized string msgCredit;
var protected float ForFeitFee;
var float MapChallengeCost;
var array<FightHistoryRecord> FightHistory;
var localized string msgChallengeGame;
var localized string msgAdditionalLadder;
var localized string msgMatch;
var localized string msgLadderGame;
var localized string msgChampionship;
var array<TeamRosterRecord> AltTeamRoster;
var array<CustomLadderRecord> CustomLadders;
var Class<CustomLadderInfo> LastCustomCladder;
var bool bShowDetails;

function CreateProfile(PlayerController PlayerOwner)
{
    // End:0x21
    if(PlayerIDHash == "")
    {
        PlayerIDHash = PlayerOwner.GetPlayerIDHash();
    }
    //return;    
}

function LoadProfile(PlayerController PlayerOwner)
{
    // End:0x36
    if(PlayerIDHash != PlayerOwner.GetPlayerIDHash())
    {
        bLocked = true;
        PlayerIDHash = PlayerOwner.GetPlayerIDHash();
    }
    //return;    
}

function Initialize(GameInfo currentGame, string pn)
{
    local Controller C;

    // End:0x31
    if(UT2K4GameLadder == none)
    {
        UT2K4GameLadder = Class<UT2K4LadderInfo>(DynamicLoadObject(GameLadderName, Class'Core.Class'));
        GameLadder = UT2K4GameLadder;
    }
    PackageName = pn;
    UpgradeGP();
    C = currentGame.Level.ControllerList;
    J0x5F:

    // End:0xB3 [Loop If]
    if(C != none)
    {
        // End:0x9C
        if(PlayerController(C) != none)
        {
            currentGame.ChangeName(PlayerController(C), PlayerName, false);
            // [Explicit Break]
            goto J0xB3;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x5F;
    }
    J0xB3:

    NextMatchObject = none;
    ChampBorderObject = none;
    PlayerTeam.Length = GetMaxTeamSize();
    // End:0x105
    if((DeathMatch(currentGame) != none) && LoginMenuClass != "")
    {
        DeathMatch(currentGame).LoginMenuClass = LoginMenuClass;
    }
    //return;    
}

function ContinueSinglePlayerGame(LevelInfo Level, optional bool bReplace)
{
    local Controller C;
    local PlayerController PC;

    PC = none;
    C = Level.ControllerList;
    J0x1B:

    // End:0x60 [Loop If]
    if(C != none)
    {
        // End:0x49
        if(PlayerController(C) != none)
        {
            PC = PlayerController(C);
            // [Explicit Break]
            goto J0x60;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1B;
    }
    J0x60:

    // End:0x6D
    if(PC == none)
    {
        return;
    }
    // End:0xBE
    if(!Level.Game.SavePackage(PackageName))
    {
        Warn(("level.game.SavePackage(" @ PackageName) @ ") FAILED.");
    }
    bIsChallenge = false;
    PC.ConsoleCommand("disconnect");
    //return;    
}

function CheatSkipMatch(GameInfo currentGame)
{
    local UT2K4MatchInfo mi;

    mi = UT2K4MatchInfo(GetMatchInfo(CurrentLadder, CurrentMenuRung));
    Balance = int((float(Balance) + ForFeitFee) + float(mi.PrizeMoney));
    super(GameProfile).CheatSkipMatch(currentGame);
    //return;    
}

function RegisterGame(GameInfo currentGame, PlayerReplicationInfo PRI)
{
    local UT2K4MatchInfo mi;
    local int i, j, OldBalance;
    local float TeamRating;
    local array<PlayerReplicationInfo> PRIArray;
    local bool TempbIsChallenge, doPayTeamMates;
    local string tmp;

    mi = UT2K4MatchInfo(GetMatchInfo(CurrentLadder, CurrentMenuRung));
    Balance += int(ForFeitFee);
    OldBalance = Balance;
    PayCheck.Length = 0;
    SpecialEvent = "";
    TempbIsChallenge = bIsChallenge;
    // End:0x81
    if(bIsChallenge && ChallengeGameClass != none)
    {
        ChallengeGameClass.static.PreRegisterGame(self, currentGame, PRI);
    }
    Kills += PRI.Kills;
    Goals += PRI.GoalsScored;
    Deaths += int(PRI.Deaths);
    Matches++;
    TotalTime += (currentGame.Level.TimeSeconds - currentGame.StartTime);
    lmdTotalBonusMoney = 0;
    LastInjured = -1;
    PayCheck.Length = 0;
    PlayerMatchDetails.Length = 0;
    // End:0x25F
    if(TeamPlayerReplicationInfo(PRI) != none)
    {
        i = 0;
        J0x130:

        // End:0x1C4 [Loop If]
        if(i < 6)
        {
            Spree[i] += int(TeamPlayerReplicationInfo(PRI).Spree[i]);
            lmdSpree[i] = int(TeamPlayerReplicationInfo(PRI).Spree[i]);
            lmdTotalBonusMoney += (int(TeamPlayerReplicationInfo(PRI).Spree[i]) * SpreeBonus[i]);
            i++;
            // [Loop Continue]
            goto J0x130;
        }
        i = 0;
        J0x1CB:

        // End:0x25F [Loop If]
        if(i < 7)
        {
            MultiKills[i] += int(TeamPlayerReplicationInfo(PRI).MultiKills[i]);
            lmdMultiKills[i] = int(TeamPlayerReplicationInfo(PRI).MultiKills[i]);
            lmdTotalBonusMoney += (int(TeamPlayerReplicationInfo(PRI).MultiKills[i]) * MultiKillBonus[i]);
            i++;
            // [Loop Continue]
            goto J0x1CB;
        }
    }
    Balance += lmdTotalBonusMoney;
    // End:0x4C4
    if(CurrentLadder != UT2K4GameLadder.default.LID_DM)
    {
        i = GetTeamPosition(EnemyTeam, true);
        TeamStats[i].Matches++;
        // End:0x2C4
        if(!bWonMatch)
        {
            TeamStats[i].Won++;
        }
        TeamRating = 0.0000000;
        // End:0x3C6
        if(currentGame.bTeamGame)
        {
            TeamRating = (TeamGame(currentGame).Teams[int(float(PRI.Team.TeamIndex + 1) % float(2))].Score + 1.0000000) / (TeamGame(currentGame).Teams[PRI.Team.TeamIndex].Score + 1.0000000);
            RankTeamMates(currentGame, PRI);
            // End:0x3AC
            if(TempbIsChallenge && ChallengeGameClass != none)
            {
                doPayTeamMates = ChallengeGameClass.static.InjureTeamMate(self);                
            }
            else
            {
                doPayTeamMates = true;
            }
            // End:0x3C3
            if(doPayTeamMates)
            {
                InjureTeamMate();
            }            
        }
        else
        {
            currentGame.GameReplicationInfo.GetPRIArray(PRIArray);
            j = 0;
            J0x3EA:

            // End:0x453 [Loop If]
            if(j < PRIArray.Length)
            {
                // End:0x449
                if((PRIArray[j] != PRI) && TeamRating < PRIArray[j].Score)
                {
                    TeamRating = PRIArray[j].Score;
                }
                j++;
                // [Loop Continue]
                goto J0x3EA;
            }
            TeamRating /= (PRI.Score + 1.0000000);
        }
        // End:0x496
        if(bDebug)
        {
            Log("TeamRating =" @ string(TeamRating), LogPrefix);
        }
        // End:0x4AD
        if(bWonMatch)
        {
            TeamRating *= float(-1);
        }
        TeamStats[i].rating += TeamRating;
    }
    // End:0x5CA
    if(currentGame.bTeamGame && !bIsChallenge)
    {
        // End:0x505
        if(TeamRating > float(0))
        {
            TeamRating = 0.5000000 / TeamRating;            
        }
        else
        {
            // End:0x526
            if(TeamRating > -0.5000000)
            {
                TeamRating = -1.0000000 - TeamRating;
            }
        }
        TeamRating = 0.5000000 + Abs(TeamRating);
        // End:0x572
        if(bDebug)
        {
            Log(("Challenge chance =" @ string(TeamRating)) @ string(ChallengeChance * TeamRating));
        }
        // End:0x5CA
        if(FRand() < (ChallengeChance * TeamRating))
        {
            tmp = string(GetChallengeGame());
            // End:0x5CA
            if(tmp != "")
            {
                SpecialEvent = ((("CHALLENGE" @ EnemyTeam) @ tmp) $ ";") $ SpecialEvent;
            }
        }
    }
    // End:0x5FA
    if(TempbIsChallenge && ChallengeGameClass != none)
    {
        doPayTeamMates = ChallengeGameClass.static.PayTeamMates(self);        
    }
    else
    {
        doPayTeamMates = true;
    }
    // End:0x692
    if(bWonMatch)
    {
        SpecialEvent $= (";" $ GameLadder.static.UpdateLadders(self, CurrentLadder));
        Wins++;
        Balance += mi.PrizeMoney;
        // End:0x68F
        if(currentGame.bTeamGame && doPayTeamMates)
        {
            PayTeamMates(mi.PrizeMoney, TeamPercentage, TeamMateRanking.Length / 2, FeeIncrease);
        }        
    }
    else
    {
        // End:0x6D4
        if(currentGame.bTeamGame && doPayTeamMates)
        {
            PayTeamMates(Balance, LoserFee, TeamMateRanking.Length / 3, FeeIncrease / float(2));
        }
    }
    lmdBalanceChange = Balance - OldBalance;
    procLastMatchDetails(currentGame, PRI, mi);
    AddHistoryRecord(currentGame, PRI, mi);
    bIsChallenge = false;
    // End:0x74F
    if(completedLadder(UT2K4GameLadder.default.LID_DM))
    {
        procPhantomMatches(int(Ceil((float(TeamStats.Length - 1) / 2.0000000) * FRand())));
    }
    // End:0x77F
    if(TempbIsChallenge && ChallengeGameClass != none)
    {
        ChallengeGameClass.static.PostRegisterGame(self, currentGame, PRI);
    }
    // End:0x7AD
    if(Balance < MinBalance)
    {
        Balance = MinBalance;
        SpecialEvent $= ";DONATION";
    }
    bWonMatch = false;
    //return;    
}

function StartNewMatch(int PickedLadder, LevelInfo CurrentLevel)
{
    local Controller C;
    local string NewURL;
    local int i;
    local bool doCancelFee;

    lmdFreshInfo = false;
    bWonMatch = false;
    bInLadderGame = true;
    CurrentLadder = PickedLadder;
    // End:0x50
    if(PickedLadder >= 10)
    {
        LastCustomCladder = UT2K4GameLadder.default.AdditionalLadders[PickedLadder - 10];        
    }
    else
    {
        LastCustomCladder = none;
    }
    // End:0x69
    if(!bIsChallenge)
    {
        ChallengeGameClass = none;
    }
    NewURL = GameLadder.static.MakeURLFor(self);
    EnemyTeam = GetEnemyTeamName(EnemyTeam);
    // End:0xBD
    if(bDebug)
    {
        Log("Selected EnemyTeam =" @ EnemyTeam, LogPrefix);
    }
    // End:0xD0
    if(!bIsChallenge)
    {
        SpecialEvent = "";
    }
    doCancelFee = true;
    // End:0x105
    if(bIsChallenge && ChallengeGameClass != none)
    {
        doCancelFee = ChallengeGameClass.static.PayTeamMates(self);
    }
    TeamMateRanking.Length = 0;
    // End:0x1AE
    if(doCancelFee)
    {
        i = 0;
        J0x11D:

        // End:0x173 [Loop If]
        if(i < (GetNumTeammatesForMatch()))
        {
            TeamMateRanking.Length = TeamMateRanking.Length + 1;
            TeamMateRanking[TeamMateRanking.Length - 1].BotID = GetBotPosition(PlayerTeam[PlayerLineup[i]]);
            i++;
            // [Loop Continue]
            goto J0x11D;
        }
        ForFeitFee = PayTeamMates(Balance, LoserFee);
        // End:0x1AB
        if(bDebug)
        {
            Log("ForFeitFee =" @ string(ForFeitFee));
        }        
    }
    else
    {
        ForFeitFee = 0.0000000;
    }
    CurrentLevel.Game.SavePackage(PackageName);
    C = CurrentLevel.ControllerList;
    J0x1EA:

    // End:0x241 [Loop If]
    if(C != none)
    {
        // End:0x22A
        if(PlayerController(C) != none)
        {
            PlayerController(C).ConsoleCommand("START" @ NewURL);
            return;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x1EA;
    }
    Warn("No local player controller found");
    //return;    
}

function ReportCheat(PlayerController Cheater, string cheat)
{
    local string S;

    S = msgCheater;
    // End:0x65
    if(Cheater != none)
    {
        Cheater.ClearProgressMessages();
        Cheater.SetProgressTime(6.0000000);
        Cheater.SetProgressMessage(0, S, Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0));
    }
    // End:0x95
    if(cheat != "")
    {
        S @= ("Player used cheat:" @ cheat);
    }
    Log(S, LogPrefix);
    bCheater = true;
    //return;    
}

function bool IsCheater()
{
    return bCheater;
    //return;    
}

function bool CanChangeTeam(Controller Other, int NewTeam)
{
    // End:0x14
    if(Other.bGodMode)
    {
        return true;
    }
    return (!Other.Level.Game.GameReplicationInfo.bMatchHasBegun && Other.PlayerReplicationInfo != none) && Other.PlayerReplicationInfo.Team == none;
    //return;    
}

function MatchInfo GetMatchInfo(int Ladder, int rung)
{
    local int i;

    // End:0x0F
    if(bIsChallenge)
    {
        return ChallengeInfo;
    }
    // End:0x84
    if(UT2K4GameLadder != none)
    {
        i = GetSelectedLevel(Ladder, rung);
        // End:0x62
        if(i > -1)
        {
            return UT2K4GameLadder.static.GetUT2K4MatchInfo(Ladder, rung, i, true);            
        }
        else
        {
            return UT2K4GameLadder.static.GetUT2K4MatchInfo(Ladder, rung, AltPath);
        }        
    }
    else
    {
        Warn("UT2K4GameLadder == none");
        return none;
    }
    //return;    
}

function UT2K4MatchInfo GetSelectedMatchInfo(int Ladder, int rung, int selection, optional bool bOrig)
{
    // End:0x56
    if(UT2K4GameLadder != none)
    {
        // End:0x36
        if(bOrig)
        {
            return UT2K4GameLadder.static.GetUT2K4MatchInfo(Ladder, rung, AltPath);            
        }
        else
        {
            return UT2K4GameLadder.static.GetUT2K4MatchInfo(Ladder, rung, selection, true);
        }
    }
    Warn("UT2K4GameLadder == none");
    return none;
    //return;    
}

function bool HasAltLevel(int Ladder, int rung)
{
    // End:0x25
    if(UT2K4GameLadder != none)
    {
        return UT2K4GameLadder.static.HasAltLevel(Ladder, rung);
    }
    Warn("UT2K4GameLadder == none");
    return false;
    //return;    
}

function byte GetAltLevel(int Ladder, int rung)
{
    // End:0x3A
    if(UT2K4GameLadder != none)
    {
        return UT2K4GameLadder.static.GetAltLevel(Ladder, rung, AltPath, GetSelectedLevel(Ladder, rung));
    }
    Warn("UT2K4GameLadder == none");
    return byte(-1);
    //return;    
}

function string GetMatchDescription()
{
    local int i;
    local array<GameRecord> GR;

    // End:0x72
    if(bIsChallenge)
    {
        Class'Engine.CacheManager'.static.GetGameTypeList(GR);
        i = 0;
        J0x21:

        // End:0x6F [Loop If]
        if(i < GR.Length)
        {
            // End:0x65
            if(GR[i].ClassName ~= ChallengeInfo.GameType)
            {
                return GR[i].GameName;
            }
            i++;
            // [Loop Continue]
            goto J0x21;
        }
        return "";
    }
    return GameLadder.static.GetMatchDescription(self);
    //return;    
}

function int GetNumTeammatesForMatch()
{
    local MatchInfo M;

    // End:0x17
    if(bIsChallenge)
    {
        M = ChallengeInfo;        
    }
    else
    {
        M = GameLadder.static.GetCurrentMatchInfo(self);
    }
    return GetNumTeammatesForMatchInfo(M);
    //return;    
}

function int GetNumTeammatesForMatchInfo(MatchInfo M)
{
    // End:0x1E
    if(!IsTeamGametype(M.GameType))
    {
        return 0;        
    }
    else
    {
        return M.NumBots / 2;
    }
    //return;    
}

function bool IsTeamGametype(string GameType)
{
    local GameRecord GR;

    // End:0x0E
    if(GameType == "")
    {
        return false;
    }
    GR = Class'Engine.CacheManager'.static.GetGameRecord(GameType);
    return GR.bTeamGame;
    //return;    
}

function int LengthOfLadder(int LadderId)
{
    // End:0x23
    if(GameLadder != none)
    {
        return GameLadder.static.LengthOfLadder(LadderId);        
    }
    else
    {
        Warn("PC Load Letter");
        return -1;
    }
    //return;    
}

function int GetMaxTeamSize()
{
    return MaxTeamSize;
    //return;    
}

function enableLadder(int LadderId)
{
    // End:0x12
    if(LadderId > LadderProgress.Length)
    {
        return;
    }
    // End:0x9C
    if(LadderId == -1)
    {
        enableLadder(UT2K4GameLadder.default.LID_DM);
        enableLadder(UT2K4GameLadder.default.LID_TDM);
        enableLadder(UT2K4GameLadder.default.LID_CTF);
        enableLadder(UT2K4GameLadder.default.LID_BR);
        enableLadder(UT2K4GameLadder.default.LID_DOM);
        enableLadder(UT2K4GameLadder.default.LID_AS);        
    }
    else
    {
        // End:0xBE
        if(LadderProgress[LadderId] == -1)
        {
            LadderProgress[LadderId] = 0;
        }
    }
    //return;    
}

function int GetCustomLadderProgress(string LadderName)
{
    local int i;

    i = GetCustomLadder(LadderName);
    // End:0x26
    if(i == -1)
    {
        return -1;
    }
    return CustomLadders[i].Progress;
    //return;    
}

function SetCustomLadderProgress(string LadderName, int increase)
{
    local int i;

    i = GetCustomLadder(LadderName);
    // End:0x22
    if(i == -1)
    {
        return;
    }
    CustomLadders[i].Progress += increase;
    //return;    
}

function RegisterCustomLadder(string LadderName)
{
    // End:0x17
    if((GetCustomLadder(LadderName)) > -1)
    {
        return;
    }
    CustomLadders.Length = CustomLadders.Length + 1;
    CustomLadders[CustomLadders.Length - 1].LadderClass = LadderName;
    CustomLadders[CustomLadders.Length - 1].Progress = 0;
    //return;    
}

function int GetCustomLadder(string LadderName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < CustomLadders.Length)
    {
        // End:0x37
        if(CustomLadders[i].LadderClass ~= LadderName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
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

    // End:0xE1 [Loop If]
    if(i < (GetMaxTeamSize()))
    {
        // End:0xC0
        if((i >= PlayerTeam.Length) || PlayerTeam[i] == "")
        {
            PlayerTeam[i] = botname;
            i = GetBotPosition(botname, true);
            BotStats[i].FreeAgent = false;
            BotStats[i].TeamID = -1;
            // End:0xBE
            if(bDebug)
            {
                Log("Added team mate:" @ botname, LogPrefix);
            }
            return true;
        }
        // End:0xD7
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

    // End:0x101 [Loop If]
    if(i < (GetMaxTeamSize()))
    {
        // End:0xF7
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
            j = GetBotPosition(botname, true);
            BotStats[j].FreeAgent = true;
            BotStats[j].TeamID = -1;
            // End:0xF5
            if(bDebug)
            {
                Log("Released team mate:" @ botname, LogPrefix);
            }
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return false;
    //return;    
}

function bool IsTeammate(string botname)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < (GetMaxTeamSize()))
    {
        // End:0x2E
        if(PlayerTeam[i] ~= botname)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function string GetLadderDescription(int LadderId, optional int MatchID)
{
    return UT2K4GameLadder.static.GetLadderDescription(LadderId, MatchID);
    //return;    
}

function bool completedLadder(int LadderId)
{
    return LadderProgress[LadderId] >= (LengthOfLadder(LadderId));
    //return;    
}

function bool openChampionshipLadder()
{
    return (((completedLadder(UT2K4GameLadder.default.LID_DOM)) && completedLadder(UT2K4GameLadder.default.LID_CTF)) && completedLadder(UT2K4GameLadder.default.LID_AS)) && completedLadder(UT2K4GameLadder.default.LID_BR);
    //return;    
}

function RankTeamMates(GameInfo Game, PlayerReplicationInfo Me)
{
    local array<PlayerReplicationInfo> PRI;
    local int i, j;
    local float Rank;
    local TeamMateRankingRecord temp;

    TeamMateRanking.Length = 0;
    Game.GameReplicationInfo.GetPRIArray(PRI);
    i = 0;
    J0x2C:

    // End:0x118 [Loop If]
    if(i < PRI.Length)
    {
        // End:0x10E
        if((PRI[i].Team == Me.Team) && PRI[i] != Me)
        {
            Rank = float(PRI[i].Kills + 1) / (PRI[i].Deaths + float(1));
            TeamMateRanking.Length = TeamMateRanking.Length + 1;
            TeamMateRanking[TeamMateRanking.Length - 1].BotID = GetBotPosition(PRI[i].PlayerName, true);
            TeamMateRanking[TeamMateRanking.Length - 1].Rank = Rank;
        }
        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    i = 0;
    J0x11F:

    // End:0x1BF [Loop If]
    if(i < TeamMateRanking.Length)
    {
        j = i + 1;
        J0x13D:

        // End:0x1B5 [Loop If]
        if(j < TeamMateRanking.Length)
        {
            // End:0x1AB
            if(TeamMateRanking[i].Rank < TeamMateRanking[j].Rank)
            {
                temp = TeamMateRanking[i];
                TeamMateRanking[i] = TeamMateRanking[j];
                TeamMateRanking[j] = temp;
            }
            j++;
            // [Loop Continue]
            goto J0x13D;
        }
        i++;
        // [Loop Continue]
        goto J0x11F;
    }
    // End:0x240
    if(bDebug)
    {
        Log("Rand team mates", LogPrefix);
        i = 0;
        J0x1E7:

        // End:0x240 [Loop If]
        if(i < TeamMateRanking.Length)
        {
            Log(((string(i) $ "]") @ BotStats[TeamMateRanking[i].BotID].Name) @ string(TeamMateRanking[i].Rank));
            i++;
            // [Loop Continue]
            goto J0x1E7;
        }
    }
    //return;    
}

function float PayTeamMates(int money, float FeeModifier, optional int IncreaseFeeOf, optional float updateFee)
{
    local int i, BotID;
    local float fee, totalFee;

    totalFee = 0.0000000;
    PayCheck.Length = TeamMateRanking.Length;
    i = 0;
    J0x1F:

    // End:0x136 [Loop If]
    if(i < TeamMateRanking.Length)
    {
        BotID = TeamMateRanking[i].BotID;
        fee = float(GetBotPrice(, BotID)) * FeeModifier;
        fee += ((float(money) * MatchBonus) * float((TeamMateRanking.Length - i) / TeamMateRanking.Length));
        PayCheck[i].BotID = BotID;
        PayCheck[i].Payment = int(fee);
        // End:0x112
        if(bDebug)
        {
            Log(((("Paycheck: " $ string(i)) $ "]") @ BotStats[PayCheck[i].BotID].Name) @ string(PayCheck[i].Payment));
        }
        Balance -= int(fee);
        totalFee += fee;
        i++;
        // [Loop Continue]
        goto J0x1F;
    }
    IncreaseFeeOf = TeamMateRanking.Length - Min(IncreaseFeeOf, TeamMateRanking.Length);
    i = TeamMateRanking.Length - 1;
    J0x160:

    // End:0x1E4 [Loop If]
    if(i >= IncreaseFeeOf)
    {
        GetBotPrice(, TeamMateRanking[i].BotID, updateFee);
        // End:0x1DA
        if(bDebug)
        {
            Log(((("Increase fee: " $ string(i)) $ "]") @ BotStats[TeamMateRanking[i].BotID].Name) @ string(updateFee));
        }
        i--;
        // [Loop Continue]
        goto J0x160;
    }
    return totalFee;
    //return;    
}

function int GetBotPrice(optional string botname, optional int BotID, optional float increase, optional bool bAdd)
{
    // End:0x23
    if(botname != "")
    {
        BotID = GetBotPosition(botname, bAdd);
    }
    // End:0x4A
    if((BotID == -1) || BotID > BotStats.Length)
    {
        return -1;
    }
    // End:0x73
    if(increase > float(1))
    {
        BotStats[BotID].Price += int(increase);        
    }
    else
    {
        // End:0x9C
        if(increase > float(0))
        {
            BotStats[BotID].Price *= (float(1) + increase);
        }
    }
    return BotStats[BotID].Price;
    //return;    
}

function int GetBotPosition(string botname, optional bool bAdd)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < BotStats.Length)
    {
        // End:0x37
        if(BotStats[i].Name ~= botname)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0xE5
    if(bAdd)
    {
        BotStats.Length = i + 1;
        BotStats[i].Name = botname;
        BotStats[i].Price = Class'WGame_Decompressed.wUtil'.static.GetSalaryFor(Class'WGame_Decompressed.wUtil'.static.FindPlayerRecord(botname));
        BotStats[i].Health = 100;
        BotStats[i].FreeAgent = true;
        BotStats[i].TeamID = -1;
        return i;
    }
    return -1;
    //return;    
}

function InjureTeamMate(optional int Number)
{
    local int i;

    // End:0x12
    if(Number <= 0)
    {
        Number = 1;
    }
    Number = TeamMateRanking.Length - Min(Number, TeamMateRanking.Length);
    i = TeamMateRanking.Length - 1;
    J0x3C:

    // End:0x13E [Loop If]
    if(i >= Number)
    {
        // End:0x5A
        if(FRand() > InjuryChance)
        {
            // [Explicit Continue]
            goto J0x134;
        }
        BotStats[TeamMateRanking[i].BotID].Health = byte(float(Min(int(TeamMateRanking[i].Rank * float(25)), 60) + 25) + (float(10) * FRand()));
        LastInjured = TeamMateRanking[i].BotID;
        // End:0x134
        if(bDebug)
        {
            Log(((("InjureTeamMate =" @ BotStats[TeamMateRanking[i].BotID].Name) @ "got injured, health") @ string(BotStats[TeamMateRanking[i].BotID].Health)) $ "%", LogPrefix);
        }
        J0x134:

        i--;
        // [Loop Continue]
        goto J0x3C;
    }
    //return;    
}

function bool HasFullTeam()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x35 [Loop If]
    if(i < (GetMaxTeamSize()))
    {
        // End:0x2B
        if(PlayerTeam[i] == "")
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function string GetEnemyTeamName(string MagicString)
{
    local array<string> Parts, Teams;
    local Class<UT2K4RosterGroup> RGclass;
    local float X, mod;
    local int i, j;

    // End:0x16
    if(Left(MagicString, 1) != ";")
    {
        return MagicString;
    }
    // End:0x4F
    if(Split(MagicString, ";", Parts) < 3)
    {
        Warn("invalid magic string:" @ MagicString);
        return "";
    }
    RGclass = Class<UT2K4RosterGroup>(DynamicLoadObject(Parts[1], Class'Core.Class'));
    // End:0xA1
    if(RGclass == none)
    {
        Warn("Invalid team roster class:" @ Parts[1]);
        return "";
    }
    Teams.Length = 0;
    // End:0xD1
    if((Parts[2] ~= "final") && FinalEnemyTeam != "")
    {
        return FinalEnemyTeam;
    }
    // End:0x235
    if((Parts[2] ~= "least") || Parts[2] ~= "most")
    {
        // End:0x11B
        if(Parts[2] ~= "most")
        {
            mod = -1.0000000;            
        }
        else
        {
            mod = 1.0000000;
        }
        X = mod * float(2147483647);
        i = 0;
        J0x141:

        // End:0x232 [Loop If]
        if(i < RGclass.default.Rosters.Length)
        {
            j = GetTeamPosition(RGclass.default.Rosters[i], true);
            // End:0x1C2
            if((float(TeamStats[j].Matches) * mod) == X)
            {
                Teams[Teams.Length] = RGclass.default.Rosters[i];
                // [Explicit Continue]
                goto J0x228;
            }
            // End:0x228
            if((float(TeamStats[j].Matches) * mod) < X)
            {
                X = float(TeamStats[j].Matches) * mod;
                Teams.Length = 1;
                Teams[0] = RGclass.default.Rosters[i];
            }
            J0x228:

            i++;
            // [Loop Continue]
            goto J0x141;
        }        
    }
    else
    {
        // End:0x3B3
        if(((Parts[2] ~= "best") || Parts[2] ~= "worst") || Parts[2] ~= "final")
        {
            // End:0x296
            if(Parts[2] ~= "worst")
            {
                mod = -1.0000000;                
            }
            else
            {
                mod = 1.0000000;
            }
            X = (mod * float(2147483647)) * float(-1);
            i = 0;
            J0x2C5:

            // End:0x3B0 [Loop If]
            if(i < RGclass.default.Rosters.Length)
            {
                j = GetTeamPosition(RGclass.default.Rosters[i], true);
                // End:0x344
                if((TeamStats[j].rating * mod) == X)
                {
                    Teams[Teams.Length] = RGclass.default.Rosters[i];
                    // [Explicit Continue]
                    goto J0x3A6;
                }
                // End:0x3A6
                if((TeamStats[j].rating * mod) > X)
                {
                    X = TeamStats[j].rating * mod;
                    Teams.Length = 1;
                    Teams[0] = RGclass.default.Rosters[i];
                }
                J0x3A6:

                i++;
                // [Loop Continue]
                goto J0x2C5;
            }            
        }
        else
        {
            // End:0x3DF
            if(Parts[2] ~= "random")
            {
                Teams = RGclass.default.Rosters;                
            }
            else
            {
                Warn("unsupported magic string:" @ Parts[2]);
            }
        }
    }
    // End:0x478
    if(Teams.Length == 0)
    {
        X = float(Rand(RGclass.default.Rosters.Length));
        Warn("empty team list, will use:" @ RGclass.default.Rosters[int(X)]);
        return RGclass.default.Rosters[int(X)];
    }
    // End:0x4A6
    if(Parts[2] ~= "final")
    {
        FinalEnemyTeam = Teams[Rand(Teams.Length)];
        return FinalEnemyTeam;
    }
    return Teams[Rand(Teams.Length)];
    //return;    
}

function int GetTeamPosition(string TeamName, optional bool bAdd)
{
    local int j, i, k;
    local Class<UT2K4TeamRoster> tR;

    j = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(j < TeamStats.Length)
    {
        // End:0x37
        if(TeamStats[j].Name ~= TeamName)
        {
            return j;
        }
        j++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x147
    if(bAdd)
    {
        TeamStats.Length = j + 1;
        TeamStats[j].Name = TeamName;
        TeamStats[j].Matches = 0;
        TeamStats[j].Won = 0;
        tR = Class<UT2K4TeamRoster>(DynamicLoadObject(TeamName, Class'Core.Class'));
        TeamStats[j].Level = tR.default.TeamLevel;
        i = 0;
        J0xD4:

        // End:0x141 [Loop If]
        if(i < tR.default.RosterNames.Length)
        {
            k = GetBotPosition(tR.default.RosterNames[i], true);
            BotStats[k].TeamID = j;
            BotStats[k].FreeAgent = false;
            i++;
            // [Loop Continue]
            goto J0xD4;
        }
        return j;
    }
    return -1;
    //return;    
}

function procLastMatchDetails(GameInfo currentGame, PlayerReplicationInfo PRI, UT2K4MatchInfo mi)
{
    local array<PlayerReplicationInfo> PRIArray;
    local int i;

    lmdFreshInfo = true;
    lmdbChallengeGame = bIsChallenge;
    lmdTeamGame = currentGame.bTeamGame;
    lmdWonMatch = bWonMatch;
    lmdEnemyTeam = EnemyTeam;
    lmdGameType = currentGame.GameName;
    lmdGameTime = currentGame.Level.TimeSeconds - currentGame.StartTime;
    lmdMap = Left(string(currentGame.Level), InStr(string(currentGame.Level), "."));
    // End:0xE5
    if(PRI.Team != none)
    {
        lmdMyTeam = PRI.Team.TeamIndex;        
    }
    else
    {
        lmdMyTeam = 0;
    }
    // End:0x10E
    if(mi != none)
    {
        lmdPrizeMoney = mi.PrizeMoney;        
    }
    else
    {
        lmdPrizeMoney = 0;
    }
    lmdInjury = LastInjured;
    // End:0x17F
    if(lmdInjury > -1)
    {
        lmdInjuryHealth = BotStats[lmdInjury].Health;
        lmdInjuryTreatment = int(Round((((100.0000000 - float(lmdInjuryHealth)) * float(BotStats[lmdInjury].Price)) / float(100)) * InjuryTreatment));
    }
    currentGame.GameReplicationInfo.GetPRIArray(PRIArray);
    PlayerMatchDetails.Length = PRIArray.Length;
    i = 0;
    J0x1B0:

    // End:0x5C8 [Loop If]
    if(i < PRIArray.Length)
    {
        PlayerMatchDetails[i].id = PRIArray[i].PlayerID;
        PlayerMatchDetails[i].Name = PRIArray[i].PlayerName;
        PlayerMatchDetails[i].Kills = float(PRIArray[i].Kills);
        PlayerMatchDetails[i].Score = PRIArray[i].Score;
        PlayerMatchDetails[i].Deaths = PRIArray[i].Deaths;
        // End:0x2C6
        if(PRIArray[i].Team != none)
        {
            PlayerMatchDetails[i].Team = PRIArray[i].Team.TeamIndex;            
        }
        else
        {
            // End:0x2F0
            if(PRIArray[i] == PRI)
            {
                PlayerMatchDetails[i].Team = 0;                
            }
            else
            {
                PlayerMatchDetails[i].Team = -1;
            }
        }
        PlayerMatchDetails[i].SpecialAwards.Length = 0;
        // End:0x4DF
        if(TeamPlayerReplicationInfo(PRIArray[i]) != none)
        {
            // End:0x39A
            if(TeamPlayerReplicationInfo(PRIArray[i]).flakcount >= sae_flackmonkey)
            {
                PlayerMatchDetails[i].SpecialAwards[PlayerMatchDetails[i].SpecialAwards.Length] = msgSpecialAward[0];
                // End:0x39A
                if(PRIArray[i] == PRI)
                {
                    SpecialAwards[0]++;
                }
            }
            // End:0x405
            if(TeamPlayerReplicationInfo(PRIArray[i]).combocount >= sae_combowhore)
            {
                PlayerMatchDetails[i].SpecialAwards[PlayerMatchDetails[i].SpecialAwards.Length] = msgSpecialAward[1];
                // End:0x405
                if(PRIArray[i] == PRI)
                {
                    SpecialAwards[1]++;
                }
            }
            // End:0x472
            if(TeamPlayerReplicationInfo(PRIArray[i]).headcount >= sae_headhunter)
            {
                PlayerMatchDetails[i].SpecialAwards[PlayerMatchDetails[i].SpecialAwards.Length] = msgSpecialAward[2];
                // End:0x472
                if(PRIArray[i] == PRI)
                {
                    SpecialAwards[2]++;
                }
            }
            // End:0x4DF
            if(TeamPlayerReplicationInfo(PRIArray[i]).ranovercount >= sae_roadrampage)
            {
                PlayerMatchDetails[i].SpecialAwards[PlayerMatchDetails[i].SpecialAwards.Length] = msgSpecialAward[3];
                // End:0x4DF
                if(PRIArray[i] == PRI)
                {
                    SpecialAwards[3]++;
                }
            }
        }
        // End:0x547
        if(PRIArray[i].GoalsScored >= sae_hattrick)
        {
            PlayerMatchDetails[i].SpecialAwards[PlayerMatchDetails[i].SpecialAwards.Length] = msgSpecialAward[4];
            // End:0x547
            if(PRIArray[i] == PRI)
            {
                SpecialAwards[4]++;
            }
        }
        // End:0x5BE
        if((PRIArray[i].Deaths == float(sae_untouchable)) && !lmdTeamGame)
        {
            PlayerMatchDetails[i].SpecialAwards[PlayerMatchDetails[i].SpecialAwards.Length] = msgSpecialAward[5];
            // End:0x5BE
            if(PRIArray[i] == PRI)
            {
                SpecialAwards[5]++;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1B0;
    }
    //return;    
}

function procPhantomMatches(int Games)
{
    local array<int> MatchHistory;
    local array<TeamStatsRecord> PhantomEnemies;
    local UT2K4MatchInfo mi;
    local int i, j, n1, n2;

    PhantomMatches.Length = Games;
    // End:0x19
    if(Games == 0)
    {
        return;
    }
    PhantomEnemies = TeamStats;
    i = 0;
    J0x2B:

    // End:0x6E [Loop If]
    if(i < PhantomEnemies.Length)
    {
        // End:0x64
        if(PhantomEnemies[i].Name ~= EnemyTeam)
        {
            PhantomEnemies.Remove(i, 1);
            // [Explicit Break]
            goto J0x6E;
        }
        i++;
        // [Loop Continue]
        goto J0x2B;
    }
    J0x6E:

    MatchHistory[MatchHistory.Length] = (CurrentLadder * 100) + CurrentMenuRung;
    J0x8B:

    // End:0x41A [Loop If]
    if(Games > 0)
    {
        // End:0xA5
        if(PhantomEnemies.Length <= 1)
        {
            // [Explicit Break]
            goto J0x41A;
        }
        J0xA5:

        PhantomMatches[Games - 1].LadderId = UT2K4GameLadder.static.GetRandomLadder();
        PhantomMatches[Games - 1].MatchID = Rand(LengthOfLadder(PhantomMatches[Games - 1].LadderId));
        n1 = (PhantomMatches[Games - 1].LadderId * 100) + PhantomMatches[Games - 1].MatchID;
        j = 0;
        J0x130:

        // End:0x162 [Loop If]
        if(j < MatchHistory.Length)
        {
            // End:0x158
            if(MatchHistory[j] == n1)
            {
                // [Explicit Break]
                goto J0x162;
            }
            j++;
            // [Loop Continue]
            goto J0x130;
        }
        J0x162:

        // End:0xA5
        if(!(j >= MatchHistory.Length))
            goto J0xA5;
        MatchHistory[MatchHistory.Length] = n1;
        mi = UT2K4MatchInfo(GetMatchInfo(PhantomMatches[Games - 1].LadderId, PhantomMatches[Games - 1].MatchID));
        j = Rand(PhantomEnemies.Length);
        PhantomMatches[Games - 1].Team1 = GetTeamPosition(PhantomEnemies[j].Name);
        n1 = PhantomEnemies[j].Level;
        PhantomEnemies.Remove(j, 1);
        j = Rand(PhantomEnemies.Length);
        PhantomMatches[Games - 1].Team2 = GetTeamPosition(PhantomEnemies[j].Name);
        n2 = PhantomEnemies[j].Level;
        PhantomEnemies.Remove(j, 1);
        // End:0x28C
        if(n1 == -1)
        {
            n1 = Max(n2, 0);
        }
        // End:0x2A9
        if(n2 == -1)
        {
            n2 = Max(n1, 0);
        }
        n1++;
        n2++;
        // End:0x338
        if(Rand(n1 + n2) >= n2)
        {
            n2 = PhantomMatches[Games - 1].Team1;
            PhantomMatches[Games - 1].ScoreTeam1 = mi.GoalScore;
            PhantomMatches[Games - 1].ScoreTeam2 = (mi.GoalScore - float(1)) * FRand();            
        }
        else
        {
            n2 = PhantomMatches[Games - 1].Team2;
            PhantomMatches[Games - 1].ScoreTeam1 = (mi.GoalScore - float(1)) * FRand();
            PhantomMatches[Games - 1].ScoreTeam2 = mi.GoalScore;
        }
        PhantomMatches[Games - 1].GameTime = ((PhantomMatches[Games - 1].ScoreTeam1 + float(1)) * (PhantomMatches[Games - 1].ScoreTeam2 + float(1))) + (FRand() * float(mi.PrizeMoney));
        RandomIncreaseBotFee(n2, FeeIncrease / float(2));
        Games--;
        // [Loop Continue]
        goto J0x8B;
    }
    J0x41A:

    //return;    
}

function RandomIncreaseBotFee(int TeamID, float updateFee)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5A [Loop If]
    if(i < BotStats.Length)
    {
        // End:0x50
        if((BotStats[i].TeamID == TeamID) && FRand() > 0.5000000)
        {
            GetBotPrice(, i, updateFee);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

static function string MoneyToString(int money)
{
    local string res, tmp, Prefix;

    // End:0x16
    if(money == 0)
    {
        return "0" @ default.msgCredits;
    }
    // End:0x3B
    if(money < 0)
    {
        Prefix = "-";
        money *= float(-1);        
    }
    else
    {
        Prefix = "";
    }
    res = "";
    // End:0x68
    if(money == 1)
    {
        return (Prefix $ "1") @ default.msgCredit;
    }
    J0x68:

    // End:0xF0 [Loop If]
    if(money > 0)
    {
        // End:0x8F
        if(tmp != "")
        {
            res = "," $ res;
        }
        tmp = string(int(float(money) % float(1000)));
        money = money / 1000;
        // End:0xDB
        if(money > 0)
        {
            tmp = Right("00" $ tmp, 3);
        }
        res = tmp $ res;
        // [Loop Continue]
        goto J0x68;
    }
    return (Prefix $ res) @ default.msgCredits;
    //return;    
}

function string StoredPlayerID()
{
    return PlayerIDHash;
    //return;    
}

function bool IsLocked()
{
    return bLocked;
    //return;    
}

function int GetSelectedLevel(int Ladder, int rung)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6E [Loop If]
    if(i < LevelRoute.Length)
    {
        // End:0x64
        if((int(LevelRoute[i].Ladder) == Ladder) && int(LevelRoute[i].rung) == rung)
        {
            return int(LevelRoute[i].selection);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function SetSelectedLevel(int Ladder, int rung, byte id)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5E [Loop If]
    if(i < LevelRoute.Length)
    {
        // End:0x54
        if((int(LevelRoute[i].Ladder) == Ladder) && int(LevelRoute[i].rung) == rung)
        {
            // [Explicit Break]
            goto J0x5E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x5E:

    // End:0x7D
    if(i <= LevelRoute.Length)
    {
        LevelRoute.Length = i + 1;
    }
    LevelRoute[i].Ladder = byte(Ladder);
    LevelRoute[i].rung = byte(rung);
    LevelRoute[i].selection = id;
    //return;    
}

function ResetSelectedLevel(int Ladder, int rung)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x69 [Loop If]
    if(i < LevelRoute.Length)
    {
        // End:0x5F
        if((int(LevelRoute[i].Ladder) == Ladder) && int(LevelRoute[i].rung) == rung)
        {
            LevelRoute.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool GetAltTeamRoster(string TeamRosterName, out array<string> Result)
{
    local int i;

    Result.Length = 0;
    // End:0x16
    if(TeamRosterName == "")
    {
        return false;
    }
    i = 0;
    J0x1D:

    // End:0x69 [Loop If]
    if(i < AltTeamRoster.Length)
    {
        // End:0x5F
        if(AltTeamRoster[i].Name ~= TeamRosterName)
        {
            Result = AltTeamRoster[i].Roster;
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    return false;
    //return;    
}

function SetAltTeamRoster(string TeamRosterName, array<string> NewRoster)
{
    local int i;

    // End:0x0E
    if(TeamRosterName == "")
    {
        return;
    }
    i = 0;
    J0x15:

    // End:0x4C [Loop If]
    if(i < AltTeamRoster.Length)
    {
        // End:0x42
        if(AltTeamRoster[i].Name ~= TeamRosterName)
        {
            // [Explicit Break]
            goto J0x4C;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    J0x4C:

    // End:0x81
    if(AltTeamRoster.Length <= i)
    {
        AltTeamRoster.Length = i + 1;
        AltTeamRoster[i].Name = TeamRosterName;
    }
    AltTeamRoster[i].Roster = NewRoster;
    //return;    
}

function AddHistoryRecord(GameInfo Game, PlayerReplicationInfo PRI, UT2K4MatchInfo mi)
{
    local int i, j, N;
    local array<PlayerReplicationInfo> PRIArray;
    local string tmp;

    i = FightHistory.Length;
    FightHistory.Length = FightHistory.Length + 1;
    FightHistory[i].Date[0] = Game.Level.Year;
    FightHistory[i].Date[1] = Game.Level.Month;
    FightHistory[i].Date[2] = Game.Level.Day;
    FightHistory[i].Time[0] = Game.Level.Hour;
    FightHistory[i].Time[1] = Game.Level.Minute;
    FightHistory[i].Level = Left(string(Game.Level), InStr(string(Game.Level), "."));
    FightHistory[i].GameType = Game.GameName;
    FightHistory[i].EnemyTeam = EnemyTeam;
    // End:0x188
    if(mi != none)
    {
        FightHistory[i].PriceMoney = float(mi.PrizeMoney);
    }
    FightHistory[i].BalanceChange = float(lmdBalanceChange);
    FightHistory[i].BonusMoney = float(lmdTotalBonusMoney);
    FightHistory[i].GameTime = Game.Level.TimeSeconds - Game.StartTime;
    FightHistory[i].WonGame = bWonMatch;
    FightHistory[i].TeamGame = Game.bTeamGame;
    // End:0x460
    if(Game.bTeamGame)
    {
        Game.GameReplicationInfo.GetPRIArray(PRIArray);
        tmp = "";
        j = 0;
        J0x267:

        // End:0x2FD [Loop If]
        if(j < PRIArray.Length)
        {
            // End:0x2F3
            if(float(PRIArray[j].Team.TeamIndex) == (float(PRI.Team.TeamIndex + 1) % float(2)))
            {
                // End:0x2D6
                if(tmp != "")
                {
                    tmp $= ", ";
                }
                tmp $= PRIArray[j].PlayerName;
            }
            j++;
            // [Loop Continue]
            goto J0x267;
        }
        FightHistory[i].TeamScore[0] = TeamGame(Game).Teams[int(float(PRI.Team.TeamIndex + 1) % float(2))].Score;
        FightHistory[i].TeamLayout[0] = tmp;
        tmp = "";
        j = 0;
        J0x378:

        // End:0x401 [Loop If]
        if(j < PRIArray.Length)
        {
            // End:0x3F7
            if(PRIArray[j].Team.TeamIndex == PRI.Team.TeamIndex)
            {
                // End:0x3DA
                if(tmp != "")
                {
                    tmp $= ", ";
                }
                tmp $= PRIArray[j].PlayerName;
            }
            j++;
            // [Loop Continue]
            goto J0x378;
        }
        FightHistory[i].TeamScore[1] = TeamGame(Game).Teams[PRI.Team.TeamIndex].Score;
        FightHistory[i].TeamLayout[1] = tmp;
    }
    j = 0;
    J0x467:

    // End:0x593 [Loop If]
    if(j < PlayerMatchDetails.Length)
    {
        // End:0x589
        if(PlayerMatchDetails[j].id == PRI.PlayerID)
        {
            FightHistory[i].MyScore = PlayerMatchDetails[j].Score;
            FightHistory[i].MyKills = int(PlayerMatchDetails[j].Kills);
            FightHistory[i].MyDeaths = int(PlayerMatchDetails[j].Deaths);
            N = 0;
            J0x508:

            // End:0x586 [Loop If]
            if(N < PlayerMatchDetails[j].SpecialAwards.Length)
            {
                // End:0x552
                if(FightHistory[i].MyAwards != "")
                {
                    FightHistory[i].MyAwards $= ", ";
                }
                FightHistory[i].MyAwards $= PlayerMatchDetails[j].SpecialAwards[N];
                N++;
                // [Loop Continue]
                goto J0x508;
            }
            // [Explicit Break]
            goto J0x593;
        }
        j++;
        // [Loop Continue]
        goto J0x467;
    }
    J0x593:

    // End:0x5EE
    if(bIsChallenge)
    {
        FightHistory[i].MatchData = (msgChallengeGame $ ";") $ ChallengeGameClass.default.ChallengeName;
        ChallengeGameClass.static.AddHistoryRecord(self, i, Game, PRI, mi);        
    }
    else
    {
        // End:0x65C
        if(CurrentLadder >= 10)
        {
            FightHistory[i].MatchData = (((msgAdditionalLadder $ ";") $ LastCustomCladder.default.LadderName) @ msgMatch) @ string(CurrentMenuRung);
            LastCustomCladder.static.AddHistoryRecord(self, i, Game, PRI, mi);            
        }
        else
        {
            FightHistory[i].MatchData = msgLadderGame $ ";";
            switch(CurrentLadder)
            {
                // End:0x68F
                case UT2K4GameLadder.default.LID_DM:
                // End:0x6A0
                case UT2K4GameLadder.default.LID_TDM:
                // End:0x6B1
                case UT2K4GameLadder.default.LID_CTF:
                // End:0x6C2
                case UT2K4GameLadder.default.LID_DOM:
                // End:0x6D3
                case UT2K4GameLadder.default.LID_BR:
                // End:0x706
                case UT2K4GameLadder.default.LID_AS:
                    FightHistory[i].MatchData $= (GetLadderDescription(CurrentLadder));
                    // End:0x733
                    break;
                // End:0x730
                case UT2K4GameLadder.default.LID_CHAMP:
                    FightHistory[i].MatchData $= msgChampionship;
                // End:0xFFFF
                default:
                    break;
            }
            FightHistory[i].MatchData @= (msgMatch @ string(CurrentMenuRung));
        }
    }
    //return;    
}

function Class<ChallengeGame> GetChallengeGame(optional string ClassName)
{
    return UT2K4GameLadder.static.GetChallengeGame(ClassName, self);
    //return;    
}

function float getMinimalTeamFee(int Members, optional bool bIgnoreHealth)
{
    local array<int> fees;
    local int i, j, N, tmp;

    i = 0;
    J0x07:

    // End:0x119 [Loop If]
    if(i < (GetMaxTeamSize()))
    {
        j = GetBotPosition(PlayerTeam[i]);
        // End:0x10F
        if((j > -1) && (int(BotStats[j].Health) >= 100) || bIgnoreHealth)
        {
            tmp = int(float(BotStats[j].Price) * LoserFee);
            N = 0;
            J0x8B:

            // End:0xDA [Loop If]
            if(N < fees.Length)
            {
                // End:0xD0
                if(fees[N] > tmp)
                {
                    fees.Insert(N, 1);
                    fees[N] = tmp;
                    // [Explicit Break]
                    goto J0xDA;
                }
                N++;
                // [Loop Continue]
                goto J0x8B;
            }
            J0xDA:

            // End:0x10F
            if(N == fees.Length)
            {
                fees.Length = fees.Length + 1;
                fees[fees.Length - 1] = tmp;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x12F
    if(fees.Length < Members)
    {
        return 2147483648.0000000;
    }
    j = 0;
    i = 0;
    J0x13D:

    // End:0x168 [Loop If]
    if(i < Members)
    {
        j += fees[i];
        i++;
        // [Loop Continue]
        goto J0x13D;
    }
    return float(j);
    //return;    
}

function int getMinimalEntryFeeFor(UT2K4MatchInfo mi, optional bool bIgnoreHealth)
{
    local int res;

    res = mi.EntryFee;
    // End:0x52
    if(IsTeamGametype(mi.GameType))
    {
        res += int(getMinimalTeamFee(mi.NumBots / 2, bIgnoreHealth));
    }
    // End:0x7F
    if(bDebug)
    {
        Log("getMinimalEntryFeeFor =" @ string(res));
    }
    return res;
    //return;    
}

function UpgradeGP()
{
    local int i;

    // End:0xB3
    if(Revision == 0)
    {
        Log("Revision upgrade to 1", LogPrefix);
        MinBalance = 75;
        InjuryChance = 0.3000000 + (BaseDifficulty / float(30));
        ChallengeChance = 0.3000000 + (BaseDifficulty / float(30));
        FeeIncrease = 0.0200000 + (BaseDifficulty / float(300));
        TeamPercentage = 0.3500000 + (BaseDifficulty / float(30));
        MatchBonus = 0.0300000 + (TeamPercentage / float(10));
        Revision = 1;
    }
    // End:0x114
    if(Revision == 1)
    {
        Log("Revision upgrade to 2", LogPrefix);
        TeamPercentage = 0.2500000 + (BaseDifficulty / float(30));
        MatchBonus = 0.0500000 + (TeamPercentage / float(10));
        Revision = 2;
    }
    // End:0x176
    if(Revision == 2)
    {
        Log("Revision upgrade to 3", LogPrefix);
        InjuryTreatment = 0.7500000 + (BaseDifficulty / float(50));
        MapChallengeCost = 0.1000000 + (BaseDifficulty / float(100));
        Revision = 3;
    }
    // End:0x236
    if(Revision == 3)
    {
        Log("Revision upgrade to 4", LogPrefix);
        i = TeamStats.Length - 1;
        J0x1AF:

        // End:0x1E7 [Loop If]
        if(i >= 0)
        {
            // End:0x1DD
            if(TeamStats[i].Name == "")
            {
                TeamStats.Remove(i, 1);
            }
            i--;
            // [Loop Continue]
            goto J0x1AF;
        }
        i = BotStats.Length - 1;
        J0x1F6:

        // End:0x22E [Loop If]
        if(i >= 0)
        {
            // End:0x224
            if(BotStats[i].Name == "")
            {
                BotStats.Remove(i, 1);
            }
            i--;
            // [Loop Continue]
            goto J0x1F6;
        }
        Revision = 4;
    }
    // End:0x2C1
    if(Revision == 4)
    {
        Log("Revision upgrade to 5", LogPrefix);
        // End:0x2B9
        if((bCompleted && !bLocked) && !bCheater)
        {
            // End:0x2B9
            if(completedLadder(UT2K4GameLadder.default.LID_CHAMP))
            {
                bCompleted = false;
                SpecialEvent = "COMPLETED CHAMP";
            }
        }
        Revision = 5;
    }
    //return;    
}

defaultproperties
{
    Revision=5
    LadderProgress[0]=1
    LadderProgress[1]=-1
    LadderProgress[2]=-1
    LadderProgress[3]=-1
    LadderProgress[4]=-1
    LadderProgress[5]=-1
    LadderProgress[6]=-1
    MaxTeamSize=5
    Balance=250
    MinBalance=75
    TeamPercentage=0.2500000
    MatchBonus=0.0500000
    LoserFee=0.1000000
    FeeIncrease=0.0200000
    InjuryChance=0.3000000
    LastInjured=-1
    InjuryTreatment=0.7500000
    ChallengeChance=0.3000000
    // Reference: UT2K4MatchInfo'WGame_Decompressed.UT2K4GameProfile.GPCHALINFO'
    begin object name="GPCHALINFO" class=WGame_Decompressed.UT2K4MatchInfo
    end object
    ChallengeInfo=GPCHALINFO
    LogPrefix="SinglePlayer"
    SpreeBonus[0]=20
    SpreeBonus[1]=60
    SpreeBonus[2]=120
    SpreeBonus[3]=200
    SpreeBonus[4]=300
    SpreeBonus[5]=420
    MultiKillBonus[0]=10
    MultiKillBonus[1]=30
    MultiKillBonus[2]=60
    MultiKillBonus[3]=100
    MultiKillBonus[4]=150
    MultiKillBonus[5]=210
    MultiKillBonus[6]=280
    msgSpecialAward[0]="????"
    msgSpecialAward[1]="??? ??"
    msgSpecialAward[2]="?? ??"
    msgSpecialAward[3]="??? ??"
    msgSpecialAward[4]="?? ??"
    msgSpecialAward[5]="????"
    sae_flackmonkey=15
    sae_combowhore=15
    sae_headhunter=15
    sae_roadrampage=10
    sae_hattrick=3
    msgCheater="???!!!"
    msgCredits="????"
    msgCredit="???"
    MapChallengeCost=0.1000000
    msgChallengeGame="???"
    msgAdditionalLadder="?? ?? ??"
    msgMatch="??"
    msgLadderGame="?? ??"
    msgChampionship="????"
    bShowDetails=true
    GameLadderName="wGame.UT2K4LadderInfo"
}