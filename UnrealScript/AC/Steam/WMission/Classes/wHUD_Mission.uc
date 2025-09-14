/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wHUD_Mission.uc
 * Package Imports:
 *	WMission
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:92
 *	Functions:74
 *
 *******************************************************************************/
class wHUD_Mission extends HudCTeamDeathMatch
    dependson(wMSPlayerReplicationInfo)
    dependson(wScoreBoard_Mission)
    dependson(wInfoPod)
    dependson(wTrigger_MSMessageTrigger)
    dependson(wObjectivePointingArrow)
    dependson(wObjectiveProgressDisplay)
    dependson(wMSGameInfo)
    dependson(wGameObject_Bomb)
    dependson(wSetObjective)
    dependson(wDiffuseObjective)
    config(User)
    transient;

var config float ObjectiveScale;
var config bool bOnHUDObjectiveNotification;
var config bool bShowInfoPods;
var config bool bDrawAllObjectives;
var config bool bShow3DArrow;
var config bool bObjectiveReminder;
var config bool bDrawRadar;
var config bool bDrawRadarCardinalPoints;
var config bool bShowWillowWhisp;
var int wPawnCountsOld;
var bool bForceSpawnNotification;
var bool bShowObjectiveBoard;
var bool bForceObjectiveBoard;
var bool bShowMissionIcon;
var array<GameObjective> obj;
var array<wInfoPod> InfoPods;
var array<wTrigger_MSMessageTrigger> MTrigger;
var array<TexRotator> BehindObjectiveArrows;
var wObjectivePointingArrow OBJPointingArrow;
var byte BehindObjectiveCount;
var float OBJ_ReAppearTime;
var float OBJ_FadedOutTime;
var float Global_Delta;
var float fBlink;
var float fPulse;
var float ASRadarScale;
var config float ASRadarPosX;
var config float ASRadarPosY;
var float LastRadarUpdate;
var array<Vehicle> RadarVehicleCache;
var Material HealthBarBackMat;
var Material HealthBarMat;
var float HealthBarWidth;
var float HealthBarHeight;
var int OldRemainingRoundTime;
var localized string IP_Bracket_Open;
var localized string IP_Bracket_Close;
var localized string Cardinal_North;
var localized string Cardinal_East;
var localized string Cardinal_South;
var localized string Cardinal_West;
var localized string NoGameReplicationInfoString;
var localized string MetersString;
var localized string TargetString;
var localized string NoTargetString;
var localized string PracticeRoundString;
var float AttackerProgressUpdateTime;
var config float ObjectiveProgressPulseTime;
var byte ObjectiveProgress;
var byte OldObjectiveProgress;
var wMSGameReplicationInfo MSGRI;
var wMSPlayerReplicationInfo MSPRI;
var GameObjective CurrentObjective;
var Vehicle TrackedVehicle;
var float NextTrackedVehicleSearch;
var() SpriteWidget RoundTimeBackGround;
var() SpriteWidget ReinforceBackground;
var() SpriteWidget TeleportBackground;
var() SpriteWidget VSBackground;
var() SpriteWidget RoundTimeIcon;
var() SpriteWidget ReinforceIcon;
var() SpriteWidget TeleportIcon;
var() SpriteWidget VSIcon;
var() SpriteWidget ReinforcePulse;
var() SpriteWidget TeleportPulse;
var() SpriteWidget VSPulse;
var() SpriteWidget RoundTimeBackGroundDisc;
var() SpriteWidget ReinforceBackGroundDisc;
var() SpriteWidget TeleportBackgroundDisc;
var() SpriteWidget VSBackgroundDisc;
var() SpriteWidget RoundTimeSeparator;
var() NumericWidget RoundTimeMinutes;
var() NumericWidget RoundTimeSeconds;
var() NumericWidget ReinforceSprNum;
var() NumericWidget TeleportSprNum;
var float NextSpawnNotification;
var byte PrevTeam;
var() wObjectiveProgressDisplay ObjectiveBoard;
var float IntroTitleFade;
var float fViewDelayTime;
var float fBeginDrawTime;
var bool bViewRoundResult;
var() SpriteWidget PlantLabel;
var() SpriteWidget DiffuseLabel;
var bool bProgressDone;
var float fProgressDoneTime;
var() array<SpriteWidget> MinimapEnemyFlags;
var() array<SpriteWidget> MinimapNoncapturedFlag;
var() array<SpriteWidget> MinimapAllyFlag;
var float LastSpectatingTime;
var float BeginSpectatingTime;
var bool bDrawRoundResult;

simulated function DrawTimer(Canvas C);
simulated function DrawAdrenaline(Canvas C);
exec function ShowObjectiveBoard()
{
    bShowObjectiveBoard = !bShowObjectiveBoard;
}

simulated function PrecacheFonts(Canvas C)
{
    super(HudBase).PrecacheFonts(C);
    C.Font = GetFontSizeIndex(C, -1);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, -3);
    C.SetPos(0.0, 0.0);
    C.DrawText("Aa1");
}

simulated event PostBeginPlay()
{
    local wInfoPod IP;
    local wTrigger_MSMessageTrigger mT;

    super(HudCDeathmatch).PostBeginPlay();
    UpdateOBJ();
    // End:0x2f
    foreach AllActors(class'wInfoPod', IP)
    {
        InfoPods[InfoPods.Length] = IP;                
    }
    // End:0x53
    foreach AllActors(class'wTrigger_MSMessageTrigger', mT)
    {
        MTrigger[MTrigger.Length] = mT;                
    }
    ObjectiveBoard = Spawn(class'wObjectiveProgressDisplay', Owner);
    ObjectiveBoard.Initialize(self);
    HudPart_Minimap.__OnPreDrawMyself__Delegate = DrawMinimap_HUD;
    HudPart_Bigmap.__OnPreDrawMyself__Delegate = DrawBigmap_HUD;
}

simulated function UpdateOBJ()
{
    local GameObjective Go;

    obj.Length = 0;
    // End:0x41
    foreach AllActors(class'GameObjective', Go)
    {
        // End:0x2e
        if(Go.bBotOnlyObjective)
        {
            continue;
        }
        // End:0x41
        else
        {
            obj[obj.Length] = Go;
            continue;
        }        
    }
}

simulated event Destroyed()
{
    // End:0x1e
    if(ObjectiveBoard != none)
    {
        ObjectiveBoard.Destroy();
        ObjectiveBoard = none;
    }
    Release_BehindObjectiveArrows();
    Release_ObjectivePointingArrow();
    super(HUD).Destroyed();
}

simulated function DrawHudPassA(Canvas C)
{
    local int iElapsedTime;

    super.DrawHudPassA(C);
    // End:0x4e
    if(PlayerOwner != none && wPawnCountsOld != wPlayer(PlayerOwner).wPawnCounts)
    {
        wPawnCountsOld = wPlayer(PlayerOwner).wPawnCounts;
    }
    iElapsedTime = MSGRI.RoundStartTime - MSGRI.RemainingTime;
    HudPart_DisplayEvent.DrawMessage_BeginMission(C, MSGRI.CurrentRound, MSGRI.bChangeAttackingTeam, MSGRI.CurrentAttackingTeam, iElapsedTime);
    xScoreBoardTeamGame(ScoreBoard).SetAttackingTeam(MSGRI.CurrentAttackingTeam);
}

function CallEvent(optional bool InvenCheck, optional int iReservation1, optional int iReservation2)
{
    super(HudCDeathmatch).CallEvent(InvenCheck, iReservation1, iReservation2);
}

