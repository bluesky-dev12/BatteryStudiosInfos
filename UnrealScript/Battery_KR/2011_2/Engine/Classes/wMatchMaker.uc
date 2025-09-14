class wMatchMaker extends Object
    native;

enum WeaponLimit
{
    EWeaponLimit_Default,           // 0
    EWeaponLimit_KnifeOnly,         // 1
    EWeaponLimit_PistolOnly,        // 2
    EWeaponLimit_GrenadeOnly,       // 3
    EWeaponLimit_RPGOnly,           // 4
    EWeaponLimit_SROnly,            // 5
    EWeaponLimit_SRBan,             // 6
    EWeaponLimit_End                // 7
};

enum GameModeNum
{
    Mode_TeamDeathMatch,            // 0
    Mode_SearchAndDestroy,          // 1
    Mode_FreeForAll,                // 2
    Mode_Domination,                // 3
    Mode_Sabotage                   // 4
};

enum EGamePageState
{
    EGPState_None,                  // 0
    EGPState_InitLoading,           // 1
    EGPState_ChannelSellect,        // 2
    EGPState_Lobby,                 // 3
    EGPState_RoomLobby,             // 4
    EGPState_Store,                 // 5
    EGPState_Inventory              // 6
};

enum EGameEndType
{
    E_GAME_END_TYPE_NONE0,          // 0
    E_GAME_END_TYPE_TIME_OVER,      // 1
    E_GAME_END_TYPE_NONE2,          // 2
    E_GAME_END_TYPE_NONE3,          // 3
    E_GAME_END_TYPE_NONE4,          // 4
    E_GAME_END_TYPE_DRAW,           // 5
    E_GAME_END_TYPE_PURPOSE_SCORE,  // 6
    E_GAME_END_TYPE_NONE7,          // 7
    E_GAME_END_TYPE_NONE8,          // 8
    E_GAME_END_TYPE_NONE9,          // 9
    E_GAME_END_TYPE_NONE10,         // 10
    E_GAME_END_TYPE_A_TEAM_ALL_LEAVE,// 11
    E_GAME_END_TYPE_TWO_TEAM_ALL_LEAVE// 12
};

enum CHANNEL_OPTION
{
    CHANNEL_OPTION_KEY_ON,          // 0
    CHANNEL_OPTION_KEY_BONUS_EXP_RATIO,// 1
    CHANNEL_OPTION_KEY_IGNORE_ASSIST_RECORD,// 2
    CHANNEL_OPTION_KEY_IGNORE_DEATH_RECORD,// 3
    CHANNEL_OPTION_KEY_IGNORE_HEADSHOT_RECORD,// 4
    CHANNEL_OPTION_KEY_IGNORE_KILL_RECORD,// 5
    CHANNEL_OPTION_KEY_IGNORE_LOSE_RECORD,// 6
    CHANNEL_OPTION_KEY_IGNORE_WIN_RECORD,// 7
    CHANNEL_OPTION_KEY_LIMITATION_DEATH_HIGH,// 8
    CHANNEL_OPTION_KEY_LIMITATION_DEATH_LOW,// 9
    CHANNEL_OPTION_KEY_LIMITATION_KILL_HIGH,// 10
    CHANNEL_OPTION_KEY_LIMITATION_KILL_LOW,// 11
    CHANNEL_OPTION_KEY_LIMITATION_KILLDEATHRATIO_HIGH,// 12
    CHANNEL_OPTION_KEY_LIMITATION_KILLDEATHRATIO_LOW,// 13
    CHANNEL_OPTION_KEY_LIMITATION_LEVEL_HIGH,// 14
    CHANNEL_OPTION_KEY_LIMITATION_LEVEL_LOW,// 15
    CHANNEL_OPTION_KEY_END          // 16
};

struct native PlayerScore
{
    var int iScore;
    var int iKill;
    var int iDeath;
};

struct native TeamScore
{
    var int iScore;
};

struct native MyMatchState
{
    var int iTeam;
    var string szName;
};

struct native export LoadingMessageItem
{
    var string UserName;
    var byte LoadingState;
    var Color NameColor;
    var Color StateColor;
};

struct native PingTime
{
    var string IP;
    var int msec;
};

struct native FriendStruct
{
    var string UserName;
    var string Clanname;
    var int ClanPattern;
    var int ClanBG;
    var int ClanBL;
    var string ServerName;
    var string ServerShortName;
    var string serverIP;
    var int serverPort;
    var byte CurPos;
    var int ChannelNum;
    var string ChannelNickName;
    var int GameRoomNum;
    var int Level;
    var int ClanGrade;
    var byte IsCombat;
    var int ClanWin;
    var int ClanLose;
    var int IsLookForClan;
    var int ClanLevel;
    var int LevelMarkID;
    var int TitleMarkID;
    var int Reserved1;
    var int Reserved2;
    var int Reserved3;
};

struct native ClanStruct
{
    var int Level;
    var string UserName;
    var byte ClanGrade;
    var string ServerName;
    var string ServerShortName;
    var string serverIP;
    var int serverPort;
    var byte CurPos;
    var int ChannelNum;
    var string ChannelNickName;
    var int GameRoomNum;
    var byte IsCombat;
    var int ClanWin;
    var int ClanLose;
    var string ClanSelfIntro;
    var int LevelMarkID;
    var int TitleMarkID;
    var int Reserved1;
    var int Reserved2;
    var int Reserved3;
};

struct native PCBangStruct
{
    var string UserName;
    var string Clanname;
    var int ClanPattern;
    var int ClanBG;
    var int ClanBL;
    var string ServerName;
    var string ServerShortName;
    var string serverIP;
    var int serverPort;
    var byte CurPos;
    var int ChannelNum;
    var string ChannelNickName;
    var int GameRoomNum;
    var int Level;
    var int ClanGrade;
    var int ClanWin;
    var int ClanLose;
    var int IsLookForClan;
    var int IsCombat;
    var int ClanLevel;
    var int LevelMarkID;
    var int TitleMarkID;
    var int Reserved1;
    var int Reserved2;
    var int Reserved3;
};

struct native BlockStruct
{
    var string UserName;
};

struct native export DisplayMode
{
    var int Width;
    var int Height;
    var int RatioIndex;
};

struct native export QuestItem
{
    var int QuestID;
    var int CurrentProgress;
};

struct native export MissionItem
{
    var int QuestID;
    var int MissionType;
    var int MissionOption1;
    var int MissionOption2;
    var int MissionBotMode;
    var string MissionDesc;
    var int CurrentProgress;
    var int MaxProgress;
};

struct native EquippedItemInfo
{
    var int ItemID;
    var int SlotPosition;
    var int AddPartID;
    var BtrDouble UniqueID;
    var int ItemUsedSeconds;
    var int ItemUsedCount;
    var byte ItemOnUse;
    var int Painting_Item_ID;
};

struct native EquippedSkillInfo
{
    var int SkillID;
    var int SlotPosition;
};

struct native EquippedQSlotInfo
{
    var int ItemID[4];
    var int PartsID[4];
    var BtrDouble ItemUniqueID[4];
    var int ItemUsedSeconds[4];
    var int ItemUsedCount[4];
    var byte ItemOnUse[4];
    var int SkillID[4];
    var int Painting_Item_ID[4];
};

struct native ResultInfo
{
    var int UserID;
    var int Score;
    var int Team;
    var string Nick;
    var int Kill;
    var int Assist;
    var int Death;
    var int Exp;
    var int ExpBonus;
    var int Point;
    var int PointBonus;
    var bool IsMVP;
    var bool IsLevelUp;
    var int BonusID[9];
};

struct native BootyInfo
{
    var int PrizeWinUserID;
    var string PrizeWinUserName;
    var int ItemID;
    var int PartsID;
};

