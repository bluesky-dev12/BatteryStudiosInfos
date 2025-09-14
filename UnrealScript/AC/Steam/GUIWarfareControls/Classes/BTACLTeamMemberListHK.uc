/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLTeamMemberListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:2
 *	Functions:31
 *
 *******************************************************************************/
class BTACLTeamMemberListHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

struct StrInt_Struct
{
    var string strValue;
    var int IntValue;
};

var localized string strStatus[10];
var Image LevelImg;

function float GetItemHeight(Canvas C)
{
    return 36.0;
}

function AddTeamMember(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Status, int Host, int Ping, string UserIP, byte LookingFor, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3, optional bool bMe)
{
    local BTAutoColumnListDataHK Data;
    local int i;
    local wGameManager GameMgr;

    Data = new class'BTAutoColumnListDataHK';
    Data.Init(10);
    i = 0;
    J0x27:
    // End:0x85 [While If]
    if(i < 3)
    {
        Data.DataPerColumn[2].Text[i].FontDrawType = 3;
        Data.DataPerColumn[3].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    i = 0;
    J0x8c:
    // End:0x178 [While If]
    if(i < 9)
    {
        // End:0xd4
        if(bMe)
        {
            Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.myName();
        }
        // End:0x104
        else
        {
            Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
        }
        Data.DataPerColumn[i].Text[0].FontSize = 10;
        Data.DataPerColumn[i].Text[1].FontSize = 10;
        Data.DataPerColumn[i].Text[2].FontSize = 10;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8c;
    }
    Data.DataPerColumn[0].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Data.DataPerColumn[1].IntValue = Level;
    Data.DataPerColumn[1].tempValue = LevelMarkID;
    Data.DataPerColumn[2].strValue = NickName;
    Data.DataPerColumn[3].strValue = ClanName;
    Data.DataPerColumn[4].IntValue = Status;
    Data.DataPerColumn[4].floatValue = float(Host);
    Data.DataPerColumn[5].strValue = UserIP;
    Data.DataPerColumn[5].IntValue = Ping;
    Data.DataPerColumn[6].IntValue = UID;
    Data.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanMark);
    Data.DataPerColumn[7].IntValue = ClanBG;
    Data.DataPerColumn[7].Image = GameMgr.GetClanMark32(ClanBG);
    Data.DataPerColumn[8].IntValue = ClanBL;
    Data.DataPerColumn[8].Image = GameMgr.GetClanMark32(ClanBL);
    Data.DataPerColumn[4].tempValue = LookingFor;
    Data.DataPerColumn[5].tempValue = ClanLevel;
    Data.DataPerColumn[9].Image = class'BTCustomDrawHK'.static.MakeImage(16, 16, 0, GameMgr.GetClanLevelTexture(ClanLevel));
    // End:0x449
    if(NickName == Controller.ViewportOwner.Actor.Level.GetMatchMaker().kUserName)
    {
        Data.DataPerColumn[3].tempValue = 1;
    }
    // End:0x461
    else
    {
        Data.DataPerColumn[3].tempValue = 0;
    }
    AddRow(Data);
}

