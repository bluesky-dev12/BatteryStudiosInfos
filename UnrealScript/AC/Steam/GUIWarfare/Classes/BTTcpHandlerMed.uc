/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTTcpHandlerMed.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:275
 *
 *******************************************************************************/
class BTTcpHandlerMed extends BTTcpLink_Channel;

var BTTcpHandler Owner;

function OnConnect(int ErrCode)
{
    Owner.OnConnect(ErrCode);
}

function OnClose(int ErrCode)
{
    Owner.OnClose(ErrCode);
}

function OnError(int ErrCode)
{
    Owner.OnError(ErrCode);
}

function bool rfAckLogin(int Result, string ErrMsg, int UserID, string CharName, string ClanName, CharInfo btCharInfo)
{
    return Owner.rfAckLogin(Result, ErrMsg, UserID, CharName, ClanName, btCharInfo);
}

function bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    return Owner.rfAckItemListStart(Count, Result, ErrMsg);
}

function bool rfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    return Owner.rfAckItemList(UniqueID, ItemID, ItemType, Durability, UntilTime, SlotPosition, AddPartsID, DamageDegree, ItemState, StackCount, PaintID, TradeCount);
}

function bool rfAckItemListEnd()
{
    return Owner.rfAckItemListEnd();
}

function bool rfAckAuctionMyItemRegister(int Result, string ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain)
{
    return Owner.rfAckAuctionMyItemRegister(Result, ErrMsg, BeginPrice, BuyPrice, GuarantyPoint, PointRemain);
}

function bool rfAckAuctionItemListCount(int Result, string ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count)
{
    return Owner.rfAckAuctionItemListCount(Result, ErrMsg, Section, Classfy, ItemType, ItemGrade, Count);
}

function bool rfAckAuctionItemListStart(int Result, string ErrMsg, byte Section, int PageNum, int Count)
{
    return Owner.rfAckAuctionItemListStart(Result, ErrMsg, Section, PageNum, Count);
}

function bool rfAckAuctionItemList(byte Section, array<int> UniqueIDs, array<int> ItemIDs, array<int> AddPartsIDs, array<BtrDouble> UntilTimes, array<int> BiddingPrices, array<int> InstantlyByuingPrices, array<int> ItemDamageds, array<string> HighestBidderNames, array<string> SellerNames, array<int> ItemCount)
{
    return Owner.rfAckAuctionItemList(Section, UniqueIDs, ItemIDs, AddPartsIDs, UntilTimes, BiddingPrices, InstantlyByuingPrices, ItemDamageds, HighestBidderNames, SellerNames, ItemCount);
}

function bool rfAckAuctionItemListEnd(byte Section)
{
    return Owner.rfAckAuctionItemListEnd(Section);
}

function bool rfAckAuctionMyItemCancel(int Result, string ErrMsg)
{
    return Owner.rfAckAuctionMyItemCancel(Result, ErrMsg);
}

function bool rfAckAuctionInstantlyBuying(int Result, string ErrMsg, int PointRemain)
{
    return Owner.rfAckAuctionInstantlyBuying(Result, ErrMsg, PointRemain);
}

function bool rfAckChannelList(array<int> id, array<string> Title, array<int> CurUser, array<int> MaxUser)
{
    return Owner.rfAckChannelList(id, Title, CurUser, MaxUser);
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterChannel(id, UID, UserID, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    return Owner.rfAckLeaveChannel(Result, UserID, UID);
}

function bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    return Owner.rfAckLogin2(Result, ErrMsg, UserID, CharName, CurServerTime, CharDBID, IsGM);
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckChannelUserList(TotalCount, Count, StartIndex, UID, UserID, UserLevels, ClanName, ClanPattern, ClanBG, ClanBL, ClanGrade, ClanWin, ClanLose, IsLookForClan, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex)
{
    return Owner.rfAckRoomListStart(Result, TotalCount, Count, StartIndex);
}

function bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsHardCore, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    return Owner.rfAckRoomList(GameNum, Title, MapName, MapNum, UserCount, MaxCount, ModeName, ModeNum, WeaponLimit, IsHardCore, Status, RoomOwnerIP, GameMinute, RoomOwnerName, IsSpecial, IsPassword, BotDifficult, BotModeUserTeamNum);
}

function bool rfAckRoomListEnd()
{
    return Owner.rfAckRoomListEnd();
}

function bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    return Owner.rfAckChatNormal(id, Sender, Message, Result);
}

function bool rfAckChatClan(string CharName, string Message, int Result)
{
    return Owner.rfAckChatClan(CharName, Message, Result);
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterRoom(GameNum, OwnerID, UID, UserID, TeamNum, Grade, UserIP, ClanName, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckRoomUserList(UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookingFor, GMUID, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    return Owner.rfAckLeaveRoom(Num, UID, UserID, Result, ErrMsg);
}

function bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    return Owner.rfAckCreateGameRoom(Result, ErrMsg, UserID, RoomOwnerIP, NetRoomInfo);
}

function bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    return Owner.rfAckChangeTeam(GameNumber, UserID, UID, TeamNum, Result, ErrMsg);
}

