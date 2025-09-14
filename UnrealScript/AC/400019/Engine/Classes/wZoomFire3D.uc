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
    //return;    
}

function SetAim(bool bAim)
{
    // End:0x19
    if(int(Gun.IsRechambering()) == 1)
    {
        return;
    }
    // End:0x34
    if(int(Gun.ClientState) != int(4))
    {
        return;
    }
    // End:0x75
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        return;
    }
    // End:0xA7
    if((Gun.bActioned == false) && int(Gun.AimState) == int(0))
    {
        return;
    }
    // End:0xC2
    if(int(Gun.ReloadState) != int(3))
    {
        return;
    }
    bCurrAim = bAim;
    Gun.PlayAim(bCurrAim);
    // End:0xF7
    if(bCurrAim == false)
    {
        SetFOV(false);
    }
    AutoAimCount--;
    Clamp(AutoAimCount, 0, 2);
    //return;    
}

function SetFOV(bool bFOV)
{
    super.SetFOV(bFOV);
    // End:0x24
    if(bFOV == false)
    {
        Switch3DScope(bFOV);
    }
    //return;    
}

function Switch3DScope(bool bAiming)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x78 [Loop If]
    if(i < Gun.Parts.Length)
    {
        // End:0x6E
        if(int(Gun.Parts[i].AcceType) == int(3))
        {
            Gun.Parts[i].Switch3DScope(bAiming);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function PlayFireEnd()
{
    //return;    
}

event ModeTick(float dt)
{
    // End:0x8B
    if(((int(FormerWAS) == int(1)) && int(Gun.AimState) == int(2)) || (!IsFOV && int(FormerWAS) == int(2)) && int(Gun.AimState) == int(2))
    {
        fBlendCurr = fBlendTime;
        fLastBlend = Level.TimeSeconds;
        SetFOV(true);
    }
    FormerWAS = Gun.AimState;
    //return;    
}

simulated function bool RenderOverlays(Canvas Canv)
{
    // End:0x2B
    if(Gun.IsAiming() == true)
    {
        Gun.ForceRenderOverlays(Canv);
        return true;
    }
    return false;
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.DrawText((("  FIREMODE :" $ string(self)) $ "/ IsAiming :") $ string(Gun.IsAiming()));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

defaultproperties
{
    fBlendTime=0.1000000
    bInstantFOV=true
}