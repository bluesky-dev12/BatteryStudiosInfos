/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wZoomFire3D.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:8
 *
 *******************************************************************************/
class wZoomFire3D extends wAimFire;

var string szTexZoomName;
var Texture TexZoom;
var wGun Gun;
var float fBlendTime;
var float fBlendCurr;
var float fLastBlend;
var wGun.EWeaponAimState FormerWAS;

simulated function PostBeginPlay()
{
    Gun = wGun(Weapon);
}

function SetAim(bool bAim)
{
    // End:0x19
    if(Gun.IsRechambering() == 1)
    {
        return;
    }
    // End:0x34
    if(Gun.ClientState != 4)
    {
        return;
    }
    // End:0x75
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        return;
    }
    // End:0xa7
    if(Gun.bActioned == false && Gun.AimState == 0)
    {
        return;
    }
    // End:0xc2
    if(Gun.ReloadState != 3)
    {
        return;
    }
    bCurrAim = bAim;
    Gun.PlayAim(bCurrAim);
    // End:0xf7
    if(bCurrAim == false)
    {
        SetFOV(false);
    }
    -- AutoAimCount;
    Clamp(AutoAimCount, 0, 2);
}

function SetFOV(bool bFOV)
{
    super.SetFOV(bFOV);
    // End:0x24
    if(bFOV == false)
    {
        Switch3DScope(bFOV);
    }
}

function Switch3DScope(bool bAiming)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x78 [While If]
    if(i < Gun.Parts.Length)
    {
        // End:0x6e
        if(Gun.Parts[i].AcceType == 3)
        {
            Gun.Parts[i].Switch3DScope(bAiming);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function PlayFireEnd();
event ModeTick(float dt)
{
    // End:0x51
    if(FormerWAS == 1 && Gun.AimState == 2)
    {
        fBlendCurr = fBlendTime;
        fLastBlend = Level.TimeSeconds;
        SetFOV(true);
    }
    FormerWAS = Gun.AimState;
}

simulated function bool RenderOverlays(Canvas Canv)
{
    // End:0x2b
    if(Gun.IsAiming() == true)
    {
        Gun.ForceRenderOverlays(Canv);
        return true;
    }
    return false;
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.DrawText("  FIREMODE :" $ string(self) $ "/ IsAiming :" $ string(Gun.IsAiming()));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

defaultproperties
{
    fBlendTime=0.10
    bInstantFOV=true
}