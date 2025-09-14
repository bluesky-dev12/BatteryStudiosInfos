/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUITabButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class GUITabButton extends GUIButton
    dependson(GUITabPanel)
    native
    editinlinenew
    instanced;

var bool bForceFlash;
var bool bActive;
var export editinline GUITabPanel MyPanel;

event SetFocus(GUIComponent Who);
function bool ChangeActiveState(bool IsActive, bool bFocusPanel)
{
    // End:0x0d
    if(MyPanel == none)
    {
        return false;
    }
    // End:0x7c
    if(IsActive)
    {
        // End:0x23
        if(!CanShowPanel())
        {
            return false;
        }
        MyPanel.ShowPanel(true);
        // End:0x72
        if(bFocusPanel)
        {
            // End:0x68
            if(!MyPanel.FocusFirst(none))
            {
                MyPanel.ShowPanel(bActive);
                return false;
            }
            bActive = true;
            return true;
        }
        bActive = true;
        return true;
    }
    MyPanel.ShowPanel(false);
    bActive = false;
    return true;
}

function bool CanShowPanel()
{
    // End:0x1f
    if(MenuState == 4 || MyPanel == none)
    {
        return false;
    }
    return MyPanel.CanShowPanel();
}

defaultproperties
{
    StyleName="TabButton"
    WinHeight=0.0750
    bBoundToParent=true
    bNeverFocus=true
    OnClickSound=2
}