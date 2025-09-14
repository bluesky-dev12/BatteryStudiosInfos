class AdminPanelBase extends GUIPanel
    editinlinenew
    instanced;

var() localized string PanelCaption;
var() noexport bool bAdvancedAdmin;

function bool IsAdmin()
{
    return ((PlayerOwner() != none) && PlayerOwner().PlayerReplicationInfo != none) && PlayerOwner().PlayerReplicationInfo.bAdmin;
    //return;    
}

function AdminCommand(string Command)
{
    // End:0x1B
    if(PlayerOwner() != none)
    {
        PlayerOwner().AdminCommand(Command);
    }
    //return;    
}

function LoggedIn(string AdminName)
{
    //return;    
}

function LoggedOut()
{
    //return;    
}

function SetAdvanced(bool bIsAdvanced)
{
    bAdvancedAdmin = bIsAdvanced;
    //return;    
}

function AdminReply(string Reply)
{
    //return;    
}

function ShowPanel()
{
    //return;    
}

defaultproperties
{
    WinTop=0.1312500
    WinHeight=0.8625020
    bBoundToParent=true
    bScaleToParent=true
}