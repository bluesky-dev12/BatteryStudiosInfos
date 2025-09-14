/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageInventory_TCP.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:15
 *
 *******************************************************************************/
class BTPageInventory_TCP extends BTTcpLink_Channel;

var export editinline BTPageInventory Owner;

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

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return Owner.rfAckEquipItem(ChangedNewItemID, ChangedNewUniqueID, ChangedNewSlotPosition, ChangedOldItemID, ChangedOldUniqueID, ChangedOldSlotPosition, Result, ErrMsg);
}

function bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    return Owner.rfAckConfirmItemChanged(Result, ErrMsg);
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    return Owner.rfAckEquipSkill(ChangedNewSkillID, ChangedNewSkillUniqueID, ChangedNewSlotPosition, ChangedOldSkillID, ChangedOldSkillUniqueID, ChangedOldSlotPosition, Result, ErrMsg);
}

function bool rfReqConfirmSkillChanged()
{
    return Owner.rfReqConfirmSkillChanged();
}

function bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    return Owner.rfAckSellShopItemInfo(Result, ErrMsg, UniqueItemID, SellPoint, CurPoint, AfterPoint);
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    return Owner.rfAckSellShopItem(Result, ErrMsg, PointRemain, CashRemain, Count);
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    return Owner.rfAckModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point, Cash);
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    return Owner.rfAckUpdateQSlot(Result, ErrMsg);
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    return Owner.rfAckRepairCost(Result, ErrMsg, UniqueItemID, RepairCost);
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    return Owner.rfAckRepairItem(Result, ErrMsg, UniqueItemID, RepairCost, DamageDegree);
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    return Owner.rfAckGetItemFromItemBox(Result, ErrMsg, ItemIDChoose, PartIDChoose, BoxItemIdx, BxoItemCount, bHave, ItemIdx, UntilTime, StackCount);
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    return Owner.rfAckCouponUse(Result, ErrMsg);
}
