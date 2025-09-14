class wHUD_SD extends wHUD_Mission
    transient
    config(User);

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
var Class<Actor> BombClass;
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
    // End:0x3E
    if(!MSGRI.bMultiBomb)
    {
        HudPart_DisplayMain.DrawHelpKeyControll_Bomb(C);
    }
    C.DrawColor = C.MakeColor(byte(255), byte(255), byte(255), byte(255));
    X1 = (IconBomb.PosX + (float(IconBomb.OffsetX) / 1600.0000000)) * C.ClipX;
    Y1 = (IconBomb.PosY + (float(IconBomb.OffsetY) / 1200.0000000)) * C.ClipY;
    C.SetPos(X1, Y1);
    fWidth = 101.0000000 / 1600.0000000;
    fHeight = 108.0000000 / 1200.0000000;
    X2 = X1 + (fWidth * C.ClipX);
    Y2 = Y1 + (fHeight * C.ClipY);
    XL = X2 - X1;
    YL = Y2 - Y1;
    U = float(IconBomb.TextureCoords.X1);
    V = float(IconBomb.TextureCoords.Y1);
    UL = float(IconBomb.TextureCoords.X2 - IconBomb.TextureCoords.X1);
    VL = float(IconBomb.TextureCoords.Y2 - IconBomb.TextureCoords.Y1);
    C.DrawTile(IconBomb.WidgetTexture, XL, YL, U, V, UL, VL);
    //return;    
}

function DrawAmmo(Canvas C)
{
    super(HudCDeathmatch).DrawAmmo(C);
    // End:0xD7
    if(none != MSGRI)
    {
        // End:0x71
        if(MSGRI.bMultiBomb)
        {
            // End:0x6E
            if(!MSGRI.IsDefender(byte(PawnOwner.GetTeamNum())) && !MSGRI.bObjectivePlanted)
            {
                DrawIconBomb(C);
            }            
        }
        else
        {
            // End:0xD7
            if(none != MSGRI.GameObject)
            {
                // End:0xD7
                if(MSGRI.GameObject.IsA('wGameObject_Bomb'))
                {
                    // End:0xD7
                    if(MSGRI.GameObject.HolderPRI == PawnOwner.PlayerReplicationInfo)
                    {
                        DrawIconBomb(C);
                    }
                }
            }
        }
    }
    //return;    
}

simulated function DrawHudPassA(Canvas C)
{
    ResetCacheBomb();
    super.DrawHudPassA(C);
    // End:0x7A
    if(int(Level.GRI.RoundState) == int(2))
    {
        // End:0x7A
        if(Level.GRI.GameClass != "WMission.wSBTGameInfo")
        {
            HudPart_DisplayMain.DrawSurvivedUsers(C);
        }
    }
    //return;    
}

function wGameObject_Bomb GetCacheBomb()
{
    local Actor Bomb;

    // End:0x2D
    if(objBomb == none)
    {
        // End:0x2C
        foreach DynamicActors(BombClass, Bomb)
        {
            objBomb = wGameObject_Bomb(Bomb);            
        }        
    }
    return objBomb;
    //return;    
}

function ResetCacheBomb()
{
    objBomb = none;
    //return;    
}

function Pawn GetBombHolderPawn()
{
    local Pawn Holder;

    // End:0x0E
    if(none == (GetCacheBomb()))
    {
        return none;
    }
    // End:0x5E
    if(GetCacheBomb().HolderPRI != none)
    {
        // End:0x5D
        foreach DynamicActors(Class'Engine.Pawn', Holder)
        {
            // End:0x5C
            if(Holder.PlayerReplicationInfo == GetCacheBomb().HolderPRI)
            {                
                return Holder;
            }            
        }        
    }
    return none;
    //return;    
}