function DrawDebugMission(Canvas C)
{
    local GameReplicationInfo GRI;
    local int Y;
    local wMSGameInfo msgame;
    local wGameObject_Bomb goBomb;
    local wSetObjective Set;
    local wDiffuseObjective Diffuse;

    GRI = PlayerOwner.GameReplicationInfo;
    MSGRI = wMSGameReplicationInfo(GRI);
    msgame = wMSGameInfo(Level.Game);
    Y = 200;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified("bObjectivePlanted=" $ string(MSGRI.bObjectivePlanted), 0, 0.0, float(Y), 1024.0, float(Y + 14), 9);
    Y += 14;
    C.BtrDrawTextJustified("MSGRI.CurrentAttackingTeam=" $ string(MSGRI.CurrentAttackingTeam) $ " ObjectiveProgress=" $ string(MSGRI.ObjectiveProgress), 0, 0.0, float(Y), 1024.0, float(Y + 14), 9);
    Y += 14;
    // End:0x22a
    foreach DynamicActors(class'wGameObject_Bomb', goBomb)
    {
        C.BtrDrawTextJustified("[wGameObject_Bomb] Holder=" $ goBomb.HolderPRI.PlayerName $ " bDisabled=" $ string(goBomb.bDisabled) $ " bHidden=" $ string(goBomb.bHidden) $ " state=" $ string(goBomb.GetStateName()), 0, 0.0, float(Y), 1024.0, float(Y + 14), 9);
        Y += 14;                
    }
    // End:0x2c4
    foreach DynamicActors(class'wSetObjective', Set)
    {
        C.BtrDrawTextJustified("[wSetObjective] strPlayerName=" $ Set.strPlayerName $ " bActive=" $ string(Set.bActive), 0, 0.0, float(Y), 1024.0, float(Y + 14), 9);
        Y += 14;                
    }
    // End:0x362
    foreach DynamicActors(class'wDiffuseObjective', Diffuse)
    {
        C.BtrDrawTextJustified("[wDiffuseObjective] strPlayerName=" $ Diffuse.strPlayerName $ " bActive=" $ string(Diffuse.bActive), 0, 0.0, float(Y), 1024.0, float(Y + 14), 9);
        Y += 14;                
    }
    // End:0x36e
    if(msgame != none)
    {
    }
}

function DrawDebugTime(Canvas C)
{
    local GameReplicationInfo GRI;
    local int Minutes, Hours, Seconds, Minutes2, Hours2, Seconds2;

    GRI = PlayerOwner.GameReplicationInfo;
    MSGRI = wMSGameReplicationInfo(GRI);
    Seconds = GRI.RemainingTime;
    Seconds2 = GRI.ElapsedTime;
    // End:0x80
    if(Seconds > 3600)
    {
        Hours = Seconds / 3600;
        Seconds -= Hours * 3600;
    }
    Minutes = Seconds / 60;
    Seconds -= Minutes * 60;
    // End:0xd3
    if(Seconds2 > 3600)
    {
        Hours2 = Seconds2 / 3600;
        Seconds2 -= Hours2 * 3600;
    }
    Minutes2 = Seconds2 / 60;
    Seconds2 -= Minutes2 * 60;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified("TimeLimit=" $ string(GRI.TimeLimit) $ " RoundState=" $ string(GRI.RoundState), 0, 0.0, 500.0, 1024.0, 520.0, 12);
    C.BtrDrawTextJustified("Remain=" $ string(GRI.RemainingTime) $ " " $ string(Minutes) $ ":" $ string(Seconds), 0, 0.0, 520.0, 1024.0, 540.0, 12);
    C.BtrDrawTextJustified("Elapsed=" $ string(GRI.ElapsedTime) $ " " $ string(Minutes2) $ ":" $ string(Seconds2), 0, 0.0, 540.0, 1024.0, 560.0, 12);
    C.BtrDrawTextJustified("PostRemaiingTime=" $ string(GRI.PostRemaiingTime) $ " PostRemaiingTimeClient=" $ string(GRI.PostRemaiingTimeClient), 0, 0.0, 560.0, 1024.0, 580.0, 12);
    // End:0x3ce
    if(MSGRI != none)
    {
        C.BtrDrawTextJustified("RoundTimeLimit=" $ string(MSGRI.RoundTimeLimit) $ " RoundStartTime=" $ string(MSGRI.RoundStartTime) $ " RemainingTime=" $ string(MSGRI.RemainingTime), 0, 0.0, 580.0, 1024.0, 600.0, 12);
        C.BtrDrawTextJustified("wMSGameInfo=" $ string(Level.Game.IsA('wMSGameInfo')) $ " wDOMGameInfo=" $ string(Level.Game.IsA('wDOMGameInfo')), 0, 0.0, 620.0, 1024.0, 640.0, 12);
    }
}

simulated function DrawHudPassB(Canvas C)
{
    super(HudBase).DrawHudPassB(C);
}

simulated function DrawHudPassC(Canvas C)
{
    local bool bOldShowWeaponInfo, bOldShowPersonalInfo;
    local class<wAmmunition> AmmoClass;

    // End:0x29
    if(Level.GetMatchMaker().InGameOver == 0)
    {
        DrawAssaultHUDLayer(C);
    }
    bOldShowWeaponInfo = bShowWeaponInfo;
    // End:0x9b
    if(PawnOwner != none && PawnOwner.Weapon != none)
    {
        AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
        // End:0x9b
        if(AmmoClass == none || ClassIsChildOf(AmmoClass, class'wAmmo_Dummy'))
        {
            bShowWeaponInfo = false;
        }
    }
    bOldShowPersonalInfo = bShowPersonalInfo;
    super.DrawHudPassC(C);
    bShowWeaponInfo = bOldShowWeaponInfo;
    bShowPersonalInfo = bOldShowPersonalInfo;
}

function CanvasDrawActors(Canvas C, bool bClearedZBuffer)
{
    // End:0x57
    if(PawnOwner != none && bShow3DArrow && !bHideHUD)
    {
        // End:0x3d
        if(!bClearedZBuffer)
        {
            C.DrawActor(none, false, true);
        }
        Draw3dObjectiveArrow(C);
        super(HUD).CanvasDrawActors(C, true);
    }
    // End:0x68
    else
    {
        super(HUD).CanvasDrawActors(C, bClearedZBuffer);
    }
}

simulated function DrawAssaultHUDLayer(Canvas C)
{
    // End:0x14
    if(bShowInfoPods)
    {
        DrawInfoPods(C);
    }
    // End:0x28
    if(bOnHUDObjectiveNotification)
    {
        DrawObjectives(C);
    }
    // End:0x52
    if(MSGRI != none && MSGRI.IsPracticeRound())
    {
        DrawPracticeRoundInfo(C);
    }
}

simulated function bool ShouldShowObjectiveBoard()
{
    // End:0x1a
    if(ObjectiveBoard == none || MSGRI == none)
    {
        return false;
    }
    // End:0x2e
    if(ObjectiveBoard.AnyOptionalObjectiveCritical())
    {
        return true;
    }
    return bShowObjectiveBoard || bForceObjectiveBoard || AttackerProgressUpdateTime > float(0);
}

