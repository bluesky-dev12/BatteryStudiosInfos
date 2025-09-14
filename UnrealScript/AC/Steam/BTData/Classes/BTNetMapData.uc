/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BTData\Classes\BTNetMapData.uc
 * Package Imports:
 *	BTData
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class BTNetMapData extends Object
    native;

// Export UBTNetMapData::execLoadMapData(FFrame&, void* const)
native function bool LoadMapData();
// Export UBTNetMapData::execgetData(FFrame&, void* const)
native function string getData(string category, string key, int iIndex);
