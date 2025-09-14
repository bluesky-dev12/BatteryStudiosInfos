/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLLobbyHKCN.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:40
 *
 *******************************************************************************/
class BTACLLobbyHKCN extends BTACLLobbyHK
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding editinlinenotify BTTTRoomInfoHKCN tT;
var localized string strGameState[2];
var localized string strCW_GameMode[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify string onoff[2];
var array<string> strWeaponRestrict;
var Image ImgWeaponRestrict[7];
var BTRODecorateStringHK SubModeToolTip;
var localized array<localized string> strBotDifficult;
var bool isChangeTTInfo;
var bool bShowSubModeToolTip;

function float GetItemHeight(Canvas C)
{
    return 28.0;
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
    // End:0x188
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x1d0
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    Data.Text[i].FontSize = 9;
    // End:0x22e
    if(Data.IntValue != 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_fixroom, L, t, R, B);
    }
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
    class'BTCustomDrawHK'.static.DrawImage(C, ACLHeaderList[Column].ColumnImageList[ImageIndex], L, t, R, B);
}

function LC3_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x30
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
    }
    // End:0xfe
    else
    {
        // End:0x9f
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
            i = 1;
            C.DrawColor.R = 102;
            C.DrawColor.G = 102;
            C.DrawColor.B = 102;
        }
        // End:0xfe
        else
        {
            // End:0xfe
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x182
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x1ca
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    Data.Text[i].FontSize = 9;
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function DrawMapName(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local string MapName;

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
    // End:0x188
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x1d0
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    Data.Text[i].FontSize = 9;
    Data.Text[i].FontDrawType = 4;
    MapName = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(Data.strValue).FriendlyName;
    // End:0x250
    if(MapName == "")
    {
        return;
    }
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, MapName, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function DrawGameMode(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0x188
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x1d0
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    Data.Text[i].FontDrawType = 4;
    Data.Text[i].FontSize = 9;
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function DrawSubMode(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0x188
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x1d0
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x2fe
    if(Data.IntValue != 0 && L < Controller.MouseX && Controller.MouseX < R && t < Controller.MouseY && Controller.MouseY < B)
    {
        SubModeToolTip.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(float(int(Controller.MouseX) + 10), float(int(Controller.MouseY) - 20), float(int(Controller.MouseX) + 10 + 50), float(int(Controller.MouseY)));
        SubModeToolTip.OriginalString.Text = strWeaponRestrict[Data.IntValue];
        SubModeToolTip.bNeedUpdate = true;
        bShowSubModeToolTip = true;
    }
    // End:0x306
    else
    {
        bShowSubModeToolTip = false;
    }
    Data.Text[i].FontSize = 9;
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function LC10_Draw_No(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0x14d
    else
    {
        // End:0xee
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
            i = 1;
            C.DrawColor.R = 102;
            C.DrawColor.G = 102;
            C.DrawColor.B = 102;
        }
        // End:0x14d
        else
        {
            // End:0x14d
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x1d1
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x219
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    Data.Text[i].FontSize = 9;
    Data.Text[i].FontDrawType = 4;
    class'BTCustomDrawHK'.static.DrawString(C, string(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
}

function LC11_Draw_GameState(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0x14d
    else
    {
        // End:0xee
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
            i = 1;
            C.DrawColor.R = 102;
            C.DrawColor.G = 102;
            C.DrawColor.B = 102;
        }
        // End:0x14d
        else
        {
            // End:0x14d
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x1a2
    if(Data.IntValue == 1)
    {
        C.DrawColor.R = 165;
        C.DrawColor.G = 219;
        C.DrawColor.B = 0;
    }
    // End:0x1ea
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x26b
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    Data.Text[i].FontSize = 9;
    Data.Text[i].FontDrawType = 4;
    class'BTCustomDrawHK'.static.DrawString(C, IntToGameState(Data.IntValue), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
    // End:0x331
    if(bShowSubModeToolTip)
    {
        SubModeToolTip.Render(C);
    }
}

function LC6_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0x14d
    else
    {
        // End:0xee
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
            i = 1;
            C.DrawColor.R = 102;
            C.DrawColor.G = 102;
            C.DrawColor.B = 102;
        }
        // End:0x14d
        else
        {
            // End:0x14d
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    // End:0x1d1
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x219
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    Data.Text[i].FontSize = 9;
    switch(Data.IntValue)
    {
        // End:0x244
        case 0:
            // End:0x37c
            break;
        // End:0x281
        case 1:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_knife, L, t, R, B);
            // End:0x37c
            break;
        // End:0x2bf
        case 2:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_pisgun, L, t, R, B);
            // End:0x37c
            break;
        // End:0x2fd
        case 4:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_roket, L, t, R, B);
            // End:0x37c
            break;
        // End:0x33b
        case 5:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_snipr, L, t, R, B);
            // End:0x37c
            break;
        // End:0x379
        case 6:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.icon_snipr_non, L, t, R, B);
            // End:0x37c
            break;
        // End:0xffff
        default:
}

function LC7_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, MaxUser;

    i = 0;
    // End:0x7f
    if(selectIndex == row && MultiColumnList.bMousePress == false)
    {
        i = 1;
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    // End:0x14d
    else
    {
        // End:0xee
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
            i = 1;
            C.DrawColor.R = 102;
            C.DrawColor.G = 102;
            C.DrawColor.B = 102;
        }
        // End:0x14d
        else
        {
            // End:0x14d
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    Data.Text[i].FontSize = 9;
    Data.Text[i].FontDrawType = 4;
    MaxUser = int(Data.floatValue);
    Data.strValue = string(Data.IntValue) $ "/" $ string(MaxUser);
    // End:0x238
    if(float(ACLRowList[row].DataPerColumn[6].IntValue) == ACLRowList[row].DataPerColumn[6].floatValue)
    {
        C.DrawColor.R = 102;
        C.DrawColor.G = 102;
        C.DrawColor.B = 102;
    }
    // End:0x280
    else
    {
        C.DrawColor.R = byte(255);
        C.DrawColor.G = byte(255);
        C.DrawColor.B = byte(255);
    }
    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
}

function LC9_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0x14d
    else
    {
        // End:0xee
        if(MultiColumnList.bMousePress && selectIndex == row)
        {
            i = 1;
            C.DrawColor.R = 102;
            C.DrawColor.G = 102;
            C.DrawColor.B = 102;
        }
        // End:0x14d
        else
        {
            // End:0x14d
            if(LastSelectedIndex == row)
            {
                i = 2;
                C.DrawColor.R = byte(255);
                C.DrawColor.G = byte(255);
                C.DrawColor.B = byte(255);
            }
        }
    }
    Data.Text[i].FontSize = 9;
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.sgau_ping_back, L + float(8) - float(2), t + float(5) - float(2), L + float(8) - float(2) + float(19), t + float(5) - float(2) + float(20));
    switch(Data.IntValue)
    {
        // End:0x22d
        case 3:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.sgau_ping_1, L + float(8), t + float(5), R, B);
            // End:0x308
            break;
        // End:0x277
        case 2:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.sgau_ping_2, L + float(8), t + float(5), R, B);
            // End:0x308
            break;
        // End:0x2c0
        case 1:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.sgau_ping_3, L + float(8), t + float(5), R, B);
            // End:0x308
            break;
        // End:0xffff
        default:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.sgau_ping_4, L + float(8), t + float(5), R, B);
            // End:0x308 Break;
            break;
    }
    // End:0x37f
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        class'BTCustomDrawHK'.static.DrawString(C, string(Data.tempValue), 2, 9.0, L + float(8), t + float(5), R, B);
    }
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
    // End:0xf7
    else
    {
        AddRoom(SP, no, PASS, room_name, map_name, map_num, game_mode, restrict, CurUser, MaxUser, game_state, Ping, masterIP, game_minute, teambalance, room_owner, BotDifficult, BotUserTeam, cw_no);
    }
}

