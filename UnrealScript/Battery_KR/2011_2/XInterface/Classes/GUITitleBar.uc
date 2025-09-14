class GUITitleBar extends GUIBorder
    native
    editinlinenew
    instanced;

var export editinline GUITabControl DockedTabs;
var() GUI.ePageAlign DockAlign;
var() bool bUseTextHeight;
var() bool bDockTop;
var const Material Effect;

defaultproperties
{
    bUseTextHeight=true
    StyleName="TextLabel"
    bTabStop=false
}