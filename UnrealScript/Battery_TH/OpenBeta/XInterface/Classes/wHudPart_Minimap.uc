class wHudPart_Minimap extends wHudPart_MinimapBase
    transient;

var float fFadeEffectTime;

function DrawMinimap_Airstrike(Canvas C)
{
    local Vector v1, v2;
    local float MinimapX1, MinimapY1, minimapX2, minimapY2, AirStrikeX1, AirStrikeY1,
	    AirStrikeX2, AirStrikeY2, AirStrikeCx, AirStrikeCy, AirStrikeDist,
	    tx1, ty1, tx2, ty2;

    local int ix1, ix2, iy1, iy2;

    // End:0x5AA
    if((true == Level.IsAirStriking) || Level.fAirStrikeFadeTime > 0.0000000)
    {
        super.DrawMinimap_Airstrike(C);
        v1 = HudOwner.PawnOwner.Location;
        v1.Z = 0.0000000;
        v2.X = HudOwner.PlayerOwner.fAirStrikeCenterX;
        v2.Y = HudOwner.PlayerOwner.fAirStrikeCenterY;
        // End:0xDE
        if(VSize(v1 - v2) > (HudOwner.PlayerOwner.fAirStrikeRadius + 6000.0000000))
        {
            return;
        }
        tx1 = v2.X - HudOwner.PlayerOwner.fAirStrikeRadius;
        ty1 = v2.Y - HudOwner.PlayerOwner.fAirStrikeRadius;
        tx2 = v2.X + HudOwner.PlayerOwner.fAirStrikeRadius;
        ty2 = v2.Y + HudOwner.PlayerOwner.fAirStrikeRadius;
        MinimapX1 = float(MinimapCenterX - (MinimapSize / 2));
        minimapX2 = float(MinimapCenterX + (MinimapSize / 2));
        MinimapY1 = float(MinimapCenterY - (MinimapSize / 2));
        minimapY2 = float(MinimapCenterY + (MinimapSize / 2));
        v1.X = tx1;
        v1.Y = ty1;
        MapWorldLocationToMinimapTextureLocation(v1, ix1, iy1);
        v1.X = tx2;
        v1.Y = ty2;
        MapWorldLocationToMinimapTextureLocation(v1, ix2, iy2);
        v1.X = v2.X;
        v1.Y = v2.Y;
        CalculateMinimapPositionPawnCentering(HudOwner.PawnOwner, v1, AirStrikeCx, AirStrikeCy);
        AirStrikeDist = (float(ix2 - ix1) * IconSizeF) / float(2);
        AirStrikeX1 = AirStrikeCx - AirStrikeDist;
        AirStrikeX2 = AirStrikeCx + AirStrikeDist;
        AirStrikeY1 = AirStrikeCy - AirStrikeDist;
        AirStrikeY2 = AirStrikeCy + AirStrikeDist;
        AirStrikeDist = AirStrikeX2 - AirStrikeX1;
        // End:0x343
        if(AirStrikeX1 < MinimapX1)
        {
            tx1 = MinimapX1 - AirStrikeX1;
            AirStrikeX1 = MinimapX1;            
        }
        else
        {
            tx1 = 0.0000000;
        }
        // End:0x384
        if(AirStrikeX2 > minimapX2)
        {
            AirStrikeX2 = minimapX2;
            tx2 = tx1 + (AirStrikeX2 - AirStrikeX1);            
        }
        else
        {
            tx2 = tx1 + (AirStrikeX2 - AirStrikeX1);
        }
        // End:0x3CC
        if(AirStrikeY1 < MinimapY1)
        {
            ty1 = MinimapY1 - AirStrikeY1;
            AirStrikeY1 = MinimapY1;            
        }
        else
        {
            ty1 = 0.0000000;
        }
        // End:0x40D
        if(AirStrikeY2 > minimapY2)
        {
            AirStrikeY2 = minimapY2;
            ty2 = ty1 + (AirStrikeY2 - AirStrikeY1);            
        }
        else
        {
            ty2 = ty1 + (AirStrikeY2 - AirStrikeY1);
        }
        tx1 = float(MinimapAirStrikeRect.TextureCoords.X2) * (tx1 / AirStrikeDist);
        ty1 = float(MinimapAirStrikeRect.TextureCoords.Y2) * (ty1 / AirStrikeDist);
        tx2 = float(MinimapAirStrikeRect.TextureCoords.X2) * (tx2 / AirStrikeDist);
        ty2 = float(MinimapAirStrikeRect.TextureCoords.Y2) * (ty2 / AirStrikeDist);
        AirStrikeDist = float(C.DrawColor.A);
        C.DrawColor.A = byte(255.0000000 * (Level.fAirStrikeFadeTime / 2.0000000));
        C.SetPos(AirStrikeX1 * _rX, AirStrikeY1 * _rY);
        C.DrawTile(MinimapAirStrikeRect.WidgetTexture, (AirStrikeX2 - AirStrikeX1) * _rX, (AirStrikeY2 - AirStrikeY1) * _rY, tx1, ty1, tx2 - tx1, ty2 - ty1);
        C.DrawColor.A = byte(AirStrikeDist);
    }
    //return;    
}

defaultproperties
{
    fFadeEffectTime=1.0000000
    MinimapBGMap=(WidgetTexture=TexRotator'Warfare_UI.HUD_MinimapBG.repair_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=511,Y2=511),TextureScale=0.6500000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=11,OffsetY=11,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=192),Tints[1]=(R=255,G=255,B=255,A=192))
    MinimapMyself=(WidgetTexture=TexRotator'Warfare_UI.HUD.minimap_myself2_rot',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=104,OffsetY=104,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}