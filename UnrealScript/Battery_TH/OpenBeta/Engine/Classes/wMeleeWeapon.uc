class wMeleeWeapon extends wWeapon
    notplaceable;

var wWeapon MyOldWeapon;

simulated function BringUp(optional wWeapon PrevWeapon)
{
    // End:0x16
    if(PrevWeapon != none)
    {
        MyOldWeapon = PrevWeapon;
    }
    super.BringUp(PrevWeapon);
    FireMode[2].ModeDoFire();
    //return;    
}

simulated event AnimEnd(int Channel)
{
    local int Mode;
    local bool bNoWeapon;

    OldWeapon = MyOldWeapon;
    // End:0x43
    if(OldWeapon == none)
    {
        OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
        bNoWeapon = true;
    }
    // End:0x73
    if(OldWeapon == none)
    {
        OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
    }
    // End:0xA0
    if(bNoWeapon == false)
    {
        OldWeapon.ClientState = 1;
        OldWeapon.GotoState('Hidden');
    }
    MeleeState = 0;
    Instigator.SwitchToLastWeapon();
    // End:0x131
    if(bNoWeapon == false)
    {
        ClientState = 1;
        Instigator.ChangedWeapon();
        // End:0xFF
        if(Instigator.Weapon == self)
        {
            PlayIdle();
            ClientState = 4;            
        }
        else
        {
            Mode = 0;
            J0x106:

            // End:0x131 [Loop If]
            if(Mode < 3)
            {
                FireMode[Mode].DestroyEffects();
                Mode++;
                // [Loop Continue]
                goto J0x106;
            }
        }
    }
    //return;    
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    super.SetBaseParams(wBase);
    FireModeClass[0] = none;
    //return;    
}

simulated function wWeapon WeaponChange(byte f, bool bSilent)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;        
    }
    else
    {
        return Inventory.WeaponChange(f, bSilent);
    }
    //return;    
}

simulated function wWeapon PrevWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;        
    }
    else
    {
        return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
    }
    //return;    
}

simulated function wWeapon NextWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;        
    }
    else
    {
        return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
    }
    //return;    
}

simulated function wWeapon RecommendWeapon(out float rating)
{
    local wWeapon Recommended;
    local float oldRating;

    // End:0x2F
    if((Instigator == none) || Instigator.Controller == none)
    {
        rating = -2.0000000;        
    }
    else
    {
        rating = (RateSelf()) + Instigator.Controller.WeaponPreference(self);
    }
    // End:0x97
    if(Inventory != none)
    {
        Recommended = Inventory.RecommendWeapon(oldRating);
        // End:0x97
        if(Recommended != none)
        {
            rating = oldRating;
            return Recommended;
        }
    }
    return none;
    //return;    
}

simulated event WeaponTick(float dt)
{
    // End:0x23
    if(bActiveMelee && Instigator.IsLocallyControlled())
    {
        ActiveMeleeDelay();
    }
    super.WeaponTick(dt);
    //return;    
}

simulated function ActiveMeleeDelay()
{
    local name szAnim;
    local float fFrame, fRate;

    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x44
    if((szAnim == 'MeleeAttack') && fFrame >= fMeleeDelay)
    {
        ClientMeleeFire();
        bActiveMelee = false;
    }
    //return;    
}

simulated function ClientMeleeFire()
{
    Log(string(self) $ "[ClientMeleeFire ]");
    ServerMeleeFire();
    //return;    
}

function ServerMeleeFire()
{
    Log(string(self) $ "[ServerMeleeFire ]");
    // End:0x45
    if(wMeleeFire(FireMode[2]) != none)
    {
        wMeleeFire(FireMode[2]).DoFireEffect();
    }
    //return;    
}

defaultproperties
{
    szWeaponAttachmentName="WWeapons.wMeleeAttachment"
}