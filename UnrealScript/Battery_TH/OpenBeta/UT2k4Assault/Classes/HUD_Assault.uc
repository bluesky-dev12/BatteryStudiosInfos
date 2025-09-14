class HUD_Assault extends HudCTeamDeathMatch
    transient
    config(User);

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

simulated function DrawTimer(Canvas C)
{
    //return;    
}

simulated function DrawAdrenaline(Canvas C)
{
    //return;    
}

exec function ShowObjectiveBoard()
{
    bShowObjectiveBoard = !bShowObjectiveBoard;
    //return;    
}

simulated function PrecacheFonts(Canvas C)
{
    super(HudBase).PrecacheFonts(C);
    C.Font = GetFontSizeIndex(C, -1);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    C.Font = GetFontSizeIndex(C, -3);
    C.SetPos(0.0000000, 0.0000000);
    C.DrawText("Aa1");
    //return;    
}

simulated event PostBeginPlay()
{
    local GameObjective Go;
    local InfoPod IP;
    local Trigger_ASMessageTrigger mT;

    super(HudCDeathmatch).PostBeginPlay();
    // End:0x3F
    foreach AllActors(Class'UnrealGame.GameObjective', Go)
    {
        // End:0x2C
        if(Go.bBotOnlyObjective)
        {
            continue;            
        }
        obj[obj.Length] = Go;        
    }    
    // End:0x63
    foreach AllActors(Class'UT2k4Assault_Decompressed.InfoPod', IP)
    {
        InfoPods[InfoPods.Length] = IP;        
    }    
    // End:0x87
    foreach AllActors(Class'UT2k4Assault_Decompressed.Trigger_ASMessageTrigger', mT)
    {
        MTrigger[MTrigger.Length] = mT;        
    }    
    ObjectiveBoard = Spawn(Class'UT2k4Assault_Decompressed.ObjectiveProgressDisplay', Owner);
    ObjectiveBoard.Initialize(self);
    //return;    
}

simulated event Destroyed()
{
    // End:0x1E
    if(ObjectiveBoard != none)
    {
        ObjectiveBoard.Destroy();
        ObjectiveBoard = none;
    }
    Release_BehindObjectiveArrows();
    Release_ObjectivePointingArrow();
    super(HUD).Destroyed();
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    local bool bOldShowWeaponInfo, bOldShowPersonalInfo;
    local Class<wAmmunition> AmmoClass;

    bOldShowWeaponInfo = bShowWeaponInfo;
    // End:0x72
    if((PawnOwner != none) && PawnOwner.Weapon != none)
    {
        AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
        // End:0x72
        if((AmmoClass == none) || ClassIsChildOf(AmmoClass, Class'UT2k4Assault_Decompressed.Ammo_Dummy'))
        {
            bShowWeaponInfo = false;
        }
    }
    bOldShowPersonalInfo = bShowPersonalInfo;
    // End:0xB0
    if((ASVehicle(PawnOwner) != none) && ASVehicle(PawnOwner).bCustomHealthDisplay)
    {
        bShowPersonalInfo = false;
    }
    super.DrawHudPassA(C);
    bShowWeaponInfo = bOldShowWeaponInfo;
    bShowPersonalInfo = bOldShowPersonalInfo;
    // End:0x114
    if((bDrawRadar && Vehicle(PawnOwner) != none) && Vehicle(PawnOwner).bHasRadar)
    {
        DrawRadarPassA(C);
    }
    //return;    
}

simulated function DrawHudPassB(Canvas C)
{
    super(HudBase).DrawHudPassB(C);
    // End:0x4A
    if((bDrawRadar && Vehicle(PawnOwner) != none) && Vehicle(PawnOwner).bHasRadar)
    {
        DrawRadarPassB(C);
    }
    //return;    
}

simulated function DrawHudPassC(Canvas C)
{
    local bool bOldShowWeaponInfo, bOldShowPersonalInfo;
    local Class<wAmmunition> AmmoClass;

    DrawAssaultHUDLayer(C);
    bOldShowWeaponInfo = bShowWeaponInfo;
    // End:0x7D
    if((PawnOwner != none) && PawnOwner.Weapon != none)
    {
        AmmoClass = PawnOwner.Weapon.GetAmmoClass(0);
        // End:0x7D
        if((AmmoClass == none) || ClassIsChildOf(AmmoClass, Class'UT2k4Assault_Decompressed.Ammo_Dummy'))
        {
            bShowWeaponInfo = false;
        }
    }
    bOldShowPersonalInfo = bShowPersonalInfo;
    // End:0xCC
    if(((PawnOwner != none) && PawnOwner.IsA('ASVehicle')) && ASVehicle(PawnOwner).bCustomHealthDisplay)
    {
        bShowPersonalInfo = false;
    }
    super.DrawHudPassC(C);
    bShowWeaponInfo = bOldShowWeaponInfo;
    bShowPersonalInfo = bOldShowPersonalInfo;
    //return;    
}

function CanvasDrawActors(Canvas C, bool bClearedZBuffer)
{
    // End:0x57
    if(((PawnOwner != none) && bShow3DArrow) && !bHideHUD)
    {
        // End:0x3D
        if(!bClearedZBuffer)
        {
            C.DrawActor(none, false, true);
        }
        Draw3dObjectiveArrow(C);
        super(HUD).CanvasDrawActors(C, true);        
    }
    else
    {
        super(HUD).CanvasDrawActors(C, bClearedZBuffer);
    }
    //return;    
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
    // End:0x5D
    if((ASGRI != none) && ASGRI.IsPracticeRound())
    {
        DrawPracticeRoundInfo(C);
    }
    // End:0xD0
    if(((PawnOwner != none) && ObjectiveBoard != none) && ASGRI != none)
    {
        ObjectiveBoard.ShowStatus(ShouldShowObjectiveBoard());
        ObjectiveBoard.PostRender(C, Global_Delta, ASGRI.IsDefender(byte(PawnOwner.GetTeamNum())));
    }
    //return;    
}

simulated function bool ShouldShowObjectiveBoard()
{
    // End:0x1A
    if((ObjectiveBoard == none) || ASGRI == none)
    {
        return false;
    }
    // End:0x2E
    if(ObjectiveBoard.AnyOptionalObjectiveCritical())
    {
        return true;
    }
    return (bShowObjectiveBoard || bForceObjectiveBoard) || AttackerProgressUpdateTime > float(0);
    //return;    
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
    // End:0x16D
    if(ASGRI.RoundTimeLimit > 0)
    {
        RoundTime = Max(0, (ASGRI.RoundTimeLimit - ASGRI.RoundStartTime) + ASGRI.RemainingTime);
        // End:0x8B
        if(int(ASGRI.RoundWinner) != int(0))
        {
            RoundTime = ASGRI.RoundOverTime;
        }
        Minutes = RoundTime / 60;
        Seconds = RoundTime - (Minutes * 60);
        RoundTimeMinutes.Value = Minutes;
        RoundTimeSeconds.Value = Min(Seconds, 60);
        // End:0x12E
        if(Minutes > 9)
        {
            RoundTimeSeparator.OffsetX = default.RoundTimeSeparator.OffsetX + 32;
            RoundTimeMinutes.OffsetX = default.RoundTimeMinutes.OffsetX + 32;
            RoundTimeSeconds.OffsetX = default.RoundTimeSeconds.OffsetX + 32;            
        }
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
        TeleportCount = Min((((ASGRI.RoundTimeLimit - ASGRI.RoundStartTime) + ASGRI.RemainingTime) + ASGRI.MaxTeleportTime) - ASPRI.TeleportTime, 999);
        TeleportSprNum.Value = TeleportCount;
    }
    //return;    
}

