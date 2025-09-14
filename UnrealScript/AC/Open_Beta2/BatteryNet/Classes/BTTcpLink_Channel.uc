class BTTcpLink_Channel extends Object
    native;

struct native export KillDeathLog
{
    var int CharKillUID;
    var float KillXCoord;
    var float KillYCoord;
    var float KillZCoord;
    var int KillPos;
    var int KillWeapon;
    var int KillWeaponPart;
    var int KillRange;
    var int KillDamage;
    var byte KillBodyPart;
    var byte IsUAV;
    var int CharDeathUID;
    var float DeathXCoord;
    var float DeathYCoord;
    var float DeathZCoord;
    var int DeathPos;
    var int DeathWeapon;
    var int DeathWeaponPart;
    var byte IsDropItem;
    var int DropItemID;
    var int GetItemIDAfterKill;
};

struct native export NetAuctionItem
{
    var int UniqueID;
    var int ItemID;
    var int AddPartsID;
    var int UntilTime;
    var int BiddingPrice;
    var int InstantlyBuyingPrice;
    var int ItemDamaged;
    var string HighestBidderName;
    var string SellerName;
    var int GuarantyPoint;
};

struct native export GameRoomInfo
{
    var int RoomNumber;
    var string RoomName;
    var string MapName;
    var string GameClass;
    var byte GameModeNum;
    var byte MaxUserCnt;
    var byte TeamCnt;
    var byte WeaponLimit;
    var int GameRound;
    var int GameMinute;
    var byte IsHardCore;
    var string RoomOwner;
    var byte MapNum;
    var byte IsIntervention;
    var byte IsFreeCam;
    var byte IsVoiceChat;
    var byte IsTeamValance;
    var byte IsOurForcesDamage;
    var byte IsKillCam;
    var byte IsVote;
    var byte IsChangeOffenseAndDefense;
    var byte ChangeOffenseAndDefenseRound;
    var byte BombHold;
    var byte IsPassword;
    var string Password;
    var byte PlayWithBots;
    var byte MaxAFUserAndBotNum;
    var byte MaxRSAUserAndBotNum;
    var byte UserTeamNum;
    var byte BotModeDifficulty;
    var byte RoomType;
    var byte ResponType;
};

struct native export MatchState
{
    var int iNumTeam;
    var int iGoalRound;
    var byte bFriendlyFire;
    var byte bAllowSpectate;
    var byte bAutobalance;
    var byte bAllowJoin;
    var byte bAllow3rdPersonView;
    var byte bChatVictimOnly;
    var int iMinutesKickAFK;
    var int iMinPlayers;
};

struct native export CharInfo
{
    var int Level;
    var int Exp;
    var int Stamina;
    var int HP;
    var int PrevRanking;
    var int Ranking;
    var int PrevHeadShotRanking;
    var int HeadShotRanking;
    var int PrevWomanRanking;
    var int WomanRanking;
    var int MonthlyPrevRanking;
    var int MonthlyRanking;
    var int MonthlyPrevHeadShotRanking;
    var int MonthlyHeadShotRanking;
    var int MonthlyPrevWomanRanking;
    var int MonthlyWomanRanking;
    var int Kill;
    var int Death;
    var int Win;
    var int Lose;
    var int TeamKill;
    var int Assist;
    var int Point;
    var int Cash;
    var int HeadShot2;
    var int DisCon;
    var int TotPlayTime;
    var int DispHeadItem;
    var int DispFaceItem;
    var int DispBackpack;
    var byte LookForClan;
    var int ClanContribue;
    var int ClanWin;
    var int ClanLose;
    var int ClanKill;
    var int ClanDeath;
    var int ClanAssist;
    var int ClanHeadshot;
    var int ClanDiscon;
    var int ClanRankingPrev;
    var int ClanRanking;
    var int ClanRankingMonthlyPrev;
    var int ClanRankingMonthly;
    var int LevelMarkID;
    var int TitleMarkID;
    var int DispPouch;
    var int DispCamouflage;
    var int Reserved1;
};

struct native export ClanInfo
{
    var string ClanMasterCharname;
    var int ClanWin;
    var int ClanLose;
    var int ClanDraw;
    var int tRankCur;
    var int tRankPrev;
    var int mRankCur;
    var int mRankPrev;
    var byte Region;
    var int MemberCnt;
    var int MemberTotal;
    var byte IsRecruit;
    var string HowOld;
    var string Keyword;
    var string Intro;
    var string CM_ClanName;
    var int CM_Pattern;
    var int CM_BG;
    var int CM_BL;
    var string ClanNoti;
    var int ClanExp;
    var int ClanKill;
    var int ClanDeath;
    var int ClanAssist;
    var int ClanActivity;
    var int ClanActivityRank;
    var int ClanActivityRankPrev;
    var int ClanActivityMRank;
    var int ClanActivityMRankPrev;
    var int ClanLevel;
};

struct native export SystemMsgParam
{
    var int MsgCode;
    var string CharName;
    var int ServerID;
    var int ChannelNum;
    var int CharLevel;
    var int ItemID;
    var int Point;
};

// Export UBTTcpLink_Channel::execInitNetwork(FFrame&, void* const)
native function bool InitNetwork();

// Export UBTTcpLink_Channel::execConnect(FFrame&, void* const)
native function bool Connect(string sIpaddr, int nPort)
{
    //native.sIpaddr;
    //native.nPort;        
}

// Export UBTTcpLink_Channel::execConnectDomain(FFrame&, void* const)
native function bool ConnectDomain(string domain, int nPort)
{
    //native.domain;
    //native.nPort;        
}

// Export UBTTcpLink_Channel::execClose(FFrame&, void* const)
native function bool Close();

event OnConnect(int ErrCode)
{
    Log("Socket Connected!");
    //return;    
}

event OnClose(int ErrCode)
{
    Log("Socket Closed!");
    //return;    
}

event OnError(int ErrCode)
{
    Log("Socket Error!");
    //return;    
}

event bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3)
{
    return false;
    //return;    
}

event bool rfAckHash(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqLogin(string id)
{
    return false;
    //return;    
}

event bool rfAckLogin(int Result, string ErrMsg, int UserID, string CharName, string ClanName, CharInfo btCharInfo)
{
    return false;
    //return;    
}

event bool rfReqForceLogoutByOwner()
{
    return false;
    //return;    
}

event bool rfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    return false;
    //return;    
}

event bool rfAckStartNatDiag(int NatType)
{
    return false;
    //return;    
}

event bool rfReqLogin2(string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, string Guid, int UserType)
{
    return false;
    //return;    
}

event bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    return false;
    //return;    
}

event bool rfReqCharInfo()
{
    return false;
    //return;    
}

event bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    return false;
    //return;    
}

event bool rfReqFriendList()
{
    return false;
    //return;    
}

event bool rfAckFriendListStart(int Result, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    return false;
    //return;    
}

event bool rfAckFriendListEnd()
{
    return false;
    //return;    
}

event bool rfReqChannelList(int bChannelType)
{
    return false;
    //return;    
}

event bool rfAckChannelList(array<int> id, array<string> Title, array<int> CurUser, array<int> MaxUser)
{
    return false;
    //return;    
}

event bool rfReqEnterChannel(int id)
{
    return false;
    //return;    
}

event bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return false;
    //return;    
}

event bool rfReqLeaveChannel(int id)
{
    return false;
    //return;    
}

event bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    return false;
    //return;    
}

event bool rfReqChannelUserList(int id, int StartIndex, int Count)
{
    return false;
    //return;    
}

event bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return false;
    //return;    
}

event bool rfReqRoomList(int id, int StartIndex, int Count)
{
    return false;
    //return;    
}

event bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex)
{
    return false;
    //return;    
}

event bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    return false;
    //return;    
}

event bool rfAckRoomListEnd()
{
    return false;
    //return;    
}

event bool rfReqEnterRoom(int GameNum, string Password, byte RoomEnterType)
{
    return false;
    //return;    
}

event bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return false;
    //return;    
}

event bool rfReqRoomUserList(int GameNum)
{
    return false;
    //return;    
}

event bool rfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return false;
    //return;    
}

event bool rfReqLeaveRoom(int Num)
{
    return false;
    //return;    
}

event bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckExceedMaxUser()
{
    return false;
    //return;    
}

event bool rfReqCreateGameRoom(GameRoomInfo NetRoomInfo)
{
    return false;
    //return;    
}

event bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    return false;
    //return;    
}

event bool rfReqGameRoomInfo(int GameNum, int UID)
{
    return false;
    //return;    
}

event bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    return false;
    //return;    
}

event bool rfReqSelectMap(int GameNum, int UID, string MapName)
{
    return false;
    //return;    
}

event bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqBanUser(int GameNum, int UID, int BanUID)
{
    return false;
    //return;    
}

event bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum)
{
    return false;
    //return;    
}

event bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqChangeRoomOwner(int GameNum, int UID, int NewOwner)
{
    return false;
    //return;    
}

event bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqChangeTeam(int TeamNum)
{
    return false;
    //return;    
}

event bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqIsHostAvailable(string MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam)
{
    return false;
    //return;    
}

event bool rfAckIsHostAvailable(int Result)
{
    return false;
    //return;    
}

event bool rfReqGameHostInfo(int GameNumber)
{
    return false;
    //return;    
}

event bool rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqStartGame(int GameNumber)
{
    return false;
    //return;    
}

event bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqUpdateScore(int GameNumber, array<int> UserIDs, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> Points, array<int> Scores, array<int> TeamScores, array<int> RoundJoin, array<int> TimeJoin, int Playtime, byte GameEndType, array<string> UserNames, byte IsAIClear)
{
    return false;
    //return;    
}

event bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    return false;
    //return;    
}

event bool rfAckUpdateScoreResult(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum)
{
    return false;
    //return;    
}

event bool rfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckGameRoomDestroy(int GameRoomNum)
{
    return false;
    //return;    
}

event bool rfReqIsGameRoomPlaying(int GameRoomNum)
{
    return false;
    //return;    
}

event bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    return false;
    //return;    
}

event bool rfReqGameOver(int UID, int GameRoomNumber)
{
    return false;
    //return;    
}

event bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    return false;
    //return;    
}

event bool rfReqRelayServerOff()
{
    return false;
    //return;    
}

event bool rfReqConnectGame()
{
    return false;
    //return;    
}

event bool rfAckConnectGame(int UserID, int Result)
{
    return false;
    //return;    
}

event bool rfReqDisconnectGame()
{
    return false;
    //return;    
}

event bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    return false;
    //return;    
}

event bool rfAckChangeHost(byte ClientNum)
{
    return false;
    //return;    
}

event bool rfAckChangeNewGuest(string HostIP)
{
    return false;
    //return;    
}

event bool rfReqNotifyClientJoinTime(int JoinedClientID)
{
    return false;
    //return;    
}

event bool rfAckNotifyClientJoinTime(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqRegisterMyUdpInfo(byte IsHost, string IP, int Port, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    return false;
    //return;    
}

event bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    return false;
    //return;    
}

event bool rfReqClientUdpInfoList(int GameNum)
{
    return false;
    //return;    
}

event bool rfAckClientUdpInfoList(int Result, string ErrMsg, array<int> UID, array<string> IP, array<int> Port)
{
    return false;
    //return;    
}

event bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    return false;
    //return;    
}

event bool rfReqChangeRoomSetting(GameRoomInfo RoomInfo)
{
    return false;
    //return;    
}

event bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    return false;
    //return;    
}

event bool rfReqSetUserBootySeedValue(int UserID, int SeedValue)
{
    return false;
    //return;    
}

event bool rfAckSetUserBootySeedValue(int UserID, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqGetBooty(int RoomNumber)
{
    return false;
    //return;    
}

event bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    return false;
    //return;    
}

event bool rfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    return false;
    //return;    
}

event bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    return false;
    //return;    
}

event bool rfAckExteriorRoomInfo()
{
    return false;
    //return;    
}

event bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    return false;
    //return;    
}

event bool rfAckExteriorRoomUserCount()
{
    return false;
    //return;    
}

event bool rfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    return false;
    //return;    
}

event bool rfAckExteriorRoomState()
{
    return false;
    //return;    
}

event bool rfReqChangeUserState(byte NewState, byte CheckPlaying)
{
    return false;
    //return;    
}

event bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    return false;
    //return;    
}

event bool rfReqEntryItemList(int UserID)
{
    return false;
    //return;    
}

event bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqEntrySkillList(int UserID)
{
    return false;
    //return;    
}

event bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqItemList(int UID)
{
    return false;
    //return;    
}

event bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    return false;
    //return;    
}

event bool rfAckItemListEnd()
{
    return false;
    //return;    
}

event bool rfReqEquipItem(int ItemID, BtrDouble UniqueID, int SlotPosition)
{
    return false;
    //return;    
}

event bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqConfirmItemChanged()
{
    return false;
    //return;    
}

event bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqDummy(int DelayCheck)
{
    return false;
    //return;    
}

event bool rfAckDummy(int Result)
{
    return false;
    //return;    
}

event bool rfReqChatNormal(string Message)
{
    return false;
    //return;    
}

event bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    return false;
    //return;    
}

event bool rfReqSendFriendInvite(int InviteUserID, string InviteName, string InviteMsg)
{
    return false;
    //return;    
}

event bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    return false;
    //return;    
}

event bool rfReqConfirmFriendInvite(int ReqUserID, string ReqedCharname, byte IsPermit)
{
    return false;
    //return;    
}

event bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    return false;
    //return;    
}

event bool rfReqBlockUserList()
{
    return false;
    //return;    
}

event bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckBlockUserList(array<string> CharName)
{
    return false;
    //return;    
}

event bool rfAckBlockUserListEnd()
{
    return false;
    //return;    
}

event bool rfReqAddBlockUserList(string CharName)
{
    return false;
    //return;    
}

event bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqRemoveBlockUserList(string CharName)
{
    return false;
    //return;    
}

event bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqChatWispher(string CharName, string Message)
{
    return false;
    //return;    
}

event bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    return false;
    //return;    
}

event bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    return false;
    //return;    
}

event bool rfReqSendMemo(array<string> cnames, string Msg, int ItemUID)
{
    return false;
    //return;    
}

event bool rfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    return false;
    //return;    
}

event bool rfReqRecvMemo(string cnameFrom, byte MemoType)
{
    return false;
    //return;    
}

event bool rfReqMemoList(byte Type, byte MemoType)
{
    return false;
    //return;    
}

event bool rfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    return false;
    //return;    
}

event bool rfAckEndMemoList()
{
    return false;
    //return;    
}

event bool rfReqReadMemo(int MemoIdx)
{
    return false;
    //return;    
}

event bool rfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    return false;
    //return;    
}

event bool rfReqDelMemo(array<int> MemoIdx, byte Type)
{
    return false;
    //return;    
}

event bool rfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    return false;
    //return;    
}

event bool rfReqUserSkillList(int UserID)
{
    return false;
    //return;    
}

event bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    return false;
    //return;    
}

event bool rfAckUserSkillListEnd()
{
    return false;
    //return;    
}

event bool rfReqEquipSkill(int SkillID, int SkillUniqueID, byte NewSlotPosition)
{
    return false;
    //return;    
}

event bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqConfirmSkillChanged()
{
    return false;
    //return;    
}

event bool rfAckConfirmSkillChanged(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqNotifyChangedItemState()
{
    return false;
    //return;    
}

event bool rfAckNotifyChangedItemState(int UserID, array<int> ItemIDs, array<byte> NewStates, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqNotifyChangedSkillState()
{
    return false;
    //return;    
}

event bool rfAckNotifyChangedSkillState(int UserID, array<int> SkillIDs, array<byte> NewStates, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqNotifyExpiredSkillIDs()
{
    return false;
    //return;    
}

event bool rfAckNotifyExpiredSkillIDs(int UserID, array<BtrDouble> ExpiredSkillUniqueIDs, array<int> ExpiredSkillIDs, int Result, string ErrMsg, array<byte> ExpiredSkillSlotPositions)
{
    return false;
    //return;    
}

event bool rfReqNotifyExpiredItemIDs()
{
    return false;
    //return;    
}

event bool rfAckNotifyExpiredItemIDs(int UserID, array<BtrDouble> ExpiredItemUniqueIDs, array<int> ExpiredItemIDs, array<int> ExpiredItemPartIDs, array<byte> ExpiredItemSlotPos, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqGiveSkill()
{
    return false;
    //return;    
}

event bool rfAckGiveSkill(int SkillID, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqForceGameOver()
{
    return false;
    //return;    
}

event bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqShopItemList()
{
    return false;
    //return;    
}

event bool rfAckShopItemListStart(int Count)
{
    return false;
    //return;    
}

event bool rfAckShopItemList(array<int> ItemID)
{
    return false;
    //return;    
}

event bool rfAckShopItemListEnd()
{
    return false;
    //return;    
}

event bool rfReqBuyShopItem(int ItemID, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    return false;
    //return;    
}

event bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    return false;
    //return;    
}

event bool rfReqSellShopItem(BtrDouble ItemUniqueID, int Count)
{
    return false;
    //return;    
}

event bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    return false;
    //return;    
}

event bool rfReqModifyWeapon(BtrDouble UniqueID, int AddPartID, int PaintID)
{
    return false;
    //return;    
}

event bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    return false;
    //return;    
}

event bool rfReqUpdateWeaponDurability(int TotalPlayTime, array<int> OwnerID, array<int> Number, array<BtrDouble> UniqueItemID, array<int> UsingSec, array<int> UsingRoundInSD)
{
    return false;
    //return;    
}

event bool rfAckUpdateWeaponDurability(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> Durability, array<byte> IsDestroy, array<BtrDouble> FailedWeaponUniqueID)
{
    return false;
    //return;    
}

event bool rfReqRepairCost(array<BtrDouble> UniqueItemID)
{
    return false;
    //return;    
}

event bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    return false;
    //return;    
}

event bool rfReqRepairItem(array<BtrDouble> UniqueItemID)
{
    return false;
    //return;    
}

event bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    return false;
    //return;    
}

event bool rfReqQSlotList()
{
    return false;
    //return;    
}

event bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    return false;
    //return;    
}

event bool rfReqUpdateQSlot(int QSlotID, string QSlotName, BtrDouble MWItemID, BtrDouble PistolItemID, BtrDouble TWItemID1, BtrDouble TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4)
{
    return false;
    //return;    
}

event bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqMyMoney()
{
    return false;
    //return;    
}

event bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    return false;
    //return;    
}

event bool rfReqAuctionMyItemRegister(BtrDouble UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice)
{
    return false;
    //return;    
}

event bool rfAckAuctionMyItemRegister(int Result, string ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain)
{
    return false;
    //return;    
}

event bool rfReqAuctionMyItemCancel(int UniqueID)
{
    return false;
    //return;    
}

event bool rfAckAuctionMyItemCancel(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqAuctionItemList(byte Section, string Keyword, int ItemRank, byte ItemClassfy, byte IsAvailable, int PageNum, int Count, int SortOpt)
{
    return false;
    //return;    
}

event bool rfAckAuctionItemListStart(int Result, string ErrMsg, byte Section, int PageNum, int Count)
{
    return false;
    //return;    
}

event bool rfAckAuctionItemList(byte Section, array<int> UniqueIDs, array<int> ItemIDs, array<int> AddPartsIDs, array<BtrDouble> UntilTimes, array<int> BiddingPrices, array<int> InstantlyByuingPrices, array<int> ItemDamageds, array<string> HighestBidderNames, array<string> SellerNames, array<int> ItemCount)
{
    return false;
    //return;    
}

event bool rfAckAuctionItemListEnd(byte Section)
{
    return false;
    //return;    
}

event bool rfReqAuctionInstantlyBuying(int UniqueID)
{
    return false;
    //return;    
}

event bool rfAckAuctionInstantlyBuying(int Result, string ErrMsg, int PointRemain)
{
    return false;
    //return;    
}

event bool rfReqAuctionBidding(int UniqueID, int BiddingPrice)
{
    return false;
    //return;    
}

event bool rfAckAuctionBidding(int Result, string ErrMsg, int PointRemain)
{
    return false;
    //return;    
}

event bool rfReqEntryQSlotUniqueIDList(int UserNum)
{
    return false;
    //return;    
}

event bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    return false;
    //return;    
}

event bool rfReqEntryQSlotIDList(int UserNum)
{
    return false;
    //return;    
}

event bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    return false;
    //return;    
}

event bool rfReqServerTime()
{
    return false;
    //return;    
}

event bool rfAckServerTime(int Time)
{
    return false;
    //return;    
}

event bool rfReqAuctionItemListCount(byte Section, byte Classfy, int ItemType, int ItemGrade)
{
    return false;
    //return;    
}

event bool rfAckAuctionItemListCount(int Result, string ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count)
{
    return false;
    //return;    
}

event bool rfReqGameOverEnd()
{
    return false;
    //return;    
}

event bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqSellShopItemInfo(BtrDouble UniqueItemID, int Count)
{
    return false;
    //return;    
}

event bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    return false;
    //return;    
}

event bool rfReqDupCheckClanName(string ClanNam)
{
    return false;
    //return;    
}

event bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqCreateClan(string ClanName, string ClanURL, string ClanIntro, string ClanKeyword, byte ClanRegion)
{
    return false;
    //return;    
}

event bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return false;
    //return;    
}

event bool rfReqClanInfo(string ClanName)
{
    return false;
    //return;    
}

event bool rfAckClanInfo(ClanInfo stClanInfo)
{
    return false;
    //return;    
}

