/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BTData\Classes\BTNetExcelData.uc
 * Package Imports:
 *	BTData
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BTNetExcelData extends Object
    native;

// Export UBTNetExcelData::execLoadExcelData(FFrame&, void* const)
native function bool LoadExcelData(string fileName, string sheetName, int numHeadRows, int numHeadColumns, int nKeyColumnOrRow, optional int arrangeType);
// Export UBTNetExcelData::execgetData(FFrame&, void* const)
native function string getData(string category, string key, int iIndex);