simulated function ShowTeamScorePassA(Canvas C)
{
    local float PosY;

    // End:0x0D
    if(ASGRI == none)
    {
        return;
    }
    // End:0xA2
    if(ASGRI.RoundTimeLimit > 0)
    {
        RoundTimeBackGround.Tints[TeamIndex] = HudColorBlack;
        RoundTimeBackGround.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, RoundTimeBackGround);
        DrawSpriteWidget(C, RoundTimeBackGroundDisc);
        DrawSpriteWidget(C, RoundTimeSeparator);
        DrawSpriteWidget(C, RoundTimeIcon);
        PosY += (0.0600000 * HudScale);
    }
    // End:0x1D5
    if((Level.Game == none) || !ASGameInfo(Level.Game).bDisableReinforcements)
    {
        ReinforceBackground.PosY = PosY;
        ReinforceBackGroundDisc.PosY = PosY;
        ReinforcePulse.PosY = PosY;
        ReinforceIcon.PosY = PosY;
        ReinforceSprNum.PosY = PosY;
        PosY += (0.0600000 * HudScale);
        ReinforceBackground.Tints[TeamIndex] = HudColorBlack;
        ReinforceBackground.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, ReinforceBackground);
        DrawSpriteWidget(C, ReinforceBackGroundDisc);
        ReinforcePulse.Tints[TeamIndex] = HudColorHighLight;
        // End:0x1C5
        if(ASGRI.ReinforcementCountDown < 1)
        {
            DrawSpriteWidget(C, ReinforcePulse);
        }
        DrawSpriteWidget(C, ReinforceIcon);
    }
    // End:0x2C2
    if((((ASGRI != none) && (float(ASGRI.CurrentRound) % float(2)) == float(0)) && !ASGRI.IsPracticeRound()) && IsVSRelevant())
    {
        VSBackground.PosY = PosY;
        VSBackgroundDisc.PosY = PosY;
        VSIcon.PosY = PosY;
        PosY += (0.0600000 * HudScale);
        VSBackground.Tints[TeamIndex] = HudColorBlack;
        VSBackground.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, VSBackground);
        DrawSpriteWidget(C, VSBackgroundDisc);
        DrawSpriteWidget(C, VSIcon);
    }
    // End:0x3DA
    if(((ASPRI != none) && ASPRI.bTeleportToSpawnArea) && TeleportSprNum.Value >= 0)
    {
        TeleportBackground.PosY = PosY;
        TeleportBackgroundDisc.PosY = PosY;
        TeleportPulse.PosY = PosY;
        TeleportIcon.PosY = PosY;
        TeleportSprNum.PosY = PosY;
        PosY += (0.0600000 * HudScale);
        TeleportBackground.Tints[TeamIndex] = HudColorBlack;
        TeleportBackground.Tints[TeamIndex].A = 150;
        DrawSpriteWidget(C, TeleportBackground);
        DrawSpriteWidget(C, TeleportBackgroundDisc);
        TeleportPulse.Tints[TeamIndex] = HudColorHighLight;
        DrawSpriteWidget(C, TeleportPulse);
        DrawSpriteWidget(C, TeleportIcon);
    }
    // End:0x3EE
    if(ASGRI.RoundTimeLimit > 0)
    {
    }
    // End:0x445
    if((((ASGRI != none) && (float(ASGRI.CurrentRound) % float(2)) == float(0)) && !ASGRI.IsPracticeRound()) && IsVSRelevant())
    {
        DrawTeamVS(C);
    }
    //return;    
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
        RelativeTime = CurrentObjective.ObjectiveDisabledTime - (ASGRI.RoundStartTime - ASGRI.RemainingTime);
        bIsBehindOtherTeam = RelativeTime < 0;
        Hours = int(Abs(float(RelativeTime)) / float(3600));
        Minutes = int(Abs(float(RelativeTime)) - float(Hours * 3600)) / 60;
        Seconds = int((Abs(float(RelativeTime)) - float(Hours * 3600)) - float(Minutes * 60));
        // End:0xE1
        if(Hours > 0)
        {
            output = string(Hours) $ ":";
        }
        // End:0x109
        if(Minutes > 9)
        {
            output = (output $ string(Minutes)) $ ":";            
        }
        else
        {
            output = ((output $ "0") $ string(Minutes)) $ ":";
        }
        // End:0x14A
        if(Seconds > 9)
        {
            output = output $ string(Seconds);            
        }
        else
        {
            output = (output $ "0") $ string(Seconds);
        }        
    }
    else
    {
        Progress = CurrentObjective.SavedObjectiveProgress - CurrentObjective.GetObjectiveProgress();
        bIsBehindOtherTeam = Progress < float(0);
        output = string(int(Abs(Progress * float(100)))) $ "%";
    }
    TotalScaleX = (HudCanvasScale * ResScaleX) * HudScale;
    TotalScaleY = (HudCanvasScale * ResScaleY) * HudScale;
    TextureDX = (Abs(float(VSBackgroundDisc.TextureCoords.X2 - VSBackgroundDisc.TextureCoords.X1) + 1.0000000) * TotalScaleX) * VSBackgroundDisc.TextureScale;
    TextureDY = (Abs(float(VSBackground.TextureCoords.Y2 - VSBackground.TextureCoords.Y1) + 1.0000000) * TotalScaleY) * VSBackground.TextureScale;
    ScreenX = ((VSBackgroundDisc.PosX * HudCanvasScale) * float(C.SizeX)) + (((1.0000000 - HudCanvasScale) * 0.5000000) * float(C.SizeX));
    ScreenY = ((VSBackground.PosY * HudCanvasScale) * float(C.SizeY)) + (((1.0000000 - HudCanvasScale) * 0.5000000) * float(C.SizeY));
    ScreenX += ((float(VSBackgroundDisc.OffsetX) * TotalScaleX) + (TextureDX * float(1)));
    ScreenY += ((float(VSBackground.OffsetY) * TotalScaleY) + (TextureDY * 0.4500000));
    C.Font = GetMediumFont(C.ClipX * HudScale);
    C.TextSize(output, XL, YL);
    C.Style = 5;
    // End:0x3D9
    if(PawnOwner == none)
    {
        PlayerTeam = PlayerOwner.GetTeamNum();        
    }
    else
    {
        PlayerTeam = PawnOwner.GetTeamNum();
    }
    // End:0x416
    if(ASGRI.IsDefender(byte(PlayerTeam)))
    {
        bIsBehindOtherTeam = !bIsBehindOtherTeam;
    }
    // End:0x45C
    if(bIsBehindOtherTeam)
    {
        output = "-" $ output;
        C.DrawColor = C.MakeColor(byte(255), 0, 0, byte(255));        
    }
    else
    {
        C.DrawColor = C.MakeColor(0, byte(255), 0, byte(255));
    }
    C.SetPos(ScreenX, ScreenY - (YL / float(2)));
    C.DrawText(output, false);
    //return;    
}

simulated function bool IsVSRelevant()
{
    // End:0x97
    if(((int(ASGRI.RoundWinner) != int(0)) || CurrentObjective == none) || (CurrentObjective.ObjectiveDisabledTime == 0) && ((CurrentObjective.SavedObjectiveProgress == float(0)) || CurrentObjective.SavedObjectiveProgress == float(1)) || (CurrentObjective.SavedObjectiveProgress - CurrentObjective.GetObjectiveProgress()) > float(0))
    {
        return false;
    }
    return true;
    //return;    
}

simulated function ShowTeamScorePassC(Canvas C)
{
    //return;    
}

simulated function DrawSpectatingHud(Canvas C)
{
    super.DrawSpectatingHud(C);
    UpdateTeamHud();
    ShowTeamScorePassA(C);
    DrawAssaultHUDLayer(C);
    //return;    
}

