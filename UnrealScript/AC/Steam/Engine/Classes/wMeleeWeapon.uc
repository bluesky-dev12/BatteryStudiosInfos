/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wMeleeWeapon.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:11
 *
 *******************************************************************************/
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
    // End:0xa0
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
        // End:0xff
        if(Instigator.Weapon == self)
        {
            PlayIdle();
            ClientState = 4;
        }
        // End:0x131
        else
        {
            Mode = 0;
            J0x106:
            // End:0x131 [While If]
            if(Mode < 3)
            {
                FireMode[Mode].DestroyEffects();
                ++ Mode;
                // This is an implied JumpToken; Continue!
                goto J0x106;
            }
        }
    }
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    super.SetBaseParams(wBase);
    FireModeClass[0] = none;
}

simulated function wWeapon WeaponChange(byte f, bool bSilent)
{
    // End:0x10
    if(Inventory == none)
    {
        return none;
    }
    // End:0x2b
    else
    {
        return Inventory.WeaponChange(f, bSilent);
    }
}

simulated function wWeapon PrevWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x2e
    else
    {
        return Inventory.PrevWeapon(CurrentChoice, CurrentWeapon);
    }
}

simulated function wWeapon NextWeapon(wWeapon CurrentChoice, wWeapon CurrentWeapon)
{
    // End:0x14
    if(Inventory == none)
    {
        return CurrentChoice;
    }
    // End:0x2e
    else
    {
        return Inventory.NextWeapon(CurrentChoice, CurrentWeapon);
    }
}

simulated function wWeapon RecommendWeapon(out float rating)
{
    local wWeapon Recommended;
    local float oldRating;

    // End:0x2f
    if(Instigator == none || Instigator.Controller == none)
    {
        rating = -2.0;
    }
    // End:0x56
    else
    {
        rating = RateSelf() + Instigator.Controller.WeaponPreference(self);
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
}

simulated event WeaponTick(float dt)
{
    // End:0x23
    if(bActiveMelee && Instigator.IsLocallyControlled())
    {
        ActiveMeleeDelay();
    }
    super.WeaponTick(dt);
}

simulated function ActiveMeleeDelay()
{
    local name szAnim;
    local float fFrame, fRate;

    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x44
    if(szAnim == 'MeleeAttack' && fFrame >= fMeleeDelay)
    {
        ClientMeleeFire();
        bActiveMelee = false;
    }
}

simulated function ClientMeleeFire()
{
    Log(string(self) $ "[ClientMeleeFire ]");
    ServerMeleeFire();
    // End:0x50
    if(wMeleeFire(FireMode[2]) != none)
    {
        // End:0x50
        if(MyOldWeapon != none)
        {
            MyOldWeapon.bDynamicLight = false;
        }
    }
}

function ServerMeleeFire()
{
    Log(string(self) $ "[ServerMeleeFire ]");
    // End:0x61
    if(wMeleeFire(FireMode[2]) != none)
    {
        // End:0x4a
        if(MyOldWeapon != none)
        {
            MyOldWeapon.bDynamicLight = false;
        }
        wMeleeFire(FireMode[2]).DoFireEffect();
    }
}

defaultproperties
{
    szWeaponAttachmentName="WWeapons.wMeleeAttachment"
}