function bool rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    return Owner.rfAckGameHostInfo(GameNumber, UserID, IP, Port, Result, ErrMsg);
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    return Owner.rfAckStartGame(GameNumber, ClientsCount, StartSeed, Result, ErrMsg);
}

function bool rfAckGameRoomDestroy(int GameRoomNum)
{
    return Owner.rfAckGameRoomDestroy(GameRoomNum);
}

function bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    return Owner.rfAckIsGameRoomPlaying(GameRoomNum, IsPlaying);
}

function bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    return Owner.rfAckSelectMap(GameNum, UID, MapName, Result, ErrMsg);
}

function bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    return Owner.rfAckChangeGameMode(GameNum, UID, GameMode, GameModeNum, Result, ErrMsg);
}

function bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    return Owner.rfAckGameOver(UID, GameRoomNumber, Result, ErrMsg);
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    return Owner.rfAckGameRoomInfo(Result, ErrMsg, RoomInfo);
}

function bool rfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    return Owner.rfReqRelayServerOn(RelayServerIP, RelayServerPortNum);
}

function bool rfReqRelayServerOff()
{
    return Owner.rfReqRelayServerOff();
}

function bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    return Owner.rfAckDisconnectGame(Result, DisconnectUserID, DisconnectUserName);
}

function bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    return Owner.rfAckChangeRoomOwner(GameNum, OldOwner, NewOwner, Result, ErrMsg);
}

function bool rfAckChangeHost(byte ClientNum)
{
    return Owner.rfAckChangeHost(ClientNum);
}

function bool rfAckChangeNewGuest(string HostIP)
{
    return Owner.rfAckChangeNewGuest(HostIP);
}

function bool rfAckMyEquipedItemList(array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<int> PaintID, array<BtrDouble> UniqueID, int Result)
{
    return Owner.rfAckMyEquipedItemList(ItemIDs, SlotPositions, AddPartsID, PaintID, UniqueID, Result);
}

function bool rfAckMyEquipedSkillList(array<int> SkillIDs, array<int> SlotPositions, int Result)
{
    return Owner.rfAckMyEquipedSkillList(SkillIDs, SlotPositions, Result);
}

function bool rfAckMyEquipedQSlotList(array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<BtrDouble> PistolUniqueID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<BtrDouble> TW1UniqueID, array<int> TWItemID1, array<BtrDouble> TW2UniqueID, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID, int Result)
{
    return Owner.rfAckMyEquipedQSlotList(QSlotDispOrder, MWUniqueID, MWItemID, MWPartID, MWPaintID, PistolUniqueID, PistolItemID, PistolPartID, PistolPaintID, TW1UniqueID, TWItemID1, TW2UniqueID, TWItemID2, Skill1ID, Skill2ID, Skill3ID, Skill4ID, Result);
}

function bool rfAckConnectGame(int UserID, int Result)
{
    return Owner.rfAckConnectGame(UserID, Result);
}

function bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    return Owner.rfAckUpdateScore(UserIDs, NickNames, TeamIDs, Scores, Kills, Assists, Deaths, EXPs, EXPBonuses, Points, PointBonuses, TeamScores, BonusOwnerID, BonusID);
}

function bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    return Owner.rfAckChangeRoomSetting(Result, ErrMsg, RoomInfo);
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return Owner.rfAckEquipItem(ChangedNewItemID, ChangedNewUniqueID, ChangedNewSlotPosition, ChangedOldItemID, ChangedOldUniqueID, ChangedOldSlotPosition, Result, ErrMsg);
}

function bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    return Owner.rfAckConfirmItemChanged(Result, ErrMsg);
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    return Owner.rfAckCharInfo(Result, ErrMsg, UserID, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, stCharInfo, InClanRank, ClanLevel);
}

function bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    return Owner.rfReqExteriorRoomInfo(SP, RoomNumber, IsPW, RoomName, MapName, ModeName, MapNum, ModeNum, IsTeamBalance, MaxUserCount, RoomUserCount, RoomState, BotDifficult, WeaponLimit, BotModeUserTeamNum);
}

function bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    return Owner.rfReqExteriorRoomUserCount(RoomNumber, RoomUserCount);
}


function bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    return Owner.rfAckChangeUserState(Result, ErrMsg, UserIDs, Positions, Numbers, OldStates, NewStates);
}

function bool rfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    return Owner.rfReqStartNatDiag(Server1Addr, Server1Port, Server2Addr, Server2Port);
}

function bool rfReqForceNatTypeSetting(int NatType)
{
    return Owner.rfReqForceNatTypeSetting(NatType);
}

function bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    return Owner.rfAckRegisterOtherUdpInfo(UID, IP, Port, NatType, Intervention, HostInnerIP, HostInnerPort);
}

function bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    return Owner.rfAckEntryItemList(UserIDs, ItemIDs, SlotPositions, AddPartsID, UniqueID, PaintID, Result, ErrMsg);
}

function bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    return Owner.rfAckForceGameOver(UserID, GameRoomNumber, Result, ErrMsg);
}

function bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    return Owner.rfAckGetBooty(Result, ErrMsg, PrizeWinUserID, BootyItemID, BootyPartsID);
}

function bool rfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    return Owner.rfAckGetBootyChoose(Result, ErrMsg, GiveType, ItemUniqueNumber, ItemID, PartID, ItemType, UntilTime, StackCount, PaintID);
}

function bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    return Owner.rfAckUserSkillListStart(Count, Result, ErrMsg);
}

function bool rfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    return Owner.rfAckUserSkillList(UniqueSkillID, SkillID, UntilTime, SlotPosition);
}

function bool rfAckUserSkillListEnd()
{
    return Owner.rfAckUserSkillListEnd();
}

function bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    return Owner.rfAckEntrySkillList(UserIDs, SkillIDs, SlotPositions, Result, ErrMsg);
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return Owner.rfAckEquipSkill(ChangedNewSkillID, ChangedNewSkillUniqueID, ChangedNewSlotPosition, ChangedOldSkillID, ChangedOldSkillUniqueID, ChangedOldSlotPosition, Result, ErrMsg);
}

function bool rfReqConfirmSkillChanged()
{
    return Owner.rfReqConfirmSkillChanged();
}

function bool rfAckShopItemListStart(int Count)
{
    return Owner.rfAckShopItemListStart(Count);
}

function bool rfAckShopItemList(array<int> ItemID)
{
    return Owner.rfAckShopItemList(ItemID);
}

function bool rfAckShopItemListEnd()
{
    return Owner.rfAckShopItemListEnd();
}

function bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    return Owner.rfAckBuyShopItem(ItemCount, Result, BoughtItemTypeID, BoughtItemUniqueID, BoughtPartID, BoughtUntilTIme, BoughtStackCnt, PointRemain, CashRemain);
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    return Owner.rfAckSellShopItem(Result, ErrMsg, PointRemain, CashRemain, Count);
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    return Owner.rfAckModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point, Cash);
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    return Owner.rfAckQSlotList(Result, ErrMsg, QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    return Owner.rfAckUpdateQSlot(Result, ErrMsg);
}

function bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    return Owner.rfAckEntryQSlotIDList(UserNum, QSlotDispOrder, MWItemID, MWPartID, MWPaintID, PistolItemID, PistolPartID, PistolPaintID, TWItemID1, TWItemID2, Skill1ID, Skill2ID, Skill3ID, Skill4ID);
}

function bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    return Owner.rfAckEntryQSlotUniqueIDList(UserNum, QSlotDispOrder, MWUniqueID, PistolUniqueID, TW1UniqueID, TW2UniqueID);
}

event bool rfAckUpdateWeaponDurability(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> Durability, array<byte> IsDestroy, array<BtrDouble> FailedWeaponUniqueID)
{
    return Owner.rfAckUpdateWeaponDurability(Result, ErrMsg, UniqueItemID, Durability, IsDestroy, FailedWeaponUniqueID);
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    return Owner.rfAckRepairCost(Result, ErrMsg, UniqueItemID, RepairCost);
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    return Owner.rfAckRepairItem(Result, ErrMsg, UniqueItemID, RepairCost, DamageDegree);
}

function bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    return Owner.rfAckGameOverEnd(Result, ErrMsg);
}

function bool rfAckServerTime(int Time)
{
    return Owner.rfAckServerTime(Time);
}

function bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    return Owner.rfReqRecvChatWispher(CharnameFrom, Message);
}

function bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    return Owner.rfAckSellShopItemInfo(Result, ErrMsg, UniqueItemID, SellPoint, CurPoint, AfterPoint);
}

function bool ForceLogout_OnOK(GUIComponent Sender)
{
    return Owner.ForceLogout_OnOK(Sender);
}

function bool rfReqForceLogoutByOwner()
{
    return Owner.rfReqForceLogoutByOwner();
}

function bool rfAckHash(int Result, string Error)
{
    return Owner.rfAckHash(Result, Error);
}

function bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    return Owner.rfAckSuccessStartGame(Result, ErrMsg, IsHost, HostIP, HostPort, LoadingStep);
}

function bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    return Owner.rfAckFailedStartGame(Result, ErrMsg, IsHost, FailedUserID, LoadingStep);
}

function bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    return Owner.rfAckNotifyLoadingState(Result, UserID, LoadingState);
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    return Owner.rfAckSendFriendInvite(Result, ErrMsg);
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    return Owner.rfReqRecvFriendInvite(ReqUserID, ReqCharname, InviteMsg);
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    return Owner.rfAckConfirmFriendInvite(Result, ErrMsg);
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    return Owner.rfReqCompleteFriendInvite(CharnameToBeInvited, IsPermit);
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    return Owner.rfAckFriendListStart(Result, TotalCount);
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    return Owner.rfAckFriendList(FriendName, IsLogOn, ClanName, CM_Pattern, CM_BG, CM_BL, LevelMarkID, ClanLevel, Level, IsLookForClan);
}

function bool rfAckFriendListEnd()
{
    return Owner.rfAckFriendListEnd();
}

function bool rfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    return Owner.rfAckStartMemoList(Result, ErrMsg, Type, TotalCount);
}

