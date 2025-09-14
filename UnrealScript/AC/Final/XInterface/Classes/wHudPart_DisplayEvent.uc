class wHudPart_DisplayEvent extends wHudPart_DisplayBase
    transient;

const DefaultDFBotGrade = 901;

enum SKILL_ARRAY
{
    SKILL_ARRAY_C4,                 // 0
    SKILL_ARRAY_RPG7,               // 1
    SKILL_ARRAY_HELICOPTER,         // 2
    SKILL_ARRAY_AIRSTIRKE,          // 3
    SKILL_ARRAY_UAV,                // 4
    SKILL_ARRAY_HELICOPTER_REQUIRE, // 5
    SKILL_ARRAY_AIRSTIRKE_REQUIRE,  // 6
    SKILL_ARRAY_UAV_REQUIRE,        // 7
    SKILL_ARRAY_HellFire,           // 8
    SKILL_ARRAY_HellFire_Require,   // 9
    SKILL_ARRAY_PinpointFire,       // 10
    SKILL_ARRAY_PinpointFire_Require,// 11
    SKILL_ARRAY_Incen,              // 12
    SKILL_ARRAY_Incen_Require,      // 13
    SKILL_ARRAY_SpiltGrenade,       // 14
    SKILL_ARRAY_SpiltGrenade_Require,// 15
    SKILL_ARRAY_ActiveCommon,       // 16
    SKILL_ARRAY_SENTRYGUN,          // 17
    SKILL_ARRAY_SENTRYGUN_REQUIRE,  // 18
    SKILL_ARRAY_NONE                // 19
};

enum ESD_STATE
{
    SET_ENABLE,                     // 0
    SET_DOING,                      // 1
    SET_DONE,                       // 2
    DIFFUSE_ENABLE,                 // 3
    DIFFUSE_DOING,                  // 4
    DIFFUSE_DONE                    // 5
};

enum eDrawMessageState
{
    DM_None,                        // 0
    DM_Waiting,                     // 1
    DM_GameMode,                    // 2
    DM_Go,                          // 3
    DM_HostChange,                  // 4
    DM_End                          // 5
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
var() NumericWidget DigitsNumberThird;
var() NumericWidget DigitsNumberFourth;
var() NumericWidget DigitsNumberFifth;
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
var() SpriteWidget SkillHelicopterOn;
var() SpriteWidget SkillAirstrikeOn;
var() SpriteWidget SkillUAVOn;
var() SpriteWidget SkillSentryGunOn;
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
var() SpriteWidget WGameTypeAlienMode;
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
var localized string BeginMessageAlienMode;
var localized string BeginMessageDOMI;
var localized string BeginMessageSB;
var localized string BeginMessageDM;
var localized string BeginMessageFM;
var localized string BeginMessageTM;
var localized string BeginMessageDF;
var localized string LsReload;
var localized string LsWarningAmmo;
var localized string LsRechargingAmmo;
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
var() SpriteWidget WTeamMarkHumanTeam;
var() SpriteWidget WTeamMarkAlienTeam;
var() SpriteWidget WTeamBigMarkHumanTeam;
var() SpriteWidget WTeamBigMarkAlienTeam;
var() SpriteWidget WResultMarkHumanTeam;
var() SpriteWidget WResultMarkAlienTeam;
var() SpriteWidget WWinTextAF;
var() SpriteWidget WLoseTextAF;
var() SpriteWidget WWinTextRSA;
var() SpriteWidget WLoseTextRSA;
var() SpriteWidget WRoundResultNewBG;
var() SpriteWidget WRoundResultGradationBG;
var() SpriteWidget WWinTextHumanTeam;
var() SpriteWidget WLoseTextHumanTeam;
var() SpriteWidget WWinTextAlienTeam;
var() SpriteWidget WLoseTextAlienTeam;
var() DigitSet WDigitsNumResultWin;
var() DigitSet WDigitsNumResultLose;
var() array<NumericWidget> DigitsAFWinScore;
var() array<NumericWidget> DigitsRSAWinScore;
var() array<NumericWidget> DigitsAFLoseScore;
var() array<NumericWidget> DigitsRSALoseScore;
var SpriteWidget wDefenceBotIcon[15];
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
var array<PlayerReplicationInfo> arrRankingInfo;
var PlayerReplicationInfo PRI_1st;
var PlayerReplicationInfo PRI_2nd;
var PlayerReplicationInfo PRI_Self;
var float fSortingLastTime;
var SpriteWidget DFRankingBG;
var SpriteWidget DFUserHP;
var() SpriteWidget WTimerBombBG;
var Material matBack1;
var Material matLine;
var Material tempMat;
var Material matOn;
var array<Material> Medals;
var localized string RankPostfix;
var SpriteWidget WAlienModeScoreBG;
var int HasSkillC4;
var int HasSkillAirStirke;
var int HasSkillRPG7;
var int Displaying_State[20];
var float fBeginDrawTime_Skill;
var bool bDrawSkillC4;
var bool bDrawSkillRPG7;
var bool bDrawSkillHelicopter;
var bool bDrawSkillAirStrike;
var bool bDrawSkillUAV;
var bool bDrawSkillRPG;
var bool bDrawSkillSentryGun;
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
var string SoundRequireHeliCopter;
var string SoundRequireAtillery;
var string SoundRequireUAV;
var string SoundRequireSentryGun;
var string SoundNotReady;
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
var() SpriteWidget wBackSeparationTop;
var() SpriteWidget wBackSeparationBottom;
var() SpriteWidget WTeamImageAF[4];
var() SpriteWidget WTeamImageRSA[4];
var() SpriteWidget WScoreTeamMarkAF;
var() SpriteWidget WScoreTeamMarkRSA;
var localized string strNotReadySkill[4];
var localized string strNotReadySkillDesc;
var localized string strReadySkill;
var localized string strReadySkillDesc;
var localized string strReadySupplyItem;
var localized string strReadySupplyItemDesc;
var localized string strHelicopter;
var localized string strSentryGun;
var localized string strAirStrike;
var localized string strUAV;
var localized string strHelicopterFailed;
var localized string strSentryGunFailed;
var localized string strAirStrikeFailed;
var localized string strHelicopterFailedDesc;
var localized string strSentryGunFailedDesc;
var localized string strAirStrikeFailedDesc;

function Initialize(HudBase myOwner, LevelInfo Level)
{
    super.Initialize(myOwner, Level);
    fBeginDrawTime_SudenDeath = 0.0000000;
    DigitsNumberThird = DigitsNumberFirst;
    DigitsNumberFourth = DigitsNumberFirst;
    DigitsNumberFifth = DigitsNumberFirst;
    //return;    
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    switch(iReservation1)
    {
        // End:0x18
        case 444:
            PlaySound_Event();
            // End:0xC3
            break;
        // End:0x29
        case 555:
            FFARankingSorting();
            // End:0xC3
            break;
        // End:0x3A
        case 888:
            UpdateHelpKeyControll();
            // End:0xC3
            break;
        // End:0x4B
        case 1002:
            DisPlayEvent_BeginWaitingForStart();
            // End:0xC3
            break;
        // End:0x5C
        case 1003:
            DisPlayEvent_EndWaitingForStart();
            // End:0xC3
            break;
        // End:0x7D
        case 1004:
            // End:0x7A
            if(!bDisplayEvent_CountDown)
            {
                DisplayEvent_CountDown(iReservation2);
            }
            // End:0xC3
            break;
        // End:0x90
        case 1005:
            bDisplayEvent_CountDown = false;
            // End:0xC3
            break;
        // End:0xBD
        case 1006:
            bDisplayEvent_Invincible = true;
            HudOwner.GoWalkingBeginTime = Level.TimeSeconds;
        // End:0xFFFF
        default:
            // End:0xC3
            break;
            break;
    }
    //return;    
}

function DisPlayEvent_BeginWaitingForStart()
{
    DMState = 2;
    fBeginMessageTime = Level.TimeSeconds;
    //return;    
}

function DisPlayEvent_EndWaitingForStart()
{
    DMState = 3;
    fBeginMessageTime_Go = Level.TimeSeconds;
    //return;    
}

function DisplayEvent_CountDown(int iCount)
{
    bDisplayEvent_CountDown = true;
    fBeginTimeCounDown = Level.TimeSeconds;
    //return;    
}

function PlaySound_Event()
{
    //return;    
}

function UpdateHUD()
{
    // End:0x42
    if(bDisplayEvent_HealthPack && Level.TimeSeconds > ((HudOwner.LastHealthPickupTime + fDrawTimeHealth) + fFadeOutTimeHealth))
    {
        bDisplayEvent_HealthPack = false;
    }
    //return;    
}

function UpdateHelpKeyControll()
{
    // End:0x47
    if((HudOwner.PlayerOwner.Player == none) || HudOwner.PlayerOwner.Player.GUIController == none)
    {
        return;
    }
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 5", keys, LocalizedKeys);
    skeyBtnC4 = keys[0];
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("SwitchWeapon 6", keys, LocalizedKeys);
    sKeyBtnHeli = keys[0];
    sKeyBtnAirStrike = keys[0];
    sKeyBtnUAV = keys[0];
    sKeyBtnSentryGun = keys[0];
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("UseKey", keys, LocalizedKeys);
    skeyUseKey = LocalizedKeys[0];
    GUIController(HudOwner.PlayerOwner.Player.GUIController).GetAssignedKeys("WeaponReload", keys, LocalizedKeys);
    GetKeyTexture(keys[0], HelpKeyButtonReload, WidthReload, float(default.HelpKeyButtonReload.OffsetX));
    skeyWeaponReload = LocalizedKeys[0];
    //return;    
}

function DisPlayEvent_Waiting(string Message)
{
    // End:0x1A
    if(Message != "")
    {
        sWaitingMessage = Message;        
    }
    else
    {
        return;
    }
    IsStartupMessage = true;
    fReceiveTime_StartupMessage = Level.TimeSeconds;
    //return;    
}

function SetSkillState(int skillC4, int skillAirStirke, int SkillRPG7)
{
    // End:0x1D
    if((skillAirStirke == 2) && HasSkillAirStirke != skillAirStirke)
    {
    }
    HasSkillC4 = skillC4;
    HasSkillAirStirke = skillAirStirke;
    HasSkillRPG7 = SkillRPG7;
    //return;    
}

function DrawEvent_Item_HealthPack(Canvas C, optional int AddHp)
{
    local CalCoordsW calW;
    local float fWidth, fDeltaTime, fRatio, fMoveX, fMoveY;

    // End:0x31
    if(Level.TimeSeconds > ((HudOwner.LastHealthPickupTime + fDrawTimeHealth) + fFadeOutTimeHealth))
    {
        return;
    }
    fDeltaTime = Level.TimeSeconds - HudOwner.LastHealthPickupTime;
    // End:0x72
    if(fDeltaTime < fDrawTimeHealth)
    {
        fFadeOutEffect = 1.0000000;        
    }
    else
    {
        fFadeOutEffect = 1.0000000 - ((fDeltaTime - fDrawTimeHealth) / fFadeOutTimeHealth);
    }
    C.DrawColor.A = byte(float(255) * fFadeOutEffect);
    // End:0x1C7
    if((HudOwner.PlayerOwner != none) && HudOwner.PlayerOwner.SkillBase.bIncHealthPack)
    {
        WHealthPackPlus.OffsetX = int(float(default.WHealthPackPlus.OffsetX) - fMoveX);
        WHealthPackPlus.OffsetY = int(float(default.WHealthPackPlus.OffsetY) + fMoveY);
        CalculateCoordinateEx(C, WHealthPackPlus, 95.0000000, 95.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WHealthPackPlus.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        wHealthPack.OffsetX = int(float(default.wHealthPack.OffsetX) - fMoveX);
        wHealthPack.OffsetY = int(float(default.wHealthPack.OffsetY) + fMoveY);
        CalculateCoordinateEx(C, wHealthPack, 95.0000000, 95.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(wHealthPack.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    CalculateCoordinateEx(C, HudCDeathmatch(HudOwner).HpGauBlink, 167.0000000, 20.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(HudCDeathmatch(HudOwner).HpGauBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    fRatio = fDeltaTime / (fDrawTimeHealth + fFadeOutTimeHealth);
    fRatio = FClamp(fRatio, 0.0000000, 1.0000000);
    fMoveX = 11.0000000 * fRatio;
    fWidth = 22.0000000 + (float(22) * fRatio);
    HudCDeathmatch(HudOwner).HPIcon.OffsetX = int(float(57) - fMoveX);
    HudCDeathmatch(HudOwner).HPIcon.OffsetY = int(float(1148) - fMoveX);
    CalculateCoordinateEx(C, HudCDeathmatch(HudOwner).HPIcon, fWidth, fWidth, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(HudCDeathmatch(HudOwner).HPIcon.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DisplayEvent_Skill_Helicopter(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio;
    local int X1, Y1, X2, Y2;

    // End:0x3D
    if(Level.TimeSeconds > ((HudOwner.LastHeliPickupTime + fDrawTime) + fFadeOutTime))
    {
        Displaying_State[int(2)] = 0;
        return;
    }
    // End:0x89
    if((Displaying_State[int(3)] == 1) && HudOwner.LastHeliPickupTime < HudOwner.LastAirStirkePickupTime)
    {
        Displaying_State[int(2)] = 0;
        bDrawSkillHelicopter = true;
        return;        
    }
    else
    {
        // End:0xD5
        if((Displaying_State[int(17)] == 1) && HudOwner.LastHeliPickupTime < HudOwner.LastSentryGunPickupTime)
        {
            Displaying_State[int(2)] = 0;
            bDrawSkillHelicopter = true;
            return;            
        }
        else
        {
            // End:0x137
            if((2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState) && HudOwner.LastHeliPickupTime < HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime)
            {
                Displaying_State[int(2)] = 0;
                bDrawSkillHelicopter = true;
                return;
            }
        }
    }
    // End:0x16A
    if(Level.TimeSeconds > (HudOwner.LastHeliPickupTime + fDrawTimeSkill))
    {
        bDrawSkillHelicopter = true;        
    }
    else
    {
        bDrawSkillHelicopter = false;
    }
    Displaying_State[int(2)] = 1;
    DrawEventString(C, HudOwner.LastHeliPickupTime, Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItem, strHelicopter), Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0), Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItemDesc, strHelicopter), sKeyBtnHeli);
    fDeltaTime = Level.TimeSeconds - HudOwner.LastHeliPickupTime;
    // End:0x226
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0000000;        
    }
    else
    {
        fRatio = (fDeltaTime - fDrawTimeSkill) / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0000000, 1.0000000);
    SkillHelicopterOn.OffsetX = int(float(default.SkillHelicopterOn.OffsetX) + (float(-384) * fRatio));
    SkillHelicopterOn.OffsetY = int(float(default.SkillHelicopterOn.OffsetY) + (float(279) * fRatio));
    CalculateCoordinateEx(C, SkillHelicopterOn, 128.0000000 - (fRatio * float(64)), 128.0000000 - (fRatio * float(64)), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillHelicopterOn.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DisplayEvent_Skill_SentryGun(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio;
    local int X1, Y1, X2, Y2;

    // End:0x3D
    if(Level.TimeSeconds > ((HudOwner.LastSentryGunPickupTime + fDrawTime) + fFadeOutTime))
    {
        Displaying_State[int(17)] = 0;
        return;
    }
    // End:0x89
    if((Displaying_State[int(3)] == 1) && HudOwner.LastSentryGunPickupTime < HudOwner.LastAirStirkePickupTime)
    {
        Displaying_State[int(17)] = 0;
        bDrawSkillSentryGun = true;
        return;        
    }
    else
    {
        // End:0xD5
        if((Displaying_State[int(2)] == 1) && HudOwner.LastSentryGunPickupTime < HudOwner.LastHeliPickupTime)
        {
            Displaying_State[int(17)] = 0;
            bDrawSkillSentryGun = true;
            return;            
        }
        else
        {
            // End:0x137
            if((2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState) && HudOwner.LastSentryGunPickupTime < HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime)
            {
                Displaying_State[int(17)] = 0;
                bDrawSkillSentryGun = true;
                return;
            }
        }
    }
    // End:0x16A
    if(Level.TimeSeconds > (HudOwner.LastSentryGunPickupTime + fDrawTimeSkill))
    {
        bDrawSkillSentryGun = true;        
    }
    else
    {
        bDrawSkillSentryGun = false;
    }
    Displaying_State[int(17)] = 1;
    DrawEventString(C, HudOwner.LastSentryGunPickupTime, Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItem, strSentryGun), Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0), Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItemDesc, strSentryGun), sKeyBtnSentryGun);
    fDeltaTime = Level.TimeSeconds - HudOwner.LastSentryGunPickupTime;
    // End:0x226
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0000000;        
    }
    else
    {
        fRatio = (fDeltaTime - fDrawTimeSkill) / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0000000, 1.0000000);
    SkillSentryGunOn.OffsetX = int(float(default.SkillSentryGunOn.OffsetX) + (float(-384) * fRatio));
    SkillSentryGunOn.OffsetY = int(float(default.SkillSentryGunOn.OffsetY) + (float(279) * fRatio));
    CalculateCoordinateEx(C, SkillSentryGunOn, 128.0000000 - (fRatio * float(64)), 128.0000000 - (fRatio * float(64)), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillSentryGunOn.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function CallSkill(optional int iKey, optional bool bRequire, optional bool iSucess)
{
    local bool bSkillReady;
    local int iSkillID, iCodeID;
    local wWeapon wWP;

    // End:0x123
    if(5 == iKey)
    {
        // End:0xC6
        if(1 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
        {
            iSkillID = HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID;
            ECallSkillState = 16;
            // End:0xC3
            if(HudOwner.PlayerOwner.SkillBase.GetUsed(iSkillID))
            {
                iCodeID = HudCDeathmatch(HudOwner).ActiveUsingSkill.usedStrCode;
                // End:0xC3
                if(iSkillID > 0)
                {
                    HudOwner.PlayerOwner.FmodClientPlaySound(SoundNotReady,,, 0);
                }
            }            
        }
        else
        {
            // End:0x120
            if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
            {
                iSkillID = HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID;
                switch(iSkillID)
                {
                    // End:0x11D
                    case 40018:
                        ECallSkillState = 10;
                        // End:0x120
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
            }
            else
            {
            }            
        }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x0C6! */
        else
        {
            // End:0x442
            if(6 == iKey)
            {
                wWP = Level.GetLocalPlayerController().Pawn.GetWeaponByInvenGroup(6);
                // End:0x437
                if(wWP != none)
                {
                    // End:0x20F
                    if(int(wWP.BaseParams.eType) == int(15))
                    {
                        // End:0x19A
                        if(bRequire)
                        {
                            ECallSkillState = 5;                            
                        }
                        else
                        {
                            ECallSkillState = 2;
                        }
                        // End:0x20C
                        if(1 == int(HudOwner.PlayerOwner.PlayerReplicationInfo.abySupplyItemFlag[int(2)]))
                        {
                            bSkillReady = true;
                            // End:0x20C
                            if(bRequire && iSucess)
                            {
                                HudOwner.PlayerOwner.FmodClientPlaySound(SoundRequireHeliCopter,,, 0);
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x2E1
                        if(((int(wWP.BaseParams.eType) == int(14)) || int(wWP.BaseParams.eType) == int(11)) || int(wWP.BaseParams.eType) == int(20))
                        {
                            // End:0x28D
                            if(bRequire)
                            {
                                ECallSkillState = 6;                                
                            }
                            else
                            {
                                ECallSkillState = 3;
                            }
                            // End:0x2DE
                            if(2 == HasSkillAirStirke)
                            {
                                bSkillReady = true;
                                // End:0x2DE
                                if(bRequire && iSucess)
                                {
                                    HudOwner.PlayerOwner.FmodClientPlaySound(SoundRequireAtillery,,, 0);
                                }
                            }                            
                        }
                        else
                        {
                            // End:0x38C
                            if(int(wWP.BaseParams.eType) == int(16))
                            {
                                // End:0x317
                                if(bRequire)
                                {
                                    ECallSkillState = 7;                                    
                                }
                                else
                                {
                                    ECallSkillState = 4;
                                }
                                // End:0x389
                                if(1 == int(HudOwner.PlayerOwner.PlayerReplicationInfo.abySupplyItemFlag[int(1)]))
                                {
                                    bSkillReady = true;
                                    // End:0x389
                                    if(bRequire && iSucess)
                                    {
                                        HudOwner.PlayerOwner.FmodClientPlaySound(SoundRequireUAV,,, 0);
                                    }
                                }                                
                            }
                            else
                            {
                                // End:0x434
                                if(int(wWP.BaseParams.eType) == int(19))
                                {
                                    // End:0x3C2
                                    if(bRequire)
                                    {
                                        ECallSkillState = 18;                                        
                                    }
                                    else
                                    {
                                        ECallSkillState = 17;
                                    }
                                    // End:0x434
                                    if(1 == int(HudOwner.PlayerOwner.PlayerReplicationInfo.abySupplyItemFlag[int(4)]))
                                    {
                                        bSkillReady = true;
                                        // End:0x434
                                        if(bRequire && iSucess)
                                        {
                                            HudOwner.PlayerOwner.FmodClientPlaySound(SoundRequireSentryGun,,, 0);
                                        }
                                    }
                                }
                            }
                        }
                    }                    
                }
                else
                {
                    ECallSkillState = 3;
                }                
            }
            else
            {
                // End:0x530
                if(7 == iKey)
                {
                    // End:0x50C
                    if(1 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
                    {
                        iSkillID = HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID;
                        ECallSkillState = 16;
                        iCodeID = HudCDeathmatch(HudOwner).ActiveUsingSkill.usedStrCode;
                        // End:0x4DD
                        if(iCodeID != 0)
                        {
                            HudOwner.PlayerOwner.ReceiveLocalizedMessage(Class'Engine.wMessage_Game_ImpSystem', iCodeID);
                        }
                        // End:0x509
                        if(iSkillID > 0)
                        {
                            HudOwner.PlayerOwner.FmodClientPlaySound(SoundNotReady,,, 0);
                        }                        
                    }
                    else
                    {
                        // End:0x52D
                        if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
                        {
                            return;
                        }
                    }                    
                }
                else
                {
                    return;
                }
            }
        }
        bResultSkillRequire = iSucess;
        fLastCallTime = Level.TimeSeconds;
        // End:0x5C0
        if(int(ECallSkillState) != int(0))
        {
            // End:0x57C
            if((6 == iKey) && bRequire)
            {
                return;
            }
            // End:0x5C0
            if(!bSkillReady || bRequire && !iSucess)
            {
                HudOwner.PlayerOwner.FmodClientPlaySound(SoundNotReady,,, 0);
            }
        }
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x000! */
}

function DisplayEvent_Skill_State(Canvas C, SpriteWidget WMessage, optional SpriteWidget skillIcon, optional bool bDrawing)
{
    local CalCoordsW calW;
    local float fDeltaTime, iWidth, iHeight;
    local int iAlpha;

    // End:0x2B
    if(bDrawing)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));        
    }
    else
    {
        // End:0x59
        if(((fLastCallTime + fDrawTime) + fFadeOutTime) < Level.TimeSeconds)
        {
            ECallSkillState = 19;
        }
        fDeltaTime = Level.TimeSeconds - fLastCallTime;
        // End:0x8E
        if(fDrawTime > fDeltaTime)
        {
            iAlpha = 255;            
        }
        else
        {
            iAlpha = int(float(255) * (1.0000000 - ((fDeltaTime - fFadeOutTime) / fFadeOutTime)));
        }
        // End:0xD4
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
    // End:0x2E5
    if(skillIcon.WidgetTexture != none)
    {
        iWidth = float(skillIcon.TextureCoords.X2 - skillIcon.TextureCoords.X1);
        iHeight = float(skillIcon.TextureCoords.Y2 - skillIcon.TextureCoords.Y1);
        CalculateCoordinateEx(C, skillIcon, iWidth, iHeight, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(skillIcon.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    //return;    
}

function DisplayEvent_Skill_AirStirke(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio;
    local int X1, Y1, X2, Y2;

    // End:0x3D
    if(Level.TimeSeconds > ((HudOwner.LastAirStirkePickupTime + fDrawTime) + fFadeOutTime))
    {
        Displaying_State[int(3)] = 0;
        return;
    }
    // End:0x89
    if((Displaying_State[int(2)] == 1) && HudOwner.LastAirStirkePickupTime < HudOwner.LastHeliPickupTime)
    {
        Displaying_State[int(3)] = 0;
        bDrawSkillAirStrike = true;
        return;        
    }
    else
    {
        // End:0xD5
        if((Displaying_State[int(17)] == 1) && HudOwner.LastAirStirkePickupTime < HudOwner.LastSentryGunPickupTime)
        {
            Displaying_State[int(3)] = 0;
            bDrawSkillAirStrike = true;
            return;            
        }
        else
        {
            // End:0x121
            if((Displaying_State[int(4)] == 1) && HudOwner.LastAirStirkePickupTime < HudOwner.LastUAVPickupTime)
            {
                Displaying_State[int(3)] = 0;
                bDrawSkillAirStrike = true;
                return;                
            }
            else
            {
                // End:0x183
                if((2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState) && HudOwner.LastAirStirkePickupTime < HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime)
                {
                    Displaying_State[int(3)] = 0;
                    bDrawSkillAirStrike = true;
                    return;
                }
            }
        }
    }
    // End:0x1B6
    if(Level.TimeSeconds > (HudOwner.LastAirStirkePickupTime + fDrawTimeSkill))
    {
        bDrawSkillAirStrike = true;        
    }
    else
    {
        bDrawSkillAirStrike = false;
    }
    Displaying_State[int(3)] = 1;
    DrawEventString(C, HudOwner.LastAirStirkePickupTime, Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItem, strAirStrike), Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0), Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItemDesc, strAirStrike), sKeyBtnAirStrike);
    fDeltaTime = Level.TimeSeconds - HudOwner.LastAirStirkePickupTime;
    // End:0x272
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0000000;        
    }
    else
    {
        fRatio = (fDeltaTime - fDrawTimeSkill) / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0000000, 1.0000000);
    SkillAirstrikeOn.OffsetX = int(float(default.SkillAirstrikeOn.OffsetX) + (float(-384) * fRatio));
    SkillAirstrikeOn.OffsetY = int(float(default.SkillAirstrikeOn.OffsetY) + (float(279) * fRatio));
    CalculateCoordinateEx(C, SkillAirstrikeOn, 128.0000000 - (fRatio * float(64)), 128.0000000 - (fRatio * float(64)), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillAirstrikeOn.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DisplayEvent_Skill_UAV(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio;
    local int X1, Y1, X2, Y2;

    // End:0x3D
    if(Level.TimeSeconds > ((HudOwner.LastUAVPickupTime + fDrawTime) + fFadeOutTime))
    {
        Displaying_State[int(4)] = 0;
        return;
    }
    // End:0x7D
    if((Displaying_State[int(3)] == 1) && HudOwner.LastUAVPickupTime < HudOwner.LastAirStirkePickupTime)
    {
        bDrawSkillUAV = true;
        return;        
    }
    else
    {
        // End:0xD3
        if((2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState) && HudOwner.LastUAVPickupTime < HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime)
        {
            bDrawSkillUAV = true;
            return;
        }
    }
    // End:0x11E
    if((1 == int(HudOwner.PlayerOwner.PlayerReplicationInfo.abySupplyItemFlag[int(1)])) && Displaying_State[int(4)] == 0)
    {
        Displaying_State[int(4)] = 1;
    }
    // End:0x130
    if(Displaying_State[int(4)] == 0)
    {
        return;
    }
    // End:0x163
    if(Level.TimeSeconds > (HudOwner.LastUAVPickupTime + fDrawTimeSkill))
    {
        bDrawSkillUAV = true;        
    }
    else
    {
        bDrawSkillUAV = false;
    }
    DrawEventString(C, HudOwner.LastUAVPickupTime, Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItem, strUAV), Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0), Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySupplyItemDesc, strUAV), sKeyBtnUAV);
    fDeltaTime = Level.TimeSeconds - HudOwner.LastUAVPickupTime;
    // End:0x213
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0000000;        
    }
    else
    {
        fRatio = (fDeltaTime - fDrawTimeSkill) / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0000000, 1.0000000);
    SkillUAVOn.OffsetX = int(float(default.SkillUAVOn.OffsetX) + (float(-384) * fRatio));
    SkillUAVOn.OffsetY = int(float(default.SkillUAVOn.OffsetY) + (float(279) * fRatio));
    CalculateCoordinateEx(C, SkillUAVOn, 128.0000000 - (fRatio * float(64)), 128.0000000 - (fRatio * float(64)), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillUAVOn.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DisplayEvent_Skill_UsingSkill(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fRatio, fActiveTime;
    local int X1, Y1, X2, Y2, AddKeyPosX, iAlpha;

    local SpriteWidget wTex;
    local wGameManager GameMgr;
    local wSkillBaseParam skillParam;
    local int iLocation;
    local string SkillName, strUseKey;

    fActiveTime = HudCDeathmatch(HudOwner).ActiveUsingSkill.fActiveTime;
    // End:0x61
    if(Level.TimeSeconds > ((fActiveTime + fDrawTime) + fFadeOutTime))
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
        return;
    }
    // End:0xAB
    if((Displaying_State[int(2)] == 1) && fActiveTime < HudOwner.LastHeliPickupTime)
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
        return;        
    }
    else
    {
        // End:0xF2
        if((Displaying_State[int(4)] == 1) && fActiveTime < HudOwner.LastUAVPickupTime)
        {
            HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
            return;
        }
    }
    // End:0x139
    if((Displaying_State[int(3)] == 1) && fActiveTime < HudOwner.LastAirStirkePickupTime)
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed = true;
        return;
    }
    fDeltaTime = Level.TimeSeconds - fActiveTime;
    // End:0x171
    if(fDeltaTime < fDrawTime)
    {
        fFadeOutEffect = 1.0000000;        
    }
    else
    {
        fFadeOutEffect = 1.0000000 - ((fDeltaTime - fDrawTime) / fFadeOutTime);
    }
    iAlpha = int(float(255) * fFadeOutEffect);
    // End:0x1C2
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    DrawHelpBG(C,, 734);
    GameMgr = Level.GameMgr;
    skillParam = GameMgr.GetSkillParam(HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID);
    iLocation = InStr(skillParam.strName, "]");
    SkillName = Mid(skillParam.strName, iLocation + 2);
    // End:0x29B
    if(HudCDeathmatch(HudOwner).ActiveUsingSkill.iSlotPos == 7)
    {
        strUseKey = skeyUseKey;        
    }
    else
    {
        strUseKey = skeyBtnC4;
    }
    DrawEventString(C, fActiveTime, Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySkill, SkillName), Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0), Class'Engine.BTCustomDrawHK'.static.FormatString(strReadySkillDesc, SkillName), strUseKey);
    // End:0x368
    if(HudCDeathmatch(HudOwner).ActiveUsingSkill.iSlotPos == 7)
    {
        C.BtrDrawTextJustifiedWithVolumeLine(skeyUseKey, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));        
    }
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLine(skeyBtnC4, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));
    }
    // End:0x3E4
    if(Level.TimeSeconds > (fActiveTime + fDrawTimeSkill))
    {
        HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawedIcon = true;
    }
    // End:0x401
    if(fDeltaTime < fDrawTimeSkill)
    {
        fRatio = 0.0000000;        
    }
    else
    {
        fRatio = (fDeltaTime - fDrawTimeSkill) / fDrawTimeEffect;
    }
    fRatio = FClamp(fRatio, 0.0000000, 1.0000000);
    SkillIconEvent.WidgetTexture = HudCDeathmatch(HudOwner).ActiveUsingSkill.matIcon[0];
    SkillIconEvent.OffsetX = int(float(default.SkillIconEvent.OffsetX) + (float(-454) * fRatio));
    SkillIconEvent.OffsetY = int(float(default.SkillIconEvent.OffsetY) + (float(279) * fRatio));
    CalculateCoordinateEx(C, SkillIconEvent, 128.0000000 - (fRatio * float(64)), 128.0000000 - (fRatio * float(64)), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * fFadeOutEffect));
    C.DrawTile(SkillIconEvent.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DrawEvent_Item(Canvas C)
{
    local PlayerReplicationInfo curPRI;

    // End:0x104
    if((Level.GRI.GameClass == "WMission.wSDGameInfo") || Level.GRI.GameClass == "WMission.wSBTGameInfo")
    {
        // End:0xE4
        if((Pawn(HudOwner.PlayerOwner.ViewTarget) != none) && Pawn(HudOwner.PlayerOwner.ViewTarget).PlayerReplicationInfo != none)
        {
            curPRI = Pawn(HudOwner.PlayerOwner.ViewTarget).PlayerReplicationInfo;            
        }
        else
        {
            curPRI = HudOwner.PlayerOwner.PlayerReplicationInfo;
        }        
    }
    else
    {
        curPRI = HudOwner.PlayerOwner.PlayerReplicationInfo;
    }
    // End:0x14C
    if(curPRI != none)
    {
        Draw_Item_Supply(C, curPRI);
        Draw_Item_Skill(C, curPRI);
    }
    //return;    
}

function Draw_Item_Supply(Canvas C, PlayerReplicationInfo curPRI)
{
    // End:0x0D
    if(none == HudOwner)
    {
        return;
    }
    // End:0x23
    if(none == HudOwner.PlayerOwner)
    {
        return;
    }
    // End:0x49
    if(1 == int(curPRI.abySupplyItemFlag[int(1)]))
    {
        DisplayEvent_Skill_UAV(C);
    }
    // End:0xC0
    if(1 == int(curPRI.abySupplyItemFlag[int(2)]))
    {
        DisplayEvent_Skill_Helicopter(C);
        // End:0xC0
        if((int(5) == int(ECallSkillState)) && false == bResultSkillRequire)
        {
            DrawEventString(C, fLastCallTime, strHelicopterFailed, Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0), strHelicopterFailedDesc, "");
        }
    }
    // End:0x19B
    if(1 == int(curPRI.abySupplyItemFlag[int(3)]))
    {
        DisplayEvent_Skill_AirStirke(C);
        // End:0x13A
        if(int(3) == int(ECallSkillState))
        {
            // End:0x137
            if(HudOwner.PlayerOwner.Pawn.Weapon.IsA('wAirStrike'))
            {
                DisplayEvent_Skill_State(C, WAirStirkeSellect,, true);
            }            
        }
        else
        {
            // End:0x19B
            if((int(6) == int(ECallSkillState)) || int(3) == int(ECallSkillState))
            {
                // End:0x19B
                if(false == bResultSkillRequire)
                {
                    DrawEventString(C, fLastCallTime, strAirStrikeFailed, Class'Engine.Canvas'.static.MakeColor(byte(255), 204, 0), strAirStrikeFailedDesc, "");
                }
            }
        }
    }
    // End:0x212
    if(1 == int(curPRI.abySupplyItemFlag[int(4)]))
    {
        DisplayEvent_Skill_SentryGun(C);
        // End:0x212
        if((int(18) == int(ECallSkillState)) && false == bResultSkillRequire)
        {
            DrawEventString(C, fLastCallTime, strSentryGunFailed, Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0), strSentryGunFailedDesc, "");
        }
    }
    //return;    
}

