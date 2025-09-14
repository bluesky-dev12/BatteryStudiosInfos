/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\HUD_Assault.uc
 * Package Imports:
 *	UT2k4Assault
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:77
 *	Functions:65
 *
 *******************************************************************************/
class HUD_Assault extends HudCTeamDeathMatch
    dependson(PlayerSpawnManager)
    dependson(ASPlayerReplicationInfo)
    dependson(ScoreBoard_Assault)
    dependson(InfoPod)
    dependson(Trigger_ASMessageTrigger)
    dependson(ObjectivePointingArrow)
    dependson(ASVehicle_SpaceFighter)
    dependson(ASGameInfo)
    dependson(ObjectiveProgressDisplay)
    dependson(ASVehicle)
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
var bool bForceSpawnNotification;
var bool bShowObjectiveBoard;
var bool bForceObjectiveBoard;
var array<GameObjective> obj;
var array<InfoPod> InfoPods;
var array<Trigger_ASMessageTrigger> MTrigger;
var array<TexRotator> BehindObjectiveArrows;
var ObjectivePointingArrow OBJPointingArrow;
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
var ASGameReplicationInfo ASGRI;
var ASPlayerReplicationInfo ASPRI;
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
var() ObjectiveProgressDisplay ObjectiveBoard;
var float IntroTitleFade;

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
    local GameObjective Go;
    local InfoPod IP;
    local Trigger_ASMessageTrigger mT;

    super(HudCDeathmatch).PostBeginPlay();
    // End:0x3f
    foreach AllActors(class'GameObjective', Go)
    {
        // End:0x2c
        if(Go.bBotOnlyObjective)
        {
            continue;
        }
        // End:0x3f
        else
        {
            obj[obj.Length] = Go;
            continue;
        }        
    }
    // End:0x63
    foreach AllActors(class'InfoPod', IP)
    {
        InfoPods[InfoPods.Length] = IP;                
    }
    // End:0x87
    foreach AllActors(class'Trigger_ASMessageTrigger', mT)
    {
        MTrigger[MTrigger.Length] = mT;                
    }
    ObjectiveBoard = Spawn(class'ObjectiveProgressDisplay', Owner);
    ObjectiveBoard.Initialize(self);
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
    local bool bOldShowWeaponInfo, bOldShowPersonalInfo;
    local class<wAmmunition> AmmoClass;

    bOldShowWeaponInfo = bShowWeaponInfo;
    // End:0x72
    if(PawnOwner != none && PawnOwner.Weapon != none)
    {
        AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
        // End:0x72
        if(AmmoClass == none || ClassIsChildOf(AmmoClass, class'Ammo_Dummy'))
        {
            bShowWeaponInfo = false;
        }
    }
    bOldShowPersonalInfo = bShowPersonalInfo;
    // End:0xb0
    if(ASVehicle(PawnOwner) != none && ASVehicle(PawnOwner).bCustomHealthDisplay)
    {
        bShowPersonalInfo = false;
    }
    super.DrawHudPassA(C);
    bShowWeaponInfo = bOldShowWeaponInfo;
    bShowPersonalInfo = bOldShowPersonalInfo;
    // End:0x114
    if(bDrawRadar && Vehicle(PawnOwner) != none && Vehicle(PawnOwner).bHasRadar)
    {
        DrawRadarPassA(C);
    }
}

simulated function DrawHudPassB(Canvas C)
{
    super(HudBase).DrawHudPassB(C);
    // End:0x4a
    if(bDrawRadar && Vehicle(PawnOwner) != none && Vehicle(PawnOwner).bHasRadar)
    {
        DrawRadarPassB(C);
    }
}

simulated function DrawHudPassC(Canvas C)
{
    local bool bOldShowWeaponInfo, bOldShowPersonalInfo;
    local class<wAmmunition> AmmoClass;

    DrawAssaultHUDLayer(C);
    bOldShowWeaponInfo = bShowWeaponInfo;
    // End:0x7d
    if(PawnOwner != none && PawnOwner.Weapon != none)
    {
        AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
        // End:0x7d
        if(AmmoClass == none || ClassIsChildOf(AmmoClass, class'Ammo_Dummy'))
        {
            bShowWeaponInfo = false;
        }
    }
    bOldShowPersonalInfo = bShowPersonalInfo;
    // End:0xcc
    if(PawnOwner != none && PawnOwner.IsA('ASVehicle') && ASVehicle(PawnOwner).bCustomHealthDisplay)
    {
        bShowPersonalInfo = false;
    }
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
    UpdateActorTracking(C);
    // End:0x5d
    if(ASGRI != none && ASGRI.IsPracticeRound())
    {
        DrawPracticeRoundInfo(C);
    }
    // End:0xd0
    if(PawnOwner != none && ObjectiveBoard != none && ASGRI != none)
    {
        ObjectiveBoard.ShowStatus(ShouldShowObjectiveBoard());
        ObjectiveBoard.PostRender(C, Global_Delta, ASGRI.IsDefender(byte(PawnOwner.GetTeamNum())));
    }
}

