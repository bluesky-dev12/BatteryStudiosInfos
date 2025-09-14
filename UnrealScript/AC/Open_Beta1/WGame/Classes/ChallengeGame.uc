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

static function PreRegisterGame(UT2K4GameProfile GP, GameInfo currentGame, PlayerReplicationInfo PRI)
{
    //return;    
}

static function PostRegisterGame(UT2K4GameProfile GP, GameInfo currentGame, PlayerReplicationInfo PRI)
{
    //return;    
}

static function StartChallenge(UT2K4GameProfile GP, LevelInfo myLevel)
{
    GP.SpecialEvent = "";
    GP.bIsChallenge = true;
    GP.Balance -= GP.ChallengeInfo.EntryFee;
    GP.ChallengeGameClass = default.Class;
    GP.StartNewMatch(-1, myLevel);
    //return;    
}

static function HandleSpecialEvent(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages)
{
    //return;    
}

static function bool HandleRequirements(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages)
{
    return true;
    //return;    
}

static function AddHistoryRecord(UT2K4GameProfile GP, int offset, GameInfo Game, PlayerReplicationInfo PRI, UT2K4MatchInfo MI)
{
    // End:0x34
    if(GP.bGotChallenged)
    {
        GP.FightHistory[offset].MatchExtra = default.msgGotChallenged;        
    }
    else
    {
        GP.FightHistory[offset].MatchExtra = default.msgWeChallenged;
    }
    // End:0x9A
    if(GP.ChallengeVariable != "")
    {
        GP.FightHistory[offset].MatchExtra @= (default.msgFor @ GP.ChallengeVariable);
    }
    //return;    
}

static function bool canChallenge(optional UT2K4GameProfile GP)
{
    return true;
    //return;    
}

static function bool PayTeamMates(UT2K4GameProfile GP)
{
    return true;
    //return;    
}

static function bool InjureTeamMate(UT2K4GameProfile GP)
{
    return !GP.bGotChallenged;
    //return;    
}

defaultproperties
{
    msgGotChallenged="??? ?????."
    msgWeChallenged="???????."
    msgFor="for"
}