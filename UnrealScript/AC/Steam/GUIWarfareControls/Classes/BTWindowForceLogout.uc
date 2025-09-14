/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowForceLogout.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowForceLogout extends BTWindowInfoHK
    editinlinenew
    instanced;

var localized string MessageForcedLogout;
var localized string MessageExit;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ButtonOK.__OnClick__Delegate = Internal_OnOK;
}

static function bool ShowWindow(GUIController con, string Title, string Msg, optional string btnOk)
{
    // End:0x47
    if(con == none)
    {
        Log("[BTWindowForceLogout::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xe2
    if(con.OpenMenu("GUIWarfareControls.BTWindowForceLogout"))
    {
        BTWindowForceLogout(con.TopPage()).SetData("", 5, BTWindowForceLogout(con.TopPage()).MessageForcedLogout, BTWindowForceLogout(con.TopPage()).MessageExit);
        return true;
    }
    // End:0x118
    else
    {
        Log("[BTWindowForceLogout::ShowWindow] OpenMenu Failed!");
    }
    return true;
}

function bool Internal_OnOK(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("exit");
    return true;
}

defaultproperties
{
    MessageForcedLogout="This ID has logged in from another location. You have been disconnected from the server."
    MessageExit="Quit"
}