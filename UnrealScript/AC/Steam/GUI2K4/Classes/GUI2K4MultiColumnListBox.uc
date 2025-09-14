/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\GUI2K4MultiColumnListBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class GUI2K4MultiColumnListBox extends GUIMultiColumnListBox
    dependson(GUI2K4MultiColumnList)
    editinlinenew
    instanced;

var delegate<OnGetSortString> __OnGetSortString__Delegate;

delegate string OnGetSortString(GUIComponent Sender, int Item, int Column);
function InitBaseList(GUIListBase LocalList)
{
    super.InitBaseList(LocalList);
    GUI2K4MultiColumnList(List).__OnGetSortString__Delegate = InternalOnGetSortString;
}

function string InternalOnGetSortString(GUIComponent Sender, int Item, int Column)
{
    return OnGetSortString(self, Item, Column);
}

defaultproperties
{
    DefaultListClass="GUI2K4.GUI2K4MultiColumnList"
}