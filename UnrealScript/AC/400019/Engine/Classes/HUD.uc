class HUD extends Actor
    transient
    native
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
//var delegate<OnPostRender> __OnPostRender__Delegate;
//var delegate<OnBuildMOTD> __OnBuildMOTD__Delegate;

// Export UHUD::execDraw3DLine(FFrame&, void* const)
native final function Draw3DLine(Vector Start, Vector End, Color LineColor)
{
    //native.Start;
    //native.End;
    //native.LineColor;        
}

// Export UHUD::execDrawBox(FFrame&, void* const)
native final function DrawBox(Vector Min, Vector Max, Color Color)
{
    //native.Min;
    //native.Max;
    //native.Color;        
}

// Export UHUD::execDrawCircle(FFrame&, void* const)
native final function DrawCircle(Vector Base, Vector X, Vector Y, Color Color, float Radius, int NumSides)
{
    //native.Base;
    //native.X;
    //native.Y;
    //native.Color;
    //native.Radius;
    //native.NumSides;        
}

// Export UHUD::execDrawSphere(FFrame&, void* const)
native final function DrawSphere(Vector Base, Color Color, float Radius, int NumDivisions)
{
    //native.Base;
    //native.Color;
    //native.Radius;
    //native.NumDivisions;        
}

// Export UHUD::execDrawDirectionalArrow(FFrame&, void* const)
native final function DrawDirectionalArrow(Vector InLocation, Rotator InRotation, Color InColor, float InDrawScale)
{
    //native.InLocation;
    //native.InRotation;
    //native.InColor;
    //native.InDrawScale;        
}

// Export UHUD::execDrawCanvasLine(FFrame&, void* const)
native final function DrawCanvasLine(float X1, float Y1, float X2, float Y2, Color LineColor)
{
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.LineColor;        
}

// Export UHUD::execStaticDrawCanvasLine(FFrame&, void* const)
native static final function StaticDrawCanvasLine(Canvas C, float X1, float Y1, float X2, float Y2, Color LineColor)
{
    //native.C;
    //native.X1;
    //native.Y1;
    //native.X2;
    //native.Y2;
    //native.LineColor;        
}

function CalculateWorldPostionToMinimapPosition(Vector Location, out float mx, out float my)
{
    //return;    
}

function CalculateMinimapSize(out float fWidth, out float fHeight)
{
    //return;    
}

delegate OnPostRender(HUD Sender, Canvas C)
{
    //return;    
}

delegate OnBuildMOTD(HUD Sender)
{
    //return;    
}

function ChangeWeaponSlot6Hud(wWeapon newWeapon)
{
    //return;    
}

function ChangeWeaponSlot5Hud(wWeapon newWeapon, optional bool bAddSkill)
{
    //return;    
}

simulated function CacheSuppliesPositions(Actor act)
{
    //return;    
}

simulated function DeleteSuppliesPositions(Actor act)
{
    //return;    
}

simulated function AllDeleteSuppliesPositions()
{
    //return;    
}

simulated function PushGameNotice(string sGameNotice)
{
    //return;    
}

simulated function AllDeleteGameNotice()
{
    //return;    
}

simulated function PushAASNotice(string sNotice, float beginTime, byte byLevel)
{
    //return;    
}

simulated function AllDeleteAASNotice()
{
    //return;    
}

function DrawCustomBeacon(Canvas C, Pawn P, float ScreenLocX, float ScreenLocY)
{
    local Texture BeaconTex;
    local float XL, YL;

    BeaconTex = PlayerOwner.TeamBeaconTexture;
    // End:0x37
    if((BeaconTex == none) || P.PlayerReplicationInfo == none)
    {
        return;
    }
    // End:0x95
    if(P.PlayerReplicationInfo.Team != none)
    {
        C.DrawColor = Class'Engine.PlayerController'.default.TeamBeaconTeamColors[P.PlayerReplicationInfo.Team.TeamIndex];        
    }
    else
    {
        C.DrawColor = Class'Engine.PlayerController'.default.TeamBeaconTeamColors[0];
    }
    C.StrLen(P.PlayerReplicationInfo.PlayerName, XL, YL);
    C.SetPos(ScreenLocX - (0.5000000 * XL), (ScreenLocY - (0.1250000 * float(BeaconTex.VSize))) - YL);
    C.DrawText(P.PlayerReplicationInfo.PlayerName, true);
    C.SetPos(ScreenLocX - (0.1250000 * float(BeaconTex.USize)), ScreenLocY - (0.1250000 * float(BeaconTex.VSize)));
    C.DrawTile(BeaconTex, 0.2500000 * float(BeaconTex.USize), 0.2500000 * float(BeaconTex.VSize), 0.0000000, 0.0000000, float(BeaconTex.USize), float(BeaconTex.VSize));
    //return;    
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
    if((bBuiltMOTD || PlayerOwner == none) || PlayerOwner.GameReplicationInfo == none)
    {
        return;
    }
    bBuiltMOTD = true;
    PlayerOwner.SetProgressTime(6.0000000);
    Split(PlayerOwner.GameReplicationInfo.MessageOfTheDay, "|", InMOTD);
    i = 0;
    J0x88:

    // End:0xC7 [Loop If]
    if((i < InMOTD.Length) && i < 4)
    {
        MOTD[i] = InMOTD[i];
        i++;
        // [Loop Continue]
        goto J0x88;
    }
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    LinkActors();
    CreateKeyMenus();
    // End:0x26
    foreach AllActors(Class'Engine.SceneSubtitles', SubTitles)
    {
        // End:0x26
        break;        
    }    
    //return;    
}

function Reset()
{
    bShowVoteMenu = false;
    bShowScoreBoard = false;
    bShowMapInfo = false;
    super.Reset();
    //return;    
}

simulated function CreateKeyMenus()
{
    //return;    
}

simulated event Destroyed()
{
    // End:0x1E
    if(ScoreBoard != none)
    {
        ScoreBoard.Destroy();
        ScoreBoard = none;
    }
    // End:0x3C
    if(VoteMenu != none)
    {
        VoteMenu.Destroy();
        VoteMenu = none;
    }
    super.Destroyed();
    //return;    
}

exec function ShowScores()
{
    bShowScoreBoard = !bShowScoreBoard;
    //return;    
}

exec function HideScores()
{
    bShowScoreBoard = false;
    //return;    
}

exec function ShowMapInfo()
{
    bShowMapInfo = !bShowMapInfo;
    //return;    
}

