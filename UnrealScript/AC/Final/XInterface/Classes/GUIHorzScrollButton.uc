class GUIHorzScrollButton extends GUIScrollButtonBase
    editinlinenew
    instanced;

var() bool LeftButton;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x11
    if(bIncreaseButton)
    {
        ImageIndex = 3;
    }
    super(GUIGFXButton).InitComponent(MyController, myOwner);
    //return;    
}

defaultproperties
{
    ImageIndex=2
}