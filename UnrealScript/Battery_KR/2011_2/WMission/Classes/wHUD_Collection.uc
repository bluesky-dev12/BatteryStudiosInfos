class wHUD_Collection extends wHUD_Mission
    transient
    config(User);

enum ERegionName
{
    EREGION_A,                      // 0
    EREGION_B,                      // 1
    EREGION_C,                      // 2
    EREGION_COUNT                   // 3
};

var() array<SpriteWidget> DomObjectCaptureAF;
var() array<SpriteWidget> DomObjectCaptureLAG;
var() array<SpriteWidget> DomObjectCaptureRSA;
var() array<SpriteWidget> DomObjectCaptureNon;
var() array<SpriteWidget> DomObjectDefend;
var() float DomObjectHeightOffset;
var() SpriteWidget WGameMode[3];
var int ACapture[3];
var int TCapture[3];
var bool ChangeCapture;
var int UpdateOBJCount;
var() DigitSet MessageRegion;
var() NumericWidget MessageRegionName;
var() SpriteWidget MessageDomiCaptureDoing;
var() SpriteWidget MessageDomiCaptureDone;

simulated event PostRender(Canvas Canvas)
{
    super(HUD).PostRender(Canvas);
    UpdateOBJCount--;
    // End:0x2E
    if(UpdateOBJCount <= 0)
    {
        UpdateOBJCount = default.UpdateOBJCount;
        UpdateOBJ();
    }
    //return;    
}

simulated function UpdateOBJ()
{
    local wCOLFlagObjective Go;

    obj.Length = 0;
    // End:0x2B
    foreach DynamicActors(Class'WMission_Decompressed.wCOLFlagObjective', Go)
    {
        obj[obj.Length] = Go;        
    }    
    //return;    
}

