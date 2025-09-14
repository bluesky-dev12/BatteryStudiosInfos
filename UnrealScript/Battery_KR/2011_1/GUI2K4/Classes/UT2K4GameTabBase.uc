class UT2K4GameTabBase extends UT2K4TabPanel
    editinlinenew
    instanced;

var export editinline UT2K4GamePageBase p_Anchor;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    // End:0x42
    if(UT2K4GamePageBase(Controller.ActivePage) != none)
    {
        p_Anchor = UT2K4GamePageBase(Controller.ActivePage);
    }
    //return;    
}

function string Play()
{
    return "";
    //return;    
}

function SetFooterCaption(string NewCaption, optional float SecondsToFade)
{
    // End:0x75
    if((p_Anchor != none) && p_Anchor.t_Footer != none)
    {
        p_Anchor.t_Footer.SetCaption(NewCaption);
        // End:0x75
        if((NewCaption != "") && SecondsToFade > 0.0000000)
        {
            p_Anchor.t_Footer.SetTimer(SecondsToFade);
        }
    }
    //return;    
}

defaultproperties
{
    FadeInTime=0.2500000
}