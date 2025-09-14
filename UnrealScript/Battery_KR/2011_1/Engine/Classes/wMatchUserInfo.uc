class wMatchUserInfo extends Object;

var int UID;
var string UserName;
var int TeamNum;
var string Clanname;
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

    // End:0x43 [Loop If]
    if(lp1 < EquippedItems.Length)
    {
        bonus += (ExtractBonusExp(EquippedItems[lp1].ItemID, GameMgr));
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 1.0000000 + bonus;
    //return;    
}

function float GetBonusPoint(wGameManager GameMgr)
{
    local float bonus;
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x43 [Loop If]
    if(lp1 < EquippedItems.Length)
    {
        bonus += (ExtractBonusPoint(EquippedItems[lp1].ItemID, GameMgr));
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 1.0000000 + bonus;
    //return;    
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
    return 0.0000000;
    //return;    
}

function float ExtractBonusPoint(int ItemID, wGameManager GameMgr)
{
    local wItemBaseParam baseParam;

    baseParam = GameMgr.GetItemParam(ItemID);
    // End:0x4A
    if(baseParam.strAddOption[0] == "point+")
    {
        return float(baseParam.strOptionValue[0]);
    }
    return 0.0000000;
    //return;    
}

function SetItemUse(int i)
{
    EquippedItems[i].ItemOnUse = 1;
    EquippedItems[i].ItemUsedCount++;
    //return;    
}

function ResetItemUse(int i, float Time)
{
    // End:0x44
    if(int(EquippedItems[i].ItemOnUse) == 1)
    {
        EquippedItems[i].ItemUsedSeconds += int(Time);
        EquippedItems[i].ItemOnUse = 0;
    }
    //return;    
}

function ResetQSlotItemUse(int i, int j, float Time)
{
    // End:0x56
    if(int(EquippedQSlots[i].ItemOnUse[j]) == 1)
    {
        EquippedQSlots[i].ItemUsedSeconds[j] += int(Time);
        EquippedQSlots[i].ItemOnUse[j] = 0;
    }
    //return;    
}

function int GetPaintIDEquippedItems(int weaponID)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(lp1 < EquippedItems.Length)
    {
        // End:0x42
        if(EquippedItems[lp1].ItemID == weaponID)
        {
            return EquippedItems[lp1].Painting_Item_ID;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

function LogUsedStatus()
{
    local int i, j;
    local EquippedItemInfo Item;

    Log("[wMatchUserInfo::LogUsedStatus] UserName=" $ UserName);
    i = 0;
    J0x3B:

    // End:0xBD [Loop If]
    if(i < EquippedItems.Length)
    {
        Item = EquippedItems[i];
        Log((((("  ItemID=" $ string(Item.ItemID)) $ " UniqueID=") $ __NFUN_918__(Item.UniqueID)) $ " UsedSeconds=") $ string(Item.ItemUsedSeconds));
        i++;
        // [Loop Continue]
        goto J0x3B;
    }
    i = 0;
    J0xC4:

    // End:0x19D [Loop If]
    if(i < EquippedQSlots.Length)
    {
        j = 0;
        J0xDB:

        // End:0x193 [Loop If]
        if(j < 4)
        {
            Log(((((((((("  QSLOT[" $ string(i)) $ ",") $ string(j)) $ "]") $ " ItemID=") $ string(EquippedQSlots[i].ItemID[j])) $ " UniqueID=") $ __NFUN_918__(EquippedQSlots[i].ItemUniqueID[j])) $ " UsedSeconds=") $ string(EquippedQSlots[i].ItemUsedSeconds[j]));
            j++;
            // [Loop Continue]
            goto J0xDB;
        }
        i++;
        // [Loop Continue]
        goto J0xC4;
    }
    //return;    
}

defaultproperties
{
    UID=-1
    TeamNum=-1
}