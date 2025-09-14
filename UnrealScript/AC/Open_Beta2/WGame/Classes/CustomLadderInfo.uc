class CustomLadderInfo extends Object
    abstract;

var string LadderName;
var localized array<localized string> EntryLabels;
var array<UT2K4MatchInfo> Matches;

static function HandleSpecialEvent(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages)
{
    //return;    
}

static function bool HandleRequirements(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages)
{
    return true;
    //return;    
}

static function AddHistoryRecord(UT2K4GameProfile GP, int offset, GameInfo Game, PlayerReplicationInfo PRI, UT2K4MatchInfo mi)
{
    //return;    
}

defaultproperties
{
    LadderName="Custom Ladder"
}