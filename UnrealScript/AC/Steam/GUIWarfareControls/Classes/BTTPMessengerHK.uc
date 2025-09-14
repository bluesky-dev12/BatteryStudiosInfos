/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTTPMessengerHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:27
 *	Functions:48
 *
 *******************************************************************************/
class BTTPMessengerHK extends GUITabPanel
    editinlinenew
    instanced;

enum E_TAB_MENU_TYPE
{
    TAB_MENU_CONNECTED,
    TAB_MENU_FRIEND,
    TAB_MENU_CLAN,
    TAB_MENU_PCBANG,
    TAB_MENU_MAX_COUNT
};

var export editinline BTOwnerDrawCaptionButtonHK ButtonMainPCBang;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTStretchedImageHK ListBoundImage[3];
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonMsg;
var array<export editinline BTAutoColumnListHK> ACLMsg;
var array<export editinline BTContextMenuHK> CMMsg;
var wMatchMaker MM;
var localized string strConnected;
var localized string strFriend;
var localized string strClan;
var localized string strDeny;
var localized string strPCBang;
var localized string strOffLine;
var localized string strLogout;
var localized string strMainPCBang[4];
var delegate<OnPopupChannel> __OnPopupChannel__Delegate;
var delegate<OnPopupFriend> __OnPopupFriend__Delegate;
var delegate<OnPopupClan> __OnPopupClan__Delegate;
var delegate<OnPopupPCBang> __OnPopupPCBang__Delegate;
var delegate<OnPopupChannelCheck> __OnPopupChannelCheck__Delegate;
var delegate<OnPopupFriendCheck> __OnPopupFriendCheck__Delegate;
var delegate<OnPopupClanCheck> __OnPopupClanCheck__Delegate;
var delegate<OnPopupPCBangCheck> __OnPopupPCBangCheck__Delegate;
var delegate<ChannelUserList_OnHitBottom> __ChannelUserList_OnHitBottom__Delegate;
var delegate<ChannelUserList_OnHitTop> __ChannelUserList_OnHitTop__Delegate;
var delegate<ChannelUserList_OnAdjustWindow> __ChannelUserList_OnAdjustWindow__Delegate;

function int FindChannelUser(int UID)
{
    local int i, Index;

    Index = 0;
    i = 0;
    J0x11:
    // End:0x75 [While If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x6b
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
    return -1;
}

function AddChannelUser(int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = new class'BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = class'BTUIResourcePoolHK'.default.list_commu_n;
    row.DataPerColumn[0].IntValue = ClanPattern;
    row.DataPerColumn[0].strValue = ClanName;
    row.DataPerColumn[1].IntValue = Level;
    row.DataPerColumn[2].strValue = UserName;
    row.DataPerColumn[2].IntValue = UID;
    row.DataPerColumn[3].IntValue = ClanBG;
    row.DataPerColumn[4].IntValue = ClanBL;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[4].tempValue = IsLookForClan;
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x262
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;
    }
    // End:0x331
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x331
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0;
            row.DataPerColumn[2].Text[0].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x338:
    // End:0x371 [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x338;
    }
    ACLMsg[0].AddRow(row);
}

