class BTACLLobbyHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var() automated BTTTRoomInfoHK tT;
var localized string strGameState[2];
var localized string strCW_GameMode[3];
var() automated string onoff[2];
var array<string> strWeaponRestrict;
var localized array<localized string> strBotDifficult;

function float GetItemHeight(Canvas C)
{
    return 26.0000000 * (float(Controller.ResY) / 768.0000000);
    //return;    
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    // End:0x9E
    if(Data.IntValue != 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_fixroom, L, t, R, B);
    }
    //return;    
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int ImageIndex;

    ImageIndex = Data.IntValue;
    // End:0x22
    if(ImageIndex > 1)
    {
        ImageIndex = 1;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[Column].ColumnImageList[ImageIndex], L, t, R, B);
    //return;    
}

function LC3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC6_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    switch(Data.IntValue)
    {
        // End:0x6B
        case 0:
            // End:0x1A3
            break;
        // End:0xA8
        case 1:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_knife, L, t, R, B);
            // End:0x1A3
            break;
        // End:0xE6
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_pisgun, L, t, R, B);
            // End:0x1A3
            break;
        // End:0x124
        case 4:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_roket, L, t, R, B);
            // End:0x1A3
            break;
        // End:0x162
        case 5:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_snipr, L, t, R, B);
            // End:0x1A3
            break;
        // End:0x1A0
        case 6:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_snipr_non, L, t, R, B);
            // End:0x1A3
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function LC7_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, MaxUser;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    MaxUser = int(Data.floatValue);
    Data.strValue = (string(Data.IntValue) $ "/") $ string(MaxUser);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC9_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_ping_back, (L + float(8)) - float(2), (t + float(5)) - float(2), ((L + float(8)) - float(2)) + float(19), ((t + float(5)) - float(2)) + float(20));
    switch(Data.IntValue)
    {
        // End:0x120
        case 3:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_ping_1, L + float(8), t + float(5), R, B);
            // End:0x1FB
            break;
        // End:0x16A
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_ping_2, L + float(8), t + float(5), R, B);
            // End:0x1FB
            break;
        // End:0x1B3
        case 1:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_ping_3, L + float(8), t + float(5), R, B);
            // End:0x1FB
            break;
        // End:0xFFFF
        default:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_ping_4, L + float(8), t + float(5), R, B);
            // End:0x1FB
            break;
            break;
    }
    // End:0x272
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, string(Data.tempValue), 2, 9.0000000, L + float(8), t + float(5), R, B);
    }
    //return;    
}

function AddRoomInteligence(int SP, int no, int PASS, string room_name, string map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, string masterIP, int game_minute, int teambalance, string room_owner, int BotDifficult, int BotUserTeam, optional int cw_no)
{
    local int ExistRoomIndex;

    ExistRoomIndex = FindRoomNo(no, cw_no);
    // End:0x92
    if(ExistRoomIndex != -1)
    {
        ReplaceRoom(ExistRoomIndex, SP, no, PASS, room_name, map_name, map_num, game_mode, restrict, CurUser, MaxUser, game_state, Ping, masterIP, game_minute, teambalance, room_owner, BotDifficult, BotUserTeam, cw_no);        
    }
    else
    {
        AddRoom(SP, no, PASS, room_name, map_name, map_num, game_mode, restrict, CurUser, MaxUser, game_state, Ping, masterIP, game_minute, teambalance, room_owner, BotDifficult, BotUserTeam, cw_no);
    }
    //return;    
}