var wMatchMaker.EGamePageState GamePageState;
var wMatchMaker.EGameEndType GameEndType;
var array<PingTime> arrPingTime;
var transient Interaction Console;
var bool bForceGameOut;
var bool bUsing;
var bool bIsOwner;
var bool bListen;
var bool bServerConnected;
var bool IsRelayServerOff;
var bool bSDRespawn;
var bool bAutoStart;
var string strLoadingErrorMsg;
var string szGameClass;
var string szSeverName;
var string szChannelGroup;
var string szChannelName;
var string szMapName;
var string szRoomName;
var string szRoomPassword;
var int iNumTeam;
var int iGoalRound;
var int iTimeLimit;
var bool bFriendlyFire;
var bool bAllowSpectate;
var bool bAutobalance;
var bool bAllowJoin;
var bool bAllow3rdPersonView;
var bool bChatVictimOnly;
var bool bHasChannelTCP;
var int LoadingSleepTime;
var int LoadingSleepTimePrecache;
var wMatchMaker.WeaponLimit eWeaponLimit;
var int iMinutesKickAFK;
var int iMinPlayers;
var int iMaxPlayers;
var bool InGamePlaying;
var int InGameOver;
var bool bIsLoading;
var bool TR_bNewRespawn;
var bool bFreeView;
var string OldHostName;
var bool bHardCore;
var bool bAdminSpectator;
var bool bMultiBomb;
var int SD_ChangeRound;
var bool SD_ChangeAttackTeam;
var array<string> BlockUserListForOption;
var int kFriendListCount;
var array<FriendStruct> kFriendList;
var int kClanListCount;
var array<ClanStruct> kClanList;
var int kPCBangListCount;
var array<PCBangStruct> kPCBangList;
var int kBlockListCount;
var array<BlockStruct> kBlockList;
var byte kConnectAlpha;
var byte kChannelingType;
var int kServerType;
var bool kIsInPracticeChannel;
var bool kClanMatch_InChannel;
var bool kClanMatch_InReadyRoom;
var bool kClanMatch_Leader;
var int kClanMatch_ReadyRoomID;
var bool kClanMatch_InMatchRoom;
var int kClanMatch_ChannelID;
var int kClanMatch_RoomID;
var bool kClanMatch_OpenState;
var int kClanMatch_VersusMode;
var array<int> kClanMatch_Map;
var string kClanMatch_RoomName;
var bool bNewDailyQuestAvailable;
var bool bNoUpdateQuestInfo;
var bool bRecvProtocolUpdateQuest;
var bool bSortQuestList;
var Object kMainMenu;
var BTTcpLink_Channel kTcpChannel;
var bool kCharacterCreation;
var bool kFirstIntoInventory;
var bool kFirstIntoStore;
var bool kNeedUpdateItemList;
var bool kNeedUpdateSkillList;
var bool kNeedUpdatePoint;
var bool kNeedUpdateCash;
var bool kRecvPaidPCBangInfo;
var int kIsPaidPCBang;
var int kIsRegisteredPCBang;
var int kIsMainPCBang;
var string kPCBangName;
var bool kClanLookingFor;
var string kPrevClanName;
var string kClanName;
var int kClanPattern;
var int kClanBG;
var int kClanBL;
var int kInClanGrade;
var int kClanLevel;
var int kClanExp;
var string kClanMasterName;
var int kClanWin;
var int kClanLose;
var int kClanDraw;
var int kClanKill;
var int kClanDeath;
var int kClanAssist;
var int kClanPrevRanking;
var int kClanRanking;
var int kClanMonthlyPrevRanking;
var int kClanMonthlyRanking;
var byte kClanRegion;
var int kClanMemberCount;
var int kClanMemberMaximum;
var byte kClanIsRecruit;
var string kClanHowOld;
var string kClanKeyword;
var string kClanIntro;
var string kClanNotice;
var int kClanActivity;
var int kClanActivityRank;
var int kClanActivityRankPrev;
var int kClanActivityMRank;
var int kClanActivityMRankPrev;
var string kUserName;
var int kLevel;
var int kUID;
var int kExp;
var int kStartExp;
var int kEndExp;
var int kLevelMarkID;
var int kTitleMarkID;
var int kReserved1;
var int kReserved2;
var int kReserved3;
var bool kTest;
var bool bExistUseAdvCamShake;
var bool kGM;
var array<int> kGMListInGameRoom;
var int kPrevRanking;
var int kRanking;
var int kPrevHeadShotRanking;
var int kHeadShotRanking;
var int kPrevWomanRanking;
var int kWomanRanking;
var int kMonthlyPrevRanking;
var int kMonthlyRanking;
var int kMonthlyPrevHeadShotRanking;
var int kMonthlyHeadShotRanking;
var int kMonthlyPrevWomanRanking;
var int kMonthlyWomanRanking;
var int kKill;
var int kDeath;
var int kWin;
var int kLose;
var int kAssist;
var int kHeadShot;
var int kDisConnectCount;
var int kTotalPlayTime;
var int kUser_ClanContribue;
var int kUser_ClanWin;
var int kUser_ClanLose;
var int kUser_ClanKill;
var int kUser_ClanDeath;
var int kUser_ClanAssist;
var int kUser_ClanHeadshot;
var int kUser_ClanDiscon;
var int kFaceID;
var int kHelmetID;
var int kFaceAccessoryID;
var int kAFSpecialID;
var int kRSASpecialID;
var int kPrimaryID;
var int kSecondaryID;
var int kThrow1ID;
var int kThrow2ID;
var int kSkill1ID;
var int kSkill2ID;
var int kSkill3ID;
var int kSkill4ID;
var int kPoint;
var int kCash;
var int kCurPos;
var int kCurSubPos;
var int kChatStatus;
var int kServerGroupID;
var string kServerGroupName;
var int kServerID;
var string kServerName;
var string kServerShortName;
var int kChannelID;
var string kChannelName;
var int kRoomID;
var int kTeamID;
var int kServerPing;
var string kGame_RoomName;
var bool kGame_bOwner;
var string kGame_Password;
var string kGame_MapName;
var int kGame_MapNum;
var int kGame_GameMode;
var int kGame_UserCount;
var int kGame_GameTime;
var int kGame_GameRound;
var int kGame_WeaponLimit;
var bool kGame_TeamBalance;
var bool kGame_bHardCore;
var array<DisplayMode> SupportModes;
var float Quest_LastUpdateTime;
var array<QuestItem> QuestList;
var array<int> CompletedQuestList;
var array<int> NewQuestList;
var array<MissionItem> MissionList;
var array<MissionItem> TMissionList;
var int My_iUID;
var int My_iRoom;
var int My_iTeam;
var int My_Level;
var string My_szName;
var GameEngine gEngine;
var LevelInfo playingLevelInfo;
var bool bShowFont;
var bool bChangingHost;
var bool IsChangeHost_InLoading;
var bool IsChangeNewGuest_InLoading;
var bool DrawChangeHost_Host;
var bool DrawChangeHost_Guest;
var string newHostAddr;
var bool bForceGameOver;
var bool bPendingStarted;
var bool bSendedLoadingFailed;
var int ConnectClientNum;
var int ConnectedCount;
var int DisConnectedUserID;
var bool IsDisconnected;
var int ReconnectClientNum;
var bool bIntervention;
var wMapSettings MapSettings;
var int iHardwarePoint;
var int iAvgFrameRate;
var int iAvgPing;
var int iHostPoint;
var bool bShowMessageHostUnsuitableness;
var array<wMatchUserInfo> UserInfos;
var array<ResultInfo> ResultInfos;
var array<int> ResultTeamScores;
var array<int> ResultBonusOwnerID;
var array<int> ResultBonusID;
var array<int> ResultMainWeaponIDs;
var array<byte> ResultMainWeaponRanks;
var array<byte> ResultMainWeaponExps;
var bool PlayWithBots;
var int BotUserTeam;
var int BotNum0;
var int BotNum1;
var int BotDifficulty;
var bool bBotModeTeamBalance;
var bool BotTutorial;
var bool BeginnerMode;
var byte ResultIsGiveType;
var bool ResultIsBootyGet;
var bool ResultIsOverlapWeapon;
var array<BootyInfo> ResultBootyInfo;
var BTNetGameData NetGameData;
var bool IsTestMode;
var BTPingCheckerLinker PingChecker;
var string szChannelIP;
var int nChannelPort;
var string szRelayIP;
var int nRelayPort;
var int nNatType;
var bool m_bHostBlocking;
var string ERServerIP;
var int ERServerPort;
var int MinimapMode;
var array<int> ChannelRestrictionMaps;
var array<int> ChannelRestrictionModes;
//var delegate<CMDHK> __CMDHK__Delegate;
//var delegate<UpdatePCBangInfo> __UpdatePCBangInfo__Delegate;
//var delegate<UpdateGameRoomInfo> __UpdateGameRoomInfo__Delegate;
//var delegate<UpdateCharInfo> __UpdateCharInfo__Delegate;
//var delegate<UpdateRankingInfo> __UpdateRankingInfo__Delegate;
//var delegate<UpdateEquipItemInfo> __UpdateEquipItemInfo__Delegate;
//var delegate<UpdateMoneyInfo> __UpdateMoneyInfo__Delegate;
//var delegate<UpdateClanInfo> __UpdateClanInfo__Delegate;
//var delegate<UpdatePositionInfo> __UpdatePositionInfo__Delegate;
//var delegate<UpdateRecv_CharInfo> __UpdateRecv_CharInfo__Delegate;
//var delegate<UpdateQuestList> __UpdateQuestList__Delegate;
//var delegate<AccomplishMission25Percent> __AccomplishMission25Percent__Delegate;
//var delegate<AccomplishMission50Percent> __AccomplishMission50Percent__Delegate;
//var delegate<AccomplishMission75Percent> __AccomplishMission75Percent__Delegate;
//var delegate<AccomplishMission100Percent> __AccomplishMission100Percent__Delegate;
//var delegate<QuestLog> __QuestLog__Delegate;
//var delegate<OnReqSuccessStartGame> __OnReqSuccessStartGame__Delegate;
//var delegate<OnRecivedPing> __OnRecivedPing__Delegate;
//var delegate<UpdateFriendList> __UpdateFriendList__Delegate;
//var delegate<UpdateClanList> __UpdateClanList__Delegate;
//var delegate<UpdatePCBangList> __UpdatePCBangList__Delegate;
//var delegate<UpdateBlockList> __UpdateBlockList__Delegate;

