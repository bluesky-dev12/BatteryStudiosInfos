/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageStore_TCP.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:7
 *
 *******************************************************************************/
class BTPageStore_TCP extends BTTcpLink_Channel;

var export editinline BTPageStore Owner;

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

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    return Owner.rfAckSendGift(Result, ErrMsg, PointRemain, CashRemain);
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    return Owner.rfAckBuyItemByWebzenCash(Result, ErrMsg);
}

function bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    return Owner.rfAckGiftItemByWebzenCash(Result, ErrMsg, LeftProductCount);
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    return Owner.rfAckCouponUse(Result, ErrMsg);
}
