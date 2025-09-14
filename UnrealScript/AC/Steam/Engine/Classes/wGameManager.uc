/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wGameManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:14
 *	Enums:7
 *	Structs:8
 *	Properties:85
 *	Functions:239
 *
 *******************************************************************************/
class wGameManager extends Object
    dependson(wMapInfo)
    dependson(wPaintGroupParam)
    dependson(wWeaponCustomInfoParam)
    dependson(wItemResourceParam)
    dependson(wPartsGroupParam)
    dependson(wItemBoxParam)
    dependson(wGameManagerScriptPart)
    dependson(wClanMarkParam)
    dependson(wModeDOAParam)
    dependson(wRandBoxParam)
    dependson(wQuestParam)
    dependson(wDailyQuestParam)
    dependson(wItemBoxHK)
    dependson(wItemBoxInstanceHK)
    dependson(wItemBoxCashHK)
    dependson(wPromotionParam)
    dependson(wClanLevelInfoParam)
    dependson(wLevelInfoParam)
    dependson(wSkillBaseParam)
    dependson(wDefenceGameParam)
    dependson(wNPCActionGroupParam)
    dependson(wNPCItemGroupParam)
    dependson(wNPCNameGroupParam)
    dependson(wNPCParam)
    dependson(wNPCSpawnParam)
    dependson(ClanMarkManager)
    dependson(wWeaponCustomPartsParam)
    dependson(wSkillBoxHK)
    dependson(wQuickSlotBoxHK)
    dependson(ClanNameAndMark)
    dependson(DelegateEventTimer)
    native;

const LevelImageCount = 64;
const LevelImageRowCount = 16;
const LevelImageWidth = 32;
const LevelImageHeight = 32;
const kIISF_Disabled = -1;
const kIISF_Enabled = 0x00;
const kIISF_New = 0x01;
const kIISF_Event = 0x02;
const kIISF_Limited = 0x04;
const kIISF_Hot = 0x08;
const kIISF_Best = 0x10;
const kIISF_Reserved = 0x20;
const kIISF_Sales = 0x40;
const kIISF_All = 0x7F;

enum EItemType
{
    ITYPE_AR,
    ITYPE_SMG,
    ITYPE_SR,
    ITYPE_SG,
    ITYPE_MG,
    ITYPE_Pistol,
    ITYPE_TW,
    ITYPE_Knife,
    ITYPE_Head,
    ITYPE_Face,
    ITYPE_Accessory,
    ITYPE_SpChar,
    ITYPE_Cash,
    ITYPE_Body,
    ITYPE_Backpack,
    ITYPE_HW,
    ITYPE_Bomb,
    ITYPE_SPW,
    ITYPE_Meele,
    ITYPE_Skill,
    ITYPE_Part_Sight,
    ITYPE_Part_Silencer,
    ITYPE_Part_Camo,
    ITYPE_Part_Paint,
    ITYPE_Part_Barrel,
    ITYPE_Part_Gunstock,
    ITYPE_Part_Scope,
    ITYPE_Supply,
    ITYPE_Passive,
    ITYPE_ETC,
    ITYPE_ItemBox,
    ITYPE_Use,
    ITYPE_RandBox,
    ITYPE_LVMark,
    ITYPE_GOLD,
    ITYPE_None
};

enum EItemGrade
{
    IGRADE_Base,
    IGRADE_Shop,
    IGRADE_Common,
    IGRADE_Normal,
    IGRADE_High,
    IGRADE_Rare,
    IGRADE_Legend,
    IGRADE_PC,
    IGRADE_PCPLUS,
    IGRADE_Map_Spon,
    IGRADE_Map_Lock,
    IGRADE_Skill,
    IGRADE_Special,
    IGRADE_Part,
    IGRADE_Cash,
    IGRADE_Supply,
    IGRADE_War,
    IGRADE_None
};

enum EEquipSlot
{
    ESlot_Pistol,
    ESlot_MainWeapon,
    ESlot_Special,
    ESlot_Grenade,
    ESlot_Meele,
    ESlot_Body,
    ESlot_Head,
    ESlot_Face,
    ESlot_Accessory,
    ESlot_Backpack,
    ESlot_SpChar,
    ESlot_Part_Sight,
    ESlot_Part_Silencer,
    ESlot_Part_Camo,
    ESlot_Part_Paint,
    ESlot_Skill,
    ESlot_None
};

enum ECastType
{
    CTYPE_Durability,
    CTYPE_Time,
    CTYPE_DurabilityX,
    CTYPE_Number,
    CTYPE_Time2,
    CTYPE_None
};

enum ESkillType
{
    STYPE_Normal,
    STYPE_Clan,
    STYPE_None
};

enum ESkillActiveType
{
    SACT_Active,
    SACT_Passive,
    SACT_None
};

enum EAlienModeType
{
    EAM_HUMAN,
    EAM_HUMAN_HERO,
    EAM_ALIEN,
    EAM_ALIEN_HOST,
    EAM_ALIEN_MASTER
};

struct native init SEAXEffect
{
    var string strClassName;
    var I3DL2Listener EAXEffect;
};

struct native init SDefenceGameParam
{
    var array<wDefenceGameParam> EasyLevel;
    var array<wDefenceGameParam> NormalLevel;
    var array<wDefenceGameParam> HardLevel;
    var array<wDefenceGameParam> VeryHardLevel;
};

struct native init EventTimerStruct
{
    var int EventType;
    var BtrDouble EventTime;
    var int EventTimeAddMSec;
    var DelegateEventTimer EventDelegate;
    var int EventCount;
};

struct native init WebzenInven
{
    var int Seq;
    var int ItemSeq;
    var int GroupCode;
    var int ShareFlag;
    var int ProductSeq;
    var int PriceSeq;
    var string CashName;
    var BtrDouble CashPoint;
    var string SendAccountID;
    var string SendMessage;
    var byte ItemType;
    var byte RelationType;
    var int ProductType;
};

struct native init WebzenShopCategory
{
    var int ParentCatagorySeq;
    var int CatagorySeq;
    var string CatagoryName;
    var int EventFlag;
    var int OpenFlag;
    var array<int> SubCategorySeqList;
    var array<int> PackageSeqList;
};

struct native init WebzenShopProduct
{
    var int PriceSeq;
    var int PropertySeq;
    var int ProductSeq;
    var string ProductName;
    var int Price;
    var int Value;
    var int ItemID;
};

struct native init WebzenShopPackage
{
    var int CategorySeq;
    var int ViewOrder;
    var int PackageSeq;
    var string PackageName;
    var int CashPrice;
    var string CashName;
    var int PackageType;
    var int CapsuleFlag;
    var int EventFlag;
    var int SalesFlag;
    var int GiftFlag;
    var int ImageTagType;
    var int LeftCount;
    var int ItemID;
    var string ItemDesc;
    var string ItemWarn;
    var int StartDate_Year;
    var int StartDate_Month;
    var int StartDate_Day;
    var int StartDate_Hour;
    var int StartDate_Min;
    var int StartDate_Sec;
    var int StartDate_YDay;
    var int EndDate_Year;
    var int EndDate_Month;
    var int EndDate_Day;
    var int EndDate_Hour;
    var int EndDate_Min;
    var int EndDate_Sec;
    var int EndDate_YDay;
    var array<WebzenShopProduct> ProductList;
    var array<WebzenShopProduct> PriceList;
};

struct native init GP20Product
{
    var array<int> ProductNo;
    var array<int> ProductCost;
    var array<int> ProductHour;
    var array<int> ProductQuantity;
    var array<byte> SaleType;
    var array<int> SaleStatus;
    var array<int> IsGift;
    var string ProductRowGuid;
    var string ServiceCode;
    var string ProductName;
    var string ProductCode;
    var string ProductType;
    var string ItemSaleType;
    var int SaleMasterFlag;
    var byte ISIncludeBonus;
    var int TotalQuantity;
    var int ReOrderTerms;
    var int ReorderCount;
    var int PurchaseAvailableQuantity;
    var int AvailableMinLevel;
    var int AvailableMaxLevel;
    var byte AvailableGender;
    var int InventoryKeepDays;
    var string Description;
    var string Property0;
    var string Property1;
    var string Property2;
    var string Property3;
    var string Property4;
};

var GameEngine gEngine;
var array<wItemBaseParam> ItemParams;
var array<wItemResourceParam> ItemResParams;
var array<wSkillBaseParam> SkillParams;
var array<wPartsGroupParam> AddPartsGroupParams;
var array<wPaintGroupParam> PaintGroupParams;
var array<wPromotionParam> PromotionParams;
var array<wQuestParam> QuestParams;
var array<wDailyQuestParam> DailyQuestParams;
var array<wRandBoxParam> RandBoxParams;
var array<wClanMarkParam> ClanMarkParams;
var array<wItemBoxParam> ItemBoxParams;
var array<wMapInfo> MapInfos;
var array<wModeDOAParam> ModeDOAParams;
var array<wLevelInfoParam> LevelInfoParams;
var array<wClanLevelInfoParam> ClanLevelInfoParams;
var array<wWeaponCustomInfoParam> WeaponCustomInfoParams;
var array<wWeaponCustomPartsParam> WeaponCustomPartsParams;
var array<int> LevelExps;
var array<string> LevelImages;
var array<Material> LevelTextures;
var array<string> ClanLevelImages;
var array<Material> ClanLevelTextures;
var array<wSkillBoxHK> SkillBoxList;
var array<wQuickSlotBoxHK> QuickSlotBoxList;
var array<wItemBoxHK> UIShowItemLists;
var array<wItemBoxHK> CandidateLists;
var array<wItemBoxInstanceHK> InstanceItemLists;
var array<string> TotalLevelImages;
var array<IntBox> TotalLevelImageCoordinates;
var array<string> BadWords;
var array<string> BadNicks;
var array<float> SupplyRandomArray;
var array<wNPCSpawnParam> NPCSpawnParams;
var array<wNPCParam> NPCParams;
var array<wNPCNameGroupParam> NPCNameGroupParams;
var array<wNPCItemGroupParam> NPCItemGroupParams;
var array<wNPCActionGroupParam> NPCActionGroupParams;
var array<wDefenceGameParam> DefenceGameParamsEasy;
var array<wDefenceGameParam> DefenceGameParamsNormal;
var array<wDefenceGameParam> DefenceGameParamsHard;
var array<wDefenceGameParam> DefenceGameParamsVeryHard;
var array<SEAXEffect> EAXEffectList;
var wGameManagerScriptPart SP;
var string VoicePackageName;
var int LanguageType;
var int TeamIndex;
var bool bUseRagdoll;
var bool bUseGore;
var bool bUseMouseRevision;
var bool bUseStanceToggle;
var bool bUseAdvCamShake;
var int ShopItemListCount;
var array<int> ShopItemList;
var int FlagModify;
var int FlagDurability;
var int FlagRenew;
var int FlagCash;
var int FlagPCBang;
var int FlagSellShop;
var int FlagBuyShop;
var ClanMarkManager cmm;
var array<BtrDouble> kBlockedItemIdx;
var BtrDouble kServerTime;
var int kClientMSec;
var BtrDouble kClientTime;
var BtrDouble kDiffTime;
var bool bForceUpdateEventTimer;
var array<EventTimerStruct> kEventTimerList;
var int kWebzenShopVer_Year;
var int kWebzenShopVer_YearID;
var int kWebzenShopVer_SalesZoneCode;
var array<WebzenInven> kWZInvenList;
var array<WebzenShopCategory> kWZCategoryList;
var array<WebzenShopPackage> kWZPackageList;
var int GP20ShopVersion;
var array<GP20Product> kGP20ProductList;
var delegate<UpdateServerTime> __UpdateServerTime__Delegate;
var delegate<UpdateWebzenShopVerInfo> __UpdateWebzenShopVerInfo__Delegate;
var delegate<UpdateWebzenShopItemList> __UpdateWebzenShopItemList__Delegate;
var delegate<UpdateItemList> __UpdateItemList__Delegate;
var delegate<UpdateWebzenItemList> __UpdateWebzenItemList__Delegate;
var delegate<UpdateSkillBoxList> __UpdateSkillBoxList__Delegate;
var delegate<UpdateQuickSlotBoxList> __UpdateQuickSlotBoxList__Delegate;
var delegate<dele_UpdateEventTimer> __dele_UpdateEventTimer__Delegate;

function WebzenShopPackage GetWebzenShopPackage(int ProductSeq, int PriceSeq)
{
    local int i, j;

    Log("[wGameManager::GetWebzenShopPackage] ProductSeq=" $ string(ProductSeq) $ ", PriceSeq=" $ string(PriceSeq));
    i = 0;
    J0x5c:
    // End:0x1d0 [While If]
    if(i < kWZPackageList.Length)
    {
        j = 0;
        J0x73:
        // End:0x119 [While If]
        if(j < kWZPackageList[i].ProductList.Length)
        {
            // End:0x10f
            if(kWZPackageList[i].ProductList[j].ProductSeq != 0 && kWZPackageList[i].ProductList[j].ProductSeq == ProductSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].ProductList[j].ProductName);
                return kWZPackageList[i];
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x73;
        }
        j = 0;
        J0x120:
        // End:0x1c6 [While If]
        if(j < kWZPackageList[i].PriceList.Length)
        {
            // End:0x1bc
            if(kWZPackageList[i].PriceList[j].PriceSeq != 0 && kWZPackageList[i].PriceList[j].PriceSeq == PriceSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].PriceList[j].ProductName);
                return kWZPackageList[i];
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x120;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
}

function WebzenShopProduct GetWebzenShopProduct(int ProductSeq, int PriceSeq)
{
    local int i, j;

    Log("[wGameManager::GetWebzenShopProduct] ProductSeq=" $ string(ProductSeq) $ ", PriceSeq=" $ string(PriceSeq));
    i = 0;
    J0x5c:
    // End:0x1e6 [While If]
    if(i < kWZPackageList.Length)
    {
        j = 0;
        J0x73:
        // End:0x124 [While If]
        if(j < kWZPackageList[i].ProductList.Length)
        {
            // End:0x11a
            if(kWZPackageList[i].ProductList[j].ProductSeq != 0 && kWZPackageList[i].ProductList[j].ProductSeq == ProductSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].ProductList[j].ProductName);
                return kWZPackageList[i].ProductList[j];
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x73;
        }
        j = 0;
        J0x12b:
        // End:0x1dc [While If]
        if(j < kWZPackageList[i].PriceList.Length)
        {
            // End:0x1d2
            if(kWZPackageList[i].PriceList[j].PriceSeq != 0 && kWZPackageList[i].PriceList[j].PriceSeq == PriceSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].PriceList[j].ProductName);
                return kWZPackageList[i].PriceList[j];
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x12b;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    Log("GetWebzenShopProduct() failed!!!");
}