simulated function UpdateTeamHud()
{
    local int RoundTime, Minutes, Seconds, TeleportCount;

    super.UpdateTeamHud();
    // End:0x13
    if(MSGRI == none)
    {
        return;
    }
    // End:0x16d
    if(MSGRI.RoundTimeLimit > 0)
    {
        RoundTime = Max(0, MSGRI.RoundTimeLimit - MSGRI.RoundStartTime + MSGRI.RemainingTime);
        // End:0x8b
        if(MSGRI.RoundWinner != 0)
        {
            RoundTime = MSGRI.RoundOverTime;
        }
        Minutes = RoundTime / 60;
        Seconds = RoundTime - Minutes * 60;
        RoundTimeMinutes.Value = Minutes;
        RoundTimeSeconds.Value = Min(Seconds, 60);
        // End:0x12e
        if(Minutes > 9)
        {
            RoundTimeSeparator.OffsetX = default.RoundTimeSeparator.OffsetX + 32;
            RoundTimeMinutes.OffsetX = default.RoundTimeMinutes.OffsetX + 32;
            RoundTimeSeconds.OffsetX = default.RoundTimeSeconds.OffsetX + 32;
        }
        // End:0x16d
        else
        {
            RoundTimeSeparator.OffsetX = default.RoundTimeSeparator.OffsetX;
            RoundTimeMinutes.OffsetX = default.RoundTimeMinutes.OffsetX;
            RoundTimeSeconds.OffsetX = default.RoundTimeSeconds.OffsetX;
        }
    }
    ReinforceSprNum.Value = Min(MSGRI.ReinforcementCountDown, 999);
    // End:0x203
    if(MSPRI != none)
    {
        TeleportCount = Min(MSGRI.RoundTimeLimit - MSGRI.RoundStartTime + MSGRI.RemainingTime + MSGRI.MaxTeleportTime - MSPRI.TeleportTime, 999);
        TeleportSprNum.Value = TeleportCount;
    }
}

simulated function UpdateTimer(out int TimeMinutes, out int TimeSeconds)
{
    local int RoundTime, Minutes, Seconds;

    // End:0x0d
    if(MSGRI == none)
    {
        return;
    }
    // End:0x103
    if(MSGRI.RoundTimeLimit > 0)
    {
        bShowTimer2WithDigitRedAlert = MSGRI.bObjectivePlanted;
        RoundTime = Max(0, MSGRI.RoundTimeLimit - MSGRI.RoundStartTime - MSGRI.RemainingTime);
        // End:0x9b
        if(MSGRI.bObjectivePlanted)
        {
            RoundTime = Min(RoundTime, MSGRI.DefuseTimeLimit);
        }
        // End:0xc8
        if(MSGRI.RoundWinner != 0)
        {
            RoundTime = MSGRI.RoundOverTime;
        }
        Minutes = RoundTime / 60;
        Seconds = RoundTime - Minutes * 60;
        TimeMinutes = Minutes;
        TimeSeconds = Seconds;
    }
}

function updateScore()
{
    local PlayerReplicationInfo PRI;

    PRI = PlayerOwner.PlayerReplicationInfo;
    SetDigitsScore(int(MSGRI.Teams[0].Score), PRI.Team.TeamIndex == 0, int(MSGRI.Teams[1].Score), PRI.Team.TeamIndex == 1, MSGRI.ScoreLimit, 0);
}

simulated function UpdateHUD()
{
    super.UpdateHUD();
}

simulated function ShowTeamScorePassA(Canvas C)
{
    local float PosY;

    // End:0x0d
    if(MSGRI == none)
    {
        return;
    }
    // End:0xa2
    if(MSGRI.RoundTimeLimit > 0)
    {
        RoundTimeBackGround.Tints[TeamIndex] = HudColorBlack;
        RoundTimeBackGround.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, RoundTimeBackGround);
        DrawSpriteWidget(C, RoundTimeBackGroundDisc);
        DrawSpriteWidget(C, RoundTimeSeparator);
        DrawSpriteWidget(C, RoundTimeIcon);
        PosY += 0.060 * HudScale;
    }
    // End:0x1d5
    if(Level.Game == none || !wMSGameInfo(Level.Game).bDisableReinforcements)
    {
        ReinforceBackground.PosY = PosY;
        ReinforceBackGroundDisc.PosY = PosY;
        ReinforcePulse.PosY = PosY;
        ReinforceIcon.PosY = PosY;
        ReinforceSprNum.PosY = PosY;
        PosY += 0.060 * HudScale;
        ReinforceBackground.Tints[TeamIndex] = HudColorBlack;
        ReinforceBackground.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, ReinforceBackground);
        DrawSpriteWidget(C, ReinforceBackGroundDisc);
        ReinforcePulse.Tints[TeamIndex] = HudColorHighLight;
        // End:0x1c5
        if(MSGRI.ReinforcementCountDown < 1)
        {
            DrawSpriteWidget(C, ReinforcePulse);
        }
        DrawSpriteWidget(C, ReinforceIcon);
    }
    // End:0x2c2
    if(MSGRI != none && float(MSGRI.CurrentRound) % float(2) == float(0) && !MSGRI.IsPracticeRound() && IsVSRelevant())
    {
        VSBackground.PosY = PosY;
        VSBackgroundDisc.PosY = PosY;
        VSIcon.PosY = PosY;
        PosY += 0.060 * HudScale;
        VSBackground.Tints[TeamIndex] = HudColorBlack;
        VSBackground.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, VSBackground);
        DrawSpriteWidget(C, VSBackgroundDisc);
        DrawSpriteWidget(C, VSIcon);
    }
    // End:0x3da
    if(MSPRI != none && MSPRI.bTeleportToSpawnArea && TeleportSprNum.Value >= 0)
    {
        TeleportBackground.PosY = PosY;
        TeleportBackgroundDisc.PosY = PosY;
        TeleportPulse.PosY = PosY;
        TeleportIcon.PosY = PosY;
        TeleportSprNum.PosY = PosY;
        PosY += 0.060 * HudScale;
        TeleportBackground.Tints[TeamIndex] = HudColorBlack;
        TeleportBackground.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, TeleportBackground);
        DrawSpriteWidget(C, TeleportBackgroundDisc);
        TeleportPulse.Tints[TeamIndex] = HudColorHighLight;
        DrawSpriteWidget(C, TeleportPulse);
        DrawSpriteWidget(C, TeleportIcon);
    }
    // End:0x3ee
    if(MSGRI.RoundTimeLimit > 0)
    {
    }
    // End:0x445
    if(MSGRI != none && float(MSGRI.CurrentRound) % float(2) == float(0) && !MSGRI.IsPracticeRound() && IsVSRelevant())
    {
        DrawTeamVS(C);
    }
}

