class VotingHandler extends Info
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

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

function PlayerJoin(PlayerController Player)
{
    //return;    
}

function PlayerExit(Controller Exiting)
{
    //return;    
}

function bool HandleRestartGame()
{
    return true;
    //return;    
}

function string GetConfigArrayData(string ConfigArrayName, int RowIndex, int ColumnIndex)
{
    //return;    
}

function string GetConfigArrayColumnTitle(string ConfigArrayName, int ColumnIndex)
{
    //return;    
}

function DeleteConfigArrayItem(string ConfigArrayName, int RowIndex)
{
    //return;    
}

function int AddConfigArrayItem(string ConfigArrayName)
{
    //return;    
}

function UpdateConfigArrayItem(string ConfigArrayName, int RowIndex, int ColumnIndex, string NewValue)
{
    //return;    
}

function int GetConfigArrayItemCount(string ConfigArrayName)
{
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super.FillPlayInfo(PlayInfo);
    //return;    
}

static function bool IsEnabled()
{
    return false;
    //return;    
}

function ReloadAll(optional bool bParam)
{
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    //return;    
}
