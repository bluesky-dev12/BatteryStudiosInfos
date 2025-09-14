class wFlameFire_Alien extends wFlameFire;

simulated function bool AllowEffects()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        return false;
    }
    return true;
    //return;    
}

simulated function InitEffects()
{
    return;
    //return;    
}

function StartFiring()
{
    super.StartFiring();
    //return;    
}

function StopFiring()
{
    super.StopFiring();
    //return;    
}

defaultproperties
{
    ProjSpawnOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ProjectileClass=Class'WWeapons_Decompressed.wFlameProj_Alien'
}