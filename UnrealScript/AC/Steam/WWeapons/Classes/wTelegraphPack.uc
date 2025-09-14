/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wTelegraphPack.uc
 * Package Imports:
 *	WWeapons
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:7
 *
 *******************************************************************************/
class wTelegraphPack extends wWeapon;

var byte byType;
var bool bUsed;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
        ServerDestroy;

}

simulated function wLoadOut(int iID, int iAddPartsID)
{
    super.wLoadOut(iID, iAddPartsID);
}

simulated function bool CheckTryToDrive()
{
    return ClientState == 1;
}

simulated function bool UseWeapon();
simulated function UsedWeapon()
{
    // End:0x3c
    if(Instigator.IsLocallyControlled() == true)
    {
        PlayerController(Instigator.Controller).myHUD.ChangeWeaponSlot6Hud(none);
    }
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0xde
    if(Anim == SelectAnim || Anim == SelectNewAnim)
    {
        // End:0x59
        if(Pawn(Owner).Weapon != self)
        {
            ClientState = 1;
            return;
        }
        ClientState = 4;
        // End:0x8f
        if(bQuickDropAnim == true && HasAnim(PutdownQuickAnim))
        {
            PlayAnim(PutdownQuickAnim, PutDownAnimRate, 0.0);
        }
        // End:0xac
        else
        {
            // End:0xac
            if(HasAnim(PutDownAnim))
            {
                PlayAnim(PutDownAnim, PutDownAnimRate, 0.0);
            }
        }
        // End:0xd5
        if(bUsed == false)
        {
            // End:0xd2
            if(UseWeapon() == true)
            {
                bUsed = true;
                UsedWeapon();
            }
        }
        // End:0xdb
        else
        {
            ChangePrevWeapon();
        }
    }
    // End:0x135
    else
    {
        // End:0x135
        if(Anim == PutDownAnim || Anim == PutdownQuickAnim)
        {
            // End:0x129
            if(bUsed == false)
            {
                bUsed = UseWeapon();
                // End:0x129
                if(bUsed == true)
                {
                    UsedWeapon();
                }
            }
            ChangePrevWeapon();
            ServerDestroy();
        }
    }
}

simulated function ChangePrevWeapon()
{
    local wWeapon wPending;

    ClientState = 1;
    // End:0x51
    if(OldWeapon != none && OldWeapon.InventoryGroup > 10)
    {
        OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
    }
    // End:0x6a
    if(OldWeapon != none)
    {
        wPending = OldWeapon;
    }
    // End:0x8f
    else
    {
        wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
    }
    // End:0xbf
    if(wPending == none)
    {
        wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
    }
    Instigator.PendingWeapon = wPending;
    Instigator.ChangedWeapon();
}

function ServerDestroy()
{
    Destroy();
}