function bool IsChannelRestrictionModes(int ModeNum)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < ChannelRestrictionModes.Length)
    {
        // End:0x2E
        if(ChannelRestrictionModes[i] == ModeNum)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool IsChannelRestrictionMaps(int MapNum)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < ChannelRestrictionMaps.Length)
    {
        // End:0x2E
        if(ChannelRestrictionMaps[i] == MapNum)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

delegate CMDHK(int Index, optional string Param1, optional string Param2, optional string param3)
{
    //return;    
}

delegate UpdatePCBangInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateGameRoomInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateCharInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateRankingInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateEquipItemInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateMoneyInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateClanInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdatePositionInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateRecv_CharInfo(wMatchMaker MM)
{
    //return;    
}

delegate UpdateQuestList(wMatchMaker MM)
{
    //return;    
}

function UpdateCharInfoAndReqClanUserList()
{
    Log("[wMatchMaker::UpdateCharInfoAndReqClanUserList]");
    UpdateCharInfo(self);
    // End:0x6C
    if(kClanName != kPrevClanName)
    {
        // End:0x6C
        if(kTcpChannel != none)
        {
            kTcpChannel.sfReqClanUserList(kClanName);
        }
    }
    kPrevClanName = kClanName;
    //return;    
}

function PI_EnterChannel(int ServerGroupID, string ServerGroupName, int ServerID, string ServerName, int ChannelID, string ChannelName, optional bool bClanWarChannel, optional bool IsPracticeChannel)
{
    kServerGroupID = ServerGroupID;
    kServerGroupName = ServerGroupName;
    kServerID = ServerID;
    kServerName = ServerName;
    kChannelID = ChannelID;
    kChannelName = ChannelName;
    kRoomID = -1;
    kTeamID = -1;
    kIsInPracticeChannel = IsPracticeChannel;
    //return;    
}

function PI_LeaveChannel()
{
    kServerGroupID = -1;
    kServerGroupName = "";
    kServerID = -1;
    kServerName = "";
    kChannelID = -1;
    kChannelName = "";
    kRoomID = -1;
    kTeamID = -1;
    kIsInPracticeChannel = false;
    //return;    
}

function PI_EnterRoom(int RoomID, int TeamID)
{
    kRoomID = RoomID;
    kTeamID = TeamID;
    ClearGMList();
    //return;    
}

function ClearGMList()
{
    kGMListInGameRoom.Length = 0;
    //return;    
}

function AddGMList(int GMUID)
{
    kGMListInGameRoom.Length = kGMListInGameRoom.Length + 1;
    kGMListInGameRoom[kGMListInGameRoom.Length - 1] = GMUID;
    //return;    
}

function RemoveGMList(int GMUID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < kGMListInGameRoom.Length)
    {
        // End:0x3B
        if(kGMListInGameRoom[i] == GMUID)
        {
            kGMListInGameRoom.Remove(i, 1);
            // [Explicit Break]
            goto J0x45;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x45:

    //return;    
}

function PI_LeavelRoom()
{
    kRoomID = -1;
    kTeamID = -1;
    //return;    
}

function RI_Clear()
{
    kGame_bOwner = false;
    kGame_RoomName = "";
    kGame_Password = "";
    kGame_MapName = "";
    kGame_MapNum = -1;
    kGame_GameMode = -1;
    kGame_UserCount = -1;
    kGame_GameTime = -1;
    kGame_GameRound = -1;
    kGame_WeaponLimit = -1;
    kGame_bHardCore = false;
    kGame_TeamBalance = false;
    //return;    
}

function bool IsClanMember()
{
    // End:0x20
    if((kClanName == "") || kClanName == "none")
    {
        return false;
    }
    return true;
    //return;    
}

function bool IsClanGrade(int Grade)
{
    // End:0x11
    if(kInClanGrade == Grade)
    {
        return true;
    }
    return false;
    //return;    
}

function SetCurpos(int CurPos, optional int CurSubPos)
{
    kCurSubPos = CurSubPos;
    kCurPos = CurPos;
    // End:0x40
    if(IsEnableAltTab())
    {
        Console.ConsoleCommand("UnBlockAltTab");        
    }
    else
    {
        Console.ConsoleCommand("BlockAltTab");
    }
    Log(((("SetCurPos(" $ string(kCurPos)) $ ",") $ string(kCurSubPos)) $ ")");
    //return;    
}

function SetCurSubPos(int CurSubPos)
{
    kCurSubPos = CurSubPos;
    // End:0x35
    if(IsEnableAltTab())
    {
        Console.ConsoleCommand("UnBlockAltTab");        
    }
    else
    {
        Console.ConsoleCommand("BlockAltTab");
    }
    Log(((("SetCurPos(" $ string(kCurPos)) $ ",") $ string(kCurSubPos)) $ ")");
    //return;    
}

function bool IsEnableAltTab()
{
    // End:0x29
    if(((kCurPos == 2) || kCurPos == 3) && kCurSubPos == 0)
    {
        return false;
    }
    return true;
    //return;    
}

function AddQuest(int QuestID)
{
    QuestList.Length = QuestList.Length + 1;
    QuestList[QuestList.Length - 1].QuestID = QuestID;
    QuestList[QuestList.Length - 1].CurrentProgress = 0;
    bSortQuestList = false;
    //return;    
}

function RemoveQuest(int QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x56 [Loop If]
    if(i < QuestList.Length)
    {
        // End:0x4C
        if(QuestList[i].QuestID == QuestID)
        {
            QuestList.Remove(i, 1);
            i--;
            bSortQuestList = false;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function AddQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < QuestID.Length)
    {
        AddQuest(QuestID[i]);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < QuestID.Length)
    {
        RemoveQuest(QuestID[i]);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function AddDailyQuest(int QuestID)
{
    AddQuest(QuestID);
    NewQuestList.Length = NewQuestList.Length + 1;
    NewQuestList[NewQuestList.Length - 1] = QuestID;
    //return;    
}

function RemoveDailyQuest(int QuestID)
{
    local int i;

    RemoveQuest(QuestID);
    i = 0;
    J0x12:

    // End:0x54 [Loop If]
    if(i < NewQuestList.Length)
    {
        // End:0x4A
        if(NewQuestList[i] == QuestID)
        {
            NewQuestList.Remove(i, 1);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    //return;    
}

function AddDailyQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < QuestID.Length)
    {
        AddDailyQuest(QuestID[i]);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveDailyQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x32 [Loop If]
    if(i < QuestID.Length)
    {
        RemoveDailyQuest(QuestID[i]);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function int FindQuest(int nQuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < QuestList.Length)
    {
        // End:0x37
        if(QuestList[i].QuestID == nQuestID)
        {
            return i;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function SortQuestList(wGameManager GameMgr)
{
    local int i, j, nTemp;
    local wQuestParam QuestParam;
    local QuestItem QuestItemTemp;
    local array<int> DisplayOderList;

    // End:0x0E
    if(bSortQuestList == true)
    {
        return;
    }
    i = 0;
    J0x15:

    // End:0x6E [Loop If]
    if(i < QuestList.Length)
    {
        QuestParam = GameMgr.GetQuestInfo(QuestList[i].QuestID);
        DisplayOderList[i] = QuestParam.DisplayOrder;
        ++i;
        // [Loop Continue]
        goto J0x15;
    }
    i = 0;
    J0x75:

    // End:0x147 [Loop If]
    if(i < (QuestList.Length - 1))
    {
        j = i + 1;
        J0x96:

        // End:0x13D [Loop If]
        if(j < QuestList.Length)
        {
            // End:0x133
            if(DisplayOderList[i] > DisplayOderList[j])
            {
                nTemp = DisplayOderList[i];
                DisplayOderList[i] = DisplayOderList[j];
                DisplayOderList[j] = nTemp;
                QuestItemTemp = QuestList[i];
                QuestList[i] = QuestList[j];
                QuestList[j] = QuestItemTemp;
            }
            ++j;
            // [Loop Continue]
            goto J0x96;
        }
        ++i;
        // [Loop Continue]
        goto J0x75;
    }
    bSortQuestList = true;
    //return;    
}

function GenerateMissionList(wGameManager GameMgr)
{
    local int i;
    local wQuestParam q;
    local BtrDouble CurrentTime;

    CurrentTime = GameMgr.GetClientTime(true);
    MissionList.Length = QuestList.Length;
    i = 0;
    J0x2A:

    // End:0x278 [Loop If]
    if(i < QuestList.Length)
    {
        q = GameMgr.GetQuestInfo(QuestList[i].QuestID);
        // End:0x76
        if(q.QuestID <= 0)
        {
            // [Explicit Continue]
            goto J0x26E;
        }
        // End:0xA7
        if((q.LimitArea != 0) && (kIsRegisteredPCBang == 0) || kIsPaidPCBang == 0)
        {
            // [Explicit Continue]
            goto J0x26E;
        }
        // End:0xD7
        if(q.IsEventQuest() && !q.IsEnabledEventQuest(CurrentTime))
        {
            // [Explicit Continue]
            goto J0x26E;
        }
        MissionList[i].QuestID = q.QuestID;
        MissionList[i].MissionType = q.MissionType;
        MissionList[i].MissionDesc = q.QuestMissionDesc;
        MissionList[i].MissionOption1 = q.MissionOption[0];
        MissionList[i].MissionOption2 = q.MissionOption[1];
        MissionList[i].MissionBotMode = q.MissionBotMode;
        MissionList[i].CurrentProgress = QuestList[i].CurrentProgress;
        MissionList[i].MaxProgress = q.MissionCount;
        Log((((((("[wMatchMaker::GenerateMissionList] MID=" $ string(MissionList[i].QuestID)) $ ", MO1=") $ string(MissionList[i].MissionOption1)) $ ", MO1=") $ string(MissionList[i].MissionOption2)) $ ", MCP=") $ string(MissionList[i].CurrentProgress));
        J0x26E:

        i++;
        // [Loop Continue]
        goto J0x2A;
    }
    TMissionList.Length = MissionList.Length;
    i = 0;
    J0x28C:

    // End:0x2BD [Loop If]
    if(i < MissionList.Length)
    {
        TMissionList[i] = MissionList[i];
        i++;
        // [Loop Continue]
        goto J0x28C;
    }
    Quest_LastUpdateTime = 0.0000000;
    Log("[wMatchMaker::GenerateMissionList] MissionList.Length=" $ string(MissionList.Length));
    //return;    
}

delegate AccomplishMission25Percent(string MissionDesc, int cur, int Max)
{
    //return;    
}

delegate AccomplishMission50Percent(string MissionDesc, int cur, int Max)
{
    //return;    
}

delegate AccomplishMission75Percent(string MissionDesc, int cur, int Max)
{
    //return;    
}

delegate AccomplishMission100Percent(string MissionDesc, int cur, int Max)
{
    //return;    
}

function CheckMissionProgress(int i, int AddCount)
{
    local float prevperc, currperc;
    local int SaveCurrentProgress;

    prevperc = float(MissionList[i].CurrentProgress) / float(MissionList[i].MaxProgress);
    SaveCurrentProgress = MissionList[i].CurrentProgress + AddCount;
    // End:0x79
    if(SaveCurrentProgress > MissionList[i].MaxProgress)
    {
        SaveCurrentProgress = MissionList[i].MaxProgress;
    }
    currperc = float(SaveCurrentProgress) / float(MissionList[i].MaxProgress);
    Log((((((((("[wMatchMaker::CheckMissionProgress] QuestID=" $ string(MissionList[i].QuestID)) $ ", MType=") $ string(MissionList[i].MissionType)) $ ", AddCount=") $ string(AddCount)) $ ", PrevPerc=") $ string(prevperc)) $ ", CurPerc=") $ string(currperc));
    // End:0x196
    if(prevperc == currperc)
    {
        Log("[wMatchMaker::CheckMissionProgress] PrevPerc==CurPerc return");
        return;
    }
    // End:0x21E
    if((currperc >= 1.0000000) && prevperc < 1.0000000)
    {
        Log("[wMatchMaker::CheckMissionProgress] Accomplish100%");
        AccomplishMission100Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);        
    }
    else
    {
        // End:0x2A5
        if((currperc >= 0.7500000) && prevperc < 0.7500000)
        {
            Log("[wMatchMaker::CheckMissionProgress] Accomplish75%");
            AccomplishMission75Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);            
        }
        else
        {
            // End:0x32C
            if((currperc >= 0.5000000) && prevperc < 0.5000000)
            {
                Log("[wMatchMaker::CheckMissionProgress] Accomplish50%");
                AccomplishMission50Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);                
            }
            else
            {
                // End:0x3B0
                if((currperc >= 0.2500000) && prevperc < 0.2500000)
                {
                    Log("[wmatchMaker::CheckMissionProgress] Accomplish25%");
                    AccomplishMission25Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);
                }
            }
        }
    }
    //return;    
}

function UpdateQuest(int MissionType, int MissionOption1, int MissionOption2, int AddCount)
{
    local int i;

    Log((((((("[wMatchMaker::UpdateQuest] MType=" $ string(MissionType)) $ ", MOption1=") $ string(MissionOption1)) $ ", MOption2=") $ string(MissionOption2)) $ ", AddCount=") $ string(AddCount));
    i = 0;
    J0x7D:

    // End:0x3A1 [Loop If]
    if(i < MissionList.Length)
    {
        // End:0x397
        if(MissionList[i].MissionType == MissionType)
        {
            // End:0xE4
            if(((MissionList[i].MissionBotMode == 0) && InGamePlaying) && Class'Engine_Decompressed.wGameSettings'.static.IsBotModeIndex(kGame_GameMode))
            {
                // [Explicit Continue]
                goto J0x397;
            }
            // End:0x182
            if((MissionList[i].MissionOption1 == 0) && MissionList[i].MissionOption2 == 0)
            {
                CheckMissionProgress(i, AddCount);
                MissionList[i].CurrentProgress += AddCount;
                // End:0x17F
                if(MissionList[i].CurrentProgress > MissionList[i].MaxProgress)
                {
                    MissionList[i].CurrentProgress = MissionList[i].MaxProgress;
                }
                // [Explicit Continue]
                goto J0x397;
            }
            // End:0x256
            if((MissionList[i].MissionOption1 != 0) && MissionList[i].MissionOption2 != 0)
            {
                // End:0x253
                if((MissionList[i].MissionOption1 == MissionOption1) && MissionList[i].MissionOption2 == MissionOption2)
                {
                    CheckMissionProgress(i, AddCount);
                    MissionList[i].CurrentProgress += AddCount;
                    // End:0x253
                    if(MissionList[i].CurrentProgress > MissionList[i].MaxProgress)
                    {
                        MissionList[i].CurrentProgress = MissionList[i].MaxProgress;
                    }
                }
                // [Explicit Continue]
                goto J0x397;
            }
            // End:0x2F8
            if((MissionList[i].MissionOption1 != 0) && MissionList[i].MissionOption1 == MissionOption1)
            {
                CheckMissionProgress(i, AddCount);
                MissionList[i].CurrentProgress += AddCount;
                // End:0x2F5
                if(MissionList[i].CurrentProgress > MissionList[i].MaxProgress)
                {
                    MissionList[i].CurrentProgress = MissionList[i].MaxProgress;
                }
                // [Explicit Continue]
                goto J0x397;
            }
            // End:0x397
            if((MissionList[i].MissionOption2 != 0) && MissionList[i].MissionOption2 == MissionOption2)
            {
                CheckMissionProgress(i, AddCount);
                MissionList[i].CurrentProgress += AddCount;
                // End:0x397
                if(MissionList[i].CurrentProgress > MissionList[i].MaxProgress)
                {
                    MissionList[i].CurrentProgress = MissionList[i].MaxProgress;
                }
            }
        }
        J0x397:

        i++;
        // [Loop Continue]
        goto J0x7D;
    }
    //return;    
}

delegate QuestLog(string Msg)
{
    //return;    
}

function UpdateQuest_Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_Kill]");
    UpdateQuest(1, WeaponType, weaponID, 1);
    //return;    
}

function UpdateQuest_AimedKill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_AimedKill]");
    QuestLog("[wMatchMaker::UpdateQuest_AimedKill]");
    UpdateQuest(2, WeaponType, weaponID, 1);
    //return;    
}

function UpdateQuest_HeadshotKill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_HeadshotKill]");
    QuestLog("[wMatchMaker::UpdateQuest_HeadshotKill]");
    UpdateQuest(4, WeaponType, weaponID, 1);
    //return;    
}