event bool rfReqInviteClan(string CharName, string InviteMsg)
{
    return false;
    //return;    
}

event bool rfAckInviteClan(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    return false;
    //return;    
}

event bool rfAckRecvClanInvite(int InviterUserDBID, string InviterCharname, string InviterMsg, string ClanName, byte Permit)
{
    return false;
    //return;    
}

event bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    return false;
    //return;    
}

event bool rfReqJoinClan(string ClanName, string ClanManagerName, string Message)
{
    return false;
    //return;    
}

event bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    return false;
    //return;    
}

event bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    return false;
    //return;    
}

event bool rfAckRecvJoinClan(int UserIdx, string CharName, string ReqMsg, byte Permit)
{
    return false;
    //return;    
}

event bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    return false;
    //return;    
}

event bool rfReqSerachClan(byte SearchType, string Keyword, byte ClanStatus, byte ClanRegion, int ReqPage)
{
    return false;
    //return;    
}

event bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    return false;
    //return;    
}

event bool rfReqClanUserList(string ClanName)
{
    return false;
    //return;    
}

event bool rfAckClanUserListStart(int Result, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    return false;
    //return;    
}

event bool rfAckClanUserListEnd()
{
    return false;
    //return;    
}

event bool rfReqAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return false;
    //return;    
}

event bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    return false;
    //return;    
}

event bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return false;
    //return;    
}

event bool rfReqClanNews(string ClanName)
{
    return false;
    //return;    
}

event bool rfAckClanNews(array<string> IssueDate, array<byte> IssueType, array<string> IssuedClanMember)
{
    return false;
    //return;    
}

event bool rfReqClanSecession(string ClanName)
{
    return false;
    //return;    
}

event bool rfAckClanSecession(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    return false;
    //return;    
}

event bool rfReqClanClose(string ClanName)
{
    return false;
    //return;    
}

event bool rfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    return false;
    //return;    
}

event bool rfReqClanChangeInfo(string ClanName, byte IsRecruit, byte Region, string Keyword, string ClanIntro, string Notice)
{
    return false;
    //return;    
}

event bool rfAckClanChangeInfo(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqClanPersonelIntro(string ClanName, string CharName, string PersonelIntro)
{
    return false;
    //return;    
}

event bool rfAckClanPersonelIntro(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return false;
    //return;    
}

event bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    return false;
    //return;    
}

event bool rfReqSuccessStartGame(int LoadingStep)
{
    return false;
    //return;    
}

event bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    return false;
    //return;    
}

event bool rfReqFailedStartGame(int LoadingStep)
{
    return false;
    //return;    
}

event bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    return false;
    //return;    
}

event bool rfReqNotifyLoadingState(byte LoadingState)
{
    return false;
    //return;    
}

event bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    return false;
    //return;    
}

event bool rfReqTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    return false;
    //return;    
}

event bool rfAckTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    return false;
    //return;    
}

event bool rfReqChatClan(string Message)
{
    return false;
    //return;    
}

event bool rfAckChatClan(string CharName, string Message, int Result)
{
    return false;
    //return;    
}

event bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    return false;
    //return;    
}

event bool rfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID)
{
    return false;
    //return;    
}

event bool rfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    return false;
    //return;    
}

event bool rfReqSendGift(int ItemID, string RecvCharname, string RecvMessage, byte BuyOption1, byte BuyOption2)
{
    return false;
    //return;    
}

event bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    return false;
    //return;    
}

event bool rfReqAuctionTradeHistory(int ItemID, int PartID)
{
    return false;
    //return;    
}

event bool rfAckAuctionTradeHistory(int Result, string ErrMsg, int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    return false;
    //return;    
}

event bool rfReqLogGetScore(KillDeathLog KillDeathLogParam, array<int> AssistUIDs, array<byte> AssistScores)
{
    return false;
    //return;    
}

event bool rfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, byte VTeam, byte VTeamAD, int AFScore, int RSAScore, int Round)
{
    return false;
    //return;    
}

event bool rfReqGetServerTime()
{
    return false;
    //return;    
}

event bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    return false;
    //return;    
}

event bool rfReqForceNatTypeSetting(int NatType)
{
    return false;
    //return;    
}

event bool rfReqDBCharInfo(string CharName)
{
    return false;
    //return;    
}

event bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_InstallBomb(int InstallerUID, byte InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_DefuseBomb(int DefuserUID, byte DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange)
{
    return false;
    //return;    
}

event bool rfReqNotifyChangeRoomState(byte RoomState)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_TakeAPoint(array<int> TakerUID, byte TakePos, array<float> TakerXCoord, array<float> TakerYCoord, array<float> TakerZCoord, array<int> TakerPos, array<int> TakerWeaponID, array<int> TakerWeaponPartID, array<int> TakerRange)
{
    return false;
    //return;    
}

event bool rfReqForceDisconnectUDPFromHost(int UserID)
{
    return false;
    //return;    
}

event bool rfAckForceDisconnectUDPFromHost(int Result)
{
    return false;
    //return;    
}

event bool rfReqRecvForceDisconnectUDPFromHost(int Result)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_SetGameStartTime(array<int> UID)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_SetRoundStartTime(array<int> UID)
{
    return false;
    //return;    
}

event bool rfReqWriteServerLog(byte Destination, string LogMsg)
{
    return false;
    //return;    
}

event bool rfReqUpdateMyHostPriorityPoint(int HostPriorityPoint)
{
    return false;
    //return;    
}

event bool rfReqGetUserHostPriorityPoint(int UserID)
{
    return false;
    //return;    
}

event bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    return false;
    //return;    
}

event bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber)
{
    return false;
    //return;    
}

event bool rfReqNotifyRecvDummyForHolePunching(int ClientUserID, byte Phrase)
{
    return false;
    //return;    
}

event bool rfReqGetHolePunchingResult()
{
    return false;
    //return;    
}

event bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    return false;
    //return;    
}

event bool rfReqNotifyHostBlocking(byte Blocking)
{
    return false;
    //return;    
}

event bool rfAckNotifyHostBlocking(int Result, byte Blocking)
{
    return false;
    //return;    
}

event bool rfReqGetIsHostBlocking()
{
    return false;
    //return;    
}

event bool rfAckGetIsHostBlocking(int Result, byte Blocking)
{
    return false;
    //return;    
}

event bool rfReqIsAvailClanURL(string ClanURL)
{
    return false;
    //return;    
}

event bool rfAckIsAvailClanURL(string ClanURL, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    return false;
    //return;    
}

event bool rfReqGamePlay_GetChopper(int GetChopperUID, array<int> GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, string ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord)
{
    return false;
    //return;    
}

event bool rfReqCheckEquipedWeaponDurability()
{
    return false;
    //return;    
}

event bool rfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    return false;
    //return;    
}

event bool rfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3)
{
    return false;
    //return;    
}

event bool rfAckGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3)
{
    return false;
    //return;    
}

event bool rfReqDeleteFriend(array<string> DeleteCharName)
{
    return false;
    //return;    
}

event bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    return false;
    //return;    
}

event bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    return false;
    //return;    
}

event bool rfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count)
{
    return false;
    //return;    
}

event bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return false;
    //return;    
}

event bool rfReqSpecificGameRoomInfo(int RoomNum)
{
    return false;
    //return;    
}

event bool rfAckSpecificGameRoomInfo(int Result, int GameNum, string Title, string MapName, int MapNum, byte UserCount, byte MaxCount, string GameModeName, int ModeNum, byte WeaponLimit, byte IsHardCore, byte Status, string RoomOwnerIP, int GameMinute, string RoomOwnerName, byte IsSpecial, byte IsPassword)
{
    return false;
    //return;    
}

event bool rfReqSpecificChannelUserInfo(int UserID)
{
    return false;
    //return;    
}

event bool rfAckSpecificChannelUserInfo(int UID, string UserID, int UserLevels, string ClanName, int ClanPattern, int ClanBG, int ClanBL, int Result, string ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return false;
    //return;    
}

event bool rfReqNotice_GM(byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return false;
    //return;    
}

event bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return false;
    //return;    
}

event bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    return false;
    //return;    
}

event bool rfReqForceDisconnectUser_GM(string CharName)
{
    return false;
    //return;    
}

event bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    return false;
    //return;    
}

event bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    return false;
    //return;    
}

event bool rfReqChatWispherMyCommunity(string SourceCharName, string SenderName, string Msg)
{
    return false;
    //return;    
}

event bool rfAckChatWispherMyCommunity(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    return false;
    //return;    
}

event bool rfReqNotifyMyCharInfoToRoomUser()
{
    return false;
    //return;    
}

event bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    return false;
    //return;    
}

event bool rfReqStartHolePunching(int GameType, int ReqStartUserID)
{
    return false;
    //return;    
}

event bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    return false;
    //return;    
}

event bool rfReqForceFailedClientLoading(int FailedUserID, int ErrCode)
{
    return false;
    //return;    
}

event bool rfAckForceFailedClientLoading(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqRecvForceFailedClientLoading(int ErrCode)
{
    return false;
    //return;    
}

event bool rfReqItemListInItemBox(BtrDouble ItemUniqueID, int BoxItemID, byte FromContent)
{
    return false;
    //return;    
}

event bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID, byte FromContent)
{
    return false;
    //return;    
}

event bool rfReqGetItemFromItemBox(BtrDouble ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    return false;
    //return;    
}

event bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    return false;
    //return;    
}

event bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_GetReady()
{
    return false;
    //return;    
}

event bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_StartCombat(array<int> MapNumArray, int VersusMode)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_NotifiyStartCombat(array<int> MapNumArray, int VersusMode)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_InviteCrew(string Invitee)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_RecvInviteCrew(int Result, string Inviter)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_Join(int WaittingID)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_MemberList()
{
    return false;
    //return;    
}

event bool rfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_Leave(int WaittingID)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_Leave(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_LeaveNotify(string CharName)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_Chat(string Msg)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_Chat(int Result, string ErrMsg, string CharName, string Msg)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, string NewLeaderName)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_StopSearching()
{
    return false;
    //return;    
}

event bool rfAckClanMatch_StopSearching()
{
    return false;
    //return;    
}

event bool rfReqInviteGameRoom(string GuestCharName)
{
    return false;
    //return;    
}

event bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    return false;
    //return;    
}

event bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    return false;
    //return;    
}

event bool rfAckRecvInviteGameRoom(string RoomUniqueID, int RoomNumber, byte Answer, string InviteCharName)
{
    return false;
    //return;    
}

event bool rfAckRecvInviteGameRoomResult(int Result)
{
    return false;
    //return;    
}

event bool rfReqLimitedListInChannel()
{
    return false;
    //return;    
}

event bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_StartSearching(int RequestCount)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_StartSearching(int Result, string ErrMsg, int ShouldWaitMore)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_FoundMatch()
{
    return false;
    //return;    
}

event bool rfReqPermanentRoomInfo(int RoomNum)
{
    return false;
    //return;    
}

event bool rfAckPermanentRoomInfo(int Result, int ClanIdx, byte FixedGameMode, byte FixedMaxUserCnt)
{
    return false;
    //return;    
}

event bool rfReqQuestList()
{
    return false;
    //return;    
}

event bool rfAckQuestListStart(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> QuestType, array<byte> IsComplete)
{
    return false;
    //return;    
}

event bool rfAckQuestListEnd()
{
    return false;
    //return;    
}

event bool rfReqQuestUpdate(int UniqueID, int GameRoomNum, array<int> QuestID, array<int> CountPrograss)
{
    return false;
    //return;    
}

event bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    return false;
    //return;    
}

event bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    return false;
    //return;    
}

event bool rfReqPCBangUserList()
{
    return false;
    //return;    
}

event bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return false;
    //return;    
}

event bool rfAckPCBangUserListEnd()
{
    return false;
    //return;    
}

event bool rfReqRegisterMainPCBang()
{
    return false;
    //return;    
}

event bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqRegisteredPCBangInfo()
{
    return false;
    //return;    
}

event bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    return false;
    //return;    
}

event bool rfReqWebzenCash()
{
    return false;
    //return;    
}

event bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    return false;
    //return;    
}

event bool rfReqWebzenShopScriptVersion()
{
    return false;
    //return;    
}

event bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    return false;
    //return;    
}

event bool rfReqBuyItemByWebzenCashGP20(int ProductNo, byte Cointype, BtrDouble ItemID)
{
    return false;
    //return;    
}

event bool rfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, array<int> ItemIDs, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    return false;
    //return;    
}

event bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqGiftItemByWebzenCashGP20(string ReceiverCharName, string Message, int ProductNo, byte Cointype)
{
    return false;
    //return;    
}

event bool rfReqGiftItemByWebzenCash(string ReceiverCharName, string Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq)
{
    return false;
    //return;    
}

event bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    return false;
    //return;    
}

event bool rfReqWebzenBillingStorageList(int Page, int CountForPage, byte Type)
{
    return false;
    //return;    
}

event bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    return false;
    //return;    
}

event bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    return false;
    //return;    
}

event bool rfAckWebzenBillingStorageListEnd()
{
    return false;
    //return;    
}

event bool rfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, byte StorageItemType)
{
    return false;
    //return;    
}

event bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    return false;
    //return;    
}

event bool rfReqParamCheckSum(string key, string Value)
{
    return false;
    //return;    
}

event bool rfAckParamCheckSum(int Result)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    return false;
    //return;    
}

event bool rfReqGetBotID(byte AFCount, byte RSACount)
{
    return false;
    //return;    
}

event bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    return false;
    //return;    
}

event bool rfReqReturnBotID(array<int> BotID)
{
    return false;
    //return;    
}

event bool rfAckReturnBotID(int Result)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_GetClanWaittingRoomInfo()
{
    return false;
    //return;    
}

event bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    return false;
    //return;    
}

event bool rfReqIsPaidWebzenPCBang(byte IsPaid)
{
    return false;
    //return;    
}

event bool rfReqCharBlockInfo()
{
    return false;
    //return;    
}

event bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    return false;
    //return;    
}

event bool rfReqQuestGetAvailableEventList()
{
    return false;
    //return;    
}

event bool rfAckQuestGetAvailableEventList(int Result, string ErrMsg, array<int> QuestID)
{
    return false;
    //return;    
}

event bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    return false;
    //return;    
}

event bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    return false;
    //return;    
}

event bool rfReqChangeRoomTitle_GM(int RoomNumber, string NewRoomTitle)
{
    return false;
    //return;    
}

event bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    return false;
    //return;    
}

event bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    return false;
    //return;    
}

event bool rfReqRandomBox_Use(BtrDouble ItemIdx_RandomBox, BtrDouble ItemIdx_Key)
{
    return false;
    //return;    
}

event bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, BtrDouble KeyItemIdx, int KeyItemRemainCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    return false;
    //return;    
}

event bool rfReqSendSystemMsg(byte RecvType, string SendCharName, string RecvCharname, SystemMsgParam MsgInfo)
{
    return false;
    //return;    
}

event bool rfAckSendSystemMsg(int Result)
{
    return false;
    //return;    
}

event bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    return false;
    //return;    
}

event bool rfReqPaidItem_ChangeCharname(BtrDouble ItemIdx, string NewCharname)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    return false;
    //return;    
}

event bool rfReqPaidItem_EraseRecord(BtrDouble ItemIdx, int Command)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    return false;
    //return;    
}

event bool rfReqPaidItem_BroadCast(BtrDouble ItemIdx, int Command, string Message)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    return false;
    //return;    
}

event bool rfReqPaidItem_ClanMarkDupCheck(byte IsPaid, int Pattern, int BG, int BL)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqPaidItem_ChangeClanMark(BtrDouble ItemIdx, byte IsPaid, int Pattern, int BG, int BL)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    return false;
    //return;    
}

event bool rfReqRemoveCheckTeamBalanceList()
{
    return false;
    //return;    
}

event bool rfReqClanMatch_SetWaitRoomPublic(byte Set)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    return false;
    //return;    
}

event bool rfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    return false;
    //return;    
}

event bool rfAckExteriorRoomOwnerInfo()
{
    return false;
    //return;    
}

event bool rfReqSetLookForClan(byte IsLookingFor)
{
    return false;
    //return;    
}

event bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    return false;
    //return;    
}

event bool rfReqGetMyMailBoxState()
{
    return false;
    //return;    
}

event bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    return false;
    //return;    
}

event bool rfReqMyEquipedItemList()
{
    return false;
    //return;    
}

event bool rfAckMyEquipedItemList(array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<int> PaintID, array<BtrDouble> UniqueID, int Result)
{
    return false;
    //return;    
}

event bool rfReqMyEquipedSkillList()
{
    return false;
    //return;    
}

event bool rfAckMyEquipedSkillList(array<int> SkillIDs, array<int> SlotPositions, int Result)
{
    return false;
    //return;    
}

event bool rfReqMyEquipedQSlotList()
{
    return false;
    //return;    
}

event bool rfAckMyEquipedQSlotList(array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<BtrDouble> PistolUniqueID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<BtrDouble> TW1UniqueID, array<int> TWItemID1, array<BtrDouble> TW2UniqueID, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID, int Result)
{
    return false;
    //return;    
}

event bool rfReqRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    return false;
    //return;    
}

event bool rfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    return false;
    //return;    
}

event bool rfReqNotifyStartTutorial()
{
    return false;
    //return;    
}

event bool rfAckNotifyStartTutorial(int Result, int UserID)
{
    return false;
    //return;    
}

event bool rfReqNotifyEndTutorial(int TutorialResultType)
{
    return false;
    //return;    
}

event bool rfAckNotifyEndTutorial(int UserID, string CharName, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return false;
    //return;    
}

event bool rfReqServerShutdown(string AuthKey, int SecondAfter, BtrDouble ShutdownTime)
{
    return false;
    //return;    
}

event bool rfAckServerShutdown(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqServerType()
{
    return false;
    //return;    
}

event bool rfAckServerType(byte Type)
{
    return false;
    //return;    
}

event bool rfReqClanMatch_GetPublicWaitRoomList()
{
    return false;
    //return;    
}

event bool rfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_EndPublicWaitRoomList()
{
    return false;
    //return;    
}

event bool rfReqPaidItem_ChangeClanname(BtrDouble ItemIdx, string NewClanname)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    return false;
    //return;    
}

event bool rfReqEventNotify()
{
    return false;
    //return;    
}

event bool rfAckEventNotify(int Type)
{
    return false;
    //return;    
}

event bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    return false;
    //return;    
}

event bool rfReqDeleteMailAll(byte MailType)
{
    return false;
    //return;    
}

event bool rfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    return false;
    //return;    
}

event bool rfReqClanMatchResultHistory(string ClanNm)
{
    return false;
    //return;    
}

event bool rfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    return false;
    //return;    
}

event bool rfReqInGameRoomUserInfoChanged()
{
    return false;
    //return;    
}

event bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    return false;
    //return;    
}

event bool rfReqCharDetailInfo()
{
    return false;
    //return;    
}

event bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    return false;
    //return;    
}

event bool rfReqGetRankingInfoList(byte RankingType, byte CommunityType)
{
    return false;
    //return;    
}

event bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return false;
    //return;    
}

event bool rfAckGetRankingInfoListEnd()
{
    return false;
    //return;    
}

event bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    return false;
    //return;    
}

event bool rfAckNotifyUpdateCharInfo_TitleMark(string CharName, int TitleMarkID)
{
    return false;
    //return;    
}

event bool rfReqCommunityOptionList()
{
    return false;
    //return;    
}

event bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite)
{
    return false;
    //return;    
}

event bool rfReqSetCommunityOption(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite)
{
    return false;
    //return;    
}

event bool rfAckSetCommunityOption(int Result, string ErrStr)
{
    return false;
    //return;    
}

event bool rfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec)
{
    return false;
    //return;    
}

event bool rfReqLogOut(byte Reason)
{
    return false;
    //return;    
}

event bool rfAckLogOut(byte Result, byte Reason)
{
    return false;
    //return;    
}

event bool rfReqDedicateHost_Login(int ProcessID, int ChannelNum, int RoomNum)
{
    return false;
    //return;    
}

event bool rfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum)
{
    return false;
    //return;    
}

event bool rfReqFriendPosition(string TargetCharName, byte CommunityType)
{
    return false;
    //return;    
}

event bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    return false;
    //return;    
}

event bool rfReqSetClientVersion(int ClientVersion)
{
    return false;
    //return;    
}

event bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    return false;
    //return;    
}

event bool rfAckPopUpMessage(int MessageType)
{
    return false;
    //return;    
}

event bool rfAckMoveToLobby(byte MessageType)
{
    return false;
    //return;    
}

event bool rfAckTencent_StartTenProtect(int CharDBID)
{
    return false;
    //return;    
}

event bool rfReqGameMapData()
{
    return false;
    //return;    
}

event bool rfAckGameMapData(array<int> nIdx, array<int> nMapID, array<string> nMapNm, array<float> fSupHealth, array<float> fSupHeli, array<float> fSupBomb, array<float> fSupUAV, array<int> nModFFA, array<int> nModFFAMax, array<int> nModTDM, array<int> nModTDMMax, array<int> nModSD, array<int> nModSDMax, array<int> nModDOM, array<int> nModDOMMax, array<int> nModSab, array<int> nModSabMax)
{
    return false;
    //return;    
}

event bool rfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    return false;
    //return;    
}

event bool rfNotifyNewClanName(string New_NickName)
{
    return false;
    //return;    
}

event bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    return false;
    //return;    
}

