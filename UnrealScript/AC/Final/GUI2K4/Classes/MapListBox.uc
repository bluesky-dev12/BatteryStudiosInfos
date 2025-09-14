class MapListBox extends GUIListBox
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ContextMenu.__OnOpen__Delegate = MyOpen;
    ContextMenu.__OnClose__Delegate = MyClose;
    ContextMenu.__OnSelect__Delegate = ContextClick;
    //return;    
}

function ContextClick(GUIContextMenu Sender, int Index)
{
    NotifyContextSelect(Sender, Index);
    //return;    
}

function bool MyRealOpen(GUIComponent MenuOwner)
{
    return false;
    //return;    
}

function bool MyOpen(GUIContextMenu Menu)
{
    return HandleContextMenuOpen(List, Menu, Menu.MenuOwner);
    //return;    
}

function bool MyClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
    //return;    
}

defaultproperties
{
    // Reference: GUIContextMenu'GUI2K4_Decompressed.MapListBox.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
        StyleName="ServerListContextMenu"
    end object
    ContextMenu=RCMenu
}