simulated function bool ShouldShowObjectiveBoard()
{
    // End:0x1a
    if(ObjectiveBoard == none || ASGRI == none)
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
    if(ASGRI == none)
    {
        return;
    }
    // End:0x16d
    if(ASGRI.RoundTimeLimit > 0)
    {
        RoundTime = Max(0, ASGRI.RoundTimeLimit - ASGRI.RoundStartTime + ASGRI.RemainingTime);
        // End:0x8b
        if(ASGRI.RoundWinner != 0)
        {
            RoundTime = ASGRI.RoundOverTime;
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
    ReinforceSprNum.Value = Min(ASGRI.ReinforcementCountDown, 999);
    // End:0x203
    if(ASPRI != none)
    {
        TeleportCount = Min(ASGRI.RoundTimeLimit - ASGRI.RoundStartTime + ASGRI.RemainingTime + ASGRI.MaxTeleportTime - ASPRI.TeleportTime, 999);
        TeleportSprNum.Value = TeleportCount;
    }
}

simulated function ShowTeamScorePassA(Canvas C)
{
    local float PosY;

    // End:0x0d
    if(ASGRI == none)
    {
        return;
    }
    // End:0xa2
    if(ASGRI.RoundTimeLimit > 0)
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
    if(Level.Game == none || !ASGameInfo(Level.Game).bDisableReinforcements)
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
        if(ASGRI.ReinforcementCountDown < 1)
        {
            DrawSpriteWidget(C, ReinforcePulse);
        }
        DrawSpriteWidget(C, ReinforceIcon);
    }
    // End:0x2c2
    if(ASGRI != none && float(ASGRI.CurrentRound) % float(2) == float(0) && !ASGRI.IsPracticeRound() && IsVSRelevant())
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
    if(ASPRI != none && ASPRI.bTeleportToSpawnArea && TeleportSprNum.Value >= 0)
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
    if(ASGRI.RoundTimeLimit > 0)
    {
    }
    // End:0x445
    if(ASGRI != none && float(ASGRI.CurrentRound) % float(2) == float(0) && !ASGRI.IsPracticeRound() && IsVSRelevant())
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
        RelativeTime = CurrentObjective.ObjectiveDisabledTime - ASGRI.RoundStartTime - ASGRI.RemainingTime;
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
    if(ASGRI.IsDefender(byte(PlayerTeam)))
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
    if(ASGRI.RoundWinner != 0 || CurrentObjective == none || CurrentObjective.ObjectiveDisabledTime == 0 && CurrentObjective.SavedObjectiveProgress == float(0) || CurrentObjective.SavedObjectiveProgress == float(1) || CurrentObjective.SavedObjectiveProgress - CurrentObjective.GetObjectiveProgress() > float(0))
    {
        return false;
    }
    return true;
}

simulated function ShowTeamScorePassC(Canvas C);
simulated function DrawSpectatingHud(Canvas C)
{
    super.DrawSpectatingHud(C);
    UpdateTeamHud();
    ShowTeamScorePassA(C);
    DrawAssaultHUDLayer(C);
}

function DrawRadarPassA(Canvas C)
{
    local float dist, RadarWidth, DotSize, OffsetY, XL, YL,
	    OffsetScale;

    local Vector Start, dotPos, ViewX, ViewY, Z;

    // End:0x0d
    if(PawnOwner == none)
    {
        return;
    }
    ASRadarScale = default.ASRadarScale * HudScale;
    RadarWidth = 0.50 * ASRadarScale * C.ClipX;
    C.Style = 5;
    Start = PawnOwner.Location;
    OffsetY = ASRadarPosY + RadarWidth / C.ClipY;
    C.DrawColor = WhiteColor;
    OffsetScale = ASRadarScale * 0.0000840;
    GetAxes(PawnOwner.GetViewRotation(), ViewX, ViewY, Z);
    // End:0x390
    if(bDrawRadarCardinalPoints)
    {
        dist = 5500.0;
        C.Font = GetConsoleFont(C);
        C.StrLen(Cardinal_North, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(0.0, -100.0, 0.0), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - 0.50 * XL, dotPos.Y - 0.50 * YL);
        C.DrawText(Cardinal_North, false);
        C.StrLen(Cardinal_East, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(100.0, 0.0, 0.0), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - 0.50 * XL, dotPos.Y - 0.50 * YL);
        C.DrawText(Cardinal_East, false);
        C.StrLen(Cardinal_South, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(0.0, 100.0, 0.0), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - 0.50 * XL, dotPos.Y - 0.50 * YL);
        C.DrawText(Cardinal_South, false);
        C.StrLen(Cardinal_West, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(-100.0, 0.0, 0.0), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - 0.50 * XL, dotPos.Y - 0.50 * YL);
        C.DrawText(Cardinal_West, false);
    }
    C.DrawColor = WhiteColor;
    DotSize = 12.0 * C.ClipX * HudScale / float(1600);
    dotPos = GetRadarDotPosition(C, PawnOwner.Location - Start, ViewX, ViewY, 0.0, OffsetY);
    C.SetPos(dotPos.X - 0.50 * DotSize, dotPos.Y - 0.50 * DotSize);
}

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
    // End:0x2d8
    if(Level.TimeSeconds > LastRadarUpdate + float(1))
    {
        LastRadarUpdate = Level.TimeSeconds;
        RadarVehicleCache.Length = 0;
        // End:0x2d4
        foreach DynamicActors(class'Vehicle', P)
        {
            // End:0x2d3
            if(P != PawnOwner && P.GetTeamNum() != PawnOwner.GetTeamNum() && P != TrackedVehicle && P.Health > 0 && !P.bDeleteMe && P.IndependentVehicle())
            {
                RadarVehicleCache[RadarVehicleCache.Length] = P;
                dist = GetRadarDotDist(P.Location - Start, ViewX, ViewY);
                // End:0x2d3
                if(dist < MaxSmartRange)
                {
                    dist = ApplySmartRangeDist(dist * 0.50);
                    // End:0x2ad
                    if(PawnOwner.IsA('ASVehicle_SpaceFighter') && ASVehicle_SpaceFighter(PawnOwner).CurrentTarget == P)
                    {
                        C.DrawColor = GetTeamColor(byte(P.GetTeamNum())) * 1.0 - fPulse + C.MakeColor(64, 200, 64) * fPulse;
                    }
                    // End:0x2d3
                    else
                    {
                        C.DrawColor = GetTeamColor(byte(P.GetTeamNum()));
                    }
                }
            }                        
        }
    }
    // End:0x49f
    else
    {
        i = 0;
        J0x2df:
        // End:0x49f [While If]
        if(i < RadarVehicleCache.Length)
        {
            P = RadarVehicleCache[i];
            // End:0x495
            if(P != none && P != PawnOwner && P.GetTeamNum() != PawnOwner.GetTeamNum() && P != TrackedVehicle && P.Health > 0 && !P.bDeleteMe && P.IndependentVehicle())
            {
                dist = GetRadarDotDist(P.Location - Start, ViewX, ViewY);
                // End:0x495
                if(dist < MaxSmartRange)
                {
                    dist = ApplySmartRangeDist(dist * 0.50);
                    // End:0x46f
                    if(PawnOwner.IsA('ASVehicle_SpaceFighter') && ASVehicle_SpaceFighter(PawnOwner).CurrentTarget == P)
                    {
                        C.DrawColor = GetTeamColor(byte(P.GetTeamNum())) * 1.0 - fPulse + C.MakeColor(64, 200, 64) * fPulse;
                    }
                    // End:0x495
                    else
                    {
                        C.DrawColor = GetTeamColor(byte(P.GetTeamNum()));
                    }
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2df;
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

simulated function UpdateActorTracking(Canvas C)
{
    local Vehicle V;
    local Vector ScreenPos;

    // End:0x70
    if(TrackedVehicle == none && NextTrackedVehicleSearch < Level.TimeSeconds)
    {
        NextTrackedVehicleSearch = Level.TimeSeconds + float(1);
        // End:0x6f
        foreach DynamicActors(class'Vehicle', V)
        {
            // End:0x6e
            if(V.bHUDTrackVehicle)
            {
                TrackedVehicle = V;
            }
            // End:0x6f
            else
            {
                continue;
            }            
        }
    }
    // End:0x133
    if(TrackedVehicle != none && TrackedVehicle != PawnOwner && TrackedVehicle.Health > 0 && !TrackedVehicle.bDeleteMe)
    {
        C.DrawColor = GetTeamColor(TrackedVehicle.Team);
        C.DrawColor.A = 128;
        // End:0x133
        if(DrawActorTracking(C, TrackedVehicle, false, ScreenPos))
        {
            DrawTrackedVehicleIcon(C, TrackedVehicle, ScreenPos.X, ScreenPos.Y, 1.0);
        }
    }
    // End:0x1fd
    if(ASGRI != none && ASGRI.GameObject != none && PawnOwner != none && ASGRI.GameObject.HolderPRI != PawnOwner.PlayerReplicationInfo)
    {
        C.DrawColor = GoldColor;
        C.DrawColor.A = 128;
        // End:0x1fd
        if(DrawActorTracking(C, ASGRI.GameObject, false, ScreenPos))
        {
            DrawTrackedGameObjectIcon(C, ScreenPos.X, ScreenPos.Y, 1.0);
        }
    }
}

simulated function DrawTrackedVehicleIcon(Canvas C, Vehicle TrackedVehicle, float X, float Y, float Scale)
{
    local float SizeScale, SizeX, SizeY, ratio;

    // End:0x1b
    if(TrackedVehicle.VehicleIcon.Material == none)
    {
        return;
    }
    SizeScale = ObjectiveScale * HudScale * Scale;
    ratio = TrackedVehicle.VehicleIcon.SizeX / TrackedVehicle.VehicleIcon.SizeY;
    SizeX = 32.0 * SizeScale * ResScaleX;
    SizeY = 32.0 / ratio * SizeScale * ResScaleY;
    // End:0xe2
    if(TrackedVehicle.VehicleIcon.bIsGreyScale)
    {
        C.DrawColor = GetTeamColor(byte(1 - TrackedVehicle.Team));
    }
    // End:0xf6
    else
    {
        C.DrawColor = WhiteColor;
    }
    C.DrawColor.A = byte(float(127) + float(128) * fPulse);
    C.Style = 5;
    C.SetPos(X - SizeX * 0.50, Y - SizeY * 0.50);
    C.DrawTile(TrackedVehicle.VehicleIcon.Material, SizeX, SizeY, TrackedVehicle.VehicleIcon.X, TrackedVehicle.VehicleIcon.Y, TrackedVehicle.VehicleIcon.SizeX, TrackedVehicle.VehicleIcon.SizeY);
}

simulated function DrawTrackedGameObjectIcon(Canvas C, float X, float Y, float Scale);
simulated function bool DrawActorTracking(Canvas C, Actor A, bool bOptionalIndicator, out Vector ScreenPos)
{
    local Vector camLoc;
    local Rotator camRot;
    local float ProgressPct;

    C.GetCameraLocation(camLoc, camRot);
    // End:0x5d
    if(A.IsA('Pawn'))
    {
        ProgressPct = float(Pawn(A).Health) / Pawn(A).HealthMax;
    }
    // End:0xfd
    if(!IsTargetInFrontOfPlayer(C, A, ScreenPos, camLoc, camRot))
    {
        // End:0xf8
        if(!A.IsA('GameObjective') || bDrawAllObjectives)
        {
            DrawActorTracking_Behind(C, A, bOptionalIndicator, camLoc, camRot, ScreenPos);
            // End:0xf6
            if(ProgressPct > float(0))
            {
                DrawObjectiveStatusOverlay(C, ProgressPct, false, ScreenPos, ObjectiveScale * 0.670);
            }
            return true;
        }
        return false;
    }
    // End:0x18e
    else
    {
        // End:0x18e
        if(VSize(A.Location - camLoc) > float(2048) || !FastTrace(A.Location, camLoc))
        {
            DrawActorTracking_Obstructed(C, A, bOptionalIndicator, camLoc, ScreenPos);
            // End:0x18c
            if(ProgressPct > float(0))
            {
                DrawObjectiveStatusOverlay(C, ProgressPct, false, ScreenPos, ObjectiveScale * 0.670);
            }
            return true;
        }
    }
    // End:0x1da
    if(ProgressPct > float(0))
    {
        ScreenPos.Y -= float(48) * ResScaleX;
        DrawHealthBar(C, ScreenPos, ProgressPct, 1.0, C.DrawColor);
    }
    return false;
}

simulated function DrawActorTracking_Obstructed(Canvas C, Actor A, bool bOptionalIndicator, Vector camLoc, out Vector ScreenPos)
{
    local string DistanceText;
    local float XL, YL, tileX, tileY, width, Height;

    local Vector IndicatorPos;

    C.Style = 5;
    DistanceText = IP_Bracket_Open $ string(int(VSize(A.Location - camLoc) * 0.018750)) $ MetersString $ IP_Bracket_Close;
    C.Font = GetConsoleFont(C);
    C.StrLen(DistanceText, XL, YL);
    XL = XL * 0.50;
    YL = YL * 0.50;
    tileX = 64.0 * 0.450 * ResScaleX * ObjectiveScale * HudScale;
    tileY = 64.0 * 0.450 * ResScaleY * ObjectiveScale * HudScale;
    width = FMax(tileX * 0.50, XL);
    Height = tileY * 0.50 + YL * float(2);
    ClipScreenCoords(C, ScreenPos.X, ScreenPos.Y, width, Height);
    IndicatorPos.X = ScreenPos.X;
    IndicatorPos.Y = ScreenPos.Y - Height + YL + tileY * 0.50;
    DrawObjectiveIcon(C, bOptionalIndicator, IndicatorPos.X - tileX * 0.50, IndicatorPos.Y - tileY * 0.50, tileX, tileY);
    C.SetPos(IndicatorPos.X - XL, IndicatorPos.Y + tileY * 0.50);
    C.DrawText(DistanceText, false);
    ScreenPos = IndicatorPos;
}

simulated function DrawActorTracking_Behind(Canvas C, Actor A, bool bOptionalIndicator, Vector camLoc, Rotator camRot, out Vector ScreenPos)
{
    local Vector Orientation;
    local float tileX, tileY;
    local TexRotator Arrow;

    C.Style = 5;
    Orientation = GetTargetOrientation(A, camLoc, camRot);
    Orientation = ExpandTargetOrientationToCanvas(C, Orientation);
    ScreenPos.X = C.ClipX * 0.50 + C.ClipX * Orientation.X * 0.50;
    ScreenPos.Y = C.ClipY * 0.50 - C.ClipY * Orientation.Y * 0.50;
    Arrow = Get_BehindObjectiveArrow();
    tileX = 128.0 * 0.450 * ResScaleX * ObjectiveScale * HudScale;
    tileY = 128.0 * 0.450 * ResScaleY * ObjectiveScale * HudScale;
    ClipScreenCoords(C, ScreenPos.X, ScreenPos.Y, tileX * 0.50, tileY * 0.50);
    Arrow.Rotation.Yaw = int(Atan(Orientation.Y, Orientation.X) * float(32768) / 3.1415930);
    C.SetPos(ScreenPos.X - tileX * 0.50, ScreenPos.Y - tileY * 0.50);
    C.DrawTile(Arrow, tileX, tileY, 0.0, 0.0, 128.0, 128.0);
    ++ BehindObjectiveCount;
}

simulated function DrawObjectives(Canvas C)
{
    local int i;
    local GameObjective Go;
    local Vector ScreenPos, camLoc;
    local Rotator camRot;

    BehindObjectiveCount = 0;
    i = 0;
    J0x0f:
    // End:0x23b [While If]
    if(i < obj.Length)
    {
        Go = obj[i];
        // End:0x231
        if(Go.IsActive() && Go.bUsePriorityOnHUD && CheckObjectivePriority(Go))
        {
            C.DrawColor = GetObjectiveColor(Go);
            C.Style = 5;
            C.GetCameraLocation(camLoc, camRot);
            // End:0xe9
            if(IsObjectiveVisible(C, Go, ScreenPos, camLoc, camRot))
            {
                DrawVisibleObjective(C, Go, ScreenPos, camRot);
            }
            // End:0x231
            else
            {
                // End:0x1a0
                if(IsTargetInFrontOfPlayer(C, Go, ScreenPos, camLoc, camRot))
                {
                    C.DrawColor.A = 128;
                    DrawActorTracking_Obstructed(C, Go, Go.bOptionalObjective, camLoc, ScreenPos);
                    DrawObjectiveStatusOverlay(C, Go.GetObjectiveProgress(), false, ScreenPos, ObjectiveScale * 0.670);
                    // End:0x19d
                    if(Go.IsCritical())
                    {
                        DrawCriticalObjectiveOverlay(C, ScreenPos, ObjectiveScale);
                    }
                }
                // End:0x231
                else
                {
                    // End:0x231
                    if(bDrawAllObjectives)
                    {
                        DrawActorTracking_Behind(C, Go, Go.bOptionalObjective, camLoc, camRot, ScreenPos);
                        DrawObjectiveStatusOverlay(C, Go.GetObjectiveProgress(), false, ScreenPos, ObjectiveScale * 0.670);
                        // End:0x231
                        if(Go.IsCritical())
                        {
                            DrawCriticalObjectiveOverlay(C, ScreenPos, ObjectiveScale * 0.60);
                        }
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
}

simulated function DrawVisibleObjective(Canvas C, GameObjective Go, Vector ScreenPos, Rotator camRot)
{
    local float tileX, tileY, AppearEffect;
    local string UseString;
    local Color ObjColor;
    local bool bFadeOut;
    local byte bProgressPulsing;
    local float FadeOutEffect, ProgressPct;

    ObjColor = GetObjectiveColor(Go, bProgressPulsing);
    bFadeOut = !Go.IsA('UseObjective');
    // End:0x98
    if(bFadeOut && Level.TimeSeconds - Go.LastDrawTime > Global_Delta * 6.0 || Go.DrawTime > OBJ_ReAppearTime)
    {
        Go.DrawTime = 0.0;
    }
    Go.DrawTime += Global_Delta;
    Go.LastDrawTime = Level.TimeSeconds;
    // End:0x35d
    if(!bFadeOut || Go.DrawTime <= OBJ_FadedOutTime)
    {
        // End:0x137
        if(bFadeOut && Go.DrawTime > OBJ_FadedOutTime - 1.0)
        {
            FadeOutEffect = OBJ_FadedOutTime - Go.DrawTime;
        }
        // End:0x142
        else
        {
            FadeOutEffect = 1.0;
        }
        C.DrawColor = ObjColor * FadeOutEffect;
        // End:0x19c
        if(bProgressPulsing == 0)
        {
            C.DrawColor.A = byte(float(63) + float(128) * fPulse * FadeOutEffect);
        }
        // End:0x1bd
        else
        {
            C.DrawColor.A = byte(float(127) * FadeOutEffect);
        }
        AppearEffect = 0.50 / FMin(Go.DrawTime, 0.50);
        tileX = 64.0 * ResScaleX * AppearEffect * ObjectiveScale * HudScale;
        tileY = 64.0 * ResScaleY * AppearEffect * ObjectiveScale * HudScale;
        C.Style = 5;
        C.SetPos(ScreenPos.X - tileX * 0.50, ScreenPos.Y - tileY * 0.50);
        // End:0x30e
        if(Go.IsA('UseObjective'))
        {
            // End:0x2e2
            if(Go.UseDescription != "")
            {
                UseString = IP_Bracket_Open @ Go.UseDescription @ IP_Bracket_Close;
                C.Font = GetConsoleFont(C);
            }
            Draw_2DCollisionBox(C, Go, ScreenPos, UseString, Go.DrawScale, false);
        }
        // End:0x35d
        else
        {
            // End:0x35d
            if(Go.ObjectiveTypeIcon != none)
            {
                C.DrawTile(Go.ObjectiveTypeIcon, tileX, tileY, 0.0, 0.0, 64.0, 64.0);
            }
        }
    }
    ProgressPct = Go.GetObjectiveProgress();
    // End:0x3b5
    if(ProgressPct > float(0))
    {
        ScreenPos.Y -= float(48) * ResScaleX;
        DrawHealthBar(C, ScreenPos, ProgressPct, 1.0, ObjColor);
    }
}

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

simulated function Draw3dObjectiveArrow(Canvas C);
simulated function Release_ObjectivePointingArrow()
{
    // End:0x17
    if(OBJPointingArrow != none)
    {
        OBJPointingArrow.Destroy();
    }
}

simulated function DrawHealthBar(Canvas C, Vector HBScreenPos, float Health, float MaxHealth, Color ObjColor);
simulated function bool CheckObjectivePriority(GameObjective Go)
{
    // End:0x1e
    if(Go.ObjectivePriority <= ObjectiveProgress)
    {
        return true;
    }
    return false;
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
    if(CurrentObjective == none && ASGRI != none)
    {
        i = 0;
        J0x1f:
        // End:0xb1 [While If]
        if(i < obj.Length)
        {
            Go = obj[i];
            // End:0xa7
            if(ASGRI.ObjectiveProgress == Go.ObjectivePriority && Go.IsActive() && !Go.bOptionalObjective || CurrentObjective == none)
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
    local InfoPod IP;
    local Vector IPScreenPos, camLoc;
    local int i;
    local Rotator camRot;

    // End:0x27
    if(ASGRI == none || PawnOwner == none || PlayerOwner == none)
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
                if(IP.Team == 1 && ASGRI.IsDefender(byte(PawnOwner.GetTeamNum())))
                {
                }
                // End:0x32f
                else
                {
                    // End:0x127
                    if(IP.Team == 2 && !ASGRI.IsDefender(byte(PawnOwner.GetTeamNum())))
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

static function Draw_2DCollisionBox(Canvas C, Actor A, Vector ScrPos, string Description, float ColExpand, bool bSizeOverride)
{
    local Vector TmpScrCorner[2], ScrCornerY, ScrCornerX;
    local float XL, YL, BXL, BYL;
    local Vector CameraLocation;
    local Rotator CameraRotation;

    C.GetCameraLocation(CameraLocation, CameraRotation);
    C.Style = 5;
    // End:0xb7
    if(CameraLocation.Z < A.Location.Z)
    {
        ScrCornerY[0] = GetScreenCorner(C, A, vect(1.0, 0.0, 1.0), ScrPos, CameraRotation, ColExpand);
        ScrCornerY[1] = GetScreenCorner(C, A, vect(-1.0, 0.0, -1.0), ScrPos, CameraRotation, ColExpand);
    }
    // End:0x11f
    else
    {
        ScrCornerY[0] = GetScreenCorner(C, A, vect(-1.0, 0.0, 1.0), ScrPos, CameraRotation, ColExpand);
        ScrCornerY[1] = GetScreenCorner(C, A, vect(1.0, 0.0, -1.0), ScrPos, CameraRotation, ColExpand);
    }
    TmpScrCorner[0] = GetScreenCorner(C, A, vect(0.0, 1.0, 1.0), ScrPos, CameraRotation, ColExpand);
    TmpScrCorner[1] = GetScreenCorner(C, A, vect(0.0, 1.0, -1.0), ScrPos, CameraRotation, ColExpand);
    ScrCornerX[0].X = float(Max(int(TmpScrCorner[0].X), int(TmpScrCorner[1].X)));
    TmpScrCorner[0] = GetScreenCorner(C, A, vect(0.0, -1.0, 1.0), ScrPos, CameraRotation, ColExpand);
    TmpScrCorner[1] = GetScreenCorner(C, A, vect(0.0, -1.0, -1.0), ScrPos, CameraRotation, ColExpand);
    ScrCornerX[1].X = float(Max(int(TmpScrCorner[0].X), int(TmpScrCorner[1].X)));
    // End:0x38e
    if(Description != "")
    {
        C.StrLen(Description, XL, YL);
        TmpScrCorner[0].X = ScrPos.X - ScrCornerX[0].X;
        TmpScrCorner[0].Y = ScrPos.Y - ScrCornerY[0].Y - YL;
        // End:0x2e7
        if(TmpScrCorner[0].X < float(0))
        {
            TmpScrCorner[0].X = 0.0;
        }
        // End:0x32f
        if(TmpScrCorner[0].X + XL > C.ClipX)
        {
            TmpScrCorner[0].X = C.ClipX - XL;
        }
        // End:0x355
        if(TmpScrCorner[0].Y < float(0))
        {
            TmpScrCorner[0].Y = 0.0;
        }
        C.SetPos(TmpScrCorner[0].X, TmpScrCorner[0].Y);
        C.DrawText(Description, false);
    }
    BXL = 16.0 * float(C.SizeX) / 640.0;
    BYL = 16.0 * float(C.SizeY) / 480.0;
    // End:0x439
    if(ScrCornerX[0].X + ScrCornerX[1].X < BXL)
    {
        // End:0x407
        if(!bSizeOverride)
        {
            return;
        }
        ScrCornerX[0].X = BXL * 0.50;
        ScrCornerX[1].X = BXL * 0.50;
    }
    // End:0x49c
    if(ScrCornerY[0].Y + ScrCornerY[1].Y < BYL)
    {
        // End:0x46a
        if(!bSizeOverride)
        {
            return;
        }
        ScrCornerY[0].Y = BYL * 0.50;
        ScrCornerY[1].Y = BYL * 0.50;
    }
}

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

simulated function DrawTextWithBackground(Canvas C, string Text, Color TextColor, float XO, float YO);
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
    if(ASGRI == none && PlayerOwner.GameReplicationInfo != none)
    {
        ASGRI = ASGameReplicationInfo(PlayerOwner.GameReplicationInfo);
    }
    // End:0xce
    if(PawnOwner != none && PawnOwner.PlayerReplicationInfo != none)
    {
        ASPRI = ASPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    }
    AttackerProgressUpdateTime = FMax(AttackerProgressUpdateTime - Global_Delta, 0.0);
    // End:0x160
    if(ASGRI != none)
    {
        ObjectiveProgress = ASGRI.ObjectiveProgress;
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
    if(PlayerOwner == none || ASGRI == none || ScoreBoard == none || ASGRI.RoundTimeLimit == 0)
    {
        return;
    }
    C.Font = GetFontSizeIndex(C, 0);
    C.Style = 5;
    myColor = GoldColor * 1.0 - fPulse + WhiteColor * fPulse;
    Seconds = float(Max(0, ASGRI.RoundTimeLimit - ASGRI.RoundStartTime + ASGRI.RemainingTime));
    // End:0xfb
    if(ASGRI.RoundWinner != 0)
    {
        Seconds = float(ASGRI.RoundOverTime);
    }
    DrawTextWithBackground(C, PracticeRoundString @ ScoreBoard.FormatTime(int(Seconds)), myColor, C.ClipX * 0.50, C.ClipY * 0.670);
}

function CheckCountdown(GameReplicationInfo GRI)
{
    local int RemainingRoundTime;

    // End:0x18
    if(ASGRI == none)
    {
        super(HudCDeathmatch).CheckCountdown(GRI);
        return;
    }
    // End:0x33
    if(ASGRI.RoundWinner != 0)
    {
        return;
    }
    RemainingRoundTime = ASGRI.RoundTimeLimit - ASGRI.RoundStartTime + ASGRI.RemainingTime;
    // End:0x86
    if(ASGRI.RoundTimeLimit == 0)
    {
        super(HudCDeathmatch).CheckCountdown(ASGRI);
    }
    // End:0xbf
    if(RemainingRoundTime < 1 || RemainingRoundTime == OldRemainingRoundTime || ASGRI.RoundWinner != 0)
    {
        return;
    }
    OldRemainingRoundTime = RemainingRoundTime;
    // End:0xdb
    if(OldRemainingRoundTime > 300)
    {
        return;
    }
    // End:0x18f
    if(OldRemainingRoundTime > 30)
    {
        // End:0x113
        if(OldRemainingRoundTime == 300)
        {
            PlayerOwner.QueueAnnouncement(string(LongCountName[0]), 1);
        }
        // End:0x18d
        else
        {
            // End:0x13c
            if(OldRemainingRoundTime == 180)
            {
                PlayerOwner.QueueAnnouncement(string(LongCountName[1]), 1);
            }
            // End:0x18d
            else
            {
                // End:0x166
                if(OldRemainingRoundTime == 120)
                {
                    PlayerOwner.QueueAnnouncement(string(LongCountName[2]), 1);
                }
                // End:0x18d
                else
                {
                    // End:0x18d
                    if(OldRemainingRoundTime == 60)
                    {
                        PlayerOwner.QueueAnnouncement(string(LongCountName[3]), 1);
                    }
                }
            }
        }
        return;
    }
    // End:0x1b9
    if(OldRemainingRoundTime == 30)
    {
        PlayerOwner.QueueAnnouncement(string(LongCountName[4]), 1);
    }
    // End:0x223
    else
    {
        // End:0x1e5
        if(OldRemainingRoundTime == 20)
        {
            PlayerOwner.QueueAnnouncement(string(LongCountName[5]), 1, 2);
        }
        // End:0x223
        else
        {
            // End:0x223
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
    if(ASGRI == none)
    {
        return NoGameReplicationInfoString;
    }
    // End:0x3a
    if(ASGRI.RoundWinner != 0)
    {
        return ASGRI.GetRoundWinnerString();
    }
    // End:0x6b
    if(GUIController(PlayerOwner.Player.GUIController).ActivePage != none)
    {
        return AtMenus;
    }
    // End:0xc1
    if(ASPRI != none && ASPRI.bAutoRespawn)
    {
        InfoString = class'ScoreBoard_Assault'.default.AutoRespawn;
        InfoString = InfoString @ string(ASGRI.ReinforcementCountDown);
        return InfoString;
    }
    // End:0x14a
    if(ASGRI.ReinforcementCountDown > 0 && !PlayerOwner.IsInState('PlayerWaiting'))
    {
        // End:0x116
        if(PlayerOwner.IsDead())
        {
            InfoString = class'ScoreBoard_Assault'.default.WaitForReinforcements;
        }
        // End:0x12a
        else
        {
            InfoString = class'ScoreBoard_Assault'.default.WaitingToSpawnReinforcements;
        }
        InfoString = InfoString @ string(ASGRI.ReinforcementCountDown);
    }
    // End:0x156
    else
    {
        InfoString = super(HudCDeathmatch).GetInfoString();
    }
    return InfoString;
}

exec function ShowSpawnAreas()
{
    local NavigationPoint N;
    local PlayerStart ps;
    local PlayerSpawnManager PSM;

    Log("==============");
    Log("ShowSpawnAreas");
    Log("==============");
    // End:0x138
    foreach AllActors(class'PlayerSpawnManager', PSM)
    {
        Log("PlayerSpawnManager:" @ string(PSM) @ "bEnabled:" @ string(PSM.bEnabled) @ "Tag:" @ string(PSM.Tag));
        // End:0x137
        if(PSM.bEnabled)
        {
            N = Level.NavigationPointList;
            J0xc6:
            // End:0x137 [While If]
            if(N != none)
            {
                ps = PlayerStart(N);
                // End:0xef
                if(ps == none)
                {
                }
                // End:0x120
                else
                {
                    // End:0x120
                    if(ps.TeamNumber == PSM.PlayerStartTeam)
                    {
                        Log(" " @ string(ps));
                    }
                }
                N = N.nextNavigationPoint;
                // This is an implied JumpToken; Continue!
                goto J0xc6;
            }
        }                
    }
    Log("==============");
    Log("End...........");
    Log("==============");
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

defaultproperties
{
    ObjectiveScale=1.0
    bOnHUDObjectiveNotification=true
    bShowInfoPods=true
    bShow3DArrow=true
    bObjectiveReminder=true
    bDrawRadar=true
    bDrawRadarCardinalPoints=true
    bShowWillowWhisp=true
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
    NoGameReplicationInfoString="?? ?? ?? ?..."
    MetersString="m"
    TargetString="??:"
    NoTargetString="?? ??"
    PracticeRoundString="?? ???"
    ObjectiveProgressPulseTime=7.0
    ObjectiveProgress=255
    OldObjectiveProgress=255
    HudColorHighLight=(R=255,G=192,B=32,A=255)
}