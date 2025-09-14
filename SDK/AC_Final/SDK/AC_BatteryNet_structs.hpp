#pragma once

// Artic Combat (3369) SDK

#ifdef _MSC_VER
	#pragma pack(push, 0x4)
#endif

namespace Classes
{
//---------------------------------------------------------------------------
//Enums
//---------------------------------------------------------------------------

// Enum BatteryNet.BTNatDiag.NAT_TYPE
enum class ENAT_TYPE : uint8_t
{
	NAT_FULL_CONE                  = 0,
	NAT_RESTRICTED_CONE            = 1,
	NAT_PORT_RESTRICTED_CONE       = 2,
	NAT_SYMMETRIC_CONE             = 3
};



//---------------------------------------------------------------------------
//Script Structs
//---------------------------------------------------------------------------

// Struct BatteryNet.BTTcpLink_Channel.SystemMsgParam
// 0x0024
struct FSystemMsgParam
{
	int                                                MsgCode;                                                  // 0x0000(0x0004)
	string                                             CharName;                                                 // 0x0004(0x000C) (NeedCtorLink)
	int                                                ServerID;                                                 // 0x0010(0x0004)
	int                                                ChannelNum;                                               // 0x0014(0x0004)
	int                                                CharLevel;                                                // 0x0018(0x0004)
	int                                                ItemID;                                                   // 0x001C(0x0004)
	int                                                Point;                                                    // 0x0020(0x0004)
};

// Struct BatteryNet.BTTcpLink_Channel.CharInfo
// 0x00C0
struct FCharInfo
{
	int                                                Level;                                                    // 0x0000(0x0004)
	int                                                Exp;                                                      // 0x0004(0x0004)
	int                                                Stamina;                                                  // 0x0008(0x0004)
	int                                                HP;                                                       // 0x000C(0x0004)
	int                                                PrevRanking;                                              // 0x0010(0x0004)
	int                                                Ranking;                                                  // 0x0014(0x0004)
	int                                                PrevHeadShotRanking;                                      // 0x0018(0x0004)
	int                                                HeadShotRanking;                                          // 0x001C(0x0004)
	int                                                PrevWomanRanking;                                         // 0x0020(0x0004)
	int                                                WomanRanking;                                             // 0x0024(0x0004)
	int                                                MonthlyPrevRanking;                                       // 0x0028(0x0004)
	int                                                MonthlyRanking;                                           // 0x002C(0x0004)
	int                                                MonthlyPrevHeadShotRanking;                               // 0x0030(0x0004)
	int                                                MonthlyHeadShotRanking;                                   // 0x0034(0x0004)
	int                                                MonthlyPrevWomanRanking;                                  // 0x0038(0x0004)
	int                                                MonthlyWomanRanking;                                      // 0x003C(0x0004)
	int                                                Kill;                                                     // 0x0040(0x0004)
	int                                                Death;                                                    // 0x0044(0x0004)
	int                                                Win;                                                      // 0x0048(0x0004)
	int                                                Lose;                                                     // 0x004C(0x0004)
	int                                                TeamKill;                                                 // 0x0050(0x0004)
	int                                                Assist;                                                   // 0x0054(0x0004)
	int                                                Point;                                                    // 0x0058(0x0004)
	int                                                Cash;                                                     // 0x005C(0x0004)
	int                                                HeadShot2;                                                // 0x0060(0x0004)
	int                                                DisCon;                                                   // 0x0064(0x0004)
	int                                                TotPlayTime;                                              // 0x0068(0x0004)
	int                                                DispHeadItem;                                             // 0x006C(0x0004)
	int                                                DispFaceItem;                                             // 0x0070(0x0004)
	int                                                DispBackpack;                                             // 0x0074(0x0004)
	byte                                               LookForClan;                                              // 0x0078(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0079(0x0003) MISSED OFFSET
	int                                                ClanContribue;                                            // 0x007C(0x0004)
	int                                                ClanWin;                                                  // 0x0080(0x0004)
	int                                                ClanLose;                                                 // 0x0084(0x0004)
	int                                                ClanKill;                                                 // 0x0088(0x0004)
	int                                                ClanDeath;                                                // 0x008C(0x0004)
	int                                                ClanAssist;                                               // 0x0090(0x0004)
	int                                                ClanHeadshot;                                             // 0x0094(0x0004)
	int                                                ClanDiscon;                                               // 0x0098(0x0004)
	int                                                ClanRankingPrev;                                          // 0x009C(0x0004)
	int                                                ClanRanking;                                              // 0x00A0(0x0004)
	int                                                ClanRankingMonthlyPrev;                                   // 0x00A4(0x0004)
	int                                                ClanRankingMonthly;                                       // 0x00A8(0x0004)
	int                                                LevelMarkID;                                              // 0x00AC(0x0004)
	int                                                TitleMarkID;                                              // 0x00B0(0x0004)
	int                                                DispPouch;                                                // 0x00B4(0x0004)
	int                                                DispCamouflage;                                           // 0x00B8(0x0004)
	int                                                Reserved1;                                                // 0x00BC(0x0004)
};

// Struct BatteryNet.BTTcpLink_Channel.KillDeathLog
// 0x0054
struct FKillDeathLog
{
	int                                                CharKillUID;                                              // 0x0000(0x0004)
	float                                              KillXCoord;                                               // 0x0004(0x0004)
	float                                              KillYCoord;                                               // 0x0008(0x0004)
	float                                              KillZCoord;                                               // 0x000C(0x0004)
	int                                                KillPos;                                                  // 0x0010(0x0004)
	int                                                KillWeapon;                                               // 0x0014(0x0004)
	int                                                KillWeaponPart;                                           // 0x0018(0x0004)
	int                                                KillRange;                                                // 0x001C(0x0004)
	int                                                KillDamage;                                               // 0x0020(0x0004)
	byte                                               KillBodyPart;                                             // 0x0024(0x0001)
	byte                                               IsUAV;                                                    // 0x0025(0x0001)
	byte                                               Padding00[0x2];                                           // 0x0026(0x0002) MISSED OFFSET
	int                                                CharDeathUID;                                             // 0x0028(0x0004)
	float                                              DeathXCoord;                                              // 0x002C(0x0004)
	float                                              DeathYCoord;                                              // 0x0030(0x0004)
	float                                              DeathZCoord;                                              // 0x0034(0x0004)
	int                                                DeathPos;                                                 // 0x0038(0x0004)
	int                                                DeathWeapon;                                              // 0x003C(0x0004)
	int                                                DeathWeaponPart;                                          // 0x0040(0x0004)
	byte                                               IsDropItem;                                               // 0x0044(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0045(0x0003) MISSED OFFSET
	int                                                DropItemID;                                               // 0x0048(0x0004)
	int                                                GetItemIDAfterKill;                                       // 0x004C(0x0004)
	byte                                               IsAimShot;                                                // 0x0050(0x0001)
	byte                                               Padding02[0x3];                                           // 0x0051(0x0003) MISSED OFFSET
};

// Struct BatteryNet.BTTcpLink_Channel.ClanInfo
// 0x00B0
struct FClanInfo
{
	string                                             ClanMasterCharname;                                       // 0x0000(0x000C) (NeedCtorLink)
	int                                                ClanWin;                                                  // 0x000C(0x0004)
	int                                                ClanLose;                                                 // 0x0010(0x0004)
	int                                                ClanDraw;                                                 // 0x0014(0x0004)
	int                                                tRankCur;                                                 // 0x0018(0x0004)
	int                                                tRankPrev;                                                // 0x001C(0x0004)
	int                                                mRankCur;                                                 // 0x0020(0x0004)
	int                                                mRankPrev;                                                // 0x0024(0x0004)
	byte                                               Region;                                                   // 0x0028(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0029(0x0003) MISSED OFFSET
	int                                                MemberCnt;                                                // 0x002C(0x0004)
	int                                                MemberTotal;                                              // 0x0030(0x0004)
	byte                                               IsRecruit;                                                // 0x0034(0x0001)
	byte                                               Padding01[0x3];                                           // 0x0035(0x0003) MISSED OFFSET
	string                                             HowOld;                                                   // 0x0038(0x000C) (NeedCtorLink)
	string                                             Keyword;                                                  // 0x0044(0x000C) (NeedCtorLink)
	string                                             Intro;                                                    // 0x0050(0x000C) (NeedCtorLink)
	string                                             CM_ClanName;                                              // 0x005C(0x000C) (NeedCtorLink)
	int                                                CM_Pattern;                                               // 0x0068(0x0004)
	int                                                CM_BG;                                                    // 0x006C(0x0004)
	int                                                CM_BL;                                                    // 0x0070(0x0004)
	string                                             ClanNoti;                                                 // 0x0074(0x000C) (NeedCtorLink)
	int                                                ClanExp;                                                  // 0x0080(0x0004)
	int                                                ClanKill;                                                 // 0x0084(0x0004)
	int                                                ClanDeath;                                                // 0x0088(0x0004)
	int                                                ClanAssist;                                               // 0x008C(0x0004)
	int                                                ClanActivity;                                             // 0x0090(0x0004)
	int                                                ClanActivityRank;                                         // 0x0094(0x0004)
	int                                                ClanActivityRankPrev;                                     // 0x0098(0x0004)
	int                                                ClanActivityMRank;                                        // 0x009C(0x0004)
	int                                                ClanActivityMRankPrev;                                    // 0x00A0(0x0004)
	int                                                ClanLevel;                                                // 0x00A4(0x0004)
	int                                                ConnectingCount;                                          // 0x00A8(0x0004)
	int                                                ConnectingRank;                                           // 0x00AC(0x0004)
};

// Struct BatteryNet.BTTcpLink_Channel.GameRoomInfo
// 0x0064
struct FGameRoomInfo
{
	int                                                RoomNumber;                                               // 0x0000(0x0004)
	string                                             RoomName;                                                 // 0x0004(0x000C) (NeedCtorLink)
	string                                             MapName;                                                  // 0x0010(0x000C) (NeedCtorLink)
	string                                             GameClass;                                                // 0x001C(0x000C) (NeedCtorLink)
	byte                                               GameModeNum;                                              // 0x0028(0x0001)
	byte                                               MaxUserCnt;                                               // 0x0029(0x0001)
	byte                                               TeamCnt;                                                  // 0x002A(0x0001)
	byte                                               WeaponLimit;                                              // 0x002B(0x0001)
	int                                                GameRound;                                                // 0x002C(0x0004)
	int                                                GameMinute;                                               // 0x0030(0x0004)
	byte                                               IsHardCore;                                               // 0x0034(0x0001)
	byte                                               Padding00[0x3];                                           // 0x0035(0x0003) MISSED OFFSET
	string                                             RoomOwner;                                                // 0x0038(0x000C) (NeedCtorLink)
	byte                                               MapNum;                                                   // 0x0044(0x0001)
	byte                                               IsIntervention;                                           // 0x0045(0x0001)
	byte                                               IsFreeCam;                                                // 0x0046(0x0001)
	byte                                               IsVoiceChat;                                              // 0x0047(0x0001)
	byte                                               IsTeamValance;                                            // 0x0048(0x0001)
	byte                                               IsOurForcesDamage;                                        // 0x0049(0x0001)
	byte                                               IsKillCam;                                                // 0x004A(0x0001)
	byte                                               IsVote;                                                   // 0x004B(0x0001)
	byte                                               IsChangeOffenseAndDefense;                                // 0x004C(0x0001)
	byte                                               ChangeOffenseAndDefenseRound;                             // 0x004D(0x0001)
	byte                                               BombHold;                                                 // 0x004E(0x0001)
	byte                                               IsPassword;                                               // 0x004F(0x0001)
	string                                             Password;                                                 // 0x0050(0x000C) (NeedCtorLink)
	byte                                               PlayWithBots;                                             // 0x005C(0x0001)
	byte                                               MaxAFUserAndBotNum;                                       // 0x005D(0x0001)
	byte                                               MaxRSAUserAndBotNum;                                      // 0x005E(0x0001)
	byte                                               UserTeamNum;                                              // 0x005F(0x0001)
	byte                                               BotModeDifficulty;                                        // 0x0060(0x0001)
	byte                                               RoomType;                                                 // 0x0061(0x0001)
	byte                                               ResponType;                                               // 0x0062(0x0001)
	byte                                               Padding01[0x1];                                           // 0x0063(0x0001) MISSED OFFSET
};

// Struct BatteryNet.BTTcpLink_Channel.MatchState
// 0x0018
struct FMatchState
{
	int                                                iNumTeam;                                                 // 0x0000(0x0004)
	int                                                iGoalRound;                                               // 0x0004(0x0004)
	byte                                               bFriendlyFire;                                            // 0x0008(0x0001)
	byte                                               bAllowSpectate;                                           // 0x0009(0x0001)
	byte                                               bAutobalance;                                             // 0x000A(0x0001)
	byte                                               bAllowJoin;                                               // 0x000B(0x0001)
	byte                                               bAllow3rdPersonView;                                      // 0x000C(0x0001)
	byte                                               bChatVictimOnly;                                          // 0x000D(0x0001)
	byte                                               Padding00[0x2];                                           // 0x000E(0x0002) MISSED OFFSET
	int                                                iMinutesKickAFK;                                          // 0x0010(0x0004)
	int                                                iMinPlayers;                                              // 0x0014(0x0004)
};

// Struct BatteryNet.BTTcpLink_Channel.NetAuctionItem
// 0x0038
struct FNetAuctionItem
{
	int                                                UniqueID;                                                 // 0x0000(0x0004)
	int                                                ItemID;                                                   // 0x0004(0x0004)
	int                                                AddPartsID;                                               // 0x0008(0x0004)
	int                                                UntilTime;                                                // 0x000C(0x0004)
	int                                                BiddingPrice;                                             // 0x0010(0x0004)
	int                                                InstantlyBuyingPrice;                                     // 0x0014(0x0004)
	int                                                ItemDamaged;                                              // 0x0018(0x0004)
	string                                             HighestBidderName;                                        // 0x001C(0x000C) (NeedCtorLink)
	string                                             SellerName;                                               // 0x0028(0x000C) (NeedCtorLink)
	int                                                GuarantyPoint;                                            // 0x0034(0x0004)
};

}

#ifdef _MSC_VER
	#pragma pack(pop)
#endif