event bool rfReqAhnHsObject(array<byte> Data, int DataSize)
{
    return false;
    //return;    
}

event bool rfAckAhnHsObject(array<byte> Data, int DataSize)
{
    return false;
    //return;    
}

event bool rfReqAhnNotifyDisconnct(int Code)
{
    return false;
    //return;    
}

event bool rfReqUpdateUserPerformenceInfo(int UserID, int MinFps, int MaxFps, int AvgFps, int MinPing, int MaxPing, int AvgPing)
{
    return false;
    //return;    
}

event bool rfReqNotifyLoadingStatus(int Status)
{
    return false;
    //return;    
}

event bool rfReqShopItemData(int Ver)
{
    return false;
    //return;    
}

event bool rfAckShopItemData()
{
    return false;
    //return;    
}

event bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductName, array<int> ProductCode, array<byte> SaleType, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> SaleMasterFlag, array<int> SaleStatus, array<int> IsGift, array<BtrDouble> SaleEndTime, array<int> Discountcost)
{
    return false;
    //return;    
}

event bool rfReqNotifyShopItemDataEnd(int Ver)
{
    return false;
    //return;    
}

event bool rfReqCouponUse(string Serial)
{
    return false;
    //return;    
}

event bool rfAckCouponUse(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfNotifyCouponUseError(int Time)
{
    return false;
    //return;    
}

event bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, array<int> ScoreRewardUserID, array<byte> ScoreRewardTYPE, array<int> ScoreRewardID, array<int> ScoreRewardCount)
{
    return false;
    //return;    
}

event bool rfReqAttendanceList(byte ReqType, byte UpdateNum, byte UpdateState, BtrDouble PaidItemIdx)
{
    return false;
    //return;    
}

event bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    return false;
    //return;    
}

event bool rfReqPuzzleList(byte ReqType, byte UpdateState, BtrDouble PaidItemIdx)
{
    return false;
    //return;    
}

event bool rfAckPuzzleList(int Result, byte IsComplete, array<byte> UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    return false;
    //return;    
}

event bool rfReqDailyRewardListThisMonth()
{
    return false;
    //return;    
}

event bool rfAckDailyRewardListThisMonth(array<byte> Type, array<byte> Number, array<int> ItemID, array<int> ItemCount)
{
    return false;
    //return;    
}

event bool rfReqReceiveSpecialReward(int QuestID)
{
    return false;
    //return;    
}

event bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount)
{
    return false;
    //return;    
}

event bool rfReqSpecialQuestRank()
{
    return false;
    //return;    
}

event bool rfAckSpecialQuestRank(array<string> CharList)
{
    return false;
    //return;    
}

event bool rfReqLuckShop_LotteryWinnerList(int CapsuleItemID)
{
    return false;
    //return;    
}

event bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time, int GetItemID)
{
    return false;
    //return;    
}

event bool rfReqLuckShop_StorageInfo()
{
    return false;
    //return;    
}

event bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState)
{
    return false;
    //return;    
}

event bool rfReqLuckShop_RewardBuyingCount(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    return false;
    //return;    
}

event bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState)
{
    return false;
    //return;    
}

event bool rfReqLuckShop_RewardCoupon(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    return false;
    //return;    
}

event bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, BtrDouble Coupon_ItemUniqueID, int Coupon_Count_AfterReduction)
{
    return false;
    //return;    
}

event bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, BtrDouble ItemUniqueID, byte ChangeCount, int RemainCount)
{
    return false;
    //return;    
}

event bool rfReqUseItemDuringGame(string CharName, int ItemID, BtrDouble ItemUniqueID, byte UsingCount)
{
    return false;
    //return;    
}

event bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    return false;
    //return;    
}

// Export UBTTcpLink_Channel::execsfReqHash(FFrame&, void* const)
native function bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3)
{
    //native.HashField0;
    //native.HashField1;
    //native.HashField2;
    //native.HashField3;        
}

// Export UBTTcpLink_Channel::execsfAckHash(FFrame&, void* const)
native function bool sfAckHash(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqLogin(FFrame&, void* const)
native function bool sfReqLogin(string id)
{
    //native.id;        
}

// Export UBTTcpLink_Channel::execsfAckLogin(FFrame&, void* const)
native function bool sfAckLogin(int Result, string ErrMsg, int UserID, string CharName, string ClanName, CharInfo btCharInfo)
{
    //native.Result;
    //native.ErrMsg;
    //native.UserID;
    //native.CharName;
    //native.ClanName;
    //native.btCharInfo;        
}

// Export UBTTcpLink_Channel::execsfReqForceLogoutByOwner(FFrame&, void* const)
native function bool sfReqForceLogoutByOwner();

// Export UBTTcpLink_Channel::execsfReqStartNatDiag(FFrame&, void* const)
native function bool sfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    //native.Server1Addr;
    //native.Server1Port;
    //native.Server2Addr;
    //native.Server2Port;        
}

// Export UBTTcpLink_Channel::execsfAckStartNatDiag(FFrame&, void* const)
native function bool sfAckStartNatDiag(int NatType)
{
    //native.NatType;        
}

// Export UBTTcpLink_Channel::execsfReqLogin2(FFrame&, void* const)
native function bool sfReqLogin2(string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, string Guid, int UserType)
{
    //native.CharName;
    //native.TimeStamp;
    //native.LoginHash1;
    //native.LoginHash2;
    //native.LoginHash3;
    //native.LoginHash4;
    //native.LoginHash5;
    //native.Guid;
    //native.UserType;        
}

// Export UBTTcpLink_Channel::execsfAckLogin2(FFrame&, void* const)
native function bool sfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    //native.Result;
    //native.ErrMsg;
    //native.UserID;
    //native.CharName;
    //native.CurServerTime;
    //native.CharDBID;
    //native.IsGM;        
}

// Export UBTTcpLink_Channel::execsfReqCharInfo(FFrame&, void* const)
native function bool sfReqCharInfo();

// Export UBTTcpLink_Channel::execsfAckCharInfo(FFrame&, void* const)
native function bool sfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    //native.Result;
    //native.ErrMsg;
    //native.UserID;
    //native.CharName;
    //native.ClanName;
    //native.CM_Pattern;
    //native.CM_BG;
    //native.CM_BL;
    //native.stCharInfo;
    //native.InClanRank;
    //native.ClanLevel;        
}

// Export UBTTcpLink_Channel::execsfReqFriendList(FFrame&, void* const)
native function bool sfReqFriendList();

// Export UBTTcpLink_Channel::execsfAckFriendListStart(FFrame&, void* const)
native function bool sfAckFriendListStart(int Result, int TotalCount)
{
    //native.Result;
    //native.TotalCount;        
}

// Export UBTTcpLink_Channel::execsfAckFriendList(FFrame&, void* const)
native function bool sfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    //native.FriendName;
    //native.IsLogOn;
    //native.ClanName;
    //native.CM_Pattern;
    //native.CM_BG;
    //native.CM_BL;
    //native.LevelMarkID;
    //native.ClanLevel;
    //native.Level;
    //native.IsLookForClan;        
}

// Export UBTTcpLink_Channel::execsfAckFriendListEnd(FFrame&, void* const)
native function bool sfAckFriendListEnd();

// Export UBTTcpLink_Channel::execsfReqChannelList(FFrame&, void* const)
native function bool sfReqChannelList(int bChannelType)
{
    //native.bChannelType;        
}

// Export UBTTcpLink_Channel::execsfAckChannelList(FFrame&, void* const)
native function bool sfAckChannelList(array<int> id, array<string> Title, array<int> CurUser, array<int> MaxUser)
{
    //native.id;
    //native.Title;
    //native.CurUser;
    //native.MaxUser;        
}

// Export UBTTcpLink_Channel::execsfReqEnterChannel(FFrame&, void* const)
native function bool sfReqEnterChannel(int id)
{
    //native.id;        
}

// Export UBTTcpLink_Channel::execsfAckEnterChannel(FFrame&, void* const)
native function bool sfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    //native.id;
    //native.UID;
    //native.UserID;
    //native.Level;
    //native.ClanName;
    //native.ClanMarkPattern;
    //native.ClanMarkBG;
    //native.ClanMarkBL;
    //native.ClanGrade;
    //native.ClanWin;
    //native.ClanLose;
    //native.IsLookFor;
    //native.Result;
    //native.ErrMsg;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqLeaveChannel(FFrame&, void* const)
native function bool sfReqLeaveChannel(int id)
{
    //native.id;        
}

// Export UBTTcpLink_Channel::execsfAckLeaveChannel(FFrame&, void* const)
native function bool sfAckLeaveChannel(int Result, string UserID, int UID)
{
    //native.Result;
    //native.UserID;
    //native.UID;        
}

// Export UBTTcpLink_Channel::execsfReqChannelUserList(FFrame&, void* const)
native function bool sfReqChannelUserList(int id, int StartIndex, int Count)
{
    //native.id;
    //native.StartIndex;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckChannelUserList(FFrame&, void* const)
native function bool sfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    //native.TotalCount;
    //native.Count;
    //native.StartIndex;
    //native.UID;
    //native.UserID;
    //native.UserLevels;
    //native.ClanName;
    //native.ClanPattern;
    //native.ClanBG;
    //native.ClanBL;
    //native.ClanGrade;
    //native.ClanWin;
    //native.ClanLose;
    //native.IsLookForClan;
    //native.Result;
    //native.ErrMsg;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqRoomList(FFrame&, void* const)
native function bool sfReqRoomList(int id, int StartIndex, int Count)
{
    //native.id;
    //native.StartIndex;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckRoomListStart(FFrame&, void* const)
native function bool sfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex)
{
    //native.Result;
    //native.TotalCount;
    //native.Count;
    //native.StartIndex;        
}

// Export UBTTcpLink_Channel::execsfAckRoomList(FFrame&, void* const)
native function bool sfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    //native.GameNum;
    //native.Title;
    //native.MapName;
    //native.MapNum;
    //native.UserCount;
    //native.MaxCount;
    //native.ModeName;
    //native.ModeNum;
    //native.WeaponLimit;
    //native.IsTeamBalance;
    //native.Status;
    //native.RoomOwnerIP;
    //native.GameMinute;
    //native.RoomOwnerName;
    //native.IsSpecial;
    //native.IsPassword;
    //native.BotDifficult;
    //native.BotModeUserTeamNum;        
}

// Export UBTTcpLink_Channel::execsfAckRoomListEnd(FFrame&, void* const)
native function bool sfAckRoomListEnd();

// Export UBTTcpLink_Channel::execsfReqEnterRoom(FFrame&, void* const)
native function bool sfReqEnterRoom(int GameNum, string Password, byte RoomEnterType)
{
    //native.GameNum;
    //native.Password;
    //native.RoomEnterType;        
}

// Export UBTTcpLink_Channel::execsfAckEnterRoom(FFrame&, void* const)
native function bool sfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    //native.GameNum;
    //native.OwnerID;
    //native.UID;
    //native.UserID;
    //native.TeamNum;
    //native.Grade;
    //native.UserIP;
    //native.ClanName;
    //native.Clan_Mark_Pattern;
    //native.Clan_Mark_BG;
    //native.Clan_Mark_BL;
    //native.IsLookFor;
    //native.Result;
    //native.ErrMsg;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqRoomUserList(FFrame&, void* const)
native function bool sfReqRoomUserList(int GameNum)
{
    //native.GameNum;        
}

// Export UBTTcpLink_Channel::execsfAckRoomUserList(FFrame&, void* const)
native function bool sfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    //native.UID;
    //native.UserName;
    //native.Grade;
    //native.TeamNum;
    //native.Statue;
    //native.IsHost;
    //native.UserIP;
    //native.ClanName;
    //native.CM_Pattern;
    //native.CM_BG;
    //native.CM_BL;
    //native.IsLookingFor;
    //native.GMUID;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqLeaveRoom(FFrame&, void* const)
native function bool sfReqLeaveRoom(int Num)
{
    //native.Num;        
}

// Export UBTTcpLink_Channel::execsfAckLeaveRoom(FFrame&, void* const)
native function bool sfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    //native.Num;
    //native.UID;
    //native.UserID;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckExceedMaxUser(FFrame&, void* const)
native function bool sfAckExceedMaxUser();

// Export UBTTcpLink_Channel::execsfReqCreateGameRoom(FFrame&, void* const)
native function bool sfReqCreateGameRoom(GameRoomInfo NetRoomInfo)
{
    //native.NetRoomInfo;        
}

// Export UBTTcpLink_Channel::execsfAckCreateGameRoom(FFrame&, void* const)
native function bool sfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    //native.Result;
    //native.ErrMsg;
    //native.UserID;
    //native.RoomOwnerIP;
    //native.NetRoomInfo;        
}

// Export UBTTcpLink_Channel::execsfReqGameRoomInfo(FFrame&, void* const)
native function bool sfReqGameRoomInfo(int GameNum, int UID)
{
    //native.GameNum;
    //native.UID;        
}

// Export UBTTcpLink_Channel::execsfAckGameRoomInfo(FFrame&, void* const)
native function bool sfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    //native.Result;
    //native.ErrMsg;
    //native.RoomInfo;        
}

// Export UBTTcpLink_Channel::execsfReqSelectMap(FFrame&, void* const)
native function bool sfReqSelectMap(int GameNum, int UID, string MapName)
{
    //native.GameNum;
    //native.UID;
    //native.MapName;        
}

// Export UBTTcpLink_Channel::execsfAckSelectMap(FFrame&, void* const)
native function bool sfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    //native.GameNum;
    //native.UID;
    //native.MapName;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqBanUser(FFrame&, void* const)
native function bool sfReqBanUser(int GameNum, int UID, int BanUID)
{
    //native.GameNum;
    //native.UID;
    //native.BanUID;        
}

// Export UBTTcpLink_Channel::execsfAckBanUser(FFrame&, void* const)
native function bool sfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    //native.GameNum;
    //native.UID;
    //native.BanUID;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqChangeGameMode(FFrame&, void* const)
native function bool sfReqChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum)
{
    //native.GameNum;
    //native.UID;
    //native.GameMode;
    //native.GameModeNum;        
}

// Export UBTTcpLink_Channel::execsfAckChangeGameMode(FFrame&, void* const)
native function bool sfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    //native.GameNum;
    //native.UID;
    //native.GameMode;
    //native.GameModeNum;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqChangeRoomOwner(FFrame&, void* const)
native function bool sfReqChangeRoomOwner(int GameNum, int UID, int NewOwner)
{
    //native.GameNum;
    //native.UID;
    //native.NewOwner;        
}

// Export UBTTcpLink_Channel::execsfAckChangeRoomOwner(FFrame&, void* const)
native function bool sfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    //native.GameNum;
    //native.OldOwner;
    //native.NewOwner;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqChangeTeam(FFrame&, void* const)
native function bool sfReqChangeTeam(int TeamNum)
{
    //native.TeamNum;        
}

// Export UBTTcpLink_Channel::execsfAckChangeTeam(FFrame&, void* const)
native function bool sfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    //native.GameNumber;
    //native.UserID;
    //native.UID;
    //native.TeamNum;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqIsHostAvailable(FFrame&, void* const)
native function bool sfReqIsHostAvailable(string MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam)
{
    //native.MyIp;
    //native.CPUGrade;
    //native.RamGrade;
    //native.VGAGrade;
    //native.VGARam;        
}

// Export UBTTcpLink_Channel::execsfAckIsHostAvailable(FFrame&, void* const)
native function bool sfAckIsHostAvailable(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqGameHostInfo(FFrame&, void* const)
native function bool sfReqGameHostInfo(int GameNumber)
{
    //native.GameNumber;        
}

// Export UBTTcpLink_Channel::execsfAckGameHostInfo(FFrame&, void* const)
native function bool sfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    //native.GameNumber;
    //native.UserID;
    //native.IP;
    //native.Port;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqStartGame(FFrame&, void* const)
native function bool sfReqStartGame(int GameNumber)
{
    //native.GameNumber;        
}

// Export UBTTcpLink_Channel::execsfAckStartGame(FFrame&, void* const)
native function bool sfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    //native.GameNumber;
    //native.ClientsCount;
    //native.StartSeed;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqUpdateScore(FFrame&, void* const)
native function bool sfReqUpdateScore(int GameNumber, array<int> UserIDs, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> Points, array<int> Scores, array<int> TeamScores, array<int> RoundJoin, array<int> TimeJoin, int Playtime, byte GameEndType, array<string> UserNames, byte IsAIClear)
{
    //native.GameNumber;
    //native.UserIDs;
    //native.Kills;
    //native.Assists;
    //native.Deaths;
    //native.EXPs;
    //native.Points;
    //native.Scores;
    //native.TeamScores;
    //native.RoundJoin;
    //native.TimeJoin;
    //native.Playtime;
    //native.GameEndType;
    //native.UserNames;
    //native.IsAIClear;        
}

// Export UBTTcpLink_Channel::execsfAckUpdateScore(FFrame&, void* const)
native function bool sfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    //native.UserIDs;
    //native.NickNames;
    //native.TeamIDs;
    //native.Scores;
    //native.Kills;
    //native.Assists;
    //native.Deaths;
    //native.EXPs;
    //native.EXPBonuses;
    //native.Points;
    //native.PointBonuses;
    //native.TeamScores;
    //native.BonusOwnerID;
    //native.BonusID;        
}

// Export UBTTcpLink_Channel::execsfAckUpdateScoreResult(FFrame&, void* const)
native function bool sfAckUpdateScoreResult(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqChangeRoomMaxNum(FFrame&, void* const)
native function bool sfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum)
{
    //native.GameNum;
    //native.UID;
    //native.Number;
    //native.TeamNum;        
}

// Export UBTTcpLink_Channel::execsfAckChangeRoomMaxNum(FFrame&, void* const)
native function bool sfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, string ErrMsg)
{
    //native.GameNum;
    //native.Number;
    //native.TeamNumber;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckGameRoomDestroy(FFrame&, void* const)
native function bool sfAckGameRoomDestroy(int GameRoomNum)
{
    //native.GameRoomNum;        
}

// Export UBTTcpLink_Channel::execsfReqIsGameRoomPlaying(FFrame&, void* const)
native function bool sfReqIsGameRoomPlaying(int GameRoomNum)
{
    //native.GameRoomNum;        
}

// Export UBTTcpLink_Channel::execsfAckIsGameRoomPlaying(FFrame&, void* const)
native function bool sfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    //native.GameRoomNum;
    //native.IsPlaying;        
}

// Export UBTTcpLink_Channel::execsfReqGameOver(FFrame&, void* const)
native function bool sfReqGameOver(int UID, int GameRoomNumber)
{
    //native.UID;
    //native.GameRoomNumber;        
}

// Export UBTTcpLink_Channel::execsfAckGameOver(FFrame&, void* const)
native function bool sfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    //native.UID;
    //native.GameRoomNumber;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqRelayServerOn(FFrame&, void* const)
native function bool sfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    //native.RelayServerIP;
    //native.RelayServerPortNum;        
}

// Export UBTTcpLink_Channel::execsfReqRelayServerOff(FFrame&, void* const)
native function bool sfReqRelayServerOff();

// Export UBTTcpLink_Channel::execsfReqConnectGame(FFrame&, void* const)
native function bool sfReqConnectGame();

// Export UBTTcpLink_Channel::execsfAckConnectGame(FFrame&, void* const)
native function bool sfAckConnectGame(int UserID, int Result)
{
    //native.UserID;
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqDisconnectGame(FFrame&, void* const)
native function bool sfReqDisconnectGame();

// Export UBTTcpLink_Channel::execsfAckDisconnectGame(FFrame&, void* const)
native function bool sfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    //native.Result;
    //native.DisconnectUserID;
    //native.DisconnectUserName;        
}

// Export UBTTcpLink_Channel::execsfAckChangeHost(FFrame&, void* const)
native function bool sfAckChangeHost(byte ClientNum)
{
    //native.ClientNum;        
}

