/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindow.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BTWindow extends FloatingWindow
    editinlinenew
    instanced;

var bool bHandleEsc;

event Opened(GUIComponent Sender)
{
    super(PopupPageBase).Opened(Sender);
    PlayerOwner().ClientPlaySound(sound'ui_window_open',,, 6);
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlayerOwner().ClientPlaySound(sound'ui_window_close',,, 6);
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x0e
    if(bHandleEsc)
    {
        return false;
    }
    // End:0x10
    else
    {
        return true;
    }
}
