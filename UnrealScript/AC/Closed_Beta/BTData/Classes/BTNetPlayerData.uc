class BTNetPlayerData extends Object
    native;

// Export UBTNetPlayerData::execLoadPlayerPartsData(FFrame&, void* const)
native function bool LoadPlayerPartsData();

// Export UBTNetPlayerData::execLoadPlayerAnimationData(FFrame&, void* const)
native function bool LoadPlayerAnimationData();

// Export UBTNetPlayerData::execLoadPlayerMoveParams(FFrame&, void* const)
native function bool LoadPlayerMoveParams();

// Export UBTNetPlayerData::execgetData(FFrame&, void* const)
native function string getData(string category, string key, int iIndex)
{
    //native.category;
    //native.key;
    //native.iIndex;        
}

// Export UBTNetPlayerData::execgetNameData(FFrame&, void* const)
native function name getNameData(string category, string key, int iIndex)
{
    //native.category;
    //native.key;
    //native.iIndex;        
}
