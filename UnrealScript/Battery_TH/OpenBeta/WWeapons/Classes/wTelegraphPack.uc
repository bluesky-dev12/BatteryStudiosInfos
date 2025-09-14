class wTelegraphPack extends wWeapon;

var byte byType;
var bool bUsed;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerDestroy;
}

simulated function wLoadOut(int iID, int iAddPartsID)
{
    super.wLoadOut(iID, iAddPartsID);
    //return;    
}

simulated function bool UseWeapon()
{
    //return;    
}

simulated function UsedWeapon()
{
    // End:0x3C
    if(Instigator.IsLocallyControlled() == true)
    {
        PlayerController(Instigator.Controller).myHUD.ChangeWeaponSlot5Hud(none);
    }
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local bool bUsed;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0xB4
    if((Anim == SelectAnim) || Anim == SelectNewAnim)
    {
        ClientState = 4;
        // End:0x6C
        if((bQuickDropAnim == true) && HasAnim(PutdownQuickAnim))
        {
            PlayAnim(PutdownQuickAnim, PutDownAnimRate, 0.0000000);            
        }
        else
        {
            // End:0x89
            if(HasAnim(PutDownAnim))
            {
                PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
            }
        }
        bUsed = UseWeapon();
        // End:0xAB
        if(bUsed == true)
        {
            UsedWeapon();            
        }
        else
        {
            ChangePrevWeapon();
        }        
    }
    else
    {
        // End:0xE0
        if((Anim == PutDownAnim) || Anim == PutdownQuickAnim)
        {
            ChangePrevWeapon();
            ServerDestroy();
        }
    }
    //return;    
}

simulated function ChangePrevWeapon()
{
    local wWeapon wPending;

    ClientState = 1;
    // End:0x51
    if((OldWeapon != none) && int(OldWeapon.InventoryGroup) > 10)
    {
        OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
    }
    // End:0x6A
    if(OldWeapon != none)
    {
        wPending = OldWeapon;        
    }
    else
    {
        wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
    }
    // End:0xBF
    if(wPending == none)
    {
        wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
    }
    Instigator.PendingWeapon = wPending;
    Instigator.ChangedWeapon();
    //return;    
}

function ServerDestroy()
{
    Destroy();
    //return;    
}
