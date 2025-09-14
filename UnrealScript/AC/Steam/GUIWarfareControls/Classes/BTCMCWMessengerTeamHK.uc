/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTCMCWMessengerTeamHK.uc
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
class BTCMCWMessengerTeamHK extends BTContextMenuHK
    editinlinenew
    instanced;

var localized string strContextMenuName[2];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x42 [While If]
    if(i < 1)
    {
        self.AddItem(strContextMenuName[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

defaultproperties
{
    strContextMenuName="Change Leader"
}