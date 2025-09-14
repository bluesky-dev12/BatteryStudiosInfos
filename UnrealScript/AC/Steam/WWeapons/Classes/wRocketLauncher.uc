/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wRocketLauncher.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:17
 *
 *******************************************************************************/
class wRocketLauncher extends wGun
    dependson(wRocketFire);

var wSkinShell wWarhead;
var float fWaitingTime;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
        ServerDestroy, ServerDoFire;

}

simulated function SetResParams(class<wWeaponRes_Base> wRes)
{
    super.SetResParams(wRes);
    // End:0x34
    if(ResParams.default.UseWarhead == true)
    {
        LoadWarhead(wRes.default.stProj);
    }
}

simulated function FillToInitialAmmo()
{
    super.FillToInitialAmmo();
    // End:0x18
    if(AmmoCharge_CurLoaded > 0)
    {
        AttWarhead(true);
    }
}

simulated function LoadWarhead(StaticMesh stProj)
{
    // End:0x29
    if(wWarhead != none)
    {
        DetachFromBone(wWarhead);
        wWarhead.Destroy();
        wWarhead = none;
    }
    wWarhead = Spawn(class'wSkinShell', self,,);
    wWarhead.SetDrawType(8);
    wWarhead.SetStaticMesh(stProj);
    wWarhead.SetBase(self);
    wWarhead.SetOwner(self);
    wWarhead.bHidden = true;
}

simulated function AttWarhead(bool bAttOrDtt)
{
    // End:0x24
    if(ResParams.default.UseWarhead == false || wWarhead == none)
    {
        return;
    }
    // End:0x51
    if(bAttOrDtt)
    {
        AttachToBone(wWarhead, 'Warhead');
        wWarhead.bHidden = false;
    }
    // End:0x6d
    else
    {
        DetachFromBone(wWarhead);
        wWarhead.bHidden = true;
    }
}

simulated function FireOne(int iFireMode)
{
    switch(iFireMode)
    {
        // End:0x15
        case 0:
            AttWarhead(false);
            // End:0x18
            break;
        // End:0xffff
        default:
}

simulated function bool Reload()
{
    local bool bReload;

    bReload = super.Reload();
    // End:0x24
    if(ReloadState == 1)
    {
        AttWarhead(true);
    }
    return bReload;
}

simulated function bool PutDown()
{
    // End:0x0e
    if(super.PutDown() == false)
    {
        return false;
    }
    // End:0x20
    if(AmmoCharge_CurLoaded == 0)
    {
        AttWarhead(false);
    }
    return true;
}

simulated function Destroyed()
{
    AttWarhead(false);
    // End:0x1e
    if(wWarhead != none)
    {
        wWarhead.Destroy();
    }
    super.Destroyed();
}

simulated function bool HasAmmoRocket()
{
    // End:0x1c
    if(AmmoCharge_CurLoaded <= 0 && AmmoCharge[0] <= 0)
    {
        return false;
    }
    return true;
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;
    local wMatchMaker kMM;

    super.WeaponTick(dt);
    // End:0x18a
    if(Instigator.IsLocallyControlled() && false == HasAmmoRocket())
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x18a
        if(szAnim != 'Ads_Fire' && szAnim != 'Fire')
        {
            wAimFire(FireMode[1]).SetFOV(false);
            AimState = 0;
            // End:0xc9
            if(OldWeapon != none && OldWeapon.InventoryGroup > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0xe2
            if(OldWeapon != none)
            {
                wPending = OldWeapon;
            }
            // End:0x107
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            kMM = Level.GetMatchMaker();
            // End:0x170
            if(wPending == none || kMM.eWeaponLimit == kMM.4)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            Instigator.PendingWeapon = wPending;
            PutDown();
        }
    }
}

simulated event StopFire(int Mode)
{
    super(wWeapon).StopFire(Mode);
    // End:0x43
    if(PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).bFire = 0;
    }
}

function ServerDestroy()
{
    Destroy();
}

function ServerDoFire()
{
    wRocketFire(FireMode[0]).ServerDoFire();
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x4a
    if(Anim == PutDownAnim || Anim == PutdownQuickAnim && false == HasAmmoRocket())
    {
        ServerDestroy();
    }
    super.AnimEnd(Channel);
}

simulated function bool IsRPG()
{
    // End:0x1a
    if(BaseParams.iWeaponID == 5001)
    {
        return true;
    }
    return false;
}

simulated function bool IsATR()
{
    // End:0x1a
    if(BaseParams.iWeaponID == 5011)
    {
        return true;
    }
    return false;
}

simulated function bool IsCanUseWeapon()
{
    return HasAmmoRocket() == true;
}
