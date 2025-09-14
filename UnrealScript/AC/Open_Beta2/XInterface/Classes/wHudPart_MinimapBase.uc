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
    var Actor RefActor;
};

var HudBase HudOwner;
var LevelInfo Level;
var() automated SpriteWidget MinimapBG;
var() automated SpriteWidget MinimapBGMap;
var() automated SpriteWidget MinimapCompass;
var() automated SpriteWidget MinimapFlatTop;
var() automated SpriteWidget MinimapFlatBottom;
var() automated SpriteWidget MinimapMyself;
var Material MinimapMatMyself;
var Material MinimapMatAlly;
var Material MinimapMatAttackingAlly;
var Material MinimapFCMatAlly;
var Material MinimapFCMatAttackingAlly;
var Material MinimapMatRadioMessage;
var() automated SpriteWidget MinimapDeadAlly;
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
var SpriteWidget MinimapIconAlly;
var SpriteWidget MinimapIconEnemy;
var SpriteWidget MinimapIconEnemyBoss[3];
var SpriteWidget MinimapIconEnemyBossBlend[3];
var int MinimapIconEnemyID[3];
var array< Class<Actor> > SpecialPositions_Class;
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
//var delegate<OnPreDrawMyself> __OnPreDrawMyself__Delegate;

function Initialize(HudBase myOwner, LevelInfo myLevel)
{
    HudOwner = myOwner;
    Level = myLevel;
    InitializeCoords();
    CacheSpecialPositions();
    SetTimer(5.0000000, true);
    myOwner.AddChildHudPart(self);
    //return;    
}

function GetPivotCoords(out Vector it1, out Vector iw1, out Vector it2, out Vector iw2)
{
    // End:0xC8
    if(Level.BG == none)
    {
        Level.TextureCoord1 = Level.MakeVector(102.0000000, 295.0000000, 0.0000000);
        Level.TextureCoord2 = Level.MakeVector(339.0000000, 93.0000000, 0.0000000);
        Level.WorldCoord1 = Level.MakeVector(-3465.0000000, 5470.0000000, 0.0000000);
        Level.WorldCoord2 = Level.MakeVector(5794.0000000, -2184.0000000, 0.0000000);
    }
    it1 = Level.TextureCoord1;
    iw1 = -Level.WorldCoord1;
    it2 = Level.TextureCoord2;
    iw2 = -Level.WorldCoord2;
    //return;    
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
    tPerW = MakeVector(txPerWx, tyPerWy, 0.0000000);
    //return;    
}

function Timer()
{
    //return;    
}

function CacheSpecialPositions()
{
    local int lp1;
    local Actor loc;
    local CachedSpecialPosInfo cspInfo;

    CachedSpecialPositions.Length = 0;
    lp1 = 0;
    J0x0F:

    // End:0xAF [Loop If]
    if(lp1 < SpecialPositions_Class.Length)
    {
        // End:0xA4
        foreach DynamicActors(SpecialPositions_Class[lp1], loc)
        {
            cspInfo.pos = loc.Location;
            cspInfo.Image = SpecialPositions_Image[lp1];
            cspInfo.Index = lp1;
            cspInfo.IsDraw = true;
            cspInfo.RefActor = loc;
            CachedSpecialPositions[CachedSpecialPositions.Length] = cspInfo;            
        }        
        lp1++;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
}

function RemoveSpecialPositions(Actor act)
{
    local int lp1;

    lp1 = 0;
    J0x07:

    // End:0x4A [Loop If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x40
        if(CachedSpecialPositions[lp1].RefActor == act)
        {
            CachedSpecialPositions.Remove(lp1, 1);
            // [Explicit Break]
            goto J0x4A;
        }
        ++lp1;
        // [Loop Continue]
        goto J0x07;
    }
    J0x4A:

    //return;    
}

function DrawMinimap_NorthPole(Canvas C)
{
    local Vector wo1, wo2, loc;
    local float minimapX, minimapY, W, H;
    local TexRotator mat;

    MapMinimapTextureLocationToWorldLocation(int(Level.MinimapCropCoords1.X), int(Level.MinimapCropCoords1.Y), wo1);
    MapMinimapTextureLocationToWorldLocation(int(Level.MinimapCropCoords2.X), int(Level.MinimapCropCoords2.Y), wo2);
    loc = MakeVector(HudOwner.PawnOwner.Location.X, wo1.Y - (0.5000000 * Abs(wo1.Y - wo2.Y)), 0.0000000);
    mat = TexRotator(DynamicLoadObject("warfare_GP_ui_hud_etc.img_north_rot", Class'Engine.Material', true));
    CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, loc, minimapX, minimapY);
    ClampMinimapPosition(minimapX, minimapY);
    W = float(mat.MaterialUSize());
    H = float(mat.MaterialVSize());
    mat.Rotation.Yaw = HudOwner.PawnOwner.Rotation.Yaw + 16383;
    C.SetPos(((minimapX - (W / float(2))) / 1024.0000000) * C.ClipX, ((minimapY - (H / float(2))) / 768.0000000) * C.ClipY);
    C.DrawTile(mat, (W / 1024.0000000) * C.ClipX, (H / 768.0000000) * C.ClipY, 0.0000000, 0.0000000, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
    //return;    
}

