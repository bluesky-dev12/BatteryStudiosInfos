/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wHudPart_MinimapBase.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:2
 *	Properties:63
 *	Functions:35
 *
 *******************************************************************************/
class wHudPart_MinimapBase extends HudBase
    transient;

struct MinimapDeadInfo
{
    var int TeamIndex;
    var Vector Location;
    var float TimeToRemove;
};

struct CachedSpecialPosInfo
{
    var Vector pos;
    var Material Image;
    var int Index;
    var bool IsDraw;
};

var HudBase HudOwner;
var LevelInfo Level;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify SpriteWidget MinimapBG;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify SpriteWidget MinimapBGMap;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify SpriteWidget MinimapCompass;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify SpriteWidget MinimapFlatTop;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify SpriteWidget MinimapFlatBottom;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify SpriteWidget MinimapMyself;
var Material MinimapMatMyself;
var Material MinimapMatAlly;
var Material MinimapMatAttackingAlly;
var Material MinimapFCMatAlly;
var Material MinimapFCMatAttackingAlly;
var Material MinimapMatRadioMessage;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify SpriteWidget MinimapDeadAlly;
var() array<SpriteWidget> MinimapAttackingEnemies;
var() array<SpriteWidget> MinimapDeadEnemies;
var() array<MinimapDeadInfo> MinimapDeadInfos;
var SpriteWidget MinimapAlien;
var() SpriteWidget MinimapStrikeAlly;
var() SpriteWidget MinimapStrikeEnem;
var() SpriteWidget MinimapAirStrikeRect;
var() SpriteWidget MinimapAirStrikeAllyRect;
var() SpriteWidget MinimapAirStrikeEnemRect;
var() int MinimapCompassVisibleWidth;
var() int MinimapCompassNorthPoint;
var() int MinimapCompassWidth;
var() int MinimapCenterX;
var() int MinimapCenterY;
var() int MinimapSize;
var() int MinimapCoverSize;
var() float MinimapScale;
var() int MinimapDrawBuffer;
var() float MinimapAllyFireNotificationDuration;
var() float MinimapEnemyDrawDuration_Pre;
var() float MinimapEnemyDrawDuration_Post;
var() float DeadDrawDuration;
var() float MinimapAllyRadioMessageDuration;
var() float fBlinkTimeLen;
var() float fBlinkTerm;
var array< class<Actor> > SpecialPositions_Class;
var array<Material> SpecialPositions_Image;
var float UpdateTime_SpecialPositions;
var array<CachedSpecialPosInfo> CachedSpecialPositions;
var Color BaseColor;
var float IconSizeF;
var bool DrawFrame;
var bool DrawCompass;
var bool DrawNorthPole;
var VariableTexPanner UAVBG_Base;
var TexRotator UAVBG;
var Vector t1;
var Vector t2;
var Vector w1;
var Vector w2;
var Vector tPerW;
var bool IsDrawSpecialPositions;
var bool IsClampDistance_SpecialPositions;
var float ClampDistance;
var float ClampDistance_SpecialPositions;
var Vector tempVect;
var Rotator tempRot;
var delegate<OnPreDrawMyself> __OnPreDrawMyself__Delegate;

function Initialize(HudBase myOwner, LevelInfo myLevel)
{
    HudOwner = myOwner;
    Level = myLevel;
    InitializeCoords();
    CacheSpecialPositions();
    SetTimer(5.0, true);
    myOwner.AddChildHudPart(self);
}

function GetPivotCoords(out Vector it1, out Vector iw1, out Vector it2, out Vector iw2)
{
    // End:0xc8
    if(Level.BG == none)
    {
        Level.TextureCoord1 = Level.MakeVector(102.0, 295.0, 0.0);
        Level.TextureCoord2 = Level.MakeVector(339.0, 93.0, 0.0);
        Level.WorldCoord1 = Level.MakeVector(-3465.0, 5470.0, 0.0);
        Level.WorldCoord2 = Level.MakeVector(5794.0, -2184.0, 0.0);
    }
    it1 = Level.TextureCoord1;
    iw1 = -Level.WorldCoord1;
    it2 = Level.TextureCoord2;
    iw2 = -Level.WorldCoord2;
}

function InitializeCoords()
{
    local float tDx, tDy, wDx, wDy, txPerWx, tyPerWy;

    GetPivotCoords(t1, w1, t2, w2);
    tDx = t2 - t1.X;
    tDy = t2 - t1.Y;
    wDx = w2 - w1.X;
    wDy = w2 - w1.Y;
    txPerWx = tDx / wDx;
    tyPerWy = tDy / wDy;
    tPerW = MakeVector(txPerWx, tyPerWy, 0.0);
}