function UpdateQuest_MeeleAttackKill()
{
    Log("[wMatchMaker::UpdateQuest_MeeleAttackKill]");
    QuestLog("[wMatchMaker::UpdateQuest_MeeleAttackKill]");
    UpdateQuest(7, 0, 0, 1);
    //return;    
}

function UpdateQuest_2Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_2Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_2Kill]");
    UpdateQuest(9, 2, weaponID, 1);
    //return;    
}

function UpdateQuest_3Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_3Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_3Kill]");
    UpdateQuest(9, 3, weaponID, 1);
    //return;    
}

function UpdateQuest_4Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_4Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_4Kill]");
    UpdateQuest(9, 4, weaponID, 1);
    //return;    
}

function UpdateQuest_5Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_5Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_5Kill]");
    UpdateQuest(9, 5, weaponID, 1);
    //return;    
}

function UpdateQuest_6Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_6Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_6Kill]");
    UpdateQuest(9, 6, weaponID, 1);
    //return;    
}

function UpdateQuest_7Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_7Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_7Kill]");
    UpdateQuest(9, 7, weaponID, 1);
    //return;    
}

function UpdateQuest_8Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_8Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_8Kill]");
    UpdateQuest(9, 8, weaponID, 1);
    //return;    
}

function UpdateQuest_9Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_9Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_9Kill]");
    UpdateQuest(9, 9, weaponID, 1);
    //return;    
}

function UpdateQuest_10Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_10Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_10Kill]");
    UpdateQuest(9, 10, weaponID, 1);
    //return;    
}

function UpdateQuest_15Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_15Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_15Kill]");
    UpdateQuest(9, 15, weaponID, 1);
    //return;    
}

function UpdateQuest_Assist(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_Assist]");
    QuestLog("[wMatchMaker::UpdateQuest_Assist]");
    UpdateQuest(11, WeaponType, weaponID, 1);
    //return;    
}

function UpdateQuest_Death(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_Death]");
    QuestLog("[wMatchMaker::UpdateQuest_Death]");
    UpdateQuest(12, WeaponType, weaponID, 1);
    //return;    
}

function UpdateQuest_ExecTime(int Mode, int Map, int Min)
{
    Log("[wMatchMaker::UpdateQuest_ExecTime]");
    QuestLog("[wMatchMaker::UpdateQuest_ExecTime]");
    UpdateQuest(13, Mode, Map, Min);
    //return;    
}

function UpdateQuest_CombatTime(int Mode, int Map, int Min)
{
    Log("[wMatchMaker::UpdateQuest_CombatTime]");
    QuestLog("[wMatchMaker::UpdateQuest_CombatTime]");
    UpdateQuest(14, Mode, Map, Min);
    //return;    
}

function UpdateQuest_MatchEnd(int Mode, int Map)
{
    Log("[wMatchMaker::UpdateQuest_MatchEnd]");
    QuestLog("[wMatchMaker::UpdateQuest_MatchEnd]");
    UpdateQuest(15, Mode, Map, 1);
    //return;    
}

function UpdateQuest_KillInBotMode(int difficult, int Map)
{
    Log("[wMatchMaker::UpdateQuest_KillInBotMode]");
    QuestLog("[wMatchMaker::UpdateQuest_KillInBotMode]");
    UpdateQuest(17, difficult, Map, 1);
    //return;    
}

function UpdateQuest_MatchEndInBotMode(int difficult, int Map)
{
    Log("[wMatchMaker::UpdateQuest_MatchEndInBotMode]");
    QuestLog("[wMatchMaker::UpdateQuest_MatchEndInBotMode]");
    UpdateQuest(18, difficult, Map, 1);
    //return;    
}

function UpdateQuest_AcquireTrophy(int ItemID)
{
    Log("[wMatchMaker::UpdateQuest_AcquireTrophy]");
    QuestLog("[wMatchMaker::UpdateQuest_AcquireTrophy]");
    UpdateQuest(19, ItemID, 0, 1);
    //return;    
}

function UpdateQuest_SprintTime(int sec)
{
    Log("[wMatchMaker::UpdateQuest_SprintTime]");
    QuestLog("[wMatchMaker::UpdateQuest_SprintTime]");
    UpdateQuest(23, 0, 0, sec);
    //return;    
}

// Export UwMatchMaker::execStartMatch(FFrame&, void* const)
native function bool StartMatch(int GameRoomNum, bool bHost, optional string szHostAddr, optional int hostPortNum)
{
    //native.GameRoomNum;
    //native.bHost;
    //native.szHostAddr;
    //native.hostPortNum;        
}

// Export UwMatchMaker::execNatServerAddrStoreToEngine(FFrame&, void* const)
native function bool NatServerAddrStoreToEngine(string natServerIP1, int natServerPortNum1, string natServerIP2, int natServerPortNum2)
{
    //native.natServerIP1;
    //native.natServerPortNum1;
    //native.natServerIP2;
    //native.natServerPortNum2;        
}

