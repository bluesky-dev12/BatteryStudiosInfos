class wSentryGunAttachment extends wGunAttachment;

simulated function name GetBoneNameRotation()
{
    return 'Bone_Axis';
    //return;    
}

defaultproperties
{
    AttachmentBone="Bone_weapon"
}