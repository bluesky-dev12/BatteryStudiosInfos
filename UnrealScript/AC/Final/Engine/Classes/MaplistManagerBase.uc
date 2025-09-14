class MaplistManagerBase extends Info
    abstract
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool ValidGameType(string GameType)
{
    return false;
    //return;    
}

function bool ValidName(string S)
{
    return false;
    //return;    
}

function bool ValidCacheGameIndex(int i)
{
    return false;
    //return;    
}

function bool ValidGameIndex(int i)
{
    return false;
    //return;    
}

function int AddList(string GameType, string NewName, array<string> Maps)
{
    return -1;
    //return;    
}

function int RemoveList(int GameIndex, int RecordIndex)
{
    return -1;
    //return;    
}

function ResetGame(int GameIndex)
{
    //return;    
}

function ResetList(int GameIndex, int RecordIndex)
{
    //return;    
}

function int RenameList(int GameIndex, int RecordIndex, string NewName)
{
    return -1;
    //return;    
}

function bool ClearList(int GameIndex, int RecordIndex)
{
    return true;
    //return;    
}

function bool AddMap(int GameIndex, int RecordIndex, string MapName)
{
    return false;
    //return;    
}

function bool RemoveMap(int GameIndex, int MapIndex, string MapName)
{
    return false;
    //return;    
}

function int GetGameIndex(coerce string GameType)
{
    return -1;
    //return;    
}

function int GetMapIndex(int GameIndex, int RecordIndex, string MapName)
{
    return -1;
    //return;    
}

function int GetRecordIndex(int GameIndex, string MapListName)
{
    return -1;
    //return;    
}

function string GetMapListTitle(int GameIndex, int RecordIndex)
{
    return "";
    //return;    
}

function array<string> GetMapListNames(int GameIndex)
{
    //return;    
}

function array<string> GetCurrentMapRotation()
{
    //return;    
}

function array<string> GetMapList(int GameIndex, int RecordIndex)
{
    //return;    
}

function int GetActiveList(int GameIndex)
{
    return -1;
    //return;    
}

function bool SetActiveList(int GameIndex, int NewActive)
{
    return true;
    //return;    
}

function int GetActiveMap(int GameIndex, int RecordIndex)
{
    return -1;
    //return;    
}

function bool ApplyMapList(int GameIndex, int RecordIndex)
{
    return false;
    //return;    
}

function MapChange(string NewMapName)
{
    //return;    
}

function bool SaveGame(int GameIndex)
{
    return true;
    //return;    
}

function bool SaveMapList(int GameIndex, int RecordIndex)
{
    return true;
    //return;    
}

function ShiftMap(int GameIndex, int RecordIndex, string MapName, int Count)
{
    //return;    
}

function int FindCacheGameIndex(coerce string GameType)
{
    return -1;
    //return;    
}

function array<string> GetCacheMapList(string Acronym)
{
    //return;    
}