function Draw_Item_Skill(Canvas C, PlayerReplicationInfo curPRI)
{
    // End:0xA7
    if(1 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
    {
        // End:0x91
        if((int(16) == int(ECallSkillState)) && !HudOwner.PlayerOwner.SkillBase.GetUsed(HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID))
        {
            DisplayEvent_Skill_NotReady(C, HudCDeathmatch(HudOwner).ActiveUsingSkill.iSkillID);
        }
        // End:0xA4
        if(1 == HasSkillRPG7)
        {
            bRPG7Active = false;
        }        
    }
    else
    {
        // End:0x145
        if(2 == HudCDeathmatch(HudOwner).ActiveUsingSkill.iState)
        {
            // End:0x11C
            if(HudOwner.PlayerOwner.Pawn.Weapon.IsA('wAirStrike') && int(10) == int(ECallSkillState))
            {
                DisplayEvent_Skill_State(C, WAirStirkeSellect,, true);                
            }
            else
            {
                // End:0x145
                if(!HudCDeathmatch(HudOwner).ActiveUsingSkill.bDrawed)
                {
                    DisplayEvent_Skill_UsingSkill(C);
                }
            }
        }
    }
    //return;    
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
    //return;    
}

function DrawGauge(Canvas C, float fProgressPct)
{
    local CalCoordsW calW;
    local float fWidth;

    WRespawnBG.OffsetX = default.WRespawnBG.OffsetX;
    WRespawnBG.OffsetY = default.WRespawnBG.OffsetY;
    CalculateCoordinateEx(C, WRespawnBG, 511.0000000, 29.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WRespawnGauge.OffsetX = default.WRespawnGauge.OffsetX;
    WRespawnGauge.OffsetY = default.WRespawnGauge.OffsetY;
    fWidth = 507.0000000 * fProgressPct;
    CalculateCoordinateEx(C, WRespawnGauge, fWidth, 25.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    //return;    
}

function DisplayEvent_Respawn(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fProgressPct, fRespawnTimeLength;
    local string invincible;
    local float RandomRespawnTextPos;

    // End:0x1A
    if(HudOwner.DiedTime == 0.0000000)
    {
        return;
    }
    fRespawnTimeLength = HudOwner.PlayerOwner.AdjustRespawnTime();
    // End:0x62
    if(Level.TimeSeconds > (HudOwner.DiedTime + fRespawnTimeLength))
    {
        return;
    }
    // End:0x7C
    if(HudOwner.DiedTime < 5.0000000)
    {
        return;
    }
    // End:0x99
    if(Level.GRI.bStopCountDown)
    {
        return;
    }
    ResetState();
    C.SetPos(544.0000000 * _reX, (948.0000000 + float(80)) * _reY);
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.DrawTileStretched(Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_2', 511.0000000 * _reX, 51.0000000 * _reY);
    RandomRespawnTextPos = 370.0000000;
    RandomRespawnTextPos = 350.0000000;
    fDeltaTime = Level.TimeSeconds - HudOwner.DiedTime;
    // End:0x15E
    if(fDeltaTime > fRespawnTimeLength)
    {
        return;
    }
    fProgressPct = fDeltaTime / fRespawnTimeLength;
    DrawGauge(C, fProgressPct);
    // End:0x1BA
    if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner())
    {
        invincible = lsIsInvincibleBeginner;        
    }
    else
    {
        invincible = lsIsInvincible;
    }
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(invincible, 1, 0.0000000, fBeginRespawnPosY * _reY, 1600.0000000 * _reX, fEndRespawnPosY * _reY, int(float(FontSizeRespawn) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x2C7
    if(!Level.GetMatchMaker().IsSDRespawn())
    {
        C.BtrDrawTextJustified(safeZoneRandomRespawn, 1, 558.0000000 * _reX, 1041.0000000 * _reY, 1041.0000000 * _reX, 1066.0000000 * _reY, int(float(18) * _reY));        
    }
    else
    {
        C.BtrDrawTextJustified(RespawnText, 1, 558.0000000 * _reX, 1041.0000000 * _reY, 1041.0000000 * _reX, 1066.0000000 * _reY, int(float(18) * _reY));
    }
    //return;    
}

function DrawGauge2(Canvas C, float fProgressPct, float PosX, float PosY)
{
    local CalCoordsW calW;
    local float fWidth;

    WRespawnBG.OffsetX = int(PosX);
    WRespawnBG.OffsetY = int(PosY);
    CalculateCoordinateEx(C, WRespawnBG, 511.0000000, 29.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WRespawnGauge.OffsetX = int(PosX + float(2));
    WRespawnGauge.OffsetY = int(PosY + float(2));
    fWidth = 507.0000000 * fProgressPct;
    CalculateCoordinateEx(C, WRespawnGauge, fWidth, 25.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRespawnGauge.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    //return;    
}

function DrawInvincibleGauge(Canvas C)
{
    local float fDeltaTime, fProgressPct, fInvincibleTimeLength;
    local string invincible;

    ResetState();
    // End:0x62
    if((Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_SD()) || Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
    {
        return;
    }
    // End:0x7C
    if(HudOwner.GoWalkingBeginTime <= 0.0000000)
    {
        return;
    }
    // End:0xB8
    if(Level.GetMatchMaker().BeginnerMode)
    {
        fInvincibleTimeLength = HudOwner.PawnOwner.fRespawnInvulnerableTimeBeginner;        
    }
    else
    {
        // End:0x104
        if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_SD())
        {
            fInvincibleTimeLength = HudOwner.PawnOwner.fRespawnInvulnerableTime_SDMode;            
        }
        else
        {
            // End:0x13E
            if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
            {
                fInvincibleTimeLength = 0.0000000;                
            }
            else
            {
                fInvincibleTimeLength = HudOwner.PawnOwner.fRespawnInvulnerableTime;
            }
        }
    }
    fDeltaTime = Level.TimeSeconds - HudOwner.GoWalkingBeginTime;
    // End:0x1AC
    if(fDeltaTime > fInvincibleTimeLength)
    {
        bDisplayEvent_Invincible = false;
        HudOwner.GoWalkingBeginTime = 0.0000000;
        return;
    }
    fProgressPct = fDeltaTime / fInvincibleTimeLength;
    DrawGauge2(C, fProgressPct, 548.0000000, 926.0000000);
    // End:0x212
    if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner())
    {
        invincible = lsIsInvincibleBeginner;        
    }
    else
    {
        invincible = lsIsInvincible;
    }
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(invincible, 1, 0.0000000, 881.0000000 * _reY, 1600.0000000 * _reX, 905.0000000 * _reY, int(float(FontSizeRespawn) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
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
    // End:0x3A
    if(int(Level.GRI.RoundState) != int(2))
    {
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawHelpBG(C,, 328);
    WKeyButtonBG.OffsetX = 619;
    WKeyButtonBG.OffsetY = 348;
    CalculateCoordinateEx(C, WKeyButtonBG, 52.0000000, 52.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WKeyButtonBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x201
    if(HudCDeathmatch(HudOwner).bBlinkState)
    {
        WKeyButtonBGBlink.OffsetX = WKeyButtonBG.OffsetX - 2;
        WKeyButtonBGBlink.OffsetY = WKeyButtonBG.OffsetY - 2;
        CalculateCoordinateEx(C, WKeyButtonBGBlink, 56.0000000, 56.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    X1 = int(float(int(float(WKeyButtonBG.OffsetX) + 7.0000000)) * _reX);
    Y1 = int(float(int(float(WKeyButtonBG.OffsetY) + 7.0000000)) * _reY);
    X2 = int(float(int(float(WKeyButtonBG.OffsetX) + 45.0000000)) * _reX);
    Y2 = int(float(int(float(WKeyButtonBG.OffsetY) + 35.0000000)) * _reY);
    C.SetDrawColor(0, 0, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(skeyUseKey, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(FontSizeKey) * _reY));
    iWidth = WMessage.TextureCoords.X2 - WMessage.TextureCoords.X1;
    iHeight = WMessage.TextureCoords.Y2 - WMessage.TextureCoords.Y1;
    CalculateCoordinateEx(C, WMessage, float(iWidth), float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
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
    // End:0x3A
    if(int(Level.GRI.RoundState) != int(2))
    {
        return;
    }
    // End:0x4E
    if(SDDoing)
    {
        iAlpha = 255;        
    }
    else
    {
        iAlpha = int(float(255) * ProgressPct);
        // End:0x7F
        if(float(iAlpha) < MinAlpha)
        {
            iAlpha = int(MinAlpha);
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    DrawHelpBG(C,, 328);
    // End:0xCB
    if(SDDoing)
    {
        DrawGauge(C, ProgressPct);
    }
    iWidth = WMessage.TextureCoords.X2 - WMessage.TextureCoords.X1;
    iHeight = WMessage.TextureCoords.Y2 - WMessage.TextureCoords.Y1;
    CalculateCoordinateEx(C, WMessage, float(iWidth), float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
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
    // End:0x3A
    if(int(Level.GRI.RoundState) != int(2))
    {
        return;
    }
    // End:0x4E
    if(CaptureDoing)
    {
        iAlpha = 255;        
    }
    else
    {
        iAlpha = int(float(255) * ProgressPct);
        // End:0x7F
        if(float(iAlpha) < MinAlpha)
        {
            iAlpha = int(MinAlpha);
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    DrawHelpBG(C,, 328);
    // End:0xCB
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
    //return;    
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
    //return;    
}

function DrawEffect(Canvas C, float StartTime, int iAlpha)
{
    local float fLifeTime, fEndOfLife, FadeValue, fFadeOutTime, fTotalEffectRunTime, fEffectRunTime1,
	    fEffectRunTime2, fRealDrawTime, CurrentScale, Delta, Delta2,
	    fPassingTime, StartScale, fScaleStepMultiplier, fScaleStep;

    fLifeTime = 6.0000000;
    fTotalEffectRunTime = Class'Engine.wMessage_Score'.default.fTotalEffectRunTime;
    fEffectRunTime1 = Class'Engine.wMessage_Score'.default.fEffectRunTime1;
    fEffectRunTime2 = Class'Engine.wMessage_Score'.default.fEffectRunTime2;
    StartScale = Class'Engine.wMessage_Score'.default.StartScale;
    fScaleStepMultiplier = Class'Engine.wMessage_Score'.default.ScaleStepMultiplier;
    fScaleStep = Class'Engine.wMessage_Score'.default.ScaleStep;
    fRealDrawTime = fLifeTime - fTotalEffectRunTime;
    fEndOfLife = StartTime + fMessageDrawTime;
    Delta = fEndOfLife - Level.TimeSeconds;
    Delta = FClamp(Delta, 0.0000000, fLifeTime);
    fPassingTime = fLifeTime - Delta;
    // End:0x229
    if(fPassingTime <= fTotalEffectRunTime)
    {
        Delta2 = MessageLastTime - Delta;
        // End:0x139
        if(Delta2 > 0.0100000)
        {
            MessageLastTime = Delta;
            MessageAccelStep += (fScaleStep * fScaleStepMultiplier);
        }
        CurrentScale = StartScale * (1.0000000 - (fPassingTime / fEffectRunTime1));
        CurrentScale = CurrentScale - MessageAccelStep;
        CurrentScale = FClamp(CurrentScale, 0.9900000, StartScale);
        MessageAlpha = int(float(100) * (1.0000000 - (CurrentScale / StartScale)));
        C.DrawColor = C.MakeColor(byte(255), 153, 0);
        C.DrawColor.A = byte(MessageAlpha);
        // End:0x226
        if(CurrentScale < float(1))
        {
            CurrentScale = 1.0000000;
            MessageAccelStep = 0.0000000;
            MessageAlpha = 0;
            C.DrawColor.A = byte(255);
        }        
    }
    else
    {
        MessageEffect = 0;
        MessageAccelStep = 0.0000000;
        CurrentScale = 1.0000000;
        fFadeOutTime = Class'Engine.wMessage_Score'.default.fFadeOutTime;
        FadeValue = (fBeginMessageTime_Go + fMessageDrawTime) - Level.TimeSeconds;
        FadeValue = FadeValue / (fRealDrawTime - fFadeOutTime);
        C.DrawColor.A = byte(float(iAlpha) * FClamp(FadeValue, 0.0000000, 1.0000000));
    }
    C.DrawColor.A = byte(Clamp(int(C.DrawColor.A), 1, 255));
    C.DrawColor = C.MakeColorNoEmpty(byte(255), byte(255), byte(255), C.DrawColor.A);
    //return;    
}

function DrawMessage_Go(Canvas C)
{
    local CalCoordsW calW;
    local int iAlpha;
    local float fFadeOut, fDeltaTime;

    fDeltaTime = Level.TimeSeconds - fBeginMessageTime_Go;
    // End:0x3B
    if(fDeltaTime >= (fMessageDrawTime_Go + fFadeOutTime_Go))
    {
        DMState = 0;
        return;
    }
    // End:0x58
    if(fDeltaTime < fMessageDrawTime_Go)
    {
        fFadeOut = 1.0000000;        
    }
    else
    {
        fFadeOut = 1.0000000 - ((fDeltaTime - fMessageDrawTime_Go) / fFadeOutTime_Go);
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0xA9
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    CalculateCoordinateEx(C, WGo, 1024.0000000, 218.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WGo.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function DrawMessage_Start(Canvas C)
{
    local CalCoordsW calW;
    local SpriteWidget WDrawType, WTeamMark;
    local string DrawMessage;
    local int iAlpha, X1, Y1, X2, Y2;

    local float fFadeOut, fDeltaTime, fIntervalTime;

    // End:0x59
    if((Level.GRI.GameClass != "WGame.wDeathMatch") && HudOwner.PlayerOwner.PlayerReplicationInfo.Team == none)
    {
        return;
    }
    fIntervalTime = 0.0000000;
    // End:0x9B
    if((Level.TimeSeconds - (fBeginMessageTime + fIntervalTime)) > (fMessageDrawTime + fFadeOutTime))
    {
        bMessageDraw = false;
        return;
    }
    // End:0x187
    if(false == bMessageDraw)
    {
        bMessageDraw = true;
        // End:0x134
        if(int(DMState) == int(0))
        {
            // End:0x134
            if(((Level.GetMatchMaker() != none) && Level.GRI != none) && Level.GetMatchMaker().iTimeLimit != Level.GRI.RemainingTime)
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
    fDeltaTime = Level.TimeSeconds - (fBeginMessageTime + fIntervalTime);
    // End:0x1C1
    if(fDeltaTime >= (fMessageDrawTime + fFadeOutTime))
    {
        return;
    }
    // End:0x1DE
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0000000;        
    }
    else
    {
        fFadeOut = 1.0000000 - ((fDeltaTime - fMessageDrawTime) / fFadeOutTime);
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0x22F
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    // End:0x2EF
    if(Level.GRI.GameClass == "WGame.wTeamGame")
    {
        // End:0x2A1
        if(Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner() == Level.GetMatchMaker().kGame_GameMode)
        {
            WDrawType = WGameTypeFM;
            DrawMessage = BeginMessageFM;            
        }
        else
        {
            // End:0x2D6
            if(Level.GetMatchMaker().BotTutorial)
            {
                WDrawType = WGameTypeTM;
                DrawMessage = BeginMessageTM;                
            }
            else
            {
                WDrawType = WGameTypeTD;
                DrawMessage = BeginMessageTD;
            }
        }        
    }
    else
    {
        // End:0x33B
        if(Level.GRI.GameClass == "WMission.wDOMGameInfo")
        {
            WDrawType = WGameTypeDOMI;
            DrawMessage = BeginMessageDOMI;            
        }
        else
        {
            // End:0x383
            if(Level.GRI.GameClass == "WGame.wDeathMatch")
            {
                WDrawType = WGameTypeDM;
                DrawMessage = BeginMessageDM;                
            }
            else
            {
                // End:0x3D1
                if(Level.GRI.GameClass ~= "wMission.wAlienGameInfo")
                {
                    WDrawType = WGameTypeAlienMode;
                    DrawMessage = BeginMessageAlienMode;                    
                }
            }
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    WBGStart.OffsetX = 0;
    WBGStart.OffsetY = 536;
    CalculateCoordinateEx(C, WBGStart, 1600.0000000, 128.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStart.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WDrawType.OffsetX = 314;
    WDrawType.OffsetY = 568;
    CalculateCoordinateEx(C, WDrawType, 256.0000000, 64.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDrawType.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(217, 160, 20, byte(iAlpha));
    X1 = int(float(800) * _reX);
    Y1 = int(float(604) * _reY);
    X2 = int(float(1452) * _reX);
    Y2 = int(float(633) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(DrawMessage, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(21) * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    // End:0x728
    if(Level.GRI.GameClass ~= "wMission.wAlienGameInfo")
    {
        WTeamMark = WTeamMarkHumanTeam;
        WTeamMark.OffsetX = 0;
        WTeamMark.OffsetY = 434;
        CalculateCoordinateEx(C, WTeamMark, 313.0000000, 242.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        // End:0x761
        if(Level.GRI.GameClass == "WGame.wDeathMatch")
        {
            TeamIndex = 0;            
        }
        else
        {
            TeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
        }
        // End:0x7A9
        if(TeamIndex == 0)
        {
            WTeamMark = WTeamMarkAF;            
        }
        else
        {
            WTeamMark = WTeamMarkRSA;
        }
        WTeamMark.OffsetX = 0;
        WTeamMark.OffsetY = 443;
        CalculateCoordinateEx(C, WTeamMark, 314.0000000, 314.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    WHelpBG.OffsetX = default.WHelpBG.OffsetX;
    WHelpBG.OffsetY = default.WHelpBG.OffsetY;
    //return;    
}

function DrawMessage_StartDefence(Canvas C)
{
    local CalCoordsW calW;
    local int iAlpha, X1, Y1, X2, Y2, i,
	    idx;

    local float fFadeOut, fDeltaTime, fIntervalTime;

    fIntervalTime = 0.0000000;
    // End:0x56
    if((Level.TimeSeconds - (fBeginMessageTime + fIntervalTime)) > (fMessageDrawTime + fFadeOutTime))
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
        // End:0xEF
        if(int(DMState) == int(0))
        {
            // End:0xEF
            if(((Level.GetMatchMaker() != none) && Level.GRI != none) && Level.GetMatchMaker().iTimeLimit != Level.GRI.RemainingTime)
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
    fDeltaTime = Level.TimeSeconds - (fBeginMessageTime + fIntervalTime);
    // End:0x17C
    if(fDeltaTime >= (fMessageDrawTime + fFadeOutTime))
    {
        return;
    }
    // End:0x199
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0000000;        
    }
    else
    {
        fFadeOut = 1.0000000 - ((fDeltaTime - fMessageDrawTime) / fFadeOutTime);
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0x1EA
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    CalculateCoordinateEx(C, WBGStartDF, 1024.0000000, 279.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStartDF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    DigitsNumberSecond.Value = CurrentRound / 10;
    DigitsNumberFirst.Value = int(float(CurrentRound) % float(10));
    DigitsNumberSecond.OffsetX = 708;
    DigitsNumberSecond.OffsetY = 512;
    DigitsNumberFirst.OffsetX = 800;
    DigitsNumberFirst.OffsetY = 512;
    CalculateCoordinateDigitEx(C, WDigitsDFRoundNumber, DigitsNumberSecond, 92.0000000, 78.0000000, DigitsNumberSecond.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsDFRoundNumber.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    CalculateCoordinateDigitEx(C, WDigitsDFRoundNumber, DigitsNumberFirst, 92.0000000, 78.0000000, DigitsNumberFirst.Value, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsDFRoundNumber.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    X1 = 803 - ((wDefenceGradeList.Length * 85) / 2);
    i = 0;
    J0x47F:

    // End:0x593 [Loop If]
    if(i < wDefenceGradeList.Length)
    {
        idx = wDefenceGradeList[i] - 901;
        // End:0x4C7
        if((idx < 0) || idx > 15)
        {
            idx = 0;
        }
        wDefenceBotIcon[idx].OffsetX = X1;
        CalculateCoordinateEx(C, wDefenceBotIcon[idx], 80.0000000, 80.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(wDefenceBotIcon[idx].WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        X1 += 85;
        ++i;
        // [Loop Continue]
        goto J0x47F;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    X1 = int(float(658) * _reX);
    Y1 = int(float(632) * _reY);
    X2 = int(float(942) * _reX);
    Y2 = int(float(651) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageDF, 1, float(X1), float(Y1), float(X2), float(Y2), int(float(14) * _reY));
    //return;    
}

function DrawMessage_WaitingCountGM(Canvas C)
{
    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x36
    if((fReceiveTime_StartupMessage + float(2)) <= Level.TimeSeconds)
    {
        return;
    }
    // End:0x55
    if((int(sWaitingMessage) > 10) || int(sWaitingMessage) == 0)
    {
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawCountDown(C, int(sWaitingMessage));
    //return;    
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
    if((fReceiveTime_StartupMessage + float(2)) <= Level.TimeSeconds)
    {
        return;
    }
    CalculateCoordinateEx(C, WGameMessageWaiting, 512.0000000, 44.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WGameMessageWaiting.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    DrawCountDown(C, int(sWaitingMessage));
    //return;    
}

function DrawCountDown(Canvas C, coerce int iCount)
{
    local CalCoordsW calW;
    local int iWaitingTime, iSecond, iFirst;

    WHelpBG.OffsetX = 0;
    WHelpBG.OffsetY = 441;
    CalculateCoordinateEx(C, WHelpBG, 1600.0000000, 103.0000000, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WHelpBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iWaitingTime = iCount;
    iSecond = iWaitingTime / 10;
    iFirst = int(float(iWaitingTime) % float(10));
    // End:0x1F0
    if(0 != iSecond)
    {
        DigitsNumberSecond.OffsetX = 756;
        DigitsNumberSecond.OffsetY = 458;
        CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsNumberSecond, 43.0000000, 60.0000000, iSecond, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        DigitsNumberFirst.OffsetX = 799;
        DigitsNumberFirst.OffsetY = 458;        
    }
    else
    {
        DigitsNumberFirst.OffsetX = 778;
        DigitsNumberFirst.OffsetY = 458;
    }
    CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsNumberFirst, 43.0000000, 60.0000000, iFirst, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
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
    if(fDeltaTime > (fMessageDrawTime + fFadeOutTime))
    {
        bIsDraw_Intrusion = true;
        DMState = 0;
        return;
    }
    // End:0x90
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0000000;        
    }
    else
    {
        fFadeOut = 1.0000000 - ((fDeltaTime - fMessageDrawTime) / fFadeOutTime);
    }
    iRound_Instrusion = iRound;
    iAlpha = int(float(255) * fFadeOut);
    // End:0xEC
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    DisplayMessage_Mission(C, iAttackTeam, iAlpha);
    //return;    
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
    else
    {
        // End:0x81
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            WDrawType = WGameTypeSB;            
        }
        else
        {
            // End:0xB8
            if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
            {
                WDrawType = WGameTypeDOA;
            }
        }
    }
    // End:0xCA
    if(int(DMState) != int(2))
    {
        return;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    iFontSize = int(float(21) * _reY);
    WBGStart.OffsetX = 0;
    WBGStart.OffsetY = 536;
    CalculateCoordinateEx(C, WBGStart, 1600.0000000, 155.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStart.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WDrawType.OffsetX = 314;
    WDrawType.OffsetY = 568;
    CalculateCoordinateEx(C, WDrawType, 256.0000000, 64.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDrawType.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(217, 160, 20, byte(iAlpha));
    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    AttackTeamIndex = iAttackTeam;
    X1 = int(float(800) * _reX);
    Y1 = int(float(604) * _reY);
    X2 = int(float(1452) * _reX);
    Y2 = int(float(633) * _reY);
    // End:0x3CC
    if(Level.GRI.GameClass == "WMission.wSDGameInfo")
    {
        // End:0x392
        if(iTeamIndex == iAttackTeam)
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDA1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);            
        }
        else
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDD1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }        
    }
    else
    {
        // End:0x439
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSB, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);            
        }
        else
        {
            // End:0x4A0
            if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
            {
                C.BtrDrawTextJustifiedWithVolumeLine(GetMessageGameMode_DOA(), 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);                
            }
            else
            {
                // End:0x50C
                if(Level.GRI.GameClass == "wMission.wAlienGameInfo")
                {
                    C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageAlienMode, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
                }
            }
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    // End:0x608
    if(Level.GRI.GameClass ~= "wMission.wAlienGameInfo")
    {
        WTeamMark = WTeamMarkHumanTeam;
        CalculateCoordinateEx(C, WTeamMark, 0.0000000, 434.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
        // End:0x650
        if(iTeamIndex == 0)
        {
            WTeamMark = WTeamMarkAF;            
        }
        else
        {
            WTeamMark = WTeamMarkRSA;
        }
        WTeamMark.OffsetX = 0;
        WTeamMark.OffsetY = 443;
        CalculateCoordinateEx(C, WTeamMark, 314.0000000, 314.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    WHelpBG.OffsetX = default.WHelpBG.OffsetX;
    WHelpBG.OffsetY = default.WHelpBG.OffsetY;
    //return;    
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
    else
    {
        // End:0xB3
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            WDrawType = WGameChangePosition;
        }
    }
    // End:0xC5
    if(int(DMState) != int(2))
    {
        return;
    }
    WBGStart.OffsetX = 0;
    WBGStart.OffsetY = 536;
    CalculateCoordinateEx(C, WBGStart, 1600.0000000, 128.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WBGStart.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WDrawType.OffsetX = 314;
    WDrawType.OffsetY = 568;
    CalculateCoordinateEx(C, WDrawType, 256.0000000, 64.0000000, calW);
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
    // End:0x39D
    if(Level.GRI.GameClass == "WMission.wSDGameInfo")
    {
        // End:0x363
        if(iTeamIndex == iAttackTeam)
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDA1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);            
        }
        else
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSDD1, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
        }        
    }
    else
    {
        // End:0x40A
        if(Level.GRI.GameClass == "WMission.wSBTGameInfo")
        {
            C.BtrDrawTextJustifiedWithVolumeLine(BeginMessageSB, 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);            
        }
        else
        {
            // End:0x46E
            if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
            {
                C.BtrDrawTextJustifiedWithVolumeLine(GetMessageGameMode_DOA(), 1, float(X1), float(Y1), float(X2), float(Y2), iFontSize);
            }
        }
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    // End:0x4D8
    if(iTeamIndex == 0)
    {
        WTeamMark = WTeamMarkAF;        
    }
    else
    {
        WTeamMark = WTeamMarkRSA;
    }
    WTeamMark.OffsetX = 0;
    WTeamMark.OffsetY = 443;
    CalculateCoordinateEx(C, WTeamMark, 314.0000000, 314.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTeamMark.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WHelpBG.OffsetX = default.WHelpBG.OffsetX;
    WHelpBG.OffsetY = default.WHelpBG.OffsetY;
    //return;    
}

function DisplayRoundResult(Canvas C, int ScoringTeam, int iMyTeam)
{
    local CalCoordsW calW;
    local int iCountAF, iCountRSA, iFirst, iSecond;
    local wMatchMaker MM;

    // End:0x16
    if(Level.GRI == none)
    {
        return;
    }
    // End:0x2C
    if(HudOwner.PlayerOwner == none)
    {
        return;
    }
    MM = Level.GetMatchMaker();
    iCountAF = int(Level.GRI.Teams[0].Score);
    iCountRSA = int(Level.GRI.Teams[1].Score);
    // End:0x13E
    if(ScoringTeam == iMyTeam)
    {
        CalculateCoordinateEx(C, WRoundWin, 512.0000000, 96.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WRoundWin.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        CalculateCoordinateEx(C, WRoundLose, 512.0000000, 96.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WRoundLose.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    CalculateCoordinateEx(C, WRoundResultBG, 1600.0000000, 293.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WRoundResultBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x3BF
    if(MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
    {
        CalculateCoordinateEx(C, WTeamBigMarkHumanTeam, 492.0000000, 370.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamBigMarkHumanTeam.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        CalculateCoordinateEx(C, WTeamBigMarkAlienTeam, 492.0000000, 370.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamBigMarkAlienTeam.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        WTeamMarkAF.OffsetX = 380;
        WTeamMarkAF.OffsetY = 473;
        CalculateCoordinateEx(C, WTeamMarkAF, 255.0000000, 255.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamMarkAF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        WTeamMarkRSA.OffsetX = 964;
        WTeamMarkRSA.OffsetY = 473;
        CalculateCoordinateEx(C, WTeamMarkRSA, 255.0000000, 255.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WTeamMarkRSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x577
    if(Level.GRI.Teams[0].TeamIndex == iMyTeam)
    {
        C.SetDrawColor(byte(255), 150, 0, byte(255));        
    }
    else
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x5C9
    if(iCountAF >= 10)
    {
        iFirst = iCountAF / 10;
        iSecond = int(float(iCountAF) % float(10));        
    }
    else
    {
        iFirst = 0;
        iSecond = iCountAF;
    }
    // End:0x5E6
    if(iFirst > 0)
    {
    }
    CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsRoundWinAF, 50.0000000, 70.0000000, iSecond, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    DigitsRoundWinAF.OffsetX = default.DigitsRoundWinAF.OffsetX;
    // End:0x6E6
    if(Level.GRI.Teams[1].TeamIndex == iMyTeam)
    {
        C.SetDrawColor(byte(255), 150, 0, byte(255));        
    }
    else
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    }
    // End:0x738
    if(iCountRSA >= 10)
    {
        iFirst = iCountRSA / 10;
        iSecond = int(float(iCountRSA) % float(10));        
    }
    else
    {
        iFirst = 0;
        iSecond = iCountRSA;
    }
    // End:0x755
    if(iFirst > 0)
    {
    }
    CalculateCoordinateDigitEx(C, WDigitsNumberBig, DigitsRoundWinRSA, 50.0000000, 70.0000000, iSecond, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WDigitsNumberBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    WCompareSign.OffsetX = 793;
    WCompareSign.OffsetY = 574;
    CalculateCoordinateEx(C, WCompareSign, 14.0000000, 55.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WCompareSign.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    bMessageDraw = false;
    //return;    
}

function DrawRoundResult(Canvas C, int ScoringTeam, int iMyTeam)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DisplayRoundResult(C, ScoringTeam, iMyTeam);
    //return;    
}

function DrawMainTimer(Canvas C)
{
    //return;    
}

function DrawMainScore(Canvas C)
{
    local int _iPosX, _iPosY;
    local CalCoordsW calW;
    local int iScoreAF, iScoreRSA, iGoalScore, iFourth, iThird, iSecond,
	    iFirst, iWidth, iHeight, iCount, iTeamIndex;

    local float fX1, fX2, fY1, fY2;

    _iPosX = 557;
    _iPosY = 5;
    // End:0x8A
    if((HudOwner.PlayerOwner.PlayerReplicationInfo != none) && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none)
    {
        iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamIndex = 0;
    }
    CalculateCoordinateEx(C, WTeamScoreBG, 598.0000000, 87.0000000, calW);
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

    // End:0x381 [Loop If]
    if(iCount < 4)
    {
        DigitsGoalScore[iCount].OffsetX = default.DigitsGoalScore[iCount].OffsetX + _iPosX;
        DigitsGoalScore[iCount].OffsetY = default.DigitsGoalScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsGoalScore[iCount], float(iWidth), float(iHeight), DigitsGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x265;
    }
    iScoreAF = int(Level.GRI.Teams[0].Score);
    iScoreRSA = int(Level.GRI.Teams[1].Score);
    DrawMainScoreTeam(C, iScoreAF, iScoreRSA, _iPosX, _iPosY, calW);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawRemaingTime(C, _iPosX, _iPosY);
    //return;    
}

function DrawRemaingTime(Canvas C, int _iPosX, int _iPosY)
{
    local int iWidth, iHeight;
    local float fX1, fX2, fY1, fY2;
    local int iFourth, iThird, iSecond, iFirst;

    iWidth = 13;
    iHeight = 18;
    iFourth = HudOwner.TimeMinutes / 10;
    iThird = int(float(HudOwner.TimeMinutes) % float(10));
    iSecond = HudOwner.TimeSeconds / 10;
    iFirst = int(float(HudOwner.TimeSeconds) % float(10));
    fX1 = (213.0000000 + float(_iPosX)) * _reX;
    fY1 = (43.0000000 + float(_iPosY)) * _reY;
    fX2 = (226.0000000 + float(_iPosX)) * _reX;
    fY2 = (60.0000000 + float(_iPosY)) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine((((("" $ string(iFourth)) $ string(iThird)) $ ":") $ string(iSecond)) $ string(iFirst), 1, 0.0000000, fY1, 1600.0000000 * _reX, fY2, int(float(17) * _reY));
    //return;    
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
    // End:0x1EA
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex == Level.GRI.Teams[0].TeamIndex)
    {
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
        CalculateCoordinateEx(C, WScoreTeamMarkAF, 32.0000000, 32.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WScoreTeamMarkAF.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x20A:

    // End:0x326 [Loop If]
    if(iCount < 4)
    {
        DigitsAFScore[iCount].OffsetX = default.DigitsAFScore[iCount].OffsetX + _iPosX;
        DigitsAFScore[iCount].OffsetY = default.DigitsAFScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsAFScore[iCount], float(iWidth), float(iHeight), DigitsAFScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x20A;
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
        CalculateCoordinateEx(C, WScoreTeamMarkRSA, 32.0000000, 32.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WScoreTeamMarkRSA.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);        
    }
    else
    {
        C.SetDrawColor(128, 128, 128, byte(255));
    }
    iCount = 0;
    J0x520:

    // End:0x63C [Loop If]
    if(iCount < 4)
    {
        DigitsRSAScore[iCount].OffsetX = default.DigitsRSAScore[iCount].OffsetX + _iPosX;
        DigitsRSAScore[iCount].OffsetY = default.DigitsRSAScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsRSAScore[iCount], float(iWidth), float(iHeight), DigitsRSAScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x520;
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function DrawAlienModeScore(Canvas C)
{
    local int iCurRound, iMaxRound, iHumanCount, iAlienCount, iHumanTeamScore, iAlienTeamScore;

    local CalCoordsW calW;

    CalculateCoordinateEx(C, WAlienModeScoreBG, 620.0000000, 114.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WAlienModeScoreBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    iCurRound = Level.GRI.GetCurRound();
    iMaxRound = Level.GRI.GetMaxRound();
    C.SetDrawColor(182, 220, 0, byte(255));
    DrawAlienModeDigits(C, iCurRound, 710, 11, calW);
    DrawAlienModeDigits(C, iMaxRound, 792, 11, calW);
    iHumanCount = int(Level.GRI.GetCurTeamMemberCount(0));
    iAlienCount = int(Level.GRI.GetCurTeamMemberCount(1));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawAlienModeDigits(C, iHumanCount, 523, 58, calW);
    C.SetDrawColor(byte(255), 33, 12, byte(255));
    DrawAlienModeDigits(C, iAlienCount, 985, 58, calW);
    iHumanTeamScore = int(Level.GRI.Teams[0].Score);
    iAlienTeamScore = int(Level.GRI.Teams[1].Score);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawAlienModeDigits(C, iHumanTeamScore, 642, 11, calW);
    C.SetDrawColor(byte(255), 150, 0, byte(255));
    DrawAlienModeDigits(C, iAlienTeamScore, 859, 11, calW);
    DrawRemaingTime(C, 740, 0);
    //return;    
}

function DrawAlienModeDigits(Canvas C, int iValue, int _iPosX, int _iPosY, CalCoordsW calW)
{
    local int lp1, OffsetX, OffsetY;

    DigitsAFScore[1].Value = int(float(iValue) % float(10));
    DigitsAFScore[0].Value = iValue / 10;
    OffsetX = _iPosX;
    OffsetY = _iPosY;
    lp1 = 0;
    J0x4F:

    // End:0x15D [Loop If]
    if(lp1 < 2)
    {
        DigitsAFScore[lp1].OffsetX = OffsetX + 25;
        DigitsAFScore[lp1].OffsetY = OffsetY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsAFScore[lp1], 25.0000000, 22.0000000, DigitsAFScore[lp1].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        OffsetX = DigitsAFScore[lp1].OffsetX;
        ++lp1;
        // [Loop Continue]
        goto J0x4F;
    }
    //return;    
}

simulated function bool InOrder(PlayerReplicationInfo P1, PlayerReplicationInfo P2)
{
    // End:0x2E
    if(P1.bOnlySpectator)
    {
        // End:0x29
        if(P2.bOnlySpectator)
        {
            return true;            
        }
        else
        {
            return false;
        }        
    }
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
    else
    {
        // End:0x13A
        if(P1.Score == P2.Score)
        {
            // End:0xAF
            if(P1.Kills < P2.Kills)
            {
                return false;                
            }
            else
            {
                // End:0x13A
                if(P1.Kills == P2.Kills)
                {
                    // End:0xF6
                    if(P1.Assists < P2.Assists)
                    {
                        return false;                        
                    }
                    else
                    {
                        // End:0x13A
                        if(P1.Assists == P2.Assists)
                        {
                            // End:0x13A
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
    //return;    
}

simulated function SortPRIArray()
{
    local int i, j;
    local PlayerReplicationInfo tmp;

    i = 0;
    J0x07:

    // End:0x136 [Loop If]
    if(i < (Level.GRI.PRIArray.Length - 1))
    {
        j = i + 1;
        J0x3A:

        // End:0x12C [Loop If]
        if(j < Level.GRI.PRIArray.Length)
        {
            // End:0x122
            if(!InOrder(Level.GRI.PRIArray[i], Level.GRI.PRIArray[j]))
            {
                tmp = Level.GRI.PRIArray[i];
                Level.GRI.PRIArray[i] = Level.GRI.PRIArray[j];
                Level.GRI.PRIArray[j] = tmp;
            }
            j++;
            // [Loop Continue]
            goto J0x3A;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function FFARankingSorting()
{
    local int lpPRI, Index;
    local PlayerReplicationInfo currPRI;
    local array<PlayerReplicationInfo> pris, prisReal;

    // End:0x47
    if((Level.GRI == none) || Level.GRI.GameClass != "WGame.wDeathMatch")
    {
        return;
    }
    SortPRIArray();
    Level.GRI.GetPRIArray(pris);
    lpPRI = 0;
    J0x71:

    // End:0x114 [Loop If]
    if(lpPRI < pris.Length)
    {
        currPRI = pris[lpPRI];
        // End:0xA7
        if(currPRI.bAdminSpecator)
        {
            // [Explicit Continue]
            goto J0x10A;
        }
        // End:0xE1
        if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
        {
            PRI_Self = currPRI;
            Ranking_Self = lpPRI + 1;
        }
        Index = prisReal.Length;
        prisReal.Insert(Index, 1);
        prisReal[Index] = currPRI;
        J0x10A:

        lpPRI++;
        // [Loop Continue]
        goto J0x71;
    }
    // End:0x12D
    if(1 <= prisReal.Length)
    {
        PRI_1st = prisReal[0];
    }
    // End:0x147
    if(2 <= prisReal.Length)
    {
        PRI_2nd = prisReal[1];
    }
    //return;    
}

function DFRankingSorting()
{
    local int i;
    local PlayerReplicationInfo curPRI;

    SortPRIArray();
    arrRankingInfo.Length = 0;
    i = 0;
    J0x15:

    // End:0xED [Loop If]
    if(i < Level.GRI.PRIArray.Length)
    {
        curPRI = Level.GRI.PRIArray[i];
        // End:0x99
        if((!curPRI.IsConnected || curPRI.bAdminSpecator) || curPRI.bBot)
        {
            // [Explicit Continue]
            goto J0xE3;
        }
        arrRankingInfo[arrRankingInfo.Length] = curPRI;
        // End:0xE3
        if(curPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
        {
            PRI_Self = curPRI;
            Ranking_Self = arrRankingInfo.Length;
        }
        J0xE3:

        i++;
        // [Loop Continue]
        goto J0x15;
    }
    // End:0x106
    if(1 <= arrRankingInfo.Length)
    {
        PRI_1st = arrRankingInfo[0];
    }
    // End:0x120
    if(2 <= arrRankingInfo.Length)
    {
        PRI_2nd = arrRankingInfo[1];
    }
    //return;    
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
    CalculateCoordinateEx(C, WFFAScoreBG, 486.0000000, 71.0000000, calW);
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
    J0x1AA:

    // End:0x2C6 [Loop If]
    if(iCount < 3)
    {
        DigitsFFAGoalScore[iCount].OffsetX = default.DigitsFFAGoalScore[iCount].OffsetX + _iPosX;
        DigitsFFAGoalScore[iCount].OffsetY = default.DigitsFFAGoalScore[iCount].OffsetY + _iPosY;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid, DigitsFFAGoalScore[iCount], float(iWidth), float(iHeight), DigitsFFAGoalScore[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x1AA;
    }
    iWidth = 13;
    iHeight = 18;
    iFourth = HudOwner.TimeMinutes / 10;
    iThird = int(float(HudOwner.TimeMinutes) % float(10));
    iSecond = HudOwner.TimeSeconds / 10;
    iFirst = int(float(HudOwner.TimeSeconds) % float(10));
    fX1 = (213.0000000 + float(_iPosX)) * _reX;
    fY1 = (73.0000000 + float(_iPosY)) * _reY;
    fX2 = (226.0000000 + float(_iPosX)) * _reX;
    fY2 = (91.0000000 + float(_iPosY)) * _reY;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine((((("" $ string(iFourth)) $ string(iThird)) $ ":") $ string(iSecond)) $ string(iFirst), 1, fX1, fY1, fX2, fY2, int(float(17) * _reY));
    // End:0x452
    if(PRI_Self != PRI_1st)
    {
        currPRI1 = PRI_1st;
        currPRI2 = PRI_Self;        
    }
    else
    {
        currPRI1 = PRI_Self;
        currPRI2 = PRI_2nd;
    }
    DrawRankingInfo(C, currPRI1, float(_iPosX), float(_iPosY));
    DrawRankingInfo(C, currPRI2, float(_iPosX), float(_iPosY + 32));
    // End:0x4E1
    if((fSortingLastTime + 0.3000000) < Level.TimeSeconds)
    {
        fSortingLastTime = Level.TimeSeconds;
        FFARankingSorting();
    }
    //return;    
}

function DrawDFScore(Canvas C)
{
    local CalCoordsW calW;
    local int lp1;
    local string strTemp;
    local float fX1, fX2, fY1, fY2;
    local PlayerReplicationInfo currPRI1, currPRI2;

    CalculateCoordinateEx(C, DFRankingBG, float(DFRankingBG.TextureCoords.X2), float(DFRankingBG.TextureCoords.Y2), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(DFRankingBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0xF6
    if(PRI_Self != PRI_1st)
    {
        currPRI1 = PRI_1st;
        currPRI2 = PRI_Self;        
    }
    else
    {
        currPRI1 = PRI_Self;
        currPRI2 = PRI_2nd;
    }
    fX1 = 1123.0000000 * _reX;
    fY1 = 876.0000000 * _reY;
    fX2 = 1208.0000000 * _reX;
    fY2 = 901.0000000 * _reY;
    C.SetDrawColor(byte(255), 204, 0, byte(255));
    strTemp = string(1) $ lsRanking;
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 2, fX1, fY1, fX2, fY2, int(float(17) * _reY));
    lp1 = 0;
    J0x1BD:

    // End:0x218 [Loop If]
    if(lp1 < arrRankingInfo.Length)
    {
        DrawDFRankingInfo(C, arrRankingInfo[lp1], float(DFRankingBG.OffsetX + 134), float((DFRankingBG.OffsetY + 20) + (lp1 * 49)));
        lp1++;
        // [Loop Continue]
        goto J0x1BD;
    }
    // End:0x251
    if((fSortingLastTime + 0.3000000) < Level.TimeSeconds)
    {
        fSortingLastTime = Level.TimeSeconds;
        DFRankingSorting();
    }
    //return;    
}

function DrawDFRankingInfo(Canvas C, PlayerReplicationInfo PRI, float iPosX, float iPosY)
{
    local Material Mark, markClan;
    local wMatchUserInfo UserInfo;
    local Color TextColor;
    local CalCoordsW calW;
    local string strTemp;
    local int iRanking, iFontSize, iScore, i;
    local float fX1, fX2, fY1, fY2, fProgressPct, fWidth;

    // End:0x0D
    if(PRI == none)
    {
        return;
    }
    // End:0x40
    if(PRI == PRI_1st)
    {
        TextColor = C.MakeColor(byte(255), 204, 0, byte(255));        
    }
    else
    {
        // End:0x77
        if(PRI == PRI_Self)
        {
            TextColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));            
        }
        else
        {
            TextColor = C.MakeColor(200, 200, 160, byte(255));
        }
    }
    C.DrawColor = TextColor;
    iFontSize = int(float(12) * _reY);
    // End:0xD6
    if(PRI == PRI_1st)
    {
        iRanking = 1;        
    }
    else
    {
        // End:0xF0
        if(PRI == PRI_2nd)
        {
            iRanking = 2;            
        }
        else
        {
            iRanking = Ranking_Self;
        }
    }
    fX1 = iPosX * _reX;
    fY1 = iPosY * _reY;
    fX2 = (iPosX + float(42)) * _reX;
    fY2 = (iPosY + float(32)) * _reY;
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(PRI.PlayerName);
    // End:0x281
    if((UserInfo != none) && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x281
        if(markClan[2] == none)
        {
            markClan[0] = Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark';
        }
    }
    fX1 = (iPosX + float(0)) * _reX;
    i = 0;
    J0x29F:

    // End:0x349 [Loop If]
    if(i < 3)
    {
        // End:0x33F
        if(markClan[i] != none)
        {
            C.SetPos(fX1, fY1);
            C.DrawTile(markClan[i], 46.0000000 * _reX, 46.0000000 * _reX, 0.0000000, 0.0000000, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        i++;
        // [Loop Continue]
        goto J0x29F;
    }
    // End:0x36C
    if(PRI.ClassMark == none)
    {
        PRI.LoadLevelMark();
    }
    Mark = PRI.ClassMark;
    // End:0x434
    if(Mark != none)
    {
        fX1 = (iPosX + float(49)) * _reX;
        C.SetPos(fX1, fY1);
        C.DrawTile(Mark, 46.0000000 * _reX, 46.0000000 * _reX, PRI.ClassMarkBox.X1, PRI.ClassMarkBox.Y1, PRI.ClassMarkBox.X2, PRI.ClassMarkBox.Y2);
    }
    C.DrawColor = TextColor;
    fX1 = (iPosX + float(104)) * _reX;
    fY1 = (iPosY + float(6)) * _reY;
    fX2 = fX1 + (float(175) * _reX);
    fY2 = fY1 + (float(15) * _reY);
    strTemp = GetEllipsString(C, PRI.PlayerName, 150.0000000, float(iFontSize));
    C.BtrDrawTextJustifiedWithVolumeLine(strTemp, 0, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = (iPosX + float(283)) * _reX;
    fY1 = (iPosY + float(16)) * _reY;
    fX2 = fX1 + (float(94) * _reX);
    fY2 = fY1 + (float(15) * _reY);
    iScore = int(PRI.Score);
    C.BtrDrawTextJustifiedWithVolumeLine(string(iScore), 1, fX1, fY1, fX2, fY2, iFontSize);
    fX1 = (iPosX + float(283)) * _reX;
    fY1 = (iPosY + float(16)) * _reY;
    fX2 = fX1 + (float(94) * _reX);
    fY2 = fY1 + (float(15) * _reY);
    C.BtrDrawTextJustifiedWithVolumeLine(lsScore, 2, fX1, fY1, fX2, fY2, iFontSize);
    fProgressPct = float(PRI.PlayerHealth) / 100.0000000;
    fWidth = 175.0000000 * fProgressPct;
    DFUserHP.OffsetX = int(iPosX + float(101));
    DFUserHP.OffsetY = int(iPosY + float(30));
    CalculateCoordinateEx(C, DFUserHP, fWidth, 13.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawColor = C.MakeColor(byte(255), 0, 0, byte(255));
    C.DrawTile(DFUserHP.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL * fProgressPct, calW.VL);
    //return;    
}

function DrawRankingInfo(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local Color TextColor;
    local CalCoordsW calW;

    // End:0x0D
    if(currPRI == none)
    {
        return;
    }
    // End:0xF3
    if(currPRI == PRI_Self)
    {
        WFFAScoreOverLayer.OffsetX = int(float(default.WFFAScoreOverLayer.OffsetX) + _iPosX);
        WFFAScoreOverLayer.OffsetY = int(float(default.WFFAScoreOverLayer.OffsetY) + _iPosY);
        CalculateCoordinateEx(C, WFFAScoreOverLayer, 375.0000000, 32.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WFFAScoreOverLayer.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    DrawRankingInfo_Mark(C, currPRI, _iPosX, _iPosY);
    TextColor = C.MakeColor(0, 0, 0, byte(255));
    DrawRankingInfo_Text(C, currPRI, _iPosX + float(1), _iPosY + float(1), TextColor);
    // End:0x18C
    if(currPRI == PRI_Self)
    {
        TextColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));        
    }
    else
    {
        TextColor = C.MakeColor(200, 200, 160, byte(255));
    }
    DrawRankingInfo_Text(C, currPRI, _iPosX, _iPosY, TextColor);
    //return;    
}

function DrawRankingInfo_Mark(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY)
{
    local float markX1, markY1;
    local Material Mark, markClan;
    local wMatchUserInfo UserInfo;
    local int i;

    UserInfo = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
    // End:0x104
    if((UserInfo != none) && UserInfo.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(UserInfo.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(UserInfo.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(UserInfo.ClanMark).Image;
        // End:0x104
        if(markClan[2] == none)
        {
            markClan[0] = Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark';
        }
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    i = 0;
    J0x139:

    // End:0x255 [Loop If]
    if(i < 3)
    {
        // End:0x24B
        if(markClan[i] != none)
        {
            markX1 = ((161.0000000 + _iPosX) * ScreenRatioXEx) * C.ClipX;
            markY1 = ((4.0000000 + _iPosY) * ScreenRatioYEx) * C.ClipY;
            C.SetPos(markX1, markY1);
            C.DrawTile(markClan[i], (32.0000000 * ScreenRatioXEx) * C.ClipX, (32.0000000 * ScreenRatioYEx) * C.ClipY, 0.0000000, 0.0000000, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        i++;
        // [Loop Continue]
        goto J0x139;
    }
    // End:0x278
    if(currPRI.ClassMark == none)
    {
        currPRI.LoadLevelMark();
    }
    Mark = currPRI.ClassMark;
    // End:0x39A
    if(Mark != none)
    {
        markX1 = ((195.0000000 + _iPosX) * ScreenRatioXEx) * C.ClipX;
        markY1 = ((4.0000000 + _iPosY) * ScreenRatioYEx) * C.ClipY;
        C.SetPos(markX1, markY1);
        C.DrawTile(Mark, (32.0000000 * ScreenRatioXEx) * C.ClipX, (32.0000000 * ScreenRatioYEx) * C.ClipY, currPRI.ClassMarkBox.X1, currPRI.ClassMarkBox.Y1, currPRI.ClassMarkBox.X2, currPRI.ClassMarkBox.Y2);
    }
    //return;    
}

function DrawRankingInfo_Text(Canvas C, PlayerReplicationInfo currPRI, float _iPosX, float _iPosY, Color FontColor)
{
    local int iRanking, iScore;
    local float fX1, fX2, fY1, fY2, iFontSize;

    C.DrawColor = FontColor;
    iFontSize = 15.0000000 * _reY;
    // End:0x3F
    if(currPRI == PRI_1st)
    {
        iRanking = 1;        
    }
    else
    {
        // End:0x59
        if(currPRI == PRI_2nd)
        {
            iRanking = 2;            
        }
        else
        {
            iRanking = Ranking_Self;
        }
    }
    fX1 = (110.0000000 + _iPosX) * _reX;
    fY1 = (10.0000000 + _iPosY) * _reY;
    fX2 = (120.0000000 + _iPosX) * _reX;
    fY2 = (29.0000000 + _iPosY) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iRanking), 1, fX1, fY1, fX2, fY2, int(iFontSize));
    fX1 = (126.0000000 + _iPosX) * _reX;
    fY1 = (10.0000000 + _iPosY) * _reY;
    fX2 = (145.0000000 + _iPosX) * _reX;
    fY2 = (29.0000000 + _iPosY) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(lsRanking, 1, fX1, fY1, fX2, fY2, int(iFontSize));
    fX1 = (249.0000000 + _iPosX) * _reX;
    fY1 = (10.0000000 + _iPosY) * _reY;
    fX2 = (406.0000000 + _iPosX) * _reX;
    fY2 = (29.0000000 + _iPosY) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(currPRI.PlayerName, 0, fX1, fY1, fX2, fY2, int(iFontSize));
    iScore = int(currPRI.Score);
    fX1 = (419.0000000 + _iPosX) * _reX;
    fY1 = (10.0000000 + _iPosY) * _reY;
    fX2 = (429.0000000 + _iPosX) * _reX;
    fY2 = (29.0000000 + _iPosY) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine("" $ string(iScore), 1, fX1, fY1, fX2, fY2, int(iFontSize));
    fX1 = (457.0000000 + _iPosX) * _reX;
    fY1 = (10.0000000 + _iPosY) * _reY;
    fX2 = (476.0000000 + _iPosX) * _reX;
    fY2 = (29.0000000 + _iPosY) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(lsScore, 1, fX1, fY1, fX2, fY2, int(iFontSize));
    //return;    
}

function DrawTimerBomb(Canvas C, int Min, int sec)
{
    local CalCoordsW calW;
    local int iWidth, iHeight, iCount, iTempAdd;

    iTempAdd = 36;
    WTimerBombBG.OffsetY = default.WTimerBombBG.OffsetY + iTempAdd;
    CalculateCoordinateEx(C, WTimerBombBG, 240.0000000, 106.0000000, calW);
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

    // End:0x239 [Loop If]
    if(iCount < 4)
    {
        DigitsTime[iCount].OffsetY = 109 + iTempAdd;
        CalculateCoordinateDigitEx(C, WDigitsNumberMid_Base, DigitsTime[iCount], float(iWidth), float(iHeight), DigitsTime[iCount].Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberMid_Base.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        iCount++;
        // [Loop Continue]
        goto J0x153;
    }
    WCompareSignMid.OffsetX = 823;
    WCompareSignMid.OffsetY = 109 + iTempAdd;
    CalculateCoordinateEx(C, WCompareSignMid, 10.0000000, 37.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WCompareSignMid.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function DrawA(Canvas C)
{
    // End:0x42
    if(((HudOwner == none) || HudOwner.PlayerOwner == none) || HudOwner.PlayerOwner.PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x5B
    if(!bUpdate)
    {
        UpdateHelpKeyControll();
        bUpdate = true;
    }
    // End:0x120
    if((Level.GRI.GameClass != "WMission.wSDGameInfo") && Level.GRI.GameClass != "WMission.wSBTGameInfo")
    {
        // End:0x120
        if(int(DMState) != int(3))
        {
            // End:0x115
            if(Level.GRI.GameClass == Level.GetMatchMaker().GetDefenceGameInfo())
            {
                DrawMessage_StartDefence(C);                
            }
            else
            {
                DrawMessage_Start(C);
            }
        }
    }
    // End:0x146
    if(Level.GRI.bStopCountDown)
    {
        DrawSudenDeath(C);
    }
    // End:0x161
    if(int(DMState) == int(3))
    {
        DrawMessage_Go(C);
    }
    // End:0x175
    if(bDisplayEvent_Invincible)
    {
        DrawInvincibleGauge(C);
    }
    // End:0x1C9
    if(bDisplayEvent_CountDown)
    {
        iCountNumber = int(float(6) - (Level.TimeSeconds - fBeginTimeCounDown));
        // End:0x1B4
        if(iCountNumber < 0)
        {
            bDisplayEvent_CountDown = false;
        }
        DrawCountDown(C, Clamp(iCountNumber, 1, 5));
    }
    DrawEvent_Item(C);
    DrawVehicleInfo(C);
    DrawWarningWeaponInfo(C);
    //return;    
}

function DrawSpectating(Canvas C)
{
    // End:0xFC
    if(Level.GRI != none)
    {
        // End:0x51
        if(Level.GRI.GameClass != "WMission.wSDGameInfo")
        {
            DisplayEvent_Respawn(C);
        }
        // End:0xD2
        if((HudOwner != none) && Level.GetMatchMaker().isGMRoom == false)
        {
            // End:0xCF
            if(IsStartupMessage && (HudOwner.PawnOwner == none) || !HudOwner.PawnOwner.PlayerReplicationInfo.IsIntervented)
            {
                DrawMessage_Waiting(C);
            }            
        }
        else
        {
            // End:0xFC
            if(Level.GetMatchMaker().isGMRoom == true)
            {
                DrawMessage_WaitingCountGM(C);
            }
        }
    }
    //return;    
}

function DrawTeamScoreUseImage()
{
    //return;    
}

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
        // End:0xBC
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
    CalculateCoordinateEx(C, WRoundResultNewBG, 1600.0000000, 1200.0000000, calWBG);
    CalculateCoordinateEx(C, WRoundResultGradationBG, 610.0000000, 1024.0000000, calWGraBG);
    CalculateCoordinateEx(C, WTeamWinLose, 512.0000000, 165.0000000, calWResutlText);
    CalculateCoordinateEx(C, WResultTeamMarkAF, 207.0000000, 256.0000000, calWAF);
    CalculateCoordinateEx(C, WResultTeamMarkRSA, 207.0000000, 256.0000000, calWRSA);
    C.SetPos(calWBG.X1, calWBG.Y1);
    C.DrawTile(WRoundResultNewBG.WidgetTexture, calWBG.XL, calWBG.YL, calWBG.U, calWBG.V, calWBG.UL, calWBG.VL);
    C.SetPos(calWGraBG.X1, calWGraBG.Y1);
    C.DrawTile(WRoundResultGradationBG.WidgetTexture, calWGraBG.XL, calWGraBG.YL, calWGraBG.U, calWGraBG.V, calWGraBG.UL, calWGraBG.VL);
    C.SetPos(calWResutlText.X1, calWResutlText.Y1);
    C.DrawTile(WTeamWinLose.WidgetTexture, calWResutlText.XL, calWResutlText.YL, calWResutlText.U, calWResutlText.V, calWResutlText.UL, calWResutlText.VL);
    // End:0x894
    if(Level.GRI.GameClass != Level.GetMatchMaker().GetDefenceGameInfo())
    {
        C.SetPos(calWAF.X1, calWAF.Y1);
        C.DrawTile(WResultTeamMarkAF.WidgetTexture, calWAF.XL, calWAF.YL, calWAF.U, calWAF.V, calWAF.UL, calWAF.VL);
        C.SetPos(calWRSA.X1, calWRSA.Y1);
        C.DrawTile(WResultTeamMarkRSA.WidgetTexture, calWRSA.XL, calWRSA.YL, calWRSA.U, calWRSA.V, calWRSA.UL, calWRSA.VL);
        i = 0;
        J0x6F5:

        // End:0x7C1 [Loop If]
        if(i < 4)
        {
            CalculateCoordinateDigitEx(C, DigitsNumResultAF, nwAFScore[i], float(iScoreAFWidth), float(iScoreAFHeight), nwAFScore[i].Value, calScoreAF);
            C.SetPos(calScoreAF.X1, calScoreAF.Y1);
            C.DrawTile(DigitsNumResultAF.DigitTexture, calScoreAF.XL, calScoreAF.YL, calScoreAF.U, calScoreAF.V, calScoreAF.UL, calScoreAF.VL);
            i++;
            // [Loop Continue]
            goto J0x6F5;
        }
        i = 0;
        J0x7C8:

        // End:0x894 [Loop If]
        if(i < 4)
        {
            CalculateCoordinateDigitEx(C, DigitsNumResultRSA, nwRSAScore[i], float(iScoreRSAWidth), float(iScoreRSAHeight), nwRSAScore[i].Value, calScoreRSA);
            C.SetPos(calScoreRSA.X1, calScoreRSA.Y1);
            C.DrawTile(DigitsNumResultRSA.DigitTexture, calScoreRSA.XL, calScoreRSA.YL, calScoreRSA.U, calScoreRSA.V, calScoreRSA.UL, calScoreRSA.VL);
            i++;
            // [Loop Continue]
            goto J0x7C8;
        }
    }
    //return;    
}

function DrawResultScore_AlienMdoe(Canvas C, bool bAlienTeamWin)
{
    local SpriteWidget WTeamWinLose;
    local int i, iScoreAlien, iScoreHuman, iFirst, iSecond, iThird,
	    iFourth, iScoreHumanWidth, iScoreHumanHeight, iScoreAlienWidth, iScoreAlienHeight,
	    iTeamIndex;

    local CalCoordsW calWHuman, calWAlien, calWResutlText, calWBG, calWGraBG, calScoreHuman,
	    calScoreAlien;

    local DigitSet DigitsNumResultHuman, DigitsNumResultAlien;
    local array<NumericWidget> nwHumanScore, nwAlienScore;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x85
    if(bAlienTeamWin == true)
    {
        WTeamWinLose = WWinTextAlienTeam;
        DigitsNumResultHuman = WDigitsNumResultLose;
        DigitsNumResultAlien = WDigitsNumResultWin;
        nwHumanScore = DigitsAFLoseScore;
        nwAlienScore = DigitsRSAWinScore;
        iScoreHumanWidth = 30;
        iScoreHumanHeight = 41;
        iScoreAlienWidth = 36;
        iScoreAlienHeight = 51;        
    }
    else
    {
        WTeamWinLose = WWinTextHumanTeam;
        DigitsNumResultHuman = WDigitsNumResultWin;
        DigitsNumResultAlien = WDigitsNumResultLose;
        nwHumanScore = DigitsAFLoseScore;
        nwAlienScore = DigitsRSAWinScore;
        iScoreHumanWidth = 36;
        iScoreHumanHeight = 51;
        iScoreAlienWidth = 30;
        iScoreAlienHeight = 41;
    }
    iScoreHuman = int(Level.GRI.Teams[0].Score);
    iScoreAlien = int(Level.GRI.Teams[1].Score);
    iFourth = iScoreHuman / 1000;
    nwHumanScore[3].Value = iFourth;
    iScoreHuman = int(float(iScoreHuman) % float(1000));
    iThird = iScoreHuman / 100;
    nwHumanScore[2].Value = iThird;
    iSecond = int(float(iScoreHuman) % float(100));
    iSecond = iSecond / 10;
    nwHumanScore[1].Value = iSecond;
    iSecond = int(float(iScoreHuman) % float(100));
    iFirst = int(float(iSecond) % float(10));
    nwHumanScore[0].Value = iFirst;
    iFourth = iScoreAlien / 1000;
    nwAlienScore[3].Value = iFourth;
    iScoreAlien = int(float(iScoreAlien) % float(1000));
    iThird = iScoreAlien / 100;
    nwAlienScore[2].Value = iThird;
    iSecond = int(float(iScoreAlien) % float(100));
    iSecond = iSecond / 10;
    nwAlienScore[1].Value = iSecond;
    iSecond = int(float(iScoreAlien) % float(100));
    iFirst = int(float(iSecond) % float(10));
    nwAlienScore[0].Value = iFirst;
    CalculateCoordinateEx(C, WRoundResultNewBG, 1600.0000000, 1200.0000000, calWBG);
    CalculateCoordinateEx(C, WRoundResultGradationBG, 610.0000000, 1024.0000000, calWGraBG);
    CalculateCoordinateEx(C, WTeamWinLose, 512.0000000, 165.0000000, calWResutlText);
    CalculateCoordinateEx(C, WResultMarkHumanTeam, 207.0000000, 256.0000000, calWHuman);
    CalculateCoordinateEx(C, WResultMarkAlienTeam, 207.0000000, 256.0000000, calWAlien);
    C.SetPos(calWBG.X1, calWBG.Y1);
    C.DrawTile(WRoundResultNewBG.WidgetTexture, calWBG.XL, calWBG.YL, calWBG.U, calWBG.V, calWBG.UL, calWBG.VL);
    C.SetPos(calWGraBG.X1, calWGraBG.Y1);
    C.DrawTile(WRoundResultGradationBG.WidgetTexture, calWGraBG.XL, calWGraBG.YL, calWGraBG.U, calWGraBG.V, calWGraBG.UL, calWGraBG.VL);
    C.SetPos(calWResutlText.X1, calWResutlText.Y1);
    C.DrawTile(WTeamWinLose.WidgetTexture, calWResutlText.XL, calWResutlText.YL, calWResutlText.U, calWResutlText.V, calWResutlText.UL, calWResutlText.VL);
    // End:0x7A2
    if(Level.GRI.GameClass != "WMission.wDefenceGameInfo")
    {
        C.SetPos(calWHuman.X1, calWHuman.Y1);
        C.DrawTile(WResultMarkHumanTeam.WidgetTexture, calWHuman.XL, calWHuman.YL, calWHuman.U, calWHuman.V, calWHuman.UL, calWHuman.VL);
        C.SetPos(calWAlien.X1, calWAlien.Y1);
        C.DrawTile(WResultMarkAlienTeam.WidgetTexture, calWAlien.XL, calWAlien.YL, calWAlien.U, calWAlien.V, calWAlien.UL, calWAlien.VL);
        i = 0;
        J0x603:

        // End:0x6CF [Loop If]
        if(i < 4)
        {
            CalculateCoordinateDigitEx(C, DigitsNumResultHuman, nwHumanScore[i], float(iScoreHumanWidth), float(iScoreHumanHeight), nwHumanScore[i].Value, calScoreHuman);
            C.SetPos(calScoreHuman.X1, calScoreHuman.Y1);
            C.DrawTile(DigitsNumResultHuman.DigitTexture, calScoreHuman.XL, calScoreHuman.YL, calScoreHuman.U, calScoreHuman.V, calScoreHuman.UL, calScoreHuman.VL);
            i++;
            // [Loop Continue]
            goto J0x603;
        }
        i = 0;
        J0x6D6:

        // End:0x7A2 [Loop If]
        if(i < 4)
        {
            CalculateCoordinateDigitEx(C, DigitsNumResultAlien, nwAlienScore[i], float(iScoreAlienWidth), float(iScoreAlienHeight), nwAlienScore[i].Value, calScoreAlien);
            C.SetPos(calScoreAlien.X1, calScoreAlien.Y1);
            C.DrawTile(DigitsNumResultAlien.DigitTexture, calScoreAlien.XL, calScoreAlien.YL, calScoreAlien.U, calScoreAlien.V, calScoreAlien.UL, calScoreAlien.VL);
            i++;
            // [Loop Continue]
            goto J0x6D6;
        }
    }
    //return;    
}

function DrawResultScore_FFA_Item(Canvas C, bool drawTop, PlayerReplicationInfo currPRI, wMatchUserInfo User, int lh, int currLH, int nextLH, Material medalMat, int Rank)
{
    local int i, UserLevel;
    local Material markClan[3];
    local FloatBox LvImgCoordi;

    // End:0x72
    if(drawTop)
    {
        C.SetPos(465.0000000 * _reX, (276.0000000 + float(currLH)) * _reY);
        C.DrawTile(matLine, 668.0000000 * _reX, 1.0000000, 0.0000000, 0.0000000, 669.0000000, 1.0000000);
    }
    // End:0xED
    if(medalMat != none)
    {
        C.SetPos(515.0000000 * _reX, (278.0000000 + float(currLH)) * _reY);
        C.DrawTile(medalMat, 56.0000000 * _reX, 49.0000000 * _reY, 0.0000000, 0.0000000, 56.0000000, 44.0000000);
    }
    // End:0x165
    if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
    {
        C.SetPos(0.0000000, (277.0000000 + float(currLH)) * _reY);
        C.DrawTileStretched(matOn, 1599.0000000 * _reX, float(lh) * _reY);
    }
    // End:0x23C
    if((User != none) && User.ClanName != "")
    {
        markClan[0] = Level.GameMgr.GetClanMark32(User.ClanBL).Image;
        markClan[1] = Level.GameMgr.GetClanMark32(User.ClanBG).Image;
        markClan[2] = Level.GameMgr.GetClanMark32(User.ClanMark).Image;
        // End:0x23C
        if(markClan[2] == none)
        {
            markClan[0] = Texture'Warfare_UI_Clan.Clan_Mark.ex_clanmark';
        }
    }
    i = 0;
    J0x243:

    // End:0x304 [Loop If]
    if(i < 3)
    {
        // End:0x2FA
        if(markClan[i] != none)
        {
            C.SetPos(589.0000000 * _reX, (277.0000000 + float(currLH)) * _reY);
            C.DrawTile(markClan[i], 49.0000000 * _reX, 49.0000000 * _reY, 0.0000000, 0.0000000, float(markClan[i].MaterialUSize()), float(markClan[i].MaterialVSize()));
        }
        i++;
        // [Loop Continue]
        goto J0x243;
    }
    C.SetPos(642.0000000 * _reX, (278.0000000 + float(currLH)) * _reY);
    UserLevel = Level.GetMatchMaker().GetUserGradeByUserName(currPRI.PlayerName);
    tempMat = Level.GameMgr.GetLevelTexture(UserLevel, User.LevelMarkID);
    LvImgCoordi = Level.GameMgr.GetLevelImageCoordi(UserLevel, User.LevelMarkID);
    C.DrawTile(tempMat, 49.0000000 * _reX, 49.0000000 * _reY, LvImgCoordi.X1, LvImgCoordi.Y1, LvImgCoordi.X2, LvImgCoordi.Y2);
    C.BtrDrawTextJustifiedWithVolumeLine(currPRI.PlayerName, 0, 725.0000000 * _reX, (292.0000000 + float(currLH)) * _reY, 890.0000000 * _reX, (313.0000000 + float(currLH)) * _reY, int(float(16) * _reY));
    C.BtrDrawTextJustifiedWithVolumeLine(User.ClanName, 0, 917.0000000 * _reX, (292.0000000 + float(currLH)) * _reY, 1082.0000000 * _reX, (313.0000000 + float(currLH)) * _reY, int(float(16) * _reY));
    C.SetPos(465.0000000 * _reX, (276.0000000 + float(nextLH)) * _reY);
    C.DrawTile(matLine, 668.0000000 * _reX, 1.0000000, 0.0000000, 0.0000000, 669.0000000, 1.0000000);
    //return;    
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
    C.SetPos(0.0000000, 251.0000000 * _reY);
    C.DrawTileStretched(matBack1, 1600.0000000 * _reX, 209.0000000 * _reY);
    i = 0;
    J0x76:

    // End:0xF9 [Loop If]
    if(i < Level.GRI.PRIArray.Length)
    {
        currPRI = Level.GRI.PRIArray[i];
        // End:0xDD
        if((currPRI == none) || currPRI.bAdminSpecator)
        {
            // [Explicit Continue]
            goto J0xEF;
        }
        pris[pris.Length] = currPRI;
        J0xEF:

        i++;
        // [Loop Continue]
        goto J0x76;
    }
    lp1 = 0;
    J0x100:

    // End:0x1F3 [Loop If]
    if(lp1 < 3)
    {
        // End:0x1E9
        if(pris.Length > lp1)
        {
            currPRI = pris[lp1];
            // End:0x156
            if(currPRI == HudOwner.PlayerOwner.PlayerReplicationInfo)
            {
                drewMySelf = true;
            }
            currLH = lh * lp1;
            nextLH = lh * (lp1 + 1);
            User = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
            DrawResultScore_FFA_Item(C, lp1 == 0, currPRI, User, lh, currLH, nextLH, Medals[lp1], lp1 + 1);
        }
        lp1++;
        // [Loop Continue]
        goto J0x100;
    }
    // End:0x331
    if(!drewMySelf && !HudOwner.PlayerOwner.PlayerReplicationInfo.bAdminSpecator)
    {
        lp1 = 3;
        J0x22E:

        // End:0x272 [Loop If]
        if(lp1 < pris.Length)
        {
            // End:0x268
            if(pris[lp1] == HudOwner.PlayerOwner.PlayerReplicationInfo)
            {
                // [Explicit Break]
                goto J0x272;
            }
            lp1++;
            // [Loop Continue]
            goto J0x22E;
        }
        J0x272:

        C.SetPos(0.0000000, 517.0000000 * _reY);
        C.DrawTileStretched(matBack1, 1599.0000000 * _reX, 102.0000000 * _reY);
        currPRI = pris[lp1];
        User = Level.GetMatchMaker().GetUserInfoByUserName(currPRI.PlayerName);
        DrawResultScore_FFA_Item(C, true, currPRI, User, lh, 265, 265 + lh, none, lp1 + 1);
    }
    //return;    
}

function DrawMessage_BeginMission(Canvas C, int iRound, bool bChangeAttackTeam, int iAttackTeam, int iElapsedTime)
{
    local float fDeltaTime, fFadeOut;
    local int iAlpha;
    local wMatchMaker MM;

    // End:0x42
    if(((HudOwner == none) || HudOwner.PlayerOwner == none) || HudOwner.PlayerOwner.PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x6A
    if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team == none)
    {
        return;
    }
    // End:0x2E9
    if(((Level.GRI.GameClass == "WMission.wSDGameInfo") || Level.GRI.GameClass == "WMission.wSBTGameInfo") || Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
    {
        // End:0x10C
        if(iElapsedTime < 0)
        {
            return;
        }
        // End:0x176
        if(HudOwner.PlayerOwner.PlayerReplicationInfo.IsIntervented && !bIsDraw_Intrusion)
        {
            // End:0x174
            if(int(Level.GRI.RoundState) == int(2))
            {
                DisplayMessage_Mission_Intrusion(C, iAttackTeam, iRound);
            }
            return;
        }
        // End:0x192
        if((iRound_Instrusion == iRound) && bIsDraw_Intrusion)
        {
            return;
        }
        // End:0x1AC
        if(float(iElapsedTime) > (fMessageDrawTime + fFadeOutTime))
        {
            return;
        }
        // End:0x1CD
        if((false == bMessageDraw) || 0 == iElapsedTime)
        {
            bMessageDraw = true;
        }
        // End:0x1DF
        if(int(DMState) != int(2))
        {
            return;
        }
        fDeltaTime = Level.TimeSeconds - fBeginMessageTime;
        // End:0x212
        if(fDeltaTime > (fMessageDrawTime + fFadeOutTime))
        {
            return;
        }
        // End:0x22F
        if(fDeltaTime < fMessageDrawTime)
        {
            fFadeOut = 1.0000000;            
        }
        else
        {
            fFadeOut = 1.0000000 - ((fDeltaTime - fMessageDrawTime) / fFadeOutTime);
        }
        iAlpha = int(float(255) * fFadeOut);
        // End:0x280
        if(float(iAlpha) < MinAlpha)
        {
            iAlpha = int(MinAlpha);
        }
        // End:0x2B0
        if((0 != iRound) && !bChangeAttackTeam)
        {
            DisplayMessage_Mission(C, iAttackTeam, iAlpha);            
        }
        else
        {
            // End:0x2DB
            if((1 < iRound) && bChangeAttackTeam)
            {
                DisplayMessaage_Round(C, iAttackTeam, iAlpha);
            }
        }
        CurrentRound = iRound;        
    }
    else
    {
        // End:0x3A6
        if(Level.GRI.GameClass == Level.GetMatchMaker().GetDefenceGameInfo())
        {
            CurrentRound = iRound;
            // End:0x3A6
            if(((bMessageDraw == true) && wDefenceGradeList.Length == 0) && CurrentRound != 0)
            {
                MM = Level.GetMatchMaker();
                Level.GameMgr.GetDefenceGameBotGradeList2(MM.BotDifficulty - 1, mapInfo.MapID, CurrentRound, wDefenceGradeList);
            }
        }
    }
    //return;    
}

function DrawTileByMaterial(Canvas C, Material mat, int iAlpha, float fUL, float fVL, optional float fScale)
{
    local float X, Y, XL, YL;

    // End:0x0D
    if(mat == none)
    {
        return;
    }
    // End:0x27
    if(fScale == 0.0000000)
    {
        fScale = 1.0000000;
    }
    XL = (float(mat.MaterialUSize()) * _reX) * fScale;
    YL = (float(mat.MaterialVSize()) * _reY) * fScale;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    X = fUL * _reX;
    Y = fVL * _reY;
    C.SetPos(X, Y);
    C.DrawTile(mat, XL, YL, 0.0000000, 0.0000000, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
    //return;    
}

function DrawWeaponChange(Canvas C)
{
    local CalCoordsW calW;
    local Material mat;
    local float X1, Y1, X2, Y2, PosX, PosY;

    PosX = 595.0000000;
    PosY = 648.0000000;
    WHudBGR.OffsetX = int(PosX);
    WHudBGR.OffsetY = int(PosY);
    CalculateCoordinateEx(C, WHudBGR, 410.0000000, 80.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WKeyButtonBG.OffsetX = int(PosX + float(65));
    WKeyButtonBG.OffsetY = int(PosY + float(20));
    CalculateCoordinateEx(C, WKeyButtonBG, 42.0000000, 42.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WKeyButtonBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x295
    if(HudCDeathmatch(HudOwner).bBlinkState)
    {
        WKeyButtonBGBlink.OffsetX = int(PosX + float(63));
        WKeyButtonBGBlink.OffsetY = int(PosY + float(18));
        CalculateCoordinateEx(C, WKeyButtonBGBlink, 45.0000000, 45.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    X1 = (PosX + 70.0000000) * _reX;
    Y1 = (PosY + 25.0000000) * _reY;
    X2 = (PosX + 101.0000000) * _reX;
    Y2 = (PosY + 48.0000000) * _reY;
    C.SetDrawColor(0, 0, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(skeyUseKey, 1, X1, Y1, X2, Y2, int(float(FontSizeKey) * _reY));
    mat = Material(DynamicLoadObject(HudOwner.PawnOwner.kPendingWPick.ResParams.default.szIcon_HUD, Class'Engine.Material'));
    DrawTileByMaterial(C, mat, 255, PosX + float(77), PosY, 1.3000000);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    X1 = (PosX + float(100)) * _reX;
    Y1 = (PosY + 58.0000000) * _reY;
    X2 = (PosX + 292.0000000) * _reX;
    Y2 = (PosY + 78.0000000) * _reY;
    C.BtrDrawTextJustifiedWithVolumeLine(HudOwner.PawnOwner.kPendingWPick.BaseParams.strName, 1, X1, Y1, X2, Y2, int(float(15) * _reY));
    //return;    
}

function DrawVehicleInfo(Canvas C)
{
    local CalCoordsW calW;
    local float X1, Y1, X2, Y2;
    local Vehicle EntryVehicle, DrivenVehicle, ActiveVehicle;
    local string szWeaponName;
    local Material mat;

    // End:0x1F
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
    // End:0x8C
    if((DrivenVehicle == none) && EntryVehicle == none)
    {
        return;
    }
    // End:0xA5
    if(DrivenVehicle != none)
    {
        ActiveVehicle = DrivenVehicle;        
    }
    else
    {
        // End:0xBB
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
    else
    {
        return;
    }
    WHudBGR.OffsetX = 544;
    WHudBGR.OffsetY = 842;
    CalculateCoordinateEx(C, WHudBGR, 511.0000000, 100.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    WKeyButtonBG.OffsetX = 621;
    WKeyButtonBG.OffsetY = 863;
    CalculateCoordinateEx(C, WKeyButtonBG, 52.0000000, 52.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WKeyButtonBG.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    // End:0x35E
    if(HudCDeathmatch(HudOwner).bBlinkState)
    {
        WKeyButtonBGBlink.OffsetX = 619;
        WKeyButtonBGBlink.OffsetY = 861;
        CalculateCoordinateEx(C, WKeyButtonBGBlink, 56.0000000, 56.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WKeyButtonBGBlink.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    X1 = (float(WKeyButtonBG.OffsetX) + 7.0000000) * _reX;
    Y1 = (float(WKeyButtonBG.OffsetY) + 7.0000000) * _reY;
    X2 = (float(WKeyButtonBG.OffsetX) + 45.0000000) * _reX;
    Y2 = (float(WKeyButtonBG.OffsetY) + 35.0000000) * _reY;
    C.SetDrawColor(0, 0, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(skeyUseKey, 1, X1, Y1, X2, Y2, int(float(FontSizeKey) * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    mat = Material(DynamicLoadObject(szWeaponName, Class'Engine.Material'));
    DrawTileByMaterial(C, mat, 255, 640.0000000, 844.0000000, 1.5000000);
    mat = Texture'Warfare_GP_UI_HUD.Text.img_HUD_text';
    // End:0x50C
    if(DrivenVehicle != none)
    {
        C.SetPos(742.0000000 * _reX, 907.0000000 * _reY);
        C.DrawTile(mat, 200.0000000 * _reX, 32.0000000 * _reY, 139.0000000, 880.0000000, 200.0000000, 32.0000000);        
    }
    else
    {
        // End:0x57E
        if(EntryVehicle != none)
        {
            C.SetPos(773.0000000 * _reX, 907.0000000 * _reY);
            C.DrawTile(mat, 139.0000000 * _reX, 32.0000000 * _reY, 0.0000000, 880.0000000, 139.0000000, 32.0000000);
        }
    }
    //return;    
}

function ResetState()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x2F [Loop If]
    if(i < int(19))
    {
        Displaying_State[i + 1] = 0;
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function DrawWarningWeaponInfo(Canvas C)
{
    local float fCurAmmoRatio, fMaxAmmoRatio;
    local int X1, X2, Y1, Y2, iCurAmmo, iCurAmmo2,
	    iMagazine, iMax, iWeaponGroup;

    local CalCoordsW calW;

    C.Style = 5;
    // End:0x58
    if((HudOwner.PlayerOwner.Pawn == none) || HudOwner.PlayerOwner.Pawn.Weapon == none)
    {
        return;
    }
    iWeaponGroup = HudOwner.PlayerOwner.Pawn.Weapon.BaseParams.iInventoryGroup;
    // End:0xAB
    if((iWeaponGroup != 1) && iWeaponGroup != 2)
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
    else
    {
        fMaxAmmoRatio = 1.0000000;
    }
    // End:0x3C1
    if((fCurAmmoRatio <= 0.3300000) && fMaxAmmoRatio > 0.3300000)
    {
        WHudBGR.OffsetX = 672;
        WHudBGR.OffsetY = 970;
        CalculateCoordinateEx(C, WHudBGR, 256.0000000, 28.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        CalculateCoordinateEx(C, HelpKeyButtonReload, WidthReload, 26.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        HelpKeyButtonReload.OffsetY = 971;
        C.DrawTile(HelpKeyButtonReload.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        X1 = int(float(765) * _reX);
        Y1 = int(float(972) * _reY);
        X2 = int(float(871) * _reX);
        Y2 = int(float(996) * _reY);
        C.BtrDrawTextJustifiedWithVolumeLine(LsReload @ string(iCurAmmo), 1, float(X1), float(Y1), float(X2), float(Y2), int(float(18) * _reY));
    }
    // End:0x57A
    if(fMaxAmmoRatio <= 0.3300000)
    {
        WHudBGR.OffsetX = 672;
        WHudBGR.OffsetY = 960;
        CalculateCoordinateEx(C, WHudBGR, 256.0000000, 28.0000000, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
        X1 = int(float(741) * _reX);
        Y1 = int(float(972) * _reY);
        X2 = int(float(859) * _reX);
        Y2 = int(float(996) * _reY);
        C.SetDrawColor(byte(255), 0, 0, byte(255));
        C.BtrDrawTextJustifiedWithVolumeLine(LsWarningAmmo @ string(iCurAmmo2), 1, float(X1), float(Y1), float(X2), float(Y2), int(float(18) * _reY));
        // End:0x57A
        if(Level.GetMatchMaker().IsNewDefenceMode() && fMaxAmmoRatio <= 0.0000000)
        {
            DrawMessageRechargeAmmo(C);
        }
    }
    //return;    
}

function bool DrawMessageRechargeAmmo(Canvas C)
{
    local CalCoordsW calW;
    local float fWidth, fHeigt;
    local int Y1, Y2;

    fWidth = 800.0000000;
    fHeigt = 56.0000000;
    WHudBGR.OffsetX = int(float(800) - (fWidth / float(2)));
    WHudBGR.OffsetY = 870;
    CalculateCoordinateEx(C, WHudBGR, fWidth, fHeigt, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WHudBGR.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    Y1 = int(float(870) * _reY);
    Y2 = int(float(Y1) + (fHeigt * _reY));
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(LsRechargingAmmo, 1, 0.0000000, float(Y1), 1600.0000000 * _reX, float(Y2), int(float(26) * _reY));
    //return;    
}

function DrawHostChange(Canvas C)
{
    local string Host, Msg;
    local int lp1;

    DrawHelpBG(C,, 382,, 164);
    C.SetDrawColor(byte(255), 126, 1, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MessageChangingHost, 1, 681.2500000 * _reX, 407.8125000 * _reY, 920.3125000 * _reX, 446.8750000 * _reY, int(float(25) * _reY));
    lp1 = 0;
    J0x89:

    // End:0x177 [Loop If]
    if(lp1 < Level.GetMatchMaker().UserInfos.Length)
    {
        Log((("UID=" $ string(Level.GetMatchMaker().UserInfos[lp1].UID)) $ " Name=") $ Level.GetMatchMaker().UserInfos[lp1].UserName);
        // End:0x16D
        if(Level.GetMatchMaker().UserInfos[lp1].IsHost)
        {
            Host = Level.GetMatchMaker().UserInfos[lp1].UserName;
            // [Explicit Break]
            goto J0x177;
        }
        lp1++;
        // [Loop Continue]
        goto J0x89;
    }
    J0x177:

    Msg = ((MessageChangingHostPre $ "[") $ Host) $ "]";
    C.BtrDrawTextJustifiedWithVolumeLine(Msg, 1, 614.0625000 * _reX, 471.8750000 * _reY, 985.9375000 * _reX, 500.0000000 * _reY, int(float(18) * _reY));
    C.SetDrawColor(215, 0, 13, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(MessageChangingHostPlzWait, 1, 500.0000000 * _reX, 504.6875000 * _reY, 1100.0000000 * _reX, 526.5625000 * _reY, int(float(13) * _reY));
    //return;    
}

function DisPlayEvent_SudenDeath()
{
    fBeginDrawTime_SudenDeath = Level.TimeSeconds;
    //return;    
}

function DrawSudenDeath(Canvas C)
{
    local CalCoordsW calW;
    local float fDeltaTime, fFadeOut;
    local int iAlpha;

    fDeltaTime = Level.TimeSeconds - fBeginDrawTime_SudenDeath;
    // End:0x33
    if(fDeltaTime > (fMessageDrawTime + fFadeOutTime))
    {
        return;
    }
    // End:0x42
    if(fBeginDrawTime_SudenDeath <= float(0))
    {
        return;
    }
    // End:0x5F
    if(fDeltaTime < fMessageDrawTime)
    {
        fFadeOut = 1.0000000;        
    }
    else
    {
        fFadeOut = 1.0000000 - ((fDeltaTime - fMessageDrawTime) / fFadeOutTime);
    }
    iAlpha = int(float(255) * fFadeOut);
    // End:0xB0
    if(float(iAlpha) < MinAlpha)
    {
        iAlpha = int(MinAlpha);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
    CalculateCoordinateEx(C, WTxtSudenDeath, 256.0000000, 64.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WTxtSudenDeath.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DisplayEvent_GainPoint(int iPoint)
{
    //return;    
}

function DrawPlusPoint(Canvas C, int iPoint, int iPosX, int iPosY, int iAlpha, optional int iEffectState, optional float fScale)
{
    local CalCoordsW calW;
    local float fWidth, fHeight, CenterX, CenterY, fAllWidth, fAllWidthHalf,
	    fHeightHalf;

    DigitsNumberPlus.Value = 10;
    DigitsNumberSecond.Value = iPoint / 10;
    DigitsNumberFirst.Value = int(float(iPoint) % float(10));
    fWidth = 38.0000000;
    fHeight = 31.0000000;
    fAllWidth = 38.0000000 * float(3);
    fAllWidthHalf = (fAllWidth * 0.5000000) * fScale;
    fHeightHalf = (fHeight * 0.5000000) * fScale;
    CenterX = float(iPosX) + (fWidth * 0.5000000);
    CenterY = float(iPosY) + (fHeight * 0.5000000);
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
    //return;    
}

function DrawPlusPoint_Defence(Canvas C, int iPoint, int iPosX, int iPosY, optional int iEffectState, optional float fScale)
{
    local CalCoordsW calW;
    local float fWidth, fHeight, CenterX, CenterY, fAllWidth, fAllWidthHalf,
	    fHeightHalf;

    DigitsNumberPlus.Value = 10;
    DigitsNumberFifth.Value = iPoint / 10000;
    iPoint = int(float(iPoint) % float(10000));
    DigitsNumberFourth.Value = iPoint / 1000;
    iPoint = int(float(iPoint) % float(1000));
    DigitsNumberThird.Value = iPoint / 100;
    iPoint = int(float(iPoint) % float(100));
    DigitsNumberSecond.Value = iPoint / 10;
    DigitsNumberFirst.Value = int(float(iPoint) % float(10));
    fWidth = 38.0000000;
    fHeight = 31.0000000;
    fAllWidth = 38.0000000 * float(6);
    fAllWidthHalf = (fAllWidth * 0.5000000) * fScale;
    fHeightHalf = (fHeight * 0.5000000) * fScale;
    CenterX = float(iPosX) + (fWidth * 0.5000000);
    CenterY = float(iPosY) + (fHeight * 0.5000000);
    DigitsNumberPlus.OffsetX = int(CenterX - fAllWidthHalf);
    DigitsNumberPlus.OffsetY = int(CenterY - fHeightHalf);
    DigitsNumberFifth.OffsetX = int(float(DigitsNumberPlus.OffsetX) + fWidth);
    DigitsNumberFifth.OffsetY = DigitsNumberPlus.OffsetY;
    DigitsNumberFourth.OffsetX = int(float(DigitsNumberFifth.OffsetX) + fWidth);
    DigitsNumberFourth.OffsetY = DigitsNumberPlus.OffsetY;
    DigitsNumberThird.OffsetX = int(float(DigitsNumberFourth.OffsetX) + fWidth);
    DigitsNumberThird.OffsetY = DigitsNumberPlus.OffsetY;
    DigitsNumberSecond.OffsetX = int(float(DigitsNumberThird.OffsetX) + fWidth);
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
    // End:0x590
    if(((DigitsNumberThird.Value > 0) || DigitsNumberFourth.Value > 0) || DigitsNumberFifth.Value > 0)
    {
        CalculateCoordinateDigitEx(C, WDigitsNumberBroadBig, DigitsNumberThird, fWidth * fScale, fHeight * fScale, DigitsNumberThird.Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberBroadBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x666
    if((DigitsNumberFourth.Value > 0) || DigitsNumberFifth.Value > 0)
    {
        CalculateCoordinateDigitEx(C, WDigitsNumberBroadBig, DigitsNumberFourth, fWidth * fScale, fHeight * fScale, DigitsNumberFourth.Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberBroadBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    // End:0x72A
    if(DigitsNumberFifth.Value > 0)
    {
        CalculateCoordinateDigitEx(C, WDigitsNumberBroadBig, DigitsNumberFifth, fWidth * fScale, fHeight * fScale, DigitsNumberFifth.Value, calW);
        C.SetPos(calW.X1, calW.Y1);
        C.DrawTile(WDigitsNumberBroadBig.DigitTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    }
    //return;    
}

function DisplayEvent_BattleExplain()
{
    fBeginDrawTime_BattleExplain = Level.TimeSeconds;
    //return;    
}

function DisplayEvent_GameMode(string Message)
{
    fBeginDrawTime_GameMode = Level.TimeSeconds;
    sMessageGameMode = Message;
    //return;    
}

function SetBombObjectIndex(int objectIndex)
{
    // End:0x17
    if(iGameObjectIndex != objectIndex)
    {
        bChangeMessgeGameMode = true;
    }
    iGameObjectIndex = objectIndex;
    //return;    
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
    fCenterAlignX = (C.ClipX * 0.5000000) - ((fWidth * _reX) * 0.5000000);
    i = 0;
    J0x93:

    // End:0xE9 [Loop If]
    if(i < 3)
    {
        // End:0xB3
        if(mGameMode[i] == none)
        {
            // [Explicit Continue]
            goto J0xDF;
        }
        fCenterAlignX -= ((float(mGameMode[i].MaterialUSize()) * 0.5000000) * _reX);
        J0xDF:

        ++i;
        // [Loop Continue]
        goto J0x93;
    }
    Y1 = 65.0000000 * _reY;
    i = 2;
    J0x103:

    // End:0x1F5 [Loop If]
    if(i >= 0)
    {
        // End:0x122
        if(mGameMode[i] == none)
        {
            // [Explicit Continue]
            goto J0x1EB;
        }
        X1 = fCenterAlignX;
        X2 = float(mGameMode[i].MaterialUSize()) * _reX;
        C.SetPos(X1, Y1);
        C.DrawTile(mGameMode[i], X2, float(mGameMode[i].MaterialVSize()) * _reY, 0.0000000, 0.0000000, float(mGameMode[i].MaterialUSize()), float(mGameMode[i].MaterialVSize()));
        fCenterAlignX += X2;
        J0x1EB:

        --i;
        // [Loop Continue]
        goto J0x103;
    }
    X1 = fCenterAlignX;
    Y1 = 71.0000000 * _reY;
    X2 = fCenterAlignX + fWidth;
    Y2 = 95.0000000 * _reY;
    C.SetDrawColor(byte(255), 153, 0, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(sMessageGameMode, 0, X1, Y1, X2, Y2, int(float(iFontSize) * _reY), color_Shadow);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function DisplayEvent_SetDrawGameMessage(bool bMode, bool bSystem)
{
    IsDrawModeMessage = bMode;
    IsDrawSystemMessage = bSystem;
    //return;    
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
        // End:0x6A
        case "WMission.wSDGameInfo":
            Message = GetMessageGameMode_SD();
            // End:0x96
            break;
        // End:0x93
        case "WMission.wSBTGameInfo":
            Message = GetMessageGameMode_SBT();
            // End:0x96
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xCE
    if(Level.GetMatchMaker().kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_DOA())
    {
        Message = GetMessageGameMode_DOA();
    }
    return Message;
    //return;    
}

function string GetMessageGameMode_TD()
{
    local string Message;

    Message = Class'Engine.wMessage_Game_Mode'.static.GetString(Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_TD);
    // End:0x32
    if(Message != sMessageGameMode)
    {
    }
    return Message;
    //return;    
}

function string GetMessageGameMode_DOM()
{
    local string Message;

    Message = Class'Engine.wMessage_Game_Mode'.static.GetString(Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_DOM);
    return Message;
    //return;    
}

function SetMessageGameMode_DOM(Material matA, Material matB, Material matC)
{
    mGameMode[0] = matC;
    mGameMode[1] = matB;
    mGameMode[2] = matA;
    //return;    
}

function string GetMessageGameMode_DOA()
{
    return Class'Engine.wMessage_Game_Mode'.static.GetString(Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_DOA);
    //return;    
}

function string GetMessageGameMode_SD()
{
    local string Message;
    local int iTeamIndex, iCode;

    // End:0x3F
    if((Level.GRI == none) || HudOwner.PlayerOwner.PlayerReplicationInfo.Team == none)
    {
        return "";
    }
    // End:0xC3
    if((HudOwner.PlayerOwner.ViewTarget != none) && (int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
    {
        iTeamIndex = Pawn(HudOwner.PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0x36E
    if(Level.GRI.CurrentAttackingTeam == iTeamIndex)
    {
        // End:0x282
        if(Level.GRI.bObjectivePlanted)
        {
            iCode = Class'Engine.wMessage_Game_Mode'.default.Code_SBTAllyBombPlanted;
            Message = Class'Engine.wMessage_Game_Mode'.static.GetString(iCode);
            // End:0x27F
            if((Message != "") && bChangeMessgeGameMode)
            {
                switch(iGameObjectIndex)
                {
                    // End:0x1CA
                    case 0:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", Class'Engine.Material'));
                        // End:0x26E
                        break;
                    // End:0x21A
                    case 1:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_b", Class'Engine.Material'));
                        // End:0x26E
                        break;
                    // End:0x26B
                    case 2:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_c", Class'Engine.Material'));
                        // End:0x26E
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                mGameMode[1] = none;
                bChangeMessgeGameMode = false;
            }            
        }
        else
        {
            iCode = Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SDAttack;
            Message = Class'Engine.wMessage_Game_Mode'.static.GetString(iCode);
            // End:0x36B
            if((Message != "") && Message != sMessageGameMode)
            {
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_b", Class'Engine.Material'));
                mGameMode[1] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_a", Class'Engine.Material'));
                bChangeMessgeGameMode = false;
            }
        }        
    }
    else
    {
        // End:0x4E3
        if(Level.GRI.bObjectivePlanted)
        {
            iCode = Class'Engine.wMessage_Game_Mode'.default.Code_SDEnemyBombPlanted;
            Message = Class'Engine.wMessage_Game_Mode'.static.GetString(iCode);
            // End:0x4E0
            if((Message != "") && bChangeMessgeGameMode)
            {
                switch(iGameObjectIndex)
                {
                    // End:0x427
                    case 0:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_a", Class'Engine.Material'));
                        // End:0x4CF
                        break;
                    // End:0x479
                    case 1:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_b", Class'Engine.Material'));
                        // End:0x4CF
                        break;
                    // End:0x4CC
                    case 2:
                        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_c", Class'Engine.Material'));
                        // End:0x4CF
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                mGameMode[1] = none;
                bChangeMessgeGameMode = false;
            }            
        }
        else
        {
            iCode = Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SDDefense;
            Message = Class'Engine.wMessage_Game_Mode'.static.GetString(iCode);
            // End:0x5C8
            if((Message != "") && Message != sMessageGameMode)
            {
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_b", Class'Engine.Material'));
                mGameMode[1] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", Class'Engine.Material'));
                bChangeMessgeGameMode = false;
            }
        }
    }
    return Message;
    //return;    
}

function string GetMessageGameMode_SBT()
{
    local string Message;
    local int iTeamIndex, iCode;

    iTeamIndex = HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex;
    // End:0xD6
    if(Level.GRI.CurrentAttackingTeam == iTeamIndex)
    {
        // End:0x82
        if(Level.GRI.bObjectivePlanted)
        {
            iCode = Class'Engine.wMessage_Game_Mode'.default.Code_SBTAllyBombPlanted;            
        }
        else
        {
            // End:0xBF
            if(HudOwner.PlayerOwner.PlayerReplicationInfo.HasFlag != none)
            {
                iCode = Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SDAttack;                
            }
            else
            {
                iCode = Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SBT;
            }
        }        
    }
    else
    {
        // End:0x108
        if(Level.GRI.bObjectivePlanted)
        {
            iCode = Class'Engine.wMessage_Game_Mode'.default.Code_SBTEnemyBombPlanted;            
        }
        else
        {
            // End:0x15B
            if((Level.GRI.CurrentAttackingTeam != 0) && Level.GRI.CurrentAttackingTeam != 1)
            {
                iCode = Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SBTGetBomb;                
            }
            else
            {
                iCode = Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SDDefense;
            }
        }
    }
    Message = Class'Engine.wMessage_Game_Mode'.static.GetString(iCode);
    // End:0x38F
    if(Message != sMessageGameMode)
    {
        switch(iCode)
        {
            // End:0x1F7
            case Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SBTGetBomb:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb", Class'Engine.Material'));
                // End:0x38F
                break;
            // End:0x251
            case Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SBT:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb_1", Class'Engine.Material'));
                // End:0x38F
                break;
            // End:0x262
            case Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SDAttack:
            // End:0x2C1
            case Class'Engine.wMessage_Game_Mode'.default.Code_SBTEnemyBombPlanted:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.enemy_capture_a", Class'Engine.Material'));
                // End:0x38F
                break;
            // End:0x2D2
            case Class'Engine.wMessage_Game_Mode'.default.Code_SBTAllyBombPlanted:
            // End:0x32F
            case Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SBTGetBomb:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", Class'Engine.Material'));
                // End:0x38F
                break;
            // End:0x38C
            case Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_SDDefense:
                mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.our_capture_a", Class'Engine.Material'));
                // End:0x38F
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        return Message;
        //return;        
    }
}

function string GetMessageGameMode_FFA()
{
    local string Message;

    Message = Class'Engine.wMessage_Game_Mode'.static.GetString(Class'Engine.wMessage_Game_Mode'.default.Code_GameMode_FFA);
    // End:0x76
    if(Message != sMessageGameMode)
    {
        mGameMode[0] = Material(DynamicLoadObject("Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb", Class'Engine.Material'));
    }
    return Message;
    //return;    
}

function DrawGameNotice(Canvas C, string sGameNotice)
{
    local int FontSize, PresetIndex;
    local Color ShadowColor;

    DrawHelpBG(C,, 182,, 38);
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    FontSize = int(float(18) * _reY);
    PresetIndex = 4;
    ShadowColor = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 180);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, sGameNotice, 4, float(FontSize), 0.0000000, 189.0000000 * _reY, C.ClipX, 214.0000000 * _reY, ShadowColor, PresetIndex, false);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function DrawMoveGameNotice(Canvas C, string sGameNotice, float fLifeTime)
{
    local int FontSize, PresetIndex;
    local Color ShadowColor;

    DrawHelpBG(C,, 182,, 38);
    C.SetDrawColor(byte(255), 0, 0, byte(255));
    FontSize = int(float(18) * _reY);
    PresetIndex = 4;
    ShadowColor = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 180);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, sGameNotice, 3, float(FontSize), fLifeTime, 189.0000000 * _reY, C.ClipX, 214.0000000 * _reY, ShadowColor, PresetIndex, false);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
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

    // End:0x0F
    if(Len(sAASNotice) <= 0)
    {
        return;
    }
    WHudBack3.OffsetX = 290;
    WHudBack3.OffsetY = 255;
    fWidth = 1000.0000000;
    fHeight = 72.0000000;
    FontSize = int(float(18) * _reY);
    textWidthLimit = (fWidth - float(12 * 2)) * _reX;
    strText = sAASNotice;
    C.BtrTextSize(strText, FontSize, findWidth, tempH);
    // End:0xDB
    if(findWidth < textWidthLimit)
    {
        sLineNotice.Length = sLineNotice.Length + 1;
        sLineNotice[sLineNotice.Length - 1] = strText;
        strText = "";
    }
    i = 0;
    J0xE2:

    // End:0x1DA [Loop If]
    if(i < Len(strText))
    {
        sTemp = Mid(strText, 0, i);
        C.BtrTextSize(sTemp, FontSize, findWidth, tempH);
        // End:0x1D0
        if(findWidth >= textWidthLimit)
        {
            sLineNotice.Length = sLineNotice.Length + 1;
            sLineNotice[sLineNotice.Length - 1] = sTemp;
            strText = Mid(strText, i, Len(sAASNotice));
            C.BtrTextSize(strText, FontSize, findWidth, tempH);
            // End:0x1D0
            if(findWidth < textWidthLimit)
            {
                sLineNotice.Length = sLineNotice.Length + 1;
                sLineNotice[sLineNotice.Length - 1] = strText;
                // [Explicit Break]
                goto J0x1DA;
            }
        }
        i++;
        // [Loop Continue]
        goto J0xE2;
    }
    J0x1DA:

    fHeight = float(sLineNotice.Length * 30);
    CalculateCoordinateEx(C, WHudBack3, fWidth + float(30), fHeight, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTileStretched(WHudBack3.WidgetTexture, calW.XL, calW.YL);
    C.SetDrawColor(byte(255), 219, 53, byte(255));
    PresetIndex = 4;
    ShadowColor = Class'Engine.Canvas'.static.MakeColor(0, 0, 0, 180);
    beginX = float(WHudBack3.OffsetX + 12) * _reX;
    EndX = beginX + ((fWidth - float(12)) * _reX);
    // End:0x39D
    if(sLineNotice.Length > 1)
    {
        i = 0;
        J0x2F0:

        // End:0x39A [Loop If]
        if(i < sLineNotice.Length)
        {
            beginY = (float(WHudBack3.OffsetY + 8) * _reY) + (float(i * 25) * _reY);
            EndY = beginY + (float(25) * _reY);
            Class'Engine.BTCustomDrawHK'.static.DrawString(C, sLineNotice[i], 0, float(FontSize), beginX, beginY, EndX, EndY, ShadowColor, PresetIndex, false);
            i++;
            // [Loop Continue]
            goto J0x2F0;
        }        
    }
    else
    {
        beginY = float(WHudBack3.OffsetY + 8) * _reY;
        EndY = beginY + (float(25) * _reY);
        Class'Engine.BTCustomDrawHK'.static.DrawString(C, sLineNotice[0], 4, float(FontSize), beginX, beginY, EndX, EndY, ShadowColor, PresetIndex, false);
    }
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    //return;    
}

function SetTimeConnectionInstability(bool bSet)
{
    local float fDeltaTime;

    bConnectionInstability = bSet;
    bDrawConnectionInstability = bSet;
    // End:0x3C
    if(bConnectionInstability)
    {
        TimeConnectionInstability[0] = Level.TimeSeconds;        
    }
    else
    {
        TimeConnectionInstability[1] = Level.TimeSeconds;
    }
    fDeltaTime = Abs(TimeConnectionInstability[1] - TimeConnectionInstability[0]);
    // End:0x81
    if(fDeltaTime < 1.0000000)
    {
        bDrawConnectionInstability = true;
    }
    //return;    
}

function ConnectionInstability(Canvas C)
{
    // End:0x36
    if(float(HudOwner.PlayerOwner.PlayerReplicationInfo.Ping) > 2000.0000000)
    {
        SetTimeConnectionInstability(true);        
    }
    else
    {
        // End:0x46
        if(bConnectionInstability)
        {
            SetTimeConnectionInstability(false);
        }
    }
    // End:0x5A
    if(bDrawConnectionInstability)
    {
        DrawMessageConnectionInstability(C);
    }
    //return;    
}

function DrawMessageConnectionInstability(Canvas C)
{
    local CalCoordsW calW;
    local Color OldColor;

    // End:0x38
    if(!bConnectionInstability && (TimeConnectionInstability[1] + 1.0000000) < Level.TimeSeconds)
    {
        bDrawConnectionInstability = false;
        return;
    }
    OldColor = C.DrawColor;
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(float(255) * 0.6000000));
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'XInterface_Decompressed.BTHUDResourcePoolHK'.default.hud_back_4, 0.0000000, 0.0000000, C.ClipX, C.ClipY);
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    CalculateCoordinateEx(C, WConnectionInstability, 200.0000000, 200.0000000, calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WConnectionInstability.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    C.BtrDrawTextJustifiedWithVolumeLine(LsConnectionInstability, 1, 0.0000000, 682.0000000 * _reY, C.ClipX, 719.0000000 * _reY, int(float(21) * _reY), color_Shadow);
    C.DrawColor = OldColor;
    //return;    
}

function DrawMessage_SentryGun_Installing(Canvas C, SpriteWidget WMessage, float ProgressPct)
{
    local CalCoordsW calW;
    local int iWidth, iHeight;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    DrawHelpBG(C,, 328);
    DrawGauge(C, ProgressPct);
    iWidth = WMessage.TextureCoords.X2 - WMessage.TextureCoords.X1;
    iHeight = WMessage.TextureCoords.Y2 - WMessage.TextureCoords.Y1;
    CalculateCoordinateEx(C, WMessage, float(iWidth), float(iHeight), calW);
    C.SetPos(calW.X1, calW.Y1);
    C.DrawTile(WMessage.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
    //return;    
}

function DisplayEvent_Skill_NotReady(Canvas C, int SkillID)
{
    local wGameManager GameMgr;
    local wSkillBaseParam skillParam;
    local int iLocation;
    local string SkillName;

    GameMgr = Level.GameMgr;
    skillParam = GameMgr.GetSkillParam(SkillID);
    // End:0x49
    if(int(skillParam.ESkillType) == int(5))
    {
        return;
    }
    // End:0x15A
    if((int(skillParam.ESkillType) > 0) && int(skillParam.ESkillType) < Class'Engine.wGameManager'.static.GetSkillTypeMax())
    {
        // End:0xB3
        if(((fLastCallTime + fDrawTime) + fFadeOutTime) < Level.TimeSeconds)
        {
            ECallSkillState = 19;
        }
        iLocation = InStr(skillParam.strName, "]");
        SkillName = Mid(skillParam.strName, iLocation + 2);
        DrawEventString(C, fLastCallTime, Class'Engine.BTCustomDrawHK'.static.FormatString(strNotReadySkill[int(skillParam.ESkillType) - 1], SkillName, string(skillParam.iCheckStreakCount)), Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)), strNotReadySkillDesc, "");
    }
    //return;    
}

function DrawEventString(Canvas C, float StartTime, string strHead, Color headColor, string strDesc, string strKey)
{
    local float X1, Y1, X2, Y2, fDeltaTime, fFadeOutEffect;

    local int iAlpha;
    local CalCoordsW calW;

    fDeltaTime = Level.TimeSeconds - StartTime;
    // End:0x2F5
    if(fDeltaTime < (fDrawTime + fFadeOutTime))
    {
        // End:0x4E
        if(fDeltaTime < fDrawTime)
        {
            fFadeOutEffect = 1.0000000;            
        }
        else
        {
            fFadeOutEffect = 1.0000000 - ((fDeltaTime - fDrawTime) / fFadeOutTime);
        }
        iAlpha = int(float(255) * fFadeOutEffect);
        iAlpha = Max(1, iAlpha);
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
        DrawHelpBG(C,, 734);
        C.SetDrawColor(headColor.R, headColor.G, headColor.B, byte(iAlpha));
        C.BtrDrawTextJustifiedWithVolumeLine(strHead, 1, 0.0000000, 754.0000000 * _reY, 1600.0000000 * _reX, 783.0000000 * _reY, int(float(25) * _reY));
        C.SetDrawColor(byte(255), byte(255), byte(255), byte(iAlpha));
        C.BtrDrawTextJustifiedWithVolumeLine(strDesc, 1, 0.0000000, 786.0000000 * _reY, 1600.0000000 * _reX, 815.0000000 * _reY, int(float(25) * _reY));
        // End:0x2F5
        if(strKey != "")
        {
            CalculateCoordinateEx(C, HelpKeyButtonNone, 52.0000000, 52.0000000, calW);
            C.SetPos(467.0000000 * _reX, 758.0000000 * _reY);
            C.DrawTile(HelpKeyButtonNone.WidgetTexture, calW.XL, calW.YL, calW.U, calW.V, calW.UL, calW.VL);
            X1 = 474.0000000 * _reX;
            Y1 = 761.0000000 * _reY;
            X2 = 512.0000000 * _reX;
            Y2 = 800.0000000 * _reY;
            C.SetDrawColor(69, 69, 69, byte(iAlpha));
            C.BtrDrawTextJustifiedWithVolumeLine(strKey, 1, X1, Y1, X2, Y2, int(float(FontSizeKey) * _reY));
        }
    }
    //return;    
}

defaultproperties
{
    wHealthPack=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_healpac',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=736,OffsetY=763,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHealthPackPlus=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_healpac_10',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=736,OffsetY=763,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDigitsHP=(DigitTexture=Texture'Warfare_HUD.HUD.Number',TextureCoords=(X1=207,Y1=0,X2=227,Y2=31),TextureCoords[1]=(X1=0,Y1=0,X2=20,Y2=31),TextureCoords[2]=(X1=23,Y1=0,X2=43,Y2=31),TextureCoords[3]=(X1=46,Y1=0,X2=66,Y2=31),TextureCoords[4]=(X1=69,Y1=0,X2=89,Y2=31),TextureCoords[5]=(X1=92,Y1=0,X2=112,Y2=31),TextureCoords[6]=(X1=115,Y1=0,X2=135,Y2=31),TextureCoords[7]=(X1=138,Y1=0,X2=158,Y2=31),TextureCoords[8]=(X1=161,Y1=0,X2=181,Y2=31),TextureCoords[9]=(X1=184,Y1=0,X2=204,Y2=31),TextureCoords[10]=(X1=230,Y1=0,X2=250,Y2=31))
    WDigitsNumberBroadBig=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number1',TextureCoords=(X1=459,Y1=0,X2=509,Y2=42),TextureCoords[1]=(X1=0,Y1=0,X2=50,Y2=42),TextureCoords[2]=(X1=51,Y1=0,X2=101,Y2=42),TextureCoords[3]=(X1=102,Y1=0,X2=152,Y2=42),TextureCoords[4]=(X1=153,Y1=0,X2=203,Y2=42),TextureCoords[5]=(X1=204,Y1=0,X2=254,Y2=42),TextureCoords[6]=(X1=255,Y1=0,X2=305,Y2=42),TextureCoords[7]=(X1=306,Y1=0,X2=356,Y2=42),TextureCoords[8]=(X1=357,Y1=0,X2=407,Y2=42),TextureCoords[9]=(X1=408,Y1=0,X2=458,Y2=42),TextureCoords[10]=(X1=0,Y1=44,X2=50,Y2=86))
    WDigitsNumberBig=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number',TextureCoords=(X1=459,Y1=0,X2=509,Y2=70),TextureCoords[1]=(X1=0,Y1=0,X2=50,Y2=70),TextureCoords[2]=(X1=51,Y1=0,X2=101,Y2=70),TextureCoords[3]=(X1=102,Y1=0,X2=152,Y2=70),TextureCoords[4]=(X1=153,Y1=0,X2=203,Y2=70),TextureCoords[5]=(X1=204,Y1=0,X2=254,Y2=70),TextureCoords[6]=(X1=255,Y1=0,X2=305,Y2=70),TextureCoords[7]=(X1=306,Y1=0,X2=356,Y2=70),TextureCoords[8]=(X1=357,Y1=0,X2=407,Y2=70),TextureCoords[9]=(X1=408,Y1=0,X2=458,Y2=70),TextureCoords[10]=(X1=0,Y1=72,X2=57,Y2=128))
    WDigitsNumberMid=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number3',TextureCoords=(X1=315,Y1=0,X2=349,Y2=28),TextureCoords[1]=(X1=0,Y1=0,X2=34,Y2=28),TextureCoords[2]=(X1=35,Y1=0,X2=69,Y2=28),TextureCoords[3]=(X1=70,Y1=0,X2=104,Y2=28),TextureCoords[4]=(X1=105,Y1=0,X2=139,Y2=28),TextureCoords[5]=(X1=140,Y1=0,X2=174,Y2=28),TextureCoords[6]=(X1=175,Y1=0,X2=209,Y2=28),TextureCoords[7]=(X1=210,Y1=0,X2=244,Y2=28),TextureCoords[8]=(X1=245,Y1=0,X2=279,Y2=28),TextureCoords[9]=(X1=280,Y1=0,X2=314,Y2=28),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WDigitsNumberMid_Base=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',TextureCoords=(X1=297,Y1=0,X2=329,Y2=42),TextureCoords[1]=(X1=0,Y1=0,X2=32,Y2=42),TextureCoords[2]=(X1=33,Y1=0,X2=65,Y2=42),TextureCoords[3]=(X1=66,Y1=0,X2=98,Y2=42),TextureCoords[4]=(X1=99,Y1=0,X2=131,Y2=42),TextureCoords[5]=(X1=132,Y1=0,X2=164,Y2=42),TextureCoords[6]=(X1=165,Y1=0,X2=197,Y2=42),TextureCoords[7]=(X1=198,Y1=0,X2=230,Y2=42),TextureCoords[8]=(X1=231,Y1=0,X2=263,Y2=42),TextureCoords[9]=(X1=264,Y1=0,X2=296,Y2=42),TextureCoords[10]=(X1=368,Y1=0,X2=400,Y2=42))
    WDigitsNumberSml=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_number3',TextureCoords=(X1=315,Y1=0,X2=349,Y2=28),TextureCoords[1]=(X1=0,Y1=0,X2=34,Y2=28),TextureCoords[2]=(X1=35,Y1=0,X2=69,Y2=28),TextureCoords[3]=(X1=70,Y1=0,X2=104,Y2=28),TextureCoords[4]=(X1=105,Y1=0,X2=139,Y2=28),TextureCoords[5]=(X1=140,Y1=0,X2=174,Y2=28),TextureCoords[6]=(X1=175,Y1=0,X2=209,Y2=28),TextureCoords[7]=(X1=210,Y1=0,X2=244,Y2=28),TextureCoords[8]=(X1=245,Y1=0,X2=279,Y2=28),TextureCoords[9]=(X1=280,Y1=0,X2=314,Y2=28),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WDigitsDFRoundNumber=(DigitTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_roundDisplay_countnumber',TextureCoords=(X1=0,Y1=0,X2=92,Y2=78),TextureCoords[1]=(X1=92,Y1=0,X2=184,Y2=78),TextureCoords[2]=(X1=184,Y1=0,X2=276,Y2=78),TextureCoords[3]=(X1=276,Y1=0,X2=368,Y2=78),TextureCoords[4]=(X1=368,Y1=0,X2=460,Y2=78),TextureCoords[5]=(X1=460,Y1=0,X2=552,Y2=78),TextureCoords[6]=(X1=552,Y1=0,X2=644,Y2=78),TextureCoords[7]=(X1=644,Y1=0,X2=736,Y2=78),TextureCoords[8]=(X1=736,Y1=0,X2=828,Y2=78),TextureCoords[9]=(X1=828,Y1=0,X2=913,Y2=78),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    DigitsNumberFirst=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=82,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsNumberSecond=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=41,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsNumberPlus=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    FontSizeNormal=21
    FontSizeKey=28
    FontSizeRespawn=16
    SkillIconEvent=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHelpBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=2),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=328,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wHelicopter=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=82,X2=1024,Y2=164),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirke=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=164,X2=512,Y2=246),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WUAV=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=410,X2=1024,Y2=492),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WC4=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=912,X2=1024,Y2=994),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRPG7=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=82),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=745,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillHelicopterOn=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_heli_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillAirstrikeOn=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_bomb_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillUAVOn=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_uav_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SkillSentryGunOn=(WidgetTexture=Texture'Warfare_UI_Item.SupplySkillicon.icon_sup_sent',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=736,OffsetY=844,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirkeFocus=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=328,X2=512,Y2=410),TextureScale=1.0000000,DrawPivot=0,PosX=0.3400000,PosY=0.6208333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WAirStirkeSellect=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=410,X2=512,Y2=492),TextureScale=1.0000000,DrawPivot=0,PosX=0.3400000,PosY=0.6208333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ECallSkillState=19
    fBeginRespawnPosY=442.0000000
    fEndRespawnPosY=450.0000000
    fDrawTime=2.5000000
    fDrawTimeSkill=0.5000000
    fDrawTimeEffect=0.8000000
    fFadeOutEffect=1.0000000
    fFadeOutTime=1.5000000
    fDrawTimeHealth=0.2000000
    fFadeOutTimeHealth=2.0000000
    fDistMove=40.0000000
    WGameMessageWaiting=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=580,X2=1024,Y2=624),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=382,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameWaitSpot=(WidgetTexture=Texture'Warfare_HUD.HUD.txt_wait_user_p',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=8,Y2=8),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=622,OffsetY=195,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WConnectionInstability=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_dishost',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=700,OffsetY=465,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBGStart=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmstart',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=128),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=536,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WBGStartDF=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_roundDisplay_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=279),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=289,OffsetY=431,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeTD=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=688,X2=256,Y2=752),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeSD=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=688,X2=512,Y2=752),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeDOA=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text2',RenderStyle=5,TextureCoords=(X1=0,Y1=128,X2=256,Y2=192),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeDOMI=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=624,X2=512,Y2=688),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeSB=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=752,X2=256,Y2=816),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeDM=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=624,X2=256,Y2=688),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeFM=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=816,X2=512,Y2=880),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeTM=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=587,Y1=816,X2=819,Y2=891),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameChangeAttack=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=816,X2=256,Y2=880),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameChangePosition=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=752,X2=512,Y2=816),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGameTypeAlienMode=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=304,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=304,OffsetY=64,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WGo=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_gmstart_go_1',RenderStyle=5,TextureCoords=(X1=1,Y1=20,X2=1024,Y2=237),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=288,OffsetY=491,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    BeginMessageTD="Destroy the enemy team!"
    BeginMessageSDA1="Plant a bomb at the target (A or B) and destroy it!"
    BeginMessageSDD1="Stop the target (A or B) from being destroyed by an enemy bomb!"
    BeginMessageAlienMode="Survive the Alien attack! (AF/RSA)"
    BeginMessageDOMI="Capture and defend the flag!"
    BeginMessageSB="Search for the bomb and plant it on the target to destroy it!"
    BeginMessageDM="Destroy your enemies!"
    BeginMessageFM="Destroy your enemies!"
    BeginMessageTM="Follow the tutorial to complete the mission!"
    LsReload="Reload"
    LsWarningAmmo="Low Ammo"
    LsRechargingAmmo="Use the supply crates to resupply your ammunition!"
    LsConnectionInstability="Connection with the host is unstable. The game has been paused."
    lsIsInvincible="Invincible for 3 seconds after respawn."
    lsIsInvincibleBeginner="Invincible for 5 seconds after respawn."
    safeZoneRandomRespawn="You will soon respawn in a random safe zone."
    RespawnText="Respawn"
    MessageChangingHostPre="New Host"
    MessageChangingHost="Changing hosts..."
    MessageChangingHostPlzWait="The game is paused while the host is being changed. Wait a moment."
    fMessageDrawTime=2.5000000
    fBeginMessageTime_Go=9999.0000000
    fMessageDrawTime_Go=0.1000000
    fFadeOutTime_Go=1.5000000
    WRoundResultBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=2),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=454,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundWin=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=624,X2=1024,Y2=720),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=551,OffsetY=337,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundLose=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=512,Y1=720,X2=1024,Y2=816),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=551,OffsetY=337,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WCompareSign=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_number',RenderStyle=5,TextureCoords=(X1=65,Y1=72,X2=79,Y2=127),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=786,OffsetY=558,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WCompareSignMid=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_number2',RenderStyle=5,TextureCoords=(X1=330,Y1=0,X2=344,Y2=42),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=786,OffsetY=558,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsRoundWinAF=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=653,OffsetY=567,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRoundWinRSA=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=894,OffsetY=567,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    WTeamMarkAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=314,Y2=314),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=643,OffsetY=313,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamMarkRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=314,Y1=0,X2=628,Y2=314),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=643,OffsetY=313,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTeamMarkAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_teamemblem',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=207,Y2=256),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=518,OffsetY=369,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTeamMarkRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_teamemblem',RenderStyle=5,TextureCoords=(X1=207,Y1=0,X2=414,Y2=256),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=875,OffsetY=369,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamMarkHumanTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_modestart_alienmode_teamemblem',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=313,Y2=242),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=313,OffsetY=242,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamMarkAlienTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_modestart_alienmode_teamemblem',RenderStyle=5,TextureCoords=(X1=313,Y1=0,X2=626,Y2=242),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=313,OffsetY=242,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamBigMarkHumanTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_HUD_etc_alienmode_emblem',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=492,Y2=370),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=150,OffsetY=405,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamBigMarkAlienTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_HUD_etc_alienmode_emblem',RenderStyle=5,TextureCoords=(X1=492,Y1=0,X2=984,Y2=370),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=958,OffsetY=405,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultMarkHumanTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_alienmode_teamemblem',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=293,Y2=256),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=495,OffsetY=369,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultMarkAlienTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_alienmode_teamemblem',RenderStyle=5,TextureCoords=(X1=0,Y1=256,X2=293,Y2=512),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=812,OffsetY=369,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWinTextAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=165),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WLoseTextAF=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=165,X2=512,Y2=330),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWinTextRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=330,X2=512,Y2=495),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WLoseTextRSA=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=495,X2=512,Y2=660),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundResultNewBG=(WidgetTexture=Texture'Warfare_GP_UI_UI.Common.img_commom_black_40_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRoundResultGradationBG=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_gradation_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=1024),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=495,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWinTextHumanTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_alienmode_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=165),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WLoseTextHumanTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_alienmode_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=165,X2=512,Y2=330),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WWinTextAlienTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_alienmode_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=330,X2=512,Y2=495),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WLoseTextAlienTeam=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_alienmode_text_winlose',RenderStyle=5,TextureCoords=(X1=0,Y1=495,X2=512,Y2=660),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WDigitsNumResultWin=(DigitTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_scorenum_win',TextureCoords=(X1=324,Y1=0,X2=360,Y2=51),TextureCoords[1]=(X1=0,Y1=0,X2=36,Y2=51),TextureCoords[2]=(X1=36,Y1=0,X2=72,Y2=51),TextureCoords[3]=(X1=72,Y1=0,X2=108,Y2=51),TextureCoords[4]=(X1=108,Y1=0,X2=144,Y2=51),TextureCoords[5]=(X1=144,Y1=0,X2=180,Y2=51),TextureCoords[6]=(X1=180,Y1=0,X2=216,Y2=51),TextureCoords[7]=(X1=216,Y1=0,X2=252,Y2=51),TextureCoords[8]=(X1=252,Y1=0,X2=288,Y2=51),TextureCoords[9]=(X1=288,Y1=0,X2=324,Y2=51),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    WDigitsNumResultLose=(DigitTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_exitgame_scorenum_lose',TextureCoords=(X1=270,Y1=0,X2=300,Y2=41),TextureCoords[1]=(X1=0,Y1=0,X2=30,Y2=41),TextureCoords[2]=(X1=30,Y1=0,X2=60,Y2=41),TextureCoords[3]=(X1=60,Y1=0,X2=90,Y2=41),TextureCoords[4]=(X1=90,Y1=0,X2=120,Y2=41),TextureCoords[5]=(X1=120,Y1=0,X2=150,Y2=41),TextureCoords[6]=(X1=150,Y1=0,X2=180,Y2=41),TextureCoords[7]=(X1=180,Y1=0,X2=210,Y2=41),TextureCoords[8]=(X1=210,Y1=0,X2=240,Y2=41),TextureCoords[9]=(X1=240,Y1=0,X2=270,Y2=41),TextureCoords[10]=(X1=0,Y1=0,X2=0,Y2=0))
    DigitsAFWinScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=657,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFWinScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=621,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFWinScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=585,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFWinScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=549,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAWinScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=1014,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAWinScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=978,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAWinScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=942,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAWinScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=906,OffsetY=318,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFLoseScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=651,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFLoseScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=621,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFLoseScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=591,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFLoseScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=561,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSALoseScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=1008,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSALoseScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=978,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSALoseScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=948,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSALoseScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=918,OffsetY=328,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    wDefenceBotIcon[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=80,Y2=80),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=80,Y1=0,X2=160,Y2=80),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=160,Y1=0,X2=240,Y2=80),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[3]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=240,Y1=0,X2=320,Y2=80),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[4]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=320,Y1=0,X2=400,Y2=80),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[5]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=400,Y1=0,X2=480,Y2=80),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[6]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=0,Y1=80,X2=80,Y2=160),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[7]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=80,Y1=80,X2=160,Y2=160),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[8]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=160,Y1=80,X2=240,Y2=160),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[9]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=240,Y1=80,X2=320,Y2=160),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[10]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=320,Y1=80,X2=400,Y2=160),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[11]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=400,Y1=80,X2=480,Y2=160),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[12]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=0,Y1=160,X2=80,Y2=240),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[13]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=160,Y1=160,X2=240,Y2=240),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wDefenceBotIcon[14]=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_iconMonster',RenderStyle=5,TextureCoords=(X1=240,Y1=160,X2=320,Y2=240),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=666,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DigitsAFScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=120,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=95,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=70,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsAFScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=45,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=416,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=391,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=366,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsRSAScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=341,OffsetY=9,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=262,OffsetY=11,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=243,OffsetY=11,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=224,OffsetY=11,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsGoalScore[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=205,OffsetY=11,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=866,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=838,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=792,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsTime[3]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=764,OffsetY=42,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsFFAGoalScore[0]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=67,OffsetY=24,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsFFAGoalScore[1]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=42,OffsetY=24,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    DigitsFFAGoalScore[2]=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=2,PosX=0.0000000,PosY=0.0000000,OffsetX=17,OffsetY=24,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    WHudBG2=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=8),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHudBGR=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_red',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=8),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=121,OffsetY=150,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamScoreBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_score_indicatecamp_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=598,Y2=87),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=501,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtAF[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=460,Y1=314,X2=758,Y2=442),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=570,OffsetY=478,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtAF[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=460,Y1=442,X2=758,Y2=570),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=570,OffsetY=478,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtRSA[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=0,Y1=314,X2=460,Y2=442),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=651,OffsetY=478,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WResultTxtRSA[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_01',RenderStyle=5,TextureCoords=(X1=0,Y1=442,X2=460,Y2=570),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=651,OffsetY=478,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_score_0',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=486,Y2=71),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=557,OffsetY=5,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WFFAScoreOverLayer=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_score_0_sel',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=375,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=107,OffsetY=4,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DFRankingBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_ranking_bg',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=216),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1088,OffsetY=845,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DFUserHP=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_pve_ranking_gauge',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=173,Y2=13),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1323,OffsetY=895,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTimerBombBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.time_notice',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=240,Y2=106),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=659,OffsetY=74,ScaleMode=4,Scale=0.4000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    matBack1=Texture'Warfare_GP_UI_HUD.Common.img_HUD_back_1'
    matLine=Texture'Warfare_GP_UI_UI.HUD_ETC.list_scor_bord'
    matOn=Texture'Warfare_GP_UI_UI.HUD_ETC.list_result_on'
    Medals[0]=Texture'Warfare_GP_UI_UI.HUD_ETC.img_indimat_1'
    Medals[1]=Texture'Warfare_GP_UI_UI.HUD_ETC.img_indimat_2'
    Medals[2]=Texture'Warfare_GP_UI_UI.HUD_ETC.img_indimat_3'
    RankPostfix="th place"
    WAlienModeScoreBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_ailanmode_scoreboard_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=620,Y2=114),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=490,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W3Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=144,X2=274,Y2=216),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W5Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=144,X2=548,Y2=216),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W7Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=144,X2=822,Y2=216),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W10Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=0,Y1=216,X2=274,Y2=288),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    W15Kill=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=274,Y1=216,X2=548,Y2=288),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHeadshot=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text',RenderStyle=5,TextureCoords=(X1=548,Y1=72,X2=822,Y2=144),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=663,OffsetY=319,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WKillTextBg=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_kill_text_bg2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=182,Y2=53),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=720,OffsetY=262,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WHudBack3=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=119,OffsetY=116,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTxtHostChange=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=816,X2=512,Y2=880),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=700,OffsetY=459,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTxtSudenDeath=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=912,X2=256,Y2=976),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=672,OffsetY=173,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wTxtSubSudenDeath=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=339,Y1=880,X2=451,Y2=912),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=744,OffsetY=245,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    lsSudenDeathMessage[0]="Free-for-All: The player with the most kills wins."
    lsSudenDeathMessage[1]="Team Deathmatch: The team that eliminates all opponents wins."
    lsSudenDeathMessage[2]="Demolition: Kill all enemies or destroy the target to win."
    SoundRequireHeliCopter="Warfare_Sound_ATS/cb/ats_cb_ready_helicopter"
    SoundRequireAtillery="Warfare_Sound_ATS/cb/ats_cb_ready_artillery"
    SoundRequireUAV="Warfare_Sound_ATS/cb/ats_cb_ready_uav"
    SoundRequireSentryGun="Warfare_Sound_ATS/cb/ats_cb_ready_uav"
    SoundNotReady="Warfare_Sound_ATS/cb/ats_cb_use_fail"
    MessageWin="Win"
    MessageLose="Lose"
    HelpKeyButtonReload=(WidgetTexture=none,RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=26,Y2=26),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=728,OffsetY=688,ScaleMode=4,Scale=1.0000000,Tints=(R=189,G=0,B=0,A=255),Tints[1]=(R=189,G=0,B=0,A=255))
    wBackSeparationTop=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_up',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=40),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=459,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    wBackSeparationBottom=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_down',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=40),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=723,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=246),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=256,X2=1024,Y2=502),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[2]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=512,X2=1024,Y2=758),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageAF[3]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_af',RenderStyle=5,TextureCoords=(X1=0,Y1=768,X2=1024,Y2=1014),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[0]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=1024,Y2=246),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[1]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=256,X2=1024,Y2=502),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[2]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=512,X2=1024,Y2=758),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WTeamImageRSA[3]=(WidgetTexture=Texture'Warfare_GP_UI_UI.HUD_ETC.img_hud_etc_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=768,X2=1024,Y2=1014),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=576,OffsetY=477,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WScoreTeamMarkAF=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_score_indicatecamp_myteammark_af',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=705,OffsetY=7,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WScoreTeamMarkRSA=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_HUD_score_indicatecamp_myteammark_rsa',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=863,OffsetY=7,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    strNotReadySkill[0]="The %0 killstreak skill is earned after %1 kills."
    strNotReadySkill[1]="The %0 scorestreak skill is earned after %1 total stacked kills."
    strNotReadySkill[2]="The %0 assist skill is earned after %1 assists."
    strNotReadySkill[3]="The %0 deathstreak skill is earned after %1 deaths."
    strReadySkill="%0 ready"
    strReadySkillDesc="Select %0"
    strReadySupplyItem="%0 ready"
    strReadySupplyItemDesc="%0 request ready"
    strHelicopter="Helicopter"
    strSentryGun="Sentrygun"
    strAirStrike="Artillery"
    strUAV="UAV"
    strHelicopterFailed="Helicopter request failed"
    strSentryGunFailed="Sentry Gun request failed"
    strAirStrikeFailed="Artillery request failed"
    strHelicopterFailedDesc="Another helicopter already requested"
    strSentryGunFailedDesc="Another Sentry Gun already requested"
    strAirStrikeFailedDesc="Another Artillery already requested"
    WRespawnBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gauge_HUD_back',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=544,OffsetY=388,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    WRespawnGauge=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.gauge_HUD_n',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=512,Y2=32),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=546,OffsetY=390,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}