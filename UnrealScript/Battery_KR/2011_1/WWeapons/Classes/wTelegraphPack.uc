class wTelegraphPack extends wWeapon;

var byte byType;

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
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;
    local wWeapon wPending;
    local bool bUsed;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x8C
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
    }
    else
    {
        // End:0x1B3
        if((Anim == PutDownAnim) || Anim == PutdownQuickAnim)
        {
            bUsed = UseWeapon();
            ClientState = 1;
            // End:0x10A
            if((OldWeapon != none) && int(OldWeapon.InventoryGroup) > 10)
            {
                OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x123
            if(OldWeapon != none)
            {
                wPending = OldWeapon;                
            }
            else
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
            }
            // End:0x178
            if(wPending == none)
            {
                wPending = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
            }
            Instigator.PendingWeapon = wPending;
            Instigator.ChangedWeapon();
            // End:0x1B3
            if(bUsed == true)
            {
                UsedWeapon();
                ServerDestroy();
            }
        }
    }
    //return;    
}

function ServerDestroy()
{
    Destroy();
    //return;    
}
