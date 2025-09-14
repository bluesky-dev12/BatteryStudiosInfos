class BTWindow extends FloatingWindow
    editinlinenew
    instanced;

var bool bHandleEsc;

event Opened(GUIComponent Sender)
{
    super(PopupPageBase).Opened(Sender);
    PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Window/open",,, 6);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlayerOwner().FmodClientPlaySound("Warfare_Sound_UI/Window/close",,, 6);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x0E
    if(bHandleEsc)
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return;    
}
