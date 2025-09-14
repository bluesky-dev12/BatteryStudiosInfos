class wRocketLauncher extends wGun;

var wSkinShell wWarhead;
var float fWaitingTime;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerDestroy, ServerDoFire;
}

simulated function SetResParams(Class<wWeaponRes_Base> wRes)
{
    super.SetResParams(wRes);
    // End:0x34
    if(ResParams.default.UseWarhead == true)
    {
        LoadWarhead(wRes.default.stProj);
    }
    //return;    
}

simulated function FillToInitialAmmo()
{
    super.FillToInitialAmmo();
    // End:0x18
    if(AmmoCharge_CurLoaded > 0)
    {
        AttWarhead(true);
    }
    //return;    
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
    wWarhead = Spawn(Class'Engine.wSkinShell', self);
    wWarhead.SetDrawType(8);
    wWarhead.SetStaticMesh(stProj);
    wWarhead.SetBase(self);
    wWarhead.SetOwner(self);
    wWarhead.bHidden = true;
    //return;    
}

simulated function AttWarhead(bool bAttOrDtt)
{
    // End:0x24
    if((ResParams.default.UseWarhead == false) || wWarhead == none)
    {
        return;
    }
    // End:0x51
    if(bAttOrDtt)
    {
        AttachToBone(wWarhead, 'Warhead');
        wWarhead.bHidden = false;        
    }
    else
    {
        DetachFromBone(wWarhead);
        wWarhead.bHidden = true;
    }
    //return;    
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
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function bool Reload()
{
    local bool bReload;

    bReload = super.Reload();
    // End:0x24
    if(int(ReloadState) == int(1))
    {
        AttWarhead(true);
    }
    return bReload;
    //return;    
}

simulated function bool PutDown()
{
    // End:0x0E
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
    //return;    
}

simulated function Destroyed()
{
    AttWarhead(false);
    // End:0x1E
    if(wWarhead != none)
    {
        wWarhead.Destroy();
    }
    super.Destroyed();
    //return;    
}

simulated function bool HasAmmoRocket()
{
    // End:0x1C
    if((AmmoCharge_CurLoaded <= 0) && AmmoCharge[0] <= 0)
    {
        return false;
    }
    return true;
    //return;    
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;
    local wMatchMaker kMM;

    super.WeaponTick(dt);
    // End:0x18A
    if(Instigator.IsLocallyControlled() && false == (HasAmmoRocket()))
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x18A
        if((szAnim != 'Ads_Fire') && szAnim != 'Fire')
        {
            wAimFire(FireMode[1]).SetFOV(false);
            AimState = 0;
            // End:0xC9
            if((OldWeapon != none) && int(OldWeapon.InventoryGroup) > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0xE2
            if(OldWeapon != none)
            {
                wPending = OldWeapon;                
            }
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            kMM = Level.GetMatchMaker();
            // End:0x170
            if((wPending == none) || int(kMM.eWeaponLimit) == int(kMM.4))
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            Instigator.PendingWeapon = wPending;
            PutDown();
        }
    }
    //return;    
}

simulated event StopFire(int Mode)
{
    super(wWeapon).StopFire(Mode);
    // End:0x43
    if(PlayerController(Instigator.Controller) != none)
    {
        PlayerController(Instigator.Controller).bFire = 0;
    }
    //return;    
}

function ServerDestroy()
{
    Destroy();
    //return;    
}

function ServerDoFire()
{
    wRocketFire(FireMode[0]).ServerDoFire();
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x4A
    if(((Anim == PutDownAnim) || Anim == PutdownQuickAnim) && false == (HasAmmoRocket()))
    {
        ServerDestroy();
    }
    super.AnimEnd(Channel);
    //return;    
}

simulated function bool IsRPG()
{
    // End:0x1A
    if(BaseParams.iWeaponID == 5001)
    {
        return true;
    }
    return false;
    //return;    
}

simulated function bool IsATR()
{
    // End:0x1A
    if(BaseParams.iWeaponID == 5011)
    {
        return true;
    }
    return false;
    //return;    
}

simulated function bool IsCanUseWeapon()
{
    return (HasAmmoRocket()) == true;
    //return;    
}