// Export UBTTcpLink_Channel::execsfAckChangeNewGuest(FFrame&, void* const)
native function bool sfAckChangeNewGuest(string HostIP)
{
    //native.HostIP;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyClientJoinTime(FFrame&, void* const)
native function bool sfReqNotifyClientJoinTime(int JoinedClientID)
{
    //native.JoinedClientID;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyClientJoinTime(FFrame&, void* const)
native function bool sfAckNotifyClientJoinTime(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqRegisterMyUdpInfo(FFrame&, void* const)
native function bool sfReqRegisterMyUdpInfo(byte IsHost, string IP, int Port, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    //native.IsHost;
    //native.IP;
    //native.Port;
    //native.Intervention;
    //native.HostInnerIP;
    //native.HostInnerPort;        
}

// Export UBTTcpLink_Channel::execsfAckRegisterMyUdpInfo(FFrame&, void* const)
native function bool sfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckRegisterOtherUdpInfo(FFrame&, void* const)
native function bool sfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    //native.UID;
    //native.IP;
    //native.Port;
    //native.NatType;
    //native.Intervention;
    //native.HostInnerIP;
    //native.HostInnerPort;        
}

// Export UBTTcpLink_Channel::execsfReqClientUdpInfoList(FFrame&, void* const)
native function bool sfReqClientUdpInfoList(int GameNum)
{
    //native.GameNum;        
}

// Export UBTTcpLink_Channel::execsfAckClientUdpInfoList(FFrame&, void* const)
native function bool sfAckClientUdpInfoList(int Result, string ErrMsg, array<int> UID, array<string> IP, array<int> Port)
{
    //native.Result;
    //native.ErrMsg;
    //native.UID;
    //native.IP;
    //native.Port;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyLevelUp(FFrame&, void* const)
native function bool sfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    //native.LevelUpUserID;
    //native.Level;
    //native.Exp;
    //native.ItemID;
    //native.PartID;        
}

// Export UBTTcpLink_Channel::execsfReqChangeRoomSetting(FFrame&, void* const)
native function bool sfReqChangeRoomSetting(GameRoomInfo RoomInfo)
{
    //native.RoomInfo;        
}

// Export UBTTcpLink_Channel::execsfAckChangeRoomSetting(FFrame&, void* const)
native function bool sfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    //native.Result;
    //native.ErrMsg;
    //native.RoomInfo;        
}

// Export UBTTcpLink_Channel::execsfReqSetUserBootySeedValue(FFrame&, void* const)
native function bool sfReqSetUserBootySeedValue(int UserID, int SeedValue)
{
    //native.UserID;
    //native.SeedValue;        
}

// Export UBTTcpLink_Channel::execsfAckSetUserBootySeedValue(FFrame&, void* const)
native function bool sfAckSetUserBootySeedValue(int UserID, int Result, string ErrMsg)
{
    //native.UserID;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqGetBooty(FFrame&, void* const)
native function bool sfReqGetBooty(int RoomNumber)
{
    //native.RoomNumber;        
}

// Export UBTTcpLink_Channel::execsfAckGetBooty(FFrame&, void* const)
native function bool sfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    //native.Result;
    //native.ErrMsg;
    //native.PrizeWinUserID;
    //native.BootyItemID;
    //native.BootyPartsID;        
}

// Export UBTTcpLink_Channel::execsfAckGetBootyChoose(FFrame&, void* const)
native function bool sfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    //native.Result;
    //native.ErrMsg;
    //native.GiveType;
    //native.ItemUniqueNumber;
    //native.ItemID;
    //native.PartID;
    //native.ItemType;
    //native.UntilTime;
    //native.StackCount;
    //native.PaintID;        
}

// Export UBTTcpLink_Channel::execsfReqExteriorRoomInfo(FFrame&, void* const)
native function bool sfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    //native.SP;
    //native.RoomNumber;
    //native.IsPW;
    //native.RoomName;
    //native.MapName;
    //native.ModeName;
    //native.MapNum;
    //native.ModeNum;
    //native.IsTeamBalance;
    //native.MaxUserCount;
    //native.RoomUserCount;
    //native.RoomState;
    //native.BotDifficult;
    //native.WeaponLimit;
    //native.BotModeUserTeamNum;        
}

// Export UBTTcpLink_Channel::execsfAckExteriorRoomInfo(FFrame&, void* const)
native function bool sfAckExteriorRoomInfo();

// Export UBTTcpLink_Channel::execsfReqExteriorRoomUserCount(FFrame&, void* const)
native function bool sfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    //native.RoomNumber;
    //native.RoomUserCount;        
}

// Export UBTTcpLink_Channel::execsfAckExteriorRoomUserCount(FFrame&, void* const)
native function bool sfAckExteriorRoomUserCount();

// Export UBTTcpLink_Channel::execsfReqExteriorRoomState(FFrame&, void* const)
native function bool sfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    //native.RoomNumber;
    //native.RoomState;        
}

// Export UBTTcpLink_Channel::execsfAckExteriorRoomState(FFrame&, void* const)
native function bool sfAckExteriorRoomState();

// Export UBTTcpLink_Channel::execsfReqChangeUserState(FFrame&, void* const)
native function bool sfReqChangeUserState(byte NewState, byte CheckPlaying)
{
    //native.NewState;
    //native.CheckPlaying;        
}

// Export UBTTcpLink_Channel::execsfAckChangeUserState(FFrame&, void* const)
native function bool sfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    //native.Result;
    //native.ErrMsg;
    //native.UserIDs;
    //native.Positions;
    //native.Numbers;
    //native.OldStates;
    //native.NewStates;        
}

