/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIPanel.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class GUIPanel extends GUIMultiComponent
    dependson(GUIMultiComponent)
    native
    editinlinenew
    instanced;

var(Panel) Material Background;
var bool SetControlsBoundToParent;
var bool SetControlsScaleToParent;
var delegate<OnPostDraw> __OnPostDraw__Delegate;

delegate bool OnPostDraw(Canvas Canvas);
function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x69 [While If]
    if(i < Controls.Length)
    {
        Controls[i].bBoundToParent = SetControlsBoundToParent;
        Controls[i].bScaleToParent = SetControlsScaleToParent;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

defaultproperties
{
    SetControlsBoundToParent=true
    SetControlsScaleToParent=true
    PropagateVisibility=true
    bTabStop=true
}