class BTPageStore_TCP extends BTTcpLink_Channel;

var export editinline BTPageStore Owner;

function bool rfAckShopItemListStart(int Count)
{
    return Owner.rfAckShopItemListStart(Count);
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    return Owner.rfAckShopItemList(ItemID);
    //return;    
}

function bool rfAckShopItemListEnd()
{
    return Owner.rfAckShopItemListEnd();
    //return;    
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    return Owner.rfAckSendGift(Result, ErrMsg, PointRemain, CashRemain);
    //return;    
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    return Owner.rfAckBuyItemByWebzenCash(Result, ErrMsg);
    //return;    
}

function bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    return Owner.rfAckGiftItemByWebzenCash(Result, ErrMsg, LeftProductCount);
    //return;    
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    return Owner.rfAckCouponUse(Result, ErrMsg);
    //return;    
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    return Owner.rfAckModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point, Cash);
    //return;    
}
