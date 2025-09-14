/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wZoomFire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:7
 *	Functions:5
 *
 *******************************************************************************/
class wZoomFire extends wAimFire;

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
    TexZoom = Texture(DynamicLoadObject(szTexZoomName, class'Texture'));
}

function SetAim(bool bAim)
{
    // End:0x1b
    if(Gun.ClientState != 4)
    {
        return;
    }
    // End:0x5c
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        return;
    }
    // End:0x8e
    if(Gun.bActioned == false && Gun.AimState == 0)
    {
        return;
    }
    // End:0xa9
    if(Gun.ReloadState != 3)
    {
        return;
    }
    bCurrAim = bAim;
    Gun.PlayAim(bCurrAim);
    // End:0xde
    if(bCurrAim == false)
    {
        SetFOV(false);
    }
}

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

simulated function RenderScope(Canvas Canv)
{
    local float barW, barH;

    Canv.SetPos(float(Canv.SizeX) * 0.50 - float(Canv.SizeY) * 0.50, float(Canv.SizeY) * 0.50 - float(Canv.SizeY) * 0.50);
    Canv.DrawTile(TexZoom, float(Canv.SizeY), float(Canv.SizeY), 0.0, 0.0, float(TexZoom.USize), float(TexZoom.USize));
    barW = float(Canv.SizeX) * 0.50 - float(Canv.SizeY) * 0.50;
    barH = float(Canv.SizeY);
    Canv.SetPos(0.0, 0.0);
    Canv.DrawTile(texture'BlackTexture', barW, barH, 0.0, 0.0, float(texture'BlackTexture'.USize), float(texture'BlackTexture'.VSize));
    Canv.SetPos(float(Canv.SizeX) * 0.50 + float(Canv.SizeY) * 0.50, 0.0);
    Canv.DrawTile(texture'BlackTexture', barW, barH, 0.0, 0.0, float(texture'BlackTexture'.USize), float(texture'BlackTexture'.VSize));
    // End:0x30b
    if(fBlendCurr > float(0))
    {
        fBlendCurr -= Level.TimeSeconds - fLastBlend;
        fLastBlend = Level.TimeSeconds;
        // End:0x25b
        if(fBlendCurr < float(0))
        {
            fBlendCurr = 0.0;
        }
        Canv.Style = 5;
        Canv.DrawColor.A = byte(float(255) * fBlendCurr / fBlendTime);
        Canv.SetPos(0.0, 0.0);
        Canv.DrawTile(texture'BlackTexture', float(Canv.SizeX), float(Canv.SizeY), 0.0, 0.0, float(texture'BlackTexture'.USize), float(texture'BlackTexture'.VSize));
    }
}

simulated function bool RenderOverlays(Canvas Canv)
{
    switch(Gun.AimState)
    {
        // End:0x15
        case 0:
        // End:0x1a
        case 1:
        // End:0x21
        case 3:
            return false;
        // End:0x33
        case 2:
            RenderScope(Canv);
            return true;
        // End:0xffff
        default:
}

defaultproperties
{
    fBlendTime=0.10
    bInstantFOV=true
}