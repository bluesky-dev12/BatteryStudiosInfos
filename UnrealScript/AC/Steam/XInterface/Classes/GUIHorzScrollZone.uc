/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIHorzScrollZone.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GUIHorzScrollZone extends GUIScrollZoneBase
    editinlinenew
    instanced;

function bool InternalOnClick(GUIComponent Sender)
{
    local float perc;

    // End:0x0d
    if(!IsInBounds())
    {
        return false;
    }
    perc = Controller.MouseX - ActualLeft() / ActualWidth();
    OnScrollZoneClick(perc);
    return true;
}
