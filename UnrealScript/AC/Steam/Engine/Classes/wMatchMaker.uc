/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMatchMaker.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:5
 *	Structs:18
 *	Properties:325
 *	Functions:201
 *
 *******************************************************************************/
class wMatchMaker extends Object
    dependson(wItemBoxHK)
    dependson(wMapSettings)
    dependson(wMatchUserInfo)
    dependson(BTPingCheckerLinker)
    dependson(GameInfo)
    dependson(wGameSettings)
    dependson(wMapInfo)
    dependson(Interaction)
    dependson(wGameManager)
    dependson(wQuestParam)
    native;

enum WeaponLimit
{
    EWeaponLimit_Default,
    EWeaponLimit_KnifeOnly,
    EWeaponLimit_PistolOnly,
    EWeaponLimit_GrenadeOnly,
    EWeaponLimit_RPGOnly,
    EWeaponLimit_SROnly,
    EWeaponLimit_SRBan,
    EWeaponLimit_TEST,
    EWeaponLimit_SGOnly,
    EWeaponLimit_MGOnly,
    EWeaponLimit_FlameThrower,
    EWeaponLimit_End
};

enum GameModeNum
{
    Mode_TeamDeathMatch,
    Mode_SearchAndDestroy,
    Mode_FreeForAll,
    Mode_Domination,
    Mode_Sabotage
};

enum EGamePageState
{
    EGPState_None,
    EGPState_InitLoading,
    EGPState_ChannelSellect,
    EGPState_Lobby,
    EGPState_RoomLobby,
    EGPState_Store,
    EGPState_Inventory
};

enum EGameEndType
{
    E_GAME_END_TYPE_NONE0,
    E_GAME_END_TYPE_TIME_OVER,
    E_GAME_END_TYPE_NONE2,
    E_GAME_END_TYPE_NONE3,
    E_GAME_END_TYPE_NONE4,
    E_GAME_END_TYPE_DRAW,
    E_GAME_END_TYPE_PURPOSE_SCORE,
    E_GAME_END_TYPE_NONE7,
    E_GAME_END_TYPE_NONE8,
    E_GAME_END_TYPE_NONE9,
    E_GAME_END_TYPE_NONE10,
    E_GAME_END_TYPE_A_TEAM_ALL_LEAVE,
    E_GAME_END_TYPE_TWO_TEAM_ALL_LEAVE
};

enum CHANNEL_OPTION
{
    CHANNEL_OPTION_KEY_ON,
    CHANNEL_OPTION_KEY_BONUS_EXP_RATIO,
    CHANNEL_OPTION_KEY_IGNORE_ASSIST_RECORD,
    CHANNEL_OPTION_KEY_IGNORE_DEATH_RECORD,
    CHANNEL_OPTION_KEY_IGNORE_HEADSHOT_RECORD,
    CHANNEL_OPTION_KEY_IGNORE_KILL_RECORD,
    CHANNEL_OPTION_KEY_IGNORE_LOSE_RECORD,
    CHANNEL_OPTION_KEY_IGNORE_WIN_RECORD,
    CHANNEL_OPTION_KEY_LIMITATION_DEATH_HIGH,
    CHANNEL_OPTION_KEY_LIMITATION_DEATH_LOW,
    CHANNEL_OPTION_KEY_LIMITATION_KILL_HIGH,
    CHANNEL_OPTION_KEY_LIMITATION_KILL_LOW,
    CHANNEL_OPTION_KEY_LIMITATION_KILLDEATHRATIO_HIGH,
    CHANNEL_OPTION_KEY_LIMITATION_KILLDEATHRATIO_LOW,
    CHANNEL_OPTION_KEY_LIMITATION_LEVEL_HIGH,
    CHANNEL_OPTION_KEY_LIMITATION_LEVEL_LOW,
    CHANNEL_OPTION_KEY_END
};

struct native TencentLoginInfo
{
    var int UIN;
    var int GameSignatureLen;
    var byte GameSignature[128];
    var string SelectedServerIP;
    var int SelectedServerPort;
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
    var int TeamNum;
};

struct native PingTime
{
    var string IP;
    var int msec;
};

