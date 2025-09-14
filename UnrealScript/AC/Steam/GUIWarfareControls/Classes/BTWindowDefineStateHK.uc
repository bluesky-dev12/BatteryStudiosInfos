/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowDefineStateHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowDefineStateHK extends BTWindowStateHK
    dependson(BTWindowStateHK)
    editinlinenew
    instanced;

var localized string strClientDefine[15];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
}

static function string GetFormatString(int Code, optional string arg0, optional string arg1, optional string arg2)
{
    local export editinline BTWindowDefineInfoHK BTWindow;

    BTWindow = new class'BTWindowDefineInfoHK';
    return class'BTCustomDrawHK'.static.FormatString(BTWindow.strClientDefine[Code], arg0, arg1, arg2);
}

static function bool ShowState(GUIController con, int Code, optional string arg0, optional string arg1, optional string arg2)
{
    local string strMsg;

    // End:0x49
    if(con == none)
    {
        Log("[BTWindowDefineStateHK::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xdf
    if(con.OpenMenu("GUIWarfareControls.BTWindowDefineStateHK") == false)
    {
        Log("[BTWindowDefineStateHK::ShowWindow] GUIController.OpenMenu Failed!");
        con.LogMenuStack();
        return false;
    }
    strMsg = class'BTCustomDrawHK'.static.FormatString(BTWindowDefineStateHK(con.TopPage()).strClientDefine[Code], arg0, arg1, arg2);
    BTWindowDefineStateHK(con.TopPage()).SetData(strMsg);
    // End:0x181
    if(Code == 2 || Code == 3)
    {
        BTWindowDefineStateHK(con.TopPage()).UpdateRoomLobbyWindow();
    }
    Log("[BTWindowDefineStateHK::ShowInfo] Msg=" $ strMsg);
    return true;
}

defaultproperties
{
    strClientDefine[1]="Move automatically."
    strClientDefine[2]="Configuring network connection settings. It may take longer if the host is still loading. Wait a moment."
    strClientDefine[3]="Team Balance is in effect. Teams have been changed. Configuring network connection settings. It may take longer if the host is still loading. Wait a moment."
    strClientDefine[4]="Connecting to the channel."
    strClientDefine[5]="Receiving the Paid Storage list."
    strClientDefine[6]="Receiving the Buyable Gift Box list."
    strClientDefine[7]="Connecting to the login server..."
    strClientDefine[8]="Joining game #%0..."
}