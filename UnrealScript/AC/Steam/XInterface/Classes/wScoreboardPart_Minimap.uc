/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\wScoreboardPart_Minimap.uc
 * Package Imports:
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:13
 *
 *******************************************************************************/
class wScoreboardPart_Minimap extends wHudPart_MinimapBase
    transient;

var() /*0x00000000-0x80000000*/ databinding editinlinenotify WinFrameChanger FrameChanger;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify WinBox MinimapBGPos;
var FloatBox MinimapCropCoords;
var FloatBoxWH P;

function Initialize(HudBase myOwner, LevelInfo myLevel)
{
    super.Initialize(myOwner, myLevel);
    // End:0xbb
    if(Level.BG == none || Level.MinimapCropCoords1.X == float(0) && Level.MinimapCropCoords1.Y == float(0) && Level.MinimapCropCoords2.X == float(0) && Level.MinimapCropCoords2.Y == float(0))
    {
        MinimapCropCoords.X2 = 342.0;
        MinimapCropCoords.Y2 = 342.0;
    }
    // End:0x133
    else
    {
        MinimapCropCoords.X1 = Level.MinimapCropCoords1.X;
        MinimapCropCoords.Y1 = Level.MinimapCropCoords1.Y;
        MinimapCropCoords.X2 = Level.MinimapCropCoords2.X;
        MinimapCropCoords.Y2 = Level.MinimapCropCoords2.Y;
    }
    // End:0x15f
    if(Level.kUserzoneInfo == none)
    {
        Level.kUserzoneInfo = new class'UserzoneInfo';
    }
    Level.kUserzoneInfo.SetScoreboardHud(self);
}

function Draw(Canvas C)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    super.Draw(C);
}

function DrawMinimap_CombatSituation(Canvas C)
{
    local int i;
    local float sx, sy, ex, ey;

    i = 0;
    J0x07:
    // End:0xd4 [While If]
    if(i < Level.CSReviewLines.Length)
    {
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, Level.CSReviewLines[i].vStartPos, sx, sy);
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, Level.CSReviewLines[i].vEndPos, ex, ey);
        C.Draw2DLine(sx, sy, ex, ey, Level.CSReviewLines[i].LineColor);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0xdb:
    // End:0x167 [While If]
    if(i < Level.CSReviewArrows.Length)
    {
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, Level.CSReviewArrows[i].vPos, sx, sy);
        C.Draw2DPoint(sx, sy, Level.CSReviewArrows[i].ArrowColor);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xdb;
    }
    i = 0;
    J0x16e:
    // End:0x1fa [While If]
    if(i < Level.CSReviewPoints.Length)
    {
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, Level.CSReviewPoints[i].vPos, sx, sy);
        C.Draw2DPoint(sx, sy, Level.CSReviewPoints[i].PointColor);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16e;
    }
    // End:0x2e4
    if(Level.kUserzoneInfo != none)
    {
        // End:0x2e4
        if(Level.kUserzoneInfo.kUserzoneTexture != none)
        {
            C.Style = 5;
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.SetPos(MinimapBGPos.P.X1, MinimapBGPos.P.Y1);
            C.DrawRect(Level.kUserzoneInfo.kUserzoneTexture, Level.kUserzoneInfo.fMinimapWidth, Level.kUserzoneInfo.fMinimapHeight);
        }
    }
}

function DrawMinimap_BGMap(Canvas C)
{
    local TexRotator rotTexture;

    rotTexture = Level.BG;
    // End:0x13f
    if(rotTexture != none)
    {
        rotTexture.UOffset = 0.0;
        rotTexture.VOffset = 0.0;
        rotTexture.Rotation.Yaw = 0;
        FrameChanger.SetFrame(0.0, 0.0, C.ClipX, C.ClipY);
        P = FrameChanger.WinBoxToFloatBoxWH(MinimapBGPos);
        C.SetPos(P.X, P.Y);
        C.DrawTile(Level.BG, P.W, P.H, MinimapCropCoords.X1, MinimapCropCoords.Y1, MinimapCropCoords.X2 - MinimapCropCoords.X1, MinimapCropCoords.Y2 - MinimapCropCoords.Y1);
    }
}

