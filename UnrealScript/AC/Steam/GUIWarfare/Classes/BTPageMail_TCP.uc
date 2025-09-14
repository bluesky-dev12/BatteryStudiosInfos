/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageMail_TCP.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:10
 *
 *******************************************************************************/
class BTPageMail_TCP extends BTTcpLink_Channel;

var export editinline BTPageMail Owner;

function bool rfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    return Owner.rfAckSendMemo(CnamesToFail, ResultArray);
}

function bool rfReqRecvMemo(string cnameFrom, byte MemoType)
{
    return Owner.rfReqRecvMemo(cnameFrom, MemoType);
}

function bool rfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    return Owner.rfAckStartMemoList(Result, ErrMsg, Type, TotalCount);
}

function bool rfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    return Owner.rfAckMemoList(MemoIdx, cnameFrom, dateRecv, Text, Status, UntilExpire, ItemUID, ItemID, MsgType, ItemPartID);
}

function bool rfAckEndMemoList()
{
    return Owner.rfAckEndMemoList();
}

function bool rfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    return Owner.rfAckReadMemo(cnameFrom, Text, dateRecv, ItemUID);
}

function bool rfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    return Owner.rfAckDelMemo(Result, ErrMsg, FailedMemoID);
}

function bool rfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    return Owner.rfAckDeleteMailAll(Result, MailType, Count);
}

function bool rfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    return Owner.rfAckGetAttachedItemFromMemo(Result, ErrMsg, ItemIdx, ItemID);
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    return Owner.rfAckDBCharInfo(Result, ErrMsg, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanPersonIntro, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo, ClanLevel);
}
