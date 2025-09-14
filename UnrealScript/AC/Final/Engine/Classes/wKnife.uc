class wKnife extends wWeapon
    notplaceable;

simulated function wLoadOut(int iID, int iAddPartsID)
{
    super.wLoadOut(iID, iAddPartsID);
    //return;    
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    super.SetBaseParams(wBase);
    //return;    
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    // End:0x21
    if(int(bUseEkey) == 0)
    {
        super.BringUp(PrevWeapon);
        MyOldWeapon = none;
        return;
    }
    MyOldWeapon = PrevWeapon;
    // End:0x53
    if(int(bUseEkey) == 1)
    {
        FireMode[2].ModeDoFire();
        bUseEkey = 0;
    }
    //return;    
}

simulated event AnimEnd(int Channel)
{
    local int Mode;
    local bool bNoWeapon;

    // End:0x1E
    if(MyOldWeapon == none)
    {
        super.AnimEnd(Channel);
        PlayIdle();
        return;
    }
    OldWeapon = MyOldWeapon;
    // End:0x61
    if(OldWeapon == none)
    {
        OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(1);
        bNoWeapon = true;
    }
    // End:0x91
    if(OldWeapon == none)
    {
        OldWeapon = PlayerController(Instigator.Controller).GetWeaponByInventoryGroup(2);
    }
    // End:0xBE
    if(bNoWeapon == false)
    {
        OldWeapon.ClientState = 1;
        OldWeapon.GotoState('Hidden');
    }
    MeleeState = 0;
    Instigator.SwitchToLastWeapon();
    // End:0x14F
    if(bNoWeapon == false)
    {
        ClientState = 1;
        Instigator.ChangedWeapon();
        // End:0x11D
        if(Instigator.Weapon == self)
        {
            PlayIdle();
            ClientState = 4;            
        }
        else
        {
            Mode = 0;
            J0x124:

            // End:0x14F [Loop If]
            if(Mode < 3)
            {
                FireMode[Mode].DestroyEffects();
                Mode++;
                // [Loop Continue]
                goto J0x124;
            }
        }
    }
    //return;    
}

simulated function ForcePlayIdle()
{
    // End:0x11
    if(bSprint)
    {
        PlayIdle();
        return;
    }
    //return;    
}

function DropFrom(Vector StartLocation, Rotator StartRotation)
{
    return;
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
    local float fFrame, fRate, fAttackDelay;

    fAttackDelay = fMeleeDelay;
    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x40
    if(Instigator.IsA('wAIDefencePawn'))
    {
        fAttackDelay = 0.1000000;
    }
    // End:0x5D
    if(fFrame >= fAttackDelay)
    {
        ClientMeleeFire();
        bActiveMelee = false;
    }
    //return;    
}

simulated function ClientMeleeFire()
{
    Log(string(self) $ "[ClientKnifeFire ]");
    ServerMeleeFire();
    //return;    
}

function ServerMeleeFire()
{
    Log(string(self) $ "[ServerKnifeFire ]");
    wKnifeFire(FireMode[0]).DoFireEffect();
    //return;    
}

simulated function PlayIdle()
{
    // End:0x37
    if(Pawn(Owner).bIsDefencing == true)
    {
        LoopAnim(DefenceAnim, DefenceAnimRate, 0.2000000);
        MeleeState = 0;        
    }
    else
    {
        super.PlayIdle();
    }
    //return;    
}

defaultproperties
{
    szWeaponAttachmentName="WWeapons.wKnifeAttachment"
    szFireModeClass="Engine.wKnifeFire"
}