function ReplaceUserNickName(byte CommunityType, string OldUserName, string NewUserName)
{
    local export editinline BTAutoColumnListHK acl;
    local BTAutoColumnListDataHK row;
    local int lp1, iUserNameIdx;

    switch(CommunityType)
    {
        // End:0x26
        case 1:
            acl = ACLMsg[3];
            iUserNameIdx = 1;
            // End:0x84
            break;
        // End:0x45
        case 2:
            acl = ACLMsg[2];
            iUserNameIdx = 1;
            // End:0x84
            break;
        // End:0x64
        case 3:
            acl = ACLMsg[1];
            iUserNameIdx = 1;
            // End:0x84
            break;
        // End:0x81
        case 4:
            acl = ACLMsg[0];
            iUserNameIdx = 2;
        // End:0xffff
        default:
            lp1 = 0;
            J0x8b:
            // End:0x10d [While If]
            if(lp1 < acl.ACLRowList.Length)
            {
                row = acl.ACLRowList[lp1];
                // End:0x103
                if(row.DataPerColumn[iUserNameIdx].strValue == OldUserName)
                {
                    row.DataPerColumn[iUserNameIdx].strValue = NewUserName;
                }
                // End:0x10d
                else
                {
                    ++ lp1;
                    // This is an implied JumpToken; Continue!
                    goto J0x8b;
                }
            }
}

function ReplaceMyClanName(byte CommunityType, string UserName, string NewClanname)
{
    local export editinline BTAutoColumnListHK acl;
    local BTAutoColumnListDataHK row;
    local int lp1, iUserNameIdx;

    acl = GetMessengerType(CommunityType);
    switch(CommunityType)
    {
        // End:0x33
        case 0:
            iUserNameIdx[0] = 0;
            iUserNameIdx[1] = 2;
            // End:0x83
            break;
        // End:0x4e
        case 1:
            iUserNameIdx[0] = 4;
            iUserNameIdx[1] = 1;
            // End:0x83
            break;
        // End:0x68
        case 2:
            iUserNameIdx[0] = 1;
            iUserNameIdx[1] = 1;
            // End:0x83
            break;
        // End:0x80
        case 3:
            iUserNameIdx[0] = 4;
            iUserNameIdx[1] = 1;
        // End:0xffff
        default:
            lp1 = 0;
            J0x8a:
            // End:0x10d [While If]
            if(lp1 < acl.ACLRowList.Length)
            {
                row = acl.ACLRowList[lp1];
                // End:0x103
                if(row.DataPerColumn[iUserNameIdx[1]].strValue == UserName)
                {
                    row.DataPerColumn[iUserNameIdx[0]].strValue = NewClanname;
                }
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x8a;
            }
}

function ReplaceClanLevel(byte CommunityType, string ClanName, int ClanLevel)
{
    local int i;
    local export editinline BTAutoColumnListHK acl;
    local int iClanNameIdx[4], iClanLevelIdx;
    local BTAutoColumnListDataHK row;

    acl = GetMessengerType(CommunityType);
    iClanNameIdx[0] = 0;
    iClanNameIdx[1] = 4;
    iClanNameIdx[2] = 1;
    iClanNameIdx[3] = 4;
    iClanLevelIdx[0] = 5;
    iClanLevelIdx[1] = 7;
    iClanLevelIdx[2] = 5;
    iClanLevelIdx[3] = 7;
    i = 0;
    J0x6a:
    // End:0xf9 [While If]
    if(i < acl.ACLRowList.Length)
    {
        row = acl.ACLRowList[i];
        // End:0xef
        if(row.DataPerColumn[iClanNameIdx[CommunityType]].strValue == ClanName)
        {
            row.DataPerColumn[iClanLevelIdx[CommunityType]].tempValue = ClanLevel;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6a;
    }
}

function ReplaceClanName(byte CommunityType, string OldClanName, string NewClanname)
{
    local export editinline BTAutoColumnListHK acl;
    local BTAutoColumnListDataHK row;
    local int lp1, iUserNameIdx;

    acl = GetMessengerType(CommunityType);
    switch(CommunityType)
    {
        // End:0x27
        case 0:
            iUserNameIdx = 0;
            // End:0x56
            break;
        // End:0x37
        case 1:
            iUserNameIdx = 4;
            // End:0x56
            break;
        // End:0x46
        case 2:
            iUserNameIdx = 1;
            // End:0x56
            break;
        // End:0x53
        case 3:
            iUserNameIdx = 4;
        // End:0xffff
        default:
            lp1 = 0;
            J0x5d:
            // End:0xdc [While If]
            if(lp1 < acl.ACLRowList.Length)
            {
                row = acl.ACLRowList[lp1];
                // End:0xd2
                if(row.DataPerColumn[iUserNameIdx].strValue == OldClanName)
                {
                    row.DataPerColumn[iUserNameIdx].strValue = NewClanname;
                }
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x5d;
            }
}

function BTAutoColumnListHK GetMessengerType(byte CommunityType)
{
    local export editinline BTAutoColumnListHK acl;

    switch(CommunityType)
    {
        // End:0x1f
        case 0:
            acl = ACLMsg[0];
            // End:0x67
            break;
        // End:0x37
        case 1:
            acl = ACLMsg[1];
            // End:0x67
            break;
        // End:0x4f
        case 2:
            acl = ACLMsg[2];
            // End:0x67
            break;
        // End:0x64
        case 3:
            acl = ACLMsg[3];
        // End:0xffff
        default:
            return acl;
    }
}

function ReplaceChannelUser(int Index, int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = ACLMsg[0].ACLRowList[Index];
    row.InitData(2);
    row.BackgroundImage = class'BTUIResourcePoolHK'.default.list_commu_n;
    row.DataPerColumn[0].IntValue = ClanPattern;
    row.DataPerColumn[0].strValue = ClanName;
    row.DataPerColumn[1].IntValue = Level;
    row.DataPerColumn[2].strValue = UserName;
    row.DataPerColumn[2].IntValue = UID;
    row.DataPerColumn[3].IntValue = ClanBG;
    row.DataPerColumn[4].IntValue = ClanBL;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[4].tempValue = IsLookForClan;
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x272
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;
    }
    // End:0x341
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x341
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0;
            row.DataPerColumn[2].Text[0].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x348:
    // End:0x381 [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x348;
    }
}

function AddFriendUser(string UserName, byte IsLogOn, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, int ClanGrade, byte IsLookForClan, int ClanLevel, int LevelMarkID)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii.width = 223.0;
    uii.Height = 33.0;
    uii.Image = texture'list_commu_n';
    uii.DrawType = 15;
    row = new class'BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = uii;
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    row.DataPerColumn[6].tempValue = IsLogOn;
    row.DataPerColumn[4].strValue = ClanName;
    row.DataPerColumn[4].IntValue = ClanBG;
    row.DataPerColumn[5].IntValue = ClanBL;
    row.DataPerColumn[6].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanMark);
    row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[4].tempValue = IsLookForClan;
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x288:
    // End:0x2e4 [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x288;
    }
    ACLMsg[1].AddRow(row);
    BTACLMessengerFriendHK(ACLMsg[1]).SortByConnectionStatus();
}

