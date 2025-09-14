class GUIScrollZoneBase extends GUIComponent
    native
    editinlinenew
    instanced;

//var delegate<OnScrollZoneClick> __OnScrollZoneClick__Delegate;

delegate OnScrollZoneClick(float Delta)
{
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    return false;
    //return;    
}

defaultproperties
{
    StyleName="ScrollZone"
    RenderWeight=0.2500000
    bAcceptsInput=true
    bCaptureMouse=true
    bNeverFocus=true
    bRepeatClick=true
    bRequiresStyle=true
    OnClick=GUIScrollZoneBase.InternalOnClick
}