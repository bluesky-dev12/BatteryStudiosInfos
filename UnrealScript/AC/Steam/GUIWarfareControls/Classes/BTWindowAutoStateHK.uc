/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowAutoStateHK.uc
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
class BTWindowAutoStateHK extends BTWindowStateHK
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

    // End:0x47
    if(con == none)
    {
        Log("[BTWindowAutoStateHK::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xdb
    if(con.OpenMenu("GUIWarfareControls.BTWindowDefineStateHK") == false)
    {
        Log("[BTWindowAutoStateHK::ShowWindow] GUIController.OpenMenu Failed!");
        con.LogMenuStack();
        return false;
    }
    strMsg = class'BTCustomDrawHK'.static.FormatString(BTWindowDefineStateHK(con.TopPage()).strClientDefine[Code], arg0, arg1, arg2);
    BTWindowDefineStateHK(con.TopPage()).SetData(strMsg);
    // End:0x17d
    if(Code == 2 || Code == 3)
    {
        BTWindowDefineStateHK(con.TopPage()).UpdateRoomLobbyWindow();
    }
    Log("[BTWindowAutoStateHK::ShowInfo] Msg=" $ strMsg);
    BTWindowDefineStateHK(con.TopPage()).StartTimeOut(5.0);
    return true;
}

defaultproperties
{
    strClientDefine[1]="Move automatically."
}