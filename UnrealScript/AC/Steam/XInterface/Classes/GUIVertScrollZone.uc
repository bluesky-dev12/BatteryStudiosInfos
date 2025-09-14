/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIVertScrollZone.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GUIVertScrollZone extends GUIScrollZoneBase
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
    perc = Controller.MouseY - ActualTop() / ActualHeight();
    OnScrollZoneClick(perc);
    return true;
}
