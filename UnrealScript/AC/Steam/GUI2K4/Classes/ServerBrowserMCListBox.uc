/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\ServerBrowserMCListBox.uc
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
class ServerBrowserMCListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

var export editinline UT2k4Browser_ServerListPageBase tp_Anchor;

function SetAnchor(UT2k4Browser_ServerListPageBase AnchorPage)
{
    tp_Anchor = AnchorPage;
    ServerBrowserMCList(List).SetAnchor(AnchorPage);
}

function bool InternalOnOpen(GUIContextMenu Menu)
{
    return HandleContextMenuOpen(List, Menu, Menu.MenuOwner);
}

function bool InternalOnClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
}

defaultproperties
{
    bVisibleWhenEmpty=true
    IniOption="@Internal"
    StyleName="ServerBrowserGrid"
}