exec function HideMapInfo()
{
    bShowMapInfo = false;
    //return;    
}

exec function ShowStats()
{
    bShowLocalStats = !bShowLocalStats;
    //return;    
}

exec function NextStats()
{
    // End:0x1A
    if(LocalStatsScreen != none)
    {
        LocalStatsScreen.NextStats();
    }
    //return;    
}

exec function ShowDebug()
{
    bShowDebugInfo = !bShowDebugInfo;
    //return;    
}

exec function ShowDebugChan()
{
    bShowChanDebug = !bShowChanDebug;
    //return;    
}

exec function ShowDebug1()
{
    bDrawDebug = !bDrawDebug;
    //return;    
}

exec function ShowDebug2()
{
    bDrawDebug2 = !bDrawDebug2;
    //return;    
}

exec function ShowDebug3()
{
    bDrawDebug3 = !bDrawDebug3;
    //return;    
}

simulated event WorldSpaceOverlays()
{
    // End:0x2A
    if(bShowDebugInfo && Pawn(PlayerOwner.ViewTarget) != none)
    {
        DrawRoute();
    }
    //return;    
}

function CheckCountdown(GameReplicationInfo GRI)
{
    //return;    
}

event ConnectFailure(string FailCode, string URL)
{
    PlayerOwner.ReceiveLocalizedMessage(Class'Engine.FailedConnect', Class'Engine.FailedConnect'.static.GetFailSwitch(FailCode));
    //return;    
}

function GetLocalStatsScreen()
{
    //return;    
}

simulated event PostRenderActors(Canvas Canvas)
{
    // End:0x17
    if(PawnOwner != none)
    {
        CanvasDrawActors(Canvas, false);
    }
    //return;    
}

function DrawDebug_GSSS(Canvas C, int X, out int Y, int dy)
{
    local wGameStateStorageSender GSSS;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_GSSS]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    // End:0xCA
    if(PlayerOwner != none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    PlayerOwner.IDNum=" $ string(PlayerOwner.IDNum), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    GSSS", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;
    }
    // End:0x18D
    foreach DynamicActors(Class'Engine.wGameStateStorageSender', GSSS)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("        GSSS.UserID=" $ string(GSSS.UserID), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    Y += dy;
    //return;    
}

function DrawDebug_SpectatingAllPlayers(Canvas C, int X, out int Y, int dy)
{
    local Controller co;
    local PlayerController pco;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Spectating_AllPlayers]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    co = Level.ControllerList;
    J0x77:

    // End:0x50F [Loop If]
    if(co != none)
    {
        pco = PlayerController(co);
        // End:0x4F8
        if(pco != none)
        {
            C.BtrDrawTextJustifiedWithVolumeLineNoCache((((((((pco.PlayerReplicationInfo.PlayerName $ ", state=") $ string(pco.GetStateName())) $ " behindV=") $ string(int(pco.bBehindView))) $ " freeCam=") $ string(int(pco.bFreeCam))) $ " freeCamera=") $ string(int(pco.bFreeCamera)), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
            Y += dy;
            // End:0x221
            if(((pco.ViewTarget == none) || Pawn(pco.ViewTarget) == none) || Pawn(pco.ViewTarget).PlayerReplicationInfo == none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ "NONE", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);                
            }
            else
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ Pawn(pco.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
            }
            Y += dy;
            // End:0x348
            if(((pco.ViewTarget == none) || PlayerController(pco.ViewTarget) == none) || PlayerController(pco.ViewTarget).PlayerReplicationInfo == none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);                
            }
            else
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ PlayerController(pco.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
            }
            Y += dy;
            // End:0x475
            if(((pco.RealViewTarget == none) || PlayerController(pco.RealViewTarget) == none) || PlayerController(pco.RealViewTarget).PlayerReplicationInfo == none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);                
            }
            else
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ PlayerController(pco.RealViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
            }
            Y += dy;
        }
        co = co.nextController;
        // [Loop Continue]
        goto J0x77;
    }
    Y += dy;
    //return;    
}

function DrawDebug_Spectating(Canvas C, int X, out int Y, int dy)
{
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Spectating]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache(((((" bFreeCamera=" $ string(int(PlayerOwner.bFreeCamera))) $ " bFreeCamSwivel=") $ string(int(PlayerOwner.bFreeCamSwivel))) $ " bFreeLook=") $ string(int(PlayerOwner.bFreeLook)), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache(((" bBehindView=" $ string(int(PlayerOwner.bBehindView))) @ "bFreeView=") $ string(int(PlayerOwner.bFreeView)), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    // End:0x237
    if(((PlayerOwner.ViewTarget == none) || Pawn(PlayerOwner.ViewTarget) == none) || Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo == none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ "NONE", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);        
    }
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Pawn=" $ Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    }
    Y += dy;
    // End:0x35E
    if(((PlayerOwner.ViewTarget == none) || PlayerController(PlayerOwner.ViewTarget) == none) || PlayerController(PlayerOwner.ViewTarget).PlayerReplicationInfo == none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);        
    }
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewTarget_Player=" $ PlayerController(PlayerOwner.ViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    }
    Y += dy;
    // End:0x48B
    if(((PlayerOwner.RealViewTarget == none) || PlayerController(PlayerOwner.RealViewTarget) == none) || PlayerController(PlayerOwner.RealViewTarget).PlayerReplicationInfo == none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ "NONE", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);        
    }
    else
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RealViewTarget_Player=" $ PlayerController(PlayerOwner.RealViewTarget).PlayerReplicationInfo.PlayerName, 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    }
    Y += dy;
    Y += dy;
    //return;    
}

function DrawDebug_Time(Canvas C, int X, out int Y, int dy)
{
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Time]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RemainingTime=" $ string(Level.GRI.RemainingTime), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ElapsedTime=" $ string(Level.GRI.ElapsedTime), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    PostRemaiingTime=" $ string(Level.GRI.PostRemaiingTime), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("    PostRemaiingTimeClient=" $ string(Level.GRI.PostRemaiingTimeClient), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    Y += dy;
    //return;    
}