function MapWorldLocationToMinimapTextureLocation(Vector Location, out int cX, out int cY)
{
    local Vector targetT;

    Location = -Location;
    targetT = t1 + ((Location - w1) * tPerW);
    cX = int(targetT.X);
    cY = int(targetT.Y);
    //return;    
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
    //return;    
}

function DrawMinimap_BGMap(Canvas C)
{
    local int cX, cY, X1, Y1;
    local TexRotator rotTexture;

    MapWorldLocationToMinimapTextureLocation(HudOwner.PawnOwner.Location, cX, cY);
    X1 = cX - (MinimapCoverSize / 2);
    Y1 = cY - (MinimapCoverSize / 2);
    // End:0x180
    if(Level.BG != none)
    {
        rotTexture = Level.BG;
        rotTexture.UOffset = float(cX);
        rotTexture.VOffset = float(cY);
        rotTexture.Rotation.Yaw = HudOwner.PawnOwner.Rotation.Yaw + 16383;
        MinimapBGMap.WidgetTexture = rotTexture;
        C.SetPos(float(MinimapCenterX - (MinimapSize / 2)) * _rX, float(MinimapCenterY - (MinimapSize / 2)) * _rY);
        C.DrawTile(MinimapBGMap.WidgetTexture, float(MinimapSize) * _rX, float(MinimapSize) * _rY, float(X1), float(Y1), float(MinimapCoverSize), float(MinimapCoverSize));
    }
    //return;    
}

function SetupBGMapUAV()
{
    local float Progress;
    local int TX, ty, tx2, ty2, scanTx;

    // End:0x2C
    if(HudOwner.PawnOwner == none)
    {
        UAVBG.Rotation.Yaw = 0;        
    }
    else
    {
        UAVBG.Rotation.Yaw = HudOwner.PawnOwner.Rotation.Yaw + 16783;
    }
    UAVBG.UOffset = float(UAVBG.MaterialUSize() / 2);
    UAVBG.VOffset = float(UAVBG.MaterialVSize() / 2);
    CalculateTexturePositionFromMinimapPosition(float(MinimapCenterX - (MinimapSize / 2)), float(MinimapCenterY - (MinimapSize / 2)), tx2, ty2);
    CalculateTexturePositionFromMinimapPosition(float(MinimapCenterX + (MinimapSize / 2)), float(MinimapCenterY + (MinimapSize / 2)), TX, ty);
    scanTx = int(HudOwner.GetUAVScanLineTexturePos());
    Progress = float(scanTx - TX) / float(tx2 - TX);
    UAVBG_Base.PanOffset = Progress;
    UAVBG_Base.PanDirection.Yaw = 32767;
    //return;    
}

function DrawMinimap_BGMapUAV(Canvas C)
{
    local int X1, Y1, X2, Y2;

    X1 = int((float(MinimapCenterX - (MinimapSize / 2)) / 1024.0000000) * C.ClipX);
    Y1 = int((float(MinimapCenterY - (MinimapSize / 2)) / 768.0000000) * C.ClipY);
    X2 = int((float(X1 + MinimapSize) / 1024.0000000) * C.ClipX);
    Y2 = int((float(Y1 + MinimapSize) / 768.0000000) * C.ClipY);
    SetupBGMapUAV();
    C.SetPos(float(X1), float(Y1));
    C.DrawTile(UAVBG, (float(MinimapSize) / 1024.0000000) * C.ClipX, (float(MinimapSize) / 768.0000000) * C.ClipY, 0.0000000, 0.0000000, float(UAVBG.MaterialUSize()), float(UAVBG.MaterialVSize()));
    //return;    
}

function DrawMinimap_Frame(Canvas C)
{
    C.SetPos(float(MinimapCenterX - (MinimapSize / 2)) * _rX, float(MinimapCenterY - (MinimapSize / 2)) * _rY);
    C.DrawTileStretched(MinimapBG.WidgetTexture, float(MinimapSize) * _rX, float(MinimapSize) * _rY);
    //return;    
}

function DrawMinimap_Compass(Canvas C)
{
    local int center, Left, Right;
    local float fRotation;

    fRotation = float(-HudOwner.PawnOwner.Rotation.Yaw) / 65535.0000000;
    center = int(float(MinimapCompassNorthPoint) + (float(MinimapCompassWidth) * fRotation));
    Left = center - (MinimapCompassVisibleWidth / 2);
    Right = center + (MinimapCompassVisibleWidth / 2);
    MinimapCompass.TextureCoords.X1 = Left;
    MinimapCompass.TextureCoords.X2 = Right;
    DrawTileFromSpriteWidget(C, MinimapCompass);
    //return;    
}