// Export UBTTcpLink_Channel::execsfReqEntryItemList(FFrame&, void* const)
native function bool sfReqEntryItemList(int UserID)
{
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfAckEntryItemList(FFrame&, void* const)
native function bool sfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    //native.UserIDs;
    //native.ItemIDs;
    //native.SlotPositions;
    //native.AddPartsID;
    //native.UniqueID;
    //native.PaintID;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqEntrySkillList(FFrame&, void* const)
native function bool sfReqEntrySkillList(int UserID)
{
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfAckEntrySkillList(FFrame&, void* const)
native function bool sfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    //native.UserIDs;
    //native.SkillIDs;
    //native.SlotPositions;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqItemList(FFrame&, void* const)
native function bool sfReqItemList(int UID)
{
    //native.UID;        
}

// Export UBTTcpLink_Channel::execsfAckItemListStart(FFrame&, void* const)
native function bool sfAckItemListStart(int Count, int Result, string ErrMsg)
{
    //native.Count;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckItemList(FFrame&, void* const)
native function bool sfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    //native.UniqueID;
    //native.ItemID;
    //native.ItemType;
    //native.Durability;
    //native.UntilTime;
    //native.SlotPosition;
    //native.AddPartsID;
    //native.DamageDegree;
    //native.ItemState;
    //native.StackCount;
    //native.PaintID;
    //native.TradeCount;        
}

// Export UBTTcpLink_Channel::execsfAckItemListEnd(FFrame&, void* const)
native function bool sfAckItemListEnd();

// Export UBTTcpLink_Channel::execsfReqEquipItem(FFrame&, void* const)
native function bool sfReqEquipItem(int ItemID, BtrDouble UniqueID, int SlotPosition)
{
    //native.ItemID;
    //native.UniqueID;
    //native.SlotPosition;        
}

// Export UBTTcpLink_Channel::execsfAckEquipItem(FFrame&, void* const)
native function bool sfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    //native.ChangedNewItemID;
    //native.ChangedNewUniqueID;
    //native.ChangedNewSlotPosition;
    //native.ChangedOldItemID;
    //native.ChangedOldUniqueID;
    //native.ChangedOldSlotPosition;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqConfirmItemChanged(FFrame&, void* const)
native function bool sfReqConfirmItemChanged();

// Export UBTTcpLink_Channel::execsfAckConfirmItemChanged(FFrame&, void* const)
native function bool sfAckConfirmItemChanged(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqDummy(FFrame&, void* const)
native function bool sfReqDummy(int DelayCheck)
{
    //native.DelayCheck;        
}

// Export UBTTcpLink_Channel::execsfAckDummy(FFrame&, void* const)
native function bool sfAckDummy(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqChatNormal(FFrame&, void* const)
native function bool sfReqChatNormal(string Message)
{
    //native.Message;        
}

// Export UBTTcpLink_Channel::execsfAckChatNormal(FFrame&, void* const)
native function bool sfAckChatNormal(int id, string Sender, string Message, int Result)
{
    //native.id;
    //native.Sender;
    //native.Message;
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqSendFriendInvite(FFrame&, void* const)
native function bool sfReqSendFriendInvite(int InviteUserID, string InviteName, string InviteMsg)
{
    //native.InviteUserID;
    //native.InviteName;
    //native.InviteMsg;        
}

// Export UBTTcpLink_Channel::execsfAckSendFriendInvite(FFrame&, void* const)
native function bool sfAckSendFriendInvite(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqRecvFriendInvite(FFrame&, void* const)
native function bool sfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    //native.ReqUserID;
    //native.ReqCharname;
    //native.InviteMsg;        
}

// Export UBTTcpLink_Channel::execsfReqConfirmFriendInvite(FFrame&, void* const)
native function bool sfReqConfirmFriendInvite(int ReqUserID, string ReqedCharname, byte IsPermit)
{
    //native.ReqUserID;
    //native.ReqedCharname;
    //native.IsPermit;        
}

// Export UBTTcpLink_Channel::execsfAckConfirmFriendInvite(FFrame&, void* const)
native function bool sfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqCompleteFriendInvite(FFrame&, void* const)
native function bool sfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    //native.CharnameToBeInvited;
    //native.IsPermit;        
}

// Export UBTTcpLink_Channel::execsfReqBlockUserList(FFrame&, void* const)
native function bool sfReqBlockUserList();

// Export UBTTcpLink_Channel::execsfAckBlockUserListStart(FFrame&, void* const)
native function bool sfAckBlockUserListStart(int Result, int TotalCount)
{
    //native.Result;
    //native.TotalCount;        
}

// Export UBTTcpLink_Channel::execsfAckBlockUserList(FFrame&, void* const)
native function bool sfAckBlockUserList(array<string> CharName)
{
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfAckBlockUserListEnd(FFrame&, void* const)
native function bool sfAckBlockUserListEnd();

// Export UBTTcpLink_Channel::execsfReqAddBlockUserList(FFrame&, void* const)
native function bool sfReqAddBlockUserList(string CharName)
{
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfAckAddBlockUserList(FFrame&, void* const)
native function bool sfAckAddBlockUserList(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqRemoveBlockUserList(FFrame&, void* const)
native function bool sfReqRemoveBlockUserList(string CharName)
{
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfAckRemoveBlockUserList(FFrame&, void* const)
native function bool sfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqChatWispher(FFrame&, void* const)
native function bool sfReqChatWispher(string CharName, string Message)
{
    //native.CharName;
    //native.Message;        
}

// Export UBTTcpLink_Channel::execsfAckChatWispher(FFrame&, void* const)
native function bool sfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    //native.Result;
    //native.ErrMsg;
    //native.ToCharName;        
}

// Export UBTTcpLink_Channel::execsfReqRecvChatWispher(FFrame&, void* const)
native function bool sfReqRecvChatWispher(string CharnameFrom, string Message)
{
    //native.CharnameFrom;
    //native.Message;        
}

// Export UBTTcpLink_Channel::execsfReqSendMemo(FFrame&, void* const)
native function bool sfReqSendMemo(array<string> cnames, string Msg, int ItemUID)
{
    //native.cnames;
    //native.Msg;
    //native.ItemUID;        
}

// Export UBTTcpLink_Channel::execsfAckSendMemo(FFrame&, void* const)
native function bool sfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    //native.CnamesToFail;
    //native.ResultArray;        
}

// Export UBTTcpLink_Channel::execsfReqRecvMemo(FFrame&, void* const)
native function bool sfReqRecvMemo(string cnameFrom, byte MemoType)
{
    //native.cnameFrom;
    //native.MemoType;        
}

// Export UBTTcpLink_Channel::execsfReqMemoList(FFrame&, void* const)
native function bool sfReqMemoList(byte Type, byte MemoType)
{
    //native.Type;
    //native.MemoType;        
}

// Export UBTTcpLink_Channel::execsfAckStartMemoList(FFrame&, void* const)
native function bool sfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.Type;
    //native.TotalCount;        
}

// Export UBTTcpLink_Channel::execsfAckMemoList(FFrame&, void* const)
native function bool sfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    //native.MemoIdx;
    //native.cnameFrom;
    //native.dateRecv;
    //native.Text;
    //native.Status;
    //native.UntilExpire;
    //native.ItemUID;
    //native.ItemID;
    //native.MsgType;
    //native.ItemPartID;        
}

// Export UBTTcpLink_Channel::execsfAckEndMemoList(FFrame&, void* const)
native function bool sfAckEndMemoList();

// Export UBTTcpLink_Channel::execsfReqReadMemo(FFrame&, void* const)
native function bool sfReqReadMemo(int MemoIdx)
{
    //native.MemoIdx;        
}

// Export UBTTcpLink_Channel::execsfAckReadMemo(FFrame&, void* const)
native function bool sfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    //native.cnameFrom;
    //native.Text;
    //native.dateRecv;
    //native.ItemUID;        
}

// Export UBTTcpLink_Channel::execsfReqDelMemo(FFrame&, void* const)
native function bool sfReqDelMemo(array<int> MemoIdx, byte Type)
{
    //native.MemoIdx;
    //native.Type;        
}

// Export UBTTcpLink_Channel::execsfAckDelMemo(FFrame&, void* const)
native function bool sfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    //native.Result;
    //native.ErrMsg;
    //native.FailedMemoID;        
}

// Export UBTTcpLink_Channel::execsfReqUserSkillList(FFrame&, void* const)
native function bool sfReqUserSkillList(int UserID)
{
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfAckUserSkillListStart(FFrame&, void* const)
native function bool sfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    //native.Count;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckUserSkillList(FFrame&, void* const)
native function bool sfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    //native.UniqueSkillID;
    //native.SkillID;
    //native.UntilTime;
    //native.SlotPosition;        
}

// Export UBTTcpLink_Channel::execsfAckUserSkillListEnd(FFrame&, void* const)
native function bool sfAckUserSkillListEnd();

// Export UBTTcpLink_Channel::execsfReqEquipSkill(FFrame&, void* const)
native function bool sfReqEquipSkill(int SkillID, int SkillUniqueID, byte NewSlotPosition)
{
    //native.SkillID;
    //native.SkillUniqueID;
    //native.NewSlotPosition;        
}

// Export UBTTcpLink_Channel::execsfAckEquipSkill(FFrame&, void* const)
native function bool sfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    //native.ChangedNewSkillID;
    //native.ChangedNewSkillUniqueID;
    //native.ChangedNewSlotPosition;
    //native.ChangedOldSkillID;
    //native.ChangedOldSkillUniqueID;
    //native.ChangedOldSlotPosition;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqConfirmSkillChanged(FFrame&, void* const)
native function bool sfReqConfirmSkillChanged();

// Export UBTTcpLink_Channel::execsfAckConfirmSkillChanged(FFrame&, void* const)
native function bool sfAckConfirmSkillChanged(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyChangedItemState(FFrame&, void* const)
native function bool sfReqNotifyChangedItemState();

// Export UBTTcpLink_Channel::execsfAckNotifyChangedItemState(FFrame&, void* const)
native function bool sfAckNotifyChangedItemState(int UserID, array<int> ItemIDs, array<byte> NewStates, int Result, string ErrMsg)
{
    //native.UserID;
    //native.ItemIDs;
    //native.NewStates;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyChangedSkillState(FFrame&, void* const)
native function bool sfReqNotifyChangedSkillState();

// Export UBTTcpLink_Channel::execsfAckNotifyChangedSkillState(FFrame&, void* const)
native function bool sfAckNotifyChangedSkillState(int UserID, array<int> SkillIDs, array<byte> NewStates, int Result, string ErrMsg)
{
    //native.UserID;
    //native.SkillIDs;
    //native.NewStates;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyExpiredSkillIDs(FFrame&, void* const)
native function bool sfReqNotifyExpiredSkillIDs();

// Export UBTTcpLink_Channel::execsfAckNotifyExpiredSkillIDs(FFrame&, void* const)
native function bool sfAckNotifyExpiredSkillIDs(int UserID, array<BtrDouble> ExpiredSkillUniqueIDs, array<int> ExpiredSkillIDs, int Result, string ErrMsg, array<byte> ExpiredSkillSlotPositions)
{
    //native.UserID;
    //native.ExpiredSkillUniqueIDs;
    //native.ExpiredSkillIDs;
    //native.Result;
    //native.ErrMsg;
    //native.ExpiredSkillSlotPositions;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyExpiredItemIDs(FFrame&, void* const)
native function bool sfReqNotifyExpiredItemIDs();

// Export UBTTcpLink_Channel::execsfAckNotifyExpiredItemIDs(FFrame&, void* const)
native function bool sfAckNotifyExpiredItemIDs(int UserID, array<BtrDouble> ExpiredItemUniqueIDs, array<int> ExpiredItemIDs, array<int> ExpiredItemPartIDs, array<byte> ExpiredItemSlotPos, int Result, string ErrMsg)
{
    //native.UserID;
    //native.ExpiredItemUniqueIDs;
    //native.ExpiredItemIDs;
    //native.ExpiredItemPartIDs;
    //native.ExpiredItemSlotPos;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqGiveSkill(FFrame&, void* const)
native function bool sfReqGiveSkill();

// Export UBTTcpLink_Channel::execsfAckGiveSkill(FFrame&, void* const)
native function bool sfAckGiveSkill(int SkillID, int Result, string ErrMsg)
{
    //native.SkillID;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqForceGameOver(FFrame&, void* const)
native function bool sfReqForceGameOver();

// Export UBTTcpLink_Channel::execsfAckForceGameOver(FFrame&, void* const)
native function bool sfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    //native.UserID;
    //native.GameRoomNumber;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqShopItemList(FFrame&, void* const)
native function bool sfReqShopItemList();

// Export UBTTcpLink_Channel::execsfAckShopItemListStart(FFrame&, void* const)
native function bool sfAckShopItemListStart(int Count)
{
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckShopItemList(FFrame&, void* const)
native function bool sfAckShopItemList(array<int> ItemID)
{
    //native.ItemID;        
}

// Export UBTTcpLink_Channel::execsfAckShopItemListEnd(FFrame&, void* const)
native function bool sfAckShopItemListEnd();

// Export UBTTcpLink_Channel::execsfReqBuyShopItem(FFrame&, void* const)
native function bool sfReqBuyShopItem(int ItemID, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    //native.ItemID;
    //native.ItemUniqueID;
    //native.BuyOption1;
    //native.BuyOption2;        
}

// Export UBTTcpLink_Channel::execsfAckBuyShopItem(FFrame&, void* const)
native function bool sfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    //native.ItemCount;
    //native.Result;
    //native.BoughtItemTypeID;
    //native.BoughtItemUniqueID;
    //native.BoughtPartID;
    //native.BoughtUntilTIme;
    //native.BoughtStackCnt;
    //native.PointRemain;
    //native.CashRemain;        
}

// Export UBTTcpLink_Channel::execsfReqSellShopItem(FFrame&, void* const)
native function bool sfReqSellShopItem(BtrDouble ItemUniqueID, int Count)
{
    //native.ItemUniqueID;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckSellShopItem(FFrame&, void* const)
native function bool sfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    //native.Result;
    //native.ErrMsg;
    //native.PointRemain;
    //native.CashRemain;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfReqModifyWeapon(FFrame&, void* const)
native function bool sfReqModifyWeapon(BtrDouble UniqueID, int AddPartID, int PaintID)
{
    //native.UniqueID;
    //native.AddPartID;
    //native.PaintID;        
}

// Export UBTTcpLink_Channel::execsfAckModifyWeapon(FFrame&, void* const)
native function bool sfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    //native.Result;
    //native.ErrMsg;
    //native.UniqueID;
    //native.AddPartID;
    //native.PaintID;
    //native.Point;
    //native.Cash;        
}

// Export UBTTcpLink_Channel::execsfReqUpdateWeaponDurability(FFrame&, void* const)
native function bool sfReqUpdateWeaponDurability(int TotalPlayTime, array<int> OwnerID, array<int> Number, array<BtrDouble> UniqueItemID, array<int> UsingSec, array<int> UsingRoundInSD)
{
    //native.TotalPlayTime;
    //native.OwnerID;
    //native.Number;
    //native.UniqueItemID;
    //native.UsingSec;
    //native.UsingRoundInSD;        
}

// Export UBTTcpLink_Channel::execsfAckUpdateWeaponDurability(FFrame&, void* const)
native function bool sfAckUpdateWeaponDurability(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> Durability, array<byte> IsDestroy, array<BtrDouble> FailedWeaponUniqueID)
{
    //native.Result;
    //native.ErrMsg;
    //native.UniqueItemID;
    //native.Durability;
    //native.IsDestroy;
    //native.FailedWeaponUniqueID;        
}

// Export UBTTcpLink_Channel::execsfReqRepairCost(FFrame&, void* const)
native function bool sfReqRepairCost(array<BtrDouble> UniqueItemID)
{
    //native.UniqueItemID;        
}

// Export UBTTcpLink_Channel::execsfAckRepairCost(FFrame&, void* const)
native function bool sfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    //native.Result;
    //native.ErrMsg;
    //native.UniqueItemID;
    //native.RepairCost;        
}

// Export UBTTcpLink_Channel::execsfReqRepairItem(FFrame&, void* const)
native function bool sfReqRepairItem(array<BtrDouble> UniqueItemID)
{
    //native.UniqueItemID;        
}

// Export UBTTcpLink_Channel::execsfAckRepairItem(FFrame&, void* const)
native function bool sfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    //native.Result;
    //native.ErrMsg;
    //native.UniqueItemID;
    //native.RepairCost;
    //native.DamageDegree;        
}

// Export UBTTcpLink_Channel::execsfReqQSlotList(FFrame&, void* const)
native function bool sfReqQSlotList();

// Export UBTTcpLink_Channel::execsfAckQSlotList(FFrame&, void* const)
native function bool sfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    //native.Result;
    //native.ErrMsg;
    //native.QSlotID;
    //native.QSlotName;
    //native.QSlotDispOrder;
    //native.MWItemID;
    //native.PistolItemID;
    //native.TWItemID1;
    //native.TWItemID2;
    //native.Skill1;
    //native.Skill2;
    //native.Skill3;
    //native.Skill4;        
}

// Export UBTTcpLink_Channel::execsfReqUpdateQSlot(FFrame&, void* const)
native function bool sfReqUpdateQSlot(int QSlotID, string QSlotName, BtrDouble MWItemID, BtrDouble PistolItemID, BtrDouble TWItemID1, BtrDouble TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4)
{
    //native.QSlotID;
    //native.QSlotName;
    //native.MWItemID;
    //native.PistolItemID;
    //native.TWItemID1;
    //native.TWItemID2;
    //native.Skill1;
    //native.Skill2;
    //native.Skill3;
    //native.Skill4;        
}

// Export UBTTcpLink_Channel::execsfAckUpdateQSlot(FFrame&, void* const)
native function bool sfAckUpdateQSlot(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqMyMoney(FFrame&, void* const)
native function bool sfReqMyMoney();

// Export UBTTcpLink_Channel::execsfAckMyMoney(FFrame&, void* const)
native function bool sfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    //native.Result;
    //native.ErrMsg;
    //native.Point;
    //native.Cash;        
}

// Export UBTTcpLink_Channel::execsfReqAuctionMyItemRegister(FFrame&, void* const)
native function bool sfReqAuctionMyItemRegister(BtrDouble UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice)
{
    //native.UniqueID;
    //native.ItemCount;
    //native.BeginPrice;
    //native.PeriodHour;
    //native.InstantlyBuyingPrice;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionMyItemRegister(FFrame&, void* const)
native function bool sfAckAuctionMyItemRegister(int Result, string ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain)
{
    //native.Result;
    //native.ErrMsg;
    //native.BeginPrice;
    //native.BuyPrice;
    //native.GuarantyPoint;
    //native.PointRemain;        
}

// Export UBTTcpLink_Channel::execsfReqAuctionMyItemCancel(FFrame&, void* const)
native function bool sfReqAuctionMyItemCancel(int UniqueID)
{
    //native.UniqueID;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionMyItemCancel(FFrame&, void* const)
native function bool sfAckAuctionMyItemCancel(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqAuctionItemList(FFrame&, void* const)
native function bool sfReqAuctionItemList(byte Section, string Keyword, int ItemRank, byte ItemClassfy, byte IsAvailable, int PageNum, int Count, int SortOpt)
{
    //native.Section;
    //native.Keyword;
    //native.ItemRank;
    //native.ItemClassfy;
    //native.IsAvailable;
    //native.PageNum;
    //native.Count;
    //native.SortOpt;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionItemListStart(FFrame&, void* const)
native function bool sfAckAuctionItemListStart(int Result, string ErrMsg, byte Section, int PageNum, int Count)
{
    //native.Result;
    //native.ErrMsg;
    //native.Section;
    //native.PageNum;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionItemList(FFrame&, void* const)
native function bool sfAckAuctionItemList(byte Section, array<int> UniqueIDs, array<int> ItemIDs, array<int> AddPartsIDs, array<BtrDouble> UntilTimes, array<int> BiddingPrices, array<int> InstantlyByuingPrices, array<int> ItemDamageds, array<string> HighestBidderNames, array<string> SellerNames, array<int> ItemCount)
{
    //native.Section;
    //native.UniqueIDs;
    //native.ItemIDs;
    //native.AddPartsIDs;
    //native.UntilTimes;
    //native.BiddingPrices;
    //native.InstantlyByuingPrices;
    //native.ItemDamageds;
    //native.HighestBidderNames;
    //native.SellerNames;
    //native.ItemCount;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionItemListEnd(FFrame&, void* const)
native function bool sfAckAuctionItemListEnd(byte Section)
{
    //native.Section;        
}

// Export UBTTcpLink_Channel::execsfReqAuctionInstantlyBuying(FFrame&, void* const)
native function bool sfReqAuctionInstantlyBuying(int UniqueID)
{
    //native.UniqueID;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionInstantlyBuying(FFrame&, void* const)
native function bool sfAckAuctionInstantlyBuying(int Result, string ErrMsg, int PointRemain)
{
    //native.Result;
    //native.ErrMsg;
    //native.PointRemain;        
}

// Export UBTTcpLink_Channel::execsfReqAuctionBidding(FFrame&, void* const)
native function bool sfReqAuctionBidding(int UniqueID, int BiddingPrice)
{
    //native.UniqueID;
    //native.BiddingPrice;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionBidding(FFrame&, void* const)
native function bool sfAckAuctionBidding(int Result, string ErrMsg, int PointRemain)
{
    //native.Result;
    //native.ErrMsg;
    //native.PointRemain;        
}

// Export UBTTcpLink_Channel::execsfReqEntryQSlotUniqueIDList(FFrame&, void* const)
native function bool sfReqEntryQSlotUniqueIDList(int UserNum)
{
    //native.UserNum;        
}

// Export UBTTcpLink_Channel::execsfAckEntryQSlotUniqueIDList(FFrame&, void* const)
native function bool sfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    //native.UserNum;
    //native.QSlotDispOrder;
    //native.MWUniqueID;
    //native.PistolUniqueID;
    //native.TW1UniqueID;
    //native.TW2UniqueID;        
}

// Export UBTTcpLink_Channel::execsfReqEntryQSlotIDList(FFrame&, void* const)
native function bool sfReqEntryQSlotIDList(int UserNum)
{
    //native.UserNum;        
}

// Export UBTTcpLink_Channel::execsfAckEntryQSlotIDList(FFrame&, void* const)
native function bool sfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    //native.UserNum;
    //native.QSlotDispOrder;
    //native.MWItemID;
    //native.MWPartID;
    //native.MWPaintID;
    //native.PistolItemID;
    //native.PistolPartID;
    //native.PistolPaintID;
    //native.TWItemID1;
    //native.TWItemID2;
    //native.Skill1ID;
    //native.Skill2ID;
    //native.Skill3ID;
    //native.Skill4ID;        
}

// Export UBTTcpLink_Channel::execsfReqServerTime(FFrame&, void* const)
native function bool sfReqServerTime();

// Export UBTTcpLink_Channel::execsfAckServerTime(FFrame&, void* const)
native function bool sfAckServerTime(int Time)
{
    //native.Time;        
}

// Export UBTTcpLink_Channel::execsfReqAuctionItemListCount(FFrame&, void* const)
native function bool sfReqAuctionItemListCount(byte Section, byte Classfy, int ItemType, int ItemGrade)
{
    //native.Section;
    //native.Classfy;
    //native.ItemType;
    //native.ItemGrade;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionItemListCount(FFrame&, void* const)
native function bool sfAckAuctionItemListCount(int Result, string ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count)
{
    //native.Result;
    //native.ErrMsg;
    //native.Section;
    //native.Classfy;
    //native.ItemType;
    //native.ItemGrade;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfReqGameOverEnd(FFrame&, void* const)
native function bool sfReqGameOverEnd();

// Export UBTTcpLink_Channel::execsfAckGameOverEnd(FFrame&, void* const)
native function bool sfAckGameOverEnd(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqSellShopItemInfo(FFrame&, void* const)
native function bool sfReqSellShopItemInfo(BtrDouble UniqueItemID, int Count)
{
    //native.UniqueItemID;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckSellShopItemInfo(FFrame&, void* const)
native function bool sfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    //native.Result;
    //native.ErrMsg;
    //native.UniqueItemID;
    //native.SellPoint;
    //native.CurPoint;
    //native.AfterPoint;        
}

// Export UBTTcpLink_Channel::execsfReqDupCheckClanName(FFrame&, void* const)
native function bool sfReqDupCheckClanName(string ClanNam)
{
    //native.ClanNam;        
}

// Export UBTTcpLink_Channel::execsfAckDupCheckClanName(FFrame&, void* const)
native function bool sfAckDupCheckClanName(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqCreateClan(FFrame&, void* const)
native function bool sfReqCreateClan(string ClanName, string ClanURL, string ClanIntro, string ClanKeyword, byte ClanRegion)
{
    //native.ClanName;
    //native.ClanURL;
    //native.ClanIntro;
    //native.ClanKeyword;
    //native.ClanRegion;        
}

// Export UBTTcpLink_Channel::execsfAckCreateClan(FFrame&, void* const)
native function bool sfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.StackCount;        
}

// Export UBTTcpLink_Channel::execsfReqClanInfo(FFrame&, void* const)
native function bool sfReqClanInfo(string ClanName)
{
    //native.ClanName;        
}

// Export UBTTcpLink_Channel::execsfAckClanInfo(FFrame&, void* const)
native function bool sfAckClanInfo(ClanInfo stClanInfo)
{
    //native.stClanInfo;        
}

// Export UBTTcpLink_Channel::execsfReqInviteClan(FFrame&, void* const)
native function bool sfReqInviteClan(string CharName, string InviteMsg)
{
    //native.CharName;
    //native.InviteMsg;        
}

// Export UBTTcpLink_Channel::execsfAckInviteClan(FFrame&, void* const)
native function bool sfAckInviteClan(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqRecvClanInvite(FFrame&, void* const)
native function bool sfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    //native.InviterUserDBID;
    //native.InviterCharname;
    //native.ClanName;
    //native.InviteMsg;        
}

// Export UBTTcpLink_Channel::execsfAckRecvClanInvite(FFrame&, void* const)
native function bool sfAckRecvClanInvite(int InviterUserDBID, string InviterCharname, string InviterMsg, string ClanName, byte Permit)
{
    //native.InviterUserDBID;
    //native.InviterCharname;
    //native.InviterMsg;
    //native.ClanName;
    //native.Permit;        
}

// Export UBTTcpLink_Channel::execsfAckRecvClanInviteResult(FFrame&, void* const)
native function bool sfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckInviteClanResult(FFrame&, void* const)
native function bool sfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    //native.CharName;
    //native.Permit;
    //native.ClanNm;        
}

// Export UBTTcpLink_Channel::execsfReqJoinClan(FFrame&, void* const)
native function bool sfReqJoinClan(string ClanName, string ClanManagerName, string Message)
{
    //native.ClanName;
    //native.ClanManagerName;
    //native.Message;        
}

// Export UBTTcpLink_Channel::execsfAckJoinClan(FFrame&, void* const)
native function bool sfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    //native.Result;
    //native.ErrMsg;
    //native.SpecificCharName;
    //native.RealRecvCharName;
    //native.RealRecvCharClanGrade;        
}

// Export UBTTcpLink_Channel::execsfReqRecvJoinClan(FFrame&, void* const)
native function bool sfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    //native.UserIdx;
    //native.CharName;
    //native.Message;        
}

// Export UBTTcpLink_Channel::execsfAckRecvJoinClan(FFrame&, void* const)
native function bool sfAckRecvJoinClan(int UserIdx, string CharName, string ReqMsg, byte Permit)
{
    //native.UserIdx;
    //native.CharName;
    //native.ReqMsg;
    //native.Permit;        
}

// Export UBTTcpLink_Channel::execsfAckRecvJoinClanResult(FFrame&, void* const)
native function bool sfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckJoinClanResult(FFrame&, void* const)
native function bool sfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    //native.ClanName;
    //native.Permit;
    //native.PermitCharName;        
}

// Export UBTTcpLink_Channel::execsfReqSerachClan(FFrame&, void* const)
native function bool sfReqSerachClan(byte SearchType, string Keyword, byte ClanStatus, byte ClanRegion, int ReqPage)
{
    //native.SearchType;
    //native.Keyword;
    //native.ClanStatus;
    //native.ClanRegion;
    //native.ReqPage;        
}

// Export UBTTcpLink_Channel::execsfAckSearchClan(FFrame&, void* const)
native function bool sfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    //native.Result;
    //native.ErrMsg;
    //native.TotalPage;
    //native.ClanMarkPattern;
    //native.ClanMarkBG;
    //native.ClanMarkBL;
    //native.ClanName;
    //native.ClanMaster;
    //native.ClanMember;
    //native.ClanMemberMax;
    //native.ClanCreateDate;
    //native.ClanWin;
    //native.ClanLose;
    //native.ClanDraw;
    //native.ClanRank;
    //native.ClanRecruit;
    //native.ClanLevel;        
}

// Export UBTTcpLink_Channel::execsfReqClanUserList(FFrame&, void* const)
native function bool sfReqClanUserList(string ClanName)
{
    //native.ClanName;        
}

// Export UBTTcpLink_Channel::execsfAckClanUserListStart(FFrame&, void* const)
native function bool sfAckClanUserListStart(int Result, int TotalCount)
{
    //native.Result;
    //native.TotalCount;        
}

// Export UBTTcpLink_Channel::execsfAckClanUserList(FFrame&, void* const)
native function bool sfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    //native.Result;
    //native.ErrMsg;
    //native.Level;
    //native.CharName;
    //native.ClanGrade;
    //native.ClanWinCnt;
    //native.ClanLoseCnt;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.DudeId;        
}

// Export UBTTcpLink_Channel::execsfAckClanUserListEnd(FFrame&, void* const)
native function bool sfAckClanUserListEnd();

// Export UBTTcpLink_Channel::execsfReqAdjustClanMemberGrade(FFrame&, void* const)
native function bool sfReqAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    //native.ClanName;
    //native.CharName;
    //native.CharGrade;        
}

// Export UBTTcpLink_Channel::execsfAckAdjustClanMemberGrade(FFrame&, void* const)
native function bool sfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    //native.Result;
    //native.ErrMsg;
    //native.ClanName;
    //native.CharName;
    //native.CharGrade;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyAdjustClanMemberGrade(FFrame&, void* const)
native function bool sfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    //native.ClanName;
    //native.CharName;
    //native.CharGrade;        
}

// Export UBTTcpLink_Channel::execsfReqClanNews(FFrame&, void* const)
native function bool sfReqClanNews(string ClanName)
{
    //native.ClanName;        
}

// Export UBTTcpLink_Channel::execsfAckClanNews(FFrame&, void* const)
native function bool sfAckClanNews(array<string> IssueDate, array<byte> IssueType, array<string> IssuedClanMember)
{
    //native.IssueDate;
    //native.IssueType;
    //native.IssuedClanMember;        
}

// Export UBTTcpLink_Channel::execsfReqClanSecession(FFrame&, void* const)
native function bool sfReqClanSecession(string ClanName)
{
    //native.ClanName;        
}

// Export UBTTcpLink_Channel::execsfAckClanSecession(FFrame&, void* const)
native function bool sfAckClanSecession(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyClanSecession(FFrame&, void* const)
native function bool sfAckNotifyClanSecession(string ClanName, string CharName)
{
    //native.ClanName;
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfReqClanClose(FFrame&, void* const)
native function bool sfReqClanClose(string ClanName)
{
    //native.ClanName;        
}

// Export UBTTcpLink_Channel::execsfAckClanClose(FFrame&, void* const)
native function bool sfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    //native.Result;
    //native.ErrMsg;
    //native.ClanName;        
}

// Export UBTTcpLink_Channel::execsfReqClanChangeInfo(FFrame&, void* const)
native function bool sfReqClanChangeInfo(string ClanName, byte IsRecruit, byte Region, string Keyword, string ClanIntro, string Notice)
{
    //native.ClanName;
    //native.IsRecruit;
    //native.Region;
    //native.Keyword;
    //native.ClanIntro;
    //native.Notice;        
}

// Export UBTTcpLink_Channel::execsfAckClanChangeInfo(FFrame&, void* const)
native function bool sfAckClanChangeInfo(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqClanPersonelIntro(FFrame&, void* const)
native function bool sfReqClanPersonelIntro(string ClanName, string CharName, string PersonelIntro)
{
    //native.ClanName;
    //native.CharName;
    //native.PersonelIntro;        
}

// Export UBTTcpLink_Channel::execsfAckClanPersonelIntro(FFrame&, void* const)
native function bool sfAckClanPersonelIntro(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqClanCharPersonelIntro(FFrame&, void* const)
native function bool sfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    //native.ClanName;
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfAckClanCharPersonelIntro(FFrame&, void* const)
native function bool sfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    //native.Result;
    //native.ErrMsg;
    //native.PersonelIntro;        
}

// Export UBTTcpLink_Channel::execsfReqSuccessStartGame(FFrame&, void* const)
native function bool sfReqSuccessStartGame(int LoadingStep)
{
    //native.LoadingStep;        
}

// Export UBTTcpLink_Channel::execsfAckSuccessStartGame(FFrame&, void* const)
native function bool sfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    //native.Result;
    //native.ErrMsg;
    //native.IsHost;
    //native.HostIP;
    //native.HostPort;
    //native.LoadingStep;        
}

// Export UBTTcpLink_Channel::execsfReqFailedStartGame(FFrame&, void* const)
native function bool sfReqFailedStartGame(int LoadingStep)
{
    //native.LoadingStep;        
}

// Export UBTTcpLink_Channel::execsfAckFailedStartGame(FFrame&, void* const)
native function bool sfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    //native.Result;
    //native.ErrMsg;
    //native.IsHost;
    //native.FailedUserID;
    //native.LoadingStep;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyLoadingState(FFrame&, void* const)
native function bool sfReqNotifyLoadingState(byte LoadingState)
{
    //native.LoadingState;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyLoadingState(FFrame&, void* const)
native function bool sfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    //native.Result;
    //native.UserID;
    //native.LoadingState;        
}

// Export UBTTcpLink_Channel::execsfReqTestDouble(FFrame&, void* const)
native function bool sfReqTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    //native.vDouble;
    //native.vDoubles;        
}

// Export UBTTcpLink_Channel::execsfAckTestDouble(FFrame&, void* const)
native function bool sfAckTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    //native.vDouble;
    //native.vDoubles;        
}

// Export UBTTcpLink_Channel::execsfReqChatClan(FFrame&, void* const)
native function bool sfReqChatClan(string Message)
{
    //native.Message;        
}

// Export UBTTcpLink_Channel::execsfAckChatClan(FFrame&, void* const)
native function bool sfAckChatClan(string CharName, string Message, int Result)
{
    //native.CharName;
    //native.Message;
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyNewClanMember(FFrame&, void* const)
native function bool sfAckNotifyNewClanMember(string ClanName, string CharName)
{
    //native.ClanName;
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfReqGetAttachedItemFromMemo(FFrame&, void* const)
native function bool sfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID)
{
    //native.UserID;
    //native.MemoIdx;
    //native.ItemID;        
}

// Export UBTTcpLink_Channel::execsfAckGetAttachedItemFromMemo(FFrame&, void* const)
native function bool sfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.ItemID;        
}

// Export UBTTcpLink_Channel::execsfReqSendGift(FFrame&, void* const)
native function bool sfReqSendGift(int ItemID, string RecvCharname, string RecvMessage, byte BuyOption1, byte BuyOption2)
{
    //native.ItemID;
    //native.RecvCharname;
    //native.RecvMessage;
    //native.BuyOption1;
    //native.BuyOption2;        
}

// Export UBTTcpLink_Channel::execsfAckSendGift(FFrame&, void* const)
native function bool sfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    //native.Result;
    //native.ErrMsg;
    //native.PointRemain;
    //native.CashRemain;        
}

// Export UBTTcpLink_Channel::execsfReqAuctionTradeHistory(FFrame&, void* const)
native function bool sfReqAuctionTradeHistory(int ItemID, int PartID)
{
    //native.ItemID;
    //native.PartID;        
}

// Export UBTTcpLink_Channel::execsfAckAuctionTradeHistory(FFrame&, void* const)
native function bool sfAckAuctionTradeHistory(int Result, string ErrMsg, int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemID;
    //native.PartID;
    //native.SellerCharNm;
    //native.DamageDegree;
    //native.Price;        
}

// Export UBTTcpLink_Channel::execsfReqLogGetScore(FFrame&, void* const)
native function bool sfReqLogGetScore(KillDeathLog KillDeathLogParam, array<int> AssistUIDs, array<byte> AssistScores)
{
    //native.KillDeathLogParam;
    //native.AssistUIDs;
    //native.AssistScores;        
}

// Export UBTTcpLink_Channel::execsfReqLogEndEachRound(FFrame&, void* const)
native function bool sfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, byte VTeam, byte VTeamAD, int AFScore, int RSAScore, int Round)
{
    //native.StartCnt;
    //native.EndCnt;
    //native.RoundEndType;
    //native.RoundEndTime;
    //native.VTeam;
    //native.VTeamAD;
    //native.AFScore;
    //native.RSAScore;
    //native.Round;        
}

// Export UBTTcpLink_Channel::execsfReqGetServerTime(FFrame&, void* const)
native function bool sfReqGetServerTime();

// Export UBTTcpLink_Channel::execsfAckGetServerTime(FFrame&, void* const)
native function bool sfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    //native.ServerTime;
    //native.ClientIP;        
}

// Export UBTTcpLink_Channel::execsfReqForceNatTypeSetting(FFrame&, void* const)
native function bool sfReqForceNatTypeSetting(int NatType)
{
    //native.NatType;        
}

// Export UBTTcpLink_Channel::execsfReqDBCharInfo(FFrame&, void* const)
native function bool sfReqDBCharInfo(string CharName)
{
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfAckDBCharInfo(FFrame&, void* const)
native function bool sfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    //native.Result;
    //native.ErrMsg;
    //native.CharName;
    //native.ClanName;
    //native.CM_Pattern;
    //native.CM_BG;
    //native.CM_BL;
    //native.ClanPersonIntro;
    //native.MainWeaponItemID;
    //native.MainWeaponPartID;
    //native.SubWeaponItemID;
    //native.SubWeaponPartID;
    //native.AFSpecialCostumeItemID;
    //native.RSASpecialCostumeItemID;
    //native.stCharInfo;
    //native.ClanLevel;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_InstallBomb(FFrame&, void* const)
native function bool sfReqGamePlay_InstallBomb(int InstallerUID, byte InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange)
{
    //native.InstallerUID;
    //native.InstallPos;
    //native.InstallerXCoord;
    //native.InstallerYCoord;
    //native.InstallerZCoord;
    //native.InstallerPos;
    //native.InstallerWeaponID;
    //native.InstallerWeaponPartID;
    //native.InstallerRange;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_DefuseBomb(FFrame&, void* const)
native function bool sfReqGamePlay_DefuseBomb(int DefuserUID, byte DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange)
{
    //native.DefuserUID;
    //native.DefusePos;
    //native.DefuserXCoord;
    //native.DefuserYCoord;
    //native.DefuserZCoord;
    //native.DefuserPos;
    //native.DefuserWeaponID;
    //native.DefuserWeaponPartID;
    //native.DefuserRange;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyChangeRoomState(FFrame&, void* const)
native function bool sfReqNotifyChangeRoomState(byte RoomState)
{
    //native.RoomState;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_TakeAPoint(FFrame&, void* const)
native function bool sfReqGamePlay_TakeAPoint(array<int> TakerUID, byte TakePos, array<float> TakerXCoord, array<float> TakerYCoord, array<float> TakerZCoord, array<int> TakerPos, array<int> TakerWeaponID, array<int> TakerWeaponPartID, array<int> TakerRange)
{
    //native.TakerUID;
    //native.TakePos;
    //native.TakerXCoord;
    //native.TakerYCoord;
    //native.TakerZCoord;
    //native.TakerPos;
    //native.TakerWeaponID;
    //native.TakerWeaponPartID;
    //native.TakerRange;        
}

// Export UBTTcpLink_Channel::execsfReqForceDisconnectUDPFromHost(FFrame&, void* const)
native function bool sfReqForceDisconnectUDPFromHost(int UserID)
{
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfAckForceDisconnectUDPFromHost(FFrame&, void* const)
native function bool sfAckForceDisconnectUDPFromHost(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqRecvForceDisconnectUDPFromHost(FFrame&, void* const)
native function bool sfReqRecvForceDisconnectUDPFromHost(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_SetGameStartTime(FFrame&, void* const)
native function bool sfReqGamePlay_SetGameStartTime(array<int> UID)
{
    //native.UID;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_SetRoundStartTime(FFrame&, void* const)
native function bool sfReqGamePlay_SetRoundStartTime(array<int> UID)
{
    //native.UID;        
}

// Export UBTTcpLink_Channel::execsfReqWriteServerLog(FFrame&, void* const)
native function bool sfReqWriteServerLog(byte Destination, string LogMsg)
{
    //native.Destination;
    //native.LogMsg;        
}

// Export UBTTcpLink_Channel::execsfReqUpdateMyHostPriorityPoint(FFrame&, void* const)
native function bool sfReqUpdateMyHostPriorityPoint(int HostPriorityPoint)
{
    //native.HostPriorityPoint;        
}

// Export UBTTcpLink_Channel::execsfReqGetUserHostPriorityPoint(FFrame&, void* const)
native function bool sfReqGetUserHostPriorityPoint(int UserID)
{
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfAckGetUserHostPriorityPoint(FFrame&, void* const)
native function bool sfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    //native.Result;
    //native.UserID;
    //native.HostPriorityPoint;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyRelayServerAddr(FFrame&, void* const)
native function bool sfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    //native.RelayIP;
    //native.RelayPort;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_UpdateDomScore(FFrame&, void* const)
native function bool sfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore)
{
    //native.AFScore;
    //native.RSAScore;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_ChangeWeaponSet(FFrame&, void* const)
native function bool sfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber)
{
    //native.UID;
    //native.SetNumber;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyRecvDummyForHolePunching(FFrame&, void* const)
native function bool sfReqNotifyRecvDummyForHolePunching(int ClientUserID, byte Phrase)
{
    //native.ClientUserID;
    //native.Phrase;        
}

// Export UBTTcpLink_Channel::execsfReqGetHolePunchingResult(FFrame&, void* const)
native function bool sfReqGetHolePunchingResult();

// Export UBTTcpLink_Channel::execsfAckGetHolePunchingResult(FFrame&, void* const)
native function bool sfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    //native.Result;
    //native.Phrase;
    //native.InterventionUserID;
    //native.Intervention;
    //native.FailedUserIDs;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyHostBlocking(FFrame&, void* const)
native function bool sfReqNotifyHostBlocking(byte Blocking)
{
    //native.Blocking;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyHostBlocking(FFrame&, void* const)
native function bool sfAckNotifyHostBlocking(int Result, byte Blocking)
{
    //native.Result;
    //native.Blocking;        
}

// Export UBTTcpLink_Channel::execsfReqGetIsHostBlocking(FFrame&, void* const)
native function bool sfReqGetIsHostBlocking();

// Export UBTTcpLink_Channel::execsfAckGetIsHostBlocking(FFrame&, void* const)
native function bool sfAckGetIsHostBlocking(int Result, byte Blocking)
{
    //native.Result;
    //native.Blocking;        
}

// Export UBTTcpLink_Channel::execsfReqIsAvailClanURL(FFrame&, void* const)
native function bool sfReqIsAvailClanURL(string ClanURL)
{
    //native.ClanURL;        
}

// Export UBTTcpLink_Channel::execsfAckIsAvailClanURL(FFrame&, void* const)
native function bool sfAckIsAvailClanURL(string ClanURL, int Result, string ErrMsg)
{
    //native.ClanURL;
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckAcquirePromotionItems(FFrame&, void* const)
native function bool sfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    //native.UID;
    //native.Result;
    //native.ErrMsg;
    //native.ItemUniqueID;
    //native.ItemIDs;
    //native.PartIDs;        
}

// Export UBTTcpLink_Channel::execsfReqGamePlay_GetChopper(FFrame&, void* const)
native function bool sfReqGamePlay_GetChopper(int GetChopperUID, array<int> GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, string ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord)
{
    //native.GetChopperUID;
    //native.GetChopperAssistUID;
    //native.KillXCoord;
    //native.KillYCoord;
    //native.KillZCoord;
    //native.KillPos;
    //native.KillWeaponID;
    //native.KillWeaponPartID;
    //native.KillRange;
    //native.KillDamage;
    //native.ChopperCallerID;
    //native.ChopperCallerName;
    //native.ChopperXCoord;
    //native.ChopperYCoord;
    //native.ChopperZCoord;        
}

// Export UBTTcpLink_Channel::execsfReqCheckEquipedWeaponDurability(FFrame&, void* const)
native function bool sfReqCheckEquipedWeaponDurability();

// Export UBTTcpLink_Channel::execsfAckCheckEquipedWeaponDurability(FFrame&, void* const)
native function bool sfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    //native.Result;
    //native.ItemUniqueID;
    //native.ItemSlotNum;        
}

// Export UBTTcpLink_Channel::execsfReqGameGuardAuthData(FFrame&, void* const)
native function bool sfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3)
{
    //native.AuthDataIndex;
    //native.AuthDataVal1;
    //native.AuthDataVal2;
    //native.AuthDataVal3;        
}

// Export UBTTcpLink_Channel::execsfAckGameGuardAuthData(FFrame&, void* const)
native function bool sfAckGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3)
{
    //native.AuthDataIndex;
    //native.AuthDataVal1;
    //native.AuthDataVal2;
    //native.AuthDataVal3;        
}

// Export UBTTcpLink_Channel::execsfReqDeleteFriend(FFrame&, void* const)
native function bool sfReqDeleteFriend(array<string> DeleteCharName)
{
    //native.DeleteCharName;        
}

// Export UBTTcpLink_Channel::execsfAckDeleteFriend(FFrame&, void* const)
native function bool sfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    //native.Result;
    //native.FailedCharname;        
}

// Export UBTTcpLink_Channel::execsfReqRecvDeleteFriend(FFrame&, void* const)
native function bool sfReqRecvDeleteFriend(int Result, string FromCharName)
{
    //native.Result;
    //native.FromCharName;        
}

// Export UBTTcpLink_Channel::execsfReqChannelUserListInGameRoom(FFrame&, void* const)
native function bool sfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count)
{
    //native.ChannelNum;
    //native.StartIndex;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckChannelUserListInGameRoom(FFrame&, void* const)
native function bool sfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    //native.Result;
    //native.TotalCount;
    //native.Count;
    //native.StartIndex;
    //native.UID;
    //native.CharName;
    //native.UserLevel;
    //native.ClanName;
    //native.ClanPattern;
    //native.ClanBG;
    //native.ClanBL;
    //native.IsLookForClan;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqSpecificGameRoomInfo(FFrame&, void* const)
native function bool sfReqSpecificGameRoomInfo(int RoomNum)
{
    //native.RoomNum;        
}

// Export UBTTcpLink_Channel::execsfAckSpecificGameRoomInfo(FFrame&, void* const)
native function bool sfAckSpecificGameRoomInfo(int Result, int GameNum, string Title, string MapName, int MapNum, byte UserCount, byte MaxCount, string GameModeName, int ModeNum, byte WeaponLimit, byte IsHardCore, byte Status, string RoomOwnerIP, int GameMinute, string RoomOwnerName, byte IsSpecial, byte IsPassword)
{
    //native.Result;
    //native.GameNum;
    //native.Title;
    //native.MapName;
    //native.MapNum;
    //native.UserCount;
    //native.MaxCount;
    //native.GameModeName;
    //native.ModeNum;
    //native.WeaponLimit;
    //native.IsHardCore;
    //native.Status;
    //native.RoomOwnerIP;
    //native.GameMinute;
    //native.RoomOwnerName;
    //native.IsSpecial;
    //native.IsPassword;        
}

// Export UBTTcpLink_Channel::execsfReqSpecificChannelUserInfo(FFrame&, void* const)
native function bool sfReqSpecificChannelUserInfo(int UserID)
{
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfAckSpecificChannelUserInfo(FFrame&, void* const)
native function bool sfAckSpecificChannelUserInfo(int UID, string UserID, int UserLevels, string ClanName, int ClanPattern, int ClanBG, int ClanBL, int Result, string ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    //native.UID;
    //native.UserID;
    //native.UserLevels;
    //native.ClanName;
    //native.ClanPattern;
    //native.ClanBG;
    //native.ClanBL;
    //native.Result;
    //native.ErrMsg;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqNotice_GM(FFrame&, void* const)
native function bool sfReqNotice_GM(byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    //native.NoticeType;
    //native.ServerID;
    //native.ChannelNum;
    //native.GameRoomNum;
    //native.Msg;        
}

// Export UBTTcpLink_Channel::execsfAckNotice_GM(FFrame&, void* const)
native function bool sfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    //native.Result;
    //native.ErrMsg;
    //native.NoticeType;
    //native.ServerID;
    //native.ChannelNum;
    //native.GameRoomNum;
    //native.Msg;        
}

// Export UBTTcpLink_Channel::execsfReqRecvNotice_FromGM(FFrame&, void* const)
native function bool sfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    //native.Result;
    //native.ErrMsg;
    //native.NoticeMsg;
    //native.IsFromDB;        
}

// Export UBTTcpLink_Channel::execsfReqForceDisconnectUser_GM(FFrame&, void* const)
native function bool sfReqForceDisconnectUser_GM(string CharName)
{
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfAckForceDisconnectUser_GM(FFrame&, void* const)
native function bool sfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    //native.Result;
    //native.ErrMsg;
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfReqRecvForceDisconnected_FromGM(FFrame&, void* const)
native function bool sfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyDisconnectHostInLoading(FFrame&, void* const)
native function bool sfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    //native.Result;
    //native.ErrMsg;
    //native.HostID;        
}

// Export UBTTcpLink_Channel::execsfReqChatWispherMyCommunity(FFrame&, void* const)
native function bool sfReqChatWispherMyCommunity(string SourceCharName, string SenderName, string Msg)
{
    //native.SourceCharName;
    //native.SenderName;
    //native.Msg;        
}

// Export UBTTcpLink_Channel::execsfAckChatWispherMyCommunity(FFrame&, void* const)
native function bool sfAckChatWispherMyCommunity(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyDurabilityZeroItem(FFrame&, void* const)
native function bool sfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    //native.Result;
    //native.ErrMsg;
    //native.UserID;
    //native.ItemUniqueIDs;
    //native.ItemIDs;
    //native.ItemPartIDs;
    //native.ItemSlotPos;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyMyCharInfoToRoomUser(FFrame&, void* const)
native function bool sfReqNotifyMyCharInfoToRoomUser();

// Export UBTTcpLink_Channel::execsfAckNotifyMyCharInfoToRoomUser(FFrame&, void* const)
native function bool sfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    //native.Result;
    //native.ErrMsg;
    //native.UID;
    //native.UserName;
    //native.Grade;
    //native.TeamNum;
    //native.Statue;
    //native.IsHost;
    //native.UserIP;
    //native.ClanName;
    //native.CM_Pattern;
    //native.CM_BG;
    //native.CM_BL;
    //native.IsLookFor;        
}

// Export UBTTcpLink_Channel::execsfReqStartHolePunching(FFrame&, void* const)
native function bool sfReqStartHolePunching(int GameType, int ReqStartUserID)
{
    //native.GameType;
    //native.ReqStartUserID;        
}

// Export UBTTcpLink_Channel::execsfAckStartHolePunching(FFrame&, void* const)
native function bool sfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    //native.Result;
    //native.ErrMsg;
    //native.GameType;
    //native.ReqStartUserID;        
}

// Export UBTTcpLink_Channel::execsfReqForceFailedClientLoading(FFrame&, void* const)
native function bool sfReqForceFailedClientLoading(int FailedUserID, int ErrCode)
{
    //native.FailedUserID;
    //native.ErrCode;        
}

// Export UBTTcpLink_Channel::execsfAckForceFailedClientLoading(FFrame&, void* const)
native function bool sfAckForceFailedClientLoading(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqRecvForceFailedClientLoading(FFrame&, void* const)
native function bool sfReqRecvForceFailedClientLoading(int ErrCode)
{
    //native.ErrCode;        
}

// Export UBTTcpLink_Channel::execsfReqItemListInItemBox(FFrame&, void* const)
native function bool sfReqItemListInItemBox(BtrDouble ItemUniqueID, int BoxItemID, byte FromContent)
{
    //native.ItemUniqueID;
    //native.BoxItemID;
    //native.FromContent;        
}

// Export UBTTcpLink_Channel::execsfAckItemListInItemBox(FFrame&, void* const)
native function bool sfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID, byte FromContent)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemUniqueID;
    //native.BoxItemID;
    //native.ItemID;
    //native.PartID;
    //native.FromContent;        
}

// Export UBTTcpLink_Channel::execsfReqGetItemFromItemBox(FFrame&, void* const)
native function bool sfReqGetItemFromItemBox(BtrDouble ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    //native.ItemUniqueID;
    //native.ItemID;
    //native.ItemIDChoose;
    //native.PartIDChoose;        
}

// Export UBTTcpLink_Channel::execsfAckGetItemFromItemBox(FFrame&, void* const)
native function bool sfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIDChoose;
    //native.PartIDChoose;
    //native.BoxItemIdx;
    //native.BxoItemCount;
    //native.bHave;
    //native.ItemIdx;
    //native.UntilTime;
    //native.StackCount;        
}

// Export UBTTcpLink_Channel::execsfAckAutoChangedTeamUserList(FFrame&, void* const)
native function bool sfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    //native.UserID;
    //native.TeamNum;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_GetReady(FFrame&, void* const)
native function bool sfReqClanMatch_GetReady();

// Export UBTTcpLink_Channel::execsfAckClanMatch_GetReady(FFrame&, void* const)
native function bool sfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    //native.Result;
    //native.ErrMsg;
    //native.RoomIndex;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_StartCombat(FFrame&, void* const)
native function bool sfReqClanMatch_StartCombat(array<int> MapNumArray, int VersusMode)
{
    //native.MapNumArray;
    //native.VersusMode;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_StartCombat(FFrame&, void* const)
native function bool sfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_NotifiyStartCombat(FFrame&, void* const)
native function bool sfAckClanMatch_NotifiyStartCombat(array<int> MapNumArray, int VersusMode)
{
    //native.MapNumArray;
    //native.VersusMode;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_InviteCrew(FFrame&, void* const)
native function bool sfReqClanMatch_InviteCrew(string Invitee)
{
    //native.Invitee;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_InviteCrew(FFrame&, void* const)
native function bool sfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_RecvInviteCrew(FFrame&, void* const)
native function bool sfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    //native.Inviter;
    //native.ServerIP;
    //native.Port;
    //native.WaittingID;
    //native.Msg;
    //native.MapNum;
    //native.InviteUserChannelNum;
    //native.LeaderName;
    //native.RoomName;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_RecvInviteCrew(FFrame&, void* const)
native function bool sfAckClanMatch_RecvInviteCrew(int Result, string Inviter)
{
    //native.Result;
    //native.Inviter;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_InviteCrewResult(FFrame&, void* const)
native function bool sfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    //native.Invitee;
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_Join(FFrame&, void* const)
native function bool sfReqClanMatch_Join(int WaittingID)
{
    //native.WaittingID;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_Join(FFrame&, void* const)
native function bool sfAckClanMatch_Join(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_JoinNotify(FFrame&, void* const)
native function bool sfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    //native.IsLeader;
    //native.ClanMarkPA;
    //native.ClanMarkBG;
    //native.ClanMarkBL;
    //native.Level;
    //native.CharName;
    //native.ClanGrade;
    //native.ClanWin;
    //native.ClanLose;
    //native.ClanName;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_MemberList(FFrame&, void* const)
native function bool sfReqClanMatch_MemberList();

// Export UBTTcpLink_Channel::execsfAckClanMatch_MemberList(FFrame&, void* const)
native function bool sfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    //native.IsLeader;
    //native.ClanMarkPA;
    //native.ClanMarkBG;
    //native.ClanMarkBL;
    //native.Level;
    //native.CharName;
    //native.ClanGrade;
    //native.ClanWin;
    //native.ClanLose;
    //native.ClanName;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_Leave(FFrame&, void* const)
native function bool sfReqClanMatch_Leave(int WaittingID)
{
    //native.WaittingID;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_Leave(FFrame&, void* const)
native function bool sfAckClanMatch_Leave(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_LeaveNotify(FFrame&, void* const)
native function bool sfAckClanMatch_LeaveNotify(string CharName)
{
    //native.CharName;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_Chat(FFrame&, void* const)
native function bool sfReqClanMatch_Chat(string Msg)
{
    //native.Msg;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_Chat(FFrame&, void* const)
native function bool sfAckClanMatch_Chat(int Result, string ErrMsg, string CharName, string Msg)
{
    //native.Result;
    //native.ErrMsg;
    //native.CharName;
    //native.Msg;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_WaittingTeamList(FFrame&, void* const)
native function bool sfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount)
{
    //native.StartIndex;
    //native.ReturnCount;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_WaittingTeamList(FFrame&, void* const)
native function bool sfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    //native.TtotlCount;
    //native.Grade;
    //native.Map;
    //native.Versus;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_ChangeLeader(FFrame&, void* const)
native function bool sfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, string NewLeaderName)
{
    //native.WaitRoomIdx;
    //native.NewLeaderID;
    //native.NewLeaderName;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_ChangeLeader(FFrame&, void* const)
native function bool sfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    //native.Result;
    //native.ErrMsg;
    //native.NewLeader;
    //native.NewLeaderName;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_StopSearching(FFrame&, void* const)
native function bool sfReqClanMatch_StopSearching();

// Export UBTTcpLink_Channel::execsfAckClanMatch_StopSearching(FFrame&, void* const)
native function bool sfAckClanMatch_StopSearching();

// Export UBTTcpLink_Channel::execsfReqInviteGameRoom(FFrame&, void* const)
native function bool sfReqInviteGameRoom(string GuestCharName)
{
    //native.GuestCharName;        
}

// Export UBTTcpLink_Channel::execsfAckInviteGameRoom(FFrame&, void* const)
native function bool sfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    //native.Result;
    //native.Answer;
    //native.GuestCharName;        
}

// Export UBTTcpLink_Channel::execsfReqRecvInviteGameRoom(FFrame&, void* const)
native function bool sfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    //native.InviteUserServerName;
    //native.InviteUserServerID;
    //native.InviteUserChannelNumber;
    //native.RoomUniqueID;
    //native.RoomNumber;
    //native.RoomName;
    //native.RoomState;
    //native.MapName;
    //native.OwnerName;
    //native.GameMode;
    //native.WeaponLimit;
    //native.IsTeamBalance;
    //native.Password;
    //native.InviteCharName;        
}

// Export UBTTcpLink_Channel::execsfAckRecvInviteGameRoom(FFrame&, void* const)
native function bool sfAckRecvInviteGameRoom(string RoomUniqueID, int RoomNumber, byte Answer, string InviteCharName)
{
    //native.RoomUniqueID;
    //native.RoomNumber;
    //native.Answer;
    //native.InviteCharName;        
}

// Export UBTTcpLink_Channel::execsfAckRecvInviteGameRoomResult(FFrame&, void* const)
native function bool sfAckRecvInviteGameRoomResult(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqLimitedListInChannel(FFrame&, void* const)
native function bool sfReqLimitedListInChannel();

// Export UBTTcpLink_Channel::execsfAckLimitedListInChannel(FFrame&, void* const)
native function bool sfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    //native.Result;
    //native.LimitedMapID;
    //native.LimitedModeID;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_StartSearching(FFrame&, void* const)
native function bool sfReqClanMatch_StartSearching(int RequestCount)
{
    //native.RequestCount;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_StartSearching(FFrame&, void* const)
native function bool sfAckClanMatch_StartSearching(int Result, string ErrMsg, int ShouldWaitMore)
{
    //native.Result;
    //native.ErrMsg;
    //native.ShouldWaitMore;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_NotifyStartSearching(FFrame&, void* const)
native function bool sfAckClanMatch_NotifyStartSearching(int ShouldWaitMore)
{
    //native.ShouldWaitMore;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_FoundMatch(FFrame&, void* const)
native function bool sfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    //native.ChannelID;
    //native.RoomNumber;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_FoundMatch(FFrame&, void* const)
native function bool sfAckClanMatch_FoundMatch();

// Export UBTTcpLink_Channel::execsfReqPermanentRoomInfo(FFrame&, void* const)
native function bool sfReqPermanentRoomInfo(int RoomNum)
{
    //native.RoomNum;        
}

// Export UBTTcpLink_Channel::execsfAckPermanentRoomInfo(FFrame&, void* const)
native function bool sfAckPermanentRoomInfo(int Result, int ClanIdx, byte FixedGameMode, byte FixedMaxUserCnt)
{
    //native.Result;
    //native.ClanIdx;
    //native.FixedGameMode;
    //native.FixedMaxUserCnt;        
}

// Export UBTTcpLink_Channel::execsfReqQuestList(FFrame&, void* const)
native function bool sfReqQuestList();

// Export UBTTcpLink_Channel::execsfAckQuestListStart(FFrame&, void* const)
native function bool sfAckQuestListStart(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfAckQuestList(FFrame&, void* const)
native function bool sfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> QuestType, array<byte> IsComplete)
{
    //native.QuestID;
    //native.CountPrograss;
    //native.QuestType;
    //native.IsComplete;        
}

// Export UBTTcpLink_Channel::execsfAckQuestListEnd(FFrame&, void* const)
native function bool sfAckQuestListEnd();

// Export UBTTcpLink_Channel::execsfReqQuestUpdate(FFrame&, void* const)
native function bool sfReqQuestUpdate(int UniqueID, int GameRoomNum, array<int> QuestID, array<int> CountPrograss)
{
    //native.UniqueID;
    //native.GameRoomNum;
    //native.QuestID;
    //native.CountPrograss;        
}

// Export UBTTcpLink_Channel::execsfAckQuestUpdate(FFrame&, void* const)
native function bool sfAckQuestUpdate(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqQuestNewAvailable(FFrame&, void* const)
native function bool sfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    //native.AchivedQuestID;
    //native.NewQuestID;
    //native.IsDailyQuest;
    //native.ExpiredQuest;        
}

// Export UBTTcpLink_Channel::execsfReqDailyQuestNewAvailable(FFrame&, void* const)
native function bool sfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    //native.ExpiredQuestID;
    //native.NewQuestID;        
}

// Export UBTTcpLink_Channel::execsfReqPCBangUserList(FFrame&, void* const)
native function bool sfReqPCBangUserList();

// Export UBTTcpLink_Channel::execsfAckPCBangUserListStart(FFrame&, void* const)
native function bool sfAckPCBangUserListStart(int Result, int TotalCount)
{
    //native.Result;
    //native.TotalCount;        
}

// Export UBTTcpLink_Channel::execsfAckPCBangUserList(FFrame&, void* const)
native function bool sfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    //native.FriendName;
    //native.ClanName;
    //native.CM_Pattern;
    //native.CM_BG;
    //native.CM_BL;
    //native.Level;
    //native.ClanGrade;
    //native.ClanWin;
    //native.ClanLose;
    //native.IsLookForClan;
    //native.IsCombat;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfAckPCBangUserListEnd(FFrame&, void* const)
native function bool sfAckPCBangUserListEnd();

// Export UBTTcpLink_Channel::execsfReqRegisterMainPCBang(FFrame&, void* const)
native function bool sfReqRegisterMainPCBang();

// Export UBTTcpLink_Channel::execsfAckRegisterMainPCBang(FFrame&, void* const)
native function bool sfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqRegisteredPCBangInfo(FFrame&, void* const)
native function bool sfReqRegisteredPCBangInfo();

// Export UBTTcpLink_Channel::execsfAckRegisteredPCBangInfo(FFrame&, void* const)
native function bool sfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    //native.Result;
    //native.ErrMsg;
    //native.IsRegisteredPCBang;
    //native.IsMainPCBang;
    //native.PCBangName;        
}

// Export UBTTcpLink_Channel::execsfReqWebzenCash(FFrame&, void* const)
native function bool sfReqWebzenCash();

// Export UBTTcpLink_Channel::execsfAckWebzenCash(FFrame&, void* const)
native function bool sfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    //native.Result;
    //native.ErrMsg;
    //native.PCoinCash;
    //native.CCoinCash;        
}

// Export UBTTcpLink_Channel::execsfReqWebzenShopScriptVersion(FFrame&, void* const)
native function bool sfReqWebzenShopScriptVersion();

// Export UBTTcpLink_Channel::execsfAckWebzenShopScriptVersion(FFrame&, void* const)
native function bool sfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    //native.Year;
    //native.YearId;
    //native.SalesZoneCode;        
}

// Export UBTTcpLink_Channel::execsfReqBuyItemByWebzenCashGP20(FFrame&, void* const)
native function bool sfReqBuyItemByWebzenCashGP20(int ProductNo, byte Cointype, BtrDouble ItemID)
{
    //native.ProductNo;
    //native.Cointype;
    //native.ItemID;        
}

// Export UBTTcpLink_Channel::execsfReqBuyItemByWebzenCash(FFrame&, void* const)
native function bool sfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, array<int> ItemIDs, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    //native.PackageProductSeq;
    //native.ProductDisplaySeq;
    //native.PriceSeq;
    //native.ItemIDs;
    //native.ItemUniqueID;
    //native.BuyOption1;
    //native.BuyOption2;        
}

// Export UBTTcpLink_Channel::execsfAckBuyItemByWebzenCash(FFrame&, void* const)
native function bool sfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqGiftItemByWebzenCashGP20(FFrame&, void* const)
native function bool sfReqGiftItemByWebzenCashGP20(string ReceiverCharName, string Message, int ProductNo, byte Cointype)
{
    //native.ReceiverCharName;
    //native.Message;
    //native.ProductNo;
    //native.Cointype;        
}

// Export UBTTcpLink_Channel::execsfReqGiftItemByWebzenCash(FFrame&, void* const)
native function bool sfReqGiftItemByWebzenCash(string ReceiverCharName, string Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq)
{
    //native.ReceiverCharName;
    //native.Message;
    //native.PackageProductSeq;
    //native.PriceSeq;
    //native.ProductDisplaySeq;        
}

// Export UBTTcpLink_Channel::execsfAckGiftItemByWebzenCash(FFrame&, void* const)
native function bool sfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.LeftProductCount;        
}

// Export UBTTcpLink_Channel::execsfReqWebzenBillingStorageList(FFrame&, void* const)
native function bool sfReqWebzenBillingStorageList(int Page, int CountForPage, byte Type)
{
    //native.Page;
    //native.CountForPage;
    //native.Type;        
}

// Export UBTTcpLink_Channel::execsfAckWebzenBillingStorageListStart(FFrame&, void* const)
native function bool sfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    //native.Result;
    //native.ErrMsg;
    //native.TotalCount;
    //native.TotalPage;
    //native.CurPage;        
}

// Export UBTTcpLink_Channel::execsfAckWebzenBillingStorageList(FFrame&, void* const)
native function bool sfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    //native.Seq;
    //native.ItemSeq;
    //native.GroupCode;
    //native.ShareFlag;
    //native.ProductSeq;
    //native.CashName;
    //native.CashPoint;
    //native.SendAccountID;
    //native.SendMessage;
    //native.ItemType;
    //native.RelationType;
    //native.ProductType;
    //native.PriceSeq;        
}

// Export UBTTcpLink_Channel::execsfAckWebzenBillingStorageListEnd(FFrame&, void* const)
native function bool sfAckWebzenBillingStorageListEnd();

// Export UBTTcpLink_Channel::execsfReqWebzenBillingUseStorageItem(FFrame&, void* const)
native function bool sfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, byte StorageItemType)
{
    //native.StorageSeq;
    //native.StorageItemSeq;
    //native.StorageItemType;        
}

// Export UBTTcpLink_Channel::execsfAckWebzenBillingUseStorageItem(FFrame&, void* const)
native function bool sfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.ItemID;
    //native.ItemExtra;        
}

// Export UBTTcpLink_Channel::execsfReqParamCheckSum(FFrame&, void* const)
native function bool sfReqParamCheckSum(string key, string Value)
{
    //native.key;
    //native.Value;        
}

// Export UBTTcpLink_Channel::execsfAckParamCheckSum(FFrame&, void* const)
native function bool sfAckParamCheckSum(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_ChangeRoomSetting(FFrame&, void* const)
native function bool sfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    //native.WaitRoomIndex;
    //native.MapNumArray;
    //native.VersusMode;
    //native.IsPublic;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_ChangeRoomSetting(FFrame&, void* const)
native function bool sfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    //native.WaitRoomIndex;
    //native.Result;
    //native.ErrMsg;
    //native.MapNumArray;
    //native.VersusMode;
    //native.IsPublic;        
}

// Export UBTTcpLink_Channel::execsfReqGetBotID(FFrame&, void* const)
native function bool sfReqGetBotID(byte AFCount, byte RSACount)
{
    //native.AFCount;
    //native.RSACount;        
}

// Export UBTTcpLink_Channel::execsfAckGetBotID(FFrame&, void* const)
native function bool sfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    //native.Result;
    //native.RequestedAFCount;
    //native.RequestedRSACount;
    //native.AFBotID;
    //native.RSABotID;        
}

// Export UBTTcpLink_Channel::execsfReqReturnBotID(FFrame&, void* const)
native function bool sfReqReturnBotID(array<int> BotID)
{
    //native.BotID;        
}

// Export UBTTcpLink_Channel::execsfAckReturnBotID(FFrame&, void* const)
native function bool sfAckReturnBotID(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_GetClanWaittingRoomInfo(FFrame&, void* const)
native function bool sfReqClanMatch_GetClanWaittingRoomInfo();

// Export UBTTcpLink_Channel::execsfAckClanMatch_GetClanWaittingRoomInfo(FFrame&, void* const)
native function bool sfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    //native.WaitRoomIndex;
    //native.Result;
    //native.ErrMsg;
    //native.MapNumArray;
    //native.VersusMode;
    //native.WaitRoomName;        
}

// Export UBTTcpLink_Channel::execsfReqIsPaidWebzenPCBang(FFrame&, void* const)
native function bool sfReqIsPaidWebzenPCBang(byte IsPaid)
{
    //native.IsPaid;        
}

// Export UBTTcpLink_Channel::execsfReqCharBlockInfo(FFrame&, void* const)
native function bool sfReqCharBlockInfo();

// Export UBTTcpLink_Channel::execsfAckCharBlockInfo(FFrame&, void* const)
native function bool sfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    //native.Result;
    //native.ChatBlockStartTime;
    //native.ChatBlockEndTime;
    //native.BlockedItemIdx;        
}

// Export UBTTcpLink_Channel::execsfReqQuestGetAvailableEventList(FFrame&, void* const)
native function bool sfReqQuestGetAvailableEventList();

// Export UBTTcpLink_Channel::execsfAckQuestGetAvailableEventList(FFrame&, void* const)
native function bool sfAckQuestGetAvailableEventList(int Result, string ErrMsg, array<int> QuestID)
{
    //native.Result;
    //native.ErrMsg;
    //native.QuestID;        
}

// Export UBTTcpLink_Channel::execsfAckGMEnterRoom(FFrame&, void* const)
native function bool sfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    //native.Result;
    //native.RoomNumber;
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfAckGMLeaveRoom(FFrame&, void* const)
native function bool sfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    //native.Result;
    //native.RoomNumber;
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfReqChangeRoomTitle_GM(FFrame&, void* const)
native function bool sfReqChangeRoomTitle_GM(int RoomNumber, string NewRoomTitle)
{
    //native.RoomNumber;
    //native.NewRoomTitle;        
}

// Export UBTTcpLink_Channel::execsfAckChangeRoomTitle_GM(FFrame&, void* const)
native function bool sfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    //native.Result;
    //native.RoomNumber;
    //native.NewRoomTitle;        
}

// Export UBTTcpLink_Channel::execsfAckChangedRoomTitle_FromGM(FFrame&, void* const)
native function bool sfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    //native.Result;
    //native.RoomNumber;
    //native.NewRoomTitle;        
}

// Export UBTTcpLink_Channel::execsfReqRandomBox_Use(FFrame&, void* const)
native function bool sfReqRandomBox_Use(BtrDouble ItemIdx_RandomBox, BtrDouble ItemIdx_Key)
{
    //native.ItemIdx_RandomBox;
    //native.ItemIdx_Key;        
}

// Export UBTTcpLink_Channel::execsfAckRandomBox_Use(FFrame&, void* const)
native function bool sfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, BtrDouble KeyItemIdx, int KeyItemRemainCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.RandomBoxItemIdx;
    //native.RandomBxoItemCount;
    //native.KeyItemIdx;
    //native.KeyItemRemainCount;
    //native.ItemIDChoose;
    //native.PartIDChoose;
    //native.PeriodOnChoosenItem;
    //native.StackCountOnChoosenItem;
    //native.bHave;
    //native.ItemIdx;
    //native.UntilTime;
    //native.StackCount;        
}

// Export UBTTcpLink_Channel::execsfReqSendSystemMsg(FFrame&, void* const)
native function bool sfReqSendSystemMsg(byte RecvType, string SendCharName, string RecvCharname, SystemMsgParam MsgInfo)
{
    //native.RecvType;
    //native.SendCharName;
    //native.RecvCharname;
    //native.MsgInfo;        
}

// Export UBTTcpLink_Channel::execsfAckSendSystemMsg(FFrame&, void* const)
native function bool sfAckSendSystemMsg(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfAckRecvSystemMsg(FFrame&, void* const)
native function bool sfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    //native.CommunityType;
    //native.MsgInfo;        
}

// Export UBTTcpLink_Channel::execsfReqPaidItem_ChangeCharname(FFrame&, void* const)
native function bool sfReqPaidItem_ChangeCharname(BtrDouble ItemIdx, string NewCharname)
{
    //native.ItemIdx;
    //native.NewCharname;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_ChangeCharname(FFrame&, void* const)
native function bool sfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.RemainCount;
    //native.NewCharname;        
}

// Export UBTTcpLink_Channel::execsfReqPaidItem_EraseRecord(FFrame&, void* const)
native function bool sfReqPaidItem_EraseRecord(BtrDouble ItemIdx, int Command)
{
    //native.ItemIdx;
    //native.Command;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_EraseRecord(FFrame&, void* const)
native function bool sfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.Command;
    //native.RemainCount;        
}

// Export UBTTcpLink_Channel::execsfReqPaidItem_BroadCast(FFrame&, void* const)
native function bool sfReqPaidItem_BroadCast(BtrDouble ItemIdx, int Command, string Message)
{
    //native.ItemIdx;
    //native.Command;
    //native.Message;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_BroadCast(FFrame&, void* const)
native function bool sfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.StackCount;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_RelayBroadcast(FFrame&, void* const)
native function bool sfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    //native.CharName;
    //native.Msg;        
}

// Export UBTTcpLink_Channel::execsfReqPaidItem_ClanMarkDupCheck(FFrame&, void* const)
native function bool sfReqPaidItem_ClanMarkDupCheck(byte IsPaid, int Pattern, int BG, int BL)
{
    //native.IsPaid;
    //native.Pattern;
    //native.BG;
    //native.BL;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_ClanMarkDupCheck(FFrame&, void* const)
native function bool sfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqPaidItem_ChangeClanMark(FFrame&, void* const)
native function bool sfReqPaidItem_ChangeClanMark(BtrDouble ItemIdx, byte IsPaid, int Pattern, int BG, int BL)
{
    //native.ItemIdx;
    //native.IsPaid;
    //native.Pattern;
    //native.BG;
    //native.BL;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_ChangeClanMark(FFrame&, void* const)
native function bool sfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.StackCount;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_NotifyChangeClanMark(FFrame&, void* const)
native function bool sfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    //native.ClanName;
    //native.Pattern;
    //native.BG;
    //native.BL;        
}

// Export UBTTcpLink_Channel::execsfReqRemoveCheckTeamBalanceList(FFrame&, void* const)
native function bool sfReqRemoveCheckTeamBalanceList();

// Export UBTTcpLink_Channel::execsfReqClanMatch_SetWaitRoomPublic(FFrame&, void* const)
native function bool sfReqClanMatch_SetWaitRoomPublic(byte Set)
{
    //native.Set;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_SetWaitRoomPublic(FFrame&, void* const)
native function bool sfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    //native.Result;
    //native.ErrMsg;
    //native.Set;        
}

// Export UBTTcpLink_Channel::execsfReqExteriorRoomOwnerInfo(FFrame&, void* const)
native function bool sfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    //native.RoomNum;
    //native.OwnerName;
    //native.OwnerIP;        
}

// Export UBTTcpLink_Channel::execsfAckExteriorRoomOwnerInfo(FFrame&, void* const)
native function bool sfAckExteriorRoomOwnerInfo();

// Export UBTTcpLink_Channel::execsfReqSetLookForClan(FFrame&, void* const)
native function bool sfReqSetLookForClan(byte IsLookingFor)
{
    //native.IsLookingFor;        
}

// Export UBTTcpLink_Channel::execsfAckSetLookForClan(FFrame&, void* const)
native function bool sfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    //native.Result;
    //native.ErrMsg;
    //native.IsLookingFor;        
}

// Export UBTTcpLink_Channel::execsfReqGetMyMailBoxState(FFrame&, void* const)
native function bool sfReqGetMyMailBoxState();

// Export UBTTcpLink_Channel::execsfAckGetMyMailBoxState(FFrame&, void* const)
native function bool sfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    //native.Result;
    //native.IsFull;
    //native.NewMailCount;        
}

// Export UBTTcpLink_Channel::execsfReqMyEquipedItemList(FFrame&, void* const)
native function bool sfReqMyEquipedItemList();

// Export UBTTcpLink_Channel::execsfAckMyEquipedItemList(FFrame&, void* const)
native function bool sfAckMyEquipedItemList(array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<int> PaintID, array<BtrDouble> UniqueID, int Result)
{
    //native.ItemIDs;
    //native.SlotPositions;
    //native.AddPartsID;
    //native.PaintID;
    //native.UniqueID;
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqMyEquipedSkillList(FFrame&, void* const)
native function bool sfReqMyEquipedSkillList();

// Export UBTTcpLink_Channel::execsfAckMyEquipedSkillList(FFrame&, void* const)
native function bool sfAckMyEquipedSkillList(array<int> SkillIDs, array<int> SlotPositions, int Result)
{
    //native.SkillIDs;
    //native.SlotPositions;
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqMyEquipedQSlotList(FFrame&, void* const)
native function bool sfReqMyEquipedQSlotList();

// Export UBTTcpLink_Channel::execsfAckMyEquipedQSlotList(FFrame&, void* const)
native function bool sfAckMyEquipedQSlotList(array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<BtrDouble> PistolUniqueID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<BtrDouble> TW1UniqueID, array<int> TWItemID1, array<BtrDouble> TW2UniqueID, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID, int Result)
{
    //native.QSlotDispOrder;
    //native.MWUniqueID;
    //native.MWItemID;
    //native.MWPartID;
    //native.MWPaintID;
    //native.PistolUniqueID;
    //native.PistolItemID;
    //native.PistolPartID;
    //native.PistolPaintID;
    //native.TW1UniqueID;
    //native.TWItemID1;
    //native.TW2UniqueID;
    //native.TWItemID2;
    //native.Skill1ID;
    //native.Skill2ID;
    //native.Skill3ID;
    //native.Skill4ID;
    //native.Result;        
}

// Export UBTTcpLink_Channel::execsfReqRoomUserPingInfo(FFrame&, void* const)
native function bool sfReqRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    //native.UnqueID;
    //native.Ping;
    //native.HostPriorityPoint;        
}

// Export UBTTcpLink_Channel::execsfAckRoomUserPingInfo(FFrame&, void* const)
native function bool sfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    //native.UnqueID;
    //native.Ping;
    //native.HostPriorityPoint;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyStartTutorial(FFrame&, void* const)
native function bool sfReqNotifyStartTutorial();

// Export UBTTcpLink_Channel::execsfAckNotifyStartTutorial(FFrame&, void* const)
native function bool sfAckNotifyStartTutorial(int Result, int UserID)
{
    //native.Result;
    //native.UserID;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyEndTutorial(FFrame&, void* const)
native function bool sfReqNotifyEndTutorial(int TutorialResultType)
{
    //native.TutorialResultType;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyEndTutorial(FFrame&, void* const)
native function bool sfAckNotifyEndTutorial(int UserID, string CharName, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    //native.UserID;
    //native.CharName;
    //native.Level;
    //native.ClanName;
    //native.ClanMarkPattern;
    //native.ClanMarkBG;
    //native.ClanMarkBL;
    //native.ClanGrade;
    //native.ClanWin;
    //native.ClanLose;
    //native.IsLookFor;
    //native.Result;
    //native.ClanLevel;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfReqServerShutdown(FFrame&, void* const)
native function bool sfReqServerShutdown(string AuthKey, int SecondAfter, BtrDouble ShutdownTime)
{
    //native.AuthKey;
    //native.SecondAfter;
    //native.ShutdownTime;        
}

// Export UBTTcpLink_Channel::execsfAckServerShutdown(FFrame&, void* const)
native function bool sfAckServerShutdown(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfReqServerType(FFrame&, void* const)
native function bool sfReqServerType();

// Export UBTTcpLink_Channel::execsfAckServerType(FFrame&, void* const)
native function bool sfAckServerType(byte Type)
{
    //native.Type;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatch_GetPublicWaitRoomList(FFrame&, void* const)
native function bool sfReqClanMatch_GetPublicWaitRoomList();

// Export UBTTcpLink_Channel::execsfAckClanMatch_StartPublicWaitRoomList(FFrame&, void* const)
native function bool sfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    //native.Result;
    //native.ErrMsg;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_PublicWaitRoomList(FFrame&, void* const)
native function bool sfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    //native.WaitRoomIdx;
    //native.LeaderName;
    //native.RoomName;
    //native.MapNum;
    //native.CurUserCount;
    //native.MaxUserCount;
    //native.Status;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_EndPublicWaitRoomList(FFrame&, void* const)
native function bool sfAckClanMatch_EndPublicWaitRoomList();

// Export UBTTcpLink_Channel::execsfReqPaidItem_ChangeClanname(FFrame&, void* const)
native function bool sfReqPaidItem_ChangeClanname(BtrDouble ItemIdx, string NewClanname)
{
    //native.ItemIdx;
    //native.NewClanname;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_ChangeClanname(FFrame&, void* const)
native function bool sfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    //native.Result;
    //native.ErrMsg;
    //native.ItemIdx;
    //native.RemainCount;
    //native.NewClanname;        
}

// Export UBTTcpLink_Channel::execsfAckPaidItem_NotifyChangeClanname(FFrame&, void* const)
native function bool sfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    //native.NewClanname;        
}

// Export UBTTcpLink_Channel::execsfReqEventNotify(FFrame&, void* const)
native function bool sfReqEventNotify();

// Export UBTTcpLink_Channel::execsfAckEventNotify(FFrame&, void* const)
native function bool sfAckEventNotify(int Type)
{
    //native.Type;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatch_PublicWaitRoomChanged(FFrame&, void* const)
native function bool sfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    //native.WaitRoomIdx;
    //native.RoomName;
    //native.MapNum;
    //native.CurUserCount;
    //native.MaxUserCount;
    //native.Status;
    //native.IsPublic;        
}

// Export UBTTcpLink_Channel::execsfReqDeleteMailAll(FFrame&, void* const)
native function bool sfReqDeleteMailAll(byte MailType)
{
    //native.MailType;        
}

// Export UBTTcpLink_Channel::execsfAckDeleteMailAll(FFrame&, void* const)
native function bool sfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    //native.Result;
    //native.MailType;
    //native.Count;        
}

// Export UBTTcpLink_Channel::execsfReqClanMatchResultHistory(FFrame&, void* const)
native function bool sfReqClanMatchResultHistory(string ClanNm)
{
    //native.ClanNm;        
}

// Export UBTTcpLink_Channel::execsfAckClanMatchResultHistory(FFrame&, void* const)
native function bool sfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    //native.MatchDate;
    //native.IsWin;
    //native.EnemyClanname;        
}

// Export UBTTcpLink_Channel::execsfReqInGameRoomUserInfoChanged(FFrame&, void* const)
native function bool sfReqInGameRoomUserInfoChanged();

// Export UBTTcpLink_Channel::execsfReqInGameRoomUserClanLevelChanged(FFrame&, void* const)
native function bool sfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    //native.UserID;
    //native.ClanLevel;        
}

// Export UBTTcpLink_Channel::execsfReqCharDetailInfo(FFrame&, void* const)
native function bool sfReqCharDetailInfo();

// Export UBTTcpLink_Channel::execsfAckCharDetailInfo(FFrame&, void* const)
native function bool sfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    //native.MaxSerial;
    //native.MaxScore;
    //native.MaxKill;
    //native.MaxAssist;
    //native.Serial3;
    //native.Serial5;
    //native.Serial7;
    //native.Serial10;
    //native.Serial15;
    //native.AR;
    //native.SMG;
    //native.SR;
    //native.SW;
    //native.Melee;
    //native.Grenade;
    //native.FlashBang;
    //native.Foot;
    //native.AT4;
    //native.MG;
    //native.Fire;
    //native.RPG7;
    //native.TimeBomb;
    //native.IcendiaryBomb;
    //native.ClusterBomb;
    //native.ByChopper;
    //native.Artillery;
    //native.KillChopper;
    //native.FirstKill;
    //native.LastKill;
    //native.AllKill;
    //native.Dominate;
    //native.InstallBomb;
    //native.DefuseBomb;        
}

// Export UBTTcpLink_Channel::execsfReqGetRankingInfoList(FFrame&, void* const)
native function bool sfReqGetRankingInfoList(byte RankingType, byte CommunityType)
{
    //native.RankingType;
    //native.CommunityType;        
}

// Export UBTTcpLink_Channel::execsfAckGetRankingInfoListStart(FFrame&, void* const)
native function bool sfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    //native.Result;
    //native.RankingType;
    //native.CommunityType;
    //native.TotalCount;        
}

// Export UBTTcpLink_Channel::execsfAckGetRankingInfoList(FFrame&, void* const)
native function bool sfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    //native.Result;
    //native.RankingType;
    //native.CommunityType;
    //native.CharName;
    //native.CharLevel;
    //native.ClanName;
    //native.ClanMarkPattern;
    //native.ClanMarkBG;
    //native.ClanMarkBL;
    //native.Ranking_Accum;
    //native.Ranking_Accum_Prev;
    //native.Ranking_Accum_Exp;
    //native.LevelMarkID;
    //native.TitleMarkID;
    //native.Reserved1;
    //native.Reserved2;
    //native.Reserved3;        
}

