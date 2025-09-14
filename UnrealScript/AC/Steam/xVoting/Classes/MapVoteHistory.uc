/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MapVoteHistory.uc
 * Package Imports:
 *	xVoting
 *	Core
 *
 * Stats:
 *	Functions:8
 *
 *******************************************************************************/
class MapVoteHistory extends Object;

function AddMap(MapHistoryInfo mapInfo);
function RemoveMap(string MapName);
function MapHistoryInfo GetMapHistory(string MapName);
function MapHistoryInfo GetMapBySeq(int SeqNum);
function MapHistoryInfo GetLeastPlayedMap();
function MapHistoryInfo GetMostPlayedMap();
function MapHistoryInfo PlayMap(string MapName);
function Save();
