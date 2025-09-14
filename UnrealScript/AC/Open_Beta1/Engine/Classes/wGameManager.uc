class wGameManager extends Object
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
    ITYPE_AR,                       // 0
    ITYPE_SMG,                      // 1
    ITYPE_SR,                       // 2
    ITYPE_SG,                       // 3
    ITYPE_MG,                       // 4
    ITYPE_Pistol,                   // 5
    ITYPE_TW,                       // 6
    ITYPE_Knife,                    // 7
    ITYPE_Head,                     // 8
    ITYPE_Face,                     // 9
    ITYPE_Accessory,                // 10
    ITYPE_SpChar,                   // 11
    ITYPE_Cash,                     // 12
    ITYPE_Body,                     // 13
    ITYPE_Backpack,                 // 14
    ITYPE_HW,                       // 15
    ITYPE_Bomb,                     // 16
    ITYPE_SPW,                      // 17
    ITYPE_Meele,                    // 18
    ITYPE_Skill,                    // 19
    ITYPE_Part_Sight,               // 20
    ITYPE_Part_Silencer,            // 21
    ITYPE_Part_Camo,                // 22
    ITYPE_Part_Paint,               // 23
    ITYPE_Part_Barrel,              // 24
    ITYPE_Part_Gunstock,            // 25
    ITYPE_Part_Scope,               // 26
    ITYPE_Supply,                   // 27
    ITYPE_Passive,                  // 28
    ITYPE_ETC,                      // 29
    ITYPE_ItemBox,                  // 30
    ITYPE_Use,                      // 31
    ITYPE_RandBox,                  // 32
    ITYPE_LVMark,                   // 33
    ITYPE_GOLD,                     // 34
    ITYPE_None                      // 35
};

enum EItemGrade
{
    IGRADE_Base,                    // 0
    IGRADE_Shop,                    // 1
    IGRADE_Common,                  // 2
    IGRADE_Normal,                  // 3
    IGRADE_High,                    // 4
    IGRADE_Rare,                    // 5
    IGRADE_Legend,                  // 6
    IGRADE_PC,                      // 7
    IGRADE_PCPLUS,                  // 8
    IGRADE_Map_Spon,                // 9
    IGRADE_Map_Lock,                // 10
    IGRADE_Skill,                   // 11
    IGRADE_Special,                 // 12
    IGRADE_Part,                    // 13
    IGRADE_Cash,                    // 14
    IGRADE_Supply,                  // 15
    IGRADE_War,                     // 16
    IGRADE_None                     // 17
};

enum EEquipSlot
{
    ESlot_Pistol,                   // 0
    ESlot_MainWeapon,               // 1
    ESlot_Special,                  // 2
    ESlot_Grenade,                  // 3
    ESlot_Meele,                    // 4
    ESlot_Body,                     // 5
    ESlot_Head,                     // 6
    ESlot_Face,                     // 7
    ESlot_Accessory,                // 8
    ESlot_Backpack,                 // 9
    ESlot_SpChar,                   // 10
    ESlot_Part_Sight,               // 11
    ESlot_Part_Silencer,            // 12
    ESlot_Part_Camo,                // 13
    ESlot_Part_Paint,               // 14
    ESlot_Skill,                    // 15
    ESlot_None                      // 16
};

enum ECastType
{
    CTYPE_Durability,               // 0
    CTYPE_Time,                     // 1
    CTYPE_DurabilityX,              // 2
    CTYPE_Number,                   // 3
    CTYPE_Time2,                    // 4
    CTYPE_None                      // 5
};

enum ESkillType
{
    STYPE_Normal,                   // 0
    STYPE_Clan,                     // 1
    STYPE_None                      // 2
};

enum ESkillActiveType
{
    SACT_Active,                    // 0
    SACT_Passive,                   // 1
    SACT_None                       // 2
};

enum EAlienModeType
{
    EAM_HUMAN,                      // 0
    EAM_HUMAN_HERO,                 // 1
    EAM_ALIEN,                      // 2
    EAM_ALIEN_HOST,                 // 3
    EAM_ALIEN_MASTER                // 4
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
//var delegate<UpdateServerTime> __UpdateServerTime__Delegate;
//var delegate<UpdateWebzenShopVerInfo> __UpdateWebzenShopVerInfo__Delegate;
//var delegate<UpdateWebzenShopItemList> __UpdateWebzenShopItemList__Delegate;
//var delegate<UpdateItemList> __UpdateItemList__Delegate;
//var delegate<UpdateWebzenItemList> __UpdateWebzenItemList__Delegate;
//var delegate<UpdateSkillBoxList> __UpdateSkillBoxList__Delegate;
//var delegate<UpdateQuickSlotBoxList> __UpdateQuickSlotBoxList__Delegate;
//var delegate<dele_UpdateEventTimer> __dele_UpdateEventTimer__Delegate;

function WebzenShopPackage GetWebzenShopPackage(int ProductSeq, int PriceSeq)
{
    local int i, j;

    Log((("[wGameManager::GetWebzenShopPackage] ProductSeq=" $ string(ProductSeq)) $ ", PriceSeq=") $ string(PriceSeq));
    i = 0;
    J0x5C:

    // End:0x1D0 [Loop If]
    if(i < kWZPackageList.Length)
    {
        j = 0;
        J0x73:

        // End:0x119 [Loop If]
        if(j < kWZPackageList[i].ProductList.Length)
        {
            // End:0x10F
            if((kWZPackageList[i].ProductList[j].ProductSeq != 0) && kWZPackageList[i].ProductList[j].ProductSeq == ProductSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].ProductList[j].ProductName);
                return kWZPackageList[i];
            }
            j++;
            // [Loop Continue]
            goto J0x73;
        }
        j = 0;
        J0x120:

        // End:0x1C6 [Loop If]
        if(j < kWZPackageList[i].PriceList.Length)
        {
            // End:0x1BC
            if((kWZPackageList[i].PriceList[j].PriceSeq != 0) && kWZPackageList[i].PriceList[j].PriceSeq == PriceSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].PriceList[j].ProductName);
                return kWZPackageList[i];
            }
            j++;
            // [Loop Continue]
            goto J0x120;
        }
        i++;
        // [Loop Continue]
        goto J0x5C;
    }
    //return;    
}

function WebzenShopProduct GetWebzenShopProduct(int ProductSeq, int PriceSeq)
{
    local int i, j;

    Log((("[wGameManager::GetWebzenShopProduct] ProductSeq=" $ string(ProductSeq)) $ ", PriceSeq=") $ string(PriceSeq));
    i = 0;
    J0x5C:

    // End:0x1E6 [Loop If]
    if(i < kWZPackageList.Length)
    {
        j = 0;
        J0x73:

        // End:0x124 [Loop If]
        if(j < kWZPackageList[i].ProductList.Length)
        {
            // End:0x11A
            if((kWZPackageList[i].ProductList[j].ProductSeq != 0) && kWZPackageList[i].ProductList[j].ProductSeq == ProductSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].ProductList[j].ProductName);
                return kWZPackageList[i].ProductList[j];
            }
            j++;
            // [Loop Continue]
            goto J0x73;
        }
        j = 0;
        J0x12B:

        // End:0x1DC [Loop If]
        if(j < kWZPackageList[i].PriceList.Length)
        {
            // End:0x1D2
            if((kWZPackageList[i].PriceList[j].PriceSeq != 0) && kWZPackageList[i].PriceList[j].PriceSeq == PriceSeq)
            {
                Log("ProductName=" $ kWZPackageList[i].PriceList[j].ProductName);
                return kWZPackageList[i].PriceList[j];
            }
            j++;
            // [Loop Continue]
            goto J0x12B;
        }
        i++;
        // [Loop Continue]
        goto J0x5C;
    }
    Log("GetWebzenShopProduct() failed!!!");
    //return;    
}