simulated function DrawTeamVS(Canvas C)
{
    local bool bIsBehindOtherTeam;
    local int RelativeTime, Hours, Minutes, Seconds, PlayerTeam;

    local string output;
    local float ScreenX, ScreenY, TotalScaleX, TotalScaleY, TextureDX, TextureDY,
	    XL, YL, Progress;

    // End:0x166
    if(CurrentObjective.ObjectiveDisabledTime > 0)
    {
        RelativeTime = CurrentObjective.ObjectiveDisabledTime - MSGRI.RoundStartTime - MSGRI.RemainingTime;
        bIsBehindOtherTeam = RelativeTime < 0;
        Hours = int(Abs(float(RelativeTime)) / float(3600));
        Minutes = int(Abs(float(RelativeTime)) - float(Hours * 3600)) / 60;
        Seconds = int(Abs(float(RelativeTime)) - float(Hours * 3600) - float(Minutes * 60));
        // End:0xe1
        if(Hours > 0)
        {
            output = string(Hours) $ ":";
        }
        // End:0x109
        if(Minutes > 9)
        {
            output = output $ string(Minutes) $ ":";
        }
        // End:0x127
        else
        {
            output = output $ "0" $ string(Minutes) $ ":";
        }
        // End:0x14a
        if(Seconds > 9)
        {
            output = output $ string(Seconds);
        }
        // End:0x163
        else
        {
            output = output $ "0" $ string(Seconds);
        }
    }
    // End:0x1b8
    else
    {
        Progress = CurrentObjective.SavedObjectiveProgress - CurrentObjective.GetObjectiveProgress();
        bIsBehindOtherTeam = Progress < float(0);
        output = string(int(Abs(Progress * float(100)))) $ "%";
    }
    TotalScaleX = HudCanvasScale * ResScaleX * HudScale;
    TotalScaleY = HudCanvasScale * ResScaleY * HudScale;
    TextureDX = Abs(float(VSBackgroundDisc.TextureCoords.X2 - VSBackgroundDisc.TextureCoords.X1) + 1.0) * TotalScaleX * VSBackgroundDisc.TextureScale;
    TextureDY = Abs(float(VSBackground.TextureCoords.Y2 - VSBackground.TextureCoords.Y1) + 1.0) * TotalScaleY * VSBackground.TextureScale;
    ScreenX = VSBackgroundDisc.PosX * HudCanvasScale * float(C.SizeX) + 1.0 - HudCanvasScale * 0.50 * float(C.SizeX);
    ScreenY = VSBackground.PosY * HudCanvasScale * float(C.SizeY) + 1.0 - HudCanvasScale * 0.50 * float(C.SizeY);
    ScreenX += float(VSBackgroundDisc.OffsetX) * TotalScaleX + TextureDX * float(1);
    ScreenY += float(VSBackground.OffsetY) * TotalScaleY + TextureDY * 0.450;
    C.Font = GetMediumFont(C.ClipX * HudScale);
    C.TextSize(output, XL, YL);
    C.Style = 5;
    // End:0x3d9
    if(PawnOwner == none)
    {
        PlayerTeam = PlayerOwner.GetTeamNum();
    }
    // End:0x3ee
    else
    {
        PlayerTeam = PawnOwner.GetTeamNum();
    }
    // End:0x416
    if(MSGRI.IsDefender(byte(PlayerTeam)))
    {
        bIsBehindOtherTeam = !bIsBehindOtherTeam;
    }
    // End:0x45c
    if(bIsBehindOtherTeam)
    {
        output = "-" $ output;
        C.DrawColor = C.MakeColor(byte(255), 0, 0, byte(255));
    }
    // End:0x486
    else
    {
        C.DrawColor = C.MakeColor(0, byte(255), 0, byte(255));
    }
    C.SetPos(ScreenX, ScreenY - YL / float(2));
    C.DrawText(output, false);
}

simulated function bool IsVSRelevant()
{
    // End:0x97
    if(MSGRI.RoundWinner != 0 || CurrentObjective == none || CurrentObjective.ObjectiveDisabledTime == 0 && CurrentObjective.SavedObjectiveProgress == float(0) || CurrentObjective.SavedObjectiveProgress == float(1) || CurrentObjective.SavedObjectiveProgress - CurrentObjective.GetObjectiveProgress() > float(0))
    {
        return false;
    }
    return true;
}

simulated function ShowTeamScorePassC(Canvas C);
simulated function DrawSpectatingHud(Canvas C)
{
    local bool renderAssaultHudLayer;

    super.DrawSpectatingHud(C);
    renderAssaultHudLayer = true;
    // End:0x1b8
    if(MSGRI != none)
    {
        // End:0x1b8
        if(Level.GetMatchMaker().InGameOver == 0)
        {
            // End:0x17e
            if(MSGRI.RoundState == 1 || MSGRI.RoundState == 3)
            {
                // End:0xa2
                if(Level.TimeSeconds - LastSpectatingTime > float(2))
                {
                    BeginSpectatingTime = Level.TimeSeconds;
                }
                LastSpectatingTime = Level.TimeSeconds;
                // End:0x132
                if(MSGRI.RoundState == 1)
                {
                    // End:0x12f
                    if(bDrawRoundResult)
                    {
                        // End:0x11b
                        if(Level.TimeSeconds - BeginSpectatingTime <= float(3))
                        {
                            HudPart_DisplayEvent.DrawRoundResult(C, MSGRI.ScoringTeam);
                        }
                        // End:0x12f
                        else
                        {
                            ScoreBoard.DrawScoreboard(C);
                        }
                    }
                }
                // End:0x17e
                else
                {
                    // End:0x17e
                    if(MSGRI.RoundState == 3)
                    {
                        HudPart_DisplayEvent.DrawResultScore(C, PlayerOwner.GetTeamNum() == MSGRI.ScoringTeam);
                    }
                }
            }
            renderAssaultHudLayer = !MSGRI.RoundState == 3 || MSGRI.RoundState == 1;
        }
    }
    UpdateTeamHud();
    // End:0x1d2
    if(renderAssaultHudLayer)
    {
        DrawAssaultHUDLayer(C);
    }
}

