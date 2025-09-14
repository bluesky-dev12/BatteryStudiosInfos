class GUIPanel extends GUIMultiComponent
    native
    editinlinenew
    instanced;

var(Panel) Material Background;
var bool SetControlsBoundToParent;
var bool SetControlsScaleToParent;
//var delegate<OnPostDraw> __OnPostDraw__Delegate;

delegate bool OnPostDraw(Canvas Canvas)
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x69 [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].bBoundToParent = SetControlsBoundToParent;
        Controls[i].bScaleToParent = SetControlsScaleToParent;
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

defaultproperties
{
    SetControlsBoundToParent=true
    SetControlsScaleToParent=true
    PropagateVisibility=true
    bTabStop=false
}