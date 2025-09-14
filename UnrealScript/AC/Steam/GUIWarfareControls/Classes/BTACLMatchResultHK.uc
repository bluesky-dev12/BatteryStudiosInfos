/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMatchResultHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:16
 *
 *******************************************************************************/
class BTACLMatchResultHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var localized string strStatus[4];
var Image LevelImg;
var array<Text> tarray;

function float GetItemHeight(Canvas C)
{
    return 34.0;
}

function AddTeamMemeber(bool bMe, int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Score, int Kill, int Assist, int Death, int Exp, int expup, int Point, int pointup, array<int> BonusIDs, int LookingFor, bool bFriendly, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK Data;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Data = new class'BTAutoColumnListDataHK';
    Data.Init(14);
    i = 0;
    J0x56:
    // End:0xb4 [While If]
    if(i < 3)
    {
        Data.DataPerColumn[2].Text[i].FontDrawType = 3;
        Data.DataPerColumn[3].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x56;
    }
    i = 0;
    J0xbb:
    // End:0x13d [While If]
    if(i < 11)
    {
        // End:0x103
        if(bMe)
        {
            Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.myName();
        }
        // End:0x133
        else
        {
            Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ButtonN();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbb;
    }
    Data.DataPerColumn[0].IntValue = ClanMark;
    Data.DataPerColumn[1].IntValue = Level;
    Data.DataPerColumn[2].strValue = NickName;
    Data.DataPerColumn[2].IntValue = UID;
    Data.DataPerColumn[3].strValue = ClanName;
    Data.DataPerColumn[4].IntValue = Score;
    Data.DataPerColumn[5].IntValue = Kill;
    Data.DataPerColumn[6].IntValue = Assist;
    Data.DataPerColumn[7].IntValue = Death;
    Data.DataPerColumn[9].IntValue = Exp;
    Data.DataPerColumn[9].floatValue = float(expup);
    Data.DataPerColumn[10].IntValue = Point;
    Data.DataPerColumn[10].floatValue = float(pointup);
    Data.DataPerColumn[11].IntValue = ClanBG;
    Data.DataPerColumn[12].IntValue = ClanBL;
    Data.DataPerColumn[11].Image = GameMgr.GetClanMark32(ClanMark);
    Data.DataPerColumn[12].Image = GameMgr.GetClanMark32(ClanBG);
    Data.DataPerColumn[13].Image = GameMgr.GetClanMark32(ClanBL);
    Data.DataPerColumn[4].tempValue = LookingFor;
    Data.DataPerColumn[3].IntValue = LevelMarkID;
    i = 0;
    J0x3a3:
    // End:0x3e2 [While If]
    if(i < BonusIDs.Length)
    {
        Data.DataPerColumn[i].tempValue = BonusIDs[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a3;
    }
    // End:0x48f
    if(bFriendly)
    {
        Data.DataPerColumn[2].floatValue = 1.0;
        Data.DataPerColumn[2].Text[0].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
        Data.DataPerColumn[2].Text[1].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameOn();
        Data.DataPerColumn[2].Text[2].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
    }
    AddRow(Data);
}

function bool RemoveTeamMemberByUID(int UID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x54 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x4a
        if(ACLRowList[i].DataPerColumn[2].IntValue == UID)
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

function BTAutoColumnListDataHK FindTeamMember(int UID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x53 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x49
        if(ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            return ACLRowList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0xb0
    if(ACLRowList[row].DataPerColumn[3].strValue != "")
    {
        PlayerOwner().Level.GameMgr.cmm.Render(C, int(L), int(t + float(1)), int(L + B - t - float(2)), int(B - float(1)), ACLRowList[row].DataPerColumn[3].strValue);
    }
    // End:0x126
    else
    {
        // End:0x126
        if(ACLRowList[row].DataPerColumn[4].tempValue > 0)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark_02, L, t + float(1), L + B - t - float(2), B - float(1));
        }
    }
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    i = 0;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(Data.IntValue, GetLevelMarkID(row), LevelImg);
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, L, t + float(1), R, B - float(1));
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
}

function LC3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
}

function LC3_Draw_Score(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    class'BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
}

function LC3_Draw_kill(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    class'BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
}

