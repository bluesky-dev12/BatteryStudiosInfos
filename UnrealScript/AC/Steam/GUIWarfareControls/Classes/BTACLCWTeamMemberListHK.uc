/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLCWTeamMemberListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:10
 *
 *******************************************************************************/
class BTACLCWTeamMemberListHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;
var localized string strWinLose;

function AddTeamMember(int UID, string UserName, int Level, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, int ClanPattern, int ClanBG, int ClanBL, int Leader, string ClanName, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii = class'BTUIResourcePoolHK'.default.list_commu_n;
    row = new class'BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = uii;
    i = 0;
    J0x4f:
    // End:0xab [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    row.DataPerColumn[0].IntValue = Leader;
    row.DataPerColumn[0].strValue = UserName;
    row.DataPerColumn[0].tempValue = UID;
    row.DataPerColumn[1].strValue = ClanName;
    row.DataPerColumn[1].IntValue = ClanPattern;
    row.DataPerColumn[1].tempValue = ClanBG;
    row.DataPerColumn[2].IntValue = ClanBL;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[2].tempValue = Level;
    row.DataPerColumn[3].IntValue = ClanWinCnt;
    row.DataPerColumn[3].tempValue = ClanLoseCnt;
    row.DataPerColumn[3].strValue = class'BTCustomDrawHK'.static.FormatString(strWinLose, string(ClanWinCnt), string(ClanLoseCnt));
    row.DataPerColumn[4].IntValue = ClanGrade;
    row.DataPerColumn[5].IntValue = LevelMarkID;
    AddRow(row);
}

function bool RemoveTeamMember(string UserName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x43 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x39
        if(GetUserName(i) == UserName)
        {
            RemoveRow(i);
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function string GetClanName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
}

function int GetUserID(int row)
{
    return ACLRowList[row].DataPerColumn[0].tempValue;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
}

function string GetWinLose(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
}

function ChangeLeader(int UID)
{
    local int i;
    local BTAutoColumnListDataHK row;

    i = 0;
    J0x07:
    // End:0xa9 [While If]
    if(i < ACLRowList.Length)
    {
        ACLRowList[i].DataPerColumn[0].IntValue = 0;
        // End:0x9f
        if(ACLRowList[i].DataPerColumn[0].tempValue == UID)
        {
            ACLRowList[i].DataPerColumn[0].IntValue = 1;
            row = ACLRowList[i];
            RemoveRow(i);
            AddRow(row, true, 0);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local BTAutoColumnListDataHK rowdata;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    rowdata = ACLRowList[row];
    // End:0xad
    if(rowdata.DataPerColumn[0].IntValue != 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_leader, L + float(2), t + float(1), L + float(2) + float(32), B - float(1));
    }
    // End:0x129
    if(ACLRowList[row].DataPerColumn[1].IntValue == 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
    }
    // End:0x25b
    else
    {
        class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[4].Image, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
        class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[3].Image, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
        class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[2].Image, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
    }
    CommonSizeImg.Image = class'BTUIResourcePoolHK'.default.ex_clanmark.Image;
    GameMgr.GetLevelImage(rowdata.DataPerColumn[2].tempValue, rowdata.DataPerColumn[5].IntValue, CommonSizeImg);
    class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(6) + float(64), t + float(1), L + float(6) + float(96), B - float(1));
    i = 0;
    // End:0x326
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x33c
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 117, 0, 0, 0, Data.Text[i].DrawShadowColor);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetWinLose(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 235, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x54e
    if(self.selectIndex == row)
    {
        // End:0x54e
        if(GetClanName(row) != "")
        {
            class'BTCustomDrawHK'.static.DrawImage(C, SelectImage, L - float(110) - float(13) + float(2) + float(2), t, L + float(2), B);
            class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetClanName(row), Data.Text[1].FontDrawType, float(Data.Text[1].FontSize), L - float(110) - float(13) + float(2) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[1].DrawShadowColor);
        }
    }
}

function float GetItemHeight(Canvas C)
{
    return 34.0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.width = 32.0;
    CommonSizeImg.Height = 32.0;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = class'BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = class'BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.list_commu_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("LeaderIcon/ClanMark/Level/UserID/WinLose", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

defaultproperties
{
    strWinLose="%0 W / %1 L"
}