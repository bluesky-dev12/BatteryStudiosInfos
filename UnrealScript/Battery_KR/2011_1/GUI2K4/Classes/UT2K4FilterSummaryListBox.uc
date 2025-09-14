class UT2K4FilterSummaryListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    HeaderColumnPerc = UT2K4FilterSummaryPanel(MyO).HeaderColumnPerc;
    super.InitComponent(MyC, MyO);
    //return;    
}

defaultproperties
{
    DefaultListClass="GUI2K4.UT2K4FilterSummaryList"
    StyleName="ServerBrowserGrid"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2K4FilterSummaryListBox.RCMenu'
    begin object name="RCMenu" class=XInterface.GUIContextMenu
        ContextItems=/* Array type was not detected. */
    end object
    ContextMenu=RCMenu
}