class GUIComboButton extends GUIVertScrollButton
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIGFXButton).InitComponent(MyController, myOwner);
    //return;    
}

defaultproperties
{
    ImageIndex=7
    StyleName="ComboButton"
    bRepeatClick=false
    OnClickSound=2
}