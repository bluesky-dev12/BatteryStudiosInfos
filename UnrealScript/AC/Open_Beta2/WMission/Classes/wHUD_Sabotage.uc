class wHUD_Sabotage extends wHUD_SD
    transient
    config(User);

var wGameObject_SBTBomb SBTBomb;
var Vector LastBombPosition;
var bool LastBombPositionRender;
var float LastBombPositionUpdateLevelTime;
var int LastBombPositionUpdateInterval;
var() SpriteWidget IconKillBombHolder;

function DrawDebugMission(Canvas C)
{
    local GameReplicationInfo GRI;
    local int Y;
    local wSBTGameInfo Game;
    local wGameObject_SBTBomb goBomb;
    local wSBTSetObjective Set;
    local wSBTDiffuseObjective Diffuse;

    GRI = PlayerOwner.GameReplicationInfo;
    MSGRI = wMSGameReplicationInfo(GRI);
    Game = wSBTGameInfo(Level.Game);
    Y = 200;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    C.BtrDrawTextJustified("bObjectivePlanted=" $ string(MSGRI.bObjectivePlanted), 0, 0.0000000, float(Y), 1024.0000000, float(Y + 14), 9);
    Y += 14;
    C.BtrDrawTextJustified((("MSGRI.CurrentAttackingTeam=" $ string(MSGRI.CurrentAttackingTeam)) $ " ObjectiveProgress=") $ string(MSGRI.ObjectiveProgress), 0, 0.0000000, float(Y), 1024.0000000, float(Y + 14), 9);
    Y += 14;
    // End:0x22D
    foreach DynamicActors(Class'WMission_Decompressed.wGameObject_SBTBomb', goBomb)
    {
        C.BtrDrawTextJustified((((((("[wGameObject_SbtBomb] Holder=" $ goBomb.HolderPRI.PlayerName) $ " bDisabled=") $ string(goBomb.bDisabled)) $ " bHidden=") $ string(goBomb.bHidden)) $ " state=") $ string(goBomb.GetStateName()), 0, 0.0000000, float(Y), 1024.0000000, float(Y + 14), 9);
        Y += 14;        
    }    
    // End:0x2EC
    foreach DynamicActors(Class'WMission_Decompressed.wSBTSetObjective', Set)
    {
        C.BtrDrawTextJustified((((("[wSbtSetObjective] strPlayerName=" $ Set.strPlayerName) $ " bActive=") $ string(Set.bActive)) $ " bDisabled=") $ string(Set.bDisabled), 0, 0.0000000, float(Y), 1024.0000000, float(Y + 14), 9);
        Y += 14;        
    }    
    // End:0x3AF
    foreach DynamicActors(Class'WMission_Decompressed.wSBTDiffuseObjective', Diffuse)
    {
        C.BtrDrawTextJustified((((("[wSbtDiffuseObjective] strPlayerName=" $ Diffuse.strPlayerName) $ " bActive=") $ string(Diffuse.bActive)) $ " bDisabled=") $ string(Diffuse.bDisabled), 0, 0.0000000, float(Y), 1024.0000000, float(Y + 14), 9);
        Y += 14;        
    }    
    // End:0x3BB
    if(Game != none)
    {
    }
    //return;    
}

