/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wAimFire.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:10
 *
 *******************************************************************************/
class wAimFire extends wWeaponFire;

var float fZoomFOV;
var transient bool bCurrAim;
var bool bInstantFOV;

function PlayFiring();
function FlashMuzzleFlash();
function StartMuzzleSmoke();
simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    fZoomFOV = BaseParams.fZoomFOV;
}

simulated function bool RenderOverlays(Canvas Canv)
{
    return false;
}

function ShakeView();
function SetAim(bool bAim)
{
    local wGun G;

    G = wGun(Weapon);
    // End:0x2b
    if(G.ClientState != 4)
    {
        return;
    }
    // End:0x6c
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        return;
    }
    // End:0x9e
    if(G.bActioned == false && G.AimState == 0)
    {
        return;
    }
    // End:0xb9
    if(G.ReloadState != 3)
    {
        return;
    }
    bCurrAim = bAim;
    G.PlayAim(bCurrAim);
    SetFOV(bAim);
}

function SetFOV(bool bFOV)
{
    local wGun G;
    local name szAnim;
    local float fFrame, fRate;

    G = wGun(Weapon);
    // End:0x3f
    if(bFOV)
    {
        Instigator.Controller.ZoomFOV(fZoomFOV, bInstantFOV);
    }
    // End:0x110
    else
    {
        Instigator.Controller.ZoomFOV(0.0, bInstantFOV);
        // End:0x108
        if(G.AimState != 0)
        {
            G.GetAnimParams(0, szAnim, fFrame, fRate);
            // End:0xce
            if(szAnim == 'Ads_Down' || szAnim == 'Ads_Down01')
            {
                G.AimState = 3;
            }
            // End:0xdf
            else
            {
                G.AimState = 0;
            }
            // End:0x108
            if(G.Role < 4)
            {
                G.ServerAim(false);
            }
        }
        bCurrAim = false;
    }
}

function PlayFireEnd()
{
    // End:0x23
    if(Weapon.Mesh != none)
    {
        Weapon.PlayIdle();
    }
}

event ModeDoFire()
{
    // End:0x46
    if(Weapon != none && Weapon.FireMode[2] != none && Weapon.FireMode[2].bIsFiring)
    {
        return;
    }
    SetAim(!bCurrAim);
}

defaultproperties
{
    bWaitForRelease=true
    FireRate=0.0
}