function AddRoom(int SP, int no, int PASS, string room_name, string map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, string masterIP, int game_minute, int teambalance, string room_owner, int BotDifficult, int BotUserTeam, optional int cw_no)
{
    local BTAutoColumnListDataHK row;
    local GameModeInfo gmi;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(12);
    i = 0;
    J0x27:

    // End:0x61 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    row.DataPerColumn[0].IntValue = SP;
    row.DataPerColumn[0].strValue = room_owner;
    row.DataPerColumn[1].IntValue = no;
    row.DataPerColumn[1].strValue = ("[" $ string(no)) $ "] ";
    row.DataPerColumn[2].IntValue = PASS;
    row.DataPerColumn[2].strValue = map_name;
    row.DataPerColumn[2].tempValue = map_num;
    row.DataPerColumn[3].strValue = room_name;
    row.DataPerColumn[4].strValue = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(map_name).FriendlyName;
    gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(game_mode);
    row.DataPerColumn[5].tempValue = game_mode;
    // End:0x213
    if(PlayerOwner().Level.GetMatchMaker().kClanMatch_InChannel)
    {
        row.DataPerColumn[5].strValue = strCW_GameMode[2];        
    }
    else
    {
        row.DataPerColumn[5].strValue = gmi.UserFriendlyName;
    }
    row.DataPerColumn[5].IntValue = game_minute;
    row.DataPerColumn[6].IntValue = restrict;
    // End:0x2AB
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(game_mode))
    {
        row.DataPerColumn[6].strValue = strBotDifficult[BotDifficult - 1];        
    }
    else
    {
        row.DataPerColumn[6].strValue = strWeaponRestrict[restrict];
    }
    row.DataPerColumn[7].IntValue = CurUser;
    row.DataPerColumn[7].floatValue = float(MaxUser);
    row.DataPerColumn[7].tempValue = MaxUser - CurUser;
    Log("row.DataPerColumn[8].intValue=" $ string(game_state));
    row.DataPerColumn[8].IntValue = game_state;
    row.DataPerColumn[9].IntValue = 0;
    row.DataPerColumn[9].tempValue = 0;
    row.DataPerColumn[10].IntValue = teambalance;
    row.DataPerColumn[10].tempValue = BotDifficult;
    row.DataPerColumn[10].strValue = masterIP;
    row.DataPerColumn[11].IntValue = cw_no;
    row.DataPerColumn[11].tempValue = BotUserTeam;
    i = 0;
    J0x434:

    // End:0x4C9 [Loop If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x48F
        if(CurUser == MaxUser)
        {
            row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Disable();
            // [Explicit Continue]
            goto J0x4BF;
        }
        row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Normal();
        J0x4BF:

        i++;
        // [Loop Continue]
        goto J0x434;
    }
    AddRow(row);
    //return;    
}

function int FindRoomNo(int no, optional int cw_no)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x86 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x51
        if(cw_no != 0)
        {
            // End:0x4E
            if(ACLRowList[i].DataPerColumn[11].IntValue == cw_no)
            {
                return i;
            }
            // [Explicit Continue]
            goto J0x7C;
        }
        // End:0x7C
        if(ACLRowList[i].DataPerColumn[1].IntValue == no)
        {
            return i;
        }
        J0x7C:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function ReplaceRoom(int Index, int SP, int no, int PASS, string room_name, string map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, string masterIP, int game_minute, int teambalance, string room_owner, int BotDifficult, int BotUserTeam, optional int cw_no)
{
    local BTAutoColumnListDataHK row;
    local GameModeInfo gmi;
    local int i;

    row = ACLRowList[Index];
    i = 0;
    J0x18:

    // End:0x52 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    row.DataPerColumn[0].IntValue = SP;
    row.DataPerColumn[0].strValue = room_owner;
    row.DataPerColumn[1].IntValue = no;
    row.DataPerColumn[1].strValue = ("[" $ string(no)) $ "] ";
    row.DataPerColumn[2].IntValue = PASS;
    row.DataPerColumn[2].strValue = map_name;
    row.DataPerColumn[2].tempValue = map_num;
    row.DataPerColumn[3].strValue = room_name;
    row.DataPerColumn[4].strValue = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(map_name).FriendlyName;
    gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(game_mode);
    row.DataPerColumn[5].tempValue = game_mode;
    row.DataPerColumn[5].strValue = gmi.UserFriendlyName;
    row.DataPerColumn[5].IntValue = game_minute;
    row.DataPerColumn[6].IntValue = restrict;
    row.DataPerColumn[7].IntValue = CurUser;
    row.DataPerColumn[7].floatValue = float(MaxUser);
    row.DataPerColumn[7].tempValue = MaxUser - CurUser;
    Log("row.DataPerColumn[8].intValue=" $ string(game_state));
    row.DataPerColumn[8].IntValue = game_state;
    row.DataPerColumn[9].IntValue = 0;
    row.DataPerColumn[9].tempValue = 0;
    row.DataPerColumn[10].IntValue = teambalance;
    row.DataPerColumn[10].tempValue = BotDifficult;
    row.DataPerColumn[10].strValue = masterIP;
    row.DataPerColumn[11].IntValue = cw_no;
    row.DataPerColumn[11].tempValue = BotUserTeam;
    i = 0;
    J0x37F:

    // End:0x414 [Loop If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x3DA
        if(CurUser == MaxUser)
        {
            row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Disable();
            // [Explicit Continue]
            goto J0x40A;
        }
        row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Normal();
        J0x40A:

        i++;
        // [Loop Continue]
        goto J0x37F;
    }
    //return;    
}

