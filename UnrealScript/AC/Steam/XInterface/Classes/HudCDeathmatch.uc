/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\HudCDeathmatch.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:7
 *	Properties:418
 *	Functions:211
 *
 *******************************************************************************/
class HudCDeathmatch extends HudBase
    dependson(wHudPart_DisplayMain)
    dependson(wHudPart_DisplayEvent)
    dependson(wHudPart_MinimapBase)
    dependson(wHudPart_Tutorial)
    dependson(wHudPart_RadioMessage)
    dependson(wHudPart_SelectQSlot)
    dependson(wHudPart_KillMessage)
    dependson(BTHUDResourcePoolHK)
    dependson(wHudPart_DisplayQuest)
    dependson(wHudPart_Minimap)
    dependson(wHudPart_Bigmap)
    dependson(xScoreBoardTeamGame)
    dependson(wScoreboardPart_Minimap)
    dependson(ScoreBoardDeathMatch)
    dependson(wHudPart_Tutorial2)
    dependson(xScoreBoardTutorial)
    config(User)
    transient;

const WEAPON_BAR_SIZE = 9;

struct AmmoSet
{
    var Material DigitTexture;
    var IntBox TextureCoords[4];
    var int X2;
    var int Y2;
    var int XL;
    var int YL;
    var int ExtraOffsetX;
};

struct TeamDeathInfo
{
    var int TeamIndex;
    var Vector Position;
    var Vector HeadPosition;
    var float TimeToRemove;
    var float TimeToStartFade;
};

struct DamageIndicationInfo
{
    var Vector AttackerLocation;
    var int Damage;
    var class<DamageType> DamageType;
    var float TimeInserted;
    var float TimeToRemove;
};

struct SelfKillMessage
{
    var string KillerName;
    var string VictimName;
    var class<DamageType> Type;
    var float Time;
    var string Message;
    var Color MessageColor;
};

struct SkillProperty
{
    var int iState;
    var int iSlotPos;
    var int iSkillID;
    var int iWeaponID;
    var float fActiveTime;
    var bool bDrawedIcon;
    var bool bDrawed;
    var Material matIcon;
    var SpriteWidget wTex[2];
};

struct WeaponState
{
    var float PickupTimer;
    var bool HasWeapon;
};

struct GameNotice
{
    var string sNotice;
    var float fStartTime;
    var float fEndTime;
    var float fLifeTime;
    var bool bSendConsole;
    var int NoticeStartPosX;
};

var float UAVLastBeginScanLevelSeconds;
var float UAVOneScanTime;
var float UAVOneScanTimeExtra;
var float UAVOneScanMin;
var float UAVOneScanMax;
var wHudPart_MinimapBase UAVMinimapBase;
var int UAVScanOffset;
var float UAVIconPosXAlly;
var float UAVIconPosYAlly;
var float UAVIconPosXEnemy;
var float UAVIconPosYEnemy;
var float UAVIconWidth;
var float UAVIconHeight;
var float UAVIconTextPosXAlly;
var float UAVIconTextPosYAlly;
var float UAVIconTextPosXEnemy;
var float UAVIconTextPosYEnemy;
var float UAVIconTextOffsetX;
var float UAVIconTextXL;
var float UAVIconTextYL;
var Color UAVIconColor;
var float AFStringLeftTopX;
var float AFStringLeftTopY;
var float AFStringRightBottomX;
var float AFStringRightBottomY;
var float AFSurvivedUserCountLeftTopX;
var float AFSurvivedUserCountLeftTopY;
var float AFSurvivedUserCountRightBottomX;
var float AFSurvivedUserCountRightBottomY;
var float RSAStringLeftTopX;
var float RSAStringLeftTopY;
var float RSAStringRightBottomX;
var float RSAStringRightBottomY;
var float RSASurvivedUserCountLeftTopX;
var float RSASurvivedUserCountLeftTopY;
var float RSASurvivedUserCountRightBottomX;
var float RSASurvivedUserCountRightBottomY;
var() DigitSet WDigitsSmall;
var() DigitSet WDigitsMid;
var() DigitSet WDigitsTime;
var() DigitSet WDigitsTimeRedAlert;
var() SpriteWidget ScoreBgLine;
var() SpriteWidget ScoreBg;
var() SpriteWidget ScoreBGMine;
var() SpriteWidget ScoreBGMyLine;
var SpriteWidget DetectedBomb;
var float DetectedBombDrawDistance;
var() NumericWidget DigitsScoreL;
var() NumericWidget DigitsScoreR;
var() NumericWidget DigitsScoreU;
var() NumericWidget DigitsScoreD;
var bool OverdrawDigitsScoreL;
var bool OverdrawDigitsScoreR;
var TexRotator outArrow;
var config float OutArrowSize;
var bool bRendNavExtra;
var float fRendNavExtraFactor;
var bool bRendVisCount;
var float fRendVisCountFactor;
var float fRendViscountBoxSize;
var bool bRendInfluence;
var float fInfluenceBoxSize;
var bool bRendCoverAngle;
var float fRendCoverAngleSize;
var bool bRendSDFrontLine;
var float fSDFrontLineSize;
var bool bRendSDFrontLineFull;
var bool bRendRadius;
var array<Color> RainbowColors;
var array<Color> DangerColors;
var array<Color> RedBlueColors;
var Color color_Shadow;
var() bool bShowTimer1;
var() bool bShowTimer1WithDigitRedAlert;
var() SpriteWidget WTimerBG;
var() SpriteWidget SpriteTimerHalf;
var() SpriteWidget SpriteTimerHalf_RedAlert;
var() NumericWidget DigitsTimerMin;
var() NumericWidget DigitsTimerSec;
var() bool bShowTimer2NotScoreD;
var() bool bShowTimer2WithDigitRedAlert;
var() SpriteWidget SpriteTimerHalf2;
var() SpriteWidget SpriteTimerHalf2_RedAlert;
var() NumericWidget DigitsTimerMin2;
var() NumericWidget DigitsTimerSec2;
var float NetLastTimeSeconds;
var float NetElapsedTime;
var float NetInterval;
var int NetRecvMax;
var int NetRecv;
var int NetSendMax;
var int NetSend;
var int NetTotal;
var() SpriteWidget AmmoIcon;
var() NumericWidget AdrenalineCount;
var() NumericWidget mySpread;
var() NumericWidget myRank;
var() NumericWidget MyScore;
var() NumericWidget TimerHours;
var() NumericWidget TimerMinutes;
var() NumericWidget TimerSeconds;
var() SpriteWidget TimerDigitSpacer[2];
var() SpriteWidget TimerIcon;
var() SpriteWidget TimerBackground;
var() SpriteWidget TimerBackgroundDisc;
var() Font LevelActionFontFont;
var() Color LevelActionFontColor;
var() float LevelActionPositionX;
var() float LevelActionPositionY;
var() NumericWidget DigitsHealth;
var() NumericWidget DigitsVehicleHealth;
var() NumericWidget DigitsTotalAmmo;
var() NumericWidget DigitsMagazineAmmo;
var() NumericWidget DigitsMagazineAmmoShortage;
var() NumericWidget DigitsShield;
var() NumericWidget DigitsSprint;
var bool bPrevMatchOver;
var() SpriteWidget HpStaminaBackground;
var() SpriteWidget HpBarBackground;
var() SpriteWidget HpBar;
var() SpriteWidget DamageBar;
var() SpriteWidget RecoveryBar;
var() SpriteWidget StaminaBarBackground;
var() SpriteWidget StaminaBar;
var() SpriteWidget StaminaBarWarn;
var() SpriteWidget HPIcon;
var() SpriteWidget HpGauBlink;
var() float fHPDelayTime;
var() float fHPDisplayRatio;
var float fAddValue;
var float fLastHealth;
var float fBeginDamageTime;
var bool bBeginDamage;
var bool bBeginRecovery;
var float fCurrentDamageBar;
var float fCurrentHPBar;
var float fCurrentRecoveryBar;
var bool bPlayRecoverySounding;
var float fStartPlayRecoverySound;
var DigitSet WDigitsHP;
var NumericWidget HPCount;
var SpriteWidget SPIcon;
var() SpriteWidget PostureStand;
var() SpriteWidget PostureCrouch;
var() SpriteWidget PostureDown;
var() SpriteWidget PostureRun;
var() SpriteWidget HelpWorldMap;
var() SpriteWidget HelpMiliAtt;
var() SpriteWidget HelpAim;
var Material matCurrentWeapon;
var int iDrawingWeaponID;
var() DigitSet AmmoSet100;
var() NumericWidget Ammo100;
var() int Ammo100_LineOffset;
var() int Ammo100_DigitOffset;
var() AmmoSet AmmoSet50;
var() AmmoSet AmmoSetSniper;
var() AmmoSet AmmoSetShotgun;
var() AmmoSet AmmoSetRPG;
var() AmmoSet AmmoSetATR;
var FloatBox fbSpectateClanMark;
var FloatBox fbSpectateUserName;
var string SpecPlayerClan;
var Image ImgPlayerClanMark[3];
var Material matDefaultClanMark;
var() SpriteWidget AmmoFlameThrowerCan;
var() SpriteWidget AmmoFlameThrowerBar;
var() SpriteWidget AmmoSeparator;
var() float AmmoSeparatorBeginX;
var() float AmmoSeparatorBeginY;
var() float AmmoSeparatorWidth;
var() float AmmoSeparatorHeight;
var() SpriteWidget GaugeOverHeat;
var() array<TeamDeathInfo> TeamDeathInfos;
var() SpriteWidget TeamDeathSprite;
var() float TeamDeath_HeightOffset;
var() float TeamDeath_MinScale;
var() float TeamDeath_MaxScale;
var() float TeamDeath_MinDist;
var() float TeamDeath_MaxDist;
var SpriteWidget WBGKillMessage;
var Material DamageIndicationMaterial;
var int MaxDamageIndicationCount;
var float DamageIndicationDuration;
var() array<DamageIndicationInfo> DamageIndicationInfos;
var float DamageIndicationMaterial_UOffset;
var float DamageIndicationMaterial_VOffset;
var bool ShowHealthInDanager;
var int ShowHealthInDanagerSoundID;
var float ShowHealthInDanager_BeginTime;
var float ShowHealthInDanager_EndTime;
var float ShowHealthInDanager_Duration;
var Material ShowHealthInDanager_Material;
var float ShowHealthInDanger_BlinkInterval;
var float ShowHealthInDanger_BlinkMaxAlpha;
var float ShowHealthInDanger_BlinkMinAlpha;
var bool bShowFallInDanger;
var float ShowFallDamage_Duration;
var float ShowFallInDanager_BeginTime;
var float ShowFallInDanager_EndTime;
var float ShowFallDamage_BlinkInterval;
var localized string KillMessageHelicopterName;
var SelfKillMessage LastSelfKillMessage;
var localized string SelfKillMessage_Killed;
var localized string SelfKillMessage_KilledBy;
var localized string SuicideMessage;
var Color SelfKillColor;
var Color SelfKilledByColor;
var() SpriteWidget Crosshair_Left;
var() SpriteWidget Crosshair_Right;
var() SpriteWidget Crosshair_Up;
var() SpriteWidget Crosshair_Down;
var() SpriteWidget Crosshair_MG;
var() SpriteWidget Crosshair_DamageDealt;
var float CrossHair_DamageDealtDrawTime;
var float CrossHair_DamageDealtBeginFadeTime;
var float CrossHair_ServerSideLastDamageDealtTime;
var float CrossHair_ClientSideLastDamageDealtTime;
var() SpriteWidget ProgressStatusBG;
var() SpriteWidget ProgressStatusBar;
var() SpriteWidget SkillSlot5;
var() SpriteWidget SkillSlot6;
var() Material matEmptySkillSlot;
var() Material matSkillHelicopter;
var() Material matSkillAirStrike;
var() Material matSkillUAV;
var() Material matSkillRPG;
var() Material matSkillM2B;
var() Material matSkillBlink;
var() float fBlinkDelayTime;
var() float fBlinkLastTime;
var bool bBlinkState;
var bool bSkill_C4;
var bool bSkill_Incen;
var bool bSkill_HellFire;
var bool bSkill_RPG7;
var bool bSkill_M2B;
var bool bSkill_ATR;
var() array<SpriteWidget> SkillNum;
var int HasSkillC4;
var int HasSkillAirStirke;
var int HasSkillRPG;
var int HasSkillIncen;
var int HasSkillHellFire;
var SkillProperty ActiveUsingSkill;
var float VisibleDistance;
var SpriteWidget PlaceMark;
var localized string lsPlaceM2B;
var localized string lsPlaceMG3;
var localized string lsPlaceRPG7;
var localized string lsPlaceATR;
var localized string lsPlaceHealthPack;
var localized string lsPlaceHeliPack;
var localized string lsPlaceArtilleryPack;
var localized string lsPlaceUAVPack;
var localized string lsPlaceMedalPack;
var localized string lsMessageNotice;
var localized string lsPlaceAmmoSupply;
var array< class<Actor> > SpecialPositions_Class;
var array<SpriteWidget> SpecialPositions_Sprite;
var array<int> SpecialPositions_OffsetZ;
var array<Vector> CachedSpecialPositions;
var array<Actor> CachedSpecialPositionActors;
var array<SpriteWidget> CachedSpecialPositionSprites;
var array< class<Actor> > SuppliesPositions_Class;
var array<int> SuppliesPositions_OffsetZ;
var array<Vector> CachedSuppliesPositions;
var array<Actor> CachedSuppliesPositionActors;
var bool bCachedSpecialPostions;
var array<name> SpriteTag;
var array<Plane> SpriteLastColorModulates;
var array<float> SpriteLastTime;
var Plane ObjectSpriteEdgeColorModulate;
var() NumericWidget UDamageTime;
var() SpriteWidget UDamageIcon;
var() SpriteWidget AdrenalineIcon;
var() SpriteWidget AdrenalineBackground;
var() SpriteWidget AdrenalineBackgroundDisc;
var() SpriteWidget AdrenalineAlert;
var() SpriteWidget MyScoreIcon;
var() SpriteWidget MyScoreBackground;
var() SpriteWidget HudHealthALERT;
var() SpriteWidget HudVehicleHealthALERT;
var() SpriteWidget HudAmmoALERT;
var() SpriteWidget HudBorderShield;
var() SpriteWidget HudBorderHealth;
var() SpriteWidget HudBorderVehicleHealth;
var() SpriteWidget HudBorderAmmo;
var() SpriteWidget HudBorderShieldIcon;
var() SpriteWidget HudBorderHealthIcon;
var() SpriteWidget HudBorderVehicleHealthIcon;
var() class<wWeapon> BaseWeapons[9];
var() SpriteWidget BarWeaponIcon[9];
var() SpriteWidget BarAmmoIcon[9];
var() SpriteWidget BarBorder[9];
var() SpriteWidget BarBorderAmmoIndicator[9];
var float BarBorderScaledPosition[9];
var WeaponState BarWeaponStates[9];
var() SpriteWidget RechargeBar;
var bool bDrawTimer;
var bool TeamLinked;
var bool bShowMissingWeaponInfo;
var int CurHealth;
var int LastHealth;
var int CurVehicleHealth;
var int LastVehicleHealth;
var int CurShield;
var int LastShield;
var int MaxShield;
var int CurEnergy;
var int MaxEnergy;
var int LastEnergy;
var float LastDamagedHealth;
var float LastDamagedVehicleHealth;
var float ZoomToggleTime;
var float FadeTime;
var() float MaxAmmoPrimary;
var() float CurAmmoPrimary;
var() float LastAdrenalineTime;
var transient int CurScore;
var transient int CurRank;
var transient int ScoreDiff;
var int OldRemainingTime;
var name CountDownName[10];
var name LongCountName[10];
var() int BarWeaponIconAnim[9];
var() Color HudColorRed;
var() Color HudColorBlue;
var() Color HudColorBlack;
var() Color HudColorHighLight;
var() Color HudColorNormal;
var() Color HudColorTeam[2];
var Color CustomHUDHighlightColor;
var PlayerReplicationInfo NamedPlayer;
var float NameTime;
var Material Portrait;
var float PortraitTime;
var float PortraitX;
var array<SceneManager> MySceneManagers;
var float VehicleDrawTimer;
var Pawn OldPawn;
var string VehicleName;
var float fPrevLevelSeconds;
var int iSpread_Curr;
var float fSpread_Constant;
var float ch_up_x;
var float ch_up_y;
var float ch_down_x;
var float ch_down_y;
var float ch_left_x;
var float ch_left_y;
var float ch_right_x;
var float ch_right_y;
var float ch_up_width;
var float ch_up_height;
var float ch_down_width;
var float ch_down_height;
var float ch_left_width;
var float ch_left_height;
var float ch_right_width;
var float ch_right_height;
var bool bIsFatigueSoundPlaying;
var float fFSoundStartTime;
var int PrevSprintVal;
var bool bShoudPlayFSound;
var wHudPart_KillMessage HudPart_KillMessage;
var wHudPart_Minimap HudPart_Minimap;
var wHudPart_Bigmap HudPart_Bigmap;
var bool bShowBigmap;
var wHudPart_DisplayMain HudPart_DisplayMain;
var wHudPart_DisplayEvent HudPart_DisplayEvent;
var wHudPart_SelectQSlot HudPart_SelQuickSlot;
var wHudPart_RadioMessage HudPart_RadioMessage;
var byte byShowRadioMessage;
var wHudPart_DisplayQuest HudPart_DisplayQuest;
var wHudPart_Tutorial HudPart_Tutorial;
var wHudPart_Tutorial2 HudPart_Tutorial2;
var() Pawn OldPawnOwner;
var wMapInfo mapInfo;
var bool DrawChangeHost;
var float DrawChangeHostBeginTime;
var float DrawChangeHostDuration;
var localized string MessageChangingHost;
var localized string MessageChangingHostPre;
var localized string MessageChangingHostPost;
var float MessageScoreLastTime;
var float MessageScoreAccelStep;
var int MessageScoreEffect;
var int MessageScoreAlpha;
var float ShowTime_NameTag_EnemyWhoKillMe;
var Pawn ViewTarget;
var Vector AttackerLoc;
var bool bClientOnBeginWaitingForStart;
var bool bClientOnEndWaitingForStart;
var() SpriteWidget WKill;
var() SpriteWidget WKillAim;
var() SpriteWidget WAssist;
var() SpriteWidget WHelikill;
var() SpriteWidget WArtillerykill;
var() SpriteWidget WCapture;
var() SpriteWidget WBombSetted;
var() SpriteWidget WBombDiffused;
var() SpriteWidget WFragGrenadeKill;
var() SpriteWidget WMeleeKill;
var() SpriteWidget WStepOnKill;
var() SpriteWidget WSpecialETCKill;
var() SpriteWidget WKillSuccession[15];
var() SpriteWidget WHeadshot;
var() SpriteWidget WHeadshotAim;
var() SpriteWidget WWallShotKill;
var() SpriteWidget WKillBlood;
var() SpriteWidget WKillBlood_Teen;
var() SpriteWidget WWarningMark;
var() float fWarningDelta;
var() SpriteWidget WAirStrikeMark;
var float fNoticeOffset;
var array<GameNotice> aGameNotice;
var array<GameNotice> aAASNotice;

exec function GrowHUD()
{
    // End:0x16
    if(!bShowWeaponInfo)
    {
        bShowWeaponInfo = true;
    }
    // End:0x8c
    else
    {
        // End:0x2c
        if(!bShowPersonalInfo)
        {
            bShowPersonalInfo = true;
        }
        // End:0x8c
        else
        {
            // End:0x42
            if(!bShowPoints)
            {
                bShowPoints = true;
            }
            // End:0x8c
            else
            {
                // End:0x63
                if(!bDrawTimer && default.bDrawTimer)
                {
                    bDrawTimer = true;
                }
                // End:0x8c
                else
                {
                    // End:0x79
                    if(!bShowWeaponBar)
                    {
                        bShowWeaponBar = true;
                    }
                    // End:0x8c
                    else
                    {
                        // End:0x8c
                        if(!bShowMissingWeaponInfo)
                        {
                            bShowMissingWeaponInfo = true;
                        }
                    }
                }
            }
        }
    }
    SaveConfig();
}

exec function ShrinkHUD()
{
    // End:0x14
    if(bShowMissingWeaponInfo)
    {
        bShowMissingWeaponInfo = false;
    }
    // End:0x75
    else
    {
        // End:0x28
        if(bShowWeaponBar)
        {
            bShowWeaponBar = false;
        }
        // End:0x75
        else
        {
            // End:0x3c
            if(bDrawTimer)
            {
                bDrawTimer = false;
            }
            // End:0x75
            else
            {
                // End:0x50
                if(bShowPoints)
                {
                    bShowPoints = false;
                }
                // End:0x75
                else
                {
                    // End:0x64
                    if(bShowPersonalInfo)
                    {
                        bShowPersonalInfo = false;
                    }
                    // End:0x75
                    else
                    {
                        // End:0x75
                        if(bShowWeaponInfo)
                        {
                            bShowWeaponInfo = false;
                        }
                    }
                }
            }
        }
    }
    SaveConfig();
}

simulated event WorldSpaceOverlays()
{
    super.WorldSpaceOverlays();
    RenderAIPaths();
    // End:0x1b
    if(bRendRadius)
    {
        RenderRadius();
    }
    // End:0x2a
    if(bRendNavExtra)
    {
        RenderNavExtraCost();
    }
    // End:0x39
    if(bRendVisCount)
    {
        RenderVisCount();
    }
    // End:0x48
    if(bRendInfluence)
    {
        RenderInfluence();
    }
    // End:0x57
    if(bRendCoverAngle)
    {
        RenderCoverAngle();
    }
    // End:0x77
    if(bRendSDFrontLine || bRendSDFrontLineFull)
    {
        RenderSDFrontLine(bRendSDFrontLineFull);
    }
}

