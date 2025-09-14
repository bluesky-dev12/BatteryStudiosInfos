/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMessengerCommon.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:15
 *
 *******************************************************************************/
class BTACLMessengerCommon extends BTAutoColumnListHK
    editinlinenew
    instanced;

var delegate<deleClanName> __deleClanName__Delegate;

function SetCurpos(int row, int Value);
function SetCurLocationName(int row, string Value);
function SetChannelName(int row, string Value);
function SetServerPort(int row, int Value);
function SetServerIP(int row, string Value);
function SetServerName(int row, string Value);
function SetGameRoomNumber(int row, int Value);
function SetChannelNumber(int row, int Value);
function SetCurState(int row, int Value);
function string GetClanName(int row);
delegate deleClanName(Canvas C, float L, float t, float R, float B, ACLData Data, string szClanName, int row);
function DrawClanName(Canvas C, float L, float t, float R, float B, ACLData Data, string szClanName, int row)
{
    // End:0xea
    if(self.selectIndex == row)
    {
        // End:0xea
        if(szClanName != "")
        {
            class'BTCustomDrawHK'.static.DrawImage(C, SelectImage, L - float(110) - float(13) + float(2), t, L + float(2), B);
            class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, szClanName, Data.Text[1].FontDrawType, float(Data.Text[1].FontSize), L - float(110) - float(13) + float(2) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[1].DrawShadowColor);
        }
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    MultiColumnList.__OnBeginTooltip__Delegate = MultiColumnList_OnBeginToolTip;
    MultiColumnList.__OnEndTooltip__Delegate = MultiColumnList_OnEndToolTip;
}

function GUIToolTip MultiColumnList_OnBeginToolTip()
{
    __deleClanName__Delegate = DrawClanName;
    // End:0x3f
    if(MultiColumnList.ToolTip != none)
    {
        return MultiColumnList.ToolTip.EnterArea();
    }
    // End:0x70
    else
    {
        // End:0x70
        if(MultiColumnList.MenuOwner != none)
        {
            return MultiColumnList.MenuOwner.OnBeginTooltip();
        }
    }
    return none;
}

function bool MultiColumnList_OnEndToolTip()
{
    __deleClanName__Delegate = None;
    return true;
}
