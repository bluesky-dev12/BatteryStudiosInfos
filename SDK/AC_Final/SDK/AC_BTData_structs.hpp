#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct BTData.BTNetGameData.BT_ItemShop_PriceInfo
// 0x000C
struct FBT_ItemShop_PriceInfo
{
	int                                                nPeriodNum;                                               // 0x0000(0x0004)
	int                                                nCashPrice;                                               // 0x0004(0x0004)
	int                                                nPointPrice;                                              // 0x0008(0x0004)
};

// Struct BTData.BTNetGameData.BT_ItemShopInfo
// 0x0094
struct FBT_ItemShopInfo
{
	int                                                nItemID;                                                  // 0x0000(0x0004)
	string                                             sDispNm;                                                  // 0x0004(0x000C) (NeedCtorLink)
	int                                                bEquipLimitUserLevel;                                     // 0x0010(0x0004)
	byte                                               bEquipTeam;                                               // 0x0014(0x0001)
	byte                                               bEquipSlot;                                               // 0x0015(0x0001)
	byte                                               bOverlap;                                                 // 0x0016(0x0001)
	byte                                               Padding00[0x1];                                           // 0x0017(0x0001) MISSED OFFSET
	string                                             sAddPartGreoupID;                                         // 0x0018(0x000C) (NeedCtorLink)
	float                                              fOptVal1;                                                 // 0x0024(0x0004)
	float                                              fOptVal2;                                                 // 0x0028(0x0004)
	byte                                               bCostType;                                                // 0x002C(0x0001)
	byte                                               Padding01[0x3];                                           // 0x002D(0x0003) MISSED OFFSET
	float                                              fRepairCost;                                              // 0x0030(0x0004)
	int                                                nDurWeight;                                               // 0x0034(0x0004)
	byte                                               bShop;                                                    // 0x0038(0x0001)
	byte                                               Padding02[0x3];                                           // 0x0039(0x0003) MISSED OFFSET
	int                                                nSellStart;                                               // 0x003C(0x0004)
	int                                                nSellEnd;                                                 // 0x0040(0x0004)
	int                                                bIsSell;                                                  // 0x0044(0x0004)
	int                                                nSellPrice;                                               // 0x0048(0x0004)
	struct FBT_ItemShop_PriceInfo                      PriceInfo[0x5];                                           // 0x004C(0x000C)
	int                                                bIsAuction;                                               // 0x0088(0x0004)
	int                                                nMaxPriceInAuction;                                       // 0x008C(0x0004)
	byte                                               bType;                                                    // 0x0090(0x0001)
	byte                                               bGrade;                                                   // 0x0091(0x0001)
	byte                                               Padding03[0x2];                                           // 0x0092(0x0002) MISSED OFFSET
};