function float getSelfIconScale()
{
    local float fBlinkCurTime, fBlinkValue, MinimapIconScale;
    local byte MinimapBlinkPlusMinus;

    fBlinkCurTime = Level.TimeSeconds - HudOwner.GoWalkingBeginTime;
    // End:0x41
    if(fBlinkCurTime > fBlinkTimeLen)
    {
        MinimapIconScale = 1.0000000;        
    }
    else
    {
        fBlinkValue = fBlinkCurTime % fBlinkTerm;
        MinimapBlinkPlusMinus = byte(fBlinkCurTime / fBlinkTerm);
        // End:0x95
        if((float(MinimapBlinkPlusMinus) % float(2)) != float(0))
        {
            fBlinkValue = fBlinkTerm + (-1.0000000 * fBlinkValue);
        }
        MinimapIconScale = 1.0000000 + ((2.0000000 * fBlinkValue) / fBlinkTerm);
    }
    return MinimapIconScale;
    //return;    
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
    W = (float(MinimapMatMyself.MaterialUSize()) * IconSizeF) * selfIconScale;
    H = (float(MinimapMatMyself.MaterialVSize()) * IconSizeF) * selfIconScale;
    old = C.DrawColor;
    C.SetPos((float(MinimapCenterX) - (W / float(2))) * _rX, (float(MinimapCenterY) - (H / float(2))) * _rY);
    C.DrawColor = WhiteColor;
    C.DrawTile(MinimapMatMyself, W * _rX, H * _rY, 0.0000000, 0.0000000, float(MinimapMatMyself.MaterialUSize()), float(MinimapMatMyself.MaterialVSize()));
    C.DrawColor = old;
    //return;    
}

function CalculateMinimapPositionPawnCentering(Pawn centerPawn, Vector TargetLoc, out float minimapX, out float minimapY)
{
    // End:0x2D
    if(centerPawn == none)
    {
        CalculateMinimapPosition(tempVect, tempRot, TargetLoc, minimapX, minimapY);        
    }
    else
    {
        CalculateMinimapPosition(centerPawn.Location, centerPawn.Rotation, TargetLoc, minimapX, minimapY);
    }
    //return;    
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
    minimapX = float(MinimapCenterX) + ((relativeLoc.Y * float(MinimapSize)) / float(MinimapCoverSize));
    minimapY = float(MinimapCenterY) - ((relativeLoc.X * float(MinimapSize)) / float(MinimapCoverSize));
    //return;    
}

function CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, out int TX, out int ty)
{
    local int cX, cY;

    MapWorldLocationToMinimapTextureLocation(HudOwner.PawnOwner.Location, cX, cY);
    ty = int((minimapX - float(MinimapCenterX)) + float(cY));
    TX = int(-minimapY - float(MinimapCenterY) + float(cX));
    //return;    
}

function bool IsWithinMinimapArea(float X, float Y)
{
    return (((float((MinimapCenterX - (MinimapSize / 2)) + MinimapDrawBuffer) <= X) && X <= float((MinimapCenterX + (MinimapSize / 2)) - MinimapDrawBuffer)) && float((MinimapCenterY - (MinimapSize / 2)) + MinimapDrawBuffer) <= Y) && Y <= float((MinimapCenterY + (MinimapSize / 2)) - MinimapDrawBuffer);
    //return;    
}

function ClampMinimapPosition(out float X, out float Y, optional float W, optional float H)
{
    // End:0x37
    if(X < float(MinimapCenterX - (MinimapSize / 2)))
    {
        X = float(MinimapCenterX - (MinimapSize / 2));        
    }
    else
    {
        // End:0x6B
        if(X > float(MinimapCenterX + (MinimapSize / 2)))
        {
            X = float(MinimapCenterX + (MinimapSize / 2));
        }
    }
    // End:0xA2
    if(Y < float(MinimapCenterY - (MinimapSize / 2)))
    {
        Y = float(MinimapCenterY - (MinimapSize / 2));        
    }
    else
    {
        // End:0xD6
        if(Y > float(MinimapCenterY + (MinimapSize / 2)))
        {
            Y = float(MinimapCenterY + (MinimapSize / 2));
        }
    }
    //return;    
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
    //return;    
}

function CalcMinimapRotation(Rotator Rotation, out Rotator outRotation)
{
    outRotation.Yaw = Rotation.Yaw - HudOwner.PawnOwner.Rotation.Yaw;
    //return;    
}

