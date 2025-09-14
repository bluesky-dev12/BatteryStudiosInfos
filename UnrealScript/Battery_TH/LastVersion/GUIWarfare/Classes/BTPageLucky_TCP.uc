class BTPageLucky_TCP extends BTTcpLink_Channel;

var export editinline BTPageLucky Owner;

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

function bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time, int GetItemID)
{
    return Owner.rfAckLuckShop_LotteryWinnerList(CapsuleItemID, IsNotification, NickName, Time, GetItemID);
    //return;    
}

function bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState)
{
    return Owner.rfAckLuckShop_StorageInfo(ErrorCode, BuyingCapsuleCount, CapsuleRewardState);
    //return;    
}

function bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState)
{
    return Owner.rfAckLuckShop_RewardBuyingCount(ErrorCode, FinalCapsuleRewardState);
    //return;    
}

function bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, BtrDouble Coupon_ItemUniqueID, int Coupon_Count_AfterReduction)
{
    return Owner.rfAckLuckShop_RewardCoupon(ErrorCode, Coupon_ItemTypeID, Coupon_ItemUniqueID, Coupon_Count_AfterReduction);
    //return;    
}