function AddRoom(int SP, int no, int PASS, string room_name, string map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, string masterIP, int game_minute, int teambalance, string room_owner, int BotDifficult, int BotUserTeam, optional int cw_no)
{
    local BTAutoColumnListDataHK row;
    local GameModeInfo gmi;
    local int i;

    row = new class'BTAutoColumnListDataHK';
    row.Init(12);
    i = 0;
    J0x27:
    // End:0xa9 [While If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        row.DataPerColumn[5].Text[i].FontDrawType = 4;
        row.DataPerColumn[7].Text[i].FontDrawType = 4;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    row.DataPerColumn[0].IntValue = no;
    row.DataPerColumn[0].strValue = room_owner;
    row.DataPerColumn[1].IntValue = PASS;
    row.DataPerColumn[1].strValue = "[" $ string(PASS) $ "] ";
    row.DataPerColumn[2].IntValue = PASS;
    row.DataPerColumn[2].strValue = room_name;
    row.DataPerColumn[3].strValue = map_name;
    row.DataPerColumn[3].tempValue = map_num;
    gmi = class'wGameSettings'.static.GetGameModeByIndex(game_mode);
    row.DataPerColumn[4].tempValue = game_mode;
    // End:0x20d
    if(PlayerOwner().Level.GetMatchMaker().kClanMatch_InChannel)
    {
        row.DataPerColumn[4].strValue = strCW_GameMode[2];
    }
    // End:0x22e
    else
    {
        row.DataPerColumn[4].strValue = gmi.UserFriendlyName;
    }
    row.DataPerColumn[4].IntValue = game_minute;
    row.DataPerColumn[5].IntValue = restrict;
    // End:0x2a2
    if(false == class'wGameSettings'.static.IsBotModeIndex(game_mode))
    {
        row.DataPerColumn[5].Image = ImgWeaponRestrict[restrict];
    }
    row.DataPerColumn[6].IntValue = CurUser;
    row.DataPerColumn[6].floatValue = float(MaxUser);
    row.DataPerColumn[6].tempValue = MaxUser - CurUser;
    row.DataPerColumn[7].IntValue = game_state;
    row.DataPerColumn[7].tempValue = 0;
    row.DataPerColumn[10].IntValue = teambalance;
    row.DataPerColumn[10].tempValue = BotDifficult;
    row.DataPerColumn[10].strValue = masterIP;
    row.DataPerColumn[11].IntValue = cw_no;
    row.DataPerColumn[11].tempValue = BotUserTeam;
    i = 0;
    J0x3c6:
    // End:0x45b [While If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x421
        if(CurUser == MaxUser)
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Disable();
        }
        // End:0x451
        else
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Normal();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3c6;
    }
    AddRow(row);
}