function PushDeadOnMinimap(int TeamIndex, Vector Location)
{
    local bool OtherTeam;
    local MinimapDeadInfo Info;

    // End:0x1A
    if((Level == none) || HudOwner == none)
    {
        return;
    }
    OtherTeam = !IsSameTeamByIndex(HudOwner.PlayerOwner.GetTeamNum(), TeamIndex);
    // End:0x66
    if(OtherTeam && !IsEnemyInRange(Location))
    {
        return;        
    }
    else
    {
        Info.TeamIndex = TeamIndex;
        Info.Location = Location;
        Info.TimeToRemove = Level.TimeSeconds + DeadDrawDuration;
        MinimapDeadInfos[MinimapDeadInfos.Length] = Info;
    }
    //return;    
}

function bool IsSameTeamByPRI(PlayerReplicationInfo pri1, PlayerReplicationInfo pri2)
{
    // End:0x14
    if(pri1 == pri2)
    {
        return true;        
    }
    else
    {
        // End:0x48
        if(Level.GRI.GameClass == "WGame.wDeathMatch")
        {
            return false;            
        }
        else
        {
            // End:0x74
            if((pri1.Team == none) || pri2.Team == none)
            {
                return false;
            }
            return IsSameTeamByIndex(pri1.Team.TeamIndex, pri2.Team.TeamIndex);
        }
    }
    //return;    
}

function bool IsSameTeamByIndex(int Team1, int Team2)
{
    // End:0x31
    if(Level.GRI.GameClass ~= "WGame.wDeathMatch")
    {
        return false;
    }
    return Team1 == Team2;
    //return;    
}

