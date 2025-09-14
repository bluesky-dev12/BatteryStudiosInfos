class GUIVertGripButton extends GUIGripButtonBase
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    super(GUIButton).InitComponent(MyController, MyComponent);
    //return;    
}

defaultproperties
{
    StyleName="VertGrip"
}