function AddClanUser(string UserName, byte IsLogOn, int Level, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, int LevelMarkID, int TitleMarkID)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;

    uii.width = 223.0;
    uii.Height = 33.0;
    uii.Image = texture'list_commu_n';
    uii.DrawType = 15;
    row = new class'BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = uii;
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    i = 0;
    J0xae:
    // End:0x10a [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xae;
    }
    row.DataPerColumn[3].tempValue = ClanGrade;
    row.DataPerColumn[5].IntValue = ClanWinCnt;
    row.DataPerColumn[5].tempValue = ClanLoseCnt;
    row.DataPerColumn[1].IntValue = IsLogOn;
    row.DataPerColumn[2].IntValue = LevelMarkID;
    ACLMsg[2].AddRow(row);
    BTACLMessengerClanHK(ACLMsg[2]).SortByConnectionStatus();
}

function AddPCBangUser(string UserName, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, string ServerName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii.width = 223.0;
    uii.Height = 33.0;
    uii.Image = texture'list_commu_n';
    uii.DrawType = 15;
    row = new class'BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = uii;
    switch(CurPos)
    {
        // End:0x97
        case 0:
            row.DataPerColumn[0].strValue = "";
            // End:0xed
            break;
        // End:0xb9
        case 1:
            row.DataPerColumn[0].strValue = ChannelNickName;
            // End:0xed
            break;
        // End:0xea
        case 2:
            row.DataPerColumn[0].strValue = ChannelNickName $ "/" $ string(RoomNum);
            // End:0xed
            break;
        // End:0xffff
        default:
            row.DataPerColumn[0].IntValue = Level;
            row.DataPerColumn[1].strValue = UserName;
            // End:0x14d
            if(CurPos == 2)
            {
                row.DataPerColumn[1].IntValue = RoomNum;
            }
            // End:0x168
            else
            {
                row.DataPerColumn[1].IntValue = -1;
            }
            row.DataPerColumn[2].strValue = ServerIP;
            row.DataPerColumn[2].IntValue = serverPort;
            // End:0x1c7
            if(CurPos == 0)
            {
                row.DataPerColumn[3].strValue = "";
            }
            // End:0x1e3
            else
            {
                row.DataPerColumn[3].strValue = ServerName;
            }
            row.DataPerColumn[3].IntValue = ChannelNum;
            row.DataPerColumn[3].tempValue = CurPos;
            // End:0x242
            if(CurPos == 0)
            {
                row.DataPerColumn[4].strValue = "";
            }
            // End:0x25e
            else
            {
                row.DataPerColumn[4].strValue = ClanName;
            }
            row.DataPerColumn[4].IntValue = ClanBG;
            row.DataPerColumn[5].IntValue = ClanBL;
            row.DataPerColumn[6].IntValue = ClanMark;
            GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
            row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBG);
            row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBL);
            row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanMark);
            row.DataPerColumn[0].tempValue = ClanGrade;
            row.DataPerColumn[1].tempValue = ClanWin;
            row.DataPerColumn[2].tempValue = ClanLose;
            row.DataPerColumn[4].tempValue = IsLookForClan;
            row.DataPerColumn[7].tempValue = ClanLevel;
            row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
            row.DataPerColumn[5].strValue = ChannelNickName;
            row.DataPerColumn[7].IntValue = LevelMarkID;
            i = 0;
            J0x458:
            // End:0x4b4 [While If]
            if(i < 3)
            {
                row.DataPerColumn[0].Text[i].FontDrawType = 3;
                row.DataPerColumn[1].Text[i].FontDrawType = 3;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x458;
            }
            ACLMsg[3].AddRow(row);
}

