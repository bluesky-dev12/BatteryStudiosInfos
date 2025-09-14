class wTurretAttachmet extends wGunAttachment;

simulated function Vector GetTipLocation()
{
    local Coords C;

    // End:0x53
    if((wTurret_FNM240(Instigator) != none) && wTurret_FNM240(Instigator).TurretBase != none)
    {
        C = wTurret_FNM240(Instigator).TurretBase.GetBoneCoords('tip');
    }
    return C.Origin;
    //return;    
}

simulated function MakeMuzzleFlash()
{
    local Rotator R;

    // End:0x29
    if(PlayerController(Instigator.Controller) == Level.GetLocalPlayerController())
    {
        return;
    }
    // End:0xA1
    if(mMuzFlash3rd == none)
    {
        mMuzFlash3rd = Spawn(mMuzFlashClass);
        // End:0x4F
        if(mMuzFlash3rd == none)
        {
            return;
        }
        // End:0xA1
        if((wTurret_FNM240(Instigator) != none) && wTurret_FNM240(Instigator).TurretBase != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(mMuzFlash3rd, 'tip');
        }
    }
    mMuzFlash3rd.mStartParticles++;
    R.Roll = Rand(65536);
    SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
    //return;    
}

simulated function MakeSmoke()
{
    local Rotator R;

    // End:0x78
    if(mSmoke3rd == none)
    {
        mSmoke3rd = Spawn(mSmokeClass);
        // End:0x26
        if(mSmoke3rd == none)
        {
            return;
        }
        // End:0x78
        if((wTurret_FNM240(Instigator) != none) && wTurret_FNM240(Instigator).TurretBase != none)
        {
            wTurret_FNM240(Instigator).TurretBase.AttachToBone(mSmoke3rd, 'tip');
        }
    }
    mSmoke3rd.mStartParticles++;
    R.Roll = Rand(65536);
    SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
    //return;    
}
