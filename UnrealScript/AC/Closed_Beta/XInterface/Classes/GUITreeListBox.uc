class GUITreeListBox extends GUIListBoxBase
    native
    editinlinenew
    instanced;

var export editinline GUITreeList List;

function InitBaseList(GUIListBase LocalList)
{
    // End:0x3E
    if(((List == none) || List != LocalList) && GUITreeList(LocalList) != none)
    {
        List = GUITreeList(LocalList);
    }
    List.__OnClick__Delegate = InternalOnClick;
    List.OnClickSound = 1;
    List.__OnChange__Delegate = InternalOnChange;
    List.__OnDblClick__Delegate = InternalDblClick;
    super.InitBaseList(LocalList);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x88
    if(DefaultListClass != "")
    {
        List = GUITreeList(AddComponent(DefaultListClass));
        // End:0x88
        if(List == none)
        {
            Log(((string(Class) $ ".InitComponent - Could not create default list [") $ DefaultListClass) $ "]");
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

function bool InternalOnClick(GUIComponent Sender)
{
    List.InternalOnClick(Sender);
    OnClick(self);
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

function bool InternalDblClick(GUIComponent Sender)
{
    List.InternalDblClick(Sender);
    OnDblClick(self);
    return true;
    //return;    
}

function int ItemCount()
{
    return List.ItemCount;
    //return;    
}

function bool MyOpen(GUIContextMenu Menu)
{
    return HandleContextMenuOpen(self, Menu, Menu.MenuOwner);
    //return;    
}

function bool MyClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
    //return;    
}

defaultproperties
{
    DefaultListClass="XInterface.GUITreeList"
    // Reference: GUITreeScrollBar'XInterface_Decompressed.GUITreeListBox.TreeScrollbar'
    begin object name="TreeScrollbar" class=XInterface_Decompressed.GUITreeScrollBar
        bVisible=false
        OnPreDraw=TreeScrollbar.GripPreDraw
    end object
    MyScrollBar=TreeScrollbar
}