// Struct BTData.BTNetGameData.BT_WeaponInfo
// 0x021C
struct FBT_WeaponInfo
{
	int                                                nItemID;                                                  // 0x0000(0x0004)
	byte                                               bFireMode;                                                // 0x0004(0x0001)
	byte                                               bWeaponShortcut;                                          // 0x0005(0x0001)
	byte                                               bDamageType;                                              // 0x0006(0x0001)
	byte                                               bAimFire;                                                 // 0x0007(0x0001)
	float                                              fFireRate;                                                // 0x0008(0x0004)
	float                                              fFireDelay;                                               // 0x000C(0x0004)
	float                                              fMeleeDelay;                                              // 0x0010(0x0004)
	float                                              fZoom1;                                                   // 0x0014(0x0004)
	float                                              fZoom2;                                                   // 0x0018(0x0004)
	byte                                               bBulletType;                                              // 0x001C(0x0001)
	byte                                               Padding00[0x3];                                           // 0x001D(0x0003) MISSED OFFSET
	int                                                wBulletCount;                                             // 0x0020(0x0004)
	float                                              fProjectileSpeed;                                         // 0x0024(0x0004)
	byte                                               bBulletImpactExplode;                                     // 0x0028(0x0001)
	byte                                               bProjectileTakeDamage;                                    // 0x0029(0x0001)
	byte                                               Padding01[0x2];                                           // 0x002A(0x0002) MISSED OFFSET
	float                                              fBulletBoundDecel;                                        // 0x002C(0x0004)
	float                                              fBulletThrowRotate;                                       // 0x0030(0x0004)
	float                                              fBulletThreadAnglee;                                      // 0x0034(0x0004)
	int                                                nBombingWeaponID;                                         // 0x0038(0x0004)
	float                                              fFuseTime;                                                // 0x003C(0x0004)
	byte                                               bFuseImpactTime;                                          // 0x0040(0x0001)
	byte                                               Padding02[0x3];                                           // 0x0041(0x0003) MISSED OFFSET
	float                                              fActiveTime;                                              // 0x0044(0x0004)
	float                                              fMomentum;                                                // 0x0048(0x0004)
	float                                              fMomentumChar;                                            // 0x004C(0x0004)
	float                                              fGoreDamageOuter;                                         // 0x0050(0x0004)
	float                                              fGoreDamage;                                              // 0x0054(0x0004)
	float                                              fDamageOuter;                                             // 0x0058(0x0004)
	float                                              fDamage;                                                  // 0x005C(0x0004)
	float                                              fDamageEffectiveRange;                                    // 0x0060(0x0004)
	float                                              fDamageOuterRange;                                        // 0x0064(0x0004)
	float                                              fPartsDamageHead;                                         // 0x0068(0x0004)
	float                                              fPartsDamageUpperTorso;                                   // 0x006C(0x0004)
	float                                              fPartsDamageUpperArm;                                     // 0x0070(0x0004)
	float                                              fPartsDamageLowerArm;                                     // 0x0074(0x0004)
	float                                              fPartsDamageUpperLeg;                                     // 0x0078(0x0004)
	float                                              fPartsDamageLowerLeg;                                     // 0x007C(0x0004)
	byte                                               bHitEffectFriendly;                                       // 0x0080(0x0001)
	byte                                               Padding03[0x3];                                           // 0x0081(0x0003) MISSED OFFSET
	float                                              fHitGunKick;                                              // 0x0084(0x0004)
	float                                              fHitViewFlashTime;                                        // 0x0088(0x0004)
	float                                              fHitFireTime;                                             // 0x008C(0x0004)
	float                                              fMeleeDamage;                                             // 0x0090(0x0004)
	byte                                               bReloadType;                                              // 0x0094(0x0001)
	byte                                               bRechamber;                                               // 0x0095(0x0001)
	byte                                               Padding04[0x2];                                           // 0x0096(0x0002) MISSED OFFSET
	float                                              fAniTimeRechamber;                                        // 0x0098(0x0004)
	float                                              fAniTimeReload;                                           // 0x009C(0x0004)
	float                                              fAniTimeReloadEmpty;                                      // 0x00A0(0x0004)
	float                                              fAniTimeReloadStart;                                      // 0x00A4(0x0004)
	float                                              fAniTimeReloadEnd;                                        // 0x00A8(0x0004)
	float                                              fExplosionInnerRadius;                                    // 0x00AC(0x0004)
	float                                              fExplosionOuterRadius;                                    // 0x00B0(0x0004)
	float                                              fExplosionRumbleRadius;                                   // 0x00B4(0x0004)
	float                                              fExplosionInnerDamage;                                    // 0x00B8(0x0004)
	float                                              fExplosionOuterDamage;                                    // 0x00BC(0x0004)
	int                                                nStartAmmo;                                               // 0x00C0(0x0004)
	int                                                nClipSize;                                                // 0x00C4(0x0004)
	int                                                nReloadAmmo;                                              // 0x00C8(0x0004)
	int                                                nMaxAmmo;                                                 // 0x00CC(0x0004)
	float                                              fSpreadStandMin;                                          // 0x00D0(0x0004)
	float                                              fSpreadStandMax;                                          // 0x00D4(0x0004)
	float                                              fSpreadDuckedMin;                                         // 0x00D8(0x0004)
	float                                              fSpreadDuckedMax;                                         // 0x00DC(0x0004)
	float                                              fSpreadProneMin;                                          // 0x00E0(0x0004)
	float                                              fSpreadProneMax;                                          // 0x00E4(0x0004)
	float                                              fSpreadMoveAdd;                                           // 0x00E8(0x0004)
	float                                              fSpreadFireAdd;                                           // 0x00EC(0x0004)
	float                                              fSpreadOutSpeed;                                          // 0x00F0(0x0004)
	float                                              fSpreadStandInRt;                                         // 0x00F4(0x0004)
	float                                              fSpreadDuckedInRt;                                        // 0x00F8(0x0004)
	float                                              fSpreadProneInRt;                                         // 0x00FC(0x0004)
	float                                              fViewKickHipXMin;                                         // 0x0100(0x0004)
	float                                              fViewKickHipXMax;                                         // 0x0104(0x0004)
	float                                              fViewKickHipYMin;                                         // 0x0108(0x0004)
	float                                              fViewKickHipYMax;                                         // 0x010C(0x0004)
	float                                              fViewKickHipAccel;                                        // 0x0110(0x0004)
	float                                              fViewKickHipDecel;                                        // 0x0114(0x0004)
	float                                              fViewKickHipStayTime;                                     // 0x0118(0x0004)
	float                                              fViewKickHipDecaySpeed;                                   // 0x011C(0x0004)
	float                                              fViewKickAdsXMin;                                         // 0x0120(0x0004)
	float                                              fViewKickAdsXMax;                                         // 0x0124(0x0004)
	float                                              fViewKickAdsYMin;                                         // 0x0128(0x0004)
	float                                              fViewKickAdsYMax;                                         // 0x012C(0x0004)
	float                                              fViewKickAdsAccel;                                        // 0x0130(0x0004)
	float                                              fViewKickAdsDecel;                                        // 0x0134(0x0004)
	float                                              fViewKickAdsStayTime;                                     // 0x0138(0x0004)
	float                                              fViewKickAdsDecaySpeed;                                   // 0x013C(0x0004)
	float                                              fBreathStandGun;                                          // 0x0140(0x0004)
	float                                              fBreathStandGunSpeed;                                     // 0x0144(0x0004)
	float                                              fBobSprintGun;                                            // 0x0148(0x0004)
	float                                              fBobSprintView;                                           // 0x014C(0x0004)
	float                                              fBreathAdsGunAim;                                         // 0x0150(0x0004)
	float                                              fBreathAdsGunAimSpeed;                                    // 0x0154(0x0004)
	float                                              fBreathAdsDuckedGunAim;                                   // 0x0158(0x0004)
	float                                              fBreathAdsDuckedGunAimSpeed;                              // 0x015C(0x0004)
	float                                              fBreathAdsProneGunAim;                                    // 0x0160(0x0004)
	float                                              fBreathAdsProneGunAimSpeed;                               // 0x0164(0x0004)
	float                                              fBobAdsMoveGunAim;                                        // 0x0168(0x0004)
	float                                              fBobAdsMoveView;                                          // 0x016C(0x0004)
	float                                              fBobHipMoveGun;                                           // 0x0170(0x0004)
	float                                              fBobHipMoveView;                                          // 0x0174(0x0004)
	float                                              fBobHipDuckedMoveGun;                                     // 0x0178(0x0004)
	float                                              fBobHipDuckedMoveView;                                    // 0x017C(0x0004)
	float                                              fBobHipProneMoveView;                                     // 0x0180(0x0004)
	float                                              fWpSprintStaStat;                                         // 0x0184(0x0004)
	float                                              fWpSprintMove;                                            // 0x0188(0x0004)
	float                                              fWpStandMove;                                             // 0x018C(0x0004)
	float                                              fWpCrouchMove;                                            // 0x0190(0x0004)
	float                                              fWpProneMove;                                             // 0x0194(0x0004)
	float                                              fWpAimMove;                                               // 0x0198(0x0004)
	float                                              fWpCrouchAimMove;                                         // 0x019C(0x0004)
	float                                              fAniRateDrop;                                             // 0x01A0(0x0004)
	float                                              fAniRateRaise;                                            // 0x01A4(0x0004)
	float                                              fAniRateSprintRaise;                                      // 0x01A8(0x0004)
	float                                              fAniRateAdsOn;                                            // 0x01AC(0x0004)
	float                                              fAniRateAdsOff;                                           // 0x01B0(0x0004)
	float                                              fSwayGunHipXMaxAngle;                                     // 0x01B4(0x0004)
	float                                              fSwayGunHiipXMoveAngle;                                   // 0x01B8(0x0004)
	float                                              fSwayGunHipXMove;                                         // 0x01BC(0x0004)
	float                                              fSwayGunHipYMaxAngle;                                     // 0x01C0(0x0004)
	float                                              fSwayGunHipYMoveAngle;                                    // 0x01C4(0x0004)
	float                                              fSwayGunHipYMove;                                         // 0x01C8(0x0004)
	float                                              fSwayGunAdsXMaxAngle;                                     // 0x01CC(0x0004)
	float                                              fSwayGunAdsXMoveAngle;                                    // 0x01D0(0x0004)
	float                                              fSwayGunAdsXMove;                                         // 0x01D4(0x0004)
	float                                              fSwayGunAdsYMaxAngle;                                     // 0x01D8(0x0004)
	float                                              fSwayGunAdsYMoveAngle;                                    // 0x01DC(0x0004)
	float                                              fSwayGunAdsYMove;                                         // 0x01E0(0x0004)
	float                                              fViewAnglePitchMax;                                       // 0x01E4(0x0004)
	float                                              fGunPosHipMoveFrontY;                                     // 0x01E8(0x0004)
	float                                              fGunPosHipMoveFrontX;                                     // 0x01EC(0x0004)
	int                                                nUIDamage;                                                // 0x01F0(0x0004)
	int                                                nUISpread;                                                // 0x01F4(0x0004)
	int                                                nUIViewKick;                                              // 0x01F8(0x0004)
	int                                                nUIFireRate;                                              // 0x01FC(0x0004)
	int                                                nUIMove;                                                  // 0x0200(0x0004)
	int                                                nUIRange;                                                 // 0x0204(0x0004)
	int                                                nProjectileMoveType;                                      // 0x0208(0x0004)
	float                                              fPartsDamageHeli;                                         // 0x020C(0x0004)
	float                                              fSpreadJump;                                              // 0x0210(0x0004)
	float                                              fViewKickHipDecayTimeFast;                                // 0x0214(0x0004)
	float                                              fViewKickAdsDecayTimeFast;                                // 0x0218(0x0004)
};

