/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wHUD_SD.uc
 * Package Imports:
 *	WMission
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:20
 *	Functions:10
 *
 *******************************************************************************/
class wHUD_SD extends wHUD_Mission
    config(User)
    transient;

var SpriteWidget MinimapBomb;
var wGameObject_Bomb objBomb;
var() SpriteWidget IconBomb;
var() SpriteWidget ObjectBomb;
var() array<SpriteWidget> ObjectiveDefend;
var() array<SpriteWidget> ObjectivePlant;
var() array<SpriteWidget> ObjectiveDiffuse;
var() SpriteWidget ObjectNotification;
var wBombObjective BombObjective;
var() SpriteWidget MessageBombKey;
var() SpriteWidget MessageBombSetEnable;
var() SpriteWidget MessageBombSetDoing;
var() SpriteWidget MessageBombSetDone;
var() SpriteWidget MessageBombDiffuseEnable;
var() SpriteWidget MessageBombDiffuseDoing;
var() SpriteWidget MessageBombDiffuseDone;
var name SetObjectiveClass;
var name DiffuseObjectiveClass;
var class<Actor> BombClass;
var float ObjectiveHeightOffset;

function DrawIconBomb(Canvas C)
{
    local float X1, Y1, X2, Y2, XL, YL,
	    U, V, UL, VL, fWidth,
	    fHeight;

    // End:0x16
    if(PlayerOwner.Pawn == none)
    {
        return;
    }
    // End:0x3e
    if(!MSGRI.bMultiBomb)
    {
        HudPart_DisplayMain.DrawHelpKeyControll_Bomb(C);
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    X1 = IconBomb.PosX + float(IconBomb.OffsetX) / 1600.0 * C.ClipX;
    Y1 = IconBomb.PosY + float(IconBomb.OffsetY) / 1200.0 * C.ClipY;
    C.SetPos(X1, Y1);
    fWidth = 101.0 / 1600.0;
    fHeight = 108.0 / 1200.0;
    X2 = X1 + fWidth * C.ClipX;
    Y2 = Y1 + fHeight * C.ClipY;
    XL = X2 - X1;
    YL = Y2 - Y1;
    U = float(IconBomb.TextureCoords.X1);
    V = float(IconBomb.TextureCoords.Y1);
    UL = float(IconBomb.TextureCoords.X2 - IconBomb.TextureCoords.X1);
    VL = float(IconBomb.TextureCoords.Y2 - IconBomb.TextureCoords.Y1);
    C.DrawTile(IconBomb.WidgetTexture, XL, YL, U, V, UL, VL);
}

function DrawAmmo(Canvas C)
{
    super(HudCDeathmatch).DrawAmmo(C);
    // End:0xd7
    if(none != MSGRI)
    {
        // End:0x71
        if(MSGRI.bMultiBomb)
        {
            // End:0x6e
            if(!MSGRI.IsDefender(byte(PawnOwner.GetTeamNum())) && !MSGRI.bObjectivePlanted)
            {
                DrawIconBomb(C);
            }
        }
        // End:0xd7
        else
        {
            // End:0xd7
            if(none != MSGRI.GameObject)
            {
                // End:0xd7
                if(MSGRI.GameObject.IsA('wGameObject_Bomb'))
                {
                    // End:0xd7
                    if(MSGRI.GameObject.HolderPRI == PawnOwner.PlayerReplicationInfo)
                    {
                        DrawIconBomb(C);
                    }
                }
            }
        }
    }
}

simulated function DrawHudPassA(Canvas C)
{
    ResetCacheBomb();
    super.DrawHudPassA(C);
    // End:0x7a
    if(Level.GRI.RoundState == 2)
    {
        // End:0x7a
        if(Level.GRI.GameClass != "WMission.wSBTGameInfo")
        {
            HudPart_DisplayMain.DrawSurvivedUsers(C);
        }
    }
}

function wGameObject_Bomb GetCacheBomb()
{
    local Actor Bomb;

    // End:0x2d
    if(objBomb == none)
    {
        // End:0x2c
        foreach DynamicActors(BombClass, Bomb)
        {
            objBomb = wGameObject_Bomb(Bomb);                        
        }
    }
    return objBomb;
}

function ResetCacheBomb()
{
    objBomb = none;
}

function Pawn GetBombHolderPawn()
{
    local Pawn Holder;

    // End:0x0e
    if(none == GetCacheBomb())
    {
        return none;
    }
    // End:0x5e
    if(GetCacheBomb().HolderPRI != none)
    {
        // End:0x5d
        foreach DynamicActors(class'Pawn', Holder)
        {
            // End:0x5c
            if(Holder.PlayerReplicationInfo == GetCacheBomb().HolderPRI)
            {
                break;
                return Holder;
            }                        
        }
    }
    return none;
}

function CheckAndDrawProgress(GameObjective Go, Canvas C)
{
    local float ProgressPct, fDeltaTime, fRatio;

    // End:0xcc
    if(Go.IsA(SetObjectiveClass) && PawnOwnerPRI != none)
    {
        ProgressPct = Go.GetObjectiveProgress();
        // End:0x73
        if(wSetObjective(Go).CanPlant(PawnOwner))
        {
            HudPart_DisplayEvent.DrawMessageSD_BombEnable(C, MessageBombKey, MessageBombSetEnable);
        }
        // End:0xc9
        else
        {
            // End:0xbe
            if(PawnOwner != none && wSetObjective(Go).IsPlanting(PawnOwner))
            {
                HudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone(C, MessageBombSetDoing, true, ProgressPct);
            }
            // End:0xc9
            else
            {
                ProgressPct = 0.0;
            }
        }
    }
    // End:0x188
    else
    {
        // End:0x188
        if(Go.IsA(DiffuseObjectiveClass))
        {
            // End:0x11d
            if(wDiffuseObjective(Go).CanDefuse(PawnOwner))
            {
                HudPart_DisplayEvent.DrawMessageSD_BombEnable(C, MessageBombKey, MessageBombDiffuseEnable);
            }
            // End:0x188
            else
            {
                // End:0x17d
                if(PawnOwner != none && wDiffuseObjective(Go).IsDefusing(PawnOwner))
                {
                    ProgressPct = Go.GetObjectiveProgress();
                    HudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone(C, MessageBombDiffuseDoing, true, ProgressPct);
                }
                // End:0x188
                else
                {
                    ProgressPct = 0.0;
                }
            }
        }
    }
    // End:0x27a
    if(Go != none && MSGRI != none && PawnOwnerPRI != none)
    {
        // End:0x27a
        if(MSGRI.bObjectivePlanted && MSGRI.CurrentAttackingTeam == PawnOwnerPRI.Team.TeamIndex)
        {
            // End:0x27a
            if(fProgressDoneTime + 2.50 > Level.TimeSeconds)
            {
                fDeltaTime = Level.TimeSeconds - fProgressDoneTime;
                // End:0x242
                if(fDeltaTime < 1.250)
                {
                    fRatio = 1.0;
                }
                // End:0x25b
                else
                {
                    fRatio = 1.0 - fDeltaTime / 2.50;
                }
                HudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone(C, MessageBombSetDone, false, fRatio);
            }
        }
    }
    // End:0x287
    if(ProgressPct > float(0))
    {
    }
}

function DrawMiniMap(wHudPart_MinimapBase Minimap, Canvas C)
{
    local int lp1, idx, iTeamIndex;
    local SpriteWidget Sprite;
    local GameObjective Go;
    local float minimapX, minimapY, W, H;

    // End:0x72
    if(PlayerOwner.ViewTarget != none && Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        iTeamIndex = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0x87
    else
    {
        iTeamIndex = PlayerOwner.GetTeamNum();
    }
    lp1 = 0;
    J0x8e:
    // End:0x3d7 [While If]
    if(lp1 < obj.Length)
    {
        Go = obj[lp1];
        // End:0x3cd
        if(Go.IsActive())
        {
            idx = GetGameObjectIndex(Go);
            Sprite.WidgetTexture = none;
            // End:0x133
            if(Go.IsA(SetObjectiveClass))
            {
                // End:0x11f
                if(MSGRI.IsDefender(byte(iTeamIndex)))
                {
                    Sprite = MinimapAllyFlag[idx];
                }
                // End:0x130
                else
                {
                    Sprite = MinimapEnemyFlags[idx];
                }
            }
            // End:0x185
            else
            {
                // End:0x185
                if(Go.IsA(DiffuseObjectiveClass))
                {
                    // End:0x174
                    if(MSGRI.IsDefender(byte(iTeamIndex)))
                    {
                        Sprite = MinimapEnemyFlags[idx];
                    }
                    // End:0x185
                    else
                    {
                        Sprite = MinimapAllyFlag[idx];
                    }
                }
            }
            // End:0x3cd
            if(Sprite.WidgetTexture != none)
            {
                // End:0x1e6
                if(PawnOwner == none)
                {
                    Minimap.CalculateMinimapPosition(PlayerOwner.Location, PlayerOwner.Rotation, Go.Location, minimapX, minimapY);
                }
                // End:0x229
                else
                {
                    Minimap.CalculateMinimapPosition(PawnOwner.Location, PawnOwner.Rotation, Go.Location, minimapX, minimapY);
                }
                Minimap.ClampMinimapPosition(minimapX, minimapY);
                Minimap.SetupMinimapSpriteWidgetForDrawing(Sprite, Go.Rotation, minimapX, minimapY);
                W = float(Sprite.WidgetTexture.MaterialUSize()) * Minimap.IconSizeF;
                H = float(Sprite.WidgetTexture.MaterialVSize()) * Minimap.IconSizeF;
                C.SetPos(minimapX - W / float(2) / 1024.0 * C.ClipX, minimapY - H / float(2) / 768.0 * C.ClipY);
                C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(Sprite.WidgetTexture, W / 1024.0 * C.ClipX, H / 768.0 * C.ClipY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x8e;
    }
    DrawMinimapBomb(Minimap, C);
}

function DrawMinimapBomb(wHudPart_MinimapBase Minimap, Canvas C)
{
    local Vector bomLoc;
    local float W, H, minimapX, minimapY;
    local int iTeamIndex;

    // End:0x72
    if(PlayerOwner.ViewTarget != none && Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        iTeamIndex = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0x87
    else
    {
        iTeamIndex = PlayerOwner.GetTeamNum();
    }
    // End:0x34c
    if(!MSGRI.IsDefender(byte(iTeamIndex)) && !MSGRI.bMultiBomb && !MSGRI.bObjectivePlanted)
    {
        // End:0x34c
        if(GetCacheBomb() != none && GetCacheBomb().HolderPRI == none || PlayerOwner.PlayerReplicationInfo.HasFlag == none)
        {
            // End:0x13d
            if(GetCacheBomb().HolderPRI == none)
            {
                bomLoc = GetCacheBomb().Location;
            }
            // End:0x152
            else
            {
                bomLoc = GetBombHolderPawn().Location;
            }
            // End:0x19a
            if(PawnOwner == none)
            {
                Minimap.CalculateMinimapPosition(PlayerOwner.Location, PlayerOwner.Rotation, bomLoc, minimapX, minimapY);
            }
            // End:0x1d4
            else
            {
                Minimap.CalculateMinimapPosition(PawnOwner.Location, PawnOwner.Rotation, bomLoc, minimapX, minimapY);
            }
            Minimap.ClampMinimapPosition(minimapX, minimapY);
            W = float(MinimapBomb.WidgetTexture.MaterialUSize()) * Minimap.IconSizeF;
            H = float(MinimapBomb.WidgetTexture.MaterialVSize()) * Minimap.IconSizeF;
            C.SetPos(minimapX - W / float(2) / 1024.0 * C.ClipX, minimapY - H / float(2) / 768.0 * C.ClipY);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(MinimapBomb.WidgetTexture, W / 1024.0 * C.ClipX, H / 768.0 * C.ClipY, 0.0, 0.0, float(MinimapBomb.WidgetTexture.MaterialUSize()), float(MinimapBomb.WidgetTexture.MaterialVSize()));
        }
    }
}

simulated function DrawObjectives(Canvas C)
{
    local int i, iTeamIndex;
    local GameObjective Go;
    local Vector camLoc;
    local Rotator camRot;
    local SpriteWidget objectSprite;
    local int objectIndex;
    local Vector objectLoc;
    local wGameObject_Bomb Bomb;
    local Vector NametagScreenPos, NametagPosition;
    local bool canSeeHolder;
    local Pawn Holder;

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
    BehindObjectiveCount = 0;
    C.GetCameraLocation(camLoc, camRot);
    // End:0xc3
    if(PlayerOwner.ViewTarget != none && Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        iTeamIndex = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;
    }
    // End:0xd8
    else
    {
        iTeamIndex = PlayerOwner.GetTeamNum();
    }
    // End:0x230
    if(!MSGRI.IsDefender(byte(iTeamIndex)) && !MSGRI.bMultiBomb && !MSGRI.bObjectivePlanted)
    {
        Bomb = GetCacheBomb();
        canSeeHolder = true;
        // End:0x19e
        if(PlayerOwner.PlayerReplicationInfo.HasFlag == none)
        {
            Holder = GetBombHolderPawn();
            // End:0x19e
            if(Holder != none)
            {
                NametagPosition = CalcNametagPos(Holder);
                canSeeHolder = IsTargetInFrontOfPlayer2(C, NametagPosition, NametagScreenPos, camLoc, camRot);
            }
        }
        // End:0x1da
        if(Bomb.HolderPRI == none)
        {
            objectLoc = Bomb.Location;
            objectLoc.Z += ObjectiveHeightOffset;
        }
        // End:0x1e5
        else
        {
            objectLoc = NametagPosition;
        }
        // End:0x230
        if(bShowMissionIcon && Bomb.HolderPRI == none || !canSeeHolder)
        {
            // End:0x230
            if(true)
            {
                DrawObjectSprite(C, Bomb, ObjectBomb, objectLoc, true);
            }
        }
    }
    i = 0;
    J0x237:
    // End:0x432 [While If]
    if(i < obj.Length)
    {
        Go = obj[i];
        // End:0x428
        if(Go.IsActive())
        {
            // End:0x28e
            if(Go.IsA('wBombObjective'))
            {
                BombObjective = wBombObjective(Go);
            }
            // End:0x428
            if(true)
            {
                // End:0x2e9
                if(MSGRI != none)
                {
                    // End:0x2b7
                    if(Go.IsA('wBombObjective_Delivery'))
                    {
                        // This is an implied JumpToken;
                        goto J0x428;
                    }
                    // End:0x2e9
                    else
                    {
                        // End:0x2e9
                        if(MSGRI.IsDefender(byte(iTeamIndex)) && Go.IsA('wBombObjective'))
                        {
                        }
                        // End:0x428
                        else
                        {
                        }
                    }
                    objectSprite.WidgetTexture = none;
                    objectIndex = GetGameObjectIndex(Go);
                    objectLoc = Go.Location;
                    // End:0x418
                    if(true)
                    {
                        // End:0x387
                        if(Go.IsA(SetObjectiveClass))
                        {
                            // End:0x35f
                            if(MSGRI.IsDefender(byte(iTeamIndex)))
                            {
                                objectSprite = ObjectiveDefend[objectIndex];
                            }
                            // End:0x370
                            else
                            {
                                objectSprite = ObjectivePlant[objectIndex];
                            }
                            HudPart_DisplayEvent.SetBombObjectIndex(objectIndex);
                        }
                        // End:0x3ed
                        else
                        {
                            // End:0x3ed
                            if(Go.IsA(DiffuseObjectiveClass))
                            {
                                // End:0x3c8
                                if(MSGRI.IsDefender(byte(iTeamIndex)))
                                {
                                    objectSprite = ObjectiveDiffuse[objectIndex];
                                }
                                // End:0x3d9
                                else
                                {
                                    objectSprite = ObjectiveDefend[objectIndex];
                                }
                                HudPart_DisplayEvent.SetBombObjectIndex(objectIndex);
                            }
                        }
                        // End:0x418
                        if(objectSprite.WidgetTexture != none)
                        {
                            DrawObjectSprite(C, Go, objectSprite, objectLoc, true);
                        }
                    }
                    CheckAndDrawProgress(Go, C);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x237;
    }
}

defaultproperties
{
    MinimapBomb=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.minimapicon.map_bomb',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=15),TextureScale=0.650,DrawPivot=8,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    IconBomb=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Common.img_demo_pack',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=101,Y2=108),TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=1011,OffsetY=1087,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectBomb=(WidgetTexture=FinalBlend'Warfare_GP_UI_HUD_ETC.DisplayIcon.c4_bomb_fb',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.370,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectiveDefend=// Object reference not set to an instance of an object.
    
    ObjectivePlant=// Object reference not set to an instance of an object.
    
    ObjectiveDiffuse=// Object reference not set to an instance of an object.
    
    ObjectNotification=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.point_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.370,DrawPivot=5,PosX=0.0,PosY=0.0,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombKey=(WidgetTexture=Texture'Warfare_HUD.HUD.keyb_F',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=39,Y2=39),TextureScale=0.650,DrawPivot=0,PosX=0.3868750,PosY=0.290,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombSetEnable=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=644,Y1=536,X2=1024,Y2=580),TextureScale=0.650,DrawPivot=0,PosX=0.4193750,PosY=0.2983330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombSetDoing=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=536,X2=256,Y2=580),TextureScale=0.650,DrawPivot=0,PosX=0.4193750,PosY=0.2833330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombSetDone=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=580,X2=256,Y2=624),TextureScale=0.650,DrawPivot=0,PosX=0.420,PosY=0.2983330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombDiffuseEnable=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=644,Y1=492,X2=1024,Y2=536),TextureScale=0.650,DrawPivot=0,PosX=0.4193750,PosY=0.2983330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombDiffuseDoing=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=536,X2=512,Y2=580),TextureScale=0.650,DrawPivot=0,PosX=0.4193750,PosY=0.2833330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombDiffuseDone=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=580,X2=512,Y2=624),TextureScale=0.650,DrawPivot=0,PosX=0.420,PosY=0.2983330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SetObjectiveClass=wSetObjective
    DiffuseObjectiveClass=wDiffuseObjective
    BombClass=class'wGameObject_Bomb'
    ObjectiveHeightOffset=20.0
}