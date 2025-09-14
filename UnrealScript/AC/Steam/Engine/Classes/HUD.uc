/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\HUD.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:91
 *	Functions:122
 *
 *******************************************************************************/
class HUD extends Actor
    dependson(HudOverlay)
    dependson(DamageType)
    dependson(Console)
    dependson(Player)
    dependson(ScoreBoard)
    dependson(ReachSpec)
    dependson(GameReplicationInfo)
    dependson(wMatchUserInfo)
    dependson(AIController)
    dependson(wGameStateStorageSender)
    dependson(FailedConnect)
    dependson(TeamInfo)
    native
    transient
    exportstructs
    notplaceable;

struct ConsoleMessage
{
    var string Text;
    var Color TextColor;
    var float MessageLife;
    var PlayerReplicationInfo PRI;
};

var() PlayerController PlayerOwner;
var() Pawn PawnOwner;
var() PlayerReplicationInfo PawnOwnerPRI;
var() Console PlayerConsole;
var() ScoreBoard ScoreBoard;
var() ScoreBoard ResultBoard;
var() ScoreBoard ResultBoardBooty;
var() ScoreBoard LocalStatsScreen;
var() Actor VoteMenu;
var Color WhiteColor;
var Color DefaultShadow;
var Color RedColor;
var Color GreenColor;
var Color CyanColor;
var Color BlueColor;
var Color GoldColor;
var Color PurpleColor;
var Color TurqColor;
var Color GrayColor;
var Color BlackColor;
var() bool bShowVoteMenu;
var() bool bHideHUD;
var() bool bShowScoreBoard;
var() bool bShowDebugInfo;
var() bool bDrawDebug;
var() bool bDrawDebug2;
var() bool bDrawDebug3;
var() bool bDrawDebug4;
var() bool bShowBadConnectionAlert;
var() bool bShowChanDebug;
var() bool bShowMapInfo;
var() bool bMessageBeep;
var() bool bShowWeaponInfo;
var() bool bShowPersonalInfo;
var() bool bShowPoints;
var() bool bShowWeaponBar;
var() bool bCrosshairShow;
var() bool bShowPortrait;
var() bool bShowPortraitVC;
var bool bNoEnemyNames;
var bool bSmallWeaponBar;
var bool bBuiltMOTD;
var bool bShowLocalStats;
var() Color ConsoleColor;
var PlayerReplicationInfo PortraitPRI;
var() string ProgressFontName;
var() Font ProgressFontFont;
var() localized string OverrideConsoleFontName;
var() Font OverrideConsoleFont;
var() float ProgressFadeTime;
var() Color MOTDColor;
var() float HudScale;
var() float HudOpacity;
var() float HudCanvasScale;
var() int CrosshairStyle;
var() float CrosshairScale;
var() float CrosshairOpacity;
var() Color CrossHairColor;
var transient float ResScaleX;
var transient float ResScaleY;
var int ConsoleMessageCount;
var int ConsoleFontSize;
var int MessageFontOffset;
var ConsoleMessage TextMessages[8];
var() float ConsoleMessagePosX;
var() float ConsoleMessagePosY;
var localized string FontArrayNames[9];
var Font FontArrayFonts[9];
var int FontScreenWidthMedium[9];
var int FontScreenWidthSmall[9];
var string MOTD[4];
var int MOTDState;
var float LastPickupTime;
var float LastAmmoPickupTime;
var float LastWeaponPickupTime;
var float LastHealthPickupTime;
var float LastArmorPickupTime;
var float LastHeliPickupTime;
var float LastUAVPickupTime;
var float LastAirStirkePickupTime;
var float DiedTime;
var float GoWalkingBeginTime;
var const float LastVoiceGain;
var const float LastVoiceGainTime;
var int LastPlayerIDTalking;
var const float LastPlayerIDTalkingTime;
var SceneSubtitles SubTitles;
var array<HudOverlay> Overlays;
var string SpecPlayerName;
var delegate<OnPostRender> __OnPostRender__Delegate;
var delegate<OnBuildMOTD> __OnBuildMOTD__Delegate;