// Export UwMatchMaker::execHostInitNatChecker(FFrame&, void* const)
native function bool HostInitNatChecker(int ClientUserID, string ClientIP, int clientPortNum, byte NatType, byte Intervention_Own)
{
    //native.ClientUserID;
    //native.ClientIP;
    //native.clientPortNum;
    //native.NatType;
    //native.Intervention_Own;        
}

// Export UwMatchMaker::execClientInitNatChecker(FFrame&, void* const)
native function bool ClientInitNatChecker(int HostUserID, string HostIP, int hostPortNum, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    //native.HostUserID;
    //native.HostIP;
    //native.hostPortNum;
    //native.NatType;
    //native.Intervention;
    //native.HostInnerIP;
    //native.HostInnerPort;        
}

// Export UwMatchMaker::execSetNatTypeToEngine(FFrame&, void* const)
native function bool SetNatTypeToEngine(int NatType)
{
    //native.NatType;        
}

// Export UwMatchMaker::execStartTickCheck(FFrame&, void* const)
native function bool StartTickCheck();

// Export UwMatchMaker::execForceDisconnectUDPConnectionHostSide(FFrame&, void* const)
native function bool ForceDisconnectUDPConnectionHostSide(int UserID)
{
    //native.UserID;        
}

// Export UwMatchMaker::execForceDisconnectUDPConnectionClientSide(FFrame&, void* const)
native function bool ForceDisconnectUDPConnectionClientSide();

// Export UwMatchMaker::execLowChangeServer(FFrame&, void* const)
native function bool LowChangeServer();

// Export UwMatchMaker::execLowChangeClient(FFrame&, void* const)
native function bool LowChangeClient(string HostAddr)
{
    //native.HostAddr;        
}

// Export UwMatchMaker::execLowRelayServerOn(FFrame&, void* const)
native function bool LowRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    //native.RelayServerIP;
    //native.RelayServerPortNum;        
}

// Export UwMatchMaker::execLowRelayServerOff(FFrame&, void* const)
native function bool LowRelayServerOff();

// Export UwMatchMaker::execCreateLoadingStater(FFrame&, void* const)
native function bool CreateLoadingStater(string LoginName)
{
    //native.LoginName;        
}

// Export UwMatchMaker::execDestoryLoadingStater(FFrame&, void* const)
native function bool DestoryLoadingStater();

// Export UwMatchMaker::execMakeMD5(FFrame&, void* const)
native function string MakeMD5(string strsrc)
{
    //native.strsrc;        
}

// Export UwMatchMaker::execPrintLoadingMsg(FFrame&, void* const)
native function bool PrintLoadingMsg(LoadingMessageItem Item)
{
    //native.Item;        
}

// Export UwMatchMaker::execGetStrLoadingState(FFrame&, void* const)
native function string GetStrLoadingState(byte bState)
{
    //native.bState;        
}

// Export UwMatchMaker::execCheckHolePunchingResult(FFrame&, void* const)
native function bool CheckHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    //native.Result;
    //native.Phrase;
    //native.InterventionUserID;
    //native.Intervention;
    //native.FailedUserIDs;        
}

// Export UwMatchMaker::execIsCompletedLoading(FFrame&, void* const)
native function bool IsCompletedLoading();

// Export UwMatchMaker::execSetUDPConnectionTimeLimit(FFrame&, void* const)
native function bool SetUDPConnectionTimeLimit(float fLimitSec)
{
    //native.fLimitSec;        
}

// Export UwMatchMaker::execForceDisconnectGameWithErrMessage(FFrame&, void* const)
native function bool ForceDisconnectGameWithErrMessage(string strErrMsg)
{
    //native.strErrMsg;        
}

// Export UwMatchMaker::execSetTcpTimeOutInUI(FFrame&, void* const)
native function bool SetTcpTimeOutInUI();

// Export UwMatchMaker::execSetTcpTimeOutInGame(FFrame&, void* const)
native function bool SetTcpTimeOutInGame();

// Export UwMatchMaker::execSetTcpTimeOutInTempReset(FFrame&, void* const)
native function bool SetTcpTimeOutInTempReset();

// Export UwMatchMaker::execStartHolePunchingHost(FFrame&, void* const)
native function bool StartHolePunchingHost(int GameType, int ReqStartUserID)
{
    //native.GameType;
    //native.ReqStartUserID;        
}

// Export UwMatchMaker::execStartHolePunchingClient(FFrame&, void* const)
native function bool StartHolePunchingClient(int GameType, int ReqStartUserID)
{
    //native.GameType;
    //native.ReqStartUserID;        
}

// Export UwMatchMaker::execForceSetLoadingStep(FFrame&, void* const)
native function bool ForceSetLoadingStep(int LoadingStep)
{
    //native.LoadingStep;        
}

event SetHostBlocking(bool Blocking)
{
    Log("wMatchMaker::SetHostBlocking() blocking=" $ string(Blocking));
    m_bHostBlocking = Blocking;
    //return;    
}

event bool GetHostBlocking()
{
    return m_bHostBlocking;
    //return;    
}

event BTPingCheckerLinker CreatePingChecker()
{
    // End:0x3E
    if(PingChecker == none)
    {
        PingChecker = new Class'Engine_Decompressed.BTPingCheckerLinker';
        PingChecker.m_GEngine = gEngine;
        PingChecker.m_MM = self;
    }
    return PingChecker;
    //return;    
}

function SendErrorReportS(int Code, string ct)
{
    local string concat;

    concat = (((("S@@" $ kUserName) $ "@@") $ string(Code)) $ "@@") $ ct;
    SendText(ERServerIP, ERServerPort, concat);
    //return;    
}

function SendErrorReportC(int Code, int windowtype, string ct)
{
    local string concat;

    concat = (((((("C@@" $ kUserName) $ "@@") $ string(windowtype)) $ "@@") $ string(Code)) $ "@@") $ ct;
    SendText(ERServerIP, ERServerPort, concat);
    //return;    
}

event bool SendText(string d_ip, int d_port, string dText)
{
    // End:0x3C
    if(PingChecker == none)
    {
        Log("wMatchMaker::SendText() PingChecker is none");
        return false;
    }
    return PingChecker.SendText(d_ip, d_port, dText);
    //return;    
}

event bool SendPingToOtherUser(string toAddr)
{
    // End:0x47
    if(PingChecker == none)
    {
        Log("wMatchMaker::SendPingToOtherUser() PingChecker is none");
        return false;
    }
    return PingChecker.SendPing(toAddr);
    //return;    
}

event bool SendPingToChannelServer()
{
    // End:0x4B
    if(PingChecker == none)
    {
        Log("wMatchMaker::SendPingToChannelServer() PingChecker is none");
        return false;
    }
    // End:0x98
    if(szChannelIP == "")
    {
        Log("BTPingCheckerLinker::SendPingCheckNAT() unknown channel ip.");
        return false;
    }
    return PingChecker.SendPing(szChannelIP);
    //return;    
}

function bool StartNetworkChecking(int ClientsCount, bool bConnectGame)
{
    Log((("wMatchMaker::StartNetworkChecking() ClientsCount=" $ string(ClientsCount)) $ " bConnectGame=") $ string(bConnectGame));
    // End:0xB0
    if(bPendingStarted == true)
    {
        Log("wMatchMaker::StartNetworkChecking() bPendingStarted == true. error!!");
        return false;
    }
    // End:0xD1
    if(bIsOwner == true)
    {
        ConnectClientNum = ClientsCount;
        ConnectedCount = 0;        
    }
    else
    {
        bIntervention = bConnectGame;
    }
    // End:0x144
    if((CreateLoadingStater(kUserName)) == false)
    {
        Log("wMatchMaker::StartNetworkChecking() CreateLoadingStater() return false. error!!");
        return false;
    }
    bPendingStarted = true;
    return true;
    //return;    
}

function bool FailedNetworkChecking()
{
    Log("wMatchMaker::FailedNetworkChecking()");
    // End:0x7E
    if(bPendingStarted == false)
    {
        Log("wMatchMaker::StopNetworkChecking() bPendingStarted == false. error!!");
        return false;
    }
    ResetGameFlag();
    DestoryLoadingStater();
    return true;
    //return;    
}

function string GetHostNetworkCheckFailedMsg(int LoadingStep)
{
    // End:0x75
    if((LoadingStep < 1) || LoadingStep > 6)
    {
        Log(("wMatchMaker::GetHostNetworkCheckFailedMsg() loadingStep:" $ string(LoadingStep)) $ " is invalid.");
        LoadingStep = 0;
    }
    return GetErrMsg(LoadingStep + 5007);
    //return;    
}

function string GetMyNetworkCheckFailedMsg(int LoadingStep)
{
    // End:0x73
    if((LoadingStep < 1) || LoadingStep > 6)
    {
        Log(("wMatchMaker::GetMyNetworkCheckFailedMsg() loadingStep:" $ string(LoadingStep)) $ " is invalid.");
        LoadingStep = 0;
    }
    return GetErrMsg(LoadingStep + 5000);
    //return;    
}

function SetMyTeam(int iTeam)
{
    My_iTeam = iTeam;
    //return;    
}

function wMatchUserInfo GetUserInfoByUID(int UserID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x41
        if(UserInfos[lp1].UID == UserID)
        {
            return UserInfos[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function wMatchUserInfo GetUserInfoByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x41
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1];
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function int GetUIDByUserName(string UserName)
{
    local wMatchUserInfo User;

    User = GetUserInfoByUserName(UserName);
    // End:0x25
    if(User == none)
    {
        return -1;        
    }
    else
    {
        return User.UID;
    }
    //return;    
}

function int GetUserGradeByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4A
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1].Grade;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int GetUserLevelMarkIDByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4A
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1].LevelMarkID;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

function string GetUserClanNameByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4A
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1].Clanname;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return "";
    //return;    
}

