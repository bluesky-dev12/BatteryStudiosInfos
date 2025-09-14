/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\DamTypeIonVolume.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class DamTypeIonVolume extends DamageType
    abstract;

defaultproperties
{
    DeathString="%o ?? %k ?? ?? ???????"
    FemaleSuicide="%o ?? ???????"
    MaleSuicide="%o ?? ???????"
    bArmorStops=true
    bDetonatesGoop=true
    bSkeletize=true
    bSuperWeapon=true
    GibModifier=0.0
    DamageOverlayTime=1.0
}