/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wHeliRPGAttachment.uc
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
class wHeliRPGAttachment extends wHeliProjectileAttachment;

simulated function name GetBoneNameTip()
{
    return 'tip2';
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_R_Missile';
}

defaultproperties
{
    AttachmentBone=Bone_R_Missile
}