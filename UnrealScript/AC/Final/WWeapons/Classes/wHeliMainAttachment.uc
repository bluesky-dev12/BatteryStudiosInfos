class wHeliMainAttachment extends wHeliProjectileAttachment;

simulated event wLoadOut(int iID, int iAddPartsID)
{
    super(wGunAttachment).wLoadOut(iID, iAddPartsID);
    //return;    
}

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