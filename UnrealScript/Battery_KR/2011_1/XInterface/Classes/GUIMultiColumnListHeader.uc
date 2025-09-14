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
    // End:0x3B
    if(BarStyleName != "")
    {
        BarStyle = Controller.GetStyle(BarStyleName, X);
    }
    //return;    
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