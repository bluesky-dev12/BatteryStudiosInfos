class BTNetExcelData extends Object
    native;

// Export UBTNetExcelData::execLoadExcelData(FFrame&, void* const)
native function bool LoadExcelData(string fileName, string sheetName, int numHeadRows, int numHeadColumns, int nKeyColumnOrRow, optional int arrangeType)
{
    //native.fileName;
    //native.sheetName;
    //native.numHeadRows;
    //native.numHeadColumns;
    //native.nKeyColumnOrRow;
    //native.arrangeType;        
}

// Export UBTNetExcelData::execgetData(FFrame&, void* const)
native function string getData(string category, string key, int iIndex)
{
    //native.category;
    //native.key;
    //native.iIndex;        
}
