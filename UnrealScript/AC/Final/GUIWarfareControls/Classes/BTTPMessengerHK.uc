class BTTPMessengerHK extends GUITabPanel
    editinlinenew
    instanced;

enum E_TAB_MENU_TYPE
{
    TAB_MENU_CONNECTED,             // 0
    TAB_MENU_FRIEND,                // 1
    TAB_MENU_CLAN,                  // 2
    TAB_MENU_PCBANG,                // 3
    TAB_MENU_MAX_COUNT              // 4
};

var export editinline BTOwnerDrawCaptionButtonHK ButtonMainPCBang;
var() automated BTStretchedImageHK BackgroundImage;
var() automated BTStretchedImageHK ListBoundImage[3];
var() automated TabControlMocker TabControl;
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
//var delegate<OnPopupChannel> __OnPopupChannel__Delegate;
//var delegate<OnPopupFriend> __OnPopupFriend__Delegate;
//var delegate<OnPopupClan> __OnPopupClan__Delegate;
//var delegate<OnPopupPCBang> __OnPopupPCBang__Delegate;
//var delegate<OnPopupChannelCheck> __OnPopupChannelCheck__Delegate;
//var delegate<OnPopupFriendCheck> __OnPopupFriendCheck__Delegate;
//var delegate<OnPopupClanCheck> __OnPopupClanCheck__Delegate;
//var delegate<OnPopupPCBangCheck> __OnPopupPCBangCheck__Delegate;
//var delegate<ChannelUserList_OnHitBottom> __ChannelUserList_OnHitBottom__Delegate;
//var delegate<ChannelUserList_OnHitTop> __ChannelUserList_OnHitTop__Delegate;
//var delegate<ChannelUserList_OnAdjustWindow> __ChannelUserList_OnAdjustWindow__Delegate;

function int FindChannelUser(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x63 [Loop If]
    if(i < ACLMsg[0].ACLRowList.Length)
    {
        // End:0x59
        if(ACLMsg[0].ACLRowList[i].DataPerColumn[2].IntValue == UID)
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

function bool AddChannelUser(int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x3D
    if(UserName == "")
    {
        return false;
    }
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
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
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x270
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x33F
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0000000;
            row.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x346:

    // End:0x37F [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x346;
    }
    ACLMsg[int(0)].AddRow(row);
    return true;
    //return;    
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
            acl = ACLMsg[int(3)];
            iUserNameIdx = 1;
            // End:0x84
            break;
        // End:0x45
        case 2:
            acl = ACLMsg[int(2)];
            iUserNameIdx = 1;
            // End:0x84
            break;
        // End:0x64
        case 3:
            acl = ACLMsg[int(1)];
            iUserNameIdx = 1;
            // End:0x84
            break;
        // End:0x81
        case 4:
            acl = ACLMsg[int(0)];
            iUserNameIdx = 2;
        // End:0xFFFF
        default:
            break;
    }
    lp1 = 0;
    J0x8B:

    // End:0x10D [Loop If]
    if(lp1 < acl.ACLRowList.Length)
    {
        row = acl.ACLRowList[lp1];
        // End:0x103
        if(row.DataPerColumn[iUserNameIdx].strValue == OldUserName)
        {
            row.DataPerColumn[iUserNameIdx].strValue = NewUserName;
            // [Explicit Break]
            goto J0x10D;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x8B;
    }
    J0x10D:

    //return;    
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
        // End:0x4E
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
        // End:0xFFFF
        default:
            break;
    }
    lp1 = 0;
    J0x8A:

    // End:0x10D [Loop If]
    if(lp1 < acl.ACLRowList.Length)
    {
        row = acl.ACLRowList[lp1];
        // End:0x103
        if(row.DataPerColumn[iUserNameIdx[1]].strValue == UserName)
        {
            row.DataPerColumn[iUserNameIdx[0]].strValue = NewClanname;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x8A;
    }
    //return;    
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
    J0x6A:

    // End:0xF9 [Loop If]
    if(i < acl.ACLRowList.Length)
    {
        row = acl.ACLRowList[i];
        // End:0xEF
        if(row.DataPerColumn[iClanNameIdx[int(CommunityType)]].strValue == ClanName)
        {
            row.DataPerColumn[iClanLevelIdx[int(CommunityType)]].tempValue = ClanLevel;
        }
        i++;
        // [Loop Continue]
        goto J0x6A;
    }
    //return;    
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
        // End:0xFFFF
        default:
            break;
    }
    lp1 = 0;
    J0x5D:

    // End:0xDC [Loop If]
    if(lp1 < acl.ACLRowList.Length)
    {
        row = acl.ACLRowList[lp1];
        // End:0xD2
        if(row.DataPerColumn[iUserNameIdx].strValue == OldClanName)
        {
            row.DataPerColumn[iUserNameIdx].strValue = NewClanname;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x5D;
    }
    //return;    
}

function BTAutoColumnListHK GetMessengerType(byte CommunityType)
{
    local export editinline BTAutoColumnListHK acl;

    switch(CommunityType)
    {
        // End:0x1F
        case 0:
            acl = ACLMsg[int(0)];
            // End:0x67
            break;
        // End:0x37
        case 1:
            acl = ACLMsg[int(1)];
            // End:0x67
            break;
        // End:0x4F
        case 2:
            acl = ACLMsg[int(2)];
            // End:0x67
            break;
        // End:0x64
        case 3:
            acl = ACLMsg[int(3)];
        // End:0xFFFF
        default:
            break;
    }
    return acl;
    //return;    
}

function ReplaceChannelUser(int Index, int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = ACLMsg[0].ACLRowList[Index];
    row.InitData(2);
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
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
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x26F
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x33E
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0000000;
            row.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x345:

    // End:0x37E [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x345;
    }
    //return;    
}