struct native FriendStruct
{
    var string UserName;
    var byte IsLogOn;
    var string ClanName;
    var int ClanPattern;
    var int ClanBG;
    var int ClanBL;
    var string ServerName;
    var string ServerShortName;
    var string ServerIP;
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
    var byte IsLogOn;
    var byte ClanGrade;
    var string ServerName;
    var string ServerShortName;
    var string ServerIP;
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
    var byte IsLogOn;
    var string ClanName;
    var int ClanPattern;
    var int ClanBG;
    var int ClanBL;
    var string ServerName;
    var string ServerShortName;
    var string ServerIP;
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
    var int width;
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
    var int QuestType;
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

var TencentLoginInfo LoginInfo;
var wMatchMaker.EGamePageState GamePageState;
var wMatchMaker.EGameEndType GameEndType;
var array<PingTime> arrPingTime;
var transient Interaction Console;
var bool bForceGameOut;
var bool bKickOut;
var bool bUsing;
var bool bIsOwner;
var bool bListen;
var bool bServerConnected;
var bool IsRelayServerOff;
var bool bSDRespawn;
var bool bForceSDRespawn;
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
var bool IsUsingTenProtect;
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
var bool kIsDSHost;
var bool kIsInDSChannel;
var bool kDS_SavedOwnerInfo;
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
var BTTcpLink_Process2Agent kTcpDStoDP;
var int kDediServerID;
var int kDediChannelNum;
var int kDediRoomNum;
var int kPID;
var bool kDediIsConnectedWithServer;
var bool kCharacterCreation;
var byte kInterfaceGuideStep;
var bool kFirstTutorial;
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
var int kPCBangType;
var bool kClanLookingFor;
var string kPrevClanName;
var string kClanName;
var int kClanPattern;
var int kClanBG;
var int kClanBL;
var int kInClanGrade;
var bool bInverseWeapon;
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
var byte GMLevelFlag;
var bool isGMRoom;
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
var int kCCoinCash;
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
var int DefaultSupportModeIdx;
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
var byte My_AASLevel;
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
var bool bShowWarningHostPoint;
var int iHardwarePoint;
var int iAvgFrameRate;
var int iAvgPing;
var int iHostPoint;
var bool bShowMessageHostUnsuitableness;
var array<wMatchUserInfo> UserInfos;
var int GmUserNum;
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
var bool bCompletedBotTutorial;
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
var bool IsFixedAssistPoint;
var float FixedAssistTime;
var string lastBuyItemName;
var int lastBuyItemType;
var int lastBuyItemGrade;
var string ERServerIP;
var int ERServerPort;
var int MinimapMode;
var array<int> ChannelRestrictionMaps;
var array<int> ChannelRestrictionModes;
var delegate<CMDHK> __CMDHK__Delegate;
var delegate<UpdatePCBangInfo> __UpdatePCBangInfo__Delegate;
var delegate<UpdateGameRoomInfo> __UpdateGameRoomInfo__Delegate;
var delegate<UpdateCharInfo> __UpdateCharInfo__Delegate;
var delegate<UpdateRankingInfo> __UpdateRankingInfo__Delegate;
var delegate<UpdateEquipItemInfo> __UpdateEquipItemInfo__Delegate;
var delegate<UpdateMoneyInfo> __UpdateMoneyInfo__Delegate;
var delegate<UpdateClanInfo> __UpdateClanInfo__Delegate;
var delegate<UpdatePositionInfo> __UpdatePositionInfo__Delegate;
var delegate<UpdateRecv_CharInfo> __UpdateRecv_CharInfo__Delegate;
var delegate<UpdateQuestList> __UpdateQuestList__Delegate;
var delegate<AccomplishMission25Percent> __AccomplishMission25Percent__Delegate;
var delegate<AccomplishMission50Percent> __AccomplishMission50Percent__Delegate;
var delegate<AccomplishMission75Percent> __AccomplishMission75Percent__Delegate;
var delegate<AccomplishMission100Percent> __AccomplishMission100Percent__Delegate;
var delegate<QuestLog> __QuestLog__Delegate;
var delegate<OnReqSuccessStartGame> __OnReqSuccessStartGame__Delegate;
var delegate<OnRecivedPing> __OnRecivedPing__Delegate;
var delegate<UpdateFriendList> __UpdateFriendList__Delegate;
var delegate<UpdateClanList> __UpdateClanList__Delegate;
var delegate<UpdatePCBangList> __UpdatePCBangList__Delegate;
var delegate<UpdateBlockList> __UpdateBlockList__Delegate;

function bool IsChannelRestrictionModes(int ModeNum)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < ChannelRestrictionModes.Length)
    {
        // End:0x2e
        if(ChannelRestrictionModes[i] == ModeNum)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool IsChannelRestrictionMaps(int MapNum)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < ChannelRestrictionMaps.Length)
    {
        // End:0x2e
        if(ChannelRestrictionMaps[i] == MapNum)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

delegate CMDHK(int Index, optional string Param1, optional string Param2, optional string param3);
delegate UpdatePCBangInfo(wMatchMaker MM);
delegate UpdateGameRoomInfo(wMatchMaker MM);
delegate UpdateCharInfo(wMatchMaker MM);
delegate UpdateRankingInfo(wMatchMaker MM);
delegate UpdateEquipItemInfo(wMatchMaker MM);
delegate UpdateMoneyInfo(wMatchMaker MM);
delegate UpdateClanInfo(wMatchMaker MM);
delegate UpdatePositionInfo(wMatchMaker MM);
delegate UpdateRecv_CharInfo(wMatchMaker MM);
delegate UpdateQuestList(wMatchMaker MM);
function UpdateCharInfoAndReqClanUserList()
{
    Log("[wMatchMaker::UpdateCharInfoAndReqClanUserList]");
    UpdateCharInfo(self);
    // End:0x6c
    if(kClanName != kPrevClanName)
    {
        // End:0x6c
        if(kTcpChannel != none)
        {
            kTcpChannel.sfReqClanUserList(kClanName);
        }
    }
    kPrevClanName = kClanName;
}

function PI_EnterChannel(int ServerGroupID, string ServerGroupName, int ServerID, string ServerName, int ChannelID, string ChannelName, optional bool bClanWarChannel, optional int ChannelTypeValue, optional bool IsDedicatedServer)
{
    kServerGroupID = ServerGroupID;
    kServerGroupName = ServerGroupName;
    kServerID = ServerID;
    kServerName = ServerName;
    kChannelID = ChannelID;
    kChannelName = ChannelName;
    kRoomID = -1;
    kTeamID = -1;
    kIsInDSChannel = IsDedicatedServer;
    Log("[wMatchMaker::PI_EnterChannel()] kServerGruopID=" $ string(kServerGroupID));
    Log("[wMatchMaker::PI_EnterChannel()] kServerGroupName=" $ kServerGroupName);
    Log("[wMatchMaker::PI_EnterChannel()] kServerID=" $ string(kServerID));
    Log("[wMatchMaker::PI_EnterChannel()] kServerName=" $ kServerName);
    Log("[wMatchMaker::PI_EnterChannel()] kChannelID=" $ string(kChannelID));
    Log("[wMatchMaker::PI_EnterChannel()] kChannelName=" $ kChannelName);
    Log("[wMatchMaker::PI_EnterChannel()] kIsInDSChannel=" $ string(kIsInDSChannel));
    Log("[wMatchMaker::PI_EnterChannel()] ChannelTypeValue=" $ string(ChannelTypeValue));
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
    kIsInDSChannel = false;
}

function PI_EnterRoom(int RoomID, int TeamID)
{
    kRoomID = RoomID;
    kTeamID = TeamID;
    ClearGMList();
}

function ClearGMList()
{
    kGMListInGameRoom.Length = 0;
}

function AddGMList(int GMUID)
{
    kGMListInGameRoom.Length = kGMListInGameRoom.Length + 1;
    kGMListInGameRoom[kGMListInGameRoom.Length - 1] = GMUID;
}

function RemoveGMList(int GMUID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < kGMListInGameRoom.Length)
    {
        // End:0x3b
        if(kGMListInGameRoom[i] == GMUID)
        {
            kGMListInGameRoom.Remove(i, 1);
        }
        // End:0x45
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function PI_LeavelRoom()
{
    kRoomID = -1;
    kTeamID = -1;
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
}

function bool IsClanMember()
{
    // End:0x20
    if(kClanName == "" || kClanName == "none")
    {
        return false;
    }
    return true;
}

function bool IsClanGrade(int Grade)
{
    // End:0x11
    if(kInClanGrade == Grade)
    {
        return true;
    }
    return false;
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
    // End:0x5c
    else
    {
        Console.ConsoleCommand("BlockAltTab");
    }
    Log("SetCurPos(" $ string(kCurPos) $ "," $ string(kCurSubPos) $ ")");
}

function SetCurSubPos(int CurSubPos)
{
    kCurSubPos = CurSubPos;
    // End:0x35
    if(IsEnableAltTab())
    {
        Console.ConsoleCommand("UnBlockAltTab");
    }
    // End:0x51
    else
    {
        Console.ConsoleCommand("BlockAltTab");
    }
    Log("SetCurPos(" $ string(kCurPos) $ "," $ string(kCurSubPos) $ ")");
}

function bool IsEnableAltTab()
{
    // End:0x29
    if(kCurPos == 2 || kCurPos == 3 && kCurSubPos == 0)
    {
        return false;
    }
    return true;
}

function AddQuest(int QuestID)
{
    QuestList.Length = QuestList.Length + 1;
    QuestList[QuestList.Length - 1].QuestID = QuestID;
    QuestList[QuestList.Length - 1].CurrentProgress = 0;
    bSortQuestList = false;
}

function RemoveQuest(int QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x56 [While If]
    if(i < QuestList.Length)
    {
        // End:0x4c
        if(QuestList[i].QuestID == QuestID)
        {
            QuestList.Remove(i, 1);
            -- i;
            bSortQuestList = false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function AddQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < QuestID.Length)
    {
        AddQuest(QuestID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < QuestID.Length)
    {
        RemoveQuest(QuestID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function AddDailyQuest(int QuestID)
{
    AddQuest(QuestID);
    NewQuestList.Length = NewQuestList.Length + 1;
    NewQuestList[NewQuestList.Length - 1] = QuestID;
}

function RemoveDailyQuest(int QuestID)
{
    local int i;

    RemoveQuest(QuestID);
    i = 0;
    J0x12:
    // End:0x54 [While If]
    if(i < NewQuestList.Length)
    {
        // End:0x4a
        if(NewQuestList[i] == QuestID)
        {
            NewQuestList.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
}

function AddDailyQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < QuestID.Length)
    {
        AddDailyQuest(QuestID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveDailyQuestArray(array<int> QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x32 [While If]
    if(i < QuestID.Length)
    {
        RemoveDailyQuest(QuestID[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int FindQuest(int nQuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < QuestList.Length)
    {
        // End:0x37
        if(QuestList[i].QuestID == nQuestID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function SortQuestList(wGameManager GameMgr)
{
    local int i, j, nTemp;
    local wQuestParam QuestParam;
    local QuestItem QuestItemTemp;
    local array<int> DisplayOderList;

    // End:0x0e
    if(bSortQuestList == true)
    {
        return;
    }
    i = 0;
    J0x15:
    // End:0x6e [While If]
    if(i < QuestList.Length)
    {
        QuestParam = GameMgr.GetQuestInfo(QuestList[i].QuestID);
        DisplayOderList[i] = QuestParam.DisplayOrder;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    i = 0;
    J0x75:
    // End:0x147 [While If]
    if(i < QuestList.Length - 1)
    {
        j = i + 1;
        J0x96:
        // End:0x13d [While If]
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
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x96;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x75;
    }
    bSortQuestList = true;
}

function GenerateMissionList(wGameManager GameMgr)
{
    local int i;
    local wQuestParam q;
    local BtrDouble CurrentTime;

    CurrentTime = GameMgr.GetClientTime(true);
    MissionList.Length = QuestList.Length;
    i = 0;
    J0x2a:
    // End:0x28a [While If]
    if(i < QuestList.Length)
    {
        q = GameMgr.GetQuestInfo(QuestList[i].QuestID);
        // End:0x76
        if(q.QuestID <= 0)
        {
        }
        // End:0x280
        else
        {
            // End:0x9a
            if(q.LimitArea != 0 && !IsPlayingPCBang())
            {
            }
            // End:0x280
            else
            {
                // End:0xca
                if(q.IsEventQuest() && !q.IsEnabledEventQuest(CurrentTime))
                {
                }
                // End:0x280
                else
                {
                    MissionList[i].QuestType = q.QuestType;
                    MissionList[i].QuestID = q.QuestID;
                    MissionList[i].MissionType = q.MissionType;
                    MissionList[i].MissionDesc = q.QuestMissionDesc;
                    MissionList[i].MissionOption1 = q.MissionOption[0];
                    MissionList[i].MissionOption2 = q.MissionOption[1];
                    MissionList[i].MissionBotMode = q.MissionBotMode;
                    MissionList[i].CurrentProgress = QuestList[i].CurrentProgress;
                    MissionList[i].MaxProgress = q.MissionCount;
                    Log("[wMatchMaker::GenerateMissionList] MID=" $ string(MissionList[i].QuestID) $ ", MO1=" $ string(MissionList[i].MissionOption1) $ ", MO1=" $ string(MissionList[i].MissionOption2) $ ", MCP=" $ string(MissionList[i].CurrentProgress));
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2a;
    }
    TMissionList.Length = MissionList.Length;
    i = 0;
    J0x29e:
    // End:0x2cf [While If]
    if(i < MissionList.Length)
    {
        TMissionList[i] = MissionList[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x29e;
    }
    Quest_LastUpdateTime = 0.0;
    Log("[wMatchMaker::GenerateMissionList] MissionList.Length=" $ string(MissionList.Length));
}

delegate AccomplishMission25Percent(string MissionDesc, int cur, int Max);
delegate AccomplishMission50Percent(string MissionDesc, int cur, int Max);
delegate AccomplishMission75Percent(string MissionDesc, int cur, int Max);
delegate AccomplishMission100Percent(string MissionDesc, int cur, int Max);
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
    Log("[wMatchMaker::CheckMissionProgress] QuestID=" $ string(MissionList[i].QuestID) $ ", MType=" $ string(MissionList[i].MissionType) $ ", AddCount=" $ string(AddCount) $ ", PrevPerc=" $ string(prevperc) $ ", CurPerc=" $ string(currperc));
    // End:0x196
    if(prevperc == currperc)
    {
        Log("[wMatchMaker::CheckMissionProgress] PrevPerc==CurPerc return");
        return;
    }
    // End:0x21e
    if(currperc >= 1.0 && prevperc < 1.0)
    {
        Log("[wMatchMaker::CheckMissionProgress] Accomplish100%");
        AccomplishMission100Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);
    }
    // End:0x3b0
    else
    {
        // End:0x2a5
        if(currperc >= 0.750 && prevperc < 0.750)
        {
            Log("[wMatchMaker::CheckMissionProgress] Accomplish75%");
            AccomplishMission75Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);
        }
        // End:0x3b0
        else
        {
            // End:0x32c
            if(currperc >= 0.50 && prevperc < 0.50)
            {
                Log("[wMatchMaker::CheckMissionProgress] Accomplish50%");
                AccomplishMission50Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);
            }
            // End:0x3b0
            else
            {
                // End:0x3b0
                if(currperc >= 0.250 && prevperc < 0.250)
                {
                    Log("[wmatchMaker::CheckMissionProgress] Accomplish25%");
                    AccomplishMission25Percent(MissionList[i].MissionDesc, SaveCurrentProgress, MissionList[i].MaxProgress);
                }
            }
        }
    }
}

function UpdateQuest(int MissionType, int MissionOption1, int MissionOption2, int AddCount)
{
    local int i;

    Log("[wMatchMaker::UpdateQuest] MType=" $ string(MissionType) $ ", MOption1=" $ string(MissionOption1) $ ", MOption2=" $ string(MissionOption2) $ ", AddCount=" $ string(AddCount));
    i = 0;
    J0x7d:
    // End:0x3a1 [While If]
    if(i < MissionList.Length)
    {
        // End:0x397
        if(MissionList[i].MissionType == MissionType)
        {
            // End:0xe4
            if(MissionList[i].MissionBotMode == 0 && InGamePlaying && class'wGameSettings'.static.IsBotModeIndex(kGame_GameMode))
            {
            }
            // End:0x397
            else
            {
                // End:0x182
                if(MissionList[i].MissionOption1 == 0 && MissionList[i].MissionOption2 == 0)
                {
                    CheckMissionProgress(i, AddCount);
                    MissionList[i].CurrentProgress += AddCount;
                    // End:0x17f
                    if(MissionList[i].CurrentProgress > MissionList[i].MaxProgress)
                    {
                        MissionList[i].CurrentProgress = MissionList[i].MaxProgress;
                    }
                }
                // End:0x397
                else
                {
                    // End:0x256
                    if(MissionList[i].MissionOption1 != 0 && MissionList[i].MissionOption2 != 0)
                    {
                        // End:0x253
                        if(MissionList[i].MissionOption1 == MissionOption1 && MissionList[i].MissionOption2 == MissionOption2)
                        {
                            CheckMissionProgress(i, AddCount);
                            MissionList[i].CurrentProgress += AddCount;
                            // End:0x253
                            if(MissionList[i].CurrentProgress > MissionList[i].MaxProgress)
                            {
                                MissionList[i].CurrentProgress = MissionList[i].MaxProgress;
                            }
                        }
                    }
                    // End:0x397
                    else
                    {
                        // End:0x2f8
                        if(MissionList[i].MissionOption1 != 0 && MissionList[i].MissionOption1 == MissionOption1)
                        {
                            CheckMissionProgress(i, AddCount);
                            MissionList[i].CurrentProgress += AddCount;
                            // End:0x2f5
                            if(MissionList[i].CurrentProgress > MissionList[i].MaxProgress)
                            {
                                MissionList[i].CurrentProgress = MissionList[i].MaxProgress;
                            }
                        }
                        // End:0x397
                        else
                        {
                            // End:0x397
                            if(MissionList[i].MissionOption2 != 0 && MissionList[i].MissionOption2 == MissionOption2)
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
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7d;
    }
}

function UpdateTutorial(int QuestID, int AddCount)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6b [While If]
    if(i < MissionList.Length)
    {
        // End:0x61
        if(8 == MissionList[i].QuestType && QuestID == MissionList[i].QuestID)
        {
            MissionList[i].CurrentProgress += AddCount;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int GetNextQuestID()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6e [While If]
    if(i < MissionList.Length)
    {
        // End:0x64
        if(8 == MissionList[i].QuestType)
        {
            // End:0x64
            if(MissionList[i].CurrentProgress < MissionList[i].MaxProgress)
            {
                return MissionList[i].QuestID;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

delegate QuestLog(string Msg);
function UpdateQuest_Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_Kill]");
    UpdateQuest(1, WeaponType, weaponID, 1);
}

function UpdateQuest_AimedKill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_AimedKill]");
    QuestLog("[wMatchMaker::UpdateQuest_AimedKill]");
    UpdateQuest(2, WeaponType, weaponID, 1);
}

function UpdateQuest_HeadshotKill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_HeadshotKill]");
    QuestLog("[wMatchMaker::UpdateQuest_HeadshotKill]");
    UpdateQuest(4, WeaponType, weaponID, 1);
}

function UpdateQuest_MeeleAttackKill()
{
    Log("[wMatchMaker::UpdateQuest_MeeleAttackKill]");
    QuestLog("[wMatchMaker::UpdateQuest_MeeleAttackKill]");
    UpdateQuest(7, 0, 0, 1);
}

function UpdateQuest_2Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_2Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_2Kill]");
    UpdateQuest(9, 2, weaponID, 1);
}

function UpdateQuest_3Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_3Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_3Kill]");
    UpdateQuest(9, 3, weaponID, 1);
}

function UpdateQuest_4Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_4Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_4Kill]");
    UpdateQuest(9, 4, weaponID, 1);
}

function UpdateQuest_5Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_5Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_5Kill]");
    UpdateQuest(9, 5, weaponID, 1);
}

function UpdateQuest_6Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_6Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_6Kill]");
    UpdateQuest(9, 6, weaponID, 1);
}

function UpdateQuest_7Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_7Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_7Kill]");
    UpdateQuest(9, 7, weaponID, 1);
}

function UpdateQuest_8Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_8Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_8Kill]");
    UpdateQuest(9, 8, weaponID, 1);
}

function UpdateQuest_9Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_9Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_9Kill]");
    UpdateQuest(9, 9, weaponID, 1);
}

function UpdateQuest_10Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_10Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_10Kill]");
    UpdateQuest(9, 10, weaponID, 1);
}

function UpdateQuest_15Kill(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_15Kill]");
    QuestLog("[wMatchMaker::UpdateQuest_15Kill]");
    UpdateQuest(9, 15, weaponID, 1);
}

function UpdateQuest_Assist(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_Assist]");
    QuestLog("[wMatchMaker::UpdateQuest_Assist]");
    UpdateQuest(11, WeaponType, weaponID, 1);
}

function UpdateQuest_Death(int WeaponType, int weaponID)
{
    Log("[wMatchMaker::UpdateQuest_Death]");
    QuestLog("[wMatchMaker::UpdateQuest_Death]");
    UpdateQuest(12, WeaponType, weaponID, 1);
}

function UpdateQuest_ExecTime(int Mode, int Map, int Min)
{
    Log("[wMatchMaker::UpdateQuest_ExecTime]");
    QuestLog("[wMatchMaker::UpdateQuest_ExecTime]");
    UpdateQuest(13, Mode, Map, Min);
}

function UpdateQuest_CombatTime(int Mode, int Map, int Min)
{
    Log("[wMatchMaker::UpdateQuest_CombatTime]");
    QuestLog("[wMatchMaker::UpdateQuest_CombatTime]");
    UpdateQuest(14, Mode, Map, Min);
}

function UpdateQuest_MatchEnd(int Mode, int Map)
{
    Log("[wMatchMaker::UpdateQuest_MatchEnd]");
    QuestLog("[wMatchMaker::UpdateQuest_MatchEnd]");
    UpdateQuest(15, Mode, Map, 1);
}

function UpdateQuest_KillInBotMode(int difficult, int Map)
{
    Log("[wMatchMaker::UpdateQuest_KillInBotMode]");
    QuestLog("[wMatchMaker::UpdateQuest_KillInBotMode]");
    UpdateQuest(17, difficult, Map, 1);
}

function UpdateQuest_MatchEndInBotMode(int difficult, int Map)
{
    Log("[wMatchMaker::UpdateQuest_MatchEndInBotMode]");
    QuestLog("[wMatchMaker::UpdateQuest_MatchEndInBotMode]");
    UpdateQuest(18, difficult, Map, 1);
}

function UpdateQuest_AcquireTrophy(int ItemID)
{
    Log("[wMatchMaker::UpdateQuest_AcquireTrophy]");
    QuestLog("[wMatchMaker::UpdateQuest_AcquireTrophy]");
    UpdateQuest(19, ItemID, 0, 1);
}

function UpdateQuest_SprintTime(int sec)
{
    Log("[wMatchMaker::UpdateQuest_SprintTime]");
    QuestLog("[wMatchMaker::UpdateQuest_SprintTime]");
    UpdateQuest(23, 0, 0, sec);
}

function UpdateQuest_MatchCompletedInBotMode(int Level)
{
    Log("[wMatchMaker::UpdateQuest_MatchCompletedInBotMode]");
    QuestLog("[wMatchMaker::UpdateQuest_MatchCompletedInBotMode]");
    UpdateQuest(24, Level, 0, 1);
}

function UpdateQuest_RoundCompletedInBotMode(int Level, int CompletedRound)
{
    Log("[wMatchMaker::UpdateQuest_RoundCompletedInBotMode]");
    QuestLog("[wMatchMaker::UpdateQuest_RoundCompletedInBotMode]");
    UpdateQuest(25, Level, CompletedRound, 1);
}

function UpdateQuest_WinnerInBotMode(int Level, int RecodeType)
{
    Log("[wMatchMaker::UpdateQuest_RoundCompletedInBotMode]");
    QuestLog("[wMatchMaker::UpdateQuest_RoundCompletedInBotMode]");
    UpdateQuest(26, Level, RecodeType, 1);
}

// Export UwMatchMaker::execStartMatch(FFrame&, void* const)
native function bool StartMatch(int GameRoomNum, bool bHost, optional string szHostAddr, optional int hostPortNum);
// Export UwMatchMaker::execNatServerAddrStoreToEngine(FFrame&, void* const)
native function bool NatServerAddrStoreToEngine(string natServerIP1, int natServerPortNum1, string natServerIP2, int natServerPortNum2);
// Export UwMatchMaker::execHostInitNatChecker(FFrame&, void* const)
native function bool HostInitNatChecker(int ClientUserID, string ClientIP, int clientPortNum, byte NatType, byte Intervention_Own);
// Export UwMatchMaker::execClientInitNatChecker(FFrame&, void* const)
native function bool ClientInitNatChecker(int HostUserID, string HostIP, int hostPortNum, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort);
// Export UwMatchMaker::execSetNatTypeToEngine(FFrame&, void* const)
native function bool SetNatTypeToEngine(int NatType);
// Export UwMatchMaker::execStartTickCheck(FFrame&, void* const)
native function bool StartTickCheck();
// Export UwMatchMaker::execForceDisconnectUDPConnectionHostSide(FFrame&, void* const)
native function bool ForceDisconnectUDPConnectionHostSide(int UserID);
// Export UwMatchMaker::execForceDisconnectUDPConnectionClientSide(FFrame&, void* const)
native function bool ForceDisconnectUDPConnectionClientSide();
// Export UwMatchMaker::execLowChangeServer(FFrame&, void* const)
native function bool LowChangeServer();
// Export UwMatchMaker::execLowChangeClient(FFrame&, void* const)
native function bool LowChangeClient(string HostAddr);
// Export UwMatchMaker::execLowRelayServerOn(FFrame&, void* const)
native function bool LowRelayServerOn(string RelayServerIP, int RelayServerPortNum);
// Export UwMatchMaker::execLowRelayServerOff(FFrame&, void* const)
native function bool LowRelayServerOff();
// Export UwMatchMaker::execCreateLoadingStater(FFrame&, void* const)
native function bool CreateLoadingStater(string LoginName);
// Export UwMatchMaker::execDestoryLoadingStater(FFrame&, void* const)
native function bool DestoryLoadingStater();
// Export UwMatchMaker::execMakeMD5(FFrame&, void* const)
native function string MakeMD5(string strsrc);
// Export UwMatchMaker::execPrintLoadingMsg(FFrame&, void* const)
native function bool PrintLoadingMsg(LoadingMessageItem Item);
// Export UwMatchMaker::execGetStrLoadingState(FFrame&, void* const)
native function string GetStrLoadingState(byte bState);
// Export UwMatchMaker::execCheckHolePunchingResult(FFrame&, void* const)
native function bool CheckHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs);
// Export UwMatchMaker::execIsCompletedLoading(FFrame&, void* const)
native function bool IsCompletedLoading();
// Export UwMatchMaker::execSetUDPConnectionTimeLimit(FFrame&, void* const)
native function bool SetUDPConnectionTimeLimit(float fLimitSec);
// Export UwMatchMaker::execForceDisconnectGameWithErrMessage(FFrame&, void* const)
native function bool ForceDisconnectGameWithErrMessage(string strErrMsg);
// Export UwMatchMaker::execSetTcpTimeOutInUI(FFrame&, void* const)
native function bool SetTcpTimeOutInUI();
// Export UwMatchMaker::execSetTcpTimeOutInGame(FFrame&, void* const)
native function bool SetTcpTimeOutInGame();
// Export UwMatchMaker::execSetTcpTimeOutInTempReset(FFrame&, void* const)
native function bool SetTcpTimeOutInTempReset();
// Export UwMatchMaker::execStartHolePunchingHost(FFrame&, void* const)
native function bool StartHolePunchingHost(int GameType, int ReqStartUserID);
// Export UwMatchMaker::execStartHolePunchingClient(FFrame&, void* const)
native function bool StartHolePunchingClient(int GameType, int ReqStartUserID);
// Export UwMatchMaker::execForceSetLoadingStep(FFrame&, void* const)
native function bool ForceSetLoadingStep(int LoadingStep);
// Export UwMatchMaker::execConsoleCmd_DS(FFrame&, void* const)
native function bool ConsoleCmd_DS(string strCmd);
// Export UwMatchMaker::execGetClientVersion(FFrame&, void* const)
native function int GetClientVersion();
// Export UwMatchMaker::execTenProtectSetInitData(FFrame&, void* const)
native function bool TenProtectSetInitData();
// Export UwMatchMaker::execTenProtectSendInitData(FFrame&, void* const)
native function bool TenProtectSendInitData();
// Export UwMatchMaker::execTenProtectStartLocalOnceCheck(FFrame&, void* const)
native function bool TenProtectStartLocalOnceCheck();
// Export UwMatchMaker::execTenProtectStopLocalCheck(FFrame&, void* const)
native function bool TenProtectStopLocalCheck();
// Export UwMatchMaker::execTenProtectUpdate_AntiBot(FFrame&, void* const)
native function bool TenProtectUpdate_AntiBot();
// Export UwMatchMaker::execTenProtectDProtoDecrypt(FFrame&, void* const)
native function bool TenProtectDProtoDecrypt();
// Export UwMatchMaker::execTenProtectDProtoEncrypt(FFrame&, void* const)
native function bool TenProtectDProtoEncrypt();
// Export UwMatchMaker::execTenProtectCreate(FFrame&, void* const)
native function bool TenProtectCreate(int QQUserID);
// Export UwMatchMaker::execTenProtectRelease(FFrame&, void* const)
native function bool TenProtectRelease();
// Export UwMatchMaker::execMakeHSResponseData(FFrame&, void* const)
native function MakeHSResponseData(array<byte> Data, out array<byte> Result);
event SetHostBlocking(bool Blocking)
{
    Log("wMatchMaker::SetHostBlocking() blocking=" $ string(Blocking));
    m_bHostBlocking = Blocking;
}