function DrawMinimap_Allies(Canvas C)
{
    local wPawn P, wPawnOwner;
    local float minimapX, minimapY;
    local int lp1;
    local HudCDeathmatch HUD;
    local Rotator R;
    local float W, H, w2, H2, UL, VL;

    W = (float(MinimapMatAlly.MaterialUSize()) * _rX) * IconSizeF;
    H = (float(MinimapMatAlly.MaterialVSize()) * _rY) * IconSizeF;
    w2 = W / float(2);
    H2 = H / float(2);
    UL = float(MinimapMatAlly.MaterialUSize());
    VL = float(MinimapMatAlly.MaterialVSize());
    wPawnOwner = wPawn(HudOwner.PawnOwner);
    HUD = HudCDeathmatch(HudOwner);
    C.Style = 5;
    lp1 = 0;
    J0xDB:

    // End:0x583 [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = wPawn(Level.PawnList[lp1]);
        // End:0x579
        if((((P != none) && P.PlayerReplicationInfo != none) && HudOwner.PlayerOwner.PlayerReplicationInfo.Team != none) && P.OwnerName != HudOwner.PlayerOwner.PlayerReplicationInfo.PlayerName)
        {
            // End:0x579
            if((P != wPawnOwner) && IsSameTeamByPRI(HudOwner.PlayerOwner.PlayerReplicationInfo, P.PlayerReplicationInfo))
            {
                CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.Location, minimapX, minimapY);
                // End:0x579
                if((IsWithinMinimapArea(minimapX, minimapY)) || (HudOwner.PawnOwner != none) && VSize(HudOwner.PawnOwner.Location - P.Location) < ClampDistance)
                {
                    ClampMinimapPosition(minimapX, minimapY);
                    // End:0x579
                    if(!P.IsInState('Dying'))
                    {
                        CalcMinimapRotation(P.Rotation, R);
                        // End:0x3DD
                        if(P.fLastFireNoiseTime >= (Level.TimeSeconds - MinimapAllyFireNotificationDuration))
                        {
                            // End:0x35F
                            if((P.PlayerReplicationInfo.bBot == true) || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                            {
                                C.DrawTileExactWithRotation(MinimapMatAttackingAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);                                
                            }
                            else
                            {
                                // End:0x3DA
                                if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                                {
                                    C.DrawTileExactWithRotation(MinimapFCMatAttackingAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                                }
                            }
                            // [Explicit Continue]
                            goto J0x579;
                        }
                        // End:0x460
                        if(P.fLastRadioMessageTime >= (Level.TimeSeconds - MinimapAllyRadioMessageDuration))
                        {
                            C.DrawTileExact(MinimapMatRadioMessage, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL);
                            // [Explicit Continue]
                            goto J0x579;
                        }
                        // End:0x4FE
                        if((P.PlayerReplicationInfo.bBot == true) || P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 0)
                        {
                            C.DrawTileExactWithRotation(MinimapMatAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                            // [Explicit Continue]
                            goto J0x579;
                        }
                        // End:0x579
                        if(P.PlayerReplicationInfo.GetCheckFriendOrClanMember() == 1)
                        {
                            C.DrawTileExactWithRotation(MinimapFCMatAlly, (minimapX * _rX) - w2, (minimapY * _rY) - H2, W, H, 0.0000000, 0.0000000, UL, VL, R);
                        }
                    }
                }
            }
        }
        J0x579:

        lp1++;
        // [Loop Continue]
        goto J0xDB;
    }
    C.Style = 1;
    //return;    
}

function bool IsEnemyInRange(Vector loc)
{
    return true;
    //return;    
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
    bAlienGame = Level.GRI.GameClass == Level.GetMatchMaker().GetDefenceGameInfo();
    HUD = HudCDeathmatch(HudOwner);
    lp1 = 0;
    J0x78:

    // End:0x49D [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        P = wPawn(Level.PawnList[lp1]);
        // End:0x493
        if((P != none) && P.PlayerReplicationInfo != none)
        {
            // End:0x117
            if(P.PlayerReplicationInfo.Team != none)
            {
                pTeamIndex = P.PlayerReplicationInfo.Team.TeamIndex;                
            }
            else
            {
                pTeamIndex = 0;
            }
            // End:0x493
            if(!IsSameTeamByPRI(HudOwner.PlayerOwner.PlayerReplicationInfo, P.PlayerReplicationInfo))
            {
                // End:0x493
                if(true)
                {
                    // End:0x1AA
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap)
                    {
                        P.UpdateLastKnownPosAndTime(P.Location, HudOwner.Level.TimeSeconds);
                    }
                    CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.LastKnownPos, minimapX, minimapY);
                    // End:0x493
                    if((IsWithinMinimapArea(minimapX, minimapY)) || (HudOwner.PawnOwner != none) && VSize(HudOwner.PawnOwner.Location - P.Location) < ClampDistance)
                    {
                        ClampMinimapPosition(minimapX, minimapY);
                        Draw = bAdmin;
                        // End:0x288
                        if((Level.TimeSeconds - P.LastKnownTime) < (MinimapEnemyDrawDuration_Pre + MinimapEnemyDrawDuration_Post))
                        {
                            Draw = true;
                        }
                        // End:0x493
                        if(Draw)
                        {
                            // End:0x2AB
                            if(bAlienGame == true)
                            {
                                Sprite = MinimapAlien;                                
                            }
                            else
                            {
                                Sprite = MinimapAttackingEnemies[pTeamIndex];
                            }
                            SetupMinimapSpriteWidgetForDrawing(Sprite, P.Rotation, minimapX, minimapY);
                            diff = Level.TimeSeconds - P.LastKnownTime;
                            // End:0x35E
                            if(diff <= MinimapEnemyDrawDuration_Pre)
                            {
                                // End:0x33B
                                if(MinimapEnemyDrawDuration_Pre == float(0))
                                {
                                    C.ColorModulate.W = 1.0000000;                                    
                                }
                                else
                                {
                                    C.ColorModulate.W = diff / MinimapEnemyDrawDuration_Pre;
                                }                                
                            }
                            else
                            {
                                C.ColorModulate.W = (MinimapEnemyDrawDuration_Post - (diff - MinimapEnemyDrawDuration_Pre)) / MinimapEnemyDrawDuration_Post;
                            }
                            W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
                            H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
                            C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
                            C.DrawTile(Sprite.WidgetTexture, W * _rY, H * _rY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
                            C.ColorModulate.W = 1.0000000;
                        }
                    }
                }
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x78;
    }
    //return;    
}

function DrawMinimap_Deads(Canvas C)
{
    local int lp1;
    local MinimapDeadInfo Info;
    local SpriteWidget Sprite;
    local float X, Y, W, H;

    lp1 = MinimapDeadInfos.Length - 1;
    J0x0F:

    // End:0x248 [Loop If]
    if(lp1 >= 0)
    {
        Info = MinimapDeadInfos[lp1];
        // End:0x57
        if(Info.TimeToRemove <= Level.TimeSeconds)
        {
            MinimapDeadInfos.Remove(lp1, 1);
            // [Explicit Continue]
            goto J0x23E;
        }
        // End:0x90
        if(IsSameTeamByIndex(Info.TeamIndex, HudOwner.PlayerOwner.GetTeamNum()))
        {
            Sprite = MinimapDeadAlly;            
        }
        else
        {
            Sprite = MinimapDeadEnemies[Info.TeamIndex];
        }
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, Info.Location, X, Y);
        // End:0x23E
        if((IsWithinMinimapArea(X, Y)) || (HudOwner.PawnOwner != none) && VSize(HudOwner.PawnOwner.Location - Info.Location) < ClampDistance)
        {
            ClampMinimapPosition(X, Y);
            W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
            H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
            C.SetPos((X - (W / float(2))) * _rX, (Y - (H / float(2))) * _rY);
            C.DrawTile(Sprite.WidgetTexture, W * _rX, (float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF) * _rY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        }
        J0x23E:

        lp1--;
        // [Loop Continue]
        goto J0x0F;
    }
    //return;    
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

    // End:0x218 [Loop If]
    if(lp1 < Level.Helicopters.Length)
    {
        P = wHelicopter(Level.Helicopters[lp1]);
        // End:0x20E
        if((P != none) && !P.bHidden)
        {
            pTeamIndex = P.TeamIndex;
            CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.Location, minimapX, minimapY);
            ClampMinimapPosition(minimapX, minimapY);
            // End:0xE9
            if(pTeamIndex == HudOwner.PlayerOwner.GetTeamNum())
            {
                Sprite = P.MinimapIconAlly;                
            }
            else
            {
                Sprite = P.MinimapIconEnemy;
            }
            SetupMinimapSpriteWidgetForDrawing(Sprite, P.Rotation, minimapX, minimapY);
            W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
            H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
            C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
            C.DrawTile(Sprite.WidgetTexture, W * _rX, H * _rY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    else
    {
        Sprite = MinimapStrikeEnem;
    }
    SetupMinimapSpriteWidgetForDrawing(Sprite, emptyRotation, minimapX, minimapY);
    W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
    H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
    C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
    C.DrawTile(Sprite.WidgetTexture, (float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF) * _rY, (float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF) * _rY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
    // End:0x21A
    if(Level.IsAirStriking == false)
    {
        Level.fAirStrikeFadeTime -= Level.AppDeltaTime;
        // End:0x217
        if(Level.fAirStrikeFadeTime <= 0.0000000)
        {
            Level.fAirStrikeFadeTime = 0.0000000;
        }        
    }
    else
    {
        // End:0x246
        if(Level.fAirStrikeFadeTime != 2.0000000)
        {
            Level.fAirStrikeFadeTime = 2.0000000;
        }
    }
    //return;    
}

function DrawMinimap_Mission(Canvas C)
{
    //return;    
}

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
    if((Level.GRI.GameClass ~= "WMission.wSDGameInfo") || Level.GRI.GameClass ~= "WMission.wSBTGameInfo")
    {
        IsDrawSpecialPositions = false;
        return;
    }
    // End:0xFE
    if(Level.GetMatchMaker() != none)
    {
        // End:0xFE
        if((int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().5)) || int(Level.GetMatchMaker().eWeaponLimit) == int(Level.GetMatchMaker().1))
        {
            IsDrawSpecialPositions = false;
            return;
        }
    }
    // End:0x201
    if((Level.TimeSeconds - UpdateTime_SpecialPositions) > 0.5000000)
    {
        UpdateTime_SpecialPositions = Level.TimeSeconds;
        lp1 = 0;
        J0x138:

        // End:0x201 [Loop If]
        if(lp1 < CachedSpecialPositions.Length)
        {
            actorloc = none;
            actCount = 0;
            // End:0x1C2
            foreach DynamicActors(SpecialPositions_Class[CachedSpecialPositions[lp1].Index], actorloc)
            {
                // End:0x1C1
                if((actorloc.bHidden == false) && VSize(actorloc.Location - CachedSpecialPositions[lp1].pos) < 0.1000000)
                {
                    actCount++;
                }                
            }            
            // End:0x1E4
            if(actCount == 0)
            {
                CachedSpecialPositions[lp1].IsDraw = false;
                // [Explicit Continue]
                goto J0x1F7;
            }
            CachedSpecialPositions[lp1].IsDraw = true;
            J0x1F7:

            lp1++;
            // [Loop Continue]
            goto J0x138;
        }
    }
    lp1 = 0;
    J0x208:

    // End:0x3C7 [Loop If]
    if(lp1 < CachedSpecialPositions.Length)
    {
        // End:0x232
        if(CachedSpecialPositions[lp1].IsDraw == false)
        {
            // [Explicit Continue]
            goto J0x3BD;
        }
        loc = CachedSpecialPositions[lp1].pos;
        mat = CachedSpecialPositions[lp1].Image;
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, loc, minimapX, minimapY);
        bDraw = false;
        // End:0x2C7
        if(IsClampDistance_SpecialPositions)
        {
            // End:0x2C4
            if(VSize(HudOwner.PawnOwner.Location - loc) < ClampDistance_SpecialPositions)
            {
                bDraw = true;
            }            
        }
        else
        {
            bDraw = true;
        }
        // End:0x3BD
        if(bDraw)
        {
            ClampMinimapPosition(minimapX, minimapY);
            W = float(mat.MaterialUSize()) * IconSizeF;
            H = float(mat.MaterialVSize()) * IconSizeF;
            C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
            C.DrawTile(mat, W * _rX, H * _rY, 0.0000000, 0.0000000, float(mat.MaterialUSize()), float(mat.MaterialVSize()));
        }
        J0x3BD:

        lp1++;
        // [Loop Continue]
        goto J0x208;
    }
    //return;    
}

delegate OnPreDrawMyself(Canvas C)
{
    //return;    
}

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
    // End:0xDD
    if(DrawNorthPole)
    {
        DrawMinimap_NorthPole(C);
    }
    //return;    
}