function AddFriendUser(string UserName, byte IsLogOn, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, int ClanGrade, byte IsLookForClan, int ClanLevel, int LevelMarkID)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii.width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_GP_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = uii;
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    row.DataPerColumn[6].tempValue = int(IsLogOn);
    row.DataPerColumn[4].strValue = ClanName;
    row.DataPerColumn[4].IntValue = ClanBG;
    row.DataPerColumn[5].IntValue = ClanBL;
    row.DataPerColumn[6].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanMark);
    row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x288:

    // End:0x2E4 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x288;
    }
    ACLMsg[int(1)].AddRow(row);
    BTACLMessengerFriendHK(ACLMsg[int(1)]).SortByConnectionStatus();
    //return;    
}

function AddClanUser(string UserName, byte IsLogOn, int Level, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, int LevelMarkID, int TitleMarkID)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;

    uii.width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_GP_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = uii;
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    i = 0;
    J0xAE:

    // End:0x10A [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0xAE;
    }
    row.DataPerColumn[3].tempValue = ClanGrade;
    row.DataPerColumn[5].IntValue = ClanWinCnt;
    row.DataPerColumn[5].tempValue = ClanLoseCnt;
    row.DataPerColumn[1].IntValue = int(IsLogOn);
    row.DataPerColumn[2].IntValue = LevelMarkID;
    ACLMsg[int(2)].AddRow(row);
    BTACLMessengerClanHK(ACLMsg[int(2)]).SortByConnectionStatus();
    //return;    
}

function AddPCBangUser(string UserName, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, string ServerName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii.width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_GP_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = uii;
    switch(CurPos)
    {
        // End:0x97
        case 0:
            row.DataPerColumn[0].strValue = "";
            // End:0xED
            break;
        // End:0xB9
        case 1:
            row.DataPerColumn[0].strValue = ChannelNickName;
            // End:0xED
            break;
        // End:0xEA
        case 2:
            row.DataPerColumn[0].strValue = (ChannelNickName $ "/") $ string(RoomNum);
            // End:0xED
            break;
        // End:0xFFFF
        default:
            break;
    }
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    // End:0x14D
    if(CurPos == 2)
    {
        row.DataPerColumn[1].IntValue = RoomNum;        
    }
    else
    {
        row.DataPerColumn[1].IntValue = -1;
    }
    row.DataPerColumn[2].strValue = ServerIP;
    row.DataPerColumn[2].IntValue = serverPort;
    // End:0x1C7
    if(CurPos == 0)
    {
        row.DataPerColumn[3].strValue = "";        
    }
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
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].strValue = ChannelNickName;
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x458:

    // End:0x4B4 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x458;
    }
    ACLMsg[3].AddRow(row);
    //return;    
}

function int FindFriendFromUserName(string UserName)
{
    local int i, Index;

    Index = int(1);
    i = 0;
    J0x11:

    // End:0x74 [Loop If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x6A
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[1].strValue == UserName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x11;
    }
    return -1;
    //return;    
}

