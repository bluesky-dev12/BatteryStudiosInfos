class wTelegraphPack extends wWeapon;

var byte byType;
var bool bUsed;
var name m_naAnim_Plant;

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
    //return;    
}

simulated function AnimEnd(int Channel)
{
    local name Anim;
    local float frame, Rate;

    GetAnimParams(0, Anim, frame, Rate);
    // End:0x46
    if(IsA('wTelegraphPack_Install'))
    {
        // End:0x39
        if(m_naAnim_Plant == Anim)
        {
            UseWeapon();            
        }
        else
        {
            super.AnimEnd(Channel);
        }
        return;
    }
    // End:0x105
    if((Anim == SelectAnim) || Anim == SelectNewAnim)
    {
        // End:0x89
        if(Pawn(Owner).Weapon != self)
        {
            ClientState = 1;
            return;
        }
        ClientState = 4;
        // End:0xBF
        if((bQuickDropAnim == true) && HasAnim(PutdownQuickAnim))
        {
            PlayAnim(PutdownQuickAnim, PutDownAnimRate, 0.0000000);            
        }
        else
        {
            // End:0xDC
            if(HasAnim(PutDownAnim))
            {
                PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
            }
        }
        // End:0xFC
        if(bUsed == false)
        {
            // End:0xF9
            if(UseWeapon())
            {
                bUsed = true;
            }            
        }
        else
        {
            ChangePrevWeapon();
        }        
    }
    else
    {
        // End:0x153
        if((Anim == PutDownAnim) || Anim == PutdownQuickAnim)
        {
            // End:0x13E
            if(bUsed == false)
            {
                bUsed = UseWeapon();
            }
            ChangePrevWeapon();
            // End:0x153
            if(bUsed)
            {
                ServerDestroy();
            }
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

simulated function bool IsCanUseWeapon()
{
    return bUsed == false;
    //return;    
}
