class UT2K4SPTab_Qualification extends UT2K4SPTab_SingleLadder
    editinlinenew
    instanced;

function selectNextMatch()
{
    // End:0x41
    if((GP.TotalTime == float(0)) && GP.LadderProgress[LadderId] <= 1)
    {
        onMatchClick(Entries[0]);
        return;
    }
    super.selectNextMatch();
    //return;    
}

defaultproperties
{
    LadderId=0
    EntryLabels[0]="????"
    EntryLabels[1]="? ? ?"
    EntryLabels[2]="? ? ?"
    EntryLabels[3]="? ?? ????"
    EntryLabels[4]="5-way ????"
    EntryLabels[5]="?? ??? ???? ??"
    PanelCaption="???"
}