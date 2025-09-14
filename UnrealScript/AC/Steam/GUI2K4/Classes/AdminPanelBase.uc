/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\AdminPanelBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class AdminPanelBase extends GUIPanel
    editinlinenew
    instanced;

var() localized string PanelCaption;
var() noexport bool bAdvancedAdmin;

function bool IsAdmin()
{
    return PlayerOwner() != none && PlayerOwner().PlayerReplicationInfo != none && PlayerOwner().PlayerReplicationInfo.bAdmin;
}

function AdminCommand(string Command)
{
    // End:0x1b
    if(PlayerOwner() != none)
    {
        PlayerOwner().AdminCommand(Command);
    }
}

function LoggedIn(string AdminName);
function LoggedOut();
function SetAdvanced(bool bIsAdvanced)
{
    bAdvancedAdmin = bIsAdvanced;
}

function AdminReply(string Reply);
function ShowPanel();

defaultproperties
{
    WinTop=0.131250
    WinHeight=0.8625020
    bBoundToParent=true
    bScaleToParent=true
}