function UpdateFriendlyUser(optional int ListIdx)
{
    local int i;

    Log((((("UpdateFriendlyUser : " $ string(ACLMsg[0].ACLRowList.Length)) $ ", idx:") $ string(ListIdx)) $ ", listLength : ") $ string(ACLMsg[ListIdx].ACLRowList.Length));
    i = 0;
    J0x74:

    // End:0x24F [Loop If]
    if(i < ACLMsg[0].ACLRowList.Length)
    {
        // End:0x245
        if((ACLMsg[0].ACLRowList[i].DataPerColumn[2].floatValue == float(0)) && IsFriendlyUser(ACLMsg[0].ACLRowList[i].DataPerColumn[2].strValue, ACLMsg[0].ACLRowList[i].DataPerColumn[0].strValue, ListIdx))
        {
            Log("UpdateFriendlyUser : " $ ACLMsg[0].ACLRowList[i].DataPerColumn[2].strValue);
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].floatValue = 1.0000000;
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            ACLMsg[0].ACLRowList[i].DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
        ++i;
        // [Loop Continue]
        goto J0x74;
    }
    //return;    
}

function bool IsFriendlyUser(string UserName, optional string ClanName, optional int ListIdx)
{
    local int i, j;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x4A
    if(MM.kUserName == UserName)
    {
        return false;
    }
    // End:0xB5
    if((ClanName != "") && MM.kClanName == ClanName)
    {
        Log((("[BTTPMessenger::IsFriendlyUser] " $ MM.kClanName) $ " == ") $ ClanName);
        return true;
    }
    // End:0x191
    if(ListIdx == 0)
    {
        i = 1;
        J0xC7:

        // End:0x18E [Loop If]
        if(i < ACLMsg.Length)
        {
            // End:0xE6
            if(i == 2)
            {
                // [Explicit Continue]
                goto J0x184;
            }
            j = 0;
            J0xED:

            // End:0x184 [Loop If]
            if(j < ACLMsg[i].ACLRowList.Length)
            {
                // End:0x17A
                if(ACLMsg[i].ACLRowList[j].DataPerColumn[1].strValue == UserName)
                {
                    Log((("UpdateFriendlyUser idx :" $ string(ListIdx)) $ ", name :") $ UserName);
                    return true;
                }
                ++j;
                // [Loop Continue]
                goto J0xED;
            }
            J0x184:

            ++i;
            // [Loop Continue]
            goto J0xC7;
        }        
    }
    else
    {
        // End:0x1B1
        if((ListIdx >= ACLMsg.Length) || ListIdx == 2)
        {
            return false;
        }
        i = 0;
        J0x1B8:

        // End:0x24F [Loop If]
        if(i < ACLMsg[ListIdx].ACLRowList.Length)
        {
            // End:0x245
            if(ACLMsg[ListIdx].ACLRowList[i].DataPerColumn[1].strValue == UserName)
            {
                Log((("UpdateFriendlyUser idx :" $ string(ListIdx)) $ ", Name :") $ UserName);
                return true;
            }
            ++i;
            // [Loop Continue]
            goto J0x1B8;
        }
    }
    return false;
    //return;    
}

function RemoveChannelUser(int UID)
{
    local int i, Index;

    Index = int(0);
    i = 0;
    J0x11:

    // End:0x8C [Loop If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x82
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            ACLMsg[Index].RemoveRow(i);
            // [Explicit Break]
            goto J0x8C;
        }
        i++;
        // [Loop Continue]
        goto J0x11;
    }
    J0x8C:

    //return;    
}

function RemoveAll(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[int(eTabMenuType)].RemoveAll();
    //return;    
}

function SavePos(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[int(eTabMenuType)].SavePos();
    //return;    
}

function LoadPos(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[int(eTabMenuType)].LoadPos();
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0xAD
    if(ACLMsg[i].selectIndex >= 0)
    {
        ACLMsg[i].MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMsg[i].ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        OnPopupCheck(i, ACLMsg[i]);
        return true;        
    }
    else
    {
        ACLMsg[i].MultiColumnList.bHotTrack = true;
    }
    return false;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMsg[TabControl.GetCurrentTabIndex()].MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

delegate OnPopupChannel(int ContextMenuIndex, BTACLMessengerChannelHK acl)
{
    //return;    
}

delegate OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl)
{
    //return;    
}

delegate OnPopupClan(int ContextMenuIndex, BTACLMessengerClanHK acl)
{
    //return;    
}

delegate OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    //return;    
}

