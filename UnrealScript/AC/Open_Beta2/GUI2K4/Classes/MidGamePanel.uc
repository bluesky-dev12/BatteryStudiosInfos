class MidGamePanel extends UT2K4TabPanel
    abstract
    editinlinenew
    instanced;

var() bool bLocked;
//var delegate<ModifiedChatRestriction> __ModifiedChatRestriction__Delegate;

delegate ModifiedChatRestriction(MidGamePanel Sender, int PlayerID)
{
    //return;    
}

function UpdateChatRestriction(int PlayerID)
{
    Log((string(Name) @ "UpdateChatRestriction PlayerID:") $ string(PlayerID), 'ChatManager');
    //return;    
}

function bool PlayerIDIsMine(coerce int idx)
{
    local PlayerController PC;

    PC = PlayerOwner();
    // End:0x4F
    if(((PC != none) && PC.PlayerReplicationInfo != none) && PC.PlayerReplicationInfo.PlayerID == idx)
    {
        return true;
    }
    return false;
    //return;    
}

function free()
{
    bLocked = true;
    super(GUITabPanel).free();
    //return;    
}

function LevelChanged()
{
    bLocked = true;
    super(GUIMultiComponent).LevelChanged();
    //return;    
}
