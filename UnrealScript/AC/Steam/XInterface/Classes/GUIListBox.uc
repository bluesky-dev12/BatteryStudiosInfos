/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIListBox.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class GUIListBox extends GUIListBoxBase
    dependson(GUIListBoxBase)
    dependson(GUIContextMenu)
    native
    editinlinenew
    instanced;

var export editinline GUIList List;

function InitBaseList(GUIListBase LocalList)
{
    // End:0x3e
    if(List == none || List != LocalList && GUIList(LocalList) != none)
    {
        List = GUIList(LocalList);
    }
    List.__OnClick__Delegate = InternalOnClick;
    List.OnClickSound = 1;
    List.__OnDblClick__Delegate = InternalOnDblClick;
    List.__OnChange__Delegate = InternalOnChange;
    super.InitBaseList(LocalList);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x88
    if(DefaultListClass != "")
    {
        List = GUIList(AddComponent(DefaultListClass));
        // End:0x88
        if(List == none)
        {
            Log(string(Class) $ ".InitComponent - Could not create default list [" $ DefaultListClass $ "]");
            return;
        }
    }
    // End:0xb3
    if(List == none)
    {
        Warn("Could not initialize list!");
        return;
    }
    InitBaseList(List);
}

function bool InternalOnClick(GUIComponent Sender)
{
    List.InternalOnClick(Sender);
    OnClick(self);
    return true;
}

function bool InternalOnDblClick(GUIComponent Sender)
{
    return true;
}

function InternalOnChange(GUIComponent Sender)
{
    // End:0x2a
    if(Controller != none && Controller.bCurMenuInitialized)
    {
        OnChange(self);
    }
}

function int ItemCount()
{
    return List.ItemCount;
}

function bool MyOpen(GUIContextMenu Menu)
{
    return HandleContextMenuOpen(self, Menu, Menu.MenuOwner);
}

function bool MyClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
}

defaultproperties
{
    DefaultListClass="XInterface.GUIList"
}