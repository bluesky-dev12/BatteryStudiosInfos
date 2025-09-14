class wZoomFire3D extends wAimFire;

var string szTexZoomName;
var Texture TexZoom;
var wGun G;
var float fBlendTime;
var float fBlendCurr;
var float fLastBlend;
var wGun.EWeaponAimState FormerWAS;

simulated function PostBeginPlay()
{
    G = wGun(Weapon);
    //return;    
}

function SetAim(bool bAim)
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x2B
    if(int(G.ClientState) != int(4))
    {
        return;
    }
    // End:0x6C
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        return;
    }
    // End:0x9E
    if((G.bActioned == false) && int(G.AimState) == int(0))
    {
        return;
    }
    // End:0xB9
    if(int(G.ReloadState) != int(3))
    {
        return;
    }
    // End:0xDF
    if((int(G.IsRechambering()) > 0) && !bCurrAim)
    {
        return;
    }
    bCurrAim = bAim;
    G.PlayAim(bCurrAim);
    // End:0x114
    if(bCurrAim == false)
    {
        SetFOV(false);
    }
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
    local wGun G;
    local int i;

    G = wGun(Weapon);
    i = 0;
    J0x17:

    // End:0x88 [Loop If]
    if(i < G.Parts.Length)
    {
        // End:0x7E
        if(int(G.Parts[i].AcceType) == int(3))
        {
            G.Parts[i].Switch3DScope(bAiming);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function PlayFireEnd()
{
    //return;    
}

event ModeTick(float dt)
{
    // End:0x51
    if((int(FormerWAS) == int(1)) && int(G.AimState) == int(2))
    {
        fBlendCurr = fBlendTime;
        fLastBlend = Level.TimeSeconds;
        SetFOV(true);
    }
    FormerWAS = G.AimState;
    //return;    
}

simulated function bool RenderOverlays(Canvas Canv)
{
    // End:0x2B
    if(G.IsAiming() == true)
    {
        G.ForceRenderOverlays(Canv);
        return true;
    }
    return false;
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.DrawText((("  FIREMODE :" $ string(self)) $ "/ IsAiming :") $ string(G.IsAiming()));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

defaultproperties
{
    fBlendTime=0.1000000
    bInstantFOV=true
}