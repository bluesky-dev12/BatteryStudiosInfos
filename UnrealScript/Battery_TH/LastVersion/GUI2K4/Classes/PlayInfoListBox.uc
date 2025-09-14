class PlayInfoListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    HeaderColumnPerc = UT2K4Tab_RulesBase(myOwner).HeaderColumnPerc;
    super.InitComponent(MyController, myOwner);
    //return;    
}

defaultproperties
{
    DefaultListClass="GUI2K4.PlayInfoList"
    StyleName="ListBox"
}