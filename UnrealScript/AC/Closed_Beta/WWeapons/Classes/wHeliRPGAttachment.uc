class wHeliRPGAttachment extends wHeliProjectileAttachment;

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