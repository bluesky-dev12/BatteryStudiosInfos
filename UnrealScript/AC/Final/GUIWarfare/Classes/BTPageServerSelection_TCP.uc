class BTPageServerSelection_TCP extends BTTcpLink_Channel;

var export editinline BTPageServerSelection Owner;

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterChannel(id, UID, UserID, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    return Owner.rfAckLeaveChannel(Result, UserID, UID);
    //return;    
}

function bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    return Owner.rfAckLogin2(Result, ErrMsg, UserID, CharName, CurServerTime, CharDBID, IsGM);
    //return;    
}

function bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    return Owner.rfAckItemListStart(Count, Result, ErrMsg);
    //return;    
}

function bool rfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    return Owner.rfAckItemList(UniqueID, ItemID, ItemType, Durability, UntilTime, SlotPosition, AddPartsID, DamageDegree, ItemState, StackCount, PaintID, TradeCount);
    //return;    
}

function bool rfAckItemListEnd()
{
    return Owner.rfAckItemListEnd();
    //return;    
}

function bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    return Owner.rfAckUserSkillListStart(Count, Result, ErrMsg);
    //return;    
}

function bool rfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    return Owner.rfAckUserSkillList(UniqueSkillID, SkillID, UntilTime, SlotPosition);
    //return;    
}

function bool rfAckUserSkillListEnd()
{
    return Owner.rfAckUserSkillListEnd();
    //return;    
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4, array<BtrDouble> KnifeItemID)
{
    return Owner.rfAckQSlotList(Result, ErrMsg, QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4, KnifeItemID);
    //return;    
}

function bool rfAckServerTime(int Time)
{
    return Owner.rfAckServerTime(Time);
    //return;    
}

function bool rfAckHash(int Result, string Error)
{
    return Owner.rfAckHash(Result, Error);
    //return;    
}

function bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    return Owner.rfReqNotifyRelayServerAddr(RelayIP, RelayPort);
    //return;    
}

function bool rfAckNotifyExpiredItemIDs(array<byte> DisplayOrder, array<byte> SlotPos, array<int> ItemTID, array<BtrDouble> ItemUID)
{
    return Owner.rfAckNotifyExpiredItemIDs(DisplayOrder, SlotPos, ItemTID, ItemUID);
    //return;    
}

function bool rfAckNotifyExpiredSkillIDs(array<byte> DisplayOrder, array<byte> SlotPos, array<int> ItemTID, array<BtrDouble> ItemUID)
{
    return Owner.rfAckNotifyExpiredSkillIDs(DisplayOrder, SlotPos, ItemTID, ItemUID);
    //return;    
}

function bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    return Owner.rfReqNotifyDurabilityZeroItem(Result, ErrMsg, UserID, ItemUniqueIDs, ItemIDs, ItemPartIDs, ItemSlotPos);
    //return;    
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    return Owner.rfAckRepairCost(Result, ErrMsg, UniqueItemID, RepairCost);
    //return;    
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    return Owner.rfAckRepairItem(Result, ErrMsg, UniqueItemID, RepairCost, DamageDegree);
    //return;    
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    return Owner.rfAckUpdateQSlot(Result, ErrMsg);
    //return;    
}

function bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    return Owner.rfReqRecvNotice_FromGM(Result, ErrMsg, NoticeMsg, IsFromDB);
    //return;    
}

function bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    return Owner.rfReqRecvForceDisconnected_FromGM(Result, ErrMsg);
    //return;    
}

function bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    return Owner.rfAckBuyShopItem(ItemCount, Result, BoughtItemTypeID, BoughtItemUniqueID, BoughtPartID, BoughtUntilTIme, BoughtStackCnt, PointRemain, CashRemain);
    //return;    
}

function bool rfAckExceedMaxUser()
{
    return Owner.rfAckExceedMaxUser();
    //return;    
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    return Owner.rfAckGetServerTime(ServerTime, ClientIP);
    //return;    
}

function bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID, byte FromContent)
{
    return Owner.rfAckItemListInItemBox(Result, ErrMsg, ItemUniqueID, BoxItemID, ItemID, PartID, FromContent);
    //return;    
}

function bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    return Owner.rfAckInviteGameRoom(Result, Answer, GuestCharName);
    //return;    
}

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    return Owner.rfReqRecvInviteGameRoom(InviteUserServerName, InviteUserServerID, InviteUserChannelNumber, RoomUniqueID, RoomNumber, RoomName, RoomState, MapName, OwnerName, GameMode, WeaponLimit, IsTeamBalance, Password, InviteCharName);
    //return;    
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    return Owner.rfAckRecvInviteGameRoomResult(Result);
    //return;    
}

function bool rfAckQuestListStart(int Result, string ErrMsg)
{
    return Owner.rfAckQuestListStart(Result, ErrMsg);
    //return;    
}

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest, array<byte> IsComplete)
{
    return Owner.rfAckQuestList(QuestID, CountPrograss, IsDailyQuest, IsComplete);
    //return;    
}

function bool rfAckQuestListEnd()
{
    return Owner.rfAckQuestListEnd();
    //return;    
}

function bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    return Owner.rfAckQuestUpdate(Result, ErrMsg);
    //return;    
}

function bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    return Owner.rfReqQuestNewAvailable(AchivedQuestID, NewQuestID, IsDailyQuest, ExpiredQuest);
    //return;    
}

function bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    return Owner.rfReqDailyQuestNewAvailable(ExpiredQuestID, NewQuestID);
    //return;    
}

function bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    return Owner.rfAckLimitedListInChannel(Result, LimitedMapID, LimitedModeID);
    //return;    
}

function bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_InviteCrew(Result, ErrMsg);
    //return;    
}

function bool rfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    return Owner.rfReqClanMatch_RecvInviteCrew(Inviter, ServerIP, Port, WaittingID, Msg, MapNum, InviteUserChannelNum, LeaderName, RoomName);
    //return;    
}

function bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    return Owner.rfReqClanMatch_InviteCrewResult(Invitee, Result);
    //return;    
}

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    return Owner.rfAckWebzenCash(Result, ErrMsg, PCoinCash, CCoinCash);
    //return;    
}

function bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    return Owner.rfAckMyMoney(Result, ErrMsg, Point, Cash);
    //return;    
}

function bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    return Owner.rfAckWebzenShopScriptVersion(Year, YearId, SalesZoneCode);
    //return;    
}

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    return Owner.rfAckRegisteredPCBangInfo(Result, ErrMsg, IsRegisteredPCBang, IsMainPCBang, PCBangName);
    //return;    
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    return Owner.rfAckCharInfo(Result, ErrMsg, UserID, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, stCharInfo, InClanRank, ClanLevel);
    //return;    
}

function bool rfAckClanInfo(ClanInfo stClanInfo)
{
    return Owner.rfAckClanInfo(stClanInfo);
    //return;    
}

function bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    return Owner.rfAckRegisterMainPCBang(Result, ErrMsg);
    //return;    
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    return Owner.rfAckFriendListStart(Result, TotalCount);
    //return;    
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    return Owner.rfAckFriendList(FriendName, IsLogOn, ClanName, CM_Pattern, CM_BG, CM_BL, LevelMarkID, ClanLevel, Level, IsLookForClan);
    //return;    
}

function bool rfAckFriendListEnd()
{
    return Owner.rfAckFriendListEnd();
    //return;    
}

function bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckBlockUserListStart(Result, TotalCount);
    //return;    
}

function bool rfAckBlockUserListEnd()
{
    return Owner.rfAckBlockUserListEnd();
    //return;    
}

function bool rfAckBlockUserList(array<string> CharName)
{
    return Owner.rfAckBlockUserList(CharName);
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckClanUserListStart(Result, TotalCount);
    //return;    
}

