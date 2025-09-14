class BTPageInventory_TCP extends BTTcpLink_Channel;

var export editinline BTPageInventory Owner;

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

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return Owner.rfAckEquipItem(ChangedNewItemID, ChangedNewUniqueID, ChangedNewSlotPosition, ChangedOldItemID, ChangedOldUniqueID, ChangedOldSlotPosition, Result, ErrMsg);
    //return;    
}

function bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    return Owner.rfAckConfirmItemChanged(Result, ErrMsg);
    //return;    
}

function bool rfReqConfirmSkillChanged()
{
    return Owner.rfReqConfirmSkillChanged();
    //return;    
}

function bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    return Owner.rfAckSellShopItemInfo(Result, ErrMsg, UniqueItemID, SellPoint, CurPoint, AfterPoint);
    //return;    
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    return Owner.rfAckSellShopItem(Result, ErrMsg, PointRemain, CashRemain, Count);
    //return;    
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    return Owner.rfAckModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point, Cash);
    //return;    
}

function bool rfAckGP20CashModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point)
{
    return Owner.rfAckGP20CashModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point);
    //return;    
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    return Owner.rfAckUpdateQSlot(Result, ErrMsg);
    //return;    
}

function bool rfAckUpdateQSlot_2(int Result, string ErrMsg, array<byte> DisplayOrder, array<int> ItemTID, array<BtrDouble> ItemUID, array<byte> SlotPos_Key, array<byte> SlotPos_Value)
{
    return Owner.rfAckUpdateQSlot_2(Result, ErrMsg, DisplayOrder, ItemTID, ItemUID, SlotPos_Key, SlotPos_Value);
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

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    return Owner.rfAckCouponUse(Result, ErrMsg);
    //return;    
}
