/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMatchUserInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:26
 *	Functions:9
 *
 *******************************************************************************/
class wMatchUserInfo extends Object;

var int UID;
var string UserName;
var int TeamNum;
var string ClanName;
var int ClanMark;
var int ClanBG;
var int ClanBL;
var int IsLookingFor;
var int ClanLevel;
var string UserIP;
var int Grade;
var array<EquippedItemInfo> EquippedItems;
var array<EquippedSkillInfo> EquippedSkills;
var array<EquippedQSlotInfo> EquippedQSlots;
var bool IsHost;
var byte bLoadingState;
var int RoundPlayed;
var int TimePlayed;
var bool bSendPing;
var bool bReceivedPing;
var int iReceivedPing;
var int LevelMarkID;
var int TitleMarkID;
var int Reserved1;
var int Reserved2;
var int Reserved3;

function float GetBonusExP(wGameManager GameMgr)
{
    local float bonus;
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x43 [While If]
    if(lp1 < EquippedItems.Length)
    {
        bonus += ExtractBonusExp(EquippedItems[lp1].ItemID, GameMgr);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 1.0 + bonus;
}

function float GetBonusPoint(wGameManager GameMgr)
{
    local float bonus;
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x43 [While If]
    if(lp1 < EquippedItems.Length)
    {
        bonus += ExtractBonusPoint(EquippedItems[lp1].ItemID, GameMgr);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 1.0 + bonus;
}

function float ExtractBonusExp(int ItemID, wGameManager GameMgr)
{
    local wItemBaseParam baseParam;

    baseParam = GameMgr.GetItemParam(ItemID);
    // End:0x48
    if(baseParam.strAddOption[0] == "exp+")
    {
        return float(baseParam.strOptionValue[0]);
    }
    return 0.0;
}

function float ExtractBonusPoint(int ItemID, wGameManager GameMgr)
{
    local wItemBaseParam baseParam;

    baseParam = GameMgr.GetItemParam(ItemID);
    // End:0x4a
    if(baseParam.strAddOption[0] == "point+")
    {
        return float(baseParam.strOptionValue[0]);
    }
    return 0.0;
}

function SetItemUse(int i)
{
    EquippedItems[i].ItemOnUse = 1;
    ++ EquippedItems[i].ItemUsedCount;
}

function ResetItemUse(int i, float Time)
{
    // End:0x44
    if(EquippedItems[i].ItemOnUse == 1)
    {
        EquippedItems[i].ItemUsedSeconds += int(Time);
        EquippedItems[i].ItemOnUse = 0;
    }
}

function ResetQSlotItemUse(int i, int j, float Time)
{
    // End:0x56
    if(EquippedQSlots[i].ItemOnUse[j] == 1)
    {
        EquippedQSlots[i].ItemUsedSeconds[j] += int(Time);
        EquippedQSlots[i].ItemOnUse[j] = 0;
    }
}

function int GetPaintIDEquippedItems(int weaponID)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x4c [While If]
    if(lp1 < EquippedItems.Length)
    {
        // End:0x42
        if(EquippedItems[lp1].ItemID == weaponID)
        {
            return EquippedItems[lp1].Painting_Item_ID;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 0;
}

function LogUsedStatus()
{
    local int i, j;
    local EquippedItemInfo Item;

    Log("[wMatchUserInfo::LogUsedStatus] UserName=" $ UserName);
    i = 0;
    J0x3b:
    // End:0xbd [While If]
    if(i < EquippedItems.Length)
    {
        Item = EquippedItems[i];
        Log("  ItemID=" $ string(Item.ItemID) $ " UniqueID=" $ UnresolvedNativeFunction_99(Item.UniqueID) $ " UsedSeconds=" $ string(Item.ItemUsedSeconds));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    i = 0;
    J0xc4:
    // End:0x19d [While If]
    if(i < EquippedQSlots.Length)
    {
        j = 0;
        J0xdb:
        // End:0x193 [While If]
        if(j < 4)
        {
            Log("  QSLOT[" $ string(i) $ "," $ string(j) $ "]" $ " ItemID=" $ string(EquippedQSlots[i].ItemID[j]) $ " UniqueID=" $ UnresolvedNativeFunction_99(EquippedQSlots[i].ItemUniqueID[j]) $ " UsedSeconds=" $ string(EquippedQSlots[i].ItemUsedSeconds[j]));
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0xdb;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc4;
    }
}

defaultproperties
{
    UID=-1
    TeamNum=-1
}