/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4FilterSummaryListBox.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2K4FilterSummaryListBox extends GUIMultiColumnListBox
    dependson(UT2K4FilterSummaryPanel)
    editinlinenew
    instanced;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    HeaderColumnPerc = UT2K4FilterSummaryPanel(MyO).HeaderColumnPerc;
    super.InitComponent(MyC, MyO);
}

defaultproperties
{
    DefaultListClass="GUI2K4.UT2K4FilterSummaryList"
    StyleName="ServerBrowserGrid"
    begin object name=RCMenu class=GUIContextMenu
        ContextItems=// Object reference not set to an instance of an object.
        
    object end
    // Reference: GUIContextMenu'UT2K4FilterSummaryListBox.RCMenu'
    ContextMenu=RCMenu
}