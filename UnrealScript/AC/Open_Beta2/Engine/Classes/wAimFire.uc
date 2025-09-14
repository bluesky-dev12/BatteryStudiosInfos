class wAimFire extends wWeaponFire;

var float fZoomFOV;
var transient bool bCurrAim;
var bool bInstantFOV;
var bool IsFOV;

function PlayFiring()
{
    //return;    
}

function FlashMuzzleFlash()
{
    //return;    
}

function StartMuzzleSmoke()
{
    //return;    
}

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    fZoomFOV = BaseParams.fZoomFOV;
    //return;    
}

simulated function bool RenderOverlays(Canvas Canv)
{
    return false;
    //return;    
}

function ShakeView()
{
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
    bCurrAim = bAim;
    G.PlayAim(bCurrAim);
    SetFOV(bAim);
    //return;    
}

function SetFOV(bool bFOV)
{
    local wGun G;
    local name szAnim;
    local float fFrame, fRate;

    G = wGun(Weapon);
    IsFOV = bFOV;
    // End:0x4C
    if(bFOV)
    {
        Instigator.Controller.ZoomFOV(fZoomFOV, bInstantFOV);        
    }
    else
    {
        Instigator.Controller.ZoomFOV(0.0000000, bInstantFOV);
        // End:0x115
        if(int(G.AimState) != int(0))
        {
            G.GetAnimParams(0, szAnim, fFrame, fRate);
            // End:0xDB
            if((szAnim == 'Ads_Down') || szAnim == 'Ads_Down01')
            {
                G.AimState = 3;                
            }
            else
            {
                G.AimState = 0;
            }
            // End:0x115
            if(int(G.Role) < int(ROLE_Authority))
            {
                G.ServerAim(false);
            }
        }
        bCurrAim = false;
    }
    //return;    
}

function PlayFireEnd()
{
    // End:0x23
    if(Weapon.Mesh != none)
    {
        Weapon.PlayIdle();
    }
    //return;    
}

event ModeDoFire()
{
    // End:0x46
    if(((Weapon != none) && Weapon.FireMode[2] != none) && Weapon.FireMode[2].bIsFiring)
    {
        return;
    }
    SetAim(!bCurrAim);
    //return;    
}

defaultproperties
{
    bWaitForRelease=true
    FireRate=0.0000000
}