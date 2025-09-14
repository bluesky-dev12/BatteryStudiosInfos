class wWeaponFireInstallPack extends wWeaponFire;

var byte byFirstTick;
var float m_fInstallingTime;
var float m_fInstallingElapsedTime;
var bool m_bInstalling;

simulated function wLoadOut()
{
    BaseParams = Weapon.BaseParams;
    ResParams = Weapon.ResParams;
    AmmoPerFire = 0;
    byFirstTick = 0;
    //return;    
}

simulated function bool AllowFire()
{
    return wTelegraphPack_Install(Weapon).IsCanUseWeapon();
    //return;    
}

event ModeDoFire()
{
    // End:0x0F
    if(1 == int(byFirstTick))
    {
        return;
    }
    super.ModeDoFire();
    byFirstTick = 1;
    m_fInstallingElapsedTime = 0.0000000;
    wTelegraphPack_Install(Weapon).PlayPlantAnimation();
    //return;    
}

function StopFiring()
{
    super.StopFiring();
    wTelegraphPack_Install(Weapon).StopPlantAnimation();
    //return;    
}

event ModeTick(float dt)
{
    // End:0x17
    if(false == Weapon.IsFiring())
    {
        return;
    }
    // End:0x26
    if(1 != int(byFirstTick))
    {
        return;
    }
    m_fInstallingElapsedTime += dt;
    // End:0x4C
    if(m_fInstallingElapsedTime > m_fInstallingTime)
    {
        m_fInstallingElapsedTime = m_fInstallingTime;
    }
    //return;    
}

function float GetInstallRate()
{
    return m_fInstallingElapsedTime / m_fInstallingTime;
    //return;    
}

defaultproperties
{
    m_fInstallingTime=1.5000000
}