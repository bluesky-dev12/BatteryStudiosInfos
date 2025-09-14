/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\MidGamePanel.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *
 *******************************************************************************/
class MidGamePanel extends UT2K4TabPanel
    editinlinenew
    abstract
    instanced;

var() bool bLocked;
var delegate<ModifiedChatRestriction> __ModifiedChatRestriction__Delegate;

delegate ModifiedChatRestriction(MidGamePanel Sender, int PlayerID);
function UpdateChatRestriction(int PlayerID)
{
    Log(string(Name) @ "UpdateChatRestriction PlayerID:" $ string(PlayerID), 'ChatManager');
}

function bool PlayerIDIsMine(coerce int idx)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x4f
    if(PC != none && PC.PlayerReplicationInfo != none && PC.PlayerReplicationInfo.PlayerID == idx)
    {
        return true;
    }
    return false;
}

function free()
{
    bLocked = true;
    super(GUITabPanel).free();
}

function LevelChanged()
{
    bLocked = true;
    super(GUIMultiComponent).LevelChanged();
}