function DrawRadarPassA(Canvas C)
{
    local float dist, RadarWidth, DotSize, OffsetY, XL, YL,
	    OffsetScale;

    local Vector Start, dotPos, ViewX, ViewY, Z;

    // End:0x0D
    if(PawnOwner == none)
    {
        return;
    }
    ASRadarScale = default.ASRadarScale * HudScale;
    RadarWidth = (0.5000000 * ASRadarScale) * C.ClipX;
    C.Style = 5;
    Start = PawnOwner.Location;
    OffsetY = ASRadarPosY + (RadarWidth / C.ClipY);
    C.DrawColor = WhiteColor;
    OffsetScale = ASRadarScale * 0.0000835;
    GetAxes(PawnOwner.GetViewRotation(), ViewX, ViewY, Z);
    // End:0x390
    if(bDrawRadarCardinalPoints)
    {
        dist = 5500.0000000;
        C.Font = GetConsoleFont(C);
        C.StrLen(Cardinal_North, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(0.0000000, -100.0000000, 0.0000000), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - (0.5000000 * XL), dotPos.Y - (0.5000000 * YL));
        C.DrawText(Cardinal_North, false);
        C.StrLen(Cardinal_East, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(100.0000000, 0.0000000, 0.0000000), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - (0.5000000 * XL), dotPos.Y - (0.5000000 * YL));
        C.DrawText(Cardinal_East, false);
        C.StrLen(Cardinal_South, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(0.0000000, 100.0000000, 0.0000000), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - (0.5000000 * XL), dotPos.Y - (0.5000000 * YL));
        C.DrawText(Cardinal_South, false);
        C.StrLen(Cardinal_West, XL, YL);
        dotPos = GetRadarDotPosition(C, vect(-100.0000000, 0.0000000, 0.0000000), ViewX, ViewY, dist * OffsetScale, OffsetY);
        C.SetPos(dotPos.X - (0.5000000 * XL), dotPos.Y - (0.5000000 * YL));
        C.DrawText(Cardinal_West, false);
    }
    C.DrawColor = WhiteColor;
    DotSize = ((12.0000000 * C.ClipX) * HudScale) / float(1600);
    dotPos = GetRadarDotPosition(C, PawnOwner.Location - Start, ViewX, ViewY, 0.0000000, OffsetY);
    C.SetPos(dotPos.X - (0.5000000 * DotSize), dotPos.Y - (0.5000000 * DotSize));
    //return;    
}

simulated function DrawRadarPassB(Canvas C)
{
    local Vehicle P;
    local float dist, RadarWidth, DotSize, OffsetY;
    local Vector Start, dotPos, ViewX, ViewY, Z;

    local float MaxSmartRange, OffsetScale;
    local int i;

    // End:0x0D
    if(PawnOwner == none)
    {
        return;
    }
    Start = PawnOwner.Location;
    ASRadarScale = default.ASRadarScale * HudScale;
    RadarWidth = (0.5000000 * ASRadarScale) * C.ClipX;
    OffsetY = ASRadarPosY + (RadarWidth / C.ClipY);
    MaxSmartRange = 30000.0000000;
    DotSize = ((20.0000000 * C.ClipX) * HudScale) / float(1600);
    C.Style = 6;
    OffsetScale = ASRadarScale * 0.0000835;
    GetAxes(PawnOwner.GetViewRotation(), ViewX, ViewY, Z);
    // End:0x2D8
    if(Level.TimeSeconds > (LastRadarUpdate + float(1)))
    {
        LastRadarUpdate = Level.TimeSeconds;
        RadarVehicleCache.Length = 0;
        // End:0x2D4
        foreach DynamicActors(Class'Engine.Vehicle', P)
        {
            // End:0x2D3
            if((((((P != PawnOwner) && P.GetTeamNum() != PawnOwner.GetTeamNum()) && P != TrackedVehicle) && P.Health > 0) && !P.bDeleteMe) && P.IndependentVehicle())
            {
                RadarVehicleCache[RadarVehicleCache.Length] = P;
                dist = GetRadarDotDist(P.Location - Start, ViewX, ViewY);
                // End:0x2D3
                if(dist < MaxSmartRange)
                {
                    dist = ApplySmartRangeDist(dist * 0.5000000);
                    // End:0x2AD
                    if(PawnOwner.IsA('ASVehicle_SpaceFighter') && ASVehicle_SpaceFighter(PawnOwner).CurrentTarget == P)
                    {
                        C.DrawColor = ((GetTeamColor(byte(P.GetTeamNum()))) * (1.0000000 - fPulse)) + (C.MakeColor(64, 200, 64) * fPulse);
                        // End:0x2D3
                        continue;
                    }
                    C.DrawColor = GetTeamColor(byte(P.GetTeamNum()));
                }
            }            
        }                
    }
    else
    {
        i = 0;
        J0x2DF:

        // End:0x49F [Loop If]
        if(i < RadarVehicleCache.Length)
        {
            P = RadarVehicleCache[i];
            // End:0x495
            if(((((((P != none) && P != PawnOwner) && P.GetTeamNum() != PawnOwner.GetTeamNum()) && P != TrackedVehicle) && P.Health > 0) && !P.bDeleteMe) && P.IndependentVehicle())
            {
                dist = GetRadarDotDist(P.Location - Start, ViewX, ViewY);
                // End:0x495
                if(dist < MaxSmartRange)
                {
                    dist = ApplySmartRangeDist(dist * 0.5000000);
                    // End:0x46F
                    if(PawnOwner.IsA('ASVehicle_SpaceFighter') && ASVehicle_SpaceFighter(PawnOwner).CurrentTarget == P)
                    {
                        C.DrawColor = ((GetTeamColor(byte(P.GetTeamNum()))) * (1.0000000 - fPulse)) + (C.MakeColor(64, 200, 64) * fPulse);
                        // [Explicit Continue]
                        goto J0x495;
                    }
                    C.DrawColor = GetTeamColor(byte(P.GetTeamNum()));
                }
            }
            J0x495:

            i++;
            // [Loop Continue]
            goto J0x2DF;
        }
    }
    //return;    
}

function float ApplySmartRangeDist(float dist)
{
    // End:0x38
    if(dist > float(3000))
    {
        dist = ((dist - float(3000)) * 0.2500000) + float(2000);        
    }
    else
    {
        // End:0x6D
        if(dist > float(1000))
        {
            dist = ((dist - float(1000)) * 0.5000000) + float(1000);
        }
    }
    return FMin(dist, 5500.0000000);
    //return;    
}

function float GetRadarDotDist(Vector dist, Vector ViewX, Vector ViewY)
{
    local Vector DotProjected;

    DotProjected.X = dist Dot Normal(ViewX);
    DotProjected.Y = dist Dot Normal(ViewY);
    return VSize(DotProjected);
    //return;    
}

function Vector GetRadarDotPosition(Canvas C, Vector dist, Vector ViewX, Vector ViewY, float OffsetScale, float OffsetY)
{
    local Vector ScreenPosition, DotProjected;

    DotProjected.X = Normal(dist) Dot Normal(ViewX);
    DotProjected.Y = Normal(dist) Dot Normal(ViewY);
    ScreenPosition.X = (ASRadarPosX * C.ClipX) + ((OffsetScale * C.ClipX) * DotProjected.Y);
    ScreenPosition.Y = (OffsetY * C.ClipY) - ((OffsetScale * C.ClipX) * DotProjected.X);
    return ScreenPosition;
    //return;    
}

