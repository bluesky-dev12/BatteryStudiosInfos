/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BTData\Classes\BTNetGameData.uc
 * Package Imports:
 *	BTData
 *	Core
 *
 * Stats:
 *	Structs:10
 *	Properties:9
 *	Functions:22
 *
 *******************************************************************************/
class BTNetGameData extends Object
    native;

struct native export BT_ItemShop_PriceInfo
{
    var int nPeriodNum;
    var int nCashPrice;
    var int nPointPrice;
};

struct native export BT_ItemShopInfo
{
    var int nItemID;
    var string sDispNm;
    var int bEquipLimitUserLevel;
    var byte bEquipTeam;
    var byte bEquipSlot;
    var byte bOverlap;
    var string sAddPartGreoupID;
    var float fOptVal1;
    var float fOptVal2;
    var byte bCostType;
    var float fRepairCost;
    var int nDurWeight;
    var byte bShop;
    var int nSellStart;
    var int nSellEnd;
    var int bIsSell;
    var int nSellPrice;
    var BT_ItemShop_PriceInfo PriceInfo[5];
    var int bIsAuction;
    var int nMaxPriceInAuction;
    var byte bType;
    var byte bGrade;
};

struct native export BT_WeaponInfo
{
    var int nItemID;
    var byte bFireMode;
    var byte bWeaponShortcut;
    var byte bDamageType;
    var byte bAimFire;
    var float fFireRate;
    var float fFireDelay;
    var float fMeleeDelay;
    var float fZoom1;
    var float fZoom2;
    var byte bBulletType;
    var int wBulletCount;
    var float fProjectileSpeed;
    var byte bBulletImpactExplode;
    var byte bProjectileTakeDamage;
    var float fBulletBoundDecel;
    var float fBulletThrowRotate;
    var float fBulletThreadAnglee;
    var int nBombingWeaponID;
    var float fFuseTime;
    var float fActiveTime;
    var float fMomentum;
    var float fMomentumChar;
    var float fGoreDamageOuter;
    var float fGoreDamage;
    var float fDamageOuter;
    var float fDamage;
    var float fDamageEffectiveRange;
    var float fDamageOuterRange;
    var float fPartsDamageHead;
    var float fPartsDamageUpperTorso;
    var float fPartsDamageUpperArm;
    var float fPartsDamageLowerArm;
    var float fPartsDamageUpperLeg;
    var float fPartsDamageLowerLeg;
    var byte bHitEffectFriendly;
    var float fHitGunKick;
    var float fHitViewFlashTime;
    var float fHitFireTime;
    var float fMeleeDamage;
    var byte bReloadType;
    var byte bRechamber;
    var float fAniTimeRechamber;
    var float fAniTimeReload;
    var float fAniTimeReloadEmpty;
    var float fAniTimeReloadStart;
    var float fAniTimeReloadEnd;
    var float fExplosionInnerRadius;
    var float fExplosionOuterRadius;
    var float fExplosionRumbleRadius;
    var float fExplosionInnerDamage;
    var float fExplosionOuterDamage;
    var int nStartAmmo;
    var int nClipSize;
    var int nReloadAmmo;
    var int nMaxAmmo;
    var float fSpreadStandMin;
    var float fSpreadStandMax;
    var float fSpreadDuckedMin;
    var float fSpreadDuckedMax;
    var float fSpreadProneMin;
    var float fSpreadProneMax;
    var float fSpreadMoveAdd;
    var float fSpreadFireAdd;
    var float fSpreadOutSpeed;
    var float fSpreadStandInRt;
    var float fSpreadDuckedInRt;
    var float fSpreadProneInRt;
    var float fViewKickHipXMin;
    var float fViewKickHipXMax;
    var float fViewKickHipYMin;
    var float fViewKickHipYMax;
    var float fViewKickHipAccel;
    var float fViewKickHipDecel;
    var float fViewKickHipStayTime;
    var float fViewKickHipDecaySpeed;
    var float fViewKickAdsXMin;
    var float fViewKickAdsXMax;
    var float fViewKickAdsYMin;
    var float fViewKickAdsYMax;
    var float fViewKickAdsAccel;
    var float fViewKickAdsDecel;
    var float fViewKickAdsStayTime;
    var float fViewKickAdsDecaySpeed;
    var float fBreathStandGun;
    var float fBreathStandGunSpeed;
    var float fBobSprintGun;
    var float fBobSprintView;
    var float fBreathAdsGunAim;
    var float fBreathAdsGunAimSpeed;
    var float fBreathAdsDuckedGunAim;
    var float fBreathAdsDuckedGunAimSpeed;
    var float fBreathAdsProneGunAim;
    var float fBreathAdsProneGunAimSpeed;
    var float fBobAdsMoveGunAim;
    var float fBobAdsMoveView;
    var float fBobHipMoveGun;
    var float fBobHipMoveView;
    var float fBobHipDuckedMoveGun;
    var float fBobHipDuckedMoveView;
    var float fBobHipProneMoveView;
    var float fWpSprintStaStat;
    var float fWpSprintMove;
    var float fWpStandMove;
    var float fWpCrouchMove;
    var float fWpProneMove;
    var float fWpAimMove;
    var float fWpCrouchAimMove;
    var float fAniRateDrop;
    var float fAniRateRaise;
    var float fAniRateSprintRaise;
    var float fAniRateAdsOn;
    var float fAniRateAdsOff;
    var float fSwayGunHipXMaxAngle;
    var float fSwayGunHiipXMoveAngle;
    var float fSwayGunHipXMove;
    var float fSwayGunHipYMaxAngle;
    var float fSwayGunHipYMoveAngle;
    var float fSwayGunHipYMove;
    var float fSwayGunAdsXMaxAngle;
    var float fSwayGunAdsXMoveAngle;
    var float fSwayGunAdsXMove;
    var float fSwayGunAdsYMaxAngle;
    var float fSwayGunAdsYMoveAngle;
    var float fSwayGunAdsYMove;
    var float fViewAnglePitchMax;
    var float fGunPosHipMoveFrontY;
    var float fGunPosHipMoveFrontX;
    var int nUIDamage;
    var int nUISpread;
    var int nUIViewKick;
    var int nUIFireRate;
    var int nUIMove;
    var int nUIRange;
    var int nProjectileMoveType;
    var float fPartsDamageHeli;
    var float fSpreadJump;
    var float fViewKickHipDecayTimeFast;
    var float fViewKickAdsDecayTimeFast;
};

