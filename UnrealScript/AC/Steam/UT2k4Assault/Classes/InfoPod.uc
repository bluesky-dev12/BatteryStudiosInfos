/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\InfoPod.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:3
 *	Properties:15
 *	Functions:8
 *
 *******************************************************************************/
class InfoPod extends Keypoint;

enum EIP_AssaultTeam
{
    EIP_All,
    EIP_Attackers,
    EIP_Defenders
};

enum EIP_InfoType
{
    EIPT_PlainText,
    EIPT_TextBrackets,
    EIPT_Texture
};

enum EIP_InfoEffect
{
    EIPE_Normal,
    EIPE_Blink,
    EIPE_Pulse
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
var() Engine.Actor.ERenderStyle InfoPodDrawStyle;
var() byte DrawOpacity;
var() Material POD_Texture;
var() float TextureScale;
var() localized string POD_Message;
var() byte FontSize;

replication
{
    // Pos:0x00
    reliable if(Role == 4 && bNetDirty)
        bDisabled;

}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    BACKUP_bDisabled = bDisabled;
    // End:0x26
    if(!bIsTriggered)
    {
        RemoteRole = 0;
    }
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    bDisabled = !bDisabled;
    TriggerEvent(Event, self, EventInstigator);
}

function Reset()
{
    super(Actor).Reset();
    bDisabled = BACKUP_bDisabled;
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
    if(DrawDistThresHold > float(0) && dist > DrawDistThresHold)
    {
        return false;
    }
    // End:0x76
    if(dist < CollisionRadius)
    {
        return false;
    }
    // End:0x95
    if(Location - camLoc Dot vector(camRot) < float(0))
    {
        return false;
    }
    // End:0xf4
    if(!bOverrideVisibilityCheck)
    {
        TargetDir = Location - camLoc;
        TargetDir.Z = 0.0;
        TargetLocation = Location - 2.0 * CollisionRadius * vector(rotator(TargetDir));
        return FastTrace(Location, camLoc);
    }
    return true;
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
        // End:0x6d
        case 2:
            DrawInfoPod_Texture(C, IPScreenPos);
            // End:0x70
            break;
        // End:0xffff
        default:
}

simulated function DrawInfoPod_PlainText(Canvas C, Vector IPScreenPos, PlayerController PC)
{
    local float XL, YL;
    local string FinalString;

    FinalString = class'HUD_Assault'.default.IP_Bracket_Open @ POD_Message @ class'HUD_Assault'.default.IP_Bracket_Close;
    C.Font = PC.myHUD.GetFontSizeIndex(C, FontSize - 8);
    C.StrLen(FinalString, XL, YL);
    // End:0xcf
    if(IPScreenPos.X + XL * 0.50 > C.ClipX)
    {
        IPScreenPos.X = C.ClipX - XL * 0.50;
    }
    // End:0x121
    if(IPScreenPos.Y + YL * 0.50 > C.ClipY)
    {
        IPScreenPos.Y = C.ClipY - YL * 0.50;
    }
    C.SetPos(IPScreenPos.X - XL * 0.50, IPScreenPos.Y - YL * 0.50);
    C.DrawText(FinalString, false);
}

simulated function DrawInfoPod_TextBrackets(Canvas C, Vector IPScrO, PlayerController PC)
{
    local string Description;

    C.Font = PC.myHUD.GetFontSizeIndex(C, FontSize - 8);
    Description = class'HUD_Assault'.default.IP_Bracket_Open @ POD_Message @ class'HUD_Assault'.default.IP_Bracket_Close;
    class'HUD_Assault'.static.Draw_2DCollisionBox(C, self, IPScrO, Description, DrawScale, false);
}

simulated function DrawInfoPod_Texture(Canvas C, Vector IPScrO)
{
    local float W, H;

    // End:0x102
    if(POD_Texture != none)
    {
        W = float(POD_Texture.MaterialUSize()) * TextureScale * float(C.SizeX) / 640.0;
        H = float(POD_Texture.MaterialVSize()) * TextureScale * float(C.SizeY) / 480.0;
        C.SetPos(IPScrO.X - W * 0.50, IPScrO.Y - H * 0.50);
        C.DrawTile(POD_Texture, W, H, 0.0, 0.0, float(POD_Texture.MaterialUSize()), float(POD_Texture.MaterialVSize()));
    }
}

defaultproperties
{
    bIsTriggered=true
    InfoPodDrawStyle=5
    DrawOpacity=200
    TextureScale=1.0
    POD_Message="-= info pod =-"
    FontSize=5
    bStatic=true
    bNoDelete=true
    bStasis=true
    bReplicateMovement=true
    bOnlyDirtyReplication=true
    RemoteRole=1
}