class wHeliMainAttachment extends wHeliProjectileAttachment;

simulated function name GetBoneNameTip()
{
    return 'tip';
    //return;    
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_Flash';
    //return;    
}

defaultproperties
{
    AttachmentBone="Bone_Flash"
}