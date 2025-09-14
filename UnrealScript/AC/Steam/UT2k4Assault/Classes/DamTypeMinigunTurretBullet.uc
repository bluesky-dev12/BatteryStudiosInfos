/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\DamTypeMinigunTurretBullet.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class DamTypeMinigunTurretBullet extends VehicleDamageType
    abstract;

defaultproperties
{
    VehicleClass=class'ASTurret_Minigun'
    DeathString="%o => %k"
    FemaleSuicide="%o ?, ????? ???? ????"
    MaleSuicide="%o ?, ????? ???? ????"
    bRagdollBullet=true
    bBulletHit=true
    FlashFog=(X=600.0,Y=0.0,Z=0.0)
    KDamageImpulse=2000.0
    VehicleDamageScaling=0.750
}