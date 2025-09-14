/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTCMMessengerPCBangHK.uc
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
class BTCMMessengerPCBangHK extends BTCMMessengerOnOffline
    editinlinenew
    instanced;

var localized string strContextMenuName[7];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(BTContextMenuHK).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x43 [While If]
    if(i < 7)
    {
        self.AddItem(strContextMenuName[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

defaultproperties
{
    strContextMenuName[0]="Detailed Info"
    strContextMenuName[1]="Clan Info"
    strContextMenuName[2]="Whisper"
    strContextMenuName[3]="Follow"
    strContextMenuName[4]="Invite to Game"
    strContextMenuName[5]="Clan Invitation"
    strContextMenuName[6]="Clan Application"
}