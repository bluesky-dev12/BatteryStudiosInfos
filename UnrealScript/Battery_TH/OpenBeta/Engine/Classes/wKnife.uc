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
    super.BringUp(PrevWeapon);
    //return;    
}

simulated event AnimEnd(int Channel)
{
    super.AnimEnd(Channel);
    MeleeState = 0;
    PlayIdle();
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
    local float fFrame, fRate;

    GetAnimParams(0, szAnim, fFrame, fRate);
    // End:0x33
    if(fFrame >= fMeleeDelay)
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

defaultproperties
{
    szFireModeClass="Engine.wKnifeFire"
}