struct native export BT_Skill
{
    var int mSkillID;
    var string mSkillName;
    var byte mSKillSection;
    var byte mSkillType;
    var int mPrecedingSkillID;
};

struct native export BT_PartsGroup
{
    var int nPartID;
    var string sPartGroupID;
    var string sPartName;
    var int nDispNum;
    var int nSSID;
    var int nSilencerID;
    var int nCamoID;
    var int nPaintID;
    var float fSightAimDiffX;
    var float fSightAimDiffY;
    var float fSightAimDiffZ;
    var float fDurWeight;
    var int nSkillID;
    var int nUIDamageRange;
    var int nUIFireSound;
    var int nUIDurability;
    var string sZoom1;
    var string sZoom2;
};

struct native export BT_Promotion
{
    var int nLevel;
    var string sAcquieItem;
    var int nPartID;
};

struct native export BT_ItemBox
{
    var int nItemBoxID;
    var int nItemCount;
    var int nItemID[20];
    var int nPartID[20];
};

struct native export BT_LevelInfo
{
    var string sLevelName;
    var int nLevel;
    var int nUpperExp;
    var string sClassfy;
};

struct native export BT_GameMapInfo
{
    var int nIdx;
    var int nMapID;
    var string sMapNm;
    var float fSupHealth;
    var float fSupHeli;
    var float fSupBomb;
    var float fSupUAV;
    var int nModFFA;
    var int nModFFAMax;
    var int nModTDM;
    var int nModTDMMax;
    var int nModSD;
    var int nModSDMax;
    var int nModDOM;
    var int nModDOMMax;
    var int nModSab;
    var int nModSabMax;
};