// Export UBTTcpLink_Channel::execsfAckGetRankingInfoListEnd(FFrame&, void* const)
native function bool sfAckGetRankingInfoListEnd();

// Export UBTTcpLink_Channel::execsfAckNotifyUpdateCharInfo_LevelMark(FFrame&, void* const)
native function bool sfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    //native.CharName;
    //native.LevelMarkID;        
}

// Export UBTTcpLink_Channel::execsfAckNotifyUpdateCharInfo_TitleMark(FFrame&, void* const)
native function bool sfAckNotifyUpdateCharInfo_TitleMark(string CharName, int TitleMarkID)
{
    //native.CharName;
    //native.TitleMarkID;        
}

// Export UBTTcpLink_Channel::execsfReqCommunityOptionList(FFrame&, void* const)
native function bool sfReqCommunityOptionList();

// Export UBTTcpLink_Channel::execsfAckCommunityOptionList(FFrame&, void* const)
native function bool sfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite)
{
    //native.Opt_Wispher;
    //native.Opt_GameInvite;
    //native.Opt_FriendInvite;
    //native.Opt_ClanInvite;        
}

// Export UBTTcpLink_Channel::execsfReqSetCommunityOption(FFrame&, void* const)
native function bool sfReqSetCommunityOption(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite)
{
    //native.Opt_Wispher;
    //native.Opt_GameInvite;
    //native.Opt_FriendInvite;
    //native.Opt_ClanInvite;        
}