function WebzenShopPackage GetWebzenShopPackage2(int ItemID, out int iResult)
{
    local int i;

    Log("[wGameManager::GetWebzenShopProduct] ItemID=" $ string(ItemID));
    i = 0;
    J0x40:
    // End:0x87 [While If]
    if(i < kWZPackageList.Length)
    {
        // End:0x7d
        if(kWZPackageList[i].ItemID == ItemID)
        {
            iResult = 1;
            return kWZPackageList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    Log("GetWebzenShopPackage() failed!!!");
    iResult = 0;
}

function GP20Product GetGP20ProductFromCode(int ProductCode, out int iResult)
{
    local int i;
    local GP20Product gp20P;

    iResult = 0;
    i = 0;
    J0x0e:
    // End:0x5c [While If]
    if(i < kGP20ProductList.Length)
    {
        // End:0x52
        if(int(kGP20ProductList[i].ProductCode) == ProductCode)
        {
            gp20P = kGP20ProductList[i];
            iResult = 1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    return gp20P;
}

function int GetGP20ProductNo(int ProductCode, int ProductCost, byte SaleType)
{
    local int i, iResult, ProductNo;
    local GP20Product gp20P;

    ProductNo = -1;
    gp20P = GetGP20ProductFromCode(ProductCode, iResult);
    // End:0xa5
    if(iResult == 1)
    {
        i = 0;
        J0x33:
        // End:0xa5 [While If]
        if(i < gp20P.ProductCost.Length)
        {
            // End:0x9b
            if(gp20P.ProductCost[i] == ProductCost && gp20P.SaleType[i] == SaleType)
            {
                ProductNo = gp20P.ProductNo[i];
            }
            // End:0xa5
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x33;
            }
        }
    }
    return ProductNo;
}

// Export UwGameManager::execDownloadWebzenShopItemList(FFrame&, void* const)
native function DownloadWebzenShopItemList(int Year, int YearId, int salescode);
delegate UpdateServerTime(wGameManager GameMgr);
delegate UpdateWebzenShopVerInfo(wGameManager GameMgr);
delegate UpdateWebzenShopItemList(wGameManager GameMgr);
delegate UpdateItemList(wGameManager GameMgr);
delegate UpdateWebzenItemList(wGameManager GameMgr);
delegate UpdateSkillBoxList(wGameManager GameMgr);
delegate UpdateQuickSlotBoxList(wGameManager GameMgr);
function SetServerTime(BtrDouble S)
{
    local BtrDouble L;

    kServerTime = S;
    GetLocalTimeToBtrDouble(L);
    kDiffTime = BtrDoubleMinus(S, L);
    kClientTime = S;
}

function UpdateClientTime()
{
    local BtrTime t;

    GetLocalTimeToBtrTime(t);
    BtrTimeToBtrDouble(t, kClientTime);
    kClientMSec = t.Milliseconds;
    kClientTime = BtrDoublePlus(kClientTime, kDiffTime);
}

function BtrDouble GetClientTime(optional bool bUpdate)
{
    // End:0x0f
    if(bUpdate)
    {
        UpdateClientTime();
    }
    return kClientTime;
}

function AddEventTimerHMS(int EventType, int Hour, int Min, int sec, optional DelegateEventTimer EventDelegate, optional int msec)
{
    local BtrDouble CurBtrD, PlusBtrD, PlusBtrD2;
    local BtrTime PlusTime, PlusTime2;
    local int Day;

    CurBtrD = GetClientTime(true);
    Log("HMS Set EventTime=" $ string(PlusTime.Year) $ "-" $ string(PlusTime.Month) $ "-" $ string(PlusTime.Day) $ " " $ string(PlusTime.Hour) $ ":" $ string(PlusTime.Minute) $ ":" $ string(PlusTime.Second));
    // End:0xc7
    if(msec + kClientMSec >= 1000)
    {
        sec += 1;
        msec = msec + kClientMSec - 1000;
    }
    // End:0xf8
    if(sec >= 60)
    {
        Min += sec / 60;
        sec = int(float(sec) % float(60));
    }
    // End:0x129
    if(Min >= 60)
    {
        Hour += Min / 60;
        Min = int(float(Min) % float(60));
    }
    // End:0x15a
    if(Hour >= 24)
    {
        Day += Hour / 24;
        Hour = int(float(Hour) % float(24));
    }
    PlusTime.Day = Day;
    PlusTime.Second = sec;
    PlusTime.Hour = Hour;
    PlusTime.Minute = Min;
    BtrTimeToBtrDouble(PlusTime, PlusBtrD);
    BtrTimeToBtrDouble(PlusTime2, PlusBtrD2);
    PlusBtrD = BtrDoubleMinus(PlusBtrD, PlusBtrD2);
    CurBtrD = BtrDoublePlus(CurBtrD, PlusBtrD);
    BtrDoubleToBtrTime(CurBtrD, PlusTime);
    Log("HMS Set EventTime=" $ string(PlusTime.Year) $ "-" $ string(PlusTime.Month) $ "-" $ string(PlusTime.Day) $ " " $ string(PlusTime.Hour) $ ":" $ string(PlusTime.Minute) $ ":" $ string(PlusTime.Second));
    AddEventTimer(EventType, CurBtrD, EventDelegate, msec);
}

function ClearBlockedItem()
{
    kBlockedItemIdx.Length = 0;
}

function AddBlockedItem(BtrDouble D)
{
    local int i;

    kBlockedItemIdx.Length = kBlockedItemIdx.Length + 1;
    kBlockedItemIdx[kBlockedItemIdx.Length - 1] = D;
    i = 0;
    J0x2c:
    // End:0xdc [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0xd2
        if(UnresolvedNativeFunction_99(InstanceItemLists[i].UniqueID, D))
        {
            // End:0x8b
            if(InstanceItemLists[i].SlotPosition == 0)
            {
                FindFirstInstanceItemByItemID(2000).SlotPosition = 0;
            }
            // End:0xbb
            if(InstanceItemLists[i].SlotPosition == 1)
            {
                FindFirstInstanceItemByItemID(1010).SlotPosition = 1;
            }
            InstanceItemLists[i].SlotPosition = 13;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2c;
    }
    RemoveQuickSlotItem(D);
}

function bool IsBlockedItemIdx(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x39 [While If]
    if(i < kBlockedItemIdx.Length)
    {
        // End:0x2f
        if(UnresolvedNativeFunction_99(kBlockedItemIdx[i], D))
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function AddEventTimer(int EventType, BtrDouble EventTime, optional DelegateEventTimer EventDelegate, optional int EventMSec)
{
    local int i;

    bForceUpdateEventTimer = true;
    i = 0;
    J0x0f:
    // End:0xf9 [While If]
    if(i < kEventTimerList.Length)
    {
        // End:0xef
        if(BtrDoubleLessEqual(EventTime, kEventTimerList[i].EventTime))
        {
            // End:0x77
            if(UnresolvedNativeFunction_99(EventTime, kEventTimerList[i].EventTime) && EventMSec > kEventTimerList[i].EventTimeAddMSec)
            {
            }
            // End:0xef
            else
            {
                kEventTimerList.Insert(i, 1);
                kEventTimerList[i].EventType = EventType;
                kEventTimerList[i].EventTime = EventTime;
                kEventTimerList[i].EventTimeAddMSec = EventMSec;
                kEventTimerList[i].EventDelegate = EventDelegate;
                kEventTimerList[i].EventCount = 1;
                return;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    i = kEventTimerList.Length;
    kEventTimerList.Insert(i, 1);
    kEventTimerList[i].EventType = EventType;
    kEventTimerList[i].EventTime = EventTime;
    kEventTimerList[i].EventTimeAddMSec = EventMSec;
    kEventTimerList[i].EventDelegate = EventDelegate;
    kEventTimerList[i].EventCount = 1;
}

function AddEventTimerCount(int EventType)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x50 [While If]
    if(i < kEventTimerList.Length)
    {
        // End:0x46
        if(kEventTimerList[i].EventType == EventType)
        {
            ++ kEventTimerList[i].EventCount;
        }
        // End:0x50
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
}

function RemoveEventTimer(int EventType)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4e [While If]
    if(i < kEventTimerList.Length)
    {
        // End:0x44
        if(kEventTimerList[i].EventType == EventType)
        {
            kEventTimerList.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function BtrDouble GetLeftEventTime(int EventType)
{
    local int i;
    local BtrDouble curD;

    i = 0;
    J0x07:
    // End:0x6c [While If]
    if(i < kEventTimerList.Length)
    {
        // End:0x62
        if(kEventTimerList[i].EventType == EventType)
        {
            curD = GetClientTime(true);
            curD = BtrDoubleMinus(kEventTimerList[i].EventTime, curD);
        }
        // End:0x6c
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    return curD;
}

function int GetEventTimerCount(int EventType)
{
    local int i, Count;

    i = 0;
    J0x07:
    // End:0x54 [While If]
    if(i < kEventTimerList.Length)
    {
        // End:0x4a
        if(kEventTimerList[i].EventType == EventType)
        {
            Count = kEventTimerList[i].EventCount;
        }
        // End:0x54
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    return Count;
}

function LogEventTimerList(optional int AddItemIndex)
{
    local int i;
    local BtrTime t;

    Log("---------------------------------------");
    Log("[wGameManager::LogEventTimerList()]");
    i = 0;
    J0x59:
    // End:0x238 [While If]
    if(i < kEventTimerList.Length)
    {
        BtrDoubleToBtrTime(kEventTimerList[i].EventTime, t);
        // End:0x162
        if(i == AddItemIndex)
        {
            Log("+" $ string(i) $ " EventType=" $ string(kEventTimerList[i].EventType) $ ", EventTime=" $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second) $ "(" $ string(kEventTimerList[i].EventTimeAddMSec) $ ")");
        }
        // End:0x22e
        else
        {
            Log(" " $ string(i) $ " EventType=" $ string(kEventTimerList[i].EventType) $ ", EventTime=" $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second) $ "(" $ string(kEventTimerList[i].EventTimeAddMSec) $ ")");
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x59;
    }
    Log("---------------------------------------");
}

function UpdateEventTimer(BtrDouble st, optional int msec)
{
    local int i, TimeOverIndex;
    local BtrTime t;

    TimeOverIndex = -1;
    BtrDoubleToBtrTime(st, t);
    Log("[wGameManager::UpdateEventTimer] msec = " $ string(msec) $ " kClientTime = " $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second));
    i = 0;
    J0xd7:
    // End:0x285 [While If]
    if(i < kEventTimerList.Length)
    {
        // End:0x27b
        if(BtrDoubleLessEqual(kEventTimerList[i].EventTime, st))
        {
            // End:0x20d
            if(UnresolvedNativeFunction_99(kEventTimerList[i].EventTime, st) && kEventTimerList[i].EventTimeAddMSec > msec)
            {
                BtrDoubleToBtrTime(kEventTimerList[i].EventTime, t);
                Log("[wGameManager::UpdateEventTimer] kEventTimerList[" $ string(i) $ "] = " $ string(t.Year) $ "-" $ string(t.Month) $ "-" $ string(t.Day) $ " " $ string(t.Hour) $ ":" $ string(t.Minute) $ ":" $ string(t.Second));
            }
            // End:0x27b
            else
            {
                dele_UpdateEventTimer(kEventTimerList[i].EventType, kEventTimerList[i].EventTime);
                // End:0x270
                if(kEventTimerList[i].EventDelegate != none)
                {
                    kEventTimerList[i].EventDelegate.OnEventTimer(i);
                }
                TimeOverIndex = i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd7;
    }
    // End:0x2dc
    if(kEventTimerList.Length > 0 && TimeOverIndex >= 0)
    {
        Log("kEventTimerList.Remove(0, " $ string(TimeOverIndex + 1) $ ")");
        kEventTimerList.Remove(0, TimeOverIndex + 1);
    }
}

function BtrDouble NextEventTime(BtrDouble t)
{
    local BtrDouble ret, empty;

    empty = EmptyBtrDouble();
    ret = empty;
    // End:0x72
    if(kEventTimerList.Length > 0 && BtrDoubleLessEqual(t, kEventTimerList[0].EventTime))
    {
        ret = BtrDoubleMinus(kEventTimerList[0].EventTime, t);
        ret = BtrDoublePlus(ret, empty);
    }
    return ret;
}

delegate dele_UpdateEventTimer(int EventType, BtrDouble EventTime);
function int GetStartExp(int Level)
{
    // End:0x29
    if(Level > LevelInfoParams.Length)
    {
        return LevelInfoParams[LevelInfoParams.Length - 1].nAccumExp;
    }
    // End:0x50
    if(Level >= 2)
    {
        return LevelInfoParams[Level - 1].nAccumExp;
    }
    // End:0x52
    else
    {
        return 0;
    }
}

function int GetEndExp(int Level)
{
    // End:0x29
    if(Level >= LevelInfoParams.Length)
    {
        return LevelInfoParams[LevelInfoParams.Length - 1].nAccumExp;
    }
    return LevelInfoParams[Level].nAccumExp;
}

function string GetLevelName(int Level)
{
    // End:0x20
    if(Level < 0 || Level >= LevelInfoParams.Length)
    {
        return "";
    }
    return LevelInfoParams[Level].sLevelName;
}

function GetLevelImage(int Level, int LevelMarkID, out Image LevelImage)
{
    local int idx, imgX, imgY;

    // End:0x12
    if(Level <= 0)
    {
        Level = 1;
    }
    // End:0x2e
    if(LevelMarkID != 0)
    {
        Level = GetLevelByLevelMarkID(LevelMarkID);
    }
    idx = Level - 1 / 64;
    imgY = Level - 1 / 16;
    imgX = int(float(Level - 1) % float(16));
    LevelImage.DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    LevelImage.Image = Texture(LevelTextures[idx]);
    LevelImage.X = 32.0 * float(imgX);
    LevelImage.Y = 32.0 * float(imgY);
    LevelImage.width = 32.0;
    LevelImage.Height = 32.0;
}

function Texture GetLevelTexture(int Level, optional int LevelMarkID)
{
    local int idx;

    // End:0x0d
    if(Level < 0)
    {
        return none;
    }
    // End:0x29
    if(LevelMarkID != 0)
    {
        Level = GetLevelByLevelMarkID(LevelMarkID);
    }
    idx = Level / 64;
    return Texture(LevelTextures[idx]);
}

function int GetClanStartExp(int Level)
{
    // End:0x11
    if(Level < 0)
    {
        return -1;
    }
    // End:0x3a
    if(Level > ClanLevelInfoParams.Length)
    {
        return ClanLevelInfoParams[ClanLevelInfoParams.Length - 1].nAccumExp;
    }
    // End:0x61
    if(Level >= 2)
    {
        return ClanLevelInfoParams[Level - 1].nAccumExp;
    }
    // End:0x63
    else
    {
        return 0;
    }
}

function int GetClanEndExp(int Level)
{
    // End:0x11
    if(Level < 0)
    {
        return -1;
    }
    // End:0x3a
    if(Level >= ClanLevelInfoParams.Length)
    {
        return ClanLevelInfoParams[ClanLevelInfoParams.Length - 1].nAccumExp;
    }
    return ClanLevelInfoParams[Level].nAccumExp;
}

function string GetClanLevelName(int Level)
{
    // End:0x20
    if(Level < 0 || Level >= ClanLevelInfoParams.Length)
    {
        return "";
    }
    return ClanLevelInfoParams[Level].sLevelName;
}

function Texture GetClanLevelTexture(int Level)
{
    // End:0x1f
    if(Level < 0 || Level >= ClanLevelTextures.Length)
    {
        return none;
    }
    return Texture(ClanLevelTextures[Level]);
}

function Image GetClanLevelImage(int Level)
{
    return class'BTCustomDrawHK'.static.MakeImage(16, 16, 0, GetClanLevelTexture(Level));
}

function bool GetClanLevelMarkInfo(string ClanName, out int ClanPattern, out int ClanBG, out int ClanBL)
{
    local int lp1;

    // End:0x0e
    if(ClanName == "")
    {
        return false;
    }
    lp1 = cmm.FindClanMark(ClanName);
    // End:0xa2
    if(lp1 != -1)
    {
        ClanBG = cmm.ClanMarkList[lp1].BG;
        ClanBL = cmm.ClanMarkList[lp1].BL;
        ClanPattern = cmm.ClanMarkList[lp1].Pattern;
        return true;
    }
    return false;
}

function int IsExistShopItemList(int iItemID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x3d [While If]
    if(i < self.ShopItemList.Length)
    {
        // End:0x33
        if(ShopItemList[i] == iItemID)
        {
            return 1;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return 0;
}

function int IsUsablePartItem(int iItemID, int iPartsArrayIndex)
{
    local wItemBaseParam ibp;
    local wWeaponCustomInfoParam wcip;
    local wWeaponCustomPartsParam wcpp;

    ibp = GetItemParam(iItemID);
    // End:0x41
    if(ibp.iItemID <= 0 && ibp.iItemID != iItemID)
    {
        return 0;
    }
    wcip = GetWeaponCustomInfoParam(iItemID);
    // End:0x82
    if(wcip.iItemID <= 0 || wcip.iItemID != iItemID)
    {
        return 0;
    }
    wcpp = WeaponCustomPartsParams[iPartsArrayIndex];
    // End:0xa9
    if(wcpp.iItemID == 0)
    {
        return 0;
    }
    // End:0x103
    if(wcpp.eType == 26 || wcpp.eType == 20)
    {
        // End:0x100
        if(wcpp.strAddPartGroupID != wcip.strAddPartSightGroupID)
        {
            return 0;
        }
    }
    // End:0x1c2
    else
    {
        // End:0x142
        if(wcpp.eType == 24)
        {
            // End:0x13f
            if(wcpp.strAddPartGroupID != wcip.strAddPartBarrelGroupID)
            {
                return 0;
            }
        }
        // End:0x1c2
        else
        {
            // End:0x181
            if(wcpp.eType == 21)
            {
                // End:0x17e
                if(wcpp.strAddPartGroupID != wcip.strAddPartSilencerGroupID)
                {
                    return 0;
                }
            }
            // End:0x1c2
            else
            {
                // End:0x1c0
                if(wcpp.eType == 25)
                {
                    // End:0x1bd
                    if(wcpp.strAddPartGroupID != wcip.strAddPartGunstockGroupID)
                    {
                        return 0;
                    }
                }
                // End:0x1c2
                else
                {
                    return 0;
                }
            }
        }
    }
    // End:0x235
    if(wcpp.bUsableAR == false && wcpp.bUsableSMG == false && wcpp.bUsableSR == false && wcpp.bUsablePS == false && wcpp.bUsableSG == false)
    {
        return 0;
    }
    // End:0x267
    if(wcpp.bUsableAR == false && ibp.eType == 0)
    {
        return 0;
    }
    // End:0x299
    if(wcpp.bUsableSMG == false && ibp.eType == 1)
    {
        return 0;
    }
    // End:0x2cb
    if(wcpp.bUsableSR == false && ibp.eType == 2)
    {
        return 0;
    }
    // End:0x2fd
    if(wcpp.bUsablePS == false && ibp.eType == 5)
    {
        return 0;
    }
    // End:0x32f
    if(wcpp.bUsableSG == false && ibp.eType == 3)
    {
        return 0;
    }
    // End:0x39d
    if(wcip.bCustomSight == false && wcpp.eType == 20 || wcpp.eType == 26)
    {
        // End:0x39d
        if(wcip.iDefaultSightUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    // End:0x3f0
    if(wcip.bCustomBarrel == false && wcpp.eType == 24)
    {
        // End:0x3f0
        if(wcip.iDefaultBarrelUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    // End:0x443
    if(wcip.bCustomSilencer == false && wcpp.eType == 21)
    {
        // End:0x443
        if(wcip.iDefaultSilencerUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    // End:0x496
    if(wcip.bCustomGunstock == false && wcpp.eType == 25)
    {
        // End:0x496
        if(wcip.iDefaultGunstockUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    return 1;
}

function int IsEnableRemovePart(wItemBaseParam Inip, wGameManager.EItemType InType)
{
    local wWeaponCustomInfoParam wcip;

    wcip = GetWeaponCustomInfoParam(Inip.iItemID);
    // End:0x85
    if(InType == 20 || InType == 26)
    {
        // End:0x57
        if(Inip.eType == 2)
        {
            return 0;
        }
        // End:0x82
        if(wcip.bCustomSight == false)
        {
            // End:0x82
            if(wcip.iDefaultSightUniID > 1)
            {
                return 0;
            }
        }
    }
    // End:0x14e
    else
    {
        // End:0xc9
        if(InType == 24)
        {
            // End:0xc6
            if(wcip.bCustomBarrel == false && wcip.iDefaultBarrelUniID > 1 << 10)
            {
                return 0;
            }
        }
        // End:0x14e
        else
        {
            // End:0x10d
            if(InType == 21)
            {
                // End:0x10a
                if(wcip.bCustomSilencer == false && wcip.iDefaultSilencerUniID > 1 << 17)
                {
                    return 0;
                }
            }
            // End:0x14e
            else
            {
                // End:0x14e
                if(InType == 25)
                {
                    // End:0x14e
                    if(wcip.bCustomGunstock == false && wcip.iDefaultGunstockUniID > 1 << 24)
                    {
                        return 0;
                    }
                }
            }
        }
    }
    return 1;
}

function LoadUILists()
{
    local int lp1, pgcount, i, ItemID;
    local wItemBoxHK itemBox;
    local wPaintGroupParam pntgp;
    local wItemBaseParam cItemParam;
    local wSkillBaseParam cSkillParam;
    local wItemResourceParam cItemResParam, cPartResParam;
    local wWeaponCustomInfoParam wcip;
    local wWeaponCustomPartsParam wcpp;

    SP = new class'wGameManagerScriptPart';
    SP.ClanMarkImg32.Length = ClanMarkParams.Length;
    SP.ClanMarkImg128.Length = ClanMarkParams.Length;
    i = 0;
    J0x42:
    // End:0xf8 [While If]
    if(i < ClanMarkParams.Length)
    {
        SP.ClanMarkImg32[i] = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject(ClanMarkParams[i].sClanMark_Resource_32, class'Material')));
        SP.ClanMarkImg128[i] = class'BTCustomDrawHK'.static.MakeImage(128, 128, 28, Material(DynamicLoadObject(ClanMarkParams[i].sClanMark_Resource_128, class'Material')));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    lp1 = 0;
    J0xff:
    // End:0x165d [While If]
    if(lp1 < ItemParams.Length)
    {
        ItemID = ItemParams[lp1].iItemID;
        cItemParam = GetItemParam(ItemID);
        cItemResParam = GetItemResourceParam(ItemID);
        // End:0x1653
        if(cItemParam.iItemID != -1 && cItemResParam.iItemResourceID != -1)
        {
            itemBox = new class'wItemBoxHK';
            itemBox.ItemID = cItemParam.iItemID;
            itemBox.ItemType = cItemParam.eType;
            itemBox.ItemName = cItemParam.strDisplayName;
            itemBox.ItemDescription = cItemParam.strDescription;
            // End:0x381
            if(cItemParam.eType == 20 || cItemParam.eType == 21 || cItemParam.eType == 26 || cItemParam.eType == 24 || cItemParam.eType == 25)
            {
                wcpp = GetWeaponCustomPartsParamByItemID(cItemParam.iItemID);
                // End:0x33b
                if(wcpp.iItemID > 0 && wcpp.iItemID == cItemParam.iItemID)
                {
                    itemBox.ItemName = wcpp.strDisplayName;
                    // End:0x338
                    if(wcpp.strPartImageName != "-")
                    {
                        itemBox.ItemImage = Texture(DynamicLoadObject(wcpp.strPartImageName, class'Texture'));
                    }
                }
                // End:0x37e
                else
                {
                    // End:0x37e
                    if(cItemResParam.strRes_Icon != "-")
                    {
                        itemBox.ItemImage = Texture(DynamicLoadObject(cItemResParam.strRes_Icon, class'Texture'));
                    }
                }
            }
            // End:0x3e0
            else
            {
                // End:0x39d
                if(cItemParam.eType == 23)
                {
                }
                // End:0x3e0
                else
                {
                    // End:0x3e0
                    if(cItemResParam.strRes_Icon != "-")
                    {
                        itemBox.ItemImage = Texture(DynamicLoadObject(cItemResParam.strRes_Icon, class'Texture'));
                    }
                }
            }
            itemBox.ResourceID = cItemParam.iResourceID;
            itemBox.ShopDisplayOrder = cItemParam.iShopDisplayOrder;
            itemBox.InvenDisplayOrder = cItemParam.iInvenDisplayOrder;
            itemBox.Grade = cItemParam.eGrade;
            itemBox.EquipLevel = cItemParam.iEquipLevel;
            itemBox.EquipTeam = cItemParam.iEquipTeam;
            itemBox.EquipSlot = cItemParam.EEquipSlot;
            wcip = GetWeaponCustomInfoParam(ItemID);
            // End:0xe47
            if(wcip.iItemID > 0 && ItemID == wcip.iItemID)
            {
                // End:0x55c
                if(wcip.bCustomSight == true || wcip.bCustomSilencer == true || wcip.bCustomBarrel == true || wcip.bCustomGunstock == true)
                {
                    itemBox.bParts = true;
                }
                // End:0x56d
                else
                {
                    itemBox.bParts = false;
                }
                itemBox.PartGroupID = cItemParam.strAddPartGroupID;
                pgcount = 0;
                itemBox.vDisplay_3d = wcip.vDisplay_3d;
                itemBox.fDisplay_3d_rot_y = wcip.fDisplay_3d_rot_y;
                itemBox.vBootyitem_3d = wcip.vBootyitem_3d;
                itemBox.fBootyitem_3d_rot_y = wcip.fBootyitem_3d_rot_y;
                // End:0x9e3
                if(WeaponCustomPartsParams.Length > 0)
                {
                    // End:0x705
                    if(IsEnableRemovePart(cItemParam, 20) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[0];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x6fe
                        if(wcpp.strPartImageName != "-" && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, class'Texture'));
                        }
                        ++ pgcount;
                    }
                    // End:0x7f9
                    if(IsEnableRemovePart(cItemParam, 24) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[1];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x7f2
                        if(wcpp.strPartImageName != "-" && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, class'Texture'));
                        }
                        ++ pgcount;
                    }
                    // End:0x8ee
                    if(IsEnableRemovePart(cItemParam, 21) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[2];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x8e7
                        if(wcpp.strPartImageName != "-" && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, class'Texture'));
                        }
                        ++ pgcount;
                    }
                    // End:0x9e3
                    if(IsEnableRemovePart(cItemParam, 25) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[3];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x9dc
                        if(wcpp.strPartImageName != "-" && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, class'Texture'));
                        }
                        ++ pgcount;
                    }
                }
                i = 0;
                J0x9ea:
                // End:0xe35 [While If]
                if(i < WeaponCustomPartsParams.Length)
                {
                    // End:0xe2b
                    if(IsUsablePartItem(wcip.iItemID, i) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[i];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].ItemID = wcpp.iItemID;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0xb1f
                        if(wcpp.strPartImageName != "-" && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, class'Texture'));
                        }
                        cPartResParam = GetItemResourceParam(wcpp.iItemID);
                        // End:0xb9e
                        if(cPartResParam.strRes_Icon != "-" && cPartResParam.strRes_Icon != "")
                        {
                            itemBox.PartAllList[pgcount].PartIconImage = Texture(DynamicLoadObject(cPartResParam.strRes_Icon, class'Texture'));
                        }
                        itemBox.PartAllList[pgcount].SkillID = wcpp.iSkillID;
                        // End:0xc6c
                        if(wcpp.iSkillID != 0)
                        {
                            itemBox.PartAllList[pgcount].SkillImage = Texture(DynamicLoadObject("Warfare_GP_UI_UI.Store.icon_rem_skil", class'Texture'));
                            cSkillParam = GetSkillParam(wcpp.iSkillID);
                            itemBox.PartAllList[pgcount].SkillName = cSkillParam.strName;
                        }
                        itemBox.PartAllList[pgcount].UI_DamageRange = wcpp.ui_damage_range;
                        itemBox.PartAllList[pgcount].UI_Durability = wcpp.UI_Durability;
                        itemBox.PartAllList[pgcount].ui_firesound = wcpp.ui_firesound;
                        itemBox.PartAllList[pgcount].UI_Zoom1 = wcpp.ui_zoom_1;
                        itemBox.PartAllList[pgcount].UI_Zoom2 = wcpp.ui_zoom_2;
                        itemBox.PartAllList[pgcount].ui_damage = wcpp.ui_damage;
                        itemBox.PartAllList[pgcount].ui_spread = wcpp.ui_spread;
                        itemBox.PartAllList[pgcount].ui_view_kick = wcpp.ui_view_kick;
                        itemBox.PartAllList[pgcount].ui_rate_of_fire = wcpp.ui_rate_of_fire;
                        itemBox.PartAllList[pgcount].ui_move = wcpp.ui_move;
                        itemBox.PartAllList[pgcount].ui_range = wcpp.ui_range;
                        ++ pgcount;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x9ea;
                }
                itemBox.SortPartList();
            }
            // End:0xe69
            else
            {
                itemBox.bParts = false;
                itemBox.PartGroupID = "";
            }
            // End:0xefe
            if(itemBox.Grade > 1 && itemBox.Grade != 7 && itemBox.Grade != 8 || cItemParam.strPaintingGroupID == "" || wcip.bCustomPainting == false)
            {
                itemBox.bPaints = false;
                itemBox.PaintGroupID = "";
            }
            // End:0x1169
            else
            {
                itemBox.bPaints = true;
                itemBox.PaintGroupID = cItemParam.strPaintingGroupID;
                pgcount = 0;
                i = 0;
                J0xf3a:
                // End:0x1169 [While If]
                if(i < PaintGroupParams.Length)
                {
                    // End:0x115f
                    if(PaintGroupParams[i].PaintingGroupID == itemBox.PaintGroupID)
                    {
                        pntgp = PaintGroupParams[i];
                        itemBox.PaintGroupList.Length = pgcount + 1;
                        itemBox.PaintGroupList[pgcount].PaintingID = pntgp.PaintingID;
                        itemBox.PaintGroupList[pgcount].PaintingGroupID = pntgp.PaintingGroupID;
                        itemBox.PaintGroupList[pgcount].PaintingNum = pntgp.PaintingNum;
                        itemBox.PaintGroupList[pgcount].PaintingItemID = pntgp.PaintingItemID;
                        itemBox.PaintGroupList[pgcount].RepairCost = pntgp.RepairCost;
                        itemBox.PaintGroupList[pgcount].UI_Durability = pntgp.UI_Durability;
                        itemBox.PaintGroupList[pgcount].strUI_Icon = pntgp.strUI_Icon;
                        // End:0x1158
                        if(pntgp.strUI_Icon != "-")
                        {
                            // End:0x111a
                            if(PaintGroupParams[i].PaintingItemID > 0)
                            {
                                itemBox.PaintGroupList[pgcount].UI_Icon_Box = Texture(DynamicLoadObject(pntgp.strUI_Icon, class'Texture'));
                            }
                            itemBox.PaintGroupList[pgcount].UI_Icon = Texture(DynamicLoadObject(pntgp.strUI_Icon $ "_n", class'Texture'));
                        }
                        ++ pgcount;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0xf3a;
                }
            }
            itemBox.AdType = cItemParam.iAdType;
            itemBox.bBuyShop = cItemParam.bSell;
            itemBox.bSellShop = cItemParam.bSell;
            itemBox.bOverlap = cItemParam.bOverlap;
            itemBox.bSellAuction = cItemParam.bAuction;
            itemBox.AuctionMaxPrice = cItemParam.iAuctionMaxPrice;
            itemBox.AuctionMinPrice = cItemParam.iAuctionMinPrice;
            itemBox.CostType = cItemParam.ECastType;
            itemBox.Period[0] = cItemParam.iPeriodNum[0];
            itemBox.Period[1] = cItemParam.iPeriodNum[1];
            itemBox.Period[2] = cItemParam.iPeriodNum[2];
            itemBox.Period[3] = cItemParam.iPeriodNum[3];
            itemBox.Period[4] = cItemParam.iPeriodNum[4];
            itemBox.PointPrice[0] = cItemParam.iPointPrice[0];
            itemBox.PointPrice[1] = cItemParam.iPointPrice[1];
            itemBox.PointPrice[2] = cItemParam.iPointPrice[2];
            itemBox.PointPrice[3] = cItemParam.iPointPrice[3];
            itemBox.PointPrice[4] = cItemParam.iPointPrice[4];
            itemBox.CashPrice[0] = cItemParam.iCashPrice[0];
            itemBox.CashPrice[1] = cItemParam.iCashPrice[1];
            itemBox.CashPrice[2] = cItemParam.iCashPrice[2];
            itemBox.CashPrice[3] = cItemParam.iCashPrice[3];
            itemBox.CashPrice[4] = cItemParam.iCashPrice[4];
            // End:0x1485
            if(itemBox.PointPrice[0] == 0)
            {
                itemBox.PurchaseType = 1;
            }
            // End:0x1495
            else
            {
                itemBox.PurchaseType = 0;
            }
            itemBox.start_ammo = cItemParam.start_ammo;
            itemBox.clip_size = cItemParam.clip_size;
            itemBox.ui_damage = cItemParam.ui_damage;
            itemBox.ui_spread = cItemParam.ui_spread;
            itemBox.ui_view_kick = cItemParam.ui_view_kick;
            itemBox.ui_rate_of_fire = cItemParam.ui_rate_of_fire;
            itemBox.ui_move = cItemParam.ui_move;
            itemBox.ui_range = cItemParam.ui_range;
            // End:0x1626
            if(cItemParam.eType == 19)
            {
                itemBox.bSkill = true;
                i = 0;
                J0x15ba:
                // End:0x1623 [While If]
                if(i < SkillParams.Length)
                {
                    // End:0x1619
                    if(SkillParams[i].iSkillID == itemBox.ItemID)
                    {
                        itemBox.SkillUseType = SkillParams[i].eActiveType;
                    }
                    // End:0x1623
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x15ba;
                    }
                }
            }
            // End:0x1637
            else
            {
                itemBox.bSkill = false;
            }
            itemBox.bRepair = true;
            AddUIItem(itemBox);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xff;
    }
}

function ClearSkillBoxList()
{
    SkillBoxList.Length = 0;
}

function wSkillBoxHK FindSkillBox(int UniqueSkillID)
{
    local int i;

    // End:0x0d
    if(UniqueSkillID == 0)
    {
        return none;
    }
    i = 0;
    J0x14:
    // End:0x58 [While If]
    if(i < SkillBoxList.Length)
    {
        // End:0x4e
        if(SkillBoxList[i].UniqueSkillID == UniqueSkillID)
        {
            return SkillBoxList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return none;
}

function wSkillBoxHK FindSkillBoxBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4d [While If]
    if(i < SkillBoxList.Length)
    {
        // End:0x43
        if(SkillBoxList[i].SlotPos == SlotPos)
        {
            return SkillBoxList[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function ChangeSkillBox_SlotPos(int SkillUniqueID, int SlotPos)
{
    local wSkillBoxHK SkillBox;

    // End:0x39
    if(SlotPos != 13)
    {
        SkillBox = FindSkillBoxBySlotPos(SlotPos);
        // End:0x39
        if(SkillBox != none)
        {
            SkillBox.SlotPos = 13;
        }
    }
    SkillBox = FindSkillBox(SkillUniqueID);
    // End:0x6b
    if(SkillBox != none)
    {
        SkillBox.SlotPos = byte(SlotPos);
    }
}

function bool AddUISkillBox(byte SlotPos, int SkillID, int UniqueSkillID, BtrDouble UntilTime)
{
    local wSkillBoxHK SkillBox;

    SkillBox = new class'wSkillBoxHK';
    SkillBox.SlotPos = SlotPos;
    SkillBox.SkillID = SkillID;
    SkillBox.UniqueSkillID = UniqueSkillID;
    SkillBox.UntilTime = UntilTime;
    SkillBoxList.Length = SkillBoxList.Length + 1;
    SkillBoxList[SkillBoxList.Length - 1] = SkillBox;
    return true;
}

function bool RemoveQuickSlotBoxItem(BtrDouble UniqueID)
{
    local int i, j;
    local bool bRemovedItem;

    i = 0;
    J0x07:
    // End:0xa8 [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x1e:
        // End:0x9e [While If]
        if(j < 4)
        {
            // End:0x94
            if(UnresolvedNativeFunction_99(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                QuickSlotBoxList[i].ItemID[j] = 0;
                QuickSlotBoxList[i].UniqueID[j] = EmptyBtrDouble();
                bRemovedItem = true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return bRemovedItem;
}

function bool IsQuickSlotBoxItem(BtrDouble UniqueID)
{
    local int i, j;

    // End:0x13
    if(UnresolvedNativeFunction_99(UniqueID, EmptyBtrDouble()))
    {
        return false;
    }
    i = 0;
    J0x1a:
    // End:0x78 [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x31:
        // End:0x6e [While If]
        if(j < 4)
        {
            // End:0x64
            if(UnresolvedNativeFunction_99(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                return true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x31;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a;
    }
    return false;
}

function int GetQuickSlotIndexOfBoxItem(BtrDouble UniqueID)
{
    local int i, j;

    // End:0x17
    if(UnresolvedNativeFunction_99(UniqueID, EmptyBtrDouble()))
    {
        return -1;
    }
    i = 0;
    J0x1e:
    // End:0x80 [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x35:
        // End:0x76 [While If]
        if(j < 4)
        {
            // End:0x6c
            if(UnresolvedNativeFunction_99(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                return i;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x35;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1e;
    }
    return -1;
}

function ReplaceQuickSlotBoxItem(BtrDouble OldUniqueID, int ItemID, BtrDouble NewUniqueID)
{
    local int i, j;

    // End:0x13
    if(UnresolvedNativeFunction_99(NewUniqueID, EmptyBtrDouble()))
    {
        return;
    }
    i = 0;
    J0x1a:
    // End:0xbc [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x31:
        // End:0xb2 [While If]
        if(j < 4)
        {
            // End:0xa8
            if(UnresolvedNativeFunction_99(QuickSlotBoxList[i].UniqueID[j], OldUniqueID) && QuickSlotBoxList[i].ItemID[j] == ItemID)
            {
                QuickSlotBoxList[i].UniqueID[j] = NewUniqueID;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x31;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a;
    }
}

function bool IsQuickSlotBoxSkillItem(int UniqueSkillID)
{
    local int i, j;

    // End:0x0d
    if(UniqueSkillID == 0)
    {
        return false;
    }
    i = 0;
    J0x14:
    // End:0x71 [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x2b:
        // End:0x67 [While If]
        if(j < 4)
        {
            // End:0x5d
            if(QuickSlotBoxList[i].UniqueSkillID[j] == UniqueSkillID)
            {
                return true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x2b;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return false;
}

function array<int> GetQuickSlotIndexOfBoxSkillItem(int UniqueSkillID)
{
    local array<int> QuickSlotIdx;
    local int i, j;

    // End:0x11
    if(UniqueSkillID == 0)
    {
        return QuickSlotIdx;
    }
    i = 0;
    J0x18:
    // End:0x98 [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x2f:
        // End:0x8e [While If]
        if(j < 4)
        {
            // End:0x84
            if(QuickSlotBoxList[i].UniqueSkillID[j] == UniqueSkillID)
            {
                QuickSlotIdx.Length = QuickSlotIdx.Length + 1;
                QuickSlotIdx[QuickSlotIdx.Length - 1] = i;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x2f;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
    return QuickSlotIdx;
}

function bool RemoveQuickSlotBoxSkillItem(int UniqueID)
{
    local int i, j;
    local bool bRemovedItem;

    i = 0;
    J0x07:
    // End:0xa2 [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x1e:
        // End:0x98 [While If]
        if(j < 4)
        {
            // End:0x8e
            if(QuickSlotBoxList[i].UniqueSkillID[j] == UniqueID)
            {
                QuickSlotBoxList[i].SkillID[j] = 0;
                QuickSlotBoxList[i].UniqueSkillID[j] = 0;
                bRemovedItem = true;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return bRemovedItem;
}

function ReplaceQuickSkillSlotItem(int SkillID, int UniqueSkillID)
{
    local int i, j;

    // End:0x0d
    if(SkillID == 0)
    {
        return;
    }
    i = 0;
    J0x14:
    // End:0x8f [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x2b:
        // End:0x85 [While If]
        if(j < 4)
        {
            // End:0x7b
            if(QuickSlotBoxList[i].SkillID[j] == SkillID)
            {
                QuickSlotBoxList[i].UniqueSkillID[j] = UniqueSkillID;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x2b;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function ClearQuickSlotBoxList()
{
    QuickSlotBoxList.Length = 0;
}

function AllocateQuickSlotBoxList(int Len)
{
    local int i;
    local wQuickSlotBoxHK qsbox;

    i = 0;
    J0x07:
    // End:0x68 [While If]
    if(i < Len)
    {
        qsbox = new class'wQuickSlotBoxHK';
        qsbox.QuickSlotID = i;
        QuickSlotBoxList.Length = QuickSlotBoxList.Length + 1;
        QuickSlotBoxList[QuickSlotBoxList.Length - 1] = qsbox;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool SetQuickSlotBox_Name(int DispOrder, string QSName)
{
    // End:0x12
    if(DispOrder >= QuickSlotBoxList.Length)
    {
        return false;
    }
    QuickSlotBoxList[DispOrder].QuickSlotName = QSName;
    return true;
}

function bool SetQuickSlotBox_ID(int DispOrder, int QuickSlotID)
{
    // End:0x12
    if(DispOrder >= QuickSlotBoxList.Length)
    {
        return false;
    }
    QuickSlotBoxList[DispOrder].QuickSlotID = QuickSlotID;
    return true;
}

function RemoveQuickSlotItem(BtrDouble UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0xa9 [While If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x1e:
        // End:0x9f [While If]
        if(j < 4)
        {
            // End:0x95
            if(UnresolvedNativeFunction_99(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                QuickSlotBoxList[i].ItemID[j] = 0;
                QuickSlotBoxList[i].UniqueID[j] = class'BTCustomDrawHK'.static.EmptyBtrDouble();
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool SetQuickSlotBox_Item(int DispOrder, int SlotPos, int ItemID, BtrDouble UniqueID)
{
    // End:0x12
    if(DispOrder >= QuickSlotBoxList.Length)
    {
        return false;
    }
    QuickSlotBoxList[DispOrder].ItemID[SlotPos] = ItemID;
    QuickSlotBoxList[DispOrder].UniqueID[SlotPos] = UniqueID;
    return true;
}

function bool SetQuickSlotBox_Skill(int DispOrder, int SlotPos, int SkillID, int UniqueSkillID)
{
    // End:0x12
    if(DispOrder >= QuickSlotBoxList.Length)
    {
        return false;
    }
    QuickSlotBoxList[DispOrder].SkillID[SlotPos] = SkillID;
    QuickSlotBoxList[DispOrder].UniqueSkillID[SlotPos] = UniqueSkillID;
    return true;
}

function bool CompareLE_UIShowItemLists(wItemBoxHK L, wItemBoxHK R)
{
    // End:0x23
    if(L.ItemID <= R.ItemID)
    {
        return true;
    }
    return false;
}

function bool AddUIItem(wItemBoxHK Item)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5c [While If]
    if(i < UIShowItemLists.Length)
    {
        // End:0x52
        if(CompareLE_UIShowItemLists(UIShowItemLists[i], Item) == false)
        {
            UIShowItemLists.Insert(i, 1);
            UIShowItemLists[i] = Item;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    UIShowItemLists.Length = UIShowItemLists.Length + 1;
    UIShowItemLists[i] = Item;
    return true;
}

function wItemBoxHK FindUIItem(int ItemID)
{
    local int i;

    // End:0x0d
    if(ItemID < 0)
    {
        return none;
    }
    i = 0;
    J0x14:
    // End:0x6c [While If]
    if(i < UIShowItemLists.Length)
    {
        // End:0x38
        if(UIShowItemLists[i] == none)
        {
        }
        // End:0x6c
        else
        {
            // End:0x62
            if(UIShowItemLists[i].ItemID == ItemID)
            {
                return UIShowItemLists[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    return none;
}

function int FindUIItemReturnIndex(int ItemID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x59 [While If]
    if(i < UIShowItemLists.Length)
    {
        // End:0x2b
        if(UIShowItemLists[i] == none)
        {
        }
        // End:0x59
        else
        {
            // End:0x4f
            if(UIShowItemLists[i].ItemID == ItemID)
            {
                return i;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    return -1;
}

function bool AddInstanceSkillItemFromSkillBoxList()
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    i = 0;
    J0x07:
    // End:0x8b [While If]
    if(i < SkillBoxList.Length)
    {
        instanceInfo = AddInstanceItemByParameter(SkillBoxList[i].SkillID, EmptyBtrDouble(), SkillBoxList[i].UniqueSkillID, SkillBoxList[i].SlotPos, 1, 0, 0, 0, 0, 0, SkillBoxList[i].UntilTime);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return true;
}

function wItemBoxInstanceHK AddInstanceItemByParameter(int ItemID, BtrDouble UniqueID, int UniqueSkillID, int SlotPos, int ItemState, int Durability, optional int PartID, optional int PaintID, optional int StackCount, optional int DamageDegree, optional BtrDouble UntilTime, optional bool bStackAdd, optional int TradeCount)
{
    local BtrTime t, tServer;
    local wItemBoxInstanceHK instanceInfo;
    local bool bIsSkill;

    // End:0x27
    if(UniqueSkillID == 0)
    {
        instanceInfo = FindInstanceItem(UniqueID);
        bIsSkill = false;
    }
    // End:0x45
    else
    {
        instanceInfo = self.FindInstanceSkillItem(UniqueSkillID);
        bIsSkill = true;
    }
    // End:0x183
    if(instanceInfo == none)
    {
        Log("[wGameManager::AddInstanceItemByParameter] New!!!  ItemID=" $ string(ItemID) $ ", SlotPos=" $ string(SlotPos) $ ", PartID=" $ string(PartID) $ ", StackCount=" $ string(StackCount) $ ", UntilTime=" $ UnresolvedNativeFunction_99(UntilTime) $ "bStackAdd=" $ string(bStackAdd));
        // End:0x138
        if(bIsSkill == true)
        {
            AddUISkillBox(byte(SlotPos), ItemID, UniqueSkillID, UntilTime);
        }
        instanceInfo = new class'wItemBoxInstanceHK';
        InstanceItemLists.Length = InstanceItemLists.Length + 1;
        InstanceItemLists[InstanceItemLists.Length - 1] = instanceInfo;
        instanceInfo.SlotPosition = SlotPos;
    }
    // End:0x245
    else
    {
        Log("[wGameManager::AddInstanceItemByParameter] Exist!!!  ItemID=" $ string(ItemID) $ ", SlotPos=" $ string(SlotPos) $ ", PartID=" $ string(PartID) $ ", StackCount=" $ string(StackCount) $ ", UntilTime=" $ UnresolvedNativeFunction_99(UntilTime) $ "bStackAdd=" $ string(bStackAdd));
    }
    instanceInfo.ItemID = ItemID;
    instanceInfo.UniqueID = UniqueID;
    instanceInfo.UniqueSkillID = UniqueSkillID;
    instanceInfo.UntilTime = UntilTime;
    instanceInfo.PartID = PartID;
    instanceInfo.PaintID = PaintID;
    // End:0x2cf
    if(StackCount == 0)
    {
        StackCount = 1;
    }
    // End:0x2f0
    if(bStackAdd)
    {
        instanceInfo.OverlapCount += StackCount;
    }
    // End:0x304
    else
    {
        instanceInfo.OverlapCount = StackCount;
    }
    instanceInfo.Durability = Durability;
    instanceInfo.DamageDegree = DamageDegree;
    instanceInfo.UntilTime = UntilTime;
    // End:0x390
    if(UnresolvedNativeFunction_99(UntilTime, EmptyBtrDouble()))
    {
        BtrDoubleToBtrTime(UntilTime, t);
        BtrDoubleToBtrTime(kClientTime, tServer);
        instanceInfo.LeftTime = BtrTimeSubstract(t, tServer);
    }
    instanceInfo.ItemState = ItemState;
    instanceInfo.TradeCount = TradeCount;
    return instanceInfo;
}

function bool AddCashItem(out wItemBoxHK ItemInfo, out wItemBoxInstanceHK instanceInfo, string strEndDate)
{
    local int j;
    local GP20Product gp20P;

    gp20P = GetGP20ProductFromCode(ItemInfo.ItemID, j);
    // End:0x69
    if(j == 1)
    {
        instanceInfo.CashItemInfo = new class'wItemBoxCashHK';
        instanceInfo.CashItemInfo.SetCashItemInfo(ItemInfo, gp20P, strEndDate);
    }
    return j == 1;
}

function bool AddInstanceItem(wItemBoxInstanceHK Item)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0x32
    if(UnresolvedNativeFunction_99(Item.UniqueID, EmptyBtrDouble()) && Item.UniqueSkillID == 0)
    {
        return false;
    }
    // End:0x63
    if(Item.UniqueSkillID == 0)
    {
        instanceInfo = FindInstanceItem(Item.UniqueID);
    }
    // End:0x82
    else
    {
        instanceInfo = self.FindInstanceSkillItem(Item.UniqueSkillID);
    }
    // End:0xc1
    if(instanceInfo == none)
    {
        instanceInfo = new class'wItemBoxInstanceHK';
        InstanceItemLists.Length = InstanceItemLists.Length + 1;
        InstanceItemLists[InstanceItemLists.Length - 1] = instanceInfo;
    }
    instanceInfo = Item;
    return false;
}

function ChangeInstance_ItemLeftTime(BtrDouble CurrentTime)
{
    local int i;
    local BtrTime t, t2;
    local wItemBoxHK ItemInfo;

    BtrDoubleToBtrTime(CurrentTime, t2);
    i = 0;
    J0x17:
    // End:0xc0 [While If]
    if(i < InstanceItemLists.Length)
    {
        ItemInfo = FindUIItem(InstanceItemLists[i].ItemID);
        // End:0xb6
        if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
        {
            BtrDoubleToBtrTime(InstanceItemLists[i].UntilTime, t);
            InstanceItemLists[i].LeftTime = BtrTimeSubstract(t, t2);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

function bool ChangeInstance_DefaultWeapon(int SlotPos)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0xc1
    if(SlotPos == 0)
    {
        instanceInfo = FindFirstInstanceItemByItemID(2000);
        Log("[wGameManager::ChangeInstance_DefaultWeapon] ChangeDefaultWeapon(G3 2000) ItemID = " $ string(instanceInfo.ItemID) $ " Dur = (" $ string(instanceInfo.Durability) $ ")");
        // End:0xbe
        if(instanceInfo.SlotPosition == 0)
        {
            return true;
        }
    }
    // End:0x187
    else
    {
        // End:0x185
        if(SlotPos == 1)
        {
            instanceInfo = FindFirstInstanceItemByItemID(1010);
            Log("[wGameManager::ChangeInstance_DefaultWeapon] ChangeDefaultWeapon(Glock 1010) ItemID = " $ string(instanceInfo.ItemID) $ " Dur = (" $ string(instanceInfo.Durability) $ ")");
            // End:0x182
            if(instanceInfo.SlotPosition == 1)
            {
                return true;
            }
        }
        // End:0x187
        else
        {
            return false;
        }
    }
    ChangeInstance_ItemSlotPos(instanceInfo.UniqueID, SlotPos);
    return true;
}

function bool ChangeInstance_ItemDurability(BtrDouble UniqueID, int dur)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = FindInstanceItem(UniqueID);
    // End:0xb3
    if(instanceInfo != none)
    {
        Log("[wGameManager::ChangeInstance_ItemDurability] ItemID = " $ string(instanceInfo.ItemID) $ " Dur = (" $ string(instanceInfo.Durability) $ " => " $ string(dur) $ ")");
        instanceInfo.Durability = dur;
        return true;
    }
    return false;
}

function bool ChangeInstance_ItemDamageDegree(BtrDouble UniqueID, int dd)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = FindInstanceItem(UniqueID);
    // End:0xb5
    if(instanceInfo != none)
    {
        Log("[wGameManager::ChangeInstance_ItemDamageDegree] ItemID = " $ string(instanceInfo.ItemID) $ " Dur = (" $ string(instanceInfo.DamageDegree) $ " => " $ string(dd) $ ")");
        instanceInfo.DamageDegree = dd;
        return true;
    }
    return false;
}

function bool ChangeInstance_ItemReduceDurability(BtrDouble UniqueID, int dur)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = FindInstanceItem(UniqueID);
    // End:0xca
    if(instanceInfo != none)
    {
        Log("[wGameManager::ChangeInstance_ItemReduceDurability] ItemID = " $ string(instanceInfo.ItemID) $ " Dur = (" $ string(instanceInfo.Durability) $ " => " $ string(instanceInfo.Durability - dur) $ ")");
        instanceInfo.Durability -= dur;
        return true;
    }
    return false;
}

function bool ChangeInstance_StackCount(BtrDouble UniqueID, int StackCount)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = FindInstanceItem(UniqueID);
    // End:0x32
    if(instanceInfo != none)
    {
        instanceInfo.OverlapCount = StackCount;
        return true;
    }
    return false;
}

function bool ChangeInstance_ItemSlotPos(BtrDouble UniqueID, int SlotPos)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0xdd
    if(SlotPos != 13)
    {
        instanceInfo = FindInstanceItemBySlotPos(SlotPos);
        // End:0xdd
        if(instanceInfo != none)
        {
            Log("[wGameManager::ChangeInstance_ItemSlotPos] PrevSlotItem ItemID = " $ string(instanceInfo.ItemID) $ " SlotPos = (" $ string(instanceInfo.SlotPosition) $ " => 13 ) Dur = (" $ string(instanceInfo.Durability) $ ")");
            instanceInfo.SlotPosition = 13;
        }
    }
    instanceInfo = FindInstanceItem(UniqueID);
    // End:0x1bd
    if(instanceInfo != none)
    {
        Log("[wGameManager::ChangeInstance_ItemSlotPos] CurSlotItem ItemID = " $ string(instanceInfo.ItemID) $ " SlotPos = (" $ string(instanceInfo.SlotPosition) $ " => " $ string(SlotPos) $ " ) Dur = (" $ string(instanceInfo.Durability) $ ")");
        instanceInfo.SlotPosition = SlotPos;
        return true;
    }
    return false;
}

function ChangeInstance_SkillSlotPos(int SkillUniqueID, int SlotPos)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0x54
    if(SlotPos != 13)
    {
        instanceInfo = FindInstanceItemBySlotPos(SlotPos);
        // End:0x3c
        if(instanceInfo != none)
        {
            instanceInfo.SlotPosition = 13;
        }
        // End:0x54
        else
        {
            Log("InstanceInfo is none");
        }
    }
    instanceInfo = FindInstanceSkillItem(SkillUniqueID);
    // End:0x84
    if(instanceInfo != none)
    {
        instanceInfo.SlotPosition = SlotPos;
    }
}

function wItemBoxInstanceHK FindInstanceItem(BtrDouble UniqueID)
{
    local int i;

    // End:0x13
    if(UnresolvedNativeFunction_99(UniqueID, EmptyBtrDouble()))
    {
        return none;
    }
    i = 0;
    J0x1a:
    // End:0x73 [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x3e
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x69
        else
        {
            // End:0x69
            if(UnresolvedNativeFunction_99(InstanceItemLists[i].UniqueID, UniqueID))
            {
                return InstanceItemLists[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1a;
    }
    return none;
}

function wItemBoxInstanceHK FindInstanceItemSameWeapon(int ItemID, int PartID)
{
    local int i;
    local wItemBoxHK ItemInfo;

    ItemInfo = FindUIItem(ItemID);
    // End:0x4d
    if(ItemInfo == none)
    {
        Log("FindInstanceItemSameWeapon() ItemID is none");
        return none;
    }
    // End:0x64
    if(ItemInfo.ItemType > 4)
    {
        return none;
    }
    i = 0;
    J0x6b:
    // End:0xc3 [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x8f
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0xb9
        else
        {
            // End:0xb9
            if(InstanceItemLists[i].ItemID == ItemID)
            {
                return InstanceItemLists[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x6b;
    }
    return none;
}

function wItemBoxInstanceHK FindInstanceSkillItem(int UniqueID)
{
    local int i;

    // End:0x0d
    if(UniqueID == 0)
    {
        return none;
    }
    i = 0;
    J0x14:
    // End:0x6c [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x38
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x62
        else
        {
            // End:0x62
            if(InstanceItemLists[i].UniqueSkillID == UniqueID)
            {
                return InstanceItemLists[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return none;
}

function wItemBoxInstanceHK FindFirstInstanceItemByItemID(int ItemID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5f [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2b
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x55
        else
        {
            // End:0x55
            if(InstanceItemLists[i].ItemID == ItemID)
            {
                return InstanceItemLists[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function int FindInstanceSkillItemReturnIndex(int UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x59 [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2b
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x4f
        else
        {
            // End:0x4f
            if(InstanceItemLists[i].UniqueSkillID == UniqueID)
            {
                return i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool RemoveInstanceItem(BtrDouble UniqueID)
{
    local int Index;

    Index = FindInstanceItemReturnIndex(UniqueID);
    // End:0x1e
    if(Index < 0)
    {
        return false;
    }
    InstanceItemLists.Remove(Index, 1);
    return true;
}

function bool RemoveInstanceItemByUniqueSkillID(int UniqueSkillID)
{
    local int Index;

    Index = FindInstanceItemReturnIndexByUniqueSkillID(UniqueSkillID);
    // End:0x1e
    if(Index < 0)
    {
        return false;
    }
    InstanceItemLists.Remove(Index, 1);
    return true;
}

function int FindInstanceItemReturnIndex(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x5a [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2b
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x50
        else
        {
            // End:0x50
            if(UnresolvedNativeFunction_99(InstanceItemLists[i].UniqueID, UniqueID))
            {
                return i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int FindInstanceItemReturnIndexByUniqueSkillID(int UniqueSkillID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x59 [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2b
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x4f
        else
        {
            // End:0x4f
            if(InstanceItemLists[i].UniqueSkillID == UniqueSkillID)
            {
                return i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function wItemBoxInstanceHK FindInstanceItemBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7b [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2b
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x71
        else
        {
            // End:0x71
            if(InstanceItemLists[i].ItemID != 0 && InstanceItemLists[i].SlotPosition == SlotPos)
            {
                return InstanceItemLists[i];
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function int FindInstanceItemIDBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x84 [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2b
        if(InstanceItemLists[i] == none)
        {
        }
        // End:0x7a
        else
        {
            // End:0x7a
            if(InstanceItemLists[i].ItemID != 0 && InstanceItemLists[i].SlotPosition == SlotPos)
            {
                return InstanceItemLists[i].ItemID;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function ClearInstanceItem()
{
    InstanceItemLists.Length = 0;
}

function int GetMainWeaponID()
{
    return 2000;
}

function int GetSubWeaponID()
{
    return 1010;
}

function BtrDouble GetMainWeaponUniqueID()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x55 [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x4b
        if(InstanceItemLists[i].ItemID == GetMainWeaponID())
        {
            return InstanceItemLists[i].UniqueID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return EmptyBtrDouble();
}

function BtrDouble GetSubWeaponUniqueID()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x55 [While If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x4b
        if(InstanceItemLists[i].ItemID == GetSubWeaponID())
        {
            return InstanceItemLists[i].UniqueID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return EmptyBtrDouble();
}

// Export UwGameManager::execSetItemIndex(FFrame&, void* const)
native function SetItemIndex(int iItemIndex, int iArrayIndex);
// Export UwGameManager::execGetItemArrayIndex(FFrame&, void* const)
native function int GetItemArrayIndex(int iItemIndex);
// Export UwGameManager::execSetSkillIndex(FFrame&, void* const)
native function SetSkillIndex(int iSkillIndex, int iArrayIndex);
// Export UwGameManager::execGetSkillArrayIndex(FFrame&, void* const)
native function int GetSkillArrayIndex(int iSkillIndex);
// Export UwGameManager::execSetPartsGroupIndex(FFrame&, void* const)
native function SetPartsGroupIndex(int iPartsGroupIndex, int iArrayIndex);
// Export UwGameManager::execGetPartsGroupArrayIndex(FFrame&, void* const)
native function int GetPartsGroupArrayIndex(int iPartsGroupIndex);
// Export UwGameManager::execSetWeaponCustomInfoIndex(FFrame&, void* const)
native function SetWeaponCustomInfoIndex(int iItemIndex, int iArrayIndex);
// Export UwGameManager::execGetWeaponCustomInfoIndex(FFrame&, void* const)
native function int GetWeaponCustomInfoIndex(int iItemIndex);
// Export UwGameManager::execSetWeaponCustomPartsIndex(FFrame&, void* const)
native function SetWeaponCustomPartsIndex(int iUnionedPartID, int iArrayIndex);
// Export UwGameManager::execGetWeaponCustomPartsIndex(FFrame&, void* const)
native function int GetWeaponCustomPartsIndex(int iUnionedPartID);
event InitScript()
{
    ItemParams.Length = 0;
    ItemResParams.Length = 0;
    SkillParams.Length = 0;
    AddPartsGroupParams.Length = 0;
    PromotionParams.Length = 0;
    PaintGroupParams.Length = 0;
    QuestParams.Length = 0;
    DailyQuestParams.Length = 0;
    ClanMarkParams.Length = 0;
    ItemBoxParams.Length = 0;
    LevelInfoParams.Length = 0;
    MapInfos.Length = 0;
    DefenceGameParamsEasy.Length = 0;
    DefenceGameParamsNormal.Length = 0;
    DefenceGameParamsHard.Length = 0;
    DefenceGameParamsVeryHard.Length = 0;
    ModeDOAParams.Length = 0;
    WeaponCustomInfoParams.Length = 0;
    WeaponCustomPartsParams.Length = 0;
    LoadItemParameters();
    LoadItemResourceParams();
    LoadSkillParameters();
    LoadAddPartsGroupParameters();
    LoadPromotionParameters();
    LoadPaintGroupParameters();
    LoadQuestParameters();
    LoadRandBoxParameters();
    LoadDailyQuestParameters();
    LoadClanMarkParameters();
    LoadItemBoxParameters();
    LoadLevelInfoParams();
    LoadClanLevelInfoParams();
    LoadMapInfos();
    LoadBadwords();
    LoadNPCSpawn();
    LoadNPC();
    LoadNPCNameGroup();
    LoadNPCItemGroup();
    LoadNPCActionGroup();
    LoadDefenceGameInfo();
    LoadModeDOAParameters();
    LoadWeaponCustomPartsParameters();
    LoadWeaponCustomInfoParameters();
}

function wWeaponCustomPartsParam GetWeaponCustomPartsParamByItemID(int iInItemID)
{
    local int iTemp;

    iTemp = 0;
    J0x07:
    // End:0x4b [While If]
    if(iTemp < WeaponCustomPartsParams.Length)
    {
        // End:0x41
        if(WeaponCustomPartsParams[iTemp].iItemID == iInItemID)
        {
            return WeaponCustomPartsParams[iTemp];
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function wWeaponCustomPartsParam GetWeaponCustomPartsParamByUnionedPartID(int iInUnionedPartID)
{
    return WeaponCustomPartsParams[GetWeaponCustomPartsIndex(iInUnionedPartID)];
}

function wWeaponCustomInfoParam GetWeaponCustomInfoParam(int iInItemID)
{
    return WeaponCustomInfoParams[GetWeaponCustomInfoIndex(iInItemID)];
}

function LoadWeaponCustomInfoParameters()
{
    local BTNetExcelData excel;
    local int iIndex;
    local bool bResult;
    local wWeaponCustomInfoParam wci;
    local string strData;
    local wWeaponCustomPartsParam wcpp;

    // End:0x0e
    if(WeaponCustomInfoParams.Length > 0)
    {
        return;
    }
    excel = new class'BTNetExcelData';
    bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Weapon_CustomInfo", 2, 1, 1);
    // End:0x82
    if(!bResult)
    {
        return;
    }
    iIndex = 0;
    J0x89:
    // End:0xc66 [While If]
    if(true)
    {
        strData = excel.getData("Weapon_CustomInfo", "item_id", iIndex);
        // End:0xd7
        if(strData == "99999")
        {
        }
        // End:0xc66
        else
        {
            wci = new class'wWeaponCustomInfoParam';
            wci.iItemID = int(strData);
            strData = excel.getData("Weapon_CustomInfo", "display_name", iIndex);
            // End:0x158
            if(strData != "-")
            {
                wci.strDisplayName = strData;
            }
            strData = excel.getData("Weapon_CustomInfo", "addpart_sightgroup_id", iIndex);
            // End:0x1bd
            if(strData != "-")
            {
                wci.strAddPartSightGroupID = strData;
            }
            strData = excel.getData("Weapon_CustomInfo", "addpart_barrelgroup_id", iIndex);
            // End:0x223
            if(strData != "-")
            {
                wci.strAddPartBarrelGroupID = strData;
            }
            strData = excel.getData("Weapon_CustomInfo", "addpart_silencergroup_id", iIndex);
            // End:0x28b
            if(strData != "-")
            {
                wci.strAddPartSilencerGroupID = strData;
            }
            strData = excel.getData("Weapon_CustomInfo", "addpart_gunstockgroup_id", iIndex);
            // End:0x2f3
            if(strData != "-")
            {
                wci.strAddPartGunstockGroupID = strData;
            }
            strData = excel.getData("Weapon_CustomInfo", "usable_sight", iIndex);
            // End:0x34c
            if(strData == "1")
            {
                wci.bCustomSight = true;
            }
            strData = excel.getData("Weapon_CustomInfo", "usable_silencer", iIndex);
            // End:0x3a8
            if(strData == "1")
            {
                wci.bCustomSilencer = true;
            }
            strData = excel.getData("Weapon_CustomInfo", "usable_barrel", iIndex);
            // End:0x402
            if(strData == "1")
            {
                wci.bCustomBarrel = true;
            }
            strData = excel.getData("Weapon_CustomInfo", "usable_gunstock", iIndex);
            // End:0x45e
            if(strData == "1")
            {
                wci.bCustomGunstock = true;
            }
            strData = excel.getData("Weapon_CustomInfo", "usable_painting", iIndex);
            // End:0x4ba
            if(strData == "1")
            {
                wci.bCustomPainting = true;
            }
            strData = excel.getData("Weapon_CustomInfo", "default_sight", iIndex);
            wci.iDefaultSightUniID = int(strData);
            // End:0x55a
            if(wci.iDefaultSightUniID > 0)
            {
                wcpp = GetWeaponCustomPartsParamByItemID(wci.iDefaultSightUniID);
                wci.iDefaultSightUniID = wcpp.iPartID;
            }
            // End:0x56a
            else
            {
                wci.iDefaultSightUniID = 1;
            }
            strData = excel.getData("Weapon_CustomInfo", "default_silencer", iIndex);
            wci.iDefaultSilencerUniID = int(strData);
            // End:0x60d
            if(wci.iDefaultSilencerUniID > 0)
            {
                wcpp = GetWeaponCustomPartsParamByItemID(wci.iDefaultSilencerUniID);
                wci.iDefaultSilencerUniID = wcpp.iPartID;
            }
            // End:0x621
            else
            {
                wci.iDefaultSilencerUniID = 1 << 17;
            }
            strData = excel.getData("Weapon_CustomInfo", "default_barrel", iIndex);
            wci.iDefaultBarrelUniID = int(strData);
            // End:0x6c2
            if(wci.iDefaultBarrelUniID > 0)
            {
                wcpp = GetWeaponCustomPartsParamByItemID(wci.iDefaultBarrelUniID);
                wci.iDefaultBarrelUniID = wcpp.iPartID;
            }
            // End:0x6d6
            else
            {
                wci.iDefaultBarrelUniID = 1 << 10;
            }
            strData = excel.getData("Weapon_CustomInfo", "default_gunstock", iIndex);
            wci.iDefaultGunstockUniID = int(strData);
            // End:0x779
            if(wci.iDefaultGunstockUniID > 0)
            {
                wcpp = GetWeaponCustomPartsParamByItemID(wci.iDefaultGunstockUniID);
                wci.iDefaultGunstockUniID = wcpp.iPartID;
            }
            // End:0x78d
            else
            {
                wci.iDefaultGunstockUniID = 1 << 24;
            }
            strData = excel.getData("Weapon_CustomInfo", "default_painting", iIndex);
            wci.iDefaultPaintingID = int(strData);
            strData = excel.getData("Weapon_CustomInfo", "sighton_additemid", iIndex);
            wci.iSightOnAddItemID = int(strData);
            strData = excel.getData("Weapon_CustomInfo", "sightoff_additemid", iIndex);
            wci.iSightOffAddItemID = int(strData);
            strData = excel.getData("Weapon_CustomInfo", "sight_aimdiff_x", iIndex);
            wci.vAimDiff.X = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "sight_aimdiff_y", iIndex);
            wci.vAimDiff.Y = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "sight_aimdiff_z", iIndex);
            wci.vAimDiff.Z = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "3d_x", iIndex);
            wci.vDisplay_3d.X = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "3d_y", iIndex);
            wci.vDisplay_3d.Y = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "3d_z", iIndex);
            wci.vDisplay_3d.Z = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "3d_rot_y", iIndex);
            wci.fDisplay_3d_rot_y = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "bootyitem_3d_x", iIndex);
            wci.vBootyitem_3d.X = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "bootyitem_3d_y", iIndex);
            wci.vBootyitem_3d.Y = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "bootyitem_3d_z", iIndex);
            wci.vBootyitem_3d.Z = float(strData);
            strData = excel.getData("Weapon_CustomInfo", "bootyitem_3d_rot_y", iIndex);
            wci.fBootyitem_3d_rot_y = float(strData);
            SetWeaponCustomInfoIndex(wci.iItemID, WeaponCustomInfoParams.Length);
            WeaponCustomInfoParams[WeaponCustomInfoParams.Length] = wci;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x89;
        }
    }
}

function LoadWeaponCustomPartsParameters()
{
    local BTNetExcelData excel;
    local int iIndex, iBit, iUnionedPartID;
    local bool bResult;
    local wWeaponCustomPartsParam wcp;
    local string strData;

    // End:0x0e
    if(WeaponCustomPartsParams.Length > 0)
    {
        return;
    }
    excel = new class'BTNetExcelData';
    bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Weapon_Parts", 2, 1, 1);
    // End:0x7d
    if(!bResult)
    {
        return;
    }
    iIndex = 0;
    J0x84:
    // End:0xac0 [While If]
    if(true)
    {
        iBit = -1;
        iUnionedPartID = 0;
        strData = excel.getData("Weapon_Parts", "item_id", iIndex);
        // End:0xdf
        if(strData == "99999")
        {
        }
        // End:0xac0
        else
        {
            wcp = new class'wWeaponCustomPartsParam';
            wcp.iItemID = int(strData);
            strData = excel.getData("Weapon_Parts", "part_type", iIndex);
            switch(strData)
            {
                // End:0x168
                case "Part_Sight":
                    wcp.eType = 20;
                    iBit = 0;
                    // End:0x231
                    break;
                // End:0x196
                case "Part_Silencer":
                    wcp.eType = 21;
                    iBit = 17;
                    // End:0x231
                    break;
                // End:0x1c0
                case "Part_Scope":
                    wcp.eType = 26;
                    iBit = 0;
                    // End:0x231
                    break;
                // End:0x1ec
                case "Part_Barrel":
                    wcp.eType = 24;
                    iBit = 10;
                    // End:0x231
                    break;
                // End:0x21a
                case "Part_Gunstock":
                    wcp.eType = 25;
                    iBit = 24;
                    // End:0x231
                    break;
                // End:0xffff
                default:
                    wcp.eType = 35;
                    // End:0x231 Break;
                    break;
            }
            strData = excel.getData("Weapon_Parts", "part_id", iIndex);
            wcp.iPartID = int(strData);
            strData = excel.getData("Weapon_Parts", "display_name", iIndex);
            // End:0x2cf
            if(strData != "-")
            {
                wcp.strDisplayName = strData;
            }
            strData = excel.getData("Weapon_Parts", "addpart_group_id", iIndex);
            // End:0x32a
            if(strData != "-")
            {
                wcp.strAddPartGroupID = strData;
            }
            strData = excel.getData("Weapon_Parts", "durability_weight", iIndex);
            // End:0x388
            if(strData != "-")
            {
                wcp.fDurability_Weight = float(strData);
            }
            strData = excel.getData("Weapon_Parts", "part_ui_image", iIndex);
            // End:0x3e0
            if(strData != "-")
            {
                wcp.strPartImageName = strData;
            }
            strData = excel.getData("Weapon_Parts", "usable_ar", iIndex);
            // End:0x431
            if(strData == "1")
            {
                wcp.bUsableAR = true;
            }
            strData = excel.getData("Weapon_Parts", "usable_smg", iIndex);
            // End:0x483
            if(strData == "1")
            {
                wcp.bUsableSMG = true;
            }
            strData = excel.getData("Weapon_Parts", "usable_sr", iIndex);
            // End:0x4d4
            if(strData == "1")
            {
                wcp.bUsableSR = true;
            }
            strData = excel.getData("Weapon_Parts", "usable_ps", iIndex);
            // End:0x525
            if(strData == "1")
            {
                wcp.bUsablePS = true;
            }
            strData = excel.getData("Weapon_Parts", "usable_sg", iIndex);
            // End:0x576
            if(strData == "1")
            {
                wcp.bUsableSG = true;
            }
            strData = excel.getData("Weapon_Parts", "usable_etc", iIndex);
            // End:0x5c8
            if(strData == "1")
            {
                wcp.bUsableETC = true;
            }
            strData = excel.getData("Weapon_Parts", "sight_add_aimdiff_x", iIndex);
            wcp.vAddAimDiff.X = float(strData);
            strData = excel.getData("Weapon_Parts", "sight_add_aimdiff_y", iIndex);
            wcp.vAddAimDiff.Y = float(strData);
            strData = excel.getData("Weapon_Parts", "sight_add_aimdiff_z", iIndex);
            wcp.vAddAimDiff.Z = float(strData);
            strData = excel.getData("Weapon_Parts", "skill_id", iIndex);
            wcp.iSkillID = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_damage_range", iIndex);
            wcp.ui_damage_range = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_firesound", iIndex);
            wcp.ui_firesound = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_zoom_1", iIndex);
            // End:0x807
            if(strData != "-")
            {
                wcp.ui_zoom_1 = strData;
            }
            strData = excel.getData("Weapon_Parts", "ui_zoom_2", iIndex);
            // End:0x85b
            if(strData != "-")
            {
                wcp.ui_zoom_2 = strData;
            }
            strData = excel.getData("Weapon_Parts", "ui_durability", iIndex);
            wcp.UI_Durability = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_damage", iIndex);
            wcp.ui_damage = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_spread", iIndex);
            wcp.ui_spread = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_view_kick", iIndex);
            wcp.ui_view_kick = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_rate_of_fire", iIndex);
            wcp.ui_rate_of_fire = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_move", iIndex);
            wcp.ui_move = int(strData);
            strData = excel.getData("Weapon_Parts", "ui_range", iIndex);
            wcp.ui_range = int(strData);
            iUnionedPartID = wcp.iPartID << iBit;
            wcp.iPartID = iUnionedPartID;
            SetWeaponCustomPartsIndex(iUnionedPartID, WeaponCustomPartsParams.Length);
            WeaponCustomPartsParams[WeaponCustomPartsParams.Length] = wcp;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x84;
        }
    }
}

event InitHK()
{
    LoadLevelTextures();
    LoadUILists();
    cmm = new class'ClanMarkManager';
    cmm.Init(self);
    FlagModify = 1 << 1;
    FlagDurability = 1 << 2;
    FlagRenew = 1 << 3;
    FlagCash = 1 << 4;
    FlagPCBang = 1 << 5;
    FlagSellShop = 1 << 6;
    FlagBuyShop = 1 << 7;
}

event InitPrecacheItems()
{
    self.PrecacheItemResources(none);
}

function LoadLevelTextures()
{
    local int i;

    // End:0x13
    if(LevelTextures.Length == LevelImages.Length)
    {
        return;
    }
    LevelTextures.Length = LevelImages.Length;
    i = 0;
    J0x27:
    // End:0x68 [While If]
    if(i < LevelTextures.Length)
    {
        LevelTextures[i] = Material(DynamicLoadObject(LevelImages[i], class'Material'));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    ClanLevelTextures.Length = ClanLevelImages.Length;
    i = 1;
    J0x7c:
    // End:0xbd [While If]
    if(i < ClanLevelTextures.Length)
    {
        ClanLevelTextures[i] = Material(DynamicLoadObject(GetClanLevelImages(i), class'Material'));
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7c;
    }
}

function LoadNPCSpawn()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strGrade, strType, strID;
    local wNPCSpawnParam Param;

    // End:0x18a
    if(NPCSpawnParams.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "NPC_Spon", 2, 1, 1);
        // End:0x77
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x7e:
        // End:0x18a [While If]
        if(true)
        {
            strGrade = excel.getData("NPC_Spon", "npc_grade", iIndex);
            strType = excel.getData("NPC_Spon", "npc_type", iIndex);
            strID = excel.getData("NPC_Spon", "npc_id", iIndex);
            // End:0x11f
            if(strGrade == "99999")
            {
            }
            // End:0x18a
            else
            {
                Param = new class'wNPCSpawnParam';
                Param.Grade = int(strGrade);
                Param.Type = strType;
                Param.NPCID = int(strID);
                NPCSpawnParams[NPCSpawnParams.Length] = Param;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x7e;
            }
        }
    }
}

function LoadNPC()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strID, strNameGroupID, strLv, strType, strMainWeapon, strPistol,
	    strGrenade1, strGrenade2, strSprintRate, strActiveSkill, strPassive1,
	    strPassive2, strPassive3, strSpChar_AF, strSpChar_RSA, strHead,
	    strFace, strAccessory, strHP, ActionGroupID, DamageRate,
	    ExplosionDmageRate, MeleeDamageRate, ReactionTime, DetourRate, DetourWeightMin,
	    DetourWeightMax, SafeWeightMin, SafeWeightMax, HeadshotChance, RotationgSpeed,
	    MeleeActionRange, MeleeRange, EffectiveRange, CloseRange, OuterRangeSpreadMin,
	    OuterRangeSpreadMax, EffectiveRangeSpreadMin, EffectiveRangeSpreadMax, CloseRangeSpreadMin, CloseRangeSpreadMax,
	    ZeroRangeSpreadMin, ZeroRangeSpreadMax, HeadshotChanceMG, HeadshotSpreadRate, strDefaultRunSpeed;

    local wNPCParam Param;

    // End:0xd8f
    if(NPCParams.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "NPC", 2, 1, 1);
        // End:0x72
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x79:
        // End:0xd8f [While If]
        if(true)
        {
            strID = excel.getData("NPC", "npc_id", iIndex);
            strNameGroupID = excel.getData("NPC", "npc_name_groupid", iIndex);
            strLv = excel.getData("NPC", "npc_lv", iIndex);
            strType = excel.getData("NPC", "npc_type", iIndex);
            strMainWeapon = excel.getData("NPC", "mainweapon_groupid", iIndex);
            strPistol = excel.getData("NPC", "pistol_groupid", iIndex);
            strGrenade1 = excel.getData("NPC", "grenade_1_groupid", iIndex);
            strGrenade2 = excel.getData("NPC", "grenade_2_groupid", iIndex);
            strActiveSkill = excel.getData("NPC", "skill_active_groupid", iIndex);
            strPassive1 = excel.getData("NPC", "skill_passive_1_groupid", iIndex);
            strPassive2 = excel.getData("NPC", "skill_passive_2_groupid", iIndex);
            strPassive3 = excel.getData("NPC", "skill_passive_3_groupid", iIndex);
            strSpChar_AF = excel.getData("NPC", "spchar_groupid_af", iIndex);
            strSpChar_RSA = excel.getData("NPC", "spchar_groupid_rsa", iIndex);
            strHead = excel.getData("NPC", "head_groupid", iIndex);
            strFace = excel.getData("NPC", "face_groupid", iIndex);
            strAccessory = excel.getData("NPC", "accessory_groupid", iIndex);
            strHP = excel.getData("NPC", "npc hp", iIndex);
            strSprintRate = excel.getData("NPC", "sprint_rate", iIndex);
            strDefaultRunSpeed = excel.getData("NPC", "default_runspeed", iIndex);
            ActionGroupID = excel.getData("NPC", "action_groupid", iIndex);
            DamageRate = excel.getData("NPC", "damage_rate", iIndex);
            ExplosionDmageRate = excel.getData("NPC", "explosion_damage_rate", iIndex);
            MeleeDamageRate = excel.getData("NPC", "melee_damage_rate", iIndex);
            ReactionTime = excel.getData("NPC", "reaction_time", iIndex);
            DetourRate = excel.getData("NPC", "detour_rate", iIndex);
            DetourWeightMin = excel.getData("NPC", "detour_weight_min", iIndex);
            DetourWeightMax = excel.getData("NPC", "detour_weight_max", iIndex);
            SafeWeightMin = excel.getData("NPC", "safe_weight_min", iIndex);
            SafeWeightMax = excel.getData("NPC", "safe_weight_max", iIndex);
            HeadshotChance = excel.getData("NPC", "headshot_chance", iIndex);
            HeadshotChanceMG = excel.getData("NPC", "headshot_chance_mg", iIndex);
            HeadshotSpreadRate = excel.getData("NPC", "headshot_spread_rate", iIndex);
            RotationgSpeed = excel.getData("NPC", "rotating_speed", iIndex);
            MeleeActionRange = excel.getData("NPC", "melee_action_range", iIndex);
            MeleeRange = excel.getData("NPC", "melee_range", iIndex);
            EffectiveRange = excel.getData("NPC", "effective_range", iIndex);
            CloseRange = excel.getData("NPC", "close_range", iIndex);
            OuterRangeSpreadMin = excel.getData("NPC", "outer_range_spread_min", iIndex);
            OuterRangeSpreadMax = excel.getData("NPC", "outer_range_spread_max", iIndex);
            EffectiveRangeSpreadMin = excel.getData("NPC", "effective_range_spread_min", iIndex);
            EffectiveRangeSpreadMax = excel.getData("NPC", "effective_range_spread_max", iIndex);
            CloseRangeSpreadMin = excel.getData("NPC", "close_range_spread_min", iIndex);
            CloseRangeSpreadMax = excel.getData("NPC", "close_range_spread_max", iIndex);
            ZeroRangeSpreadMin = excel.getData("NPC", "zero_range_spread_min", iIndex);
            ZeroRangeSpreadMax = excel.getData("NPC", "zero_range_spread_max", iIndex);
            // End:0x972
            if(strID == "99999")
            {
            }
            // End:0xd8f
            else
            {
                Param = new class'wNPCParam';
                Param.NPCID = int(strID);
                Param.NameGroupID = int(strNameGroupID);
                Param.Lv = int(strLv);
                Param.Type = strType;
                Param.MainWeaponGroupID = int(strMainWeapon);
                Param.PistolGroupID = int(strPistol);
                Param.Grenade1GroupID = int(strGrenade1);
                Param.Grenade2GroupID = int(strGrenade2);
                Param.SkillActiveGroupID = int(strActiveSkill);
                Param.SkillPassive1GroupID = int(strPassive1);
                Param.SkillPassive2GroupID = int(strPassive2);
                Param.SkillPassive3GroupID = int(strPassive3);
                Param.SpCharGroupID_AF = int(strSpChar_AF);
                Param.SpCharGroupID_RSA = int(strSpChar_RSA);
                Param.HeadGroupID = int(strHead);
                Param.FaceGroupID = int(strFace);
                Param.AccessoryGroupID = int(strAccessory);
                Param.HP = int(strHP);
                Param.SprintRate = int(strSprintRate);
                Param.ActionGroupID = int(ActionGroupID);
                Param.DefaultRunSpeed = int(strDefaultRunSpeed);
                Param.DamageRate = float(DamageRate);
                Param.ExplosionDmageRate = float(ExplosionDmageRate);
                Param.MeleeDamageRate = float(MeleeDamageRate);
                Param.ReactionTime = float(ReactionTime);
                Param.DetourRate = float(DetourRate);
                Param.DetourWeightMin = float(DetourWeightMin);
                Param.DetourWeightMax = float(DetourWeightMax);
                Param.SafeWeightMin = float(SafeWeightMin);
                Param.SafeWeightMax = float(SafeWeightMax);
                Param.HeadshotChance = float(HeadshotChance);
                Param.HeadshotChanceMG = float(HeadshotChanceMG);
                Param.HeadshotSpreadRate = float(HeadshotSpreadRate);
                Param.RotationgSpeed = float(RotationgSpeed);
                Param.MeleeActionRange = float(MeleeActionRange);
                Param.MeleeRange = float(MeleeRange);
                Param.EffectiveRange = float(EffectiveRange);
                Param.CloseRange = float(CloseRange);
                Param.OuterRangeSpreadMin = float(OuterRangeSpreadMin);
                Param.OuterRangeSpreadMax = float(OuterRangeSpreadMax);
                Param.EffectiveRangeSpreadMin = float(EffectiveRangeSpreadMin);
                Param.EffectiveRangeSpreadMax = float(EffectiveRangeSpreadMax);
                Param.CloseRangeSpreadMin = float(CloseRangeSpreadMin);
                Param.CloseRangeSpreadMax = float(CloseRangeSpreadMax);
                Param.ZeroRangeSpreadMin = float(ZeroRangeSpreadMin);
                Param.ZeroRangeSpreadMax = float(ZeroRangeSpreadMax);
                NPCParams[NPCParams.Length] = Param;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x79;
            }
        }
    }
}

function LoadNPCNameGroup()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strGroupID, strNickname;
    local wNPCNameGroupParam Param;

    // End:0x14d
    if(NPCNameGroupParams.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Name_Group", 2, 1, 1);
        // End:0x79
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x80:
        // End:0x14d [While If]
        if(true)
        {
            strGroupID = excel.getData("Name_Group", "name_groupid", iIndex);
            strNickname = excel.getData("Name_Group", "name", iIndex);
            // End:0xf8
            if(strGroupID == "99999")
            {
            }
            // End:0x14d
            else
            {
                Param = new class'wNPCNameGroupParam';
                Param.GroupID = int(strGroupID);
                Param.NickName = strNickname;
                NPCNameGroupParams[NPCNameGroupParams.Length] = Param;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x80;
            }
        }
    }
}

function LoadNPCItemGroup()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strGroupID, strItemID, strPartsID;
    local wNPCItemGroupParam Param;

    // End:0x198
    if(NPCItemGroupParams.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Item_Group", 2, 1, 1);
        // End:0x79
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x80:
        // End:0x198 [While If]
        if(true)
        {
            strGroupID = excel.getData("Item_Group", "item_groupid", iIndex);
            strItemID = excel.getData("Item_Group", "item_id", iIndex);
            strPartsID = excel.getData("Item_Group", "parts_id", iIndex);
            // End:0x12b
            if(strGroupID == "99999")
            {
            }
            // End:0x198
            else
            {
                Param = new class'wNPCItemGroupParam';
                Param.GroupID = int(strGroupID);
                Param.ItemID = int(strItemID);
                Param.PartsID = int(strPartsID);
                NPCItemGroupParams[NPCItemGroupParams.Length] = Param;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x80;
            }
        }
    }
}

function LoadNPCActionGroup()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strActionGroupID, strActionID;
    local wNPCActionGroupParam Param;

    // End:0x15a
    if(NPCActionGroupParams.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Action_Group", 2, 1, 1);
        // End:0x7b
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x82:
        // End:0x15a [While If]
        if(true)
        {
            strActionGroupID = excel.getData("Action_Group", "action_groupid", iIndex);
            strActionID = excel.getData("Action_Group", "action_id", iIndex);
            // End:0x105
            if(strActionGroupID == "99999")
            {
            }
            // End:0x15a
            else
            {
                Param = new class'wNPCActionGroupParam';
                Param.ActionGroupID = int(strActionGroupID);
                Param.ActionID = strActionID;
                NPCActionGroupParams[NPCActionGroupParams.Length] = Param;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x82;
            }
        }
    }
}

function SetLevelDefenceGameParam(int iLevel, array<wDefenceGameParam> params)
{
    switch(iLevel)
    {
        // End:0x19
        case 0:
            DefenceGameParamsEasy = params;
            // End:0x5f
            break;
        // End:0x2b
        case 1:
            DefenceGameParamsNormal = params;
            // End:0x5f
            break;
        // End:0x3e
        case 2:
            DefenceGameParamsHard = params;
            // End:0x5f
            break;
        // End:0x51
        case 3:
            DefenceGameParamsVeryHard = params;
            // End:0x5f
            break;
        // End:0xffff
        default:
            DefenceGameParamsEasy = params;
}

function GetLevelDefenceGameParam(int iLevel, out array<wDefenceGameParam> params)
{
    switch(iLevel)
    {
        // End:0x19
        case 0:
            params = DefenceGameParamsEasy;
            // End:0x5f
            break;
        // End:0x2b
        case 1:
            params = DefenceGameParamsNormal;
            // End:0x5f
            break;
        // End:0x3e
        case 2:
            params = DefenceGameParamsHard;
            // End:0x5f
            break;
        // End:0x51
        case 3:
            params = DefenceGameParamsVeryHard;
            // End:0x5f
            break;
        // End:0xffff
        default:
            params = DefenceGameParamsEasy;
}

function LoadClanMarkParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(ClanMarkParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadClanMarkParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddClanMarkParams(GameData);
}

function LoadDefenceGameInfo()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex, i, j, iLevel, MapID;

    local array<wDefenceGameParam> params;
    local wDefenceGameParam Param;

    // End:0x3e4
    if(DefenceGameParamsEasy.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Mode_Defence", 2, 1, 1);
        // End:0x7b
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        iLevel = 0;
        J0x89:
        // End:0x287 [While If]
        if(true)
        {
            MapID = int(excel.getData("Mode_Defence", "map_id", iIndex));
            // End:0xd1
            if(MapID == 99999)
            {
            }
            // End:0x287
            else
            {
                Param = new class'wDefenceGameParam';
                Param.nMapID = MapID;
                Param.nRound = byte(excel.getData("Mode_Defence", "round", iIndex));
                Param.nDelayTime = int(excel.getData("Mode_Defence", "delay_time", iIndex));
                Param.nRegenLoc = byte(excel.getData("Mode_Defence", "regen_loc", iIndex));
                Param.nGrade = int(excel.getData("Mode_Defence", "npc_spon", iIndex));
                Param.nUnit = byte(excel.getData("Mode_Defence", "unit", iIndex));
                Param.nLevel = 0;
                // End:0x26b
                if(iLevel != Param.nLevel)
                {
                    SetLevelDefenceGameParam(iLevel, params);
                    ++ iLevel;
                    params.Length = 0;
                }
                params[params.Length] = Param;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x89;
            }
        }
        SetLevelDefenceGameParam(iLevel, params);
        iLevel = 0;
        J0x29e:
        // End:0x3e4 [While If]
        if(i < 4)
        {
            GetLevelDefenceGameParam(iLevel, params);
            // End:0x2c9
            if(params.Length <= 1)
            {
            }
            // End:0x3da
            else
            {
                i = 0;
                J0x2d0:
                // End:0x3da [While If]
                if(i < params.Length)
                {
                    j = i + 1;
                    J0x2ee:
                    // End:0x3d0 [While If]
                    if(j < params.Length)
                    {
                        // End:0x3c6
                        if(params[i].nMapID == params[j].nMapID && params[i].nRound == params[j].nRound && params[i].nDelayTime > params[j].nDelayTime)
                        {
                            Param = params[i];
                            params[i] = params[j];
                            params[j] = Param;
                        }
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x2ee;
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x2d0;
                }
            }
            ++ iLevel;
            // This is an implied JumpToken; Continue!
            goto J0x29e;
        }
    }
}

function GetDefenceGamePrams2(int Level, int MapID, int Round, out array<int> DelayTime, out array<int> RegenLoc, out array<int> Grade, out array<int> Unit)
{
    local int i;
    local array<wDefenceGameParam> params;

    GetLevelDefenceGameParam(Level, params);
    i = 0;
    J0x17:
    // End:0xf9 [While If]
    if(i < params.Length)
    {
        // End:0xef
        if(params[i].nMapID == MapID && params[i].nRound == Round)
        {
            DelayTime[DelayTime.Length] = params[i].nDelayTime;
            RegenLoc[RegenLoc.Length] = params[i].nRegenLoc;
            Grade[Grade.Length] = params[i].nGrade;
            Unit[Unit.Length] = params[i].nUnit;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

function GetDefenceGameBotGradeList2(int Level, int MapID, int Round, out array<int> GradeList)
{
    local int i, j;
    local bool bFind;
    local array<wDefenceGameParam> params;

    GetLevelDefenceGameParam(Level, params);
    i = 0;
    J0x17:
    // End:0xf6 [While If]
    if(i < params.Length)
    {
        // End:0xec
        if(params[i].nMapID == MapID && params[i].nRound == Round)
        {
            bFind = false;
            j = 0;
            J0x76:
            // End:0xbf [While If]
            if(j < GradeList.Length)
            {
                // End:0xb5
                if(params[i].nGrade == GradeList[j])
                {
                    bFind = true;
                }
                // End:0xbf
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x76;
                }
            }
            // End:0xec
            if(bFind == false)
            {
                GradeList[GradeList.Length] = params[i].nGrade;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

function int GetDefenceGameRoundCount2(int Level, int MapID)
{
    local int i, RoundNum;
    local array<wDefenceGameParam> params;

    GetLevelDefenceGameParam(Level, params);
    i = 0;
    J0x17:
    // End:0x72 [While If]
    if(i < params.Length)
    {
        // End:0x68
        if(params[i].nMapID == MapID)
        {
            RoundNum = Max(params[i].nRound, RoundNum);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    return RoundNum;
}

function LoadAlienGameInfo();
function LoadBadwords()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string S;

    // End:0xdf
    if(BadWords.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "BadWords", 2, 1, 1);
        // End:0x77
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x7e:
        // End:0xdf [While If]
        if(true)
        {
            S = excel.getData("BadWords", "badword", iIndex);
            // End:0xc3
            if(S == "99999")
            {
            }
            // End:0xdf
            else
            {
                BadWords[BadWords.Length] = S;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x7e;
            }
        }
    }
    // End:0x1bf
    if(BadNicks.Length == 0)
    {
        excel = new class'BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "BadNicks", 2, 1, 1);
        // End:0x156
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x15d:
        // End:0x1bf [While If]
        if(true)
        {
            S = excel.getData("BadNicks", "badnicks", iIndex);
            // End:0x1a3
            if(S == "99999")
            {
            }
            // End:0x1bf
            else
            {
                BadNicks[BadNicks.Length] = S;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x15d;
            }
        }
    }
}

function bool ContainsBadWords(string S, out string badword)
{
    local int lp1;

    S = Caps(S);
    lp1 = 0;
    J0x14:
    // End:0x5f [While If]
    if(lp1 < BadWords.Length)
    {
        // End:0x55
        if(InStr(S, Caps(BadWords[lp1])) != -1)
        {
            badword = BadWords[lp1];
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return false;
}

function bool FilterBadWords(out string S)
{
    local int idx, lp1, badlen;
    local string capped, Repl;
    local bool bRet;

    capped = Caps(S);
    lp1 = 0;
    J0x14:
    // End:0xdb [While If]
    if(lp1 < BadWords.Length)
    {
        idx = InStr(capped, Caps(BadWords[lp1]));
        // End:0xc2
        if(idx != -1)
        {
            badlen = Len(BadWords[lp1]);
            Repl = "@#^&$!";
            S = Left(S, idx) $ Repl $ Right(S, Len(S) - idx - Len(BadWords[lp1]));
            capped = Caps(S);
            bRet = true;
        }
        // End:0x24
        if(idx == -1)
        	goto J0x24;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return bRet;
}

function bool ContainsBadNicks(string S, out string badword)
{
    local int lp1;

    S = Caps(S);
    lp1 = 0;
    J0x14:
    // End:0x5f [While If]
    if(lp1 < BadNicks.Length)
    {
        // End:0x55
        if(InStr(S, Caps(BadNicks[lp1])) != -1)
        {
            badword = BadNicks[lp1];
            return true;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return false;
}

event DestroyScript()
{
    ItemParams.Length = 0;
    ItemResParams.Length = 0;
    SkillParams.Length = 0;
    AddPartsGroupParams.Length = 0;
}

function LoadItemParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(ItemParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadItemParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddItemParams(GameData);
}

function AddItemParams(BTNetGameData GameData)
{
    local wItemBaseParam cParam;
    local int iIndex, ItemID, i;
    local bool bResult;
    local string strTemp;
    local array<string> strArrayTemp;

    AddItemParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x199f [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ItemParam", "type", iIndex);
        // End:0x53
        if(strTemp == "99999")
        {
        }
        // End:0x199f
        else
        {
            cParam = new class'wItemBaseParam';
            switch(strTemp)
            {
                // End:0x88
                case "Pistol":
                    cParam.eType = 5;
                    // End:0x4b9
                    break;
                // End:0xa3
                case "AR":
                    cParam.eType = 0;
                    // End:0x4b9
                    break;
                // End:0xbf
                case "SMG":
                    cParam.eType = 1;
                    // End:0x4b9
                    break;
                // End:0xda
                case "SR":
                    cParam.eType = 2;
                    // End:0x4b9
                    break;
                // End:0xf5
                case "HW":
                    cParam.eType = 15;
                    // End:0x4b9
                    break;
                // End:0x110
                case "TW":
                    cParam.eType = 6;
                    // End:0x4b9
                    break;
                // End:0x12d
                case "Bomb":
                    cParam.eType = 16;
                    // End:0x4b9
                    break;
                // End:0x149
                case "SPW":
                    cParam.eType = 17;
                    // End:0x4b9
                    break;
                // End:0x167
                case "Meele":
                    cParam.eType = 18;
                    // End:0x4b9
                    break;
                // End:0x185
                case "Knife":
                    cParam.eType = 7;
                    // End:0x4b9
                    break;
                // End:0x1a2
                case "Body":
                    cParam.eType = 13;
                    // End:0x4b9
                    break;
                // End:0x1bf
                case "Head":
                    cParam.eType = 8;
                    // End:0x4b9
                    break;
                // End:0x1dc
                case "Face":
                    cParam.eType = 9;
                    // End:0x4b9
                    break;
                // End:0x1fe
                case "Accessory":
                    cParam.eType = 10;
                    // End:0x4b9
                    break;
                // End:0x21f
                case "Backpack":
                    cParam.eType = 14;
                    // End:0x4b9
                    break;
                // End:0x23e
                case "SpChar":
                    cParam.eType = 11;
                    // End:0x4b9
                    break;
                // End:0x261
                case "Part_Sight":
                    cParam.eType = 20;
                    // End:0x4b9
                    break;
                // End:0x287
                case "Part_Silencer":
                    cParam.eType = 21;
                    // End:0x4b9
                    break;
                // End:0x2a9
                case "Part_Camo":
                    cParam.eType = 22;
                    // End:0x4b9
                    break;
                // End:0x2cc
                case "Part_Paint":
                    cParam.eType = 23;
                    // End:0x4b9
                    break;
                // End:0x2e9
                case "Cash":
                    cParam.eType = 12;
                    // End:0x4b9
                    break;
                // End:0x305
                case "ETC":
                    cParam.eType = 29;
                    // End:0x4b9
                    break;
                // End:0x324
                case "Supply":
                    cParam.eType = 27;
                    // End:0x4b9
                    break;
                // End:0x342
                case "Skill":
                    cParam.eType = 19;
                    // End:0x4b9
                    break;
                // End:0x365
                case "Part_Scope":
                    cParam.eType = 26;
                    // End:0x4b9
                    break;
                // End:0x385
                case "Passive":
                    cParam.eType = 28;
                    // End:0x4b9
                    break;
                // End:0x3a5
                case "ItemBox":
                    cParam.eType = 30;
                    // End:0x4b9
                    break;
                // End:0x3c5
                case "RandBox":
                    cParam.eType = 32;
                    // End:0x4b9
                    break;
                // End:0x3e4
                case "LvMark":
                    cParam.eType = 33;
                    // End:0x4b9
                    break;
                // End:0x400
                case "USE":
                    cParam.eType = 31;
                    // End:0x4b9
                    break;
                // End:0x41b
                case "MG":
                    cParam.eType = 4;
                    // End:0x4b9
                    break;
                // End:0x43b
                case "Shotgun":
                    cParam.eType = 3;
                    // End:0x4b9
                    break;
                // End:0x45f
                case "Part_Barrel":
                    cParam.eType = 24;
                    // End:0x4b9
                    break;
                // End:0x485
                case "Part_Gunstock":
                    cParam.eType = 25;
                    // End:0x4b9
                    break;
                // End:0x4a2
                case "Gold":
                    cParam.eType = 34;
                    // End:0x4b9
                    break;
                // End:0xffff
                default:
                    cParam.eType = 35;
                    // End:0x4b9 Break;
                    break;
            }
            switch(GameData.getData("ItemParam", "grade", iIndex))
            {
                // End:0x4fe
                case "Base":
                    cParam.eGrade = 0;
                    // End:0x6f5
                    break;
                // End:0x51d
                case "Common":
                    cParam.eGrade = 2;
                    // End:0x6f5
                    break;
                // End:0x53a
                case "Shop":
                    cParam.eGrade = 1;
                    // End:0x6f5
                    break;
                // End:0x557
                case "Rare":
                    cParam.eGrade = 5;
                    // End:0x6f5
                    break;
                // End:0x574
                case "High":
                    cParam.eGrade = 4;
                    // End:0x6f5
                    break;
                // End:0x593
                case "Normal":
                    cParam.eGrade = 3;
                    // End:0x6f5
                    break;
                // End:0x5ae
                case "PC":
                    cParam.eGrade = 7;
                    // End:0x6f5
                    break;
                // End:0x5ca
                case "PC+":
                    cParam.eGrade = 8;
                    // End:0x6f5
                    break;
                // End:0x5eb
                case "Map_Spon":
                    cParam.eGrade = 9;
                    // End:0x6f5
                    break;
                // End:0x60c
                case "Map_Lock":
                    cParam.eGrade = 10;
                    // End:0x6f5
                    break;
                // End:0x62a
                case "Skill":
                    cParam.eGrade = 11;
                    // End:0x6f5
                    break;
                // End:0x64a
                case "Special":
                    cParam.eGrade = 12;
                    // End:0x6f5
                    break;
                // End:0x669
                case "Legend":
                    cParam.eGrade = 6;
                    // End:0x6f5
                    break;
                // End:0x686
                case "Part":
                    cParam.eGrade = 13;
                    // End:0x6f5
                    break;
                // End:0x6a3
                case "Cash":
                    cParam.eGrade = 14;
                    // End:0x6f5
                    break;
                // End:0x6c2
                case "supply":
                    cParam.eGrade = 15;
                    // End:0x6f5
                    break;
                // End:0x6de
                case "War":
                    cParam.eGrade = 16;
                    // End:0x6f5
                    break;
                // End:0xffff
                default:
                    cParam.eGrade = 17;
                    // End:0x6f5 Break;
                    break;
            }
            cParam.strGradeDisplay = GameData.getData("ItemParam", "grade_display", iIndex);
            cParam.iItemID = int(GameData.getData("ItemParam", "item_id", iIndex));
            cParam.strDisplayName = GameData.getData("ItemParam", "display_name", iIndex);
            cParam.iResourceID = int(GameData.getData("ItemParam", "item_resource_id", iIndex));
            cParam.iShopDisplayOrder = int(GameData.getData("ItemParam", "shop_display_order", iIndex));
            cParam.iInvenDisplayOrder = int(GameData.getData("ItemParam", "inven_display_order", iIndex));
            cParam.iResourceID = int(GameData.getData("ItemParam", "item_resource_id", iIndex));
            cParam.iEquipLevel = int(GameData.getData("ItemParam", "equip_lv", iIndex));
            switch(GameData.getData("ItemParam", "equip_team", iIndex))
            {
                // End:0x935
                case "AF":
                    cParam.iEquipTeam = 1;
                    // End:0x967
                    break;
                // End:0x951
                case "RSA":
                    cParam.iEquipTeam = 2;
                    // End:0x967
                    break;
                // End:0xffff
                default:
                    cParam.iEquipTeam = 0;
                    // End:0x967 Break;
                    break;
            }
            cParam.strDescription = GameData.getData("ItemParam", "item_description", iIndex);
            switch(GameData.getData("ItemParam", "equipment_slot", iIndex))
            {
                // End:0x9f7
                case "pistol":
                    cParam.EEquipSlot = 0;
                    // End:0xc12
                    break;
                // End:0xa1a
                case "mainweapon":
                    cParam.EEquipSlot = 1;
                    // End:0xc12
                    break;
                // End:0xa3a
                case "Special":
                    cParam.EEquipSlot = 2;
                    // End:0xc12
                    break;
                // End:0xa5a
                case "grenade":
                    cParam.EEquipSlot = 3;
                    // End:0xc12
                    break;
                // End:0xa78
                case "melee":
                    cParam.EEquipSlot = 4;
                    // End:0xc12
                    break;
                // End:0xa96
                case "Knife":
                    cParam.EEquipSlot = 1;
                    // End:0xc12
                    break;
                // End:0xab3
                case "body":
                    cParam.EEquipSlot = 5;
                    // End:0xc12
                    break;
                // End:0xad0
                case "head":
                    cParam.EEquipSlot = 6;
                    // End:0xc12
                    break;
                // End:0xaed
                case "face":
                    cParam.EEquipSlot = 7;
                    // End:0xc12
                    break;
                // End:0xb0f
                case "accessory":
                    cParam.EEquipSlot = 8;
                    // End:0xc12
                    break;
                // End:0xb30
                case "backpack":
                    cParam.EEquipSlot = 9;
                    // End:0xc12
                    break;
                // End:0xb4f
                case "spchar":
                    cParam.EEquipSlot = 10;
                    // End:0xc12
                    break;
                // End:0xb72
                case "part_sight":
                    cParam.EEquipSlot = 11;
                    // End:0xc12
                    break;
                // End:0xb98
                case "part_silencer":
                    cParam.EEquipSlot = 12;
                    // End:0xc12
                    break;
                // End:0xbba
                case "part_camo":
                    cParam.EEquipSlot = 13;
                    // End:0xc12
                    break;
                // End:0xbdd
                case "part_paint":
                    cParam.EEquipSlot = 14;
                    // End:0xc12
                    break;
                // End:0xbfb
                case "skill":
                    cParam.EEquipSlot = 15;
                    // End:0xc12
                    break;
                // End:0xffff
                default:
                    cParam.EEquipSlot = 16;
                    // End:0xc12 Break;
                    break;
            }
            // End:0xc56
            if(GameData.getData("ItemParam", "overlap", iIndex) == "-")
            {
                cParam.bOverlap = false;
            }
            // End:0xc67
            else
            {
                cParam.bOverlap = true;
            }
            cParam.strAddPartGroupID = GameData.getData("ItemParam", "addpart_group_id", iIndex);
            cParam.strPaintingGroupID = GameData.getData("ItemParam", "painting_group_id", iIndex);
            cParam.strAddOption[0] = GameData.getData("ItemParam", "add_option_1", iIndex);
            cParam.strAddOption[1] = GameData.getData("ItemParam", "add_option_2", iIndex);
            cParam.strOptionValue[0] = GameData.getData("ItemParam", "option_value_1", iIndex);
            cParam.strOptionValue[1] = GameData.getData("ItemParam", "option_value_2", iIndex);
            switch(GameData.getData("ItemParam", "costtype", iIndex))
            {
                // End:0xe32
                case "Durability":
                    cParam.ECastType = 0;
                    // End:0xece
                    break;
                // End:0xe4f
                case "Time":
                    cParam.ECastType = 1;
                    // End:0xece
                    break;
                // End:0xe74
                case "Durability-X":
                    cParam.ECastType = 2;
                    // End:0xece
                    break;
                // End:0xe93
                case "Number":
                    cParam.ECastType = 3;
                    // End:0xece
                    break;
                // End:0xeb1
                case "Time2":
                    cParam.ECastType = 4;
                    // End:0xece
                    break;
                // End:0xecb
                case "-":
                    cParam.ECastType = 5;
                    // End:0xece
                    break;
                // End:0xffff
                default:
                    cParam.iRepairCost = int(GameData.getData("ItemParam", "repair_cost", iIndex));
                    cParam.byDurabilityWeight = byte(GameData.getData("ItemParam", "durability_weight", iIndex));
                    switch(GameData.getData("ItemParam", "shop", iIndex))
                    {
                        // End:0xf97
                        case "Part_Best":
                            cParam.iAdType = 14;
                            // End:0x10be
                            break;
                        // End:0xfba
                        case "Part_Event":
                            cParam.iAdType = 13;
                            // End:0x10be
                            break;
                        // End:0xfdb
                        case "Part_Hot":
                            cParam.iAdType = 12;
                            // End:0x10be
                            break;
                        // End:0xffc
                        case "Part_New":
                            cParam.iAdType = 11;
                            // End:0x10be
                            break;
                        // End:0x1019
                        case "Part":
                            cParam.iAdType = 10;
                            // End:0x10be
                            break;
                        // End:0x1035
                        case "Hot":
                            cParam.iAdType = 4;
                            // End:0x10be
                            break;
                        // End:0x1051
                        case "New":
                            cParam.iAdType = 3;
                            // End:0x10be
                            break;
                        // End:0x106f
                        case "Event":
                            cParam.iAdType = 2;
                            // End:0x10be
                            break;
                        // End:0x108c
                        case "Best":
                            cParam.iAdType = 2;
                            // End:0x10be
                            break;
                        // End:0x10a8
                        case "Shop":
                            cParam.iAdType = 1;
                            // End:0x10be
                            break;
                        // End:0xffff
                        default:
                            cParam.iAdType = 0;
                            // End:0x10be Break;
                            break;
                    }
                    // End:0x10ff
                    if(GameData.getData("ItemParam", "sell", iIndex) == "1")
                    {
                        cParam.bSell = true;
                    }
                    // End:0x1110
                    else
                    {
                        cParam.bSell = false;
                    }
                    strTemp = GameData.getData("ItemParam", "shop_period_start", iIndex);
                    ReplaceText(strTemp, ":", " ");
                    ReplaceText(strTemp, "-", " ");
                    class'BTCustomDrawHK'.static.SplitString(strTemp, strArrayTemp, 0, " ");
                    cParam.StartSellDate_Year = int(strArrayTemp[0]);
                    cParam.StartSellDate_Month = byte(int(strArrayTemp[1]));
                    cParam.StartSellDate_Day = byte(int(strArrayTemp[2]));
                    cParam.StartSellDate_Hour = byte(int(strArrayTemp[3]));
                    cParam.StartSellDate_Min = byte(int(strArrayTemp[4]));
                    cParam.StartSellDate_Sec = byte(int(strArrayTemp[5]));
                    strTemp = GameData.getData("ItemParam", "shop_period_end", iIndex);
                    ReplaceText(strTemp, ":", " ");
                    ReplaceText(strTemp, "-", " ");
                    class'BTCustomDrawHK'.static.SplitString(strTemp, strArrayTemp, 0, " ");
                    cParam.EndSellDate_Year = int(strArrayTemp[0]);
                    cParam.EndSellDate_Month = byte(int(strArrayTemp[1]));
                    cParam.EndSellDate_Day = byte(int(strArrayTemp[2]));
                    cParam.EndSellDate_Hour = byte(int(strArrayTemp[3]));
                    cParam.EndSellDate_Min = byte(int(strArrayTemp[4]));
                    cParam.EndSellDate_Sec = byte(int(strArrayTemp[5]));
                    cParam.iSellingPrice = int(GameData.getData("ItemParam", "selling_price", iIndex));
                    cParam.iPeriodNum[0] = int(GameData.getData("ItemParam", "period_num_1", iIndex));
                    cParam.iPeriodNum[1] = int(GameData.getData("ItemParam", "period_num_2", iIndex));
                    cParam.iPeriodNum[2] = int(GameData.getData("ItemParam", "period_num_3", iIndex));
                    cParam.iPeriodNum[3] = int(GameData.getData("ItemParam", "period_num_4", iIndex));
                    cParam.iPeriodNum[4] = int(GameData.getData("ItemParam", "period_num_5", iIndex));
                    cParam.iCashPrice[0] = int(GameData.getData("ItemParam", "cash_price_1", iIndex));
                    cParam.iCashPrice[1] = int(GameData.getData("ItemParam", "cash_price_2", iIndex));
                    cParam.iCashPrice[2] = int(GameData.getData("ItemParam", "cash_price_3", iIndex));
                    cParam.iCashPrice[3] = int(GameData.getData("ItemParam", "cash_price_4", iIndex));
                    cParam.iCashPrice[4] = int(GameData.getData("ItemParam", "cash_price_5", iIndex));
                    cParam.iPointPrice[0] = int(GameData.getData("ItemParam", "point_price_1", iIndex));
                    cParam.iPointPrice[1] = int(GameData.getData("ItemParam", "point_price_2", iIndex));
                    cParam.iPointPrice[2] = int(GameData.getData("ItemParam", "point_price_3", iIndex));
                    cParam.iPointPrice[3] = int(GameData.getData("ItemParam", "point_price_4", iIndex));
                    cParam.iPointPrice[4] = int(GameData.getData("ItemParam", "point_price_5", iIndex));
                    cParam.iDBRemainTime = int(GameData.getData("ItemParam", "db_remain_time", iIndex));
                    cParam.iDBAddPartID = int(GameData.getData("ItemParam", "db_addpart_id", iIndex));
                    cParam.iDBDurability = int(GameData.getData("ItemParam", "db_durability", iIndex));
                    cParam.iDBImpair = int(GameData.getData("ItemParam", "db_impair", iIndex));
                    cParam.iDBEquipUpgrade = int(GameData.getData("ItemParam", "db_equip_upgrade", iIndex));
                    // End:0x18c4
                    if(GameData.getData("ItemParam", "auction", iIndex) == "1")
                    {
                        cParam.bAuction = true;
                    }
                    // End:0x18d5
                    else
                    {
                        cParam.bAuction = false;
                    }
                    cParam.iAuctionMaxPrice = int(GameData.getData("ItemParam", "auction_maxprice", iIndex));
                    cParam.iAuctionMinPrice = int(GameData.getData("ItemParam", "auction_minprice", iIndex));
                    cParam.iResourceArrayIndex = 0;
                    SetItemIndex(cParam.iItemID, ItemParams.Length);
                    ItemParams[ItemParams.Length] = cParam;
                    ++ iIndex;
                    // This is an implied JumpToken; Continue!
                    goto J0x0d;
                }
            }
            GameData = new class'BTNetGameData';
            bResult = GameData.LoadWeaponParams();
            // End:0x19d2
            if(bResult == false)
            {
                return;
            }
            iIndex = 0;
            J0x19d9:
            // End:0x1cc3 [While If]
            if(true)
            {
                strTemp = GameData.getData("WeaponParam", "display_name", iIndex);
                // End:0x1a26
                if(strTemp == "99999")
                {
                }
                // End:0x1cc3
                else
                {
                    ItemID = int(GameData.getData("WeaponParam", "item_id", iIndex));
                    i = 0;
                    J0x1a5f:
                    // End:0x1cb9 [While If]
                    if(i < ItemParams.Length)
                    {
                        // End:0x1caf
                        if(ItemParams[i].iItemID == ItemID)
                        {
                            ItemParams[i].start_ammo = int(GameData.getData("WeaponParam", "start_ammo", iIndex));
                            ItemParams[i].clip_size = int(GameData.getData("WeaponParam", "clip_size", iIndex));
                            ItemParams[i].ui_damage = byte(GameData.getData("WeaponParam", "ui_damage", iIndex));
                            ItemParams[i].ui_spread = byte(GameData.getData("WeaponParam", "ui_spread", iIndex));
                            ItemParams[i].ui_view_kick = byte(GameData.getData("WeaponParam", "ui_view_kick", iIndex));
                            ItemParams[i].ui_rate_of_fire = byte(GameData.getData("WeaponParam", "ui_rate_of_fire", iIndex));
                            ItemParams[i].ui_move = byte(GameData.getData("WeaponParam", "ui_move", iIndex));
                            ItemParams[i].ui_range = byte(GameData.getData("WeaponParam", "ui_range", iIndex));
                        }
                        // End:0x1cb9
                        else
                        {
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x1a5f;
                        }
                    }
                    ++ iIndex;
                    // This is an implied JumpToken; Continue!
                    goto J0x19d9;
                }
            }
}

function AddItemParam_NullData()
{
    local wItemBaseParam tmParam;

    tmParam = new class'wItemBaseParam';
    ItemParams[ItemParams.Length] = tmParam;
}

function wItemBaseParam GetItemParam(int iItemID)
{
    return ItemParams[GetItemArrayIndex(iItemID)];
}

function LoadItemResourceParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(ItemResParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadItemResourceParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddItemResourceParams(GameData);
}

function AddItemResourceParams(BTNetGameData GameData)
{
    local wItemResourceParam cParam;
    local int iIndex;
    local string strTemp;

    AddItemResourceParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x4fc [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ItemResource", "item_resource_name", iIndex);
        // End:0x64
        if(strTemp == "99999")
        {
        }
        // End:0x4fc
        else
        {
            cParam = new class'wItemResourceParam';
            cParam.iItemResourceID = int(GameData.getData("ItemResource", "item_resource_id", iIndex));
            cParam.strResName = GameData.getData("ItemResource", "item_resource_name", iIndex);
            cParam.strRes_1st = GameData.getData("ItemResource", "resource_1st_file", iIndex);
            cParam.strRes_3rd = GameData.getData("ItemResource", "resource_3rd_file", iIndex);
            cParam.strRes_Icon = GameData.getData("ItemResource", "resource_ui_itemicon_file", iIndex);
            cParam.strHaveDotName = GameData.getData("ItemResource", "dot", iIndex);
            cParam.strRes_3rd_AF_Backpack = GameData.getData("ItemResource", "resource_3rd_file_backpack", iIndex);
            cParam.strRes_3rd_AF_Gore = GameData.getData("ItemResource", "resource_3rd_file_gore", iIndex);
            cParam.strRes_3rd_AF_Gore_Static = GameData.getData("ItemResource", "resource_3rd_file_gore_parts", iIndex);
            cParam.strRes_1st_RSA = GameData.getData("ItemResource", "resource_1st_file_rsa", iIndex);
            cParam.strRes_3rd_RSA = GameData.getData("ItemResource", "resource_3rd_file_rsa", iIndex);
            cParam.strRes_3rd_RSA_Backpack = GameData.getData("ItemResource", "resource_3rd_file_rsa_backpack", iIndex);
            cParam.strRes_3rd_RSA_Gore = GameData.getData("ItemResource", "resource_3rd_file_rsa_gore", iIndex);
            cParam.strRes_3rd_RSA_Gore_Static = GameData.getData("ItemResource", "resource_3rd_file_rsa_gore_parts", iIndex);
            cParam.Resource_UI_Weapon_Ani = GameData.getData("ItemResource", "resource_ui_weapon_ani", iIndex);
            ItemParams[GetItemArrayIndex(cParam.iItemResourceID)].iResourceArrayIndex = ItemResParams.Length;
            ItemResParams[ItemResParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
}

function AddItemResourceParam_NullData()
{
    local wItemResourceParam cParam;

    cParam = new class'wItemResourceParam';
    ItemResParams[ItemResParams.Length] = cParam;
}

function wItemResourceParam GetItemResourceParam(int iItemID)
{
    return ItemResParams[GetItemParam(iItemID).iResourceArrayIndex];
}

function PrecacheItemResources(LevelInfo Level)
{
    local int lp1;
    local wItemBaseParam Item;

    lp1 = 0;
    J0x07:
    // End:0x8e [While If]
    if(lp1 < ItemParams.Length)
    {
        Item = ItemParams[lp1];
        GetItemResourceMesh(Item.iItemID, false, 0);
        GetItemResourceMesh(Item.iItemID, false, 1);
        GetItemResourceMesh(Item.iItemID, true, 0);
        GetItemResourceMesh(Item.iItemID, true, 1);
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function Mesh GetItemResourceMesh(int iItemID, bool b3rd, optional byte byTeam, optional byte byCase)
{
    local wItemResourceParam cResParam;

    // End:0x0d
    if(iItemID <= 0)
    {
        return none;
    }
    cResParam = GetItemResourceParam(iItemID);
    // End:0x41
    if(cResParam == none || cResParam.iItemResourceID <= 0)
    {
        return none;
    }
    // End:0x220
    if(byCase == 0)
    {
        // End:0x13d
        if(b3rd == false)
        {
            // End:0xd2
            if(byTeam == 0)
            {
                // End:0xc0
                if(cResParam.mesh_Base_1st == none && Len(cResParam.strRes_1st) > 1)
                {
                    cResParam.mesh_Base_1st = Mesh(DynamicLoadObject(cResParam.strRes_1st, class'Mesh'));
                }
                return cResParam.mesh_Base_1st;
            }
            // End:0x13a
            else
            {
                // End:0x12b
                if(cResParam.mesh_Base_1st_RSA == none && Len(cResParam.strRes_1st_RSA) > 1)
                {
                    cResParam.mesh_Base_1st_RSA = Mesh(DynamicLoadObject(cResParam.strRes_1st_RSA, class'Mesh'));
                }
                return cResParam.mesh_Base_1st_RSA;
            }
        }
        // End:0x21d
        else
        {
            // End:0x1b5
            if(byTeam == 0)
            {
                // End:0x1a3
                if(cResParam.mesh_Base_3rd == none && Len(cResParam.strRes_3rd) > 1)
                {
                    cResParam.mesh_Base_3rd = Mesh(DynamicLoadObject(cResParam.strRes_3rd, class'Mesh'));
                }
                return cResParam.mesh_Base_3rd;
            }
            // End:0x21d
            else
            {
                // End:0x20e
                if(cResParam.mesh_Base_3rd_RSA == none && Len(cResParam.strRes_3rd_RSA) > 1)
                {
                    cResParam.mesh_Base_3rd_RSA = Mesh(DynamicLoadObject(cResParam.strRes_3rd_RSA, class'Mesh'));
                }
                return cResParam.mesh_Base_3rd_RSA;
            }
        }
    }
    // End:0x30d
    else
    {
        // End:0x30d
        if(byCase == 1)
        {
            // End:0x2a5
            if(byTeam == 0)
            {
                // End:0x293
                if(cResParam.mesh_AF_Backpack == none && Len(cResParam.strRes_3rd_AF_Backpack) > 1)
                {
                    cResParam.mesh_AF_Backpack = Mesh(DynamicLoadObject(cResParam.strRes_3rd_AF_Backpack, class'Mesh'));
                }
                return cResParam.mesh_AF_Backpack;
            }
            // End:0x30d
            else
            {
                // End:0x2fe
                if(cResParam.mesh_RSA_Backpack == none && Len(cResParam.strRes_3rd_RSA_Backpack) > 1)
                {
                    cResParam.mesh_RSA_Backpack = Mesh(DynamicLoadObject(cResParam.strRes_3rd_RSA_Backpack, class'Mesh'));
                }
                return cResParam.mesh_RSA_Backpack;
            }
        }
    }
    return none;
}

function StaticMesh GetItemResourceStaticMesh(int iItemID, bool b3rd, optional byte byTeam, optional byte byCase)
{
    local wItemResourceParam cResParam;

    // End:0x0d
    if(iItemID <= 0)
    {
        return none;
    }
    cResParam = GetItemResourceParam(iItemID);
    // End:0x41
    if(cResParam == none || cResParam.iItemResourceID <= 0)
    {
        return none;
    }
    // End:0x21d
    if(byCase == 0)
    {
        // End:0x13d
        if(b3rd == false)
        {
            // End:0xd2
            if(byTeam == 0)
            {
                // End:0xc0
                if(cResParam.stmesh_Base_1st == none && Len(cResParam.strRes_1st) > 1)
                {
                    cResParam.stmesh_Base_1st = StaticMesh(DynamicLoadObject(cResParam.strRes_1st, class'StaticMesh'));
                }
                return cResParam.stmesh_Base_1st;
            }
            // End:0x13a
            else
            {
                // End:0x12b
                if(cResParam.stmesh_Base_1st_RSA == none && Len(cResParam.strRes_1st_RSA) > 1)
                {
                    cResParam.stmesh_Base_1st_RSA = StaticMesh(DynamicLoadObject(cResParam.strRes_1st_RSA, class'StaticMesh'));
                }
                return cResParam.stmesh_Base_1st_RSA;
            }
        }
        // End:0x21d
        else
        {
            // End:0x1b5
            if(byTeam == 0)
            {
                // End:0x1a3
                if(cResParam.stmesh_Base_3rd == none && Len(cResParam.strRes_3rd) > 1)
                {
                    cResParam.stmesh_Base_3rd = StaticMesh(DynamicLoadObject(cResParam.strRes_3rd, class'StaticMesh'));
                }
                return cResParam.stmesh_Base_3rd;
            }
            // End:0x21d
            else
            {
                // End:0x20e
                if(cResParam.stmesh_Base_3rd_RSA == none && Len(cResParam.strRes_3rd_RSA) > 1)
                {
                    cResParam.stmesh_Base_3rd_RSA = StaticMesh(DynamicLoadObject(cResParam.strRes_3rd_RSA, class'StaticMesh'));
                }
                return cResParam.stmesh_Base_3rd_RSA;
            }
        }
    }
    return none;
}

function LoadSkillParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(SkillParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadSkillParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddSkillParams(GameData);
}

function AddSkillParams(BTNetGameData GameData)
{
    local wSkillBaseParam cParam;
    local int iIndex;
    local string strTemp;

    AddSkillParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x36a [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("SkillParam", "skill_name", iIndex);
        // End:0x5a
        if(strTemp == "99999")
        {
        }
        // End:0x36a
        else
        {
            cParam = new class'wSkillBaseParam';
            cParam.iSkillID = int(GameData.getData("SkillParam", "skill_id", iIndex));
            cParam.strName = GameData.getData("SkillParam", "skill_name", iIndex);
            cParam.strClassName = GameData.getData("SkillParam", "script_class", iIndex);
            cParam.iAttachWeaponID = int(GameData.getData("SkillParam", "attach_weapon", iIndex));
            cParam.iRequirementSkillid = int(GameData.getData("SkillParam", "requirement_skill_id", iIndex));
            switch(GameData.getData("SkillParam", "skill_type", iIndex))
            {
                // End:0x1f0
                case "normal":
                    cParam.ESkillType = 0;
                    // End:0x22a
                    break;
                // End:0x20d
                case "clan":
                    cParam.ESkillType = 1;
                    // End:0x22a
                    break;
                // End:0x213
                case "-":
                // End:0xffff
                default:
                    cParam.ESkillType = 2;
                    // End:0x22a Break;
                    break;
            }
            switch(GameData.getData("SkillParam", "active_type", iIndex))
            {
                // End:0x278
                case "active":
                    cParam.eActiveType = 0;
                    // End:0x2b5
                    break;
                // End:0x298
                case "passive":
                    cParam.eActiveType = 1;
                    // End:0x2b5
                    break;
                // End:0x29e
                case "-":
                // End:0xffff
                default:
                    cParam.eActiveType = 2;
                    // End:0x2b5 Break;
                    break;
            }
            cParam.iUseKey = int(GameData.getData("SkillParam", "skill_num", iIndex));
            cParam.strDescription = GameData.getData("SkillParam", "active_description", iIndex);
            SetSkillIndex(cParam.iSkillID, SkillParams.Length);
            SkillParams[SkillParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
}

function AddSkillParam_NullData()
{
    local wSkillBaseParam cParam;

    cParam = new class'wSkillBaseParam';
    SkillParams[SkillParams.Length] = cParam;
}

function wSkillBaseParam GetSkillParam(int iSkillID)
{
    return SkillParams[GetSkillArrayIndex(iSkillID)];
}

function LoadLevelInfoParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(LevelInfoParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadLevelInfoParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddLevelInfoParams(GameData);
}

function AddLevelInfoParam_NullData()
{
    local wLevelInfoParam cParam;

    cParam = new class'wLevelInfoParam';
    LevelInfoParams[LevelInfoParams.Length] = cParam;
}

function AddLevelInfoParams(BTNetGameData GameData)
{
    local wLevelInfoParam cParam;
    local int iIndex;
    local string strTemp;

    AddLevelInfoParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x10b [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("LevelInfoParam", "lv", iIndex);
        // End:0x56
        if(strTemp == "99999")
        {
        }
        // End:0x10b
        else
        {
            cParam = new class'wLevelInfoParam';
            cParam.nLevel = int(strTemp);
            cParam.sLevelName = GameData.getData("LevelInfoParam", "class", iIndex);
            cParam.nAccumExp = int(GameData.getData("LevelInfoParam", "exp", iIndex));
            LevelInfoParams[LevelInfoParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function LoadClanLevelInfoParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(ClanLevelInfoParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadClanLevelInfoParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddClanLevelInfoParams(GameData);
}

function AddClanLevelInfoParam_NullData()
{
    local wClanLevelInfoParam cParam;

    cParam = new class'wClanLevelInfoParam';
    ClanLevelInfoParams[ClanLevelInfoParams.Length] = cParam;
}

function AddClanLevelInfoParams(BTNetGameData GameData)
{
    local wClanLevelInfoParam cParam;
    local int iIndex;
    local string strTemp;

    AddClanLevelInfoParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x117 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ClanLevelInfoParam", "lv", iIndex);
        // End:0x5a
        if(strTemp == "99999")
        {
        }
        // End:0x117
        else
        {
            cParam = new class'wClanLevelInfoParam';
            cParam.nLevel = int(strTemp);
            cParam.sLevelName = GameData.getData("ClanLevelInfoParam", "class", iIndex);
            cParam.nAccumExp = int(GameData.getData("ClanLevelInfoParam", "exp", iIndex));
            ClanLevelInfoParams[ClanLevelInfoParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function LoadPromotionParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(PromotionParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadPromotionParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddPromotionParams(GameData);
}

function AddPromotionParam_NullData()
{
    local wPromotionParam cParam;

    cParam = new class'wPromotionParam';
    PromotionParams[PromotionParams.Length] = cParam;
}

function AddPromotionParams(BTNetGameData GameData)
{
    local wPromotionParam cParam;
    local int iIndex;
    local string strTemp;

    AddPromotionParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x128 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("PromotionParam", "promotion_lv", iIndex);
        // End:0x60
        if(strTemp == "99999")
        {
        }
        // End:0x128
        else
        {
            cParam = new class'wPromotionParam';
            cParam.nLevel = int(strTemp);
            cParam.sAcquireItem = GameData.getData("PromotionParam", "promotion_item_id", iIndex);
            cParam.nPartID = int(GameData.getData("PromotionParam", "addpart_id", iIndex));
            PromotionParams[PromotionParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function int GetPromotionItemsCount(int Level)
{
    local int i, Count;

    Count = 0;
    i = 0;
    J0x0e:
    // End:0x4d [While If]
    if(i < PromotionParams.Length)
    {
        // End:0x43
        if(PromotionParams[i].nLevel == Level)
        {
            ++ Count;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    return Count;
}

function GetPromotionItems(int Level, out array<wPromotionParam> arrItems)
{
    local int i, Count;

    Count = 0;
    i = 0;
    J0x0e:
    // End:0x64 [While If]
    if(i < PromotionParams.Length)
    {
        // End:0x5a
        if(PromotionParams[i].nLevel == Level)
        {
            arrItems[Count] = PromotionParams[i];
            ++ Count;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
}

function LoadQuestParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(QuestParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadQuestParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddQuestParams(GameData);
}

function AddQuestParam_NullData()
{
    local wQuestParam cParam;

    cParam = new class'wQuestParam';
    cParam.QuestID = -1;
    QuestParams[QuestParams.Length] = cParam;
}

function AddQuestParams(BTNetGameData GameData)
{
    local wQuestParam cParam;
    local int iIndex;
    local string strTemp;
    local BtrTime EventTime;

    AddQuestParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x8b0 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("QuestParam", "quest_type", iIndex);
        // End:0x5a
        if(strTemp == "99999")
        {
        }
        // End:0x8b0
        else
        {
            cParam = new class'wQuestParam';
            cParam.QuestType = int(strTemp);
            cParam.QuestID = int(GameData.getData("QuestParam", "quest_id", iIndex));
            cParam.LinkQuestID = int(GameData.getData("QuestParam", "link_quest_id", iIndex));
            cParam.LinkQuestStep = int(GameData.getData("QuestParam", "link_quest_step", iIndex));
            cParam.LimitArea = int(GameData.getData("QuestParam", "limit_area", iIndex));
            strTemp = GameData.getData("QuestParam", "event_start", iIndex);
            // End:0x1e3
            if(strTemp != "-")
            {
                EventTime = TimeStringToBtrTime(strTemp);
                BtrTimeToBtrDouble(EventTime, cParam.EventStartTime);
            }
            strTemp = GameData.getData("QuestParam", "event_end", iIndex);
            // End:0x24b
            if(strTemp != "-")
            {
                EventTime = TimeStringToBtrTime(strTemp);
                BtrTimeToBtrDouble(EventTime, cParam.EventEndTime);
            }
            cParam.QuestCreateLv = int(GameData.getData("QuestParam", "quest_create_lv", iIndex));
            cParam.DisplayOrder = int(GameData.getData("QuestParam", "display_order", iIndex));
            cParam.LinkQuestName = GameData.getData("QuestParam", "link_quest_name", iIndex);
            // End:0x334
            if(cParam.LinkQuestName == "-")
            {
                cParam.LinkQuestName = "";
            }
            cParam.QuestMissionDesc = GameData.getData("QuestParam", "quest_mission_description", iIndex);
            // End:0x3a5
            if(cParam.QuestMissionDesc == "-")
            {
                cParam.QuestMissionDesc = "";
            }
            cParam.QuestExtDesc = GameData.getData("QuestParam", "quest_description", iIndex);
            // End:0x40e
            if(cParam.QuestExtDesc == "-")
            {
                cParam.QuestExtDesc = "";
            }
            cParam.MissionType = int(GameData.getData("QuestParam", "mission_type", iIndex));
            cParam.MissionOption[0] = int(GameData.getData("QuestParam", "mission_option_1", iIndex));
            cParam.MissionOption[1] = int(GameData.getData("QuestParam", "mission_option_2", iIndex));
            cParam.MissionBotMode = int(GameData.getData("QuestParam", "mission_botmode", iIndex));
            cParam.MissionCount = int(GameData.getData("QuestParam", "mission_count", iIndex));
            cParam.RewardExp = int(GameData.getData("QuestParam", "reward_exp", iIndex));
            cParam.RewardPoint = int(GameData.getData("QuestParam", "reward_point", iIndex));
            cParam.RewardItemID[0] = int(GameData.getData("QuestParam", "reward_item_1_id", iIndex));
            cParam.RewardItemPartID[0] = int(GameData.getData("QuestParam", "reward_item_1_parts_id", iIndex));
            cParam.RewardItemID[1] = int(GameData.getData("QuestParam", "reward_item_2_id", iIndex));
            cParam.RewardItemPartID[1] = int(GameData.getData("QuestParam", "reward_item_2_parts_id", iIndex));
            cParam.RewardQuestID[0] = int(GameData.getData("QuestParam", "reward_quest_1_id", iIndex));
            cParam.RewardQuestID[1] = int(GameData.getData("QuestParam", "reward_quest_2_id", iIndex));
            cParam.RewardQuestID[2] = int(GameData.getData("QuestParam", "reward_quest_3_id", iIndex));
            cParam.RewardQuestID[3] = int(GameData.getData("QuestParam", "reward_quest_4_id", iIndex));
            cParam.RewardQuestID[4] = int(GameData.getData("QuestParam", "reward_quest_5_id", iIndex));
            cParam.HelpResource = GameData.getData("QuestParam", "help_resource", iIndex);
            QuestParams[QuestParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function bool IsEnableWeaponModify(wItemBoxHK ItemInfo)
{
    local int i;

    // End:0x2e
    if(ItemInfo.bParts == false && ItemInfo.bPaints == false)
    {
        return false;
    }
    i = 0;
    J0x35:
    // End:0x7f [While If]
    if(i < ItemInfo.PartAllList.Length)
    {
        // End:0x75
        if(IsExistShopItemList(ItemInfo.PartAllList[i].ItemID) == 1)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    i = 0;
    J0x86:
    // End:0xd0 [While If]
    if(i < ItemInfo.PaintGroupList.Length)
    {
        // End:0xc6
        if(IsExistShopItemList(ItemInfo.PaintGroupList[i].PaintingItemID) == 1)
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x86;
    }
    return false;
}

function int GetItemType(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local int iItemType;

    iItemType = 0;
    switch(ItemInfo.Grade)
    {
        // End:0x2b
        case 14:
            iItemType += FlagCash;
            // End:0x47
            break;
        // End:0x30
        case 7:
        // End:0x44
        case 8:
            iItemType += FlagPCBang;
            // End:0x47
            break;
        // End:0xffff
        default:
            // End:0x61
            if(bool(iItemType & FlagPCBang) == true)
            {
                return iItemType;
            }
            // End:0xe0
            if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2 || ItemInfo.CostType == 4)
            {
                // End:0xc0
                if(IsEnableWeaponModify(ItemInfo) == true)
                {
                    iItemType += FlagModify;
                }
                // End:0xe0
                if(ItemInfo.CostType == 0)
                {
                    iItemType += FlagDurability;
                }
            }
            // End:0x182
            if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
            {
                // End:0x162
                if(bool(iItemType & FlagCash) == true)
                {
                    // End:0x15f
                    if(instanceInfo.CashItemInfo != none && instanceInfo.CashItemInfo.bWZCanBuy == true)
                    {
                        iItemType += FlagRenew;
                    }
                }
                // End:0x182
                else
                {
                    // End:0x182
                    if(ItemInfo.AdType != 0)
                    {
                        iItemType += FlagRenew;
                    }
                }
            }
            // End:0x1a3
            if(ItemInfo.bSellShop == true)
            {
                iItemType += FlagSellShop;
            }
            // End:0x247
            if(bool(iItemType & FlagPCBang) == false)
            {
                // End:0x20f
                if(bool(iItemType & FlagCash) == true)
                {
                    // End:0x20c
                    if(instanceInfo.CashItemInfo != none && instanceInfo.CashItemInfo.WZCashPrice[0] != 0)
                    {
                        iItemType += FlagBuyShop;
                    }
                }
                // End:0x247
                else
                {
                    // End:0x247
                    if(ItemInfo.AdType != 0 && ItemInfo.PointPrice[0] != 0)
                    {
                        iItemType += FlagBuyShop;
                    }
                }
            }
            return iItemType;
    }
}

function wQuestParam GetQuestInfo(int QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4b [While If]
    if(i < QuestParams.Length)
    {
        // End:0x41
        if(QuestParams[i].QuestID == QuestID)
        {
            return QuestParams[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return QuestParams[0];
}

function wQuestParam GetQuestInfoFromIndex(int Index)
{
    // End:0x16
    if(Index < 0)
    {
        return QuestParams[0];
    }
    // End:0x22
    else
    {
        return QuestParams[Index];
    }
}

function int GetQuestInfoIndex(int QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < QuestParams.Length)
    {
        // End:0x3b
        if(QuestParams[i].QuestID == QuestID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function wQuestParam GetLinkQuestInfo(int LinkQuestID, int LinkQuestStep)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6b [While If]
    if(i < QuestParams.Length)
    {
        // End:0x61
        if(QuestParams[i].LinkQuestID == LinkQuestID && QuestParams[i].LinkQuestStep == LinkQuestStep)
        {
            return QuestParams[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return QuestParams[0];
}

function int GetLinkQuestMaxStep(int LinkQuestID)
{
    local int i, maxstep;

    maxstep = -1;
    i = 0;
    J0x12:
    // End:0x82 [While If]
    if(i < QuestParams.Length)
    {
        // End:0x78
        if(QuestParams[i].LinkQuestID == LinkQuestID)
        {
            // End:0x78
            if(QuestParams[i].LinkQuestStep > maxstep)
            {
                maxstep = QuestParams[i].LinkQuestStep;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return maxstep;
}

function bool HasEnableEventQuest(BtrDouble ServerTime, wMatchMaker wMM)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x83 [While If]
    if(i < QuestParams.Length)
    {
        // End:0x79
        if(QuestParams[i].IsEventQuest() && QuestParams[i].IsEnabledEventQuest(ServerTime))
        {
            // End:0x79
            if(wMM.FindQuest(QuestParams[i].QuestID) < 0)
            {
                return true;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

function BtrTime TimeStringToBtrTime(string strInTime)
{
    local string strDate, strTime, strTemp;
    local BtrTime resultBtrTime;

    Divide(strInTime, " ", strDate, strTime);
    Divide(strDate, "-", strTemp, strDate);
    resultBtrTime.Year = int(strTemp);
    Divide(strDate, "-", strTemp, strDate);
    resultBtrTime.Month = int(strTemp);
    resultBtrTime.Day = int(strDate);
    Divide(strTime, ":", strTemp, strTime);
    resultBtrTime.Hour = int(strTemp);
    Divide(strTime, ":", strTemp, strTime);
    resultBtrTime.Minute = int(strTemp);
    resultBtrTime.Second = int(strTime);
    return resultBtrTime;
}

function LoadDailyQuestParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(DailyQuestParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadDailyQuestParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddDailyQuestParams(GameData);
}

function AddDailyQuestParam_NullData()
{
    local wDailyQuestParam cParam;

    cParam = new class'wDailyQuestParam';
    cParam.QuestID = -1;
    DailyQuestParams[DailyQuestParams.Length] = cParam;
}

function AddDailyQuestParams(BTNetGameData GameData)
{
    local wDailyQuestParam cParam;
    local int iIndex;
    local string strTemp;

    AddDailyQuestParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x122 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("DailyQuestParam", "daily_quest_type", iIndex);
        // End:0x65
        if(strTemp == "99999")
        {
        }
        // End:0x122
        else
        {
            cParam = new class'wDailyQuestParam';
            cParam.DailyQuestType = int(strTemp);
            cParam.Step = int(GameData.getData("DailyQuestParam", "step", iIndex));
            cParam.QuestID = int(GameData.getData("DailyQuestParam", "quest_id", iIndex));
            DailyQuestParams[DailyQuestParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function int GetDailyQuestType(int QuestID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x54 [While If]
    if(i < DailyQuestParams.Length)
    {
        // End:0x4a
        if(DailyQuestParams[i].QuestID == QuestID)
        {
            return DailyQuestParams[i].DailyQuestType;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int GetDailyQuestIDFromTypeAndStep(int ServerTime, int DailyQuestType, int Step)
{
    local array<wDailyQuestParam> Arr;
    local int i;

    i = 0;
    J0x07:
    // End:0x8a [While If]
    if(i < DailyQuestParams.Length)
    {
        // End:0x80
        if(DailyQuestParams[i].DailyQuestType == DailyQuestType && DailyQuestParams[i].Step == Step)
        {
            Arr.Length = Arr.Length + 1;
            Arr[Arr.Length - 1] = DailyQuestParams[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x9c
    if(Arr.Length <= 0)
    {
        return -1;
    }
    return Arr[int(float(ServerTime) % float(Arr.Length))].QuestID;
}

function int GetPrevDailyQuestID(int QuestID)
{
    local wQuestParam q;
    local int DailyQuestType, Step, ServerTime;

    ServerTime = UnresolvedNativeFunction_99(kServerTime);
    q = GetQuestInfo(QuestID);
    Step = q.LinkQuestStep - 1;
    DailyQuestType = GetDailyQuestType(QuestID);
    // End:0x65
    if(Step < 0 || DailyQuestType < 0)
    {
        return -1;
    }
    return GetDailyQuestIDFromTypeAndStep(ServerTime, DailyQuestType, Step);
}

function int GetLastDailyQuestID(int QuestID)
{
    local wQuestParam q;
    local int DailyQuestType, Step, ServerTime;

    ServerTime = UnresolvedNativeFunction_99(kServerTime);
    q = GetQuestInfo(QuestID);
    Step = GetLinkQuestMaxStep(q.LinkQuestID);
    DailyQuestType = GetDailyQuestType(QuestID);
    // End:0x68
    if(Step < 0 || DailyQuestType < 0)
    {
        return -1;
    }
    return GetDailyQuestIDFromTypeAndStep(ServerTime, DailyQuestType, Step);
}

function LoadRandBoxParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(RandBoxParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadRandBoxParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddRandBoxParams(GameData);
}

function AddRandBoxParam_NullData()
{
    local wRandBoxParam cParam;

    cParam = new class'wRandBoxParam';
    cParam.ItemID = -1;
    RandBoxParams[RandBoxParams.Length] = cParam;
}

function AddRandBoxParams(BTNetGameData GameData)
{
    local wRandBoxParam cParam;
    local int iIndex, i;
    local string strTemp;

    AddRandBoxParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x193 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("RandBoxParam", "item_id", iIndex);
        // End:0x59
        if(strTemp == "99999")
        {
        }
        // End:0x193
        else
        {
            cParam = new class'wRandBoxParam';
            cParam.ItemID = int(strTemp);
            cParam.RandNum = int(GameData.getData("RandBoxParam", "rand_num", iIndex));
            i = 0;
            J0xc2:
            // End:0x177 [While If]
            if(i < 50)
            {
                cParam.RandItemID[i] = int(GameData.getData("RandBoxParam", "item_id_" $ string(i + 1), iIndex));
                cParam.RandPartID[i] = int(GameData.getData("RandBoxParam", "parts_id_" $ string(i + 1), iIndex));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xc2;
            }
            RandBoxParams[RandBoxParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function int GetRandBoxItemsCount(int ItemID)
{
    local int i, MaxIndex;

    MaxIndex = 0;
    i = 0;
    J0x0e:
    // End:0x4d [While If]
    if(i < RandBoxParams.Length)
    {
        // End:0x43
        if(RandBoxParams[i].ItemID == ItemID)
        {
            ++ MaxIndex;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
    return MaxIndex;
}

function bool GetRandBoxItems(int ItemID, int RandNum, out array<int> ItemIDs, out array<int> PartIDs)
{
    local int i, j;

    ItemIDs.Length = 0;
    PartIDs.Length = 0;
    i = 0;
    J0x17:
    // End:0x122 [While If]
    if(i < RandBoxParams.Length)
    {
        // End:0x118
        if(RandBoxParams[i].ItemID == ItemID && RandBoxParams[i].RandNum == RandNum)
        {
            j = 0;
            J0x6c:
            // End:0x116 [While If]
            if(j < 50)
            {
                // End:0x10c
                if(RandBoxParams[i].RandItemID[j] != 0)
                {
                    ItemIDs.Length = ItemIDs.Length + 1;
                    ItemIDs[ItemIDs.Length - 1] = RandBoxParams[i].RandItemID[j];
                    PartIDs.Length = PartIDs.Length + 1;
                    PartIDs[PartIDs.Length - 1] = RandBoxParams[i].RandPartID[j];
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x6c;
            }
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    return false;
}

function LoadModeDOAParameters()
{
    local BTNetGameData GameData;
    local bool bResult;
    local wModeDOAParam Param;
    local int iIndex, i, tmpVal;
    local string strTemp;

    // End:0x0e
    if(ModeDOAParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadModeDOAParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    iIndex = 0;
    J0x48:
    // End:0x1f3 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("Mode_DOA", "groupid", iIndex);
        // End:0x90
        if(strTemp == "99999")
        {
        }
        // End:0x1f3
        else
        {
            Param = new class'wModeDOAParam';
            Param.GroupID = int(strTemp);
            Param.WeaponID0 = int(GameData.getData("Mode_DOA", "weaponid0", iIndex));
            Param.WeaponID1 = int(GameData.getData("Mode_DOA", "weaponid1", iIndex));
            Param.WeaponID2 = int(GameData.getData("Mode_DOA", "weaponid2", iIndex));
            Param.WeaponID3 = int(GameData.getData("Mode_DOA", "weaponid3", iIndex));
            Param.WeaponID4 = int(GameData.getData("Mode_DOA", "weaponid4", iIndex));
            ModeDOAParams[ModeDOAParams.Length] = Param;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x48;
        }
    }
    iIndex = 99;
}

function AddClanMarkParam_NullData()
{
    local wClanMarkParam cParam;

    cParam = new class'wClanMarkParam';
    ClanMarkParams[ClanMarkParams.Length] = cParam;
}

function AddClanMarkParams(BTNetGameData GameData)
{
    local wClanMarkParam cParam;
    local int iIndex;
    local string strTemp;

    AddClanMarkParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x2e0 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ClanMarkParam", "clanmark_id", iIndex);
        // End:0x5e
        if(strTemp == "99999")
        {
        }
        // End:0x2e0
        else
        {
            cParam = new class'wClanMarkParam';
            cParam.nClanMark_ID = int(strTemp);
            cParam.nClanMark_Type_1 = int(GameData.getData("ClanMarkParam", "clanmark_type_1", iIndex));
            cParam.nClanMark_Type_2 = int(GameData.getData("ClanMarkParam", "clanmark_type_2", iIndex));
            cParam.nSell_Type = int(GameData.getData("ClanMarkParam", "sell_type", iIndex));
            cParam.nDisplay_Order = int(GameData.getData("ClanMarkParam", "display_order", iIndex));
            cParam.sClanMark_Resource_32 = GameData.getData("ClanMarkParam", "clanmark_resource_32", iIndex);
            cParam.sClanMark_Resource_128 = GameData.getData("ClanMarkParam", "clanmark_resource_128", iIndex);
            SP.ClanMarkImg32[SP.ClanMarkImg32.Length] = class'BTCustomDrawHK'.static.MakeImage(32, 32, 0, Texture(DynamicLoadObject(cParam.sClanMark_Resource_32, class'Texture')));
            SP.ClanMarkImg128[SP.ClanMarkImg128.Length] = class'BTCustomDrawHK'.static.MakeImage(128, 128, 0, Texture(DynamicLoadObject(cParam.sClanMark_Resource_128, class'Texture')));
            ClanMarkParams[ClanMarkParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function wClanMarkParam FindClanMarkParams(int clanmarkid)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4b [While If]
    if(i < ClanMarkParams.Length)
    {
        // End:0x41
        if(ClanMarkParams[i].nClanMark_ID == clanmarkid)
        {
            return ClanMarkParams[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int FindClanMarkIndex(int clanmarkid)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < ClanMarkParams.Length)
    {
        // End:0x3b
        if(ClanMarkParams[i].nClanMark_ID == clanmarkid)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function Image GetMyClanPattern()
{
    return SP.kClanPattern_Img;
}

function Image GetMyClanBG()
{
    return SP.kClanBG_Img;
}

function Image GetMyClanBL()
{
    return SP.kClanBL_Img;
}

function Image GetClanMark32(int clanmarkid)
{
    local int Index;

    Index = FindClanMarkIndex(clanmarkid);
    // End:0x34
    if(Index > 0)
    {
        return SP.ClanMarkImg32[Index];
    }
    // End:0x49
    else
    {
        return class'BTCustomDrawHK'.static.MakeImage(0, 0, 0, none);
    }
}

function Image GetClanMark128(int clanmarkid)
{
    local int Index;

    Index = FindClanMarkIndex(clanmarkid);
    // End:0x34
    if(Index > 0)
    {
        return SP.ClanMarkImg128[Index];
    }
    // End:0x49
    else
    {
        return class'BTCustomDrawHK'.static.MakeImage(0, 0, 0, none);
    }
}

function LoadItemBoxParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(ItemBoxParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadItemBoxParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddItemBoxParams(GameData);
}

function AddItemBoxParam_NullData()
{
    local wItemBoxParam cParam;

    cParam = new class'wItemBoxParam';
    ItemBoxParams[ItemBoxParams.Length] = cParam;
}

function AddItemBoxParams(BTNetGameData GameData)
{
    local wItemBoxParam cParam;
    local int iIndex;
    local string strTemp;
    local int i;
    local string ItemID, PartID;

    AddItemBoxParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x1b3 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ItemBoxParam", "item_id", iIndex);
        // End:0x59
        if(strTemp == "99999")
        {
        }
        // End:0x1b3
        else
        {
            cParam = new class'wItemBoxParam';
            cParam.nItemBoxID = int(strTemp);
            cParam.nItemCount = int(GameData.getData("ItemBoxParam", "item_count", iIndex));
            i = 0;
            J0xc4:
            // End:0x197 [While If]
            if(i < 20)
            {
                ItemID = "box_item_id_" $ string(i + 1);
                PartID = "box_parts_id_" $ string(i + 1);
                cParam.nItemID[i] = int(GameData.getData("ItemBoxParam", ItemID, iIndex));
                cParam.nPartID[i] = int(GameData.getData("ItemBoxParam", PartID, iIndex));
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xc4;
            }
            ItemBoxParams[ItemBoxParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function LoadAddPartsGroupParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(AddPartsGroupParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadAddPartsGroupParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddAddPartsGroupParams(GameData);
}

function AddAddPartsGroupParams(BTNetGameData GameData)
{
    local wPartsGroupParam cParam;
    local int iIndex;
    local string strTemp;

    AddAddPartsGroupParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0xa46 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("PartsGroupParam", "addpart_name", iIndex);
        // End:0x61
        if(strTemp == "99999")
        {
        }
        // End:0xa46
        else
        {
            cParam = new class'wPartsGroupParam';
            cParam.strName = strTemp;
            cParam.iAddPartID = int(GameData.getData("PartsGroupParam", "addpart_id", iIndex));
            cParam.strPartsGroupID = GameData.getData("PartsGroupParam", "addpart_group_id", iIndex);
            cParam.byAddpartNum = byte(GameData.getData("PartsGroupParam", "addpart_num", iIndex));
            cParam.iPointPrice = int(GameData.getData("PartsGroupParam", "point_price", iIndex));
            cParam.iCashPrice = int(GameData.getData("PartsGroupParam", "cash_price", iIndex));
            cParam.iSightID = int(GameData.getData("PartsGroupParam", "scope&sight_id", iIndex));
            cParam.iSightID_Sub = int(GameData.getData("PartsGroupParam", "scope&sight_id_1", iIndex));
            cParam.iSilencerID = int(GameData.getData("PartsGroupParam", "silencer_id", iIndex));
            cParam.iCamoID = int(GameData.getData("PartsGroupParam", "camouflage_id", iIndex));
            cParam.iPaintingID = int(GameData.getData("PartsGroupParam", "painting_id", iIndex));
            cParam.iChar_HeadID = int(GameData.getData("PartsGroupParam", "char_head_id", iIndex));
            cParam.iChar_FaceID = int(GameData.getData("PartsGroupParam", "char_face_id", iIndex));
            cParam.iChar_AccessoryID = int(GameData.getData("PartsGroupParam", "char_accessory_id", iIndex));
            cParam.iSkillID = int(GameData.getData("PartsGroupParam", "skill_id", iIndex));
            cParam.iAddOption[0] = int(GameData.getData("PartsGroupParam", "add_option_1", iIndex));
            cParam.iAddOption[1] = int(GameData.getData("PartsGroupParam", "add_option_2", iIndex));
            cParam.iOptionValue[0] = int(GameData.getData("PartsGroupParam", "option_value_1", iIndex));
            cParam.iOptionValue[1] = int(GameData.getData("PartsGroupParam", "option_value_2", iIndex));
            cParam.strDescription = GameData.getData("PartsGroupParam", "addpart_description", iIndex);
            cParam.fAimDiffX = float(GameData.getData("PartsGroupParam", "sight_aimdiff_x", iIndex));
            cParam.fAimDiffY = float(GameData.getData("PartsGroupParam", "sight_aimdiff_y", iIndex));
            cParam.fAimDiffZ = float(GameData.getData("PartsGroupParam", "sight_aimdiff_z", iIndex));
            cParam.strResource_UI_Icon = GameData.getData("PartsGroupParam", "asdf", iIndex);
            cParam.ui_damage_range = int(GameData.getData("PartsGroupParam", "ui_damage_range", iIndex));
            cParam.ui_firesound = int(GameData.getData("PartsGroupParam", "ui_firesound", iIndex));
            cParam.ui_zoom_1 = GameData.getData("PartsGroupParam", "ui_zoom_1", iIndex);
            cParam.ui_zoom_2 = GameData.getData("PartsGroupParam", "ui_zoom_2", iIndex);
            cParam.UI_Durability = int(GameData.getData("PartsGroupParam", "ui_durability", iIndex));
            cParam.display_3d_x = float(GameData.getData("PartsGroupParam", "3d_x", iIndex));
            cParam.display_3d_y = float(GameData.getData("PartsGroupParam", "3d_y", iIndex));
            cParam.display_3d_z = float(GameData.getData("PartsGroupParam", "3d_z", iIndex));
            cParam.display_3d_rot_y = float(GameData.getData("PartsGroupParam", "3d_rot_y", iIndex));
            cParam.Bootyitem_3d_x = float(GameData.getData("PartsGroupParam", "bootyitem_3d_x", iIndex));
            cParam.Bootyitem_3d_y = float(GameData.getData("PartsGroupParam", "bootyitem_3d_y", iIndex));
            cParam.Bootyitem_3d_z = float(GameData.getData("PartsGroupParam", "bootyitem_3d_z", iIndex));
            cParam.Bootyitem_3d_rot_y = float(GameData.getData("PartsGroupParam", "bootyitem_3d_rot_y", iIndex));
            SetPartsGroupIndex(cParam.iAddPartID, AddPartsGroupParams.Length);
            AddPartsGroupParams[AddPartsGroupParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function AddAddPartsGroupParam_NullData()
{
    local wPartsGroupParam cParam;

    cParam = new class'wPartsGroupParam';
    AddPartsGroupParams[AddPartsGroupParams.Length] = cParam;
}

function wPartsGroupParam GetAddPartsGroupParam(int iPartsGrouplID)
{
    return AddPartsGroupParams[GetPartsGroupArrayIndex(iPartsGrouplID)];
}

function wPartsGroupParam GetDefaultAddPartsGroupParam(int iItemID)
{
    local wItemBaseParam baseParam;
    local int iTemp;

    baseParam = GetItemParam(iItemID);
    iTemp = 0;
    J0x18:
    // End:0x83 [While If]
    if(iTemp < AddPartsGroupParams.Length)
    {
        // End:0x79
        if(baseParam.strAddPartGroupID == AddPartsGroupParams[iTemp].strPartsGroupID && AddPartsGroupParams[iTemp].byAddpartNum == 0)
        {
            return AddPartsGroupParams[iTemp];
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

function Material GetPartsGroupPainting(int iItemID, int iPartsID, optional bool bThird, optional int iPainting_Item_ID)
{
    local wWeaponCustomInfoParam wcip;
    local wItemResourceParam resParam;
    local string strName;
    local Material matResult;

    // End:0x1a
    if(iPartsID <= 0 && iPainting_Item_ID <= 0)
    {
        return none;
    }
    wcip = GetWeaponCustomInfoParam(iItemID);
    // End:0x5b
    if(wcip.iItemID <= 0 || wcip.iItemID != iItemID)
    {
        return none;
    }
    // End:0x1b7
    if(bThird == false)
    {
        resParam = GetItemResourceParam(iItemID);
        // End:0x9b
        if(resParam == none || resParam.iItemResourceID <= 0)
        {
            return none;
        }
        strName = resParam.strRes_3rd_AF_Backpack;
        // End:0x127
        if(iPainting_Item_ID > 0)
        {
            resParam = GetItemResourceParam(iPainting_Item_ID);
            // End:0xee
            if(resParam == none || resParam.iItemResourceID <= 0)
            {
                return none;
            }
            strName = strName $ resParam.strRes_3rd_AF_Backpack;
            matResult = Material(DynamicLoadObject(strName, class'Material'));
        }
        // End:0x1ae
        else
        {
            // End:0x1ae
            if(wcip.iDefaultPaintingID > 0)
            {
                resParam = GetItemResourceParam(wcip.iDefaultPaintingID);
                // End:0x178
                if(resParam == none || resParam.iItemResourceID <= 0)
                {
                    return none;
                }
                strName = strName $ resParam.strRes_3rd_AF_Backpack;
                matResult = Material(DynamicLoadObject(strName, class'Material'));
            }
        }
        return matResult;
    }
    // End:0x318
    else
    {
        resParam = GetItemResourceParam(iItemID);
        // End:0x1eb
        if(resParam == none || resParam.iItemResourceID <= 0)
        {
            return none;
        }
        // End:0x277
        if(iPainting_Item_ID > 0)
        {
            strName = resParam.strRes_3rd_AF_Gore;
            resParam = GetItemResourceParam(iPainting_Item_ID);
            // End:0x23e
            if(resParam == none || resParam.iItemResourceID <= 0)
            {
                return none;
            }
            strName = strName $ resParam.strRes_3rd_AF_Backpack;
            matResult = Material(DynamicLoadObject(strName, class'Material'));
        }
        // End:0x312
        else
        {
            strName = resParam.strRes_3rd_AF_Gore;
            // End:0x312
            if(wcip.iDefaultPaintingID > 0)
            {
                resParam = GetItemResourceParam(wcip.iDefaultPaintingID);
                // End:0x2dc
                if(resParam == none || resParam.iItemResourceID <= 0)
                {
                    return none;
                }
                strName = strName $ resParam.strRes_3rd_AF_Backpack;
                matResult = Material(DynamicLoadObject(strName, class'Material'));
            }
        }
        return matResult;
    }
}

function LoadPaintGroupParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0e
    if(PaintGroupParams.Length > 0)
    {
        return;
    }
    GameData = new class'BTNetGameData';
    bResult = GameData.LoadPaintGroupParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddPaintGroupParams(GameData);
}

function AddPaintGroupParams(BTNetGameData GameData)
{
    local wPaintGroupParam cParam;
    local int iIndex;
    local string strTemp;

    AddPaintGroupParam_NullData();
    iIndex = 0;
    J0x0d:
    // End:0x239 [While If]
    if(1 != 0)
    {
        strTemp = GameData.getData("PaintGroupParam", "painting_id", iIndex);
        // End:0x60
        if(strTemp == "99999")
        {
        }
        // End:0x239
        else
        {
            cParam = new class'wPaintGroupParam';
            cParam.PaintingID = int(strTemp);
            cParam.PaintingGroupID = GameData.getData("PaintGroupParam", "painting_group_id", iIndex);
            cParam.PaintingNum = int(GameData.getData("PaintGroupParam", "painting_num", iIndex));
            cParam.PaintingItemID = int(GameData.getData("PaintGroupParam", "painting_item_id", iIndex));
            cParam.RepairCost = float(GameData.getData("PaintGroupParam", "repair_cost", iIndex));
            cParam.UI_Durability = int(GameData.getData("PaintGroupParam", "ui_durability", iIndex));
            cParam.strUI_Icon = GameData.getData("PaintGroupParam", "ui_icon", iIndex);
            PaintGroupParams[PaintGroupParams.Length] = cParam;
            ++ iIndex;
            // This is an implied JumpToken; Continue!
            goto J0x0d;
        }
    }
    iIndex = 99;
}

function AddPaintGroupParam_NullData()
{
    local wPaintGroupParam cParam;

    cParam = new class'wPaintGroupParam';
    PaintGroupParams[PaintGroupParams.Length] = cParam;
}

function string GetPaintingUIIcon(int iItemID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x54 [While If]
    if(i < PaintGroupParams.Length)
    {
        // End:0x4a
        if(PaintGroupParams[i].PaintingItemID == iItemID)
        {
            return PaintGroupParams[i].strUI_Icon;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function wPaintGroupParam GetPaintGroupParam(int iPaintingID)
{
    local wPaintGroupParam PaintParam;
    local int PaintingIdx;

    PaintingIdx = GetPaintGroupParamsIndex(iPaintingID);
    // End:0x2d
    if(PaintingIdx >= 0)
    {
        PaintParam = PaintGroupParams[PaintingIdx];
    }
    return PaintParam;
}

function int GetPaintGroupParamsIndex(int PaintingID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < PaintGroupParams.Length)
    {
        // End:0x3b
        if(PaintGroupParams[i].PaintingID == PaintingID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function int GetPaintingItemIDbyPaintingID(int PaintingID)
{
    local int idx;

    idx = GetPaintGroupParamsIndex(PaintingID);
    // End:0x31
    if(idx >= 0)
    {
        return PaintGroupParams[idx].PaintingItemID;
    }
    return 0;
}

function LoadMapInfos()
{
    local BTNetMapData mapData;
    local bool bResult;
    local float fValue;
    local int iIndex;
    local wMapInfo Info;

    // End:0xfaf
    if(MapInfos.Length == 0)
    {
        mapData = new class'BTNetMapData';
        bResult = mapData.LoadMapData();
        // End:0x3e
        if(!bResult)
        {
            return;
        }
        fValue = 0.0;
        iIndex = 0;
        J0x50:
        // End:0xfaf [While If]
        if(fValue != float(99999))
        {
            Info = new class'wMapInfo';
            Info.MapID = int(mapData.getData("Map", "map_id", iIndex));
            Info.File = mapData.getData("Map", "map_resource_id", iIndex);
            Info.FriendlyName = mapData.getData("Map", "map_name", iIndex);
            Info.MapDisplaySort = int(mapData.getData("Map", "map_display", iIndex));
            Info.NewMapIcon = mapData.getData("Map", "map_icon", iIndex);
            Info.MapDifficulty = int(mapData.getData("Map", "map_difficulty", iIndex));
            Info.MapDifficultyDisplay = mapData.getData("Map", "map_difficulty_display", iIndex);
            Info.SupplyHealth = float(mapData.getData("Map", "supply_health", iIndex));
            Info.SupplyHelicopter = float(mapData.getData("Map", "supply_helicopter", iIndex));
            Info.SupplyBombing = float(mapData.getData("Map", "supply_bombing", iIndex));
            Info.SupplyUAV = float(mapData.getData("Map", "supply_uav", iIndex));
            Info.ModeFFA = byte(mapData.getData("Map", "mode_ffa", iIndex));
            Info.ModeFFA_Max = int(mapData.getData("Map", "mode_ffa_max", iIndex));
            Info.ModeTDM = byte(mapData.getData("Map", "mode_tdm", iIndex));
            Info.ModeTDM_Max = int(mapData.getData("Map", "mode_tdm_max", iIndex));
            Info.ModeTDM_RandomRespawn = byte(mapData.getData("Map", "mode_tdm_randrespawn", iIndex));
            Info.ModeSD = byte(mapData.getData("Map", "mode_sd", iIndex));
            Info.ModeSD_Max = int(mapData.getData("Map", "mode_sd_max", iIndex));
            Info.ModeDOA = byte(mapData.getData("Map", "mode_doa", iIndex));
            Info.ModeDOA_Max = int(mapData.getData("Map", "mode_doa_max", iIndex));
            Info.ModeDomination = byte(mapData.getData("Map", "mode_domination", iIndex));
            Info.ModeDomination_Max = int(mapData.getData("Map", "mode_domination_max", iIndex));
            Info.ModeDOMI_RandomRespawn = byte(int(mapData.getData("Map", "mode_domination_randrespawn", iIndex)));
            Info.ModeSabotage = byte(mapData.getData("Map", "mode_sabotage", iIndex));
            Info.ModeSabotage_Max = int(mapData.getData("Map", "mode_sabotage_max", iIndex));
            Info.ModeBotTDM = byte(mapData.getData("Map", "mode_bot_tdm", iIndex));
            Info.ModeBotTDM_Max = int(mapData.getData("Map", "mode_bot_tdm_max", iIndex));
            Info.ModeBotDomination = byte(mapData.getData("Map", "mode_bot_domination", iIndex));
            Info.ModeBotDomination_Max = int(mapData.getData("Map", "mode_bot_domination_max", iIndex));
            Info.ModeBotFFA = byte(mapData.getData("Map", "mode_bot_ffa", iIndex));
            Info.ModeBotFFA_Max = int(mapData.getData("Map", "mode_bot_ffa_max", iIndex));
            Info.ModeBotBeginner = byte(mapData.getData("Map", "mode_bot_beginner", iIndex));
            Info.ModeBotBeginner_Max = int(mapData.getData("Map", "mode_bot_beginner_max", iIndex));
            Info.ModeDefence = byte(mapData.getData("Map", "mode_defence", iIndex));
            Info.ModeDefence_Max = int(mapData.getData("Map", "mode_defence_max", iIndex));
            Info.ModeInfection = byte(mapData.getData("Map", "mode_infection", iIndex));
            Info.ModeInfection_Max = int(mapData.getData("Map", "mode_infection_max", iIndex));
            Info.SubMode_All = byte(mapData.getData("Map", "submode_all", iIndex));
            Info.SubMode_Sniper = byte(mapData.getData("Map", "submode_sniper", iIndex));
            Info.SubMode_SniperX = byte(mapData.getData("Map", "submode_sniperx", iIndex));
            Info.SubMode_Rocket = byte(mapData.getData("Map", "submode_rocket", iIndex));
            Info.SubMode_Knife = byte(mapData.getData("Map", "submode_knife", iIndex));
            Info.SubMode_ShotGun = byte(mapData.getData("Map", "submode_shotgun", iIndex));
            Info.SubMode_MG = byte(mapData.getData("Map", "submode_mg", iIndex));
            Info.SubMode_Pistol = byte(mapData.getData("Map", "submode_pistol", iIndex));
            Info.SubMode_FlameThower = byte(mapData.getData("Map", "submode_flamethrower", iIndex));
            Info.SubMode_Grenade = byte(mapData.getData("Map", "submode_fraggrenade", iIndex));
            Info.ResourceLoadingImage = mapData.getData("Map", "resource_loading_image", iIndex);
            Info.ResourceMapImage = mapData.getData("Map", "resource_map_image", iIndex);
            Info.ResourceSupplyImages[0] = mapData.getData("Map", "resource_supply1_image", iIndex);
            Info.ResourceSupplyImages[1] = mapData.getData("Map", "resource_supply2_image", iIndex);
            Info.ResourceSupplyImages[2] = mapData.getData("Map", "resource_supply3_image", iIndex);
            Info.ResourceMiniMapInfoImage[0] = mapData.getData("Map", "minimapinfo_1", iIndex);
            Info.ResourceMiniMapInfoImage[1] = mapData.getData("Map", "minimapinfo_2", iIndex);
            Info.ResourceMiniMapInfoImage[2] = mapData.getData("Map", "minimapinfo_3", iIndex);
            Info.ResourceMiniMapInfoImage[3] = mapData.getData("Map", "minimapinfo_4", iIndex);
            Info.BGM1 = mapData.getData("Map", "bgm_1", iIndex);
            Info.BGM1_Times[0] = int(mapData.getData("Map", Locs("BGM_1_S_1"), iIndex));
            Info.BGM1_Times[1] = int(mapData.getData("Map", Locs("BGM_1_S_2"), iIndex));
            Info.BGM1_Times[2] = int(mapData.getData("Map", Locs("BGM_1_S_3"), iIndex));
            Info.BGM1_Times[3] = int(mapData.getData("Map", Locs("BGM_1_S_4"), iIndex));
            Info.BGM2 = mapData.getData("Map", "bgm_2", iIndex);
            Info.BGM2_Times[0] = int(mapData.getData("Map", Locs("BGM_2_S_1"), iIndex));
            Info.BGM2_Times[1] = int(mapData.getData("Map", Locs("BGM_2_S_2"), iIndex));
            Info.BGM2_Times[2] = int(mapData.getData("Map", Locs("BGM_2_S_3"), iIndex));
            Info.BGM2_Times[3] = int(mapData.getData("Map", Locs("BGM_2_S_4"), iIndex));
            // End:0xf93
            if(Info.MapID == 99999)
            {
                fValue = 99999.0;
            }
            // End:0xfaf
            else
            {
                MapInfos[MapInfos.Length] = Info;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x50;
            }
        }
    }
}

function LoadSupplyRandomTable()
{
    local BTNetGameData GameData;
    local bool bResult;
    local int iIndex;
    local float fValue;

    // End:0xbd
    if(SupplyRandomArray.Length == 0)
    {
        GameData = new class'BTNetGameData';
        bResult = GameData.LoadSupplyRandomTable();
        // End:0x3e
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x45:
        // End:0xbd [While If]
        if(1 != 0)
        {
            fValue = float(GameData.getData("SupplyRand", "rand_1", iIndex));
            // End:0xa1
            if(fValue == float(99999) || iIndex > 2000)
            {
            }
            // End:0xbd
            else
            {
                SupplyRandomArray[SupplyRandomArray.Length] = fValue;
                ++ iIndex;
                // This is an implied JumpToken; Continue!
                goto J0x45;
            }
        }
    }
}

function int GetLevel(int Exp)
{
    local int lp1;

    lp1 = 0;
    J0x07:
    // End:0x3c [While If]
    if(lp1 < LevelExps.Length)
    {
        // End:0x32
        if(Exp < LevelExps[lp1])
        {
            return lp1;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return LevelExps.Length - 1;
}

function int GetLevelByLevelMarkID(int LevelMarkID)
{
    local int Level;
    local wItemBaseParam ItemParam;

    ItemParam = GetItemParam(LevelMarkID);
    Level = int(ItemParam.strAddPartGroupID);
    return Level;
}

function string GetClanLevelImages(int Level)
{
    // End:0x12
    if(Level < 0)
    {
        Level = 0;
    }
    // End:0x31
    if(Level >= ClanLevelImages.Length)
    {
        Level = ClanLevelImages.Length - 1;
    }
    return ClanLevelImages[Level];
}

function FloatBox GetLevelImageCoordi(int Level, optional int LevelMarkID)
{
    local FloatBox Coordi;
    local int imgX, imgY;

    // End:0x1c
    if(LevelMarkID != 0)
    {
        Level = GetLevelByLevelMarkID(LevelMarkID);
    }
    imgY = Level - 1 / 16;
    imgX = int(float(Level - 1) % float(16));
    Coordi.X1 = 32.0 * float(imgX);
    Coordi.X2 = 32.0;
    Coordi.Y1 = 32.0 * float(imgY);
    Coordi.Y2 = 32.0;
    return Coordi;
}

function string GetLevelImageString(int Level, optional int LevelMarkID)
{
    local int idx;

    // End:0x1c
    if(LevelMarkID != 0)
    {
        Level = GetLevelByLevelMarkID(LevelMarkID);
    }
    idx = Level / 64;
    return LevelImages[idx];
}

simulated function I3DL2Listener GetEAXEffect(string strEffectClassName)
{
    local int i;
    local SEAXEffect sEffect;
    local class<I3DL2Listener> EffectClass;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < EAXEffectList.Length)
    {
        // End:0x42
        if(EAXEffectList[i].strClassName == strEffectClassName)
        {
            return EAXEffectList[i].EAXEffect;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    sEffect.strClassName = strEffectClassName;
    EffectClass = class<I3DL2Listener>(DynamicLoadObject("Engine." $ strEffectClassName, class'Class'));
    sEffect.EAXEffect = new EffectClass;
    EAXEffectList[EAXEffectList.Length] = sEffect;
    return sEffect.EAXEffect;
}

function bool CheckWeaponItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1e
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 5:
        // End:0x2d
        case 3:
        // End:0x32
        case 4:
        // End:0x39
        case 6:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool CheckMainWeaponItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1e
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 3:
        // End:0x2f
        case 4:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool CheckSubWeaponItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x1b
        case 5:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool CheckQuickSlotItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1e
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 5:
        // End:0x2d
        case 6:
        // End:0x32
        case 3:
        // End:0x37
        case 4:
        // End:0x3c
        case 8:
        // End:0x41
        case 9:
        // End:0x46
        case 10:
        // End:0x4b
        case 11:
        // End:0x50
        case 19:
        // End:0x57
        case 33:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool CheckMainQuickSlotItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1e
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 5:
        // End:0x2d
        case 6:
        // End:0x32
        case 3:
        // End:0x37
        case 4:
        // End:0x3e
        case 19:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool CheckEquipQuickSlotItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 8:
        // End:0x1e
        case 9:
        // End:0x23
        case 10:
        // End:0x28
        case 11:
        // End:0x2f
        case 33:
            return true;
        // End:0xffff
        default:
            return false;
    }
}

function bool CheckARItem(int iItemType)
{
    return byte(iItemType) == 0;
}

function bool CheckSMGItem(int iItemType)
{
    return byte(iItemType) == 1;
}

function bool CheckSRItem(int iItemType)
{
    return byte(iItemType) == 2;
}

function bool CheckSGItem(int iItemType)
{
    return byte(iItemType) == 3;
}

function bool CheckMGItem(int iItemType)
{
    return byte(iItemType) == 4;
}

function bool CheckPistolItem(int iItemType)
{
    return byte(iItemType) == 5;
}

function bool CheckSkillItem(int iItemType)
{
    return byte(iItemType) == 19;
}

function bool CheckItemBox(int iItemType)
{
    return byte(iItemType) == 30;
}

function bool CheckUseItem(int iItemType)
{
    return byte(iItemType) == 31;
}

function bool CheckRandBoxItem(int iItemType)
{
    return byte(iItemType) == 32;
}

function bool CheckLvMark(int iItemType)
{
    return byte(iItemType) == 33;
}

function bool CheckThrowingWeapon(int iItemType)
{
    return byte(iItemType) == 6;
}

function bool CheckHeadItem(int iItemType)
{
    return byte(iItemType) == 8;
}

function bool CheckFaceItem(int iItemType)
{
    return byte(iItemType) == 9;
}

function bool CheckAccessoryItem(int iItemType)
{
    return byte(iItemType) == 10;
}

function bool CheckSpCharItem(int iItemType)
{
    return byte(iItemType) == 11;
}

defaultproperties
{
    LevelExps=// Object reference not set to an instance of an object.
    
    LevelImages=// Object reference not set to an instance of an object.
    
    ClanLevelImages=// Object reference not set to an instance of an object.
    
    SupplyRandomArray=// Object reference not set to an instance of an object.
    
    bUseRagdoll=true
    bUseGore=true
    bUseMouseRevision=true
    bUseStanceToggle=true
    kWebzenShopVer_Year=-1
    kWebzenShopVer_YearID=-1
    kWebzenShopVer_SalesZoneCode=-1
}