function WebzenShopPackage GetWebzenShopPackage2(int ItemID, out int iResult)
{
    local int i;

    Log("[wGameManager::GetWebzenShopProduct] ItemID=" $ string(ItemID));
    i = 0;
    J0x40:

    // End:0x87 [Loop If]
    if(i < kWZPackageList.Length)
    {
        // End:0x7D
        if(kWZPackageList[i].ItemID == ItemID)
        {
            iResult = 1;
            return kWZPackageList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x40;
    }
    Log("GetWebzenShopPackage() failed!!!");
    iResult = 0;
    //return;    
}

function GP20Product GetGP20ProductFromCode(int ProductCode, out int iResult)
{
    local int i;
    local GP20Product gp20P;

    iResult = 0;
    i = 0;
    J0x0E:

    // End:0x5C [Loop If]
    if(i < kGP20ProductList.Length)
    {
        // End:0x52
        if(int(kGP20ProductList[i].ProductCode) == ProductCode)
        {
            gp20P = kGP20ProductList[i];
            iResult = 1;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    return gp20P;
    //return;    
}

function int GetGP20ProductNo(int ProductCode, int ProductCost, byte SaleType)
{
    local int i, iResult, ProductNo;
    local GP20Product gp20P;

    ProductNo = -1;
    gp20P = GetGP20ProductFromCode(ProductCode, iResult);
    // End:0xA5
    if(iResult == 1)
    {
        i = 0;
        J0x33:

        // End:0xA5 [Loop If]
        if(i < gp20P.ProductCost.Length)
        {
            // End:0x9B
            if((gp20P.ProductCost[i] == ProductCost) && int(gp20P.SaleType[i]) == int(SaleType))
            {
                ProductNo = gp20P.ProductNo[i];
                // [Explicit Break]
                goto J0xA5;
            }
            i++;
            // [Loop Continue]
            goto J0x33;
        }
    }
    J0xA5:

    return ProductNo;
    //return;    
}

// Export UwGameManager::execDownloadWebzenShopItemList(FFrame&, void* const)
native function DownloadWebzenShopItemList(int Year, int YearId, int salescode)
{
    //native.Year;
    //native.YearId;
    //native.salescode;        
}

delegate UpdateServerTime(wGameManager GameMgr)
{
    //return;    
}

delegate UpdateWebzenShopVerInfo(wGameManager GameMgr)
{
    //return;    
}

delegate UpdateWebzenShopItemList(wGameManager GameMgr)
{
    //return;    
}

delegate UpdateItemList(wGameManager GameMgr)
{
    //return;    
}

delegate UpdateWebzenItemList(wGameManager GameMgr)
{
    //return;    
}

delegate UpdateSkillBoxList(wGameManager GameMgr)
{
    //return;    
}

delegate UpdateQuickSlotBoxList(wGameManager GameMgr)
{
    //return;    
}

function SetServerTime(BtrDouble S)
{
    local BtrDouble L;

    kServerTime = S;
    GetLocalTimeToBtrDouble(L);
    kDiffTime = BtrDoubleMinus(S, L);
    kClientTime = S;
    //return;    
}

function UpdateClientTime()
{
    local BtrTime t;

    GetLocalTimeToBtrTime(t);
    BtrTimeToBtrDouble(t, kClientTime);
    kClientMSec = t.Milliseconds;
    kClientTime = BtrDoublePlus(kClientTime, kDiffTime);
    //return;    
}

function BtrDouble GetClientTime(optional bool bUpdate)
{
    // End:0x0F
    if(bUpdate)
    {
        UpdateClientTime();
    }
    return kClientTime;
    //return;    
}

function AddEventTimerHMS(int EventType, int Hour, int Min, int sec, optional DelegateEventTimer EventDelegate, optional int msec)
{
    local BtrDouble CurBtrD, PlusBtrD, PlusBtrD2;
    local BtrTime PlusTime, PlusTime2;
    local int Day;

    CurBtrD = GetClientTime(true);
    Log((((((((((("HMS Set EventTime=" $ string(PlusTime.Year)) $ "-") $ string(PlusTime.Month)) $ "-") $ string(PlusTime.Day)) $ " ") $ string(PlusTime.Hour)) $ ":") $ string(PlusTime.Minute)) $ ":") $ string(PlusTime.Second));
    // End:0xC7
    if((msec + kClientMSec) >= 1000)
    {
        sec += 1;
        msec = (msec + kClientMSec) - 1000;
    }
    // End:0xF8
    if(sec >= 60)
    {
        Min += (sec / 60);
        sec = int(float(sec) % float(60));
    }
    // End:0x129
    if(Min >= 60)
    {
        Hour += (Min / 60);
        Min = int(float(Min) % float(60));
    }
    // End:0x15A
    if(Hour >= 24)
    {
        Day += (Hour / 24);
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
    Log((((((((((("HMS Set EventTime=" $ string(PlusTime.Year)) $ "-") $ string(PlusTime.Month)) $ "-") $ string(PlusTime.Day)) $ " ") $ string(PlusTime.Hour)) $ ":") $ string(PlusTime.Minute)) $ ":") $ string(PlusTime.Second));
    AddEventTimer(EventType, CurBtrD, EventDelegate, msec);
    //return;    
}

function ClearBlockedItem()
{
    kBlockedItemIdx.Length = 0;
    //return;    
}

function AddBlockedItem(BtrDouble D)
{
    local int i;

    kBlockedItemIdx.Length = kBlockedItemIdx.Length + 1;
    kBlockedItemIdx[kBlockedItemIdx.Length - 1] = D;
    i = 0;
    J0x2C:

    // End:0xDC [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0xD2
        if(__NFUN_912__(InstanceItemLists[i].UniqueID, D))
        {
            // End:0x8B
            if(InstanceItemLists[i].SlotPosition == 0)
            {
                FindFirstInstanceItemByItemID(2000).SlotPosition = 0;
            }
            // End:0xBB
            if(InstanceItemLists[i].SlotPosition == 1)
            {
                FindFirstInstanceItemByItemID(1010).SlotPosition = 1;
            }
            InstanceItemLists[i].SlotPosition = 13;
        }
        i++;
        // [Loop Continue]
        goto J0x2C;
    }
    RemoveQuickSlotItem(D);
    //return;    
}

function bool IsBlockedItemIdx(BtrDouble D)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x39 [Loop If]
    if(i < kBlockedItemIdx.Length)
    {
        // End:0x2F
        if(__NFUN_912__(kBlockedItemIdx[i], D))
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

function AddEventTimer(int EventType, BtrDouble EventTime, optional DelegateEventTimer EventDelegate, optional int EventMSec)
{
    local int i;

    bForceUpdateEventTimer = true;
    i = 0;
    J0x0F:

    // End:0xF9 [Loop If]
    if(i < kEventTimerList.Length)
    {
        // End:0xEF
        if(BtrDoubleLessEqual(EventTime, kEventTimerList[i].EventTime))
        {
            // End:0x77
            if(__NFUN_912__(EventTime, kEventTimerList[i].EventTime) && EventMSec > kEventTimerList[i].EventTimeAddMSec)
            {
                // [Explicit Continue]
                goto J0xEF;
            }
            kEventTimerList.Insert(i, 1);
            kEventTimerList[i].EventType = EventType;
            kEventTimerList[i].EventTime = EventTime;
            kEventTimerList[i].EventTimeAddMSec = EventMSec;
            kEventTimerList[i].EventDelegate = EventDelegate;
            kEventTimerList[i].EventCount = 1;
            return;
        }
        J0xEF:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    i = kEventTimerList.Length;
    kEventTimerList.Insert(i, 1);
    kEventTimerList[i].EventType = EventType;
    kEventTimerList[i].EventTime = EventTime;
    kEventTimerList[i].EventTimeAddMSec = EventMSec;
    kEventTimerList[i].EventDelegate = EventDelegate;
    kEventTimerList[i].EventCount = 1;
    //return;    
}

function AddEventTimerCount(int EventType)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x50 [Loop If]
    if(i < kEventTimerList.Length)
    {
        // End:0x46
        if(kEventTimerList[i].EventType == EventType)
        {
            kEventTimerList[i].EventCount++;
            // [Explicit Break]
            goto J0x50;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x50:

    //return;    
}

function RemoveEventTimer(int EventType)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4E [Loop If]
    if(i < kEventTimerList.Length)
    {
        // End:0x44
        if(kEventTimerList[i].EventType == EventType)
        {
            kEventTimerList.Remove(i, 1);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function BtrDouble GetLeftEventTime(int EventType)
{
    local int i;
    local BtrDouble curD;

    i = 0;
    J0x07:

    // End:0x6C [Loop If]
    if(i < kEventTimerList.Length)
    {
        // End:0x62
        if(kEventTimerList[i].EventType == EventType)
        {
            curD = GetClientTime(true);
            curD = BtrDoubleMinus(kEventTimerList[i].EventTime, curD);
            // [Explicit Break]
            goto J0x6C;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x6C:

    return curD;
    //return;    
}

function int GetEventTimerCount(int EventType)
{
    local int i, Count;

    i = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(i < kEventTimerList.Length)
    {
        // End:0x4A
        if(kEventTimerList[i].EventType == EventType)
        {
            Count = kEventTimerList[i].EventCount;
            // [Explicit Break]
            goto J0x54;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x54:

    return Count;
    //return;    
}

function LogEventTimerList(optional int AddItemIndex)
{
    local int i;
    local BtrTime t;

    Log("---------------------------------------");
    Log("[wGameManager::LogEventTimerList()]");
    i = 0;
    J0x59:

    // End:0x238 [Loop If]
    if(i < kEventTimerList.Length)
    {
        BtrDoubleToBtrTime(kEventTimerList[i].EventTime, t);
        // End:0x162
        if(i == AddItemIndex)
        {
            Log(((((((((((((((((("+" $ string(i)) $ " EventType=") $ string(kEventTimerList[i].EventType)) $ ", EventTime=") $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second)) $ "(") $ string(kEventTimerList[i].EventTimeAddMSec)) $ ")");
            // [Explicit Continue]
            goto J0x22E;
        }
        Log((((((((((((((((((" " $ string(i)) $ " EventType=") $ string(kEventTimerList[i].EventType)) $ ", EventTime=") $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second)) $ "(") $ string(kEventTimerList[i].EventTimeAddMSec)) $ ")");
        J0x22E:

        i++;
        // [Loop Continue]
        goto J0x59;
    }
    Log("---------------------------------------");
    //return;    
}

function UpdateEventTimer(BtrDouble st, optional int msec)
{
    local int i, TimeOverIndex;
    local BtrTime t;

    TimeOverIndex = -1;
    BtrDoubleToBtrTime(st, t);
    Log((((((((((((("[wGameManager::UpdateEventTimer] msec = " $ string(msec)) $ " kClientTime = ") $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
    i = 0;
    J0xD7:

    // End:0x285 [Loop If]
    if(i < kEventTimerList.Length)
    {
        // End:0x27B
        if(BtrDoubleLessEqual(kEventTimerList[i].EventTime, st))
        {
            // End:0x20D
            if(__NFUN_912__(kEventTimerList[i].EventTime, st) && kEventTimerList[i].EventTimeAddMSec > msec)
            {
                BtrDoubleToBtrTime(kEventTimerList[i].EventTime, t);
                Log((((((((((((("[wGameManager::UpdateEventTimer] kEventTimerList[" $ string(i)) $ "] = ") $ string(t.Year)) $ "-") $ string(t.Month)) $ "-") $ string(t.Day)) $ " ") $ string(t.Hour)) $ ":") $ string(t.Minute)) $ ":") $ string(t.Second));
                // [Explicit Continue]
                goto J0x27B;
            }
            dele_UpdateEventTimer(kEventTimerList[i].EventType, kEventTimerList[i].EventTime);
            // End:0x270
            if(kEventTimerList[i].EventDelegate != none)
            {
                kEventTimerList[i].EventDelegate.OnEventTimer(i);
            }
            TimeOverIndex = i;
        }
        J0x27B:

        i++;
        // [Loop Continue]
        goto J0xD7;
    }
    // End:0x2DC
    if((kEventTimerList.Length > 0) && TimeOverIndex >= 0)
    {
        Log(("kEventTimerList.Remove(0, " $ string(TimeOverIndex + 1)) $ ")");
        kEventTimerList.Remove(0, TimeOverIndex + 1);
    }
    //return;    
}

function BtrDouble NextEventTime(BtrDouble t)
{
    local BtrDouble ret, empty;

    empty = EmptyBtrDouble();
    ret = empty;
    // End:0x72
    if((kEventTimerList.Length > 0) && BtrDoubleLessEqual(t, kEventTimerList[0].EventTime))
    {
        ret = BtrDoubleMinus(kEventTimerList[0].EventTime, t);
        ret = BtrDoublePlus(ret, empty);
    }
    return ret;
    //return;    
}

delegate dele_UpdateEventTimer(int EventType, BtrDouble EventTime)
{
    //return;    
}

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
    else
    {
        return 0;
    }
    //return;    
}

function int GetEndExp(int Level)
{
    // End:0x29
    if(Level >= LevelInfoParams.Length)
    {
        return LevelInfoParams[LevelInfoParams.Length - 1].nAccumExp;
    }
    return LevelInfoParams[Level].nAccumExp;
    //return;    
}

function string GetLevelName(int Level)
{
    // End:0x20
    if((Level < 0) || Level >= LevelInfoParams.Length)
    {
        return "";
    }
    return LevelInfoParams[Level].sLevelName;
    //return;    
}

function GetLevelImage(int Level, int LevelMarkID, out Image LevelImage)
{
    local int idx, imgX, imgY;

    // End:0x12
    if(Level <= 0)
    {
        Level = 1;
    }
    // End:0x2E
    if(LevelMarkID != 0)
    {
        Level = GetLevelByLevelMarkID(LevelMarkID);
    }
    idx = (Level - 1) / 64;
    imgY = (Level - 1) / 16;
    imgX = int(float(Level - 1) % float(16));
    LevelImage.DrawColor = Class'Engine_Decompressed.Canvas'.static.MakeColor(byte(255), byte(255), byte(255), byte(255));
    LevelImage.Image = Texture(LevelTextures[idx]);
    LevelImage.X = 32.0000000 * float(imgX);
    LevelImage.Y = 32.0000000 * float(imgY);
    LevelImage.width = 32.0000000;
    LevelImage.Height = 32.0000000;
    //return;    
}

function Texture GetLevelTexture(int Level, optional int LevelMarkID)
{
    local int idx;

    // End:0x0D
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
    //return;    
}

function int GetClanStartExp(int Level)
{
    // End:0x11
    if(Level < 0)
    {
        return -1;
    }
    // End:0x3A
    if(Level > ClanLevelInfoParams.Length)
    {
        return ClanLevelInfoParams[ClanLevelInfoParams.Length - 1].nAccumExp;
    }
    // End:0x61
    if(Level >= 2)
    {
        return ClanLevelInfoParams[Level - 1].nAccumExp;        
    }
    else
    {
        return 0;
    }
    //return;    
}

function int GetClanEndExp(int Level)
{
    // End:0x11
    if(Level < 0)
    {
        return -1;
    }
    // End:0x3A
    if(Level >= ClanLevelInfoParams.Length)
    {
        return ClanLevelInfoParams[ClanLevelInfoParams.Length - 1].nAccumExp;
    }
    return ClanLevelInfoParams[Level].nAccumExp;
    //return;    
}

function string GetClanLevelName(int Level)
{
    // End:0x20
    if((Level < 0) || Level >= ClanLevelInfoParams.Length)
    {
        return "";
    }
    return ClanLevelInfoParams[Level].sLevelName;
    //return;    
}

function Texture GetClanLevelTexture(int Level)
{
    // End:0x1F
    if((Level < 0) || Level >= ClanLevelTextures.Length)
    {
        return none;
    }
    return Texture(ClanLevelTextures[Level]);
    //return;    
}

function Image GetClanLevelImage(int Level)
{
    return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(16, 16, 0, GetClanLevelTexture(Level));
    //return;    
}

function bool GetClanLevelMarkInfo(string ClanName, out int ClanPattern, out int ClanBG, out int ClanBL)
{
    local int lp1;

    // End:0x0E
    if(ClanName == "")
    {
        return false;
    }
    lp1 = cmm.FindClanMark(ClanName);
    // End:0xA2
    if(lp1 != -1)
    {
        ClanBG = cmm.ClanMarkList[lp1].BG;
        ClanBL = cmm.ClanMarkList[lp1].BL;
        ClanPattern = cmm.ClanMarkList[lp1].Pattern;
        return true;
    }
    return false;
    //return;    
}

function int IsExistShopItemList(int iItemID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3D [Loop If]
    if(i < self.ShopItemList.Length)
    {
        // End:0x33
        if(ShopItemList[i] == iItemID)
        {
            return 1;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return 0;
    //return;    
}

function int IsUsablePartItem(int iItemID, int iPartsArrayIndex)
{
    local wItemBaseParam ibp;
    local wWeaponCustomInfoParam wcip;
    local wWeaponCustomPartsParam wcpp;

    ibp = GetItemParam(iItemID);
    // End:0x41
    if((ibp.iItemID <= 0) && ibp.iItemID != iItemID)
    {
        return 0;
    }
    wcip = GetWeaponCustomInfoParam(iItemID);
    // End:0x82
    if((wcip.iItemID <= 0) || wcip.iItemID != iItemID)
    {
        return 0;
    }
    wcpp = WeaponCustomPartsParams[iPartsArrayIndex];
    // End:0xA9
    if(wcpp.iItemID == 0)
    {
        return 0;
    }
    // End:0x103
    if((int(wcpp.eType) == int(26)) || int(wcpp.eType) == int(20))
    {
        // End:0x100
        if(wcpp.strAddPartGroupID != wcip.strAddPartSightGroupID)
        {
            return 0;
        }        
    }
    else
    {
        // End:0x142
        if(int(wcpp.eType) == int(24))
        {
            // End:0x13F
            if(wcpp.strAddPartGroupID != wcip.strAddPartBarrelGroupID)
            {
                return 0;
            }            
        }
        else
        {
            // End:0x181
            if(int(wcpp.eType) == int(21))
            {
                // End:0x17E
                if(wcpp.strAddPartGroupID != wcip.strAddPartSilencerGroupID)
                {
                    return 0;
                }                
            }
            else
            {
                // End:0x1C0
                if(int(wcpp.eType) == int(25))
                {
                    // End:0x1BD
                    if(wcpp.strAddPartGroupID != wcip.strAddPartGunstockGroupID)
                    {
                        return 0;
                    }                    
                }
                else
                {
                    return 0;
                }
            }
        }
    }
    // End:0x235
    if(((((wcpp.bUsableAR == false) && wcpp.bUsableSMG == false) && wcpp.bUsableSR == false) && wcpp.bUsablePS == false) && wcpp.bUsableSG == false)
    {
        return 0;
    }
    // End:0x267
    if((wcpp.bUsableAR == false) && int(ibp.eType) == int(0))
    {
        return 0;
    }
    // End:0x299
    if((wcpp.bUsableSMG == false) && int(ibp.eType) == int(1))
    {
        return 0;
    }
    // End:0x2CB
    if((wcpp.bUsableSR == false) && int(ibp.eType) == int(2))
    {
        return 0;
    }
    // End:0x2FD
    if((wcpp.bUsablePS == false) && int(ibp.eType) == int(5))
    {
        return 0;
    }
    // End:0x32F
    if((wcpp.bUsableSG == false) && int(ibp.eType) == int(3))
    {
        return 0;
    }
    // End:0x39D
    if((wcip.bCustomSight == false) && (int(wcpp.eType) == int(20)) || int(wcpp.eType) == int(26))
    {
        // End:0x39D
        if(wcip.iDefaultSightUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    // End:0x3F0
    if((wcip.bCustomBarrel == false) && int(wcpp.eType) == int(24))
    {
        // End:0x3F0
        if(wcip.iDefaultBarrelUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    // End:0x443
    if((wcip.bCustomSilencer == false) && int(wcpp.eType) == int(21))
    {
        // End:0x443
        if(wcip.iDefaultSilencerUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    // End:0x496
    if((wcip.bCustomGunstock == false) && int(wcpp.eType) == int(25))
    {
        // End:0x496
        if(wcip.iDefaultGunstockUniID != wcpp.iPartID)
        {
            return 0;
        }
    }
    return 1;
    //return;    
}

function int IsEnableRemovePart(wItemBaseParam Inip, wGameManager.EItemType InType)
{
    local wWeaponCustomInfoParam wcip;

    wcip = GetWeaponCustomInfoParam(Inip.iItemID);
    // End:0x85
    if((int(InType) == int(20)) || int(InType) == int(26))
    {
        // End:0x57
        if(int(Inip.eType) == int(2))
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
    else
    {
        // End:0xC9
        if(int(InType) == int(24))
        {
            // End:0xC6
            if((wcip.bCustomBarrel == false) && wcip.iDefaultBarrelUniID > (1 << 10))
            {
                return 0;
            }            
        }
        else
        {
            // End:0x10D
            if(int(InType) == int(21))
            {
                // End:0x10A
                if((wcip.bCustomSilencer == false) && wcip.iDefaultSilencerUniID > (1 << 17))
                {
                    return 0;
                }                
            }
            else
            {
                // End:0x14E
                if(int(InType) == int(25))
                {
                    // End:0x14E
                    if((wcip.bCustomGunstock == false) && wcip.iDefaultGunstockUniID > (1 << 24))
                    {
                        return 0;
                    }
                }
            }
        }
    }
    return 1;
    //return;    
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

    SP = new Class'Engine_Decompressed.wGameManagerScriptPart';
    SP.ClanMarkImg32.Length = ClanMarkParams.Length;
    SP.ClanMarkImg128.Length = ClanMarkParams.Length;
    i = 0;
    J0x42:

    // End:0xF8 [Loop If]
    if(i < ClanMarkParams.Length)
    {
        SP.ClanMarkImg32[i] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 28, Material(DynamicLoadObject(ClanMarkParams[i].sClanMark_Resource_32, Class'Engine_Decompressed.Material')));
        SP.ClanMarkImg128[i] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(128, 128, 28, Material(DynamicLoadObject(ClanMarkParams[i].sClanMark_Resource_128, Class'Engine_Decompressed.Material')));
        i++;
        // [Loop Continue]
        goto J0x42;
    }
    lp1 = 0;
    J0xFF:

    // End:0x165D [Loop If]
    if(lp1 < ItemParams.Length)
    {
        ItemID = ItemParams[lp1].iItemID;
        cItemParam = GetItemParam(ItemID);
        cItemResParam = GetItemResourceParam(ItemID);
        // End:0x1653
        if((cItemParam.iItemID != -1) && cItemResParam.iItemResourceID != -1)
        {
            itemBox = new Class'Engine_Decompressed.wItemBoxHK';
            itemBox.ItemID = cItemParam.iItemID;
            itemBox.ItemType = int(cItemParam.eType);
            itemBox.ItemName = cItemParam.strDisplayName;
            itemBox.ItemDescription = cItemParam.strDescription;
            // End:0x381
            if(((((int(cItemParam.eType) == int(20)) || int(cItemParam.eType) == int(21)) || int(cItemParam.eType) == int(26)) || int(cItemParam.eType) == int(24)) || int(cItemParam.eType) == int(25))
            {
                wcpp = GetWeaponCustomPartsParamByItemID(cItemParam.iItemID);
                // End:0x33B
                if((wcpp.iItemID > 0) && wcpp.iItemID == cItemParam.iItemID)
                {
                    itemBox.ItemName = wcpp.strDisplayName;
                    // End:0x338
                    if(wcpp.strPartImageName != "-")
                    {
                        itemBox.ItemImage = Texture(DynamicLoadObject(wcpp.strPartImageName, Class'Engine_Decompressed.Texture'));
                    }                    
                }
                else
                {
                    // End:0x37E
                    if(cItemResParam.strRes_Icon != "-")
                    {
                        itemBox.ItemImage = Texture(DynamicLoadObject(cItemResParam.strRes_Icon, Class'Engine_Decompressed.Texture'));
                    }
                }                
            }
            else
            {
                // End:0x39D
                if(int(cItemParam.eType) == int(23))
                {                    
                }
                else
                {
                    // End:0x3E0
                    if(cItemResParam.strRes_Icon != "-")
                    {
                        itemBox.ItemImage = Texture(DynamicLoadObject(cItemResParam.strRes_Icon, Class'Engine_Decompressed.Texture'));
                    }
                }
            }
            itemBox.ResourceID = cItemParam.iResourceID;
            itemBox.ShopDisplayOrder = cItemParam.iShopDisplayOrder;
            itemBox.InvenDisplayOrder = cItemParam.iInvenDisplayOrder;
            itemBox.Grade = int(cItemParam.eGrade);
            itemBox.EquipLevel = cItemParam.iEquipLevel;
            itemBox.EquipTeam = cItemParam.iEquipTeam;
            itemBox.EquipSlot = int(cItemParam.EEquipSlot);
            wcip = GetWeaponCustomInfoParam(ItemID);
            // End:0xE47
            if((wcip.iItemID > 0) && ItemID == wcip.iItemID)
            {
                // End:0x55C
                if((((wcip.bCustomSight == true) || wcip.bCustomSilencer == true) || wcip.bCustomBarrel == true) || wcip.bCustomGunstock == true)
                {
                    itemBox.bParts = true;                    
                }
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
                // End:0x9E3
                if(WeaponCustomPartsParams.Length > 0)
                {
                    // End:0x705
                    if((IsEnableRemovePart(cItemParam, 20)) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[0];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x6FE
                        if((wcpp.strPartImageName != "-") && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, Class'Engine_Decompressed.Texture'));
                        }
                        pgcount++;
                    }
                    // End:0x7F9
                    if((IsEnableRemovePart(cItemParam, 24)) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[1];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x7F2
                        if((wcpp.strPartImageName != "-") && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, Class'Engine_Decompressed.Texture'));
                        }
                        pgcount++;
                    }
                    // End:0x8EE
                    if((IsEnableRemovePart(cItemParam, 21)) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[2];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x8E7
                        if((wcpp.strPartImageName != "-") && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, Class'Engine_Decompressed.Texture'));
                        }
                        pgcount++;
                    }
                    // End:0x9E3
                    if((IsEnableRemovePart(cItemParam, 25)) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[3];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0x9DC
                        if((wcpp.strPartImageName != "-") && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, Class'Engine_Decompressed.Texture'));
                        }
                        pgcount++;
                    }
                }
                i = 0;
                J0x9EA:

                // End:0xE35 [Loop If]
                if(i < WeaponCustomPartsParams.Length)
                {
                    // End:0xE2B
                    if((IsUsablePartItem(wcip.iItemID, i)) > 0)
                    {
                        wcpp = WeaponCustomPartsParams[i];
                        itemBox.PartAllList.Length = pgcount + 1;
                        itemBox.PartAllList[pgcount].ItemID = wcpp.iItemID;
                        itemBox.PartAllList[pgcount].PartID = wcpp.iPartID;
                        itemBox.PartAllList[pgcount].Name = wcpp.strDisplayName;
                        // End:0xB1F
                        if((wcpp.strPartImageName != "-") && wcpp.strPartImageName != "")
                        {
                            itemBox.PartAllList[pgcount].PartImage = Texture(DynamicLoadObject(wcpp.strPartImageName, Class'Engine_Decompressed.Texture'));
                        }
                        cPartResParam = GetItemResourceParam(wcpp.iItemID);
                        // End:0xB9E
                        if((cPartResParam.strRes_Icon != "-") && cPartResParam.strRes_Icon != "")
                        {
                            itemBox.PartAllList[pgcount].PartIconImage = Texture(DynamicLoadObject(cPartResParam.strRes_Icon, Class'Engine_Decompressed.Texture'));
                        }
                        itemBox.PartAllList[pgcount].SkillID = wcpp.iSkillID;
                        // End:0xC6C
                        if(wcpp.iSkillID != 0)
                        {
                            itemBox.PartAllList[pgcount].SkillImage = Texture(DynamicLoadObject("Warfare_GP_UI_UI.Store.icon_rem_skil", Class'Engine_Decompressed.Texture'));
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
                        pgcount++;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x9EA;
                }
                itemBox.SortPartList();                
            }
            else
            {
                itemBox.bParts = false;
                itemBox.PartGroupID = "";
            }
            // End:0xEFE
            if(((((itemBox.Grade > 1) && itemBox.Grade != 7) && itemBox.Grade != 8) || cItemParam.strPaintingGroupID == "") || wcip.bCustomPainting == false)
            {
                itemBox.bPaints = false;
                itemBox.PaintGroupID = "";                
            }
            else
            {
                itemBox.bPaints = true;
                itemBox.PaintGroupID = cItemParam.strPaintingGroupID;
                pgcount = 0;
                i = 0;
                J0xF3A:

                // End:0x1169 [Loop If]
                if(i < PaintGroupParams.Length)
                {
                    // End:0x115F
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
                            // End:0x111A
                            if(PaintGroupParams[i].PaintingItemID > 0)
                            {
                                itemBox.PaintGroupList[pgcount].UI_Icon_Box = Texture(DynamicLoadObject(pntgp.strUI_Icon, Class'Engine_Decompressed.Texture'));
                            }
                            itemBox.PaintGroupList[pgcount].UI_Icon = Texture(DynamicLoadObject(pntgp.strUI_Icon $ "_n", Class'Engine_Decompressed.Texture'));
                        }
                        pgcount++;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0xF3A;
                }
            }
            itemBox.AdType = cItemParam.iAdType;
            itemBox.bBuyShop = cItemParam.bSell;
            itemBox.bSellShop = cItemParam.bSell;
            itemBox.bOverlap = cItemParam.bOverlap;
            itemBox.bSellAuction = cItemParam.bAuction;
            itemBox.AuctionMaxPrice = cItemParam.iAuctionMaxPrice;
            itemBox.AuctionMinPrice = cItemParam.iAuctionMinPrice;
            itemBox.CostType = int(cItemParam.ECastType);
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
            else
            {
                itemBox.PurchaseType = 0;
            }
            itemBox.start_ammo = cItemParam.start_ammo;
            itemBox.clip_size = cItemParam.clip_size;
            itemBox.ui_damage = int(cItemParam.ui_damage);
            itemBox.ui_spread = int(cItemParam.ui_spread);
            itemBox.ui_view_kick = int(cItemParam.ui_view_kick);
            itemBox.ui_rate_of_fire = int(cItemParam.ui_rate_of_fire);
            itemBox.ui_move = int(cItemParam.ui_move);
            itemBox.ui_range = int(cItemParam.ui_range);
            // End:0x1626
            if(int(cItemParam.eType) == int(19))
            {
                itemBox.bSkill = true;
                i = 0;
                J0x15BA:

                // End:0x1623 [Loop If]
                if(i < SkillParams.Length)
                {
                    // End:0x1619
                    if(SkillParams[i].iSkillID == itemBox.ItemID)
                    {
                        itemBox.SkillUseType = int(SkillParams[i].eActiveType);
                        // [Explicit Break]
                        goto J0x1623;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x15BA;
                }
                J0x1623:
                
            }
            else
            {
                itemBox.bSkill = false;
            }
            itemBox.bRepair = true;
            AddUIItem(itemBox);
        }
        lp1++;
        // [Loop Continue]
        goto J0xFF;
    }
    //return;    
}

function ClearSkillBoxList()
{
    SkillBoxList.Length = 0;
    //return;    
}

function wSkillBoxHK FindSkillBox(int UniqueSkillID)
{
    local int i;

    // End:0x0D
    if(UniqueSkillID == 0)
    {
        return none;
    }
    i = 0;
    J0x14:

    // End:0x58 [Loop If]
    if(i < SkillBoxList.Length)
    {
        // End:0x4E
        if(SkillBoxList[i].UniqueSkillID == UniqueSkillID)
        {
            return SkillBoxList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

function wSkillBoxHK FindSkillBoxBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4D [Loop If]
    if(i < SkillBoxList.Length)
    {
        // End:0x43
        if(int(SkillBoxList[i].SlotPos) == SlotPos)
        {
            return SkillBoxList[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
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
    // End:0x6B
    if(SkillBox != none)
    {
        SkillBox.SlotPos = byte(SlotPos);
    }
    //return;    
}

function bool AddUISkillBox(byte SlotPos, int SkillID, int UniqueSkillID, BtrDouble UntilTime)
{
    local wSkillBoxHK SkillBox;

    SkillBox = new Class'Engine_Decompressed.wSkillBoxHK';
    SkillBox.SlotPos = SlotPos;
    SkillBox.SkillID = SkillID;
    SkillBox.UniqueSkillID = UniqueSkillID;
    SkillBox.UntilTime = UntilTime;
    SkillBoxList.Length = SkillBoxList.Length + 1;
    SkillBoxList[SkillBoxList.Length - 1] = SkillBox;
    return true;
    //return;    
}

function bool RemoveQuickSlotBoxItem(BtrDouble UniqueID)
{
    local int i, j;
    local bool bRemovedItem;

    i = 0;
    J0x07:

    // End:0xA8 [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x1E:

        // End:0x9E [Loop If]
        if(j < 4)
        {
            // End:0x94
            if(__NFUN_912__(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                QuickSlotBoxList[i].ItemID[j] = 0;
                QuickSlotBoxList[i].UniqueID[j] = EmptyBtrDouble();
                bRemovedItem = true;
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return bRemovedItem;
    //return;    
}

function bool IsQuickSlotBoxItem(BtrDouble UniqueID)
{
    local int i, j;

    // End:0x13
    if(__NFUN_912__(UniqueID, EmptyBtrDouble()))
    {
        return false;
    }
    i = 0;
    J0x1A:

    // End:0x78 [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x31:

        // End:0x6E [Loop If]
        if(j < 4)
        {
            // End:0x64
            if(__NFUN_912__(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                return true;
            }
            j++;
            // [Loop Continue]
            goto J0x31;
        }
        i++;
        // [Loop Continue]
        goto J0x1A;
    }
    return false;
    //return;    
}

function int GetQuickSlotIndexOfBoxItem(BtrDouble UniqueID)
{
    local int i, j;

    // End:0x17
    if(__NFUN_912__(UniqueID, EmptyBtrDouble()))
    {
        return -1;
    }
    i = 0;
    J0x1E:

    // End:0x80 [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x35:

        // End:0x76 [Loop If]
        if(j < 4)
        {
            // End:0x6C
            if(__NFUN_912__(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                return i;
            }
            j++;
            // [Loop Continue]
            goto J0x35;
        }
        i++;
        // [Loop Continue]
        goto J0x1E;
    }
    return -1;
    //return;    
}

function ReplaceQuickSlotBoxItem(BtrDouble OldUniqueID, int ItemID, BtrDouble NewUniqueID)
{
    local int i, j;

    // End:0x13
    if(__NFUN_912__(NewUniqueID, EmptyBtrDouble()))
    {
        return;
    }
    i = 0;
    J0x1A:

    // End:0xBC [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x31:

        // End:0xB2 [Loop If]
        if(j < 4)
        {
            // End:0xA8
            if(__NFUN_912__(QuickSlotBoxList[i].UniqueID[j], OldUniqueID) && QuickSlotBoxList[i].ItemID[j] == ItemID)
            {
                QuickSlotBoxList[i].UniqueID[j] = NewUniqueID;
            }
            j++;
            // [Loop Continue]
            goto J0x31;
        }
        i++;
        // [Loop Continue]
        goto J0x1A;
    }
    //return;    
}

function bool IsQuickSlotBoxSkillItem(int UniqueSkillID)
{
    local int i, j;

    // End:0x0D
    if(UniqueSkillID == 0)
    {
        return false;
    }
    i = 0;
    J0x14:

    // End:0x71 [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x2B:

        // End:0x67 [Loop If]
        if(j < 4)
        {
            // End:0x5D
            if(QuickSlotBoxList[i].UniqueSkillID[j] == UniqueSkillID)
            {
                return true;
            }
            j++;
            // [Loop Continue]
            goto J0x2B;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return false;
    //return;    
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

    // End:0x98 [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x2F:

        // End:0x8E [Loop If]
        if(j < 4)
        {
            // End:0x84
            if(QuickSlotBoxList[i].UniqueSkillID[j] == UniqueSkillID)
            {
                QuickSlotIdx.Length = QuickSlotIdx.Length + 1;
                QuickSlotIdx[QuickSlotIdx.Length - 1] = i;
            }
            j++;
            // [Loop Continue]
            goto J0x2F;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return QuickSlotIdx;
    //return;    
}

function bool RemoveQuickSlotBoxSkillItem(int UniqueID)
{
    local int i, j;
    local bool bRemovedItem;

    i = 0;
    J0x07:

    // End:0xA2 [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x1E:

        // End:0x98 [Loop If]
        if(j < 4)
        {
            // End:0x8E
            if(QuickSlotBoxList[i].UniqueSkillID[j] == UniqueID)
            {
                QuickSlotBoxList[i].SkillID[j] = 0;
                QuickSlotBoxList[i].UniqueSkillID[j] = 0;
                bRemovedItem = true;
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return bRemovedItem;
    //return;    
}

function ReplaceQuickSkillSlotItem(int SkillID, int UniqueSkillID)
{
    local int i, j;

    // End:0x0D
    if(SkillID == 0)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0x8F [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x2B:

        // End:0x85 [Loop If]
        if(j < 4)
        {
            // End:0x7B
            if(QuickSlotBoxList[i].SkillID[j] == SkillID)
            {
                QuickSlotBoxList[i].UniqueSkillID[j] = UniqueSkillID;
            }
            j++;
            // [Loop Continue]
            goto J0x2B;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function ClearQuickSlotBoxList()
{
    QuickSlotBoxList.Length = 0;
    //return;    
}

function AllocateQuickSlotBoxList(int Len)
{
    local int i;
    local wQuickSlotBoxHK qsbox;

    i = 0;
    J0x07:

    // End:0x68 [Loop If]
    if(i < Len)
    {
        qsbox = new Class'Engine_Decompressed.wQuickSlotBoxHK';
        qsbox.QuickSlotID = i;
        QuickSlotBoxList.Length = QuickSlotBoxList.Length + 1;
        QuickSlotBoxList[QuickSlotBoxList.Length - 1] = qsbox;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    //return;    
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
    //return;    
}

function RemoveQuickSlotItem(BtrDouble UniqueID)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0xA9 [Loop If]
    if(i < QuickSlotBoxList.Length)
    {
        j = 0;
        J0x1E:

        // End:0x9F [Loop If]
        if(j < 4)
        {
            // End:0x95
            if(__NFUN_912__(QuickSlotBoxList[i].UniqueID[j], UniqueID))
            {
                QuickSlotBoxList[i].ItemID[j] = 0;
                QuickSlotBoxList[i].UniqueID[j] = Class'Engine_Decompressed.BTCustomDrawHK'.static.EmptyBtrDouble();
            }
            j++;
            // [Loop Continue]
            goto J0x1E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    //return;    
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
    //return;    
}

function bool CompareLE_UIShowItemLists(wItemBoxHK L, wItemBoxHK R)
{
    // End:0x23
    if(L.ItemID <= R.ItemID)
    {
        return true;
    }
    return false;
    //return;    
}

function bool AddUIItem(wItemBoxHK Item)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5C [Loop If]
    if(i < UIShowItemLists.Length)
    {
        // End:0x52
        if((CompareLE_UIShowItemLists(UIShowItemLists[i], Item)) == false)
        {
            UIShowItemLists.Insert(i, 1);
            UIShowItemLists[i] = Item;
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    UIShowItemLists.Length = UIShowItemLists.Length + 1;
    UIShowItemLists[i] = Item;
    return true;
    //return;    
}

function wItemBoxHK FindUIItem(int ItemID)
{
    local int i;

    // End:0x0D
    if(ItemID < 0)
    {
        return none;
    }
    i = 0;
    J0x14:

    // End:0x6C [Loop If]
    if(i < UIShowItemLists.Length)
    {
        // End:0x38
        if(UIShowItemLists[i] == none)
        {
            // [Explicit Break]
            goto J0x6C;
        }
        // End:0x62
        if(UIShowItemLists[i].ItemID == ItemID)
        {
            return UIShowItemLists[i];
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    J0x6C:

    return none;
    //return;    
}

function int FindUIItemReturnIndex(int ItemID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x59 [Loop If]
    if(i < UIShowItemLists.Length)
    {
        // End:0x2B
        if(UIShowItemLists[i] == none)
        {
            // [Explicit Break]
            goto J0x59;
        }
        // End:0x4F
        if(UIShowItemLists[i].ItemID == ItemID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x59:

    return -1;
    //return;    
}

function bool AddInstanceSkillItemFromSkillBoxList()
{
    local int i;
    local wItemBoxInstanceHK instanceInfo;

    i = 0;
    J0x07:

    // End:0x8B [Loop If]
    if(i < SkillBoxList.Length)
    {
        instanceInfo = AddInstanceItemByParameter(SkillBoxList[i].SkillID, EmptyBtrDouble(), SkillBoxList[i].UniqueSkillID, int(SkillBoxList[i].SlotPos), 1, 0, 0, 0, 0, 0, SkillBoxList[i].UntilTime);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return true;
    //return;    
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
    else
    {
        instanceInfo = self.FindInstanceSkillItem(UniqueSkillID);
        bIsSkill = true;
    }
    // End:0x183
    if(instanceInfo == none)
    {
        Log((((((((((("[wGameManager::AddInstanceItemByParameter] New!!!  ItemID=" $ string(ItemID)) $ ", SlotPos=") $ string(SlotPos)) $ ", PartID=") $ string(PartID)) $ ", StackCount=") $ string(StackCount)) $ ", UntilTime=") $ __NFUN_918__(UntilTime)) $ "bStackAdd=") $ string(bStackAdd));
        // End:0x138
        if(bIsSkill == true)
        {
            AddUISkillBox(byte(SlotPos), ItemID, UniqueSkillID, UntilTime);
        }
        instanceInfo = new Class'Engine_Decompressed.wItemBoxInstanceHK';
        InstanceItemLists.Length = InstanceItemLists.Length + 1;
        InstanceItemLists[InstanceItemLists.Length - 1] = instanceInfo;
        instanceInfo.SlotPosition = SlotPos;        
    }
    else
    {
        Log((((((((((("[wGameManager::AddInstanceItemByParameter] Exist!!!  ItemID=" $ string(ItemID)) $ ", SlotPos=") $ string(SlotPos)) $ ", PartID=") $ string(PartID)) $ ", StackCount=") $ string(StackCount)) $ ", UntilTime=") $ __NFUN_918__(UntilTime)) $ "bStackAdd=") $ string(bStackAdd));
    }
    instanceInfo.ItemID = ItemID;
    instanceInfo.UniqueID = UniqueID;
    instanceInfo.UniqueSkillID = UniqueSkillID;
    instanceInfo.UntilTime = UntilTime;
    instanceInfo.PartID = PartID;
    instanceInfo.PaintID = PaintID;
    // End:0x2CF
    if(StackCount == 0)
    {
        StackCount = 1;
    }
    // End:0x2F0
    if(bStackAdd)
    {
        instanceInfo.OverlapCount += StackCount;        
    }
    else
    {
        instanceInfo.OverlapCount = StackCount;
    }
    instanceInfo.Durability = Durability;
    instanceInfo.DamageDegree = DamageDegree;
    instanceInfo.UntilTime = UntilTime;
    // End:0x390
    if(__NFUN_913__(UntilTime, EmptyBtrDouble()))
    {
        BtrDoubleToBtrTime(UntilTime, t);
        BtrDoubleToBtrTime(kClientTime, tServer);
        instanceInfo.LeftTime = BtrTimeSubstract(t, tServer);
    }
    instanceInfo.ItemState = ItemState;
    instanceInfo.TradeCount = TradeCount;
    return instanceInfo;
    //return;    
}

function bool AddCashItem(out wItemBoxHK ItemInfo, out wItemBoxInstanceHK instanceInfo, string strEndDate)
{
    local int j;
    local GP20Product gp20P;

    gp20P = GetGP20ProductFromCode(ItemInfo.ItemID, j);
    // End:0x69
    if(j == 1)
    {
        instanceInfo.CashItemInfo = new Class'Engine_Decompressed.wItemBoxCashHK';
        instanceInfo.CashItemInfo.SetCashItemInfo(ItemInfo, gp20P, strEndDate);
    }
    return j == 1;
    //return;    
}

function bool AddInstanceItem(wItemBoxInstanceHK Item)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0x32
    if(__NFUN_912__(Item.UniqueID, EmptyBtrDouble()) && Item.UniqueSkillID == 0)
    {
        return false;
    }
    // End:0x63
    if(Item.UniqueSkillID == 0)
    {
        instanceInfo = FindInstanceItem(Item.UniqueID);        
    }
    else
    {
        instanceInfo = self.FindInstanceSkillItem(Item.UniqueSkillID);
    }
    // End:0xC1
    if(instanceInfo == none)
    {
        instanceInfo = new Class'Engine_Decompressed.wItemBoxInstanceHK';
        InstanceItemLists.Length = InstanceItemLists.Length + 1;
        InstanceItemLists[InstanceItemLists.Length - 1] = instanceInfo;
    }
    instanceInfo = Item;
    return false;
    //return;    
}

function ChangeInstance_ItemLeftTime(BtrDouble CurrentTime)
{
    local int i;
    local BtrTime t, t2;
    local wItemBoxHK ItemInfo;

    BtrDoubleToBtrTime(CurrentTime, t2);
    i = 0;
    J0x17:

    // End:0xC0 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        ItemInfo = FindUIItem(InstanceItemLists[i].ItemID);
        // End:0xB6
        if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
        {
            BtrDoubleToBtrTime(InstanceItemLists[i].UntilTime, t);
            InstanceItemLists[i].LeftTime = BtrTimeSubstract(t, t2);
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function bool ChangeInstance_DefaultWeapon(int SlotPos)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0xC1
    if(SlotPos == 0)
    {
        instanceInfo = FindFirstInstanceItemByItemID(2000);
        Log(((("[wGameManager::ChangeInstance_DefaultWeapon] ChangeDefaultWeapon(G3 2000) ItemID = " $ string(instanceInfo.ItemID)) $ " Dur = (") $ string(instanceInfo.Durability)) $ ")");
        // End:0xBE
        if(instanceInfo.SlotPosition == 0)
        {
            return true;
        }        
    }
    else
    {
        // End:0x185
        if(SlotPos == 1)
        {
            instanceInfo = FindFirstInstanceItemByItemID(1010);
            Log(((("[wGameManager::ChangeInstance_DefaultWeapon] ChangeDefaultWeapon(Glock 1010) ItemID = " $ string(instanceInfo.ItemID)) $ " Dur = (") $ string(instanceInfo.Durability)) $ ")");
            // End:0x182
            if(instanceInfo.SlotPosition == 1)
            {
                return true;
            }            
        }
        else
        {
            return false;
        }
    }
    ChangeInstance_ItemSlotPos(instanceInfo.UniqueID, SlotPos);
    return true;
    //return;    
}

function bool ChangeInstance_ItemDurability(BtrDouble UniqueID, int dur)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = FindInstanceItem(UniqueID);
    // End:0xB3
    if(instanceInfo != none)
    {
        Log(((((("[wGameManager::ChangeInstance_ItemDurability] ItemID = " $ string(instanceInfo.ItemID)) $ " Dur = (") $ string(instanceInfo.Durability)) $ " => ") $ string(dur)) $ ")");
        instanceInfo.Durability = dur;
        return true;
    }
    return false;
    //return;    
}

function bool ChangeInstance_ItemDamageDegree(BtrDouble UniqueID, int dd)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = FindInstanceItem(UniqueID);
    // End:0xB5
    if(instanceInfo != none)
    {
        Log(((((("[wGameManager::ChangeInstance_ItemDamageDegree] ItemID = " $ string(instanceInfo.ItemID)) $ " Dur = (") $ string(instanceInfo.DamageDegree)) $ " => ") $ string(dd)) $ ")");
        instanceInfo.DamageDegree = dd;
        return true;
    }
    return false;
    //return;    
}

function bool ChangeInstance_ItemReduceDurability(BtrDouble UniqueID, int dur)
{
    local wItemBoxInstanceHK instanceInfo;

    instanceInfo = FindInstanceItem(UniqueID);
    // End:0xCA
    if(instanceInfo != none)
    {
        Log(((((("[wGameManager::ChangeInstance_ItemReduceDurability] ItemID = " $ string(instanceInfo.ItemID)) $ " Dur = (") $ string(instanceInfo.Durability)) $ " => ") $ string(instanceInfo.Durability - dur)) $ ")");
        instanceInfo.Durability -= dur;
        return true;
    }
    return false;
    //return;    
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
    //return;    
}

function bool ChangeInstance_ItemSlotPos(BtrDouble UniqueID, int SlotPos)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0xDD
    if(SlotPos != 13)
    {
        instanceInfo = FindInstanceItemBySlotPos(SlotPos);
        // End:0xDD
        if(instanceInfo != none)
        {
            Log(((((("[wGameManager::ChangeInstance_ItemSlotPos] PrevSlotItem ItemID = " $ string(instanceInfo.ItemID)) $ " SlotPos = (") $ string(instanceInfo.SlotPosition)) $ " => 13 ) Dur = (") $ string(instanceInfo.Durability)) $ ")");
            instanceInfo.SlotPosition = 13;
        }
    }
    instanceInfo = FindInstanceItem(UniqueID);
    // End:0x1BD
    if(instanceInfo != none)
    {
        Log(((((((("[wGameManager::ChangeInstance_ItemSlotPos] CurSlotItem ItemID = " $ string(instanceInfo.ItemID)) $ " SlotPos = (") $ string(instanceInfo.SlotPosition)) $ " => ") $ string(SlotPos)) $ " ) Dur = (") $ string(instanceInfo.Durability)) $ ")");
        instanceInfo.SlotPosition = SlotPos;
        return true;
    }
    return false;
    //return;    
}

function ChangeInstance_SkillSlotPos(int SkillUniqueID, int SlotPos)
{
    local wItemBoxInstanceHK instanceInfo;

    // End:0x54
    if(SlotPos != 13)
    {
        instanceInfo = FindInstanceItemBySlotPos(SlotPos);
        // End:0x3C
        if(instanceInfo != none)
        {
            instanceInfo.SlotPosition = 13;            
        }
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
    //return;    
}

function wItemBoxInstanceHK FindInstanceItem(BtrDouble UniqueID)
{
    local int i;

    // End:0x13
    if(__NFUN_912__(UniqueID, EmptyBtrDouble()))
    {
        return none;
    }
    i = 0;
    J0x1A:

    // End:0x73 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x3E
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x69;
        }
        // End:0x69
        if(__NFUN_912__(InstanceItemLists[i].UniqueID, UniqueID))
        {
            return InstanceItemLists[i];
        }
        J0x69:

        i++;
        // [Loop Continue]
        goto J0x1A;
    }
    return none;
    //return;    
}

function wItemBoxInstanceHK FindInstanceItemSameWeapon(int ItemID, int PartID)
{
    local int i;
    local wItemBoxHK ItemInfo;

    ItemInfo = FindUIItem(ItemID);
    // End:0x4D
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
    J0x6B:

    // End:0xC3 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x8F
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0xB9;
        }
        // End:0xB9
        if(InstanceItemLists[i].ItemID == ItemID)
        {
            return InstanceItemLists[i];
        }
        J0xB9:

        i++;
        // [Loop Continue]
        goto J0x6B;
    }
    return none;
    //return;    
}

function wItemBoxInstanceHK FindInstanceSkillItem(int UniqueID)
{
    local int i;

    // End:0x0D
    if(UniqueID == 0)
    {
        return none;
    }
    i = 0;
    J0x14:

    // End:0x6C [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x38
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x62;
        }
        // End:0x62
        if(InstanceItemLists[i].UniqueSkillID == UniqueID)
        {
            return InstanceItemLists[i];
        }
        J0x62:

        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

function wItemBoxInstanceHK FindFirstInstanceItemByItemID(int ItemID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5F [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2B
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x55;
        }
        // End:0x55
        if(InstanceItemLists[i].ItemID == ItemID)
        {
            return InstanceItemLists[i];
        }
        J0x55:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function int FindInstanceSkillItemReturnIndex(int UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x59 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2B
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x4F;
        }
        // End:0x4F
        if(InstanceItemLists[i].UniqueSkillID == UniqueID)
        {
            return i;
        }
        J0x4F:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool RemoveInstanceItem(BtrDouble UniqueID)
{
    local int Index;

    Index = FindInstanceItemReturnIndex(UniqueID);
    // End:0x1E
    if(Index < 0)
    {
        return false;
    }
    InstanceItemLists.Remove(Index, 1);
    return true;
    //return;    
}

function bool RemoveInstanceItemByUniqueSkillID(int UniqueSkillID)
{
    local int Index;

    Index = FindInstanceItemReturnIndexByUniqueSkillID(UniqueSkillID);
    // End:0x1E
    if(Index < 0)
    {
        return false;
    }
    InstanceItemLists.Remove(Index, 1);
    return true;
    //return;    
}

function int FindInstanceItemReturnIndex(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x5A [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2B
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x50;
        }
        // End:0x50
        if(__NFUN_912__(InstanceItemLists[i].UniqueID, UniqueID))
        {
            return i;
        }
        J0x50:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int FindInstanceItemReturnIndexByUniqueSkillID(int UniqueSkillID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x59 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2B
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x4F;
        }
        // End:0x4F
        if(InstanceItemLists[i].UniqueSkillID == UniqueSkillID)
        {
            return i;
        }
        J0x4F:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function wItemBoxInstanceHK FindInstanceItemBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7B [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2B
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x71;
        }
        // End:0x71
        if((InstanceItemLists[i].ItemID != 0) && InstanceItemLists[i].SlotPosition == SlotPos)
        {
            return InstanceItemLists[i];
        }
        J0x71:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function int FindInstanceItemIDBySlotPos(int SlotPos)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x84 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x2B
        if(InstanceItemLists[i] == none)
        {
            // [Explicit Continue]
            goto J0x7A;
        }
        // End:0x7A
        if((InstanceItemLists[i].ItemID != 0) && InstanceItemLists[i].SlotPosition == SlotPos)
        {
            return InstanceItemLists[i].ItemID;
        }
        J0x7A:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function ClearInstanceItem()
{
    InstanceItemLists.Length = 0;
    //return;    
}

function int GetMainWeaponID()
{
    return 2000;
    //return;    
}

function int GetSubWeaponID()
{
    return 1010;
    //return;    
}

function BtrDouble GetMainWeaponUniqueID()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x55 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x4B
        if(InstanceItemLists[i].ItemID == (GetMainWeaponID()))
        {
            return InstanceItemLists[i].UniqueID;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return EmptyBtrDouble();
    //return;    
}

function BtrDouble GetSubWeaponUniqueID()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x55 [Loop If]
    if(i < InstanceItemLists.Length)
    {
        // End:0x4B
        if(InstanceItemLists[i].ItemID == (GetSubWeaponID()))
        {
            return InstanceItemLists[i].UniqueID;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return EmptyBtrDouble();
    //return;    
}

// Export UwGameManager::execSetItemIndex(FFrame&, void* const)
native function SetItemIndex(int iItemIndex, int iArrayIndex)
{
    //native.iItemIndex;
    //native.iArrayIndex;        
}

// Export UwGameManager::execGetItemArrayIndex(FFrame&, void* const)
native function int GetItemArrayIndex(int iItemIndex)
{
    //native.iItemIndex;        
}

// Export UwGameManager::execSetSkillIndex(FFrame&, void* const)
native function SetSkillIndex(int iSkillIndex, int iArrayIndex)
{
    //native.iSkillIndex;
    //native.iArrayIndex;        
}

// Export UwGameManager::execGetSkillArrayIndex(FFrame&, void* const)
native function int GetSkillArrayIndex(int iSkillIndex)
{
    //native.iSkillIndex;        
}

// Export UwGameManager::execSetPartsGroupIndex(FFrame&, void* const)
native function SetPartsGroupIndex(int iPartsGroupIndex, int iArrayIndex)
{
    //native.iPartsGroupIndex;
    //native.iArrayIndex;        
}

// Export UwGameManager::execGetPartsGroupArrayIndex(FFrame&, void* const)
native function int GetPartsGroupArrayIndex(int iPartsGroupIndex)
{
    //native.iPartsGroupIndex;        
}

// Export UwGameManager::execSetWeaponCustomInfoIndex(FFrame&, void* const)
native function SetWeaponCustomInfoIndex(int iItemIndex, int iArrayIndex)
{
    //native.iItemIndex;
    //native.iArrayIndex;        
}

// Export UwGameManager::execGetWeaponCustomInfoIndex(FFrame&, void* const)
native function int GetWeaponCustomInfoIndex(int iItemIndex)
{
    //native.iItemIndex;        
}

// Export UwGameManager::execSetWeaponCustomPartsIndex(FFrame&, void* const)
native function SetWeaponCustomPartsIndex(int iUnionedPartID, int iArrayIndex)
{
    //native.iUnionedPartID;
    //native.iArrayIndex;        
}

// Export UwGameManager::execGetWeaponCustomPartsIndex(FFrame&, void* const)
native function int GetWeaponCustomPartsIndex(int iUnionedPartID)
{
    //native.iUnionedPartID;        
}

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
    //return;    
}

function wWeaponCustomPartsParam GetWeaponCustomPartsParamByItemID(int iInItemID)
{
    local int iTemp;

    iTemp = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(iTemp < WeaponCustomPartsParams.Length)
    {
        // End:0x41
        if(WeaponCustomPartsParams[iTemp].iItemID == iInItemID)
        {
            return WeaponCustomPartsParams[iTemp];
        }
        iTemp++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function wWeaponCustomPartsParam GetWeaponCustomPartsParamByUnionedPartID(int iInUnionedPartID)
{
    return WeaponCustomPartsParams[GetWeaponCustomPartsIndex(iInUnionedPartID)];
    //return;    
}

function wWeaponCustomInfoParam GetWeaponCustomInfoParam(int iInItemID)
{
    return WeaponCustomInfoParams[GetWeaponCustomInfoIndex(iInItemID)];
    //return;    
}

function LoadWeaponCustomInfoParameters()
{
    local BTNetExcelData excel;
    local int iIndex;
    local bool bResult;
    local wWeaponCustomInfoParam wci;
    local string strData;
    local wWeaponCustomPartsParam wcpp;

    // End:0x0E
    if(WeaponCustomInfoParams.Length > 0)
    {
        return;
    }
    excel = new Class'BTData.BTNetExcelData';
    bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Weapon_CustomInfo", 2, 1, 1);
    // End:0x82
    if(!bResult)
    {
        return;
    }
    iIndex = 0;
    J0x89:

    // End:0xC66 [Loop If]
    if(true)
    {
        strData = excel.getData("Weapon_CustomInfo", "item_id", iIndex);
        // End:0xD7
        if(strData == "99999")
        {
            // [Explicit Break]
            goto J0xC66;
        }
        wci = new Class'Engine_Decompressed.wWeaponCustomInfoParam';
        wci.iItemID = int(strData);
        strData = excel.getData("Weapon_CustomInfo", "display_name", iIndex);
        // End:0x158
        if(strData != "-")
        {
            wci.strDisplayName = strData;
        }
        strData = excel.getData("Weapon_CustomInfo", "addpart_sightgroup_id", iIndex);
        // End:0x1BD
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
        // End:0x28B
        if(strData != "-")
        {
            wci.strAddPartSilencerGroupID = strData;
        }
        strData = excel.getData("Weapon_CustomInfo", "addpart_gunstockgroup_id", iIndex);
        // End:0x2F3
        if(strData != "-")
        {
            wci.strAddPartGunstockGroupID = strData;
        }
        strData = excel.getData("Weapon_CustomInfo", "usable_sight", iIndex);
        // End:0x34C
        if(strData == "1")
        {
            wci.bCustomSight = true;
        }
        strData = excel.getData("Weapon_CustomInfo", "usable_silencer", iIndex);
        // End:0x3A8
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
        // End:0x45E
        if(strData == "1")
        {
            wci.bCustomGunstock = true;
        }
        strData = excel.getData("Weapon_CustomInfo", "usable_painting", iIndex);
        // End:0x4BA
        if(strData == "1")
        {
            wci.bCustomPainting = true;
        }
        strData = excel.getData("Weapon_CustomInfo", "default_sight", iIndex);
        wci.iDefaultSightUniID = int(strData);
        // End:0x55A
        if(wci.iDefaultSightUniID > 0)
        {
            wcpp = GetWeaponCustomPartsParamByItemID(wci.iDefaultSightUniID);
            wci.iDefaultSightUniID = wcpp.iPartID;            
        }
        else
        {
            wci.iDefaultSightUniID = 1;
        }
        strData = excel.getData("Weapon_CustomInfo", "default_silencer", iIndex);
        wci.iDefaultSilencerUniID = int(strData);
        // End:0x60D
        if(wci.iDefaultSilencerUniID > 0)
        {
            wcpp = GetWeaponCustomPartsParamByItemID(wci.iDefaultSilencerUniID);
            wci.iDefaultSilencerUniID = wcpp.iPartID;            
        }
        else
        {
            wci.iDefaultSilencerUniID = 1 << 17;
        }
        strData = excel.getData("Weapon_CustomInfo", "default_barrel", iIndex);
        wci.iDefaultBarrelUniID = int(strData);
        // End:0x6C2
        if(wci.iDefaultBarrelUniID > 0)
        {
            wcpp = GetWeaponCustomPartsParamByItemID(wci.iDefaultBarrelUniID);
            wci.iDefaultBarrelUniID = wcpp.iPartID;            
        }
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
        iIndex++;
        // [Loop Continue]
        goto J0x89;
    }
    J0xC66:

    //return;    
}

function LoadWeaponCustomPartsParameters()
{
    local BTNetExcelData excel;
    local int iIndex, iBit, iUnionedPartID;
    local bool bResult;
    local wWeaponCustomPartsParam wcp;
    local string strData;

    // End:0x0E
    if(WeaponCustomPartsParams.Length > 0)
    {
        return;
    }
    excel = new Class'BTData.BTNetExcelData';
    bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Weapon_Parts", 2, 1, 1);
    // End:0x7D
    if(!bResult)
    {
        return;
    }
    iIndex = 0;
    J0x84:

    // End:0xAC0 [Loop If]
    if(true)
    {
        iBit = -1;
        iUnionedPartID = 0;
        strData = excel.getData("Weapon_Parts", "item_id", iIndex);
        // End:0xDF
        if(strData == "99999")
        {
            // [Explicit Break]
            goto J0xAC0;
        }
        wcp = new Class'Engine_Decompressed.wWeaponCustomPartsParam';
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
            // End:0x1C0
            case "Part_Scope":
                wcp.eType = 26;
                iBit = 0;
                // End:0x231
                break;
            // End:0x1EC
            case "Part_Barrel":
                wcp.eType = 24;
                iBit = 10;
                // End:0x231
                break;
            // End:0x21A
            case "Part_Gunstock":
                wcp.eType = 25;
                iBit = 24;
                // End:0x231
                break;
            // End:0xFFFF
            default:
                wcp.eType = 35;
                // End:0x231
                break;
                break;
        }
        strData = excel.getData("Weapon_Parts", "part_id", iIndex);
        wcp.iPartID = int(strData);
        strData = excel.getData("Weapon_Parts", "display_name", iIndex);
        // End:0x2CF
        if(strData != "-")
        {
            wcp.strDisplayName = strData;
        }
        strData = excel.getData("Weapon_Parts", "addpart_group_id", iIndex);
        // End:0x32A
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
        // End:0x3E0
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
        // End:0x4D4
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
        // End:0x5C8
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
        // End:0x85B
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
        iIndex++;
        // [Loop Continue]
        goto J0x84;
    }
    J0xAC0:

    //return;    
}

event InitHK()
{
    LoadLevelTextures();
    LoadUILists();
    cmm = new Class'Engine_Decompressed.ClanMarkManager';
    cmm.Init(self);
    FlagModify = 1 << 1;
    FlagDurability = 1 << 2;
    FlagRenew = 1 << 3;
    FlagCash = 1 << 4;
    FlagPCBang = 1 << 5;
    FlagSellShop = 1 << 6;
    FlagBuyShop = 1 << 7;
    //return;    
}

event InitPrecacheItems()
{
    self.PrecacheItemResources(none);
    //return;    
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

    // End:0x68 [Loop If]
    if(i < LevelTextures.Length)
    {
        LevelTextures[i] = Material(DynamicLoadObject(LevelImages[i], Class'Engine_Decompressed.Material'));
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    ClanLevelTextures.Length = ClanLevelImages.Length;
    i = 1;
    J0x7C:

    // End:0xBD [Loop If]
    if(i < ClanLevelTextures.Length)
    {
        ClanLevelTextures[i] = Material(DynamicLoadObject(GetClanLevelImages(i), Class'Engine_Decompressed.Material'));
        i++;
        // [Loop Continue]
        goto J0x7C;
    }
    //return;    
}

function LoadNPCSpawn()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strGrade, strType, strID;
    local wNPCSpawnParam Param;

    // End:0x18A
    if(NPCSpawnParams.Length == 0)
    {
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "NPC_Spon", 2, 1, 1);
        // End:0x77
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x7E:

        // End:0x18A [Loop If]
        if(true)
        {
            strGrade = excel.getData("NPC_Spon", "npc_grade", iIndex);
            strType = excel.getData("NPC_Spon", "npc_type", iIndex);
            strID = excel.getData("NPC_Spon", "npc_id", iIndex);
            // End:0x11F
            if(strGrade == "99999")
            {
                // [Explicit Break]
                goto J0x18A;
            }
            Param = new Class'Engine_Decompressed.wNPCSpawnParam';
            Param.Grade = int(strGrade);
            Param.Type = strType;
            Param.NPCID = int(strID);
            NPCSpawnParams[NPCSpawnParams.Length] = Param;
            iIndex++;
            // [Loop Continue]
            goto J0x7E;
        }
    }
    J0x18A:

    //return;    
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

    // End:0xD8F
    if(NPCParams.Length == 0)
    {
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "NPC", 2, 1, 1);
        // End:0x72
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x79:

        // End:0xD8F [Loop If]
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
                // [Explicit Break]
                goto J0xD8F;
            }
            Param = new Class'Engine_Decompressed.wNPCParam';
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
            iIndex++;
            // [Loop Continue]
            goto J0x79;
        }
    }
    J0xD8F:

    //return;    
}

function LoadNPCNameGroup()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strGroupID, strNickname;
    local wNPCNameGroupParam Param;

    // End:0x14D
    if(NPCNameGroupParams.Length == 0)
    {
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Name_Group", 2, 1, 1);
        // End:0x79
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x80:

        // End:0x14D [Loop If]
        if(true)
        {
            strGroupID = excel.getData("Name_Group", "name_groupid", iIndex);
            strNickname = excel.getData("Name_Group", "name", iIndex);
            // End:0xF8
            if(strGroupID == "99999")
            {
                // [Explicit Break]
                goto J0x14D;
            }
            Param = new Class'Engine_Decompressed.wNPCNameGroupParam';
            Param.GroupID = int(strGroupID);
            Param.NickName = strNickname;
            NPCNameGroupParams[NPCNameGroupParams.Length] = Param;
            iIndex++;
            // [Loop Continue]
            goto J0x80;
        }
    }
    J0x14D:

    //return;    
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
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Item_Group", 2, 1, 1);
        // End:0x79
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x80:

        // End:0x198 [Loop If]
        if(true)
        {
            strGroupID = excel.getData("Item_Group", "item_groupid", iIndex);
            strItemID = excel.getData("Item_Group", "item_id", iIndex);
            strPartsID = excel.getData("Item_Group", "parts_id", iIndex);
            // End:0x12B
            if(strGroupID == "99999")
            {
                // [Explicit Break]
                goto J0x198;
            }
            Param = new Class'Engine_Decompressed.wNPCItemGroupParam';
            Param.GroupID = int(strGroupID);
            Param.ItemID = int(strItemID);
            Param.PartsID = int(strPartsID);
            NPCItemGroupParams[NPCItemGroupParams.Length] = Param;
            iIndex++;
            // [Loop Continue]
            goto J0x80;
        }
    }
    J0x198:

    //return;    
}

function LoadNPCActionGroup()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string strActionGroupID, strActionID;
    local wNPCActionGroupParam Param;

    // End:0x15A
    if(NPCActionGroupParams.Length == 0)
    {
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Action_Group", 2, 1, 1);
        // End:0x7B
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x82:

        // End:0x15A [Loop If]
        if(true)
        {
            strActionGroupID = excel.getData("Action_Group", "action_groupid", iIndex);
            strActionID = excel.getData("Action_Group", "action_id", iIndex);
            // End:0x105
            if(strActionGroupID == "99999")
            {
                // [Explicit Break]
                goto J0x15A;
            }
            Param = new Class'Engine_Decompressed.wNPCActionGroupParam';
            Param.ActionGroupID = int(strActionGroupID);
            Param.ActionID = strActionID;
            NPCActionGroupParams[NPCActionGroupParams.Length] = Param;
            iIndex++;
            // [Loop Continue]
            goto J0x82;
        }
    }
    J0x15A:

    //return;    
}

function SetLevelDefenceGameParam(int iLevel, array<wDefenceGameParam> params)
{
    switch(iLevel)
    {
        // End:0x19
        case 0:
            DefenceGameParamsEasy = params;
            // End:0x5F
            break;
        // End:0x2B
        case 1:
            DefenceGameParamsNormal = params;
            // End:0x5F
            break;
        // End:0x3E
        case 2:
            DefenceGameParamsHard = params;
            // End:0x5F
            break;
        // End:0x51
        case 3:
            DefenceGameParamsVeryHard = params;
            // End:0x5F
            break;
        // End:0xFFFF
        default:
            DefenceGameParamsEasy = params;
            break;
    }
    //return;    
}

function GetLevelDefenceGameParam(int iLevel, out array<wDefenceGameParam> params)
{
    switch(iLevel)
    {
        // End:0x19
        case 0:
            params = DefenceGameParamsEasy;
            // End:0x5F
            break;
        // End:0x2B
        case 1:
            params = DefenceGameParamsNormal;
            // End:0x5F
            break;
        // End:0x3E
        case 2:
            params = DefenceGameParamsHard;
            // End:0x5F
            break;
        // End:0x51
        case 3:
            params = DefenceGameParamsVeryHard;
            // End:0x5F
            break;
        // End:0xFFFF
        default:
            params = DefenceGameParamsEasy;
            break;
    }
    //return;    
}

function LoadClanMarkParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(ClanMarkParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadClanMarkParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddClanMarkParams(GameData);
    //return;    
}

function LoadDefenceGameInfo()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex, i, j, iLevel, MapID;

    local array<wDefenceGameParam> params;
    local wDefenceGameParam Param;

    // End:0x3E4
    if(DefenceGameParamsEasy.Length == 0)
    {
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "Mode_Defence", 2, 1, 1);
        // End:0x7B
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        iLevel = 0;
        J0x89:

        // End:0x287 [Loop If]
        if(true)
        {
            MapID = int(excel.getData("Mode_Defence", "map_id", iIndex));
            // End:0xD1
            if(MapID == 99999)
            {
                // [Explicit Break]
                goto J0x287;
            }
            Param = new Class'Engine_Decompressed.wDefenceGameParam';
            Param.nMapID = MapID;
            Param.nRound = byte(excel.getData("Mode_Defence", "round", iIndex));
            Param.nDelayTime = int(excel.getData("Mode_Defence", "delay_time", iIndex));
            Param.nRegenLoc = byte(excel.getData("Mode_Defence", "regen_loc", iIndex));
            Param.nGrade = int(excel.getData("Mode_Defence", "npc_spon", iIndex));
            Param.nUnit = byte(excel.getData("Mode_Defence", "unit", iIndex));
            Param.nLevel = 0;
            // End:0x26B
            if(iLevel != int(Param.nLevel))
            {
                SetLevelDefenceGameParam(iLevel, params);
                ++iLevel;
                params.Length = 0;
            }
            params[params.Length] = Param;
            ++iIndex;
            // [Loop Continue]
            goto J0x89;
        }
        J0x287:

        SetLevelDefenceGameParam(iLevel, params);
        iLevel = 0;
        J0x29E:

        // End:0x3E4 [Loop If]
        if(i < 4)
        {
            GetLevelDefenceGameParam(iLevel, params);
            // End:0x2C9
            if(params.Length <= 1)
            {
                // [Explicit Continue]
                goto J0x3DA;
            }
            i = 0;
            J0x2D0:

            // End:0x3DA [Loop If]
            if(i < params.Length)
            {
                j = i + 1;
                J0x2EE:

                // End:0x3D0 [Loop If]
                if(j < params.Length)
                {
                    // End:0x3C6
                    if(((params[i].nMapID == params[j].nMapID) && int(params[i].nRound) == int(params[j].nRound)) && params[i].nDelayTime > params[j].nDelayTime)
                    {
                        Param = params[i];
                        params[i] = params[j];
                        params[j] = Param;
                    }
                    ++j;
                    // [Loop Continue]
                    goto J0x2EE;
                }
                ++i;
                // [Loop Continue]
                goto J0x2D0;
            }
            J0x3DA:

            ++iLevel;
            // [Loop Continue]
            goto J0x29E;
        }
    }
    //return;    
}

function GetDefenceGamePrams2(int Level, int MapID, int Round, out array<int> DelayTime, out array<int> RegenLoc, out array<int> Grade, out array<int> Unit)
{
    local int i;
    local array<wDefenceGameParam> params;

    GetLevelDefenceGameParam(Level, params);
    i = 0;
    J0x17:

    // End:0xF9 [Loop If]
    if(i < params.Length)
    {
        // End:0xEF
        if((params[i].nMapID == MapID) && int(params[i].nRound) == Round)
        {
            DelayTime[DelayTime.Length] = params[i].nDelayTime;
            RegenLoc[RegenLoc.Length] = int(params[i].nRegenLoc);
            Grade[Grade.Length] = params[i].nGrade;
            Unit[Unit.Length] = int(params[i].nUnit);
        }
        ++i;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function GetDefenceGameBotGradeList2(int Level, int MapID, int Round, out array<int> GradeList)
{
    local int i, j;
    local bool bFind;
    local array<wDefenceGameParam> params;

    GetLevelDefenceGameParam(Level, params);
    i = 0;
    J0x17:

    // End:0xF6 [Loop If]
    if(i < params.Length)
    {
        // End:0xEC
        if((params[i].nMapID == MapID) && int(params[i].nRound) == Round)
        {
            bFind = false;
            j = 0;
            J0x76:

            // End:0xBF [Loop If]
            if(j < GradeList.Length)
            {
                // End:0xB5
                if(params[i].nGrade == GradeList[j])
                {
                    bFind = true;
                    // [Explicit Break]
                    goto J0xBF;
                }
                ++j;
                // [Loop Continue]
                goto J0x76;
            }
            J0xBF:

            // End:0xEC
            if(bFind == false)
            {
                GradeList[GradeList.Length] = params[i].nGrade;
            }
        }
        ++i;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function int GetDefenceGameRoundCount2(int Level, int MapID)
{
    local int i, RoundNum;
    local array<wDefenceGameParam> params;

    GetLevelDefenceGameParam(Level, params);
    i = 0;
    J0x17:

    // End:0x72 [Loop If]
    if(i < params.Length)
    {
        // End:0x68
        if(params[i].nMapID == MapID)
        {
            RoundNum = Max(int(params[i].nRound), RoundNum);
        }
        ++i;
        // [Loop Continue]
        goto J0x17;
    }
    return RoundNum;
    //return;    
}

function LoadAlienGameInfo()
{
    //return;    
}

function LoadBadwords()
{
    local BTNetExcelData excel;
    local bool bResult;
    local int iIndex;
    local string S;

    // End:0xDF
    if(BadWords.Length == 0)
    {
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "BadWords", 2, 1, 1);
        // End:0x77
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x7E:

        // End:0xDF [Loop If]
        if(true)
        {
            S = excel.getData("BadWords", "badword", iIndex);
            // End:0xC3
            if(S == "99999")
            {
                // [Explicit Break]
                goto J0xDF;
            }
            BadWords[BadWords.Length] = S;
            iIndex++;
            // [Loop Continue]
            goto J0x7E;
        }
    }
    J0xDF:

    // End:0x1BF
    if(BadNicks.Length == 0)
    {
        excel = new Class'BTData.BTNetExcelData';
        bResult = excel.LoadExcelData("../../ExcelData/Parameters/Params_GP.xlsx", "BadNicks", 2, 1, 1);
        // End:0x156
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x15D:

        // End:0x1BF [Loop If]
        if(true)
        {
            S = excel.getData("BadNicks", "badnicks", iIndex);
            // End:0x1A3
            if(S == "99999")
            {
                // [Explicit Break]
                goto J0x1BF;
            }
            BadNicks[BadNicks.Length] = S;
            iIndex++;
            // [Loop Continue]
            goto J0x15D;
        }
    }
    J0x1BF:

    //return;    
}

function bool ContainsBadWords(string S, out string badword)
{
    local int lp1;

    S = Caps(S);
    lp1 = 0;
    J0x14:

    // End:0x5F [Loop If]
    if(lp1 < BadWords.Length)
    {
        // End:0x55
        if(InStr(S, Caps(BadWords[lp1])) != -1)
        {
            badword = BadWords[lp1];
            return true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x14;
    }
    return false;
    //return;    
}

function bool FilterBadWords(out string S)
{
    local int idx, lp1, badlen;
    local string capped, Repl;
    local bool bRet;

    capped = Caps(S);
    lp1 = 0;
    J0x14:

    // End:0xD9 [Loop If]
    if(lp1 < BadWords.Length)
    {
        J0x24:

        idx = InStr(capped, Caps(BadWords[lp1]));
        // End:0xC0
        if(idx != -1)
        {
            badlen = Len(BadWords[lp1]);
            Repl = "*^^*";
            S = (Left(S, idx) $ Repl) $ Right(S, (Len(S) - idx) - Len(BadWords[lp1]));
            capped = Caps(S);
            bRet = true;
        }
        // End:0x24
        if(!(idx == -1))
            goto J0x24;
        lp1++;
        // [Loop Continue]
        goto J0x14;
    }
    return bRet;
    //return;    
}

function bool ContainsBadNicks(string S, out string badword)
{
    local int lp1;

    S = Caps(S);
    lp1 = 0;
    J0x14:

    // End:0x5F [Loop If]
    if(lp1 < BadNicks.Length)
    {
        // End:0x55
        if(InStr(S, Caps(BadNicks[lp1])) != -1)
        {
            badword = BadNicks[lp1];
            return true;
        }
        lp1++;
        // [Loop Continue]
        goto J0x14;
    }
    return false;
    //return;    
}

event DestroyScript()
{
    ItemParams.Length = 0;
    ItemResParams.Length = 0;
    SkillParams.Length = 0;
    AddPartsGroupParams.Length = 0;
    //return;    
}

function LoadItemParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(ItemParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadItemParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddItemParams(GameData);
    //return;    
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
    J0x0D:

    // End:0x199F [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ItemParam", "type", iIndex);
        // End:0x53
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x199F;
        }
        cParam = new Class'Engine_Decompressed.wItemBaseParam';
        switch(strTemp)
        {
            // End:0x88
            case "Pistol":
                cParam.eType = 5;
                // End:0x4B9
                break;
            // End:0xA3
            case "AR":
                cParam.eType = 0;
                // End:0x4B9
                break;
            // End:0xBF
            case "SMG":
                cParam.eType = 1;
                // End:0x4B9
                break;
            // End:0xDA
            case "SR":
                cParam.eType = 2;
                // End:0x4B9
                break;
            // End:0xF5
            case "HW":
                cParam.eType = 15;
                // End:0x4B9
                break;
            // End:0x110
            case "TW":
                cParam.eType = 6;
                // End:0x4B9
                break;
            // End:0x12D
            case "Bomb":
                cParam.eType = 16;
                // End:0x4B9
                break;
            // End:0x149
            case "SPW":
                cParam.eType = 17;
                // End:0x4B9
                break;
            // End:0x167
            case "Meele":
                cParam.eType = 18;
                // End:0x4B9
                break;
            // End:0x185
            case "Knife":
                cParam.eType = 7;
                // End:0x4B9
                break;
            // End:0x1A2
            case "Body":
                cParam.eType = 13;
                // End:0x4B9
                break;
            // End:0x1BF
            case "Head":
                cParam.eType = 8;
                // End:0x4B9
                break;
            // End:0x1DC
            case "Face":
                cParam.eType = 9;
                // End:0x4B9
                break;
            // End:0x1FE
            case "Accessory":
                cParam.eType = 10;
                // End:0x4B9
                break;
            // End:0x21F
            case "Backpack":
                cParam.eType = 14;
                // End:0x4B9
                break;
            // End:0x23E
            case "SpChar":
                cParam.eType = 11;
                // End:0x4B9
                break;
            // End:0x261
            case "Part_Sight":
                cParam.eType = 20;
                // End:0x4B9
                break;
            // End:0x287
            case "Part_Silencer":
                cParam.eType = 21;
                // End:0x4B9
                break;
            // End:0x2A9
            case "Part_Camo":
                cParam.eType = 22;
                // End:0x4B9
                break;
            // End:0x2CC
            case "Part_Paint":
                cParam.eType = 23;
                // End:0x4B9
                break;
            // End:0x2E9
            case "Cash":
                cParam.eType = 12;
                // End:0x4B9
                break;
            // End:0x305
            case "ETC":
                cParam.eType = 29;
                // End:0x4B9
                break;
            // End:0x324
            case "Supply":
                cParam.eType = 27;
                // End:0x4B9
                break;
            // End:0x342
            case "Skill":
                cParam.eType = 19;
                // End:0x4B9
                break;
            // End:0x365
            case "Part_Scope":
                cParam.eType = 26;
                // End:0x4B9
                break;
            // End:0x385
            case "Passive":
                cParam.eType = 28;
                // End:0x4B9
                break;
            // End:0x3A5
            case "ItemBox":
                cParam.eType = 30;
                // End:0x4B9
                break;
            // End:0x3C5
            case "RandBox":
                cParam.eType = 32;
                // End:0x4B9
                break;
            // End:0x3E4
            case "LvMark":
                cParam.eType = 33;
                // End:0x4B9
                break;
            // End:0x400
            case "USE":
                cParam.eType = 31;
                // End:0x4B9
                break;
            // End:0x41B
            case "MG":
                cParam.eType = 4;
                // End:0x4B9
                break;
            // End:0x43B
            case "Shotgun":
                cParam.eType = 3;
                // End:0x4B9
                break;
            // End:0x45F
            case "Part_Barrel":
                cParam.eType = 24;
                // End:0x4B9
                break;
            // End:0x485
            case "Part_Gunstock":
                cParam.eType = 25;
                // End:0x4B9
                break;
            // End:0x4A2
            case "Gold":
                cParam.eType = 34;
                // End:0x4B9
                break;
            // End:0xFFFF
            default:
                cParam.eType = 35;
                // End:0x4B9
                break;
                break;
        }
        switch(GameData.getData("ItemParam", "grade", iIndex))
        {
            // End:0x4FE
            case "Base":
                cParam.eGrade = 0;
                // End:0x6F5
                break;
            // End:0x51D
            case "Common":
                cParam.eGrade = 2;
                // End:0x6F5
                break;
            // End:0x53A
            case "Shop":
                cParam.eGrade = 1;
                // End:0x6F5
                break;
            // End:0x557
            case "Rare":
                cParam.eGrade = 5;
                // End:0x6F5
                break;
            // End:0x574
            case "High":
                cParam.eGrade = 4;
                // End:0x6F5
                break;
            // End:0x593
            case "Normal":
                cParam.eGrade = 3;
                // End:0x6F5
                break;
            // End:0x5AE
            case "PC":
                cParam.eGrade = 7;
                // End:0x6F5
                break;
            // End:0x5CA
            case "PC+":
                cParam.eGrade = 8;
                // End:0x6F5
                break;
            // End:0x5EB
            case "Map_Spon":
                cParam.eGrade = 9;
                // End:0x6F5
                break;
            // End:0x60C
            case "Map_Lock":
                cParam.eGrade = 10;
                // End:0x6F5
                break;
            // End:0x62A
            case "Skill":
                cParam.eGrade = 11;
                // End:0x6F5
                break;
            // End:0x64A
            case "Special":
                cParam.eGrade = 12;
                // End:0x6F5
                break;
            // End:0x669
            case "Legend":
                cParam.eGrade = 6;
                // End:0x6F5
                break;
            // End:0x686
            case "Part":
                cParam.eGrade = 13;
                // End:0x6F5
                break;
            // End:0x6A3
            case "Cash":
                cParam.eGrade = 14;
                // End:0x6F5
                break;
            // End:0x6C2
            case "supply":
                cParam.eGrade = 15;
                // End:0x6F5
                break;
            // End:0x6DE
            case "War":
                cParam.eGrade = 16;
                // End:0x6F5
                break;
            // End:0xFFFF
            default:
                cParam.eGrade = 17;
                // End:0x6F5
                break;
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
            // End:0xFFFF
            default:
                cParam.iEquipTeam = 0;
                // End:0x967
                break;
                break;
        }
        cParam.strDescription = GameData.getData("ItemParam", "item_description", iIndex);
        switch(GameData.getData("ItemParam", "equipment_slot", iIndex))
        {
            // End:0x9F7
            case "pistol":
                cParam.EEquipSlot = 0;
                // End:0xC12
                break;
            // End:0xA1A
            case "mainweapon":
                cParam.EEquipSlot = 1;
                // End:0xC12
                break;
            // End:0xA3A
            case "Special":
                cParam.EEquipSlot = 2;
                // End:0xC12
                break;
            // End:0xA5A
            case "grenade":
                cParam.EEquipSlot = 3;
                // End:0xC12
                break;
            // End:0xA78
            case "melee":
                cParam.EEquipSlot = 4;
                // End:0xC12
                break;
            // End:0xA96
            case "Knife":
                cParam.EEquipSlot = 1;
                // End:0xC12
                break;
            // End:0xAB3
            case "body":
                cParam.EEquipSlot = 5;
                // End:0xC12
                break;
            // End:0xAD0
            case "head":
                cParam.EEquipSlot = 6;
                // End:0xC12
                break;
            // End:0xAED
            case "face":
                cParam.EEquipSlot = 7;
                // End:0xC12
                break;
            // End:0xB0F
            case "accessory":
                cParam.EEquipSlot = 8;
                // End:0xC12
                break;
            // End:0xB30
            case "backpack":
                cParam.EEquipSlot = 9;
                // End:0xC12
                break;
            // End:0xB4F
            case "spchar":
                cParam.EEquipSlot = 10;
                // End:0xC12
                break;
            // End:0xB72
            case "part_sight":
                cParam.EEquipSlot = 11;
                // End:0xC12
                break;
            // End:0xB98
            case "part_silencer":
                cParam.EEquipSlot = 12;
                // End:0xC12
                break;
            // End:0xBBA
            case "part_camo":
                cParam.EEquipSlot = 13;
                // End:0xC12
                break;
            // End:0xBDD
            case "part_paint":
                cParam.EEquipSlot = 14;
                // End:0xC12
                break;
            // End:0xBFB
            case "skill":
                cParam.EEquipSlot = 15;
                // End:0xC12
                break;
            // End:0xFFFF
            default:
                cParam.EEquipSlot = 16;
                // End:0xC12
                break;
                break;
        }
        // End:0xC56
        if(GameData.getData("ItemParam", "overlap", iIndex) == "-")
        {
            cParam.bOverlap = false;            
        }
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
            // End:0xE32
            case "Durability":
                cParam.ECastType = 0;
                // End:0xECE
                break;
            // End:0xE4F
            case "Time":
                cParam.ECastType = 1;
                // End:0xECE
                break;
            // End:0xE74
            case "Durability-X":
                cParam.ECastType = 2;
                // End:0xECE
                break;
            // End:0xE93
            case "Number":
                cParam.ECastType = 3;
                // End:0xECE
                break;
            // End:0xEB1
            case "Time2":
                cParam.ECastType = 4;
                // End:0xECE
                break;
            // End:0xECB
            case "-":
                cParam.ECastType = 5;
                // End:0xECE
                break;
            // End:0xFFFF
            default:
                break;
        }
        cParam.iRepairCost = int(GameData.getData("ItemParam", "repair_cost", iIndex));
        cParam.byDurabilityWeight = byte(GameData.getData("ItemParam", "durability_weight", iIndex));
        switch(GameData.getData("ItemParam", "shop", iIndex))
        {
            // End:0xF97
            case "Part_Best":
                cParam.iAdType = 14;
                // End:0x10BE
                break;
            // End:0xFBA
            case "Part_Event":
                cParam.iAdType = 13;
                // End:0x10BE
                break;
            // End:0xFDB
            case "Part_Hot":
                cParam.iAdType = 12;
                // End:0x10BE
                break;
            // End:0xFFC
            case "Part_New":
                cParam.iAdType = 11;
                // End:0x10BE
                break;
            // End:0x1019
            case "Part":
                cParam.iAdType = 10;
                // End:0x10BE
                break;
            // End:0x1035
            case "Hot":
                cParam.iAdType = 4;
                // End:0x10BE
                break;
            // End:0x1051
            case "New":
                cParam.iAdType = 3;
                // End:0x10BE
                break;
            // End:0x106F
            case "Event":
                cParam.iAdType = 2;
                // End:0x10BE
                break;
            // End:0x108C
            case "Best":
                cParam.iAdType = 2;
                // End:0x10BE
                break;
            // End:0x10A8
            case "Shop":
                cParam.iAdType = 1;
                // End:0x10BE
                break;
            // End:0xFFFF
            default:
                cParam.iAdType = 0;
                // End:0x10BE
                break;
                break;
        }
        // End:0x10FF
        if(GameData.getData("ItemParam", "sell", iIndex) == "1")
        {
            cParam.bSell = true;            
        }
        else
        {
            cParam.bSell = false;
        }
        strTemp = GameData.getData("ItemParam", "shop_period_start", iIndex);
        ReplaceText(strTemp, ":", " ");
        ReplaceText(strTemp, "-", " ");
        Class'Engine_Decompressed.BTCustomDrawHK'.static.SplitString(strTemp, strArrayTemp, 0, " ");
        cParam.StartSellDate_Year = int(strArrayTemp[0]);
        cParam.StartSellDate_Month = byte(int(strArrayTemp[1]));
        cParam.StartSellDate_Day = byte(int(strArrayTemp[2]));
        cParam.StartSellDate_Hour = byte(int(strArrayTemp[3]));
        cParam.StartSellDate_Min = byte(int(strArrayTemp[4]));
        cParam.StartSellDate_Sec = byte(int(strArrayTemp[5]));
        strTemp = GameData.getData("ItemParam", "shop_period_end", iIndex);
        ReplaceText(strTemp, ":", " ");
        ReplaceText(strTemp, "-", " ");
        Class'Engine_Decompressed.BTCustomDrawHK'.static.SplitString(strTemp, strArrayTemp, 0, " ");
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
        // End:0x18C4
        if(GameData.getData("ItemParam", "auction", iIndex) == "1")
        {
            cParam.bAuction = true;            
        }
        else
        {
            cParam.bAuction = false;
        }
        cParam.iAuctionMaxPrice = int(GameData.getData("ItemParam", "auction_maxprice", iIndex));
        cParam.iAuctionMinPrice = int(GameData.getData("ItemParam", "auction_minprice", iIndex));
        cParam.iResourceArrayIndex = 0;
        SetItemIndex(cParam.iItemID, ItemParams.Length);
        ItemParams[ItemParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x199F:

    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadWeaponParams();
    // End:0x19D2
    if(bResult == false)
    {
        return;
    }
    iIndex = 0;
    J0x19D9:

    // End:0x1CC3 [Loop If]
    if(true)
    {
        strTemp = GameData.getData("WeaponParam", "display_name", iIndex);
        // End:0x1A26
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x1CC3;
        }
        ItemID = int(GameData.getData("WeaponParam", "item_id", iIndex));
        i = 0;
        J0x1A5F:

        // End:0x1CB9 [Loop If]
        if(i < ItemParams.Length)
        {
            // End:0x1CAF
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
                // [Explicit Break]
                goto J0x1CB9;
            }
            i++;
            // [Loop Continue]
            goto J0x1A5F;
        }
        J0x1CB9:

        iIndex++;
        // [Loop Continue]
        goto J0x19D9;
    }
    J0x1CC3:

    //return;    
}

function AddItemParam_NullData()
{
    local wItemBaseParam tmParam;

    tmParam = new Class'Engine_Decompressed.wItemBaseParam';
    ItemParams[ItemParams.Length] = tmParam;
    //return;    
}

function wItemBaseParam GetItemParam(int iItemID)
{
    return ItemParams[GetItemArrayIndex(iItemID)];
    //return;    
}

function LoadItemResourceParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(ItemResParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadItemResourceParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddItemResourceParams(GameData);
    //return;    
}

function AddItemResourceParams(BTNetGameData GameData)
{
    local wItemResourceParam cParam;
    local int iIndex;
    local string strTemp;

    AddItemResourceParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x4FC [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ItemResource", "item_resource_name", iIndex);
        // End:0x64
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x4FC;
        }
        cParam = new Class'Engine_Decompressed.wItemResourceParam';
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
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x4FC:

    //return;    
}

function AddItemResourceParam_NullData()
{
    local wItemResourceParam cParam;

    cParam = new Class'Engine_Decompressed.wItemResourceParam';
    ItemResParams[ItemResParams.Length] = cParam;
    //return;    
}

function wItemResourceParam GetItemResourceParam(int iItemID)
{
    return ItemResParams[GetItemParam(iItemID).iResourceArrayIndex];
    //return;    
}

function PrecacheItemResources(LevelInfo Level)
{
    local int lp1;
    local wItemBaseParam Item;

    lp1 = 0;
    J0x07:

    // End:0x8E [Loop If]
    if(lp1 < ItemParams.Length)
    {
        Item = ItemParams[lp1];
        GetItemResourceMesh(Item.iItemID, false, 0);
        GetItemResourceMesh(Item.iItemID, false, 1);
        GetItemResourceMesh(Item.iItemID, true, 0);
        GetItemResourceMesh(Item.iItemID, true, 1);
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function Mesh GetItemResourceMesh(int iItemID, bool b3rd, optional byte byTeam, optional byte byCase)
{
    local wItemResourceParam cResParam;

    // End:0x0D
    if(iItemID <= 0)
    {
        return none;
    }
    cResParam = GetItemResourceParam(iItemID);
    // End:0x41
    if((cResParam == none) || cResParam.iItemResourceID <= 0)
    {
        return none;
    }
    // End:0x220
    if(int(byCase) == 0)
    {
        // End:0x13D
        if(b3rd == false)
        {
            // End:0xD2
            if(int(byTeam) == 0)
            {
                // End:0xC0
                if((cResParam.mesh_Base_1st == none) && Len(cResParam.strRes_1st) > 1)
                {
                    cResParam.mesh_Base_1st = Mesh(DynamicLoadObject(cResParam.strRes_1st, Class'Engine.Mesh'));
                }
                return cResParam.mesh_Base_1st;                
            }
            else
            {
                // End:0x12B
                if((cResParam.mesh_Base_1st_RSA == none) && Len(cResParam.strRes_1st_RSA) > 1)
                {
                    cResParam.mesh_Base_1st_RSA = Mesh(DynamicLoadObject(cResParam.strRes_1st_RSA, Class'Engine.Mesh'));
                }
                return cResParam.mesh_Base_1st_RSA;
            }            
        }
        else
        {
            // End:0x1B5
            if(int(byTeam) == 0)
            {
                // End:0x1A3
                if((cResParam.mesh_Base_3rd == none) && Len(cResParam.strRes_3rd) > 1)
                {
                    cResParam.mesh_Base_3rd = Mesh(DynamicLoadObject(cResParam.strRes_3rd, Class'Engine.Mesh'));
                }
                return cResParam.mesh_Base_3rd;                
            }
            else
            {
                // End:0x20E
                if((cResParam.mesh_Base_3rd_RSA == none) && Len(cResParam.strRes_3rd_RSA) > 1)
                {
                    cResParam.mesh_Base_3rd_RSA = Mesh(DynamicLoadObject(cResParam.strRes_3rd_RSA, Class'Engine.Mesh'));
                }
                return cResParam.mesh_Base_3rd_RSA;
            }
        }        
    }
    else
    {
        // End:0x30D
        if(int(byCase) == 1)
        {
            // End:0x2A5
            if(int(byTeam) == 0)
            {
                // End:0x293
                if((cResParam.mesh_AF_Backpack == none) && Len(cResParam.strRes_3rd_AF_Backpack) > 1)
                {
                    cResParam.mesh_AF_Backpack = Mesh(DynamicLoadObject(cResParam.strRes_3rd_AF_Backpack, Class'Engine.Mesh'));
                }
                return cResParam.mesh_AF_Backpack;                
            }
            else
            {
                // End:0x2FE
                if((cResParam.mesh_RSA_Backpack == none) && Len(cResParam.strRes_3rd_RSA_Backpack) > 1)
                {
                    cResParam.mesh_RSA_Backpack = Mesh(DynamicLoadObject(cResParam.strRes_3rd_RSA_Backpack, Class'Engine.Mesh'));
                }
                return cResParam.mesh_RSA_Backpack;
            }
        }
    }
    return none;
    //return;    
}

function StaticMesh GetItemResourceStaticMesh(int iItemID, bool b3rd, optional byte byTeam, optional byte byCase)
{
    local wItemResourceParam cResParam;

    // End:0x0D
    if(iItemID <= 0)
    {
        return none;
    }
    cResParam = GetItemResourceParam(iItemID);
    // End:0x41
    if((cResParam == none) || cResParam.iItemResourceID <= 0)
    {
        return none;
    }
    // End:0x21D
    if(int(byCase) == 0)
    {
        // End:0x13D
        if(b3rd == false)
        {
            // End:0xD2
            if(int(byTeam) == 0)
            {
                // End:0xC0
                if((cResParam.stmesh_Base_1st == none) && Len(cResParam.strRes_1st) > 1)
                {
                    cResParam.stmesh_Base_1st = StaticMesh(DynamicLoadObject(cResParam.strRes_1st, Class'Engine.StaticMesh'));
                }
                return cResParam.stmesh_Base_1st;                
            }
            else
            {
                // End:0x12B
                if((cResParam.stmesh_Base_1st_RSA == none) && Len(cResParam.strRes_1st_RSA) > 1)
                {
                    cResParam.stmesh_Base_1st_RSA = StaticMesh(DynamicLoadObject(cResParam.strRes_1st_RSA, Class'Engine.StaticMesh'));
                }
                return cResParam.stmesh_Base_1st_RSA;
            }            
        }
        else
        {
            // End:0x1B5
            if(int(byTeam) == 0)
            {
                // End:0x1A3
                if((cResParam.stmesh_Base_3rd == none) && Len(cResParam.strRes_3rd) > 1)
                {
                    cResParam.stmesh_Base_3rd = StaticMesh(DynamicLoadObject(cResParam.strRes_3rd, Class'Engine.StaticMesh'));
                }
                return cResParam.stmesh_Base_3rd;                
            }
            else
            {
                // End:0x20E
                if((cResParam.stmesh_Base_3rd_RSA == none) && Len(cResParam.strRes_3rd_RSA) > 1)
                {
                    cResParam.stmesh_Base_3rd_RSA = StaticMesh(DynamicLoadObject(cResParam.strRes_3rd_RSA, Class'Engine.StaticMesh'));
                }
                return cResParam.stmesh_Base_3rd_RSA;
            }
        }
    }
    return none;
    //return;    
}

function LoadSkillParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(SkillParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadSkillParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddSkillParams(GameData);
    //return;    
}

function AddSkillParams(BTNetGameData GameData)
{
    local wSkillBaseParam cParam;
    local int iIndex;
    local string strTemp;

    AddSkillParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x36A [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("SkillParam", "skill_name", iIndex);
        // End:0x5A
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x36A;
        }
        cParam = new Class'Engine_Decompressed.wSkillBaseParam';
        cParam.iSkillID = int(GameData.getData("SkillParam", "skill_id", iIndex));
        cParam.strName = GameData.getData("SkillParam", "skill_name", iIndex);
        cParam.strClassName = GameData.getData("SkillParam", "script_class", iIndex);
        cParam.iAttachWeaponID = int(GameData.getData("SkillParam", "attach_weapon", iIndex));
        cParam.iRequirementSkillid = int(GameData.getData("SkillParam", "requirement_skill_id", iIndex));
        switch(GameData.getData("SkillParam", "skill_type", iIndex))
        {
            // End:0x1F0
            case "normal":
                cParam.ESkillType = 0;
                // End:0x22A
                break;
            // End:0x20D
            case "clan":
                cParam.ESkillType = 1;
                // End:0x22A
                break;
            // End:0x213
            case "-":
            // End:0xFFFF
            default:
                cParam.ESkillType = 2;
                // End:0x22A
                break;
                break;
        }
        switch(GameData.getData("SkillParam", "active_type", iIndex))
        {
            // End:0x278
            case "active":
                cParam.eActiveType = 0;
                // End:0x2B5
                break;
            // End:0x298
            case "passive":
                cParam.eActiveType = 1;
                // End:0x2B5
                break;
            // End:0x29E
            case "-":
            // End:0xFFFF
            default:
                cParam.eActiveType = 2;
                // End:0x2B5
                break;
                break;
        }
        cParam.iUseKey = int(GameData.getData("SkillParam", "skill_num", iIndex));
        cParam.strDescription = GameData.getData("SkillParam", "active_description", iIndex);
        SetSkillIndex(cParam.iSkillID, SkillParams.Length);
        SkillParams[SkillParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x36A:

    //return;    
}

function AddSkillParam_NullData()
{
    local wSkillBaseParam cParam;

    cParam = new Class'Engine_Decompressed.wSkillBaseParam';
    SkillParams[SkillParams.Length] = cParam;
    //return;    
}

function wSkillBaseParam GetSkillParam(int iSkillID)
{
    return SkillParams[GetSkillArrayIndex(iSkillID)];
    //return;    
}

function LoadLevelInfoParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(LevelInfoParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadLevelInfoParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddLevelInfoParams(GameData);
    //return;    
}

function AddLevelInfoParam_NullData()
{
    local wLevelInfoParam cParam;

    cParam = new Class'Engine_Decompressed.wLevelInfoParam';
    LevelInfoParams[LevelInfoParams.Length] = cParam;
    //return;    
}

function AddLevelInfoParams(BTNetGameData GameData)
{
    local wLevelInfoParam cParam;
    local int iIndex;
    local string strTemp;

    AddLevelInfoParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x10B [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("LevelInfoParam", "lv", iIndex);
        // End:0x56
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x10B;
        }
        cParam = new Class'Engine_Decompressed.wLevelInfoParam';
        cParam.nLevel = int(strTemp);
        cParam.sLevelName = GameData.getData("LevelInfoParam", "class", iIndex);
        cParam.nAccumExp = int(GameData.getData("LevelInfoParam", "exp", iIndex));
        LevelInfoParams[LevelInfoParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x10B:

    iIndex = 99;
    //return;    
}

function LoadClanLevelInfoParams()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(ClanLevelInfoParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadClanLevelInfoParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddClanLevelInfoParams(GameData);
    //return;    
}

function AddClanLevelInfoParam_NullData()
{
    local wClanLevelInfoParam cParam;

    cParam = new Class'Engine_Decompressed.wClanLevelInfoParam';
    ClanLevelInfoParams[ClanLevelInfoParams.Length] = cParam;
    //return;    
}

function AddClanLevelInfoParams(BTNetGameData GameData)
{
    local wClanLevelInfoParam cParam;
    local int iIndex;
    local string strTemp;

    AddClanLevelInfoParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x117 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ClanLevelInfoParam", "lv", iIndex);
        // End:0x5A
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x117;
        }
        cParam = new Class'Engine_Decompressed.wClanLevelInfoParam';
        cParam.nLevel = int(strTemp);
        cParam.sLevelName = GameData.getData("ClanLevelInfoParam", "class", iIndex);
        cParam.nAccumExp = int(GameData.getData("ClanLevelInfoParam", "exp", iIndex));
        ClanLevelInfoParams[ClanLevelInfoParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x117:

    iIndex = 99;
    //return;    
}

function LoadPromotionParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(PromotionParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadPromotionParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddPromotionParams(GameData);
    //return;    
}

function AddPromotionParam_NullData()
{
    local wPromotionParam cParam;

    cParam = new Class'Engine_Decompressed.wPromotionParam';
    PromotionParams[PromotionParams.Length] = cParam;
    //return;    
}

function AddPromotionParams(BTNetGameData GameData)
{
    local wPromotionParam cParam;
    local int iIndex;
    local string strTemp;

    AddPromotionParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x128 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("PromotionParam", "promotion_lv", iIndex);
        // End:0x60
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x128;
        }
        cParam = new Class'Engine_Decompressed.wPromotionParam';
        cParam.nLevel = int(strTemp);
        cParam.sAcquireItem = GameData.getData("PromotionParam", "promotion_item_id", iIndex);
        cParam.nPartID = int(GameData.getData("PromotionParam", "addpart_id", iIndex));
        PromotionParams[PromotionParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x128:

    iIndex = 99;
    //return;    
}

function int GetPromotionItemsCount(int Level)
{
    local int i, Count;

    Count = 0;
    i = 0;
    J0x0E:

    // End:0x4D [Loop If]
    if(i < PromotionParams.Length)
    {
        // End:0x43
        if(PromotionParams[i].nLevel == Level)
        {
            Count++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    return Count;
    //return;    
}

function GetPromotionItems(int Level, out array<wPromotionParam> arrItems)
{
    local int i, Count;

    Count = 0;
    i = 0;
    J0x0E:

    // End:0x64 [Loop If]
    if(i < PromotionParams.Length)
    {
        // End:0x5A
        if(PromotionParams[i].nLevel == Level)
        {
            arrItems[Count] = PromotionParams[i];
            Count++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

function LoadQuestParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(QuestParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadQuestParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddQuestParams(GameData);
    //return;    
}

function AddQuestParam_NullData()
{
    local wQuestParam cParam;

    cParam = new Class'Engine_Decompressed.wQuestParam';
    cParam.QuestID = -1;
    QuestParams[QuestParams.Length] = cParam;
    //return;    
}

function AddQuestParams(BTNetGameData GameData)
{
    local wQuestParam cParam;
    local int iIndex;
    local string strTemp;
    local BtrTime EventTime;

    AddQuestParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x8B0 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("QuestParam", "quest_type", iIndex);
        // End:0x5A
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x8B0;
        }
        cParam = new Class'Engine_Decompressed.wQuestParam';
        cParam.QuestType = int(strTemp);
        cParam.QuestID = int(GameData.getData("QuestParam", "quest_id", iIndex));
        cParam.LinkQuestID = int(GameData.getData("QuestParam", "link_quest_id", iIndex));
        cParam.LinkQuestStep = int(GameData.getData("QuestParam", "link_quest_step", iIndex));
        cParam.LimitArea = int(GameData.getData("QuestParam", "limit_area", iIndex));
        strTemp = GameData.getData("QuestParam", "event_start", iIndex);
        // End:0x1E3
        if(strTemp != "-")
        {
            EventTime = TimeStringToBtrTime(strTemp);
            BtrTimeToBtrDouble(EventTime, cParam.EventStartTime);
        }
        strTemp = GameData.getData("QuestParam", "event_end", iIndex);
        // End:0x24B
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
        // End:0x3A5
        if(cParam.QuestMissionDesc == "-")
        {
            cParam.QuestMissionDesc = "";
        }
        cParam.QuestExtDesc = GameData.getData("QuestParam", "quest_description", iIndex);
        // End:0x40E
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
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x8B0:

    iIndex = 99;
    //return;    
}

function bool IsEnableWeaponModify(wItemBoxHK ItemInfo)
{
    local int i;

    // End:0x2E
    if((ItemInfo.bParts == false) && ItemInfo.bPaints == false)
    {
        return false;
    }
    i = 0;
    J0x35:

    // End:0x7F [Loop If]
    if(i < ItemInfo.PartAllList.Length)
    {
        // End:0x75
        if((IsExistShopItemList(ItemInfo.PartAllList[i].ItemID)) == 1)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x35;
    }
    i = 0;
    J0x86:

    // End:0xD0 [Loop If]
    if(i < ItemInfo.PaintGroupList.Length)
    {
        // End:0xC6
        if((IsExistShopItemList(ItemInfo.PaintGroupList[i].PaintingItemID)) == 1)
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x86;
    }
    return false;
    //return;    
}

function int GetItemType(wItemBoxHK ItemInfo, wItemBoxInstanceHK instanceInfo)
{
    local int iItemType;

    iItemType = 0;
    switch(ItemInfo.Grade)
    {
        // End:0x2B
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
        // End:0xFFFF
        default:
            break;
    }
    // End:0x61
    if(bool(iItemType & FlagPCBang) == true)
    {
        return iItemType;
    }
    // End:0xE0
    if(((ItemInfo.CostType == 0) || ItemInfo.CostType == 2) || ItemInfo.CostType == 4)
    {
        // End:0xC0
        if((IsEnableWeaponModify(ItemInfo)) == true)
        {
            iItemType += FlagModify;
        }
        // End:0xE0
        if(ItemInfo.CostType == 0)
        {
            iItemType += FlagDurability;
        }
    }
    // End:0x182
    if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
    {
        // End:0x162
        if(bool(iItemType & FlagCash) == true)
        {
            // End:0x15F
            if((instanceInfo.CashItemInfo != none) && instanceInfo.CashItemInfo.bWZCanBuy == true)
            {
                iItemType += FlagRenew;
            }            
        }
        else
        {
            // End:0x182
            if(ItemInfo.AdType != 0)
            {
                iItemType += FlagRenew;
            }
        }
    }
    // End:0x1A3
    if(ItemInfo.bSellShop == true)
    {
        iItemType += FlagSellShop;
    }
    // End:0x247
    if(bool(iItemType & FlagPCBang) == false)
    {
        // End:0x20F
        if(bool(iItemType & FlagCash) == true)
        {
            // End:0x20C
            if((instanceInfo.CashItemInfo != none) && instanceInfo.CashItemInfo.WZCashPrice[0] != 0)
            {
                iItemType += FlagBuyShop;
            }            
        }
        else
        {
            // End:0x247
            if((ItemInfo.AdType != 0) && ItemInfo.PointPrice[0] != 0)
            {
                iItemType += FlagBuyShop;
            }
        }
    }
    return iItemType;
    //return;    
}

function wQuestParam GetQuestInfo(int QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < QuestParams.Length)
    {
        // End:0x41
        if(QuestParams[i].QuestID == QuestID)
        {
            return QuestParams[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return QuestParams[0];
    //return;    
}

function wQuestParam GetQuestInfoFromIndex(int Index)
{
    // End:0x16
    if(Index < 0)
    {
        return QuestParams[0];        
    }
    else
    {
        return QuestParams[Index];
    }
    //return;    
}

function int GetQuestInfoIndex(int QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < QuestParams.Length)
    {
        // End:0x3B
        if(QuestParams[i].QuestID == QuestID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function wQuestParam GetLinkQuestInfo(int LinkQuestID, int LinkQuestStep)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6B [Loop If]
    if(i < QuestParams.Length)
    {
        // End:0x61
        if((QuestParams[i].LinkQuestID == LinkQuestID) && QuestParams[i].LinkQuestStep == LinkQuestStep)
        {
            return QuestParams[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return QuestParams[0];
    //return;    
}

function int GetLinkQuestMaxStep(int LinkQuestID)
{
    local int i, maxstep;

    maxstep = -1;
    i = 0;
    J0x12:

    // End:0x82 [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return maxstep;
    //return;    
}

function bool HasEnableEventQuest(BtrDouble ServerTime, wMatchMaker wMM)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x83 [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
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
    //return;    
}

function LoadDailyQuestParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(DailyQuestParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadDailyQuestParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddDailyQuestParams(GameData);
    //return;    
}

function AddDailyQuestParam_NullData()
{
    local wDailyQuestParam cParam;

    cParam = new Class'Engine_Decompressed.wDailyQuestParam';
    cParam.QuestID = -1;
    DailyQuestParams[DailyQuestParams.Length] = cParam;
    //return;    
}

function AddDailyQuestParams(BTNetGameData GameData)
{
    local wDailyQuestParam cParam;
    local int iIndex;
    local string strTemp;

    AddDailyQuestParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x122 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("DailyQuestParam", "daily_quest_type", iIndex);
        // End:0x65
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x122;
        }
        cParam = new Class'Engine_Decompressed.wDailyQuestParam';
        cParam.DailyQuestType = int(strTemp);
        cParam.Step = int(GameData.getData("DailyQuestParam", "step", iIndex));
        cParam.QuestID = int(GameData.getData("DailyQuestParam", "quest_id", iIndex));
        DailyQuestParams[DailyQuestParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x122:

    iIndex = 99;
    //return;    
}

function int GetDailyQuestType(int QuestID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(i < DailyQuestParams.Length)
    {
        // End:0x4A
        if(DailyQuestParams[i].QuestID == QuestID)
        {
            return DailyQuestParams[i].DailyQuestType;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function int GetDailyQuestIDFromTypeAndStep(int ServerTime, int DailyQuestType, int Step)
{
    local array<wDailyQuestParam> Arr;
    local int i;

    i = 0;
    J0x07:

    // End:0x8A [Loop If]
    if(i < DailyQuestParams.Length)
    {
        // End:0x80
        if((DailyQuestParams[i].DailyQuestType == DailyQuestType) && DailyQuestParams[i].Step == Step)
        {
            Arr.Length = Arr.Length + 1;
            Arr[Arr.Length - 1] = DailyQuestParams[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x9C
    if(Arr.Length <= 0)
    {
        return -1;
    }
    return Arr[int(float(ServerTime) % float(Arr.Length))].QuestID;
    //return;    
}

function int GetPrevDailyQuestID(int QuestID)
{
    local wQuestParam q;
    local int DailyQuestType, Step, ServerTime;

    ServerTime = __NFUN_923__(kServerTime);
    q = GetQuestInfo(QuestID);
    Step = q.LinkQuestStep - 1;
    DailyQuestType = GetDailyQuestType(QuestID);
    // End:0x65
    if((Step < 0) || DailyQuestType < 0)
    {
        return -1;
    }
    return GetDailyQuestIDFromTypeAndStep(ServerTime, DailyQuestType, Step);
    //return;    
}

function int GetLastDailyQuestID(int QuestID)
{
    local wQuestParam q;
    local int DailyQuestType, Step, ServerTime;

    ServerTime = __NFUN_923__(kServerTime);
    q = GetQuestInfo(QuestID);
    Step = GetLinkQuestMaxStep(q.LinkQuestID);
    DailyQuestType = GetDailyQuestType(QuestID);
    // End:0x68
    if((Step < 0) || DailyQuestType < 0)
    {
        return -1;
    }
    return GetDailyQuestIDFromTypeAndStep(ServerTime, DailyQuestType, Step);
    //return;    
}

function LoadRandBoxParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(RandBoxParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadRandBoxParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddRandBoxParams(GameData);
    //return;    
}

function AddRandBoxParam_NullData()
{
    local wRandBoxParam cParam;

    cParam = new Class'Engine_Decompressed.wRandBoxParam';
    cParam.ItemID = -1;
    RandBoxParams[RandBoxParams.Length] = cParam;
    //return;    
}

function AddRandBoxParams(BTNetGameData GameData)
{
    local wRandBoxParam cParam;
    local int iIndex, i;
    local string strTemp;

    AddRandBoxParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x193 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("RandBoxParam", "item_id", iIndex);
        // End:0x59
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x193;
        }
        cParam = new Class'Engine_Decompressed.wRandBoxParam';
        cParam.ItemID = int(strTemp);
        cParam.RandNum = int(GameData.getData("RandBoxParam", "rand_num", iIndex));
        i = 0;
        J0xC2:

        // End:0x177 [Loop If]
        if(i < 50)
        {
            cParam.RandItemID[i] = int(GameData.getData("RandBoxParam", "item_id_" $ string(i + 1), iIndex));
            cParam.RandPartID[i] = int(GameData.getData("RandBoxParam", "parts_id_" $ string(i + 1), iIndex));
            i++;
            // [Loop Continue]
            goto J0xC2;
        }
        RandBoxParams[RandBoxParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x193:

    iIndex = 99;
    //return;    
}

function int GetRandBoxItemsCount(int ItemID)
{
    local int i, MaxIndex;

    MaxIndex = 0;
    i = 0;
    J0x0E:

    // End:0x4D [Loop If]
    if(i < RandBoxParams.Length)
    {
        // End:0x43
        if(RandBoxParams[i].ItemID == ItemID)
        {
            MaxIndex++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    return MaxIndex;
    //return;    
}

function bool GetRandBoxItems(int ItemID, int RandNum, out array<int> ItemIDs, out array<int> PartIDs)
{
    local int i, j;

    ItemIDs.Length = 0;
    PartIDs.Length = 0;
    i = 0;
    J0x17:

    // End:0x122 [Loop If]
    if(i < RandBoxParams.Length)
    {
        // End:0x118
        if((RandBoxParams[i].ItemID == ItemID) && RandBoxParams[i].RandNum == RandNum)
        {
            j = 0;
            J0x6C:

            // End:0x116 [Loop If]
            if(j < 50)
            {
                // End:0x10C
                if(RandBoxParams[i].RandItemID[j] != 0)
                {
                    ItemIDs.Length = ItemIDs.Length + 1;
                    ItemIDs[ItemIDs.Length - 1] = RandBoxParams[i].RandItemID[j];
                    PartIDs.Length = PartIDs.Length + 1;
                    PartIDs[PartIDs.Length - 1] = RandBoxParams[i].RandPartID[j];
                }
                j++;
                // [Loop Continue]
                goto J0x6C;
            }
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    return false;
    //return;    
}

function LoadModeDOAParameters()
{
    local BTNetGameData GameData;
    local bool bResult;
    local wModeDOAParam Param;
    local int iIndex, i, tmpVal;
    local string strTemp;

    // End:0x0E
    if(ModeDOAParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadModeDOAParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    iIndex = 0;
    J0x48:

    // End:0x1F3 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("Mode_DOA", "groupid", iIndex);
        // End:0x90
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x1F3;
        }
        Param = new Class'Engine_Decompressed.wModeDOAParam';
        Param.GroupID = int(strTemp);
        Param.WeaponID0 = int(GameData.getData("Mode_DOA", "weaponid0", iIndex));
        Param.WeaponID1 = int(GameData.getData("Mode_DOA", "weaponid1", iIndex));
        Param.WeaponID2 = int(GameData.getData("Mode_DOA", "weaponid2", iIndex));
        Param.WeaponID3 = int(GameData.getData("Mode_DOA", "weaponid3", iIndex));
        Param.WeaponID4 = int(GameData.getData("Mode_DOA", "weaponid4", iIndex));
        ModeDOAParams[ModeDOAParams.Length] = Param;
        iIndex++;
        // [Loop Continue]
        goto J0x48;
    }
    J0x1F3:

    iIndex = 99;
    //return;    
}

function AddClanMarkParam_NullData()
{
    local wClanMarkParam cParam;

    cParam = new Class'Engine_Decompressed.wClanMarkParam';
    ClanMarkParams[ClanMarkParams.Length] = cParam;
    //return;    
}

function AddClanMarkParams(BTNetGameData GameData)
{
    local wClanMarkParam cParam;
    local int iIndex;
    local string strTemp;

    AddClanMarkParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x2E0 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ClanMarkParam", "clanmark_id", iIndex);
        // End:0x5E
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x2E0;
        }
        cParam = new Class'Engine_Decompressed.wClanMarkParam';
        cParam.nClanMark_ID = int(strTemp);
        cParam.nClanMark_Type_1 = int(GameData.getData("ClanMarkParam", "clanmark_type_1", iIndex));
        cParam.nClanMark_Type_2 = int(GameData.getData("ClanMarkParam", "clanmark_type_2", iIndex));
        cParam.nSell_Type = int(GameData.getData("ClanMarkParam", "sell_type", iIndex));
        cParam.nDisplay_Order = int(GameData.getData("ClanMarkParam", "display_order", iIndex));
        cParam.sClanMark_Resource_32 = GameData.getData("ClanMarkParam", "clanmark_resource_32", iIndex);
        cParam.sClanMark_Resource_128 = GameData.getData("ClanMarkParam", "clanmark_resource_128", iIndex);
        SP.ClanMarkImg32[SP.ClanMarkImg32.Length] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(32, 32, 0, Texture(DynamicLoadObject(cParam.sClanMark_Resource_32, Class'Engine_Decompressed.Texture')));
        SP.ClanMarkImg128[SP.ClanMarkImg128.Length] = Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(128, 128, 0, Texture(DynamicLoadObject(cParam.sClanMark_Resource_128, Class'Engine_Decompressed.Texture')));
        ClanMarkParams[ClanMarkParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x2E0:

    iIndex = 99;
    //return;    
}

function wClanMarkParam FindClanMarkParams(int clanmarkid)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4B [Loop If]
    if(i < ClanMarkParams.Length)
    {
        // End:0x41
        if(ClanMarkParams[i].nClanMark_ID == clanmarkid)
        {
            return ClanMarkParams[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function int FindClanMarkIndex(int clanmarkid)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < ClanMarkParams.Length)
    {
        // End:0x3B
        if(ClanMarkParams[i].nClanMark_ID == clanmarkid)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function Image GetMyClanPattern()
{
    return SP.kClanPattern_Img;
    //return;    
}

function Image GetMyClanBG()
{
    return SP.kClanBG_Img;
    //return;    
}

function Image GetMyClanBL()
{
    return SP.kClanBL_Img;
    //return;    
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
    else
    {
        return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(0, 0, 0, none);
    }
    //return;    
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
    else
    {
        return Class'Engine_Decompressed.BTCustomDrawHK'.static.MakeImage(0, 0, 0, none);
    }
    //return;    
}

function LoadItemBoxParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(ItemBoxParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadItemBoxParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddItemBoxParams(GameData);
    //return;    
}

function AddItemBoxParam_NullData()
{
    local wItemBoxParam cParam;

    cParam = new Class'Engine_Decompressed.wItemBoxParam';
    ItemBoxParams[ItemBoxParams.Length] = cParam;
    //return;    
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
    J0x0D:

    // End:0x1B3 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("ItemBoxParam", "item_id", iIndex);
        // End:0x59
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x1B3;
        }
        cParam = new Class'Engine_Decompressed.wItemBoxParam';
        cParam.nItemBoxID = int(strTemp);
        cParam.nItemCount = int(GameData.getData("ItemBoxParam", "item_count", iIndex));
        i = 0;
        J0xC4:

        // End:0x197 [Loop If]
        if(i < 20)
        {
            ItemID = "box_item_id_" $ string(i + 1);
            PartID = "box_parts_id_" $ string(i + 1);
            cParam.nItemID[i] = int(GameData.getData("ItemBoxParam", ItemID, iIndex));
            cParam.nPartID[i] = int(GameData.getData("ItemBoxParam", PartID, iIndex));
            i++;
            // [Loop Continue]
            goto J0xC4;
        }
        ItemBoxParams[ItemBoxParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x1B3:

    iIndex = 99;
    //return;    
}

function LoadAddPartsGroupParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(AddPartsGroupParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadAddPartsGroupParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddAddPartsGroupParams(GameData);
    //return;    
}

function AddAddPartsGroupParams(BTNetGameData GameData)
{
    local wPartsGroupParam cParam;
    local int iIndex;
    local string strTemp;

    AddAddPartsGroupParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0xA46 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("PartsGroupParam", "addpart_name", iIndex);
        // End:0x61
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0xA46;
        }
        cParam = new Class'Engine_Decompressed.wPartsGroupParam';
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
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0xA46:

    iIndex = 99;
    //return;    
}

function AddAddPartsGroupParam_NullData()
{
    local wPartsGroupParam cParam;

    cParam = new Class'Engine_Decompressed.wPartsGroupParam';
    AddPartsGroupParams[AddPartsGroupParams.Length] = cParam;
    //return;    
}

function wPartsGroupParam GetAddPartsGroupParam(int iPartsGrouplID)
{
    return AddPartsGroupParams[GetPartsGroupArrayIndex(iPartsGrouplID)];
    //return;    
}

function wPartsGroupParam GetDefaultAddPartsGroupParam(int iItemID)
{
    local wItemBaseParam baseParam;
    local int iTemp;

    baseParam = GetItemParam(iItemID);
    iTemp = 0;
    J0x18:

    // End:0x83 [Loop If]
    if(iTemp < AddPartsGroupParams.Length)
    {
        // End:0x79
        if((baseParam.strAddPartGroupID == AddPartsGroupParams[iTemp].strPartsGroupID) && int(AddPartsGroupParams[iTemp].byAddpartNum) == 0)
        {
            return AddPartsGroupParams[iTemp];
        }
        iTemp++;
        // [Loop Continue]
        goto J0x18;
    }
    //return;    
}

function Material GetPartsGroupPainting(int iItemID, int iPartsID, optional bool bThird, optional int iPainting_Item_ID)
{
    local wWeaponCustomInfoParam wcip;
    local wItemResourceParam resParam;
    local string strName;
    local Material matResult;

    // End:0x1A
    if((iPartsID <= 0) && iPainting_Item_ID <= 0)
    {
        return none;
    }
    wcip = GetWeaponCustomInfoParam(iItemID);
    // End:0x5B
    if((wcip.iItemID <= 0) || wcip.iItemID != iItemID)
    {
        return none;
    }
    // End:0x1B7
    if(bThird == false)
    {
        resParam = GetItemResourceParam(iItemID);
        // End:0x9B
        if((resParam == none) || resParam.iItemResourceID <= 0)
        {
            return none;
        }
        strName = resParam.strRes_3rd_AF_Backpack;
        // End:0x127
        if(iPainting_Item_ID > 0)
        {
            resParam = GetItemResourceParam(iPainting_Item_ID);
            // End:0xEE
            if((resParam == none) || resParam.iItemResourceID <= 0)
            {
                return none;
            }
            strName = strName $ resParam.strRes_3rd_AF_Backpack;
            matResult = Material(DynamicLoadObject(strName, Class'Engine_Decompressed.Material'));            
        }
        else
        {
            // End:0x1AE
            if(wcip.iDefaultPaintingID > 0)
            {
                resParam = GetItemResourceParam(wcip.iDefaultPaintingID);
                // End:0x178
                if((resParam == none) || resParam.iItemResourceID <= 0)
                {
                    return none;
                }
                strName = strName $ resParam.strRes_3rd_AF_Backpack;
                matResult = Material(DynamicLoadObject(strName, Class'Engine_Decompressed.Material'));
            }
        }
        return matResult;        
    }
    else
    {
        resParam = GetItemResourceParam(iItemID);
        // End:0x1EB
        if((resParam == none) || resParam.iItemResourceID <= 0)
        {
            return none;
        }
        // End:0x277
        if(iPainting_Item_ID > 0)
        {
            strName = resParam.strRes_3rd_AF_Gore;
            resParam = GetItemResourceParam(iPainting_Item_ID);
            // End:0x23E
            if((resParam == none) || resParam.iItemResourceID <= 0)
            {
                return none;
            }
            strName = strName $ resParam.strRes_3rd_AF_Backpack;
            matResult = Material(DynamicLoadObject(strName, Class'Engine_Decompressed.Material'));            
        }
        else
        {
            strName = resParam.strRes_3rd_AF_Gore;
            // End:0x312
            if(wcip.iDefaultPaintingID > 0)
            {
                resParam = GetItemResourceParam(wcip.iDefaultPaintingID);
                // End:0x2DC
                if((resParam == none) || resParam.iItemResourceID <= 0)
                {
                    return none;
                }
                strName = strName $ resParam.strRes_3rd_AF_Backpack;
                matResult = Material(DynamicLoadObject(strName, Class'Engine_Decompressed.Material'));
            }
        }
        return matResult;
    }
    //return;    
}

function LoadPaintGroupParameters()
{
    local BTNetGameData GameData;
    local bool bResult;

    // End:0x0E
    if(PaintGroupParams.Length > 0)
    {
        return;
    }
    GameData = new Class'BTData.BTNetGameData';
    bResult = GameData.LoadPaintGroupParams();
    // End:0x41
    if(bResult == false)
    {
        return;
    }
    AddPaintGroupParams(GameData);
    //return;    
}

function AddPaintGroupParams(BTNetGameData GameData)
{
    local wPaintGroupParam cParam;
    local int iIndex;
    local string strTemp;

    AddPaintGroupParam_NullData();
    iIndex = 0;
    J0x0D:

    // End:0x239 [Loop If]
    if(1 != 0)
    {
        strTemp = GameData.getData("PaintGroupParam", "painting_id", iIndex);
        // End:0x60
        if(strTemp == "99999")
        {
            // [Explicit Break]
            goto J0x239;
        }
        cParam = new Class'Engine_Decompressed.wPaintGroupParam';
        cParam.PaintingID = int(strTemp);
        cParam.PaintingGroupID = GameData.getData("PaintGroupParam", "painting_group_id", iIndex);
        cParam.PaintingNum = int(GameData.getData("PaintGroupParam", "painting_num", iIndex));
        cParam.PaintingItemID = int(GameData.getData("PaintGroupParam", "painting_item_id", iIndex));
        cParam.RepairCost = float(GameData.getData("PaintGroupParam", "repair_cost", iIndex));
        cParam.UI_Durability = int(GameData.getData("PaintGroupParam", "ui_durability", iIndex));
        cParam.strUI_Icon = GameData.getData("PaintGroupParam", "ui_icon", iIndex);
        PaintGroupParams[PaintGroupParams.Length] = cParam;
        iIndex++;
        // [Loop Continue]
        goto J0x0D;
    }
    J0x239:

    iIndex = 99;
    //return;    
}

function AddPaintGroupParam_NullData()
{
    local wPaintGroupParam cParam;

    cParam = new Class'Engine_Decompressed.wPaintGroupParam';
    PaintGroupParams[PaintGroupParams.Length] = cParam;
    //return;    
}

function string GetPaintingUIIcon(int iItemID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(i < PaintGroupParams.Length)
    {
        // End:0x4A
        if(PaintGroupParams[i].PaintingItemID == iItemID)
        {
            return PaintGroupParams[i].strUI_Icon;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function wPaintGroupParam GetPaintGroupParam(int iPaintingID)
{
    local wPaintGroupParam PaintParam;
    local int PaintingIdx;

    PaintingIdx = GetPaintGroupParamsIndex(iPaintingID);
    // End:0x2D
    if(PaintingIdx >= 0)
    {
        PaintParam = PaintGroupParams[PaintingIdx];
    }
    return PaintParam;
    //return;    
}

function int GetPaintGroupParamsIndex(int PaintingID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < PaintGroupParams.Length)
    {
        // End:0x3B
        if(PaintGroupParams[i].PaintingID == PaintingID)
        {
            return i;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
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
    //return;    
}

function LoadMapInfos()
{
    local BTNetMapData mapData;
    local bool bResult;
    local float fValue;
    local int iIndex;
    local wMapInfo Info;

    // End:0xFAF
    if(MapInfos.Length == 0)
    {
        mapData = new Class'BTData.BTNetMapData';
        bResult = mapData.LoadMapData();
        // End:0x3E
        if(!bResult)
        {
            return;
        }
        fValue = 0.0000000;
        iIndex = 0;
        J0x50:

        // End:0xFAF [Loop If]
        if(fValue != float(99999))
        {
            Info = new Class'Engine_Decompressed.wMapInfo';
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
            // End:0xF93
            if(Info.MapID == 99999)
            {
                fValue = 99999.0000000;
                // [Explicit Break]
                goto J0xFAF;
            }
            MapInfos[MapInfos.Length] = Info;
            iIndex++;
            // [Loop Continue]
            goto J0x50;
        }
    }
    J0xFAF:

    //return;    
}

function LoadSupplyRandomTable()
{
    local BTNetGameData GameData;
    local bool bResult;
    local int iIndex;
    local float fValue;

    // End:0xBD
    if(SupplyRandomArray.Length == 0)
    {
        GameData = new Class'BTData.BTNetGameData';
        bResult = GameData.LoadSupplyRandomTable();
        // End:0x3E
        if(!bResult)
        {
            return;
        }
        iIndex = 0;
        J0x45:

        // End:0xBD [Loop If]
        if(1 != 0)
        {
            fValue = float(GameData.getData("SupplyRand", "rand_1", iIndex));
            // End:0xA1
            if((fValue == float(99999)) || iIndex > 2000)
            {
                // [Explicit Break]
                goto J0xBD;
            }
            SupplyRandomArray[SupplyRandomArray.Length] = fValue;
            iIndex++;
            // [Loop Continue]
            goto J0x45;
        }
    }
    J0xBD:

    //return;    
}

function int GetLevel(int Exp)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x3C [Loop If]
    if(lp1 < LevelExps.Length)
    {
        // End:0x32
        if(Exp < LevelExps[lp1])
        {
            return lp1;
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    return LevelExps.Length - 1;
    //return;    
}

function int GetLevelByLevelMarkID(int LevelMarkID)
{
    local int Level;
    local wItemBaseParam ItemParam;

    ItemParam = GetItemParam(LevelMarkID);
    Level = int(ItemParam.strAddPartGroupID);
    return Level;
    //return;    
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
    //return;    
}

function FloatBox GetLevelImageCoordi(int Level, optional int LevelMarkID)
{
    local FloatBox Coordi;
    local int imgX, imgY;

    // End:0x1C
    if(LevelMarkID != 0)
    {
        Level = GetLevelByLevelMarkID(LevelMarkID);
    }
    imgY = (Level - 1) / 16;
    imgX = int(float(Level - 1) % float(16));
    Coordi.X1 = 32.0000000 * float(imgX);
    Coordi.X2 = 32.0000000;
    Coordi.Y1 = 32.0000000 * float(imgY);
    Coordi.Y2 = 32.0000000;
    return Coordi;
    //return;    
}

function string GetLevelImageString(int Level, optional int LevelMarkID)
{
    local int idx;

    // End:0x1C
    if(LevelMarkID != 0)
    {
        Level = GetLevelByLevelMarkID(LevelMarkID);
    }
    idx = Level / 64;
    return LevelImages[idx];
    //return;    
}

simulated function I3DL2Listener GetEAXEffect(string strEffectClassName)
{
    local int i;
    local SEAXEffect sEffect;
    local Class<I3DL2Listener> EffectClass;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < EAXEffectList.Length)
    {
        // End:0x42
        if(EAXEffectList[i].strClassName == strEffectClassName)
        {
            return EAXEffectList[i].EAXEffect;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    sEffect.strClassName = strEffectClassName;
    EffectClass = Class<I3DL2Listener>(DynamicLoadObject("Engine." $ strEffectClassName, Class'Core.Class'));
    sEffect.EAXEffect = new EffectClass;
    EAXEffectList[EAXEffectList.Length] = sEffect;
    return sEffect.EAXEffect;
    //return;    
}

function bool CheckWeaponItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1E
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 5:
        // End:0x2D
        case 3:
        // End:0x32
        case 4:
        // End:0x39
        case 6:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function bool CheckMainWeaponItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1E
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 3:
        // End:0x2F
        case 4:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function bool CheckSubWeaponItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x1B
        case 5:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function bool CheckQuickSlotItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1E
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 5:
        // End:0x2D
        case 6:
        // End:0x32
        case 3:
        // End:0x37
        case 4:
        // End:0x3C
        case 8:
        // End:0x41
        case 9:
        // End:0x46
        case 10:
        // End:0x4B
        case 11:
        // End:0x50
        case 19:
        // End:0x57
        case 33:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function bool CheckMainQuickSlotItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 0:
        // End:0x1E
        case 1:
        // End:0x23
        case 2:
        // End:0x28
        case 5:
        // End:0x2D
        case 6:
        // End:0x32
        case 3:
        // End:0x37
        case 4:
        // End:0x3E
        case 19:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function bool CheckEquipQuickSlotItem(int iItemType)
{
    local wGameManager.EItemType eType;

    eType = byte(iItemType);
    switch(eType)
    {
        // End:0x19
        case 8:
        // End:0x1E
        case 9:
        // End:0x23
        case 10:
        // End:0x28
        case 11:
        // End:0x2F
        case 33:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return;    
}

function bool CheckARItem(int iItemType)
{
    return int(byte(iItemType)) == int(0);
    //return;    
}

function bool CheckSMGItem(int iItemType)
{
    return int(byte(iItemType)) == int(1);
    //return;    
}

function bool CheckSRItem(int iItemType)
{
    return int(byte(iItemType)) == int(2);
    //return;    
}

function bool CheckSGItem(int iItemType)
{
    return int(byte(iItemType)) == int(3);
    //return;    
}

function bool CheckMGItem(int iItemType)
{
    return int(byte(iItemType)) == int(4);
    //return;    
}

function bool CheckPistolItem(int iItemType)
{
    return int(byte(iItemType)) == int(5);
    //return;    
}

function bool CheckSkillItem(int iItemType)
{
    return int(byte(iItemType)) == int(19);
    //return;    
}

function bool CheckItemBox(int iItemType)
{
    return int(byte(iItemType)) == int(30);
    //return;    
}

function bool CheckUseItem(int iItemType)
{
    return int(byte(iItemType)) == int(31);
    //return;    
}

function bool CheckRandBoxItem(int iItemType)
{
    return int(byte(iItemType)) == int(32);
    //return;    
}

function bool CheckLvMark(int iItemType)
{
    return int(byte(iItemType)) == int(33);
    //return;    
}

function bool CheckThrowingWeapon(int iItemType)
{
    return int(byte(iItemType)) == int(6);
    //return;    
}

function bool CheckHeadItem(int iItemType)
{
    return int(byte(iItemType)) == int(8);
    //return;    
}

function bool CheckFaceItem(int iItemType)
{
    return int(byte(iItemType)) == int(9);
    //return;    
}

function bool CheckAccessoryItem(int iItemType)
{
    return int(byte(iItemType)) == int(10);
    //return;    
}

function bool CheckSpCharItem(int iItemType)
{
    return int(byte(iItemType)) == int(11);
    //return;    
}

defaultproperties
{
    LevelExps[0]=1500
    LevelExps[1]=3450
    LevelExps[2]=5900
    LevelImages[0]="Warfare_GP_UI_UI.Lv_Mark.Lv_Mark_1"
    LevelImages[1]="Warfare_GP_UI_UI.Lv_Mark.Lv_Mark_2"
    LevelImages[2]="Warfare_GP_UI_UI.Lv_Mark.Lv_Mark_3"
    ClanLevelImages[0]="none"
    ClanLevelImages[1]="Warfare_GP_UI_UI.Common.icon_cl_f5"
    ClanLevelImages[2]="Warfare_GP_UI_UI.Common.icon_cl_f4"
    ClanLevelImages[3]="Warfare_GP_UI_UI.Common.icon_cl_f3"
    ClanLevelImages[4]="Warfare_GP_UI_UI.Common.icon_cl_f2"
    ClanLevelImages[5]="Warfare_GP_UI_UI.Common.icon_cl_f1"
    ClanLevelImages[6]="Warfare_GP_UI_UI.Common.icon_cl_e5"
    ClanLevelImages[7]="Warfare_GP_UI_UI.Common.icon_cl_e4"
    ClanLevelImages[8]="Warfare_GP_UI_UI.Common.icon_cl_e3"
    ClanLevelImages[9]="Warfare_GP_UI_UI.Common.icon_cl_e2"
    ClanLevelImages[10]="Warfare_GP_UI_UI.Common.icon_cl_e1"
    ClanLevelImages[11]="Warfare_GP_UI_UI.Common.icon_cl_d5"
    ClanLevelImages[12]="Warfare_GP_UI_UI.Common.icon_cl_d4"
    ClanLevelImages[13]="Warfare_GP_UI_UI.Common.icon_cl_d3"
    ClanLevelImages[14]="Warfare_GP_UI_UI.Common.icon_cl_d2"
    ClanLevelImages[15]="Warfare_GP_UI_UI.Common.icon_cl_d1"
    ClanLevelImages[16]="Warfare_GP_UI_UI.Common.icon_cl_c5"
    ClanLevelImages[17]="Warfare_GP_UI_UI.Common.icon_cl_c4"
    ClanLevelImages[18]="Warfare_GP_UI_UI.Common.icon_cl_c3"
    ClanLevelImages[19]="Warfare_GP_UI_UI.Common.icon_cl_c2"
    ClanLevelImages[20]="Warfare_GP_UI_UI.Common.icon_cl_c1"
    ClanLevelImages[21]="Warfare_GP_UI_UI.Common.icon_cl_b5"
    ClanLevelImages[22]="Warfare_GP_UI_UI.Common.icon_cl_b4"
    ClanLevelImages[23]="Warfare_GP_UI_UI.Common.icon_cl_b3"
    ClanLevelImages[24]="Warfare_GP_UI_UI.Common.icon_cl_b2"
    ClanLevelImages[25]="Warfare_GP_UI_UI.Common.icon_cl_b1"
    ClanLevelImages[26]="Warfare_GP_UI_UI.Common.icon_cl_a5"
    ClanLevelImages[27]="Warfare_GP_UI_UI.Common.icon_cl_a4"
    ClanLevelImages[28]="Warfare_GP_UI_UI.Common.icon_cl_a3"
    ClanLevelImages[29]="Warfare_GP_UI_UI.Common.icon_cl_a2"
    ClanLevelImages[30]="Warfare_GP_UI_UI.Common.icon_cl_a1"
    SupplyRandomArray[0]=48.0000000
    SupplyRandomArray[1]=30.5000000
    SupplyRandomArray[2]=28.0000000
    SupplyRandomArray[3]=6.5000000
    SupplyRandomArray[4]=22.5000000
    SupplyRandomArray[5]=1.0000000
    SupplyRandomArray[6]=99.0000000
    SupplyRandomArray[7]=54.5000000
    SupplyRandomArray[8]=47.5000000
    SupplyRandomArray[9]=27.5000000
    SupplyRandomArray[10]=96.0000000
    SupplyRandomArray[11]=24.5000000
    SupplyRandomArray[12]=8.0000000
    SupplyRandomArray[13]=14.0000000
    SupplyRandomArray[14]=47.5000000
    SupplyRandomArray[15]=92.5000000
    SupplyRandomArray[16]=82.0000000
    SupplyRandomArray[17]=91.0000000
    SupplyRandomArray[18]=43.0000000
    SupplyRandomArray[19]=50.5000000
    SupplyRandomArray[20]=48.5000000
    SupplyRandomArray[21]=6.5000000
    SupplyRandomArray[22]=95.5000000
    SupplyRandomArray[23]=35.5000000
    SupplyRandomArray[24]=68.0000000
    SupplyRandomArray[25]=20.5000000
    SupplyRandomArray[26]=6.5000000
    SupplyRandomArray[27]=97.5000000
    SupplyRandomArray[28]=43.5000000
    SupplyRandomArray[29]=0.0000000
    SupplyRandomArray[30]=85.5000000
    SupplyRandomArray[31]=41.5000000
    SupplyRandomArray[32]=96.5000000
    SupplyRandomArray[33]=13.5000000
    SupplyRandomArray[34]=53.0000000
    SupplyRandomArray[35]=21.5000000
    SupplyRandomArray[36]=85.5000000
    SupplyRandomArray[37]=26.5000000
    SupplyRandomArray[38]=70.0000000
    SupplyRandomArray[39]=95.0000000
    SupplyRandomArray[40]=69.5000000
    SupplyRandomArray[41]=43.0000000
    SupplyRandomArray[42]=0.0000000
    SupplyRandomArray[43]=0.0000000
    SupplyRandomArray[44]=55.5000000
    SupplyRandomArray[45]=41.5000000
    SupplyRandomArray[46]=45.5000000
    SupplyRandomArray[47]=84.5000000
    SupplyRandomArray[48]=67.0000000
    SupplyRandomArray[49]=94.0000000
    SupplyRandomArray[50]=8.5000000
    SupplyRandomArray[51]=79.0000000
    SupplyRandomArray[52]=18.5000000
    SupplyRandomArray[53]=16.5000000
    SupplyRandomArray[54]=33.5000000
    SupplyRandomArray[55]=83.0000000
    SupplyRandomArray[56]=2.5000000
    SupplyRandomArray[57]=42.0000000
    SupplyRandomArray[58]=29.5000000
    SupplyRandomArray[59]=50.0000000
    SupplyRandomArray[60]=90.5000000
    SupplyRandomArray[61]=80.5000000
    SupplyRandomArray[62]=5.5000000
    SupplyRandomArray[63]=40.5000000
    SupplyRandomArray[64]=48.0000000
    SupplyRandomArray[65]=81.5000000
    SupplyRandomArray[66]=88.0000000
    SupplyRandomArray[67]=54.5000000
    SupplyRandomArray[68]=9.5000000
    SupplyRandomArray[69]=48.0000000
    SupplyRandomArray[70]=87.0000000
    SupplyRandomArray[71]=88.5000000
    SupplyRandomArray[72]=32.5000000
    SupplyRandomArray[73]=80.0000000
    SupplyRandomArray[74]=9.0000000
    SupplyRandomArray[75]=43.5000000
    SupplyRandomArray[76]=7.5000000
    SupplyRandomArray[77]=85.0000000
    SupplyRandomArray[78]=88.5000000
    SupplyRandomArray[79]=36.5000000
    SupplyRandomArray[80]=16.5000000
    SupplyRandomArray[81]=25.0000000
    SupplyRandomArray[82]=95.0000000
    SupplyRandomArray[83]=80.5000000
    SupplyRandomArray[84]=97.5000000
    SupplyRandomArray[85]=7.5000000
    SupplyRandomArray[86]=69.5000000
    SupplyRandomArray[87]=44.5000000
    SupplyRandomArray[88]=27.5000000
    SupplyRandomArray[89]=4.0000000
    SupplyRandomArray[90]=50.5000000
    SupplyRandomArray[91]=40.0000000
    SupplyRandomArray[92]=75.5000000
    SupplyRandomArray[93]=7.0000000
    SupplyRandomArray[94]=60.5000000
    SupplyRandomArray[95]=45.5000000
    SupplyRandomArray[96]=98.5000000
    SupplyRandomArray[97]=45.5000000
    SupplyRandomArray[98]=99.0000000
    SupplyRandomArray[99]=46.5000000
    SupplyRandomArray[100]=55.0000000
    SupplyRandomArray[101]=9.5000000
    SupplyRandomArray[102]=65.5000000
    SupplyRandomArray[103]=43.0000000
    SupplyRandomArray[104]=63.0000000
    SupplyRandomArray[105]=33.0000000
    SupplyRandomArray[106]=82.0000000
    SupplyRandomArray[107]=35.5000000
    SupplyRandomArray[108]=37.5000000
    SupplyRandomArray[109]=44.5000000
    SupplyRandomArray[110]=59.0000000
    SupplyRandomArray[111]=58.5000000
    SupplyRandomArray[112]=66.0000000
    SupplyRandomArray[113]=19.5000000
    SupplyRandomArray[114]=29.0000000
    SupplyRandomArray[115]=50.0000000
    SupplyRandomArray[116]=58.0000000
    SupplyRandomArray[117]=44.0000000
    SupplyRandomArray[118]=66.5000000
    SupplyRandomArray[119]=76.5000000
    SupplyRandomArray[120]=43.5000000
    SupplyRandomArray[121]=94.5000000
    SupplyRandomArray[122]=49.5000000
    SupplyRandomArray[123]=1.0000000
    SupplyRandomArray[124]=65.5000000
    SupplyRandomArray[125]=31.5000000
    SupplyRandomArray[126]=40.5000000
    SupplyRandomArray[127]=56.0000000
    SupplyRandomArray[128]=44.0000000
    SupplyRandomArray[129]=27.0000000
    SupplyRandomArray[130]=61.0000000
    SupplyRandomArray[131]=35.5000000
    SupplyRandomArray[132]=15.5000000
    SupplyRandomArray[133]=40.5000000
    SupplyRandomArray[134]=5.0000000
    SupplyRandomArray[135]=71.5000000
    SupplyRandomArray[136]=81.0000000
    SupplyRandomArray[137]=87.5000000
    SupplyRandomArray[138]=88.0000000
    SupplyRandomArray[139]=40.0000000
    SupplyRandomArray[140]=52.5000000
    SupplyRandomArray[141]=88.5000000
    SupplyRandomArray[142]=91.5000000
    SupplyRandomArray[143]=44.5000000
    SupplyRandomArray[144]=77.0000000
    SupplyRandomArray[145]=59.0000000
    SupplyRandomArray[146]=65.0000000
    SupplyRandomArray[147]=4.5000000
    SupplyRandomArray[148]=20.0000000
    SupplyRandomArray[149]=67.0000000
    SupplyRandomArray[150]=4.0000000
    SupplyRandomArray[151]=15.0000000
    SupplyRandomArray[152]=8.5000000
    SupplyRandomArray[153]=66.0000000
    SupplyRandomArray[154]=14.5000000
    SupplyRandomArray[155]=37.0000000
    SupplyRandomArray[156]=76.0000000
    SupplyRandomArray[157]=52.0000000
    SupplyRandomArray[158]=94.0000000
    SupplyRandomArray[159]=69.0000000
    SupplyRandomArray[160]=8.5000000
    SupplyRandomArray[161]=57.5000000
    SupplyRandomArray[162]=71.0000000
    SupplyRandomArray[163]=67.5000000
    SupplyRandomArray[164]=1.5000000
    SupplyRandomArray[165]=14.0000000
    SupplyRandomArray[166]=60.5000000
    SupplyRandomArray[167]=54.0000000
    SupplyRandomArray[168]=95.0000000
    SupplyRandomArray[169]=81.5000000
    SupplyRandomArray[170]=30.0000000
    SupplyRandomArray[171]=8.0000000
    SupplyRandomArray[172]=3.5000000
    SupplyRandomArray[173]=33.0000000
    SupplyRandomArray[174]=4.0000000
    SupplyRandomArray[175]=98.0000000
    SupplyRandomArray[176]=91.5000000
    SupplyRandomArray[177]=83.5000000
    SupplyRandomArray[178]=29.0000000
    SupplyRandomArray[179]=47.0000000
    SupplyRandomArray[180]=22.0000000
    SupplyRandomArray[181]=85.0000000
    SupplyRandomArray[182]=60.0000000
    SupplyRandomArray[183]=34.0000000
    SupplyRandomArray[184]=31.0000000
    SupplyRandomArray[185]=76.5000000
    SupplyRandomArray[186]=79.0000000
    SupplyRandomArray[187]=15.5000000
    SupplyRandomArray[188]=41.0000000
    SupplyRandomArray[189]=26.5000000
    SupplyRandomArray[190]=84.0000000
    SupplyRandomArray[191]=93.0000000
    SupplyRandomArray[192]=36.0000000
    SupplyRandomArray[193]=11.5000000
    SupplyRandomArray[194]=73.0000000
    SupplyRandomArray[195]=26.5000000
    SupplyRandomArray[196]=11.0000000
    SupplyRandomArray[197]=63.5000000
    SupplyRandomArray[198]=96.0000000
    SupplyRandomArray[199]=50.5000000
    SupplyRandomArray[200]=24.0000000
    SupplyRandomArray[201]=8.0000000
    SupplyRandomArray[202]=54.0000000
    SupplyRandomArray[203]=3.0000000
    SupplyRandomArray[204]=1.0000000
    SupplyRandomArray[205]=57.0000000
    SupplyRandomArray[206]=61.5000000
    SupplyRandomArray[207]=73.0000000
    SupplyRandomArray[208]=16.0000000
    SupplyRandomArray[209]=94.5000000
    SupplyRandomArray[210]=10.5000000
    SupplyRandomArray[211]=31.0000000
    SupplyRandomArray[212]=5.0000000
    SupplyRandomArray[213]=78.0000000
    SupplyRandomArray[214]=90.0000000
    SupplyRandomArray[215]=11.0000000
    SupplyRandomArray[216]=39.0000000
    SupplyRandomArray[217]=6.0000000
    SupplyRandomArray[218]=17.0000000
    SupplyRandomArray[219]=72.5000000
    SupplyRandomArray[220]=86.0000000
    SupplyRandomArray[221]=11.0000000
    SupplyRandomArray[222]=84.5000000
    SupplyRandomArray[223]=87.5000000
    SupplyRandomArray[224]=28.5000000
    SupplyRandomArray[225]=24.0000000
    SupplyRandomArray[226]=21.0000000
    SupplyRandomArray[227]=16.5000000
    SupplyRandomArray[228]=57.0000000
    SupplyRandomArray[229]=53.5000000
    SupplyRandomArray[230]=39.5000000
    SupplyRandomArray[231]=30.5000000
    SupplyRandomArray[232]=68.0000000
    SupplyRandomArray[233]=63.5000000
    SupplyRandomArray[234]=17.0000000
    SupplyRandomArray[235]=81.5000000
    SupplyRandomArray[236]=99.5000000
    SupplyRandomArray[237]=87.0000000
    SupplyRandomArray[238]=83.0000000
    SupplyRandomArray[239]=61.0000000
    SupplyRandomArray[240]=18.5000000
    SupplyRandomArray[241]=28.0000000
    SupplyRandomArray[242]=91.0000000
    SupplyRandomArray[243]=76.0000000
    SupplyRandomArray[244]=23.5000000
    SupplyRandomArray[245]=94.0000000
    SupplyRandomArray[246]=72.5000000
    SupplyRandomArray[247]=52.0000000
    SupplyRandomArray[248]=37.0000000
    SupplyRandomArray[249]=82.0000000
    SupplyRandomArray[250]=71.0000000
    SupplyRandomArray[251]=89.0000000
    SupplyRandomArray[252]=3.0000000
    SupplyRandomArray[253]=54.5000000
    SupplyRandomArray[254]=64.0000000
    SupplyRandomArray[255]=34.5000000
    SupplyRandomArray[256]=11.5000000
    SupplyRandomArray[257]=63.5000000
    SupplyRandomArray[258]=21.0000000
    SupplyRandomArray[259]=91.0000000
    SupplyRandomArray[260]=66.5000000
    SupplyRandomArray[261]=45.0000000
    SupplyRandomArray[262]=2.0000000
    SupplyRandomArray[263]=13.0000000
    SupplyRandomArray[264]=39.0000000
    SupplyRandomArray[265]=65.0000000
    SupplyRandomArray[266]=95.5000000
    SupplyRandomArray[267]=62.0000000
    SupplyRandomArray[268]=32.5000000
    SupplyRandomArray[269]=72.0000000
    SupplyRandomArray[270]=5.5000000
    SupplyRandomArray[271]=17.5000000
    SupplyRandomArray[272]=77.5000000
    SupplyRandomArray[273]=26.0000000
    SupplyRandomArray[274]=32.0000000
    SupplyRandomArray[275]=64.5000000
    SupplyRandomArray[276]=74.0000000
    SupplyRandomArray[277]=70.5000000
    SupplyRandomArray[278]=5.5000000
    SupplyRandomArray[279]=60.5000000
    SupplyRandomArray[280]=13.0000000
    SupplyRandomArray[281]=53.5000000
    SupplyRandomArray[282]=68.0000000
    SupplyRandomArray[283]=67.0000000
    SupplyRandomArray[284]=19.0000000
    SupplyRandomArray[285]=68.5000000
    SupplyRandomArray[286]=15.0000000
    SupplyRandomArray[287]=68.5000000
    SupplyRandomArray[288]=63.0000000
    SupplyRandomArray[289]=23.5000000
    SupplyRandomArray[290]=51.0000000
    SupplyRandomArray[291]=96.5000000
    SupplyRandomArray[292]=21.5000000
    SupplyRandomArray[293]=56.5000000
    SupplyRandomArray[294]=9.5000000
    SupplyRandomArray[295]=63.0000000
    SupplyRandomArray[296]=74.5000000
    SupplyRandomArray[297]=78.0000000
    SupplyRandomArray[298]=23.5000000
    SupplyRandomArray[299]=78.5000000
    SupplyRandomArray[300]=90.0000000
    SupplyRandomArray[301]=25.0000000
    SupplyRandomArray[302]=59.5000000
    SupplyRandomArray[303]=0.5000000
    SupplyRandomArray[304]=77.5000000
    SupplyRandomArray[305]=5.0000000
    SupplyRandomArray[306]=89.0000000
    SupplyRandomArray[307]=12.0000000
    SupplyRandomArray[308]=72.5000000
    SupplyRandomArray[309]=74.0000000
    SupplyRandomArray[310]=60.0000000
    SupplyRandomArray[311]=96.5000000
    SupplyRandomArray[312]=89.5000000
    SupplyRandomArray[313]=49.0000000
    SupplyRandomArray[314]=66.0000000
    SupplyRandomArray[315]=99.5000000
    SupplyRandomArray[316]=51.0000000
    SupplyRandomArray[317]=10.0000000
    SupplyRandomArray[318]=6.0000000
    SupplyRandomArray[319]=22.0000000
    SupplyRandomArray[320]=93.0000000
    SupplyRandomArray[321]=60.0000000
    SupplyRandomArray[322]=26.0000000
    SupplyRandomArray[323]=13.5000000
    SupplyRandomArray[324]=62.0000000
    SupplyRandomArray[325]=54.0000000
    SupplyRandomArray[326]=86.0000000
    SupplyRandomArray[327]=80.5000000
    SupplyRandomArray[328]=20.5000000
    SupplyRandomArray[329]=25.5000000
    SupplyRandomArray[330]=97.5000000
    SupplyRandomArray[331]=92.5000000
    SupplyRandomArray[332]=89.0000000
    SupplyRandomArray[333]=12.5000000
    SupplyRandomArray[334]=7.5000000
    SupplyRandomArray[335]=12.0000000
    SupplyRandomArray[336]=9.0000000
    SupplyRandomArray[337]=32.5000000
    SupplyRandomArray[338]=46.0000000
    SupplyRandomArray[339]=98.0000000
    SupplyRandomArray[340]=37.5000000
    SupplyRandomArray[341]=71.0000000
    SupplyRandomArray[342]=19.0000000
    SupplyRandomArray[343]=80.0000000
    SupplyRandomArray[344]=41.0000000
    SupplyRandomArray[345]=98.5000000
    SupplyRandomArray[346]=33.5000000
    SupplyRandomArray[347]=69.0000000
    SupplyRandomArray[348]=51.5000000
    SupplyRandomArray[349]=48.5000000
    SupplyRandomArray[350]=91.5000000
    SupplyRandomArray[351]=59.0000000
    SupplyRandomArray[352]=37.5000000
    SupplyRandomArray[353]=3.5000000
    SupplyRandomArray[354]=41.0000000
    SupplyRandomArray[355]=16.0000000
    SupplyRandomArray[356]=42.5000000
    SupplyRandomArray[357]=64.5000000
    SupplyRandomArray[358]=57.0000000
    SupplyRandomArray[359]=35.0000000
    SupplyRandomArray[360]=29.5000000
    SupplyRandomArray[361]=32.0000000
    SupplyRandomArray[362]=36.0000000
    SupplyRandomArray[363]=81.0000000
    SupplyRandomArray[364]=55.0000000
    SupplyRandomArray[365]=12.0000000
    SupplyRandomArray[366]=35.0000000
    SupplyRandomArray[367]=49.5000000
    SupplyRandomArray[368]=38.5000000
    SupplyRandomArray[369]=17.5000000
    SupplyRandomArray[370]=34.0000000
    SupplyRandomArray[371]=79.5000000
    SupplyRandomArray[372]=74.0000000
    SupplyRandomArray[373]=98.0000000
    SupplyRandomArray[374]=2.5000000
    SupplyRandomArray[375]=83.0000000
    SupplyRandomArray[376]=42.0000000
    SupplyRandomArray[377]=93.5000000
    SupplyRandomArray[378]=64.0000000
    SupplyRandomArray[379]=85.5000000
    SupplyRandomArray[380]=53.0000000
    SupplyRandomArray[381]=76.0000000
    SupplyRandomArray[382]=12.5000000
    SupplyRandomArray[383]=38.0000000
    SupplyRandomArray[384]=61.0000000
    SupplyRandomArray[385]=78.5000000
    SupplyRandomArray[386]=39.0000000
    SupplyRandomArray[387]=71.5000000
    SupplyRandomArray[388]=25.5000000
    SupplyRandomArray[389]=87.0000000
    SupplyRandomArray[390]=45.0000000
    SupplyRandomArray[391]=42.5000000
    SupplyRandomArray[392]=20.0000000
    SupplyRandomArray[393]=93.0000000
    SupplyRandomArray[394]=47.0000000
    SupplyRandomArray[395]=4.5000000
    SupplyRandomArray[396]=96.0000000
    SupplyRandomArray[397]=78.0000000
    SupplyRandomArray[398]=33.0000000
    SupplyRandomArray[399]=52.0000000
    SupplyRandomArray[400]=24.0000000
    SupplyRandomArray[401]=76.5000000
    SupplyRandomArray[402]=23.0000000
    SupplyRandomArray[403]=55.5000000
    SupplyRandomArray[404]=42.0000000
    SupplyRandomArray[405]=79.0000000
    SupplyRandomArray[406]=85.0000000
    SupplyRandomArray[407]=10.5000000
    SupplyRandomArray[408]=23.0000000
    SupplyRandomArray[409]=44.0000000
    SupplyRandomArray[410]=58.5000000
    SupplyRandomArray[411]=49.0000000
    SupplyRandomArray[412]=31.5000000
    SupplyRandomArray[413]=28.5000000
    SupplyRandomArray[414]=29.5000000
    SupplyRandomArray[415]=28.5000000
    SupplyRandomArray[416]=53.5000000
    SupplyRandomArray[417]=37.0000000
    SupplyRandomArray[418]=10.0000000
    SupplyRandomArray[419]=89.5000000
    SupplyRandomArray[420]=18.0000000
    SupplyRandomArray[421]=34.5000000
    SupplyRandomArray[422]=19.5000000
    SupplyRandomArray[423]=58.0000000
    SupplyRandomArray[424]=31.0000000
    SupplyRandomArray[425]=42.5000000
    SupplyRandomArray[426]=86.0000000
    SupplyRandomArray[427]=22.0000000
    SupplyRandomArray[428]=27.0000000
    SupplyRandomArray[429]=79.5000000
    SupplyRandomArray[430]=69.0000000
    SupplyRandomArray[431]=92.5000000
    SupplyRandomArray[432]=16.0000000
    SupplyRandomArray[433]=56.5000000
    SupplyRandomArray[434]=86.5000000
    SupplyRandomArray[435]=46.5000000
    SupplyRandomArray[436]=74.5000000
    SupplyRandomArray[437]=17.5000000
    SupplyRandomArray[438]=21.5000000
    SupplyRandomArray[439]=51.0000000
    SupplyRandomArray[440]=84.5000000
    SupplyRandomArray[441]=82.5000000
    SupplyRandomArray[442]=72.0000000
    SupplyRandomArray[443]=49.5000000
    SupplyRandomArray[444]=19.0000000
    SupplyRandomArray[445]=1.5000000
    SupplyRandomArray[446]=38.5000000
    SupplyRandomArray[447]=47.0000000
    SupplyRandomArray[448]=86.5000000
    SupplyRandomArray[449]=92.0000000
    SupplyRandomArray[450]=70.0000000
    SupplyRandomArray[451]=38.0000000
    SupplyRandomArray[452]=40.0000000
    SupplyRandomArray[453]=66.5000000
    SupplyRandomArray[454]=1.5000000
    SupplyRandomArray[455]=53.0000000
    SupplyRandomArray[456]=13.0000000
    SupplyRandomArray[457]=12.5000000
    SupplyRandomArray[458]=49.0000000
    SupplyRandomArray[459]=10.0000000
    SupplyRandomArray[460]=15.5000000
    SupplyRandomArray[461]=90.5000000
    SupplyRandomArray[462]=26.0000000
    SupplyRandomArray[463]=84.0000000
    SupplyRandomArray[464]=28.0000000
    SupplyRandomArray[465]=90.5000000
    SupplyRandomArray[466]=61.5000000
    SupplyRandomArray[467]=27.5000000
    SupplyRandomArray[468]=14.5000000
    SupplyRandomArray[469]=75.0000000
    SupplyRandomArray[470]=92.0000000
    SupplyRandomArray[471]=67.5000000
    SupplyRandomArray[472]=75.5000000
    SupplyRandomArray[473]=89.5000000
    SupplyRandomArray[474]=73.5000000
    SupplyRandomArray[475]=2.5000000
    SupplyRandomArray[476]=7.0000000
    SupplyRandomArray[477]=55.0000000
    SupplyRandomArray[478]=73.5000000
    SupplyRandomArray[479]=27.0000000
    SupplyRandomArray[480]=20.5000000
    SupplyRandomArray[481]=77.0000000
    SupplyRandomArray[482]=30.0000000
    SupplyRandomArray[483]=75.0000000
    SupplyRandomArray[484]=59.5000000
    SupplyRandomArray[485]=84.0000000
    SupplyRandomArray[486]=50.0000000
    SupplyRandomArray[487]=39.5000000
    SupplyRandomArray[488]=3.0000000
    SupplyRandomArray[489]=90.0000000
    SupplyRandomArray[490]=81.0000000
    SupplyRandomArray[491]=20.0000000
    SupplyRandomArray[492]=10.5000000
    SupplyRandomArray[493]=35.0000000
    SupplyRandomArray[494]=64.5000000
    SupplyRandomArray[495]=56.0000000
    SupplyRandomArray[496]=3.5000000
    SupplyRandomArray[497]=86.5000000
    SupplyRandomArray[498]=93.5000000
    SupplyRandomArray[499]=41.5000000
    SupplyRandomArray[500]=2.0000000
    SupplyRandomArray[501]=68.5000000
    SupplyRandomArray[502]=46.5000000
    SupplyRandomArray[503]=72.0000000
    SupplyRandomArray[504]=70.0000000
    SupplyRandomArray[505]=0.5000000
    SupplyRandomArray[506]=24.5000000
    SupplyRandomArray[507]=97.0000000
    SupplyRandomArray[508]=9.0000000
    SupplyRandomArray[509]=30.0000000
    SupplyRandomArray[510]=59.5000000
    SupplyRandomArray[511]=97.0000000
    SupplyRandomArray[512]=82.5000000
    SupplyRandomArray[513]=62.5000000
    SupplyRandomArray[514]=36.5000000
    SupplyRandomArray[515]=52.5000000
    SupplyRandomArray[516]=94.5000000
    SupplyRandomArray[517]=31.5000000
    SupplyRandomArray[518]=61.5000000
    SupplyRandomArray[519]=56.5000000
    SupplyRandomArray[520]=14.0000000
    SupplyRandomArray[521]=77.5000000
    SupplyRandomArray[522]=6.0000000
    SupplyRandomArray[523]=74.5000000
    SupplyRandomArray[524]=36.5000000
    SupplyRandomArray[525]=97.0000000
    SupplyRandomArray[526]=67.5000000
    SupplyRandomArray[527]=4.5000000
    SupplyRandomArray[528]=92.0000000
    SupplyRandomArray[529]=64.0000000
    SupplyRandomArray[530]=33.5000000
    SupplyRandomArray[531]=39.5000000
    SupplyRandomArray[532]=58.0000000
    SupplyRandomArray[533]=48.5000000
    SupplyRandomArray[534]=29.0000000
    SupplyRandomArray[535]=78.5000000
    SupplyRandomArray[536]=25.0000000
    SupplyRandomArray[537]=18.0000000
    SupplyRandomArray[538]=57.5000000
    SupplyRandomArray[539]=51.5000000
    SupplyRandomArray[540]=17.0000000
    SupplyRandomArray[541]=18.5000000
    SupplyRandomArray[542]=25.5000000
    SupplyRandomArray[543]=38.5000000
    SupplyRandomArray[544]=47.5000000
    SupplyRandomArray[545]=13.5000000
    SupplyRandomArray[546]=2.0000000
    SupplyRandomArray[547]=46.0000000
    SupplyRandomArray[548]=80.0000000
    SupplyRandomArray[549]=83.5000000
    SupplyRandomArray[550]=7.0000000
    SupplyRandomArray[551]=56.0000000
    SupplyRandomArray[552]=14.5000000
    SupplyRandomArray[553]=24.5000000
    SupplyRandomArray[554]=58.5000000
    SupplyRandomArray[555]=69.5000000
    SupplyRandomArray[556]=62.5000000
    SupplyRandomArray[557]=75.0000000
    SupplyRandomArray[558]=22.5000000
    SupplyRandomArray[559]=75.5000000
    SupplyRandomArray[560]=79.5000000
    SupplyRandomArray[561]=11.5000000
    SupplyRandomArray[562]=52.5000000
    SupplyRandomArray[563]=62.0000000
    SupplyRandomArray[564]=70.5000000
    SupplyRandomArray[565]=88.0000000
    SupplyRandomArray[566]=45.0000000
    SupplyRandomArray[567]=22.5000000
    SupplyRandomArray[568]=18.0000000
    SupplyRandomArray[569]=36.0000000
    SupplyRandomArray[570]=71.5000000
    SupplyRandomArray[571]=65.5000000
    SupplyRandomArray[572]=32.0000000
    SupplyRandomArray[573]=57.5000000
    SupplyRandomArray[574]=70.5000000
    SupplyRandomArray[575]=55.5000000
    SupplyRandomArray[576]=34.5000000
    SupplyRandomArray[577]=98.5000000
    SupplyRandomArray[578]=0.5000000
    SupplyRandomArray[579]=73.0000000
    SupplyRandomArray[580]=99.0000000
    SupplyRandomArray[581]=62.5000000
    SupplyRandomArray[582]=34.0000000
    SupplyRandomArray[583]=95.5000000
    SupplyRandomArray[584]=73.5000000
    SupplyRandomArray[585]=19.5000000
    SupplyRandomArray[586]=82.5000000
    SupplyRandomArray[587]=93.5000000
    SupplyRandomArray[588]=51.5000000
    SupplyRandomArray[589]=30.5000000
    SupplyRandomArray[590]=15.0000000
    SupplyRandomArray[591]=21.0000000
    SupplyRandomArray[592]=23.0000000
    SupplyRandomArray[593]=77.0000000
    SupplyRandomArray[594]=87.5000000
    SupplyRandomArray[595]=46.0000000
    SupplyRandomArray[596]=65.0000000
    SupplyRandomArray[597]=83.5000000
    SupplyRandomArray[598]=99.5000000
    SupplyRandomArray[599]=38.0000000
    bUseRagdoll=true
    bUseGore=true
    bUseMouseRevision=true
    bUseStanceToggle=true
    kWebzenShopVer_Year=-1
    kWebzenShopVer_YearID=-1
    kWebzenShopVer_SalesZoneCode=-1
}