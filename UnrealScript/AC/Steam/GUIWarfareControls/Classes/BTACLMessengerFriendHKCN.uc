/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMessengerFriendHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:20
 *
 *******************************************************************************/
class BTACLMessengerFriendHKCN extends BTACLMessengerFriendHK
    editinlinenew
    instanced;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    // End:0x85
    if(GetClanName(row) != "")
    {
        PlayerOwner().Level.GameMgr.cmm.Render(C, int(L + float(2)), int(t + float(1)), int(L + float(2) + float(32)), int(B - float(1)), GetClanName(row));
    }
    // End:0x193
    else
    {
        // End:0x11f
        if(ACLRowList[row].DataPerColumn[3].tempValue > 0)
        {
            // End:0x11c
            if(PlayerOwner().Level.GetMatchMaker().kClanLookingFor)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark_02, L + float(2), t + float(1), L + float(2) + float(32), B - float(1));
            }
        }
        // End:0x193
        else
        {
            // End:0x193
            if(ACLRowList[row].DataPerColumn[4].tempValue > 0)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark_02, L + float(2), t + float(1), L + float(2) + float(32), B - float(1));
            }
        }
    }
    PlayerOwner().Level.GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
    i = 0;
    // End:0x25f
    if(0 == GetLogOnState(row))
    {
        C.DrawColor = C.MakeColor(100, 100, 100, byte(255));
    }
    // End:0x2b3
    else
    {
        // End:0x276
        if(LastSelectedIndex == row)
        {
            i = 2;
        }
        // End:0x28f
        if(selectIndex == row)
        {
            i = 1;
        }
        // End:0x2b3
        else
        {
            C.DrawColor = Data.Text[i].DrawColor;
        }
    }
    Data.Text[i].FontSize = 10;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 91, 0, 0, 0, Data.Text[i].DrawShadowColor);
    deleClanName(C, L, t, R, B, Data, GetClanName(row), row);
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
}

function int GetRoomNumber(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
}

function string GetServerIP(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
}

function int GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[3].tempValue;
}

function int GetCurPosInt(int row)
{
    return ACLRowList[row].DataPerColumn[3].tempValue;
}

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
}

function string GetServerName(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
}

function int GetChannelNum(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
}

function string GetClanName(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
}

function int GetClanPatternID(int row)
{
    return ACLRowList[row].DataPerColumn[6].IntValue;
}

function Image GetClanPattern(int row)
{
    return ACLRowList[row].DataPerColumn[4].Image;
}

function Image GetClanBG(int row)
{
    return ACLRowList[row].DataPerColumn[5].Image;
}

function Image GetClanBL(int row)
{
    return ACLRowList[row].DataPerColumn[6].Image;
}

function int GetClanNum(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[7].IntValue;
}

function SortByConnectionStatus()
{
    local int i;
    local array<BTAutoColumnListDataHK> OffLineList;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x53
        if(GetLogOnState(i) == 0)
        {
            OffLineList[OffLineList.Length] = ACLRowList[i];
            ACLRowList.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x64:
    // End:0x96 [While If]
    if(i < OffLineList.Length)
    {
        ACLRowList[ACLRowList.Length] = OffLineList[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
}

function float GetItemHeight(Canvas C)
{
    return 36.0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    CommonSizeImg.width = 32.0;
    CommonSizeImg.Height = 32.0;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    ruii = class'BTUIResourcePoolHK'.default.Msg_list_on;
    ruii2 = class'BTUIResourcePoolHK'.default.Msg_list_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.Msg_list_n;
    self.RemoveAll();
    ACLHeaderList.Length = 0;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ClanMark/Level/UserName", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}