function SetNewHost(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x59 [Loop If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4F
        if(UserInfos[lp1].UserName == UserName)
        {
            UserInfos[lp1].IsHost = true;
            // [Explicit Break]
            goto J0x59;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x59:

    //return;    
}

function bool IsHost(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x59 [Loop If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4F
        if(UserInfos[lp1].IsHost)
        {
            // End:0x4F
            if(UserInfos[lp1].UserName == UserName)
            {
                return true;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function SetCurMatchState(MatchState kState)
{
    iNumTeam = kState.iNumTeam;
    iGoalRound = kState.iGoalRound;
    bFriendlyFire = bool(kState.bFriendlyFire);
    bAllowSpectate = bool(kState.bAllowSpectate);
    bAutobalance = bool(kState.bAutobalance);
    bAllowJoin = bool(kState.bAllowJoin);
    bAllow3rdPersonView = bool(kState.bAllow3rdPersonView);
    bChatVictimOnly = bool(kState.bChatVictimOnly);
    iMinutesKickAFK = kState.iMinutesKickAFK;
    iMinPlayers = kState.iMinPlayers;
    //return;    
}

function byte GetGameModeNum(string szGameClassName)
{
    // End:0x21
    if(szGameClassName == "wGame.wTeamGame")
    {
        return 0;        
    }
    else
    {
        // End:0x47
        if(szGameClassName == "wMission.wSDGameInfo")
        {
            return 1;            
        }
        else
        {
            // End:0x6E
            if(szGameClassName == "wMission.wDOMGameInfo")
            {
                return 3;                
            }
            else
            {
                // End:0x95
                if(szGameClassName == "wMission.wSBTGameInfo")
                {
                    return 4;                    
                }
                else
                {
                    // End:0xB8
                    if(szGameClassName == "wGame.wDeathMatch")
                    {
                        return 2;                        
                    }
                    else
                    {
                        return 0;
                    }
                }
            }
        }
    }
    //return;    
}

function int GetTeamCount()
{
    // End:0x21
    if(szGameClass == "wGame.wTeamGame")
    {
        return 2;        
    }
    else
    {
        // End:0x43
        if(szGameClass == "wGame.wTeam3Game")
        {
            return 3;            
        }
        else
        {
            // End:0x65
            if(szGameClass == "wGame.wDeathMatch")
            {
                return 1;                
            }
            else
            {
                return 2;
            }
        }
    }
    //return;    
}

function ResetGameFlag()
{
    Log("[CYH] MatchMaker::ResetGameFlag() called.");
    bPendingStarted = false;
    InGamePlaying = false;
    bIsLoading = false;
    IsChangeNewGuest_InLoading = false;
    IsChangeHost_InLoading = false;
    bForceGameOver = false;
    ConnectClientNum = 0;
    ConnectedCount = 0;
    bIntervention = false;
    bChangingHost = false;
    bSendedLoadingFailed = false;
    DrawChangeHost_Guest = false;
    DrawChangeHost_Host = false;
    //return;    
}

event EndMatch(optional bool bForceEndMatch)
{
    // End:0x8B
    if(InGamePlaying == true)
    {
        Log("wMatchMaker.EndMatch() called.");
        ResetGameFlag();
        // End:0x6D
        if(bForceEndMatch == true)
        {
            Console.ConsoleCommand("Disconnect bForceEndMatch");            
        }
        else
        {
            Console.ConsoleCommand("Disconnect");
        }        
    }
    else
    {
        Log("wMatchMaker.EndMatch() InGamePlaying is false. error!!");
    }
    //return;    
}

function ClearConsole()
{
    Console.ConsoleCommand("ClearConsole");
    //return;    
}

function InitializeMapSettings()
{
    MapSettings = new Class'Engine_Decompressed.wMapSettings';
    MapSettings.Initialize(self);
    //return;    
}

event Material GetLoadingImage()
{
    return Material(DynamicLoadObject(MapSettings.GetMapInfo(szMapName).ResourceLoadingImage, Class'Engine_Decompressed.Material'));
    //return;    
}

event StartLoading()
{
    bIsLoading = true;
    IsChangeNewGuest_InLoading = false;
    IsChangeHost_InLoading = false;
    bForceGameOver = false;
    DrawChangeHost_Guest = false;
    DrawChangeHost_Host = false;
    //return;    
}

event EndLoading()
{
    bIsLoading = false;
    // End:0x57
    if(bForceGameOver == true)
    {
        Log("wMatchMaker.EndLoading() bForceGameOver is true.");
        EndMatch(bForceGameOver);        
    }
    else
    {
        ProcessPendingChangeNewHostOrChangeNewGuest();
    }
    //return;    
}

event bool IsLoading()
{
    return bIsLoading;
    //return;    
}

function bool ResetChangingHostGuest()
{
    Log("[wMatchMaker::ResetChangingHostGuest]");
    IsChangeHost_InLoading = false;
    IsChangeNewGuest_InLoading = false;
    return true;
    //return;    
}

event SetChangingHostFlag(bool flag)
{
    // End:0x19
    if(InGamePlaying == true)
    {
        bChangingHost = flag;
    }
    //return;    
}

function bool ChangeHost(int ClientNum)
{
    SetHostBlocking(false);
    // End:0x51
    if(bIsLoading == true)
    {
        Log("wMatchMaker::ChangeHost() bIsLoading is true");
        PendingChangeHost(ClientNum);        
    }
    else
    {
        // End:0x6E
        if(InGamePlaying == true)
        {
            ReconnectClientNum = ClientNum;
            LowChangeServer();
        }
    }
    return true;
    //return;    
}

function bool ChangeNewGuest(string HostIP)
{
    // End:0x43
    if(bIsLoading == true)
    {
        Log("wMatchMaker::ChangeNewGuest() bIsLoading is true");        
    }
    else
    {
        // End:0xC7
        if(InGamePlaying == true)
        {
            // End:0x69
            if((IsCompletedLoading()) == true)
            {
                LowChangeClient(HostIP);                
            }
            else
            {
                Log((("wMatchMaker::ChangeNewGuest() InGamePlaying=" $ string(InGamePlaying)) $ " IsCompletedLoading()=") $ string(IsCompletedLoading()));
            }
        }
    }
    return true;
    //return;    
}

function SetChangeHostMessageFlag()
{
    Log("[CYH] SetChangeHostMessageFlag()");
    // End:0x4F
    if(InGamePlaying == true)
    {
        // End:0x47
        if(bIsOwner == true)
        {
            DrawChangeHost_Host = true;            
        }
        else
        {
            DrawChangeHost_Guest = true;
        }
    }
    //return;    
}

function PendingChangeHost(int ClientNum)
{
    IsChangeNewGuest_InLoading = false;
    IsChangeHost_InLoading = true;
    ReconnectClientNum = ClientNum;
    Log("UwMatchMaker::PendingChangeHost() pending change host.");
    //return;    
}

function PendingChangeNewGuest(string hostAddress)
{
    IsChangeHost_InLoading = false;
    IsChangeNewGuest_InLoading = true;
    newHostAddr = hostAddress;
    Log("UwMatchMaker::PendingChangeNewGuest() pending change new guest." $ hostAddress);
    //return;    
}

function ProcessPendingChangeNewHostOrChangeNewGuest()
{
    // End:0x106
    if(InGamePlaying == true)
    {
        // End:0x86
        if(IsChangeHost_InLoading == true)
        {
            Log("wMatchMaker::ProcessPendingChangeNewHostOrChangeNewGuest() IsChangeHost_InLoading is true");
            IsChangeHost_InLoading = false;
            LowChangeServer();            
        }
        else
        {
            // End:0x106
            if(IsChangeNewGuest_InLoading == true)
            {
                Log("wMatchMaker::ProcessPendingChangeNewHostOrChangeNewGuest() IsChangeNewGuest_InLoading is true");
                IsChangeNewGuest_InLoading = false;
                LowChangeClient(newHostAddr);
            }
        }
    }
    //return;    
}

event bool ForceGameOver(PlayerReplicationInfo Winner)
{
    Log("wMatchMaker::ForceGameOver()");
    // End:0x74
    if(InGamePlaying == false)
    {
        Log("[CYH] wMatchMaker::ForceGameOver() InGamePlaying is false. error!!");
        return false;
    }
    // End:0xD0
    if(bForceGameOver == true)
    {
        Log("[CYH] wMatchMaker::ForceGameOver() bForceGameOver is already true. warning!!");
    }
    // End:0x11F
    if(bIsLoading == true)
    {
        Log("[CYH] wMatchMaker::ForceGameOver() bLoading is true.");
        bForceGameOver = true;        
    }
    else
    {
        // End:0x277
        if(bIsOwner == true)
        {
            // End:0x1FC
            if((playingLevelInfo != none) && playingLevelInfo.Game != none)
            {
                // End:0x195
                if(playingLevelInfo.Game.IsInState('MatchOver') == true)
                {
                    Log("[CYH] Already In MatchOver state");
                    return false;                    
                }
                else
                {
                    Log("[CYH] wMatchmaker::ForceGameOver() force game over process");
                    playingLevelInfo.Game.EndGame(Winner, "LastMan");
                }                
            }
            else
            {
                Log("[CYH] wMatchmaker::ForceGameOver() can't access playingLevelInfo or playingLevelInfo.Game. does changing host??");
                bForceGameOver = true;
            }
        }
    }
    return true;
    //return;    
}

function GetItemDurabilityInfo(out array<int> OwnerID, out array<int> PlayedNumber, out array<int> PlayedRound, out array<BtrDouble> UniqueItemID, out array<int> UsingTime, out array<int> PlayedCount)
{
    local int i, j, k, iTemp;
    local wMatchUserInfo kUser;
    local bool bFind;

    iTemp = 0;
    J0x07:

    // End:0x2F6 [Loop If]
    if(iTemp < UserInfos.Length)
    {
        kUser = UserInfos[iTemp];
        i = 0;
        J0x2F:

        // End:0x115 [Loop If]
        if(i < kUser.EquippedItems.Length)
        {
            OwnerID[OwnerID.Length] = kUser.UID;
            PlayedNumber[PlayedNumber.Length] = kUser.TimePlayed;
            PlayedRound[PlayedRound.Length] = kUser.RoundPlayed;
            UniqueItemID[UniqueItemID.Length] = kUser.EquippedItems[i].UniqueID;
            UsingTime[UsingTime.Length] = kUser.EquippedItems[i].ItemUsedSeconds;
            PlayedCount[PlayedCount.Length] = kUser.EquippedItems[i].ItemUsedCount;
            i++;
            // [Loop Continue]
            goto J0x2F;
        }
        i = 0;
        J0x11C:

        // End:0x2EC [Loop If]
        if(i < 5)
        {
            j = 0;
            J0x12F:

            // End:0x2E2 [Loop If]
            if(j < 4)
            {
                bFind = false;
                k = 0;
                J0x14A:

                // End:0x1F7 [Loop If]
                if(k < UniqueItemID.Length)
                {
                    // End:0x1ED
                    if(__NFUN_912__(UniqueItemID[k], kUser.EquippedQSlots[i].ItemUniqueID[j]))
                    {
                        UsingTime[k] += kUser.EquippedQSlots[i].ItemUsedSeconds[j];
                        PlayedCount[k] += kUser.EquippedQSlots[i].ItemUsedCount[j];
                        bFind = true;
                        // [Explicit Break]
                        goto J0x1F7;
                    }
                    k++;
                    // [Loop Continue]
                    goto J0x14A;
                }
                J0x1F7:

                // End:0x2D8
                if(bFind == false)
                {
                    OwnerID[OwnerID.Length] = kUser.UID;
                    PlayedNumber[PlayedNumber.Length] = kUser.TimePlayed;
                    PlayedRound[PlayedRound.Length] = kUser.RoundPlayed;
                    UniqueItemID[UniqueItemID.Length] = kUser.EquippedQSlots[i].ItemUniqueID[j];
                    UsingTime[UsingTime.Length] = kUser.EquippedQSlots[i].ItemUsedSeconds[j];
                    PlayedCount[PlayedCount.Length] = kUser.EquippedQSlots[i].ItemUsedCount[j];
                }
                j++;
                // [Loop Continue]
                goto J0x12F;
            }
            i++;
            // [Loop Continue]
            goto J0x11C;
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

event ReqSuccessStartGame(int Step)
{
    OnReqSuccessStartGame(Step);
    //return;    
}

delegate OnReqSuccessStartGame(int Step)
{
    //return;    
}

event DrawOtherLoadingState(int UserID, byte bLoadingState)
{
    local int i;
    local string OtherUserName;
    local LoadingMessageItem Item;
    local bool bHost;

    OtherUserName = "Player";
    i = 0;
    J0x15:

    // End:0xA7 [Loop If]
    if(i < UserInfos.Length)
    {
        // End:0x9D
        if(UserID == UserInfos[i].UID)
        {
            OtherUserName = UserInfos[i].UserName;
            UserInfos[i].bLoadingState = bLoadingState;
            // End:0x9A
            if(UserInfos[i].IsHost == true)
            {
                bHost = true;
            }
            // [Explicit Break]
            goto J0xA7;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    J0xA7:

    Item.UserName = OtherUserName;
    Item.LoadingState = bLoadingState;
    // End:0x16E
    if(bHost == true)
    {
        Item.NameColor.R = 0;
        Item.NameColor.G = byte(255);
        Item.NameColor.B = 0;
        Item.NameColor.A = byte(255);
        Item.StateColor.R = 0;
        Item.StateColor.G = byte(255);
        Item.StateColor.B = 0;
        Item.StateColor.A = byte(255);        
    }
    else
    {
        Item.NameColor.R = byte(255);
        Item.NameColor.G = byte(255);
        Item.NameColor.B = byte(255);
        Item.NameColor.A = byte(255);
        Item.StateColor.R = byte(255);
        Item.StateColor.G = byte(255);
        Item.StateColor.B = byte(255);
        Item.StateColor.A = byte(255);
    }
    // End:0x267
    if(int(bLoadingState) == 0)
    {
        Item.StateColor.R = byte(255);
        Item.StateColor.G = 0;
        Item.StateColor.B = 0;
        Item.StateColor.A = byte(255);
    }
    PrintLoadingMsg(Item);
    //return;    
}

function SendPingToClient()
{
    local int i;
    local wMatchUserInfo kUserInfo;

    i = 0;
    J0x07:

    // End:0xBD [Loop If]
    if(i < UserInfos.Length)
    {
        kUserInfo = UserInfos[i];
        // End:0xB3
        if(kUserInfo != none)
        {
            // End:0x6F
            if(SendPingToOtherUser(kUserInfo.UserIP))
            {
                kUserInfo.bSendPing = true;
                kUserInfo.bReceivedPing = false;
                // [Explicit Continue]
                goto J0xB3;
            }
            Log(("SendPingToClient Failed : kUserInfo.UserIP[" $ kUserInfo.UserIP) $ "]");
        }
        J0xB3:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SendPingHK(string fromAddr)
{
    local int i;

    Log("[wMatchMaker::SendPingHK] fromAddr=" $ fromAddr);
    PingChecker.SendPing(fromAddr);
    i = 0;
    J0x49:

    // End:0x7F [Loop If]
    if(i < arrPingTime.Length)
    {
        // End:0x75
        if(arrPingTime[i].IP == fromAddr)
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x49;
    }
    arrPingTime.Length = arrPingTime.Length + 1;
    arrPingTime[arrPingTime.Length - 1].IP = fromAddr;
    arrPingTime[arrPingTime.Length - 1].msec = 0;
    //return;    
}

function int GetLastestPingValue(string fromAddr)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < arrPingTime.Length)
    {
        // End:0x42
        if(arrPingTime[i].IP == fromAddr)
        {
            return arrPingTime[i].msec;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return 999;
    //return;    
}

function ClearReceivedPingHK()
{
    arrPingTime.Length = 0;
    //return;    
}

function ReceivedPingHK(string fromAddr, int msec)
{
    local int i;

    Log((("[wMatchMaker::RecivedPingHK] fromAddr=" $ fromAddr) $ " msec=") $ string(msec));
    i = 0;
    J0x4B:

    // End:0x98 [Loop If]
    if(i < arrPingTime.Length)
    {
        // End:0x8E
        if(arrPingTime[i].IP == fromAddr)
        {
            arrPingTime[i].msec = msec;
            // [Explicit Break]
            goto J0x98;
        }
        i++;
        // [Loop Continue]
        goto J0x4B;
    }
    J0x98:

    OnRecivedPing(self, fromAddr, msec);
    //return;    
}

delegate OnRecivedPing(wMatchMaker MM, string fromAddr, int msec)
{
    //return;    
}

function int ReceivedPing(string fromAddr, int msec)
{
    local int i, iUserCount, iSumPing, nResult;
    local wMatchUserInfo kUserInfo;

    nResult = -1;
    // End:0x3C
    if((3 == nNatType) && fromAddr == szRelayIP)
    {
        iAvgPing = msec;
        return nResult;        
    }
    else
    {
        // End:0x5C
        if(fromAddr == szChannelIP)
        {
            iAvgPing = msec;
            return nResult;
        }
    }
    i = 0;
    J0x63:

    // End:0x120 [Loop If]
    if(i < UserInfos.Length)
    {
        kUserInfo = UserInfos[i];
        // End:0x116
        if(kUserInfo != none)
        {
            // End:0xE8
            if(kUserInfo.UserIP == fromAddr)
            {
                kUserInfo.iReceivedPing = msec;
                kUserInfo.bReceivedPing = true;
                kUserInfo.bSendPing = false;
                nResult = i;
            }
            // End:0x116
            if(kUserInfo.bReceivedPing)
            {
                iUserCount++;
                iSumPing += kUserInfo.iReceivedPing;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x63;
    }
    iAvgPing = iSumPing / iUserCount;
    return nResult;
    //return;    
}

function int CalculateHostPoint(bool bInGame)
{
    local int iPingPoint, iFPSPoint;
    local float fPingPerSec;

    // End:0x18B
    if(bInGame)
    {
        fPingPerSec = float(iAvgPing) / 1000.0000000;
        // End:0x38
        if(fPingPerSec < float(0))
        {
            iPingPoint = 1000;            
        }
        else
        {
            // End:0x51
            if(fPingPerSec <= 0.0200000)
            {
                iPingPoint = 0;                
            }
            else
            {
                // End:0x6B
                if(fPingPerSec <= 0.0350000)
                {
                    iPingPoint = 15;                    
                }
                else
                {
                    // End:0x85
                    if(fPingPerSec <= 0.5000000)
                    {
                        iPingPoint = 30;                        
                    }
                    else
                    {
                        // End:0xA2
                        if(fPingPerSec <= 1.0000000)
                        {
                            iPingPoint = 1000;                            
                        }
                        else
                        {
                            // End:0xBC
                            if(fPingPerSec > 1.0000000)
                            {
                                iPingPoint = 1000;
                            }
                        }
                    }
                }
            }
        }
        // End:0xD6
        if(iAvgFrameRate <= 30)
        {
            iFPSPoint = 1000;            
        }
        else
        {
            // End:0xF0
            if(iAvgFrameRate <= 40)
            {
                iFPSPoint = 500;                
            }
            else
            {
                // End:0x107
                if(iAvgFrameRate <= 50)
                {
                    iFPSPoint = 70;                    
                }
                else
                {
                    // End:0x11E
                    if(iAvgFrameRate <= 60)
                    {
                        iFPSPoint = 50;                        
                    }
                    else
                    {
                        // End:0x135
                        if(iAvgFrameRate <= 70)
                        {
                            iFPSPoint = 35;                            
                        }
                        else
                        {
                            // End:0x14C
                            if(iAvgFrameRate <= 80)
                            {
                                iFPSPoint = 20;                                
                            }
                            else
                            {
                                // End:0x163
                                if(iAvgFrameRate <= 90)
                                {
                                    iFPSPoint = 10;                                    
                                }
                                else
                                {
                                    // End:0x176
                                    if(iAvgFrameRate > 90)
                                    {
                                        iFPSPoint = 0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        iHostPoint = iPingPoint + iFPSPoint;        
    }
    else
    {
        // End:0x1A2
        if(kServerPing <= 20)
        {
            iPingPoint = 10;            
        }
        else
        {
            // End:0x1B9
            if(kServerPing <= 35)
            {
                iPingPoint = 20;                
            }
            else
            {
                // End:0x1D0
                if(kServerPing <= 50)
                {
                    iPingPoint = 100;                    
                }
                else
                {
                    iPingPoint = 1000;
                }
            }
        }
        iHostPoint = iPingPoint + iHardwarePoint;
    }
    // End:0x202
    if(3 == nNatType)
    {
        iHostPoint += 30;
    }
    return iHostPoint;
    //return;    
}

function int GetHostPoint()
{
    return iHostPoint;
    //return;    
}

function SetDisconnectedUser(bool bSet, optional int UserID)
{
    DisConnectedUserID = UserID;
    IsDisconnected = bSet;
    //return;    
}

function bool IsDisconnectedUser()
{
    return IsDisconnected;
    //return;    
}

function ClearFriendList()
{
    kFriendList.Length = 0;
    //return;    
}

function SetFriendListCount(int cnt)
{
    kFriendListCount = cnt;
    //return;    
}

function AddFriendList(string UserName, int ClanMark, int ClanBG, int ClanBL, string Clanname, int Level, string ServerName, string ServerShortName, string serverIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Last;

    Last = kFriendList.Length;
    kFriendList.Length = kFriendList.Length + 1;
    kFriendList[Last].UserName = UserName;
    kFriendList[Last].ClanPattern = ClanMark;
    kFriendList[Last].ClanBG = ClanBG;
    kFriendList[Last].ClanBL = ClanBL;
    kFriendList[Last].Clanname = Clanname;
    kFriendList[Last].Level = Level;
    kFriendList[Last].ServerName = ServerName;
    kFriendList[Last].ServerShortName = ServerShortName;
    kFriendList[Last].serverIP = serverIP;
    kFriendList[Last].serverPort = serverPort;
    kFriendList[Last].CurPos = byte(CurPos);
    kFriendList[Last].ChannelNum = ChannelNum;
    kFriendList[Last].ChannelNickName = ChannelNickName;
    kFriendList[Last].GameRoomNum = RoomNum;
    kFriendList[Last].ClanGrade = ClanGrade;
    kFriendList[Last].ClanWin = ClanWin;
    kFriendList[Last].ClanLose = ClanLose;
    kFriendList[Last].IsLookForClan = int(IsLookForClan);
    kFriendList[Last].ClanLevel = ClanLevel;
    kFriendList[Last].LevelMarkID = LevelMarkID;
    kFriendList[Last].LevelMarkID = LevelMarkID;
    kFriendList[Last].TitleMarkID = TitleMarkID;
    kFriendList[Last].Reserved1 = Reserved1;
    kFriendList[Last].Reserved2 = Reserved2;
    kFriendList[Last].Reserved3 = Reserved3;
    //return;    
}

function ClearPCBangList()
{
    kPCBangList.Length = 0;
    //return;    
}

function SetPCBangListCount(int cnt)
{
    kPCBangListCount = cnt;
    //return;    
}

function RemovePCBangList(string UserName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x47 [Loop If]
    if(i < kPCBangList.Length)
    {
        // End:0x3D
        if(kPCBangList[i].UserName == UserName)
        {
            kPCBangList.Remove(i, 1);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function AddPCBangList(string UserName, int ClanMark, int ClanBG, int ClanBL, string Clanname, int Level, string ServerName, string ServerShortName, string serverIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, int IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Last;

    Last = kPCBangList.Length;
    kPCBangList.Length = kPCBangList.Length + 1;
    kPCBangList[Last].UserName = UserName;
    kPCBangList[Last].ClanPattern = ClanMark;
    kPCBangList[Last].ClanBG = ClanBG;
    kPCBangList[Last].ClanBL = ClanBL;
    kPCBangList[Last].Clanname = Clanname;
    kPCBangList[Last].Level = Level;
    kPCBangList[Last].ServerName = ServerName;
    kPCBangList[Last].ServerShortName = ServerShortName;
    kPCBangList[Last].serverIP = serverIP;
    kPCBangList[Last].serverPort = serverPort;
    kPCBangList[Last].CurPos = byte(CurPos);
    kPCBangList[Last].ChannelNum = ChannelNum;
    kPCBangList[Last].ChannelNickName = ChannelNickName;
    kPCBangList[Last].GameRoomNum = RoomNum;
    kPCBangList[Last].ClanGrade = ClanGrade;
    kPCBangList[Last].ClanWin = ClanWin;
    kPCBangList[Last].ClanLose = ClanLose;
    kPCBangList[Last].IsLookForClan = IsLookForClan;
    kPCBangList[Last].ClanLevel = ClanLevel;
    kPCBangList[Last].LevelMarkID = LevelMarkID;
    kPCBangList[Last].TitleMarkID = TitleMarkID;
    kPCBangList[Last].Reserved1 = Reserved1;
    kPCBangList[Last].Reserved2 = Reserved2;
    kPCBangList[Last].Reserved3 = Reserved3;
    //return;    
}

function ClearClanList()
{
    kClanList.Length = 0;
    //return;    
}

function SetClanListCount(int cnt)
{
    kClanListCount = cnt;
    //return;    
}

function AddClanList(string UserName, int Level, string ServerName, string ServerShortName, string serverIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int IsCombat, int ClanWin, int ClanLose, string ClanSelfIntro, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Last;

    Last = kClanList.Length;
    kClanList.Length = kClanList.Length + 1;
    kClanList[Last].UserName = UserName;
    kClanList[Last].Level = Level;
    kClanList[Last].ServerName = ServerName;
    kClanList[Last].ServerShortName = ServerShortName;
    kClanList[Last].serverIP = serverIP;
    kClanList[Last].serverPort = serverPort;
    kClanList[Last].CurPos = byte(CurPos);
    kClanList[Last].ChannelNum = ChannelNum;
    kClanList[Last].ChannelNickName = ChannelNickName;
    kClanList[Last].GameRoomNum = RoomNum;
    kClanList[Last].ClanGrade = byte(ClanGrade);
    kClanList[Last].IsCombat = byte(IsCombat);
    kClanList[Last].ClanWin = ClanWin;
    kClanList[Last].ClanLose = ClanLose;
    kClanList[Last].ClanSelfIntro = ClanSelfIntro;
    kClanList[Last].LevelMarkID = LevelMarkID;
    kClanList[Last].TitleMarkID = TitleMarkID;
    kClanList[Last].Reserved1 = Reserved1;
    kClanList[Last].Reserved2 = Reserved2;
    kClanList[Last].Reserved3 = Reserved3;
    //return;    
}

function ClearBlockList()
{
    kBlockList.Length = 0;
    //return;    
}

function SetBlockListCount(int cnt)
{
    kBlockListCount = cnt;
    //return;    
}

function AddBlockList(string UserName)
{
    local int Last;

    Last = kBlockList.Length;
    kBlockList.Length = kBlockList.Length + 1;
    kBlockList[Last].UserName = UserName;
    //return;    
}

delegate UpdateFriendList(wMatchMaker MM)
{
    //return;    
}

delegate UpdateClanList(wMatchMaker MM)
{
    //return;    
}

delegate UpdatePCBangList(wMatchMaker MM)
{
    //return;    
}

delegate UpdateBlockList(wMatchMaker MM)
{
    //return;    
}

function bool IsBlockUser(string UserName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < kBlockList.Length)
    {
        // End:0x33
        if(kBlockList[i].UserName == UserName)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function bool IsFriendlyUser(string CharName, optional string Clanname)
{
    local int i;

    // End:0x1F
    if((Clanname != "") && kClanName == Clanname)
    {
        return true;
    }
    i = 0;
    J0x26:

    // End:0x5C [Loop If]
    if(i < kFriendList.Length)
    {
        // End:0x52
        if(kFriendList[i].UserName == CharName)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x26;
    }
    // End:0xA4
    if(kIsPaidPCBang == 1)
    {
        i = 0;
        J0x6E:

        // End:0xA4 [Loop If]
        if(i < kPCBangList.Length)
        {
            // End:0x9A
            if(kPCBangList[i].UserName == CharName)
            {
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x6E;
        }
    }
    return false;
    //return;    
}

function bool IsSDRespawn()
{
    local wMapInfo mapInfo;

    mapInfo = MapSettings.GetMapInfo(szMapName);
    switch(GetGameModeNum(szGameClass))
    {
        // End:0x48
        case 0:
            bSDRespawn = !bool(mapInfo.ModeTDM_RandomRespawn);
            // End:0x96
            break;
        // End:0x58
        case 1:
            bSDRespawn = false;
            // End:0x96
            break;
        // End:0x68
        case 2:
            bSDRespawn = false;
            // End:0x96
            break;
        // End:0x78
        case 3:
            bSDRespawn = false;
            // End:0x96
            break;
        // End:0x88
        case 4:
            bSDRespawn = false;
            // End:0x96
            break;
        // End:0xFFFF
        default:
            bSDRespawn = false;
            // End:0x96
            break;
            break;
    }
    return bSDRespawn;
    //return;    
}

defaultproperties
{
    bListen=true
    szGameClass="WGame.wTeamGame"
    szMapName="DM-Downtown"
    iGoalRound=1300
    bAllowJoin=true
    bAllow3rdPersonView=true
    bChatVictimOnly=true
    iMinutesKickAFK=5
    TR_bNewRespawn=true
    bMultiBomb=true
    kIsPaidPCBang=-1
    bShowFont=true
    iAvgPing=500
    BotDifficulty=1
    IsTestMode=true
    nNatType=-1
}