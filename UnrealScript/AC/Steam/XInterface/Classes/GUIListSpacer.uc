/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIListSpacer.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GUIListSpacer extends GUIMenuOption
    editinlinenew
    instanced;

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x31
    if(Sender == self && GUILabel(NewComp) != none)
    {
        NewComp.FontScale = FontScale;
    }
    super.InternalOnCreateComponent(NewComp, Sender);
}

defaultproperties
{
    CaptionWidth=1.0
    ComponentWidth=0.0
    ComponentClassName="XInterface.GUILabel"
    StyleName="NoBackground"
    Tag=-2
    bNeverFocus=true
    OnClickSound=0
}