function OnPopupCheck(int Panel, BTAutoColumnListHK acl)
{
    // End:0x38
    if(Panel == int(0))
    {
        OnPopupChannelCheck(BTACLMessengerChannelHK(acl), BTCMMessengerChannelHK(acl.ContextMenu));        
    }
    else
    {
        // End:0x70
        if(Panel == int(1))
        {
            OnPopupFriendCheck(BTACLMessengerFriendHK(acl), BTCMMessengerFriendHK(acl.ContextMenu));            
        }
        else
        {
            // End:0xA8
            if(Panel == int(2))
            {
                OnPopupClanCheck(BTACLMessengerClanHK(acl), BTCMMessengerClanHK(acl.ContextMenu));                
            }
            else
            {
                // End:0xDD
                if(Panel == int(3))
                {
                    OnPopupPCBangCheck(BTACLMessengerPCBangHK(acl), BTCMMessengerPCBangHK(acl.ContextMenu));
                }
            }
        }
    }
    //return;    
}

delegate OnPopupChannelCheck(BTACLMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    //return;    
}

delegate OnPopupFriendCheck(BTACLMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    //return;    
}

delegate OnPopupClanCheck(BTACLMessengerClanHK acl, BTCMMessengerClanHK cm)
{
    //return;    
}

delegate OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm)
{
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0x31
    if(ACLMsg[i].selectIndex < 0)
    {
        return;
    }
    Log(("[BTTPMessengerHK::ContextMenu_OnSelected] " $ "Tab = ") $ string(i));
    switch(i)
    {
        // End:0xA2
        case int(0):
            OnPopupChannel(ContextMenuIndex, BTACLMessengerChannelHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xCB
        case int(1):
            OnPopupFriend(ContextMenuIndex, BTACLMessengerFriendHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xF4
        case int(2):
            OnPopupClan(ContextMenuIndex, BTACLMessengerClanHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0x11D
        case int(3):
            OnPopupPCBang(ContextMenuIndex, BTACLMessengerPCBangHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

delegate ChannelUserList_OnHitBottom(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate ChannelUserList_OnHitTop(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate ChannelUserList_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    //return;    
}

function BTACLMessengerChannelHK_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnAdjustWindow(Top, Count, itemperpage);
    //return;    
}

function BTACLMessengerChannelHK_OnHitBottom(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitBottom(Top, Count, itemperpage);
    //return;    
}

function BTACLMessengerChannelHK_OnHitTop(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitTop(Top, Count, itemperpage);
    //return;    
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
    // End:0x1DF
    if(ListBoundImage[1] != none)
    {
        ListBoundImage[1].bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2);
        fb.Y1 = (AWinPos.Y1 + float(23)) + float(2);
        fb.X2 = (AWinPos.X2 - float(2)) - float(15);
        fb.Y2 = AWinPos.Y2 - float(2);
        ListBoundImage[1].AWinPos = fb;
        ListBoundImage[1].bBoundToParent = false;
        ListBoundImage[1].bScaleToParent = false;
        ListBoundImage[1].ApplyAWinPos();
    }
    ListBoundImage[2].bUseAWinPos = true;
    fb.X1 = (AWinPos.X2 - float(2)) - float(14);
    fb.Y1 = (AWinPos.Y1 + float(23)) + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = AWinPos.Y2 - float(2);
    ListBoundImage[2].AWinPos = fb;
    ListBoundImage[2].bBoundToParent = false;
    ListBoundImage[2].bScaleToParent = false;
    ListBoundImage[2].ApplyAWinPos();
    i = 0;
    J0x2C3:

    // End:0x750 [Loop If]
    if(i < 4)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = 500.0000000 + float(i * 60);
        fb.Y1 = 518.0000000;
        fb.X2 = 559.0000000 + float(i * 60);
        fb.Y2 = 550.0000000;
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetMsgTabButtonImage();
        serverButton.SetTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        serverButton.ButtonID = i;
        ButtonMsg[i] = serverButton;
        // End:0x4A8
        if(i == 0)
        {
            serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerChannelHKCN';
            BTACLMessengerChannelHKCN(serverACL).__OnAdjustWindow__Delegate = BTACLMessengerChannelHK_OnAdjustWindow;
            BTACLMessengerChannelHKCN(serverACL).__OnHitTop__Delegate = BTACLMessengerChannelHK_OnHitTop;
            BTACLMessengerChannelHKCN(serverACL).__OnHitBottom__Delegate = BTACLMessengerChannelHK_OnHitBottom;            
        }
        else
        {
            // End:0x4C5
            if(i == 1)
            {
                serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerFriendHKCN';                
            }
            else
            {
                // End:0x4E3
                if(i == 2)
                {
                    serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerClanHK';                    
                }
                else
                {
                    // End:0x4FE
                    if(i == 3)
                    {
                        serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerPCBangHK';
                    }
                }
            }
        }
        serverACL.bUseAWinPos = true;
        fb.X1 = 498.0000000;
        fb.Y1 = 553.0000000;
        fb.X2 = 728.0000000;
        fb.Y2 = 733.0000000;
        serverACL.AWinPos = fb;
        // End:0x633
        if(i == 3)
        {
            fb.X1 = AWinPos.X1 - float(3);
            fb.Y1 = AWinPos.Y1 + float(36);
            fb.X2 = AWinPos.X2 - float(16);
            fb.Y2 = (AWinPos.Y1 + float(36)) + float(34);
            ButtonMainPCBang = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fb));
            ButtonMainPCBang.SetDefaultButtonImage();
            ButtonMainPCBang.SetVisibility(false);
            ButtonMainPCBang.RenderWeight = 1.0000000;
        }
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.5000000;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = 734.0000000;
        fb.Y1 = 553.0000000;
        fb.X2 = 746.0000000;
        fb.Y2 = 733.0000000;
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        serverACL.MultiColumnList.MyScrollBar.ApplyAWinPos();
        ACLMsg[i] = serverACL;
        TabControl.BindTabButtonAndPanel(ButtonMsg[i], ACLMsg[i]);
        i++;
        // [Loop Continue]
        goto J0x2C3;
    }
    ButtonMsg[0].Caption = strConnected;
    ButtonMsg[1].Caption = strFriend;
    ButtonMsg[2].Caption = strClan;
    ButtonMsg[3].Caption = strPCBang;
    TabControl.SetVisiblePanel(0);
    CMMsg[0] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerChannelHK';
    CMMsg[1] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerFriendHK';
    CMMsg[2] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerClanHK';
    CMMsg[3] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerPCBangHK';
    i = 0;
    J0x807:

    // End:0x8AB [Loop If]
    if(i < 4)
    {
        CMMsg[i].InitComponent(self.Controller, none);
        CMMsg[i].__OnOpen__Delegate = ContextMenu_OnOpen;
        CMMsg[i].__OnClose__Delegate = ContextMenu_OnClose;
        CMMsg[i].__OnSelected__Delegate = ContextMenu_OnSelected;
        ACLMsg[i].ContextMenu = CMMsg[i];
        i++;
        // [Loop Continue]
        goto J0x807;
    }
    //return;    
}

function AddAclMsgMenu(int Index)
{
    // End:0x40
    if(Index == int(0))
    {
        ButtonMsg[Index].Caption = strConnected;
        CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerChannelHK';        
    }
    else
    {
        // End:0x80
        if(Index == int(1))
        {
            ButtonMsg[Index].Caption = strFriend;
            CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerFriendHK';            
        }
        else
        {
            // End:0xC0
            if(Index == int(2))
            {
                ButtonMsg[Index].Caption = strClan;
                CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerClanHK';                
            }
            else
            {
                // End:0xFD
                if(Index == int(3))
                {
                    ButtonMsg[Index].Caption = strPCBang;
                    CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerPCBangHK';
                }
            }
        }
    }
    CMMsg[Index].InitComponent(self.Controller, none);
    CMMsg[Index].__OnOpen__Delegate = ContextMenu_OnOpen;
    CMMsg[Index].__OnClose__Delegate = ContextMenu_OnClose;
    CMMsg[Index].__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLMsg[Index].ContextMenu = CMMsg[Index];
    //return;    
}

function bool BTWindowDefineARHK_18_19_OnOK(GUIComponent Sender)
{
    MM.kTcpChannel.sfReqRegisterMainPCBang();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonMainPCBang_Register_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool ButtonMainPCBang_Change_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool ButtonMainPCBang_Playing_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function UpdatePCBangInfo()
{
    //return;    
}

function Internal_OnVisiblePanelChanged(int Index)
{
    // End:0xD6
    if(Index == int(3))
    {
        // End:0x68
        if(false == MM.IsPlayingPCBang())
        {
            ButtonMainPCBang.__OnClick__Delegate = None;
            ButtonMainPCBang.Caption = strMainPCBang[3];
            ACLMsg[Index].RemoveAll();
            return;            
        }
        else
        {
            // End:0xA9
            if(MM.kIsMainPCBang == 0)
            {
                ButtonMainPCBang.__OnClick__Delegate = ButtonMainPCBang_Register_OnClick;
                ButtonMainPCBang.Caption = strMainPCBang[0];                
            }
            else
            {
                ButtonMainPCBang.__OnClick__Delegate = ButtonMainPCBang_Playing_OnClick;
                ButtonMainPCBang.Caption = strMainPCBang[1];
            }
        }        
    }
    else
    {
        ButtonMainPCBang.__OnClick__Delegate = None;
    }
    // End:0x12C
    if((TabControl.GetVisiblePanelIndex() == int(3)) && MM.IsPlayingPCBang() == true)
    {
        ButtonMainPCBang.SetVisibility(true);        
    }
    else
    {
        ButtonMainPCBang.SetVisibility(false);
    }
    //return;    
}

function UpdateTabButtonPosition()
{
    local int VisibleIndex, i;

    VisibleIndex = 0;
    i = 0;
    J0x0E:

    // End:0x120 [Loop If]
    if(i < 4)
    {
        // End:0x116
        if(ButtonMsg[i].bVisible == true)
        {
            ButtonMsg[i].AWinPos.X1 = (AWinPos.X1 + float(60 * VisibleIndex)) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y1 = AWinPos.Y1;
            ButtonMsg[i].AWinPos.X2 = (AWinPos.X1 + float(60 * (VisibleIndex + 1))) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y2 = AWinPos.Y1 + float(32);
            ButtonMsg[i].ApplyAWinPos();
            VisibleIndex++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

function ShowTabButton(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    // End:0x3B
    if(ButtonMsg[int(eTabMenuType)].bVisible == false)
    {
        ButtonMsg[int(eTabMenuType)].SetVisibility(true);
        UpdateTabButtonPosition();
    }
    //return;    
}

function HideTabButton(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    // End:0x3B
    if(ButtonMsg[int(eTabMenuType)].bVisible == true)
    {
        ButtonMsg[int(eTabMenuType)].SetVisibility(false);
        UpdateTabButtonPosition();
    }
    //return;    
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
        // End:0x9C
        case 1:
            kACL.SetCurLocationName(iRowIndex, szChannelNickName);
            // End:0xCE
            break;
        // End:0xCB
        case 2:
            kACL.SetCurLocationName(iRowIndex, (szChannelNickName $ "/") $ string(GameRoomNum));
            // End:0xCE
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xF8
    if(int(CurPos) == 2)
    {
        kACL.SetGameRoomNumber(iRowIndex, GameRoomNum);        
    }
    else
    {
        kACL.SetGameRoomNumber(iRowIndex, -1);
    }
    kACL.SetServerIP(iRowIndex, szServerIP);
    kACL.SetServerPort(iRowIndex, serverPort);
    // End:0x169
    if(int(CurPos) == 0)
    {
        kACL.SetServerName(iRowIndex, "");        
    }
    else
    {
        kACL.SetServerName(iRowIndex, szServername);
    }
    kACL.SetChannelNumber(iRowIndex, ChannelNum);
    kACL.SetCurpos(iRowIndex, int(CurPos));
    kACL.SetChannelName(iRowIndex, szChannelNickName);
    kACL.SetCurState(iRowIndex, int(CurState));
    bPlaying = (int(CurPos) == 2) && int(CurState) == 2;
    // End:0x23D
    if(bPlaying == true)
    {
        BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).SetLogOnState(2);
    }
    BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).SetLocation(szChannelNickName, GameRoomNum);
    // End:0x301
    if(((MM.kRoomID == GameRoomNum) && MM.kServerName == szServername) && MM.kChannelID == ChannelNum)
    {
        BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeMoveRoomState(false);
        BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(false);        
    }
    else
    {
        // End:0x397
        if((int(CurPos) >= 1) && MM.kRoomID != -1)
        {
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeMoveRoomState(true);
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(true);
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeWispherState(true);            
        }
        else
        {
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(false);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: [0]BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPMessengerHK.mListBoundImage'
    begin object name="mListBoundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
    end object
    ListBoundImage=mListBoundImage
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPMessengerHK.mListBoundImage3'
    begin object name="mListBoundImage3" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
    end object
    ListBoundImage=mListBoundImage3
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPMessengerHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
        OnVisiblePanelChanged=BTTPMessengerHK.Internal_OnVisiblePanelChanged
    end object
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