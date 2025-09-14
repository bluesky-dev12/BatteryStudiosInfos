class ServerBrowserMCListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

var export editinline UT2k4Browser_ServerListPageBase tp_Anchor;

function SetAnchor(UT2k4Browser_ServerListPageBase AnchorPage)
{
    tp_Anchor = AnchorPage;
    ServerBrowserMCList(List).SetAnchor(AnchorPage);
    //return;    
}

function bool InternalOnOpen(GUIContextMenu Menu)
{
    return HandleContextMenuOpen(List, Menu, Menu.MenuOwner);
    //return;    
}

function bool InternalOnClose(GUIContextMenu Sender)
{
    return HandleContextMenuClose(Sender);
    //return;    
}

defaultproperties
{
    bVisibleWhenEmpty=true
    IniOption="@Internal"
    StyleName="ServerBrowserGrid"
}