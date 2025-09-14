/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wAirStrike.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class wAirStrike extends wGun;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
        ServerDestroy;

}

simulated event ClientStartFire(int Mode)
{
    super.ClientStartFire(Mode);
    // End:0x74
    if(Mode == 0 && Instigator.IsLocallyControlled() && Instigator.Controller.IsA('wPlayer'))
    {
        wPlayer(Instigator.Controller).SkillUsedByWeapon(BaseParams.iWeaponID);
    }
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;

    super.WeaponTick(dt);
    // End:0x161
    if(Instigator.IsLocallyControlled() && AmmoCharge_CurLoaded == 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x161
        if(szAnim == 'Ads_Fire' || szAnim == 'Fire' || szAnim == 'Idle')
        {
            wAimFire(FireMode[1]).SetFOV(false);
            AimState = 0;
            // End:0xd9
            if(OldWeapon != none && OldWeapon.InventoryGroup > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0xf2
            if(OldWeapon != none)
            {
                wPending = OldWeapon;
            }
            // End:0x117
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x147
            if(wPending == none)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            Instigator.PendingWeapon = wPending;
            PutDown();
        }
    }
}

function ServerDestroy()
{
    Destroy();
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x49
    if(Anim == PutDownAnim || Anim == PutdownQuickAnim && AmmoCharge_CurLoaded == 0)
    {
        ServerDestroy();
    }
    super.AnimEnd(Channel);
}

simulated function bool IsCanUseWeapon()
{
    return AmmoCharge_CurLoaded != 0;
}

defaultproperties
{
    szFireModeClass="WWeapons.wPinPointBombFire"
}