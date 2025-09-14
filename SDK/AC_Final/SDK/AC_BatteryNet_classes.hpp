#pragma once

// Artic Combat (3369) SDK

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


	bool sfReqUpdateCurrentRunningInfo(int GroupID, const string& GroupName, const string& ServerName, int ServerID, string[] key, int[] Value);
	bool sfReqNotifyKickOffUser(int QQID);
	bool sfReqUpdatePostAlram(int QQID, const string& Subject, const string& Text, int ItemID);
	bool sfReqUpdateProcessState(int State);
	bool sfAckProcessExcuteCmd(int Result, int MajorType, int MinorType, const string& CmdValue);
	bool sfReqProcessExcuteCmd(int MajorType, int MinorType, const string& CmdValue);
	bool sfReqUpdateUserCount_DudeServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool sfReqUpdateUserCount_LoginServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool sfReqUpdateUserCount_ChannelServer(int ServerID, int ChannelCount, int[] ChannelNum, int[] ChannelMaxUserCount, int[] ChannelCurUserCount, int[] ChannelPlayingUserCount, int[] ChannelRoomCount, byte[] ChannelGrade);
	bool sfReqTerminateDedicateHostProcess();
	bool sfAckStartDedicateHost(int Result, int ProcessID, int ServerID, int ChannelNum, int RoomNum);
	bool sfReqStartDedicateHost(int ServerID, const string& ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum);
	bool sfAckQuitDedicateHost(int Result, int PID, int ServerID, int ChannelNum, int RoomNum);
	bool sfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum);
	bool sfAckLogin(int Result);
	bool sfReqLogin(int PID, int ServerID, byte[] ServerIPAddrType, string[] ServerIPAddr, byte[] ServerPortType, int[] ServerPortNum);
	bool sfAckHash(int Result, const string& ErrMsg);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfReqUpdateCurrentRunningInfo(int GroupID, const string& GroupName, const string& ServerName, int ServerID, string[] key, int[] Value);
	bool rfReqNotifyKickOffUser(int QQID);
	bool rfReqUpdatePostAlram(int QQID, const string& Subject, const string& Text, int ItemID);
	bool rfReqUpdateProcessState(int State);
	bool rfAckProcessExcuteCmd(int Result, int MajorType, int MinorType, const string& CmdValue);
	bool rfReqProcessExcuteCmd(int MajorType, int MinorType, const string& CmdValue);
	bool rfReqUpdateUserCount_DudeServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool rfReqUpdateUserCount_LoginServer(int ServerID, int MaxUserCount, int CurUserCount);
	bool rfReqUpdateUserCount_ChannelServer(int ServerID, int ChannelCount, int[] ChannelNum, int[] ChannelMaxUserCount, int[] ChannelCurUserCount, int[] ChannelPlayingUserCount, int[] ChannelRoomCount, byte[] ChannelGrade);
	bool rfReqTerminateDedicateHostProcess();
	bool rfAckStartDedicateHost(int Result, int ProcessID, int ServerID, int ChannelNum, int RoomNum);
	bool rfReqStartDedicateHost(int ServerID, const string& ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum);
	bool rfAckQuitDedicateHost(int Result, int PID, int ServerID, int ChannelNum, int RoomNum);
	bool rfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum);
	bool rfAckLogin(int Result);
	bool rfReqLogin(int PID, int ServerID, byte[] ServerIPAddrType, string[] ServerIPAddr, byte[] ServerPortType, int[] ServerPortNum);
	bool rfAckHash(int Result, const string& ErrMsg);
	bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	bool Close();
	bool Connect(const string& sIpaddr, int nPort);
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
	byte                                               Padding00[0x8];                                           // 0x0050(0x0008) MISSED OFFSET

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


	bool sfReqAddSpecialRank(const string& NickName);
	bool sfAckExpandSlotConfirm(int Result, const string& ErrMsg, int QSlotID, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool sfReqExpandSlotConfirm();
	bool sfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool sfReqGP20CashModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int[] ProductNo);
	bool sfAckCharDetailInfoWithClan(int ErrorCode, const string& CharName, int Exp, int Level, int LevelMarkID, int PreMonthlyRanking, int MonthlyRanking, int Win, int Lose, int Kill, int Death, int Assist, int KillCountByAimShooting, int HeadShot2, int TotPlayTime, int DisCon, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, int DispHeadItem, int DispFaceItem, int DispBackpack, int DispPouch, int DispCamouflage, const string& ClanName, int ClanLevel, int CM_Pattern, int CM_BG, int CM_BL, int ClanExp, byte ClanGrade, int ClanActivity, int MonthlyConnectingCount, int UserClanWin, int UserClanLose, int UserClanDraw, int ClanWin, int ClanLose, int ClanDraw, int PreClanTotalRankCur, int ClanTotalRankCur, int PreClanMonthlyRankCur, int ClanMonthlyRankCur, int PreClanMonthlyConnectingRank, int ClanMonthlyConnectingRank, const string& ClanIntro);
	bool sfReqCharDetailInfoWithClan(const string& CharName);
	bool sfAckPcBangItemList(int[] ItemTID, int[] PartID);
	bool sfReqPcBangItemList();
	bool sfReqNotifyShopPackageItemData(int PackageProductNo, int[] ProductCode, int[] ProductQuantity, int[] ProductHour, const string& Description);
	bool sfAckUseItemDuringGame(int ErrorCode, const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool sfReqUseItemDuringGame(const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, byte UsingCount);
	bool sfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, byte ChangeCount, int RemainCount);
	bool sfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool sfReqLuckShop_RewardCoupon(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool sfReqLuckShop_RewardBuyingCount(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool sfReqLuckShop_StorageInfo();
	bool sfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool sfReqLuckShop_LotteryWinnerList(int CapsuleItemID);
	bool sfAckSpecialQuestRank(string[] CharList);
	bool sfReqSpecialQuestRank();
	bool sfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool sfReqReceiveSpecialReward(int QuestID);
	bool sfAckDailyRewardListThisMonth(byte[] Type, byte[] Number, int[] ItemID, int[] ItemCount);
	bool sfReqDailyRewardListThisMonth();
	bool sfAckPuzzleList(int Result, byte IsComplete, byte[] UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool sfReqPuzzleList(byte ReqType, byte UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool sfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool sfReqAttendanceList(byte ReqType, byte UpdateNum, byte UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool sfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, int[] ScoreRewardUserID, byte[] ScoreRewardTYPE, int[] ScoreRewardID, int[] ScoreRewardCount);
	bool sfNotifyCouponUseError(int Time);
	bool sfAckCouponUse(int Result, const string& ErrMsg);
	bool sfReqCouponUse(const string& Serial);
	bool sfReqNotifyShopItemDataEnd(int Ver);
	bool sfReqNotifyShopItemData(int[] ProductNo, string[] ProductName, int[] ProductCode, byte[] SaleType, int[] ProductCost, int[] ProductHour, int[] ProductQuantity, int[] SaleMasterFlag, int[] SaleStatus, int[] IsGift, struct FBtrDouble[] SaleEndTime, int[] Discountcost);
	bool sfAckShopItemData();
	bool sfReqShopItemData(int Ver);
	bool sfReqNotifyLoadingStatus(int Status);
	bool sfReqUpdateUserPerformenceInfo(int UserID, int MinFps, int MaxFps, int AvgFps, int MinPing, int MaxPing, int AvgPing);
	bool sfReqAhnNotifyDisconnct(int Code);
	bool sfAckAhnHsObject(byte[] Data, int DataSize);
	bool sfReqAhnHsObject(byte[] Data, int DataSize);
	bool sfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool sfNotifyNewClanName(const string& New_NickName);
	bool sfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool sfAckGameMapData(int[] nIdx, int[] nMapID, string[] nMapNm, float[] fSupHealth, float[] fSupHeli, float[] fSupBomb, float[] fSupUAV, int[] nModFFA, int[] nModFFAMax, int[] nModTDM, int[] nModTDMMax, int[] nModSD, int[] nModSDMax, int[] nModDOM, int[] nModDOMMax, int[] nModSab, int[] nModSabMax);
	bool sfReqGameMapData();
	bool sfAckTencent_StartTenProtect(int CharDBID);
	bool sfAckMoveToLobby(byte MessageType);
	bool sfAckPopUpMessage(int MessageType);
	bool sfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool sfReqSetClientVersion(int ClientVersion);
	bool sfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool sfReqFriendPosition(const string& TargetCharName, byte CommunityType);
	bool sfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum);
	bool sfReqDedicateHost_Login(int ProcessID, int ChannelNum, int RoomNum);
	bool sfAckLogOut(byte Result, byte Reason);
	bool sfReqLogOut(byte Reason);
	bool sfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec);
	bool sfAckSetCommunityOption(int Result, const string& ErrStr);
	bool sfReqSetCommunityOption(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool sfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool sfReqCommunityOptionList();
	bool sfAckNotifyUpdateCharInfo_TitleMark(const string& CharName, int TitleMarkID);
	bool sfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool sfAckGetRankingInfoListEnd();
	bool sfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool sfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool sfReqGetRankingInfoList(byte RankingType, byte CommunityType);
	bool sfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool sfReqCharDetailInfo();
	bool sfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool sfReqInGameRoomUserInfoChanged();
	bool sfAckClanMatchResultHistory(struct FBtrDouble[] MatchDate, byte[] IsWin, string[] EnemyClanname);
	bool sfReqClanMatchResultHistory(const string& ClanNm);
	bool sfAckDeleteMailAll(int Result, byte MailType, int Count);
	bool sfReqDeleteMailAll(byte MailType);
	bool sfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const string& RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic);
	bool sfAckEventNotify(int Type);
	bool sfReqEventNotify();
	bool sfAckPaidItem_NotifyChangeClanname(const string& NewClanname);
	bool sfAckPaidItem_ChangeClanname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewClanname);
	bool sfReqPaidItem_ChangeClanname(const struct FBtrDouble& ItemIdx, const string& NewClanname);
	bool sfAckClanMatch_EndPublicWaitRoomList();
	bool sfAckClanMatch_PublicWaitRoomList(int[] WaitRoomIdx, string[] LeaderName, string[] RoomName, int[] MapNum, int[] CurUserCount, int[] MaxUserCount, byte[] Status);
	bool sfAckClanMatch_StartPublicWaitRoomList(int Result, const string& ErrMsg, int Count);
	bool sfReqClanMatch_GetPublicWaitRoomList();
	bool sfAckServerType(byte Type);
	bool sfReqServerType();
	bool sfAckServerShutdown(int Result, const string& ErrMsg);
	bool sfReqServerShutdown(const string& AuthKey, int SecondAfter, const struct FBtrDouble& ShutdownTime);
	bool sfAckNotifyEndTutorial(int UserID, const string& CharName, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqNotifyEndTutorial(int TutorialResultType);
	bool sfAckNotifyStartTutorial(int Result, int UserID);
	bool sfReqNotifyStartTutorial();
	bool sfAckRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostPriorityPoint);
	bool sfReqRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostPriorityPoint);
	bool sfAckMyEquipedQSlotList(byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, int[] MWItemID, int[] MWPartID, int[] MWPaintID, struct FBtrDouble[] PistolUniqueID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, struct FBtrDouble[] TW1UniqueID, int[] TWItemID1, struct FBtrDouble[] TW2UniqueID, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int Result, struct FBtrDouble[] KnifeUniqueID, int[] KnifeItemID);
	bool sfReqMyEquipedQSlotList();
	bool sfAckMyEquipedSkillList(int[] SkillIDs, int[] SlotPositions, int Result);
	bool sfReqMyEquipedSkillList();
	bool sfAckMyEquipedItemList(int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, int[] PaintID, struct FBtrDouble[] UniqueID, int Result);
	bool sfReqMyEquipedItemList();
	bool sfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount);
	bool sfReqGetMyMailBoxState();
	bool sfAckSetLookForClan(int Result, const string& ErrMsg, byte IsLookingFor);
	bool sfReqSetLookForClan(byte IsLookingFor);
	bool sfAckExteriorRoomOwnerInfo();
	bool sfReqExteriorRoomOwnerInfo(int RoomNum, const string& OwnerName, const string& OwnerIP);
	bool sfAckClanMatch_SetWaitRoomPublic(int Result, const string& ErrMsg, byte Set);
	bool sfReqClanMatch_SetWaitRoomPublic(byte Set);
	bool sfReqRemoveCheckTeamBalanceList();
	bool sfAckPaidItem_NotifyChangeClanMark(const string& ClanName, int Pattern, int BG, int BL);
	bool sfAckPaidItem_ChangeClanMark(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool sfReqPaidItem_ChangeClanMark(const struct FBtrDouble& ItemIdx, byte IsPaid, int Pattern, int BG, int BL);
	bool sfAckPaidItem_ClanMarkDupCheck(int Result, const string& ErrMsg);
	bool sfReqPaidItem_ClanMarkDupCheck(byte IsPaid, int Pattern, int BG, int BL);
	bool sfAckPaidItem_RelayBroadcast(const string& CharName, const string& Msg);
	bool sfAckPaidItem_BroadCast(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool sfReqPaidItem_BroadCast(const struct FBtrDouble& ItemIdx, int Command, const string& Message);
	bool sfAckPaidItem_EraseRecord(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool sfReqPaidItem_EraseRecord(const struct FBtrDouble& ItemIdx, int Command);
	bool sfAckPaidItem_ChangeCharname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewCharname);
	bool sfReqPaidItem_ChangeCharname(const struct FBtrDouble& ItemIdx, const string& NewCharname);
	bool sfAckRecvSystemMsg(byte CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool sfAckSendSystemMsg(int Result);
	bool sfReqSendSystemMsg(byte RecvType, const string& SendCharName, const string& RecvCharname, const struct FSystemMsgParam& MsgInfo);
	bool sfAckRandomBox_Use(int Result, const string& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, int[] ItemIDChoose, int[] PartIDChoose, int[] PeriodOnChoosenItem, int[] StackCountOnChoosenItem, byte[] bHave, struct FBtrDouble[] ItemIdx, struct FBtrDouble[] UntilTime, int[] StackCount);
	bool sfReqRandomBox_Use(const struct FBtrDouble& ItemIdx_RandomBox, const struct FBtrDouble& ItemIdx_Key);
	bool sfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool sfAckChangeRoomTitle_GM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool sfReqChangeRoomTitle_GM(int RoomNumber, const string& NewRoomTitle);
	bool sfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool sfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool sfAckQuestGetAvailableEventList(int Result, const string& ErrMsg, int[] QuestID);
	bool sfReqQuestGetAvailableEventList();
	bool sfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, struct FBtrDouble[] BlockedItemIdx);
	bool sfReqCharBlockInfo();
	bool sfNotifyPcBangInfo(byte PcBang_Grade);
	bool sfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, const string& WaitRoomName);
	bool sfReqClanMatch_GetClanWaittingRoomInfo();
	bool sfAckReturnBotID(int Result);
	bool sfReqReturnBotID(int[] BotID);
	bool sfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, int[] AFBotID, int[] RSABotID);
	bool sfReqGetBotID(byte AFCount, byte RSACount);
	bool sfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool sfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool sfAckParamCheckSum(int Result);
	bool sfReqParamCheckSum(const string& key, const string& Value);
	bool sfAckWebzenBillingUseStorageItem(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool sfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, byte StorageItemType);
	bool sfAckWebzenBillingStorageListEnd();
	bool sfAckWebzenBillingStorageList(int[] Seq, int[] ItemSeq, int[] GroupCode, int[] ShareFlag, int[] ProductSeq, string[] CashName, struct FBtrDouble[] CashPoint, string[] SendAccountID, string[] SendMessage, byte[] ItemType, byte[] RelationType, int[] ProductType, int[] PriceSeq);
	bool sfAckWebzenBillingStorageListStart(int Result, const string& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool sfReqWebzenBillingStorageList(int Page, int CountForPage, byte Type);
	bool sfAckGiftItemByWebzenCash(int Result, const string& ErrMsg, int LeftProductCount);
	bool sfReqGiftItemByWebzenCash(const string& ReceiverCharName, const string& Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq);
	bool sfReqGiftItemByWebzenCashGP20(const string& ReceiverCharName, const string& Message, int ProductNo, byte Cointype);
	bool sfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	bool sfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, int[] ItemIDs, const struct FBtrDouble& ItemUniqueID, byte BuyOption1, byte BuyOption2);
	bool sfReqBuyItemByWebzenCashGP20(int ProductNo, byte Cointype, const struct FBtrDouble& ItemID);
	bool sfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool sfReqWebzenShopScriptVersion();
	bool sfAckWebzenCash(int Result, const string& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool sfReqWebzenCash();
	bool sfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool sfReqRegisteredPCBangInfo();
	bool sfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool sfReqRegisterMainPCBang();
	bool sfAckPCBangUserListEnd();
	bool sfAckPCBangUserList(string[] FriendName, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, byte[] IsCombat, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool sfAckPCBangUserListStart(int Result, int TotalCount);
	bool sfReqPCBangUserList();
	bool sfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool sfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool sfAckQuestUpdate(int Result, const string& ErrMsg);
	bool sfReqQuestUpdate(int UniqueID, int GameRoomNum, int[] QuestID, int[] CountPrograss);
	bool sfAckQuestListEnd();
	bool sfAckQuestList(int[] QuestID, int[] CountPrograss, byte[] QuestType, byte[] IsComplete);
	bool sfAckQuestListStart(int Result, const string& ErrMsg);
	bool sfReqQuestList();
	bool sfAckPermanentRoomInfo(int Result, int ClanIdx, byte FixedGameMode, byte FixedMaxUserCnt);
	bool sfReqPermanentRoomInfo(int RoomNum);
	bool sfAckClanMatch_FoundMatch();
	bool sfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool sfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool sfAckClanMatch_StartSearching(int Result, const string& ErrMsg, int ShouldWaitMore);
	bool sfReqClanMatch_StartSearching(int RequestCount);
	bool sfAckLimitedListInChannel(int Result, int[] LimitedMapID, int[] LimitedModeID);
	bool sfReqLimitedListInChannel();
	bool sfAckRecvInviteGameRoomResult(int Result);
	bool sfAckRecvInviteGameRoom(const string& RoomUniqueID, int RoomNumber, byte Answer, const string& InviteCharName);
	bool sfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool sfAckInviteGameRoom(int Result, byte Answer, const string& GuestCharName);
	bool sfReqInviteGameRoom(const string& GuestCharName);
	bool sfAckClanMatch_StopSearching();
	bool sfReqClanMatch_StopSearching();
	bool sfAckClanMatch_ChangeLeader(int Result, const string& ErrMsg, int NewLeader, const string& NewLeaderName);
	bool sfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, const string& NewLeaderName);
	bool sfAckClanMatch_WaittingTeamList(int TtotlCount, int[] Grade, int[] Map, int[] Versus);
	bool sfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount);
	bool sfAckClanMatch_Chat(int Result, const string& ErrMsg, const string& CharName, const string& Msg);
	bool sfReqClanMatch_Chat(const string& Msg);
	bool sfAckClanMatch_LeaveNotify(const string& CharName);
	bool sfAckClanMatch_Leave(int Result, const string& ErrMsg);
	bool sfReqClanMatch_Leave(int WaittingID);
	bool sfAckClanMatch_MemberList(byte[] IsLeader, int[] ClanMarkPA, int[] ClanMarkBG, int[] ClanMarkBL, int[] Level, string[] CharName, int[] ClanGrade, int[] ClanWin, int[] ClanLose, string[] ClanName, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool sfReqClanMatch_MemberList();
	bool sfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const string& CharName, int ClanGrade, int ClanWin, int ClanLose, const string& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool sfReqClanMatch_Join(int WaittingID);
	bool sfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool sfAckClanMatch_RecvInviteCrew(int Result, const string& Inviter);
	bool sfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool sfAckClanMatch_InviteCrew(int Result, const string& ErrMsg);
	bool sfReqClanMatch_InviteCrew(const string& Invitee);
	bool sfAckClanMatch_NotifiyStartCombat(int[] MapNumArray, int VersusMode);
	bool sfAckClanMatch_StartCombat(int Result, const string& ErrMsg);
	bool sfReqClanMatch_StartCombat(int[] MapNumArray, int VersusMode);
	bool sfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
	bool sfReqClanMatch_GetReady();
	bool sfAckAutoChangedTeamUserList(int[] UserID, int[] TeamNum);
	bool sfAckGetItemFromItemBox(int Result, const string& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, byte bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool sfReqGetItemFromItemBox(const struct FBtrDouble& ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool sfAckItemListInItemBox(int Result, const string& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, int[] ItemID, int[] PartID, byte FromContent);
	bool sfReqItemListInItemBox(const struct FBtrDouble& ItemUniqueID, int BoxItemID, byte FromContent);
	bool sfReqRecvForceFailedClientLoading(int ErrCode);
	bool sfAckForceFailedClientLoading(int Result, const string& ErrMsg);
	bool sfReqForceFailedClientLoading(int FailedUserID, int ErrCode);
	bool sfAckStartHolePunching(int Result, const string& ErrMsg, int GameType, int ReqStartUserID);
	bool sfReqStartHolePunching(int GameType, int ReqStartUserID);
	bool sfAckNotifyMyCharInfoToRoomUser(int Result, const string& ErrMsg, int UID, const string& UserName, int Grade, int TeamNum, byte Statue, byte IsHost, const string& UserIP, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor);
	bool sfReqNotifyMyCharInfoToRoomUser();
	bool sfReqNotifyDurabilityZeroItem(int Result, const string& ErrMsg, int UserID, struct FBtrDouble[] ItemUniqueIDs, int[] ItemIDs, int[] ItemPartIDs, byte[] ItemSlotPos);
	bool sfAckChatWispherMyCommunity(int Result, const string& ErrMsg);
	bool sfReqChatWispherMyCommunity(const string& SourceCharName, const string& SenderName, const string& Msg);
	bool sfReqNotifyDisconnectHostInLoading(int Result, const string& ErrMsg, int HostID);
	bool sfReqRecvForceDisconnected_FromGM(int Result, const string& ErrMsg);
	bool sfAckForceDisconnectUser_GM(int Result, const string& ErrMsg, const string& CharName);
	bool sfReqForceDisconnectUser_GM(const string& CharName);
	bool sfReqRecvNotice_FromGM(int Result, const string& ErrMsg, string[] NoticeMsg, byte IsFromDB);
	bool sfAckNotice_GM(int Result, const string& ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool sfReqNotice_GM(byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool sfAckSpecificChannelUserInfo(int UID, const string& UserID, int UserLevels, const string& ClanName, int ClanPattern, int ClanBG, int ClanBL, int Result, const string& ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqSpecificChannelUserInfo(int UserID);
	bool sfAckSpecificGameRoomInfo(int Result, int GameNum, const string& Title, const string& MapName, int MapNum, byte UserCount, byte MaxCount, const string& GameModeName, int ModeNum, byte WeaponLimit, byte IsHardCore, byte Status, const string& RoomOwnerIP, int GameMinute, const string& RoomOwnerName, byte IsSpecial, byte IsPassword);
	bool sfReqSpecificGameRoomInfo(int RoomNum);
	bool sfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, int[] UID, string[] CharName, int[] UserLevel, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, byte[] IsLookForClan, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool sfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count);
	bool sfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool sfAckDeleteFriend(int Result, string[] FailedCharname);
	bool sfReqDeleteFriend(string[] DeleteCharName);
	bool sfAckGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool sfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool sfAckCheckEquipedWeaponDurability(int Result, struct FBtrDouble[] ItemUniqueID, int[] ItemSlotNum);
	bool sfReqCheckEquipedWeaponDurability();
	bool sfReqGamePlay_GetChopper(int GetChopperUID, int[] GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, const string& ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord);
	bool sfAckAcquirePromotionItems(int UID, int Result, const string& ErrMsg, struct FBtrDouble[] ItemUniqueID, int[] ItemIDs, int[] PartIDs);
	bool sfAckIsAvailClanURL(const string& ClanURL, int Result, const string& ErrMsg);
	bool sfReqIsAvailClanURL(const string& ClanURL);
	bool sfAckGetIsHostBlocking(int Result, byte Blocking);
	bool sfReqGetIsHostBlocking();
	bool sfAckNotifyHostBlocking(int Result, byte Blocking);
	bool sfReqNotifyHostBlocking(byte Blocking);
	bool sfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, int[] FailedUserIDs);
	bool sfReqGetHolePunchingResult();
	bool sfReqNotifyRecvDummyForHolePunching(int ClientUserID, byte Phrase);
	bool sfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber);
	bool sfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore);
	bool sfReqNotifyRelayServerAddr(const string& RelayIP, int RelayPort);
	bool sfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool sfReqGetUserHostPriorityPoint(int UserID);
	bool sfReqUpdateMyHostPriorityPoint(int HostPriorityPoint);
	bool sfReqWriteServerLog(byte Destination, const string& LogMsg);
	bool sfReqGamePlay_SetRoundStartTime(int[] UID);
	bool sfReqGamePlay_SetGameStartTime(int[] UID);
	bool sfReqRecvForceDisconnectUDPFromHost(int Result);
	bool sfAckForceDisconnectUDPFromHost(int Result);
	bool sfReqForceDisconnectUDPFromHost(int UserID);
	bool sfReqGamePlay_TakeAPoint(int[] TakerUID, byte TakePos, float[] TakerXCoord, float[] TakerYCoord, float[] TakerZCoord, int[] TakerPos, int[] TakerWeaponID, int[] TakerWeaponPartID, int[] TakerRange);
	bool sfReqNotifyChangeRoomState(byte RoomState);
	bool sfReqGamePlay_DefuseBomb(int DefuserUID, byte DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange);
	bool sfReqGamePlay_InstallBomb(int InstallerUID, byte InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange);
	bool sfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool sfReqDBCharInfo(const string& CharName);
	bool sfReqForceNatTypeSetting(int NatType);
	bool sfAckGetServerTime(const struct FBtrDouble& ServerTime, const string& ClientIP);
	bool sfReqGetServerTime();
	bool sfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, byte VTeam, byte VTeamAD, int AFScore, int RSAScore, int Round);
	bool sfReqLogGetScore(const struct FKillDeathLog& KillDeathLogParam, int[] AssistUIDs, byte[] AssistScores);
	bool sfAckAuctionTradeHistory(int Result, const string& ErrMsg, int ItemID, int PartID, string[] SellerCharNm, int[] DamageDegree, int[] Price);
	bool sfReqAuctionTradeHistory(int ItemID, int PartID);
	bool sfAckSendGift(int Result, const string& ErrMsg, int PointRemain, int CashRemain);
	bool sfReqSendGift(int ItemID, const string& RecvCharname, const string& RecvMessage, byte BuyOption1, byte BuyOption2);
	bool sfAckGetAttachedItemFromMemo(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool sfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID);
	bool sfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool sfAckChatClan(const string& CharName, const string& Message, int Result);
	bool sfReqChatClan(const string& Message);
	bool sfAckTestDouble(const struct FBtrDouble& vDouble, struct FBtrDouble[] vDoubles);
	bool sfReqTestDouble(const struct FBtrDouble& vDouble, struct FBtrDouble[] vDoubles);
	bool sfAckNotifyLoadingState(int Result, int UserID, byte LoadingState);
	bool sfReqNotifyLoadingState(byte LoadingState);
	bool sfAckFailedStartGame(int Result, const string& ErrMsg, byte IsHost, int FailedUserID, int LoadingStep);
	bool sfReqFailedStartGame(int LoadingStep);
	bool sfAckSuccessStartGame(int Result, const string& ErrMsg, byte IsHost, const string& HostIP, int HostPort, int LoadingStep);
	bool sfReqSuccessStartGame(int LoadingStep);
	bool sfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool sfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool sfAckClanPersonelIntro(int Result, const string& ErrMsg);
	bool sfReqClanPersonelIntro(const string& ClanName, const string& CharName, const string& PersonelIntro);
	bool sfAckClanChangeInfo(int Result, const string& ErrMsg);
	bool sfReqClanChangeInfo(const string& ClanName, byte IsRecruit, byte Region, const string& Keyword, const string& ClanIntro, const string& Notice);
	bool sfAckClanClose(int Result, const string& ErrMsg, const string& ClanName);
	bool sfReqClanClose(const string& ClanName);
	bool sfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool sfAckClanSecession(int Result, const string& ErrMsg);
	bool sfReqClanSecession(const string& ClanName);
	bool sfAckClanNews(string[] IssueDate, byte[] IssueType, string[] IssuedClanMember);
	bool sfReqClanNews(const string& ClanName);
	bool sfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool sfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool sfReqAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool sfAckClanUserListEnd();
	bool sfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool sfAckClanUserListStart(int Result, int TotalCount);
	bool sfReqClanUserList(const string& ClanName);
	bool sfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool sfReqSerachClan(byte SearchType, const string& Keyword, byte ClanStatus, byte ClanRegion, int ReqPage);
	bool sfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool sfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool sfAckRecvJoinClan(int UserIdx, const string& CharName, const string& ReqMsg, byte Permit);
	bool sfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool sfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool sfReqJoinClan(const string& ClanName, const string& ClanManagerName, const string& Message);
	bool sfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool sfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool sfAckRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& InviterMsg, const string& ClanName, byte Permit);
	bool sfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool sfAckInviteClan(int Result, const string& ErrMsg);
	bool sfReqInviteClan(const string& CharName, const string& InviteMsg);
	bool sfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool sfReqClanInfo(const string& ClanName);
	bool sfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool sfReqCreateClan(const string& ClanName, const string& ClanURL, const string& ClanIntro, const string& ClanKeyword, byte ClanRegion);
	bool sfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool sfReqDupCheckClanName(const string& ClanNam);
	bool sfAckSellShopItemInfo(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool sfReqSellShopItemInfo(const struct FBtrDouble& UniqueItemID, int Count);
	bool sfAckGameOverEnd(int Result, const string& ErrMsg);
	bool sfReqGameOverEnd();
	bool sfAckAuctionItemListCount(int Result, const string& ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count);
	bool sfReqAuctionItemListCount(byte Section, byte Classfy, int ItemType, int ItemGrade);
	bool sfAckServerTime(int Time);
	bool sfReqServerTime();
	bool sfAckEntryQSlotIDList(int UserNum, byte[] QSlotDispOrder, int[] MWItemID, int[] MWPartID, int[] MWPaintID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, int[] TWItemID1, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int[] KWItemID);
	bool sfReqEntryQSlotIDList(int UserNum);
	bool sfAckEntryQSlotUniqueIDList(int UserNum, byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, struct FBtrDouble[] PistolUniqueID, struct FBtrDouble[] TW1UniqueID, struct FBtrDouble[] TW2UniqueID, struct FBtrDouble[] KnifeUniqueID);
	bool sfReqEntryQSlotUniqueIDList(int UserNum);
	bool sfAckAuctionBidding(int Result, const string& ErrMsg, int PointRemain);
	bool sfReqAuctionBidding(int UniqueID, int BiddingPrice);
	bool sfAckAuctionInstantlyBuying(int Result, const string& ErrMsg, int PointRemain);
	bool sfReqAuctionInstantlyBuying(int UniqueID);
	bool sfAckAuctionItemListEnd(byte Section);
	bool sfAckAuctionItemList(byte Section, int[] UniqueIDs, int[] ItemIDs, int[] AddPartsIDs, struct FBtrDouble[] UntilTimes, int[] BiddingPrices, int[] InstantlyByuingPrices, int[] ItemDamageds, string[] HighestBidderNames, string[] SellerNames, int[] ItemCount);
	bool sfAckAuctionItemListStart(int Result, const string& ErrMsg, byte Section, int PageNum, int Count);
	bool sfReqAuctionItemList(byte Section, const string& Keyword, int ItemRank, byte ItemClassfy, byte IsAvailable, int PageNum, int Count, int SortOpt);
	bool sfAckAuctionMyItemCancel(int Result, const string& ErrMsg);
	bool sfReqAuctionMyItemCancel(int UniqueID);
	bool sfAckAuctionMyItemRegister(int Result, const string& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool sfReqAuctionMyItemRegister(const struct FBtrDouble& UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice);
	bool sfAckMyMoney(int Result, const string& ErrMsg, int Point, int Cash);
	bool sfReqMyMoney();
	bool sfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool sfReqUpdateQSlot_2(byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool sfAckUpdateQSlot(int Result, const string& ErrMsg);
	bool sfReqUpdateQSlot(int QSlotID, const string& QSlotName, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool sfAckQSlotList_2(int Result, const string& ErrMsg, byte[] QSlotDispOrder, int[] QSlotIDX, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos);
	bool sfReqQSlotList_2();
	bool sfAckQSlotList(int Result, const string& ErrMsg, int[] QSlotID, string[] QSlotName, byte[] QSlotDispOrder, struct FBtrDouble[] MWItemID, struct FBtrDouble[] PistolItemID, struct FBtrDouble[] TWItemID1, struct FBtrDouble[] TWItemID2, int[] Skill1, int[] Skill2, int[] Skill3, int[] Skill4, struct FBtrDouble[] KnifeItemID);
	bool sfReqQSlotList();
	bool sfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool sfReqRepairItem(struct FBtrDouble[] UniqueItemID);
	bool sfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool sfReqRepairCost(struct FBtrDouble[] UniqueItemID);
	bool sfAckUpdateWeaponDurability(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] Durability, byte[] IsDestroy, struct FBtrDouble[] FailedWeaponUniqueID);
	bool sfReqUpdateWeaponDurability(int TotalPlayTime, int[] OwnerID, int[] Number, struct FBtrDouble[] UniqueItemID, int[] UsingSec, int[] UsingRoundInSD);
	bool sfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool sfReqModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool sfAckSellShopItem(int Result, const string& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool sfReqSellShopItem(const struct FBtrDouble& ItemUniqueID, int Count);
	bool sfAckBuyShopItem(int ItemCount, int[] Result, int[] BoughtItemTypeID, struct FBtrDouble[] BoughtItemUniqueID, int[] BoughtPartID, struct FBtrDouble[] BoughtUntilTIme, int[] BoughtStackCnt, int PointRemain, int CashRemain);
	bool sfReqBuyShopItem(int ItemID, const struct FBtrDouble& ItemUniqueID, byte BuyOption1, byte BuyOption2);
	bool sfAckShopItemListEnd();
	bool sfAckShopItemList(int[] ItemID);
	bool sfAckShopItemListStart(int Count);
	bool sfReqShopItemList();
	bool sfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool sfReqForceGameOver();
	bool sfAckGiveSkill(int SkillID, int Result, const string& ErrMsg);
	bool sfReqGiveSkill();
	bool sfAckNotifyExpiredItemIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool sfReqNotifyExpiredItemIDs();
	bool sfAckNotifyExpiredSkillIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool sfReqNotifyExpiredSkillIDs();
	bool sfAckNotifyChangedSkillState(int UserID, int[] SkillIDs, byte[] NewStates, int Result, const string& ErrMsg);
	bool sfReqNotifyChangedSkillState();
	bool sfAckNotifyChangedItemState(int UserID, int[] ItemIDs, byte[] NewStates, int Result, const string& ErrMsg);
	bool sfReqNotifyChangedItemState();
	bool sfAckConfirmSkillChanged(int Result, const string& ErrMsg);
	bool sfReqConfirmSkillChanged();
	bool sfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool sfReqEquipSkill(int SkillID, int SkillUniqueID, byte NewSlotPosition);
	bool sfAckUserSkillListEnd();
	bool sfAckUserSkillList(int[] UniqueSkillID, int[] SkillID, struct FBtrDouble[] UntilTime, byte[] SlotPosition);
	bool sfAckUserSkillListStart(int Count, int Result, const string& ErrMsg);
	bool sfReqUserSkillList(int UserID);
	bool sfAckDelMemo(int Result, const string& ErrMsg, int[] FailedMemoID);
	bool sfReqDelMemo(int[] MemoIdx, byte Type);
	bool sfAckReadMemo(const string& cnameFrom, const string& Text, const string& dateRecv, const struct FBtrDouble& ItemUID);
	bool sfReqReadMemo(int MemoIdx);
	bool sfAckEndMemoList();
	bool sfAckMemoList(int[] MemoIdx, string[] cnameFrom, string[] dateRecv, string[] Text, byte[] Status, int[] UntilExpire, struct FBtrDouble[] ItemUID, int[] ItemID, byte[] MsgType, int[] ItemPartID);
	bool sfAckStartMemoList(int Result, const string& ErrMsg, byte Type, int TotalCount);
	bool sfReqMemoList(byte Type, byte MemoType);
	bool sfReqRecvMemo(const string& cnameFrom, byte MemoType);
	bool sfAckSendMemo(string[] CnamesToFail, int[] ResultArray);
	bool sfReqSendMemo(string[] cnames, const string& Msg, int ItemUID);
	bool sfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool sfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool sfReqChatWispher(const string& CharName, const string& Message);
	bool sfAckRemoveBlockUserList(int Result, const string& ErrMsg);
	bool sfReqRemoveBlockUserList(const string& CharName);
	bool sfAckAddBlockUserList(int Result, const string& ErrMsg);
	bool sfReqAddBlockUserList(const string& CharName);
	bool sfAckBlockUserListEnd();
	bool sfAckBlockUserList(string[] CharName);
	bool sfAckBlockUserListStart(int Result, int TotalCount);
	bool sfReqBlockUserList();
	bool sfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool sfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool sfReqConfirmFriendInvite(int ReqUserID, const string& ReqedCharname, byte IsPermit);
	bool sfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool sfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool sfReqSendFriendInvite(int InviteUserID, const string& InviteName, const string& InviteMsg);
	bool sfAckChatNormal(int id, const string& Sender, const string& Message, int Result);
	bool sfReqChatNormal(const string& Message);
	bool sfAckDummy(int Result);
	bool sfReqDummy(int DelayCheck);
	bool sfAckConfirmItemChanged(int Result, const string& ErrMsg);
	bool sfReqConfirmItemChanged();
	bool sfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool sfReqEquipItem(int ItemID, const struct FBtrDouble& UniqueID, int SlotPos_Key, byte SlotPos_Value);
	bool sfAckItemListEnd();
	bool sfAckItemList(struct FBtrDouble[] UniqueID, int[] ItemID, int[] ItemType, int[] Durability, struct FBtrDouble[] UntilTime, int[] SlotPosition, int[] AddPartsID, int[] DamageDegree, byte[] ItemState, int[] StackCount, int[] PaintID, int[] TradeCount);
	bool sfAckItemListStart(int Count, int Result, const string& ErrMsg);
	bool sfReqItemList(int UID);
	bool sfAckEntrySkillList(int[] UserIDs, int[] SkillIDs, int[] SlotPositions, int Result, const string& ErrMsg);
	bool sfReqEntrySkillList(int UserID);
	bool sfAckEntryItemList(int[] UserIDs, int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, struct FBtrDouble[] UniqueID, int[] PaintID, int Result, const string& ErrMsg);
	bool sfReqEntryItemList(int UserID);
	bool sfAckChangeUserState(int Result, const string& ErrMsg, int[] UserIDs, byte[] Positions, int[] Numbers, byte[] OldStates, byte[] NewStates);
	bool sfReqChangeUserState(byte NewState, byte CheckPlaying);
	bool sfAckExteriorRoomState();
	bool sfReqExteriorRoomState(int RoomNumber, byte RoomState);
	bool sfAckExteriorRoomUserCount();
	bool sfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool sfAckExteriorRoomInfo();
	bool sfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, const string& RoomName, const string& MapName, const string& ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	bool sfAckGetBootyChoose(int Result, const string& ErrMsg, byte GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, byte ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool sfAckGetBooty(int Result, const string& ErrMsg, int[] PrizeWinUserID, int[] BootyItemID, int[] BootyPartsID);
	bool sfReqGetBooty(int RoomNumber);
	bool sfAckSetUserBootySeedValue(int UserID, int Result, const string& ErrMsg);
	bool sfReqSetUserBootySeedValue(int UserID, int SeedValue);
	bool sfAckChangeRoomSetting(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool sfReqChangeRoomSetting(const struct FGameRoomInfo& RoomInfo);
	bool sfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, int[] ItemID, int[] PartID);
	bool sfAckClientUdpInfoList(int Result, const string& ErrMsg, int[] UID, string[] IP, int[] Port);
	bool sfReqClientUdpInfoList(int GameNum);
	bool sfAckRegisterOtherUdpInfo(int UID, const string& IP, int Port, byte NatType, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool sfAckRegisterMyUdpInfo(int Result, const string& ErrMsg);
	bool sfReqRegisterMyUdpInfo(byte IsHost, const string& IP, int Port, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool sfAckNotifyClientJoinTime(int Result, const string& ErrMsg);
	bool sfReqNotifyClientJoinTime(int JoinedClientID);
	bool sfAckChangeNewGuest(const string& HostIP);
	bool sfAckChangeHost(byte ClientNum);
	bool sfAckDisconnectGame(int Result, int DisconnectUserID, const string& DisconnectUserName);
	bool sfReqDisconnectGame();
	bool sfAckConnectGame(int UserID, int Result);
	bool sfReqConnectGame();
	bool sfReqRelayServerOff();
	bool sfReqRelayServerOn(const string& RelayServerIP, int RelayServerPortNum);
	bool sfAckGameOver(int UID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool sfReqGameOver(int UID, int GameRoomNumber);
	bool sfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying);
	bool sfReqIsGameRoomPlaying(int GameRoomNum);
	bool sfAckGameRoomDestroy(int GameRoomNum);
	bool sfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, const string& ErrMsg);
	bool sfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum);
	bool sfAckUpdateScoreResult(int Result, const string& ErrMsg);
	bool sfAckUpdateScore(int[] UserIDs, string[] NickNames, byte[] TeamIDs, int[] Scores, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] EXPBonuses, int[] Points, int[] PointBonuses, int[] TeamScores, int[] BonusOwnerID, int[] BonusID);
	bool sfReqUpdateScore(int GameNumber, int[] UserIDs, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] Points, int[] Scores, int[] TeamScores, int[] RoundJoin, int[] TimeJoin, int Playtime, byte GameEndType, string[] UserNames, byte IsAIClear);
	bool sfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const string& ErrMsg);
	bool sfReqStartGame(int GameNumber);
	bool sfAckGameHostInfo(int GameNumber, const string& UserID, const string& IP, int Port, int Result, const string& ErrMsg);
	bool sfReqGameHostInfo(int GameNumber);
	bool sfAckIsHostAvailable(int Result);
	bool sfReqIsHostAvailable(const string& MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam);
	bool sfAckChangeTeam(int GameNumber, const string& UserID, int UID, int TeamNum, int Result, const string& ErrMsg);
	bool sfReqChangeTeam(int TeamNum);
	bool sfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const string& ErrMsg);
	bool sfReqChangeRoomOwner(int GameNum, int UID, int NewOwner);
	bool sfAckChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum, int Result, const string& ErrMsg);
	bool sfReqChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum);
	bool sfAckBanUser(int GameNum, int UID, int BanUID, int Result, const string& ErrMsg);
	bool sfReqBanUser(int GameNum, int UID, int BanUID);
	bool sfAckSelectMap(int GameNum, int UID, const string& MapName, int Result, const string& ErrMsg);
	bool sfReqSelectMap(int GameNum, int UID, const string& MapName);
	bool sfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool sfReqGameRoomInfo(int GameNum, int UID);
	bool sfAckCreateGameRoom(int Result, const string& ErrMsg, int UserID, const string& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool sfReqCreateGameRoom(const struct FGameRoomInfo& NetRoomInfo);
	bool sfAckExceedMaxUser();
	bool sfAckLeaveRoom(int Num, int UID, const string& UserID, int Result, const string& ErrMsg);
	bool sfReqLeaveRoom(int Num);
	bool sfAckRoomUserList(int[] UID, string[] UserName, int[] Grade, int[] TeamNum, byte[] Statue, byte[] IsHost, string[] UserIP, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, byte[] IsLookingFor, int[] GMUID, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool sfReqRoomUserList(int GameNum);
	bool sfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqEnterRoom(int GameNum, const string& Password, byte RoomEnterType);
	bool sfAckRoomListEnd();
	bool sfAckRoomList(int[] GameNum, string[] Title, string[] MapName, int[] MapNum, byte[] UserCount, byte[] MaxCount, string[] ModeName, int[] ModeNum, byte[] WeaponLimit, byte[] IsTeamBalance, byte[] Status, string[] RoomOwnerIP, int[] GameMinute, string[] RoomOwnerName, byte[] IsSpecial, byte[] IsPassword, byte[] BotDifficult, byte[] BotModeUserTeamNum);
	bool sfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool sfReqRoomList(int id, int StartIndex, int Count);
	bool sfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool sfReqChannelUserList(int id, int StartIndex, int Count);
	bool sfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool sfReqLeaveChannel(int id);
	bool sfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool sfReqEnterChannel(int id);
	bool sfAckChannelList(int[] id, string[] Title, int[] CurUser, int[] MaxUser);
	bool sfReqChannelList(int bChannelType);
	bool sfAckFriendListEnd();
	bool sfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool sfAckFriendListStart(int Result, int TotalCount);
	bool sfReqFriendList();
	bool sfAckCharInfo(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, byte InClanRank, int ClanLevel);
	bool sfReqCharInfo();
	bool sfAckLogin2(int Result, const string& ErrMsg, int UserID, const string& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, byte IsGM);
	bool sfReqLogin2(const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, const string& Guid, int UserType);
	bool sfAckStartNatDiag(int NatType);
	bool sfReqStartNatDiag(const string& Server1Addr, int Server1Port, const string& Server2Addr, int Server2Port);
	bool sfReqForceLogoutByOwner();
	bool sfAckLogin(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, const struct FCharInfo& btCharInfo);
	bool sfReqLogin(const string& id);
	bool sfAckHash(int Result, const string& ErrMsg);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfReqAddSpecialRank(const string& NickName);
	bool rfAckExpandSlotConfirm(int Result, const string& ErrMsg, int QSlotID, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool rfReqExpandSlotConfirm();
	bool rfAckGP20CashModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point);
	bool rfReqGP20CashModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int[] ProductNo);
	bool rfAckCharDetailInfoWithClan(int ErrorCode, const string& CharName, int Exp, int Level, int LevelMarkID, int PreMonthlyRanking, int MonthlyRanking, int Win, int Lose, int Kill, int Death, int Assist, int KillCountByAimShooting, int HeadShot2, int TotPlayTime, int DisCon, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, int DispHeadItem, int DispFaceItem, int DispBackpack, int DispPouch, int DispCamouflage, const string& ClanName, int ClanLevel, int CM_Pattern, int CM_BG, int CM_BL, int ClanExp, byte ClanGrade, int ClanActivity, int MonthlyConnectingCount, int UserClanWin, int UserClanLose, int UserClanDraw, int ClanWin, int ClanLose, int ClanDraw, int PreClanTotalRankCur, int ClanTotalRankCur, int PreClanMonthlyRankCur, int ClanMonthlyRankCur, int PreClanMonthlyConnectingRank, int ClanMonthlyConnectingRank, const string& ClanIntro);
	bool rfReqCharDetailInfoWithClan(const string& CharName);
	bool rfAckPcBangItemList(int[] ItemTID, int[] PartID);
	bool rfReqPcBangItemList();
	bool rfReqNotifyShopPackageItemData(int PackageProductNo, int[] ProductCode, int[] ProductQuantity, int[] ProductHour, const string& Description);
	bool rfAckUseItemDuringGame(int ErrorCode, const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, int RemainCount);
	bool rfReqUseItemDuringGame(const string& CharName, int ItemID, const struct FBtrDouble& ItemUniqueID, byte UsingCount);
	bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, const struct FBtrDouble& ItemUniqueID, byte ChangeCount, int RemainCount);
	bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, const struct FBtrDouble& Coupon_ItemUniqueID, int Coupon_Count_AfterReduction);
	bool rfReqLuckShop_RewardCoupon(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState);
	bool rfReqLuckShop_RewardBuyingCount(int ChooseNum, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState);
	bool rfReqLuckShop_StorageInfo();
	bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, string[] NickName, struct FBtrDouble[] Time, int GetItemID);
	bool rfReqLuckShop_LotteryWinnerList(int CapsuleItemID);
	bool rfAckSpecialQuestRank(string[] CharList);
	bool rfReqSpecialQuestRank();
	bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount);
	bool rfReqReceiveSpecialReward(int QuestID);
	bool rfAckDailyRewardListThisMonth(byte[] Type, byte[] Number, int[] ItemID, int[] ItemCount);
	bool rfReqDailyRewardListThisMonth();
	bool rfAckPuzzleList(int Result, byte IsComplete, byte[] UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfReqPuzzleList(byte ReqType, byte UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, byte[] StateList, const struct FBtrDouble& ItemIdx, int RewardItemID, int RewardItemCount, const struct FBtrDouble& PaidItemIdx, int PaidItemStackCount);
	bool rfReqAttendanceList(byte ReqType, byte UpdateNum, byte UpdateState, const struct FBtrDouble& PaidItemIdx);
	bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, int[] ScoreRewardUserID, byte[] ScoreRewardTYPE, int[] ScoreRewardID, int[] ScoreRewardCount);
	bool rfNotifyCouponUseError(int Time);
	bool rfAckCouponUse(int Result, const string& ErrMsg);
	bool rfReqCouponUse(const string& Serial);
	bool rfReqNotifyShopItemDataEnd(int Ver);
	bool rfReqNotifyShopItemData(int[] ProductNo, string[] ProductName, int[] ProductCode, byte[] SaleType, int[] ProductCost, int[] ProductHour, int[] ProductQuantity, int[] SaleMasterFlag, int[] SaleStatus, int[] IsGift, struct FBtrDouble[] SaleEndTime, int[] Discountcost);
	bool rfAckShopItemData();
	bool rfReqShopItemData(int Ver);
	bool rfReqNotifyLoadingStatus(int Status);
	bool rfReqUpdateUserPerformenceInfo(int UserID, int MinFps, int MaxFps, int AvgFps, int MinPing, int MaxPing, int AvgPing);
	bool rfReqAhnNotifyDisconnct(int Code);
	bool rfAckAhnHsObject(byte[] Data, int DataSize);
	bool rfReqAhnHsObject(byte[] Data, int DataSize);
	bool rfNotifyClanLevelup(const string& ClanName, int Levelup);
	bool rfNotifyNewClanName(const string& New_NickName);
	bool rfNotifyNewNickName(int Community_Type, const string& Old_NickName, const string& New_NickName);
	bool rfAckGameMapData(int[] nIdx, int[] nMapID, string[] nMapNm, float[] fSupHealth, float[] fSupHeli, float[] fSupBomb, float[] fSupUAV, int[] nModFFA, int[] nModFFAMax, int[] nModTDM, int[] nModTDMMax, int[] nModSD, int[] nModSDMax, int[] nModDOM, int[] nModDOMMax, int[] nModSab, int[] nModSabMax);
	bool rfReqGameMapData();
	bool rfAckTencent_StartTenProtect(int CharDBID);
	bool rfAckMoveToLobby(byte MessageType);
	bool rfAckPopUpMessage(int MessageType);
	bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfReqSetClientVersion(int ClientVersion);
	bool rfAckFriendPosition(int Result, const string& TargetCharName, byte ServerType, const string& fServername, const string& fServerShortName, const string& fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, const string& ChannelNickName, int GameRoomNum);
	bool rfReqFriendPosition(const string& TargetCharName, byte CommunityType);
	bool rfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum);
	bool rfReqDedicateHost_Login(int ProcessID, int ChannelNum, int RoomNum);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfReqLogOut(byte Reason);
	bool rfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec);
	bool rfAckSetCommunityOption(int Result, const string& ErrStr);
	bool rfReqSetCommunityOption(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite);
	bool rfReqCommunityOptionList();
	bool rfAckNotifyUpdateCharInfo_TitleMark(const string& CharName, int TitleMarkID);
	bool rfAckNotifyUpdateCharInfo_LevelMark(const string& CharName, int LevelMarkID);
	bool rfAckGetRankingInfoListEnd();
	bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, string[] CharName, int[] CharLevel, string[] ClanName, int[] ClanMarkPattern, int[] ClanMarkBG, int[] ClanMarkBL, int[] Ranking_Accum, int[] Ranking_Accum_Prev, int[] Ranking_Accum_Exp, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount);
	bool rfReqGetRankingInfoList(byte RankingType, byte CommunityType);
	bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb);
	bool rfReqCharDetailInfo();
	bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel);
	bool rfReqInGameRoomUserInfoChanged();
	bool rfAckClanMatchResultHistory(struct FBtrDouble[] MatchDate, byte[] IsWin, string[] EnemyClanname);
	bool rfReqClanMatchResultHistory(const string& ClanNm);
	bool rfAckDeleteMailAll(int Result, byte MailType, int Count);
	bool rfReqDeleteMailAll(byte MailType);
	bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, const string& RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic);
	bool rfAckEventNotify(int Type);
	bool rfReqEventNotify();
	bool rfAckPaidItem_NotifyChangeClanname(const string& NewClanname);
	bool rfAckPaidItem_ChangeClanname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewClanname);
	bool rfReqPaidItem_ChangeClanname(const struct FBtrDouble& ItemIdx, const string& NewClanname);
	bool rfAckClanMatch_EndPublicWaitRoomList();
	bool rfAckClanMatch_PublicWaitRoomList(int[] WaitRoomIdx, string[] LeaderName, string[] RoomName, int[] MapNum, int[] CurUserCount, int[] MaxUserCount, byte[] Status);
	bool rfAckClanMatch_StartPublicWaitRoomList(int Result, const string& ErrMsg, int Count);
	bool rfReqClanMatch_GetPublicWaitRoomList();
	bool rfAckServerType(byte Type);
	bool rfReqServerType();
	bool rfAckServerShutdown(int Result, const string& ErrMsg);
	bool rfReqServerShutdown(const string& AuthKey, int SecondAfter, const struct FBtrDouble& ShutdownTime);
	bool rfAckNotifyEndTutorial(int UserID, const string& CharName, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqNotifyEndTutorial(int TutorialResultType);
	bool rfAckNotifyStartTutorial(int Result, int UserID);
	bool rfReqNotifyStartTutorial();
	bool rfAckRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostPriorityPoint);
	bool rfReqRoomUserPingInfo(int[] UnqueID, int[] Ping, int HostPriorityPoint);
	bool rfAckMyEquipedQSlotList(byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, int[] MWItemID, int[] MWPartID, int[] MWPaintID, struct FBtrDouble[] PistolUniqueID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, struct FBtrDouble[] TW1UniqueID, int[] TWItemID1, struct FBtrDouble[] TW2UniqueID, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int Result, struct FBtrDouble[] KnifeUniqueID, int[] KnifeItemID);
	bool rfReqMyEquipedQSlotList();
	bool rfAckMyEquipedSkillList(int[] SkillIDs, int[] SlotPositions, int Result);
	bool rfReqMyEquipedSkillList();
	bool rfAckMyEquipedItemList(int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, int[] PaintID, struct FBtrDouble[] UniqueID, int Result);
	bool rfReqMyEquipedItemList();
	bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount);
	bool rfReqGetMyMailBoxState();
	bool rfAckSetLookForClan(int Result, const string& ErrMsg, byte IsLookingFor);
	bool rfReqSetLookForClan(byte IsLookingFor);
	bool rfAckExteriorRoomOwnerInfo();
	bool rfReqExteriorRoomOwnerInfo(int RoomNum, const string& OwnerName, const string& OwnerIP);
	bool rfAckClanMatch_SetWaitRoomPublic(int Result, const string& ErrMsg, byte Set);
	bool rfReqClanMatch_SetWaitRoomPublic(byte Set);
	bool rfReqRemoveCheckTeamBalanceList();
	bool rfAckPaidItem_NotifyChangeClanMark(const string& ClanName, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ChangeClanMark(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfReqPaidItem_ChangeClanMark(const struct FBtrDouble& ItemIdx, byte IsPaid, int Pattern, int BG, int BL);
	bool rfAckPaidItem_ClanMarkDupCheck(int Result, const string& ErrMsg);
	bool rfReqPaidItem_ClanMarkDupCheck(byte IsPaid, int Pattern, int BG, int BL);
	bool rfAckPaidItem_RelayBroadcast(const string& CharName, const string& Msg);
	bool rfAckPaidItem_BroadCast(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfReqPaidItem_BroadCast(const struct FBtrDouble& ItemIdx, int Command, const string& Message);
	bool rfAckPaidItem_EraseRecord(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int Command, int RemainCount);
	bool rfReqPaidItem_EraseRecord(const struct FBtrDouble& ItemIdx, int Command);
	bool rfAckPaidItem_ChangeCharname(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int RemainCount, const string& NewCharname);
	bool rfReqPaidItem_ChangeCharname(const struct FBtrDouble& ItemIdx, const string& NewCharname);
	bool rfAckRecvSystemMsg(byte CommunityType, const struct FSystemMsgParam& MsgInfo);
	bool rfAckSendSystemMsg(int Result);
	bool rfReqSendSystemMsg(byte RecvType, const string& SendCharName, const string& RecvCharname, const struct FSystemMsgParam& MsgInfo);
	bool rfAckRandomBox_Use(int Result, const string& ErrMsg, const struct FBtrDouble& RandomBoxItemIdx, int RandomBxoItemCount, const struct FBtrDouble& KeyItemIdx, int KeyItemRemainCount, int[] ItemIDChoose, int[] PartIDChoose, int[] PeriodOnChoosenItem, int[] StackCountOnChoosenItem, byte[] bHave, struct FBtrDouble[] ItemIdx, struct FBtrDouble[] UntilTime, int[] StackCount);
	bool rfReqRandomBox_Use(const struct FBtrDouble& ItemIdx_RandomBox, const struct FBtrDouble& ItemIdx_Key);
	bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, const string& NewRoomTitle);
	bool rfReqChangeRoomTitle_GM(int RoomNumber, const string& NewRoomTitle);
	bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID);
	bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID);
	bool rfAckQuestGetAvailableEventList(int Result, const string& ErrMsg, int[] QuestID);
	bool rfReqQuestGetAvailableEventList();
	bool rfAckCharBlockInfo(int Result, const struct FBtrDouble& ChatBlockStartTime, const struct FBtrDouble& ChatBlockEndTime, struct FBtrDouble[] BlockedItemIdx);
	bool rfReqCharBlockInfo();
	bool rfNotifyPcBangInfo(byte PcBang_Grade);
	bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, const string& WaitRoomName);
	bool rfReqClanMatch_GetClanWaittingRoomInfo();
	bool rfAckReturnBotID(int Result);
	bool rfReqReturnBotID(int[] BotID);
	bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, int[] AFBotID, int[] RSABotID);
	bool rfReqGetBotID(byte AFCount, byte RSACount);
	bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, const string& ErrMsg, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool rfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, int[] MapNumArray, int VersusMode, byte IsPublic);
	bool rfAckParamCheckSum(int Result);
	bool rfReqParamCheckSum(const string& key, const string& Value);
	bool rfAckWebzenBillingUseStorageItem(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID, const struct FBtrDouble& ItemExtra);
	bool rfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, byte StorageItemType);
	bool rfAckWebzenBillingStorageListEnd();
	bool rfAckWebzenBillingStorageList(int[] Seq, int[] ItemSeq, int[] GroupCode, int[] ShareFlag, int[] ProductSeq, string[] CashName, struct FBtrDouble[] CashPoint, string[] SendAccountID, string[] SendMessage, byte[] ItemType, byte[] RelationType, int[] ProductType, int[] PriceSeq);
	bool rfAckWebzenBillingStorageListStart(int Result, const string& ErrMsg, int TotalCount, int TotalPage, int CurPage);
	bool rfReqWebzenBillingStorageList(int Page, int CountForPage, byte Type);
	bool rfAckGiftItemByWebzenCash(int Result, const string& ErrMsg, int LeftProductCount);
	bool rfReqGiftItemByWebzenCash(const string& ReceiverCharName, const string& Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq);
	bool rfReqGiftItemByWebzenCashGP20(const string& ReceiverCharName, const string& Message, int ProductNo, byte Cointype);
	bool rfAckBuyItemByWebzenCash(int Result, const string& ErrMsg);
	bool rfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, int[] ItemIDs, const struct FBtrDouble& ItemUniqueID, byte BuyOption1, byte BuyOption2);
	bool rfReqBuyItemByWebzenCashGP20(int ProductNo, byte Cointype, const struct FBtrDouble& ItemID);
	bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode);
	bool rfReqWebzenShopScriptVersion();
	bool rfAckWebzenCash(int Result, const string& ErrMsg, const struct FBtrDouble& PCoinCash, const struct FBtrDouble& CCoinCash);
	bool rfReqWebzenCash();
	bool rfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool rfReqRegisteredPCBangInfo();
	bool rfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool rfReqRegisterMainPCBang();
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, byte[] IsCombat, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfReqPCBangUserList();
	bool rfReqDailyQuestNewAvailable(int[] ExpiredQuestID, int[] NewQuestID);
	bool rfReqQuestNewAvailable(int[] AchivedQuestID, int[] NewQuestID, byte[] IsDailyQuest, int[] ExpiredQuest);
	bool rfAckQuestUpdate(int Result, const string& ErrMsg);
	bool rfReqQuestUpdate(int UniqueID, int GameRoomNum, int[] QuestID, int[] CountPrograss);
	bool rfAckQuestListEnd();
	bool rfAckQuestList(int[] QuestID, int[] CountPrograss, byte[] QuestType, byte[] IsComplete);
	bool rfAckQuestListStart(int Result, const string& ErrMsg);
	bool rfReqQuestList();
	bool rfAckPermanentRoomInfo(int Result, int ClanIdx, byte FixedGameMode, byte FixedMaxUserCnt);
	bool rfReqPermanentRoomInfo(int RoomNum);
	bool rfAckClanMatch_FoundMatch();
	bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber);
	bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore);
	bool rfAckClanMatch_StartSearching(int Result, const string& ErrMsg, int ShouldWaitMore);
	bool rfReqClanMatch_StartSearching(int RequestCount);
	bool rfAckLimitedListInChannel(int Result, int[] LimitedMapID, int[] LimitedModeID);
	bool rfReqLimitedListInChannel();
	bool rfAckRecvInviteGameRoomResult(int Result);
	bool rfAckRecvInviteGameRoom(const string& RoomUniqueID, int RoomNumber, byte Answer, const string& InviteCharName);
	bool rfReqRecvInviteGameRoom(const string& InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, const string& RoomUniqueID, int RoomNumber, const string& RoomName, byte RoomState, const string& MapName, const string& OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, const string& Password, const string& InviteCharName);
	bool rfAckInviteGameRoom(int Result, byte Answer, const string& GuestCharName);
	bool rfReqInviteGameRoom(const string& GuestCharName);
	bool rfAckClanMatch_StopSearching();
	bool rfReqClanMatch_StopSearching();
	bool rfAckClanMatch_ChangeLeader(int Result, const string& ErrMsg, int NewLeader, const string& NewLeaderName);
	bool rfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, const string& NewLeaderName);
	bool rfAckClanMatch_WaittingTeamList(int TtotlCount, int[] Grade, int[] Map, int[] Versus);
	bool rfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount);
	bool rfAckClanMatch_Chat(int Result, const string& ErrMsg, const string& CharName, const string& Msg);
	bool rfReqClanMatch_Chat(const string& Msg);
	bool rfAckClanMatch_LeaveNotify(const string& CharName);
	bool rfAckClanMatch_Leave(int Result, const string& ErrMsg);
	bool rfReqClanMatch_Leave(int WaittingID);
	bool rfAckClanMatch_MemberList(byte[] IsLeader, int[] ClanMarkPA, int[] ClanMarkBG, int[] ClanMarkBL, int[] Level, string[] CharName, int[] ClanGrade, int[] ClanWin, int[] ClanLose, string[] ClanName, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfReqClanMatch_MemberList();
	bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, const string& CharName, int ClanGrade, int ClanWin, int ClanLose, const string& ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfAckClanMatch_Join(int Result, const string& ErrMsg);
	bool rfReqClanMatch_Join(int WaittingID);
	bool rfReqClanMatch_InviteCrewResult(const string& Invitee, int Result);
	bool rfAckClanMatch_RecvInviteCrew(int Result, const string& Inviter);
	bool rfReqClanMatch_RecvInviteCrew(const string& Inviter, const string& ServerIP, int Port, int WaittingID, const string& Msg, int MapNum, int InviteUserChannelNum, const string& LeaderName, const string& RoomName);
	bool rfAckClanMatch_InviteCrew(int Result, const string& ErrMsg);
	bool rfReqClanMatch_InviteCrew(const string& Invitee);
	bool rfAckClanMatch_NotifiyStartCombat(int[] MapNumArray, int VersusMode);
	bool rfAckClanMatch_StartCombat(int Result, const string& ErrMsg);
	bool rfReqClanMatch_StartCombat(int[] MapNumArray, int VersusMode);
	bool rfAckClanMatch_GetReady(int Result, const string& ErrMsg, int RoomIndex);
	bool rfReqClanMatch_GetReady();
	bool rfAckAutoChangedTeamUserList(int[] UserID, int[] TeamNum);
	bool rfAckGetItemFromItemBox(int Result, const string& ErrMsg, int ItemIDChoose, int PartIDChoose, const struct FBtrDouble& BoxItemIdx, int BxoItemCount, byte bHave, const struct FBtrDouble& ItemIdx, const struct FBtrDouble& UntilTime, int StackCount);
	bool rfReqGetItemFromItemBox(const struct FBtrDouble& ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose);
	bool rfAckItemListInItemBox(int Result, const string& ErrMsg, const struct FBtrDouble& ItemUniqueID, int BoxItemID, int[] ItemID, int[] PartID, byte FromContent);
	bool rfReqItemListInItemBox(const struct FBtrDouble& ItemUniqueID, int BoxItemID, byte FromContent);
	bool rfReqRecvForceFailedClientLoading(int ErrCode);
	bool rfAckForceFailedClientLoading(int Result, const string& ErrMsg);
	bool rfReqForceFailedClientLoading(int FailedUserID, int ErrCode);
	bool rfAckStartHolePunching(int Result, const string& ErrMsg, int GameType, int ReqStartUserID);
	bool rfReqStartHolePunching(int GameType, int ReqStartUserID);
	bool rfAckNotifyMyCharInfoToRoomUser(int Result, const string& ErrMsg, int UID, const string& UserName, int Grade, int TeamNum, byte Statue, byte IsHost, const string& UserIP, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor);
	bool rfReqNotifyMyCharInfoToRoomUser();
	bool rfReqNotifyDurabilityZeroItem(int Result, const string& ErrMsg, int UserID, struct FBtrDouble[] ItemUniqueIDs, int[] ItemIDs, int[] ItemPartIDs, byte[] ItemSlotPos);
	bool rfAckChatWispherMyCommunity(int Result, const string& ErrMsg);
	bool rfReqChatWispherMyCommunity(const string& SourceCharName, const string& SenderName, const string& Msg);
	bool rfReqNotifyDisconnectHostInLoading(int Result, const string& ErrMsg, int HostID);
	bool rfReqRecvForceDisconnected_FromGM(int Result, const string& ErrMsg);
	bool rfAckForceDisconnectUser_GM(int Result, const string& ErrMsg, const string& CharName);
	bool rfReqForceDisconnectUser_GM(const string& CharName);
	bool rfReqRecvNotice_FromGM(int Result, const string& ErrMsg, string[] NoticeMsg, byte IsFromDB);
	bool rfAckNotice_GM(int Result, const string& ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool rfReqNotice_GM(byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, const string& Msg);
	bool rfAckSpecificChannelUserInfo(int UID, const string& UserID, int UserLevels, const string& ClanName, int ClanPattern, int ClanBG, int ClanBL, int Result, const string& ErrMsg, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqSpecificChannelUserInfo(int UserID);
	bool rfAckSpecificGameRoomInfo(int Result, int GameNum, const string& Title, const string& MapName, int MapNum, byte UserCount, byte MaxCount, const string& GameModeName, int ModeNum, byte WeaponLimit, byte IsHardCore, byte Status, const string& RoomOwnerIP, int GameMinute, const string& RoomOwnerName, byte IsSpecial, byte IsPassword);
	bool rfReqSpecificGameRoomInfo(int RoomNum);
	bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, int[] UID, string[] CharName, int[] UserLevel, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, byte[] IsLookForClan, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count);
	bool rfReqRecvDeleteFriend(int Result, const string& FromCharName);
	bool rfAckDeleteFriend(int Result, string[] FailedCharname);
	bool rfReqDeleteFriend(string[] DeleteCharName);
	bool rfAckGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool rfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3);
	bool rfAckCheckEquipedWeaponDurability(int Result, struct FBtrDouble[] ItemUniqueID, int[] ItemSlotNum);
	bool rfReqCheckEquipedWeaponDurability();
	bool rfReqGamePlay_GetChopper(int GetChopperUID, int[] GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, const string& ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord);
	bool rfAckAcquirePromotionItems(int UID, int Result, const string& ErrMsg, struct FBtrDouble[] ItemUniqueID, int[] ItemIDs, int[] PartIDs);
	bool rfAckIsAvailClanURL(const string& ClanURL, int Result, const string& ErrMsg);
	bool rfReqIsAvailClanURL(const string& ClanURL);
	bool rfAckGetIsHostBlocking(int Result, byte Blocking);
	bool rfReqGetIsHostBlocking();
	bool rfAckNotifyHostBlocking(int Result, byte Blocking);
	bool rfReqNotifyHostBlocking(byte Blocking);
	bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, int[] FailedUserIDs);
	bool rfReqGetHolePunchingResult();
	bool rfReqNotifyRecvDummyForHolePunching(int ClientUserID, byte Phrase);
	bool rfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber);
	bool rfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore);
	bool rfReqNotifyRelayServerAddr(const string& RelayIP, int RelayPort);
	bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint);
	bool rfReqGetUserHostPriorityPoint(int UserID);
	bool rfReqUpdateMyHostPriorityPoint(int HostPriorityPoint);
	bool rfReqWriteServerLog(byte Destination, const string& LogMsg);
	bool rfReqGamePlay_SetRoundStartTime(int[] UID);
	bool rfReqGamePlay_SetGameStartTime(int[] UID);
	bool rfReqRecvForceDisconnectUDPFromHost(int Result);
	bool rfAckForceDisconnectUDPFromHost(int Result);
	bool rfReqForceDisconnectUDPFromHost(int UserID);
	bool rfReqGamePlay_TakeAPoint(int[] TakerUID, byte TakePos, float[] TakerXCoord, float[] TakerYCoord, float[] TakerZCoord, int[] TakerPos, int[] TakerWeaponID, int[] TakerWeaponPartID, int[] TakerRange);
	bool rfReqNotifyChangeRoomState(byte RoomState);
	bool rfReqGamePlay_DefuseBomb(int DefuserUID, byte DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange);
	bool rfReqGamePlay_InstallBomb(int InstallerUID, byte InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange);
	bool rfAckDBCharInfo(int Result, const string& ErrMsg, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const string& ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, const struct FCharInfo& stCharInfo, int ClanLevel);
	bool rfReqDBCharInfo(const string& CharName);
	bool rfReqForceNatTypeSetting(int NatType);
	bool rfAckGetServerTime(const struct FBtrDouble& ServerTime, const string& ClientIP);
	bool rfReqGetServerTime();
	bool rfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, byte VTeam, byte VTeamAD, int AFScore, int RSAScore, int Round);
	bool rfReqLogGetScore(const struct FKillDeathLog& KillDeathLogParam, int[] AssistUIDs, byte[] AssistScores);
	bool rfAckAuctionTradeHistory(int Result, const string& ErrMsg, int ItemID, int PartID, string[] SellerCharNm, int[] DamageDegree, int[] Price);
	bool rfReqAuctionTradeHistory(int ItemID, int PartID);
	bool rfAckSendGift(int Result, const string& ErrMsg, int PointRemain, int CashRemain);
	bool rfReqSendGift(int ItemID, const string& RecvCharname, const string& RecvMessage, byte BuyOption1, byte BuyOption2);
	bool rfAckGetAttachedItemFromMemo(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int ItemID);
	bool rfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID);
	bool rfAckNotifyNewClanMember(const string& ClanName, const string& CharName);
	bool rfAckChatClan(const string& CharName, const string& Message, int Result);
	bool rfReqChatClan(const string& Message);
	bool rfAckTestDouble(const struct FBtrDouble& vDouble, struct FBtrDouble[] vDoubles);
	bool rfReqTestDouble(const struct FBtrDouble& vDouble, struct FBtrDouble[] vDoubles);
	bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState);
	bool rfReqNotifyLoadingState(byte LoadingState);
	bool rfAckFailedStartGame(int Result, const string& ErrMsg, byte IsHost, int FailedUserID, int LoadingStep);
	bool rfReqFailedStartGame(int LoadingStep);
	bool rfAckSuccessStartGame(int Result, const string& ErrMsg, byte IsHost, const string& HostIP, int HostPort, int LoadingStep);
	bool rfReqSuccessStartGame(int LoadingStep);
	bool rfAckClanCharPersonelIntro(int Result, const string& ErrMsg, const string& PersonelIntro);
	bool rfReqClanCharPersonelIntro(const string& ClanName, const string& CharName);
	bool rfAckClanPersonelIntro(int Result, const string& ErrMsg);
	bool rfReqClanPersonelIntro(const string& ClanName, const string& CharName, const string& PersonelIntro);
	bool rfAckClanChangeInfo(int Result, const string& ErrMsg);
	bool rfReqClanChangeInfo(const string& ClanName, byte IsRecruit, byte Region, const string& Keyword, const string& ClanIntro, const string& Notice);
	bool rfAckClanClose(int Result, const string& ErrMsg, const string& ClanName);
	bool rfReqClanClose(const string& ClanName);
	bool rfAckNotifyClanSecession(const string& ClanName, const string& CharName);
	bool rfAckClanSecession(int Result, const string& ErrMsg);
	bool rfReqClanSecession(const string& ClanName);
	bool rfAckClanNews(string[] IssueDate, byte[] IssueType, string[] IssuedClanMember);
	bool rfReqClanNews(const string& ClanName);
	bool rfAckNotifyAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckAdjustClanMemberGrade(int Result, const string& ErrMsg, const string& ClanName, const string& CharName, byte CharGrade);
	bool rfReqAdjustClanMemberGrade(const string& ClanName, const string& CharName, byte CharGrade);
	bool rfAckClanUserListEnd();
	bool rfAckClanUserList(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, int[] ClanWinCnt, int[] ClanLoseCnt, int[] LevelMarkID, int[] TitleMarkID, int[] DudeId);
	bool rfAckClanUserListStart(int Result, int TotalCount);
	bool rfReqClanUserList(const string& ClanName);
	bool rfAckSearchClan(int Result, const string& ErrMsg, int TotalPage, int[] ClanMarkPattern, int[] ClanMarkBG, byte[] ClanMarkBL, string[] ClanName, string[] ClanMaster, int[] ClanMember, int[] ClanMemberMax, int[] ClanCreateDate, int[] ClanWin, int[] ClanLose, int[] ClanDraw, int[] ClanRank, byte[] ClanRecruit, int[] ClanLevel);
	bool rfReqSerachClan(byte SearchType, const string& Keyword, byte ClanStatus, byte ClanRegion, int ReqPage);
	bool rfAckJoinClanResult(const string& ClanName, byte Permit, const string& PermitCharName);
	bool rfAckRecvJoinClanResult(int Result, const string& ErrMsg);
	bool rfAckRecvJoinClan(int UserIdx, const string& CharName, const string& ReqMsg, byte Permit);
	bool rfReqRecvJoinClan(int UserIdx, const string& CharName, const string& Message);
	bool rfAckJoinClan(int Result, const string& ErrMsg, const string& SpecificCharName, const string& RealRecvCharName, byte RealRecvCharClanGrade);
	bool rfReqJoinClan(const string& ClanName, const string& ClanManagerName, const string& Message);
	bool rfAckInviteClanResult(const string& CharName, byte Permit, const string& ClanNm);
	bool rfAckRecvClanInviteResult(int Result, const string& ErrMsg);
	bool rfAckRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& InviterMsg, const string& ClanName, byte Permit);
	bool rfReqRecvClanInvite(int InviterUserDBID, const string& InviterCharname, const string& ClanName, const string& InviteMsg);
	bool rfAckInviteClan(int Result, const string& ErrMsg);
	bool rfReqInviteClan(const string& CharName, const string& InviteMsg);
	bool rfAckClanInfo(const struct FClanInfo& stClanInfo);
	bool rfReqClanInfo(const string& ClanName);
	bool rfAckCreateClan(int Result, const string& ErrMsg, const struct FBtrDouble& ItemIdx, int StackCount);
	bool rfReqCreateClan(const string& ClanName, const string& ClanURL, const string& ClanIntro, const string& ClanKeyword, byte ClanRegion);
	bool rfAckDupCheckClanName(int Result, const string& ErrMsg);
	bool rfReqDupCheckClanName(const string& ClanNam);
	bool rfAckSellShopItemInfo(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueItemID, int SellPoint, int CurPoint, int AfterPoint);
	bool rfReqSellShopItemInfo(const struct FBtrDouble& UniqueItemID, int Count);
	bool rfAckGameOverEnd(int Result, const string& ErrMsg);
	bool rfReqGameOverEnd();
	bool rfAckAuctionItemListCount(int Result, const string& ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count);
	bool rfReqAuctionItemListCount(byte Section, byte Classfy, int ItemType, int ItemGrade);
	bool rfAckServerTime(int Time);
	bool rfReqServerTime();
	bool rfAckEntryQSlotIDList(int UserNum, byte[] QSlotDispOrder, int[] MWItemID, int[] MWPartID, int[] MWPaintID, int[] PistolItemID, int[] PistolPartID, int[] PistolPaintID, int[] TWItemID1, int[] TWItemID2, int[] Skill1ID, int[] Skill2ID, int[] Skill3ID, int[] Skill4ID, int[] KWItemID);
	bool rfReqEntryQSlotIDList(int UserNum);
	bool rfAckEntryQSlotUniqueIDList(int UserNum, byte[] QSlotDispOrder, struct FBtrDouble[] MWUniqueID, struct FBtrDouble[] PistolUniqueID, struct FBtrDouble[] TW1UniqueID, struct FBtrDouble[] TW2UniqueID, struct FBtrDouble[] KnifeUniqueID);
	bool rfReqEntryQSlotUniqueIDList(int UserNum);
	bool rfAckAuctionBidding(int Result, const string& ErrMsg, int PointRemain);
	bool rfReqAuctionBidding(int UniqueID, int BiddingPrice);
	bool rfAckAuctionInstantlyBuying(int Result, const string& ErrMsg, int PointRemain);
	bool rfReqAuctionInstantlyBuying(int UniqueID);
	bool rfAckAuctionItemListEnd(byte Section);
	bool rfAckAuctionItemList(byte Section, int[] UniqueIDs, int[] ItemIDs, int[] AddPartsIDs, struct FBtrDouble[] UntilTimes, int[] BiddingPrices, int[] InstantlyByuingPrices, int[] ItemDamageds, string[] HighestBidderNames, string[] SellerNames, int[] ItemCount);
	bool rfAckAuctionItemListStart(int Result, const string& ErrMsg, byte Section, int PageNum, int Count);
	bool rfReqAuctionItemList(byte Section, const string& Keyword, int ItemRank, byte ItemClassfy, byte IsAvailable, int PageNum, int Count, int SortOpt);
	bool rfAckAuctionMyItemCancel(int Result, const string& ErrMsg);
	bool rfReqAuctionMyItemCancel(int UniqueID);
	bool rfAckAuctionMyItemRegister(int Result, const string& ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain);
	bool rfReqAuctionMyItemRegister(const struct FBtrDouble& UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice);
	bool rfAckMyMoney(int Result, const string& ErrMsg, int Point, int Cash);
	bool rfReqMyMoney();
	bool rfAckUpdateQSlot_2(int Result, const string& ErrMsg, byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool rfReqUpdateQSlot_2(byte[] DisplayOrder, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos_Key, byte[] SlotPos_Value);
	bool rfAckUpdateQSlot(int Result, const string& ErrMsg);
	bool rfReqUpdateQSlot(int QSlotID, const string& QSlotName, const struct FBtrDouble& MWItemID, const struct FBtrDouble& PistolItemID, const struct FBtrDouble& TWItemID1, const struct FBtrDouble& TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, const struct FBtrDouble& KnifeItemID);
	bool rfAckQSlotList_2(int Result, const string& ErrMsg, byte[] QSlotDispOrder, int[] QSlotIDX, int[] ItemTID, struct FBtrDouble[] ItemUID, byte[] SlotPos);
	bool rfReqQSlotList_2();
	bool rfAckQSlotList(int Result, const string& ErrMsg, int[] QSlotID, string[] QSlotName, byte[] QSlotDispOrder, struct FBtrDouble[] MWItemID, struct FBtrDouble[] PistolItemID, struct FBtrDouble[] TWItemID1, struct FBtrDouble[] TWItemID2, int[] Skill1, int[] Skill2, int[] Skill3, int[] Skill4, struct FBtrDouble[] KnifeItemID);
	bool rfReqQSlotList();
	bool rfAckRepairItem(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int RepairCost, int[] DamageDegree);
	bool rfReqRepairItem(struct FBtrDouble[] UniqueItemID);
	bool rfAckRepairCost(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] RepairCost);
	bool rfReqRepairCost(struct FBtrDouble[] UniqueItemID);
	bool rfAckUpdateWeaponDurability(int Result, const string& ErrMsg, struct FBtrDouble[] UniqueItemID, int[] Durability, byte[] IsDestroy, struct FBtrDouble[] FailedWeaponUniqueID);
	bool rfReqUpdateWeaponDurability(int TotalPlayTime, int[] OwnerID, int[] Number, struct FBtrDouble[] UniqueItemID, int[] UsingSec, int[] UsingRoundInSD);
	bool rfAckModifyWeapon(int Result, const string& ErrMsg, const struct FBtrDouble& UniqueID, int AddPartID, int PaintID, int Point, int Cash);
	bool rfReqModifyWeapon(const struct FBtrDouble& UniqueID, int AddPartID, int PaintID);
	bool rfAckSellShopItem(int Result, const string& ErrMsg, int PointRemain, int CashRemain, int Count);
	bool rfReqSellShopItem(const struct FBtrDouble& ItemUniqueID, int Count);
	bool rfAckBuyShopItem(int ItemCount, int[] Result, int[] BoughtItemTypeID, struct FBtrDouble[] BoughtItemUniqueID, int[] BoughtPartID, struct FBtrDouble[] BoughtUntilTIme, int[] BoughtStackCnt, int PointRemain, int CashRemain);
	bool rfReqBuyShopItem(int ItemID, const struct FBtrDouble& ItemUniqueID, byte BuyOption1, byte BuyOption2);
	bool rfAckShopItemListEnd();
	bool rfAckShopItemList(int[] ItemID);
	bool rfAckShopItemListStart(int Count);
	bool rfReqShopItemList();
	bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfReqForceGameOver();
	bool rfAckGiveSkill(int SkillID, int Result, const string& ErrMsg);
	bool rfReqGiveSkill();
	bool rfAckNotifyExpiredItemIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfReqNotifyExpiredItemIDs();
	bool rfAckNotifyExpiredSkillIDs(byte[] DisplayOrder, byte[] SlotPos, int[] ItemTID, struct FBtrDouble[] ItemUID);
	bool rfReqNotifyExpiredSkillIDs();
	bool rfAckNotifyChangedSkillState(int UserID, int[] SkillIDs, byte[] NewStates, int Result, const string& ErrMsg);
	bool rfReqNotifyChangedSkillState();
	bool rfAckNotifyChangedItemState(int UserID, int[] ItemIDs, byte[] NewStates, int Result, const string& ErrMsg);
	bool rfReqNotifyChangedItemState();
	bool rfAckConfirmSkillChanged(int Result, const string& ErrMsg);
	bool rfReqConfirmSkillChanged();
	bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfReqEquipSkill(int SkillID, int SkillUniqueID, byte NewSlotPosition);
	bool rfAckUserSkillListEnd();
	bool rfAckUserSkillList(int[] UniqueSkillID, int[] SkillID, struct FBtrDouble[] UntilTime, byte[] SlotPosition);
	bool rfAckUserSkillListStart(int Count, int Result, const string& ErrMsg);
	bool rfReqUserSkillList(int UserID);
	bool rfAckDelMemo(int Result, const string& ErrMsg, int[] FailedMemoID);
	bool rfReqDelMemo(int[] MemoIdx, byte Type);
	bool rfAckReadMemo(const string& cnameFrom, const string& Text, const string& dateRecv, const struct FBtrDouble& ItemUID);
	bool rfReqReadMemo(int MemoIdx);
	bool rfAckEndMemoList();
	bool rfAckMemoList(int[] MemoIdx, string[] cnameFrom, string[] dateRecv, string[] Text, byte[] Status, int[] UntilExpire, struct FBtrDouble[] ItemUID, int[] ItemID, byte[] MsgType, int[] ItemPartID);
	bool rfAckStartMemoList(int Result, const string& ErrMsg, byte Type, int TotalCount);
	bool rfReqMemoList(byte Type, byte MemoType);
	bool rfReqRecvMemo(const string& cnameFrom, byte MemoType);
	bool rfAckSendMemo(string[] CnamesToFail, int[] ResultArray);
	bool rfReqSendMemo(string[] cnames, const string& Msg, int ItemUID);
	bool rfReqRecvChatWispher(const string& CharnameFrom, const string& Message);
	bool rfAckChatWispher(int Result, const string& ErrMsg, const string& ToCharName);
	bool rfReqChatWispher(const string& CharName, const string& Message);
	bool rfAckRemoveBlockUserList(int Result, const string& ErrMsg);
	bool rfReqRemoveBlockUserList(const string& CharName);
	bool rfAckAddBlockUserList(int Result, const string& ErrMsg);
	bool rfReqAddBlockUserList(const string& CharName);
	bool rfAckBlockUserListEnd();
	bool rfAckBlockUserList(string[] CharName);
	bool rfAckBlockUserListStart(int Result, int TotalCount);
	bool rfReqBlockUserList();
	bool rfReqCompleteFriendInvite(const string& CharnameToBeInvited, byte IsPermit);
	bool rfAckConfirmFriendInvite(int Result, const string& ErrMsg);
	bool rfReqConfirmFriendInvite(int ReqUserID, const string& ReqedCharname, byte IsPermit);
	bool rfReqRecvFriendInvite(int ReqUserID, const string& ReqCharname, const string& InviteMsg);
	bool rfAckSendFriendInvite(int Result, const string& ErrMsg);
	bool rfReqSendFriendInvite(int InviteUserID, const string& InviteName, const string& InviteMsg);
	bool rfAckChatNormal(int id, const string& Sender, const string& Message, int Result);
	bool rfReqChatNormal(const string& Message);
	bool rfAckDummy(int Result);
	bool rfReqDummy(int DelayCheck);
	bool rfAckConfirmItemChanged(int Result, const string& ErrMsg);
	bool rfReqConfirmItemChanged();
	bool rfAckEquipItem(int ChangedNewItemID, const struct FBtrDouble& ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, const struct FBtrDouble& ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, const string& ErrMsg);
	bool rfReqEquipItem(int ItemID, const struct FBtrDouble& UniqueID, int SlotPos_Key, byte SlotPos_Value);
	bool rfAckItemListEnd();
	bool rfAckItemList(struct FBtrDouble[] UniqueID, int[] ItemID, int[] ItemType, int[] Durability, struct FBtrDouble[] UntilTime, int[] SlotPosition, int[] AddPartsID, int[] DamageDegree, byte[] ItemState, int[] StackCount, int[] PaintID, int[] TradeCount);
	bool rfAckItemListStart(int Count, int Result, const string& ErrMsg);
	bool rfReqItemList(int UID);
	bool rfAckEntrySkillList(int[] UserIDs, int[] SkillIDs, int[] SlotPositions, int Result, const string& ErrMsg);
	bool rfReqEntrySkillList(int UserID);
	bool rfAckEntryItemList(int[] UserIDs, int[] ItemIDs, int[] SlotPositions, int[] AddPartsID, struct FBtrDouble[] UniqueID, int[] PaintID, int Result, const string& ErrMsg);
	bool rfReqEntryItemList(int UserID);
	bool rfAckChangeUserState(int Result, const string& ErrMsg, int[] UserIDs, byte[] Positions, int[] Numbers, byte[] OldStates, byte[] NewStates);
	bool rfReqChangeUserState(byte NewState, byte CheckPlaying);
	bool rfAckExteriorRoomState();
	bool rfReqExteriorRoomState(int RoomNumber, byte RoomState);
	bool rfAckExteriorRoomUserCount();
	bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount);
	bool rfAckExteriorRoomInfo();
	bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, const string& RoomName, const string& MapName, const string& ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum);
	bool rfAckGetBootyChoose(int Result, const string& ErrMsg, byte GiveType, const struct FBtrDouble& ItemUniqueNumber, int ItemID, int PartID, byte ItemType, const struct FBtrDouble& UntilTime, int StackCount, int PaintID);
	bool rfAckGetBooty(int Result, const string& ErrMsg, int[] PrizeWinUserID, int[] BootyItemID, int[] BootyPartsID);
	bool rfReqGetBooty(int RoomNumber);
	bool rfAckSetUserBootySeedValue(int UserID, int Result, const string& ErrMsg);
	bool rfReqSetUserBootySeedValue(int UserID, int SeedValue);
	bool rfAckChangeRoomSetting(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqChangeRoomSetting(const struct FGameRoomInfo& RoomInfo);
	bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, int[] ItemID, int[] PartID);
	bool rfAckClientUdpInfoList(int Result, const string& ErrMsg, int[] UID, string[] IP, int[] Port);
	bool rfReqClientUdpInfoList(int GameNum);
	bool rfAckRegisterOtherUdpInfo(int UID, const string& IP, int Port, byte NatType, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool rfAckRegisterMyUdpInfo(int Result, const string& ErrMsg);
	bool rfReqRegisterMyUdpInfo(byte IsHost, const string& IP, int Port, byte Intervention, const string& HostInnerIP, int HostInnerPort);
	bool rfAckNotifyClientJoinTime(int Result, const string& ErrMsg);
	bool rfReqNotifyClientJoinTime(int JoinedClientID);
	bool rfAckChangeNewGuest(const string& HostIP);
	bool rfAckChangeHost(byte ClientNum);
	bool rfAckDisconnectGame(int Result, int DisconnectUserID, const string& DisconnectUserName);
	bool rfReqDisconnectGame();
	bool rfAckConnectGame(int UserID, int Result);
	bool rfReqConnectGame();
	bool rfReqRelayServerOff();
	bool rfReqRelayServerOn(const string& RelayServerIP, int RelayServerPortNum);
	bool rfAckGameOver(int UID, int GameRoomNumber, int Result, const string& ErrMsg);
	bool rfReqGameOver(int UID, int GameRoomNumber);
	bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying);
	bool rfReqIsGameRoomPlaying(int GameRoomNum);
	bool rfAckGameRoomDestroy(int GameRoomNum);
	bool rfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, const string& ErrMsg);
	bool rfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum);
	bool rfAckUpdateScoreResult(int Result, const string& ErrMsg);
	bool rfAckUpdateScore(int[] UserIDs, string[] NickNames, byte[] TeamIDs, int[] Scores, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] EXPBonuses, int[] Points, int[] PointBonuses, int[] TeamScores, int[] BonusOwnerID, int[] BonusID);
	bool rfReqUpdateScore(int GameNumber, int[] UserIDs, int[] Kills, int[] Assists, int[] Deaths, int[] EXPs, int[] Points, int[] Scores, int[] TeamScores, int[] RoundJoin, int[] TimeJoin, int Playtime, byte GameEndType, string[] UserNames, byte IsAIClear);
	bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, const string& ErrMsg);
	bool rfReqStartGame(int GameNumber);
	bool rfAckGameHostInfo(int GameNumber, const string& UserID, const string& IP, int Port, int Result, const string& ErrMsg);
	bool rfReqGameHostInfo(int GameNumber);
	bool rfAckIsHostAvailable(int Result);
	bool rfReqIsHostAvailable(const string& MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam);
	bool rfAckChangeTeam(int GameNumber, const string& UserID, int UID, int TeamNum, int Result, const string& ErrMsg);
	bool rfReqChangeTeam(int TeamNum);
	bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, const string& ErrMsg);
	bool rfReqChangeRoomOwner(int GameNum, int UID, int NewOwner);
	bool rfAckChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum, int Result, const string& ErrMsg);
	bool rfReqChangeGameMode(int GameNum, int UID, const string& GameMode, byte GameModeNum);
	bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, const string& ErrMsg);
	bool rfReqBanUser(int GameNum, int UID, int BanUID);
	bool rfAckSelectMap(int GameNum, int UID, const string& MapName, int Result, const string& ErrMsg);
	bool rfReqSelectMap(int GameNum, int UID, const string& MapName);
	bool rfAckGameRoomInfo(int Result, const string& ErrMsg, const struct FGameRoomInfo& RoomInfo);
	bool rfReqGameRoomInfo(int GameNum, int UID);
	bool rfAckCreateGameRoom(int Result, const string& ErrMsg, int UserID, const string& RoomOwnerIP, const struct FGameRoomInfo& NetRoomInfo);
	bool rfReqCreateGameRoom(const struct FGameRoomInfo& NetRoomInfo);
	bool rfAckExceedMaxUser();
	bool rfAckLeaveRoom(int Num, int UID, const string& UserID, int Result, const string& ErrMsg);
	bool rfReqLeaveRoom(int Num);
	bool rfAckRoomUserList(int[] UID, string[] UserName, int[] Grade, int[] TeamNum, byte[] Statue, byte[] IsHost, string[] UserIP, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, byte[] IsLookingFor, int[] GMUID, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfReqRoomUserList(int GameNum);
	bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, const string& UserID, int TeamNum, int Grade, const string& UserIP, const string& ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqEnterRoom(int GameNum, const string& Password, byte RoomEnterType);
	bool rfAckRoomListEnd();
	bool rfAckRoomList(int[] GameNum, string[] Title, string[] MapName, int[] MapNum, byte[] UserCount, byte[] MaxCount, string[] ModeName, int[] ModeNum, byte[] WeaponLimit, byte[] IsTeamBalance, byte[] Status, string[] RoomOwnerIP, int[] GameMinute, string[] RoomOwnerName, byte[] IsSpecial, byte[] IsPassword, byte[] BotDifficult, byte[] BotModeUserTeamNum);
	bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex);
	bool rfReqRoomList(int id, int StartIndex, int Count);
	bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, int[] UID, string[] UserID, int[] UserLevels, string[] ClanName, int[] ClanPattern, int[] ClanBG, int[] ClanBL, int[] ClanGrade, int[] ClanWin, int[] ClanLose, byte[] IsLookForClan, int Result, const string& ErrMsg, int[] ClanLevel, int[] LevelMarkID, int[] TitleMarkID, int[] Reserved1, int[] Reserved2, int[] Reserved3);
	bool rfReqChannelUserList(int id, int StartIndex, int Count);
	bool rfAckLeaveChannel(int Result, const string& UserID, int UID);
	bool rfReqLeaveChannel(int id);
	bool rfAckEnterChannel(int id, int UID, const string& UserID, int Level, const string& ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, const string& ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
	bool rfReqEnterChannel(int id);
	bool rfAckChannelList(int[] id, string[] Title, int[] CurUser, int[] MaxUser);
	bool rfReqChannelList(int bChannelType);
	bool rfAckFriendListEnd();
	bool rfAckFriendList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] LevelMarkID, int[] ClanLevel, int[] Level, byte[] IsLookForClan);
	bool rfAckFriendListStart(int Result, int TotalCount);
	bool rfReqFriendList();
	bool rfAckCharInfo(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, int CM_Pattern, int CM_BG, int CM_BL, const struct FCharInfo& stCharInfo, byte InClanRank, int ClanLevel);
	bool rfReqCharInfo();
	bool rfAckLogin2(int Result, const string& ErrMsg, int UserID, const string& CharName, const struct FBtrDouble& CurServerTime, int CharDBID, byte IsGM);
	bool rfReqLogin2(const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, const string& Guid, int UserType);
	bool rfAckStartNatDiag(int NatType);
	bool rfReqStartNatDiag(const string& Server1Addr, int Server1Port, const string& Server2Addr, int Server2Port);
	bool rfReqForceLogoutByOwner();
	bool rfAckLogin(int Result, const string& ErrMsg, int UserID, const string& CharName, const string& ClanName, const struct FCharInfo& btCharInfo);
	bool rfReqLogin(const string& id);
	bool rfAckHash(int Result, const string& ErrMsg);
	bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	bool Close();
	bool ConnectDomain(const string& domain, int nPort);
	bool Connect(const string& sIpaddr, int nPort);
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
	byte                                               Padding00[0x8];                                           // 0x0050(0x0008) MISSED OFFSET

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
	string                                             ChannelServerIP;                                          // 0x002C(0x000C) (NeedCtorLink)
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
	bool InitNetwork(const string& ServerIP, int serverPort);
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
	bool sfReqLoginWithIndonesia(const string& HashValue);
	bool sfAckLoginWithGlobal(int Result);
	bool sfReqLoginWithGlobal(const string& G_AccountID, const string& G_GUID, const string& G_AuthKey, int UserType);
	bool sfAckLoginWithThailand(int Result);
	bool sfReqLoginWithThailand(const string& USN, int BloodDisplayType, int PCBangType, const string& UnixTimeStamp, const string& HashValue, byte Sex);
	bool sfAckLogOut(byte Result, byte Reason);
	bool sfReqLogOut(byte Reason);
	bool sfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool sfReqLoginWithTencentAuth(const string& AccountID, byte[] Signature);
	bool sfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec);
	bool sfAckEventNotify(int Type);
	bool sfReqEventNotify();
	bool sfAckErrorReportServerAddr(const string& Addr, int Port);
	bool sfReqErrorReportServerAddr();
	bool sfAckClientChecksum(int Result);
	bool sfReqClientChecksum(const string& Key1, const struct FBtrDouble& Key2);
	bool sfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	bool sfReqClientChallenge();
	bool sfAckServerTime(int Time);
	bool sfReqServerTime();
	bool sfAckGetCharBlockInfo(int Result, byte IsAccountBlock, byte IsChattingBlock, const struct FBtrDouble& ChattingBlockEndTime, string[] BlockedItemName);
	bool sfReqGetCharBlockInfo();
	bool sfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool sfReqRegisterMainPCBang();
	bool sfAckPCBangUserListEnd();
	bool sfAckPCBangUserList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose);
	bool sfAckPCBangUserListStart(int Result, int TotalCount);
	bool sfReqPCBangUserList();
	bool sfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool sfReqRegisteredPCBangInfo();
	bool sfAckCharInfo(int Result, const string& CharName, int Level, int Exp, const string& ClanName);
	bool sfReqCharInfo(const string& CharName);
	bool sfReqForceLogoutByOwner();
	bool sfReqKeepAlive();
	bool sfAckMaxUserExceed();
	bool sfAckClanMemberListFromClientEnd();
	bool sfAckClanMemberListFromClient(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, string[] ServerName, string[] ServerShortName, string[] ServerIP, int[] serverPort, byte[] CurPos, int[] ChannelNum, string[] ChannelNickName, int[] GameRoomNum);
	bool sfAckClanMemberListFromClientStart(int Result, int TotalCount);
	bool sfReqClanMemberListFromClient();
	bool sfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool sfReqLoginWithWZAuth(const string& AccountID, const string& Guid, const string& AuthKey);
	bool sfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool sfReqProcessPreLoginUser(const string& CharName, byte Type);
	bool sfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool sfReqLoginInHouseTest(const string& UserName, const string& Password, const string& Guid);
	bool sfAckAdvertisement(int Result, byte Type, const string& Address);
	bool sfReqAdvertisement();
	bool sfAckUserDetailInfo(int Result, const string& UserName, const string& ClanName, int Ranking, int MatchNum, int WinNum, int LoseNum, int CurrentEXP, int NextExp, int ForcedDisconnectedNum, int PrimaryWeaponID, int SubWeaponID, int Point);
	bool sfReqUserDetailInfo(int UserID, const string& UserName);
	bool sfAckFriendsListEnd();
	bool sfAckFriendsList(byte ListType, string[] UserName, byte[] IsLogOn, int[] CMarkPattern, int[] CMarkBG, int[] CMarkBL, string[] ClanName, int[] Level);
	bool sfAckFriendsListStart(int Result, int TotalCount);
	bool sfReqFriendsList();
	bool sfAckConnectChannelServer(const string& SessionKey, int TimeStamp);
	bool sfReqConnectChannelServer(const string& ServerIP, int serverPort);
	bool sfAckServerList(string[] CServername, string[] CServerShortName, string[] ServerIP, int[] serverPort, string[] ChannelName, string[] ChannelNickName, int[] ChannelNum, int[] chMaxUser, int[] chCurUser, string[] ServerGroupName, int[] ServerGroupID, int[] ServerDispOrder, int[] DataPort, byte[] OptionCount_byte, byte[] OptionKey_byte, byte[] OptionValue_byte, byte[] OptionCount_int, byte[] OptionKey_int, int[] OptionValue_int, byte[] OptionCount_float, byte[] OptionKey_float, float[] OptionValue_float, byte[] IsClanChannel, byte[] IsUseDedicateHost);
	bool sfReqServerList();
	bool sfAckCreateChar(int Success, const string& ErrMsg);
	bool sfReqCreateChar(const string& CharName, int HeadItemID, int HelmetItemID, int AccesoItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID);
	bool sfAckAccesItemTypeList(string[] AccesoItemName, int[] AccesoItemID);
	bool sfReqAccesItemTypeList();
	bool sfAckHelmetItemTypeList(string[] HelmetItemName, int[] HelmetItemID);
	bool sfReqHelmetItemTypeList();
	bool sfAckHeadItemTypeList(int[] HeadItemID);
	bool sfReqHeadItemTypeList();
	bool sfAckLogin(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg);
	bool sfReqLogin(const string& PortalID);
	bool sfAckExceedMaxUser();
	bool sfAckHash(int Result, const string& ErrMsg);
	bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	bool rfAckLoginWithIndonesia(int Result);
	bool rfReqLoginWithIndonesia(const string& HashValue);
	bool rfAckLoginWithGlobal(int Result);
	bool rfReqLoginWithGlobal(const string& G_AccountID, const string& G_GUID, const string& G_AuthKey, int UserType);
	bool rfAckLoginWithThailand(int Result);
	bool rfReqLoginWithThailand(const string& USN, int BloodDisplayType, int PCBangType, const string& UnixTimeStamp, const string& HashValue, byte Sex);
	bool rfAckLogOut(byte Result, byte Reason);
	bool rfReqLogOut(byte Reason);
	bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock);
	bool rfReqLoginWithTencentAuth(const string& AccountID, byte[] Signature);
	bool rfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec);
	bool rfAckEventNotify(int Type);
	bool rfReqEventNotify();
	bool rfAckErrorReportServerAddr(const string& Addr, int Port);
	bool rfReqErrorReportServerAddr();
	bool rfAckClientChecksum(int Result);
	bool rfReqClientChecksum(const string& Key1, const struct FBtrDouble& Key2);
	bool rfAckClientChallenge(const string& Key1, const struct FBtrDouble& Key2);
	bool rfReqClientChallenge();
	bool rfAckServerTime(int Time);
	bool rfReqServerTime();
	bool rfAckGetCharBlockInfo(int Result, byte IsAccountBlock, byte IsChattingBlock, const struct FBtrDouble& ChattingBlockEndTime, string[] BlockedItemName);
	bool rfReqGetCharBlockInfo();
	bool rfAckRegisterMainPCBang(int Result, const string& ErrMsg);
	bool rfReqRegisterMainPCBang();
	bool rfAckPCBangUserListEnd();
	bool rfAckPCBangUserList(string[] FriendName, byte[] IsLogOn, string[] ClanName, int[] CM_Pattern, int[] CM_BG, int[] CM_BL, int[] Level, int[] ClanGrade, int[] ClanWin, int[] ClanLose);
	bool rfAckPCBangUserListStart(int Result, int TotalCount);
	bool rfReqPCBangUserList();
	bool rfAckRegisteredPCBangInfo(int Result, const string& ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, const string& PCBangName);
	bool rfReqRegisteredPCBangInfo();
	bool rfAckCharInfo(int Result, const string& CharName, int Level, int Exp, const string& ClanName);
	bool rfReqCharInfo(const string& CharName);
	bool rfReqForceLogoutByOwner();
	bool rfReqKeepAlive();
	bool rfAckMaxUserExceed();
	bool rfAckClanMemberListFromClientEnd();
	bool rfAckClanMemberListFromClient(int Result, const string& ErrMsg, int[] Level, string[] CharName, byte[] ClanGrade, string[] ServerName, string[] ServerShortName, string[] ServerIP, int[] serverPort, byte[] CurPos, int[] ChannelNum, string[] ChannelNickName, int[] GameRoomNum);
	bool rfAckClanMemberListFromClientStart(int Result, int TotalCount);
	bool rfReqClanMemberListFromClient();
	bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType);
	bool rfReqLoginWithWZAuth(const string& AccountID, const string& Guid, const string& AuthKey);
	bool rfAckProcessPreLoginUser(int Result, const string& ErrMsg);
	bool rfReqProcessPreLoginUser(const string& CharName, byte Type);
	bool rfAckLoginInHouseTest(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg, const string& BDay, byte Sex, const struct FBtrDouble& ServerTime);
	bool rfReqLoginInHouseTest(const string& UserName, const string& Password, const string& Guid);
	bool rfAckAdvertisement(int Result, byte Type, const string& Address);
	bool rfReqAdvertisement();
	bool rfAckUserDetailInfo(int Result, const string& UserName, const string& ClanName, int Ranking, int MatchNum, int WinNum, int LoseNum, int CurrentEXP, int NextExp, int ForcedDisconnectedNum, int PrimaryWeaponID, int SubWeaponID, int Point);
	bool rfReqUserDetailInfo(int UserID, const string& UserName);
	bool rfAckFriendsListEnd();
	bool rfAckFriendsList(byte ListType, string[] UserName, byte[] IsLogOn, int[] CMarkPattern, int[] CMarkBG, int[] CMarkBL, string[] ClanName, int[] Level);
	bool rfAckFriendsListStart(int Result, int TotalCount);
	bool rfReqFriendsList();
	bool rfAckConnectChannelServer(const string& SessionKey, int TimeStamp);
	bool rfReqConnectChannelServer(const string& ServerIP, int serverPort);
	bool rfAckServerList(string[] CServername, string[] CServerShortName, string[] ServerIP, int[] serverPort, string[] ChannelName, string[] ChannelNickName, int[] ChannelNum, int[] chMaxUser, int[] chCurUser, string[] ServerGroupName, int[] ServerGroupID, int[] ServerDispOrder, int[] DataPort, byte[] OptionCount_byte, byte[] OptionKey_byte, byte[] OptionValue_byte, byte[] OptionCount_int, byte[] OptionKey_int, int[] OptionValue_int, byte[] OptionCount_float, byte[] OptionKey_float, float[] OptionValue_float, byte[] IsClanChannel, byte[] IsUseDedicateHost);
	bool rfReqServerList();
	bool rfAckCreateChar(int Success, const string& ErrMsg);
	bool rfReqCreateChar(const string& CharName, int HeadItemID, int HelmetItemID, int AccesoItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID);
	bool rfAckAccesItemTypeList(string[] AccesoItemName, int[] AccesoItemID);
	bool rfReqAccesItemTypeList();
	bool rfAckHelmetItemTypeList(string[] HelmetItemName, int[] HelmetItemID);
	bool rfReqHelmetItemTypeList();
	bool rfAckHeadItemTypeList(int[] HeadItemID);
	bool rfReqHeadItemTypeList();
	bool rfAckLogin(byte Sucess, const string& CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, const string& ErrMsg);
	bool rfReqLogin(const string& PortalID);
	bool rfAckExceedMaxUser();
	bool rfAckHash(int Result, const string& ErrMsg);
	bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
	void OnError(int ErrCode);
	void OnClose(int ErrCode);
	void OnConnect(int ErrCode);
	bool Close();
	bool ConnectDomain(const string& domain, int nPort);
	bool Connect(const string& sIpaddr, int nPort);
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


	string STATIC_GetPayURL(const string& AccountID, byte connectAlpha);
};


// Class BatteryNet.BTNatDiag
// 0x001C (0x0048 - 0x002C)
class UBTNatDiag : public UObject
{
public:
	string[]                                           nat_server_ip;                                            // 0x002C(0x000C) (Config, NeedCtorLink)
	int[]                                              nat_port;                                                 // 0x0038(0x000C) (Config, NeedCtorLink)
	int                                                NatType;                                                  // 0x0044(0x0004) (Native)

	static UClass* StaticClass()
	{
		static auto ptr = UObject::FindClass("Class BatteryNet.BTNatDiag");
		return ptr;
	}


	bool ProcessStep2();
	bool ProcessStep1();
	ENAT_TYPE GetNatType();
	int CheckPhrase2();
	int CheckPhrase1();
	bool SetSecondServer(const string& server_ip, int nPort);
	bool SetPrimaryServer(const string& server_ip, int nPort);
	bool StartNatCheck(const string& nat_server_ip, int nPort, const string& sLocalBindAddr);
	bool InitNatSocket();
	bool SetNatServerIp(string[] nat_server_ip, int[] nPorts);
	bool Start(string[] ipaddresses, int[] ports);
};


}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
