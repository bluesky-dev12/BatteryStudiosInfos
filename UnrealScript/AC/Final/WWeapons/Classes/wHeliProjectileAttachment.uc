class wHeliProjectileAttachment extends wGunAttachment;

simulated function Coords GetBoneTipLocation3rd()
{
    return Instigator.GetBoneCoords(GetBoneNameTip());
    //return;    
}

simulated function SpawnEmitter(Class<Emitter> EmitterClass)
{
    // End:0x4C
    if(!Instigator.IsA('wFlyingDefenceBot'))
    {
        Spawn(EmitterClass, Instigator,, Instigator.GetBoneCoords(GetBoneNameTip()).Origin, Instigator.Rotation);
    }
    //return;    
}