function AddRoomInteligenceCW(int WaitRoomIdx, string LeaderName, string RoomName, string MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status)
{
    local int ExistRoomIndex;

    ExistRoomIndex = FindRoomNo(500 + WaitRoomIdx, WaitRoomIdx);
    // End:0x62
    if(ExistRoomIndex != -1)
    {
        ReplaceRoomCW(ExistRoomIndex, WaitRoomIdx, LeaderName, RoomName, MapName, MapNum, CurUserCount, MaxUserCount, Status);        
    }
    else
    {
        AddRoomCW(WaitRoomIdx, LeaderName, RoomName, MapName, MapNum, CurUserCount, MaxUserCount, Status);
    }
    //return;    
}

function bool RemoveByGameNumberCW(int cw_no)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x52 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x48
        if(ACLRowList[i].DataPerColumn[11].IntValue == cw_no)
        {
            RemoveRow(i);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function AddRoomCW(int WaitRoomIdx, string LeaderName, string RoomName, string MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(12);
    i = 0;
    J0x27:

    // End:0x61 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    row.DataPerColumn[0].strValue = LeaderName;
    row.DataPerColumn[1].IntValue = 500 + WaitRoomIdx;
    row.DataPerColumn[1].strValue = ("[" $ string(500 + WaitRoomIdx)) $ "] ";
    row.DataPerColumn[2].strValue = MapName;
    row.DataPerColumn[2].tempValue = MapNum;
    row.DataPerColumn[3].strValue = RoomName;
    row.DataPerColumn[4].strValue = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(MapName).FriendlyName;
    row.DataPerColumn[5].strValue = strCW_GameMode[1];
    row.DataPerColumn[7].IntValue = CurUserCount;
    row.DataPerColumn[7].floatValue = float(MaxUserCount);
    row.DataPerColumn[7].tempValue = MaxUserCount - CurUserCount;
    Log("row.DataPerColumn[8].intValue=" $ string(Status));
    row.DataPerColumn[8].IntValue = Status;
    row.DataPerColumn[11].IntValue = WaitRoomIdx;
    i = 0;
    J0x254:

    // End:0x2E9 [Loop If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x2AF
        if(CurUserCount == MaxUserCount)
        {
            row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Disable();
            // [Explicit Continue]
            goto J0x2DF;
        }
        row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Normal();
        J0x2DF:

        i++;
        // [Loop Continue]
        goto J0x254;
    }
    AddRow(row);
    //return;    
}