exec function rendai(string v1, string v2)
{
    v1 = Locs(v1);
    switch(v1)
    {
        // End:0x85
        case "":
            clog("NavExtra");
            clog("VisCount");
            clog("Influence");
            clog("coverangle");
            clog("sd");
            clog("sdfull");
            clog("radius");
            // End:0x318
            break;
        // End:0xc0
        case "radius":
            bRendRadius = !bRendRadius;
            clog("bRendRadius=" $ string(bRendRadius));
            // End:0x318
            break;
        // End:0x13a
        case "navextra":
            bRendNavExtra = !bRendNavExtra;
            // End:0xf5
            if(v2 != "")
            {
                fRendNavExtraFactor = float(v2);
            }
            clog("bRendNavExtra=" $ string(bRendNavExtra) $ " fRendNavExtraFactor=" $ string(fRendNavExtraFactor));
            // End:0x318
            break;
        // End:0x1b4
        case "viscount":
            bRendVisCount = !bRendVisCount;
            // End:0x16f
            if(v2 != "")
            {
                fRendVisCountFactor = float(v2);
            }
            clog("bRendVisCount=" $ string(bRendVisCount) $ " fRendVisCountFactor=" $ string(fRendVisCountFactor));
            // End:0x318
            break;
        // End:0x1f5
        case "influence":
            bRendInfluence = !bRendInfluence;
            clog("bRendInfluence=" $ string(bRendInfluence));
            // End:0x318
            break;
        // End:0x273
        case "coverangle":
            bRendCoverAngle = !bRendCoverAngle;
            // End:0x22c
            if(v2 != "")
            {
                fRendCoverAngleSize = float(v2);
            }
            clog("bRendCoverANgle=" $ string(bRendCoverAngle) $ " fRendCoverAngleSize=" $ string(fRendCoverAngleSize));
            // End:0x318
            break;
        // End:0x2c0
        case "sd":
            bRendSDFrontLine = !bRendSDFrontLine;
            // End:0x29a
            if(bRendSDFrontLine)
            {
                bRendSDFrontLineFull = false;
            }
            clog("bRendSDFrontLine=" $ string(bRendSDFrontLine));
            // End:0x318
            break;
        // End:0x315
        case "sdfull":
            bRendSDFrontLineFull = !bRendSDFrontLineFull;
            // End:0x2eb
            if(bRendSDFrontLineFull)
            {
                bRendSDFrontLine = false;
            }
            clog("bRendSDFrontLineFull=" $ string(bRendSDFrontLineFull));
            // End:0x318
            break;
        // End:0xffff
        default:
}

function RenderSDFrontLine(bool Full)
{
    local NavigationPoint N;
    local Vector S, End;
    local Color C;

    N = Level.NavigationPointList;
    J0x14:
    // End:0x16c [While If]
    if(N != none)
    {
        // End:0x155
        if(N.HasGroundedLocation && N.VisEnemyAcquiredPoints.Length > 0 || Full && N.AcquireTeam != -1)
        {
            S = N.GroundedLocation;
            S.X -= fSDFrontLineSize / float(2);
            S.Y -= fSDFrontLineSize / float(2);
            End = N.GroundedLocation;
            End.X += fSDFrontLineSize / float(2);
            End.Y += fSDFrontLineSize / float(2);
            End.Z += 5.0;
            // End:0x124
            if(N.AcquireTeam == 0)
            {
                C = BlueColor;
            }
            // End:0x12f
            else
            {
                C = RedColor;
            }
            DrawSphere(N.GroundedLocation, C, fSDFrontLineSize / float(2), 6);
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function RenderRadius()
{
    local NavigationPoint N;
    local Vector S;
    local Color C;

    C.R = byte(255);
    C.G = byte(255);
    C.B = byte(255);
    N = Level.NavigationPointList;
    J0x41:
    // End:0xb2 [While If]
    if(N != none)
    {
        // End:0x9b
        if(N.HasGroundedLocation)
        {
            S = N.GroundedLocation;
            DrawSphere(N.GroundedLocation, C, N.CollisionRadius, 6);
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
}

function RenderCoverAngle()
{
    local NavigationPoint N;
    local Vector End;
    local float V;

    N = Level.NavigationPointList;
    J0x14:
    // End:0xd9 [While If]
    if(N != none)
    {
        // End:0xc2
        if(N.HasGroundedLocation)
        {
            V = N.MaxCoverAngle[0] - 1.0 / -1.0;
            End = N.GroundedLocation;
            End.Z += 30.0;
            End.Z += V * fRendCoverAngleSize;
            Draw3DLine(N.GroundedLocation, End, CalcArrayColor(1.0 - V, RainbowColors));
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function RenderInfluence()
{
    local NavigationPoint N;
    local Vector S, End, X, Y, B;

    local Color C;

    C.G = 0;
    C.A = byte(255);
    X = MakeVector(1.0, 0.0, 0.0);
    Y = MakeVector(0.0, 1.0, 0.0);
    N = Level.NavigationPointList;
    J0x66:
    // End:0x21b [While If]
    if(N != none)
    {
        // End:0x204
        if(N.HasGroundedLocation)
        {
            S = N.GroundedLocation;
            S.X -= fInfluenceBoxSize / float(2);
            S.Y -= fInfluenceBoxSize / float(2);
            End = N.GroundedLocation;
            End.X += fInfluenceBoxSize / float(2);
            End.Y += fInfluenceBoxSize / float(2);
            End.Z += 5.0;
            // End:0x160
            if(N.Influence > float(0))
            {
                C.R = byte(256.0 * N.Influence);
                C.B = 0;
            }
            // End:0x191
            else
            {
                C.R = 0;
                C.B = byte(float(-256) * N.Influence);
            }
            B = N.GroundedLocation;
            End.Z += fInfluenceBoxSize / float(2);
            DrawSphere(N.GroundedLocation, CalcArrayColor(N.Influence + 1.0 / 2.0, RedBlueColors), fInfluenceBoxSize / float(2), 8);
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x66;
    }
    Level.UpdateInfluence();
}

function RenderVisCount()
{
    local NavigationPoint N;
    local Vector S, End;
    local float Max;

    Max = 1.0;
    N = Level.NavigationPointList;
    J0x1f:
    // End:0x71 [While If]
    if(N != none)
    {
        // End:0x5a
        if(Max < float(N.VisCount))
        {
            Max = float(N.VisCount);
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    N = Level.NavigationPointList;
    J0x85:
    // End:0x1aa [While If]
    if(N != none)
    {
        // End:0x193
        if(N.HasGroundedLocation)
        {
            End = N.GroundedLocation;
            End.Z += 30.0;
            End.Z += float(N.VisCount) / Max * fRendVisCountFactor;
            S = N.GroundedLocation;
            S.X -= fRendViscountBoxSize / float(2);
            S.Y -= fRendViscountBoxSize / float(2);
            End.X += fRendViscountBoxSize / float(2);
            End.Y += fRendViscountBoxSize / float(2);
            DrawBox(S, End, CalcArrayColor(float(N.VisCount) / Max, DangerColors));
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x85;
    }
}

function RenderNavExtraCost()
{
    local NavigationPoint N;
    local Vector End;
    local float maxEC;

    maxEC = 1.0;
    N = Level.NavigationPointList;
    J0x1f:
    // End:0x71 [While If]
    if(N != none)
    {
        // End:0x5a
        if(maxEC < float(N.ExtraCost))
        {
            maxEC = float(N.ExtraCost);
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x1f;
    }
    N = Level.NavigationPointList;
    J0x85:
    // End:0x14a [While If]
    if(N != none)
    {
        // End:0x133
        if(N.HasGroundedLocation)
        {
            End = N.GroundedLocation;
            End.Z += 30.0;
            End.Z += float(N.ExtraCost) / maxEC * fRendNavExtraFactor;
            Draw3DLine(N.GroundedLocation, End, CalcArrayColor(1.0 - float(N.ExtraCost) / maxEC, RainbowColors));
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x85;
    }
}

function Color CalcArrayColor(float V, array<Color> carray)
{
    local int idx, nextidx;
    local float Delta;
    local Color C, dc;

    V = FClamp(V, 0.0, 1.0);
    Delta = 1.0 / float(carray.Length - 1);
    idx = int(V / Delta);
    nextidx = int(float(idx + 1) % float(carray.Length));
    C = carray[idx];
    dc = carray[nextidx] - C;
    C = C + dc * V - Delta * float(idx) / Delta;
    return C;
}

function RenderAIPaths()
{
    local Controller C;
    local wAIBot Bot;

    C = Level.ControllerList;
    J0x14:
    // End:0x86 [While If]
    if(C != none)
    {
        Bot = wAIBot(C);
        // End:0x6f
        if(Bot != none && Bot.bDrawPath && Bot.Pawn != none)
        {
            DrawRouteCache(Bot);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

simulated function DrawRouteCache(wAIBot C)
{
    local int i;
    local Vector Start, End, RealStart;
    local bool bPath;

    // End:0x0d
    if(C == none)
    {
        return;
    }
    // End:0x4a
    if(C.CurrentPath != none)
    {
        Start = C.CurrentPath.Start.Location;
    }
    // End:0x67
    else
    {
        Start = C.Pawn.Location;
    }
    RealStart = Start;
    // End:0xdc
    if(C.bAdjusting)
    {
        Draw3DLine(C.Pawn.Location, C.AdjustLoc, class'Canvas'.static.MakeColor(byte(255), 0, byte(255)));
        Start = C.AdjustLoc;
    }
    // End:0x298
    if(C.MoveTarget == C.RouteCache[0] && C.MoveTarget != none)
    {
        // End:0x1b4
        if(C.Destination != vect(0.0, 0.0, 0.0))
        {
            // End:0x19a
            if(C.pointReachable(C.Destination))
            {
                Draw3DLine(C.Pawn.Location, C.Destination, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
                return;
            }
            C.FindPathTo(C.Destination);
        }
        i = 0;
        J0x1bb:
        // End:0x258 [While If]
        if(i < 16)
        {
            // End:0x1e4
            if(C.RouteCache[i] == none)
            {
            }
            // End:0x258
            else
            {
                bPath = true;
                Draw3DLine(Start, C.RouteCache[i].Location, class'Canvas'.static.MakeColor(0, byte(255), 0));
                Start = C.RouteCache[i].Location;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1bb;
            }
        }
        // End:0x295
        if(bPath)
        {
            Draw3DLine(RealStart, C.Destination, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }
    }
    // End:0x2f5
    else
    {
        // End:0x2f5
        if(C.Pawn.Velocity != vect(0.0, 0.0, 0.0))
        {
            Draw3DLine(RealStart, C.Destination, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }
    }
    // End:0x329
    if(C.Focus != none)
    {
        End = C.Focus.Location;
    }
    // End:0x33d
    else
    {
        End = C.FocalPoint;
    }
    Draw3DLine(C.Pawn.Location + C.Pawn.BaseEyeHeight * vect(0.0, 0.0, 1.0), End, class'Canvas'.static.MakeColor(byte(255), 0, 0));
}

exec function ShowBigmap();
function UpdateMinimapMode()
{
    switch(Level.GetMatchMaker().MinimapMode)
    {
        // End:0x1e
        case 0:
        // End:0x22
        case 1:
        // End:0x20d
        case 2:
            HudPart_Minimap.MinimapCenterX = int(92.80);
            HudPart_Minimap.MinimapCenterY = int(92.80);
            HudPart_Minimap.MinimapSize = int(166.40);
            HudPart_Minimap.MinimapCoverSize = int(292.50);
            HudPart_Minimap.IconSizeF = 0.650;
            HudPart_Minimap.BaseColor.A = byte(255);
            HudPart_Minimap.DrawFrame = true;
            UAVIconPosXAlly = 286.0;
            UAVIconPosYAlly = 16.0;
            UAVIconPosXEnemy = 286.0;
            UAVIconPosYEnemy = 90.0;
            UAVIconWidth = 64.0;
            UAVIconHeight = 64.0;
            UAVIconTextPosXAlly = 307.0;
            UAVIconTextPosYAlly = 27.0;
            UAVIconTextPosXEnemy = 307.0;
            UAVIconTextPosYEnemy = 102.0;
            UAVIconTextOffsetX = 12.0;
            UAVIconTextXL = 10.0;
            UAVIconTextYL = 13.0;
            UAVIconColor.A = byte(255);
            AFStringLeftTopX = 273.0;
            AFStringLeftTopY = 14.0;
            AFStringRightBottomX = 362.0;
            AFStringRightBottomY = 38.0;
            AFSurvivedUserCountLeftTopX = 273.0;
            AFSurvivedUserCountLeftTopY = 38.0;
            AFSurvivedUserCountRightBottomX = 362.0;
            AFSurvivedUserCountRightBottomY = 62.0;
            RSAStringLeftTopX = 273.0;
            RSAStringLeftTopY = 78.0;
            RSAStringRightBottomX = 362.0;
            RSAStringRightBottomY = 102.0;
            RSASurvivedUserCountLeftTopX = 273.0;
            RSASurvivedUserCountLeftTopY = 102.0;
            RSASurvivedUserCountRightBottomX = 362.0;
            RSASurvivedUserCountRightBottomY = 126.0;
            // End:0x233
            break;
        // End:0xffff
        default:
            Level.GetMatchMaker().MinimapMode = 0;
            UpdateMinimapMode();
            // End:0x233 Break;
            break;
    }
    ConsoleCommand("SETCONFIG_INT Misc MinimapMode" @ string(Level.GetMatchMaker().MinimapMode));
}

exec function ShowRadioMessage()
{
    local float fDeltaTime;

    // End:0x66
    if(PlayerOwner != none)
    {
        fDeltaTime = Level.TimeSeconds - PlayerOwner.fRadioMessageSendTime;
        // End:0x57
        if(Level.TimeSeconds < float(1))
        {
            fDeltaTime = 1.0 + 0.10;
        }
        // End:0x66
        if(fDeltaTime < float(1))
        {
            return;
        }
    }
    // End:0xa8
    if(byShowRadioMessage != 1)
    {
        HudPart_RadioMessage.SetRadioType(HudPart_RadioMessage.1);
        PlayerOwner.iRadioMessageType = 1;
        byShowRadioMessage = 1;
    }
    // End:0xb0
    else
    {
        byShowRadioMessage = 0;
    }
    // End:0x10a
    if(PlayerOwner != none)
    {
        // End:0xdc
        if(byShowRadioMessage > 0)
        {
            PlayerOwner.bToggleRadioMessage = true;
        }
        // End:0xed
        else
        {
            PlayerOwner.bToggleRadioMessage = false;
        }
        // End:0x10a
        if(byShowRadioMessage == 0)
        {
            PlayerOwner.iRadioMessageType = 0;
        }
    }
}

exec function ShowRadioMessage_Alarm()
{
    local float fDeltaTime;

    // End:0x66
    if(PlayerOwner != none)
    {
        fDeltaTime = Level.TimeSeconds - PlayerOwner.fRadioMessageSendTime;
        // End:0x57
        if(Level.TimeSeconds < float(1))
        {
            fDeltaTime = 1.0 + 0.10;
        }
        // End:0x66
        if(fDeltaTime < float(1))
        {
            return;
        }
    }
    // End:0xaa
    if(byShowRadioMessage != 2)
    {
        HudPart_RadioMessage.SetRadioType(HudPart_RadioMessage.2);
        PlayerOwner.iRadioMessageType = 2;
        byShowRadioMessage = 2;
    }
    // End:0xb2
    else
    {
        byShowRadioMessage = 0;
    }
    // End:0x10c
    if(PlayerOwner != none)
    {
        // End:0xde
        if(byShowRadioMessage > 0)
        {
            PlayerOwner.bToggleRadioMessage = true;
        }
        // End:0xef
        else
        {
            PlayerOwner.bToggleRadioMessage = false;
        }
        // End:0x10c
        if(byShowRadioMessage == 0)
        {
            PlayerOwner.iRadioMessageType = 0;
        }
    }
}

exec function ShowRadioMessage_Notify()
{
    local float fDeltaTime;

    // End:0x66
    if(PlayerOwner != none)
    {
        fDeltaTime = Level.TimeSeconds - PlayerOwner.fRadioMessageSendTime;
        // End:0x57
        if(Level.TimeSeconds < float(1))
        {
            fDeltaTime = 1.0 + 0.10;
        }
        // End:0x66
        if(fDeltaTime < float(1))
        {
            return;
        }
    }
    // End:0xaa
    if(byShowRadioMessage != 3)
    {
        HudPart_RadioMessage.SetRadioType(HudPart_RadioMessage.3);
        PlayerOwner.iRadioMessageType = 3;
        byShowRadioMessage = 3;
    }
    // End:0xb2
    else
    {
        byShowRadioMessage = 0;
    }
    // End:0x10c
    if(PlayerOwner != none)
    {
        // End:0xde
        if(byShowRadioMessage > 0)
        {
            PlayerOwner.bToggleRadioMessage = true;
        }
        // End:0xef
        else
        {
            PlayerOwner.bToggleRadioMessage = false;
        }
        // End:0x10c
        if(byShowRadioMessage == 0)
        {
            PlayerOwner.iRadioMessageType = 0;
        }
    }
}

exec function ShowBattleHelp();
simulated function UpdatePrecacheMaterials()
{
    local int i;

    // End:0x0d
    if(!bUseCustomWeaponCrosshairs)
    {
        return;
    }
    i = 0;
    J0x14:
    // End:0x4d [While If]
    if(i < Crosshairs.Length)
    {
        Level.AddPrecacheMaterial(Crosshairs[i].WidgetTexture);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function PostBeginPlay()
{
    local SceneManager SM;

    super.PostBeginPlay();
    // End:0x3c
    foreach AllActors(class'SceneManager', SM)
    {
        MySceneManagers.Length = MySceneManagers.Length + 1;
        MySceneManagers[MySceneManagers.Length - 1] = SM;                
    }
    // End:0x4c
    if(CustomCrosshairsAllowed())
    {
        SetCustomCrosshairs();
    }
    HudPart_KillMessage = Spawn(class'wHudPart_KillMessage', self);
    HudPart_KillMessage.Initialize(self, Level);
    HudPart_Minimap = Spawn(class'wHudPart_Minimap', self);
    HudPart_Minimap.Initialize(self, Level);
    UpdateMinimapMode();
    HudPart_Bigmap = Spawn(class'wHudPart_Bigmap', self);
    HudPart_Bigmap.Initialize(self, Level);
    HudPart_DisplayEvent = Spawn(class'wHudPart_DisplayEvent', self);
    HudPart_DisplayEvent.Initialize(self, Level);
    HudPart_DisplayMain = Spawn(class'wHudPart_DisplayMain', self);
    HudPart_DisplayMain.Initialize(self, Level);
    HudPart_SelQuickSlot = Spawn(class'wHudPart_SelectQSlotCN', self);
    HudPart_SelQuickSlot.Initialize(self, Level);
    HudPart_RadioMessage = Spawn(class'wHudPart_RadioMessage', self);
    HudPart_RadioMessage.Initialize(self, Level);
    HudPart_DisplayQuest = Spawn(class'wHudPart_DisplayQuest', self);
    HudPart_DisplayQuest.Initialize(self, Level);
    HudPart_Tutorial = Spawn(class'wHudPart_Tutorial2', self);
    HudPart_Tutorial.Initialize(self, Level);
    mapInfo = Level.GetMatchMaker().MapSettings.GetMapInfo(Level.GetMatchMaker().szMapName);
}

simulated function SetScoreBoardClass(class<ScoreBoard> ScoreboardClass, class<ScoreBoard> ResultBoardClass, class<ScoreBoard> ResultBoardBootyClass)
{
    super(HUD).SetScoreBoardClass(ScoreboardClass, ResultBoardClass, ResultBoardBootyClass);
    UAVMinimapBase = xScoreBoardTeamGame(ScoreBoard).PartMinimap;
    UAVMinimapBase.Initialize(self, Level);
    // End:0x93
    if(ScoreBoard != none && Level.GetMatchMaker().BotTutorial)
    {
        wHudPart_Tutorial2(HudPart_Tutorial).__OnTutorialResult__Delegate = xScoreBoardTutorial(ScoreBoard).OnTutorialResult;
    }
}

function ResetHud()
{
    // End:0x36
    if(PawnOwner == none)
    {
        CurHealth = 0;
        LastHealth = 0;
        InitSkillFlag();
        fWarningDelta = 0.0;
        DisalbeWeaponSlot5Hud();
        DisalbeWeaponSlot6Hud();
    }
}

function bool CustomCrosshairsAllowed()
{
    return true;
}

function bool CustomCrosshairColorAllowed()
{
    return true;
}

function bool CustomHUDColorAllowed()
{
    return true;
}

function SetCustomCrosshairs()
{
    local int i;
    local array<CrosshairRecord> CustomCrosshairs;

    class'CacheManager'.static.GetCrosshairList(CustomCrosshairs);
    Crosshairs.Length = CustomCrosshairs.Length;
    i = 0;
    J0x25:
    // End:0x173 [While If]
    if(i < CustomCrosshairs.Length)
    {
        Crosshairs[i].WidgetTexture = CustomCrosshairs[i].CrosshairTexture;
        Crosshairs[i].TextureCoords.X1 = 0;
        Crosshairs[i].TextureCoords.X2 = 64;
        Crosshairs[i].TextureCoords.Y1 = 0;
        Crosshairs[i].TextureCoords.Y2 = 64;
        Crosshairs[i].TextureScale = 0.750;
        Crosshairs[i].DrawPivot = 8;
        Crosshairs[i].PosX = 0.50;
        Crosshairs[i].PosY = 0.50;
        Crosshairs[i].OffsetX = 0;
        Crosshairs[i].OffsetY = 0;
        Crosshairs[i].ScaleMode = 0;
        Crosshairs[i].Scale = 1.0;
        Crosshairs[i].RenderStyle = 5;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
    // End:0x182
    if(CustomCrosshairColorAllowed())
    {
        SetCustomCrosshairColors();
    }
}

function SetCustomCrosshairColors()
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x5a [While If]
    if(i < Crosshairs.Length)
    {
        j = 0;
        J0x1e:
        // End:0x50 [While If]
        if(j < 2)
        {
            Crosshairs[i].Tints[j] = CrossHairColor;
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1e;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetCustomHUDColor()
{
    // End:0x97
    if(!CustomHUDColorAllowed() || CustomHUDColor.R == 0 && CustomHUDColor.G == 0 && CustomHUDColor.B == 0 && CustomHUDColor.A == 0)
    {
        CustomHUDColor = HudColorBlack;
        CustomHUDColor.A = 0;
        HudColorRed = HudColorTeam[0];
        HudColorBlue = HudColorTeam[1];
        bUsingCustomHUDColor = false;
        return;
    }
    bUsingCustomHUDColor = true;
    HudColorRed = CustomHUDColor;
    HudColorBlue = CustomHUDColor;
}

function CheckCountdown(GameReplicationInfo GRI)
{
    // End:0x53
    if(GRI == none || GRI.RemainingTime == 0 || GRI.RemainingTime == OldRemainingTime || GRI.Winner != none)
    {
        return;
    }
    OldRemainingTime = GRI.RemainingTime;
    // End:0x78
    if(OldRemainingTime > 300)
    {
        return;
    }
    // End:0x130
    if(OldRemainingTime > 30)
    {
        // End:0xb1
        if(OldRemainingTime == 300)
        {
            PlayerOwner.PlayStatusAnnouncement(string(LongCountName[0]), 1, true);
        }
        // End:0x12e
        else
        {
            // End:0xdb
            if(OldRemainingTime == 180)
            {
                PlayerOwner.PlayStatusAnnouncement(string(LongCountName[1]), 1, true);
            }
            // End:0x12e
            else
            {
                // End:0x106
                if(OldRemainingTime == 120)
                {
                    PlayerOwner.PlayStatusAnnouncement(string(LongCountName[2]), 1, true);
                }
                // End:0x12e
                else
                {
                    // End:0x12e
                    if(OldRemainingTime == 60)
                    {
                        PlayerOwner.PlayStatusAnnouncement(string(LongCountName[3]), 1, true);
                    }
                }
            }
        }
        return;
    }
    // End:0x15b
    if(OldRemainingTime == 30)
    {
        PlayerOwner.PlayStatusAnnouncement(string(LongCountName[4]), 1, true);
    }
    // End:0x1ba
    else
    {
        // End:0x186
        if(OldRemainingTime == 20)
        {
            PlayerOwner.PlayStatusAnnouncement(string(LongCountName[5]), 1, true);
        }
        // End:0x1ba
        else
        {
            // End:0x1ba
            if(OldRemainingTime <= 10 && OldRemainingTime > 0)
            {
                PlayerOwner.PlayStatusAnnouncement(string(CountDownName[0]), 1, true);
            }
        }
    }
}

simulated function Tick(float DeltaTime)
{
    local Material NewPortrait;

    super.Tick(DeltaTime);
    // End:0x10f
    if(Level.TimeSeconds - LastPlayerIDTalkingTime < 0.10 && PlayerOwner.GameReplicationInfo != none)
    {
        // End:0xf1
        if(PortraitPRI == none || PortraitPRI.PlayerID != LastPlayerIDTalking)
        {
            PortraitPRI = PlayerOwner.GameReplicationInfo.FindPlayerByID(LastPlayerIDTalking);
            // End:0xee
            if(PortraitPRI != none)
            {
                NewPortrait = PortraitPRI.GetPortrait();
                // End:0xee
                if(NewPortrait != none)
                {
                    // End:0xc9
                    if(Portrait == none)
                    {
                        PortraitX = 1.0;
                    }
                    Portrait = NewPortrait;
                    PortraitTime = Level.TimeSeconds + float(3);
                }
            }
        }
        // End:0x10c
        else
        {
            PortraitTime = Level.TimeSeconds + 0.20;
        }
    }
    // End:0x116
    else
    {
        LastPlayerIDTalking = 0;
    }
    // End:0x155
    if(PortraitTime - Level.TimeSeconds > float(0))
    {
        PortraitX = FMax(0.0, PortraitX - float(3) * DeltaTime);
    }
    // End:0x19a
    else
    {
        // End:0x19a
        if(Portrait != none)
        {
            PortraitX = FMin(1.0, PortraitX + float(3) * DeltaTime);
            // End:0x19a
            if(PortraitX == float(1))
            {
                Portrait = none;
                PortraitPRI = none;
            }
        }
    }
}

function CacheSpecialPositions()
{
    local int lp1;
    local Actor act;
    local Vector loc;

    Log("[HudCDeathmatch::CacheSpecialPositions]");
    CachedSpecialPositions.Length = 0;
    CachedSpecialPositionSprites.Length = 0;
    CachedSpecialPositionActors.Length = 0;
    lp1 = 0;
    J0x4a:
    // End:0xcd [While If]
    if(lp1 < SpecialPositions_Class.Length)
    {
        // End:0xc2
        foreach DynamicActors(SpecialPositions_Class[lp1], act)
        {
            loc = act.Location;
            loc.Z += float(SpecialPositions_OffsetZ[lp1]);
            CachedSpecialPositions[CachedSpecialPositions.Length] = loc;
            CachedSpecialPositionActors[CachedSpecialPositionActors.Length] = act;                        
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    // End:0xe7
    if(HudPart_Minimap != none)
    {
        HudPart_Minimap.CacheSpecialPositions();
    }
    // End:0x101
    if(HudPart_Bigmap != none)
    {
        HudPart_Bigmap.CacheSpecialPositions();
    }
    // End:0x137
    if(xScoreBoardTeamGame(ScoreBoard).PartMinimap != none)
    {
        xScoreBoardTeamGame(ScoreBoard).PartMinimap.CacheSpecialPositions();
    }
}

function AllDeleteSuppliesPositions()
{
    local int iLength;

    iLength = CachedSuppliesPositionActors.Length;
    CachedSuppliesPositionActors.Remove(0, iLength);
    iLength = CachedSuppliesPositions.Length;
    CachedSuppliesPositions.Remove(0, iLength);
}

simulated function DeleteSuppliesPositions(Actor act)
{
    local int lp1, lp2;
    local Actor act2;
    local Vector loc;

    loc = act.Location;
    lp1 = 0;
    J0x1b:
    // End:0xe0 [While If]
    if(lp1 < CachedSuppliesPositionActors.Length)
    {
        act2 = CachedSuppliesPositionActors[lp1];
        // End:0xd6
        if(act2 != none && act2 == act)
        {
            lp2 = lp1;
            J0x63:
            // End:0xb4 [While If]
            if(lp2 < CachedSuppliesPositionActors.Length - 1)
            {
                CachedSuppliesPositionActors[lp2] = CachedSuppliesPositionActors[lp2 + 1];
                CachedSuppliesPositions[lp2] = CachedSuppliesPositions[lp2 + 1];
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x63;
            }
            CachedSuppliesPositionActors.Remove(lp2, 1);
            CachedSuppliesPositions.Remove(lp2, 1);
            -- lp1;
        }
        // End:0xe0
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x1b;
        }
    }
}

simulated function CacheSuppliesPositions(Actor act)
{
    local Vector loc;

    loc = act.Location;
    CachedSuppliesPositions[CachedSuppliesPositions.Length] = loc;
    CachedSuppliesPositionActors[CachedSuppliesPositionActors.Length] = act;
}

function DrawSuppliesPositions(Canvas C)
{
    local int lp1;
    local Actor act;
    local string strName;
    local float fDistance;
    local Vector loc;

    lp1 = 0;
    J0x07:
    // End:0x1c5 [While If]
    if(lp1 < CachedSuppliesPositions.Length)
    {
        act = CachedSuppliesPositionActors[lp1];
        // End:0x36
        if(act == none)
        {
        }
        // End:0x1bb
        else
        {
            loc = act.Location;
            // End:0x81
            if(act.IsA('wHealthPack'))
            {
                strName = lsPlaceHealthPack;
                loc.Z += float(SuppliesPositions_OffsetZ[0]);
            }
            // End:0x160
            else
            {
                // End:0xb8
                if(act.IsA('wHeliPack'))
                {
                    strName = lsPlaceHeliPack;
                    loc.Z += float(SuppliesPositions_OffsetZ[1]);
                }
                // End:0x160
                else
                {
                    // End:0xef
                    if(act.IsA('wArtilleryPack'))
                    {
                        strName = lsPlaceArtilleryPack;
                        loc.Z += float(SuppliesPositions_OffsetZ[1]);
                    }
                    // End:0x160
                    else
                    {
                        // End:0x126
                        if(act.IsA('wUAVPack'))
                        {
                            strName = lsPlaceUAVPack;
                            loc.Z += float(SuppliesPositions_OffsetZ[1]);
                        }
                        // End:0x160
                        else
                        {
                            // End:0x15d
                            if(act.IsA('wMedalPack'))
                            {
                                strName = lsPlaceMedalPack;
                                loc.Z += float(SuppliesPositions_OffsetZ[0]);
                            }
                            // End:0x160
                            else
                            {
                                // This is an implied JumpToken;
                                goto J0x1bb;
                            }
                        }
                    }
                }
            }
            fDistance = VSize(PlayerOwner.CalcViewLocation - loc) * 0.018750;
            // End:0x196
            if(fDistance > VisibleDistance)
            {
            }
            // End:0x1bb
            else
            {
                DrawObjectSprite2(C, CachedSuppliesPositionActors[lp1], PlaceMark, loc, strName);
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function DrawAirStrikePosition(Canvas C)
{
    local Vector vLocation;

    vLocation.X = PlayerOwner.fAirStrikeCenterX;
    vLocation.Y = PlayerOwner.fAirStrikeCenterY;
    vLocation.Z = PawnOwner.Location.Z;
    // End:0xb9
    if(PlayerOwner.PlayerReplicationInfo.bNoTeam == false)
    {
        // End:0xb6
        if(PlayerOwner.PlayerReplicationInfo.Team.TeamIndex != Level.AirStrikeTeamIndex)
        {
            DrawObjectSprite3(C, WAirStrikeMark, vLocation);
        }
    }
    // End:0xee
    else
    {
        // End:0xee
        if(PlayerOwner.PlayerReplicationInfo.bySupply_AirStrike != 2)
        {
            DrawObjectSprite3(C, WAirStrikeMark, vLocation);
        }
    }
}

function SetDigitsScore(int valueL, bool highlightL, int valueR, bool highlightR, int valueU, int valueD)
{
    DigitsScoreL.Value = valueL;
    // End:0x48
    if(highlightL)
    {
        DigitsScoreL.Tints[0].A = byte(255);
        DigitsScoreL.Tints[1].A = byte(255);
    }
    // End:0x70
    else
    {
        DigitsScoreL.Tints[0].A = 196;
        DigitsScoreL.Tints[1].A = 196;
    }
    OverdrawDigitsScoreL = highlightL;
    DigitsScoreR.Value = valueR;
    // End:0xc5
    if(highlightR)
    {
        DigitsScoreR.Tints[0].A = byte(255);
        DigitsScoreR.Tints[1].A = byte(255);
    }
    // End:0xed
    else
    {
        DigitsScoreR.Tints[0].A = 196;
        DigitsScoreR.Tints[1].A = 196;
    }
    OverdrawDigitsScoreR = highlightR;
    DigitsScoreU.Value = valueU;
    DigitsScoreD.Value = valueD;
}

function SetDigitsTimer1(int Min, int sec)
{
    DigitsTimerMin.Value = Min;
    DigitsTimerSec.Value = sec;
}

function SetDigitsTimer2(int Min, int sec)
{
    DigitsTimerMin2.Value = Min;
    DigitsTimerSec2.Value = sec;
}

function UpdateTimer(out int TimeMinutes, out int TimeSeconds)
{
    local GameReplicationInfo GRI;
    local int Minutes, Hours, Seconds;

    GRI = PlayerOwner.GameReplicationInfo;
    // End:0x3f
    if(GRI.TimeLimit != 0)
    {
        Seconds = GRI.RemainingTime;
    }
    // End:0x53
    else
    {
        Seconds = GRI.ElapsedTime;
    }
    // End:0x87
    if(Seconds > 3600)
    {
        Hours = Seconds / 3600;
        Seconds -= Hours * 3600;
    }
    Minutes = Seconds / 60;
    Seconds -= Minutes * 60;
    TimeMinutes = Minutes;
    TimeSeconds = Seconds;
}

function UpdateSprint()
{
    // End:0x87
    if(PlayerOwner != none && PlayerOwner.Pawn != none && PlayerOwner.Pawn.wMyParam != none)
    {
        DigitsSprint.Value = int(PlayerOwner.fSprintTime / PlayerOwner.Pawn.wMyParam.Stm_MaxTime * 100.0);
    }
    // End:0x93
    else
    {
        DigitsSprint.Value = 0;
    }
}

function UpdateDigitsHealth()
{
    DigitsHealth.Value = CurHealth;
    DigitsVehicleHealth.Value = CurVehicleHealth;
}

function UpdateDigitsMisc()
{
    DigitsTotalAmmo.Value = int(MaxAmmoPrimary);
    DigitsMagazineAmmo.Value = int(CurAmmoPrimary);
    DigitsMagazineAmmoShortage.Value = int(CurAmmoPrimary);
    DigitsShield.Value = CurShield;
    AdrenalineCount.Value = CurEnergy;
    MyScore.Value = CurScore;
}

function DoUpdateTime()
{
    UpdateTimer(TimeMinutes, TimeSeconds);
    SetDigitsTimer1(TimeMinutes, TimeSeconds);
    SetDigitsTimer2(TimeMinutes, TimeSeconds);
}

simulated function UpdateHUD()
{
    Level.ClearInvalidCache();
    // End:0x54
    if(PawnOwnerPRI != none && PawnOwnerPRI.Team != none)
    {
        TeamIndex = Clamp(PawnOwnerPRI.Team.TeamIndex, 0, 1);
    }
    // End:0x5b
    else
    {
        TeamIndex = 1;
    }
    CalculateHealth();
    CalculateAmmo();
    CalculateShield();
    CalculateEnergy();
    CalculateScore();
    DoUpdateTime();
    UpdateDigitsHealth();
    UpdateDigitsMisc();
    UpdateSprint();
    updateScore();
    super.UpdateHUD();
    HudPart_KillMessage.Update();
}

function updateScore();
function PlaySoundStop(Canvas C);
function PlaySoundRecovery()
{
    local float fSoundPlayTime, fVolume;

    // End:0x36
    if(PlayerOwner.Pawn != none)
    {
        // End:0x33
        if(PlayerOwner.Pawn.IsA('Vehicle'))
        {
            return;
        }
    }
    // End:0x4c
    else
    {
        // End:0x4c
        if(PawnOwner.IsA('Vehicle'))
        {
            return;
        }
    }
    fVolume = 0.150;
    // End:0xcf
    if(bPlayRecoverySounding == true)
    {
        fSoundPlayTime = PlayerOwner.GetSoundDuration(soundgroup'char_breath_recovery');
        // End:0xcc
        if(fStartPlayRecoverySound + fSoundPlayTime < Level.TimeSeconds)
        {
            fStartPlayRecoverySound = Level.TimeSeconds;
            PlayerOwner.ClientPlaySound(soundgroup'char_breath_recovery', true, fVolume, 1);
        }
    }
    // End:0x107
    else
    {
        bPlayRecoverySounding = true;
        fStartPlayRecoverySound = Level.TimeSeconds;
        PlayerOwner.ClientPlaySound(soundgroup'char_breath_recovery', true, fVolume, 1);
    }
}

function DrawVehicleName(Canvas C)
{
    local float XL, YL, Fade;

    // End:0x0b
    if(bHideWeaponName)
    {
        return;
    }
    // End:0x112
    if(VehicleDrawTimer > Level.TimeSeconds)
    {
        C.Font = GetMediumFontFor(C);
        C.DrawColor = WhiteColor;
        Fade = VehicleDrawTimer - Level.TimeSeconds;
        // End:0x9a
        if(Fade <= float(1))
        {
            C.DrawColor.A = byte(float(255) * Fade);
        }
        C.StrLen(VehicleName, XL, YL);
        C.SetPos(C.ClipX / float(2) - XL / float(2), C.ClipY * 0.80 - YL);
        C.DrawText(VehicleName);
    }
    // End:0x13d
    if(PawnOwner != PlayerOwner.Pawn || PawnOwner == OldPawn)
    {
        return;
    }
    OldPawn = PawnOwner;
    // End:0x17b
    if(Vehicle(PawnOwner) == none)
    {
        VehicleDrawTimer = FMin(VehicleDrawTimer, Level.TimeSeconds + float(1));
    }
    // End:0x1af
    else
    {
        VehicleName = Vehicle(PawnOwner).VehicleNameString;
        VehicleDrawTimer = Level.TimeSeconds + 1.50;
    }
}

simulated function DrawAdrenaline(Canvas C)
{
    // End:0x16
    if(!PlayerOwner.bAdrenalineEnabled)
    {
        return;
    }
    DrawSpriteWidget(C, AdrenalineBackground);
    DrawSpriteWidget(C, AdrenalineBackgroundDisc);
    // End:0x6b
    if(CurEnergy == MaxEnergy)
    {
        DrawSpriteWidget(C, AdrenalineAlert);
        AdrenalineAlert.Tints[TeamIndex] = HudColorHighLight;
    }
    DrawSpriteWidget(C, AdrenalineIcon);
    // End:0x9e
    if(CurEnergy > LastEnergy)
    {
        LastAdrenalineTime = Level.TimeSeconds;
    }
    LastEnergy = CurEnergy;
    DrawHUDAnimWidget(AdrenalineIcon, default.AdrenalineIcon.TextureScale, LastAdrenalineTime, 0.60, 0.60);
    AdrenalineBackground.Tints[TeamIndex] = HudColorBlack;
    AdrenalineBackground.Tints[TeamIndex].A = 150;
}

simulated function DrawTimer(Canvas C)
{
    local GameReplicationInfo GRI;
    local int Minutes, Hours, Seconds;

    GRI = PlayerOwner.GameReplicationInfo;
    // End:0x3f
    if(GRI.TimeLimit != 0)
    {
        Seconds = GRI.RemainingTime;
    }
    // End:0x53
    else
    {
        Seconds = GRI.ElapsedTime;
    }
    TimerBackground.Tints[TeamIndex] = HudColorBlack;
    TimerBackground.Tints[TeamIndex].A = 150;
    DrawSpriteWidget(C, TimerBackground);
    DrawSpriteWidget(C, TimerBackgroundDisc);
    DrawSpriteWidget(C, TimerIcon);
    TimerMinutes.OffsetX = default.TimerMinutes.OffsetX - 80;
    TimerSeconds.OffsetX = default.TimerSeconds.OffsetX - 80;
    TimerDigitSpacer[0].OffsetX = default.TimerDigitSpacer[0].OffsetX;
    TimerDigitSpacer[1].OffsetX = default.TimerDigitSpacer[1].OffsetX;
    // End:0x210
    if(Seconds > 3600)
    {
        Hours = Seconds / 3600;
        Seconds -= Hours * 3600;
        TimerHours.Value = Hours;
        // End:0x192
        if(Hours > 9)
        {
            TimerMinutes.OffsetX = default.TimerMinutes.OffsetX;
            TimerSeconds.OffsetX = default.TimerSeconds.OffsetX;
        }
        // End:0x1fe
        else
        {
            TimerMinutes.OffsetX = default.TimerMinutes.OffsetX - 40;
            TimerSeconds.OffsetX = default.TimerSeconds.OffsetX - 40;
            TimerDigitSpacer[0].OffsetX = default.TimerDigitSpacer[0].OffsetX - 32;
            TimerDigitSpacer[1].OffsetX = default.TimerDigitSpacer[1].OffsetX - 32;
        }
        DrawSpriteWidget(C, TimerDigitSpacer[0]);
    }
    DrawSpriteWidget(C, TimerDigitSpacer[1]);
    Minutes = Seconds / 60;
    Seconds -= Minutes * 60;
    TimerMinutes.Value = Min(Minutes, 60);
    TimerSeconds.Value = Min(Seconds, 60);
}

simulated function DrawUDamage(Canvas C);
simulated function UpdateRankAndSpread(Canvas C)
{
    local int i;

    // End:0x23
    if(ScoreBoard == none || !ScoreBoard.UpdateGRI())
    {
        return;
    }
    i = 0;
    J0x2a:
    // End:0x93 [While If]
    if(i < PlayerOwner.GameReplicationInfo.PRIArray.Length)
    {
        // End:0x89
        if(PawnOwnerPRI == PlayerOwner.GameReplicationInfo.PRIArray[i])
        {
            myRank.Value = i + 1;
        }
        // End:0x93
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2a;
        }
    }
    MyScore.Value = Min(int(PawnOwnerPRI.Score), 999);
    // End:0x14e
    if(PawnOwnerPRI == PlayerOwner.GameReplicationInfo.PRIArray[0])
    {
        // End:0x13f
        if(PlayerOwner.GameReplicationInfo.PRIArray.Length > 1)
        {
            mySpread.Value = Min(int(PawnOwnerPRI.Score - PlayerOwner.GameReplicationInfo.PRIArray[1].Score), 999);
        }
        // End:0x14b
        else
        {
            mySpread.Value = 0;
        }
    }
    // End:0x194
    else
    {
        mySpread.Value = Min(int(PawnOwnerPRI.Score - PlayerOwner.GameReplicationInfo.PRIArray[0].Score), 999);
    }
    // End:0x1db
    if(bShowPoints)
    {
        DrawSpriteWidget(C, MyScoreBackground);
        MyScoreBackground.Tints[TeamIndex] = HudColorBlack;
        MyScoreBackground.Tints[TeamIndex].A = 150;
    }
}

simulated function CalculateHealth()
{
    LastHealth = CurHealth;
    // End:0x78
    if(Vehicle(PawnOwner) != none)
    {
        // End:0x56
        if(Vehicle(PawnOwner).Driver != none)
        {
            CurHealth = Vehicle(PawnOwner).Driver.Health;
        }
        LastVehicleHealth = CurVehicleHealth;
        CurVehicleHealth = PawnOwner.Health;
    }
    // End:0xa5
    else
    {
        CurHealth = PawnOwner.Health;
        // End:0x9e
        if(CurHealth < 0)
        {
            CurHealth = 0;
        }
        CurVehicleHealth = 0;
    }
}

simulated function CalculateShield()
{
    local wPawn P;

    LastShield = CurShield;
    // End:0x3c
    if(Vehicle(PawnOwner) != none)
    {
        P = wPawn(Vehicle(PawnOwner).Driver);
    }
    // End:0x4c
    else
    {
        P = wPawn(PawnOwner);
    }
    // End:0x8e
    if(P != none)
    {
        MaxShield = int(P.ShieldStrengthMax);
        CurShield = Clamp(int(P.ShieldStrength), 0, MaxShield);
    }
    // End:0x9d
    else
    {
        MaxShield = 100;
        CurShield = 0;
    }
}

simulated function CalculateEnergy()
{
    // End:0x4b
    if(PawnOwner.Controller == none)
    {
        MaxEnergy = int(PlayerOwner.AdrenalineMax);
        CurEnergy = Clamp(int(PlayerOwner.Adrenaline), 0, MaxEnergy);
    }
    // End:0x91
    else
    {
        MaxEnergy = int(PawnOwner.Controller.AdrenalineMax);
        CurEnergy = Clamp(int(PawnOwner.Controller.Adrenaline), 0, MaxEnergy);
    }
}

simulated function CalculateAmmo()
{
    MaxAmmoPrimary = 1.0;
    CurAmmoPrimary = 1.0;
    // End:0x59
    if(PawnOwner != none && PawnOwner.Weapon != none)
    {
        PawnOwner.Weapon.GetAmmoCount(MaxAmmoPrimary, CurAmmoPrimary);
    }
}

simulated function CalculateScore()
{
    ScoreDiff = CurScore;
    CurScore = int(PawnOwnerPRI.Score);
}

simulated function string GetScoreText()
{
    return ScoreText;
}

simulated function string GetScoreValue(PlayerReplicationInfo PRI)
{
    return "" $ string(int(PRI.Score));
}

simulated function string GetScoreTagLine()
{
    return InitialViewingString;
}

static function Color GetTeamColor(byte TeamNum)
{
    // End:0x18
    if(TeamNum == 1)
    {
        return default.HudColorTeam[1];
    }
    // End:0x20
    else
    {
        return default.HudColorTeam[0];
    }
}

function bool IsInCinematic()
{
    local int i;

    // End:0x47
    if(MySceneManagers.Length > 0)
    {
        i = 0;
        J0x13:
        // End:0x47 [While If]
        if(i < MySceneManagers.Length)
        {
            // End:0x3d
            if(MySceneManagers[i].bIsRunning)
            {
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x13;
        }
    }
    return false;
}

function SendQuestUpdate()
{
    local int i;
    local array<int> QuestIDs, CurrentProgresses;
    local wMatchMaker MM;
    local wGameManager GameMgr;

    Log("[HUDCDeathMatch::SendQuestUpdate]");
    MM = Level.GetMatchMaker();
    GameMgr = Level.GameMgr;
    MM.UpdateQuest_MatchEnd(MM.kGame_GameMode, MM.kGame_MapNum);
    // End:0xe2
    if(class'wGameSettings'.static.IsBotModeIndex(MM.kGame_GameMode))
    {
        // End:0xe2
        if(!Level.GetMatchMaker().BotTutorial)
        {
            MM.UpdateQuest_MatchEndInBotMode(MM.BotDifficulty, MM.kGame_MapNum);
        }
    }
    i = 0;
    J0xe9:
    // End:0x223 [While If]
    if(i < MM.MissionList.Length)
    {
        // End:0x219
        if(MM.MissionList[i].CurrentProgress > MM.TMissionList[i].CurrentProgress)
        {
            QuestIDs.Length = QuestIDs.Length + 1;
            QuestIDs[QuestIDs.Length - 1] = MM.MissionList[i].QuestID;
            CurrentProgresses.Length = CurrentProgresses.Length + 1;
            CurrentProgresses[CurrentProgresses.Length - 1] = MM.MissionList[i].CurrentProgress;
            Log("Update Qust Item! QuestID=" $ string(MM.MissionList[i].QuestID) $ ", CurrentProgress=" $ string(MM.MissionList[i].CurrentProgress));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xe9;
    }
    // End:0x2b2
    if(QuestIDs.Length > 0)
    {
        Log("[HUDCDeathMatch::SendQuestUpdate] QuestIDs.Length = " $ string(QuestIDs.Length));
        MM.kTcpChannel.sfReqQuestUpdate(MM.My_iUID, MM.My_iRoom, QuestIDs, CurrentProgresses);
    }
    // End:0x2d4
    else
    {
        MM.bRecvProtocolUpdateQuest = true;
        MM.bNoUpdateQuestInfo = false;
    }
}

simulated function bool DrawResult(Canvas C)
{
    // End:0x90
    if(Level.GetMatchMaker().InGameOver == 1)
    {
        clog("!HK! HudCDeathMatch.DrawResult() Level.GetMatchMaker().InGameOver == 1");
        // End:0x8b
        if(ResultBoard != none)
        {
            ResultBoard.DrawScoreboard(C);
        }
        return true;
    }
    // End:0xff
    else
    {
        // End:0xff
        if(Level.GetMatchMaker().InGameOver == 2)
        {
            clog("!HK! HudCDeathMatch.DrawResult() Level.GetMatchMaker().InGameOver == 2");
            return true;
        }
    }
    // End:0x16c
    if(Level.GRI.bMatchOver)
    {
        // End:0x14b
        if(bPrevMatchOver == false)
        {
            bPrevMatchOver = Level.GRI.bMatchOver;
            SendQuestUpdate();
        }
        HudPart_KillMessage.DrawNative(C);
        DrawResultScore(C);
        return true;
    }
    bPrevMatchOver = Level.GRI.bMatchOver;
    return false;
}

simulated function DrawResultScore(Canvas C)
{
    local bool Won;

    Won = PlayerOwner.GameReplicationInfo.GetWinTeamIndex() == PlayerOwner.GetTeamNum();
    HudPart_DisplayEvent.DrawResultScore(C, Won);
}

simulated function DrawViewTargetInfo(Canvas C)
{
    // End:0x4b
    if(Pawn(PlayerOwner.ViewTarget) != none && Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo != none)
    {
        DrawHudSpectating(C);
    }
    // End:0x4b
    else
    {
    }
}

simulated function DrawSpectatingHud(Canvas C)
{
    local Plane OldModulate;
    local float XL, Full, Height, Top, TextTop, MedH,
	    SmallH, Scale;

    local GameReplicationInfo GRI;

    // End:0x23
    if(Level == none || Level.GRI == none)
    {
        return;
    }
    HudPart_SelQuickSlot.DrawA(C);
    UpdateScreenRatios(C);
    Level.ClearInvalidCache();
    bIsCinematic = IsInCinematic();
    DisplayLocalMessages(C);
    // End:0x74
    if(bIsCinematic)
    {
        return;
    }
    OldModulate = C.ColorModulate;
    C.Font = GetMediumFontFor(C);
    C.StrLen("W", XL, MedH);
    Height = MedH;
    C.Font = GetConsoleFont(C);
    C.StrLen("W", XL, SmallH);
    Height += SmallH;
    Full = Height;
    Top = C.ClipY - float(8) - Full;
    Scale = Full + float(16) / float(128);
    TextTop = Top + float(4);
    GRI = PlayerOwner.GameReplicationInfo;
    // End:0x1a0
    if(UnrealPlayer(Owner).bDisplayWinner || UnrealPlayer(Owner).bDisplayLoser)
    {
    }
    // End:0x1eb
    else
    {
        // End:0x1eb
        if(!PlayerOwner.IsInState('RoundEnded') && !Level.GRI.bMatchOver)
        {
            DrawViewTargetInfo(C);
            DrawSelfKillMessage(C);
        }
    }
    C.ColorModulate = OldModulate;
    // End:0x210
    if(DrawResult(C))
    {
    }
    // End:0x2ee
    else
    {
        DrawGameNotice(C);
        HudPart_KillMessage.DrawNative(C);
        DrawNametags(C, true, PlayerController(Owner).PlayerReplicationInfo.bAdminSpecator);
        ShowEnemyWhoKillMe(C);
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        HudPart_DisplayMain.DrawSpectating(C);
        HudPart_DisplayEvent.DrawSpectating(C);
        HudPart_DisplayQuest.DrawSpectating(C);
        // End:0x2ee
        if(Level.GetMatchMaker().BotTutorial)
        {
            HudPart_Tutorial.DrawSpectatingHud(C);
        }
    }
}

function ShowEnemyWhoKillMe(Canvas C)
{
    // End:0x98
    if(PlayerOwner.IsInState('Dead') && PlayerOwner.KillerPawn != none)
    {
        // End:0x98
        if(DiedTime + ShowTime_NameTag_EnemyWhoKillMe > Level.TimeSeconds)
        {
            wPawn(PlayerOwner.KillerPawn).NametagPosition = CalcNametagPos(PlayerOwner.KillerPawn);
            DrawNameTag(C, wPawn(PlayerOwner.KillerPawn));
        }
    }
}

simulated function string GetInfoString()
{
    local string InfoString;

    // End:0x9e
    if(PlayerOwner.IsDead())
    {
        // End:0x44
        if(PlayerOwner.PlayerReplicationInfo.bOutOfLives)
        {
            InfoString = class'ScoreBoardDeathMatch'.default.OutFireText;
        }
        // End:0x9b
        else
        {
            // End:0x87
            if(Level.TimeSeconds - UnrealPlayer(PlayerOwner).LastKickWarningTime < float(2))
            {
                InfoString = class'GameMessage'.default.KickWarning;
            }
            // End:0x9b
            else
            {
                InfoString = class'ScoreBoardDeathMatch'.default.Restart;
            }
        }
    }
    // End:0x164
    else
    {
        // End:0xe1
        if(Level.TimeSeconds - UnrealPlayer(PlayerOwner).LastKickWarningTime < float(2))
        {
            InfoString = class'GameMessage'.default.KickWarning;
        }
        // End:0x164
        else
        {
            // End:0x11a
            if(GUIController(PlayerOwner.Player.GUIController).ActivePage != none)
            {
                InfoString = AtMenus;
            }
            // End:0x164
            else
            {
                // End:0x159
                if(PlayerOwner.PlayerReplicationInfo != none && PlayerOwner.PlayerReplicationInfo.bWaitingPlayer)
                {
                    InfoString = WaitingToSpawn;
                }
                // End:0x164
                else
                {
                    InfoString = InitialViewingString;
                }
            }
        }
    }
    return InfoString;
}

simulated function DrawHUDAnimDigit(out NumericWidget HUDPiece, float DefaultScale, float PickUPTime, float AnimTime, Color DefaultColor, Color colorHighlight)
{
    // End:0x12d
    if(PickUPTime > Level.TimeSeconds - AnimTime)
    {
        HUDPiece.Tints[TeamIndex].R = byte(float(colorHighlight.R) + float(DefaultColor.R - colorHighlight.R) * Level.TimeSeconds - PickUPTime);
        HUDPiece.Tints[TeamIndex].B = byte(float(colorHighlight.B) + float(DefaultColor.B - colorHighlight.B) * Level.TimeSeconds - PickUPTime);
        HUDPiece.Tints[TeamIndex].G = byte(float(colorHighlight.G) + float(DefaultColor.G - colorHighlight.G) * Level.TimeSeconds - PickUPTime);
    }
    // End:0x143
    else
    {
        HUDPiece.Tints[TeamIndex] = DefaultColor;
    }
}

simulated function DrawHUDAnimWidget(out SpriteWidget HUDPiece, float DefaultScale, float PickUPTime, float AnimTime, float AnimScale)
{
    // End:0xb7
    if(PickUPTime > Level.TimeSeconds - AnimTime)
    {
        // End:0x7a
        if(PickUPTime > Level.TimeSeconds - AnimTime / float(2))
        {
            HUDPiece.TextureScale = DefaultScale * float(1) + AnimScale * Level.TimeSeconds - PickUPTime;
        }
        // End:0xb4
        else
        {
            HUDPiece.TextureScale = DefaultScale * float(1) + AnimScale * PickUPTime + AnimTime - Level.TimeSeconds;
        }
    }
    // End:0xc7
    else
    {
        HUDPiece.TextureScale = DefaultScale;
    }
}

simulated function DrawStaticCrossHair(Canvas C)
{
    local Texture H, W;

    H = texture'cross_h';
    W = texture'cross_w';
    C.Reset();
    C.SetPos(ch_up_x, ch_up_y);
    C.DrawTile(H, ch_up_width, ch_up_height, 0.0, 0.0, ch_up_width, ch_up_height);
    C.SetPos(ch_down_x, ch_down_y);
    C.DrawTile(H, ch_down_width, ch_down_height, 0.0, 0.0, ch_down_width, ch_down_height);
    C.SetPos(ch_left_x, ch_left_y);
    C.DrawTile(W, ch_left_width, ch_left_height, 0.0, 0.0, ch_left_width, ch_left_height);
    C.SetPos(ch_right_x, ch_right_y);
    C.DrawTile(W, ch_right_width, ch_right_height, 0.0, 0.0, ch_right_width, ch_right_height);
}

simulated function DrawTurretCrossHair(Canvas C)
{
    local Texture cht;
    local float X, Y;

    C.DrawColor = CrossHairColor;
    C.Reset();
    X = C.ClipX / float(2) - float(32);
    Y = C.ClipY / float(2) - float(32);
    Y = Y + float(10);
    C.SetPos(X, Y);
    C.DrawTile(cht, 64.0, 64.0, 0.0, 0.0, 64.0, 64.0);
}

function UpdateCrossHairSpread()
{
    local int iSpread_Dest, iCurrentWeaponID;
    local float fSpread;
    local wWeaponBaseParams WBP;

    // End:0x157
    if(PlayerOwner.Pawn != none && PlayerOwner.Pawn.Weapon != none && PlayerOwner.Pawn.Weapon.GetFireMode(0).IsA('wInstantFire'))
    {
        fSpread = wInstantFire(PlayerOwner.Pawn.Weapon.GetFireMode(0)).Spread;
        iSpread_Dest = int(fSpread * fSpread_Constant);
        // End:0x10a
        if(iSpread_Dest > iSpread_Curr)
        {
            iSpread_Curr += int(PlayerOwner.Pawn.Weapon.BaseParams.fSpread_Image_Increase * Level.TimeSeconds - fPrevLevelSeconds);
        }
        // End:0x124
        if(iSpread_Dest < iSpread_Curr)
        {
            iSpread_Curr = iSpread_Dest;
        }
        iSpread_Curr += PlayerOwner.Pawn.Weapon.BaseParams.iSpread_Visual_Add;
    }
    // End:0x28e
    else
    {
        // End:0x287
        if(Pawn(PlayerOwner.ViewTarget) != none && !Pawn(PlayerOwner.ViewTarget).bIsAiming)
        {
            iCurrentWeaponID = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.iCurrentWeaponID;
            WBP = Level.WeaponMgr.GetBaseParam(iCurrentWeaponID);
            fSpread = Pawn(PlayerOwner.ViewTarget).fWeaponSpread;
            iSpread_Dest = int(fSpread * fSpread_Constant);
            // End:0x255
            if(iSpread_Dest > iSpread_Curr)
            {
                iSpread_Curr += int(WBP.fSpread_Image_Increase * Level.TimeSeconds - fPrevLevelSeconds);
            }
            // End:0x26f
            if(iSpread_Dest < iSpread_Curr)
            {
                iSpread_Curr = iSpread_Dest;
            }
            iSpread_Curr += WBP.iSpread_Visual_Add;
        }
        // End:0x28e
        else
        {
            iSpread_Curr = 0;
        }
    }
    fPrevLevelSeconds = Level.TimeSeconds;
}

function DrawWarfareCrosshair_Image(Canvas C, Material mat)
{
    local float X, Y, XL, YL;

    // End:0x137
    if(mat != none)
    {
        XL = float(mat.MaterialUSize()) / 1024.0 * C.ClipX;
        YL = float(mat.MaterialVSize()) / 768.0 * C.ClipY;
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        X = C.ClipX / float(2) - XL / float(2);
        Y = C.ClipY / float(2) - YL / float(2);
        C.SetPos(X, Y);
        C.DrawTile(mat, XL, YL, 0.0, 0.0, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
    }
}

simulated function DrawCrosshair(Canvas C)
{
    local float NormalScale;
    local int i, CurrentCrosshair;
    local float OldScale, OldW, CurrentCrosshairScale;
    local Color CurrentCrosshairColor;
    local SpriteWidget CHtexture;

    // End:0x28
    if(PawnOwner.bSpecialCrosshair)
    {
        PawnOwner.SpecialDrawCrosshair(C);
        return;
    }
    // End:0x35
    if(!bCrosshairShow)
    {
        return;
    }
    // End:0x1db
    if(bUseCustomWeaponCrosshairs && PawnOwner != none && PawnOwner.Weapon != none)
    {
        CurrentCrosshair = PawnOwner.Weapon.CustomCrosshair;
        // End:0xc3
        if(CurrentCrosshair == -1 || CurrentCrosshair == Crosshairs.Length)
        {
            CurrentCrosshair = CrosshairStyle;
            CurrentCrosshairColor = CrossHairColor;
            CurrentCrosshairScale = CrosshairScale;
        }
        // End:0x1d8
        else
        {
            CurrentCrosshairColor = PawnOwner.Weapon.CustomCrossHairColor;
            CurrentCrosshairScale = PawnOwner.Weapon.CustomCrossHairScale;
            // End:0x1d8
            if(PawnOwner.Weapon.CustomCrossHairTextureName != "")
            {
                // End:0x1a9
                if(PawnOwner.Weapon.CustomCrossHairTexture == none)
                {
                    // End:0x1a9
                    if(PawnOwner.Weapon.CustomCrossHairTexture == none)
                    {
                        Log(string(PawnOwner.Weapon) $ " custom crosshair texture not found!");
                        PawnOwner.Weapon.CustomCrossHairTextureName = "";
                    }
                }
                CHtexture = Crosshairs[0];
                CHtexture.WidgetTexture = PawnOwner.Weapon.CustomCrossHairTexture;
            }
        }
    }
    // End:0x1fc
    else
    {
        CurrentCrosshair = CrosshairStyle;
        CurrentCrosshairColor = CrossHairColor;
        CurrentCrosshairScale = CrosshairScale;
    }
    CurrentCrosshair = Clamp(CurrentCrosshair, 0, Crosshairs.Length - 1);
    NormalScale = Crosshairs[CurrentCrosshair].TextureScale;
    // End:0x24a
    if(CHtexture.WidgetTexture == none)
    {
        CHtexture = Crosshairs[CurrentCrosshair];
    }
    CHtexture.TextureScale *= 0.50 * CurrentCrosshairScale;
    i = 0;
    J0x269:
    // End:0x295 [While If]
    if(i < 2)
    {
        CHtexture.Tints[i] = CurrentCrosshairColor;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x269;
    }
    // End:0x335
    if(LastPickupTime > Level.TimeSeconds - 0.40)
    {
        // End:0x302
        if(LastPickupTime > Level.TimeSeconds - 0.20)
        {
            CHtexture.TextureScale *= float(1) + float(5) * Level.TimeSeconds - LastPickupTime;
        }
        // End:0x335
        else
        {
            CHtexture.TextureScale *= float(1) + float(5) * LastPickupTime + 0.40 - Level.TimeSeconds;
        }
    }
    OldScale = HudScale;
    HudScale = 1.0;
    OldW = C.ColorModulate.W;
    C.ColorModulate.W = 1.0;
    DrawSpriteWidget(C, CHtexture);
    C.ColorModulate.W = OldW;
    HudScale = OldScale;
    CHtexture.TextureScale = NormalScale;
    DrawEnemyName(C);
}

function DrawEnemyName(Canvas C)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, ViewPos;

    // End:0x35
    if(PlayerOwner.bBehindView || bNoEnemyNames || PawnOwner.Controller == none)
    {
        return;
    }
    ViewPos = PawnOwner.Location + PawnOwner.BaseEyeHeight * vect(0.0, 0.0, 1.0);
    HitActor = Trace(HitLocation, HitNormal, ViewPos + float(1200) * vector(PawnOwner.Controller.Rotation), ViewPos, true);
    // End:0x1e3
    if(Pawn(HitActor) != none && Pawn(HitActor).PlayerReplicationInfo != none && !Pawn(HitActor).bHidden && HitActor != PawnOwner && PawnOwner.PlayerReplicationInfo.Team == none || PawnOwner.PlayerReplicationInfo.Team != Pawn(HitActor).PlayerReplicationInfo.Team)
    {
        // End:0x1ca
        if(NamedPlayer != Pawn(HitActor).PlayerReplicationInfo || Level.TimeSeconds - NameTime > 0.50)
        {
            DisplayEnemyName(C, Pawn(HitActor).PlayerReplicationInfo);
            NameTime = Level.TimeSeconds;
        }
        NamedPlayer = Pawn(HitActor).PlayerReplicationInfo;
    }
}

function DisplayEnemyName(Canvas C, PlayerReplicationInfo PRI)
{
    PlayerOwner.ReceiveLocalizedMessage(class'PlayerNameMessage', 0, PRI);
}

function FadeZoom()
{
    // End:0x52
    if(PawnOwner != none && PawnOwner.Weapon != none && PawnOwner.Weapon.WantsZoomFade())
    {
        ZoomToggleTime = Level.TimeSeconds;
    }
}

function ZoomFadeOut(Canvas C)
{
    local float FadeValue;

    // End:0x21
    if(Level.TimeSeconds - ZoomToggleTime >= FadeTime)
    {
        return;
    }
    // End:0x4d
    if(ZoomToggleTime > Level.TimeSeconds)
    {
        ZoomToggleTime = Level.TimeSeconds;
    }
    FadeValue = 255.0 * 1.0 - Level.TimeSeconds - ZoomToggleTime / FadeTime;
    C.DrawColor.A = byte(FadeValue);
    C.Style = 5;
    C.SetPos(0.0, 0.0);
    C.DrawTile(texture'BlackTexture', float(C.SizeX), float(C.SizeY), 0.0, 0.0, 16.0, 16.0);
}

function DisplayVoiceGain(Canvas C)
{
    local Texture Tex;
    local float VoiceGain, PosY, BlockSize, XL, YL;

    local int i;
    local string ActiveName;

    BlockSize = 8192.0 / C.ClipX * HudScale;
    Tex = texture'WhiteSquareTexture';
    PosY = C.ClipY * 0.3750;
    VoiceGain = 1.0 - float(3 * Min(int(Level.TimeSeconds - LastVoiceGainTime), int(0.33330))) * LastVoiceGain;
    i = 0;
    J0x89:
    // End:0x16d [While If]
    if(i < 10)
    {
        // End:0x163
        if(VoiceGain > 0.10 * float(i))
        {
            C.SetPos(0.50 * BlockSize, PosY);
            C.SetDrawColor(byte(28.30 * float(i)), byte(float(255) - 28.30 * float(i)), 0, byte(255));
            C.DrawTile(Tex, BlockSize, BlockSize, 0.0, 0.0, float(Tex.USize), float(Tex.VSize));
            PosY -= 1.20 * BlockSize;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x89;
    }
    // End:0x1ac
    if(PlayerOwner != none && PlayerOwner.ActiveRoom != none)
    {
        ActiveName = PlayerOwner.ActiveRoom.GetTitle();
    }
    // End:0x361
    if(ActiveName != "")
    {
        ActiveName = "(" @ ActiveName @ ")";
        C.Font = GetFontSizeIndex(C, -2);
        C.StrLen(ActiveName, XL, YL);
        // End:0x260
        if(XL > 0.1250 * C.ClipY)
        {
            C.Font = GetFontSizeIndex(C, -4);
            C.StrLen(ActiveName, XL, YL);
        }
        C.SetPos(BlockSize * float(2), C.ClipY * 0.3750 + BlockSize - YL);
        C.DrawColor = C.MakeColor(160, 160, 160);
        // End:0x350
        if(PlayerOwner != none && PlayerOwner.PlayerReplicationInfo != none)
        {
            // End:0x350
            if(PlayerOwner.PlayerReplicationInfo.Team != none)
            {
                // End:0x33c
                if(PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == 0)
                {
                    C.DrawColor = RedColor;
                }
                // End:0x350
                else
                {
                    C.DrawColor = TurqColor;
                }
            }
        }
        C.DrawText(ActiveName);
    }
}

function float CalculateHPBar(bool bDamage, bool bRecovery)
{
    local float fDeltaTime, fResultValue;

    // End:0xcd
    if(bDamage)
    {
        // End:0xc0
        if(bBeginDamage)
        {
            fDeltaTime = Level.TimeSeconds - fBeginDamageTime;
            // End:0x5c
            if(fDeltaTime > fHPDelayTime)
            {
                fAddValue = fAddValue - fHPDisplayRatio * fDeltaTime - fHPDelayTime;
            }
            // End:0x8c
            if(fAddValue <= 0.0 || CurHealth >= 100)
            {
                fAddValue = 0.0;
                bBeginDamage = false;
            }
            // End:0xb2
            if(fDeltaTime > fHPDelayTime)
            {
                fResultValue = float(CurHealth) + fAddValue;
            }
            // End:0xbd
            else
            {
                fResultValue = fLastHealth;
            }
        }
        // End:0xcd
        else
        {
            fResultValue = float(CurHealth);
        }
    }
    // End:0x19b
    if(bRecovery)
    {
        // End:0x18e
        if(bBeginRecovery)
        {
            fDeltaTime = Level.TimeSeconds - fBeginDamageTime;
            // End:0x129
            if(fDeltaTime > fHPDelayTime)
            {
                fAddValue = fAddValue + fHPDisplayRatio * fDeltaTime - fHPDelayTime;
            }
            // End:0x15a
            if(fAddValue >= 0.0 || fLastHealth <= float(0))
            {
                fAddValue = 0.0;
                bBeginRecovery = false;
            }
            // End:0x180
            if(fDeltaTime > fHPDelayTime)
            {
                fResultValue = float(CurHealth) + fAddValue;
            }
            // End:0x18b
            else
            {
                fResultValue = fLastHealth;
            }
        }
        // End:0x19b
        else
        {
            fResultValue = float(CurHealth);
        }
    }
    return fResultValue;
}

function SellectEffectBar()
{
    // End:0x81
    if(CurHealth < LastHealth)
    {
        // End:0x63
        if(bBeginDamage == false)
        {
            bBeginDamage = true;
            bBeginRecovery = false;
            fBeginDamageTime = Level.TimeSeconds;
            fAddValue = float(LastHealth - CurHealth);
            fLastHealth = float(LastHealth);
        }
        // End:0x7e
        else
        {
            fAddValue = fAddValue + float(LastHealth - CurHealth);
        }
    }
    // End:0xff
    else
    {
        // End:0xff
        if(CurHealth > LastHealth)
        {
            // End:0xe4
            if(bBeginRecovery == false)
            {
                bBeginDamage = false;
                bBeginRecovery = true;
                fBeginDamageTime = Level.TimeSeconds;
                fAddValue = float(LastHealth - CurHealth);
                fLastHealth = float(LastHealth);
            }
            // End:0xff
            else
            {
                fAddValue = fAddValue + float(LastHealth - CurHealth);
            }
        }
    }
}

function DrawHpStamina(Canvas C, optional bool bShowSpectating)
{
    local float fStaminaRatio, X1, Y1, X2, Y2, XL,
	    YL, U, V, UL, VL,
	    fWidth, fHeight, fHPIconPosX, fHPIconPosY, fSpectatingPosX,
	    fSpectatingPosY;

    local int nFloorTimeSeconds;
    local float fDeltaTimeSeconds;

    // End:0x135
    if(!bShowSpectating)
    {
        // End:0x51
        if(PlayerOwner == none || PlayerOwner.Pawn == none || PawnOwner == none || PawnOwner.wMyParam == none)
        {
            return;
        }
        HpStaminaBackground.OffsetX = default.HpStaminaBackground.OffsetX;
        HpStaminaBackground.OffsetY = default.HpStaminaBackground.OffsetY;
        HpBarBackground.OffsetX = default.HpBarBackground.OffsetX;
        HpBarBackground.OffsetY = default.HpBarBackground.OffsetY;
        DamageBar.OffsetX = default.DamageBar.OffsetX;
        DamageBar.OffsetY = default.DamageBar.OffsetY;
        RecoveryBar.OffsetX = default.RecoveryBar.OffsetX;
        RecoveryBar.OffsetY = default.RecoveryBar.OffsetY;
        fHPIconPosX = float(default.HPIcon.OffsetX);
        fHPIconPosY = float(default.HPIcon.OffsetY);
        HPCount.OffsetY = default.HPCount.OffsetY;
    }
    // End:0x285
    else
    {
        fSpectatingPosX = 86.0;
        fSpectatingPosY = 1140.0;
        HpStaminaBackground.OffsetY = default.HpStaminaBackground.OffsetY + 6;
        HpBarBackground.OffsetY = default.HpBarBackground.OffsetY + 6;
        DamageBar.OffsetY = default.DamageBar.OffsetY + 6;
        RecoveryBar.OffsetY = default.RecoveryBar.OffsetY + 6;
        fHPIconPosX = 57.0;
        fHPIconPosY = float(HpBarBackground.OffsetY);
        HPCount.OffsetY = default.HPCount.OffsetY + 6;
        // End:0x232
        if(ViewTarget != Pawn(PlayerOwner.ViewTarget))
        {
            ViewTarget = Pawn(PlayerOwner.ViewTarget);
            AttackerLoc = ViewTarget.AttackerLoc;
        }
        // End:0x285
        else
        {
            // End:0x285
            if(ViewTarget != none && ViewTarget.AttackerLoc != AttackerLoc)
            {
                AttackerLoc = ViewTarget.AttackerLoc;
                AddDamageIndicationInfo(AttackerLoc, 0, PawnOwner.HitDamageType);
            }
        }
    }
    SellectEffectBar();
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x2b5
    if(!bShowSpectating)
    {
    }
    X1 = default.HPIcon.PosX + fHPIconPosX / 1600.0 * C.ClipX;
    Y1 = default.HPIcon.PosY + fHPIconPosY / 1200.0 * C.ClipY;
    fWidth = 29.0 / 1600.0;
    fHeight = 20.0 / 1200.0;
    X2 = X1 + fWidth * C.ClipX;
    Y2 = Y1 + fHeight * C.ClipY;
    XL = X2 - X1;
    YL = Y2 - Y1;
    U = float(HPIcon.TextureCoords.X1);
    V = float(HPIcon.TextureCoords.Y1);
    UL = float(HPIcon.TextureCoords.X2 - HPIcon.TextureCoords.X1);
    VL = float(HPIcon.TextureCoords.Y2 - HPIcon.TextureCoords.Y1);
    C.SetPos(X1, Y1);
    C.DrawTile(HPIcon.WidgetTexture, XL, YL, U, V, UL, VL);
    X1 = HpBarBackground.PosX + float(HpBarBackground.OffsetX) / 1600.0 * C.ClipX;
    Y1 = HpBarBackground.PosY + float(HpBarBackground.OffsetY) / 1200.0 * C.ClipY;
    fWidth = 167.0 / 1600.0;
    fHeight = 20.0 / 1200.0;
    X2 = X1 + fWidth * C.ClipX;
    Y2 = Y1 + fHeight * C.ClipY;
    XL = X2 - X1;
    YL = Y2 - Y1;
    C.SetPos(X1, Y1);
    C.DrawTilePartialStretched(HpBarBackground.WidgetTexture, XL, YL);
    X1 = DamageBar.PosX + float(DamageBar.OffsetX) / 1600.0 * C.ClipX;
    Y1 = DamageBar.PosY + float(DamageBar.OffsetY) / 1200.0 * C.ClipY;
    C.SetPos(X1, Y1);
    fWidth = 167.0 / 1600.0;
    fHeight = 20.0 / 1200.0;
    X2 = X1 + fWidth * C.ClipX;
    Y2 = Y1 + fHeight * C.ClipY;
    // End:0x7a5
    if(bBeginDamage)
    {
        fCurrentDamageBar = CalculateHPBar(true, false);
        // End:0x7a5
        if(CurHealth < int(fCurrentDamageBar))
        {
            XL = X2 - X1 * fCurrentDamageBar / 100.0;
            YL = Y2 - Y1;
            U = float(DamageBar.TextureCoords.X1);
            V = float(DamageBar.TextureCoords.Y1);
            UL = float(DamageBar.TextureCoords.X2 - DamageBar.TextureCoords.X1);
            VL = float(DamageBar.TextureCoords.Y2 - DamageBar.TextureCoords.Y1);
            C.DrawTile(DamageBar.WidgetTexture, XL, YL, U, V, UL * fCurrentDamageBar / 100.0, VL);
        }
    }
    fCurrentHPBar = CalculateHPBar(false, true);
    // End:0x8df
    if(bBeginRecovery)
    {
        // End:0x8df
        if(CurHealth > int(fCurrentHPBar))
        {
            XL = X2 - X1 * float(CurHealth) / 100.0;
            YL = Y2 - Y1;
            U = float(RecoveryBar.TextureCoords.X1);
            V = float(RecoveryBar.TextureCoords.Y1);
            UL = float(RecoveryBar.TextureCoords.X2 - RecoveryBar.TextureCoords.X1);
            VL = float(RecoveryBar.TextureCoords.Y2 - RecoveryBar.TextureCoords.Y1);
            C.SetPos(X1, Y1);
            C.DrawTile(RecoveryBar.WidgetTexture, XL, YL, U, V, UL * float(CurHealth) / 100.0, VL);
        }
    }
    XL = X2 - X1 * fCurrentHPBar / 100.0;
    YL = Y2 - Y1;
    U = float(HpBar.TextureCoords.X1);
    V = float(HpBar.TextureCoords.Y1);
    UL = float(HpBar.TextureCoords.X2 - HpBar.TextureCoords.X1);
    VL = float(HpBar.TextureCoords.Y2 - HpBar.TextureCoords.Y1);
    C.SetPos(X1, Y1);
    C.DrawTile(HpBar.WidgetTexture, XL, YL, U, V, UL * fCurrentHPBar / 100.0, VL);
    HPCount.Value = int(fCurrentHPBar);
    DrawNumericWidget(C, HPCount, WDigitsHP);
    HudPart_DisplayEvent.DrawEvent_Item_HealthPack(C);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawPosture(Canvas C, optional bool bShowSpectating)
{
    local float X1, Y1, X2, Y2, XL, YL,
	    U, V, UL, VL, fWidth,
	    fHeight;

    local SpriteWidget ActivePosture;
    local Pawn showPawn;

    // End:0x45
    if(!bShowSpectating)
    {
        // End:0x2e
        if(PlayerOwner == none || PlayerOwner.Pawn == none)
        {
            return;
        }
        showPawn = PlayerOwner.Pawn;
    }
    // End:0x50
    else
    {
        showPawn = PawnOwner;
    }
    // End:0x70
    if(showPawn.bIsCrouched)
    {
        ActivePosture = PostureCrouch;
    }
    // End:0xbb
    else
    {
        // End:0x90
        if(showPawn.bIsProned)
        {
            ActivePosture = PostureDown;
        }
        // End:0xbb
        else
        {
            // End:0xb0
            if(showPawn.bIsSprinting)
            {
                ActivePosture = PostureRun;
            }
            // End:0xbb
            else
            {
                ActivePosture = PostureStand;
            }
        }
    }
    // End:0xe1
    if(bShowSpectating)
    {
        ActivePosture.OffsetX = 15;
        ActivePosture.OffsetY = 1135;
    }
    X1 = ActivePosture.PosX + float(ActivePosture.OffsetX) * ScreenRatioXEx * C.ClipX;
    Y1 = ActivePosture.PosY + float(ActivePosture.OffsetY) * ScreenRatioYEx * C.ClipY;
    fWidth = 42.0 * ScreenRatioXEx;
    fHeight = 42.0 * ScreenRatioYEx;
    X2 = X1 + fWidth * C.ClipX;
    Y2 = Y1 + fHeight * C.ClipY;
    XL = X2 - X1;
    YL = Y2 - Y1;
    U = float(ActivePosture.TextureCoords.X1);
    V = float(ActivePosture.TextureCoords.Y1);
    UL = float(ActivePosture.TextureCoords.X2 - ActivePosture.TextureCoords.X1);
    VL = float(ActivePosture.TextureCoords.Y2 - ActivePosture.TextureCoords.Y1);
    C.SetPos(X1, Y1);
    C.DrawTile(ActivePosture.WidgetTexture, XL, YL, U, V, UL, VL);
}

function AddTeamDeathInfo(Pawn P, PlayerReplicationInfo PRI, float FadeTime, float Duration)
{
    local TeamDeathInfo Info;

    Log("[HudCDeathMatch::AddTeamDeathInfo] name=" $ string(P.Name));
    Info.TeamIndex = PRI.Team.TeamIndex;
    Info.Position = P.Location;
    Info.HeadPosition = P.Location;
    Info.HeadPosition.Z += TeamDeath_HeightOffset;
    Info.TimeToRemove = Level.TimeSeconds + Duration;
    Info.TimeToStartFade = Info.TimeToRemove - FadeTime;
    TeamDeathInfos[TeamDeathInfos.Length] = Info;
}

function DrawAllTeamDeathInfo(Canvas C)
{
    local int lp1;
    local Vector camLoc;
    local Rotator camRot;
    local Vector ScreenPos;

    C.GetCameraLocation(camLoc, camRot);
    lp1 = TeamDeathInfos.Length - 1;
    J0x28:
    // End:0x6c [While If]
    if(lp1 >= 0)
    {
        // End:0x62
        if(TeamDeathInfos[lp1].TimeToRemove <= Level.TimeSeconds)
        {
            TeamDeathInfos.Remove(lp1, 1);
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x28;
    }
    lp1 = 0;
    J0x73:
    // End:0xdf [While If]
    if(lp1 < TeamDeathInfos.Length)
    {
        // End:0xd5
        if(IsTargetInFrontOfPlayer2(C, TeamDeathInfos[lp1].HeadPosition, ScreenPos, camLoc, camRot))
        {
            DrawTeamDeathInfo(C, ScreenPos, camLoc, camRot, TeamDeathInfos[lp1]);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x73;
    }
}

function DrawTeamDeathInfo(Canvas C, Vector ScreenPos, Vector camLoc, Rotator camRot, TeamDeathInfo Info)
{
    ScreenPos = C.WorldToScreen(Info.HeadPosition);
    ClipScreenCoords(C, ScreenPos.X, ScreenPos.Y);
    TeamDeathSprite.PosX = ScreenPos.X / C.ClipX;
    TeamDeathSprite.PosY = ScreenPos.Y / C.ClipY;
    TeamDeathSprite.TextureScale = GetTeamDeathTextureScale(Info);
    TeamDeathSprite.Tints[0] = GetTeamDeathTextureColor(Info);
    TeamDeathSprite.Tints[1] = TeamDeathSprite.Tints[0];
    DrawSpriteWidget(C, TeamDeathSprite);
}

function Color GetTeamDeathTextureColor(TeamDeathInfo Info)
{
    local Color C;
    local float ratio, cBase;

    // End:0x2b
    if(Level.TimeSeconds < Info.TimeToStartFade)
    {
        ratio = 1.0;
    }
    // End:0x75
    else
    {
        ratio = Level.TimeSeconds - Info.TimeToStartFade / Info.TimeToRemove - Info.TimeToStartFade;
        ratio = 1.0 - ratio;
    }
    cBase = 255.0 * ratio;
    C.R = byte(cBase);
    C.G = byte(cBase);
    C.B = byte(cBase);
    C.A = byte(cBase);
    return C;
}

function float GetTeamDeathTextureScale(TeamDeathInfo Info)
{
    local float texScale, dist, ratio;

    dist = VSize(Info.Position - PawnOwner.Location);
    // End:0x3f
    if(dist < TeamDeath_MinDist)
    {
        texScale = TeamDeath_MaxScale;
    }
    // End:0xae
    else
    {
        // End:0x5c
        if(dist > TeamDeath_MaxDist)
        {
            texScale = TeamDeath_MinScale;
        }
        // End:0xae
        else
        {
            ratio = dist - TeamDeath_MinDist / TeamDeath_MaxDist - TeamDeath_MinDist;
            ratio = 1.0 - ratio;
            texScale = TeamDeath_MinScale + TeamDeath_MaxScale - TeamDeath_MinScale * ratio;
        }
    }
    return texScale;
}

function NotifyDeath(Pawn P)
{
    local PlayerReplicationInfo pPRI;
    local wMatchMaker MM;

    MM = Level.GetMatchMaker();
    // End:0x33
    if(P == PawnOwner)
    {
        ClearDamageIndicationInfos();
        StopNotifyHealthInDanager();
    }
    // End:0x162
    else
    {
        pPRI = FindPRI(P);
        // End:0x162
        if(pPRI != none)
        {
            HudPart_Minimap.PushDeadOnMinimap(pPRI.Team.TeamIndex, P.Location);
            // End:0xe2
            if(ScoreBoard != none && xScoreBoardTeamGame(ScoreBoard) != none)
            {
                xScoreBoardTeamGame(ScoreBoard).PartMinimap.PushDeadOnMinimap(pPRI.Team.TeamIndex, P.Location);
            }
            // End:0x162
            if(pPRI.Team.TeamIndex == PawnOwnerPRI.Team.TeamIndex && MM.GetGameModeNum(MM.szGameClass) != MM.2)
            {
                AddTeamDeathInfo(P, pPRI, 2.0, 15.0);
            }
        }
    }
    // End:0x17c
    if(P != none)
    {
        HudPart_DisplayEvent.FFARankingSorting();
    }
}

function DrawHudPassA_Score(Canvas C)
{
    local bool bDraw;

    // End:0x85
    if(Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        bDraw = !Level.GetMatchMaker().BotTutorial;
        // End:0x82
        if(bDraw)
        {
            HudPart_DisplayEvent.DrawMainScore(C);
            HudPart_DisplayEvent.DrawGameMode(C);
        }
    }
    // End:0x99
    else
    {
        HudPart_DisplayEvent.DrawFFAScore(C);
    }
}

function DrawSkill_Slot5(Canvas C)
{
    local CalCoordsW calW;

    CalculateCoordinateEx(C, SkillSlot5, 64.0, 64.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(SkillSlot5.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x12c
    if(bBlinkState == true && SkillSlot5.WidgetTexture != matEmptySkillSlot)
    {
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(matSkillBlink, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
}

function DrawSkill_Slot6(Canvas C)
{
    local CalCoordsW calW;

    CalculateCoordinateEx(C, SkillSlot6, 64.0, 64.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(SkillSlot6.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x129
    if(bBlinkState && SkillSlot6.WidgetTexture != matEmptySkillSlot)
    {
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(matSkillBlink, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
}

function DrawSkill(Canvas C)
{
    // End:0x0d
    if(PlayerOwner == none)
    {
        return;
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x7d
    if(Level.TimeSeconds - fBlinkLastTime > fBlinkDelayTime)
    {
        bBlinkState = !bBlinkState;
        fBlinkLastTime = Level.TimeSeconds;
    }
    DrawSkill_Slot6(C);
    CheckPawnOwnerSkill(HasSkillC4, HasSkillAirStirke, HasSkillRPG);
    HudPart_DisplayEvent.SetSkillState(HasSkillC4, HasSkillAirStirke, HasSkillRPG);
    DrawSkill_Slot5(C);
    HudPart_DisplayMain.DrawHelpKeyControll(C);
}

function InitSkillFlag()
{
    bSkill_RPG7 = false;
    bSkill_M2B = false;
    bSkill_ATR = false;
}

function bool HasItemInMyInventory(optional bool bCheck, optional int ItemID1, optional int ItemID2)
{
    local Inventory Inv;
    local wWeapon Wpn;
    local int wID, InvenCount;
    local float Max, curr;
    local wRocketLauncher wRocket;

    Inv = PawnOwner.Inventory;
    J0x14:
    // End:0x1ac [While If]
    if(Inv != none)
    {
        Wpn = wWeapon(Inv);
        ++ InvenCount;
        // End:0x78
        if(InvenCount > 100)
        {
            Log("[HudCDeathMatch::HasItemInMyInventory 100 over]");
        }
        // End:0x1ac
        else
        {
            // End:0xb0
            if(Wpn == none || Wpn.BaseParams == none)
            {
                Inv = Inv.Inventory;
            }
            // End:0x1a9
            else
            {
                Wpn.GetAmmoCount(Max, curr);
                wID = Wpn.BaseParams.iWeaponID;
                switch(wID)
                {
                    // End:0x11e
                    case 5001:
                        wRocket = wRocketLauncher(Wpn);
                        bSkill_ATR = wRocket.HasAmmoRocket();
                        // End:0x17a
                        break;
                    // End:0x149
                    case 5003:
                        // End:0x13e
                        if(curr <= float(0))
                        {
                            bSkill_M2B = false;
                        }
                        // End:0x146
                        else
                        {
                            bSkill_M2B = true;
                        }
                        // End:0x17a
                        break;
                    // End:0x177
                    case 5011:
                        wRocket = wRocketLauncher(Wpn);
                        bSkill_RPG7 = wRocket.HasAmmoRocket();
                    // End:0xffff
                    default:
                        Inv = Inv.Inventory;
                        // End:0x1a9
                        if(Inv == PawnOwner.Inventory)
                        {
                        }
                        // End:0x1ac
                        else
                        {
                        }
                        // This is an implied JumpToken; Continue!
                        goto J0x14;
                    }
                }
            }
            return false;
}

function CheckPawnOwnerSkill(out int skillC4, out int skillAirStirke, out int skillRPG)
{
    local Inventory Inv, wInventory;
    local wWeapon Wpn;
    local byte wInvGroup;
    local string wName;
    local int wID, InvenCount, iState;
    local float Max, curr;
    local int iTemp, iSkillID;

    skillC4 = 0;
    skillAirStirke = 0;
    skillRPG = 0;
    // End:0x2b
    if(PlayerOwner.SkillBase == none)
    {
        return;
    }
    iTemp = 0;
    J0x32:
    // End:0x11f [While If]
    if(iTemp < PlayerOwner.SkillBase.Skills.Length)
    {
        // End:0x115
        if(PlayerOwner.SkillBase.Skills[iTemp] != none)
        {
            iSkillID = PlayerOwner.SkillBase.Skills[iTemp].SkillID;
            switch(iSkillID)
            {
                // End:0xb5
                case 40001:
                    // End:0x115
                    break;
                // End:0xc0
                case 40002:
                    // End:0x115
                    break;
                // End:0xcb
                case 40003:
                    // End:0x115
                    break;
                // End:0xdd
                case 40004:
                    skillAirStirke = 1;
                    // End:0x115
                    break;
                // End:0xe5
                case 40005:
                // End:0xed
                case 40012:
                // End:0xf5
                case 40017:
                // End:0xfd
                case 40018:
                // End:0x10f
                case 40022:
                    iState = 1;
                    // End:0x115
                    break;
                // End:0xffff
                default:
                    // End:0x115 Break;
                    break;
                }
        }
        ++ iTemp;
        // This is an implied JumpToken; Continue!
        goto J0x32;
    }
    // End:0x13a
    if(bSkill_ATR || bSkill_M2B)
    {
        CallEvent(true);
    }
    // End:0x14c
    if(0 == ActiveUsingSkill.iState)
    {
        return;
    }
    // End:0x186
    if(Vehicle(PawnOwner) != none)
    {
        wInventory = wPawn(Vehicle(PawnOwner).Driver).Inventory;
    }
    // End:0x19a
    else
    {
        wInventory = PawnOwner.Inventory;
    }
    Inv = wInventory;
    J0x1a5:
    // End:0x304 [While If]
    if(Inv != none)
    {
        Wpn = wWeapon(Inv);
        ++ InvenCount;
        // End:0x208
        if(InvenCount > 100)
        {
            Log("[HudCDeathMatch::CheckPawnOwnerSkill 100 over]");
        }
        // End:0x304
        else
        {
            // End:0x240
            if(Wpn == none || Wpn.BaseParams == none)
            {
                Inv = Inv.Inventory;
            }
            // End:0x301
            else
            {
                wName = Wpn.BaseParams.strName;
                wInvGroup = Wpn.InventoryGroup;
                wID = Wpn.BaseParams.iWeaponID;
                // End:0x2cb
                if(wID == 5006)
                {
                    Wpn.GetAmmoCount(Max, curr);
                    // End:0x2cb
                    if(curr > float(0))
                    {
                        skillAirStirke = 2;
                    }
                }
                CheckUsingSkillList(Wpn, iState);
                Inv = Inv.Inventory;
                // End:0x301
                if(Inv == wInventory)
                {
                }
                // End:0x304
                else
                {
                }
                // This is an implied JumpToken; Continue!
                goto J0x1a5;
            }
        }
    }
    ActiveUsingSkill.iState = iState;
}

simulated function InsertUsingSkillList(int SkillID, optional int SubSkillID)
{
    local SkillProperty skillunit;

    Log("[InsertUsingSkillList] SkillId :" $ string(SkillID) $ ", SkillId : " $ string(ActiveUsingSkill.iSkillID) $ ", subSkill :" $ string(SubSkillID));
    // End:0x7a
    if(SkillID == ActiveUsingSkill.iSkillID)
    {
        return;
    }
    skillunit.iState = 1;
    switch(SkillID)
    {
        // End:0x121
        case 40005:
            skillunit.iSlotPos = 6;
            skillunit.iSkillID = SkillID;
            skillunit.iWeaponID = 7001;
            skillunit.matIcon = GetSkillIconByWeaponID(skillunit.iWeaponID);
            skillunit.wTex[0] = HudPart_DisplayEvent.default.WC4NotReady;
            skillunit.wTex[1] = HudPart_DisplayEvent.default.WC4;
            ActiveUsingSkill = skillunit;
            // End:0x386
            break;
        // End:0x1b5
        case 40012:
            skillunit.iSlotPos = 6;
            skillunit.iSkillID = SkillID;
            skillunit.iWeaponID = 5011;
            skillunit.matIcon = GetSkillIconByWeaponID(skillunit.iWeaponID);
            skillunit.wTex[0] = HudPart_DisplayEvent.default.WRPG7NotReady;
            skillunit.wTex[1] = HudPart_DisplayEvent.default.WRPG7;
            ActiveUsingSkill = skillunit;
            // End:0x386
            break;
        // End:0x1bd
        case 40017:
        // End:0x251
        case 50001:
            skillunit.iSlotPos = 6;
            skillunit.iSkillID = SkillID;
            skillunit.iWeaponID = 6005;
            skillunit.matIcon = GetSkillIconByWeaponID(skillunit.iWeaponID);
            skillunit.wTex[0] = HudPart_DisplayEvent.default.WNotReadyIncen;
            skillunit.wTex[1] = HudPart_DisplayEvent.default.WReadyIncen;
            ActiveUsingSkill = skillunit;
            // End:0x386
            break;
        // End:0x2e5
        case 40018:
            skillunit.iSlotPos = 6;
            skillunit.iSkillID = SkillID;
            skillunit.iWeaponID = 5015;
            skillunit.matIcon = GetSkillIconByWeaponID(skillunit.iWeaponID);
            skillunit.wTex[0] = HudPart_DisplayEvent.default.WNotReadyPinpointFire;
            skillunit.wTex[1] = HudPart_DisplayEvent.default.WReadyPinpointFire;
            ActiveUsingSkill = skillunit;
            // End:0x386
            break;
        // End:0x2ed
        case 40022:
        // End:0x381
        case 50002:
            skillunit.iSlotPos = 6;
            skillunit.iSkillID = SkillID;
            skillunit.iWeaponID = 7003;
            skillunit.matIcon = GetSkillIconByWeaponID(skillunit.iWeaponID);
            skillunit.wTex[0] = HudPart_DisplayEvent.default.WNotReadySpiltGrenade;
            skillunit.wTex[1] = HudPart_DisplayEvent.default.WReadySpiltGrenade;
            ActiveUsingSkill = skillunit;
            // End:0x386
            break;
        // End:0xffff
        default:
            return;
    }
    // End:0x3a5
    if(SubSkillID == 40023)
    {
        ActiveUsingSkill.iSkillID = SubSkillID;
    }
}

function Material GetSkillIconByWeaponID(int nWeaponID)
{
    switch(nWeaponID)
    {
        // End:0x53
        case 7001:
            return Material(DynamicLoadObject("Warfare_UI_Item.SupplySkillicon.icon_skil_time_c4", class'Material'));
        // End:0x9b
        case 5011:
            return Material(DynamicLoadObject("Warfare_UI_Item.SupplySkillicon.icon_wea_RPG7", class'Material'));
        // End:0xe5
        case 6005:
            return Material(DynamicLoadObject("Warfare_UI_Item.SupplySkillicon.icon_skil_incen", class'Material'));
        // End:0xed
        case 5013:
        // End:0x13a
        case 5015:
            return Material(DynamicLoadObject("Warfare_UI_Item.SupplySkillicon.icon_skil_hellfire", class'Material'));
        // End:0x186
        case 7003:
            return Material(DynamicLoadObject("Warfare_UI_Item.SupplySkillicon.icon_skil_Cluster", class'Material'));
        // End:0xffff
        default:
            return matEmptySkillSlot;
    }
}

function CheckUsingSkillList(wWeapon Wpn, out int iState)
{
    local byte wInvGroup;
    local string wName;
    local int wID;
    local float Max, curr;
    local wMatchMaker kMM;

    wName = Wpn.BaseParams.strName;
    wInvGroup = Wpn.InventoryGroup;
    wID = Wpn.BaseParams.iWeaponID;
    kMM = Level.GetMatchMaker();
    // End:0x14f
    if(wID == ActiveUsingSkill.iWeaponID)
    {
        ActiveUsingSkill.iSlotPos = wInvGroup;
        Wpn.GetAmmoCount(Max, curr);
        // End:0x14f
        if(curr > float(0))
        {
            iState = 2;
            // End:0x118
            if(2 != ActiveUsingSkill.iState)
            {
                // End:0xf2
                if(7001 == ActiveUsingSkill.iWeaponID && true == ActiveUsingSkill.bDrawed)
                {
                }
                // End:0x118
                else
                {
                    ActiveUsingSkill.fActiveTime = Level.TimeSeconds;
                    ActiveUsingSkill.bDrawed = false;
                }
            }
            // End:0x14f
            if(kMM.1 == kMM.eWeaponLimit)
            {
                // End:0x14f
                if(6 == wInvGroup)
                {
                    iState = 1;
                }
            }
        }
    }
}

function DrawAmmoSeparator(Canvas C)
{
    local float X1, Y1, W, H;

    X1 = AmmoSeparatorBeginX * C.ClipX;
    Y1 = AmmoSeparatorBeginY * C.ClipY;
    W = AmmoSeparatorWidth * C.ClipX;
    H = AmmoSeparatorHeight * C.ClipY;
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(X1, Y1);
    C.DrawTileClipped(AmmoSeparator.WidgetTexture, W, H, float(AmmoSeparator.TextureCoords.X1), float(AmmoSeparator.TextureCoords.Y1), float(AmmoSeparator.TextureCoords.X2 - AmmoSeparator.TextureCoords.X1), float(AmmoSeparator.TextureCoords.Y2 - AmmoSeparator.TextureCoords.Y1));
}

function DrawWeaponImage(Canvas C, optional bool bShowSpectating, optional out string sWeaponName)
{
    local string matName;
    local Pawn showPawn;
    local float fScale;
    local int iCurrentWeaponID;
    local string szIcon;
    local class<wWeaponRes_Base> wRes;
    local wWeaponBaseParams WBP;

    // End:0x54
    if(!bShowSpectating)
    {
        showPawn = PlayerOwner.Pawn;
        fScale = 1.0;
        C.SetPos(1339.0 * _reX, 1023.0 * _reY);
    }
    // End:0x91
    else
    {
        showPawn = PawnOwner;
        fScale = 1.20;
        C.SetPos(1343.0 * _reX, 1099.0 * _reY);
    }
    // End:0x2ca
    if(showPawn != none)
    {
        // End:0x177
        if(showPawn.Weapon != none)
        {
            matName = showPawn.Weapon.ResParams.default.szIcon_HUD;
            // End:0x128
            if(matCurrentWeapon == none || iDrawingWeaponID != showPawn.Weapon.BaseParams.iWeaponID)
            {
                matCurrentWeapon = Material(DynamicLoadObject(matName, class'Material'));
            }
            sWeaponName = showPawn.Weapon.BaseParams.strName;
            iDrawingWeaponID = showPawn.Weapon.BaseParams.iWeaponID;
        }
        // End:0x271
        else
        {
            iCurrentWeaponID = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.iCurrentWeaponID;
            WBP = Level.WeaponMgr.GetBaseParam(iCurrentWeaponID);
            // End:0x247
            if(matCurrentWeapon == none || iDrawingWeaponID != iCurrentWeaponID)
            {
                // End:0x218
                if(WBP != none)
                {
                    wRes = Level.WeaponMgr.GetRes(WBP.szClass_Resource);
                }
                szIcon = wRes.default.szIcon_HUD;
                matCurrentWeapon = Material(DynamicLoadObject(szIcon, class'Material'));
            }
            // End:0x266
            if(WBP != none)
            {
                sWeaponName = WBP.strName;
            }
            iDrawingWeaponID = iCurrentWeaponID;
        }
        // End:0x2ca
        if(matCurrentWeapon != none)
        {
            C.DrawTile(matCurrentWeapon, 257.0 * _reX * fScale, 71.0 * _reY * fScale, 0.0, 0.0, 256.0, 64.0);
        }
    }
}

function DrawGaugeOverHeat(Canvas C, float iRatio)
{
    C.SetPos(1400.0 * _reX, 1127.0 * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(GaugeOverHeat.WidgetTexture, 185.0 * _reX, 5.0 * _reY, 0.0, 0.0, 32.0, 5.0);
    C.SetPos(1400.0 * _reX, 1127.0 * _reY);
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    C.DrawTile(GaugeOverHeat.WidgetTexture, iRatio * float(185) * _reX, 5.0 * _reY, 0.0, 0.0, 32.0, 5.0);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawAmmo(Canvas C)
{
    local int curr, Max;
    local float fWidth, fHeight;

    // End:0x16
    if(PlayerOwner.Pawn == none)
    {
        return;
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(PlayerOwner.Pawn.Weapon.BaseParams.strName, 2, 1405.0 * _reX, 1094.0 * _reY, 1586.0 * _reX, 1119.0 * _reY, int(float(16) / 1200.0 * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
    curr = int(CurAmmoPrimary);
    Max = PlayerOwner.Pawn.Weapon.BaseParams.iAmmo_Magazine;
    // End:0x5e1
    if(PlayerOwner.Pawn.Weapon.WeaponType != 8 && PlayerOwner.Pawn.Weapon.WeaponType != 12)
    {
        // End:0x441
        if(PlayerOwner.Pawn.Weapon.BaseParams.bOverHeat == false)
        {
            // End:0x1d3
            if(IsAmmoShortage(curr, Max))
            {
                DrawNumericWidget(C, DigitsMagazineAmmoShortage, WDigitsMid);
            }
            // End:0x257
            else
            {
                DigitsMagazineAmmo.Tints[0] = C.MakeColor(byte(255), 153, 0, byte(255));
                DigitsMagazineAmmo.Tints[1] = C.MakeColor(byte(255), 153, 0, byte(255));
                DrawNumericWidget(C, DigitsMagazineAmmo, WDigitsMid);
                C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            }
            DigitsTotalAmmo.Tints[0] = default.DigitsTotalAmmo.Tints[0];
            DigitsTotalAmmo.Tints[1] = default.DigitsTotalAmmo.Tints[1];
            DigitsTotalAmmo.OffsetX = default.DigitsTotalAmmo.OffsetX;
            fWidth = float(WDigitsSmall.TextureCoords[10].X2 - WDigitsSmall.TextureCoords[10].X1);
            fHeight = float(WDigitsSmall.TextureCoords[10].Y2 - WDigitsSmall.TextureCoords[10].Y1);
            C.SetPos(1527.0 * _reX, 1170.0 * _reY);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(WDigitsSmall.DigitTexture, fWidth * _reX, fHeight * _reY, float(WDigitsSmall.TextureCoords[10].X1), float(WDigitsSmall.TextureCoords[10].Y1), float(WDigitsSmall.TextureCoords[10].X2 - WDigitsSmall.TextureCoords[10].X1), float(WDigitsSmall.TextureCoords[10].Y2 - WDigitsSmall.TextureCoords[10].Y1));
            DigitsTotalAmmo.PosX = default.DigitsTotalAmmo.PosX + fWidth + float(4) / float(1600);
            DigitsTotalAmmo.Value = DigitsTotalAmmo.Value;
            DrawNumericWidget(C, DigitsTotalAmmo, WDigitsSmall);
        }
        // End:0x5e1
        else
        {
            DigitsTotalAmmo.Value = int(wWeapon_Turret_FNM240(PlayerOwner.Pawn.Weapon).fAccumulationOverHeat);
            // End:0x4ef
            if(wWeapon_Turret_FNM240(PlayerOwner.Pawn.Weapon).bHoldFire)
            {
                DigitsTotalAmmo.Tints[0] = C.MakeColor(byte(255), 0, 0, byte(255));
                DigitsTotalAmmo.Tints[1] = C.MakeColor(byte(255), 0, 0, byte(255));
            }
            // End:0x547
            else
            {
                DigitsTotalAmmo.Tints[0] = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
                DigitsTotalAmmo.Tints[1] = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
            }
            // End:0x56b
            if(DigitsTotalAmmo.Value >= 100)
            {
                DigitsTotalAmmo.OffsetX = -32;
            }
            // End:0x580
            else
            {
                DigitsTotalAmmo.OffsetX = default.DigitsTotalAmmo.OffsetX;
            }
            DrawNumericWidget(C, DigitsTotalAmmo, WDigitsMid);
            DrawGaugeOverHeat(C, wWeapon_Turret_FNM240(PlayerOwner.Pawn.Weapon).fAccumulationOverHeat / 100.0);
            DigitsTotalAmmo.OffsetX = default.DigitsTotalAmmo.OffsetX;
        }
    }
    switch(PlayerOwner.Pawn.Weapon.WeaponType)
    {
        // End:0x60b
        case 5:
            // End:0x799
            break;
        // End:0x610
        case 1:
        // End:0x615
        case 4:
        // End:0x61a
        case 3:
        // End:0x63c
        case 9:
            DrawAmmoLinear2(C, curr, Max, AmmoSet50);
            // End:0x799
            break;
        // End:0x65e
        case 2:
            DrawAmmoLinear2(C, curr, Max, AmmoSetSniper);
            // End:0x799
            break;
        // End:0x680
        case 6:
            DrawAmmoLinear2(C, curr, Max, AmmoSetShotgun);
            // End:0x799
            break;
        // End:0x727
        case 7:
            // End:0x70a
            if(PlayerOwner.Pawn.Weapon.BaseParams.iWeaponID == 5001 || PlayerOwner.Pawn.Weapon.BaseParams.iWeaponID == 5012)
            {
                DrawAmmoLinear2(C, curr, Max, AmmoSetATR);
            }
            // End:0x724
            else
            {
                DrawAmmoLinear2(C, curr, Max, AmmoSetRPG);
            }
            // End:0x799
            break;
        // End:0x768
        case 8:
            DrawAmmoFlameThrower(C, curr, PlayerOwner.Pawn.Weapon.BaseParams.iAmmo_Max);
            // End:0x799
            break;
        // End:0x76d
        case 11:
        // End:0x772
        case 9:
        // End:0x777
        case 12:
        // End:0x77f
        case 17:
            // End:0x799
            break;
        // End:0xffff
        default:
            DrawAmmo100(C, curr, Max, 100);
}

function DrawAmmoDemo(Canvas C)
{
    DrawAmmoLinear2(C, int(float(2) - float(int(Level.TimeSeconds)) % float(3)), 2, AmmoSetRPG);
}

function DrawAmmoFlameThrower(Canvas C, int curr, int Max)
{
    local float ratio;
    local int X2, newX2, diff;

    DrawSpriteWidget(C, AmmoFlameThrowerCan);
    // End:0x1e
    if(curr == 0)
    {
    }
    // End:0x19e
    else
    {
        // End:0x84
        if(IsAmmoShortage(curr, Max))
        {
            AmmoFlameThrowerBar.Tints[0] = C.MakeColor(byte(255), 128, 128, byte(255));
            AmmoFlameThrowerBar.Tints[1] = C.MakeColor(byte(255), 96, 96, byte(255));
        }
        // End:0xba
        else
        {
            AmmoFlameThrowerBar.Tints[0] = C.default.DrawColor;
            AmmoFlameThrowerBar.Tints[1] = C.default.DrawColor;
        }
        ratio = float(curr) / float(Max);
        X2 = AmmoFlameThrowerBar.TextureCoords.X2;
        diff = AmmoFlameThrowerBar.TextureCoords.X2 - AmmoFlameThrowerBar.TextureCoords.X1;
        newX2 = int(float(AmmoFlameThrowerBar.TextureCoords.X1) + float(diff) * ratio);
        AmmoFlameThrowerBar.TextureCoords.X2 = newX2;
        AmmoFlameThrowerBar.OffsetX -= X2 - newX2;
        DrawSpriteWidget(C, AmmoFlameThrowerBar);
        AmmoFlameThrowerBar.TextureCoords.X2 = X2;
        AmmoFlameThrowerBar.OffsetX += X2 - newX2;
    }
}

function DrawAmmoFlameThrower2(Canvas C, int curr, int Max)
{
    local float ratio;

    C.SetPos(1362.0 * _reX, 1116.0 * _reY);
    C.DrawTile(texture'frame_1', 223.0 * _reX, 40.0 * _reY, 0.0, 0.0, 224.0, 41.0);
    // End:0x75
    if(curr == 0)
    {
    }
    // End:0x16e
    else
    {
        // End:0xb5
        if(IsAmmoShortage(curr, Max))
        {
            C.DrawColor = C.MakeColor(byte(255), 128, 128, byte(255));
        }
        // End:0xe3
        else
        {
            C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
        }
        ratio = float(curr) / float(Max);
        C.SetPos(1382.0 * _reX, 1127.0 * _reY);
        C.DrawTile(texture'frame_fuel', 200.0 * ratio * _reX, 26.0 * _reY, 0.0, 0.0, 201.0 * ratio, 27.0);
    }
}

function bool IsAmmoShortage(int Ammo, int MaxAmmo)
{
    local float shortAmmoBoundary;

    shortAmmoBoundary = float(MaxAmmo) * 0.330;
    return float(Ammo) < shortAmmoBoundary;
}

function DecideAmmoNum(int Ammo, int MaxAmmo, out int ammoDefault, out int ammoUsed)
{
    local int numAmmoNormal, numAmmoUsed, numAmmoShort;

    numAmmoNormal = 1;
    numAmmoUsed = 2;
    numAmmoShort = 3;
    // End:0x38
    if(IsAmmoShortage(Ammo, MaxAmmo))
    {
        ammoDefault = numAmmoShort;
    }
    // End:0x43
    else
    {
        ammoDefault = numAmmoNormal;
    }
    ammoUsed = numAmmoUsed;
}

function DrawAmmo100(Canvas C, int Ammo, int MaxAmmo, int ammoPerLine)
{
    local int lp1, savedOffsetX, savedOffsetY, maxLine, digitOffset, numDefault,
	    numAmmoUsed;

    DecideAmmoNum(Ammo, MaxAmmo, numDefault, numAmmoUsed);
    digitOffset = Ammo100_DigitOffset;
    maxLine = MaxAmmo / ammoPerLine;
    // End:0x56
    if(float(MaxAmmo) % float(ammoPerLine) != float(0))
    {
        ++ maxLine;
    }
    savedOffsetX = Ammo100.OffsetX;
    savedOffsetY = Ammo100.OffsetY;
    lp1 = 0;
    J0x7d:
    // End:0x12a [While If]
    if(lp1 < MaxAmmo)
    {
        // End:0xae
        if(lp1 < Ammo)
        {
            Ammo100.Value = numDefault;
        }
        // End:0xbe
        else
        {
            Ammo100.Value = numAmmoUsed;
        }
        DrawNumericWidget(C, Ammo100, AmmoSet100);
        // End:0x10f
        if(float(lp1 + 1) % float(ammoPerLine) == float(0))
        {
            Ammo100.OffsetY -= Ammo100_LineOffset;
            digitOffset = -digitOffset;
        }
        // End:0x120
        else
        {
            Ammo100.OffsetX -= digitOffset;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7d;
    }
    Ammo100.OffsetX = savedOffsetX;
    Ammo100.OffsetY = savedOffsetY;
}

function DrawAmmoLinear(Canvas C, int Ammo, int MaxAmmo, int digitOffset, NumericWidget ammoWidget, out DigitSet AmmoSet)
{
    local int lp1, numDefault, numAmmoUsed;

    DecideAmmoNum(Ammo, MaxAmmo, numDefault, numAmmoUsed);
    lp1 = 0;
    J0x21:
    // End:0x92 [While If]
    if(lp1 < MaxAmmo)
    {
        // End:0x52
        if(lp1 < Ammo)
        {
            ammoWidget.Value = numDefault;
        }
        // End:0x62
        else
        {
            ammoWidget.Value = numAmmoUsed;
        }
        DrawNumericWidget(C, ammoWidget, AmmoSet);
        ammoWidget.OffsetX -= digitOffset;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x21;
    }
}

function DrawAmmoLinear2(Canvas C, int Ammo, int MaxAmmo, AmmoSet as)
{
    local int lp1, numDefault, numAmmoUsed, Num, X2, Y2,
	    X1, Y1, XL, YL, ExtraOffsetX;

    local IntBox numBox;

    X2 = int(float(as.X2) * _reX);
    Y2 = int(float(as.Y2) * _reY);
    DecideAmmoNum(Ammo, MaxAmmo, numDefault, numAmmoUsed);
    XL = int(float(as.XL) * _reX);
    YL = int(float(as.YL) * _reY);
    ExtraOffsetX = int(float(as.ExtraOffsetX) * _reX);
    lp1 = 0;
    J0xa8:
    // End:0x1ce [While If]
    if(lp1 < MaxAmmo)
    {
        // End:0xd4
        if(lp1 < Ammo)
        {
            Num = numDefault;
        }
        // End:0xdf
        else
        {
            Num = numAmmoUsed;
        }
        numBox = as.TextureCoords[Num];
        X1 = X2 - XL;
        Y1 = Y2 - YL;
        C.SetPos(float(X1), float(Y1));
        C.DrawTile(as.DigitTexture, float(XL), float(YL), float(numBox.X1), float(numBox.Y1), float(numBox.X2 - numBox.X1 + 1), float(numBox.Y2 - numBox.Y1 + 1));
        X2 = X2 - XL - ExtraOffsetX;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xa8;
    }
}

function DrawTimer1(Canvas C);
function DrawTimer2(Canvas C)
{
    // End:0x34
    if(bShowTimer2WithDigitRedAlert)
    {
        HudPart_DisplayEvent.DrawTimerBomb(C, DigitsTimerMin2.Value, DigitsTimerSec2.Value);
    }
    // End:0x34
    else
    {
    }
}

function DrawSpecialPositions(Canvas C)
{
    local int lp1;
    local Actor act;
    local Vector loc;
    local string strName;
    local float fDistance;

    // End:0x19
    if(!bCachedSpecialPostions)
    {
        CacheSpecialPositions();
        bCachedSpecialPostions = true;
    }
    lp1 = 0;
    J0x20:
    // End:0x190 [While If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x44
        if(CachedSpecialPositionActors[lp1] == none)
        {
        }
        // End:0x186
        else
        {
            act = CachedSpecialPositionActors[lp1];
            // End:0x77
            if(act.IsA('wAmmoSupplyObjective'))
            {
                strName = lsPlaceAmmoSupply;
            }
            // End:0x111
            else
            {
                // End:0x8c
                if(act.bHidden)
                {
                }
                // End:0x186
                else
                {
                    // End:0xae
                    if(act.IsA('wWeaponPickup_M2B'))
                    {
                        strName = lsPlaceM2B;
                    }
                    // End:0x111
                    else
                    {
                        // End:0xd0
                        if(act.IsA('wWeaponPickup_RPG7'))
                        {
                            strName = lsPlaceRPG7;
                        }
                        // End:0x111
                        else
                        {
                            // End:0x10e
                            if(act.IsA('wTurret_FNM240'))
                            {
                                // End:0x100
                                if(Vehicle(PlayerOwner.Pawn) != none)
                                {
                                }
                                // End:0x186
                                else
                                {
                                    strName = lsPlaceMG3;
                                    // This is an implied JumpToken;
                                    goto J0x111;
                                }
                                // This is an implied JumpToken;
                                goto J0x186;
                            }
                        }
                    }
                    loc = act.Location;
                    fDistance = VSize(PlayerOwner.CalcViewLocation - loc) * 0.018750;
                    // End:0x15b
                    if(fDistance > VisibleDistance)
                    {
                    }
                    // End:0x186
                    else
                    {
                        DrawObjectSprite2(C, CachedSpecialPositionActors[lp1], PlaceMark, CachedSpecialPositions[lp1], strName);
                    }
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
}

function DrawDebugAirStrike(Canvas C)
{
    local wAirStrikeProj Air;

    C.SetDrawColor(byte(255), 196, 196);
    // End:0xa0
    foreach DynamicActors(class'wAirStrikeProj', Air)
    {
        C.BtrDrawTextJustified("!!!AIRSTRIKE!!! -- state=" $ string(Air.GetStateName()) @ "iCurrBombCnt=" $ string(Air.iCurrBombCnt), 0, 0.0, 200.0, 300.0, 220.0, 10);
        // End:0xa0
        break;                
    }
}

function DrawDebugHelicopter(Canvas C)
{
    local wBotVehicleController control;
    local wHelicopter heli;

    C.SetDrawColor(byte(255), 196, 196);
    // End:0x11c
    foreach DynamicActors(class'wBotVehicleController', control)
    {
        C.BtrDrawTextJustified("!!!CONT!!! -- state=" $ string(control.GetStateName()), 0, 0.0, 200.0, 300.0, 220.0, 8);
        // End:0x117
        foreach DynamicActors(class'wHelicopter', heli)
        {
            C.BtrDrawTextJustified("!!!HELI!!! -- state=" $ string(heli.GetStateName()) @ "ownerName=" $ heli.OwnerName @ "iCurrentPoint=" $ string(heli.iCurrentPoint), 0, 0.0, 220.0, 300.0, 240.0, 8);
            // End:0x117
            break;                        
        }
        // End:0x11c
        break;                
    }
    // End:0x1dd
    foreach DynamicActors(class'wHelicopter', heli)
    {
        C.BtrDrawTextJustified("!!!HELI!!! -- state=" $ string(heli.GetStateName()) @ "ownerName=" $ heli.OwnerName @ "iCurrentPoint=" $ string(heli.iCurrentPoint) @ "health=" $ string(heli.Health), 0, 0.0, 240.0, 300.0, 260.0, 8);
        // End:0x1dd
        break;                
    }
}

function DrawDebugEmitters(Canvas C)
{
    local XWFX_Grenade_smoke A;

    // End:0x44
    foreach DynamicActors(class'XWFX_Grenade_smoke', A)
    {
        C.BtrDrawTextJustified("!!!aaa!!!!", 0, 0.0, 240.0, 300.0, 260.0, 12);                
    }
}

function DrawDebug_Inventory(Canvas C, int X, out int Y, int dy)
{
    local Inventory i;
    local wWeapon W;

    // End:0x224
    if(PawnOwner != none)
    {
        C.DrawColor = WhiteColor;
        C.BtrDrawTextJustified("[DrawDebug_Inventory]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
        i = PawnOwner.Inventory;
        J0x8a:
        // End:0x13d [While If]
        if(i != none)
        {
            C.BtrDrawTextJustified(" inv=" $ string(wWeapon(i).Class) $ "  /  wWeaponID=" $ string(wWeapon(i).BaseParams.iWeaponID), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            Y += dy;
            i = i.Inventory;
            // This is an implied JumpToken; Continue!
            goto J0x8a;
        }
        Y += dy;
        // End:0x217
        foreach DynamicActors(class'wWeapon', W)
        {
            // End:0x216
            if(true)
            {
                C.BtrDrawTextJustified(" spawned w=" $ string(W.Class) $ " wid=" $ string(W.BaseParams.iWeaponID) $ " nextInv=" $ string(wWeapon(W.Inventory).BaseParams.iWeaponID), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
            }                        
        }
        Y += dy;
    }
}

function DrawDebug_DrawDebugUserWeaponStates(Canvas C, int X, out int Y, int dy)
{
    local PlayerController PC;
    local string sName, Type, Value;
    local int iWeaponID, iAddPartsID, TotalAmmo, CurrentAmmo;
    local bool bUniqueID;
    local int iCurrentWeaponID;

    C.DrawColor = WhiteColor;
    C.BtrDrawTextJustified("[DrawDebug_DrawDebugUserWeaponStates]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    // End:0x321
    foreach DynamicActors(class'PlayerController', PC)
    {
        // End:0xc6
        if(PC == none || PC.Pawn == none || PC.GSSS == none)
        {
            continue;
        }
        // End:0x321
        else
        {
            PC.GSSS.GetValue("Weapon", "CurrentWeapon", "ID", Value);
            iCurrentWeaponID = int(Value);
            C.BtrDrawTextJustified("[DrawDebugUserWeaponState] name=" $ PC.LoginName, 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            Y += dy;
            // End:0x31f
            foreach PC.GSSS.AllNames("Weapon", sName)
            {
                TotalAmmo = -1;
                CurrentAmmo = -1;
                iWeaponID = -1;
                // End:0x2b4
                foreach PC.GSSS.AllValues("Weapon", sName, Type, Value)
                {
                    // End:0x21d
                    if(Type == "iWeaponID")
                    {
                        iWeaponID = int(Value);
                    }
                    // End:0x2b3
                    else
                    {
                        // End:0x244
                        if(Type == "iAddPartsID")
                        {
                            iAddPartsID = int(Value);
                        }
                        // End:0x2b3
                        else
                        {
                            // End:0x269
                            if(Type == "TotalAmmo")
                            {
                                TotalAmmo = int(Value);
                            }
                            // End:0x2b3
                            else
                            {
                                // End:0x290
                                if(Type == "CurrentAmmo")
                                {
                                    CurrentAmmo = int(Value);
                                }
                                // End:0x2b3
                                else
                                {
                                    // End:0x2b3
                                    if(Type == "bUniqueID")
                                    {
                                        bUniqueID = bool(Value);
                                    }
                                }
                            }
                        }
                    }                                        
                }
                // End:0x2c8
                if(iWeaponID == -1)
                {
                    continue;
                }
                // End:0x31f
                else
                {
                    C.BtrDrawTextJustified(" iWeaponID=" $ string(iWeaponID), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                    Y += dy;
                    continue;
                }                
            }
            continue;
        }        
    }
    Y += dy;
}

exec function wclearNet()
{
    NetRecvMax = 0;
    NetSendMax = 0;
}

function DrawDebug_Network(Canvas C, int X, out int Y, int dy)
{
    C.DrawColor = WhiteColor;
    C.BtrDrawTextJustified("[DrawDebug_Network]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    NetElapsedTime += Level.TimeSeconds - NetLastTimeSeconds;
    // End:0x11b
    if(NetElapsedTime > NetInterval)
    {
        NetElapsedTime = 0.0;
        NetRecv = Level.iQueuedRecvBytes;
        // End:0xcd
        if(NetRecv > NetRecvMax)
        {
            NetRecvMax = NetRecv;
        }
        Level.iQueuedRecvBytes = 0;
        NetSend = Level.iQueuedSendBytes;
        // End:0x10b
        if(NetSend > NetSendMax)
        {
            NetSendMax = NetSend;
        }
        Level.iQueuedSendBytes = 0;
    }
    C.BtrDrawTextJustified(" NetSendMax=" $ string(NetSendMax), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustified(" NetSend=" $ string(NetSend), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustified(" NetSend 1sec=" $ string(float(NetSend) / NetInterval), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustified(" NetRecvMax=" $ string(NetRecvMax), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustified(" NetRecv=" $ string(NetRecv), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustified(" NetRecv 1sec=" $ string(float(NetRecv) / NetInterval), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    Y += dy;
    NetLastTimeSeconds = Level.TimeSeconds;
}

function DrawDebug(Canvas C, int X, out int Y, int dy)
{
    super(HUD).DrawDebug(C, X, Y, dy);
    DrawDebugUAV(C, X, Y, dy);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified(" InGameOver=" $ string(Level.GetMatchMaker().InGameOver), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    // End:0x18f
    if(PawnOwner != none)
    {
        C.BtrDrawTextJustified(" Heli=" $ string(PawnOwner.HasWeaponByWeaponID(5009)), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustified(" UAV=" $ string(PawnOwner.HasWeaponByWeaponID(5010)), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
    }
}

simulated function DrawHudPassA(Canvas C)
{
    local Pawn RealPawnOwner;
    local class<wAmmunition> AmmoClass;

    ZoomFadeOut(C);
    // End:0x7ca
    if(PawnOwner != none || Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        HudPart_SelQuickSlot.DrawA(C);
        // End:0x77
        if(HudPart_DisplayQuest.HasMessage())
        {
            HudPart_DisplayQuest.DrawHudPassA(C);
        }
        DrawGameNotice(C);
        // End:0x9f
        if(bShowPersonalInfo)
        {
            HudPart_DisplayMain.DrawA(C);
        }
        // End:0xc7
        if(PawnOwner.kPendingWPick != none)
        {
            HudPart_DisplayEvent.DrawWeaponChange(C);
        }
        // End:0x22f
        if(bShowWeaponInfo && PawnOwner.Weapon != none)
        {
            // End:0x10c
            if(PawnOwner.Weapon.bShowChargingBar)
            {
                DrawChargeBar(C);
            }
            DrawSpriteWidget(C, HudBorderAmmo);
            // End:0x224
            if(PawnOwner.Weapon != none)
            {
                AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
                // End:0x224
                if(AmmoClass != none && AmmoClass.default.IconMaterial != none)
                {
                    // End:0x1e2
                    if(CurAmmoPrimary / MaxAmmoPrimary < 0.150)
                    {
                        DrawSpriteWidget(C, HudAmmoALERT);
                        HudAmmoALERT.Tints[TeamIndex] = HudColorTeam[TeamIndex];
                        // End:0x1df
                        if(AmmoClass.default.IconFlashMaterial != none)
                        {
                            AmmoIcon.WidgetTexture = AmmoClass.default.IconFlashMaterial;
                        }
                    }
                    // End:0x1fb
                    else
                    {
                        AmmoIcon.WidgetTexture = AmmoClass.default.IconMaterial;
                    }
                    AmmoIcon.TextureCoords = AmmoClass.default.IconCoords;
                    DrawSpriteWidget(C, AmmoIcon);
                }
            }
            DrawAmmo(C);
        }
        // End:0x2d5
        if(bShowPersonalInfo)
        {
            HudPart_Minimap.Draw(C);
            DrawUAV(C);
            // End:0x274
            if(bShowBigmap)
            {
                HudPart_Bigmap.Draw(C);
            }
            HudPart_DisplayEvent.DrawA(C);
            // End:0x2a9
            if(byShowRadioMessage > 0)
            {
                HudPart_RadioMessage.DrawA(C);
            }
            // End:0x2d5
            if(PlayerOwner != none && PlayerOwner.Pawn != none)
            {
                DrawSkill(C);
            }
        }
        // End:0x2e9
        if(bShowPoints)
        {
            DrawHudPassA_Score(C);
        }
        // End:0x2fd
        if(bShowTimer1)
        {
            DrawTimer1(C);
        }
        // End:0x311
        if(bShowTimer2NotScoreD)
        {
            DrawTimer2(C);
        }
        // End:0x7ca
        if(bShowPersonalInfo)
        {
            // End:0x38b
            if(Vehicle(PawnOwner) != none && Vehicle(PawnOwner).Driver != none)
            {
                // End:0x367
                if(Vehicle(PawnOwner).bShowChargingBar)
                {
                    DrawVehicleChargeBar(C);
                }
                RealPawnOwner = PawnOwner;
                PawnOwner = Vehicle(PawnOwner).Driver;
            }
            DrawHUDAnimWidget(HudBorderHealthIcon, default.HudBorderHealthIcon.TextureScale, LastHealthPickupTime, 0.60, 0.60);
            DrawSpriteWidget(C, HudBorderHealth);
            // End:0x40f
            if(float(CurHealth) / PawnOwner.HealthMax < 0.260)
            {
                HudHealthALERT.Tints[TeamIndex] = HudColorTeam[TeamIndex];
                DrawSpriteWidget(C, HudHealthALERT);
            }
            // End:0x424
            else
            {
                HudBorderHealthIcon.WidgetTexture = default.HudBorderHealth.WidgetTexture;
            }
            DrawSpriteWidget(C, HudBorderHealthIcon);
            // End:0x457
            if(CurHealth < LastHealth)
            {
                LastDamagedHealth = Level.TimeSeconds;
            }
            DrawHUDAnimDigit(DigitsHealth, default.DigitsHealth.TextureScale, LastDamagedHealth, 0.80, default.DigitsHealth.Tints[TeamIndex], HudColorHighLight);
            DrawHpStamina(C);
            DrawPosture(C);
            DrawSelfKillMessage(C);
            DrawSpecialPositions(C);
            DrawSuppliesPositions(C);
            // End:0x4e2
            if(Level.IsAirStriking == true)
            {
                DrawAirStrikePosition(C);
            }
            // End:0x506
            if(DigitsSprint.Value == 40)
            {
                bShoudPlayFSound = false;
                bIsFatigueSoundPlaying = false;
            }
            // End:0x522
            else
            {
                // End:0x522
                if(DigitsSprint.Value < 30)
                {
                    bShoudPlayFSound = true;
                }
                // End:0x522
                else
                {
                }
            }
            // End:0x552
            if(PrevSprintVal > DigitsSprint.Value && bShoudPlayFSound == true)
            {
                PlaySoundStop(C);
            }
            // End:0x5cc
            else
            {
                // End:0x582
                if(PrevSprintVal > DigitsSprint.Value && bShoudPlayFSound == false)
                {
                    PlaySoundStop(C);
                }
                // End:0x5cc
                else
                {
                    // End:0x5a7
                    if(PrevSprintVal < DigitsSprint.Value && bShoudPlayFSound == true)
                    {
                    }
                    // End:0x5cc
                    else
                    {
                        // End:0x5cc
                        if(PrevSprintVal < DigitsSprint.Value && bShoudPlayFSound == false)
                        {
                        }
                        // End:0x5cc
                        else
                        {
                        }
                    }
                }
            }
            PrevSprintVal = DigitsSprint.Value;
            // End:0x61b
            if(CurHealth > 999)
            {
                DigitsHealth.OffsetX = 220;
                DigitsHealth.OffsetY = -35;
                DigitsHealth.TextureScale = 0.390;
            }
            // End:0x65a
            else
            {
                DigitsHealth.OffsetX = default.DigitsHealth.OffsetX;
                DigitsHealth.OffsetY = default.DigitsHealth.OffsetY;
                DigitsHealth.TextureScale = default.DigitsHealth.TextureScale;
            }
            // End:0x7ca
            if(RealPawnOwner != none)
            {
                PawnOwner = RealPawnOwner;
                DrawSpriteWidget(C, HudBorderVehicleHealth);
                // End:0x6d0
                if(float(CurVehicleHealth) / PawnOwner.HealthMax < 0.260)
                {
                    HudVehicleHealthALERT.Tints[TeamIndex] = HudColorTeam[TeamIndex];
                    DrawSpriteWidget(C, HudVehicleHealthALERT);
                }
                // End:0x6e5
                else
                {
                    HudBorderVehicleHealthIcon.WidgetTexture = default.HudBorderVehicleHealth.WidgetTexture;
                }
                DrawSpriteWidget(C, HudBorderVehicleHealthIcon);
                // End:0x718
                if(CurVehicleHealth < LastVehicleHealth)
                {
                    LastDamagedVehicleHealth = Level.TimeSeconds;
                }
                DrawHUDAnimDigit(DigitsVehicleHealth, default.DigitsVehicleHealth.TextureScale, LastDamagedVehicleHealth, 0.80, default.DigitsVehicleHealth.Tints[TeamIndex], HudColorHighLight);
                // End:0x78b
                if(CurVehicleHealth > 999)
                {
                    DigitsVehicleHealth.OffsetX = 220;
                    DigitsVehicleHealth.OffsetY = -35;
                    DigitsVehicleHealth.TextureScale = 0.390;
                }
                // End:0x7ca
                else
                {
                    DigitsVehicleHealth.OffsetX = default.DigitsVehicleHealth.OffsetX;
                    DigitsVehicleHealth.OffsetY = default.DigitsVehicleHealth.OffsetY;
                    DigitsVehicleHealth.TextureScale = default.DigitsVehicleHealth.TextureScale;
                }
            }
        }
    }
    UpdateRankAndSpread(C);
    DrawUDamage(C);
    DrawAllTeamDeathInfo(C);
    HudBorderShield.Tints[0] = HudColorRed;
    HudBorderShield.Tints[1] = HudColorBlue;
    HudBorderHealth.Tints[0] = HudColorRed;
    HudBorderHealth.Tints[1] = HudColorBlue;
    HudBorderVehicleHealth.Tints[0] = HudColorRed;
    HudBorderVehicleHealth.Tints[1] = HudColorBlue;
    HudBorderAmmo.Tints[0] = HudColorRed;
    HudBorderAmmo.Tints[1] = HudColorBlue;
    // End:0x8d5
    if(bShowPersonalInfo && CurShield > 0)
    {
        DrawSpriteWidget(C, HudBorderShield);
        DrawSpriteWidget(C, HudBorderShieldIcon);
        DrawHUDAnimWidget(HudBorderShieldIcon, default.HudBorderShieldIcon.TextureScale, LastArmorPickupTime, 0.60, 0.60);
    }
    // End:0x8ff
    if(Level.TimeSeconds - LastVoiceGainTime < 0.3330)
    {
        DisplayVoiceGain(C);
    }
    DisplayLocalMessages(C);
    HudPart_KillMessage.DrawNative(C);
    HudPart_DisplayEvent.ConnectionInstability(C);
    // End:0x96d
    if(bShowPersonalInfo && Level.GetMatchMaker().BotTutorial)
    {
        HudPart_Tutorial.DrawHudPassA(C);
    }
}

function DrawDebugPosition(Canvas C, Pawn P)
{
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(0.0, C.ClipY * 0.40);
    C.DrawText(" X" $ string(P.Location.X));
    C.SetPos(0.0, C.ClipY * 0.420);
    C.DrawText(" Y" $ string(P.Location.Y));
    C.SetPos(0.0, C.ClipY * 0.440);
    C.DrawText(" Z" $ string(P.Location.Z));
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super(HUD).DisplayDebug(Canvas, YL, YPos);
    DrawNametags(Canvas, true, true);
}

function Material GetLevelImage(PlayerReplicationInfo PRI)
{
    local string PlayerName;
    local int Grade;
    local string matStr;

    PlayerName = PRI.PlayerName;
    Grade = Level.GetMatchMaker().GetUserGradeByUserName(PlayerName);
    matStr = Level.GameMgr.GetLevelImageString(Grade);
    return Material(DynamicLoadObject(matStr, class'Material'));
}

simulated function DrawHudPassC(Canvas C)
{
    // End:0x44
    if(PawnOwner != none && PlayerOwner.Pawn == PawnOwner && PlayerOwner.IsBombDetection())
    {
        DrawDetectedBombs(C);
    }
    // End:0xa2
    if(bShowWeaponInfo && PawnOwner != none && PawnOwner.Weapon != none)
    {
        PawnOwner.Weapon.NewDrawWeaponInfo(C, 0.860 * C.ClipY);
    }
    // End:0xfe
    if(PawnOwner != PlayerOwner.Pawn && PawnOwner != none && PawnOwner.PlayerReplicationInfo != none && PlayerOwner.ViewTarget != none)
    {
        DrawHudSpectating(C);
    }
    DrawNametags(C, false, PlayerController(Owner).PlayerReplicationInfo.bAdminSpecator);
    DrawDamageDealNotification(C);
    DrawWarfareCrosshair(C);
}

function DrawHudSpectating(Canvas C)
{
    local float ratioX, ratioY, X1, X2, Y1, Y2;

    local wMatchMaker MM;
    local array<Text> tArrayPlayerStatus;
    local Image ImgPlayerLevel;
    local string sWeaponName, strTemp, sTotalInfo;
    local int iFontSize, i;
    local float fWidth, fWidth2, fHeight, fCenterAlignX;
    local wMatchUserInfo UserInfo;

    ratioX = C.ClipX / float(1600);
    ratioY = C.ClipY / float(1200);
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_4, fbSpectatingBack.X1 * ratioX, fbSpectatingBack.Y1 * ratioY, fbSpectatingBack.X2 * ratioX, fbSpectatingBack.Y2 * ratioY);
    DrawPosture(C, true);
    DrawHpStamina(C, true);
    DrawWeaponImage(C, true, sWeaponName);
    // End:0x151
    if(sWeaponName != "")
    {
        C.BtrDrawTextJustifiedWithVolumeLine(sWeaponName, 2, 0.0 * _reX, 1163.0 * _reY, 1586.0 * _reX, 1188.0 * _reY, int(float(16) / 1200.0 * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
    }
    UserInfo = none;
    // End:0x376
    if(SpecPlayerName != Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.PlayerName)
    {
        SpecPlayerName = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.PlayerName;
        MM = self.Level.GetMatchMaker();
        SpecPlayerLevel = MM.GetUserGradeByUserName(SpecPlayerName);
        SpecPlayerLevelMarkID = MM.GetUserLevelMarkIDByUserName(SpecPlayerName);
        SpecPlayerClan = MM.GetUserClanNameByUserName(SpecPlayerName);
        UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(SpecPlayerName);
        ImgPlayerClanMark[0] = class'BTCustomDrawHK'.static.MakeImage(0, 0, 28, none);
        ImgPlayerClanMark[1] = class'BTCustomDrawHK'.static.MakeImage(0, 0, 28, none);
        ImgPlayerClanMark[2] = class'BTCustomDrawHK'.static.MakeImage(0, 0, 28, none);
        // End:0x376
        if(UserInfo != none && UserInfo.ClanName != "")
        {
            ImgPlayerClanMark[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL);
            ImgPlayerClanMark[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG);
            ImgPlayerClanMark[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark);
            // End:0x376
            if(ImgPlayerClanMark[2].Image == none)
            {
                ImgPlayerClanMark[2] = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, matDefaultClanMark);
            }
        }
    }
    ImgPlayerLevel = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, none);
    Level.GameMgr.GetLevelImage(SpecPlayerLevel, SpecPlayerLevelMarkID, ImgPlayerLevel);
    tArrayPlayerStatus.Length = 2;
    tArrayPlayerStatus[0] = class'BTCustomDrawHK'.static.MakeText(12, 0, SpecPlayerName);
    tArrayPlayerStatus[0].DrawColor = class'Canvas'.static.MakeColor(byte(255), 204, 0, byte(255));
    tArrayPlayerStatus[1] = class'BTCustomDrawHK'.static.MakeText(12, 0, strSpectating);
    iFontSize = int(float(18) * _reY);
    strTemp = HudPart_DisplayEvent.GetEllipsString(C, SpecPlayerName, 600.0 * _reX, float(iFontSize));
    fCenterAlignX = C.ClipX * 0.50;
    C.BtrTextSize(strTemp, iFontSize, fWidth, fHeight);
    fCenterAlignX -= fWidth * 0.50;
    // End:0x4ec
    if(Len(SpecPlayerClan) > 0)
    {
        sTotalInfo = "[" $ SpecPlayerClan $ "]" $ strSpectating;
    }
    // End:0x4f7
    else
    {
        sTotalInfo = strSpectating;
    }
    C.BtrTextSize(sTotalInfo, iFontSize, fWidth2, fHeight);
    fCenterAlignX = C.ClipX * 0.50 - fWidth * 0.50 + fWidth2 * 0.50 + fbSpectateLevel.X2 - fbSpectateLevel.X1 * 0.50 * ratioX;
    // End:0x688
    if(ImgPlayerClanMark[0].Image != none)
    {
        fCenterAlignX -= fbSpectateClanMark.X2 - fbSpectateClanMark.X1 * 0.50 * ratioX;
        X1 = fCenterAlignX;
        X2 = fCenterAlignX + fbSpectateClanMark.X2 - fbSpectateClanMark.X1 * ratioX;
        Y1 = fbSpectateClanMark.Y1 * ratioY;
        Y2 = fbSpectateClanMark.Y2 * ratioY;
        i = 0;
        J0x61e:
        // End:0x67d [While If]
        if(i < 3)
        {
            // End:0x673
            if(ImgPlayerClanMark[i].Image != none)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, ImgPlayerClanMark[i], X1, X2, Y1, Y2);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x61e;
        }
        fCenterAlignX = X2;
    }
    X1 = fCenterAlignX;
    X2 = fCenterAlignX + fbSpectateLevel.X2 - fbSpectateLevel.X1 * ratioX;
    Y1 = fbSpectateLevel.Y1 * ratioY;
    Y2 = fbSpectateLevel.Y2 * ratioY;
    class'BTCustomDrawHK'.static.DrawImage(C, ImgPlayerLevel, X1, Y1, X2, Y2);
    X1 = X2;
    X2 = X1 + fWidth;
    Y1 = fbSpectateUser.Y1 * _reY;
    Y2 = fbSpectateUser.Y2 * _reY;
    C.SetDrawColor(byte(255), 204, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, X1, Y1, X2, Y2, iFontSize, color_Shadow);
    X1 = X2;
    X2 = X1 + fWidth2;
    Y1 = fbSpectateUser.Y1 * _reY;
    Y2 = fbSpectateUser.Y2 * _reY;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sTotalInfo, 0, X1, Y1, X2, Y2, iFontSize, color_Shadow);
    C.DrawColor = WhiteColor;
    class'BTCustomDrawHK'.static.DrawString(C, strSpectateHelp, 4, 12.0, fbSpectateHelp.X1 * ratioX, fbSpectateHelp.Y1 * ratioY, fbSpectateHelp.X2 * ratioX, fbSpectateHelp.Y2 * ratioY);
}

function DrawDetectedBombs(Canvas C)
{
    local int lp1;
    local wProjectile cur;
    local float dist;

    lp1 = 0;
    J0x07:
    // End:0x108 [While If]
    if(lp1 < Level.Grenades.Length)
    {
        cur = Level.Grenades[lp1];
        // End:0xfe
        if(cur.Team != Level.GetLocalPlayerController().GetTeamNum() || cur.InstigatorName == PawnOwnerPRI.PlayerName)
        {
            dist = VSize(PawnOwner.Location - cur.Location);
            // End:0xfe
            if(dist < DetectedBombDrawDistance)
            {
                DrawObjectSprite(C, cur, DetectedBomb, cur.Location, false, 200.0 / float(1024), 200.0 / float(768));
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

exec function SetMA(float f)
{
    PlayerOwner.Pawn.Weapon.BaseParams.fSpread_Aim_move_add = f;
}

function DrawWarfareCrosshair(Canvas C)
{
    local int iCurrentWeaponID;
    local wWeaponBaseParams WBP;

    // End:0x142
    if(PlayerOwner.bAimMode == false && PlayerOwner.Pawn != none && PlayerOwner.Pawn.Weapon != none && PlayerOwner.Pawn.bWasReloading == false)
    {
        switch(PlayerOwner.Pawn.Weapon.BaseParams.CrosshairType)
        {
            // End:0xd0
            case 0:
                UpdateCrossHairSpread();
                // End:0xcd
                if(!PawnOwner.Controller.bSprint)
                {
                    DrawWarfareCrosshairExtNative(C, iSpread_Curr);
                }
                // End:0x13f
                break;
            // End:0x139
            case 1:
                // End:0x136
                if(!PawnOwner.Controller.bSprint)
                {
                    DrawWarfareCrosshair_Image(C, Material(DynamicLoadObject(PlayerOwner.Pawn.Weapon.BaseParams.CrosshairImage, class'Material')));
                }
                // End:0x13f
                break;
            // End:0xffff
            default:
                // End:0x13f Break;
                break;
        }
    }
    // End:0x25f
    else
    {
        // End:0x25f
        if(Pawn(PlayerOwner.ViewTarget) != none && !Pawn(PlayerOwner.ViewTarget).bIsAiming)
        {
            // End:0x1ef
            if(none != Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo)
            {
                iCurrentWeaponID = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.iCurrentWeaponID;
                WBP = Level.WeaponMgr.GetBaseParam(iCurrentWeaponID);
            }
            // End:0x25f
            if(WBP != none)
            {
                switch(WBP.CrosshairType)
                {
                    // End:0x228
                    case 0:
                        UpdateCrossHairSpread();
                        DrawWarfareCrosshairExtNative(C, iSpread_Curr);
                        // End:0x25f
                        break;
                    // End:0x259
                    case 1:
                        DrawWarfareCrosshair_Image(C, Material(DynamicLoadObject(WBP.CrosshairImage, class'Material')));
                        // End:0x25f
                        break;
                    // End:0xffff
                    default:
                        // End:0x25f Break;
                        break;
                    }
                }
            }
    }
}

function ResetByChangeSpectatingPawn()
{
    CrossHair_ServerSideLastDamageDealtTime = PawnOwner.LastDamageDealtTime;
    CrossHair_ClientSideLastDamageDealtTime = Level.TimeSeconds - CrossHair_DamageDealtDrawTime - 0.10;
}

function DrawDamageDealNotification(Canvas C)
{
    local float TimePassed, fadeElapsed, fadeMax;
    local int Alpha;
    local Vector ScreenPos;
    local Coords coBoneCam;
    local Vector vBoneCam;
    local bool bNotDraw;

    // End:0x2d
    if(PawnOwner != none && OldPawnOwner != PawnOwner)
    {
        ResetByChangeSpectatingPawn();
        OldPawnOwner = PawnOwner;
    }
    // End:0xd9
    if(CrossHair_ServerSideLastDamageDealtTime < PawnOwner.LastDamageDealtTime && PawnOwner.LastDamageDealtTime != float(0))
    {
        // End:0x96
        if(byte(PawnOwner.LastDamageCollisionPart) == 1)
        {
            PawnOwner.PlaySoundHK(sound'char_hit_success', 0, 1.0);
        }
        // End:0xb1
        else
        {
            PawnOwner.PlaySoundHK(sound'char_hit_success', 0, 1.0);
        }
        CrossHair_ServerSideLastDamageDealtTime = PawnOwner.LastDamageDealtTime;
        CrossHair_ClientSideLastDamageDealtTime = Level.TimeSeconds;
    }
    TimePassed = Level.TimeSeconds - CrossHair_ClientSideLastDamageDealtTime;
    // End:0x365
    if(!bNotDraw && PawnOwner != none && TimePassed < CrossHair_DamageDealtDrawTime)
    {
        // End:0x175
        if(TimePassed > CrossHair_DamageDealtBeginFadeTime)
        {
            fadeElapsed = TimePassed - CrossHair_DamageDealtBeginFadeTime;
            fadeMax = CrossHair_DamageDealtDrawTime - CrossHair_DamageDealtBeginFadeTime;
            Alpha = int(1.0 - fadeElapsed / fadeMax * 255.0);
        }
        // End:0x17d
        else
        {
            Alpha = 255;
        }
        // End:0x2cd
        if(PawnOwner.Weapon != none && wGun(PawnOwner.Weapon).IsAiming() && wGun(PawnOwner.Weapon).HasDotSight() && wGun(PawnOwner.Weapon).GetFireMode(1) != none && !wGun(PawnOwner.Weapon).GetFireMode(1).IsA('wZoomFire3D'))
        {
            coBoneCam = wGun(PawnOwner.Weapon).GetBoneCoords('Dot');
            vBoneCam = coBoneCam.Origin;
            ScreenPos = C.WorldToScreen(vBoneCam);
            Crosshair_DamageDealt.PosX = ScreenPos.X / C.ClipX;
            Crosshair_DamageDealt.PosY = ScreenPos.Y / C.ClipY;
        }
        // End:0x2f7
        else
        {
            Crosshair_DamageDealt.PosX = default.Crosshair_DamageDealt.PosX;
            Crosshair_DamageDealt.PosY = default.Crosshair_DamageDealt.PosY;
        }
        Crosshair_DamageDealt.Tints[0] = C.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(Alpha));
        Crosshair_DamageDealt.Tints[1] = C.MakeColorNoEmpty(byte(255), byte(255), byte(255), byte(Alpha));
        DrawSpriteWidget(C, Crosshair_DamageDealt);
    }
}

simulated function ShowReloadingPulse(float HOLD);
simulated function DrawChargeBar(Canvas C)
{
    local float ScaleFactor;

    ScaleFactor = HudScale * 0.1350 * C.ClipX;
    C.Style = 5;
    // End:0xa5
    if(PawnOwner.PlayerReplicationInfo == none || PawnOwner.PlayerReplicationInfo.Team == none || PawnOwner.PlayerReplicationInfo.Team.TeamIndex == 1)
    {
        C.DrawColor = HudColorBlue;
    }
    // End:0xb9
    else
    {
        C.DrawColor = HudColorRed;
    }
    RechargeBar.Scale = PawnOwner.Weapon.ChargeBar();
    // End:0x10e
    if(RechargeBar.Scale > float(0))
    {
        DrawSpriteWidget(C, RechargeBar);
        ShowReloadingPulse(RechargeBar.Scale);
    }
}

simulated function DrawVehicleChargeBar(Canvas C)
{
    local float ScaleFactor;

    ScaleFactor = HudScale * 0.1350 * C.ClipX;
    C.Style = 5;
    // End:0xa5
    if(PawnOwner.PlayerReplicationInfo == none || PawnOwner.PlayerReplicationInfo.Team == none || PawnOwner.PlayerReplicationInfo.Team.TeamIndex == 1)
    {
        C.DrawColor = HudColorBlue;
    }
    // End:0xb9
    else
    {
        C.DrawColor = HudColorRed;
    }
    DrawSpriteWidget(C, RechargeBar);
    RechargeBar.Scale = Vehicle(PawnOwner).ChargeBar();
    ShowReloadingPulse(RechargeBar.Scale);
}

function bool DrawLevelAction(Canvas C)
{
    local string LevelActionText;
    local Plane OldModulate;

    // End:0x3d
    if(Level.LevelAction == 0 && Level.Pauser != none)
    {
        LevelActionText = LevelActionPaused;
    }
    // End:0x87
    else
    {
        // End:0x7f
        if(Level.LevelAction == 1 || Level.LevelAction == 4)
        {
            LevelActionText = LevelActionLoading;
        }
        // End:0x87
        else
        {
            LevelActionText = "";
        }
    }
    // End:0x95
    if(LevelActionText == "")
    {
        return false;
    }
    C.Font = LoadLevelActionFont();
    C.DrawColor = LevelActionFontColor;
    C.Style = 5;
    OldModulate = C.ColorModulate;
    C.ColorModulate = C.default.ColorModulate;
    C.DrawScreenText(LevelActionText, LevelActionPositionX, LevelActionPositionY, 8);
    C.ColorModulate = OldModulate;
    return true;
}

function DisplayPortrait(PlayerReplicationInfo PRI)
{
    local Material NewPortrait;

    // End:0x0d
    if(LastPlayerIDTalking > 0)
    {
        return;
    }
    NewPortrait = PRI.GetPortrait();
    // End:0x2f
    if(NewPortrait == none)
    {
        return;
    }
    // End:0x45
    if(Portrait == none)
    {
        PortraitX = 1.0;
    }
    Portrait = NewPortrait;
    PortraitTime = Level.TimeSeconds + float(3);
    PortraitPRI = PRI;
}

simulated function Font LoadLevelActionFont()
{
    return none;
    // End:0x70
    if(LevelActionFontFont == none)
    {
        LevelActionFontFont = Font(DynamicLoadObject(LevelActionFontName, class'Font'));
        // End:0x70
        if(LevelActionFontFont == none)
        {
            Log("Warning: " $ string(self) $ " Couldn't dynamically load font " $ LevelActionFontName);
        }
    }
    return LevelActionFontFont;
}

function DrawProgressStatus(Canvas C, float Progress)
{
    local int diff, savedX2;

    diff = ProgressStatusBar.TextureCoords.X2 - ProgressStatusBar.TextureCoords.X1;
    savedX2 = ProgressStatusBar.TextureCoords.X2;
    ProgressStatusBar.TextureCoords.X2 = ProgressStatusBar.TextureCoords.X1 + int(float(diff) * Progress);
    C.DrawColor = C.default.DrawColor;
    DrawSpriteWidget(C, ProgressStatusBG);
    DrawSpriteWidget(C, ProgressStatusBar);
    ProgressStatusBar.TextureCoords.X2 = savedX2;
}

function NotifyTakeHit(Vector AttackerLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    local int hpBefore, hpAfter;

    AddDamageIndicationInfo(AttackerLocation, Damage, DamageType);
    // End:0xa2
    if(PawnOwner.Health > 0)
    {
        hpBefore = PawnOwner.Health;
        hpAfter = PawnOwner.Health - Damage;
        // End:0x6d
        if(DamageType == class'fell')
        {
            NotifyFallInDanger();
        }
        // End:0x86
        if(IsHealthInDanger(hpBefore, hpAfter))
        {
            NotifyHealthInDanger();
        }
        bAttacked = true;
        fStartTime = Level.TimeSeconds;
    }
}

function AddDamageIndicationInfo(Vector AttackerLocation, int Damage, class<DamageType> DamageType)
{
    local DamageIndicationInfo Info;

    Info.AttackerLocation = AttackerLocation;
    Info.Damage = Damage;
    Info.DamageType = DamageType;
    Info.TimeInserted = Level.TimeSeconds;
    Info.TimeToRemove = Level.TimeSeconds + DamageIndicationDuration;
    DamageIndicationInfos[DamageIndicationInfos.Length] = Info;
    // End:0x93
    if(DamageIndicationInfos.Length >= MaxDamageIndicationCount)
    {
        DamageIndicationInfos.Remove(0, 1);
    }
}

function ClearDamageIndicationInfos()
{
    DamageIndicationInfos.Remove(0, DamageIndicationInfos.Length);
}

function NotifyHealthInDanger()
{
    // End:0x42
    if(ShowHealthInDanagerSoundID == 0)
    {
        ShowHealthInDanagerSoundID = PawnOwner.PlaySoundHK(sound'char_heartbeat_01', 0, float(PawnOwner.SoundVolume) / 255.0,,,,);
    }
    ShowHealthInDanager = true;
    ShowHealthInDanager_BeginTime = Level.TimeSeconds;
    ShowHealthInDanager_EndTime = Level.TimeSeconds + ShowHealthInDanager_Duration;
}

function StopNotifyHealthInDanager()
{
    ShowHealthInDanager = false;
}

function NotifyFallInDanger()
{
    PawnOwner.PlaySoundHK(soundgroup'char_fall', 0, float(PawnOwner.SoundVolume) / 255.0);
    bShowFallInDanger = true;
    ShowFallInDanager_BeginTime = Level.TimeSeconds;
    ShowFallInDanager_EndTime = Level.TimeSeconds + ShowFallDamage_Duration;
}

function StopNotifyFallInDanager()
{
    bShowFallInDanger = false;
}

function DrawFallInDanger(Canvas C)
{
    local float Progress, blinkProgress;
    local byte drawAlpha;
    local int blinkCount;

    C.SetPos(0.0, 0.0);
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    Progress = Level.TimeSeconds - ShowFallInDanager_BeginTime / ShowFallInDanager_EndTime - ShowFallInDanager_BeginTime;
    blinkCount = int(Level.TimeSeconds - ShowFallInDanager_BeginTime / ShowFallDamage_BlinkInterval);
    blinkProgress = Level.TimeSeconds - ShowFallInDanager_BeginTime % ShowFallDamage_BlinkInterval / ShowFallDamage_BlinkInterval;
    // End:0xfe
    if(float(blinkCount) % float(2) == float(0))
    {
        blinkProgress = 1.0 - blinkProgress;
    }
    drawAlpha = byte(ShowHealthInDanger_BlinkMaxAlpha - ShowHealthInDanger_BlinkMaxAlpha - ShowHealthInDanger_BlinkMinAlpha * blinkProgress);
    drawAlpha = byte(float(drawAlpha) * float(1) - Progress);
    C.DrawColor.A = drawAlpha;
    // End:0x175
    if(Level.TimeSeconds > ShowFallInDanager_EndTime)
    {
        StopNotifyFallInDanager();
    }
    // End:0x1b9
    else
    {
        C.DrawTile(ShowHealthInDanager_Material, C.ClipX, C.ClipY, 0.0, 0.0, 512.0, 512.0);
    }
}

function DrawHealthInDanger(Canvas C)
{
    local float Progress, blinkProgress;
    local byte drawAlpha;
    local int blinkCount;

    C.SetPos(0.0, 0.0);
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    Progress = Level.TimeSeconds - ShowHealthInDanager_BeginTime / ShowHealthInDanager_EndTime - ShowHealthInDanager_BeginTime;
    blinkCount = int(Level.TimeSeconds - ShowHealthInDanager_BeginTime / ShowHealthInDanger_BlinkInterval);
    blinkProgress = Level.TimeSeconds - ShowHealthInDanager_BeginTime % ShowHealthInDanger_BlinkInterval / ShowHealthInDanger_BlinkInterval;
    // End:0xfe
    if(float(blinkCount) % float(2) == float(0))
    {
        blinkProgress = 1.0 - blinkProgress;
    }
    drawAlpha = byte(ShowHealthInDanger_BlinkMinAlpha + ShowHealthInDanger_BlinkMaxAlpha - ShowHealthInDanger_BlinkMinAlpha * blinkProgress);
    drawAlpha = byte(float(drawAlpha) * float(1) - Progress);
    C.DrawColor.A = drawAlpha;
    // End:0x1c2
    if(ShowHealthInDanagerSoundID != 0 && IsSoundPlayingHK(ShowHealthInDanagerSoundID) == false)
    {
        ShowHealthInDanagerSoundID = PawnOwner.PlaySoundHK(sound'char_heartbeat_01', 0, 1.0 - Progress);
        ShowHealthInDanagerSoundID = PawnOwner.PlaySoundHK(soundgroup'char_breath_emergency', 0, 1.0 - Progress);
    }
    // End:0x1f5
    if(Level.TimeSeconds > ShowHealthInDanager_EndTime)
    {
        // End:0x1ec
        if(ShowHealthInDanagerSoundID != 0)
        {
            ShowHealthInDanagerSoundID = 0;
        }
        StopNotifyHealthInDanager();
    }
    // End:0x239
    else
    {
        C.DrawTile(ShowHealthInDanager_Material, C.ClipX, C.ClipY, 0.0, 0.0, 512.0, 512.0);
    }
}

function bool IsHealthInDanger(int hpBefore, int hpAfter)
{
    local float ratioBefore, ratioAfter, danger;

    danger = 0.40;
    ratioBefore = float(hpBefore) / PawnOwner.HealthMax;
    ratioAfter = float(hpAfter) / PawnOwner.HealthMax;
    return ratioAfter <= danger && ratioBefore >= danger;
}

function DrawDamageIndicators(Canvas C)
{
    local int lp1;

    // End:0x2d
    if(PlayerOwner.IsInState('Dead') || PlayerOwner.IsInState('Dying'))
    {
    }
    // End:0xd3
    else
    {
        // End:0xa8
        if(!bShowFallInDanger)
        {
            lp1 = 0;
            J0x3f:
            // End:0xa8 [While If]
            if(lp1 < DamageIndicationInfos.Length)
            {
                // End:0x88
                if(Level.TimeSeconds >= DamageIndicationInfos[lp1].TimeToRemove)
                {
                    DamageIndicationInfos.Remove(lp1, 1);
                    -- lp1;
                }
                // End:0x9e
                else
                {
                    DrawDamageIndicator(C, DamageIndicationInfos[lp1]);
                }
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x3f;
            }
        }
        // End:0xbf
        if(ShowHealthInDanager)
        {
            DrawHealthInDanger(C);
        }
        // End:0xd3
        else
        {
            // End:0xd3
            if(bShowFallInDanger)
            {
                DrawFallInDanger(C);
            }
        }
    }
}

function DrawDamageIndicator(Canvas C, DamageIndicationInfo Info)
{
    local Vector HitDir, X, Y, Z, LookVector;

    local Rotator LookDir;
    local float Forward, Left, Angle, Yaw;
    local TexRotator TexRotator;

    HitDir = Info.AttackerLocation - PawnOwner.Location;
    LookDir = PawnOwner.Rotation;
    LookDir.Pitch = 0;
    GetAxes(LookDir, X, Y, Z);
    LookDir = Normalize(LookDir);
    HitDir.Z = 0.0;
    HitDir = Normal(HitDir);
    LookVector = vect(1.0, 0.0, 0.0) >> LookDir;
    LookVector = Normal(LookVector);
    Forward = HitDir Dot X;
    Left = HitDir Dot Y;
    Angle = Acos(LookVector Dot HitDir);
    Yaw = Angle / 3.1415930 * float(65536) / float(2);
    // End:0x119
    if(Forward > float(0))
    {
    }
    // End:0x119
    else
    {
    }
    // End:0x136
    if(Left > float(0))
    {
        Yaw = -Yaw;
    }
    // End:0x136
    else
    {
    }
    C.SetPos(0.0, 0.0);
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    C.DrawColor.A = byte(255 - byte(255.0 * Level.TimeSeconds - Info.TimeInserted / Info.TimeToRemove - Info.TimeInserted));
    TexRotator = TexRotator(DamageIndicationMaterial);
    TexRotator.Rotation.Yaw = int(Yaw);
    C.DrawTile(TexRotator, C.ClipX, C.ClipY, 0.0, 0.0, 512.0, 512.0);
    C.SetPos(0.050, C.ClipY / float(2));
    C.Flush();
}

function OnClientReceiveDeathMessage_AddToConsole(PlayerController P, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, wDamageType DamageType)
{
    local Console Console;
    local string killMessage;
    local MessageItem Msg;

    Console = P.Player.Console;
    killMessage = attackerPRI.PlayerName $ " killed " $ victimPRI.PlayerName;
    Msg = Console.ConstructMessageItem(killMessage, 6);
    Console.AddMessageItem(Msg);
}

function OnClientReceiveHeliDeathMessage(PlayerController P, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject)
{
    local Object cls;

    cls = DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_HelicopterDown", class'Class');
    HudPart_KillMessage.AddKillMessageItem(HudPart_KillMessage.MakeKillMessageItem(attackerPRI, none, attackerPRI.PlayerName, KillMessageHelicopterName, class<DamageType>(cls), 0, false, true, none));
}

function OnClientReceiveFlyingDefenceBotDeathMessage(PlayerController P, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject)
{
    local KillMessageItem Item;
    local Object cls;

    cls = DynamicLoadObject("WWeapons_Res.wWeaponRes_Special_FlyingDefenceBotKill", class'Class');
    Item = HudPart_KillMessage.MakeKillMessageItem(attackerPRI, none, attackerPRI.PlayerName, KillMessageHelicopterName, class<DamageType>(cls), 0, false, true, none);
    HudPart_KillMessage.AddKillMessageItem(Item);
}

function OnClientReceiveDeathMessage(PlayerController P, int Switch, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject)
{
    local class<DamageType> DamageType;

    DamageType = class<DamageType>(OptionalObject);
    // End:0x114
    if(P != none && victimPRI != none && DamageType != none)
    {
        // End:0xf1
        if(attackerPRI != none)
        {
            HudPart_KillMessage.AddKillMessage(attackerPRI, victimPRI, DamageType, Switch);
            // End:0xee
            if(attackerPRI == PlayerOwner.PlayerReplicationInfo || victimPRI == PlayerOwner.PlayerReplicationInfo)
            {
                LastSelfKillMessage = MakeSelfKillMessage(attackerPRI.PlayerName, victimPRI.PlayerName, DamageType);
                // End:0xee
                if(victimPRI == PlayerOwner.PlayerReplicationInfo)
                {
                    RefreshKillerMark(attackerPRI.PlayerName);
                }
            }
        }
        // End:0x114
        else
        {
            HudPart_KillMessage.AddKillMessage(attackerPRI, victimPRI, DamageType, Switch);
        }
    }
}

function RefreshKillerMark(string mKillerName)
{
    RefreshKillerName(mKillerName);
}

function SelfKillMessage MakeSelfKillMessage(string KillerName, string VictimName, class<DamageType> Type)
{
    local SelfKillMessage R;

    R.KillerName = KillerName;
    R.VictimName = VictimName;
    R.Type = Type;
    R.Time = Level.TimeSeconds;
    // End:0x7b
    if(VictimName == KillerName)
    {
        R.Message = SuicideMessage;
        R.MessageColor = SelfKillColor;
    }
    // End:0xed
    else
    {
        // End:0xc6
        if(KillerName == PlayerOwner.PlayerReplicationInfo.PlayerName)
        {
            R.Message = VictimName $ SelfKillMessage_Killed;
            R.MessageColor = SelfKillColor;
        }
        // End:0xed
        else
        {
            R.Message = KillerName $ SelfKillMessage_KilledBy;
            R.MessageColor = SelfKilledByColor;
        }
    }
    return R;
}

function DrawSelfKillMessage(Canvas C)
{
    local CalCoordsW calW;

    // End:0x2af
    if(LastSelfKillMessage.Time != float(0) && Level.TimeSeconds - LastSelfKillMessage.Time < float(3))
    {
        // End:0x187
        if(LastSelfKillMessage.KillerName != LastSelfKillMessage.VictimName && LastSelfKillMessage.KillerName == PlayerOwner.PlayerReplicationInfo.PlayerName)
        {
            C.SetPos(544.0 * _reX, 948.0 + float(80) * _reY);
            C.SetDrawColor(byte(255), byte(255), byte(255));
            C.DrawTileStretched(texture'img_HUD_back_2', 511.0 * _reX, 51.0 * _reY);
            C.DrawColor = LastSelfKillMessage.MessageColor;
            C.BtrDrawTextJustified(LastSelfKillMessage.Message, 1, 558.0 * _reX, 961.0 + float(80) * _reY, 1041.0 * _reX, 986.0 + float(80) * _reY, int(float(18) * _reY));
            C.SetDrawColor(byte(255), byte(255), byte(255));
        }
        // End:0x2af
        else
        {
            CalculateCoordinateEx(C, WBGKillMessage, 1600.0, 104.0, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WBGKillMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            C.DrawColor = LastSelfKillMessage.MessageColor;
            C.BtrDrawTextJustifiedWithVolumeLine(LastSelfKillMessage.Message, 1, 0.0 * _reX, 365.0 * _reY, 1600.0 * _reX, 365.0 * _reY, int(float(24) * _reY), color_Shadow);
            C.SetDrawColor(byte(255), byte(255), byte(255));
        }
    }
}

function CallSkill(optional int iKey, optional bool bRequire, optional bool bSuccess)
{
    // End:0x2d
    if(iKey == 6)
    {
        // End:0x2d
        if(bSkill_ATR || bSkill_M2B || bSkill_RPG7)
        {
            return;
        }
    }
    HudPart_DisplayEvent.CallSkill(iKey, bRequire, bSuccess);
}

function Vector CalcScreenPos(Canvas C, Vector objectLoc, float W, float H, out byte clipped, optional bool ClipEclipse, optional float rX, optional float rY)
{
    local Vector ScreenPos, camLoc;
    local Rotator camRot;
    local bool behind;
    local Vector Orientation, center, Delta;
    local float TX, ty, cX, cY, o_rx, o_ry,
	    ecc, M;

    cX = 512.0 / float(1024);
    cY = 384.0 / float(768);
    // End:0x49
    if(rX == float(0))
    {
        rX = 446.0 / float(1024);
    }
    // End:0x6a
    if(rY == float(0))
    {
        rY = 343.0 / float(768);
    }
    o_rx = rX * C.ClipX;
    o_ry = rY * C.ClipY;
    C.GetCameraLocation(camLoc, camRot);
    behind = objectLoc - camLoc Dot vector(camRot) < float(0);
    clipped = 0;
    // End:0x1fb
    if(behind)
    {
        Orientation = GetTargetOrientation2(objectLoc, camLoc, camRot);
        Orientation = ExpandTargetOrientationToCanvas(C, Orientation);
        // End:0x1ae
        if(ClipEclipse)
        {
            ScreenPos.X = C.ClipX * cX + C.ClipX * Orientation.X * rX;
            ScreenPos.Y = C.ClipY * cY - C.ClipY * Orientation.Y * rY;
        }
        // End:0x1f8
        else
        {
            ScreenPos.X = C.ClipX * Orientation.X;
            ScreenPos.Y = C.ClipY * Orientation.Y;
        }
    }
    // End:0x215
    else
    {
        ScreenPos = C.WorldToScreen(objectLoc);
    }
    // End:0x3fd
    if(ClipEclipse)
    {
        center.X = C.ClipX * cX;
        center.Y = C.ClipY * cY;
        TX = ScreenPos.X - center.X;
        ty = ScreenPos.Y - center.Y;
        ecc = TX * TX / o_rx * o_rx + ty * ty / o_ry * o_ry;
        // End:0x3fa
        if(ecc > float(1))
        {
            clipped = 1;
            Delta = Normal(ScreenPos - center);
            M = Delta.Y / Delta.X;
            ScreenPos.X = o_rx * o_ry / Sqrt(o_ry * o_ry + o_rx * o_rx * M * M);
            // End:0x383
            if(Delta.X < float(0))
            {
                ScreenPos.X = -ScreenPos.X;
            }
            ScreenPos.Y = ScreenPos.X * M;
            ScreenPos += center;
            // End:0x3fa
            if(behind)
            {
                // End:0x3fa
                if(ScreenPos.Y < center.Y)
                {
                    ScreenPos.Y = center.Y + center.Y - ScreenPos.Y;
                }
            }
        }
    }
    // End:0x564
    else
    {
        // End:0x435
        if(ScreenPos.X < W / float(2))
        {
            ScreenPos.X = W / float(2);
            clipped = 1;
        }
        // End:0x48d
        if(ScreenPos.X > C.ClipX - W / float(2))
        {
            ScreenPos.X = C.ClipX - W / float(2);
            clipped = 1;
        }
        // End:0x4c5
        if(ScreenPos.Y < H / float(2))
        {
            ScreenPos.Y = H / float(2);
            clipped = 1;
        }
        // End:0x51d
        if(ScreenPos.Y > C.ClipY - H / float(2))
        {
            ScreenPos.Y = C.ClipY - H / float(2);
            clipped = 1;
        }
        // End:0x564
        if(behind)
        {
            // End:0x564
            if(objectLoc.Z < camLoc.Z)
            {
                ScreenPos.Y = C.ClipY - ScreenPos.Y;
            }
        }
    }
    return ScreenPos;
}

function DrawObjectSprite3(Canvas C, SpriteWidget objectSprite, Vector objectLoc)
{
    local float W, H;
    local Vector ScreenPos;
    local byte clipped;
    local float X1, Y1, X2, Y2;
    local int iMeterString;

    W = float(objectSprite.TextureCoords.X2 - objectSprite.TextureCoords.X1) / 1600.0 * C.ClipX;
    H = float(objectSprite.TextureCoords.Y2 - objectSprite.TextureCoords.Y1) / 1200.0 * C.ClipY;
    ScreenPos = CalcScreenPos(C, objectLoc, W, H, clipped, true);
    objectSprite.PosX = ScreenPos.X / C.ClipX;
    objectSprite.PosY = ScreenPos.Y / C.ClipY;
    DrawSpriteWidget(C, objectSprite);
    X1 = ScreenPos.X - float(60) * _reX;
    Y1 = ScreenPos.Y - 66.0 * _reY;
    X2 = ScreenPos.X + 60.0 * _reX;
    Y2 = ScreenPos.Y - float(38) * _reY;
    iMeterString = int(VSize(PlayerOwner.CalcViewLocation - objectLoc) - PlayerOwner.fAirStrikeRadius * 0.010);
    iMeterString = Max(0, iMeterString);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(string(iMeterString) $ "", 1, X1, Y1, X2, Y2, int(float(15) * _reY), RedBlueColors[1]);
    C.BtrDrawTextJustifiedWithVolumeLine("M", 1, X1, Y1 + float(14), X2, Y2 + float(14), int(float(15) * _reY), RedBlueColors[1]);
    // End:0x2a9
    if(clipped == 1)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        DrawOutArrow(C, W, H, ScreenPos);
    }
}

function DrawObjectSprite2(Canvas C, Object Tag, SpriteWidget objectSprite, Vector objectLoc, optional string ObjectName, optional int Alpha)
{
    local float W, H;
    local Vector ScreenPos;
    local byte clipped;
    local float X1, Y1, X2, Y2;

    // End:0x13
    if(Alpha == 0)
    {
        Alpha = 255;
    }
    W = float(objectSprite.TextureCoords.X2 - objectSprite.TextureCoords.X1) / 1600.0 * C.ClipX;
    H = float(objectSprite.TextureCoords.Y2 - objectSprite.TextureCoords.Y1) / 1200.0 * C.ClipY;
    ScreenPos = CalcScreenPos(C, objectLoc, W, H, clipped, false);
    // End:0xc6
    if(clipped == 1)
    {
        return;
    }
    objectSprite.PosX = ScreenPos.X / C.ClipX;
    objectSprite.PosY = ScreenPos.Y / C.ClipY;
    X1 = ScreenPos.X - float(68) * _reX;
    Y1 = ScreenPos.Y - 43.0 * _reY;
    X2 = ScreenPos.X + 68.0 * _reX;
    Y2 = ScreenPos.Y - float(15) * _reY;
    C.SetDrawColor(162, 240, 79, byte(Alpha));
    C.BtrDrawTextJustifiedWithVolumeLine(ObjectName, 1, X1, Y1, X2, Y2, int(float(17) * _reY), RedBlueColors[1]);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(Alpha));
    // End:0x254
    if(objectSprite.WidgetTexture != none)
    {
        objectSprite.Tints[0].A = byte(Alpha);
        objectSprite.Tints[1].A = byte(Alpha);
        DrawSpriteWidget(C, objectSprite);
    }
}

function DrawObjectSprite(Canvas C, Object Tag, SpriteWidget objectSprite, Vector objectLoc, optional bool drawMeter, optional float rX, optional float rY)
{
    local float W, H;
    local Vector ScreenPos;
    local byte clipped;
    local Plane targetModulate, modulateDiff;
    local int lp1, idx, iMeterString;
    local bool Found;
    local float Speed, DeltaTime, X1, Y1, X2, Y2;

    W = float(objectSprite.TextureCoords.X2 - objectSprite.TextureCoords.X1) / 1600.0 * C.ClipX;
    H = float(objectSprite.TextureCoords.Y2 - objectSprite.TextureCoords.Y1) / 1200.0 * C.ClipY;
    ScreenPos = CalcScreenPos(C, objectLoc, W, H, clipped, true, rX, rY);
    objectSprite.PosX = ScreenPos.X / C.ClipX;
    objectSprite.PosY = ScreenPos.Y / C.ClipY;
    // End:0x113
    if(clipped == 1)
    {
        targetModulate = ObjectSpriteEdgeColorModulate;
    }
    // End:0x127
    else
    {
        targetModulate = C.default.ColorModulate;
    }
    Found = false;
    lp1 = 0;
    J0x136:
    // End:0x184 [While If]
    if(lp1 < SpriteTag.Length)
    {
        // End:0x17a
        if(SpriteTag[lp1] == Tag.Name)
        {
            Found = true;
            idx = lp1;
        }
        // End:0x184
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x136;
        }
    }
    // End:0x27b
    if(Found)
    {
        modulateDiff.W = targetModulate.W - SpriteLastColorModulates[idx].W;
        DeltaTime = Level.TimeSeconds - SpriteLastTime[idx];
        SpriteLastTime[idx] = Level.TimeSeconds;
        Speed = 0.50 * DeltaTime;
        // End:0x235
        if(Abs(modulateDiff.W) < Speed)
        {
            SpriteLastColorModulates[idx].W = targetModulate.W;
        }
        // End:0x278
        else
        {
            // End:0x261
            if(modulateDiff.W < float(0))
            {
                SpriteLastColorModulates[idx].W -= Speed;
            }
            // End:0x278
            else
            {
                SpriteLastColorModulates[idx].W += Speed;
            }
        }
    }
    // End:0x2cc
    else
    {
        idx = SpriteTag.Length;
        SpriteTag[idx] = Tag.Name;
        SpriteLastColorModulates[idx] = targetModulate;
        SpriteLastTime[idx] = Level.TimeSeconds;
    }
    C.ColorModulate = SpriteLastColorModulates[idx];
    DrawSpriteWidget(C, objectSprite);
    // End:0x407
    if(clipped != 1)
    {
        // End:0x407
        if(drawMeter)
        {
            X1 = ScreenPos.X - float(60) * _reX;
            Y1 = ScreenPos.Y - 25.0 * _reY;
            X2 = ScreenPos.X + 60.0 * _reX;
            Y2 = ScreenPos.Y + float(3) * _reY;
            iMeterString = int(VSize(PlayerOwner.CalcViewLocation - objectLoc) * 0.010);
            C.SetDrawColor(162, 240, 79, byte(255));
            C.BtrDrawTextJustifiedWithVolumeLine(string(iMeterString) $ " M", 1, X1, Y1, X2, Y2, int(float(17) * _reY), RedBlueColors[1]);
        }
    }
    // End:0x44d
    if(clipped == 1)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        DrawOutArrow(C, W, H, ScreenPos);
    }
    C.ColorModulate = C.default.ColorModulate;
}

function DrawOutArrow(Canvas C, float W, float H, Vector ScreenPos)
{
    local Vector screenCenterVector, HitDir, X, Y, LookVector;

    local float Forward, Left, Angle, Yaw, Size;

    screenCenterVector = MakeVector(C.ClipX / float(2), C.ClipY / float(2), 0.0);
    HitDir = ScreenPos - screenCenterVector;
    LookVector = vect(0.0, 1.0, 0.0);
    HitDir = Normal(HitDir);
    X = vect(0.0, 1.0, 0.0);
    Y = vect(1.0, 0.0, 0.0);
    Forward = HitDir Dot X;
    Left = HitDir Dot Y;
    Angle = Acos(LookVector Dot HitDir);
    Yaw = 3.1415930 - Angle / 3.1415930 * float(65536) / float(2);
    // End:0x105
    if(Forward > float(0))
    {
    }
    // End:0x105
    else
    {
    }
    // End:0x122
    if(Left > float(0))
    {
        Yaw = -Yaw;
    }
    // End:0x122
    else
    {
    }
    Size = OutArrowSize * _reY;
    C.SetPos(ScreenPos.X - Size / float(2), ScreenPos.Y - Size / float(2) + float(15));
    outArrow.Rotation.Yaw = int(Yaw);
    C.DrawTile(outArrow, Size, Size, 0.0, 0.0, float(outArrow.MaterialUSize()), float(outArrow.MaterialVSize()));
}

static final function Vector GetTargetOrientation(Actor Target, Vector camLoc, Rotator camRot)
{
    return GetTargetOrientation2(Target.Location, camLoc, camRot);
}

static final function Vector ExpandTargetOrientationToCanvas(Canvas C, Vector Orientation)
{
    local float Edge;

    // End:0x39
    if(Abs(Orientation.X) > Abs(Orientation.Y))
    {
        Edge = 1.0 / Abs(Orientation.X);
    }
    // End:0x6f
    else
    {
        // End:0x6f
        if(Abs(Orientation.X) < Abs(Orientation.Y))
        {
            Edge = 1.0 / Abs(Orientation.Y);
        }
    }
    Orientation.X = Orientation.X * Edge;
    Orientation.Y = Orientation.Y * Edge;
    return Orientation;
}

static function Vector GetTargetOrientation2(Vector loc, Vector camLoc, Rotator camRot)
{
    local Vector X, Y, Z, Orientation;
    local float dist, DirY, DirZ;

    GetAxes(camRot, X, Y, Z);
    DirY = Normal(loc - camLoc) Dot Normal(Y);
    DirZ = Normal(loc - camLoc) Dot Normal(Z);
    dist = Sqrt(DirY * DirY + DirZ * DirZ);
    Orientation.X = DirY / dist;
    Orientation.Y = DirZ / dist;
    return Orientation;
}

function BeginDrawChangeHost()
{
    DrawChangeHost = true;
    DrawChangeHostBeginTime = Level.TimeSeconds;
    Log("[HudCDeathMatch::BeginDrawChangeHost] DrawChangeHostBeginTime=" $ string(DrawChangeHostBeginTime));
}

function EndDrawChangeHost()
{
    Log("[HudCDeathMatch::EndDrawChangeHost] off");
    DrawChangeHost = false;
    Level.GetMatchMaker().DrawChangeHost_Host = false;
    Level.GetMatchMaker().DrawChangeHost_Guest = false;
}

function OnEndChangedHost()
{
    EndDrawChangeHost();
}

function DrawChangeHostGuest(Canvas C)
{
    local int FontSize;

    FontSize = 15;
    C.SetDrawColor(byte(255), 160, 160);
    // End:0xc6
    if(Level.GetMatchMaker().IsChangeHost_InLoading || Level.GetMatchMaker().IsChangeNewGuest_InLoading || Level.GetMatchMaker().DrawChangeHost_Host || Level.GetMatchMaker().DrawChangeHost_Guest || DrawChangeHost)
    {
        // End:0xb2
        if(DrawChangeHost == false)
        {
            BeginDrawChangeHost();
        }
        HudPart_DisplayEvent.DrawHostChange(C);
    }
}

function CallEvent(optional bool InvenCheck, optional int iReservation1, optional int iReservation2)
{
    local wWeapon Wpn;
    local int wID;
    local float Max, curr;

    // End:0xe1
    if(InvenCheck)
    {
        // End:0x16
        if(PawnOwner == none)
        {
            return;
        }
        InitSkillFlag();
        Wpn = PawnOwner.Weapon;
        // End:0xdb
        if(Wpn != none)
        {
            Wpn.GetAmmoCount(Max, curr);
            wID = Wpn.BaseParams.iWeaponID;
            switch(wID)
            {
                // End:0x98
                case 5001:
                    // End:0x95
                    if(curr > float(0))
                    {
                        bSkill_ATR = true;
                    }
                    // End:0xdb
                    break;
                // End:0xb8
                case 5003:
                    // End:0xb5
                    if(curr > float(0))
                    {
                        bSkill_M2B = true;
                    }
                    // End:0xdb
                    break;
                // End:0xd8
                case 5011:
                    // End:0xd5
                    if(curr > float(0))
                    {
                        bSkill_RPG7 = true;
                    }
                    // End:0xdb
                    break;
                // End:0xffff
                default:
                }
                HasItemInMyInventory();
            }
            // End:0x19e
            if(!InvenCheck)
            {
                // End:0x111
                if(HudPart_DisplayEvent != none)
                {
                    HudPart_DisplayEvent.CallEvent(false, iReservation1, iReservation2);
                }
                // End:0x136
                if(HudPart_DisplayMain != none)
                {
                    HudPart_DisplayMain.CallEvent(false, iReservation1, iReservation2);
                }
                // End:0x15b
                if(HudPart_SelQuickSlot != none)
                {
                    HudPart_SelQuickSlot.CallEvent(false, iReservation1, iReservation2);
                }
                // End:0x19e
                if(HudPart_Tutorial != none && Level.GetMatchMaker().BotTutorial)
                {
                    HudPart_Tutorial.CallEvent(false, iReservation1, iReservation2);
                }
            }
}

function CallRadioMessage(optional int iKey, optional int iReservation1, optional int iReservation2)
{
    // End:0x29
    if(HudPart_RadioMessage != none)
    {
        HudPart_RadioMessage.CallRadioMessage(iKey, iReservation1, iReservation2);
    }
}

function TutorialEvent(coerce string S, optional name Type, optional name reserv)
{
    // End:0x29
    if(HudPart_Tutorial != none)
    {
        HudPart_Tutorial.TutorialEvent(S, Type, reserv);
    }
}

function DrawDebugUAV(Canvas C, int X, out int Y, int dy)
{
    local TeamInfo Team;

    C.BtrDrawTextJustified("[DrawDebugUAV]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified("Level.TimeSeconds=" $ string(Level.TimeSeconds), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
    Y += dy;
    C.BtrDrawTextJustified("Level.PlayTimeSeconds=" $ string(Level.PlayTimeSeconds), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
    Y += dy;
    C.BtrDrawTextJustified("GRI.ElapsedTime" $ string(PlayerOwner.GameReplicationInfo.ElapsedTime), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
    Y += dy;
    C.BtrDrawTextJustified("bIsOwner=" $ string(Level.GetMatchMaker().bIsOwner) @ "bChangingHost=" $ string(Level.GetMatchMaker().bChangingHost), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
    Y += dy;
    // End:0x2fe
    foreach DynamicActors(class'TeamInfo', Team)
    {
        C.BtrDrawTextJustified("team " $ string(Team.TeamIndex) $ " begin=" $ string(Team.ElapsedTime_UAVBegin) $ " end=" $ string(Team.ElapsedTime_UAVEnd), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
        Y += dy;                
    }
    C.BtrDrawTextJustified("UAVScanBeginTime=" $ string(PlayerOwner.PlayerReplicationInfo.UAVScanBeginTime), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
    Y += dy;
    C.BtrDrawTextJustified("UAVScanEndTime=" $ string(PlayerOwner.PlayerReplicationInfo.UAVScanEndTime), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
    Y += dy;
    C.BtrDrawTextJustified("UAVLastBeginScanLevelSeconds=" $ string(UAVLastBeginScanLevelSeconds), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
    Y += dy;
    // End:0x554
    if(IsUAVScanning())
    {
        C.BtrDrawTextJustified("scanProgress=" $ string(GetUAVScanProgress()), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
        Y += dy;
        C.BtrDrawTextJustified("scanX=" $ string(float(UAVMinimapBase.MinimapCenterX - UAVMinimapBase.MinimapSize / 2) + float(UAVMinimapBase.MinimapSize) * UAVMinimapBase.GetUAVScanProgress()), 0, float(X), float(Y), C.ClipX, float(Y + 14), 9);
        Y += dy;
    }
    Y += dy;
}

function DrawUAV(Canvas C)
{
    local TeamInfo myTeam, EnemyTeam;
    local bool myTeamUAV, enemyTeamUAV;
    local int Time;

    // End:0x6c
    if(Level.GRI.3 > PlayerOwner.GetTeamNum() && 0 <= PlayerOwner.GetTeamNum())
    {
        myTeam = Level.GRI.Teams[PlayerOwner.GetTeamNum()];
    }
    // End:0xe1
    if(Level.GRI.3 > 1 - PlayerOwner.GetTeamNum() && 0 <= 1 - PlayerOwner.GetTeamNum())
    {
        EnemyTeam = Level.GRI.Teams[1 - PlayerOwner.GetTeamNum()];
    }
    // End:0x102
    if(myTeam != none)
    {
        myTeamUAV = myTeam.IsUAVOn();
    }
    // End:0x123
    if(EnemyTeam != none)
    {
        enemyTeamUAV = EnemyTeam.IsUAVOn();
    }
    C.DrawColor = UAVIconColor;
    // End:0x24c
    if(myTeamUAV)
    {
        Time = myTeam.GetUAVTime();
        C.SetPos(UAVIconPosXAlly * _reX, UAVIconPosYAlly * _reY);
        C.DrawTile(Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.icon_wh_uav", class'Material')), UAVIconWidth * _reX, UAVIconHeight * _reY, 0.0, 0.0, 64.0, 64.0);
        DrawDigitSet(C, UAVIconTextPosXAlly * _reX, UAVIconTextPosYAlly * _reY, UAVIconTextOffsetX * _reX, UAVIconTextXL * _reX, UAVIconTextYL * _reY, Time, WDigitsSmall, 2, "0");
    }
    // End:0x360
    if(enemyTeamUAV)
    {
        Time = EnemyTeam.GetUAVTime();
        C.SetPos(UAVIconPosXEnemy * _reX, UAVIconPosYEnemy * _reY);
        C.DrawTile(Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.icon_r_uav", class'Material')), UAVIconWidth * _reX, UAVIconHeight * _reY, 0.0, 0.0, 64.0, 64.0);
        DrawDigitSet(C, UAVIconTextPosXEnemy * _reX, UAVIconTextPosYEnemy * _reY, UAVIconTextOffsetX * _reX, UAVIconTextXL * _reX, UAVIconTextYL * _reY, Time, WDigitsSmall, 2, "0");
    }
    C.DrawColor = class'HUD'.default.WhiteColor;
}

simulated function UpdateUAV()
{
    local int uavDiff;
    local Pawn P;

    // End:0xeb
    if(IsUAVOn())
    {
        uavDiff = int(Level.PlayTimeSeconds - PlayerOwner.PlayerReplicationInfo.UAVScanBeginTime);
        // End:0x8b
        if(Level.PlayTimeSeconds - UAVLastBeginScanLevelSeconds > float(class'GameInfo'.default.UAVScanInterval) && float(uavDiff) % float(class'GameInfo'.default.UAVScanInterval) == float(0))
        {
            StartUAVScan();
        }
        // End:0xeb
        if(IsUAVScanning())
        {
            // End:0xea
            foreach DynamicActors(class'Pawn', P)
            {
                // End:0xe9
                if(Level.TimeSeconds - P.UAVScannedTime > UAVOneScanTime)
                {
                    // End:0xe9
                    if(IsPawnUnderScan(P))
                    {
                        P.UAVScan();
                    }
                }                                
            }
        }
    }
}

function bool IsPawnUnderScan(Pawn P)
{
    local float minimapX2, minimapY2;
    local Rotator defaultRot;

    // End:0x47
    if(PawnOwner == none)
    {
        UAVMinimapBase.CalculateMinimapPosition(vect(0.0, 0.0, 0.0), defaultRot, P.Location, minimapX2, minimapY2);
    }
    // End:0x81
    else
    {
        UAVMinimapBase.CalculateMinimapPosition(PawnOwner.Location, defaultRot, P.Location, minimapX2, minimapY2);
    }
    return minimapX2 < GetUAVScanLineMinimapPos() + float(UAVScanOffset);
}

function StartUAVScan()
{
    UAVLastBeginScanLevelSeconds = Level.PlayTimeSeconds;
}

simulated function float GetUAVScanProgress()
{
    local float diff, Progress;

    diff = Level.PlayTimeSeconds - UAVLastBeginScanLevelSeconds;
    Progress = UAVOneScanMin + diff / UAVOneScanTime * UAVOneScanMax - UAVOneScanMin;
    return Progress;
}

simulated function float GetUAVScanLineMinimapPos()
{
    return float(UAVMinimapBase.MinimapCenterX - UAVMinimapBase.MinimapSize / 2) + float(UAVMinimapBase.MinimapSize) * GetUAVScanProgress();
}

simulated function float GetUAVScanLineTexturePos()
{
    local float uavScanMinimapX, uavScanMinimapY;
    local int TX, ty;

    uavScanMinimapX = GetUAVScanLineMinimapPos();
    uavScanMinimapY = 0.0;
    UAVMinimapBase.CalculateTexturePositionFromMinimapPosition(uavScanMinimapX, uavScanMinimapY, TX, ty);
    return float(TX);
}

simulated function bool IsUAVScanning()
{
    return UAVLastBeginScanLevelSeconds <= Level.PlayTimeSeconds && Level.PlayTimeSeconds <= UAVLastBeginScanLevelSeconds + UAVOneScanTime;
}

simulated function bool IsUAVOn()
{
    // End:0x23
    if(PlayerOwner == none || PlayerOwner.PlayerReplicationInfo == none)
    {
        return false;
    }
    return PlayerOwner.PlayerReplicationInfo.UAVScanBeginTime <= Level.PlayTimeSeconds && Level.PlayTimeSeconds <= PlayerOwner.PlayerReplicationInfo.UAVScanEndTime;
}

simulated function LocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString)
{
    // End:0x37
    if(Message == class'wMessage_Game_Mode')
    {
        HudPart_DisplayEvent.DisplayEvent_GameMode(class'wMessage_Game_Mode'.static.GetString(Switch));
        return;
    }
    // End:0xc0
    else
    {
        // End:0x72
        if(Message == class'wMessage_Game')
        {
            // End:0x6f
            if(Switch == class'wMessage_Game'.default.Code_SuddenDeath)
            {
                HudPart_DisplayEvent.DisPlayEvent_SudenDeath();
                return;
            }
        }
        // End:0xc0
        else
        {
            // End:0xc0
            if(Message == class'StartupMessage')
            {
                // End:0xbe
                if(Switch >= 10 && Switch <= 60)
                {
                    HudPart_DisplayEvent.DisPlayEvent_Waiting(class'StartupMessage'.static.GetString(Switch));
                }
                return;
            }
        }
    }
    super.LocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject, CriticalString);
}

simulated function DrawMessage(Canvas C, int i, float PosX, float PosY, out float dx, out float dy)
{
    local float FadeValue, ScreenX, ScreenY, fPosY, fFadeOutTime;

    local int iFontSize;
    local Color drawShowColor;

    // End:0x41
    if(!LocalMessages[i].Message.default.bFadeMessage)
    {
        C.DrawColor = LocalMessages[i].DrawColor;
    }
    // End:0x184
    else
    {
        FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
        C.DrawColor = LocalMessages[i].DrawColor;
        C.DrawColor.A = byte(float(LocalMessages[i].DrawColor.A) * FadeValue / LocalMessages[i].Lifetime);
        // End:0x184
        if(LocalMessages[i].Message == class'wMessage_Game_ImpSystem')
        {
            fFadeOutTime = class'wMessage_Game_ImpSystem'.default.fFadeOutTime;
            FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
            FadeValue = FadeValue / LocalMessages[i].Lifetime - fFadeOutTime;
            C.DrawColor.A = byte(float(LocalMessages[i].DrawColor.A) * FClamp(FadeValue, 0.0, 1.0));
        }
    }
    C.Font = LocalMessages[i].StringFont;
    GetScreenCoords(PosX, PosY, ScreenX, ScreenY, LocalMessages[i], C);
    C.SetPos(ScreenX, ScreenY);
    dx = LocalMessages[i].dx / C.ClipX;
    dy = LocalMessages[i].dy / C.ClipY;
    // End:0x2e1
    if(LocalMessages[i].Message.default.bComplexString)
    {
        LocalMessages[i].Message.static.RenderComplexMessage(C, LocalMessages[i].dx, LocalMessages[i].dy, LocalMessages[i].StringMessage, LocalMessages[i].Switch, LocalMessages[i].RelatedPRI, LocalMessages[i].RelatedPRI2, LocalMessages[i].OptionalObject);
    }
    // End:0x5f4
    else
    {
        // End:0x539
        if(LocalMessages[i].Message == class'wMessage_Game_ImpSystem')
        {
            // End:0x35f
            if(IsDrawModeMessage && IsDrawSystemMessage)
            {
                // End:0x348
                if(class'wMessage_Game_ImpSystem'.static.IsMessageMode(LocalMessages[i].Switch))
                {
                    fPosY = class'wMessage_Game_ImpSystem'.default.PosY1;
                }
                // End:0x35c
                else
                {
                    fPosY = class'wMessage_Game_ImpSystem'.default.PosY2;
                }
            }
            // End:0x425
            else
            {
                fPosY = class'wMessage_Game_ImpSystem'.default.PosY;
                // End:0x425
                if(LocalMessages[i].Switch == class'wMessage_Game_ImpSystem'.default.Code_EnemyHelicopter || LocalMessages[i].Switch == class'wMessage_Game_ImpSystem'.default.Code_EnemyArtillery || LocalMessages[i].Switch == class'wMessage_Game_ImpSystem'.default.Code_EnemyUAV)
                {
                    DrawWaringMark(C, 450.0, 169.0, LocalMessages[i].EndOfLife - Level.TimeSeconds, LocalMessages[i].Lifetime);
                }
            }
            GetScreenCoords(PosX, fPosY, ScreenX, ScreenY, LocalMessages[i], C);
            C.SetPos(ScreenX, ScreenY);
            iFontSize = LocalMessages[i].Message.default.FontSize;
            drawShowColor = C.MakeColor(0, 0, 0, 200);
            drawShowColor.A = byte(Clamp(C.DrawColor.A, 0, 200));
            class'BTCustomDrawHK'.static.DrawStringModulateAlpha(C, LocalMessages[i].StringMessage, 4, float(iFontSize) * _reY, 0.0, ScreenY, C.ClipX, ScreenY + LocalMessages[i].dy, drawShowColor, 4, false);
        }
        // End:0x5f4
        else
        {
            // End:0x572
            if(LocalMessages[i].Message == class'wMultiKillMessage' || LocalMessages[i].Message == class'wSpecialKillMessage')
            {
            }
            // End:0x5f4
            else
            {
                class'BTCustomDrawHK'.static.DrawStringModulateAlpha(C, LocalMessages[i].StringMessage, 4, 20.0 / 768.0 * C.ClipY, 0.0, ScreenY, C.ClipX, ScreenY + LocalMessages[i].dy, C.DrawBackColor, 4, false);
            }
        }
    }
    LocalMessages[i].Drawn = true;
}

simulated function DrawMessageWithTexture(Canvas C, int i, float PosX, float PosY, out float dx, out float dy)
{
    // End:0x41
    if(!LocalMessages[i].Message.default.bFadeMessage)
    {
        C.DrawColor = LocalMessages[i].DrawColor;
    }
    // End:0xba
    else
    {
        // End:0xba
        if(LocalMessages[i].Message == class'wMessage_Score' || LocalMessages[i].Message == class'wMultiKillMessage' || LocalMessages[i].Message == class'wSpecialKillMessage')
        {
            DrawMessageScore(C, i, PosX, PosY, dx, dy);
        }
        // End:0xba
        else
        {
        }
    }
    LocalMessages[i].Drawn = true;
}

simulated function ResetKillMessageTexture()
{
    Texture(WKillBlood.WidgetTexture).AnimCurrent = Texture(class'HudCDeathmatch'.default.WKillBlood.WidgetTexture);
    Texture(WKillBlood.WidgetTexture).Accumulator = -1.0;
}

simulated function DrawMessageScore(Canvas C, int i, float PosX, float PosY, out float dx, out float dy)
{
    local float FadeValue, ScreenX, ScreenY, fFadeOutTime, fPosY, fTotalEffectRunTime,
	    fEffectRunTime1, fEffectRunTime2, fRealDrawTime, CurrentScale, Delta,
	    Delta2, fPassingTime, StartScale, fScaleStepMultiplier, fScaleStep;

    local CalCoordsW calW;
    local SpriteWidget TempKillBlood;
    local int BloodWidth, BloodHeight, KillWidth, KillHeight, KillMarkMedalWidth, KillMarkMedalHeight;

    local bool bNeedReturn;
    local float KillPosX, KillPosY, MedalMarkPosX, MedalMarkPosY, ScorePosX, ScorePosY;

    ScorePosX = 655.0;
    ScorePosY = 274.0;
    KillPosX = 0.0;
    KillPosY = 0.0;
    MedalMarkPosX = 0.0;
    MedalMarkPosY = 0.0;
    BloodWidth = 378;
    BloodHeight = 291;
    KillWidth = 274;
    KillHeight = 72;
    KillMarkMedalWidth = 200;
    KillMarkMedalHeight = 158;
    fTotalEffectRunTime = 0.40;
    fEffectRunTime1 = 0.390;
    fEffectRunTime2 = 0.0;
    StartScale = 4.0;
    fScaleStepMultiplier = class'wMessage_Score'.default.ScaleStepMultiplier;
    fScaleStep = class'wMessage_Score'.default.ScaleStep;
    fRealDrawTime = LocalMessages[i].Lifetime - fTotalEffectRunTime;
    // End:0x111
    if(LocalMessages[i].StartTime > Level.TimeSeconds)
    {
        return;
    }
    Delta = LocalMessages[i].EndOfLife - Level.TimeSeconds;
    Delta = FClamp(Delta, 0.0, LocalMessages[i].Lifetime);
    fPassingTime = LocalMessages[i].Lifetime - Delta;
    // End:0x2dd
    if(fPassingTime <= fTotalEffectRunTime)
    {
        // End:0x197
        if(0 == MessageScoreEffect)
        {
            MessageScoreEffect = 1;
        }
        Delta2 = MessageScoreLastTime - Delta;
        // End:0x1d6
        if(Delta2 > 0.010)
        {
            MessageScoreLastTime = Delta;
            MessageScoreAccelStep += fScaleStep * fScaleStepMultiplier;
        }
        // End:0x2ce
        if(1 == MessageScoreEffect)
        {
            CurrentScale = StartScale * 1.0 - fPassingTime / fEffectRunTime1;
            CurrentScale = CurrentScale - MessageScoreAccelStep;
            CurrentScale = FClamp(CurrentScale, 0.990, StartScale);
            MessageScoreAlpha = int(float(100) * 1.0 - CurrentScale / StartScale);
            C.DrawColor = C.MakeColor(byte(255), 153, 0);
            C.DrawColor.A = byte(MessageScoreAlpha);
            // End:0x2ce
            if(CurrentScale < float(1))
            {
                CurrentScale = 1.0;
                MessageScoreAccelStep = 0.0;
                MessageScoreAlpha = 0;
                C.DrawColor.A = byte(255);
            }
        }
        // End:0x2da
        if(2 == MessageScoreEffect)
        {
        }
    }
    // End:0x38d
    else
    {
        MessageScoreEffect = 0;
        MessageScoreAccelStep = 0.0;
        CurrentScale = 1.0;
        fFadeOutTime = class'wMessage_Score'.default.fFadeOutTime;
        FadeValue = LocalMessages[i].EndOfLife - Level.TimeSeconds;
        FadeValue = FadeValue / fRealDrawTime - fFadeOutTime;
        C.DrawColor.A = byte(float(LocalMessages[i].DrawColor.A) * FClamp(FadeValue, 0.0, 1.0));
    }
    C.DrawColor.A = byte(Clamp(C.DrawColor.A, 1, 255));
    C.DrawColor = C.MakeColorNoEmpty(byte(255), byte(255), byte(255), C.DrawColor.A);
    switch(LocalMessages[i].StringMessage)
    {
        // End:0x45d
        case "FragGrenadeKill":
            DrawKillMarkEffect(C, WFragGrenadeKill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x4a8
        case "MeleeKill":
            DrawKillMarkEffect(C, WMeleeKill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x4f4
        case "StepOnKill":
            DrawKillMarkEffect(C, WStepOnKill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x544
        case "SpecialETCKill":
            DrawKillMarkEffect(C, WSpecialETCKill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x58e
        case "Helikill":
            DrawKillMarkEffect(C, WHelikill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x5dd
        case "Artillerykill":
            DrawKillMarkEffect(C, WArtillerykill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x627
        case "headshot":
            DrawKillMarkEffect(C, WHeadshot, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x675
        case "headshot_Aim":
            DrawKillMarkEffect(C, WHeadshotAim, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            // End:0x752
            break;
        // End:0x6b8
        case "NormalKill":
            DrawKillMarkEffect(C, WKill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            return;
        // End:0x6ff
        case "NormalKill_Aim":
            DrawKillMarkEffect(C, WKillAim, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            return;
        // End:0x74c
        case "WallShotKill":
            DrawKillMarkEffect(C, WWallShotKill, float(KillMarkMedalWidth), float(KillMarkMedalHeight), calW, MedalMarkPosX, MedalMarkPosY, CurrentScale);
            bNeedReturn = true;
            return;
        // End:0xffff
        default:
            // End:0x752 Break;
            break;
    }
    // End:0x7b7
    if(bNeedReturn)
    {
        // End:0x7b5
        if(!LocalMessages[i].PlaySound && PlayerOwner != none)
        {
            class'wMessage_Score'.static.PlaySoundMessageScore(PlayerOwner, LocalMessages[i].StringMessage);
            LocalMessages[i].PlaySound = true;
        }
        return;
    }
    // End:0x7da
    if(Level.GetIsTeenVersion() == false)
    {
        TempKillBlood = WKillBlood;
    }
    // End:0x7e5
    else
    {
        TempKillBlood = WKillBlood_Teen;
    }
    switch(LocalMessages[i].StringMessage)
    {
        // End:0x833
        case "2kill":
            DrawScoreEffect(C, WKillSuccession[0], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0x86f
        case "3kill":
            DrawScoreEffect(C, WKillSuccession[1], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0x8ac
        case "4kill":
            DrawScoreEffect(C, WKillSuccession[2], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0x8e9
        case "5kill":
            DrawScoreEffect(C, WKillSuccession[3], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0x926
        case "6kill":
            DrawScoreEffect(C, WKillSuccession[4], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0x963
        case "7kill":
            DrawScoreEffect(C, WKillSuccession[5], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0x9a0
        case "8kill":
            DrawScoreEffect(C, WKillSuccession[6], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0x9dd
        case "9kill":
            DrawScoreEffect(C, WKillSuccession[7], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xa1b
        case "10kill":
            DrawScoreEffect(C, WKillSuccession[8], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xa59
        case "11kill":
            DrawScoreEffect(C, WKillSuccession[9], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xa97
        case "12kill":
            DrawScoreEffect(C, WKillSuccession[10], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xad5
        case "13kill":
            DrawScoreEffect(C, WKillSuccession[11], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xb13
        case "14kill":
            DrawScoreEffect(C, WKillSuccession[12], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xb51
        case "15kill":
            DrawScoreEffect(C, WKillSuccession[13], float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xb63
        case "Storm Kill":
            // End:0xc6c
            break;
        // End:0xb9e
        case "Assist":
            DrawScoreEffect(C, WAssist, float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xbda
        case "Capture":
            DrawScoreEffect(C, WCapture, float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xc19
        case "BombSetted":
            DrawScoreEffect(C, WBombSetted, float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xc5a
        case "BombDiffused":
            DrawScoreEffect(C, WBombDiffused, float(KillWidth), float(KillHeight), calW, KillPosX, KillPosY);
            // End:0xc6c
            break;
        // End:0xc66
        case "Kill":
            // End:0xc6c
            break;
        // End:0xffff
        default:
            // End:0xc6c Break;
            break;
    }
    HudPart_DisplayEvent.DrawPlusPoint(C, class'wMessage_Score'.static.GetGainPoint(LocalMessages[i].Switch), int(ScorePosX), int(ScorePosY), C.DrawColor.A, MessageScoreEffect, CurrentScale);
    fPosY = class'wMessage_Score'.default.TextPosY;
    GetScreenCoords(PosX, fPosY, ScreenX, ScreenY, LocalMessages[i], C);
    C.SetPos(ScreenX, ScreenY);
    // End:0xd7d
    if(!LocalMessages[i].PlaySound && PlayerOwner != none)
    {
        class'wMessage_Score'.static.PlaySoundMessageScore(PlayerOwner, LocalMessages[i].StringMessage);
        LocalMessages[i].PlaySound = true;
    }
}

function bool DrawKillMarkEffect(Canvas C, SpriteWidget W, float fWidth, float fHeight, CalCoordsW calW, optional float PosX, optional float PosY, optional float fScale)
{
    W.OffsetX = int(float(int(float(W.OffsetX) + fWidth / float(2))) - fWidth / float(2) * fScale);
    fWidth *= fScale;
    fHeight *= fScale;
    CalculateCoordinateEx(C, W, fWidth, fHeight, calW);
    C.SetPos(calW.X1 + PosX, calW.Y1 + PosY);
    C.DrawTile(W.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawScoreEffect(Canvas C, SpriteWidget W, float fWidth, float fHeight, CalCoordsW calW, optional float PosX, optional float PosY)
{
    CalculateCoordinateEx(C, W, fWidth, fHeight, calW);
    C.SetPos(calW.X1 + PosX, calW.Y1 + PosY);
    C.DrawTile(W.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawWaringMark(Canvas C, float fWidth, float fHeight, float fCurLifeTime, float fMaxLifeTime)
{
    local CalCoordsW calW;

    fWarningDelta += Level.AppDeltaTime;
    // End:0x91
    if(fWarningDelta > 0.50)
    {
        // End:0x5f
        if(WWarningMark.TextureCoords.Y1 != 0)
        {
            WWarningMark.TextureCoords.Y1 = 0;
            WWarningMark.TextureCoords.Y2 = 169;
        }
        // End:0x86
        else
        {
            WWarningMark.TextureCoords.Y1 = 169;
            WWarningMark.TextureCoords.Y2 = 338;
        }
        fWarningDelta = 0.0;
    }
    CalculateCoordinateEx(C, WWarningMark, fWidth, fHeight, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WWarningMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

simulated function RecAAS(string sNotice, float DrawTime)
{
    local GameNotice tempGameNotice;

    // End:0x15
    if(aAASNotice.Length > 2)
    {
        aAASNotice.Length = 0;
    }
    tempGameNotice.sNotice = sNotice;
    tempGameNotice.fEndTime = Level.TimeSeconds + DrawTime;
    tempGameNotice.bSendConsole = false;
    aAASNotice.Length = aAASNotice.Length + 1;
    aAASNotice[aAASNotice.Length - 1] = tempGameNotice;
}

simulated function RecGameNotice(string sNotice)
{
    local GameNotice tempGameNotice;
    local int iLength;

    // End:0x26
    if(aGameNotice.Length > 20)
    {
        iLength = aGameNotice.Length;
        aGameNotice.Remove(6, iLength);
    }
    tempGameNotice.sNotice = sNotice;
    // End:0x6b
    if(aGameNotice.Length >= 1)
    {
        tempGameNotice.fStartTime = aGameNotice[aGameNotice.Length - 1].fEndTime + 0.030;
    }
    // End:0x84
    else
    {
        tempGameNotice.fStartTime = Level.TimeSeconds;
    }
    tempGameNotice.fEndTime = tempGameNotice.fStartTime + 10.0;
    tempGameNotice.bSendConsole = false;
    fNoticeOffset = Level.TimeSeconds;
    tempGameNotice.NoticeStartPosX = 1024;
    aGameNotice.Length = aGameNotice.Length + 1;
    aGameNotice[aGameNotice.Length - 1] = tempGameNotice;
}

simulated function PushGameNotice(string sNotice)
{
    // End:0x0f
    if(Len(sNotice) <= 0)
    {
        return;
    }
    RecGameNotice(sNotice);
}

simulated function PushAASNotice(string sNotice, float beginTime, byte byLevel)
{
    local float DeltaTime, DrawTime;

    // End:0x0f
    if(Len(sNotice) <= 0)
    {
        return;
    }
    DeltaTime = Level.TimeSeconds - beginTime;
    // End:0x68
    if(byLevel > 0)
    {
        DrawTime = 60.0 - DeltaTime;
        RecAAS(sNotice, FClamp(DrawTime, 0.0, 60.0));
    }
    // End:0x96
    else
    {
        DrawTime = 15.0 - DeltaTime;
        RecAAS(sNotice, FClamp(DrawTime, 0.0, 15.0));
    }
}

simulated function AllDeleteGameNotice()
{
    local int iLength;

    iLength = aGameNotice.Length;
    aGameNotice.Remove(0, iLength);
}

function DrawGameNotice(Canvas C)
{
    DrawSystemNotice(C);
}

function DrawSystemNotice(Canvas C)
{
    local Console Console;
    local float fDelta, CaptionW, CaptionHT;

    // End:0x0d
    if(PlayerOwner == none)
    {
        return;
    }
    // End:0x1b
    if(aGameNotice.Length <= 0)
    {
        return;
    }
    fDelta = Level.TimeSeconds - fNoticeOffset * float(100);
    aGameNotice[0].NoticeStartPosX -= int(fDelta);
    HudPart_DisplayEvent.DrawMoveGameNotice(C, aGameNotice[0].sNotice, float(aGameNotice[0].NoticeStartPosX));
    // End:0x115
    if(PlayerOwner.Player != none)
    {
        Console = PlayerOwner.Player.Console;
        // End:0x115
        if(Console != none && !aGameNotice[0].bSendConsole)
        {
            aGameNotice[0].bSendConsole = true;
            Console.AddMessageItem(Console.ConstructMessageItem("" $ lsMessageNotice $ aGameNotice[0].sNotice, 6));
        }
    }
    fNoticeOffset = Level.TimeSeconds;
    C.BtrTextSize(GetNoticeFirst(), int(float(18) * _reY), CaptionW, CaptionHT);
    // End:0x177
    if(float(aGameNotice[0].NoticeStartPosX) < -CaptionW)
    {
        aGameNotice.Remove(0, 1);
    }
}

function string GetNoticeFirst()
{
    // End:0x19
    if(aGameNotice.Length > 0)
    {
        return aGameNotice[0].sNotice;
    }
    return "";
}

function DrawAASNotice(Canvas C)
{
    // End:0x0d
    if(PlayerOwner == none)
    {
        return;
    }
    // End:0x1b
    if(aAASNotice.Length <= 0)
    {
        return;
    }
    HudPart_DisplayEvent.DrawAAS(C, aAASNotice[0].sNotice);
    // End:0x62
    if(aAASNotice[0].fEndTime < Level.TimeSeconds)
    {
        aAASNotice.Remove(0, 1);
    }
}

function ChangeWeaponSlot6Hud(wWeapon newWeapon)
{
    // End:0xa1
    if(newWeapon != none && newWeapon.InventoryGroup == 6)
    {
        // End:0x50
        if(newWeapon.WeaponType == 14)
        {
            SkillSlot6.WidgetTexture = matSkillAirStrike;
        }
        // End:0x8c
        else
        {
            // End:0x7c
            if(newWeapon.WeaponType == 15)
            {
                SkillSlot6.WidgetTexture = matSkillHelicopter;
            }
            // End:0x8c
            else
            {
                SkillSlot6.WidgetTexture = matSkillUAV;
            }
        }
        HudPart_DisplayMain.UpdateHelpKey_Slot(6, true);
    }
    // End:0xc3
    else
    {
        SkillSlot6.WidgetTexture = matEmptySkillSlot;
        HudPart_DisplayMain.UpdateHelpKey_Slot(6, false);
    }
}

function DisalbeWeaponSlot6Hud()
{
    SkillSlot6.WidgetTexture = matEmptySkillSlot;
    HudPart_DisplayMain.UpdateHelpKey_Slot(6, false);
}

function ChangeWeaponSlot5Hud(wWeapon newWeapon, optional bool bAddSkill)
{
    local int nWeaponID;

    // End:0x63
    if(newWeapon == none || newWeapon.InventoryGroup != 5)
    {
        // End:0x36
        if(Vehicle(PawnOwner) != none)
        {
            return;
        }
        newWeapon = PlayerOwner.GetWeaponByInventoryGroup(5);
        // End:0x60
        if(newWeapon == none)
        {
            DisalbeWeaponSlot5Hud();
            return;
        }
    }
    // End:0x85
    else
    {
        // End:0x85
        if(bAddSkill == true)
        {
            // End:0x85
            if(SkillSlot5.WidgetTexture != matEmptySkillSlot)
            {
                return;
            }
        }
    }
    // End:0xc9
    if(newWeapon.IsCanUseWeapon() == false)
    {
        newWeapon = PlayerOwner.GetWeaponByInventoryGroup(5, newWeapon);
        // End:0xc9
        if(newWeapon == none)
        {
            DisalbeWeaponSlot5Hud();
            return;
        }
    }
    nWeaponID = newWeapon.BaseParams.iWeaponID;
    EnableWeaponSlot5Hud(nWeaponID);
}

function EnableWeaponSlot5Hud(int nWeaponID)
{
    // End:0x22
    if(nWeaponID == 5001)
    {
        SkillSlot5.WidgetTexture = matSkillRPG;
    }
    // End:0x5a
    else
    {
        // End:0x44
        if(nWeaponID == 5003)
        {
            SkillSlot5.WidgetTexture = matSkillM2B;
        }
        // End:0x5a
        else
        {
            SkillSlot5.WidgetTexture = GetSkillIconByWeaponID(nWeaponID);
        }
    }
    HudPart_DisplayMain.UpdateHelpKey_Slot(5, true);
}

function DisalbeWeaponSlot5Hud()
{
    SkillSlot5.WidgetTexture = matEmptySkillSlot;
    HudPart_DisplayMain.UpdateHelpKey_Slot(5, false);
}

defaultproperties
{
    UAVLastBeginScanLevelSeconds=-999.0
    UAVOneScanTime=3.0
    UAVOneScanMin=-0.30
    UAVOneScanMax=1.30
    UAVScanOffset=65
    UAVIconPosXAlly=316.0
    UAVIconPosYAlly=16.0
    UAVIconPosXEnemy=316.0
    UAVIconPosYEnemy=90.0
    UAVIconWidth=64.0
    UAVIconHeight=64.0
    UAVIconTextPosXAlly=337.0
    UAVIconTextPosYAlly=27.0
    UAVIconTextPosXEnemy=337.0
    UAVIconTextPosYEnemy=102.0
    UAVIconTextOffsetX=12.0
    UAVIconTextXL=10.0
    UAVIconTextYL=13.0
    UAVIconColor=(R=255,G=255,B=255,A=255)
    WDigitsSmall=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',TextureCoords=(X1=153,Y1=43,X2=169,Y2=64),TextureCoords[1]=(X1=0,Y1=43,X2=16,Y2=64),TextureCoords[2]=(X1=17,Y1=43,X2=33,Y2=64),TextureCoords[3]=(X1=34,Y1=43,X2=50,Y2=64),TextureCoords[4]=(X1=51,Y1=43,X2=67,Y2=64),TextureCoords[5]=(X1=68,Y1=43,X2=84,Y2=64),TextureCoords[6]=(X1=85,Y1=43,X2=101,Y2=64),TextureCoords[7]=(X1=102,Y1=43,X2=118,Y2=64),TextureCoords[8]=(X1=119,Y1=43,X2=135,Y2=64),TextureCoords[9]=(X1=136,Y1=43,X2=152,Y2=64),TextureCoords[10]=(X1=177,Y1=43,X2=188,Y2=64))
    WDigitsMid=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',TextureCoords=(X1=297,Y1=0,X2=329,Y2=42),TextureCoords[1]=(X1=0,Y1=0,X2=32,Y2=42),TextureCoords[2]=(X1=33,Y1=0,X2=65,Y2=42),TextureCoords[3]=(X1=66,Y1=0,X2=98,Y2=42),TextureCoords[4]=(X1=99,Y1=0,X2=131,Y2=42),TextureCoords[5]=(X1=132,Y1=0,X2=164,Y2=42),TextureCoords[6]=(X1=165,Y1=0,X2=197,Y2=42),TextureCoords[7]=(X1=198,Y1=0,X2=230,Y2=42),TextureCoords[8]=(X1=231,Y1=0,X2=263,Y2=42),TextureCoords[9]=(X1=264,Y1=0,X2=296,Y2=42),TextureCoords[10]=(X1=368,Y1=0,X2=400,Y2=42))
    WDigitsTime=(DigitTexture=Texture'Warfare_UI.HUD.NumberTime',TextureCoords=(X1=132,Y1=0,X2=147,Y2=21),TextureCoords[1]=(X1=0,Y1=0,X2=6,Y2=21),TextureCoords[2]=(X1=7,Y1=0,X2=18,Y2=21),TextureCoords[3]=(X1=19,Y1=0,X2=38,Y2=21),TextureCoords[4]=(X1=39,Y1=0,X2=54,Y2=21),TextureCoords[5]=(X1=55,Y1=0,X2=70,Y2=21),TextureCoords[6]=(X1=71,Y1=0,X2=87,Y2=21),TextureCoords[7]=(X1=88,Y1=0,X2=100,Y2=21),TextureCoords[8]=(X1=101,Y1=0,X2=116,Y2=21),TextureCoords[9]=(X1=117,Y1=0,X2=131,Y2=21),TextureCoords[10]=(X1=148,Y1=0,X2=159,Y2=21))
    WDigitsTimeRedAlert=(DigitTexture=FinalBlend'Warfare_UI.HUD.NumberTime_RedAlert_fb',TextureCoords=(X1=132,Y1=0,X2=147,Y2=21),TextureCoords[1]=(X1=0,Y1=0,X2=6,Y2=21),TextureCoords[2]=(X1=7,Y1=0,X2=18,Y2=21),TextureCoords[3]=(X1=19,Y1=0,X2=38,Y2=21),TextureCoords[4]=(X1=39,Y1=0,X2=54,Y2=21),TextureCoords[5]=(X1=55,Y1=0,X2=70,Y2=21),TextureCoords[6]=(X1=71,Y1=0,X2=87,Y2=21),TextureCoords[7]=(X1=88,Y1=0,X2=100,Y2=21),TextureCoords[8]=(X1=101,Y1=0,X2=116,Y2=21),TextureCoords[9]=(X1=117,Y1=0,X2=131,Y2=21),TextureCoords[10]=(X1=148,Y1=0,X2=159,Y2=21))
    ScoreBgLine=(WidgetTexture=Texture'Warfare_UI.HUD.ScoreBgLine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=442,Y2=46),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=5,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ScoreBg=(WidgetTexture=Texture'Warfare_UI.HUD.ScoreBg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=442,Y2=31),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=6,OffsetY=6,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ScoreBGMine=(WidgetTexture=Texture'Warfare_UI.HUD.ScoreBGMine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=145,Y2=27),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=-1,OffsetY=25,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ScoreBGMyLine=(WidgetTexture=Texture'Warfare_UI.HUD.ScoreBGMyLine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=149,Y2=28),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=-1,OffsetY=23,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DetectedBomb=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_indig_grenade',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=128),TextureScale=0.370,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DetectedBombDrawDistance=1300.0
    DigitsScoreL=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=0,PosX=0.50,PosY=0.0,OffsetX=-174,OffsetY=10,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsScoreR=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=2,PosX=0.50,PosY=0.0,OffsetX=174,OffsetY=10,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsScoreU=(RenderStyle=5,MinDigitCount=0,TextureScale=0.3250,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=16,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsScoreD=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=25,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    outArrow=TexRotator'Warfare_GP_UI_HUD_ETC.DisplayIcon.outArrow_rot_2'
    OutArrowSize=256.0
    fRendNavExtraFactor=120.0
    fRendVisCountFactor=80.0
    fRendViscountBoxSize=5.0
    fInfluenceBoxSize=30.0
    fRendCoverAngleSize=100.0
    fSDFrontLineSize=70.0
    RainbowColors=// Object reference not set to an instance of an object.
    
    DangerColors=// Object reference not set to an instance of an object.
    
    RedBlueColors=// Object reference not set to an instance of an object.
    
    color_Shadow=(R=0,G=0,B=0,A=200)
    bShowTimer1=true
    WTimerBG=(WidgetTexture=Texture'Warfare_UI.HUD.TimerBG',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=145,Y2=27),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=56,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteTimerHalf=(WidgetTexture=Texture'Warfare_UI.HUD.NumberTime',RenderStyle=5,TextureCoords=(X1=147,Y1=7,X2=156,Y2=21),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=65,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteTimerHalf_RedAlert=(WidgetTexture=FinalBlend'Warfare_UI.HUD.NumberTime_RedAlert_fb',RenderStyle=5,TextureCoords=(X1=147,Y1=7,X2=156,Y2=21),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=65,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsTimerMin=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=2,PosX=0.50,PosY=0.0,OffsetX=-7,OffsetY=61,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTimerSec=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=0,PosX=0.50,PosY=0.0,OffsetX=7,OffsetY=61,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    SpriteTimerHalf2=(WidgetTexture=Texture'Warfare_UI.HUD.NumberTime',RenderStyle=5,TextureCoords=(X1=147,Y1=7,X2=156,Y2=21),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=33,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SpriteTimerHalf2_RedAlert=(WidgetTexture=FinalBlend'Warfare_UI.HUD.NumberTime_RedAlert_fb',RenderStyle=5,TextureCoords=(X1=147,Y1=7,X2=156,Y2=21),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.0,OffsetX=0,OffsetY=33,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsTimerMin2=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=2,PosX=0.50,PosY=0.0,OffsetX=-7,OffsetY=29,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTimerSec2=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=0,PosX=0.50,PosY=0.0,OffsetX=7,OffsetY=29,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    NetInterval=3.0
    LevelActionFontColor=(R=255,G=255,B=255,A=255)
    LevelActionPositionX=0.50
    LevelActionPositionY=0.250
    DigitsHealth=(RenderStyle=5,MinDigitCount=0,TextureScale=0.490,DrawPivot=3,PosX=0.0,PosY=1.0,OffsetX=174,OffsetY=-29,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsVehicleHealth=(RenderStyle=5,MinDigitCount=0,TextureScale=0.490,DrawPivot=3,PosX=0.1390,PosY=1.0,OffsetX=174,OffsetY=-29,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTotalAmmo=(RenderStyle=5,MinDigitCount=0,TextureScale=0.450,DrawPivot=6,PosX=0.954620,PosY=0.995830,OffsetX=0,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsMagazineAmmo=(RenderStyle=5,MinDigitCount=0,TextureScale=0.370,DrawPivot=4,PosX=0.9490,PosY=0.995830,OffsetX=0,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsMagazineAmmoShortage=(RenderStyle=5,MinDigitCount=0,TextureScale=0.370,DrawPivot=4,PosX=0.9490,PosY=0.995830,OffsetX=0,OffsetY=0,Tints=(R=255,G=0,B=0,A=255),Tints[1]=(R=255,G=0,B=0,A=255),bPadWithZeroes=0)
    DigitsShield=(RenderStyle=5,MinDigitCount=0,TextureScale=0.490,DrawPivot=3,PosX=0.0,PosY=1.0,OffsetX=174,OffsetY=-83,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsSprint=(RenderStyle=5,MinDigitCount=0,TextureScale=0.490,DrawPivot=3,PosX=0.0,PosY=1.0,OffsetX=174,OffsetY=-69,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    HpBarBackground=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_hp_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=16,Y2=16),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=1174,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    HpBar=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_hp',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=167,Y2=20),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=1174,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    DamageBar=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_hp_mn',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=167,Y2=20),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=1174,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    RecoveryBar=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_hp_pl',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=167,Y2=20),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=1174,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    StaminaBarBackground=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_sp_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=212,Y2=13),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=41,OffsetY=1174,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    StaminaBar=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_sp',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=209,Y2=9),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=42,OffsetY=1175,ScaleMode=4,Scale=1.0,Tints=(R=112,G=157,B=211,A=255),Tints[1]=(R=112,G=157,B=255,A=211))
    StaminaBarWarn=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_sp_use',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=209,Y2=9),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=42,OffsetY=1175,ScaleMode=4,Scale=1.0,Tints=(R=112,G=157,B=211,A=255),Tints[1]=(R=112,G=157,B=255,A=211))
    HPIcon=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hp_icon',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=29,Y2=20),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=55,OffsetY=1167,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    HpGauBlink=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_hpblink',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=167,Y2=20),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=1174,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    fHPDelayTime=0.50
    fHPDisplayRatio=1.0
    WDigitsHP=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',TextureCoords=(X1=297,Y1=0,X2=328,Y2=42),TextureCoords[1]=(X1=0,Y1=0,X2=31,Y2=42),TextureCoords[2]=(X1=33,Y1=0,X2=64,Y2=42),TextureCoords[3]=(X1=66,Y1=0,X2=97,Y2=42),TextureCoords[4]=(X1=99,Y1=0,X2=130,Y2=42),TextureCoords[5]=(X1=132,Y1=0,X2=163,Y2=42),TextureCoords[6]=(X1=165,Y1=0,X2=196,Y2=42),TextureCoords[7]=(X1=198,Y1=0,X2=229,Y2=42),TextureCoords[8]=(X1=231,Y1=0,X2=262,Y2=42),TextureCoords[9]=(X1=264,Y1=0,X2=295,Y2=42),TextureCoords[10]=(X1=330,Y1=0,X2=361,Y2=42))
    HPCount=(RenderStyle=5,MinDigitCount=0,TextureScale=0.50,DrawPivot=2,PosX=1.0,PosY=0.0,OffsetX=-1280,OffsetY=1065,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    SPIcon=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.st_icon',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=21,Y2=17),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=17,OffsetY=1171,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    PostureStand=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_status',RenderStyle=5,TextureCoords=(X1=84,Y1=0,X2=126,Y2=42),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=13,OffsetY=1143,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    PostureCrouch=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_status',RenderStyle=5,TextureCoords=(X1=42,Y1=0,X2=84,Y2=42),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=13,OffsetY=1143,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    PostureDown=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_status',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=42,Y2=42),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=13,OffsetY=1143,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    PostureRun=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_status1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=42,Y2=42),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=13,OffsetY=1143,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    AmmoSet100=(DigitTexture=Texture'Warfare_UI.HUD.ammo_100',TextureCoords=(X1=0,Y1=0,X2=8,Y2=1),TextureCoords[1]=(X1=0,Y1=0,X2=8,Y2=1),TextureCoords[2]=(X1=16,Y1=0,X2=24,Y2=1),TextureCoords[3]=(X1=32,Y1=0,X2=40,Y2=1),TextureCoords[4]=(X1=156,Y1=0,X2=194,Y2=1),TextureCoords[5]=(X1=195,Y1=0,X2=233,Y2=1),TextureCoords[6]=(X1=234,Y1=0,X2=272,Y2=1),TextureCoords[7]=(X1=273,Y1=0,X2=311,Y2=1),TextureCoords[8]=(X1=312,Y1=0,X2=350,Y2=1),TextureCoords[9]=(X1=351,Y1=0,X2=19,Y2=1),TextureCoords[10]=(X1=390,Y1=0,X2=428,Y2=1))
    Ammo100=(RenderStyle=5,MinDigitCount=0,TextureScale=0.650,DrawPivot=4,PosX=1.0,PosY=1.0,OffsetX=-70,OffsetY=-10,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    Ammo100_LineOffset=3
    Ammo100_DigitOffset=9
    AmmoSet50=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.ammo_50_set',TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureCoords[1]=(X1=7,Y1=0,X2=12,Y2=25),TextureCoords[2]=(X1=0,Y1=0,X2=5,Y2=25),TextureCoords[3]=(X1=14,Y1=0,X2=19,Y2=25),X2=1594,Y2=1152,XL=5,YL=25,ExtraOffsetX=0)
    AmmoSetSniper=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.ammo_sr_set',TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureCoords[1]=(X1=11,Y1=0,X2=20,Y2=31),TextureCoords[2]=(X1=0,Y1=0,X2=9,Y2=31),TextureCoords[3]=(X1=22,Y1=0,X2=31,Y2=31),X2=1585,Y2=1155,XL=9,YL=31,ExtraOffsetX=4)
    AmmoSetShotgun=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.ammo_shotgun_set',TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureCoords[1]=(X1=14,Y1=0,X2=26,Y2=26),TextureCoords[2]=(X1=0,Y1=0,X2=12,Y2=26),TextureCoords[3]=(X1=28,Y1=0,X2=40,Y2=26),X2=1585,Y2=1153,XL=12,YL=26,ExtraOffsetX=2)
    AmmoSetRPG=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.ammo_rpg7_set',TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureCoords[1]=(X1=169,Y1=0,X2=336,Y2=20),TextureCoords[2]=(X1=0,Y1=0,X2=167,Y2=20),TextureCoords[3]=(X1=338,Y1=0,X2=505,Y2=20),X2=1585,Y2=1149,XL=167,YL=20,ExtraOffsetX=4)
    AmmoSetATR=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.ammo_atr_set',TextureCoords=(X1=0,Y1=0,X2=0,Y2=0),TextureCoords[1]=(X1=91,Y1=0,X2=180,Y2=18),TextureCoords[2]=(X1=0,Y1=0,X2=89,Y2=18),TextureCoords[3]=(X1=182,Y1=0,X2=271,Y2=18),X2=1584,Y2=1148,XL=89,YL=18,ExtraOffsetX=2)
    fbSpectateClanMark=(X1=544.0,Y1=1148.0,X2=589.0,Y2=1193.0)
    matDefaultClanMark=Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark'
    AmmoFlameThrowerCan=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.frame_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=224,Y2=41),TextureScale=0.3950,DrawPivot=4,PosX=0.9906250,PosY=0.9630,OffsetX=0,OffsetY=0,ScaleMode=0,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    AmmoFlameThrowerBar=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.frame_fuel',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=201,Y2=27),TextureScale=0.3950,DrawPivot=4,PosX=0.988750,PosY=0.960830,OffsetX=0,OffsetY=0,ScaleMode=0,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    AmmoSeparator=(WidgetTexture=Texture'Warfare_UI.HUD.FlatLine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=162,Y2=2),TextureScale=0.650,DrawPivot=3,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    GaugeOverHeat=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gau_mg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=5),TextureScale=0.370,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=1400,OffsetY=1127,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    TeamDeathSprite=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.our_sol_death',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.650,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    TeamDeath_HeightOffset=115.0
    TeamDeath_MinScale=0.20
    TeamDeath_MaxScale=0.70
    TeamDeath_MinDist=50.0
    TeamDeath_MaxDist=3000.0
    WBGKillMessage=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=328,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DamageIndicationMaterial=TexRotator'FX_TEX.Damage.Damage_Large_Rot'
    MaxDamageIndicationCount=5
    DamageIndicationDuration=2.50
    DamageIndicationMaterial_UOffset=256.0
    DamageIndicationMaterial_VOffset=256.0
    ShowHealthInDanager_Duration=7.0
    ShowHealthInDanager_Material=Texture'FX_TEX.Damage.damage_big'
    ShowHealthInDanger_BlinkInterval=0.550
    ShowHealthInDanger_BlinkMaxAlpha=256.0
    ShowHealthInDanger_BlinkMinAlpha=64.0
    ShowFallDamage_Duration=10.0
    ShowFallDamage_BlinkInterval=5.0
    KillMessageHelicopterName="Chopper"
    SelfKillMessage_Killed=" was killed."
    SelfKillMessage_KilledBy=" killed you."
    SuicideMessage="Suicide"
    SelfKillColor=(R=254,G=1,B=3,A=255)
    SelfKilledByColor=(R=255,G=255,B=255,A=255)
    Crosshair_Left=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.Crosshairs.bagic_left',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=3),TextureScale=0.650,DrawPivot=3,PosX=0.5040,PosY=0.50,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Crosshair_Right=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.Crosshairs.bagic_right',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=3),TextureScale=0.650,DrawPivot=7,PosX=0.4960,PosY=0.50,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Crosshair_Up=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.Crosshairs.bagic_up',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=3,Y2=15),TextureScale=0.650,DrawPivot=5,PosX=0.50,PosY=0.5050,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Crosshair_Down=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.Crosshairs.bagic_down',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=3,Y2=15),TextureScale=0.650,DrawPivot=1,PosX=0.50,PosY=0.4950,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Crosshair_MG=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.Crosshairs.ch_mg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.650,DrawPivot=8,PosX=0.50,PosY=0.50,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    Crosshair_DamageDealt=(WidgetTexture=TexOscillator'Warfare_GP_UI_HUD_ETC.Crosshairs.cross_hair_osc',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.650,DrawPivot=8,PosX=0.50,PosY=0.50,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    CrossHair_DamageDealtDrawTime=0.350
    ProgressStatusBG=(WidgetTexture=Texture'Warfare_UI.HUD.action_gauge_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=202,Y2=31),TextureScale=0.650,DrawPivot=0,PosX=0.50,PosY=0.70,OffsetX=-101,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ProgressStatusBar=(WidgetTexture=FinalBlend'Warfare_UI.HUD.action_guage_2_fb',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=198,Y2=14),TextureScale=0.650,DrawPivot=0,PosX=0.50,PosY=0.70,OffsetX=-99,OffsetY=8,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillSlot5=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_empty',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=282,OffsetY=1123,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillSlot6=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_empty',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=352,OffsetY=1123,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    matEmptySkillSlot=Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_empty'
    matSkillHelicopter=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_heli_1'
    matSkillAirStrike=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_bomb_1'
    matSkillUAV=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_uav_1'
    matSkillRPG=Texture'Warfare_UI_Item.SupplySkillicon.icon_wea_AT4'
    matSkillM2B=Texture'Warfare_UI_Item.SupplySkillicon.icon_wea_M2B'
    matSkillBlink=Texture'Warfare_UI_Item.SupplySkillicon.icon_tech_blink'
    fBlinkDelayTime=0.250
    VisibleDistance=20.0
    PlaceMark=(WidgetTexture=TexOscillator'Warfare_GP_UI_HUD.Common.img_spwp_posi_osc',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=54,Y2=32),TextureScale=0.370,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=10,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    lsPlaceM2B="Flamethrower"
    lsPlaceMG3="Machine Gun"
    lsPlaceRPG7="AT-4"
    lsPlaceATR="AT-4"
    lsPlaceHealthPack="Health Pack"
    lsPlaceHeliPack="Chopper Pack"
    lsPlaceArtilleryPack="Air Strike Pack"
    lsPlaceUAVPack="UAV Pack"
    lsMessageNotice="[Notice]:"
    lsPlaceAmmoSupply="Ammo Box"
    SpecialPositions_Class=// Object reference not set to an instance of an object.
    
    SpecialPositions_OffsetZ=// Object reference not set to an instance of an object.
    
    SuppliesPositions_Class=// Object reference not set to an instance of an object.
    
    SuppliesPositions_OffsetZ=// Object reference not set to an instance of an object.
    
    ObjectSpriteEdgeColorModulate=(X=0.0,Y=822486200000.0,Z=0.0,W=0.0)
    bDrawTimer=true
    bShowMissingWeaponInfo=true
    FadeTime=0.30
    CountDownName=Warfare_Sound_ATS.com.ats_com_time_countdown
    LongCountName[0]=5_minute_warning
    LongCountName[1]=3_minutes_remain
    LongCountName[2]=2_minutes_remain
    LongCountName[3]=1_minute_remains
    LongCountName[4]=30_seconds_remain
    LongCountName[5]=20_seconds
    HudColorRed=(R=200,G=0,B=0,A=255)
    HudColorBlue=(R=50,G=64,B=200,A=255)
    HudColorBlack=(R=0,G=0,B=0,A=255)
    HudColorHighLight=(R=255,G=160,B=0,A=255)
    HudColorNormal=(R=255,G=255,B=255,A=255)
    HudColorTeam[0]=(R=200,G=0,B=0,A=255)
    HudColorTeam[1]=(R=50,G=64,B=200,A=255)
    fSpread_Constant=500.0
    ch_up_x=510.0
    ch_up_y=356.0
    ch_down_x=510.0
    ch_down_y=404.0
    ch_left_x=484.0
    ch_left_y=382.0
    ch_right_x=534.0
    ch_right_y=382.0
    ch_up_width=8.0
    ch_up_height=16.0
    ch_down_width=8.0
    ch_down_height=16.0
    ch_left_width=16.0
    ch_left_height=8.0
    ch_right_width=16.0
    ch_right_height=8.0
    PrevSprintVal=40
    DrawChangeHostDuration=7.0
    MessageChangingHost="Changing Host: "
    MessageChangingHostPre="New Host"
    MessageChangingHostPost=" is the new host."
    ShowTime_NameTag_EnemyWhoKillMe=4.0
    WKill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=400,Y1=158,X2=600,Y2=316),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillAim=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=600,Y1=158,X2=800,Y2=316),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAssist=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=274,Y2=72),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=200,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHelikill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=0,Y1=158,X2=200,Y2=316),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WArtillerykill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=800,Y1=0,X2=1000,Y2=158),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WCapture=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=0,X2=548,Y2=72),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=200,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBombSetted=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=288,X2=274,Y2=360),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=200,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBombDiffused=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=0,X2=822,Y2=72),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=200,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFragGrenadeKill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=400,Y1=0,X2=600,Y2=158),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WMeleeKill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=200,Y1=0,X2=400,Y2=158),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WStepOnKill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=600,Y1=0,X2=800,Y2=158),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WSpecialETCKill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=200,Y1=158,X2=400,Y2=316),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=288,X2=548,Y2=360),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=288,X2=822,Y2=360),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=360,X2=274,Y2=432),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=360,X2=548,Y2=432),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=360,X2=822,Y2=432),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=432,X2=274,Y2=504),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=432,X2=548,Y2=504),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=432,X2=822,Y2=504),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=504,X2=274,Y2=576),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=504,X2=548,Y2=576),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[10]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=504,X2=822,Y2=576),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[11]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=576,X2=274,Y2=648),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[12]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=576,X2=548,Y2=648),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillSuccession[13]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=576,X2=822,Y2=648),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=790,OffsetY=252,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHeadshot=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=200,Y2=158),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHeadshotAim=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=800,Y1=158,X2=1000,Y2=316),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWallShotKill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_markmedal',RenderStyle=5,TextureCoords=(X1=0,Y1=316,X2=200,Y2=474),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=103,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillBlood=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_blood01',RenderStyle=5,TextureCoords=(X1=67,Y1=111,X2=453,Y2=421),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=606,OffsetY=186,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillBlood_Teen=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_blood01_T',RenderStyle=5,TextureCoords=(X1=67,Y1=111,X2=453,Y2=421),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=606,OffsetY=186,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWarningMark=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_bombing_warningmark',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=450,Y2=169),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=575,OffsetY=280,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStrikeMark=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.bombing_location',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.50,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=-53,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    NameTagInvulnerablePost="(Invincible)"
    ConsoleMessagePosX=0.0050
    ConsoleMessagePosY=0.870
}