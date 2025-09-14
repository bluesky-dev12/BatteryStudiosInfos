class MatchSetupPanelBase extends UT2K4TabPanel
    abstract
    editinlinenew
    instanced;

var() string Group;
var() editconst noexport VotingReplicationInfo VRI;
var() bool bDirty;
//var delegate<OnLogIn> __OnLogIn__Delegate;
//var delegate<OnLogOut> __OnLogOut__Delegate;
//var delegate<SendCommand> __SendCommand__Delegate;

function InitPanel()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3B [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].__OnChange__Delegate = InternalOnChange;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool IsAdmin()
{
    local PlayerController PC;

    PC = PlayerOwner();
    return ((PC != none) && PC.PlayerReplicationInfo != none) && PC.PlayerReplicationInfo.bAdmin;
    //return;    
}

function bool IsLoggedIn()
{
    return (IsAdmin()) || (VRI != none) && VRI.bMatchSetupPermitted;
    //return;    
}

delegate OnLogIn()
{
    //return;    
}

delegate OnLogOut()
{
    //return;    
}

delegate SendCommand(string Cmd)
{
    //return;    
}

function LoggedIn()
{
    EnableComponent(MyButton);
    //return;    
}

function LoggedOut()
{
    DisableComponent(MyButton);
    //return;    
}

function SubmitChanges()
{
    bDirty = false;
    //return;    
}

function bool HandleResponse(string Type, string Info, string Data)
{
    return false;
    //return;    
}

function ReceiveComplete()
{
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    bDirty = true;
    OnChange(self);
    //return;    
}

event free()
{
    VRI = none;
    super(GUITabPanel).free();
    //return;    
}

defaultproperties
{
    OnLogIn=MatchSetupPanelBase.LoggedIn
    OnLogOut=MatchSetupPanelBase.LoggedOut
}