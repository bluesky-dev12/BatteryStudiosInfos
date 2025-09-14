/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SPTab_Qualification.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2K4SPTab_Qualification extends UT2K4SPTab_SingleLadder
    editinlinenew
    instanced;

function selectNextMatch()
{
    // End:0x41
    if(GP.TotalTime == float(0) && GP.LadderProgress[LadderId] <= 1)
    {
        onMatchClick(Entries[0]);
        return;
    }
    super.selectNextMatch();
}

defaultproperties
{
    LadderId=0
    EntryLabels=// Object reference not set to an instance of an object.
    
    PanelCaption="???"
}