function DrawMinimap(wHudPart_MinimapBase Minimap, Canvas C)
{
    local int lp1, idx;
    local SpriteWidget Sprite;
    local wCOLFlagObjective flag;
    local GameObjective Go;
    local float minimapX, minimapY, W, H;

    lp1 = 0;
    J0x07:

    // End:0x321 [Loop If]
    if(lp1 < obj.Length)
    {
        Go = obj[lp1];
        // End:0x317
        if(Go.IsA('wCOLFlagObjective') && Go.IsActive())
        {
            flag = wCOLFlagObjective(Go);
            idx = Class'WMission_Decompressed.wHUD_Mission'.static.GetGameObjectIndex(flag);
            // End:0xC1
            if(flag.iActiveTeam == PlayerOwner.PlayerReplicationInfo.Team.TeamIndex)
            {
                Sprite = MinimapAllyFlag[idx];                
            }
            else
            {
                // End:0xED
                if(flag.iActiveTeam == -1)
                {
                    Sprite = MinimapNoncapturedFlag[idx];                    
                }
                else
                {
                    Sprite = MinimapEnemyFlags[idx];
                }
            }
            // End:0x14F
            if(PawnOwner == none)
            {
                Minimap.CalculateMinimapPosition(PlayerOwner.Location, PlayerOwner.Rotation, flag.Location, minimapX, minimapY);                
            }
            else
            {
                Minimap.CalculateMinimapPosition(PawnOwner.Location, PawnOwner.Rotation, flag.Location, minimapX, minimapY);
            }
            Minimap.ClampMinimapPosition(minimapX, minimapY);
            Minimap.SetupMinimapSpriteWidgetForDrawing(Sprite, flag.Rotation, minimapX, minimapY);
            W = float(Sprite.WidgetTexture.MaterialUSize()) * Minimap.IconSizeF;
            H = float(Sprite.WidgetTexture.MaterialVSize()) * Minimap.IconSizeF;
            C.SetPos(((minimapX - (W / float(2))) / 1024.0000000) * C.ClipX, ((minimapY - (H / float(2))) / 768.0000000) * C.ClipY);
            C.DrawTile(Sprite.WidgetTexture, (W / 1024.0000000) * C.ClipX, (H / 768.0000000) * C.ClipY, 0.0000000, 0.0000000, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        }
        lp1++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

simulated function DrawDominationFlagObjective(Canvas C, wCOLFlagObjective Go, Vector ScreenPos, Rotator camRot)
{
    local wCOLFlagObjective TGO, InGO;
    local bool bDraw;
    local float fDeltaTime, fRatio;

    bDraw = false;
    // End:0xBD
    if((PawnOwner != none) && PawnOwnerPRI != none)
    {
        // End:0xBC
        foreach PawnOwner.TouchingActors(Class'WMission_Decompressed.wCOLFlagObjective', TGO)
        {
            // End:0xBB
            if(TGO == Go)
            {
                // End:0xB0
                if(Go.iActiveTeam != PawnOwnerPRI.Team.TeamIndex)
                {
                    Go.CheckObjectiveProgress(PawnOwnerPRI.Team.TeamIndex);
                    CheckAndDrawProgress(Go, C);
                    bDraw = true;
                }
                InGO = TGO;
            }            
        }        
    }
    // End:0xD8
    if(bDraw == false)
    {
        Go.GetObjectiveProgress();
    }
    // End:0x1F0
    if(InGO != none)
    {
        // End:0x1F0
        if((Go.iActiveTeam == PawnOwnerPRI.Team.TeamIndex) && (Go.fActiveStartTime + 2.5000000) > Level.TimeSeconds)
        {
            fDeltaTime = Level.TimeSeconds - Go.fActiveStartTime;
            // End:0x178
            if(fDeltaTime < 1.2500000)
            {
                fRatio = 1.0000000;                
            }
            else
            {
                fRatio = 1.0000000 - (fDeltaTime / 2.5000000);
            }
            MessageRegionName.OffsetX = 687;
            MessageRegionName.OffsetY = 359;
            MessageRegionName.Value = GetGameObjectIndex(Go);
            HudPart_DisplayEvent.DrawMessageDomi_Capture(C, MessageRegion, MessageRegionName, MessageDomiCaptureDone, false, fRatio);
        }
    }
    //return;    
}

simulated function CheckAndDrawProgress(GameObjective Go, Canvas C)
{
    local float ProgressPct;

    // End:0x9F
    if(Go.IsA('wCOLFlagObjective'))
    {
        ProgressPct = Go.GetObjectiveProgress();
        // End:0x9F
        if(ProgressPct > float(0))
        {
            MessageRegionName.Value = GetGameObjectIndex(Go);
            MessageRegionName.OffsetX = default.MessageRegionName.OffsetX;
            MessageRegionName.OffsetY = default.MessageRegionName.OffsetY;
            HudPart_DisplayEvent.DrawMessageDomi_Capture(C, MessageRegion, MessageRegionName, MessageDomiCaptureDoing, true, ProgressPct);
        }
    }
    //return;    
}

function SetGameMode()
{
    switch(ACapture[2])
    {
        // End:0x21
        case 0:
            WGameMode[0] = MinimapNoncapturedFlag[2];
            // End:0x53
            break;
        // End:0x38
        case 1:
            WGameMode[0] = MinimapAllyFlag[2];
            // End:0x53
            break;
        // End:0x50
        case 2:
            WGameMode[0] = MinimapEnemyFlags[2];
            // End:0x53
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(ACapture[1])
    {
        // End:0x72
        case 0:
            WGameMode[1] = MinimapNoncapturedFlag[1];
            // End:0xA2
            break;
        // End:0x88
        case 1:
            WGameMode[1] = MinimapAllyFlag[1];
            // End:0xA2
            break;
        // End:0x9F
        case 2:
            WGameMode[1] = MinimapEnemyFlags[1];
            // End:0xA2
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(ACapture[0])
    {
        // End:0xC2
        case 0:
            WGameMode[2] = MinimapNoncapturedFlag[0];
            // End:0xF4
            break;
        // End:0xD9
        case 1:
            WGameMode[2] = MinimapAllyFlag[0];
            // End:0xF4
            break;
        // End:0xF1
        case 2:
            WGameMode[2] = MinimapEnemyFlags[0];
            // End:0xF4
            break;
        // End:0xFFFF
        default:
            break;
    }
    TCapture[0] = ACapture[0];
    TCapture[1] = ACapture[1];
    TCapture[2] = ACapture[2];
    HudPart_DisplayEvent.SetMessageGameMode_DOM(WGameMode[2].WidgetTexture, WGameMode[1].WidgetTexture, WGameMode[0].WidgetTexture);
    //return;    
}

simulated function DrawObjectives(Canvas C)
{
    local int i;
    local GameObjective Go;
    local Vector ScreenPos, camLoc;
    local Rotator camRot;
    local SpriteWidget objectSprite;
    local int objectIndex;
    local Vector objectLoc;

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
    i = 0;
    J0x58:

    // End:0x284 [Loop If]
    if(i < obj.Length)
    {
        Go = obj[i];
        // End:0x27A
        if(Go.IsActive())
        {
            // End:0x27A
            if(PawnOwner != none)
            {
                // End:0x10D
                if(Go.IsA('wCOLFlagObjective'))
                {
                    C.DrawColor = GetObjectiveColor(Go);
                    C.Style = 5;
                    C.GetCameraLocation(camLoc, camRot);
                    DrawDominationFlagObjective(C, wCOLFlagObjective(Go), ScreenPos, camRot);
                }
                objectSprite.WidgetTexture = none;
                objectIndex = GetGameObjectIndex(Go);
                objectLoc = Go.Location;
                // End:0x250
                if(Go.IsA('wCOLFlagObjective'))
                {
                    objectLoc.Z += DomObjectHeightOffset;
                    // End:0x1B1
                    if(wCOLFlagObjective(Go).iActiveTeam == PlayerOwner.GetTeamNum())
                    {
                        objectSprite = DomObjectDefend[GetGameObjectIndex(Go)];
                        ACapture[objectIndex] = 1;                        
                    }
                    else
                    {
                        switch(wCOLFlagObjective(Go).iActiveTeam)
                        {
                            // End:0x1F5
                            case -1:
                                objectSprite = DomObjectCaptureNon[GetGameObjectIndex(Go)];
                                ACapture[objectIndex] = 0;
                                // End:0x250
                                break;
                            // End:0x221
                            case 0:
                                objectSprite = DomObjectCaptureAF[GetGameObjectIndex(Go)];
                                ACapture[objectIndex] = 2;
                                // End:0x250
                                break;
                            // End:0x24D
                            case 1:
                                objectSprite = DomObjectCaptureLAG[GetGameObjectIndex(Go)];
                                ACapture[objectIndex] = 2;
                                // End:0x250
                                break;
                            // End:0xFFFF
                            default:
                                break;
                        }
                    }
                }
                else
                {
                    // End:0x27A
                    if(objectSprite.WidgetTexture != none)
                    {
                        DrawObjectSprite(C, Go, objectSprite, objectLoc);
                    }
                }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x250! */
            }
            i++;
            // [Loop Continue]
            goto J0x58;
        }/* !MISMATCHING REMOVE, tried Loop got Type:If Position:0x079! */
        // End:0x2C9
        if(((TCapture[0] != ACapture[0]) || TCapture[1] != ACapture[1]) || TCapture[2] != ACapture[2])
        {
            SetGameMode();
        }
        //return;        
    }/* !MISMATCHING REMOVE, tried Else got Type:Loop Position:0x058! */
}

function DrawDebug2(Canvas C, int X, out int Y, int dy)
{
    local wCOLFlagObjective F;

    super(HUD).DrawDebug2(C, X, Y, dy);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x156
    foreach DynamicActors(Class'WMission_Decompressed.wCOLFlagObjective', F)
    {
        C.BtrDrawTextJustified((((("flag=" $ string(F.Name)) $ " iCapturingTeam=") $ string(F.iCapturingTeam)) $ "  fCaptureProgress=") $ string(F.fCaptureProgress), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustified("    loc=" $ string(F.Location), 0, float(X), float(Y), 640.0000000, float(Y + dy), 9);
        Y += dy;        
    }    
    //return;    
}

defaultproperties
{
    DomObjectCaptureAF[0]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_a',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureAF[1]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureAF[2]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_c',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureLAG[0]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_a',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureLAG[1]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureLAG[2]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_c',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureRSA[0]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_a',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureRSA[1]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureRSA[2]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_rsa_c',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureNon[0]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_non_a',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureNon[1]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_non_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectCaptureNon[2]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.capture_non_c',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectDefend[0]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.depend_a',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectDefend[1]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.depend_b',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectDefend[2]=(WidgetTexture=Texture'Warfare_UI_HUD_ETC.DisplayIcon.depend_c',RenderStyle=5,TextureCoords=(X1=0,Y1=0,X2=63,Y2=126),TextureScale=0.3700000,DrawPivot=5,PosX=0.0000000,PosY=0.0000000,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    DomObjectHeightOffset=280.0000000
    TCapture[0]=1
    TCapture[1]=1
    TCapture[2]=1
    UpdateOBJCount=15
    MessageRegion=(DigitTexture=Texture'Warfare_UI_HUD.Text.img_HUD_text',TextureCoords=(X1=512,Y1=492,X2=556,Y2=536),TextureCoords[1]=(X1=556,Y1=492,X2=600,Y2=536),TextureCoords[2]=(X1=600,Y1=492,X2=644,Y2=536),TextureCoords[3]=(X1=0,Y1=0,X2=0,Y2=31),TextureCoords[4]=(X1=69,Y1=0,X2=89,Y2=31),TextureCoords[5]=(X1=92,Y1=0,X2=112,Y2=31),TextureCoords[6]=(X1=115,Y1=0,X2=135,Y2=31),TextureCoords[7]=(X1=138,Y1=0,X2=158,Y2=31),TextureCoords[8]=(X1=161,Y1=0,X2=181,Y2=31),TextureCoords[9]=(X1=184,Y1=0,X2=204,Y2=31),TextureCoords[10]=(X1=230,Y1=0,X2=250,Y2=31))
    MessageRegionName=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0000000,DrawPivot=0,PosX=0.0000000,PosY=0.0000000,OffsetX=700,OffsetY=340,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    MessageDomiCaptureDoing=(WidgetTexture=Texture'Warfare_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=492,X2=512,Y2=536),TextureScale=0.6500000,DrawPivot=0,PosX=0.4193750,PosY=0.2833333,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageDomiCaptureDone=(WidgetTexture=Texture'Warfare_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=492,X2=256,Y2=536),TextureScale=0.6500000,DrawPivot=0,PosX=0.4193750,PosY=0.2991667,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0000000,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}