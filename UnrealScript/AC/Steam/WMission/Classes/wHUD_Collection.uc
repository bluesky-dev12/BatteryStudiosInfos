/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WMission\Classes\wHUD_Collection.uc
 * Package Imports:
 *	WMission
 *	XInterface
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:15
 *	Functions:8
 *
 *******************************************************************************/
class wHUD_Collection extends wHUD_Mission
    config(User)
    transient;

enum ERegionName
{
    EREGION_A,
    EREGION_B,
    EREGION_C,
    EREGION_COUNT
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
    -- UpdateOBJCount;
    // End:0x2e
    if(UpdateOBJCount <= 0)
    {
        UpdateOBJCount = default.UpdateOBJCount;
        UpdateOBJ();
    }
}

simulated function UpdateOBJ()
{
    local wCOLFlagObjective Go;

    obj.Length = 0;
    // End:0x2b
    foreach DynamicActors(class'wCOLFlagObjective', Go)
    {
        obj[obj.Length] = Go;                
    }
}

function DrawMiniMap(wHudPart_MinimapBase Minimap, Canvas C)
{
    local int lp1, idx;
    local SpriteWidget Sprite;
    local wCOLFlagObjective flag;
    local GameObjective Go;
    local float minimapX, minimapY, W, H;

    lp1 = 0;
    J0x07:
    // End:0x321 [While If]
    if(lp1 < obj.Length)
    {
        Go = obj[lp1];
        // End:0x317
        if(Go.IsA('wCOLFlagObjective') && Go.IsActive())
        {
            flag = wCOLFlagObjective(Go);
            idx = class'wHUD_Mission'.static.GetGameObjectIndex(flag);
            // End:0xc1
            if(flag.iActiveTeam == PlayerOwner.PlayerReplicationInfo.Team.TeamIndex)
            {
                Sprite = MinimapAllyFlag[idx];
            }
            // End:0xfe
            else
            {
                // End:0xed
                if(flag.iActiveTeam == -1)
                {
                    Sprite = MinimapNoncapturedFlag[idx];
                }
                // End:0xfe
                else
                {
                    Sprite = MinimapEnemyFlags[idx];
                }
            }
            // End:0x14f
            if(PawnOwner == none)
            {
                Minimap.CalculateMinimapPosition(PlayerOwner.Location, PlayerOwner.Rotation, flag.Location, minimapX, minimapY);
            }
            // End:0x192
            else
            {
                Minimap.CalculateMinimapPosition(PawnOwner.Location, PawnOwner.Rotation, flag.Location, minimapX, minimapY);
            }
            Minimap.ClampMinimapPosition(minimapX, minimapY);
            Minimap.SetupMinimapSpriteWidgetForDrawing(Sprite, flag.Rotation, minimapX, minimapY);
            W = float(Sprite.WidgetTexture.MaterialUSize()) * Minimap.IconSizeF;
            H = float(Sprite.WidgetTexture.MaterialVSize()) * Minimap.IconSizeF;
            C.SetPos(minimapX - W / float(2) / 1024.0 * C.ClipX, minimapY - H / float(2) / 768.0 * C.ClipY);
            C.DrawTile(Sprite.WidgetTexture, W / 1024.0 * C.ClipX, H / 768.0 * C.ClipY, 0.0, 0.0, float(Sprite.WidgetTexture.MaterialUSize()), float(Sprite.WidgetTexture.MaterialVSize()));
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

simulated function DrawDominationFlagObjective(Canvas C, wCOLFlagObjective Go, Vector ScreenPos, Rotator camRot)
{
    local wCOLFlagObjective TGO, InGO;
    local bool bDraw;
    local float fDeltaTime, fRatio;

    bDraw = false;
    // End:0xbd
    if(PawnOwner != none && PawnOwnerPRI != none)
    {
        // End:0xbc
        foreach PawnOwner.TouchingActors(class'wCOLFlagObjective', TGO)
        {
            // End:0xbb
            if(TGO == Go)
            {
                // End:0xb0
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
    // End:0xd8
    if(bDraw == false)
    {
        Go.GetObjectiveProgress();
    }
    // End:0x1f0
    if(InGO != none)
    {
        // End:0x1f0
        if(Go.iActiveTeam == PawnOwnerPRI.Team.TeamIndex && Go.fActiveStartTime + 2.50 > Level.TimeSeconds)
        {
            fDeltaTime = Level.TimeSeconds - Go.fActiveStartTime;
            // End:0x178
            if(fDeltaTime < 1.250)
            {
                fRatio = 1.0;
            }
            // End:0x191
            else
            {
                fRatio = 1.0 - fDeltaTime / 2.50;
            }
            MessageRegionName.OffsetX = 687;
            MessageRegionName.OffsetY = 359;
            MessageRegionName.Value = GetGameObjectIndex(Go);
            HudPart_DisplayEvent.DrawMessageDomi_Capture(C, MessageRegion, MessageRegionName, MessageDomiCaptureDone, false, fRatio);
        }
    }
}

simulated function CheckAndDrawProgress(GameObjective Go, Canvas C)
{
    local float ProgressPct;

    // End:0x9f
    if(Go.IsA('wCOLFlagObjective'))
    {
        ProgressPct = Go.GetObjectiveProgress();
        // End:0x9f
        if(ProgressPct > float(0))
        {
            MessageRegionName.Value = GetGameObjectIndex(Go);
            MessageRegionName.OffsetX = default.MessageRegionName.OffsetX;
            MessageRegionName.OffsetY = default.MessageRegionName.OffsetY;
            HudPart_DisplayEvent.DrawMessageDomi_Capture(C, MessageRegion, MessageRegionName, MessageDomiCaptureDoing, true, ProgressPct);
        }
    }
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
        // End:0xffff
        default:
            switch(ACapture[1])
            {
                // End:0x72
                case 0:
                    WGameMode[1] = MinimapNoncapturedFlag[1];
                    // End:0xa2
                    break;
                // End:0x88
                case 1:
                    WGameMode[1] = MinimapAllyFlag[1];
                    // End:0xa2
                    break;
                // End:0x9f
                case 2:
                    WGameMode[1] = MinimapEnemyFlags[1];
                    // End:0xa2
                    break;
                // End:0xffff
                default:
                    switch(ACapture[0])
                    {
                        // End:0xc2
                        case 0:
                            WGameMode[2] = MinimapNoncapturedFlag[0];
                            // End:0xf4
                            break;
                        // End:0xd9
                        case 1:
                            WGameMode[2] = MinimapAllyFlag[0];
                            // End:0xf4
                            break;
                        // End:0xf1
                        case 2:
                            WGameMode[2] = MinimapEnemyFlags[0];
                            // End:0xf4
                            break;
                        // End:0xffff
                        default:
                            TCapture[0] = ACapture[0];
                            TCapture[1] = ACapture[1];
                            TCapture[2] = ACapture[2];
                            HudPart_DisplayEvent.SetMessageGameMode_DOM(WGameMode[2].WidgetTexture, WGameMode[1].WidgetTexture, WGameMode[0].WidgetTexture);
}

simulated function DrawObjectives(Canvas C)
{
    local int i, iTeamIndex;
    local GameObjective Go;
    local Vector ScreenPos, camLoc;
    local Rotator camRot;
    local SpriteWidget objectSprite;
    local int objectIndex;
    local Vector objectLoc;

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
    iTeamIndex = PlayerOwner.GetTeamNum();
    i = 0;
    J0x6d:
    // End:0x28f [While If]
    if(i < obj.Length)
    {
        Go = obj[i];
        // End:0x285
        if(Go.IsActive())
        {
            // End:0x285
            if(PawnOwner != none)
            {
                // End:0x122
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
                // End:0x25b
                if(Go.IsA('wCOLFlagObjective'))
                {
                    objectLoc.Z += DomObjectHeightOffset;
                    // End:0x1bc
                    if(wCOLFlagObjective(Go).iActiveTeam == iTeamIndex)
                    {
                        objectSprite = DomObjectDefend[GetGameObjectIndex(Go)];
                        ACapture[objectIndex] = 1;
                    }
                    // End:0x25b
                    else
                    {
                        switch(wCOLFlagObjective(Go).iActiveTeam)
                        {
                            // End:0x200
                            case -1:
                                objectSprite = DomObjectCaptureNon[GetGameObjectIndex(Go)];
                                ACapture[objectIndex] = 0;
                                // End:0x25b
                                break;
                            // End:0x22c
                            case 0:
                                objectSprite = DomObjectCaptureAF[GetGameObjectIndex(Go)];
                                ACapture[objectIndex] = 2;
                                // End:0x25b
                                break;
                            // End:0x258
                            case 1:
                                objectSprite = DomObjectCaptureLAG[GetGameObjectIndex(Go)];
                                ACapture[objectIndex] = 2;
                                // End:0x25b
                                break;
                            // End:0xffff
                            default:
                            }
                        }
                        // End:0x285
                        if(objectSprite.WidgetTexture != none)
                        {
                            DrawObjectSprite(C, Go, objectSprite, objectLoc);
                        }
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x6d;
            }
            // End:0x2d4
            if(TCapture[0] != ACapture[0] || TCapture[1] != ACapture[1] || TCapture[2] != ACapture[2])
            {
                SetGameMode();
            }
}

function DrawDebug2(Canvas C, int X, out int Y, int dy)
{
    local wCOLFlagObjective f;

    super(HUD).DrawDebug2(C, X, Y, dy);
    Y += dy;
    C.SetDrawColor(byte(255), byte(255), byte(255));
    // End:0x156
    foreach DynamicActors(class'wCOLFlagObjective', f)
    {
        C.BtrDrawTextJustified("flag=" $ string(f.Name) $ " iCapturingTeam=" $ string(f.iCapturingTeam) $ "  fCaptureProgress=" $ string(f.fCaptureProgress), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;
        C.BtrDrawTextJustified("    loc=" $ string(f.Location), 0, float(X), float(Y), 640.0, float(Y + dy), 9);
        Y += dy;                
    }
}

defaultproperties
{
    DomObjectCaptureAF=// Object reference not set to an instance of an object.
    
    DomObjectCaptureLAG=// Object reference not set to an instance of an object.
    
    DomObjectCaptureRSA=// Object reference not set to an instance of an object.
    
    DomObjectCaptureNon=// Object reference not set to an instance of an object.
    
    DomObjectDefend=// Object reference not set to an instance of an object.
    
    DomObjectHeightOffset=280.0
    TCapture[0]=1
    TCapture[1]=1
    TCapture[2]=1
    UpdateOBJCount=15
    MessageRegion=(DigitTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',TextureCoords=(X1=512,Y1=492,X2=556,Y2=536),TextureCoords[1]=(X1=556,Y1=492,X2=600,Y2=536),TextureCoords[2]=(X1=600,Y1=492,X2=644,Y2=536),TextureCoords[3]=(X1=0,Y1=0,X2=0,Y2=31),TextureCoords[4]=(X1=69,Y1=0,X2=89,Y2=31),TextureCoords[5]=(X1=92,Y1=0,X2=112,Y2=31),TextureCoords[6]=(X1=115,Y1=0,X2=135,Y2=31),TextureCoords[7]=(X1=138,Y1=0,X2=158,Y2=31),TextureCoords[8]=(X1=161,Y1=0,X2=181,Y2=31),TextureCoords[9]=(X1=184,Y1=0,X2=204,Y2=31),TextureCoords[10]=(X1=230,Y1=0,X2=250,Y2=31))
    MessageRegionName=(RenderStyle=5,MinDigitCount=0,TextureScale=1.0,DrawPivot=0,PosX=0.0,PosY=0.0,OffsetX=700,OffsetY=340,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255),bPadWithZeroes=0)
    MessageDomiCaptureDoing=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=256,Y1=492,X2=512,Y2=536),TextureScale=0.650,DrawPivot=0,PosX=0.4193750,PosY=0.2833330,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
    MessageDomiCaptureDone=(WidgetTexture=Texture'Warfare_GP_UI_HUD.Text.img_HUD_text',RenderStyle=5,TextureCoords=(X1=0,Y1=492,X2=256,Y2=536),TextureScale=0.650,DrawPivot=0,PosX=0.4193750,PosY=0.2991670,OffsetX=0,OffsetY=0,ScaleMode=4,Scale=1.0,Tints=(R=255,G=255,B=255,A=255),Tints[1]=(R=255,G=255,B=255,A=255))
}