function CheckAndDrawProgress(GameObjective Go, Canvas C)
{
    local float ProgressPct, fDeltaTime, fRatio;
    local bool bInstallingSentryGun;

    // End:0x60
    if((int(PawnOwner.19) == int(PawnOwner.TypeOfWeapon)) && int(PawnOwner.Weapon.5) == int(PawnOwner.Weapon.ClientState))
    {
        bInstallingSentryGun = true;
    }
    // End:0x13A
    if(Go.IsA(SetObjectiveClass) && PawnOwnerPRI != none)
    {
        ProgressPct = Go.GetObjectiveProgress();
        // End:0xE1
        if(wSetObjective(Go).CanPlant(PawnOwner) && false == bInstallingSentryGun)
        {
            HudPart_DisplayEvent.DrawMessageSD_BombEnable(C, MessageBombKey, MessageBombSetEnable);            
        }
        else
        {
            // End:0x12C
            if((PawnOwner != none) && wSetObjective(Go).IsPlanting(PawnOwner))
            {
                HudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone(C, MessageBombSetDoing, true, ProgressPct);                
            }
            else
            {
                ProgressPct = 0.0000000;
            }
        }        
    }
    else
    {
        // End:0x1F6
        if(Go.IsA(DiffuseObjectiveClass))
        {
            // End:0x18B
            if(wDiffuseObjective(Go).CanDefuse(PawnOwner))
            {
                HudPart_DisplayEvent.DrawMessageSD_BombEnable(C, MessageBombKey, MessageBombDiffuseEnable);                
            }
            else
            {
                // End:0x1EB
                if((PawnOwner != none) && wDiffuseObjective(Go).IsDefusing(PawnOwner))
                {
                    ProgressPct = Go.GetObjectiveProgress();
                    HudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone(C, MessageBombDiffuseDoing, true, ProgressPct);                    
                }
                else
                {
                    ProgressPct = 0.0000000;
                }
            }
        }
    }
    // End:0x2E8
    if(((Go != none) && MSGRI != none) && PawnOwnerPRI != none)
    {
        // End:0x2E8
        if(MSGRI.bObjectivePlanted && MSGRI.CurrentAttackingTeam == PawnOwnerPRI.Team.TeamIndex)
        {
            // End:0x2E8
            if((fProgressDoneTime + 2.5000000) > Level.TimeSeconds)
            {
                fDeltaTime = Level.TimeSeconds - fProgressDoneTime;
                // End:0x2B0
                if(fDeltaTime < 1.2500000)
                {
                    fRatio = 1.0000000;                    
                }
                else
                {
                    fRatio = 1.0000000 - (fDeltaTime / 2.5000000);
                }
                HudPart_DisplayEvent.DrawMessageSD_BombDoingAndDone(C, MessageBombSetDone, false, fRatio);
            }
        }
    }
    // End:0x2F5
    if(ProgressPct > float(0))
    {
    }
    //return;    
}

