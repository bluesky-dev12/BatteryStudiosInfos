class wAirStrike extends wGun;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerDestroy;
}

simulated event ClientStartFire(int Mode)
{
    local wAirStrikeProj kProj;

    super.ClientStartFire(Mode);
    // End:0x74
    if(((Mode == 0) && Instigator.IsLocallyControlled()) && Instigator.Controller.IsA('wPlayer'))
    {
        wPlayer(Instigator.Controller).SkillUsedByWeapon(BaseParams.iWeaponID);
    }
    //return;    
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;

    super.WeaponTick(dt);
    // End:0x150
    if(Instigator.IsLocallyControlled() && AmmoCharge_CurLoaded == 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x150
        if((szAnim != 'Ads_Fire') && szAnim != 'Fire')
        {
            wAimFire(FireMode[1]).SetFOV(false);
            AimState = 0;
            // End:0xC8
            if((OldWeapon != none) && int(OldWeapon.InventoryGroup) > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0xE1
            if(OldWeapon != none)
            {
                wPending = OldWeapon;                
            }
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x136
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
    // End:0x49
    if(((Anim == PutDownAnim) || Anim == PutdownQuickAnim) && AmmoCharge_CurLoaded == 0)
    {
        ServerDestroy();
    }
    super.AnimEnd(Channel);
    //return;    
}

simulated function bool IsCanUseWeapon()
{
    return AmmoCharge_CurLoaded != 0;
    //return;    
}

defaultproperties
{
    szFireModeClass="WWeapons.wPinPointBombFire"
}