function int FindRoomNo(int no, optional int cw_no)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x86 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x51
        if(cw_no != 0)
        {
            // End:0x4e
            if(ACLRowList[i].DataPerColumn[11].IntValue == cw_no)
            {
                return i;
            }
        }
        // End:0x7c
        else
        {
            // End:0x7c
            if(ACLRowList[i].DataPerColumn[1].IntValue == no)
            {
                return i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function ReplaceRoom(int Index, int SP, int no, int PASS, string room_name, string map_name, int map_num, int game_mode, int restrict, int CurUser, int MaxUser, int game_state, int Ping, string masterIP, int game_minute, int teambalance, string room_owner, int BotDifficult, int BotUserTeam, optional int cw_no)
{
    local BTAutoColumnListDataHK row;
    local GameModeInfo gmi;
    local int i;

    row = ACLRowList[Index];
    i = 0;
    J0x18:
    // End:0x9a [While If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        row.DataPerColumn[5].Text[i].FontDrawType = 4;
        row.DataPerColumn[7].Text[i].FontDrawType = 4;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    row.DataPerColumn[0].IntValue = no;
    row.DataPerColumn[0].strValue = room_owner;
    row.DataPerColumn[1].IntValue = PASS;
    row.DataPerColumn[1].strValue = "[" $ string(PASS) $ "] ";
    row.DataPerColumn[2].IntValue = PASS;
    row.DataPerColumn[2].strValue = room_name;
    row.DataPerColumn[3].strValue = map_name;
    row.DataPerColumn[3].tempValue = map_num;
    gmi = class'wGameSettings'.static.GetGameModeByIndex(game_mode);
    row.DataPerColumn[4].tempValue = game_mode;
    // End:0x1fe
    if(PlayerOwner().Level.GetMatchMaker().kClanMatch_InChannel)
    {
        row.DataPerColumn[4].strValue = strCW_GameMode[2];
    }
    // End:0x21f
    else
    {
        row.DataPerColumn[4].strValue = gmi.UserFriendlyName;
    }
    row.DataPerColumn[4].IntValue = game_minute;
    row.DataPerColumn[5].IntValue = restrict;
    row.DataPerColumn[5].Image = ImgWeaponRestrict[restrict];
    row.DataPerColumn[6].IntValue = CurUser;
    row.DataPerColumn[6].floatValue = float(MaxUser);
    row.DataPerColumn[6].tempValue = MaxUser - CurUser;
    row.DataPerColumn[7].IntValue = game_state;
    row.DataPerColumn[7].tempValue = 0;
    row.DataPerColumn[10].IntValue = teambalance;
    row.DataPerColumn[10].tempValue = BotDifficult;
    row.DataPerColumn[10].strValue = masterIP;
    row.DataPerColumn[11].IntValue = cw_no;
    row.DataPerColumn[11].tempValue = BotUserTeam;
    i = 0;
    J0x39d:
    // End:0x432 [While If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x3f8
        if(CurUser == MaxUser)
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Disable();
        }
        // End:0x428
        else
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Normal();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x39d;
    }
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
    // End:0x90
    else
    {
        AddRoomCW(WaitRoomIdx, LeaderName, RoomName, MapName, MapNum, CurUserCount, MaxUserCount, Status);
    }
}

