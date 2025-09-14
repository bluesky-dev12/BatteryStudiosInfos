/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path xVoting\Classes\MatchSetupPanelBase.uc
 * Package Imports:
 *	xVoting
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:13
 *
 *******************************************************************************/
class MatchSetupPanelBase extends UT2K4TabPanel
    editinlinenew
    abstract
    instanced;

var() string Group;
var() editconst noexport VotingReplicationInfo VRI;
var() bool bDirty;
var delegate<OnLogIn> __OnLogIn__Delegate;
var delegate<OnLogOut> __OnLogOut__Delegate;
var delegate<SendCommand> __SendCommand__Delegate;

function InitPanel()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3b [While If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool IsAdmin()
{
    local PlayerController PC;

    PC = PlayerOwner();
    return PC != none && PC.PlayerReplicationInfo != none && PC.PlayerReplicationInfo.bAdmin;
}

function bool IsLoggedIn()
{
    return IsAdmin() || VRI != none && VRI.bMatchSetupPermitted;
}

delegate OnLogIn();
delegate OnLogOut();
delegate SendCommand(string Cmd);
function LoggedIn()
{
    EnableComponent(MyButton);
}

function LoggedOut()
{
    DisableComponent(MyButton);
}

function SubmitChanges()
{
    bDirty = false;
}

function bool HandleResponse(string Type, string Info, string Data)
{
    return false;
}

function ReceiveComplete();
function InternalOnChange(GUIComponent Sender)
{
    bDirty = true;
    OnChange(self);
}

event free()
{
    VRI = none;
    super(GUITabPanel).free();
}

defaultproperties
{
    OnLogIn=LoggedIn
    OnLogOut=LoggedOut
}