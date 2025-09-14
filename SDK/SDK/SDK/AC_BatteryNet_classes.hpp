#pragma once

// Arctic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Classes
//---------------------------------------------------------------------------

// Class BatteryNet.BTTcpLink_Process2Agent
// 0x0000 (0x002C - 0x002C)
class UBTTcpLink_Process2Agent : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTTcpLink_Process2Agent");
		return ptr;
	}


	bool sfReqUpdateCurrentRunningInfo(int GroupID, const struct FString& GroupName, const struct FString& ServerName, int ServerID, TArray<struct FString> key, TArray<int> Value);
	bool sfReqNotifyKickOffUser(int QQID);
	bool sfReqUpdatePostAlram(int QQID, const struct FString& Subject, const struct FString& Text, int ItemID);
	bool sfReqUpdateProcessState(int State);
	bool sfAckProcessExcuteCmd(int Result, int MajorType, int MinorType, const struct FString& CmdValue);
	bool sfReqProcessExcuteCmd(int MajorType, int MinorType, const struct FString& CmdValue);
	bool sfReqUpdateUserCount_DudeServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool sfReqUpdateUserCount_LoginServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool sfReqUpdateUserCount_ChannelServer(int ServerID, int ChannelCount, TArray<int> ChannelNum, TArray<int> ChannelMaxUserCount, TArray<int> ChannelCurUserCount, TArray<int> ChannelPlayingUserCount, TArray<int> ChannelRoomCount, TArray<unsigned char> ChannelGrade);
	bool sfReqTerminateDedicateHostProcess();
	bool sfAckStartDedicateHost(int Result, int ProcessID, int ServerID, int ChannelNum, int RoomNum);
	bool sfReqStartDedicateHost(int ServerID, const struct FString& ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum);
	bool sfAckQuitDedicateHost(int Result, int PID, int ServerID, int ChannelNum, int RoomNum);
	bool sfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum);
	bool sfAckLogin(int Result);
	bool sfReqLogin(int PID, int ServerID, TArray<unsigned char> ServerIPAddrType, TArray<struct FString> ServerIPAddr, TArray<unsigned char> ServerPortType, TArray<int> ServerPortNum);
	bool sfAckHash(int Result, const struct FString& ErrMsg);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfReqUpdateCurrentRunningInfo(int GroupID, const struct FString& GroupName, const struct FString& ServerName, int ServerID, TArray<struct FString> key, TArray<int> Value);
	bool rfReqNotifyKickOffUser(int QQID);
	bool rfReqUpdatePostAlram(int QQID, const struct FString& Subject, const struct FString& Text, int ItemID);
	bool rfReqUpdateProcessState(int State);
	bool rfAckProcessExcuteCmd(int Result, int MajorType, int MinorType, const struct FString& CmdValue);
	bool rfReqProcessExcuteCmd(int MajorType, int MinorType, const struct FString& CmdValue);
	bool rfReqUpdateUserCount_DudeServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool rfReqUpdateUserCount_LoginServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool rfReqUpdateUserCount_ChannelServer(int ServerID, int ChannelCount, TArray<int> ChannelNum, TArray<int> ChannelMaxUserCount, TArray<int> ChannelCurUserCount, TArray<int> ChannelPlayingUserCount, TArray<int> ChannelRoomCount, TArray<unsigned char> ChannelGrade);
	bool rfReqTerminateDedicateHostProcess();
	bool rfAckStartDedicateHost(int Result, int ProcessID, int ServerID, int ChannelNum, int RoomNum);
	bool rfReqStartDedicateHost(int ServerID, const struct FString& ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum);
	bool rfAckQuitDedicateHost(int Result, int PID, int ServerID, int ChannelNum, int RoomNum);
	bool rfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum);
	bool rfAckLogin(int Result);
	bool rfReqLogin(int PID, int ServerID, TArray<unsigned char> ServerIPAddrType, TArray<struct FString> ServerIPAddr, TArray<unsigned char> ServerPortType, TArray<int> ServerPortNum);
	bool rfAckHash(int Result, const struct FString& ErrMsg);
	bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	bool Close();
	bool Connect(const struct FString& sIpaddr, int nPort);
	bool InitNetwork();
};


// Class BatteryNet.BTTcpHandler_DStoDP_Script_Interface
// 0x0008 (0x0034 - 0x002C)
class UBTTcpHandler_DStoDP_Script_Interface : public UBTTcpLink_Process2Agent
{
public:
	class UwMatchMaker*                                MM;                                                       // 0x002C(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTTcpHandler_DStoDP_Script_Interface");
		return ptr;
	}


	void SetGameManager(class UwGameManager* pgameMgr);
	void SetMatchMaker(class UwMatchMaker* pMM);
};


// Class BatteryNet.BTTcpHandler_DStoDP
// 0x0008 (0x0058 - 0x0050)
class UBTTcpHandler_DStoDP : public UBTTcpLink_DStoDP_DS
{
public:
	unsigned char                                      UnknownData00[0x8];                                       // 0x0050(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTTcpHandler_DStoDP");
		return ptr;
	}

};


