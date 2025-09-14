class InfoPod extends Keypoint;

enum EIP_AssaultTeam
{
    EIP_All,                        // 0
    EIP_Attackers,                  // 1
    EIP_Defenders                   // 2
};

enum EIP_InfoType
{
    EIPT_PlainText,                 // 0
    EIPT_TextBrackets,              // 1
    EIPT_Texture                    // 2
};

enum EIP_InfoEffect
{
    EIPE_Normal,                    // 0
    EIPE_Blink,                     // 1
    EIPE_Pulse                      // 2
};

var() InfoPod.EIP_AssaultTeam Team;
var() InfoPod.EIP_InfoType InfoType;
var() InfoPod.EIP_InfoEffect InfoEffect;
var() bool bIsTriggered;
var() bool bDisabled;
var bool BACKUP_bDisabled;
var() bool bOverrideZoneCheck;
var() bool bOverrideVisibilityCheck;
var() float DrawDistThresHold;
var() Actor.ERenderStyle InfoPodDrawStyle;
var() byte DrawOpacity;
var() Material POD_Texture;
var() float TextureScale;
var() localized string POD_Message;
var() byte FontSize;

replication
{
    // Pos:0x000
    reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
        bDisabled;
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    BACKUP_bDisabled = bDisabled;
    // End:0x26
    if(!bIsTriggered)
    {
        RemoteRole = ROLE_None;
    }
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    bDisabled = !bDisabled;
    TriggerEvent(Event, self, EventInstigator);
    //return;    
}

function Reset()
{
    super(Actor).Reset();
    bDisabled = BACKUP_bDisabled;
    //return;    
}

final simulated function bool IsInfoPodVisible(Canvas C, Pawn P, Vector camLoc, Rotator camRot)
{
    local Vector TargetLocation, TargetDir;
    local float dist;

    // End:0x31
    if(!bOverrideZoneCheck && P.Region.Zone != Region.Zone)
    {
        return false;
    }
    dist = VSize(Location - camLoc);
    // End:0x65
    if((DrawDistThresHold > float(0)) && dist > DrawDistThresHold)
    {
        return false;
    }
    // End:0x76
    if(dist < CollisionRadius)
    {
        return false;
    }
    // End:0x95
    if(((Location - camLoc) Dot Vector(camRot)) < float(0))
    {
        return false;
    }
    // End:0xF4
    if(!bOverrideVisibilityCheck)
    {
        TargetDir = Location - camLoc;
        TargetDir.Z = 0.0000000;
        TargetLocation = Location - ((2.0000000 * CollisionRadius) * Vector(Rotator(TargetDir)));
        return FastTrace(Location, camLoc);
    }
    return true;
    //return;    
}

simulated function Render(Canvas C, Vector IPScreenPos, PlayerController PC)
{
    C.Style = InfoPodDrawStyle;
    switch(InfoType)
    {
        // End:0x38
        case 0:
            DrawInfoPod_PlainText(C, IPScreenPos, PC);
            // End:0x70
            break;
        // End:0x55
        case 1:
            DrawInfoPod_TextBrackets(C, IPScreenPos, PC);
            // End:0x70
            break;
        // End:0x6D
        case 2:
            DrawInfoPod_Texture(C, IPScreenPos);
            // End:0x70
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function DrawInfoPod_PlainText(Canvas C, Vector IPScreenPos, PlayerController PC)
{
    local float XL, YL;
    local string FinalString;

    FinalString = (Class'UT2k4Assault_Decompressed.HUD_Assault'.default.IP_Bracket_Open @ POD_Message) @ Class'UT2k4Assault_Decompressed.HUD_Assault'.default.IP_Bracket_Close;
    C.Font = PC.myHUD.GetFontSizeIndex(C, int(FontSize) - 8);
    C.StrLen(FinalString, XL, YL);
    // End:0xCF
    if((IPScreenPos.X + (XL * 0.5000000)) > C.ClipX)
    {
        IPScreenPos.X = C.ClipX - (XL * 0.5000000);
    }
    // End:0x121
    if((IPScreenPos.Y + (YL * 0.5000000)) > C.ClipY)
    {
        IPScreenPos.Y = C.ClipY - (YL * 0.5000000);
    }
    C.SetPos(IPScreenPos.X - (XL * 0.5000000), IPScreenPos.Y - (YL * 0.5000000));
    C.DrawText(FinalString, false);
    //return;    
}

simulated function DrawInfoPod_TextBrackets(Canvas C, Vector IPScrO, PlayerController PC)
{
    local string Description;

    C.Font = PC.myHUD.GetFontSizeIndex(C, int(FontSize) - 8);
    Description = (Class'UT2k4Assault_Decompressed.HUD_Assault'.default.IP_Bracket_Open @ POD_Message) @ Class'UT2k4Assault_Decompressed.HUD_Assault'.default.IP_Bracket_Close;
    Class'UT2k4Assault_Decompressed.HUD_Assault'.static.Draw_2DCollisionBox(C, self, IPScrO, Description, DrawScale, false);
    //return;    
}

simulated function DrawInfoPod_Texture(Canvas C, Vector IPScrO)
{
    local float W, H;

    // End:0x102
    if(POD_Texture != none)
    {
        W = ((float(POD_Texture.MaterialUSize()) * TextureScale) * float(C.SizeX)) / 640.0000000;
        H = ((float(POD_Texture.MaterialVSize()) * TextureScale) * float(C.SizeY)) / 480.0000000;
        C.SetPos(IPScrO.X - (W * 0.5000000), IPScrO.Y - (H * 0.5000000));
        C.DrawTile(POD_Texture, W, H, 0.0000000, 0.0000000, float(POD_Texture.MaterialUSize()), float(POD_Texture.MaterialVSize()));
    }
    //return;    
}

defaultproperties
{
    bIsTriggered=true
    InfoPodDrawStyle=5
    DrawOpacity=200
    TextureScale=1.0000000
    POD_Message="-= info pod =-"
    FontSize=5
    bStatic=false
    bNoDelete=true
    bStasis=true
    bReplicateMovement=false
    bOnlyDirtyReplication=true
    RemoteRole=1
}