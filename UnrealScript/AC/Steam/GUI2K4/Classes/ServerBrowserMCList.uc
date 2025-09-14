/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\ServerBrowserMCList.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class ServerBrowserMCList extends GUIMultiColumnList
    editinlinenew
    instanced;

var export editinline UT2k4Browser_ServerListPageBase tp_MyPage;

function SetAnchor(UT2k4Browser_ServerListPageBase Anchor)
{
    tp_MyPage = Anchor;
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending);

defaultproperties
{
    bVisibleWhenEmpty=true
    SelectedStyleName="BrowserListSelection"
    OnDrawItem=MyOnDrawItem
    StyleName="ServerBrowserGrid"
    RenderWeight=1.0
}