// Export UHUD::execDraw3DLine(FFrame&, void* const)
native final function Draw3DLine(Vector Start, Vector End, Color LineColor);
// Export UHUD::execDrawBox(FFrame&, void* const)
native final function DrawBox(Vector Min, Vector Max, Color Color);
// Export UHUD::execDrawCircle(FFrame&, void* const)
native final function DrawCircle(Vector Base, Vector X, Vector Y, Color Color, float Radius, int NumSides);
// Export UHUD::execDrawSphere(FFrame&, void* const)
native final function DrawSphere(Vector Base, Color Color, float Radius, int NumDivisions);
// Export UHUD::execDrawDirectionalArrow(FFrame&, void* const)
native final function DrawDirectionalArrow(Vector InLocation, Rotator InRotation, Color InColor, float InDrawScale);
// Export UHUD::execDrawCanvasLine(FFrame&, void* const)
native final function DrawCanvasLine(float X1, float Y1, float X2, float Y2, Color LineColor);
// Export UHUD::execStaticDrawCanvasLine(FFrame&, void* const)
native static final function StaticDrawCanvasLine(Canvas C, float X1, float Y1, float X2, float Y2, Color LineColor);
function CalculateWorldPostionToMinimapPosition(Vector Location, out float mx, out float my);
function CalculateMinimapSize(out float fWidth, out float fHeight);
delegate OnPostRender(HUD Sender, Canvas C);
delegate OnBuildMOTD(HUD Sender);
function ChangeWeaponSlot6Hud(wWeapon newWeapon);
function ChangeWeaponSlot5Hud(wWeapon newWeapon, optional bool bAddSkill);
simulated function CacheSuppliesPositions(Actor act);
simulated function DeleteSuppliesPositions(Actor act);
simulated function AllDeleteSuppliesPositions();
simulated function PushGameNotice(string sGameNotice);
simulated function AllDeleteGameNotice();
simulated function PushAASNotice(string sNotice, float beginTime, byte byLevel);
simulated function AllDeleteAASNotice();
function DrawCustomBeacon(Canvas C, Pawn P, float ScreenLocX, float ScreenLocY)
{
    local Texture BeaconTex;
    local float XL, YL;

    BeaconTex = PlayerOwner.TeamBeaconTexture;
    // End:0x37
    if(BeaconTex == none || P.PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x95
    if(P.PlayerReplicationInfo.Team != none)
    {
        C.DrawColor = class'PlayerController'.default.TeamBeaconTeamColors[P.PlayerReplicationInfo.Team.TeamIndex];
    }
    // End:0xb4
    else
    {
        C.DrawColor = class'PlayerController'.default.TeamBeaconTeamColors[0];
    }
    C.StrLen(P.PlayerReplicationInfo.PlayerName, XL, YL);
    C.SetPos(ScreenLocX - 0.50 * XL, ScreenLocY - 0.1250 * float(BeaconTex.VSize) - YL);
    C.DrawText(P.PlayerReplicationInfo.PlayerName, true);
    C.SetPos(ScreenLocX - 0.1250 * float(BeaconTex.USize), ScreenLocY - 0.1250 * float(BeaconTex.VSize));
    C.DrawTile(BeaconTex, 0.250 * float(BeaconTex.USize), 0.250 * float(BeaconTex.VSize), 0.0, 0.0, float(BeaconTex.USize), float(BeaconTex.VSize));
}

simulated function BuildMOTD()
{
    local int i;
    local array<string> InMOTD;

    // End:0x16
    if(!bBuiltMOTD)
    {
        OnBuildMOTD(self);
    }
    // End:0x44
    if(bBuiltMOTD || PlayerOwner == none || PlayerOwner.GameReplicationInfo == none)
    {
        return;
    }
    bBuiltMOTD = true;
    PlayerOwner.SetProgressTime(6.0);
    Split(PlayerOwner.GameReplicationInfo.MessageOfTheDay, "|", InMOTD);
    i = 0;
    J0x88:
    // End:0xc7 [While If]
    if(i < InMOTD.Length && i < 4)
    {
        MOTD[i] = InMOTD[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x88;
    }
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    LinkActors();
    CreateKeyMenus();
    // End:0x26
    foreach AllActors(class'SceneSubtitles', SubTitles)
    {
        // End:0x26
        break;                
    }
}

function Reset()
{
    bShowVoteMenu = false;
    bShowScoreBoard = false;
    bShowMapInfo = false;
    super.Reset();
}

simulated function CreateKeyMenus();
simulated event Destroyed()
{
    // End:0x1e
    if(ScoreBoard != none)
    {
        ScoreBoard.Destroy();
        ScoreBoard = none;
    }
    // End:0x3c
    if(VoteMenu != none)
    {
        VoteMenu.Destroy();
        VoteMenu = none;
    }
    super.Destroyed();
}

exec function ShowScores()
{
    bShowScoreBoard = !bShowScoreBoard;
}

exec function HideScores()
{
    bShowScoreBoard = false;
}

exec function ShowMapInfo()
{
    bShowMapInfo = !bShowMapInfo;
}

exec function HideMapInfo()
{
    bShowMapInfo = false;
}

exec function ShowStats()
{
    bShowLocalStats = !bShowLocalStats;
}

exec function NextStats()
{
    // End:0x1a
    if(LocalStatsScreen != none)
    {
        LocalStatsScreen.NextStats();
    }
}

exec function ShowDebug()
{
    bShowDebugInfo = !bShowDebugInfo;
}

exec function ShowDebugChan()
{
    bShowChanDebug = !bShowChanDebug;
}

exec function ShowDebug1()
{
    bDrawDebug = !bDrawDebug;
}

exec function ShowDebug2()
{
    bDrawDebug2 = !bDrawDebug2;
}

exec function ShowDebug3()
{
    bDrawDebug3 = !bDrawDebug3;
}

simulated event WorldSpaceOverlays()
{
    // End:0x2a
    if(bShowDebugInfo && Pawn(PlayerOwner.ViewTarget) != none)
    {
        DrawRoute();
    }
}

function CheckCountdown(GameReplicationInfo GRI);
event ConnectFailure(string FailCode, string URL)
{
    PlayerOwner.ReceiveLocalizedMessage(class'FailedConnect', class'FailedConnect'.static.GetFailSwitch(FailCode));
}

function GetLocalStatsScreen();
simulated event PostRenderActors(Canvas Canvas)
{
    // End:0x17
    if(PawnOwner != none)
    {
        CanvasDrawActors(Canvas, false);
    }
}

function DrawDebug_GSSS(Canvas C, int X, out int Y, int dy)
{
    local wGameStateStorageSender GSSS;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_GSSS]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    // End:0xca
    if(PlayerOwner != none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    PlayerOwner.IDNum=" $ string(PlayerOwner.IDNum), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
    }
    // End:0x114
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    GSSS", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
    }
    // End:0x18d
    foreach DynamicActors(class'wGameStateStorageSender', GSSS)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("        GSSS.UserID=" $ string(GSSS.UserID), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
    Y += dy;
}

function DrawDebug_SpectatingAllPlayers(Canvas C, int X, out int Y, int dy)
{
    local Controller co;
    local PlayerController pco;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Spectating_AllPlayers]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    co = Level.ControllerList;
    J0x77:
    // End:0x50f [While If]
    if(co != none)
    {
        pco = PlayerController(co);
        // End:0x4f8
        if(pco != none)
        {
            C.BtrDrawTextJustifiedWithVolumeLineNoCache(pco.PlayerReplicationInfo.PlayerName $ ", state=" $ string(pco.GetStateName()) $ " behindV=" $ string(int(pco.bBehindView)) $ " freeCam=" $ string(int(pco.bFreeCam)) $ " freeCamera=" $ string(int(pco.bFreeCamera)), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            Y += dy;
            // End:0x221
            if(pco.ViewTarget == none || Pawn(pco.ViewTarget) == none || Pawn(pco.ViewTarget).PlayerReplicationInfo == none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ "NONE", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            }
            // End:0x292
            else
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ Pawn(pco.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            }
            Y += dy;
            // End:0x348
            if(pco.ViewTarget == none || PlayerController(pco.ViewTarget) == none || PlayerController(pco.ViewTarget).PlayerReplicationInfo == none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            }
            // End:0x3bb
            else
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ PlayerController(pco.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            }
            Y += dy;
            // End:0x475
            if(pco.RealViewTarget == none || PlayerController(pco.RealViewTarget) == none || PlayerController(pco.RealViewTarget).PlayerReplicationInfo == none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            }
            // End:0x4ec
            else
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ PlayerController(pco.RealViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            }
            Y += dy;
        }
        co = co.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x77;
    }
    Y += dy;
}

function DrawDebug_Spectating(Canvas C, int X, out int Y, int dy)
{
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Spectating]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache(" bFreeCamera=" $ string(int(PlayerOwner.bFreeCamera)) $ " bFreeCamSwivel=" $ string(int(PlayerOwner.bFreeCamSwivel)) $ " bFreeLook=" $ string(PlayerOwner.bFreeLook), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache(" bBehindView=" $ string(int(PlayerOwner.bBehindView)) @ "bFreeView=" $ string(int(PlayerOwner.bFreeView)), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    // End:0x237
    if(PlayerOwner.ViewTarget == none || Pawn(PlayerOwner.ViewTarget) == none || Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo == none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ "NONE", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    }
    // End:0x2a8
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    }
    Y += dy;
    // End:0x35e
    if(PlayerOwner.ViewTarget == none || PlayerController(PlayerOwner.ViewTarget) == none || PlayerController(PlayerOwner.ViewTarget).PlayerReplicationInfo == none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    }
    // End:0x3d1
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ PlayerController(PlayerOwner.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    }
    Y += dy;
    // End:0x48b
    if(PlayerOwner.RealViewTarget == none || PlayerController(PlayerOwner.RealViewTarget) == none || PlayerController(PlayerOwner.RealViewTarget).PlayerReplicationInfo == none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    }
    // End:0x502
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ PlayerController(PlayerOwner.RealViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    }
    Y += dy;
    Y += dy;
}

function DrawDebug_Time(Canvas C, int X, out int Y, int dy)
{
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Time]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RemainingTime=" $ string(Level.GRI.RemainingTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ElapsedTime=" $ string(Level.GRI.ElapsedTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    PostRemaiingTime=" $ string(Level.GRI.PostRemaiingTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    PostRemaiingTimeClient=" $ string(Level.GRI.PostRemaiingTimeClient), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    Y += dy;
}

function DrawDebug_Helicopter(Canvas C, int X, out int Y, int dy)
{
    local AIController H;
    local Inventory i;
    local float Max, cur;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Helicopter]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    // End:0x5bc
    foreach DynamicActors(class'AIController', H)
    {
        // End:0x5bb
        if(H.IsA('wHelicopterController'))
        {
            C.BtrDrawTextJustifiedWithVolumeLineNoCache(" cur iWeaponID=" $ string(H.Pawn.Weapon.BaseParams.iWeaponID), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
            Y += dy;
            i = H.Pawn.Inventory;
            J0x117:
            // End:0x5bb [While If]
            if(i != none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache(" iWeaponID=" $ string(wWeapon(i).BaseParams.iWeaponID), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bIsFiring=" $ string(wWeapon(i).FireMode[0].bIsFiring), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bFireOnRelease=" $ string(wWeapon(i).FireMode[0].bFireOnRelease), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bInstantStop=" $ string(wWeapon(i).FireMode[0].bInstantStop), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     HoldTime=" $ string(wWeapon(i).FireMode[0].HoldTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     MaxHoldTime=" $ string(wWeapon(i).FireMode[0].MaxHoldTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     CurrentTime=" $ string(Level.TimeSeconds), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     NextFireTime=" $ string(wWeapon(i).FireMode[0].NextFireTime), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bNowWaiting=" $ string(wWeapon(i).FireMode[0].bNowWaiting), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                wWeapon(i).GetAmmoCount(Max, cur);
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     AmmoAmount=" $ string(cur), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
                Y += dy;
                i = i.Inventory;
                // This is an implied JumpToken; Continue!
                goto J0x117;
            }
        }                
    }
    Y += dy;
}

function DrawDebug_AllPlayerStates(Canvas C, int X, out int Y, int dy)
{
    local Controller PC;
    local Pawn P;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_AllPlayerStates]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x131
    foreach DynamicActors(class'Controller', PC)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    Name=" $ PC.PlayerReplicationInfo.PlayerName $ " State=" $ string(PC.GetStateName()) $ " NumLives=" $ string(PC.PlayerReplicationInfo.NumLives), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
    // End:0x1e1
    foreach DynamicActors(class'Pawn', P)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    Pawn OwnerName=" $ P.OwnerName $ " Health=" $ string(P.Health) $ " state=" $ string(P.GetStateName()), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
    Y += dy;
}

function DrawDebug_AllPawnNetStates(Canvas C, int X, out int Y, int dy)
{
    local Pawn P;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_AllPawnNetStates]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x18b
    foreach DynamicActors(class'Pawn', P)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    Pawn OwnerName=" $ P.OwnerName $ " bTearOff=" $ string(P.bTearOff) $ " Chnl=" $ P.HasChannel() $ " ChkRTimeOut=" $ P.CheckRelevantTimeOut() $ " IsNetReady=" $ P.IsNetReady() $ " CanSee=" $ P.CanSee(), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
    Y += dy;
}

function DrawDebug(Canvas C, int X, out int Y, int dy)
{
    C.SetDrawColor(byte(255), byte(255), byte(255));
    DrawDebug_AllPlayerStates(C, X, Y, dy);
    DrawDebug_SpectatingAllPlayers(C, X, Y, dy);
    DrawDebug_Spectating(C, X, Y, dy);
    DrawDebug_HostPoint(C, X, Y, dy);
}

function DrawDebug_AllPlayerStates2(Canvas C, int X, out int Y, int dy)
{
    local Controller PC;
    local Pawn P;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_AllPlayerStates]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x17f
    foreach DynamicActors(class'Controller', PC)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    Name=" $ PC.PlayerReplicationInfo.PlayerName $ " Loc=(" $ string(PC.Pawn.Location.X) $ ", " $ string(PC.Pawn.Location.Y) $ ", " $ string(PC.Pawn.Location.Z) $ ") State=" $ string(PC.GetStateName()), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
    // End:0x28b
    foreach DynamicActors(class'Pawn', P)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    Pawn OwnerName=" $ P.OwnerName $ " Loc=(" $ string(P.Location.X) $ ", " $ string(P.Location.Y) $ ", " $ string(P.Location.Z) $ ") Health=" $ string(P.Health) $ " state=" $ string(P.GetStateName()), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
    Y += dy;
}

