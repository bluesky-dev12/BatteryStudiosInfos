class wWeaponFireInstallPack extends wWeaponFire;

enum EINSTALL_STATE_TYPE
{
    EINSTALL_STATE_NONE,            // 0
    EINSTALL_STATE_INSTALLING,      // 1
    EINSTALL_STATE_COMPLETE         // 2
};

var wWeaponFireInstallPack.EINSTALL_STATE_TYPE m_eInstallState;
var byte byFirstTick;
var float m_fInstallingTime;
var float m_fInstallingElapsedTime;

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
    //return;    
}

function StopFiring()
{
    super.StopFiring();
    byFirstTick = 0;
    //return;    
}

event ModeTick(float dt)
{
    // End:0x12
    if(int(2) == int(m_eInstallState))
    {
        return;
    }
    // End:0x31
    if(false == Weapon.IsFiring())
    {
        m_eInstallState = 0;
        return;
    }
    m_eInstallState = 1;
    // End:0x6C
    if(1 == int(byFirstTick))
    {
        m_fInstallingElapsedTime += dt;
        // End:0x6C
        if(m_fInstallingElapsedTime > m_fInstallingTime)
        {
            m_fInstallingElapsedTime = m_fInstallingTime;
        }
    }
    //return;    
}

function float GetInstallRate()
{
    return m_fInstallingElapsedTime / m_fInstallingTime;
    //return;    
}

function bool IsInstalling()
{
    // End:0x12
    if(int(1) == int(m_eInstallState))
    {
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    m_fInstallingTime=6.0000000
    FireAnim="plant"
}