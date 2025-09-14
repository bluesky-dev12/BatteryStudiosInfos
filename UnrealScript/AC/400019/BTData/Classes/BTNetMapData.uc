class BTNetMapData extends Object
    native;

// Export UBTNetMapData::execLoadMapData(FFrame&, void* const)
native function bool LoadMapData();

// Export UBTNetMapData::execgetData(FFrame&, void* const)
native function string getData(string category, string key, int iIndex)
{
    //native.category;
    //native.key;
    //native.iIndex;        
}