function bool ReplaceUserNickName(string Old_NickName, string New_NickName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x6b [While If]
    if(lp1 < ACLRowList.Length)
    {
        // End:0x61
        if(ACLRowList[lp1].DataPerColumn[2].strValue == Old_NickName)
        {
            ACLRowList[lp1].DataPerColumn[2].strValue = New_NickName;
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function ReplaceClanName(string old_ClanName, string new_ClanName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x69 [While If]
    if(lp1 < ACLRowList.Length)
    {
        // End:0x5f
        if(ACLRowList[lp1].DataPerColumn[3].strValue == old_ClanName)
        {
            ACLRowList[lp1].DataPerColumn[3].strValue = new_ClanName;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ReplaceClanLevel(string ClanName, int ClanLevel)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x68 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x5e
        if(ACLRowList[i].DataPerColumn[3].strValue == ClanName)
        {
            ACLRowList[i].DataPerColumn[1].tempValue = ClanLevel;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int FindTeamMemberIndex(int UID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4d [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x43
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool ChangeTeamMember(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Status, int Host, int Ping, string UserIP, byte LookingFor, int ClanLevel, optional bool bMe)
{
    local BTAutoColumnListDataHK Data;
    local int i;
    local wGameManager GameMgr;

    i = 0;
    J0x07:
    // End:0x3c9 [While If]
    if(i < ACLRowList.Length)
    {
        Data = ACLRowList[i];
        i = 0;
        J0x2f:
        // End:0xd1 [While If]
        if(i < 9)
        {
            // End:0xc7
            if(Data.DataPerColumn[6].IntValue == UID)
            {
                // End:0x97
                if(bMe)
                {
                    Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.myName();
                }
                // End:0xc7
                else
                {
                    Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
        // End:0x3bf
        if(Data.DataPerColumn[6].IntValue == UID)
        {
            Data.DataPerColumn[0].IntValue = ClanMark;
            GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
            Data.DataPerColumn[1].IntValue = Level;
            Data.DataPerColumn[2].strValue = NickName;
            Data.DataPerColumn[3].strValue = ClanName;
            Data.DataPerColumn[4].IntValue = Status;
            Data.DataPerColumn[4].floatValue = float(Host);
            Data.DataPerColumn[5].strValue = UserIP;
            Data.DataPerColumn[5].IntValue = Ping;
            Data.DataPerColumn[6].IntValue = UID;
            Data.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanMark);
            Data.DataPerColumn[7].IntValue = ClanBG;
            Data.DataPerColumn[7].Image = GameMgr.GetClanMark32(ClanBG);
            Data.DataPerColumn[8].IntValue = ClanBL;
            Data.DataPerColumn[8].Image = GameMgr.GetClanMark32(ClanBL);
            Data.DataPerColumn[4].tempValue = LookingFor;
            Data.DataPerColumn[5].tempValue = ClanLevel;
            Data.DataPerColumn[9].Image = class'BTCustomDrawHK'.static.MakeImage(16, 16, 0, GameMgr.GetClanLevelTexture(ClanLevel));
            // End:0x3a7
            if(NickName == Controller.ViewportOwner.Actor.Level.GetMatchMaker().kUserName)
            {
                Data.DataPerColumn[3].tempValue = 1;
            }
            // End:0x3bf
            else
            {
                Data.DataPerColumn[3].tempValue = 0;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
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
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
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

function bool ChangeRoomOwnerInfo(int UID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8e [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x62
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            ACLRowList[i].DataPerColumn[4].floatValue = 0.0;
        }
        // End:0x84
        else
        {
            ACLRowList[i].DataPerColumn[4].floatValue = 1.0;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function StrInt_Struct GetMaxSameClanUserInfo()
{
    local int i, j;
    local bool bContinue;
    local int MaxCount;
    local string CurClanName;
    local array<string> ExistClanName;
    local array<int> ExistClanCount;
    local StrInt_Struct si_struct;

    i = 0;
    J0x07:
    // End:0xe9 [While If]
    if(i < ACLRowList.Length)
    {
        CurClanName = GetClanName(i);
        // End:0x37
        if(CurClanName == "")
        {
        }
        // End:0xdf
        else
        {
            bContinue = false;
            j = 0;
            J0x46:
            // End:0x8d [While If]
            if(j < ExistClanName.Length)
            {
                // End:0x83
                if(ExistClanName[j] == CurClanName)
                {
                    ++ ExistClanCount[j];
                    bContinue = true;
                }
                // End:0x8d
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x46;
                }
            }
            // End:0x99
            if(bContinue)
            {
            }
            // End:0xdf
            else
            {
                ExistClanName.Length = ExistClanName.Length + 1;
                ExistClanCount.Length = ExistClanCount.Length + 1;
                ExistClanName[ExistClanName.Length - 1] = CurClanName;
                ExistClanCount[ExistClanCount.Length - 1] = 1;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    MaxCount = -1;
    CurClanName = "";
    j = 0;
    J0x103:
    // End:0x154 [While If]
    if(j < ExistClanCount.Length)
    {
        // End:0x14a
        if(ExistClanCount[j] > MaxCount)
        {
            MaxCount = ExistClanCount[j];
            CurClanName = ExistClanName[j];
        }
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x103;
    }
    si_struct.IntValue = MaxCount;
    si_struct.strValue = CurClanName;
    return si_struct;
}

function int GetMaxSameClanUserCount()
{
    local StrInt_Struct si_struct;

    si_struct = GetMaxSameClanUserInfo();
    return si_struct.IntValue;
}

function string GetMaxSameClanName()
{
    local StrInt_Struct si_struct;

    si_struct = GetMaxSameClanUserInfo();
    return si_struct.strValue;
}

function int GetReadyUserCount()
{
    local int i, Count;

    Count = 0;
    i = 0;
    J0x0e:
    // End:0xa1 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x43
        if(ACLRowList[i].DataPerColumn[3].IntValue == 1)
        {
        }
        // End:0x97
        else
        {
            // End:0x6e
            if(ACLRowList[i].DataPerColumn[4].floatValue == float(0))
            {
                ++ Count;
            }
            // End:0x97
            if(ACLRowList[i].DataPerColumn[4].IntValue == 1)
            {
                ++ Count;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    return Count;
}

function bool IsAllReady()
{
    local int i;

    i = 0;
    J0x07:
    // End:0xd3 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x3c
        if(ACLRowList[i].DataPerColumn[3].IntValue == 1)
        {
        }
        // End:0xc9
        else
        {
            // End:0x63
            if(ACLRowList[i].DataPerColumn[4].floatValue == float(0))
            {
            }
            // End:0xc9
            else
            {
                // End:0xc9
                if(ACLRowList[i].DataPerColumn[4].IntValue != 1)
                {
                    PlayerOwner().dblog("ReadyStatus ret false" @ ACLRowList[i].DataPerColumn[2].strValue);
                    return false;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function bool ChangeTeamMemberStatus(int UID, int Status)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6b [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x61
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            ACLRowList[i].DataPerColumn[4].IntValue = Status;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool ChangeLevelMarkID(string UserName, int LevelMarkID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6a [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x60
        if(ACLRowList[i].DataPerColumn[2].strValue == UserName)
        {
            ACLRowList[i].DataPerColumn[1].tempValue = LevelMarkID;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool ChangePingInfo(int UID, int PingValue)
{
    local int i, PingIndex;

    PingIndex = PingToIndex(PingValue);
    i = 0;
    J0x18:
    // End:0x9e [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x94
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            ACLRowList[i].DataPerColumn[5].IntValue = PingIndex;
            ACLRowList[i].DataPerColumn[5].tempValue = PingValue;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return false;
}

function int PingToIndex(int msec)
{
    // End:0x11
    if(msec <= 50)
    {
        return 0;
    }
    // End:0x37
    else
    {
        // End:0x22
        if(msec <= 80)
        {
            return 1;
        }
        // End:0x37
        else
        {
            // End:0x34
            if(msec <= 150)
            {
                return 2;
            }
            // End:0x37
            else
            {
                return 3;
            }
        }
    }
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
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
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
    // End:0x7f
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x104
    else
    {
        // End:0xa5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
        }
        // End:0x104
        else
        {
            // End:0x104
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x16a
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    // End:0x213
    if(ACLRowList[row].DataPerColumn[3].strValue != "")
    {
        PlayerOwner().Level.GameMgr.cmm.Render(C, int(L), int(t + float(1)), int(L + B - t - float(2)), int(B - float(1)), ACLRowList[row].DataPerColumn[3].strValue);
    }
    // End:0x325
    else
    {
        // End:0x2af
        if(ACLRowList[row].DataPerColumn[3].tempValue > 0)
        {
            // End:0x2ac
            if(PlayerOwner().Level.GetMatchMaker().kClanLookingFor)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark_02, L, t + float(1), L + B - t - float(2), B - float(1));
            }
        }
        // End:0x325
        else
        {
            // End:0x325
            if(ACLRowList[row].DataPerColumn[4].tempValue > 0)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark_02, L, t + float(1), L + B - t - float(2), B - float(1));
            }
        }
    }
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    i = 0;
    // End:0x7f
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x104
    else
    {
        // End:0xa5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
        }
        // End:0x104
        else
        {
            // End:0x104
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x16a
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    // End:0x1d0
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(Data.IntValue, GetLevelMarkID(row), LevelImg);
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, L + float(8), t + float(1), R + float(4), B - float(1));
}

function LC2_3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x7f
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x104
    else
    {
        // End:0xa5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
        }
        // End:0x104
        else
        {
            // End:0x104
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x16a
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(10), t + float(1), R, B - float(1), Data.Text[i].DrawShadowColor);
}

function LC4_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x7f
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x104
    else
    {
        // End:0xa5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
        }
        // End:0x104
        else
        {
            // End:0x104
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x16a
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    // End:0x220
    if(Data.floatValue < 0.50)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_mstr, L + float(5), t, R - float(5), B);
        // End:0x220
        if(Data.IntValue == 0)
        {
            class'BTCustomDrawHK'.static.DrawString(C, strStatus[9], 4, 10.0, L, t, R, B, class'Canvas'.static.MakeColorNoEmpty(0, 0, 0, byte(255)));
        }
    }
    class'BTCustomDrawHK'.static.DrawString(C, strStatus[Data.IntValue], 4, 10.0, L, t, R, B, class'Canvas'.static.MakeColorNoEmpty(0, 0, 0, byte(255)));
}

function LC5_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    // End:0x71
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0xee
    else
    {
        // End:0x97
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
        }
        // End:0xee
        else
        {
            // End:0xee
            if(LastSelectedIndex == row)
            {
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    class'BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[Column].ColumnImageList[4], L + float(5) - float(2), t + float(9) - float(2), L + float(5) + float(19) - float(2), t + float(9) + float(20) - float(2));
    class'BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[Column].ColumnImageList[Data.IntValue], L + float(5), t + float(9), R, B);
    // End:0x233
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        class'BTCustomDrawHK'.static.DrawString(C, string(Data.tempValue), 2, 9.0, L + float(8), t + float(5), R, B);
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    LevelImg = class'BTCustomDrawHK'.static.MakeImage(32, 32, 26, none);
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = class'BTUIResourcePoolHK'.default.WaitRoom_List_On;
    self.LastSelectedImage = class'BTUIResourcePoolHK'.default.WaitRoom_List_Focus;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.WaitRoom_List_n;
    self.MarkMe = class'BTUIResourcePoolHK'.default.WaitRoom_List_Me;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("clan", 46.0 - float(14), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("level", 80.0 - float(48), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("nickname", 205.0 - float(81), 7);
    headerInfo.__CustomDraw__Delegate = LC2_3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("clanname", 329.0 - float(205), 7);
    headerInfo.__CustomDraw__Delegate = LC2_3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("status", 373.0 - float(329), 7);
    headerInfo.__CustomDraw__Delegate = LC4_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

function string GetUserName(int Index)
{
    return ACLRowList[Index].DataPerColumn[2].strValue;
}

function string GetClanName(int Index)
{
    return ACLRowList[Index].DataPerColumn[3].strValue;
}

function int GetUserID(int Index)
{
    return ACLRowList[Index].DataPerColumn[6].IntValue;
}

function int GetClanPatternID(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function Color GetUserNameColor(int row)
{
    return ACLRowList[row].DataPerColumn[2].Text[0].DrawColor;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[1].tempValue;
}

defaultproperties
{
    strStatus[1]="Ready"
    strStatus[2]="In Game"
    strStatus[3]="Store"
    strStatus[4]="Auction House"
    strStatus[5]="Inventory"
    strStatus[6]="Mailbox"
    strStatus[8]="My Info"
}