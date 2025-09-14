/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wHUD_Medal.uc
 * Package Imports:
 *	WMission
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class wHUD_Medal extends wHUD_Mission
    config(User)
    transient;

var SpriteWidget MinimapMedal;
var SpriteWidget ObjectMedal;
var float ObjectiveHeightOffset;

function DrawAmmo(Canvas C)
{
    super(HudCDeathmatch).DrawAmmo(C);
    DrawMedal(C);
}

function DrawMedal(Canvas C)
{
    // End:0x16
    if(PlayerOwner.Pawn == none)
    {
        return;
    }
    C.DrawColor = C.MakeColor(218, 165, 32, byte(255));
    C.BtrDrawTextJustifiedWithVolumeLine(string(PlayerOwner.PlayerReplicationInfo.NumMedals), 2, 1405.0 * _reX, 1066.0 * _reY, 1586.0 * _reX, 1091.0 * _reY, int(float(24) / 1200.0 * C.ClipY), C.MakeColorNoEmpty(0, 0, 0, 0), 1, 1);
}

simulated function DrawHudPassA(Canvas C)
{
    super.DrawHudPassA(C);
}

function DrawHudPassA_Score(Canvas C)
{
    local CalCoordsW calW;

    super(HudCDeathmatch).DrawHudPassA_Score(C);
    CalculateCoordinateEx(C, HudPart_DisplayEvent.WTeamScoreBG, 486.0, 40.0, calW);
    HudPart_DisplayEvent.DrawMainScoreTeam(C, int(Level.GRI.Teams[0].Score2), int(Level.GRI.Teams[1].Score2), 557, 40, calW);
}

function DrawMiniMap(wHudPart_MinimapBase Minimap, Canvas C)
{
    local int lp1;
    local SpriteWidget Sprite;
    local Actor Go;
    local float minimapX, minimapY, W, H;

    lp1 = 0;
    J0x07:
    // End:0x268 [While If]
    if(lp1 < Level.Medals.Length)
    {
        Go = Level.Medals[lp1];
        Sprite = MinimapMedal;
        // End:0x96
        if(PawnOwner == none)
        {
            Minimap.CalculateMinimapPosition(PlayerOwner.Location, PlayerOwner.Rotation, Go.Location, minimapX, minimapY);
        }
        // End:0xd9
        else
        {
            Minimap.CalculateMinimapPosition(PawnOwner.Location, PawnOwner.Rotation, Go.Location, minimapX, minimapY);
        }
        Minimap.ClampMinimapPosition(minimapX, minimapY);
        Minimap.SetupMinimapSpriteWidgetForDrawing(Sprite, Go.Rotation, minimapX, minimapY);
        W = float(Sprite.WidgetTexture.MaterialUSize()) * Minimap.IconSizeF;
        H = float(Sprite.WidgetTexture.MaterialVSize()) * Minimap.IconSizeF;
        C.SetPos(minimapX - W / float(2) / 1024.0 * C.ClipX, minimapY - H / float(2) / 768.0 * C.ClipY);
        C.DrawTile(Sprite.WidgetTexture, W / 1024.0 * C.ClipX, H / 768.0 * C.ClipY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function DrawObjectives(Canvas C)
{
    local Vector ScreenPos, camLoc;
    local Rotator camRot;
    local Vector objectLoc;
    local Actor medal;
    local int lp1;

    // End:0x23
    if(none == Level || none == Level.GRI)
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
    // End:0xeb [While If]
    if(lp1 < Level.Medals.Length)
    {
        medal = Level.Medals[lp1];
        objectLoc = medal.Location;
        objectLoc.Z += ObjectiveHeightOffset;
        // End:0xe1
        if(IsTargetInFrontOfPlayer2(C, objectLoc, ScreenPos, camLoc, camRot))
        {
            DrawObjectSprite(C, none, ObjectMedal, objectLoc, true);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
}

defaultproperties
{
    MinimapMedal=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=15),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectMedal=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.DisplayIcon.c4_bomb_fb',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.370,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectiveHeightOffset=20.0
}