/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\BloodRites.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class BloodRites extends ChallengeGame;

var string UntradeMenu;
var string TradeMenu;
var float ChalFeeMultiply;

static function HandleSpecialEvent(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages)
{
    local class<UT2K4TeamRoster> ETI;
    local array<string> NewTeamRoster;
    local int i;

    // End:0x200
    if(SpecialEvent[0] == "TRADE")
    {
        GUIPages.Length = GUIPages.Length + 1;
        GUIPages[GUIPages.Length - 1].GUIPage = default.TradeMenu;
        GUIPages[GUIPages.Length - 1].Param1 = SpecialEvent[1];
        GUIPages[GUIPages.Length - 1].Param2 = SpecialEvent[2];
        // End:0xff
        if(!GP.GetAltTeamRoster(SpecialEvent[1], NewTeamRoster))
        {
            ETI = class<UT2K4TeamRoster>(DynamicLoadObject(SpecialEvent[1], class'Class'));
            // End:0xd5
            if(ETI != none)
            {
                NewTeamRoster = ETI.default.RosterNames;
            }
            // End:0xff
            else
            {
                Warn("Some Nali cow ate the enemy team class");
            }
        }
        i = 0;
        J0x106:
        // End:0x147 [While If]
        if(i < NewTeamRoster.Length)
        {
            // End:0x13d
            if(NewTeamRoster[i] ~= SpecialEvent[2])
            {
                NewTeamRoster.Remove(i, 1);
            }
            // End:0x147
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x106;
            }
        }
        GP.SetAltTeamRoster(SpecialEvent[1], NewTeamRoster);
        i = GP.GetBotPosition(SpecialEvent[2]);
        // End:0x1fd
        if(i > -1)
        {
            GP.BotStats[i].Health = 100;
            GP.BotStats[i].TeamID = -1;
            GP.Balance += int(float(GP.BotStats[i].Price) * default.ChalFeeMultiply);
        }
    }
    // End:0x3df
    else
    {
        // End:0x3df
        if(SpecialEvent[0] == "UNTRADE")
        {
            GUIPages.Length = GUIPages.Length + 1;
            GUIPages[GUIPages.Length - 1].GUIPage = default.UntradeMenu;
            GUIPages[GUIPages.Length - 1].Param1 = SpecialEvent[1];
            GUIPages[GUIPages.Length - 1].Param2 = SpecialEvent[2];
            GP.ReleaseTeammate(SpecialEvent[2]);
            // End:0x318
            if(!GP.GetAltTeamRoster(SpecialEvent[1], NewTeamRoster))
            {
                ETI = class<UT2K4TeamRoster>(DynamicLoadObject(SpecialEvent[1], class'Class'));
                // End:0x2ee
                if(ETI != none)
                {
                    NewTeamRoster = ETI.default.RosterNames;
                }
                // End:0x318
                else
                {
                    Warn("Some Nali cow ate the enemy team class");
                }
            }
            // End:0x3c4
            if(NewTeamRoster.Length == 0)
            {
                NewTeamRoster.Length = NewTeamRoster.Length + 1;
                NewTeamRoster[NewTeamRoster.Length - 1] = SpecialEvent[2];
                i = GP.GetBotPosition(SpecialEvent[2]);
                // End:0x3c4
                if(i > -1)
                {
                    GP.BotStats[i].Health = 100;
                    GP.BotStats[i].TeamID = GP.GetTeamPosition(SpecialEvent[1]);
                }
            }
            GP.SetAltTeamRoster(SpecialEvent[1], NewTeamRoster);
        }
    }
}

static function PostRegisterGame(UT2K4GameProfile GP, GameInfo currentGame, PlayerReplicationInfo PRI)
{
    // End:0x8f
    if(GP.bGotChallenged)
    {
        // End:0x57
        if(!GP.bWonMatch)
        {
            GP.SpecialEvent $= ";" $ GP.ChallengeInfo.SpecialEvent;
        }
        // End:0x8f
        else
        {
            GP.SpecialEvent = Repl(GP.SpecialEvent, GP.ChallengeInfo.SpecialEvent, "");
        }
    }
}

static function AddHistoryRecord(UT2K4GameProfile GP, int offset, GameInfo Game, PlayerReplicationInfo PRI, UT2K4MatchInfo MI)
{
    super.AddHistoryRecord(GP, offset, Game, PRI, MI);
}

static function bool canChallenge(optional UT2K4GameProfile GP)
{
    // End:0x0d
    if(GP == none)
    {
        return true;
    }
    return GP.completedLadder(GP.UT2K4GameLadder.default.LID_TDM);
}

static function bool PayTeamMates(UT2K4GameProfile GP)
{
    return !GP.bGotChallenged;
}

static function StartChallenge(UT2K4GameProfile GP, LevelInfo myLevel)
{
    GP.SpecialEvent = "";
    // End:0x49
    if(GP.bGotChallenged)
    {
        GP.SpecialEvent = GP.ChallengeInfo.SpecialEvent;
    }
    GP.bIsChallenge = true;
    GP.Balance -= GP.ChallengeInfo.EntryFee;
    GP.ChallengeGameClass = default.Class;
    GP.StartNewMatch(-1, myLevel);
}

defaultproperties
{
    UntradeMenu="GUI2K4.UT2K4SP_CGBRUntrade"
    TradeMenu="GUI2K4.UT2K4SP_CGBRTrade"
    ChalFeeMultiply=3.0
    ChallengeName="??? ??"
    ChallengeDescription="????? ? ??? ?? ??? ??????."
    ChallengeMenu="GUI2K4.UT2K4SP_CGBloodRites"
}