class BTPageAuction_TCP extends BTTcpLink_Channel;

var export editinline BTPageAuction Owner;

function bool rfAckAuctionItemListCount(int Result, string ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count)
{
    return Owner.rfAckAuctionItemListCount(Result, ErrMsg, Section, Classfy, ItemType, ItemGrade, Count);
    //return;    
}

function bool rfAckAuctionMyItemRegister(int Result, string ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain)
{
    return Owner.rfAckAuctionMyItemRegister(Result, ErrMsg, BeginPrice, BuyPrice, GuarantyPoint, PointRemain);
    //return;    
}

function bool rfAckAuctionMyItemCancel(int Result, string ErrMsg)
{
    return Owner.rfAckAuctionMyItemCancel(Result, ErrMsg);
    //return;    
}

function bool rfAckAuctionItemListStart(int Result, string ErrMsg, byte Section, int PageNum, int Count)
{
    return Owner.rfAckAuctionItemListStart(Result, ErrMsg, Section, PageNum, Count);
    //return;    
}

function bool rfAckAuctionItemList(byte Section, array<int> UniqueIDs, array<int> ItemIDs, array<int> AddPartsIDs, array<BtrDouble> UntilTimes, array<int> BiddingPrices, array<int> InstantlyByuingPrices, array<int> ItemDamageds, array<string> HighestBidderNames, array<string> SellerNames, array<int> ItemCount)
{
    return Owner.rfAckAuctionItemList(Section, UniqueIDs, ItemIDs, AddPartsIDs, UntilTimes, BiddingPrices, InstantlyByuingPrices, ItemDamageds, HighestBidderNames, SellerNames, ItemCount);
    //return;    
}

function bool rfAckAuctionItemListEnd(byte Section)
{
    return Owner.rfAckAuctionItemListEnd(Section);
    //return;    
}

function bool rfAckAuctionTradeHistory(int Result, string ErrMsg, int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    return Owner.rfAckAuctionTradeHistory(Result, ErrMsg, ItemID, PartID, SellerCharNm, DamageDegree, Price);
    //return;    
}

function bool rfAckAuctionBidding(int Result, string ErrMsg, int PointRemain)
{
    return Owner.rfAckAuctionBidding(Result, ErrMsg, PointRemain);
    //return;    
}

function bool rfAckAuctionInstantlyBuying(int Result, string ErrMsg, int PointRemain)
{
    return Owner.rfAckAuctionInstantlyBuying(Result, ErrMsg, PointRemain);
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