function DrawMinimap_Enemies_Defence(Canvas C)
{
    local wPawn P;
    local float minimapX, minimapY;
    local SpriteWidget Sprite, spriteBlend;
    local int pTeamIndex, lp1;
    local HudCDeathmatch HUD;
    local bool Draw;
    local float diff, W, H;
    local bool bAdmin, bAlienGame, bDefenceBoss;

    bAdmin = HudOwner.PlayerOwner.PlayerReplicationInfo.bAdminSpecator;
    bAlienGame = Level.GRI.GameClass == Level.GetMatchMaker().GetDefenceGameInfo();
    // End:0x6E
    if(!bAlienGame)
    {
        return;
    }
    HUD = HudCDeathmatch(HudOwner);
    lp1 = 0;
    J0x85:

    // End:0x2FF [Loop If]
    if(lp1 < Level.PawnList.Length)
    {
        // End:0xF6
        if(Level.PawnList[lp1].IsA('wAIDefencePawn'))
        {
            P = wAIDefencePawn(Level.PawnList[lp1]);
            ClampDistance = default.ClampDistance;
            bDefenceBoss = false;            
        }
        else
        {
            // End:0x14B
            if(Level.PawnList[lp1].IsA('wDefenceBoss'))
            {
                P = wDefenceBoss(Level.PawnList[lp1]);
                bDefenceBoss = true;
                ClampDistance = 24000.0000000;
            }
        }
        // End:0x2F5
        if(P != none)
        {
            // End:0x2F5
            if(HudOwner.PlayerOwner.PlayerReplicationInfo.Team.TeamIndex != P.TeamIndex)
            {
                // End:0x2F5
                if(true)
                {
                    // End:0x1EE
                    if(HudOwner.PlayerOwner.PlayerReplicationInfo.bCanSeeEnemiesOnMinimap)
                    {
                        P.UpdateLastKnownPosAndTime(P.Location, HudOwner.Level.TimeSeconds);
                    }
                    CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, P.LastKnownPos, minimapX, minimapY);
                    // End:0x2F5
                    if((IsWithinMinimapArea(minimapX, minimapY)) || (HudOwner.PawnOwner != none) && VSize(HudOwner.PawnOwner.Location - P.Location) < ClampDistance)
                    {
                        ClampMinimapPosition(minimapX, minimapY);
                        Draw = bAdmin;
                        // End:0x2CC
                        if((Level.TimeSeconds - P.LastKnownTime) < (MinimapEnemyDrawDuration_Pre + MinimapEnemyDrawDuration_Post))
                        {
                            Draw = true;
                        }
                        // End:0x2F5
                        if(Draw)
                        {
                            DrawDefenceIcon(C, P, minimapX, minimapY, bDefenceBoss);
                        }
                    }
                }
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x85;
    }
    //return;    
}

function DrawDefenceIcon(Canvas C, wPawn P, float minimapX, float minimapY, bool bDefenceBoss)
{
    local SpriteWidget Sprite, spriteBlend;
    local float diff, W, H;

    // End:0x82
    if(!bDefenceBoss)
    {
        switch(wAIDefencePawn(P).iNpcID)
        {
            // End:0x47
            case MinimapIconEnemyID[0]:
                Sprite = MinimapIconEnemyBoss[0];
                spriteBlend = MinimapIconEnemyBossBlend[0];
                // End:0x7F
                break;
            // End:0x6E
            case MinimapIconEnemyID[1]:
                Sprite = MinimapIconEnemyBoss[1];
                spriteBlend = MinimapIconEnemyBossBlend[1];
                // End:0x7F
                break;
            // End:0xFFFF
            default:
                Sprite = MinimapAlien;
                // End:0x7F
                break;
                break;
        }        
    }
    else
    {
        // End:0xAA
        if(bDefenceBoss == true)
        {
            Sprite = MinimapIconEnemyBoss[2];
            spriteBlend = MinimapIconEnemyBossBlend[2];
        }
    }
    SetupMinimapSpriteWidgetForDrawing(Sprite, P.Rotation, minimapX, minimapY);
    diff = Level.TimeSeconds - P.LastKnownTime;
    // End:0x14C
    if(diff <= MinimapEnemyDrawDuration_Pre)
    {
        // End:0x129
        if(MinimapEnemyDrawDuration_Pre == float(0))
        {
            C.ColorModulate.W = 1.0000000;            
        }
        else
        {
            C.ColorModulate.W = diff / MinimapEnemyDrawDuration_Pre;
        }        
    }
    else
    {
        C.ColorModulate.W = (MinimapEnemyDrawDuration_Post - (diff - MinimapEnemyDrawDuration_Pre)) / MinimapEnemyDrawDuration_Post;
    }
    // End:0x29B
    if(spriteBlend.WidgetTexture != none)
    {
        SetupMinimapSpriteWidgetForDrawing(spriteBlend, P.Rotation, minimapX, minimapY);
        W = float(spriteBlend.WidgetTexture.MaterialUSize()) * IconSizeF;
        H = float(spriteBlend.WidgetTexture.MaterialVSize()) * IconSizeF;
        C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
        C.DrawTile(spriteBlend.WidgetTexture, W * _rY, H * _rY, 0.0000000, 0.0000000, float(spriteBlend.WidgetTexture.MaterialUSize()), float(spriteBlend.WidgetTexture.MaterialVSize()));
    }
    W = float(Sprite.WidgetTexture.MaterialUSize()) * IconSizeF;
    H = float(Sprite.WidgetTexture.MaterialVSize()) * IconSizeF;
    C.SetPos((minimapX - (W / float(2))) * _rX, (minimapY - (H / float(2))) * _rY);
    C.DrawTile(Sprite.WidgetTexture, W * _rY, H * _rY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
    C.ColorModulate.W = 1.0000000;
    //return;    
}

defaultproperties
{
    MinimapBG=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.hud_back_3',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=32,Y2=32),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=9,OffsetY=9,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapCompass=(WidgetTexture=Texture'Warfare_UI.HUD.minimap_compass',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=255,Y2=15),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=5,OffsetY=5,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapFlatTop=(WidgetTexture=Texture'Warfare_UI.HUD.FlatLine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=162,Y2=2),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=5,OffsetY=21,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapFlatBottom=(WidgetTexture=Texture'Warfare_UI.HUD.FlatLine',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=162,Y2=2),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=5,OffsetY=185,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapMatMyself=TexRotator'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_myself2_rot'
    MinimapMatAlly=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_team'
    MinimapMatAttackingAlly=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_team_comb_rot_fb'
    MinimapFCMatAlly=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_clan'
    MinimapFCMatAttackingAlly=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_our_clan_comb_rot_fb'
    MinimapMatRadioMessage=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.minimap_radio_final'
    MinimapDeadAlly=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.death_our',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAttackingEnemies[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAttackingEnemies[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAttackingEnemies[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapDeadEnemies[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.death_enemy',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapDeadEnemies[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.death_enemy',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapDeadEnemies[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.death_enemy',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAlien=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_walk',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=31,Y2=31),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapStrikeAlly=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_wh_bom',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapStrikeEnem=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_r_bom',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAirStrikeAllyRect=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.img_area_bombing2_Ally',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapAirStrikeEnemRect=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.img_area_bombing2',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=128,Y2=128),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapCompassVisibleWidth=162
    MinimapCompassNorthPoint=139
    MinimapCompassWidth=256
    MinimapCenterX=104
    MinimapCenterY=104
    MinimapSize=186
    MinimapCoverSize=186
    MinimapScale=50.0000000
    MinimapDrawBuffer=8
    MinimapAllyFireNotificationDuration=3.0000000
    MinimapEnemyDrawDuration_Post=4.5000000
    DeadDrawDuration=10.0000000
    MinimapAllyRadioMessageDuration=5.0000000
    fBlinkTimeLen=3.0000000
    fBlinkTerm=0.5000000
    MinimapIconEnemy=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_fly',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemyBoss[0]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_midboss_alien',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemyBoss[1]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_midboss_omega',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemyBoss[2]=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.enemy_target_monster_finalboss_nemesis',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemyBossBlend[0]=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_omega_finalblend',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemyBossBlend[1]=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_alien_finalblend',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemyBossBlend[2]=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.minimapicon.icon_nemesis_finalblend',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=64,Y2=64),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapIconEnemyID[0]=9014
    MinimapIconEnemyID[1]=9012
    MinimapIconEnemyID[2]=9015
    SpecialPositions_Class[0]=Class'WGame.wWeaponPickup_M2B'
    SpecialPositions_Class[1]=Class'WGame.wWeaponPickup_RPG7'
    SpecialPositions_Class[2]=Class'WGame.wTurret_FNM240'
    SpecialPositions_Class[3]=Class'WGame.wBTR_Turret_FNM240'
    SpecialPositions_Image[0]=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.icon_mnmap_m2b'
    SpecialPositions_Image[1]=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.icon_mnmap_at4'
    SpecialPositions_Image[2]=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.icon_mnmap_m249'
    SpecialPositions_Image[3]=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.icon_mnmap_m249'
    BaseColor=(R=255,G=255,B=255,A=255)
    IconSizeF=1.0000000
    DrawFrame=true
    UAVBG_Base=VariableTexPanner'Warfare_GP_UI_HUD_ETC.minimapicon.UAV4_VPan'
    UAVBG=TexRotator'Warfare_GP_UI_HUD_ETC.minimapicon.UAV4_Rot'
    IsDrawSpecialPositions=true
    IsClampDistance_SpecialPositions=true
    ClampDistance=6000.0000000
    ClampDistance_SpecialPositions=3000.0000000
}