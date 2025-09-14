/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WWeapons\Classes\wHeliProjectileAttachment.uc
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
class wHeliProjectileAttachment extends wGunAttachment;

simulated function Coords GetBoneTipLocation3rd()
{
    return Instigator.GetBoneCoords(GetBoneNameTip());
}

simulated function SpawnEmitter(class<Emitter> EmitterClass)
{
    Spawn(EmitterClass, Instigator,, Instigator.GetBoneCoords(GetBoneNameTip()).Origin, Instigator.Rotation);
}
