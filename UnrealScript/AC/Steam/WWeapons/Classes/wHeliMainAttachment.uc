/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wHeliMainAttachment.uc
 * Package Imports:
 *	WWeapons
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wHeliMainAttachment extends wHeliProjectileAttachment;

simulated function name GetBoneNameTip()
{
    return 'tip';
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_Flash';
}

defaultproperties
{
    AttachmentBone=Bone_Flash
}