function SetupBGMapUAV()
{
    local float Progress;

    UAVBG.Rotation.Yaw = 0;
    UAVBG.UOffset = float(UAVBG.MaterialUSize() / 2);
    UAVBG.VOffset = float(UAVBG.MaterialVSize() / 2);
    Progress = HudOwner.GetUAVScanProgress();
    UAVBG_Base.PanOffset = Progress;
    UAVBG_Base.PanDirection.Yaw = 32767;
}

function DrawMinimap_Myself(Canvas C)
{
    local float mx, my, selfIconScale, W, H, w2,
	    H2, UL, VL;

    // End:0x19c
    if(HudOwner.PawnOwner != none)
    {
        selfIconScale = getSelfIconScale();
        UL = float(MinimapMatMyself.MaterialUSize());
        VL = float(MinimapMatMyself.MaterialVSize());
        W = UL * _rX * selfIconScale;
        H = VL * _rY * selfIconScale;
        w2 = W / float(2);
        H2 = H / float(2);
        CalculateMinimapPosition(HudOwner.PawnOwner.Location, HudOwner.PawnOwner.Rotation, HudOwner.PawnOwner.Location, mx, my);
        TexRotator(MinimapMatMyself).Rotation.Yaw = -HudOwner.PawnOwner.Rotation.Yaw + 49149;
        C.SetPos(mx * _rX - w2, my * _rY - H2);
        C.DrawTile(MinimapMatMyself, W, H, 0.0, 0.0, UL, VL);
    }
}

function DrawMinimap_Airstrike(Canvas C)
{
    local float X1, Y1, X2, Y2, cx1, cy1,
	    cx2, cy2, Radius, CenterX, CenterY;

    local Vector V;
    local SpriteWidget Sprite;

    // End:0x399
    if(true == Level.IsAirStriking || Level.fAirStrikeFadeTime > 0.0)
    {
        super.DrawMinimap_Airstrike(C);
        X1 = HudOwner.PlayerOwner.fAirStrikeCenterX - HudOwner.PlayerOwner.fAirStrikeRadius;
        Y1 = HudOwner.PlayerOwner.fAirStrikeCenterY - HudOwner.PlayerOwner.fAirStrikeRadius;
        X2 = HudOwner.PlayerOwner.fAirStrikeCenterX + HudOwner.PlayerOwner.fAirStrikeRadius;
        Y2 = HudOwner.PlayerOwner.fAirStrikeCenterY + HudOwner.PlayerOwner.fAirStrikeRadius;
        V.X = X1;
        V.Y = Y1;
        CalculateWorldPostionToMinimapPosition(V, cx1, cy1);
        V.X = X2;
        V.Y = Y2;
        CalculateWorldPostionToMinimapPosition(V, cx2, cy2);
        V.X = HudOwner.PlayerOwner.fAirStrikeCenterX;
        V.Y = HudOwner.PlayerOwner.fAirStrikeCenterY;
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, V, CenterX, CenterY);
        Radius = cx2 - cx1 / float(2);
        cx1 = CenterX - Radius;
        cy1 = CenterY - Radius;
        cx2 = CenterX + Radius;
        cy2 = CenterY + Radius;
        Radius = float(C.DrawColor.A);
        C.DrawColor.A = byte(255.0 * Level.fAirStrikeFadeTime * 0.50);
        // End:0x2c9
        if(Level.AirStrikeTeamIndex == HudOwner.PlayerOwner.GetTeamNum())
        {
            Sprite = MinimapAirStrikeAllyRect;
        }
        // End:0x2d4
        else
        {
            Sprite = MinimapAirStrikeEnemRect;
        }
        C.SetPos(cx1 + 4.0 * _rX, cy1 + 4.0 * _rY);
        C.DrawTile(Sprite.WidgetTexture, cx2 - cx1 * _rX, cy2 - cy1 * _rY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        C.DrawColor.A = byte(Radius);
    }
}