function ReplaceRoomCW(int Index, int WaitRoomIdx, string LeaderName, string RoomName, string MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = ACLRowList[Index];
    i = 0;
    J0x18:

    // End:0x52 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    row.DataPerColumn[0].strValue = LeaderName;
    row.DataPerColumn[1].IntValue = 500 + WaitRoomIdx;
    row.DataPerColumn[1].strValue = ("[" $ string(500 + WaitRoomIdx)) $ "] ";
    row.DataPerColumn[2].strValue = MapName;
    row.DataPerColumn[2].tempValue = MapNum;
    row.DataPerColumn[3].strValue = RoomName;
    row.DataPerColumn[4].strValue = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(MapName).FriendlyName;
    row.DataPerColumn[5].strValue = strCW_GameMode[1];
    row.DataPerColumn[7].IntValue = CurUserCount;
    row.DataPerColumn[7].floatValue = float(MaxUserCount);
    row.DataPerColumn[7].tempValue = MaxUserCount - CurUserCount;
    Log("row.DataPerColumn[8].intValue=" $ string(Status));
    row.DataPerColumn[8].IntValue = Status;
    row.DataPerColumn[11].IntValue = WaitRoomIdx;
    i = 0;
    J0x245:

    // End:0x2DA [Loop If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x2A0
        if(CurUserCount == MaxUserCount)
        {
            row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Disable();
            // [Explicit Continue]
            goto J0x2D0;
        }
        row.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Normal();
        J0x2D0:

        i++;
        // [Loop Continue]
        goto J0x245;
    }
    //return;    
}

function string GetRoomOwnerIP(int Index)
{
    return ACLRowList[Index].DataPerColumn[10].strValue;
    //return;    
}

