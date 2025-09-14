class wHudPart_Bigmap extends wHudPart_MinimapBase
    transient;

var() automated WinFrameChanger FrameChanger;
var() automated WinBox MinimapBGPos;
var FloatBox MinimapCropCoords;
var FloatBoxWH P;

function Initialize(HudBase myOwner, LevelInfo myLevel)
{
    super.Initialize(myOwner, myLevel);
    // End:0xE5
    if((Level.BigmapBG == none) || (((Level.BigmapMinimapCropCoords1.X == float(0)) && Level.BigmapMinimapCropCoords1.Y == float(0)) && Level.BigmapMinimapCropCoords2.X == float(0)) && Level.BigmapMinimapCropCoords2.Y == float(0))
    {
        MinimapCropCoords.X2 = float(Level.BG.MaterialUSize());
        MinimapCropCoords.Y2 = float(Level.BG.MaterialVSize());        
    }
    else
    {
        MinimapCropCoords.X1 = Level.BigmapMinimapCropCoords1.X;
        MinimapCropCoords.Y1 = Level.BigmapMinimapCropCoords1.Y;
        MinimapCropCoords.X2 = Level.BigmapMinimapCropCoords2.X;
        MinimapCropCoords.Y2 = Level.BigmapMinimapCropCoords2.Y;
    }
    //return;    
}

function GetPivotCoords(out Vector it1, out Vector iw1, out Vector it2, out Vector iw2)
{
    // End:0x4E
    if(Level.BigmapBG == none)
    {
        Level.BigmapTextureCoord1 = Level.TextureCoord1;
        Level.BigmapTextureCoord2 = Level.TextureCoord2;
    }
    it1 = Level.BigmapTextureCoord1;
    iw1 = -Level.WorldCoord1;
    it2 = Level.BigmapTextureCoord2;
    iw2 = -Level.WorldCoord2;
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
    local Material bgTex;

    // End:0x60
    if((Level.BigmapBG == none) && Level.BG != none)
    {
        // End:0x40
        if(Level.BG == none)
        {
            return;
        }
        bgTex = Level.BG.Material;        
    }
    else
    {
        bgTex = Level.BigmapBG;
    }
    // End:0x159
    if(bgTex != none)
    {
        FrameChanger.SetFrame(0.0000000, 0.0000000, C.ClipX, C.ClipY);
        P = FrameChanger.WinBoxToFloatBoxWH(MinimapBGPos);
        C.SetPos(P.X, P.Y);
        C.DrawTile(bgTex, P.W, P.H, MinimapCropCoords.X1, MinimapCropCoords.Y1, MinimapCropCoords.X2 - MinimapCropCoords.X1, MinimapCropCoords.Y2 - MinimapCropCoords.Y1);
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
    local TexRotator TexRotator;
    local float mx, my;

    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    // End:0x119
    if(HudOwner.PawnOwner != none)
    {
        TexRotator = TexRotator(MinimapMyself.WidgetTexture);
        TexRotator.Rotation.Yaw = -HudOwner.PawnOwner.Rotation.Yaw + 49149;
        CalculateMinimapPosition(HudOwner.PawnOwner.Location, HudOwner.PawnOwner.Rotation, HudOwner.PawnOwner.Location, mx, my);
        MinimapMyself.OffsetX = int(mx);
        MinimapMyself.OffsetY = int(my);
        DrawTileFromSpriteWidget(C, MinimapMyself);
    }
    C.DrawColor = BaseColor;
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

function DrawMinimap_Allies(Canvas C)
{
    //return;    
}

function DrawMinimap_Enemies(Canvas C)
{
    //return;    
}

function DrawMinimap_Deads(Canvas C)
{
    //return;    
}

function DrawMinimap_Helicopter(Canvas C)
{
    //return;    
}

function DrawMinimap_Airstrike(Canvas C)
{
    //return;    
}

function DrawMinimap_SpecialPositions(Canvas C)
{
    //return;    
}

function DrawMinimap_BGMapUAV(Canvas C)
{
    //return;    
}

defaultproperties
{
    // Reference: WinFrameChanger'XInterface_Decompressed.wHudPart_Bigmap.mFrameChanger'
    begin object name="mFrameChanger" class=Engine.WinFrameChanger
    end object
    FrameChanger=mFrameChanger
    // Reference: WinBox'XInterface_Decompressed.wHudPart_Bigmap.mMinimapBGPos'
    begin object name="mMinimapBGPos" class=Engine.WinBox
        P=(X1=11.0000000,Y1=209.0000000,X2=198.0000000,Y2=396.0000000)
    end object
    MinimapBGPos=mMinimapBGPos
    MinimapBGMap=(WidgetTexture=TexRotator'Warfare_UI.HUD_MinimapBG.repair_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=511,Y2=511),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=89,OffsetY=317,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    MinimapMyself=(WidgetTexture=TexRotator'Warfare_UI.HUD.minimap_myself2_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=86,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MinimapCenterY=303
    MinimapSize=187
    DrawFrame=false
    UAVBG_Base=VariableTexPanner'Warfare_HUD.HUD_Minimap.UAV_BIG_VPan'
    UAVBG=TexRotator'Warfare_HUD.HUD_Minimap.UAV_BIG_Rot'
    IsDrawSpecialPositions=false
    IsClampDistance_SpecialPositions=false
}