function DrawDebug(Canvas C, int X, out int Y, int dy)
{
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified(" @ wPawnCounts=" $ string(wPlayer(PlayerOwner).wPawnCounts), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    super(HudCDeathmatch).DrawDebug(C, X, Y, dy);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified(" BeginSpectatingTime=" $ string(BeginSpectatingTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustified(" LastSpectatingTime=" $ string(LastSpectatingTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustified(" RoundState=" $ string(GetEnum(enum'EROUND_STATE', MSGRI.RoundState)), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
}

function DrawRadarPassA(Canvas C);
simulated function DrawRadarPassB(Canvas C)
{
    local Vehicle P;
    local float dist, RadarWidth, DotSize, OffsetY;
    local Vector Start, ViewX, ViewY, Z;
    local float MaxSmartRange, OffsetScale;
    local int i;

    // End:0x0d
    if(PawnOwner == none)
    {
        return;
    }
    Start = PawnOwner.Location;
    ASRadarScale = default.ASRadarScale * HudScale;
    RadarWidth = 0.50 * ASRadarScale * C.ClipX;
    OffsetY = ASRadarPosY + RadarWidth / C.ClipY;
    MaxSmartRange = 30000.0;
    DotSize = 20.0 * C.ClipX * HudScale / float(1600);
    C.Style = 6;
    OffsetScale = ASRadarScale * 0.0000840;
    GetAxes(PawnOwner.GetViewRotation(), ViewX, ViewY, Z);
    // End:0x24d
    if(Level.TimeSeconds > LastRadarUpdate + float(1))
    {
        LastRadarUpdate = Level.TimeSeconds;
        RadarVehicleCache.Length = 0;
        // End:0x249
        foreach DynamicActors(class'Vehicle', P)
        {
            // End:0x248
            if(P != PawnOwner && P.GetTeamNum() != PawnOwner.GetTeamNum() && P != TrackedVehicle && P.Health > 0 && !P.bDeleteMe && P.IndependentVehicle())
            {
                RadarVehicleCache[RadarVehicleCache.Length] = P;
                dist = GetRadarDotDist(P.Location - Start, ViewX, ViewY);
                // End:0x248
                if(dist < MaxSmartRange)
                {
                    dist = ApplySmartRangeDist(dist * 0.50);
                    C.DrawColor = GetTeamColor(byte(P.GetTeamNum()));
                }
            }                        
        }
    }
    // End:0x389
    else
    {
        i = 0;
        J0x254:
        // End:0x389 [While If]
        if(i < RadarVehicleCache.Length)
        {
            P = RadarVehicleCache[i];
            // End:0x37f
            if(P != none && P != PawnOwner && P.GetTeamNum() != PawnOwner.GetTeamNum() && P != TrackedVehicle && P.Health > 0 && !P.bDeleteMe && P.IndependentVehicle())
            {
                dist = GetRadarDotDist(P.Location - Start, ViewX, ViewY);
                // End:0x37f
                if(dist < MaxSmartRange)
                {
                    dist = ApplySmartRangeDist(dist * 0.50);
                    C.DrawColor = GetTeamColor(byte(P.GetTeamNum()));
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x254;
        }
    }
}

function float ApplySmartRangeDist(float dist)
{
    // End:0x38
    if(dist > float(3000))
    {
        dist = dist - float(3000) * 0.250 + float(2000);
    }
    // End:0x6d
    else
    {
        // End:0x6d
        if(dist > float(1000))
        {
            dist = dist - float(1000) * 0.50 + float(1000);
        }
    }
    return FMin(dist, 5500.0);
}

function float GetRadarDotDist(Vector dist, Vector ViewX, Vector ViewY)
{
    local Vector DotProjected;

    DotProjected.X = dist Dot Normal(ViewX);
    DotProjected.Y = dist Dot Normal(ViewY);
    return VSize(DotProjected);
}

function Vector GetRadarDotPosition(Canvas C, Vector dist, Vector ViewX, Vector ViewY, float OffsetScale, float OffsetY)
{
    local Vector ScreenPosition, DotProjected;

    DotProjected.X = Normal(dist) Dot Normal(ViewX);
    DotProjected.Y = Normal(dist) Dot Normal(ViewY);
    ScreenPosition.X = ASRadarPosX * C.ClipX + OffsetScale * C.ClipX * DotProjected.Y;
    ScreenPosition.Y = OffsetY * C.ClipY - OffsetScale * C.ClipX * DotProjected.X;
    return ScreenPosition;
}

function bool IsOnEdgeOfScreen(Canvas C, Vector pos, float W, float H)
{
    local float Margin;

    Margin = 1.0;
    // End:0x55
    if(pos.X < W + Margin || C.ClipX - W - Margin < pos.X)
    {
        return true;
    }
    // End:0x9f
    if(pos.Y < H + Margin || C.ClipY - H - Margin < pos.Y)
    {
        return true;
    }
    return false;
}

function Color MultiplyColor(out Color c1, Color c2)
{
    local float A, R, G, B;

    A = float(c2.A) / 255.0;
    R = float(c2.R) / 255.0;
    G = float(c2.G) / 255.0;
    B = float(c2.B) / 255.0;
    c1.A = byte(float(c1.A) * A);
    c1.R = byte(float(c1.R) * R);
    c1.G = byte(float(c1.G) * G);
    c1.B = byte(float(c1.B) * B);
    return c1;
}

simulated function DrawObjectives(Canvas C);
static function int GetGameObjectIndex(GameObjective Go)
{
    return GetGameObjectIndexByTag(Go.Tag);
}

static function int GetGameObjectIndexByTag(name Tag)
{
    // End:0x14
    if(Tag == 'Set_0')
    {
        return 0;
    }
    // End:0x62
    else
    {
        // End:0x28
        if(Tag == 'Set_1')
        {
            return 1;
        }
        // End:0x62
        else
        {
            // End:0x3c
            if(Tag == 'Flag_A')
            {
                return 0;
            }
            // End:0x62
            else
            {
                // End:0x50
                if(Tag == 'Flag_B')
                {
                    return 1;
                }
                // End:0x62
                else
                {
                    // End:0x62
                    if(Tag == 'Flag_C')
                    {
                        return 2;
                    }
                }
            }
        }
    }
}

function DrawProgressMessage(Canvas C, float ProgressPct);
function CheckAndDrawProgress(GameObjective Go, Canvas C);
function DrawMinimap_HUD(Canvas C)
{
    DrawMiniMap(HudPart_Minimap, C);
}

function DrawBigmap_HUD(Canvas C)
{
    DrawMiniMap(HudPart_Bigmap, C);
}

function DrawMiniMap(wHudPart_MinimapBase Minimap, Canvas C);
simulated function DrawCriticalObjectiveOverlay(Canvas C, Vector ScreenPos, float Scale);
simulated function DrawObjectiveStatusOverlay(Canvas C, float Progress, bool bCriticalFlash, Vector ScreenPos, float Scale);
simulated function DrawObjectiveIcon(Canvas C, bool bOptionalObjective, float PosX, float PosY, float tileX, float tileY);
simulated function TexRotator Get_BehindObjectiveArrow()
{
    local TexRotator Arrow;

    // End:0x8a
    if(BehindObjectiveArrows.Length <= BehindObjectiveCount || BehindObjectiveArrows[BehindObjectiveCount] == none)
    {
        Arrow = TexRotator(Level.ObjectPool.AllocateObject(class'TexRotator'));
        Arrow.UOffset = 64.0;
        Arrow.VOffset = 64.0;
        BehindObjectiveArrows[BehindObjectiveCount] = Arrow;
    }
    return BehindObjectiveArrows[BehindObjectiveCount];
}

simulated function Release_BehindObjectiveArrows()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x44 [While If]
    if(i < BehindObjectiveArrows.Length)
    {
        Level.ObjectPool.FreeObject(BehindObjectiveArrows[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function Draw3dObjectiveArrow(Canvas C)
{
    local Actor TrackedActor;

    // End:0x1a
    if(PlayerOwner == none || MSGRI == none)
    {
        return;
    }
    // End:0x45
    if(OBJPointingArrow == none)
    {
        OBJPointingArrow = Spawn(class'wObjectivePointingArrow', PlayerOwner);
        // End:0x45
        if(OBJPointingArrow == none)
        {
            return;
        }
    }
    // End:0xb5
    if(MSGRI.GameObject != none && MSGRI.GameObject.HolderPRI != PawnOwner.PlayerReplicationInfo)
    {
        TrackedActor = MSGRI.GameObject;
        OBJPointingArrow.SetYellowColor(AttackerProgressUpdateTime > float(0));
    }
    // End:0x124
    else
    {
        // End:0x124
        if(CurrentObjective != none)
        {
            TrackedActor = CurrentObjective;
            // End:0xfd
            if(ObjectiveBoard != none && ObjectiveBoard.AnyPrimaryObjectivesCritical())
            {
                OBJPointingArrow.SetYellowColor(true);
            }
            // End:0x124
            else
            {
                OBJPointingArrow.SetTeamSkin(CurrentObjective.DefenderTeamIndex, AttackerProgressUpdateTime > float(0));
            }
        }
    }
    // End:0x14d
    if(TrackedActor != none)
    {
        OBJPointingArrow.Render(C, PlayerOwner, TrackedActor);
    }
}

simulated function Release_ObjectivePointingArrow()
{
    // End:0x17
    if(OBJPointingArrow != none)
    {
        OBJPointingArrow.Destroy();
    }
}

simulated function DrawHealthBar(Canvas C, Vector HBScreenPos, float Health, float MaxHealth, Color ObjColor)
{
    local float HealthPct;

    C.DrawColor = ObjColor;
    C.Style = 5;
    HealthBarWidth = default.HealthBarWidth * ResScaleX * HudScale;
    HealthBarHeight = default.HealthBarHeight * ResScaleY * HudScale;
    C.SetPos(HBScreenPos.X - HealthBarWidth * 0.50, HBScreenPos.Y - HealthBarHeight * 0.50);
    C.DrawTileStretched(HealthBarBackMat, HealthBarWidth, HealthBarHeight);
    HealthPct = Health / MaxHealth;
    C.DrawColor = GetGYRColorRamp(HealthPct);
    C.DrawColor.A = 200;
    C.SetPos(HBScreenPos.X - HealthBarWidth * 0.490, HBScreenPos.Y - HealthBarHeight * 0.30);
    C.DrawTileStretched(HealthBarMat, HealthBarWidth * HealthPct * 0.980, HealthBarHeight * 0.60);
}

final simulated function bool IsObjectiveVisible(Canvas C, GameObjective Target, out Vector ScreenPos, Vector camLoc, Rotator camRot)
{
    local Vector TargetLocation, TargetDir;
    local float dist;

    // End:0x50
    if(!Target.bOverrideZoneCheck && PawnOwner != none && PawnOwner.Region.Zone != Target.Region.Zone)
    {
        return false;
    }
    dist = VSize(Target.Location - camLoc);
    // End:0x9f
    if(Target.DrawDistThresHold > float(0) && dist > Target.DrawDistThresHold)
    {
        return false;
    }
    // End:0xc5
    if(!IsTargetInFrontOfPlayer(C, Target, ScreenPos, camLoc, camRot))
    {
        return false;
    }
    // End:0x14e
    if(!Target.bOverrideVisibilityCheck)
    {
        TargetDir = Target.Location - camLoc;
        TargetDir.Z = 0.0;
        TargetLocation = Target.Location - 2.0 * Target.CollisionRadius * vector(rotator(TargetDir));
        // End:0x14e
        if(!FastTrace(TargetLocation, camLoc))
        {
            return false;
        }
    }
    return true;
}

event AnnouncementPlayed(string AnnouncerSound, byte Switch)
{
    local int i;

    // End:0x18
    if(Switch == 200)
    {
        HighlightCurrentObjective(true);
    }
    // End:0x16f
    else
    {
        // End:0x30
        if(Switch == 201)
        {
            HighlightCurrentObjective(false);
        }
        // End:0x16f
        else
        {
            // End:0x16f
            if(Switch == 210)
            {
                i = 0;
                J0x45:
                // End:0x16f [While If]
                if(i < MTrigger.Length)
                {
                    // End:0x165
                    if(MTrigger[i].AnnouncerSound != none && string(MTrigger[i].AnnouncerSound.Name) == AnnouncerSound)
                    {
                        // End:0xeb
                        if(MTrigger[i].Message != "")
                        {
                            PlayerOwner.TeamMessage(PlayerOwner.PlayerReplicationInfo, MTrigger[i].Message, 'CriticalEvent');
                        }
                        // End:0x162
                        if(CurrentObjective != none)
                        {
                            // End:0x12c
                            if(CurrentObjective.Announcer_ObjectiveInfo != "" && CurrentObjective.Announcer_ObjectiveInfo == AnnouncerSound)
                            {
                                HighlightCurrentObjective(true);
                            }
                            // End:0x162
                            if(CurrentObjective.Announcer_DefendObjective != "" && CurrentObjective.Announcer_DefendObjective == AnnouncerSound)
                            {
                                HighlightCurrentObjective(true);
                            }
                        }
                    }
                    // End:0x16f
                    else
                    {
                        ++ i;
                        // This is an implied JumpToken; Continue!
                        goto J0x45;
                    }
                }
            }
        }
    }
}

simulated function HighlightCurrentObjective(bool bShowWayPoint)
{
    AttackerProgressUpdateTime = ObjectiveProgressPulseTime;
    // End:0x54
    if(bShowWillowWhisp && bShowWayPoint && PlayerOwner != none && UnrealPlayer(PlayerOwner) != none)
    {
        UnrealPlayer(PlayerOwner).ServerShowPathToBase(255);
    }
}

simulated function NotifyUpdatedObjective()
{
    local GameObjective OldObjective;

    OldObjective = CurrentObjective;
    CurrentObjective = none;
    CurrentObjective = GetCurrentObjective();
    // End:0x41
    if(OldObjective != CurrentObjective && CurrentObjective != none)
    {
        HighlightCurrentObjective(false);
    }
}

simulated function GameObjective GetCurrentObjective()
{
    local GameObjective Go;
    local int i;

    // End:0xb1
    if(CurrentObjective == none && MSGRI != none)
    {
        i = 0;
        J0x1f:
        // End:0xb1 [While If]
        if(i < obj.Length)
        {
            Go = obj[i];
            // End:0xa7
            if(MSGRI.ObjectiveProgress == Go.ObjectivePriority && Go.IsActive() && !Go.bOptionalObjective || CurrentObjective == none)
            {
                CurrentObjective = Go;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1f;
        }
    }
    return CurrentObjective;
}

simulated function bool CanSpawnNotify()
{
    // End:0x52
    if(bForceSpawnNotification || bObjectiveReminder && Level.TimeSeconds > NextSpawnNotification)
    {
        NextSpawnNotification = Level.TimeSeconds + float(30);
        bForceSpawnNotification = false;
        return true;
    }
    return false;
}

simulated function DrawInfoPods(Canvas C)
{
    local wInfoPod IP;
    local Vector IPScreenPos, camLoc;
    local int i;
    local Rotator camRot;

    // End:0x27
    if(MSGRI == none || PawnOwner == none || PlayerOwner == none)
    {
        return;
    }
    C.GetCameraLocation(camLoc, camRot);
    i = 0;
    J0x47:
    // End:0x339 [While If]
    if(i < InfoPods.Length)
    {
        IP = InfoPods[i];
        // End:0x8a
        if(IP == none || IP.bDisabled)
        {
        }
        // End:0x32f
        else
        {
            // End:0x127
            if(IP.Team != 0)
            {
                // End:0xe4
                if(IP.Team == 1 && MSGRI.IsDefender(byte(PawnOwner.GetTeamNum())))
                {
                }
                // End:0x32f
                else
                {
                    // End:0x127
                    if(IP.Team == 2 && !MSGRI.IsDefender(byte(PawnOwner.GetTeamNum())))
                    {
                    }
                    // End:0x32f
                    else
                    {
                    }
                    // End:0x152
                    if(!IP.IsInfoPodVisible(C, PawnOwner, camLoc, camRot))
                    {
                    }
                    // End:0x32f
                    else
                    {
                        IPScreenPos = C.WorldToScreen(IP.Location);
                        // End:0x1a9
                        if(IPScreenPos.X <= float(0) || IPScreenPos.X >= C.ClipX)
                        {
                        }
                        // End:0x32f
                        else
                        {
                            // End:0x1dd
                            if(IPScreenPos.Y <= float(0) || IPScreenPos.Y >= C.ClipY)
                            {
                            }
                            // End:0x32f
                            else
                            {
                                // End:0x20d
                                if(IP.Team == 0)
                                {
                                    C.DrawColor = WhiteColor;
                                }
                                // End:0x233
                                else
                                {
                                    C.DrawColor = GetTeamColor(byte(PawnOwner.GetTeamNum()));
                                }
                                switch(IP.InfoEffect)
                                {
                                    // End:0x297
                                    case 1:
                                        C.DrawColor.A = byte(float(IP.DrawOpacity) * 0.50 + float(IP.DrawOpacity * 2) * fBlink);
                                        // End:0x311
                                        break;
                                    // End:0x2ec
                                    case 2:
                                        C.DrawColor.A = byte(float(IP.DrawOpacity) * 0.50 + float(IP.DrawOpacity) * 0.50 * fPulse);
                                        // End:0x311
                                        break;
                                    // End:0xffff
                                    default:
                                        C.DrawColor.A = IP.DrawOpacity;
                                        IP.Render(C, IPScreenPos, PlayerOwner);
                                    }
                                }
                            }
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x47;
            }
}

static function DrawCustomHealthInfo(Canvas C, PlayerController PC, bool bSkaarj);
function bool CustomHUDColorAllowed()
{
    return false;
}

static function Color GetTeamColor(byte Team)
{
    // End:0x16
    if(Team == 0)
    {
        return default.HudColorRed;
    }
    // End:0x32
    else
    {
        // End:0x2c
        if(Team == 1)
        {
            return default.HudColorBlue;
        }
        // End:0x32
        else
        {
            return default.GreenColor;
        }
    }
}

simulated function Color GetObjectiveColor(GameObjective Go, optional out byte bProgressPulsing)
{
    local Color ObjColor;

    ObjColor = GetTeamColor(Go.DefenderTeamIndex);
    // End:0x57
    if(Go.IsCritical())
    {
        ObjColor = ObjColor * float(1) - fPulse + GoldColor * fPulse;
    }
    // End:0xa8
    else
    {
        // End:0xa8
        if(!Go.bOptionalObjective)
        {
            // End:0xa8
            if(AttackerProgressUpdateTime > float(0))
            {
                ObjColor = ObjColor * float(1) - fPulse + WhiteColor * fPulse;
                bProgressPulsing = 1;
            }
        }
    }
    return ObjColor;
}

static function Color GetGYRColorRamp(float Pct)
{
    local Color GYRColor;

    GYRColor.A = byte(255);
    // End:0x6c
    if(Pct < 0.340)
    {
        GYRColor.R = byte(float(128) + float(127) * FClamp(3.0 * Pct, 0.0, 1.0));
        GYRColor.G = 0;
        GYRColor.B = 0;
    }
    // End:0x11a
    else
    {
        // End:0xcc
        if(Pct < 0.670)
        {
            GYRColor.R = byte(255);
            GYRColor.G = byte(float(255) * FClamp(3.0 * Pct - 0.330, 0.0, 1.0));
            GYRColor.B = 0;
        }
        // End:0x11a
        else
        {
            GYRColor.R = byte(float(255) * FClamp(3.0 * 1.0 - Pct, 0.0, 1.0));
            GYRColor.G = byte(255);
            GYRColor.B = 0;
        }
    }
    return GYRColor;
}

static function Draw_2DCollisionBox(Canvas C, Actor A, Vector ScrPos, string Description, float ColExpand, bool bSizeOverride);
static function Vector GetScreenCorner(Canvas C, Actor A, Vector CornerVect, Vector IPScrO, Rotator CameraRotation, float ColExpand)
{
    local Vector IPDir, IPCorner, IPScreenCorner;

    IPDir = float(-1) * vector(CameraRotation);
    IPDir.Z = 0.0;
    IPCorner = CornerVect >> Normalize(rotator(IPDir));
    IPCorner.X *= A.CollisionRadius * ColExpand;
    IPCorner.Y *= A.CollisionRadius * ColExpand;
    IPCorner.Z *= A.CollisionHeight * ColExpand;
    IPScreenCorner = C.WorldToScreen(A.Location + IPCorner);
    IPScreenCorner.X = Abs(IPScreenCorner.X - IPScrO.X);
    IPScreenCorner.Y = Abs(IPScreenCorner.Y - IPScrO.Y);
    return IPScreenCorner;
}

simulated function DrawTextWithBackground(Canvas C, string Text, Color TextColor, float XO, float YO)
{
    local float XL, YL, XL2, YL2;

    C.StrLen(Text, XL, YL);
    XL2 = XL + float(64) * ResScaleX;
    YL2 = YL + float(8) * ResScaleY;
    C.DrawColor = TextColor;
    C.SetPos(XO - XL * 0.50, YO - YL * 0.50);
    C.DrawText(Text, false);
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    Global_Delta = DeltaTime;
    fBlink += DeltaTime;
    J0x22:
    // End:0x40 [While If]
    if(fBlink > 0.50)
    {
        fBlink -= 0.50;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
    fPulse = Abs(1.0 - float(4) * fBlink);
    // End:0x94
    if(MSGRI == none && PlayerOwner.GameReplicationInfo != none)
    {
        MSGRI = wMSGameReplicationInfo(PlayerOwner.GameReplicationInfo);
    }
    // End:0xce
    if(PawnOwner != none && PawnOwner.PlayerReplicationInfo != none)
    {
        MSPRI = wMSPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    }
    AttackerProgressUpdateTime = FMax(AttackerProgressUpdateTime - Global_Delta, 0.0);
    // End:0x160
    if(MSGRI != none)
    {
        ObjectiveProgress = MSGRI.ObjectiveProgress;
        // End:0x160
        if(OldObjectiveProgress != ObjectiveProgress || CurrentObjective == none || !CurrentObjective.IsActive())
        {
            NotifyUpdatedObjective();
            // End:0x160
            if(OldObjectiveProgress != ObjectiveProgress)
            {
                OldObjectiveProgress = ObjectiveProgress;
            }
        }
    }
    // End:0x198
    if(PrevTeam != PlayerOwner.GetTeamNum())
    {
        TeamChanged();
        PrevTeam = byte(PlayerOwner.GetTeamNum());
    }
}

simulated event TeamChanged()
{
    bForceSpawnNotification = true;
}

simulated function DrawPracticeRoundInfo(Canvas C)
{
    local Color myColor;
    local float Seconds;

    // End:0x3d
    if(PlayerOwner == none || MSGRI == none || ScoreBoard == none || MSGRI.RoundTimeLimit == 0)
    {
        return;
    }
    C.Font = GetFontSizeIndex(C, 0);
    C.Style = 5;
    myColor = GoldColor * 1.0 - fPulse + WhiteColor * fPulse;
    Seconds = float(Max(0, MSGRI.RoundTimeLimit - MSGRI.RoundStartTime + MSGRI.RemainingTime));
    // End:0xfb
    if(MSGRI.RoundWinner != 0)
    {
        Seconds = float(MSGRI.RoundOverTime);
    }
    DrawTextWithBackground(C, PracticeRoundString @ ScoreBoard.FormatTime(int(Seconds)), myColor, C.ClipX * 0.50, C.ClipY * 0.670);
}

function CheckCountdown(GameReplicationInfo GRI)
{
    local int RemainingRoundTime;

    // End:0x18
    if(MSGRI == none)
    {
        super(HudCDeathmatch).CheckCountdown(GRI);
        return;
    }
    // End:0x33
    if(MSGRI.RoundWinner != 0)
    {
        return;
    }
    RemainingRoundTime = MSGRI.RoundTimeLimit - MSGRI.RoundStartTime + MSGRI.RemainingTime;
    // End:0x86
    if(MSGRI.RoundTimeLimit == 0)
    {
        super(HudCDeathmatch).CheckCountdown(MSGRI);
    }
    // End:0xbf
    if(RemainingRoundTime < 1 || RemainingRoundTime == OldRemainingRoundTime || MSGRI.RoundWinner != 0)
    {
        return;
    }
    OldRemainingRoundTime = RemainingRoundTime;
    // End:0xdb
    if(OldRemainingRoundTime > 300)
    {
        return;
    }
    // End:0x13a
    if(OldRemainingRoundTime > 30)
    {
        // End:0x111
        if(OldRemainingRoundTime == 120)
        {
            PlayerOwner.QueueAnnouncement(string(LongCountName[2]), 1);
        }
        // End:0x138
        else
        {
            // End:0x138
            if(OldRemainingRoundTime == 60)
            {
                PlayerOwner.QueueAnnouncement(string(LongCountName[3]), 1);
            }
        }
        return;
    }
    // End:0x164
    if(OldRemainingRoundTime == 30)
    {
        PlayerOwner.QueueAnnouncement(string(LongCountName[4]), 1);
    }
    // End:0x1ce
    else
    {
        // End:0x190
        if(OldRemainingRoundTime == 20)
        {
            PlayerOwner.QueueAnnouncement(string(LongCountName[5]), 1, 2);
        }
        // End:0x1ce
        else
        {
            // End:0x1ce
            if(OldRemainingRoundTime <= 10 && OldRemainingRoundTime > 0)
            {
                PlayerOwner.QueueAnnouncement(string(CountDownName[OldRemainingRoundTime - 1]), 1, 3, 1);
            }
        }
    }
}

simulated function string GetInfoString()
{
    local string InfoString;

    // End:0x11
    if(MSGRI == none)
    {
        return NoGameReplicationInfoString;
    }
    // End:0x3a
    if(MSGRI.RoundWinner != 0)
    {
        return MSGRI.GetRoundWinnerString();
    }
    // End:0x6b
    if(GUIController(PlayerOwner.Player.GUIController).ActivePage != none)
    {
        return AtMenus;
    }
    // End:0xc1
    if(MSPRI != none && MSPRI.bAutoRespawn)
    {
        InfoString = class'wScoreBoard_Mission'.default.AutoRespawn;
        InfoString = InfoString @ string(MSGRI.ReinforcementCountDown);
        return InfoString;
    }
    // End:0x14a
    if(MSGRI.ReinforcementCountDown > 0 && !PlayerOwner.IsInState('PlayerWaiting'))
    {
        // End:0x116
        if(PlayerOwner.IsDead())
        {
            InfoString = class'wScoreBoard_Mission'.default.WaitForReinforcements;
        }
        // End:0x12a
        else
        {
            InfoString = class'wScoreBoard_Mission'.default.WaitingToSpawnReinforcements;
        }
        InfoString = InfoString @ string(MSGRI.ReinforcementCountDown);
    }
    // End:0x156
    else
    {
        InfoString = super(HudCDeathmatch).GetInfoString();
    }
    return InfoString;
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
}

simulated function UpdatePrecacheMaterials()
{
    super(HudCDeathmatch).UpdatePrecacheMaterials();
}

simulated function DrawCinematicHUD(Canvas C)
{
    IntroTitleFade += Global_Delta;
    // End:0x25
    if(IntroTitleFade < float(10))
    {
        DrawIntroTitle(C);
    }
    super(HudBase).DrawCinematicHUD(C);
}

simulated function DrawIntroTitle(Canvas C)
{
    local int FontIndex;
    local string LevelTitle;
    local float XL, YL;

    C.DrawColor = WhiteColor;
    C.Style = 5;
    FontIndex = 8;
    LevelTitle = Level.Title;
    C.Font = GetFontSizeIndex(C, -- FontIndex);
    C.TextSize(LevelTitle, XL, YL);
    // End:0x41
    if(XL < C.ClipX * 0.670 && YL < C.ClipY * 0.670)
    	goto J0x41;
    // End:0xe3
    if(IntroTitleFade < float(1))
    {
        C.DrawColor.A = 0;
    }
    // End:0x17e
    else
    {
        // End:0x121
        if(IntroTitleFade < float(3))
        {
            C.DrawColor.A = byte(float(255) * IntroTitleFade - float(1) * 0.50);
        }
        // End:0x17e
        else
        {
            // End:0x166
            if(IntroTitleFade > float(6))
            {
                C.DrawColor.A = byte(float(255) * 1.0 - IntroTitleFade - float(6) / float(4));
            }
            // End:0x17e
            else
            {
                C.DrawColor.A = byte(255);
            }
        }
    }
    C.SetPos(C.ClipX - XL * 0.50, C.ClipY - YL * 0.50);
    C.DrawText(LevelTitle, false);
}

function DrawMissionIcon(Canvas C, wPawn curPawn)
{
    // End:0x0d
    if(!bShowMissionIcon)
    {
        return;
    }
    // End:0xe9
    if(curPawn.PlayerReplicationInfo.HasFlag != none && curPawn.PlayerReplicationInfo.HasFlag.IsA('wGameObject_Bomb') && curPawn.GetTeamNum() == PawnOwner.GetTeamNum())
    {
        IconDefendBombHolder.PosX = curPawn.NametagScreenPos.X / C.ClipX;
        IconDefendBombHolder.PosY = curPawn.NametagScreenPos.Y - float(7) / C.ClipY;
        DrawSpriteWidget(C, IconDefendBombHolder);
    }
}

defaultproperties
{
    ObjectiveScale=1.0
    bOnHUDObjectiveNotification=true
    bShowInfoPods=true
    bObjectiveReminder=true
    bShowWillowWhisp=true
    bShowMissionIcon=true
    OBJ_ReAppearTime=7.0
    OBJ_FadedOutTime=6.0
    ASRadarScale=0.20
    ASRadarPosX=0.90
    ASRadarPosY=0.20
    HealthBarWidth=80.0
    HealthBarHeight=8.0
    IP_Bracket_Open="["
    IP_Bracket_Close="]"
    Cardinal_North="N"
    Cardinal_East="E"
    Cardinal_South="S"
    Cardinal_West="W"
    NoGameReplicationInfoString="Receiving Server State..."
    MetersString="m"
    TargetString="Target:"
    NoTargetString="No Target"
    PracticeRoundString="Practice Round"
    ObjectiveProgressPulseTime=7.0
    ObjectiveProgress=255
    OldObjectiveProgress=255
    RoundTimeMinutes=(RenderStyle=5,MinDigitCount=2,TextureScale=0.540,DrawPivot=7,PosX=0.0,PosY=0.0,OffsetX=20,OffsetY=27,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    RoundTimeSeconds=(RenderStyle=5,MinDigitCount=2,TextureScale=0.540,DrawPivot=7,PosX=0.0,PosY=0.0,OffsetX=110,OffsetY=27,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=1)
    ReinforceSprNum=(RenderStyle=5,MinDigitCount=2,TextureScale=0.540,DrawPivot=7,PosX=0.0,PosY=0.060,OffsetX=60,OffsetY=27,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=1)
    TeleportSprNum=(RenderStyle=5,MinDigitCount=2,TextureScale=0.540,DrawPivot=7,PosX=0.0,PosY=0.180,OffsetX=60,OffsetY=27,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=1)
    fViewDelayTime=3.0
    MinimapEnemyFlags=// Object reference not set to an instance of an object.
    
    MinimapNoncapturedFlag=// Object reference not set to an instance of an object.
    
    MinimapAllyFlag=// Object reference not set to an instance of an object.
    
    LastSpectatingTime=-1.0
    BeginSpectatingTime=-1.0
    bDrawRoundResult=true
    HudColorHighLight=(R=255,G=192,B=32,A=255)
}