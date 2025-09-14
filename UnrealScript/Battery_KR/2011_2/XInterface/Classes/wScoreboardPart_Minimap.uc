class wScoreboardPart_Minimap extends wHudPart_MinimapBase
    transient;

var() automated WinFrameChanger FrameChanger;
var() automated WinBox MinimapBGPos;
var FloatBox MinimapCropCoords;
var FloatBoxWH P;

function Initialize(HudBase myOwner, LevelInfo myLevel)
{
    super.Initialize(myOwner, myLevel);
    // End:0xBB
    if((Level.BG == none) || (((Level.MinimapCropCoords1.X == float(0)) && Level.MinimapCropCoords1.Y == float(0)) && Level.MinimapCropCoords2.X == float(0)) && Level.MinimapCropCoords2.Y == float(0))
    {
        MinimapCropCoords.X2 = 342.0000000;
        MinimapCropCoords.Y2 = 342.0000000;        
    }
    else
    {
        MinimapCropCoords.X1 = Level.MinimapCropCoords1.X;
        MinimapCropCoords.Y1 = Level.MinimapCropCoords1.Y;
        MinimapCropCoords.X2 = Level.MinimapCropCoords2.X;
        MinimapCropCoords.Y2 = Level.MinimapCropCoords2.Y;
    }
    //return;    
}

function Draw(Canvas C)
{
    C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
    super.Draw(C);
    //return;    
}

function DrawMinimap_BGMap(Canvas C)
{
    local TexRotator rotTexture;

    rotTexture = Level.BG;
    // End:0x13F
    if(rotTexture != none)
    {
        rotTexture.UOffset = 0.0000000;
        rotTexture.VOffset = 0.0000000;
        rotTexture.Rotation.Yaw = 0;
        FrameChanger.SetFrame(0.0000000, 0.0000000, C.ClipX, C.ClipY);
        P = FrameChanger.WinBoxToFloatBoxWH(MinimapBGPos);
        C.SetPos(P.X, P.Y);
        C.DrawTile(Level.BG, P.W, P.H, MinimapCropCoords.X1, MinimapCropCoords.Y1, MinimapCropCoords.X2 - MinimapCropCoords.X1, MinimapCropCoords.Y2 - MinimapCropCoords.Y1);
    }
    //return;    
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
    //return;    
}

function DrawMinimap_Myself(Canvas C)
{
    local float mx, my, W, H, w2, H2,
	    UL, VL;

    local Rotator R;

    // End:0x182
    if(HudOwner.PawnOwner != none)
    {
        UL = float(MinimapMatMyself.MaterialUSize());
        VL = float(MinimapMatMyself.MaterialVSize());
        W = UL * _rX;
        H = VL * _rY;
        w2 = W / float(2);
        H2 = H / float(2);
        CalculateMinimapPosition(HudOwner.PawnOwner.Location, HudOwner.PawnOwner.Rotation, HudOwner.PawnOwner.Location, mx, my);
        TexRotator(MinimapMatMyself).Rotation.Yaw = -HudOwner.PawnOwner.Rotation.Yaw + 49149;
        C.SetPos((mx * _rX) - w2, (my * _rY) - H2);
        C.DrawTile(MinimapMatMyself, W, H, 0.0000000, 0.0000000, UL, VL);
    }
    //return;    
}

function CalcMinimapRotation(Rotator Rotation, out Rotator outRotation)
{
    outRotation.Yaw = Rotation.Yaw - 49149;
    //return;    
}

function SetupMinimapSpriteWidgetForDrawing(out SpriteWidget Sprite, Rotator Rotation, float minimapX, float minimapY)
{
    local TexRotator TexRotator;

    Sprite.OffsetX = int(minimapX);
    Sprite.OffsetY = int(minimapY);
    TexRotator = TexRotator(Sprite.WidgetTexture);
    // End:0x6B
    if(TexRotator != none)
    {
        TexRotator.Rotation.Yaw = -Rotation.Yaw + 49149;
    }
    //return;    
}

function CalculateMinimapPosition(Vector centerLoc, Rotator centerRotation, Vector TargetLoc, out float minimapX, out float minimapY)
{
    local int TX, ty;
    local float xRatio, yRatio;

    MapWorldLocationToMinimapTextureLocation(TargetLoc, TX, ty);
    xRatio = (float(TX) - MinimapCropCoords.X1) / (MinimapCropCoords.X2 - MinimapCropCoords.X1);
    yRatio = (float(ty) - MinimapCropCoords.Y1) / (MinimapCropCoords.Y2 - MinimapCropCoords.Y1);
    minimapX = MinimapBGPos.P.X1 + (xRatio * (MinimapBGPos.P.X2 - MinimapBGPos.P.X1));
    minimapY = MinimapBGPos.P.Y1 + (yRatio * (MinimapBGPos.P.Y2 - MinimapBGPos.P.Y1));
    //return;    
}

function CalculateTexturePositionFromMinimapPosition(float minimapX, float minimapY, out int TX, out int ty)
{
    TX = int(((float(int(minimapX - MinimapBGPos.P.X1)) / (MinimapBGPos.P.X2 - MinimapBGPos.P.X1)) * (MinimapCropCoords.X2 - MinimapCropCoords.X1)) + MinimapCropCoords.X1);
    ty = int(((float(int(minimapY - MinimapBGPos.P.Y1)) / (MinimapBGPos.P.Y2 - MinimapBGPos.P.Y1)) * (MinimapCropCoords.Y2 - MinimapCropCoords.Y1)) + MinimapCropCoords.Y1);
    //return;    
}

defaultproperties
{
    // Reference: WinFrameChanger'XInterface_Decompressed.wScoreboardPart_Minimap.mFrameChanger'
    begin object name="mFrameChanger" class=Engine.WinFrameChanger
    end object
    FrameChanger=mFrameChanger
    // Reference: WinBox'XInterface_Decompressed.wScoreboardPart_Minimap.mMinimapBGPos'
    begin object name="mMinimapBGPos" class=Engine.WinBox
        P=(X1=89.0000000,Y1=317.0000000,X2=493.0000000,Y2=721.0000000)
    end object
    MinimapBGPos=mMinimapBGPos
    MinimapBGMap=(WidgetTexture=TexRotator'Warfare_UI.HUD_MinimapBG.repair_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=511,Y2=511),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=89,OffsetY=317,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    MinimapMyself=(WidgetTexture=TexRotator'Warfare_UI.HUD.minimap_myself2_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapCenterX=291
    MinimapCenterY=519
    MinimapSize=404
    DrawFrame=false
    UAVBG_Base=VariableTexPanner'Warfare_UI_HUD_ETC.minimapicon.UAV_BIG_VPan'
    UAVBG=TexRotator'Warfare_UI_HUD_ETC.minimapicon.UAV_BIG_Rot'
    IsClampDistance_SpecialPositions=false
}