/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\CustomLadderInfo.uc
 * Package Imports:
 *	WGame
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class CustomLadderInfo extends Object
    abstract;

var string LadderName;
var localized array<localized string> EntryLabels;
var array<UT2K4MatchInfo> Matches;

static function HandleSpecialEvent(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages);
static function bool HandleRequirements(UT2K4GameProfile GP, array<string> SpecialEvent, out array<TriString> GUIPages)
{
    return true;
}

static function AddHistoryRecord(UT2K4GameProfile GP, int offset, GameInfo Game, PlayerReplicationInfo PRI, UT2K4MatchInfo MI);

defaultproperties
{
    LadderName="Custom Ladder"
}