function DrawDebug_Helicopter(Canvas C, int X, out int Y, int dy)
{
    local AIController H;
    local Inventory i;
    local float Max, cur;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_Helicopter]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    // End:0x5BC
    foreach DynamicActors(Class'Engine.AIController', H)
    {
        // End:0x5BB
        if(H.IsA('wHelicopterController'))
        {
            C.BtrDrawTextJustifiedWithVolumeLineNoCache(" cur iWeaponID=" $ string(H.Pawn.Weapon.BaseParams.iWeaponID), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
            Y += dy;
            i = H.Pawn.Inventory;
            J0x117:

            // End:0x5BB [Loop If]
            if(i != none)
            {
                C.BtrDrawTextJustifiedWithVolumeLineNoCache(" iWeaponID=" $ string(wWeapon(i).BaseParams.iWeaponID), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bIsFiring=" $ string(wWeapon(i).FireMode[0].bIsFiring), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bFireOnRelease=" $ string(wWeapon(i).FireMode[0].bFireOnRelease), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bInstantStop=" $ string(wWeapon(i).FireMode[0].bInstantStop), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     HoldTime=" $ string(wWeapon(i).FireMode[0].HoldTime), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     MaxHoldTime=" $ string(wWeapon(i).FireMode[0].MaxHoldTime), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     CurrentTime=" $ string(Level.TimeSeconds), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     NextFireTime=" $ string(wWeapon(i).FireMode[0].NextFireTime), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     bNowWaiting=" $ string(wWeapon(i).FireMode[0].bNowWaiting), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                wWeapon(i).GetAmmoCount(Max, cur);
                C.BtrDrawTextJustifiedWithVolumeLineNoCache("     AmmoAmount=" $ string(cur), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
                Y += dy;
                i = i.Inventory;
                // [Loop Continue]
                goto J0x117;
            }
        }        
    }    
    Y += dy;
    //return;    
}

function DrawDebug_AllPlayerStates(Canvas C, int X, out int Y, int dy)
{
    local Controller PC;
    local Pawn P;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_AllPlayerStates]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x131
    foreach DynamicActors(Class'Engine.Controller', PC)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache((((("    Name=" $ PC.PlayerReplicationInfo.PlayerName) $ " State=") $ string(PC.GetStateName())) $ " NumLives=") $ string(PC.PlayerReplicationInfo.NumLives), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    // End:0x1E1
    foreach DynamicActors(Class'Engine.Pawn', P)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache((((("    Pawn OwnerName=" $ P.OwnerName) $ " Health=") $ string(P.Health)) $ " state=") $ string(P.GetStateName()), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    Y += dy;
    //return;    
}

function DrawDebug_AllPawnNetStates(Canvas C, int X, out int Y, int dy)
{
    local Pawn P;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_AllPawnNetStates]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x18B
    foreach DynamicActors(Class'Engine.Pawn', P)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache((((((((((("    Pawn OwnerName=" $ P.OwnerName) $ " bTearOff=") $ string(P.bTearOff)) $ " Chnl=") $ P.HasChannel()) $ " ChkRTimeOut=") $ P.CheckRelevantTimeOut()) $ " IsNetReady=") $ P.IsNetReady()) $ " CanSee=") $ P.CanSee(), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    Y += dy;
    //return;    
}

function DrawDebug(Canvas C, int X, out int Y, int dy)
{
    C.SetDrawColor(byte(255), byte(255), byte(255));
    DrawDebug_AllPlayerStates(C, X, Y, dy);
    DrawDebug_SpectatingAllPlayers(C, X, Y, dy);
    DrawDebug_Spectating(C, X, Y, dy);
    DrawDebug_HostPoint(C, X, Y, dy);
    //return;    
}

function DrawDebug_AllPlayerStates2(Canvas C, int X, out int Y, int dy)
{
    local Controller PC;
    local Pawn P;

    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug_AllPlayerStates]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x17F
    foreach DynamicActors(Class'Engine.Controller', PC)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache((((((((("    Name=" $ PC.PlayerReplicationInfo.PlayerName) $ " Loc=(") $ string(PC.Pawn.Location.X)) $ ", ") $ string(PC.Pawn.Location.Y)) $ ", ") $ string(PC.Pawn.Location.Z)) $ ") State=") $ string(PC.GetStateName()), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    // End:0x28B
    foreach DynamicActors(Class'Engine.Pawn', P)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache((((((((((("    Pawn OwnerName=" $ P.OwnerName) $ " Loc=(") $ string(P.Location.X)) $ ", ") $ string(P.Location.Y)) $ ", ") $ string(P.Location.Z)) $ ") Health=") $ string(P.Health)) $ " state=") $ string(P.GetStateName()), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    Y += dy;
    //return;    
}

function DrawDebug2(Canvas C, int X, out int Y, int dy)
{
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug2 - HostPoint]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    DrawDebug_HostPoint(C, X, Y, dy);
    //return;    
}

function DrawDebug_HostPoint(Canvas C, int X, out int Y, int dy)
{
    local wMatchMaker kMM;
    local wMatchUserInfo kUserInfo;
    local int i;

    kMM = Level.GetMatchMaker();
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustifiedWithVolumeLineNoCache((((((("  [My iAvgPing] :  " $ string(kMM.iAvgPing)) $ "/ FPS : ") $ string(kMM.iAvgFrameRate)) $ "/ HostPoint : ") $ string(kMM.GetHostPoint())) $ "/ nNatType : ") $ string(kMM.nNatType), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("  [ PawnOwnerPRI.Ping ] :  " $ string(PawnOwnerPRI.Ping), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    i = 0;
    J0x173:

    // End:0x211 [Loop If]
    if(i < kMM.UserInfos.Length)
    {
        kUserInfo = kMM.UserInfos[i];
        // End:0x207
        if(kUserInfo != none)
        {
            // End:0x1E0
            if(kUserInfo.iReceivedPing > 100)
            {
                C.SetDrawColor(byte(255), 0, 0);                
            }
            else
            {
                C.SetDrawColor(byte(255), byte(255), byte(255));
            }
            Y += dy;
        }
        i++;
        // [Loop Continue]
        goto J0x173;
    }
    //return;    
}

function DrawDebug3(Canvas C, int X, out int Y, int dy)
{
    local wMatchMaker kMM;
    local Pawn Wpn;

    C.SetDrawColor(byte(255), byte(255), byte(255));
    kMM = Level.GetMatchMaker();
    C.BtrDrawTextJustifiedWithVolumeLineNoCache("[DrawDebug3 for HK]", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
    Y += dy;
    // End:0x33B
    foreach DynamicActors(Class'Engine.Pawn', Wpn)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache(("=========" @ Wpn.LoginName) @ "=========", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustifiedWithVolumeLineNoCache(((((("Loc = (" $ string(Wpn.Location.X)) $ ", ") $ string(Wpn.Location.Y)) $ ", ") $ string(Wpn.Location.Z)) $ ")", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustifiedWithVolumeLineNoCache(((((((((((("Rot/DRot = (" $ string(Wpn.Rotation.Yaw)) $ ", ") $ string(Wpn.Rotation.Pitch)) $ ", ") $ string(Wpn.Rotation.Roll)) $ "), (") $ string(Wpn.DesiredRotation.Yaw)) $ ", ") $ string(Wpn.DesiredRotation.Pitch)) $ ", ") $ string(Wpn.DesiredRotation.Roll)) $ ")", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustifiedWithVolumeLineNoCache(((((("Pivot = (" $ string(Wpn.PrePivot.X)) $ ", ") $ string(Wpn.PrePivot.Y)) $ ", ") $ string(Wpn.PrePivot.Z)) $ ")", 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    //return;    
}

simulated function ResetKillMessageTexture()
{
    //return;    
}

simulated function bool NeedToDrawSpectatingHud()
{
    return (((((Level.GetMatchMaker().InGameOver != 0) || Level.GRI.bMatchOver) || PlayerOwner == none) || PawnOwner == none) || PawnOwnerPRI == none) || (PlayerOwner.IsSpectating() && PlayerOwner.bBehindView) || PlayerOwner.IsInState('RoundEnded');
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    //return;    
}

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
    Canvas.ColorModulate.X = 1.0000000;
    Canvas.ColorModulate.Y = 1.0000000;
    Canvas.ColorModulate.Z = 1.0000000;
    Canvas.ColorModulate.W = HudOpacity / float(255);
    LinkActors();
    ResScaleX = float(Canvas.SizeX) / 640.0000000;
    ResScaleY = float(Canvas.SizeY) / 480.0000000;
    // End:0x126
    if((PlayerOwner != none) && PlayerOwner.GameReplicationInfo != none)
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
    if((PawnOwner != none) && PawnOwner.bSpecialHUD)
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
        if((PlayerOwner.ViewTarget != PlayerOwner) && (Pawn(PlayerOwner.ViewTarget) == none) || Pawn(PlayerOwner.ViewTarget).Controller == none)
        {
            YPos += (XPos * float(2));
            Canvas.SetPos(4.0000000, YPos);
            Canvas.DrawText("----- VIEWER INFO -----");
            YPos += XPos;
            Canvas.SetPos(4.0000000, YPos);
            PlayerOwner.DisplayDebug(Canvas, XPos, YPos);
        }        
    }
    else
    {
        // End:0x6A1
        if(!bHideHUD)
        {
            // End:0x395
            if(bShowLocalStats)
            {
                // End:0x32C
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
                else
                {
                    // End:0x492
                    if(bShowMapInfo)
                    {
                        OM = Canvas.ColorModulate;
                        Canvas.ColorModulate = OldModulate;
                        ScoreBoard.DrawMiniMap(Canvas);
                        // End:0x47B
                        if(ScoreBoard.bDisplayMessages)
                        {
                            DisplayMessages(Canvas);
                        }
                        Canvas.ColorModulate = OM;                        
                    }
                    else
                    {
                        // End:0x4D8
                        if((ScoreBoard != none) && (int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
                        {
                            ScoreBoard.DrawGMUserBoard(Canvas);
                        }
                        // End:0x4EC
                        if(NeedToDrawSpectatingHud())
                        {
                            DrawSpectatingHud(Canvas);
                        }
                        // End:0x53F
                        if(((PawnOwner != none) && !PawnOwner.bHideRegularHUD) || (int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
                        {
                            DrawHUD(Canvas);
                        }
                        // End:0x569
                        if((PlayerOwner != none) && bDrawDebug)
                        {
                            DrawDebug(Canvas, 20, Y, 15);
                        }
                        // End:0x593
                        if((PlayerOwner != none) && bDrawDebug3)
                        {
                            DrawDebug3(Canvas, 20, Y, 15);
                        }
                        // End:0x5BD
                        if((PlayerOwner != none) && bDrawDebug2)
                        {
                            DrawDebug2(Canvas, 20, Y, 15);
                        }
                        i = 0;
                        J0x5C4:

                        // End:0x5F8 [Loop If]
                        if(i < Overlays.Length)
                        {
                            Overlays[i].Render(Canvas);
                            i++;
                            // [Loop Continue]
                            goto J0x5C4;
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
            // End:0x69E
            if(bShowVoteMenu && VoteMenu != none)
            {
                VoteMenu.RenderOverlays(Canvas);
            }            
        }
        else
        {
            // End:0x6B7
            if(PawnOwner != none)
            {
                DrawInstructionGfx(Canvas);
            }
        }
    }
    PlayerOwner.RenderOverlays(Canvas);
    // End:0x6E8
    if(PlayerOwner.bViewingMatineeCinematic)
    {
        DrawCinematicHUD(Canvas);
    }
    // End:0x72E
    if((PlayerConsole != none) && PlayerConsole.bTyping)
    {
        DrawTypingPrompt(Canvas, PlayerConsole.TypedStr, PlayerConsole.TypedStrPos);
    }
    Canvas.ColorModulate = OldModulate;
    Canvas.DrawColor = OldColor;
    DrawChangeHostGuest(Canvas);
    OnPostRender(self, Canvas);
    UpdateUAV();
    //return;    
}

function DrawChangeHostGuest(Canvas C)
{
    //return;    
}

function DrawDebugStates(Canvas C)
{
    local PlayerController PC;

    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    PC = PlayerOwner;
    // End:0x3FD
    if(PC != none)
    {
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("BaseSpectating=" $ string(int(PC.IsInState('BaseSpectating'))), 0, 0.0000000, 200.0000000, C.ClipX, 215.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("     Scripting=" $ string(int(PC.IsInState('Scripting'))), 0, 0.0000000, 215.0000000, C.ClipX, 230.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    Spectating=" $ string(int(PC.IsInState('Spectating'))), 0, 0.0000000, 230.0000000, C.ClipX, 245.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("   AttractMode=" $ string(int(PC.IsInState('AttractMode'))), 0, 0.0000000, 245.0000000, C.ClipX, 260.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache(" PlayerWaiting=" $ string(int(PC.IsInState('PlayerWaiting'))), 0, 0.0000000, 260.0000000, C.ClipX, 275.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("   ChangedHost=" $ string(int(PC.IsInState('ChangedHost'))), 0, 0.0000000, 275.0000000, C.ClipX, 290.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("WaitingForPawn=" $ string(int(PC.IsInState('WaitingForPawn'))), 0, 0.0000000, 290.0000000, C.ClipX, 305.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("     GameEnded=" $ string(int(PC.IsInState('GameEnded'))), 0, 0.0000000, 305.0000000, C.ClipX, 315.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    RoundEnded=" $ string(int(PC.IsInState('RoundEnded'))), 0, 0.0000000, 320.0000000, C.ClipX, 335.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("          Dead=" $ string(int(PC.IsInState('Dead'))), 0, 0.0000000, 335.0000000, C.ClipX, 350.0000000, 10);
        C.BtrDrawTextJustifiedWithVolumeLineNoCache("    ViewPlayer=" $ string(int(PC.IsInState('ViewPlayer'))), 0, 0.0000000, 350.0000000, C.ClipX, 365.0000000, 10);
    }
    //return;    
}

simulated function DrawCinematicHUD(Canvas C)
{
    local int i;

    // End:0x27
    if((!bHideHUD && !bShowLocalStats) && !bShowScoreBoard)
    {
        return;
    }
    i = 0;
    J0x2E:

    // End:0x62 [Loop If]
    if(i < Overlays.Length)
    {
        Overlays[i].Render(C);
        i++;
        // [Loop Continue]
        goto J0x2E;
    }
    //return;    
}

simulated function DrawInstructionGfx(Canvas C)
{
    //return;    
}

simulated function SetInstructionText(string Text)
{
    //return;    
}

simulated function SetInstructionKeyText(string Text)
{
    //return;    
}

function CanvasDrawActors(Canvas C, bool bClearedZBuffer)
{
    // End:0x79
    if(!PlayerOwner.bBehindView)
    {
        // End:0x5F
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
    //return;    
}

simulated function DrawRoute()
{
    local int i;
    local Controller C;
    local Vector Start, End, RealStart;
    local bool bPath;

    C = Pawn(PlayerOwner.ViewTarget).Controller;
    // End:0x2F
    if(C == none)
    {
        return;
    }
    // End:0x6C
    if(C.CurrentPath != none)
    {
        Start = C.CurrentPath.Start.Location;        
    }
    else
    {
        Start = PlayerOwner.ViewTarget.Location;
    }
    RealStart = Start;
    // End:0xFE
    if(C.bAdjusting)
    {
        Draw3DLine(C.Pawn.Location, C.AdjustLoc, Class'Engine.Canvas'.static.MakeColor(byte(255), 0, byte(255)));
        Start = C.AdjustLoc;
    }
    // End:0x2DC
    if((C == PlayerOwner) || (C.MoveTarget == C.RouteCache[0]) && C.MoveTarget != none)
    {
        // End:0x1F8
        if((C == PlayerOwner) && C.Destination != vect(0.0000000, 0.0000000, 0.0000000))
        {
            // End:0x1DE
            if(C.pointReachable(C.Destination))
            {
                Draw3DLine(C.Pawn.Location, C.Destination, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
                return;
            }
            C.FindPathTo(C.Destination);
        }
        i = 0;
        J0x1FF:

        // End:0x29C [Loop If]
        if(i < 16)
        {
            // End:0x228
            if(C.RouteCache[i] == none)
            {
                // [Explicit Break]
                goto J0x29C;
            }
            bPath = true;
            Draw3DLine(Start, C.RouteCache[i].Location, Class'Engine.Canvas'.static.MakeColor(0, byte(255), 0));
            Start = C.RouteCache[i].Location;
            i++;
            // [Loop Continue]
            goto J0x1FF;
        }
        J0x29C:

        // End:0x2D9
        if(bPath)
        {
            Draw3DLine(RealStart, C.Destination, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }        
    }
    else
    {
        // End:0x339
        if(PlayerOwner.ViewTarget.Velocity != vect(0.0000000, 0.0000000, 0.0000000))
        {
            Draw3DLine(RealStart, C.Destination, Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255)));
        }
    }
    // End:0x34A
    if(C == PlayerOwner)
    {
        return;
    }
    // End:0x37E
    if(C.Focus != none)
    {
        End = C.Focus.Location;        
    }
    else
    {
        End = C.FocalPoint;
    }
    Draw3DLine(PlayerOwner.ViewTarget.Location + (Pawn(PlayerOwner.ViewTarget).BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000)), End, Class'Engine.Canvas'.static.MakeColor(byte(255), 0, 0));
    //return;    
}

simulated function DisplayProgressMessages(Canvas C)
{
    local int i, LineCount;
    local GameReplicationInfo GRI;
    local float FontDX, FontDY, X, Y;
    local int Alpha;
    local float TimeLeft;

    TimeLeft = PlayerOwner.ProgressTimeOut - Level.TimeSeconds;
    // End:0x3E
    if(TimeLeft >= ProgressFadeTime)
    {
        Alpha = 255;        
    }
    else
    {
        Alpha = int(float(int(float(255) * TimeLeft)) / ProgressFadeTime);
    }
    GRI = PlayerOwner.GameReplicationInfo;
    LineCount = 0;
    i = 0;
    J0x7E:

    // End:0xB9 [Loop If]
    if(i < 4)
    {
        // End:0xA8
        if(PlayerOwner.ProgressMessage[i] == "")
        {
            // [Explicit Continue]
            goto J0xAF;
        }
        LineCount++;
        J0xAF:

        i++;
        // [Loop Continue]
        goto J0x7E;
    }
    // End:0x126
    if(bBuiltMOTD && MOTDState < 2)
    {
        // End:0xE5
        if(MOTD[0] != "")
        {
            LineCount++;
        }
        // End:0xFA
        if(MOTD[1] != "")
        {
            LineCount++;
        }
        // End:0x110
        if(MOTD[2] != "")
        {
            LineCount++;
        }
        // End:0x126
        if(MOTD[3] != "")
        {
            LineCount++;
        }
    }
    C.Font = LoadProgressFont();
    C.Style = 5;
    C.TextSize("A", FontDX, FontDY);
    X = ((0.5000000 * HudCanvasScale) * float(C.SizeX)) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeX));
    Y = ((0.5000000 * HudCanvasScale) * float(C.SizeY)) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeY));
    Y -= (FontDY * (float(LineCount) / 2.0000000));
    i = 0;
    J0x21E:

    // End:0x30D [Loop If]
    if(i < 4)
    {
        // End:0x248
        if(PlayerOwner.ProgressMessage[i] == "")
        {
            // [Explicit Continue]
            goto J0x303;
        }
        C.DrawColor = PlayerOwner.ProgressColor[i];
        C.DrawColor.A = byte(Alpha);
        C.TextSize(PlayerOwner.ProgressMessage[i], FontDX, FontDY);
        C.SetPos(X - (FontDX / 2.0000000), Y);
        C.DrawText(PlayerOwner.ProgressMessage[i]);
        Y += FontDY;
        J0x303:

        i++;
        // [Loop Continue]
        goto J0x21E;
    }
    // End:0x3FF
    if(((GRI != none) && int(Level.NetMode) != int(NM_Standalone)) && MOTDState < 2)
    {
        MOTDState = 1;
        C.DrawColor = MOTDColor;
        C.DrawColor.A = byte(Alpha);
        i = 0;
        J0x37E:

        // End:0x3FF [Loop If]
        if(i < 4)
        {
            C.TextSize(MOTD[i], FontDX, FontDY);
            C.SetPos(X - (FontDX / 2.0000000), Y);
            C.DrawText(MOTD[i]);
            Y += FontDY;
            i++;
            // [Loop Continue]
            goto J0x37E;
        }
    }
    //return;    
}

function ResetHud()
{
    //return;    
}

function DrawHUD(Canvas C)
{
    //return;    
}

function DrawSpectatingHud(Canvas C)
{
    //return;    
}

function DrawGMSpectatingHud(Canvas C)
{
    //return;    
}

function bool DrawLevelAction(Canvas C)
{
    //return;    
}

function CallSkill(optional int iKey, optional bool bRequire, optional bool iSucess)
{
    //return;    
}

function CallEvent(optional bool ItemCheck, optional int iReservation1, optional int iReservation2)
{
    //return;    
}

function CallRadioMessage(optional int iKey, optional int iReservation1, optional int iReservation2)
{
    //return;    
}

function TutorialEvent(coerce string S, optional name Type, optional name reserv)
{
    //return;    
}

function CallItemBuy(optional int iKey, optional int iReservation1, optional int iReservation2)
{
    //return;    
}

function CallUsingItem(int ItemID, optional int iReservation1, optional int iReservation2)
{
    //return;    
}

function bool IsEnableRepair()
{
    return false;
    //return;    
}

function DisplayBadConnectionAlert(Canvas C)
{
    //return;    
}

function bool IsInCinematic()
{
    //return;    
}

simulated function LocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString)
{
    //return;    
}

simulated function LocalizedMessageEx(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject, optional string CriticalString, optional int iReserve)
{
    //return;    
}

simulated function LocalizedMessage2(Class<LocalMessage> Message, optional int Switch, optional bool bOption_Push, optional string CriticalString)
{
    //return;    
}

simulated function LocalizedMessageOptional(Class<LocalMessage> Message, optional int Switch, optional int iReserve1, optional int iReserve2)
{
    //return;    
}

simulated function DrawTypingPrompt(Canvas C, string Text, optional int pos)
{
    local float XPos, YPos, XL, YL;

    C.Font = GetConsoleFont(C);
    C.Style = 5;
    C.DrawColor = ConsoleColor;
    C.TextSize("A", XL, YL);
    XPos = ((ConsoleMessagePosX * HudCanvasScale) * float(C.SizeX)) + (((1.0000000 - HudCanvasScale) * 0.5000000) * float(C.SizeX));
    YPos = (((ConsoleMessagePosY * HudCanvasScale) * float(C.SizeY)) + (((1.0000000 - HudCanvasScale) * 0.5000000) * float(C.SizeY))) - YL;
    C.SetPos(XPos, YPos);
    C.DrawTextClipped((("(>" @ Left(Text, pos)) $ Chr(4)) $ Eval(pos < Len(Text), Mid(Text, pos), "_"), true);
    //return;    
}

simulated function SetScoreBoardClass(Class<ScoreBoard> ScoreboardClass, Class<ScoreBoard> ResultBoardClass, Class<ScoreBoard> ResultBoardBootyClass)
{
    // End:0x17
    if(ScoreBoard != none)
    {
        ScoreBoard.Destroy();
    }
    // End:0x2E
    if(ResultBoard != none)
    {
        ResultBoard.Destroy();
    }
    // End:0x45
    if(ResultBoardBooty != none)
    {
        ResultBoardBooty.Destroy();
    }
    // End:0x5A
    if(ScoreboardClass == none)
    {
        ScoreBoard = none;        
    }
    else
    {
        ScoreBoard = Spawn(ScoreboardClass, Owner);
        // End:0xC9
        if(ScoreBoard == none)
        {
            Log("Hud::SetScoreBoard(): Could not spawn a scoreboard of class " $ string(ScoreboardClass), 'Error');            
        }
        else
        {
            ScoreBoard.HudOwner = self;
        }
    }
    // End:0xEE
    if(ResultBoardClass == none)
    {
        ResultBoard = none;        
    }
    else
    {
        ResultBoard = Spawn(ResultBoardClass, Owner);
        // End:0x10F
        if(ResultBoard == none)
        {            
        }
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
    else
    {
        ResultBoardBooty = Spawn(ResultBoardBootyClass, Owner);
        // End:0x155
        if(ResultBoardBooty == none)
        {            
        }
        else
        {
            ResultBoardBooty.HudOwner = self;
        }
    }
    //return;    
}

exec function ShowHud()
{
    bHideHUD = !bHideHUD;
    SaveConfig();
    //return;    
}

exec function ShowFont()
{
    Level.GetMatchMaker().bShowFont = !Level.GetMatchMaker().bShowFont;
    clog("bShowFont=" $ string(Level.GetMatchMaker().bShowFont));
    //return;    
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
    else
    {
        PlayerConsole = none;
    }
    // End:0xC6
    if((Pawn(PlayerOwner.ViewTarget) != none) && Pawn(PlayerOwner.ViewTarget).Health > 0)
    {
        PawnOwner = Pawn(PlayerOwner.ViewTarget);        
    }
    else
    {
        // End:0xF1
        if(PlayerOwner.Pawn != none)
        {
            PawnOwner = PlayerOwner.Pawn;            
        }
        else
        {
            PawnOwner = none;
        }
    }
    // End:0x130
    if((PawnOwner != none) && PawnOwner.PlayerReplicationInfo != none)
    {
        PawnOwnerPRI = PawnOwner.PlayerReplicationInfo;        
    }
    else
    {
        PawnOwnerPRI = PlayerOwner.PlayerReplicationInfo;
    }
    //return;    
}

simulated function Message(PlayerReplicationInfo PRI, coerce string Msg, name MsgType)
{
    // End:0x18
    if(bMessageBeep)
    {
        PlayerOwner.PlayBeepSound();
    }
    // End:0x59
    if((MsgType == 'Say') || MsgType == 'TeamSay')
    {
        Msg = (PRI.PlayerName $ ": ") $ Msg;
    }
    AddTextMessage(Msg, Class'Engine.LocalMessage', PRI);
    //return;    
}

function DisplayPortrait(PlayerReplicationInfo PRI)
{
    //return;    
}

function DisplayMessages(Canvas C)
{
    local int i, j, XPos, YPos, MessageCount;

    local float XL, YL;

    i = 0;
    J0x07:

    // End:0xE6 [Loop If]
    if(i < ConsoleMessageCount)
    {
        // End:0x33
        if(TextMessages[i].Text == "")
        {
            // [Explicit Break]
            goto J0xE6;
            // [Explicit Continue]
            goto J0xDC;
        }
        // End:0xD5
        if(TextMessages[i].MessageLife < Level.TimeSeconds)
        {
            TextMessages[i].Text = "";
            // End:0xBC
            if(i < (ConsoleMessageCount - 1))
            {
                j = i;
                J0x86:

                // End:0xBC [Loop If]
                if(j < (ConsoleMessageCount - 1))
                {
                    TextMessages[j] = TextMessages[j + 1];
                    j++;
                    // [Loop Continue]
                    goto J0x86;
                }
            }
            TextMessages[j].Text = "";
            // [Explicit Break]
            goto J0xE6;
            // [Explicit Continue]
            goto J0xDC;
        }
        MessageCount++;
        J0xDC:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0xE6:

    XPos = int(float(int((ConsoleMessagePosX * HudCanvasScale) * float(C.SizeX))) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeX)));
    YPos = int(float(int((ConsoleMessagePosY * HudCanvasScale) * float(C.SizeY))) + (((1.0000000 - HudCanvasScale) / 2.0000000) * float(C.SizeY)));
    C.Font = GetConsoleFont(C);
    C.DrawColor = ConsoleColor;
    C.TextSize("A", XL, YL);
    YPos -= int((YL * float(MessageCount)) + float(1));
    YPos -= int(YL);
    i = 0;
    J0x200:

    // End:0x2C0 [Loop If]
    if(i < MessageCount)
    {
        // End:0x229
        if(TextMessages[i].Text == "")
        {
            // [Explicit Break]
            goto J0x2C0;
        }
        C.StrLen(TextMessages[i].Text, XL, YL);
        C.SetPos(float(XPos), float(YPos));
        C.DrawColor = TextMessages[i].TextColor;
        C.DrawText(TextMessages[i].Text, false);
        YPos += int(YL);
        i++;
        // [Loop Continue]
        goto J0x200;
    }
    J0x2C0:

    //return;    
}

function AddTextMessage(string M, Class<LocalMessage> MessageClass, PlayerReplicationInfo PRI)
{
    Log((("[HUD::AddTextMessage] M=" $ M) $ "  MessageClass=") $ string(MessageClass));
    PlayerConsole.AddMessageItem(PlayerConsole.ConstructMessageItem(M, 6));
    //return;    
}

exec function GrowHUD()
{
    // End:0x16
    if(!bShowWeaponInfo)
    {
        bShowWeaponInfo = true;        
    }
    else
    {
        // End:0x2C
        if(!bShowPersonalInfo)
        {
            bShowPersonalInfo = true;            
        }
        else
        {
            // End:0x42
            if(!bShowPoints)
            {
                bShowPoints = true;                
            }
            else
            {
                // End:0x58
                if(!bShowWeaponBar)
                {
                    bShowWeaponBar = true;                    
                }
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
    //return;    
}

exec function ShrinkHUD()
{
    // End:0x16
    if(!bSmallWeaponBar)
    {
        bSmallWeaponBar = true;        
    }
    else
    {
        // End:0x2A
        if(bShowWeaponBar)
        {
            bShowWeaponBar = false;            
        }
        else
        {
            // End:0x3E
            if(bShowPoints)
            {
                bShowPoints = false;                
            }
            else
            {
                // End:0x52
                if(bShowPersonalInfo)
                {
                    bShowPersonalInfo = false;                    
                }
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
    //return;    
}

function FadeZoom()
{
    //return;    
}

simulated function SetTargeting(bool bShow, optional Vector TargetLocation, optional float Size)
{
    //return;    
}

simulated function DrawCrosshair(Canvas C)
{
    //return;    
}

simulated function SetCropping(bool Active)
{
    //return;    
}

static function Font LoadFontStatic(int i)
{
    return none;
    // End:0x92
    if(default.FontArrayFonts[i] == none)
    {
        default.FontArrayFonts[i] = Font(DynamicLoadObject(default.FontArrayNames[i], Class'Engine.Font'));
        // End:0x92
        if(default.FontArrayFonts[i] == none)
        {
            Log((("Warning: " $ string(default.Class)) $ " Couldn't dynamically load font ") $ default.FontArrayNames[i]);
        }
    }
    return default.FontArrayFonts[i];
    //return;    
}

simulated function Font LoadFont(int i)
{
    return none;
    // End:0x8E
    if(FontArrayFonts[i] == none)
    {
        FontArrayFonts[i] = Font(DynamicLoadObject(FontArrayNames[i], Class'Engine.Font'));
        // End:0x8E
        if(FontArrayFonts[i] == none)
        {
            Log((("Warning: " $ string(self)) $ " Couldn't dynamically load font ") $ FontArrayNames[i]);
        }
    }
    return FontArrayFonts[i];
    //return;    
}

static function Font GetConsoleFont(Canvas C)
{
    local int FontSize;

    // End:0x0C
    if(default.OverrideConsoleFontName != "")
    {
    }
    FontSize = default.ConsoleFontSize;
    // End:0x38
    if(C.ClipX < float(640))
    {
        FontSize++;
    }
    // End:0x59
    if(C.ClipX < float(800))
    {
        FontSize++;
    }
    // End:0x7A
    if(C.ClipX < float(1024))
    {
        FontSize++;
    }
    // End:0x9B
    if(C.ClipX < float(1280))
    {
        FontSize++;
    }
    // End:0xBC
    if(C.ClipX < float(1600))
    {
        FontSize++;
    }
    return LoadFontStatic(Min(8, FontSize));
    //return;    
}

function Font GetFontSizeIndex(Canvas C, int FontSize)
{
    // End:0x21
    if(C.ClipX >= float(512))
    {
        FontSize++;
    }
    // End:0x42
    if(C.ClipX >= float(640))
    {
        FontSize++;
    }
    // End:0x63
    if(C.ClipX >= float(800))
    {
        FontSize++;
    }
    // End:0x84
    if(C.ClipX >= float(1024))
    {
        FontSize++;
    }
    // End:0xA5
    if(C.ClipX >= float(1280))
    {
        FontSize++;
    }
    // End:0xC6
    if(C.ClipX >= float(1600))
    {
        FontSize++;
    }
    return LoadFont(Clamp(8 - FontSize, 0, 8));
    //return;    
}

static function Font GetMediumFontFor(Canvas Canvas)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x49 [Loop If]
    if(i < 8)
    {
        // End:0x3F
        if(float(default.FontScreenWidthMedium[i]) <= Canvas.ClipX)
        {
            return LoadFontStatic(i);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return LoadFontStatic(8);
    //return;    
}

function Font GetMediumFont(float Size)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x40 [Loop If]
    if(i < 8)
    {
        // End:0x36
        if(float(default.FontScreenWidthMedium[i]) <= Size)
        {
            return LoadFontStatic(i);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return LoadFontStatic(8);
    //return;    
}

static function Font LargerFontThan(Font aFont)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x45 [Loop If]
    if(i < 7)
    {
        // End:0x3B
        if((LoadFontStatic(i)) == aFont)
        {
            return LoadFontStatic(Max(0, i - 4));
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return LoadFontStatic(5);
    //return;    
}

simulated function Font LoadProgressFont()
{
    return none;
    // End:0x7B
    if(ProgressFontFont == none)
    {
        ProgressFontFont = Font(DynamicLoadObject(ProgressFontName, Class'Engine.Font'));
        // End:0x7B
        if(ProgressFontFont == none)
        {
            Log((("Warning: " $ string(self)) $ " Couldn't dynamically load font ") $ ProgressFontName);
            ProgressFontFont = Font'Engine.DefaultFont';
        }
    }
    return ProgressFontFont;
    //return;    
}

event AnnouncementPlayed(string AnnouncerSound, byte Switch)
{
    //return;    
}

simulated function DrawTargeting(Canvas C)
{
    //return;    
}

function DisplayHit(Vector HitDir, int Damage, Class<DamageType> DamageType)
{
    // End:0x47
    if((PawnOwner != none) && PawnOwner.ShieldStrength > float(0))
    {
        PlayerOwner.ClientFlash(0.5000000, vect(700.0000000, 700.0000000, 0.0000000));        
    }
    else
    {
        // End:0x7D
        if(Damage > 1)
        {
            PlayerOwner.ClientFlash(DamageType.default.FlashScale, DamageType.default.FlashFog);
        }
    }
    //return;    
}

simulated function AddHudOverlay(HudOverlay Overlay)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x38 [Loop If]
    if(i < Overlays.Length)
    {
        // End:0x2E
        if(Overlays[i] == Overlay)
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    Overlays[Overlays.Length] = Overlay;
    Overlay.SetOwner(self);
    //return;    
}

simulated function RemoveHudOverlay(HudOverlay Overlay)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x51 [Loop If]
    if(i < Overlays.Length)
    {
        // End:0x47
        if(Overlays[i] == Overlay)
        {
            Overlays.Remove(i, 1);
            Overlay.SetOwner(none);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function OnEndChangedHost()
{
    //return;    
}

function NotifyDeath(Pawn P)
{
    //return;    
}

function NotifyTakeHit(Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    //return;    
}

function OnClientReceiveHeliDeathMessage(PlayerController P, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject)
{
    //return;    
}

function OnClientReceiveFlyingDefenceBotDeathMessage(PlayerController P, PlayerReplicationInfo attackerPRI, PlayerReplicationInfo victimPRI, optional Object OptionalObject)
{
    //return;    
}

function OnClientReceiveDeathMessage(PlayerController P, int Switch, PlayerReplicationInfo RelatedPRI_1, PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    //return;    
}

simulated function float GetUAVScanProgress()
{
    //return;    
}

simulated function bool IsUAVScanning()
{
    //return;    
}

simulated function bool IsUAVOn()
{
    //return;    
}

simulated function UpdateUAV()
{
    //return;    
}

simulated function float GetUAVScanLineTexturePos()
{
    //return;    
}

simulated function CacheSpecialPositions()
{
    //return;    
}

function int GetCurGameTime()
{
    //return;    
}

simulated function InsertUsingSkillList(int SkillID, int weaponID, optional int SubSkillID)
{
    //return;    
}

function ChangeHudType(byte Type)
{
    //return;    
}

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
    ProgressFadeTime=1.0000000
    MOTDColor=(R=255,G=255,B=255,A=255)
    HudScale=0.8403300
    HudOpacity=255.0000000
    HudCanvasScale=1.0000000
    CrosshairScale=1.0000000
    CrosshairOpacity=1.0000000
    CrossHairColor=(R=255,G=255,B=255,A=255)
    ConsoleMessageCount=4
    ConsoleFontSize=5
    ConsoleMessagePosY=1.0000000
    FontArrayNames[0]="Engine.DefaultFont"
    FontArrayNames[1]="Engine.DefaultFont"
    FontArrayNames[2]="Engine.DefaultFont"
    FontArrayNames[3]="Engine.DefaultFont"
    FontArrayNames[4]="Engine.DefaultFont"
    FontArrayNames[5]="Engine.DefaultFont"
    FontArrayNames[6]="Engine.DefaultFont"
    FontArrayNames[7]="Engine.DefaultFont"
    FontArrayNames[8]="Engine.DefaultFont"
    LastPickupTime=-999.0000000
    LastAmmoPickupTime=-999.0000000
    LastWeaponPickupTime=-999.0000000
    LastHealthPickupTime=-999.0000000
    LastArmorPickupTime=-999.0000000
    GoWalkingBeginTime=-1.0000000
    bHidden=true
    RemoteRole=0
}