function DrawMiniMap(wHudPart_MinimapBase Minimap, Canvas C)
{
    local int lp1, idx, iTeamIndex;
    local SpriteWidget Sprite;
    local GameObjective Go;
    local float minimapX, minimapY, W, H;

    // End:0x72
    if((PlayerOwner.ViewTarget != none) && (int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
    {
        iTeamIndex = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamIndex = PlayerOwner.GetTeamNum();
    }
    lp1 = 0;
    J0x8E:

    // End:0x3D7 [Loop If]
    if(lp1 < obj.Length)
    {
        Go = obj[lp1];
        // End:0x3CD
        if(Go.IsActive())
        {
            idx = GetGameObjectIndex(Go);
            Sprite.WidgetTexture = none;
            // End:0x133
            if(Go.IsA(SetObjectiveClass))
            {
                // End:0x11F
                if(MSGRI.IsDefender(byte(iTeamIndex)))
                {
                    Sprite = MinimapAllyFlag[idx];                    
                }
                else
                {
                    Sprite = MinimapEnemyFlags[idx];
                }                
            }
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
                    else
                    {
                        Sprite = MinimapAllyFlag[idx];
                    }
                }
            }
            // End:0x3CD
            if(Sprite.WidgetTexture != none)
            {
                // End:0x1E6
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
                C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
                C.DrawTile(Sprite.WidgetTexture, (W / 1024.0000000) * C.ClipX, (H / 768.0000000) * C.ClipY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x8E;
    }
    DrawMinimapBomb(Minimap, C);
    //return;    
}

function DrawMinimapBomb(wHudPart_MinimapBase Minimap, Canvas C)
{
    local Vector bomLoc;
    local float W, H, minimapX, minimapY;
    local int iTeamIndex;

    // End:0x72
    if((PlayerOwner.ViewTarget != none) && (int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
    {
        iTeamIndex = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamIndex = PlayerOwner.GetTeamNum();
    }
    // End:0x34C
    if((!MSGRI.IsDefender(byte(iTeamIndex)) && !MSGRI.bMultiBomb) && !MSGRI.bObjectivePlanted)
    {
        // End:0x34C
        if(((GetCacheBomb()) != none) && (GetCacheBomb().HolderPRI == none) || PlayerOwner.PlayerReplicationInfo.HasFlag == none)
        {
            // End:0x13D
            if(GetCacheBomb().HolderPRI == none)
            {
                bomLoc = GetCacheBomb().Location;                
            }
            else
            {
                bomLoc = GetBombHolderPawn().Location;
            }
            // End:0x19A
            if(PawnOwner == none)
            {
                Minimap.CalculateMinimapPosition(PlayerOwner.Location, PlayerOwner.Rotation, bomLoc, minimapX, minimapY);                
            }
            else
            {
                Minimap.CalculateMinimapPosition(PawnOwner.Location, PawnOwner.Rotation, bomLoc, minimapX, minimapY);
            }
            Minimap.ClampMinimapPosition(minimapX, minimapY);
            W = float(MinimapBomb.WidgetTexture.MaterialUSize()) * Minimap.IconSizeF;
            H = float(MinimapBomb.WidgetTexture.MaterialVSize()) * Minimap.IconSizeF;
            C.SetPos(((minimapX - (W / float(2))) / 1024.0000000) * C.ClipX, ((minimapY - (H / float(2))) / 768.0000000) * C.ClipY);
            C.SetDrawColor(byte(255), byte(255), byte(255), byte(255));
            C.DrawTile(MinimapBomb.WidgetTexture, (W / 1024.0000000) * C.ClipX, (H / 768.0000000) * C.ClipY, 0.0000000, 0.0000000, float(MinimapBomb.WidgetTexture.MaterialUSize()), float(MinimapBomb.WidgetTexture.MaterialVSize()));
        }
    }
    //return;    
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
    if((none == Level) || none == Level.GRI)
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
    // End:0xC3
    if((PlayerOwner.ViewTarget != none) && (int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
    {
        iTeamIndex = Pawn(PlayerOwner.ViewTarget).PlayerReplicationInfo.Team.TeamIndex;        
    }
    else
    {
        iTeamIndex = PlayerOwner.GetTeamNum();
    }
    // End:0x230
    if(!MSGRI.IsDefender(byte(iTeamIndex)) && !MSGRI.bMultiBomb && !MSGRI.bObjectivePlanted)
    {
        Bomb = GetCacheBomb();
        canSeeHolder = true;
        // End:0x19E
        if(PlayerOwner.PlayerReplicationInfo.HasFlag == none)
        {
            Holder = GetBombHolderPawn();
            // End:0x19E
            if(Holder != none)
            {
                NametagPosition = CalcNametagPos(Holder);
                canSeeHolder = IsTargetInFrontOfPlayer2(C, NametagPosition, NametagScreenPos, camLoc, camRot);
            }
        }
        // End:0x1DA
        if(Bomb.HolderPRI == none)
        {
            objectLoc = Bomb.Location;
            objectLoc.Z += ObjectiveHeightOffset;            
        }
        else
        {
            objectLoc = NametagPosition;
        }
        // End:0x230
        if(bShowMissionIcon && (Bomb.HolderPRI == none) || !canSeeHolder)
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

    // End:0x432 [Loop If]
    if(i < obj.Length)
    {
        Go = obj[i];
        // End:0x428
        if(Go.IsActive())
        {
            // End:0x28E
            if(Go.IsA('wBombObjective'))
            {
                BombObjective = wBombObjective(Go);
            }
            // End:0x428
            if(true)
            {
                // End:0x2E9
                if(MSGRI != none)
                {
                    // End:0x2B7
                    if(Go.IsA('wBombObjective_Delivery'))
                    {
                        // [Explicit Continue]
                        goto J0x428;                        
                    }
                    else
                    {
                        // End:0x2E9
                        if(MSGRI.IsDefender(byte(iTeamIndex)) && Go.IsA('wBombObjective'))
                        {
                            // [Explicit Continue]
                            goto J0x428;
                        }
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
                        // End:0x35F
                        if(MSGRI.IsDefender(byte(iTeamIndex)))
                        {
                            objectSprite = ObjectiveDefend[objectIndex];                            
                        }
                        else
                        {
                            objectSprite = ObjectivePlant[objectIndex];
                        }
                        HudPart_DisplayEvent.SetBombObjectIndex(objectIndex);                        
                    }
                    else
                    {
                        // End:0x3ED
                        if(Go.IsA(DiffuseObjectiveClass))
                        {
                            // End:0x3C8
                            if(MSGRI.IsDefender(byte(iTeamIndex)))
                            {
                                objectSprite = ObjectiveDiffuse[objectIndex];                                
                            }
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
        J0x428:

        i++;
        // [Loop Continue]
        goto J0x237;
    }
    //return;    
}

defaultproperties
{
    MinimapBomb=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.minimapicon.map_bomb',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=15,Y2=15),TextureScale=0.6500000,DrawPivot=8,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    IconBomb=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Common.img_demo_pack',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=101,Y2=108),TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=1011,OffsetY=1087,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectBomb=(WidgetTexture=FinalBlend'Warfare_TH_UI_HUD_ETC.DisplayIcon.c4_bomb_fb',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectiveDefend[0]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.keep_a',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectiveDefend[1]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.keep_b',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectivePlant[0]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.explosion_a',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectivePlant[1]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.explosion_b',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectiveDiffuse[0]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.defuse_a',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectiveDiffuse[1]=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.defuse_b',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    ObjectNotification=(WidgetTexture=Texture'Warfare_TH_UI_HUD_ETC.DisplayIcon.point_1',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=63),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombKey=(WidgetTexture=Texture'Warfare_HUD.HUD.keyb_F',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=39,Y2=39),TextureScale=0.6500000,DrawPivot=0,PosX=0.3868750,PosY=0.2900000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombSetEnable=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=644,Y1=536,X2=1024,Y2=580),TextureScale=0.6500000,DrawPivot=0,PosX=0.4068750,PosY=0.2983333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombSetDoing=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=536,X2=256,Y2=580),TextureScale=0.6500000,DrawPivot=0,PosX=0.4193750,PosY=0.2833333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombSetDone=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=580,X2=256,Y2=624),TextureScale=0.6500000,DrawPivot=0,PosX=0.4200000,PosY=0.2983333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombDiffuseEnable=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=644,Y1=492,X2=1024,Y2=536),TextureScale=0.6500000,DrawPivot=0,PosX=0.4068750,PosY=0.2983333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombDiffuseDoing=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=536,X2=512,Y2=580),TextureScale=0.6500000,DrawPivot=0,PosX=0.4193750,PosY=0.2833333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageBombDiffuseDone=(WidgetTexture=Texture'Warfare_TH_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=580,X2=512,Y2=624),TextureScale=0.6500000,DrawPivot=0,PosX=0.4200000,PosY=0.2983333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SetObjectiveClass="wSetObjective"
    DiffuseObjectiveClass="wDiffuseObjective"
    BombClass=Class'WMission_Decompressed.wGameObject_Bomb'
    ObjectiveHeightOffset=20.0000000
}