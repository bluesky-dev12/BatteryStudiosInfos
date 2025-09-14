class wTelegraphPack extends wWeapon;

var byte byType;
var bool bUsed;
var name m_naAnim_Plant;
var name m_naAnim_StopPlant;

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

    // End:0x18
    if(IsA('wTelegraphPack_Install'))
    {
        super.AnimEnd(Channel);
        return;
    }
    GetAnimParams(0, Anim, frame, Rate);
    // End:0xED
    if((Anim == SelectAnim) || Anim == SelectNewAnim)
    {
        // End:0x71
        if(Pawn(Owner).Weapon != self)
        {
            ClientState = 1;
            return;
        }
        ClientState = 4;
        // End:0xA7
        if((bQuickDropAnim == true) && HasAnim(PutdownQuickAnim))
        {
            PlayAnim(PutdownQuickAnim, PutDownAnimRate, 0.0000000);            
        }
        else
        {
            // End:0xC4
            if(HasAnim(PutDownAnim))
            {
                PlayAnim(PutDownAnim, PutDownAnimRate, 0.0000000);
            }
        }
        // End:0xE4
        if(bUsed == false)
        {
            // End:0xE1
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
        // End:0x13B
        if((Anim == PutDownAnim) || Anim == PutdownQuickAnim)
        {
            // End:0x126
            if(bUsed == false)
            {
                bUsed = UseWeapon();
            }
            ChangePrevWeapon();
            // End:0x13B
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
