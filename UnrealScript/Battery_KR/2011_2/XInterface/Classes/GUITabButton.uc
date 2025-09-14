class GUITabButton extends GUIButton
    native
    editinlinenew
    instanced;

var bool bForceFlash;
var bool bActive;
var export editinline GUITabPanel MyPanel;

event SetFocus(GUIComponent Who)
{
    //return;    
}

function bool ChangeActiveState(bool IsActive, bool bFocusPanel)
{
    // End:0x0D
    if(MyPanel == none)
    {
        return false;
    }
    // End:0x7C
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
    //return;    
}

function bool CanShowPanel()
{
    // End:0x1F
    if((int(MenuState) == int(4)) || MyPanel == none)
    {
        return false;
    }
    return MyPanel.CanShowPanel();
    //return;    
}

defaultproperties
{
    StyleName="TabButton"
    WinHeight=0.0750000
    bBoundToParent=true
    bNeverFocus=true
    OnClickSound=2
}