function int FindFriendFromUserName(string UserName)
{
    local int i, Index;

    Index = 1;
    i = 0;
    J0x11:
    // End:0x74 [While If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x6a
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[1].strValue == UserName)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x11;
    }
    return -1;
}

function UpdateFriendlyUser(optional int ListIdx)
{
    local int i, Index;

    Index = 0;
    Log("UpdateFriendlyUser : " $ string(ACLMsg[Index].ACLRowList.Length) $ ", idx:" $ string(ListIdx) $ ", listLength : " $ string(ACLMsg[ListIdx].ACLRowList.Length));
    i = 0;
    J0x82:
    // End:0x281 [While If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x277
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].floatValue == float(0) && IsFriendlyUser(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].strValue, ACLMsg[Index].ACLRowList[i].DataPerColumn[0].strValue, ListIdx))
        {
            Log("UpdateFriendlyUser : " $ ACLMsg[Index].ACLRowList[i].DataPerColumn[2].strValue);
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].floatValue = 1.0;
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].Text[0].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].Text[1].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameOn();
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].Text[2].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x82;
    }
}

function bool IsFriendlyUser(string UserName, optional string ClanName, optional int ListIdx)
{
    local int i, j;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x4a
    if(MM.kUserName == UserName)
    {
        return false;
    }
    // End:0xb5
    if(ClanName != "" && MM.kClanName == ClanName)
    {
        Log("[BTTPMessenger::IsFriendlyUser] " $ MM.kClanName $ " == " $ ClanName);
        return true;
    }
    // End:0x193
    if(ListIdx == 0)
    {
        i = 1;
        J0xc7:
        // End:0x190 [While If]
        if(i < ACLMsg.Length)
        {
            // End:0xe8
            if(i == 2)
            {
            }
            // End:0x186
            else
            {
                j = 0;
                J0xef:
                // End:0x186 [While If]
                if(j < ACLMsg[i].ACLRowList.Length)
                {
                    // End:0x17c
                    if(ACLMsg[i].ACLRowList[j].DataPerColumn[1].strValue == UserName)
                    {
                        Log("UpdateFriendlyUser idx :" $ string(ListIdx) $ ", name :" $ UserName);
                        return true;
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0xef;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xc7;
        }
    }
    // End:0x251
    else
    {
        // End:0x1b3
        if(ListIdx >= ACLMsg.Length || ListIdx == 2)
        {
            return false;
        }
        i = 0;
        J0x1ba:
        // End:0x251 [While If]
        if(i < ACLMsg[ListIdx].ACLRowList.Length)
        {
            // End:0x247
            if(ACLMsg[ListIdx].ACLRowList[i].DataPerColumn[1].strValue == UserName)
            {
                Log("UpdateFriendlyUser idx :" $ string(ListIdx) $ ", Name :" $ UserName);
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1ba;
        }
    }
    return false;
}

function RemoveChannelUser(int UID)
{
    local int i, Index;

    Index = 0;
    i = 0;
    J0x11:
    // End:0x8c [While If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x82
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            ACLMsg[Index].RemoveRow(i);
        }
        // End:0x8c
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x11;
        }
    }
}

function RemoveAll(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[eTabMenuType].RemoveAll();
}

function SavePos(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[eTabMenuType].SavePos();
}

function LoadPos(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[eTabMenuType].LoadPos();
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0xad
    if(ACLMsg[i].selectIndex >= 0)
    {
        ACLMsg[i].MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMsg[i].ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        OnPopupCheck(i, ACLMsg[i]);
        return true;
    }
    // End:0xcd
    else
    {
        ACLMsg[i].MultiColumnList.bHotTrack = true;
    }
    return false;
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMsg[TabControl.GetCurrentTabIndex()].MultiColumnList.bHotTrack = true;
    return true;
}

delegate OnPopupChannel(int ContextMenuIndex, BTACLMessengerChannelHK acl);
delegate OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl);
delegate OnPopupClan(int ContextMenuIndex, BTACLMessengerClanHK acl);
delegate OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl);
function OnPopupCheck(int Panel, BTAutoColumnListHK acl)
{
    // End:0x38
    if(Panel == 0)
    {
        OnPopupChannelCheck(BTACLMessengerChannelHK(acl), BTCMMessengerChannelHK(acl.ContextMenu));
    }
    // End:0xdd
    else
    {
        // End:0x70
        if(Panel == 1)
        {
            OnPopupFriendCheck(BTACLMessengerFriendHK(acl), BTCMMessengerFriendHK(acl.ContextMenu));
        }
        // End:0xdd
        else
        {
            // End:0xa8
            if(Panel == 2)
            {
                OnPopupClanCheck(BTACLMessengerClanHK(acl), BTCMMessengerClanHK(acl.ContextMenu));
            }
            // End:0xdd
            else
            {
                // End:0xdd
                if(Panel == 3)
                {
                    OnPopupPCBangCheck(BTACLMessengerPCBangHK(acl), BTCMMessengerPCBangHK(acl.ContextMenu));
                }
            }
        }
    }
}

