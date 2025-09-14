/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\ChallengeGame.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:6
 *	Functions:9
 *
 *******************************************************************************/
class ChallengeGame extends Object
    abstract;

struct TriString
{
    var string GUIPage;
    var string Param1;
    var string Param2;
};

var localized string ChallengeName;
var localized string ChallengeDescription;
var localized string msgGotChallenged;
var localized string msgWeChallenged;
var localized string msgFor;
var string ChallengeMenu;

static function PreRegisterGame(UT2K4GameProfile GP, GameInfo currentGame, PlayerReplicationInfo PRI);
static function PostRegisterGame(UT2K4GameProfile GP, GameInfo currentGame, PlayerReplicationInfo PRI);
static function StartChallenge(UT2K4GameProfile GP, LevelInfo myLevel)
{
    GP.SpecialEvent = "";
    GP.bIsChallenge = true;
    GP.Balance -= GP.ChallengeInfo.EntryFee;
    GP.ChallengeGameClass = default.Class;
    GP.StartNewMatch(-1, myLevel);
}

static function HandleSpecialEvent(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages);
static function bool HandleRequirements(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages)
{
    return true;
}

static function AddHistoryRecord(UT2K4GameProfile GP, int offset, GameInfo Game, PlayerReplicationInfo PRI, UT2K4MatchInfo MI)
{
    // End:0x34
    if(GP.bGotChallenged)
    {
        GP.FightHistory[offset].MatchExtra = default.msgGotChallenged;
    }
    // End:0x53
    else
    {
        GP.FightHistory[offset].MatchExtra = default.msgWeChallenged;
    }
    // End:0x9a
    if(GP.ChallengeVariable != "")
    {
        GP.FightHistory[offset].MatchExtra @= default.msgFor @ GP.ChallengeVariable;
    }
}

static function bool canChallenge(optional UT2K4GameProfile GP)
{
    return true;
}

static function bool PayTeamMates(UT2K4GameProfile GP)
{
    return true;
}

static function bool InjureTeamMate(UT2K4GameProfile GP)
{
    return !GP.bGotChallenged;
}

defaultproperties
{
    msgGotChallenged="??? ?????."
    msgWeChallenged="???????."
    msgFor="for"
}