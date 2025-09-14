class ServerBrowserMCList extends GUIMultiColumnList
    editinlinenew
    instanced;

var export editinline UT2k4Browser_ServerListPageBase tp_MyPage;

function SetAnchor(UT2k4Browser_ServerListPageBase Anchor)
{
    tp_MyPage = Anchor;
    //return;    
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    //return;    
}

defaultproperties
{
    bVisibleWhenEmpty=true
    SelectedStyleName="BrowserListSelection"
    OnDrawItem=ServerBrowserMCList.MyOnDrawItem
    StyleName="ServerBrowserGrid"
    RenderWeight=1.0000000
}