// Struct BTData.BTNetGameData.BT_Skill
// 0x0018
struct FBT_Skill
{
	int                                                mSkillID;                                                 // 0x0000(0x0004)
	string                                             mSkillName;                                               // 0x0004(0x000C) (NeedCtorLink)
	byte                                               mSKillSection;                                            // 0x0010(0x0001)
	byte                                               mSkillType;                                               // 0x0011(0x0001)
	byte                                               Padding00[0x2];                                           // 0x0012(0x0002) MISSED OFFSET
	int                                                mPrecedingSkillID;                                        // 0x0014(0x0004)
};

// Struct BTData.BTNetGameData.BT_PartsGroup
// 0x0068
struct FBT_PartsGroup
{
	int                                                nPartID;                                                  // 0x0000(0x0004)
	string                                             sPartGroupID;                                             // 0x0004(0x000C) (NeedCtorLink)
	string                                             sPartName;                                                // 0x0010(0x000C) (NeedCtorLink)
	int                                                nDispNum;                                                 // 0x001C(0x0004)
	int                                                nSSID;                                                    // 0x0020(0x0004)
	int                                                nSilencerID;                                              // 0x0024(0x0004)
	int                                                nCamoID;                                                  // 0x0028(0x0004)
	int                                                nPaintID;                                                 // 0x002C(0x0004)
	float                                              fSightAimDiffX;                                           // 0x0030(0x0004)
	float                                              fSightAimDiffY;                                           // 0x0034(0x0004)
	float                                              fSightAimDiffZ;                                           // 0x0038(0x0004)
	float                                              fDurWeight;                                               // 0x003C(0x0004)
	int                                                nSkillID;                                                 // 0x0040(0x0004)
	int                                                nUIDamageRange;                                           // 0x0044(0x0004)
	int                                                nUIFireSound;                                             // 0x0048(0x0004)
	int                                                nUIDurability;                                            // 0x004C(0x0004)
	string                                             sZoom1;                                                   // 0x0050(0x000C) (NeedCtorLink)
	string                                             sZoom2;                                                   // 0x005C(0x000C) (NeedCtorLink)
};

