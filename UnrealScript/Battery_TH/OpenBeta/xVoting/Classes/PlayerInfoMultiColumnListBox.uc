class PlayerInfoMultiColumnListBox extends GUIMultiColumnListBox
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    //return;    
}

function Add(string Label, string Value)
{
    PlayerInfoMultiColumnList(List).Add(Label, Value);
    //return;    
}

defaultproperties
{
    DefaultListClass="xVoting.PlayerInfoMultiColumnList"
}