// Class BatteryNet.BTTcpLink_Channel
// 0x0000 (0x002C - 0x002C)
class UBTTcpLink_Channel : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTTcpLink_Channel");
		return ptr;
	}


	bool sfAckUseItemDuringGame(int ErrorCode, const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool sfReqUseItemDuringGame(const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char UsingCount);
	bool sfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char ChangeCount, int RemainCount);
	bool sfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool sfReqLuckShop_RewardCoupon(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool sfReqLuckShop_RewardBuyingCount(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool sfReqLuckShop_StorageInfo();
	bool sfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool sfReqLuckShop_LotteryWinnerList(int CapsuleItemID);
	bool sfAckSpecialQuestRank(TArray<struct FString> CharList);
	bool sfReqSpecialQuestRank();
	bool sfAckReceiveSpecialReward(int Result, int RewardedQuestID, unsigned char RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool sfReqReceiveSpecialReward(int QuestID);
	bool sfAckDailyRewardListThisMonth(TArray<unsigned char> Type, TArray<unsigned char> Number, TArray<int> ItemID, TArray<int> ItemCount);
	bool sfReqDailyRewardListThisMonth();
	bool sfAckPuzzleList(int Result, unsigned char IsComplete, TArray<unsigned char> UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool sfReqPuzzleList(unsigned char ReqType, unsigned char UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool sfAckAttendanceList(int Result, unsigned char IsComplete, unsigned char UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool sfReqAttendanceList(unsigned char ReqType, unsigned char UpdateNum, unsigned char UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool sfAckAIRewardResult(unsigned char ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, TArray<int> ScoreRewardUserID, TArray<unsigned char> ScoreRewardTYPE, TArray<int> ScoreRewardID, TArray<int> ScoreRewardCount);
	bool sfNotifyCouponUseError(int Time);
	bool sfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool sfReqCouponUse(const struct FString& Serial);
	bool sfReqNotifyShopItemDataEnd(int Ver);
	bool sfReqNotifyShopItemData(TArray<int> ProductNo, TArray<struct FString> ProductName, TArray<int> ProductCode, TArray<unsigned char> SaleType, TArray<int> ProductCost, TArray<int> ProductHour, TArray<int> ProductQuantity, TArray<int> SaleMasterFlag, TArray<int> SaleStatus, TArray<int> IsGift, TArray<struct FBtrDouble> SaleEndTime, TArray<int> Discountcost);
	bool sfAckShopItemData();
	bool sfReqShopItemData(int Ver);
	bool sfReqNotifyLoadingStatus(int Status);
	bool sfReqUpdateUserPerformenceInfo(int UserID, int MinFps, int MaxFps, int AvgFps, int MinPing, int MaxPing, int AvgPing);
	bool sfReqAhnNotifyDisconnct(int Code);
	bool sfAckAhnHsObject(TArray<unsigned char> Data, int DataSize);
	bool sfReqAhnHsObject(TArray<unsigned char> Data, int DataSize);
	bool sfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool sfNotifyNewClanName(const struct FString& New_NickName);
	bool sfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool sfAckGameMapData(TArray<int> nIdx, TArray<int> nMapID, TArray<struct FString> nMapNm, TArray<float> fSupHealth, TArray<float> fSupHeli, TArray<float> fSupBomb, TArray<float> fSupUAV, TArray<int> nModFFA, TArray<int> nModFFAMax, TArray<int> nModTDM, TArray<int> nModTDMMax, TArray<int> nModSD, TArray<int> nModSDMax, TArray<int> nModDOM, TArray<int> nModDOMMax, TArray<int> nModSab, TArray<int> nModSabMax);
	bool sfReqGameMapData();
	bool sfAckTencent_StartTenProtect(int CharDBID);
	bool sfAckMoveToLobby(unsigned char MessageType);
	bool sfAckPopUpMessage(int MessageType);
	bool sfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool sfReqSetClientVersion(int ClientVersion);
	bool sfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool sfReqFriendPosition(const struct FString& TargetCharName, unsigned char CommunityType);
	bool sfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum);
	bool sfReqDedicateHost_Login(int ProcessID, int ChannelNum, int RoomNum);
	bool sfAckLogOut(unsigned char Result, unsigned char Reason);
	bool sfReqLogOut(unsigned char Reason);
	bool sfAckTencent_AASInfo(int UserID, unsigned char IsAdult, unsigned char IsQQAuth, int AccumTimeSec);
	bool sfAckSetCommunityOption(int Result, const struct FString& ErrStr);
	bool sfReqSetCommunityOption(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool sfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool sfReqCommunityOptionList();
	bool sfAckNotifyUpdateCharInfo_TitleMark(const struct FString& CharName, int TitleMarkID);
	bool sfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool sfAckGetRankingInfoListEnd();
	bool sfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool sfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool sfReqGetRankingInfoList(unsigned char RankingType, unsigned char CommunityType);
	bool sfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool sfReqCharDetailInfo();
	bool sfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool sfReqInGameRoomUserInfoChanged();
	bool sfAckClanMatchResultHistory(TArray<struct FBtrDouble> MatchDate, TArray<unsigned char> IsWin, TArray<struct FString> EnemyClanname);
	bool sfReqClanMatchResultHistory(const struct FString& ClanNm);
	bool sfAckDeleteMailAll(int Result, unsigned char MailType, int Count);
	bool sfReqDeleteMailAll(unsigned char MailType);
	bool sfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const struct FString& RoomName, int MapNum, int CurUserCount, int MaxUserCount, unsigned char Status, unsigned char IsPublic);
	bool sfAckEventNotify(int Type);
	bool sfReqEventNotify();
	bool sfAckPaidItem_NotifyChangeClanname(const struct FString& NewClanname);
	bool sfAckPaidItem_ChangeClanname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewClanname);
	bool sfReqPaidItem_ChangeClanname(const struct FBtrDouble& ItemIdx, const struct FString& NewClanname);
	bool sfAckClanMatch_EndPublicWaitRoomList();
	bool sfAckClanMatch_PublicWaitRoomList(TArray<int> WaitRoomIdx, TArray<struct FString> LeaderName, TArray<struct FString> RoomName, TArray<int> MapNum, TArray<int> CurUserCount, TArray<int> MaxUserCount, TArray<unsigned char> Status);
	bool sfAckClanMatch_StartPublicWaitRoomList(int Result, const struct FString& ErrMsg, int Count);
	bool sfReqClanMatch_GetPublicWaitRoomList();
	bool sfAckServerType(unsigned char Type);
	bool sfReqServerType();
	bool sfAckServerShutdown(int Result, const struct FString& ErrMsg);
	bool sfReqServerShutdown(const struct FString& AuthKey, int SecondAfter, const struct FBtrDouble& ShutdownTime);
	bool sfAckNotifyEndTutorial(int UserID, const struct FString& CharName, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqNotifyEndTutorial(int TutorialResultType);
	bool sfAckNotifyStartTutorial(int Result, int UserID);
	bool sfReqNotifyStartTutorial();
	bool sfAckRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostPriorityPoint);
	bool sfReqRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostPriorityPoint);
	bool sfAckMyEquipedQSlotList(TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<struct FBtrDouble> PistolUniqueID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<struct FBtrDouble> TW1UniqueID, TArray<int> TWItemID1, TArray<struct FBtrDouble> TW2UniqueID, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID, int Result);
	bool sfReqMyEquipedQSlotList();
	bool sfAckMyEquipedSkillList(TArray<int> SkillIDs, TArray<int> SlotPositions, int Result);
	bool sfReqMyEquipedSkillList();
	bool sfAckMyEquipedItemList(TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<int> PaintID, TArray<struct FBtrDouble> UniqueID, int Result);
	bool sfReqMyEquipedItemList();
	bool sfAckGetMyMailBoxState(int Result, unsigned char IsFull, int NewMailCount);
	bool sfReqGetMyMailBoxState();
	bool sfAckSetLookForClan(int Result, const struct FString& ErrMsg, unsigned char IsLookingFor);
	bool sfReqSetLookForClan(unsigned char IsLookingFor);
	bool sfAckExteriorRoomOwnerInfo();
	bool sfReqExteriorRoomOwnerInfo(int RoomNum, const struct FString& OwnerName, const struct FString& OwnerIP);
	bool sfAckClanMatch_SetWaitRoomPublic(int Result, const struct FString& ErrMsg, unsigned char Set);
	bool sfReqClanMatch_SetWaitRoomPublic(unsigned char Set);
	bool sfReqRemoveCheckTeamBalanceList();
	bool sfAckPaidItem_NotifyChangeClanMark(const struct FString& ClanName, int Pattern, int BG, int BL);
	bool sfAckPaidItem_ChangeClanMark(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool sfReqPaidItem_ChangeClanMark(const struct FBtrDouble& ItemIdx, unsigned char IsPaid, int Pattern, int BG, int BL);
	bool sfAckPaidItem_ClanMarkDupCheck(int Result, const struct FString& ErrMsg);
	bool sfReqPaidItem_ClanMarkDupCheck(unsigned char IsPaid, int Pattern, int BG, int BL);
	bool sfAckPaidItem_RelayBroadcast(const struct FString& CharName, const struct FString& Msg);
	bool sfAckPaidItem_BroadCast(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool sfReqPaidItem_BroadCast(const struct FBtrDouble& ItemIdx, int Command, const struct FString& Message);
	bool sfAckPaidItem_EraseRecord(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool sfReqPaidItem_EraseRecord(const struct FBtrDouble& ItemIdx, int Command);
	bool sfAckPaidItem_ChangeCharname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewCharname);
	bool sfReqPaidItem_ChangeCharname(const struct FBtrDouble& ItemIdx, const struct FString& NewCharname);
	bool sfAckRecvSystemMsg(unsigned char CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool sfAckSendSystemMsg(int Result);
	bool sfReqSendSystemMsg(unsigned char RecvType, const struct FString& SendCharName, const struct FString& RecvCharname, const struct FSystemMsgParam& MsgInfo);
	bool sfAckRandomBox_Use(int Result, const struct FString& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, TArray<int> ItemIDChoose, TArray<int> PartIDChoose, TArray<int> PeriodOnChoosenItem, TArray<int> StackCountOnChoosenItem, TArray<unsigned char> bHave, TArray<struct FBtrDouble> ItemIdx, TArray<struct FBtrDouble> UntilTime, TArray<int> StackCount);
	bool sfReqRandomBox_Use(const struct FBtrDouble& ItemIdx_RandomBox, const struct FBtrDouble& ItemIdx_Key);
	bool sfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool sfAckChangeRoomTitle_GM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool sfReqChangeRoomTitle_GM(int RoomNumber, const struct FString& NewRoomTitle);
	bool sfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool sfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool sfAckQuestGetAvailableEventList(int Result, const struct FString& ErrMsg, TArray<int> QuestID);
	bool sfReqQuestGetAvailableEventList();
	bool sfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, TArray<struct FBtrDouble> BlockedItemIdx);
	bool sfReqCharBlockInfo();
	bool sfReqIsPaidWebzenPCBang(unsigned char IsPaid);
	bool sfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, const struct FString& WaitRoomName);
	bool sfReqClanMatch_GetClanWaittingRoomInfo();
	bool sfAckReturnBotID(int Result);
	bool sfReqReturnBotID(TArray<int> BotID);
	bool sfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID);
	bool sfReqGetBotID(unsigned char AFCount, unsigned char RSACount);
	bool sfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool sfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool sfAckParamCheckSum(int Result);
	bool sfReqParamCheckSum(const struct FString& key, const struct FString& Value);
	bool sfAckWebzenBillingUseStorageItem(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool sfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, unsigned char StorageItemType);
	bool sfAckWebzenBillingStorageListEnd();
	bool sfAckWebzenBillingStorageList(TArray<int> Seq, TArray<int> ItemSeq, TArray<int> GroupCode, TArray<int> ShareFlag, TArray<int> ProductSeq, TArray<struct FString> CashName, TArray<struct FBtrDouble> CashPoint, TArray<struct FString> SendAccountID, TArray<struct FString> SendMessage, TArray<unsigned char> ItemType, TArray<unsigned char> RelationType, TArray<int> ProductType, TArray<int> PriceSeq);
	bool sfAckWebzenBillingStorageListStart(int Result, const struct FString& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool sfReqWebzenBillingStorageList(int Page, int CountForPage, unsigned char Type);
	bool sfAckGiftItemByWebzenCash(int Result, const struct FString& ErrMsg, int LeftProductCount);
	bool sfReqGiftItemByWebzenCash(const struct FString& ReceiverCharName, const struct FString& Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq);
	bool sfReqGiftItemByWebzenCashGP20(const struct FString& ReceiverCharName, const struct FString& Message, int ProductNo, unsigned char Cointype);
	bool sfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool sfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, TArray<int> ItemIDs, const struct FBtrDouble& ItemUniqueID, unsigned char BuyOption1, unsigned char BuyOption2);
	bool sfReqBuyItemByWebzenCashGP20(int ProductNo, unsigned char Cointype, const struct FBtrDouble& ItemID);
	bool sfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool sfReqWebzenShopScriptVersion();
	bool sfAckWebzenCash(int Result, const struct FString& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool sfReqWebzenCash();
	bool sfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool sfReqRegisteredPCBangInfo();
	bool sfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool sfReqRegisterMainPCBang();
	bool sfAckPCBangUserListEnd();
	bool sfAckPCBangUserList(TArray<struct FString> FriendName, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, TArray<unsigned char> IsCombat, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool sfAckPCBangUserListStart(int Result, int TotalCount);
	bool sfReqPCBangUserList();
	bool sfReqDailyQuestNewAvailable(TArray<int> ExpiredQuestID, TArray<int> NewQuestID);
	bool sfReqQuestNewAvailable(TArray<int> AchivedQuestID, TArray<int> NewQuestID, TArray<unsigned char> IsDailyQuest, TArray<int> ExpiredQuest);
	bool sfAckQuestUpdate(int Result, const struct FString& ErrMsg);
	bool sfReqQuestUpdate(int UniqueID, int GameRoomNum, TArray<int> QuestID, TArray<int> CountPrograss);
	bool sfAckQuestListEnd();
	bool sfAckQuestList(TArray<int> QuestID, TArray<int> CountPrograss, TArray<unsigned char> QuestType, TArray<unsigned char> IsComplete);
	bool sfAckQuestListStart(int Result, const struct FString& ErrMsg);
	bool sfReqQuestList();
	bool sfAckPermanentRoomInfo(int Result, int ClanIdx, unsigned char FixedGameMode, unsigned char FixedMaxUserCnt);
	bool sfReqPermanentRoomInfo(int RoomNum);
	bool sfAckClanMatch_FoundMatch();
	bool sfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool sfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool sfAckClanMatch_StartSearching(int Result, const struct FString& ErrMsg, int ShouldWaitMore);
	bool sfReqClanMatch_StartSearching(int RequestCount);
	bool sfAckLimitedListInChannel(int Result, TArray<int> LimitedMapID, TArray<int> LimitedModeID);
	bool sfReqLimitedListInChannel();
	bool sfAckRecvInviteGameRoomResult(int Result);
	bool sfAckRecvInviteGameRoom(const struct FString& RoomUniqueID, int RoomNumber, unsigned char Answer, const struct FString& InviteCharName);
	bool sfReqRecvInviteGameRoom(const struct FString& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const struct FString& RoomUniqueID, int RoomNumber, const struct FString& RoomName, unsigned char RoomState, const struct FString& MapName, const struct FString& OwnerName, unsigned char GameMode, unsigned char WeaponLimit, unsigned char IsTeamBalance, const struct FString& Password, const struct FString& InviteCharName);
	bool sfAckInviteGameRoom(int Result, unsigned char Answer, const struct FString& GuestCharName);
	bool sfReqInviteGameRoom(const struct FString& GuestCharName);
	bool sfAckClanMatch_StopSearching();
	bool sfReqClanMatch_StopSearching();
	bool sfAckClanMatch_ChangeLeader(int Result, const struct FString& ErrMsg, int NewLeader, const struct FString& NewLeaderName);
	bool sfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, const struct FString& NewLeaderName);
	bool sfAckClanMatch_WaittingTeamList(int TtotlCount, TArray<int> Grade, TArray<int> Map, TArray<int> Versus);
	bool sfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount);
	bool sfAckClanMatch_Chat(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& Msg);
	bool sfReqClanMatch_Chat(const struct FString& Msg);
	bool sfAckClanMatch_LeaveNotify(const struct FString& CharName);
	bool sfAckClanMatch_Leave(int Result, const struct FString& ErrMsg);
	bool sfReqClanMatch_Leave(int WaittingID);
	bool sfAckClanMatch_MemberList(TArray<unsigned char> IsLeader, TArray<int> ClanMarkPA, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Level, TArray<struct FString> CharName, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<struct FString> ClanName, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool sfReqClanMatch_MemberList();
	bool sfAckClanMatch_JoinNotify(unsigned char IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const struct FString& CharName, int ClanGrade, int ClanWin, int ClanLose, const struct FString& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool sfReqClanMatch_Join(int WaittingID);
	bool sfReqClanMatch_InviteCrewResult(const struct FString& Invitee, int Result);
	bool sfAckClanMatch_RecvInviteCrew(int Result, const struct FString& Inviter);
	bool sfReqClanMatch_RecvInviteCrew(const struct FString& Inviter, const struct FString& ServerIP, int Port, int WaittingID, const struct FString& Msg, int MapNum, int InviteUserChannelNum, const struct FString& LeaderName, const struct FString& RoomName);
	bool sfAckClanMatch_InviteCrew(int Result, const struct FString& ErrMsg);
	bool sfReqClanMatch_InviteCrew(const struct FString& Invitee);
	bool sfAckClanMatch_NotifiyStartCombat(TArray<int> MapNumArray, int VersusMode);
	bool sfAckClanMatch_StartCombat(int Result, const struct FString& ErrMsg);
	bool sfReqClanMatch_StartCombat(TArray<int> MapNumArray, int VersusMode);
	bool sfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
	bool sfReqClanMatch_GetReady();
	bool sfAckAutoChangedTeamUserList(TArray<int> UserID, TArray<int> TeamNum);
	bool sfAckGetItemFromItemBox(int Result, const struct FString& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, unsigned char bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool sfReqGetItemFromItemBox(const struct FBtrDouble& ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfAckItemListInItemBox(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, TArray<int> ItemID, TArray<int> PartID, unsigned char FromContent);
	bool sfReqItemListInItemBox(const struct FBtrDouble& ItemUniqueID, int BoxItemID, unsigned char FromContent);
	bool sfReqRecvForceFailedClientLoading(int ErrCode);
	bool sfAckForceFailedClientLoading(int Result, const struct FString& ErrMsg);
	bool sfReqForceFailedClientLoading(int FailedUserID, int ErrCode);
	bool sfAckStartHolePunching(int Result, const struct FString& ErrMsg, int GameType, int ReqStartUserID);
	bool sfReqStartHolePunching(int GameType, int ReqStartUserID);
	bool sfAckNotifyMyCharInfoToRoomUser(int Result, const struct FString& ErrMsg, int UID, const struct FString& UserName, int Grade, int TeamNum, unsigned char Statue, unsigned char IsHost, const struct FString& UserIP, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, unsigned char IsLookFor);
	bool sfReqNotifyMyCharInfoToRoomUser();
	bool sfReqNotifyDurabilityZeroItem(int Result, const struct FString& ErrMsg, int UserID, TArray<struct FBtrDouble> ItemUniqueIDs, TArray<int> ItemIDs, TArray<int> ItemPartIDs, TArray<unsigned char> ItemSlotPos);
	bool sfAckChatWispherMyCommunity(int Result, const struct FString& ErrMsg);
	bool sfReqChatWispherMyCommunity(const struct FString& SourceCharName, const struct FString& SenderName, const struct FString& Msg);
	bool sfReqNotifyDisconnectHostInLoading(int Result, const struct FString& ErrMsg, int HostID);
	bool sfReqRecvForceDisconnected_FromGM(int Result, const struct FString& ErrMsg);
	bool sfAckForceDisconnectUser_GM(int Result, const struct FString& ErrMsg, const struct FString& CharName);
	bool sfReqForceDisconnectUser_GM(const struct FString& CharName);
	bool sfReqRecvNotice_FromGM(int Result, const struct FString& ErrMsg, TArray<struct FString> NoticeMsg, unsigned char IsFromDB);
	bool sfAckNotice_GM(int Result, const struct FString& ErrMsg, unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool sfReqNotice_GM(unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool sfAckSpecificChannelUserInfo(int UID, const struct FString& UserID, int UserLevels, const struct FString& ClanName, int ClanPattern, int ClanBG, int ClanBL, int Result, const struct FString& ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqSpecificChannelUserInfo(int UserID);
	bool sfAckSpecificGameRoomInfo(int Result, int GameNum, const struct FString& Title, const struct FString& MapName, int MapNum, unsigned char UserCount, unsigned char MaxCount, const struct FString& GameModeName, int ModeNum, unsigned char WeaponLimit, unsigned char IsHardCore, unsigned char Status, const struct FString& RoomOwnerIP, int GameMinute, const struct FString& RoomOwnerName, unsigned char IsSpecial, unsigned char IsPassword);
	bool sfReqSpecificGameRoomInfo(int RoomNum);
	bool sfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> CharName, TArray<int> UserLevel, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<unsigned char> IsLookForClan, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool sfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count);
	bool sfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool sfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool sfReqDeleteFriend(TArray<struct FString> DeleteCharName);
	bool sfAckGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool sfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool sfAckCheckEquipedWeaponDurability(int Result, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemSlotNum);
	bool sfReqCheckEquipedWeaponDurability();
	bool sfReqGamePlay_GetChopper(int GetChopperUID, TArray<int> GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, const struct FString& ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord);
	bool sfAckAcquirePromotionItems(int UID, int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemIDs, TArray<int> PartIDs);
	bool sfAckIsAvailClanURL(const struct FString& ClanURL, int Result, const struct FString& ErrMsg);
	bool sfReqIsAvailClanURL(const struct FString& ClanURL);
	bool sfAckGetIsHostBlocking(int Result, unsigned char Blocking);
	bool sfReqGetIsHostBlocking();
	bool sfAckNotifyHostBlocking(int Result, unsigned char Blocking);
	bool sfReqNotifyHostBlocking(unsigned char Blocking);
	bool sfAckGetHolePunchingResult(int Result, unsigned char Phrase, int InterventionUserID, unsigned char Intervention, TArray<int> FailedUserIDs);
	bool sfReqGetHolePunchingResult();
	bool sfReqNotifyRecvDummyForHolePunching(int ClientUserID, unsigned char Phrase);
	bool sfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber);
	bool sfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore);
	bool sfReqNotifyRelayServerAddr(const struct FString& RelayIP, int RelayPort);
	bool sfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool sfReqGetUserHostPriorityPoint(int UserID);
	bool sfReqUpdateMyHostPriorityPoint(int HostPriorityPoint);
	bool sfReqWriteServerLog(unsigned char Destination, const struct FString& LogMsg);
	bool sfReqGamePlay_SetRoundStartTime(TArray<int> UID);
	bool sfReqGamePlay_SetGameStartTime(TArray<int> UID);
	bool sfReqRecvForceDisconnectUDPFromHost(int Result);
	bool sfAckForceDisconnectUDPFromHost(int Result);
	bool sfReqForceDisconnectUDPFromHost(int UserID);
	bool sfReqGamePlay_TakeAPoint(TArray<int> TakerUID, unsigned char TakePos, TArray<float> TakerXCoord, TArray<float> TakerYCoord, TArray<float> TakerZCoord, TArray<int> TakerPos, TArray<int> TakerWeaponID, TArray<int> TakerWeaponPartID, TArray<int> TakerRange);
	bool sfReqNotifyChangeRoomState(unsigned char RoomState);
	bool sfReqGamePlay_DefuseBomb(int DefuserUID, unsigned char DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange);
	bool sfReqGamePlay_InstallBomb(int InstallerUID, unsigned char InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange);
	bool sfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool sfReqDBCharInfo(const struct FString& CharName);
	bool sfReqForceNatTypeSetting(int NatType);
	bool sfAckGetServerTime(const struct FBtrDouble& ServerTime, const struct FString& ClientIP);
	bool sfReqGetServerTime();
	bool sfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, unsigned char VTeam, unsigned char VTeamAD, int AFScore, int RSAScore, int Round);
	bool sfReqLogGetScore(const struct FKillDeathLog& KillDeathLogParam, TArray<int> AssistUIDs, TArray<unsigned char> AssistScores);
	bool sfAckAuctionTradeHistory(int Result, const struct FString& ErrMsg, int ItemID, int PartID, TArray<struct FString> SellerCharNm, TArray<int> DamageDegree, TArray<int> Price);
	bool sfReqAuctionTradeHistory(int ItemID, int PartID);
	bool sfAckSendGift(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain);
	bool sfReqSendGift(int ItemID, const struct FString& RecvCharname, const struct FString& RecvMessage, unsigned char BuyOption1, unsigned char BuyOption2);
	bool sfAckGetAttachedItemFromMemo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool sfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID);
	bool sfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool sfAckChatClan(const struct FString& CharName, const struct FString& Message, int Result);
	bool sfReqChatClan(const struct FString& Message);
	bool sfAckTestDouble(const struct FBtrDouble& vDouble, TArray<struct FBtrDouble> vDoubles);
	bool sfReqTestDouble(const struct FBtrDouble& vDouble, TArray<struct FBtrDouble> vDoubles);
	bool sfAckNotifyLoadingState(int Result, int UserID, unsigned char LoadingState);
	bool sfReqNotifyLoadingState(unsigned char LoadingState);
	bool sfAckFailedStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, int FailedUserID, int LoadingStep);
	bool sfReqFailedStartGame(int LoadingStep);
	bool sfAckSuccessStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, const struct FString& HostIP, int HostPort, int LoadingStep);
	bool sfReqSuccessStartGame(int LoadingStep);
	bool sfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool sfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool sfAckClanPersonelIntro(int Result, const struct FString& ErrMsg);
	bool sfReqClanPersonelIntro(const struct FString& ClanName, const struct FString& CharName, const struct FString& PersonelIntro);
	bool sfAckClanChangeInfo(int Result, const struct FString& ErrMsg);
	bool sfReqClanChangeInfo(const struct FString& ClanName, unsigned char IsRecruit, unsigned char Region, const struct FString& Keyword, const struct FString& ClanIntro, const struct FString& Notice);
	bool sfAckClanClose(int Result, const struct FString& ErrMsg, const struct FString& ClanName);
	bool sfReqClanClose(const struct FString& ClanName);
	bool sfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool sfAckClanSecession(int Result, const struct FString& ErrMsg);
	bool sfReqClanSecession(const struct FString& ClanName);
	bool sfAckClanNews(TArray<struct FString> IssueDate, TArray<unsigned char> IssueType, TArray<struct FString> IssuedClanMember);
	bool sfReqClanNews(const struct FString& ClanName);
	bool sfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool sfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool sfReqAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool sfAckClanUserListEnd();
	bool sfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool sfAckClanUserListStart(int Result, int TotalCount);
	bool sfReqClanUserList(const struct FString& ClanName);
	bool sfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool sfReqSerachClan(unsigned char SearchType, const struct FString& Keyword, unsigned char ClanStatus, unsigned char ClanRegion, int ReqPage);
	bool sfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool sfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool sfAckRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& ReqMsg, unsigned char Permit);
	bool sfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool sfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool sfReqJoinClan(const struct FString& ClanName, const struct FString& ClanManagerName, const struct FString& Message);
	bool sfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool sfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool sfAckRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& InviterMsg, const struct FString& ClanName, unsigned char Permit);
	bool sfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool sfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool sfReqInviteClan(const struct FString& CharName, const struct FString& InviteMsg);
	bool sfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool sfReqClanInfo(const struct FString& ClanName);
	bool sfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool sfReqCreateClan(const struct FString& ClanName, const struct FString& ClanURL, const struct FString& ClanIntro, const struct FString& ClanKeyword, unsigned char ClanRegion);
	bool sfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool sfReqDupCheckClanName(const struct FString& ClanNam);
	bool sfAckSellShopItemInfo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool sfReqSellShopItemInfo(const struct FBtrDouble& UniqueItemID, int Count);
	bool sfAckGameOverEnd(int Result, const struct FString& ErrMsg);
	bool sfReqGameOverEnd();
	bool sfAckAuctionItemListCount(int Result, const struct FString& ErrMsg, unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade, int Count);
	bool sfReqAuctionItemListCount(unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade);
	bool sfAckServerTime(int Time);
	bool sfReqServerTime();
	bool sfAckEntryQSlotIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<int> TWItemID1, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID);
	bool sfReqEntryQSlotIDList(int UserNum);
	bool sfAckEntryQSlotUniqueIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<struct FBtrDouble> PistolUniqueID, TArray<struct FBtrDouble> TW1UniqueID, TArray<struct FBtrDouble> TW2UniqueID);
	bool sfReqEntryQSlotUniqueIDList(int UserNum);
	bool sfAckAuctionBidding(int Result, const struct FString& ErrMsg, int PointRemain);
	bool sfReqAuctionBidding(int UniqueID, int BiddingPrice);
	bool sfAckAuctionInstantlyBuying(int Result, const struct FString& ErrMsg, int PointRemain);
	bool sfReqAuctionInstantlyBuying(int UniqueID);
	bool sfAckAuctionItemListEnd(unsigned char Section);
	bool sfAckAuctionItemList(unsigned char Section, TArray<int> UniqueIDs, TArray<int> ItemIDs, TArray<int> AddPartsIDs, TArray<struct FBtrDouble> UntilTimes, TArray<int> BiddingPrices, TArray<int> InstantlyByuingPrices, TArray<int> ItemDamageds, TArray<struct FString> HighestBidderNames, TArray<struct FString> SellerNames, TArray<int> ItemCount);
	bool sfAckAuctionItemListStart(int Result, const struct FString& ErrMsg, unsigned char Section, int PageNum, int Count);
	bool sfReqAuctionItemList(unsigned char Section, const struct FString& Keyword, int ItemRank, unsigned char ItemClassfy, unsigned char IsAvailable, int PageNum, int Count, int SortOpt);
	bool sfAckAuctionMyItemCancel(int Result, const struct FString& ErrMsg);
	bool sfReqAuctionMyItemCancel(int UniqueID);
	bool sfAckAuctionMyItemRegister(int Result, const struct FString& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool sfReqAuctionMyItemRegister(const struct FBtrDouble& UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice);
	bool sfAckMyMoney(int Result, const struct FString& ErrMsg, int Point, int Cash);
	bool sfReqMyMoney();
	bool sfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool sfReqUpdateQSlot(int QSlotID, const struct FString& QSlotName, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4);
	bool sfAckQSlotList(int Result, const struct FString& ErrMsg, TArray<int> QSlotID, TArray<struct FString> QSlotName, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWItemID, TArray<struct FBtrDouble> PistolItemID, TArray<struct FBtrDouble> TWItemID1, TArray<struct FBtrDouble> TWItemID2, TArray<int> Skill1, TArray<int> Skill2, TArray<int> Skill3, TArray<int> Skill4);
	bool sfReqQSlotList();
	bool sfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool sfReqRepairItem(TArray<struct FBtrDouble> UniqueItemID);
	bool sfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool sfReqRepairCost(TArray<struct FBtrDouble> UniqueItemID);
	bool sfAckUpdateWeaponDurability(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> Durability, TArray<unsigned char> IsDestroy, TArray<struct FBtrDouble> FailedWeaponUniqueID);
	bool sfReqUpdateWeaponDurability(int TotalPlayTime, TArray<int> OwnerID, TArray<int> Number, TArray<struct FBtrDouble> UniqueItemID, TArray<int> UsingSec, TArray<int> UsingRoundInSD);
	bool sfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool sfReqModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool sfAckSellShopItem(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool sfReqSellShopItem(const struct FBtrDouble& ItemUniqueID, int Count);
	bool sfAckBuyShopItem(int ItemCount, TArray<int> Result, TArray<int> BoughtItemTypeID, TArray<struct FBtrDouble> BoughtItemUniqueID, TArray<int> BoughtPartID, TArray<struct FBtrDouble> BoughtUntilTIme, TArray<int> BoughtStackCnt, int PointRemain, int CashRemain);
	bool sfReqBuyShopItem(int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char BuyOption1, unsigned char BuyOption2);
	bool sfAckShopItemListEnd();
	bool sfAckShopItemList(TArray<int> ItemID);
	bool sfAckShopItemListStart(int Count);
	bool sfReqShopItemList();
	bool sfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool sfReqForceGameOver();
	bool sfAckGiveSkill(int SkillID, int Result, const struct FString& ErrMsg);
	bool sfReqGiveSkill();
	bool sfAckNotifyExpiredItemIDs(int UserID, TArray<struct FBtrDouble> ExpiredItemUniqueIDs, TArray<int> ExpiredItemIDs, TArray<int> ExpiredItemPartIDs, TArray<unsigned char> ExpiredItemSlotPos, int Result, const struct FString& ErrMsg);
	bool sfReqNotifyExpiredItemIDs();
	bool sfAckNotifyExpiredSkillIDs(int UserID, TArray<struct FBtrDouble> ExpiredSkillUniqueIDs, TArray<int> ExpiredSkillIDs, int Result, const struct FString& ErrMsg, TArray<unsigned char> ExpiredSkillSlotPositions);
	bool sfReqNotifyExpiredSkillIDs();
	bool sfAckNotifyChangedSkillState(int UserID, TArray<int> SkillIDs, TArray<unsigned char> NewStates, int Result, const struct FString& ErrMsg);
	bool sfReqNotifyChangedSkillState();
	bool sfAckNotifyChangedItemState(int UserID, TArray<int> ItemIDs, TArray<unsigned char> NewStates, int Result, const struct FString& ErrMsg);
	bool sfReqNotifyChangedItemState();
	bool sfAckConfirmSkillChanged(int Result, const struct FString& ErrMsg);
	bool sfReqConfirmSkillChanged();
	bool sfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool sfReqEquipSkill(int SkillID, int SkillUniqueID, unsigned char NewSlotPosition);
	bool sfAckUserSkillListEnd();
	bool sfAckUserSkillList(TArray<int> UniqueSkillID, TArray<int> SkillID, TArray<struct FBtrDouble> UntilTime, TArray<unsigned char> SlotPosition);
	bool sfAckUserSkillListStart(int Count, int Result, const struct FString& ErrMsg);
	bool sfReqUserSkillList(int UserID);
	bool sfAckDelMemo(int Result, const struct FString& ErrMsg, TArray<int> FailedMemoID);
	bool sfReqDelMemo(TArray<int> MemoIdx, unsigned char Type);
	bool sfAckReadMemo(const struct FString& cnameFrom, const struct FString& Text, const struct FString& dateRecv, const struct FBtrDouble& ItemUID);
	bool sfReqReadMemo(int MemoIdx);
	bool sfAckEndMemoList();
	bool sfAckMemoList(TArray<int> MemoIdx, TArray<struct FString> cnameFrom, TArray<struct FString> dateRecv, TArray<struct FString> Text, TArray<unsigned char> Status, TArray<int> UntilExpire, TArray<struct FBtrDouble> ItemUID, TArray<int> ItemID, TArray<unsigned char> MsgType, TArray<int> ItemPartID);
	bool sfAckStartMemoList(int Result, const struct FString& ErrMsg, unsigned char Type, int TotalCount);
	bool sfReqMemoList(unsigned char Type, unsigned char MemoType);
	bool sfReqRecvMemo(const struct FString& cnameFrom, unsigned char MemoType);
	bool sfAckSendMemo(TArray<struct FString> CnamesToFail, TArray<int> ResultArray);
	bool sfReqSendMemo(TArray<struct FString> cnames, const struct FString& Msg, int ItemUID);
	bool sfReqRecvChatWispher(const struct FString& CharnameFrom, const struct FString& Message);
	bool sfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool sfReqChatWispher(const struct FString& CharName, const struct FString& Message);
	bool sfAckRemoveBlockUserList(int Result, const struct FString& ErrMsg);
	bool sfReqRemoveBlockUserList(const struct FString& CharName);
	bool sfAckAddBlockUserList(int Result, const struct FString& ErrMsg);
	bool sfReqAddBlockUserList(const struct FString& CharName);
	bool sfAckBlockUserListEnd();
	bool sfAckBlockUserList(TArray<struct FString> CharName);
	bool sfAckBlockUserListStart(int Result, int TotalCount);
	bool sfReqBlockUserList();
	bool sfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool sfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool sfReqConfirmFriendInvite(int ReqUserID, const struct FString& ReqedCharname, unsigned char IsPermit);
	bool sfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool sfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool sfReqSendFriendInvite(int InviteUserID, const struct FString& InviteName, const struct FString& InviteMsg);
	bool sfAckChatNormal(int id, const struct FString& Sender, const struct FString& Message, int Result);
	bool sfReqChatNormal(const struct FString& Message);
	bool sfAckDummy(int Result);
	bool sfReqDummy(int DelayCheck);
	bool sfAckConfirmItemChanged(int Result, const struct FString& ErrMsg);
	bool sfReqConfirmItemChanged();
	bool sfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool sfReqEquipItem(int ItemID, const struct FBtrDouble& UniqueID, int SlotPosition);
	bool sfAckItemListEnd();
	bool sfAckItemList(TArray<struct FBtrDouble> UniqueID, TArray<int> ItemID, TArray<int> ItemType, TArray<int> Durability, TArray<struct FBtrDouble> UntilTime, TArray<int> SlotPosition, TArray<int> AddPartsID, TArray<int> DamageDegree, TArray<unsigned char> ItemState, TArray<int> StackCount, TArray<int> PaintID, TArray<int> TradeCount);
	bool sfAckItemListStart(int Count, int Result, const struct FString& ErrMsg);
	bool sfReqItemList(int UID);
	bool sfAckEntrySkillList(TArray<int> UserIDs, TArray<int> SkillIDs, TArray<int> SlotPositions, int Result, const struct FString& ErrMsg);
	bool sfReqEntrySkillList(int UserID);
	bool sfAckEntryItemList(TArray<int> UserIDs, TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<struct FBtrDouble> UniqueID, TArray<int> PaintID, int Result, const struct FString& ErrMsg);
	bool sfReqEntryItemList(int UserID);
	bool sfAckChangeUserState(int Result, const struct FString& ErrMsg, TArray<int> UserIDs, TArray<unsigned char> Positions, TArray<int> Numbers, TArray<unsigned char> OldStates, TArray<unsigned char> NewStates);
	bool sfReqChangeUserState(unsigned char NewState, unsigned char CheckPlaying);
	bool sfAckExteriorRoomState();
	bool sfReqExteriorRoomState(int RoomNumber, unsigned char RoomState);
	bool sfAckExteriorRoomUserCount();
	bool sfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool sfAckExteriorRoomInfo();
	bool sfReqExteriorRoomInfo(int SP, int RoomNumber, unsigned char IsPW, const struct FString& RoomName, const struct FString& MapName, const struct FString& ModeName, int MapNum, int ModeNum, unsigned char IsTeamBalance, int MaxUserCount, int RoomUserCount, unsigned char RoomState, unsigned char BotDifficult, unsigned char WeaponLimit, unsigned char BotModeUserTeamNum);
	bool sfAckGetBootyChoose(int Result, const struct FString& ErrMsg, unsigned char GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, unsigned char ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool sfAckGetBooty(int Result, const struct FString& ErrMsg, TArray<int> PrizeWinUserID, TArray<int> BootyItemID, TArray<int> BootyPartsID);
	bool sfReqGetBooty(int RoomNumber);
	bool sfAckSetUserBootySeedValue(int UserID, int Result, const struct FString& ErrMsg);
	bool sfReqSetUserBootySeedValue(int UserID, int SeedValue);
	bool sfAckChangeRoomSetting(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool sfReqChangeRoomSetting(const struct FGameRoomInfo& RoomInfo);
	bool sfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, TArray<int> ItemID, TArray<int> PartID);
	bool sfAckClientUdpInfoList(int Result, const struct FString& ErrMsg, TArray<int> UID, TArray<struct FString> IP, TArray<int> Port);
	bool sfReqClientUdpInfoList(int GameNum);
	bool sfAckRegisterOtherUdpInfo(int UID, const struct FString& IP, int Port, unsigned char NatType, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool sfAckRegisterMyUdpInfo(int Result, const struct FString& ErrMsg);
	bool sfReqRegisterMyUdpInfo(unsigned char IsHost, const struct FString& IP, int Port, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool sfAckNotifyClientJoinTime(int Result, const struct FString& ErrMsg);
	bool sfReqNotifyClientJoinTime(int JoinedClientID);
	bool sfAckChangeNewGuest(const struct FString& HostIP);
	bool sfAckChangeHost(unsigned char ClientNum);
	bool sfAckDisconnectGame(int Result, int DisconnectUserID, const struct FString& DisconnectUserName);
	bool sfReqDisconnectGame();
	bool sfAckConnectGame(int UserID, int Result);
	bool sfReqConnectGame();
	bool sfReqRelayServerOff();
	bool sfReqRelayServerOn(const struct FString& RelayServerIP, int RelayServerPortNum);
	bool sfAckGameOver(int UID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool sfReqGameOver(int UID, int GameRoomNumber);
	bool sfAckIsGameRoomPlaying(int GameRoomNum, unsigned char IsPlaying);
	bool sfReqIsGameRoomPlaying(int GameRoomNum);
	bool sfAckGameRoomDestroy(int GameRoomNum);
	bool sfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, const struct FString& ErrMsg);
	bool sfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum);
	bool sfAckUpdateScoreResult(int Result, const struct FString& ErrMsg);
	bool sfAckUpdateScore(TArray<int> UserIDs, TArray<struct FString> NickNames, TArray<unsigned char> TeamIDs, TArray<int> Scores, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> EXPBonuses, TArray<int> Points, TArray<int> PointBonuses, TArray<int> TeamScores, TArray<int> BonusOwnerID, TArray<int> BonusID);
	bool sfReqUpdateScore(int GameNumber, TArray<int> UserIDs, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> Points, TArray<int> Scores, TArray<int> TeamScores, TArray<int> RoundJoin, TArray<int> TimeJoin, int Playtime, unsigned char GameEndType, TArray<struct FString> UserNames, unsigned char IsAIClear);
	bool sfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const struct FString& ErrMsg);
	bool sfReqStartGame(int GameNumber);
	bool sfAckGameHostInfo(int GameNumber, const struct FString& UserID, const struct FString& IP, int Port, int Result, const struct FString& ErrMsg);
	bool sfReqGameHostInfo(int GameNumber);
	bool sfAckIsHostAvailable(int Result);
	bool sfReqIsHostAvailable(const struct FString& MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam);
	bool sfAckChangeTeam(int GameNumber, const struct FString& UserID, int UID, int TeamNum, int Result, const struct FString& ErrMsg);
	bool sfReqChangeTeam(int TeamNum);
	bool sfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const struct FString& ErrMsg);
	bool sfReqChangeRoomOwner(int GameNum, int UID, int NewOwner);
	bool sfAckChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum, int Result, const struct FString& ErrMsg);
	bool sfReqChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum);
	bool sfAckBanUser(int GameNum, int UID, int BanUID, int Result, const struct FString& ErrMsg);
	bool sfReqBanUser(int GameNum, int UID, int BanUID);
	bool sfAckSelectMap(int GameNum, int UID, const struct FString& MapName, int Result, const struct FString& ErrMsg);
	bool sfReqSelectMap(int GameNum, int UID, const struct FString& MapName);
	bool sfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool sfReqGameRoomInfo(int GameNum, int UID);
	bool sfAckCreateGameRoom(int Result, const struct FString& ErrMsg, int UserID, const struct FString& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool sfReqCreateGameRoom(const struct FGameRoomInfo& NetRoomInfo);
	bool sfAckExceedMaxUser();
	bool sfAckLeaveRoom(int Num, int UID, const struct FString& UserID, int Result, const struct FString& ErrMsg);
	bool sfReqLeaveRoom(int Num);
	bool sfAckRoomUserList(TArray<int> UID, TArray<struct FString> UserName, TArray<int> Grade, TArray<int> TeamNum, TArray<unsigned char> Statue, TArray<unsigned char> IsHost, TArray<struct FString> UserIP, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<unsigned char> IsLookingFor, TArray<int> GMUID, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool sfReqRoomUserList(int GameNum);
	bool sfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqEnterRoom(int GameNum, const struct FString& Password, unsigned char RoomEnterType);
	bool sfAckRoomListEnd();
	bool sfAckRoomList(TArray<int> GameNum, TArray<struct FString> Title, TArray<struct FString> MapName, TArray<int> MapNum, TArray<unsigned char> UserCount, TArray<unsigned char> MaxCount, TArray<struct FString> ModeName, TArray<int> ModeNum, TArray<unsigned char> WeaponLimit, TArray<unsigned char> IsTeamBalance, TArray<unsigned char> Status, TArray<struct FString> RoomOwnerIP, TArray<int> GameMinute, TArray<struct FString> RoomOwnerName, TArray<unsigned char> IsSpecial, TArray<unsigned char> IsPassword, TArray<unsigned char> BotDifficult, TArray<unsigned char> BotModeUserTeamNum);
	bool sfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool sfReqRoomList(int id, int StartIndex, int Count);
	bool sfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool sfReqChannelUserList(int id, int StartIndex, int Count);
	bool sfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool sfReqLeaveChannel(int id);
	bool sfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqEnterChannel(int id);
	bool sfAckChannelList(TArray<int> id, TArray<struct FString> Title, TArray<int> CurUser, TArray<int> MaxUser);
	bool sfReqChannelList(int bChannelType);
	bool sfAckFriendListEnd();
	bool sfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool sfAckFriendListStart(int Result, int TotalCount);
	bool sfReqFriendList();
	bool sfAckCharInfo(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, unsigned char InClanRank, int ClanLevel);
	bool sfReqCharInfo();
	bool sfAckLogin2(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, unsigned char IsGM);
	bool sfReqLogin2(const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, const struct FString& Guid, int UserType);
	bool sfAckStartNatDiag(int NatType);
	bool sfReqStartNatDiag(const struct FString& Server1Addr, int Server1Port, const struct FString& Server2Addr, int Server2Port);
	bool sfReqForceLogoutByOwner();
	bool sfAckLogin(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, const struct FCharInfo& btCharInfo);
	bool sfReqLogin(const struct FString& id);
	bool sfAckHash(int Result, const struct FString& ErrMsg);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfAckUseItemDuringGame(int ErrorCode, const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfReqUseItemDuringGame(const struct FString& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char UsingCount);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char ChangeCount, int RemainCount);
	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfReqLuckShop_RewardCoupon(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfReqLuckShop_RewardBuyingCount(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfReqLuckShop_StorageInfo();
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, unsigned char IsNotification, TArray<struct FString> NickName, TArray<struct FBtrDouble> Time, int GetItemID);
	bool rfReqLuckShop_LotteryWinnerList(int CapsuleItemID);
	bool rfAckSpecialQuestRank(TArray<struct FString> CharList);
	bool rfReqSpecialQuestRank();
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, unsigned char RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfReqReceiveSpecialReward(int QuestID);
	bool rfAckDailyRewardListThisMonth(TArray<unsigned char> Type, TArray<unsigned char> Number, TArray<int> ItemID, TArray<int> ItemCount);
	bool rfReqDailyRewardListThisMonth();
	bool rfAckPuzzleList(int Result, unsigned char IsComplete, TArray<unsigned char> UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfReqPuzzleList(unsigned char ReqType, unsigned char UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool rfAckAttendanceList(int Result, unsigned char IsComplete, unsigned char UpdatedNum, TArray<unsigned char> StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfReqAttendanceList(unsigned char ReqType, unsigned char UpdateNum, unsigned char UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool rfAckAIRewardResult(unsigned char ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, TArray<int> ScoreRewardUserID, TArray<unsigned char> ScoreRewardTYPE, TArray<int> ScoreRewardID, TArray<int> ScoreRewardCount);
	bool rfNotifyCouponUseError(int Time);
	bool rfAckCouponUse(int Result, const struct FString& ErrMsg);
	bool rfReqCouponUse(const struct FString& Serial);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfReqNotifyShopItemData(TArray<int> ProductNo, TArray<struct FString> ProductName, TArray<int> ProductCode, TArray<unsigned char> SaleType, TArray<int> ProductCost, TArray<int> ProductHour, TArray<int> ProductQuantity, TArray<int> SaleMasterFlag, TArray<int> SaleStatus, TArray<int> IsGift, TArray<struct FBtrDouble> SaleEndTime, TArray<int> Discountcost);
	bool rfAckShopItemData();
	bool rfReqShopItemData(int Ver);
	bool rfReqNotifyLoadingStatus(int Status);
	bool rfReqUpdateUserPerformenceInfo(int UserID, int MinFps, int MaxFps, int AvgFps, int MinPing, int MaxPing, int AvgPing);
	bool rfReqAhnNotifyDisconnct(int Code);
	bool rfAckAhnHsObject(TArray<unsigned char> Data, int DataSize);
	bool rfReqAhnHsObject(TArray<unsigned char> Data, int DataSize);
	bool rfNotifyClanLevelup(const struct FString& ClanName, int Levelup);
	bool rfNotifyNewClanName(const struct FString& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const struct FString& Old_NickName, const struct FString& New_NickName);
	bool rfAckGameMapData(TArray<int> nIdx, TArray<int> nMapID, TArray<struct FString> nMapNm, TArray<float> fSupHealth, TArray<float> fSupHeli, TArray<float> fSupBomb, TArray<float> fSupUAV, TArray<int> nModFFA, TArray<int> nModFFAMax, TArray<int> nModTDM, TArray<int> nModTDMMax, TArray<int> nModSD, TArray<int> nModSDMax, TArray<int> nModDOM, TArray<int> nModDOMMax, TArray<int> nModSab, TArray<int> nModSabMax);
	bool rfReqGameMapData();
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(unsigned char MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfReqSetClientVersion(int ClientVersion);
	bool rfAckFriendPosition(int Result, const struct FString& TargetCharName, unsigned char ServerType, const struct FString& fServername, const struct FString& fServerShortName, const struct FString& fServerIP, int fServerPort, unsigned char CurPos, unsigned char CurState, int ChannelNum, const struct FString& ChannelNickName, int GameRoomNum);
	bool rfReqFriendPosition(const struct FString& TargetCharName, unsigned char CommunityType);
	bool rfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum);
	bool rfReqDedicateHost_Login(int ProcessID, int ChannelNum, int RoomNum);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfReqLogOut(unsigned char Reason);
	bool rfAckTencent_AASInfo(int UserID, unsigned char IsAdult, unsigned char IsQQAuth, int AccumTimeSec);
	bool rfAckSetCommunityOption(int Result, const struct FString& ErrStr);
	bool rfReqSetCommunityOption(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfReqCommunityOptionList();
	bool rfAckNotifyUpdateCharInfo_TitleMark(const struct FString& CharName, int TitleMarkID);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const struct FString& CharName, int LevelMarkID);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, unsigned char RankingType, unsigned char CommunityType, TArray<struct FString> CharName, TArray<int> CharLevel, TArray<struct FString> ClanName, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Ranking_Accum, TArray<int> Ranking_Accum_Prev, TArray<int> Ranking_Accum_Exp, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, unsigned char RankingType, unsigned char CommunityType, int TotalCount);
	bool rfReqGetRankingInfoList(unsigned char RankingType, unsigned char CommunityType);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfReqCharDetailInfo();
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckClanMatchResultHistory(TArray<struct FBtrDouble> MatchDate, TArray<unsigned char> IsWin, TArray<struct FString> EnemyClanname);
	bool rfReqClanMatchResultHistory(const struct FString& ClanNm);
	bool rfAckDeleteMailAll(int Result, unsigned char MailType, int Count);
	bool rfReqDeleteMailAll(unsigned char MailType);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const struct FString& RoomName, int MapNum, int CurUserCount, int MaxUserCount, unsigned char Status, unsigned char IsPublic);
	bool rfAckEventNotify(int Type);
	bool rfReqEventNotify();
	bool rfAckPaidItem_NotifyChangeClanname(const struct FString& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewClanname);
	bool rfReqPaidItem_ChangeClanname(const struct FBtrDouble& ItemIdx, const struct FString& NewClanname);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(TArray<int> WaitRoomIdx, TArray<struct FString> LeaderName, TArray<struct FString> RoomName, TArray<int> MapNum, TArray<int> CurUserCount, TArray<int> MaxUserCount, TArray<unsigned char> Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const struct FString& ErrMsg, int Count);
	bool rfReqClanMatch_GetPublicWaitRoomList();
	bool rfAckServerType(unsigned char Type);
	bool rfReqServerType();
	bool rfAckServerShutdown(int Result, const struct FString& ErrMsg);
	bool rfReqServerShutdown(const struct FString& AuthKey, int SecondAfter, const struct FBtrDouble& ShutdownTime);
	bool rfAckNotifyEndTutorial(int UserID, const struct FString& CharName, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqNotifyEndTutorial(int TutorialResultType);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfReqNotifyStartTutorial();
	bool rfAckRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostPriorityPoint);
	bool rfReqRoomUserPingInfo(TArray<int> UnqueID, TArray<int> Ping, int HostPriorityPoint);
	bool rfAckMyEquipedQSlotList(TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<struct FBtrDouble> PistolUniqueID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<struct FBtrDouble> TW1UniqueID, TArray<int> TWItemID1, TArray<struct FBtrDouble> TW2UniqueID, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID, int Result);
	bool rfReqMyEquipedQSlotList();
	bool rfAckMyEquipedSkillList(TArray<int> SkillIDs, TArray<int> SlotPositions, int Result);
	bool rfReqMyEquipedSkillList();
	bool rfAckMyEquipedItemList(TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<int> PaintID, TArray<struct FBtrDouble> UniqueID, int Result);
	bool rfReqMyEquipedItemList();
	bool rfAckGetMyMailBoxState(int Result, unsigned char IsFull, int NewMailCount);
	bool rfReqGetMyMailBoxState();
	bool rfAckSetLookForClan(int Result, const struct FString& ErrMsg, unsigned char IsLookingFor);
	bool rfReqSetLookForClan(unsigned char IsLookingFor);
	bool rfAckExteriorRoomOwnerInfo();
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const struct FString& OwnerName, const struct FString& OwnerIP);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const struct FString& ErrMsg, unsigned char Set);
	bool rfReqClanMatch_SetWaitRoomPublic(unsigned char Set);
	bool rfReqRemoveCheckTeamBalanceList();
	bool rfAckPaidItem_NotifyChangeClanMark(const struct FString& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfReqPaidItem_ChangeClanMark(const struct FBtrDouble& ItemIdx, unsigned char IsPaid, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const struct FString& ErrMsg);
	bool rfReqPaidItem_ClanMarkDupCheck(unsigned char IsPaid, int Pattern, int BG, int BL);
	bool rfAckPaidItem_RelayBroadcast(const struct FString& CharName, const struct FString& Msg);
	bool rfAckPaidItem_BroadCast(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfReqPaidItem_BroadCast(const struct FBtrDouble& ItemIdx, int Command, const struct FString& Message);
	bool rfAckPaidItem_EraseRecord(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfReqPaidItem_EraseRecord(const struct FBtrDouble& ItemIdx, int Command);
	bool rfAckPaidItem_ChangeCharname(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const struct FString& NewCharname);
	bool rfReqPaidItem_ChangeCharname(const struct FBtrDouble& ItemIdx, const struct FString& NewCharname);
	bool rfAckRecvSystemMsg(unsigned char CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckSendSystemMsg(int Result);
	bool rfReqSendSystemMsg(unsigned char RecvType, const struct FString& SendCharName, const struct FString& RecvCharname, const struct FSystemMsgParam& MsgInfo);
	bool rfAckRandomBox_Use(int Result, const struct FString& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, TArray<int> ItemIDChoose, TArray<int> PartIDChoose, TArray<int> PeriodOnChoosenItem, TArray<int> StackCountOnChoosenItem, TArray<unsigned char> bHave, TArray<struct FBtrDouble> ItemIdx, TArray<struct FBtrDouble> UntilTime, TArray<int> StackCount);
	bool rfReqRandomBox_Use(const struct FBtrDouble& ItemIdx_RandomBox, const struct FBtrDouble& ItemIdx_Key);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const struct FString& NewRoomTitle);
	bool rfReqChangeRoomTitle_GM(int RoomNumber, const struct FString& NewRoomTitle);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckQuestGetAvailableEventList(int Result, const struct FString& ErrMsg, TArray<int> QuestID);
	bool rfReqQuestGetAvailableEventList();
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, TArray<struct FBtrDouble> BlockedItemIdx);
	bool rfReqCharBlockInfo();
	bool rfReqIsPaidWebzenPCBang(unsigned char IsPaid);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, const struct FString& WaitRoomName);
	bool rfReqClanMatch_GetClanWaittingRoomInfo();
	bool rfAckReturnBotID(int Result);
	bool rfReqReturnBotID(TArray<int> BotID);
	bool rfAckGetBotID(int Result, unsigned char RequestedAFCount, unsigned char RequestedRSACount, TArray<int> AFBotID, TArray<int> RSABotID);
	bool rfReqGetBotID(unsigned char AFCount, unsigned char RSACount);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const struct FString& ErrMsg, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool rfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, TArray<int> MapNumArray, int VersusMode, unsigned char IsPublic);
	bool rfAckParamCheckSum(int Result);
	bool rfReqParamCheckSum(const struct FString& key, const struct FString& Value);
	bool rfAckWebzenBillingUseStorageItem(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, unsigned char StorageItemType);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(TArray<int> Seq, TArray<int> ItemSeq, TArray<int> GroupCode, TArray<int> ShareFlag, TArray<int> ProductSeq, TArray<struct FString> CashName, TArray<struct FBtrDouble> CashPoint, TArray<struct FString> SendAccountID, TArray<struct FString> SendMessage, TArray<unsigned char> ItemType, TArray<unsigned char> RelationType, TArray<int> ProductType, TArray<int> PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const struct FString& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfReqWebzenBillingStorageList(int Page, int CountForPage, unsigned char Type);
	bool rfAckGiftItemByWebzenCash(int Result, const struct FString& ErrMsg, int LeftProductCount);
	bool rfReqGiftItemByWebzenCash(const struct FString& ReceiverCharName, const struct FString& Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq);
	bool rfReqGiftItemByWebzenCashGP20(const struct FString& ReceiverCharName, const struct FString& Message, int ProductNo, unsigned char Cointype);
	bool rfAckBuyItemByWebzenCash(int Result, const struct FString& ErrMsg);
	bool rfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, TArray<int> ItemIDs, const struct FBtrDouble& ItemUniqueID, unsigned char BuyOption1, unsigned char BuyOption2);
	bool rfReqBuyItemByWebzenCashGP20(int ProductNo, unsigned char Cointype, const struct FBtrDouble& ItemID);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfReqWebzenShopScriptVersion();
	bool rfAckWebzenCash(int Result, const struct FString& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfReqWebzenCash();
	bool rfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool rfReqRegisteredPCBangInfo();
	bool rfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool rfReqRegisterMainPCBang();
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(TArray<struct FString> FriendName, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, TArray<unsigned char> IsCombat, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfReqPCBangUserList();
	bool rfReqDailyQuestNewAvailable(TArray<int> ExpiredQuestID, TArray<int> NewQuestID);
	bool rfReqQuestNewAvailable(TArray<int> AchivedQuestID, TArray<int> NewQuestID, TArray<unsigned char> IsDailyQuest, TArray<int> ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const struct FString& ErrMsg);
	bool rfReqQuestUpdate(int UniqueID, int GameRoomNum, TArray<int> QuestID, TArray<int> CountPrograss);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(TArray<int> QuestID, TArray<int> CountPrograss, TArray<unsigned char> QuestType, TArray<unsigned char> IsComplete);
	bool rfAckQuestListStart(int Result, const struct FString& ErrMsg);
	bool rfReqQuestList();
	bool rfAckPermanentRoomInfo(int Result, int ClanIdx, unsigned char FixedGameMode, unsigned char FixedMaxUserCnt);
	bool rfReqPermanentRoomInfo(int RoomNum);
	bool rfAckClanMatch_FoundMatch();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const struct FString& ErrMsg, int ShouldWaitMore);
	bool rfReqClanMatch_StartSearching(int RequestCount);
	bool rfAckLimitedListInChannel(int Result, TArray<int> LimitedMapID, TArray<int> LimitedModeID);
	bool rfReqLimitedListInChannel();
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfAckRecvInviteGameRoom(const struct FString& RoomUniqueID, int RoomNumber, unsigned char Answer, const struct FString& InviteCharName);
	bool rfReqRecvInviteGameRoom(const struct FString& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const struct FString& RoomUniqueID, int RoomNumber, const struct FString& RoomName, unsigned char RoomState, const struct FString& MapName, const struct FString& OwnerName, unsigned char GameMode, unsigned char WeaponLimit, unsigned char IsTeamBalance, const struct FString& Password, const struct FString& InviteCharName);
	bool rfAckInviteGameRoom(int Result, unsigned char Answer, const struct FString& GuestCharName);
	bool rfReqInviteGameRoom(const struct FString& GuestCharName);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_StopSearching();
	bool rfAckClanMatch_ChangeLeader(int Result, const struct FString& ErrMsg, int NewLeader, const struct FString& NewLeaderName);
	bool rfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, const struct FString& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, TArray<int> Grade, TArray<int> Map, TArray<int> Versus);
	bool rfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount);
	bool rfAckClanMatch_Chat(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& Msg);
	bool rfReqClanMatch_Chat(const struct FString& Msg);
	bool rfAckClanMatch_LeaveNotify(const struct FString& CharName);
	bool rfAckClanMatch_Leave(int Result, const struct FString& ErrMsg);
	bool rfReqClanMatch_Leave(int WaittingID);
	bool rfAckClanMatch_MemberList(TArray<unsigned char> IsLeader, TArray<int> ClanMarkPA, TArray<int> ClanMarkBG, TArray<int> ClanMarkBL, TArray<int> Level, TArray<struct FString> CharName, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<struct FString> ClanName, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfReqClanMatch_MemberList();
	bool rfAckClanMatch_JoinNotify(unsigned char IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const struct FString& CharName, int ClanGrade, int ClanWin, int ClanLose, const struct FString& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const struct FString& ErrMsg);
	bool rfReqClanMatch_Join(int WaittingID);
	bool rfReqClanMatch_InviteCrewResult(const struct FString& Invitee, int Result);
	bool rfAckClanMatch_RecvInviteCrew(int Result, const struct FString& Inviter);
	bool rfReqClanMatch_RecvInviteCrew(const struct FString& Inviter, const struct FString& ServerIP, int Port, int WaittingID, const struct FString& Msg, int MapNum, int InviteUserChannelNum, const struct FString& LeaderName, const struct FString& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const struct FString& ErrMsg);
	bool rfReqClanMatch_InviteCrew(const struct FString& Invitee);
	bool rfAckClanMatch_NotifiyStartCombat(TArray<int> MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const struct FString& ErrMsg);
	bool rfReqClanMatch_StartCombat(TArray<int> MapNumArray, int VersusMode);
	bool rfAckClanMatch_GetReady(int Result, const struct FString& ErrMsg, int RoomIndex);
	bool rfReqClanMatch_GetReady();
	bool rfAckAutoChangedTeamUserList(TArray<int> UserID, TArray<int> TeamNum);
	bool rfAckGetItemFromItemBox(int Result, const struct FString& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, unsigned char bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfReqGetItemFromItemBox(const struct FBtrDouble& ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool rfAckItemListInItemBox(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, TArray<int> ItemID, TArray<int> PartID, unsigned char FromContent);
	bool rfReqItemListInItemBox(const struct FBtrDouble& ItemUniqueID, int BoxItemID, unsigned char FromContent);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckForceFailedClientLoading(int Result, const struct FString& ErrMsg);
	bool rfReqForceFailedClientLoading(int FailedUserID, int ErrCode);
	bool rfAckStartHolePunching(int Result, const struct FString& ErrMsg, int GameType, int ReqStartUserID);
	bool rfReqStartHolePunching(int GameType, int ReqStartUserID);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const struct FString& ErrMsg, int UID, const struct FString& UserName, int Grade, int TeamNum, unsigned char Statue, unsigned char IsHost, const struct FString& UserIP, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, unsigned char IsLookFor);
	bool rfReqNotifyMyCharInfoToRoomUser();
	bool rfReqNotifyDurabilityZeroItem(int Result, const struct FString& ErrMsg, int UserID, TArray<struct FBtrDouble> ItemUniqueIDs, TArray<int> ItemIDs, TArray<int> ItemPartIDs, TArray<unsigned char> ItemSlotPos);
	bool rfAckChatWispherMyCommunity(int Result, const struct FString& ErrMsg);
	bool rfReqChatWispherMyCommunity(const struct FString& SourceCharName, const struct FString& SenderName, const struct FString& Msg);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const struct FString& ErrMsg, int HostID);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const struct FString& ErrMsg);
	bool rfAckForceDisconnectUser_GM(int Result, const struct FString& ErrMsg, const struct FString& CharName);
	bool rfReqForceDisconnectUser_GM(const struct FString& CharName);
	bool rfReqRecvNotice_FromGM(int Result, const struct FString& ErrMsg, TArray<struct FString> NoticeMsg, unsigned char IsFromDB);
	bool rfAckNotice_GM(int Result, const struct FString& ErrMsg, unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool rfReqNotice_GM(unsigned char NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const struct FString& Msg);
	bool rfAckSpecificChannelUserInfo(int UID, const struct FString& UserID, int UserLevels, const struct FString& ClanName, int ClanPattern, int ClanBG, int ClanBL, int Result, const struct FString& ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqSpecificChannelUserInfo(int UserID);
	bool rfAckSpecificGameRoomInfo(int Result, int GameNum, const struct FString& Title, const struct FString& MapName, int MapNum, unsigned char UserCount, unsigned char MaxCount, const struct FString& GameModeName, int ModeNum, unsigned char WeaponLimit, unsigned char IsHardCore, unsigned char Status, const struct FString& RoomOwnerIP, int GameMinute, const struct FString& RoomOwnerName, unsigned char IsSpecial, unsigned char IsPassword);
	bool rfReqSpecificGameRoomInfo(int RoomNum);
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> CharName, TArray<int> UserLevel, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<unsigned char> IsLookForClan, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count);
	bool rfReqRecvDeleteFriend(int Result, const struct FString& FromCharName);
	bool rfAckDeleteFriend(int Result, TArray<struct FString> FailedCharname);
	bool rfReqDeleteFriend(TArray<struct FString> DeleteCharName);
	bool rfAckGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool rfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool rfAckCheckEquipedWeaponDurability(int Result, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemSlotNum);
	bool rfReqCheckEquipedWeaponDurability();
	bool rfReqGamePlay_GetChopper(int GetChopperUID, TArray<int> GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, const struct FString& ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord);
	bool rfAckAcquirePromotionItems(int UID, int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> ItemUniqueID, TArray<int> ItemIDs, TArray<int> PartIDs);
	bool rfAckIsAvailClanURL(const struct FString& ClanURL, int Result, const struct FString& ErrMsg);
	bool rfReqIsAvailClanURL(const struct FString& ClanURL);
	bool rfAckGetIsHostBlocking(int Result, unsigned char Blocking);
	bool rfReqGetIsHostBlocking();
	bool rfAckNotifyHostBlocking(int Result, unsigned char Blocking);
	bool rfReqNotifyHostBlocking(unsigned char Blocking);
	bool rfAckGetHolePunchingResult(int Result, unsigned char Phrase, int InterventionUserID, unsigned char Intervention, TArray<int> FailedUserIDs);
	bool rfReqGetHolePunchingResult();
	bool rfReqNotifyRecvDummyForHolePunching(int ClientUserID, unsigned char Phrase);
	bool rfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber);
	bool rfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore);
	bool rfReqNotifyRelayServerAddr(const struct FString& RelayIP, int RelayPort);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqGetUserHostPriorityPoint(int UserID);
	bool rfReqUpdateMyHostPriorityPoint(int HostPriorityPoint);
	bool rfReqWriteServerLog(unsigned char Destination, const struct FString& LogMsg);
	bool rfReqGamePlay_SetRoundStartTime(TArray<int> UID);
	bool rfReqGamePlay_SetGameStartTime(TArray<int> UID);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqForceDisconnectUDPFromHost(int UserID);
	bool rfReqGamePlay_TakeAPoint(TArray<int> TakerUID, unsigned char TakePos, TArray<float> TakerXCoord, TArray<float> TakerYCoord, TArray<float> TakerZCoord, TArray<int> TakerPos, TArray<int> TakerWeaponID, TArray<int> TakerWeaponPartID, TArray<int> TakerRange);
	bool rfReqNotifyChangeRoomState(unsigned char RoomState);
	bool rfReqGamePlay_DefuseBomb(int DefuserUID, unsigned char DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange);
	bool rfReqGamePlay_InstallBomb(int InstallerUID, unsigned char InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange);
	bool rfAckDBCharInfo(int Result, const struct FString& ErrMsg, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FString& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfReqDBCharInfo(const struct FString& CharName);
	bool rfReqForceNatTypeSetting(int NatType);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const struct FString& ClientIP);
	bool rfReqGetServerTime();
	bool rfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, unsigned char VTeam, unsigned char VTeamAD, int AFScore, int RSAScore, int Round);
	bool rfReqLogGetScore(const struct FKillDeathLog& KillDeathLogParam, TArray<int> AssistUIDs, TArray<unsigned char> AssistScores);
	bool rfAckAuctionTradeHistory(int Result, const struct FString& ErrMsg, int ItemID, int PartID, TArray<struct FString> SellerCharNm, TArray<int> DamageDegree, TArray<int> Price);
	bool rfReqAuctionTradeHistory(int ItemID, int PartID);
	bool rfAckSendGift(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain);
	bool rfReqSendGift(int ItemID, const struct FString& RecvCharname, const struct FString& RecvMessage, unsigned char BuyOption1, unsigned char BuyOption2);
	bool rfAckGetAttachedItemFromMemo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID);
	bool rfAckNotifyNewClanMember(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckChatClan(const struct FString& CharName, const struct FString& Message, int Result);
	bool rfReqChatClan(const struct FString& Message);
	bool rfAckTestDouble(const struct FBtrDouble& vDouble, TArray<struct FBtrDouble> vDoubles);
	bool rfReqTestDouble(const struct FBtrDouble& vDouble, TArray<struct FBtrDouble> vDoubles);
	bool rfAckNotifyLoadingState(int Result, int UserID, unsigned char LoadingState);
	bool rfReqNotifyLoadingState(unsigned char LoadingState);
	bool rfAckFailedStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, int FailedUserID, int LoadingStep);
	bool rfReqFailedStartGame(int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const struct FString& ErrMsg, unsigned char IsHost, const struct FString& HostIP, int HostPort, int LoadingStep);
	bool rfReqSuccessStartGame(int LoadingStep);
	bool rfAckClanCharPersonelIntro(int Result, const struct FString& ErrMsg, const struct FString& PersonelIntro);
	bool rfReqClanCharPersonelIntro(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckClanPersonelIntro(int Result, const struct FString& ErrMsg);
	bool rfReqClanPersonelIntro(const struct FString& ClanName, const struct FString& CharName, const struct FString& PersonelIntro);
	bool rfAckClanChangeInfo(int Result, const struct FString& ErrMsg);
	bool rfReqClanChangeInfo(const struct FString& ClanName, unsigned char IsRecruit, unsigned char Region, const struct FString& Keyword, const struct FString& ClanIntro, const struct FString& Notice);
	bool rfAckClanClose(int Result, const struct FString& ErrMsg, const struct FString& ClanName);
	bool rfReqClanClose(const struct FString& ClanName);
	bool rfAckNotifyClanSecession(const struct FString& ClanName, const struct FString& CharName);
	bool rfAckClanSecession(int Result, const struct FString& ErrMsg);
	bool rfReqClanSecession(const struct FString& ClanName);
	bool rfAckClanNews(TArray<struct FString> IssueDate, TArray<unsigned char> IssueType, TArray<struct FString> IssuedClanMember);
	bool rfReqClanNews(const struct FString& ClanName);
	bool rfAckNotifyAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const struct FString& ErrMsg, const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfReqAdjustClanMemberGrade(const struct FString& ClanName, const struct FString& CharName, unsigned char CharGrade);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<int> ClanWinCnt, TArray<int> ClanLoseCnt, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfReqClanUserList(const struct FString& ClanName);
	bool rfAckSearchClan(int Result, const struct FString& ErrMsg, int TotalPage, TArray<int> ClanMarkPattern, TArray<int> ClanMarkBG, TArray<unsigned char> ClanMarkBL, TArray<struct FString> ClanName, TArray<struct FString> ClanMaster, TArray<int> ClanMember, TArray<int> ClanMemberMax, TArray<int> ClanCreateDate, TArray<int> ClanWin, TArray<int> ClanLose, TArray<int> ClanDraw, TArray<int> ClanRank, TArray<unsigned char> ClanRecruit, TArray<int> ClanLevel);
	bool rfReqSerachClan(unsigned char SearchType, const struct FString& Keyword, unsigned char ClanStatus, unsigned char ClanRegion, int ReqPage);
	bool rfAckJoinClanResult(const struct FString& ClanName, unsigned char Permit, const struct FString& PermitCharName);
	bool rfAckRecvJoinClanResult(int Result, const struct FString& ErrMsg);
	bool rfAckRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& ReqMsg, unsigned char Permit);
	bool rfReqRecvJoinClan(int UserIdx, const struct FString& CharName, const struct FString& Message);
	bool rfAckJoinClan(int Result, const struct FString& ErrMsg, const struct FString& SpecificCharName, const struct FString& RealRecvCharName, unsigned char RealRecvCharClanGrade);
	bool rfReqJoinClan(const struct FString& ClanName, const struct FString& ClanManagerName, const struct FString& Message);
	bool rfAckInviteClanResult(const struct FString& CharName, unsigned char Permit, const struct FString& ClanNm);
	bool rfAckRecvClanInviteResult(int Result, const struct FString& ErrMsg);
	bool rfAckRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& InviterMsg, const struct FString& ClanName, unsigned char Permit);
	bool rfReqRecvClanInvite(int InviterUserDBID, const struct FString& InviterCharname, const struct FString& ClanName, const struct FString& InviteMsg);
	bool rfAckInviteClan(int Result, const struct FString& ErrMsg);
	bool rfReqInviteClan(const struct FString& CharName, const struct FString& InviteMsg);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfReqClanInfo(const struct FString& ClanName);
	bool rfAckCreateClan(int Result, const struct FString& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfReqCreateClan(const struct FString& ClanName, const struct FString& ClanURL, const struct FString& ClanIntro, const struct FString& ClanKeyword, unsigned char ClanRegion);
	bool rfAckDupCheckClanName(int Result, const struct FString& ErrMsg);
	bool rfReqDupCheckClanName(const struct FString& ClanNam);
	bool rfAckSellShopItemInfo(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqSellShopItemInfo(const struct FBtrDouble& UniqueItemID, int Count);
	bool rfAckGameOverEnd(int Result, const struct FString& ErrMsg);
	bool rfReqGameOverEnd();
	bool rfAckAuctionItemListCount(int Result, const struct FString& ErrMsg, unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade, int Count);
	bool rfReqAuctionItemListCount(unsigned char Section, unsigned char Classfy, int ItemType, int ItemGrade);
	bool rfAckServerTime(int Time);
	bool rfReqServerTime();
	bool rfAckEntryQSlotIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<int> MWItemID, TArray<int> MWPartID, TArray<int> MWPaintID, TArray<int> PistolItemID, TArray<int> PistolPartID, TArray<int> PistolPaintID, TArray<int> TWItemID1, TArray<int> TWItemID2, TArray<int> Skill1ID, TArray<int> Skill2ID, TArray<int> Skill3ID, TArray<int> Skill4ID);
	bool rfReqEntryQSlotIDList(int UserNum);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWUniqueID, TArray<struct FBtrDouble> PistolUniqueID, TArray<struct FBtrDouble> TW1UniqueID, TArray<struct FBtrDouble> TW2UniqueID);
	bool rfReqEntryQSlotUniqueIDList(int UserNum);
	bool rfAckAuctionBidding(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfReqAuctionBidding(int UniqueID, int BiddingPrice);
	bool rfAckAuctionInstantlyBuying(int Result, const struct FString& ErrMsg, int PointRemain);
	bool rfReqAuctionInstantlyBuying(int UniqueID);
	bool rfAckAuctionItemListEnd(unsigned char Section);
	bool rfAckAuctionItemList(unsigned char Section, TArray<int> UniqueIDs, TArray<int> ItemIDs, TArray<int> AddPartsIDs, TArray<struct FBtrDouble> UntilTimes, TArray<int> BiddingPrices, TArray<int> InstantlyByuingPrices, TArray<int> ItemDamageds, TArray<struct FString> HighestBidderNames, TArray<struct FString> SellerNames, TArray<int> ItemCount);
	bool rfAckAuctionItemListStart(int Result, const struct FString& ErrMsg, unsigned char Section, int PageNum, int Count);
	bool rfReqAuctionItemList(unsigned char Section, const struct FString& Keyword, int ItemRank, unsigned char ItemClassfy, unsigned char IsAvailable, int PageNum, int Count, int SortOpt);
	bool rfAckAuctionMyItemCancel(int Result, const struct FString& ErrMsg);
	bool rfReqAuctionMyItemCancel(int UniqueID);
	bool rfAckAuctionMyItemRegister(int Result, const struct FString& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfReqAuctionMyItemRegister(const struct FBtrDouble& UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice);
	bool rfAckMyMoney(int Result, const struct FString& ErrMsg, int Point, int Cash);
	bool rfReqMyMoney();
	bool rfAckUpdateQSlot(int Result, const struct FString& ErrMsg);
	bool rfReqUpdateQSlot(int QSlotID, const struct FString& QSlotName, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4);
	bool rfAckQSlotList(int Result, const struct FString& ErrMsg, TArray<int> QSlotID, TArray<struct FString> QSlotName, TArray<unsigned char> QSlotDispOrder, TArray<struct FBtrDouble> MWItemID, TArray<struct FBtrDouble> PistolItemID, TArray<struct FBtrDouble> TWItemID1, TArray<struct FBtrDouble> TWItemID2, TArray<int> Skill1, TArray<int> Skill2, TArray<int> Skill3, TArray<int> Skill4);
	bool rfReqQSlotList();
	bool rfAckRepairItem(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, int RepairCost, TArray<int> DamageDegree);
	bool rfReqRepairItem(TArray<struct FBtrDouble> UniqueItemID);
	bool rfAckRepairCost(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> RepairCost);
	bool rfReqRepairCost(TArray<struct FBtrDouble> UniqueItemID);
	bool rfAckUpdateWeaponDurability(int Result, const struct FString& ErrMsg, TArray<struct FBtrDouble> UniqueItemID, TArray<int> Durability, TArray<unsigned char> IsDestroy, TArray<struct FBtrDouble> FailedWeaponUniqueID);
	bool rfReqUpdateWeaponDurability(int TotalPlayTime, TArray<int> OwnerID, TArray<int> Number, TArray<struct FBtrDouble> UniqueItemID, TArray<int> UsingSec, TArray<int> UsingRoundInSD);
	bool rfAckModifyWeapon(int Result, const struct FString& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfReqModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool rfAckSellShopItem(int Result, const struct FString& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfReqSellShopItem(const struct FBtrDouble& ItemUniqueID, int Count);
	bool rfAckBuyShopItem(int ItemCount, TArray<int> Result, TArray<int> BoughtItemTypeID, TArray<struct FBtrDouble> BoughtItemUniqueID, TArray<int> BoughtPartID, TArray<struct FBtrDouble> BoughtUntilTIme, TArray<int> BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfReqBuyShopItem(int ItemID, const struct FBtrDouble& ItemUniqueID, unsigned char BuyOption1, unsigned char BuyOption2);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(TArray<int> ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfReqShopItemList();
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfReqForceGameOver();
	bool rfAckGiveSkill(int SkillID, int Result, const struct FString& ErrMsg);
	bool rfReqGiveSkill();
	bool rfAckNotifyExpiredItemIDs(int UserID, TArray<struct FBtrDouble> ExpiredItemUniqueIDs, TArray<int> ExpiredItemIDs, TArray<int> ExpiredItemPartIDs, TArray<unsigned char> ExpiredItemSlotPos, int Result, const struct FString& ErrMsg);
	bool rfReqNotifyExpiredItemIDs();
	bool rfAckNotifyExpiredSkillIDs(int UserID, TArray<struct FBtrDouble> ExpiredSkillUniqueIDs, TArray<int> ExpiredSkillIDs, int Result, const struct FString& ErrMsg, TArray<unsigned char> ExpiredSkillSlotPositions);
	bool rfReqNotifyExpiredSkillIDs();
	bool rfAckNotifyChangedSkillState(int UserID, TArray<int> SkillIDs, TArray<unsigned char> NewStates, int Result, const struct FString& ErrMsg);
	bool rfReqNotifyChangedSkillState();
	bool rfAckNotifyChangedItemState(int UserID, TArray<int> ItemIDs, TArray<unsigned char> NewStates, int Result, const struct FString& ErrMsg);
	bool rfReqNotifyChangedItemState();
	bool rfAckConfirmSkillChanged(int Result, const struct FString& ErrMsg);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, unsigned char ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, unsigned char ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfReqEquipSkill(int SkillID, int SkillUniqueID, unsigned char NewSlotPosition);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(TArray<int> UniqueSkillID, TArray<int> SkillID, TArray<struct FBtrDouble> UntilTime, TArray<unsigned char> SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfReqUserSkillList(int UserID);
	bool rfAckDelMemo(int Result, const struct FString& ErrMsg, TArray<int> FailedMemoID);
	bool rfReqDelMemo(TArray<int> MemoIdx, unsigned char Type);
	bool rfAckReadMemo(const struct FString& cnameFrom, const struct FString& Text, const struct FString& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfReqReadMemo(int MemoIdx);
	bool rfAckEndMemoList();
	bool rfAckMemoList(TArray<int> MemoIdx, TArray<struct FString> cnameFrom, TArray<struct FString> dateRecv, TArray<struct FString> Text, TArray<unsigned char> Status, TArray<int> UntilExpire, TArray<struct FBtrDouble> ItemUID, TArray<int> ItemID, TArray<unsigned char> MsgType, TArray<int> ItemPartID);
	bool rfAckStartMemoList(int Result, const struct FString& ErrMsg, unsigned char Type, int TotalCount);
	bool rfReqMemoList(unsigned char Type, unsigned char MemoType);
	bool rfReqRecvMemo(const struct FString& cnameFrom, unsigned char MemoType);
	bool rfAckSendMemo(TArray<struct FString> CnamesToFail, TArray<int> ResultArray);
	bool rfReqSendMemo(TArray<struct FString> cnames, const struct FString& Msg, int ItemUID);
	bool rfReqRecvChatWispher(const struct FString& CharnameFrom, const struct FString& Message);
	bool rfAckChatWispher(int Result, const struct FString& ErrMsg, const struct FString& ToCharName);
	bool rfReqChatWispher(const struct FString& CharName, const struct FString& Message);
	bool rfAckRemoveBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfReqRemoveBlockUserList(const struct FString& CharName);
	bool rfAckAddBlockUserList(int Result, const struct FString& ErrMsg);
	bool rfReqAddBlockUserList(const struct FString& CharName);
	bool rfAckBlockUserListEnd();
	bool rfAckBlockUserList(TArray<struct FString> CharName);
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfReqBlockUserList();
	bool rfReqCompleteFriendInvite(const struct FString& CharnameToBeInvited, unsigned char IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqConfirmFriendInvite(int ReqUserID, const struct FString& ReqedCharname, unsigned char IsPermit);
	bool rfReqRecvFriendInvite(int ReqUserID, const struct FString& ReqCharname, const struct FString& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const struct FString& ErrMsg);
	bool rfReqSendFriendInvite(int InviteUserID, const struct FString& InviteName, const struct FString& InviteMsg);
	bool rfAckChatNormal(int id, const struct FString& Sender, const struct FString& Message, int Result);
	bool rfReqChatNormal(const struct FString& Message);
	bool rfAckDummy(int Result);
	bool rfReqDummy(int DelayCheck);
	bool rfAckConfirmItemChanged(int Result, const struct FString& ErrMsg);
	bool rfReqConfirmItemChanged();
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const struct FString& ErrMsg);
	bool rfReqEquipItem(int ItemID, const struct FBtrDouble& UniqueID, int SlotPosition);
	bool rfAckItemListEnd();
	bool rfAckItemList(TArray<struct FBtrDouble> UniqueID, TArray<int> ItemID, TArray<int> ItemType, TArray<int> Durability, TArray<struct FBtrDouble> UntilTime, TArray<int> SlotPosition, TArray<int> AddPartsID, TArray<int> DamageDegree, TArray<unsigned char> ItemState, TArray<int> StackCount, TArray<int> PaintID, TArray<int> TradeCount);
	bool rfAckItemListStart(int Count, int Result, const struct FString& ErrMsg);
	bool rfReqItemList(int UID);
	bool rfAckEntrySkillList(TArray<int> UserIDs, TArray<int> SkillIDs, TArray<int> SlotPositions, int Result, const struct FString& ErrMsg);
	bool rfReqEntrySkillList(int UserID);
	bool rfAckEntryItemList(TArray<int> UserIDs, TArray<int> ItemIDs, TArray<int> SlotPositions, TArray<int> AddPartsID, TArray<struct FBtrDouble> UniqueID, TArray<int> PaintID, int Result, const struct FString& ErrMsg);
	bool rfReqEntryItemList(int UserID);
	bool rfAckChangeUserState(int Result, const struct FString& ErrMsg, TArray<int> UserIDs, TArray<unsigned char> Positions, TArray<int> Numbers, TArray<unsigned char> OldStates, TArray<unsigned char> NewStates);
	bool rfReqChangeUserState(unsigned char NewState, unsigned char CheckPlaying);
	bool rfAckExteriorRoomState();
	bool rfReqExteriorRoomState(int RoomNumber, unsigned char RoomState);
	bool rfAckExteriorRoomUserCount();
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfAckExteriorRoomInfo();
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, unsigned char IsPW, const struct FString& RoomName, const struct FString& MapName, const struct FString& ModeName, int MapNum, int ModeNum, unsigned char IsTeamBalance, int MaxUserCount, int RoomUserCount, unsigned char RoomState, unsigned char BotDifficult, unsigned char WeaponLimit, unsigned char BotModeUserTeamNum);
	bool rfAckGetBootyChoose(int Result, const struct FString& ErrMsg, unsigned char GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, unsigned char ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckGetBooty(int Result, const struct FString& ErrMsg, TArray<int> PrizeWinUserID, TArray<int> BootyItemID, TArray<int> BootyPartsID);
	bool rfReqGetBooty(int RoomNumber);
	bool rfAckSetUserBootySeedValue(int UserID, int Result, const struct FString& ErrMsg);
	bool rfReqSetUserBootySeedValue(int UserID, int SeedValue);
	bool rfAckChangeRoomSetting(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqChangeRoomSetting(const struct FGameRoomInfo& RoomInfo);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, TArray<int> ItemID, TArray<int> PartID);
	bool rfAckClientUdpInfoList(int Result, const struct FString& ErrMsg, TArray<int> UID, TArray<struct FString> IP, TArray<int> Port);
	bool rfReqClientUdpInfoList(int GameNum);
	bool rfAckRegisterOtherUdpInfo(int UID, const struct FString& IP, int Port, unsigned char NatType, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool rfAckRegisterMyUdpInfo(int Result, const struct FString& ErrMsg);
	bool rfReqRegisterMyUdpInfo(unsigned char IsHost, const struct FString& IP, int Port, unsigned char Intervention, const struct FString& HostInnerIP, int HostInnerPort);
	bool rfAckNotifyClientJoinTime(int Result, const struct FString& ErrMsg);
	bool rfReqNotifyClientJoinTime(int JoinedClientID);
	bool rfAckChangeNewGuest(const struct FString& HostIP);
	bool rfAckChangeHost(unsigned char ClientNum);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const struct FString& DisconnectUserName);
	bool rfReqDisconnectGame();
	bool rfAckConnectGame(int UserID, int Result);
	bool rfReqConnectGame();
	bool rfReqRelayServerOff();
	bool rfReqRelayServerOn(const struct FString& RelayServerIP, int RelayServerPortNum);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const struct FString& ErrMsg);
	bool rfReqGameOver(int UID, int GameRoomNumber);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, unsigned char IsPlaying);
	bool rfReqIsGameRoomPlaying(int GameRoomNum);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, const struct FString& ErrMsg);
	bool rfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum);
	bool rfAckUpdateScoreResult(int Result, const struct FString& ErrMsg);
	bool rfAckUpdateScore(TArray<int> UserIDs, TArray<struct FString> NickNames, TArray<unsigned char> TeamIDs, TArray<int> Scores, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> EXPBonuses, TArray<int> Points, TArray<int> PointBonuses, TArray<int> TeamScores, TArray<int> BonusOwnerID, TArray<int> BonusID);
	bool rfReqUpdateScore(int GameNumber, TArray<int> UserIDs, TArray<int> Kills, TArray<int> Assists, TArray<int> Deaths, TArray<int> EXPs, TArray<int> Points, TArray<int> Scores, TArray<int> TeamScores, TArray<int> RoundJoin, TArray<int> TimeJoin, int Playtime, unsigned char GameEndType, TArray<struct FString> UserNames, unsigned char IsAIClear);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const struct FString& ErrMsg);
	bool rfReqStartGame(int GameNumber);
	bool rfAckGameHostInfo(int GameNumber, const struct FString& UserID, const struct FString& IP, int Port, int Result, const struct FString& ErrMsg);
	bool rfReqGameHostInfo(int GameNumber);
	bool rfAckIsHostAvailable(int Result);
	bool rfReqIsHostAvailable(const struct FString& MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam);
	bool rfAckChangeTeam(int GameNumber, const struct FString& UserID, int UID, int TeamNum, int Result, const struct FString& ErrMsg);
	bool rfReqChangeTeam(int TeamNum);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const struct FString& ErrMsg);
	bool rfReqChangeRoomOwner(int GameNum, int UID, int NewOwner);
	bool rfAckChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum, int Result, const struct FString& ErrMsg);
	bool rfReqChangeGameMode(int GameNum, int UID, const struct FString& GameMode, unsigned char GameModeNum);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const struct FString& ErrMsg);
	bool rfReqBanUser(int GameNum, int UID, int BanUID);
	bool rfAckSelectMap(int GameNum, int UID, const struct FString& MapName, int Result, const struct FString& ErrMsg);
	bool rfReqSelectMap(int GameNum, int UID, const struct FString& MapName);
	bool rfAckGameRoomInfo(int Result, const struct FString& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqGameRoomInfo(int GameNum, int UID);
	bool rfAckCreateGameRoom(int Result, const struct FString& ErrMsg, int UserID, const struct FString& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool rfReqCreateGameRoom(const struct FGameRoomInfo& NetRoomInfo);
	bool rfAckExceedMaxUser();
	bool rfAckLeaveRoom(int Num, int UID, const struct FString& UserID, int Result, const struct FString& ErrMsg);
	bool rfReqLeaveRoom(int Num);
	bool rfAckRoomUserList(TArray<int> UID, TArray<struct FString> UserName, TArray<int> Grade, TArray<int> TeamNum, TArray<unsigned char> Statue, TArray<unsigned char> IsHost, TArray<struct FString> UserIP, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<unsigned char> IsLookingFor, TArray<int> GMUID, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfReqRoomUserList(int GameNum);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const struct FString& UserID, int TeamNum, int Grade, const struct FString& UserIP, const struct FString& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqEnterRoom(int GameNum, const struct FString& Password, unsigned char RoomEnterType);
	bool rfAckRoomListEnd();
	bool rfAckRoomList(TArray<int> GameNum, TArray<struct FString> Title, TArray<struct FString> MapName, TArray<int> MapNum, TArray<unsigned char> UserCount, TArray<unsigned char> MaxCount, TArray<struct FString> ModeName, TArray<int> ModeNum, TArray<unsigned char> WeaponLimit, TArray<unsigned char> IsTeamBalance, TArray<unsigned char> Status, TArray<struct FString> RoomOwnerIP, TArray<int> GameMinute, TArray<struct FString> RoomOwnerName, TArray<unsigned char> IsSpecial, TArray<unsigned char> IsPassword, TArray<unsigned char> BotDifficult, TArray<unsigned char> BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfReqRoomList(int id, int StartIndex, int Count);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, TArray<int> UID, TArray<struct FString> UserID, TArray<int> UserLevels, TArray<struct FString> ClanName, TArray<int> ClanPattern, TArray<int> ClanBG, TArray<int> ClanBL, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose, TArray<unsigned char> IsLookForClan, int Result, const struct FString& ErrMsg, TArray<int> ClanLevel, TArray<int> LevelMarkID, TArray<int> TitleMarkID, TArray<int> Reserved1, TArray<int> Reserved2, TArray<int> Reserved3);
	bool rfReqChannelUserList(int id, int StartIndex, int Count);
	bool rfAckLeaveChannel(int Result, const struct FString& UserID, int UID);
	bool rfReqLeaveChannel(int id);
	bool rfAckEnterChannel(int id, int UID, const struct FString& UserID, int Level, const struct FString& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, unsigned char IsLookFor, int Result, const struct FString& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqEnterChannel(int id);
	bool rfAckChannelList(TArray<int> id, TArray<struct FString> Title, TArray<int> CurUser, TArray<int> MaxUser);
	bool rfReqChannelList(int bChannelType);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> LevelMarkID, TArray<int> ClanLevel, TArray<int> Level, TArray<unsigned char> IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqFriendList();
	bool rfAckCharInfo(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, unsigned char InClanRank, int ClanLevel);
	bool rfReqCharInfo();
	bool rfAckLogin2(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, unsigned char IsGM);
	bool rfReqLogin2(const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, const struct FString& Guid, int UserType);
	bool rfAckStartNatDiag(int NatType);
	bool rfReqStartNatDiag(const struct FString& Server1Addr, int Server1Port, const struct FString& Server2Addr, int Server2Port);
	bool rfReqForceLogoutByOwner();
	bool rfAckLogin(int Result, const struct FString& ErrMsg, int UserID, const struct FString& CharName, const struct FString& ClanName, const struct FCharInfo& btCharInfo);
	bool rfReqLogin(const struct FString& id);
	bool rfAckHash(int Result, const struct FString& ErrMsg);
	bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	bool Close();
	bool ConnectDomain(const struct FString& domain, int nPort);
	bool Connect(const struct FString& sIpaddr, int nPort);
	bool InitNetwork();
};


// Class BatteryNet.BTTcpHandler_DS_Script_Interface
// 0x0008 (0x0034 - 0x002C)
class UBTTcpHandler_DS_Script_Interface : public UBTTcpLink_Channel
{
public:
	class UwMatchMaker*                                MM;                                                       // 0x002C(0x0004)
	class UwGameManager*                               GameMgr;                                                  // 0x0030(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTTcpHandler_DS_Script_Interface");
		return ptr;
	}


	void SetGameManager(class UwGameManager* pgameMgr);
	void SetMatchMaker(class UwMatchMaker* pMM);
};


// Class BatteryNet.BTTcpHandler_DS
// 0x0008 (0x0058 - 0x0050)
class UBTTcpHandler_DS : public UBTTcpLink_Channel_DS
{
public:
	unsigned char                                      UnknownData00[0x8];                                       // 0x0050(0x0008) MISSED OFFSET

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTTcpHandler_DS");
		return ptr;
	}

};


// Class BatteryNet.BTNetInterfaceTcp
// 0x0000 (0x002C - 0x002C)
class UBTNetInterfaceTcp : public UBTNetInterface
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTNetInterfaceTcp");
		return ptr;
	}

};