// Struct BTData.BTNetGameData.BT_Promotion
// 0x0014
struct FBT_Promotion
{
	int                                                nLevel;                                                   // 0x0000(0x0004)
	string                                             sAcquieItem;                                              // 0x0004(0x000C) (NeedCtorLink)
	int                                                nPartID;                                                  // 0x0010(0x0004)
};

// Struct BTData.BTNetGameData.BT_ItemBox
// 0x00A8
struct FBT_ItemBox
{
	int                                                nItemBoxID;                                               // 0x0000(0x0004)
	int                                                nItemCount;                                               // 0x0004(0x0004)
	int                                                nItemID[0x14];                                            // 0x0008(0x0004)
	int                                                nPartID[0x14];                                            // 0x0058(0x0004)
};

// Struct BTData.BTNetGameData.BT_LevelInfo
// 0x0020
struct FBT_LevelInfo
{
	string                                             sLevelName;                                               // 0x0000(0x000C) (NeedCtorLink)
	int                                                nLevel;                                                   // 0x000C(0x0004)
	int                                                nUpperExp;                                                // 0x0010(0x0004)
	string                                             sClassfy;                                                 // 0x0014(0x000C) (NeedCtorLink)
};

// Struct BTData.BTNetGameData.BT_GameMapInfo
// 0x004C
struct FBT_GameMapInfo
{
	int                                                nIdx;                                                     // 0x0000(0x0004)
	int                                                nMapID;                                                   // 0x0004(0x0004)
	string                                             sMapNm;                                                   // 0x0008(0x000C) (NeedCtorLink)
	float                                              fSupHealth;                                               // 0x0014(0x0004)
	float                                              fSupHeli;                                                 // 0x0018(0x0004)
	float                                              fSupBomb;                                                 // 0x001C(0x0004)
	float                                              fSupUAV;                                                  // 0x0020(0x0004)
	int                                                nModFFA;                                                  // 0x0024(0x0004)
	int                                                nModFFAMax;                                               // 0x0028(0x0004)
	int                                                nModTDM;                                                  // 0x002C(0x0004)
	int                                                nModTDMMax;                                               // 0x0030(0x0004)
	int                                                nModSD;                                                   // 0x0034(0x0004)
	int                                                nModSDMax;                                                // 0x0038(0x0004)
	int                                                nModDOM;                                                  // 0x003C(0x0004)
	int                                                nModDOMMax;                                               // 0x0040(0x0004)
	int                                                nModSab;                                                  // 0x0044(0x0004)
	int                                                nModSabMax;                                               // 0x0048(0x0004)
};

// Struct BTData.BTNetGameData.BT_PaintGroup
// 0x0028
struct FBT_PaintGroup
{
	int                                                nPaintingID;                                              // 0x0000(0x0004)
	string                                             sPaintingGroupID;                                         // 0x0004(0x000C) (NeedCtorLink)
	int                                                nPaintingNum;                                             // 0x0010(0x0004)
	int                                                nPaintingItemID;                                          // 0x0014(0x0004)
	int                                                nPointPrice;                                              // 0x0018(0x0004)
	int                                                nCashPrice;                                               // 0x001C(0x0004)
	int                                                nRepairCost;                                              // 0x0020(0x0004)
	int                                                nUIDuirability;                                           // 0x0024(0x0004)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
