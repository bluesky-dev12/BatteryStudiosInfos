class wHUD_Medal extends wHUD_Mission
    transient
    config(User);

var SpriteWidget MinimapMedal;
var SpriteWidget ObjectMedal;
var float ObjectiveHeightOffset;

function DrawAmmo(Canvas C)
{
    super(HudCDeathmatch).DrawAmmo(C);
    DrawMedal(C);
    //return;    
}

function DrawMedal(Canvas C)
{
    // End:0x16
    if(PlayerOwner.Pawn == none)
    {
        return;
    }
    C.DrawColor = C.MakeColor(218, 165, 32, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(string(PlayerOwner.PlayerReplicationInfo.NumMedals), 2, 1405.0000000 * _reX, 1066.0000000 * _reY, 1586.0000000 * _reX, 1091.0000000 * _reY, int((float(24) / 1200.0000000) * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
    //return;    
}

function DrawHudPassA_Score(Canvas C)
{
    local CalCoordsW calW;

    super(HudCDeathmatch).DrawHudPassA_Score(C);
    CalculateCoordinateEx(C, HudPart_DisplayEvent.WTeamScoreBG, 486.0000000, 40.0000000, calW);
    HudPart_DisplayEvent.DrawMainScoreTeam(C, int(Level.GRI.Teams[0].Score2), int(Level.GRI.Teams[1].Score2), 557, 40, calW);
    //return;    
}

function DrawMiniMap(wHudPart_MinimapBase Minimap, Canvas C)
{
    local int lp1;
    local SpriteWidget Sprite;
    local Actor Go;
    local float minimapX, minimapY, W, H;

    lp1 = 0;
    J0x07:

    // End:0x268 [Loop If]
    if(lp1 < Level.Medals.Length)
    {
        Go = Level.Medals[lp1];
        Sprite = MinimapMedal;
        // End:0x96
        if(PawnOwner == none)
        {
            Minimap.CalculateMinimapPosition(PlayerOwner.Location, PlayerOwner.Rotation, Go.Location, minimapX, minimapY);            
        }
        else
        {
            Minimap.CalculateMinimapPosition(PawnOwner.Location, PawnOwner.Rotation, Go.Location, minimapX, minimapY);
        }
        Minimap.ClampMinimapPosition(minimapX, minimapY);
        Minimap.SetupMinimapSpriteWidgetForDrawing(Sprite, Go.Rotation, minimapX, minimapY);
        W = float(Sprite.WidgetTexture.MaterialUSize()) * Minimap.IconSizeF;
        H = float(Sprite.WidgetTexture.MaterialVSize()) * Minimap.IconSizeF;
        C.SetPos(((minimapX - (W / float(2))) / 1024.0000000) * C.ClipX, ((minimapY - (H / float(2))) / 768.0000000) * C.ClipY);
        C.DrawTile(Sprite.WidgetTexture, (W / 1024.0000000) * C.ClipX, (H / 768.0000000) * C.ClipY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function DrawObjectives(Canvas C)
{
    local Vector ScreenPos, camLoc;
    local Rotator camRot;
    local Vector objectLoc;
    local Actor medal;
    local int lp1;

    // End:0x23
    if((none == Level) || none == Level.GRI)
    {
        return;
    }
    // End:0x30
    if(none == MSGRI)
    {
        return;
    }
    C.GetCameraLocation(camLoc, camRot);
    lp1 = 0;
    J0x50:

    // End:0xEB [Loop If]
    if(lp1 < Level.Medals.Length)
    {
        medal = Level.Medals[lp1];
        objectLoc = medal.Location;
        objectLoc.Z += ObjectiveHeightOffset;
        // End:0xE1
        if(IsTargetInFrontOfPlayer2(C, objectLoc, ScreenPos, camLoc, camRot))
        {
            DrawObjectSprite(C, none, ObjectMedal, objectLoc, true);
        }
        lp1++;
        // [Loop Continue]
        goto J0x50;
    }
    //return;    
}

defaultproperties
{
    MinimapMedal=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.minimapicon.map_bomb',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=15),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectMedal=(WidgetTexture=FinalBlend'Warfare_TH_UI_HUD_ETC.DisplayIcon.c4_bomb_fb',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectiveHeightOffset=20.0000000
}