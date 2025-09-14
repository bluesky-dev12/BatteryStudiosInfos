class BTCMTeamMemberListHK extends BTContextMenuHK
    editinlinenew
    instanced;

var localized string strContextMenuName[9];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:

    // End:0x43 [Loop If]
    if(i < 9)
    {
        self.AddItem(strContextMenuName[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

defaultproperties
{
    strContextMenuName[0]="Change Host"
    strContextMenuName[1]="Expel"
    strContextMenuName[2]="Detailed Info"
    strContextMenuName[3]="Clan Info"
    strContextMenuName[4]="Whisper"
    strContextMenuName[5]="Add Friend"
    strContextMenuName[6]="Clan Invitation"
    strContextMenuName[7]="Clan Application"
    strContextMenuName[8]="Block"
}