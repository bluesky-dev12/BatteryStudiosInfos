class BTACLTeamMemberListHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

struct StrInt_Struct
{
    var string strValue;
    var int IntValue;
};

var localized string strStatus[10];
var localized string strMaster;
var Image LevelImg;

function float GetItemHeight(Canvas C)
{
    return float(36) * (float(Controller.ResY) / 768.0000000);
    //return;    
}

function AddTeamMember(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Status, int Host, int Ping, string UserIP, byte LookingFor, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3, optional bool bMe)
{
    local BTAutoColumnListDataHK Data;
    local int i;
    local wGameManager GameMgr;

    Data = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    Data.Init(10);
    i = 0;
    J0x27:

    // End:0x85 [Loop If]
    if(i < 3)
    {
        Data.DataPerColumn[2].Text[i].FontDrawType = 3;
        Data.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    i = 0;
    J0x8C:

    // End:0x178 [Loop If]
    if(i < 9)
    {
        // End:0xD4
        if(bMe)
        {
            Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.myName();            
        }
        else
        {
            Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
        }
        Data.DataPerColumn[i].Text[0].FontSize = 10;
        Data.DataPerColumn[i].Text[1].FontSize = 10;
        Data.DataPerColumn[i].Text[2].FontSize = 10;
        i++;
        // [Loop Continue]
        goto J0x8C;
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
    Data.DataPerColumn[4].tempValue = int(LookingFor);
    Data.DataPerColumn[5].tempValue = ClanLevel;
    Data.DataPerColumn[9].Image = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 0, GameMgr.GetClanLevelTexture(ClanLevel));
    // End:0x449
    if(NickName == Controller.ViewportOwner.Actor.Level.GetMatchMaker().kUserName)
    {
        Data.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        Data.DataPerColumn[3].tempValue = 0;
    }
    AddRow(Data);
    //return;    
}

function bool ReplaceUserNickName(string Old_NickName, string New_NickName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x6B [Loop If]
    if(lp1 < ACLRowList.Length)
    {
        // End:0x61
        if(ACLRowList[lp1].DataPerColumn[2].strValue == Old_NickName)
        {
            ACLRowList[lp1].DataPerColumn[2].strValue = New_NickName;
            return true;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function ReplaceClanName(string old_ClanName, string new_ClanName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x69 [Loop If]
    if(lp1 < ACLRowList.Length)
    {
        // End:0x5F
        if(ACLRowList[lp1].DataPerColumn[3].strValue == old_ClanName)
        {
            ACLRowList[lp1].DataPerColumn[3].strValue = new_ClanName;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ReplaceClanLevel(string ClanName, int ClanLevel)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x68 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x5E
        if(ACLRowList[i].DataPerColumn[3].strValue == ClanName)
        {
            ACLRowList[i].DataPerColumn[1].tempValue = ClanLevel;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function int FindTeamMemberIndex(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4D [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x43
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool ChangeTeamMember(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Status, int Host, int Ping, string UserIP, byte LookingFor, int ClanLevel, optional bool bMe)
{
    local BTAutoColumnListDataHK Data;
    local int i;
    local wGameManager GameMgr;

    i = 0;
    J0x07:

    // End:0x3C9 [Loop If]
    if(i < ACLRowList.Length)
    {
        Data = ACLRowList[i];
        i = 0;
        J0x2F:

        // End:0xD1 [Loop If]
        if(i < 9)
        {
            // End:0xC7
            if(Data.DataPerColumn[6].IntValue == UID)
            {
                // End:0x97
                if(bMe)
                {
                    Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.myName();
                    // [Explicit Continue]
                    goto J0xC7;
                }
                Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
            }
            J0xC7:

            i++;
            // [Loop Continue]
            goto J0x2F;
        }
        // End:0x3BF
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
            Data.DataPerColumn[4].tempValue = int(LookingFor);
            Data.DataPerColumn[5].tempValue = ClanLevel;
            Data.DataPerColumn[9].Image = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 0, GameMgr.GetClanLevelTexture(ClanLevel));
            // End:0x3A7
            if(NickName == Controller.ViewportOwner.Actor.Level.GetMatchMaker().kUserName)
            {
                Data.DataPerColumn[3].tempValue = 1;
                // [Explicit Continue]
                goto J0x3BF;
            }
            Data.DataPerColumn[3].tempValue = 0;
        }
        J0x3BF:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool RemoveTeamMemberByUID(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x4A
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            RemoveRow(i);
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool ChangeRoomOwnerInfo(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8E [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x62
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            ACLRowList[i].DataPerColumn[4].floatValue = 0.0000000;
            // [Explicit Continue]
            goto J0x84;
        }
        ACLRowList[i].DataPerColumn[4].floatValue = 1.0000000;
        J0x84:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
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

    // End:0xE9 [Loop If]
    if(i < ACLRowList.Length)
    {
        CurClanName = GetClanName(i);
        // End:0x37
        if(CurClanName == "")
        {
            // [Explicit Continue]
            goto J0xDF;
        }
        bContinue = false;
        j = 0;
        J0x46:

        // End:0x8D [Loop If]
        if(j < ExistClanName.Length)
        {
            // End:0x83
            if(ExistClanName[j] == CurClanName)
            {
                ExistClanCount[j]++;
                bContinue = true;
                // [Explicit Break]
                goto J0x8D;
            }
            j++;
            // [Loop Continue]
            goto J0x46;
        }
        J0x8D:

        // End:0x99
        if(bContinue)
        {
            // [Explicit Continue]
            goto J0xDF;
        }
        ExistClanName.Length = ExistClanName.Length + 1;
        ExistClanCount.Length = ExistClanCount.Length + 1;
        ExistClanName[ExistClanName.Length - 1] = CurClanName;
        ExistClanCount[ExistClanCount.Length - 1] = 1;
        J0xDF:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    MaxCount = -1;
    CurClanName = "";
    j = 0;
    J0x103:

    // End:0x154 [Loop If]
    if(j < ExistClanCount.Length)
    {
        // End:0x14A
        if(ExistClanCount[j] > MaxCount)
        {
            MaxCount = ExistClanCount[j];
            CurClanName = ExistClanName[j];
        }
        j++;
        // [Loop Continue]
        goto J0x103;
    }
    si_struct.IntValue = MaxCount;
    si_struct.strValue = CurClanName;
    return si_struct;
    //return;    
}

function int GetMaxSameClanUserCount()
{
    local StrInt_Struct si_struct;

    si_struct = GetMaxSameClanUserInfo();
    return si_struct.IntValue;
    //return;    
}

function string GetMaxSameClanName()
{
    local StrInt_Struct si_struct;

    si_struct = GetMaxSameClanUserInfo();
    return si_struct.strValue;
    //return;    
}

function int GetReadyUserCount()
{
    local int i, Count;

    Count = 0;
    i = 0;
    J0x0E:

    // End:0xA1 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x43
        if(ACLRowList[i].DataPerColumn[3].IntValue == 1)
        {
            // [Explicit Continue]
            goto J0x97;
        }
        // End:0x6E
        if(ACLRowList[i].DataPerColumn[4].floatValue == float(0))
        {
            Count++;
        }
        // End:0x97
        if(ACLRowList[i].DataPerColumn[4].IntValue == 1)
        {
            Count++;
        }
        J0x97:

        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    return Count;
    //return;    
}

function bool IsAllReady()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xD3 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x3C
        if(ACLRowList[i].DataPerColumn[3].IntValue == 1)
        {
            // [Explicit Continue]
            goto J0xC9;
        }
        // End:0x63
        if(ACLRowList[i].DataPerColumn[4].floatValue == float(0))
        {
            // [Explicit Continue]
            goto J0xC9;
        }
        // End:0xC9
        if(ACLRowList[i].DataPerColumn[4].IntValue != 1)
        {
            PlayerOwner().dblog("ReadyStatus ret false" @ ACLRowList[i].DataPerColumn[2].strValue);
            return false;
        }
        J0xC9:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function bool ChangeTeamMemberStatus(int UID, int Status)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6B [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x61
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            ACLRowList[i].DataPerColumn[4].IntValue = Status;
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool ChangeLevelMarkID(string UserName, int LevelMarkID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6A [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x60
        if(ACLRowList[i].DataPerColumn[2].strValue == UserName)
        {
            ACLRowList[i].DataPerColumn[1].tempValue = LevelMarkID;
            return true;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool ChangePingInfo(int UID, int PingValue)
{
    local int i, PingIndex;

    PingIndex = PingToIndex(PingValue);
    i = 0;
    J0x18:

    // End:0x9E [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x94
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            ACLRowList[i].DataPerColumn[5].IntValue = PingIndex;
            ACLRowList[i].DataPerColumn[5].tempValue = PingValue;
            return true;
        }
        ++i;
        // [Loop Continue]
        goto J0x18;
    }
    return false;
    //return;    
}

function int PingToIndex(int msec)
{
    // End:0x11
    if(msec <= 50)
    {
        return 0;        
    }
    else
    {
        // End:0x22
        if(msec <= 80)
        {
            return 1;            
        }
        else
        {
            // End:0x34
            if(msec <= 150)
            {
                return 2;                
            }
            else
            {
                return 3;
            }
        }
    }
    //return;    
}

function BTAutoColumnListDataHK FindTeamMember(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x49
        if(ACLRowList[i].DataPerColumn[6].IntValue == UID)
        {
            return ACLRowList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x7F
    if((selectIndex == row) && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);        
    }
    else
    {
        // End:0xA5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {            
        }
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
    // End:0x16A
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    // End:0x213
    if(ACLRowList[row].DataPerColumn[3].strValue != "")
    {
        PlayerOwner().Level.GameMgr.cmm.Render(C, int(L), int(t + float(1)), int(((L + B) - t) - float(2)), int(B - float(1)), ACLRowList[row].DataPerColumn[3].strValue);        
    }
    else
    {
        // End:0x2AF
        if(ACLRowList[row].DataPerColumn[3].tempValue > 0)
        {
            // End:0x2AC
            if(PlayerOwner().Level.GetMatchMaker().kClanLookingFor)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark_02, L, t + float(1), ((L + B) - t) - float(2), B - float(1));
            }            
        }
        else
        {
            // End:0x325
            if(ACLRowList[row].DataPerColumn[4].tempValue > 0)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark_02, L, t + float(1), ((L + B) - t) - float(2), B - float(1));
            }
        }
    }
    //return;    
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    i = 0;
    // End:0x7F
    if((selectIndex == row) && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);        
    }
    else
    {
        // End:0xA5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {            
        }
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
    // End:0x16A
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    // End:0x1D0
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(Data.IntValue, GetLevelMarkID(row), LevelImg);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, LevelImg, L + float(8), t + float(1), R + float(4), B - float(1));
    //return;    
}

function LC2_3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x7F
    if((selectIndex == row) && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);        
    }
    else
    {
        // End:0xA5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {            
        }
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
    // End:0x16A
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(10), t + float(1), R, B - float(1), Data.Text[i].DrawShadowColor);
    //return;    
}

function LC4_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x7F
    if((selectIndex == row) && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);        
    }
    else
    {
        // End:0xA5
        if(MultiColumnList.bMousePress && selectIndex == row)
        {            
        }
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
    // End:0x16A
    if(ACLRowList[row].DataPerColumn[3].tempValue == 1)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = 192;
        C.DrawColor.B = 0;
    }
    // End:0x21D
    if(Data.floatValue < 0.5000000)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_mstr, L + float(5), t, R - float(5), B);
        // End:0x21D
        if(Data.IntValue == 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, strMaster, 4, 10.0000000, L, t, R, B, Class'Engine.Canvas'.static.MakeColorNoEmpty(0, 0, 0, byte(255)));
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, strStatus[Data.IntValue], 4, 10.0000000, L, t, R, B, Class'Engine.Canvas'.static.MakeColorNoEmpty(0, 0, 0, byte(255)));
    //return;    
}

function LC5_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    // End:0x71
    if((selectIndex == row) && MultiColumnList.bMousePress == false)
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);        
    }
    else
    {
        // End:0x97
        if(MultiColumnList.bMousePress && selectIndex == row)
        {            
        }
        else
        {
            // End:0xEE
            if(LastSelectedIndex == row)
            {
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[Column].ColumnImageList[4], (L + float(5)) - float(2), (t + float(9)) - float(2), ((L + float(5)) + float(19)) - float(2), ((t + float(9)) + float(20)) - float(2));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[Column].ColumnImageList[Data.IntValue], L + float(5), t + float(9), R, B);
    // End:0x233
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(Data.tempValue), 2, 9.0000000, L + float(8), t + float(5), R, B);
    }
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    LevelImg = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 26, none);
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_List_On;
    self.LastSelectedImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_List_Focus;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_List_n;
    self.MarkMe = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.WaitRoom_List_Me;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clan", 46.0000000 - float(14), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("level", 80.0000000 - float(48), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("nickname", 205.0000000 - float(81), 7);
    headerInfo.__CustomDraw__Delegate = LC2_3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clanname", 329.0000000 - float(205), 7);
    headerInfo.__CustomDraw__Delegate = LC2_3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("status", 373.0000000 - float(329), 7);
    headerInfo.__CustomDraw__Delegate = LC4_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

function string GetUserName(int Index)
{
    return ACLRowList[Index].DataPerColumn[2].strValue;
    //return;    
}

function string GetClanName(int Index)
{
    return ACLRowList[Index].DataPerColumn[3].strValue;
    //return;    
}

function int GetUserID(int Index)
{
    return ACLRowList[Index].DataPerColumn[6].IntValue;
    //return;    
}

function int GetClanPatternID(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
    //return;    
}

function Color GetUserNameColor(int row)
{
    return ACLRowList[row].DataPerColumn[2].Text[0].DrawColor;
    //return;    
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[1].tempValue;
    //return;    
}

defaultproperties
{
    strStatus[1]="??????"
    strStatus[2]="Playing"
    strStatus[3]="???????"
    strStatus[4]="??????"
    strStatus[5]="?????"
    strStatus[6]="??????"
    strStatus[8]="????????????"
    strStatus[9]="Lucky Shop"
    strMaster="???????"
}