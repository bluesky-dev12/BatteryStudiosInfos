class wFlameThrower extends wWeapon;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerDestroy;
}

simulated event ClientStartFire(int Mode)
{
    // End:0x60
    if(Instigator.Controller.IsA('PlayerController') && PlayerController(Instigator.Controller).bSprint)
    {
        PlayerController(Instigator.Controller).bRun = 0;
        return;
    }
    super.ClientStartFire(Mode);
    //return;    
}

simulated function Vector GetEffectStart()
{
    // End:0x3F
    if((FireMode[0] != none) && FireMode[0].FlashEmitter != none)
    {
        return FireMode[0].FlashEmitter.Location;
    }
    //return;    
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;

    super.WeaponTick(dt);
    // End:0x122
    if(Instigator.IsLocallyControlled() && AmmoCharge[0] <= 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x122
        if(szAnim != 'Ads_Fire')
        {
            // End:0x9A
            if((OldWeapon != none) && int(OldWeapon.InventoryGroup) > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0xB3
            if(OldWeapon != none)
            {
                wPending = OldWeapon;                
            }
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x108
            if(wPending == none)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            Instigator.PendingWeapon = wPending;
            PutDown();
        }
    }
    //return;    
}

simulated function bool IsCanUseWeapon()
{
    return AmmoCharge[0] > 0;
    //return;    
}

function ServerDestroy()
{
    Destroy();
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x4B
    if(((Anim == PutDownAnim) || Anim == PutdownQuickAnim) && AmmoCharge[0] <= 0)
    {
        ServerDestroy();
    }
    super.AnimEnd(Channel);
    //return;    
}

defaultproperties
{
    szWeaponAttachmentName="WWeapons.wGunAttachment"
    szFireModeClass="WWeapons.wFlameFire"
}