function LC3_Draw_assist(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    class'BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
}

function LC3_Draw_Death(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    C.DrawColor = Data.Text[i].DrawColor;
    Data.Text[i].FontDrawType = 4;
    class'BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(5), t + float(1), R - float(5), B - float(1), Data.Text[i].DrawShadowColor);
}

function LC8_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_bonus, L + float(3), t + float(3), L + float(3) + float(30), B - float(3));
    // End:0xd4
    if(ACLRowList[row].DataPerColumn[0].tempValue == 7)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_bns_chnl, L + float(3), t + float(3), L + float(3) + float(30), B - float(3));
    }
    // End:0x144
    else
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_bns[ACLRowList[row].DataPerColumn[0].tempValue], L + float(3), t + float(3), L + float(3) + float(30), B - float(3));
    }
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_bonus, L + float(3) + float(30) + float(2), t + float(3), L + float(3) + float(30 * 2) + float(2), B - float(3));
    // End:0x23d
    if(ACLRowList[row].DataPerColumn[1].tempValue == 7)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_bns_chnl, L + float(3) + float(30) + float(2), t + float(3), L + float(3) + float(30 * 2) + float(2), B - float(3));
    }
    // End:0x2c3
    else
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_bns[ACLRowList[row].DataPerColumn[1].tempValue], L + float(3) + float(30) + float(2), t + float(3), L + float(3) + float(30 * 2) + float(2), B - float(3));
    }
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_bonus, L + float(3) + float(30 * 2) + float(2 * 2), t + float(3), L + float(3) + float(30 * 3) + float(2 * 2), B - float(3));
    // End:0x3d5
    if(ACLRowList[row].DataPerColumn[2].tempValue == 7)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_bns_chnl, L + float(3) + float(30 * 2) + float(2 * 2), t + float(3), L + float(3) + float(30 * 3) + float(2 * 2), B - float(3));
    }
    // End:0x468
    else
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_bns[ACLRowList[row].DataPerColumn[2].tempValue], L + float(3) + float(30 * 2) + float(2 * 2), t + float(3), L + float(3) + float(30 * 3) + float(2 * 2), B - float(3));
    }
}

function LC9_10_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x53
    if(i == 0)
    {
        tarray[0].DrawColor = Data.Text[i].DrawColor;
        tarray[1].DrawColor = class'BTUIColorPoolHK'.static.SmallPerc();
    }
    // End:0x97
    else
    {
        tarray[0].DrawColor = Data.Text[i].DrawColor;
        tarray[1].DrawColor = Data.Text[i].DrawColor;
    }
    tarray[0].Text = string(Data.IntValue);
    tarray[1].Text = "(+" $ string(int(Data.floatValue)) $ "%)";
    class'BTCustomDrawHK'.static.DrawTextArray(C, tarray, 4, 0, L, t, R, B);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    LevelImg = class'BTCustomDrawHK'.static.MakeImage(32, 32, 26, none);
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = class'BTCustomDrawHK'.static.MakeImage(8, 8, 15, texture'list_lobby_on');
    self.LastSelectedImage = class'BTCustomDrawHK'.static.MakeImage(8, 8, 15, texture'list_lobby_cli');
    self.DefaultRowImage = class'BTCustomDrawHK'.static.MakeImage(731, 25, 15, texture'list_lobby_n');
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("clan", 359.0 - float(327), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("level", 393.0 - float(361), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("nickname", 544.0 - float(394), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("clanname", 666.0 - float(544), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("score", 704.0 - float(666), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Score;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("kill", 739.0 - float(704), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_kill;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("assist", 794.0 - float(739), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_assist;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("death", 830.0 - float(794), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Death;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("bonus", 930.0 - float(830), 7);
    headerInfo.__CustomDraw__Delegate = LC8_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("exp", 1024.0 - float(930), 7);
    headerInfo.__CustomDraw__Delegate = LC9_10_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    tarray.Length = 2;
    tarray[0] = class'BTCustomDrawHK'.static.MakeText(10, 4, "");
    tarray[1] = class'BTCustomDrawHK'.static.MakeText(8, 4, "");
    tarray[1].DrawColor = class'BTUIColorPoolHK'.static.SmallPerc();
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
}
