class GUIListSpacer extends GUIMenuOption
    editinlinenew
    instanced;

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x31
    if((Sender == self) && GUILabel(NewComp) != none)
    {
        NewComp.FontScale = FontScale;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
    //return;    
}

defaultproperties
{
    CaptionWidth=1.0000000
    ComponentWidth=0.0000000
    ComponentClassName="XInterface.GUILabel"
    StyleName="NoBackground"
    Tag=-2
    bNeverFocus=true
    OnClickSound=0
}