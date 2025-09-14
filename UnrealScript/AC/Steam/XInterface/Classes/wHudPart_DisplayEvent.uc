/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_DisplayEvent.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Enums:3
 *	Properties:254
 *	Functions:91
 *
 *******************************************************************************/
class wHudPart_DisplayEvent extends wHudPart_DisplayBase
    dependson(wHudPart_DisplayBase)
    transient;

const DefaultDFBotGrade = 901;

enum SKILL_ARRAY
{
    SKILL_ARRAY_C4,
    SKILL_ARRAY_RPG7,
    SKILL_ARRAY_HELICOPTER,
    SKILL_ARRAY_AIRSTIRKE,
    SKILL_ARRAY_UAV,
    SKILL_ARRAY_HELICOPTER_REQUIRE,
    SKILL_ARRAY_AIRSTIRKE_REQUIRE,
    SKILL_ARRAY_UAV_REQUIRE,
    SKILL_ARRAY_HellFire,
    SKILL_ARRAY_HellFire_Require,
    SKILL_ARRAY_PinpointFire,
    SKILL_ARRAY_PinpointFire_Require,
    SKILL_ARRAY_Incen,
    SKILL_ARRAY_Incen_Require,
    SKILL_ARRAY_SpiltGrenade,
    SKILL_ARRAY_SpiltGrenade_Require,
    SKILL_ARRAY_NONE
};

enum ESD_STATE
{
    SET_ENABLE,
    SET_DOING,
    SET_DONE,
    DIFFUSE_ENABLE,
    DIFFUSE_DOING,
    DIFFUSE_DONE
};

enum eDrawMessageState
{
    DM_None,
    DM_Waiting,
    DM_GameMode,
    DM_Go,
    DM_HostChange,
    DM_End
};

var() SpriteWidget wHealthPack;
var() SpriteWidget WHealthPackPlus;
var() DigitSet WDigitsHP;
var() DigitSet WDigitsNumberBroadBig;
var() DigitSet WDigitsNumberBig;
var() DigitSet WDigitsNumberMid;
var() DigitSet WDigitsNumberMid_Base;
var() DigitSet WDigitsNumberSml;
var() DigitSet WDigitsDFRoundNumber;
var() NumericWidget DigitsNumberFirst;
var() NumericWidget DigitsNumberSecond;
var() NumericWidget DigitsNumberPlus;
var() int FontSizeNormal;
var() int FontSizeKey;
var() int FontSizeRespawn;
var() SpriteWidget SkillIconEvent;
var() SpriteWidget WHelpBG;
var() SpriteWidget wSkill;
var() SpriteWidget wHelicopter;
var() SpriteWidget WAirStirke;
var() SpriteWidget WUAV;
var() SpriteWidget WC4;
var() SpriteWidget WRPG7;
var() SpriteWidget WReadyIncen;
var() SpriteWidget WReadyHellFire;
var() SpriteWidget WReadySpiltGrenade;
var() SpriteWidget WReadyPinpointFire;
var() SpriteWidget WNotReadyIncen;
var() SpriteWidget WNotReadyHellFire;
var() SpriteWidget WNotReadySpiltGrenade;
var() SpriteWidget WNotReadyPinpointFire;
var() SpriteWidget WAirStirkeIcon;
var() SpriteWidget WHelicopterIcon;
var() SpriteWidget WUAVIcon;
var() SpriteWidget SkillHelicopterOn;
var() SpriteWidget SkillAirstrikeOn;
var() SpriteWidget SkillUAVOn;
var() SpriteWidget SkillC4On;
var() SpriteWidget SkillRPG7On;
var() SpriteWidget WC4NotReady;
var() SpriteWidget WAirStirkeNotReady;
var() SpriteWidget WHelicopterNotReady;
var() SpriteWidget WUAVNotReady;
var() SpriteWidget WRPG7NotReady;
var() SpriteWidget WAirStirkeRequireFaild;
var() SpriteWidget WHelicopterRequireFaild;
var() SpriteWidget WUAVRequireFaild;
var() SpriteWidget WAirStirkeFocus;
var() SpriteWidget WAirStirkeSellect;
var wHudPart_DisplayEvent.SKILL_ARRAY ECallSkillState;
var bool bResultSkillRequire;
var float fLastCallTime;
var float fC4ActiveTime;
var bool bC4Active;
var float fBeginDrawTime_RPG7;
var bool bRPG7Active;
var float fBeginRespawnPosY;
var float fEndRespawnPosY;
var() float fDrawTime;
var() float fDrawTimeSkill;
var() float fDrawTimeEffect;
var() float fFadeOutEffect;
var() float fFadeOutTime;
var() float fDrawTimeHealth;
var() float fFadeOutTimeHealth;
var() float fDistMove;
var() SpriteWidget WGameMessageWaiting;
var() SpriteWidget WGameWaitSpot;
var string sWaitingMessage;
var float fReceiveTime_StartupMessage;
var bool IsStartupMessage;
var() SpriteWidget WConnectionInstability;
var() SpriteWidget WBGStart;
var() SpriteWidget WBGStartDF;
var() SpriteWidget WGameTypeTD;
var() SpriteWidget WGameTypeSD;
var() SpriteWidget WGameTypeDOA;
var() SpriteWidget WGameTypeDOMI;
var() SpriteWidget WGameTypeSB;
var() SpriteWidget WGameTypeDM;
var() SpriteWidget WGameTypeFM;
var() SpriteWidget WGameTypeTM;
var() SpriteWidget WGameChangeAttack;
var() SpriteWidget WGameChangePosition;
var() SpriteWidget WGo;
var() SpriteWidget WGoBG;
var() SpriteWidget WGoEffect;
var() SpriteWidget WGoText;
var float MessageLastTime;
var float MessageAccelStep;
var int MessageEffect;
var int MessageAlpha;
var localized string strQuestNoUpdate;
var localized string BeginMessageTD;
var localized string BeginMessageSDA1;
var localized string BeginMessageSDA2;
var localized string BeginMessageSDD1;
var localized string BeginMessageSDD2;
var localized string BeginMessageDOMI;
var localized string BeginMessageSB;
var localized string BeginMessageDM;
var localized string BeginMessageFM;
var localized string BeginMessageTM;
var localized string BeginMessageDF;
var localized string LsReload;
var localized string LsWarningAmmo;
var localized string LsBattleExplain;
var localized string LsConnectionInstability;
var localized string lsIsInvincible;
var localized string lsIsInvincibleBeginner;
var localized string safeZoneRandomRespawn;
var localized string RespawnText;
var localized string MessageChangingHostPre;
var localized string MessageChangingHost;
var localized string MessageChangingHostPlzWait;
var wHudPart_DisplayEvent.eDrawMessageState DMState;
var float fMessageDrawTime;
var float fBeginMessageTime;
var float fBeginMessageTime_Go;
var float fMessageDrawTime_Go;
var float fFadeOutTime_Go;
var bool bMessageDraw;
var int iRound_Instrusion;
var float fStartTimeDrawA;
var float fBeginMessageTime_Instrusion;
var bool bMessageDraw_Intrusion;
var bool bIsDraw_Intrusion;
var float TimeConnectionInstability[2];
var bool bConnectionInstability;
var bool bDrawConnectionInstability;
var() SpriteWidget WRoundResultBG;
var() SpriteWidget WRoundWin;
var() SpriteWidget WRoundLose;
var() SpriteWidget WTextAF;
var() SpriteWidget WTextRSA;
var() SpriteWidget WCompareSign;
var() SpriteWidget WCompareSignMid;
var() NumericWidget DigitsRoundWinAF;
var() NumericWidget DigitsRoundWinRSA;
var() SpriteWidget WTeamMarkAF;
var() SpriteWidget WTeamMarkRSA;
var() SpriteWidget WResultTeamMarkAF;
var() SpriteWidget WResultTeamMarkRSA;
var() SpriteWidget WWinTextAF;
var() SpriteWidget WLoseTextAF;
var() SpriteWidget WWinTextRSA;
var() SpriteWidget WLoseTextRSA;
var() SpriteWidget WRoundResultNewBG;
var() SpriteWidget WRoundResultGradationBG;
var() DigitSet WDigitsNumResultWin;
var() DigitSet WDigitsNumResultLose;
var() array<NumericWidget> DigitsAFWinScore;
var() array<NumericWidget> DigitsRSAWinScore;
var() array<NumericWidget> DigitsAFLoseScore;
var() array<NumericWidget> DigitsRSALoseScore;
var SpriteWidget wDefenceBotIcon[12];
var array<int> wDefenceGradeList;
var() SpriteWidget WScoreBG;
var() SpriteWidget WGoalScoreBG;
var() SpriteWidget WTimeBG;
var() array<NumericWidget> DigitsAFScore;
var() array<NumericWidget> DigitsRSAScore;
var() array<NumericWidget> DigitsGoalScore;
var() array<NumericWidget> DigitsTime;
var() array<NumericWidget> DigitsFFAGoalScore;
var() SpriteWidget WHudBG2;
var() SpriteWidget WHudBGR;
var() SpriteWidget WTeamScoreBG;
var SpriteWidget WNowRSATeamisWin;
var SpriteWidget WNowAFTeamisWin;
var SpriteWidget WNowRSATeamisLose;
var SpriteWidget WNowAFTeamisLose;
var() SpriteWidget WResultTxtAF[2];
var() SpriteWidget WResultTxtRSA[2];
var() SpriteWidget WFFABG;
var() SpriteWidget WFFAScoreBG;
var() SpriteWidget WFFAScoreOverLayer;
var int Ranking_Self;
var PlayerReplicationInfo PRI_1st;
var PlayerReplicationInfo PRI_2nd;
var PlayerReplicationInfo PRI_Self;
var float fSortingLastTime;
var() SpriteWidget DFRankingBG;
var() SpriteWidget WTimerBombBG;
var Material matBack1;
var Material matLine;
var Material tempMat;
var Material matOn;
var array<Material> Medals;
var localized string RankPostfix;
var int HasSkillC4;
var int HasSkillAirStirke;
var int HasSkillRPG7;
var int Displaying_State[17];
var float fBeginDrawTime_Skill;
var bool bDrawSkillC4;
var bool bDrawSkillRPG7;
var bool bDrawSkillHelicopter;
var bool bDrawSkillAirStrike;
var bool bDrawSkillUAV;
var bool bDrawSkillRPG;
var float fBeginDrawTime_Item;
var float fBeginDrawTime_SudenDeath;
var() SpriteWidget W3Kill;
var() SpriteWidget W5Kill;
var() SpriteWidget W7Kill;
var() SpriteWidget W10Kill;
var() SpriteWidget W15Kill;
var() SpriteWidget WHeadshot;
var() SpriteWidget WKillTextBg;
var() SpriteWidget WHudBack3;
var() SpriteWidget WTxtHostChange;
var() SpriteWidget WTxtSudenDeath;
var SpriteWidget wTxtSubSudenDeath;
var localized string lsSudenDeathMessage[3];
var float fBeginDrawTime_BattleExplain;
var() SpriteWidget WBattleExplain1;
var() SpriteWidget WBattleExplain2;
var() int AttackTeamIndex;
var() int CurrentRound;
var float fBeginDrawTime_GameMode;
var string sMessageGameMode;
var Material mGameMode[3];
var() SpriteWidget WGameMode;
var int iGameObjectIndex;
var bool bChangeMessgeGameMode;
var() array<SpriteWidget> DomObjectCaptureEnemy;
var() array<SpriteWidget> DomObjectCaptureAlly;
var() array<SpriteWidget> DomObjectCaptureNon;
var Sound SoundRequireHeliCopter;
var Sound SoundRequireAtillery;
var Sound SoundRequireUAV;
var Sound SoundNotReady;
var localized string MessageWin;
var localized string MessageLose;
var bool bUpdate;
var() SpriteWidget HelpKeyButtonReload;
var float WidthReload;
var bool bDisplayEvent_HealthPack;
var bool bDisplayEvent_CountDown;
var int iCountNumber;
var float fBeginTimeCounDown;
var bool bDisplayEvent_Invincible;
var int RPG7KillStreak;
var int IncenKillStreak;
var int HellfireKillStreak;
var int PinpointFireKillStreak;
var int SpiltGrenadeKillStreak;
var() SpriteWidget wBackSeparationTop;
var() SpriteWidget wBackSeparationBottom;
var() SpriteWidget WTeamImageAF[4];
var() SpriteWidget WTeamImageRSA[4];
var() SpriteWidget WScoreTeamMarkAF;
var() SpriteWidget WScoreTeamMarkRSA;

function Initialize(HudBase myOwner, LevelInfo Level)
{
    super.Initialize(myOwner, Level);
    fBeginDrawTime_SudenDeath = 0.0;
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    switch(iReservation1)
    {
        // End:0x18
        case 444:
            PlaySound_Event();
            // End:0xc3
            break;
        // End:0x29
        case 555:
            FFARankingSorting();
            // End:0xc3
            break;
        // End:0x3a
        case 888:
            UpdateHelpKeyControll();
            // End:0xc3
            break;
        // End:0x4b
        case 1002:
            DisPlayEvent_BeginWaitingForStart();
            // End:0xc3
            break;
        // End:0x5c
        case 1003:
            DisPlayEvent_EndWaitingForStart();
            // End:0xc3
            break;
        // End:0x7d
        case 1004:
            // End:0x7a
            if(!bDisplayEvent_CountDown)
            {
                DisplayEvent_CountDown(iReservation2);
            }
            // End:0xc3
            break;
        // End:0x90
        case 1005:
            bDisplayEvent_CountDown = false;
            // End:0xc3
            break;
        // End:0xbd
        case 1006:
            bDisplayEvent_Invincible = true;
            HudOwner.GoWalkingBeginTime = Level.TimeSeconds;
        // End:0xffff
        default:
            // End:0xc3 Break;
            break;
    }
}

function DisPlayEvent_BeginWaitingForStart()
{
    DMState = 2;
    fBeginMessageTime = Level.TimeSeconds;
}

function DisPlayEvent_EndWaitingForStart()
{
    DMState = 3;
    fBeginMessageTime_Go = Level.TimeSeconds;
}

function DisplayEvent_CountDown(int iCount)
{
    bDisplayEvent_CountDown = true;
    fBeginTimeCounDown = Level.TimeSeconds;
}

function PlaySound_Event();
function UpdateHUD()
{
    // End:0x42
    if(bDisplayEvent_HealthPack && Level.TimeSeconds > HudOwner.LastHealthPickupTime + fDrawTimeHealth + fFadeOutTimeHealth)
    {
        bDisplayEvent_HealthPack = false;
    }
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if(HudOwner.PlayerOwner.Player == none || HudOwner.PlayerOwner.Player.GUIController == none)
    {
        return;
    }
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 5", keys, LocalizedKeys);
    skeyBtnC4 = keys[0];
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 6", keys, LocalizedKeys);
    sKeyBtnHeli = keys[0];
    sKeyBtnAirStrike = keys[0];
    sKeyBtnUAV = keys[0];
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("UseKey", keys, LocalizedKeys);
    skeyUseKey = LocalizedKeys[0];
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("WeaponReload", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonReload, WidthReload, float(default.HelpKeyButtonReload.OffsetX));
    skeyWeaponReload = LocalizedKeys[0];
}

function DisPlayEvent_Waiting(string Message)
{
    // End:0x1a
    if(Message != "")
    {
        sWaitingMessage = Message;
    }
    // End:0x1c
    else
    {
        return;
    }
    IsStartupMessage = true;
    fReceiveTime_StartupMessage = Level.TimeSeconds;
}

function SetSkillState(int skillC4, int skillAirStirke, int SkillRPG7)
{
    // End:0x1d
    if(skillAirStirke == 2 && HasSkillAirStirke != skillAirStirke)
    {
    }
    HasSkillC4 = skillC4;
    HasSkillAirStirke = skillAirStirke;
    HasSkillRPG7 = SkillRPG7;
}

