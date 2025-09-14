/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIMultiColumnListHeader.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:1
 *
 *******************************************************************************/
class GUIMultiColumnListHeader extends GUIComponent
    native
    editinlinenew
    instanced;

var() export editinline GUIMultiColumnList MyList;
var() const editconst int SizingCol;
var() const editconst int ClickingCol;
var() bool UseManualHeight;
var() float ManualHeight;
var export editinline GUIStyles BarStyle;
var string BarStyleName;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local GUI.eFontScale X;

    super.InitComponent(MyController, myOwner);
    // End:0x3b
    if(BarStyleName != "")
    {
        BarStyle = Controller.GetStyle(BarStyleName, X);
    }
}

defaultproperties
{
    SizingCol=-1
    ClickingCol=-1
    BarStyleName="SectionHeaderBar"
    StyleName="SectionHeaderTop"
    bAcceptsInput=true
    bRequiresStyle=true
}