simulated function DrawObjectives(Canvas C)
{
    local int i;
    local GameObjective Go;
    local Vector camLoc;
    local Rotator camRot;
    local SpriteWidget objectSprite;
    local int objectIndex;
    local Vector objectLoc;
    local bool canSeeHolder;
    local Pawn Holder;
    local Vector NametagScreenPos, NametagPosition;
    local wGameObject_SBTBomb Bomb;
    local Vector loc;

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
    Bomb = wGameObject_SBTBomb(GetCacheBomb());
    // End:0x1A9
    if((!MSGRI.bObjectivePlanted && Bomb.HolderPRI != PlayerOwner.PlayerReplicationInfo) && bShowMissionIcon)
    {
        // End:0xF1
        if(Bomb.HolderPRI == none)
        {
            loc = Bomb.Location;
            loc.Z += float(20);
            DrawObjectSprite(C, Bomb, ObjectBomb, loc);            
        }
        else
        {
            Holder = GetBombHolderPawn();
            // End:0x1A9
            if(Holder != none)
            {
                NametagPosition = CalcNametagPos(Holder);
                NametagPosition.Z += float(80);
                canSeeHolder = IsTargetInFrontOfPlayer2(C, NametagPosition, NametagScreenPos, camLoc, camRot);
                // End:0x15B
                if(canSeeHolder)
                {                    
                }
                else
                {
                    // End:0x1A9
                    if(Bomb.HolderPRI.Team.TeamIndex == PlayerOwner.GetTeamNum())
                    {
                        DrawObjectSprite(C, Bomb, IconDefendBombHolder, NametagPosition);
                    }
                }
            }
        }
    }
    i = 0;
    J0x1B0:

    // End:0x33C [Loop If]
    if(i < obj.Length)
    {
        Go = obj[i];
        // End:0x332
        if(Go.IsActive())
        {
            // End:0x332
            if(Go.IsA('wSBTSetObjective') || Go.IsA('wSBTDiffuseObjective'))
            {
                // End:0x26C
                if(Go.IsA('wSBTSetObjective'))
                {
                    // End:0x258
                    if(MSGRI.IsDefender(byte(PlayerOwner.GetTeamNum())))
                    {
                        objectSprite = ObjectiveDefend[objectIndex];                        
                    }
                    else
                    {
                        objectSprite = ObjectivePlant[objectIndex];
                    }                    
                }
                else
                {
                    // End:0x2C8
                    if(Go.IsA('wSBTDiffuseObjective'))
                    {
                        // End:0x2B7
                        if(MSGRI.IsDefender(byte(PlayerOwner.GetTeamNum())))
                        {
                            objectSprite = ObjectiveDiffuse[objectIndex];                            
                        }
                        else
                        {
                            objectSprite = ObjectiveDefend[objectIndex];
                        }
                    }
                }
                // End:0x322
                if((objectSprite.WidgetTexture != none) && bShowMissionIcon)
                {
                    objectLoc = Go.Location;
                    objectLoc.Z += float(150);
                    DrawObjectSprite(C, Go, objectSprite, objectLoc, true);
                }
                CheckAndDrawProgress(Go, C);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1B0;
    }
    // End:0x351
    if(bShowMissionIcon)
    {
        DrawEnemyC4(C, true);
    }
    //return;    
}

function DrawEnemyC4(Canvas C, bool updatePos)
{
    local int EnemyTeam;
    local Vector pos;
    local int iAlpha;
    local float fDeltaTime;

    EnemyTeam = 1 - PlayerOwner.GetTeamNum();
    // End:0x1E7
    if((MSGRI.CurrentAttackingTeam == EnemyTeam) && !MSGRI.bObjectivePlanted)
    {
        pos = wGameObject_SBTBomb(GetCacheBomb()).LastPosition;
        LastBombPositionUpdateInterval = int(wGameObject_SBTBomb(GetCacheBomb()).LastPositionUpdateInterval);
        // End:0xCB
        if((LastBombPosition != pos) || !LastBombPositionRender)
        {
            LastBombPositionUpdateLevelTime = Level.TimeSeconds + float(LastBombPositionUpdateInterval);
            LastBombPosition = pos;
            LastBombPositionRender = true;            
        }
        else
        {
            // End:0xF2
            if(Level.TimeSeconds > (LastBombPositionUpdateLevelTime + 0.1000000))
            {
                LastBombPositionRender = false;
            }
        }
        fDeltaTime = LastBombPositionUpdateLevelTime - Level.TimeSeconds;
        // End:0x144
        if(fDeltaTime > float(0))
        {
            iAlpha = int((float(255) * FClamp(fDeltaTime, 0.0000000, float(LastBombPositionUpdateInterval))) / float(LastBombPositionUpdateInterval));
        }
        IconKillBombHolder.Tints[0].A = byte(iAlpha);
        IconKillBombHolder.Tints[1].A = byte(iAlpha);
        pos.Z += float(115);
        DrawObjectSprite(C, GetCacheBomb(), IconKillBombHolder, pos);
        IconKillBombHolder.Tints[0].A = default.IconKillBombHolder.Tints[0].A;
        IconKillBombHolder.Tints[1].A = default.IconKillBombHolder.Tints[1].A;
    }
    //return;    
}

function DrawMinimapBomb(wHudPart_MinimapBase Minimap, Canvas C)
{
    local Vector bomLoc;
    local float W, H, minimapX, minimapY;
    local Color DrawColor;
    local byte Alpha;

    // End:0x346
    if(!MSGRI.bObjectivePlanted)
    {
        // End:0x346
        if(((GetCacheBomb()) != none) && (GetCacheBomb().HolderPRI == none) || PlayerOwner.PlayerReplicationInfo.HasFlag == none)
        {
            // End:0xA4
            if(GetCacheBomb().HolderPRI == none)
            {
                bomLoc = GetCacheBomb().Location;
                DrawColor = C.MakeColor(byte(255), byte(255), byte(255));                
            }
            else
            {
                // End:0xFD
                if(GetBombHolderPawn().GetTeamNum() == PlayerOwner.GetTeamNum())
                {
                    bomLoc = GetBombHolderPawn().Location;
                    DrawColor = C.MakeColor(0, byte(255), 0);                    
                }
                else
                {
                    bomLoc = wGameObject_SBTBomb(GetCacheBomb()).LastPosition;
                    Alpha = byte(255);
                    DrawColor = C.MakeColor(byte(255), 0, 0, Alpha);
                }
            }
            // End:0x18B
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
            C.DrawColor = DrawColor;
            C.DrawTile(MinimapBomb.WidgetTexture, (W / 1024.0000000) * C.ClipX, (H / 768.0000000) * C.ClipY, 0.0000000, 0.0000000, float(MinimapBomb.WidgetTexture.MaterialUSize()), float(MinimapBomb.WidgetTexture.MaterialVSize()));
            C.DrawColor = WhiteColor;
        }
    }
    //return;    
}

defaultproperties
{
    IconKillBombHolder=(WidgetTexture=Texture'Warfare_GP_UI_HUD_ETC.DisplayIcon.kill_c4',RenderStyle=5,TextureCoords=(X1=18,Y1=0,X2=110,Y2=128),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    SetObjectiveClass="wSBTSetObjective"
    DiffuseObjectiveClass="wSBTDiffuseObjective"
    BombClass=Class'WMission_Decompressed.wGameObject_SBTBomb'
}