simulated function UpdateActorTracking(Canvas C)
{
    local Vehicle V;
    local Vector ScreenPos;

    // End:0x70
    if((TrackedVehicle == none) && NextTrackedVehicleSearch < Level.TimeSeconds)
    {
        NextTrackedVehicleSearch = Level.TimeSeconds + float(1);
        // End:0x6F
        foreach DynamicActors(Class'Engine.Vehicle', V)
        {
            // End:0x6E
            if(V.bHUDTrackVehicle)
            {
                TrackedVehicle = V;
                // End:0x6F
                break;
            }            
        }        
    }
    // End:0x133
    if((((TrackedVehicle != none) && TrackedVehicle != PawnOwner) && TrackedVehicle.Health > 0) && !TrackedVehicle.bDeleteMe)
    {
        C.DrawColor = GetTeamColor(TrackedVehicle.Team);
        C.DrawColor.A = 128;
        // End:0x133
        if(DrawActorTracking(C, TrackedVehicle, false, ScreenPos))
        {
            DrawTrackedVehicleIcon(C, TrackedVehicle, ScreenPos.X, ScreenPos.Y, 1.0000000);
        }
    }
    // End:0x1FD
    if((((ASGRI != none) && ASGRI.GameObject != none) && PawnOwner != none) && ASGRI.GameObject.HolderPRI != PawnOwner.PlayerReplicationInfo)
    {
        C.DrawColor = GoldColor;
        C.DrawColor.A = 128;
        // End:0x1FD
        if(DrawActorTracking(C, ASGRI.GameObject, false, ScreenPos))
        {
            DrawTrackedGameObjectIcon(C, ScreenPos.X, ScreenPos.Y, 1.0000000);
        }
    }
    //return;    
}

simulated function DrawTrackedVehicleIcon(Canvas C, Vehicle TrackedVehicle, float X, float Y, float Scale)
{
    local float SizeScale, SizeX, SizeY, ratio;

    // End:0x1B
    if(TrackedVehicle.VehicleIcon.Material == none)
    {
        return;
    }
    SizeScale = (ObjectiveScale * HudScale) * Scale;
    ratio = TrackedVehicle.VehicleIcon.SizeX / TrackedVehicle.VehicleIcon.SizeY;
    SizeX = (32.0000000 * SizeScale) * ResScaleX;
    SizeY = ((32.0000000 / ratio) * SizeScale) * ResScaleY;
    // End:0xE2
    if(TrackedVehicle.VehicleIcon.bIsGreyScale)
    {
        C.DrawColor = GetTeamColor(byte(int(1) - int(TrackedVehicle.Team)));        
    }
    else
    {
        C.DrawColor = WhiteColor;
    }
    C.DrawColor.A = byte(float(127) + (float(128) * fPulse));
    C.Style = 5;
    C.SetPos(X - (SizeX * 0.5000000), Y - (SizeY * 0.5000000));
    C.DrawTile(TrackedVehicle.VehicleIcon.Material, SizeX, SizeY, TrackedVehicle.VehicleIcon.X, TrackedVehicle.VehicleIcon.Y, TrackedVehicle.VehicleIcon.SizeX, TrackedVehicle.VehicleIcon.SizeY);
    //return;    
}

simulated function DrawTrackedGameObjectIcon(Canvas C, float X, float Y, float Scale)
{
    //return;    
}

simulated function bool DrawActorTracking(Canvas C, Actor A, bool bOptionalIndicator, out Vector ScreenPos)
{
    local Vector camLoc;
    local Rotator camRot;
    local float ProgressPct;

    C.GetCameraLocation(camLoc, camRot);
    // End:0x5D
    if(A.IsA('Pawn'))
    {
        ProgressPct = float(Pawn(A).Health) / Pawn(A).HealthMax;
    }
    // End:0xFD
    if(!IsTargetInFrontOfPlayer(C, A, ScreenPos, camLoc, camRot))
    {
        // End:0xF8
        if(!A.IsA('GameObjective') || bDrawAllObjectives)
        {
            DrawActorTracking_Behind(C, A, bOptionalIndicator, camLoc, camRot, ScreenPos);
            // End:0xF6
            if(ProgressPct > float(0))
            {
                DrawObjectiveStatusOverlay(C, ProgressPct, false, ScreenPos, ObjectiveScale * 0.6700000);
            }
            return true;
        }
        return false;        
    }
    else
    {
        // End:0x18E
        if((VSize(A.Location - camLoc) > float(2048)) || !FastTrace(A.Location, camLoc))
        {
            DrawActorTracking_Obstructed(C, A, bOptionalIndicator, camLoc, ScreenPos);
            // End:0x18C
            if(ProgressPct > float(0))
            {
                DrawObjectiveStatusOverlay(C, ProgressPct, false, ScreenPos, ObjectiveScale * 0.6700000);
            }
            return true;
        }
    }
    // End:0x1DA
    if(ProgressPct > float(0))
    {
        ScreenPos.Y -= (float(48) * ResScaleX);
        DrawHealthBar(C, ScreenPos, ProgressPct, 1.0000000, C.DrawColor);
    }
    return false;
    //return;    
}

simulated function DrawActorTracking_Obstructed(Canvas C, Actor A, bool bOptionalIndicator, Vector camLoc, out Vector ScreenPos)
{
    local string DistanceText;
    local float XL, YL, tileX, tileY, Width, Height;

    local Vector IndicatorPos;

    C.Style = 5;
    DistanceText = ((IP_Bracket_Open $ string(int(VSize(A.Location - camLoc) * 0.0187500))) $ MetersString) $ IP_Bracket_Close;
    C.Font = GetConsoleFont(C);
    C.StrLen(DistanceText, XL, YL);
    XL = XL * 0.5000000;
    YL = YL * 0.5000000;
    tileX = (((64.0000000 * 0.4500000) * ResScaleX) * ObjectiveScale) * HudScale;
    tileY = (((64.0000000 * 0.4500000) * ResScaleY) * ObjectiveScale) * HudScale;
    Width = FMax(tileX * 0.5000000, XL);
    Height = (tileY * 0.5000000) + (YL * float(2));
    ClipScreenCoords(C, ScreenPos.X, ScreenPos.Y, Width, Height);
    IndicatorPos.X = ScreenPos.X;
    IndicatorPos.Y = ((ScreenPos.Y - Height) + YL) + (tileY * 0.5000000);
    DrawObjectiveIcon(C, bOptionalIndicator, IndicatorPos.X - (tileX * 0.5000000), IndicatorPos.Y - (tileY * 0.5000000), tileX, tileY);
    C.SetPos(IndicatorPos.X - XL, IndicatorPos.Y + (tileY * 0.5000000));
    C.DrawText(DistanceText, false);
    ScreenPos = IndicatorPos;
    //return;    
}

simulated function DrawActorTracking_Behind(Canvas C, Actor A, bool bOptionalIndicator, Vector camLoc, Rotator camRot, out Vector ScreenPos)
{
    local Vector Orientation;
    local float tileX, tileY;
    local TexRotator Arrow;

    C.Style = 5;
    Orientation = GetTargetOrientation(A, camLoc, camRot);
    Orientation = ExpandTargetOrientationToCanvas(C, Orientation);
    ScreenPos.X = (C.ClipX * 0.5000000) + ((C.ClipX * Orientation.X) * 0.5000000);
    ScreenPos.Y = (C.ClipY * 0.5000000) - ((C.ClipY * Orientation.Y) * 0.5000000);
    Arrow = Get_BehindObjectiveArrow();
    tileX = (((128.0000000 * 0.4500000) * ResScaleX) * ObjectiveScale) * HudScale;
    tileY = (((128.0000000 * 0.4500000) * ResScaleY) * ObjectiveScale) * HudScale;
    ClipScreenCoords(C, ScreenPos.X, ScreenPos.Y, tileX * 0.5000000, tileY * 0.5000000);
    Arrow.Rotation.Yaw = int((Atan(Orientation.Y, Orientation.X) * float(32768)) / 3.1415927);
    C.SetPos(ScreenPos.X - (tileX * 0.5000000), ScreenPos.Y - (tileY * 0.5000000));
    C.DrawTile(Arrow, tileX, tileY, 0.0000000, 0.0000000, 128.0000000, 128.0000000);
    BehindObjectiveCount++;
    //return;    
}

