/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wFlameThrower.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class wFlameThrower extends wWeapon;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
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
}

simulated function Vector GetEffectStart()
{
    // End:0x3f
    if(FireMode[0] != none && FireMode[0].FlashEmitter != none)
    {
        return FireMode[0].FlashEmitter.Location;
    }
}

simulated event WeaponTick(float dt)
{
    local name szAnim;
    local float fFrame, fRate;
    local wWeapon wPending;

    super.WeaponTick(dt);
    // End:0x180
    if(Instigator.IsLocallyControlled() && AmmoCharge[0] <= 0)
    {
        GetAnimParams(0, szAnim, fFrame, fRate);
        // End:0x180
        if(szAnim != 'Ads_Fire')
        {
            // End:0x9a
            if(OldWeapon != none && OldWeapon.InventoryGroup > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0xb3
            if(OldWeapon != none)
            {
                wPending = OldWeapon;
            }
            // End:0x136
            else
            {
                // End:0x111
                if(Level.GetMatchMaker().10 == Level.GetMatchMaker().eWeaponLimit)
                {
                    wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(3);
                }
                // End:0x136
                else
                {
                    wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
                }
            }
            // End:0x166
            if(wPending == none)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            Instigator.PendingWeapon = wPending;
            PutDown();
        }
    }
}

simulated function bool IsCanUseWeapon()
{
    return AmmoCharge[0] > 0;
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
    // End:0x4b
    if(Anim == PutDownAnim || Anim == PutdownQuickAnim && AmmoCharge[0] <= 0)
    {
        ServerDestroy();
    }
    super.AnimEnd(Channel);
}

defaultproperties
{
    szWeaponAttachmentName="WWeapons.wGunAttachment"
    szFireModeClass="WWeapons.wFlameFire"
}