function bool RemoveByGameNumberCW(int cw_no)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x52 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x48
        if(ACLRowList[i].DataPerColumn[11].IntValue == cw_no)
        {
            RemoveRow(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function AddRoomCW(int WaitRoomIdx, string LeaderName, string RoomName, string MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = new class'BTAutoColumnListDataHK';
    row.Init(12);
    i = 0;
    J0x27:
    // End:0x61 [While If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    row.DataPerColumn[0].strValue = LeaderName;
    row.DataPerColumn[1].IntValue = 500 + WaitRoomIdx;
    row.DataPerColumn[1].strValue = "[" $ string(500 + WaitRoomIdx) $ "] ";
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
    // End:0x2e9 [While If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x2af
        if(CurUserCount == MaxUserCount)
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Disable();
        }
        // End:0x2df
        else
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Normal();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x254;
    }
    AddRow(row);
}

function ReplaceRoomCW(int Index, int WaitRoomIdx, string LeaderName, string RoomName, string MapName, int MapNum, int CurUserCount, int MaxUserCount, int Status)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = ACLRowList[Index];
    i = 0;
    J0x18:
    // End:0x52 [While If]
    if(i < 3)
    {
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    row.DataPerColumn[0].strValue = LeaderName;
    row.DataPerColumn[1].IntValue = 500 + WaitRoomIdx;
    row.DataPerColumn[1].strValue = "[" $ string(500 + WaitRoomIdx) $ "] ";
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
    // End:0x2da [While If]
    if(i < row.DataPerColumn.Length)
    {
        // End:0x2a0
        if(CurUserCount == MaxUserCount)
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Disable();
        }
        // End:0x2d0
        else
        {
            row.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Normal();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x245;
    }
}

function string GetRoomOwnerIP(int Index)
{
    return ACLRowList[Index].DataPerColumn[10].strValue;
}