function DrawEvent_Item_HealthPack(Canvas C, optional int AddHp)
{
    local CalCoordsW calW;
    local float fWidth, fDeltaTime, fRatio, fMoveX, fMoveY;

    // End:0x31
    if(Level.TimeSeconds > HudOwner.LastHealthPickupTime + fDrawTimeHealth + fFadeOutTimeHealth)
    {
        return;
    }
    fDeltaTime = Level.TimeSeconds - HudOwner.LastHealthPickupTime;
    // End:0x72
    if(fDeltaTime < fDrawTimeHealth)
    {
        fFadeOutEffect = 1.0;
    }
    // End:0x92
    else
    {
        fFadeOutEffect = 1.0 - fDeltaTime - fDrawTimeHealth / fFadeOutTimeHealth;
    }
    C.DrawColor.A = byte(float(255) * fFadeOutEffect);
    // End:0x1c7
    if(HudOwner.PlayerOwner != none && HudOwner.PlayerOwner.SkillBase.bIncHealthPack)
    {
        WHealthPackPlus.OffsetX = int(float(default.WHealthPackPlus.OffsetX) - fMoveX);
        WHealthPackPlus.OffsetY = int(float(default.WHealthPackPlus.OffsetY) + fMoveY);
        CalculateCoordinateEx(C, WHealthPackPlus, 95.0, 95.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WHealthPackPlus.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x29e
    else
    {
        wHealthPack.OffsetX = int(float(default.wHealthPack.OffsetX) - fMoveX);
        wHealthPack.OffsetY = int(float(default.wHealthPack.OffsetY) + fMoveY);
        CalculateCoordinateEx(C, wHealthPack, 95.0, 95.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(wHealthPack.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    CalculateCoordinateEx(C, HudCDeathmatch(HudOwner).HpGauBlink, 167.0, 20.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(HudCDeathmatch(HudOwner).HpGauBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fRatio = fDeltaTime / fDrawTimeHealth + fFadeOutTimeHealth;
    fRatio = FClamp(fRatio, 0.0, 1.0);
    fMoveX = 11.0 * fRatio;
    fWidth = 22.0 + float(22) * fRatio;
    HudCDeathmatch(HudOwner).HPIcon.OffsetX = int(float(57) - fMoveX);
    HudCDeathmatch(HudOwner).HPIcon.OffsetY = int(float(1148) - fMoveX);
    CalculateCoordinateEx(C, HudCDeathmatch(HudOwner).HPIcon, fWidth, fWidth, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(HudCDeathmatch(HudOwner).HPIcon.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DisplayEvent_Skill_Helicopter(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio;
    local int X1, Y1, X2, Y2;

    // End:0x3d
    if(Level.TimeSeconds > HudOwner.LastHeliPickupTime + fDrawTime + fFadeOutTime)
    {
        Displaying_State[2] = 0;
        return;
    }
    // End:0x89
    if(Displaying_State[3] == 1 && HudOwner.LastHeliPickupTime < HudOwner.LastAirStirkePickupTime)
    {
        Displaying_State[2] = 0;
        bDrawSkillHelicopter = true;
        return;
    }
    // End:0xeb
    else
    {
        // End:0xeb
        if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState && HudOwner.LastHeliPickupTime < HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime)
        {
            Displaying_State[2] = 0;
            bDrawSkillHelicopter = true;
            return;
        }
    }
    // End:0x11e
    if(Level.TimeSeconds > HudOwner.LastHeliPickupTime + fDrawTimeSkill)
    {
        bDrawSkillHelicopter = true;
    }
    // End:0x126
    else
    {
        bDrawSkillHelicopter = false;
    }
    Displaying_State[2] = 1;
    fDeltaTime = Level.TimeSeconds - HudOwner.LastHeliPickupTime;
    // End:0x173
    if(fDeltaTime < fDrawTime)
    {
        fFadeOutEffect = 1.0;
    }
    // End:0x193
    else
    {
        fFadeOutEffect = 1.0 - fDeltaTime - fDrawTime / fFadeOutTime;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawColor.A = byte(float(255) * fFadeOutEffect);
    DrawHelpBG(C,, 734);
    CalculateCoordinateEx(C, wHelicopter, 512.0, 82.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(wHelicopter.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = int(float(619) * _reX);
    Y1 = int(float(753) * _reY);
    X2 = int(float(682) * _reX);
    Y2 = int(float(816) * _reY);
    C.SetDrawColor(0, 0, 0, byte(float(255) * fFadeOutEffect));
    C.BtrDrawTextJustifiedWithVolumeLine(sKeyBtnHeli, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));
    // End:0x354
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0;
    }
    // End:0x36d
    else
    {
        fRatio = fDeltaTime - fDrawTimeSkill / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0, 1.0);
    SkillHelicopterOn.OffsetX = int(float(default.SkillHelicopterOn.OffsetX) + float(-384) * fRatio);
    SkillHelicopterOn.OffsetY = int(float(default.SkillHelicopterOn.OffsetY) + float(279) * fRatio);
    CalculateCoordinateEx(C, SkillHelicopterOn, 128.0 - fRatio * float(64), 128.0 - fRatio * float(64), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillHelicopterOn.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function CallSkill(optional int iKey, optional bool bRequire, optional bool iSucess)
{
    local bool bSkillReady;
    local int iSkillID, iCodeID;
    local wWeapon wWP;

    // End:0x2bd
    if(5 == iKey)
    {
        // End:0x260
        if(1 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
        {
            iSkillID = HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID;
            switch(iSkillID)
            {
                // End:0x62
                case 40005:
                    ECallSkillState = 0;
                    // End:0x231
                    break;
                // End:0xd5
                case 40012:
                    ECallSkillState = 1;
                    // End:0xd2
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession >= RPG7KillStreak)
                    {
                        iCodeID = class'wMessage_Game_ImpSystem'.default.Code_NotHasAmmoRPG7;
                        HudOwner.PlayerOwner.ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCodeID);
                    }
                    // End:0x231
                    break;
                // End:0x148
                case 40017:
                    ECallSkillState = 12;
                    // End:0x145
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession >= IncenKillStreak)
                    {
                        iCodeID = class'wMessage_Game_ImpSystem'.default.Code_NotHasAmmoIncen;
                        HudOwner.PlayerOwner.ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCodeID);
                    }
                    // End:0x231
                    break;
                // End:0x1bb
                case 40018:
                    ECallSkillState = 10;
                    // End:0x1b8
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession >= PinpointFireKillStreak)
                    {
                        iCodeID = class'wMessage_Game_ImpSystem'.default.Code_NotHasPinpointBomb;
                        HudOwner.PlayerOwner.ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCodeID);
                    }
                    // End:0x231
                    break;
                // End:0x22e
                case 40022:
                    ECallSkillState = 14;
                    // End:0x22b
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession >= SpiltGrenadeKillStreak)
                    {
                        iCodeID = class'wMessage_Game_ImpSystem'.default.Code_NotHasAmmoSpiltGrenade;
                        HudOwner.PlayerOwner.ReceiveLocalizedMessage(class'wMessage_Game_ImpSystem', iCodeID);
                    }
                    // End:0x231
                    break;
                // End:0xffff
                default:
                    // End:0x25d
                    if(iSkillID > 0)
                    {
                        HudOwner.PlayerOwner.ClientPlaySound(SoundNotReady,,, 0);
                    }
                    // End:0x2ba Break;
                    break;
                }
        }
        // End:0x2ba
        if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
        {
            iSkillID = HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID;
            switch(iSkillID)
            {
                // End:0x2b7
                case 40018:
                    ECallSkillState = 10;
                    // End:0x2ba
                    break;
                // End:0xffff
                default:
                }
                // This is an implied JumpToken;
                goto J0x505;
            }
            // End:0x503
            if(6 == iKey)
            {
                wWP = Level.GetLocalPlayerController().Pawn.GetWeaponByInvenGroup(6);
                // End:0x4f8
                if(wWP != none)
                {
                    // End:0x3a4
                    if(wWP.BaseParams.eType == 15)
                    {
                        // End:0x334
                        if(bRequire)
                        {
                            ECallSkillState = 5;
                        }
                        // End:0x33c
                        else
                        {
                            ECallSkillState = 2;
                        }
                        // End:0x3a1
                        if(1 == HudOwner.PlayerOwner.PlayerReplicationInfo.bySupply_Helipack)
                        {
                            bSkillReady = true;
                            // End:0x3a1
                            if(bRequire && iSucess)
                            {
                                HudOwner.PlayerOwner.ClientPlaySound(SoundRequireHeliCopter,,, 0);
                            }
                        }
                    }
                    // End:0x4f5
                    else
                    {
                        // End:0x452
                        if(wWP.BaseParams.eType == 14 || wWP.BaseParams.eType == 11)
                        {
                            // End:0x3fe
                            if(bRequire)
                            {
                                ECallSkillState = 6;
                            }
                            // End:0x406
                            else
                            {
                                ECallSkillState = 3;
                            }
                            // End:0x44f
                            if(2 == HasSkillAirStirke)
                            {
                                bSkillReady = true;
                                // End:0x44f
                                if(bRequire && iSucess)
                                {
                                    HudOwner.PlayerOwner.ClientPlaySound(SoundRequireAtillery,,, 0);
                                }
                            }
                        }
                        // End:0x4f5
                        else
                        {
                            // End:0x4f5
                            if(wWP.BaseParams.eType == 16)
                            {
                                // End:0x488
                                if(bRequire)
                                {
                                    ECallSkillState = 7;
                                }
                                // End:0x490
                                else
                                {
                                    ECallSkillState = 4;
                                }
                                // End:0x4f5
                                if(1 == HudOwner.PlayerOwner.PlayerReplicationInfo.bySupply_UAV)
                                {
                                    bSkillReady = true;
                                    // End:0x4f5
                                    if(bRequire && iSucess)
                                    {
                                        HudOwner.PlayerOwner.ClientPlaySound(SoundRequireUAV,,, 0);
                                    }
                                }
                            }
                        }
                    }
                }
                // End:0x500
                else
                {
                    ECallSkillState = 3;
                }
            }
            // End:0x505
            else
            {
                return;
            }
            bResultSkillRequire = iSucess;
            fLastCallTime = Level.TimeSeconds;
            // End:0x57a
            if(ECallSkillState != 0)
            {
                // End:0x57a
                if(!bSkillReady || bRequire && !iSucess)
                {
                    HudOwner.PlayerOwner.ClientPlaySound(SoundNotReady,,, 0);
                }
            }
}

function DisplayEvent_Skill_State(Canvas C, SpriteWidget WMessage, optional SpriteWidget SkillIcon, optional bool bDrawing)
{
    local CalCoordsW calW;
    local float fDeltaTime, iWidth, iHeight;
    local int iAlpha;

    // End:0x2b
    if(bDrawing)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0xf6
    else
    {
        // End:0x59
        if(fLastCallTime + fDrawTime + fFadeOutTime < Level.TimeSeconds)
        {
            ECallSkillState = 16;
        }
        fDeltaTime = Level.TimeSeconds - fLastCallTime;
        // End:0x8e
        if(fDrawTime > fDeltaTime)
        {
            iAlpha = 255;
        }
        // End:0xb6
        else
        {
            iAlpha = int(float(255) * 1.0 - fDeltaTime - fFadeOutTime / fFadeOutTime);
        }
        // End:0xd4
        if(float(iAlpha) < MinAlpha)
        {
            iAlpha = int(MinAlpha);
        }
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    }
    DrawHelpBG(C,, 734);
    iWidth = float(WMessage.TextureCoords.X2 - WMessage.TextureCoords.X1);
    iHeight = float(WMessage.TextureCoords.Y2 - WMessage.TextureCoords.Y1);
    CalculateCoordinateEx(C, WMessage, iWidth, iHeight, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x2e5
    if(SkillIcon.WidgetTexture != none)
    {
        iWidth = float(SkillIcon.TextureCoords.X2 - SkillIcon.TextureCoords.X1);
        iHeight = float(SkillIcon.TextureCoords.Y2 - SkillIcon.TextureCoords.Y1);
        CalculateCoordinateEx(C, SkillIcon, iWidth, iHeight, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(SkillIcon.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
}

function DisplayEvent_Skill_AirStirke(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio;
    local int X1, Y1, X2, Y2;

    // End:0x3d
    if(Level.TimeSeconds > HudOwner.LastAirStirkePickupTime + fDrawTime + fFadeOutTime)
    {
        Displaying_State[3] = 0;
        return;
    }
    // End:0x89
    if(Displaying_State[2] == 1 && HudOwner.LastAirStirkePickupTime < HudOwner.LastHeliPickupTime)
    {
        Displaying_State[3] = 0;
        bDrawSkillAirStrike = true;
        return;
    }
    // End:0x137
    else
    {
        // End:0xd5
        if(Displaying_State[4] == 1 && HudOwner.LastAirStirkePickupTime < HudOwner.LastUAVPickupTime)
        {
            Displaying_State[3] = 0;
            bDrawSkillAirStrike = true;
            return;
        }
        // End:0x137
        else
        {
            // End:0x137
            if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState && HudOwner.LastAirStirkePickupTime < HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime)
            {
                Displaying_State[3] = 0;
                bDrawSkillAirStrike = true;
                return;
            }
        }
    }
    // End:0x16a
    if(Level.TimeSeconds > HudOwner.LastAirStirkePickupTime + fDrawTimeSkill)
    {
        bDrawSkillAirStrike = true;
    }
    // End:0x172
    else
    {
        bDrawSkillAirStrike = false;
    }
    Displaying_State[3] = 1;
    fDeltaTime = Level.TimeSeconds - HudOwner.LastAirStirkePickupTime;
    // End:0x1bf
    if(fDeltaTime < fDrawTime)
    {
        fFadeOutEffect = 1.0;
    }
    // End:0x1df
    else
    {
        fFadeOutEffect = 1.0 - fDeltaTime - fDrawTime / fFadeOutTime;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawColor.A = byte(float(255) * fFadeOutEffect);
    DrawHelpBG(C,, 734);
    CalculateCoordinateEx(C, WAirStirke, 512.0, 82.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WAirStirke.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = int(float(619) * _reX);
    Y1 = int(float(753) * _reY);
    X2 = int(float(682) * _reX);
    Y2 = int(float(816) * _reY);
    C.SetDrawColor(0, 0, 0, byte(float(255) * fFadeOutEffect));
    C.BtrDrawTextJustifiedWithVolumeLine(sKeyBtnAirStrike, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));
    // End:0x3a0
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0;
    }
    // End:0x3b9
    else
    {
        fRatio = fDeltaTime - fDrawTimeSkill / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0, 1.0);
    SkillAirstrikeOn.OffsetX = int(float(default.SkillAirstrikeOn.OffsetX) + float(-384) * fRatio);
    SkillAirstrikeOn.OffsetY = int(float(default.SkillAirstrikeOn.OffsetY) + float(279) * fRatio);
    CalculateCoordinateEx(C, SkillAirstrikeOn, 128.0 - fRatio * float(64), 128.0 - fRatio * float(64), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillAirstrikeOn.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DisplayEvent_Skill_UAV(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio;
    local int X1, Y1, X2, Y2;

    // End:0x3d
    if(Level.TimeSeconds > HudOwner.LastUAVPickupTime + fDrawTime + fFadeOutTime)
    {
        Displaying_State[4] = 0;
        return;
    }
    // End:0x7d
    if(Displaying_State[3] == 1 && HudOwner.LastUAVPickupTime < HudOwner.LastAirStirkePickupTime)
    {
        bDrawSkillUAV = true;
        return;
    }
    // End:0xd3
    else
    {
        // End:0xd3
        if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState && HudOwner.LastUAVPickupTime < HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime)
        {
            bDrawSkillUAV = true;
            return;
        }
    }
    // End:0x119
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.bySupply_UAV == 1 && Displaying_State[4] == 0)
    {
        Displaying_State[4] = 1;
    }
    // End:0x12b
    if(Displaying_State[4] == 0)
    {
        return;
    }
    // End:0x15e
    if(Level.TimeSeconds > HudOwner.LastUAVPickupTime + fDrawTimeSkill)
    {
        bDrawSkillUAV = true;
    }
    // End:0x166
    else
    {
        bDrawSkillUAV = false;
    }
    fDeltaTime = Level.TimeSeconds - HudOwner.LastUAVPickupTime;
    // End:0x1a7
    if(fDeltaTime < fDrawTime)
    {
        fFadeOutEffect = 1.0;
    }
    // End:0x1c7
    else
    {
        fFadeOutEffect = 1.0 - fDeltaTime - fDrawTime / fFadeOutTime;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawColor.A = byte(float(255) * fFadeOutEffect);
    DrawHelpBG(C,, 734);
    CalculateCoordinateEx(C, WUAV, 512.0, 82.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WUAV.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = int(float(619) * _reX);
    Y1 = int(float(754) * _reY);
    X2 = int(float(682) * _reX);
    Y2 = int(float(817) * _reY);
    C.SetDrawColor(0, 0, 0, byte(float(255) * fFadeOutEffect));
    C.BtrDrawTextJustifiedWithVolumeLine(sKeyBtnUAV, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));
    // End:0x388
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0;
    }
    // End:0x3a1
    else
    {
        fRatio = fDeltaTime - fDrawTimeSkill / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0, 1.0);
    SkillUAVOn.OffsetX = int(float(default.SkillUAVOn.OffsetX) + float(-384) * fRatio);
    SkillUAVOn.OffsetY = int(float(default.SkillUAVOn.OffsetY) + float(279) * fRatio);
    CalculateCoordinateEx(C, SkillUAVOn, 128.0 - fRatio * float(64), 128.0 - fRatio * float(64), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillUAVOn.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DisplayEvent_Skill_UsingSkill(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio, fActiveTime;
    local int X1, Y1, X2, Y2, AddKeyPosX, iAlpha;

    local SpriteWidget wTex;

    fActiveTime = HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime;
    // End:0x61
    if(Level.TimeSeconds > fActiveTime + fDrawTime + fFadeOutTime)
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
        return;
    }
    // End:0xab
    if(Displaying_State[2] == 1 && fActiveTime < HudOwner.LastHeliPickupTime)
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
        return;
    }
    // End:0xf2
    else
    {
        // End:0xf2
        if(Displaying_State[4] == 1 && fActiveTime < HudOwner.LastUAVPickupTime)
        {
            HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
            return;
        }
    }
    // End:0x139
    if(Displaying_State[3] == 1 && fActiveTime < HudOwner.LastAirStirkePickupTime)
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
        return;
    }
    fDeltaTime = Level.TimeSeconds - fActiveTime;
    // End:0x171
    if(fDeltaTime < fDrawTime)
    {
        fFadeOutEffect = 1.0;
    }
    // End:0x191
    else
    {
        fFadeOutEffect = 1.0 - fDeltaTime - fDrawTime / fFadeOutTime;
    }
    iAlpha = int(float(255) * fFadeOutEffect);
    // End:0x1c2
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    DrawHelpBG(C,, 734);
    wTex = HudCDeathmatch(HudOwner).ActiveUsingSkill.wTex[1];
    // End:0x227
    if(wTex.WidgetTexture == none)
    {
        return;
    }
    CalculateCoordinateEx(C, wTex, 512.0, 82.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(wTex.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x2eb
    if(HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID == 40018)
    {
        AddKeyPosX = -52;
    }
    X1 = int(float(619 + AddKeyPosX) * _reX);
    Y1 = int(float(754) * _reY);
    X2 = int(float(682 + AddKeyPosX) * _reX);
    Y2 = int(float(817) * _reY);
    C.SetDrawColor(0, 0, 0, byte(float(255) * fFadeOutEffect));
    C.BtrDrawTextJustifiedWithVolumeLine(skeyBtnC4, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));
    // End:0x3ef
    if(Level.TimeSeconds > fActiveTime + fDrawTimeSkill)
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawedIcon = true;
    }
    // End:0x40c
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0;
    }
    // End:0x425
    else
    {
        fRatio = fDeltaTime - fDrawTimeSkill / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0, 1.0);
    SkillIconEvent.WidgetTexture = HudCDeathmatch(HudOwner).ActiveUsingSkill.matIcon;
    SkillIconEvent.OffsetX = int(float(default.SkillIconEvent.OffsetX) + float(-454) * fRatio);
    SkillIconEvent.OffsetY = int(float(default.SkillIconEvent.OffsetY) + float(279) * fRatio);
    CalculateCoordinateEx(C, SkillIconEvent, 128.0 - fRatio * float(64), 128.0 - fRatio * float(64), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillIconEvent.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawEvent_Item(Canvas C)
{
    local PlayerReplicationInfo curPRI;

    // End:0x104
    if(Level.GRI.GameClass == "WMission.wSDGameInfo" || Level.GRI.GameClass == "WMission.wSBTGameInfo")
    {
        // End:0xe4
        if(Pawn(HudOwner.PlayerOwner.ViewTarget) != none && Pawn(HudOwner.PlayerOwner.ViewTarget).PlayerReplicationInfo != none)
        {
            curPRI = Pawn(HudOwner.PlayerOwner.ViewTarget).PlayerReplicationInfo;
        }
        // End:0x101
        else
        {
            curPRI = HudOwner.PlayerOwner.PlayerReplicationInfo;
        }
    }
    // End:0x121
    else
    {
        curPRI = HudOwner.PlayerOwner.PlayerReplicationInfo;
    }
    // End:0x14c
    if(curPRI != none)
    {
        Draw_Item_Supply(C, curPRI);
        Draw_Item_Skill(C, curPRI);
    }
}

function Draw_Item_Supply(Canvas C, PlayerReplicationInfo curPRI)
{
    // End:0x168
    if(HudOwner != none && HudOwner.PlayerOwner != none)
    {
        // End:0x42
        if(1 == curPRI.bySupply_UAV)
        {
            DisplayEvent_Skill_UAV(C);
        }
        // End:0x91
        if(1 == curPRI.bySupply_Helipack)
        {
            DisplayEvent_Skill_Helicopter(C);
            // End:0x91
            if(5 == ECallSkillState && false == bResultSkillRequire)
            {
                DisplayEvent_Skill_State(C, WHelicopterRequireFaild);
            }
        }
        // End:0x135
        if(curPRI.bySupply_AirStrike == 1)
        {
            DisplayEvent_Skill_AirStirke(C);
            // End:0x106
            if(3 == ECallSkillState)
            {
                // End:0x103
                if(HudOwner.PlayerOwner.Pawn.Weapon.IsA('wAirStrike'))
                {
                    DisplayEvent_Skill_State(C, WAirStirkeSellect,, true);
                }
            }
            // End:0x132
            else
            {
                // End:0x132
                if(6 == ECallSkillState)
                {
                    // End:0x132
                    if(false == bResultSkillRequire)
                    {
                        DisplayEvent_Skill_State(C, WAirStirkeRequireFaild);
                    }
                }
            }
        }
        // End:0x168
        else
        {
            // End:0x168
            if(3 == ECallSkillState && false == bResultSkillRequire)
            {
                DisplayEvent_Skill_State(C, WAirStirkeNotReady, WAirStirkeIcon);
            }
        }
    }
}

function Draw_Item_Skill(Canvas C, PlayerReplicationInfo curPRI)
{
    // End:0x1a8
    if(1 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
    {
        // End:0x61
        if(0 == ECallSkillState)
        {
            // End:0x56
            if(curPRI.Kills < 10)
            {
                DisplayEvent_Skill_State(C, WC4NotReady);
            }
            // End:0x5e
            else
            {
                ECallSkillState = 16;
            }
        }
        // End:0x192
        else
        {
            // End:0xae
            if(1 == ECallSkillState)
            {
                // End:0xab
                if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession < RPG7KillStreak)
                {
                    DisplayEvent_Skill_State(C, WRPG7NotReady);
                }
            }
            // End:0x192
            else
            {
                // End:0xfb
                if(12 == ECallSkillState)
                {
                    // End:0xf8
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession < IncenKillStreak)
                    {
                        DisplayEvent_Skill_State(C, WNotReadyIncen);
                    }
                }
                // End:0x192
                else
                {
                    // End:0x148
                    if(10 == ECallSkillState)
                    {
                        // End:0x145
                        if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession < PinpointFireKillStreak)
                        {
                            DisplayEvent_Skill_State(C, WNotReadyPinpointFire);
                        }
                    }
                    // End:0x192
                    else
                    {
                        // End:0x192
                        if(14 == ECallSkillState)
                        {
                            // End:0x192
                            if(HudOwner.PlayerOwner.PlayerReplicationInfo.KillSuccession < SpiltGrenadeKillStreak)
                            {
                                DisplayEvent_Skill_State(C, WNotReadySpiltGrenade);
                            }
                        }
                    }
                }
            }
        }
        // End:0x1a5
        if(1 == HasSkillRPG7)
        {
            bRPG7Active = false;
        }
    }
    // End:0x246
    else
    {
        // End:0x246
        if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
        {
            // End:0x21d
            if(HudOwner.PlayerOwner.Pawn.Weapon.IsA('wAirStrike') && 10 == ECallSkillState)
            {
                DisplayEvent_Skill_State(C, WAirStirkeSellect,, true);
            }
            // End:0x246
            else
            {
                // End:0x246
                if(!HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed)
                {
                    DisplayEvent_Skill_UsingSkill(C);
                }
            }
        }
    }
}

function DrawHelpBG(Canvas C, optional int OffsetX, optional int OffsetY, optional int iWidth, optional int iHeight)
{
    local CalCoordsW calW;

    // End:0x16
    if(iWidth == 0)
    {
        iWidth = 1600;
    }
    // End:0x29
    if(iHeight == 0)
    {
        iHeight = 104;
    }
    WHelpBG.OffsetX = OffsetX;
    WHelpBG.OffsetY = OffsetY;
    CalculateCoordinateEx(C, WHelpBG, float(iWidth), float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WHelpBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WHelpBG.OffsetY = default.WHelpBG.OffsetY;
}

function DrawGauge(Canvas C, float fProgressPct)
{
    local CalCoordsW calW;
    local float fWidth;

    WRespawnBG.OffsetX = default.WRespawnBG.OffsetX;
    WRespawnBG.OffsetY = default.WRespawnBG.OffsetY;
    CalculateCoordinateEx(C, WRespawnBG, 511.0, 29.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WRespawnGauge.OffsetX = default.WRespawnGauge.OffsetX;
    WRespawnGauge.OffsetY = default.WRespawnGauge.OffsetY;
    fWidth = 507.0 * fProgressPct;
    CalculateCoordinateEx(C, WRespawnGauge, fWidth, 25.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
}

function DisplayEvent_Respawn(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fProgressPct, fRespawnTimeLength;
    local string invincible;
    local float RandomRespawnTextPos;

    // End:0x1a
    if(HudOwner.DiedTime == 0.0)
    {
        return;
    }
    // End:0x9d
    if(HudOwner.PlayerOwner != none && HudOwner.PlayerOwner.SkillBase != none && HudOwner.PlayerOwner.SkillBase.bQuickRespawn == true)
    {
        fRespawnTimeLength = Level.GRI.RespawnTime - 1.40;
    }
    // End:0xba
    else
    {
        fRespawnTimeLength = Level.GRI.RespawnTime;
    }
    // End:0xe4
    if(Level.TimeSeconds > HudOwner.DiedTime + fRespawnTimeLength)
    {
        return;
    }
    // End:0xfe
    if(HudOwner.DiedTime < 5.0)
    {
        return;
    }
    // End:0x11b
    if(Level.GRI.bStopCountDown)
    {
        return;
    }
    ResetState();
    C.SetPos(544.0 * _reX, 948.0 + float(80) * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.DrawTileStretched(texture'img_HUD_back_2', 511.0 * _reX, 51.0 * _reY);
    RandomRespawnTextPos = 370.0;
    RandomRespawnTextPos = 350.0;
    fDeltaTime = Level.TimeSeconds - HudOwner.DiedTime;
    // End:0x1e0
    if(fDeltaTime > fRespawnTimeLength)
    {
        return;
    }
    fProgressPct = fDeltaTime / fRespawnTimeLength;
    DrawGauge(C, fProgressPct);
    // End:0x23c
    if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner())
    {
        invincible = lsIsInvincibleBeginner;
    }
    // End:0x247
    else
    {
        invincible = lsIsInvincible;
    }
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(invincible, 1, 0.0, fBeginRespawnPosY * _reY, 1600.0 * _reX, fEndRespawnPosY * _reY, int(float(FontSizeRespawn) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x349
    if(!Level.GetMatchMaker().IsSDRespawn())
    {
        C.BtrDrawTextJustified(safeZoneRandomRespawn, 1, 558.0 * _reX, 1041.0 * _reY, 1041.0 * _reX, 1066.0 * _reY, int(float(18) * _reY));
    }
    // End:0x39c
    else
    {
        C.BtrDrawTextJustified(RespawnText, 1, 558.0 * _reX, 1041.0 * _reY, 1041.0 * _reX, 1066.0 * _reY, int(float(18) * _reY));
    }
}

function DrawGauge2(Canvas C, float fProgressPct, float PosX, float PosY)
{
    local CalCoordsW calW;
    local float fWidth;

    WRespawnBG.OffsetX = int(PosX);
    WRespawnBG.OffsetY = int(PosY);
    CalculateCoordinateEx(C, WRespawnBG, 511.0, 29.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WRespawnGauge.OffsetX = int(PosX + float(2));
    WRespawnGauge.OffsetY = int(PosY + float(2));
    fWidth = 507.0 * fProgressPct;
    CalculateCoordinateEx(C, WRespawnGauge, fWidth, 25.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
}

function DrawInvincibleGauge(Canvas C)
{
    local float fDeltaTime, fProgressPct, fInvincibleTimeLength;
    local string invincible;

    ResetState();
    // End:0x34
    if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_SD())
    {
        return;
    }
    // End:0x4e
    if(HudOwner.GoWalkingBeginTime <= 0.0)
    {
        return;
    }
    // End:0x8a
    if(Level.GetMatchMaker().BeginnerMode)
    {
        fInvincibleTimeLength = HudOwner.PawnOwner.fRespawnInvulnerableTimeBeginner;
    }
    // End:0x12d
    else
    {
        // End:0xd6
        if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_SD())
        {
            fInvincibleTimeLength = HudOwner.PawnOwner.fRespawnInvulnerableTime_SDMode;
        }
        // End:0x12d
        else
        {
            // End:0x110
            if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
            {
                fInvincibleTimeLength = 0.0;
            }
            // End:0x12d
            else
            {
                fInvincibleTimeLength = HudOwner.PawnOwner.fRespawnInvulnerableTime;
            }
        }
    }
    fDeltaTime = Level.TimeSeconds - HudOwner.GoWalkingBeginTime;
    // End:0x17e
    if(fDeltaTime > fInvincibleTimeLength)
    {
        bDisplayEvent_Invincible = false;
        HudOwner.GoWalkingBeginTime = 0.0;
        return;
    }
    fProgressPct = fDeltaTime / fInvincibleTimeLength;
    DrawGauge2(C, fProgressPct, 548.0, 926.0);
    // End:0x1e4
    if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner())
    {
        invincible = lsIsInvincibleBeginner;
    }
    // End:0x1ef
    else
    {
        invincible = lsIsInvincible;
    }
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(invincible, 1, 0.0, 881.0 * _reY, 1600.0 * _reX, 905.0 * _reY, int(float(FontSizeRespawn) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawMessageSD_BombEnable(Canvas C, SpriteWidget WKey, SpriteWidget WMessage)
{
    local CalCoordsW calW;
    local int iWidth, iHeight, X1, Y1, X2, Y2;

    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x3a
    if(Level.GRI.RoundState != 2)
    {
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawHelpBG(C,, 328);
    WKeyButtonBG.OffsetX = 619;
    WKeyButtonBG.OffsetY = 348;
    CalculateCoordinateEx(C, WKeyButtonBG, 52.0, 52.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WKeyButtonBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x201
    if(HudCDeathmatch(HudOwner).bBlinkState)
    {
        WKeyButtonBGBlink.OffsetX = WKeyButtonBG.OffsetX - 2;
        WKeyButtonBGBlink.OffsetY = WKeyButtonBG.OffsetY - 2;
        CalculateCoordinateEx(C, WKeyButtonBGBlink, 56.0, 56.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    X1 = int(float(int(float(WKeyButtonBG.OffsetX) + 7.0)) * _reX);
    Y1 = int(float(int(float(WKeyButtonBG.OffsetY) + 7.0)) * _reY);
    X2 = int(float(int(float(WKeyButtonBG.OffsetX) + 45.0)) * _reX);
    Y2 = int(float(int(float(WKeyButtonBG.OffsetY) + 35.0)) * _reY);
    C.SetDrawColor(0, 0, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(skeyUseKey, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));
    iWidth = WMessage.TextureCoords.X2 - WMessage.TextureCoords.X1;
    iHeight = WMessage.TextureCoords.Y2 - WMessage.TextureCoords.Y1;
    CalculateCoordinateEx(C, WMessage, float(iWidth), float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawMessageSD_BombDoingAndDone(Canvas C, SpriteWidget WMessage, bool SDDoing, optional float ProgressPct)
{
    local CalCoordsW calW;
    local int iWidth, iHeight, iAlpha;

    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x3a
    if(Level.GRI.RoundState != 2)
    {
        return;
    }
    // End:0x4e
    if(SDDoing)
    {
        iAlpha = 255;
    }
    // End:0x7f
    else
    {
        iAlpha = int(float(255) * ProgressPct);
        // End:0x7f
        if(float(iAlpha) < MinAlpha)
        {
            iAlpha = int(MinAlpha);
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    DrawHelpBG(C,, 328);
    // End:0xcb
    if(SDDoing)
    {
        DrawGauge(C, ProgressPct);
    }
    iWidth = WMessage.TextureCoords.X2 - WMessage.TextureCoords.X1;
    iHeight = WMessage.TextureCoords.Y2 - WMessage.TextureCoords.Y1;
    CalculateCoordinateEx(C, WMessage, float(iWidth), float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawMessageDomi_Capture(Canvas C, DigitSet WDigit, NumericWidget WRegion, SpriteWidget WMessage, bool CaptureDoing, optional float ProgressPct)
{
    local CalCoordsW calW;
    local int iWidth, iHeight, iAlpha;

    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x3a
    if(Level.GRI.RoundState != 2)
    {
        return;
    }
    // End:0x4e
    if(CaptureDoing)
    {
        iAlpha = 255;
    }
    // End:0x7f
    else
    {
        iAlpha = int(float(255) * ProgressPct);
        // End:0x7f
        if(float(iAlpha) < MinAlpha)
        {
            iAlpha = int(MinAlpha);
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    DrawHelpBG(C,, 328);
    // End:0xcb
    if(CaptureDoing)
    {
        DrawGauge(C, ProgressPct);
    }
    iWidth = 44;
    iHeight = 44;
    CalculateCoordinateDigitEx(C, WDigit, WRegion, float(iWidth), float(iHeight), WRegion.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigit.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iWidth = WMessage.TextureCoords.X2 - WMessage.TextureCoords.X1;
    iHeight = WMessage.TextureCoords.Y2 - WMessage.TextureCoords.Y1;
    CalculateCoordinateEx(C, WMessage, float(iWidth), float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DrawMessageHeadShotAndMultiKill(Canvas C, string sMessage, bool bAddPosY, float fFontSize, Color _colorShadow)
{
    local int X1, X2, Y1, Y2, AddY;

    // End:0x14
    if(bAddPosY)
    {
        AddY = -89;
    }
    X1 = int(float(663) * _reX);
    Y1 = int(float(319 + AddY) * _reY);
    X2 = int(float(937) * _reX);
    Y2 = int(float(391 + AddY) * _reY);
}

function DrawEffect(Canvas C, float StartTime, int iAlpha)
{
    local float fLifeTime, fEndOfLife, FadeValue, fFadeOutTime, fTotalEffectRunTime, fEffectRunTime1,
	    fEffectRunTime2, fRealDrawTime, CurrentScale, Delta, Delta2,
	    fPassingTime, StartScale, fScaleStepMultiplier, fScaleStep;

    fLifeTime = 6.0;
    fTotalEffectRunTime = class'wMessage_Score'.default.fTotalEffectRunTime;
    fEffectRunTime1 = class'wMessage_Score'.default.fEffectRunTime1;
    fEffectRunTime2 = class'wMessage_Score'.default.fEffectRunTime2;
    StartScale = class'wMessage_Score'.default.StartScale;
    fScaleStepMultiplier = class'wMessage_Score'.default.ScaleStepMultiplier;
    fScaleStep = class'wMessage_Score'.default.ScaleStep;
    fRealDrawTime = fLifeTime - fTotalEffectRunTime;
    fEndOfLife = StartTime + fMessageDrawTime;
    Delta = fEndOfLife - Level.TimeSeconds;
    Delta = FClamp(Delta, 0.0, fLifeTime);
    fPassingTime = fLifeTime - Delta;
    // End:0x229
    if(fPassingTime <= fTotalEffectRunTime)
    {
        Delta2 = MessageLastTime - Delta;
        // End:0x139
        if(Delta2 > 0.010)
        {
            MessageLastTime = Delta;
            MessageAccelStep += fScaleStep * fScaleStepMultiplier;
        }
        CurrentScale = StartScale * 1.0 - fPassingTime / fEffectRunTime1;
        CurrentScale = CurrentScale - MessageAccelStep;
        CurrentScale = FClamp(CurrentScale, 0.990, StartScale);
        MessageAlpha = int(float(100) * 1.0 - CurrentScale / StartScale);
        C.DrawColor = C.MakeColor(byte(255), 153, 0);
        C.DrawColor.A = byte(MessageAlpha);
        // End:0x226
        if(CurrentScale < float(1))
        {
            CurrentScale = 1.0;
            MessageAccelStep = 0.0;
            MessageAlpha = 0;
            C.DrawColor.A = byte(255);
        }
    }
    // End:0x2c5
    else
    {
        MessageEffect = 0;
        MessageAccelStep = 0.0;
        CurrentScale = 1.0;
        fFadeOutTime = class'wMessage_Score'.default.fFadeOutTime;
        FadeValue = fBeginMessageTime_Go + fMessageDrawTime - Level.TimeSeconds;
        FadeValue = FadeValue / fRealDrawTime - fFadeOutTime;
        C.DrawColor.A = byte(float(iAlpha) * FClamp(FadeValue, 0.0, 1.0));
    }
    C.DrawColor.A = byte(Clamp(C.DrawColor.A, 1, 255));
    C.DrawColor = C.MakeColorNoEmpty(byte(255), byte(255), byte(255), C.DrawColor.A);
}

function DrawMessage_Go(Canvas C)
{
    local CalCoordsW calW;
    local int iAlpha;
    local float fFadeOut, fDeltaTime;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime_Go;
    // End:0x3b
    if(fDeltaTime >= fMessageDrawTime_Go + fFadeOutTime_Go)
    {
        DMState = 0;
        return;
    }
    // End:0x58
    if(fDeltaTime < fMessageDrawTime_Go)
    {
        fFadeOut = 1.0;
    }
    // End:0x78
    else
    {
        fFadeOut = 1.0 - fDeltaTime - fMessageDrawTime_Go / fFadeOutTime_Go;
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0xa9
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    CalculateCoordinateEx(C, WGo, 1024.0, 218.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGo.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawMessage_Start(Canvas C)
{
    local CalCoordsW calW;
    local SpriteWidget WDrawType, WTeamMark;
    local string DrawMessage;
    local int iAlpha, X1, Y1, X2, Y2;

    local float fFadeOut, fDeltaTime, fIntervalTime;

    // End:0x59
    if(Level.GRI.GameClass != "WGame.wDeathMatch" && HudOwner.PlayerOwner.PlayerReplicationInfo.Team == none)
    {
        return;
    }
    fIntervalTime = 0.0;
    // End:0x9b
    if(Level.TimeSeconds - fBeginMessageTime + fIntervalTime > fMessageDrawTime + fFadeOutTime)
    {
        bMessageDraw = false;
        return;
    }
    // End:0x187
    if(false == bMessageDraw)
    {
        bMessageDraw = true;
        // End:0x134
        if(DMState == 0)
        {
            // End:0x134
            if(Level.GetMatchMaker() != none && Level.GRI != none && Level.GetMatchMaker().iTimeLimit != Level.GRI.RemainingTime)
            {
                fBeginMessageTime = Level.TimeSeconds;
            }
        }
        // End:0x187
        if(Level.GetMatchMaker().bNoUpdateQuestInfo)
        {
            HudOwner.PlayerConsole.AddMessageItem(HudOwner.PlayerConsole.ConstructMessageItem(strQuestNoUpdate, 6));
        }
    }
    fDeltaTime = Level.TimeSeconds - fBeginMessageTime + fIntervalTime;
    // End:0x1c1
    if(fDeltaTime >= fMessageDrawTime + fFadeOutTime)
    {
        return;
    }
    // End:0x1de
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0;
    }
    // End:0x1fe
    else
    {
        fFadeOut = 1.0 - fDeltaTime - fMessageDrawTime / fFadeOutTime;
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0x22f
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    // End:0x2e2
    if(Level.GRI.GameClass == "WGame.wTeamGame")
    {
        // End:0x294
        if(11 == Level.GetMatchMaker().kGame_GameMode)
        {
            WDrawType = WGameTypeFM;
            DrawMessage = BeginMessageFM;
        }
        // End:0x2df
        else
        {
            // End:0x2c9
            if(Level.GetMatchMaker().BotTutorial)
            {
                WDrawType = WGameTypeTM;
                DrawMessage = BeginMessageTM;
            }
            // End:0x2df
            else
            {
                WDrawType = WGameTypeTD;
                DrawMessage = BeginMessageTD;
            }
        }
    }
    // End:0x376
    else
    {
        // End:0x32e
        if(Level.GRI.GameClass == "WMission.wDOMGameInfo")
        {
            WDrawType = WGameTypeDOMI;
            DrawMessage = BeginMessageDOMI;
        }
        // End:0x376
        else
        {
            // End:0x376
            if(Level.GRI.GameClass == "WGame.wDeathMatch")
            {
                WDrawType = WGameTypeDM;
                DrawMessage = BeginMessageDM;
            }
            // End:0x376
            else
            {
            }
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    WBGStart.OffsetX = 0;
    WBGStart.OffsetY = 536;
    CalculateCoordinateEx(C, WBGStart, 1600.0, 128.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStart.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WDrawType.OffsetX = 314;
    WDrawType.OffsetY = 568;
    CalculateCoordinateEx(C, WDrawType, 256.0, 64.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDrawType.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(217, 160, 20, byte(iAlpha));
    X1 = int(float(800) * _reX);
    Y1 = int(float(604) * _reY);
    X2 = int(float(1452) * _reX);
    Y2 = int(float(633) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(DrawMessage, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(21) * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    // End:0x610
    if(Level.GRI.GameClass == "WGame.wDeathMatch")
    {
        TeamIndex = 0;
    }
    // End:0x63f
    else
    {
        TeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0x658
    if(TeamIndex == 0)
    {
        WTeamMark = WTeamMarkAF;
    }
    // End:0x663
    else
    {
        WTeamMark = WTeamMarkRSA;
    }
    WTeamMark.OffsetX = 0;
    WTeamMark.OffsetY = 443;
    CalculateCoordinateEx(C, WTeamMark, 314.0, 314.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WHelpBG.OffsetX = default.WHelpBG.OffsetX;
    WHelpBG.OffsetY = default.WHelpBG.OffsetY;
}

function DrawMessage_StartDefence(Canvas C)
{
    local CalCoordsW calW;
    local int iAlpha, X1, Y1, X2, Y2, i,
	    idx;

    local float fFadeOut, fDeltaTime, fIntervalTime;

    fIntervalTime = 0.0;
    // End:0x56
    if(Level.TimeSeconds - fBeginMessageTime + fIntervalTime > fMessageDrawTime + fFadeOutTime)
    {
        bMessageDraw = false;
        // End:0x54
        if(wDefenceGradeList.Length > 0)
        {
            wDefenceGradeList.Length = 0;
        }
        return;
    }
    // End:0x142
    if(false == bMessageDraw)
    {
        bMessageDraw = true;
        // End:0xef
        if(DMState == 0)
        {
            // End:0xef
            if(Level.GetMatchMaker() != none && Level.GRI != none && Level.GetMatchMaker().iTimeLimit != Level.GRI.RemainingTime)
            {
                fBeginMessageTime = Level.TimeSeconds;
            }
        }
        // End:0x142
        if(Level.GetMatchMaker().bNoUpdateQuestInfo)
        {
            HudOwner.PlayerConsole.AddMessageItem(HudOwner.PlayerConsole.ConstructMessageItem(strQuestNoUpdate, 6));
        }
    }
    fDeltaTime = Level.TimeSeconds - fBeginMessageTime + fIntervalTime;
    // End:0x17c
    if(fDeltaTime >= fMessageDrawTime + fFadeOutTime)
    {
        return;
    }
    // End:0x199
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0;
    }
    // End:0x1b9
    else
    {
        fFadeOut = 1.0 - fDeltaTime - fMessageDrawTime / fFadeOutTime;
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0x1ea
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    CalculateCoordinateEx(C, WBGStartDF, 1024.0, 279.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStartDF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    DigitsNumberSecond.Value = CurrentRound / 10;
    DigitsNumberFirst.Value = int(float(CurrentRound) % float(10));
    DigitsNumberSecond.OffsetX = 708;
    DigitsNumberSecond.OffsetY = 512;
    DigitsNumberFirst.OffsetX = 800;
    DigitsNumberFirst.OffsetY = 512;
    CalculateCoordinateDigitEx(C, WDigitsDFRoundNumber, DigitsNumberSecond, 92.0, 78.0, DigitsNumberSecond.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsDFRoundNumber.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateDigitEx(C, WDigitsDFRoundNumber, DigitsNumberFirst, 92.0, 78.0, DigitsNumberFirst.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsDFRoundNumber.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = 803 - wDefenceGradeList.Length * 85 / 2;
    i = 0;
    J0x47f:
    // End:0x593 [While If]
    if(i < wDefenceGradeList.Length)
    {
        idx = wDefenceGradeList[i] - 901;
        // End:0x4c7
        if(idx < 0 || idx > 12)
        {
            idx = 0;
        }
        wDefenceBotIcon[idx].OffsetX = X1;
        CalculateCoordinateEx(C, wDefenceBotIcon[idx], 80.0, 80.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(wDefenceBotIcon[idx].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        X1 += 85;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x47f;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    X1 = int(float(658) * _reX);
    Y1 = int(float(632) * _reY);
    X2 = int(float(942) * _reX);
    Y2 = int(float(651) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageDF, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(14) * _reY));
}

function DrawMessage_WaitingCountGM(Canvas C)
{
    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x36
    if(fReceiveTime_StartupMessage + float(2) <= Level.TimeSeconds)
    {
        return;
    }
    // End:0x55
    if(int(sWaitingMessage) > 10 || int(sWaitingMessage) == 0)
    {
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawCountDown(C, int(sWaitingMessage));
}

function DrawMessage_Waiting(Canvas C)
{
    local CalCoordsW calW;

    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x36
    if(fReceiveTime_StartupMessage + float(2) <= Level.TimeSeconds)
    {
        return;
    }
    CalculateCoordinateEx(C, WGameMessageWaiting, 512.0, 44.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WGameMessageWaiting.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    DrawCountDown(C, int(sWaitingMessage));
}

function DrawCountDown(Canvas C, coerce int iCount)
{
    local CalCoordsW calW;
    local int iWaitingTime, iSecond, iFirst;

    WHelpBG.OffsetX = 0;
    WHelpBG.OffsetY = 441;
    CalculateCoordinateEx(C, WHelpBG, 1600.0, 103.0, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WHelpBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iWaitingTime = iCount;
    iSecond = iWaitingTime / 10;
    iFirst = int(float(iWaitingTime) % float(10));
    // End:0x1f0
    if(0 != iSecond)
    {
        DigitsNumberSecond.OffsetX = 756;
        DigitsNumberSecond.OffsetY = 458;
        CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsNumberSecond, 43.0, 60.0, iSecond, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        DigitsNumberFirst.OffsetX = 799;
        DigitsNumberFirst.OffsetY = 458;
    }
    // End:0x210
    else
    {
        DigitsNumberFirst.OffsetX = 778;
        DigitsNumberFirst.OffsetY = 458;
    }
    CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsNumberFirst, 43.0, 60.0, iFirst, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DisplayMessage_Mission_Intrusion(Canvas C, int iAttackTeam, int iRound)
{
    local float fDeltaTime, fFadeOut;
    local int iAlpha;

    // End:0x30
    if(false == bMessageDraw_Intrusion)
    {
        bMessageDraw_Intrusion = true;
        fBeginMessageTime_Instrusion = Level.TimeSeconds;
        DMState = 2;
    }
    fDeltaTime = Level.TimeSeconds - fBeginMessageTime_Instrusion;
    // End:0x73
    if(fDeltaTime > fMessageDrawTime + fFadeOutTime)
    {
        bIsDraw_Intrusion = true;
        DMState = 0;
        return;
    }
    // End:0x90
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0;
    }
    // End:0xb0
    else
    {
        fFadeOut = 1.0 - fDeltaTime - fMessageDrawTime / fFadeOutTime;
    }
    iRound_Instrusion = iRound;
    iAlpha = int(float(255) * fFadeOut);
    // End:0xec
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    DisplayMessage_Mission(C, iAttackTeam, iAlpha);
}

function DisplayMessage_Mission(Canvas C, int iAttackTeam, int iAlpha)
{
    local CalCoordsW calW;
    local int iFontSize, X1, Y1, X2, Y2, iTeamIndex;

    local SpriteWidget WTeamMark, WDrawType;

    // End:0x40
    if(Level.GRI.GameClass == "WMission.wSDGameInfo")
    {
        WDrawType = WGameTypeSD;
    }
    // End:0xb8
    else
    {
        // End:0x81
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            WDrawType = WGameTypeSB;
        }
        // End:0xb8
        else
        {
            // End:0xb8
            if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
            {
                WDrawType = WGameTypeDOA;
            }
        }
    }
    // End:0xca
    if(DMState != 2)
    {
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    iFontSize = int(float(21) * _reY);
    WBGStart.OffsetX = 0;
    WBGStart.OffsetY = 536;
    CalculateCoordinateEx(C, WBGStart, 1600.0, 155.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStart.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WDrawType.OffsetX = 314;
    WDrawType.OffsetY = 568;
    CalculateCoordinateEx(C, WDrawType, 256.0, 64.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDrawType.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(217, 160, 20, byte(iAlpha));
    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    AttackTeamIndex = iAttackTeam;
    X1 = int(float(800) * _reX);
    Y1 = int(float(604) * _reY);
    X2 = int(float(1452) * _reX);
    Y2 = int(float(633) * _reY);
    // End:0x3cc
    if(Level.GRI.GameClass == "WMission.wSDGameInfo")
    {
        // End:0x392
        if(iTeamIndex == iAttackTeam)
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDA1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }
        // End:0x3c9
        else
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDD1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }
    }
    // End:0x49d
    else
    {
        // End:0x439
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSB, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }
        // End:0x49d
        else
        {
            // End:0x49d
            if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
            {
                C.BtrDrawTextJustifiedWithVolumeLine(GetMessageGameMode_DOA(), 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
            }
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    // End:0x507
    if(iTeamIndex == 0)
    {
        WTeamMark = WTeamMarkAF;
    }
    // End:0x512
    else
    {
        WTeamMark = WTeamMarkRSA;
    }
    WTeamMark.OffsetX = 0;
    WTeamMark.OffsetY = 443;
    CalculateCoordinateEx(C, WTeamMark, 314.0, 314.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WHelpBG.OffsetX = default.WHelpBG.OffsetX;
    WHelpBG.OffsetY = default.WHelpBG.OffsetY;
}

function DisplayMessaage_Round(Canvas C, int iAttackTeam, int iAlpha)
{
    local CalCoordsW calW;
    local int iFontSize, X1, Y1, X2, Y2, iTeamIndex;

    local SpriteWidget WTeamMark, WDrawType;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    iFontSize = int(float(21) * _reY);
    // End:0x75
    if(Level.GRI.GameClass == "WMission.wSDGameInfo")
    {
        WDrawType = WGameChangeAttack;
    }
    // End:0xb3
    else
    {
        // End:0xb3
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            WDrawType = WGameChangePosition;
        }
    }
    // End:0xc5
    if(DMState != 2)
    {
        return;
    }
    WBGStart.OffsetX = 0;
    WBGStart.OffsetY = 536;
    CalculateCoordinateEx(C, WBGStart, 1600.0, 128.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStart.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WDrawType.OffsetX = 314;
    WDrawType.OffsetY = 568;
    CalculateCoordinateEx(C, WDrawType, 256.0, 64.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDrawType.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x245
    if(HudOwner.PlayerOwner == none)
    {
        return;
    }
    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    C.SetDrawColor(217, 160, 20, byte(iAlpha));
    X1 = int(float(800) * _reX);
    Y1 = int(float(604) * _reY);
    X2 = int(float(1452) * _reX);
    Y2 = int(float(633) * _reY);
    // End:0x39d
    if(Level.GRI.GameClass == "WMission.wSDGameInfo")
    {
        // End:0x363
        if(iTeamIndex == iAttackTeam)
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDA1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }
        // End:0x39a
        else
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDD1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }
    }
    // End:0x46e
    else
    {
        // End:0x40a
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSB, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }
        // End:0x46e
        else
        {
            // End:0x46e
            if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
            {
                C.BtrDrawTextJustifiedWithVolumeLine(GetMessageGameMode_DOA(), 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
            }
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    // End:0x4d8
    if(iTeamIndex == 0)
    {
        WTeamMark = WTeamMarkAF;
    }
    // End:0x4e3
    else
    {
        WTeamMark = WTeamMarkRSA;
    }
    WTeamMark.OffsetX = 0;
    WTeamMark.OffsetY = 443;
    CalculateCoordinateEx(C, WTeamMark, 314.0, 314.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WHelpBG.OffsetX = default.WHelpBG.OffsetX;
    WHelpBG.OffsetY = default.WHelpBG.OffsetY;
}

function DisplayRoundResult(Canvas C, int ScoringTeam)
{
    local CalCoordsW calW;
    local int iCountAF, iCountRSA, iFirst, iSecond, iTeamIndex;

    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x2c
    if(HudOwner.PlayerOwner == none)
    {
        return;
    }
    iCountAF = int(Level.GRI.Teams[0].Score);
    iCountRSA = int(Level.GRI.Teams[1].Score);
    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    // End:0x158
    if(ScoringTeam == iTeamIndex)
    {
        CalculateCoordinateEx(C, WRoundWin, 512.0, 96.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WRoundWin.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x1ef
    else
    {
        CalculateCoordinateEx(C, WRoundLose, 512.0, 96.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WRoundLose.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    CalculateCoordinateEx(C, WRoundResultBG, 1600.0, 293.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRoundResultBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WTeamMarkAF.OffsetX = 380;
    WTeamMarkAF.OffsetY = 473;
    CalculateCoordinateEx(C, WTeamMarkAF, 255.0, 255.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamMarkAF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WTeamMarkRSA.OffsetX = 964;
    WTeamMarkRSA.OffsetY = 473;
    CalculateCoordinateEx(C, WTeamMarkRSA, 255.0, 255.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamMarkRSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x43e
    if(Level.GRI.Teams[0].TeamIndex == iTeamIndex)
    {
        C.SetDrawColor(byte(255), 150, 0, byte(255));
    }
    // End:0x45d
    else
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x490
    if(iCountAF >= 10)
    {
        iFirst = iCountAF / 10;
        iSecond = int(float(iCountAF) % float(10));
    }
    // End:0x4a2
    else
    {
        iFirst = 0;
        iSecond = iCountAF;
    }
    // End:0x4ad
    if(iFirst > 0)
    {
    }
    CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsRoundWinAF, 50.0, 70.0, iSecond, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    DigitsRoundWinAF.OffsetX = default.DigitsRoundWinAF.OffsetX;
    // End:0x5ad
    if(Level.GRI.Teams[1].TeamIndex == iTeamIndex)
    {
        C.SetDrawColor(byte(255), 150, 0, byte(255));
    }
    // End:0x5cc
    else
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x5ff
    if(iCountRSA >= 10)
    {
        iFirst = iCountRSA / 10;
        iSecond = int(float(iCountRSA) % float(10));
    }
    // End:0x611
    else
    {
        iFirst = 0;
        iSecond = iCountRSA;
    }
    // End:0x61c
    if(iFirst > 0)
    {
    }
    CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsRoundWinRSA, 50.0, 70.0, iSecond, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WCompareSign.OffsetX = 793;
    WCompareSign.OffsetY = 574;
    CalculateCoordinateEx(C, WCompareSign, 14.0, 55.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WCompareSign.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    bMessageDraw = false;
}

function DrawRoundResult(Canvas C, int ScoringTeam)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DisplayRoundResult(C, ScoringTeam);
}

function DrawMainTimer(Canvas C);
function DrawMainScore(Canvas C)
{
    local int _iPosX, _iPosY;
    local CalCoordsW calW;
    local int iScoreAF, iScoreRSA, iGoalScore, iFourth, iThird, iSecond,
	    iFirst, iWidth, iHeight, iCount, iTeamIndex;

    local float fX1, fX2, fY1, fY2;

    _iPosX = 557;
    _iPosY = 5;
    // End:0x8a
    if(HudOwner.PlayerOwner.PlayerReplicationInfo != none && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none)
    {
        iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0x91
    else
    {
        iTeamIndex = 0;
    }
    CalculateCoordinateEx(C, WTeamScoreBG, 598.0, 87.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamScoreBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iGoalScore = Level.GRI.GoalScore;
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    iWidth = 19;
    iHeight = 16;
    iGoalScore = Level.GRI.GoalScore;
    iFourth = iGoalScore / 1000;
    DigitsGoalScore[3].Value = iFourth;
    iGoalScore = int(float(iGoalScore) % float(1000));
    iThird = iGoalScore / 100;
    DigitsGoalScore[2].Value = iThird;
    iSecond = int(float(iGoalScore) % float(100));
    iSecond = iSecond / 10;
    DigitsGoalScore[1].Value = iSecond;
    iSecond = int(float(iGoalScore) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsGoalScore[0].Value = iFirst;
    iCount = 0;
    J0x265:
    // End:0x381 [While If]
    if(iCount < 4)
    {
        DigitsGoalScore[iCount].OffsetX = default.DigitsGoalScore[iCount].OffsetX + _iPosX;
        DigitsGoalScore[iCount].OffsetY = default.DigitsGoalScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsGoalScore[iCount], float(iWidth), float(iHeight), DigitsGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
        goto J0x265;
    }
    iScoreAF = int(Level.GRI.Teams[0].Score);
    iScoreRSA = int(Level.GRI.Teams[1].Score);
    DrawMainScoreTeam(C, iScoreAF, iScoreRSA, _iPosX, _iPosY, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x575
    if(iTeamIndex == 0)
    {
        // End:0x4cc
        if(iScoreAF > iScoreRSA)
        {
            CalculateCoordinateEx(C, WNowAFTeamisWin, 80.0, 42.0, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WNowAFTeamisWin.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        // End:0x572
        else
        {
            // End:0x572
            if(iScoreAF < iScoreRSA)
            {
                CalculateCoordinateEx(C, WNowAFTeamisLose, 80.0, 42.0, calW);
                C.SetPos(calW.X1, calW.Y1);
                C.DrawTile(WNowAFTeamisLose.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
    }
    // End:0x6c4
    else
    {
        // End:0x61e
        if(iScoreAF > iScoreRSA)
        {
            CalculateCoordinateEx(C, WNowRSATeamisLose, 80.0, 42.0, calW);
            C.SetPos(calW.X1, calW.Y1);
            C.DrawTile(WNowRSATeamisLose.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        }
        // End:0x6c4
        else
        {
            // End:0x6c4
            if(iScoreAF < iScoreRSA)
            {
                CalculateCoordinateEx(C, WNowRSATeamisWin, 80.0, 42.0, calW);
                C.SetPos(calW.X1, calW.Y1);
                C.DrawTile(WNowRSATeamisWin.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            }
        }
    }
    iWidth = 13;
    iHeight = 18;
    iFourth = HudOwner.TimeMinutes / 10;
    iThird = int(float(HudOwner.TimeMinutes) % float(10));
    iSecond = HudOwner.TimeSeconds / 10;
    iFirst = int(float(HudOwner.TimeSeconds) % float(10));
    fX1 = 213.0 + float(_iPosX) * _reX;
    fY1 = 43.0 + float(_iPosY) * _reY;
    fX2 = 226.0 + float(_iPosX) * _reX;
    fY2 = 60.0 + float(_iPosY) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iFourth) $ string(iThird) $ ":" $ string(iSecond) $ string(iFirst), 1, 0.0, fY1, 1600.0 * _reX, fY2, int(float(17) * _reY));
}

function DrawMainScoreTeam(Canvas C, int iScoreAF, int iScoreRSA, int _iPosX, int _iPosY, CalCoordsW calW)
{
    local int iFourth, iThird, iSecond, iFirst, iWidth, iHeight,
	    iCount;

    iWidth = 25;
    iHeight = 22;
    iFourth = iScoreAF / 1000;
    DigitsAFScore[3].Value = iFourth;
    iScoreAF = int(float(iScoreAF) % float(1000));
    iThird = iScoreAF / 100;
    DigitsAFScore[2].Value = iThird;
    iSecond = int(float(iScoreAF) % float(100));
    iSecond = iSecond / 10;
    DigitsAFScore[1].Value = iSecond;
    iSecond = int(float(iScoreAF) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsAFScore[0].Value = iFirst;
    // End:0x1ea
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == Level.GRI.Teams[0].TeamIndex)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        CalculateCoordinateEx(C, WScoreTeamMarkAF, 32.0, 32.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WScoreTeamMarkAF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x203
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x20a:
    // End:0x326 [While If]
    if(iCount < 4)
    {
        DigitsAFScore[iCount].OffsetX = default.DigitsAFScore[iCount].OffsetX + _iPosX;
        DigitsAFScore[iCount].OffsetY = default.DigitsAFScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsAFScore[iCount], float(iWidth), float(iHeight), DigitsAFScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
        goto J0x20a;
    }
    iFourth = iScoreRSA / 1000;
    DigitsRSAScore[3].Value = iFourth;
    iScoreRSA = int(float(iScoreRSA) % float(1000));
    iThird = iScoreRSA / 100;
    DigitsRSAScore[2].Value = iThird;
    iSecond = int(float(iScoreRSA) % float(100));
    iSecond = iSecond / 10;
    DigitsRSAScore[1].Value = iSecond;
    iSecond = int(float(iScoreRSA) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsRSAScore[0].Value = iFirst;
    // End:0x500
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == Level.GRI.Teams[1].TeamIndex)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        CalculateCoordinateEx(C, WScoreTeamMarkRSA, 32.0, 32.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WScoreTeamMarkRSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x519
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x520:
    // End:0x63c [While If]
    if(iCount < 4)
    {
        DigitsRSAScore[iCount].OffsetX = default.DigitsRSAScore[iCount].OffsetX + _iPosX;
        DigitsRSAScore[iCount].OffsetY = default.DigitsRSAScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsRSAScore[iCount], float(iWidth), float(iHeight), DigitsRSAScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
        goto J0x520;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

simulated function bool InOrder(PlayerReplicationInfo P1, PlayerReplicationInfo P2)
{
    // End:0x2e
    if(P1.bOnlySpectator)
    {
        // End:0x29
        if(P2.bOnlySpectator)
        {
            return true;
        }
        // End:0x2b
        else
        {
            return false;
        }
    }
    // End:0x42
    else
    {
        // End:0x42
        if(P2.bOnlySpectator)
        {
            return true;
        }
    }
    // End:0x68
    if(P1.Score < P2.Score)
    {
        return false;
    }
    // End:0x13a
    else
    {
        // End:0x13a
        if(P1.Score == P2.Score)
        {
            // End:0xaf
            if(P1.Kills < P2.Kills)
            {
                return false;
            }
            // End:0x13a
            else
            {
                // End:0x13a
                if(P1.Kills == P2.Kills)
                {
                    // End:0xf6
                    if(P1.Assists < P2.Assists)
                    {
                        return false;
                    }
                    // End:0x13a
                    else
                    {
                        // End:0x13a
                        if(P1.Assists == P2.Assists)
                        {
                            // End:0x13a
                            if(P1.Deaths > P2.Deaths)
                            {
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
    return true;
}

simulated function SortPRIArray()
{
    local int i, j;
    local PlayerReplicationInfo tmp;

    i = 0;
    J0x07:
    // End:0x136 [While If]
    if(i < Level.GRI.PRIArray.Length - 1)
    {
        j = i + 1;
        J0x3a:
        // End:0x12c [While If]
        if(j < Level.GRI.PRIArray.Length)
        {
            // End:0x122
            if(!InOrder(Level.GRI.PRIArray[i], Level.GRI.PRIArray[j]))
            {
                tmp = Level.GRI.PRIArray[i];
                Level.GRI.PRIArray[i] = Level.GRI.PRIArray[j];
                Level.GRI.PRIArray[j] = tmp;
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x3a;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function FFARankingSorting()
{
    local int lpPRI, Index;
    local PlayerReplicationInfo currPRI;
    local array<PlayerReplicationInfo> pris, prisReal;

    // End:0x47
    if(Level.GRI == none || Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        return;
    }
    SortPRIArray();
    Level.GRI.GetPRIArray(pris);
    lpPRI = 0;
    J0x71:
    // End:0x114 [While If]
    if(lpPRI < pris.Length)
    {
        currPRI = pris[lpPRI];
        // End:0xa7
        if(currPRI.bAdminSpecator)
        {
        }
        // End:0x10a
        else
        {
            // End:0xe1
            if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
            {
                PRI_Self = currPRI;
                Ranking_Self = lpPRI + 1;
            }
            Index = prisReal.Length;
            prisReal.Insert(Index, 1);
            prisReal[Index] = currPRI;
        }
        ++ lpPRI;
        // This is an implied JumpToken; Continue!
        goto J0x71;
    }
    // End:0x12d
    if(1 <= prisReal.Length)
    {
        PRI_1st = prisReal[0];
    }
    // End:0x147
    if(2 <= prisReal.Length)
    {
        PRI_2nd = prisReal[1];
    }
}

function DFRankingSorting()
{
    local int i;
    local array<PlayerReplicationInfo> pris;
    local PlayerReplicationInfo curPRI;

    SortPRIArray();
    i = 0;
    J0x0d:
    // End:0xe5 [While If]
    if(i < Level.GRI.PRIArray.Length)
    {
        curPRI = Level.GRI.PRIArray[i];
        // End:0x91
        if(!curPRI.IsConnected || curPRI.bAdminSpecator || curPRI.bBot)
        {
        }
        // End:0xdb
        else
        {
            pris[pris.Length] = curPRI;
            // End:0xdb
            if(curPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
            {
                PRI_Self = curPRI;
                Ranking_Self = pris.Length;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
    // End:0xfe
    if(1 <= pris.Length)
    {
        PRI_1st = pris[0];
    }
    // End:0x118
    if(2 <= pris.Length)
    {
        PRI_2nd = pris[1];
    }
}

function DrawFFAScore(Canvas C)
{
    local CalCoordsW calW;
    local int iGoalScore, iFourth, iThird, iSecond, iFirst, iWidth,
	    iHeight, iCount;

    local float fX1, fX2, fY1, fY2;
    local PlayerReplicationInfo currPRI1, currPRI2;
    local int _iPosX, _iPosY;

    _iPosX = 557;
    _iPosY = 5;
    CalculateCoordinateEx(C, WFFAScoreBG, 486.0, 71.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WFFAScoreBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iGoalScore = Level.GRI.GoalScore;
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    iWidth = 24;
    iHeight = 22;
    iGoalScore = Level.GRI.GoalScore;
    iThird = iGoalScore / 100;
    DigitsFFAGoalScore[2].Value = iThird;
    iSecond = int(float(iGoalScore) % float(100));
    iSecond = iSecond / 10;
    DigitsFFAGoalScore[1].Value = iSecond;
    iSecond = int(float(iGoalScore) % float(100));
    iFirst = int(float(iSecond) % float(10));
    DigitsFFAGoalScore[0].Value = iFirst;
    iCount = 0;
    J0x1aa:
    // End:0x2c6 [While If]
    if(iCount < 3)
    {
        DigitsFFAGoalScore[iCount].OffsetX = default.DigitsFFAGoalScore[iCount].OffsetX + _iPosX;
        DigitsFFAGoalScore[iCount].OffsetY = default.DigitsFFAGoalScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsFFAGoalScore[iCount], float(iWidth), float(iHeight), DigitsFFAGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
        goto J0x1aa;
    }
    iWidth = 13;
    iHeight = 18;
    iFourth = HudOwner.TimeMinutes / 10;
    iThird = int(float(HudOwner.TimeMinutes) % float(10));
    iSecond = HudOwner.TimeSeconds / 10;
    iFirst = int(float(HudOwner.TimeSeconds) % float(10));
    fX1 = 213.0 + float(_iPosX) * _reX;
    fY1 = 73.0 + float(_iPosY) * _reY;
    fX2 = 226.0 + float(_iPosX) * _reX;
    fY2 = 91.0 + float(_iPosY) * _reY;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iFourth) $ string(iThird) $ ":" $ string(iSecond) $ string(iFirst), 1, fX1, fY1, fX2, fY2, int(float(17) * _reY));
    // End:0x452
    if(PRI_Self != PRI_1st)
    {
        currPRI1 = PRI_1st;
        currPRI2 = PRI_Self;
    }
    // End:0x468
    else
    {
        currPRI1 = PRI_Self;
        currPRI2 = PRI_2nd;
    }
    DrawRankingInfo(C, currPRI1, float(_iPosX), float(_iPosY));
    DrawRankingInfo(C, currPRI2, float(_iPosX), float(_iPosY + 32));
    // End:0x4e1
    if(fSortingLastTime + 0.30 < Level.TimeSeconds)
    {
        fSortingLastTime = Level.TimeSeconds;
        FFARankingSorting();
    }
}

function DrawDFScore(Canvas C)
{
    local CalCoordsW calW;
    local PlayerReplicationInfo currPRI1, currPRI2;

    CalculateCoordinateEx(C, DFRankingBG, float(DFRankingBG.TextureCoords.X2), float(DFRankingBG.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(DFRankingBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0xd7
    if(PRI_Self != PRI_1st)
    {
        currPRI1 = PRI_1st;
        currPRI2 = PRI_Self;
    }
    // End:0xed
    else
    {
        currPRI1 = PRI_Self;
        currPRI2 = PRI_2nd;
    }
    DrawDFRankingInfo(C, currPRI1, float(DFRankingBG.OffsetX + 14), float(DFRankingBG.OffsetY + 20));
    DrawDFRankingInfo(C, currPRI2, float(DFRankingBG.OffsetX + 14), float(DFRankingBG.OffsetY + 55));
    // End:0x186
    if(fSortingLastTime + 0.30 < Level.TimeSeconds)
    {
        fSortingLastTime = Level.TimeSeconds;
        DFRankingSorting();
    }
}

function DrawDFRankingInfo(Canvas C, PlayerReplicationInfo PRI, float iPosX, float iPosY)
{
    local Material Mark, markClan;
    local wMatchUserInfo UserInfo;
    local Color TextColor;
    local string strTemp;
    local int iRanking, iFontSize, iScore, i;
    local float fX1, fX2, fY1, fY2;

    // End:0x0d
    if(PRI == none)
    {
        return;
    }
    // End:0x44
    if(PRI == PRI_Self)
    {
        TextColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x63
    else
    {
        TextColor = C.MakeColor(200, 200, 160, byte(255));
    }
    C.DrawColor = TextColor;
    iFontSize = int(float(15) * _reY);
    // End:0xa3
    if(PRI == PRI_1st)
    {
        iRanking = 1;
    }
    // End:0xc8
    else
    {
        // End:0xbd
        if(PRI == PRI_2nd)
        {
            iRanking = 2;
        }
        // End:0xc8
        else
        {
            iRanking = Ranking_Self;
        }
    }
    fX1 = iPosX * _reX;
    fY1 = iPosY * _reY;
    fX2 = iPosX + float(42) * _reX;
    fY2 = iPosY + float(32) * _reY;
    strTemp = string(iRanking) $ lsRanking;
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, fX1, fY1, fX2, fY2, iFontSize);
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(PRI.PlayerName);
    // End:0x291
    if(UserInfo != none && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x291
        if(markClan[2] == none)
        {
            markClan[0] = texture'ex_clanmark';
        }
    }
    fX1 = iPosX + float(44) * _reX;
    i = 0;
    J0x2b0:
    // End:0x35a [While If]
    if(i < 3)
    {
        // End:0x350
        if(markClan[i] != none)
        {
            C.SetPos(fX1, fY1);
            C.DrawTile(markClan[i], 32.0 * _reX, 32.0 * _reX, 0.0, 0.0, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2b0;
    }
    // End:0x37d
    if(PRI.ClassMark == none)
    {
        PRI.LoadLevelMark();
    }
    Mark = PRI.ClassMark;
    // End:0x445
    if(Mark != none)
    {
        fX1 = iPosX + float(77) * _reX;
        C.SetPos(fX1, fY1);
        C.DrawTile(Mark, 32.0 * _reX, 32.0 * _reX, PRI.ClassMarkBox.X1, PRI.ClassMarkBox.Y1, PRI.ClassMarkBox.X2, PRI.ClassMarkBox.Y2);
    }
    C.DrawColor = TextColor;
    fX1 = iPosX + float(119) * _reX;
    fX2 = fX1 + float(168) * _reX;
    C.BtrDrawTextJustifiedWithVolumeLine(PRI.PlayerName, 0, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = iPosX + float(295) * _reX;
    fX2 = fX1 + float(47) * _reX;
    iScore = int(PRI.Score);
    strTemp = string(iScore) $ lsScore;
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 1, fX1, fY1, fX2, fY2, iFontSize);
}

function DrawRankingInfo(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local Color TextColor;
    local CalCoordsW calW;

    // End:0x0d
    if(currPRI == none)
    {
        return;
    }
    // End:0xf3
    if(currPRI == PRI_Self)
    {
        WFFAScoreOverLayer.OffsetX = int(float(default.WFFAScoreOverLayer.OffsetX) + _iPosX);
        WFFAScoreOverLayer.OffsetY = int(float(default.WFFAScoreOverLayer.OffsetY) + _iPosY);
        CalculateCoordinateEx(C, WFFAScoreOverLayer, 375.0, 32.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WFFAScoreOverLayer.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    DrawRankingInfo_Mark(C, currPRI, _iPosX, _iPosY);
    TextColor = C.MakeColor(0, 0, 0, byte(255));
    DrawRankingInfo_Text(C, currPRI, _iPosX + float(1), _iPosY + float(1), TextColor);
    // End:0x18c
    if(currPRI == PRI_Self)
    {
        TextColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x1ab
    else
    {
        TextColor = C.MakeColor(200, 200, 160, byte(255));
    }
    DrawRankingInfo_Text(C, currPRI, _iPosX, _iPosY, TextColor);
}

function DrawRankingInfo_Mark(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local float markX1, markY1;
    local Material Mark, markClan;
    local wMatchUserInfo UserInfo;
    local int i;

    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x104
    if(UserInfo != none && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x104
        if(markClan[2] == none)
        {
            markClan[0] = texture'ex_clanmark';
        }
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    i = 0;
    J0x139:
    // End:0x255 [While If]
    if(i < 3)
    {
        // End:0x24b
        if(markClan[i] != none)
        {
            markX1 = 161.0 + _iPosX * ScreenRatioXEx * C.ClipX;
            markY1 = 4.0 + _iPosY * ScreenRatioYEx * C.ClipY;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], 32.0 * ScreenRatioXEx * C.ClipX, 32.0 * ScreenRatioYEx * C.ClipY, 0.0, 0.0, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x139;
    }
    // End:0x278
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x39a
    if(Mark != none)
    {
        markX1 = 195.0 + _iPosX * ScreenRatioXEx * C.ClipX;
        markY1 = 4.0 + _iPosY * ScreenRatioYEx * C.ClipY;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, 32.0 * ScreenRatioXEx * C.ClipX, 32.0 * ScreenRatioYEx * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
}

function DrawRankingInfo_Text(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY, Color FontColor)
{
    local int iRanking, iScore;
    local float fX1, fX2, fY1, fY2, iFontSize;

    C.DrawColor = FontColor;
    iFontSize = 15.0 * _reY;
    // End:0x3f
    if(currPRI == PRI_1st)
    {
        iRanking = 1;
    }
    // End:0x64
    else
    {
        // End:0x59
        if(currPRI == PRI_2nd)
        {
            iRanking = 2;
        }
        // End:0x64
        else
        {
            iRanking = Ranking_Self;
        }
    }
    fX1 = 110.0 + _iPosX * _reX;
    fY1 = 10.0 + _iPosY * _reY;
    fX2 = 120.0 + _iPosX * _reX;
    fY2 = 29.0 + _iPosY * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iRanking), 1, fX1, fY1, fX2, fY2, int(iFontSize));
    fX1 = 126.0 + _iPosX * _reX;
    fY1 = 10.0 + _iPosY * _reY;
    fX2 = 145.0 + _iPosX * _reX;
    fY2 = 29.0 + _iPosY * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(lsRanking, 1, fX1, fY1, fX2, fY2, int(iFontSize));
    fX1 = 249.0 + _iPosX * _reX;
    fY1 = 10.0 + _iPosY * _reY;
    fX2 = 406.0 + _iPosX * _reX;
    fY2 = 29.0 + _iPosY * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(currPRI.PlayerName, 0, fX1, fY1, fX2, fY2, int(iFontSize));
    iScore = int(currPRI.Score);
    fX1 = 419.0 + _iPosX * _reX;
    fY1 = 10.0 + _iPosY * _reY;
    fX2 = 429.0 + _iPosX * _reX;
    fY2 = 29.0 + _iPosY * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScore), 1, fX1, fY1, fX2, fY2, int(iFontSize));
    fX1 = 457.0 + _iPosX * _reX;
    fY1 = 10.0 + _iPosY * _reY;
    fX2 = 476.0 + _iPosX * _reX;
    fY2 = 29.0 + _iPosY * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(lsScore, 1, fX1, fY1, fX2, fY2, int(iFontSize));
}

function DrawTimerBomb(Canvas C, int Min, int sec)
{
    local CalCoordsW calW;
    local int iWidth, iHeight, iCount, iTempAdd;

    iTempAdd = 36;
    WTimerBombBG.OffsetY = default.WTimerBombBG.OffsetY + iTempAdd;
    CalculateCoordinateEx(C, WTimerBombBG, 240.0, 106.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTimerBombBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iWidth = 28;
    iHeight = 37;
    DigitsTime[3].Value = Min / 10;
    DigitsTime[2].Value = int(float(Min) % float(10));
    DigitsTime[1].Value = sec / 10;
    DigitsTime[0].Value = int(float(sec) % float(10));
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    iCount = 0;
    J0x153:
    // End:0x239 [While If]
    if(iCount < 4)
    {
        DigitsTime[iCount].OffsetY = 109 + iTempAdd;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid_Base, DigitsTime[iCount], float(iWidth), float(iHeight), DigitsTime[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid_Base.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        ++ iCount;
        // This is an implied JumpToken; Continue!
        goto J0x153;
    }
    WCompareSignMid.OffsetX = 823;
    WCompareSignMid.OffsetY = 109 + iTempAdd;
    CalculateCoordinateEx(C, WCompareSignMid, 10.0, 37.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WCompareSignMid.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawA(Canvas C)
{
    // End:0x42
    if(HudOwner == none || HudOwner.PlayerOwner == none || HudOwner.PlayerOwner.PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x5b
    if(!bUpdate)
    {
        UpdateHelpKeyControll();
        bUpdate = true;
    }
    // End:0x122
    if(Level.GRI.GameClass != "WMission.wSDGameInfo" && Level.GRI.GameClass != "WMission.wSBTGameInfo")
    {
        // End:0x122
        if(DMState != 3)
        {
            // End:0x117
            if(Level.GRI.GameClass == "WMission.wDefenceGameInfo")
            {
                DrawMessage_StartDefence(C);
            }
            // End:0x122
            else
            {
                DrawMessage_Start(C);
            }
        }
    }
    // End:0x148
    if(Level.GRI.bStopCountDown)
    {
        DrawSudenDeath(C);
    }
    // End:0x163
    if(DMState == 3)
    {
        DrawMessage_Go(C);
    }
    // End:0x177
    if(bDisplayEvent_Invincible)
    {
        DrawInvincibleGauge(C);
    }
    // End:0x1cb
    if(bDisplayEvent_CountDown)
    {
        iCountNumber = int(float(6) - Level.TimeSeconds - fBeginTimeCounDown);
        // End:0x1b6
        if(iCountNumber < 0)
        {
            bDisplayEvent_CountDown = false;
        }
        DrawCountDown(C, Clamp(iCountNumber, 1, 5));
    }
    DrawEvent_Item(C);
    DrawVehicleInfo(C);
    DrawWarningWeaponInfo(C);
}

function DrawSpectating(Canvas C)
{
    // End:0xfc
    if(Level.GRI != none)
    {
        // End:0x51
        if(Level.GRI.GameClass != "WMission.wSDGameInfo")
        {
            DisplayEvent_Respawn(C);
        }
        // End:0xd2
        if(HudOwner != none && Level.GetMatchMaker().isGMRoom == false)
        {
            // End:0xcf
            if(IsStartupMessage && HudOwner.PawnOwner == none || !HudOwner.PawnOwner.PlayerReplicationInfo.IsIntervented)
            {
                DrawMessage_Waiting(C);
            }
        }
        // End:0xfc
        else
        {
            // End:0xfc
            if(Level.GetMatchMaker().isGMRoom == true)
            {
                DrawMessage_WaitingCountGM(C);
            }
        }
    }
}

function DrawTeamScoreUseImage();
function DrawResultScore(Canvas C, bool Won)
{
    local SpriteWidget WTeamWinLose;
    local int i, iScoreRSA, iScoreAF, iFirst, iSecond, iThird,
	    iFourth, iScoreAFWidth, iScoreAFHeight, iScoreRSAWidth, iScoreRSAHeight,
	    iTeamIndex;

    local CalCoordsW calWAF, calWRSA, calWResutlText, calWBG, calWGraBG, calScoreAF,
	    calScoreRSA;

    local DigitSet DigitsNumResultAF, DigitsNumResultRSA;
    local array<NumericWidget> nwAFScore, nwRSAScore;

    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x116
    if(iTeamIndex == 0)
    {
        // End:0xbc
        if(Won)
        {
            WTeamWinLose = WWinTextAF;
            DigitsNumResultAF = WDigitsNumResultWin;
            DigitsNumResultRSA = WDigitsNumResultLose;
            nwAFScore = DigitsAFWinScore;
            nwRSAScore = DigitsRSALoseScore;
            iScoreAFWidth = 36;
            iScoreAFHeight = 51;
            iScoreRSAWidth = 30;
            iScoreRSAHeight = 41;
        }
        // End:0x113
        else
        {
            WTeamWinLose = WLoseTextAF;
            DigitsNumResultAF = WDigitsNumResultLose;
            DigitsNumResultRSA = WDigitsNumResultWin;
            nwAFScore = DigitsAFLoseScore;
            nwRSAScore = DigitsRSAWinScore;
            iScoreAFWidth = 30;
            iScoreAFHeight = 41;
            iScoreRSAWidth = 36;
            iScoreRSAHeight = 51;
        }
    }
    // End:0x1d0
    else
    {
        // End:0x179
        if(Won)
        {
            WTeamWinLose = WWinTextRSA;
            DigitsNumResultAF = WDigitsNumResultLose;
            DigitsNumResultRSA = WDigitsNumResultWin;
            nwAFScore = DigitsAFLoseScore;
            nwRSAScore = DigitsRSAWinScore;
            iScoreAFWidth = 30;
            iScoreAFHeight = 41;
            iScoreRSAWidth = 36;
            iScoreRSAHeight = 51;
        }
        // End:0x1d0
        else
        {
            WTeamWinLose = WLoseTextRSA;
            DigitsNumResultAF = WDigitsNumResultWin;
            DigitsNumResultRSA = WDigitsNumResultLose;
            nwAFScore = DigitsAFWinScore;
            nwRSAScore = DigitsRSALoseScore;
            iScoreAFWidth = 36;
            iScoreAFHeight = 51;
            iScoreRSAWidth = 30;
            iScoreRSAHeight = 41;
        }
    }
    iScoreAF = int(Level.GRI.Teams[0].Score);
    iScoreRSA = int(Level.GRI.Teams[1].Score);
    iFourth = iScoreAF / 1000;
    nwAFScore[3].Value = iFourth;
    iScoreAF = int(float(iScoreAF) % float(1000));
    iThird = iScoreAF / 100;
    nwAFScore[2].Value = iThird;
    iSecond = int(float(iScoreAF) % float(100));
    iSecond = iSecond / 10;
    nwAFScore[1].Value = iSecond;
    iSecond = int(float(iScoreAF) % float(100));
    iFirst = int(float(iSecond) % float(10));
    nwAFScore[0].Value = iFirst;
    iFourth = iScoreRSA / 1000;
    nwRSAScore[3].Value = iFourth;
    iScoreRSA = int(float(iScoreRSA) % float(1000));
    iThird = iScoreRSA / 100;
    nwRSAScore[2].Value = iThird;
    iSecond = int(float(iScoreRSA) % float(100));
    iSecond = iSecond / 10;
    nwRSAScore[1].Value = iSecond;
    iSecond = int(float(iScoreRSA) % float(100));
    iFirst = int(float(iSecond) % float(10));
    nwRSAScore[0].Value = iFirst;
    CalculateCoordinateEx(C, WRoundResultNewBG, 1600.0, 1200.0, calWBG);
    CalculateCoordinateEx(C, WRoundResultGradationBG, 610.0, 1024.0, calWGraBG);
    CalculateCoordinateEx(C, WTeamWinLose, 512.0, 165.0, calWResutlText);
    CalculateCoordinateEx(C, WResultTeamMarkAF, 207.0, 256.0, calWAF);
    CalculateCoordinateEx(C, WResultTeamMarkRSA, 207.0, 256.0, calWRSA);
    C.SetPos(calWBG.X1, calWBG.Y1);
    C.DrawTile(WRoundResultNewBG.WidgetTexture, calWBG.XL, calWBG.YL, calWBG.U, calWBG.V, calWBG.UL, calWBG.VL);
    C.SetPos(calWGraBG.X1, calWGraBG.Y1);
    C.DrawTile(WRoundResultGradationBG.WidgetTexture, calWGraBG.XL, calWGraBG.YL, calWGraBG.U, calWGraBG.V, calWGraBG.UL, calWGraBG.VL);
    C.SetPos(calWResutlText.X1, calWResutlText.Y1);
    C.DrawTile(WTeamWinLose.WidgetTexture, calWResutlText.XL, calWResutlText.YL, calWResutlText.U, calWResutlText.V, calWResutlText.UL, calWResutlText.VL);
    // End:0x896
    if(Level.GRI.GameClass != "WMission.wDefenceGameInfo")
    {
        C.SetPos(calWAF.X1, calWAF.Y1);
        C.DrawTile(WResultTeamMarkAF.WidgetTexture, calWAF.XL, calWAF.YL, calWAF.U, calWAF.V, calWAF.UL, calWAF.VL);
        C.SetPos(calWRSA.X1, calWRSA.Y1);
        C.DrawTile(WResultTeamMarkRSA.WidgetTexture, calWRSA.XL, calWRSA.YL, calWRSA.U, calWRSA.V, calWRSA.UL, calWRSA.VL);
        i = 0;
        J0x6f7:
        // End:0x7c3 [While If]
        if(i < 4)
        {
            CalculateCoordinateDigitEx(C, DigitsNumResultAF, nwAFScore[i], float(iScoreAFWidth), float(iScoreAFHeight), nwAFScore[i].Value, calScoreAF);
            C.SetPos(calScoreAF.X1, calScoreAF.Y1);
            C.DrawTile(DigitsNumResultAF.DigitTexture, calScoreAF.XL, calScoreAF.YL, calScoreAF.U, calScoreAF.V, calScoreAF.UL, calScoreAF.VL);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6f7;
        }
        i = 0;
        J0x7ca:
        // End:0x896 [While If]
        if(i < 4)
        {
            CalculateCoordinateDigitEx(C, DigitsNumResultRSA, nwRSAScore[i], float(iScoreRSAWidth), float(iScoreRSAHeight), nwRSAScore[i].Value, calScoreRSA);
            C.SetPos(calScoreRSA.X1, calScoreRSA.Y1);
            C.DrawTile(DigitsNumResultRSA.DigitTexture, calScoreRSA.XL, calScoreRSA.YL, calScoreRSA.U, calScoreRSA.V, calScoreRSA.UL, calScoreRSA.VL);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x7ca;
        }
    }
}

function DrawResultScore_FFA_Item(Canvas C, bool drawTop, PlayerReplicationInfo currPRI, wMatchUserInfo User, int lh, int currLH, int nextLH, Material medalMat, int Rank)
{
    local int i, UserLevel;
    local Material markClan[3];
    local FloatBox LvImgCoordi;

    // End:0x72
    if(drawTop)
    {
        C.SetPos(465.0 * _reX, 276.0 + float(currLH) * _reY);
        C.DrawTile(matLine, 668.0 * _reX, 1.0, 0.0, 0.0, 669.0, 1.0);
    }
    // End:0xed
    if(medalMat != none)
    {
        C.SetPos(515.0 * _reX, 278.0 + float(currLH) * _reY);
        C.DrawTile(medalMat, 56.0 * _reX, 49.0 * _reY, 0.0, 0.0, 56.0, 44.0);
    }
    // End:0x165
    if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
    {
        C.SetPos(0.0, 277.0 + float(currLH) * _reY);
        C.DrawTileStretched(matOn, 1599.0 * _reX, float(lh) * _reY);
    }
    // End:0x23c
    if(User != none && User.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(User.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(User.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(User.ClanMark).Image;
        // End:0x23c
        if(markClan[2] == none)
        {
            markClan[0] = texture'ex_clanmark';
        }
    }
    i = 0;
    J0x243:
    // End:0x304 [While If]
    if(i < 3)
    {
        // End:0x2fa
        if(markClan[i] != none)
        {
            C.SetPos(589.0 * _reX, 277.0 + float(currLH) * _reY);
            C.DrawTile(markClan[i], 49.0 * _reX, 49.0 * _reY, 0.0, 0.0, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x243;
    }
    C.SetPos(642.0 * _reX, 278.0 + float(currLH) * _reY);
    UserLevel = Level.GetMatchMaker().GetUserGradeByUserName(currPRI.PlayerName);
    tempMat = Level.GameMgr.GetLevelTexture(UserLevel, User.LevelMarkID);
    LvImgCoordi = Level.GameMgr.GetLevelImageCoordi(UserLevel, User.LevelMarkID);
    C.DrawTile(tempMat, 49.0 * _reX, 49.0 * _reY, LvImgCoordi.X1, LvImgCoordi.Y1, LvImgCoordi.X2, LvImgCoordi.Y2);
    C.BtrDrawTextJustifiedWithVolumeLine(currPRI.PlayerName, 0, 725.0 * _reX, 292.0 + float(currLH) * _reY, 890.0 * _reX, 313.0 + float(currLH) * _reY, int(float(16) * _reY));
    C.BtrDrawTextJustifiedWithVolumeLine(User.ClanName, 0, 917.0 * _reX, 292.0 + float(currLH) * _reY, 1082.0 * _reX, 313.0 + float(currLH) * _reY, int(float(16) * _reY));
    C.SetPos(465.0 * _reX, 276.0 + float(nextLH) * _reY);
    C.DrawTile(matLine, 668.0 * _reX, 1.0, 0.0, 0.0, 669.0, 1.0);
}

function DrawResultScore_FFA(Canvas C)
{
    local int lp1, i;
    local PlayerReplicationInfo currPRI;
    local array<PlayerReplicationInfo> pris;
    local wMatchUserInfo User;
    local int lh, currLH, nextLH;
    local bool drewMySelf;

    C.SetDrawColor(byte(255), byte(255), byte(255));
    lh = 53;
    C.SetPos(0.0, 251.0 * _reY);
    C.DrawTileStretched(matBack1, 1600.0 * _reX, 209.0 * _reY);
    i = 0;
    J0x76:
    // End:0xf9 [While If]
    if(i < Level.GRI.PRIArray.Length)
    {
        currPRI = Level.GRI.PRIArray[i];
        // End:0xdd
        if(currPRI == none || currPRI.bAdminSpecator)
        {
        }
        // End:0xef
        else
        {
            pris[pris.Length] = currPRI;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x76;
    }
    lp1 = 0;
    J0x100:
    // End:0x1f3 [While If]
    if(lp1 < 3)
    {
        // End:0x1e9
        if(pris.Length > lp1)
        {
            currPRI = pris[lp1];
            // End:0x156
            if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
            {
                drewMySelf = true;
            }
            currLH = lh * lp1;
            nextLH = lh * lp1 + 1;
            User = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
            DrawResultScore_FFA_Item(C, lp1 == 0, currPRI, User, lh, currLH, nextLH, Medals[lp1], lp1 + 1);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x100;
    }
    // End:0x331
    if(!drewMySelf && !HudOwner.PlayerOwner.PlayerReplicationInfo.bAdminSpecator)
    {
        lp1 = 3;
        J0x22e:
        // End:0x272 [While If]
        if(lp1 < pris.Length)
        {
            // End:0x268
            if(pris[lp1] == HudOwner.PlayerOwner.PlayerReplicationInfo)
            {
            }
            // End:0x272
            else
            {
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x22e;
            }
        }
        C.SetPos(0.0, 517.0 * _reY);
        C.DrawTileStretched(matBack1, 1599.0 * _reX, 102.0 * _reY);
        currPRI = pris[lp1];
        User = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
        DrawResultScore_FFA_Item(C, true, currPRI, User, lh, 265, 265 + lh, none, lp1 + 1);
    }
}

function DrawMessage_BeginMission(Canvas C, int iRound, bool bChangeAttackTeam, int iAttackTeam, int iElapsedTime)
{
    local float fDeltaTime, fFadeOut;
    local int iAlpha;
    local wMatchMaker MM;

    // End:0x42
    if(HudOwner == none || HudOwner.PlayerOwner == none || HudOwner.PlayerOwner.PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x6a
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team == none)
    {
        return;
    }
    // End:0x2e9
    if(Level.GRI.GameClass == "WMission.wSDGameInfo" || Level.GRI.GameClass == "WMission.wSBTGameInfo" || Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
    {
        // End:0x10c
        if(iElapsedTime < 0)
        {
            return;
        }
        // End:0x176
        if(HudOwner.PlayerOwner.PlayerReplicationInfo.IsIntervented && !bIsDraw_Intrusion)
        {
            // End:0x174
            if(Level.GRI.RoundState == 2)
            {
                DisplayMessage_Mission_Intrusion(C, iAttackTeam, iRound);
            }
            return;
        }
        // End:0x192
        if(iRound_Instrusion == iRound && bIsDraw_Intrusion)
        {
            return;
        }
        // End:0x1ac
        if(float(iElapsedTime) > fMessageDrawTime + fFadeOutTime)
        {
            return;
        }
        // End:0x1cd
        if(false == bMessageDraw || 0 == iElapsedTime)
        {
            bMessageDraw = true;
        }
        // End:0x1df
        if(DMState != 2)
        {
            return;
        }
        fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
        // End:0x212
        if(fDeltaTime > fMessageDrawTime + fFadeOutTime)
        {
            return;
        }
        // End:0x22f
        if(fDeltaTime < fMessageDrawTime)
        {
            fFadeOut = 1.0;
        }
        // End:0x24f
        else
        {
            fFadeOut = 1.0 - fDeltaTime - fMessageDrawTime / fFadeOutTime;
        }
        iAlpha = int(float(255) * fFadeOut);
        // End:0x280
        if(float(iAlpha) < MinAlpha)
        {
            iAlpha = int(MinAlpha);
        }
        // End:0x2b0
        if(0 != iRound && !bChangeAttackTeam)
        {
            DisplayMessage_Mission(C, iAttackTeam, iAlpha);
        }
        // End:0x2db
        else
        {
            // End:0x2db
            if(1 < iRound && bChangeAttackTeam)
            {
                DisplayMessaage_Round(C, iAttackTeam, iAlpha);
            }
        }
        CurrentRound = iRound;
    }
    // End:0x3a8
    else
    {
        // End:0x3a8
        if(Level.GRI.GameClass == "WMission.wDefenceGameInfo")
        {
            CurrentRound = iRound;
            // End:0x3a8
            if(bMessageDraw == true && wDefenceGradeList.Length == 0 && CurrentRound != 0)
            {
                MM = Level.GetMatchMaker();
                Level.GameMgr.GetDefenceGameBotGradeList2(MM.BotDifficulty - 1, mapInfo.MapID, CurrentRound, wDefenceGradeList);
            }
        }
    }
}

function DrawTileByMaterial(Canvas C, Material mat, int iAlpha, float fUL, float fVL, optional float fScale)
{
    local float X, Y, XL, YL;

    // End:0x0d
    if(mat == none)
    {
        return;
    }
    // End:0x27
    if(fScale == 0.0)
    {
        fScale = 1.0;
    }
    XL = float(mat.MaterialUSize()) * _reX * fScale;
    YL = float(mat.MaterialVSize()) * _reY * fScale;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    X = fUL * _reX;
    Y = fVL * _reY;
    C.SetPos(X, Y);
    C.DrawTile(mat, XL, YL, 0.0, 0.0, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
}

function DrawWeaponChange(Canvas C)
{
    local CalCoordsW calW;
    local Material mat;
    local float X1, Y1, X2, Y2, PosX, PosY;

    PosX = 595.0;
    PosY = 648.0;
    WHudBGR.OffsetX = int(PosX);
    WHudBGR.OffsetY = int(PosY);
    CalculateCoordinateEx(C, WHudBGR, 410.0, 80.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WKeyButtonBG.OffsetX = int(PosX + float(65));
    WKeyButtonBG.OffsetY = int(PosY + float(20));
    CalculateCoordinateEx(C, WKeyButtonBG, 42.0, 42.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WKeyButtonBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x295
    if(HudCDeathmatch(HudOwner).bBlinkState)
    {
        WKeyButtonBGBlink.OffsetX = int(PosX + float(63));
        WKeyButtonBGBlink.OffsetY = int(PosY + float(18));
        CalculateCoordinateEx(C, WKeyButtonBGBlink, 45.0, 45.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    X1 = PosX + 70.0 * _reX;
    Y1 = PosY + 25.0 * _reY;
    X2 = PosX + 101.0 * _reX;
    Y2 = PosY + 48.0 * _reY;
    C.SetDrawColor(0, 0, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(skeyUseKey, 1, X1, Y1, X2, Y2, int(float(FontSizeKey) * _reY));
    mat = Material(DynamicLoadObject(HudOwner.PawnOwner.kPendingWPick.ResParams.default.szIcon_HUD, class'Material'));
    DrawTileByMaterial(C, mat, 255, PosX + float(77), PosY, 1.30);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    X1 = PosX + float(100) * _reX;
    Y1 = PosY + 58.0 * _reY;
    X2 = PosX + 292.0 * _reX;
    Y2 = PosY + 78.0 * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(HudOwner.PawnOwner.kPendingWPick.BaseParams.strName, 1, X1, Y1, X2, Y2, int(float(15) * _reY));
}

function DrawVehicleInfo(Canvas C)
{
    local CalCoordsW calW;
    local float X1, Y1, X2, Y2;
    local Vehicle EntryVehicle, DrivenVehicle, ActiveVehicle;
    local string szWeaponName;
    local Material mat;

    // End:0x1f
    if(HudOwner.PlayerOwner.Pawn == none)
    {
        return;
    }
    DrivenVehicle = Vehicle(HudOwner.PlayerOwner.Pawn);
    // End:0x72
    if(DrivenVehicle == none)
    {
        EntryVehicle = HudOwner.PlayerOwner.Pawn.EntryVehicle;
    }
    // End:0x8c
    if(DrivenVehicle == none && EntryVehicle == none)
    {
        return;
    }
    // End:0xa5
    if(DrivenVehicle != none)
    {
        ActiveVehicle = DrivenVehicle;
    }
    // End:0xbb
    else
    {
        // End:0xbb
        if(EntryVehicle != none)
        {
            ActiveVehicle = EntryVehicle;
        }
    }
    // End:0x101
    if(wTurret_FNM240(ActiveVehicle) != none)
    {
        szWeaponName = "Warfare_UI_Item.HUDIcon.Item_HUD_WP_HW_M249";
    }
    // End:0x103
    else
    {
        return;
    }
    WHudBGR.OffsetX = 544;
    WHudBGR.OffsetY = 842;
    CalculateCoordinateEx(C, WHudBGR, 511.0, 100.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WKeyButtonBG.OffsetX = 621;
    WKeyButtonBG.OffsetY = 863;
    CalculateCoordinateEx(C, WKeyButtonBG, 52.0, 52.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WKeyButtonBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x35e
    if(HudCDeathmatch(HudOwner).bBlinkState)
    {
        WKeyButtonBGBlink.OffsetX = 619;
        WKeyButtonBGBlink.OffsetY = 861;
        CalculateCoordinateEx(C, WKeyButtonBGBlink, 56.0, 56.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    X1 = float(WKeyButtonBG.OffsetX) + 7.0 * _reX;
    Y1 = float(WKeyButtonBG.OffsetY) + 7.0 * _reY;
    X2 = float(WKeyButtonBG.OffsetX) + 45.0 * _reX;
    Y2 = float(WKeyButtonBG.OffsetY) + 35.0 * _reY;
    C.SetDrawColor(0, 0, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(skeyUseKey, 1, X1, Y1, X2, Y2, int(float(FontSizeKey) * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    mat = Material(DynamicLoadObject(szWeaponName, class'Material'));
    DrawTileByMaterial(C, mat, 255, 640.0, 844.0, 1.50);
    mat = texture'img_HUD_text';
    // End:0x50c
    if(DrivenVehicle != none)
    {
        C.SetPos(742.0 * _reX, 907.0 * _reY);
        C.DrawTile(mat, 200.0 * _reX, 32.0 * _reY, 139.0, 880.0, 200.0, 32.0);
    }
    // End:0x57e
    else
    {
        // End:0x57e
        if(EntryVehicle != none)
        {
            C.SetPos(773.0 * _reX, 907.0 * _reY);
            C.DrawTile(mat, 139.0 * _reX, 32.0 * _reY, 0.0, 880.0, 139.0, 32.0);
        }
    }
}

function ResetState()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x2f [While If]
    if(i < 16)
    {
        Displaying_State[i + 1] = 0;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function DrawWarningWeaponInfo(Canvas C)
{
    local float fCurAmmoRatio, fMaxAmmoRatio;
    local int X1, X2, Y1, Y2, iCurAmmo, iCurAmmo2,
	    iMagazine, iMax, iWeaponGroup;

    local CalCoordsW calW;

    C.Style = 5;
    // End:0x58
    if(HudOwner.PlayerOwner.Pawn == none || HudOwner.PlayerOwner.Pawn.Weapon == none)
    {
        return;
    }
    iWeaponGroup = HudOwner.PlayerOwner.Pawn.Weapon.BaseParams.iInventoryGroup;
    // End:0xab
    if(iWeaponGroup != 1 && iWeaponGroup != 2)
    {
        return;
    }
    iCurAmmo = int(HudCDeathmatch(HudOwner).CurAmmoPrimary);
    iCurAmmo2 = int(HudCDeathmatch(HudOwner).MaxAmmoPrimary + float(iCurAmmo));
    iMagazine = HudOwner.PlayerOwner.Pawn.Weapon.BaseParams.iAmmo_Magazine;
    iMax = HudOwner.PlayerOwner.Pawn.Weapon.BaseParams.iAmmo_Initial;
    fCurAmmoRatio = float(iCurAmmo) / float(iMagazine);
    // End:0x198
    if(iCurAmmo2 <= iMagazine)
    {
        fMaxAmmoRatio = float(iCurAmmo2) / float(iMagazine);
    }
    // End:0x1a3
    else
    {
        fMaxAmmoRatio = 1.0;
    }
    // End:0x3c1
    if(fCurAmmoRatio <= 0.330 && fMaxAmmoRatio > 0.330)
    {
        WHudBGR.OffsetX = 672;
        WHudBGR.OffsetY = 970;
        CalculateCoordinateEx(C, WHudBGR, 256.0, 28.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        CalculateCoordinateEx(C, HelpKeyButtonReload, WidthReload, 26.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        HelpKeyButtonReload.OffsetY = 971;
        C.DrawTile(HelpKeyButtonReload.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        X1 = int(float(765) * _reX);
        Y1 = int(float(972) * _reY);
        X2 = int(float(871) * _reX);
        Y2 = int(float(996) * _reY);
        C.BtrDrawTextJustifiedWithVolumeLine(LsReload @ string(iCurAmmo), 1, float(X1), float(Y1), float(X2), float(Y2), int(float(18) * _reY));
    }
    // End:0x542
    if(fMaxAmmoRatio <= 0.330)
    {
        WHudBGR.OffsetX = 672;
        WHudBGR.OffsetY = 960;
        CalculateCoordinateEx(C, WHudBGR, 256.0, 28.0, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        X1 = int(float(741) * _reX);
        Y1 = int(float(972) * _reY);
        X2 = int(float(859) * _reX);
        Y2 = int(float(996) * _reY);
        C.SetDrawColor(byte(255), 0, 0, byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine(LsWarningAmmo @ string(iCurAmmo2), 1, float(X1), float(Y1), float(X2), float(Y2), int(float(18) * _reY));
    }
}

function DrawHostChange(Canvas C)
{
    local string Host, Msg;
    local int lp1;

    DrawHelpBG(C,, 382,, 164);
    C.SetDrawColor(byte(255), 126, 1, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MessageChangingHost, 1, 681.250 * _reX, 407.81250 * _reY, 920.31250 * _reX, 446.8750 * _reY, int(float(25) * _reY));
    lp1 = 0;
    J0x89:
    // End:0x177 [While If]
    if(lp1 < Level.GetMatchMaker().UserInfos.Length)
    {
        Log("UID=" $ string(Level.GetMatchMaker().UserInfos[lp1].UID) $ " Name=" $ Level.GetMatchMaker().UserInfos[lp1].UserName);
        // End:0x16d
        if(Level.GetMatchMaker().UserInfos[lp1].IsHost)
        {
            Host = Level.GetMatchMaker().UserInfos[lp1].UserName;
        }
        // End:0x177
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x89;
        }
    }
    Msg = MessageChangingHostPre $ "[" $ Host $ "]";
    C.BtrDrawTextJustifiedWithVolumeLine(Msg, 1, 614.06250 * _reX, 471.8750 * _reY, 985.93750 * _reX, 500.0 * _reY, int(float(18) * _reY));
    C.SetDrawColor(215, 0, 13, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MessageChangingHostPlzWait, 1, 500.0 * _reX, 504.68750 * _reY, 1100.0 * _reX, 526.56250 * _reY, int(float(13) * _reY));
}

function DisPlayEvent_SudenDeath()
{
    fBeginDrawTime_SudenDeath = Level.TimeSeconds;
}

function DrawSudenDeath(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fFadeOut;
    local int iAlpha;

    fDeltaTime = Level.TimeSeconds - fBeginDrawTime_SudenDeath;
    // End:0x33
    if(fDeltaTime > fMessageDrawTime + fFadeOutTime)
    {
        return;
    }
    // End:0x42
    if(fBeginDrawTime_SudenDeath <= float(0))
    {
        return;
    }
    // End:0x5f
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0;
    }
    // End:0x7f
    else
    {
        fFadeOut = 1.0 - fDeltaTime - fMessageDrawTime / fFadeOutTime;
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0xb0
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    CalculateCoordinateEx(C, WTxtSudenDeath, 256.0, 64.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTxtSudenDeath.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DisplayEvent_GainPoint(int iPoint);
function DrawPlusPoint(Canvas C, int iPoint, int iPosX, int iPosY, int iAlpha, optional int iEffectState, optional float fScale)
{
    local CalCoordsW calW;
    local float fWidth, fHeight, CenterX, CenterY, fAllWidth, fAllWidthHalf,
	    fHeightHalf;

    DigitsNumberPlus.Value = 10;
    DigitsNumberSecond.Value = iPoint / 10;
    DigitsNumberFirst.Value = int(float(iPoint) % float(10));
    fWidth = 38.0;
    fHeight = 31.0;
    fAllWidth = 38.0 * float(3);
    fAllWidthHalf = fAllWidth * 0.50 * fScale;
    fHeightHalf = fHeight * 0.50 * fScale;
    CenterX = float(iPosX) + fWidth * 0.50;
    CenterY = float(iPosY) + fHeight * 0.50;
    DigitsNumberPlus.OffsetX = int(CenterX - fAllWidthHalf);
    DigitsNumberPlus.OffsetY = int(CenterY - fHeightHalf);
    DigitsNumberSecond.OffsetX = int(float(DigitsNumberPlus.OffsetX) + fWidth);
    DigitsNumberSecond.OffsetY = DigitsNumberPlus.OffsetY;
    DigitsNumberFirst.OffsetX = int(float(DigitsNumberSecond.OffsetX) + fWidth);
    DigitsNumberFirst.OffsetY = DigitsNumberPlus.OffsetY;
    CalculateCoordinateDigitEx(C, WDigitsNumberBroadBig, DigitsNumberPlus, fWidth * fScale, fHeight * fScale, DigitsNumberPlus.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBroadBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateDigitEx(C, WDigitsNumberBroadBig, DigitsNumberFirst, fWidth * fScale, fHeight * fScale, DigitsNumberFirst.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBroadBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateDigitEx(C, WDigitsNumberBroadBig, DigitsNumberSecond, fWidth * fScale, fHeight * fScale, DigitsNumberSecond.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBroadBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
}

function DisplayEvent_BattleExplain()
{
    fBeginDrawTime_BattleExplain = Level.TimeSeconds;
}

function DisplayEvent_GameMode(string Message)
{
    fBeginDrawTime_GameMode = Level.TimeSeconds;
    sMessageGameMode = Message;
}

function SetBombObjectIndex(int objectIndex)
{
    // End:0x17
    if(iGameObjectIndex != objectIndex)
    {
        bChangeMessgeGameMode = true;
    }
    iGameObjectIndex = objectIndex;
}

function DrawGameMode(Canvas C)
{
    local float X1, X2, Y1, Y2, fWidth, fHeight;

    local int i, iLen, iFontSize;
    local string preMessage;
    local float fCenterAlignX;

    preMessage = sMessageGameMode;
    sMessageGameMode = GetMessageGameMode();
    iFontSize = 17;
    iLen = Len(sMessageGameMode);
    // End:0x39
    if(iLen <= 0)
    {
        return;
    }
    C.BtrTextSize(sMessageGameMode, iFontSize, fWidth, fHeight);
    fCenterAlignX = C.ClipX * 0.50 - fWidth * _reX * 0.50;
    i = 0;
    J0x93:
    // End:0xe9 [While If]
    if(i < 3)
    {
        // End:0xb3
        if(mGameMode[i] == none)
        {
        }
        // End:0xdf
        else
        {
            fCenterAlignX -= float(mGameMode[i].MaterialUSize()) * 0.50 * _reX;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x93;
    }
    Y1 = 65.0 * _reY;
    i = 2;
    J0x103:
    // End:0x1f5 [While If]
    if(i >= 0)
    {
        // End:0x122
        if(mGameMode[i] == none)
        {
        }
        // End:0x1eb
        else
        {
            X1 = fCenterAlignX;
            X2 = float(mGameMode[i].MaterialUSize()) * _reX;
            C.SetPos(X1, Y1);
            C.DrawTile(mGameMode[i], X2, float(mGameMode[i].MaterialVSize()) * _reY, 0.0, 0.0, float(mGameMode[i].MaterialUSize()), float(mGameMode[i].MaterialVSize()));
            fCenterAlignX += X2;
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x103;
    }
    X1 = fCenterAlignX;
    Y1 = 71.0 * _reY;
    X2 = fCenterAlignX + fWidth;
    Y2 = 95.0 * _reY;
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sMessageGameMode, 0, X1, Y1, X2, Y2, int(float(iFontSize) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DisplayEvent_SetDrawGameMessage(bool bMode, bool bSystem)
{
    IsDrawModeMessage = bMode;
    IsDrawSystemMessage = bSystem;
}

function string GetMessageGameMode(optional out Material mat)
{
    local string Message;

    switch(Level.GRI.GameClass)
    {
        // End:0x42
        case "WMission.wDOMGameInfo":
            Message = GetMessageGameMode_DOM();
            // End:0x96
            break;
        // End:0x6a
        case "WMission.wSDGameInfo":
            Message = GetMessageGameMode_SD();
            // End:0x96
            break;
        // End:0x93
        case "WMission.wSBTGameInfo":
            Message = GetMessageGameMode_SBT();
            // End:0x96
            break;
        // End:0xffff
        default:
            // End:0xce
            if(Level.GetMatchMaker().kGame_GameMode == class'wGameSettings'.static.GetModeIndex_DOA())
            {
                Message = GetMessageGameMode_DOA();
            }
            return Message;
    }
}

function string GetMessageGameMode_TD()
{
    local string Message;

    Message = class'wMessage_Game_Mode'.static.GetString(class'wMessage_Game_Mode'.default.Code_GameMode_TD);
    // End:0x32
    if(Message != sMessageGameMode)
    {
    }
    return Message;
}

function string GetMessageGameMode_DOM()
{
    local string Message;

    Message = class'wMessage_Game_Mode'.static.GetString(class'wMessage_Game_Mode'.default.Code_GameMode_DOM);
    return Message;
}

function SetMessageGameMode_DOM(Material matA, Material matB, Material matC)
{
    mGameMode[0] = matC;
    mGameMode[1] = matB;
    mGameMode[2] = matA;
}

function string GetMessageGameMode_DOA()
{
    return class'wMessage_Game_Mode'.static.GetString(class'wMessage_Game_Mode'.default.Code_GameMode_DOA);
}

function string GetMessageGameMode_SD()
{
    local string Message;
    local int iTeamIndex, iCode;

    // End:0x3f
    if(Level.GRI == none || HudOwner.PlayerOwner.PlayerReplicationInfo.Team == none)
    {
        return "";
    }
    // End:0xc3
    if(HudOwner.PlayerOwner.ViewTarget != none && Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        iTeamIndex = Pawn(HudOwner.PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0xf2
    else
    {
        iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0x36e
    if(Level.GRI.CurrentAttackingTeam == iTeamIndex)
    {
        // End:0x282
        if(Level.GRI.bObjectivePlanted)
        {
            iCode = class'wMessage_Game_Mode'.default.Code_SBTAllyBombPlanted;
            Message = class'wMessage_Game_Mode'.static.GetString(iCode);
            // End:0x27f
            if(Message != "" && bChangeMessgeGameMode)
            {
                switch(iGameObjectIndex)
                {
                    // End:0x1ca
                    case 0:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", class'Material'));
                        // End:0x26e
                        break;
                    // End:0x21a
                    case 1:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_b", class'Material'));
                        // End:0x26e
                        break;
                    // End:0x26b
                    case 2:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_c", class'Material'));
                        // End:0x26e
                        break;
                    // End:0xffff
                    default:
                        mGameMode[1] = none;
                        bChangeMessgeGameMode = false;
                    }
                    // This is an implied JumpToken;
                    goto J0x36b;
                }
                iCode = class'wMessage_Game_Mode'.default.Code_GameMode_SDAttack;
                Message = class'wMessage_Game_Mode'.static.GetString(iCode);
                // End:0x36b
                if(Message != "" && Message != sMessageGameMode)
                {
                    mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_b", class'Material'));
                    mGameMode[1] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_a", class'Material'));
                    bChangeMessgeGameMode = false;
                }
                J0x36b:
            }
            // End:0x5c8
            else
            {
                // End:0x4e3
                if(Level.GRI.bObjectivePlanted)
                {
                    iCode = class'wMessage_Game_Mode'.default.Code_SDEnemyBombPlanted;
                    Message = class'wMessage_Game_Mode'.static.GetString(iCode);
                    // End:0x4e0
                    if(Message != "" && bChangeMessgeGameMode)
                    {
                        switch(iGameObjectIndex)
                        {
                            // End:0x427
                            case 0:
                                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_a", class'Material'));
                                // End:0x4cf
                                break;
                            // End:0x479
                            case 1:
                                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_b", class'Material'));
                                // End:0x4cf
                                break;
                            // End:0x4cc
                            case 2:
                                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_c", class'Material'));
                                // End:0x4cf
                                break;
                            // End:0xffff
                            default:
                                mGameMode[1] = none;
                                bChangeMessgeGameMode = false;
                            }
                            // This is an implied JumpToken;
                            goto J0x5c8;
                        }
                        iCode = class'wMessage_Game_Mode'.default.Code_GameMode_SDDefense;
                        Message = class'wMessage_Game_Mode'.static.GetString(iCode);
                        // End:0x5c8
                        if(Message != "" && Message != sMessageGameMode)
                        {
                            mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_b", class'Material'));
                            mGameMode[1] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", class'Material'));
                            bChangeMessgeGameMode = false;
                        }
                    }
                    return Message;
}

function string GetMessageGameMode_SBT()
{
    local string Message;
    local int iTeamIndex, iCode;

    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    // End:0xd6
    if(Level.GRI.CurrentAttackingTeam == iTeamIndex)
    {
        // End:0x82
        if(Level.GRI.bObjectivePlanted)
        {
            iCode = class'wMessage_Game_Mode'.default.Code_SBTAllyBombPlanted;
        }
        // End:0xd3
        else
        {
            // End:0xbf
            if(HudOwner.PlayerOwner.PlayerReplicationInfo.HasFlag != none)
            {
                iCode = class'wMessage_Game_Mode'.default.Code_GameMode_SDAttack;
            }
            // End:0xd3
            else
            {
                iCode = class'wMessage_Game_Mode'.default.Code_GameMode_SBT;
            }
        }
    }
    // End:0x16f
    else
    {
        // End:0x108
        if(Level.GRI.bObjectivePlanted)
        {
            iCode = class'wMessage_Game_Mode'.default.Code_SBTEnemyBombPlanted;
        }
        // End:0x16f
        else
        {
            // End:0x15b
            if(Level.GRI.CurrentAttackingTeam != 0 && Level.GRI.CurrentAttackingTeam != 1)
            {
                iCode = class'wMessage_Game_Mode'.default.Code_GameMode_SBTGetBomb;
            }
            // End:0x16f
            else
            {
                iCode = class'wMessage_Game_Mode'.default.Code_GameMode_SDDefense;
            }
        }
    }
    Message = class'wMessage_Game_Mode'.static.GetString(iCode);
    // End:0x38f
    if(Message != sMessageGameMode)
    {
        switch(iCode)
        {
            // End:0x1f7
            case class'wMessage_Game_Mode'.default.Code_GameMode_SBTGetBomb:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb", class'Material'));
                // End:0x38f
                break;
            // End:0x251
            case class'wMessage_Game_Mode'.default.Code_GameMode_SBT:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb_1", class'Material'));
                // End:0x38f
                break;
            // End:0x262
            case class'wMessage_Game_Mode'.default.Code_GameMode_SDAttack:
            // End:0x2c1
            case class'wMessage_Game_Mode'.default.Code_SBTEnemyBombPlanted:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_a", class'Material'));
                // End:0x38f
                break;
            // End:0x2d2
            case class'wMessage_Game_Mode'.default.Code_SBTAllyBombPlanted:
            // End:0x32f
            case class'wMessage_Game_Mode'.default.Code_GameMode_SBTGetBomb:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", class'Material'));
                // End:0x38f
                break;
            // End:0x38c
            case class'wMessage_Game_Mode'.default.Code_GameMode_SDDefense:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", class'Material'));
                // End:0x38f
                break;
            // End:0xffff
            default:
            }
            return Message;
}

function string GetMessageGameMode_FFA()
{
    local string Message;

    Message = class'wMessage_Game_Mode'.static.GetString(class'wMessage_Game_Mode'.default.Code_GameMode_FFA);
    // End:0x76
    if(Message != sMessageGameMode)
    {
        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb", class'Material'));
    }
    return Message;
}

function DrawGameNotice(Canvas C, string sGameNotice)
{
    local int FontSize, PresetIndex;
    local Color ShadowColor;

    DrawHelpBG(C,, 182,, 38);
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    FontSize = int(float(18) * _reY);
    PresetIndex = 4;
    ShadowColor = class'Canvas'.static.MakeColor(0, 0, 0, 180);
    class'BTCustomDrawHK'.static.DrawString(C, sGameNotice, 4, float(FontSize), 0.0, 189.0 * _reY, C.ClipX, 214.0 * _reY, ShadowColor, PresetIndex, false);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawMoveGameNotice(Canvas C, string sGameNotice, float fLifeTime)
{
    local int FontSize, PresetIndex;
    local Color ShadowColor;

    DrawHelpBG(C,, 182,, 38);
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    FontSize = int(float(18) * _reY);
    PresetIndex = 4;
    ShadowColor = class'Canvas'.static.MakeColor(0, 0, 0, 180);
    class'BTCustomDrawHK'.static.DrawString(C, sGameNotice, 3, float(FontSize), fLifeTime, 189.0 * _reY, C.ClipX, 214.0 * _reY, ShadowColor, PresetIndex, false);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function DrawAAS(Canvas C, string sAASNotice)
{
    local CalCoordsW calW;
    local int i, FontSize, PresetIndex;
    local Color ShadowColor;
    local string strText, sTemp;
    local array<string> sLineNotice;
    local float fWidth, fHeight, findWidth, tempH, textWidthLimit, beginY,
	    EndY, beginX, EndX;

    // End:0x0f
    if(Len(sAASNotice) <= 0)
    {
        return;
    }
    WHudBack3.OffsetX = 290;
    WHudBack3.OffsetY = 255;
    fWidth = 1000.0;
    fHeight = 72.0;
    FontSize = int(float(18) * _reY);
    textWidthLimit = fWidth - float(12 * 2) * _reX;
    strText = sAASNotice;
    C.BtrTextSize(strText, FontSize, findWidth, tempH);
    // End:0xdb
    if(findWidth < textWidthLimit)
    {
        sLineNotice.Length = sLineNotice.Length + 1;
        sLineNotice[sLineNotice.Length - 1] = strText;
        strText = "";
    }
    i = 0;
    J0xe2:
    // End:0x1da [While If]
    if(i < Len(strText))
    {
        sTemp = Mid(strText, 0, i);
        C.BtrTextSize(sTemp, FontSize, findWidth, tempH);
        // End:0x1d0
        if(findWidth >= textWidthLimit)
        {
            sLineNotice.Length = sLineNotice.Length + 1;
            sLineNotice[sLineNotice.Length - 1] = sTemp;
            strText = Mid(strText, i, Len(sAASNotice));
            C.BtrTextSize(strText, FontSize, findWidth, tempH);
            // End:0x1d0
            if(findWidth < textWidthLimit)
            {
                sLineNotice.Length = sLineNotice.Length + 1;
                sLineNotice[sLineNotice.Length - 1] = strText;
            }
            // End:0x1da
            else
            {
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xe2;
        }
    }
    fHeight = float(sLineNotice.Length * 30);
    CalculateCoordinateEx(C, WHudBack3, fWidth + float(30), fHeight, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTileStretched(WHudBack3.WidgetTexture, calW.XL, calW.YL);
    C.SetDrawColor(byte(255), 219, 53, byte(255));
    PresetIndex = 4;
    ShadowColor = class'Canvas'.static.MakeColor(0, 0, 0, 180);
    beginX = float(WHudBack3.OffsetX + 12) * _reX;
    EndX = beginX + fWidth - float(12) * _reX;
    // End:0x39d
    if(sLineNotice.Length > 1)
    {
        i = 0;
        J0x2f0:
        // End:0x39a [While If]
        if(i < sLineNotice.Length)
        {
            beginY = float(WHudBack3.OffsetY + 8) * _reY + float(i * 25) * _reY;
            EndY = beginY + float(25) * _reY;
            class'BTCustomDrawHK'.static.DrawString(C, sLineNotice[i], 0, float(FontSize), beginX, beginY, EndX, EndY, ShadowColor, PresetIndex, false);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2f0;
        }
    }
    // End:0x415
    else
    {
        beginY = float(WHudBack3.OffsetY + 8) * _reY;
        EndY = beginY + float(25) * _reY;
        class'BTCustomDrawHK'.static.DrawString(C, sLineNotice[0], 4, float(FontSize), beginX, beginY, EndX, EndY, ShadowColor, PresetIndex, false);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
}

function SetTimeConnectionInstability(bool bSet)
{
    local float fDeltaTime;

    bConnectionInstability = bSet;
    bDrawConnectionInstability = bSet;
    // End:0x3c
    if(bConnectionInstability)
    {
        TimeConnectionInstability[0] = Level.TimeSeconds;
    }
    // End:0x52
    else
    {
        TimeConnectionInstability[1] = Level.TimeSeconds;
    }
    fDeltaTime = Abs(TimeConnectionInstability[1] - TimeConnectionInstability[0]);
    // End:0x81
    if(fDeltaTime < 1.0)
    {
        bDrawConnectionInstability = true;
    }
}

function ConnectionInstability(Canvas C)
{
    // End:0x36
    if(float(HudOwner.PlayerOwner.PlayerReplicationInfo.Ping) > 2000.0)
    {
        SetTimeConnectionInstability(true);
    }
    // End:0x46
    else
    {
        // End:0x46
        if(bConnectionInstability)
        {
            SetTimeConnectionInstability(false);
        }
    }
    // End:0x5a
    if(bDrawConnectionInstability)
    {
        DrawMessageConnectionInstability(C);
    }
}

function DrawMessageConnectionInstability(Canvas C)
{
    local CalCoordsW calW;
    local Color OldColor;

    // End:0x38
    if(!bConnectionInstability && TimeConnectionInstability[1] + 1.0 < Level.TimeSeconds)
    {
        bDrawConnectionInstability = false;
        return;
    }
    OldColor = C.DrawColor;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * 0.60));
    class'BTCustomDrawHK'.static.DrawImage(C, class'BTHUDResourcePoolHK'.default.hud_back_4, 0.0, 0.0, C.ClipX, C.ClipY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WConnectionInstability, 200.0, 200.0, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WConnectionInstability.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(LsConnectionInstability, 1, 0.0, 682.0 * _reY, C.ClipX, 719.0 * _reY, int(float(21) * _reY), color_Shadow);
    C.DrawColor = OldColor;
}

defaultproperties
{
    wHealthPack=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_healpac',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=763,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHealthPackPlus=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_healpac_10',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=763,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDigitsHP=(DigitTexture=Texture'Warfare_HUD.HUD.Number',TextureCoords=(X1=207,Y1=0,X2=227,Y2=31),TextureCoords[1]=(X1=0,Y1=0,X2=20,Y2=31),TextureCoords[2]=(X1=23,Y1=0,X2=43,Y2=31),TextureCoords[3]=(X1=46,Y1=0,X2=66,Y2=31),TextureCoords[4]=(X1=69,Y1=0,X2=89,Y2=31),TextureCoords[5]=(X1=92,Y1=0,X2=112,Y2=31),TextureCoords[6]=(X1=115,Y1=0,X2=135,Y2=31),TextureCoords[7]=(X1=138,Y1=0,X2=158,Y2=31),TextureCoords[8]=(X1=161,Y1=0,X2=181,Y2=31),TextureCoords[9]=(X1=184,Y1=0,X2=204,Y2=31),TextureCoords[10]=(X1=230,Y1=0,X2=250,Y2=31))
    WDigitsNumberBroadBig=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number1',TextureCoords=(X1=459,Y1=0,X2=509,Y2=42),TextureCoords[1]=(X1=0,Y1=0,X2=50,Y2=42),TextureCoords[2]=(X1=51,Y1=0,X2=101,Y2=42),TextureCoords[3]=(X1=102,Y1=0,X2=152,Y2=42),TextureCoords[4]=(X1=153,Y1=0,X2=203,Y2=42),TextureCoords[5]=(X1=204,Y1=0,X2=254,Y2=42),TextureCoords[6]=(X1=255,Y1=0,X2=305,Y2=42),TextureCoords[7]=(X1=306,Y1=0,X2=356,Y2=42),TextureCoords[8]=(X1=357,Y1=0,X2=407,Y2=42),TextureCoords[9]=(X1=408,Y1=0,X2=458,Y2=42),TextureCoords[10]=(X1=0,Y1=44,X2=50,Y2=86))
    WDigitsNumberBig=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number',TextureCoords=(X1=459,Y1=0,X2=509,Y2=70),TextureCoords[1]=(X1=0,Y1=0,X2=50,Y2=70),TextureCoords[2]=(X1=51,Y1=0,X2=101,Y2=70),TextureCoords[3]=(X1=102,Y1=0,X2=152,Y2=70),TextureCoords[4]=(X1=153,Y1=0,X2=203,Y2=70),TextureCoords[5]=(X1=204,Y1=0,X2=254,Y2=70),TextureCoords[6]=(X1=255,Y1=0,X2=305,Y2=70),TextureCoords[7]=(X1=306,Y1=0,X2=356,Y2=70),TextureCoords[8]=(X1=357,Y1=0,X2=407,Y2=70),TextureCoords[9]=(X1=408,Y1=0,X2=458,Y2=70),TextureCoords[10]=(X1=0,Y1=72,X2=57,Y2=128))
    WDigitsNumberMid=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number3',TextureCoords=(X1=315,Y1=0,X2=349,Y2=28),TextureCoords[1]=(X1=0,Y1=0,X2=34,Y2=28),TextureCoords[2]=(X1=35,Y1=0,X2=69,Y2=28),TextureCoords[3]=(X1=70,Y1=0,X2=104,Y2=28),TextureCoords[4]=(X1=105,Y1=0,X2=139,Y2=28),TextureCoords[5]=(X1=140,Y1=0,X2=174,Y2=28),TextureCoords[6]=(X1=175,Y1=0,X2=209,Y2=28),TextureCoords[7]=(X1=210,Y1=0,X2=244,Y2=28),TextureCoords[8]=(X1=245,Y1=0,X2=279,Y2=28),TextureCoords[9]=(X1=280,Y1=0,X2=314,Y2=28),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WDigitsNumberMid_Base=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',TextureCoords=(X1=297,Y1=0,X2=329,Y2=42),TextureCoords[1]=(X1=0,Y1=0,X2=32,Y2=42),TextureCoords[2]=(X1=33,Y1=0,X2=65,Y2=42),TextureCoords[3]=(X1=66,Y1=0,X2=98,Y2=42),TextureCoords[4]=(X1=99,Y1=0,X2=131,Y2=42),TextureCoords[5]=(X1=132,Y1=0,X2=164,Y2=42),TextureCoords[6]=(X1=165,Y1=0,X2=197,Y2=42),TextureCoords[7]=(X1=198,Y1=0,X2=230,Y2=42),TextureCoords[8]=(X1=231,Y1=0,X2=263,Y2=42),TextureCoords[9]=(X1=264,Y1=0,X2=296,Y2=42),TextureCoords[10]=(X1=368,Y1=0,X2=400,Y2=42))
    WDigitsNumberSml=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number3',TextureCoords=(X1=315,Y1=0,X2=349,Y2=28),TextureCoords[1]=(X1=0,Y1=0,X2=34,Y2=28),TextureCoords[2]=(X1=35,Y1=0,X2=69,Y2=28),TextureCoords[3]=(X1=70,Y1=0,X2=104,Y2=28),TextureCoords[4]=(X1=105,Y1=0,X2=139,Y2=28),TextureCoords[5]=(X1=140,Y1=0,X2=174,Y2=28),TextureCoords[6]=(X1=175,Y1=0,X2=209,Y2=28),TextureCoords[7]=(X1=210,Y1=0,X2=244,Y2=28),TextureCoords[8]=(X1=245,Y1=0,X2=279,Y2=28),TextureCoords[9]=(X1=280,Y1=0,X2=314,Y2=28),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WDigitsDFRoundNumber=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_roundDisplay_countnumber',TextureCoords=(X1=0,Y1=0,X2=92,Y2=78),TextureCoords[1]=(X1=92,Y1=0,X2=184,Y2=78),TextureCoords[2]=(X1=184,Y1=0,X2=276,Y2=78),TextureCoords[3]=(X1=276,Y1=0,X2=368,Y2=78),TextureCoords[4]=(X1=368,Y1=0,X2=460,Y2=78),TextureCoords[5]=(X1=460,Y1=0,X2=552,Y2=78),TextureCoords[6]=(X1=552,Y1=0,X2=644,Y2=78),TextureCoords[7]=(X1=644,Y1=0,X2=736,Y2=78),TextureCoords[8]=(X1=736,Y1=0,X2=828,Y2=78),TextureCoords[9]=(X1=828,Y1=0,X2=913,Y2=78),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    DigitsNumberFirst=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=82,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsNumberSecond=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=41,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsNumberPlus=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    FontSizeNormal=21
    FontSizeKey=28
    FontSizeRespawn=16
    SkillIconEvent=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHelpBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=328,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wHelicopter=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=82,X2=1024,Y2=164),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirke=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=164,X2=512,Y2=246),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WUAV=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=410,X2=1024,Y2=492),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WC4=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=912,X2=1024,Y2=994),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRPG7=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=82),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WReadyIncen=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=0,Y1=82,X2=512,Y2=164),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WReadyHellFire=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=0,Y1=164,X2=512,Y2=246),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WReadySpiltGrenade=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=0,Y1=246,X2=512,Y2=328),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WReadyPinpointFire=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=0,Y1=328,X2=512,Y2=410),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WNotReadyIncen=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=512,Y1=82,X2=1024,Y2=164),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WNotReadyHellFire=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=512,Y1=164,X2=1024,Y2=246),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WNotReadySpiltGrenade=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=512,Y1=246,X2=1024,Y2=328),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WNotReadyPinpointFire=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=512,Y1=328,X2=1024,Y2=410),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirkeIcon=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_pac_bom',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=127,Y2=127),TextureScale=0.650,DrawPivot=0,PosX=0.34750,PosY=0.6016670,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHelicopterIcon=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_pac_hel',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=127,Y2=127),TextureScale=0.650,DrawPivot=0,PosX=0.34750,PosY=0.6016670,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WUAVIcon=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_pac_uav',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=127,Y2=127),TextureScale=0.650,DrawPivot=0,PosX=0.34750,PosY=0.6016670,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillHelicopterOn=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_heli_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillAirstrikeOn=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_bomb_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillUAVOn=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_uav_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillC4On=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_skil_time_c4',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillRPG7On=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_wea_RPG7',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WC4NotReady=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=164,X2=1024,Y2=246),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirkeNotReady=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=82,X2=512,Y2=164),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHelicopterNotReady=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=0,X2=1024,Y2=82),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WUAVNotReady=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=246,X2=512,Y2=328),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRPG7NotReady=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=512,Y1=0,X2=1024,Y2=82),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirkeRequireFaild=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=82),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHelicopterRequireFaild=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=248,X2=1024,Y2=328),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WUAVRequireFaild=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=328,X2=1024,Y2=410),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirkeFocus=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=328,X2=512,Y2=410),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirkeSellect=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=410,X2=512,Y2=492),TextureScale=1.0,DrawPivot=0,PosX=0.340,PosY=0.6208330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ECallSkillState=16
    fBeginRespawnPosY=442.0
    fEndRespawnPosY=450.0
    fDrawTime=2.50
    fDrawTimeSkill=0.50
    fDrawTimeEffect=0.80
    fFadeOutEffect=1.0
    fFadeOutTime=1.50
    fDrawTimeHealth=0.20
    fFadeOutTimeHealth=2.0
    fDistMove=40.0
    WGameMessageWaiting=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=580,X2=1024,Y2=624),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=382,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameWaitSpot=(WidgetTexture=Texture'Warfare_HUD.HUD.txt_wait_user_p',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=8,Y2=8),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=622,OffsetY=195,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WConnectionInstability=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_dishost',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=465,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBGStart=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmstart',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=128),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=536,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBGStartDF=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_roundDisplay_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=279),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=289,OffsetY=431,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeTD=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=688,X2=256,Y2=752),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeSD=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=688,X2=512,Y2=752),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeDOA=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text2',RenderStyle=5,TextureCoords=(X1=0,Y1=128,X2=256,Y2=192),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeDOMI=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=624,X2=512,Y2=688),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeSB=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=752,X2=256,Y2=816),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeDM=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=624,X2=256,Y2=688),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeFM=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=816,X2=512,Y2=880),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeTM=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=587,Y1=816,X2=819,Y2=891),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameChangeAttack=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=816,X2=256,Y2=880),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameChangePosition=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=752,X2=512,Y2=816),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGo=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmstart_go_1',RenderStyle=5,TextureCoords=(X1=1,Y1=20,X2=1024,Y2=237),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=288,OffsetY=491,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    strQuestNoUpdate="Mission records are not saved in games with less than 4 human players."
    BeginMessageTD="Destroy the enemy team!"
    BeginMessageSDA1="Plant a bomb at the target (A or B) and destroy it!"
    BeginMessageSDD1="Stop the target (A or B) from being destroyed by an enemy bomb!"
    BeginMessageDOMI="Capture and defend the flag!"
    BeginMessageSB="Search for the bomb and plant it on the target to destroy it!"
    BeginMessageDM="Destroy your enemies!"
    BeginMessageFM="Destroy your enemies!"
    BeginMessageTM="Follow the tutorial to complete the mission!"
    LsReload="Reload"
    LsWarningAmmo="Low Ammo"
    LsConnectionInstability="Connection with the host is unstable. The game has been paused."
    lsIsInvincible="Invincible for 3 seconds after respawn."
    lsIsInvincibleBeginner="Invincible for 5 seconds after respawn."
    safeZoneRandomRespawn="You will soon respawn in a random safe zone."
    MessageChangingHostPre="New Host"
    MessageChangingHost="Changing hosts..."
    MessageChangingHostPlzWait="The game is paused while the host is being changed. Wait a moment."
    fMessageDrawTime=2.50
    fBeginMessageTime_Go=9999.0
    fMessageDrawTime_Go=0.10
    fFadeOutTime_Go=1.50
    WRoundResultBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=2),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=454,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundWin=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=624,X2=1024,Y2=720),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=551,OffsetY=337,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundLose=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=720,X2=1024,Y2=816),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=551,OffsetY=337,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WCompareSign=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_number',RenderStyle=5,TextureCoords=(X1=65,Y1=72,X2=79,Y2=127),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=786,OffsetY=558,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WCompareSignMid=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',RenderStyle=5,TextureCoords=(X1=330,Y1=0,X2=344,Y2=42),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=786,OffsetY=558,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsRoundWinAF=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0,DrawPivot=2,PosX=0.0,PosY=0.0,OffsetX=653,OffsetY=567,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRoundWinRSA=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0,DrawPivot=2,PosX=0.0,PosY=0.0,OffsetX=894,OffsetY=567,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    WTeamMarkAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=314,Y2=314),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=643,OffsetY=313,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamMarkRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=314,Y1=0,X2=628,Y2=314),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=643,OffsetY=313,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTeamMarkAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_teamemblem',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=207,Y2=256),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=518,OffsetY=369,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTeamMarkRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_teamemblem',RenderStyle=5,TextureCoords=(X1=207,Y1=0,X2=414,Y2=256),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=875,OffsetY=369,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWinTextAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=165),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WLoseTextAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=165,X2=512,Y2=330),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWinTextRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=330,X2=512,Y2=495),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WLoseTextRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=495,X2=512,Y2=660),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundResultNewBG=(WidgetTexture=Texture'Warfare_GP_UI_UI.Common.img_commom_black_40_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundResultGradationBG=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_gradation_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=1024),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=495,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDigitsNumResultWin=(DigitTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_scorenum_win',TextureCoords=(X1=324,Y1=0,X2=360,Y2=51),TextureCoords[1]=(X1=0,Y1=0,X2=36,Y2=51),TextureCoords[2]=(X1=36,Y1=0,X2=72,Y2=51),TextureCoords[3]=(X1=72,Y1=0,X2=108,Y2=51),TextureCoords[4]=(X1=108,Y1=0,X2=144,Y2=51),TextureCoords[5]=(X1=144,Y1=0,X2=180,Y2=51),TextureCoords[6]=(X1=180,Y1=0,X2=216,Y2=51),TextureCoords[7]=(X1=216,Y1=0,X2=252,Y2=51),TextureCoords[8]=(X1=252,Y1=0,X2=288,Y2=51),TextureCoords[9]=(X1=288,Y1=0,X2=324,Y2=51),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WDigitsNumResultLose=(DigitTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_scorenum_lose',TextureCoords=(X1=270,Y1=0,X2=300,Y2=41),TextureCoords[1]=(X1=0,Y1=0,X2=30,Y2=41),TextureCoords[2]=(X1=30,Y1=0,X2=60,Y2=41),TextureCoords[3]=(X1=60,Y1=0,X2=90,Y2=41),TextureCoords[4]=(X1=90,Y1=0,X2=120,Y2=41),TextureCoords[5]=(X1=120,Y1=0,X2=150,Y2=41),TextureCoords[6]=(X1=150,Y1=0,X2=180,Y2=41),TextureCoords[7]=(X1=180,Y1=0,X2=210,Y2=41),TextureCoords[8]=(X1=210,Y1=0,X2=240,Y2=41),TextureCoords[9]=(X1=240,Y1=0,X2=270,Y2=41),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    DigitsAFWinScore=// Object reference not set to an instance of an object.
    
    DigitsRSAWinScore=// Object reference not set to an instance of an object.
    
    DigitsAFLoseScore=// Object reference not set to an instance of an object.
    
    DigitsRSALoseScore=// Object reference not set to an instance of an object.
    
    wDefenceBotIcon[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=80,Y2=80),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=80,Y1=0,X2=160,Y2=80),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=160,Y1=0,X2=240,Y2=80),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=240,Y1=0,X2=320,Y2=80),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=320,Y1=0,X2=400,Y2=80),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=400,Y1=0,X2=480,Y2=80),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=0,Y1=80,X2=80,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=80,Y1=80,X2=160,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=160,Y1=80,X2=240,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=240,Y1=80,X2=320,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[10]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=320,Y1=80,X2=400,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[11]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=400,Y1=80,X2=480,Y2=160),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsAFScore=// Object reference not set to an instance of an object.
    
    DigitsRSAScore=// Object reference not set to an instance of an object.
    
    DigitsGoalScore=// Object reference not set to an instance of an object.
    
    DigitsTime=// Object reference not set to an instance of an object.
    
    DigitsFFAGoalScore=// Object reference not set to an instance of an object.
    
    WHudBG2=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=8),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHudBGR=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_red',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=8),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamScoreBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_score_indicatecamp_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=598,Y2=87),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=501,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtAF[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=460,Y1=314,X2=758,Y2=442),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=570,OffsetY=478,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtAF[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=460,Y1=442,X2=758,Y2=570),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=570,OffsetY=478,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtRSA[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=0,Y1=314,X2=460,Y2=442),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=651,OffsetY=478,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtRSA[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=0,Y1=442,X2=460,Y2=570),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=651,OffsetY=478,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_score_0',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=486,Y2=71),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=557,OffsetY=5,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreOverLayer=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_score_0_sel',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=375,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=107,OffsetY=4,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DFRankingBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_ranking_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=361,Y2=112),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=1239,OffsetY=976,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTimerBombBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.time_notice',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=240,Y2=106),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=659,OffsetY=74,ScaleMode=4,Scale=0.40,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    matBack1=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1'
    matLine=Texture'Warfare_GP_UI_UI.HUD_ETC.list_scor_bord'
    matOn=Texture'Warfare_GP_UI_UI.HUD_ETC.list_result_on'
    Medals=// Object reference not set to an instance of an object.
    
    RankPostfix="th place"
    W3Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=144,X2=274,Y2=216),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W5Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=144,X2=548,Y2=216),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W7Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=144,X2=822,Y2=216),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W10Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=216,X2=274,Y2=288),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W15Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=216,X2=548,Y2=288),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHeadshot=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=72,X2=822,Y2=144),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillTextBg=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text_bg2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=182,Y2=53),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=720,OffsetY=262,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHudBack3=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=119,OffsetY=116,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTxtHostChange=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=816,X2=512,Y2=880),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=459,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTxtSudenDeath=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=912,X2=256,Y2=976),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wTxtSubSudenDeath=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=339,Y1=880,X2=451,Y2=912),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=744,OffsetY=245,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    lsSudenDeathMessage[0]="Free-for-All: The player with the most kills wins."
    lsSudenDeathMessage[1]="Team Deathmatch: The team that eliminates all opponents wins."
    lsSudenDeathMessage[2]="Demolition: Kill all enemies or destroy the target to win."
    SoundRequireAtillery=Sound'Warfare_Sound_ATS.cb.ats_cb_ready_artillery'
    SoundRequireUAV=Sound'Warfare_Sound_ATS.cb.ats_cb_ready_uav'
    SoundNotReady=Sound'Warfare_Sound_ATS.cb.ats_cb_use_fail'
    MessageWin="Win"
    MessageLose="Lose"
    HelpKeyButtonReload=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=26,Y2=26),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=728,OffsetY=688,ScaleMode=4,Scale=1.0,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    RPG7KillStreak=4
    IncenKillStreak=3
    HellfireKillStreak=5
    PinpointFireKillStreak=3
    SpiltGrenadeKillStreak=5
    wBackSeparationTop=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_up',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=40),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=459,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wBackSeparationBottom=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_down',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=40),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=723,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=246),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=256,X2=1024,Y2=502),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[2]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=512,X2=1024,Y2=758),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[3]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=768,X2=1024,Y2=1014),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=246),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=256,X2=1024,Y2=502),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[2]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=512,X2=1024,Y2=758),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[3]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=768,X2=1024,Y2=1014),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WScoreTeamMarkAF=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_score_indicatecamp_myteammark_af',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=705,OffsetY=7,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WScoreTeamMarkRSA=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_score_indicatecamp_myteammark_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=863,OffsetY=7,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRespawnBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gauge_HUD_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=544,OffsetY=388,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRespawnGauge=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gauge_HUD_n',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=32),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=546,OffsetY=390,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}