function SetRoomPingStatus(string IP, int msec)
{
    local int i, msecIndex;

    msecIndex = PingToIndex(msec);
    i = 0;
    J0x18:

    // End:0x8B [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x81
        if((GetRoomOwnerIP(i)) == IP)
        {
            ACLRowList[i].DataPerColumn[9].IntValue = msecIndex;
            ACLRowList[i].DataPerColumn[9].tempValue = msec;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
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
        if(msec <= 100)
        {
            return 1;            
        }
        else
        {
            // End:0x34
            if(msec <= 200)
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

function RemoveRowArray(int StartIndex, int endLength)
{
    local int i;

    ACLRowList.Remove(StartIndex, endLength);
    i = 0;
    J0x17:

    // End:0x40 [Loop If]
    if(i < endLength)
    {
        MultiColumnList.RemovedItem(0);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    tT.SelectedIndex = -1;
    //return;    
}

function AddRow(BTAutoColumnListDataHK Item, optional bool bSet, optional int Index)
{
    // End:0x18
    if(bSet == false)
    {
        Index = ACLRowList.Length;
    }
    ACLRowList.Insert(Index, 1);
    ACLRowList[Index] = Item;
    MultiColumnList.AddedItem();
    MultiColumnList.MyScrollBar.AlignThumb();
    //return;    
}

function AddRowNoAlign(BTAutoColumnListDataHK Item, optional int Index)
{
    // End:0x2C
    if((Index == 0) || Index > ACLRowList.Length)
    {
        Index = ACLRowList.Length;        
    }
    else
    {
        // End:0x3E
        if(Index < 0)
        {
            Index = 0;
        }
    }
    ACLRowList.Insert(Index, 1);
    ACLRowList[Index] = Item;
    MultiColumnList.AddedItem();
    //return;    
}

function string GetMasterIP(int Index)
{
    return ACLRowList[Index].DataPerColumn[10].strValue;
    //return;    
}

function string SetPingStatus(int Index, int Status)
{
    ACLRowList[Index].DataPerColumn[9].IntValue = Status;
    return "";
    //return;    
}

function bool RemoveByGameNumber(int GameNumber)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x51 [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x47
        if(ACLRowList[i].DataPerColumn[1].IntValue == GameNumber)
        {
            RemoveRow(i);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
}

function RemoveRow(int Index)
{
    ACLRowList.Remove(Index, 1);
    MultiColumnList.RemovedItem(0);
    tT.SelectedIndex = -1;
    //return;    
}

function RemoveAll()
{
    MultiColumnList.Clear();
    ACLRowList.Length = 0;
    tT.SelectedIndex = -1;
    //return;    
}

function ChangeRoomName(int i, string room_name)
{
    ACLRowList[i].DataPerColumn[3].strValue = room_name;
    // End:0x4E
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
    //return;    
}

function ChangeRoomInfo(int i, string room_name, string map_name, int map_num, int game_mode, byte IsTeamBalance, int CurUser, int MaxUser, int game_state, byte IsPW, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    local int k;
    local GameModeInfo gmi;

    ACLRowList[i].DataPerColumn[3].strValue = room_name;
    ACLRowList[i].DataPerColumn[2].IntValue = int(IsPW);
    ACLRowList[i].DataPerColumn[2].strValue = map_name;
    ACLRowList[i].DataPerColumn[2].tempValue = map_num;
    ACLRowList[i].DataPerColumn[4].strValue = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(map_name).FriendlyName;
    gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(game_mode);
    ACLRowList[i].DataPerColumn[5].tempValue = game_mode;
    ACLRowList[i].DataPerColumn[5].strValue = gmi.UserFriendlyName;
    ACLRowList[i].DataPerColumn[7].IntValue = CurUser;
    ACLRowList[i].DataPerColumn[7].floatValue = float(MaxUser);
    ACLRowList[i].DataPerColumn[7].tempValue = MaxUser - CurUser;
    ACLRowList[i].DataPerColumn[8].IntValue = game_state;
    ACLRowList[i].DataPerColumn[10].IntValue = int(IsTeamBalance);
    ACLRowList[i].DataPerColumn[6].IntValue = int(WeaponLimit);
    ACLRowList[i].DataPerColumn[10].tempValue = int(BotDifficult);
    ACLRowList[i].DataPerColumn[11].tempValue = int(BotModeUserTeamNum);
    // End:0x2A9
    if(Class'Engine.wGameSettings'.static.IsBotModeIndex(game_mode))
    {
        ACLRowList[i].DataPerColumn[6].strValue = strBotDifficult[int(BotDifficult) - 1];        
    }
    else
    {
        ACLRowList[i].DataPerColumn[6].strValue = strWeaponRestrict[int(WeaponLimit)];
    }
    k = 0;
    J0x2DA:

    // End:0x381 [Loop If]
    if(k < ACLRowList[i].DataPerColumn.Length)
    {
        // End:0x341
        if(CurUser == MaxUser)
        {
            ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Disable();
            // [Explicit Continue]
            goto J0x377;
        }
        ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Normal();
        J0x377:

        k++;
        // [Loop Continue]
        goto J0x2DA;
    }
    // End:0x3AD
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
    //return;    
}

function ChangeRoomState(int i, int game_state)
{
    ACLRowList[i].DataPerColumn[8].IntValue = game_state;
    // End:0x4E
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
    //return;    
}

function ChangeRoomUserCount(int i, int CurUser)
{
    local int k;

    ACLRowList[i].DataPerColumn[7].IntValue = CurUser;
    ACLRowList[i].DataPerColumn[7].tempValue = int(ACLRowList[i].DataPerColumn[7].floatValue - float(CurUser));
    k = 0;
    J0x6D:

    // End:0x12D [Loop If]
    if(k < ACLRowList[i].DataPerColumn.Length)
    {
        // End:0xED
        if(CurUser == int(ACLRowList[i].DataPerColumn[7].floatValue))
        {
            ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Disable();
            // [Explicit Continue]
            goto J0x123;
        }
        ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.ListItem_Normal();
        J0x123:

        k++;
        // [Loop Continue]
        goto J0x6D;
    }
    // End:0x159
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
    //return;    
}

function ChangeRoomOwnerInfo(int idx, string OwnerName, string OwnerIP)
{
    ACLRowList[idx].DataPerColumn[0].strValue = OwnerName;
    ACLRowList[idx].DataPerColumn[10].strValue = OwnerIP;
    // End:0x6F
    if(tT.SelectedIndex == idx)
    {
        tT.ChangeSelectedIndex(-1);
    }
    //return;    
}

function bool ChangeRoomOwenrName(string old_name, string new_name)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x69 [Loop If]
    if(lp1 < ACLRowList.Length)
    {
        // End:0x5F
        if(ACLRowList[lp1].DataPerColumn[0].strValue == old_name)
        {
            ACLRowList[lp1].DataPerColumn[0].strValue = new_name;
            return true;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function string IntToGameState(int Index)
{
    return strGameState[Index];
    //return;    
}

function int IntToPingImgIndex(int Index)
{
    return Index;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_on;
    self.LastSelectedImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_n;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("sp", 34.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("no", 36.0000000, 3);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("pass", 36.0000000, 7);
    headerInfo.ColumnImageList.Length = 2;
    headerInfo.ColumnImageList[0] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.empty;
    headerInfo.ColumnImageList[1] = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_password;
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("room_name", 242.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("map_name", 91.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("game_mode", 91.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("restrict", 61.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("curuser/maxuser", 51.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC7_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("game_state", 51.0000000, 3);
    headerInfo.__IntToString__Delegate = IntToGameState;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ping", 35.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC9_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    tT = new Class'GUIWarfareControls_Decompressed.BTTTRoomInfoHK';
    tT.Init();
    strWeaponRestrict = Class'Engine.wGameSettings'.static.GetWeaponRestrictions();
    //return;    
}

function OnRendered(Canvas C)
{
    local int i;
    local float X, Y;
    local BTAutoColumnListDataHK selectedRow;
    local wMapInfo mInfo;
    local array<Material> supplyImg;
    local string WeaponRestrictorBotModeTeam;

    // End:0x43
    if((tT.bOverlapControl || bVisible == false) || selectIndex < 0)
    {
        tT.bVisible = false;
        return;        
    }
    else
    {
        tT.bVisible = true;
    }
    i = int(GetItemHeight(C));
    X = ActualLeft();
    Y = ActualTop() + float(((selectIndex - MultiColumnList.Top) + 1) * i);
    tT.AWinPos.X1 = X;
    tT.AWinPos.Y1 = Y;
    tT.AWinPos.X2 = X + float(535);
    tT.AWinPos.Y2 = Y + float(255);
    selectedRow = ACLRowList[selectIndex];
    // End:0x396
    if(tT.SelectedIndex != selectIndex)
    {
        mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(selectedRow.DataPerColumn[2].strValue);
        i = 0;
        J0x184:

        // End:0x1EC [Loop If]
        if(i < 3)
        {
            // End:0x1B2
            if(mInfo.ResourceSupplyImages[i] == "-")
            {
                // [Explicit Break]
                goto J0x1EC;
                // [Explicit Continue]
                goto J0x1E2;
            }
            supplyImg[i] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], Class'Engine.Material'));
            J0x1E2:

            i++;
            // [Loop Continue]
            goto J0x184;
        }
        J0x1EC:

        // End:0x245
        if(Class'Engine.wGameSettings'.static.IsBotModeIndex(selectedRow.DataPerColumn[5].tempValue) == false)
        {
            WeaponRestrictorBotModeTeam = Class'Engine.wGameSettings'.static.GetWeaponRestrictionByIndex(selectedRow.DataPerColumn[6].IntValue);            
        }
        else
        {
            WeaponRestrictorBotModeTeam = Class'Engine.wGameSettings'.static.GetBotModeTeamByIndex(selectedRow.DataPerColumn[11].tempValue);
        }
        tT.ChangeSelectedIndex(selectIndex);
        tT.SetData(selectedRow.DataPerColumn[1].strValue $ selectedRow.DataPerColumn[3].strValue, selectedRow.DataPerColumn[8].IntValue, selectedRow.DataPerColumn[4].strValue, Material(DynamicLoadObject(mInfo.ResourceMapImage, Class'Engine.Material')), supplyImg, selectedRow.DataPerColumn[0].strValue, selectedRow.DataPerColumn[5].strValue, WeaponRestrictorBotModeTeam, onoff[selectedRow.DataPerColumn[10].IntValue], selectedRow.DataPerColumn[7].strValue, Class'Engine.wGameSettings'.static.IsBotModeIndex(selectedRow.DataPerColumn[5].tempValue));
    }
    tT.Render(C);
    //return;    
}

defaultproperties
{
    strGameState[0]="???????"
    strGameState[1]="????????????"
    strCW_GameMode[0]="?????????????????"
    strCW_GameMode[1]="????????????"
    strCW_GameMode[2]="????????"
    onoff[0]="Off"
    onoff[1]="On"
    strBotDifficult[0]="??????,"
    OnRendered=BTACLLobbyHK.OnRendered
}