// Export UBTTcpLink_Channel::execsfAckSetCommunityOption(FFrame&, void* const)
native function bool sfAckSetCommunityOption(int Result, string ErrStr)
{
    //native.Result;
    //native.ErrStr;        
}

// Export UBTTcpLink_Channel::execsfAckTencent_AASInfo(FFrame&, void* const)
native function bool sfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec)
{
    //native.UserID;
    //native.IsAdult;
    //native.IsQQAuth;
    //native.AccumTimeSec;        
}

// Export UBTTcpLink_Channel::execsfReqLogOut(FFrame&, void* const)
native function bool sfReqLogOut(byte Reason)
{
    //native.Reason;        
}

// Export UBTTcpLink_Channel::execsfAckLogOut(FFrame&, void* const)
native function bool sfAckLogOut(byte Result, byte Reason)
{
    //native.Result;
    //native.Reason;        
}

// Export UBTTcpLink_Channel::execsfReqDedicateHost_Login(FFrame&, void* const)
native function bool sfReqDedicateHost_Login(int ProcessID, int ChannelNum, int RoomNum)
{
    //native.ProcessID;
    //native.ChannelNum;
    //native.RoomNum;        
}

// Export UBTTcpLink_Channel::execsfAckDedicateHost_Login(FFrame&, void* const)
native function bool sfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum)
{
    //native.Result;
    //native.UserID;
    //native.ChannelNum;
    //native.RoomNum;        
}

