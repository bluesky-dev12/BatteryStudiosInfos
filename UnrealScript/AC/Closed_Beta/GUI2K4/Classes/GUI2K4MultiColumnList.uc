class GUI2K4MultiColumnList extends GUIMultiColumnList
    editinlinenew
    instanced;

//var delegate<OnGetSortString> __OnGetSortString__Delegate;

delegate string OnGetSortString(GUIComponent Sender, int Item, int Column)
{
    //return;    
}

function string InternalGetSortString(int i)
{
    return OnGetSortString(self, i, SortColumn);
    //return;    
}

defaultproperties
{
    GetSortString=GUI2K4MultiColumnList.InternalGetSortString
}