simulated function DrawObjectives(Canvas C)
{
    local int i;
    local GameObjective Go;
    local Vector ScreenPos, camLoc;
    local Rotator camRot;

    BehindObjectiveCount = 0;
    i = 0;
    J0x0F:

    // End:0x23B [Loop If]
    if(i < obj.Length)
    {
        Go = obj[i];
        // End:0x231
        if((Go.IsActive() && Go.bUsePriorityOnHUD) && CheckObjectivePriority(Go))
        {
            C.DrawColor = GetObjectiveColor(Go);
            C.Style = 5;
            C.GetCameraLocation(camLoc, camRot);
            // End:0xE9
            if(IsObjectiveVisible(C, Go, ScreenPos, camLoc, camRot))
            {
                DrawVisibleObjective(C, Go, ScreenPos, camRot);
                // [Explicit Continue]
                goto J0x231;
            }
            // End:0x1A0
            if(IsTargetInFrontOfPlayer(C, Go, ScreenPos, camLoc, camRot))
            {
                C.DrawColor.A = 128;
                DrawActorTracking_Obstructed(C, Go, Go.bOptionalObjective, camLoc, ScreenPos);
                DrawObjectiveStatusOverlay(C, Go.GetObjectiveProgress(), false, ScreenPos, ObjectiveScale * 0.6700000);
                // End:0x19D
                if(Go.IsCritical())
                {
                    DrawCriticalObjectiveOverlay(C, ScreenPos, ObjectiveScale);
                }
                // [Explicit Continue]
                goto J0x231;
            }
            // End:0x231
            if(bDrawAllObjectives)
            {
                DrawActorTracking_Behind(C, Go, Go.bOptionalObjective, camLoc, camRot, ScreenPos);
                DrawObjectiveStatusOverlay(C, Go.GetObjectiveProgress(), false, ScreenPos, ObjectiveScale * 0.6700000);
                // End:0x231
                if(Go.IsCritical())
                {
                    DrawCriticalObjectiveOverlay(C, ScreenPos, ObjectiveScale * 0.6000000);
                }
            }
        }
        J0x231:

        i++;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
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
    if(bFadeOut && ((Level.TimeSeconds - Go.LastDrawTime) > (Global_Delta * 6.0000000)) || Go.DrawTime > OBJ_ReAppearTime)
    {
        Go.DrawTime = 0.0000000;
    }
    Go.DrawTime += Global_Delta;
    Go.LastDrawTime = Level.TimeSeconds;
    // End:0x35D
    if(!bFadeOut || Go.DrawTime <= OBJ_FadedOutTime)
    {
        // End:0x137
        if(bFadeOut && Go.DrawTime > (OBJ_FadedOutTime - 1.0000000))
        {
            FadeOutEffect = OBJ_FadedOutTime - Go.DrawTime;            
        }
        else
        {
            FadeOutEffect = 1.0000000;
        }
        C.DrawColor = ObjColor * FadeOutEffect;
        // End:0x19C
        if(int(bProgressPulsing) == 0)
        {
            C.DrawColor.A = byte(float(63) + ((float(128) * fPulse) * FadeOutEffect));            
        }
        else
        {
            C.DrawColor.A = byte(float(127) * FadeOutEffect);
        }
        AppearEffect = 0.5000000 / FMin(Go.DrawTime, 0.5000000);
        tileX = (((64.0000000 * ResScaleX) * AppearEffect) * ObjectiveScale) * HudScale;
        tileY = (((64.0000000 * ResScaleY) * AppearEffect) * ObjectiveScale) * HudScale;
        C.Style = 5;
        C.SetPos(ScreenPos.X - (tileX * 0.5000000), ScreenPos.Y - (tileY * 0.5000000));
        // End:0x30E
        if(Go.IsA('UseObjective'))
        {
            // End:0x2E2
            if(Go.UseDescription != "")
            {
                UseString = (IP_Bracket_Open @ Go.UseDescription) @ IP_Bracket_Close;
                C.Font = GetConsoleFont(C);
            }
            Draw_2DCollisionBox(C, Go, ScreenPos, UseString, Go.DrawScale, false);            
        }
        else
        {
            // End:0x35D
            if(Go.ObjectiveTypeIcon != none)
            {
                C.DrawTile(Go.ObjectiveTypeIcon, tileX, tileY, 0.0000000, 0.0000000, 64.0000000, 64.0000000);
            }
        }
    }
    ProgressPct = Go.GetObjectiveProgress();
    // End:0x3B5
    if(ProgressPct > float(0))
    {
        ScreenPos.Y -= (float(48) * ResScaleX);
        DrawHealthBar(C, ScreenPos, ProgressPct, 1.0000000, ObjColor);
    }
    //return;    
}

simulated function DrawCriticalObjectiveOverlay(Canvas C, Vector ScreenPos, float Scale)
{
    //return;    
}

simulated function DrawObjectiveStatusOverlay(Canvas C, float Progress, bool bCriticalFlash, Vector ScreenPos, float Scale)
{
    //return;    
}

simulated function DrawObjectiveIcon(Canvas C, bool bOptionalObjective, float PosX, float PosY, float tileX, float tileY)
{
    //return;    
}

simulated function TexRotator Get_BehindObjectiveArrow()
{
    local TexRotator Arrow;

    // End:0x8A
    if((BehindObjectiveArrows.Length <= int(BehindObjectiveCount)) || BehindObjectiveArrows[int(BehindObjectiveCount)] == none)
    {
        Arrow = TexRotator(Level.ObjectPool.AllocateObject(Class'Engine.TexRotator'));
        Arrow.UOffset = 64.0000000;
        Arrow.VOffset = 64.0000000;
        BehindObjectiveArrows[int(BehindObjectiveCount)] = Arrow;
    }
    return BehindObjectiveArrows[int(BehindObjectiveCount)];
    //return;    
}

simulated function Release_BehindObjectiveArrows()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x44 [Loop If]
    if(i < BehindObjectiveArrows.Length)
    {
        Level.ObjectPool.FreeObject(BehindObjectiveArrows[i]);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function Draw3dObjectiveArrow(Canvas C)
{
    //return;    
}

simulated function Release_ObjectivePointingArrow()
{
    // End:0x17
    if(OBJPointingArrow != none)
    {
        OBJPointingArrow.Destroy();
    }
    //return;    
}

simulated function DrawHealthBar(Canvas C, Vector HBScreenPos, float Health, float MaxHealth, Color ObjColor)
{
    //return;    
}

simulated function bool CheckObjectivePriority(GameObjective Go)
{
    // End:0x1E
    if(int(Go.ObjectivePriority) <= int(ObjectiveProgress))
    {
        return true;
    }
    return false;
    //return;    
}

final simulated function bool IsObjectiveVisible(Canvas C, GameObjective Target, out Vector ScreenPos, Vector camLoc, Rotator camRot)
{
    local Vector TargetLocation, TargetDir;
    local float dist;

    // End:0x50
    if((!Target.bOverrideZoneCheck && PawnOwner != none) && PawnOwner.Region.Zone != Target.Region.Zone)
    {
        return false;
    }
    dist = VSize(Target.Location - camLoc);
    // End:0x9F
    if((Target.DrawDistThresHold > float(0)) && dist > Target.DrawDistThresHold)
    {
        return false;
    }
    // End:0xC5
    if(!IsTargetInFrontOfPlayer(C, Target, ScreenPos, camLoc, camRot))
    {
        return false;
    }
    // End:0x14E
    if(!Target.bOverrideVisibilityCheck)
    {
        TargetDir = Target.Location - camLoc;
        TargetDir.Z = 0.0000000;
        TargetLocation = Target.Location - ((2.0000000 * Target.CollisionRadius) * Vector(Rotator(TargetDir)));
        // End:0x14E
        if(!FastTrace(TargetLocation, camLoc))
        {
            return false;
        }
    }
    return true;
    //return;    
}

event AnnouncementPlayed(string AnnouncerSound, byte Switch)
{
    local int i;

    // End:0x18
    if(int(Switch) == 200)
    {
        HighlightCurrentObjective(true);        
    }
    else
    {
        // End:0x30
        if(int(Switch) == 201)
        {
            HighlightCurrentObjective(false);            
        }
        else
        {
            // End:0x16F
            if(int(Switch) == 210)
            {
                i = 0;
                J0x45:

                // End:0x16F [Loop If]
                if(i < MTrigger.Length)
                {
                    // End:0x165
                    if((MTrigger[i].AnnouncerSound != none) && string(MTrigger[i].AnnouncerSound.Name) == AnnouncerSound)
                    {
                        // End:0xEB
                        if(MTrigger[i].Message != "")
                        {
                            PlayerOwner.TeamMessage(PlayerOwner.PlayerReplicationInfo, MTrigger[i].Message, 'CriticalEvent');
                        }
                        // End:0x162
                        if(CurrentObjective != none)
                        {
                            // End:0x12C
                            if((CurrentObjective.Announcer_ObjectiveInfo != "") && CurrentObjective.Announcer_ObjectiveInfo == AnnouncerSound)
                            {
                                HighlightCurrentObjective(true);
                            }
                            // End:0x162
                            if((CurrentObjective.Announcer_DefendObjective != "") && CurrentObjective.Announcer_DefendObjective == AnnouncerSound)
                            {
                                HighlightCurrentObjective(true);
                            }
                        }
                        // [Explicit Break]
                        goto J0x16F;
                    }
                    i++;
                    // [Loop Continue]
                    goto J0x45;
                }
            }
        }
    }
    J0x16F:

    //return;    
}

simulated function HighlightCurrentObjective(bool bShowWayPoint)
{
    AttackerProgressUpdateTime = ObjectiveProgressPulseTime;
    // End:0x54
    if(((bShowWillowWhisp && bShowWayPoint) && PlayerOwner != none) && UnrealPlayer(PlayerOwner) != none)
    {
        UnrealPlayer(PlayerOwner).ServerShowPathToBase(255);
    }
    //return;    
}

simulated function NotifyUpdatedObjective()
{
    local GameObjective OldObjective;

    OldObjective = CurrentObjective;
    CurrentObjective = none;
    CurrentObjective = GetCurrentObjective();
    // End:0x41
    if((OldObjective != CurrentObjective) && CurrentObjective != none)
    {
        HighlightCurrentObjective(false);
    }
    //return;    
}

simulated function GameObjective GetCurrentObjective()
{
    local GameObjective Go;
    local int i;

    // End:0xB1
    if((CurrentObjective == none) && ASGRI != none)
    {
        i = 0;
        J0x1F:

        // End:0xB1 [Loop If]
        if(i < obj.Length)
        {
            Go = obj[i];
            // End:0xA7
            if(((int(ASGRI.ObjectiveProgress) == int(Go.ObjectivePriority)) && Go.IsActive()) && !Go.bOptionalObjective || CurrentObjective == none)
            {
                CurrentObjective = Go;
            }
            i++;
            // [Loop Continue]
            goto J0x1F;
        }
    }
    return CurrentObjective;
    //return;    
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
    //return;    
}

simulated function DrawInfoPods(Canvas C)
{
    local InfoPod IP;
    local Vector IPScreenPos, camLoc;
    local int i;
    local Rotator camRot;

    // End:0x27
    if(((ASGRI == none) || PawnOwner == none) || PlayerOwner == none)
    {
        return;
    }
    C.GetCameraLocation(camLoc, camRot);
    i = 0;
    J0x47:

    // End:0x339 [Loop If]
    if(i < InfoPods.Length)
    {
        IP = InfoPods[i];
        // End:0x8A
        if((IP == none) || IP.bDisabled)
        {
            // [Explicit Continue]
            goto J0x32F;
        }
        // End:0x127
        if(int(IP.Team) != int(0))
        {
            // End:0xE4
            if((int(IP.Team) == int(1)) && ASGRI.IsDefender(byte(PawnOwner.GetTeamNum())))
            {
                // [Explicit Continue]
                goto J0x32F;
            }
            // End:0x127
            if((int(IP.Team) == int(2)) && !ASGRI.IsDefender(byte(PawnOwner.GetTeamNum())))
            {
                // [Explicit Continue]
                goto J0x32F;
            }
        }
        // End:0x152
        if(!IP.IsInfoPodVisible(C, PawnOwner, camLoc, camRot))
        {
            // [Explicit Continue]
            goto J0x32F;
        }
        IPScreenPos = C.WorldToScreen(IP.Location);
        // End:0x1A9
        if((IPScreenPos.X <= float(0)) || IPScreenPos.X >= C.ClipX)
        {
            // [Explicit Continue]
            goto J0x32F;
        }
        // End:0x1DD
        if((IPScreenPos.Y <= float(0)) || IPScreenPos.Y >= C.ClipY)
        {
            // [Explicit Continue]
            goto J0x32F;
        }
        // End:0x20D
        if(int(IP.Team) == int(0))
        {
            C.DrawColor = WhiteColor;            
        }
        else
        {
            C.DrawColor = GetTeamColor(byte(PawnOwner.GetTeamNum()));
        }
        switch(IP.InfoEffect)
        {
            // End:0x297
            case 1:
                C.DrawColor.A = byte((float(IP.DrawOpacity) * 0.5000000) + (float(int(IP.DrawOpacity) * 2) * fBlink));
                // End:0x311
                break;
            // End:0x2EC
            case 2:
                C.DrawColor.A = byte((float(IP.DrawOpacity) * 0.5000000) + ((float(IP.DrawOpacity) * 0.5000000) * fPulse));
                // End:0x311
                break;
            // End:0xFFFF
            default:
                C.DrawColor.A = IP.DrawOpacity;
                break;
        }
        IP.Render(C, IPScreenPos, PlayerOwner);
        J0x32F:

        i++;
        // [Loop Continue]
        goto J0x47;
    }
    //return;    
}

static function DrawCustomHealthInfo(Canvas C, PlayerController PC, bool bSkaarj)
{
    //return;    
}

function bool CustomHUDColorAllowed()
{
    return false;
    //return;    
}

static function Color GetTeamColor(byte Team)
{
    // End:0x16
    if(int(Team) == 0)
    {
        return default.HudColorRed;        
    }
    else
    {
        // End:0x2C
        if(int(Team) == 1)
        {
            return default.HudColorBlue;            
        }
        else
        {
            return default.GreenColor;
        }
    }
    //return;    
}

simulated function Color GetObjectiveColor(GameObjective Go, optional out byte bProgressPulsing)
{
    local Color ObjColor;

    ObjColor = GetTeamColor(Go.DefenderTeamIndex);
    // End:0x57
    if(Go.IsCritical())
    {
        ObjColor = (ObjColor * (float(1) - fPulse)) + (GoldColor * fPulse);        
    }
    else
    {
        // End:0xA8
        if(!Go.bOptionalObjective)
        {
            // End:0xA8
            if(AttackerProgressUpdateTime > float(0))
            {
                ObjColor = (ObjColor * (float(1) - fPulse)) + (WhiteColor * fPulse);
                bProgressPulsing = 1;
            }
        }
    }
    return ObjColor;
    //return;    
}

static function Color GetGYRColorRamp(float Pct)
{
    local Color GYRColor;

    GYRColor.A = byte(255);
    // End:0x6C
    if(Pct < 0.3400000)
    {
        GYRColor.R = byte(float(128) + (float(127) * FClamp(3.0000000 * Pct, 0.0000000, 1.0000000)));
        GYRColor.G = 0;
        GYRColor.B = 0;        
    }
    else
    {
        // End:0xCC
        if(Pct < 0.6700000)
        {
            GYRColor.R = byte(255);
            GYRColor.G = byte(float(255) * FClamp(3.0000000 * (Pct - 0.3300000), 0.0000000, 1.0000000));
            GYRColor.B = 0;            
        }
        else
        {
            GYRColor.R = byte(float(255) * FClamp(3.0000000 * (1.0000000 - Pct), 0.0000000, 1.0000000));
            GYRColor.G = byte(255);
            GYRColor.B = 0;
        }
    }
    return GYRColor;
    //return;    
}

static function Draw_2DCollisionBox(Canvas C, Actor A, Vector ScrPos, string Description, float ColExpand, bool bSizeOverride)
{
    local Vector TmpScrCorner[2], ScrCornerY, ScrCornerX;
    local float XL, YL, X, Y, BXL, BYL;

    local Vector CameraLocation;
    local Rotator CameraRotation;

    C.GetCameraLocation(CameraLocation, CameraRotation);
    C.Style = 5;
    // End:0xB7
    if(CameraLocation.Z < A.Location.Z)
    {
        ScrCornerY[0] = GetScreenCorner(C, A, vect(1.0000000, 0.0000000, 1.0000000), ScrPos, CameraRotation, ColExpand);
        ScrCornerY[1] = GetScreenCorner(C, A, vect(-1.0000000, 0.0000000, -1.0000000), ScrPos, CameraRotation, ColExpand);        
    }
    else
    {
        ScrCornerY[0] = GetScreenCorner(C, A, vect(-1.0000000, 0.0000000, 1.0000000), ScrPos, CameraRotation, ColExpand);
        ScrCornerY[1] = GetScreenCorner(C, A, vect(1.0000000, 0.0000000, -1.0000000), ScrPos, CameraRotation, ColExpand);
    }
    TmpScrCorner[0] = GetScreenCorner(C, A, vect(0.0000000, 1.0000000, 1.0000000), ScrPos, CameraRotation, ColExpand);
    TmpScrCorner[1] = GetScreenCorner(C, A, vect(0.0000000, 1.0000000, -1.0000000), ScrPos, CameraRotation, ColExpand);
    ScrCornerX[0].X = float(Max(int(TmpScrCorner[0].X), int(TmpScrCorner[1].X)));
    TmpScrCorner[0] = GetScreenCorner(C, A, vect(0.0000000, -1.0000000, 1.0000000), ScrPos, CameraRotation, ColExpand);
    TmpScrCorner[1] = GetScreenCorner(C, A, vect(0.0000000, -1.0000000, -1.0000000), ScrPos, CameraRotation, ColExpand);
    ScrCornerX[1].X = float(Max(int(TmpScrCorner[0].X), int(TmpScrCorner[1].X)));
    // End:0x38E
    if(Description != "")
    {
        C.StrLen(Description, XL, YL);
        TmpScrCorner[0].X = ScrPos.X - ScrCornerX[0].X;
        TmpScrCorner[0].Y = (ScrPos.Y - ScrCornerY[0].Y) - YL;
        // End:0x2E7
        if(TmpScrCorner[0].X < float(0))
        {
            TmpScrCorner[0].X = 0.0000000;
        }
        // End:0x32F
        if((TmpScrCorner[0].X + XL) > C.ClipX)
        {
            TmpScrCorner[0].X = C.ClipX - XL;
        }
        // End:0x355
        if(TmpScrCorner[0].Y < float(0))
        {
            TmpScrCorner[0].Y = 0.0000000;
        }
        C.SetPos(TmpScrCorner[0].X, TmpScrCorner[0].Y);
        C.DrawText(Description, false);
    }
    BXL = (16.0000000 * float(C.SizeX)) / 640.0000000;
    BYL = (16.0000000 * float(C.SizeY)) / 480.0000000;
    // End:0x439
    if((ScrCornerX[0].X + ScrCornerX[1].X) < BXL)
    {
        // End:0x407
        if(!bSizeOverride)
        {
            return;
        }
        ScrCornerX[0].X = BXL * 0.5000000;
        ScrCornerX[1].X = BXL * 0.5000000;
    }
    // End:0x49C
    if((ScrCornerY[0].Y + ScrCornerY[1].Y) < BYL)
    {
        // End:0x46A
        if(!bSizeOverride)
        {
            return;
        }
        ScrCornerY[0].Y = BYL * 0.5000000;
        ScrCornerY[1].Y = BYL * 0.5000000;
    }
    //return;    
}

static function Vector GetScreenCorner(Canvas C, Actor A, Vector CornerVect, Vector IPScrO, Rotator CameraRotation, float ColExpand)
{
    local Vector IPDir, IPCorner, IPScreenCorner;

    IPDir = float(-1) * Vector(CameraRotation);
    IPDir.Z = 0.0000000;
    IPCorner = CornerVect >> Normalize(Rotator(IPDir));
    IPCorner.X *= (A.CollisionRadius * ColExpand);
    IPCorner.Y *= (A.CollisionRadius * ColExpand);
    IPCorner.Z *= (A.CollisionHeight * ColExpand);
    IPScreenCorner = C.WorldToScreen(A.Location + IPCorner);
    IPScreenCorner.X = Abs(IPScreenCorner.X - IPScrO.X);
    IPScreenCorner.Y = Abs(IPScreenCorner.Y - IPScrO.Y);
    return IPScreenCorner;
    //return;    
}

simulated function DrawTextWithBackground(Canvas C, string Text, Color TextColor, float XO, float YO)
{
    //return;    
}

simulated function Tick(float DeltaTime)
{
    super.Tick(DeltaTime);
    Global_Delta = DeltaTime;
    fBlink += DeltaTime;
    J0x22:

    // End:0x40 [Loop If]
    if(fBlink > 0.5000000)
    {
        fBlink -= 0.5000000;
        // [Loop Continue]
        goto J0x22;
    }
    fPulse = Abs(1.0000000 - (float(4) * fBlink));
    // End:0x94
    if((ASGRI == none) && PlayerOwner.GameReplicationInfo != none)
    {
        ASGRI = ASGameReplicationInfo(PlayerOwner.GameReplicationInfo);
    }
    // End:0xCE
    if((PawnOwner != none) && PawnOwner.PlayerReplicationInfo != none)
    {
        ASPRI = ASPlayerReplicationInfo(PawnOwner.PlayerReplicationInfo);
    }
    AttackerProgressUpdateTime = FMax(AttackerProgressUpdateTime - Global_Delta, 0.0000000);
    // End:0x160
    if(ASGRI != none)
    {
        ObjectiveProgress = ASGRI.ObjectiveProgress;
        // End:0x160
        if(((int(OldObjectiveProgress) != int(ObjectiveProgress)) || CurrentObjective == none) || !CurrentObjective.IsActive())
        {
            NotifyUpdatedObjective();
            // End:0x160
            if(int(OldObjectiveProgress) != int(ObjectiveProgress))
            {
                OldObjectiveProgress = ObjectiveProgress;
            }
        }
    }
    // End:0x198
    if(int(PrevTeam) != PlayerOwner.GetTeamNum())
    {
        TeamChanged();
        PrevTeam = byte(PlayerOwner.GetTeamNum());
    }
    //return;    
}

simulated event TeamChanged()
{
    bForceSpawnNotification = true;
    //return;    
}

simulated function DrawPracticeRoundInfo(Canvas C)
{
    local Color myColor;
    local float Seconds;

    // End:0x3D
    if((((PlayerOwner == none) || ASGRI == none) || ScoreBoard == none) || ASGRI.RoundTimeLimit == 0)
    {
        return;
    }
    C.Font = GetFontSizeIndex(C, 0);
    C.Style = 5;
    myColor = (GoldColor * (1.0000000 - fPulse)) + (WhiteColor * fPulse);
    Seconds = float(Max(0, (ASGRI.RoundTimeLimit - ASGRI.RoundStartTime) + ASGRI.RemainingTime));
    // End:0xFB
    if(int(ASGRI.RoundWinner) != int(0))
    {
        Seconds = float(ASGRI.RoundOverTime);
    }
    DrawTextWithBackground(C, PracticeRoundString @ ScoreBoard.FormatTime(int(Seconds)), myColor, C.ClipX * 0.5000000, C.ClipY * 0.6700000);
    //return;    
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
    if(int(ASGRI.RoundWinner) != int(0))
    {
        return;
    }
    RemainingRoundTime = (ASGRI.RoundTimeLimit - ASGRI.RoundStartTime) + ASGRI.RemainingTime;
    // End:0x86
    if(ASGRI.RoundTimeLimit == 0)
    {
        super(HudCDeathmatch).CheckCountdown(ASGRI);
    }
    // End:0xBF
    if(((RemainingRoundTime < 1) || RemainingRoundTime == OldRemainingRoundTime) || int(ASGRI.RoundWinner) != int(0))
    {
        return;
    }
    OldRemainingRoundTime = RemainingRoundTime;
    // End:0xDB
    if(OldRemainingRoundTime > 300)
    {
        return;
    }
    // End:0x18F
    if(OldRemainingRoundTime > 30)
    {
        // End:0x113
        if(OldRemainingRoundTime == 300)
        {
            PlayerOwner.QueueAnnouncement(string(LongCountName[0]), 1);            
        }
        else
        {
            // End:0x13C
            if(OldRemainingRoundTime == 180)
            {
                PlayerOwner.QueueAnnouncement(string(LongCountName[1]), 1);                
            }
            else
            {
                // End:0x166
                if(OldRemainingRoundTime == 120)
                {
                    PlayerOwner.QueueAnnouncement(string(LongCountName[2]), 1);                    
                }
                else
                {
                    // End:0x18D
                    if(OldRemainingRoundTime == 60)
                    {
                        PlayerOwner.QueueAnnouncement(string(LongCountName[3]), 1);
                    }
                }
            }
        }
        return;
    }
    // End:0x1B9
    if(OldRemainingRoundTime == 30)
    {
        PlayerOwner.QueueAnnouncement(string(LongCountName[4]), 1);        
    }
    else
    {
        // End:0x1E5
        if(OldRemainingRoundTime == 20)
        {
            PlayerOwner.QueueAnnouncement(string(LongCountName[5]), 1, 2);            
        }
        else
        {
            // End:0x223
            if((OldRemainingRoundTime <= 10) && OldRemainingRoundTime > 0)
            {
                PlayerOwner.QueueAnnouncement(string(CountDownName[OldRemainingRoundTime - 1]), 1, 3, 1);
            }
        }
    }
    //return;    
}

simulated function string GetInfoString()
{
    local string InfoString;

    // End:0x11
    if(ASGRI == none)
    {
        return NoGameReplicationInfoString;
    }
    // End:0x3A
    if(int(ASGRI.RoundWinner) != int(0))
    {
        return ASGRI.GetRoundWinnerString();
    }
    // End:0x6B
    if(GUIController(PlayerOwner.Player.GUIController).ActivePage != none)
    {
        return AtMenus;
    }
    // End:0xC1
    if((ASPRI != none) && ASPRI.bAutoRespawn)
    {
        InfoString = Class'UT2k4Assault_Decompressed.ScoreBoard_Assault'.default.AutoRespawn;
        InfoString = InfoString @ string(ASGRI.ReinforcementCountDown);
        return InfoString;
    }
    // End:0x14A
    if((ASGRI.ReinforcementCountDown > 0) && !PlayerOwner.IsInState('PlayerWaiting'))
    {
        // End:0x116
        if(PlayerOwner.IsDead())
        {
            InfoString = Class'UT2k4Assault_Decompressed.ScoreBoard_Assault'.default.WaitForReinforcements;            
        }
        else
        {
            InfoString = Class'UT2k4Assault_Decompressed.ScoreBoard_Assault'.default.WaitingToSpawnReinforcements;
        }
        InfoString = InfoString @ string(ASGRI.ReinforcementCountDown);        
    }
    else
    {
        InfoString = super(HudCDeathmatch).GetInfoString();
    }
    return InfoString;
    //return;    
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
    foreach AllActors(Class'UT2k4Assault_Decompressed.PlayerSpawnManager', PSM)
    {
        Log((((("PlayerSpawnManager:" @ string(PSM)) @ "bEnabled:") @ string(PSM.bEnabled)) @ "Tag:") @ string(PSM.Tag));
        // End:0x137
        if(PSM.bEnabled)
        {
            N = Level.NavigationPointList;
            J0xC6:

            // End:0x137 [Loop If]
            if(N != none)
            {
                ps = PlayerStart(N);
                // End:0xEF
                if(ps == none)
                {                    
                }
                else
                {
                    // End:0x120
                    if(int(ps.TeamNumber) == PSM.PlayerStartTeam)
                    {
                        Log(" " @ string(ps));
                    }
                }
                N = N.nextNavigationPoint;
                // [Loop Continue]
                goto J0xC6;
            }
        }        
    }    
    Log("==============");
    Log("End...........");
    Log("==============");
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super(HudCDeathmatch).UpdatePrecacheMaterials();
    //return;    
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
    //return;    
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
    J0x41:

    C.Font = GetFontSizeIndex(C, FontIndex--);
    C.TextSize(LevelTitle, XL, YL);
    // End:0x41
    if(!((XL < (C.ClipX * 0.6700000)) && YL < (C.ClipY * 0.6700000)))
        goto J0x41;
    // End:0xE3
    if(IntroTitleFade < float(1))
    {
        C.DrawColor.A = 0;        
    }
    else
    {
        // End:0x121
        if(IntroTitleFade < float(3))
        {
            C.DrawColor.A = byte(float(255) * ((IntroTitleFade - float(1)) * 0.5000000));            
        }
        else
        {
            // End:0x166
            if(IntroTitleFade > float(6))
            {
                C.DrawColor.A = byte(float(255) * (1.0000000 - ((IntroTitleFade - float(6)) / float(4))));                
            }
            else
            {
                C.DrawColor.A = byte(255);
            }
        }
    }
    C.SetPos((C.ClipX - XL) * 0.5000000, (C.ClipY - YL) * 0.5000000);
    C.DrawText(LevelTitle, false);
    //return;    
}

defaultproperties
{
    ObjectiveScale=1.0000000
    bOnHUDObjectiveNotification=true
    bShowInfoPods=true
    bShow3DArrow=true
    bObjectiveReminder=true
    bDrawRadar=true
    bDrawRadarCardinalPoints=true
    bShowWillowWhisp=true
    OBJ_ReAppearTime=7.0000000
    OBJ_FadedOutTime=6.0000000
    ASRadarScale=0.2000000
    ASRadarPosX=0.9000000
    ASRadarPosY=0.2000000
    HealthBarWidth=80.0000000
    HealthBarHeight=8.0000000
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
    ObjectiveProgressPulseTime=7.0000000
    ObjectiveProgress=255
    OldObjectiveProgress=255
    HudColorHighLight=(R=255,G=192,B=32,A=255)
}