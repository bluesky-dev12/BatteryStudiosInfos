/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wKnife.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:10
 *
 *******************************************************************************/
class wKnife extends wWeapon
    notplaceable;

simulated function wLoadOut(int iID, int iAddPartsID)
{
    super.wLoadOut(iID, iAddPartsID);
}

simulated function SetBaseParams(wWeaponBaseParams wBase)
{
    super.SetBaseParams(wBase);
}

simulated function BringUp(optional wWeapon PrevWeapon)
{
    super.BringUp(PrevWeapon);
}

simulated event AnimEnd(int Channel)
{
    super.AnimEnd(Channel);
    MeleeState = 0;
    PlayIdle();
}

simulated function ForcePlayIdle()
{
    // End:0x11
    if(bSprint)
    {
        PlayIdle();
        return;
    }
}

function DropFrom(Vector StartLocation, Rotator StartRotation)
{
    return;
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
    // End:0x33
    if(fFrame >= fMeleeDelay)
    {
        ClientMeleeFire();
        bActiveMelee = false;
    }
}

simulated function ClientMeleeFire()
{
    Log(string(self) $ "[ClientKnifeFire ]");
    ServerMeleeFire();
}

function ServerMeleeFire()
{
    Log(string(self) $ "[ServerKnifeFire ]");
    wKnifeFire(FireMode[0]).DoFireEffect();
}

defaultproperties
{
    szFireModeClass="Engine.wKnifeFire"
}