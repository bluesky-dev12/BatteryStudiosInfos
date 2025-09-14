class GUI2K4MultiColumnListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

//var delegate<OnGetSortString> __OnGetSortString__Delegate;

delegate string OnGetSortString(GUIComponent Sender, int Item, int Column)
{
    //return;    
}

function InitBaseList(GUIListBase LocalList)
{
    super.InitBaseList(LocalList);
    GUI2K4MultiColumnList(List).__OnGetSortString__Delegate = InternalOnGetSortString;
    //return;    
}

function string InternalOnGetSortString(GUIComponent Sender, int Item, int Column)
{
    return OnGetSortString(self, Item, Column);
    //return;    
}

defaultproperties
{
    DefaultListClass="GUI2K4.GUI2K4MultiColumnList"
}