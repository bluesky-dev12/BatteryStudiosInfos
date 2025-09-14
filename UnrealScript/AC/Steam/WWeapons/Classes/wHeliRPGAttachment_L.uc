/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wHeliRPGAttachment_L.uc
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
class wHeliRPGAttachment_L extends wHeliRPGAttachment;

simulated function name GetBoneNameTip()
{
    return 'tip3';
}

simulated function name GetBoneNameRotation()
{
    return 'Bone_L_Missile';
}

defaultproperties
{
    AttachmentBone=Bone_L_Missile
}