function DrawDebug2(Canvas C, int X, out int Y, int dy)
{
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug2 - HostPoint]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    DrawDebug_HostPoint(C, X, Y, dy);
}

function DrawDebug_HostPoint(Canvas C, int X, out int Y, int dy)
{
    local wMatchMaker kMM;
    local wMatchUserInfo kUserInfo;
    local int i;

    kMM = Level.GetMatchMaker();
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("  [My iAvgPing] :  " $ string(kMM.iAvgPing) $ "/ FPS : " $ string(kMM.iAvgFrameRate) $ "/ HostPoint : " $ string(kMM.GetHostPoint()) $ "/ nNatType : " $ string(kMM.nNatType), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("  [ PawnOwnerPRI.Ping ] :  " $ string(PawnOwnerPRI.Ping), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    i = 0;
    J0x173:
    // End:0x211 [While If]
    if(i < kMM.UserInfos.Length)
    {
        kUserInfo = kMM.UserInfos[i];
        // End:0x207
        if(kUserInfo != none)
        {
            // End:0x1e0
            if(kUserInfo.iReceivedPing > 100)
            {
                C.SetDrawColor(byte(255), 0, 0);
            }
            // End:0x1fb
            else
            {
                C.SetDrawColor(byte(255), byte(255), byte(255));
            }
            Y += dy;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x173;
    }
}

function DrawDebug3(Canvas C, int X, out int Y, int dy)
{
    local wMatchMaker kMM;
    local Pawn Wpn;

    C.SetDrawColor(byte(255), byte(255), byte(255));
    kMM = Level.GetMatchMaker();
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug3 for HK]", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
    Y += dy;
    // End:0x33b
    foreach DynamicActors(class'Pawn', Wpn)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("=========" @ Wpn.LoginName @ "=========", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("Loc = (" $ string(Wpn.Location.X) $ ", " $ string(Wpn.Location.Y) $ ", " $ string(Wpn.Location.Z) $ ")", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("Rot/DRot = (" $ string(Wpn.Rotation.Yaw) $ ", " $ string(Wpn.Rotation.Pitch) $ ", " $ string(Wpn.Rotation.Roll) $ "), (" $ string(Wpn.DesiredRotation.Yaw) $ ", " $ string(Wpn.DesiredRotation.Pitch) $ ", " $ string(Wpn.DesiredRotation.Roll) $ ")", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("Pivot = (" $ string(Wpn.PrePivot.X) $ ", " $ string(Wpn.PrePivot.Y) $ ", " $ string(Wpn.PrePivot.Z) $ ")", 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
}

simulated function ResetKillMessageTexture();
simulated function bool NeedToDrawSpectatingHud()
{
    return Level.GetMatchMaker().InGameOver != 0 || Level.GRI.bMatchOver || PlayerOwner == none || PawnOwner == none || PawnOwnerPRI == none || PlayerOwner.IsSpectating() && PlayerOwner.bBehindView || PlayerOwner.IsInState('RoundEnded');
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos);
simulated event PostRender(Canvas Canvas)
{
    local float XPos, YPos;
    local Plane OldModulate, OM;
    local Color OldColor;
    local int i, Y;
    local PlayerController PC;

    Canvas.Style = 5;
    Y = 180;
    BuildMOTD();
    OldModulate = Canvas.ColorModulate;
    OldColor = Canvas.DrawColor;
    Canvas.ColorModulate.X = 1.0;
    Canvas.ColorModulate.Y = 1.0;
    Canvas.ColorModulate.Z = 1.0;
    Canvas.ColorModulate.W = HudOpacity / float(255);
    LinkActors();
    ResScaleX = float(Canvas.SizeX) / 640.0;
    ResScaleY = float(Canvas.SizeY) / 480.0;
    // End:0x126
    if(PlayerOwner != none && PlayerOwner.GameReplicationInfo != none)
    {
        CheckCountdown(PlayerOwner.GameReplicationInfo);
    }
    // End:0x163
    if(bShowChanDebug)
    {
        PC = Level.GetLocalPlayerController();
        // End:0x163
        if(PC != none)
        {
            PC.DisplayDebugChan1(Canvas);
        }
    }
    // End:0x196
    if(PawnOwner != none && PawnOwner.bSpecialHUD)
    {
        PawnOwner.DrawHUD(Canvas);
    }
    // End:0x307
    if(bShowDebugInfo)
    {
        Canvas.Font = GetConsoleFont(Canvas);
        Canvas.Style = 5;
        Canvas.DrawColor = ConsoleColor;
        DisplayDebug(Canvas, XPos, YPos);
        PlayerOwner.ViewTarget.DisplayDebug(Canvas, XPos, YPos);
        // End:0x304
        if(PlayerOwner.ViewTarget != PlayerOwner && Pawn(PlayerOwner.ViewTarget) == none || Pawn(PlayerOwner.ViewTarget).Controller == none)
        {
            YPos += XPos * float(2);
            Canvas.SetPos(4.0, YPos);
            Canvas.DrawText("----- VIEWER INFO -----");
            YPos += XPos;
            Canvas.SetPos(4.0, YPos);
            PlayerOwner.DisplayDebug(Canvas, XPos, YPos);
        }
    }
    // End:0x6b7
    else
    {
        // End:0x6a1
        if(!bHideHUD)
        {
            // End:0x395
            if(bShowLocalStats)
            {
                // End:0x32c
                if(LocalStatsScreen == none)
                {
                    GetLocalStatsScreen();
                }
                // End:0x392
                if(LocalStatsScreen != none)
                {
                    OM = Canvas.ColorModulate;
                    Canvas.ColorModulate = OldModulate;
                    LocalStatsScreen.DrawScoreboard(Canvas);
                    DisplayMessages(Canvas);
                    Canvas.ColorModulate = OM;
                }
            }
            // End:0x674
            else
            {
                // End:0x419
                if(bShowScoreBoard)
                {
                    // End:0x416
                    if(ScoreBoard != none)
                    {
                        OM = Canvas.ColorModulate;
                        Canvas.ColorModulate = OldModulate;
                        ScoreBoard.DrawScoreboard(Canvas);
                        // End:0x402
                        if(ScoreBoard.bDisplayMessages)
                        {
                            DisplayMessages(Canvas);
                        }
                        Canvas.ColorModulate = OM;
                    }
                }
                // End:0x674
                else
                {
                    // End:0x492
                    if(bShowMapInfo)
                    {
                        OM = Canvas.ColorModulate;
                        Canvas.ColorModulate = OldModulate;
                        ScoreBoard.DrawMiniMap(Canvas);
                        // End:0x47b
                        if(ScoreBoard.bDisplayMessages)
                        {
                            DisplayMessages(Canvas);
                        }
                        Canvas.ColorModulate = OM;
                    }
                    // End:0x674
                    else
                    {
                        // End:0x4d8
                        if(ScoreBoard != none && Level.GetMatchMaker().GMLevelFlag & 2 == 2)
                        {
                            ScoreBoard.DrawGMUserBoard(Canvas);
                        }
                        // End:0x4ec
                        if(NeedToDrawSpectatingHud())
                        {
                            DrawSpectatingHud(Canvas);
                        }
                        // End:0x53f
                        if(PawnOwner != none && !PawnOwner.bHideRegularHUD || Level.GetMatchMaker().GMLevelFlag & 2 == 2)
                        {
                            DrawHUD(Canvas);
                        }
                        // End:0x569
                        if(PlayerOwner != none && bDrawDebug)
                        {
                            DrawDebug(Canvas, 20, Y, 15);
                        }
                        // End:0x593
                        if(PlayerOwner != none && bDrawDebug3)
                        {
                            DrawDebug3(Canvas, 20, Y, 15);
                        }
                        // End:0x5bd
                        if(PlayerOwner != none && bDrawDebug2)
                        {
                            DrawDebug2(Canvas, 20, Y, 15);
                        }
                        i = 0;
                        J0x5c4:
                        // End:0x5f8 [While If]
                        if(i < Overlays.Length)
                        {
                            Overlays[i].Render(Canvas);
                            ++ i;
                            // This is an implied JumpToken; Continue!
                            goto J0x5c4;
                        }
                        // End:0x655
                        if(!DrawLevelAction(Canvas))
                        {
                            // End:0x655
                            if(PlayerOwner != none)
                            {
                                // End:0x642
                                if(PlayerOwner.ProgressTimeOut > Level.TimeSeconds)
                                {
                                    DisplayProgressMessages(Canvas);
                                }
                                // End:0x655
                                else
                                {
                                    // End:0x655
                                    if(MOTDState == 1)
                                    {
                                        MOTDState = 2;
                                    }
                                }
                            }
                        }
                        // End:0x669
                        if(bShowBadConnectionAlert)
                        {
                            DisplayBadConnectionAlert(Canvas);
                        }
                        DisplayMessages(Canvas);
                    }
                }
            }
            // End:0x69e
            if(bShowVoteMenu && VoteMenu != none)
            {
                VoteMenu.RenderOverlays(Canvas);
            }
        }
        // End:0x6b7
        else
        {
            // End:0x6b7
            if(PawnOwner != none)
            {
                DrawInstructionGfx(Canvas);
            }
        }
    }
    PlayerOwner.RenderOverlays(Canvas);
    // End:0x6e8
    if(PlayerOwner.bViewingMatineeCinematic)
    {
        DrawCinematicHUD(Canvas);
    }
    // End:0x72e
    if(PlayerConsole != none && PlayerConsole.bTyping)
    {
        DrawTypingPrompt(Canvas, PlayerConsole.TypedStr, PlayerConsole.TypedStrPos);
    }
    Canvas.ColorModulate = OldModulate;
    Canvas.DrawColor = OldColor;
    DrawChangeHostGuest(Canvas);
    OnPostRender(self, Canvas);
    UpdateUAV();
}

function DrawChangeHostGuest(Canvas C);
function DrawDebugStates(Canvas C)
{
    local PlayerController PC;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    PC = PlayerOwner;
    // End:0x3fd
    if(PC != none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("BaseSpectating=" $ string(int(PC.IsInState('BaseSpectating'))), 0, 0.0, 200.0, C.ClipX, 215.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("     Scripting=" $ string(int(PC.IsInState('Scripting'))), 0, 0.0, 215.0, C.ClipX, 230.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    Spectating=" $ string(int(PC.IsInState('Spectating'))), 0, 0.0, 230.0, C.ClipX, 245.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("   AttractMode=" $ string(int(PC.IsInState('AttractMode'))), 0, 0.0, 245.0, C.ClipX, 260.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache(" PlayerWaiting=" $ string(int(PC.IsInState('PlayerWaiting'))), 0, 0.0, 260.0, C.ClipX, 275.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("   ChangedHost=" $ string(int(PC.IsInState('ChangedHost'))), 0, 0.0, 275.0, C.ClipX, 290.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("WaitingForPawn=" $ string(int(PC.IsInState('WaitingForPawn'))), 0, 0.0, 290.0, C.ClipX, 305.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("     GameEnded=" $ string(int(PC.IsInState('GameEnded'))), 0, 0.0, 305.0, C.ClipX, 315.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RoundEnded=" $ string(int(PC.IsInState('RoundEnded'))), 0, 0.0, 320.0, C.ClipX, 335.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("          Dead=" $ string(int(PC.IsInState('Dead'))), 0, 0.0, 335.0, C.ClipX, 350.0, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewPlayer=" $ string(int(PC.IsInState('ViewPlayer'))), 0, 0.0, 350.0, C.ClipX, 365.0, 10);
    }
}

simulated function DrawCinematicHUD(Canvas C)
{
    local int i;

    // End:0x27
    if(!bHideHUD && !bShowLocalStats && !bShowScoreBoard)
    {
        return;
    }
    i = 0;
    J0x2e:
    // End:0x62 [While If]
    if(i < Overlays.Length)
    {
        Overlays[i].Render(C);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x2e;
    }
}

simulated function DrawInstructionGfx(Canvas C);
simulated function SetInstructionText(string Text);
simulated function SetInstructionKeyText(string Text);
function CanvasDrawActors(Canvas C, bool bClearedZBuffer)
{
    // End:0x79
    if(!PlayerOwner.bBehindView)
    {
        // End:0x5f
        if(PawnOwner.Weapon != none)
        {
            // End:0x42
            if(!bClearedZBuffer)
            {
                C.DrawActor(none, false, true);
            }
            PawnOwner.Weapon.RenderOverlays(C);
        }
        PlayerOwner.RenderSpectatorFPWeapon(C, bClearedZBuffer);
    }
}

simulated function DrawRoute()
{
    local int i;
    local Controller C;
    local Vector Start, End, RealStart;
    local bool bPath;

    C = Pawn(PlayerOwner.ViewTarget).Controller;
    // End:0x2f
    if(C == none)
    {
        return;
    }
    // End:0x6c
    if(C.CurrentPath != none)
    {
        Start = C.CurrentPath.Start.Location;
    }
    // End:0x89
    else
    {
        Start = PlayerOwner.ViewTarget.Location;
    }
    RealStart = Start;
    // End:0xfe
    if(C.bAdjusting)
    {
        Draw3DLine(C.Pawn.Location, C.AdjustLoc, class'Canvas'.static.MakeColor(byte(255), 0, byte(255)));
        Start = C.AdjustLoc;
    }
    // End:0x2dc
    if(C == PlayerOwner || C.MoveTarget == C.RouteCache[0] && C.MoveTarget != none)
    {
        // End:0x1f8
        if(C == PlayerOwner && C.Destination != vect(0.0, 0.0, 0.0))
        {
            // End:0x1de
            if(C.pointReachable(C.Destination))
            {
                Draw3DLine(C.Pawn.Location, C.Destination, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
                return;
            }
            C.FindPathTo(C.Destination);
        }
        i = 0;
        J0x1ff:
        // End:0x29c [While If]
        if(i < 16)
        {
            // End:0x228
            if(C.RouteCache[i] == none)
            {
            }
            // End:0x29c
            else
            {
                bPath = true;
                Draw3DLine(Start, C.RouteCache[i].Location, class'Canvas'.static.MakeColor(0, byte(255), 0));
                Start = C.RouteCache[i].Location;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1ff;
            }
        }
        // End:0x2d9
        if(bPath)
        {
            Draw3DLine(RealStart, C.Destination, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }
    }
    // End:0x339
    else
    {
        // End:0x339
        if(PlayerOwner.ViewTarget.Velocity != vect(0.0, 0.0, 0.0))
        {
            Draw3DLine(RealStart, C.Destination, class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }
    }
    // End:0x34a
    if(C == PlayerOwner)
    {
        return;
    }
    // End:0x37e
    if(C.Focus != none)
    {
        End = C.Focus.Location;
    }
    // End:0x392
    else
    {
        End = C.FocalPoint;
    }
    Draw3DLine(PlayerOwner.ViewTarget.Location + Pawn(PlayerOwner.ViewTarget).BaseEyeHeight * vect(0.0, 0.0, 1.0), End, class'Canvas'.static.MakeColor(byte(255), 0, 0));
}

simulated function DisplayProgressMessages(Canvas C)
{
    local int i, LineCount;
    local GameReplicationInfo GRI;
    local float FontDX, FontDY, X, Y;
    local int Alpha;
    local float TimeLeft;

    TimeLeft = PlayerOwner.ProgressTimeOut - Level.TimeSeconds;
    // End:0x3e
    if(TimeLeft >= ProgressFadeTime)
    {
        Alpha = 255;
    }
    // End:0x5c
    else
    {
        Alpha = int(float(int(float(255) * TimeLeft)) / ProgressFadeTime);
    }
    GRI = PlayerOwner.GameReplicationInfo;
    LineCount = 0;
    i = 0;
    J0x7e:
    // End:0xb9 [While If]
    if(i < 4)
    {
        // End:0xa8
        if(PlayerOwner.ProgressMessage[i] == "")
        {
        }
        // End:0xaf
        else
        {
            ++ LineCount;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7e;
    }
    // End:0x126
    if(bBuiltMOTD && MOTDState < 2)
    {
        // End:0xe5
        if(MOTD[0] != "")
        {
            ++ LineCount;
        }
        // End:0xfa
        if(MOTD[1] != "")
        {
            ++ LineCount;
        }
        // End:0x110
        if(MOTD[2] != "")
        {
            ++ LineCount;
        }
        // End:0x126
        if(MOTD[3] != "")
        {
            ++ LineCount;
        }
    }
    C.Font = LoadProgressFont();
    C.Style = 5;
    C.TextSize("A", FontDX, FontDY);
    X = 0.50 * HudCanvasScale * float(C.SizeX) + 1.0 - HudCanvasScale / 2.0 * float(C.SizeX);
    Y = 0.50 * HudCanvasScale * float(C.SizeY) + 1.0 - HudCanvasScale / 2.0 * float(C.SizeY);
    Y -= FontDY * float(LineCount) / 2.0;
    i = 0;
    J0x21e:
    // End:0x30d [While If]
    if(i < 4)
    {
        // End:0x248
        if(PlayerOwner.ProgressMessage[i] == "")
        {
        }
        // End:0x303
        else
        {
            C.DrawColor = PlayerOwner.ProgressColor[i];
            C.DrawColor.A = byte(Alpha);
            C.TextSize(PlayerOwner.ProgressMessage[i], FontDX, FontDY);
            C.SetPos(X - FontDX / 2.0, Y);
            C.DrawText(PlayerOwner.ProgressMessage[i]);
            Y += FontDY;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x21e;
    }
    // End:0x3ff
    if(GRI != none && Level.NetMode != 0 && MOTDState < 2)
    {
        MOTDState = 1;
        C.DrawColor = MOTDColor;
        C.DrawColor.A = byte(Alpha);
        i = 0;
        J0x37e:
        // End:0x3ff [While If]
        if(i < 4)
        {
            C.TextSize(MOTD[i], FontDX, FontDY);
            C.SetPos(X - FontDX / 2.0, Y);
            C.DrawText(MOTD[i]);
            Y += FontDY;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x37e;
        }
    }
}

function ResetHud();
function DrawHUD(Canvas C);
function DrawSpectatingHud(Canvas C);
function DrawGMSpectatingHud(Canvas C);
function bool DrawLevelAction(Canvas C);
function CallSkill(optional int iKey, optional bool bRequire, optional bool iSucess);
function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2);
function CallRadioMessage(optional int iKey, optional int iReservation1, optional int iReservation2);
function TutorialEvent(coerce string S, optional name Type, optional name reserv);
function DisplayBadConnectionAlert(Canvas C);
function bool IsInCinematic();
simulated function LocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString);
simulated function LocalizedMessage2(class<LocalMessage> Message, optional int Switch, optional string CriticalString);
simulated function DrawTypingPrompt(Canvas C, string Text, optional int pos)
{
    local float XPos, YPos, XL, YL;

    C.Font = GetConsoleFont(C);
    C.Style = 5;
    C.DrawColor = ConsoleColor;
    C.TextSize("A", XL, YL);
    XPos = ConsoleMessagePosX * HudCanvasScale * float(C.SizeX) + 1.0 - HudCanvasScale * 0.50 * float(C.SizeX);
    YPos = ConsoleMessagePosY * HudCanvasScale * float(C.SizeY) + 1.0 - HudCanvasScale * 0.50 * float(C.SizeY) - YL;
    C.SetPos(XPos, YPos);
    C.DrawTextClipped("(>" @ Left(Text, pos) $ Chr(4) $ Eval(pos < Len(Text), Mid(Text, pos), "_"), true);
}

simulated function SetScoreBoardClass(class<ScoreBoard> ScoreboardClass, class<ScoreBoard> ResultBoardClass, class<ScoreBoard> ResultBoardBootyClass)
{
    // End:0x17
    if(ScoreBoard != none)
    {
        ScoreBoard.Destroy();
    }
    // End:0x2e
    if(ResultBoard != none)
    {
        ResultBoard.Destroy();
    }
    // End:0x45
    if(ResultBoardBooty != none)
    {
        ResultBoardBooty.Destroy();
    }
    // End:0x5a
    if(ScoreboardClass == none)
    {
        ScoreBoard = none;
    }
    // End:0xd9
    else
    {
        ScoreBoard = Spawn(ScoreboardClass, Owner);
        // End:0xc9
        if(ScoreBoard == none)
        {
            Log("Hud::SetScoreBoard(): Could not spawn a scoreboard of class " $ string(ScoreboardClass), 'Error');
        }
        // End:0xd9
        else
        {
            ScoreBoard.HudOwner = self;
        }
    }
    // End:0xee
    if(ResultBoardClass == none)
    {
        ResultBoard = none;
    }
    // End:0x11f
    else
    {
        ResultBoard = Spawn(ResultBoardClass, Owner);
        // End:0x10f
        if(ResultBoard == none)
        {
        }
        // End:0x11f
        else
        {
            ResultBoard.HudOwner = self;
        }
    }
    // End:0x134
    if(ResultBoardBootyClass == none)
    {
        ResultBoardBooty = none;
    }
    // End:0x165
    else
    {
        ResultBoardBooty = Spawn(ResultBoardBootyClass, Owner);
        // End:0x155
        if(ResultBoardBooty == none)
        {
        }
        // End:0x165
        else
        {
            ResultBoardBooty.HudOwner = self;
        }
    }
}

exec function ShowHud()
{
    bHideHUD = !bHideHUD;
    SaveConfig();
}

exec function ShowFont()
{
    Level.GetMatchMaker().bShowFont = !Level.GetMatchMaker().bShowFont;
    clog("bShowFont=" $ string(Level.GetMatchMaker().bShowFont));
}

simulated function LinkActors()
{
    PlayerOwner = PlayerController(Owner);
    // End:0x32
    if(PlayerOwner == none)
    {
        PlayerConsole = none;
        PawnOwner = none;
        PawnOwnerPRI = none;
        return;
    }
    // End:0x66
    if(PlayerOwner.Player != none)
    {
        PlayerConsole = PlayerOwner.Player.Console;
    }
    // End:0x6d
    else
    {
        PlayerConsole = none;
    }
    // End:0xc6
    if(Pawn(PlayerOwner.ViewTarget) != none && Pawn(PlayerOwner.ViewTarget).Health > 0)
    {
        PawnOwner = Pawn(PlayerOwner.ViewTarget);
    }
    // End:0xf8
    else
    {
        // End:0xf1
        if(PlayerOwner.Pawn != none)
        {
            PawnOwner = PlayerOwner.Pawn;
        }
        // End:0xf8
        else
        {
            PawnOwner = none;
        }
    }
    // End:0x130
    if(PawnOwner != none && PawnOwner.PlayerReplicationInfo != none)
    {
        PawnOwnerPRI = PawnOwner.PlayerReplicationInfo;
    }
    // End:0x144
    else
    {
        PawnOwnerPRI = PlayerOwner.PlayerReplicationInfo;
    }
}

simulated function Message(PlayerReplicationInfo PRI, coerce string Msg, name MsgType)
{
    // End:0x18
    if(bMessageBeep)
    {
        PlayerOwner.PlayBeepSound();
    }
    // End:0x59
    if(MsgType == 'Say' || MsgType == 'TeamSay')
    {
        Msg = PRI.PlayerName $ ": " $ Msg;
    }
    AddTextMessage(Msg, class'LocalMessage', PRI);
}

function DisplayPortrait(PlayerReplicationInfo PRI);
function DisplayMessages(Canvas C)
{
    local int i, j, XPos, YPos, MessageCount;

    local float XL, YL;

    i = 0;
    J0x07:
    // End:0xe6 [While If]
    if(i < ConsoleMessageCount)
    {
        // End:0x33
        if(TextMessages[i].Text == "")
        {
            // This is an implied JumpToken;
            goto J0xe6;
        }
        // End:0xdc
        else
        {
            // End:0xd5
            if(TextMessages[i].MessageLife < Level.TimeSeconds)
            {
                TextMessages[i].Text = "";
                // End:0xbc
                if(i < ConsoleMessageCount - 1)
                {
                    j = i;
                    J0x86:
                    // End:0xbc [While If]
                    if(j < ConsoleMessageCount - 1)
                    {
                        TextMessages[j] = TextMessages[j + 1];
                        ++ j;
                        // This is an implied JumpToken; Continue!
                        goto J0x86;
                    }
                }
                TextMessages[j].Text = "";
                // This is an implied JumpToken;
                goto J0xe6;
            }
            // End:0xdc
            else
            {
                ++ MessageCount;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    J0xe6:
    XPos = int(float(int(ConsoleMessagePosX * HudCanvasScale * float(C.SizeX))) + 1.0 - HudCanvasScale / 2.0 * float(C.SizeX));
    YPos = int(float(int(ConsoleMessagePosY * HudCanvasScale * float(C.SizeY))) + 1.0 - HudCanvasScale / 2.0 * float(C.SizeY));
    C.Font = GetConsoleFont(C);
    C.DrawColor = ConsoleColor;
    C.TextSize("A", XL, YL);
    YPos -= int(YL * float(MessageCount) + float(1));
    YPos -= int(YL);
    i = 0;
    J0x200:
    // End:0x2c0 [While If]
    if(i < MessageCount)
    {
        // End:0x229
        if(TextMessages[i].Text == "")
        {
        }
        // End:0x2c0
        else
        {
            C.StrLen(TextMessages[i].Text, XL, YL);
            C.SetPos(float(XPos), float(YPos));
            C.DrawColor = TextMessages[i].TextColor;
            C.DrawText(TextMessages[i].Text, false);
            YPos += int(YL);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x200;
        }
    }
}

function AddTextMessage(string M, class<LocalMessage> MessageClass, PlayerReplicationInfo PRI)
{
    Log("[HUD::AddTextMessage] M=" $ M $ "  MessageClass=" $ string(MessageClass));
    PlayerConsole.AddMessageItem(PlayerConsole.ConstructMessageItem(M, 6));
}

exec function GrowHUD()
{
    // End:0x16
    if(!bShowWeaponInfo)
    {
        bShowWeaponInfo = true;
    }
    // End:0x69
    else
    {
        // End:0x2c
        if(!bShowPersonalInfo)
        {
            bShowPersonalInfo = true;
        }
        // End:0x69
        else
        {
            // End:0x42
            if(!bShowPoints)
            {
                bShowPoints = true;
            }
            // End:0x69
            else
            {
                // End:0x58
                if(!bShowWeaponBar)
                {
                    bShowWeaponBar = true;
                }
                // End:0x69
                else
                {
                    // End:0x69
                    if(bSmallWeaponBar)
                    {
                        bSmallWeaponBar = false;
                    }
                }
            }
        }
    }
    SaveConfig();
}

exec function ShrinkHUD()
{
    // End:0x16
    if(!bSmallWeaponBar)
    {
        bSmallWeaponBar = true;
    }
    // End:0x63
    else
    {
        // End:0x2a
        if(bShowWeaponBar)
        {
            bShowWeaponBar = false;
        }
        // End:0x63
        else
        {
            // End:0x3e
            if(bShowPoints)
            {
                bShowPoints = false;
            }
            // End:0x63
            else
            {
                // End:0x52
                if(bShowPersonalInfo)
                {
                    bShowPersonalInfo = false;
                }
                // End:0x63
                else
                {
                    // End:0x63
                    if(bShowWeaponInfo)
                    {
                        bShowWeaponInfo = false;
                    }
                }
            }
        }
    }
    SaveConfig();
}

function FadeZoom();
simulated function SetTargeting(bool bShow, optional Vector TargetLocation, optional float Size);
simulated function DrawCrosshair(Canvas C);
simulated function SetCropping(bool Active);
static function Font LoadFontStatic(int i)
{
    return none;
    // End:0x92
    if(default.FontArrayFonts[i] == none)
    {
        default.FontArrayFonts[i] = Font(DynamicLoadObject(default.FontArrayNames[i], class'Font'));
        // End:0x92
        if(default.FontArrayFonts[i] == none)
        {
            Log("Warning: " $ string(default.Class) $ " Couldn't dynamically load font " $ default.FontArrayNames[i]);
        }
    }
    return default.FontArrayFonts[i];
}

simulated function Font LoadFont(int i)
{
    return none;
    // End:0x8e
    if(FontArrayFonts[i] == none)
    {
        FontArrayFonts[i] = Font(DynamicLoadObject(FontArrayNames[i], class'Font'));
        // End:0x8e
        if(FontArrayFonts[i] == none)
        {
            Log("Warning: " $ string(self) $ " Couldn't dynamically load font " $ FontArrayNames[i]);
        }
    }
    return FontArrayFonts[i];
}

static function Font GetConsoleFont(Canvas C)
{
    local int FontSize;

    // End:0x0c
    if(default.OverrideConsoleFontName != "")
    {
    }
    FontSize = default.ConsoleFontSize;
    // End:0x38
    if(C.ClipX < float(640))
    {
        ++ FontSize;
    }
    // End:0x59
    if(C.ClipX < float(800))
    {
        ++ FontSize;
    }
    // End:0x7a
    if(C.ClipX < float(1024))
    {
        ++ FontSize;
    }
    // End:0x9b
    if(C.ClipX < float(1280))
    {
        ++ FontSize;
    }
    // End:0xbc
    if(C.ClipX < float(1600))
    {
        ++ FontSize;
    }
    return LoadFontStatic(Min(8, FontSize));
}

function Font GetFontSizeIndex(Canvas C, int FontSize)
{
    // End:0x21
    if(C.ClipX >= float(512))
    {
        ++ FontSize;
    }
    // End:0x42
    if(C.ClipX >= float(640))
    {
        ++ FontSize;
    }
    // End:0x63
    if(C.ClipX >= float(800))
    {
        ++ FontSize;
    }
    // End:0x84
    if(C.ClipX >= float(1024))
    {
        ++ FontSize;
    }
    // End:0xa5
    if(C.ClipX >= float(1280))
    {
        ++ FontSize;
    }
    // End:0xc6
    if(C.ClipX >= float(1600))
    {
        ++ FontSize;
    }
    return LoadFont(Clamp(8 - FontSize, 0, 8));
}

static function Font GetMediumFontFor(Canvas Canvas)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x49 [While If]
    if(i < 8)
    {
        // End:0x3f
        if(float(default.FontScreenWidthMedium[i]) <= Canvas.ClipX)
        {
            return LoadFontStatic(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return LoadFontStatic(8);
}

function Font GetMediumFont(float Size)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x40 [While If]
    if(i < 8)
    {
        // End:0x36
        if(float(default.FontScreenWidthMedium[i]) <= Size)
        {
            return LoadFontStatic(i);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return LoadFontStatic(8);
}

static function Font LargerFontThan(Font aFont)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x45 [While If]
    if(i < 7)
    {
        // End:0x3b
        if(LoadFontStatic(i) == aFont)
        {
            return LoadFontStatic(Max(0, i - 4));
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return LoadFontStatic(5);
}

simulated function Font LoadProgressFont()
{
    return none;
    // End:0x7b
    if(ProgressFontFont == none)
    {
        ProgressFontFont = Font(DynamicLoadObject(ProgressFontName, class'Font'));
        // End:0x7b
        if(ProgressFontFont == none)
        {
            Log("Warning: " $ string(self) $ " Couldn't dynamically load font " $ ProgressFontName);
            ProgressFontFont = font'DefaultFont';
        }
    }
    return ProgressFontFont;
}

event AnnouncementPlayed(string AnnouncerSound, byte Switch);
simulated function DrawTargeting(Canvas C);
function DisplayHit(Vector HitDir, int Damage, class<DamageType> DamageType)
{
    // End:0x47
    if(PawnOwner != none && PawnOwner.ShieldStrength > float(0))
    {
        PlayerOwner.ClientFlash(0.50, vect(700.0, 700.0, 0.0));
    }
    // End:0x7d
    else
    {
        // End:0x7d
        if(Damage > 1)
        {
            PlayerOwner.ClientFlash(DamageType.default.FlashScale, DamageType.default.FlashFog);
        }
    }
}

simulated function AddHudOverlay(HudOverlay Overlay)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x38 [While If]
    if(i < Overlays.Length)
    {
        // End:0x2e
        if(Overlays[i] == Overlay)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    Overlays[Overlays.Length] = Overlay;
    Overlay.SetOwner(self);
}

simulated function RemoveHudOverlay(HudOverlay Overlay)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x51 [While If]
    if(i < Overlays.Length)
    {
        // End:0x47
        if(Overlays[i] == Overlay)
        {
            Overlays.Remove(i, 1);
            Overlay.SetOwner(none);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function OnEndChangedHost();
function NotifyDeath(Pawn P);
function NotifyTakeHit(Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart);
function OnClientReceiveHeliDeathMessage(PlayerController P, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject);
function OnClientReceiveFlyingDefenceBotDeathMessage(PlayerController P, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject);
function OnClientReceiveDeathMessage(PlayerController P, int Switch, PlayerReplicationInfo RelatedPRI_1, PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject);
simulated function float GetUAVScanProgress();
simulated function bool IsUAVScanning();
simulated function bool IsUAVOn();
simulated function UpdateUAV();
simulated function float GetUAVScanLineTexturePos();
simulated function CacheSpecialPositions();
function int GetCurGameTime();
simulated function InsertUsingSkillList(int SkillID, optional int SubSkillID);

defaultproperties
{
    WhiteColor=(R=255,G=255,B=255,A=255)
    DefaultShadow=(R=0,G=0,B=0,A=100)
    RedColor=(R=255,G=0,B=0,A=255)
    GreenColor=(R=0,G=255,B=0,A=255)
    CyanColor=(R=0,G=255,B=255,A=255)
    BlueColor=(R=0,G=0,B=255,A=255)
    GoldColor=(R=255,G=255,B=0,A=255)
    PurpleColor=(R=255,G=0,B=255,A=255)
    TurqColor=(R=0,G=128,B=255,A=255)
    GrayColor=(R=200,G=200,B=200,A=255)
    BlackColor=(R=0,G=0,B=0,A=255)
    bMessageBeep=true
    bShowWeaponInfo=true
    bShowPersonalInfo=true
    bShowPoints=true
    bCrosshairShow=true
    bShowPortrait=true
    bShowPortraitVC=true
    bSmallWeaponBar=true
    ConsoleColor=(R=153,G=216,B=253,A=255)
    ProgressFontName="EntryTex.Entry"
    ProgressFadeTime=1.0
    MOTDColor=(R=255,G=255,B=255,A=255)
    HudScale=0.840330
    HudOpacity=255.0
    HudCanvasScale=1.0
    CrosshairScale=1.0
    CrosshairOpacity=1.0
    CrossHairColor=(R=255,G=255,B=255,A=255)
    ConsoleMessageCount=4
    ConsoleFontSize=5
    ConsoleMessagePosY=1.0
    FontArrayNames[0]="Engine.DefaultFont"
    FontArrayNames[1]="Engine.DefaultFont"
    FontArrayNames[2]="Engine.DefaultFont"
    FontArrayNames[3]="Engine.DefaultFont"
    FontArrayNames[4]="Engine.DefaultFont"
    FontArrayNames[5]="Engine.DefaultFont"
    FontArrayNames[6]="Engine.DefaultFont"
    FontArrayNames[7]="Engine.DefaultFont"
    FontArrayNames[8]="Engine.DefaultFont"
    LastPickupTime=-999.0
    LastAmmoPickupTime=-999.0
    LastWeaponPickupTime=-999.0
    LastHealthPickupTime=-999.0
    LastArmorPickupTime=-999.0
    GoWalkingBeginTime=-1.0
    bHidden=true
    RemoteRole=0
}