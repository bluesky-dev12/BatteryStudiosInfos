/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\GUI2K4MultiColumnList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class GUI2K4MultiColumnList extends GUIMultiColumnList
    editinlinenew
    instanced;

var delegate<OnGetSortString> __OnGetSortString__Delegate;

delegate string OnGetSortString(GUIComponent Sender, int Item, int Column);
function string InternalGetSortString(int i)
{
    return OnGetSortString(self, i, SortColumn);
}

defaultproperties
{
    GetSortString=InternalGetSortString
}