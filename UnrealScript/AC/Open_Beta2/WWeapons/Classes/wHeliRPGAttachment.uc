class wHeliRPGAttachment extends wHeliProjectileAttachment;

simulated event wLoadOut(int iID, int iAddPartsID)
{
    super(wGunAttachment).wLoadOut(iID, iAddPartsID);
    //return;    
}

simulated function name GetBoneNameTip()
{
    return 'tip2';
    //return;    
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_R_Missile';
    //return;    
}

defaultproperties
{
    AttachmentBone="Bone_R_Missile"
}