delegate OnPopupChannelCheck(BTACLMessengerChannelHK acl, BTCMMessengerChannelHK cm);
delegate OnPopupFriendCheck(BTACLMessengerFriendHK acl, BTCMMessengerFriendHK cm);
delegate OnPopupClanCheck(BTACLMessengerClanHK acl, BTCMMessengerClanHK cm);
delegate OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm);
function ContextMenu_OnSelected(int ContextMenuIndex)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0x31
    if(ACLMsg[i].selectIndex < 0)
    {
        return;
    }
    Log("[BTTPMessengerHK::ContextMenu_OnSelected] " $ "Tab = " $ string(i));
    switch(i)
    {
        // End:0xa2
        case 0:
            OnPopupChannel(ContextMenuIndex, BTACLMessengerChannelHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xcb
        case 1:
            OnPopupFriend(ContextMenuIndex, BTACLMessengerFriendHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xf4
        case 2:
            OnPopupClan(ContextMenuIndex, BTACLMessengerClanHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0x11d
        case 3:
            OnPopupPCBang(ContextMenuIndex, BTACLMessengerPCBangHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xffff
        default:
}

delegate ChannelUserList_OnHitBottom(int Top, int Count, int itemperpage);
delegate ChannelUserList_OnHitTop(int Top, int Count, int itemperpage);
delegate ChannelUserList_OnAdjustWindow(int Top, int Count, int itemperpage);
function BTACLMessengerChannelHK_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnAdjustWindow(Top, Count, itemperpage);
}

function BTACLMessengerChannelHK_OnHitBottom(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitBottom(Top, Count, itemperpage);
}

function BTACLMessengerChannelHK_OnHitTop(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitTop(Top, Count, itemperpage);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTAutoColumnListHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ListBoundImage[0].bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(23);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    ListBoundImage[0].AWinPos = fb;
    ListBoundImage[0].bBoundToParent = false;
    ListBoundImage[0].bScaleToParent = false;
    ListBoundImage[0].ApplyAWinPos();
    // End:0x1df
    if(ListBoundImage[1] != none)
    {
        ListBoundImage[1].bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2);
        fb.Y1 = AWinPos.Y1 + float(23) + float(2);
        fb.X2 = AWinPos.X2 - float(2) - float(15);
        fb.Y2 = AWinPos.Y2 - float(2);
        ListBoundImage[1].AWinPos = fb;
        ListBoundImage[1].bBoundToParent = false;
        ListBoundImage[1].bScaleToParent = false;
        ListBoundImage[1].ApplyAWinPos();
    }
    ListBoundImage[2].bUseAWinPos = true;
    fb.X1 = AWinPos.X2 - float(2) - float(14);
    fb.Y1 = AWinPos.Y1 + float(23) + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = AWinPos.Y2 - float(2);
    ListBoundImage[2].AWinPos = fb;
    ListBoundImage[2].bBoundToParent = false;
    ListBoundImage[2].bScaleToParent = false;
    ListBoundImage[2].ApplyAWinPos();
    i = 0;
    J0x2c3:
    // End:0x7fb [While If]
    if(i < 4)
    {
        serverButton = new class'BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(60 * i) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = AWinPos.X1 + float(60 * i + 1) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.50;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        serverButton.ButtonID = i;
        ButtonMsg[i] = serverButton;
        // End:0x4dc
        if(i == 0)
        {
            serverACL = new class'BTACLMessengerChannelHK';
            BTACLMessengerChannelHK(serverACL).__OnAdjustWindow__Delegate = BTACLMessengerChannelHK_OnAdjustWindow;
            BTACLMessengerChannelHK(serverACL).__OnHitTop__Delegate = BTACLMessengerChannelHK_OnHitTop;
            BTACLMessengerChannelHK(serverACL).__OnHitBottom__Delegate = BTACLMessengerChannelHK_OnHitBottom;
        }
        // End:0x539
        else
        {
            // End:0x4fc
            if(i == 1)
            {
                serverACL = new class'BTACLMessengerFriendHK';
            }
            // End:0x539
            else
            {
                // End:0x51c
                if(i == 3)
                {
                    serverACL = new class'BTACLMessengerPCBangHK';
                }
                // End:0x539
                else
                {
                    // End:0x539
                    if(i == 2)
                    {
                        serverACL = new class'BTACLMessengerClanHK';
                    }
                }
            }
        }
        serverACL.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2);
        fb.Y1 = AWinPos.Y1 + float(2) + float(23);
        fb.X2 = AWinPos.X2 - float(2) - float(15);
        fb.Y2 = AWinPos.Y2 - float(2);
        serverACL.AWinPos = fb;
        // End:0x6a6
        if(i == 3)
        {
            fb.X1 = AWinPos.X1 + float(2);
            fb.Y1 = AWinPos.Y1 + float(2) + float(23);
            fb.X2 = AWinPos.X2 - float(2) - float(15);
            fb.Y2 = AWinPos.Y1 + float(2) + float(23) + float(34);
            ButtonMainPCBang = BTOwnerDrawCaptionButtonHK(NewComponent(new class'BTOwnerDrawCaptionButtonHK', fb));
            ButtonMainPCBang.SetDefaultButtonImage();
            ButtonMainPCBang.SetVisibility(false);
        }
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.50;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = AWinPos.X2 - float(2) - float(14);
        fb.Y1 = AWinPos.Y1 + float(2) + float(23);
        fb.X2 = AWinPos.X2 - float(2);
        fb.Y2 = AWinPos.Y2 - float(2);
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        serverACL.MultiColumnList.MyScrollBar.ApplyAWinPos();
        ACLMsg[i] = serverACL;
        TabControl.BindTabButtonAndPanel(ButtonMsg[i], ACLMsg[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c3;
    }
    i = 0;
    J0x802:
    // End:0x825 [While If]
    if(i < 4)
    {
        AddAclMsgMenu(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x802;
    }
    TabControl.SetVisiblePanel(0);
}

function AddAclMsgMenu(int Index)
{
    // End:0x40
    if(Index == 0)
    {
        ButtonMsg[Index].Caption = strConnected;
        CMMsg[Index] = new class'BTCMMessengerChannelHK';
    }
    // End:0xfd
    else
    {
        // End:0x80
        if(Index == 1)
        {
            ButtonMsg[Index].Caption = strFriend;
            CMMsg[Index] = new class'BTCMMessengerFriendHK';
        }
        // End:0xfd
        else
        {
            // End:0xc0
            if(Index == 2)
            {
                ButtonMsg[Index].Caption = strClan;
                CMMsg[Index] = new class'BTCMMessengerClanHK';
            }
            // End:0xfd
            else
            {
                // End:0xfd
                if(Index == 3)
                {
                    ButtonMsg[Index].Caption = strPCBang;
                    CMMsg[Index] = new class'BTCMMessengerPCBangHK';
                }
            }
        }
    }
    CMMsg[Index].InitComponent(self.Controller, none);
    CMMsg[Index].__OnOpen__Delegate = ContextMenu_OnOpen;
    CMMsg[Index].__OnClose__Delegate = ContextMenu_OnClose;
    CMMsg[Index].__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLMsg[Index].ContextMenu = CMMsg[Index];
}

function bool BTWindowDefineARHK_18_19_OnOK(GUIComponent Sender)
{
    MM.kTcpChannel.sfReqRegisterMainPCBang();
    Controller.CloseMenu(false);
    return true;
}

function bool ButtonMainPCBang_Register_OnClick(GUIComponent Sender)
{
    return true;
}

function bool ButtonMainPCBang_Change_OnClick(GUIComponent Sender)
{
    return true;
}

function bool ButtonMainPCBang_Playing_OnClick(GUIComponent Sender)
{
    return true;
}

function UpdatePCBangInfo();
function Internal_OnVisiblePanelChanged(int Index)
{
    // End:0xd6
    if(Index == 3)
    {
        // End:0x68
        if(false == MM.IsPlayingPCBang())
        {
            ButtonMainPCBang.__OnClick__Delegate = None;
            ButtonMainPCBang.Caption = strMainPCBang[3];
            ACLMsg[Index].RemoveAll();
            return;
        }
        // End:0xd3
        else
        {
            // End:0xa9
            if(MM.kIsMainPCBang == 0)
            {
                ButtonMainPCBang.__OnClick__Delegate = ButtonMainPCBang_Register_OnClick;
                ButtonMainPCBang.Caption = strMainPCBang[0];
            }
            // End:0xd3
            else
            {
                ButtonMainPCBang.__OnClick__Delegate = ButtonMainPCBang_Playing_OnClick;
                ButtonMainPCBang.Caption = strMainPCBang[1];
            }
        }
    }
    // End:0xea
    else
    {
        ButtonMainPCBang.__OnClick__Delegate = None;
    }
    // End:0x12c
    if(TabControl.GetVisiblePanelIndex() == 3 && MM.IsPlayingPCBang() == true)
    {
        ButtonMainPCBang.SetVisibility(true);
    }
    // End:0x13c
    else
    {
        ButtonMainPCBang.SetVisibility(false);
    }
}

function UpdateTabButtonPosition()
{
    local int VisibleIndex, i;

    VisibleIndex = 0;
    i = 0;
    J0x0e:
    // End:0x120 [While If]
    if(i < 4)
    {
        // End:0x116
        if(ButtonMsg[i].bVisible == true)
        {
            ButtonMsg[i].AWinPos.X1 = AWinPos.X1 + float(60 * VisibleIndex) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y1 = AWinPos.Y1;
            ButtonMsg[i].AWinPos.X2 = AWinPos.X1 + float(60 * VisibleIndex + 1) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y2 = AWinPos.Y1 + float(32);
            ButtonMsg[i].ApplyAWinPos();
            ++ VisibleIndex;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
}

function ShowTabButton(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    // End:0x3b
    if(ButtonMsg[eTabMenuType].bVisible == false)
    {
        ButtonMsg[eTabMenuType].SetVisibility(true);
        UpdateTabButtonPosition();
    }
}

function HideTabButton(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    // End:0x3b
    if(ButtonMsg[eTabMenuType].bVisible == true)
    {
        ButtonMsg[eTabMenuType].SetVisibility(false);
        UpdateTabButtonPosition();
    }
}

function SetUserServerInfo(string szServername, string szServerShortName, string szServerIP, int serverPort, byte CurPos, byte CurState, int ChannelNum, string szChannelNickName, int GameRoomNum)
{
    local int Index, iRowIndex;
    local BTAutoColumnListDataHK row;
    local bool bPlaying;
    local export editinline BTACLMessengerCommon kACL;

    Index = TabControl.GetCurrentTabIndex();
    kACL = BTACLMessengerCommon(ACLMsg[Index]);
    iRowIndex = ACLMsg[Index].selectIndex;
    row = ACLMsg[Index].GetRowByIndex(ACLMsg[Index].selectIndex);
    switch(CurPos)
    {
        // End:0x9c
        case 1:
            kACL.SetCurLocationName(iRowIndex, szChannelNickName);
            // End:0xce
            break;
        // End:0xcb
        case 2:
            kACL.SetCurLocationName(iRowIndex, szChannelNickName $ "/" $ string(GameRoomNum));
            // End:0xce
            break;
        // End:0xffff
        default:
            // End:0xf8
            if(CurPos == 2)
            {
                kACL.SetGameRoomNumber(iRowIndex, GameRoomNum);
            }
            // End:0x111
            else
            {
                kACL.SetGameRoomNumber(iRowIndex, -1);
            }
            kACL.SetServerIP(iRowIndex, szServerIP);
            kACL.SetServerPort(iRowIndex, serverPort);
            // End:0x169
            if(CurPos == 0)
            {
                kACL.SetServerName(iRowIndex, "");
            }
            // End:0x182
            else
            {
                kACL.SetServerName(iRowIndex, szServername);
            }
            kACL.SetChannelNumber(iRowIndex, ChannelNum);
            kACL.SetCurpos(iRowIndex, CurPos);
            kACL.SetChannelName(iRowIndex, szChannelNickName);
            kACL.SetCurState(iRowIndex, CurState);
            bPlaying = CurPos == 2 && CurState == 2;
            // End:0x23d
            if(bPlaying == true)
            {
                BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).SetLogOnState(2);
            }
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).SetLocation(szChannelNickName, GameRoomNum);
            // End:0x301
            if(MM.kRoomID == GameRoomNum && MM.kServerName == szServername && MM.kChannelID == ChannelNum)
            {
                BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeMoveRoomState(false);
                BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(false);
            }
            // End:0x3bb
            else
            {
                // End:0x397
                if(CurPos >= 1 && MM.kRoomID != -1)
                {
                    BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeMoveRoomState(true);
                    BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(true);
                    BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeWispherState(true);
                }
                // End:0x3bb
                else
                {
                    BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(false);
                }
            }
}

defaultproperties
{
    begin object n[0]ame=mListBoundImage class=BTStretchedImageHK
        Image=Texture'Warfare_GP_UI_UI.Common.panel_1'
    object end
    // Reference: BTStretchedImageHK'BTTPMessengerHK.mListBoundImage'
    ListBoundImage=mListBoundImage
    ListBoundImage=mListBoundImage3
    begin object name=mTabControl class=TabControlMocker
        OnVisiblePanelChanged=Internal_OnVisiblePanelChanged
    object end
    // Reference: TabControlMocker'BTTPMessengerHK.mTabControl'
    TabControl=mTabControl
    strConnected="Online"
    strFriend="Friends"
    strClan="Clan"
    strDeny="Block"
    strPCBang="PC Cafe"
    strOffLine="Offline"
    strLogout="Log Out"
    strMainPCBang[0]="Register Primary PC Cafe"
    strMainPCBang[1]="Playing at Primary PC Cafe"
    strMainPCBang[2]="Change Primary PC Cafe"
    strMainPCBang[3]="You are not in a PC Cafe right now."
    bBoundToParent=true
    bScaleToParent=true
}