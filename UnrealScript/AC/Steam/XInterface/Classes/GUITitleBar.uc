/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUITitleBar.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *
 *******************************************************************************/
class GUITitleBar extends GUIBorder
    dependson(GUIBorder)
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
    bTabStop=true
}