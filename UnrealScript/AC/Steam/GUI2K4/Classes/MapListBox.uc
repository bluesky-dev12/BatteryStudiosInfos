/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\MapListBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class MapListBox extends GUIListBox
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ContextMenu.__OnOpen__Delegate = MyOpen;
    ContextMenu.__OnClose__Delegate = MyClose;
    ContextMenu.__OnSelect__Delegate = ContextClick;
}

function ContextClick(GUIContextMenu Sender, int Index)
{
    NotifyContextSelect(Sender, Index);
}

function bool MyRealOpen(GUIComponent MenuOwner)
{
    return false;
}

function bool MyOpen(GUIContextMenu Menu)
{
    return HandleContextMenuOpen(List, Menu, Menu.MenuOwner);
}

function bool MyClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
}

defaultproperties
{
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
        StyleName="ServerListContextMenu"
    object end
    // Reference: GUIContextMenu'MapListBox.RCMenu'
    ContextMenu=RCMenu
}