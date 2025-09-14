/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowSystemMsgInfoHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowSystemMsgInfoHK extends BTWindowInfoHK
    editinlinenew
    instanced;

var localized string strClientDefaultTitle;
var localized string strClientDefine[180];
var localized string strClientTitle[180];

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
}

static function string GetFormatString(int Code, optional string arg0, optional string arg1, optional string arg2, optional string arg3, optional string arg4, optional string arg5, optional string arg6, optional string arg7, optional string arg8)
{
    local export editinline BTWindowSystemMsgInfoHK BTWindow;

    BTWindow = new class'BTWindowSystemMsgInfoHK';
    return class'BTCustomDrawHK'.static.FormatString(BTWindow.strClientDefine[Code], arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
}

static function bool ShowInfo(GUIController con, int Code, optional string arg0, optional string arg1, optional string arg2)
{
    local string strTitle, strMsg;
    local array<string> arrStr;

    // End:0x4b
    if(con == none)
    {
        Log("[BTWindowSystemMsgInfoHK::ShowWindow] GUIController = none");
        return false;
    }
    // End:0xe5
    if(con.OpenMenu("GUIWarfareControls.BTWindowSystemMsgInfoHK") == false)
    {
        Log("[BTWindowSystemMsgInfoHK::ShowWindow] GUIController.OpenMenu Failed!");
        con.LogMenuStack();
        return false;
    }
    strMsg = class'BTCustomDrawHK'.static.FormatString(BTWindowSystemMsgInfoHK(con.TopPage()).strClientDefine[Code], arg0, arg1, arg2);
    Split(strMsg, "|", arrStr);
    strTitle = BTWindowSystemMsgInfoHK(con.TopPage()).strClientTitle[Code];
    // End:0x193
    if(strTitle == "")
    {
        strTitle = BTWindowSystemMsgInfoHK(con.TopPage()).strClientDefaultTitle;
    }
    // End:0x1ce
    if(arrStr.Length == 1)
    {
        BTWindowSystemMsgInfoHK(con.TopPage()).SetData(strTitle, 5, arrStr[0]);
    }
    // End:0x20e
    else
    {
        // End:0x20e
        if(arrStr.Length >= 2)
        {
            BTWindowSystemMsgInfoHK(con.TopPage()).SetData(strTitle, 5, arrStr[0], arrStr[1]);
        }
    }
    Log("[BTWindowSystemMsgInfoHK::ShowInfo] Msg=" $ strMsg);
    return true;
}

defaultproperties
{
    strClientDefaultTitle="Server Message Window"
    strClientDefine[2]="%4 sold for %5 Points."
    strClientDefine[3]="You won %4."
    strClientDefine[4]="The auction for %4 was canceled. No bid was placed on the item before it expired."
    strClientDefine[5]="%6%0 logged into channel %1 %2."
    strClientDefine[6]="%6%0 logged out."
    strClientDefine[7]="%6%0 was promoted to %3."
    strClientDefine[8]="%6%0 acquired %4."
    strClientDefine[9]="%4 sold for %5 Points."
    strClientDefine[10]="%0 placed a bid of %5 Points on %4."
    strClientDefine[11]="%0 bought out %4 for the price of %5 Points."
    strClientDefine[12]="Mail arrived from %0."
    strClientDefine[13]="A gift arrived from %0."
    strClientDefine[14]="A gift arrived from %0."
    strClientDefine[15]="The clan battle against %0 has started."
    strClientDefine[16]="Your clan defeated %0 in a clan battle."
    strClientDefine[17]="Your clan was defeated by %0 in a clan battle."
}