struct native export BT_PaintGroup
{
    var int nPaintingID;
    var string sPaintingGroupID;
    var int nPaintingNum;
    var int nPaintingItemID;
    var int nPointPrice;
    var int nCashPrice;
    var int nRepairCost;
    var int nUIDuirability;
};

var array<BT_ItemShopInfo> NetItemShopInfoList;
var array<BT_WeaponInfo> NetWeaponInfoList;
var array<BT_Skill> NetSkillInfoList;
var array<BT_PartsGroup> NetPartsGroupList;
var array<BT_Promotion> NetPromotionList;
var array<BT_ItemBox> NetItemBoxList;
var array<BT_LevelInfo> NetLevelInfoList;
var array<BT_GameMapInfo> NetGameMapInfoList;
var array<BT_PaintGroup> NetPaintGroupList;

// Export UBTNetGameData::execLoadAddPaintGroupParams(FFrame&, void* const)
native function bool LoadAddPaintGroupParams();
// Export UBTNetGameData::execLoadAllData(FFrame&, void* const)
native function bool LoadAllData();
// Export UBTNetGameData::execgetData(FFrame&, void* const)
native function string getData(string category, string key, int iIndex);
// Export UBTNetGameData::execLoadWeaponRes(FFrame&, void* const)
native function bool LoadWeaponRes();
// Export UBTNetGameData::execLoadWeaponParams(FFrame&, void* const)
native function bool LoadWeaponParams();
// Export UBTNetGameData::execLoadWeaponRecoilParams(FFrame&, void* const)
native function bool LoadWeaponRecoilParams();
// Export UBTNetGameData::execLoadItemParams(FFrame&, void* const)
native function bool LoadItemParams();
// Export UBTNetGameData::execLoadItemResourceParams(FFrame&, void* const)
native function bool LoadItemResourceParams();
// Export UBTNetGameData::execLoadSkillParams(FFrame&, void* const)
native function bool LoadSkillParams();
// Export UBTNetGameData::execLoadAddPartsGroupParams(FFrame&, void* const)
native function bool LoadAddPartsGroupParams();
// Export UBTNetGameData::execLoadPromotionParams(FFrame&, void* const)
native function bool LoadPromotionParams();
// Export UBTNetGameData::execLoadPaintGroupParams(FFrame&, void* const)
native function bool LoadPaintGroupParams();
// Export UBTNetGameData::execLoadQuestParams(FFrame&, void* const)
native function bool LoadQuestParams();
// Export UBTNetGameData::execLoadRandBoxParams(FFrame&, void* const)
native function bool LoadRandBoxParams();
// Export UBTNetGameData::execLoadDailyQuestParams(FFrame&, void* const)
native function bool LoadDailyQuestParams();
// Export UBTNetGameData::execLoadClanMarkParams(FFrame&, void* const)
native function bool LoadClanMarkParams();
// Export UBTNetGameData::execLoadItemBoxParams(FFrame&, void* const)
native function bool LoadItemBoxParams();
// Export UBTNetGameData::execLoadLevelInfoParams(FFrame&, void* const)
native function bool LoadLevelInfoParams();
// Export UBTNetGameData::execLoadClanLevelInfoParams(FFrame&, void* const)
native function bool LoadClanLevelInfoParams();
// Export UBTNetGameData::execLoadSupplyRandomTable(FFrame&, void* const)
native function bool LoadSupplyRandomTable();
// Export UBTNetGameData::execLoadModeDOAParams(FFrame&, void* const)
native function bool LoadModeDOAParams();
function ClearNetData()
{
    NetItemShopInfoList.Remove(0, NetItemShopInfoList.Length);
    NetWeaponInfoList.Remove(0, NetWeaponInfoList.Length);
    NetSkillInfoList.Remove(0, NetSkillInfoList.Length);
    NetPartsGroupList.Remove(0, NetPartsGroupList.Length);
    NetPromotionList.Remove(0, NetPromotionList.Length);
    NetItemBoxList.Remove(0, NetItemBoxList.Length);
    NetLevelInfoList.Remove(0, NetLevelInfoList.Length);
    NetGameMapInfoList.Remove(0, NetGameMapInfoList.Length);
}
