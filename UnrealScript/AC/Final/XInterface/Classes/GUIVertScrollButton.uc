class GUIVertScrollButton extends GUIScrollButtonBase
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x27
    if(bIncreaseButton)
    {
        StyleName = "VertDownButton";
        ImageIndex = 7;
    }
    super(GUIGFXButton).InitComponent(MyController, myOwner);
    //return;    
}

defaultproperties
{
    ImageIndex=6
    StyleName="VertUpButton"
}