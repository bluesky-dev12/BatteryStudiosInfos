class GUIFilterPanel extends UT2K4PlayInfoPanel
    config(User)
    editinlinenew
    instanced;

var string currentGame;
var export editinline UT2K4CustomFilterPage p_Anchor;
var BrowserFilters FilterMaster;
var array<AFilterRule> FilterRules;
var string FilterTypeString[7];

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super.InitComponent(MyC, MyO);
    p_Anchor = UT2K4CustomFilterPage(MyO.MenuOwner.MenuOwner);
    FilterMaster = p_Anchor.FM;
    GamePI = p_Anchor.FilterPI;
    //return;    
}

function bool CanShowPanel()
{
    // End:0x1A
    if((p_Anchor == none) || FilterMaster == none)
    {
        return false;
    }
    // End:0x30
    if(p_Anchor.Index < 0)
    {
        return false;
    }
    return super.CanShowPanel();
    //return;    
}

function InitPanel()
{
    super(GUITabPanel).InitPanel();
    Opened(MenuOwner);
    //return;    
}

function AddFilterRule(AFilterRule NewRule)
{
    //return;    
}

function PopulateFilterTypes(moComboBox NewCombo, bool Ranged)
{
    // End:0x3D
    if(NewCombo == none)
    {
        Warn("Call to PopulateFilterTypes with value None!");
        return;
    }
    NewCombo.ReadOnly(true);
    NewCombo.AddItem(FilterTypeString[0],, "QT_Disabled");
    // End:0xC6
    if(!Ranged)
    {
        NewCombo.AddItem(FilterTypeString[1],, "QT_Equals");
        NewCombo.AddItem(FilterTypeString[2],, "QT_NotEquals");
        return;
    }
    NewCombo.AddItem(FilterTypeString[3],, "QT_GreaterThan");
    NewCombo.AddItem(FilterTypeString[4],, "QT_GreaterThanEquals");
    NewCombo.AddItem(FilterTypeString[5],, "QT_LessThan");
    NewCombo.AddItem(FilterTypeString[6],, "QT_LessThanEquals");
    //return;    
}

defaultproperties
{
    FilterTypeString[0]="Disabled"
    FilterTypeString[1]="Equals"
    FilterTypeString[2]="Not"
    FilterTypeString[3]="Higher"
    FilterTypeString[4]="Or Higher"
    FilterTypeString[5]="Lower"
    FilterTypeString[6]="Or Lower"
}