function bool rfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    return Owner.rfAckMemoList(MemoIdx, cnameFrom, dateRecv, Text, Status, UntilExpire, ItemUID, ItemID, MsgType, ItemPartID);
}

function bool rfAckTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    return Owner.rfAckTestDouble(vDouble, vDoubles);
}

function bool rfAckEndMemoList()
{
    return Owner.rfAckEndMemoList();
}

function bool rfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    return Owner.rfAckReadMemo(cnameFrom, Text, dateRecv, ItemUID);
}

function bool rfAckRecvMemo(string cnameFrom, byte MemoType)
{
    return Owner.rfAckRecvMemo(cnameFrom, MemoType);
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    return Owner.rfAckSendGift(Result, ErrMsg, PointRemain, CashRemain);
}

function bool rfAckAuctionTradeHistory(int Result, string ErrMsg, int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    return Owner.rfAckAuctionTradeHistory(Result, ErrMsg, ItemID, PartID, SellerCharNm, DamageDegree, Price);
}

function bool rfAckAuctionBidding(int Result, string ErrMsg, int PointRemain)
{
    return Owner.rfAckAuctionBidding(Result, ErrMsg, PointRemain);
}

function bool rfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    return Owner.rfAckSendMemo(CnamesToFail, ResultArray);
}

event bool rfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    return Owner.rfAckDelMemo(Result, ErrMsg, FailedMemoID);
}

event bool rfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    return Owner.rfAckDeleteMailAll(Result, MailType, Count);
}

function bool rfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    return Owner.rfAckGetAttachedItemFromMemo(Result, ErrMsg, ItemIdx, ItemID);
}

function bool rfAckNotifyExpiredItemIDs(int UserID, array<BtrDouble> ExpiredItemUniqueIDs, array<int> ExpiredItemIDs, array<int> ExpiredItemPartIDs, array<byte> ExpiredItemSlotPos, int Result, string ErrMsg)
{
    return Owner.rfAckNotifyExpiredItemIDs(UserID, ExpiredItemUniqueIDs, ExpiredItemIDs, ExpiredItemPartIDs, ExpiredItemSlotPos, Result, ErrMsg);
}

function bool rfAckNotifyExpiredSkillIDs(int UserID, array<BtrDouble> ExpiredSkillUniqueIDs, array<int> ExpiredSkillIDs, int Result, string ErrMsg, array<byte> ExpiredSkillSlotPositions)
{
    return Owner.rfAckNotifyExpiredSkillIDs(UserID, ExpiredSkillUniqueIDs, ExpiredSkillIDs, Result, ErrMsg, ExpiredSkillSlotPositions);
}

function bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    return Owner.rfAckBanUser(GameNum, UID, BanUID, Result, ErrMsg);
}

function bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    return Owner.rfAckMyMoney(Result, ErrMsg, Point, Cash);
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    return Owner.rfAckGetServerTime(ServerTime, ClientIP);
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return Owner.rfAckCreateClan(Result, ErrMsg, ItemIdx, StackCount);
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    return Owner.rfAckDupCheckClanName(Result, ErrMsg);
}

function bool rfAckClanInfo(ClanInfo stClanInfo)
{
    return Owner.rfAckClanInfo(stClanInfo);
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckClanUserListStart(Result, TotalCount);
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    return Owner.rfAckClanUserList(Result, ErrMsg, Level, CharName, ClanGrade, ClanWinCnt, ClanLoseCnt, LevelMarkID, TitleMarkID, DudeId);
}

function bool rfAckClanUserListEnd()
{
    return Owner.rfAckClanUserListEnd();
}

function bool rfAckClanNews(array<string> IssueDate, array<byte> IssueType, array<string> IssuedClanMember)
{
    return Owner.rfAckClanNews(IssueDate, IssueType, IssuedClanMember);
}

function bool rfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    return Owner.rfAckClanClose(Result, ErrMsg, ClanName);
}

function bool rfAckClanSecession(int Result, string ErrMsg)
{
    return Owner.rfAckClanSecession(Result, ErrMsg);
}

function bool rfAckClanChangeInfo(int Result, string ErrMsg)
{
    return Owner.rfAckClanChangeInfo(Result, ErrMsg);
}

function bool rfAckClanPersonelIntro(int Result, string ErrMsg)
{
    return Owner.rfAckClanPersonelIntro(Result, ErrMsg);
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    return Owner.rfAckSearchClan(Result, ErrMsg, TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    return Owner.rfAckDBCharInfo(Result, ErrMsg, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanPersonIntro, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo, ClanLevel);
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    return Owner.rfAckClanCharPersonelIntro(Result, ErrMsg, PersonelIntro);
}

function bool rfReqNotifyChangeRoomState(byte RoomState)
{
    return Owner.rfReqNotifyChangeRoomState(RoomState);
}

function bool rfAckForceDisconnectUDPFromHost(int Result)
{
    return Owner.rfAckForceDisconnectUDPFromHost(Result);
}

function bool rfReqRecvForceDisconnectUDPFromHost(int Result)
{
    return Owner.rfReqRecvForceDisconnectUDPFromHost(Result);
}

function bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    return Owner.rfReqNotifyRelayServerAddr(RelayIP, RelayPort);
}

function bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    return Owner.rfAckGetUserHostPriorityPoint(Result, UserID, HostPriorityPoint);
}

function bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    return Owner.rfAckGetHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs);
}

function bool rfAckNotifyHostBlocking(int Result, byte Blocking)
{
    return Owner.rfAckNotifyHostBlocking(Result, Blocking);
}

function bool rfAckGetIsHostBlocking(int Result, byte Blocking)
{
    return Owner.rfAckGetIsHostBlocking(Result, Blocking);
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    return Owner.rfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    return Owner.rfAckInviteClan(Result, ErrMsg);
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    return Owner.rfAckInviteClanResult(CharName, Permit, ClanNm);
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    return Owner.rfAckRecvClanInviteResult(Result, ErrMsg);
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    return Owner.rfReqRecvJoinClan(UserIdx, CharName, Message);
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    return Owner.rfAckNotifyNewClanMember(ClanName, CharName);
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    return Owner.rfAckNotifyClanSecession(ClanName, CharName);
}

function bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    return Owner.rfAckJoinClanResult(ClanName, Permit, PermitCharName);
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    return Owner.rfAckRecvJoinClanResult(Result, ErrMsg);
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return Owner.rfReqClanCharPersonelIntro(ClanName, CharName);
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    return Owner.rfAckAdjustClanMemberGrade(Result, ErrMsg, ClanName, CharName, CharGrade);
}

function bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckBlockUserListStart(Result, TotalCount);
}

function bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    return Owner.rfAckAddBlockUserList(Result, ErrMsg);
}

function bool rfAckBlockUserListEnd()
{
    return Owner.rfAckBlockUserListEnd();
}

function bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    return Owner.rfAckRemoveBlockUserList(Result, ErrMsg);
}

function bool rfAckBlockUserList(array<string> CharName)
{
    return Owner.rfAckBlockUserList(CharName);
}

function bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    return Owner.rfReqNotifyLevelUp(LevelUpUserID, Level, Exp, ItemID, PartID);
}

function bool rfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    return Owner.rfAckAcquirePromotionItems(UID, Result, ErrMsg, ItemUniqueID, ItemIDs, PartIDs);
}

function bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    return Owner.rfReqNotifyDurabilityZeroItem(Result, ErrMsg, UserID, ItemUniqueIDs, ItemIDs, ItemPartIDs, ItemSlotPos);
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return Owner.rfAckNotifyAdjustClanMemberGrade(ClanName, CharName, CharGrade);
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    return Owner.rfAckChatWispher(Result, ErrMsg, ToCharName);
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    return Owner.rfAckDeleteFriend(Result, FailedCharname);
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    return Owner.rfReqRecvDeleteFriend(Result, FromCharName);
}

function bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckChannelUserListInGameRoom(Result, TotalCount, Count, StartIndex, UID, CharName, UserLevel, ClanName, ClanPattern, ClanBG, ClanBL, IsLookForClan, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckExceedMaxUser()
{
    return Owner.rfAckExceedMaxUser();
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    return Owner.rfAckJoinClan(Result, ErrMsg, SpecificCharName, RealRecvCharName, RealRecvCharClanGrade);
}

function bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    return Owner.rfReqRecvNotice_FromGM(Result, ErrMsg, NoticeMsg, IsFromDB);
}

function bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    return Owner.rfReqRecvForceDisconnected_FromGM(Result, ErrMsg);
}

function bool rfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    return Owner.rfReqNotifyDisconnectHostInLoading(Result, ErrMsg, HostID);
}

function bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    return Owner.rfAckNotifyMyCharInfoToRoomUser(Result, ErrMsg, UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookFor);
}

event bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    return Owner.rfAckRegisterMyUdpInfo(Result, ErrMsg);
}

function bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    return Owner.rfAckStartHolePunching(Result, ErrMsg, GameType, ReqStartUserID);
}

function bool rfReqRecvForceFailedClientLoading(int ErrCode)
{
    return Owner.rfReqRecvForceFailedClientLoading(ErrCode);
}

function bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID)
{
    return Owner.rfAckItemListInItemBox(Result, ErrMsg, ItemUniqueID, BoxItemID, ItemID, PartID);
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    return Owner.rfAckGetItemFromItemBox(Result, ErrMsg, ItemIDChoose, PartIDChoose, BoxItemIdx, BxoItemCount, bHave, ItemIdx, UntilTime, StackCount);
}

function bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    return Owner.rfAckAutoChangedTeamUserList(UserID, TeamNum);
}

function bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    return Owner.rfAckInviteGameRoom(Result, Answer, GuestCharName);
}

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    return Owner.rfReqRecvInviteGameRoom(InviteUserServerName, InviteUserServerID, InviteUserChannelNumber, RoomUniqueID, RoomNumber, RoomName, RoomState, MapName, OwnerName, GameMode, WeaponLimit, IsTeamBalance, Password, InviteCharName);
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    return Owner.rfAckRecvInviteGameRoomResult(Result);
}

function bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    return Owner.rfAckLimitedListInChannel(Result, LimitedMapID, LimitedModeID);
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    return Owner.rfAckClanMatch_GetReady(Result, ErrMsg, RoomIndex);
}

function bool rfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_StartCombat(Result, ErrMsg);
}

function bool rfAckClanMatch_NotifiyStartCombat(array<int> MapNumArray, int VersusMode)
{
    return Owner.rfAckClanMatch_NotifiyStartCombat(MapNumArray, VersusMode);
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_Join(Result, ErrMsg);
}

function bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckClanMatch_JoinNotify(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, ClanName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckClanMatch_LeaveNotify(string CharName)
{
    return Owner.rfAckClanMatch_LeaveNotify(CharName);
}

function bool rfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckClanMatch_MemberList(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, ClanName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckClanMatch_Leave(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_Leave(Result, ErrMsg);
}

function bool rfAckClanMatch_Chat(int Result, string ErrMsg, string CharName, string Msg)
{
    return Owner.rfAckClanMatch_Chat(Result, ErrMsg, CharName, Msg);
}

function bool rfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    return Owner.rfAckClanMatch_WaittingTeamList(TtotlCount, Grade, Map, Versus);
}

function bool rfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    return Owner.rfAckClanMatch_ChangeLeader(Result, ErrMsg, NewLeader, NewLeaderName);
}

function bool rfAckClanMatch_StartSearching(int Result, string ErrMsg, int ShouldWaitMore)
{
    return Owner.rfAckClanMatch_StartSearching(Result, ErrMsg, ShouldWaitMore);
}

function bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore)
{
    return Owner.rfAckClanMatch_NotifyStartSearching(ShouldWaitMore);
}

function bool rfAckClanMatch_FoundMatch()
{
    return Owner.rfAckClanMatch_FoundMatch();
}

function bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    return Owner.rfReqClanMatch_FoundMatch(ChannelID, RoomNumber);
}

function bool rfAckClanMatch_StopSearching()
{
    return Owner.rfAckClanMatch_StopSearching();
}

function bool rfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    return Owner.rfAckClanMatch_SetWaitRoomPublic(Result, ErrMsg, Set);
}

function bool rfAckQuestListStart(int Result, string ErrMsg)
{
    return Owner.rfAckQuestListStart(Result, ErrMsg);
}

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest)
{
    return Owner.rfAckQuestList(QuestID, CountPrograss, IsDailyQuest);
}

function bool rfAckQuestListEnd()
{
    return Owner.rfAckQuestListEnd();
}

function bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    return Owner.rfAckQuestUpdate(Result, ErrMsg);
}

function bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    return Owner.rfReqQuestNewAvailable(AchivedQuestID, NewQuestID, IsDailyQuest, ExpiredQuest);
}

function bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    return Owner.rfReqDailyQuestNewAvailable(ExpiredQuestID, NewQuestID);
}

function bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_InviteCrew(Result, ErrMsg);
}

function bool rfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    return Owner.rfReqClanMatch_RecvInviteCrew(Inviter, ServerIP, Port, WaittingID, Msg, MapNum, InviteUserChannelNum, LeaderName, RoomName);
}

function bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    return Owner.rfReqClanMatch_InviteCrewResult(Invitee, Result);
}

function bool rfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    return Owner.rfAckCheckEquipedWeaponDurability(Result, ItemUniqueID, ItemSlotNum);
}

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    return Owner.rfAckWebzenCash(Result, ErrMsg, PCoinCash, CCoinCash);
}

function bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    return Owner.rfAckWebzenShopScriptVersion(Year, YearId, SalesZoneCode);
}

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    return Owner.rfAckRegisteredPCBangInfo(Result, ErrMsg, IsRegisteredPCBang, IsMainPCBang, PCBangName);
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    return Owner.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID);
}

function bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    return Owner.rfAckClanMatch_GetClanWaittingRoomInfo(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, WaitRoomName);
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    return Owner.rfAckBuyItemByWebzenCash(Result, ErrMsg);
}

function bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    return Owner.rfAckGiftItemByWebzenCash(Result, ErrMsg, LeftProductCount);
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckPCBangUserListStart(Result, TotalCount);
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckPCBangUserList(FriendName, ClanName, CM_Pattern, CM_BG, CM_BL, Level, ClanGrade, ClanWin, ClanLose, IsLookForClan, IsCombat, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckPCBangUserListEnd()
{
    return Owner.rfAckPCBangUserListEnd();
}

function bool rfReqIsPaidWebzenPCBang(byte IsPaid)
{
    return Owner.rfReqIsPaidWebzenPCBang(IsPaid);
}

function bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    return Owner.rfAckRegisterMainPCBang(Result, ErrMsg);
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    return Owner.rfAckRandomBox_Use(Result, ErrMsg, RandomBoxItemIdx, RandomBxoItemCount, ItemIDChoose, PartIDChoose, PeriodOnChoosenItem, StackCountOnChoosenItem, bHave, ItemIdx, UntilTime, StackCount);
}

function bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    return Owner.rfAckWebzenBillingStorageListStart(Result, ErrMsg, TotalCount, TotalPage, CurPage);
}

function bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    return Owner.rfAckWebzenBillingStorageList(Seq, ItemSeq, GroupCode, ShareFlag, ProductSeq, CashName, CashPoint, SendAccountID, SendMessage, ItemType, RelationType, ProductType, PriceSeq);
}

function bool rfAckWebzenBillingStorageListEnd()
{
    return Owner.rfAckWebzenBillingStorageListEnd();
}

function bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    return Owner.rfAckPaidItem_EraseRecord(Result, ErrMsg, ItemIdx, Command, RemainCount);
}

function bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return Owner.rfAckPaidItem_BroadCast(Result, ErrMsg, ItemIdx, StackCount);
}

function bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    return Owner.rfAckPaidItem_RelayBroadcast(CharName, Msg);
}

function bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    return Owner.rfAckWebzenBillingUseStorageItem(Result, ErrMsg, ItemIdx, ItemID, ItemExtra);
}

function bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    return Owner.rfAckPaidItem_ClanMarkDupCheck(Result, ErrMsg);
}

function bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return Owner.rfAckPaidItem_ChangeClanMark(Result, ErrMsg, ItemIdx, StackCount);
}

function bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    return Owner.rfAckPaidItem_NotifyChangeClanMark(ClanName, Pattern, BG, BL);
}

function bool rfAckQuestGetAvailableEventList(int Result, string ErrMsg, array<int> QuestID)
{
    return Owner.rfAckQuestGetAvailableEventList(Result, ErrMsg, QuestID);
}

function bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    return Owner.rfAckCharBlockInfo(Result, ChatBlockStartTime, ChatBlockEndTime, BlockedItemIdx);
}

function bool rfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    return Owner.rfReqExteriorRoomOwnerInfo(RoomNum, OwnerName, OwnerIP);
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    return Owner.rfAckChangeRoomTitle_GM(Result, RoomNumber, NewRoomTitle);
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return Owner.rfAckNotice_GM(Result, ErrMsg, NoticeType, ServerID, ChannelNum, GameRoomNum, Msg);
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    return Owner.rfAckForceDisconnectUser_GM(Result, ErrMsg, CharName);
}

function bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    return Owner.rfAckGMEnterRoom(Result, RoomNumber, UserID);
}

function bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    return Owner.rfAckGMLeaveRoom(Result, RoomNumber, UserID);
}

function bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    return Owner.rfAckRecvSystemMsg(CommunityType, MsgInfo);
}

function bool rfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    return Owner.rfAckRoomUserPingInfo(UnqueID, Ping, HostPriorityPoint);
}

function bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    return Owner.rfAckSetLookForClan(Result, ErrMsg, IsLookingFor);
}

function bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    return Owner.rfAckGetMyMailBoxState(Result, IsFull, NewMailCount);
}

function bool rfAckNotifyStartTutorial(int Result, int UserID)
{
    return Owner.rfAckNotifyStartTutorial(Result, UserID);
}

function bool rfAckNotifyEndTutorial(int UserID, string CharName, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckNotifyEndTutorial(UserID, CharName, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    return Owner.rfAckPaidItem_ChangeCharname(Result, ErrMsg, ItemIdx, RemainCount, NewCharname);
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    return Owner.rfAckPaidItem_ChangeClanname(Result, ErrMsg, ItemIdx, RemainCount, NewCharname);
}

function bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    return Owner.rfAckPaidItem_NotifyChangeClanname(NewClanname);
}

function bool rfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    return Owner.rfAckClanMatch_StartPublicWaitRoomList(Result, ErrMsg, Count);
}

function bool rfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    return Owner.rfAckClanMatch_PublicWaitRoomList(WaitRoomIdx, LeaderName, RoomName, MapNum, CurUserCount, MaxUserCount, Status);
}

function bool rfAckClanMatch_EndPublicWaitRoomList()
{
    return Owner.rfAckClanMatch_EndPublicWaitRoomList();
}

function bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    return Owner.rfAckClanMatch_PublicWaitRoomChanged(WaitRoomIdx, RoomName, MapNum, CurUserCount, MaxUserCount, Status, IsPublic);
}

function bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    return Owner.rfAckClanMatch_ChangeRoomSetting(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, IsPublic);
}

function bool rfAckServerType(byte Type)
{
    return Owner.rfAckServerType(Type);
}

function bool rfReqInGameRoomUserInfoChanged()
{
    return Owner.rfReqInGameRoomUserInfoChanged();
}

