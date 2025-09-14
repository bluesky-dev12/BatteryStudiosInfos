class GUIVertScrollZone extends GUIScrollZoneBase
    editinlinenew
    instanced;

function bool InternalOnClick(GUIComponent Sender)
{
    local float perc;

    // End:0x0D
    if(!IsInBounds())
    {
        return false;
    }
    perc = (Controller.MouseY - ActualTop()) / ActualHeight();
    OnScrollZoneClick(perc);
    return true;
    //return;    
}