// Export UBTTcpLink_Channel::execsfReqFriendPosition(FFrame&, void* const)
native function bool sfReqFriendPosition(string TargetCharName, byte CommunityType)
{
    //native.TargetCharName;
    //native.CommunityType;        
}

// Export UBTTcpLink_Channel::execsfAckFriendPosition(FFrame&, void* const)
native function bool sfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    //native.Result;
    //native.TargetCharName;
    //native.ServerType;
    //native.fServername;
    //native.fServerShortName;
    //native.fServerIP;
    //native.fServerPort;
    //native.CurPos;
    //native.CurState;
    //native.ChannelNum;
    //native.ChannelNickName;
    //native.GameRoomNum;        
}

// Export UBTTcpLink_Channel::execsfReqSetClientVersion(FFrame&, void* const)
native function bool sfReqSetClientVersion(int ClientVersion)
{
    //native.ClientVersion;        
}

// Export UBTTcpLink_Channel::execsfUpdateWebzenShopScriptVersion(FFrame&, void* const)
native function bool sfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    //native.Year;
    //native.YearId;
    //native.SalesZoneCode;        
}

// Export UBTTcpLink_Channel::execsfAckPopUpMessage(FFrame&, void* const)
native function bool sfAckPopUpMessage(int MessageType)
{
    //native.MessageType;        
}

// Export UBTTcpLink_Channel::execsfAckMoveToLobby(FFrame&, void* const)
native function bool sfAckMoveToLobby(byte MessageType)
{
    //native.MessageType;        
}

// Export UBTTcpLink_Channel::execsfAckTencent_StartTenProtect(FFrame&, void* const)
native function bool sfAckTencent_StartTenProtect(int CharDBID)
{
    //native.CharDBID;        
}

// Export UBTTcpLink_Channel::execsfReqGameMapData(FFrame&, void* const)
native function bool sfReqGameMapData();

// Export UBTTcpLink_Channel::execsfAckGameMapData(FFrame&, void* const)
native function bool sfAckGameMapData(array<int> nIdx, array<int> nMapID, array<string> nMapNm, array<float> fSupHealth, array<float> fSupHeli, array<float> fSupBomb, array<float> fSupUAV, array<int> nModFFA, array<int> nModFFAMax, array<int> nModTDM, array<int> nModTDMMax, array<int> nModSD, array<int> nModSDMax, array<int> nModDOM, array<int> nModDOMMax, array<int> nModSab, array<int> nModSabMax)
{
    //native.nIdx;
    //native.nMapID;
    //native.nMapNm;
    //native.fSupHealth;
    //native.fSupHeli;
    //native.fSupBomb;
    //native.fSupUAV;
    //native.nModFFA;
    //native.nModFFAMax;
    //native.nModTDM;
    //native.nModTDMMax;
    //native.nModSD;
    //native.nModSDMax;
    //native.nModDOM;
    //native.nModDOMMax;
    //native.nModSab;
    //native.nModSabMax;        
}

// Export UBTTcpLink_Channel::execsfNotifyNewNickName(FFrame&, void* const)
native function bool sfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    //native.Community_Type;
    //native.Old_NickName;
    //native.New_NickName;        
}

// Export UBTTcpLink_Channel::execsfNotifyNewClanName(FFrame&, void* const)
native function bool sfNotifyNewClanName(string New_NickName)
{
    //native.New_NickName;        
}

// Export UBTTcpLink_Channel::execsfNotifyClanLevelup(FFrame&, void* const)
native function bool sfNotifyClanLevelup(string ClanName, int Levelup)
{
    //native.ClanName;
    //native.Levelup;        
}

// Export UBTTcpLink_Channel::execsfReqAhnHsObject(FFrame&, void* const)
native function bool sfReqAhnHsObject(array<byte> Data, int DataSize)
{
    //native.Data;
    //native.DataSize;        
}

// Export UBTTcpLink_Channel::execsfAckAhnHsObject(FFrame&, void* const)
native function bool sfAckAhnHsObject(array<byte> Data, int DataSize)
{
    //native.Data;
    //native.DataSize;        
}

// Export UBTTcpLink_Channel::execsfReqAhnNotifyDisconnct(FFrame&, void* const)
native function bool sfReqAhnNotifyDisconnct(int Code)
{
    //native.Code;        
}

// Export UBTTcpLink_Channel::execsfReqUpdateUserPerformenceInfo(FFrame&, void* const)
native function bool sfReqUpdateUserPerformenceInfo(int UserID, int MinFps, int MaxFps, int AvgFps, int MinPing, int MaxPing, int AvgPing)
{
    //native.UserID;
    //native.MinFps;
    //native.MaxFps;
    //native.AvgFps;
    //native.MinPing;
    //native.MaxPing;
    //native.AvgPing;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyLoadingStatus(FFrame&, void* const)
native function bool sfReqNotifyLoadingStatus(int Status)
{
    //native.Status;        
}

// Export UBTTcpLink_Channel::execsfReqShopItemData(FFrame&, void* const)
native function bool sfReqShopItemData(int Ver)
{
    //native.Ver;        
}

// Export UBTTcpLink_Channel::execsfAckShopItemData(FFrame&, void* const)
native function bool sfAckShopItemData();

// Export UBTTcpLink_Channel::execsfReqNotifyShopItemData(FFrame&, void* const)
native function bool sfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductName, array<int> ProductCode, array<byte> SaleType, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> SaleMasterFlag, array<int> SaleStatus, array<int> IsGift, array<BtrDouble> SaleEndTime, array<int> Discountcost)
{
    //native.ProductNo;
    //native.ProductName;
    //native.ProductCode;
    //native.SaleType;
    //native.ProductCost;
    //native.ProductHour;
    //native.ProductQuantity;
    //native.SaleMasterFlag;
    //native.SaleStatus;
    //native.IsGift;
    //native.SaleEndTime;
    //native.Discountcost;        
}

// Export UBTTcpLink_Channel::execsfReqNotifyShopItemDataEnd(FFrame&, void* const)
native function bool sfReqNotifyShopItemDataEnd(int Ver)
{
    //native.Ver;        
}

// Export UBTTcpLink_Channel::execsfReqCouponUse(FFrame&, void* const)
native function bool sfReqCouponUse(string Serial)
{
    //native.Serial;        
}

// Export UBTTcpLink_Channel::execsfAckCouponUse(FFrame&, void* const)
native function bool sfAckCouponUse(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Channel::execsfNotifyCouponUseError(FFrame&, void* const)
native function bool sfNotifyCouponUseError(int Time)
{
    //native.Time;        
}

// Export UBTTcpLink_Channel::execsfAckAIRewardResult(FFrame&, void* const)
native function bool sfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, array<int> ScoreRewardUserID, array<byte> ScoreRewardTYPE, array<int> ScoreRewardID, array<int> ScoreRewardCount)
{
    //native.ClearRewardTYPE;
    //native.ClearRewardID;
    //native.ClearRewardCount;
    //native.ScoreRewardUserID;
    //native.ScoreRewardTYPE;
    //native.ScoreRewardID;
    //native.ScoreRewardCount;        
}

// Export UBTTcpLink_Channel::execsfReqAttendanceList(FFrame&, void* const)
native function bool sfReqAttendanceList(byte ReqType, byte UpdateNum, byte UpdateState, BtrDouble PaidItemIdx)
{
    //native.ReqType;
    //native.UpdateNum;
    //native.UpdateState;
    //native.PaidItemIdx;        
}

// Export UBTTcpLink_Channel::execsfAckAttendanceList(FFrame&, void* const)
native function bool sfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    //native.Result;
    //native.IsComplete;
    //native.UpdatedNum;
    //native.StateList;
    //native.ItemIdx;
    //native.RewardItemID;
    //native.RewardItemCount;
    //native.PaidItemIdx;
    //native.PaidItemStackCount;        
}

// Export UBTTcpLink_Channel::execsfReqPuzzleList(FFrame&, void* const)
native function bool sfReqPuzzleList(byte ReqType, byte UpdateState, BtrDouble PaidItemIdx)
{
    //native.ReqType;
    //native.UpdateState;
    //native.PaidItemIdx;        
}

// Export UBTTcpLink_Channel::execsfAckPuzzleList(FFrame&, void* const)
native function bool sfAckPuzzleList(int Result, byte IsComplete, array<byte> UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    //native.Result;
    //native.IsComplete;
    //native.UpdatedNum;
    //native.StateList;
    //native.ItemIdx;
    //native.RewardItemID;
    //native.RewardItemCount;
    //native.PaidItemIdx;
    //native.PaidItemStackCount;        
}

// Export UBTTcpLink_Channel::execsfReqDailyRewardListThisMonth(FFrame&, void* const)
native function bool sfReqDailyRewardListThisMonth();

// Export UBTTcpLink_Channel::execsfAckDailyRewardListThisMonth(FFrame&, void* const)
native function bool sfAckDailyRewardListThisMonth(array<byte> Type, array<byte> Number, array<int> ItemID, array<int> ItemCount)
{
    //native.Type;
    //native.Number;
    //native.ItemID;
    //native.ItemCount;        
}

// Export UBTTcpLink_Channel::execsfReqReceiveSpecialReward(FFrame&, void* const)
native function bool sfReqReceiveSpecialReward(int QuestID)
{
    //native.QuestID;        
}

// Export UBTTcpLink_Channel::execsfAckReceiveSpecialReward(FFrame&, void* const)
native function bool sfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount)
{
    //native.Result;
    //native.RewardedQuestID;
    //native.RewardedQuestIsComplete;
    //native.ItemIdx;
    //native.RewardItemID;
    //native.RewardItemCount;        
}

// Export UBTTcpLink_Channel::execsfReqSpecialQuestRank(FFrame&, void* const)
native function bool sfReqSpecialQuestRank();

// Export UBTTcpLink_Channel::execsfAckSpecialQuestRank(FFrame&, void* const)
native function bool sfAckSpecialQuestRank(array<string> CharList)
{
    //native.CharList;        
}

// Export UBTTcpLink_Channel::execsfReqLuckShop_LotteryWinnerList(FFrame&, void* const)
native function bool sfReqLuckShop_LotteryWinnerList(int CapsuleItemID)
{
    //native.CapsuleItemID;        
}

// Export UBTTcpLink_Channel::execsfAckLuckShop_LotteryWinnerList(FFrame&, void* const)
native function bool sfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time, int GetItemID)
{
    //native.CapsuleItemID;
    //native.IsNotification;
    //native.NickName;
    //native.Time;
    //native.GetItemID;        
}

// Export UBTTcpLink_Channel::execsfReqLuckShop_StorageInfo(FFrame&, void* const)
native function bool sfReqLuckShop_StorageInfo();

// Export UBTTcpLink_Channel::execsfAckLuckShop_StorageInfo(FFrame&, void* const)
native function bool sfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState)
{
    //native.ErrorCode;
    //native.BuyingCapsuleCount;
    //native.CapsuleRewardState;        
}

// Export UBTTcpLink_Channel::execsfReqLuckShop_RewardBuyingCount(FFrame&, void* const)
native function bool sfReqLuckShop_RewardBuyingCount(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    //native.ChooseNum;
    //native.ItemID;
    //native.ItemIDChoose;
    //native.PartIDChoose;        
}

// Export UBTTcpLink_Channel::execsfAckLuckShop_RewardBuyingCount(FFrame&, void* const)
native function bool sfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState)
{
    //native.ErrorCode;
    //native.FinalCapsuleRewardState;        
}

// Export UBTTcpLink_Channel::execsfReqLuckShop_RewardCoupon(FFrame&, void* const)
native function bool sfReqLuckShop_RewardCoupon(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    //native.ChooseNum;
    //native.ItemID;
    //native.ItemIDChoose;
    //native.PartIDChoose;        
}

// Export UBTTcpLink_Channel::execsfAckLuckShop_RewardCoupon(FFrame&, void* const)
native function bool sfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, BtrDouble Coupon_ItemUniqueID, int Coupon_Count_AfterReduction)
{
    //native.ErrorCode;
    //native.Coupon_ItemTypeID;
    //native.Coupon_ItemUniqueID;
    //native.Coupon_Count_AfterReduction;        
}

// Export UBTTcpLink_Channel::execsfChangeItemInstanceInfo(FFrame&, void* const)
native function bool sfChangeItemInstanceInfo(int ErrorCode, int ItemID, BtrDouble ItemUniqueID, byte ChangeCount, int RemainCount)
{
    //native.ErrorCode;
    //native.ItemID;
    //native.ItemUniqueID;
    //native.ChangeCount;
    //native.RemainCount;        
}

// Export UBTTcpLink_Channel::execsfReqUseItemDuringGame(FFrame&, void* const)
native function bool sfReqUseItemDuringGame(string CharName, int ItemID, BtrDouble ItemUniqueID, byte UsingCount)
{
    //native.CharName;
    //native.ItemID;
    //native.ItemUniqueID;
    //native.UsingCount;        
}

// Export UBTTcpLink_Channel::execsfAckUseItemDuringGame(FFrame&, void* const)
native function bool sfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    //native.ErrorCode;
    //native.CharName;
    //native.ItemID;
    //native.ItemUniqueID;
    //native.RemainCount;        
}
