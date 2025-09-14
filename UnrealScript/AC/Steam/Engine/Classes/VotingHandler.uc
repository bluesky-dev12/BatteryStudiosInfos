/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VotingHandler.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:7
 *	Functions:13
 *
 *******************************************************************************/
class VotingHandler extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

struct MapVoteGameConfig
{
    var string GameClass;
    var string Prefix;
    var string Acronym;
    var string GameName;
    var string Mutators;
    var string Options;
};

struct MapVoteGameConfigLite
{
    var string GameClass;
    var string Prefix;
    var string GameName;
};

struct MapVoteMapList
{
    var string MapName;
    var int PlayCount;
    var int Sequence;
    var bool bEnabled;
};

struct MapHistoryInfo
{
    var string M;
    var int P;
    var int S;
    var string G;
    var string U;
};

struct MapVoteScore
{
    var int MapIndex;
    var int GameConfigIndex;
    var int VoteCount;
};

struct KickVoteScore
{
    var int PlayerID;
    var int Team;
    var int KickVoteCount;
};

struct AccumulationData
{
    var string Name;
    var int VoteCount;
};

function PlayerJoin(PlayerController Player);
function PlayerExit(Controller Exiting);
function bool HandleRestartGame()
{
    return true;
}

function string GetConfigArrayData(string ConfigArrayName, int RowIndex, int ColumnIndex);
function string GetConfigArrayColumnTitle(string ConfigArrayName, int ColumnIndex);
function DeleteConfigArrayItem(string ConfigArrayName, int RowIndex);
function int AddConfigArrayItem(string ConfigArrayName);
function UpdateConfigArrayItem(string ConfigArrayName, int RowIndex, int ColumnIndex, string NewValue);
function int GetConfigArrayItemCount(string ConfigArrayName);
static function FillPlayInfo(PlayInfo PlayInfo)
{
    super.FillPlayInfo(PlayInfo);
}

static function bool IsEnabled()
{
    return false;
}

function ReloadAll(optional bool bParam);
function GetServerDetails(out ServerResponseLine ServerState);