event bool GetHostBlocking()
{
    return m_bHostBlocking;
}

event BTPingCheckerLinker CreatePingChecker()
{
    // End:0x3e
    if(PingChecker == none)
    {
        PingChecker = new class'BTPingCheckerLinker';
        PingChecker.m_GEngine = gEngine;
        PingChecker.m_MM = self;
    }
    return PingChecker;
}

function SendErrorReportS(int Code, string ct);
function SendErrorReportC(int Code, int windowtype, string ct);
event bool SendText(string d_ip, int d_port, string dText)
{
    // End:0x3c
    if(PingChecker == none)
    {
        Log("wMatchMaker::SendText() PingChecker is none");
        return false;
    }
    return PingChecker.SendText(d_ip, d_port, dText);
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
}

event bool SendPingToChannelServer()
{
    // End:0x4b
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
}

function bool StartNetworkChecking(int ClientsCount, bool bConnectGame)
{
    Log("wMatchMaker::StartNetworkChecking() ClientsCount=" $ string(ClientsCount) $ " bConnectGame=" $ string(bConnectGame));
    // End:0xe3
    if(bPendingStarted == true)
    {
        Log("wMatchMaker::StartNetworkChecking() bPendingStarted == true. error!!");
        UnresolvedNativeFunction_97("LoadingInfo - bPendingStarted ==          true");
        return false;
    }
    // End:0x104
    if(bIsOwner == true)
    {
        ConnectClientNum = ClientsCount;
        ConnectedCount = 0;
    }
    // End:0x111
    else
    {
        bIntervention = bConnectGame;
    }
    // End:0x1c9
    if(kIsDSHost)
    {
        Log("CreateLoadingStater");
        // End:0x1c6
        if(CreateLoadingStater(kUserName) == false)
        {
            Log("wMatchMaker::StartNetworkChecking() CreateLoadingStater() return false. error!!");
            UnresolvedNativeFunction_97("LoadingInfo - Failed create loading stater");
            return false;
        }
    }
    // End:0x25e
    else
    {
        // End:0x25e
        if(CreateLoadingStater(kUserName) == false)
        {
            Log("wMatchMaker::StartNetworkChecking() CreateLoadingStater() return false. error!!");
            UnresolvedNativeFunction_97("LoadingInfo - Failed create loading stater");
            return false;
        }
    }
    bPendingStarted = true;
    return true;
}

