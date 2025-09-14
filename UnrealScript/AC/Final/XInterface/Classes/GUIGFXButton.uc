class GUIGFXButton extends GUIButton
    native
    editinlinenew
    instanced;

var() int ImageIndex;
var() Material Graphic;
var() GUI.eIconPosition Position;
var() bool bCheckBox;
var() bool bClientBound;
var bool bChecked;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    // End:0x24
    if(bCheckBox)
    {
        __OnClick__Delegate = InternalOnClick;
    }
    // End:0x71
    if(((Graphic == none) && ImageIndex >= 0) && ImageIndex < MyController.ImageList.Length)
    {
        Graphic = MyController.ImageList[ImageIndex];
    }
    //return;    
}

function SetChecked(bool bNewChecked)
{
    // End:0x21
    if(bCheckBox)
    {
        bChecked = bNewChecked;
        OnChange(self);
    }
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x18
    if(bCheckBox)
    {
        bChecked = !bChecked;
    }
    OnChange(self);
    return true;
    //return;    
}

defaultproperties
{
    bTabStop=false
}