function bool rfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    return Owner.rfAckClanMatchResultHistory(MatchDate, IsWin, EnemyClanname);
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    return Owner.rfAckCharDetailInfo(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    return Owner.rfAckGetRankingInfoListStart(Result, RankingType, CommunityType, TotalCount);
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckGetRankingInfoList(Result, RankingType, CommunityType, CharName, CharLevel, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Ranking_Accum, Ranking_Accum_Prev, Ranking_Accum_Exp, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
}

function bool rfAckGetRankingInfoListEnd()
{
    return Owner.rfAckGetRankingInfoListEnd();
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    return Owner.rfAckNotifyUpdateCharInfo_LevelMark(CharName, LevelMarkID);
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log("[BTTcpHandlerMed::rfAckLogOut] Result=" $ string(Result) $ " Reason=" $ string(Reason));
    return Owner.rfAckLogOut(Result, Reason);
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    Log("[BTTcpHandlerMed::rfAckFriendPosition] Result=" $ string(Result) $ " UserName=" $ TargetCharName $ " ServerName=" $ fServername);
    return Owner.rfAckFriendPosition(Result, TargetCharName, ServerType, fServername, fServerShortName, fServerIP, fServerPort, CurPos, CurState, ChannelNum, ChannelNickName, GameRoomNum);
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log("[BTTcpHandlerMed::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year) $ " YearId=" $ string(YearId) $ " SalesZoneCode=" $ string(SalesZoneCode));
    return Owner.rfUpdateWebzenShopScriptVersion(Year, YearId, SalesZoneCode);
}

function bool rfAckPopUpMessage(int MessageType)
{
    Log("[BTTcpHandlerMed::rfAckPopUpMessage(] MessageType=" $ string(MessageType));
    return Owner.rfAckPopUpMessage(MessageType);
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTTcpHandlerMed::rfAckMoveToLobby(] MessageType=" $ string(MessageType));
    return Owner.rfAckMoveToLobby(MessageType);
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTTcpHandlerMed::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    Owner.rfAckTencent_StartTenProtect(CharDBID);
    return false;
}

function bool rfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    Log("[BTTcpHandlerMed::rfNotifyNewNickName()] Community_Type=" $ string(Community_Type));
    Owner.rfNotifyNewNickName(Community_Type, Old_NickName, New_NickName);
    return false;
}

function bool rfNotifyNewClanName(string New_NickName)
{
    Log("[BTTcpHandlerMed::rfNotifyNewClanName()] New_NickName=" $ New_NickName);
    Owner.rfNotifyNewClanName(New_NickName);
    return false;
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log("[BTTcpHandler::rfNotifyClanLevelup()] ClanName=" $ ClanName $ " Level=" $ string(Levelup));
    Owner.rfNotifyClanLevelup(ClanName, Levelup);
    return false;
}

function bool rfAckShopItemData()
{
    Log("[BTTcpHandlerMed::rfAckShopItemData()]");
    Owner.rfAckShopItemData();
    return false;
}

function bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductRowGuid, array<string> ServiceCode, array<string> ProductName, array<string> ProductCode, array<string> ProductType, array<byte> SaleType, array<string> ItemSaleType, array<byte> ISIncludeBonus, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> TotalQuantity, array<int> ReOrderTerms, array<int> ReorderCount, array<int> PurchaseAvailableQuantity, array<int> AvailableMinLevel, array<int> AvailableMaxLevel, array<byte> AvailableGender, array<int> InventoryKeepDays, array<int> SaleMasterFlag, array<int> SaleStatus, array<string> Description, array<string> Property0, array<string> Property1, array<string> Property2, array<string> Property3, array<string> Property4, array<int> IsGift)
{
    Log("[BTTcpHandlerMed::rfReqNotifyShopItemData()]");
    Owner.rfReqNotifyShopItemData(ProductNo, ProductRowGuid, ServiceCode, ProductName, ProductCode, ProductType, SaleType, ItemSaleType, ISIncludeBonus, ProductCost, ProductHour, ProductQuantity, TotalQuantity, ReOrderTerms, ReorderCount, PurchaseAvailableQuantity, AvailableMinLevel, AvailableMaxLevel, AvailableGender, InventoryKeepDays, SaleMasterFlag, SaleStatus, Description, Property0, Property1, Property2, Property3, Property4, IsGift);
    return false;
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    Log("[BTTcpHandlerMed::rfAckCouponUse(" $ string(Result) $ ")]");
    Owner.rfAckCouponUse(Result, ErrMsg);
    return false;
}

function bool rfReqNotifyShopItemDataEnd(int Ver)
{
    Log("[BTTcpHandlerMed::rfReqNotifyShopItemDataEnd(" $ string(Ver) $ ")]");
    Owner.rfReqNotifyShopItemDataEnd(Ver);
    return false;
}

function bool rfNotifyCouponUseError(int Time)
{
    Log("[BTTcpHandlerMed::rfNotifyCouponUseError(" $ string(Time) $ ")]");
    Owner.rfNotifyCouponUseError(Time);
    return true;
}

function bool rfReqAhnHsObject(array<byte> Data, int DataSize)
{
    Log("[BTTcpHandlerMed::rfReqAhnHsObject] DataSize- " $ string(DataSize) $ " " $ string(Data.Length));
    Owner.rfReqAhnHsObject(Data, DataSize);
    return true;
}

function bool rfReqAhnNotifyDisconnct(int Code)
{
    Log("[BTTcpHandlerMed::rfReqAhnNotifyDisconnct] Code- " $ string(Code));
    Owner.rfReqAhnNotifyDisconnct(Code);
    return true;
}