function bool FailedNetworkChecking()
{
    Log("wMatchMaker::FailedNetworkChecking()");
    // End:0x7e
    if(bPendingStarted == false)
    {
        Log("wMatchMaker::StopNetworkChecking() bPendingStarted == false. error!!");
        return false;
    }
    ResetGameFlag();
    DestoryLoadingStater();
    return true;
}

function string GetHostNetworkCheckFailedMsg(int LoadingStep)
{
    // End:0x75
    if(LoadingStep < 1 || LoadingStep > 6)
    {
        Log("wMatchMaker::GetHostNetworkCheckFailedMsg() loadingStep:" $ string(LoadingStep) $ " is invalid.");
        LoadingStep = 0;
    }
    return GetErrMsg(LoadingStep + 5007);
}

function string GetMyNetworkCheckFailedMsg(int LoadingStep)
{
    // End:0x73
    if(LoadingStep < 1 || LoadingStep > 6)
    {
        Log("wMatchMaker::GetMyNetworkCheckFailedMsg() loadingStep:" $ string(LoadingStep) $ " is invalid.");
        LoadingStep = 0;
    }
    return GetErrMsg(LoadingStep + 5000);
}

function SetMyTeam(int iTeam)
{
    My_iTeam = iTeam;
}

function wMatchUserInfo GetUserInfoByUID(int UserID)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x4b [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x41
        if(UserInfos[lp1].UID == UserID)
        {
            return UserInfos[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function wMatchUserInfo GetUserInfoByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x4b [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x41
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1];
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
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
    // End:0x34
    else
    {
        return User.UID;
    }
}

function int GetUserGradeByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x54 [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4a
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1].Grade;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x8d
    if(PlayWithBots)
    {
        switch(BotDifficulty)
        {
            // End:0x6a
            case 1:
                return 1;
            // End:0x72
            case 2:
                return 6;
            // End:0x7a
            case 3:
                return 16;
            // End:0x82
            case 4:
                return 33;
            // End:0x8a
            case 5:
                return 50;
            // End:0xffff
            default:
            }
            return -1;
}

function bool ReplaceUserName(string OldName, string NewName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x5b [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x51
        if(UserInfos[lp1].UserName == OldName)
        {
            UserInfos[lp1].UserName = NewName;
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function int GetUserLevelMarkIDByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x54 [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4a
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1].LevelMarkID;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 0;
}

function string GetUserClanNameByUserName(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x54 [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4a
        if(UserInfos[lp1].UserName == UserName)
        {
            return UserInfos[lp1].ClanName;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return "";
}

function SetNewHost(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x59 [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4f
        if(UserInfos[lp1].UserName == UserName)
        {
            UserInfos[lp1].IsHost = true;
        }
        // End:0x59
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function bool IsHost(string UserName)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x59 [While If]
    if(lp1 < UserInfos.Length)
    {
        // End:0x4f
        if(UserInfos[lp1].IsHost)
        {
            // End:0x4f
            if(UserInfos[lp1].UserName == UserName)
            {
                return true;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
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
}

function byte GetGameModeNum(string szGameClassName)
{
    // End:0x21
    if(szGameClassName == "wGame.wTeamGame")
    {
        return 0;
    }
    // End:0xbb
    else
    {
        // End:0x47
        if(szGameClassName == "wMission.wSDGameInfo")
        {
            return 1;
        }
        // End:0xbb
        else
        {
            // End:0x6e
            if(szGameClassName == "wMission.wDOMGameInfo")
            {
                return 3;
            }
            // End:0xbb
            else
            {
                // End:0x95
                if(szGameClassName == "wMission.wSBTGameInfo")
                {
                    return 4;
                }
                // End:0xbb
                else
                {
                    // End:0xb8
                    if(szGameClassName == "wGame.wDeathMatch")
                    {
                        return 2;
                    }
                    // End:0xbb
                    else
                    {
                        return 0;
                    }
                }
            }
        }
    }
}

function int GetTeamCount()
{
    // End:0x21
    if(szGameClass == "wGame.wTeamGame")
    {
        return 2;
    }
    // End:0x68
    else
    {
        // End:0x43
        if(szGameClass == "wGame.wTeam3Game")
        {
            return 3;
        }
        // End:0x68
        else
        {
            // End:0x65
            if(szGameClass == "wGame.wDeathMatch")
            {
                return 1;
            }
            // End:0x68
            else
            {
                return 2;
            }
        }
    }
}

function ResetGameFlag()
{
    Log("[CYH] MatchMaker::ResetGameFlag() called.");
    bPendingStarted = false;
    InGamePlaying = false;
    // End:0x67
    if(kIsInDSChannel)
    {
        // End:0x67
        if(kDS_SavedOwnerInfo)
        {
            kDS_SavedOwnerInfo = false;
            bIsOwner = true;
            kGame_bOwner = true;
        }
    }
    bIsLoading = false;
    IsChangeNewGuest_InLoading = false;
    IsChangeHost_InLoading = false;
    bForceGameOver = false;
    ConnectClientNum = 0;
    ConnectedCount = 0;
    bIntervention = false;
    bChangingHost = false;
    bSendedLoadingFailed = false;
    SetDisconnectedUser(false);
    DrawChangeHost_Guest = false;
    DrawChangeHost_Host = false;
}

event EndMatch(optional bool bForceEndMatch)
{
    // End:0xdc
    if(InGamePlaying == true)
    {
        Log("wMatchMaker.EndMatch() called.");
        ResetGameFlag();
        // End:0x9d
        if(bForceEndMatch == true)
        {
            // End:0x70
            if(kIsDSHost == true)
            {
                ConsoleCmd_DS("disconnect bForceEndMatch");
            }
            // End:0x9a
            else
            {
                Console.ConsoleCommand("disconnect bForceEndMatch");
            }
        }
        // End:0xd9
        else
        {
            // End:0xbe
            if(kIsDSHost == true)
            {
                ConsoleCmd_DS("disconnect");
            }
            // End:0xd9
            else
            {
                Console.ConsoleCommand("disconnect");
            }
        }
    }
    // End:0x116
    else
    {
        Log("wMatchMaker.EndMatch() InGamePlaying is false. error!!");
    }
}

function ClearConsole()
{
    // End:0x23
    if(kIsDSHost == true)
    {
        ConsoleCmd_DS("ClearConsole");
    }
    // End:0x40
    else
    {
        Console.ConsoleCommand("ClearConsole");
    }
}

function InitializeMapSettings()
{
    MapSettings = new class'wMapSettings';
    MapSettings.Initialize(self);
}

event InitializeMapSettings_DS_Server()
{
    // End:0x2a
    if(MapSettings == none)
    {
        MapSettings = new class'wMapSettings';
        MapSettings.Initialize(self);
    }
}

event Material GetLoadingImage()
{
    local string resourceName;

    resourceName = "Warfare_GP_UI_Map.Loadingimage.Loading_BasicTraining";
    // End:0x5b
    if(BotTutorial)
    {
        return Material(DynamicLoadObject(resourceName, class'Material'));
    }
    return Material(DynamicLoadObject(MapSettings.GetMapInfo(szMapName).ResourceLoadingImage, class'Material'));
}

event Material GetMiniMapInfoImage()
{
    local int ImageIndex;

    switch(kGame_GameMode)
    {
        // End:0x19
        case class'wGameSettings'.static.GetModeIndex_TeamDeath():
        // End:0x2b
        case class'wGameSettings'.static.GetModeIndex_DeathMatch():
        // End:0x3d
        case class'wGameSettings'.static.GetModeIndex_BotTeamDeath():
        // End:0x4f
        case class'wGameSettings'.static.GetModeIndex_BotDeathMatch():
        // End:0x85
        case class'wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner():
            switch(kGame_WeaponLimit)
            {
                // End:0x6f
                case 1:
                // End:0x78
                case 5:
                    return none;
                // End:0xffff
                default:
                    ImageIndex = 0;
                    // End:0x12e Break;
                    break;
        }
        // End:0xa1
        case class'wGameSettings'.static.GetModeIndex_SD():
            ImageIndex = 1;
            // End:0x12e
            break;
        // End:0xb3
        case class'wGameSettings'.static.GetModeIndex_Domination():
        // End:0xf3
        case class'wGameSettings'.static.GetModeIndex_BotDomination():
            switch(kGame_WeaponLimit)
            {
                // End:0xd3
                case 1:
                // End:0xe5
                case 5:
                    ImageIndex = 3;
                    // End:0xf0
                    break;
                // End:0xffff
                default:
                    ImageIndex = 2;
                    // End:0x12e Break;
                    break;
        }
        // End:0x105
        case class'wGameSettings'.static.GetModeIndex_Sabotage():
        // End:0x117
        case class'wGameSettings'.static.GetModeIndex_BotTutorial():
        // End:0x12b
        case class'wGameSettings'.static.GetModeIndex_Defence():
            return none;
        // End:0xffff
        default:
            return Material(DynamicLoadObject(MapSettings.GetMapInfo(szMapName).ResourceMiniMapInfoImage[ImageIndex], class'Material'));
    }
}

event StartLoading()
{
    bIsLoading = true;
    IsChangeNewGuest_InLoading = false;
    IsChangeHost_InLoading = false;
    bForceGameOver = false;
    DrawChangeHost_Guest = false;
    DrawChangeHost_Host = false;
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
    // End:0x5d
    else
    {
        ProcessPendingChangeNewHostOrChangeNewGuest();
    }
}

event bool IsLoading()
{
    return bIsLoading;
}

function bool ResetChangingHostGuest()
{
    Log("[wMatchMaker::ResetChangingHostGuest]");
    IsChangeHost_InLoading = false;
    IsChangeNewGuest_InLoading = false;
    return true;
}

event SetChangingHostFlag(bool flag)
{
    // End:0x19
    if(InGamePlaying == true)
    {
        bChangingHost = flag;
    }
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
    // End:0x6e
    else
    {
        // End:0x6e
        if(InGamePlaying == true)
        {
            ReconnectClientNum = ClientNum;
            LowChangeServer();
        }
    }
    return true;
}

function bool ChangeNewGuest(string HostIP)
{
    // End:0x43
    if(bIsLoading == true)
    {
        Log("wMatchMaker::ChangeNewGuest() bIsLoading is true");
    }
    // End:0xc7
    else
    {
        // End:0xc7
        if(InGamePlaying == true)
        {
            // End:0x69
            if(IsCompletedLoading() == true)
            {
                LowChangeClient(HostIP);
            }
            // End:0xc7
            else
            {
                Log("wMatchMaker::ChangeNewGuest() InGamePlaying=" $ string(InGamePlaying) $ " IsCompletedLoading()=" $ string(IsCompletedLoading()));
            }
        }
    }
    return true;
}

function SetChangeHostMessageFlag()
{
    Log("[CYH] SetChangeHostMessageFlag()");
    // End:0x4f
    if(InGamePlaying == true)
    {
        // End:0x47
        if(bIsOwner == true)
        {
            DrawChangeHost_Host = true;
        }
        // End:0x4f
        else
        {
            DrawChangeHost_Guest = true;
        }
    }
}

function PendingChangeHost(int ClientNum)
{
    IsChangeNewGuest_InLoading = false;
    IsChangeHost_InLoading = true;
    ReconnectClientNum = ClientNum;
    Log("UwMatchMaker::PendingChangeHost() pending change host.");
}

function PendingChangeNewGuest(string hostAddress)
{
    IsChangeHost_InLoading = false;
    IsChangeNewGuest_InLoading = true;
    newHostAddr = hostAddress;
    Log("UwMatchMaker::PendingChangeNewGuest() pending change new guest." $ hostAddress);
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
        // End:0x106
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
    // End:0xd0
    if(bForceGameOver == true)
    {
        Log("[CYH] wMatchMaker::ForceGameOver() bForceGameOver is already true. warning!!");
    }
    // End:0x11f
    if(bIsLoading == true)
    {
        Log("[CYH] wMatchMaker::ForceGameOver() bLoading is true.");
        bForceGameOver = true;
    }
    // End:0x277
    else
    {
        // End:0x277
        if(bIsOwner == true)
        {
            // End:0x1fc
            if(playingLevelInfo != none && playingLevelInfo.Game != none)
            {
                // End:0x195
                if(playingLevelInfo.Game.IsInState('MatchOver') == true)
                {
                    Log("[CYH] Already In MatchOver state");
                    return false;
                }
                // End:0x1f9
                else
                {
                    Log("[CYH] wMatchmaker::ForceGameOver() force game over process");
                    playingLevelInfo.Game.EndGame(Winner, "LastMan");
                }
            }
            // End:0x277
            else
            {
                Log("[CYH] wMatchmaker::ForceGameOver() can't access playingLevelInfo or playingLevelInfo.Game. does changing host??");
                bForceGameOver = true;
            }
        }
    }
    return true;
}

function GetItemDurabilityInfo(out array<int> OwnerID, out array<int> PlayedNumber, out array<int> PlayedRound, out array<BtrDouble> UniqueItemID, out array<int> UsingTime, out array<int> PlayedCount)
{
    local int i, j, k, iTemp;
    local wMatchUserInfo kUser;
    local bool bFind;

    iTemp = 0;
    J0x07:
    // End:0x2f6 [While If]
    if(iTemp < UserInfos.Length)
    {
        kUser = UserInfos[iTemp];
        i = 0;
        J0x2f:
        // End:0x115 [While If]
        if(i < kUser.EquippedItems.Length)
        {
            OwnerID[OwnerID.Length] = kUser.UID;
            PlayedNumber[PlayedNumber.Length] = kUser.TimePlayed;
            PlayedRound[PlayedRound.Length] = kUser.RoundPlayed;
            UniqueItemID[UniqueItemID.Length] = kUser.EquippedItems[i].UniqueID;
            UsingTime[UsingTime.Length] = kUser.EquippedItems[i].ItemUsedSeconds;
            PlayedCount[PlayedCount.Length] = kUser.EquippedItems[i].ItemUsedCount;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
        i = 0;
        J0x11c:
        // End:0x2ec [While If]
        if(i < 5)
        {
            j = 0;
            J0x12f:
            // End:0x2e2 [While If]
            if(j < 4)
            {
                bFind = false;
                k = 0;
                J0x14a:
                // End:0x1f7 [While If]
                if(k < UniqueItemID.Length)
                {
                    // End:0x1ed
                    if(UnresolvedNativeFunction_99(UniqueItemID[k], kUser.EquippedQSlots[i].ItemUniqueID[j]))
                    {
                        UsingTime[k] += kUser.EquippedQSlots[i].ItemUsedSeconds[j];
                        PlayedCount[k] += kUser.EquippedQSlots[i].ItemUsedCount[j];
                        bFind = true;
                    }
                    // End:0x1f7
                    else
                    {
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0x14a;
                    }
                }
                // End:0x2d8
                if(bFind == false)
                {
                    OwnerID[OwnerID.Length] = kUser.UID;
                    PlayedNumber[PlayedNumber.Length] = kUser.TimePlayed;
                    PlayedRound[PlayedRound.Length] = kUser.RoundPlayed;
                    UniqueItemID[UniqueItemID.Length] = kUser.EquippedQSlots[i].ItemUniqueID[j];
                    UsingTime[UsingTime.Length] = kUser.EquippedQSlots[i].ItemUsedSeconds[j];
                    PlayedCount[PlayedCount.Length] = kUser.EquippedQSlots[i].ItemUsedCount[j];
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x12f;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x11c;
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

event ReqSuccessStartGame(int Step)
{
    OnReqSuccessStartGame(Step);
}

delegate OnReqSuccessStartGame(int Step);
event DrawOtherLoadingState(int UserID, byte bLoadingState)
{
    local int i;
    local string OtherUserName;
    local LoadingMessageItem Item;
    local bool bHost;

    OtherUserName = "Player";
    i = 0;
    J0x15:
    // End:0xc6 [While If]
    if(i < UserInfos.Length)
    {
        // End:0xbc
        if(UserID == UserInfos[i].UID)
        {
            OtherUserName = UserInfos[i].UserName;
            UserInfos[i].bLoadingState = bLoadingState;
            Item.TeamNum = UserInfos[i].TeamNum;
            // End:0xb9
            if(UserInfos[i].IsHost == true)
            {
                bHost = true;
            }
        }
        // End:0xc6
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x15;
        }
    }
    Item.UserName = OtherUserName;
    Item.LoadingState = bLoadingState;
    // End:0x18d
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
    // End:0x22d
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
    // End:0x286
    if(bLoadingState == 0)
    {
        Item.StateColor.R = byte(255);
        Item.StateColor.G = 0;
        Item.StateColor.B = 0;
        Item.StateColor.A = byte(255);
    }
    PrintLoadingMsg(Item);
}

function SendPingToClient()
{
    local int i;
    local wMatchUserInfo kUserInfo;

    i = 0;
    J0x07:
    // End:0xbd [While If]
    if(i < UserInfos.Length)
    {
        kUserInfo = UserInfos[i];
        // End:0xb3
        if(kUserInfo != none)
        {
            // End:0x6f
            if(SendPingToOtherUser(kUserInfo.UserIP))
            {
                kUserInfo.bSendPing = true;
                kUserInfo.bReceivedPing = false;
            }
            // End:0xb3
            else
            {
                Log("SendPingToClient Failed : kUserInfo.UserIP[" $ kUserInfo.UserIP $ "]");
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SendPingHK(string fromAddr)
{
    local int i;

    Log("[wMatchMaker::SendPingHK] fromAddr=" $ fromAddr);
    PingChecker.SendPing(fromAddr);
    i = 0;
    J0x49:
    // End:0x7f [While If]
    if(i < arrPingTime.Length)
    {
        // End:0x75
        if(arrPingTime[i].IP == fromAddr)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    arrPingTime.Length = arrPingTime.Length + 1;
    arrPingTime[arrPingTime.Length - 1].IP = fromAddr;
    arrPingTime[arrPingTime.Length - 1].msec = 0;
}

function int GetLastestPingValue(string fromAddr)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < arrPingTime.Length)
    {
        // End:0x42
        if(arrPingTime[i].IP == fromAddr)
        {
            return arrPingTime[i].msec;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 999;
}

function ClearReceivedPingHK()
{
    arrPingTime.Length = 0;
}

function ReceivedPingHK(string fromAddr, int msec)
{
    local int i;

    Log("[wMatchMaker::RecivedPingHK] fromAddr=" $ fromAddr $ " msec=" $ string(msec));
    i = 0;
    J0x4b:
    // End:0x98 [While If]
    if(i < arrPingTime.Length)
    {
        // End:0x8e
        if(arrPingTime[i].IP == fromAddr)
        {
            arrPingTime[i].msec = msec;
        }
        // End:0x98
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4b;
        }
    }
    OnRecivedPing(self, fromAddr, msec);
}

delegate OnRecivedPing(wMatchMaker MM, string fromAddr, int msec);
function int ReceivedPing(string fromAddr, int msec)
{
    local int i, iUserCount, iSumPing, nResult;
    local wMatchUserInfo kUserInfo;

    nResult = -1;
    // End:0x3c
    if(3 == nNatType && fromAddr == szRelayIP)
    {
        iAvgPing = msec;
        return nResult;
    }
    // End:0x5c
    else
    {
        // End:0x5c
        if(fromAddr == szChannelIP)
        {
            iAvgPing = msec;
            return nResult;
        }
    }
    i = 0;
    J0x63:
    // End:0x120 [While If]
    if(i < UserInfos.Length)
    {
        kUserInfo = UserInfos[i];
        // End:0x116
        if(kUserInfo != none)
        {
            // End:0xe8
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
                ++ iUserCount;
                iSumPing += kUserInfo.iReceivedPing;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    iAvgPing = iSumPing / iUserCount;
    return nResult;
}

function int CalculateHostPoint(bool bInGame)
{
    local int iPingPoint, iFPSPoint;
    local float fPingPerSec;

    // End:0x18b
    if(bInGame)
    {
        fPingPerSec = float(iAvgPing) / 1000.0;
        // End:0x38
        if(fPingPerSec < float(0))
        {
            iPingPoint = 1000;
        }
        // End:0xbc
        else
        {
            // End:0x51
            if(fPingPerSec <= 0.020)
            {
                iPingPoint = 0;
            }
            // End:0xbc
            else
            {
                // End:0x6b
                if(fPingPerSec <= 0.0350)
                {
                    iPingPoint = 15;
                }
                // End:0xbc
                else
                {
                    // End:0x85
                    if(fPingPerSec <= 0.50)
                    {
                        iPingPoint = 30;
                    }
                    // End:0xbc
                    else
                    {
                        // End:0xa2
                        if(fPingPerSec <= 1.0)
                        {
                            iPingPoint = 1000;
                        }
                        // End:0xbc
                        else
                        {
                            // End:0xbc
                            if(fPingPerSec > 1.0)
                            {
                                iPingPoint = 1000;
                            }
                        }
                    }
                }
            }
        }
        // End:0xd6
        if(iAvgFrameRate <= 30)
        {
            iFPSPoint = 1000;
        }
        // End:0x176
        else
        {
            // End:0xf0
            if(iAvgFrameRate <= 40)
            {
                iFPSPoint = 500;
            }
            // End:0x176
            else
            {
                // End:0x107
                if(iAvgFrameRate <= 50)
                {
                    iFPSPoint = 70;
                }
                // End:0x176
                else
                {
                    // End:0x11e
                    if(iAvgFrameRate <= 60)
                    {
                        iFPSPoint = 50;
                    }
                    // End:0x176
                    else
                    {
                        // End:0x135
                        if(iAvgFrameRate <= 70)
                        {
                            iFPSPoint = 35;
                        }
                        // End:0x176
                        else
                        {
                            // End:0x14c
                            if(iAvgFrameRate <= 80)
                            {
                                iFPSPoint = 20;
                            }
                            // End:0x176
                            else
                            {
                                // End:0x163
                                if(iAvgFrameRate <= 90)
                                {
                                    iFPSPoint = 10;
                                }
                                // End:0x176
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
    // End:0x1ed
    else
    {
        // End:0x1a2
        if(kServerPing <= 20)
        {
            iPingPoint = 10;
        }
        // End:0x1db
        else
        {
            // End:0x1b9
            if(kServerPing <= 35)
            {
                iPingPoint = 20;
            }
            // End:0x1db
            else
            {
                // End:0x1d0
                if(kServerPing <= 50)
                {
                    iPingPoint = 100;
                }
                // End:0x1db
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
}

function int GetHostPoint()
{
    return iHostPoint;
}

function SetDisconnectedUser(bool bSet, optional int UserID)
{
    DisConnectedUserID = UserID;
    IsDisconnected = bSet;
}

function bool IsDisconnectedUser()
{
    return IsDisconnected;
}

function ClearFriendList()
{
    kFriendList.Length = 0;
}

function SetFriendListCount(int cnt)
{
    kFriendListCount = cnt;
}

function AddFriendList(string UserName, byte IsLogOn, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, byte IsLookForClan, int ClanLevel, int LevelMarkID)
{
    local int Last;

    Last = kFriendList.Length;
    Log("[wMatchMaker::AddFriendList] " $ UserName $ ", " $ string(ClanMark) $ ", " $ string(ClanBG) $ ", " $ string(ClanBL) $ ", " $ string(Level) $ ", " $ string(LevelMarkID));
    kFriendList.Length = kFriendList.Length + 1;
    kFriendList[Last].UserName = UserName;
    kFriendList[Last].ClanPattern = ClanMark;
    kFriendList[Last].ClanBG = ClanBG;
    kFriendList[Last].ClanBL = ClanBL;
    kFriendList[Last].ClanName = ClanName;
    kFriendList[Last].Level = Level;
    kFriendList[Last].IsLogOn = IsLogOn;
    kFriendList[Last].IsLookForClan = IsLookForClan;
    kFriendList[Last].ClanLevel = ClanLevel;
    kFriendList[Last].LevelMarkID = LevelMarkID;
}

function ClearPCBangList()
{
    kPCBangList.Length = 0;
}

function SetPCBangListCount(int cnt)
{
    kPCBangListCount = cnt;
}

function RemovePCBangList(string UserName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x47 [While If]
    if(i < kPCBangList.Length)
    {
        // End:0x3d
        if(kPCBangList[i].UserName == UserName)
        {
            kPCBangList.Remove(i, 1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function AddPCBangList(string UserName, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, string ServerName, string ServerShortName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, int IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Last;

    Last = kPCBangList.Length;
    kPCBangList.Length = kPCBangList.Length + 1;
    kPCBangList[Last].UserName = UserName;
    kPCBangList[Last].ClanPattern = ClanMark;
    kPCBangList[Last].ClanBG = ClanBG;
    kPCBangList[Last].ClanBL = ClanBL;
    kPCBangList[Last].ClanName = ClanName;
    kPCBangList[Last].Level = Level;
    kPCBangList[Last].ServerName = ServerName;
    kPCBangList[Last].ServerShortName = ServerShortName;
    kPCBangList[Last].ServerIP = ServerIP;
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
}

function AddPCBangList2(string UserName, byte IsLogOn, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, int ClanGrade, int ClanWin, int ClanLose, int IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local int Last;

    kPCBangList.Length = kPCBangList.Length + 1;
    kPCBangList[Last].UserName = UserName;
    kPCBangList[Last].IsLogOn = IsLogOn;
    kPCBangList[Last].ClanPattern = ClanMark;
    kPCBangList[Last].ClanBG = ClanBG;
    kPCBangList[Last].ClanBL = ClanBL;
    kPCBangList[Last].ClanName = ClanName;
    kPCBangList[Last].Level = Level;
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
}

function ClearClanList()
{
    kClanList.Length = 0;
}

function SetClanListCount(int cnt)
{
    kClanListCount = cnt;
}

function AddClanList(string UserName, byte IsLogOn, int Level, int ClanGrade, int ClanWin, int ClanLose, int LevelMarkID, int TitleMarkID)
{
    local int Last;

    Last = kClanList.Length;
    kClanList.Length = kClanList.Length + 1;
    kClanList[Last].UserName = UserName;
    kClanList[Last].Level = Level;
    kClanList[Last].IsLogOn = IsLogOn;
    kClanList[Last].ClanGrade = byte(ClanGrade);
    kClanList[Last].ClanWin = ClanWin;
    kClanList[Last].ClanLose = ClanLose;
    kClanList[Last].LevelMarkID = LevelMarkID;
    kClanList[Last].TitleMarkID = TitleMarkID;
}

function ClearBlockList()
{
    kBlockList.Length = 0;
}

function SetBlockListCount(int cnt)
{
    kBlockListCount = cnt;
}

function AddBlockList(string UserName)
{
    local int Last;

    Last = kBlockList.Length;
    kBlockList.Length = kBlockList.Length + 1;
    kBlockList[Last].UserName = UserName;
}

function ReplaceBlockNickName(string old_name, string new_name)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x51 [While If]
    if(lp1 < kBlockList.Length)
    {
        // End:0x47
        if(kBlockList[lp1].UserName == old_name)
        {
            kBlockList[lp1].UserName = new_name;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

delegate UpdateFriendList(wMatchMaker MM);
delegate UpdateClanList(wMatchMaker MM);
delegate UpdatePCBangList(wMatchMaker MM);
delegate UpdateBlockList(wMatchMaker MM);
function bool IsBlockUser(string UserName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < kBlockList.Length)
    {
        // End:0x33
        if(kBlockList[i].UserName == UserName)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function bool IsFriendlyUser(string CharName, optional string ClanName)
{
    local int i;

    // End:0x1f
    if(ClanName != "" && kClanName == ClanName)
    {
        return true;
    }
    i = 0;
    J0x26:
    // End:0x5c [While If]
    if(i < kFriendList.Length)
    {
        // End:0x52
        if(kFriendList[i].UserName == CharName)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
    // End:0xa4
    if(kIsPaidPCBang == 1)
    {
        i = 0;
        J0x6e:
        // End:0xa4 [While If]
        if(i < kPCBangList.Length)
        {
            // End:0x9a
            if(kPCBangList[i].UserName == CharName)
            {
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6e;
        }
    }
    return false;
}

function bool IsSDRespawn()
{
    local wMapInfo mapInfo;

    mapInfo = MapSettings.GetMapInfo(szMapName);
    switch(GetGameModeNum(szGameClass))
    {
        // End:0x3b
        case 1:
            bSDRespawn = true;
            return bSDRespawn;
        // End:0x4f
        case 2:
            bSDRespawn = false;
            return bSDRespawn;
        // End:0xffff
        default:
            return bSDRespawn;
    }
}

function byte GetIsAASLevel()
{
    return My_AASLevel;
}

function SetAASLevel(byte _level)
{
    My_AASLevel = _level;
}

function bool IsPlayingPCBang()
{
    return false;
}

function bool IsPlayingPCBangPlus()
{
    return false;
}

function bool CheckUsingItem(wItemBoxHK ItemInfo)
{
    // End:0x0d
    if(ItemInfo == none)
    {
        return false;
    }
    // End:0x20
    if(IsPCBangItem(ItemInfo) == false)
    {
        return true;
    }
    // End:0x53
    if(IsPlayingPCBang() == true)
    {
        // End:0x51
        if(ItemInfo.Grade == 8 && false == IsPlayingPCBangPlus())
        {
            return false;
        }
        return true;
    }
    return false;
}

function bool IsPCBangItem(wItemBoxHK ItemInfo)
{
    // End:0x2e
    if(ItemInfo.Grade >= 7 && ItemInfo.Grade <= 8)
    {
        return true;
    }
    return false;
}

function SetLastBuyItemInfo(string ItemName, int ItemType, int ItemGrade)
{
    lastBuyItemName = ItemName;
    lastBuyItemType = ItemType;
    lastBuyItemGrade = ItemGrade;
}

function SendUpdateUserPerformenceInfo(int UserID, int MinFps, int MaxFps, int AvgFps, int MinPing, int MaxPing, int AvgPing)
{
    kTcpChannel.sfReqUpdateUserPerformenceInfo(UserID, MinFps, MaxFps, AvgFps, MinPing, MaxPing, AvgPing);
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
    kPCBangType=-1
    bShowFont=true
    iAvgPing=500
    BotDifficulty=1
    IsTestMode=true
    nNatType=-1
    IsFixedAssistPoint=true
    FixedAssistTime=20.0
    lastBuyItemType=-1
    lastBuyItemGrade=-1
}