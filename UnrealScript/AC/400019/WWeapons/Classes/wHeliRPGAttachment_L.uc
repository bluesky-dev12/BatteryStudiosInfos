class wHeliRPGAttachment_L extends wHeliRPGAttachment;

simulated function name GetBoneNameTip()
{
    return 'tip3';
    //return;    
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_L_Missile';
    //return;    
}

defaultproperties
{
    AttachmentBone="Bone_L_Missile"
}