/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GameTabBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
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
}

function string Play()
{
    return "";
}

function SetFooterCaption(string NewCaption, optional float SecondsToFade)
{
    // End:0x75
    if(p_Anchor != none && p_Anchor.t_Footer != none)
    {
        p_Anchor.t_Footer.SetCaption(NewCaption);
        // End:0x75
        if(NewCaption != "" && SecondsToFade > 0.0)
        {
            p_Anchor.t_Footer.SetTimer(SecondsToFade);
        }
    }
}

defaultproperties
{
    FadeInTime=0.250
}