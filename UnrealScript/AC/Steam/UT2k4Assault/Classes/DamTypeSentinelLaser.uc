/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\DamTypeSentinelLaser.uc
 * Package Imports:
 *	UT2k4Assault
 *	UnrealGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class DamTypeSentinelLaser extends VehicleDamageType
    abstract;

defaultproperties
{
    VehicleClass=class'ASVehicle_Sentinel'
    DeathString="%k ?? ??? ???? %o?? ??????"
    FemaleSuicide="%o ?? ??? ??? ??? ???????"
    MaleSuicide="%o ?? ??? ??? ??? ???????"
    bDelayedDamage=true
}