// Class BatteryNet.BTDataTransferClientLink
// 0x0018 (0x0044 - 0x002C)
class UBTDataTransferClientLink : public UObject
{
public:
	struct FString                                     ChannelServerIP;                                          // 0x002C(0x000C) (NeedCtorLink)
	int                                                ServerDataTransferPort;                                   // 0x0038(0x0004)
	class UBTNetGameData*                              NetGameData;                                              // 0x003C(0x0004)
	int                                                iCompleteCheck;                                           // 0x0040(0x0004)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTDataTransferClientLink");
		return ptr;
	}


	void OnReceivedParamDataComplete(int Result);
	bool Close();
	bool RequestData();
	bool InitNetwork(const struct FString& ServerIP, int serverPort);
};


// Class BatteryNet.BTTcpLink_Login
// 0x0000 (0x002C - 0x002C)
class UBTTcpLink_Login : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTTcpLink_Login");
		return ptr;
	}


	bool sfAckLoginWithIndonesia(int Result);
	bool sfReqLoginWithIndonesia(const struct FString& HashValue);
	bool sfAckLoginWithGlobal(int Result);
	bool sfReqLoginWithGlobal(const struct FString& G_AccountID, const struct FString& G_GUID, const struct FString& G_AuthKey, int UserType);
	bool sfAckLoginWithThailand(int Result);
	bool sfReqLoginWithThailand(const struct FString& USN, int BloodDisplayType, int PCBangType, const struct FString& UnixTimeStamp, const struct FString& HashValue, unsigned char Sex);
	bool sfAckLogOut(unsigned char Result, unsigned char Reason);
	bool sfReqLogOut(unsigned char Reason);
	bool sfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool sfReqLoginWithTencentAuth(const struct FString& AccountID, TArray<unsigned char> Signature);
	bool sfAckTencent_AASInfo(int UserID, unsigned char IsAdult, unsigned char IsQQAuth, int AccumTimeSec);
	bool sfAckEventNotify(int Type);
	bool sfReqEventNotify();
	bool sfAckErrorReportServerAddr(const struct FString& Addr, int Port);
	bool sfReqErrorReportServerAddr();
	bool sfAckClientChecksum(int Result);
	bool sfReqClientChecksum(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool sfAckClientChallenge(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool sfReqClientChallenge();
	bool sfAckServerTime(int Time);
	bool sfReqServerTime();
	bool sfAckGetCharBlockInfo(int Result, unsigned char IsAccountBlock, unsigned char IsChattingBlock, const struct FBtrDouble& ChattingBlockEndTime, TArray<struct FString> BlockedItemName);
	bool sfReqGetCharBlockInfo();
	bool sfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool sfReqRegisterMainPCBang();
	bool sfAckPCBangUserListEnd();
	bool sfAckPCBangUserList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose);
	bool sfAckPCBangUserListStart(int Result, int TotalCount);
	bool sfReqPCBangUserList();
	bool sfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool sfReqRegisteredPCBangInfo();
	bool sfAckCharInfo(int Result, const struct FString& CharName, int Level, int Exp, const struct FString& ClanName);
	bool sfReqCharInfo(const struct FString& CharName);
	bool sfReqForceLogoutByOwner();
	bool sfReqKeepAlive();
	bool sfAckMaxUserExceed();
	bool sfAckClanMemberListFromClientEnd();
	bool sfAckClanMemberListFromClient(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<struct FString> ServerName, TArray<struct FString> ServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<unsigned char> CurPos, TArray<int> ChannelNum, TArray<struct FString> ChannelNickName, TArray<int> GameRoomNum);
	bool sfAckClanMemberListFromClientStart(int Result, int TotalCount);
	bool sfReqClanMemberListFromClient();
	bool sfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool sfReqLoginWithWZAuth(const struct FString& AccountID, const struct FString& Guid, const struct FString& AuthKey);
	bool sfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool sfReqProcessPreLoginUser(const struct FString& CharName, unsigned char Type);
	bool sfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool sfReqLoginInHouseTest(const struct FString& UserName, const struct FString& Password, const struct FString& Guid);
	bool sfAckAdvertisement(int Result, unsigned char Type, const struct FString& Address);
	bool sfReqAdvertisement();
	bool sfAckUserDetailInfo(int Result, const struct FString& UserName, const struct FString& ClanName, int Ranking, int MatchNum, int WinNum, int LoseNum, int CurrentEXP, int NextExp, int ForcedDisconnectedNum, int PrimaryWeaponID, int SubWeaponID, int Point);
	bool sfReqUserDetailInfo(int UserID, const struct FString& UserName);
	bool sfAckFriendsListEnd();
	bool sfAckFriendsList(unsigned char ListType, TArray<struct FString> UserName, TArray<unsigned char> IsLogOn, TArray<int> CMarkPattern, TArray<int> CMarkBG, TArray<int> CMarkBL, TArray<struct FString> ClanName, TArray<int> Level);
	bool sfAckFriendsListStart(int Result, int TotalCount);
	bool sfReqFriendsList();
	bool sfAckConnectChannelServer(const struct FString& SessionKey, int TimeStamp);
	bool sfReqConnectChannelServer(const struct FString& ServerIP, int serverPort);
	bool sfAckServerList(TArray<struct FString> CServername, TArray<struct FString> CServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<struct FString> ChannelName, TArray<struct FString> ChannelNickName, TArray<int> ChannelNum, TArray<int> chMaxUser, TArray<int> chCurUser, TArray<struct FString> ServerGroupName, TArray<int> ServerGroupID, TArray<int> ServerDispOrder, TArray<int> DataPort, TArray<unsigned char> OptionCount_byte, TArray<unsigned char> OptionKey_byte, TArray<unsigned char> OptionValue_byte, TArray<unsigned char> OptionCount_int, TArray<unsigned char> OptionKey_int, TArray<int> OptionValue_int, TArray<unsigned char> OptionCount_float, TArray<unsigned char> OptionKey_float, TArray<float> OptionValue_float, TArray<unsigned char> IsClanChannel, TArray<unsigned char> IsUseDedicateHost);
	bool sfReqServerList();
	bool sfAckCreateChar(int Success, const struct FString& ErrMsg);
	bool sfReqCreateChar(const struct FString& CharName, int HeadItemID, int HelmetItemID, int AccesoItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID);
	bool sfAckAccesItemTypeList(TArray<struct FString> AccesoItemName, TArray<int> AccesoItemID);
	bool sfReqAccesItemTypeList();
	bool sfAckHelmetItemTypeList(TArray<struct FString> HelmetItemName, TArray<int> HelmetItemID);
	bool sfReqHelmetItemTypeList();
	bool sfAckHeadItemTypeList(TArray<int> HeadItemID);
	bool sfReqHeadItemTypeList();
	bool sfAckLogin(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg);
	bool sfReqLogin(const struct FString& PortalID);
	bool sfAckExceedMaxUser();
	bool sfAckHash(int Result, const struct FString& ErrMsg);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfAckLoginWithIndonesia(int Result);
	bool rfReqLoginWithIndonesia(const struct FString& HashValue);
	bool rfAckLoginWithGlobal(int Result);
	bool rfReqLoginWithGlobal(const struct FString& G_AccountID, const struct FString& G_GUID, const struct FString& G_AuthKey, int UserType);
	bool rfAckLoginWithThailand(int Result);
	bool rfReqLoginWithThailand(const struct FString& USN, int BloodDisplayType, int PCBangType, const struct FString& UnixTimeStamp, const struct FString& HashValue, unsigned char Sex);
	bool rfAckLogOut(unsigned char Result, unsigned char Reason);
	bool rfReqLogOut(unsigned char Reason);
	bool rfAckLoginWithTencentAuth(int Result, unsigned char tc_AccountType, unsigned char tc_IsBlock);
	bool rfReqLoginWithTencentAuth(const struct FString& AccountID, TArray<unsigned char> Signature);
	bool rfAckTencent_AASInfo(int UserID, unsigned char IsAdult, unsigned char IsQQAuth, int AccumTimeSec);
	bool rfAckEventNotify(int Type);
	bool rfReqEventNotify();
	bool rfAckErrorReportServerAddr(const struct FString& Addr, int Port);
	bool rfReqErrorReportServerAddr();
	bool rfAckClientChecksum(int Result);
	bool rfReqClientChecksum(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool rfAckClientChallenge(const struct FString& Key1, const struct FBtrDouble& Key2);
	bool rfReqClientChallenge();
	bool rfAckServerTime(int Time);
	bool rfReqServerTime();
	bool rfAckGetCharBlockInfo(int Result, unsigned char IsAccountBlock, unsigned char IsChattingBlock, const struct FBtrDouble& ChattingBlockEndTime, TArray<struct FString> BlockedItemName);
	bool rfReqGetCharBlockInfo();
	bool rfAckRegisterMainPCBang(int Result, const struct FString& ErrMsg);
	bool rfReqRegisterMainPCBang();
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(TArray<struct FString> FriendName, TArray<unsigned char> IsLogOn, TArray<struct FString> ClanName, TArray<int> CM_Pattern, TArray<int> CM_BG, TArray<int> CM_BL, TArray<int> Level, TArray<int> ClanGrade, TArray<int> ClanWin, TArray<int> ClanLose);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfReqPCBangUserList();
	bool rfAckRegisteredPCBangInfo(int Result, const struct FString& ErrMsg, unsigned char IsRegisteredPCBang, unsigned char IsMainPCBang, const struct FString& PCBangName);
	bool rfReqRegisteredPCBangInfo();
	bool rfAckCharInfo(int Result, const struct FString& CharName, int Level, int Exp, const struct FString& ClanName);
	bool rfReqCharInfo(const struct FString& CharName);
	bool rfReqForceLogoutByOwner();
	bool rfReqKeepAlive();
	bool rfAckMaxUserExceed();
	bool rfAckClanMemberListFromClientEnd();
	bool rfAckClanMemberListFromClient(int Result, const struct FString& ErrMsg, TArray<int> Level, TArray<struct FString> CharName, TArray<unsigned char> ClanGrade, TArray<struct FString> ServerName, TArray<struct FString> ServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<unsigned char> CurPos, TArray<int> ChannelNum, TArray<struct FString> ChannelNickName, TArray<int> GameRoomNum);
	bool rfAckClanMemberListFromClientStart(int Result, int TotalCount);
	bool rfReqClanMemberListFromClient();
	bool rfAckLoginWithWZAuth(int Result, unsigned char wzp_AccountType, unsigned char wzp_IsBlock, unsigned char wzp_AuthKeySuccess, unsigned char ChannelType);
	bool rfReqLoginWithWZAuth(const struct FString& AccountID, const struct FString& Guid, const struct FString& AuthKey);
	bool rfAckProcessPreLoginUser(int Result, const struct FString& ErrMsg);
	bool rfReqProcessPreLoginUser(const struct FString& CharName, unsigned char Type);
	bool rfAckLoginInHouseTest(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg, const struct FString& BDay, unsigned char Sex, const struct FBtrDouble& ServerTime);
	bool rfReqLoginInHouseTest(const struct FString& UserName, const struct FString& Password, const struct FString& Guid);
	bool rfAckAdvertisement(int Result, unsigned char Type, const struct FString& Address);
	bool rfReqAdvertisement();
	bool rfAckUserDetailInfo(int Result, const struct FString& UserName, const struct FString& ClanName, int Ranking, int MatchNum, int WinNum, int LoseNum, int CurrentEXP, int NextExp, int ForcedDisconnectedNum, int PrimaryWeaponID, int SubWeaponID, int Point);
	bool rfReqUserDetailInfo(int UserID, const struct FString& UserName);
	bool rfAckFriendsListEnd();
	bool rfAckFriendsList(unsigned char ListType, TArray<struct FString> UserName, TArray<unsigned char> IsLogOn, TArray<int> CMarkPattern, TArray<int> CMarkBG, TArray<int> CMarkBL, TArray<struct FString> ClanName, TArray<int> Level);
	bool rfAckFriendsListStart(int Result, int TotalCount);
	bool rfReqFriendsList();
	bool rfAckConnectChannelServer(const struct FString& SessionKey, int TimeStamp);
	bool rfReqConnectChannelServer(const struct FString& ServerIP, int serverPort);
	bool rfAckServerList(TArray<struct FString> CServername, TArray<struct FString> CServerShortName, TArray<struct FString> ServerIP, TArray<int> serverPort, TArray<struct FString> ChannelName, TArray<struct FString> ChannelNickName, TArray<int> ChannelNum, TArray<int> chMaxUser, TArray<int> chCurUser, TArray<struct FString> ServerGroupName, TArray<int> ServerGroupID, TArray<int> ServerDispOrder, TArray<int> DataPort, TArray<unsigned char> OptionCount_byte, TArray<unsigned char> OptionKey_byte, TArray<unsigned char> OptionValue_byte, TArray<unsigned char> OptionCount_int, TArray<unsigned char> OptionKey_int, TArray<int> OptionValue_int, TArray<unsigned char> OptionCount_float, TArray<unsigned char> OptionKey_float, TArray<float> OptionValue_float, TArray<unsigned char> IsClanChannel, TArray<unsigned char> IsUseDedicateHost);
	bool rfReqServerList();
	bool rfAckCreateChar(int Success, const struct FString& ErrMsg);
	bool rfReqCreateChar(const struct FString& CharName, int HeadItemID, int HelmetItemID, int AccesoItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID);
	bool rfAckAccesItemTypeList(TArray<struct FString> AccesoItemName, TArray<int> AccesoItemID);
	bool rfReqAccesItemTypeList();
	bool rfAckHelmetItemTypeList(TArray<struct FString> HelmetItemName, TArray<int> HelmetItemID);
	bool rfReqHelmetItemTypeList();
	bool rfAckHeadItemTypeList(TArray<int> HeadItemID);
	bool rfReqHeadItemTypeList();
	bool rfAckLogin(unsigned char Sucess, const struct FString& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, unsigned char NeedChar, const struct FString& ErrMsg);
	bool rfReqLogin(const struct FString& PortalID);
	bool rfAckExceedMaxUser();
	bool rfAckHash(int Result, const struct FString& ErrMsg);
	bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	bool Close();
	bool ConnectDomain(const struct FString& domain, int nPort);
	bool Connect(const struct FString& sIpaddr, int nPort);
	bool InitNetwork();
};


// Class BatteryNet.BTSteamMapping
// 0x0000 (0x002C - 0x002C)
class UBTSteamMapping : public UObject
{
public:

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTSteamMapping");
		return ptr;
	}


	struct FString STATIC_GetPayURL(const struct FString& AccountID, unsigned char connectAlpha);
};


// Class BatteryNet.BTNatDiag
// 0x001C (0x0048 - 0x002C)
class UBTNatDiag : public UObject
{
public:
	TArray<struct FString>                             nat_server_ip;                                            // 0x002C(0x000C) (Config, NeedCtorLink)
	TArray<int>                                        nat_port;                                                 // 0x0038(0x000C) (Config, NeedCtorLink)
	int                                                NatType;                                                  // 0x0044(0x0004) (Native)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTNatDiag");
		return ptr;
	}


	bool ProcessStep2();
	bool ProcessStep1();
	TEnumAsByte<ENAT_TYPE> GetNatType();
	int CheckPhrase2();
	int CheckPhrase1();
	bool SetSecondServer(const struct FString& server_ip, int nPort);
	bool SetPrimaryServer(const struct FString& server_ip, int nPort);
	bool StartNatCheck(const struct FString& nat_server_ip, int nPort, const struct FString& sLocalBindAddr);
	bool InitNatSocket();
	bool SetNatServerIp(TArray<struct FString> nat_server_ip, TArray<int> nPorts);
	bool Start(TArray<struct FString> ipaddresses, TArray<int> ports);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