function SetRoomPingStatus(string IP, int msec)
{
    local int i, msecIndex;

    msecIndex = PingToIndex(msec);
    i = 0;
    J0x18:
    // End:0x8b [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x81
        if(GetRoomOwnerIP(i) == IP)
        {
            ACLRowList[i].DataPerColumn[9].IntValue = msecIndex;
            ACLRowList[i].DataPerColumn[9].tempValue = msec;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
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
        if(msec <= 100)
        {
            return 1;
        }
        // End:0x37
        else
        {
            // End:0x34
            if(msec <= 200)
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

function RemoveRowArray(int StartIndex, int endLength)
{
    local int i;

    ACLRowList.Remove(StartIndex, endLength);
    i = 0;
    J0x17:
    // End:0x40 [While If]
    if(i < endLength)
    {
        MultiColumnList.RemovedItem(0);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    tT.SelectedIndex = -1;
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
}

function AddRowNoAlign(BTAutoColumnListDataHK Item, optional int Index)
{
    // End:0x2c
    if(Index == 0 || Index > ACLRowList.Length)
    {
        Index = ACLRowList.Length;
    }
    // End:0x3e
    else
    {
        // End:0x3e
        if(Index < 0)
        {
            Index = 0;
        }
    }
    ACLRowList.Insert(Index, 1);
    ACLRowList[Index] = Item;
    MultiColumnList.AddedItem();
}

function string GetMasterIP(int Index)
{
    return ACLRowList[Index].DataPerColumn[10].strValue;
}

function string SetPingStatus(int Index, int Status)
{
    ACLRowList[Index].DataPerColumn[9].IntValue = Status;
    return "";
}

function bool RemoveByGameNumber(int GameNumber)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x51 [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x47
        if(ACLRowList[i].DataPerColumn[0].IntValue == GameNumber)
        {
            RemoveRow(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function RemoveRow(int Index)
{
    ACLRowList.Remove(Index, 1);
    MultiColumnList.RemovedItem(0);
    tT.SelectedIndex = -1;
}

function RemoveAll()
{
    MultiColumnList.Clear();
    ACLRowList.Length = 0;
    tT.SelectedIndex = -1;
}

function ChangeRoomName(int i, string room_name)
{
    ACLRowList[i].DataPerColumn[3].strValue = room_name;
    // End:0x4e
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
}

function ChangeRoomInfo(int i, string room_name, string map_name, int map_num, int game_mode, byte IsTeamBalance, int CurUser, int MaxUser, int game_state, byte IsPW, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    local int k;
    local GameModeInfo gmi;

    ACLRowList[i].DataPerColumn[1].IntValue = IsPW;
    ACLRowList[i].DataPerColumn[2].IntValue = IsPW;
    ACLRowList[i].DataPerColumn[2].strValue = room_name;
    ACLRowList[i].DataPerColumn[3].strValue = map_name;
    ACLRowList[i].DataPerColumn[3].tempValue = map_num;
    gmi = class'wGameSettings'.static.GetGameModeByIndex(game_mode);
    ACLRowList[i].DataPerColumn[4].tempValue = game_mode;
    ACLRowList[i].DataPerColumn[4].strValue = gmi.UserFriendlyName;
    ACLRowList[i].DataPerColumn[5].IntValue = WeaponLimit;
    ACLRowList[i].DataPerColumn[5].Image = ImgWeaponRestrict[WeaponLimit];
    ACLRowList[i].DataPerColumn[6].IntValue = CurUser;
    ACLRowList[i].DataPerColumn[6].floatValue = float(MaxUser);
    ACLRowList[i].DataPerColumn[6].tempValue = MaxUser - CurUser;
    ACLRowList[i].DataPerColumn[7].IntValue = game_state;
    ACLRowList[i].DataPerColumn[10].IntValue = IsTeamBalance;
    ACLRowList[i].DataPerColumn[10].tempValue = BotDifficult;
    ACLRowList[i].DataPerColumn[11].tempValue = BotModeUserTeamNum;
    k = 0;
    J0x262:
    // End:0x309 [While If]
    if(k < ACLRowList[i].DataPerColumn.Length)
    {
        // End:0x2c9
        if(CurUser == MaxUser)
        {
            ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Disable();
        }
        // End:0x2ff
        else
        {
            ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Normal();
        }
        ++ k;
        // This is an implied JumpToken; Continue!
        goto J0x262;
    }
    // End:0x335
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
    isChangeTTInfo = true;
}

function ChangeRoomState(int i, int game_state)
{
    ACLRowList[i].DataPerColumn[7].IntValue = game_state;
    // End:0x4e
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
}

function ChangeRoomUserCount(int i, int CurUser)
{
    local int k;

    ACLRowList[i].DataPerColumn[6].IntValue = CurUser;
    ACLRowList[i].DataPerColumn[6].tempValue = int(ACLRowList[i].DataPerColumn[7].floatValue - float(CurUser));
    k = 0;
    J0x6d:
    // End:0x12d [While If]
    if(k < ACLRowList[i].DataPerColumn.Length)
    {
        // End:0xed
        if(CurUser == int(ACLRowList[i].DataPerColumn[6].floatValue))
        {
            ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Disable();
        }
        // End:0x123
        else
        {
            ACLRowList[i].DataPerColumn[k].Text[0].DrawColor = class'BTUIColorPoolHK'.static.ListItem_Normal();
        }
        ++ k;
        // This is an implied JumpToken; Continue!
        goto J0x6d;
    }
    // End:0x159
    if(tT.SelectedIndex == i)
    {
        tT.ChangeSelectedIndex(-1);
    }
}

function ChangeRoomOwnerInfo(int idx, string OwnerName, string OwnerIP)
{
    ACLRowList[idx].DataPerColumn[0].strValue = OwnerName;
    ACLRowList[idx].DataPerColumn[10].strValue = OwnerIP;
    // End:0x6f
    if(tT.SelectedIndex == idx)
    {
        tT.ChangeSelectedIndex(-1);
    }
}

function string IntToGameState(int Index)
{
    return strGameState[Index];
}

function int IntToPingImgIndex(int Index)
{
    return Index;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local int i;

    super(BTAutoColumnListHK).InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = class'BTUIResourcePoolHK'.default.newlist_Lobby_on;
    self.LastSelectedImage = class'BTUIResourcePoolHK'.default.newlist_Lobby_Focus;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.newlist_Lobby_n;
    MultiColumnList.MyScrollBar.AWinPos.X1 = 735.0;
    MultiColumnList.MyScrollBar.AWinPos.Y1 = 114.0;
    MultiColumnList.MyScrollBar.AWinPos.X2 = 746.0;
    MultiColumnList.MyScrollBar.AWinPos.Y2 = 450.0;
    MultiColumnList.MyScrollBar.ApplyAWinPos();
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("no", 0.060, 7);
    headerInfo.__CustomDraw__Delegate = LC10_Draw_No;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("pass", 0.040, 7);
    headerInfo.ColumnImageList.Length = 2;
    headerInfo.ColumnImageList[0] = class'BTUIResourcePoolHK'.default.empty;
    headerInfo.ColumnImageList[1] = class'BTUIResourcePoolHK'.default.icon_password;
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("room_name", 0.390, 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("map_name", 0.16520, 7);
    headerInfo.__CustomDraw__Delegate = DrawMapName;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("game_mode", 0.16520, 7);
    headerInfo.__CustomDraw__Delegate = DrawGameMode;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("restrict", 0.0390, 7);
    headerInfo.__CustomDraw__Delegate = DrawSubMode;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("curuser/maxuser", 0.070, 7);
    headerInfo.__CustomDraw__Delegate = LC7_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("game_state", 0.0680, 7);
    headerInfo.__CustomDraw__Delegate = LC11_Draw_GameState;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    tT = new class'BTTTRoomInfoHKCN';
    tT.Init();
    strWeaponRestrict = class'wGameSettings'.static.GetWeaponRestrictions();
    i = 0;
    J0x3fe:
    // End:0x434 [While If]
    if(i < 7)
    {
        ImgWeaponRestrict[i] = class'BTUIResourcePoolHK'.default.Icon_ServeMode[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3fe;
    }
    SubModeToolTip = new class'BTRODecorateStringHK';
    SubModeToolTip.Init();
    SubModeToolTip.OriginalString.FontDrawType = 3;
    SubModeToolTip.InternalPadding[0] = 8;
    SubModeToolTip.InternalPadding[1] = 8;
    SubModeToolTip.InternalPadding[2] = 8;
    SubModeToolTip.InternalPadding[3] = 8;
    SubModeToolTip.bAutoWidth = true;
}

function OnRendered(Canvas C)
{
    local int i, CurUser, MaxUser;
    local float X, Y;
    local BTAutoColumnListDataHK selectedRow;
    local wMapInfo mInfo;
    local array<Material> supplyImg;
    local string WeaponRestrictorBotModeTeam, strUser;

    i = int(GetItemHeight(C));
    X = ActualLeft();
    Y = ActualTop() + float(selectIndex - MultiColumnList.Top + 1 * i);
    tT.AWinPos.X1 = X;
    tT.AWinPos.Y1 = Y;
    tT.AWinPos.X2 = X + float(535);
    tT.AWinPos.Y2 = Y + float(255);
    // End:0xe3
    if(selectIndex < 0 && LastSelectedIndex < 0 || ACLRowList.Length <= 0)
    {
        return;
    }
    // End:0x102
    if(selectIndex >= 0)
    {
        selectedRow = ACLRowList[selectIndex];
    }
    // End:0x123
    else
    {
        // End:0x121
        if(LastSelectedIndex >= 0)
        {
            selectedRow = ACLRowList[LastSelectedIndex];
        }
        // End:0x123
        else
        {
            return;
        }
    }
    // End:0x43c
    if(tT.SelectedIndex != selectIndex)
    {
        mInfo = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(selectedRow.DataPerColumn[3].strValue);
        i = 0;
        J0x187:
        // End:0x1ef [While If]
        if(i < 3)
        {
            // End:0x1b5
            if(mInfo.ResourceSupplyImages[i] == "-")
            {
                // This is an implied JumpToken;
                goto J0x1ef;
            }
            // End:0x1e5
            else
            {
                supplyImg[i] = Material(DynamicLoadObject(mInfo.ResourceSupplyImages[i], class'Material'));
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x187;
        }
        J0x1ef:
        // End:0x248
        if(class'wGameSettings'.static.IsBotModeIndex(selectedRow.DataPerColumn[5].tempValue) == false)
        {
            WeaponRestrictorBotModeTeam = class'wGameSettings'.static.GetWeaponRestrictionByIndex(selectedRow.DataPerColumn[5].IntValue);
        }
        // End:0x273
        else
        {
            WeaponRestrictorBotModeTeam = class'wGameSettings'.static.GetBotModeTeamByIndex(selectedRow.DataPerColumn[11].tempValue);
        }
        tT.ChangeSelectedIndex(selectIndex);
        CurUser = selectedRow.DataPerColumn[6].IntValue;
        MaxUser = int(selectedRow.DataPerColumn[6].floatValue);
        strUser = string(CurUser) $ "/" $ string(MaxUser);
        tT.SetData("[" $ string(selectedRow.DataPerColumn[0].IntValue) $ "]" $ selectedRow.DataPerColumn[2].strValue, selectedRow.DataPerColumn[7].IntValue, PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfo(selectedRow.DataPerColumn[3].strValue).FriendlyName, Material(DynamicLoadObject(mInfo.ResourceMapImage, class'Material')), supplyImg, selectedRow.DataPerColumn[0].strValue, selectedRow.DataPerColumn[4].strValue, WeaponRestrictorBotModeTeam, onoff[selectedRow.DataPerColumn[10].IntValue], selectedRow.DataPerColumn[7].strValue, class'wGameSettings'.static.IsBotModeIndex(selectedRow.DataPerColumn[5].tempValue), strUser);
        isChangeTTInfo = true;
    }
    // End:0x444
    else
    {
        isChangeTTInfo = false;
    }
    tT.RenderFixed(C);
}

defaultproperties
{
    strGameState[0]="Waiting"
    strGameState[1]="In Game"
    strCW_GameMode[0]="Friendly Clan Battle"
    strCW_GameMode[1]="Regular Clan Battle"
    strCW_GameMode[2]="Clan Battle"
    onoff[0]="Off"
    onoff[1]="On"
    strBotDifficult=// Object reference not set to an instance of an object.
    
    OnRendered=OnRendered
}