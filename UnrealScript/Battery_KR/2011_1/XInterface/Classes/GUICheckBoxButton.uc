class GUICheckBoxButton extends GUIGFXButton
    native
    editinlinenew
    instanced;

var() Material CheckedOverlay[10];
var() bool bAllOverlay;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x4F [Loop If]
    if(i < 10)
    {
        // End:0x45
        if(CheckedOverlay[i] == none)
        {
            CheckedOverlay[i] = Graphic;
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

defaultproperties
{
    Position=2
    bCheckBox=true
    StyleName="CheckBox"
    bTabStop=true
}