function CalcMinimapRotation(Rotator Rotation, out Rotator outRotation)
{
    outRotation.Yaw = Rotation.Yaw - 49149;
}

function SetupMinimapSpriteWidgetForDrawing(out SpriteWidget Sprite, Rotator Rotation, float minimapX, float minimapY)
{
    local TexRotator TexRotator;

    Sprite.OffsetX = int(minimapX);
    Sprite.OffsetY = int(minimapY);
    TexRotator = TexRotator(Sprite.WidgetTexture);
    // End:0x6b
    if(TexRotator != none)
    {
        TexRotator.Rotation.Yaw = -Rotation.Yaw + 49149;
    }
}

function CalculateMinimapPosition(Vector centerLoc, Rotator centerRotation, Vector TargetLoc, out float minimapX, out float minimapY)
{
    local int TX, ty;
    local float xRatio, yRatio;

    MapWorldLocationToMinimapTextureLocation(TargetLoc, TX, ty);
    xRatio = float(TX) - MinimapCropCoords.X1 / MinimapCropCoords.X2 - MinimapCropCoords.X1;
    yRatio = float(ty) - MinimapCropCoords.Y1 / MinimapCropCoords.Y2 - MinimapCropCoords.Y1;
    minimapX = MinimapBGPos.P.X1 + xRatio * MinimapBGPos.P.X2 - MinimapBGPos.P.X1;
    minimapY = MinimapBGPos.P.Y1 + yRatio * MinimapBGPos.P.Y2 - MinimapBGPos.P.Y1;
}

function CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, out int TX, out int ty)
{
    TX = int(float(int(minimapX - MinimapBGPos.P.X1)) / MinimapBGPos.P.X2 - MinimapBGPos.P.X1 * MinimapCropCoords.X2 - MinimapCropCoords.X1 + MinimapCropCoords.X1);
    ty = int(float(int(minimapY - MinimapBGPos.P.Y1)) / MinimapBGPos.P.Y2 - MinimapBGPos.P.Y1 * MinimapCropCoords.Y2 - MinimapCropCoords.Y1 + MinimapCropCoords.Y1);
}

function CalculateWorldPostionToMinimapPosition(Vector Location, out float mx, out float my)
{
    CalculateMinimapPosition(HudOwner.PawnOwner.Location, HudOwner.PawnOwner.Rotation, Location, mx, my);
    mx -= MinimapBGPos.P.X1;
    my -= MinimapBGPos.P.Y1;
}

function CalculateMinimapSize(out float fWidth, out float fHeight)
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    fWidth = float(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportX"));
    fHeight = float(PC.ConsoleCommand("GETCONFIG_INT Graphics GameViewportY"));
    P = FrameChanger.WinBoxToFloatBoxWH(MinimapBGPos);
    fWidth = P.W;
    fHeight = P.H;
}

defaultproperties
{
    FrameChanger=mFrameChanger
    begin object name=mMinimapBGPos class=WinBox
        P=(X1=295.0,Y1=147.0,X2=728.0,Y2=581.0)
    object end
    // Reference: WinBox'wScoreboardPart_Minimap.mMinimapBGPos'
    MinimapBGPos=mMinimapBGPos
    MinimapBGMap=(WidgetTexture=TexRotator'Warfare_UI.HUD_MinimapBG.repair_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=511,Y2=511),TextureScale=0.650,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=89,OffsetY=317,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    MinimapMyself=(WidgetTexture=TexRotator'Warfare_UI.HUD.minimap_myself2_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapCenterX=511
    MinimapCenterY=364
    MinimapSize=433
    DrawFrame=true
    UAVBG_Base=VariableTexPanner'Warfare_GP_UI_HUD_ETC.minimapicon.UAV_BIG_VPan'
    UAVBG=TexRotator'Warfare_GP_UI_HUD_ETC.minimapicon.UAV_BIG_Rot'
    IsClampDistance_SpecialPositions=true
}