function bool rfAckClanUserListEnd()
{
    return Owner.rfAckClanUserListEnd();
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    return Owner.rfAckClanUserList(Result, ErrMsg, Level, CharName, ClanGrade, ClanWinCnt, ClanLoseCnt, LevelMarkID, TitleMarkID, DudeId);
    //return;    
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckPCBangUserListStart(Result, TotalCount);
    //return;    
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckPCBangUserList(FriendName, ClanName, CM_Pattern, CM_BG, CM_BL, Level, ClanGrade, ClanWin, ClanLose, IsLookForClan, IsCombat, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckPCBangUserListEnd()
{
    return Owner.rfAckPCBangUserListEnd();
    //return;    
}

function bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    return Owner.rfAckAddBlockUserList(Result, ErrMsg);
    //return;    
}

function bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    return Owner.rfAckRemoveBlockUserList(Result, ErrMsg);
    //return;    
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, BtrDouble KeyItemIdx, int KeyItemRemainCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    return Owner.rfAckRandomBox_Use(Result, ErrMsg, RandomBoxItemIdx, RandomBxoItemCount, KeyItemIdx, KeyItemRemainCount, ItemIDChoose, PartIDChoose, PeriodOnChoosenItem, StackCountOnChoosenItem, bHave, ItemIdx, UntilTime, StackCount);
    //return;    
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return Owner.rfAckEquipItem(ChangedNewItemID, ChangedNewUniqueID, ChangedNewSlotPosition, ChangedOldItemID, ChangedOldUniqueID, ChangedOldSlotPosition, Result, ErrMsg);
    //return;    
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    Log("[BTPageServerSelection_TCP::rfAckEquipSkill()]");
    return Owner.rfAckEquipSkill(ChangedNewSkillID, ChangedNewSkillUniqueID, ChangedNewSlotPosition, ChangedOldSkillID, ChangedOldSkillUniqueID, ChangedOldSlotPosition, Result, ErrMsg);
    //return;    
}

function bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    return Owner.rfAckWebzenBillingStorageListStart(Result, ErrMsg, TotalCount, TotalPage, CurPage);
    //return;    
}

function bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    return Owner.rfAckWebzenBillingStorageList(Seq, ItemSeq, GroupCode, ShareFlag, ProductSeq, CashName, CashPoint, SendAccountID, SendMessage, ItemType, RelationType, ProductType, PriceSeq);
    //return;    
}

function bool rfAckWebzenBillingStorageListEnd()
{
    return Owner.rfAckWebzenBillingStorageListEnd();
    //return;    
}

function bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    return Owner.rfAckWebzenBillingUseStorageItem(Result, ErrMsg, ItemIdx, ItemID, ItemExtra);
    //return;    
}

function bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    return Owner.rfAckPaidItem_EraseRecord(Result, ErrMsg, ItemIdx, Command, RemainCount);
    //return;    
}

function bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return Owner.rfAckPaidItem_BroadCast(Result, ErrMsg, ItemIdx, StackCount);
    //return;    
}

function bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    return Owner.rfAckPaidItem_ClanMarkDupCheck(Result, ErrMsg);
    //return;    
}

function bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return Owner.rfAckPaidItem_ChangeClanMark(Result, ErrMsg, ItemIdx, StackCount);
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    return Owner.rfAckPaidItem_NotifyChangeClanMark(ClanName, Pattern, BG, BL);
    //return;    
}

function bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    return Owner.rfAckCharBlockInfo(Result, ChatBlockStartTime, ChatBlockEndTime, BlockedItemIdx);
    //return;    
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    return Owner.rfAckChangeRoomTitle_GM(Result, RoomNumber, NewRoomTitle);
    //return;    
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return Owner.rfAckNotice_GM(Result, ErrMsg, NoticeType, ServerID, ChannelNum, GameRoomNum, Msg);
    //return;    
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    return Owner.rfAckForceDisconnectUser_GM(Result, ErrMsg, CharName);
    //return;    
}

function bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    return Owner.rfAckGMEnterRoom(Result, RoomNumber, UserID);
    //return;    
}

function bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    return Owner.rfAckGMLeaveRoom(Result, RoomNumber, UserID);
    //return;    
}

function bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    return Owner.rfAckChatNormal(id, Sender, Message, Result);
    //return;    
}

function bool rfAckChatClan(string CharName, string Message, int Result)
{
    return Owner.rfAckChatClan(CharName, Message, Result);
    //return;    
}

function bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    return Owner.rfReqRecvChatWispher(CharnameFrom, Message);
    //return;    
}

function bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    return Owner.rfAckRecvSystemMsg(CommunityType, MsgInfo);
    //return;    
}

function bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    return Owner.rfAckPaidItem_RelayBroadcast(CharName, Msg);
    //return;    
}

function bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    return Owner.rfAckSetLookForClan(Result, ErrMsg, IsLookingFor);
    //return;    
}

function bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    return Owner.rfAckGetMyMailBoxState(Result, IsFull, NewMailCount);
    //return;    
}

function bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    return Owner.rfAckPaidItem_ChangeCharname(Result, ErrMsg, ItemIdx, RemainCount, NewCharname);
    //return;    
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    return Owner.rfAckPaidItem_ChangeClanname(Result, ErrMsg, ItemIdx, RemainCount, NewClanname);
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    return Owner.rfAckPaidItem_NotifyChangeClanname(NewClanname);
    //return;    
}

function bool rfAckServerType(byte Type)
{
    return Owner.rfAckServerType(Type);
    //return;    
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    return Owner.rfAckLogOut(Result, Reason);
    //return;    
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    return Owner.rfUpdateWebzenShopScriptVersion(Year, YearId, SalesZoneCode);
    //return;    
}

function bool rfAckPopUpMessage(int MessageType)
{
    return Owner.rfAckPopUpMessage(MessageType);
    //return;    
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageServerSelection_TCP::rfAckMoveToLobby()]");
    return Owner.rfAckMoveToLobby(MessageType);
    //return;    
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTPageServerSelection_TCP::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    return Owner.rfAckTencent_StartTenProtect(CharDBID);
    //return;    
}

function bool rfAckShopItemData()
{
    return Owner.rfAckShopItemData();
    //return;    
}

function bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductName, array<int> ProductCode, array<byte> SaleType, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> SaleMasterFlag, array<int> SaleStatus, array<int> IsGift, array<BtrDouble> SaleEndTime, array<int> Discountcost)
{
    return Owner.rfReqNotifyShopItemData(ProductNo, ProductName, ProductCode, SaleType, ProductCost, ProductHour, ProductQuantity, SaleMasterFlag, SaleStatus, IsGift, SaleEndTime, Discountcost);
    //return;    
}

function bool rfReqNotifyShopPackageItemData(int PackageProductNo, array<int> ProductCode, array<int> ProductQuantity, array<int> ProductHour, string Description)
{
    return Owner.rfReqNotifyShopPackageItemData(PackageProductNo, ProductCode, ProductQuantity, ProductHour, Description);
    //return;    
}

function bool rfReqNotifyShopItemDataEnd(int Ver)
{
    return Owner.rfReqNotifyShopItemDataEnd(Ver);
    //return;    
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    return Owner.rfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    return Owner.rfAckRecvClanInviteResult(Result, ErrMsg);
    //return;    
}

function bool rfNotifyCouponUseError(int Time)
{
    return Owner.rfNotifyCouponUseError(Time);
    //return;    
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    return Owner.rfAckBuyItemByWebzenCash(Result, ErrMsg);
    //return;    
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    return Owner.rfAckGetItemFromItemBox(Result, ErrMsg, ItemIDChoose, PartIDChoose, BoxItemIdx, BxoItemCount, bHave, ItemIdx, UntilTime, StackCount);
    //return;    
}

function bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time, int GetItemID)
{
    return Owner.rfAckLuckShop_LotteryWinnerList(CapsuleItemID, IsNotification, NickName, Time, GetItemID);
    //return;    
}

function bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, BtrDouble ItemUniqueID, byte ChangeCount, int RemainCount)
{
    return Owner.rfChangeItemInstanceInfo(ErrorCode, ItemID, ItemUniqueID, ChangeCount, RemainCount);
    //return;    
}

function bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite)
{
    return Owner.rfAckCommunityOptionList(Opt_Wispher, Opt_GameInvite, Opt_FriendInvite, Opt_ClanInvite);
    //return;    
}

function bool rfAckSetCommunityOption(int Result, string ErrStr)
{
    return Owner.rfAckSetCommunityOption(Result, ErrStr);
    //return;    
}

function bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    return Owner.rfAckAttendanceList(Result, IsComplete, UpdatedNum, StateList, ItemIdx, RewardItemID, RewardItemCount, PaidItemIdx, PaidItemStackCount);
    //return;    
}

function bool rfAckPuzzleList(int Result, byte IsComplete, array<byte> UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    return Owner.rfAckPuzzleList(Result, IsComplete, UpdatedNum, StateList, ItemIdx, RewardItemID, RewardItemCount, PaidItemIdx, PaidItemStackCount);
    //return;    
}

function bool rfAckDailyRewardListThisMonth(array<byte> Type, array<byte> Number, array<int> ItemID, array<int> ItemCount)
{
    return Owner.rfAckDailyRewardListThisMonth(Type, Number, ItemID, ItemCount);
    //return;    
}

function bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount)
{
    return Owner.rfAckReceiveSpecialReward(Result, RewardedQuestID, RewardedQuestIsComplete, ItemIdx, RewardItemID, RewardItemCount);
    //return;    
}

function bool rfAckSpecialQuestRank(array<string> CharList)
{
    return Owner.rfAckSpecialQuestRank(CharList);
    //return;    
}

function bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    Log(((((((("[BTPageServerSelection_TCP::rfAckUseItemDuringGame] ErrorCode:" $ string(ErrorCode)) $ " / CharName :") $ CharName) $ " /ItemID:") $ string(ItemID)) $ "/ItemUniqueID:") $ "/RemainCount:") $ string(RemainCount));
    return true;
    //return;    
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    return Owner.rfAckSendGift(Result, ErrMsg, PointRemain, CashRemain);
    //return;    
}

function bool rfAckPcBangItemList(array<int> ItemTID, array<int> PartID)
{
    return Owner.rfAckPcBangItemList(ItemTID, PartID);
    //return;    
}

function bool rfAckQSlotList_2(int Result, string ErrMsg, array<byte> QSlotDispOrder, array<int> QSlotIDX, array<int> ItemTID, array<BtrDouble> ItemUID, array<byte> SlotPos)
{
    return Owner.rfAckQSlotList_2(Result, ErrMsg, QSlotDispOrder, QSlotIDX, ItemTID, ItemUID, SlotPos);
    //return;    
}

function bool rfAckUpdateQSlot_2(int Result, string ErrMsg, array<byte> DisplayOrder, array<int> ItemTID, array<BtrDouble> ItemUID, array<byte> SlotPos_Key, array<byte> SlotPos_Value)
{
    return Owner.rfAckUpdateQSlot_2(Result, ErrMsg, DisplayOrder, ItemTID, ItemUID, SlotPos_Key, SlotPos_Value);
    //return;    
}

function bool rfAckExpandSlotConfirm(int Result, string ErrMsg, int QSlotID, BtrDouble MWItemID, BtrDouble PistolItemID, BtrDouble TWItemID1, BtrDouble TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4, BtrDouble KnifeItemID)
{
    return Owner.rfAckExpandSlotConfirm(Result, ErrMsg, QSlotID, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4, KnifeItemID);
    //return;    
}

function bool rfReqAddSpecialRank(string NickName)
{
    return Owner.rfReqAddSpecialRank(NickName);
    //return;    
}
