class DirectoryTreeListBox extends GUIListBoxBase
    editinlinenew
    instanced;

var export editinline DirectoryTreeList List;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x88
    if(DefaultListClass != "")
    {
        List = DirectoryTreeList(AddComponent(DefaultListClass));
        // End:0x88
        if(List == none)
        {
            Log(((string(Name) $ ".InitComponent - Could not create default list [") $ DefaultListClass) $ "]");
            return;
        }
    }
    // End:0xB3
    if(List == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(List);
    //return;    
}

function InitBaseList(GUIListBase LocalList)
{
    // End:0x3E
    if(((List == none) || List != LocalList) && GUIList(LocalList) != none)
    {
        List = DirectoryTreeList(LocalList);
    }
    List.__OnClick__Delegate = InternalOnClick;
    List.OnClickSound = 1;
    List.__OnDblClick__Delegate = InternalOnDblClick;
    List.__OnChange__Delegate = InternalOnChange;
    super.InitBaseList(LocalList);
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    List.InternalOnClick(Sender);
    OnClick(self);
    return true;
    //return;    
}

function bool InternalOnDblClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x2A
    if((Controller != none) && Controller.bCurMenuInitialized)
    {
        OnChange(self);
    }
    //return;    
}

function int ItemCount()
{
    return List.ItemCount;
    //return;    
}

function bool MyOpen(GUIContextMenu Menu, GUIComponent ContextMenuOwner)
{
    return HandleContextMenuOpen(self, Menu, ContextMenuOwner);
    //return;    
}

function bool MyClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
    //return;    
}

defaultproperties
{
    DefaultListClass="GUI2K4.DirectoryTreeList"
}