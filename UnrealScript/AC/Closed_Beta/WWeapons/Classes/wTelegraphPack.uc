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

simulated function bool CheckTryToDrive()
{
    return int(ClientState) == int(1);
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
        PlayerController(Instigator.Controller).myHUD.ChangeWeaponSlot6Hud(none);
    }
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0xDE
    if((Anim == SelectAnim) || Anim == SelectNewAnim)
    {
        // End:0x59
        if(Pawn(Owner).Weapon != self)
        {
            ClientState = 1;
            return;
        }
        ClientState = 4;
        // End:0x8F
        if((bQuickDropAnim == true) && HasAnim(PutdownQuickAnim))
        {
            PlayAnim(PutdownQuickAnim, PutDownAnimRate, 0.0000000);            
        }
        else
        {
            // End:0xAC
            if(HasAnim(PutDownAnim))
            {
                PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
            }
        }
        // End:0xD5
        if(bUsed == false)
        {
            // End:0xD2
            if((UseWeapon()) == true)
            {
                bUsed = true;
                UsedWeapon();
            }            
        }
        else
        {
            ChangePrevWeapon();
        }        
    }
    else
    {
        // End:0x135
        if((Anim == PutDownAnim) || Anim == PutdownQuickAnim)
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