function Timer();
function CacheSpecialPositions()
{
    local int lp1;
    local Actor loc;
    local CachedSpecialPosInfo cspInfo;

    CachedSpecialPositions.Length = 0;
    lp1 = 0;
    J0x0f:
    // End:0x9f [While If]
    if(lp1 < SpecialPositions_Class.Length)
    {
        // End:0x94
        foreach DynamicActors(SpecialPositions_Class[lp1], loc)
        {
            cspInfo.pos = loc.Location;
            cspInfo.Image = SpecialPositions_Image[lp1];
            cspInfo.Index = lp1;
            cspInfo.IsDraw = true;
            CachedSpecialPositions[CachedSpecialPositions.Length] = cspInfo;                        
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
}

function DrawMinimap_NorthPole(Canvas C)
{
    local Vector wo1, wo2, loc;
    local float minimapX, minimapY, W, H;
    local TexRotator mat;

    MapMinimapTextureLocationToWorldLocation(int(Level.MinimapCropCoords1.X), int(Level.MinimapCropCoords1.Y), wo1);
    MapMinimapTextureLocationToWorldLocation(int(Level.MinimapCropCoords2.X), int(Level.MinimapCropCoords2.Y), wo2);
    loc = MakeVector(HudOwner.PawnOwner.Location.X, wo1.Y - 0.50 * Abs(wo1.Y - wo2.Y), 0.0);
    mat = TexRotator(DynamicLoadObject("warfare_GP_ui_hud_etc.img_north_rot", class'Material', true));
    CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, loc, minimapX, minimapY);
    ClampMinimapPosition(minimapX, minimapY);
    W = float(mat.MaterialUSize());
    H = float(mat.MaterialVSize());
    mat.Rotation.Yaw = HudOwner.PawnOwner.Rotation.Yaw + 16383;
    C.SetPos(minimapX - W / float(2) / 1024.0 * C.ClipX, minimapY - H / float(2) / 768.0 * C.ClipY);
    C.DrawTile(mat, W / 1024.0 * C.ClipX, H / 768.0 * C.ClipY, 0.0, 0.0, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
}

function MapWorldLocationToMinimapTextureLocation(Vector Location, out int cX, out int cY)
{
    local Vector targetT;

    Location = -Location;
    targetT = t1 + Location - w1 * tPerW;
    cX = int(targetT.X);
    cY = int(targetT.Y);
}

function MapMinimapTextureLocationToWorldLocation(int TX, int ty, out Vector Location)
{
    local Vector t;

    t.X = float(TX);
    t.Y = float(ty);
    Location = t - t1;
    Location.X /= tPerW.X;
    Location.Y /= tPerW.Y;
    Location = -Location + w1;
}

function DrawMinimap_BGMap(Canvas C)
{
    local int cX, cY, X1, Y1;
    local TexRotator rotTexture;

    MapWorldLocationToMinimapTextureLocation(HudOwner.PawnOwner.Location, cX, cY);
    X1 = cX - MinimapCoverSize / 2;
    Y1 = cY - MinimapCoverSize / 2;
    // End:0x180
    if(Level.BG != none)
    {
        rotTexture = Level.BG;
        rotTexture.UOffset = float(cX);
        rotTexture.VOffset = float(cY);
        rotTexture.Rotation.Yaw = HudOwner.PawnOwner.Rotation.Yaw + 16383;
        MinimapBGMap.WidgetTexture = rotTexture;
        C.SetPos(float(MinimapCenterX - MinimapSize / 2) * _rX, float(MinimapCenterY - MinimapSize / 2) * _rY);
        C.DrawTile(MinimapBGMap.WidgetTexture, float(MinimapSize) * _rX, float(MinimapSize) * _rY, float(X1), float(Y1), float(MinimapCoverSize), float(MinimapCoverSize));
    }
}

function SetupBGMapUAV()
{
    local float Progress;
    local int TX, ty, tx2, ty2, scanTx;

    // End:0x2c
    if(HudOwner.PawnOwner == none)
    {
        UAVBG.Rotation.Yaw = 0;
    }
    // End:0x63
    else
    {
        UAVBG.Rotation.Yaw = HudOwner.PawnOwner.Rotation.Yaw + 16783;
    }
    UAVBG.UOffset = float(UAVBG.MaterialUSize() / 2);
    UAVBG.VOffset = float(UAVBG.MaterialVSize() / 2);
    CalculateTexturePositionFromMinimapPosition(float(MinimapCenterX - MinimapSize / 2), float(MinimapCenterY - MinimapSize / 2), tx2, ty2);
    CalculateTexturePositionFromMinimapPosition(float(MinimapCenterX + MinimapSize / 2), float(MinimapCenterY + MinimapSize / 2), TX, ty);
    scanTx = int(HudOwner.GetUAVScanLineTexturePos());
    Progress = float(scanTx - TX) / float(tx2 - TX);
    UAVBG_Base.PanOffset = Progress;
    UAVBG_Base.PanDirection.Yaw = 32767;
}

function DrawMinimap_BGMapUAV(Canvas C)
{
    local int X1, Y1, X2, Y2;

    X1 = int(float(MinimapCenterX - MinimapSize / 2) / 1024.0 * C.ClipX);
    Y1 = int(float(MinimapCenterY - MinimapSize / 2) / 768.0 * C.ClipY);
    X2 = int(float(X1 + MinimapSize) / 1024.0 * C.ClipX);
    Y2 = int(float(Y1 + MinimapSize) / 768.0 * C.ClipY);
    SetupBGMapUAV();
    C.SetPos(float(X1), float(Y1));
    C.DrawTile(UAVBG, float(MinimapSize) / 1024.0 * C.ClipX, float(MinimapSize) / 768.0 * C.ClipY, 0.0, 0.0, float(UAVBG.MaterialUSize()), float(UAVBG.MaterialVSize()));
}

function DrawMinimap_Frame(Canvas C)
{
    C.SetPos(float(MinimapCenterX - MinimapSize / 2) * _rX, float(MinimapCenterY - MinimapSize / 2) * _rY);
    C.DrawTileStretched(MinimapBG.WidgetTexture, float(MinimapSize) * _rX, float(MinimapSize) * _rY);
}

function DrawMinimap_Compass(Canvas C)
{
    local int center, Left, Right;
    local float fRotation;

    fRotation = float(-HudOwner.PawnOwner.Rotation.Yaw) / 65535.0;
    center = int(float(MinimapCompassNorthPoint) + float(MinimapCompassWidth) * fRotation);
    Left = center - MinimapCompassVisibleWidth / 2;
    Right = center + MinimapCompassVisibleWidth / 2;
    MinimapCompass.TextureCoords.X1 = Left;
    MinimapCompass.TextureCoords.X2 = Right;
    DrawTileFromSpriteWidget(C, MinimapCompass);
}

function float getSelfIconScale()
{
    local float fBlinkCurTime, fBlinkValue, MinimapIconScale;
    local byte MinimapBlinkPlusMinus;

    fBlinkCurTime = Level.TimeSeconds - HudOwner.GoWalkingBeginTime;
    // End:0x55
    if(fBlinkCurTime > fBlinkTimeLen)
    {
        HudOwner.GoWalkingBeginTime = 0.0;
        MinimapIconScale = 1.0;
    }
    // End:0xc9
    else
    {
        fBlinkValue = fBlinkCurTime % fBlinkTerm;
        MinimapBlinkPlusMinus = byte(fBlinkCurTime / fBlinkTerm);
        // End:0xa9
        if(float(MinimapBlinkPlusMinus) % float(2) != float(0))
        {
            fBlinkValue = fBlinkTerm + -1.0 * fBlinkValue;
        }
        MinimapIconScale = 1.0 + 2.0 * fBlinkValue / fBlinkTerm;
    }
    return MinimapIconScale;
}

function DrawMinimap_Myself(Canvas C)
{
    local TexRotator TexRotator;
    local float W, H;
    local Color old;
    local float selfIconScale;

    TexRotator = TexRotator(MinimapMatMyself);
    TexRotator.Rotation.Yaw = 0;
    selfIconScale = getSelfIconScale();
    W = float(MinimapMatMyself.MaterialUSize()) * IconSizeF * selfIconScale;
    H = float(MinimapMatMyself.MaterialVSize()) * IconSizeF * selfIconScale;
    old = C.DrawColor;
    C.SetPos(float(MinimapCenterX) - W / float(2) * _rX, float(MinimapCenterY) - H / float(2) * _rY);
    C.DrawColor = WhiteColor;
    C.DrawTile(MinimapMatMyself, W * _rX, H * _rY, 0.0, 0.0, float(MinimapMatMyself.MaterialUSize()), float(MinimapMatMyself.MaterialVSize()));
    C.DrawColor = old;
}

function CalculateMinimapPositionPawnCentering(Pawn centerPawn, Vector TargetLoc, out float minimapX, out float minimapY)
{
    // End:0x2d
    if(centerPawn == none)
    {
        CalculateMinimapPosition(tempVect, tempRot, TargetLoc, minimapX, minimapY);
    }
    // End:0x5e
    else
    {
        CalculateMinimapPosition(centerPawn.Location, centerPawn.Rotation, TargetLoc, minimapX, minimapY);
    }
}

function CalculateMinimapPosition(Vector centerLoc, Rotator centerRotation, Vector TargetLoc, out float minimapX, out float minimapY)
{
    local int cX, cY, TX, ty;
    local Vector relativeLoc;

    MapWorldLocationToMinimapTextureLocation(centerLoc, cX, cY);
    MapWorldLocationToMinimapTextureLocation(TargetLoc, TX, ty);
    relativeLoc.X = float(TX - cX);
    relativeLoc.Y = float(ty - cY);
    relativeLoc = relativeLoc << centerRotation;
    minimapX = float(MinimapCenterX) + relativeLoc.Y * float(MinimapSize) / float(MinimapCoverSize);
    minimapY = float(MinimapCenterY) - relativeLoc.X * float(MinimapSize) / float(MinimapCoverSize);
}

function CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, out int TX, out int ty)
{
    local int cX, cY;

    MapWorldLocationToMinimapTextureLocation(HudOwner.PawnOwner.Location, cX, cY);
    ty = int(minimapX - float(MinimapCenterX) + float(cY));
    TX = int(-minimapY - float(MinimapCenterY) + float(cX));
}

function bool IsWithinMinimapArea(float X, float Y)
{
    return float(MinimapCenterX - MinimapSize / 2 + MinimapDrawBuffer) <= X && X <= float(MinimapCenterX + MinimapSize / 2 - MinimapDrawBuffer) && float(MinimapCenterY - MinimapSize / 2 + MinimapDrawBuffer) <= Y && Y <= float(MinimapCenterY + MinimapSize / 2 - MinimapDrawBuffer);
}

function ClampMinimapPosition(out float X, out float Y, optional float W, optional float H)
{
    // End:0x37
    if(X < float(MinimapCenterX - MinimapSize / 2))
    {
        X = float(MinimapCenterX - MinimapSize / 2);
    }
    // End:0x6b
    else
    {
        // End:0x6b
        if(X > float(MinimapCenterX + MinimapSize / 2))
        {
            X = float(MinimapCenterX + MinimapSize / 2);
        }
    }
    // End:0xa2
    if(Y < float(MinimapCenterY - MinimapSize / 2))
    {
        Y = float(MinimapCenterY - MinimapSize / 2);
    }
    // End:0xd6
    else
    {
        // End:0xd6
        if(Y > float(MinimapCenterY + MinimapSize / 2))
        {
            Y = float(MinimapCenterY + MinimapSize / 2);
        }
    }
}

function SetupMinimapSpriteWidgetForDrawing(out SpriteWidget Sprite, Rotator Rotation, float minimapX, float minimapY)
{
    local TexRotator TexRotator;

    Sprite.OffsetX = int(minimapX);
    Sprite.OffsetY = int(minimapY);
    TexRotator = TexRotator(Sprite.WidgetTexture);
    // End:0x82
    if(TexRotator != none)
    {
        TexRotator.Rotation.Yaw = -Rotation.Yaw - HudOwner.PawnOwner.Rotation.Yaw;
    }
}

function CalcMinimapRotation(Rotator Rotation, out Rotator outRotation)
{
    outRotation.Yaw = Rotation.Yaw - HudOwner.PawnOwner.Rotation.Yaw;
}

function PushDeadOnMinimap(int TeamIndex, Vector Location)
{
    local bool OtherTeam;
    local MinimapDeadInfo Info;

    // End:0x1a
    if(Level == none || HudOwner == none)
    {
        return;
    }
    OtherTeam = !IsSameTeamByIndex(HudOwner.PlayerOwner.GetTeamNum(), TeamIndex);
    // End:0x66
    if(OtherTeam && !IsEnemyInRange(Location))
    {
        return;
    }
    // End:0xb8
    else
    {
        Info.TeamIndex = TeamIndex;
        Info.Location = Location;
        Info.TimeToRemove = Level.TimeSeconds + DeadDrawDuration;
        MinimapDeadInfos[MinimapDeadInfos.Length] = Info;
    }
}

function bool IsSameTeamByPRI(PlayerReplicationInfo pri1, PlayerReplicationInfo pri2)
{
    // End:0x14
    if(pri1 == pri2)
    {
        return true;
    }
    // End:0xa9
    else
    {
        // End:0x48
        if(Level.GRI.GameClass == "WGame.wDeathMatch")
        {
            return false;
        }
        // End:0xa9
        else
        {
            // End:0x74
            if(pri1.Team == none || pri2.Team == none)
            {
                return false;
            }
            return IsSameTeamByIndex(pri1.Team.TeamIndex, pri2.Team.TeamIndex);
        }
    }
}

function bool IsSameTeamByIndex(int Team1, int Team2)
{
    // End:0x31
    if(Level.GRI.GameClass ~= "WGame.wDeathMatch")
    {
        return false;
    }
    return Team1 == Team2;
}

function DrawMinimap_Allies(Canvas C)
{
    local wPawn P, wPawnOwner;
    local float minimapX, minimapY;
    local int lp1;
    local HudCDeathmatch HUD;
    local Rotator R;
    local float W, H, w2, H2, UL, VL;

    W = float(MinimapMatAlly.MaterialUSize()) * _rX * IconSizeF;
    H = float(MinimapMatAlly.MaterialVSize()) * _rY * IconSizeF;
    w2 = W / float(2);
    H2 = H / float(2);
    UL = float(MinimapMatAlly.MaterialUSize());
    VL = float(MinimapMatAlly.MaterialVSize());
    wPawnOwner = wPawn(HudOwner.PawnOwner);
    HUD = HudCDeathmatch(HudOwner);
    C.Style = 5;
    lp1 = 0;
    J0xdb:
    // End:0x583 [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = wPawn(Level.PawnList[lp1]);
        // End:0x579
        if(P != none && P.PlayerReplicationInfo != none && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none && P.OwnerName != HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName)
        {
            // End:0x579
            if(P != wPawnOwner && IsSameTeamByPRI(HudOwner.PlayerOwner.PlayerReplicationInfo, P.PlayerReplicationInfo))
            {
                CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.Location, minimapX, minimapY);
                // End:0x579
                if(IsWithinMinimapArea(minimapX, minimapY) || HudOwner.PawnOwner != none && VSize(HudOwner.PawnOwner.Location - P.Location) < ClampDistance)
                {
                    ClampMinimapPosition(minimapX, minimapY);
                    // End:0x579
                    if(!P.IsInState('Dying'))
                    {
                        CalcMinimapRotation(P.Rotation, R);
                        // End:0x3dd
                        if(P.fLastFireNoiseTime >= Level.TimeSeconds - MinimapAllyFireNotificationDuration)
                        {
                            // End:0x35f
                            if(P.PlayerReplicationInfo.bBot == true || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                            {
                                C.DrawTileExactWithRotation(MinimapMatAttackingAlly, minimapX * _rX - w2, minimapY * _rY - H2, W, H, 0.0, 0.0, UL, VL, R);
                            }
                            // End:0x3da
                            else
                            {
                                // End:0x3da
                                if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                                {
                                    C.DrawTileExactWithRotation(MinimapFCMatAttackingAlly, minimapX * _rX - w2, minimapY * _rY - H2, W, H, 0.0, 0.0, UL, VL, R);
                                }
                            }
                        }
                        // End:0x579
                        else
                        {
                            // End:0x460
                            if(P.fLastRadioMessageTime >= Level.TimeSeconds - MinimapAllyRadioMessageDuration)
                            {
                                C.DrawTileExact(MinimapMatRadioMessage, minimapX * _rX - w2, minimapY * _rY - H2, W, H, 0.0, 0.0, UL, VL);
                            }
                            // End:0x579
                            else
                            {
                                // End:0x4fe
                                if(P.PlayerReplicationInfo.bBot == true || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                                {
                                    C.DrawTileExactWithRotation(MinimapMatAlly, minimapX * _rX - w2, minimapY * _rY - H2, W, H, 0.0, 0.0, UL, VL, R);
                                }
                                // End:0x579
                                else
                                {
                                    // End:0x579
                                    if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                                    {
                                        C.DrawTileExactWithRotation(MinimapFCMatAlly, minimapX * _rX - w2, minimapY * _rY - H2, W, H, 0.0, 0.0, UL, VL, R);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xdb;
    }
    C.Style = 1;
}

function bool IsEnemyInRange(Vector loc)
{
    return true;
}

function DrawMinimap_Enemies(Canvas C)
{
    local wPawn P;
    local float minimapX, minimapY;
    local SpriteWidget Sprite;
    local int pTeamIndex, lp1;
    local HudCDeathmatch HUD;
    local bool Draw;
    local float diff, W, H;
    local bool bAdmin, bAlienGame;

    bAdmin = HudOwner.PlayerOwner.PlayerReplicationInfo.bAdminSpecator;
    bAlienGame = Level.GRI.GameClass == "WMission.wDefenceGameInfo";
    HUD = HudCDeathmatch(HudOwner);
    lp1 = 0;
    J0x7a:
    // End:0x49f [While If]
    if(lp1 < Level.PawnList.Length)
    {
        P = wPawn(Level.PawnList[lp1]);
        // End:0x495
        if(P != none && P.PlayerReplicationInfo != none)
        {
            // End:0x119
            if(P.PlayerReplicationInfo.Team != none)
            {
                pTeamIndex = P.PlayerReplicationInfo.Team.TeamIndex;
            }
            // End:0x120
            else
            {
                pTeamIndex = 0;
            }
            // End:0x495
            if(!IsSameTeamByPRI(HudOwner.PlayerOwner.PlayerReplicationInfo, P.PlayerReplicationInfo))
            {
                // End:0x495
                if(true)
                {
                    // End:0x1ac
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap)
                    {
                        P.UpdateLastKnownPosAndTime(P.Location, HudOwner.Level.TimeSeconds);
                    }
                    CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.LastKnownPos, minimapX, minimapY);
                    // End:0x495
                    if(IsWithinMinimapArea(minimapX, minimapY) || HudOwner.PawnOwner != none && VSize(HudOwner.PawnOwner.Location - P.Location) < ClampDistance)
                    {
                        ClampMinimapPosition(minimapX, minimapY);
                        Draw = bAdmin;
                        // End:0x28a
                        if(Level.TimeSeconds - P.LastKnownTime < MinimapEnemyDrawDuration_Pre + MinimapEnemyDrawDuration_Post)
                        {
                            Draw = true;
                        }
                        // End:0x495
                        if(Draw)
                        {
                            // End:0x2ad
                            if(bAlienGame == true)
                            {
                                Sprite = MinimapAlien;
                            }
                            // End:0x2be
                            else
                            {
                                Sprite = MinimapAttackingEnemies[pTeamIndex];
                            }
                            SetupMinimapSpriteWidgetForDrawing(Sprite, P.Rotation, minimapX, minimapY);
                            diff = Level.TimeSeconds - P.LastKnownTime;
                            // End:0x360
                            if(diff <= MinimapEnemyDrawDuration_Pre)
                            {
                                // End:0x33d
                                if(MinimapEnemyDrawDuration_Pre == float(0))
                                {
                                    C.ColorModulate.W = 1.0;
                                }
                                // End:0x35d
                                else
                                {
                                    C.ColorModulate.W = diff / MinimapEnemyDrawDuration_Pre;
                                }
                            }
                            // End:0x38e
                            else
                            {
                                C.ColorModulate.W = MinimapEnemyDrawDuration_Post - diff - MinimapEnemyDrawDuration_Pre / MinimapEnemyDrawDuration_Post;
                            }
                            W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
                            H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
                            C.SetPos(minimapX - W / float(2) * _rX, minimapY - H / float(2) * _rY);
                            C.DrawTile(Sprite.WidgetTexture, W * _rY, H * _rY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
                            C.ColorModulate.W = 1.0;
                        }
                    }
                }
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7a;
    }
}

function DrawMinimap_Deads(Canvas C)
{
    local int lp1;
    local MinimapDeadInfo Info;
    local SpriteWidget Sprite;
    local float X, Y, W, H;

    lp1 = MinimapDeadInfos.Length - 1;
    J0x0f:
    // End:0x248 [While If]
    if(lp1 >= 0)
    {
        Info = MinimapDeadInfos[lp1];
        // End:0x57
        if(Info.TimeToRemove <= Level.TimeSeconds)
        {
            MinimapDeadInfos.Remove(lp1, 1);
        }
        // End:0x23e
        else
        {
            // End:0x90
            if(IsSameTeamByIndex(Info.TeamIndex, HudOwner.PlayerOwner.GetTeamNum()))
            {
                Sprite = MinimapDeadAlly;
            }
            // End:0xa6
            else
            {
                Sprite = MinimapDeadEnemies[Info.TeamIndex];
            }
            CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, Info.Location, X, Y);
            // End:0x23e
            if(IsWithinMinimapArea(X, Y) || HudOwner.PawnOwner != none && VSize(HudOwner.PawnOwner.Location - Info.Location) < ClampDistance)
            {
                ClampMinimapPosition(X, Y);
                W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
                H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
                C.SetPos(X - W / float(2) * _rX, Y - H / float(2) * _rY);
                C.DrawTile(Sprite.WidgetTexture, W * _rX, float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF * _rY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
            }
        }
        -- lp1;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
}

function DrawMinimap_Helicopter(Canvas C)
{
    local wHelicopter P;
    local float minimapX, minimapY;
    local SpriteWidget Sprite;
    local int pTeamIndex, lp1;
    local float W, H;

    lp1 = 0;
    J0x07:
    // End:0x218 [While If]
    if(lp1 < Level.Helicopters.Length)
    {
        P = wHelicopter(Level.Helicopters[lp1]);
        // End:0x20e
        if(P != none && !P.bHidden)
        {
            pTeamIndex = P.TeamIndex;
            CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.Location, minimapX, minimapY);
            ClampMinimapPosition(minimapX, minimapY);
            // End:0xe9
            if(pTeamIndex == HudOwner.PlayerOwner.GetTeamNum())
            {
                Sprite = P.MinimapIconAlly;
            }
            // End:0xfd
            else
            {
                Sprite = P.MinimapIconEnemy;
            }
            SetupMinimapSpriteWidgetForDrawing(Sprite, P.Rotation, minimapX, minimapY);
            W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
            H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
            C.SetPos(minimapX - W / float(2) * _rX, minimapY - H / float(2) * _rY);
            C.DrawTile(Sprite.WidgetTexture, W * _rX, H * _rY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function DrawMinimap_Airstrike(Canvas C)
{
    local float minimapX, minimapY, W, H;
    local SpriteWidget Sprite;
    local Rotator emptyRotation;

    CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, Level.AirStrikeLocation, minimapX, minimapY);
    ClampMinimapPosition(minimapX, minimapY);
    // End:0x75
    if(Level.AirStrikeTeamIndex == HudOwner.PlayerOwner.GetTeamNum())
    {
        Sprite = MinimapStrikeAlly;
    }
    // End:0x80
    else
    {
        Sprite = MinimapStrikeEnem;
    }
    SetupMinimapSpriteWidgetForDrawing(Sprite, emptyRotation, minimapX, minimapY);
    W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
    H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
    C.SetPos(minimapX - W / float(2) * _rX, minimapY - H / float(2) * _rY);
    C.DrawTile(Sprite.WidgetTexture, float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF * _rY, float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF * _rY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
    // End:0x21a
    if(Level.IsAirStriking == false)
    {
        Level.fAirStrikeFadeTime -= Level.AppDeltaTime;
        // End:0x217
        if(Level.fAirStrikeFadeTime <= 0.0)
        {
            Level.fAirStrikeFadeTime = 0.0;
        }
    }
    // End:0x246
    else
    {
        // End:0x246
        if(Level.fAirStrikeFadeTime != 2.0)
        {
            Level.fAirStrikeFadeTime = 2.0;
        }
    }
}

function DrawMinimap_Mission(Canvas C);
function DrawMinimap_SpecialPositions(Canvas C)
{
    local int lp1;
    local float minimapX, minimapY;
    local Vector loc;
    local Material mat;
    local float W, H;
    local bool bDraw;
    local Actor actorloc;
    local int actCount;

    // End:0x71
    if(Level.GRI.GameClass ~= "WMission.wSDGameInfo" || Level.GRI.GameClass ~= "WMission.wSBTGameInfo")
    {
        IsDrawSpecialPositions = false;
        return;
    }
    // End:0xfe
    if(Level.GetMatchMaker() != none)
    {
        // End:0xfe
        if(Level.GetMatchMaker().eWeaponLimit == Level.GetMatchMaker().5 || Level.GetMatchMaker().eWeaponLimit == Level.GetMatchMaker().1)
        {
            IsDrawSpecialPositions = false;
            return;
        }
    }
    // End:0x201
    if(Level.TimeSeconds - UpdateTime_SpecialPositions > 0.50)
    {
        UpdateTime_SpecialPositions = Level.TimeSeconds;
        lp1 = 0;
        J0x138:
        // End:0x201 [While If]
        if(lp1 < CachedSpecialPositions.Length)
        {
            actorloc = none;
            actCount = 0;
            // End:0x1c2
            foreach DynamicActors(SpecialPositions_Class[CachedSpecialPositions[lp1].Index], actorloc)
            {
                // End:0x1c1
                if(actorloc.bHidden == false && VSize(actorloc.Location - CachedSpecialPositions[lp1].pos) < 0.10)
                {
                    ++ actCount;
                }                                
            }
            // End:0x1e4
            if(actCount == 0)
            {
                CachedSpecialPositions[lp1].IsDraw = false;
            }
            // End:0x1f7
            else
            {
                CachedSpecialPositions[lp1].IsDraw = true;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x138;
        }
    }
    lp1 = 0;
    J0x208:
    // End:0x3c7 [While If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x232
        if(CachedSpecialPositions[lp1].IsDraw == false)
        {
        }
        // End:0x3bd
        else
        {
            loc = CachedSpecialPositions[lp1].pos;
            mat = CachedSpecialPositions[lp1].Image;
            CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, loc, minimapX, minimapY);
            bDraw = false;
            // End:0x2c7
            if(IsClampDistance_SpecialPositions)
            {
                // End:0x2c4
                if(VSize(HudOwner.PawnOwner.Location - loc) < ClampDistance_SpecialPositions)
                {
                    bDraw = true;
                }
            }
            // End:0x2cf
            else
            {
                bDraw = true;
            }
            // End:0x3bd
            if(bDraw)
            {
                ClampMinimapPosition(minimapX, minimapY);
                W = float(mat.MaterialUSize()) * IconSizeF;
                H = float(mat.MaterialVSize()) * IconSizeF;
                C.SetPos(minimapX - W / float(2) * _rX, minimapY - H / float(2) * _rY);
                C.DrawTile(mat, W * _rX, H * _rY, 0.0, 0.0, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x208;
    }
}

delegate OnPreDrawMyself(Canvas C);
function Draw(Canvas C)
{
    C.DrawColor = BaseColor;
    // End:0x28
    if(DrawFrame)
    {
        DrawMinimap_Frame(C);
    }
    DrawMinimap_BGMap(C);
    // End:0x50
    if(HudOwner.IsUAVScanning())
    {
        DrawMinimap_BGMapUAV(C);
    }
    // End:0x64
    if(DrawCompass)
    {
        DrawMinimap_Compass(C);
    }
    // End:0x78
    if(IsDrawSpecialPositions)
    {
        DrawMinimap_SpecialPositions(C);
    }
    DrawMinimap_Allies(C);
    DrawMinimap_Enemies(C);
    DrawMinimap_Deads(C);
    OnPreDrawMyself(C);
    DrawMinimap_Helicopter(C);
    DrawMinimap_Airstrike(C);
    DrawMinimap_Myself(C);
    // End:0xdd
    if(DrawNorthPole)
    {
        DrawMinimap_NorthPole(C);
    }
}

defaultproperties
{
    MinimapBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=9,OffsetY=9,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapCompass=(WidgetTexture=Texture'Warfare_UI.HUD.minimap_compass',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=255,Y2=15),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=5,OffsetY=5,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapFlatTop=(WidgetTexture=Texture'Warfare_UI.HUD.FlatLine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=162,Y2=2),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=5,OffsetY=21,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapFlatBottom=(WidgetTexture=Texture'Warfare_UI.HUD.FlatLine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=162,Y2=2),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=5,OffsetY=185,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapMatMyself=TexRotator'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_myself2_rot'
    MinimapMatAlly=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_team'
    MinimapMatAttackingAlly=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_team_comb_rot_fb'
    MinimapFCMatAlly=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_clan'
    MinimapFCMatAttackingAlly=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_clan_comb_rot_fb'
    MinimapMatRadioMessage=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_radio_final'
    MinimapDeadAlly=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.death_our',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAttackingEnemies=// Object reference not set to an instance of an object.
    
    MinimapDeadEnemies=// Object reference not set to an instance of an object.
    
    MinimapAlien=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_walk',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapStrikeAlly=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_wh_bom',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapStrikeEnem=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_r_bom',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAirStrikeAllyRect=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.img_area_bombing2_Ally',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAirStrikeEnemRect=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.img_area_bombing2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapCompassVisibleWidth=162
    MinimapCompassNorthPoint=139
    MinimapCompassWidth=256
    MinimapCenterX=104
    MinimapCenterY=104
    MinimapSize=186
    MinimapCoverSize=186
    MinimapScale=50.0
    MinimapDrawBuffer=8
    MinimapAllyFireNotificationDuration=3.0
    MinimapEnemyDrawDuration_Post=4.50
    DeadDrawDuration=10.0
    MinimapAllyRadioMessageDuration=5.0
    fBlinkTimeLen=3.0
    fBlinkTerm=0.50
    SpecialPositions_Class=// Object reference not set to an instance of an object.
    
    SpecialPositions_Image=// Object reference not set to an instance of an object.
    
    BaseColor=(R=255,G=255,B=255,A=255)
    IconSizeF=1.0
    DrawFrame=true
    UAVBG_Base=VariableTexPanner'Warfare_GP_UI_HUD_ETC.minimapicon.UAV4_VPan'
    UAVBG=TexRotator'Warfare_GP_UI_HUD_ETC.minimapicon.UAV4_Rot'
    IsDrawSpecialPositions=true
    IsClampDistance_SpecialPositions=true
    ClampDistance=6000.0
    ClampDistance_SpecialPositions=3000.0
}