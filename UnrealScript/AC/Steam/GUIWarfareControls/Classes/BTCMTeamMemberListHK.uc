/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTCMTeamMemberListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
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
    // End:0x43 [While If]
    if(i < 9)
    {
        self.AddItem(strContextMenuName[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
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